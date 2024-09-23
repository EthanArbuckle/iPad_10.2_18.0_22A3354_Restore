@implementation SBHomeHardwareButton

- (SBHomeHardwareButton)initWithScreenshotGestureRecognizer:(id)a3 homeButtonType:(int64_t)a4
{
  id v6;
  id v7;
  SBHomeHardwareButtonGestureRecognizerConfiguration *v8;
  void *v9;
  SBHBInitialPressDownGestureRecognizer *v10;
  SBHBInitialPressUpGestureRecognizer *v11;
  SBHBSinglePressUpGestureRecognizer *v12;
  SBHBAcceleratedSinglePressUpGestureRecognizer *v13;
  SBHBLongPressGestureRecognizer *v14;
  SBHBDoublePressDownGestureRecognizer *v15;
  SBHBDoublePressUpGestureRecognizer *v16;
  SBHBTriplePressUpGestureRecognizer *v17;
  SBHBDoubleTapUpGestureRecognizer *v18;
  SBHomeHardwareButton *v19;

  v6 = a3;
  v7 = -[SBHomeHardwareButtonActions initWitHomeButtonType:]([SBHomeHardwareButtonActions alloc], "initWitHomeButtonType:", a4);
  v8 = objc_alloc_init(SBHomeHardwareButtonGestureRecognizerConfiguration);
  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeHardwareButtonGestureRecognizerConfiguration setSystemGestureManager:](v8, "setSystemGestureManager:", v9);

  v10 = -[UIHBClickGestureRecognizer initWithTarget:action:]([SBHBInitialPressDownGestureRecognizer alloc], "initWithTarget:action:", 0, 0);
  -[SBHomeHardwareButtonGestureRecognizerConfiguration setInitialButtonDownGestureRecognizer:](v8, "setInitialButtonDownGestureRecognizer:", v10);

  v11 = -[UIHBClickGestureRecognizer initWithTarget:action:]([SBHBInitialPressUpGestureRecognizer alloc], "initWithTarget:action:", 0, 0);
  -[SBHomeHardwareButtonGestureRecognizerConfiguration setInitialButtonUpGestureRecognizer:](v8, "setInitialButtonUpGestureRecognizer:", v11);

  v12 = -[UIHBClickGestureRecognizer initWithTarget:action:]([SBHBSinglePressUpGestureRecognizer alloc], "initWithTarget:action:", 0, 0);
  -[SBHomeHardwareButtonGestureRecognizerConfiguration setSinglePressUpGestureRecognizer:](v8, "setSinglePressUpGestureRecognizer:", v12);

  v13 = -[UIHBClickGestureRecognizer initWithTarget:action:]([SBHBAcceleratedSinglePressUpGestureRecognizer alloc], "initWithTarget:action:", 0, 0);
  -[SBHomeHardwareButtonGestureRecognizerConfiguration setAcceleratedSinglePressUpGestureRecognizer:](v8, "setAcceleratedSinglePressUpGestureRecognizer:", v13);

  v14 = -[UIHBLongClickGestureRecognizer initWithTarget:action:]([SBHBLongPressGestureRecognizer alloc], "initWithTarget:action:", 0, 0);
  -[SBHomeHardwareButtonGestureRecognizerConfiguration setLongPressGestureRecognizer:](v8, "setLongPressGestureRecognizer:", v14);

  v15 = -[UIHBClickGestureRecognizer initWithTarget:action:]([SBHBDoublePressDownGestureRecognizer alloc], "initWithTarget:action:", 0, 0);
  -[SBHomeHardwareButtonGestureRecognizerConfiguration setDoublePressDownGestureRecognizer:](v8, "setDoublePressDownGestureRecognizer:", v15);

  v16 = -[UIHBClickGestureRecognizer initWithTarget:action:]([SBHBDoublePressUpGestureRecognizer alloc], "initWithTarget:action:", 0, 0);
  -[SBHomeHardwareButtonGestureRecognizerConfiguration setDoublePressUpGestureRecognizer:](v8, "setDoublePressUpGestureRecognizer:", v16);

  v17 = -[UIHBClickGestureRecognizer initWithTarget:action:]([SBHBTriplePressUpGestureRecognizer alloc], "initWithTarget:action:", 0, 0);
  -[SBHomeHardwareButtonGestureRecognizerConfiguration setTriplePressUpGestureRecognizer:](v8, "setTriplePressUpGestureRecognizer:", v17);

  v18 = -[UIHBClickGestureRecognizer initWithTarget:action:]([SBHBDoubleTapUpGestureRecognizer alloc], "initWithTarget:action:", 0, 0);
  -[SBHomeHardwareButtonGestureRecognizerConfiguration setDoubleTapUpGestureRecognizer:](v8, "setDoubleTapUpGestureRecognizer:", v18);

  v19 = -[SBHomeHardwareButton initWithScreenshotGestureRecognizer:homeButtonType:buttonActions:gestureRecognizerConfiguration:](self, "initWithScreenshotGestureRecognizer:homeButtonType:buttonActions:gestureRecognizerConfiguration:", v6, a4, v7, v8);
  return v19;
}

- (SBHomeHardwareButton)initWithScreenshotGestureRecognizer:(id)a3 homeButtonType:(int64_t)a4 buttonActions:(id)a5 gestureRecognizerConfiguration:(id)a6
{
  id v10;
  id v11;
  id v12;
  SBHomeHardwareButton *v13;
  SBHomeHardwareButton *v14;
  uint64_t v15;
  SBHardwareButtonGestureParameters *buttonGestureParameters;
  NSMutableSet *v17;
  NSMutableSet *hintSuppressionAssertions;
  objc_super v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SBHomeHardwareButton;
  v13 = -[SBHomeHardwareButton init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_screenshotGestureRecognizer, v10);
    v14->_homeButtonType = a4;
    -[SBHomeHardwareButton _createGestureRecognizersWithConfiguration:](v14, "_createGestureRecognizersWithConfiguration:", v12);
    objc_storeStrong((id *)&v14->_buttonActions, a5);
    -[SBHardwareButtonGestureParametersProviderBase addHardwareButtonGestureParametersObserver:](v14->_buttonActions, "addHardwareButtonGestureParametersObserver:", v14);
    -[SBHomeHardwareButtonActions hardwareButtonGestureParameters](v14->_buttonActions, "hardwareButtonGestureParameters");
    v15 = objc_claimAutoreleasedReturnValue();
    buttonGestureParameters = v14->_buttonGestureParameters;
    v14->_buttonGestureParameters = (SBHardwareButtonGestureParameters *)v15;

    if (objc_msgSend(v12, "shouldConfigureDependencies"))
    {
      -[SBHomeHardwareButton _reconfigureHomeButton](v14, "_reconfigureHomeButton");
      -[SBHomeHardwareButton _startObservingReconfigurationTriggers](v14, "_startObservingReconfigurationTriggers");
    }
    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    hintSuppressionAssertions = v14->_hintSuppressionAssertions;
    v14->_hintSuppressionAssertions = v17;

  }
  return v14;
}

- (void)configureForwardingToLockButton:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SBHomeHardwareButton buttonActions](self, "buttonActions");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buttonActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "configureForwardingToLockButtonActions:", v5);
}

- (void)_setFingerDetectionEnabled:(BOOL)a3
{
  BSInvalidatable *fingerDetectEnabledAssertion;
  void *v5;
  BSInvalidatable *v6;
  BSInvalidatable *v7;
  objc_class *v8;
  void *v9;
  BSInvalidatable *v10;
  BSInvalidatable *v11;
  BSInvalidatable *v12;

  fingerDetectEnabledAssertion = self->_fingerDetectEnabledAssertion;
  if ((((fingerDetectEnabledAssertion == 0) ^ a3) & 1) == 0)
  {
    v12 = fingerDetectEnabledAssertion;
    if (a3)
    {
      v5 = (void *)MEMORY[0x1E0DAC5A0];
      v6 = fingerDetectEnabledAssertion;
      objc_msgSend(v5, "sharedInstance");
      v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSInvalidatable acquireFingerDetectionWantedAssertionForReason:HIDEventsOnly:](v7, "acquireFingerDetectionWantedAssertionForReason:HIDEventsOnly:", v9, 1);
      v10 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v11 = self->_fingerDetectEnabledAssertion;
      self->_fingerDetectEnabledAssertion = v10;

    }
    else
    {
      self->_fingerDetectEnabledAssertion = 0;
      v7 = fingerDetectEnabledAssertion;
    }

    -[BSInvalidatable invalidate](v12, "invalidate");
  }
}

- (void)provider:(id)a3 didUpdateButtonGestureParameters:(id)a4
{
  id v7;
  SBHomeHardwareButtonActions *v8;
  NSObject *v9;
  SBHomeHardwareButtonActions *buttonActions;
  uint8_t v11[16];

  v7 = a4;
  v8 = (SBHomeHardwareButtonActions *)a3;
  SBLogButtonsHome();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "reconfiguring due to AX prefs change", v11, 2u);
  }

  buttonActions = self->_buttonActions;
  if (buttonActions == v8)
    objc_storeStrong((id *)&self->_buttonGestureParameters, a4);
  -[SBHomeHardwareButton _reconfigureHomeButton](self, "_reconfigureHomeButton");

}

- (void)_startObservingReconfigurationTriggers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  void *v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[1] = *MEMORY[0x1E0C80C00];
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hardwareDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityDefaults");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "demoDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "storeDemoApplicationLockEnabled");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __62__SBHomeHardwareButton__startObservingReconfigurationTriggers__block_invoke;
  v26[3] = &unk_1E8E9DED8;
  v26[4] = self;
  v11 = (void *)MEMORY[0x1E0C80D38];
  v22 = v7;
  v12 = (id)objc_msgSend(v7, "observeDefaults:onQueue:withBlock:", v9, MEMORY[0x1E0C80D38], v26);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "disableHomeButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v13;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "disableHomeButtonDoublePress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v10;
  v25[1] = 3221225472;
  v25[2] = __62__SBHomeHardwareButton__startObservingReconfigurationTriggers__block_invoke_96;
  v25[3] = &unk_1E8E9DED8;
  v25[4] = self;
  v16 = (id)objc_msgSend(v4, "observeDefaults:onQueue:withBlock:", v15, v11, v25);

  if (+[SBReachabilityManager reachabilitySupported](SBReachabilityManager, "reachabilitySupported"))
  {
    +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeHardwareButton _setFingerDetectionEnabled:](self, "_setFingerDetectionEnabled:", objc_msgSend(v17, "reachabilityEnabled"));

  }
  else
  {
    -[SBHomeHardwareButton _setFingerDetectionEnabled:](self, "_setFingerDetectionEnabled:", 0);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "allowReachability");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __62__SBHomeHardwareButton__startObservingReconfigurationTriggers__block_invoke_99;
  v24[3] = &unk_1E8E9DED8;
  v24[4] = self;
  v20 = (void *)MEMORY[0x1E0C80D38];
  v21 = (id)objc_msgSend(v23, "observeDefaults:onQueue:withBlock:", v19, MEMORY[0x1E0C80D38], v24);

}

uint64_t __62__SBHomeHardwareButton__startObservingReconfigurationTriggers__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  SBLogButtonsHome();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "reconfiguring due to demo prefs change", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_reconfigureHomeButton");
}

uint64_t __62__SBHomeHardwareButton__startObservingReconfigurationTriggers__block_invoke_96(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  SBLogButtonsHome();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "reconfiguring due to SB prefs change", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_reconfigureHomeButton");
}

uint64_t __62__SBHomeHardwareButton__startObservingReconfigurationTriggers__block_invoke_99(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (+[SBReachabilityManager reachabilitySupported](SBReachabilityManager, "reachabilitySupported"))
  {
    +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "reachabilityEnabled");

  }
  else
  {
    v3 = 0;
  }
  SBLogButtonsHome();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "allowReachability changed, requesting setFingerDetect:%d", (uint8_t *)v6, 8u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_setFingerDetectionEnabled:", v3);
  return objc_msgSend(*(id *)(a1 + 32), "_reconfigureHomeButton");
}

- (void)_reconfigureHomeButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  double v8;
  float v9;
  NSObject *v10;
  void *v11;
  int64_t v12;
  float v13;
  int64_t maximumTapCount;
  int64_t maximumPressCount;
  void *v16;
  double v17;
  double v18;
  NSObject *v19;
  const char *v20;
  double v21;
  double v22;
  NSObject *v23;
  double v24;
  NSObject *v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  double v32;
  uint8_t buf[4];
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hardwareDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "demoDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SBHardwareButtonGestureParameters maximumPressCount](self->_buttonGestureParameters, "maximumPressCount");
  if ((objc_msgSend(v4, "disableHomeButtonDoublePress") & 1) != 0
    || (objc_msgSend(v4, "disableHomeButton") & 1) != 0
    || objc_msgSend(v6, "isStoreDemoApplicationLockEnabled"))
  {
    v7 = 1;
  }
  -[SBHardwareButtonGestureParameters multiplePressTimeInterval](self->_buttonGestureParameters, "multiplePressTimeInterval");
  v9 = v8;
  if ((BSFloatIsZero() & 1) != 0)
  {
    v9 = 0.35;
  }
  else
  {
    SBLogButtonsHome();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v34 = v9;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, "maximumMultiplePressInterval override from AX is:%g", buf, 0xCu);
    }

  }
  if (+[SBReachabilityManager reachabilitySupported](SBReachabilityManager, "reachabilitySupported"))
  {
    +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "reachabilityEnabled"))
      v12 = 2;
    else
      v12 = 1;

  }
  else
  {
    v12 = 1;
  }
  v13 = v9 + -0.1;
  maximumTapCount = self->_maximumTapCount;
  self->_maximumTapCount = v12;
  -[SBHomeHardwareButton _reconfigureGestureRecognizersForNewMaximumTapCount:oldMaximumTapCount:](self, "_reconfigureGestureRecognizersForNewMaximumTapCount:oldMaximumTapCount:", v12, maximumTapCount);
  maximumPressCount = self->_maximumPressCount;
  self->_maximumPressCount = v7;
  -[SBHomeHardwareButton _reconfigureGestureRecognizersForNewMaximumPressCount:oldMaximumPressCount:](self, "_reconfigureGestureRecognizersForNewMaximumPressCount:oldMaximumPressCount:", v7, maximumPressCount);
  -[NSMutableOrderedSet lastObject](self->_longPressDurationAssertions, "lastObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "duration");
  v18 = v17;

  if (v18 <= 0.0)
  {
    -[SBHardwareButtonGestureParameters longPressTimeInterval](self->_buttonGestureParameters, "longPressTimeInterval");
    v22 = 0.5;
    if (v21 <= 0.0)
      goto LABEL_24;
    v18 = v21;
    SBLogButtonsHome();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v34 = v18;
      v20 = "maximumLongPressDuration from plugins is:%g";
      goto LABEL_22;
    }
  }
  else
  {
    SBLogButtonsHome();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v34 = v18;
      v20 = "maximumLongPressDuration override from assertion is:%g";
LABEL_22:
      _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_INFO, v20, buf, 0xCu);
    }
  }

  v22 = v18;
LABEL_24:
  if (v9 < v13)
  {
    SBLogButtonsHome();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      v34 = v9;
      v35 = 2048;
      v36 = v9;
      v37 = 2048;
      v38 = v9;
      _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_INFO, "multiplePressInterval: minimum > maximum, using maximum(%g): %g > %g", buf, 0x20u);
    }

    v13 = v9;
  }
  v24 = 0.2;
  if (v22 < 0.2)
  {
    SBLogButtonsHome();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      v34 = v22;
      v35 = 2048;
      v36 = v22;
      v37 = 2048;
      v38 = v22;
      _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_INFO, "longPressDuration: minimum > maximum, using maximum(%g): %g > %g", buf, 0x20u);
    }

    v24 = v22;
  }
  -[SBHomeHardwareButtonActions setCurrentLongPressDuration:](self->_buttonActions, "setCurrentLongPressDuration:", v22);
  objc_msgSend(MEMORY[0x1E0D00C60], "definitionForHomeButton");
  v26 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  objc_msgSend(*(id *)&v26, "setMaximumPressCount:", v7);
  objc_msgSend(*(id *)&v26, "setMaximumTapCount:", v12);
  objc_msgSend(*(id *)&v26, "setMinimumLongPressTimeInterval:", v24);
  objc_msgSend(*(id *)&v26, "setMaximumLongPressTimeInterval:", v22);
  objc_msgSend(*(id *)&v26, "setMinimumMultiplePressTimeInterval:", v13);
  objc_msgSend(*(id *)&v26, "setMaximumMultiplePressTimeInterval:", v9);
  v27 = objc_msgSend(v4, "homeButtonHapticType");
  if ((unint64_t)(v27 - 1) >= 3)
    v28 = 0;
  else
    v28 = v27;
  objc_msgSend(*(id *)&v26, "setClickHapticAssetType:", v28);
  -[SBHomeHardwareButton setButtonDefinition:](self, "setButtonDefinition:", *(_QWORD *)&v26);
  SBLogButtonsHome();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v34 = v26;
    _os_log_impl(&dword_1D0540000, v29, OS_LOG_TYPE_INFO, "new button definition:%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D00C58], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applyDefinitions:", v31);

}

- (void)_createGestureRecognizersWithConfiguration:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "systemGestureManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_gestureRecognizerConfiguration, a3);
  objc_msgSend(v18, "initialButtonDownGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:", self, sel_initialButtonDown_);
  objc_msgSend(v6, "setClickCount:", 1);
  objc_msgSend(v6, "setRecognizesOnPressPhaseBegan:", 1);
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v5, "addGestureRecognizer:withType:", v6, 69);
  objc_msgSend(v18, "initialButtonUpGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:", self, sel_initialButtonUp_);
  objc_msgSend(v7, "setClickCount:", 1);
  objc_msgSend(v7, "setRecognizesOnPressPhaseBegan:", 0);
  objc_msgSend(v7, "setDelegate:", self);
  v17 = v7;
  objc_msgSend(v5, "addGestureRecognizer:withType:", v7, 70);
  objc_msgSend(v18, "singlePressUpGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTarget:action:", self, sel_singlePressUp_);
  objc_msgSend(v8, "setClickCount:", 1);
  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(v5, "addGestureRecognizer:withType:", v8, 71);
  objc_msgSend(v18, "acceleratedSinglePressUpGestureRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTarget:action:", self, sel_acceleratedSinglePressUp_);
  objc_msgSend(v9, "setClickCount:", 1);
  objc_msgSend(v9, "setDelegate:", self);
  objc_msgSend(v5, "addGestureRecognizer:withType:", v9, 72);
  objc_msgSend(v18, "longPressGestureRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTarget:action:", self, sel_longPress_);
  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v5, "addGestureRecognizer:withType:", v10, 73);
  objc_msgSend(v18, "doublePressDownGestureRecognizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:", self, sel_doublePressDown_);
  objc_msgSend(v11, "setClickCount:", 2);
  objc_msgSend(v11, "setRecognizesOnPressPhaseBegan:", 1);
  objc_msgSend(v11, "setDelegate:", self);
  objc_msgSend(v5, "addGestureRecognizer:withType:", v11, 74);
  objc_msgSend(v18, "doublePressUpGestureRecognizer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addTarget:action:", self, sel_doublePressUp_);
  objc_msgSend(v12, "setClickCount:", 2);
  objc_msgSend(v12, "setDelegate:", self);
  objc_msgSend(v5, "addGestureRecognizer:withType:", v12, 75);
  objc_msgSend(v18, "triplePressUpGestureRecognizer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addTarget:action:", self, sel_triplePressUp_);
  objc_msgSend(v13, "setClickCount:", 3);
  objc_msgSend(v13, "setDelegate:", self);
  objc_msgSend(v18, "doubleTapUpGestureRecognizer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addTarget:action:", self, sel_doubleTapUp_);
  objc_msgSend(v14, "setClickCount:", 2);
  objc_msgSend(v14, "setDelegate:", self);
  objc_msgSend(v14, "setAllowedPressTypes:", &unk_1E91CE7B8);
  if (objc_msgSend(v18, "shouldConfigureDependencies"))
  {
    if (self->_homeButtonType != 2)
    {
      v16 = v6;
      WeakRetained = objc_loadWeakRetained((id *)&self->_screenshotGestureRecognizer);
      objc_msgSend(v8, "requireGestureRecognizerToFail:", WeakRetained);
      objc_msgSend(v9, "requireGestureRecognizerToFail:", WeakRetained);
      objc_msgSend(WeakRetained, "requireGestureRecognizerToFail:", v10);
      objc_msgSend(WeakRetained, "addTarget:action:", self, sel_screenshotRecognizerDidRecognize_);

      v6 = v16;
    }
    objc_msgSend(v8, "requireGestureRecognizerToFail:", v9);
  }

}

- (void)_reconfigureGestureRecognizersForNewMaximumTapCount:(int64_t)a3 oldMaximumTapCount:(int64_t)a4
{
  void *v5;
  void *v6;
  id v7;

  if (a3 != a4)
  {
    -[SBHomeHardwareButton gestureRecognizerConfiguration](self, "gestureRecognizerConfiguration");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "systemGestureManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleTapUpGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 < 2)
      objc_msgSend(v5, "removeGestureRecognizer:", v6);
    else
      objc_msgSend(v5, "addGestureRecognizer:withType:", v6, 78);

  }
}

- (void)_reconfigureGestureRecognizersForNewMaximumPressCount:(int64_t)a3 oldMaximumPressCount:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;

  if (a3 != a4)
  {
    -[SBHomeHardwareButton gestureRecognizerConfiguration](self, "gestureRecognizerConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemGestureManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "singlePressUpGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doublePressDownGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doublePressUpGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "triplePressUpGestureRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogButtonsHome();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (a3 < 3)
    {
      if (v12)
        -[SBHomeHardwareButton _reconfigureGestureRecognizersForNewMaximumPressCount:oldMaximumPressCount:].cold.4();

      objc_msgSend(v8, "removeFailureRequirement:", v10);
      objc_msgSend(v9, "removeFailureRequirement:", v10);
      objc_msgSend(v6, "removeGestureRecognizer:", v10);
      if (a3 < 2)
      {
        SBLogButtonsHome();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[SBHomeHardwareButton _reconfigureGestureRecognizersForNewMaximumPressCount:oldMaximumPressCount:].cold.3();

        objc_msgSend(v7, "removeFailureRequirement:", v9);
        objc_msgSend(v7, "removeFailureRequirement:", v8);
        goto LABEL_15;
      }
    }
    else
    {
      if (v12)
        -[SBHomeHardwareButton _reconfigureGestureRecognizersForNewMaximumPressCount:oldMaximumPressCount:].cold.2();

      objc_msgSend(v6, "addGestureRecognizer:withType:", v10, 77);
      objc_msgSend(v8, "requireGestureRecognizerToFail:", v10);
      objc_msgSend(v9, "requireGestureRecognizerToFail:", v10);
    }
    SBLogButtonsHome();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[SBHomeHardwareButton _reconfigureGestureRecognizersForNewMaximumPressCount:oldMaximumPressCount:].cold.1();

    objc_msgSend(v7, "requireGestureRecognizerToFail:", v9);
    objc_msgSend(v7, "requireGestureRecognizerToFail:", v8);
LABEL_15:

  }
}

- (void)performWhenMenuButtonIsUpUsingBlock:(id)a3
{
  -[SBHomeHardwareButtonActions performWhenMenuButtonIsUpUsingBlock:](self->_buttonActions, "performWhenMenuButtonIsUpUsingBlock:", a3);
}

- (void)performAfterMenuButtonUpIsHandledUsingBlock:(id)a3
{
  -[SBHomeHardwareButtonActions performAfterMenuButtonUpIsHandledUsingBlock:](self->_buttonActions, "performAfterMenuButtonUpIsHandledUsingBlock:", a3);
}

- (void)screenshotRecognizerDidRecognize:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
  {
    if (self->_longPressDidOccur)
      -[SBHomeHardwareButton cancelLongPress](self, "cancelLongPress");
    -[SBHomeHardwareButtonActions performFinalButtonUpActions](self->_buttonActions, "performFinalButtonUpActions");
  }
}

- (void)cancelLongPress
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  SBLogButtonsHome();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Long press cancelled", v6, 2u);
  }

  self->_longPressDidOccur = 0;
  -[SBHomeHardwareButton gestureRecognizerConfiguration](self, "gestureRecognizerConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "longPressGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);
  objc_msgSend(v5, "setEnabled:", 1);
  -[SBHomeHardwareButtonActions performLongPressCancelledActions](self->_buttonActions, "performLongPressCancelledActions");

}

- (void)addHintSuppressionAssertion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7 = v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      -[NSMutableSet addObject:](self->_hintSuppressionAssertions, "addObject:", v7);
      v5 = v7;
    }
  }

}

- (void)removeHintSuppressionAssertion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7 = v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      -[NSMutableSet removeObject:](self->_hintSuppressionAssertions, "removeObject:", v7);
      v5 = v7;
    }
  }

}

- (void)addLongPressDurationAssertion:(id)a3
{
  id v4;
  NSMutableOrderedSet *longPressDurationAssertions;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    longPressDurationAssertions = self->_longPressDurationAssertions;
    if (!longPressDurationAssertions)
    {
      v6 = (NSMutableOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", 1);
      v7 = self->_longPressDurationAssertions;
      self->_longPressDurationAssertions = v6;

      longPressDurationAssertions = self->_longPressDurationAssertions;
    }
    -[NSMutableOrderedSet addObject:](longPressDurationAssertions, "addObject:", v4);
    SBLogButtonsHome();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v4;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "reconfiguring due to long press duration assertion addition: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    -[SBHomeHardwareButton _reconfigureHomeButton](self, "_reconfigureHomeButton");
  }

}

- (void)removeLongPressDurationAssertion:(id)a3
{
  id v4;
  NSMutableOrderedSet *longPressDurationAssertions;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[NSMutableOrderedSet removeObject:](self->_longPressDurationAssertions, "removeObject:", v4);
    if (!-[NSMutableOrderedSet count](self->_longPressDurationAssertions, "count"))
    {
      longPressDurationAssertions = self->_longPressDurationAssertions;
      self->_longPressDurationAssertions = 0;

    }
    SBLogButtonsHome();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "reconfiguring due to long press duration assertion removal: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    -[SBHomeHardwareButton _reconfigureHomeButton](self, "_reconfigureHomeButton");
  }

}

- (int64_t)hapticType
{
  void *v2;
  void *v3;
  int64_t v4;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hardwareDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "homeButtonHapticType");
  return v4;
}

- (void)setHapticType:(int64_t)a3
{
  void *v5;
  id v6;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hardwareDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setHomeButtonHapticType:", a3);
  -[SBHomeHardwareButton _reconfigureHomeButton](self, "_reconfigureHomeButton");

}

- (BOOL)isButtonDown
{
  return -[SBHomeHardwareButtonActions isButtonDown](self->_buttonActions, "isButtonDown");
}

- (BOOL)supportsAcceleratedAppDismiss
{
  void *v2;
  uint64_t v3;
  double v4;
  BOOL v6;

  if (self->_homeButtonType != 1)
    return 0;
  -[SBHomeHardwareButton buttonDefinition](self, "buttonDefinition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maximumPressCount");
  objc_msgSend(v2, "maximumMultiplePressTimeInterval");
  v6 = v4 <= 0.349999994 && v3 < 3;

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  unint64_t v21;
  id v22;
  BOOL v24;
  uint64_t i;
  void *v27;
  _QWORD v28[7];

  v28[6] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBHomeHardwareButton gestureRecognizerConfiguration](self, "gestureRecognizerConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_screenshotGestureRecognizer);
  v10 = WeakRetained;
  v11 = 1;
  if (WeakRetained != v6 && WeakRetained != v7)
  {
    objc_msgSend(v8, "initialButtonDownGestureRecognizer");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if ((id)v12 != v6 && (id)v12 != v7)
    {
      objc_msgSend(v8, "initialButtonUpGestureRecognizer");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if ((id)v14 != v6 && (id)v14 != v7)
      {
        objc_msgSend(v8, "singlePressUpGestureRecognizer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "doublePressDownGestureRecognizer");
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "doublePressUpGestureRecognizer");
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "triplePressUpGestureRecognizer");
        v18 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "longPressGestureRecognizer");
        v19 = objc_claimAutoreleasedReturnValue();
        v28[0] = v17;
        v28[1] = v16;
        v20 = v27;
        v21 = 0;
        v28[2] = v20;
        v28[3] = v18;
        v28[4] = v20;
        v28[5] = v19;
        while (1)
        {
          v22 = (id)v28[v21];
          if (v22 == v6 && (id)v28[v21 + 1] == v7)
            break;
          if (v22 == v7 && v28[v21 + 1] == (_QWORD)v6)
            break;
          v24 = v21 > 3;
          v21 += 2;
          if (v24)
          {
            v11 = 0;
            goto LABEL_18;
          }
        }
        v11 = 1;
LABEL_18:
        for (i = 5; i != -1; --i)

      }
    }

  }
  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  BOOL v12;

  v6 = a4;
  v7 = a3;
  -[SBHomeHardwareButton gestureRecognizerConfiguration](self, "gestureRecognizerConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleTapUpGestureRecognizer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "initialButtonDownGestureRecognizer");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v12 = v9 == v7 && v10 == v6;
  return v12;
}

- (void)cancelHardwareButtonPress
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[SBHomeHardwareButtonGestureRecognizerConfiguration allGestureRecognizers](self->_gestureRecognizerConfiguration, "allGestureRecognizers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[SBHomeHardwareButton _cancelGestureRecognizer:](self, "_cancelGestureRecognizer:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)hardwareButtonIdentifier
{
  return CFSTR("Home");
}

- (BOOL)_acceleratedSinglePressRecognizerShouldBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSMutableSet *hintSuppressionAssertions;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  int v16;
  double v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  BOOL v25;
  NSObject *v27;
  const char *v28;
  void *v29;
  int v30;
  NSObject *v31;
  void *v32;
  void *v33;
  int v34;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  void *v38;
  void *v39;
  int v40;
  const __CFString *v41;
  const char *v42;
  void *v43;
  int v44;
  const char *v45;
  void *v46;
  int v47;
  _BOOL4 v48;
  _BOOL4 v49;
  NSObject *v50;
  NSObject *v51;
  int v52;
  NSObject *log;
  uint8_t buf[4];
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "windowSceneManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "embeddedDisplayWindowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "switcherController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeHardwareButton buttonDefinition](self, "buttonDefinition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSMutableSet count](self->_hintSuppressionAssertions, "count"))
  {
    if (objc_msgSend(v5, "isEditing"))
    {
      SBLogButtonsHome();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        goto LABEL_30;
      *(_WORD *)buf = 0;
      v12 = "Accelerated single press recognizer should not begin because currently editing";
LABEL_28:
      v13 = v10;
      v14 = 2;
      goto LABEL_29;
    }
    objc_msgSend((id)SBApp, "lockHardwareButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isButtonDown");

    if (v16)
    {
      SBLogButtonsHome();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        goto LABEL_30;
      *(_WORD *)buf = 0;
      v12 = "Accelerated single press recognizer should not begin because the lock button is down";
      goto LABEL_28;
    }
    if (objc_msgSend(v9, "maximumPressCount") >= 3)
    {
      SBLogButtonsHome();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        goto LABEL_30;
      *(_WORD *)buf = 0;
      v12 = "Accelerated single press recognizer should not begin because triple click is enabled";
      goto LABEL_28;
    }
    objc_msgSend(v9, "maximumMultiplePressTimeInterval");
    if (v17 > 0.349999994)
    {
      SBLogButtonsHome();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        goto LABEL_30;
      *(_WORD *)buf = 0;
      v12 = "Accelerated single press recognizer should not begin because click speed setting is too slow";
      goto LABEL_28;
    }
    objc_msgSend(v3, "transientOverlayPresentationManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "hasActivePresentation");

    if (v19)
    {
      SBLogButtonsHome();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        goto LABEL_30;
      *(_WORD *)buf = 0;
      v12 = "Accelerated single press recognizer should not begin because a transient overlay is up";
      goto LABEL_28;
    }
    +[SBControlCenterController sharedInstance](SBControlCenterController, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isVisible");

    if (v21)
    {
      SBLogButtonsHome();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        goto LABEL_30;
      *(_WORD *)buf = 0;
      v12 = "Accelerated single press recognizer should not begin because Control Center is up";
      goto LABEL_28;
    }
    objc_msgSend((id)SBApp, "notificationDispatcher");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bannerDestination");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isPresentingBanner");

    if (v24)
    {
      SBLogButtonsHome();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        goto LABEL_30;
      *(_WORD *)buf = 0;
      v12 = "Accelerated single press recognizer should not begin because a banner is showing";
      goto LABEL_28;
    }
    if (objc_msgSend(v8, "isMainSwitcherVisible"))
    {
      SBLogButtonsHome();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        goto LABEL_30;
      *(_WORD *)buf = 0;
      v12 = "Accelerated single press recognizer should not begin -- in the app switcher";
      goto LABEL_28;
    }
    objc_msgSend((id)SBApp, "modalAlertPresentationCoordinator");
    v10 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isShowingSystemModalAlert](v10, "isShowingSystemModalAlert"))
    {
      SBLogButtonsHome();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v28 = "Accelerated single press recognizer should not begin -- system modal alert";
LABEL_38:
        _os_log_impl(&dword_1D0540000, v27, OS_LOG_TYPE_INFO, v28, buf, 2u);
        goto LABEL_39;
      }
      goto LABEL_39;
    }
    +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isInSetupMode");

    if (v30)
    {
      SBLogButtonsHome();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v28 = "Accelerated single press recognizer should not begin -- in Setup";
        goto LABEL_38;
      }
LABEL_39:
      v25 = 0;
LABEL_48:

      goto LABEL_31;
    }
    objc_msgSend((id)SBApp, "menuButtonInterceptApp");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      SBLogButtonsHome();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        -[NSObject bundleIdentifier](v27, "bundleIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v55 = v32;
        _os_log_impl(&dword_1D0540000, v31, OS_LOG_TYPE_INFO, "Accelerated single press recognizer should not begin -- intercept app:%{public}@", buf, 0xCu);

      }
LABEL_46:
      v25 = 0;
LABEL_47:

      goto LABEL_48;
    }
    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isVisible");

    if (v34)
    {
      SBLogButtonsHome();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v31, OS_LOG_TYPE_INFO, "Accelerated single press recognizer should not begin -- coversheet", buf, 2u);
      }
      goto LABEL_46;
    }
    +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
    v31 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject reachabilityModeActive](v31, "reachabilityModeActive"))
    {
      SBLogButtonsHome();
      log = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, log, OS_LOG_TYPE_INFO, "Accelerated single press recognizer should not begin -- reachability is open", buf, 2u);
      }
      v25 = 0;
      goto LABEL_69;
    }
    +[SBHardwareButtonService sharedInstance](SBHardwareButtonService, "sharedInstance");
    log = objc_claimAutoreleasedReturnValue();
    if (-[NSObject hasConsumersForHomeButtonPresses](log, "hasConsumersForHomeButtonPresses"))
    {
      SBLogButtonsHome();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v35 = "Accelerated single press recognizer should not begin -- external button consumers exist";
LABEL_56:
        v36 = v51;
        v37 = 2;
LABEL_66:
        _os_log_impl(&dword_1D0540000, v36, OS_LOG_TYPE_INFO, v35, buf, v37);
        goto LABEL_67;
      }
      goto LABEL_67;
    }
    v49 = +[SBAssistantController isVisible](SBAssistantController, "isVisible");
    +[SBVoiceControlController sharedInstance](SBVoiceControlController, "sharedInstance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v38, "isVisible");

    if (v49 || v52)
    {
      SBLogButtonsHome();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        v41 = CFSTR("Voice Control");
        if (v49)
          v41 = CFSTR("Siri");
        *(_DWORD *)buf = 138543362;
        v55 = (void *)v41;
        v35 = "Accelerated single press recognizer should not begin -- %{public}@ is visible";
        v36 = v51;
        v37 = 12;
        goto LABEL_66;
      }
      goto LABEL_67;
    }
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "areAnyIconViewContextMenusShowing");

    if (v40)
    {
      SBLogButtonsHome();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v35 = "Accelerated single press recognizer should not begin -- icon force touch controller peeking or showing";
        goto LABEL_56;
      }
LABEL_67:
      v25 = 0;
LABEL_68:

LABEL_69:
      goto LABEL_47;
    }
    if (objc_msgSend(v5, "isPerformingExpandTransition"))
    {
      SBLogButtonsHome();
      v25 = 1;
      v51 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        goto LABEL_68;
      *(_WORD *)buf = 0;
      v42 = "Accelerated single press recognizer should begin -- cancelling folder open";
LABEL_76:
      _os_log_impl(&dword_1D0540000, v51, OS_LOG_TYPE_INFO, v42, buf, 2u);
      goto LABEL_68;
    }
    if (objc_msgSend(v8, "_shouldAcceleratedHomeButtonPressBegin"))
    {
      SBLogButtonsHome();
      v25 = 1;
      v51 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        goto LABEL_68;
      *(_WORD *)buf = 0;
      v42 = "Accelerated single press recognizer should begin -- switcher wants it";
      goto LABEL_76;
    }
    if (objc_msgSend(v5, "isTransitioning"))
    {
      SBLogButtonsHome();
      v51 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        goto LABEL_67;
      *(_WORD *)buf = 0;
      v35 = "Accelerated single press recognizer should not begin -- iconController is already transitioning";
      goto LABEL_56;
    }
    objc_msgSend(v8, "layoutStatePrimaryElement");
    v51 = objc_claimAutoreleasedReturnValue();
    -[NSObject workspaceEntity](v51, "workspaceEntity");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "isApplicationSceneEntity");

    if (v44)
    {
      SBLogButtonsHome();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v45 = "Accelerated single press recognizer should not begin -- hasForegroundApplication";
LABEL_88:
        _os_log_impl(&dword_1D0540000, v50, OS_LOG_TYPE_INFO, v45, buf, 2u);
      }
    }
    else
    {
      objc_msgSend(v4, "iconManager");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "hasOpenFolder");

      SBLogButtonsHome();
      v50 = objc_claimAutoreleasedReturnValue();
      v48 = os_log_type_enabled(v50, OS_LOG_TYPE_INFO);
      if (v47)
      {
        if (v48)
        {
          *(_WORD *)buf = 0;
          v25 = 1;
          _os_log_impl(&dword_1D0540000, v50, OS_LOG_TYPE_INFO, "Accelerated single press recognizer should begin -- hasOpenFolder", buf, 2u);
        }
        else
        {
          v25 = 1;
        }
        goto LABEL_90;
      }
      if (v48)
      {
        *(_WORD *)buf = 0;
        v45 = "Accelerated single press recognizer should not begin: not in a supported context";
        goto LABEL_88;
      }
    }
    v25 = 0;
LABEL_90:

    goto LABEL_68;
  }
  SBLogButtonsHome();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    hintSuppressionAssertions = self->_hintSuppressionAssertions;
    *(_DWORD *)buf = 138543362;
    v55 = hintSuppressionAssertions;
    v12 = "Accelerated single press recognizer should not begin -- 'hint' suppression assertions: %{public}@";
    v13 = v10;
    v14 = 12;
LABEL_29:
    _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_INFO, v12, buf, v14);
  }
LABEL_30:
  v25 = 0;
LABEL_31:

  return v25;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  SBHardwareButtonCoordinator *hardwareButtonCoordinator;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  hardwareButtonCoordinator = self->_hardwareButtonCoordinator;
  -[SBHomeHardwareButton hardwareButtonIdentifier](self, "hardwareButtonIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(hardwareButtonCoordinator) = -[SBHardwareButtonCoordinator buttonShouldStart:](hardwareButtonCoordinator, "buttonShouldStart:", v6);

  if ((hardwareButtonCoordinator & 1) != 0)
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hardwareDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "disableHomeButton");

    if (v9)
    {
      SBLogButtonsHome();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v11 = "Preventing all home recognizers because user default disables home button";
LABEL_10:
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, v11, buf, 2u);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "demoDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isStoreDemoApplicationLockEnabled");

    if (v14)
    {
      SBLogButtonsHome();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v11 = "Preventing all home recognizers because app store demo lock enabled";
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    objc_msgSend((id)SBApp, "restartManager");
    v17 = objc_claimAutoreleasedReturnValue();
    v10 = v17;
    if (v17
      && (-[NSObject startupTransition](v17, "startupTransition"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v18,
          !v18))
    {
      if (!-[NSObject isPendingExit](v10, "isPendingExit"))
      {
        -[SBHomeHardwareButton gestureRecognizerConfiguration](self, "gestureRecognizerConfiguration");
        v19 = objc_claimAutoreleasedReturnValue();
        -[NSObject acceleratedSinglePressUpGestureRecognizer](v19, "acceleratedSinglePressUpGestureRecognizer");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        if (v22 == v4)
        {
          v15 = -[SBHomeHardwareButton _acceleratedSinglePressRecognizerShouldBegin](self, "_acceleratedSinglePressRecognizerShouldBegin");
        }
        else
        {
          -[NSObject doublePressDownGestureRecognizer](v19, "doublePressDownGestureRecognizer");
          v23 = (id)objc_claimAutoreleasedReturnValue();
          -[NSObject doublePressUpGestureRecognizer](v19, "doublePressUpGestureRecognizer");
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = (void *)v24;
          if (v23 == v4 || (id)v24 == v4)
          {
            v28 = 0;
            v15 = -[SBHomeHardwareButton _isMenuDoublePressAllowed:](self, "_isMenuDoublePressAllowed:", &v28);
            v26 = v28;
            if (!v15)
            {
              SBLogButtonsHome();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                v30 = v26;
                _os_log_impl(&dword_1D0540000, v27, OS_LOG_TYPE_INFO, "Preventing double press recognizer for reason: %{public}@", buf, 0xCu);
              }

            }
          }
          else
          {
            -[NSObject longPressGestureRecognizer](v19, "longPressGestureRecognizer");
            v26 = (id)objc_claimAutoreleasedReturnValue();
            v15 = v26 != v4
               || -[SBHomeHardwareButton _longPressGestureRecognizerShouldBegin:](self, "_longPressGestureRecognizerShouldBegin:", v4);
          }

        }
        goto LABEL_19;
      }
      SBLogButtonsHome();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        -[NSObject pendingRestartTransitionRequest](v10, "pendingRestartTransitionRequest");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v20;
        v21 = "Preventing all home recognizers because we have a pending restart transition: %{public}@";
        goto LABEL_17;
      }
    }
    else
    {
      SBLogButtonsHome();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        -[NSObject startupTransition](v10, "startupTransition");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v20;
        v21 = "Preventing all home recognizers because we're in a startup transition: %{public}@";
LABEL_17:
        _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_INFO, v21, buf, 0xCu);

      }
    }
    v15 = 0;
LABEL_19:

    goto LABEL_12;
  }
  SBLogButtonsHome();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v11 = "Preventing all home recognizers because hardware button coordinator says nope";
    goto LABEL_10;
  }
LABEL_11:
  v15 = 0;
LABEL_12:

  return v15;
}

- (BOOL)_longPressGestureRecognizerShouldBegin:(id)a3
{
  void *v3;
  int v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  void *v8;
  int v9;
  NSObject *v10;
  char v11;
  int v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t buf[2];
  __int16 v18;

  objc_msgSend((id)SBApp, "lockOutController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBlocked");

  if (v4)
  {
    SBLogButtonsHome();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v18 = 0;
      v6 = "Preventing long press recognizer because deviceIsBlocked";
      v7 = (uint8_t *)&v18;
LABEL_7:
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isInSetupMode");

  if (v9)
  {
    SBLogButtonsHome();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v6 = "Preventing long press recognizer because isInSetupMode";
      v7 = buf;
      goto LABEL_7;
    }
LABEL_12:
    v11 = 0;
    goto LABEL_13;
  }
  +[SBSyncController sharedInstance](SBSyncController, "sharedInstance");
  v5 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject isRestoring](v5, "isRestoring"))
  {
    SBLogButtonsHome();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, "Preventing long press recognizer because SBSyncController isRestoring", v16, 2u);
    }

    goto LABEL_12;
  }
  v13 = -[NSObject isResetting](v5, "isResetting");
  if (v13)
  {
    SBLogButtonsHome();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_INFO, "Preventing long press recognizer because SBSyncController isResetting", v15, 2u);
    }

  }
  v11 = v13 ^ 1;
LABEL_13:

  return v11;
}

- (void)_terminateHomeButtonEventAtCount:(int64_t)a3
{
  NSObject *v5;
  SBHomeHardwareButtonActions **p_buttonActions;
  SBHomeHardwareButtonActions *v7;
  SBHomeHardwareButtonActions *buttonActions;
  SBHomeHardwareButtonActions *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogButtonsHome();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = a3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "EMU terminate with count:%d", (uint8_t *)v10, 8u);
  }

  switch(a3)
  {
    case 3:
      buttonActions = self->_buttonActions;
      p_buttonActions = &self->_buttonActions;
      -[SBHomeHardwareButtonActions performTriplePressUpActions](buttonActions, "performTriplePressUpActions");
      break;
    case 2:
      v9 = self->_buttonActions;
      p_buttonActions = &self->_buttonActions;
      -[SBHomeHardwareButtonActions performDoublePressDownActions](v9, "performDoublePressDownActions");
      break;
    case 1:
      v7 = self->_buttonActions;
      p_buttonActions = &self->_buttonActions;
      -[SBHomeHardwareButtonActions performSinglePressUpActions](v7, "performSinglePressUpActions");
      break;
    default:
      return;
  }
  -[SBHomeHardwareButtonActions performFinalButtonUpActions](*p_buttonActions, "performFinalButtonUpActions");
}

- (BOOL)emulateHomeButtonEventsIfNeeded:(__IOHIDEvent *)a3
{
  uint64_t SenderID;
  NSObject *v5;
  int v6;
  NSMutableDictionary *emulatedPerSenderDownCount;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  dispatch_time_t v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  char v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSMutableDictionary *v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  NSMutableDictionary *v33;
  void *v34;
  NSObject *v35;
  _QWORD v37[8];
  uint8_t buf[4];
  _BYTE v39[14];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  SenderID = IOHIDEventGetSenderID();
  if (IOHIDEventGetIntegerValue())
  {
    if ((IOHIDEventGetPhase() & 1) == 0 && IOHIDEventGetIntegerValue() <= 1 && !IOHIDEventGetIntegerValue())
    {
      SBLogButtonsHome();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = -[BKSButtonHapticsDefinition maximumPressCount](self->_buttonDefinition, "maximumPressCount");
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)v39 = SenderID;
        *(_WORD *)&v39[8] = 1024;
        *(_DWORD *)&v39[10] = v6;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SenderID:%llX appears to be synthesizing home button events without press count/terminal support; SpringBoard "
          "is providing emulation for max count:%d",
          buf,
          0x12u);
      }

      emulatedPerSenderDownCount = self->_emulatedPerSenderDownCount;
      if (!emulatedPerSenderDownCount)
      {
        v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v9 = self->_emulatedPerSenderDownCount;
        self->_emulatedPerSenderDownCount = v8;

        emulatedPerSenderDownCount = self->_emulatedPerSenderDownCount;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", SenderID);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](emulatedPerSenderDownCount, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "integerValue");

      if (v12 < -[BKSButtonHapticsDefinition maximumPressCount](self->_buttonDefinition, "maximumPressCount"))
        v13 = v12 + 1;
      else
        v13 = 1;
      v14 = ++emulateHomeButtonEventsIfNeeded__sTerminalGeneration;
      emulateHomeButtonEventsIfNeeded__sLastSenderID = SenderID;
      -[BKSButtonHapticsDefinition maximumMultiplePressTimeInterval](self->_buttonDefinition, "maximumMultiplePressTimeInterval");
      v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __56__SBHomeHardwareButton_emulateHomeButtonEventsIfNeeded___block_invoke;
      v37[3] = &unk_1E8EAD3C0;
      v37[4] = self;
      v37[5] = v14;
      v37[6] = SenderID;
      v37[7] = v13;
      dispatch_after(v16, MEMORY[0x1E0C80D38], v37);
      v17 = self->_emulatedPerSenderDownCount;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", SenderID);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v18, v19);

      SBLogButtonsHome();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v39 = v13;
        *(_WORD *)&v39[4] = 2048;
        *(_QWORD *)&v39[6] = SenderID;
        _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "EMU down count:%d senderID:%llX", buf, 0x12u);
      }

      if (v13 == 3 || v13 == 2)
        goto LABEL_18;
      if (v13 == 1)
      {
        -[SBHomeHardwareButtonActions performInitialButtonDownActions](self->_buttonActions, "performInitialButtonDownActions");
LABEL_18:
        v21 = 1;
        goto LABEL_36;
      }
    }
    goto LABEL_29;
  }
  v22 = self->_emulatedPerSenderDownCount;
  if (!v22)
  {
LABEL_29:
    v21 = 0;
    goto LABEL_36;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", SenderID);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v22, "objectForKey:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = objc_msgSend(v24, "integerValue");
    v26 = v25;
    if ((unint64_t)(v25 - 2) < 2)
    {
LABEL_25:
      if (v26 == -[BKSButtonHapticsDefinition maximumPressCount](self->_buttonDefinition, "maximumPressCount"))
      {
        ++emulateHomeButtonEventsIfNeeded__sTerminalGeneration;
        -[SBHomeHardwareButton _terminateHomeButtonEventAtCount:](self, "_terminateHomeButtonEventAtCount:", v26);
        v27 = self->_emulatedPerSenderDownCount;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", SenderID);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](v27, "removeObjectForKey:", v28);

      }
      SBLogButtonsHome();
      v29 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v39 = v26;
      *(_WORD *)&v39[4] = 2048;
      *(_QWORD *)&v39[6] = SenderID;
      v30 = "EMU eat up count:%d senderID:%llX";
      v31 = v29;
      v32 = 18;
      goto LABEL_33;
    }
    if (!v25)
    {
      v33 = self->_emulatedPerSenderDownCount;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", SenderID);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v33, "removeObjectForKey:", v34);

      SBLogButtonsHome();
      v29 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
LABEL_34:

        v21 = 1;
        goto LABEL_35;
      }
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v39 = SenderID;
      v30 = "EMU eat up after long press for senderID:%llX";
      v31 = v29;
      v32 = 12;
LABEL_33:
      _os_log_impl(&dword_1D0540000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
      goto LABEL_34;
    }
    if (v25 == 1)
    {
      -[SBHomeHardwareButtonActions performInitialButtonUpActions](self->_buttonActions, "performInitialButtonUpActions");
      -[SBHomeHardwareButtonActions performLongPressCancelledActions](self->_buttonActions, "performLongPressCancelledActions");
      goto LABEL_25;
    }
  }
  v21 = 0;
LABEL_35:

LABEL_36:
  SBLogButtonsHome();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    -[SBHomeHardwareButton emulateHomeButtonEventsIfNeeded:].cold.1(v21, v35);

  return v21;
}

void __56__SBHomeHardwareButton_emulateHomeButtonEventsIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  if (*(_QWORD *)(a1 + 40) == emulateHomeButtonEventsIfNeeded__sTerminalGeneration
    || emulateHomeButtonEventsIfNeeded__sLastSenderID != *(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_terminateHomeButtonEventAtCount:", *(_QWORD *)(a1 + 56));
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", &unk_1E91D0C80, v3);

    ++emulateHomeButtonEventsIfNeeded__sTerminalGeneration;
  }
}

- (void)initialButtonDown:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogButtonsHome();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    SBSystemGestureRecognizerStateDescription(objc_msgSend(v4, "state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Initial button down (state:%{public}@)", (uint8_t *)&v7, 0xCu);

  }
  if (objc_msgSend(v4, "state") == 3)
  {
    self->_longPressDidOccur = 0;
    -[SBHomeHardwareButtonActions performInitialButtonDownActions](self->_buttonActions, "performInitialButtonDownActions");
  }

}

- (void)initialButtonUp:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogButtonsHome();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    SBSystemGestureRecognizerStateDescription(objc_msgSend(v4, "state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Initial button up (state:%{public}@)", (uint8_t *)&v7, 0xCu);

  }
  if (objc_msgSend(v4, "state") == 3)
  {
    -[SBHomeHardwareButtonActions performInitialButtonUpActions](self->_buttonActions, "performInitialButtonUpActions");
    if (!self->_longPressDidOccur)
      -[SBHomeHardwareButtonActions performLongPressCancelledActions](self->_buttonActions, "performLongPressCancelledActions");
  }

}

- (void)_singlePressUp:(id)a3
{
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  if (objc_msgSend(a3, "state") == 3)
  {
    objc_msgSend((id)SBApp, "lockHardwareButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelLongPress");

    if (self->_longPressDidOccur)
    {
      SBLogButtonsHome();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Single press -- skipping single press actions due to long press", v6, 2u);
      }

    }
    else
    {
      -[SBHomeHardwareButtonActions performSinglePressUpActions](self->_buttonActions, "performSinglePressUpActions");
    }
    -[SBHomeHardwareButtonActions performFinalButtonUpActions](self->_buttonActions, "performFinalButtonUpActions");
  }
}

- (void)acceleratedSinglePressUp:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogButtonsHome();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    SBSystemGestureRecognizerStateDescription(objc_msgSend(v4, "state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Accelerated single press up (state:%{public}@)", (uint8_t *)&v7, 0xCu);

  }
  -[SBHomeHardwareButton _singlePressUp:](self, "_singlePressUp:", v4);

}

- (void)singlePressUp:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogButtonsHome();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    SBSystemGestureRecognizerStateDescription(objc_msgSend(v4, "state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Normal single press up (state:%{public}@)", (uint8_t *)&v7, 0xCu);

  }
  -[SBHomeHardwareButton _singlePressUp:](self, "_singlePressUp:", v4);

}

- (void)longPress:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogButtonsHome();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    SBSystemGestureRecognizerStateDescription(objc_msgSend(v4, "state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Long press (state:%{public}@)", (uint8_t *)&v9, 0xCu);

  }
  if (objc_msgSend(v4, "state") == 3)
  {
    self->_longPressDidOccur = 1;
    -[SBHomeHardwareButton gestureRecognizerConfiguration](self, "gestureRecognizerConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "acceleratedSinglePressUpGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeHardwareButton _cancelGestureRecognizer:](self, "_cancelGestureRecognizer:", v8);

    -[SBHomeHardwareButtonActions performLongPressActions](self->_buttonActions, "performLongPressActions");
  }

}

- (BOOL)_processDoubleDownAndDoubleUpSimultaneously
{
  return self->_maximumPressCount > 2;
}

- (void)doublePressDown:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogButtonsHome();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    SBSystemGestureRecognizerStateDescription(objc_msgSend(v4, "state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Double press down (state:%{public}@)", (uint8_t *)&v7, 0xCu);

  }
  if (objc_msgSend(v4, "state") == 3)
  {
    -[SBHomeHardwareButtonActions performDoublePressDownActions](self->_buttonActions, "performDoublePressDownActions");
    if (-[SBHomeHardwareButton _processDoubleDownAndDoubleUpSimultaneously](self, "_processDoubleDownAndDoubleUpSimultaneously"))
    {
      -[SBHomeHardwareButtonActions performFinalButtonUpActions](self->_buttonActions, "performFinalButtonUpActions");
    }
  }

}

- (void)doublePressUp:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogButtonsHome();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    SBSystemGestureRecognizerStateDescription(objc_msgSend(v4, "state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Double press up (state:%{public}@)", (uint8_t *)&v7, 0xCu);

  }
  if (objc_msgSend(v4, "state") == 3
    && !-[SBHomeHardwareButton _processDoubleDownAndDoubleUpSimultaneously](self, "_processDoubleDownAndDoubleUpSimultaneously"))
  {
    -[SBHomeHardwareButtonActions performFinalButtonUpActions](self->_buttonActions, "performFinalButtonUpActions");
  }

}

- (void)triplePressUp:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogButtonsHome();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    SBSystemGestureRecognizerStateDescription(objc_msgSend(v4, "state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Triple press up (state:%{public}@)", (uint8_t *)&v7, 0xCu);

  }
  if (objc_msgSend(v4, "state") == 3)
  {
    -[SBHomeHardwareButtonActions performTriplePressUpActions](self->_buttonActions, "performTriplePressUpActions");
    -[SBHomeHardwareButtonActions performFinalButtonUpActions](self->_buttonActions, "performFinalButtonUpActions");
  }

}

- (void)doubleTapUp:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogButtonsHome();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    SBSystemGestureRecognizerStateDescription(objc_msgSend(v4, "state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Double tap up (state:%{public}@)", (uint8_t *)&v7, 0xCu);

  }
  if (objc_msgSend(v4, "state") == 3)
    -[SBHomeHardwareButtonActions performDoubleTapUpActions](self->_buttonActions, "performDoubleTapUpActions");

}

- (void)_cancelGestureRecognizer:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "isEnabled"))
  {
    objc_msgSend(v3, "setEnabled:", 0);
    objc_msgSend(v3, "setEnabled:", 1);
  }

}

- (BOOL)_isMenuDoublePressDisabled
{
  void *v2;
  void *v3;
  char v4;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hardwareDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "disableHomeButtonDoublePress");

  return v4;
}

- (BOOL)_isMenuDoublePressAllowed:(id *)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  __CFString *v8;
  void *v9;
  char v10;
  _BOOL4 v11;

  objc_msgSend((id)SBApp, "lockOutController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSyncController sharedInstance](SBSyncController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isInUse") & 1) != 0)
  {
    v7 = 0;
    v8 = CFSTR("syncing data");
    if (!a3)
      goto LABEL_14;
    goto LABEL_13;
  }
  if ((objc_msgSend(v5, "isBlocked") & 1) != 0)
  {
    v7 = 0;
    v8 = CFSTR("blocked");
    if (!a3)
      goto LABEL_14;
    goto LABEL_13;
  }
  objc_msgSend((id)SBApp, "remoteTransientOverlaySessionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasSessionWithPendingButtonEvents:options:", 1, 0);

  if ((v10 & 1) != 0)
  {
    v7 = 0;
    v8 = CFSTR("has session with pending lock event");
    if (!a3)
      goto LABEL_14;
    goto LABEL_13;
  }
  v11 = -[SBHomeHardwareButton _isMenuDoublePressDisabled](self, "_isMenuDoublePressDisabled");
  v7 = !v11;
  v8 = CFSTR("disabled by user default");
  if (!v11)
    v8 = 0;
  if (a3)
LABEL_13:
    *a3 = v8;
LABEL_14:

  return v7;
}

- (SBHardwareButtonCoordinator)hardwareButtonCoordinator
{
  return self->_hardwareButtonCoordinator;
}

- (void)setHardwareButtonCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareButtonCoordinator, a3);
}

- (SBHomeHardwareButtonActions)buttonActions
{
  return self->_buttonActions;
}

- (void)setButtonActions:(id)a3
{
  objc_storeStrong((id *)&self->_buttonActions, a3);
}

- (SBHardwareButtonGestureParameters)buttonGestureParameters
{
  return self->_buttonGestureParameters;
}

- (void)setButtonGestureParameters:(id)a3
{
  objc_storeStrong((id *)&self->_buttonGestureParameters, a3);
}

- (SBHomeHardwareButtonGestureRecognizerConfiguration)gestureRecognizerConfiguration
{
  return self->_gestureRecognizerConfiguration;
}

- (void)setGestureRecognizerConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_gestureRecognizerConfiguration, a3);
}

- (UIGestureRecognizer)screenshotGestureRecognizer
{
  return (UIGestureRecognizer *)objc_loadWeakRetained((id *)&self->_screenshotGestureRecognizer);
}

- (void)setScreenshotGestureRecognizer:(id)a3
{
  objc_storeWeak((id *)&self->_screenshotGestureRecognizer, a3);
}

- (int64_t)homeButtonType
{
  return self->_homeButtonType;
}

- (void)setHomeButtonType:(int64_t)a3
{
  self->_homeButtonType = a3;
}

- (int64_t)maximumPressCount
{
  return self->_maximumPressCount;
}

- (void)setMaximumPressCount:(int64_t)a3
{
  self->_maximumPressCount = a3;
}

- (int64_t)maximumTapCount
{
  return self->_maximumTapCount;
}

- (void)setMaximumTapCount:(int64_t)a3
{
  self->_maximumTapCount = a3;
}

- (BOOL)longPressDidOccur
{
  return self->_longPressDidOccur;
}

- (void)setLongPressDidOccur:(BOOL)a3
{
  self->_longPressDidOccur = a3;
}

- (NSMutableDictionary)emulatedPerSenderDownCount
{
  return self->_emulatedPerSenderDownCount;
}

- (void)setEmulatedPerSenderDownCount:(id)a3
{
  objc_storeStrong((id *)&self->_emulatedPerSenderDownCount, a3);
}

- (BKSButtonHapticsDefinition)buttonDefinition
{
  return self->_buttonDefinition;
}

- (void)setButtonDefinition:(id)a3
{
  objc_storeStrong((id *)&self->_buttonDefinition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonDefinition, 0);
  objc_storeStrong((id *)&self->_emulatedPerSenderDownCount, 0);
  objc_destroyWeak((id *)&self->_screenshotGestureRecognizer);
  objc_storeStrong((id *)&self->_gestureRecognizerConfiguration, 0);
  objc_storeStrong((id *)&self->_buttonGestureParameters, 0);
  objc_storeStrong((id *)&self->_buttonActions, 0);
  objc_storeStrong((id *)&self->_hardwareButtonCoordinator, 0);
  objc_storeStrong((id *)&self->_longPressDurationAssertions, 0);
  objc_storeStrong((id *)&self->_hintSuppressionAssertions, 0);
  objc_storeStrong((id *)&self->_fingerDetectEnabledAssertion, 0);
}

- (void)_reconfigureGestureRecognizersForNewMaximumPressCount:oldMaximumPressCount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "GR config: single press requires double to fail", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_reconfigureGestureRecognizersForNewMaximumPressCount:oldMaximumPressCount:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "GR config: double press requires triple to fail", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_reconfigureGestureRecognizersForNewMaximumPressCount:oldMaximumPressCount:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "GR config: single press DOES NOT require double to fail", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_reconfigureGestureRecognizersForNewMaximumPressCount:oldMaximumPressCount:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "GR config: double press DOES NOT require triple to fail", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)emulateHomeButtonEventsIfNeeded:(char)a1 .cold.1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "EMU handled:%d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_4();
}

@end
