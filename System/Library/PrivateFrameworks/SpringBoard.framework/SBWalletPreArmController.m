@implementation SBWalletPreArmController

+ (SBWalletPreArmController)sharedInstance
{
  if (sharedInstance_onceToken_55 != -1)
    dispatch_once(&sharedInstance_onceToken_55, &__block_literal_global_378);
  return (SBWalletPreArmController *)(id)sharedInstance_sharedController;
}

- (id)acquireSuppressPreArmAssertionOfType:(int64_t)a3 forReason:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  NSMutableDictionary *disabledPreArmAssertionsByType;
  void *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  SBWalletPreArmController *v27;
  id v28[2];
  id location;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_initWeak(&location, self);
  v7 = objc_alloc(MEMORY[0x1E0D01868]);
  v8 = MEMORY[0x1E0C80D38];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __75__SBWalletPreArmController_acquireSuppressPreArmAssertionOfType_forReason___block_invoke;
  v25[3] = &unk_1E8EBFF38;
  objc_copyWeak(v28, &location);
  v28[1] = (id)a3;
  v9 = v6;
  v26 = v9;
  v27 = self;
  v10 = (void *)objc_msgSend(v7, "initWithIdentifier:forReason:queue:invalidationBlock:", CFSTR("DisableWalletPreArmAssertion"), v9, MEMORY[0x1E0C80D38], v25);

  if (v10)
  {
    SBLogLockScreenBiometricCoordinator();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      SBWalletPreArmSuppressionAssertionTypeDescription(a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v12;
      v32 = 2112;
      v33 = v9;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, "Added disable wallet pre-arm assertion of type %@ for reason: %@", buf, 0x16u);

    }
    v13 = -[SBWalletPreArmController isPreArmSuppressed](self, "isPreArmSuppressed");
    -[NSHashTable addObject:](self->_disabledPreArmAssertions, "addObject:", v10);
    disabledPreArmAssertionsByType = self->_disabledPreArmAssertionsByType;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](disabledPreArmAssertionsByType, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(disabledPreArmAssertionsByType) = v16 == 0;

    if ((_DWORD)disabledPreArmAssertionsByType)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = self->_disabledPreArmAssertionsByType;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v17, v19);

    }
    v20 = self->_disabledPreArmAssertionsByType;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v10);

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "postNotificationName:object:", CFSTR("SBWalletPreArmControllerPreArmSuppressionDidChange"), self);

    }
  }

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);

  return v10;
}

- (BOOL)isPreArmSuppressed
{
  return -[NSHashTable count](self->_disabledPreArmAssertions, "count") != 0;
}

void __42__SBWalletPreArmController_sharedInstance__block_invoke()
{
  SBWalletPreArmController *v0;
  void *v1;

  v0 = objc_alloc_init(SBWalletPreArmController);
  v1 = (void *)sharedInstance_sharedController;
  sharedInstance_sharedController = (uint64_t)v0;

}

- (SBWalletPreArmController)init
{
  id v3;
  void *v4;
  SBWalletPreArmController *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0D51960]);
  objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBWalletPreArmController initWithWalletPresentation:biometricResource:](self, "initWithWalletPresentation:biometricResource:", v3, v4);

  return v5;
}

- (SBWalletPreArmController)initWithWalletPresentation:(id)a3 biometricResource:(id)a4
{
  id v7;
  id v8;
  SBWalletPreArmController *v9;
  SBWalletPreArmController *v10;
  uint64_t v11;
  NSHashTable *disabledPreArmAssertions;
  NSMutableDictionary *v13;
  NSMutableDictionary *disabledPreArmAssertionsByType;
  void *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SBWalletPreArmController;
  v9 = -[SBWalletPreArmController init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_walletPresentation, a3);
    objc_storeStrong((id *)&v10->_biometricResource, a4);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    disabledPreArmAssertions = v10->_disabledPreArmAssertions;
    v10->_disabledPreArmAssertions = (NSHashTable *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    disabledPreArmAssertionsByType = v10->_disabledPreArmAssertionsByType;
    v10->_disabledPreArmAssertionsByType = v13;

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.stockholm.wallet.presentation"));
    -[SBWalletPreArmController _setNFDefaults:](v10, "_setNFDefaults:", v15);

    v10->_triggerSource = -[SBWalletPreArmController _computeTriggerSource](v10, "_computeTriggerSource");
  }

  return v10;
}

- (BOOL)isPreArmAvailable
{
  return self->_walletDoublePressConsumerAvailable;
}

- (BOOL)isPreArmAllowed
{
  _BOOL4 v3;

  v3 = -[SBWalletPreArmController isPreArmAvailable](self, "isPreArmAvailable");
  if (v3)
    LOBYTE(v3) = !-[SBWalletPreArmController isPreArmSuppressed](self, "isPreArmSuppressed");
  return v3;
}

- (BOOL)isPreArmTriggeredByLockButtonDoublePress
{
  return self->_triggerSource == 2;
}

- (BOOL)isPreArmTriggeredByHomeButtonDoublePress
{
  return self->_triggerSource == 1;
}

- (BOOL)isPreArmExternallySuppressed
{
  void *v2;
  BOOL v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_disabledPreArmAssertionsByType, "objectForKeyedSubscript:", &unk_1E91D2228);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)acquireSuppressPreArmAssertionForReason:(id)a3
{
  return -[SBWalletPreArmController acquireSuppressPreArmAssertionOfType:forReason:](self, "acquireSuppressPreArmAssertionOfType:forReason:", 1, a3);
}

void __75__SBWalletPreArmController_acquireSuppressPreArmAssertionOfType_forReason___block_invoke(_QWORD *a1, void *a2)
{
  id *v3;
  id v4;
  id *WeakRetained;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 6);
  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained[4], "removeObject:", v4);
  v6 = WeakRetained[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[7]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v4);

  SBLogLockScreenBiometricCoordinator();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    SBWalletPreArmSuppressionAssertionTypeDescription(a1[7]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = a1[4];
    v13 = 138412546;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "Removed disable wallet pre-arm assertion of type %@ for reason: %@", (uint8_t *)&v13, 0x16u);

  }
  if ((objc_msgSend(WeakRetained, "isPreArmSuppressed") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("SBWalletPreArmControllerPreArmSuppressionDidChange"), a1[5]);

  }
}

- (void)presentPreArmInterfaceForWalletConsumer
{
  -[NFWalletPresentation present](self->_walletPresentation, "present");
}

- (int64_t)_computeTriggerSource
{
  int v2;
  void *v3;
  void *v4;
  int v5;

  v2 = -[SBUIBiometricResource hasPearlSupport](self->_biometricResource, "hasPearlSupport");
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "miscellaneousDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "walletPreArmForceLockButton");

  if (v5 | v2)
    return 2;
  else
    return 1;
}

- (int64_t)_contactlessInterfaceSourceForTriggerSource:(int64_t)a3
{
  return 0;
}

- (void)_setNFDefaults:(id)a3
{
  NSUserDefaults *v5;
  NSUserDefaults *v6;

  v5 = (NSUserDefaults *)a3;
  if (self->_nfDefaults != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_nfDefaults, a3);
    self->_walletDoublePressConsumerAvailable = -[NSUserDefaults BOOLForKey:](self->_nfDefaults, "BOOLForKey:", CFSTR("walletDoubleButtonPressedConsumerAvailable"));
    -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_nfDefaults, "addObserver:forKeyPath:options:context:", self, CFSTR("walletDoubleButtonPressedConsumerAvailable"), 1, &self->_walletDoublePressConsumerAvailable);
    v5 = v6;
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  BOOL v8;
  _BOOL4 v9;
  NSObject *v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("walletDoubleButtonPressedConsumerAvailable"), a4, a5))
    v8 = &self->_walletDoublePressConsumerAvailable == a6;
  else
    v8 = 0;
  if (v8)
  {
    v9 = -[NSUserDefaults BOOLForKey:](self->_nfDefaults, "BOOLForKey:", CFSTR("walletDoubleButtonPressedConsumerAvailable"));
    SBLogLockScreenBiometricCoordinator();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = v9;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Wallet pre-arm double-click consumer did become available: %{BOOL}u", (uint8_t *)v11, 8u);
    }

    *(_BYTE *)a6 = v9;
  }
}

- (NSUserDefaults)_getNFDefaults
{
  return self->_nfDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nfDefaults, 0);
  objc_storeStrong((id *)&self->_disabledPreArmAssertionsByType, 0);
  objc_storeStrong((id *)&self->_disabledPreArmAssertions, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_storeStrong((id *)&self->_walletPresentation, 0);
}

@end
