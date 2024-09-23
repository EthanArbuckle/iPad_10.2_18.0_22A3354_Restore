@implementation PUCropButtonTileViewController

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

- (UIView)cropButton
{
  void *v3;

  if (-[PUCropButtonTileViewController isShowingButton](self, "isShowingButton"))
  {
    -[PUCropButtonTileViewController button](self, "button");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (UIView *)v3;
}

- (void)setPresentingTip:(BOOL)a3
{
  void *v5;
  int v6;

  if (self->_presentingTip != a3)
  {
    self->_presentingTip = a3;
    -[PUCropButtonTileViewController _updatePreventDismissalReasons](self, "_updatePreventDismissalReasons");
    if (!a3)
    {
      -[PUCropButtonTileViewController button](self, "button");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isBeingTouched");

      if (v6)
        -[PUCropButtonTileViewController setPresentMenuForTip:](self, "setPresentMenuForTip:", 1);
    }
  }
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUCropButtonTileViewController;
  -[PUTileViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PUTileViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

}

- (void)becomeReusable
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUCropButtonTileViewController;
  -[PUTileViewController becomeReusable](&v3, sel_becomeReusable);
  -[PUCropButtonTileViewController setAssetViewModel:](self, "setAssetViewModel:", 0);
  -[PUCropButtonTileViewController setBrowsingViewModel:](self, "setBrowsingViewModel:", 0);
  -[PUCropButtonTileViewController _showButton:animated:](self, "_showButton:animated:", 0, 0);
  -[PUCropButtonTileViewController _updatePreventDismissalReasons](self, "_updatePreventDismissalReasons");
  -[PUCropButtonTileViewController setPresentMenuForTip:](self, "setPresentMenuForTip:", 0);
}

- (void)didChangeVisibleRect
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUCropButtonTileViewController;
  -[PUTileViewController didChangeVisibleRect](&v3, sel_didChangeVisibleRect);
  -[PUCropButtonTileViewController _layoutSubviews](self, "_layoutSubviews");
}

- (void)_layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  -[PUTileViewController view](self, "view");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUOneUpCropButton frameForWindow:](PUOneUpCropButton, "frameForWindow:", v3);
  objc_msgSend(v3, "convertRect:toView:", v13);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PUCropButtonTileViewController button](self, "button");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)dealloc
{
  objc_super v3;

  -[PUAssetViewModel unregisterChangeObserver:](self->_assetViewModel, "unregisterChangeObserver:", self);
  -[PUBrowsingViewModel unregisterChangeObserver:](self->_browsingViewModel, "unregisterChangeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PUCropButtonTileViewController;
  -[PUTileViewController dealloc](&v3, sel_dealloc);
}

- (void)_createButtonIfNeeded
{
  void *v3;
  PUOneUpCropButton *v4;
  id v5;

  -[PUCropButtonTileViewController button](self, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PUTileViewController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(PUOneUpCropButton);
    -[PUOneUpCropButton setDelegate:](v4, "setDelegate:", self);
    objc_msgSend(v5, "addSubview:", v4);
    -[PUCropButtonTileViewController setButton:](self, "setButton:", v4);
    -[PUCropButtonTileViewController setShowingButton:](self, "setShowingButton:", 1);
    -[PUCropButtonTileViewController _showButton:animated:](self, "_showButton:animated:", 0, 0);
    -[PUCropButtonTileViewController _layoutSubviews](self, "_layoutSubviews");
    -[PUCropButtonTileViewController _updatePreventDismissalReasons](self, "_updatePreventDismissalReasons");

  }
}

- (void)_showButton:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void (**v12)(void *, uint64_t);
  id v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  _QWORD v19[4];
  id v20;
  BOOL v21;
  _QWORD aBlock[4];
  id v23;
  BOOL v24;
  id location;

  v4 = a4;
  v5 = a3;
  -[PUCropButtonTileViewController _invalidateTimers](self, "_invalidateTimers");
  if ((!v5 || -[PUCropButtonTileViewController _canShowButton](self, "_canShowButton"))
    && -[PUCropButtonTileViewController isShowingButton](self, "isShowingButton") != v5)
  {
    -[PUCropButtonTileViewController button](self, "button");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v5 || v7)
    {
      if (v5)
        -[PUCropButtonTileViewController _createButtonIfNeeded](self, "_createButtonIfNeeded");
      -[PUCropButtonTileViewController _layoutSubviews](self, "_layoutSubviews");
      -[PUCropButtonTileViewController setShowingButton:](self, "setShowingButton:", v5);
      -[PUTileViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setUserInteractionEnabled:", v5);

      -[PUCropButtonTileViewController button](self, "button");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setEnabled:", v5);
      objc_initWeak(&location, self);
      v11 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __55__PUCropButtonTileViewController__showButton_animated___block_invoke;
      aBlock[3] = &unk_1E589F4B0;
      objc_copyWeak(&v23, &location);
      v24 = v5;
      v12 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
      v19[0] = v11;
      v19[1] = 3221225472;
      v19[2] = __55__PUCropButtonTileViewController__showButton_animated___block_invoke_2;
      v19[3] = &unk_1E58AAD68;
      v13 = v10;
      v20 = v13;
      v21 = v5;
      v14 = _Block_copy(v19);
      v15 = v14;
      if (v4)
      {
        +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
        if (v5)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "quickCropFadeIn");
        }
        else
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "quickCropFadeOut");
        }
        v18 = v17;

        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v15, v12, v18);
      }
      else
      {
        (*((void (**)(void *))v14 + 2))(v14);
        v12[2](v12, 1);
      }
      -[PUCropButtonTileViewController setPresentMenuForTip:](self, "setPresentMenuForTip:", 0);

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);

    }
  }
}

- (void)_invalidateTimers
{
  void *v3;

  -[PUCropButtonTileViewController invisibilityTimer](self, "invisibilityTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[PUCropButtonTileViewController setInvisibilityTimer:](self, "setInvisibilityTimer:", 0);
}

- (BOOL)_canShowButton
{
  void *v3;
  BOOL v4;

  -[PUCropButtonTileViewController browsingViewModel](self, "browsingViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "isChromeVisible") & 1) == 0
    && -[PUCropButtonTileViewController _hasUserZoomedIn](self, "_hasUserZoomedIn");

  return v4;
}

- (BOOL)_hasUserZoomedIn
{
  void *v2;
  void *v3;
  double v4;
  BOOL v5;

  -[PUCropButtonTileViewController assetViewModel](self, "assetViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelTileTransform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4 > 1.4;

  return v5;
}

- (void)setPreventDismissalReasons:(unint64_t)a3
{
  if (self->_preventDismissalReasons != a3)
  {
    self->_preventDismissalReasons = a3;
    -[PUCropButtonTileViewController setPreventDismissal:](self, "setPreventDismissal:", a3 != 0);
  }
}

- (void)setPreventDismissal:(BOOL)a3
{
  if (self->_preventDismissal != a3)
  {
    self->_preventDismissal = a3;
    if (!a3)
      -[PUCropButtonTileViewController _dismissButtonAfterDelay](self, "_dismissButtonAfterDelay");
  }
}

- (void)_didChangeModelTileTransform:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  -[PUCropButtonTileViewController assetViewModel](self, "assetViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isUserTransformingTile"))
    v5 = objc_msgSend(v6, "isZoomedOut") ^ 1;
  else
    v5 = 0;

  -[PUCropButtonTileViewController _showButton:animated:](self, "_showButton:animated:", v5, 1);
  -[PUCropButtonTileViewController _dismissButtonAfterDelay](self, "_dismissButtonAfterDelay");
  -[PUCropButtonTileViewController setPresentMenuForTip:](self, "setPresentMenuForTip:", 0);

}

- (void)_dismissButtonAfterDelay
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quickCropInvisibilityTimer");
  v5 = v4;

  if (v5 != 0.0)
  {
    if (-[PUCropButtonTileViewController isShowingButton](self, "isShowingButton"))
    {
      -[PUCropButtonTileViewController _invalidateTimers](self, "_invalidateTimers");
      objc_initWeak(&location, self);
      v6 = (void *)MEMORY[0x1E0C99E88];
      v8 = MEMORY[0x1E0C809B0];
      v9 = 3221225472;
      v10 = __58__PUCropButtonTileViewController__dismissButtonAfterDelay__block_invoke;
      v11 = &unk_1E58A46D8;
      objc_copyWeak(&v12, &location);
      objc_msgSend(v6, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v8, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropButtonTileViewController setInvisibilityTimer:](self, "setInvisibilityTimer:", v7, v8, v9, v10, v11);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_didChangeChromeVisible:(BOOL)a3
{
  if (a3)
    -[PUCropButtonTileViewController _showButton:animated:](self, "_showButton:animated:", 0, 1);
  -[PUCropButtonTileViewController setPresentMenuForTip:](self, "setPresentMenuForTip:", 0);
}

- (void)_didChangeCurrentAsset
{
  -[PUCropButtonTileViewController _showButton:animated:](self, "_showButton:animated:", 0, 1);
  -[PUCropButtonTileViewController setHasShownButtonForCurrentAsset:](self, "setHasShownButtonForCurrentAsset:", 0);
  -[PUCropButtonTileViewController setPresentMenuForTip:](self, "setPresentMenuForTip:", 0);
}

- (void)_didChangeIrisPlaying
{
  -[PUCropButtonTileViewController _showButton:animated:](self, "_showButton:animated:", 0, 1);
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  -[PUCropButtonTileViewController assetViewModel](self, "assetViewModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PUCropButtonTileViewController browsingViewModel](self, "browsingViewModel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v18)
  {
    v16 = v6;
    if (objc_msgSend(v16, "modelTileTransformChanged"))
    {
      objc_msgSend(v18, "modelTileTransform");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropButtonTileViewController _didChangeModelTileTransform:](self, "_didChangeModelTileTransform:", v17);

    }
    if (objc_msgSend(v16, "isIrisPlayingChanged"))
      -[PUCropButtonTileViewController _didChangeIrisPlaying](self, "_didChangeIrisPlaying");
    goto LABEL_13;
  }
  if (v8 == v18)
  {
    v9 = v6;
    objc_msgSend(v18, "currentAssetReference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "assetBeforeLastViewedAssetReference");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "asset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "chromeVisibilityDidChange"))
    {
      -[PUCropButtonTileViewController _didChangeChromeVisible:](self, "_didChangeChromeVisible:", objc_msgSend(v18, "isChromeVisible"));
    }
    else if (objc_msgSend(v9, "currentAssetDidChange")
           && (objc_msgSend(v12, "isEqualToString:", v15) & 1) == 0)
    {
      -[PUCropButtonTileViewController _didChangeCurrentAsset](self, "_didChangeCurrentAsset");
    }

LABEL_13:
  }

}

- (void)_updatePreventDismissalReasons
{
  void *v3;
  void *v4;

  -[PUCropButtonTileViewController button](self, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropButtonTileViewController _updatePreventDismissalReason:activate:](self, "_updatePreventDismissalReason:activate:", 1, objc_msgSend(v3, "presentingMenu"));

  -[PUCropButtonTileViewController button](self, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropButtonTileViewController _updatePreventDismissalReason:activate:](self, "_updatePreventDismissalReason:activate:", 2, objc_msgSend(v4, "targeted"));

  -[PUCropButtonTileViewController _updatePreventDismissalReason:activate:](self, "_updatePreventDismissalReason:activate:", 4, -[PUCropButtonTileViewController presentingTip](self, "presentingTip"));
}

- (void)_updatePreventDismissalReason:(unint64_t)a3 activate:(BOOL)a4
{
  unint64_t v5;

  if (a4)
    v5 = -[PUCropButtonTileViewController preventDismissalReasons](self, "preventDismissalReasons") | a3;
  else
    v5 = -[PUCropButtonTileViewController preventDismissalReasons](self, "preventDismissalReasons") & ~a3;
  -[PUCropButtonTileViewController setPreventDismissalReasons:](self, "setPreventDismissalReasons:", v5);
}

- (void)oneUpCropButton:(id)a3 didSelectAspectRatio:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[2];

  height = a4.height;
  width = a4.width;
  v14[1] = *MEMORY[0x1E0C80C00];
  if (-[PUCropButtonTileViewController presentMenuForTip](self, "presentMenuForTip", a3))
  {
    -[PUCropButtonTileViewController setPresentMenuForTip:](self, "setPresentMenuForTip:", 0);
    -[PUCropButtonTileViewController button](self, "button");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentMenu");

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0D09910];
    v13 = *MEMORY[0x1E0D09828];
    -[PUCropButtonTileViewController assetViewModel](self, "assetViewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.cropButtonPressed"), v10);

    -[PUCropButtonTileViewController _showButton:animated:](self, "_showButton:animated:", 0, 0);
    -[PUCropButtonTileViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cropButtonTileViewController:didSelectAspectRatio:", self, width, height);

  }
}

- (CGSize)oneUpCropButtonBoundingSize:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[PUTileController tilingView](self, "tilingView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)oneUpCropButtonCurrentAspectRatio:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PUCropButtonTileViewController assetViewModel](self, "assetViewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (double)(unint64_t)objc_msgSend(v4, "pixelWidth");
  v6 = (double)(unint64_t)objc_msgSend(v4, "pixelHeight");

  v7 = v5;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)oneUpCropButtonOriginalAspectRatio:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v4 = a3;
  -[PUCropButtonTileViewController assetViewModel](self, "assetViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    objc_msgSend(v7, "fetchPropertySetsIfNeeded");
    objc_msgSend(v7, "originalMetadataProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "originalWidth");
    objc_msgSend(v8, "originalHeight");
    objc_msgSend(v8, "originalExifOrientation");
    PLOrientationTransformImageSize();
    v10 = v9;
    v12 = v11;

  }
  else
  {
    -[PUCropButtonTileViewController oneUpCropButtonCurrentAspectRatio:](self, "oneUpCropButtonCurrentAspectRatio:", v4);
    v10 = v13;
    v12 = v14;
  }

  v15 = v10;
  v16 = v12;
  result.height = v16;
  result.width = v15;
  return result;
}

- (PUCropButtonTileViewControllerDelegate)delegate
{
  return (PUCropButtonTileViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (BOOL)presentingTip
{
  return self->_presentingTip;
}

- (PUOneUpCropButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (BOOL)isShowingButton
{
  return self->_showingButton;
}

- (void)setShowingButton:(BOOL)a3
{
  self->_showingButton = a3;
}

- (NSTimer)invisibilityTimer
{
  return self->_invisibilityTimer;
}

- (void)setInvisibilityTimer:(id)a3
{
  objc_storeStrong((id *)&self->_invisibilityTimer, a3);
}

- (unint64_t)preventDismissalReasons
{
  return self->_preventDismissalReasons;
}

- (BOOL)preventDismissal
{
  return self->_preventDismissal;
}

- (BOOL)hasShownButtonForCurrentAsset
{
  return self->_hasShownButtonForCurrentAsset;
}

- (void)setHasShownButtonForCurrentAsset:(BOOL)a3
{
  self->_hasShownButtonForCurrentAsset = a3;
}

- (BOOL)presentMenuForTip
{
  return self->_presentMenuForTip;
}

- (void)setPresentMenuForTip:(BOOL)a3
{
  self->_presentMenuForTip = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invisibilityTimer, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __58__PUCropButtonTileViewController__dismissButtonAfterDelay__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  char v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "preventDismissal");

  if ((v3 & 1) == 0)
  {
    v4 = objc_loadWeakRetained(v1);
    objc_msgSend(v4, "_showButton:animated:", 0, 1);

  }
}

void __55__PUCropButtonTileViewController__showButton_animated___block_invoke(uint64_t a1, int a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  char v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained(v3);
    objc_msgSend(v5, "cropButtonTileViewController:buttonVisibilityDidChange:", v6, *(unsigned __int8 *)(a1 + 40));

    if (*(_BYTE *)(a1 + 40))
    {
      v7 = objc_loadWeakRetained(v3);
      v8 = objc_msgSend(v7, "hasShownButtonForCurrentAsset");

      if ((v8 & 1) == 0)
      {
        v9 = objc_loadWeakRetained(v3);
        objc_msgSend(v9, "setHasShownButtonForCurrentAsset:", 1);

        v10 = objc_loadWeakRetained(v3);
        objc_msgSend(v10, "assetViewModel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "asset");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = (void *)MEMORY[0x1E0D09910];
          v15 = *MEMORY[0x1E0D09828];
          v16[0] = v12;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.cropButtonEnabled"), v14);

        }
      }
    }
  }
}

uint64_t __55__PUCropButtonTileViewController__showButton_animated___block_invoke_2(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v1);
}

@end
