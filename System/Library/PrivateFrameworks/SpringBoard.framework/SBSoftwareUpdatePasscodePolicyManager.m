@implementation SBSoftwareUpdatePasscodePolicyManager

- (SBSoftwareUpdatePasscodePolicyManager)init
{
  void *v3;
  void *v4;
  SBSoftwareUpdatePasscodePolicyManager *v5;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA9E80], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBSoftwareUpdatePasscodePolicyManager initWithLockScreenManager:mobileKeyBag:](self, "initWithLockScreenManager:mobileKeyBag:", v3, v4);

  return v5;
}

- (SBSoftwareUpdatePasscodePolicyManager)initWithLockScreenManager:(id)a3 mobileKeyBag:(id)a4
{
  id v6;
  id v7;
  SBSoftwareUpdatePasscodePolicyManager *v8;
  SBSoftLockoutController *v9;
  SBSoftLockoutController *softLockoutController;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBSoftwareUpdatePasscodePolicyManager;
  v8 = -[SBSoftwareUpdatePasscodePolicyManager init](&v13, sel_init);
  if (v8)
  {
    v9 = -[SBSoftLockoutController initWithBiometricLockoutState:lockScreenManager:]([SBSoftLockoutController alloc], "initWithBiometricLockoutState:lockScreenManager:", 6, v6);
    softLockoutController = v8->_softLockoutController;
    v8->_softLockoutController = v9;

    -[SBSoftLockoutController setDelegate:](v8->_softLockoutController, "setDelegate:", v8);
    objc_storeStrong((id *)&v8->_mobileKeyBag, a4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v8, sel__authRequestCompleted_, *MEMORY[0x1E0DAA230], 0);

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SBSoftLockoutController setDelegate:](self->_softLockoutController, "setDelegate:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DAA230], 0);

  v4.receiver = self;
  v4.super_class = (Class)SBSoftwareUpdatePasscodePolicyManager;
  -[SBSoftwareUpdatePasscodePolicyManager dealloc](&v4, sel_dealloc);
}

- (int64_t)softwareUpdatePasscodePolicy
{
  return self->_softwareUpdatePasscodePolicy;
}

- (void)setSoftwareUpdatePasscodePolicy:(int64_t)a3
{
  if (self->_softwareUpdatePasscodePolicy != a3)
  {
    self->_softwareUpdatePasscodePolicy = a3;
    -[SBSoftLockoutController reload](self->_softLockoutController, "reload");
    self->_passcodeAuthenticationSuccessPending = 0;
  }
}

- (void)noteAuthenticationSucceededWithPasscode:(id)a3
{
  id v4;

  v4 = a3;
  if (-[SBSoftwareUpdatePasscodePolicyManager _effectiveSoftwareUpdatePasscodePolicy](self, "_effectiveSoftwareUpdatePasscodePolicy"))
  {
    SUSUICreateInstallationKeybagWithSecret();
    -[SBSoftwareUpdatePasscodePolicyManager setSoftwareUpdatePasscodePolicy:](self, "setSoftwareUpdatePasscodePolicy:", 0);
  }

}

- (BOOL)requiresLockout
{
  void *v2;
  int v3;

  if (-[SBSoftwareUpdatePasscodePolicyManager _effectiveSoftwareUpdatePasscodePolicy](self, "_effectiveSoftwareUpdatePasscodePolicy") == 2)
  {
    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "hasBeenDismissedSinceKeybagLock") ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)consumePendingUnlock
{
  BOOL passcodeAuthenticationSuccessPending;

  passcodeAuthenticationSuccessPending = self->_passcodeAuthenticationSuccessPending;
  self->_passcodeAuthenticationSuccessPending = 0;
  return passcodeAuthenticationSuccessPending;
}

- (int64_t)_effectiveSoftwareUpdatePasscodePolicy
{
  if (self->_softwareUpdatePasscodePolicy
    && -[SBFMobileKeyBag hasPasscodeSet](self->_mobileKeyBag, "hasPasscodeSet"))
  {
    return self->_softwareUpdatePasscodePolicy;
  }
  else
  {
    return 0;
  }
}

- (void)_authRequestCompleted:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  id v8;

  objc_msgSend(a3, "userInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DAA228]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DAA238]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7
    && objc_msgSend(v4, "integerValue") == 1
    && objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DAA240]))
  {
    self->_passcodeAuthenticationSuccessPending = 1;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileKeyBag, 0);
  objc_storeStrong((id *)&self->_softLockoutController, 0);
}

@end
