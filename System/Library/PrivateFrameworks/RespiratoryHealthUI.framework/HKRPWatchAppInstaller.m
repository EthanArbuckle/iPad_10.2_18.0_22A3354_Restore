@implementation HKRPWatchAppInstaller

- (HKRPWatchAppInstaller)init
{
  void *v3;
  void *v4;
  void *v5;
  _HKRPDefaultWatchAppsInstallProvider *v6;
  HKRPWatchAppInstaller *v7;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getActivePairedDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD4110]), "initWithBundleID:", CFSTR("com.apple.NanoOxygenSaturation.watchkitapp"));
  v6 = objc_alloc_init(_HKRPDefaultWatchAppsInstallProvider);
  v7 = -[HKRPWatchAppInstaller initWithDevice:watchAppAvailability:installAppsProviding:](self, "initWithDevice:watchAppAvailability:installAppsProviding:", v4, v5, v6);

  return v7;
}

- (HKRPWatchAppInstaller)initWithDevice:(id)a3 watchAppAvailability:(id)a4 installAppsProviding:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKRPWatchAppInstaller *v12;
  HKRPWatchAppInstaller *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKRPWatchAppInstaller;
  v12 = -[HKRPWatchAppInstaller init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_device, a3);
    objc_storeStrong((id *)&v13->_watchAppAvailability, a4);
    objc_storeStrong((id *)&v13->_installAppsProviding, a5);
  }

  return v13;
}

- (void)checkIfAppCanBeInstalledWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  NRDevice *device;
  HKWatchAppAvailability *watchAppAvailability;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  device = self->_device;
  if (device)
  {
    watchAppAvailability = self->_watchAppAvailability;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __64__HKRPWatchAppInstaller_checkIfAppCanBeInstalledWithCompletion___block_invoke;
    v11[3] = &unk_24EF4C8C8;
    v11[4] = self;
    v12 = v4;
    -[HKWatchAppAvailability appInstallStateOnWatch:completion:](watchAppAvailability, "appInstallStateOnWatch:completion:", device, v11);

  }
  else
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x24BDD3050];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      *(_DWORD *)buf = 138543618;
      v14 = (id)objc_opt_class();
      v15 = 2114;
      v16 = CFSTR("com.apple.NanoOxygenSaturation.watchkitapp");
      v10 = v14;
      _os_log_impl(&dword_227010000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping check to see if %{public}@ is installed. No device specified.", buf, 0x16u);

    }
    v5[2](v5, 0, 0);
  }

}

void __64__HKRPWatchAppInstaller_checkIfAppCanBeInstalledWithCompletion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, id, uint64_t);
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  const char *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  switch(a2)
  {
    case 2:
      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x24BDD3050];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        v20 = 138543618;
        v21 = (id)objc_opt_class();
        v22 = 2114;
        v23 = CFSTR("com.apple.NanoOxygenSaturation.watchkitapp");
        v15 = v21;
        v16 = "[%{public}@] %{public}@ cannot be installed, its already installed.";
LABEL_11:
        _os_log_impl(&dword_227010000, v14, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v20, 0x16u);

      }
LABEL_12:
      v10 = a1[5];
      v11 = *(void (**)(uint64_t, uint64_t, id, uint64_t))(v10 + 16);
      v12 = 0;
LABEL_13:
      v18 = 0;
      goto LABEL_17;
    case 1:
      _HKInitializeLogging();
      v17 = (void *)*MEMORY[0x24BDD3050];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
      {
        v14 = v17;
        v20 = 138543618;
        v21 = (id)objc_opt_class();
        v22 = 2114;
        v23 = CFSTR("com.apple.NanoOxygenSaturation.watchkitapp");
        v15 = v21;
        v16 = "[%{public}@] %{public}@ cannot be installed, its already installing.";
        goto LABEL_11;
      }
      goto LABEL_12;
    case 0:
      _HKInitializeLogging();
      v6 = (void *)*MEMORY[0x24BDD3050];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
      {
        v8 = v6;
        v20 = 138543618;
        v21 = (id)objc_opt_class();
        v22 = 2114;
        v23 = CFSTR("com.apple.NanoOxygenSaturation.watchkitapp");
        v9 = v21;
        _os_log_impl(&dword_227010000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ can be installed.", (uint8_t *)&v20, 0x16u);

      }
      v10 = a1[5];
      v11 = *(void (**)(uint64_t, uint64_t, id, uint64_t))(v10 + 16);
      v12 = 1;
      goto LABEL_13;
  }
  _HKInitializeLogging();
  v19 = (void *)*MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_ERROR))
    __64__HKRPWatchAppInstaller_checkIfAppCanBeInstalledWithCompletion___block_invoke_cold_1(a1, v19, (uint64_t)v5);
  v10 = a1[5];
  v11 = *(void (**)(uint64_t, uint64_t, id, uint64_t))(v10 + 16);
  v12 = 0;
  v18 = v5;
LABEL_17:
  v11(v10, v12, v18, v7);

}

- (void)installAppWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HKRPWatchInstallAppsProviding *installAppsProviding;
  NRDevice *device;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE045F0]), "initWithBundleID:", CFSTR("com.apple.NanoOxygenSaturation.watchkitapp"));
  installAppsProviding = self->_installAppsProviding;
  device = self->_device;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__HKRPWatchAppInstaller_installAppWithCompletion___block_invoke;
  v9[3] = &unk_24EF4C8F0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[HKRPWatchInstallAppsProviding installApp:onPairedDevice:withCompletionHandler:](installAppsProviding, "installApp:onPairedDevice:withCompletionHandler:", v5, device, v9);

}

void __50__HKRPWatchAppInstaller_installAppWithCompletion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void (*v12)(void);
  int v13;
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3050];
  v7 = *MEMORY[0x24BDD3050];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[4];
      v9 = *(void **)(v8 + 8);
      v10 = v6;
      objc_msgSend(v9, "pairingID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v8;
      v15 = 2114;
      v16 = CFSTR("com.apple.NanoOxygenSaturation.watchkitapp");
      v17 = 2114;
      v18 = v11;
      _os_log_impl(&dword_227010000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduled install of %{public}@ on %{public}@", (uint8_t *)&v13, 0x20u);

    }
    v12 = *(void (**)(void))(a1[5] + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __50__HKRPWatchAppInstaller_installAppWithCompletion___block_invoke_cold_1(a1, v6, (uint64_t)v5);
    v12 = *(void (**)(void))(a1[5] + 16);
  }
  v12();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installAppsProviding, 0);
  objc_storeStrong((id *)&self->_watchAppAvailability, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

void __64__HKRPWatchAppInstaller_checkIfAppCanBeInstalledWithCompletion___block_invoke_cold_1(_QWORD *a1, void *a2, uint64_t a3)
{
  NSObject *v3;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a1[4];
  v7 = a2;
  v8 = (void *)OUTLINED_FUNCTION_1();
  v9 = OUTLINED_FUNCTION_0(v8);
  objc_msgSend(a1, "pairingID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138543874;
  v12 = v6;
  v13 = 2114;
  v14 = v10;
  v15 = 2114;
  v16 = a3;
  _os_log_error_impl(&dword_227010000, v3, OS_LOG_TYPE_ERROR, "[%{public}@] There was an error querying for app availability on device %{public}@: %{public}@", (uint8_t *)&v11, 0x20u);

}

void __50__HKRPWatchAppInstaller_installAppWithCompletion___block_invoke_cold_1(_QWORD *a1, void *a2, uint64_t a3)
{
  NSObject *v3;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a1[4];
  v7 = a2;
  v8 = (void *)OUTLINED_FUNCTION_1();
  v9 = OUTLINED_FUNCTION_0(v8);
  objc_msgSend(a1, "pairingID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138544130;
  v12 = v6;
  v13 = 2114;
  v14 = CFSTR("com.apple.NanoOxygenSaturation.watchkitapp");
  v15 = 2114;
  v16 = v10;
  v17 = 2114;
  v18 = a3;
  _os_log_error_impl(&dword_227010000, v3, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to schedule install of %{public}@ on %{public}@: %{public}@", (uint8_t *)&v11, 0x2Au);

}

@end
