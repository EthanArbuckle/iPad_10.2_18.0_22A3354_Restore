@implementation SBSiriHardwareButtonInteraction

+ (id)hardwareButtonInteractionForHomeButton
{
  return -[SBSiriHardwareButtonInteraction initWithSiriButton:]([SBSiriHardwareButtonInteraction alloc], "initWithSiriButton:", 1);
}

+ (id)hardwareButtonInteractionForLockButton
{
  return -[SBSiriHardwareButtonInteraction initWithSiriButton:]([SBSiriHardwareButtonInteraction alloc], "initWithSiriButton:", 2);
}

+ (id)hardwareButtonInteractionForVoiceCommandButton
{
  return -[SBSiriHardwareButtonInteraction initWithSiriButton:]([SBSiriHardwareButtonInteraction alloc], "initWithSiriButton:", 9);
}

- (SBSiriHardwareButtonInteraction)initWithSiriButton:(int64_t)a3
{
  SBSiriHardwareButtonInteraction *v4;
  SBSiriHardwareButtonInteraction *v5;
  uint64_t v6;
  SiriLongPressButtonSource *siriActivationSource;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBSiriHardwareButtonInteraction;
  v4 = -[SBSiriHardwareButtonInteraction init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_siriButtonIdentifier = a3;
    objc_msgSend(MEMORY[0x1E0D97838], "longPressButtonForIdentifier:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    siriActivationSource = v5->_siriActivationSource;
    v5->_siriActivationSource = (SiriLongPressButtonSource *)v6;

    -[SiriLongPressButtonSource longPressInterval](v5->_siriActivationSource, "longPressInterval");
    v5->_activationInterval = v8;
    -[SiriLongPressButtonSource setDelegate:](v5->_siriActivationSource, "setDelegate:", v5);
    -[SiriLongPressButtonSource requestConfigurationUpdatesBasedOnDeviceSettings](v5->_siriActivationSource, "requestConfigurationUpdatesBasedOnDeviceSettings");
  }
  return v5;
}

+ (BOOL)dismissSiriTransientOverlayOnSinglePressUp:(int64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;

  if (+[SBAssistantController isVisible](SBAssistantController, "isVisible"))
  {
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transientOverlayPresentationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowLevel");
    v10 = objc_msgSend(v7, "hasPresentationAboveWindowLevel:");

    if (v10)
    {
      switch(a3)
      {
        case 1:
          if ((objc_msgSend(v7, "handleHomeButtonPress") & 1) == 0)
            break;
          goto LABEL_12;
        case 9:
          if ((objc_msgSend(v7, "handleVoiceCommandButtonPress") & 1) != 0)
            goto LABEL_12;
          break;
        case 2:
          if ((objc_msgSend(v7, "handleLockButtonPress") & 1) == 0)
            break;
LABEL_12:
          v11 = 1;
LABEL_15:

          return v11;
        default:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBSiriHardwareButtonInteraction.m"), 88, CFSTR("We don't handle this activation event"));

          break;
      }
    }
    v11 = 0;
    goto LABEL_15;
  }
  return 0;
}

- (void)configurationDidUpdateOnLongPressSource:(id)a3
{
  double v4;
  NSObject *v5;
  double activationInterval;
  void *v7;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "longPressInterval");
  self->_activationInterval = v4;
  SBLogButtonsInteraction();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    activationInterval = self->_activationInterval;
    v8 = 134217984;
    v9 = activationInterval;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Siri: updating activation interval to %f", (uint8_t *)&v8, 0xCu);
  }

  -[SBSiriHardwareButtonInteraction hardwareButtonGestureParameters](self, "hardwareButtonGestureParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHardwareButtonGestureParametersProviderBase publishUpdatedParameters:](self, "publishUpdatedParameters:", v7);

}

- (void)_siriHomeButtonPrefsDidChange:(id)a3
{
  id v4;

  -[SBSiriHardwareButtonInteraction hardwareButtonGestureParameters](self, "hardwareButtonGestureParameters", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHardwareButtonGestureParametersProviderBase publishUpdatedParameters:](self, "publishUpdatedParameters:", v4);

}

- (void)_preheatSiriForPresentationAfterInterval:(double)a3
{
  SiriAssertion *siriPreheatAssertion;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  SiriAssertion *v9;
  SiriAssertion *v10;
  NSObject *v11;

  siriPreheatAssertion = self->_siriPreheatAssertion;
  if (siriPreheatAssertion)
    -[SiriAssertion invalidate](siriPreheatAssertion, "invalidate", a3);
  SBLogButtonsInteraction();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBSiriHardwareButtonInteraction _preheatSiriForPresentationAfterInterval:].cold.3();

  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "policyAggregator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowsCapability:", 5);

  if (v8)
  {
    -[SiriLongPressButtonSource prepareForActivation](self->_siriActivationSource, "prepareForActivation");
    v9 = (SiriAssertion *)objc_claimAutoreleasedReturnValue();
    v10 = self->_siriPreheatAssertion;
    self->_siriPreheatAssertion = v9;

    SBLogButtonsInteraction();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[SBSiriHardwareButtonInteraction _preheatSiriForPresentationAfterInterval:].cold.1();
  }
  else
  {
    SBLogButtonsInteraction();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[SBSiriHardwareButtonInteraction _preheatSiriForPresentationAfterInterval:].cold.2();
  }

}

- (void)_cancelPreheating
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "Siri: Cancel preheat", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_cancelAllSiriActions
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "Siri: invalidate activation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (BOOL)consumeInitialPressDown
{
  double Current;
  SiriAssertion *v5;
  SiriAssertion *siriButtonDownAssertion;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  void *v15;
  int v16;
  _BOOL4 v17;
  void *v18;
  double activationInterval;
  double v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  -[SiriLongPressButtonSource speechInteractionActivityWithTimestamp:](self->_siriActivationSource, "speechInteractionActivityWithTimestamp:");
  v5 = (SiriAssertion *)objc_claimAutoreleasedReturnValue();
  siriButtonDownAssertion = self->_siriButtonDownAssertion;
  self->_siriButtonDownAssertion = v5;

  SBLogButtonsInteraction();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SBSiriHardwareButtonInteraction consumeInitialPressDown].cold.1();

  +[SBSyncController sharedInstance](SBSyncController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isRestoring"))
  {

LABEL_6:
    SBLogButtonsHome();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      goto LABEL_10;
    }
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v12;
    v13 = "%{public}@ result: not preheating Siri due to SBSyncController restoring/resetting";
LABEL_8:
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v21, 0xCu);

    goto LABEL_9;
  }
  +[SBSyncController sharedInstance](SBSyncController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isResetting");

  if (v10)
    goto LABEL_6;
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isPowerDownTransientOverlayTopmost");

  SBLogButtonsHome();
  v11 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v16)
  {
    if (!v17)
      goto LABEL_9;
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v12;
    v13 = "%{public}@ result: not preheating Siri due to power down transient overlay";
    goto LABEL_8;
  }
  if (v17)
  {
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v18;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, "%{public}@ result: ignored; starting Siri preheat",
      (uint8_t *)&v21,
      0xCu);

  }
  activationInterval = self->_activationInterval;
  v20 = fmax(activationInterval - (Current - self->_initialPressDownTime), 0.0);
  if (activationInterval > v20)
    activationInterval = v20;
  -[SBSiriHardwareButtonInteraction _preheatSiriForPresentationAfterInterval:](self, "_preheatSiriForPresentationAfterInterval:", activationInterval);
LABEL_10:
  self->_initialPressDownTime = 0.0;
  return 0;
}

- (BOOL)consumeSinglePressUp
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  BOOL v7;

  if (!-[SiriLongPressButtonSource isActive](self->_siriActivationSource, "isActive"))
    return 0;
  objc_msgSend((id)objc_opt_class(), "dismissSiriTransientOverlayOnSinglePressUp:", self->_siriButtonIdentifier);
  -[SiriLongPressButtonSource didRecognizeButtonSinglePressUp](self->_siriActivationSource, "didRecognizeButtonSinglePressUp");
  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "homeButtonType");

  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "contentObscuresEmbeddedDisplayScreen");
  if (v4 == 2)
    v7 = 1;
  else
    v7 = v6;

  return v7;
}

- (BOOL)consumeLongPress
{
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "policyAggregator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowsCapability:", 5);

  if (v6)
  {
    SBLogButtonsHome();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "%{public}@ result: Siri: Siri handled it", (uint8_t *)&v15, 0xCu);

    }
    -[SiriLongPressButtonSource didRecognizeLongPress](self->_siriActivationSource, "didRecognizeLongPress");
LABEL_9:
    +[SBCommandTabController sharedInstance](SBCommandTabController, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dismiss");

    return 1;
  }
  +[SBVoiceControlController sharedInstance](SBVoiceControlController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "handleHomeButtonHeld");

  if (v10)
  {
    SBLogButtonsHome();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v12;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, "%{public}@ result: Siri: voice control handled it", (uint8_t *)&v15, 0xCu);

    }
    goto LABEL_9;
  }
  return 0;
}

- (id)hardwareButtonGestureParameters
{
  SBMutableHardwareButtonGestureParameters *v3;

  v3 = objc_alloc_init(SBMutableHardwareButtonGestureParameters);
  -[SBMutableHardwareButtonGestureParameters setLongPressTimeInterval:](v3, "setLongPressTimeInterval:", self->_activationInterval);
  return v3;
}

- (double)initialPressDownTime
{
  return self->_initialPressDownTime;
}

- (void)setInitialPressDownTime:(double)a3
{
  self->_initialPressDownTime = a3;
}

- (int64_t)siriButtonIdentifier
{
  return self->_siriButtonIdentifier;
}

- (void)setSiriButtonIdentifier:(int64_t)a3
{
  self->_siriButtonIdentifier = a3;
}

- (SiriLongPressButtonSource)siriActivationSource
{
  return self->_siriActivationSource;
}

- (void)setSiriActivationSource:(id)a3
{
  objc_storeStrong((id *)&self->_siriActivationSource, a3);
}

- (double)activationInterval
{
  return self->_activationInterval;
}

- (void)setActivationInterval:(double)a3
{
  self->_activationInterval = a3;
}

- (SiriAssertion)siriPreheatAssertion
{
  return self->_siriPreheatAssertion;
}

- (void)setSiriPreheatAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_siriPreheatAssertion, a3);
}

- (SiriAssertion)siriButtonDownAssertion
{
  return self->_siriButtonDownAssertion;
}

- (void)setSiriButtonDownAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_siriButtonDownAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriButtonDownAssertion, 0);
  objc_storeStrong((id *)&self->_siriPreheatAssertion, 0);
  objc_storeStrong((id *)&self->_siriActivationSource, 0);
}

- (void)_preheatSiriForPresentationAfterInterval:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "Siri: Successfully started preheat", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_preheatSiriForPresentationAfterInterval:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "Siri: shouldn't enter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_preheatSiriForPresentationAfterInterval:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "Siri: preheat", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)consumeInitialPressDown
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "Siri: speech interaction activity started", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
