@implementation PUProgressIndicatorTileViewController

- (id)view
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUProgressIndicatorTileViewController;
  -[PUTileViewController view](&v3, sel_view);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)loadView
{
  _PUProgressIndicatorTileView *v3;

  v3 = objc_alloc_init(_PUProgressIndicatorTileView);
  -[_PUProgressIndicatorTileView setTraitCollectionDelegate:](v3, "setTraitCollectionDelegate:", self);
  return v3;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUProgressIndicatorTileViewController;
  -[PUTileViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PUProgressIndicatorTileViewController _invalidateSizeClass](self, "_invalidateSizeClass");
  -[PUProgressIndicatorTileViewController _invalidateStatusViews](self, "_invalidateStatusViews");
  -[PUProgressIndicatorTileViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)becomeReusable
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUProgressIndicatorTileViewController;
  -[PUTileViewController becomeReusable](&v3, sel_becomeReusable);
  -[PUProgressIndicatorTileViewController setAssetViewModel:](self, "setAssetViewModel:", 0);
  -[PUProgressIndicatorTileViewController setBrowsingViewModel:](self, "setBrowsingViewModel:", 0);
  -[PUProgressIndicatorTileViewController setAssetSharedViewModel:](self, "setAssetSharedViewModel:", 0);
}

- (void)setAssetSharedViewModel:(id)a3
{
  PUAssetSharedViewModel *v5;
  PUAssetSharedViewModel *assetSharedViewModel;
  PUAssetSharedViewModel *v7;

  v5 = (PUAssetSharedViewModel *)a3;
  assetSharedViewModel = self->_assetSharedViewModel;
  if (assetSharedViewModel != v5)
  {
    v7 = v5;
    -[PUAssetSharedViewModel unregisterChangeObserver:](assetSharedViewModel, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_assetSharedViewModel, a3);
    -[PUAssetSharedViewModel registerChangeObserver:](self->_assetSharedViewModel, "registerChangeObserver:", self);
    -[PUProgressIndicatorTileViewController _invalidateProgressViewStyle](self, "_invalidateProgressViewStyle");
    -[PUProgressIndicatorTileViewController _invalidateStatus](self, "_invalidateStatus");
    -[PUProgressIndicatorTileViewController _updateIfNeeded](self, "_updateIfNeeded");
    v5 = v7;
  }

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
    -[PUProgressIndicatorTileViewController _invalidateStatusViews](self, "_invalidateStatusViews");
    -[PUProgressIndicatorTileViewController _updateIfNeeded](self, "_updateIfNeeded");
    v5 = v7;
  }

}

- (void)setBrowsingViewModel:(id)a3
{
  PUBrowsingViewModel *v5;
  PUBrowsingViewModel *browsingViewModel;
  PUBrowsingViewModel *v7;

  v5 = (PUBrowsingViewModel *)a3;
  browsingViewModel = self->_browsingViewModel;
  if (browsingViewModel != v5)
  {
    v7 = v5;
    -[PUBrowsingViewModel unregisterChangeObserver:](browsingViewModel, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_browsingViewModel, a3);
    -[PUBrowsingViewModel registerChangeObserver:](self->_browsingViewModel, "registerChangeObserver:", self);
    -[PUProgressIndicatorTileViewController _invalidateStatusViews](self, "_invalidateStatusViews");
    -[PUProgressIndicatorTileViewController _updateIfNeeded](self, "_updateIfNeeded");
    v5 = v7;
  }

}

- (void)applyLayoutInfo:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUProgressIndicatorTileViewController;
  -[PUTileViewController applyLayoutInfo:](&v4, sel_applyLayoutInfo_, a3);
  -[PUProgressIndicatorTileViewController _invalidateSizeClass](self, "_invalidateSizeClass");
  -[PUProgressIndicatorTileViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)_setProgressViewStyle:(int64_t)a3
{
  if (self->__progressViewStyle != a3)
  {
    self->__progressViewStyle = a3;
    -[PUProgressIndicatorTileViewController _invalidateStatusViews](self, "_invalidateStatusViews");
  }
}

- (void)_setStatus:(id)a3
{
  PXOperationStatus *v5;
  PXOperationStatus *v6;
  PXOperationStatus **p_status;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  NSObject *v13;
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (PXOperationStatus *)a3;
  v6 = v5;
  p_status = &self->__status;
  if (self->__status == v5 || (-[PXOperationStatus isEqual:](v5, "isEqual:") & 1) != 0)
    goto LABEL_17;
  v8 = -[PXOperationStatus state](*p_status, "state");
  if (v8 == -[PXOperationStatus state](v6, "state"))
  {
    if (-[PXOperationStatus state](v6, "state") != 1)
      goto LABEL_11;
    PLOneUpGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v14 = 138543362;
      *(_QWORD *)&v14[4] = v6;
      v10 = v9;
      v11 = OS_LOG_TYPE_DEBUG;
LABEL_9:
      _os_log_impl(&dword_1AAB61000, v10, v11, "1up Progress Indicator: Updating status to %{public}@", v14, 0xCu);
    }
  }
  else
  {
    PLOneUpGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v14 = 138543362;
      *(_QWORD *)&v14[4] = v6;
      v10 = v9;
      v11 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_9;
    }
  }

LABEL_11:
  objc_storeStrong((id *)&self->__status, a3);
  if (-[PXOperationStatus state](*p_status, "state") == 3)
  {
    -[PXOperationStatus error](*p_status, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      PLOneUpGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_DEFAULT, "1up Progress Indicator: Status is failed, but has no error", v14, 2u);
      }

    }
  }
  -[PUProgressIndicatorTileViewController _invalidateStatusViews](self, "_invalidateStatusViews", *(_OWORD *)v14);
LABEL_17:

}

- (void)_setSizeClass:(int64_t)a3
{
  if (self->__sizeClass != a3)
  {
    self->__sizeClass = a3;
    -[PUProgressIndicatorTileViewController _invalidateStatusViews](self, "_invalidateStatusViews");
  }
}

- (void)_setProgressViewVisible:(BOOL)a3
{
  -[PUProgressIndicatorTileViewController _setProgressViewVisible:animated:](self, "_setProgressViewVisible:animated:", a3, 0);
}

- (void)_setProgressViewVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  id *v9;
  void (**v10)(_QWORD);
  void (**v11)(_QWORD);
  NSObject *v12;
  uint64_t v13;
  id v14;
  void (**v15)(void *, uint64_t);
  _QWORD v16[4];
  id v17;
  PUProgressIndicatorTileViewController *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[8];
  _QWORD aBlock[4];
  id v23;

  if (self->__isProgressViewVisible != a3)
  {
    v4 = a4;
    v5 = a3;
    self->__isProgressViewVisible = a3;
    -[PUProgressIndicatorTileViewController _progressView](self, "_progressView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      objc_msgSend(v7, "startProgressTimer");
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __74__PUProgressIndicatorTileViewController__setProgressViewVisible_animated___block_invoke;
      aBlock[3] = &unk_1E58ABD10;
      v9 = &v23;
      v23 = v8;
      v10 = (void (**)(_QWORD))_Block_copy(aBlock);
      v11 = v10;
      if (v4)
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v10, 0, 0.2, 1.0);
      else
        v10[2](v10);
    }
    else
    {
      if (-[PUProgressIndicatorTileViewController _didStartProgressLogging](self, "_didStartProgressLogging"))
      {
        -[PUProgressIndicatorTileViewController _progressLog](self, "_progressLog");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v12))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1AAB61000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "OneUpDownloadLatency", " enableTelemetry=YES ", buf, 2u);
        }

        -[PUProgressIndicatorTileViewController _setDidStartProgressLogging:](self, "_setDidStartProgressLogging:", 0);
      }
      v13 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __74__PUProgressIndicatorTileViewController__setProgressViewVisible_animated___block_invoke_175;
      v19[3] = &unk_1E58ABD10;
      v9 = &v20;
      v14 = v8;
      v20 = v14;
      v11 = (void (**)(_QWORD))_Block_copy(v19);
      v16[0] = v13;
      v16[1] = 3221225472;
      v16[2] = __74__PUProgressIndicatorTileViewController__setProgressViewVisible_animated___block_invoke_2;
      v16[3] = &unk_1E58AAE08;
      v17 = v14;
      v18 = self;
      v15 = (void (**)(void *, uint64_t))_Block_copy(v16);
      if (v4)
      {
        -[PUProgressIndicatorTileViewController setIsProgressViewAnimatingOut:](self, "setIsProgressViewAnimatingOut:", 1);
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v11, v15, 0.2, 0.3);
      }
      else
      {
        v11[2](v11);
        v15[2](v15, 1);
      }

    }
  }
}

- (void)_handleErrorButtonTap:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  -[PUProgressIndicatorTileViewController errorPresenter](self, "errorPresenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PUProgressIndicatorTileViewController _status](self, "_status");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "error");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      -[PUProgressIndicatorTileViewController assetViewModel](self, "assetViewModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "videoPlayer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "error");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[PUProgressIndicatorTileViewController errorPresenter](self, "errorPresenter");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v8)[2](v8, v9);

  }
}

- (void)postReloadNotification
{
  void *v2;
  void *v3;
  id v4;

  -[PUProgressIndicatorTileViewController assetSharedViewModel](self, "assetSharedViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asset");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("PUShouldReloadAssetMediaNotification"), v4);

}

- (void)_updateIfNeeded
{
  id v4;

  if (-[PUProgressIndicatorTileViewController _needsUpdate](self, "_needsUpdate")
    && -[PUTileViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PUProgressIndicatorTileViewController _updateProgressViewStyleIfNeeded](self, "_updateProgressViewStyleIfNeeded");
    -[PUProgressIndicatorTileViewController _updateStatusIfNeeded](self, "_updateStatusIfNeeded");
    -[PUProgressIndicatorTileViewController _updateSizeClassIfNeeded](self, "_updateSizeClassIfNeeded");
    -[PUProgressIndicatorTileViewController _updateStatusViewsIfNeeded](self, "_updateStatusViewsIfNeeded");
    if (-[PUProgressIndicatorTileViewController _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUProgressIndicatorTileViewController.m"), 352, CFSTR("updates still needed after an update cycle"));

    }
  }
}

- (BOOL)_needsUpdate
{
  return -[PUProgressIndicatorTileViewController _needsUpdateProgressViewStyle](self, "_needsUpdateProgressViewStyle")
      || -[PUProgressIndicatorTileViewController _needsUpdateStatus](self, "_needsUpdateStatus")
      || -[PUProgressIndicatorTileViewController _needsUpdateSizeClass](self, "_needsUpdateSizeClass")
      || -[PUProgressIndicatorTileViewController _needsUpdateStatusViews](self, "_needsUpdateStatusViews");
}

- (void)_invalidateProgressViewStyle
{
  -[PUProgressIndicatorTileViewController _setNeedsUpdateProgressViewStyle:](self, "_setNeedsUpdateProgressViewStyle:", 1);
  -[PUProgressIndicatorTileViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateProgressViewStyleIfNeeded
{
  void *v3;
  uint64_t v4;
  id v5;

  if (-[PUProgressIndicatorTileViewController _needsUpdateProgressViewStyle](self, "_needsUpdateProgressViewStyle"))
  {
    -[PUProgressIndicatorTileViewController _setNeedsUpdateProgressViewStyle:](self, "_setNeedsUpdateProgressViewStyle:", 0);
    -[PUProgressIndicatorTileViewController assetSharedViewModel](self, "assetSharedViewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "asset");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "canPlayPhotoIris"))
      v4 = 2;
    else
      v4 = 0;
    -[PUProgressIndicatorTileViewController _setProgressViewStyle:](self, "_setProgressViewStyle:", v4);

  }
}

- (void)_invalidateStatus
{
  -[PUProgressIndicatorTileViewController _setNeedsUpdateStatus:](self, "_setNeedsUpdateStatus:", 1);
  -[PUProgressIndicatorTileViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateStatusIfNeeded
{
  void *v3;
  id v4;

  if (-[PUProgressIndicatorTileViewController _needsUpdateStatus](self, "_needsUpdateStatus"))
  {
    -[PUProgressIndicatorTileViewController _setNeedsUpdateStatus:](self, "_setNeedsUpdateStatus:", 0);
    -[PUProgressIndicatorTileViewController assetSharedViewModel](self, "assetSharedViewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "loadingStatus");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    -[PUProgressIndicatorTileViewController _setStatus:](self, "_setStatus:", v4);
  }
}

- (void)_invalidateSizeClass
{
  -[PUProgressIndicatorTileViewController _setNeedsUpdateSizeClass:](self, "_setNeedsUpdateSizeClass:", 1);
  -[PUProgressIndicatorTileViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateSizeClassIfNeeded
{
  void *v3;
  uint64_t v4;
  id v5;

  if (-[PUProgressIndicatorTileViewController _needsUpdateSizeClass](self, "_needsUpdateSizeClass"))
  {
    -[PUProgressIndicatorTileViewController _setNeedsUpdateSizeClass:](self, "_setNeedsUpdateSizeClass:", 0);
    if (-[PUTileViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[PUProgressIndicatorTileViewController view](self, "view");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "traitCollection");
      v5 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v5, "horizontalSizeClass") == 2)
      {
        if (objc_msgSend(v5, "verticalSizeClass") == 2)
          v4 = 2;
        else
          v4 = 1;
      }
      else
      {
        v4 = 1;
      }
      -[PUProgressIndicatorTileViewController _setSizeClass:](self, "_setSizeClass:", v4);

    }
  }
}

- (void)_invalidateStatusViews
{
  -[PUProgressIndicatorTileViewController _setNeedsUpdateStatusViews:](self, "_setNeedsUpdateStatusViews:", 1);
  -[PUProgressIndicatorTileViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateStatusViewsIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  _BOOL4 v27;
  double v28;
  _BOOL4 v29;
  BOOL v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  char v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  int v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t);
  uint64_t *v55;
  id v56;
  int64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint8_t buf[4];
  uint64_t v61;
  uint64_t v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  v62 = *MEMORY[0x1E0C80C00];
  if (-[PUProgressIndicatorTileViewController _needsUpdateStatusViews](self, "_needsUpdateStatusViews"))
  {
    -[PUProgressIndicatorTileViewController _setNeedsUpdateStatusViews:](self, "_setNeedsUpdateStatusViews:", 0);
    if (-[PUTileViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[PUProgressIndicatorTileViewController _status](self, "_status");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "state");
      v57 = -[PUProgressIndicatorTileViewController _sizeClass](self, "_sizeClass");
      -[PUProgressIndicatorTileViewController assetViewModel](self, "assetViewModel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "videoPlayer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[PUProgressIndicatorTileViewController _progressView](self, "_progressView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PUProgressIndicatorTileViewController _progressViewStyle](self, "_progressViewStyle");
      if (v7 && objc_msgSend(v7, "style") != v8)
      {
        objc_msgSend(v7, "removeFromSuperview");
        -[PUProgressIndicatorTileViewController _setProgressView:](self, "_setProgressView:", 0);

        v7 = 0;
      }
      v9 = objc_msgSend(v6, "isPlaybackDesired");
      -[PUProgressIndicatorTileViewController assetSharedViewModel](self, "assetSharedViewModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "needsDeferredProcessing");

      -[PUProgressIndicatorTileViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(v4 - 3) < 0xFFFFFFFFFFFFFFFELL || (v11 & 1) != 0 || (v9 & 1) != 0)
      {
        -[PUProgressIndicatorTileViewController _setProgressViewVisible:](self, "_setProgressViewVisible:", 0);
        if (!v7)
          goto LABEL_22;
        objc_msgSend(v7, "removeFromSuperview");
        -[PUProgressIndicatorTileViewController _setProgressView:](self, "_setProgressView:", 0);
      }
      else
      {
        if (!v7)
        {
          objc_msgSend((id)objc_opt_class(), "progressIndicatorTileSizeForSizeClass:", v57);
          v14 = v13;
          v16 = v15;
          objc_msgSend((id)objc_opt_class(), "progressIndicatorIconSizeForSizeClass:", v57);
          v18 = v17;
          v20 = v19;
          v63.origin.x = 0.0;
          v63.origin.y = 0.0;
          v63.size.width = v14;
          v63.size.height = v16;
          v21 = (CGRectGetWidth(v63) - v18) * 0.5;
          v64.origin.x = 0.0;
          v64.origin.y = 0.0;
          v64.size.width = v14;
          v64.size.height = v16;
          v22 = (CGRectGetHeight(v64) - v20) * 0.5;
          v65.origin.x = 0.0;
          v65.origin.y = 0.0;
          v65.size.width = v14;
          v65.size.height = v16;
          v66 = CGRectInset(v65, v21, v22);
          v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D714B8]), "initWithFrame:style:", v8, v66.origin.x, v66.origin.y, v66.size.width, v66.size.height);
          objc_msgSend(v7, "setAlpha:", 0.0);
          objc_msgSend(v12, "addSubview:", v7);
          -[PUProgressIndicatorTileViewController _setProgressView:](self, "_setProgressView:", v7);
          -[PUProgressIndicatorTileViewController _updateSubviewOrdering](self, "_updateSubviewOrdering");
          -[PUProgressIndicatorTileViewController assetSharedViewModel](self, "assetSharedViewModel");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "asset");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = objc_msgSend(v24, "playbackStyle");
          -[PUProgressIndicatorTileViewController _progressLog](self, "_progressLog");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v26))
          {
            *(_DWORD *)buf = 134349056;
            v61 = v25;
            _os_signpost_emit_with_name_impl(&dword_1AAB61000, v26, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "OneUpDownloadLatency", " enableTelemetry=YES playbackStyle=%{public}ld", buf, 0xCu);
          }

          -[PUProgressIndicatorTileViewController _setDidStartProgressLogging:](self, "_setDidStartProgressLogging:", 1);
        }
        v27 = v4 != 2;
        objc_msgSend(v3, "progress");
        v29 = v28 < 1.0;
        v30 = v27 && v29;
        if (v27 && v29)
          v31 = v28;
        else
          v31 = 1.0;
        objc_msgSend(v7, "progress");
        if (v31 < v32)
          objc_msgSend(v7, "resetProgress");
        objc_msgSend(v7, "setProgress:", v31);
        -[PUProgressIndicatorTileViewController _setProgressViewVisible:animated:](self, "_setProgressViewVisible:animated:", v30, 1);
      }

LABEL_22:
      -[PUProgressIndicatorTileViewController _errorButton](self, "_errorButton");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v3, "error");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "domain");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "isEqualToString:", *MEMORY[0x1E0CD1D80]);

        if (v4 == 3 && (!v36 || objc_msgSend(v34, "code") != 3306 && objc_msgSend(v34, "code") != 3170))
        {

          if (v33)
            goto LABEL_33;
          goto LABEL_55;
        }
        if (objc_msgSend(v6, "playState") == 5 && objc_msgSend(v6, "desiredPlayState") == 4)
        {
          -[PUProgressIndicatorTileViewController assetViewModel](self, "assetViewModel");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "isPresentedForPreview");

          if ((v38 & 1) != 0)
            goto LABEL_35;
LABEL_32:
          if (v33)
          {
LABEL_33:
            objc_msgSend((id)objc_opt_class(), "_loadErrorIconForSizeClass:", v57);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setImage:forState:", v39, 0);

            v40 = 1;
            goto LABEL_37;
          }
LABEL_55:
          objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "bounds");
          objc_msgSend(v33, "setFrame:");
          objc_msgSend(v33, "setAutoresizingMask:", 18);
          objc_msgSend(v33, "addTarget:action:forControlEvents:", self, sel__handleErrorButtonTap_, 64);
          objc_msgSend(v12, "addSubview:", v33);
          -[PUProgressIndicatorTileViewController _setErrorButton:](self, "_setErrorButton:", v33);
          -[PUProgressIndicatorTileViewController _updateSubviewOrdering](self, "_updateSubviewOrdering");
          goto LABEL_33;
        }

      }
      else if (v4 == 3)
      {
        goto LABEL_32;
      }
LABEL_35:
      if (!v33)
      {
        v40 = 0;
LABEL_39:
        -[PUProgressIndicatorTileViewController _debugProgressLabel](self, "_debugProgressLabel");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "useDebuggingProgressLabel");

        if (v43)
        {
          if (!v41)
          {
            objc_msgSend(v12, "bounds");
            v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v44 + -150.0, v46, v45 + 150.0, v47);
            objc_msgSend(v41, "setAutoresizingMask:", 18);
            objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 10.0);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "setFont:", v48);

            objc_msgSend(v41, "setTextAlignment:", 1);
            objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "setTextColor:", v49);

            objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.100000001);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "setBackgroundColor:", v50);

            objc_msgSend(v12, "addSubview:", v41);
            -[PUProgressIndicatorTileViewController _setDebugProgressLabel:](self, "_setDebugProgressLabel:", v41);
            -[PUProgressIndicatorTileViewController _updateSubviewOrdering](self, "_updateSubviewOrdering");
          }
          objc_msgSend(v3, "description");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setText:", v51);

        }
        else
        {
          if (!v41)
          {
LABEL_46:
            -[PUProgressIndicatorTileViewController assetViewModel](self, "assetViewModel");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[PUProgressIndicatorTileViewController _isProgressViewVisible](self, "_isProgressViewVisible")
              || (v40 | -[PUProgressIndicatorTileViewController isProgressViewAnimatingOut](self, "isProgressViewAnimatingOut") | v43) == 1)
            {
              v59 = MEMORY[0x1E0C809B0];
              v53 = 1;
              v54 = __67__PUProgressIndicatorTileViewController__updateStatusViewsIfNeeded__block_invoke;
              v55 = &v59;
            }
            else
            {
              v53 = 0;
              if (objc_msgSend(v52, "statusCornerState"))
                goto LABEL_50;
              v58 = MEMORY[0x1E0C809B0];
              v54 = __67__PUProgressIndicatorTileViewController__updateStatusViewsIfNeeded__block_invoke_2;
              v55 = &v58;
            }
            v55[1] = 3221225472;
            v55[2] = (uint64_t)v54;
            v55[3] = (uint64_t)&unk_1E58ABD10;
            v56 = v52;
            v55[4] = (uint64_t)v56;
            objc_msgSend(v56, "performChanges:", v55);

LABEL_50:
            objc_msgSend(v12, "setShowingErrorProgressView:", v53);

            return;
          }
          objc_msgSend(v41, "removeFromSuperview");
          -[PUProgressIndicatorTileViewController _setDebugProgressLabel:](self, "_setDebugProgressLabel:", 0);
        }

        goto LABEL_46;
      }
      objc_msgSend(v33, "removeFromSuperview");
      -[PUProgressIndicatorTileViewController _setErrorButton:](self, "_setErrorButton:", 0);
      v40 = 0;
LABEL_37:

      goto LABEL_39;
    }
  }
}

- (void)viewTraitCollectionDidChange:(id)a3
{
  -[PUProgressIndicatorTileViewController _invalidateStatusViews](self, "_invalidateStatusViews", a3);
  -[PUProgressIndicatorTileViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)_updateSubviewOrdering
{
  void *v3;
  void *v4;
  id v5;

  -[PUProgressIndicatorTileViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PUProgressIndicatorTileViewController _debugProgressLabel](self, "_debugProgressLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bringSubviewToFront:", v3);

  -[PUProgressIndicatorTileViewController _errorButton](self, "_errorButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bringSubviewToFront:", v4);

}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[PUProgressIndicatorTileViewController assetSharedViewModel](self, "assetSharedViewModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v10)
  {
    -[PUProgressIndicatorTileViewController _handleAssetSharedViewModel:didChange:](self, "_handleAssetSharedViewModel:didChange:", v10, v6);
  }
  else
  {
    -[PUProgressIndicatorTileViewController assetViewModel](self, "assetViewModel");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v10)
    {
      -[PUProgressIndicatorTileViewController _handleAssetViewModel:didChange:](self, "_handleAssetViewModel:didChange:", v10, v6);
    }
    else
    {
      -[PUProgressIndicatorTileViewController browsingViewModel](self, "browsingViewModel");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9 == v10)
        -[PUProgressIndicatorTileViewController _handleBrowsingViewModel:didChange:](self, "_handleBrowsingViewModel:didChange:", v10, v6);
    }
  }

}

- (void)_handleAssetSharedViewModel:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "loadingStatusChanged", a3))
  {
    -[PUProgressIndicatorTileViewController _invalidateStatus](self, "_invalidateStatus");
    -[PUProgressIndicatorTileViewController _updateIfNeeded](self, "_updateIfNeeded");
  }
}

- (void)_handleAssetViewModel:(id)a3 didChange:(id)a4
{
  void *v5;
  int v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a4;
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowsVisualIntelligenceV2");

  v7 = objc_msgSend(v11, "accessoryViewVisibilityChanged");
  if (v6)
  {
    if ((v7 & 1) == 0
      && (objc_msgSend(v11, "visualImageAnalysisChanged") & 1) == 0
      && (objc_msgSend(v11, "isPresentedForPreviewChanged") & 1) == 0)
    {
      goto LABEL_10;
    }
LABEL_9:
    -[PUProgressIndicatorTileViewController _invalidateStatusViews](self, "_invalidateStatusViews");
    goto LABEL_10;
  }
  if ((v7 & 1) != 0
    || (objc_msgSend(v11, "isPresentedForPreviewChanged") & 1) != 0
    || objc_msgSend(v11, "videoPlayerDidChange"))
  {
    goto LABEL_9;
  }
LABEL_10:
  if ((objc_msgSend(v11, "videoPlayerDidChange") & 1) != 0)
  {
LABEL_14:
    -[PUProgressIndicatorTileViewController _invalidateStatusViews](self, "_invalidateStatusViews");
    goto LABEL_15;
  }
  objc_msgSend(v11, "videoPlayerChange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "desiredPlayStateDidChange"))
  {

    goto LABEL_14;
  }
  objc_msgSend(v11, "videoPlayerChange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "playStateDidChange");

  if (v10)
    goto LABEL_14;
LABEL_15:
  -[PUProgressIndicatorTileViewController _updateIfNeeded](self, "_updateIfNeeded");

}

- (void)_handleBrowsingViewModel:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "chromeVisibilityDidChange", a3))
  {
    -[PUProgressIndicatorTileViewController _invalidateStatusViews](self, "_invalidateStatusViews");
    -[PUProgressIndicatorTileViewController _updateIfNeeded](self, "_updateIfNeeded");
  }
}

- (OS_os_log)_progressLog
{
  if (_progressLog_onceToken != -1)
    dispatch_once(&_progressLog_onceToken, &__block_literal_global_76484);
  return (OS_os_log *)(id)_progressLog_progressLog;
}

- (PUAssetSharedViewModel)assetSharedViewModel
{
  return self->_assetSharedViewModel;
}

- (id)errorPresenter
{
  return self->_errorPresenter;
}

- (void)setErrorPresenter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (BOOL)_needsUpdateProgressViewStyle
{
  return self->__needsUpdateProgressViewStyle;
}

- (void)_setNeedsUpdateProgressViewStyle:(BOOL)a3
{
  self->__needsUpdateProgressViewStyle = a3;
}

- (BOOL)_needsUpdateStatus
{
  return self->__needsUpdateStatus;
}

- (void)_setNeedsUpdateStatus:(BOOL)a3
{
  self->__needsUpdateStatus = a3;
}

- (BOOL)_needsUpdateSizeClass
{
  return self->__needsUpdateSizeClass;
}

- (void)_setNeedsUpdateSizeClass:(BOOL)a3
{
  self->__needsUpdateSizeClass = a3;
}

- (BOOL)_needsUpdateStatusViews
{
  return self->__needsUpdateStatusViews;
}

- (void)_setNeedsUpdateStatusViews:(BOOL)a3
{
  self->__needsUpdateStatusViews = a3;
}

- (int64_t)_progressViewStyle
{
  return self->__progressViewStyle;
}

- (PXOperationStatus)_status
{
  return self->__status;
}

- (int64_t)_sizeClass
{
  return self->__sizeClass;
}

- (PLRoundProgressView)_progressView
{
  return self->__progressView;
}

- (void)_setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->__progressView, a3);
}

- (BOOL)_isProgressViewVisible
{
  return self->__isProgressViewVisible;
}

- (UIButton)_errorButton
{
  return self->__errorButton;
}

- (void)_setErrorButton:(id)a3
{
  objc_storeStrong((id *)&self->__errorButton, a3);
}

- (UILabel)_debugProgressLabel
{
  return self->__debugProgressLabel;
}

- (void)_setDebugProgressLabel:(id)a3
{
  objc_storeStrong((id *)&self->__debugProgressLabel, a3);
}

- (BOOL)_didStartProgressLogging
{
  return self->__didStartProgressLogging;
}

- (void)_setDidStartProgressLogging:(BOOL)a3
{
  self->__didStartProgressLogging = a3;
}

- (BOOL)isProgressViewAnimatingOut
{
  return self->_isProgressViewAnimatingOut;
}

- (void)setIsProgressViewAnimatingOut:(BOOL)a3
{
  self->_isProgressViewAnimatingOut = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__debugProgressLabel, 0);
  objc_storeStrong((id *)&self->__errorButton, 0);
  objc_storeStrong((id *)&self->__progressView, 0);
  objc_storeStrong((id *)&self->__status, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_storeStrong(&self->_errorPresenter, 0);
  objc_storeStrong((id *)&self->_assetSharedViewModel, 0);
}

void __53__PUProgressIndicatorTileViewController__progressLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.ui", "OneUpDownloadLatency");
  v1 = (void *)_progressLog_progressLog;
  _progressLog_progressLog = (uint64_t)v0;

}

uint64_t __67__PUProgressIndicatorTileViewController__updateStatusViewsIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStatusCornerState:", 0);
}

uint64_t __67__PUProgressIndicatorTileViewController__updateStatusViewsIfNeeded__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStatusCornerState:", 2);
}

uint64_t __74__PUProgressIndicatorTileViewController__setProgressViewVisible_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __74__PUProgressIndicatorTileViewController__setProgressViewVisible_animated___block_invoke_175(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __74__PUProgressIndicatorTileViewController__setProgressViewVisible_animated___block_invoke_2(uint64_t a1)
{
  double v2;

  objc_msgSend(*(id *)(a1 + 32), "alpha");
  if (v2 == 0.0)
    objc_msgSend(*(id *)(a1 + 32), "resetProgress");
  objc_msgSend(*(id *)(a1 + 40), "setIsProgressViewAnimatingOut:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_invalidateStatusViews");
  return objc_msgSend(*(id *)(a1 + 40), "_updateIfNeeded");
}

+ (CGSize)progressIndicatorIconSizeForSizeClass:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  objc_msgSend(a1, "_loadErrorIconForSizeClass:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

+ (CGSize)progressIndicatorTileSizeForSizeClass:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "progressIndicatorIconSizeForSizeClass:", a3);
  v4 = fmax(v3, 44.0);
  v6 = fmax(v5, 44.0);
  result.height = v6;
  result.width = v4;
  return result;
}

+ (UIEdgeInsets)progressIndicatorIconInsetsForSizeClass:(int64_t)a3
{
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
  UIEdgeInsets result;

  objc_msgSend((id)objc_opt_class(), "progressIndicatorIconSizeForSizeClass:", a3);
  v5 = v4;
  v7 = v6;
  objc_msgSend((id)objc_opt_class(), "progressIndicatorTileSizeForSizeClass:", a3);
  v9 = (v8 - v5) * 0.5;
  v11 = (v10 - v7) * 0.5;
  v12 = v9;
  v13 = v11;
  result.right = v9;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

+ (id)_loadErrorIconForSizeClass:(int64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  switch(a3)
  {
    case 2:
      objc_msgSend(v6, "regularLoadErrorIcon");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v9 = (void *)v10;
      goto LABEL_9;
    case 1:
      objc_msgSend(v6, "compactLoadErrorIcon");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUProgressIndicatorTileViewController.m"), 213, CFSTR("unspecified size class"));

      break;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

@end
