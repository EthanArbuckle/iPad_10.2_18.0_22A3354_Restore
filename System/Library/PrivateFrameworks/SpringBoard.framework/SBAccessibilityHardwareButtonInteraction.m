@implementation SBAccessibilityHardwareButtonInteraction

+ (id)hardwareButtonInteractionForHomeButton
{
  return -[SBAccessibilityHardwareButtonInteraction initWithButtonType:]([SBAccessibilityHardwareButtonInteraction alloc], "initWithButtonType:", 0);
}

+ (id)hardwareButtonInteractionForLockButton
{
  return -[SBAccessibilityHardwareButtonInteraction initWithButtonType:]([SBAccessibilityHardwareButtonInteraction alloc], "initWithButtonType:", 1);
}

- (SBAccessibilityHardwareButtonInteraction)initWithButtonType:(unint64_t)a3
{
  SBAccessibilityHardwareButtonInteraction *v4;
  SBAccessibilityHardwareButtonInteraction *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBAccessibilityHardwareButtonInteraction;
  v4 = -[SBAccessibilityHardwareButtonInteraction init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_buttonType = a3;
    -[SBAccessibilityHardwareButtonInteraction _registerAsNotificationObserver](v4, "_registerAsNotificationObserver");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SBAccessibilityHardwareButtonInteraction _unregisterAsNotificationObserver](self, "_unregisterAsNotificationObserver");
  v3.receiver = self;
  v3.super_class = (Class)SBAccessibilityHardwareButtonInteraction;
  -[SBAccessibilityHardwareButtonInteraction dealloc](&v3, sel_dealloc);
}

- (id)hardwareButtonGestureParameters
{
  SBMutableHardwareButtonGestureParameters *v3;
  uint64_t v4;

  v3 = objc_alloc_init(SBMutableHardwareButtonGestureParameters);
  if (-[SBAccessibilityHardwareButtonInteraction _supportsTripleClick](self, "_supportsTripleClick"))
    v4 = 3;
  else
    v4 = 2;
  -[SBMutableHardwareButtonGestureParameters setMaximumPressCount:](v3, "setMaximumPressCount:", v4);
  -[SBAccessibilityHardwareButtonInteraction _downToDownInterval](self, "_downToDownInterval");
  -[SBMutableHardwareButtonGestureParameters setMultiplePressTimeInterval:](v3, "setMultiplePressTimeInterval:");
  return v3;
}

- (BOOL)consumeTriplePressUp
{
  _BOOL4 v3;

  v3 = -[SBAccessibilityHardwareButtonInteraction _supportsTripleClick](self, "_supportsTripleClick");
  if (v3
    && !-[SBAccessibilityHardwareButtonInteraction _presentMigrationAlertIfNeeded](self, "_presentMigrationAlertIfNeeded"))
  {
    _AXSHandleTripleClickHomeButtonPress();
  }
  return v3;
}

- (__CFString)_speedChangedNotificationName
{
  unint64_t buttonType;
  __CFString **v3;

  buttonType = self->_buttonType;
  if (!buttonType)
  {
    v3 = (__CFString **)MEMORY[0x1E0DDE130];
    return *v3;
  }
  if (buttonType == 1)
  {
    v3 = (__CFString **)MEMORY[0x1E0DDE240];
    return *v3;
  }
  return 0;
}

- (void)_registerAsNotificationObserver
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_SBAXButtonPrefsDidChangeNotification, (CFStringRef)*MEMORY[0x1E0DDE2C8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_SBAXButtonPrefsDidChangeNotification, -[SBAccessibilityHardwareButtonInteraction _speedChangedNotificationName](self, "_speedChangedNotificationName"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_unregisterAsNotificationObserver
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0DDE2C8], 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, -[SBAccessibilityHardwareButtonInteraction _speedChangedNotificationName](self, "_speedChangedNotificationName"), 0);
}

- (void)_accessibilityPrefsDidChange
{
  NSObject *v2;
  uint8_t buf[16];

  SBLogButtonsInteraction();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "reconfiguring due to AX prefs change", buf, 2u);
  }

  BSDispatchMain();
}

void __72__SBAccessibilityHardwareButtonInteraction__accessibilityPrefsDidChange__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "hardwareButtonGestureParameters");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "publishUpdatedParameters:", v2);

}

- (BOOL)_supportsTripleClick
{
  const __CFArray *v2;
  const __CFArray *v3;
  BOOL v4;
  NSObject *v5;

  v2 = (const __CFArray *)_AXSTripleClickCopyOptions();
  if (v2)
  {
    v3 = v2;
    v4 = CFArrayGetCount(v2) > 0;
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  SBLogButtonsInteraction();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBAccessibilityHardwareButtonInteraction _supportsTripleClick].cold.1(v4, v5);

  return v4;
}

- (double)_downToDownInterval
{
  unint64_t buttonType;
  double result;
  float v4;

  buttonType = self->_buttonType;
  if (buttonType)
  {
    result = 0.0;
    if (buttonType != 1)
      return result;
    _AXSSideButtonClickSpeed();
  }
  else
  {
    _AXSHomeClickSpeed();
  }
  return v4;
}

- (BOOL)_presentMigrationAlertIfNeeded
{
  void *v3;
  void *v4;
  NSObject *v5;
  SBTripleClickSOSMigrationAlertItem *v6;
  void *v7;
  BOOL v8;
  uint8_t v10[16];

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sosDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "performedCheckForTripleClickSOSMigrationAlert") & 1) == 0
    && -[SBAccessibilityHardwareButtonInteraction _supportsTripleClick](self, "_supportsTripleClick")
    && objc_msgSend(MEMORY[0x1E0D89868], "currentSOSTriggerMechanism") == 1
    && SBFEffectiveHomeButtonType() == 2)
  {
    SBLogButtonsInteraction();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "showing triple-click migration alert", v10, 2u);
    }

    v6 = objc_alloc_init(SBTripleClickSOSMigrationAlertItem);
    +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activateAlertItem:", v6);

    v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v4, "setPerformedCheckForTripleClickSOSMigrationAlert:", 1);

  return v8;
}

- (unint64_t)buttonType
{
  return self->_buttonType;
}

- (void)_supportsTripleClick
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "AX supports triple click:%{BOOL}u", (uint8_t *)v2, 8u);
}

@end
