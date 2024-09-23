@implementation SBDashBoardBiometricUnlockController

- (SBDashBoardBiometricUnlockController)initWithCoverSheetViewController:(id)a3
{
  id v5;
  SBDashBoardBiometricUnlockController *v6;
  SBDashBoardBiometricUnlockController *v7;
  SBDashBoardMesaUnlockBehaviorConfiguration *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  SBBiometricUnlockBehaviorConfiguration *biometricUnlockBehaviorConfiguration;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBDashBoardBiometricUnlockController;
  v6 = -[SBDashBoardBiometricUnlockController init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coverSheetViewController, a3);
    -[CSCoverSheetViewController registerExternalEventHandler:](v7->_coverSheetViewController, "registerExternalEventHandler:", v7);
    v8 = [SBDashBoardMesaUnlockBehaviorConfiguration alloc];
    +[SBLiftToWakeController sharedController](SBLiftToWakeController, "sharedController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SBDashBoardMesaUnlockBehaviorConfiguration initWithLiftToWakeController:biometricResource:lockScreenPrototypeSettings:](v8, "initWithLiftToWakeController:biometricResource:lockScreenPrototypeSettings:", v9, v10, v11);
    biometricUnlockBehaviorConfiguration = v7->_biometricUnlockBehaviorConfiguration;
    v7->_biometricUnlockBehaviorConfiguration = (SBBiometricUnlockBehaviorConfiguration *)v12;

    -[SBBiometricUnlockBehaviorConfiguration setDelegate:](v7->_biometricUnlockBehaviorConfiguration, "setDelegate:", v7);
    -[SBDashBoardBiometricUnlockController biometricUnlockBehaviorConfigurationDidChange:](v7, "biometricUnlockBehaviorConfigurationDidChange:", v7->_biometricUnlockBehaviorConfiguration);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[CSCoverSheetViewController unregisterExternalEventHandler:](self->_coverSheetViewController, "unregisterExternalEventHandler:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardBiometricUnlockController;
  -[SBDashBoardBiometricUnlockController dealloc](&v3, sel_dealloc);
}

- (void)noteMenuButtonDown
{
  id v2;

  -[SBDashBoardBiometricUnlockController _mesaUnlockBehavior](self, "_mesaUnlockBehavior");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuButtonDown");

}

- (void)noteMenuButtonUp
{
  id v2;

  -[SBDashBoardBiometricUnlockController _mesaUnlockBehavior](self, "_mesaUnlockBehavior");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuButtonUp");

}

- (void)setAuthenticated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBDashBoardBiometricUnlockController _mesaUnlockBehavior](self, "_mesaUnlockBehavior");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAuthenticated:", v3);

}

- (void)noteLockButtonDown
{
  id v2;

  -[SBDashBoardBiometricUnlockController _mesaUnlockBehavior](self, "_mesaUnlockBehavior");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockButtonDown");

}

- (id)_mesaUnlockBehavior
{
  SBBiometricUnlockBehavior *biometricUnlockBehavior;
  uint64_t v3;
  SBBiometricUnlockBehavior *v4;
  SBBiometricUnlockBehavior *v5;
  SBBiometricUnlockBehavior *v6;

  biometricUnlockBehavior = self->_biometricUnlockBehavior;
  v3 = objc_opt_class();
  v4 = biometricUnlockBehavior;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBDashBoardBiometricUnlockController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBDashBoardBiometricUnlockController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  id WeakRetained;
  id v8;
  id v9;

  -[SBDashBoardBiometricUnlockController succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_biometricUnlockBehavior, CFSTR("biometricUnlockBehavior"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_biometricUnlockBehaviorConfiguration, CFSTR("biometricUnlockBehaviorConfiguration"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_biometricUnlockBehaviorDelegate);
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", WeakRetained, CFSTR("biometricUnlockBehaviorDelegate"));

  v9 = (id)objc_msgSend(v4, "appendObject:withName:", self->_coverSheetViewController, CFSTR("coverSheetViewController"));
  return v4;
}

- (void)handleBiometricEvent:(unint64_t)a3
{
  -[SBBiometricUnlockBehavior handleBiometricEvent:](self->_biometricUnlockBehavior, "handleBiometricEvent:", a3);
}

- (BOOL)biometricUnlockBehavior:(id)a3 requestsFeedback:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;

  v5 = a4;
  -[SBDashBoardBiometricUnlockController biometricUnlockBehaviorDelegate](self, "biometricUnlockBehaviorDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "biometricUnlockBehavior:requestsFeedback:", self, v5);

  if (v7)
  {
    if (objc_msgSend(v5, "hintFailureText"))
      -[CSCoverSheetViewController updateCallToActionForMesaMatchFailure](self->_coverSheetViewController, "updateCallToActionForMesaMatchFailure");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("SBBiometricEventTimestampNotificationTryAgain"), 0);

  }
  return v7;
}

- (BOOL)biometricUnlockBehavior:(id)a3 requestsUnlock:(id)a4 withFeedback:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a5;
  v8 = a4;
  -[SBDashBoardBiometricUnlockController biometricUnlockBehaviorDelegate](self, "biometricUnlockBehaviorDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "biometricUnlockBehavior:requestsUnlock:withFeedback:", self, v8, v7);

  return (char)self;
}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (BOOL)handleEvent:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = objc_msgSend(a3, "type");
  switch(v4)
  {
    case 21:
      -[SBDashBoardBiometricUnlockController _mesaUnlockBehavior](self, "_mesaUnlockBehavior");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "significantUserInteractionDidOccur");
      goto LABEL_7;
    case 25:
      -[SBDashBoardBiometricUnlockController _mesaUnlockBehavior](self, "_mesaUnlockBehavior");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "screenOff");
      goto LABEL_7;
    case 24:
      -[SBDashBoardBiometricUnlockController _mesaUnlockBehavior](self, "_mesaUnlockBehavior");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "screenOn");
LABEL_7:

      break;
  }
  return 0;
}

- (void)biometricUnlockBehaviorConfigurationDidChange:(id)a3
{
  SBBiometricUnlockBehavior *biometricUnlockBehavior;
  id v5;
  SBBiometricUnlockBehavior *v6;
  SBBiometricUnlockBehavior *v7;

  biometricUnlockBehavior = self->_biometricUnlockBehavior;
  v5 = a3;
  -[SBBiometricUnlockBehavior setBiometricUnlockBehaviorDelegate:](biometricUnlockBehavior, "setBiometricUnlockBehaviorDelegate:", 0);
  v6 = (SBBiometricUnlockBehavior *)objc_msgSend(v5, "newBehaviorForCurrentConfiguration");

  v7 = self->_biometricUnlockBehavior;
  self->_biometricUnlockBehavior = v6;

  -[SBBiometricUnlockBehavior setBiometricUnlockBehaviorDelegate:](self->_biometricUnlockBehavior, "setBiometricUnlockBehaviorDelegate:", self);
}

- (BOOL)isLockScreenShowingDefaultContent
{
  return -[CSCoverSheetViewController isLockScreenShowingDefaultContent](self->_coverSheetViewController, "isLockScreenShowingDefaultContent");
}

- (void)startRestToOpenCoachingWithCompletion:(id)a3
{
  id v4;
  CSCoverSheetViewController *coverSheetViewController;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  coverSheetViewController = self->_coverSheetViewController;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__SBDashBoardBiometricUnlockController_startRestToOpenCoachingWithCompletion___block_invoke;
  v7[3] = &unk_1E8E9F1C0;
  v8 = v4;
  v6 = v4;
  -[CSCoverSheetViewController startRestToOpenCoachingWithCompletion:](coverSheetViewController, "startRestToOpenCoachingWithCompletion:", v7);

}

uint64_t __78__SBDashBoardBiometricUnlockController_startRestToOpenCoachingWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (int)lockScreenWakeSource
{
  return -[CSCoverSheetViewController wakeSource](self->_coverSheetViewController, "wakeSource");
}

- (void)fillRestToOpenWithDuration:(double)a3
{
  -[CSCoverSheetViewController fillRestToOpenWithDuration:](self->_coverSheetViewController, "fillRestToOpenWithDuration:", a3);
}

- (void)resetRestToOpen
{
  -[CSCoverSheetViewController resetRestToOpen](self->_coverSheetViewController, "resetRestToOpen");
}

- (BOOL)isRestToOpenAvailable
{
  return -[CSCoverSheetViewController isRestToOpenAvailable](self->_coverSheetViewController, "isRestToOpenAvailable");
}

- (BOOL)hasVisibleContentToReveal
{
  return -[CSCoverSheetViewController hasVisibleContentToReveal](self->_coverSheetViewController, "hasVisibleContentToReveal");
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
  objc_destroyWeak((id *)&self->_biometricUnlockBehaviorDelegate);
  objc_storeStrong((id *)&self->_biometricUnlockBehavior, 0);
  objc_storeStrong((id *)&self->_biometricUnlockBehaviorConfiguration, 0);
  objc_storeStrong((id *)&self->_coverSheetViewController, 0);
}

@end
