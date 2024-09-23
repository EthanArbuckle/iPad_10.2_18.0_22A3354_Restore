@implementation PXMessagesStackView

- (PXMessagesStackView)initWithFrame:(CGRect)a3
{
  PXMessagesStackView *v3;
  PXMessagesStackView *v4;
  void *v5;
  void *v6;
  PXPhotosGridAssetDecorationSource *v7;
  PXPhotosGridAssetDecorationSource *assetDecorationSource;
  UITapGestureRecognizer *v9;
  UITapGestureRecognizer *tapGestureRecognizer;
  UITapGestureRecognizer *v11;
  PXLRUMemoryCache *v12;
  PXLRUMemoryCache *videoPresentationControllersByItem;
  PXMessagesStackPlaybackControlViewModel *v14;
  PXMessagesStackPlaybackControlViewModel *playbackControlViewModel;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PXMessagesStackView;
  v3 = -[PXBaseMessagesStackView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = v3;
  if (v3)
  {
    -[PXBaseMessagesStackView layout](v3, "layout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXBaseMessagesStackView tungstenView](v4, "tungstenView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(PXPhotosGridAssetDecorationSource);
    assetDecorationSource = v4->_assetDecorationSource;
    v4->_assetDecorationSource = v7;

    -[PXPhotosGridAssetDecorationSource setDecoratedLayout:](v4->_assetDecorationSource, "setDecoratedLayout:", v5);
    -[PXPhotosGridAssetDecorationSource setDurationAlwaysHidden:](v4->_assetDecorationSource, "setDurationAlwaysHidden:", 1);
    -[PXPhotosGridAssetDecorationSource setEnableSpatialBadges:](v4->_assetDecorationSource, "setEnableSpatialBadges:", 1);
    objc_msgSend(v5, "setDelegate:", v4);
    v9 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel__handleTap_);
    -[UITapGestureRecognizer setDelegate:](v9, "setDelegate:", v4);
    -[UITapGestureRecognizer setCancelsTouchesInView:](v9, "setCancelsTouchesInView:", 0);
    tapGestureRecognizer = v4->_tapGestureRecognizer;
    v4->_tapGestureRecognizer = v9;
    v11 = v9;

    objc_msgSend(v6, "addGestureRecognizer:", v11);
    v12 = objc_alloc_init(PXLRUMemoryCache);
    videoPresentationControllersByItem = v4->_videoPresentationControllersByItem;
    v4->_videoPresentationControllersByItem = v12;

    -[PXLRUMemoryCache setNumberOfSlots:](v4->_videoPresentationControllersByItem, "setNumberOfSlots:", (2 * objc_msgSend(v5, "stackedItemsCount")) | 1);
    v14 = objc_alloc_init(PXMessagesStackPlaybackControlViewModel);
    playbackControlViewModel = v4->_playbackControlViewModel;
    v4->_playbackControlViewModel = v14;

    v4->_additionalItemsCount = *($7D1650DB7441A0F5833AC641852B48F3 *)off_1E50B7F48;
  }
  return v4;
}

- (void)setMediaProvider:(id)a3
{
  PXUIMediaProvider *v5;

  v5 = (PXUIMediaProvider *)a3;
  if (self->_mediaProvider != v5)
  {
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    -[PXBaseMessagesStackView registerAllTextureProvidersWithMediaProvider:](self, "registerAllTextureProvidersWithMediaProvider:", v5);
  }

}

- (void)setTapbackStatusManager:(id)a3
{
  -[PXPhotosGridAssetDecorationSource setTapbackStatusManager:](self->_assetDecorationSource, "setTapbackStatusManager:", a3);
}

- (PXTapbackStatusManager)tapbackStatusManager
{
  return -[PXPhotosGridAssetDecorationSource tapbackStatusManager](self->_assetDecorationSource, "tapbackStatusManager");
}

- (BOOL)contentChangedForItemBeforeDataSource:(id)a3 beforeIndexPath:(PXSimpleIndexPath *)a4 afterDataSource:(id)a5 afterIndexPath:(PXSimpleIndexPath *)a6
{
  __int128 v8;
  id v9;
  void *v10;
  __int128 v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;

  v8 = *(_OWORD *)&a4->item;
  v19 = *(_OWORD *)&a4->dataSourceIdentifier;
  v20 = v8;
  v9 = a5;
  objc_msgSend(a3, "assetAtItemIndexPath:", &v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_OWORD *)&a6->item;
  v19 = *(_OWORD *)&a6->dataSourceIdentifier;
  v20 = v11;
  objc_msgSend(v9, "assetAtItemIndexPath:", &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v12;
  v14 = v10;
  v15 = v14;
  if (v13 == v14)
  {
    v16 = 0;
  }
  else
  {
    v16 = 1;
    if (v14 && v13)
    {
      v17 = objc_msgSend(v13, "isContentEqualTo:", v14);
      if (!v17)
        v17 = objc_msgSend(v15, "isContentEqualTo:", v13);
      v16 = v17 != 2;
    }
  }

  return v16;
}

- (void)currentDataSourceDidChange
{
  PXDisplayAssetFetchResult *cachedClampedFetchResult;
  PXMessagesStackPlaybackControlUserData *cachedPlaybackControlUserData;
  PXPhotosGridAssetDecorationSource *assetDecorationSource;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXMessagesStackView;
  -[PXBaseMessagesStackView currentDataSourceDidChange](&v7, sel_currentDataSourceDidChange);
  self->_cachedClampedItemRange = (_NSRange)xmmword_1A7C0C330;
  cachedClampedFetchResult = self->_cachedClampedFetchResult;
  self->_cachedClampedFetchResult = 0;

  cachedPlaybackControlUserData = self->_cachedPlaybackControlUserData;
  self->_cachedPlaybackControlUserData = 0;

  assetDecorationSource = self->_assetDecorationSource;
  -[PXBaseMessagesStackView currentDataSource](self, "currentDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGridAssetDecorationSource setDataSource:section:](assetDecorationSource, "setDataSource:section:", v6, 0);

  -[PXMessagesStackView _updateCurrentPresentationController](self, "_updateCurrentPresentationController");
}

- (void)settledDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMessagesStackView;
  -[PXBaseMessagesStackView settledDidChange](&v3, sel_settledDidChange);
  -[PXMessagesStackView _updateCurrentPresentationController](self, "_updateCurrentPresentationController");
}

- (void)primaryItemDidChange:(BOOL)a3 didChangeIndex:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a4;
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXMessagesStackView;
  -[PXBaseMessagesStackView primaryItemDidChange:didChangeIndex:](&v9, sel_primaryItemDidChange_didChangeIndex_);
  -[PXMessagesStackView _updateCurrentPresentationController](self, "_updateCurrentPresentationController");
  if (self->_delegateRespondsTo.didChangeCurrentAssetReference)
  {
    -[PXMessagesStackView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXMessagesStackView currentAssetReference](self, "currentAssetReference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stackView:didChangeCurrentAssetReference:isProgrammaticChange:didChangeIndex:", self, v8, v5, v4);

  }
}

- (void)willBeginScrolling
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMessagesStackView;
  -[PXBaseMessagesStackView willBeginScrolling](&v3, sel_willBeginScrolling);
  -[PXMessagesStackView removeTransitionSnapshotView](self, "removeTransitionSnapshotView");
}

- (void)setDelegate:(id)a3
{
  PXMessagesStackViewDelegate **p_delegate;
  id WeakRetained;
  id v6;
  $7FF06AA743CEF5C5647C81D51AA23221 *p_delegateRespondsTo;
  id v8;
  id v9;
  id v10;
  id obj;

  obj = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v6 = objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    self->_delegateRespondsTo.didSelectAssetReference = objc_opt_respondsToSelector() & 1;

    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    p_delegateRespondsTo->didChangeCurrentAssetReference = objc_opt_respondsToSelector() & 1;

    v9 = objc_loadWeakRetained((id *)p_delegate);
    p_delegateRespondsTo->shouldAutoplayAsset = objc_opt_respondsToSelector() & 1;

    v10 = objc_loadWeakRetained((id *)p_delegate);
    p_delegateRespondsTo->didSelectAdditionalItems = objc_opt_respondsToSelector() & 1;

  }
}

- (void)setAllowPlayableContentLoading:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_allowPlayableContentLoading != a3)
  {
    self->_allowPlayableContentLoading = a3;
    if (!a3)
      -[PXLRUMemoryCache removeAllObjects](self->_videoPresentationControllersByItem, "removeAllObjects");
    -[PXBaseMessagesStackView layout](self, "layout");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E50B1608, "changeDetailsWithChangedIndexRange:", 0, objc_msgSend(v5, "numberOfItems"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNumberOfItems:withChangeDetails:changeMediaVersionHandler:", objc_msgSend(v5, "numberOfItems"), v4, &__block_literal_global_294930);
    -[PXMessagesStackView _updateCurrentPresentationController](self, "_updateCurrentPresentationController");

  }
}

- (id)regionOfInterestForAssetReference:(id)a3
{
  return -[PXMessagesStackView _regionOfInterestForAssetReference:forTransitioning:](self, "_regionOfInterestForAssetReference:forTransitioning:", a3, 0);
}

- (id)_regionOfInterestForAssetReference:(id)a3 forTransitioning:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  NSObject *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PXBaseMessagesStackView tungstenView](self, "tungstenView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBaseMessagesStackView layout](self, "layout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  PXRegionOfInterestForAssetReference(v7, v8, v6, &v33, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PLUIGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v35 = v6;
    v36 = 2112;
    v37 = v33;
    _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "PXMessagesStackView regionOfInterestForAssetReference:%@ imageRef:%@", buf, 0x16u);
  }

  if (v33)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = 0;
  if (!v11 && !a4)
  {
    objc_msgSend(v7, "rootLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "spriteReferenceForObjectReference:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "spriteIndexForSpriteReference:options:", v14, 0);
    if ((_DWORD)v15 == -1)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(v7, "viewForSpriteIndex:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v16, "snapshotViewAfterScreenUpdates:", 0);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

  }
  if (v11 | v12)
  {
    v17 = v9;
    if (v11)
      goto LABEL_27;
  }
  else
  {
    -[PXMessagesStackView mediaProvider](self, "mediaProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PXRegionOfInterestForAssetReference(v7, v8, v6, &v33, v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    PLUIGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v35 = v6;
      v36 = 2112;
      v37 = v33;
      _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_DEFAULT, "PXMessagesStackView regionOfInterestForAssetReference:%@ with fallback imageRef:%@", buf, 0x16u);
    }

    if (v33)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
        goto LABEL_27;
    }
    else
    {
      v11 = 0;
    }
  }
  if (!v12 && v17)
  {
    objc_msgSend(v17, "rectInCoordinateSpace:", self);
    -[PXMessagesStackView resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:](self, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0);
    v12 = objc_claimAutoreleasedReturnValue();
  }
LABEL_27:
  v20 = MEMORY[0x1E0C809B0];
  if (v12)
  {
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __75__PXMessagesStackView__regionOfInterestForAssetReference_forTransitioning___block_invoke;
    v31[3] = &unk_1E51475B8;
    v32 = (id)v12;
    objc_msgSend(v17, "setPlaceholderViewFactory:", v31);

  }
  else if (v11)
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __75__PXMessagesStackView__regionOfInterestForAssetReference_forTransitioning___block_invoke_2;
    v29[3] = &unk_1E51475E0;
    v29[4] = self;
    v30 = (id)v11;
    objc_msgSend(v17, "setPlaceholderViewFactory:", v29);

  }
  objc_msgSend(v17, "placeholderViewFactory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_initWeak((id *)buf, self);
    v26[0] = v20;
    v26[1] = 3221225472;
    v26[2] = __75__PXMessagesStackView__regionOfInterestForAssetReference_forTransitioning___block_invoke_3;
    v26[3] = &unk_1E5147608;
    objc_copyWeak(&v28, (id *)buf);
    v27 = v6;
    objc_msgSend(v17, "setTrackingContainerViewFactory:", v26);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  if (v17)
  {
    objc_msgSend(v17, "placeholderViewFactory");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22 == 0;

    if (v23)
    {
      PXAssertGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A6789000, v24, OS_LOG_TYPE_ERROR, "Missing placeholderViewFactory", buf, 2u);
      }

    }
  }

  return v17;
}

- (id)_trackingContainerViewForAssetReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[PXBaseMessagesStackView tungstenView](self, "tungstenView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "spriteReferenceForObjectReference:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "spriteIndexForSpriteReference:options:", v7, 0);
  if ((_DWORD)v8 == -1)
  {
    v11 = 0;
  }
  else
  {
    v9 = v8;
    -[PXBaseMessagesStackView tungstenView](self, "tungstenView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trackingContainerViewForSpriteIndex:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (void)setHiddenAssetReferences:(id)a3
{
  -[PXMessagesStackView setHiddenAssetReferences:animationType:](self, "setHiddenAssetReferences:animationType:", a3, 0);
}

- (void)setHiddenAssetReferences:(id)a3 animationType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];

  v6 = a3;
  -[PXBaseMessagesStackView tungstenView](self, "tungstenView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rootLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hideSpritesForObjectReferences:", v6);

  if ((unint64_t)a4 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXPhotosGridHideAssetAnimationType _GridHideAssetAnimationType(PXMessagesStackHideAssetAnimationType)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXMessagesStackView.m"), 48, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PXBaseMessagesStackView tungstenView](self, "tungstenView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rootLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPhotosGridHideAssetAnimationHelper createDecorationAnimationsForLayout:animationType:](PXPhotosGridHideAssetAnimationHelper, "createDecorationAnimationsForLayout:animationType:", v10, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "count");
  if (a4 && !v12)
  {
    PLUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Failed to create animations for hiding/unhiding assets", v16, 2u);
    }

  }
}

- (id)installTransitionSnapshotViewForAssetReference:(id)a3 uncroppedImageFrame:(CGRect *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;

  -[PXMessagesStackView currentAssetReference](self, "currentAssetReference", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMessagesStackView regionOfInterestForAssetReference:](self, "regionOfInterestForAssetReference:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "placeholderViewFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "placeholderViewFactory");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v9)[2](v9, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXMessagesStackView addSubview:](self, "addSubview:", v8);
    -[PXMessagesStackView setTransitionPlaceholderView:](self, "setTransitionPlaceholderView:", v8);
  }
  if (a4)
  {
    objc_msgSend(v7, "uncroppedImageFrameInCoordinateSpace:", self);
    objc_msgSend(v8, "convertRect:fromView:", self);
    a4->origin.x = v10;
    a4->origin.y = v11;
    a4->size.width = v12;
    a4->size.height = v13;
  }

  return v8;
}

- (void)removeTransitionSnapshotView
{
  -[PXMessagesStackView setTransitionPlaceholderView:](self, "setTransitionPlaceholderView:", 0);
}

- (void)setAdditionalItemsCount:(id)a3
{
  unint64_t var0;
  PXMessagesStackAdditionalItemsViewUserData *cachedAdditionalItemsUserData;

  if (self->_additionalItemsCount.count != a3.var0 || self->_additionalItemsCount.type != a3.var1)
  {
    var0 = a3.var0;
    self->_additionalItemsCount = ($7D1650DB7441A0F5833AC641852B48F3)a3;
    cachedAdditionalItemsUserData = self->_cachedAdditionalItemsUserData;
    self->_cachedAdditionalItemsUserData = 0;

    -[PXBaseMessagesStackView setNumberOfAccessoryItems:](self, "setNumberOfAccessoryItems:", var0 != 0);
  }
}

- (void)prepareForDisplay
{
  PXMessagesStackActivityIndicatorViewUserData *activityIndicatorViewUserData;
  void *v4;
  objc_super v5;

  activityIndicatorViewUserData = self->_activityIndicatorViewUserData;
  self->_activityIndicatorViewUserData = 0;

  -[PXBaseMessagesStackView layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateDecoration");

  v5.receiver = self;
  v5.super_class = (Class)PXMessagesStackView;
  -[PXBaseMessagesStackView prepareForDisplay](&v5, sel_prepareForDisplay);
}

- (void)_handleTap:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "state") != 3)
    goto LABEL_38;
  -[PXBaseMessagesStackView tungstenView](self, "tungstenView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[PXBaseMessagesStackView layout](self, "layout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBaseMessagesStackView tungstenView](self, "tungstenView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hitTestResultsAtPoint:", v7, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (!v14)
    goto LABEL_25;
  v15 = v14;
  v16 = *(_QWORD *)v52;
  v49 = v10;
  v50 = v4;
  while (2)
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v52 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
      objc_msgSend(v18, "identifier", v49);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("PXGHitTestUserDataIdentifierItem"));

      if (v20)
      {
        objc_msgSend(v18, "spriteReference");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "spriteReference");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[PXMessagesStackView _isSpriteReferenceForPrimaryItem:](self, "_isSpriteReferenceForPrimaryItem:", v29);

        -[PXBaseMessagesStackView layout](self, "layout");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "spriteIndexForSpriteReference:", v28);

        -[PXBaseMessagesStackView layout](self, "layout");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "itemForSpriteIndex:", v32);

        if (v30)
        {
          v10 = v49;
          v4 = v50;
          if (!self->_delegateRespondsTo.didSelectAssetReference)
            goto LABEL_37;
          objc_msgSend(v49, "objectReferenceForItem:", objc_msgSend(v49, "primaryItemIndex"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXMessagesStackView delegate](self, "delegate");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "stackView:didSelectAssetReference:", self, v35);

LABEL_23:
          goto LABEL_37;
        }
        v10 = v49;
        v4 = v50;
LABEL_27:
        if (v34 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v43 = objc_msgSend(v10, "primaryItemIndex");
          v44 = v43;
          if (v34 >= v43)
          {
            v47 = v43 + 1;
            v48 = objc_msgSend(v10, "numberOfItems");
            if (v47 < v48 - 1)
              v46 = v44 + 1;
            else
              v46 = v48 - 1;
          }
          else
          {
            if (v43 <= 1)
              v45 = 1;
            else
              v45 = v43;
            v46 = v45 - 1;
          }
          -[PXBaseMessagesStackView scrollToIndex:animated:](self, "scrollToIndex:animated:", v46, 1);
        }
        goto LABEL_37;
      }
      objc_msgSend(v18, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("PXGHitTestUserDataIdentifierDecorationView"));

      if (!v22)
      {
        objc_msgSend(v18, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("PXGHitTestUserDataIdentifierAccessoryItem"));

        if ((v27 & 1) == 0)
          continue;
        objc_msgSend(v18, "spriteReference");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "spriteReference");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = -[PXMessagesStackView _isSpriteReferenceForPrimaryItem:](self, "_isSpriteReferenceForPrimaryItem:", v38);

        v10 = v49;
        v40 = objc_msgSend(v49, "spriteIndexForSpriteReference:", v37);
        v41 = objc_msgSend(v49, "numberOfItems");
        v42 = objc_msgSend(v49, "accessoryItemForSpriteIndex:", v40);

        if (v39)
        {
          v4 = v50;
          if (!self->_delegateRespondsTo.didSelectAdditionalItems)
            goto LABEL_37;
          -[PXMessagesStackView delegate](self, "delegate");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "stackViewDidSelectAdditionalItemsCard:", self);
          goto LABEL_23;
        }
        v34 = v42 + v41;
        v4 = v50;
        goto LABEL_27;
      }
      objc_msgSend(v18, "spriteReference");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXBaseMessagesStackView tungstenView](self, "tungstenView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "viewForSpriteReference:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(v50, "locationInView:", v25);
        if ((objc_msgSend(v25, "handleTapAtPoint:") & 1) != 0)
        {

          v10 = v49;
          v4 = v50;
          goto LABEL_25;
        }
      }

    }
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    v10 = v49;
    v4 = v50;
    if (v15)
      continue;
    break;
  }
LABEL_25:

LABEL_37:
LABEL_38:

}

- (BOOL)_isSpriteReferenceForPrimaryItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  int v9;
  int v10;

  v4 = a3;
  -[PXBaseMessagesStackView layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "primaryItemIndex");
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    v8 = v6;
    v9 = objc_msgSend(v5, "spriteIndexForSpriteReference:", v4);
    if (objc_msgSend(v5, "numberOfItems") <= v8)
      v10 = objc_msgSend(v5, "spriteIndexForAccessoryItem:", v8 - objc_msgSend(v5, "numberOfItems"));
    else
      v10 = objc_msgSend(v5, "spriteIndexForItem:", v8);
    v7 = v9 == v10;
  }

  return v7;
}

- (void)setCurrentVideoPresentationController:(id)a3
{
  PXGDisplayAssetVideoPresentationController *v5;
  PXGDisplayAssetVideoPresentationController **p_currentVideoPresentationController;
  PXGDisplayAssetVideoPresentationController *v7;

  v5 = (PXGDisplayAssetVideoPresentationController *)a3;
  p_currentVideoPresentationController = &self->_currentVideoPresentationController;
  if (*p_currentVideoPresentationController != v5)
  {
    v7 = v5;
    -[PXGDisplayAssetVideoPresentationController performChanges:](*p_currentVideoPresentationController, "performChanges:", &__block_literal_global_30_294915);
    objc_storeStrong((id *)p_currentVideoPresentationController, a3);
    v5 = v7;
  }

}

- (BOOL)_shouldAutoplayAsset:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "playbackStyle") == 5 && self->_delegateRespondsTo.shouldAutoplayAsset)
  {
    -[PXMessagesStackView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "stackView:shouldAutoplayAsset:", self, v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_updateCurrentPresentationController
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PXMessagesStackPlaybackControlViewModel *playbackControlViewModel;
  _QWORD v13[6];
  BOOL v14;
  _QWORD v15[4];

  v3 = -[PXBaseMessagesStackView isSettled](self, "isSettled");
  -[PXBaseMessagesStackView layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "primaryItemIndex");

  -[PXBaseMessagesStackView layout](self, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 >= objc_msgSend(v6, "numberOfItems"))
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v7 = v5;

  if (v3)
  {
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = 0;
    }
    else
    {
      -[PXBaseMessagesStackView currentDataSource](self, "currentDataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXBaseMessagesStackView currentDataSource](self, "currentDataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = objc_msgSend(v10, "identifier");
      v15[1] = 0;
      v15[2] = v7;
      v15[3] = 0x7FFFFFFFFFFFFFFFLL;
      objc_msgSend(v9, "assetAtItemIndexPath:", v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[PXMessagesStackView _presentationControllerForAsset:](self, "_presentationControllerForAsset:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXMessagesStackView setCurrentVideoPresentationController:](self, "setCurrentVideoPresentationController:", v11);
    if (v11 && -[PXMessagesStackView _shouldAutoplayAsset:](self, "_shouldAutoplayAsset:", v8))
      objc_msgSend(v11, "performChanges:", &__block_literal_global_31_294913);

  }
  else
  {
    -[PXMessagesStackView setCurrentVideoPresentationController:](self, "setCurrentVideoPresentationController:", 0);
  }
  playbackControlViewModel = self->_playbackControlViewModel;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__PXMessagesStackView__updateCurrentPresentationController__block_invoke_2;
  v13[3] = &unk_1E51476A8;
  v14 = v3;
  v13[4] = self;
  v13[5] = v7;
  -[PXMessagesStackPlaybackControlViewModel performChanges:](playbackControlViewModel, "performChanges:", v13);
}

- (id)_presentationControllerForAsset:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  PXGDisplayAssetVideoPresentationController *v8;
  void *v9;
  PXGDisplayAssetVideoPresentationController *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  BOOL v15;

  v4 = a3;
  if (-[PXMessagesStackView allowPlayableContentLoading](self, "allowPlayableContentLoading")
    && ((v5 = objc_msgSend(v4, "playbackStyle"), v6 = objc_msgSend(v4, "playbackStyle"), v7 = v6 == 5, v5 == 4)
     || v6 == 5))
  {
    objc_msgSend(v4, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXLRUMemoryCache objectForKeyedSubscript:](self->_videoPresentationControllersByItem, "objectForKeyedSubscript:", v9);
    v8 = (PXGDisplayAssetVideoPresentationController *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v10 = [PXGDisplayAssetVideoPresentationController alloc];
      -[PXBaseMessagesStackView layout](self, "layout");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "layoutQueue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PXGDisplayAssetVideoPresentationController initWithDisplayAsset:accessQueue:](v10, "initWithDisplayAsset:accessQueue:", v4, v12);

      -[PXLRUMemoryCache setObject:forKeyedSubscript:](self->_videoPresentationControllersByItem, "setObject:forKeyedSubscript:", v8, v9);
    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__PXMessagesStackView__presentationControllerForAsset___block_invoke;
    v14[3] = &__block_descriptor_33_e61_v16__0___PXGMutableDisplayAssetVideoPresentationController__8l;
    v15 = v7;
    -[PXGDisplayAssetVideoPresentationController performChanges:](v8, "performChanges:", v14);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setTransitionPlaceholderView:(id)a3
{
  UIView *v5;
  UIView **p_transitionPlaceholderView;
  UIView *v7;

  v5 = (UIView *)a3;
  p_transitionPlaceholderView = &self->_transitionPlaceholderView;
  if (*p_transitionPlaceholderView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](*p_transitionPlaceholderView, "removeFromSuperview");
    objc_storeStrong((id *)p_transitionPlaceholderView, a3);
    v5 = v7;
  }

}

- (BOOL)stackItemsLayout:(id)a3 itemHasTapback:(int64_t)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;

  v6 = a3;
  v7 = objc_msgSend(v6, "spriteIndexForItem:", a4);
  v8 = (_DWORD)v7 != -1
    && -[PXMessagesStackView hasTapbacksForSpriteIndex:inLayout:](self, "hasTapbacksForSpriteIndex:inLayout:", v7, v6);

  return v8;
}

- (int64_t)itemsLayout:(id)a3 itemForObjectReference:(id)a4 options:(unint64_t)a5
{
  char v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;

  v5 = a5;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;
  if (v10)
  {
    v11 = v10;
    -[PXBaseMessagesStackView currentDataSource](self, "currentDataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v8;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v12, "objectReferenceNearestToObjectReference:inSection:", v11, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "px_descriptionForAssertionMessage");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMessagesStackView.m"), 499, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[dataSource objectReferenceNearestToObjectReference:assetReference inSection:0]"), v18, v19);

        }
      }

    }
    if (v13)
      objc_msgSend(v13, "indexPathForAssetReference:", v14);

  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)itemsLayout:(id)a3 objectReferenceForItem:(int64_t)a4
{
  void *v5;
  void *v6;
  _QWORD v8[4];

  -[PXBaseMessagesStackView currentDataSource](self, "currentDataSource", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = objc_msgSend(v5, "identifier");
  v8[1] = 0;
  v8[2] = a4;
  v8[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v5, "assetReferenceAtItemIndexPath:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)itemsLayout:(id)a3 aspectRatioForItem:(int64_t)a4
{
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  _QWORD v12[4];

  v6 = 0.75;
  if (-[PXBaseMessagesStackView useAspectTiles](self, "useAspectTiles", a3))
  {
    -[PXBaseMessagesStackView currentDataSource](self, "currentDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = objc_msgSend(v7, "identifier");
    v12[1] = 0;
    v12[2] = a4;
    v12[3] = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v7, "assetAtItemIndexPath:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "aspectRatio");
    v10 = 1.0;
    if (v9 < 0.99)
      v10 = 0.75;
    if (v9 <= 1.01)
      v6 = v10;
    else
      v6 = 1.33333333;

  }
  return v6;
}

- (CGRect)itemsLayout:(id)a3 bestCropRectForItem:(int64_t)a4 withAspectRatio:(double)a5
{
  void *v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _QWORD v25[4];
  CGRect result;

  -[PXBaseMessagesStackView currentDataSource](self, "currentDataSource", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = objc_msgSend(v7, "identifier");
  v25[1] = 0;
  v25[2] = a4;
  v25[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v7, "assetAtItemIndexPath:", v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXMessagesUISettings sharedInstance](PXMessagesUISettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "bestCropRectEnabled");

  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "bestCropRectForAspectRatioV2:verticalContentMode:cropMode:", 0, 2, a5);
LABEL_7:
    v15 = v11;
    v16 = v12;
    v17 = v13;
    v18 = v14;
    goto LABEL_8;
  }
  v15 = *(double *)off_1E50B86D0;
  v16 = *((double *)off_1E50B86D0 + 1);
  v17 = *((double *)off_1E50B86D0 + 2);
  v18 = *((double *)off_1E50B86D0 + 3);
  v19 = objc_msgSend(v8, "pixelWidth");
  v20 = objc_msgSend(v8, "pixelHeight");
  if (v19 && v20)
  {
    PXRectWithAspectRatioFittingRect();
    PXRectNormalize();
    goto LABEL_7;
  }
LABEL_8:

  v21 = v15;
  v22 = v16;
  v23 = v17;
  v24 = v18;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (unint64_t)supportedDisplayAssetPresentationStylesInLayout:(id)a3
{
  return 3;
}

- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3
{
  return 1;
}

- (CGSize)minSpriteSizeForPresentationStyle:(unint64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4
{
  void *v5;
  NSUInteger v6;
  void *v7;
  NSUInteger v8;
  PXDisplayAssetFetchResult *cachedClampedFetchResult;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  -[PXBaseMessagesStackView layout](self, "layout", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "itemForSpriteIndex:", 0);

  -[PXBaseMessagesStackView layout](self, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfItems") - v6;

  if (self->_cachedClampedItemRange.location == v6 && self->_cachedClampedItemRange.length == v8)
  {
    cachedClampedFetchResult = self->_cachedClampedFetchResult;
    if (cachedClampedFetchResult)
      return cachedClampedFetchResult;
  }
  -[PXBaseMessagesStackView currentDataSource](self, "currentDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "identifier");
  v16 = xmmword_1A7C0C1F0;
  v17 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v12, "assetsInSectionIndexPath:", &v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PXDisplayAssetFetchResultSubfetchResultWithRange();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_cachedClampedFetchResult, v14);
  self->_cachedClampedItemRange.location = v6;
  self->_cachedClampedItemRange.length = v8;

  return v14;
}

- (BOOL)wantsAssetBadgeDecorationsInLayout:(id)a3
{
  return 1;
}

- (BOOL)wantsInteractiveFavoriteBadgesInLayout:(id)a3
{
  return 0;
}

- (BOOL)wantsFileSizeBadgesInLayout:(id)a3
{
  return 0;
}

- (PXGAssetDecorationInfo)assetDecorationInfoForAsset:(SEL)a3 atSpriteIndex:(id)a4 inLayout:(unsigned int)a5
{
  PXGAssetDecorationInfo *result;

  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  result = (PXGAssetDecorationInfo *)self->_assetDecorationSource;
  if (result)
    return (PXGAssetDecorationInfo *)-[PXGAssetDecorationInfo assetDecorationInfoForAsset:atSpriteIndex:inLayout:](result, "assetDecorationInfoForAsset:atSpriteIndex:inLayout:", a4, *(_QWORD *)&a5, a6);
  return result;
}

- (BOOL)wantsTapbackDecorationInLayout:(id)a3
{
  return -[PXPhotosGridAssetDecorationSource wantsTapbackDecorationInLayout:](self->_assetDecorationSource, "wantsTapbackDecorationInLayout:", a3);
}

- (BOOL)hasTapbacksForSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  return -[PXPhotosGridAssetDecorationSource hasTapbacksForSpriteIndex:inLayout:](self->_assetDecorationSource, "hasTapbacksForSpriteIndex:inLayout:", *(_QWORD *)&a3, a4);
}

- ($9C403407A5B624E1CD2E2AFE16A3B680)tapbackConfigurationForProposedConfiguration:(SEL)a3 spriteIndex:(id *)a4 inLayout:(unsigned int)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  $9C403407A5B624E1CD2E2AFE16A3B680 *result;

  v11 = v9;
  v12 = v8;
  v13 = v7;
  v14 = v6;
  -[PXBaseMessagesStackView layout](self, "layout", a4, *(_QWORD *)&a5, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tapbackConfigurationForProposedConfiguration:spriteIndex:", a4, v14, v13, v12, v11);

  return result;
}

- (int64_t)selectionDecorationStyleInLayout:(id)a3
{
  return 0;
}

- (unint64_t)selectionDecorationAdditionsInLayout:(id)a3
{
  return 0;
}

- (id)selectedSpriteIndexesInLayout:(id)a3
{
  return 0;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)overlayInsetsForSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  float v4;
  float v5;
  float v6;
  float v7;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  v4 = *(float *)off_1E50B8290;
  v5 = *((float *)off_1E50B8290 + 1);
  v6 = *((float *)off_1E50B8290 + 2);
  v7 = *((float *)off_1E50B8290 + 3);
  result.var3 = v7;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (int64_t)overallSelectionOrderAtSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inDecoratingLayout:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (objc_msgSend(v6, "decoratingTypeForSpriteIndex:", v4) != 3)
  {
    -[PXPhotosGridAssetDecorationSource viewClassForSpriteAtIndex:inLayout:](self->_assetDecorationSource, "viewClassForSpriteAtIndex:inLayout:", v4, v6);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[PXBaseMessagesStackView layout](self, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _StackItemIndexForSpriteIndexInLayout(v4, v6, v7);

  if (v8 < 0)
  {
LABEL_12:
    v10 = 0;
    goto LABEL_13;
  }
  if (v8 || !-[PXMessagesStackView providesLoadingAppearanceAndBehavior](self, "providesLoadingAppearanceAndBehavior"))
  {
    if (-[PXMessagesStackView allowPlayableContentLoading](self, "allowPlayableContentLoading"))
    {
      -[PXBaseMessagesStackView currentDataSource](self, "currentDataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXBaseMessagesStackView currentDataSource](self, "currentDataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = objc_msgSend(v12, "identifier");
      v15[1] = 0;
      v15[2] = v8;
      v15[3] = 0x7FFFFFFFFFFFFFFFLL;
      objc_msgSend(v11, "assetAtItemIndexPath:", v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "playbackStyle") == 4)
      {
        objc_opt_class();
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_13;
      }

    }
    goto LABEL_12;
  }
  objc_opt_class();
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v10 = (void *)v9;
LABEL_13:

  return (Class)v10;
}

- (Class)viewClassForAccessoryItemAtIndex:(int64_t)a3
{
  return (Class)objc_opt_class();
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inDecoratingLayout:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *activityIndicatorViewUserData;
  PXMessagesStackActivityIndicatorViewUserData *v10;
  PXMessagesStackActivityIndicatorViewUserData *v11;
  id v12;
  PXMessagesStackPlaybackControlUserData *cachedPlaybackControlUserData;
  PXMessagesStackPlaybackControlUserData *v14;
  PXMessagesStackPlaybackControlUserData *v15;
  void *v16;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (objc_msgSend(v6, "decoratingTypeForSpriteIndex:", v4) == 3)
  {
    -[PXBaseMessagesStackView layout](self, "layout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = _StackItemIndexForSpriteIndexInLayout(v4, v6, v7);

    if (v8 < 0)
    {
      v16 = 0;
      goto LABEL_14;
    }
    if (v8
      || !-[PXMessagesStackView providesLoadingAppearanceAndBehavior](self, "providesLoadingAppearanceAndBehavior"))
    {
      cachedPlaybackControlUserData = self->_cachedPlaybackControlUserData;
      if (!cachedPlaybackControlUserData
        || -[PXMessagesStackPlaybackControlUserData itemIndex](cachedPlaybackControlUserData, "itemIndex") != v8)
      {
        v14 = -[PXMessagesStackPlaybackControlUserData initWithItemIndex:viewModel:]([PXMessagesStackPlaybackControlUserData alloc], "initWithItemIndex:viewModel:", v8, self->_playbackControlViewModel);
        v15 = self->_cachedPlaybackControlUserData;
        self->_cachedPlaybackControlUserData = v14;

      }
      activityIndicatorViewUserData = self->_cachedPlaybackControlUserData;
    }
    else
    {
      activityIndicatorViewUserData = self->_activityIndicatorViewUserData;
      if (!activityIndicatorViewUserData)
      {
        v10 = objc_alloc_init(PXMessagesStackActivityIndicatorViewUserData);
        v11 = self->_activityIndicatorViewUserData;
        self->_activityIndicatorViewUserData = v10;

        activityIndicatorViewUserData = self->_activityIndicatorViewUserData;
      }
    }
    v12 = activityIndicatorViewUserData;
  }
  else
  {
    -[PXPhotosGridAssetDecorationSource viewUserDataForSpriteAtIndex:inLayout:](self->_assetDecorationSource, "viewUserDataForSpriteAtIndex:inLayout:", v4, v6);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v12;
LABEL_14:

  return v16;
}

- (id)viewUserDataForAccessoryItemAtIndex:(int64_t)a3
{
  PXMessagesStackAdditionalItemsViewUserData *cachedAdditionalItemsUserData;
  PXMessagesStackAdditionalItemsViewUserData *v5;
  uint64_t v6;
  uint64_t v7;
  PXMessagesStackAdditionalItemsViewUserData *v8;
  PXMessagesStackAdditionalItemsViewUserData *v9;

  cachedAdditionalItemsUserData = self->_cachedAdditionalItemsUserData;
  if (!cachedAdditionalItemsUserData)
  {
    v5 = [PXMessagesStackAdditionalItemsViewUserData alloc];
    v6 = -[PXMessagesStackView additionalItemsCount](self, "additionalItemsCount");
    v8 = -[PXMessagesStackAdditionalItemsViewUserData initWithAdditionalItemsCount:](v5, "initWithAdditionalItemsCount:", v6, v7);
    v9 = self->_cachedAdditionalItemsUserData;
    self->_cachedAdditionalItemsUserData = v8;

    cachedAdditionalItemsUserData = self->_cachedAdditionalItemsUserData;
  }
  return cachedAdditionalItemsUserData;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  void *v6;
  PXMessagesStackView *v7;
  void *v8;
  PXMessagesStackView *v9;
  PXMessagesStackView *v10;

  v4 = a3;
  -[PXMessagesStackView tapGestureRecognizer](self, "tapGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v7 = self;
    -[PXBaseMessagesStackView tungstenView](v7, "tungstenView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scrollView");
    v9 = (PXMessagesStackView *)(id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "locationInView:", v7);
    -[PXMessagesStackView hitTest:withEvent:](v7, "hitTest:withEvent:", 0);
    v10 = (PXMessagesStackView *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v6) = 1;
    if (v10 != v7 && v10 != v9)
      LODWORD(v6) = -[PXMessagesStackView isUserInteractionEnabled](v10, "isUserInteractionEnabled") ^ 1;

  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return (char)v6;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return -[PXMessagesStackPresentationAnimationController initWithStackView:]([PXMessagesStackPresentationAnimationController alloc], "initWithStackView:", self);
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  PXMessagesStackDismissalAnimationController *v5;

  v4 = a3;
  v5 = -[PXMessagesStackDismissalAnimationController initWithStackView:dismissingViewController:]([PXMessagesStackDismissalAnimationController alloc], "initWithStackView:dismissingViewController:", self, v4);

  return v5;
}

- (id)interactionControllerForDismissal:(id)a3
{
  return (id)objc_msgSend(a3, "interactionController");
}

- (id)regionOfInterestForTransitioningAssetReference:(id)a3
{
  return -[PXMessagesStackView _regionOfInterestForAssetReference:forTransitioning:](self, "_regionOfInterestForAssetReference:forTransitioning:", a3, 1);
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXMessagesStackViewDelegate)delegate
{
  return (PXMessagesStackViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSSet)hiddenAssetReferences
{
  return self->_hiddenAssetReferences;
}

- (BOOL)allowPlayableContentLoading
{
  return self->_allowPlayableContentLoading;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (BOOL)providesLoadingAppearanceAndBehavior
{
  return self->_providesLoadingAppearanceAndBehavior;
}

- (void)setProvidesLoadingAppearanceAndBehavior:(BOOL)a3
{
  self->_providesLoadingAppearanceAndBehavior = a3;
}

- ($DE30A600513D762F9B6AB73D2AED4B95)additionalItemsCount
{
  $7D1650DB7441A0F5833AC641852B48F3 *p_additionalItemsCount;
  unint64_t count;
  int64_t type;
  $DE30A600513D762F9B6AB73D2AED4B95 result;

  p_additionalItemsCount = &self->_additionalItemsCount;
  count = self->_additionalItemsCount.count;
  type = p_additionalItemsCount->type;
  result.var1 = type;
  result.var0 = count;
  return result;
}

- (PXGDisplayAssetVideoPresentationController)currentVideoPresentationController
{
  return self->_currentVideoPresentationController;
}

- (UIView)transitionPlaceholderView
{
  return self->_transitionPlaceholderView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionPlaceholderView, 0);
  objc_storeStrong((id *)&self->_currentVideoPresentationController, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_hiddenAssetReferences, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_activityIndicatorViewUserData, 0);
  objc_storeStrong((id *)&self->_cachedAdditionalItemsUserData, 0);
  objc_storeStrong((id *)&self->_assetDecorationSource, 0);
  objc_storeStrong((id *)&self->_playbackControlViewModel, 0);
  objc_storeStrong((id *)&self->_cachedPlaybackControlUserData, 0);
  objc_storeStrong((id *)&self->_videoPresentationControllersByItem, 0);
  objc_storeStrong((id *)&self->_cachedClampedFetchResult, 0);
}

void __55__PXMessagesStackView__presentationControllerForAsset___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setIsLoopingEnabled:", v3);
  objc_msgSend(v4, "setResetsDesiredPlayStateOnHide:", *(_BYTE *)(a1 + 32) == 0);

}

void __59__PXMessagesStackView__updateCurrentPresentationController__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(unsigned __int8 *)(a1 + 48);
  v4 = a2;
  objc_msgSend(v4, "setSettled:", v3);
  objc_msgSend(v4, "setCurrentItem:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "currentVideoPresentationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVideoController:", v5);

}

uint64_t __59__PXMessagesStackView__updateCurrentPresentationController__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDesiredPlayState:", 1);
}

uint64_t __61__PXMessagesStackView_setCurrentVideoPresentationController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDesiredPlayState:", 0);
}

id __75__PXMessagesStackView__regionOfInterestForAssetReference_forTransitioning___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __75__PXMessagesStackView__regionOfInterestForAssetReference_forTransitioning___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "rectInCoordinateSpace:", v3);
  PXPreviewImageViewForImage(*(void **)(a1 + 40), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setContentMode:", 2);
  return v9;
}

id __75__PXMessagesStackView__regionOfInterestForAssetReference_forTransitioning___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_trackingContainerViewForAssetReference:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __54__PXMessagesStackView_setAllowPlayableContentLoading___block_invoke()
{
  return 1;
}

+ (unsigned)itemMediaKind
{
  return 2;
}

+ (unsigned)accessoryMediaKind
{
  return 10;
}

@end
