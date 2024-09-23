@implementation SBUIPasscodeLockViewBase

- (SBUIPasscodeLockViewBase)initWithFrame:(CGRect)a3
{
  SBUIPasscodeLockViewBase *v3;
  SBUIPasscodeLockViewBase *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIView *v13;
  UIView *passcodeAuthenticationView;
  SBUIPasscodeBiometricAuthenticationView *v15;
  SBUIPasscodeBiometricAuthenticationView *biometricAuthenticationView;
  uint64_t v17;
  _UIKBFeedbackGenerating *keyboardFeedbackBehavior;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  UINotificationFeedbackGenerator *authenticationFeedbackBehavior;
  void *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)SBUIPasscodeLockViewBase;
  v3 = -[SBUIPasscodeLockViewBase initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_isBiometricAuthenticationAllowed = 1;
    v3->_allowsAutomaticBiometricPresentationTransition = 1;
    v3->_biometricMatchingState = 0;
    -[SBUIPasscodeLockViewBase bounds](v3, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    passcodeAuthenticationView = v4->_passcodeAuthenticationView;
    v4->_passcodeAuthenticationView = v13;

    v15 = -[SBUIPasscodeBiometricAuthenticationView initWithFrame:layoutDelegate:]([SBUIPasscodeBiometricAuthenticationView alloc], "initWithFrame:layoutDelegate:", v4, v6, v8, v10, v12);
    biometricAuthenticationView = v4->_biometricAuthenticationView;
    v4->_biometricAuthenticationView = v15;

    -[SBUIPasscodeBiometricAuthenticationView setDelegate:](v4->_biometricAuthenticationView, "setDelegate:", v4);
    -[SBUIPasscodeBiometricAuthenticationView setAncillaryButtonsVisible:](v4->_biometricAuthenticationView, "setAncillaryButtonsVisible:", 1);
    -[SBUIPasscodeLockViewBase _setPasscodeLockViewState:animated:](v4, "_setPasscodeLockViewState:animated:", 1, 0);
    -[UIView setFrame:](v4->_passcodeAuthenticationView, "setFrame:", v6, v8, v10, v12);
    -[SBUIPasscodeLockViewBase addSubview:](v4, "addSubview:", v4->_passcodeAuthenticationView);
    -[SBUIPasscodeLockViewBase addSubview:](v4, "addSubview:", v4->_biometricAuthenticationView);
    objc_msgSend(MEMORY[0x1E0CEADA8], "feedbackGeneratorWithView:", v4);
    v17 = objc_claimAutoreleasedReturnValue();
    keyboardFeedbackBehavior = v4->_keyboardFeedbackBehavior;
    v4->_keyboardFeedbackBehavior = (_UIKBFeedbackGenerating *)v17;

    +[SBUIExternalPreferences sharedInstance](SBUIExternalPreferences, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeLockViewBase setPlaysKeypadSounds:](v4, "setPlaysKeypadSounds:", objc_msgSend(v19, "keyboardPlaysSounds"));

    -[SBUIPasscodeLockViewBase setShowsCancelButton:](v4, "setShowsCancelButton:", 1);
    -[SBUIPasscodeLockViewBase setShowsEmergencyCallButton:](v4, "setShowsEmergencyCallButton:", MGGetBoolAnswer());
    -[SBUIPasscodeLockViewBase setShowsStatusField:](v4, "setShowsStatusField:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x1E0CEBB78];
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v4, sel__noteScreenBrightnessDidChange, v21, v22);

    -[SBUIPasscodeLockViewBase _noteScreenBrightnessDidChange](v4, "_noteScreenBrightnessDidChange");
    v4->_allowsStatusTextUpdatingOnResignFirstResponder = 1;
    v4->_deviceHasBeenUnlockedOnceSinceBoot = 1;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E4C7AC38, &unk_1E4C7AC50, &unk_1E4C7AC68, &unk_1E4C7AC80, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_alloc(MEMORY[0x1E0CEA7D0]);
    objc_msgSend(MEMORY[0x1E0CEAE28], "privateConfigurationForTypes:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "initWithConfiguration:view:", v25, v4);
    authenticationFeedbackBehavior = v4->_authenticationFeedbackBehavior;
    v4->_authenticationFeedbackBehavior = (UINotificationFeedbackGenerator *)v26;

    v4->_shouldConsiderTapGuard = 1;
    +[SBUIPhoneUnlockWithWatchController sharedInstance](SBUIPhoneUnlockWithWatchController, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:", v4);

  }
  return v4;
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
  BOOL v11;
  double y;
  double width;
  double height;
  double x;
  double v16;
  double v17;
  double v18;
  double v19;
  int64_t passcodeLockViewState;
  CGFloat v21;
  CGFloat v22;
  SBUIProudLockContainerViewController *proudLockContainerViewController;
  id v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  -[SBUIPasscodeLockViewBase bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[SBUIPasscodeLockViewBase isTransitioning](self, "isTransitioning");
  y = v6;
  width = v8;
  height = v10;
  x = v4;
  v16 = v10;
  v17 = v8;
  v18 = v6;
  v19 = v4;
  if (!v11)
  {
    passcodeLockViewState = self->_passcodeLockViewState;
    if (passcodeLockViewState)
    {
      y = v6;
      width = v8;
      height = v10;
      x = v4;
      v16 = v10;
      v17 = v8;
      v18 = v6;
      v19 = v4;
      if (passcodeLockViewState == 1)
      {
        v25.origin.x = v4;
        v25.origin.y = v6;
        v25.size.width = v8;
        v25.size.height = v10;
        v21 = CGRectGetHeight(v25) * 0.5;
        v26.origin.x = v4;
        v26.origin.y = v6;
        v26.size.width = v8;
        v26.size.height = v10;
        v27 = CGRectOffset(v26, 0.0, v21);
        x = v27.origin.x;
        y = v27.origin.y;
        width = v27.size.width;
        height = v27.size.height;
        v16 = v10;
        v17 = v8;
        v18 = v6;
        v19 = v4;
      }
    }
    else
    {
      v28.origin.x = v4;
      v28.origin.y = v6;
      v28.size.width = v8;
      v28.size.height = v10;
      v22 = CGRectGetHeight(v28) * -0.5;
      v29.origin.x = v4;
      v29.origin.y = v6;
      v29.size.width = v8;
      v29.size.height = v10;
      *(CGRect *)&v19 = CGRectOffset(v29, 0.0, v22);
      y = v6;
      width = v8;
      height = v10;
      x = v4;
    }
  }
  -[UIView setFrame:](self->_passcodeAuthenticationView, "setFrame:", v19, v18, v17, v16);
  -[SBUIPasscodeBiometricAuthenticationView setFrame:](self->_biometricAuthenticationView, "setFrame:", x, y, width, height);
  proudLockContainerViewController = self->_proudLockContainerViewController;
  if (proudLockContainerViewController)
  {
    -[SBUIProudLockContainerViewController view](proudLockContainerViewController, "view");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFrame:", v4, v6, v8, v10);
    -[SBUIPasscodeLockViewBase bringSubviewToFront:](self, "bringSubviewToFront:", v24);

  }
}

- (NSString)unlockDestination
{
  return -[SBUIPasscodeBiometricAuthenticationView unlockDestination](self->_biometricAuthenticationView, "unlockDestination");
}

- (void)setUnlockDestination:(id)a3
{
  -[SBUIPasscodeBiometricAuthenticationView setUnlockDestination:](self->_biometricAuthenticationView, "setUnlockDestination:", a3);
}

- (void)setUsesBiometricPresentation:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v3 = a3;
  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = -[SBUIBiometricResource biometricLockoutState](self->_biometricResource, "biometricLockoutState");
  v6 = -[SBUIBiometricResource hasBiometricAuthenticationCapabilityEnabled](self->_biometricResource, "hasBiometricAuthenticationCapabilityEnabled");
  if (v5)
    v7 = 1;
  else
    v7 = !v3 || !v6;
  -[SBUIPasscodeLockViewBase _setPasscodeLockViewState:animated:](self, "_setPasscodeLockViewState:animated:", v7, 0);
  if ((_DWORD)v7 == 1 && v6 && v5 != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("SBUIPasscodeLockViewBiometricTransitionToPasscodeReasonKey");
    v13[0] = CFSTR("SBUIPasscodeLockViewBiometricTransitionToPasscodeReasonBioLockout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("SBUIPasscodeLockViewBiometricTransitionToPasscode"), self, v11);

  }
}

- (BOOL)showsEmergencyCallButton
{
  return -[SBUIPasscodeBiometricAuthenticationView showsEmergencyCallButton](self->_biometricAuthenticationView, "showsEmergencyCallButton");
}

- (void)setShowsEmergencyCallButton:(BOOL)a3
{
  -[SBUIPasscodeBiometricAuthenticationView setShowsEmergencyCallButton:](self->_biometricAuthenticationView, "setShowsEmergencyCallButton:", a3);
}

- (BOOL)showsCancelButton
{
  return -[SBUIPasscodeBiometricAuthenticationView showsCancelButton](self->_biometricAuthenticationView, "showsCancelButton");
}

- (void)setShowsCancelButton:(BOOL)a3
{
  -[SBUIPasscodeBiometricAuthenticationView setShowsCancelButton:](self->_biometricAuthenticationView, "setShowsCancelButton:", a3);
}

- (BOOL)biometricPresentationAncillaryButtonsVisible
{
  return -[SBUIPasscodeBiometricAuthenticationView ancillaryButtonsVisible](self->_biometricAuthenticationView, "ancillaryButtonsVisible");
}

- (void)setBiometricPresentationAncillaryButtonsVisible:(BOOL)a3
{
  -[SBUIPasscodeBiometricAuthenticationView setAncillaryButtonsVisible:](self->_biometricAuthenticationView, "setAncillaryButtonsVisible:", a3);
}

- (void)setShowsProudLock:(BOOL)a3
{
  unsigned int v4;
  SBUIProudLockContainerViewController *v5;
  SBUIProudLockContainerViewController *proudLockContainerViewController;
  SBUIProudLockContainerViewController *v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  void *v11;
  SBUIProudLockContainerViewController *v12;
  _OWORD v13[5];

  v4 = a3 & ~-[SBUIPasscodeLockViewBase _accountingForExternallyShownProudLock](self, "_accountingForExternallyShownProudLock");
  if (self->_showsProudLock != v4)
  {
    self->_showsProudLock = v4;
    if (v4 && -[SBUIPasscodeLockViewBase _supportsProudLock](self, "_supportsProudLock"))
    {
      v5 = -[SBUIProudLockContainerViewController initWithAuthenticationInformationProvider:]([SBUIProudLockContainerViewController alloc], "initWithAuthenticationInformationProvider:", self);
      proudLockContainerViewController = self->_proudLockContainerViewController;
      self->_proudLockContainerViewController = v5;

      v7 = self->_proudLockContainerViewController;
      v8 = *(_OWORD *)&self->_proudLockConfiguration.durationToSuppressCameraCoveredWhenWakingWithSmartCover;
      v13[2] = *(_OWORD *)&self->_proudLockConfiguration.minimumDurationShowingCoaching;
      v13[3] = v8;
      v13[4] = *(_OWORD *)&self->_proudLockConfiguration.coachingDelaysUnlock;
      v9 = *(_OWORD *)&self->_proudLockConfiguration.bkCoachingHintsEnabled;
      v13[0] = *(_OWORD *)&self->_proudLockConfiguration.showScanningState;
      v13[1] = v9;
      -[SBUIProudLockContainerViewController setConfiguration:](v7, "setConfiguration:", v13);
      -[SBUIProudLockContainerViewController setSuppressNotLooking:](self->_proudLockContainerViewController, "setSuppressNotLooking:", 1);
      -[SBUIProudLockContainerViewController view](self->_proudLockContainerViewController, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBUIPasscodeLockViewBase addSubview:](self, "addSubview:", v10);

      -[SBUIProudLockContainerViewController viewWillAppear:](self->_proudLockContainerViewController, "viewWillAppear:", 0);
    }
    else
    {
      -[SBUIProudLockContainerViewController viewDidDisappear:](self->_proudLockContainerViewController, "viewDidDisappear:", 0);
      -[SBUIProudLockContainerViewController view](self->_proudLockContainerViewController, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeFromSuperview");

      v12 = self->_proudLockContainerViewController;
      self->_proudLockContainerViewController = 0;

    }
  }
}

- (void)setPoseidonContainerView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_poseidonContainerView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_poseidonContainerView, a3);
    -[SBUIPasscodeLockViewBase addSubview:](self, "addSubview:", self->_poseidonContainerView);
    v5 = v6;
  }

}

- (void)setPoseidonContainerViewController:(id)a3
{
  SBUIPoseidonContainerViewController *v5;
  SBUIPoseidonContainerViewController **p_poseidonContainerViewController;
  SBUIPoseidonContainerViewController *v7;

  v5 = (SBUIPoseidonContainerViewController *)a3;
  p_poseidonContainerViewController = &self->_poseidonContainerViewController;
  if (self->_poseidonContainerViewController != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_poseidonContainerViewController, a3);
    -[SBUIPoseidonContainerViewController setAuthenticationInformationProvider:](*p_poseidonContainerViewController, "setAuthenticationInformationProvider:", self);
    -[SBUIPoseidonContainerViewController showCoaching:](*p_poseidonContainerViewController, "showCoaching:", 1);
    v5 = v7;
  }

}

- (BOOL)supportsPoseidonCoaching
{
  return -[SBUIBiometricResource hasPoseidonSupport](self->_biometricResource, "hasPoseidonSupport");
}

- (void)setOverrideProudLockContainerViewController:(id)a3
{
  SBUIProudLockContainerViewController *v5;
  SBUIProudLockContainerViewController **p_overrideProudLockContainerViewController;
  SBUIProudLockContainerViewController *overrideProudLockContainerViewController;
  SBUIProudLockContainerViewController *v8;

  v5 = (SBUIProudLockContainerViewController *)a3;
  p_overrideProudLockContainerViewController = &self->_overrideProudLockContainerViewController;
  overrideProudLockContainerViewController = self->_overrideProudLockContainerViewController;
  if (overrideProudLockContainerViewController != v5)
  {
    v8 = v5;
    -[SBUIProudLockContainerViewController setSuppressScanningState:](overrideProudLockContainerViewController, "setSuppressScanningState:", 1);
    -[SBUIProudLockContainerViewController setSuppressNotLooking:](*p_overrideProudLockContainerViewController, "setSuppressNotLooking:", 0);
    objc_storeStrong((id *)&self->_overrideProudLockContainerViewController, a3);
    -[SBUIProudLockContainerViewController setSuppressScanningState:](*p_overrideProudLockContainerViewController, "setSuppressScanningState:", 0);
    -[SBUIProudLockContainerViewController setSuppressNotLooking:](*p_overrideProudLockContainerViewController, "setSuppressNotLooking:", 1);
    if (!*p_overrideProudLockContainerViewController)
      self->_proudLockConfiguration.substate = 0;
    -[SBUIPasscodeLockViewBase _applyProudLockContainerViewControllerConfiguration](self, "_applyProudLockContainerViewControllerConfiguration");
    v5 = v8;
  }

}

- (void)setProudLockConfiguration:(id *)a3
{
  $8CE2474A269BB484035A622AF7E8BD8B *p_proudLockConfiguration;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[5];
  _OWORD v15[5];

  p_proudLockConfiguration = &self->_proudLockConfiguration;
  v6 = *(_OWORD *)&self->_proudLockConfiguration.durationToSuppressCameraCoveredWhenWakingWithSmartCover;
  v15[2] = *(_OWORD *)&self->_proudLockConfiguration.minimumDurationShowingCoaching;
  v15[3] = v6;
  v15[4] = *(_OWORD *)&self->_proudLockConfiguration.coachingDelaysUnlock;
  v7 = *(_OWORD *)&self->_proudLockConfiguration.bkCoachingHintsEnabled;
  v15[0] = *(_OWORD *)&self->_proudLockConfiguration.showScanningState;
  v15[1] = v7;
  v8 = *(_OWORD *)&a3->var7;
  v14[2] = *(_OWORD *)&a3->var5;
  v14[3] = v8;
  v14[4] = *(_OWORD *)&a3->var9;
  v9 = *(_OWORD *)&a3->var3;
  v14[0] = *(_OWORD *)&a3->var0;
  v14[1] = v9;
  if (!SBUIProudLockContainerViewControllerConfigurationEqualToConfiguration((double *)v15, (double *)v14))
  {
    v10 = *(_OWORD *)&a3->var3;
    v11 = *(_OWORD *)&a3->var5;
    v12 = *(_OWORD *)&a3->var7;
    *(_QWORD *)&p_proudLockConfiguration->coachingDelaysUnlock = *(_QWORD *)&a3->var9;
    v13 = *(_OWORD *)&a3->var0;
    *(_OWORD *)&p_proudLockConfiguration->minimumDurationShowingCoaching = v11;
    *(_OWORD *)&p_proudLockConfiguration->durationToSuppressCameraCoveredWhenWakingWithSmartCover = v12;
    *(_OWORD *)&p_proudLockConfiguration->showScanningState = v13;
    *(_OWORD *)&p_proudLockConfiguration->bkCoachingHintsEnabled = v10;
    p_proudLockConfiguration->suppressFaceIDDisabledState = 1;
    p_proudLockConfiguration->substate = 1;
    -[SBUIPasscodeLockViewBase _applyProudLockContainerViewControllerConfiguration](self, "_applyProudLockContainerViewControllerConfiguration");
  }
}

- (void)setShowsLockIconForFaceID:(BOOL)a3
{
  -[SBUIPasscodeBiometricAuthenticationView setShowsLockIconForFaceID:](self->_biometricAuthenticationView, "setShowsLockIconForFaceID:", a3);
}

- (void)setOverrideFaceIDReason:(id)a3
{
  -[SBUIPasscodeBiometricAuthenticationView setOverrideFaceIDReason:](self->_biometricAuthenticationView, "setOverrideFaceIDReason:", a3);
}

- (void)setOverridePasscodeButtonTitle:(id)a3
{
  -[SBUIPasscodeBiometricAuthenticationView setPasscodeButtonTitle:](self->_biometricAuthenticationView, "setPasscodeButtonTitle:", a3);
}

- (BOOL)canPeformBiometricAuthentication
{
  return !-[SBUIPasscodeLockViewBase isBiometricLockedOut](self, "isBiometricLockedOut")
      && -[SBUIBiometricResource hasBiometricAuthenticationCapabilityEnabled](self->_biometricResource, "hasBiometricAuthenticationCapabilityEnabled");
}

- (void)_applyProudLockContainerViewControllerConfiguration
{
  SBUIProudLockContainerViewController *proudLockContainerViewController;
  __int128 v4;
  __int128 v5;
  SBUIProudLockContainerViewController *overrideProudLockContainerViewController;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  proudLockContainerViewController = self->_proudLockContainerViewController;
  v4 = *(_OWORD *)&self->_proudLockConfiguration.durationToSuppressCameraCoveredWhenWakingWithSmartCover;
  v11 = *(_OWORD *)&self->_proudLockConfiguration.minimumDurationShowingCoaching;
  v12 = v4;
  v13 = *(_OWORD *)&self->_proudLockConfiguration.coachingDelaysUnlock;
  v5 = *(_OWORD *)&self->_proudLockConfiguration.bkCoachingHintsEnabled;
  v9 = *(_OWORD *)&self->_proudLockConfiguration.showScanningState;
  v10 = v5;
  -[SBUIProudLockContainerViewController setConfiguration:](proudLockContainerViewController, "setConfiguration:", &v9);
  overrideProudLockContainerViewController = self->_overrideProudLockContainerViewController;
  v7 = *(_OWORD *)&self->_proudLockConfiguration.durationToSuppressCameraCoveredWhenWakingWithSmartCover;
  v11 = *(_OWORD *)&self->_proudLockConfiguration.minimumDurationShowingCoaching;
  v12 = v7;
  v13 = *(_OWORD *)&self->_proudLockConfiguration.coachingDelaysUnlock;
  v8 = *(_OWORD *)&self->_proudLockConfiguration.bkCoachingHintsEnabled;
  v9 = *(_OWORD *)&self->_proudLockConfiguration.showScanningState;
  v10 = v8;
  -[SBUIProudLockContainerViewController setConfiguration:](overrideProudLockContainerViewController, "setConfiguration:", &v9);
}

- (BOOL)_supportsProudLock
{
  return -[SBUIBiometricResource hasPearlSupport](self->_biometricResource, "hasPearlSupport")
      || (MGGetBoolAnswer() & 1) != 0
      || -[SBUIBiometricResource hasPoseidonSupport](self->_biometricResource, "hasPoseidonSupport");
}

- (id)_proudLockContainerViewControllerToUpdate
{
  SBUIProudLockContainerViewController *overrideProudLockContainerViewController;

  overrideProudLockContainerViewController = self->_overrideProudLockContainerViewController;
  if (!overrideProudLockContainerViewController)
    overrideProudLockContainerViewController = self->_proudLockContainerViewController;
  return overrideProudLockContainerViewController;
}

- (void)setPasscodeLockViewState:(int64_t)a3
{
  -[SBUIPasscodeLockViewBase setPasscodeLockViewState:animated:](self, "setPasscodeLockViewState:animated:", a3, 1);
}

- (void)_setPasscodeLockViewState:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  double v10;
  double v11;
  int64_t passcodeLockViewState;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  BOOL v20;
  uint8_t buf[4];
  __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_passcodeLockViewState != a3)
  {
    v4 = a4;
    self->_passcodeLockViewState = a3;
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("SBUIPasscodeLockViewStateBiometric");
      if (a3 == 1)
        v8 = CFSTR("SBUIPasscodeLockViewStatePasscode");
      v9 = v8;
      *(_DWORD *)buf = 138412290;
      v22 = v9;
      _os_log_impl(&dword_1A471F000, v7, OS_LOG_TYPE_DEFAULT, "Setting passcode lock view state to: %@", buf, 0xCu);

    }
    if (v4)
      v10 = 0.3;
    else
      v10 = 0.0;
    if (v4)
      v11 = 0.57;
    else
      v11 = 0.0;
    -[SBUIPasscodeLockViewBase setNeedsLayout](self, "setNeedsLayout");
    passcodeLockViewState = self->_passcodeLockViewState;
    if (passcodeLockViewState)
    {
      if (passcodeLockViewState == 1)
      {
        -[SBUIPasscodeLockViewBase willTransitionToPasscodeView](self, "willTransitionToPasscodeView");
        v13 = MEMORY[0x1E0C809B0];
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __63__SBUIPasscodeLockViewBase__setPasscodeLockViewState_animated___block_invoke;
        v19[3] = &unk_1E4C3E430;
        v19[4] = self;
        v20 = v4;
        objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 2, v19, 0, v10, 0.0);
        v18[0] = v13;
        v18[1] = 3221225472;
        v18[2] = __63__SBUIPasscodeLockViewBase__setPasscodeLockViewState_animated___block_invoke_2;
        v18[3] = &unk_1E4C3E408;
        v18[4] = self;
        objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 6, v18, 0, v11, 0.0, 0.97, 0.0);
      }
    }
    else
    {
      v14 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __63__SBUIPasscodeLockViewBase__setPasscodeLockViewState_animated___block_invoke_3;
      v17[3] = &unk_1E4C3E408;
      v17[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v17, &__block_literal_global_0, v10, 0.0);
      v16[0] = v14;
      v16[1] = 3221225472;
      v16[2] = __63__SBUIPasscodeLockViewBase__setPasscodeLockViewState_animated___block_invoke_5;
      v16[3] = &unk_1E4C3E408;
      v16[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v16, 0, v11, 0.0, 0.97, 0.0);
      if (-[SBUIBiometricResource hasPearlSupport](self->_biometricResource, "hasPearlSupport"))
        -[SBUIPasscodeLockViewBase _armAdvanceToPasscodeTimer](self, "_armAdvanceToPasscodeTimer");
    }
    -[SBUIPasscodeLockViewBase delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v15, "passcodeLockViewStateChange:", self);

  }
}

uint64_t __63__SBUIPasscodeLockViewBase__setPasscodeLockViewState_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "_updateBiometricAlpha");
  return objc_msgSend(*(id *)(a1 + 32), "updateForTransitionToPasscodeView:animated:", 1, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __63__SBUIPasscodeLockViewBase__setPasscodeLockViewState_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __63__SBUIPasscodeLockViewBase__setPasscodeLockViewState_animated___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "_updateBiometricAlpha");
  return objc_msgSend(*(id *)(a1 + 32), "updateForTransitionToPasscodeView:animated:", 0, 0);
}

uint64_t __63__SBUIPasscodeLockViewBase__setPasscodeLockViewState_animated___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)noteBottomFaceHasBeenOccluded
{
  void *v3;
  char v4;

  if (!-[SBUIPasscodeLockViewBase _setAuthenticationViewTypeToFaceIDWithWatch](self, "_setAuthenticationViewTypeToFaceIDWithWatch"))
  {
    +[SBUIPeriocularController sharedInstance](SBUIPeriocularController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "periocularEnabled");

    if ((v4 & 1) == 0)
      -[SBUIPasscodeLockViewBase _advanceToPasscodeForMatchFailure:](self, "_advanceToPasscodeForMatchFailure:", 1);
  }
}

- (BOOL)_setAuthenticationViewTypeToFaceIDWithWatch
{
  void *v3;
  NSObject *v4;
  BOOL v5;
  uint8_t v7[16];

  +[SBUIPhoneUnlockWithWatchController sharedInstance](SBUIPhoneUnlockWithWatchController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "phoneUnlockWithWatchEnabled")
    && objc_msgSend(v3, "didDetectFaceRequirementsForPAU"))
  {
    -[SBUIPasscodeBiometricAuthenticationView setType:](self->_biometricAuthenticationView, "setType:", 3);
    SBLogPhoneUnlockWithWatch();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A471F000, v4, OS_LOG_TYPE_DEFAULT, "Passcode authentication view type set to FaceID with watch", v7, 2u);
    }

    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isBiometricLockedOut
{
  void *v2;
  BOOL v3;

  -[SBUIPasscodeLockViewBase biometricResource](self, "biometricResource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "biometricLockoutState") != 0;

  return v3;
}

- (BOOL)hasPasscodeSet
{
  return 1;
}

- (BOOL)hasBiometricAuthenticationCapabilityEnabled
{
  void *v2;
  char v3;

  -[SBUIPasscodeLockViewBase biometricResource](self, "biometricResource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasBiometricAuthenticationCapabilityEnabled");

  return v3;
}

- (void)beginTransitionToState:(int64_t)a3
{
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  int64_t passcodeLockViewState;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  __int128 buf;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[SBUIPasscodeLockViewBase isTransitioning](self, "isTransitioning"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIPasscodeLockViewBase.m"), 582, CFSTR("We cannot begin a passcode transition while we already have one in progress."));

  }
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("SBUIPasscodeLockViewStateBiometric");
    if (a3 == 1)
      v7 = CFSTR("SBUIPasscodeLockViewStatePasscode");
    v8 = v7;
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1A471F000, v6, OS_LOG_TYPE_DEFAULT, "Passcode lock view beginning transition to state: %@", (uint8_t *)&buf, 0xCu);

  }
  passcodeLockViewState = self->_passcodeLockViewState;
  *(_QWORD *)&buf = passcodeLockViewState;
  *((_QWORD *)&buf + 1) = a3;
  v15 = 0;
  -[SBUIPasscodeLockViewBase setTransitionContext:](self, "setTransitionContext:", &buf);
  -[SBUIPasscodeLockViewBase setIsTransitioning:](self, "setIsTransitioning:", 1);
  v10 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__SBUIPasscodeLockViewBase_beginTransitionToState___block_invoke;
  v13[3] = &unk_1E4C3E408;
  v13[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v13);
  if (!a3 && passcodeLockViewState == 1)
  {
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __51__SBUIPasscodeLockViewBase_beginTransitionToState___block_invoke_2;
    v12[3] = &unk_1E4C3E408;
    v12[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v12, 0, 0.57, 0.0, 0.97, 0.0);
    -[SBUIPasscodeLockViewBase updateForTransitionToPasscodeView:animated:](self, "updateForTransitionToPasscodeView:animated:", 0, 1);
  }
}

uint64_t __51__SBUIPasscodeLockViewBase_beginTransitionToState___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "setAlpha:", 1.0);
}

uint64_t __51__SBUIPasscodeLockViewBase_beginTransitionToState___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "setAlpha:", 0.0);
}

- (void)updateTransitionWithProgress:(double)a3
{
  __int128 v5;
  double v6;
  __int128 v7;
  double v8;

  v7 = 0uLL;
  v8 = 0.0;
  -[SBUIPasscodeLockViewBase transitionContext](self, "transitionContext");
  v8 = a3;
  v5 = v7;
  v6 = a3;
  -[SBUIPasscodeLockViewBase setTransitionContext:](self, "setTransitionContext:", &v5);
  -[SBUIPasscodeLockViewBase _updateBiometricAlpha](self, "_updateBiometricAlpha");
}

- (void)willEndTransitionToState:(int64_t)a3
{
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v7 = 0uLL;
  v8 = 0;
  -[SBUIPasscodeLockViewBase transitionContext](self, "transitionContext");
  *((_QWORD *)&v7 + 1) = a3;
  v5 = v7;
  v6 = v8;
  -[SBUIPasscodeLockViewBase setTransitionContext:](self, "setTransitionContext:", &v5);
}

- (void)didEndTransitionToState:(int64_t)a3
{
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  _QWORD v8[5];
  __int128 buf;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("SBUIPasscodeLockViewStateBiometric");
    if (a3 == 1)
      v6 = CFSTR("SBUIPasscodeLockViewStatePasscode");
    v7 = v6;
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "Passcode lock view did end transition to state: %@", (uint8_t *)&buf, 0xCu);

  }
  buf = 0uLL;
  v10 = 0;
  -[SBUIPasscodeLockViewBase transitionContext](self, "transitionContext");
  if (a3 == 1 && (_QWORD)buf == 1)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52__SBUIPasscodeLockViewBase_didEndTransitionToState___block_invoke;
    v8[3] = &unk_1E4C3E408;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v8);
    -[SBUIPasscodeLockViewBase updateForTransitionToPasscodeView:animated:](self, "updateForTransitionToPasscodeView:animated:", 1, 1);
  }
  -[SBUIPasscodeLockViewBase setIsTransitioning:](self, "setIsTransitioning:", 0);
  -[SBUIPasscodeLockViewBase _setPasscodeLockViewState:animated:](self, "_setPasscodeLockViewState:animated:", a3, 0);
}

uint64_t __52__SBUIPasscodeLockViewBase_didEndTransitionToState___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "setAlpha:", 1.0);
}

- (void)_updateBiometricAlpha
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;

  -[SBUIPasscodeLockViewBase _biometricViewAlphaFromPasscodeLockViewState:](self, "_biometricViewAlphaFromPasscodeLockViewState:", self->_passcodeLockViewState);
  v4 = v3;
  if (-[SBUIPasscodeLockViewBase isTransitioning](self, "isTransitioning"))
  {
    -[SBUIPasscodeLockViewBase transitionContext](self, "transitionContext");
    -[SBUIPasscodeLockViewBase _biometricViewAlphaFromPasscodeLockViewState:](self, "_biometricViewAlphaFromPasscodeLockViewState:", 0);
    v6 = v5;
    -[SBUIPasscodeLockViewBase _biometricViewAlphaFromPasscodeLockViewState:](self, "_biometricViewAlphaFromPasscodeLockViewState:", 0);
    v4 = v6 + 0.0 * (v7 - v6);
  }
  -[SBUIPasscodeLockViewBase biometricAuthenticationView](self, "biometricAuthenticationView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v4);

}

- (double)_biometricViewAlphaFromPasscodeLockViewState:(int64_t)a3
{
  double result;

  result = 0.0;
  if (!a3)
    return 1.0;
  return result;
}

- (void)setAllowsAutomaticBiometricPresentationTransition:(BOOL)a3
{
  if (self->_allowsAutomaticBiometricPresentationTransition != a3)
  {
    self->_allowsAutomaticBiometricPresentationTransition = a3;
    if (!self->_passcodeLockViewState)
    {
      if (a3)
      {
        -[SBUIPasscodeLockViewBase _armAdvanceToPasscodeTimer](self, "_armAdvanceToPasscodeTimer");
        self->_proudLockConfiguration.substate = 2;
        -[SBUIPasscodeLockViewBase _applyProudLockContainerViewControllerConfiguration](self, "_applyProudLockContainerViewControllerConfiguration");
      }
      else
      {
        -[SBUIPasscodeLockViewBase _disarmAdvanceToPasscodeTimer](self, "_disarmAdvanceToPasscodeTimer");
      }
    }
  }
}

- (void)_armAdvanceToPasscodeTimer
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A471F000, v3, OS_LOG_TYPE_DEFAULT, "Passcode lock view armed advance to passcode timer", v4, 2u);
  }

  -[SBUIPasscodeLockViewBase _disarmAdvanceToPasscodeTimer](self, "_disarmAdvanceToPasscodeTimer");
  -[SBUIPasscodeLockViewBase performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__advanceToPasscodeTimerFired, 0, 2.0);
}

- (void)_disarmAdvanceToPasscodeTimer
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__advanceToPasscodeTimerFired, 0);
}

- (void)_advanceToPasscodeTimerFired
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[8];
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[SBUIPasscodeLockViewBase unlockDestination](self, "unlockDestination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("SBUIPasscodeLockViewBiometricTransitionToPasscodeReasonKey");
    v9[0] = CFSTR("SBUIPasscodeLockViewBiometricTransitionToPasscodeReasonTimerExpired");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("SBUIPasscodeLockViewBiometricTransitionToPasscode"), self, v5);

  }
  -[SBUIPasscodeLockViewBase _advanceToPasscodeForMatchFailure:](self, "_advanceToPasscodeForMatchFailure:", 0);
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A471F000, v6, OS_LOG_TYPE_DEFAULT, "Passcode lock view advance to passcode timer fired.", v7, 2u);
  }

}

- (void)_advanceToPasscodeForMatchFailure:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  BOOL v7;
  int v8;
  void *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "Passcode lock view advanced to passcode for match failure: %@", (uint8_t *)&v8, 0xCu);

  }
  -[SBUIPasscodeLockViewBase _disarmAdvanceToPasscodeTimer](self, "_disarmAdvanceToPasscodeTimer");
  if (v3)
  {
    -[SBUIPasscodeLockViewBase _setStatusStateSwipeToRetryAnimated:](self, "_setStatusStateSwipeToRetryAnimated:", 0);
    -[SBUIPasscodeLockViewBase _setSuppressTitleText:animated:](self, "_setSuppressTitleText:animated:", 0, 0);
    -[SBUIPasscodeLockViewBase layoutIfNeeded](self, "layoutIfNeeded");
  }
  if (!-[SBUIPasscodeLockViewBase confirmedNotInPocket](self, "confirmedNotInPocket")
    && (self->_shouldConsiderTapGuard ? (v7 = !v3) : (v7 = 0), v7)
    || self->_alwaysShowPasscodeButtonForFaceIDMatchFailure)
  {
    -[SBUIPasscodeBiometricAuthenticationView setAncillaryButtonsVisible:](self->_biometricAuthenticationView, "setAncillaryButtonsVisible:", 1);
    -[SBUIPasscodeBiometricAuthenticationView setFaceIDUsePasscodeButtonVisible:](self->_biometricAuthenticationView, "setFaceIDUsePasscodeButtonVisible:", 1);
  }
  else
  {
    -[SBUIPasscodeBiometricAuthenticationView setAncillaryButtonsVisible:](self->_biometricAuthenticationView, "setAncillaryButtonsVisible:", 0);
    -[SBUIPasscodeBiometricAuthenticationView setFaceIDUsePasscodeButtonVisible:](self->_biometricAuthenticationView, "setFaceIDUsePasscodeButtonVisible:", 0);
    -[SBUIPasscodeLockViewBase _setPasscodeLockViewState:animated:](self, "_setPasscodeLockViewState:animated:", 1, 1);
  }
  self->_proudLockConfiguration.substate = 3;
  -[SBUIPasscodeLockViewBase _applyProudLockContainerViewControllerConfiguration](self, "_applyProudLockContainerViewControllerConfiguration");
  self->_shouldConsiderTapGuard = 0;
}

- (void)updateForTransitionToPasscodeView:(BOOL)a3 animated:(BOOL)a4
{
  void *v5;
  _BOOL8 v6;

  -[SBUIPasscodeLockViewBase window](self, "window", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  -[SBUIPasscodeLockViewBase _overrideBiometricMatchingEnabled:forReason:](self, "_overrideBiometricMatchingEnabled:forReason:", v6, CFSTR("PasscodeLockViewTransitionToPasscode"));
  -[SBUIPasscodeLockViewBase becomeFirstResponder](self, "becomeFirstResponder");
  -[SBUIPasscodeLockViewBase _overrideBiometricMatchingEnabled:forReason:](self, "_overrideBiometricMatchingEnabled:forReason:", 0, CFSTR("PasscodeLockViewTransitionToPasscode"));
}

- (void)willMoveToSuperview:(id)a3
{
  _BOOL4 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBUIPasscodeLockViewBase;
  -[SBUIPasscodeLockViewBase willMoveToSuperview:](&v6, sel_willMoveToSuperview_);
  if (a3)
  {
    v5 = -[SBUIPasscodeLockViewBase _proudLockShowingBiometricStates](self, "_proudLockShowingBiometricStates");
    if (-[SBUIBiometricResource hasPearlSupport](self->_biometricResource, "hasPearlSupport")
      && -[SBUIBiometricResource hasBiometricAuthenticationCapabilityEnabled](self->_biometricResource, "hasBiometricAuthenticationCapabilityEnabled")&& (v5 & -[SBUIBiometricResource isMatchingEnabled](self->_biometricResource, "isMatchingEnabled")) == 1)
    {
      -[SBUIPasscodeLockViewBase _setSuppressTitleText:animated:](self, "_setSuppressTitleText:animated:", 1, 0);
    }
    -[SBUIPasscodeLockViewBase updateStatusTextAnimated:](self, "updateStatusTextAnimated:", 0);
  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[SBUIBiometricResource removeObserver:](self->_biometricResource, "removeObserver:", self);
  -[SBUIPasscodeLockViewBase _clearBrightnessChangeTimer](self, "_clearBrightnessChangeTimer");
  -[SBUIPasscodeLockViewBase _setBiometricMatchingState:](self, "_setBiometricMatchingState:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[SBFLegibilitySettingsProvider setDelegate:](self->_backgroundLegibilitySettingsProvider, "setDelegate:", 0);
  if (-[_UIKBFeedbackGenerating isActive](self->_keyboardFeedbackBehavior, "isActive"))
    -[_UIKBFeedbackGenerating deactivate](self->_keyboardFeedbackBehavior, "deactivate");
  -[SBUIPasscodeLockViewBase setOverrideProudLockContainerViewController:](self, "setOverrideProudLockContainerViewController:", 0);
  +[SBUIPhoneUnlockWithWatchController sharedInstance](SBUIPhoneUnlockWithWatchController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)SBUIPasscodeLockViewBase;
  -[SBUIPasscodeLockViewBase dealloc](&v5, sel_dealloc);
}

- (void)resetForFailedPasscode
{
  -[SBUIPasscodeLockViewBase _resetForFailedPasscode:](self, "_resetForFailedPasscode:", 1);
}

- (void)resetForScreenOff
{
  if (-[SBUIPasscodeLockViewBase _statusState](self, "_statusState") == 8)
    -[SBUIPasscodeLockViewBase _setStatusState:](self, "_setStatusState:", 0);
}

- (void)resetForSuccess
{
  void *v3;

  -[SBUIPasscodeLockViewBase reset](self, "reset");
  -[SBUIPasscodeLockViewBase _proudLockContainerViewControllerToUpdate](self, "_proudLockContainerViewControllerToUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAuthenticated:", 1);

  -[SBUIPoseidonContainerViewController showCoaching:](self->_poseidonContainerViewController, "showCoaching:", 0);
}

- (void)reset
{
  -[SBUIPasscodeEntryField reset](self->_entryField, "reset");
}

- (void)setAllowsStatusTextUpdatingOnResignFirstResponder:(BOOL)a3
{
  self->_allowsStatusTextUpdatingOnResignFirstResponder = a3;
}

- (NSString)passcode
{
  return 0;
}

- (void)setBiometricResource:(id)a3
{
  SBUIBiometricResource *v5;
  SBUIBiometricResource **p_biometricResource;
  SBUIBiometricResource *biometricResource;
  SBUIBiometricResource *v8;

  v5 = (SBUIBiometricResource *)a3;
  p_biometricResource = &self->_biometricResource;
  biometricResource = self->_biometricResource;
  v8 = v5;
  if (biometricResource != v5)
  {
    -[SBUIBiometricResource removeObserver:](biometricResource, "removeObserver:", self);
    objc_storeStrong((id *)&self->_biometricResource, a3);
    -[SBUIBiometricResource addObserver:](*p_biometricResource, "addObserver:", self);
    if (*p_biometricResource)
    {
      -[SBUIPasscodeLockViewBase _updateStatusStateForLockoutIfNecessaryAnimatedly:](self, "_updateStatusStateForLockoutIfNecessaryAnimatedly:", 0);
      -[SBUIPasscodeLockViewBase _updateBiometricLayout](self, "_updateBiometricLayout");
    }
  }

}

- (BOOL)playsKeypadSounds
{
  return self->_playsKeypadSounds;
}

- (void)setPlaysKeypadSounds:(BOOL)a3
{
  if (self->_playsKeypadSounds != a3)
  {
    self->_playsKeypadSounds = a3;
    if (a3)
      -[_UIKBFeedbackGenerating activateWithCompletionBlock:](self->_keyboardFeedbackBehavior, "activateWithCompletionBlock:", 0);
  }
}

- (void)setScreenOn:(BOOL)a3
{
  if (self->_screenOn != a3)
  {
    self->_screenOn = a3;
    if (!a3)
    {
      -[SBUIPasscodeLockViewBase resetForScreenOff](self, "resetForScreenOff");
      if (-[_UIKBFeedbackGenerating isActive](self->_keyboardFeedbackBehavior, "isActive"))
        -[_UIKBFeedbackGenerating deactivate](self->_keyboardFeedbackBehavior, "deactivate");
    }
  }
}

- (void)setBackgroundAlpha:(double)a3
{
  void *v4;
  id v5;

  if (self->_backgroundAlpha != a3)
  {
    self->_backgroundAlpha = a3;
    -[SBUIPasscodeLockViewBase customBackgroundColor](self, "customBackgroundColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", self->_backgroundAlpha);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeLockViewBase setBackgroundColor:](self, "setBackgroundColor:", v4);

  }
}

- (void)setBackgroundLegibilitySettingsProvider:(id)a3
{
  SBFLegibilitySettingsProvider *v5;
  SBFLegibilitySettingsProvider **p_backgroundLegibilitySettingsProvider;
  SBFLegibilitySettingsProvider *backgroundLegibilitySettingsProvider;
  SBFLegibilitySettingsProvider *v8;

  v5 = (SBFLegibilitySettingsProvider *)a3;
  p_backgroundLegibilitySettingsProvider = &self->_backgroundLegibilitySettingsProvider;
  backgroundLegibilitySettingsProvider = self->_backgroundLegibilitySettingsProvider;
  if (backgroundLegibilitySettingsProvider != v5)
  {
    v8 = v5;
    -[SBFLegibilitySettingsProvider setDelegate:](backgroundLegibilitySettingsProvider, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_backgroundLegibilitySettingsProvider, a3);
    -[SBFLegibilitySettingsProvider setDelegate:](*p_backgroundLegibilitySettingsProvider, "setDelegate:", self);
    -[SBUIPasscodeLockViewBase providerLegibilitySettingsChanged:](self, "providerLegibilitySettingsChanged:", *p_backgroundLegibilitySettingsProvider);
    v5 = v8;
  }

}

- (void)resetForFailedMesaAttemptWithStatusText:(id)a3 andSubtitle:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[SBUIPasscodeLockViewBase _resetForFailedBiometricAttempt](self, "_resetForFailedBiometricAttempt");
  -[SBUIPasscodeLockViewBase updateStatusText:subtitle:animated:](self, "updateStatusText:subtitle:animated:", v7, v6, 1);

}

- (void)autofillForSuccessfulMesaAttemptWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBUIPasscodeLockViewBase _entryField](self, "_entryField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_autofillForBiometricAuthenticationWithCompletion:", v4);

}

- (void)setBiometricAuthenticationAllowed:(BOOL)a3
{
  NSObject *v5;
  int v6;
  SBUIPasscodeLockViewBase *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_isBiometricAuthenticationAllowed != a3)
  {
    -[SBUIPasscodeLockViewBase updateStatusTextAnimated:](self, "updateStatusTextAnimated:", 1);
    self->_isBiometricAuthenticationAllowed = a3;
    if (!a3 && self->_pendingBioUnlock)
    {
      SBLogCommon();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = 134217984;
        v7 = self;
        _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_INFO, "Disabling matching for passcode lock view (%p) but there is a pending bio unlock", (uint8_t *)&v6, 0xCu);
      }

      self->_pendingBioUnlock = 0;
    }
    -[SBUIPasscodeLockViewBase _evaluateBiometricMatchingState](self, "_evaluateBiometricMatchingState");
  }
}

- (void)_evaluateBiometricMatchingState
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;

  v3 = -[NSMutableSet count](self->_biometricMatchingEnabledOverrideReasons, "count");
  -[SBUIPasscodeLockViewBase window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 || v3)
  {
    if (self->_isBiometricAuthenticationAllowed)
    {
      v6 = -[SBUIPasscodeLockViewBase _canRecognizeBiometricAuthentication](self, "_canRecognizeBiometricAuthentication");
      if (v3)
        v5 = 1;
      else
        v5 = v6;
    }
    else
    {
      v5 = 2;
    }
  }
  else
  {
    v5 = 0;
  }
  -[SBUIPasscodeLockViewBase _setBiometricMatchingState:](self, "_setBiometricMatchingState:", v5);
}

- (void)_setBiometricMatchingState:(unint64_t)a3
{
  void *v4;
  objc_class *v5;
  void *v6;
  BSInvalidatable *v7;
  unint64_t biometricMatchingState;
  uint64_t v9;
  BSInvalidatable *v10;
  BSInvalidatable *biometricMatchingAssertion;
  id v12;

  if (self->_biometricMatchingState != a3)
  {
    self->_biometricMatchingState = a3;
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("PasscodeUI-<%@:%p>"), v6, self);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v7 = self->_biometricMatchingAssertion;
    biometricMatchingState = self->_biometricMatchingState;
    if (biometricMatchingState)
    {
      if (biometricMatchingState == 2)
      {
        v9 = 0;
      }
      else
      {
        if (biometricMatchingState != 1)
        {
LABEL_10:
          -[BSInvalidatable invalidate](v7, "invalidate");

          return;
        }
        -[SBUIPasscodeLockViewBase _updateStatusStateForLockoutIfNecessaryAnimatedly:](self, "_updateStatusStateForLockoutIfNecessaryAnimatedly:", 0);
        v9 = 3;
      }
      -[SBUIBiometricResource acquireMatchingAssertionWithMode:reason:](self->_biometricResource, "acquireMatchingAssertionWithMode:reason:", v9, v12);
      v10 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    biometricMatchingAssertion = self->_biometricMatchingAssertion;
    self->_biometricMatchingAssertion = v10;

    goto LABEL_10;
  }
}

- (void)_overrideBiometricMatchingEnabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v7;
  NSMutableSet *biometricMatchingEnabledOverrideReasons;
  NSMutableSet *v9;
  NSMutableSet *v10;
  NSMutableSet *v11;
  void *v12;
  id v13;

  v4 = a3;
  v7 = a4;
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIPasscodeLockViewBase.m"), 934, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    v7 = 0;
  }
  biometricMatchingEnabledOverrideReasons = self->_biometricMatchingEnabledOverrideReasons;
  if (v4)
  {
    if (!biometricMatchingEnabledOverrideReasons)
    {
      v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v10 = self->_biometricMatchingEnabledOverrideReasons;
      self->_biometricMatchingEnabledOverrideReasons = v9;

      v7 = v13;
      biometricMatchingEnabledOverrideReasons = self->_biometricMatchingEnabledOverrideReasons;
    }
    -[NSMutableSet addObject:](biometricMatchingEnabledOverrideReasons, "addObject:", v7);
    goto LABEL_9;
  }
  -[NSMutableSet removeObject:](biometricMatchingEnabledOverrideReasons, "removeObject:", v7);
  if (!-[NSMutableSet count](self->_biometricMatchingEnabledOverrideReasons, "count"))
  {
    v11 = self->_biometricMatchingEnabledOverrideReasons;
    self->_biometricMatchingEnabledOverrideReasons = 0;

LABEL_9:
    -[SBUIPasscodeLockViewBase _evaluateBiometricMatchingState](self, "_evaluateBiometricMatchingState");
  }

}

- (void)_resumeBiometricMatchingAdvisory:(BOOL)a3
{
  -[SBUIBiometricResource resumeMatchingAdvisory:](self->_biometricResource, "resumeMatchingAdvisory:", a3);
}

- (BOOL)canBecomeFirstResponder
{
  return -[SBUIPasscodeEntryField canBecomeFirstResponder](self->_entryField, "canBecomeFirstResponder");
}

- (BOOL)becomeFirstResponder
{
  unsigned __int8 v3;
  BOOL v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = 0;
  v8 = 0;
  v9 = 0;
  -[SBUIPasscodeLockViewBase transitionContext](self, "transitionContext");
  -[SBUIPasscodeLockViewBase isTransitioning](self, "isTransitioning");
  if (self->_passcodeLockViewState == 1)
  {
    v3 = -[SBUIPasscodeEntryField becomeFirstResponder](self->_entryField, "becomeFirstResponder");
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBUIPasscodeLockViewBase;
    v3 = -[SBUIPasscodeLockViewBase becomeFirstResponder](&v6, sel_becomeFirstResponder);
  }
  v4 = v3;
  -[SBUIPasscodeLockViewBase _evaluateBiometricMatchingState](self, "_evaluateBiometricMatchingState");
  if (self->_isBiometricAuthenticationAllowed && self->_pendingBioUnlock)
  {
    self->_pendingBioUnlock = 0;
    -[SBUIPasscodeLockViewBase _handleBiometricAuthentication](self, "_handleBiometricAuthentication");
  }
  return v4;
}

- (BOOL)resignFirstResponder
{
  unsigned int v3;
  objc_super v5;

  if (-[SBUIPasscodeEntryField isFirstResponder](self->_entryField, "isFirstResponder"))
  {
    if (!-[SBUIPasscodeEntryField resignFirstResponder](self->_entryField, "resignFirstResponder"))
    {
      LOBYTE(v3) = 0;
      return v3;
    }
  }
  else
  {
    v3 = -[SBUIPasscodeLockViewBase isFirstResponder](self, "isFirstResponder");
    if (!v3)
      return v3;
    v5.receiver = self;
    v5.super_class = (Class)SBUIPasscodeLockViewBase;
    v3 = -[SBUIPasscodeLockViewBase resignFirstResponder](&v5, sel_resignFirstResponder);
    if (!v3)
      return v3;
  }
  -[SBUIPasscodeLockViewBase reset](self, "reset");
  -[SBUIPasscodeLockViewBase _evaluateBiometricMatchingState](self, "_evaluateBiometricMatchingState");
  if (self->_isBiometricAuthenticationAllowed && self->_allowsStatusTextUpdatingOnResignFirstResponder)
    -[SBUIPasscodeLockViewBase _resetStatusText](self, "_resetStatusText");
  LOBYTE(v3) = 1;
  return v3;
}

- (BOOL)canResignFirstResponder
{
  return -[SBUIPasscodeEntryField canResignFirstResponder](self->_entryField, "canResignFirstResponder");
}

- (BOOL)_canRecognizeBiometricAuthentication
{
  return (-[SBUIPasscodeLockViewBase isFirstResponder](self, "isFirstResponder") & 1) != 0
      || -[SBUIPasscodeEntryField isFirstResponder](self->_entryField, "isFirstResponder");
}

- (void)willMoveToWindow:(id)a3
{
  if (a3)
    -[SBUIPasscodeLockViewBase _luminanceBoostDidChange](self, "_luminanceBoostDidChange");
}

- (void)didMoveToWindow
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBUIPasscodeLockViewBase;
  -[SBUIPasscodeLockViewBase didMoveToWindow](&v6, sel_didMoveToWindow);
  -[SBUIPasscodeLockViewBase _evaluateBiometricMatchingState](self, "_evaluateBiometricMatchingState");
  -[SBUIPasscodeLockViewBase window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (-[SBUIPasscodeLockViewBase isFirstResponder](self, "isFirstResponder"))
      -[SBUIPasscodeLockViewBase resignFirstResponder](self, "resignFirstResponder");
    if (self->_isBiometricAuthenticationAllowed && self->_allowsStatusTextUpdatingOnResignFirstResponder)
      -[SBUIPasscodeLockViewBase _resetStatusText](self, "_resetStatusText");
    if (self->_pendingBioUnlock)
    {
      SBLogCommon();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1A471F000, v4, OS_LOG_TYPE_INFO, "Passcode lock view has been removed from the view hierarchy but has a pending bio unlock", v5, 2u);
      }

      self->_pendingBioUnlock = 0;
    }
  }
}

- (void)updateStatusText:(id)a3 subtitle:(id)a4 animated:(BOOL)a5
{
  -[SBUIPasscodeLockViewBase setAllowsStatusTextUpdatingOnResignFirstResponder:](self, "setAllowsStatusTextUpdatingOnResignFirstResponder:", 0, a4, a5);
}

- (int64_t)_orientation
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation");
}

- (BOOL)_isBoundsPortraitOriented
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect v7;
  CGRect v8;

  -[SBUIPasscodeLockViewBase bounds](self, "bounds");
  x = v7.origin.x;
  y = v7.origin.y;
  width = v7.size.width;
  height = v7.size.height;
  CGRectGetWidth(v7);
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  CGRectGetHeight(v8);
  return BSFloatLessThanFloat();
}

- (void)_setLegibilitySettings:(id)a3
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
    -[SBUIPasscodeLockViewBase _proudLockContainerViewControllerToUpdate](self, "_proudLockContainerViewControllerToUpdate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLegibilitySettings:", *p_legibilitySettings);

    -[SBUIProudLockContainerViewController setLegibilitySettings:](self->_proudLockContainerViewController, "setLegibilitySettings:", *p_legibilitySettings);
    -[SBUIPasscodeLockViewBase _evaluateLuminance](self, "_evaluateLuminance");
    v5 = v8;
  }

}

- (void)_setLuminosityBoost:(double)a3
{
  _QWORD v3[5];

  if (self->_luminanceBoost != a3)
  {
    self->_luminanceBoost = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __48__SBUIPasscodeLockViewBase__setLuminosityBoost___block_invoke;
    v3[3] = &unk_1E4C3E408;
    v3[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v3, 0.2);
  }
}

uint64_t __48__SBUIPasscodeLockViewBase__setLuminosityBoost___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_luminanceBoostDidChange");
}

- (void)_luminanceBoostDidChange
{
  double v3;

  -[SBUIPasscodeLockViewBase _luminosityBoost](self, "_luminosityBoost");
  -[SBUIPasscodeEntryField _setLuminosityBoost:](self->_entryField, "_setLuminosityBoost:", fmin(fmax(v3 + 0.15, 0.07), 0.8));
}

- (void)_sendDelegateKeypadKeyDown
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;

  -[SBUIPasscodeLockViewBase delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v6 = (void *)v3;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "passcodeLockViewKeypadKeyDown:", self);
      v4 = v6;
    }
  }

}

- (void)_sendDelegateKeypadKeyUp
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;

  -[SBUIPasscodeLockViewBase delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v6 = (void *)v3;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "passcodeLockViewKeypadKeyUp:", self);
      v4 = v6;
    }
  }

}

- (void)_updateStatusStateForLockoutIfNecessaryAnimatedly:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  BOOL v6;

  if (self->_isBiometricAuthenticationAllowed)
  {
    v3 = a3;
    if (!-[SBUIPasscodeLockViewBase _statusState](self, "_statusState"))
    {
      v5 = -[SBUIBiometricResource biometricLockoutState](self->_biometricResource, "biometricLockoutState");
      if (-[SBUIBiometricResource hasBiometricAuthenticationCapabilityEnabled](self->_biometricResource, "hasBiometricAuthenticationCapabilityEnabled"))
      {
        if (-[SBUIBiometricResource isMatchingEnabled](self->_biometricResource, "isMatchingEnabled"))
          v6 = v5 == 0;
        else
          v6 = 1;
        if (!v6)
          -[SBUIPasscodeLockViewBase _setStatusState:animated:](self, "_setStatusState:animated:", -[SBUIPasscodeLockViewBase _statusStateForLockoutState:](self, "_statusStateForLockoutState:", v5), v3);
      }
    }
  }
}

- (double)_numberPadOffsetFromTopOfScreen:(id)a3
{
  void *v3;
  id v5;
  _BOOL8 v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  int v10;
  char v11;
  _BOOL4 v12;
  int v13;
  char v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  char v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;

  v5 = a3;
  v6 = -[SBUIPasscodeLockViewBase _isBoundsPortraitOriented](self, "_isBoundsPortraitOriented");
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  v9 = v8 & 0xFFFFFFFFFFFFFFFBLL;
  v10 = __sb__runningInSpringBoard();
  v11 = v10;
  if (v10)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v12 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v8 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v8, "userInterfaceIdiom"))
    {
      v12 = 0;
LABEL_13:

      goto LABEL_14;
    }
  }
  v13 = __sb__runningInSpringBoard();
  v14 = v13;
  if (v13)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v12 = v15 >= *(double *)(MEMORY[0x1E0DAB260] + 40);
  if ((v14 & 1) == 0)

  if ((v11 & 1) == 0)
    goto LABEL_13;
LABEL_14:
  if (v9 == 1 || !v6 || v12)
  {
    v20 = v9 == 1 || v6;
    if ((v20 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DA9E68], "pinNumberPadBaseOffsetFromTopOfScreen:", v6);
      v22 = v21;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA9E68], "pinNumberPadButtonOuterCircleDiameter:", 0);
      v24 = v23 * 4.0;
      objc_msgSend(MEMORY[0x1E0DA9E68], "pinNumberPadButtonPaddingHeight:", 0);
      v26 = v24 + v25 * 6.0;
      -[SBUIPasscodeLockViewBase bounds](self, "bounds");
      v22 = (v27 - v26) * 0.75;
    }
    objc_msgSend(v5, "_distanceToTopOfFirstButton");
    v19 = v22 - v28;
  }
  else
  {
    -[SBUIPasscodeLockViewBase bounds](self, "bounds");
    v17 = v16;
    objc_msgSend(v5, "bounds");
    v19 = v17 - v18;
  }

  return v19;
}

- (void)_setStatusText:(id)a3
{
  id v4;
  NSString *statusText;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  id v9;

  v4 = a3;
  statusText = self->_statusText;
  v9 = v4;
  if (!statusText || (v6 = -[NSString isEqualToString:](statusText, "isEqualToString:", v4), v4 = v9, !v6))
  {
    v7 = (NSString *)objc_msgSend(v4, "copy");
    v8 = self->_statusText;
    self->_statusText = v7;

    -[SBUIPasscodeLockViewBase setNeedsStatusTextUpdate](self, "setNeedsStatusTextUpdate");
    v4 = v9;
  }

}

- (void)setNeedsStatusTextUpdate
{
  self->_needStatusTextUpdate = 1;
}

- (void)_setStatusSubtitleText:(id)a3
{
  id v4;
  NSString *statusSubtitleText;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  id v9;

  v4 = a3;
  statusSubtitleText = self->_statusSubtitleText;
  v9 = v4;
  if (!statusSubtitleText
    || (v6 = -[NSString isEqualToString:](statusSubtitleText, "isEqualToString:", v4), v4 = v9, !v6))
  {
    v7 = (NSString *)objc_msgSend(v4, "copy");
    v8 = self->_statusSubtitleText;
    self->_statusSubtitleText = v7;

    -[SBUIPasscodeLockViewBase setNeedsStatusTextUpdate](self, "setNeedsStatusTextUpdate");
    v4 = v9;
  }

}

- (void)_setSuppressTitleText:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_suppressTitleText != a3)
  {
    self->_suppressTitleText = a3;
    -[SBUIPasscodeLockViewBase updateStatusTextAnimated:](self, "updateStatusTextAnimated:", a4);
  }
}

- (void)updateStatusTextAnimated:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  const __CFString *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const char *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  uint8_t buf[16];

  v3 = a3;
  v5 = -[SBUIPasscodeLockViewBase _statusState](self, "_statusState");
  v6 = -[SBUIPasscodeLockViewBase _orientation](self, "_orientation");
  switch(v5)
  {
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ENTRY_PROMPT"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (-[SBUIBiometricResource hasPearlSupport](self->_biometricResource, "hasPearlSupport"))
        v9 = CFSTR("FACE_ID_NEEDS_PASSCODE_REBOOT");
      else
        v9 = CFSTR("MESA_NEEDS_PASSCODE_REBOOT");
      objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      _SBUIAXAwareLocalizedStringForKey(v10, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_31;
      *(_WORD *)buf = 0;
      v13 = "Passcode view status: Face ID or Mesa needs passcode after reboot";
      goto LABEL_30;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ENTRY_PROMPT"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      _SBUIPasscodeLocalizeStringForMesaOrPearlKey(CFSTR("MESA_NEEDS_PASSCODE_BIO_LOCKOUT"), CFSTR("FACE_ID_NEEDS_PASSCODE_BIO_LOCKOUT"), self->_biometricResource, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_80;
      *(_WORD *)buf = 0;
      v15 = "Passcode view status: Face ID or Mesa needs passcode bio lockout";
      goto LABEL_79;
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ENTRY_PROMPT"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      _SBUIPasscodeLocalizeStringForMesaOrPearlKey(CFSTR("MESA_NEEDS_PASSCODE"), CFSTR("FACE_ID_NEEDS_PASSCODE"), self->_biometricResource, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_80;
      *(_WORD *)buf = 0;
      v15 = "Passcode view status: Face ID or Mesa needs passcode for bio expiraion";
      goto LABEL_79;
    case 4uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ENTRY_PROMPT"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      _SBUIPasscodeLocalizeStringForMesaOrPearlKey(CFSTR("MESA_NEEDS_PASSCODE"), CFSTR("FACE_ID_NEEDS_PASSCODE"), self->_biometricResource, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_80;
      *(_WORD *)buf = 0;
      v15 = "Passcode view status: Face ID or Mesa needs passcode for bio enabling";
      goto LABEL_79;
    case 5uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ENTRY_PROMPT"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (-[SBUIBiometricResource hasPearlSupport](self->_biometricResource, "hasPearlSupport"))
        v19 = CFSTR("FACE_ID_NEEDS_PASSCODE_FOR_SOFTWARE_UPDATE");
      else
        v19 = CFSTR("MESA_NEEDS_PASSCODE_FOR_SOFTWARE_UPDATE");
      objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", v19);
      v10 = objc_claimAutoreleasedReturnValue();
      _SBUIAXAwareLocalizedStringForKey(v10, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_31;
      *(_WORD *)buf = 0;
      v13 = "Passcode view status: Face ID or Mesa needs passcode for software update";
      goto LABEL_30;
    case 6uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ENTRY_PROMPT"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (-[SBUIBiometricResource hasPearlSupport](self->_biometricResource, "hasPearlSupport"))
        v21 = CFSTR("FACE_ID_NEEDS_PASSCODE_FOR_ESCROW_UPDATE");
      else
        v21 = CFSTR("MESA_NEEDS_PASSCODE_FOR_ESCROW_UPDATE");
      objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", v21);
      v10 = objc_claimAutoreleasedReturnValue();
      _SBUIAXAwareLocalizedStringForKey(v10, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_31;
      *(_WORD *)buf = 0;
      v13 = "Passcode view status: Face ID or Mesa needs passcode for escrow update";
      goto LABEL_30;
    case 7uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ENTRY_PROMPT"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (-[SBUIBiometricResource hasPearlSupport](self->_biometricResource, "hasPearlSupport"))
        v23 = CFSTR("FACE_ID_NEEDS_PASSCODE_BIO_DROPPED");
      else
        v23 = CFSTR("MESA_NEEDS_PASSCODE_BIO_DROPPED");
      objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", v23);
      v10 = objc_claimAutoreleasedReturnValue();
      _SBUIAXAwareLocalizedStringForKey(v10, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_31;
      *(_WORD *)buf = 0;
      v13 = "Passcode view status: Face ID or Mesa needs passcode due to token drop";
LABEL_30:
      _os_log_impl(&dword_1A471F000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
LABEL_31:

      goto LABEL_80;
    case 8uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ENTRY_PROMPT_RETRY"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_39;
      *(_WORD *)buf = 0;
      v25 = "Passcode view status: Passcode entry prompt to retry";
      goto LABEL_38;
    case 9uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ENTRY_PROMPT_RETRY"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      _SBUIAXAwareLocalizedStringForKey(CFSTR("MESA_IS_DIRTY"), v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_80;
      *(_WORD *)buf = 0;
      v15 = "Passcode view status: Mesa is dirty";
      goto LABEL_79;
    case 0xAuLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("SWIPE_UP_TO_RETRY_PROMPT"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_39;
      *(_WORD *)buf = 0;
      v25 = "Passcode view status: Swipe up to retry prompt";
LABEL_38:
      _os_log_impl(&dword_1A471F000, v10, OS_LOG_TYPE_DEFAULT, v25, buf, 2u);
LABEL_39:
      v11 = 0;
      goto LABEL_80;
    case 0xBuLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ENTRY_PROMPT"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      _SBUIAXAwareLocalizedStringForKey(CFSTR("WATCH_LOCKED_PROMPT"), v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_80;
      *(_WORD *)buf = 0;
      v15 = "Passcode view status: Watch locked prompt";
      goto LABEL_79;
    case 0xCuLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ENTRY_PROMPT"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      _SBUIAXAwareLocalizedStringForKey(CFSTR("SLEEP_MODE_PROMPT"), v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_80;
      *(_WORD *)buf = 0;
      v15 = "Passcode view status: Watch in sleep mode prompt";
      goto LABEL_79;
    case 0xDuLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ENTRY_PROMPT"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (MGGetBoolAnswer())
      {
        _SBUIAXAwareLocalizedStringForKey(CFSTR("WATCH_WLAN_OFF_PROMPT"), v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        SBLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          goto LABEL_80;
        *(_WORD *)buf = 0;
        v15 = "Passcode view status: Watch Wlan off prompt";
      }
      else
      {
        _SBUIAXAwareLocalizedStringForKey(CFSTR("WATCH_WIFI_OFF_PROMPT"), v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        SBLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          goto LABEL_80;
        *(_WORD *)buf = 0;
        v15 = "Passcode view status: Watch Wifi off prompt";
      }
      goto LABEL_79;
    case 0xEuLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ENTRY_PROMPT"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      _SBUIAXAwareLocalizedStringForKey(CFSTR("WATCH_OUT_OF_RANGE_PROMPT"), v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_80;
      *(_WORD *)buf = 0;
      v15 = "Passcode view status: Watch out of range prompt";
      goto LABEL_79;
    case 0xFuLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ENTRY_PROMPT"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      _SBUIAXAwareLocalizedStringForKey(CFSTR("PHONE_BT_OFF_PROMPT"), v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_80;
      *(_WORD *)buf = 0;
      v15 = "Passcode view status: Phone bluetooth off prompt";
      goto LABEL_79;
    case 0x10uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ENTRY_PROMPT"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (MGGetBoolAnswer())
      {
        _SBUIAXAwareLocalizedStringForKey(CFSTR("PHONE_WLAN_OFF_PROMPT"), v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        SBLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          goto LABEL_80;
        *(_WORD *)buf = 0;
        v15 = "Passcode view status: Phone Wlan off prompt";
      }
      else
      {
        _SBUIAXAwareLocalizedStringForKey(CFSTR("PHONE_WIFI_OFF_PROMPT"), v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        SBLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          goto LABEL_80;
        *(_WORD *)buf = 0;
        v15 = "Passcode view status: Watch Wifi off prompt";
      }
      goto LABEL_79;
    case 0x11uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ENTRY_PROMPT"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (MGGetBoolAnswer())
      {
        _SBUIAXAwareLocalizedStringForKey(CFSTR("PHONE_BT_AND_WLAN_OFF_PROMPT"), v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        SBLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          goto LABEL_80;
        *(_WORD *)buf = 0;
        v15 = "Passcode view status: Phone bluetooth and Wlan off prompt";
      }
      else
      {
        _SBUIAXAwareLocalizedStringForKey(CFSTR("PHONE_BT_AND_WIFI_OFF_PROMPT"), v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        SBLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          goto LABEL_80;
        *(_WORD *)buf = 0;
        v15 = "Passcode view status: Phone bluetooth and Wifi off prompt";
      }
LABEL_79:
      _os_log_impl(&dword_1A471F000, v10, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
LABEL_80:

      if (!v8)
      {
LABEL_81:
        -[SBUIPasscodeLockViewBase _defaultStatusText](self, "_defaultStatusText");
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if (self->_suppressTitleText && !objc_msgSend(v11, "length"))
      {

        v8 = CFSTR(" ");
      }
      -[SBUIPasscodeLockViewBase _setStatusText:](self, "_setStatusText:", v8);
      -[SBUIPasscodeLockViewBase _setStatusSubtitleText:](self, "_setStatusSubtitleText:", v11);
      if (self->_needStatusTextUpdate)
      {
        -[SBUIPasscodeLockViewBase _statusText](self, "_statusText");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBUIPasscodeLockViewBase _statusSubtitleText](self, "_statusSubtitleText");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBUIPasscodeLockViewBase updateStatusText:subtitle:animated:](self, "updateStatusText:subtitle:animated:", v45, v46, v3);

        self->_needStatusTextUpdate = 0;
      }

      return;
    case 0x12uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ENTRY_PROMPT"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      _SBUIAXAwareLocalizedStringForKey(CFSTR("PHONE_UNLOCK_REQUIRED_PROMPT"), v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_80;
      *(_WORD *)buf = 0;
      v15 = "Passcode view status: Phone unlocked required prompt";
      goto LABEL_79;
    case 0x13uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ENTRY_PROMPT"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      _SBUIAXAwareLocalizedStringForKey(CFSTR("GENERIC_WATCH_UNLOCK_ERROR_PROMPT"), v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_80;
      *(_WORD *)buf = 0;
      v15 = "Passcode view status: Generic watch unlock error prompt";
      goto LABEL_79;
    case 0x14uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ENTRY_PROMPT"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      SBUIStringForPhoneUnlockWithWatchErrorCode(self->_errorCode);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_80;
      *(_WORD *)buf = 0;
      v15 = "Passcode view status: Watch unlock error";
      goto LABEL_79;
    case 0x15uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ENTRY_PROMPT"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      _SBUIAXAwareLocalizedStringForKey(CFSTR("FACE_ID_INTERLOCKED"), v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_80;
      *(_WORD *)buf = 0;
      v15 = "Passcode view status: Face ID interlocked";
      goto LABEL_79;
    case 0x16uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ENTRY_PROMPT"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      -[SBUIPasscodeLockViewBase _deviceSpecificTemperatureStringForTemperatureState:](self, "_deviceSpecificTemperatureStringForTemperatureState:", 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      _SBUIAXAwareLocalizedStringForKey(v40, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_80;
      *(_WORD *)buf = 0;
      v15 = "Passcode view status: Thermal state too hot";
      goto LABEL_79;
    case 0x17uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ENTRY_PROMPT"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      -[SBUIPasscodeLockViewBase _deviceSpecificTemperatureStringForTemperatureState:](self, "_deviceSpecificTemperatureStringForTemperatureState:", 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      _SBUIAXAwareLocalizedStringForKey(v42, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_80;
      *(_WORD *)buf = 0;
      v15 = "Passcode view status: Thermal state too cold";
      goto LABEL_79;
    case 0x18uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ENTRY_PROMPT"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      _SBUIAXAwareLocalizedStringForKey(CFSTR("FACE_ID_UNSUPPORTED_GLASSES_PROMPT"), v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_80;
      *(_WORD *)buf = 0;
      v15 = "Passcode view status: Unsupported Glasses";
      goto LABEL_79;
    case 0x19uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ENTRY_PROMPT"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      _SBUIAXAwareLocalizedStringForKey(CFSTR("FACE_ID_PERIOCULAR_TIMED_OUT_PROMPT"), v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_80;
      *(_WORD *)buf = 0;
      v15 = "Passcode view status: Periocular timed out";
      goto LABEL_79;
    default:
      if (self->_deviceHasBeenUnlockedOnceSinceBoot)
      {
        v11 = 0;
      }
      else
      {
        v47 = (void *)MEMORY[0x1E0CB3940];
        _SBUIAXAwareLocalizedStringForKey(CFSTR("PASSCODE_AFTER_REBOOT"), v6);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "model");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "stringWithFormat:", v48, v50);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        SBLogCommon();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A471F000, v51, OS_LOG_TYPE_DEFAULT, "Passcode view status: Face ID or Mesa needs passcode after reboot", buf, 2u);
        }

      }
      goto LABEL_81;
  }
}

- (id)_deviceSpecificTemperatureStringForTemperatureState:(unint64_t)a3
{
  _BOOL4 v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  v4 = -[SBUIBiometricResource hasPearlSupport](self->_biometricResource, "hasPearlSupport");
  v5 = CFSTR("MESA");
  if (v4)
    v5 = CFSTR("FACE_ID");
  v6 = CFSTR("COLD");
  if (a3 == 1)
    v6 = CFSTR("HOT");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_DEVICE_TOO_%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)_statusStateForLockoutState:(unint64_t)a3
{
  if (a3 - 1 > 8)
    return 0;
  else
    return qword_1A47AEBF8[a3 - 1];
}

- (void)_setStatusState:(unint64_t)a3
{
  -[SBUIPasscodeLockViewBase _setStatusState:animated:](self, "_setStatusState:animated:", a3, 1);
}

- (void)_setStatusState:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_statusState != a3)
  {
    v4 = a4;
    self->_statusState = a3;
    if (!-[SBUIPasscodeLockViewBase _statusStateShouldNotUpdateForUnsupportedGlassesFeedback:](self, "_statusStateShouldNotUpdateForUnsupportedGlassesFeedback:"))-[SBUIPasscodeLockViewBase updateStatusTextAnimated:](self, "updateStatusTextAnimated:", v4);
    self->_previousStatusState = a3;
  }
}

- (id)_defaultStatusText
{
  uint64_t v3;
  __CFString *v4;

  v3 = -[SBUIPasscodeLockViewBase _orientation](self, "_orientation");
  if (self->_deviceHasBeenUnlockedOnceSinceBoot
    && self->_isBiometricAuthenticationAllowed
    && -[SBUIBiometricResource hasBiometricAuthenticationCapabilityEnabled](self->_biometricResource, "hasBiometricAuthenticationCapabilityEnabled")&& -[SBUIBiometricResource hasMesaSupport](self->_biometricResource, "hasMesaSupport")&& -[SBUIBiometricResource isMatchingEnabled](self->_biometricResource, "isMatchingEnabled"))
  {
    v4 = CFSTR("PASSCODE_MESA_ENTRY_PROMPT");
  }
  else
  {
    v4 = CFSTR("PASSCODE_ENTRY_PROMPT");
  }
  _SBUIAXAwareLocalizedStringForKey(v4, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_resetForFailedPasscode:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[SBUIPasscodeLockViewBase _playAuthenticationFeedbackForSuccess:jiggleLock:](self, "_playAuthenticationFeedbackForSuccess:jiggleLock:", 0, 1);
  -[SBUIPasscodeEntryField _resetForFailedPasscode:](self->_entryField, "_resetForFailedPasscode:", v3);
}

- (void)_noteDeviceHasBeenUnlockedOnceSinceBoot:(BOOL)a3
{
  self->_deviceHasBeenUnlockedOnceSinceBoot = a3;
  -[SBUIPasscodeLockViewBase updateStatusTextAnimated:](self, "updateStatusTextAnimated:", 0);
}

- (void)_playAuthenticationFeedbackForSuccess:(BOOL)a3 jiggleLock:(BOOL)a4
{
  _BOOL4 v5;
  _BOOL4 v7;
  int v8;
  uint64_t v9;
  UINotificationFeedbackGenerator *authenticationFeedbackBehavior;
  _QWORD v11[6];
  BOOL v12;

  v5 = a3;
  v7 = -[SBUIBiometricResource hasPearlSupport](self->_biometricResource, "hasPearlSupport");
  if (v5)
  {
    if (v7)
    {
      v8 = _AXSPearlAuthenticationHapticsEnabled();
      v9 = 1014;
      if (!v8)
        v9 = 1000;
    }
    else
    {
      v9 = 1000;
    }
  }
  else
  {
    v9 = 1001;
    if (v7)
      v9 = 1015;
  }
  authenticationFeedbackBehavior = self->_authenticationFeedbackBehavior;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__SBUIPasscodeLockViewBase__playAuthenticationFeedbackForSuccess_jiggleLock___block_invoke;
  v11[3] = &unk_1E4C3EB20;
  v11[4] = self;
  v11[5] = v9;
  v12 = a4;
  -[UINotificationFeedbackGenerator activateWithCompletionBlock:](authenticationFeedbackBehavior, "activateWithCompletionBlock:", v11);
}

void __77__SBUIPasscodeLockViewBase__playAuthenticationFeedbackForSuccess_jiggleLock___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  if ((a2 & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 696), "_privateNotificationOccurred:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 696), "deactivate");
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.springboard"));

    if (v5)
    {
      objc_msgSend((id)*MEMORY[0x1E0CEB258], "statusBar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "jiggleLockIcon");

    }
    objc_msgSend(*(id *)(a1 + 32), "_proudLockContainerViewControllerToUpdate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateLockForBiometricMatchFailure");

  }
}

- (void)_noteScreenBrightnessDidChange
{
  void *v3;
  id v4;

  -[SBUIPasscodeLockViewBase screenBrightnessChangedTimer](self, "screenBrightnessChangedTimer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBUIPasscodeLockViewBase setScreenBrightnessChangedTimer:](self, "setScreenBrightnessChangedTimer:", 0);
  if (fabs(self->_currentBacklightLevel) >= 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__screenBrightnessReallyDidChange, 0, 0, 0.3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeLockViewBase setScreenBrightnessChangedTimer:](self, "setScreenBrightnessChangedTimer:", v3);

  }
  else
  {
    -[SBUIPasscodeLockViewBase _screenBrightnessReallyDidChange](self, "_screenBrightnessReallyDidChange");
  }
  objc_msgSend(v4, "invalidate");

}

- (BOOL)_proudLockShowingBiometricStates
{
  void *v2;
  BOOL v3;

  -[SBUIPasscodeLockViewBase _proudLockContainerViewControllerToUpdate](self, "_proudLockContainerViewControllerToUpdate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_effectivelyHasProudLockShowingBiometricStates
{
  return -[SBUIPasscodeLockViewBase _proudLockShowingBiometricStates](self, "_proudLockShowingBiometricStates")
      || -[SBUIPasscodeLockViewBase _accountingForExternallyShownProudLock](self, "_accountingForExternallyShownProudLock");
}

- (BOOL)_accountingForExternallyShownProudLock
{
  BOOL v2;
  uint64_t v3;

  v2 = 1;
  v3 = SBFEffectiveArtworkSubtype();
  if (v3 > 2795)
  {
    if (v3 != 2796 && v3 != 2868)
      return 0;
  }
  else if (v3 != 2556 && v3 != 2622)
  {
    return 0;
  }
  return v2;
}

- (void)_clearBrightnessChangeTimer
{
  void *v3;

  -[SBUIPasscodeLockViewBase screenBrightnessChangedTimer](self, "screenBrightnessChangedTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SBUIPasscodeLockViewBase setScreenBrightnessChangedTimer:](self, "setScreenBrightnessChangedTimer:", 0);
}

- (void)_screenBrightnessReallyDidChange
{
  float v3;
  double v4;

  -[SBUIPasscodeLockViewBase _clearBrightnessChangeTimer](self, "_clearBrightnessChangeTimer");
  BKSDisplayBrightnessGetCurrent();
  v4 = v3;
  if (self->_currentBacklightLevel != v4)
  {
    self->_currentBacklightLevel = v4;
    -[SBUIPasscodeLockViewBase _evaluateLuminance](self, "_evaluateLuminance");
  }
}

- (double)_luminanceBoostFromLegibility
{
  void *v2;
  double v3;
  double v5;
  double v6;
  double v7;

  v6 = 0.0;
  v7 = 0.0;
  v5 = 0.0;
  -[_UILegibilitySettings contentColor](self->_legibilitySettings, "contentColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getRed:green:blue:alpha:", &v7, &v6, &v5, 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "_luminanceWithRed:green:blue:", v7, v6, v5);
  if (v3 < 0.1)
    return 0.3;
  if (v3 <= 0.3)
    return v3 * -1.15 + 0.415;
  return 0.07;
}

- (double)_luminanceBoostFromDisplayBrightness
{
  return fmin(fmax(pow(fmin(fmax(self->_currentBacklightLevel, 0.0), 1.0) * -2.0 + 3.0, 7.0) / 4374.0, 0.0), 0.5);
}

- (void)_evaluateLuminance
{
  double v3;
  double v4;
  double v5;

  -[SBUIPasscodeLockViewBase _luminanceBoostFromLegibility](self, "_luminanceBoostFromLegibility");
  v4 = v3;
  -[SBUIPasscodeLockViewBase _luminanceBoostFromDisplayBrightness](self, "_luminanceBoostFromDisplayBrightness");
  -[SBUIPasscodeLockViewBase _setLuminosityBoost:](self, "_setLuminosityBoost:", fmin(fmax(v4 + v5, 0.07), 0.8));
}

- (void)_resetStatusText
{
  -[SBUIPasscodeLockViewBase updateStatusTextAnimated:](self, "updateStatusTextAnimated:", 0);
}

- (void)_resetProudLockAndTitleTextForFailedBiometricAttempt
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  +[SBUIBiometricResource sharedInstance](SBUIBiometricResource, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPearlSupport");

  if (v4)
    -[SBUIPasscodeLockViewBase _setStatusStateSwipeToRetryAnimated:](self, "_setStatusStateSwipeToRetryAnimated:", 1);
  -[SBUIPasscodeLockViewBase _setSuppressTitleText:animated:](self, "_setSuppressTitleText:animated:", 0, 1);
  -[SBUIPasscodeLockViewBase _entryField](self, "_entryField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  -[SBUIPasscodeLockViewBase _proudLockContainerViewControllerToUpdate](self, "_proudLockContainerViewControllerToUpdate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "reset");
  else
    objc_msgSend(v8, "updateLockForBiometricMatchFailure");

}

- (void)_resetForFailedBiometricAttempt
{
  NSObject *v3;
  int64_t v4;
  dispatch_time_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  uint8_t buf[16];

  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A471F000, v3, OS_LOG_TYPE_DEFAULT, "Passcode lock view resetting for failed biometric attempt", buf, 2u);
  }

  if (self->_passcodeLockViewState == 1)
  {
    if (-[SBUIPasscodeLockViewBase _effectivelyHasProudLockShowingBiometricStates](self, "_effectivelyHasProudLockShowingBiometricStates"))
    {
      -[SBUIPasscodeLockViewBase _resetProudLockAndTitleTextForFailedBiometricAttempt](self, "_resetProudLockAndTitleTextForFailedBiometricAttempt");
    }
    else
    {
      -[SBUIPasscodeLockViewBase _entryField](self, "_entryField");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __59__SBUIPasscodeLockViewBase__resetForFailedBiometricAttempt__block_invoke;
      v8[3] = &unk_1E4C3E408;
      v8[4] = self;
      objc_msgSend(v6, "_autofillForBiometricAuthenticationWithCompletion:", v8);

    }
  }
  else
  {
    if (-[SBUIPasscodeBiometricAuthenticationView type](self->_biometricAuthenticationView, "type") != 3)
      -[SBUIPasscodeLockViewBase _resetProudLockAndTitleTextForFailedBiometricAttempt](self, "_resetProudLockAndTitleTextForFailedBiometricAttempt");
    if (-[SBUIBiometricResource hasPearlSupport](self->_biometricResource, "hasPearlSupport"))
    {
      if (-[SBUIPasscodeLockViewBase _accountingForExternallyShownProudLock](self, "_accountingForExternallyShownProudLock"))
      {
        v4 = 0;
      }
      else
      {
        v4 = 800000000;
      }
      v5 = dispatch_time(0, v4);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __59__SBUIPasscodeLockViewBase__resetForFailedBiometricAttempt__block_invoke_3;
      v7[3] = &unk_1E4C3E408;
      v7[4] = self;
      dispatch_after(v5, MEMORY[0x1E0C80D38], v7);
    }
  }
}

void __59__SBUIPasscodeLockViewBase__resetForFailedBiometricAttempt__block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[5];

  v2 = dispatch_time(0, 300000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SBUIPasscodeLockViewBase__resetForFailedBiometricAttempt__block_invoke_2;
  block[3] = &unk_1E4C3E408;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
}

void __59__SBUIPasscodeLockViewBase__resetForFailedBiometricAttempt__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_setSuppressTitleText:animated:", 0, 1);
  objc_msgSend(*(id *)(a1 + 32), "_playAuthenticationFeedbackForSuccess:jiggleLock:", 0, 1);
  objc_msgSend(*(id *)(a1 + 32), "_entryField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_resetForFailedPasscode:", 1);

}

uint64_t __59__SBUIPasscodeLockViewBase__resetForFailedBiometricAttempt__block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[60] != 1)
  {
    objc_msgSend(v2, "unlockDestination");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v8 = CFSTR("SBUIPasscodeLockViewBiometricTransitionToPasscodeReasonKey");
      v9[0] = CFSTR("SBUIPasscodeLockViewBiometricTransitionToPasscodeReasonMatchFailure");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("SBUIPasscodeLockViewBiometricTransitionToPasscode"), v5, v6);

    }
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "type") == 3)
    objc_msgSend(*(id *)(a1 + 32), "_resetProudLockAndTitleTextForFailedBiometricAttempt");
  return objc_msgSend(*(id *)(a1 + 32), "_advanceToPasscodeForMatchFailure:", 1);
}

- (void)_handleNonPasscodeAuthenticationAndUpdateProudLock
{
  void (**v3)(_QWORD);
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__SBUIPasscodeLockViewBase__handleNonPasscodeAuthenticationAndUpdateProudLock__block_invoke;
  v4[3] = &unk_1E4C3E408;
  v4[4] = self;
  v3 = (void (**)(_QWORD))MEMORY[0x1A85A1798](v4, a2);
  if (!-[SBUIPasscodeLockViewBase _supportsProudLock](self, "_supportsProudLock"))
    goto LABEL_5;
  if (!self->_proudLockConfiguration.coachingDelaysUnlock)
  {
    -[SBUIPasscodeLockViewBase _updateProudLockForBioUnlockWithCompletion:](self, "_updateProudLockForBioUnlockWithCompletion:", 0);
LABEL_5:
    v3[2](v3);
    goto LABEL_6;
  }
  -[SBUIPasscodeLockViewBase _updateProudLockForBioUnlockWithCompletion:](self, "_updateProudLockForBioUnlockWithCompletion:", v3);
LABEL_6:

}

_BYTE *__78__SBUIPasscodeLockViewBase__handleNonPasscodeAuthenticationAndUpdateProudLock__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[488])
    return (_BYTE *)objc_msgSend(result, "_handleBiometricAuthentication");
  return result;
}

- (void)_handleBiometricAuthentication
{
  void *v3;
  int64_t v4;
  dispatch_time_t v5;
  _QWORD block[5];

  -[SBUIPasscodeLockViewBase _disarmAdvanceToPasscodeTimer](self, "_disarmAdvanceToPasscodeTimer");
  -[SBUIPasscodeLockViewBase _playAuthenticationFeedbackForSuccess:jiggleLock:](self, "_playAuthenticationFeedbackForSuccess:jiggleLock:", 1, 0);
  -[SBUIPasscodeLockViewBase _entryField](self, "_entryField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_autofillForBiometricAuthenticationWithCompletion:", 0);

  if (-[SBUIPasscodeLockViewBase _accountingForExternallyShownProudLock](self, "_accountingForExternallyShownProudLock"))
  {
    v4 = 0;
  }
  else
  {
    v4 = 200000000;
  }
  v5 = dispatch_time(0, v4);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SBUIPasscodeLockViewBase__handleBiometricAuthentication__block_invoke;
  block[3] = &unk_1E4C3E408;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x1E0C80D38], block);
}

uint64_t __58__SBUIPasscodeLockViewBase__handleBiometricAuthentication__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegatePasscodeEnteredViaMesa");
}

- (void)_notifyDelegatePasscodeEnteredViaMesa
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;

  -[SBUIPasscodeLockViewBase delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v6 = (void *)v3;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "passcodeLockViewPasscodeEnteredViaMesa:", self);
      v4 = v6;
    }
  }

}

- (void)_updateProudLockForBioUnlockWithCompletion:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[SBUIPasscodeLockViewBase _proudLockShowingBiometricStates](self, "_proudLockShowingBiometricStates"))
  {
    v4 = -[SBUIPasscodeLockViewBase _accountingForExternallyShownProudLock](self, "_accountingForExternallyShownProudLock");
    -[SBUIPasscodeLockViewBase _proudLockContainerViewControllerToUpdate](self, "_proudLockContainerViewControllerToUpdate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v4)
    {
      objc_msgSend(v5, "setAuthenticated:completion:", 1, v8);

      goto LABEL_7;
    }
    objc_msgSend(v5, "setAuthenticated:completion:", 1, 0);

  }
  v7 = v8;
  if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
LABEL_7:
    v7 = v8;
  }

}

- (void)_updateProudLockForBioEvent:(unint64_t)a3
{
  id v4;

  if (a3 != 4)
  {
    -[SBUIPasscodeLockViewBase _proudLockContainerViewControllerToUpdate](self, "_proudLockContainerViewControllerToUpdate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleBiometricEvent:", a3);

  }
}

- (void)_updateStatusTextForBioEvent:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v6;
  unint64_t statusState;
  int v8;

  v6 = -[SBUIBiometricResource hasPearlSupport](self->_biometricResource, "hasPearlSupport", a3, a4);
  statusState = 1;
  switch(a3)
  {
    case 5uLL:
    case 6uLL:
    case 0xBuLL:
      statusState = 4;
      break;
    case 7uLL:
      statusState = 3;
      break;
    case 8uLL:
      break;
    case 9uLL:
      statusState = 9;
      break;
    case 0xAuLL:
      v8 = self->_passcodeLockViewState != 1 || v6;
      if (v8 == 1)
        statusState = self->_statusState;
      else
        statusState = 8;
      break;
    case 0x18uLL:
      statusState = 21;
      break;
    case 0x19uLL:
      statusState = 22;
      break;
    case 0x1AuLL:
      statusState = 23;
      break;
    case 0x1EuLL:
      statusState = 24;
      break;
    case 0x20uLL:
      statusState = 25;
      break;
    case 0x21uLL:
      statusState = 7;
      break;
    default:
      statusState = 0;
      break;
  }
  -[SBUIPasscodeLockViewBase _setStatusState:](self, "_setStatusState:", statusState);
}

- (void)_updateBiometricGlyphForBioEvent:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void (**v8)(id, _QWORD);
  BOOL v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v5 = a4;
  v8 = (void (**)(id, _QWORD))a5;
  v9 = -[SBUIBiometricResource hasPearlSupport](self->_biometricResource, "hasPearlSupport");
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__SBUIPasscodeLockViewBase__updateBiometricGlyphForBioEvent_animated_completion___block_invoke;
  v12[3] = &unk_1E4C3EB48;
  v12[4] = &v17;
  v12[5] = &v13;
  v10 = MEMORY[0x1A85A1798](v12);
  v11 = (void *)v10;
  if (!self->_passcodeLockViewState && !v9)
  {
    if (a3 - 9 < 3)
    {
      a3 = 0;
LABEL_5:
      (*(void (**)(uint64_t, unint64_t))(v10 + 16))(v10, a3);
      goto LABEL_6;
    }
    if (a3 < 2)
      goto LABEL_5;
    if (a3 == 4)
    {
      a3 = 12;
      goto LABEL_5;
    }
  }
LABEL_6:
  if (*((_BYTE *)v18 + 24))
  {
    -[SBUIPasscodeBiometricAuthenticationView setGlyphViewState:animated:completion:](self->_biometricAuthenticationView, "setGlyphViewState:animated:completion:", v14[3], v5, v8);
  }
  else if (v8)
  {
    v8[2](v8, 0);
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

}

uint64_t __81__SBUIPasscodeLockViewBase__updateBiometricGlyphForBioEvent_animated_completion___block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a2;
  return result;
}

- (void)_updateBiometricLayout
{
  uint64_t v3;

  if (-[SBUIBiometricResource hasPearlSupport](self->_biometricResource, "hasPearlSupport"))
    v3 = 2;
  else
    v3 = 1;
  -[SBUIPasscodeBiometricAuthenticationView setType:](self->_biometricAuthenticationView, "setType:", v3);
}

- (void)_setStatusStateSwipeToRetryAnimated:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t phoneUnlockWithWatchFailedStatusState;
  SBUIPasscodeLockViewBase *v6;

  v3 = a3;
  if (-[SBUIPasscodeLockViewBase canSuggestSwipeToRetry](self, "canSuggestSwipeToRetry"))
  {
    phoneUnlockWithWatchFailedStatusState = self->_phoneUnlockWithWatchFailedStatusState;
    v6 = self;
    if (!phoneUnlockWithWatchFailedStatusState)
      phoneUnlockWithWatchFailedStatusState = 10;
  }
  else
  {
    v6 = self;
    phoneUnlockWithWatchFailedStatusState = 0;
  }
  -[SBUIPasscodeLockViewBase _setStatusState:animated:](v6, "_setStatusState:animated:", phoneUnlockWithWatchFailedStatusState, v3);
}

- (BOOL)_statusStateShouldNotUpdateForUnsupportedGlassesFeedback:(unint64_t)a3
{
  return a3 == 10 && self->_previousStatusState == 24;
}

- (void)providerLegibilitySettingsChanged:(id)a3
{
  void *v4;
  void *v5;

  -[SBFLegibilitySettingsProvider legibilitySettings](self->_backgroundLegibilitySettingsProvider, "legibilitySettings", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[SBUIPasscodeLockViewBase _setLegibilitySettings:](self, "_setLegibilitySettings:", v4);
    v4 = v5;
  }

}

- (void)biometricResource:(id)a3 matchingEnabledDidChange:(BOOL)a4
{
  dispatch_time_t v5;
  _QWORD v6[5];
  char v7;

  if (a4)
  {
    -[SBUIPasscodeLockViewBase _updateStatusStateForLockoutIfNecessaryAnimatedly:](self, "_updateStatusStateForLockoutIfNecessaryAnimatedly:", 0);
    -[SBUIPasscodeLockViewBase updateStatusTextAnimated:](self, "updateStatusTextAnimated:", 1);
  }
  else
  {
    v5 = dispatch_time(0, 500000000);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __71__SBUIPasscodeLockViewBase_biometricResource_matchingEnabledDidChange___block_invoke;
    v6[3] = &unk_1E4C3E430;
    v6[4] = self;
    v7 = 1;
    dispatch_after(v5, MEMORY[0x1E0C80D38], v6);
  }
}

void __71__SBUIPasscodeLockViewBase_biometricResource_matchingEnabledDidChange___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "updateStatusTextAnimated:", *(unsigned __int8 *)(a1 + 40));
}

- (void)biometricResource:(id)a3 observeEvent:(unint64_t)a4
{
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  dispatch_time_t v16;
  SBUIPasscodeBiometricAuthenticationView *biometricAuthenticationView;
  uint64_t v18;
  SBUIPasscodeLockViewBase *v19;
  uint64_t v20;
  _BOOL4 v21;
  _QWORD v22[5];
  int v23;

  if (-[SBUIPasscodeLockViewBase _canRecognizeBiometricAuthentication](self, "_canRecognizeBiometricAuthentication", a3))
  {
    if (a4 - 9 > 2)
    {
      switch(a4)
      {
        case 0uLL:
          biometricAuthenticationView = self->_biometricAuthenticationView;
          v18 = 0;
          goto LABEL_22;
        case 1uLL:
          biometricAuthenticationView = self->_biometricAuthenticationView;
          v18 = 1;
LABEL_22:
          -[SBUIPasscodeBiometricAuthenticationView setGlyphViewState:](biometricAuthenticationView, "setGlyphViewState:", v18);
          break;
        case 4uLL:
          -[SBUIPasscodeLockViewBase _handleNonPasscodeAuthenticationAndUpdateProudLock](self, "_handleNonPasscodeAuthenticationAndUpdateProudLock");
          break;
        case 5uLL:
        case 6uLL:
        case 7uLL:
        case 8uLL:
        case 0x18uLL:
        case 0x19uLL:
        case 0x1AuLL:
        case 0x21uLL:
          -[SBUIPasscodeLockViewBase _updateStatusTextForBioEvent:animated:](self, "_updateStatusTextForBioEvent:animated:", a4, 1);
          -[SBUIPasscodeLockViewBase _setPasscodeLockViewState:animated:](self, "_setPasscodeLockViewState:animated:", 1, 1);
          -[SBUIPasscodeLockViewBase _proudLockContainerViewControllerToUpdate](self, "_proudLockContainerViewControllerToUpdate");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setAuthenticated:", 0);

          break;
        case 0xDuLL:
          if (!self->_passcodeLockViewState)
            -[SBUIPasscodeLockViewBase _disarmAdvanceToPasscodeTimer](self, "_disarmAdvanceToPasscodeTimer");
          break;
        case 0xFuLL:
          if (!self->_passcodeLockViewState)
            -[SBUIPasscodeLockViewBase _resetForFailedBiometricAttempt](self, "_resetForFailedBiometricAttempt");
          break;
        case 0x15uLL:
          -[SBUIPasscodeLockViewBase noteFaceHasBeenOccluded](self, "noteFaceHasBeenOccluded");
          break;
        case 0x1CuLL:
          -[SBUIPasscodeLockViewBase noteBottomFaceHasBeenOccluded](self, "noteBottomFaceHasBeenOccluded");
          break;
        case 0x1DuLL:
          -[SBUIPasscodeLockViewBase _setAuthenticationViewTypeToFaceIDWithWatch](self, "_setAuthenticationViewTypeToFaceIDWithWatch");
          break;
        case 0x1EuLL:
          v19 = self;
          v20 = 30;
          goto LABEL_33;
        case 0x20uLL:
          v19 = self;
          v20 = 32;
LABEL_33:
          -[SBUIPasscodeLockViewBase _updateStatusTextForBioEvent:animated:](v19, "_updateStatusTextForBioEvent:animated:", v20, 1);
          -[SBUIPasscodeLockViewBase _advanceToPasscodeForMatchFailure:](self, "_advanceToPasscodeForMatchFailure:", 0);
          break;
        default:
          break;
      }
    }
    else
    {
      -[SBUIPasscodeBiometricAuthenticationView setGlyphViewState:](self->_biometricAuthenticationView, "setGlyphViewState:", 0);
      -[SBUIPasscodeLockViewBase _resetForFailedBiometricAttempt](self, "_resetForFailedBiometricAttempt");
      -[SBUIPasscodeLockViewBase _updateStatusTextForBioEvent:animated:](self, "_updateStatusTextForBioEvent:animated:", a4, 1);
    }
    -[SBUIPasscodeLockViewBase _updateBiometricGlyphForBioEvent:animated:completion:](self, "_updateBiometricGlyphForBioEvent:animated:completion:", a4, 1, 0);
    -[SBUIPasscodeLockViewBase _updateProudLockForBioEvent:](self, "_updateProudLockForBioEvent:", a4);
    v21 = -[SBUIPasscodeLockViewBase isBiometricLockedOut](self, "isBiometricLockedOut");
    if (a4 == 4 || v21)
      -[SBUIPoseidonContainerViewController showCoaching:](self->_poseidonContainerViewController, "showCoaching:", 0);
  }
  else if ((a4 & 0xFFFFFFFFFFFFFFFCLL) == 8)
  {
    if (a4 == 11)
LABEL_6:
      -[SBUIPasscodeLockViewBase _setStatusState:](self, "_setStatusState:", 2);
    else
LABEL_14:
      -[SBUIPasscodeLockViewBase _updateStatusTextForBioEvent:animated:](self, "_updateStatusTextForBioEvent:animated:", a4, 0);
  }
  else
  {
    switch(a4)
    {
      case 4uLL:
        if (self->_isBiometricAuthenticationAllowed)
        {
          -[SBUIPasscodeLockViewBase window](self, "window");
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          if (v7)
          {
            SBLogBiometricResource();
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
              -[SBUIPasscodeLockViewBase biometricResource:observeEvent:].cold.1((uint64_t)self, v8, v9, v10, v11, v12, v13, v14);

            self->_pendingBioUnlock = 1;
            v15 = self->_currentPendingBioUnlockToken + 1;
            self->_currentPendingBioUnlockToken = v15;
            v16 = dispatch_time(0, 1000000000);
            v22[0] = MEMORY[0x1E0C809B0];
            v22[1] = 3221225472;
            v22[2] = __59__SBUIPasscodeLockViewBase_biometricResource_observeEvent___block_invoke;
            v22[3] = &unk_1E4C3EB70;
            v22[4] = self;
            v23 = v15;
            dispatch_after(v16, MEMORY[0x1E0C80D38], v22);
          }
        }
        break;
      case 5uLL:
      case 7uLL:
        goto LABEL_14;
      case 6uLL:
        goto LABEL_6;
      default:
        if (a4 <= 0x21 && ((1 << a4) & 0x207000000) != 0)
          goto LABEL_14;
        break;
    }
  }
}

void __59__SBUIPasscodeLockViewBase_biometricResource_observeEvent___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = a1 + 32;
  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 524) == *(_DWORD *)(a1 + 40))
  {
    SBLogBiometricResource();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __59__SBUIPasscodeLockViewBase_biometricResource_observeEvent___block_invoke_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

    *(_BYTE *)(*(_QWORD *)v1 + 521) = 0;
  }
}

- (double)passcodeBiometricAuthenticationViewSideButtonsOffsetFromCenter:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  +[SBUIPasscodeLockNumberPad _inputButtonCircleSize](SBUIPasscodeLockNumberPad, "_inputButtonCircleSize", a3);
  v5 = v4;
  +[SBUIPasscodeLockNumberPad _inputButtonCircleSpacing](SBUIPasscodeLockNumberPad, "_inputButtonCircleSpacing");
  v7 = v6 * 3.0 + v5 * 3.0;
  +[SBUIPasscodeLockNumberPad _inputButtonCircleSpacing](SBUIPasscodeLockNumberPad, "_inputButtonCircleSpacing");
  v9 = v7 + v8 * 3.0;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1
    || -[SBUIPasscodeLockViewBase _isBoundsPortraitOriented](self, "_isBoundsPortraitOriented"))
  {
    return v9 / 3.0;
  }
  else
  {
    return v9 * 0.5;
  }
}

- (double)passcodeBiometricAuthenticationViewNumberPadAncillaryButtonOffsetFromTopOfScreen:(id)a3
{
  SBUIPasscodeLockNumberPad *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = -[SBUIPasscodeLockNumberPad initWithDefaultSizeAndLightStyle:]([SBUIPasscodeLockNumberPad alloc], "initWithDefaultSizeAndLightStyle:", 0);
  -[SBUIPasscodeLockViewBase _numberPadOffsetFromTopOfScreen:](self, "_numberPadOffsetFromTopOfScreen:", v4);
  v6 = v5;
  -[SBUIPasscodeLockNumberPad ancillaryButtonOffset](v4, "ancillaryButtonOffset");
  v8 = v6 + v7;

  return v8;
}

- (void)passcodeBiometricAuthenticationViewUsePasscodeButtonHit:(id)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[SBUIPasscodeBiometricAuthenticationView setAncillaryButtonsVisible:](self->_biometricAuthenticationView, "setAncillaryButtonsVisible:", 0);
  -[SBUIPasscodeBiometricAuthenticationView setFaceIDUsePasscodeButtonVisible:](self->_biometricAuthenticationView, "setFaceIDUsePasscodeButtonVisible:", 0);
  -[SBUIPasscodeLockViewBase _setPasscodeLockViewState:animated:](self, "_setPasscodeLockViewState:animated:", 1, 1);
  -[SBUIPasscodeLockViewBase _disarmAdvanceToPasscodeTimer](self, "_disarmAdvanceToPasscodeTimer");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("SBUIPasscodeLockViewBiometricTransitionToPasscodeReasonKey");
  v7[0] = CFSTR("SBUIPasscodeLockViewBiometricTransitionToPasscodeReasonUserRequested");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("SBUIPasscodeLockViewBiometricTransitionToPasscode"), self, v5);

}

- (void)passcodeBiometricAuthenticationViewCancelButtonHit:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[SBUIPasscodeLockViewBase delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "passcodeLockViewCancelButtonPressed:", self);
      v5 = v7;
    }
  }

}

- (void)passcodeBiometricAuthenticationViewEmergencyCallButtonHit:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[SBUIPasscodeLockViewBase delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "passcodeLockViewEmergencyCallButtonPressed:", self);
      v5 = v7;
    }
  }

}

- (void)phoneUnlockWithWatchControllerAttemptFailed:(id)a3 withError:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  int *v11;
  uint64_t v12;
  unint64_t v13;
  id v14;

  v14 = a4;
  +[SBUIPeriocularController sharedInstance](SBUIPeriocularController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "periocularEnabled");

  v7 = v14;
  if ((v6 & 1) != 0)
    goto LABEL_21;
  v8 = objc_msgSend(v14, "code");
  +[SBUIPhoneUnlockWithWatchController sharedInstance](SBUIPhoneUnlockWithWatchController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "showRawErrorCodes");

  if (v10)
  {
    self->_phoneUnlockWithWatchFailedStatusState = 20;
    v11 = &OBJC_IVAR___SBUIPasscodeLockViewBase__errorCode;
    v12 = v8;
    goto LABEL_19;
  }
  v11 = &OBJC_IVAR___SBUIPasscodeLockViewBase__phoneUnlockWithWatchFailedStatusState;
  v12 = 11;
  if (v8 > 158)
  {
    if (v8 > 203)
    {
      if ((unint64_t)(v8 - 213) < 4)
      {
        v11 = &OBJC_IVAR___SBUIPasscodeLockViewBase__phoneUnlockWithWatchFailedStatusState;
        v12 = 18;
        goto LABEL_19;
      }
      if (v8 == 204)
      {
        v11 = &OBJC_IVAR___SBUIPasscodeLockViewBase__phoneUnlockWithWatchFailedStatusState;
        v12 = 12;
        goto LABEL_19;
      }
    }
    else
    {
      switch(v8)
      {
        case 159:
          goto LABEL_19;
        case 186:
LABEL_18:
          v12 = 19;
          goto LABEL_19;
        case 199:
          v12 = 13;
          goto LABEL_19;
      }
    }
  }
  else
  {
    if (v8 > 113)
    {
      switch(v8)
      {
        case 114:
        case 128:
        case 131:
        case 137:
        case 139:
          goto LABEL_18;
        case 120:
          v12 = 16;
          break;
        case 123:
          v12 = 15;
          break;
        case 124:
          v12 = 17;
          break;
        case 130:
        case 138:
          v12 = 14;
          break;
        case 135:
          goto LABEL_19;
        default:
          goto LABEL_27;
      }
      goto LABEL_19;
    }
    switch(v8)
    {
      case 'e':
        goto LABEL_18;
      case 'f':
        goto LABEL_19;
      case 'g':
        goto LABEL_18;
    }
  }
LABEL_27:
  v12 = 0;
  v11 = &OBJC_IVAR___SBUIPasscodeLockViewBase__phoneUnlockWithWatchFailedStatusState;
LABEL_19:
  *(Class *)((char *)&self->super.super.super.isa + *v11) = (Class)v12;
  -[SBUIPasscodeLockViewBase _advanceToPasscodeForMatchFailure:](self, "_advanceToPasscodeForMatchFailure:", 1);
  v13 = -[SBUIBiometricResource biometricLockoutState](self->_biometricResource, "biometricLockoutState");
  v7 = v14;
  if (!v13)
  {
    -[SBUIPasscodeLockViewBase _resetForFailedBiometricAttempt](self, "_resetForFailedBiometricAttempt");
    v7 = v14;
  }
LABEL_21:

}

- (SBUIPasscodeLockViewDelegate)delegate
{
  return (SBUIPasscodeLockViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showsStatusField
{
  return self->_showsStatusField;
}

- (void)setShowsStatusField:(BOOL)a3
{
  self->_showsStatusField = a3;
}

- (BOOL)usesBiometricPresentation
{
  return self->_usesBiometricPresentation;
}

- (BOOL)allowsAutomaticBiometricPresentationTransition
{
  return self->_allowsAutomaticBiometricPresentationTransition;
}

- (BOOL)showsProudLock
{
  return self->_showsProudLock;
}

- (UIView)poseidonContainerView
{
  return self->_poseidonContainerView;
}

- (SBUIPoseidonContainerViewController)poseidonContainerViewController
{
  return self->_poseidonContainerViewController;
}

- (SBUIProudLockContainerViewController)overrideProudLockContainerViewController
{
  return self->_overrideProudLockContainerViewController;
}

- (double)backgroundAlpha
{
  return self->_backgroundAlpha;
}

- (UIColor)customBackgroundColor
{
  return self->_customBackgroundColor;
}

- (SBUIPasscodeEntryField)_entryField
{
  return self->_entryField;
}

- (void)_setEntryField:(id)a3
{
  objc_storeStrong((id *)&self->_entryField, a3);
}

- (SBFLegibilitySettingsProvider)backgroundLegibilitySettingsProvider
{
  return self->_backgroundLegibilitySettingsProvider;
}

- (double)_luminosityBoost
{
  return self->_luminanceBoost;
}

- (BOOL)isScreenOn
{
  return self->_screenOn;
}

- (BOOL)isBiometricAuthenticationAllowed
{
  return self->_isBiometricAuthenticationAllowed;
}

- (int64_t)passcodeLockViewState
{
  return self->_passcodeLockViewState;
}

- (UIView)passcodeAuthenticationView
{
  return self->_passcodeAuthenticationView;
}

- (void)setPasscodeAuthenticationView:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeAuthenticationView, a3);
}

- (UIView)biometricAuthenticationView
{
  return &self->_biometricAuthenticationView->super.super;
}

- (void)setBiometricAuthenticationView:(id)a3
{
  objc_storeStrong((id *)&self->_biometricAuthenticationView, a3);
}

- (BOOL)confirmedNotInPocket
{
  return self->_confirmedNotInPocket;
}

- (void)setConfirmedNotInPocket:(BOOL)a3
{
  self->_confirmedNotInPocket = a3;
}

- (BOOL)canSuggestSwipeToRetry
{
  return self->_canSuggestSwipeToRetry;
}

- (void)setCanSuggestSwipeToRetry:(BOOL)a3
{
  self->_canSuggestSwipeToRetry = a3;
}

- (BOOL)showsLockIconForFaceID
{
  return self->_showsLockIconForFaceID;
}

- (NSString)overrideFaceIDReason
{
  return self->_overrideFaceIDReason;
}

- (NSString)overridePasscodeButtonTitle
{
  return self->_overridePasscodeButtonTitle;
}

- (BOOL)alwaysShowPasscodeButtonForFaceIDMatchFailure
{
  return self->_alwaysShowPasscodeButtonForFaceIDMatchFailure;
}

- (void)setAlwaysShowPasscodeButtonForFaceIDMatchFailure:(BOOL)a3
{
  self->_alwaysShowPasscodeButtonForFaceIDMatchFailure = a3;
}

- ($20D0CF0D87A8AD096D8C820DF2D4BB3C)proudLockConfiguration
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[9].var12;
  *(_OWORD *)&retstr->var5 = *(_OWORD *)&self[9].var8;
  *(_OWORD *)&retstr->var7 = v3;
  *(_OWORD *)&retstr->var9 = *(_OWORD *)&self[10].var2;
  v4 = *(_OWORD *)&self[9].var6;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[9].var4;
  *(_OWORD *)&retstr->var3 = v4;
  return self;
}

- (SBUIBiometricResource)biometricResource
{
  return self->_biometricResource;
}

- (int)style
{
  return self->_style;
}

- (void)setStyle:(int)a3
{
  self->_style = a3;
}

- (_UIKBFeedbackGenerating)keyboardFeedbackBehavior
{
  return self->_keyboardFeedbackBehavior;
}

- (void)setKeyboardFeedbackBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardFeedbackBehavior, a3);
}

- (BOOL)shouldResetForFailedPasscodeAttempt
{
  return self->_shouldResetForFailedPasscodeAttempt;
}

- (void)setShouldResetForFailedPasscodeAttempt:(BOOL)a3
{
  self->_shouldResetForFailedPasscodeAttempt = a3;
}

- (unint64_t)_statusState
{
  return self->_statusState;
}

- (NSTimer)screenBrightnessChangedTimer
{
  return self->_screenBrightnessChangedTimer;
}

- (void)setScreenBrightnessChangedTimer:(id)a3
{
  objc_storeStrong((id *)&self->_screenBrightnessChangedTimer, a3);
}

- (UINotificationFeedbackGenerator)authenticationFeedbackBehavior
{
  return self->_authenticationFeedbackBehavior;
}

- (void)setAuthenticationFeedbackBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationFeedbackBehavior, a3);
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

- (void)setIsTransitioning:(BOOL)a3
{
  self->_isTransitioning = a3;
}

- ($1D129F7B4C980C50E70029647222EF17)transitionContext
{
  *($1383D3E36CD83AA20A6819E41324702A *)retstr = ($1383D3E36CD83AA20A6819E41324702A)self[30];
  return self;
}

- (void)setTransitionContext:(id *)a3
{
  double var2;

  var2 = a3->var2;
  *(_OWORD *)&self->_transitionContext.fromState = *(_OWORD *)&a3->var0;
  self->_transitionContext.progress = var2;
}

- (NSString)_statusText
{
  return self->_statusText;
}

- (NSString)_statusSubtitleText
{
  return self->_statusSubtitleText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusSubtitleText, 0);
  objc_storeStrong((id *)&self->_statusText, 0);
  objc_storeStrong((id *)&self->_authenticationFeedbackBehavior, 0);
  objc_storeStrong((id *)&self->_screenBrightnessChangedTimer, 0);
  objc_storeStrong((id *)&self->_keyboardFeedbackBehavior, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_storeStrong((id *)&self->_overridePasscodeButtonTitle, 0);
  objc_storeStrong((id *)&self->_overrideFaceIDReason, 0);
  objc_storeStrong((id *)&self->_entryField, 0);
  objc_storeStrong((id *)&self->_poseidonContainerViewController, 0);
  objc_storeStrong((id *)&self->_poseidonContainerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overrideProudLockContainerViewController, 0);
  objc_storeStrong((id *)&self->_proudLockContainerViewController, 0);
  objc_storeStrong((id *)&self->_biometricAuthenticationView, 0);
  objc_storeStrong((id *)&self->_passcodeAuthenticationView, 0);
  objc_storeStrong((id *)&self->_biometricMatchingEnabledOverrideReasons, 0);
  objc_storeStrong((id *)&self->_biometricMatchingAssertion, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_backgroundLegibilitySettingsProvider, 0);
  objc_storeStrong((id *)&self->_customBackgroundColor, 0);
}

- (void)biometricResource:(uint64_t)a3 observeEvent:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A471F000, a2, a3, "Recognizing a pending bio-unlock for passcode view (%p)", a5, a6, a7, a8, 0);
}

void __59__SBUIPasscodeLockViewBase_biometricResource_observeEvent___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A471F000, a2, a3, "Pending bio-unlock expired for passcode view (%p)", a5, a6, a7, a8, 0);
}

@end
