@implementation SBUIProudLockContainerViewController

- (SBUIProudLockContainerViewController)initWithAuthenticationInformationProvider:(id)a3
{
  id v4;
  SBUIProudLockContainerViewController *v5;
  SBUIProudLockContainerViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBUIProudLockContainerViewController;
  v5 = -[SBUIProudLockContainerViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SBUIProudLockContainerViewController setAuthenticationInformationProvider:](v5, "setAuthenticationInformationProvider:", v4);
    -[SBUIProudLockContainerViewController setScreenOn:](v6, "setScreenOn:", 1);
    -[SBUIProudLockContainerViewController setSuppressScanningState:](v6, "setSuppressScanningState:", 1);
    -[SBUIProudLockContainerViewController setSuppressNotLooking:](v6, "setSuppressNotLooking:", 0);
  }

  return v6;
}

- (void)loadView
{
  SBUIProudLockIconView *v3;

  v3 = objc_alloc_init(SBUIProudLockIconView);
  -[SBUIProudLockIconView bs_setHitTestingDisabled:](v3, "bs_setHitTestingDisabled:", 1);
  -[SBUIProudLockContainerViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  dispatch_time_t v3;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBUIProudLockContainerViewController;
  -[SBUIProudLockContainerViewController viewDidLoad](&v7, sel_viewDidLoad);
  objc_initWeak(&location, self);
  v3 = dispatch_time(0, 100000000);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__SBUIProudLockContainerViewController_viewDidLoad__block_invoke;
  v4[3] = &unk_1E4C3E538;
  objc_copyWeak(&v5, &location);
  dispatch_after(v3, MEMORY[0x1E0C80D38], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __51__SBUIProudLockContainerViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_msgSend(WeakRetained, "interfaceOrientation");
    objc_msgSend(v3, "_setCounterTransformForOrientation:", v2);
    objc_msgSend(v3, "_setLocalTransformForOrientation:", v2);
    WeakRetained = v3;
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBUIProudLockContainerViewController;
  -[SBUIProudLockContainerViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SBUIProudLockContainerViewController _updateIconViewStateAnimated:](self, "_updateIconViewStateAnimated:", 0);
  -[SBUIProudLockContainerViewController _startScanningStateTimer](self, "_startScanningStateTimer");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  objc_super v23;

  height = a3.height;
  width = a3.width;
  v23.receiver = self;
  v23.super_class = (Class)SBUIProudLockContainerViewController;
  v7 = a4;
  -[SBUIProudLockContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v23, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[SBUIProudLockContainerViewController _proudLockIconView](self, "_proudLockIconView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cameraCoveredView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIProudLockContainerViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 != v11)
  {
    objc_msgSend(v10, "superview");
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }
  if (v9)
    objc_msgSend(v9, "transform");
  else
    memset(&v21, 0, sizeof(v21));
  CGAffineTransformRotate(&v22, &v21, -1.0e-13);
  objc_msgSend(v9, "setTransform:", &v22);
  if (v9)
    objc_msgSend(v9, "localTransform");
  else
    memset(&v19, 0, sizeof(v19));
  CGAffineTransformRotate(&v20, &v19, 1.0e-13);
  objc_msgSend(v9, "setLocalTransform:", &v20);
  SBUIWindowForViewControllerTransition(v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "_toWindowOrientation");

  -[SBUIProudLockContainerViewController _setLocalTransformForOrientation:](self, "_setLocalTransformForOrientation:", v14);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __91__SBUIProudLockContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v16[3] = &unk_1E4C3F810;
  v17 = v10;
  v18 = v14;
  v16[4] = self;
  v15 = v10;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v16, 0);

}

uint64_t __91__SBUIProudLockContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setCounterTransformForOrientation:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_setCoachingCondition:animated:force:", objc_msgSend(*(id *)(a1 + 32), "_effectiveCoachingConditionForCondition:orientation:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 976), *(_QWORD *)(a1 + 48)), 1, 1);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setScreenOn:(BOOL)a3
{
  -[SBUIProudLockContainerViewController setScreenOn:fromUnlockSource:](self, "setScreenOn:fromUnlockSource:", a3, 0);
}

- (void)setScreenOn:(BOOL)a3 fromUnlockSource:(int)a4
{
  uint64_t v4;
  NSObject *v6;
  const __CFString *v7;
  _BOOL4 screenOn;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_screenOn != a3)
  {
    v4 = *(_QWORD *)&a4;
    self->_screenOn = a3;
    SBLogLockScreenBiometricFaceIDCoaching();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_screenOn)
        v7 = CFSTR("On");
      else
        v7 = CFSTR("Off");
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1A471F000, v6, OS_LOG_TYPE_DEFAULT, "Received: Screen  %{public}@", (uint8_t *)&v9, 0xCu);
    }

    screenOn = self->_screenOn;
    -[SBUIProudLockContainerViewController reset](self, "reset");
    if (screenOn)
    {
      self->_unlockSource = v4;
      if (!-[SBUIProudLockContainerViewController _isBiometricLockedOut](self, "_isBiometricLockedOut"))
      {
        -[SBUIProudLockContainerViewController _startScanningStateTimer](self, "_startScanningStateTimer");
        -[SBUIProudLockContainerViewController _allowCameraCoveredForUnlockSource:](self, "_allowCameraCoveredForUnlockSource:", v4);
      }
      -[SBUIProudLockContainerViewController _allowCoachingConditionImmediately:](self, "_allowCoachingConditionImmediately:", 0);
      -[SBUIProudLockContainerViewController _setCoachingCondition:animated:](self, "_setCoachingCondition:animated:", -[SBUIProudLockContainerViewController _effectiveCoachingConditionForCondition:](self, "_effectiveCoachingConditionForCondition:", self->_desiredCoachingCondition), 0);
    }
  }
}

- (void)setAuthenticated:(BOOL)a3
{
  -[SBUIProudLockContainerViewController setAuthenticated:completion:](self, "setAuthenticated:completion:", a3, 0);
}

- (void)setAuthenticated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v4 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (self->_authenticated == v4)
  {
    if (v6)
      (*((void (**)(id))v6 + 2))(v6);
  }
  else
  {
    self->_authenticated = v4;
    SBLogLockScreenBiometricFaceIDCoaching();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_authenticated)
        v9 = &stru_1E4C40DE8;
      else
        v9 = CFSTR("Not ");
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1A471F000, v8, OS_LOG_TYPE_DEFAULT, "Received:  %{public}@Authenticated", (uint8_t *)&v10, 0xCu);
    }

    -[SBUIProudLockContainerViewController setShouldShowScanningState:](self, "setShouldShowScanningState:", 0);
    objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__allowScanningState, 0);
    -[SBUIProudLockContainerViewController setCanShowScanningState:](self, "setCanShowScanningState:", 1);
    -[SBUIProudLockContainerViewController _clearCoachingCondition](self, "_clearCoachingCondition");
    -[SBUIProudLockContainerViewController _updateIconViewStateAnimated:force:completion:](self, "_updateIconViewStateAnimated:force:completion:", 1, 0, v7);
  }

}

- (void)setLegibilitySettings:(id)a3
{
  id v5;
  _UILegibilitySettings **p_legibilitySettings;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v5 = a3;
  p_legibilitySettings = &self->_legibilitySettings;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    SBLogLockScreenBiometricFaceIDCoaching();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A471F000, v7, OS_LOG_TYPE_INFO, "Updating Legibility Settings", v9, 2u);
    }

    -[SBUIProudLockContainerViewController _proudLockIconView](self, "_proudLockIconView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLegibilitySettings:", *p_legibilitySettings);

  }
}

- (void)setConfiguration:(id *)a3
{
  $8CE2474A269BB484035A622AF7E8BD8B *p_configuration;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  BOOL suppressFaceIDDisabledState;
  unint64_t substate;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  _OWORD v16[5];
  _OWORD v17[5];

  p_configuration = &self->_configuration;
  v6 = *(_OWORD *)&self->_configuration.durationToSuppressCameraCoveredWhenWakingWithSmartCover;
  v17[2] = *(_OWORD *)&self->_configuration.minimumDurationShowingCoaching;
  v17[3] = v6;
  v17[4] = *(_OWORD *)&self->_configuration.coachingDelaysUnlock;
  v7 = *(_OWORD *)&self->_configuration.bkCoachingHintsEnabled;
  v17[0] = *(_OWORD *)&self->_configuration.showScanningState;
  v17[1] = v7;
  v8 = *(_OWORD *)&a3->var7;
  v16[2] = *(_OWORD *)&a3->var5;
  v16[3] = v8;
  v16[4] = *(_OWORD *)&a3->var9;
  v9 = *(_OWORD *)&a3->var3;
  v16[0] = *(_OWORD *)&a3->var0;
  v16[1] = v9;
  if (!SBUIProudLockContainerViewControllerConfigurationEqualToConfiguration((double *)v17, (double *)v16))
  {
    suppressFaceIDDisabledState = p_configuration->suppressFaceIDDisabledState;
    substate = p_configuration->substate;
    *(_OWORD *)&p_configuration->showScanningState = *(_OWORD *)&a3->var0;
    v12 = *(_OWORD *)&a3->var9;
    v14 = *(_OWORD *)&a3->var3;
    v13 = *(_OWORD *)&a3->var5;
    *(_OWORD *)&p_configuration->durationToSuppressCameraCoveredWhenWakingWithSmartCover = *(_OWORD *)&a3->var7;
    *(_OWORD *)&p_configuration->coachingDelaysUnlock = v12;
    *(_OWORD *)&p_configuration->bkCoachingHintsEnabled = v14;
    *(_OWORD *)&p_configuration->minimumDurationShowingCoaching = v13;
    -[SBUIProudLockContainerViewController _proudLockIconView](self, "_proudLockIconView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDurationOnCameraCoveredGlyphBeforeCoaching:", p_configuration->durationOnCameraCoveredGlyphBeforeCoaching);

    if (suppressFaceIDDisabledState != p_configuration->suppressFaceIDDisabledState
      || substate != p_configuration->substate)
    {
      -[SBUIProudLockContainerViewController _updateIconViewStateAnimated:](self, "_updateIconViewStateAnimated:", 1);
    }
  }
}

- (UIView)cameraCoveredView
{
  void *v2;
  void *v3;

  -[SBUIProudLockContainerViewController _proudLockIconView](self, "_proudLockIconView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraCoveredView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)reset
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  SBLogLockScreenBiometricFaceIDCoaching();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A471F000, v3, OS_LOG_TYPE_DEFAULT, "==== Reset ====", buf, 2u);
  }

  self->_unlockSource = 0;
  self->_mostRecentCoachingFeedbackCondition = 1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__SBUIProudLockContainerViewController_reset__block_invoke;
  v4[3] = &unk_1E4C3E408;
  v4[4] = self;
  -[SBUIProudLockContainerViewController _performForcedUpdate:](self, "_performForcedUpdate:", v4);
}

uint64_t __45__SBUIProudLockContainerViewController_reset__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCanShowScanningState:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setShouldShowScanningState:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCanLeaveCoachingCondition:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_clearCoachingCondition");
  objc_msgSend(*(id *)(a1 + 32), "setCanShowCoachingCondition:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setHasSeenFaceSinceScreenOn:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCanShowCameraCovered:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_updateIconViewStateAnimated:force:completion:", 0, 1, 0);
}

- (void)updateLockForBiometricMatchFailure
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id buf[2];

  SBLogLockScreenBiometricFaceIDCoaching();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A471F000, v3, OS_LOG_TYPE_DEFAULT, "Received: Face ID Match Failure", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  -[SBUIProudLockContainerViewController setShouldShowScanningState:](self, "setShouldShowScanningState:", 0);
  -[SBUIProudLockContainerViewController setCanLeaveCoachingCondition:](self, "setCanLeaveCoachingCondition:", 1);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__SBUIProudLockContainerViewController_updateLockForBiometricMatchFailure__block_invoke;
  v4[3] = &unk_1E4C3E560;
  objc_copyWeak(&v5, buf);
  -[SBUIProudLockContainerViewController _setIconState:animated:options:force:completion:](self, "_setIconState:animated:options:force:completion:", 3, 1, 0, 0, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

void __74__SBUIProudLockContainerViewController_updateLockForBiometricMatchFailure__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(WeakRetained, "suppressNotLooking") & 1) != 0)
  {
    objc_msgSend(WeakRetained, "_setIconState:animated:", 1, 0);
  }
  else
  {
    objc_msgSend(WeakRetained, "setCanShowCoachingCondition:", 1);
    objc_msgSend(WeakRetained, "_setCoachingCondition:animated:", 9, 1);
  }

}

- (void)updateForScreenWillTurnOff
{
  NSObject *v2;
  uint8_t v3[16];

  SBLogLockScreenBiometricFaceIDCoaching();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A471F000, v2, OS_LOG_TYPE_DEFAULT, "Received: Screen Will Turn Off", v3, 2u);
  }

}

- (void)setSuppressNotLooking:(BOOL)a3
{
  int64_t desiredIconState;

  if (self->_suppressNotLooking != a3)
  {
    self->_suppressNotLooking = a3;
    if (a3)
    {
      desiredIconState = self->_desiredIconState;
      if (desiredIconState == 19 || desiredIconState == 16)
        -[SBUIProudLockContainerViewController _updateIconViewStateAnimated:](self, "_updateIconViewStateAnimated:", 1);
    }
  }
}

- (void)setSuppressAlongsideCoaching:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  _BOOL8 v8;
  id v9;

  if (self->_suppressAlongsideCoaching != a3)
  {
    self->_suppressAlongsideCoaching = a3;
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    v6 = (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1
      || (unint64_t)(objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation") - 5) < 0xFFFFFFFFFFFFFFFELL;
    -[SBUIProudLockContainerViewController _proudLockIconView](self, "_proudLockIconView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v8 = !self->_suppressAlongsideCoaching && v6;
    objc_msgSend(v7, "setAllowsAlongsideCoaching:", v8);

  }
}

- (void)setHasSeenFaceSinceScreenOn:(BOOL)a3
{
  if (self->_hasSeenFaceSinceScreenOn != a3)
  {
    self->_hasSeenFaceSinceScreenOn = a3;
    if (a3 && self->_configuration.bkCoachingHintsEnabled)
    {
      if (-[SBUIProudLockContainerViewController _isBiometricLockedOut](self, "_isBiometricLockedOut"))
        -[SBUIProudLockContainerViewController _setIconState:animated:](self, "_setIconState:animated:", 16, 1);
    }
  }
}

- (BOOL)isGuidanceTextVisible
{
  return SBUIProudLockIconViewStateShowsCoachingText(-[SBUIProudLockContainerViewController _actualIconState](self, "_actualIconState"));
}

- (void)handlePhoneUnlockWithWatchError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBUIProudLockContainerViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__SBUIProudLockContainerViewController_handlePhoneUnlockWithWatchError___block_invoke;
  v6[3] = &unk_1E4C3E6A0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __72__SBUIProudLockContainerViewController_handlePhoneUnlockWithWatchError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "code");
  +[SBUIPhoneUnlockWithWatchController sharedInstance](SBUIPhoneUnlockWithWatchController, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "showRawErrorCodes"))
  {
    objc_msgSend(v6, "setErrorCode:", v2);
    v3 = 11;
  }
  else
  {
    v3 = 10;
  }
  +[SBUIBiometricResource sharedInstance](SBUIBiometricResource, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "biometricLockoutState");

  if (!v5)
    objc_msgSend(*(id *)(a1 + 40), "_provideFeedbackForCoachingCondition:", v3);

}

- (void)handleBiometricEvent:(unint64_t)a3
{
  id v5;

  +[SBUIBiometricResource sharedInstance](SBUIBiometricResource, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasBiometricAuthenticationCapabilityEnabled"))
    -[SBUIProudLockContainerViewController _handleBiometricEvent:](self, "_handleBiometricEvent:", a3);

}

- (void)_handleBiometricEvent:(unint64_t)a3
{
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0x1BuLL:
      -[SBUIProudLockContainerViewController _updateIconViewStateAnimated:](self, "_updateIconViewStateAnimated:", 1);
      break;
    case 0xDuLL:
      -[SBUIProudLockContainerViewController _updateLockForFaceInView](self, "_updateLockForFaceInView");
      break;
    case 0xCuLL:
      +[SBUIBiometricResource sharedInstance](SBUIBiometricResource, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "hasPoseidonSupport");

      if ((v6 & 1) == 0)
        -[SBUIProudLockContainerViewController _updateLockForMatchStarted](self, "_updateLockForMatchStarted");
      break;
  }
  if (SBUIBiometricEventIsProvidingFeedback(a3))
    -[SBUIProudLockContainerViewController _provideFeedbackForCoachingCondition:](self, "_provideFeedbackForCoachingCondition:", SBUIFaceIDCoachingConditionForBiometricEvent(a3));
  if (a3 <= 0x21 && ((1 << a3) & 0x2070009E0) != 0)
  {
    SBLogLockScreenBiometricFaceIDCoaching();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSBUIBiometricEvent(a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1A471F000, v7, OS_LOG_TYPE_DEFAULT, "Received: Require Passcode -  %{public}@", (uint8_t *)&v9, 0xCu);

    }
    -[SBUIProudLockContainerViewController _updateIconViewStateAnimated:](self, "_updateIconViewStateAnimated:", 1);
  }
}

- (void)_provideFeedbackForCoachingCondition:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  SBLogLockScreenBiometricFaceIDCoaching();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    DebugStringForSBUIFaceIDCoachingCondition(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "Received: Coaching -  %{public}@", (uint8_t *)&v10, 0xCu);

  }
  self->_mostRecentCoachingFeedbackCondition = a3;
  v7 = -[SBUIProudLockContainerViewController _effectiveCoachingConditionForCondition:](self, "_effectiveCoachingConditionForCondition:", a3);
  if (v7 == 4 && !self->_canShowCameraCovered)
  {
    SBLogLockScreenBiometricFaceIDCoaching();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      DebugStringForSBUIFaceIDCoachingCondition(4uLL);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1A471F000, v8, OS_LOG_TYPE_DEFAULT, "Couldn't set coaching condition because it is currently suppressed -  %{public}@", (uint8_t *)&v10, 0xCu);

    }
  }
  else
  {
    -[SBUIProudLockContainerViewController _setCoachingCondition:animated:](self, "_setCoachingCondition:animated:", v7, 1);
  }
}

- (void)_updateLockForFaceInView
{
  NSObject *v3;
  _OWORD v4[5];

  SBLogLockScreenBiometricFaceIDCoaching();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v4[0]) = 0;
    _os_log_impl(&dword_1A471F000, v3, OS_LOG_TYPE_DEFAULT, "Received: Face In View", (uint8_t *)v4, 2u);
  }

  memset(v4, 0, sizeof(v4));
  -[SBUIProudLockContainerViewController configuration](self, "configuration");
  if (LOBYTE(v4[0]) && !-[SBUIProudLockContainerViewController _isBiometricLockedOut](self, "_isBiometricLockedOut"))
    -[SBUIProudLockContainerViewController setShouldShowScanningState:](self, "setShouldShowScanningState:", 1);
  -[SBUIProudLockContainerViewController setHasSeenFaceSinceScreenOn:](self, "setHasSeenFaceSinceScreenOn:", 1);
}

- (void)_updateLockForMatchStarted
{
  NSObject *v3;
  unint64_t desiredIconState;
  BOOL v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  SBLogLockScreenBiometricFaceIDCoaching();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1A471F000, v3, OS_LOG_TYPE_DEFAULT, "Received: Match Started", (uint8_t *)&v6, 2u);
  }

  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v6 = 0u;
  -[SBUIProudLockContainerViewController configuration](self, "configuration");
  if ((_BYTE)v6 && BYTE1(v6) && self->_unlockSource != 10)
  {
    self->_shouldShowScanningState = 0;
    -[SBUIProudLockContainerViewController setShouldShowScanningState:](self, "setShouldShowScanningState:", 1);
  }
  else if ((_BYTE)v7)
  {
    desiredIconState = self->_desiredIconState;
    v5 = desiredIconState == 1 || desiredIconState == 4;
    if (!v5 && (desiredIconState == 19 || (SBUIProudLockIconViewStateIsCoaching(desiredIconState) & 1) == 0))
      -[SBUIProudLockContainerViewController _setIconState:animated:](self, "_setIconState:animated:", 1, 1);
  }
}

- (double)proudLockLandscapeOffset
{
  void *v2;
  double v3;
  double v4;

  -[SBUIProudLockContainerViewController _proudLockIconView](self, "_proudLockIconView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proudLockLandscapeOffset");
  v4 = v3;

  return v4;
}

- (void)overrideProudLockIconViewLayoutWithSize:(CGSize)a3 offset:(CGPoint)a4 extent:(double)a5
{
  double y;
  double x;
  double height;
  double width;
  id v10;

  y = a4.y;
  x = a4.x;
  height = a3.height;
  width = a3.width;
  -[SBUIProudLockContainerViewController _proudLockIconView](self, "_proudLockIconView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOverrideSize:offset:extent:", width, height, x, y, a5);

}

- (BOOL)isPortrait
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SBUIProudLockContainerViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)(objc_msgSend(v3, "interfaceOrientation") - 1) < 2;

  return v4;
}

- (int64_t)orientation
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SBUIProudLockContainerViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "interfaceOrientation");

  return v4;
}

- (id)_proudLockIconView
{
  SBUIProudLockIconView *testProudLockIconView;

  testProudLockIconView = self->_testProudLockIconView;
  if (testProudLockIconView)
    return testProudLockIconView;
  -[SBUIProudLockContainerViewController view](self, "view");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)_actualIconState
{
  void *v2;
  int64_t v3;

  -[SBUIProudLockContainerViewController _proudLockIconView](self, "_proudLockIconView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");

  return v3;
}

- (BOOL)_isBiometricLockedOut
{
  void *v2;
  char v3;

  -[SBUIProudLockContainerViewController authenticationInformationProvider](self, "authenticationInformationProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBiometricLockedOut");

  return v3;
}

- (void)setUnlockCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id unlockCompletion;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  if (v4 && self->_unlockCompletion)
  {
    v5 = (void *)MEMORY[0x1A85A1798]();
    v6 = (void *)objc_msgSend(v4, "copy");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__SBUIProudLockContainerViewController_setUnlockCompletion___block_invoke;
    v13[3] = &unk_1E4C3F838;
    v14 = v5;
    v15 = v6;
    v7 = v6;
    v8 = v5;
    v9 = (void *)MEMORY[0x1A85A1798](v13);
    unlockCompletion = self->_unlockCompletion;
    self->_unlockCompletion = v9;

  }
  else
  {
    v11 = (void *)objc_msgSend(v4, "copy");
    v12 = self->_unlockCompletion;
    self->_unlockCompletion = v11;

  }
}

uint64_t __60__SBUIProudLockContainerViewController_setUnlockCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_setCounterTransformForOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[6];

  -[SBUIProudLockContainerViewController _proudLockIconView](self, "_proudLockIconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cameraCoveredView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIProudLockContainerViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v8)
  {
    objc_msgSend(v7, "superview");
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  v10 = SBUIFaceIDCameraOrientationForDevice();
  v11 = SBUIInterfaceOrientationForFaceIDCameraOrientation(v10);
  SBTransformFromOrientationToOrientation(v12, a3, v11);
  objc_msgSend(v6, "setTransform:", v12);
  objc_msgSend(v7, "setNeedsLayout");

}

- (void)_setLocalTransformForOrientation:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  CGFloat v7;
  CGAffineTransform *v8;
  CGAffineTransform *v9;
  _BYTE v10[48];
  _BYTE v11[48];
  CGAffineTransform v12;
  _BYTE v13[48];

  -[SBUIProudLockContainerViewController _proudLockIconView](self, "_proudLockIconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cameraCoveredView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = SBUIFaceIDCameraOrientationForDevice();
  switch(a3)
  {
    case 1:
      if (v6 == 2)
      {
        v7 = -1.57079633;
        v8 = (CGAffineTransform *)v13;
        v9 = (CGAffineTransform *)v13;
        goto LABEL_10;
      }
      break;
    case 2:
      if (v6 == 2)
      {
        v7 = 1.57079633;
        v8 = &v12;
        v9 = &v12;
        goto LABEL_10;
      }
      break;
    case 3:
      if (v6 == 1)
      {
        v7 = 1.57079633;
        v8 = (CGAffineTransform *)v10;
        v9 = (CGAffineTransform *)v10;
        goto LABEL_10;
      }
      break;
    case 4:
      if (v6 == 1)
      {
        v7 = -1.57079633;
        v8 = (CGAffineTransform *)v11;
        v9 = (CGAffineTransform *)v11;
LABEL_10:
        CGAffineTransformMakeRotation(v9, v7);
        objc_msgSend(v5, "setLocalTransform:", v8);
      }
      break;
    default:
      break;
  }

}

- (id)testProudLockIconView
{
  return self->_testProudLockIconView;
}

- (void)setTestProudLockIconView:(id)a3
{
  SBUIProudLockIconView *v5;
  SBUIProudLockIconView *v6;

  v5 = (SBUIProudLockIconView *)a3;
  if (self->_testProudLockIconView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_testProudLockIconView, a3);
    -[SBUIProudLockIconView setDurationOnCameraCoveredGlyphBeforeCoaching:](self->_testProudLockIconView, "setDurationOnCameraCoveredGlyphBeforeCoaching:", self->_configuration.durationOnCameraCoveredGlyphBeforeCoaching);
    v5 = v6;
  }

}

- (id)orientationProvider
{
  if (self->_orientationProvider)
    self = (SBUIProudLockContainerViewController *)self->_orientationProvider;
  return self;
}

- (void)setOrientationProvider:(id)a3
{
  SBUIProudLockContainerViewControllerOrientationProvider *v5;
  SBUIProudLockContainerViewControllerOrientationProvider *v6;

  v5 = (SBUIProudLockContainerViewControllerOrientationProvider *)a3;
  if (self->_orientationProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_orientationProvider, a3);
    v5 = v6;
  }

}

- (void)_updateIconViewStateAnimated:(BOOL)a3
{
  -[SBUIProudLockContainerViewController _updateIconViewStateAnimated:force:completion:](self, "_updateIconViewStateAnimated:force:completion:", a3, 0, 0);
}

- (void)_updateIconViewStateAnimated:(BOOL)a3 force:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  unint64_t desiredCoachingCondition;
  void *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  v10 = a5;
  desiredCoachingCondition = self->_desiredCoachingCondition;
  if (!SBUIFaceIDCoachingConditionShouldBeVisible(desiredCoachingCondition)
    || desiredCoachingCondition == 8 && self->_configuration.suppressFaceIDDisabledState)
  {
    -[SBUIProudLockContainerViewController _dontCallThis_showLockIfNeededAnimated:force:completion:](self, "_dontCallThis_showLockIfNeededAnimated:force:completion:", v6, v5, v10);
LABEL_7:
    v9 = v10;
    goto LABEL_8;
  }
  -[SBUIProudLockContainerViewController _dontCallThis_updateCoachingCondition:animated:](self, "_dontCallThis_updateCoachingCondition:animated:", desiredCoachingCondition, v6);
  v9 = v10;
  if (v10)
  {
    (*((void (**)(id))v10 + 2))(v10);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_dontCallThis_showLockIfNeededAnimated:(BOOL)a3 force:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = -[SBUIProudLockContainerViewController isAuthenticated](self, "isAuthenticated");
  -[SBUIProudLockContainerViewController authenticationInformationProvider](self, "authenticationInformationProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "hasPasscodeSet"))
  {
    if (v9)
    {
      -[SBUIProudLockContainerViewController setCanShowCoachingCondition:](self, "setCanShowCoachingCondition:", 0);
      v11 = 2;
    }
    else if (self->_desiredIconState == 3)
    {
      v11 = 3;
    }
    else if (self->_hasSeenFaceSinceScreenOn
           && self->_configuration.bkCoachingHintsEnabled
           && !self->_configuration.suppressFaceIDDisabledState
           && -[SBUIProudLockContainerViewController _isBiometricLockedOut](self, "_isBiometricLockedOut"))
    {
      v11 = 16;
    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v11 = 0;
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __96__SBUIProudLockContainerViewController__dontCallThis_showLockIfNeededAnimated_force_completion___block_invoke;
  v13[3] = &unk_1E4C3E4E8;
  v14 = v8;
  v12 = v8;
  -[SBUIProudLockContainerViewController _setIconState:animated:options:force:completion:](self, "_setIconState:animated:options:force:completion:", v11, v6, 0, v5, v13);

}

uint64_t __96__SBUIProudLockContainerViewController__dontCallThis_showLockIfNeededAnimated_force_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_dontCallThis_updateCoachingCondition:(unint64_t)a3 animated:(BOOL)a4
{
  void *v6;
  int v7;

  if (self->_canShowCoachingCondition && SBUIFaceIDCoachingConditionShouldBeVisible(a3))
  {
    if (a3 == 8)
    {
      if (self->_configuration.suppressFaceIDDisabledState)
        return;
    }
    else if (a3 == 4 && !self->_canShowCameraCovered)
    {
      return;
    }
    -[SBUIProudLockContainerViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "proudLockContainerViewControllerIsCoverSheetVisible:", self);

    if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 0xA || v7)
      -[SBUIProudLockContainerViewController _setIconState:animated:options:force:completion:](self, "_setIconState:animated:options:force:completion:", -[SBUIProudLockContainerViewController _iconViewStateForCoachingCondition:](self, "_iconViewStateForCoachingCondition:", a3), 1, 0, 0, &__block_literal_global_21);
  }
}

- (void)_setCoachingCondition:(unint64_t)a3 animated:(BOOL)a4
{
  -[SBUIProudLockContainerViewController _setCoachingCondition:animated:force:](self, "_setCoachingCondition:animated:force:", a3, a4, 0);
}

- (void)_setCoachingCondition:(unint64_t)a3 animated:(BOOL)a4 force:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  char v9;

  v5 = a5;
  v6 = a4;
  -[SBUIProudLockContainerViewController configuration](self, "configuration", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  -[SBUIProudLockContainerViewController _setCoachingCondition:animated:skipScanningState:force:](self, "_setCoachingCondition:animated:skipScanningState:force:", a3, v6, v9 == 0, v5);
}

- (void)_setCoachingCondition:(unint64_t)a3 animated:(BOOL)a4 skipScanningState:(BOOL)a5 force:(BOOL)a6
{
  unint64_t desiredCoachingCondition;
  int v9;
  _BOOL8 v10;
  int ShouldBeVisible;
  void *v13;
  SBUIProudLockContainerViewController *v14;
  uint64_t v15;
  char v16;
  id v17;

  desiredCoachingCondition = self->_desiredCoachingCondition;
  if (desiredCoachingCondition != a3 || a6)
  {
    v9 = a5;
    v10 = a4;
    if (SBUIFaceIDCoachingConditionShouldBeVisible(desiredCoachingCondition)
      && SBUIFaceIDCoachingConditionShouldBeVisible(a3))
    {
      -[SBUIProudLockContainerViewController _setCoachingCondition:animated:](self, "_setCoachingCondition:animated:", 1, 1);
    }
    self->_desiredCoachingCondition = a3;
    ShouldBeVisible = SBUIFaceIDCoachingConditionShouldBeVisible(a3);
    if (ShouldBeVisible)
    {
      SBUICoachingTextForSBUIFaceIDCoachingCondition(a3);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    -[SBUIProudLockContainerViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "proudLockContainerViewController:guidanceTextVisibilityDidChange:animated:", self, v17, v10);

    if (v10 & ~v9 || ((ShouldBeVisible ^ 1) & 1) != 0)
    {
      v14 = self;
      if (self->_desiredIconState == 5)
        v16 = 0;
      else
        v16 = ShouldBeVisible;
      if ((v16 & 1) != 0)
      {
        -[SBUIProudLockContainerViewController _setIconState:animated:](self, "_setIconState:animated:", 5, v10);
LABEL_22:

        return;
      }
      v15 = v10;
    }
    else
    {
      v14 = self;
      v15 = 1;
    }
    -[SBUIProudLockContainerViewController _updateIconViewStateAnimated:](v14, "_updateIconViewStateAnimated:", v15);
    goto LABEL_22;
  }
}

- (unint64_t)_effectiveCoachingConditionForCondition:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;

  -[SBUIProudLockContainerViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "interfaceOrientation");

  return -[SBUIProudLockContainerViewController _effectiveCoachingConditionForCondition:orientation:](self, "_effectiveCoachingConditionForCondition:orientation:", a3, v7);
}

- (unint64_t)_effectiveCoachingConditionForCondition:(unint64_t)a3 orientation:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  BOOL v12;

  +[SBUIBiometricResource sharedInstance](SBUIBiometricResource, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "hasBiometricAuthenticationCapabilityEnabled")
    || !objc_msgSend(v7, "isPearlDetectEnabled"))
  {
    a3 = 1;
    goto LABEL_25;
  }
  v8 = SBUIFaceIDCameraOrientationForDevice();
  if (v8 == 1)
  {
    v9 = 2;
  }
  else
  {
    if (v8 != 2)
    {
      SBUIFaceIDCoachingConditionShouldBeVisible(a3);
      goto LABEL_23;
    }
    v9 = 4;
  }
  if ((SBUIFaceIDCoachingConditionShouldBeVisible(a3) & 1) != 0 || v9 != a4)
  {
LABEL_23:
    if (a3 == 12)
      a3 = 1;
    goto LABEL_25;
  }
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2)
    {
      v10 = -[SBUIProudLockContainerViewController isAuthenticated](self, "isAuthenticated");
      if (a3 == 12)
        a3 = 1;
      if (v10)
        goto LABEL_25;
LABEL_21:
      a3 = 12;
      goto LABEL_25;
    }
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "userInterfaceIdiom") != 1)
  {

    goto LABEL_23;
  }
  v12 = -[SBUIProudLockContainerViewController isAuthenticated](self, "isAuthenticated");

  if (a3 == 12)
    a3 = 1;
  if (!v12)
    goto LABEL_21;
LABEL_25:

  return a3;
}

- (void)_clearCoachingCondition
{
  -[SBUIProudLockContainerViewController _setCoachingCondition:animated:](self, "_setCoachingCondition:animated:", 1, 1);
}

- (void)_setIconState:(int64_t)a3 animated:(BOOL)a4
{
  -[SBUIProudLockContainerViewController _setIconState:animated:options:force:completion:](self, "_setIconState:animated:options:force:completion:", a3, a4, 0, 0, 0);
}

- (void)_setIconState:(int64_t)a3 animated:(BOOL)a4 options:(int64_t)a5 force:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v9;
  void (**v12)(id, uint64_t);
  unint64_t v13;
  int IsCoaching;
  NSObject *v15;
  int64_t desiredIconState;
  int v17;
  BOOL v18;
  NSObject *v19;
  void *v20;
  void (**v21)(id, uint64_t);
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  uint64_t v27;
  void *v28;
  int64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  _QWORD v34[5];
  void (**v35)(id, uint64_t);
  char v36;
  char v37;
  uint8_t buf[4];
  unint64_t v39;
  __int16 v40;
  int64_t v41;
  __int16 v42;
  int64_t v43;
  uint64_t v44;

  v9 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v12 = (void (**)(id, uint64_t))a7;
  if (a6)
    goto LABEL_4;
  if (!-[SBUIProudLockContainerViewController _canTransitionToState:](self, "_canTransitionToState:", a3))
  {
    SBLogBiometricResource();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      NSStringForSBUIProudLockIconViewState(-[SBUIProudLockContainerViewController _actualIconState](self, "_actualIconState"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringForSBUIProudLockIconViewState(a3);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = (unint64_t)v31;
      v40 = 2114;
      v41 = (int64_t)v32;
      _os_log_impl(&dword_1A471F000, v30, OS_LOG_TYPE_DEFAULT, "Ignoring request to go from SBUIProudLockIconViewState %{public}@ to %{public}@", buf, 0x16u);

    }
    if (v12)
      v12[2](v12, 1);
    goto LABEL_27;
  }
  if (self->_forceCount)
LABEL_4:
    a5 |= 2uLL;
  v13 = -[SBUIProudLockContainerViewController _actualIconState](self, "_actualIconState");
  IsCoaching = SBUIProudLockIconViewStateIsCoaching(v13);
  SBLogBiometricResource();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    desiredIconState = self->_desiredIconState;
    *(_DWORD *)buf = 134218496;
    v39 = v13;
    v40 = 2048;
    v41 = desiredIconState;
    v42 = 2048;
    v43 = a3;
    _os_log_impl(&dword_1A471F000, v15, OS_LOG_TYPE_INFO, "actualIconState: %lu - _desiredIconState: %lu - toIconState: %lu", buf, 0x20u);
  }

  self->_desiredIconState = a3;
  v17 = SBUIProudLockIconViewStateIsCoaching(a3);
  v33 = IsCoaching & ~SBUIProudLockIconViewStateIsCoaching(self->_desiredIconState);
  if (!IsCoaching
    || ((unint64_t)(self->_desiredIconState - 1) >= 3 ? (v18 = v17 == 0) : (v18 = 0),
        v18 || self->_canLeaveCoachingCondition))
  {
    SBLogLockScreenBiometricFaceIDCoaching();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      NSStringForSBUIProudLockIconViewState(self->_desiredIconState);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = (unint64_t)v20;
      _os_log_impl(&dword_1A471F000, v19, OS_LOG_TYPE_DEFAULT, "=> Transitioning to state: %{public}@", buf, 0xCu);

    }
    v21 = v12;

    v22 = SBUIFaceIDCoachingConditionForSBUIProudLockIconViewState(self->_desiredIconState);
    SBUICoachingTextForSBUIFaceIDCoachingCondition(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIProudLockContainerViewController delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "transientSubtitleText");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v9;
    if (v25)
      v27 = objc_msgSend(v25, "isEqualToString:", v23) ^ 1;
    else
      v27 = 1;
    -[SBUIProudLockContainerViewController _proudLockIconView](self, "_proudLockIconView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = self->_desiredIconState;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __88__SBUIProudLockContainerViewController__setIconState_animated_options_force_completion___block_invoke;
    v34[3] = &unk_1E4C3F860;
    v34[4] = self;
    v35 = v21;
    v36 = v17;
    v37 = v33;
    objc_msgSend(v28, "setState:animated:updateText:options:completion:", v29, v26, v27, a5, v34);

    if (v17)
      goto LABEL_19;
  }
  else
  {
    v21 = v12;
    -[SBUIProudLockContainerViewController setUnlockCompletion:](self, "setUnlockCompletion:", v12);
    if (v17)
    {
LABEL_19:
      -[SBUIProudLockContainerViewController setCanLeaveCoachingCondition:](self, "setCanLeaveCoachingCondition:", 0);
      v12 = v21;
      goto LABEL_27;
    }
  }
  v12 = v21;
  if (v33)
    -[SBUIProudLockContainerViewController setCanShowCoachingCondition:](self, "setCanShowCoachingCondition:", 0);
LABEL_27:

}

uint64_t __88__SBUIProudLockContainerViewController__setIconState_animated_options_force_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    result = (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v5 + 968) == 2)
  {
    result = *(_QWORD *)(v5 + 1056);
    if (result)
    {
      (*(void (**)(uint64_t, uint64_t))(result + 16))(result, a2);
      result = objc_msgSend(*(id *)(a1 + 32), "setUnlockCompletion:", 0);
    }
  }
  if (*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "_allowLeavingCoachingCondition");
  if (*(_BYTE *)(a1 + 49))
    return objc_msgSend(*(id *)(a1 + 32), "_allowCoachingConditionImmediately:", 0);
  return result;
}

- (BOOL)_canTransitionToState:(int64_t)a3
{
  int64_t v5;
  int v6;
  unint64_t v7;
  int IsCoaching;
  int v9;
  char IsUpsideDown;
  int IsCameraCovered;

  if (!self->_screenOn)
    goto LABEL_23;
  v5 = -[SBUIProudLockContainerViewController _actualIconState](self, "_actualIconState");
  if (v5 == a3)
  {
LABEL_3:
    LOBYTE(v6) = 0;
    return v6;
  }
  v7 = v5;
  if (v5 != 16 || (LOBYTE(v6) = 0, a3 == 1) && self->_configuration.suppressFaceIDDisabledState)
  {
    IsCoaching = SBUIProudLockIconViewStateIsCoaching(v7);
    v9 = SBUIProudLockIconViewStateIsCoaching(a3);
    if ((SBUIProudLockIconViewStateIsUpsideDown(v7) & 1) != 0)
      IsUpsideDown = 1;
    else
      IsUpsideDown = SBUIProudLockIconViewStateIsUpsideDown(a3);
    IsCameraCovered = SBUIProudLockIconViewStateIsCameraCovered(v7);
    if (IsCameraCovered)
      IsCameraCovered = SBUIProudLockIconViewStateIsCameraCovered(a3);
    if ((IsUpsideDown & 1) == 0
      && ((unint64_t)a3 > 0x10 || ((1 << a3) & 0x1000E) == 0)
      && (IsCoaching ^ 1 | IsCameraCovered | v9) != 1)
    {
      goto LABEL_3;
    }
    if (v7 != 5)
    {
      if (v7 == 2)
      {
        if ((unint64_t)a3 < 0x11)
          return (0x10003u >> a3) & 1;
        goto LABEL_3;
      }
LABEL_23:
      LOBYTE(v6) = 1;
      return v6;
    }
    if ((unint64_t)(a3 - 2) < 3
      || a3 == 1 && -[SBUIProudLockContainerViewController _isBiometricLockedOut](self, "_isBiometricLockedOut"))
    {
      goto LABEL_23;
    }
    v6 = SBUIProudLockIconViewStateIsCoaching(a3);
    if (v6)
      goto LABEL_23;
  }
  return v6;
}

- (void)setCanShowScanningState:(BOOL)a3
{
  if (self->_canShowScanningState != a3)
  {
    self->_canShowScanningState = a3;
    -[SBUIProudLockContainerViewController _updateScanningState](self, "_updateScanningState");
  }
}

- (void)setShouldShowScanningState:(BOOL)a3
{
  if (self->_shouldShowScanningState != a3)
  {
    self->_shouldShowScanningState = a3;
    -[SBUIProudLockContainerViewController _updateScanningState](self, "_updateScanningState");
  }
}

- (void)setSuppressScanningState:(BOOL)a3
{
  NSObject *v4;
  _BOOL4 suppressScanningState;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_suppressScanningState != a3)
  {
    self->_suppressScanningState = a3;
    SBLogLockScreenBiometricFaceIDCoaching();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      suppressScanningState = self->_suppressScanningState;
      v6[0] = 67109120;
      v6[1] = suppressScanningState;
      _os_log_impl(&dword_1A471F000, v4, OS_LOG_TYPE_DEFAULT, "Received: Suppress Scanning State %{BOOL}d", (uint8_t *)v6, 8u);
    }

    -[SBUIProudLockContainerViewController _updateScanningState](self, "_updateScanningState");
  }
}

- (void)_updateScanningState
{
  if (self->_canShowScanningState
    && self->_shouldShowScanningState
    && !self->_suppressScanningState
    && self->_configuration.bkCoachingHintsEnabled)
  {
    -[SBUIProudLockContainerViewController _setIconState:animated:](self, "_setIconState:animated:", 5, 1);
  }
}

- (void)_startScanningStateTimer
{
  double v3;

  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__allowScanningState, 0);
  -[SBUIProudLockContainerViewController configuration](self, "configuration");
  -[SBUIProudLockContainerViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__allowScanningState, 0, v3);
}

- (void)_allowCoachingConditionImmediately:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  SBUIProudLockContainerViewController *v6;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__allowCoachingCondition, 0);
  if (-[SBUIProudLockContainerViewController canShowCoachingCondition](self, "canShowCoachingCondition"))
  {
    v5 = !v3;
    v6 = self;
LABEL_5:
    -[SBUIProudLockContainerViewController _reallyAllowCoachingConditionAnimated:](v6, "_reallyAllowCoachingConditionAnimated:", v5);
    return;
  }
  if (v3)
  {
    v6 = self;
    v5 = 0;
    goto LABEL_5;
  }
  -[SBUIProudLockContainerViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__allowCoachingCondition, 0, self->_configuration.minimumDurationBetweenLeavingCoachingAndCoaching);
}

- (void)_reallyAllowCoachingConditionAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[SBUIProudLockContainerViewController setCanShowCoachingCondition:](self, "setCanShowCoachingCondition:", 1);
  -[SBUIProudLockContainerViewController _updateIconViewStateAnimated:](self, "_updateIconViewStateAnimated:", v3);
}

- (void)_allowCameraCoveredForUnlockSource:(int)a3
{
  _BOOL4 v4;
  double *p_durationToSuppressCameraCoveredWhenWakingWithMagicKeyboard;
  double v6;

  if (a3 == 41)
  {
    v4 = SBUIFaceIDCameraOrientationForDevice() != 2;
    p_durationToSuppressCameraCoveredWhenWakingWithMagicKeyboard = &self->_configuration.durationToSuppressCameraCoveredWhenWakingWithMagicKeyboard;
    goto LABEL_5;
  }
  if (a3 == 3)
  {
    v4 = 0;
    p_durationToSuppressCameraCoveredWhenWakingWithMagicKeyboard = &self->_configuration.durationToSuppressCameraCoveredWhenWakingWithSmartCover;
LABEL_5:
    v6 = *p_durationToSuppressCameraCoveredWhenWakingWithMagicKeyboard;
    goto LABEL_7;
  }
  v4 = 1;
  v6 = 0.0;
LABEL_7:
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel___reallyAllowCameraCoveredReinstatingCoachingIfNecessary, 0);
  if (!-[SBUIProudLockContainerViewController canShowCameraCovered](self, "canShowCameraCovered"))
  {
    if (v4)
      -[SBUIProudLockContainerViewController _reallyAllowCameraCovered](self, "_reallyAllowCameraCovered");
    else
      -[SBUIProudLockContainerViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel___reallyAllowCameraCoveredReinstatingCoachingIfNecessary, 0, v6);
  }
}

- (void)_reallyAllowCameraCovered
{
  -[SBUIProudLockContainerViewController setCanShowCameraCovered:](self, "setCanShowCameraCovered:", 1);
  -[SBUIProudLockContainerViewController _updateIconViewStateAnimated:](self, "_updateIconViewStateAnimated:", 1);
}

- (void)__reallyAllowCameraCoveredReinstatingCoachingIfNecessary
{
  -[SBUIProudLockContainerViewController _reallyAllowCameraCovered](self, "_reallyAllowCameraCovered");
  if (self->_mostRecentCoachingFeedbackCondition == 4)
    -[SBUIProudLockContainerViewController _setCoachingCondition:animated:](self, "_setCoachingCondition:animated:", 4, 1);
}

- (void)_allowLeavingCoachingCondition
{
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__reallyAllowLeavingCoachingCondition, 0);
  -[SBUIProudLockContainerViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__reallyAllowLeavingCoachingCondition, 0, self->_configuration.minimumDurationShowingCoaching);
}

- (void)_reallyAllowLeavingCoachingCondition
{
  -[SBUIProudLockContainerViewController setCanLeaveCoachingCondition:](self, "setCanLeaveCoachingCondition:", 1);
  -[SBUIProudLockContainerViewController _updateIconViewStateAnimated:](self, "_updateIconViewStateAnimated:", 1);
}

- (void)setCanLeaveCoachingCondition:(BOOL)a3
{
  NSObject *v4;
  int64_t desiredIconState;
  unint64_t desiredCoachingCondition;
  BOOL v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_canLeaveCoachingCondition != a3)
  {
    self->_canLeaveCoachingCondition = a3;
    if (a3 && (SBUIProudLockIconViewStateIsCoaching(self->_desiredIconState) & 1) == 0)
    {
      SBLogBiometricResource();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        desiredIconState = self->_desiredIconState;
        v8[0] = 67109120;
        v8[1] = desiredIconState;
        _os_log_impl(&dword_1A471F000, v4, OS_LOG_TYPE_DEFAULT, "Desired icon state: %d isn't coaching, leaving coaching", (uint8_t *)v8, 8u);
      }

      desiredCoachingCondition = self->_desiredCoachingCondition;
      v7 = -[SBUIProudLockContainerViewController _isShowingCoachingCondition:](self, "_isShowingCoachingCondition:", desiredCoachingCondition);
      -[SBUIProudLockContainerViewController _clearCoachingCondition](self, "_clearCoachingCondition");
      if (!v7)
        -[SBUIProudLockContainerViewController _setCoachingCondition:animated:](self, "_setCoachingCondition:animated:", desiredCoachingCondition, 1);
    }
  }
}

- (void)_allowScanningState
{
  -[SBUIProudLockContainerViewController setCanShowScanningState:](self, "setCanShowScanningState:", 1);
}

- (void)_allowCoachingCondition
{
  -[SBUIProudLockContainerViewController _reallyAllowCoachingConditionAnimated:](self, "_reallyAllowCoachingConditionAnimated:", 1);
}

- (BOOL)_isShowingCoachingCondition:(unint64_t)a3
{
  int64_t v4;

  v4 = -[SBUIProudLockContainerViewController _iconViewStateForCoachingCondition:](self, "_iconViewStateForCoachingCondition:", a3);
  return v4 == -[SBUIProudLockContainerViewController _actualIconState](self, "_actualIconState");
}

- (int64_t)_iconViewStateForCoachingCondition:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v9;

  -[SBUIProudLockContainerViewController configuration](self, "configuration");
  v5 = v9;
  -[SBUIProudLockContainerViewController orientationProvider](self, "orientationProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "orientation");

  return SBUIProudLockIconViewStateForSBUIFaceIDCoachingCondition(a3, v7, v5);
}

- (void)_performForcedUpdate:(id)a3
{
  unint64_t forceCount;

  forceCount = self->_forceCount;
  self->_forceCount = forceCount + 1;
  if (a3)
  {
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    forceCount = self->_forceCount - 1;
  }
  self->_forceCount = forceCount;
}

- ($20D0CF0D87A8AD096D8C820DF2D4BB3C)configuration
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[14].var0;
  *(_OWORD *)&retstr->var5 = *(_OWORD *)&self[13].var9;
  *(_OWORD *)&retstr->var7 = v3;
  *(_OWORD *)&retstr->var9 = *(_OWORD *)&self[14].var3;
  v4 = *(_OWORD *)&self[13].var7;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[13].var5;
  *(_OWORD *)&retstr->var3 = v4;
  return self;
}

- (SBUIProudLockContainerViewControllerDelegate)delegate
{
  return (SBUIProudLockContainerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (BOOL)isScreenOn
{
  return self->_screenOn;
}

- (BOOL)suppressScanningState
{
  return self->_suppressScanningState;
}

- (BOOL)suppressNotLooking
{
  return self->_suppressNotLooking;
}

- (void)setGuidanceTextVisible:(BOOL)a3
{
  self->_guidanceTextVisible = a3;
}

- (BOOL)suppressAlongsideCoaching
{
  return self->_suppressAlongsideCoaching;
}

- (SBUIProudLockContainerViewControllerLockStatusProvider)authenticationInformationProvider
{
  return (SBUIProudLockContainerViewControllerLockStatusProvider *)objc_loadWeakRetained((id *)&self->_authenticationInformationProvider);
}

- (void)setAuthenticationInformationProvider:(id)a3
{
  objc_storeWeak((id *)&self->_authenticationInformationProvider, a3);
}

- (BOOL)canShowScanningState
{
  return self->_canShowScanningState;
}

- (BOOL)shouldShowScanningState
{
  return self->_shouldShowScanningState;
}

- (BOOL)canShowCoachingCondition
{
  return self->_canShowCoachingCondition;
}

- (void)setCanShowCoachingCondition:(BOOL)a3
{
  self->_canShowCoachingCondition = a3;
}

- (BOOL)canLeaveCoachingCondition
{
  return self->_canLeaveCoachingCondition;
}

- (BOOL)hasSeenFaceSinceScreenOn
{
  return self->_hasSeenFaceSinceScreenOn;
}

- (BOOL)canShowCameraCovered
{
  return self->_canShowCameraCovered;
}

- (void)setCanShowCameraCovered:(BOOL)a3
{
  self->_canShowCameraCovered = a3;
}

- (id)unlockCompletion
{
  return self->_unlockCompletion;
}

- (unint64_t)forceCount
{
  return self->_forceCount;
}

- (void)setForceCount:(unint64_t)a3
{
  self->_forceCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unlockCompletion, 0);
  objc_destroyWeak((id *)&self->_authenticationInformationProvider);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_orientationProvider, 0);
  objc_storeStrong((id *)&self->_testProudLockIconView, 0);
}

@end
