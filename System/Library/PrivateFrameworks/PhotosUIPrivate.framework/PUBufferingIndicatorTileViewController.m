@implementation PUBufferingIndicatorTileViewController

- (void)becomeReusable
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUBufferingIndicatorTileViewController;
  -[PUTileViewController becomeReusable](&v3, sel_becomeReusable);
  -[PUBufferingIndicatorTileViewController setBrowsingViewModel:](self, "setBrowsingViewModel:", 0);
  -[PUBufferingIndicatorTileViewController setAssetViewModel:](self, "setAssetViewModel:", 0);
  -[PUBufferingIndicatorTileViewController setErrorAlertControllerDisplayer:](self, "setErrorAlertControllerDisplayer:", 0);
  -[PUBufferingIndicatorTileViewController setMergedVideoProvider:](self, "setMergedVideoProvider:", 0);
  -[PUBufferingIndicatorTileViewController _setIndicatorStyle:animated:](self, "_setIndicatorStyle:animated:", 0, 0);
}

- (void)setAssetViewModel:(id)a3
{
  PUAssetViewModel *v5;
  PUAssetViewModel *assetViewModel;
  void *v7;
  PUAssetViewModel *v8;

  v5 = (PUAssetViewModel *)a3;
  assetViewModel = self->_assetViewModel;
  v8 = v5;
  if (assetViewModel != v5)
  {
    -[PUAssetViewModel unregisterChangeObserver:](assetViewModel, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_assetViewModel, a3);
    -[PUAssetViewModel registerChangeObserver:](self->_assetViewModel, "registerChangeObserver:", self);
    -[PUAssetViewModel videoPlayer](v8, "videoPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUBufferingIndicatorTileViewController _setVideoPlayer:](self, "_setVideoPlayer:", v7);

  }
}

- (void)_setVideoPlayer:(id)a3
{
  PUBrowsingVideoPlayer *v5;
  PUBrowsingVideoPlayer *videoPlayer;
  PUBrowsingVideoPlayer *v7;

  v5 = (PUBrowsingVideoPlayer *)a3;
  videoPlayer = self->__videoPlayer;
  if (videoPlayer != v5)
  {
    v7 = v5;
    -[PUBrowsingVideoPlayer unregisterChangeObserver:](videoPlayer, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->__videoPlayer, a3);
    -[PUBrowsingVideoPlayer registerChangeObserver:](self->__videoPlayer, "registerChangeObserver:", self);
    -[PUBufferingIndicatorTileViewController _updateIndicator](self, "_updateIndicator");
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
    v5 = v7;
  }

}

- (void)setMergedVideoProvider:(id)a3
{
  PUOneUpMergedVideoProvider *v5;
  PUOneUpMergedVideoProvider *mergedVideoProvider;
  PUOneUpMergedVideoProvider *v7;

  v5 = (PUOneUpMergedVideoProvider *)a3;
  mergedVideoProvider = self->_mergedVideoProvider;
  if (mergedVideoProvider != v5)
  {
    v7 = v5;
    -[PUOneUpMergedVideoProvider unregisterChangeObserver:context:](mergedVideoProvider, "unregisterChangeObserver:context:", self, MergedVideoProviderContext);
    objc_storeStrong((id *)&self->_mergedVideoProvider, a3);
    -[PUOneUpMergedVideoProvider registerChangeObserver:context:](self->_mergedVideoProvider, "registerChangeObserver:context:", self, MergedVideoProviderContext);
    -[PUBufferingIndicatorTileViewController _updateIndicator](self, "_updateIndicator");
    v5 = v7;
  }

}

- (void)_setIndicatorStyle:(int64_t)a3
{
  -[PUBufferingIndicatorTileViewController _setIndicatorStyle:animated:](self, "_setIndicatorStyle:animated:", a3, 0);
}

- (void)_setIndicatorStyle:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void (**v20)(_QWORD);
  uint64_t v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  double v38;
  double v39;
  void *v40;
  _QWORD v41[4];
  void (**v42)(_QWORD);
  BOOL v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  BOOL v49;
  BOOL v50;
  _QWORD aBlock[4];
  id v52;
  uint64_t v53;
  BOOL v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  if (self->__indicatorStyle != a3)
  {
    v4 = a4;
    self->__indicatorStyle = a3;
    -[PUBufferingIndicatorTileViewController _spinner](self, "_spinner");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = a3 == 1;
    if (a3 == 1 && !v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 101);
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setColor:", v10);

      objc_msgSend(v8, "setAlpha:", 0.0);
      objc_msgSend(v8, "setAutoresizingMask:", 45);
      -[PUTileViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      x = v55.origin.x;
      y = v55.origin.y;
      width = v55.size.width;
      height = v55.size.height;
      MidX = CGRectGetMidX(v55);
      v56.origin.x = x;
      v56.origin.y = y;
      v56.size.width = width;
      v56.size.height = height;
      objc_msgSend(v8, "setCenter:", MidX, CGRectGetMidY(v56));
      objc_msgSend(v11, "addSubview:", v8);
      -[PUBufferingIndicatorTileViewController _setSpinner:](self, "_setSpinner:", v8);

    }
    v17 = objc_msgSend(v8, "tag") + 1;
    objc_msgSend(v8, "setTag:", v17);
    v18 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__PUBufferingIndicatorTileViewController__setIndicatorStyle_animated___block_invoke;
    aBlock[3] = &unk_1E58AA4F0;
    v19 = v8;
    v52 = v19;
    v53 = v17;
    v54 = a3 == 1;
    v20 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[PUBufferingIndicatorTileViewController _errorButton](self, "_errorButton");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    v23 = a3 == 2;
    if (a3 == 2 && !v21)
    {
      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addTarget:action:forControlEvents:", self, sel__handleErrorButton_, 0x2000);
      +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "regularLoadErrorIcon");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setImage:forState:", v25, 0);

      objc_msgSend(v22, "sizeToFit");
      objc_msgSend(v22, "setAlpha:", 0.0);
      objc_msgSend(v22, "setAutoresizingMask:", 45);
      -[PUTileViewController view](self, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bounds");
      v27 = v57.origin.x;
      v28 = v57.origin.y;
      v29 = v57.size.width;
      v30 = v57.size.height;
      v31 = CGRectGetMidX(v57);
      v58.origin.x = v27;
      v58.origin.y = v28;
      v58.size.width = v29;
      v58.size.height = v30;
      objc_msgSend(v22, "setCenter:", v31, CGRectGetMidY(v58));
      objc_msgSend(v26, "addSubview:", v22);
      -[PUBufferingIndicatorTileViewController _setErrorButton:](self, "_setErrorButton:", v22);

      v23 = a3 == 2;
    }
    v46[0] = v18;
    v46[1] = 3221225472;
    v46[2] = __70__PUBufferingIndicatorTileViewController__setIndicatorStyle_animated___block_invoke_2;
    v46[3] = &unk_1E589DA38;
    v32 = v19;
    v47 = v32;
    v49 = a3 == 1;
    v33 = v22;
    v48 = v33;
    v50 = v23;
    v34 = _Block_copy(v46);
    v35 = v34;
    if (v4)
    {
      -[PUBufferingIndicatorTileViewController browsingViewModel](self, "browsingViewModel");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isAttemptingToPlayVideoOverlay");

      if (((a3 == 1) & (v37 ^ 1)) != 0)
        v38 = 1.0;
      else
        v38 = 0.0;
      v39 = dbl_1AB0EF2A0[a3 == 1];
      if (a3 == 1)
        v20[2](v20);
      v40 = (void *)MEMORY[0x1E0DC3F10];
      v44[0] = v18;
      v44[1] = 3221225472;
      v44[2] = __70__PUBufferingIndicatorTileViewController__setIndicatorStyle_animated___block_invoke_3;
      v44[3] = &unk_1E58ABAC8;
      v45 = v35;
      v41[0] = v18;
      v41[1] = 3221225472;
      v41[2] = __70__PUBufferingIndicatorTileViewController__setIndicatorStyle_animated___block_invoke_4;
      v41[3] = &unk_1E589DA60;
      v43 = v9;
      v42 = v20;
      objc_msgSend(v40, "animateWithDuration:delay:options:animations:completion:", 4, v44, v41, v39, v38);

    }
    else
    {
      (*((void (**)(void *))v34 + 2))(v34);
      v20[2](v20);
    }

  }
}

- (void)_handleErrorButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  id v12;

  -[PUBufferingIndicatorTileViewController errorAlertControllerDisplayer](self, "errorAlertControllerDisplayer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PUBufferingIndicatorTileViewController _videoPlayer](self, "_videoPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUBufferingIndicatorTileViewController mergedVideoProvider](self, "mergedVideoProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "playState") == 5)
    {
      v7 = CFSTR("VIDEO_PLAYBACK_ERROR_TITLE");
      v8 = v5;
    }
    else
    {
      if (objc_msgSend(v6, "state") != 3)
      {
        v10 = 0;
        goto LABEL_11;
      }
      v7 = CFSTR("LIVE_PHOTO_PLAYBACK_ERROR_TITLE");
      v8 = v6;
    }
    PULocalizedString(v7);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (v10)
      {
LABEL_9:
        -[PUBufferingIndicatorTileViewController errorAlertControllerDisplayer](self, "errorAlertControllerDisplayer");
        v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id, void *))v11)[2](v11, v12, v10);

        return;
      }
LABEL_12:
      PULocalizedString(CFSTR("GENERAL_PLAYBACK_ERROR_MESSAGE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_11:
    PULocalizedString(CFSTR("GENERAL_PLAYBACK_ERROR_TITLE"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_9;
    goto LABEL_12;
  }
}

- (void)_updateIndicator
{
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PUBufferingIndicatorTileViewController _videoPlayer](self, "_videoPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "playState");
  -[PUBufferingIndicatorTileViewController browsingViewModel](self, "browsingViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAttemptingToPlayVideoOverlay");

  -[PUBufferingIndicatorTileViewController mergedVideoProvider](self, "mergedVideoProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "state");
  -[PUAssetViewModel assetSharedViewModel](self->_assetViewModel, "assetSharedViewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == 5)
  {
    v10 = 0;
  }
  else if (((objc_msgSend(v3, "isStalled") & 1) != 0 || v4 == 1 && objc_msgSend(v3, "isPlaybackDesired"))
         && !objc_msgSend(v9, "needsDeferredProcessing"))
  {
    v10 = 1;
  }
  else
  {
    if (v8 == 3)
      v11 = v6;
    else
      v11 = 0;
    if (v11 == 1)
    {
      PLOneUpGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "error");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412290;
        v18 = v13;
        _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_ERROR, "Showing live photo playback error indicator: %@", (uint8_t *)&v17, 0xCu);

      }
      v10 = 2;
    }
    else if (v8 == 1)
    {
      v10 = v6;
    }
    else
    {
      v10 = 0;
    }
  }
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "showBufferingIndicatorDuringPlay");

  if ((v15 & (v4 == 3)) != 0)
    v16 = 1;
  else
    v16 = v10;
  -[PUBufferingIndicatorTileViewController _setIndicatorStyle:animated:](self, "_setIndicatorStyle:animated:", v16, 1);

}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[PUBufferingIndicatorTileViewController _videoPlayer](self, "_videoPlayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v12)
  {
    v10 = v6;
    if ((objc_msgSend(v10, "playStateDidChange") & 1) != 0
      || (objc_msgSend(v10, "isStalledDidChange") & 1) != 0
      || (objc_msgSend(v10, "errorDidChange") & 1) != 0
      || (objc_msgSend(v10, "isActivatedDidChange") & 1) != 0
      || objc_msgSend(v10, "desiredPlayStateDidChange"))
    {
      -[PUBufferingIndicatorTileViewController _updateIndicator](self, "_updateIndicator");
    }
    goto LABEL_12;
  }
  -[PUBufferingIndicatorTileViewController browsingViewModel](self, "browsingViewModel");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v12)
  {
    if (objc_msgSend(v6, "isAttemptingToPlayVideoOverlayDidChange"))
      -[PUBufferingIndicatorTileViewController _updateIndicator](self, "_updateIndicator");
  }
  else
  {
    -[PUBufferingIndicatorTileViewController assetViewModel](self, "assetViewModel");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 == v12 && objc_msgSend(v6, "videoPlayerDidChange"))
    {
      -[PUBufferingIndicatorTileViewController assetViewModel](self, "assetViewModel");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "videoPlayer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUBufferingIndicatorTileViewController _setVideoPlayer:](self, "_setVideoPlayer:", v11);

LABEL_12:
    }
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v5;
  id v8;
  char isKindOfClass;
  void *v10;

  if ((void *)MergedVideoProviderContext == a5)
  {
    v5 = a4;
    v8 = a3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      if ((v5 & 1) == 0)
        return;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBufferingIndicatorTileViewController.m"), 267, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[observable isKindOfClass:[PUOneUpMergedVideoProvider class]]"));

      if ((v5 & 1) == 0)
        return;
    }
    px_dispatch_on_main_queue();
  }
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (PUOneUpMergedVideoProvider)mergedVideoProvider
{
  return self->_mergedVideoProvider;
}

- (id)errorAlertControllerDisplayer
{
  return self->_errorAlertControllerDisplayer;
}

- (void)setErrorAlertControllerDisplayer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (PUBrowsingVideoPlayer)_videoPlayer
{
  return self->__videoPlayer;
}

- (int64_t)_indicatorStyle
{
  return self->__indicatorStyle;
}

- (UIActivityIndicatorView)_spinner
{
  return self->__spinner;
}

- (void)_setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->__spinner, a3);
}

- (UIButton)_errorButton
{
  return self->__errorButton;
}

- (void)_setErrorButton:(id)a3
{
  objc_storeStrong((id *)&self->__errorButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__errorButton, 0);
  objc_storeStrong((id *)&self->__spinner, 0);
  objc_storeStrong((id *)&self->__videoPlayer, 0);
  objc_storeStrong(&self->_errorAlertControllerDisplayer, 0);
  objc_storeStrong((id *)&self->_mergedVideoProvider, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
  objc_storeStrong((id *)&self->_assetViewModel, 0);
}

uint64_t __71__PUBufferingIndicatorTileViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateIndicator");
}

uint64_t __70__PUBufferingIndicatorTileViewController__setIndicatorStyle_animated___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = objc_msgSend(*(id *)(a1 + 32), "tag");
  if (result == *(_QWORD *)(a1 + 40))
  {
    v3 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 48))
      return objc_msgSend(v3, "startAnimating");
    else
      return objc_msgSend(v3, "stopAnimating");
  }
  return result;
}

uint64_t __70__PUBufferingIndicatorTileViewController__setIndicatorStyle_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  v2 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
    v3 = 1.0;
  else
    v3 = 0.0;
  objc_msgSend(v2, "setAlpha:", v3);
  if (*(_BYTE *)(a1 + 49))
    v4 = 1.0;
  else
    v4 = 0.0;
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", v4);
}

uint64_t __70__PUBufferingIndicatorTileViewController__setIndicatorStyle_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __70__PUBufferingIndicatorTileViewController__setIndicatorStyle_animated___block_invoke_4(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

+ (BOOL)canShowBufferingIndicatorTileForAsset:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "mediaType") == 2
    || objc_msgSend(v3, "playbackStyle") == 3
    || objc_msgSend(v3, "playbackStyle") == 5;

  return v4;
}

+ (CGSize)bufferingIndicatorTileSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 100.0;
  v3 = 100.0;
  result.height = v3;
  result.width = v2;
  return result;
}

@end
