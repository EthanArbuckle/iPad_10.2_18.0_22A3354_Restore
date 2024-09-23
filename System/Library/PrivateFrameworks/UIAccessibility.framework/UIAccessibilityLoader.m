@implementation UIAccessibilityLoader

+ (void)_performInitialAccessibilityBundleLoad:(BOOL)a3 monitorForFutureLoadEvents:(BOOL)a4 trackingMode:(int64_t)a5
{
  _BOOL4 v6;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;
  BOOL v13;

  v6 = a4;
  if (a3 || a4)
  {
    objc_msgSend(MEMORY[0x1E0CF3970], "defaultLoader");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v6 || (objc_msgSend(v8, "shouldAutoloadAccessibilityCodeItems") & 1) == 0)
    {
      objc_msgSend(v9, "setLoadEventWillOccurBlock:", &__block_literal_global);
      objc_msgSend(v9, "setShouldLoadAccessibilityCodeItemBlock:", &__block_literal_global_178);
      objc_msgSend(v9, "setDidLoadAccessibilityCodeItemBlock:", &__block_literal_global_180);
      objc_msgSend(v9, "setLoadEventDidOccurBlock:", &__block_literal_global_184);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __104__UIAccessibilityLoader__performInitialAccessibilityBundleLoad_monitorForFutureLoadEvents_trackingMode___block_invoke_192;
      v10[3] = &unk_1E3DFDB48;
      v11 = v9;
      v12 = v6;
      v13 = a3;
      objc_msgSend(v11, "beginTrackingLoadedCodeItemsWithMode:completion:targetQueue:", a5, v10, 0);

    }
  }
}

void __104__UIAccessibilityLoader__performInitialAccessibilityBundleLoad_monitorForFutureLoadEvents_trackingMode___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];
  uint64_t v6;
  uint64_t v7;

  if (!a2)
  {
    v6 = v2;
    v7 = v3;
    AXLogLoading();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v5 = 0;
      _os_signpost_emit_with_name_impl(&dword_19D0DD000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AXLaunchTime", (const char *)&unk_19D149A3A, v5, 2u);
    }

  }
}

uint64_t __104__UIAccessibilityLoader__performInitialAccessibilityBundleLoad_monitorForFutureLoadEvents_trackingMode___block_invoke_176()
{
  return 1;
}

void __104__UIAccessibilityLoader__performInitialAccessibilityBundleLoad_monitorForFutureLoadEvents_trackingMode___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __104__UIAccessibilityLoader__performInitialAccessibilityBundleLoad_monitorForFutureLoadEvents_trackingMode___block_invoke_3;
  v10[3] = &unk_1E3DFDA78;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

uint64_t __104__UIAccessibilityLoader__performInitialAccessibilityBundleLoad_monitorForFutureLoadEvents_trackingMode___block_invoke_3(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  NSObject *v4;

  v2 = (uint64_t *)(a1 + 32);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "principalClass");
  if (AXShouldLogValidationErrors())
  {
    AXLogLoading();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __104__UIAccessibilityLoader__performInitialAccessibilityBundleLoad_monitorForFutureLoadEvents_trackingMode___block_invoke_3_cold_1(v2, (uint64_t)v3, v4);

  }
  objc_msgSend(v3, "accessibilityInitializeBundle");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __104__UIAccessibilityLoader__performInitialAccessibilityBundleLoad_monitorForFutureLoadEvents_trackingMode___block_invoke_182(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void (**v6)(_QWORD);
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD block[4];
  void (**v12)(_QWORD);
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a2)
  {
    if (a3)
    {
      +[UIAccessibilityInformationLoader sharedInstance](UIAccessibilityInformationLoader, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setNeedsLoadAccessibilityInformation");

    }
    v6[2](v6);
  }
  else
  {
    AXLogLoading();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "processName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl(&dword_19D0DD000, v8, OS_LOG_TYPE_INFO, "Initial load did occur %@", buf, 0xCu);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __104__UIAccessibilityLoader__performInitialAccessibilityBundleLoad_monitorForFutureLoadEvents_trackingMode___block_invoke_186;
    block[3] = &unk_1E3DFDB20;
    v12 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __104__UIAccessibilityLoader__performInitialAccessibilityBundleLoad_monitorForFutureLoadEvents_trackingMode___block_invoke_186(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  id *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  AXPerformSafeBlock();
  +[UIAccessibilityInformationLoader sharedInstance](UIAccessibilityInformationLoader, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLoadAccessibilityInformation");

  AXLogLoading();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  v5 = (id *)MEMORY[0x1E0CEB258];
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityIsSystemAppServer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_19D0DD000, v3, OS_LOG_TYPE_INFO, "Load system app %@", (uint8_t *)&v10, 0xCu);

  }
  if (objc_msgSend(*v5, "_accessibilityIsSystemAppServer"))
    +[UIAccessibilityLoader _didLoadSystemAppAccessibilityBundle](UIAccessibilityLoader, "_didLoadSystemAppAccessibilityBundle");
  if (AXProcessCanContactSystemWideServer())
  {
    objc_msgSend(*v5, "_accessibilityBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(0xBD7u, v7);

  }
  _gUIAXIsApplicationAccessiblityReady = 1;
  AXLogLoading();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_19D0DD000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AXLaunchTime", (const char *)&unk_19D149A3A, (uint8_t *)&v10, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __104__UIAccessibilityLoader__performInitialAccessibilityBundleLoad_monitorForFutureLoadEvents_trackingMode___block_invoke_2_187()
{
  NSObject *v0;
  uint8_t v1[16];

  objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityInitialize");
  AXLogLoading();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19D0DD000, v0, OS_LOG_TYPE_INFO, "UIApp ax initialize", v1, 2u);
  }

}

uint64_t __104__UIAccessibilityLoader__performInitialAccessibilityBundleLoad_monitorForFutureLoadEvents_trackingMode___block_invoke_192(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setShouldAutoloadAccessibilityCodeItems:", *(unsigned __int8 *)(a1 + 40));
  if (*(_BYTE *)(a1 + 41))
    return objc_msgSend(*(id *)(a1 + 32), "setAccessibilityCodeItemsNeedLoaded");
  return result;
}

+ (void)_accessibilityStartServer
{
  NSObject *v2;
  void *v3;
  int v4;
  NSObject *v5;
  const char *v6;
  uint8_t buf[16];

  AXLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D0DD000, v2, OS_LOG_TYPE_INFO, "AX Start server", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CF40E8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "started");

  if (v4)
  {
    AXLogLoading();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v6 = "Ignoring UIAccessibilityLoader _accessibilityStartServer for this process because the AXSimpleRuntimeManager was used!";
LABEL_9:
      _os_log_impl(&dword_19D0DD000, v5, OS_LOG_TYPE_INFO, v6, buf, 2u);
    }
  }
  else
  {
    if (!AXDisallowsUIBasedAccessibilityFeatures())
    {
      AXPerformBlockOnMainThread();
      return;
    }
    AXLogLoading();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v6 = "Not start application accessibility server - this client opts out of accessibility";
      goto LABEL_9;
    }
  }

}

uint64_t __50__UIAccessibilityLoader__accessibilityStartServer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v5[16];
  uint8_t buf[16];

  _accessibilityServerStarted = 1;
  AXLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D0DD000, v2, OS_LOG_TYPE_INFO, "AX Begin loading server", buf, 2u);
  }

  AXDevicePrimeDisplayManager();
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityStartMiniServer");
  if (AX_USING_LEGACY_LOADER_onceToken != -1)
    dispatch_once(&AX_USING_LEGACY_LOADER_onceToken, &__block_literal_global_299);
  if (!AX_USING_LEGACY_LOADER__UsesLegacyLoader)
    return objc_msgSend(*(id *)(a1 + 32), "_performInitialAccessibilityBundleLoad:monitorForFutureLoadEvents:trackingMode:", 1, 1, 2);
  AXLogLoading();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_19D0DD000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AXLaunchTime", (const char *)&unk_19D149A3A, v5, 2u);
  }

  return +[UIAccessibilityLegacyLoader loadExtendedAccessibilityBundles](UIAccessibilityLegacyLoader, "loadExtendedAccessibilityBundles");
}

+ (void)_accessibilityUpdateSafeCategoryThread
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1 & 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_19D0DD000, a2, OS_LOG_TYPE_DEBUG, "Safe categories installing on background thread %@", (uint8_t *)&v4, 0xCu);

}

+ (void)_accessibilityStartMiniServer
{
  OUTLINED_FUNCTION_0(&dword_19D0DD000, a1, a3, "Accessibility Started (Mini-Server)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

uint64_t __54__UIAccessibilityLoader__accessibilityStartMiniServer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityUpdateSafeCategoryThread");
}

+ (void)_accessibilityReenabled
{
  NSObject *v2;
  _BOOL4 v3;
  id *v4;
  int v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  AXLogLoading();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);
  v4 = (id *)MEMORY[0x1E0CEB258];
  if (v3)
  {
    v5 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityIsSystemAppServer");
    v8[0] = 67109376;
    v8[1] = v5;
    v9 = 1024;
    v10 = _AXSApplicationAccessibilityEnabled();
    _os_log_impl(&dword_19D0DD000, v2, OS_LOG_TYPE_INFO, "Accessibility Reenabled [system server: %d] [app ax enabled: %d], ", (uint8_t *)v8, 0xEu);
  }

  if (objc_msgSend(*v4, "_accessibilityIsSystemAppServer")
    && _AXSApplicationAccessibilityEnabled())
  {
    _UIAXPostAccessibilityLoadedNotification();
  }
  if (_AXSApplicationAccessibilityEnabled())
  {
    objc_msgSend(*v4, "_accessibilityBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(0xBD7u, v6);

  }
  if (_AXSApplicationAccessibilityEnabled())
  {
    if (CFAbsoluteTimeGetCurrent() - *(double *)&_accessibilityReenabled_LastLoadAll > 3.0)
    {
      +[UIAccessibilityInformationLoader sharedInstance](UIAccessibilityInformationLoader, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setNeedsLoadAccessibilityInformation");

      _accessibilityReenabled_LastLoadAll = CFAbsoluteTimeGetCurrent();
    }
  }
}

+ (void)_accessibilityStopServer
{
  OUTLINED_FUNCTION_0(&dword_19D0DD000, a1, a3, "Accessibility Stopped", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (BOOL)_accessibilityServerStarted
{
  return _accessibilityServerStarted;
}

+ (BOOL)_accessibilityUIKitBundleLoaded
{
  return _AccessibilityUIKitBundledLoaded;
}

+ (BOOL)_accessibilityStringLocalizationCategoriesLoaded
{
  return _UIAXDidLoadStringLocalizationCategoriesValue;
}

+ (void)_accessibilityInitializeRuntimeOverrides
{
  OUTLINED_FUNCTION_0(&dword_19D0DD000, a1, a3, "Accessibility Initialize Runtime Overrides", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __65__UIAccessibilityLoader__accessibilityInitializeRuntimeOverrides__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CF3A08], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_204, &__block_literal_global_227, &__block_literal_global_233, &__block_literal_global_235);

}

uint64_t __65__UIAccessibilityLoader__accessibilityInitializeRuntimeOverrides__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  char v5;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasPrefix:", *MEMORY[0x1E0CF3908]);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScreen"), CFSTR("_updateTraits"), "v", 0);
    objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("UIScreen"), CFSTR("_enumerateScreensWithBlock:"), "v", "@?", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardImpl"), CFSTR("taskQueue"), "@", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardTaskQueue"), CFSTR("waitUntilAllTasksAreFinished"), "v", 0);
    objc_msgSend(v2, "validateClass:", CFSTR("__SwiftNull"));
    objc_msgSend(v2, "validateClass:", CFSTR("__SwiftValue"));
  }

  return 1;
}

uint64_t __65__UIAccessibilityLoader__accessibilityInitializeRuntimeOverrides__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("UIAccessibilityRuntimeLoad"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("UIAccessibility framework"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __65__UIAccessibilityLoader__accessibilityInitializeRuntimeOverrides__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _AXInitializeSafeSwiftValueSupport();
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("NSObjectAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("NSBundleAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIAccessibilityElementSuperCategory"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UITouchesEventAccessibility"), 1);

}

+ (void)loadAccessibilityBundleForBundle:(id)a3 didLoadCallback:(id)a4
{
  +[UIAccessibilityLoader loadAccessibilityBundleForBundle:didLoadCallback:forceLoad:loadSubbundles:loadAllAccessibilityInfo:](UIAccessibilityLoader, "loadAccessibilityBundleForBundle:didLoadCallback:forceLoad:loadSubbundles:loadAllAccessibilityInfo:", a3, a4, 0, 1, 0);
}

+ (void)loadAccessibilityBundleForBundle:(id)a3 didLoadCallback:(id)a4 force:(BOOL)a5 loadAllAccessibilityInfo:(BOOL)a6
{
  +[UIAccessibilityLoader loadAccessibilityBundleForBundle:didLoadCallback:forceLoad:loadSubbundles:loadAllAccessibilityInfo:](UIAccessibilityLoader, "loadAccessibilityBundleForBundle:didLoadCallback:forceLoad:loadSubbundles:loadAllAccessibilityInfo:", a3, a4, a5, 1, a6);
}

+ (void)loadAccessibilityBundleForBundle:(id)a3 didLoadCallback:(id)a4 forceLoad:(BOOL)a5 loadSubbundles:(BOOL)a6 loadAllAccessibilityInfo:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  id v11;
  id v12;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v12 = a3;
  v11 = a4;
  if (AX_USING_LEGACY_LOADER_onceToken != -1)
    dispatch_once(&AX_USING_LEGACY_LOADER_onceToken, &__block_literal_global_299);
  if (AX_USING_LEGACY_LOADER__UsesLegacyLoader)
    +[UIAccessibilityLegacyLoader loadAccessibilityBundleForBundle:didLoadCallback:forceLoad:loadSubbundles:loadAllAccessibilityInfo:](UIAccessibilityLegacyLoader, "loadAccessibilityBundleForBundle:didLoadCallback:forceLoad:loadSubbundles:loadAllAccessibilityInfo:", v12, v11, v9, v8, v7);

}

+ (void)loadAccessibilityBundle:(id)a3 didLoadCallback:(id)a4 loadSubbundles:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a5;
  v8 = a3;
  v7 = a4;
  if (AX_USING_LEGACY_LOADER_onceToken != -1)
    dispatch_once(&AX_USING_LEGACY_LOADER_onceToken, &__block_literal_global_299);
  if (AX_USING_LEGACY_LOADER__UsesLegacyLoader)
    +[UIAccessibilityLegacyLoader loadAccessibilityBundle:didLoadCallback:loadSubbundles:](UIAccessibilityLegacyLoader, "loadAccessibilityBundle:didLoadCallback:loadSubbundles:", v8, v7, v5);

}

+ (id)_accessibilityBundlesForBundle:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (AX_USING_LEGACY_LOADER_onceToken != -1)
    dispatch_once(&AX_USING_LEGACY_LOADER_onceToken, &__block_literal_global_299);
  if (AX_USING_LEGACY_LOADER__UsesLegacyLoader)
  {
    +[UIAccessibilityLegacyLoader _accessibilityBundlesForBundle:](UIAccessibilityLegacyLoader, "_accessibilityBundlesForBundle:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (void)_stringLocalizationStarted:(id)a3
{
  if ((_AXSAutomationLocalizedStringLookupInfoEnabled() || _AXSAutomationPreferredLocalization())
    && _stringLocalizationStarted__onceToken != -1)
  {
    dispatch_once(&_stringLocalizationStarted__onceToken, &__block_literal_global_246);
  }
}

void __52__UIAccessibilityLoader__stringLocalizationStarted___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CF3A08], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_247, &__block_literal_global_248, &__block_literal_global_251, &__block_literal_global_252);

}

uint64_t __52__UIAccessibilityLoader__stringLocalizationStarted___block_invoke_2()
{
  return 1;
}

uint64_t __52__UIAccessibilityLoader__stringLocalizationStarted___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("String localization for Automation - UIAccessibility"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("String localization for Automation - UIAccessibility"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __52__UIAccessibilityLoader__stringLocalizationStarted___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("NSStringAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("NSPlaceholderStringAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("NSConcreteAttributedStringAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("NSConcreteMutableAttributedStringAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("NSKeyedArchiverAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("__NSCFStringAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AXPTranslationObjectAccessibility"), 1);

  _UIAXDidLoadStringLocalizationCategoriesValue = 1;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("AXUILocalizationLoaded"), 0);

}

void __104__UIAccessibilityLoader__performInitialAccessibilityBundleLoad_monitorForFutureLoadEvents_trackingMode___block_invoke_3_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_debug_impl(&dword_19D0DD000, log, OS_LOG_TYPE_DEBUG, "Will initialize AX on Bundle '%{public}@'. Principal class: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
