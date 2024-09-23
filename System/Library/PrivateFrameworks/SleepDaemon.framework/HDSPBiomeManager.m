@implementation HDSPBiomeManager

- (HDSPBiomeManager)initWithEnvironment:(id)a3
{
  id v4;
  _HDSPBiomeBridge *v5;
  HDSPBiomeManager *v6;

  v4 = a3;
  v5 = objc_alloc_init(_HDSPBiomeBridge);
  v6 = -[HDSPBiomeManager initWithEnvironment:biomeInterface:](self, "initWithEnvironment:biomeInterface:", v4, v5);

  return v6;
}

- (HDSPBiomeManager)initWithEnvironment:(id)a3 biomeInterface:(id)a4
{
  id v6;
  id v7;
  HDSPBiomeManager *v8;
  HDSPBiomeManager *v9;
  HDSPBiomeManager *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDSPBiomeManager;
  v8 = -[HDSPBiomeManager init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_environment, v6);
    objc_storeStrong((id *)&v9->_biomeInterface, a4);
    v10 = v9;
  }

  return v9;
}

- (id)subscribe:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v11;
  HDSPBiomeManager *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  HKSPLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] subscribing publisher %{public}@", (uint8_t *)&v11, 0x16u);
  }

  -[HDSPBiomeInterface subscribe:callback:](self->_biomeInterface, "subscribe:callback:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)unsubscribe:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = (id)objc_opt_class();
    v8 = 2114;
    v9 = v3;
    v5 = v7;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] unsubscribing %{public}@", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(v3, "cancel");

}

+ (id)sleepModePublisher
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  BiomeLibrary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UserFocus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ComputedMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "DSLPublisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filterWithKeyPath:value:", CFSTR("eventBody.semanticModeIdentifier"), *MEMORY[0x24BEA96A0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "sleepModeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", self);

  objc_msgSend(v4, "sleepScheduleModelManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:", self);

  objc_msgSend(v4, "sleepCoordinator");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObserver:", self);
}

- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5
{
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (a4 != a3)
  {
    HKSPLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_opt_class();
      v10 = v9;
      NSStringFromHKSPSleepScheduleState();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromHKSPSleepScheduleState();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromHKSPSleepScheduleStateChangeReason();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544130;
      v20 = v9;
      v21 = 2114;
      v22 = v11;
      v23 = 2114;
      v24 = v12;
      v25 = 2114;
      v26 = v13;
      _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep state changed from %{public}@ to %{public}@ (%{public}@)", (uint8_t *)&v19, 0x2Au);

    }
    -[HDSPBiomeManager environment](self, "environment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sleepModeManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "inUnscheduledSleepMode")
      && objc_msgSend(v15, "shouldGoIntoSleepModeDuringState:", a3))
    {
      HKSPLogForCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (void *)objc_opt_class();
        v19 = 138543362;
        v20 = v17;
        v18 = v17;
        _os_log_impl(&dword_21610C000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] we're in user requested sleep mode before wind down/bedtime, telling Biome", (uint8_t *)&v19, 0xCu);

      }
      -[HDSPBiomeManager _writeSleepModeToBiome:reason:forceWrite:](self, "_writeSleepModeToBiome:reason:forceWrite:", 2, 2, 0);
    }
    -[HDSPBiomeManager _writeSleepScheduleStateToBiome:reason:forceWrite:](self, "_writeSleepScheduleStateToBiome:reason:forceWrite:", a3, a5, 1);

  }
}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = (id)objc_opt_class();
    v13 = 2114;
    v14 = v5;
    v7 = v12;
    _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] didUpdateSleepScheduleModel: %{public}@", (uint8_t *)&v11, 0x16u);

  }
  -[HDSPBiomeManager environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sleepModeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "sleepMode");

  if (v10)
    -[HDSPBiomeManager _writeSleepModeToBiome:reason:forceWrite:](self, "_writeSleepModeToBiome:reason:forceWrite:", v10, 10, 0);

}

- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5
{
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v11 = v10;
    NSStringFromHKSPSleepMode();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHKSPSleepMode();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHKSPSleepModeChangeReason();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544130;
    v16 = v10;
    v17 = 2114;
    v18 = v12;
    v19 = 2114;
    v20 = v13;
    v21 = 2114;
    v22 = v14;
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode changed from %{public}@ to %{public}@ (%{public}@)", (uint8_t *)&v15, 0x2Au);

  }
  -[HDSPBiomeManager _writeSleepModeToBiome:reason:forceWrite:](self, "_writeSleepModeToBiome:reason:forceWrite:", a3, a5, a3 != a4);
}

- (BOOL)_shouldWriteToBiome
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  id v10;
  BOOL v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HDSPBiomeManager environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sleepScheduleModelManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSPBiomeManager environment](self, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "behavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isAppleWatch"))
  {

    goto LABEL_7;
  }
  v8 = objc_msgSend(v5, "watchSleepFeaturesEnabled");

  if ((v8 & 1) != 0)
  {
LABEL_7:
    v11 = 1;
    goto LABEL_8;
  }
  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543362;
    v14 = (id)objc_opt_class();
    v10 = v14;
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] not writing to biome because sleep features are disabled for this watch", (uint8_t *)&v13, 0xCu);

  }
  v11 = 0;
LABEL_8:

  return v11;
}

- (void)_writeSleepModeToBiome:(int64_t)a3 reason:(unint64_t)a4 forceWrite:(BOOL)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (a5 || -[HDSPBiomeManager _shouldWriteToBiome](self, "_shouldWriteToBiome"))
  {
    BiomeLibrary();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UserFocus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "SleepMode");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend((id)objc_opt_class(), "biomeSleepModeStateForSleepModeState:", a3);
    v11 = objc_msgSend((id)objc_opt_class(), "biomeSleepModeChangeReasonForSleepModeChangeReason:", a4);
    if (a3)
    {
      -[HDSPBiomeManager environment](self, "environment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sleepModeManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "computeUserVisibleEndDate");
      a3 = objc_claimAutoreleasedReturnValue();

    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0C820]), "initWithState:changeReason:expectedEndDate:", v10, v11, a3);
    -[HDSPBiomeInterface publish:stream:](self->_biomeInterface, "publish:stream:", v14, v15);

  }
}

- (void)_writeSleepScheduleStateToBiome:(unint64_t)a3 reason:(unint64_t)a4 forceWrite:(BOOL)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  if (a5 || -[HDSPBiomeManager _shouldWriteToBiome](self, "_shouldWriteToBiome"))
  {
    BiomeLibrary();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "Sleep");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ScheduleState");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend((id)objc_opt_class(), "biomeSleepScheduleStateForSleepScheduleState:", a3);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0C7A8]), "initWithState:changeReason:", v10, objc_msgSend((id)objc_opt_class(), "biomeSleepScheduleStateChangeReasonForSleepScheduleStateChangeReason:", a4));
    -[HDSPBiomeInterface publish:stream:](self->_biomeInterface, "publish:stream:", v11, v12);

  }
}

+ (int)biomeSleepModeStateForSleepModeState:(int64_t)a3
{
  int v3;

  if (a3 == 1)
    v3 = 2;
  else
    v3 = 1;
  if (a3 == 2)
    return 3;
  else
    return v3;
}

+ (int)biomeSleepModeChangeReasonForSleepModeChangeReason:(unint64_t)a3
{
  if (a3 - 2 > 8)
    return 1;
  else
    return dword_216185F3C[a3 - 2];
}

+ (int)biomeSleepScheduleStateForSleepScheduleState:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return 1;
  else
    return dword_216185F60[a3 - 1];
}

+ (int)biomeSleepScheduleStateChangeReasonForSleepScheduleStateChangeReason:(unint64_t)a3
{
  if (a3 - 3 > 5)
    return 1;
  else
    return dword_216185F78[a3 - 3];
}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (HDSPBiomeInterface)biomeInterface
{
  return self->_biomeInterface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeInterface, 0);
  objc_destroyWeak((id *)&self->_environment);
}

@end
