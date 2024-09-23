@implementation PUAssetExplorerReviewScreenProgressIndicatorTileViewController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUAssetExplorerReviewScreenProgressIndicatorTileViewController;
  -[PUTileViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _invalidateStatusViews](self, "_invalidateStatusViews");
  -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)becomeReusable
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUAssetExplorerReviewScreenProgressIndicatorTileViewController;
  -[PUTileViewController becomeReusable](&v3, sel_becomeReusable);
  -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController setAssetSharedViewModel:](self, "setAssetSharedViewModel:", 0);
  -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController setVideoPlayer:](self, "setVideoPlayer:", 0);
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
    -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _invalidateProgressViewStyle](self, "_invalidateProgressViewStyle");
    -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _invalidateStatus](self, "_invalidateStatus");
    -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _updateIfNeeded](self, "_updateIfNeeded");
    v5 = v7;
  }

}

- (void)setVideoPlayer:(id)a3
{
  PUBrowsingVideoPlayer *v5;
  PUBrowsingVideoPlayer *videoPlayer;
  PUBrowsingVideoPlayer *v7;

  v5 = (PUBrowsingVideoPlayer *)a3;
  videoPlayer = self->_videoPlayer;
  if (videoPlayer != v5)
  {
    v7 = v5;
    -[PUBrowsingVideoPlayer unregisterChangeObserver:](videoPlayer, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_videoPlayer, a3);
    -[PUBrowsingVideoPlayer registerChangeObserver:](self->_videoPlayer, "registerChangeObserver:", self);
    -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _invalidateStatusViews](self, "_invalidateStatusViews");
    -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _updateIfNeeded](self, "_updateIfNeeded");
    v5 = v7;
  }

}

- (void)applyLayoutInfo:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUAssetExplorerReviewScreenProgressIndicatorTileViewController;
  -[PUTileViewController applyLayoutInfo:](&v4, sel_applyLayoutInfo_, a3);
  -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)_setProgressViewStyle:(int64_t)a3
{
  if (self->__progressViewStyle != a3)
  {
    self->__progressViewStyle = a3;
    -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _invalidateStatusViews](self, "_invalidateStatusViews");
  }
}

- (void)_setStatus:(id)a3
{
  PXOperationStatus *v5;
  PXOperationStatus *v6;
  char v7;
  PXOperationStatus *v8;

  v5 = (PXOperationStatus *)a3;
  v6 = v5;
  if (self->__status != v5)
  {
    v8 = v5;
    v7 = -[PXOperationStatus isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->__status, a3);
      -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _invalidateStatusViews](self, "_invalidateStatusViews");
      v6 = v8;
    }
  }

}

- (void)_setProgressViewVisible:(BOOL)a3
{
  -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _setProgressViewVisible:animated:](self, "_setProgressViewVisible:animated:", a3, 0);
}

- (void)_setProgressViewVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  id *v8;
  void (**v9)(_QWORD);
  void (**v10)(_QWORD);
  uint64_t v11;
  id v12;
  void (**v13)(void *, uint64_t);
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD aBlock[4];
  id v19;

  if (self->__isProgressViewVisible != a3)
  {
    v4 = a4;
    v5 = a3;
    self->__isProgressViewVisible = a3;
    -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _progressView](self, "_progressView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      objc_msgSend(v6, "startProgressTimer");
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __99__PUAssetExplorerReviewScreenProgressIndicatorTileViewController__setProgressViewVisible_animated___block_invoke;
      aBlock[3] = &unk_1E58ABD10;
      v8 = &v19;
      v19 = v7;
      v9 = (void (**)(_QWORD))_Block_copy(aBlock);
      v10 = v9;
      if (v4)
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v9, 0, 0.15, 0.0);
      else
        v9[2](v9);
    }
    else
    {
      v11 = MEMORY[0x1E0C809B0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __99__PUAssetExplorerReviewScreenProgressIndicatorTileViewController__setProgressViewVisible_animated___block_invoke_2;
      v16[3] = &unk_1E58ABD10;
      v8 = &v17;
      v12 = v6;
      v17 = v12;
      v10 = (void (**)(_QWORD))_Block_copy(v16);
      v14[0] = v11;
      v14[1] = 3221225472;
      v14[2] = __99__PUAssetExplorerReviewScreenProgressIndicatorTileViewController__setProgressViewVisible_animated___block_invoke_3;
      v14[3] = &unk_1E58A9910;
      v15 = v12;
      v13 = (void (**)(void *, uint64_t))_Block_copy(v14);
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v10, v13, 0.15, 0.0);
      }
      else
      {
        v10[2](v10);
        v13[2](v13, 1);
      }

    }
  }
}

- (void)_handleErrorButtonTap:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController assetSharedViewModel](self, "assetSharedViewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("PUShouldReloadAssetMediaNotification"), v5);

}

- (void)_updateIfNeeded
{
  id v4;

  if (-[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _needsUpdate](self, "_needsUpdate")
    && -[PUTileViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _updateProgressViewStyleIfNeeded](self, "_updateProgressViewStyleIfNeeded");
    -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _updateStatusIfNeeded](self, "_updateStatusIfNeeded");
    -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _updateStatusViewsIfNeeded](self, "_updateStatusViewsIfNeeded");
    if (-[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetExplorerReviewScreenProgressIndicatorTileViewController.m"), 181, CFSTR("updates still needed after an update cycle"));

    }
  }
}

- (BOOL)_needsUpdate
{
  return -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _needsUpdateProgressViewStyle](self, "_needsUpdateProgressViewStyle")|| -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _needsUpdateStatus](self, "_needsUpdateStatus")|| -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _needsUpdateStatusViews](self, "_needsUpdateStatusViews");
}

- (void)_invalidateProgressViewStyle
{
  -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _setNeedsUpdateProgressViewStyle:](self, "_setNeedsUpdateProgressViewStyle:", 1);
  -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateProgressViewStyleIfNeeded
{
  if (-[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _needsUpdateProgressViewStyle](self, "_needsUpdateProgressViewStyle"))
  {
    -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _setNeedsUpdateProgressViewStyle:](self, "_setNeedsUpdateProgressViewStyle:", 0);
    -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _setProgressViewStyle:](self, "_setProgressViewStyle:", 0);
  }
}

- (void)_invalidateStatus
{
  -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _setNeedsUpdateStatus:](self, "_setNeedsUpdateStatus:", 1);
  -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateStatusIfNeeded
{
  void *v3;
  id v4;

  if (-[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _needsUpdateStatus](self, "_needsUpdateStatus"))
  {
    -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _setNeedsUpdateStatus:](self, "_setNeedsUpdateStatus:", 0);
    -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController assetSharedViewModel](self, "assetSharedViewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "loadingStatus");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _setStatus:](self, "_setStatus:", v4);
  }
}

- (void)_invalidateStatusViews
{
  -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _setNeedsUpdateStatusViews:](self, "_setNeedsUpdateStatusViews:", 1);
  -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateStatusViewsIfNeeded
{
  uint64_t v3;
  void *v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  if (-[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _needsUpdateStatusViews](self, "_needsUpdateStatusViews"))
  {
    -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _setNeedsUpdateStatusViews:](self, "_setNeedsUpdateStatusViews:", 0);
    if (-[PUTileViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _status](self, "_status");
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v24, "state");
      -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _progressView](self, "_progressView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _progressViewStyle](self, "_progressViewStyle");
      if (v4 && objc_msgSend(v4, "style") != v5)
      {
        objc_msgSend(v4, "removeFromSuperview");
        -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _setProgressView:](self, "_setProgressView:", 0);

        v4 = 0;
      }
      -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController videoPlayer](self, "videoPlayer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "desiredPlayState");

      -[PUTileViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(v3 - 1) > 1 || v7 == 4)
      {
        -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _setProgressViewVisible:](self, "_setProgressViewVisible:", 0);
        if (!v4)
        {
LABEL_20:
          -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _errorButton](self, "_errorButton");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v3 != 3 || v7 == 4)
          {
            if (v13)
            {
              objc_msgSend(v13, "removeFromSuperview");
              -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _setErrorButton:](self, "_setErrorButton:", 0);
            }
          }
          else if (!v13)
          {
            objc_msgSend((id)objc_opt_class(), "_loadErrorIcon");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setImage:forState:", v15, 0);
            objc_msgSend(v8, "bounds");
            objc_msgSend(v14, "setFrame:");
            objc_msgSend(v14, "setAutoresizingMask:", 18);
            objc_msgSend(v14, "addTarget:action:forControlEvents:", self, sel__handleErrorButtonTap_, 64);
            objc_msgSend(v8, "addSubview:", v14);
            -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _setErrorButton:](self, "_setErrorButton:", v14);
            -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _updateSubviewOrdering](self, "_updateSubviewOrdering");

          }
          -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _debugProgressLabel](self, "_debugProgressLabel");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "useDebuggingProgressLabel");

          if (v18)
          {
            if (!v16)
            {
              v19 = objc_alloc(MEMORY[0x1E0DC3990]);
              objc_msgSend(v8, "bounds");
              v16 = (void *)objc_msgSend(v19, "initWithFrame:");
              objc_msgSend(v16, "setAutoresizingMask:", 18);
              objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 10.0);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setFont:", v20);

              objc_msgSend(v16, "setTextAlignment:", 1);
              objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setTextColor:", v21);

              objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.100000001);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setBackgroundColor:", v22);

              objc_msgSend(v8, "addSubview:", v16);
              -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _setDebugProgressLabel:](self, "_setDebugProgressLabel:", v16);
              -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _updateSubviewOrdering](self, "_updateSubviewOrdering");
            }
            objc_msgSend(v24, "description");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setText:", v23);

          }
          else
          {
            if (!v16)
            {
LABEL_33:

              return;
            }
            objc_msgSend(v16, "removeFromSuperview");
            -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _setDebugProgressLabel:](self, "_setDebugProgressLabel:", 0);
          }

          goto LABEL_33;
        }
        objc_msgSend(v4, "removeFromSuperview");
        -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _setProgressView:](self, "_setProgressView:", 0);
      }
      else
      {
        if (!v4)
        {
          v9 = objc_alloc(MEMORY[0x1E0D714B8]);
          objc_msgSend(v8, "bounds");
          v4 = (void *)objc_msgSend(v9, "initWithFrame:style:", v5);
          objc_msgSend(v4, "setAutoresizingMask:", 18);
          objc_msgSend(v8, "addSubview:", v4);
          -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _setProgressView:](self, "_setProgressView:", v4);
          -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _updateSubviewOrdering](self, "_updateSubviewOrdering");
          objc_msgSend(v4, "setAlpha:", 0.0);
        }
        objc_msgSend(v24, "progress");
        if (v3 == 2)
          v11 = 1.0;
        else
          v11 = v10;
        objc_msgSend(v4, "progress");
        if (v11 < v12)
          objc_msgSend(v4, "resetProgress");
        objc_msgSend(v4, "setProgress:", v11);
        -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _setProgressViewVisible:animated:](self, "_setProgressViewVisible:animated:", v3 != 2, 1);
      }

      goto LABEL_20;
    }
  }
}

- (void)_updateSubviewOrdering
{
  void *v3;
  void *v4;
  id v5;

  -[PUTileViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _debugProgressLabel](self, "_debugProgressLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bringSubviewToFront:", v3);

  -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _errorButton](self, "_errorButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bringSubviewToFront:", v4);

}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController assetSharedViewModel](self, "assetSharedViewModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v9)
  {
    -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _handleAssetSharedViewModel:didChange:](self, "_handleAssetSharedViewModel:didChange:", v9, v6);
  }
  else
  {
    -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController videoPlayer](self, "videoPlayer");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
      -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _handleVideoPlayer:didChange:](self, "_handleVideoPlayer:didChange:", v9, v6);
  }

}

- (void)_handleAssetSharedViewModel:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "loadingStatusChanged", a3))
  {
    -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _invalidateStatus](self, "_invalidateStatus");
    -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _updateIfNeeded](self, "_updateIfNeeded");
  }
}

- (void)_handleVideoPlayer:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "desiredPlayStateDidChange", a3))
  {
    -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _invalidateStatusViews](self, "_invalidateStatusViews");
    -[PUAssetExplorerReviewScreenProgressIndicatorTileViewController _updateIfNeeded](self, "_updateIfNeeded");
  }
}

- (PUAssetSharedViewModel)assetSharedViewModel
{
  return self->_assetSharedViewModel;
}

- (PUBrowsingVideoPlayer)videoPlayer
{
  return self->_videoPlayer;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__debugProgressLabel, 0);
  objc_storeStrong((id *)&self->__errorButton, 0);
  objc_storeStrong((id *)&self->__progressView, 0);
  objc_storeStrong((id *)&self->__status, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_assetSharedViewModel, 0);
}

uint64_t __99__PUAssetExplorerReviewScreenProgressIndicatorTileViewController__setProgressViewVisible_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __99__PUAssetExplorerReviewScreenProgressIndicatorTileViewController__setProgressViewVisible_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __99__PUAssetExplorerReviewScreenProgressIndicatorTileViewController__setProgressViewVisible_animated___block_invoke_3(uint64_t a1)
{
  uint64_t result;
  double v3;

  result = objc_msgSend(*(id *)(a1 + 32), "alpha");
  if (v3 == 0.0)
    return objc_msgSend(*(id *)(a1 + 32), "resetProgress");
  return result;
}

+ (CGSize)progressIndicatorTileSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 25.0;
  v3 = 25.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)_loadErrorIcon
{
  void *v2;
  void *v3;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compactLoadErrorIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
