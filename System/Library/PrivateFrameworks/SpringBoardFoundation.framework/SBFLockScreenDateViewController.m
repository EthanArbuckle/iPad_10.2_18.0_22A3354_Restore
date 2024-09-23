@implementation SBFLockScreenDateViewController

void __52__SBFLockScreenDateViewController__startUpdateTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateView");

}

- (void)_startUpdateTimer
{
  SBFDateProviding *dateProvider;
  void *v4;
  id timerToken;
  _QWORD v6[4];
  id v7;
  id location;

  if (!self->_timerToken)
  {
    objc_initWeak(&location, self);
    dateProvider = self->_dateProvider;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52__SBFLockScreenDateViewController__startUpdateTimer__block_invoke;
    v6[3] = &unk_1E200FA18;
    objc_copyWeak(&v7, &location);
    -[SBFDateProviding observeMinuteUpdatesWithHandler:](dateProvider, "observeMinuteUpdatesWithHandler:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    timerToken = self->_timerToken;
    self->_timerToken = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_updateView
{
  void *v3;
  void *v4;

  if (self->_disablesUpdates)
  {
    -[SBFLockScreenDateViewController _stopUpdateTimer](self, "_stopUpdateTimer");
  }
  else
  {
    -[SBFLockScreenDateViewController dateViewIfExists](self, "dateViewIfExists");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFDateProviding date](self->_dateProvider, "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDate:", v4);

    -[SBFLockScreenDateViewController _startUpdateTimer](self, "_startUpdateTimer");
  }
}

- (id)dateViewIfExists
{
  void *v3;

  if (-[SBFLockScreenDateViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[SBFLockScreenDateViewController dateView](self, "dateView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (SBFLockScreenDateViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  SBFLockScreenDateViewController *v8;
  SBFLockScreenDateViewController *v9;
  SBAlwaysOnDefaults *v10;
  SBAlwaysOnDefaults *alwaysOnDefaults;
  SBAlwaysOnDefaults *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  BSDefaultObserver *alwaysOnDefaultsObserver;
  void *v19;
  objc_class *v20;
  id v21;
  void *v22;
  uint64_t v23;
  CSProminentDisplayViewController *prominentDisplayViewController;
  void *v25;
  void *v26;
  SBFLockScreenDateViewController *v27;
  _QWORD v29[4];
  id v30;
  id location;
  objc_super v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)SBFLockScreenDateViewController;
  v8 = -[SBFLockScreenDateViewController initWithNibName:bundle:](&v32, sel_initWithNibName_bundle_, v6, v7);
  v9 = v8;
  if (v8)
  {
    -[SBFLockScreenDateViewController _addObservers](v8, "_addObservers");
    -[SBFLockScreenDateViewController setDateProvider:](v9, "setDateProvider:", 0);
    v10 = objc_alloc_init(SBAlwaysOnDefaults);
    alwaysOnDefaults = v9->_alwaysOnDefaults;
    v9->_alwaysOnDefaults = v10;

    objc_initWeak(&location, v9);
    v12 = v9->_alwaysOnDefaults;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "useDebugColors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C80D38];
    v15 = MEMORY[0x1E0C80D38];
    v16 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __58__SBFLockScreenDateViewController_initWithNibName_bundle___block_invoke;
    v29[3] = &unk_1E200F978;
    objc_copyWeak(&v30, &location);
    -[BSAbstractDefaultDomain observeDefault:onQueue:withBlock:](v12, "observeDefault:onQueue:withBlock:", v13, v14, v29);
    v17 = objc_claimAutoreleasedReturnValue();
    alwaysOnDefaultsObserver = v9->_alwaysOnDefaultsObserver;
    v9->_alwaysOnDefaultsObserver = (BSDefaultObserver *)v17;

    if (_os_feature_enabled_impl())
    {
      v34 = 0;
      v35 = &v34;
      v36 = 0x2050000000;
      v19 = (void *)getCSProminentDisplayViewControllerClass_softClass;
      v37 = getCSProminentDisplayViewControllerClass_softClass;
      if (!getCSProminentDisplayViewControllerClass_softClass)
      {
        v33[0] = v16;
        v33[1] = 3221225472;
        v33[2] = __getCSProminentDisplayViewControllerClass_block_invoke;
        v33[3] = &unk_1E200E038;
        v33[4] = &v34;
        __getCSProminentDisplayViewControllerClass_block_invoke((uint64_t)v33);
        v19 = (void *)v35[3];
      }
      v20 = objc_retainAutorelease(v19);
      _Block_object_dispose(&v34, 8);
      v21 = [v20 alloc];
      objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "initWithElements:date:textColor:", -1, 0, v22);
      prominentDisplayViewController = v9->_prominentDisplayViewController;
      v9->_prominentDisplayViewController = (CSProminentDisplayViewController *)v23;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObserver:selector:name:object:", v9, sel__updateAlternateCalendar, *MEMORY[0x1E0CAA1E8], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObserver:selector:name:object:", v9, sel__updateAlternateCalendar, *MEMORY[0x1E0C99720], 0);

      -[SBFLockScreenDateViewController _updateAlternateCalendar](v9, "_updateAlternateCalendar");
    }
    v27 = v9;
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __58__SBFLockScreenDateViewController_initWithNibName_bundle___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "viewIfLoaded");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_backlightSceneEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateAllTimelinesForReason:", CFSTR("SBFLockScreenDateViewController: Debug Colors Switch Changed"));

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SBFLockScreenDateViewController _stopUpdateTimer](self, "_stopUpdateTimer");
  -[BSDefaultObserver invalidate](self->_alwaysOnDefaultsObserver, "invalidate");
  +[SBFLegibilityDomain rootSettings](SBFLegibilityDomain, "rootSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeKeyObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBFLockScreenDateViewController;
  -[SBFLockScreenDateViewController dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_isVisible, CFSTR("isVisible"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_screenOff, CFSTR("screenOff"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", !self->_disablesUpdates, CFSTR("wantsPreciseTime"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", self->_timerToken != 0, CFSTR("preciseTimeEnabled"));
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)setScreenOff:(BOOL)a3
{
  if (self->_screenOff != a3)
  {
    self->_screenOff = a3;
    -[SBFLockScreenDateViewController _updateState](self, "_updateState");
    if (self->_screenOff)
      -[CSProminentDisplayViewController setTransientSubtitleText:](self->_prominentDisplayViewController, "setTransientSubtitleText:", 0);
  }
}

- (BOOL)isSubtitleHidden
{
  void *v2;
  char v3;

  -[SBFLockScreenDateViewController dateViewIfExists](self, "dateViewIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSubtitleHidden");

  return v3;
}

- (void)setSubtitleHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBFLockScreenDateViewController dateView](self, "dateView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubtitleHidden:", v3);

}

- (void)setLegibilitySettings:(id)a3
{
  _UILegibilitySettings *v5;
  _UILegibilitySettings **p_legibilitySettings;
  void *v7;
  _UILegibilitySettings *v8;

  v5 = (_UILegibilitySettings *)a3;
  p_legibilitySettings = &self->_legibilitySettings;
  if (self->_legibilitySettings != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBFLockScreenDateViewController _updateLegibilityStrength](self, "_updateLegibilityStrength");
    -[SBFLockScreenDateViewController dateView](self, "dateView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLegibilitySettings:", *p_legibilitySettings);

    v5 = v8;
  }

}

- (BOOL)shouldApplyVibrancyToComplications
{
  return -[CSProminentDisplayViewController shouldApplyVibrancyToComplications](self->_prominentDisplayViewController, "shouldApplyVibrancyToComplications");
}

- (void)setShouldApplyVibrancyToComplications:(BOOL)a3
{
  -[CSProminentDisplayViewController setShouldApplyVibrancyToComplications:](self->_prominentDisplayViewController, "setShouldApplyVibrancyToComplications:", a3);
}

- (void)setRestrictsVibrancy:(BOOL)a3
{
  if (self->_restrictsVibrancy != a3)
  {
    self->_restrictsVibrancy = a3;
    -[CSProminentDisplayViewController setEffectType:](self->_prominentDisplayViewController, "setEffectType:", a3);
  }
}

- (void)setTimeAlpha:(double)a3 subtitleAlpha:(double)a4
{
  id v6;

  -[SBFLockScreenDateViewController dateViewIfExists](self, "dateViewIfExists");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeAlpha:subtitleAlpha:", a3, a4);

}

- (void)setBackgroundAlpha:(double)a3
{
  id v4;

  -[CSProminentDisplayViewController backgroundView](self->_prominentDisplayViewController, "backgroundView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", a3);

}

- (void)setDimmingViewAlpha:(double)a3
{
  -[CSProminentDisplayViewController setContentAlpha:forElements:](self->_prominentDisplayViewController, "setContentAlpha:forElements:", 32, a3);
}

- (double)backgroundAlpha
{
  void *v2;
  double v3;
  double v4;

  -[CSProminentDisplayViewController backgroundView](self->_prominentDisplayViewController, "backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v4 = v3;

  return v4;
}

- (void)setCustomSubtitleView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBFLockScreenDateViewController dateViewIfExists](self, "dateViewIfExists");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomSubtitleView:", v4);

}

- (void)setCustomSubtitle:(id)a3
{
  CSProminentDisplayViewController *prominentDisplayViewController;
  id v5;
  id v6;

  prominentDisplayViewController = self->_prominentDisplayViewController;
  v6 = a3;
  if (-[SBFLockScreenDateViewController _supportsCoaching](self, "_supportsCoaching"))
    v5 = v6;
  else
    v5 = 0;
  -[CSProminentDisplayViewController setTransientSubtitleText:](prominentDisplayViewController, "setTransientSubtitleText:", v5);

}

- (void)setCustomSubtitle:(id)a3 withTimeout:(double)a4
{
  CSProminentDisplayViewController *prominentDisplayViewController;
  id v7;
  id v8;

  prominentDisplayViewController = self->_prominentDisplayViewController;
  v8 = a3;
  if (-[SBFLockScreenDateViewController _supportsCoaching](self, "_supportsCoaching"))
    v7 = v8;
  else
    v7 = 0;
  -[CSProminentDisplayViewController setTransientSubtitleText:withTimeout:](prominentDisplayViewController, "setTransientSubtitleText:withTimeout:", v7, a4);

}

- (id)transientSubtitleText
{
  return (id)-[CSProminentDisplayViewController transientSubtitleText](self->_prominentDisplayViewController, "transientSubtitleText");
}

- (BOOL)_supportsCoaching
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInterfaceIdiom");

  return _os_feature_enabled_impl();
}

- (void)setAlternateDateEnabled:(BOOL)a3
{
  if (self->_alternateDateEnabled != a3)
  {
    self->_alternateDateEnabled = a3;
    -[SBFLockScreenDateViewController _updateAlternateCalendar](self, "_updateAlternateCalendar");
  }
}

- (void)setDateProvider:(id)a3
{
  SBFDefaultDateProvider *v4;
  SBFDefaultDateProvider *obj;

  v4 = (SBFDefaultDateProvider *)a3;
  if (!v4)
    v4 = objc_alloc_init(SBFDefaultDateProvider);
  if ((SBFDefaultDateProvider *)self->_dateProvider != v4)
  {
    obj = v4;
    -[SBFLockScreenDateViewController _stopUpdateTimer](self, "_stopUpdateTimer");
    objc_storeStrong((id *)&self->_dateProvider, obj);
    if (!self->_disablesUpdates)
      -[SBFLockScreenDateViewController _startUpdateTimer](self, "_startUpdateTimer");
    -[SBFLockScreenDateViewController _updateFormatIfEnabled](self, "_updateFormatIfEnabled");
    v4 = obj;
  }

}

- (void)setInlineComplicationViewController:(id)a3
{
  -[CSProminentDisplayViewController setSubtitleComplicationViewController:](self->_prominentDisplayViewController, "setSubtitleComplicationViewController:", a3);
}

- (UIViewController)inlineComplicationViewController
{
  return (UIViewController *)-[CSProminentDisplayViewController subtitleComplicationViewController](self->_prominentDisplayViewController, "subtitleComplicationViewController");
}

- (void)setComplicationContainerViewController:(id)a3
{
  -[CSProminentDisplayViewController setComplicationContainerViewController:](self->_prominentDisplayViewController, "setComplicationContainerViewController:", a3);
}

- (UIViewController)complicationContainerViewController
{
  return (UIViewController *)-[CSProminentDisplayViewController complicationContainerViewController](self->_prominentDisplayViewController, "complicationContainerViewController");
}

- (void)updateTimeNow
{
  void *v3;
  id v4;

  -[SBFLockScreenDateViewController dateViewIfExists](self, "dateViewIfExists");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFDateProviding date](self->_dateProvider, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDate:", v3);

}

- (void)setTimerWithText:(id)a3
{
  -[CSProminentDisplayViewController setCustomSubtitleWithText:glyphName:](self->_prominentDisplayViewController, "setCustomSubtitleWithText:glyphName:", a3, CFSTR("timer"));
}

- (void)updateTimerWithText:(id)a3
{
  -[CSProminentDisplayViewController updateCustomSubtitleWithText:](self->_prominentDisplayViewController, "updateCustomSubtitleWithText:", a3);
}

- (void)setDateTimeAlignment:(int64_t)a3
{
  -[CSProminentDisplayViewController setDateTimeAlignment:](self->_prominentDisplayViewController, "setDateTimeAlignment:", a3);
}

- (void)loadView
{
  SBFLockScreenDateView *v3;
  void *v4;
  void *v5;
  SBFLockScreenDateView *v6;

  v3 = [SBFLockScreenDateView alloc];
  v6 = -[SBFLockScreenDateView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[SBFLockScreenDateView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
  if (_os_feature_enabled_impl())
  {
    -[SBFLockScreenDateViewController addChildViewController:](self, "addChildViewController:", self->_prominentDisplayViewController);
    -[SBFLockScreenDateView setProminentDisplayViewController:](v6, "setProminentDisplayViewController:", self->_prominentDisplayViewController);
    -[CSProminentDisplayViewController view](self->_prominentDisplayViewController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFLockScreenDateView addSubview:](v6, "addSubview:", v4);

    -[CSProminentDisplayViewController didMoveToParentViewController:](self->_prominentDisplayViewController, "didMoveToParentViewController:", self);
  }
  -[SBFLockScreenDateView setLegibilitySettings:](v6, "setLegibilitySettings:", self->_legibilitySettings);
  -[SBFLockScreenDateViewController setView:](self, "setView:", v6);
  -[SBFLockScreenDateViewController _updateLegibilityStrength](self, "_updateLegibilityStrength");
  -[SBFDateProviding date](self->_dateProvider, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFLockScreenDateView setDate:](v6, "setDate:", v5);

}

- (void)setView:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFLockScreenDateViewController;
  -[SBFLockScreenDateViewController setView:](&v5, sel_setView_);
  if (!a3)
    -[SBFLockScreenDateViewController _stopUpdateTimer](self, "_stopUpdateTimer");
}

- (void)willMoveToParentViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFLockScreenDateViewController;
  -[SBFLockScreenDateViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_);
  if (!a3)
    -[SBFLockScreenDateViewController setView:](self, "setView:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBFLockScreenDateViewController;
  -[SBFLockScreenDateViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  self->_isVisible = 1;
  -[SBFLockScreenDateViewController _updateState](self, "_updateState");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBFLockScreenDateViewController;
  -[SBFLockScreenDateViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  self->_isVisible = 0;
  -[SBFLockScreenDateViewController _updateState](self, "_updateState");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBFLockScreenDateViewController;
  -[SBFLockScreenDateViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v10, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  -[CSProminentDisplayViewController backgroundView](self->_prominentDisplayViewController, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[SBFAnimationUtilities matchMoveAnimationForPinningToView:](SBFAnimationUtilities, "matchMoveAnimationForPinningToView:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAnimation:forKey:", v9, CFSTR("SBFLockScreenDateViewControllerProminentBackgroundMatchMoveAnimation"));

  }
  else
  {
    objc_msgSend(v8, "removeAnimationForKey:", CFSTR("SBFLockScreenDateViewControllerProminentBackgroundMatchMoveAnimation"));
  }

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  objc_super v16;

  height = a3.height;
  width = a3.width;
  v16.receiver = self;
  v16.super_class = (Class)SBFLockScreenDateViewController;
  v7 = a4;
  -[SBFLockScreenDateViewController viewWillTransitionToSize:withTransitionCoordinator:](&v16, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[CSProminentDisplayViewController backgroundView](self->_prominentDisplayViewController, "backgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "animationForKey:", CFSTR("SBFLockScreenDateViewControllerProminentBackgroundMatchMoveAnimation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAnimationForKey:", CFSTR("SBFLockScreenDateViewControllerProminentBackgroundMatchMoveAnimation"));
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__SBFLockScreenDateViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v13[3] = &unk_1E200F9F0;
  v14 = v9;
  v15 = v10;
  v11 = v10;
  v12 = v9;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v13);

}

uint64_t __86__SBFLockScreenDateViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAnimation:forKey:", *(_QWORD *)(a1 + 40), CFSTR("SBFLockScreenDateViewControllerProminentBackgroundMatchMoveAnimation"));
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  +[SBFLegibilityDomain rootSettings](SBFLegibilityDomain, "rootSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    -[SBFLockScreenDateViewController _updateLegibilityStrength](self, "_updateLegibilityStrength");
}

- (void)_updateWithFrameSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[SBFLockScreenDateViewController dateViewIfExists](self, "dateViewIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v15, "presentationInterval");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDate:", v6);

    LODWORD(v5) = -[SBAlwaysOnDefaults useDebugColors](self->_alwaysOnDefaults, "useDebugColors");
    -[SBFLockScreenDateViewController dateViewIfExists](self, "dateViewIfExists");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((_DWORD)v5)
    {
      v9 = objc_alloc(MEMORY[0x1E0CEADE8]);
      objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v9, "initWithStyle:primaryColor:secondaryColor:shadowColor:", 0, v10, v11, v12);
      objc_msgSend(v8, "setLegibilitySettings:", v13);

    }
    else
    {
      objc_msgSend(v7, "setLegibilitySettings:", self->_legibilitySettings);
    }
  }
  else
  {
    objc_msgSend(v4, "setLegibilitySettings:", self->_legibilitySettings);

    -[SBFLockScreenDateViewController dateViewIfExists](self, "dateViewIfExists");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFDateProviding date](self->_dateProvider, "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDate:", v14);

  }
}

- (id)_timelinesForDateInterval:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D00F38];
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "everyMinuteTimelineWithIdentifier:configure:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_updateAlternateCalendar
{
  void *v3;
  CSProminentDisplayViewController *prominentDisplayViewController;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CAA208], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overlayCalendarID");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length") && self->_alternateDateEnabled)
  {
    prominentDisplayViewController = self->_prominentDisplayViewController;
    objc_msgSend(MEMORY[0x1E0D3EFB0], "localeForCalendarID:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSProminentDisplayViewController setAlternateCalendarIdentifier:locale:](prominentDisplayViewController, "setAlternateCalendarIdentifier:locale:", v6, v5);

  }
  else
  {
    -[CSProminentDisplayViewController setAlternateCalendarIdentifier:locale:](self->_prominentDisplayViewController, "setAlternateCalendarIdentifier:locale:", 0, 0);
  }

}

- (void)_updateState
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MEMORY[0x18D773350](*a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_18AB69000, a2, OS_LOG_TYPE_DEBUG, "Date view controller disabled updates: %@", (uint8_t *)&v4, 0xCu);

}

- (void)_updateLegibilityStrength
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[SBFLockScreenDateViewController dateViewIfExists](self, "dateViewIfExists");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFLockScreenDateViewController legibilitySettings](self, "legibilitySettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "style");

  +[SBFLegibilityDomain rootSettings](SBFLegibilityDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeStrengthForStyle:", v4);
  objc_msgSend(v6, "setTimeLegibilityStrength:");
  objc_msgSend(v5, "dateStrengthForStyle:", v4);
  objc_msgSend(v6, "setSubtitleLegibilityStrength:");

}

- (void)_addObservers
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__updateFormat, *MEMORY[0x1E0D01188], 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__updateView, *MEMORY[0x1E0CEB3F0], 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__updateView, *MEMORY[0x1E0CEB050], 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleTimeZoneChange, *MEMORY[0x1E0C998A0], 0);
  +[SBFLegibilityDomain rootSettings](SBFLegibilityDomain, "rootSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addKeyObserver:", self);

}

- (void)_updateFormatIfEnabled
{
  if (!self->_disablesUpdates)
    -[SBFLockScreenDateViewController _updateFormat](self, "_updateFormat");
}

- (void)_updateFormat
{
  void *v3;

  -[SBFLockScreenDateViewController dateViewIfExists](self, "dateViewIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateFormat");

  -[SBFLockScreenDateViewController _updateView](self, "_updateView");
}

- (void)_handleTimeZoneChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SBFLockScreenDateViewController__handleTimeZoneChange__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __56__SBFLockScreenDateViewController__handleTimeZoneChange__block_invoke(uint64_t a1)
{
  NSObject *v2;

  SBLogDashBoard();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __56__SBFLockScreenDateViewController__handleTimeZoneChange__block_invoke_cold_1(v2);

  return objc_msgSend(*(id *)(a1 + 32), "updateTimeNow");
}

- (void)_stopUpdateTimer
{
  id timerToken;

  if (self->_timerToken)
  {
    -[SBFDateProviding removeMinuteUpdateHandler:](self->_dateProvider, "removeMinuteUpdateHandler:");
    timerToken = self->_timerToken;
    self->_timerToken = 0;

  }
}

- (BOOL)screenOff
{
  return self->_screenOff;
}

- (BOOL)isAlternateDateEnabled
{
  return self->_alternateDateEnabled;
}

- (BOOL)restrictsVibrancy
{
  return self->_restrictsVibrancy;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (SBFDateProviding)dateProvider
{
  return self->_dateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_prominentDisplayViewController, 0);
  objc_storeStrong((id *)&self->_alwaysOnDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_alwaysOnDefaults, 0);
  objc_storeStrong(&self->_minuteHandlerToken, 0);
  objc_storeStrong(&self->_timerToken, 0);
}

void __56__SBFLockScreenDateViewController__handleTimeZoneChange__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18AB69000, log, OS_LOG_TYPE_DEBUG, "DashBoard handling time zone change.", v1, 2u);
}

@end
