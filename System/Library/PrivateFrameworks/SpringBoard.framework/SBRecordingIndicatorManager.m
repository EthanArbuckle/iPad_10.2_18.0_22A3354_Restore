@implementation SBRecordingIndicatorManager

- (void)_updateRecordingIndicatorForStatusBarChanges
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  SBRecordingIndicatorViewController *recordingIndicatorViewController;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[SBRecordingIndicatorManager displayMode](self, "displayMode");
  if (v3 == 4)
  {
    -[SBRecordingIndicatorManager _updateRecordingIndicatorLocationIfNecessary](self, "_updateRecordingIndicatorLocationIfNecessary");
    return;
  }
  if (v3 == 2 && -[SBRecordingIndicatorManager isIndicatorVisible](self, "isIndicatorVisible"))
  {
    -[UIWindow _sbWindowScene](self->_recordingIndicatorWindow, "_sbWindowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "statusBarManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "isFrontmostStatusBarPartHidden:", 2);
    if (self->_indicatorStatusBarPartIsHidden == v7)
      goto LABEL_14;
    v8 = v7;
    SBLogStatusBarish();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromBOOL();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] indicatorStatusBarPartIsHidden changed from %{public}@ to %{public}@", (uint8_t *)&v14, 0x16u);

    }
    self->_indicatorStatusBarPartIsHidden = v8;
    if (self->_indicatorIsHiddenForControlCenter)
      goto LABEL_14;
    recordingIndicatorViewController = self->_recordingIndicatorViewController;
    if (v8)
    {
      if (-[SBRecordingIndicatorViewController indicatorState](recordingIndicatorViewController, "indicatorState") == 1)
      {
LABEL_14:

        return;
      }
      recordingIndicatorViewController = self->_recordingIndicatorViewController;
      v13 = 1;
    }
    else
    {
      v13 = 0;
    }
    -[SBRecordingIndicatorViewController updateIndicatorVisibilityWithFastFadeAnimation:](recordingIndicatorViewController, "updateIndicatorVisibilityWithFastFadeAnimation:", v13);
    -[SBRecordingIndicatorManager _setIndicatorVisible:atLocation:](self, "_setIndicatorVisible:atLocation:", !v8, 1);
    goto LABEL_14;
  }
}

- (unint64_t)displayMode
{
  return self->_displayMode;
}

- (void)activityDidChangeForSensorActivityDataProvider:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "activeCameraAndMicrophoneActivityAttributions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSSet isEqualToSet:](self->_activeCameraAndMicrophoneActivityAttributions, "isEqualToSet:", v5))
  {
    objc_storeStrong((id *)&self->_activeCameraAndMicrophoneActivityAttributions, v5);
    SBLogStatusBarish();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Active camera/microphone activity changed:\n%{public}@", (uint8_t *)&v7, 0xCu);
    }

    -[SBRecordingIndicatorManager _dataProviderDidUpdate:](self, "_dataProviderDidUpdate:", v4);
  }

}

- (void)_dataProviderDidUpdate:(id)a3
{
  id v5;
  NSObject *v6;
  SBRecordingIndicatorManager *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  _BOOL4 v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  NSTimer *v16;
  NSTimer *minimumTimeOnScreenTimer;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  SBRecordingIndicatorManager *v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_dataProvider, a3);
  if (self->_visibilityIsForcedByPrototypeSettings)
  {
    SBLogStatusBarish();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Visibility is forced by prototype settings", buf, 2u);
    }
    goto LABEL_19;
  }
  objc_msgSend(v5, "activeCameraAndMicrophoneActivityAttributions");
  v6 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject count](v6, "count"))
  {
    -[SBRecordingIndicatorManager _updateIndicatorStyleForSensorActivityAttributions:](self, "_updateIndicatorStyleForSensorActivityAttributions:", v6);
    v7 = self;
    v8 = 1;
LABEL_6:
    -[SBRecordingIndicatorManager setIndicatorVisible:](v7, "setIndicatorVisible:", v8);
    goto LABEL_17;
  }
  if (-[SBRecordingIndicatorManager isIndicatorVisible](self, "isIndicatorVisible"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", self->_indicatorDisplayTime);
    v11 = v10;

    if (v11 <= 2.0)
    {
      v12 = -[NSTimer isValid](self->_minimumTimeOnScreenTimer, "isValid");
      SBLogStatusBarish();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Timer is already valid", buf, 2u);
        }

      }
      else
      {
        if (v14)
        {
          *(_DWORD *)buf = 134349312;
          v25 = 0x4000000000000000;
          v26 = 2050;
          v27 = v11;
          _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Starting a timer to keep the indicator on screen for a minimum of %{public}.2f seconds (elapsed %{public}.2fs)", buf, 0x16u);
        }

        v15 = (void *)MEMORY[0x1E0C99E88];
        v18 = MEMORY[0x1E0C809B0];
        v19 = 3221225472;
        v20 = __54__SBRecordingIndicatorManager__dataProviderDidUpdate___block_invoke;
        v21 = &unk_1E8EA5240;
        v22 = self;
        v23 = v5;
        objc_msgSend(v15, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v18, 2.0 - v11);
        v16 = (NSTimer *)objc_claimAutoreleasedReturnValue();
        minimumTimeOnScreenTimer = self->_minimumTimeOnScreenTimer;
        self->_minimumTimeOnScreenTimer = v16;

      }
      goto LABEL_17;
    }
    v7 = self;
    v8 = 0;
    goto LABEL_6;
  }
LABEL_17:
  if (-[SBRecordingIndicatorManager _supportsStatusBarItem](self, "_supportsStatusBarItem", v18, v19, v20, v21, v22))
    -[SBRecordingIndicatorManager _updateRecordingIndicatorForStatusBarChanges](self, "_updateRecordingIndicatorForStatusBarChanges");
LABEL_19:

}

- (void)setIndicatorVisible:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  NSTimer *minimumTimeOnScreenTimer;
  NSDate *v8;
  NSDate *indicatorDisplayTime;
  unint64_t v10;
  SBRecordingIndicatorManager *v11;
  _BOOL8 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_indicatorVisible != a3)
  {
    v3 = a3;
    self->_indicatorVisible = a3;
    SBLogStatusBarish();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("off");
      if (v3)
        v6 = CFSTR("on");
      v19 = 138543362;
      v20 = v6;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Turning %{public}@...", (uint8_t *)&v19, 0xCu);
    }

    -[NSTimer invalidate](self->_minimumTimeOnScreenTimer, "invalidate");
    minimumTimeOnScreenTimer = self->_minimumTimeOnScreenTimer;
    self->_minimumTimeOnScreenTimer = 0;

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
      indicatorDisplayTime = self->_indicatorDisplayTime;
      self->_indicatorDisplayTime = v8;
    }
    else
    {
      indicatorDisplayTime = self->_indicatorDisplayTime;
      self->_indicatorDisplayTime = 0;
    }

    v10 = -[SBRecordingIndicatorManager displayMode](self, "displayMode");
    if (v10 < 2)
    {
      v11 = self;
      v12 = v3;
      v13 = 0;
    }
    else
    {
      if (v10 - 3 < 2)
      {
        -[SBRecordingIndicatorManager _updateSystemApertureElementAssertion](self, "_updateSystemApertureElementAssertion");
        if (v3)
          -[SBRecordingIndicatorSystemApertureElement pulse](self->_recordingIndicatorElement, "pulse");
        return;
      }
      if (v10 != 2)
        return;
      if (v3)
      {
        -[UIWindow _sbWindowScene](self->_recordingIndicatorWindow, "_sbWindowScene");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "statusBarManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "assertionManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isFrontmostStatusBarHidden");
        v18 = v17 ^ 1;
        -[SBRecordingIndicatorManager _setIndicatorVisible:atLocation:](self, "_setIndicatorVisible:atLocation:", v17, 0);
        -[SBRecordingIndicatorManager _setIndicatorVisible:atLocation:](self, "_setIndicatorVisible:atLocation:", v18, 1);

        return;
      }
      -[SBRecordingIndicatorManager _setIndicatorVisible:atLocation:](self, "_setIndicatorVisible:atLocation:", 0, 0);
      v11 = self;
      v12 = 0;
      v13 = 1;
    }
    -[SBRecordingIndicatorManager _setIndicatorVisible:atLocation:](v11, "_setIndicatorVisible:atLocation:", v12, v13);
  }
}

- (void)_updateIndicatorStyleForSensorActivityAttributions:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9), "sensor", (_QWORD)v10))
          {
            -[SBRecordingIndicatorManager _updateIndicatorViewForSensorType:](self, "_updateIndicatorViewForSensorType:", 0);

            goto LABEL_12;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v7)
          continue;
        break;
      }
    }

    -[SBRecordingIndicatorManager _updateIndicatorViewForSensorType:](self, "_updateIndicatorViewForSensorType:", 1);
  }
LABEL_12:

}

- (void)_updateIndicatorViewForSensorType:(int64_t)a3
{
  unint64_t v5;
  void *v6;
  id v7;

  v5 = -[SBRecordingIndicatorManager _indicatorTypeForSensorType:](self, "_indicatorTypeForSensorType:");
  -[SBRecordingIndicatorViewController updateIndicatorType:](self->_recordingIndicatorViewController, "updateIndicatorType:", v5);
  -[SBRecordingIndicatorViewController updateIndicatorType:](self->_recordingIndicatorViewControllerUIKitStatusBarPortal, "updateIndicatorType:", v5);
  -[SBRecordingIndicatorViewController updateIndicatorType:](self->_recordingIndicatorViewControllerSystemAperturePortal, "updateIndicatorType:", v5);
  -[SBRecordingIndicatorManager _indicatorIdentifierForSensorType:](self, "_indicatorIdentifierForSensorType:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SBRecordingIndicatorViewController indicatorView](self->_recordingIndicatorViewController, "indicatorView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", v7);

}

- (BOOL)_supportsStatusBarItem
{
  return ((-[SBRecordingIndicatorManager displayMode](self, "displayMode") - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (unint64_t)_indicatorTypeForSensorType:(int64_t)a3
{
  if (a3 != 1)
    return 0;
  if (UIAccessibilityShouldDifferentiateWithoutColor())
    return 2;
  return 1;
}

- (id)_indicatorIdentifierForSensorType:(int64_t)a3
{
  if (a3 == 1)
    return CFSTR("microphone-recording-indicator");
  else
    return CFSTR("camera-recording-indicator");
}

- (void)recordingIndicatorViewController:(id)a3 didUpdateIndicatorState:(unint64_t)a4
{
  SBRecordingIndicatorViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  SBRecordingIndicatorViewController *v12;

  v5 = (SBRecordingIndicatorViewController *)a3;
  v12 = v5;
  if (self->_recordingIndicatorViewControllerSystemAperturePortal == v5)
  {
    -[SBRecordingIndicatorManager _updateSystemApertureElementAssertion](self, "_updateSystemApertureElementAssertion");
    v5 = v12;
  }
  -[SBRecordingIndicatorViewController viewIfLoaded](v5, "viewIfLoaded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_backlightLuminance");

  if (v10 == 1)
  {
    objc_msgSend(v8, "_backlightSceneEnvironment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidateAllTimelinesForReason:", CFSTR("recording indicator visibility change"));

  }
}

- (void)_updateSystemApertureElementAssertion
{
  _BOOL4 v3;
  unint64_t v4;
  int v5;
  NSObject *v7;
  void *recordingIndicatorElementAssertion;
  NSObject *v9;
  SAInvalidatable *v10;
  SAInvalidatable *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = -[SBRecordingIndicatorManager isIndicatorVisible](self, "isIndicatorVisible");
  v4 = -[SBRecordingIndicatorViewController indicatorState](self->_recordingIndicatorViewControllerSystemAperturePortal, "indicatorState");
  v5 = -[SAInvalidatable isValid](self->_recordingIndicatorElementAssertion, "isValid");
  if (!v3 && !v4 && v5 != 0)
  {
    SBLogStatusBarish();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Invalidating SystemAperture element", buf, 2u);
    }

    -[SAInvalidatable invalidateWithReason:](self->_recordingIndicatorElementAssertion, "invalidateWithReason:", CFSTR("SBRecordingIndicatorViewController isIndicatorIdleAndOff changed"));
    recordingIndicatorElementAssertion = self->_recordingIndicatorElementAssertion;
    self->_recordingIndicatorElementAssertion = 0;
LABEL_13:

    goto LABEL_14;
  }
  if (((v5 | !v3) & 1) == 0)
  {
    SBLogStatusBarish();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Registering SystemAperture element", v12, 2u);
    }

    objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
    recordingIndicatorElementAssertion = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(recordingIndicatorElementAssertion, "registerElement:", self->_recordingIndicatorElement);
    v10 = (SAInvalidatable *)objc_claimAutoreleasedReturnValue();
    v11 = self->_recordingIndicatorElementAssertion;
    self->_recordingIndicatorElementAssertion = v10;

    goto LABEL_13;
  }
LABEL_14:
  -[SBRecordingIndicatorManager _updateRecordingIndicatorLocationIfNecessary](self, "_updateRecordingIndicatorLocationIfNecessary");
}

- (void)_updateRecordingIndicatorLocationIfNecessary
{
  SBRecordingIndicatorManager *v3;
  uint64_t v4;
  SBRecordingIndicatorManager *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  if (!-[SBRecordingIndicatorManager isIndicatorVisible](self, "isIndicatorVisible"))
  {
    v5 = self;
    v6 = 0;
LABEL_9:
    -[SBRecordingIndicatorManager _setIndicatorVisible:atLocation:](v5, "_setIndicatorVisible:atLocation:", v6, 0);
    -[SBRecordingIndicatorManager _setIndicatorVisible:atLocation:](self, "_setIndicatorVisible:atLocation:", 0, 1);
    v3 = self;
    v4 = 0;
    goto LABEL_10;
  }
  if (-[SBRecordingIndicatorManager isSystemApertureEmpty](self, "isSystemApertureEmpty")
    && self->_canSystemApertureRegisterRecordingIndicatorElement)
  {
    -[SBRecordingIndicatorManager _setIndicatorVisible:atLocation:](self, "_setIndicatorVisible:atLocation:", 0, 0);
    -[SBRecordingIndicatorManager _setIndicatorVisible:atLocation:](self, "_setIndicatorVisible:atLocation:", 0, 1);
    v3 = self;
    v4 = 1;
LABEL_10:
    -[SBRecordingIndicatorManager _setIndicatorVisible:atLocation:](v3, "_setIndicatorVisible:atLocation:", v4, 2);
    return;
  }
  v7 = -[SBRecordingIndicatorManager displayMode](self, "displayMode");
  if (v7 != 4)
  {
    if (v7 != 3)
      return;
    v5 = self;
    v6 = 1;
    goto LABEL_9;
  }
  -[UIWindow _sbWindowScene](self->_recordingIndicatorWindow, "_sbWindowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "statusBarManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertionManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v8) = objc_msgSend(v11, "isFrontmostStatusBarPartHidden:", 2);
  v10 = (v8 | -[SBRecordingIndicatorManager systemApertureIsSoLargeThatTheStatusBarIsProbablyHidden](self, "systemApertureIsSoLargeThatTheStatusBarIsProbablyHidden")) ^ 1;
  -[SBRecordingIndicatorManager _setIndicatorVisible:atLocation:](self, "_setIndicatorVisible:atLocation:");
  -[SBRecordingIndicatorManager _setIndicatorVisible:atLocation:](self, "_setIndicatorVisible:atLocation:", v10, 1);
  -[SBRecordingIndicatorManager _setIndicatorVisible:atLocation:](self, "_setIndicatorVisible:atLocation:", 0, 2);

}

- (void)_setIndicatorVisible:(BOOL)a3 atLocation:(unint64_t)a4
{
  _BOOL4 v4;
  unint64_t v6;
  SBRecordingIndicatorViewController *recordingIndicatorViewController;
  unint64_t v8;
  uint64_t v9;
  BOOL v10;

  v4 = a3;
  if (a4 != 2)
  {
    if (a4 == 1)
    {
      -[SBRecordingIndicatorManager setIndicatorVisibleAtStatusBarLocation:](self, "setIndicatorVisibleAtStatusBarLocation:", a3);
      return;
    }
    if (a4)
      return;
    v6 = -[SBRecordingIndicatorViewController indicatorState](self->_recordingIndicatorViewController, "indicatorState");
    if (v4)
    {
      if (v6 - 1 >= 2)
      {
        recordingIndicatorViewController = self->_recordingIndicatorViewController;
LABEL_10:
        v9 = 1;
LABEL_22:
        -[SBRecordingIndicatorViewController updateIndicatorVisibility:](recordingIndicatorViewController, "updateIndicatorVisibility:", v9);
        return;
      }
      return;
    }
    if (!v6 || v6 == 3)
      return;
    recordingIndicatorViewController = self->_recordingIndicatorViewController;
LABEL_21:
    v9 = 0;
    goto LABEL_22;
  }
  v8 = -[SBRecordingIndicatorViewController indicatorState](self->_recordingIndicatorViewControllerSystemAperturePortal, "indicatorState");
  if (!v4)
  {
    if (v8)
      v10 = v8 == 3;
    else
      v10 = 1;
    if (v10)
      return;
    recordingIndicatorViewController = self->_recordingIndicatorViewControllerSystemAperturePortal;
    goto LABEL_21;
  }
  if (v8 - 1 >= 2)
  {
    recordingIndicatorViewController = self->_recordingIndicatorViewControllerSystemAperturePortal;
    goto LABEL_10;
  }
}

- (BOOL)isIndicatorVisible
{
  return self->_indicatorVisible;
}

- (void)setIndicatorVisibleAtStatusBarLocation:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_indicatorVisibleAtStatusBarLocation != a3)
  {
    v3 = a3;
    self->_indicatorVisibleAtStatusBarLocation = a3;
    SBLogStatusBarish();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = CFSTR("off");
      if (v3)
        v5 = CFSTR("on");
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Turning %{public}@ at Status Bar location (via status bar data change)", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend((id)SBApp, "statusBarStateAggregator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateStatusBarItem:", 28);

  }
}

- (BOOL)isSystemApertureEmpty
{
  return self->_systemApertureEmpty;
}

- (SBRecordingIndicatorManager)initWithWindowScene:(id)a3
{
  id v4;
  SBRecordingIndicatorManager *v5;
  SBRecordingIndicatorManager *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBRecordingIndicatorManager;
  v5 = -[SBRecordingIndicatorManager init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_windowScene, v4);
    if (objc_msgSend((id)objc_opt_class(), "_supportsSecureIndicator")
      && objc_msgSend(v4, "isMainDisplayWindowScene"))
    {
      v7 = SBFEffectiveArtworkSubtype();
      if (v7 > 2795)
      {
        if (v7 != 2796 && v7 != 2868)
          goto LABEL_22;
      }
      else if (v7 != 2556 && v7 != 2622)
      {
LABEL_22:
        v6->_displayMode = 1;
        -[SBRecordingIndicatorManager _createRecordingIndicatorForStandaloneLocation](v6, "_createRecordingIndicatorForStandaloneLocation");
        -[SBRecordingIndicatorManager _createRecordingIndicatorForSecureIndicator](v6, "_createRecordingIndicatorForSecureIndicator");
        goto LABEL_26;
      }
LABEL_25:
      v6->_displayMode = 3;
      -[SBRecordingIndicatorManager _createRecordingIndicatorForStandaloneLocation](v6, "_createRecordingIndicatorForStandaloneLocation");
      -[SBRecordingIndicatorManager _createRecordingIndicatorForSystemApertureLocation](v6, "_createRecordingIndicatorForSystemApertureLocation");
      goto LABEL_26;
    }
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() == 2 || SBFEffectiveHomeButtonType() != 2)
        goto LABEL_19;
LABEL_15:
      v10 = SBFEffectiveArtworkSubtype();
      if (v10 > 2795)
      {
        if (v10 == 2796 || v10 == 2868)
          goto LABEL_25;
      }
      else if (v10 == 2556 || v10 == 2622)
      {
        goto LABEL_25;
      }
      v6->_displayMode = 0;
      -[SBRecordingIndicatorManager _createRecordingIndicatorForStandaloneLocation](v6, "_createRecordingIndicatorForStandaloneLocation");
      goto LABEL_26;
    }
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "userInterfaceIdiom") == 1)
    {

    }
    else
    {
      v9 = SBFEffectiveHomeButtonType();

      if (v9 == 2)
        goto LABEL_15;
    }
LABEL_19:
    v6->_displayMode = 2;
    -[SBRecordingIndicatorManager _createRecordingIndicatorForStandaloneLocation](v6, "_createRecordingIndicatorForStandaloneLocation");
    -[SBRecordingIndicatorManager _createRecordingIndicatorForStatusBarLocation](v6, "_createRecordingIndicatorForStatusBarLocation");
LABEL_26:
    objc_msgSend((id)SBApp, "sensorActivityDataProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:", v6);
    +[SBRecordingIndicatorDomain rootSettings](SBRecordingIndicatorDomain, "rootSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addKeyObserver:", v6);

    -[UIWindow _sbWindowScene](v6->_recordingIndicatorWindow, "_sbWindowScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "statusBarManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "assertionManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:", v6);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v6, sel_controlCenterWillPresent_, CFSTR("SBControlCenterControllerWillPresentNotification"), 0);
    objc_msgSend(v16, "addObserver:selector:name:object:", v6, sel_controlCenterDidDismiss_, CFSTR("SBControlCenterControllerDidDismissNotification"), 0);
    objc_msgSend(v16, "addObserver:selector:name:object:", v6, sel_systemApertureLayoutDidChange_, CFSTR("SBSystemApertureLayoutDidChangeNotification"), 0);
    objc_msgSend(v16, "addObserver:selector:name:object:", v6, sel_differentiateWithoutColorDidChange_, *MEMORY[0x1E0CEB0B8], 0);
    -[SBRecordingIndicatorManager activityDidChangeForSensorActivityDataProvider:](v6, "activityDidChangeForSensorActivityDataProvider:", v11);

  }
  return v6;
}

- (void)_createRecordingIndicatorForStandaloneLocation
{
  SBRecordingIndicatorWindow *v3;
  SBRecordingIndicatorViewController *v4;
  SBRecordingIndicatorViewController *recordingIndicatorViewController;
  UIWindow *recordingIndicatorWindow;
  SBRecordingIndicatorWindow *v7;
  void *v8;
  id v9;

  -[SBRecordingIndicatorManager windowScene](self, "windowScene");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[SBRecordingIndicatorWindow initWithWindowScene:debugName:]([SBRecordingIndicatorWindow alloc], "initWithWindowScene:debugName:", v9, CFSTR("Recording Indicator"));
  v4 = -[SBRecordingIndicatorViewController initForLocation:windowScene:]([SBRecordingIndicatorViewController alloc], "initForLocation:windowScene:", 0, v9);
  recordingIndicatorViewController = self->_recordingIndicatorViewController;
  self->_recordingIndicatorViewController = v4;

  -[SBRecordingIndicatorWindow setRootViewController:](v3, "setRootViewController:", self->_recordingIndicatorViewController);
  -[SBRecordingIndicatorWindow setWindowLevel:](v3, "setWindowLevel:", *MEMORY[0x1E0CEBB98] + 10.0);
  -[SBRecordingIndicatorWindow setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  -[SBWindow setHidden:](v3, "setHidden:", 0);
  recordingIndicatorWindow = self->_recordingIndicatorWindow;
  self->_recordingIndicatorWindow = &v3->super.super.super.super.super;
  v7 = v3;

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ignoreWindowForReachability:", self->_recordingIndicatorWindow);

  -[SBRecordingIndicatorViewController setDelegate:](self->_recordingIndicatorViewController, "setDelegate:", self);
}

- (void)_createRecordingIndicatorForStatusBarLocation
{
  SBRecordingIndicatorWindow *v3;
  SBRecordingIndicatorViewController *v4;
  SBRecordingIndicatorViewController *recordingIndicatorViewControllerUIKitStatusBarPortal;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[SBRecordingIndicatorManager windowScene](self, "windowScene");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[SBRecordingIndicatorWindow initWithWindowScene:debugName:]([SBRecordingIndicatorWindow alloc], "initWithWindowScene:debugName:", v9, CFSTR("Recording Indicator (UIKit Status Bar Portal)"));
  v4 = -[SBRecordingIndicatorViewController initForLocation:windowScene:]([SBRecordingIndicatorViewController alloc], "initForLocation:windowScene:", 1, v9);
  recordingIndicatorViewControllerUIKitStatusBarPortal = self->_recordingIndicatorViewControllerUIKitStatusBarPortal;
  self->_recordingIndicatorViewControllerUIKitStatusBarPortal = v4;

  -[SBRecordingIndicatorWindow setRootViewController:](v3, "setRootViewController:", self->_recordingIndicatorViewControllerUIKitStatusBarPortal);
  -[SBRecordingIndicatorWindow setWindowLevel:](v3, "setWindowLevel:", *MEMORY[0x1E0CEBE28] + -1.0);
  -[SBRecordingIndicatorWindow setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  -[SBWindow setHidden:](v3, "setHidden:", 0);
  objc_storeStrong((id *)&self->_recordingIndicatorWindowUIKitStatusBarPortal, v3);
  SBStatusBarIsSpeakeasy();
  v6 = (void *)objc_opt_class();
  -[SBRecordingIndicatorViewController indicatorView](self->_recordingIndicatorViewControllerUIKitStatusBarPortal, "indicatorView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "screen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerSensorActivityIndicator:forScreen:", v7, v8);
  -[SBRecordingIndicatorViewController setDelegate:](self->_recordingIndicatorViewControllerUIKitStatusBarPortal, "setDelegate:", self);
  -[SBRecordingIndicatorManager _configureSupportForRotatingIndicator]((uint64_t)self);

}

- (uint64_t)_configureSupportForRotatingIndicator
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    objc_msgSend((id)SBApp, "addActiveOrientationObserver:", result);
    return objc_msgSend(*(id *)(v1 + 32), "setActiveInterfaceOrientation:withDuration:", objc_msgSend((id)SBApp, "activeInterfaceOrientation"), 0.0);
  }
  return result;
}

- (void)_createRecordingIndicatorForSystemApertureLocation
{
  SBRecordingIndicatorWindow *v3;
  SBRecordingIndicatorViewController *v4;
  SBRecordingIndicatorViewController *recordingIndicatorViewControllerSystemAperturePortal;
  UIWindow *recordingIndicatorWindowSystemAperturePortal;
  SBRecordingIndicatorWindow *v7;
  void *v8;
  void *v9;
  SBRecordingIndicatorSystemApertureElement *v10;
  SBRecordingIndicatorSystemApertureElement *recordingIndicatorElement;
  id v12;

  -[SBRecordingIndicatorManager windowScene](self, "windowScene");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[SBRecordingIndicatorWindow initWithWindowScene:debugName:]([SBRecordingIndicatorWindow alloc], "initWithWindowScene:debugName:", v12, CFSTR("Recording Indicator (SystemAperture Portal)"));
  v4 = -[SBRecordingIndicatorViewController initForLocation:windowScene:]([SBRecordingIndicatorViewController alloc], "initForLocation:windowScene:", 2, v12);
  recordingIndicatorViewControllerSystemAperturePortal = self->_recordingIndicatorViewControllerSystemAperturePortal;
  self->_recordingIndicatorViewControllerSystemAperturePortal = v4;

  -[SBRecordingIndicatorWindow setRootViewController:](v3, "setRootViewController:", self->_recordingIndicatorViewControllerSystemAperturePortal);
  -[SBRecordingIndicatorWindow setWindowLevel:](v3, "setWindowLevel:", *MEMORY[0x1E0CEBB98] + 5.0);
  -[SBRecordingIndicatorWindow setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  -[SBWindow setHidden:](v3, "setHidden:", 0);
  recordingIndicatorWindowSystemAperturePortal = self->_recordingIndicatorWindowSystemAperturePortal;
  self->_recordingIndicatorWindowSystemAperturePortal = &v3->super.super.super.super.super;
  v7 = v3;

  -[SBRecordingIndicatorViewController indicatorContainerView](self->_recordingIndicatorViewControllerSystemAperturePortal, "indicatorContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAE58]), "initWithSourceView:", v8);
  objc_msgSend(v9, "setMatchesAlpha:", 1);
  v10 = -[SBRecordingIndicatorSystemApertureElement initWithRecordingIndicatorView:recordingIndicatorManager:]([SBRecordingIndicatorSystemApertureElement alloc], "initWithRecordingIndicatorView:recordingIndicatorManager:", v9, self);
  recordingIndicatorElement = self->_recordingIndicatorElement;
  self->_recordingIndicatorElement = v10;

  -[SBRecordingIndicatorViewController setDelegate:](self->_recordingIndicatorViewControllerSystemAperturePortal, "setDelegate:", self);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[SAInvalidatable invalidateWithReason:](self->_recordingIndicatorElementAssertion, "invalidateWithReason:", CFSTR("dealloc"));
  -[SBSensorActivityDataProvider removeObserver:](self->_dataProvider, "removeObserver:", self);
  +[SBRecordingIndicatorDomain rootSettings](SBRecordingIndicatorDomain, "rootSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeKeyObserver:", self);

  -[UIWindow _sbWindowScene](self->_recordingIndicatorWindow, "_sbWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusBarManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  v8.receiver = self;
  v8.super_class = (Class)SBRecordingIndicatorManager;
  -[SBRecordingIndicatorManager dealloc](&v8, sel_dealloc);
}

uint64_t __54__SBRecordingIndicatorManager__dataProviderDidUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dataProviderDidUpdate:", *(_QWORD *)(a1 + 40));
}

+ (BOOL)_supportsSecureIndicator
{
  if (_supportsSecureIndicator_onceToken != -1)
    dispatch_once(&_supportsSecureIndicator_onceToken, &__block_literal_global_48);
  return _supportsSecureIndicator_supportsSecureIndicator;
}

uint64_t __55__SBRecordingIndicatorManager__supportsSecureIndicator__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  _supportsSecureIndicator_supportsSecureIndicator = result;
  return result;
}

- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5
{
  -[SBRecordingIndicatorViewController setActiveInterfaceOrientation:withDuration:](self->_recordingIndicatorViewController, "setActiveInterfaceOrientation:withDuration:", a3, a5, a4);
}

- (void)controlCenterWillPresent:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (-[SBRecordingIndicatorManager displayMode](self, "displayMode", a3) == 2)
  {
    if (-[SBRecordingIndicatorManager isIndicatorVisible](self, "isIndicatorVisible")
      && self->_indicatorStatusBarPartIsHidden)
    {
      SBLogStatusBarish();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Now hiding for Control Center", v5, 2u);
      }

      -[SBRecordingIndicatorViewController updateIndicatorVisibilityWithFastFadeAnimation:](self->_recordingIndicatorViewController, "updateIndicatorVisibilityWithFastFadeAnimation:", 0);
    }
    self->_indicatorIsHiddenForControlCenter = 1;
  }
}

- (void)controlCenterDidDismiss:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (-[SBRecordingIndicatorManager displayMode](self, "displayMode", a3) == 2)
  {
    if (-[SBRecordingIndicatorManager isIndicatorVisible](self, "isIndicatorVisible")
      && self->_indicatorStatusBarPartIsHidden)
    {
      SBLogStatusBarish();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] No longer hiding for Control Center", v5, 2u);
      }

      -[SBRecordingIndicatorViewController updateIndicatorVisibilityWithFastFadeAnimation:](self->_recordingIndicatorViewController, "updateIndicatorVisibilityWithFastFadeAnimation:", 1);
    }
    self->_indicatorIsHiddenForControlCenter = 0;
  }
}

- (void)systemApertureLayoutDidChange:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  objc_msgSend(a3, "userInfo");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("SBSystemApertureOriginatingDisplayIdentity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "_sbDisplayConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    objc_msgSend(v17, "objectForKey:", CFSTR("SBSystemApertureVisibleElementIdentifiers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = objc_msgSend(v8, "count") == 0;
    else
      v10 = 1;
    -[SBRecordingIndicatorManager setSystemApertureEmpty:](self, "setSystemApertureEmpty:", v10);
    objc_msgSend(v17, "objectForKey:", CFSTR("SBSystemApertureCanRegisterRecordingIndicator"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    -[SBRecordingIndicatorManager setCanSystemApertureRegisterRecordingIndicatorElement:](self, "setCanSystemApertureRegisterRecordingIndicatorElement:", v12);
    v13 = -[SBRecordingIndicatorManager displayMode](self, "displayMode");
    if (v13 == 4)
    {
      objc_msgSend(v17, "objectForKey:", CFSTR("SBSystemApertureFrames"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "count"))
      {
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "CGRectValue");
        v16 = BSFloatGreaterThanFloat();
        if (self->_systemApertureIsSoLargeThatTheStatusBarIsProbablyHidden != (_DWORD)v16)
        {
          -[SBRecordingIndicatorManager setSystemApertureIsSoLargeThatTheStatusBarIsProbablyHidden:](self, "setSystemApertureIsSoLargeThatTheStatusBarIsProbablyHidden:", v16);
          -[SBRecordingIndicatorManager _updateRecordingIndicatorLocationIfNecessary](self, "_updateRecordingIndicatorLocationIfNecessary");
        }

      }
    }
    else if (v13 == 3)
    {
      -[SBRecordingIndicatorManager _updateRecordingIndicatorLocationIfNecessary](self, "_updateRecordingIndicatorLocationIfNecessary");
    }

  }
}

- (void)differentiateWithoutColorDidChange:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  SBLogStatusBarish();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Received UIAccessibility setting differentiateWithoutColorDidChange notification, simulating Recording Indicator UI updates...", v5, 2u);
  }

  -[SBRecordingIndicatorManager _dataProviderDidUpdate:](self, "_dataProviderDidUpdate:", self->_dataProvider);
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  void *v5;
  uint64_t v6;
  SBRecordingIndicatorManager *v7;
  uint64_t v8;

  +[SBRecordingIndicatorDomain rootSettings](SBRecordingIndicatorDomain, "rootSettings", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sensorType");

  if (v6 == 1)
  {
    self->_visibilityIsForcedByPrototypeSettings = 1;
    -[SBRecordingIndicatorManager setIndicatorVisible:](self, "setIndicatorVisible:", 1);
    v7 = self;
    v8 = 0;
    goto LABEL_5;
  }
  if (v6 == 2)
  {
    self->_visibilityIsForcedByPrototypeSettings = 1;
    -[SBRecordingIndicatorManager setIndicatorVisible:](self, "setIndicatorVisible:", 1);
    v7 = self;
    v8 = 1;
LABEL_5:
    -[SBRecordingIndicatorManager _updateIndicatorViewForSensorType:](v7, "_updateIndicatorViewForSensorType:", v8);
    return;
  }
  self->_visibilityIsForcedByPrototypeSettings = 0;
  -[SBRecordingIndicatorManager setIndicatorVisible:](self, "setIndicatorVisible:", 0);
}

- (BOOL)isIndicatorVisibleAtStatusBarLocation
{
  return self->_indicatorVisibleAtStatusBarLocation;
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void)setWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (NSSet)activeCameraAndMicrophoneActivityAttributions
{
  return self->_activeCameraAndMicrophoneActivityAttributions;
}

- (void)setActiveCameraAndMicrophoneActivityAttributions:(id)a3
{
  objc_storeStrong((id *)&self->_activeCameraAndMicrophoneActivityAttributions, a3);
}

- (SBRecordingIndicatorSystemApertureElement)recordingIndicatorElement
{
  return self->_recordingIndicatorElement;
}

- (void)setRecordingIndicatorElement:(id)a3
{
  objc_storeStrong((id *)&self->_recordingIndicatorElement, a3);
}

- (SAInvalidatable)recordingIndicatorElementAssertion
{
  return self->_recordingIndicatorElementAssertion;
}

- (void)setRecordingIndicatorElementAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_recordingIndicatorElementAssertion, a3);
}

- (BOOL)systemApertureIsSoLargeThatTheStatusBarIsProbablyHidden
{
  return self->_systemApertureIsSoLargeThatTheStatusBarIsProbablyHidden;
}

- (void)setSystemApertureIsSoLargeThatTheStatusBarIsProbablyHidden:(BOOL)a3
{
  self->_systemApertureIsSoLargeThatTheStatusBarIsProbablyHidden = a3;
}

- (void)setSystemApertureEmpty:(BOOL)a3
{
  self->_systemApertureEmpty = a3;
}

- (BOOL)canSystemApertureRegisterRecordingIndicatorElement
{
  return self->_canSystemApertureRegisterRecordingIndicatorElement;
}

- (void)setCanSystemApertureRegisterRecordingIndicatorElement:(BOOL)a3
{
  self->_canSystemApertureRegisterRecordingIndicatorElement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingIndicatorElementAssertion, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorElement, 0);
  objc_storeStrong((id *)&self->_activeCameraAndMicrophoneActivityAttributions, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_minimumTimeOnScreenTimer, 0);
  objc_storeStrong((id *)&self->_indicatorDisplayTime, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorViewControllerSystemAperturePortal, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorViewControllerUIKitStatusBarPortal, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorViewController, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorWindowSystemAperturePortal, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorWindowUIKitStatusBarPortal, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorWindow, 0);
}

@end
