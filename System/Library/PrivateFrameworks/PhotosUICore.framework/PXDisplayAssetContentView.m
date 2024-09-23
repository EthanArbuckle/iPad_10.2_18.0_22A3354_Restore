@implementation PXDisplayAssetContentView

- (PXDisplayAssetContentView)initWithFrame:(CGRect)a3
{
  PXDisplayAssetContentView *v3;
  PXDisplayAssetContentView *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXDisplayAssetContentView;
  v3 = -[PXDisplayAssetContentView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PXDisplayAssetContentView _resetPreferredImageDynamicRange](v3, "_resetPreferredImageDynamicRange");
    -[PXDisplayAssetContentView contentView](v4, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDisplayAssetContentView addSubview:](v4, "addSubview:", v5);

    -[PXDisplayAssetContentView _updateTargetSize](v4, "_updateTargetSize");
    -[PXDisplayAssetContentView _updateProgressView](v4, "_updateProgressView");
    -[PXDisplayAssetContentView setAccessibilityIgnoresInvertColors:](v4, "setAccessibilityIgnoresInvertColors:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel__applicationDidEnterBackground, *MEMORY[0x1E0DC4768], 0);

  }
  return v4;
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXDisplayAssetContentView;
  -[PXDisplayAssetContentView willMoveToWindow:](&v4, sel_willMoveToWindow_, a3);
  -[PXDisplayAssetContentView _stopHeadroomMonitoring](self, "_stopHeadroomMonitoring");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetContentView;
  -[PXDisplayAssetContentView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[PXDisplayAssetContentView _updateTargetSize](self, "_updateTargetSize");
  -[PXDisplayAssetContentView _startHeadroomMonitoringIfPossible](self, "_startHeadroomMonitoringIfPossible");
}

- (void)setNeedsLayout
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PXDisplayAssetContentView;
  -[PXDisplayAssetContentView setNeedsLayout](&v2, sel_setNeedsLayout);
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
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;

  v24.receiver = self;
  v24.super_class = (Class)PXDisplayAssetContentView;
  -[PXDisplayAssetContentView layoutSubviews](&v24, sel_layoutSubviews);
  -[PXDisplayAssetContentView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXDisplayAssetContentView contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[PXDisplayAssetContentView setContentBounds:](self, "setContentBounds:", v4, v6, v8, v10);
  -[PXDisplayAssetContentView _updateIfNeeded](self, "_updateIfNeeded");
  +[PXRoundProgressView sizeForSizeClass:](PXRoundProgressView, "sizeForSizeClass:", 1);
  v13 = v12;
  v15 = v14;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  v16 = CGRectGetMaxX(v25) - v13 + -8.0;
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  v17 = CGRectGetMaxY(v26) - v15 + -8.0;
  -[PXDisplayAssetContentView progressView](self, "progressView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v16, v17, v13, v15);

  PXRectGetCenter();
  v20 = v19;
  v22 = v21;
  -[PXDisplayAssetContentView failureView](self, "failureView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setCenter:", v20, v22);

}

- (void)setContentMode:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXDisplayAssetContentView;
  -[PXDisplayAssetContentView setContentMode:](&v4, sel_setContentMode_, a3);
  -[PXDisplayAssetContentView contentModeDidChange](self, "contentModeDidChange");
}

- (void)setViewModel:(id)a3
{
  PXDisplayAssetViewModel *v5;
  PXDisplayAssetViewModel *viewModel;
  PXDisplayAssetViewModel *v7;

  v5 = (PXDisplayAssetViewModel *)a3;
  viewModel = self->_viewModel;
  if (viewModel != v5)
  {
    v7 = v5;
    -[PXDisplayAssetViewModel unregisterChangeObserver:context:](viewModel, "unregisterChangeObserver:context:", self, ViewModelObservationContext_87208);
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[PXDisplayAssetViewModel registerChangeObserver:context:](self->_viewModel, "registerChangeObserver:context:", self, ViewModelObservationContext_87208);
    -[PXDisplayAssetContentView viewModelDidChange:](self, "viewModelDidChange:", -1);
    v5 = v7;
  }

}

- (void)handleError:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  PXDisplayAssetContentView *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[PXDisplayAssetContentView setLatestError:](self, "setLatestError:", v4);
    -[PXDisplayAssetContentView log](self, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412546;
      v7 = self;
      v8 = 2112;
      v9 = v4;
      _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "%@ received error : %@", (uint8_t *)&v6, 0x16u);
    }

  }
}

- (OS_os_log)log
{
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, &__block_literal_global_151);
  return (OS_os_log *)(id)log_log;
}

- (void)_resetPreferredImageDynamicRange
{
  -[PXDisplayAssetContentView setPreferredImageDynamicRange:](self, "setPreferredImageDynamicRange:", 0);
}

- (void)becomeReusable
{
  -[PXDisplayAssetContentView setAsset:](self, "setAsset:", 0);
  -[PXDisplayAssetContentView setMediaProvider:](self, "setMediaProvider:", 0);
  -[PXDisplayAssetContentView setCanDisplayLoadingIndicator:](self, "setCanDisplayLoadingIndicator:", 0);
  -[PXDisplayAssetContentView setHidden:](self, "setHidden:", 0);
  -[PXDisplayAssetContentView setLatestError:](self, "setLatestError:", 0);
  -[PXDisplayAssetContentView setError:](self, "setError:", 0);
  -[PXDisplayAssetContentView setAnimatedContentEnabled:](self, "setAnimatedContentEnabled:", 0);
  -[PXDisplayAssetContentView setPlaceholderImageFilters:](self, "setPlaceholderImageFilters:", 0);
  -[PXDisplayAssetContentView _resetPreferredImageDynamicRange](self, "_resetPreferredImageDynamicRange");
  -[PXDisplayAssetContentView _updateIfNeeded](self, "_updateIfNeeded");
  -[PXDisplayAssetContentView _stopHeadroomMonitoring](self, "_stopHeadroomMonitoring");
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  void *v10;

  v9 = a3;
  if ((void *)PXImageRequesterObserverContext_87207 == a5)
  {
    px_dispatch_on_main_queue();
  }
  else if ((void *)ViewModelObservationContext_87208 == a5)
  {
    -[PXDisplayAssetContentView viewModelDidChange:](self, "viewModelDidChange:", a4);
  }
  else
  {
    if ((void *)PXDisplayScreenDynamicRangeObservationContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetContentView.m"), 333, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((a4 & 1) != 0)
      -[PXDisplayAssetContentView _updateEffectiveImageDynamicRange](self, "_updateEffectiveImageDynamicRange");
  }

}

- (void)setNeedsUpdateContent
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXDisplayAssetContentView setNeedsUpdateContent]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXDisplayAssetContentView.m"), 348, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXDisplayAssetContentView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setPlaceholderImageFilters:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *placeholderImageFilters;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_placeholderImageFilters;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      placeholderImageFilters = self->_placeholderImageFilters;
      self->_placeholderImageFilters = v6;

      -[PXDisplayAssetContentView placeholderImageFiltersDidChange](self, "placeholderImageFiltersDidChange");
    }
  }

}

- (void)setContentBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_contentBounds;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_contentBounds = &self->_contentBounds;
  if (!CGRectEqualToRect(a3, self->_contentBounds))
  {
    p_contentBounds->origin.x = x;
    p_contentBounds->origin.y = y;
    p_contentBounds->size.width = width;
    p_contentBounds->size.height = height;
    -[PXDisplayAssetContentView _updateTargetSize](self, "_updateTargetSize");
    -[PXDisplayAssetContentView setNeedsUpdateContent](self, "setNeedsUpdateContent");
  }
}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    -[PXDisplayAssetContentView imageDidChange](self, "imageDidChange");
    v5 = v6;
  }

}

- (void)setContentsRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    x = *(double *)off_1E50B86D0;
    y = *((double *)off_1E50B86D0 + 1);
    width = *((double *)off_1E50B86D0 + 2);
    height = *((double *)off_1E50B86D0 + 3);
  }
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  if (!CGRectEqualToRect(v8, self->_contentsRect))
  {
    self->_contentsRect.origin.x = x;
    self->_contentsRect.origin.y = y;
    self->_contentsRect.size.width = width;
    self->_contentsRect.size.height = height;
    -[PXDisplayAssetContentView contentsRectDidChange](self, "contentsRectDidChange");
  }
}

- (void)setImageRequester:(id)a3
{
  PXImageRequester *v5;
  PXImageRequester *imageRequester;
  void *v7;
  PXImageRequester *v8;

  v5 = (PXImageRequester *)a3;
  imageRequester = self->_imageRequester;
  v8 = v5;
  if (imageRequester != v5)
  {
    -[PXImageRequester unregisterChangeObserver:context:](imageRequester, "unregisterChangeObserver:context:", self, PXImageRequesterObserverContext_87207);
    objc_storeStrong((id *)&self->_imageRequester, a3);
    -[PXImageRequester registerChangeObserver:context:](v8, "registerChangeObserver:context:", self, PXImageRequesterObserverContext_87207);
    -[PXImageRequester image](v8, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDisplayAssetContentView setImage:](self, "setImage:", v7);

    -[PXImageRequester contentsRect](v8, "contentsRect");
    -[PXDisplayAssetContentView setContentsRect:](self, "setContentsRect:");
    -[PXImageRequester loadingProgress](v8, "loadingProgress");
    -[PXDisplayAssetContentView setImageProgress:](self, "setImageProgress:");
    -[PXDisplayAssetContentView imageRequesterDidChange:](self, "imageRequesterDidChange:", -1);
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
    -[PXDisplayAssetContentView setNeedsUpdateContent](self, "setNeedsUpdateContent");
    -[PXDisplayAssetContentView setLatestError:](self, "setLatestError:", 0);
    v5 = v6;
  }

}

- (void)setMediaProvider:(id)a3
{
  PXUIMediaProvider *v5;
  PXUIMediaProvider *v6;

  v5 = (PXUIMediaProvider *)a3;
  if (self->_mediaProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    -[PXDisplayAssetContentView setNeedsUpdateContent](self, "setNeedsUpdateContent");
    v5 = v6;
  }

}

- (void)setTargetSize:(CGSize)a3
{
  if (a3.width != self->_targetSize.width || a3.height != self->_targetSize.height)
  {
    self->_targetSize = a3;
    -[PXDisplayAssetContentView setNeedsUpdateContent](self, "setNeedsUpdateContent");
  }
}

- (void)setRequestID:(int64_t)a3
{
  int64_t requestID;
  void *v6;

  requestID = self->_requestID;
  if (requestID != a3)
  {
    if (requestID)
    {
      -[PXDisplayAssetContentView mediaProvider](self, "mediaProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cancelImageRequest:", self->_requestID);

    }
    self->_requestID = a3;
  }
}

- (void)setLatestError:(id)a3
{
  NSError *v5;
  char v6;
  NSError *v7;

  v7 = (NSError *)a3;
  v5 = self->_latestError;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[NSError isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_latestError, a3);
      -[PXDisplayAssetContentView _invalidateError](self, "_invalidateError");
    }
  }

}

- (void)setError:(id)a3
{
  NSError *v5;
  NSError *v6;

  v5 = (NSError *)a3;
  if (self->_error != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_error, a3);
    -[PXDisplayAssetContentView _invalidateViewModelProperties](self, "_invalidateViewModelProperties");
    -[PXDisplayAssetContentView _updateFailureView](self, "_updateFailureView");
    -[PXDisplayAssetContentView _updateProgressView](self, "_updateProgressView");
    v5 = v6;
  }

}

- (void)setAnimatedContentEnabled:(BOOL)a3
{
  if (self->_animatedContentEnabled != a3)
  {
    self->_animatedContentEnabled = a3;
    -[PXDisplayAssetContentView animatedContentEnabledDidChange](self, "animatedContentEnabledDidChange");
  }
}

- (void)setPlaceholderTransitionDuration:(double)a3
{
  if (self->_placeholderTransitionDuration != a3)
  {
    self->_placeholderTransitionDuration = a3;
    -[PXDisplayAssetContentView placeholderTransitionDurationDidChange](self, "placeholderTransitionDurationDidChange");
  }
}

- (void)setImageProgress:(double)a3
{
  double v4;

  PXClamp();
  if (v4 != self->_imageProgress)
  {
    self->_imageProgress = v4;
    -[PXDisplayAssetContentView imageProgressDidChange](self, "imageProgressDidChange");
  }
}

- (void)setToneMapVideoToStandardDynamicRange:(BOOL)a3
{
  if (self->_toneMapVideoToStandardDynamicRange != a3)
  {
    self->_toneMapVideoToStandardDynamicRange = a3;
    -[PXDisplayAssetContentView toneMapVideoToStandardDynamicRangeDidChange](self, "toneMapVideoToStandardDynamicRangeDidChange");
  }
}

- (void)setPreferredImageDynamicRange:(int64_t)a3
{
  if (self->_preferredImageDynamicRange != a3)
  {
    self->_preferredImageDynamicRange = a3;
    -[PXDisplayAssetContentView preferredImageDynamicRangeDidChange](self, "preferredImageDynamicRangeDidChange");
  }
}

- (void)setEffectivePreferredImageDynamicRange:(int64_t)a3
{
  if (self->_effectivePreferredImageDynamicRange != a3)
  {
    self->_effectivePreferredImageDynamicRange = a3;
    -[PXDisplayAssetContentView effectivePreferredImageDynamicRangeDidChange](self, "effectivePreferredImageDynamicRangeDidChange");
  }
}

- (void)setScreenDynamicRangeMonitor:(id)a3
{
  PXDisplayScreenDynamicRangeMonitor *v5;
  PXDisplayScreenDynamicRangeMonitor *screenDynamicRangeMonitor;
  PXDisplayScreenDynamicRangeMonitor *v7;

  v5 = (PXDisplayScreenDynamicRangeMonitor *)a3;
  screenDynamicRangeMonitor = self->_screenDynamicRangeMonitor;
  if (screenDynamicRangeMonitor != v5)
  {
    v7 = v5;
    -[PXDisplayScreenDynamicRangeMonitor unregisterChangeObserver:context:](screenDynamicRangeMonitor, "unregisterChangeObserver:context:", self, PXDisplayScreenDynamicRangeObservationContext);
    objc_storeStrong((id *)&self->_screenDynamicRangeMonitor, a3);
    -[PXDisplayScreenDynamicRangeMonitor registerChangeObserver:context:](self->_screenDynamicRangeMonitor, "registerChangeObserver:context:", self, PXDisplayScreenDynamicRangeObservationContext);
    v5 = v7;
  }

}

- (void)invalidateLoadingProgress
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 2;
      goto LABEL_7;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXDisplayAssetContentView invalidateLoadingProgress]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXDisplayAssetContentView.m"), 518, CFSTR("invalidating %lu after it already has been updated"), 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 2;
  if (!willPerformUpdate)
    -[PXDisplayAssetContentView setNeedsLayout](self, "setNeedsLayout");
LABEL_7:
  -[PXDisplayAssetContentView _invalidateViewModelProperties](self, "_invalidateViewModelProperties");
}

- (void)isDisplayingFullQualityContentDidChange
{
  -[PXDisplayAssetContentView _updateProgressView](self, "_updateProgressView");
  -[PXDisplayAssetContentView _invalidateError](self, "_invalidateError");
  -[PXDisplayAssetContentView _invalidateViewModelProperties](self, "_invalidateViewModelProperties");
}

- (void)updateContent
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  PXImageRequester *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  char IsGreaterThanStandard;
  void *v28;
  _QWORD v29[13];
  char v30;

  -[PXDisplayAssetContentView asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDisplayAssetContentView mediaProvider](self, "mediaProvider");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v4)
  {
    if (!-[PXDisplayAssetContentView disableImageRequestsOnResize](self, "disableImageRequestsOnResize")
      || (-[PXDisplayAssetContentView imageRequester](self, "imageRequester"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "hasFullQuality"),
          v6,
          (v7 & 1) == 0))
    {
      -[PXDisplayAssetContentView imageRequester](self, "imageRequester");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v9 = -[PXImageRequester initWithMediaProvider:asset:]([PXImageRequester alloc], "initWithMediaProvider:asset:", v5, v3);
        -[PXDisplayAssetContentView setImageRequester:](self, "setImageRequester:", v9);

      }
      -[PXDisplayAssetContentView contentView](self, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)off_1E50B86D0;
      v12 = *((_QWORD *)off_1E50B86D0 + 1);
      v13 = *((_QWORD *)off_1E50B86D0 + 2);
      v14 = *((_QWORD *)off_1E50B86D0 + 3);
      objc_msgSend(v10, "bounds");
      v16 = v15;
      v18 = v17;
      if ((PXSizeIsEmpty() & 1) == 0 && -[PXDisplayAssetContentView contentMode](self, "contentMode") != 1)
      {
        +[PXDisplayAssetContentView preferredContentsRectForAsset:targetSize:](PXDisplayAssetContentView, "preferredContentsRectForAsset:targetSize:", v3, v16, v18);
        v11 = v19;
        v12 = v20;
        v13 = v21;
        v14 = v22;
      }
      -[PXDisplayAssetContentView window](self, "window");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "screen");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "scale");
      if (v25 == 0.0)
        v26 = 1.0;
      else
        v26 = v25;

      -[PXDisplayAssetContentView effectivePreferredImageDynamicRange](self, "effectivePreferredImageDynamicRange");
      IsGreaterThanStandard = PXImageDynamicRangeIsGreaterThanStandard();
      -[PXDisplayAssetContentView imageRequester](self, "imageRequester");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __42__PXDisplayAssetContentView_updateContent__block_invoke;
      v29[3] = &__block_descriptor_105_e35_v16__0___PXMutableImageRequester__8l;
      *(double *)&v29[4] = v16;
      *(double *)&v29[5] = v18;
      v29[6] = v11;
      v29[7] = v12;
      v29[8] = v13;
      v29[9] = v14;
      *(double *)&v29[10] = v16;
      *(double *)&v29[11] = v18;
      *(double *)&v29[12] = v26;
      v30 = IsGreaterThanStandard;
      objc_msgSend(v28, "performChanges:", v29);

    }
  }
  else
  {
    -[PXDisplayAssetContentView setImageRequester:](self, "setImageRequester:", 0);
  }

}

- (void)_invalidateError
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXDisplayAssetContentView _invalidateError]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXDisplayAssetContentView.m"), 604, CFSTR("invalidating %lu after it already has been updated"), 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 4;
  if (!willPerformUpdate)
    -[PXDisplayAssetContentView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateError
{
  id v3;

  if (-[PXDisplayAssetContentView isDisplayingFullQualityContent](self, "isDisplayingFullQualityContent"))
  {
    -[PXDisplayAssetContentView setError:](self, "setError:", 0);
  }
  else
  {
    -[PXDisplayAssetContentView latestError](self, "latestError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[PXDisplayAssetContentView setError:](self, "setError:", v3);

  }
}

- (void)_invalidateViewModelProperties
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXDisplayAssetContentView _invalidateViewModelProperties]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXDisplayAssetContentView.m"), 614, CFSTR("invalidating %lu after it already has been updated"), 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 8;
  if (!willPerformUpdate)
    -[PXDisplayAssetContentView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateViewModelProperties
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  char v7;
  _QWORD v8[5];

  -[PXDisplayAssetContentView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXDisplayAssetContentView asset](self, "asset");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v5)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v4, "isEqual:", v5);

    if ((v7 & 1) == 0)
      goto LABEL_6;
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PXDisplayAssetContentView__updateViewModelProperties__block_invoke;
  v8[3] = &unk_1E51456D8;
  v8[4] = self;
  objc_msgSend(v3, "performChanges:", v8);
LABEL_6:

}

- (void)_updateIfNeeded
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXDisplayAssetContentView _updateIfNeeded]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXDisplayAssetContentView.m"), 637, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXDisplayAssetContentView updateContent](self, "updateContent");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXDisplayAssetContentView _updateIfNeeded]");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXDisplayAssetContentView.m"), 641, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXDisplayAssetContentView _updateProgressView](self, "_updateProgressView");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXDisplayAssetContentView _updateIfNeeded]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXDisplayAssetContentView.m"), 644, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      -[PXDisplayAssetContentView _updateError](self, "_updateError");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXDisplayAssetContentView _updateIfNeeded]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXDisplayAssetContentView.m"), 647, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateFlags->needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      -[PXDisplayAssetContentView _updateViewModelProperties](self, "_updateViewModelProperties");
      v7 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXDisplayAssetContentView _updateIfNeeded]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXDisplayAssetContentView.m"), 651, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
}

- (void)_updateTargetSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PXDisplayAssetContentView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;

  if (v6 != 0.0)
  {
    -[PXDisplayAssetContentView bounds](self, "bounds");
    PXSizeScale();
    -[PXDisplayAssetContentView setTargetSize:](self, "setTargetSize:");
  }
}

- (void)_updateProgressView
{
  double v3;
  double v4;
  void *v5;
  double v6;
  PXRoundProgressView *v7;

  -[PXDisplayAssetContentView loadingProgress](self, "loadingProgress");
  PXClamp();
  v4 = v3;
  if (-[PXDisplayAssetContentView canDisplayLoadingIndicator](self, "canDisplayLoadingIndicator")
    && v4 < 1.0
    && (-[PXDisplayAssetContentView error](self, "error"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    -[PXDisplayAssetContentView progressView](self, "progressView");
    v7 = (PXRoundProgressView *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = objc_alloc_init(PXRoundProgressView);
      -[PXDisplayAssetContentView setProgressView:](self, "setProgressView:");
    }
    -[PXRoundProgressView setHidden:](v7, "setHidden:", 0);
    -[PXDisplayAssetContentView loadingProgress](self, "loadingProgress");
    *(float *)&v6 = v6;
    -[PXRoundProgressView setProgress:](v7, "setProgress:", v6);
  }
  else
  {
    -[PXDisplayAssetContentView progressView](self, "progressView");
    v7 = (PXRoundProgressView *)objc_claimAutoreleasedReturnValue();
    -[PXRoundProgressView setHidden:](v7, "setHidden:", 1);
  }

}

- (void)_updateFailureView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  PXLoadingFailureBadgeView *v10;
  id v11;

  if (!-[PXDisplayAssetContentView canDisplayLoadingIndicator](self, "canDisplayLoadingIndicator"))
  {
    -[PXDisplayAssetContentView failureView](self, "failureView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[PXDisplayAssetContentView error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXDisplayAssetContentView failureView](self, "failureView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
LABEL_7:
    v11 = v4;
    v9 = 1;
    goto LABEL_8;
  }
  if (!v4)
  {
    +[PXLoadingFailureBadgeView sizeForSizeClass:](PXLoadingFailureBadgeView, "sizeForSizeClass:", 1);
    PXRectWithOriginAndSize();
    v10 = -[PXLoadingFailureBadgeView initWithFrame:]([PXLoadingFailureBadgeView alloc], "initWithFrame:", v5, v6, v7, v8);
    -[PXDisplayAssetContentView addSubview:](self, "addSubview:", v10);
    -[PXDisplayAssetContentView setFailureView:](self, "setFailureView:", v10);
    v4 = v10;
  }
  v11 = v4;
  v9 = 0;
LABEL_8:
  objc_msgSend(v4, "setHidden:", v9);

}

- (void)setProgressView:(id)a3
{
  PXRoundProgressView *v5;
  PXRoundProgressView *progressView;
  PXRoundProgressView *v7;

  v5 = (PXRoundProgressView *)a3;
  progressView = self->_progressView;
  if (progressView != v5)
  {
    v7 = v5;
    -[PXRoundProgressView removeFromSuperview](progressView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_progressView, a3);
    -[PXDisplayAssetContentView addSubview:](self, "addSubview:", self->_progressView);
    -[PXDisplayAssetContentView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)_loadContentView
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetContentView.m"), 712, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXDisplayAssetContentView _loadContentView]", v6);

  abort();
}

- (void)preferredImageDynamicRangeDidChange
{
  void *v3;
  PXDisplayScreenDynamicRangeMonitor *v4;

  -[PXDisplayAssetContentView preferredImageDynamicRange](self, "preferredImageDynamicRange");
  if (PXImageDynamicRangeIsGreaterThanStandard())
  {
    -[PXDisplayAssetContentView screenDynamicRangeMonitor](self, "screenDynamicRangeMonitor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = objc_alloc_init(PXDisplayScreenDynamicRangeMonitor);
      -[PXDisplayAssetContentView setScreenDynamicRangeMonitor:](self, "setScreenDynamicRangeMonitor:", v4);

    }
    -[PXDisplayAssetContentView _startHeadroomMonitoringIfPossible](self, "_startHeadroomMonitoringIfPossible");
  }
  -[PXDisplayAssetContentView _updateEffectiveImageDynamicRange](self, "_updateEffectiveImageDynamicRange");
}

- (void)effectivePreferredImageDynamicRangeDidChange
{
  id v3;

  -[PXDisplayAssetContentView setNeedsUpdateContent](self, "setNeedsUpdateContent");
  -[PXDisplayAssetContentView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayAssetContentView:didChangeEffectivePreferredImageDynamicRange:", self, -[PXDisplayAssetContentView effectivePreferredImageDynamicRange](self, "effectivePreferredImageDynamicRange"));

}

- (void)_updateEffectiveImageDynamicRange
{
  void *v3;
  int v4;
  int64_t v5;

  -[PXDisplayAssetContentView screenDynamicRangeMonitor](self, "screenDynamicRangeMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "screenSupportsHDR");

  if (v4)
    v5 = -[PXDisplayAssetContentView preferredImageDynamicRange](self, "preferredImageDynamicRange");
  else
    v5 = 0;
  -[PXDisplayAssetContentView setEffectivePreferredImageDynamicRange:](self, "setEffectivePreferredImageDynamicRange:", v5);
}

- (void)_startHeadroomMonitoringIfPossible
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  -[PXDisplayAssetContentView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXDisplayAssetContentView screenDynamicRangeMonitor](self, "screenDynamicRangeMonitor");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[PXDisplayAssetContentView screenDynamicRangeMonitor](self, "screenDynamicRangeMonitor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isMonitoring");

      if ((v7 & 1) == 0)
      {
        objc_initWeak(&location, self);
        -[PXDisplayAssetContentView screenDynamicRangeMonitor](self, "screenDynamicRangeMonitor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __63__PXDisplayAssetContentView__startHeadroomMonitoringIfPossible__block_invoke;
        v9[3] = &unk_1E5124150;
        objc_copyWeak(&v10, &location);
        objc_msgSend(v8, "startMonitoringWithScreenProvider:", v9);

        objc_destroyWeak(&v10);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)_stopHeadroomMonitoring
{
  void *v3;
  void *v4;

  -[PXDisplayAssetContentView screenDynamicRangeMonitor](self, "screenDynamicRangeMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXDisplayAssetContentView screenDynamicRangeMonitor](self, "screenDynamicRangeMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopMonitoring");

    -[PXDisplayAssetContentView setScreenDynamicRangeMonitor:](self, "setScreenDynamicRangeMonitor:", 0);
  }
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (int64_t)playbackStyle
{
  return self->_playbackStyle;
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (NSArray)placeholderImageFilters
{
  return self->_placeholderImageFilters;
}

- (double)placeholderTransitionDuration
{
  return self->_placeholderTransitionDuration;
}

- (BOOL)canDisplayLoadingIndicator
{
  return self->_canDisplayLoadingIndicator;
}

- (void)setCanDisplayLoadingIndicator:(BOOL)a3
{
  self->_canDisplayLoadingIndicator = a3;
}

- (BOOL)isDisplayingFullQualityContent
{
  return self->_isDisplayingFullQualityContent;
}

- (void)setIsDisplayingFullQualityContent:(BOOL)a3
{
  self->_isDisplayingFullQualityContent = a3;
}

- (BOOL)disableImageRequestsOnResize
{
  return self->_disableImageRequestsOnResize;
}

- (void)setDisableImageRequestsOnResize:(BOOL)a3
{
  self->_disableImageRequestsOnResize = a3;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)isAnimatedContentEnabled
{
  return self->_animatedContentEnabled;
}

- (BOOL)toneMapVideoToStandardDynamicRange
{
  return self->_toneMapVideoToStandardDynamicRange;
}

- (int64_t)preferredImageDynamicRange
{
  return self->_preferredImageDynamicRange;
}

- (PXDisplayAssetViewModel)viewModel
{
  return self->_viewModel;
}

- (int64_t)effectivePreferredImageDynamicRange
{
  return self->_effectivePreferredImageDynamicRange;
}

- (PXDisplayAssetContentViewDelegate)delegate
{
  return (PXDisplayAssetContentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (CGRect)contentBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentBounds.origin.x;
  y = self->_contentBounds.origin.y;
  width = self->_contentBounds.size.width;
  height = self->_contentBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSError)latestError
{
  return self->_latestError;
}

- (PXRoundProgressView)progressView
{
  return self->_progressView;
}

- (PXLoadingFailureBadgeView)failureView
{
  return self->_failureView;
}

- (void)setFailureView:(id)a3
{
  objc_storeStrong((id *)&self->_failureView, a3);
}

- (PXDisplayScreenDynamicRangeMonitor)screenDynamicRangeMonitor
{
  return self->_screenDynamicRangeMonitor;
}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGRect)contentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentsRect.origin.x;
  y = self->_contentsRect.origin.y;
  width = self->_contentsRect.size.width;
  height = self->_contentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIImage)image
{
  return self->_image;
}

- (PXImageRequester)imageRequester
{
  return self->_imageRequester;
}

- (double)imageProgress
{
  return self->_imageProgress;
}

- (int64_t)requestID
{
  return self->_requestID;
}

- (double)loadingProgress
{
  return self->_loadingProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageRequester, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_screenDynamicRangeMonitor, 0);
  objc_storeStrong((id *)&self->_failureView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_latestError, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_placeholderImageFilters, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

id __63__PXDisplayAssetContentView__startHeadroomMonitoringIfPossible__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __55__PXDisplayAssetContentView__updateViewModelProperties__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCurrentImage:", v5);

  objc_msgSend(v4, "setIsDisplayingFullQualityContent:", objc_msgSend(*(id *)(a1 + 32), "isDisplayingFullQualityContent"));
  objc_msgSend(*(id *)(a1 + 32), "loadingProgress");
  *(float *)&v6 = v6;
  objc_msgSend(v4, "setLoadingProgress:", v6);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLoadingError:", v7);

}

void __42__PXDisplayAssetContentView_updateContent__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setContentSize:", *(double *)(a1 + 32), *(double *)(a1 + 40));
  objc_msgSend(v3, "setDesiredContentsRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(v3, "setViewportSize:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(v3, "setScale:", *(double *)(a1 + 96));
  objc_msgSend(v3, "setPreferHDR:", *(unsigned __int8 *)(a1 + 104));
  if (*(_BYTE *)(a1 + 104))
    objc_msgSend(v3, "setTargetHDRHeadroom:", 0.0);

}

uint64_t __58__PXDisplayAssetContentView_observable_didChange_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = *(_QWORD *)(a1 + 40);
  if ((v2 & 0x80) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "imageRequester");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentsRect");
    objc_msgSend(*(id *)(a1 + 32), "setContentsRect:");

    v2 = *(_QWORD *)(a1 + 40);
  }
  if ((v2 & 0x1008) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "imageRequester");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasFullQuality");
    v6 = 1.0;
    if ((v5 & 1) == 0)
      objc_msgSend(v4, "loadingProgress", 1.0);
    objc_msgSend(*(id *)(a1 + 32), "setImageProgress:", v6);

    v2 = *(_QWORD *)(a1 + 40);
  }
  if ((v2 & 0x2000) != 0)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "imageRequester");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loadingError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleError:", v9);

    v2 = *(_QWORD *)(a1 + 40);
  }
  if ((v2 & 4) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "imageRequester");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setImage:", v11);

    v2 = *(_QWORD *)(a1 + 40);
  }
  return objc_msgSend(*(id *)(a1 + 32), "imageRequesterDidChange:", v2);
}

void __32__PXDisplayAssetContentView_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.ui", "PXDisplayAssetContentView");
  v1 = (void *)log_log;
  log_log = (uint64_t)v0;

}

+ (PXReusableObjectPool)viewPool
{
  if (viewPool_onceToken != -1)
    dispatch_once(&viewPool_onceToken, &__block_literal_global_87233);
  return (PXReusableObjectPool *)(id)viewPool_pool;
}

+ (id)checkOutViewForAsset:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "checkOutViewForAsset:withPlaybackStyle:", v4, objc_msgSend(v4, "playbackStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)checkOutViewForAsset:(id)a3 withPlaybackStyle:(int64_t)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  if ((unint64_t)(a4 - 2) > 3)
    v5 = 0;
  else
    v5 = qword_1A7C09738[a4 - 2];
  v6 = a3;
  objc_msgSend(a1, "viewPool");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "checkOutReusableObjectWithReuseIdentifier:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAsset:", v6);
  return v8;
}

+ (void)checkInView:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  px_dispatch_on_main_queue();

}

+ (CGRect)preferredContentsRectForAsset:(id)a3 targetSize:(CGSize)a4
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
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v4 = a3;
  PXSizeGetAspectRatioWithDefault();
  v6 = PXCuratedLibraryBestCropRectForAssetInZoomLevel(v4, 3, 1, v5);
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

void __41__PXDisplayAssetContentView_checkInView___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 40), "viewPool");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "checkInReusableObject:", *(_QWORD *)(a1 + 32));

}

uint64_t __37__PXDisplayAssetContentView_viewPool__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)off_1E50B46A0);
  v1 = (void *)viewPool_pool;
  viewPool_pool = (uint64_t)v0;

  objc_msgSend((id)viewPool_pool, "registerReusableObjectForReuseIdentifier:creationHandler:", 0, &__block_literal_global_129_87235);
  objc_msgSend((id)viewPool_pool, "registerReusableObjectForReuseIdentifier:creationHandler:", 4, &__block_literal_global_131_87236);
  objc_msgSend((id)viewPool_pool, "registerReusableObjectForReuseIdentifier:creationHandler:", 1, &__block_literal_global_133_87237);
  objc_msgSend((id)viewPool_pool, "registerReusableObjectForReuseIdentifier:creationHandler:", 2, &__block_literal_global_135_87238);
  return objc_msgSend((id)viewPool_pool, "registerReusableObjectForReuseIdentifier:creationHandler:", 3, &__block_literal_global_136_87239);
}

PXDisplayAssetImageContentView *__37__PXDisplayAssetContentView_viewPool__block_invoke_6()
{
  return objc_alloc_init(PXDisplayAssetImageContentView);
}

PXDisplayAssetLoopingVideoContentView *__37__PXDisplayAssetContentView_viewPool__block_invoke_5()
{
  return objc_alloc_init(PXDisplayAssetLoopingVideoContentView);
}

PXDisplayAssetLoopingVideoContentView *__37__PXDisplayAssetContentView_viewPool__block_invoke_4()
{
  return objc_alloc_init(PXDisplayAssetLoopingVideoContentView);
}

PXDisplayAssetLivePhotoContentView *__37__PXDisplayAssetContentView_viewPool__block_invoke_3()
{
  return objc_alloc_init(PXDisplayAssetLivePhotoContentView);
}

PXDisplayAssetImageContentView *__37__PXDisplayAssetContentView_viewPool__block_invoke_2()
{
  return objc_alloc_init(PXDisplayAssetImageContentView);
}

@end
