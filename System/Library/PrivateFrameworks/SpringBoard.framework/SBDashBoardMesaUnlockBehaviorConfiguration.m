@implementation SBDashBoardMesaUnlockBehaviorConfiguration

- (SBDashBoardMesaUnlockBehaviorConfiguration)initWithLiftToWakeController:(id)a3 biometricResource:(id)a4 lockScreenPrototypeSettings:(id)a5
{
  return -[SBDashBoardMesaUnlockBehaviorConfiguration initWithLiftToWakeController:biometricResource:lockScreenPrototypeSettings:evaluateTriggerClass:](self, "initWithLiftToWakeController:biometricResource:lockScreenPrototypeSettings:evaluateTriggerClass:", a3, a4, a5, 1);
}

- (SBDashBoardMesaUnlockBehaviorConfiguration)initWithLiftToWakeController:(id)a3 biometricResource:(id)a4 lockScreenPrototypeSettings:(id)a5 evaluateTriggerClass:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  SBDashBoardMesaUnlockBehaviorConfiguration *v13;
  SBDashBoardMesaUnlockBehaviorConfiguration *v14;
  void *v15;
  objc_super v17;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBDashBoardMesaUnlockBehaviorConfiguration;
  v13 = -[SBDashBoardMesaUnlockBehaviorConfiguration init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    -[SBDashBoardMesaUnlockBehaviorConfiguration _setLiftToWakeController:](v13, "_setLiftToWakeController:", v10);
    objc_storeStrong((id *)&v14->_biometricResource, a4);
    objc_storeStrong((id *)&v14->_prototypeSettings, a5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v14, sel__accessibilityOptionsChanged_, *MEMORY[0x1E0DDE230], 0);

    if (v6)
      -[SBDashBoardMesaUnlockBehaviorConfiguration _evaluateTriggerClass](v14, "_evaluateTriggerClass");
  }

  return v14;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DDE230], 0);

  -[SBDashBoardMesaUnlockBehaviorConfiguration _setLiftToWakeController:](self, "_setLiftToWakeController:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardMesaUnlockBehaviorConfiguration;
  -[SBDashBoardMesaUnlockBehaviorConfiguration dealloc](&v4, sel_dealloc);
}

- (id)newBehaviorForCurrentConfiguration
{
  void *v4;
  int v5;
  CSLockScreenSettings *prototypeSettings;
  void *v7;
  SBDashBoardPearlUnlockBehavior *v8;
  SBDashBoardPearlUnlockBehavior *v9;
  void *v11;

  -[SBDashBoardMesaUnlockBehaviorConfiguration _unlockTriggerWithClass:](self, "_unlockTriggerWithClass:", self->_currentTriggerClass);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDashBoardMesaUnlockBehaviorConfiguration.m"), 79, CFSTR("Mesa unlock trigger must be a type of SBMesaUnlockTrigger."));

  }
  v5 = -[SBUIBiometricResource hasPearlSupport](self->_biometricResource, "hasPearlSupport");
  prototypeSettings = self->_prototypeSettings;
  if (v5)
  {
    -[CSLockScreenSettings pearlSettings](prototypeSettings, "pearlSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBDashBoardPearlUnlockBehavior initWithPearlSettings:andUnlockTrigger:]([SBDashBoardPearlUnlockBehavior alloc], "initWithPearlSettings:andUnlockTrigger:", v7, v4);
  }
  else
  {
    -[CSLockScreenSettings mesaSettings](prototypeSettings, "mesaSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBDashBoardMesaUnlockBehavior initWithMesaSettings:andUnlockTrigger:]([SBDashBoardMesaUnlockBehavior alloc], "initWithMesaSettings:andUnlockTrigger:", v7, v4);
  }
  v9 = v8;

  return v9;
}

- (BOOL)_isAccessibilityRestingUnlockPreferenceEnabled
{
  return _AXSHomeButtonRestingUnlock() != 0;
}

- (Class)_currentUnlockTriggerClass
{
  return self->_currentTriggerClass;
}

- (void)_evaluateTriggerClass
{
  objc_class *v3;
  NSObject *v4;
  void *v5;
  id WeakRetained;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = -[SBDashBoardMesaUnlockBehaviorConfiguration _expectedTriggerClassIncludingAccessibility:](self, "_expectedTriggerClassIncludingAccessibility:", 1);
  if (self->_currentTriggerClass != v3)
  {
    self->_currentTriggerClass = v3;
    SBLogLockScreenMesaUnlockBehaviors();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      NSStringFromClass(self->_currentTriggerClass);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "Unlock behavior configuration changed - new expected trigger is: %{public}@", (uint8_t *)&v7, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "biometricUnlockBehaviorConfigurationDidChange:", self);

  }
}

- (void)_setLiftToWakeController:(id)a3
{
  SBLiftToWakeController *v5;
  SBLiftToWakeController *liftToWakeController;
  SBLiftToWakeController *v7;

  v5 = (SBLiftToWakeController *)a3;
  liftToWakeController = self->_liftToWakeController;
  if (liftToWakeController != v5)
  {
    v7 = v5;
    -[SBLiftToWakeController removeObserver:](liftToWakeController, "removeObserver:", self);
    objc_storeStrong((id *)&self->_liftToWakeController, a3);
    -[SBLiftToWakeController addObserver:](self->_liftToWakeController, "addObserver:", self);
    v5 = v7;
  }

}

- (id)_liftToWakeController
{
  return self->_liftToWakeController;
}

- (void)_accessibilityOptionsChanged:(id)a3
{
  BSDispatchMain();
}

uint64_t __75__SBDashBoardMesaUnlockBehaviorConfiguration__accessibilityOptionsChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateTriggerClass");
}

- (id)_unlockTriggerWithClass:(Class)a3
{
  id WeakRetained;
  SBZionUnlockTrigger *v7;
  objc_class *v8;
  void *v9;
  SBAccessibilityMesaUnlockTrigger *v10;
  void *v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((Class)objc_opt_class() == a3)
  {
    v8 = -[SBDashBoardMesaUnlockBehaviorConfiguration _expectedTriggerClassIncludingAccessibility:](self, "_expectedTriggerClassIncludingAccessibility:", 0);
    if (v8 == (objc_class *)objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDashBoardMesaUnlockBehaviorConfiguration.m"), 150, CFSTR("Base unlock trigger cannot be accessibility or we'll loop."));

    }
    -[SBDashBoardMesaUnlockBehaviorConfiguration _unlockTriggerWithClass:](self, "_unlockTriggerWithClass:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SBAccessibilityMesaUnlockTrigger initWithUnlockBehaviorConfigurationDelegate:baseTrigger:]([SBAccessibilityMesaUnlockTrigger alloc], "initWithUnlockBehaviorConfigurationDelegate:baseTrigger:", WeakRetained, v9);

  }
  else
  {
    if ((Class)objc_opt_class() == a3)
      v7 = -[SBZionUnlockTrigger initWithUnlockBehaviorConfigurationDelegate:]([SBZionUnlockTrigger alloc], "initWithUnlockBehaviorConfigurationDelegate:", WeakRetained);
    else
      v7 = (SBZionUnlockTrigger *)objc_alloc_init(a3);
    v10 = (SBAccessibilityMesaUnlockTrigger *)v7;
  }

  return v10;
}

- (Class)_expectedTriggerClassIncludingAccessibility:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if ((-[SBUIBiometricResource hasPearlSupport](self->_biometricResource, "hasPearlSupport") & 1) == 0)
  {
    if (v3
      && -[SBDashBoardMesaUnlockBehaviorConfiguration _isAccessibilityRestingUnlockPreferenceEnabled](self, "_isAccessibilityRestingUnlockPreferenceEnabled"))
    {
      -[SBUIBiometricResource hasPoseidonSupport](self->_biometricResource, "hasPoseidonSupport");
    }
    else
    {
      -[SBLiftToWakeController isEnabled](self->_liftToWakeController, "isEnabled");
    }
  }
  return (Class)(id)objc_opt_class();
}

- (SBBiometricUnlockBehaviorConfigurationDelegate)delegate
{
  return (SBBiometricUnlockBehaviorConfigurationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_storeStrong((id *)&self->_prototypeSettings, 0);
  objc_storeStrong((id *)&self->_liftToWakeController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
