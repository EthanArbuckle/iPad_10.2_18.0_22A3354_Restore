@implementation PXDisplayAssetCombinedOverlayView

- (PXDisplayAssetCombinedOverlayView)initWithFrame:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetCombinedOverlayView.m"), 43, CFSTR("%s is not available as initializer"), "-[PXDisplayAssetCombinedOverlayView initWithFrame:]");

  abort();
}

- (PXDisplayAssetCombinedOverlayView)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetCombinedOverlayView.m"), 47, CFSTR("%s is not available as initializer"), "-[PXDisplayAssetCombinedOverlayView initWithCoder:]");

  abort();
}

- (PXDisplayAssetCombinedOverlayView)initWithViewModel:(id)a3
{
  id v5;
  PXDisplayAssetCombinedOverlayView *v6;
  uint64_t v7;
  PXUpdater *updater;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXDisplayAssetCombinedOverlayView;
  v6 = -[PXDisplayAssetCombinedOverlayView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v6, sel__setNeedsUpdate);
    updater = v6->_updater;
    v6->_updater = (PXUpdater *)v7;

    -[PXUpdater addUpdateSelector:](v6->_updater, "addUpdateSelector:", sel__updateCanShowLoadingProgress);
    -[PXUpdater addUpdateSelector:](v6->_updater, "addUpdateSelector:", sel__updateLivePhotoBadge);
    -[PXUpdater addUpdateSelector:](v6->_updater, "addUpdateSelector:", sel__updateLoadingFailureBadgeView);
    -[PXUpdater addUpdateSelector:](v6->_updater, "addUpdateSelector:", sel__updateLoadingProgressBadgeView);
    -[PXUpdater addUpdateSelector:](v6->_updater, "addUpdateSelector:", sel__updateImageAnalysisOverlay);
    -[PXUpdater addUpdateSelector:](v6->_updater, "addUpdateSelector:", sel__updateLayout);
    objc_storeStrong((id *)&v6->_viewModel, a3);
    -[PXDisplayAssetViewModel registerChangeObserver:context:](v6->_viewModel, "registerChangeObserver:context:", v6, ViewModelObservationContext_132663);
    -[PXDisplayAssetCombinedOverlayView _invalidateCanShowLoadingProgress](v6, "_invalidateCanShowLoadingProgress");
    -[PXDisplayAssetCombinedOverlayView _invalidateLivePhotoBadge](v6, "_invalidateLivePhotoBadge");
    -[PXDisplayAssetCombinedOverlayView _invalidateLoadingFailureBadgeView](v6, "_invalidateLoadingFailureBadgeView");
    -[PXDisplayAssetCombinedOverlayView _invalidateLoadingProgressBadgeView](v6, "_invalidateLoadingProgressBadgeView");
    -[PXDisplayAssetCombinedOverlayView _invalidateImageAnalysisOverlay](v6, "_invalidateImageAnalysisOverlay");
    -[PXDisplayAssetCombinedOverlayView _invalidateLayout](v6, "_invalidateLayout");
  }

  return v6;
}

- (void)setViewportSize:(CGSize)a3
{
  if (a3.width != self->_viewportSize.width || a3.height != self->_viewportSize.height)
  {
    self->_viewportSize = a3;
    -[PXDisplayAssetCombinedOverlayView _invalidateLayout](self, "_invalidateLayout");
  }
}

- (void)setCanShowLoadingProgress:(BOOL)a3
{
  if (self->_canShowLoadingProgress != a3)
  {
    self->_canShowLoadingProgress = a3;
    -[PXDisplayAssetCombinedOverlayView _invalidateLoadingProgressBadgeView](self, "_invalidateLoadingProgressBadgeView");
  }
}

- (void)_ensureLivePhotoBadgeView
{
  PXLivePhotoBadgeView *v3;
  PXLivePhotoBadgeView *livePhotoBadgeView;

  if (!self->_livePhotoBadgeView)
  {
    v3 = objc_alloc_init(PXLivePhotoBadgeView);
    livePhotoBadgeView = self->_livePhotoBadgeView;
    self->_livePhotoBadgeView = v3;

    -[PXLivePhotoBadgeView setDelegate:](self->_livePhotoBadgeView, "setDelegate:", self);
    -[PXDisplayAssetCombinedOverlayView addSubview:](self, "addSubview:", self->_livePhotoBadgeView);
    -[PXDisplayAssetCombinedOverlayView _invalidateLayout](self, "_invalidateLayout");
  }
}

- (void)_ensureLoadingFailureBadgeView
{
  PXLoadingFailureBadgeView *v3;
  PXLoadingFailureBadgeView *v4;
  PXLoadingFailureBadgeView *loadingFailureBadgeView;

  if (!self->_loadingFailureBadgeView)
  {
    +[PXLoadingFailureBadgeView sizeForSizeClass:](PXLoadingFailureBadgeView, "sizeForSizeClass:", 2);
    v3 = [PXLoadingFailureBadgeView alloc];
    PXRectWithOriginAndSize();
    v4 = -[PXLoadingFailureBadgeView initWithFrame:](v3, "initWithFrame:");
    loadingFailureBadgeView = self->_loadingFailureBadgeView;
    self->_loadingFailureBadgeView = v4;

    -[PXDisplayAssetCombinedOverlayView addSubview:](self, "addSubview:", self->_loadingFailureBadgeView);
    -[PXDisplayAssetCombinedOverlayView _invalidateLayout](self, "_invalidateLayout");
  }
}

- (void)_ensureLoadingProgressBadgeView
{
  PXRoundProgressView *v3;
  PXRoundProgressView *v4;
  PXRoundProgressView *loadingProgressBadgeView;

  if (!self->_loadingProgressBadgeView)
  {
    +[PXRoundProgressView sizeForSizeClass:](PXRoundProgressView, "sizeForSizeClass:", 2);
    v3 = [PXRoundProgressView alloc];
    PXRectWithOriginAndSize();
    v4 = -[PXRoundProgressView initWithFrame:](v3, "initWithFrame:");
    loadingProgressBadgeView = self->_loadingProgressBadgeView;
    self->_loadingProgressBadgeView = v4;

    -[PXDisplayAssetCombinedOverlayView addSubview:](self, "addSubview:", self->_loadingProgressBadgeView);
    -[PXDisplayAssetCombinedOverlayView _invalidateLayout](self, "_invalidateLayout");
  }
}

- (void)_ensureImageAnalysisOverlayView
{
  PXDisplayAssetImageAnalysisOverlayView *v3;
  void *v4;
  PXDisplayAssetImageAnalysisOverlayView *v5;
  PXDisplayAssetImageAnalysisOverlayView *imageAnalysisOverlayView;

  if (!self->_imageAnalysisOverlayView)
  {
    v3 = [PXDisplayAssetImageAnalysisOverlayView alloc];
    -[PXDisplayAssetCombinedOverlayView viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PXDisplayAssetImageAnalysisOverlayView initWithViewModel:](v3, "initWithViewModel:", v4);
    imageAnalysisOverlayView = self->_imageAnalysisOverlayView;
    self->_imageAnalysisOverlayView = v5;

    -[PXDisplayAssetCombinedOverlayView addSubview:](self, "addSubview:", self->_imageAnalysisOverlayView);
    -[PXDisplayAssetCombinedOverlayView _invalidateLayout](self, "_invalidateLayout");
  }
}

- (void)layoutSubviews
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXDisplayAssetCombinedOverlayView;
  -[PXDisplayAssetCombinedOverlayView layoutSubviews](&v8, sel_layoutSubviews);
  if (self->_isPerformingLayout)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetCombinedOverlayView.m"), 129, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_isPerformingLayout"));

  }
  self->_isPerformingLayout = 1;
  -[PXDisplayAssetCombinedOverlayView bounds](self, "bounds");
  -[PXDisplayAssetCombinedOverlayView setViewportSize:](self, "setViewportSize:", v4, v5);
  -[PXDisplayAssetCombinedOverlayView updater](self, "updater");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateIfNeeded");

  self->_isPerformingLayout = 0;
}

- (void)_setNeedsUpdate
{
  if (!self->_isPerformingLayout)
    -[PXDisplayAssetCombinedOverlayView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_invalidateCanShowLoadingProgress
{
  id v2;

  -[PXDisplayAssetCombinedOverlayView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCanShowLoadingProgress);

}

- (void)_updateCanShowLoadingProgress
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__loadingProgressDelayElapsed, 0);
  -[PXDisplayAssetCombinedOverlayView setCanShowLoadingProgress:](self, "setCanShowLoadingProgress:", 0);
  -[PXDisplayAssetCombinedOverlayView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v6[0] = *MEMORY[0x1E0C99860];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDisplayAssetCombinedOverlayView performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__loadingProgressDelayElapsed, 0, v5, 1.0);

  }
}

- (void)_loadingProgressDelayElapsed
{
  -[PXDisplayAssetCombinedOverlayView setCanShowLoadingProgress:](self, "setCanShowLoadingProgress:", 1);
}

- (void)_invalidateLivePhotoBadge
{
  id v2;

  -[PXDisplayAssetCombinedOverlayView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateLivePhotoBadge);

}

- (void)_updateLivePhotoBadge
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[PXDisplayAssetCombinedOverlayView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "playbackStyle");

  if (v4 == 3)
    -[PXDisplayAssetCombinedOverlayView _ensureLivePhotoBadgeView](self, "_ensureLivePhotoBadgeView");
  -[PXDisplayAssetCombinedOverlayView livePhotoBadgeView](self, "livePhotoBadgeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4 != 3);

  -[PXDisplayAssetCombinedOverlayView _invalidateLayout](self, "_invalidateLayout");
}

- (void)_invalidateLoadingFailureBadgeView
{
  id v2;

  -[PXDisplayAssetCombinedOverlayView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateLoadingFailureBadgeView);

}

- (void)_updateLoadingFailureBadgeView
{
  void *v3;
  void *v4;
  id v5;

  -[PXDisplayAssetCombinedOverlayView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadingError");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[PXDisplayAssetCombinedOverlayView _ensureLoadingFailureBadgeView](self, "_ensureLoadingFailureBadgeView");
  -[PXDisplayAssetCombinedOverlayView loadingFailureBadgeView](self, "loadingFailureBadgeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setError:", v5);
  objc_msgSend(v4, "setHidden:", v5 == 0);
  -[PXDisplayAssetCombinedOverlayView _invalidateLayout](self, "_invalidateLayout");

}

- (void)_invalidateLoadingProgressBadgeView
{
  id v2;

  -[PXDisplayAssetCombinedOverlayView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateLoadingProgressBadgeView);

}

- (void)_updateLoadingProgressBadgeView
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  uint64_t v14;
  PXRoundProgressView *loadingProgressBadgeView;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;

  -[PXDisplayAssetCombinedOverlayView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadingProgress");
  v6 = v5;
  if (v5 > 0.0 && v5 <= 1.0)
  {
    objc_msgSend(v3, "loadingError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

    }
    else
    {
      v9 = -[PXDisplayAssetCombinedOverlayView canShowLoadingProgress](self, "canShowLoadingProgress");
      if (v6 == 1.0 && v9)
      {
        -[PXDisplayAssetCombinedOverlayView loadingProgressBadgeView](self, "loadingProgressBadgeView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10 && (objc_msgSend(v10, "isHidden") & 1) == 0)
        {
          LODWORD(v12) = 1.0;
          objc_msgSend(v11, "setProgress:", v12);
          v13 = (void *)MEMORY[0x1E0DC3F10];
          v14 = MEMORY[0x1E0C809B0];
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __68__PXDisplayAssetCombinedOverlayView__updateLoadingProgressBadgeView__block_invoke;
          v26[3] = &unk_1E5149198;
          v27 = v11;
          v21 = v14;
          v22 = 3221225472;
          v23 = __68__PXDisplayAssetCombinedOverlayView__updateLoadingProgressBadgeView__block_invoke_2;
          v24 = &unk_1E5147360;
          v25 = v27;
          objc_msgSend(v13, "animateWithDuration:delay:options:animations:completion:", 0, v26, &v21, 0.2, 0.3);
          loadingProgressBadgeView = self->_loadingProgressBadgeView;
          self->_loadingProgressBadgeView = 0;

        }
      }
      else if (v9)
      {
        -[PXDisplayAssetCombinedOverlayView _ensureLoadingProgressBadgeView](self, "_ensureLoadingProgressBadgeView");
        v16 = 0;
        goto LABEL_16;
      }
    }
  }
  v16 = 1;
LABEL_16:
  -[PXDisplayAssetCombinedOverlayView loadingProgressBadgeView](self, "loadingProgressBadgeView", v21, v22, v23, v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDisplayAssetCombinedOverlayView loadingAsset](self, "loadingAsset");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v18)
  {
    objc_msgSend(v17, "prepareForReuse");
    -[PXDisplayAssetCombinedOverlayView setLoadingAsset:](self, "setLoadingAsset:", v4);
  }
  *(float *)&v19 = v6;
  objc_msgSend(v17, "setProgress:", v19);
  if (objc_msgSend(v3, "playbackStyle") == 3)
    v20 = 3;
  else
    v20 = 1;
  objc_msgSend(v17, "setStyle:", v20);
  objc_msgSend(v17, "setHidden:", v16);
  -[PXDisplayAssetCombinedOverlayView _invalidateLayout](self, "_invalidateLayout");

}

- (void)_invalidateImageAnalysisOverlay
{
  id v2;

  -[PXDisplayAssetCombinedOverlayView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateImageAnalysisOverlay);

}

- (void)_updateImageAnalysisOverlay
{
  void *v3;
  _BOOL4 v4;
  id v5;

  -[PXDisplayAssetCombinedOverlayView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PXDisplayAssetImageAnalysisOverlayView isImageAnalysisOverlayNeededForViewModel:](PXDisplayAssetImageAnalysisOverlayView, "isImageAnalysisOverlayNeededForViewModel:", v3);

  if (v4)
    -[PXDisplayAssetCombinedOverlayView _ensureImageAnalysisOverlayView](self, "_ensureImageAnalysisOverlayView");
  -[PXDisplayAssetCombinedOverlayView imageAnalysisOverlayView](self, "imageAnalysisOverlayView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", !v4);

}

- (void)_invalidateLayout
{
  id v2;

  -[PXDisplayAssetCombinedOverlayView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateLayout);

}

- (void)_updateLayout
{
  void *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void (**v18)(void *, void *, double, double, double, double);
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (**v22)(void *, void *, double, double, double, double);
  void (**v23)(void *, void *);
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (**v27)(void *, void *, double, double, double, double);
  void (**v28)(void *, void *);
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, void *);
  void *v34;
  void (**v35)(void *, void *, double, double, double, double);
  _QWORD *v36;
  _QWORD v37[4];
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[4];
  void (**v41)(void *, void *, double, double, double, double);
  _QWORD *v42;
  _QWORD v43[4];
  uint64_t v44;
  uint64_t v45;
  _QWORD aBlock[9];
  BOOL v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  -[PXDisplayAssetCombinedOverlayView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDisplayAssetCombinedOverlayView bounds](self, "bounds");
  x = v48.origin.x;
  y = v48.origin.y;
  width = v48.size.width;
  height = v48.size.height;
  if (!CGRectIsEmpty(v48))
  {
    objc_msgSend(v3, "assetAspectRatio");
    if (objc_msgSend(v3, "contentMode") == 1)
      PXRectWithAspectRatioFittingRect();
    else
      PXRectWithAspectRatioFillingRect();
    v12 = v8;
    v13 = v9;
    v14 = v10;
    v15 = v11;
    v16 = -[PXDisplayAssetCombinedOverlayView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    v17 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__PXDisplayAssetCombinedOverlayView__updateLayout__block_invoke;
    aBlock[3] = &unk_1E512B640;
    *(CGFloat *)&aBlock[5] = x;
    *(CGFloat *)&aBlock[6] = y;
    *(CGFloat *)&aBlock[7] = width;
    *(CGFloat *)&aBlock[8] = height;
    v47 = v16 == 1;
    aBlock[4] = self;
    v18 = (void (**)(void *, void *, double, double, double, double))_Block_copy(aBlock);
    -[PXDisplayAssetCombinedOverlayView imageAnalysisOverlayView](self, "imageAnalysisOverlayView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2](v18, v19, v12, v13, v14, v15);

    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3010000000;
    v44 = 0;
    v45 = 0;
    v43[3] = &unk_1A7E74EE7;
    v49.origin.x = v12;
    v49.origin.y = v13;
    v49.size.width = v14;
    v49.size.height = v15;
    CGRectInset(v49, 10.0, 10.0);
    PXPointDenormalize();
    v44 = v20;
    v45 = v21;
    v40[0] = v17;
    v40[1] = 3221225472;
    v40[2] = __50__PXDisplayAssetCombinedOverlayView__updateLayout__block_invoke_2;
    v40[3] = &unk_1E512B668;
    v42 = v43;
    v22 = v18;
    v41 = v22;
    v23 = (void (**)(void *, void *))_Block_copy(v40);
    -[PXDisplayAssetCombinedOverlayView livePhotoBadgeView](self, "livePhotoBadgeView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2](v23, v24);

    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3010000000;
    v38 = 0;
    v39 = 0;
    v37[3] = &unk_1A7E74EE7;
    v50.origin.x = v12;
    v50.origin.y = v13;
    v50.size.width = v14;
    v50.size.height = v15;
    CGRectInset(v50, 10.0, 10.0);
    PXPointDenormalize();
    v38 = v25;
    v39 = v26;
    v31 = v17;
    v32 = 3221225472;
    v33 = __50__PXDisplayAssetCombinedOverlayView__updateLayout__block_invoke_3;
    v34 = &unk_1E512B668;
    v36 = v37;
    v27 = v22;
    v35 = v27;
    v28 = (void (**)(void *, void *))_Block_copy(&v31);
    -[PXDisplayAssetCombinedOverlayView loadingFailureBadgeView](self, "loadingFailureBadgeView", v31, v32, v33, v34);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2](v28, v29);

    -[PXDisplayAssetCombinedOverlayView loadingProgressBadgeView](self, "loadingProgressBadgeView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2](v28, v30);

    _Block_object_dispose(v37, 8);
    _Block_object_dispose(v43, 8);

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v9;
  id v10;

  v10 = a3;
  if ((void *)ViewModelObservationContext_132663 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetCombinedOverlayView.m"), 319, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((a4 & 1) != 0)
    -[PXDisplayAssetCombinedOverlayView _invalidateCanShowLoadingProgress](self, "_invalidateCanShowLoadingProgress");
  if ((a4 & 0xC) != 0)
    -[PXDisplayAssetCombinedOverlayView _invalidateLayout](self, "_invalidateLayout");
  if ((a4 & 2) != 0)
    -[PXDisplayAssetCombinedOverlayView _invalidateLivePhotoBadge](self, "_invalidateLivePhotoBadge");
  if ((a4 & 0x400) != 0)
    -[PXDisplayAssetCombinedOverlayView _invalidateLoadingFailureBadgeView](self, "_invalidateLoadingFailureBadgeView");
  if ((a4 & 0x602) != 0)
    -[PXDisplayAssetCombinedOverlayView _invalidateLoadingProgressBadgeView](self, "_invalidateLoadingProgressBadgeView");
  if (+[PXDisplayAssetImageAnalysisOverlayView changedImageAnalysisOverlayNeededForViewModelChange:](PXDisplayAssetImageAnalysisOverlayView, "changedImageAnalysisOverlayNeededForViewModelChange:", a4))
  {
    -[PXDisplayAssetCombinedOverlayView _invalidateImageAnalysisOverlay](self, "_invalidateImageAnalysisOverlay");
  }

}

- (void)livePhotoBadgeView:(id)a3 wantsPlayback:(BOOL)a4
{
  void *v5;
  _QWORD v6[4];
  BOOL v7;

  -[PXDisplayAssetCombinedOverlayView viewModel](self, "viewModel", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__PXDisplayAssetCombinedOverlayView_livePhotoBadgeView_wantsPlayback___block_invoke;
  v6[3] = &__block_descriptor_33_e42_v16__0___PXMutableDisplayAssetViewModel__8l;
  v7 = a4;
  objc_msgSend(v5, "performChanges:", v6);

}

- (PXDisplayAssetViewModel)viewModel
{
  return self->_viewModel;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (CGSize)viewportSize
{
  double width;
  double height;
  CGSize result;

  width = self->_viewportSize.width;
  height = self->_viewportSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)canShowLoadingProgress
{
  return self->_canShowLoadingProgress;
}

- (PXLivePhotoBadgeView)livePhotoBadgeView
{
  return self->_livePhotoBadgeView;
}

- (PXLoadingFailureBadgeView)loadingFailureBadgeView
{
  return self->_loadingFailureBadgeView;
}

- (PXRoundProgressView)loadingProgressBadgeView
{
  return self->_loadingProgressBadgeView;
}

- (PXDisplayAsset)loadingAsset
{
  return self->_loadingAsset;
}

- (void)setLoadingAsset:(id)a3
{
  objc_storeStrong((id *)&self->_loadingAsset, a3);
}

- (PXDisplayAssetImageAnalysisOverlayView)imageAnalysisOverlayView
{
  return self->_imageAnalysisOverlayView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAnalysisOverlayView, 0);
  objc_storeStrong((id *)&self->_loadingAsset, 0);
  objc_storeStrong((id *)&self->_loadingProgressBadgeView, 0);
  objc_storeStrong((id *)&self->_loadingFailureBadgeView, 0);
  objc_storeStrong((id *)&self->_livePhotoBadgeView, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

uint64_t __70__PXDisplayAssetCombinedOverlayView_livePhotoBadgeView_wantsPlayback___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWantsLivePhotoPlayback:", *(unsigned __int8 *)(a1 + 32));
}

void __50__PXDisplayAssetCombinedOverlayView__updateLayout__block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v11 = a2;
  if (v11)
  {
    v15 = v11;
    if (*(_BYTE *)(a1 + 72))
    {
      a3 = MEMORY[0x1A85CD2B8](a3, a4, a5, a6, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
      a4 = v12;
      a5 = v13;
      a6 = v14;
    }
    objc_msgSend(v15, "setFrame:", a3, a4, a5, a6);
    objc_msgSend(*(id *)(a1 + 32), "bringSubviewToFront:", v15);
    v11 = v15;
  }

}

void __50__PXDisplayAssetCombinedOverlayView__updateLayout__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  uint64_t v10;
  double v11;
  double v12;
  CGFloat MaxX;
  void *v14;
  CGRect v15;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v14 = v3;
    v5 = objc_msgSend(v3, "isHidden");
    v4 = v14;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(v14, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v7 = v6;
      v9 = v8;
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(double *)(v10 + 32);
      v12 = *(double *)(v10 + 40);
      (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(v11, v12, v6, v8);
      v15.origin.x = v11;
      v15.origin.y = v12;
      v15.size.width = v7;
      v15.size.height = v9;
      MaxX = CGRectGetMaxX(v15);
      v4 = v14;
      *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = MaxX + 10.0;
    }
  }

}

void __50__PXDisplayAssetCombinedOverlayView__updateLayout__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  uint64_t v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat MinX;
  void *v14;
  CGRect v15;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v14 = v3;
    v5 = objc_msgSend(v3, "isHidden");
    v4 = v14;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(v14, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v7 = v6;
      v9 = v8;
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(double *)(v10 + 32) - v6;
      v12 = *(double *)(v10 + 40) - v8;
      (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(v11, v12, v6, v8);
      v15.origin.x = v11;
      v15.origin.y = v12;
      v15.size.width = v7;
      v15.size.height = v9;
      MinX = CGRectGetMinX(v15);
      v4 = v14;
      *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = MinX + -10.0;
    }
  }

}

uint64_t __68__PXDisplayAssetCombinedOverlayView__updateLoadingProgressBadgeView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __68__PXDisplayAssetCombinedOverlayView__updateLoadingProgressBadgeView__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

@end
