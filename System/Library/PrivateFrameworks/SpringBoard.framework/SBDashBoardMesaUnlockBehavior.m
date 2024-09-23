@implementation SBDashBoardMesaUnlockBehavior

- (SBDashBoardMesaUnlockBehavior)initWithMesaSettings:(id)a3 andUnlockTrigger:(id)a4
{
  id v7;
  id v8;
  SBDashBoardMesaUnlockBehavior *v9;
  SBDashBoardMesaUnlockBehavior *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBDashBoardMesaUnlockBehavior;
  v9 = -[SBDashBoardMesaUnlockBehavior init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mesaSettings, a3);
    objc_storeStrong((id *)&v10->_trigger, a4);
    -[SBMesaUnlockTrigger setDelegate:](v10->_trigger, "setDelegate:", v10);
  }

  return v10;
}

- (void)menuButtonDown
{
  id v2;

  -[SBDashBoardMesaUnlockBehavior _trigger](self, "_trigger");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuButtonDown");

}

- (void)menuButtonUp
{
  id v2;

  -[SBDashBoardMesaUnlockBehavior _trigger](self, "_trigger");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuButtonUp");

}

- (void)screenOn
{
  id v2;

  -[SBDashBoardMesaUnlockBehavior _trigger](self, "_trigger");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screenOn");

}

- (void)screenOff
{
  void *v3;

  -[SBDashBoardMesaUnlockBehavior _trigger](self, "_trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screenOff");

  self->_failedMesaUnlockAttempts = 0;
}

- (void)significantUserInteractionDidOccur
{
  id v2;

  -[SBDashBoardMesaUnlockBehavior _trigger](self, "_trigger");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "significantUserInteractionOccurred");

}

- (void)lockButtonDown
{
  id v2;

  -[SBDashBoardMesaUnlockBehavior _trigger](self, "_trigger");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockButtonDown");

}

- (void)_setTrigger:(id)a3
{
  SBMesaUnlockTrigger *v5;
  SBMesaUnlockTrigger *trigger;
  SBMesaUnlockTrigger *v7;

  v5 = (SBMesaUnlockTrigger *)a3;
  trigger = self->_trigger;
  if (trigger != v5)
  {
    v7 = v5;
    -[SBMesaUnlockTrigger setDelegate:](trigger, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_trigger, a3);
    -[SBMesaUnlockTrigger setDelegate:](self->_trigger, "setDelegate:", self);
    v5 = v7;
  }

}

- (id)_homeHardwareButton
{
  SBHomeHardwareButton *homeHardwareButton;

  homeHardwareButton = self->_homeHardwareButton;
  if (homeHardwareButton)
    return homeHardwareButton;
  objc_msgSend((id)SBApp, "homeHardwareButton");
  return (id)objc_claimAutoreleasedReturnValue();
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
  return -[SBAuthenticationFeedback initForFailureShowingPasscode:]([SBAuthenticationFeedback alloc], "initForFailureShowingPasscode:", 1);
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

- (NSString)description
{
  return (NSString *)-[SBDashBoardMesaUnlockBehavior descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBDashBoardMesaUnlockBehavior succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBDashBoardMesaUnlockBehavior descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;

  -[SBDashBoardMesaUnlockBehavior succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendInteger:withName:", self->_failedMesaUnlockAttempts, CFSTR("failedMesaUnlockAttempts"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_trigger, CFSTR("trigger"));
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
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  _QWORD v19[4];
  void (**v20)(_QWORD, _QWORD);
  char v21;
  _QWORD v22[5];
  NSObject *v23;
  char v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
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
      v26 = v9;
      _os_log_impl(&dword_1D0540000, WeakRetained, OS_LOG_TYPE_INFO, "Base unlock behavior received biometric event: %{public}@", buf, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_biometricUnlockBehaviorDelegate);
    if (a3 <= 0x21 && ((1 << a3) & 0x2070009E0) != 0)
    {
      if (-[CSLockScreenMesaSettings passcodeRequiredEventsCountAsFailures](self->_mesaSettings, "passcodeRequiredEventsCountAsFailures"))
      {
        -[SBDashBoardMesaUnlockBehavior _handleMesaFailure](self, "_handleMesaFailure");
      }
      else
      {
        -[SBDashBoardMesaUnlockBehavior _feedbackForPasscodeEvent](self, "_feedbackForPasscodeEvent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        SBLogLockScreenMesaUnlockBehaviors();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v11;
          _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_INFO, "requesting feedback: %@", buf, 0xCu);
        }

        -[NSObject biometricUnlockBehavior:requestsFeedback:](WeakRetained, "biometricUnlockBehavior:requestsFeedback:", self, v11);
      }
      if (-[CSLockScreenMesaSettings flashRedOnPasscodeRequiredEvents](self->_mesaSettings, "flashRedOnPasscodeRequiredEvents"))
      {
        +[SBScreenFlash mainScreenFlasher](SBScreenFlash, "mainScreenFlasher");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "flashColor:withCompletion:", v13, 0);

        goto LABEL_15;
      }
    }
    else
    {
      if (a3 - 9 <= 1)
      {
        -[SBDashBoardMesaUnlockBehavior _handleMesaFailure](self, "_handleMesaFailure");
        goto LABEL_16;
      }
      switch(a3)
      {
        case 0uLL:
          -[SBDashBoardMesaUnlockBehavior _trigger](self, "_trigger");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "fingerOff");
          goto LABEL_15;
        case 1uLL:
          -[SBDashBoardMesaUnlockBehavior _trigger](self, "_trigger");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "fingerOn");
          goto LABEL_15;
        case 4uLL:
          self->_failedMesaUnlockAttempts = 0;
          -[SBDashBoardMesaUnlockBehavior _trigger](self, "_trigger");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "bioUnlock");

          v16 = MEMORY[0x1E0C809B0];
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __54__SBDashBoardMesaUnlockBehavior_handleBiometricEvent___block_invoke;
          v22[3] = &unk_1E8EA8528;
          v22[4] = self;
          v24 = v15;
          WeakRetained = WeakRetained;
          v23 = WeakRetained;
          v17 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v22);
          if (-[CSLockScreenMesaSettings successFeedbackWaitsUntilButtonUp](self->_mesaSettings, "successFeedbackWaitsUntilButtonUp"))
          {
            -[SBDashBoardMesaUnlockBehavior _homeHardwareButton](self, "_homeHardwareButton");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19[0] = v16;
            v19[1] = 3221225472;
            v19[2] = __54__SBDashBoardMesaUnlockBehavior_handleBiometricEvent___block_invoke_9;
            v19[3] = &unk_1E8EA0D88;
            v20 = v17;
            v21 = v15;
            objc_msgSend(v18, "performWhenMenuButtonIsUpUsingBlock:", v19);

          }
          else
          {
            v17[2](v17, v15);
          }

          break;
      }
    }
  }
  else if (v8)
  {
    NSStringFromSBUIBiometricEvent();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v10;
    _os_log_impl(&dword_1D0540000, WeakRetained, OS_LOG_TYPE_INFO, "Unlock behavior received biometric event but has no enrolled identities. Bailing. Event: %{public}@", buf, 0xCu);
LABEL_15:

  }
LABEL_16:

}

void __54__SBDashBoardMesaUnlockBehavior_handleBiometricEvent___block_invoke(uint64_t a1)
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

uint64_t __54__SBDashBoardMesaUnlockBehavior_handleBiometricEvent___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)setAuthenticated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBDashBoardMesaUnlockBehavior _trigger](self, "_trigger");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAuthenticated:", v3);

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
  -[SBDashBoardMesaUnlockBehavior _feedbackForBioUnlockEventThatWasSpontaneous:](self, "_feedbackForBioUnlockEventThatWasSpontaneous:", 1);
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

  -[SBDashBoardMesaUnlockBehavior biometricUnlockBehaviorDelegate](self, "biometricUnlockBehaviorDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "biometricUnlockBehavior:requestsUnlock:withFeedback:", self, v4, v7);

}

- (void)_handleMesaFailure
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  _QWORD v9[4];
  void (**v10)(_QWORD);
  _QWORD v11[4];
  id v12;
  SBDashBoardMesaUnlockBehavior *v13;

  ++self->_failedMesaUnlockAttempts;
  -[SBDashBoardMesaUnlockBehavior _failureSettingsForFailAttempt:](self, "_failureSettingsForFailAttempt:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDashBoardMesaUnlockBehavior _feedbackForFailureSettings:](self, "_feedbackForFailureSettings:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__SBDashBoardMesaUnlockBehavior__handleMesaFailure__block_invoke;
  v11[3] = &unk_1E8E9E820;
  v6 = v4;
  v12 = v6;
  v13 = self;
  v7 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v11);
  if (objc_msgSend(v3, "waitUntilButtonUp"))
  {
    -[SBDashBoardMesaUnlockBehavior _homeHardwareButton](self, "_homeHardwareButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __51__SBDashBoardMesaUnlockBehavior__handleMesaFailure__block_invoke_11;
    v9[3] = &unk_1E8E9E8D0;
    v10 = v7;
    objc_msgSend(v8, "performWhenMenuButtonIsUpUsingBlock:", v9);

  }
  else
  {
    v7[2](v7);
  }

}

void __51__SBDashBoardMesaUnlockBehavior__handleMesaFailure__block_invoke(uint64_t a1)
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

uint64_t __51__SBDashBoardMesaUnlockBehavior__handleMesaFailure__block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_failureSettingsForFailAttempt:(int64_t)a3
{
  void *v3;

  switch(self->_failedMesaUnlockAttempts)
  {
    case 1:
      -[CSLockScreenMesaSettings firstFailureSettings](self->_mesaSettings, "firstFailureSettings", a3);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[CSLockScreenMesaSettings secondFailureSettings](self->_mesaSettings, "secondFailureSettings", a3);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[CSLockScreenMesaSettings thirdFailureSettings](self->_mesaSettings, "thirdFailureSettings", a3);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[CSLockScreenMesaSettings fourthFailureSettings](self->_mesaSettings, "fourthFailureSettings", a3);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      -[CSLockScreenMesaSettings fifthFailureSettings](self->_mesaSettings, "fifthFailureSettings", a3);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

- (SBMesaUnlockTrigger)_trigger
{
  return self->_trigger;
}

- (CSLockScreenMesaSettings)_mesaSettings
{
  return self->_mesaSettings;
}

- (SBHomeHardwareButton)_getHomeHardwareButton
{
  return self->_homeHardwareButton;
}

- (void)_setHomeHardwareButton:(id)a3
{
  objc_storeStrong((id *)&self->_homeHardwareButton, a3);
}

- (SBBiometricUnlockBehaviorDelegate)biometricUnlockBehaviorDelegate
{
  return (SBBiometricUnlockBehaviorDelegate *)objc_loadWeakRetained((id *)&self->_biometricUnlockBehaviorDelegate);
}

- (void)setBiometricUnlockBehaviorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_biometricUnlockBehaviorDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_destroyWeak((id *)&self->_biometricUnlockBehaviorDelegate);
  objc_storeStrong((id *)&self->_homeHardwareButton, 0);
  objc_storeStrong((id *)&self->_mesaSettings, 0);
}

@end
