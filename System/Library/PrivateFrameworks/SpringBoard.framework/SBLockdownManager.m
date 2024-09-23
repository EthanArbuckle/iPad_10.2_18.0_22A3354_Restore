@implementation SBLockdownManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_53);
  return (id)sharedInstance___sharedInstance_3;
}

void __35__SBLockdownManager_sharedInstance__block_invoke()
{
  SBLockdownManager *v0;
  void *v1;

  v0 = objc_alloc_init(SBLockdownManager);
  v1 = (void *)sharedInstance___sharedInstance_3;
  sharedInstance___sharedInstance_3 = (uint64_t)v0;

}

- (SBLockdownManager)init
{
  SBLockdownManager *v2;
  SBLockdownManager *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBLockdownManager;
  v2 = -[SBLockdownManager init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)lockdownActivationChanged, (CFStringRef)*MEMORY[0x1E0D4DED8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v3;
}

- (void)_resetActivationState
{
  id v3;

  self->_state = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("SBLockdownDeviceActivatedChangedNotification"), self);

}

- (void)_setupActivationState
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "MobileActivation didn't return an ActivationState value or did return an error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (BOOL)brickedDevice
{
  return -[SBLockdownManager lockdownState](self, "lockdownState") != 2;
}

- (int)lockdownState
{
  int result;

  result = self->_state;
  if (!result)
  {
    -[SBLockdownManager _setupActivationState](self, "_setupActivationState");
    return self->_state;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unqiueDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_activatingAlertItem, 0);
}

@end
