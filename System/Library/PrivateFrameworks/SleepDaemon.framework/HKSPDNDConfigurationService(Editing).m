@implementation HKSPDNDConfigurationService(Editing)

- (uint64_t)createSleepFocusModeInState:()Editing error:
{
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(a1, "hasSleepFocusMode:", a4) & 1) == 0)
    return objc_msgSend(a1, "_createSleepFocusModeInState:error:", a3, a4);
  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = a1;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] already have a sleep focus mode", (uint8_t *)&v9, 0xCu);
  }

  return 1;
}

- (uint64_t)removeSleepFocusMode:()Editing
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "modeConfigService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "removeModeConfigurationForModeIdentifier:error:", *MEMORY[0x24BEA96A0], a3);

  if ((_DWORD)v6)
    objc_msgSend(a1, "updateCachedUUID:state:", 0, 0);
  return v6;
}

- (uint64_t)configureSleepFocusModeWithState:()Editing error:
{
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a1, "hasSleepFocusMode:", a4))
    return objc_msgSend(a1, "_updateSleepFocusModeWithState:error:", a3, a4);
  HKSPLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = a1;
    _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] we don't have a sleep focus mode", (uint8_t *)&v9, 0xCu);
  }

  return 0;
}

- (uint64_t)_createSleepFocusModeInState:()Editing error:
{
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromHKSPSleepFocusConfigurationState();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = a1;
    v17 = 2114;
    v18 = v8;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] creating default sleep focus mode (state: %{public}@)", (uint8_t *)&v15, 0x16u);

  }
  objc_msgSend(a1, "modeConfigService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createDefaultSleepingModeConfigurationWithError:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_msgSend(a1, "_actuallyUpdateModeConfiguration:state:error:", v10, a3, a4);
  }
  else
  {
    HKSPLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = *a4;
      v15 = 138543618;
      v16 = a1;
      v17 = 2114;
      v18 = v14;
      _os_log_error_impl(&dword_21610C000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] failed to create default sleep focus mode configuration with error: %{public}@", (uint8_t *)&v15, 0x16u);
    }

    v11 = 0;
  }

  return v11;
}

- (uint64_t)_updateSleepFocusModeWithState:()Editing error:
{
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromHKSPSleepFocusConfigurationState();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = a1;
    v17 = 2114;
    v18 = v8;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating existing sleep focus mode (state: %{public}@)", (uint8_t *)&v15, 0x16u);

  }
  objc_msgSend(a1, "modeConfigService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modeConfigurationForModeIdentifier:error:", *MEMORY[0x24BEA96A0], a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_msgSend(a1, "_actuallyUpdateModeConfiguration:state:error:", v10, a3, a4);
  }
  else
  {
    HKSPLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = *a4;
      v15 = 138543618;
      v16 = a1;
      v17 = 2114;
      v18 = v14;
      _os_log_error_impl(&dword_21610C000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] failed to fetch existing sleep focus mode configuration with error: %{public}@", (uint8_t *)&v15, 0x16u);
    }

    v11 = 0;
  }

  return v11;
}

- (uint64_t)_actuallyUpdateModeConfiguration:()Editing state:error:
{
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "hksp_configurationWithConfigurationState:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "modeConfigService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "setModeConfiguration:error:", v7, a5);

  HKSPLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v9 & 1) != 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = a1;
      _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] successfully set sleep focus mode configuration", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend(v7, "mode");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject identifier](v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "updateCachedUUID:state:", v12, objc_msgSend(v7, "hksp_configurationState"));

  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v14 = *a5;
    v15 = 138543618;
    v16 = a1;
    v17 = 2114;
    v18 = v14;
    _os_log_error_impl(&dword_21610C000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] failed to set sleep focus mode configuration with error: %{public}@", (uint8_t *)&v15, 0x16u);
  }

  return v9;
}

@end
