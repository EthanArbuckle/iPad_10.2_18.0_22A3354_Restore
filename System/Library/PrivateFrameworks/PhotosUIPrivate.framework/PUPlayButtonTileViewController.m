@implementation PUPlayButtonTileViewController

- (id)loadView
{
  id v3;
  PUPlayButtonTileView *v4;
  PUPlayButtonTileView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  v4 = [PUPlayButtonTileView alloc];
  v5 = -[PUPlayButtonTileView initWithStyle:](v4, "initWithStyle:", objc_msgSend(MEMORY[0x1E0D7B568], "isOneUpRefreshEnabled"));
  -[PUPlayButtonTileViewController setPlayButton:](self, "setPlayButton:", v5);

  objc_msgSend(v3, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[PUPlayButtonTileViewController playButton](self, "playButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  -[PUPlayButtonTileViewController playButton](self, "playButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAutoresizingMask:", 18);

  -[PUPlayButtonTileViewController playButton](self, "playButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAlpha:", 0.0);

  -[PUPlayButtonTileViewController playButton](self, "playButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTarget:selector:", self, sel__playButtonTapped_);

  -[PUPlayButtonTileViewController _updateButtonAnimated:](self, "_updateButtonAnimated:", 0);
  -[PUPlayButtonTileViewController playButton](self, "playButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v18);

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[PUAssetViewModel unregisterChangeObserver:](self->_assetViewModel, "unregisterChangeObserver:", self);
  -[PUBrowsingVideoPlayer unregisterChangeObserver:](self->__browsingVideoPlayer, "unregisterChangeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PUPlayButtonTileViewController;
  -[PUTileViewController dealloc](&v3, sel_dealloc);
}

- (void)becomeReusable
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPlayButtonTileViewController;
  -[PUTileViewController becomeReusable](&v3, sel_becomeReusable);
  -[PUPlayButtonTileViewController setBrowsingViewModel:](self, "setBrowsingViewModel:", 0);
  -[PUPlayButtonTileViewController setAssetViewModel:](self, "setAssetViewModel:", 0);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $B00BF3347C0400CE063EB9DA3F494BC2 *p_delegateFlags;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToShouldShowPauseButton = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldShowPlayButtonWhileActivated = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidTapButton = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDelayForButtonAnimation = objc_opt_respondsToSelector() & 1;
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
    -[PUPlayButtonTileViewController _updateButtonAnimated:](self, "_updateButtonAnimated:", 0);
    v5 = v7;
  }

}

- (void)setAssetViewModel:(id)a3
{
  PUAssetViewModel *v5;
  PUAssetViewModel **p_assetViewModel;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  PUAssetViewModel *v12;

  v5 = (PUAssetViewModel *)a3;
  p_assetViewModel = &self->_assetViewModel;
  if (self->_assetViewModel != v5)
  {
    v12 = v5;
    -[PUPlayButtonTileViewController setHasAssetBecomeFullyFocusedSinceBeingOutOfFocus:](self, "setHasAssetBecomeFullyFocusedSinceBeingOutOfFocus:", 0);
    -[PUAssetViewModel unregisterChangeObserver:](*p_assetViewModel, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_assetViewModel, a3);
    -[PUAssetViewModel registerChangeObserver:](*p_assetViewModel, "registerChangeObserver:", self);
    if (objc_msgSend(MEMORY[0x1E0D7B568], "isOneUpRefreshEnabled"))
    {
      +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUAssetViewModel asset](v12, "asset");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "allowAutoplayVideoForAsset:", v8) & 1) != 0)
      {
        -[PUAssetViewModel videoPlayer](v12, "videoPlayer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isPlaybackDesired");

        if ((v10 & 1) == 0)
          -[PUPlayButtonTileViewController setIsAwaitingAutoPlay:](self, "setIsAwaitingAutoPlay:", 1);
      }
      else
      {

      }
    }
    -[PUAssetViewModel videoPlayer](v12, "videoPlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPlayButtonTileViewController _setBrowsingVideoPlayer:](self, "_setBrowsingVideoPlayer:", v11);

    -[PUPlayButtonTileViewController _updateHasAssetBecomeFullyFocusedSinceBeingOutOfFocus](self, "_updateHasAssetBecomeFullyFocusedSinceBeingOutOfFocus");
    -[PUPlayButtonTileViewController _updateButtonAnimated:](self, "_updateButtonAnimated:", 0);
    v5 = v12;
  }

}

- (void)_setBrowsingVideoPlayer:(id)a3
{
  PUBrowsingVideoPlayer *v5;
  PUBrowsingVideoPlayer *browsingVideoPlayer;
  PUBrowsingVideoPlayer *v7;

  v5 = (PUBrowsingVideoPlayer *)a3;
  browsingVideoPlayer = self->__browsingVideoPlayer;
  if (browsingVideoPlayer != v5)
  {
    v7 = v5;
    -[PUBrowsingVideoPlayer unregisterChangeObserver:](browsingVideoPlayer, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->__browsingVideoPlayer, a3);
    -[PUBrowsingVideoPlayer registerChangeObserver:](self->__browsingVideoPlayer, "registerChangeObserver:", self);
    -[PUPlayButtonTileViewController _updateButtonAnimated:](self, "_updateButtonAnimated:", 0);
    v5 = v7;
  }

}

- (BOOL)canShowPauseButton
{
  PUPlayButtonTileViewController *v2;
  void *v3;

  if (!self->_delegateFlags.respondsToDidTapButton)
    return 0;
  v2 = self;
  -[PUPlayButtonTileViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "playButtonTileViewControllerShouldShowPauseButton:", v2);

  return (char)v2;
}

- (BOOL)showPlayButtonWhileActivated
{
  PUPlayButtonTileViewController *v2;
  void *v3;

  if (!self->_delegateFlags.respondsToShouldShowPlayButtonWhileActivated)
    return 0;
  v2 = self;
  -[PUPlayButtonTileViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "playButtonTileViewControllerShouldShowPlayButtonWhileActivated:", v2);

  return (char)v2;
}

- (void)_playButtonTapped:(id)a3
{
  void *v4;

  if (self->_delegateFlags.respondsToDidTapButton)
  {
    -[PUPlayButtonTileViewController delegate](self, "delegate", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playButtonTileViewControllerDidTapButton:", self);

  }
  -[PUPlayButtonTileViewController _updateButtonAnimated:](self, "_updateButtonAnimated:", 1);
}

- (void)_updateHasAssetBecomeFullyFocusedSinceBeingOutOfFocus
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  int v9;
  uint64_t v10;

  -[PUPlayButtonTileViewController assetViewModel](self, "assetViewModel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[PUPlayButtonTileViewController assetViewModel](self, "assetViewModel"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "focusValue"),
        v7 = fabs(v6),
        v5,
        v4,
        v7 < 1.0))
  {
    -[PUPlayButtonTileViewController assetViewModel](self, "assetViewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "focusValue");
    v9 = PXFloatApproximatelyEqualToFloat();

    if (!v9)
      return;
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  -[PUPlayButtonTileViewController setHasAssetBecomeFullyFocusedSinceBeingOutOfFocus:](self, "setHasAssetBecomeFullyFocusedSinceBeingOutOfFocus:", v10);
}

- (void)setHasAssetBecomeFullyFocusedSinceBeingOutOfFocus:(BOOL)a3
{
  if (self->_hasAssetBecomeFullyFocusedSinceBeingOutOfFocus != a3)
  {
    self->_hasAssetBecomeFullyFocusedSinceBeingOutOfFocus = a3;
    -[PUPlayButtonTileViewController _updateButtonAnimated:](self, "_updateButtonAnimated:", 1);
  }
}

- (void)_updateButtonAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  char v25;
  _BOOL4 v26;
  id v27;

  v3 = a3;
  v5 = -[PUPlayButtonTileViewController canShowPauseButton](self, "canShowPauseButton");
  -[PUPlayButtonTileViewController _browsingVideoPlayer](self, "_browsingVideoPlayer");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v27, "playState");
  v7 = objc_msgSend(v27, "isPlaybackDesired");
  if (v6 == 5)
    v8 = 0;
  else
    v8 = v7;
  v9 = v8 == 1 && !v5;
  v26 = v3;
  if (v9)
  {
    v11 = 0;
  }
  else
  {
    -[PUPlayButtonTileViewController assetViewModel](self, "assetViewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isUserTransformingTile") ^ 1;

  }
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "allowPlayButtonInBars");

  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPlayButtonTileViewController assetViewModel](self, "assetViewModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "asset");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "allowAutoplayVideoForAsset:", v16);

  if (v13 && v17 && v6 != 5)
    goto LABEL_13;
  if (!objc_msgSend(v27, "isActivated"))
  {
    if (!v11)
      goto LABEL_13;
    goto LABEL_21;
  }
  -[PUPlayButtonTileViewController browsingViewModel](self, "browsingViewModel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v11 || (objc_msgSend(v20, "isScrubbing") & 1) != 0 || !objc_msgSend(v21, "isChromeVisible"))
  {
    v18 = 0;
    goto LABEL_24;
  }
  v22 = -[PUPlayButtonTileViewController showPlayButtonWhileActivated](self, "showPlayButtonWhileActivated");

  if (v22)
  {
LABEL_21:
    -[PUPlayButtonTileViewController assetViewModel](self, "assetViewModel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "asset");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isTemporaryPlaceholder");

    if ((v25 & 1) == 0)
    {
      -[PUPlayButtonTileViewController playButton](self, "playButton");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setShowAsPause:", v5 & v8);
      v18 = 1;
LABEL_24:
      v19 = v26;

      goto LABEL_25;
    }
  }
LABEL_13:
  v18 = 0;
  v19 = v26;
LABEL_25:
  -[PUPlayButtonTileViewController _setShouldShowPlayButton:animated:](self, "_setShouldShowPlayButton:animated:", v18, v19);

}

- (void)_setShouldShowPlayButton:(BOOL)a3
{
  -[PUPlayButtonTileViewController _setShouldShowPlayButton:animated:](self, "_setShouldShowPlayButton:animated:", a3, 0);
}

- (void)_setShouldShowPlayButton:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD aBlock[5];
  BOOL v17;

  if (self->__shouldShowPlayButton != a3)
  {
    v4 = a4;
    v5 = a3;
    self->__shouldShowPlayButton = a3;
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__PUPlayButtonTileViewController__setShouldShowPlayButton_animated___block_invoke;
    aBlock[3] = &unk_1E58AAD68;
    aBlock[4] = self;
    v17 = a3;
    v8 = _Block_copy(aBlock);
    v9 = v8;
    if (v4)
    {
      if (self->_delegateFlags.respondsToDelayForButtonAnimation)
      {
        -[PUPlayButtonTileViewController delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "playButtonTileViewController:delayForButtonAnimation:", self, v5);
        v12 = v11;

      }
      else
      {
        v12 = 0.0;
      }
      v13 = (void *)MEMORY[0x1E0DC3F10];
      v14[0] = v7;
      v14[1] = 3221225472;
      v14[2] = __68__PUPlayButtonTileViewController__setShouldShowPlayButton_animated___block_invoke_2;
      v14[3] = &unk_1E58ABAC8;
      v15 = v9;
      objc_msgSend(v13, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 6, v14, 0, v12, 0.0);

    }
    else
    {
      (*((void (**)(void *))v8 + 2))(v8);
    }

  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  -[PUPlayButtonTileViewController _browsingVideoPlayer](self, "_browsingVideoPlayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v15)
  {
    v11 = v6;
    if ((objc_msgSend(v11, "desiredPlayStateDidChange") & 1) == 0
      && (objc_msgSend(v11, "isAtBeginningDidChange") & 1) == 0
      && (objc_msgSend(v11, "isAtEndDidChange") & 1) == 0
      && (objc_msgSend(v11, "isActivatedDidChange") & 1) == 0
      && !objc_msgSend(v11, "playStateDidChange"))
    {
      goto LABEL_14;
    }
LABEL_13:
    -[PUPlayButtonTileViewController _updateButtonAnimated:](self, "_updateButtonAnimated:", 1);
LABEL_14:

    goto LABEL_15;
  }
  -[PUPlayButtonTileViewController assetViewModel](self, "assetViewModel");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v15)
  {
    v12 = v6;
    if ((objc_msgSend(v12, "isUserTransformingTileDidChange") & 1) != 0
      || objc_msgSend(v12, "assetChanged"))
    {
      -[PUPlayButtonTileViewController _updateButtonAnimated:](self, "_updateButtonAnimated:", 1);
    }
    if (objc_msgSend(v12, "videoPlayerDidChange"))
    {
      -[PUPlayButtonTileViewController assetViewModel](self, "assetViewModel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "videoPlayer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPlayButtonTileViewController _setBrowsingVideoPlayer:](self, "_setBrowsingVideoPlayer:", v14);

    }
    if (objc_msgSend(v12, "focusValueChanged"))
      -[PUPlayButtonTileViewController _updateHasAssetBecomeFullyFocusedSinceBeingOutOfFocus](self, "_updateHasAssetBecomeFullyFocusedSinceBeingOutOfFocus");
    goto LABEL_14;
  }
  -[PUPlayButtonTileViewController browsingViewModel](self, "browsingViewModel");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v15)
  {
    v10 = v6;
    if ((objc_msgSend(v10, "isScrubbingDidChange") & 1) == 0
      && (objc_msgSend(v10, "chromeVisibilityDidChange") & 1) == 0
      && !objc_msgSend(v10, "reviewScreenBarsModelDidChange"))
    {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_15:

}

- (PUPlayButtonTileViewControllerDelegate)delegate
{
  return (PUPlayButtonTileViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (PUBrowsingVideoPlayer)_browsingVideoPlayer
{
  return self->__browsingVideoPlayer;
}

- (BOOL)_shouldShowPlayButton
{
  return self->__shouldShowPlayButton;
}

- (PUPlayButtonTileView)playButton
{
  return self->_playButton;
}

- (void)setPlayButton:(id)a3
{
  objc_storeStrong((id *)&self->_playButton, a3);
}

- (BOOL)hasAssetBecomeFullyFocusedSinceBeingOutOfFocus
{
  return self->_hasAssetBecomeFullyFocusedSinceBeingOutOfFocus;
}

- (BOOL)isAwaitingAutoPlay
{
  return self->_isAwaitingAutoPlay;
}

- (void)setIsAwaitingAutoPlay:(BOOL)a3
{
  self->_isAwaitingAutoPlay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->__browsingVideoPlayer, 0);
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __68__PUPlayButtonTileViewController__setShouldShowPlayButton_animated___block_invoke(uint64_t a1, double a2)
{
  double v2;
  id v3;

  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  v2 = (double)*(unint64_t *)&a2;
  objc_msgSend(*(id *)(a1 + 32), "playButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

}

uint64_t __68__PUPlayButtonTileViewController__setShouldShowPlayButton_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (CGSize)playButtonTileSize
{
  double v2;
  double v3;
  CGSize result;

  if (playButtonTileSize_onceToken != -1)
    dispatch_once(&playButtonTileSize_onceToken, &__block_literal_global_75531);
  v2 = *(double *)&playButtonTileSize_playButtonTileSize_0;
  v3 = *(double *)&playButtonTileSize_playButtonTileSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __52__PUPlayButtonTileViewController_playButtonTileSize__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3F10], "px_videoOverlayButtonWithStyle:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  playButtonTileSize_playButtonTileSize_0 = v0;
  playButtonTileSize_playButtonTileSize_1 = v1;

}

@end
