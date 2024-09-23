@implementation SBDashBoardPearlUnlockBehavior

- (SBDashBoardPearlUnlockBehavior)initWithPearlSettings:(id)a3 andUnlockTrigger:(id)a4
{
  id v7;
  id v8;
  SBDashBoardPearlUnlockBehavior *v9;
  SBDashBoardPearlUnlockBehavior *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBDashBoardPearlUnlockBehavior;
  v9 = -[SBDashBoardPearlUnlockBehavior init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pearlSettings, a3);
    objc_storeStrong((id *)&v10->_trigger, a4);
    -[SBMesaUnlockTrigger setDelegate:](v10->_trigger, "setDelegate:", v10);
  }

  return v10;
}

- (NSString)description
{
  return (NSString *)-[SBDashBoardPearlUnlockBehavior descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBDashBoardPearlUnlockBehavior succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBDashBoardPearlUnlockBehavior descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;

  -[SBDashBoardPearlUnlockBehavior succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_trigger, CFSTR("trigger"));
  return v4;
}

- (void)handleBiometricEvent:(unint64_t)a3
{
  void *v5;
  char v6;
  NSObject *WeakRetained;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void (**v13)(_QWORD, _QWORD);
  _QWORD v14[5];
  NSObject *v15;
  char v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasEnrolledIdentities");

  SBLogLockScreenMesaUnlockBehaviors();
  WeakRetained = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO);
  if ((v6 & 1) != 0)
  {
    if (v8)
    {
      NSStringFromSBUIBiometricEvent();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v9;
      _os_log_impl(&dword_1D0540000, WeakRetained, OS_LOG_TYPE_INFO, "Base unlock behavior received biometric event: %{public}@", buf, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_biometricUnlockBehaviorDelegate);
    if (a3 <= 0x21 && ((1 << a3) & 0x2070009E0) != 0 || a3 - 9 <= 1)
    {
      -[SBDashBoardPearlUnlockBehavior _handlePearlFailure](self, "_handlePearlFailure");
    }
    else if (a3 == 4)
    {
      -[SBDashBoardPearlUnlockBehavior _trigger](self, "_trigger");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "bioUnlock");

      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __55__SBDashBoardPearlUnlockBehavior_handleBiometricEvent___block_invoke;
      v14[3] = &unk_1E8EA8528;
      v14[4] = self;
      v16 = v12;
      WeakRetained = WeakRetained;
      v15 = WeakRetained;
      v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v14);
      v13[2](v13, v12);

    }
  }
  else if (v8)
  {
    NSStringFromSBUIBiometricEvent();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v10;
    _os_log_impl(&dword_1D0540000, WeakRetained, OS_LOG_TYPE_INFO, "Unlock behavior received biometric event but has no enrolled identities. Bailing. Event: %{public}@", buf, 0xCu);

  }
}

void __55__SBDashBoardPearlUnlockBehavior_handleBiometricEvent___block_invoke(uint64_t a1)
{
  SBLockScreenUnlockRequest *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(SBLockScreenUnlockRequest);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenUnlockRequest setName:](v2, "setName:", v4);

  -[SBLockScreenUnlockRequest setSource:](v2, "setSource:", 23);
  if (*(_BYTE *)(a1 + 48))
    v5 = 3;
  else
    v5 = 2;
  -[SBLockScreenUnlockRequest setIntent:](v2, "setIntent:", v5);
  objc_msgSend(*(id *)(a1 + 32), "_feedbackForBioUnlockEventThatWasSpontaneous:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogLockScreenMesaUnlockBehaviors();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109378;
    v8[1] = -[SBLockScreenUnlockRequest intent](v2, "intent");
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "requesting unlock with intent: %d and feedback: %@", (uint8_t *)v8, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 40), "biometricUnlockBehavior:requestsUnlock:withFeedback:", *(_QWORD *)(a1 + 32), v2, v6);
}

- (void)mesaUnlockTriggerFired:(id)a3
{
  SBLockScreenUnlockRequest *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(SBLockScreenUnlockRequest);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenUnlockRequest setName:](v4, "setName:", v6);

  -[SBLockScreenUnlockRequest setSource:](v4, "setSource:", 23);
  -[SBLockScreenUnlockRequest setIntent:](v4, "setIntent:", 3);
  -[SBDashBoardPearlUnlockBehavior _feedbackForBioUnlockEventThatWasSpontaneous:](self, "_feedbackForBioUnlockEventThatWasSpontaneous:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogLockScreenMesaUnlockBehaviors();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10[0] = 67109378;
    v10[1] = -[SBLockScreenUnlockRequest intent](v4, "intent");
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "trigger fired - requesting unlock with intent: %d and feedback: %@", (uint8_t *)v10, 0x12u);
  }

  -[SBDashBoardPearlUnlockBehavior biometricUnlockBehaviorDelegate](self, "biometricUnlockBehaviorDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "biometricUnlockBehavior:requestsUnlock:withFeedback:", self, v4, v7);

}

- (id)_feedbackForFailureSettings:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[SBAuthenticationFeedback initForFailureWithFailureSettings:]([SBAuthenticationFeedback alloc], "initForFailureWithFailureSettings:", v3);

  return v4;
}

- (id)_feedbackForPasscodeEvent
{
  return 0;
}

- (id)_feedbackForBioUnlockEventThatWasSpontaneous:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (a3)
    v5 = 0;
  else
    v5 = -[SBAuthenticationFeedback initForSuccess]([SBAuthenticationFeedback alloc], "initForSuccess", v3, v4);
  return v5;
}

- (void)_handlePearlFailure
{
  void *v3;
  void *v4;
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  SBDashBoardPearlUnlockBehavior *v12;

  -[CSLockScreenPearlSettings failureSettings](self->_pearlSettings, "failureSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDashBoardPearlUnlockBehavior _feedbackForFailureSettings:](self, "_feedbackForFailureSettings:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__SBDashBoardPearlUnlockBehavior__handlePearlFailure__block_invoke;
  v10[3] = &unk_1E8E9E820;
  v11 = v4;
  v12 = self;
  v5 = v4;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v10);
  v6[2](v6, v7, v8, v9);

}

void __53__SBDashBoardPearlUnlockBehavior__handlePearlFailure__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogLockScreenMesaUnlockBehaviors();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "requesting feedback: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "biometricUnlockBehaviorDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "biometricUnlockBehavior:requestsFeedback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (SBBiometricUnlockBehaviorDelegate)biometricUnlockBehaviorDelegate
{
  return (SBBiometricUnlockBehaviorDelegate *)objc_loadWeakRetained((id *)&self->_biometricUnlockBehaviorDelegate);
}

- (void)setBiometricUnlockBehaviorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_biometricUnlockBehaviorDelegate, a3);
}

- (SBMesaUnlockTrigger)_trigger
{
  return self->_trigger;
}

- (void)_setTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_trigger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_destroyWeak((id *)&self->_biometricUnlockBehaviorDelegate);
  objc_storeStrong((id *)&self->_pearlSettings, 0);
}

@end
