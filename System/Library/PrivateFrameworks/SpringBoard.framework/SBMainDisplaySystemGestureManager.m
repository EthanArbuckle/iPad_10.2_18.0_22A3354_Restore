@implementation SBMainDisplaySystemGestureManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_32 != -1)
    dispatch_once(&sharedInstance_onceToken_32, &__block_literal_global_229);
  return (id)sharedInstance___sharedInstance_17;
}

void __51__SBMainDisplaySystemGestureManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SBMainDisplaySystemGestureManager _init]([SBMainDisplaySystemGestureManager alloc], "_init");
  v1 = (void *)sharedInstance___sharedInstance_17;
  sharedInstance___sharedInstance_17 = (uint64_t)v0;

}

- (id)_initWithDisplayIdentity:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplaySystemGestureManager.m"), 54, CFSTR("unallowed initializer"));

  return -[SBMainDisplaySystemGestureManager _init](self, "_init");
}

- (id)_init
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  objc_msgSend(MEMORY[0x1E0D228F8], "mainIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)SBMainDisplaySystemGestureManager;
  v4 = -[SBSystemGestureManager _initWithDisplayIdentity:](&v9, sel__initWithDisplayIdentity_, v3);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D228F8], "mainIdentity");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v4[25];
    v4[25] = v5;

    *((_BYTE *)v4 + 208) = BSSystemHasCapability();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel__evaluateEnablement, CFSTR("SBWorkspaceMedusaCapabilityChangedNotification"), 0);

    objc_msgSend(v4, "_evaluateEnablement");
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBMainDisplaySystemGestureManager;
  -[SBMainDisplaySystemGestureManager dealloc](&v4, sel_dealloc);
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBMainDisplaySystemGestureManager;
  -[SBSystemGestureManager descriptionBuilderWithMultilinePrefix:](&v7, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendBool:withName:", self->_multitaskingGesturesEnabled, CFSTR("_multitaskingGesturesEnabled"));
  return v4;
}

- (BOOL)_isGestureWithTypeAllowed:(unint64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  BOOL v18;
  BOOL v21;
  void *v22;
  void *v23;
  char v24;
  __CFString *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  id v31;
  objc_super v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  +[SBUIController sharedInstanceIfExists](SBUIController, "sharedInstanceIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isIconListViewTornDown");

  +[SBIconController sharedInstanceIfExists](SBIconController, "sharedInstanceIfExists");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "iconManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isFolderScrolling");

  if ((v6 & 1) != 0 || !v9)
  {
    v32.receiver = self;
    v32.super_class = (Class)SBMainDisplaySystemGestureManager;
    v12 = -[SBSystemGestureManager _isGestureWithTypeAllowed:](&v32, sel__isGestureWithTypeAllowed_, a3);
    +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isInSetupMode");

    if (v14)
    {
      +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isInSetupModeReadyToExit");

      v18 = a3 == 2 || a3 == 11;
      if (v16)
        v21 = a3 == 48 || a3 == 18 || (a3 & 0xFFFFFFFFFFFFFFFBLL) == 41;
      else
        v21 = 0;
      return v18 || v21;
    }
    else
    {
      +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "policyAggregator");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      v24 = objc_msgSend(v23, "allowsCapability:explanation:", 7, &v31);
      v25 = (__CFString *)v31;

      if ((v24 & 1) == 0)
      {
        SBLogSystemGestureDetail();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0D228F8], "mainIdentity");
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = (void *)v27;
          v29 = CFSTR("(unknown reason)");
          if (v25)
            v29 = v25;
          *(_DWORD *)buf = 138543618;
          v34 = v27;
          v35 = 2112;
          v36 = v29;
          _os_log_impl(&dword_1D0540000, v26, OS_LOG_TYPE_INFO, "(Display - %{public}@) Not allowing system gestures because: %@", buf, 0x16u);

        }
        v12 = 0;
      }

    }
  }
  else
  {
    SBLogSystemGestureDetail();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0D228F8], "mainIdentity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = (uint64_t)v11;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, "(Display - %{public}@) Not allowing system gestures because we are scrolling a folder", buf, 0xCu);

    }
    return 0;
  }
  return v12;
}

- (BOOL)_shouldEnableSystemGestureWithType:(unint64_t)a3
{
  char v3;
  void *v4;
  char v5;
  void *v8;
  void *v10;
  void *v11;

  v3 = 1;
  switch(a3)
  {
    case 0uLL:
    case 0x41uLL:
    case 0x8BuLL:
      return 0;
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x44uLL:
    case 0x66uLL:
    case 0x67uLL:
    case 0x68uLL:
    case 0x69uLL:
    case 0x70uLL:
    case 0x71uLL:
    case 0x75uLL:
    case 0x76uLL:
    case 0x77uLL:
    case 0x78uLL:
      if (__sb__runningInSpringBoard())
      {
        return SBFEffectiveDeviceClass() == 2;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v8, "userInterfaceIdiom") == 1;
LABEL_6:

      }
      return v3;
    case 0x12uLL:
    case 0x13uLL:
      if (__sb__runningInSpringBoard())
      {
        return SBFEffectiveDeviceClass() == 2 && self->_multitaskingGesturesEnabled;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v10, "userInterfaceIdiom") == 1 && self->_multitaskingGesturesEnabled;

      }
      return v3;
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x1EuLL:
    case 0x1FuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x2AuLL:
    case 0x2BuLL:
    case 0x2CuLL:
    case 0x35uLL:
    case 0x36uLL:
    case 0x39uLL:
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isMedusaCapable");

      return v5;
    case 0x37uLL:
    case 0x38uLL:
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isMedusaCapable"))
        v3 = SBFIsChamoisOverflowGestureAvailable();
      else
        v3 = 0;
      goto LABEL_6;
    case 0x3AuLL:
    case 0x60uLL:
    case 0x61uLL:
    case 0x62uLL:
    case 0x63uLL:
    case 0x64uLL:
    case 0x65uLL:
      return SBFEffectiveHomeButtonType() == 2;
    case 0x84uLL:
    case 0x85uLL:
      return SBUIIsSystemApertureEnabled();
    case 0x87uLL:
      objc_msgSend((id)SBApp, "systemActionControl");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v11 != 0;

      return v3;
    case 0x88uLL:
    case 0x89uLL:
      if (!+[SBCaptureHardwareButton isCaptureFeatureEnabled]())
        return 0;
      if ((+[SBCaptureHardwareButton deviceSupportsCaptureButton]() & 1) == 0)
        return +[SBCaptureHardwareButton simulateCaptureButtonWithActionButton]();
      return 1;
    default:
      return v3;
  }
}

- (BOOL)shouldSystemGestureReceiveTouchWithLocation:(CGPoint)a3
{
  return -[SBMainDisplaySystemGestureManager shouldSystemGestureReceiveTouchWithLocation:ignoringUCB:](self, "shouldSystemGestureReceiveTouchWithLocation:ignoringUCB:", 0, a3.x, a3.y);
}

- (BOOL)shouldSystemGestureReceiveTouchWithLocation:(CGPoint)a3 ignoringUCB:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  double v13;
  int v14;
  int v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  const __CFString *v39;
  _BYTE v40[128];
  uint64_t v41;
  NSPoint v42;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v41 = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)SBMainDisplaySystemGestureManager;
  v7 = -[SBSystemGestureManager shouldSystemGestureReceiveTouchWithLocation:](&v29, sel_shouldSystemGestureReceiveTouchWithLocation_);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(MEMORY[0x1E0CEA828], "allVisiblePeripheralFrames", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "CGRectValue");
        if (v13 > 60.0)
        {

          v14 = 0;
          goto LABEL_12;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v40, 16);
      if (v10)
        continue;
      break;
    }
  }

  v14 = 1;
  v15 = 1;
  if (!v4)
LABEL_12:
    v15 = objc_msgSend(MEMORY[0x1E0CEA828], "pointIsWithinKeyboardContent:", x, y) ^ 1;
  v16 = v7 & v15;
  SBLogSystemGestureAppSwitcher();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v42.x = x;
    v42.y = y;
    NSStringFromPoint(v42);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    v20 = CFSTR("NO");
    if (v16)
      v21 = CFSTR("YES");
    else
      v21 = CFSTR("NO");
    *(_DWORD *)buf = 138413314;
    v31 = v18;
    if (v4)
      v22 = CFSTR("YES");
    else
      v22 = CFSTR("NO");
    v33 = v21;
    v32 = 2112;
    if (v14)
      v23 = CFSTR("YES");
    else
      v23 = CFSTR("NO");
    v34 = 2112;
    v35 = v22;
    if (!v15)
      v20 = CFSTR("YES");
    v36 = 2112;
    v37 = v23;
    v38 = 2112;
    v39 = v20;
    _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "Should system gesture recieve touch with location:%@ <%@> ignoringUCB:%@ keyboardIsUCB:%@ touchIsInsideKeyboard:%@", buf, 0x34u);

  }
  return v16;
}

- (void)setSystemGesturesDisabledForAccessibility:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBMainDisplaySystemGestureManager;
  -[SBSystemGestureManager setSystemGesturesDisabledForAccessibility:](&v11, sel_setSystemGesturesDisabledForAccessibility_);
  -[SBMainDisplaySystemGestureManager accessibilityZStackParticipant](self, "accessibilityZStackParticipant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || v5)
  {
    if (!v3)
    {
      if (v5)
      {
        -[SBMainDisplaySystemGestureManager accessibilityZStackParticipant](self, "accessibilityZStackParticipant");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "invalidate");

        -[SBMainDisplaySystemGestureManager setAccessibilityZStackParticipant:](self, "setAccessibilityZStackParticipant:", 0);
      }
    }
  }
  else
  {
    objc_msgSend((id)SBApp, "windowSceneManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowSceneForDisplayIdentity:", self->_displayIdentity);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "zStackResolver");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "acquireParticipantWithIdentifier:delegate:", 28, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMainDisplaySystemGestureManager setAccessibilityZStackParticipant:](self, "setAccessibilityZStackParticipant:", v9);

  }
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v4;

  v4 = a4;
  objc_msgSend(v4, "setActivationPolicyForParticipantsBelow:", 0);
  objc_msgSend(v4, "setHomeGestureConsumption:", 1);

}

- (SBFZStackParticipant)accessibilityZStackParticipant
{
  return self->_accessibilityZStackParticipant;
}

- (void)setAccessibilityZStackParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityZStackParticipant, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityZStackParticipant, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
}

@end
