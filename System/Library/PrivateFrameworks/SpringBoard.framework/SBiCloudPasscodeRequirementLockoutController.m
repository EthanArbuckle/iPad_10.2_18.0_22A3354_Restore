@implementation SBiCloudPasscodeRequirementLockoutController

- (SBiCloudPasscodeRequirementLockoutController)initWithLockScreenManager:(id)a3 mobileKeyBag:(id)a4
{
  id v6;
  id v7;
  SBiCloudPasscodeRequirementLockoutController *v8;
  SBSoftLockoutController *v9;
  SBSoftLockoutController *lockOutController;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBiCloudPasscodeRequirementLockoutController;
  v8 = -[SBiCloudPasscodeRequirementLockoutController init](&v12, sel_init);
  if (v8)
  {
    v9 = -[SBSoftLockoutController initWithBiometricLockoutState:lockScreenManager:]([SBSoftLockoutController alloc], "initWithBiometricLockoutState:lockScreenManager:", 7, v6);
    lockOutController = v8->_lockOutController;
    v8->_lockOutController = v9;

    -[SBSoftLockoutController setDelegate:](v8->_lockOutController, "setDelegate:", v8);
    objc_storeStrong((id *)&v8->_mobileKeybag, a4);
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[SBSoftLockoutController setDelegate:](self->_lockOutController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBiCloudPasscodeRequirementLockoutController;
  -[SBiCloudPasscodeRequirementLockoutController dealloc](&v3, sel_dealloc);
}

- (BOOL)desiresPasscode
{
  return (objc_msgSend(MEMORY[0x1E0D11670], "needPasscodeForHSA2EscrowRecordUpdate:", 0) & 0xFFFFFFFE) == 2;
}

- (void)noteAuthenticationSucceededWithPasscode:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  _BOOL8 v7;
  _QWORD v8[5];

  v4 = (objc_class *)MEMORY[0x1E0D11670];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setPassphrase:", v5);

  self->_providedPasscode = 1;
  v7 = -[SBiCloudPasscodeRequirementLockoutController _deviceHasComplexPasscode](self, "_deviceHasComplexPasscode");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88__SBiCloudPasscodeRequirementLockoutController_noteAuthenticationSucceededWithPasscode___block_invoke;
  v8[3] = &unk_1E8EA78D8;
  v8[4] = self;
  objc_msgSend(v6, "prepareHSA2EscrowRecordContents:reply:", v7, v8);

}

void __88__SBiCloudPasscodeRequirementLockoutController_noteAuthenticationSucceededWithPasscode___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__SBiCloudPasscodeRequirementLockoutController_noteAuthenticationSucceededWithPasscode___block_invoke_2;
  block[3] = &unk_1E8E9DED8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __88__SBiCloudPasscodeRequirementLockoutController_noteAuthenticationSucceededWithPasscode___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "reload");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  return result;
}

- (BOOL)requiresLockout
{
  void *v3;
  int v4;

  if (!self->_providedPasscode
    && objc_msgSend(MEMORY[0x1E0D11670], "needPasscodeForHSA2EscrowRecordUpdate:", 0) == 3
    && -[SBFMobileKeyBag hasPasscodeSet](self->_mobileKeybag, "hasPasscodeSet"))
  {
    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasBeenDismissedSinceKeybagLock") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)_deviceHasComplexPasscode
{
  return (SBUICurrentPasscodeStyleForUser() & 0xFFFFFFFE) == 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileKeybag, 0);
  objc_storeStrong((id *)&self->_lockOutController, 0);
}

@end
