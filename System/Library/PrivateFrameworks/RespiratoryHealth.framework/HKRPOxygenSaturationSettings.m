@implementation HKRPOxygenSaturationSettings

- (HKRPOxygenSaturationSettings)initWithUserDefaults:(id)a3 userDefaultsSyncProvider:(id)a4
{
  id v7;
  id v8;
  HKRPOxygenSaturationSettings *v9;
  HKRPOxygenSaturationSettings *v10;
  id v11;
  uint64_t v12;
  HKObserverSet *observers;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKRPOxygenSaturationSettings;
  v9 = -[HKRPOxygenSaturationSettings init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userDefaults, a3);
    v11 = objc_alloc(MEMORY[0x24BDD3DD0]);
    v12 = objc_msgSend(v11, "initWithName:loggingCategory:", CFSTR("HKRPOxygenSaturationSettingsObservers"), *MEMORY[0x24BDD3050]);
    observers = v10->_observers;
    v10->_observers = (HKObserverSet *)v12;

    objc_storeStrong((id *)&v10->_userDefaultsSyncProvider, a4);
    -[HKRPOxygenSaturationSettings _startObservingDefaults](v10, "_startObservingDefaults");
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[HKRPOxygenSaturationSettings _stopObservingAllDefaults](self, "_stopObservingAllDefaults");
  v3.receiver = self;
  v3.super_class = (Class)HKRPOxygenSaturationSettings;
  -[HKRPOxygenSaturationSettings dealloc](&v3, sel_dealloc);
}

+ (id)standardSettings
{
  void *v2;
  HKRPUserDefaultsSyncProvider *v3;
  HKRPUserDefaultsSyncProvider *v4;
  HKRPOxygenSaturationSettings *v5;

  objc_msgSend(MEMORY[0x24BDBCF50], "hkrp_respiratoryDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [HKRPUserDefaultsSyncProvider alloc];
  v4 = -[HKRPUserDefaultsSyncProvider initWithUserDefaultsDomain:](v3, "initWithUserDefaultsDomain:", *MEMORY[0x24BDD36F0]);
  v5 = -[HKRPOxygenSaturationSettings initWithUserDefaults:userDefaultsSyncProvider:]([HKRPOxygenSaturationSettings alloc], "initWithUserDefaults:userDefaultsSyncProvider:", v2, v4);

  return v5;
}

- (BOOL)oxygenSaturationDisabled
{
  return -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("OxygenSaturationDisabled"));
}

- (void)setOxygenSaturationDisabled:(BOOL)a3
{
  HKRPUserDefaultsSyncProviding *userDefaultsSyncProvider;
  id v5;

  -[HKRPOxygenSaturationSettings _setOxygenSaturationDisabled:](self, "_setOxygenSaturationDisabled:", a3);
  userDefaultsSyncProvider = self->_userDefaultsSyncProvider;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("OxygenSaturationDisabled"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKRPUserDefaultsSyncProviding synchronizeKeys:](userDefaultsSyncProvider, "synchronizeKeys:", v5);

}

- (void)_setOxygenSaturationDisabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = v7;
    objc_msgSend(v8, "numberWithBool:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_212196000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting oxygen saturation sensor disabled: %{public}@", (uint8_t *)&v11, 0x16u);

  }
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", v3, CFSTR("OxygenSaturationDisabled"));
}

- (BOOL)backgroundRecordingsEnabled
{
  return -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("BackgroundMeasurementsEnabled"));
}

- (void)setBackgroundRecordingsEnabled:(BOOL)a3
{
  HKRPUserDefaultsSyncProviding *userDefaultsSyncProvider;
  id v5;

  -[HKRPOxygenSaturationSettings _setBackgroundRecordingsEnabled:](self, "_setBackgroundRecordingsEnabled:", a3);
  userDefaultsSyncProvider = self->_userDefaultsSyncProvider;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("BackgroundMeasurementsEnabled"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKRPUserDefaultsSyncProviding synchronizeKeys:](userDefaultsSyncProvider, "synchronizeKeys:", v5);

}

- (void)_setBackgroundRecordingsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = v7;
    objc_msgSend(v8, "numberWithBool:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_212196000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting background recordings enabled: %{public}@", (uint8_t *)&v11, 0x16u);

  }
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", v3, CFSTR("BackgroundMeasurementsEnabled"));
}

- (BOOL)backgroundRecordingsDuringSleepMode
{
  return -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("BackgroundMeasurementsDuringSleepMode"));
}

- (void)setBackgroundRecordingsDuringSleepMode:(BOOL)a3
{
  HKRPUserDefaultsSyncProviding *userDefaultsSyncProvider;
  id v5;

  -[HKRPOxygenSaturationSettings _setBackgroundRecordingsDuringSleepMode:](self, "_setBackgroundRecordingsDuringSleepMode:", a3);
  userDefaultsSyncProvider = self->_userDefaultsSyncProvider;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("BackgroundMeasurementsDuringSleepMode"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKRPUserDefaultsSyncProviding synchronizeKeys:](userDefaultsSyncProvider, "synchronizeKeys:", v5);

}

- (void)_setBackgroundRecordingsDuringSleepMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = v7;
    objc_msgSend(v8, "numberWithBool:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_212196000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting background recordings during sleep mode: %{public}@", (uint8_t *)&v11, 0x16u);

  }
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", v3, CFSTR("BackgroundMeasurementsDuringSleepMode"));
}

- (BOOL)backgroundRecordingsDuringTheaterMode
{
  return -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("BackgroundMeasurementsDuringTheaterMode"));
}

- (void)setBackgroundRecordingsDuringTheaterMode:(BOOL)a3
{
  HKRPUserDefaultsSyncProviding *userDefaultsSyncProvider;
  id v5;

  -[HKRPOxygenSaturationSettings _setBackgroundRecordingsDuringTheaterMode:](self, "_setBackgroundRecordingsDuringTheaterMode:", a3);
  userDefaultsSyncProvider = self->_userDefaultsSyncProvider;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("BackgroundMeasurementsDuringTheaterMode"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKRPUserDefaultsSyncProviding synchronizeKeys:](userDefaultsSyncProvider, "synchronizeKeys:", v5);

}

- (void)_setBackgroundRecordingsDuringTheaterMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = v7;
    objc_msgSend(v8, "numberWithBool:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_212196000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting background recordings during theater mode: %{public}@", (uint8_t *)&v11, 0x16u);

  }
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", v3, CFSTR("BackgroundMeasurementsDuringTheaterMode"));
}

- (void)activateDefaultValuesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("BackgroundMeasurementsEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HKRPOxygenSaturationSettings _setBackgroundRecordingsEnabled:](self, "_setBackgroundRecordingsEnabled:", 1);
    objc_msgSend(v6, "addObject:", CFSTR("BackgroundMeasurementsEnabled"));
  }
  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("BackgroundMeasurementsDuringSleepMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[HKRPOxygenSaturationSettings _setBackgroundRecordingsDuringSleepMode:](self, "_setBackgroundRecordingsDuringSleepMode:", 1);
    objc_msgSend(v6, "addObject:", CFSTR("BackgroundMeasurementsDuringSleepMode"));
  }
  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("BackgroundMeasurementsDuringTheaterMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[HKRPOxygenSaturationSettings _setBackgroundRecordingsDuringTheaterMode:](self, "_setBackgroundRecordingsDuringTheaterMode:", 0);
    objc_msgSend(v6, "addObject:", CFSTR("BackgroundMeasurementsDuringTheaterMode"));
  }
  objc_msgSend(v6, "addObject:", CFSTR("HKRPBloodOxygenSaturationEnabled"));
  -[HKRPUserDefaultsSyncProviding synchronizeKeys:](self->_userDefaultsSyncProvider, "synchronizeKeys:", v6);

}

- (void)reset
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  os_log_t *v8;
  uint64_t i;
  void *v10;
  void *v11;
  os_log_t v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[NSUserDefaults persistentDomainForName:](self->_userDefaults, "persistentDomainForName:", *MEMORY[0x24BDD36F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v22;
    v8 = (os_log_t *)MEMORY[0x24BDD3050];
    *(_QWORD *)&v5 = 138543618;
    v20 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v10, "hasPrefix:", CFSTR("HKRP"), v20) & 1) == 0)
        {
          -[NSUserDefaults removeObjectForKey:](self->_userDefaults, "removeObjectForKey:", v10);
          -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          _HKInitializeLogging();
          v12 = *v8;
          v13 = os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT);
          if (v11)
          {
            if (!v13)
              continue;
            v14 = v12;
            v15 = (void *)objc_opt_class();
            *(_DWORD *)buf = v20;
            v26 = v15;
            v27 = 2114;
            v28 = v10;
            v16 = v15;
            v17 = v14;
            v18 = "[%{public}@] Attempted to remove key \"%{public}@\" but it's still present, maybe it lives in the global domain?";
          }
          else
          {
            if (!v13)
              continue;
            v14 = v12;
            v19 = (void *)objc_opt_class();
            *(_DWORD *)buf = v20;
            v26 = v19;
            v27 = 2114;
            v28 = v10;
            v16 = v19;
            v17 = v14;
            v18 = "[%{public}@] Removed key \"%{public}@\";
          }
          _os_log_impl(&dword_212196000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0x16u);

        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v6);
  }

}

- (BOOL)overrideIsRemoteDisabled
{
  void *v2;
  char v3;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("OverrideIsRemoteDisabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setOverrideIsRemoteDisabled:(BOOL)a3
{
  HKRPUserDefaultsSyncProviding *userDefaultsSyncProvider;
  id v5;

  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", a3, CFSTR("OverrideIsRemoteDisabled"));
  userDefaultsSyncProvider = self->_userDefaultsSyncProvider;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("OverrideIsRemoteDisabled"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKRPUserDefaultsSyncProviding synchronizeKeys:](userDefaultsSyncProvider, "synchronizeKeys:", v5);

}

- (void)addObserver:(id)a3 queue:(id)a4
{
  HKObserverSet *observers;

  observers = self->_observers;
  if (a4)
    -[HKObserverSet registerObserver:queue:](observers, "registerObserver:queue:", a3);
  else
    -[HKObserverSet registerObserver:](observers, "registerObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)_notifySettingsDidChange
{
  HKObserverSet *observers;
  _QWORD v3[5];

  observers = self->_observers;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __56__HKRPOxygenSaturationSettings__notifySettingsDidChange__block_invoke;
  v3[3] = &unk_24CD49618;
  v3[4] = self;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v3);
}

void __56__HKRPOxygenSaturationSettings__notifySettingsDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "oxygenSaturationSettingsDidChange:", *(_QWORD *)(a1 + 32));

}

- (id)_settingsToObserve
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("OxygenSaturationDisabled");
  v3[1] = CFSTR("BackgroundMeasurementsEnabled");
  v3[2] = CFSTR("BackgroundMeasurementsDuringSleepMode");
  v3[3] = CFSTR("BackgroundMeasurementsDuringTheaterMode");
  v3[4] = CFSTR("OverrideIsRemoteDisabled");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_startObservingDefaults
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HKRPOxygenSaturationSettings _settingsToObserve](self, "_settingsToObserve");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_userDefaults, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), 3, 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_stopObservingAllDefaults
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HKRPOxygenSaturationSettings _settingsToObserve](self, "_settingsToObserve");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[NSUserDefaults removeObserver:forKeyPath:](self->_userDefaults, "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  _HKInitializeLogging();
  v13 = (void *)*MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    v15 = (void *)objc_opt_class();
    v16 = *MEMORY[0x24BDD0E80];
    v17 = v15;
    objc_msgSend(v12, "objectForKeyedSubscript:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v24 = v15;
    v25 = 2114;
    v26 = v10;
    v27 = 2114;
    v28 = v18;
    v29 = 2114;
    v30 = v19;
    _os_log_impl(&dword_212196000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ change to: %{public}@ -> %{public}@", buf, 0x2Au);

  }
  -[HKRPOxygenSaturationSettings _settingsToObserve](self, "_settingsToObserve");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "containsObject:", v10);

  if (v21)
  {
    -[HKRPOxygenSaturationSettings _notifySettingsDidChange](self, "_notifySettingsDidChange");
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)HKRPOxygenSaturationSettings;
    -[HKRPOxygenSaturationSettings observeValueForKeyPath:ofObject:change:context:](&v22, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaultsSyncProvider, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (NSString)bloodOxygenLocalizedPaneTitle
{
  return (NSString *)HKRPLocalizedString(CFSTR("APP_NAME"));
}

- (NSString)bloodOxygenSectionTitle
{
  return (NSString *)HKRPLocalizedString(CFSTR("RECORDINGS_SECTION_TITLE"));
}

- (NSString)backgroundRecordingsWithAgeGatingEnabledHeader
{
  return (NSString *)HKRPLocalizedString(CFSTR("RECORDINGS_DESCRIPTION_AGE_GATING_ENABLED"));
}

- (NSString)backgroundRecordingsHeader
{
  return (NSString *)HKRPLocalizedString(CFSTR("RECORDINGS_DESCRIPTION"));
}

- (NSString)bloodOxygenRecordingsTitle
{
  return (NSString *)HKRPLocalizedString(CFSTR("BLOOD_OXYGEN_RECORDINGS"));
}

- (NSString)backgroundRecordingsTitle
{
  return (NSString *)HKRPLocalizedString(CFSTR("BLOOD_OXYGEN_RECORDINGS"));
}

- (NSString)featureActiveStatusTitle
{
  return (NSString *)HKRPLocalizedString(CFSTR("OXYGEN_SATURATION_FEATURE_ACTIVE_STATUS"));
}

- (NSString)featureActiveStatusDescription
{
  return (NSString *)HKRPLocalizedString(CFSTR("OXYGEN_SATURATION_FEATURE_ACTIVE_DESCRIPTION"));
}

- (NSString)featureInactiveStatusTitle
{
  return (NSString *)HKRPLocalizedString(CFSTR("OXYGEN_SATURATION_FEATURE_INACTIVE_STATUS"));
}

- (NSString)featureInactiveStatusDescription
{
  return (NSString *)HKRPLocalizedString(CFSTR("OXYGEN_SATURATION_FEATURE_ACTIVE_DESCRIPTION"));
}

- (NSString)backgroundRecordingsFooter
{
  return (NSString *)HKRPLocalizedString(CFSTR("BACKGROUND_RECORDING_DESCRIPTION"));
}

- (NSString)learnMoreAboutBloodOxygenURL
{
  return (NSString *)HKRPLocalizedString(CFSTR("LEARN_MORE_ABOUT_BLOOD_OXYGEN_LINK_URL"));
}

- (NSString)aboutBloodOxygenFooter
{
  return (NSString *)HKRPLocalizedString(CFSTR("ABOUT_BLOOD_OXYGEN"));
}

- (NSString)aboutBloodOxygenFooterWithLearnMore
{
  return (NSString *)HKRPLocalizedString(CFSTR("LEARN_MORE_ABOUT_BLOOD_OXYGEN"));
}

- (NSString)backgroundRecordingsDetailOptionsTitle
{
  return (NSString *)HKRPLocalizedString(CFSTR("BACKGROUND_RECORDING_OPTION_TITLE"));
}

- (NSString)backgroundRecordingsDetailSleepTitle
{
  return (NSString *)HKRPLocalizedString(CFSTR("BACKGROUND_RECORDING_DURING_SLEEP"));
}

- (NSString)backgroundRecordingsDetailTheaterTitle
{
  return (NSString *)HKRPLocalizedString(CFSTR("BACKGROUND_RECORDING_DURING_THEATER_MODE"));
}

- (NSString)backgroundRecordingsDetailOptionsFooter
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (objc_msgSend(MEMORY[0x24BDD4170], "isWristDetectEnabled"))
  {
    HKRPLocalizedString(CFSTR("BACKGROUND_RECORDING_OPTION_FOOTER"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    HKRPLocalizedString(CFSTR("BACKGROUND_RECORDING_OPTION_FOOTER_WRIST_DETECT_TURNED_OFF_%@"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    HKRPLocalizedString(CFSTR("PASSCODE_SETTINGS_LINK_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v2;
}

- (NSString)howToTakeARecordingEducationTitle
{
  return (NSString *)HKRPLocalizedString(CFSTR("HOW_TO_MAKE_A_RECORDING"));
}

- (NSString)recordingInactiveDescription
{
  return (NSString *)HKRPLocalizedString(CFSTR("OXYGEN_SATURATION_FEATURE_INACTIVE_DESCRIPTION"));
}

@end
