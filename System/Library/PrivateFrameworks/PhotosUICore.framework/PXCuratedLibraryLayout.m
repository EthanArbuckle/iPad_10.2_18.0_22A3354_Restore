@implementation PXCuratedLibraryLayout

uint64_t __47__PXCuratedLibraryLayout__updateStatusBarStyle__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWantsDarkStatusBar:", *(_BYTE *)(a1 + 32) == 0);
}

uint64_t __44__PXCuratedLibraryLayout_initWithViewModel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addPresenter:", *(_QWORD *)(a1 + 32));
}

- (id)axSpriteIndexes
{
  return objc_alloc_init(MEMORY[0x1E0CB36B8]);
}

- (void)update
{
  void *v3;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  unint64_t needsUpdate;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  objc_super v58;

  self->_isPerformingUpdate = 1;
  -[PXCuratedLibraryLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  if (self->_updateFlags.needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout update]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("PXCuratedLibraryLayout.m"), 218, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

    }
    self->_updateFlags.isPerformingUpdate = 1;
    self->_updateFlags.updated = 0;
    -[PXGLayout createAnchorForVisibleArea](self, "createAnchorForVisibleArea");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "autoInvalidate");

    v7 = objc_msgSend(v3, "zoomLevel");
    if ((p_updateFlags->needsUpdate & 0x11) != 0)
      v8 = -[PXGLayout createCuratedLibraryLayoutZoomLevelChangeAnimationFromZoomLevel:toZoomLevel:withContext:](self, "createCuratedLibraryLayoutZoomLevelChangeAnimationFromZoomLevel:toZoomLevel:withContext:", self->_presentedZoomLevel, v7, -[PXCuratedLibraryLayout curatedLibraryLayoutAnimationContextForTransitionToZoomLevel:](self, "curatedLibraryLayoutAnimationContextForTransitionToZoomLevel:", v7));
    if (!self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout update]");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("PXCuratedLibraryLayout.m"), 230, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    needsUpdate = p_updateFlags->needsUpdate;
    self->_updateFlags.updated |= 2uLL;
    if ((needsUpdate & 2) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFDLL;
      -[PXCuratedLibraryLayout _updateSpecValue](self, "_updateSpecValue");
    }
    if (!self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout update]");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("PXCuratedLibraryLayout.m"), 234, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v10 = p_updateFlags->needsUpdate;
    self->_updateFlags.updated |= 8uLL;
    if ((v10 & 8) != 0)
    {
      p_updateFlags->needsUpdate = v10 & 0xFFFFFFFFFFFFFFF7;
      -[PXCuratedLibraryLayout _updateLocalSprites](self, "_updateLocalSprites");
    }
    if (!self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout update]");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("PXCuratedLibraryLayout.m"), 238, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v11 = p_updateFlags->needsUpdate;
    self->_updateFlags.updated |= 1uLL;
    if ((v11 & 1) != 0)
    {
      p_updateFlags->needsUpdate = v11 & 0xFFFFFFFFFFFFFFFELL;
      -[PXCuratedLibraryLayout _updateZoomLevel](self, "_updateZoomLevel");
    }
    if (!self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout update]");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("PXCuratedLibraryLayout.m"), 242, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v12 = p_updateFlags->needsUpdate;
    self->_updateFlags.updated |= 0x40uLL;
    if ((v12 & 0x40) != 0)
    {
      p_updateFlags->needsUpdate = v12 & 0xFFFFFFFFFFFFFFBFLL;
      -[PXCuratedLibraryLayout _updateAllPhotosOverlayInsets](self, "_updateAllPhotosOverlayInsets");
    }
    if (!self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout update]");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, CFSTR("PXCuratedLibraryLayout.m"), 246, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v13 = p_updateFlags->needsUpdate;
    self->_updateFlags.updated |= 4uLL;
    if ((v13 & 4) != 0)
    {
      p_updateFlags->needsUpdate = v13 & 0xFFFFFFFFFFFFFFFBLL;
      -[PXCuratedLibraryLayout _updateLateralMargin](self, "_updateLateralMargin");
    }
    if (!self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout update]");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, CFSTR("PXCuratedLibraryLayout.m"), 250, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v14 = p_updateFlags->needsUpdate;
    self->_updateFlags.updated |= 0x10uLL;
    if ((v14 & 0x10) != 0)
    {
      p_updateFlags->needsUpdate = v14 & 0xFFFFFFFFFFFFFFEFLL;
      -[PXCuratedLibraryLayout _updateFloatingHeaderVisibility](self, "_updateFloatingHeaderVisibility");
    }
    if (!self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout update]");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v41, CFSTR("PXCuratedLibraryLayout.m"), 254, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v15 = p_updateFlags->needsUpdate;
    self->_updateFlags.updated |= 0x20uLL;
    if ((v15 & 0x20) != 0)
    {
      p_updateFlags->needsUpdate = v15 & 0xFFFFFFFFFFFFFFDFLL;
      -[PXCuratedLibraryLayout _updateFloatingHeaderButtons](self, "_updateFloatingHeaderButtons");
      v15 = p_updateFlags->needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 0;
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout update]");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, CFSTR("PXCuratedLibraryLayout.m"), 258, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v58.receiver = self;
  v58.super_class = (Class)PXCuratedLibraryLayout;
  -[PXGSplitLayout update](&v58, sel_update);
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.willPerformUpdate = 0;
  if (self->_postUpdateFlags.needsUpdate)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout update]");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("PXCuratedLibraryLayout.m"), 262, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.isPerformingUpdate"));

    }
    self->_postUpdateFlags.isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 0;
    self->_updateFlags.isPerformingUpdate = 1;
    self->_updateFlags.updated = -1;
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout update]");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v47, CFSTR("PXCuratedLibraryLayout.m"), 263, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

    }
    v17 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x400uLL;
    if ((v17 & 0x400) != 0)
    {
      p_postUpdateFlags->needsUpdate = v17 & 0xFFFFFFFFFFFFFBFFLL;
      -[PXCuratedLibraryLayout _updateBlurredBackground](self, "_updateBlurredBackground");
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout update]");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, CFSTR("PXCuratedLibraryLayout.m"), 266, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

    }
    v18 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x800uLL;
    if ((v18 & 0x800) != 0)
    {
      p_postUpdateFlags->needsUpdate = v18 & 0xFFFFFFFFFFFFF7FFLL;
      -[PXCuratedLibraryLayout _updateContentBackground](self, "_updateContentBackground");
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout update]");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, CFSTR("PXCuratedLibraryLayout.m"), 269, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

    }
    v19 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x1000uLL;
    if ((v19 & 0x1000) != 0)
    {
      p_postUpdateFlags->needsUpdate = v19 & 0xFFFFFFFFFFFFEFFFLL;
      -[PXCuratedLibraryLayout _updateStatusBarGradientVisibility](self, "_updateStatusBarGradientVisibility");
      -[PXCuratedLibraryLayout _updateStatusBarStyle](self, "_updateStatusBarStyle");
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout update]");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, CFSTR("PXCuratedLibraryLayout.m"), 273, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

    }
    v20 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x2000uLL;
    if ((v20 & 0x2000) != 0)
    {
      p_postUpdateFlags->needsUpdate = v20 & 0xFFFFFFFFFFFFDFFFLL;
      -[PXCuratedLibraryLayout _updateStatusBarGradientAlphaValue](self, "_updateStatusBarGradientAlphaValue");
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout update]");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, CFSTR("PXCuratedLibraryLayout.m"), 276, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

    }
    v21 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x4000uLL;
    if ((v21 & 0x4000) != 0)
    {
      p_postUpdateFlags->needsUpdate = v21 & 0xFFFFFFFFFFFFBFFFLL;
      -[PXCuratedLibraryLayout _invalidateSummaryHelper](self, "_invalidateSummaryHelper");
      v21 = p_postUpdateFlags->needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 0;
    self->_updateFlags.updated = 0;
    self->_postUpdateFlags.isPerformingUpdate = 0;
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout update]");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "handleFailureInFunction:file:lineNumber:description:", v57, CFSTR("PXCuratedLibraryLayout.m"), 279, CFSTR("still needing to update %lu after update pass"), p_postUpdateFlags->needsUpdate);

    }
  }
  -[PXGLayout visibleRect](self, "visibleRect");
  self->_presentedVisibleRect.origin.x = v22;
  self->_presentedVisibleRect.origin.y = v23;
  self->_presentedVisibleRect.size.width = v24;
  self->_presentedVisibleRect.size.height = v25;
  self->_isPerformingUpdate = 0;
  self->_isPerformingInitialUpdate = 0;
  if ((objc_msgSend(v3, "isResetting") & 1) != 0 || objc_msgSend(v3, "isNavigating"))
    objc_msgSend(v3, "performChanges:", &__block_literal_global_39624);

}

- (void)_updateStatusBarGradientAlphaValue
{
  uint64_t statusBarGradientSpriteIndex;
  _QWORD v3[5];

  if (self->_wantsStatusBarGradient)
  {
    statusBarGradientSpriteIndex = self->_statusBarGradientSpriteIndex;
    if ((_DWORD)statusBarGradientSpriteIndex != -1)
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __60__PXCuratedLibraryLayout__updateStatusBarGradientAlphaValue__block_invoke;
      v3[3] = &unk_1E5127210;
      v3[4] = self;
      -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", statusBarGradientSpriteIndex | 0x100000000, v3);
    }
  }
}

- (void)_invalidateSummaryHelper
{
  -[PXCuratedLibrarySummaryHelper visibleContentDidChange](self->_summaryHelper, "visibleContentDidChange");
}

- (int64_t)curatedLibraryLayoutAnimationContextForTransitionToZoomLevel:(int64_t)a3
{
  int64_t presentedZoomLevel;
  BOOL v4;
  int64_t v5;
  BOOL v6;

  presentedZoomLevel = self->_presentedZoomLevel;
  v4 = presentedZoomLevel == 4 || a3 == 4;
  v5 = 4;
  if (v4)
    v5 = 5;
  if (presentedZoomLevel)
    v6 = presentedZoomLevel == a3;
  else
    v6 = 1;
  if (v6)
    return 1;
  else
    return v5;
}

- (void)_updateStatusBarStyle
{
  BOOL v3;
  void *v4;
  _QWORD v5[4];
  BOOL v6;

  v3 = (-[PXCuratedLibraryLayout _statusBarVisibility](self, "_statusBarVisibility") & 8) == 0;
  -[PXCuratedLibraryLayout viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__PXCuratedLibraryLayout__updateStatusBarStyle__block_invoke;
  v5[3] = &__block_descriptor_33_e43_v16__0___PXMutablePhotosLibraryViewModel__8l;
  v6 = v3;
  objc_msgSend(v4, "performChanges:", v5);

}

- (void)_updateSpecValue
{
  void *v3;
  void *v4;
  id v5;

  -[PXCuratedLibraryLayout viewModel](self, "viewModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryLayout setSpec:](self, "setSpec:", v4);

}

- (void)_updateZoomLevel
{
  int64_t v3;
  void *v4;
  id v5;
  id *p_allPhotosBodyLayout;
  id allPhotosBodyLayout;
  PXZoomablePhotosLayout *v8;
  void *v9;
  uint64_t v10;
  id v11;
  PXCuratedLibrarySectionedLayout *libraryBodyLayout;
  PXCuratedLibrarySectionedLayout *v13;
  id v14;
  void *v15;
  id v16;

  -[PXCuratedLibraryLayout viewModel](self, "viewModel");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v16, "zoomLevel");
  if ((objc_msgSend(v16, "isResetting") & 1) == 0)
  {
    -[PXCuratedLibraryLayout _createAnchorForTransitionToZoomLevel:](self, "_createAnchorForTransitionToZoomLevel:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "autoInvalidate");

  }
  if (v3 == 4)
  {
    p_allPhotosBodyLayout = (id *)&self->_allPhotosBodyLayout;
    allPhotosBodyLayout = self->_allPhotosBodyLayout;
    if (allPhotosBodyLayout)
      goto LABEL_9;
    v8 = [PXZoomablePhotosLayout alloc];
    objc_msgSend(v16, "zoomablePhotosViewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PXZoomablePhotosLayout initWithViewModel:](v8, "initWithViewModel:", v9);
    v11 = *p_allPhotosBodyLayout;
    *p_allPhotosBodyLayout = (id)v10;

    objc_msgSend(*p_allPhotosBodyLayout, "setBodyLayoutAXGroupRole:", 1);
    libraryBodyLayout = self->_libraryBodyLayout;
    self->_libraryBodyLayout = 0;

  }
  else
  {
    p_allPhotosBodyLayout = (id *)&self->_libraryBodyLayout;
    allPhotosBodyLayout = self->_libraryBodyLayout;
    if (allPhotosBodyLayout)
      goto LABEL_9;
    v13 = -[PXCuratedLibrarySectionedLayout initWithViewModel:spec:]([PXCuratedLibrarySectionedLayout alloc], "initWithViewModel:spec:", v16, self->_spec);
    v14 = *p_allPhotosBodyLayout;
    *p_allPhotosBodyLayout = v13;

    -[PXCuratedLibraryLayout _updateLibraryBodyLayoutLateralMargin](self, "_updateLibraryBodyLayoutLateralMargin");
    -[PXCuratedLibraryLayout _updateLibraryBodyLayoutLastVisibleDominantObjectReference](self, "_updateLibraryBodyLayoutLastVisibleDominantObjectReference");
  }
  allPhotosBodyLayout = *p_allPhotosBodyLayout;
LABEL_9:
  -[PXGSplitLayout setSecondSublayout:](self, "setSecondSublayout:", allPhotosBodyLayout);
  if (self->_presentedZoomLevel != v3)
  {
    -[PXGLayout createFenceWithType:](self, "createFenceWithType:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTimeout:", 0.1);
    objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
    if (self->_presentedZoomLevel == 4 && objc_msgSend(v16, "zoomLevelTransitionPhase"))
      -[PXCuratedLibraryLayout _invalidateBlurredBackgroundSnapshot](self, "_invalidateBlurredBackgroundSnapshot");

  }
  self->_presentedZoomLevel = v3;

}

- (void)_updateLibraryBodyLayoutLateralMargin
{
  double v3;
  double v4;
  id v5;

  -[PXCuratedLibraryLayout lateralMargin](self, "lateralMargin");
  v4 = v3;
  -[PXCuratedLibraryLayout libraryBodyLayout](self, "libraryBodyLayout");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLateralMargin:", v4);

}

- (void)_updateFloatingHeaderVisibility
{
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  void *v15;
  int v16;
  uint64_t v17;
  PXCuratedLibrarySectionHeaderLayout *v18;
  PXCuratedLibrarySummaryHelper *v19;
  PXCuratedLibrarySummaryHelper *summaryHelper;
  PXCuratedLibrarySectionHeaderLayout *floatingHeaderLayout;
  PXCuratedLibrarySectionHeaderLayout *v22;
  PXCuratedLibrarySectionHeaderLayout *v23;
  void *v24;
  void *v25;
  void *v26;
  PXCuratedLibrarySectionHeaderLayout *v27;
  void *v28;
  void *v29;
  PXCuratedLibrarySectionHeaderLayout *v30;
  void *v31;
  id v32;

  -[PXCuratedLibraryLayout viewModel](self, "viewModel");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v32, "zoomLevel");
  v5 = v4;
  if ((unint64_t)(v4 - 1) < 2)
  {
    objc_msgSend(v32, "sharedLibraryStatusProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "hasSharedLibraryOrPreview") & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v32, "specManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "spec");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v10, "userInterfaceIdiom") == 2;

    }
    goto LABEL_10;
  }
  if ((unint64_t)(v4 - 3) < 2)
  {
    v6 = 1;
LABEL_10:
    v8 = v32;
    goto LABEL_11;
  }
  v8 = v32;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryLayout.m"), 418, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v6 = 0;
LABEL_11:
  objc_msgSend(v8, "specManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "spec");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  v14 = v5 == 4;
  if (v13 != 5)
    v14 = v6;
  if (v14)
  {
    objc_msgSend(v32, "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "enableNavigationHeader");

  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v32, "librarySummaryPresenter");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (PXCuratedLibrarySectionHeaderLayout *)v17;
  if (((v16 & 1) != 0 || v17) && !self->_summaryHelper)
  {
    v19 = objc_alloc_init(PXCuratedLibrarySummaryHelper);
    summaryHelper = self->_summaryHelper;
    self->_summaryHelper = v19;

    -[PXCuratedLibrarySummaryHelper setShouldUseAbbreviatedDates:](self->_summaryHelper, "setShouldUseAbbreviatedDates:", 1);
    -[PXCuratedLibrarySummaryHelper setDataSource:](self->_summaryHelper, "setDataSource:", self);
  }
  floatingHeaderLayout = self->_floatingHeaderLayout;
  if (v16)
  {
    if (!floatingHeaderLayout)
    {
      v22 = objc_alloc_init(PXCuratedLibrarySectionHeaderLayout);
      v23 = self->_floatingHeaderLayout;
      self->_floatingHeaderLayout = v22;

      -[PXCuratedLibrarySectionHeaderLayout setSafeAreaBehavior:](self->_floatingHeaderLayout, "setSafeAreaBehavior:", 2);
      -[PXCuratedLibrarySectionHeaderLayout leadingButtonsLayoutGuide](self->_floatingHeaderLayout, "leadingButtonsLayoutGuide");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "registerChangeObserver:context:", self, PXCuratedLibraryFloatingHeaderLeadingButtonsGuideObserverContext);

      -[PXCuratedLibraryLayout _updateFloatingHeaderButtons](self, "_updateFloatingHeaderButtons");
      -[PXGSplitLayout setFirstSublayout:](self, "setFirstSublayout:", self->_floatingHeaderLayout);
      floatingHeaderLayout = self->_floatingHeaderLayout;
    }
    -[PXGLayout axGroup](floatingHeaderLayout, "axGroup");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAxRole:", 4 * (v5 == 4));

    -[PXCuratedLibraryLayout _updateFloatingHeaderAppearance](self, "_updateFloatingHeaderAppearance");
  }
  else if (floatingHeaderLayout)
  {
    -[PXGSplitLayout setFirstSublayout:](self, "setFirstSublayout:", 0);
    -[PXCuratedLibrarySectionHeaderLayout leadingButtonsLayoutGuide](self->_floatingHeaderLayout, "leadingButtonsLayoutGuide");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "unregisterChangeObserver:context:", self, PXCuratedLibraryFloatingHeaderLeadingButtonsGuideObserverContext);

    v27 = self->_floatingHeaderLayout;
    self->_floatingHeaderLayout = 0;

  }
  -[PXCuratedLibraryLayout _currentFloatingHeaderSpec](self, "_currentFloatingHeaderSpec");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (self->_floatingHeaderLayout
    && ((objc_msgSend(v28, "wantsTitle") & 1) != 0 || (objc_msgSend(v29, "wantsSubtitle") & 1) != 0))
  {
    v30 = v18;
    if (!v18)
      v30 = self->_floatingHeaderLayout;
  }
  else
  {
    v30 = v18;
    if (!v18)
    {
      -[PXCuratedLibrarySummaryHelper setOutputPresenter:](self->_summaryHelper, "setOutputPresenter:");
      -[PXCuratedLibrarySummaryHelper setDataSource:](self->_summaryHelper, "setDataSource:", 0);
      goto LABEL_33;
    }
  }
  -[PXCuratedLibrarySummaryHelper setOutputPresenter:](self->_summaryHelper, "setOutputPresenter:", v30);
  -[PXCuratedLibrarySummaryHelper setDataSource:](self->_summaryHelper, "setDataSource:", self);
  -[PXCuratedLibrarySummaryHelper visibleContentDidChange](self->_summaryHelper, "visibleContentDidChange");
LABEL_33:
  -[PXCuratedLibraryLayout _updateFloatingHeaderLayoutSpec](self, "_updateFloatingHeaderLayoutSpec");

}

- (void)_updateFloatingHeaderLayoutSpec
{
  void *v3;

  -[PXCuratedLibraryLayout _currentFloatingHeaderSpec](self, "_currentFloatingHeaderSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibrarySectionHeaderLayout setSpec:](self->_floatingHeaderLayout, "setSpec:", v3);

  -[PXCuratedLibraryLayout lateralMargin](self, "lateralMargin");
  -[PXCuratedLibrarySectionHeaderLayout setLateralMargin:](self->_floatingHeaderLayout, "setLateralMargin:");
}

- (double)lateralMargin
{
  return self->_lateralMargin;
}

- (void)setSpec:(id)a3
{
  void *v5;
  PXCuratedLibraryLayoutSpec *v6;

  v6 = (PXCuratedLibraryLayoutSpec *)a3;
  if (self->_spec != v6)
  {
    objc_storeStrong((id *)&self->_spec, a3);
    -[PXCuratedLibraryLayout libraryBodyLayout](self, "libraryBodyLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSpec:", v6);

    -[PXCuratedLibraryLayout _updateFloatingHeaderLayoutSpec](self, "_updateFloatingHeaderLayoutSpec");
    -[PXCuratedLibraryLayout _updateFloatingHeaderButtons](self, "_updateFloatingHeaderButtons");
  }

}

- (void)_updateFloatingHeaderAppearance
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  PXCuratedLibrarySectionHeaderLayout *floatingHeaderLayout;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  _BOOL8 v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  double v31;

  -[PXCuratedLibraryLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "zoomLevel");
  v5 = objc_msgSend(v3, "zoomLevel");
  v6 = objc_msgSend(v3, "zoomLevel");
  if (v5 != 2 && v6 != 1)
  {
    if (v4 != 4)
    {
LABEL_4:
      -[PXCuratedLibrarySectionHeaderLayout setTitleAlpha:](self->_floatingHeaderLayout, "setTitleAlpha:", 1.0);
      floatingHeaderLayout = self->_floatingHeaderLayout;
LABEL_13:
      v15 = 0;
      goto LABEL_14;
    }
LABEL_6:
    objc_msgSend(v3, "zoomablePhotosViewModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "zoomState");
      v14 = v31;
    }
    else
    {
      v31 = 0.0;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v14 = 0.0;
      v25 = 0u;
      v26 = 0u;
    }
    -[PXCuratedLibrarySectionHeaderLayout setTitleAlpha:](self->_floatingHeaderLayout, "setTitleAlpha:", v14, v25, v26, v27, v28, v29, v30, *(_QWORD *)&v31);

    -[PXCuratedLibrarySectionHeaderLayout titleAlpha](self->_floatingHeaderLayout, "titleAlpha");
    if (v16 >= 1.0)
    {
      objc_msgSend(v3, "zoomablePhotosViewModel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibrarySectionHeaderLayout setWantsOverBackgroundAppearance:](self->_floatingHeaderLayout, "setWantsOverBackgroundAppearance:", objc_msgSend(v17, "wantsOverBackgroundFloatingHeaderAppearance"));

      goto LABEL_16;
    }
    floatingHeaderLayout = self->_floatingHeaderLayout;
    goto LABEL_13;
  }
  -[PXCuratedLibraryLayout viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "specManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "spec");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if (v4 == 4)
    goto LABEL_6;
  if (v11 != 2)
  {
    if (v5 == 2)
    {
      -[PXCuratedLibrarySectionHeaderLayout setTitleAlpha:](self->_floatingHeaderLayout, "setTitleAlpha:", 0.0);
      -[PXGLayout visibleRect](self, "visibleRect");
      v19 = v18;
      -[PXCuratedLibraryLayout viewModel](self, "viewModel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "specManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "spec");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "layoutOrientation");

      v15 = v19 < 1.0 || v23 == 2;
      floatingHeaderLayout = self->_floatingHeaderLayout;
      goto LABEL_14;
    }
    goto LABEL_4;
  }
  -[PXCuratedLibrarySectionHeaderLayout setTitleAlpha:](self->_floatingHeaderLayout, "setTitleAlpha:", 0.0);
  floatingHeaderLayout = self->_floatingHeaderLayout;
  v15 = 1;
LABEL_14:
  -[PXCuratedLibrarySectionHeaderLayout setWantsOverBackgroundAppearance:](floatingHeaderLayout, "setWantsOverBackgroundAppearance:", v15);
LABEL_16:

}

- (id)_createAnchorForTransitionToZoomLevel:(int64_t)a3
{
  int64_t v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *lastVisibleAreaAnchorsByZoomLevels;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned int v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  double v47;
  double MaxY;
  double v49;
  double v50;
  unsigned int v51;
  uint64_t v52;
  void *v53;
  NSMutableDictionary *preferredVisibleAreaAnchorsByZoomLevels;
  void *v55;
  void *v57;
  void *v58;
  SEL v59;
  void *v60;
  _QWORD v61[5];
  id v62;
  int64_t v63;
  SEL v64;
  int64_t v65;
  unsigned int v66;
  uint64_t v67;
  _QWORD v68[6];
  CGRect v69;

  v6 = -[PXCuratedLibraryLayout presentedZoomLevel](self, "presentedZoomLevel");
  v7 = 0;
  if (v6)
  {
    v8 = v6;
    if (v6 != a3)
    {
      if (v6 == 3)
      {
        -[PXCuratedLibraryLayout libraryBodyLayout](self, "libraryBodyLayout");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dominantSectionLayout");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "assetCollectionReference");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = 0;
      }
      lastVisibleAreaAnchorsByZoomLevels = self->_lastVisibleAreaAnchorsByZoomLevels;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](lastVisibleAreaAnchorsByZoomLevels, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "canBeReused"))
      {
        -[PXGLayout createAnchorWithAnchor:](self, "createAnchorWithAnchor:", v14);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:
        -[PXCuratedLibraryLayout setLastPresentedDayAssetCollectionReference:](self, "setLastPresentedDayAssetCollectionReference:", v11);

        return v7;
      }
      v58 = v11;
      v59 = a2;
      -[PXGLayout createAnchorForVisibleArea](self, "createAnchorForVisibleArea");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "autoInvalidate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = self->_lastVisibleAreaAnchorsByZoomLevels;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v16, v18);

      -[PXCuratedLibraryLayout lastVisibleDominantObjectReference](self, "lastVisibleDominantObjectReference");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = MEMORY[0x1E0C809B0];
      v60 = v14;
      if (!v19)
      {
        if (v8 == 4)
        {
          v68[0] = MEMORY[0x1E0C809B0];
          v68[1] = 3221225472;
          v68[2] = __64__PXCuratedLibraryLayout__createAnchorForTransitionToZoomLevel___block_invoke;
          v68[3] = &unk_1E511C1C8;
          v68[4] = self;
          -[PXGLayout enumerateVisibleAnchoringSpriteIndexesUsingBlock:](self, "enumerateVisibleAnchoringSpriteIndexesUsingBlock:", v68);
          -[PXCuratedLibraryLayout lastVisibleDominantObjectReference](self, "lastVisibleDominantObjectReference");
          v21 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
        -[PXCuratedLibraryLayout libraryBodyLayout](self, "libraryBodyLayout");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "dominantSectionLayout");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "assetCollectionReference");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "presentedSkimming"))
        {
          -[PXCuratedLibraryLayout viewModel](self, "viewModel");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "assetsDataSourceManager");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "dataSourceForZoomLevel:", v8);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          -[PXCuratedLibraryLayout viewModel](self, "viewModel");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "assetsDataSourceManager");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "dataSourceForZoomLevel:", a3);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "assetCollectionReferenceNearestToObjectReference:", v19);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          -[PXCuratedLibraryLayout setLastVisibleDominantObjectReference:](self, "setLastVisibleDominantObjectReference:", v29);
          objc_msgSend(v57, "assetCollectionReferenceNearestToObjectReference:", v29);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          -[PXCuratedLibraryLayout setLastVisibleDominantObjectReference:](self, "setLastVisibleDominantObjectReference:", v19);
        }

      }
      v30 = v19;
      v31 = v30;
      if (v8 != 4)
      {
        -[PXCuratedLibraryLayout viewModel](self, "viewModel");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "assetsDataSourceManager");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "dataSourceForZoomLevel:", v8);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v34, "assetCollectionReferenceNearestToObjectReference:", v31);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        v39 = v31;
        v11 = v58;
LABEL_22:

        if (v21)
        {
          v67 = 0;
          v42 = -[PXGLayout spriteIndexForObjectReference:options:updatedObjectReference:](self, "spriteIndexForObjectReference:options:updatedObjectReference:", v21, 1, &v67);
        }
        else
        {
          v42 = -1;
        }
        v14 = v60;
        v61[0] = v20;
        v61[1] = 3221225472;
        v61[2] = __64__PXCuratedLibraryLayout__createAnchorForTransitionToZoomLevel___block_invoke_2;
        v61[3] = &unk_1E511C218;
        v61[4] = self;
        v66 = v42;
        v43 = v39;
        v62 = v43;
        v63 = a3;
        v64 = v59;
        v65 = v8;
        -[PXGLayout createAnchorWithConstraints:](self, "createAnchorWithConstraints:", v61);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setObject:forKeyedSubscript:", v45, CFSTR("fromZoomLevel"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setObject:forKeyedSubscript:", v46, CFSTR("toZoomLevel"));

        -[PXGSplitLayout padding](self, "padding");
        if (v47 > 0.0)
        {
          -[PXGLayout visibleRect](self, "visibleRect");
          -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
          PXEdgeInsetsInsetRect();
          MaxY = CGRectGetMaxY(v69);
          -[PXGLayout contentSize](self, "contentSize");
          v50 = MaxY - v49;
          v51 = PXFloatEqualToFloatWithTolerance();
          if (v50 > 0.0)
            v52 = 1;
          else
            v52 = v51;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setObject:forKeyedSubscript:", v53, CFSTR("fromBottomPaddingAreaIsFullyVisible"));

        }
        objc_msgSend(v7, "setDelegate:", self);
        objc_msgSend(v7, "setContext:", v44);
        preferredVisibleAreaAnchorsByZoomLevels = self->_preferredVisibleAreaAnchorsByZoomLevels;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](preferredVisibleAreaAnchorsByZoomLevels, "setObject:forKeyedSubscript:", v7, v55);

        goto LABEL_31;
      }
      v21 = v30;
LABEL_17:
      -[PXCuratedLibraryLayout viewModel](self, "viewModel");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "assetsDataSourceManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "dataSourceForZoomLevel:", a3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "assetCollectionReferenceNearestToObjectReference:", v21);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "assetCollection");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibraryLayout lastPresentedDayAssetCollectionReference](self, "lastPresentedDayAssetCollectionReference");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "assetCollection");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v35, "isEqual:", v37);

      if ((v38 & 1) != 0)
      {
        v39 = v21;
      }
      else
      {
        v31 = v31;

        v39 = v31;
      }
      v11 = v58;
      v20 = MEMORY[0x1E0C809B0];
      goto LABEL_22;
    }
  }
  return v7;
}

float __60__PXCuratedLibraryLayout__updateStatusBarGradientAlphaValue__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, float *a4)
{
  double v5;
  float result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "presentationValue");
  result = v5;
  *a4 = result;
  return result;
}

uint64_t __60__PXCuratedLibraryLayout__updateStatusBarGradientVisibility__block_invoke(uint64_t a1, uint64_t a2, float32x2_t *a3, uint64_t a4, float32x2_t *a5)
{
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v16;
  uint64_t result;
  CGFloat Width;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v9 = *(double *)(a1 + 40);
  v10 = *(double *)(a1 + 48);
  v11 = *(double *)(a1 + 56);
  v12 = *(double *)(a1 + 64);
  v19.origin.x = v9;
  v19.origin.y = v10;
  v19.size.width = v11;
  v19.size.height = v12;
  MidX = CGRectGetMidX(v19);
  v20.origin.x = v9;
  v20.origin.y = v10;
  v20.size.width = v11;
  v20.size.height = v12;
  MidY = CGRectGetMidY(v20);
  v21.origin.x = v9;
  v21.origin.y = v10;
  v21.size.width = v11;
  v21.size.height = v12;
  Width = CGRectGetWidth(v21);
  v22.origin.x = v9;
  v22.origin.y = v10;
  v22.size.width = v11;
  v22.size.height = v12;
  Height = CGRectGetHeight(v22);
  v16.f64[0] = Width;
  v16.f64[1] = Height;
  *(CGFloat *)a3 = MidX;
  *(CGFloat *)&a3[1] = MidY;
  a3[2] = (float32x2_t)0xBFF8000000000000;
  a3[3] = vcvt_f32_f64(v16);
  *(_WORD *)(a4 + 68) = *(_WORD *)(*(_QWORD *)(a1 + 32) + 1112);
  a5->i8[1] = 1;
  a5[1] = vmul_n_f32(a3[3], *(float *)(a1 + 72));
  result = PXGSectionedSpriteTagMake();
  a5[3] = (float32x2_t)result;
  return result;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6;
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t v10;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  $F40CD077B40800501ED060B808F886F7 *v13;
  unint64_t v14;
  id v15;
  $F40CD077B40800501ED060B808F886F7 *v16;
  unint64_t v17;
  $F40CD077B40800501ED060B808F886F7 *v18;
  unint64_t v19;
  $F40CD077B40800501ED060B808F886F7 *v20;
  unint64_t v21;
  uint64_t v22;
  $F40CD077B40800501ED060B808F886F7 *v23;
  unint64_t v24;
  void *v25;
  id v26;
  unint64_t v27;
  _BOOL4 willPerformUpdate;
  _BOOL4 v29;
  _BOOL4 v30;
  _BOOL4 v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  uint64_t v36;
  unint64_t v37;
  _BOOL4 v38;
  void *v39;
  objc_class *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  id v45;

  v6 = a4;
  v45 = a3;
  if ((void *)PXCuratedLibraryViewModelObserverContext_216417 == a5)
  {
    if ((v6 & 4) == 0)
      goto LABEL_32;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_31:
        p_updateFlags->needsUpdate = needsUpdate | 0x55;
        goto LABEL_32;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 85;
      if (!willPerformUpdate)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
LABEL_32:
      if ((v6 & 0x2004) != 0)
        -[PXCuratedLibraryLayout _invalidateBlurredBackground](self, "_invalidateBlurredBackground");
      if ((v6 & 4) == 0)
      {
LABEL_42:
        if ((v6 & 0x80) == 0)
        {
LABEL_49:
          if ((v6 & 0x2010001) != 0)
            -[PXCuratedLibraryLayout invalidateFloatingHeaderButtons](self, "invalidateFloatingHeaderButtons");
          if ((v6 & 0x8000000) != 0)
            -[PXCuratedLibraryLayout _updateFloatingHeaderSelectionTitle](self, "_updateFloatingHeaderSelectionTitle");
          if ((v6 & 0x4000010) == 0)
            goto LABEL_78;
          p_postUpdateFlags = &self->_postUpdateFlags;
          v10 = self->_postUpdateFlags.needsUpdate;
          if (v10)
          {
            if (!self->_postUpdateFlags.isPerformingUpdate)
              goto LABEL_59;
          }
          else if (!self->_postUpdateFlags.isPerformingUpdate)
          {
LABEL_95:
            v35 = p_postUpdateFlags->willPerformUpdate;
            v36 = 0x4000;
            goto LABEL_96;
          }
          if ((self->_postUpdateFlags.updated & 0x4000) == 0)
            goto LABEL_59;
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout observable:didChange:context:]");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("PXCuratedLibraryLayout.m"), 977, CFSTR("invalidating %lu after it already has been updated"), 0x4000);
          goto LABEL_124;
        }
        v20 = &self->_updateFlags;
        v21 = self->_updateFlags.needsUpdate;
        if (v21)
        {
          if (!self->_updateFlags.isPerformingUpdate)
          {
LABEL_48:
            v20->needsUpdate = v21 | 4;
            goto LABEL_49;
          }
        }
        else if (!self->_updateFlags.isPerformingUpdate)
        {
          v30 = self->_updateFlags.willPerformUpdate;
          v20->needsUpdate = 4;
          if (!v30)
            -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
          goto LABEL_49;
        }
        if ((self->_updateFlags.updated & 4) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout observable:didChange:context:]");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("PXCuratedLibraryLayout.m"), 967, CFSTR("invalidating %lu after it already has been updated"), 4);
          goto LABEL_124;
        }
        goto LABEL_48;
      }
      v18 = &self->_postUpdateFlags;
      v19 = self->_postUpdateFlags.needsUpdate;
      if (v19)
      {
        if (!self->_postUpdateFlags.isPerformingUpdate)
        {
LABEL_40:
          v18->needsUpdate = v19 | 0x3000;
LABEL_41:
          -[PXCuratedLibraryLayout _invalidateContentBackground](self, "_invalidateContentBackground");
          goto LABEL_42;
        }
      }
      else if (!self->_postUpdateFlags.isPerformingUpdate)
      {
        v29 = self->_postUpdateFlags.willPerformUpdate;
        v18->needsUpdate = 12288;
        if (!v29)
          -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
        goto LABEL_41;
      }
      if ((self->_postUpdateFlags.updated & 0x3000) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout observable:didChange:context:]");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("PXCuratedLibraryLayout.m"), 963, CFSTR("invalidating %lu after it already has been updated"), 12288);
        goto LABEL_124;
      }
      goto LABEL_40;
    }
    if ((self->_updateFlags.updated & 0x55) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout observable:didChange:context:]");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("PXCuratedLibraryLayout.m"), 957, CFSTR("invalidating %lu after it already has been updated"), 85);
      goto LABEL_124;
    }
    goto LABEL_31;
  }
  if ((void *)PXZoomablePhotosViewModelObserverContext == a5)
  {
    if ((v6 & 0x1001) == 0)
      goto LABEL_68;
    v13 = &self->_postUpdateFlags;
    v14 = self->_postUpdateFlags.needsUpdate;
    if (v14)
    {
      if (!self->_postUpdateFlags.isPerformingUpdate)
      {
LABEL_66:
        v13->needsUpdate = v14 | 0x3000;
LABEL_67:
        -[PXCuratedLibraryLayout _updateFloatingHeaderAppearance](self, "_updateFloatingHeaderAppearance");
LABEL_68:
        if ((v6 & 0x40000002) == 0)
        {
LABEL_75:
          if ((v6 & 2) == 0)
            goto LABEL_78;
          -[PXGLayout createCuratedLibraryLayoutAnimationIfNeededWithContext:](self, "createCuratedLibraryLayoutAnimationIfNeededWithContext:", 1);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setDuration:", 0.3);
          -[PXGLayout createAnchorForVisibleArea](self, "createAnchorForVisibleArea");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (id)objc_msgSend(v25, "autoInvalidate");

          goto LABEL_77;
        }
        v23 = &self->_updateFlags;
        v24 = self->_updateFlags.needsUpdate;
        if (v24)
        {
          if (!self->_updateFlags.isPerformingUpdate)
          {
LABEL_74:
            v23->needsUpdate = v24 | 0x20;
            goto LABEL_75;
          }
        }
        else if (!self->_updateFlags.isPerformingUpdate)
        {
          v32 = self->_updateFlags.willPerformUpdate;
          v23->needsUpdate = 32;
          if (!v32)
            -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
          goto LABEL_75;
        }
        if ((self->_updateFlags.updated & 0x20) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout observable:didChange:context:]");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("PXCuratedLibraryLayout.m"), 985, CFSTR("invalidating %lu after it already has been updated"), 32);
          goto LABEL_124;
        }
        goto LABEL_74;
      }
    }
    else if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      v31 = self->_postUpdateFlags.willPerformUpdate;
      v13->needsUpdate = 12288;
      if (!v31)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_67;
    }
    if ((self->_postUpdateFlags.updated & 0x3000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout observable:didChange:context:]");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("PXCuratedLibraryLayout.m"), 981, CFSTR("invalidating %lu after it already has been updated"), 12288);
      goto LABEL_124;
    }
    goto LABEL_66;
  }
  if ((void *)PXCuratedLibrarySpecManagerObserverContext == a5)
  {
    if ((v6 & 1) == 0)
      goto LABEL_78;
    if (self->_isPerformingUpdate)
    {
      -[PXCuratedLibraryLayout _updateSpecValue](self, "_updateSpecValue");
      -[PXCuratedLibraryLayout _updateLateralMargin](self, "_updateLateralMargin");
      goto LABEL_78;
    }
    p_postUpdateFlags = &self->_updateFlags;
    v27 = self->_updateFlags.needsUpdate;
    if (v27)
    {
      if (!self->_updateFlags.isPerformingUpdate)
        goto LABEL_106;
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      v35 = self->_updateFlags.willPerformUpdate;
      v36 = 6;
      goto LABEL_96;
    }
    if ((self->_updateFlags.updated & 6) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout observable:didChange:context:]");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("PXCuratedLibraryLayout.m"), 999, CFSTR("invalidating %lu after it already has been updated"), 6);
      goto LABEL_124;
    }
LABEL_106:
    v22 = v27 | 6;
    goto LABEL_60;
  }
  if ((void *)PXCuratedLibraryLayoutStatusBarNumberAnimatorObserverContext == a5)
  {
    if ((v6 & 6) == 0)
      goto LABEL_78;
    v15 = v45;
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_25;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "px_descriptionForAssertionMessage");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryLayout.m"), 1005, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("observable"), v41, v43);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryLayout.m"), 1005, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("observable"), v41);
    }

LABEL_25:
    if ((objc_msgSend(v15, "isBeingMutated") & 1) == 0)
    {
      v16 = &self->_postUpdateFlags;
      v17 = self->_postUpdateFlags.needsUpdate;
      if (v17)
      {
        if (!self->_postUpdateFlags.isPerformingUpdate)
        {
LABEL_100:
          v16->needsUpdate = v17 | 0x2000;
          goto LABEL_77;
        }
      }
      else if (!self->_postUpdateFlags.isPerformingUpdate)
      {
        v38 = self->_postUpdateFlags.willPerformUpdate;
        v16->needsUpdate = 0x2000;
        if (!v38)
          -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
        goto LABEL_77;
      }
      if ((self->_postUpdateFlags.updated & 0x2000) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout observable:didChange:context:]");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("PXCuratedLibraryLayout.m"), 1007, CFSTR("invalidating %lu after it already has been updated"), 0x2000);
        goto LABEL_124;
      }
      goto LABEL_100;
    }
LABEL_77:

    goto LABEL_78;
  }
  if ((void *)PXCuratedLibraryFloatingHeaderLeadingButtonsGuideObserverContext == a5)
  {
    if ((v6 & 1) == 0)
      goto LABEL_78;
    if (self->_isPerformingUpdate)
    {
      -[PXCuratedLibraryLayout _updateAllPhotosOverlayInsets](self, "_updateAllPhotosOverlayInsets");
      goto LABEL_78;
    }
    p_postUpdateFlags = &self->_updateFlags;
    v37 = self->_updateFlags.needsUpdate;
    if (v37)
    {
      if (!self->_updateFlags.isPerformingUpdate)
        goto LABEL_111;
      goto LABEL_110;
    }
    if (self->_updateFlags.isPerformingUpdate)
    {
LABEL_110:
      if ((self->_updateFlags.updated & 0x40) == 0)
      {
LABEL_111:
        v22 = v37 | 0x40;
        goto LABEL_60;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout observable:didChange:context:]");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("PXCuratedLibraryLayout.m"), 1016, CFSTR("invalidating %lu after it already has been updated"), 64);
LABEL_124:

      abort();
    }
    v35 = self->_updateFlags.willPerformUpdate;
    v36 = 64;
LABEL_96:
    p_postUpdateFlags->needsUpdate = v36;
    if (!v35)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
    goto LABEL_78;
  }
  if ((void *)PXLibraryFilterStateObservationContext_39572 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryLayout.m"), 1027, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    -[PXCuratedLibraryLayout invalidateFloatingHeaderButtons](self, "invalidateFloatingHeaderButtons");
    p_postUpdateFlags = &self->_postUpdateFlags;
    v10 = self->_postUpdateFlags.needsUpdate;
    if (v10)
    {
      if (!self->_postUpdateFlags.isPerformingUpdate)
        goto LABEL_59;
LABEL_93:
      if ((self->_postUpdateFlags.updated & 0x4000) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout observable:didChange:context:]");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("PXCuratedLibraryLayout.m"), 1023, CFSTR("invalidating %lu after it already has been updated"), 0x4000);
        goto LABEL_124;
      }
LABEL_59:
      v22 = v10 | 0x4000;
LABEL_60:
      p_postUpdateFlags->needsUpdate = v22;
      goto LABEL_78;
    }
    if (self->_postUpdateFlags.isPerformingUpdate)
      goto LABEL_93;
    goto LABEL_95;
  }
LABEL_78:

}

- (id)lastVisibleAreaAnchor
{
  NSMutableDictionary *preferredVisibleAreaAnchorsByZoomLevels;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  preferredVisibleAreaAnchorsByZoomLevels = self->_preferredVisibleAreaAnchorsByZoomLevels;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PXCuratedLibraryLayout presentedZoomLevel](self, "presentedZoomLevel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](preferredVisibleAreaAnchorsByZoomLevels, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PXCuratedLibraryLayout;
    -[PXGLayout lastVisibleAreaAnchor](&v10, sel_lastVisibleAreaAnchor);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (int64_t)presentedZoomLevel
{
  return self->_presentedZoomLevel;
}

- (BOOL)allowsSublayoutUpdateCycleAssertions
{
  return 0;
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXCuratedLibraryLayout;
  -[PXGSplitLayout didUpdate](&v7, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXCuratedLibraryLayout.m"), 306, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

  }
  if (self->_postUpdateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout didUpdate]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXCuratedLibraryLayout.m"), 307, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.willPerformUpdate"));

  }
}

- (void)sublayoutDidChangeLastBaseline:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXCuratedLibraryLayout;
  -[PXGSplitLayout sublayoutDidChangeLastBaseline:](&v12, sel_sublayoutDidChangeLastBaseline_, v4);
  -[PXGSplitLayout firstSublayout](self, "firstSublayout");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != v4)
  {

    goto LABEL_12;
  }
  v6 = -[PXCuratedLibraryLayout presentedZoomLevel](self, "presentedZoomLevel");

  if (v6 != 4)
    goto LABEL_12;
  if (self->_isPerformingUpdate)
  {
    -[PXCuratedLibraryLayout _updateAllPhotosOverlayInsets](self, "_updateAllPhotosOverlayInsets");
    goto LABEL_12;
  }
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_11:
      p_updateFlags->needsUpdate = needsUpdate | 0x40;
      goto LABEL_12;
    }
LABEL_10:
    if ((self->_updateFlags.updated & 0x40) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout sublayoutDidChangeLastBaseline:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXCuratedLibraryLayout.m"), 407, CFSTR("invalidating %lu after it already has been updated"), 64);

      abort();
    }
    goto LABEL_11;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_10;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 64;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
LABEL_12:

}

- (PXCuratedLibraryLayout)initWithViewModel:(id)a3
{
  id v5;
  PXCuratedLibraryLayout *v6;
  PXCuratedLibraryLayout *v7;
  void *v8;
  uint64_t v9;
  PXCuratedLibraryLayoutSpec *spec;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *lastVisibleAreaAnchorsByZoomLevels;
  NSMutableDictionary *v15;
  NSMutableDictionary *preferredVisibleAreaAnchorsByZoomLevels;
  PXCuratedLibraryViewModel *viewModel;
  PXCuratedLibraryLayout *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  PXNumberAnimator *statusBarGradientAnimator;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  PXLibraryFilterState *libraryFilterState;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, void *);
  void *v39;
  PXCuratedLibraryLayout *v40;
  objc_super v41;

  v5 = a3;
  v41.receiver = self;
  v41.super_class = (Class)PXCuratedLibraryLayout;
  v6 = -[PXGLayout init](&v41, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_isPerformingInitialUpdate = 1;
    objc_msgSend(v5, "specManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "spec");
    v9 = objc_claimAutoreleasedReturnValue();
    spec = v7->_spec;
    v7->_spec = (PXCuratedLibraryLayoutSpec *)v9;

    objc_msgSend(v5, "specManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerChangeObserver:context:", v7, PXCuratedLibrarySpecManagerObserverContext);

    -[PXGLayout setContentSource:](v7, "setContentSource:", v7);
    -[PXGSplitLayout setMode:](v7, "setMode:", 2);
    -[PXGSplitLayout setShouldExcludeTopAndBottomPaddingFromReferenceSize:](v7, "setShouldExcludeTopAndBottomPaddingFromReferenceSize:", 1);
    -[PXGLayout axGroup](v7, "axGroup");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAxRole:", 3);

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lastVisibleAreaAnchorsByZoomLevels = v7->_lastVisibleAreaAnchorsByZoomLevels;
    v7->_lastVisibleAreaAnchorsByZoomLevels = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    preferredVisibleAreaAnchorsByZoomLevels = v7->_preferredVisibleAreaAnchorsByZoomLevels;
    v7->_preferredVisibleAreaAnchorsByZoomLevels = v15;

    objc_storeStrong((id *)&v7->_viewModel, a3);
    viewModel = v7->_viewModel;
    v36 = MEMORY[0x1E0C809B0];
    v37 = 3221225472;
    v38 = __44__PXCuratedLibraryLayout_initWithViewModel___block_invoke;
    v39 = &unk_1E5143468;
    v18 = v7;
    v40 = v18;
    -[PXCuratedLibraryViewModel performChanges:](viewModel, "performChanges:", &v36);
    -[PXCuratedLibraryViewModel registerChangeObserver:context:](v7->_viewModel, "registerChangeObserver:context:", v18, PXCuratedLibraryViewModelObserverContext_216417);
    -[PXCuratedLibraryViewModel zoomablePhotosViewModel](v7->_viewModel, "zoomablePhotosViewModel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "registerChangeObserver:context:", v18, PXZoomablePhotosViewModelObserverContext);

    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18->_wantsBlurredBackground = -[PXCuratedLibraryLayoutSpec wantsBlurredBackground](v7->_spec, "wantsBlurredBackground");
    v18->_blurredBackgroundSpriteIndex = -1;
    v18->_contentBackgroundSpriteIndex = -1;
    v18->_wantsStatusBarGradient = -[PXCuratedLibraryLayoutSpec wantsStatusBarGradient](v7->_spec, "wantsStatusBarGradient");
    v18->_statusBarGradientSpriteIndex = -1;
    v21 = objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:", 0.0);
    statusBarGradientAnimator = v18->_statusBarGradientAnimator;
    v18->_statusBarGradientAnimator = (PXNumberAnimator *)v21;

    -[PXNumberAnimator registerChangeObserver:context:](v18->_statusBarGradientAnimator, "registerChangeObserver:context:", v18, PXCuratedLibraryLayoutStatusBarNumberAnimatorObserverContext);
    -[PXNumberAnimator setLabel:](v18->_statusBarGradientAnimator, "setLabel:", CFSTR("statusBarGradientAnimator"));
    LODWORD(v23) = 0;
    LODWORD(v24) = 0;
    LODWORD(v25) = 1.0;
    LODWORD(v26) = 0;
    v18->_statusBarGradientResizableCapInsetsIndex = -[PXGLayout addResizableCapInsets:](v18, "addResizableCapInsets:", v23, v24, v25, v26);
    objc_msgSend(v20, "statusBarGradientHeight");
    v18->_statusBarGradientHeight = v27;
    objc_msgSend(v20, "statusBarGradientAlpha");
    v18->_statusBarGradientAlpha = v28;
    objc_msgSend(v20, "statusBarGradientAndStyleFadeDuration");
    v18->_statusBarGradientAndStyleFadeDuration = v29;
    if (v18->_updateFlags.isPerformingUpdate && (v18->_updateFlags.updated & 0x5F) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout initWithViewModel:]");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("PXCuratedLibraryLayout.m"), 180, CFSTR("invalidating %lu after it already has been updated"), 95, v36, v37, v38, v39);
    }
    else
    {
      v18->_updateFlags.needsUpdate |= 0x5FuLL;
      if (!v18->_postUpdateFlags.isPerformingUpdate || (v18->_postUpdateFlags.updated & 0x7000) == 0)
      {
        v18->_postUpdateFlags.needsUpdate |= 0x7000uLL;
        +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addDeferredKeyObserver:", v18);

        objc_msgSend(v5, "libraryFilterState");
        v31 = objc_claimAutoreleasedReturnValue();
        libraryFilterState = v18->_libraryFilterState;
        v18->_libraryFilterState = (PXLibraryFilterState *)v31;

        -[PXLibraryFilterState registerChangeObserver:context:](v18->_libraryFilterState, "registerChangeObserver:context:", v18, PXLibraryFilterStateObservationContext_39572);
        goto LABEL_7;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout initWithViewModel:]");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("PXCuratedLibraryLayout.m"), 181, CFSTR("invalidating %lu after it already has been updated"), 28672, v36, v37, v38, v39);
    }

    abort();
  }
LABEL_7:

  return v7;
}

- (int64_t)_statusBarVisibility
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t v13;
  _BOOL4 v16;
  int64_t v17;
  double v19;

  -[PXCuratedLibraryLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoomablePhotosViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "specManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "spec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "layoutOrientation");
  v8 = objc_msgSend(v6, "sizeClass");
  -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  v10 = v9;
  -[PXGLayout visibleRect](self, "visibleRect");
  v12 = v11;
  v13 = -[PXCuratedLibraryLayout presentedZoomLevel](self, "presentedZoomLevel");
  v16 = (v7 != 2 || v8 != 1) && (unint64_t)(v13 - 1) < 2;
  if (v16 && v12 > -v10)
    v17 = 5;
  else
    v17 = 6;
  if (v16 && v12 > -v10 || !v16)
  {
    if (v13 == 4)
    {
      if (objc_msgSend(v4, "wantsOverBackgroundFloatingHeaderAppearance"))
      {
        if (v4)
        {
          objc_msgSend(v4, "zoomState");
          if (v19 >= 1.0)
            v17 |= 8uLL;
        }
      }
    }
  }
  else if (v12 <= -v10)
  {
    v17 = 10;
  }
  else
  {
    v17 = 6;
  }

  return v17;
}

- (id)_currentFloatingHeaderSpec
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;

  -[PXCuratedLibraryLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "specManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  objc_msgSend(v3, "sharedLibraryStatusProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasSharedLibraryOrPreview");
  if (v6 == 2)
    v9 = 1;
  else
    v9 = v8;

  -[PXCuratedLibraryLayout spec](self, "spec");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v3, "zoomLevel"))
  {
    case 1:
      if (!v9)
        goto LABEL_12;
      objc_msgSend(v10, "yearsTopHeaderSpec");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 2:
      if (!v9)
        goto LABEL_12;
      objc_msgSend(v10, "monthsTopHeaderSpec");
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v12 = (void *)v11;
      break;
    case 3:
      objc_msgSend(v10, "daysTopHeaderSpec");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 4:
      objc_msgSend(v10, "allPhotosFloatingHeaderSpec");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    default:
LABEL_12:
      v12 = 0;
      break;
  }

  return v12;
}

- (id)createCuratedLibraryLayoutAnimationIfNeededWithContext:(int64_t)a3 userData:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v6 = a4;
  -[PXCuratedLibraryLayout viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isResetting") & 1) != 0 || (objc_msgSend(v7, "isAppearing") & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v7, "zoomablePhotosViewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v18 = 0;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    goto LABEL_8;
  }
  v9 = v8;
  objc_msgSend(v8, "zoomState");

  if (!BYTE8(v15))
  {
LABEL_8:
    +[PXCuratedLibraryLayoutAnimationHelper createAnimationIfNeededForLayout:context:userData:](PXCuratedLibraryLayoutAnimationHelper, "createAnimationIfNeededForLayout:context:userData:", self, a3, v6, v12, v13, v14, v15, v16, v17, v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryLayout _noteAnimation:isRunning:](self, "_noteAnimation:isRunning:", v10, 1);
    goto LABEL_6;
  }
LABEL_5:
  v10 = 0;
LABEL_6:

  return v10;
}

- (PXCuratedLibraryViewModel)viewModel
{
  return self->_viewModel;
}

- (void)_updateAllPhotosOverlayInsets
{
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  id v35;
  CGRect v36;

  v3 = *((double *)off_1E50B8020 + 1);
  v4 = *((double *)off_1E50B8020 + 2);
  v5 = *((double *)off_1E50B8020 + 3);
  -[PXGSplitLayout firstSublayout](self, "firstSublayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastBaseline");
  v8 = v7;
  -[PXCuratedLibraryLayout spec](self, "spec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "spacingBetweenHeaderLastBaselineAndAllPhotosTop");
  v11 = v8 + v10;

  -[PXCuratedLibraryLayout allPhotosLayout](self, "allPhotosLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setOverlayInsets:", v11, v3, v4, v5);

  -[PXCuratedLibraryLayout floatingHeaderLayout](self, "floatingHeaderLayout");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leadingButtonsLayoutGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rectInLayout:", v35);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[PXCuratedLibraryLayout spec](self, "spec");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "inlineHeaderOverlayTopInsetOverride");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[PXCuratedLibraryLayout spec](self, "spec");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "inlineHeaderOverlayTopInsetOverride");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");

  }
  else
  {
    v36.origin.x = v15;
    v36.origin.y = v17;
    v36.size.width = v19;
    v36.size.height = v21;
    CGRectGetMaxY(v36);
  }

  PXEdgeInsetsMake();
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  -[PXCuratedLibraryLayout allPhotosLayout](self, "allPhotosLayout");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setInlineHeaderOverlayInsets:", v27, v29, v31, v33);

}

- (PXCuratedLibraryLayoutSpec)spec
{
  return self->_spec;
}

- (void)clearLastVisibleAreaAnchoringInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXCuratedLibraryLayout;
  -[PXGLayout clearLastVisibleAreaAnchoringInformation](&v5, sel_clearLastVisibleAreaAnchoringInformation);
  -[NSMutableDictionary removeAllObjects](self->_lastVisibleAreaAnchorsByZoomLevels, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_preferredVisibleAreaAnchorsByZoomLevels, "removeAllObjects");
  -[PXCuratedLibraryLayout setLastVisibleDominantObjectReference:](self, "setLastVisibleDominantObjectReference:", 0);
  -[PXCuratedLibraryLayout libraryBodyLayout](self, "libraryBodyLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearLastVisibleAreaAnchoringInformation");

  -[PXCuratedLibraryLayout allPhotosLayout](self, "allPhotosLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearLastVisibleAreaAnchoringInformation");

}

- (PXZoomablePhotosLayout)allPhotosLayout
{
  return self->_allPhotosBodyLayout;
}

- (void)_updateLibraryBodyLayoutLastVisibleDominantObjectReference
{
  void *v3;
  id v4;

  -[PXCuratedLibraryLayout lastVisibleDominantObjectReference](self, "lastVisibleDominantObjectReference");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryLayout libraryBodyLayout](self, "libraryBodyLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLastVisibleDominantObjectReference:", v4);

}

- (PXCuratedLibrarySectionedLayout)libraryBodyLayout
{
  return self->_libraryBodyLayout;
}

- (id)lastVisibleDominantObjectReference
{
  return self->_lastVisibleDominantObjectReference;
}

- (void)setLastVisibleDominantObjectReference:(id)a3
{
  objc_storeStrong(&self->_lastVisibleDominantObjectReference, a3);
  -[PXCuratedLibraryLayout _updateLibraryBodyLayoutLastVisibleDominantObjectReference](self, "_updateLibraryBodyLayoutLastVisibleDominantObjectReference");
}

- (PXCuratedLibrarySectionHeaderLayout)floatingHeaderLayout
{
  return self->_floatingHeaderLayout;
}

void __45__PXCuratedLibraryLayout__updateLocalSprites__block_invoke_2(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD *v14;

  if (HIDWORD(a2))
  {
    v3 = 0;
    v4 = *((_OWORD *)off_1E50B83A0 + 6);
    v5 = *((_OWORD *)off_1E50B83A0 + 7);
    v6 = *((_OWORD *)off_1E50B83A0 + 8);
    v7 = *((_OWORD *)off_1E50B83A0 + 9);
    v8 = *((_OWORD *)off_1E50B83A0 + 2);
    v9 = *((_OWORD *)off_1E50B83A0 + 3);
    v10 = *((_OWORD *)off_1E50B83A0 + 4);
    v11 = *((_OWORD *)off_1E50B83A0 + 5);
    v12 = *(_OWORD *)off_1E50B83A0;
    v13 = *((_OWORD *)off_1E50B83A0 + 1);
    do
    {
      v14 = (_OWORD *)(*(_QWORD *)(a3 + 24) + v3);
      v14[6] = v4;
      v14[7] = v5;
      v14[8] = v6;
      v14[9] = v7;
      v14[2] = v8;
      v14[3] = v9;
      v14[4] = v10;
      v14[5] = v11;
      *v14 = v12;
      v14[1] = v13;
      v3 += 160;
    }
    while (160 * HIDWORD(a2) != v3);
  }
}

- (PXSectionedObjectReference)dominantObjectReference
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__118939;
  v9 = __Block_byref_object_dispose__118940;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__PXCuratedLibraryLayout_PXCuratedLibraryEventTracker__dominantObjectReference__block_invoke;
  v4[3] = &unk_1E51291B0;
  v4[4] = self;
  v4[5] = &v5;
  -[PXGLayout enumerateVisibleAnchoringSpriteIndexesUsingBlock:](self, "enumerateVisibleAnchoringSpriteIndexesUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (PXSectionedObjectReference *)v2;
}

- (void)willUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXCuratedLibraryLayout;
  -[PXGSplitLayout willUpdate](&v7, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXCuratedLibraryLayout.m"), 209, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
  self->_postUpdateFlags.willPerformUpdate = 1;
  if (self->_postUpdateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout willUpdate]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXCuratedLibraryLayout.m"), 210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.isPerformingUpdate"));

  }
}

uint64_t __62__PXCuratedLibraryLayout_locationNamesFutureForContentInRect___block_invoke()
{
  return 0;
}

- (PXBrowserVisibleContentSnapshot)visibleContentSnapshot
{
  return (PXBrowserVisibleContentSnapshot *)-[PXCuratedLibraryVisibleContentSnapshot initWithLibraryLayout:dateType:]([PXCuratedLibraryVisibleContentSnapshot alloc], "initWithLibraryLayout:dateType:", self, 0);
}

- (id)locationNamesFutureForContentInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXCuratedLibraryLayout _currentBodyLayout](self, "_currentBodyLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8
    || (-[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", v8, x, y, width, height),
        v9 = v16.origin.x,
        v10 = v16.origin.y,
        v11 = v16.size.width,
        v12 = v16.size.height,
        CGRectIsNull(v16))
    || (PXPointIsNull() & 1) != 0
    || (objc_msgSend(v8, "locationNamesFutureForContentInRect:", v9, v10, v11, v12),
        (v13 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v13 = &__block_literal_global_250;
  }
  v14 = (void *)objc_msgSend(v13, "copy");

  return v14;
}

- (id)dateIntervalFutureForContentInRect:(CGRect)a3 type:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXCuratedLibraryLayout _currentBodyLayout](self, "_currentBodyLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10
    || (-[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", v10, x, y, width, height),
        v11 = v18.origin.x,
        v12 = v18.origin.y,
        v13 = v18.size.width,
        v14 = v18.size.height,
        CGRectIsNull(v18))
    || (PXPointIsNull() & 1) != 0
    || (objc_msgSend(v10, "dateIntervalFutureForContentInRect:type:", a4, v11, v12, v13, v14),
        (v15 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v15 = &__block_literal_global_248;
  }
  v16 = (void *)objc_msgSend(v15, "copy");

  return v16;
}

- (BOOL)curatedLibrarySummaryHelperShouldUpdateImmediately:(id)a3
{
  return 0;
}

void __79__PXCuratedLibraryLayout_PXCuratedLibraryEventTracker__dominantObjectReference__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "objectReferenceForSpriteIndex:", a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;
}

- (void)visibleRectDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t needsUpdate;
  void *v5;
  uint64_t v6;
  _BOOL4 willPerformUpdate;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXCuratedLibraryLayout;
  -[PXGSplitLayout visibleRectDidChange](&v10, sel_visibleRectDidChange);
  p_postUpdateFlags = &self->_postUpdateFlags;
  needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->needsUpdate = needsUpdate | 0x1000;
      goto LABEL_7;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x1000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout visibleRectDidChange]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXCuratedLibraryLayout.m"), 927, CFSTR("invalidating %lu after it already has been updated"), 4096);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = 4096;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
LABEL_7:
  -[PXCuratedLibrarySummaryHelper visibleContentDidChange](self->_summaryHelper, "visibleContentDidChange");
  -[PXCuratedLibraryLayout _invalidateBlurredBackground](self, "_invalidateBlurredBackground");
  -[PXCuratedLibraryLayout spec](self, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "variant");

  if (v6)
    -[PXCuratedLibraryLayout _updateFloatingHeaderAppearance](self, "_updateFloatingHeaderAppearance");
}

- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a4;
  if (self->_statusBarGradientSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryLayout.m"), 1824, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = v7;
  -[PXCuratedLibraryLayout spec](self, "spec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "statusBarGradientImageConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)displayScaleDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibraryLayout;
  -[PXGSplitLayout displayScaleDidChange](&v8, sel_displayScaleDidChange);
  if (!self->_isPerformingUpdate)
  {
    p_postUpdateFlags = &self->_postUpdateFlags;
    needsUpdate = self->_postUpdateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_postUpdateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_postUpdateFlags->needsUpdate = needsUpdate | 0x1000;
        return;
      }
LABEL_6:
      if ((self->_postUpdateFlags.updated & 0x1000) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout displayScaleDidChange]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXCuratedLibraryLayout.m"), 912, CFSTR("invalidating %lu after it already has been updated"), 4096);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_postUpdateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
    p_postUpdateFlags->needsUpdate = 4096;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)_updateFloatingHeaderButtons
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  SEL v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  objc_class *v43;
  void *v44;
  objc_class *v45;
  void *v46;
  void *v47;
  objc_class *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  const char *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  unsigned int v59;
  __CFString *v60;
  __CFString *v61;
  unsigned int v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _QWORD aBlock[4];
  id v70;
  id v71;
  PXCuratedLibraryLayout *v72;
  _QWORD v73[2];
  _QWORD v74[3];

  v74[1] = *MEMORY[0x1E0C80C00];
  if (!self->_floatingHeaderLayout)
    return;
  -[PXCuratedLibraryLayout viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v4;
  v6 = objc_msgSend(v4, "zoomLevel");
  v7 = v6;
  if (v6 == 4)
  {
    v9 = 0;
    v8 = 1;
  }
  else if (v6 == 3 && (objc_msgSend(v4, "isSelecting") & 1) == 0)
  {
    -[PXCuratedLibraryLayout spec](self, "spec");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allPhotosFloatingHeaderSpec");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXCuratedLibraryOverlayButtonConfiguration configurationWithButtonType:spec:](PXCuratedLibraryOverlayButtonConfiguration, "configurationWithButtonType:spec:", 1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v74[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 1);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = 0;
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  -[PXCuratedLibrarySectionHeaderLayout setExternalTrailingButtonConfigurations:](self->_floatingHeaderLayout, "setExternalTrailingButtonConfigurations:", v9);
  -[PXCuratedLibrarySectionHeaderLayout setShowsBackgroundGradient:](self->_floatingHeaderLayout, "setShowsBackgroundGradient:", v8);
  LODWORD(v13) = -1081291571;
  -[PXCuratedLibrarySectionHeaderLayout setButtonsZIndex:](self->_floatingHeaderLayout, "setButtonsZIndex:", v13);
  objc_msgSend(v5, "actionPerformerForActionType:", CFSTR("PXCuratedLibraryActionCancelSelectMode"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibrarySectionHeaderLayout setCancelButtonActionPerformer:](self->_floatingHeaderLayout, "setCancelButtonActionPerformer:", v14);

  objc_msgSend(v5, "actionPerformerForActionType:", CFSTR("PXCuratedLibraryActionEnterSelectMode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibrarySectionHeaderLayout setSelectButtonActionPerformer:](self->_floatingHeaderLayout, "setSelectButtonActionPerformer:", v15);

  PXLocalizedStringFromTable(CFSTR("PXCuratedLibrarySelectButtonTitle"), CFSTR("PhotosUICore"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibrarySectionHeaderLayout setSelectButtonTitle:](self->_floatingHeaderLayout, "setSelectButtonTitle:", v16);

  objc_msgSend(v5, "actionPerformerForActionType:", CFSTR("PXCuratedLibraryActionShowSidebar"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibrarySectionHeaderLayout setShowSidebarButtonActionPerformer:](self->_floatingHeaderLayout, "setShowSidebarButtonActionPerformer:", v17);

  +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PXCuratedLibraryLayout__updateFloatingHeaderButtons__block_invoke;
  aBlock[3] = &unk_1E511C0D8;
  v19 = v18;
  v70 = v19;
  v20 = v5;
  v71 = v20;
  v72 = self;
  v21 = _Block_copy(aBlock);
  objc_msgSend(v68, "sharedLibraryStatusProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "hasSharedLibraryOrPreview");

  v66 = (void *)v9;
  v67 = v19;
  v64 = v21;
  if ((v23 & 1) != 0)
  {
    (*((void (**)(void *))v21 + 2))(v21);
    v24 = objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryLayout libraryFilterState](self, "libraryFilterState");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v25, "isFiltering");

    if (v7 != 4)
    {
      v63 = (void *)v24;
LABEL_18:
      v52 = 0;
      v55 = 0;
      v56 = 0;
      v57 = 0;
      v58 = 0;
      v59 = 0;
      v28 = 0;
      v29 = &stru_1E5149688;
      v60 = &stru_1E5149688;
      v61 = &stru_1E5149688;
      goto LABEL_29;
    }
  }
  else
  {
    if (v7 != 4)
    {
      v63 = 0;
      v62 = 0;
      goto LABEL_18;
    }
    (*((void (**)(void *))v21 + 2))(v21);
    v24 = objc_claimAutoreleasedReturnValue();
    v62 = 0;
  }
  v63 = (void *)v24;
  if (!objc_msgSend(v19, "enableFilterDropDownButton"))
  {
    v59 = 0;
    v54 = 0;
    v60 = &stru_1E5149688;
    v61 = &stru_1E5149688;
    goto LABEL_20;
  }
  objc_msgSend(v20, "actionPerformerForActionType:", CFSTR("PXCuratedLibraryActionShowFilters"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v54)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (objc_class *)objc_opt_class();
    NSStringFromClass(v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryLayout.m"), 828, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[actionManager actionPerformerForActionType:PXCuratedLibraryActionShowFilters]"), v44);
LABEL_40:

    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (objc_class *)objc_opt_class();
    NSStringFromClass(v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "px_descriptionForAssertionMessage");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryLayout.m"), 828, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[actionManager actionPerformerForActionType:PXCuratedLibraryActionShowFilters]"), v44, v46);

    goto LABEL_40;
  }
LABEL_16:
  objc_msgSend(v68, "currentContentFilterState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedCaptionForFilterState(v26);
  v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
  PXLocalizedTitleForFilterState(v26);
  v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "currentContentFilterState");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v27, "isFiltering");

LABEL_20:
  if (objc_msgSend(v19, "enableAspectFitButton"))
  {
    objc_msgSend(v68, "zoomablePhotosViewModel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v51, "aspectFit");
    PXLocalizedStringFromTable(CFSTR("PXLibraryAllPhotosToggleSquares"), CFSTR("PhotosUICore"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(CFSTR("PXLibraryAllPhotosToggleFullFrames"), CFSTR("PhotosUICore"));
    v32 = objc_claimAutoreleasedReturnValue();
    v53 = a2;
    v33 = (void *)v32;
    if (v30)
      v34 = v31;
    else
      v34 = (void *)v32;
    v29 = v34;
    v35 = (void *)MEMORY[0x1E0C99E60];
    v73[0] = v33;
    v73[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setWithArray:", v36);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = v30 ^ 1u;
    objc_msgSend(v20, "actionPerformerForActionType:", CFSTR("PXCuratedLibraryActionAllPhotosToggleAspectFit"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    a2 = v53;
    v19 = v67;

  }
  else
  {
    v56 = 0;
    v57 = 0;
    v58 = 0;
    v29 = &stru_1E5149688;
  }
  v28 = v54;
  if (objc_msgSend(v19, "enableZoomInOutButton"))
  {
    objc_msgSend(v20, "actionPerformerForActionType:", CFSTR("PXCuratedLibraryActionAllPhotosZoomIn"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "actionPerformerForActionType:", CFSTR("PXCuratedLibraryActionAllPhotosZoomOut"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v52 = 0;
    v55 = 0;
  }
LABEL_29:
  v65 = v20;
  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled")
    || !objc_msgSend(v67, "enableFilterIndicatorButton"))
  {
    v41 = 0;
    v39 = v28;
  }
  else
  {
    v37 = v20;
    v38 = a2;
    objc_msgSend(v37, "actionPerformerForActionType:", CFSTR("PXCuratedLibraryActionShowFilters"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (objc_class *)objc_opt_class();
        NSStringFromClass(v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "px_descriptionForAssertionMessage");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", v38, self, CFSTR("PXCuratedLibraryLayout.m"), 856, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[actionManager actionPerformerForActionType:PXCuratedLibraryActionShowFilters]"), v49, v50);

      }
    }

    objc_msgSend(v68, "currentContentFilterState");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "isFiltering");

  }
  -[PXCuratedLibrarySectionHeaderLayout setEllipsisButtonActionPerformer:](self->_floatingHeaderLayout, "setEllipsisButtonActionPerformer:", v63);
  -[PXCuratedLibrarySectionHeaderLayout setEllipsisButtonHighlighted:](self->_floatingHeaderLayout, "setEllipsisButtonHighlighted:", v62);
  -[PXCuratedLibrarySectionHeaderLayout setFilterIndicatorButtonHighlighted:](self->_floatingHeaderLayout, "setFilterIndicatorButtonHighlighted:", v41);
  -[PXCuratedLibrarySectionHeaderLayout setShowFiltersActionPerformer:](self->_floatingHeaderLayout, "setShowFiltersActionPerformer:", v39);
  -[PXCuratedLibrarySectionHeaderLayout setFilterButtonCaption:](self->_floatingHeaderLayout, "setFilterButtonCaption:", v61);
  -[PXCuratedLibrarySectionHeaderLayout setFilterButtonTitle:](self->_floatingHeaderLayout, "setFilterButtonTitle:", v60);
  -[PXCuratedLibrarySectionHeaderLayout setFilterButtonHighlighted:](self->_floatingHeaderLayout, "setFilterButtonHighlighted:", v59);
  -[PXCuratedLibrarySectionHeaderLayout setToggleAspectFitButtonActionPerformer:](self->_floatingHeaderLayout, "setToggleAspectFitButtonActionPerformer:", v57);
  -[PXCuratedLibrarySectionHeaderLayout setToggleAspectFitButtonTitle:](self->_floatingHeaderLayout, "setToggleAspectFitButtonTitle:", v29);
  -[PXCuratedLibrarySectionHeaderLayout setToggleAspectFitButtonPossibleTitles:](self->_floatingHeaderLayout, "setToggleAspectFitButtonPossibleTitles:", v58);
  -[PXCuratedLibrarySectionHeaderLayout setToggleAspectFitCompactButtonSymbol:](self->_floatingHeaderLayout, "setToggleAspectFitCompactButtonSymbol:", v56);
  -[PXCuratedLibrarySectionHeaderLayout setZoomInButtonActionPerformer:](self->_floatingHeaderLayout, "setZoomInButtonActionPerformer:", v55);
  -[PXCuratedLibrarySectionHeaderLayout setZoomOutButtonActionPerformer:](self->_floatingHeaderLayout, "setZoomOutButtonActionPerformer:", v52);
  -[PXCuratedLibraryLayout _updateFloatingHeaderSelectionTitle](self, "_updateFloatingHeaderSelectionTitle");

}

- (void)safeAreaInsetsDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibraryLayout;
  -[PXGSplitLayout safeAreaInsetsDidChange](&v8, sel_safeAreaInsetsDidChange);
  if (!self->_isPerformingUpdate)
  {
    p_postUpdateFlags = &self->_postUpdateFlags;
    needsUpdate = self->_postUpdateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_postUpdateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_postUpdateFlags->needsUpdate = needsUpdate | 0x1000;
        return;
      }
LABEL_6:
      if ((self->_postUpdateFlags.updated & 0x1000) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout safeAreaInsetsDidChange]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXCuratedLibraryLayout.m"), 920, CFSTR("invalidating %lu after it already has been updated"), 4096);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_postUpdateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
    p_postUpdateFlags->needsUpdate = 4096;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)_updateStatusBarGradientVisibility
{
  double v3;
  float v4;
  double statusBarGradientHeight;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(_QWORD, __n128);
  char v11;
  __n128 v12;
  _QWORD aBlock[5];
  _QWORD v14[9];
  float v15;

  if (self->_wantsStatusBarGradient)
  {
    -[PXGLayout displayScale](self, "displayScale");
    v4 = v3;
    -[PXGLayout visibleRect](self, "visibleRect");
    statusBarGradientHeight = self->_statusBarGradientHeight;
    v6 = self->_statusBarGradientSpriteIndex | 0x100000000;
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__PXCuratedLibraryLayout__updateStatusBarGradientVisibility__block_invoke;
    v14[3] = &unk_1E513BF60;
    v14[6] = v8;
    v14[7] = v9;
    *(double *)&v14[8] = statusBarGradientHeight;
    v14[4] = self;
    v14[5] = 0;
    v15 = v4;
    -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v6, v14);
    aBlock[0] = v7;
    aBlock[1] = 3221225472;
    aBlock[2] = __60__PXCuratedLibraryLayout__updateStatusBarGradientVisibility__block_invoke_2;
    aBlock[3] = &unk_1E513C588;
    aBlock[4] = self;
    v10 = (void (**)(_QWORD, __n128))_Block_copy(aBlock);
    v11 = -[PXCuratedLibraryLayout _statusBarVisibility](self, "_statusBarVisibility");
    v12.n128_u64[0] = 0;
    if ((v11 & 2) == 0)
    {
      if ((v11 & 1) == 0)
      {
LABEL_6:

        return;
      }
      v12.n128_u64[0] = *(_QWORD *)&self->_statusBarGradientAlpha;
    }
    v10[2](v10, v12);
    goto LABEL_6;
  }
}

uint64_t __60__PXCuratedLibraryLayout__updateStatusBarGradientVisibility__block_invoke_2(uint64_t a1, double a2)
{
  uint64_t result;
  double v5;
  uint64_t v6;
  void *v7;
  double v8;
  _QWORD v9[5];

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "value");
  if (v5 != a2)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 1104);
    v8 = *(double *)(v6 + 1136);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__PXCuratedLibraryLayout__updateStatusBarGradientVisibility__block_invoke_3;
    v9[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
    *(double *)&v9[4] = a2;
    return objc_msgSend(v7, "performChangesWithDuration:curve:changes:", 4, v9, v8);
  }
  return result;
}

- (void)_updateLocalSprites
{
  void (**v3)(void *, unsigned int *, BOOL);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD aBlock[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__39544;
  v21 = __Block_byref_object_dispose__39545;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__39544;
  v15 = __Block_byref_object_dispose__39545;
  v16 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__PXCuratedLibraryLayout__updateLocalSprites__block_invoke;
  aBlock[3] = &unk_1E511C068;
  aBlock[4] = &v23;
  aBlock[5] = &v17;
  aBlock[6] = &v11;
  v3 = (void (**)(void *, unsigned int *, BOOL))_Block_copy(aBlock);
  -[PXCuratedLibraryLayout viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "specManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "spec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v3[2](v3, &self->_statusBarGradientSpriteIndex, self->_wantsStatusBarGradient);
  v3[2](v3, &self->_blurredBackgroundSpriteIndex, self->_wantsBlurredBackground);
  v3[2](v3, &self->_contentBackgroundSpriteIndex, v7 != 0);
  if (objc_msgSend((id)v18[5], "count") || objc_msgSend((id)v12[5], "count"))
  {
    v8 = objc_alloc((Class)off_1E50B1608);
    v9 = (void *)objc_msgSend(v8, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v12[5], v18[5], 0, 0, 0);
    -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](self, "applySpriteChangeDetails:countAfterChanges:initialState:modifyState:", v9, *((unsigned int *)v24 + 6), &__block_literal_global_182, 0);

  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
}

_QWORD *__45__PXCuratedLibraryLayout__updateLocalSprites__block_invoke(_QWORD *result, unsigned int *a2, int a3)
{
  _QWORD *v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;

  v4 = result;
  v5 = *a2;
  if (a3)
  {
    *a2 = (*(_DWORD *)(*(_QWORD *)(result[4] + 8) + 24))++;
    v6 = *a2;
  }
  else
  {
    v6 = -1;
    *a2 = -1;
  }
  if (v5 == -1)
  {
    if (v6 == -1)
      return result;
    v7 = *(void **)(*(_QWORD *)(result[5] + 8) + 40);
    if (!v7)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v12 = *(_QWORD *)(v4[5] + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      v7 = *(void **)(*(_QWORD *)(v4[5] + 8) + 40);
      v6 = *a2;
    }
  }
  else
  {
    if (v6 != -1)
      return result;
    v7 = *(void **)(*(_QWORD *)(result[6] + 8) + 40);
    if (!v7)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v9 = *(_QWORD *)(v4[6] + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v7 = *(void **)(*(_QWORD *)(v4[6] + 8) + 40);
    }
    v6 = v5;
  }
  return (_QWORD *)objc_msgSend(v7, "addIndex:", v6);
}

- (void)_noteAnimation:(id)a3 isRunning:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD block[4];
  id v12;
  id v13;
  _QWORD v14[4];
  BOOL v15;

  v4 = a4;
  v6 = a3;
  if ((PXCuratedLibraryAnimationGetContext(v6) & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    -[PXCuratedLibraryLayout viewModel](self, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __51__PXCuratedLibraryLayout__noteAnimation_isRunning___block_invoke;
    v14[3] = &__block_descriptor_33_e43_v16__0___PXMutablePhotosLibraryViewModel__8l;
    v15 = v4;
    objc_msgSend(v7, "performChanges:", v14);

    +[PXCuratedLibraryAnimationTracker sharedTracker](PXCuratedLibraryAnimationTracker, "sharedTracker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v4)
    {
      objc_msgSend(v9, "zoomLevelTransitionPreparationDidBegin:", v6);
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __51__PXCuratedLibraryLayout__noteAnimation_isRunning___block_invoke_2;
      block[3] = &unk_1E5148D08;
      v12 = v10;
      v13 = v6;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      objc_msgSend(v9, "zoomLevelTransitionDidEnd:", v6);
    }

  }
}

uint64_t __60__PXCuratedLibraryLayout__updateStatusBarGradientVisibility__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(double *)(a1 + 32));
}

- (void)_updateLateralMargin
{
  void *v3;
  double v4;
  double v5;
  id v6;

  -[PXCuratedLibraryLayout spec](self, "spec");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  if (objc_msgSend(v3, "zoomLevel") == 3 && objc_msgSend(v6, "userInterfaceIdiom") == 4)
  {
    objc_msgSend(v6, "contentGuideInsetsForScrollAxis:", 1);
    objc_msgSend(v3, "daysMarginScale");
    PXFloatByLinearlyInterpolatingFloats();
    v4 = v5;
  }
  -[PXCuratedLibraryLayout setLateralMargin:](self, "setLateralMargin:", v4);

}

- (void)setLateralMargin:(double)a3
{
  if (self->_lateralMargin != a3)
  {
    self->_lateralMargin = a3;
    -[PXCuratedLibraryLayout _updateLibraryBodyLayoutLateralMargin](self, "_updateLibraryBodyLayoutLateralMargin");
    -[PXCuratedLibraryLayout _updateFloatingHeaderLayoutSpec](self, "_updateFloatingHeaderLayoutSpec");
  }
}

- (void)_updateFloatingHeaderSelectionTitle
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  id v16;

  -[PXCuratedLibraryLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedAssetsTypedCount");
  v6 = v5;

  -[PXCuratedLibraryLayout spec](self, "spec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  v16 = 0;
  if (v8 == 4 && v4 >= 2)
  {
    PXLocalizedAssetCountForUsage(v4, v6, 0, 1);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[PXCuratedLibrarySectionHeaderLayout setSelectionTitle:](self->_floatingHeaderLayout, "setSelectionTitle:", v16);
  if (v16)
  {
    -[PXCuratedLibrarySectionHeaderLayout longestPossibleSelectionTitle](self->_floatingHeaderLayout, "longestPossibleSelectionTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = 0;
      v11 = 0.0;
      do
      {
        PXLocalizedAssetCountForUsage(999000, v10, 0, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sizeWithAttributes:", 0);
        if (v13 > v11)
        {
          v14 = v13;
          v15 = v12;

          v9 = v15;
          v11 = v14;
        }

        ++v10;
      }
      while (v10 != 3);
      -[PXCuratedLibrarySectionHeaderLayout setLongestPossibleSelectionTitle:](self->_floatingHeaderLayout, "setLongestPossibleSelectionTitle:", v9);

    }
  }

}

- (id)createAnchorForScrollingToInitialPosition
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14[2];
  id location;
  _QWORD v16[2];
  __int128 v17;
  _QWORD v18[2];
  int64x2_t v19;

  -[PXCuratedLibraryLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "zoomLevel") != 3)
    goto LABEL_9;
  objc_msgSend(v3, "assetsDataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSourceForZoomLevel:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "numberOfSections");
  if (v6 <= 0)
    goto LABEL_8;
  v7 = (void *)(v6 - 1);
  v18[0] = objc_msgSend(v5, "identifier");
  v18[1] = v7;
  v19 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  objc_msgSend(v5, "assetCollectionAtSectionIndexPath:", v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isRecent") || objc_msgSend(v5, "numberOfItemsInSection:", v7) < 1)
  {

LABEL_8:
LABEL_9:
    -[PXGLayout createAnchorForScrollingToContentEdges:padding:](self, "createAnchorForScrollingToContentEdges:padding:", 4, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v16[0] = objc_msgSend(v5, "identifier");
  v16[1] = v7;
  v17 = xmmword_1A7C0C1F0;
  objc_msgSend(v5, "assetReferenceAtItemIndexPath:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[PXGLayout spriteReferenceForObjectReference:](self, "spriteReferenceForObjectReference:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__PXCuratedLibraryLayout_createAnchorForScrollingToInitialPosition__block_invoke;
  v13[3] = &unk_1E511C178;
  objc_copyWeak(v14, &location);
  v14[1] = v7;
  -[PXGLayout createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:customOffset:](self, "createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:customOffset:", v10, 4, v13, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

  if (!v11)
    goto LABEL_9;
LABEL_10:

  return v11;
}

uint64_t __47__PXCuratedLibraryLayout_animationDidComplete___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_noteAnimation:isRunning:", *(_QWORD *)(a1 + 40), 0);
}

- (void)animationDidComplete:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__PXCuratedLibraryLayout_animationDidComplete___block_invoke;
  v6[3] = &unk_1E5148D08;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)dealloc
{
  objc_super v3;

  -[PXGDiagnosticsSpriteProbe setActive:](self->_spriteProbe, "setActive:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryLayout;
  -[PXGLayout dealloc](&v3, sel_dealloc);
}

- (BOOL)allowsDanglingUpdatesAssertions
{
  return 0;
}

- (void)_invalidateBlurredBackgroundSnapshot
{
  ++self->_blurredBackgroundMediaVersion;
  -[PXCuratedLibraryLayout _invalidateBlurredBackground](self, "_invalidateBlurredBackground");
}

- (void)_invalidateBlurredBackground
{
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  if (self->_isPerformingUpdate)
  {
    -[PXCuratedLibraryLayout _updateBlurredBackground](self, "_updateBlurredBackground");
    return;
  }
  p_postUpdateFlags = &self->_postUpdateFlags;
  needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_8:
      p_postUpdateFlags->needsUpdate = needsUpdate | 0x400;
      return;
    }
LABEL_7:
    if ((self->_postUpdateFlags.updated & 0x400) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout _invalidateBlurredBackground]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXCuratedLibraryLayout.m"), 648, CFSTR("invalidating %lu after it already has been updated"), 1024);

      abort();
    }
    goto LABEL_8;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_7;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = 1024;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateBlurredBackground
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  PXGExposureBlurEffect *v19;
  PXGExposureBlurEffect *blurredBackgroundEffect;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  _QWORD v29[15];

  if (self->_blurredBackgroundSpriteIndex != -1)
  {
    -[PXCuratedLibraryLayout viewModel](self, "viewModel");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryLayout spec](self, "spec");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout visibleRect](self, "visibleRect");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[PXGLayout displayScale](self, "displayScale");
    v14 = v13;
    -[PXGLayout entityManager](self, "entityManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGExposureBlurEffect entityManager](self->_blurredBackgroundEffect, "entityManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 != v15)
    {
      v17 = objc_alloc((Class)off_1E50B29D8);
      -[PXGLayout entityManager](self, "entityManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (PXGExposureBlurEffect *)objc_msgSend(v17, "initWithEntityManager:", v18);
      blurredBackgroundEffect = self->_blurredBackgroundEffect;
      self->_blurredBackgroundEffect = v19;

      -[PXGExposureBlurEffect setExposure:](self->_blurredBackgroundEffect, "setExposure:", 0.0);
      objc_msgSend(v4, "blurredBackgroundRadius");
      -[PXGExposureBlurEffect setRadius:](self->_blurredBackgroundEffect, "setRadius:");
    }
    objc_msgSend(v3, "blurredBackgroundOpacityForZoomLevel:", objc_msgSend(v28, "zoomLevel"));
    v22 = v21;
    objc_msgSend(v3, "blurredBackgroundEdgeInsets");
    if (v22 == 0.0)
    {
      v23 = *(_QWORD *)off_1E50B86D0;
      v24 = *((_QWORD *)off_1E50B86D0 + 1);
      v25 = *((_QWORD *)off_1E50B86D0 + 2);
      v26 = *((_QWORD *)off_1E50B86D0 + 3);
    }
    else
    {
      PXEdgeInsetsInsetRect();
      PXRectNormalize();
    }
    v27 = self->_blurredBackgroundSpriteIndex | 0x100000000;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __50__PXCuratedLibraryLayout__updateBlurredBackground__block_invoke;
    v29[3] = &unk_1E511C0B0;
    v29[5] = v6;
    v29[6] = v8;
    v29[7] = v10;
    v29[8] = v12;
    *(double *)&v29[9] = v22;
    v29[10] = v23;
    v29[11] = v24;
    v29[12] = v25;
    v29[4] = self;
    v29[13] = v26;
    v29[14] = v14;
    -[PXGLayout modifySpritesInRange:fullState:](self, "modifySpritesInRange:fullState:", v27, v29);

  }
}

- (void)_invalidateContentBackground
{
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  if (self->_isPerformingUpdate)
  {
    -[PXCuratedLibraryLayout _updateContentBackground](self, "_updateContentBackground");
    return;
  }
  p_postUpdateFlags = &self->_postUpdateFlags;
  needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_8:
      p_postUpdateFlags->needsUpdate = needsUpdate | 0x800;
      return;
    }
LABEL_7:
    if ((self->_postUpdateFlags.updated & 0x800) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout _invalidateContentBackground]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXCuratedLibraryLayout.m"), 696, CFSTR("invalidating %lu after it already has been updated"), 2048);

      abort();
    }
    goto LABEL_8;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_7;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = 2048;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_invalidateContentBackgroundMediaVersion
{
  ++self->_contentBackgroundMediaVersion;
  -[PXCuratedLibraryLayout _invalidateContentBackground](self, "_invalidateContentBackground");
}

- (void)_updateContentBackground
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t contentBackgroundSpriteIndex;
  double v13;
  id v14;
  _QWORD v15[10];

  if (self->_contentBackgroundSpriteIndex != -1)
  {
    -[PXGLayout contentSize](self, "contentSize");
    PXEdgeInsetsMake();
    PXRectWithOriginAndSize();
    PXEdgeInsetsInsetRect();
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[PXCuratedLibraryLayout viewModel](self, "viewModel");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v14, "zoomLevel");
    contentBackgroundSpriteIndex = self->_contentBackgroundSpriteIndex;
    v13 = 1.0;
    if (v11 != 4)
      v13 = 0.0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __50__PXCuratedLibraryLayout__updateContentBackground__block_invoke;
    v15[3] = &unk_1E51368B8;
    v15[5] = v4;
    v15[6] = v6;
    v15[7] = v8;
    v15[8] = v10;
    *(double *)&v15[9] = v13;
    v15[4] = self;
    -[PXGLayout modifySpritesInRange:fullState:](self, "modifySpritesInRange:fullState:", contentBackgroundSpriteIndex | 0x100000000, v15);

  }
}

- (void)invalidateFloatingHeaderButtons
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  if (self->_isPerformingUpdate)
  {
    -[PXCuratedLibraryLayout _updateFloatingHeaderButtons](self, "_updateFloatingHeaderButtons");
    return;
  }
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_8:
      p_updateFlags->needsUpdate = needsUpdate | 0x20;
      return;
    }
LABEL_7:
    if ((self->_updateFlags.updated & 0x20) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout invalidateFloatingHeaderButtons]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXCuratedLibraryLayout.m"), 740, CFSTR("invalidating %lu after it already has been updated"), 32);

      abort();
    }
    goto LABEL_8;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_7;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 32;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)contentSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryLayout;
  -[PXGLayout contentSizeDidChange](&v3, sel_contentSizeDidChange);
  -[PXCuratedLibraryLayout _invalidateContentBackground](self, "_invalidateContentBackground");
}

- (void)viewEnvironmentWillChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibraryLayout;
  v4 = a3;
  -[PXGLayout viewEnvironmentWillChange:](&v8, sel_viewEnvironmentWillChange_, v4);
  -[PXGLayout viewEnvironment](self, "viewEnvironment", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[PXCuratedLibraryLayout _invalidateContentBackgroundMediaVersion](self, "_invalidateContentBackgroundMediaVersion");
}

- (void)entityManagerDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryLayout;
  -[PXGLayout entityManagerDidChange](&v3, sel_entityManagerDidChange);
  -[PXCuratedLibraryLayout _invalidateBlurredBackground](self, "_invalidateBlurredBackground");
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  void *v6;
  void *v7;
  int64_t v8;

  *a5 = objc_retainAutorelease(a3);
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryLayout _currentBodyLayout](self, "_currentBodyLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "indexOfSublayout:", v7);

  return v8;
}

- (double)_adjustedTargetVisibleTopToAccomodateFromBottomPaddedAreaVisibility:(BOOL)a3 proposedVisibleRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  double y;
  CGFloat x;
  _BOOL4 v8;
  double MaxY;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  PXEdgeInsetsInsetRect();
  MaxY = CGRectGetMaxY(v16);
  -[PXGLayout contentSize](self, "contentSize");
  v12 = MaxY - v11;
  -[PXGSplitLayout padding](self, "padding");
  v14 = v12 + v13;
  if (!v8)
  {
    v12 = v12 + v13;
    if (v14 <= 0.0)
      return y;
LABEL_6:
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    v18 = CGRectOffset(v17, 0.0, -v12);
    return v18.origin.y;
  }
  if (v12 < 0.0 && v14 > 0.0)
    goto LABEL_6;
  return y;
}

- (double)_adjustedTargetVisibleTopByAligningNearestHeroForProposedTargetVisibleTop:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double MidY;
  double v28;
  _OWORD v29[2];
  uint64_t v30;
  _OWORD v31[2];
  int v32;
  _QWORD v33[5];
  _QWORD v34[8];
  _QWORD v35[4];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;
  _BYTE v40[168];
  uint64_t v41;
  CGRect v42;
  CGRect v43;

  v41 = *MEMORY[0x1E0C80C00];
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = -1;
  -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  v28 = v5;
  -[PXGLayout visibleRect](self, "visibleRect");
  PXEdgeInsetsInsetRect();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  PXRectGetCenter();
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = 0x7FEFFFFFFFFFFFFFLL;
  v14 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __100__PXCuratedLibraryLayout__adjustedTargetVisibleTopByAligningNearestHeroForProposedTargetVisibleTop___block_invoke;
  v34[3] = &unk_1E511C100;
  v34[6] = v15;
  v34[7] = v16;
  v34[4] = v35;
  v34[5] = &v36;
  -[PXCuratedLibraryLayout _enumerateHeroSpritesInRect:usingBlock:](self, "_enumerateHeroSpritesInRect:usingBlock:", v34, v7, v9, v11, v13);
  v17 = *((_DWORD *)v37 + 6);
  if (v17 != -1
    || (v33[0] = v14,
        v33[1] = 3221225472,
        v33[2] = __100__PXCuratedLibraryLayout__adjustedTargetVisibleTopByAligningNearestHeroForProposedTargetVisibleTop___block_invoke_2,
        v33[3] = &unk_1E511C128,
        v33[4] = &v36,
        -[PXGLayout enumerateVisibleAnchoringSpriteIndexesUsingBlock:](self, "enumerateVisibleAnchoringSpriteIndexesUsingBlock:", v33), v17 = *((_DWORD *)v37 + 6), v17 != -1))
  {
    v32 = *(_DWORD *)off_1E50B8298;
    memset(v31, 0, sizeof(v31));
    memset(v40, 0, 160);
    v30 = 0;
    memset(v29, 0, sizeof(v29));
    -[PXGLayout copyLayoutForSpritesInRange:entities:geometries:styles:infos:](self, "copyLayoutForSpritesInRange:entities:geometries:styles:infos:", v17 | 0x100000000, &v32, v31, v40, v29);
    PXRectWithCenterAndSize();
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    PXGSectionedSpriteTagDecompose();
    v42.origin.x = v19;
    v42.origin.y = v21;
    v42.size.width = v23;
    v42.size.height = v25;
    MidY = CGRectGetMidY(v42);
    v43.origin.x = v7;
    v43.origin.y = v9;
    v43.size.width = v11;
    v43.size.height = v13;
    a3 = MidY + CGRectGetHeight(v43) * -0.5 - v28;
  }
  _Block_object_dispose(v35, 8);
  _Block_object_dispose(&v36, 8);
  return a3;
}

- (double)adjustedTargetVisibleTopForProposedTargetVisibleTop:(double)a3 scrollingVelocity:(double)a4 decelerationRate:(int64_t *)a5
{
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  int64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  PXScrollSnapController *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  PXScrollSnapController *v31;
  double v32;
  double v33;
  double v34;
  _BOOL4 v35;
  double v36;
  _BOOL4 v37;
  double v38;
  double MaxY;
  double v40;
  double v41;
  double v42;
  double v43;
  double v45;
  double v47;
  CGRect v48;

  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout visibleRect](self, "visibleRect");
  v45 = v9;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[PXCuratedLibraryLayout fullyVisibleRect](self, "fullyVisibleRect");
  v47 = a4;
  objc_msgSend(v8, "scrollSnapMinimumSpeed");
  if (fabs(a4) < v16)
  {
    v18 = a3;
  }
  else
  {
    -[PXCuratedLibraryLayout spec](self, "spec");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "userInterfaceIdiom") == 4)
    {

LABEL_4:
      v18 = a3;
      goto LABEL_15;
    }

    v19 = -[PXCuratedLibraryLayout presentedZoomLevel](self, "presentedZoomLevel");
    if ((unint64_t)(v19 - 1) >= 2)
    {
      if (v19 != 3)
        goto LABEL_4;
      v25 = 2;
      v22 = v45;
      v23 = v15;
    }
    else
    {
      -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
      -[PXCuratedLibraryLayout viewModel](self, "viewModel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "styleGuide");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "secondaryToolbarPlacement") == 3)
      {
        objc_msgSend(v21, "secondaryToolbarContentInsets");
        objc_msgSend(v21, "secondaryToolbarSize");
      }
      v22 = v45;
      v23 = v15;
      -[PXCuratedLibraryLayout spec](self, "spec");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "sizeClass") == 1)
        objc_msgSend(v24, "layoutOrientation");
      PXEdgeInsetsInsetRect();

      v25 = 1;
    }
    v26 = [PXScrollSnapController alloc];
    PXEdgeInsetsBetweenRects();
    v31 = -[PXScrollSnapController initWithSnapBehavior:scrollAxis:visibleRect:visibilityInsets:scrollablePageSource:](v26, "initWithSnapBehavior:scrollAxis:visibleRect:visibilityInsets:scrollablePageSource:", v25, 1, self, v22, v11, v13, v23, v27, v28, v29, v30);
    objc_msgSend(v8, "scrollSnapMaximumAccelerationFactor");
    -[PXScrollSnapController setMaximumAccelerationFactor:](v31, "setMaximumAccelerationFactor:");
    objc_msgSend(v8, "scrollSnapMaximumDecelerationFactor");
    -[PXScrollSnapController setMaximumDecelerationFactor:](v31, "setMaximumDecelerationFactor:");
    objc_msgSend(v8, "scrollSnapMinimumSpeed");
    -[PXScrollSnapController setMinimumSpeed:](v31, "setMinimumSpeed:");
    a4 = v47;
    -[PXScrollSnapController adjustedTargetVisibleOriginForProposedTargetVisibleOrigin:scrollingVelocity:decelerationRate:](v31, "adjustedTargetVisibleOriginForProposedTargetVisibleOrigin:scrollingVelocity:decelerationRate:", a5, 0.0, a3, 0.0, v47);
    v18 = v32;

  }
LABEL_15:
  -[PXGSplitLayout padding](self, "padding");
  if (v33 > 0.0)
  {
    v34 = v33;
    if (a4 >= 0.0)
    {
      -[PXGLayout lastScrollDirection](self, "lastScrollDirection");
      v35 = v36 < 0.0;
    }
    else
    {
      v35 = 1;
    }
    if (a4 <= 0.0)
    {
      -[PXGLayout lastScrollDirection](self, "lastScrollDirection");
      v37 = v38 > 0.0;
    }
    else
    {
      v37 = 1;
    }
    -[PXGLayout visibleRect](self, "visibleRect");
    -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
    PXEdgeInsetsInsetRect();
    MaxY = CGRectGetMaxY(v48);
    -[PXGLayout contentSize](self, "contentSize");
    v41 = MaxY - v40;
    v42 = v34 + v41;
    if (v35)
    {
      if (PXFloatGreaterThanFloat())
        v43 = v42;
      else
        v43 = 0.0;
LABEL_26:
      v18 = v18 - v43;
      goto LABEL_32;
    }
    if (v37 && PXFloatGreaterThanFloat())
    {
      if (PXFloatGreaterThanFloat())
        v43 = v41;
      else
        v43 = 0.0;
      goto LABEL_26;
    }
  }
LABEL_32:

  return v18;
}

- (void)_enumerateHeroSpritesInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[PXCuratedLibraryLayout libraryBodyLayout](self, "libraryBodyLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", v10, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __65__PXCuratedLibraryLayout__enumerateHeroSpritesInRect_usingBlock___block_invoke;
  v21[3] = &unk_1E511C150;
  v22 = v10;
  v23 = v9;
  v21[4] = self;
  v19 = v10;
  v20 = v9;
  objc_msgSend(v19, "enumerateHeroSpritesInRect:usingBlock:", v21, v12, v14, v16, v18);

}

- (void)enumerateSectionBoundariesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a4;
  -[PXCuratedLibraryLayout libraryBodyLayout](self, "libraryBodyLayout");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PXGLayout convertPoint:fromLayout:](self, "convertPoint:fromLayout:", v10, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__PXCuratedLibraryLayout_enumerateSectionBoundariesWithOptions_usingBlock___block_invoke;
  v11[3] = &unk_1E5135B50;
  v12 = v6;
  v13 = v7;
  v14 = v8;
  v9 = v6;
  objc_msgSend(v10, "enumerateSectionBoundariesWithOptions:usingBlock:", a3, v11);

}

- (double)estimatedHeaderHeight
{
  void *v2;
  double v3;
  double v4;

  -[PXCuratedLibraryLayout _currentFloatingHeaderSpec](self, "_currentFloatingHeaderSpec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumTitleSubtitleHeight");
  v4 = v3;

  return v4;
}

- (double)bottomMargin
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;

  -[PXCuratedLibraryLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "zoomLevel");

  if (v4 == 2)
  {
    -[PXCuratedLibraryLayout spec](self, "spec");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "monthsLayoutMetrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v5 = 0.0;
  if (v4 == 1)
  {
    -[PXCuratedLibraryLayout spec](self, "spec");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "yearsLayoutMetrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = v7;
    objc_msgSend(v7, "padding");
    v5 = v9;

  }
  return v5;
}

- (CGRect)fullyVisibleRect
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[PXGLayout visibleRect](self, "visibleRect");
  -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  -[PXCuratedLibraryLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "styleGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "secondaryToolbarPlacement") == 2)
  {
    objc_msgSend(v4, "secondaryToolbarPadding");
    objc_msgSend(v4, "secondaryToolbarSize");
  }
  PXEdgeInsetsInsetRect();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGPoint)_adjustInitialVisibleRect:(CGRect)a3 inLayout:(id)a4 forRecentSection:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  double *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  id v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat MaxY;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  _QWORD v43[7];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  double *v49;
  uint64_t v50;
  uint64_t v51;
  CGPoint result;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = (double *)MEMORY[0x1E0C9D538];
  v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PXCuratedLibraryLayout libraryBodyLayout](self, "libraryBodyLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sublayoutAtIndex:loadIfNeeded:", a5, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "convertRect:fromLayout:", v11, x, y, width, height);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v53.origin.x = v17;
    v53.origin.y = v19;
    v53.size.width = v21;
    v53.size.height = v23;
    if (!CGRectIsNull(v53))
    {
      v24 = v15;
      -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
      PXEdgeInsetsForEdges();
      PXEdgeInsetsInsetRect();
      v25 = v54.origin.x;
      v26 = v54.origin.y;
      v27 = v54.size.width;
      v28 = v54.size.height;
      MaxY = CGRectGetMaxY(v54);
      v48 = 0;
      v49 = (double *)&v48;
      v50 = 0x2020000000;
      v51 = 0x7FF8000000000000;
      v44 = 0;
      v45 = &v44;
      v46 = 0x2020000000;
      v47 = 0;
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __78__PXCuratedLibraryLayout__adjustInitialVisibleRect_inLayout_forRecentSection___block_invoke;
      v43[3] = &unk_1E511C1A0;
      *(CGFloat *)&v43[6] = MaxY;
      v43[4] = &v48;
      v43[5] = &v44;
      objc_msgSend(v24, "enumerateRowsWithOptions:usingBlock:", 0, v43);
      objc_msgSend(v24, "buildingRowContentHeight", v49[3]);
      v31 = v30;
      objc_msgSend(v24, "buildingRowSpacing");
      v33 = v32;
      v34 = v31 + v32;
      if (PXFloatEqualToFloatWithTolerance() && *((_BYTE *)v45 + 24))
      {
        v26 = v49[3] - v28;
      }
      else
      {
        objc_msgSend(v14, "defaultInterlayoutSpacing");
        v36 = v35;
        if (v35 >= 0.0)
        {
          v55.origin.x = v25;
          v55.origin.y = v26;
          v55.size.width = v27;
          v55.size.height = v28;
          v37 = v33 - v36 + round((CGRectGetMinY(v55) - (v33 - v36)) / v34) * v34;
          v38 = -0.0;
          if (v37 < v26)
            v38 = v34;
          v39 = v37 + v38;
          if (v39 > v26)
            v26 = v39;
        }
      }
      v13 = v26 - v19;
      _Block_object_dispose(&v44, 8);
      _Block_object_dispose(&v48, 8);

    }
  }
  v40 = *v12;

  v41 = v40;
  v42 = v13;
  result.y = v42;
  result.x = v41;
  return result;
}

- (id)presentedItemsGeometryForDataSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[PXCuratedLibraryLayout presentedZoomLevel](self, "presentedZoomLevel") == 4)
  {
    -[PXCuratedLibraryLayout allPhotosLayout](self, "allPhotosLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentedItemsGeometryForDataSource:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  PXCuratedLibraryHitTestResult *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXCuratedLibraryLayout;
  -[PXGLayout hitTestResultForSpriteIndex:](&v12, sel_hitTestResultForSpriteIndex_, *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("PXGHitTestUserDataIdentifierItem")))
    goto LABEL_4;
  objc_msgSend(v3, "userData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v7 = [PXCuratedLibraryHitTestResult alloc];
    objc_msgSend(v3, "spriteReference");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "userData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PXCuratedLibraryHitTestResult initWithControl:spriteReference:layout:assetReference:](v7, "initWithControl:spriteReference:layout:assetReference:", 1, v4, v8, v9);

    v3 = (void *)v10;
LABEL_4:

  }
  return v3;
}

- (void)enumerateScrollablePagesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a4;
  -[PXCuratedLibraryLayout libraryBodyLayout](self, "libraryBodyLayout");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PXGLayout convertPoint:fromLayout:](self, "convertPoint:fromLayout:", v10, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__PXCuratedLibraryLayout_enumerateScrollablePagesWithOptions_usingBlock___block_invoke;
  v11[3] = &unk_1E5135B50;
  v12 = v6;
  v13 = v7;
  v14 = v8;
  v9 = v6;
  objc_msgSend(v10, "enumerateScrollablePagesWithOptions:usingBlock:", a3, v11);

}

- (id)createDefaultAnimationForCurrentContext
{
  return -[PXGLayout createCuratedLibraryLayoutAnimationIfNeededWithContext:](self, "createCuratedLibraryLayoutAnimationIfNeededWithContext:", 1);
}

- (id)createCuratedLibraryLayoutTransitionIfNeededWithContext:(int64_t)a3
{
  return +[PXCuratedLibraryLayoutAnimationHelper createTransitionIfNeededForLayout:context:](PXCuratedLibraryLayoutAnimationHelper, "createTransitionIfNeededForLayout:context:", self, a3);
}

- (id)assetCollectionsIteratorForContentInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXCuratedLibraryLayout _currentBodyLayout](self, "_currentBodyLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8
    || (-[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", v8, x, y, width, height),
        v9 = v16.origin.x,
        v10 = v16.origin.y,
        v11 = v16.size.width,
        v12 = v16.size.height,
        CGRectIsNull(v16))
    || (PXPointIsNull() & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v8, "assetCollectionsIteratorForContentInRect:", v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = _Block_copy(v13);

  return v14;
}

- (id)assetsIteratorForContentInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXCuratedLibraryLayout _currentBodyLayout](self, "_currentBodyLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8
    || (-[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", v8, x, y, width, height),
        v9 = v16.origin.x,
        v10 = v16.origin.y,
        v11 = v16.size.width,
        v12 = v16.size.height,
        CGRectIsNull(v16))
    || (PXPointIsNull() & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v8, "assetsIteratorForContentInRect:", v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = _Block_copy(v13);

  return v14;
}

- (id)topMostAssetCollectionInRect:(CGRect)a3 ignoreChapterHeaders:(BOOL)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  PXCuratedLibrarySectionedLayout *libraryBodyLayout;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__39544;
  v31 = __Block_byref_object_dispose__39545;
  v32 = 0;
  -[PXCuratedLibraryLayout viewModel](self, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "zoomLevel") == 4)
  {
    objc_msgSend(v10, "currentDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstAssetCollection");
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "minimumVisibleHeightForTopMostSection");
    v15 = v14;

    libraryBodyLayout = self->_libraryBodyLayout;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __76__PXCuratedLibraryLayout_topMostAssetCollectionInRect_ignoreChapterHeaders___block_invoke;
    v18[3] = &unk_1E511C280;
    v21 = x;
    v22 = y;
    v23 = width;
    v24 = height;
    v25 = v15;
    v18[4] = self;
    v20 = &v27;
    v26 = a4;
    v19 = v10;
    -[PXCuratedLibrarySectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](libraryBodyLayout, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v18, x, y, width, height);

    v12 = (id)v28[5];
  }

  _Block_object_dispose(&v27, 8);
  return v12;
}

- (id)topMostAssetCollectionReference
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  __int128 v8;
  void *v9;
  _OWORD v11[2];

  -[PXCuratedLibraryLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout visibleRect](self, "visibleRect");
  -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  PXEdgeInsetsInsetRect();
  -[PXCuratedLibraryLayout topMostAssetCollectionInRect:ignoreChapterHeaders:](self, "topMostAssetCollectionInRect:ignoreChapterHeaders:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "assetsDataSourceManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataSourceForZoomLevel:", objc_msgSend(v3, "zoomLevel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "firstAssetCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = objc_alloc((Class)off_1E50B1668);
  v8 = *((_OWORD *)off_1E50B8778 + 1);
  v11[0] = *(_OWORD *)off_1E50B8778;
  v11[1] = v8;
  v9 = (void *)objc_msgSend(v7, "initWithAssetCollection:keyAssetReference:indexPath:", v4, 0, v11);

  return v9;
}

- (void)enumerateVisibleAssetsSectionSublayoutsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  -[PXCuratedLibraryLayout libraryBodyLayout](self, "libraryBodyLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__PXCuratedLibraryLayout_enumerateVisibleAssetsSectionSublayoutsUsingBlock___block_invoke;
  v15[3] = &unk_1E513B940;
  v16 = v4;
  v14 = v4;
  objc_msgSend(v5, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v15, v7, v9, v11, v13);

}

- (void)enumerateVisibleAssetReferencesUsingBlock:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  -[PXGLayout visibleRect](self, "visibleRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__PXCuratedLibraryLayout_enumerateVisibleAssetReferencesUsingBlock___block_invoke;
  v14[3] = &unk_1E51215D8;
  v14[4] = self;
  v15 = v4;
  v13 = v4;
  -[PXGLayout enumerateSpritesInRect:usingBlock:](self, "enumerateSpritesInRect:usingBlock:", v14, v6, v8, v10, v12);

}

- (CGRect)sectionBoundariesForAssetCollectionReference:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  v4 = a3;
  -[PXCuratedLibraryLayout libraryBodyLayout](self, "libraryBodyLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionBoundariesForAssetCollectionReference:", v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[PXGLayout convertRect:fromDescendantLayout:](self, "convertRect:fromDescendantLayout:", v5, v7, v9, v11, v13);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)setLastHitSpriteReference:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_lastHitSpriteReference, a3);
  v5 = a3;
  -[PXCuratedLibrarySectionedLayout setLastHitSpriteReference:](self->_libraryBodyLayout, "setLastHitSpriteReference:", v5);

}

- (unint64_t)behaviorForCaptureSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 2;
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v16;

  v7 = a4;
  if (self->_contentBackgroundSpriteIndex == a3)
  {
    -[PXCuratedLibraryLayout viewModel](self, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "specManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "spec");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;

  }
  else
  {
    if (self->_blurredBackgroundSpriteIndex != a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryLayout.m"), 1842, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (CGPoint)anchor:(id)a3 visibleRectOriginForProposedVisibleRect:(CGRect)a4 forLayout:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  PXCuratedLibraryLayout *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  CGPoint result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = (PXCuratedLibraryLayout *)a5;
  if (v11 != self)
    goto LABEL_11;
  objc_msgSend(a3, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("fromZoomLevel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("toZoomLevel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  if ((unint64_t)(v16 - 1) >= 2)
  {
    if (v16 != 3 || v14 != 4)
      goto LABEL_8;
    -[PXCuratedLibraryLayout _adjustedTargetVisibleTopByAligningNearestHeroForProposedTargetVisibleTop:](v11, "_adjustedTargetVisibleTopByAligningNearestHeroForProposedTargetVisibleTop:", y);
  }
  else
  {
    v24 = 0;
    -[PXCuratedLibraryLayout adjustedTargetVisibleTopForProposedTargetVisibleTop:scrollingVelocity:decelerationRate:](v11, "adjustedTargetVisibleTopForProposedTargetVisibleTop:scrollingVelocity:decelerationRate:", &v24, y, NAN);
  }
  y = v17;
LABEL_8:
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("fromBottomPaddingAreaIsFullyVisible"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("fromBottomPaddingAreaIsFullyVisible"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLValue");

    -[PXCuratedLibraryLayout _adjustedTargetVisibleTopToAccomodateFromBottomPaddedAreaVisibility:proposedVisibleRect:](v11, "_adjustedTargetVisibleTopToAccomodateFromBottomPaddedAreaVisibility:proposedVisibleRect:", v20, x, y, width, height);
    y = v21;
  }

LABEL_11:
  v22 = x;
  v23 = y;
  result.y = v23;
  result.x = v22;
  return result;
}

- (void)viewModel:(id)a3 willTransitionFromZoomLevel:(int64_t)a4 toZoomLevel:(int64_t)a5
{
  void *v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  -[PXCuratedLibraryLayout libraryBodyLayout](self, "libraryBodyLayout", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dominantHeroPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryLayout setDominantHeroPreferencesBeforeTransition:](self, "setDominantHeroPreferencesBeforeTransition:", v8);

  if (a4 >= a5)
    v9 = a5;
  else
    v9 = a4;
  if (a4 <= a5)
    v10 = a5;
  else
    v10 = a4;
  if (v9 == 1 && v10 == 2)
  {
    -[PXCuratedLibraryLayout spec](self, "spec");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "allowsModularLayoutForZoomLevel:sizeClass:orientation:layoutStyle:", 2, objc_msgSend(v11, "sizeClass"), objc_msgSend(v11, "layoutOrientation"), objc_msgSend(v11, "layoutStyle"));

    if (v13)
      objc_msgSend(v14, "setPrefersDominantHero:forZoomLevel:", 1, 2);

  }
}

- (void)viewModel:(id)a3 didTransitionFromZoomLevel:(int64_t)a4 toZoomLevel:(int64_t)a5
{
  void *v6;
  void *v7;

  -[PXCuratedLibraryLayout dominantHeroPreferencesBeforeTransition](self, "dominantHeroPreferencesBeforeTransition", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryLayout libraryBodyLayout](self, "libraryBodyLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDominantHeroPreferences:", v6);

  -[PXCuratedLibraryLayout setDominantHeroPreferencesBeforeTransition:](self, "setDominantHeroPreferencesBeforeTransition:", 0);
}

- (id)viewModel:(id)a3 dominantAssetCollectionReferenceForZoomLevel:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PXCuratedLibraryLayout libraryBodyLayout](self, "libraryBodyLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel:dominantAssetCollectionReferenceForZoomLevel:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)viewModel:(id)a3 transitionTypeFromZoomLevel:(int64_t)a4 toZoomLevel:(int64_t)a5
{
  void *v8;
  void *v9;
  int64_t v10;

  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryLayout spec](self, "spec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "allowsModularLayoutForZoomLevel:sizeClass:orientation:layoutStyle:", a4, objc_msgSend(v9, "sizeClass"), objc_msgSend(v9, "layoutOrientation"), objc_msgSend(v9, "layoutStyle")) & 1) != 0)
  {
    v10 = 2;
  }
  else if (objc_msgSend(v8, "allowsModularLayoutForZoomLevel:sizeClass:orientation:layoutStyle:", a5, objc_msgSend(v9, "sizeClass"), objc_msgSend(v9, "layoutOrientation"), objc_msgSend(v9, "layoutStyle")))
  {
    v10 = 2;
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (id)axLocalizedLabel
{
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  void *v9;

  -[PXCuratedLibraryLayout viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "zoomLevel");

  v6 = 0;
  v7 = CFSTR("PXCuratedLibraryYearsZoomLevelButtonTitle");
  switch(v5)
  {
    case 0:
      return v6;
    case 1:
      goto LABEL_5;
    case 2:
      v7 = CFSTR("PXCuratedLibraryMonthsZoomLevelButtonTitle");
      goto LABEL_5;
    case 3:
      v7 = CFSTR("PXCuratedLibraryDaysZoomLevelButtonTitle");
      goto LABEL_5;
    case 4:
      v7 = CFSTR("PXCuratedLibraryAllPhotosZoomLevelButtonTitle");
LABEL_5:
      PXLocalizedStringFromTable(v7, CFSTR("PhotosUICore"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryLayout.m"), 1958, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  NSStringFromSelector(sel_enableNewActionMenu);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", v7))
  {

  }
  else
  {
    NSStringFromSelector(sel_enableContentFiltering);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqualToString:", v8);

    if (!v9)
      goto LABEL_10;
  }
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_9:
      p_updateFlags->needsUpdate = needsUpdate | 0x30;
      goto LABEL_10;
    }
LABEL_8:
    if ((self->_updateFlags.updated & 0x30) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryLayout settings:changedValueForKey:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXCuratedLibraryLayout.m"), 1965, CFSTR("invalidating %lu after it already has been updated"), 48, v15);

      abort();
    }
    goto LABEL_9;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_8;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 48;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
LABEL_10:

}

- (CGRect)presentedVisibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_presentedVisibleRect.origin.x;
  y = self->_presentedVisibleRect.origin.y;
  width = self->_presentedVisibleRect.size.width;
  height = self->_presentedVisibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (PXGSpriteReference)lastHitSpriteReference
{
  return self->_lastHitSpriteReference;
}

- (PXAssetCollectionReference)lastPresentedDayAssetCollectionReference
{
  return self->_lastPresentedDayAssetCollectionReference;
}

- (void)setLastPresentedDayAssetCollectionReference:(id)a3
{
  objc_storeStrong((id *)&self->_lastPresentedDayAssetCollectionReference, a3);
}

- (id)dominantHeroPreferencesBeforeTransition
{
  return self->_dominantHeroPreferencesBeforeTransition;
}

- (void)setDominantHeroPreferencesBeforeTransition:(id)a3
{
  objc_storeStrong(&self->_dominantHeroPreferencesBeforeTransition, a3);
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void)setLibraryFilterState:(id)a3
{
  objc_storeStrong((id *)&self->_libraryFilterState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong(&self->_dominantHeroPreferencesBeforeTransition, 0);
  objc_storeStrong((id *)&self->_lastPresentedDayAssetCollectionReference, 0);
  objc_storeStrong(&self->_lastVisibleDominantObjectReference, 0);
  objc_storeStrong((id *)&self->_lastHitSpriteReference, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_floatingHeaderLayout, 0);
  objc_storeStrong((id *)&self->_allPhotosBodyLayout, 0);
  objc_storeStrong((id *)&self->_libraryBodyLayout, 0);
  objc_storeStrong((id *)&self->_blurredBackgroundEffect, 0);
  objc_storeStrong((id *)&self->_statusBarGradientAnimator, 0);
  objc_storeStrong((id *)&self->_spriteProbe, 0);
  objc_storeStrong((id *)&self->_preferredVisibleAreaAnchorsByZoomLevels, 0);
  objc_storeStrong((id *)&self->_lastVisibleAreaAnchorsByZoomLevels, 0);
  objc_storeStrong((id *)&self->_summaryHelper, 0);
}

void __68__PXCuratedLibraryLayout_enumerateVisibleAssetReferencesUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v10;
  void *v11;
  id v12;

  v10 = a7;
  if (*(_BYTE *)(a6 + 1) == 2)
  {
    v12 = v10;
    objc_msgSend(*(id *)(a1 + 32), "objectReferenceForSpriteIndex:", a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      PXRectWithCenterAndSize();
      objc_msgSend(*(id *)(a1 + 32), "convertRect:fromDescendantLayout:", v12);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

    v10 = v12;
  }

}

uint64_t __76__PXCuratedLibraryLayout_enumerateVisibleAssetsSectionSublayoutsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__PXCuratedLibraryLayout_topMostAssetCollectionInRect_ignoreChapterHeaders___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, uint64_t a7, BOOL *a8)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  _QWORD v20[2];
  int64x2_t v21;
  CGRect v22;
  CGRect v23;

  v22 = CGRectIntersection(*(CGRect *)&a3, *(CGRect *)(a1 + 56));
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  if (!CGRectIsEmpty(v22))
  {
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    if (CGRectGetHeight(v23) >= *(double *)(a1 + 88))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1176), "presentedDataSource");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = objc_msgSend(v15, "identifier");
      v20[1] = a2;
      v21 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      objc_msgSend(v15, "assetCollectionAtSectionIndexPath:", v20);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

      if (*(_BYTE *)(a1 + 96))
        v19 = !PXCuratedLibraryAssetsCollectionRepresentsChapterHeader(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), objc_msgSend(*(id *)(a1 + 40), "zoomLevel"));
      else
        v19 = 1;
      *a8 = v19;

    }
  }
}

uint64_t __66__PXCuratedLibraryLayout_dateIntervalFutureForContentInRect_type___block_invoke()
{
  return 0;
}

void __64__PXCuratedLibraryLayout__createAnchorForTransitionToZoomLevel___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "objectReferenceForSpriteIndex:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "setLastVisibleDominantObjectReference:", v6);
    v6 = v7;
    *a4 = 1;
  }

}

void __64__PXCuratedLibraryLayout__createAnchorForTransitionToZoomLevel___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  __int128 v12;
  uint64_t v13;
  int v14;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__PXCuratedLibraryLayout__createAnchorForTransitionToZoomLevel___block_invoke_3;
  v8[3] = &unk_1E511C1F0;
  v14 = *(_DWORD *)(a1 + 72);
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v12 = *(_OWORD *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 64);
  v11 = v3;
  v7 = v3;
  objc_msgSend(v4, "enumerateVisibleAnchoringSpriteIndexesUsingBlock:", v8);

}

void __64__PXCuratedLibraryLayout__createAnchorForTransitionToZoomLevel___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  double v18;
  double v19;
  _BOOL4 v20;
  int v21;
  double v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  int v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  CGRect v51;
  CGRect v52;

  if (*(_DWORD *)(a1 + 80) == (_DWORD)a2)
  {
    v4 = *(id *)(a1 + 32);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "objectReferenceForSpriteIndex:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 40), "spriteReferenceForSpriteIndex:objectReference:", a2, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(double *)off_1E50B8020;
  v8 = *((double *)off_1E50B8020 + 2);
  v9 = *(_QWORD *)(a1 + 56);
  if ((unint64_t)(v9 - 1) < 2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "viewModel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "assetsDataSourceManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dataSourceForZoomLevel:", *(_QWORD *)(a1 + 56));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "objectReferenceNearestToObjectReference:", v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        objc_msgSend(v14, "indexPathForObjectReference:", v15);
      if (*(_QWORD *)off_1E50B7E98)
      {
        v21 = 1;
        v20 = objc_msgSend(v14, "numberOfSections") == 1;
      }
      else
      {
        v20 = 0;
        v21 = 0;
      }
      if (*(_QWORD *)(a1 + 72) == 3
        && *(_QWORD *)(a1 + 56) == 2
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v23 = v5;
        objc_msgSend(v15, "assetCollection");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v23;
        objc_msgSend(v23, "keyAssetReference");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "asset");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "creationDate");
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v50, "startDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "endDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v49, "px_isBetweenDate:andDate:", v26, v27);

        if ((v47 & 1) != 0)
        {
          v10 = 0;
        }
        else
        {
          objc_msgSend(v50, "startDate");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "timeIntervalSinceDate:", v43);
          v45 = v44;

          if (v45 < 0.0)
            v10 = 1;
          else
            v10 = -1;
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v20 = 0;
      v21 = 0;
      v10 = 0;
    }
    objc_msgSend(*(id *)(a1 + 40), "libraryBodyLayout");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "spec");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "defaultInterlayoutSpacingForZoomLevel:", *(_QWORD *)(a1 + 56));
    v31 = v30 + v30;

    v32 = -0.0;
    if (v21)
      v33 = -0.0;
    else
      v33 = v31;
    v19 = v7 + v33;
    if (!v20)
      v32 = v31;
    v18 = v8 + v32;
    if (*(_QWORD *)(a1 + 72) == 1 && *(_QWORD *)(a1 + 56) == 2)
    {
      objc_msgSend(*(id *)(a1 + 40), "spec");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v34, "allowsPaginatedScrollingInYearsAndMonths"))
      {
        +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "allowsModularLayoutForZoomLevel:sizeClass:orientation:layoutStyle:", *(_QWORD *)(a1 + 56), objc_msgSend(v34, "sizeClass"), objc_msgSend(v34, "layoutOrientation"), objc_msgSend(v34, "layoutStyle"));

        if (v36)
        {
          objc_msgSend(*(id *)(a1 + 40), "visibleRect");
          v18 = CGRectGetHeight(v51) / 3.0;
          v19 = v18;
        }
      }

    }
    v11 = 1;
  }
  else
  {
    if (v9 != 3)
    {
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("PXCuratedLibraryLayout.m"), 1498, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      v10 = 0;
      v11 = 1;
      goto LABEL_13;
    }
    objc_msgSend(*(id *)(a1 + 40), "spec");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isTopSafeAreaFullyCovered");

    if ((v17 & 1) != 0)
    {
      v10 = 0;
      v11 = 3;
LABEL_13:
      v18 = v8;
      v19 = v7;
      goto LABEL_39;
    }
    objc_msgSend(*(id *)(a1 + 40), "safeAreaInsets");
    v10 = 0;
    v19 = -v22;
    v11 = 3;
    v18 = v8;
  }
LABEL_39:
  objc_msgSend(*(id *)(a1 + 48), "keepVisiblePortionOfSpriteWithReference:referencingOptions:padding:visuallyStableForAttribute:", v6, v11, 1, v7, *((double *)off_1E50B8020 + 1), v8, *((double *)off_1E50B8020 + 3));
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "safeAreaInsets");
    v38 = v37;
    objc_msgSend(*(id *)(a1 + 40), "visibleRect");
    v39 = CGRectGetHeight(v52) * 0.5 - v38;
    v40 = *(void **)(a1 + 48);
    if (v10 < 0)
    {
      objc_msgSend(v40, "keepEdge:ofSpriteWithReference:referencingOptions:lessThanOrEqualToVisibleEdge:offset:", 3, v6, v11, 1, v39);
      goto LABEL_45;
    }
    v41 = v6;
    v42 = v11;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "keepEdge:ofSpriteWithReference:referencingOptions:lessThanOrEqualToVisibleEdge:offset:", 3, v6, v11, 3, -v18);
    v40 = *(void **)(a1 + 48);
    v41 = v6;
    v42 = v11;
    v39 = v19;
  }
  objc_msgSend(v40, "keepEdge:ofSpriteWithReference:referencingOptions:greaterThanOrEqualToVisibleEdge:offset:", 1, v41, v42, 1, v39);
LABEL_45:

}

uint64_t __51__PXCuratedLibraryLayout__noteAnimation_isRunning___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setZoomLevelTransitionPhase:", 2 * *(unsigned __int8 *)(a1 + 32));
}

uint64_t __51__PXCuratedLibraryLayout__noteAnimation_isRunning___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "zoomLevelTransitionDidBegin:", *(_QWORD *)(a1 + 40));
}

uint64_t __73__PXCuratedLibraryLayout_enumerateScrollablePagesWithOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7, double a8)
{
  uint64_t v11;
  CGRect v13;

  v11 = *(_QWORD *)(a1 + 32);
  v13 = CGRectOffset(*(CGRect *)&a5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48));
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, CGPoint, __n128, CGSize, __n128))(v11 + 16))(v11, a2, a3, a4, v13.origin, *(__n128 *)&v13.origin.y, v13.size, *(__n128 *)&v13.size.height);
}

void __78__PXCuratedLibraryLayout__adjustInitialVisibleRect_inLayout_forRecentSection___block_invoke(uint64_t a1, _BYTE *a2, double a3, double a4, double a5, double a6)
{
  CGRectGetMaxY(*(CGRect *)&a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  *a2 = 1;
}

double __67__PXCuratedLibraryLayout_createAnchorForScrollingToInitialPosition__block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id *v11;
  id v12;
  id WeakRetained;
  double v14;
  double v15;

  v11 = (id *)(a1 + 32);
  v12 = a2;
  WeakRetained = objc_loadWeakRetained(v11);
  objc_msgSend(WeakRetained, "_adjustInitialVisibleRect:inLayout:forRecentSection:", v12, *(_QWORD *)(a1 + 40), a3, a4, a5, a6);
  v15 = v14;

  return v15;
}

uint64_t __75__PXCuratedLibraryLayout_enumerateSectionBoundariesWithOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7, double a8)
{
  uint64_t v11;
  CGRect v13;

  v11 = *(_QWORD *)(a1 + 32);
  v13 = CGRectOffset(*(CGRect *)&a5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48));
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, CGPoint, __n128, CGSize, __n128))(v11 + 16))(v11, a2, a3, a4, v13.origin, *(__n128 *)&v13.origin.y, v13.size, *(__n128 *)&v13.size.height);
}

uint64_t __65__PXCuratedLibraryLayout__enumerateHeroSpritesInRect_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  uint64_t v13;
  uint64_t v14;

  v13 = *(_QWORD *)(a1 + 48);
  v14 = objc_msgSend(*(id *)(a1 + 32), "convertSpriteIndex:fromDescendantLayout:", a2, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "convertRect:fromDescendantLayout:", *(_QWORD *)(a1 + 40), a4, a5, a6, a7);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v13, v14, a3);
}

uint64_t __100__PXCuratedLibraryLayout__adjustedTargetVisibleTopByAligningNearestHeroForProposedTargetVisibleTop___block_invoke(uint64_t a1, int a2)
{
  uint64_t result;
  double v5;
  uint64_t v6;

  result = PXRectShortestDistanceToPoint();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v5 < *(double *)(v6 + 24))
  {
    *(double *)(v6 + 24) = v5;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }
  return result;
}

uint64_t __100__PXCuratedLibraryLayout__adjustedTargetVisibleTopByAligningNearestHeroForProposedTargetVisibleTop___block_invoke_2(uint64_t result, int a2, uint64_t a3, _BYTE *a4)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

id __54__PXCuratedLibraryLayout__updateFloatingHeaderButtons__block_invoke(uint64_t a1)
{
  void *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "enableNewActionMenu"))
  {
    objc_msgSend(*(id *)(a1 + 40), "ellipsisButtonActionPerformerWithAssetCollectionReferenceProvider:", *(_QWORD *)(a1 + 48));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

uint64_t __50__PXCuratedLibraryLayout__updateContentBackground__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float32x2_t *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v13;
  uint64_t v14;
  uint64_t result;
  CGFloat Width;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v5 = *(float32x2_t **)(a3 + 16);
  v6 = *(double *)(a1 + 40);
  v7 = *(double *)(a1 + 48);
  v8 = *(double *)(a1 + 56);
  v9 = *(double *)(a1 + 64);
  v22.origin.x = v6;
  v22.origin.y = v7;
  v22.size.width = v8;
  v22.size.height = v9;
  MidX = CGRectGetMidX(v22);
  v23.origin.x = v6;
  v23.origin.y = v7;
  v23.size.width = v8;
  v23.size.height = v9;
  MidY = CGRectGetMidY(v23);
  v24.origin.x = v6;
  v24.origin.y = v7;
  v24.size.width = v8;
  v24.size.height = v9;
  Width = CGRectGetWidth(v24);
  v25.origin.x = v6;
  v25.origin.y = v7;
  v25.size.width = v8;
  v25.size.height = v9;
  Height = CGRectGetHeight(v25);
  v13.f64[0] = Width;
  v13.f64[1] = Height;
  *(CGFloat *)v5 = MidX;
  *(CGFloat *)&v5[1] = MidY;
  v5[2] = (float32x2_t)0x406A400000000000;
  v5[3] = vcvt_f32_f64(v13);
  *(float *)&Height = *(double *)(a1 + 72);
  **(_DWORD **)(a3 + 24) = LODWORD(Height);
  v14 = *(_QWORD *)(a3 + 32);
  *(_BYTE *)(v14 + 1) = 5;
  __asm { FMOV            V0.2S, #1.0 }
  *(_QWORD *)(v14 + 8) = _D0;
  *(_WORD *)(*(_QWORD *)(a3 + 32) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 32) + 1172);
  result = PXGSectionedSpriteTagMake();
  *(_QWORD *)(*(_QWORD *)(a3 + 32) + 24) = result;
  return result;
}

void __50__PXCuratedLibraryLayout__updateBlurredBackground__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float32x2_t *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v13;
  uint64_t v14;
  char v15;
  float32x2_t *v16;
  float v17;
  __int128 v18;
  int v19;
  void *v20;
  void *v21;
  CGFloat Width;
  _QWORD v23[5];
  int v24;
  __int128 v25;
  __int128 v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v5 = *(float32x2_t **)(a3 + 16);
  v6 = *(double *)(a1 + 40);
  v7 = *(double *)(a1 + 48);
  v8 = *(double *)(a1 + 56);
  v9 = *(double *)(a1 + 64);
  v27.origin.x = v6;
  v27.origin.y = v7;
  v27.size.width = v8;
  v27.size.height = v9;
  MidX = CGRectGetMidX(v27);
  v28.origin.x = v6;
  v28.origin.y = v7;
  v28.size.width = v8;
  v28.size.height = v9;
  MidY = CGRectGetMidY(v28);
  v29.origin.x = v6;
  v29.origin.y = v7;
  v29.size.width = v8;
  v29.size.height = v9;
  Width = CGRectGetWidth(v29);
  v30.origin.x = v6;
  v30.origin.y = v7;
  v30.size.width = v8;
  v30.size.height = v9;
  Height = CGRectGetHeight(v30);
  v13.f64[0] = Width;
  v13.f64[1] = Height;
  *(CGFloat *)v5 = MidX;
  *(CGFloat *)&v5[1] = MidY;
  v5[2] = (float32x2_t)0x402A000000000000;
  v5[3] = vcvt_f32_f64(v13);
  *(float *)&Height = *(double *)(a1 + 72);
  v14 = *(_QWORD *)(a3 + 24);
  *(_DWORD *)v14 = LODWORD(Height);
  *(float32x4_t *)(v14 + 4) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(a1 + 80)), *(float64x2_t *)(a1 + 96));
  if (*(_WORD *)(*(_QWORD *)(a1 + 32) + 1152))
    v15 = 9;
  else
    v15 = 0;
  v16 = *(float32x2_t **)(a3 + 32);
  v16->i8[1] = v15;
  v17 = *(double *)(a1 + 112);
  v16[1] = vmul_n_f32(v5[3], v17);
  *(_WORD *)(*(_QWORD *)(a3 + 32) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 32) + 1152);
  v18 = *((_OWORD *)off_1E50B8778 + 1);
  v25 = *(_OWORD *)off_1E50B8778;
  v26 = v18;
  *(_QWORD *)(*(_QWORD *)(a3 + 32) + 24) = PXGSectionedSpriteTagMake();
  v19 = **(_DWORD **)(a3 + 8);
  objc_msgSend(*(id *)(a1 + 32), "entityManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "effectComponent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __50__PXCuratedLibraryLayout__updateBlurredBackground__block_invoke_2;
  v23[3] = &unk_1E5126CC8;
  v24 = v19;
  v23[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v21, "performChanges:", v23);

}

void __50__PXCuratedLibraryLayout__updateBlurredBackground__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1160);
  v4 = a2;
  LODWORD(v3) = objc_msgSend(v3, "effectId");
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "mutableEffectIds");

  *(_DWORD *)(v6 + 4 * *(unsigned int *)(a1 + 40)) = (_DWORD)v3;
}

void __32__PXCuratedLibraryLayout_update__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setIsResetting:", 0);
  objc_msgSend(v2, "setIsNavigating:", 0);

}

@end
