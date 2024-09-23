@implementation SBVoiceControlController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_35 != -1)
    dispatch_once(&sharedInstance_onceToken_35, &__block_literal_global_244);
  return (id)sharedInstance___SharedInstance;
}

uint64_t __42__SBVoiceControlController_sharedInstance__block_invoke()
{
  SBVoiceControlController *v0;
  void *v1;

  kdebug_trace();
  v0 = objc_alloc_init(SBVoiceControlController);
  v1 = (void *)sharedInstance___SharedInstance;
  sharedInstance___SharedInstance = (uint64_t)v0;

  return kdebug_trace();
}

- (SBVoiceControlController)init
{
  SBVoiceControlController *v2;
  uint64_t v3;
  SiriLongPressButtonSource *siriHeadsetDeviceSource;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBVoiceControlController;
  v2 = -[SBVoiceControlController init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D97838], "longPressButtonForIdentifier:", 4);
    v3 = objc_claimAutoreleasedReturnValue();
    siriHeadsetDeviceSource = v2->_siriHeadsetDeviceSource;
    v2->_siriHeadsetDeviceSource = (SiriLongPressButtonSource *)v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__spokenLanguageDidChange_, *MEMORY[0x1E0DC7450], 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__updateNextRecognitionAudioInputPaths_, *MEMORY[0x1E0DAC3A0], 0);

  }
  return v2;
}

- (id)siriBluetoothDeviceSource:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "sb_siriBluetoothDeviceSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0D97810], "bluetoothDeviceForIdentifier:bluetoothDevice:", 3, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sb_setSiriBluetoothDeviceSource:", v4);
  }

  return v4;
}

- (void)configureVoiceControl
{
  -[SBVoiceControlController _assistantActivationSettingsDidChange:](self, "_assistantActivationSettingsDidChange:", 0);
}

- (void)dismissTransientOverlay
{
  SBVoiceControlTransientOverlayViewController *transientOverlayViewController;
  SBVoiceControlTransientOverlayViewController *v3;
  id v4;

  transientOverlayViewController = self->_transientOverlayViewController;
  self->_transientOverlayViewController = 0;
  v3 = transientOverlayViewController;

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissTransientOverlayViewController:animated:completion:", v3, 1, 0);

}

- (BOOL)isVisible
{
  void *v3;
  void *v4;

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transientOverlayPresentationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v4, "isTopmostPresentedViewController:", self->_transientOverlayViewController);

  return (char)self;
}

- (void)voiceControlTransientOverlayViewControllerRequestsDismissal:(id)a3
{
  void *v4;
  SBVoiceControlTransientOverlayViewController *v5;

  v5 = (SBVoiceControlTransientOverlayViewController *)a3;
  if (self->_transientOverlayViewController == v5)
  {
    self->_transientOverlayViewController = 0;

  }
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissTransientOverlayViewController:animated:completion:", v5, 1, 0);

}

- (void)voiceControlTransientOverlayViewControllerDidDisappear:(id)a3
{
  SBVoiceControlTransientOverlayViewController *v4;
  SBVoiceControlTransientOverlayViewController *v5;

  v4 = (SBVoiceControlTransientOverlayViewController *)a3;
  if (self->_transientOverlayViewController == v4)
  {
    self->_transientOverlayViewController = 0;
    v5 = v4;

    v4 = v5;
  }

}

- (BOOL)handleHomeButtonHeld
{
  void *v3;
  SBVoiceControlTransientOverlayViewController *v4;
  SBVoiceControlTransientOverlayViewController *transientOverlayViewController;
  void *v6;
  SBVoiceControlTransientOverlayViewController *v7;

  if (-[SBVoiceControlController _shouldEnterVoiceControl](self, "_shouldEnterVoiceControl")
    && _AXSHomeButtonAssistant() == 1)
  {
    if (!self->_transientOverlayViewController)
    {
      +[SBVoiceControlPresentationSource sourceFromHomeButton](SBVoiceControlPresentationSource, "sourceFromHomeButton");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[SBVoiceControlController _newVoiceControlTransientOverlayViewControllerWithSource:](self, "_newVoiceControlTransientOverlayViewControllerWithSource:", v3);
      transientOverlayViewController = self->_transientOverlayViewController;
      self->_transientOverlayViewController = v4;

      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "presentTransientOverlayViewController:animated:completion:", self->_transientOverlayViewController, 1, 0);
LABEL_7:

      return 1;
    }
  }
  else
  {
    v7 = self->_transientOverlayViewController;
    if (v7)
    {
      +[SBVoiceControlPresentationSource sourceFromHomeButton](SBVoiceControlPresentationSource, "sourceFromHomeButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBVoiceControlTransientOverlayViewController resetSessionWithSource:](v7, "resetSessionWithSource:", v6);
      goto LABEL_7;
    }
  }
  return 0;
}

- (void)_performDelayedHeadsetActionForAssistant
{
  void *v3;
  id v4;

  self->_delayedAssistantActivationPending = 0;
  +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[SBConferenceManager sharedInstance](SBConferenceManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "inCall") & 1) == 0
    && (objc_msgSend(v4, "incomingCallExists") & 1) == 0
    && (objc_msgSend(v3, "inFaceTime") & 1) == 0
    && (objc_msgSend(v3, "faceTimeInvitationExists") & 1) == 0)
  {
    -[SiriLongPressButtonSource didRecognizeLongPress](self->_siriHeadsetDeviceSource, "didRecognizeLongPress");
    self->_headsetDownDelayedActionPerformed = 1;
  }

}

- (void)_performDelayedHeadsetActionForVoiceControl
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  SBVoiceControlTransientOverlayViewController *v10;
  SBVoiceControlTransientOverlayViewController *transientOverlayViewController;
  SBVoiceControlTransientOverlayViewController *v12;
  void *v13;
  id v14;

  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "policyAggregator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowsCapability:", 4);

  if ((v5 & 1) == 0)
  {
    if (-[SBVoiceControlController _shouldEnterVoiceControl](self, "_shouldEnterVoiceControl")
      && (objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "attributeForKey:", *MEMORY[0x1E0D47FC0]),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "BOOLValue"),
          v7,
          v6,
          v8))
    {
      if (!self->_transientOverlayViewController)
      {
        self->_headsetDownDelayedActionPerformed = 1;
        +[SBVoiceControlPresentationSource sourceFromHeadsetButton](SBVoiceControlPresentationSource, "sourceFromHeadsetButton");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[SBVoiceControlController _newVoiceControlTransientOverlayViewControllerWithSource:](self, "_newVoiceControlTransientOverlayViewControllerWithSource:", v9);
        transientOverlayViewController = self->_transientOverlayViewController;
        self->_transientOverlayViewController = v10;

        +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "presentTransientOverlayViewController:animated:completion:", self->_transientOverlayViewController, 1, 0);

      }
    }
    else
    {
      v12 = self->_transientOverlayViewController;
      if (v12)
      {
        +[SBVoiceControlPresentationSource sourceFromHeadsetButton](SBVoiceControlPresentationSource, "sourceFromHeadsetButton");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBVoiceControlTransientOverlayViewController resetSessionWithSource:](v12, "resetSessionWithSource:", v13);

        self->_headsetDownDelayedActionPerformed = 1;
      }
    }
  }
}

- (void)_prepareDelayedHeadsetAction
{
  void *v3;
  void *v4;
  int v5;
  double v6;
  double v7;
  SiriAssertion *v8;
  SiriAssertion *siriPreheatAssertion;

  self->_headsetDownDelayedActionPerformed = 0;
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "policyAggregator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowsCapability:", 5);

  if (v5)
  {
    self->_delayedAssistantActivationPending = 1;
    -[SiriLongPressButtonSource longPressInterval](self->_siriHeadsetDeviceSource, "longPressInterval");
    v7 = v6;
    -[SBVoiceControlController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__performDelayedHeadsetActionForAssistant, 0);
    if (v7 > 0.0)
    {
      -[SiriAssertion invalidate](self->_siriPreheatAssertion, "invalidate");
      -[SiriLongPressButtonSource prepareForActivation](self->_siriHeadsetDeviceSource, "prepareForActivation");
      v8 = (SiriAssertion *)objc_claimAutoreleasedReturnValue();
      siriPreheatAssertion = self->_siriPreheatAssertion;
      self->_siriPreheatAssertion = v8;

    }
  }
  else if (-[SBVoiceControlController _shouldEnterVoiceControl](self, "_shouldEnterVoiceControl")
         || self->_transientOverlayViewController)
  {
    -[SBVoiceControlController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__performDelayedHeadsetActionForVoiceControl, 0, 1.3);
  }
}

- (void)_cancelDelayedHeadsetAction
{
  SiriAssertion *siriPreheatAssertion;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__performDelayedHeadsetActionForVoiceControl, 0);
  if (self->_delayedAssistantActivationPending)
  {
    self->_delayedAssistantActivationPending = 0;
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__performDelayedHeadsetActionForAssistant, 0);
    -[SiriAssertion invalidate](self->_siriPreheatAssertion, "invalidate");
    siriPreheatAssertion = self->_siriPreheatAssertion;
    self->_siriPreheatAssertion = 0;

  }
}

- (void)handleHeadsetButtonDownWithClickCount:(unint64_t)a3
{
  self->_headsetDownDelayedActionPerformed = 0;
  if (a3)
    -[SBVoiceControlController _cancelDelayedHeadsetAction](self, "_cancelDelayedHeadsetAction");
  else
    -[SBVoiceControlController _prepareDelayedHeadsetAction](self, "_prepareDelayedHeadsetAction");
}

- (BOOL)handleHeadsetButtonUp
{
  void *v3;
  void *v4;
  char v5;
  SBVoiceControlTransientOverlayViewController *transientOverlayViewController;

  -[SBVoiceControlController _cancelDelayedHeadsetAction](self, "_cancelDelayedHeadsetAction");
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "policyAggregator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowsCapability:", 4);

  if ((v5 & 1) != 0)
    return 0;
  transientOverlayViewController = self->_transientOverlayViewController;
  if (transientOverlayViewController)
  {
    -[SBVoiceControlTransientOverlayViewController handleHeadsetButtonUpFromButtonDownSource:](transientOverlayViewController, "handleHeadsetButtonUpFromButtonDownSource:", self->_headsetDownDelayedActionPerformed);
  }
  else if (!self->_headsetDownDelayedActionPerformed)
  {
    return 0;
  }
  self->_headsetDownDelayedActionPerformed = 0;
  return 1;
}

- (BOOL)handleHeadsetButtonUpNotInCall
{
  int v3;

  if (self->_headsetDownDelayedActionPerformed)
    goto LABEL_4;
  v3 = -[SiriLongPressButtonSource isActive](self->_siriHeadsetDeviceSource, "isActive");
  if (v3)
  {
    -[SiriLongPressButtonSource didRecognizeButtonSinglePressUp](self->_siriHeadsetDeviceSource, "didRecognizeButtonSinglePressUp");
LABEL_4:
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)_assistantActivationSettingsDidChange:(id)a3
{
  void *v3;
  void *v4;
  Class v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  void *v10;
  __int16 v11;
  __int16 v12;

  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "policyAggregator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "allowsCapability:", 4))
  {
    v5 = NSClassFromString(CFSTR("VSCacheUpdateListener"));

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0DC7400], "sharedListener");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stopListening");

      SBLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v12 = 0;
        v8 = "Unregistering voice control controller for voice services cache update";
        v9 = (uint8_t *)&v12;
LABEL_8:
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, v8, v9, 2u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0DC7400], "sharedListener");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startListening");

  SBLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v11 = 0;
    v8 = "Registering voice control controller for voice services cache update";
    v9 = (uint8_t *)&v11;
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_spokenLanguageDidChange:(id)a3
{
  -[SBVoiceControlController _assistantActivationSettingsDidChange:](self, "_assistantActivationSettingsDidChange:", 0);
}

- (void)bluetoothDeviceInitiatedVoiceControl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  SBVoiceControlTransientOverlayViewController *v17;
  SBVoiceControlTransientOverlayViewController *transientOverlayViewController;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "policyAggregator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "allowsCapability:", 5);

    if (v7)
    {
      -[SBVoiceControlController siriBluetoothDeviceSource:](self, "siriBluetoothDeviceSource:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138543618;
        v22 = v8;
        v23 = 2114;
        v24 = v4;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Telling siri to activate for BTHeadset (source:%{public}@ device:%{public}@)", (uint8_t *)&v21, 0x16u);
      }

      objc_msgSend(v8, "activate");
      goto LABEL_15;
    }
    v10 = -[SBVoiceControlController _shouldEnterVoiceControl](self, "_shouldEnterVoiceControl");
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "voiceControlDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "disableVoiceControlForBluetoothRequests");

    SBLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (!v10 || v13)
    {
      if (v15)
      {
        NSStringFromBOOL();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromBOOL();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v19;
        v23 = 2114;
        v24 = v20;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_INFO, "Not starting VC because shouldNoEnter: %{public}@ disabledByPref: %{public}@", (uint8_t *)&v21, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "endVoiceCommand:", v4);
      goto LABEL_15;
    }
    if (v15)
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_INFO, "Activing VC for BT headset", (uint8_t *)&v21, 2u);
    }

    if (!self->_transientOverlayViewController)
    {
      +[SBVoiceControlPresentationSource sourceFromBluetoothDevice:](SBVoiceControlPresentationSource, "sourceFromBluetoothDevice:", v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[SBVoiceControlController _newVoiceControlTransientOverlayViewControllerWithSource:](self, "_newVoiceControlTransientOverlayViewControllerWithSource:", v16);
      transientOverlayViewController = self->_transientOverlayViewController;
      self->_transientOverlayViewController = v17;

      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentTransientOverlayViewController:animated:completion:", self->_transientOverlayViewController, 1, 0);
LABEL_15:

    }
  }

}

- (void)bluetoothDeviceEndedVoiceControl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = a3;
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "policyAggregator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "allowsCapability:", 4);

  SBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Telling siri to deactivate for BTHeadset", buf, 2u);
    }

    -[SBVoiceControlController siriBluetoothDeviceSource:](self, "siriBluetoothDeviceSource:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deactivate");

  }
  else
  {
    if (v9)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Telling VC to dismiss for BTHeadset", v11, 2u);
    }

    -[SBVoiceControlController dismissTransientOverlay](self, "dismissTransientOverlay");
  }

}

- (BOOL)_shouldEnterVoiceControl
{
  void *v3;
  void *v4;
  char v5;
  __CFString *v6;
  NSObject *v7;
  const char *v8;
  const __CFString *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  uint64_t v16;
  const __CFSet *v17;
  const void *v18;
  NSObject *v19;
  NSObject *v20;
  id v22;
  uint8_t buf[4];
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "policyAggregator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v5 = objc_msgSend(v4, "allowsCapability:explanation:", 8, &v22);
  v6 = (__CFString *)v22;

  if ((v5 & 1) != 0)
  {
    if (NSClassFromString(CFSTR("VSRecognitionSession")))
    {
      if (self->_transientOverlayViewController)
      {
        SBLogCommon();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v8 = "Not entering VC because we're already in VC";
LABEL_16:
          v10 = v7;
          v11 = 2;
LABEL_17:
          _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, v8, buf, v11);
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "attributeForKey:", *MEMORY[0x1E0D48290]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "BOOLValue");

        if ((v14 & 1) != 0)
        {
          v15 = 1;
          goto LABEL_19;
        }
        SBLogCommon();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v8 = "Not entering VC because we don't have an audio input device";
          goto LABEL_16;
        }
      }
    }
    else
    {
      SBLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v8 = "Not entering VC because VSRecognitionSession class is missing";
        goto LABEL_16;
      }
    }
  }
  else
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = CFSTR("(unknown reason");
      if (v6)
        v9 = v6;
      *(_DWORD *)buf = 138412290;
      v24 = v9;
      v8 = "Not entering VC because: %@";
      v10 = v7;
      v11 = 12;
      goto LABEL_17;
    }
  }

  v15 = 0;
LABEL_19:
  v16 = VSPreferencesCopyAvailableLanguageIdentifiers();
  if (v16)
  {
    v17 = (const __CFSet *)v16;
    v18 = (const void *)VSPreferencesCopySpokenLanguageIdentifier();
    if (!CFSetContainsValue(v17, v18))
    {
      SBLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[SBVoiceControlController _shouldEnterVoiceControl].cold.2((uint64_t)v18, v19);

      v15 = 0;
    }
    if (v18)
      CFRelease(v18);
    CFRelease(v17);
  }
  else
  {
    SBLogCommon();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SBVoiceControlController _shouldEnterVoiceControl].cold.1(v20);

    v15 = 0;
  }

  return v15;
}

- (void)_updateNextRecognitionAudioInputPaths:(id)a3
{
  void *v4;
  NSArray *v5;
  NSArray *nextRecognitionAudioInputPaths;
  SBVoiceControlTransientOverlayViewController *transientOverlayViewController;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  nextRecognitionAudioInputPaths = self->_nextRecognitionAudioInputPaths;
  self->_nextRecognitionAudioInputPaths = v5;

  transientOverlayViewController = self->_transientOverlayViewController;
  if (transientOverlayViewController)
    -[SBVoiceControlTransientOverlayViewController setNextRecognitionAudioInputPaths:](transientOverlayViewController, "setNextRecognitionAudioInputPaths:", self->_nextRecognitionAudioInputPaths);
}

- (id)_newVoiceControlTransientOverlayViewControllerWithSource:(id)a3
{
  id v4;
  SBVoiceControlTransientOverlayViewController *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = -[SBVoiceControlTransientOverlayViewController initWithSource:]([SBVoiceControlTransientOverlayViewController alloc], "initWithSource:", v4);

  -[SBVoiceControlTransientOverlayViewController setVoiceControlDelegate:](v5, "setVoiceControlDelegate:", self);
  objc_msgSend((id)SBApp, "authenticationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isUILocked") & 1) != 0 || (objc_msgSend(v6, "isAuthenticated") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46EE8]) == 2)
      v8 = objc_msgSend(v6, "hasPasscodeSet") ^ 1;
    else
      v8 = 1;

  }
  else
  {
    v8 = 1;
  }
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "voiceControlDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "isVoiceControlLoggingEnabled"))
  {
    -[SBVoiceControlTransientOverlayViewController setVoiceControlLoggingEnabled:](v5, "setVoiceControlLoggingEnabled:", 1);
  }
  else
  {
    +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBVoiceControlTransientOverlayViewController setVoiceControlLoggingEnabled:](v5, "setVoiceControlLoggingEnabled:", objc_msgSend(v12, "isInternalInstall"));

  }
  -[SBVoiceControlTransientOverlayViewController setShouldDisableHandlerActions:](v5, "setShouldDisableHandlerActions:", objc_msgSend(v11, "disableHandlerActions"));
  -[SBVoiceControlTransientOverlayViewController setShouldDisableVoiceControlForBluetoothRequests:](v5, "setShouldDisableVoiceControlForBluetoothRequests:", objc_msgSend(v11, "disableVoiceControlForBluetoothRequests"));
  -[SBVoiceControlTransientOverlayViewController setShouldAllowSensitiveActions:](v5, "setShouldAllowSensitiveActions:", v8);
  -[SBVoiceControlTransientOverlayViewController setNextRecognitionAudioInputPaths:](v5, "setNextRecognitionAudioInputPaths:", self->_nextRecognitionAudioInputPaths);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriPreheatAssertion, 0);
  objc_storeStrong((id *)&self->_siriHeadsetDeviceSource, 0);
  objc_storeStrong((id *)&self->_transientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_nextRecognitionAudioInputPaths, 0);
}

- (void)_shouldEnterVoiceControl
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Language %{public}@ is not valid for VoiceControl", (uint8_t *)&v2, 0xCu);
}

@end
