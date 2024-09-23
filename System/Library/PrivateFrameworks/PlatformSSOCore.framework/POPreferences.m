@implementation POPreferences

+ (BOOL)BOOLValueForKey:(__CFString *)a3 defaultValue:(BOOL)a4
{
  const __CFString *v6;
  void *v7;

  v6 = (const __CFString *)*MEMORY[0x24BDBD570];
  v7 = (void *)CFPreferencesCopyValue(a3, CFSTR("com.apple.PlatformSSO"), (CFStringRef)*MEMORY[0x24BDBD578], (CFStringRef)*MEMORY[0x24BDBD570]);
  if (v7
    || (v7 = (void *)CFPreferencesCopyValue(a3, CFSTR("com.apple.PlatformSSO"), (CFStringRef)*MEMORY[0x24BDBD590], v6)) != 0)
  {
    a4 = objc_msgSend(v7, "BOOLValue");

  }
  return a4;
}

+ (id)numberValueForKey:(__CFString *)a3 defaultValue:(id)a4
{
  const __CFString *v5;
  const __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  CFPropertyListRef v10;
  void *v11;
  void *v12;
  id v13;

  v5 = (const __CFString *)*MEMORY[0x24BDBD578];
  v6 = (const __CFString *)*MEMORY[0x24BDBD570];
  v7 = a4;
  v8 = (void *)CFPreferencesCopyValue(a3, CFSTR("com.apple.PlatformSSO"), v5, v6);
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = CFPreferencesCopyValue(a3, CFSTR("com.apple.PlatformSSO"), (CFStringRef)*MEMORY[0x24BDBD590], v6);
  v11 = (void *)v10;

  if (v11)
    v12 = v11;
  else
    v12 = v7;
  v13 = v12;

  return v13;
}

+ (BOOL)requireRootCAInSystemTrustStore
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__POPreferences_requireRootCAInSystemTrustStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (requireRootCAInSystemTrustStore_onceToken != -1)
    dispatch_once(&requireRootCAInSystemTrustStore_onceToken, block);
  return requireRootCAInSystemTrustStore_requireRootCAInSystemTrustStore;
}

void __48__POPreferences_requireRootCAInSystemTrustStore__block_invoke(uint64_t a1)
{
  const __CFString *v2;
  char v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (!AppSSOCoreLibraryCore_frameworkLibrary)
    AppSSOCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  if (AppSSOCoreLibraryCore_frameworkLibrary && !objc_msgSend(getSOUtilsClass(), "isInternalBuild"))
  {
    v3 = 1;
  }
  else
  {
    v2 = (const __CFString *)*MEMORY[0x24BDBD588];
    CFPreferencesSynchronize(CFSTR("com.apple.PlatformSSO"), (CFStringRef)*MEMORY[0x24BDBD578], (CFStringRef)*MEMORY[0x24BDBD588]);
    CFPreferencesSynchronize(CFSTR("com.apple.PlatformSSO"), (CFStringRef)*MEMORY[0x24BDBD590], v2);
    v3 = objc_msgSend(*(id *)(a1 + 32), "BOOLValueForKey:defaultValue:", CFSTR("RequireRootCAInSystemTrustStore"), 1);
  }
  requireRootCAInSystemTrustStore_requireRootCAInSystemTrustStore = v3;
  PO_LOG_POPreferences();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __48__POPreferences_requireRootCAInSystemTrustStore__block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

}

+ (BOOL)forceKerberosTGTExchange
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__POPreferences_forceKerberosTGTExchange__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (forceKerberosTGTExchange_onceToken != -1)
    dispatch_once(&forceKerberosTGTExchange_onceToken, block);
  return forceKerberosTGTExchange_forceKerberosTGTExchange;
}

void __41__POPreferences_forceKerberosTGTExchange__block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = objc_msgSend(getSOUtilsClass(), "isInternalBuild");
  if (v2)
  {
    CFPreferencesSynchronize(CFSTR("com.apple.PlatformSSO"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
    LOBYTE(v2) = objc_msgSend(*(id *)(a1 + 32), "BOOLValueForKey:defaultValue:", CFSTR("ForceKerberosTGTExchange"), 0);
  }
  forceKerberosTGTExchange_forceKerberosTGTExchange = v2;
  PO_LOG_POPreferences();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __41__POPreferences_forceKerberosTGTExchange__block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

}

+ (NSNumber)forceExtensionSDKVersion
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__POPreferences_forceExtensionSDKVersion__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (forceExtensionSDKVersion_onceToken != -1)
    dispatch_once(&forceExtensionSDKVersion_onceToken, block);
  return (NSNumber *)(id)forceExtensionSDKVersion_forceExtensionSDKVersion;
}

void __41__POPreferences_forceExtensionSDKVersion__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (objc_msgSend(getSOUtilsClass(), "isInternalBuild"))
  {
    CFPreferencesSynchronize(CFSTR("com.apple.PlatformSSO"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
    objc_msgSend(*(id *)(a1 + 32), "numberValueForKey:defaultValue:", CFSTR("ForceExtensionSDKVersion"), 0);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v3 = (void *)forceExtensionSDKVersion_forceExtensionSDKVersion;
  forceExtensionSDKVersion_forceExtensionSDKVersion = v2;

  PO_LOG_POPreferences();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __41__POPreferences_forceExtensionSDKVersion__block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

}

void __48__POPreferences_requireRootCAInSystemTrustStore__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_24440D000, a1, a3, "requireRootCAInSystemTrustStore=%{public}s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __41__POPreferences_forceKerberosTGTExchange__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_24440D000, a1, a3, "forceKerberosTGTExchange=%{public}s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __41__POPreferences_forceExtensionSDKVersion__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_24440D000, a1, a3, "forceExtensionSDKVersion=%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
