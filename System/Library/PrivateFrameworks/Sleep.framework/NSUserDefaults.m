@implementation NSUserDefaults

void __55__NSUserDefaults_HKSPSleep__hksp_analyticsUserDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.sleep.analytics"));
  v1 = (void *)qword_1ED05F298;
  qword_1ED05F298 = v0;

}

void __52__NSUserDefaults_HKSPSleep__hksp_sleepdUserDefaults__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.sleepd")))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v1 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.sleepd"));
  }
  v2 = (void *)_MergedGlobals_15;
  _MergedGlobals_15 = v1;

}

uint64_t __49__NSUserDefaults_HKSPSleep__hksp_saveDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a3, a2);
}

uint64_t __55__NSUserDefaults_HKSPSleep__hksp_removeObjectsForKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hksp_removeObjectForKey:", a2);
}

void __54__NSUserDefaults_HKSPSleep__hksp_internalUserDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.internal.sleep"));
  v1 = (void *)qword_1ED05F288;
  qword_1ED05F288 = v0;

}

void __57__NSUserDefaults_HKSPSleep__hksp_springBoardUserDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.springboard"));
  v1 = (void *)qword_1ED05F2A8;
  qword_1ED05F2A8 = v0;

}

@end
