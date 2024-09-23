@implementation NSUserDefaults(HKSPSleep)

+ (id)hksp_analyticsUserDefaults
{
  if (qword_1ED05F2A0 != -1)
    dispatch_once(&qword_1ED05F2A0, &__block_literal_global_208);
  return (id)qword_1ED05F298;
}

+ (id)hksp_sleepdUserDefaults
{
  if (qword_1ED05F280 != -1)
    dispatch_once(&qword_1ED05F280, &__block_literal_global_20);
  return (id)_MergedGlobals_15;
}

- (id)hksp_dictionaryRepresentationForKeys:()HKSPSleep
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "hksp_dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hksp_dictionaryByFilteringKeys:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)hksp_saveDictionary:()HKSPSleep
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__NSUserDefaults_HKSPSleep__hksp_saveDictionary___block_invoke;
  v4[3] = &unk_1E4E3CEE0;
  v4[4] = a1;
  return objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v4);
}

- (uint64_t)hksp_removeObjectsForKeys:()HKSPSleep
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__NSUserDefaults_HKSPSleep__hksp_removeObjectsForKeys___block_invoke;
  v4[3] = &unk_1E4E3C658;
  v4[4] = a1;
  return objc_msgSend(a3, "na_each:", v4);
}

- (void)hksp_reset
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;

  objc_msgSend((id)objc_opt_class(), "hksp_sleepdUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == a1)
  {
    v5 = CFSTR("com.apple.sleepd");
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "hksp_internalUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 == a1)
    {
      v5 = CFSTR("com.apple.internal.sleep");
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "hksp_analyticsUserDefaults");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4 != a1)
      {
        HKSPResetUserDefaults(a1);
        return;
      }
      v5 = CFSTR("com.apple.sleep.analytics");
    }
  }
  objc_msgSend(a1, "removePersistentDomainForName:", v5);
}

+ (id)hksp_internalUserDefaults
{
  if (qword_1ED05F290 != -1)
    dispatch_once(&qword_1ED05F290, &__block_literal_global_207);
  return (id)qword_1ED05F288;
}

+ (id)hksp_springBoardUserDefaults
{
  if (qword_1ED05F2B0 != -1)
    dispatch_once(&qword_1ED05F2B0, &__block_literal_global_209);
  return (id)qword_1ED05F2A8;
}

- (uint64_t)hksp_lockScreenDebugMode
{
  return objc_msgSend(a1, "BOOLForKey:", CFSTR("LockScreenDebugMode"));
}

- (uint64_t)hksp_setLockScreenDebugMode:()HKSPSleep
{
  return objc_msgSend(a1, "setBool:forKey:", a3, CFSTR("LockScreenDebugMode"));
}

- (uint64_t)hksp_lockScreenDemoMode
{
  return objc_msgSend(a1, "BOOLForKey:", CFSTR("HKSPSleepScreenDemoMode"));
}

- (uint64_t)hksp_setLockScreenDemoMode:()HKSPSleep
{
  return objc_msgSend(a1, "setBool:forKey:", a3, CFSTR("HKSPSleepScreenDemoMode"));
}

- (uint64_t)hksp_debugSleepModeEnabled
{
  return objc_msgSend(a1, "BOOLForKey:", CFSTR("DebugSleepMode"));
}

- (uint64_t)hksp_setDebugSleepModeEnabled:()HKSPSleep
{
  return objc_msgSend(a1, "setBool:forKey:", a3, CFSTR("DebugSleepMode"));
}

- (float)hksp_debugSleepModeAlpha:()HKSPSleep
{
  void *v4;
  void *v5;
  float v6;
  float v7;

  objc_msgSend(a1, "objectForKey:", CFSTR("DebugSleepModeAlpha"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
    *a3 = v4 != 0;
  objc_msgSend(v4, "floatValue");
  v7 = v6;

  return v7;
}

- (uint64_t)hksp_setDebugSleepModeAlpha:()HKSPSleep
{
  return objc_msgSend(a1, "setFloat:forKey:", CFSTR("DebugSleepMode"));
}

- (uint64_t)hksp_useDemoSleepData
{
  return objc_msgSend(a1, "BOOLForKey:", CFSTR("UseDemoSleepData"));
}

- (uint64_t)hksp_setUseDemoSleepData:()HKSPSleep
{
  return objc_msgSend(a1, "setBool:forKey:", a3, CFSTR("UseDemoSleepData"));
}

@end
