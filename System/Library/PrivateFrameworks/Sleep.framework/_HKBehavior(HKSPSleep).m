@implementation _HKBehavior(HKSPSleep)

- (uint64_t)hksp_supportsSleepDaemon
{
  return objc_msgSend(a1, "_hksp_supportsSleep_checkTinker:", 0);
}

- (uint64_t)_hksp_supportsSleep_checkTinker:()HKSPSleep
{
  uint64_t v5;
  uint64_t result;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;

  v5 = objc_msgSend(a1, "hksp_device") - 1;
  result = 1;
  switch(v5)
  {
    case 0:
    case 2:
      return result;
    case 1:
      if (a3)
      {
        if (!objc_msgSend(a1, "tinkerModeEnabled"))
          return 1;
        HKSPLogForCategory(0);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v16 = 0;
          v8 = "sleep not available for tinker";
          v9 = (uint8_t *)&v16;
          goto LABEL_14;
        }
        goto LABEL_15;
      }
      return result;
    case 3:
      objc_msgSend(a1, "features");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "sleepOnIpad");

      if ((v11 & 1) != 0)
        return 1;
      HKSPLogForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      v15 = 0;
      v8 = "sleep not available for iPad";
      v9 = (uint8_t *)&v15;
      goto LABEL_14;
    case 4:
      objc_msgSend(a1, "features");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "sleepOnMac");

      if ((v13 & 1) != 0)
        return 1;
      HKSPLogForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 0;
        v8 = "sleep not available for Mac";
        v9 = (uint8_t *)&v14;
LABEL_14:
        _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      }
LABEL_15:

      return 0;
    case 5:
      return 0;
    default:
      return 0;
  }
}

- (uint64_t)hksp_device
{
  uint64_t v2;
  void *v3;

  if ((objc_msgSend(a1, "isAppleWatch") & 1) != 0)
    return 2;
  if ((objc_msgSend(a1, "isiPad") & 1) != 0)
    return 4;
  objc_msgSend(a1, "currentDeviceClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iPhone")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RealityDevice")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iPod")) & 1) != 0)
  {
    v2 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Mac")))
  {
    v2 = 5;
  }
  else
  {
    v2 = 1000;
  }

  return v2;
}

- (uint64_t)hksp_supportsSleep
{
  return objc_msgSend(a1, "_hksp_supportsSleep_checkTinker:", 1);
}

- (BOOL)hksp_supportsSleepLockScreen
{
  return ((objc_msgSend(a1, "hksp_device") - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (uint64_t)hksp_supportsSleepWidget
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  result = objc_msgSend(a1, "hksp_supportsHealthData");
  if ((_DWORD)result)
  {
    v3 = objc_msgSend(a1, "hksp_device");
    if ((unint64_t)(v3 - 1) >= 3)
    {
      if (v3 == 4)
      {
        objc_msgSend(a1, "features");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "sleepOnIpad");

        return v5;
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (uint64_t)hksp_supportsWakeUpResults
{
  uint64_t result;

  result = objc_msgSend(a1, "hksp_supportsHealthData");
  if ((_DWORD)result)
    return ((objc_msgSend(a1, "hksp_device") - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
  return result;
}

- (BOOL)hksp_supportsSleepTracking
{
  return (unint64_t)(objc_msgSend(a1, "hksp_device") - 1) < 3;
}

- (uint64_t)hksp_supportsAlwaysOnTracking
{
  void *v2;
  uint64_t v3;

  if (objc_msgSend(a1, "hksp_device") != 2)
    return 0;
  objc_msgSend(a1, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lavender");

  return v3;
}

- (BOOL)hksp_supportsGoodMorningAlerts
{
  return (unint64_t)(objc_msgSend(a1, "hksp_device") - 1) < 3;
}

- (BOOL)hksp_supportsWakeDetection
{
  return (unint64_t)(objc_msgSend(a1, "hksp_device") - 1) < 3;
}

- (BOOL)hksp_supportsUserNotificationCenter
{
  return (unint64_t)(objc_msgSend(a1, "hksp_device") - 1) < 3;
}

- (uint64_t)hksp_supportsCFUserNotifications
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "hksp_device");
  return (v1 < 5) & (0x1Au >> v1);
}

- (BOOL)hksp_supportsSleepAlarms
{
  return (unint64_t)(objc_msgSend(a1, "hksp_device") - 1) < 3;
}

- (uint64_t)hksp_supportsLegacySleepAlarms
{
  uint64_t result;

  result = objc_msgSend(a1, "hksp_supportsSleepAlarms");
  if ((_DWORD)result)
    return ((objc_msgSend(a1, "hksp_device") - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
  return result;
}

- (BOOL)hksp_supportsDailyAnalytics
{
  return ((objc_msgSend(a1, "hksp_device") - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (uint64_t)hksp_useDemoSleepData
{
  NSObject *v1;
  const char *v2;
  uint8_t *v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t v9[16];
  uint8_t buf[2];
  __int16 v11;

  if (objc_msgSend(a1, "isRunningStoreDemoMode"))
  {
    HKSPLogForCategory(0);
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 0;
      v2 = "running in demo mode";
      v3 = (uint8_t *)&v11;
LABEL_7:
      _os_log_impl(&dword_1A4F0E000, v1, OS_LOG_TYPE_DEFAULT, v2, v3, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "hksp_internalUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hksp_useDemoSleepData");

  HKSPLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v1 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v2 = "use demo data default set";
      v3 = buf;
      goto LABEL_7;
    }
LABEL_8:
    v7 = 1;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1A4F0E000, v1, OS_LOG_TYPE_INFO, "using live data", v9, 2u);
  }
  v7 = 0;
LABEL_12:

  return v7;
}

- (BOOL)hksp_hasActivePairedDevice
{
  void *v0;
  void *v1;
  _BOOL8 v2;

  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "getActivePairedDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (uint64_t)hksp_activePairedDeviceSupportsSleep
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("C0F3C2C3-0CDE-4DF9-A95A-789AC9A0348B"));
  v3 = objc_msgSend(a1, "_hksp_activePairedDeviceSupportsCapability:", v2);

  return v3;
}

- (uint64_t)hksp_activePairedDeviceSupportsSleepStages
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("A70EA46D-407A-4723-A8EF-CFF5DFB423B4"));
  v3 = objc_msgSend(a1, "_hksp_activePairedDeviceSupportsCapability:", v2);

  return v3;
}

- (uint64_t)hksp_activePairedDeviceSupportsFocusMode
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("FFDA9C57-8508-4B50-B6D8-EEE862251FC0"));
  v3 = objc_msgSend(a1, "_hksp_activePairedDeviceSupportsCapability:", v2);

  return v3;
}

- (uint64_t)hksp_activePairedDeviceSupportsSleepLauncherComplication
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("E49AA0D4-4AA5-47C3-9272-4644AF0E6FA9"));
  v3 = objc_msgSend(a1, "_hksp_activePairedDeviceSupportsCapability:", v2);

  return v3;
}

- (uint64_t)_hksp_activePairedDeviceSupportsCapability:()HKSPSleep
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x1E0D51838];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getActivePairedDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsCapability:", v4);

  return v7;
}

- (BOOL)hksp_activePairedDeviceHasHomeButton
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _BOOL8 v5;

  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "getActivePairedDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "valueForProperty:", *MEMORY[0x1E0D516C0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

    v5 = v4 != 2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)hksp_activePairedDeviceProductType
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "getActivePairedDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "valueForProperty:", *MEMORY[0x1E0D51738]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)hksp_activePairedDeviceHasSleepAppInstalledWithCompletion:()HKSPSleep
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getActivePairedDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CF8858], "sharedDeviceConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __84___HKBehavior_HKSPSleep__hksp_activePairedDeviceHasSleepAppInstalledWithCompletion___block_invoke;
    v8[3] = &unk_1E4E3B788;
    v9 = v3;
    objc_msgSend(v6, "applicationIsInstalledOnPairedDevice:withBundleID:completion:", v5, CFSTR("com.apple.NanoSleep.watchkitapp"), v8);

  }
  else
  {
    HKSPLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "no active paired device", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);
  }

}

- (uint64_t)hksp_demoMode
{
  if ((objc_msgSend(a1, "isRunningStoreDemoMode") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "runningInStoreDemoModeF201");
}

@end
