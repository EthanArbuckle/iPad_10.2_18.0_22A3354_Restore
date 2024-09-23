@implementation PXDisplayAssetView

- (PXDisplayAssetView)initWithFrame:(CGRect)a3
{
  return -[PXDisplayAssetView initWithFrame:options:](self, "initWithFrame:options:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PXDisplayAssetView)initWithFrame:(CGRect)a3 options:(unint64_t)a4
{
  PXDisplayAssetView *v5;
  PXDisplayAssetView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXDisplayAssetView;
  v5 = -[PXDisplayAssetView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_options = a4;
    -[PXDisplayAssetView _commonPXDisplayAssetViewInit](v5, "_commonPXDisplayAssetViewInit");
  }
  return v6;
}

- (PXDisplayAssetView)initWithCoder:(id)a3
{
  PXDisplayAssetView *v3;
  PXDisplayAssetView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXDisplayAssetView;
  v3 = -[PXDisplayAssetView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PXDisplayAssetView _commonPXDisplayAssetViewInit](v3, "_commonPXDisplayAssetViewInit");
  return v4;
}

- (void)_commonPXDisplayAssetViewInit
{
  PXUpdater *v3;
  PXUpdater *updater;
  PXDisplayAssetViewModel *v5;
  PXDisplayAssetViewModel *viewModel;
  PXDisplayAssetCombinedOverlayView *v7;
  PXDisplayAssetCombinedOverlayView *overlayView;

  -[PXDisplayAssetView setContentMode:](self, "setContentMode:", 1);
  self->_preferredImageDynamicRange = 0;
  v3 = (PXUpdater *)objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", self, sel__setNeedsUpdate);
  updater = self->_updater;
  self->_updater = v3;

  -[PXUpdater addUpdateSelector:](self->_updater, "addUpdateSelector:", sel__updateViewModelProperties);
  -[PXUpdater addUpdateSelector:](self->_updater, "addUpdateSelector:", sel__updateContentView);
  -[PXUpdater addUpdateSelector:](self->_updater, "addUpdateSelector:", sel__updateContentViewProperties);
  -[PXUpdater addUpdateSelector:](self->_updater, "addUpdateSelector:", sel__updateContentViewLayout);
  -[PXUpdater addUpdateSelector:](self->_updater, "addUpdateSelector:", sel__updateDebugOverlayView);
  v5 = objc_alloc_init(PXDisplayAssetViewModel);
  viewModel = self->_viewModel;
  self->_viewModel = v5;

  -[PXDisplayAssetViewModel registerChangeObserver:context:](self->_viewModel, "registerChangeObserver:context:", self, ViewModelObservationContext_285407);
  -[PXDisplayAssetView _invalidateViewModelProperties](self, "_invalidateViewModelProperties");
  if ((-[PXDisplayAssetView options](self, "options") & 1) == 0)
  {
    v7 = -[PXDisplayAssetCombinedOverlayView initWithViewModel:]([PXDisplayAssetCombinedOverlayView alloc], "initWithViewModel:", self->_viewModel);
    overlayView = self->_overlayView;
    self->_overlayView = v7;

    -[PXDisplayAssetView addSubview:](self, "addSubview:", self->_overlayView);
  }
  -[PXDisplayAssetView _addDebugOverlayViewIfNeeded](self, "_addDebugOverlayViewIfNeeded");
}

- (void)didAddSubview:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PXDisplayAssetView;
  -[PXDisplayAssetView didAddSubview:](&v5, sel_didAddSubview_, v4);
  if (self->_debugOverlayView)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[PXDisplayAssetView bringSubviewToFront:](self, "bringSubviewToFront:", self->_debugOverlayView);
  }

}

- (void)dealloc
{
  PXDisplayAssetContentView *v3;
  PXDisplayAssetContentView *v4;
  objc_super v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  PXDisplayAssetContentView *v10;

  v3 = self->_contentView;
  v4 = v3;
  if (v3)
  {
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __29__PXDisplayAssetView_dealloc__block_invoke;
    v9 = &unk_1E5149198;
    v10 = v3;
    px_dispatch_on_main_queue();

  }
  v5.receiver = self;
  v5.super_class = (Class)PXDisplayAssetView;
  -[PXDisplayAssetView dealloc](&v5, sel_dealloc);
}

- (void)_addDebugOverlayViewIfNeeded
{
  id v3;
  objc_class *v4;
  void *v5;
  PUPhotosAssetDebugOverlayView *v6;
  PUPhotosAssetDebugOverlayView *debugOverlayView;
  _QWORD v8[5];

  if (PUPhotosAssetViewShowDebugOverlayView())
  {
    if (!self->_debugOverlayView)
    {
      v3 = objc_alloc(MEMORY[0x1E0CD21A0]);
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __50__PXDisplayAssetView__addDebugOverlayViewIfNeeded__block_invoke;
      v8[3] = &unk_1E51456B0;
      v8[4] = self;
      v6 = (PUPhotosAssetDebugOverlayView *)objc_msgSend(v3, "initWithClientIdentifier:configuration:", v5, v8);
      debugOverlayView = self->_debugOverlayView;
      self->_debugOverlayView = v6;

      -[PUPhotosAssetDebugOverlayView setDelegate:](self->_debugOverlayView, "setDelegate:", self);
      -[PXDisplayAssetView _updateDebugOverlayView](self, "_updateDebugOverlayView");
      -[PXDisplayAssetView addSubview:](self, "addSubview:", self->_debugOverlayView);
    }
  }
}

- (void)setAsset:(id)a3
{
  PXDisplayAsset *v5;
  PXDisplayAsset *v6;

  v5 = (PXDisplayAsset *)a3;
  if (self->_asset != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_asset, a3);
    -[PXDisplayAssetView _invalidateViewModelProperties](self, "_invalidateViewModelProperties");
    -[PXDisplayAssetView _invalidateContentView](self, "_invalidateContentView");
    -[PXDisplayAssetView _invalidateContentViewLayout](self, "_invalidateContentViewLayout");
    v5 = v6;
  }

}

- (void)setMediaProvider:(id)a3
{
  PXUIMediaProvider *v5;
  char v6;
  PXUIMediaProvider *v7;

  v7 = (PXUIMediaProvider *)a3;
  v5 = self->_mediaProvider;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXUIMediaProvider isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_mediaProvider, a3);
      -[PXDisplayAssetView _invalidateContentViewProperties](self, "_invalidateContentViewProperties");
    }
  }

}

- (void)setPreferredImageDynamicRange:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  if (-[PXDisplayAssetView disableFeatureFlagGatingForTestingOnly](self, "disableFeatureFlagGatingForTestingOnly")
    || (_os_feature_enabled_impl() & 1) != 0)
  {
    if (self->_preferredImageDynamicRange != a3)
    {
      self->_preferredImageDynamicRange = a3;
      -[PXDisplayAssetView contentView](self, "contentView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPreferredImageDynamicRange:", a3);

      -[PXDisplayAssetView _invalidateDebugOverlayView](self, "_invalidateDebugOverlayView");
    }
  }
  else
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "Attempting to set preferredImageDynamicRange without enabling the appropriate feature flag", v7, 2u);
    }

  }
}

- (void)setContentMode:(int64_t)a3
{
  objc_super v5;

  if (-[PXDisplayAssetView contentMode](self, "contentMode") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PXDisplayAssetView;
    -[PXDisplayAssetView setContentMode:](&v5, sel_setContentMode_, a3);
    -[PXDisplayAssetView _invalidateViewModelProperties](self, "_invalidateViewModelProperties");
    -[PXDisplayAssetView _invalidateContentViewLayout](self, "_invalidateContentViewLayout");
  }
}

- (void)setAllowsTextSelection:(BOOL)a3
{
  if (self->_allowsTextSelection != a3)
  {
    self->_allowsTextSelection = a3;
    -[PXDisplayAssetView _invalidateViewModelProperties](self, "_invalidateViewModelProperties");
  }
}

- (void)setStringsToHighlight:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *stringsToHighlight;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_stringsToHighlight;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      stringsToHighlight = self->_stringsToHighlight;
      self->_stringsToHighlight = v6;

      -[PXDisplayAssetView _invalidateViewModelProperties](self, "_invalidateViewModelProperties");
    }
  }

}

- (void)setSceneIdentifiersToHighlight:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *sceneIdentifiersToHighlight;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_sceneIdentifiersToHighlight;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      sceneIdentifiersToHighlight = self->_sceneIdentifiersToHighlight;
      self->_sceneIdentifiersToHighlight = v6;

      -[PXDisplayAssetView _invalidateViewModelProperties](self, "_invalidateViewModelProperties");
    }
  }

}

- (void)setAudioIdentifiersToHighlight:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *audioIdentifiersToHighlight;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_audioIdentifiersToHighlight;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      audioIdentifiersToHighlight = self->_audioIdentifiersToHighlight;
      self->_audioIdentifiersToHighlight = v6;

      -[PXDisplayAssetView _invalidateViewModelProperties](self, "_invalidateViewModelProperties");
    }
  }

}

- (void)setHumanActionIdentifiersToHighlight:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *humanActionIdentifiersToHighlight;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_humanActionIdentifiersToHighlight;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      humanActionIdentifiersToHighlight = self->_humanActionIdentifiersToHighlight;
      self->_humanActionIdentifiersToHighlight = v6;

      -[PXDisplayAssetView _invalidateViewModelProperties](self, "_invalidateViewModelProperties");
    }
  }

}

- (void)setPersonLocalIdentifiersToHighlight:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *personLocalIdentifiersToHighlight;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_personLocalIdentifiersToHighlight;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      personLocalIdentifiersToHighlight = self->_personLocalIdentifiersToHighlight;
      self->_personLocalIdentifiersToHighlight = v6;

      -[PXDisplayAssetView _invalidateViewModelProperties](self, "_invalidateViewModelProperties");
    }
  }

}

- (UIImage)currentImage
{
  void *v2;
  void *v3;

  -[PXDisplayAssetView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (CGRect)imageFrame
{
  void *v2;
  double v3;
  double v4;
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
  CGRect result;

  -[PXDisplayAssetView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setContentView:(id)a3
{
  PXDisplayAssetContentView *v5;
  PXDisplayAssetContentView **p_contentView;
  PXDisplayAssetContentView *contentView;
  void *v8;
  PXDisplayAssetContentView *v9;
  PXDisplayAssetContentView *v10;

  v5 = (PXDisplayAssetContentView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v10 = v5;
    if (contentView)
    {
      +[PXDisplayAssetContentView checkInView:](PXDisplayAssetContentView, "checkInView:");
      -[PXDisplayAssetContentView removeFromSuperview](*p_contentView, "removeFromSuperview");
    }
    objc_storeStrong((id *)&self->_contentView, a3);
    -[PXDisplayAssetContentView setDelegate:](*p_contentView, "setDelegate:", self);
    if (*p_contentView)
    {
      -[PXDisplayAssetView overlayView](self, "overlayView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *p_contentView;
      if (v8)
        -[PXDisplayAssetView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v9, v8);
      else
        -[PXDisplayAssetView addSubview:](self, "addSubview:", v9);

    }
    -[PXDisplayAssetView _invalidateContentViewProperties](self, "_invalidateContentViewProperties");
    -[PXDisplayAssetView _invalidateContentViewLayout](self, "_invalidateContentViewLayout");
    v5 = v10;
  }

}

- (void)setViewportSize:(CGSize)a3
{
  if (a3.width != self->_viewportSize.width || a3.height != self->_viewportSize.height)
  {
    self->_viewportSize = a3;
    -[PXDisplayAssetView _invalidateContentViewLayout](self, "_invalidateContentViewLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v14;

  if (self->_isPerformingLayout)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetView.m"), 318, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_isPerformingLayout"));

  }
  self->_isPerformingLayout = 1;
  -[PXDisplayAssetView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXDisplayAssetView setViewportSize:](self, "setViewportSize:", v7, v9);
  -[PXDisplayAssetView overlayView](self, "overlayView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[PXDisplayAssetView updater](self, "updater");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateIfNeeded");

  self->_isPerformingLayout = 0;
  -[PXDisplayAssetView bounds](self, "bounds");
  -[PUPhotosAssetDebugOverlayView setFrame:](self->_debugOverlayView, "setFrame:");
}

- (void)_setNeedsUpdate
{
  if (!self->_isPerformingLayout)
    -[PXDisplayAssetView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_invalidateViewModelProperties
{
  id v2;

  -[PXDisplayAssetView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateViewModelProperties);

}

- (void)_updateViewModelProperties
{
  void *v3;
  _QWORD v4[5];

  -[PXDisplayAssetView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__PXDisplayAssetView__updateViewModelProperties__block_invoke;
  v4[3] = &unk_1E51456D8;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (void)_invalidateContentView
{
  id v2;

  -[PXDisplayAssetView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateContentView);

}

- (void)_updateContentView
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[PXDisplayAssetView setContentView:](self, "setContentView:", 0);
  -[PXDisplayAssetView asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    if ((-[PXDisplayAssetView options](self, "options") & 1) != 0)
      v4 = 1;
    else
      v4 = objc_msgSend(v6, "playbackStyle");
    +[PXDisplayAssetContentView checkOutViewForAsset:withPlaybackStyle:](PXDisplayAssetContentView, "checkOutViewForAsset:withPlaybackStyle:", v6, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCanDisplayLoadingIndicator:", 0);
    -[PXDisplayAssetView setContentView:](self, "setContentView:", v5);

    v3 = v6;
  }

}

- (void)_invalidateContentViewProperties
{
  id v2;

  -[PXDisplayAssetView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateContentViewProperties);

}

- (void)_updateContentViewProperties
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  PXDisplayAssetView *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[PXDisplayAssetView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDisplayAssetView viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDisplayAssetView mediaProvider](self, "mediaProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "no media provider set on %@", (uint8_t *)&v7, 0xCu);
    }

  }
  objc_msgSend(v3, "setMediaProvider:", v5);
  objc_msgSend(v3, "setAnimatedContentEnabled:", 1);
  objc_msgSend(v3, "setViewModel:", v4);
  objc_msgSend(v3, "setPreferredImageDynamicRange:", -[PXDisplayAssetView preferredImageDynamicRange](self, "preferredImageDynamicRange"));

}

- (void)_invalidateContentViewLayout
{
  id v2;

  -[PXDisplayAssetView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateContentViewLayout);

}

- (void)_updateContentViewLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  id v18;

  -[PXDisplayAssetView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[PXDisplayAssetView contentMode](self, "contentMode");
  if (v11 == 1)
  {
    -[PXDisplayAssetView asset](self, "asset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pixelWidth");
    objc_msgSend(v12, "pixelHeight");
    PXSizeGetAspectRatioWithDefault();
    PXRectWithAspectRatioFittingRect();
    v4 = v13;
    v6 = v14;
    v8 = v15;
    v10 = v16;

    v17 = 2;
  }
  else
  {
    v17 = v11;
  }
  -[PXDisplayAssetView contentView](self, "contentView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v4, v6, v8, v10);
  objc_msgSend(v18, "setContentMode:", v17);

}

- (void)_invalidateDebugOverlayView
{
  id v2;

  -[PXDisplayAssetView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDebugOverlayView);

}

- (void)_updateDebugOverlayView
{
  id v3;

  -[PUPhotosAssetDebugOverlayView setPreferredImageDynamicRange:](self->_debugOverlayView, "setPreferredImageDynamicRange:", _PUImageDynamicRangeFromPXImageDynamicRange(-[PXDisplayAssetView preferredImageDynamicRange](self, "preferredImageDynamicRange")));
  -[PXDisplayAssetView contentView](self, "contentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAssetDebugOverlayView setEffectivePreferredImageDynamicRange:](self->_debugOverlayView, "setEffectivePreferredImageDynamicRange:", _PUImageDynamicRangeFromPXImageDynamicRange(objc_msgSend(v3, "effectivePreferredImageDynamicRange")));

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  if ((void *)ViewModelObservationContext_285407 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetView.m"), 430, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }

}

- (void)photosAssetDebugOverlayView:(id)a3 didRequestPreferredImageDynamicRange:(int64_t)a4
{
  int64_t v4;

  if ((unint64_t)a4 >= 4)
    v4 = 0;
  else
    v4 = a4 - 1;
  -[PXDisplayAssetView setPreferredImageDynamicRange:](self, "setPreferredImageDynamicRange:", v4);
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (int64_t)preferredImageDynamicRange
{
  return self->_preferredImageDynamicRange;
}

- (BOOL)allowsTextSelection
{
  return self->_allowsTextSelection;
}

- (NSArray)stringsToHighlight
{
  return self->_stringsToHighlight;
}

- (NSArray)sceneIdentifiersToHighlight
{
  return self->_sceneIdentifiersToHighlight;
}

- (NSArray)audioIdentifiersToHighlight
{
  return self->_audioIdentifiersToHighlight;
}

- (NSArray)humanActionIdentifiersToHighlight
{
  return self->_humanActionIdentifiersToHighlight;
}

- (NSArray)personLocalIdentifiersToHighlight
{
  return self->_personLocalIdentifiersToHighlight;
}

- (unint64_t)options
{
  return self->_options;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXDisplayAssetViewModel)viewModel
{
  return self->_viewModel;
}

- (PXDisplayAssetCombinedOverlayView)overlayView
{
  return self->_overlayView;
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

- (PXDisplayAssetContentView)contentView
{
  return self->_contentView;
}

- (PUPhotosAssetDebugOverlayView)debugOverlayView
{
  return self->_debugOverlayView;
}

- (BOOL)disableFeatureFlagGatingForTestingOnly
{
  return self->_disableFeatureFlagGatingForTestingOnly;
}

- (void)setDisableFeatureFlagGatingForTestingOnly:(BOOL)a3
{
  self->_disableFeatureFlagGatingForTestingOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugOverlayView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifiersToHighlight, 0);
  objc_storeStrong((id *)&self->_humanActionIdentifiersToHighlight, 0);
  objc_storeStrong((id *)&self->_audioIdentifiersToHighlight, 0);
  objc_storeStrong((id *)&self->_sceneIdentifiersToHighlight, 0);
  objc_storeStrong((id *)&self->_stringsToHighlight, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

void __48__PXDisplayAssetView__updateViewModelProperties__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAsset:", v5);

  objc_msgSend(v4, "setContentMode:", objc_msgSend(*(id *)(a1 + 32), "contentMode"));
  objc_msgSend(v4, "setAllowsTextSelection:", objc_msgSend(*(id *)(a1 + 32), "allowsTextSelection"));
  objc_msgSend(*(id *)(a1 + 32), "stringsToHighlight");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStringsToHighlight:", v6);

  objc_msgSend(*(id *)(a1 + 32), "sceneIdentifiersToHighlight");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSceneIdentifiersToHighlight:", v7);

  objc_msgSend(*(id *)(a1 + 32), "audioIdentifiersToHighlight");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAudioIdentifiersToHighlight:", v8);

  objc_msgSend(*(id *)(a1 + 32), "humanActionIdentifiersToHighlight");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHumanActionIdentifiersToHighlight:", v9);

  objc_msgSend(*(id *)(a1 + 32), "personLocalIdentifiersToHighlight");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPersonLocalIdentifiersToHighlight:", v10);

}

void __50__PXDisplayAssetView__addDebugOverlayViewIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setPreferredImageDynamicRange:", _PUImageDynamicRangeFromPXImageDynamicRange(objc_msgSend(v2, "preferredImageDynamicRange")));

}

uint64_t __29__PXDisplayAssetView_dealloc__block_invoke(uint64_t a1)
{
  return +[PXDisplayAssetContentView checkInView:](PXDisplayAssetContentView, "checkInView:", *(_QWORD *)(a1 + 32));
}

+ (id)localizedTitleForAsset:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;

  v4 = a3;
  objc_msgSend(v4, "localizedGeoDescription");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "localCreationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(v7, "setDateStyle:", 3);
      objc_msgSend(v7, "setTimeStyle:", 1);
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTimeZone:", v8);

      objc_msgSend(a1, "currentLocaleForTesting");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLocale:", v9);

      objc_msgSend(v7, "stringFromDate:", v6);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  if (v5)
    v10 = v5;
  else
    v10 = &stru_1E5149688;
  v11 = v10;

  return v11;
}

+ (CGRect)preferredContentsRectForAsset:(id)a3 targetSize:(CGSize)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  +[PXDisplayAssetContentView preferredContentsRectForAsset:targetSize:](PXDisplayAssetContentView, "preferredContentsRectForAsset:targetSize:", a3, a4.width, a4.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (NSLocale)currentLocaleForTesting
{
  return (NSLocale *)(id)_currentLocaleForTesting;
}

+ (void)setCurrentLocaleForTesting:(id)a3
{
  objc_storeStrong((id *)&_currentLocaleForTesting, a3);
}

@end
