@implementation SBCaptureButtonMCProfileRestriction

- (SBCaptureButtonMCProfileRestriction)initWithCoordinator:(id)a3
{
  SBCaptureButtonMCProfileRestriction *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBCaptureButtonMCProfileRestriction;
  v3 = -[SBCaptureButtonInternalRestrictionGlue initWithCoordinator:](&v6, sel_initWithCoordinator_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerObserver:", v3);
    -[SBCaptureButtonMCProfileRestriction profileConnectionDidReceiveEffectiveSettingsChangedNotification:userInfo:](v3, "profileConnectionDidReceiveEffectiveSettingsChangedNotification:userInfo:", v4, 0);

  }
  return v3;
}

- (void)invalidate
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBCaptureButtonMCProfileRestriction;
  -[SBCaptureButtonInternalRestrictionGlue invalidate](&v4, sel_invalidate);
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  if (objc_msgSend(a3, "isCameraAllowed"))
    -[SBCaptureButtonInternalRestrictionGlue relinquishRestriction](self, "relinquishRestriction");
  else
    -[SBCaptureButtonInternalRestrictionGlue acquireRestriction:](self, "acquireRestriction:", CFSTR("MCProfileConnection isCameraAllowed is false"));
}

@end
