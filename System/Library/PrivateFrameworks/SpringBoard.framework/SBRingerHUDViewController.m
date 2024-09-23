@implementation SBRingerHUDViewController

- (void)viewDidLoad
{
  SBRingerPillView *v3;
  SBRingerPillView *pillView;
  void *v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBRingerHUDViewController;
  -[SBRingerHUDViewController viewDidLoad](&v8, sel_viewDidLoad);
  v3 = -[SBRingerPillView initWithActivatedForPreviewing:]([SBRingerPillView alloc], "initWithActivatedForPreviewing:", self->_activatedForPreviewing);
  pillView = self->_pillView;
  self->_pillView = v3;

  -[SBRingerPillView _setTouchInsets:](self->_pillView, "_setTouchInsets:", 0.0, 0.0, -30.0, 0.0);
  -[SBRingerPillView sizeToFit](self->_pillView, "sizeToFit");
  -[SBRingerHUDViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_pillView);

  -[SBRingerHUDViewController _layoutPillView](self, "_layoutPillView");
  -[SBRingerPillView bounds](self->_pillView, "bounds");
  -[SBRingerHUDViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v7);
  -[SBRingerHUDViewController _updateVolumeSliderAnimated:](self, "_updateVolumeSliderAnimated:", 0);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBRingerHUDViewController;
  -[SBRingerHUDViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[SBRingerHUDViewController _layoutPillView](self, "_layoutPillView");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBRingerHUDViewController;
  -[SBRingerHUDViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SBRingerHUDViewController _updateVolumeSliderAnimated:](self, "_updateVolumeSliderAnimated:", 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setRingerSilent:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  SBLogRingerHUD();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SBRingerHUDViewController setRingerSilent: %{BOOL}d", (uint8_t *)v6, 8u);
  }

  if (self->_ringerSilent != v3)
  {
    self->_ringerSilent = v3;
    self->_lastEventIsAVolumeChange = 0;
    -[SBRingerHUDViewController _updateStateAnimated:invert:](self, "_updateStateAnimated:invert:", 1, 0);
  }
}

- (void)nudgeUp:(BOOL)a3
{
  double v4;

  if (a3)
  {
    if ((BSFloatIsOne() & 1) == 0)
      return;
    v4 = 0.0625;
  }
  else
  {
    if (!BSFloatLessThanOrEqualToFloat())
      return;
    v4 = -0.0625;
  }
  self->_overshoot = self->_overshoot + v4;
  -[SBRingerHUDViewController _updateVolumeSliderAnimated:](self, "_updateVolumeSliderAnimated:", 1);
}

- (void)buttonReleased
{
  self->_overshoot = 0.0;
  -[SBRingerHUDViewController _updateVolumeSliderAnimated:](self, "_updateVolumeSliderAnimated:", 1);
}

- (void)setVolume:(float)a3
{
  -[SBRingerHUDViewController setVolume:animated:forKeyPress:](self, "setVolume:animated:forKeyPress:", 1, 0);
}

- (void)setVolume:(float)a3 animated:(BOOL)a4 forKeyPress:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  NSObject *v9;
  int v10;
  double v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v5 = a5;
  v6 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  SBLogRingerHUD();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218496;
    v11 = a3;
    v12 = 1024;
    v13 = v6;
    v14 = 1024;
    v15 = v5;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "SBRingerHUDViewController setVolume:%.2f animated:%{BOOL}d forKeyPress:%{BOOL}d", (uint8_t *)&v10, 0x18u);
  }

  -[SBRingerHUDViewController _extendDismissalTimer](self, "_extendDismissalTimer");
  if (v5)
    self->_lastEventIsAVolumeChange = 1;
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_volume = a3;
    -[SBRingerHUDViewController _updateVolumeSliderAnimated:](self, "_updateVolumeSliderAnimated:", v6);
  }
  if (v5)
    -[SBRingerHUDViewController _updateStateAnimated:invert:](self, "_updateStateAnimated:invert:", 1, 0);
}

- (void)setActivatedForPreviewing:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  SBBannerCustomTransitioningDelegate *customTransitioningDelegate;
  SBBannerCustomTransitioningDelegate *v7;
  SBBannerCustomTransitioningDelegate *v8;

  v3 = a3;
  self->_activatedForPreviewing = a3;
  -[SBRingerHUDViewController transitioningDelegate](self, "transitioningDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && v3)
  {
    customTransitioningDelegate = self->_customTransitioningDelegate;
    if (!customTransitioningDelegate)
    {
      v7 = objc_alloc_init(SBBannerCustomTransitioningDelegate);
      v8 = self->_customTransitioningDelegate;
      self->_customTransitioningDelegate = v7;

      customTransitioningDelegate = self->_customTransitioningDelegate;
    }
    -[SBRingerHUDViewController setTransitioningDelegate:](self, "setTransitioningDelegate:", customTransitioningDelegate);
  }
}

- (void)_layoutPillView
{
  SBRingerPillView *pillView;
  id v4;

  -[SBRingerHUDViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  pillView = self->_pillView;
  UIRectGetCenter();
  -[SBRingerPillView setCenter:](pillView, "setCenter:");

}

- (void)_updateVolumeSliderAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  float v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  SBLogRingerHUD();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SBRingerHUDViewController _updateVolumeSliderAnimated:%{BOOL}d", (uint8_t *)v7, 8u);
  }

  v6 = self->_overshoot + self->_volume;
  -[SBRingerPillView setSliderValue:animated:](self->_pillView, "setSliderValue:animated:", v3, v6);
}

- (void)_updateStateAnimated:(BOOL)a3 invert:(BOOL)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SBRingerPillView *pillView;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  SBRingerHUDViewController *v22;
  id v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  _QWORD v26[5];
  _QWORD v27[5];
  void (**v28)(_QWORD);
  _QWORD v29[4];
  void (**v30)(_QWORD);
  _QWORD v31[5];
  char v32;
  BOOL v33;
  _QWORD v34[6];
  _QWORD v35[7];

  v5 = a3;
  v35[6] = *MEMORY[0x1E0C80C00];
  if (-[SBRingerHUDViewController isViewLoaded](self, "isViewLoaded"))
  {
    +[SBDefaults externalDefaults](SBDefaults, "externalDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "soundDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "buttonsCanChangeRingerVolume");
    v10 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __57__SBRingerHUDViewController__updateStateAnimated_invert___block_invoke;
    v31[3] = &unk_1E8EA1C70;
    v32 = v9;
    v31[4] = self;
    v33 = a4;
    v11 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v31);
    v12 = v11;
    if (v5)
    {
      if (self->_activatedForPreviewing)
      {
        if (!self->_ringerSilent)
        {
          CGAffineTransformMakeTranslation(&v25, 15.0, 0.0);
          pillView = self->_pillView;
          v24 = v25;
          -[SBRingerPillView setTransform:](pillView, "setTransform:", &v24);
          v34[0] = &unk_1E91CF828;
          v34[1] = &unk_1E91CF838;
          v35[0] = &unk_1E91D13E8;
          v35[1] = &unk_1E91D1400;
          v34[2] = &unk_1E91CF848;
          v34[3] = &unk_1E91CF858;
          v35[2] = &unk_1E91D1418;
          v35[3] = &unk_1E91CF868;
          v34[4] = &unk_1E91CF878;
          v34[5] = &unk_1E91CF898;
          v35[4] = &unk_1E91CF888;
          v35[5] = &unk_1E91D1430;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 6);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)MEMORY[0x1E0CEABB0];
          v20[0] = v10;
          v20[1] = 3221225472;
          v20[2] = __57__SBRingerHUDViewController__updateStateAnimated_invert___block_invoke_24;
          v20[3] = &unk_1E8E9F7B8;
          v21 = v17;
          v22 = self;
          v23 = v12;
          v19 = v17;
          objc_msgSend(v18, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v20, 0, 1.2, 0.0);

          goto LABEL_10;
        }
        v13 = (void *)MEMORY[0x1E0CEABB0];
        v27[0] = v10;
        v27[1] = 3221225472;
        v27[2] = __57__SBRingerHUDViewController__updateStateAnimated_invert___block_invoke_3;
        v27[3] = &unk_1E8EA02D8;
        v27[4] = self;
        v28 = v11;
        v26[0] = v10;
        v26[1] = 3221225472;
        v26[2] = __57__SBRingerHUDViewController__updateStateAnimated_invert___block_invoke_4;
        v26[3] = &unk_1E8E9E980;
        v26[4] = self;
        objc_msgSend(v13, "animateWithDuration:delay:options:animations:completion:", 0, v27, v26, 0.3, 0.0);
        v14 = v28;
      }
      else
      {
        v15 = (void *)MEMORY[0x1E0CEABB0];
        v29[0] = v10;
        v29[1] = 3221225472;
        v29[2] = __57__SBRingerHUDViewController__updateStateAnimated_invert___block_invoke_2;
        v29[3] = &unk_1E8E9E8D0;
        v30 = v11;
        objc_msgSend(v15, "animateWithDuration:delay:options:animations:completion:", 4, v29, 0, 0.3, 0.0);
        v14 = v30;
      }

    }
    else
    {
      v11[2](v11);
    }
LABEL_10:

  }
}

uint64_t __57__SBRingerHUDViewController__updateStateAnimated_invert___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
  {
    v3 = 4;
    if (!*(_BYTE *)(v2 + 970))
      v3 = 1;
    v4 = 3;
  }
  else
  {
    v3 = 1;
    v4 = 2;
  }
  if (*(_BYTE *)(v2 + 968))
    v5 = v3;
  else
    v5 = v4;
  if (*(_BYTE *)(v2 + 968))
    v3 = v4;
  if (*(_BYTE *)(a1 + 41))
    v6 = v3;
  else
    v6 = v5;
  objc_msgSend(*(id *)(v2 + 992), "setState:", v6);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "layoutIfNeeded");
}

uint64_t __57__SBRingerHUDViewController__updateStateAnimated_invert___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__SBRingerHUDViewController__updateStateAnimated_invert___block_invoke_3(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 992);
  CGAffineTransformMakeScale(&v4, 1.1, 1.1);
  objc_msgSend(v2, "setTransform:", &v4);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __57__SBRingerHUDViewController__updateStateAnimated_invert___block_invoke_4(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57__SBRingerHUDViewController__updateStateAnimated_invert___block_invoke_5;
  v2[3] = &unk_1E8E9DED8;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v2, 0, 0.3, 0.0);
}

uint64_t __57__SBRingerHUDViewController__updateStateAnimated_invert___block_invoke_5(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 992);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

void __57__SBRingerHUDViewController__updateStateAnimated_invert___block_invoke_24(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  double v13;
  id v14;
  id obj;
  _QWORD v16[5];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_compare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x1E0CEABB0];
        objc_msgSend(v9, "floatValue");
        v13 = v12;
        v16[0] = v7;
        v16[1] = 3221225472;
        v16[2] = __57__SBRingerHUDViewController__updateStateAnimated_invert___block_invoke_2_27;
        v16[3] = &unk_1E8E9E820;
        v16[4] = *(_QWORD *)(a1 + 40);
        v17 = v10;
        v14 = v10;
        objc_msgSend(v11, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v16, v13, 0.2);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __57__SBRingerHUDViewController__updateStateAnimated_invert___block_invoke_2_27(uint64_t a1)
{
  float v2;
  void *v3;
  CGAffineTransform v5;
  CGAffineTransform v6;

  objc_msgSend(*(id *)(a1 + 40), "floatValue");
  CGAffineTransformMakeTranslation(&v6, v2, 0.0);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 992);
  v5 = v6;
  return objc_msgSend(v3, "setTransform:", &v5);
}

- (void)presentForMuteChange:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  dispatch_time_t v12;
  SBRingerHUDViewController *v13;
  uint64_t v14;
  _QWORD block[5];
  uint8_t buf[4];
  _BOOL4 v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  SBLogRingerHUD();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v17 = v3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SBRingerHUDViewController presentForMuteChange: %{BOOL}d", buf, 8u);
  }

  v6 = -[SBRingerHUDViewController isPresentableAppearingOrAppeared](self, "isPresentableAppearingOrAppeared");
  -[SBRingerHUDViewController _extendDismissalTimer](self, "_extendDismissalTimer");
  if (!v6)
  {
    -[SBRingerHUDViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ringerHUDViewControllerWantsToBePresented:", self);

    -[SBRingerHUDViewController setShouldExtendDismissalTimerUponDidAppear:](self, "setShouldExtendDismissalTimerUponDidAppear:", 1);
    if (v3)
    {
      -[SBRingerHUDViewController _updateStateAnimated:invert:](self, "_updateStateAnimated:invert:", 0, 1);
      -[SBRingerHUDViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safeAreaInsets");
      v11 = v10;

      if (v11 != 0.0)
      {
        v12 = dispatch_time(0, 200000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __50__SBRingerHUDViewController_presentForMuteChange___block_invoke;
        block[3] = &unk_1E8E9DED8;
        block[4] = self;
        dispatch_after(v12, MEMORY[0x1E0C80D38], block);
        return;
      }
      v13 = self;
      v14 = 1;
    }
    else
    {
      v13 = self;
      v14 = 0;
    }
    -[SBRingerHUDViewController _updateStateAnimated:invert:](v13, "_updateStateAnimated:invert:", v14, 0);
  }
}

uint64_t __50__SBRingerHUDViewController_presentForMuteChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStateAnimated:invert:", 1, 0);
}

- (void)_dismiss
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  SBLogRingerHUD();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "SBRingerHUDViewController dismiss", v5, 2u);
  }

  -[SBRingerHUDViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ringerHUDViewControllerWantsToBeDismissed:", self);

}

- (void)_extendDismissalTimer
{
  NSObject *v3;
  NSTimer *dismissalTimer;
  void *v5;
  NSTimer *v6;
  NSTimer *v7;
  _QWORD v8[4];
  id v9;
  id buf[2];

  SBLogRingerHUD();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "SBRingerHUDViewController _extendDismissalTimer", (uint8_t *)buf, 2u);
  }

  -[NSTimer invalidate](self->_dismissalTimer, "invalidate");
  dismissalTimer = self->_dismissalTimer;
  self->_dismissalTimer = 0;

  if (!self->_dismissalTimer)
  {
    objc_initWeak(buf, self);
    v5 = (void *)MEMORY[0x1E0C99E88];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__SBRingerHUDViewController__extendDismissalTimer__block_invoke;
    v8[3] = &unk_1E8E9FA90;
    objc_copyWeak(&v9, buf);
    objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 0, v8, 1.5);
    v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v7 = self->_dismissalTimer;
    self->_dismissalTimer = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
  }
}

void __50__SBRingerHUDViewController__extendDismissalTimer__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_dismiss");
  objc_msgSend(v3, "invalidate");

  objc_msgSend(WeakRetained, "setDismissalTimer:", 0);
}

- (NSString)requesterIdentifier
{
  return (NSString *)CFSTR("com.apple.SpringBoard.RingerHUD");
}

- (NSString)requestIdentifier
{
  return (NSString *)CFSTR("RingerHUD");
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  -[SBRingerHUDViewController setPresentableAppearingOrAppeared:](self, "setPresentableAppearingOrAppeared:", 1);
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  -[SBRingerHUDViewController setPresentableAppearingOrAppeared:](self, "setPresentableAppearingOrAppeared:", 1);
  if (-[SBRingerHUDViewController shouldExtendDismissalTimerUponDidAppear](self, "shouldExtendDismissalTimerUponDidAppear"))
  {
    -[SBRingerHUDViewController setShouldExtendDismissalTimerUponDidAppear:](self, "setShouldExtendDismissalTimerUponDidAppear:", 0);
    -[SBRingerHUDViewController _extendDismissalTimer](self, "_extendDismissalTimer");
  }
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  -[SBRingerHUDViewController setPresentableAppearingOrAppeared:](self, "setPresentableAppearingOrAppeared:", 0, a4);
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  -[SBRingerHUDViewController setPresentableAppearingOrAppeared:](self, "setPresentableAppearingOrAppeared:", 0, a4);
}

- (int64_t)presentableBehavior
{
  return 1;
}

- (id)presentableDescription
{
  return CFSTR("Ringer HUD");
}

- (BOOL)isRingerSilent
{
  return self->_ringerSilent;
}

- (BOOL)isActivatedForPreviewing
{
  return self->_activatedForPreviewing;
}

- (float)volume
{
  return self->_volume;
}

- (SBRingerHUDViewControllerDelegate)delegate
{
  return (SBRingerHUDViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBRingerPillView)pillView
{
  return self->_pillView;
}

- (void)setPillView:(id)a3
{
  objc_storeStrong((id *)&self->_pillView, a3);
}

- (BOOL)lastEventIsAVolumeChange
{
  return self->_lastEventIsAVolumeChange;
}

- (void)setLastEventIsAVolumeChange:(BOOL)a3
{
  self->_lastEventIsAVolumeChange = a3;
}

- (double)overshoot
{
  return self->_overshoot;
}

- (void)setOvershoot:(double)a3
{
  self->_overshoot = a3;
}

- (BOOL)isPresentableAppearingOrAppeared
{
  return self->_presentableAppearingOrAppeared;
}

- (void)setPresentableAppearingOrAppeared:(BOOL)a3
{
  self->_presentableAppearingOrAppeared = a3;
}

- (BOOL)shouldExtendDismissalTimerUponDidAppear
{
  return self->_shouldExtendDismissalTimerUponDidAppear;
}

- (void)setShouldExtendDismissalTimerUponDidAppear:(BOOL)a3
{
  self->_shouldExtendDismissalTimerUponDidAppear = a3;
}

- (NSTimer)dismissalTimer
{
  return self->_dismissalTimer;
}

- (void)setDismissalTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalTimer, a3);
}

- (SBBannerCustomTransitioningDelegate)customTransitioningDelegate
{
  return self->_customTransitioningDelegate;
}

- (void)setCustomTransitioningDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_customTransitioningDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customTransitioningDelegate, 0);
  objc_storeStrong((id *)&self->_dismissalTimer, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
