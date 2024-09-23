@implementation UIAccessibilityLegacyLoader

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_14);
}

void __41__UIAccessibilityLegacyLoader_initialize__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v0 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), CFSTR("/System/Library/PrivateFrameworks"), CFSTR("UIAccessibility.framework"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleWithPath:", v1);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v12, "pathForResource:ofType:", CFSTR("DeniedBundles"), CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithContentsOfFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_DeniedBundles;
  _DeniedBundles = v6;

  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E20]), "init");
  v9 = (void *)_LoadedBundles;
  _LoadedBundles = v8;

  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3740]), "init");
  v11 = (void *)_BundleLock;
  _BundleLock = v10;

}

+ (void)loadExtendedAccessibilityBundles
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_9(&dword_19D0DD000, a3, v5, "Loading AX for '%{public}@'. AXBundle '%{public}@'", v6);

  OUTLINED_FUNCTION_1_1();
}

void __63__UIAccessibilityLegacyLoader_loadExtendedAccessibilityBundles__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v5;
  int IsSystemAppServer;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  AXLogLoading();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    IsSystemAppServer = _UIAXAppIsSystemAppServer();
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134218498;
    v10 = a4;
    v11 = 1024;
    v12 = IsSystemAppServer;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_19D0DD000, v5, OS_LOG_TYPE_INFO, "Main bundle finished loading: load type: %ld - is system app server: %d (%@)", (uint8_t *)&v9, 0x1Cu);

  }
  if (!a4)
  {
    if (_UIAXAppIsSystemAppServer())
      +[UIAccessibilityLoader _didLoadSystemAppAccessibilityBundle](UIAccessibilityLoader, "_didLoadSystemAppAccessibilityBundle");
  }
}

void __63__UIAccessibilityLegacyLoader_loadExtendedAccessibilityBundles__block_invoke_197(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 40), "_accessibilityLoadSubbundles:", *(_QWORD *)(a1 + 32));
  +[UIAccessibilityInformationLoader sharedInstance](UIAccessibilityInformationLoader, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsLoadAccessibilityInformation");

  UIAccessibilityPostNotification(0xFA1u, 0);
}

uint64_t __63__UIAccessibilityLegacyLoader_loadExtendedAccessibilityBundles__block_invoke_199(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "_accessibilityLoadSubbundles:", *(_QWORD *)(a1 + 32));
}

+ (id)_axBundleForBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  const __CFString *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  void *v22;
  char v24;
  const __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint8_t buf[4];
  _BYTE v33[14];
  __int16 v34;
  NSObject *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "isLoaded"))
  {
    v8 = 0;
    goto LABEL_27;
  }
  objc_msgSend(v3, "accessibilityBundlePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByDeletingPathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("assistantUIBundle")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("siriUIBundle")) & 1) != 0)
  {
    v31 = 1;
  }
  else
  {
    v31 = objc_msgSend(v7, "isEqualToString:", CFSTR("siriUIPresentationBundle"));
  }
  v9 = objc_msgSend(v7, "isEqualToString:", CFSTR("uibundle"));
  v10 = objc_msgSend(v7, "isEqualToString:", CFSTR("app"));
  v11 = objc_msgSend(v7, "isEqualToString:", CFSTR("qldisplay"));
  v12 = objc_msgSend(v7, "isEqualToString:", CFSTR("framework"));
  v13 = objc_msgSend(v7, "isEqualToString:", CFSTR("bundle"));
  v14 = objc_msgSend(v7, "isEqualToString:", CFSTR("appex"));
  v15 = objc_msgSend(v7, "isEqualToString:", CFSTR("fpenroll"));
  if (v12)
  {
    v16 = CFSTR("Framework");
LABEL_19:
    objc_msgSend(v6, "stringByAppendingString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingPathExtension:", kUIAccessibilityBundleExtension);
    v18 = objc_claimAutoreleasedReturnValue();

    goto LABEL_20;
  }
  if (v31)
  {
    v16 = CFSTR("-Assistant");
    goto LABEL_19;
  }
  if (v11)
  {
    v16 = CFSTR("-QuickLook");
    goto LABEL_19;
  }
  if (v9)
  {
    v16 = CFSTR("-SBPlugin");
    goto LABEL_19;
  }
  if (v10)
  {
    v16 = CFSTR("App");
    goto LABEL_19;
  }
  if (v14)
  {
    v16 = CFSTR("-AppExtension");
    goto LABEL_19;
  }
  if (v13 || v15)
  {
    objc_msgSend(v6, "stringByAppendingPathExtension:", kUIAccessibilityBundleExtension);
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_20:
    objc_msgSend(MEMORY[0x1E0CB34D0], "accessibilityLocalBundleWithLastPathComponent:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19
      || (objc_msgSend(MEMORY[0x1E0CB34D0], "accessibilityBundleWithLastPathComponent:", v18),
          (v19 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = (id)v19;
    }
    else
    {
      if (AXIsInternalInstall())
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "accessibilityInternalBundleWithLastPathComponent:", v18);
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
      if (v8)
        v24 = 1;
      else
        v24 = v31;
      if ((v24 & 1) == 0)
      {
        v25 = CFSTR("~ipad");
        if ((objc_msgSend(v6, "hasSuffix:", CFSTR("~ipad")) & 1) != 0
          || (v25 = CFSTR("~iphone"), objc_msgSend(v6, "hasSuffix:", CFSTR("~iphone"))))
        {
          objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", v25, &stru_1E3E01CE0);
          v26 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v26;
        }
        objc_msgSend(v6, "stringByAppendingPathExtension:", kUIAccessibilityBundleExtension);
        v27 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB34D0], "accessibilityBundleWithLastPathComponent:", v27);
        v8 = (id)objc_claimAutoreleasedReturnValue();
        v18 = v27;
      }
      if (!v8)
      {
        objc_msgSend(v3, "bundleIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          objc_msgSend(v3, "bundleIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stringByAppendingPathExtension:", kUIAccessibilityBundleExtension);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB34D0], "accessibilityBundleWithLastPathComponent:", v30);
          v8 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v8 = 0;
        }
      }
    }
    AXLogLoading();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v33 = v8 != 0;
      *(_WORD *)&v33[4] = 2114;
      *(_QWORD *)&v33[6] = v3;
      v34 = 2114;
      v35 = v18;
      _os_log_debug_impl(&dword_19D0DD000, v20, OS_LOG_TYPE_DEBUG, "Loading Sub-bundle [%d]: %{public}@ [%{public}@]", buf, 0x1Cu);
    }

    v21 = 1;
    goto LABEL_26;
  }
  AXLogLoading();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v33 = v4;
    _os_log_impl(&dword_19D0DD000, v18, OS_LOG_TYPE_INFO, "Not servicing %@ because it's not a known type of bundle", buf, 0xCu);
  }
  v21 = 0;
  v8 = 0;
LABEL_26:

  if (!v21)
  {
    v22 = 0;
    goto LABEL_29;
  }
LABEL_27:
  v8 = v8;
  v22 = v8;
LABEL_29:

  return v22;
}

+ (void)_accessibilityLoadSubbundles:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[6];

  v4 = a3;
  AXLogLoading();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[UIAccessibilityLegacyLoader _accessibilityLoadSubbundles:].cold.1(v4, v5);

  objc_msgSend(a1, "_accessibilityBundlesForBundle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__UIAccessibilityLegacyLoader__accessibilityLoadSubbundles___block_invoke;
  v10[3] = &__block_descriptor_48_e25_v32__0__NSBundle_8Q16_B24l;
  v10[4] = a1;
  v10[5] = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
  v9 = v4;
  v8 = v4;
  AXPerformBlockAsynchronouslyOnMainThread();

}

void __60__UIAccessibilityLegacyLoader__accessibilityLoadSubbundles___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__UIAccessibilityLegacyLoader__accessibilityLoadSubbundles___block_invoke_2;
  v10[3] = &unk_1E3DFF958;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v11 = v5;
  v12 = v6;
  v13 = a3;
  v14 = v7;
  v8 = v5;
  v9 = _Block_copy(v10);
  AXPerformBlockAsynchronouslyOnMainThread();

}

uint64_t __60__UIAccessibilityLegacyLoader__accessibilityLoadSubbundles___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  AXLogLoading();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __60__UIAccessibilityLegacyLoader__accessibilityLoadSubbundles___block_invoke_2_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  return objc_msgSend(*(id *)(a1 + 40), "loadAccessibilityBundleForBundle:didLoadCallback:forceLoad:loadSubbundles:loadAllAccessibilityInfo:", *(_QWORD *)(a1 + 32), 0, 0, 1, *(_QWORD *)(a1 + 48) == *(_QWORD *)(a1 + 56) - 1);
}

void __60__UIAccessibilityLegacyLoader__accessibilityLoadSubbundles___block_invoke_239(uint64_t a1)
{
  _QWORD block[4];
  id v3;

  objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityInitialize");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__UIAccessibilityLegacyLoader__accessibilityLoadSubbundles___block_invoke_2_240;
  block[3] = &unk_1E3DFE9F8;
  v3 = *(id *)(a1 + 32);
  if (_LoadedBundles_block_invoke_onceToken != -1)
    dispatch_once(&_LoadedBundles_block_invoke_onceToken, block);

}

void __60__UIAccessibilityLegacyLoader__accessibilityLoadSubbundles___block_invoke_2_240(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  AXLogLoading();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    LOWORD(v5) = 0;
    _os_signpost_emit_with_name_impl(&dword_19D0DD000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AXLaunchTime", (const char *)&unk_19D149A3A, (uint8_t *)&v5, 2u);
  }

  AXLogLoading();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19D0DD000, v3, OS_LOG_TYPE_INFO, "Loaded Accessibility for %{public}@", (uint8_t *)&v5, 0xCu);

  }
}

+ (int64_t)_accessibilityLoadingPriorityForBundle:(id)a3
{
  id v3;
  int64_t v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "_accessibilityIntegerValueForKey:", CFSTR("axBundlePriority"));
  if (!v4)
  {
    v4 = AXBundleLoadingPriorityDefault;
    objc_msgSend(v3, "safeStringForKey:", CFSTR("_resolvedPath"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hasSuffix:", CFSTR("UIKit.framework")))
    {
      v4 = AXBundleLoadingPriorityUIKit;
    }
    else if (objc_msgSend(v5, "hasSuffix:", CFSTR("TVMLKit.framework")))
    {
      v4 = AXBundleLoadingPriorityTVMLKit;
    }
    else if (objc_msgSend(v5, "hasSuffix:", CFSTR("ControlCenterUI.framework")))
    {
      v4 = AXBundleLoadingPriorityControlCenterUI;
    }
    else if (objc_msgSend(v5, "hasSuffix:", CFSTR("ControlCenterUIKit.framework")))
    {
      v4 = AXBundleLoadingPriorityControlCenterUIKit;
    }
    else if (objc_msgSend(v5, "hasSuffix:", CFSTR("MessageUI.framework")))
    {
      v4 = AXBundleLoadingPriorityMessageUI;
    }
    else if (objc_msgSend(v5, "hasSuffix:", CFSTR("framework")))
    {
      v4 = AXBundleLoadingPriorityFramework;
    }
    else if (objc_msgSend(v5, "hasSuffix:", CFSTR("bundle")))
    {
      v4 = AXBundleLoadingPriorityBundle;
    }
    objc_msgSend(v3, "_accessibilitySetIntegerValue:forKey:", v4, CFSTR("axBundlePriority"));

  }
  return v4;
}

+ (BOOL)_accessibilityShouldSortBundlesBeforeLoading
{
  return 1;
}

+ (void)loadAccessibilityBundleForBundle:(id)a3 didLoadCallback:(id)a4 forceLoad:(BOOL)a5 loadSubbundles:(BOOL)a6 loadAllAccessibilityInfo:(BOOL)a7
{
  _BOOL8 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, void *, uint64_t);
  void *v30;
  id v31;
  BOOL v32;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "accessibilityBundlePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_BundleLock, "lock");
    v15 = (void *)_DeniedBundles;
    objc_msgSend(v14, "lastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = objc_msgSend(v15, "containsObject:", v16);

    objc_msgSend((id)_BundleLock, "unlock");
    if ((_DWORD)v15)
    {
      AXLogLoading();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        +[UIAccessibilityLegacyLoader loadAccessibilityBundleForBundle:didLoadCallback:forceLoad:loadSubbundles:loadAllAccessibilityInfo:].cold.1();
    }
    else if ((AXProcessIsSystemApplication() & 1) != 0
           || (objc_msgSend(v14, "lastPathComponent"),
               v18 = (void *)objc_claimAutoreleasedReturnValue(),
               v19 = objc_msgSend(v18, "hasPrefix:", CFSTR("Assistant")),
               v18,
               !v19))
    {
      objc_msgSend(v14, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "hasSuffix:", CFSTR("axbundle"));

      if (!v21)
      {
        objc_msgSend((id)_BundleLock, "lock");
        v22 = objc_msgSend((id)_LoadedBundles, "containsObject:", v14);
        objc_msgSend((id)_BundleLock, "unlock");
        if (!v22 || v9)
        {
          AXLogLoading();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            +[UIAccessibilityLegacyLoader loadAccessibilityBundleForBundle:didLoadCallback:forceLoad:loadSubbundles:loadAllAccessibilityInfo:].cold.4();

          objc_msgSend(v12, "_cfBundle");
          if ((objc_msgSend(v12, "isLoaded") & 1) != 0 || v9)
          {
            objc_msgSend((id)_BundleLock, "lock");
            objc_msgSend((id)_LoadedBundles, "addObject:", v14);
            objc_msgSend((id)_BundleLock, "unlock");
            objc_msgSend(a1, "_axBundleForBundle:", v12);
            v25 = objc_claimAutoreleasedReturnValue();
            v24 = v25;
            if (v13 && !v25)
              (*((void (**)(id, _QWORD, _QWORD, _QWORD))v13 + 2))(v13, 0, 0, 0);
            v27 = MEMORY[0x1E0C809B0];
            v28 = 3221225472;
            v29 = __130__UIAccessibilityLegacyLoader_loadAccessibilityBundleForBundle_didLoadCallback_forceLoad_loadSubbundles_loadAllAccessibilityInfo___block_invoke;
            v30 = &unk_1E3DFF9A0;
            v31 = v13;
            v32 = a7;
            v26 = _Block_copy(&v27);
            objc_msgSend(a1, "loadAccessibilityBundle:didLoadCallback:loadSubbundles:", v24, v26, v8, v27, v28, v29, v30);

          }
          else
          {
            AXLogLoading();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              +[UIAccessibilityLegacyLoader loadAccessibilityBundleForBundle:didLoadCallback:forceLoad:loadSubbundles:loadAllAccessibilityInfo:].cold.3();
          }

          goto LABEL_15;
        }
LABEL_13:
        if (v13)
          (*((void (**)(id, _QWORD, _QWORD, _QWORD))v13 + 2))(v13, 0, 0, 0);
LABEL_15:

        goto LABEL_16;
      }
      AXLogLoading();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        +[UIAccessibilityLegacyLoader loadAccessibilityBundleForBundle:didLoadCallback:forceLoad:loadSubbundles:loadAllAccessibilityInfo:].cold.2();
    }
    else
    {
      AXLogLoading();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        +[UIAccessibilityLegacyLoader loadAccessibilityBundleForBundle:didLoadCallback:forceLoad:loadSubbundles:loadAllAccessibilityInfo:].cold.5();
    }

    goto LABEL_13;
  }
LABEL_16:

}

void __130__UIAccessibilityLegacyLoader_loadAccessibilityBundleForBundle_didLoadCallback_forceLoad_loadSubbundles_loadAllAccessibilityInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;

  v7 = a3;
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v8 + 16))(v8, a2, v7, a4);
  AXLogLoading();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __130__UIAccessibilityLegacyLoader_loadAccessibilityBundleForBundle_didLoadCallback_forceLoad_loadSubbundles_loadAllAccessibilityInfo___block_invoke_cold_1();

  if (*(_BYTE *)(a1 + 40))
  {
    +[UIAccessibilityInformationLoader sharedInstance](UIAccessibilityInformationLoader, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNeedsLoadAccessibilityInformation");

  }
}

+ (void)loadAccessibilityBundle:(id)a3 didLoadCallback:(id)a4 loadSubbundles:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  id v9;
  char v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if (!v7)
    goto LABEL_16;
  if ((objc_msgSend(v7, "isLoaded") & 1) == 0)
  {
    v18 = 0;
    v10 = objc_msgSend(v7, "loadAndReturnError:", &v18);
    v11 = v18;
    if ((v10 & 1) != 0)
    {
      v12 = objc_msgSend(v7, "principalClass");
      AXLogLoading();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        +[UIAccessibilityLegacyLoader loadAccessibilityBundle:didLoadCallback:loadSubbundles:].cold.1((uint64_t)v7, v12, v13);

      if (!v12)
        goto LABEL_15;
      v17 = v8;
      v16 = v7;
      AXPerformBlockOnMainThread();

      v14 = v17;
    }
    else
    {
      AXLogLoading();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[UIAccessibilityLegacyLoader loadAccessibilityBundle:didLoadCallback:loadSubbundles:].cold.2(v7, (uint64_t)v11, v14);
    }

LABEL_15:
    goto LABEL_16;
  }
  if (v5)
  {
    +[UIAccessibilityLoader _accessibilityBundlesForBundle:](UIAccessibilityLoader, "_accessibilityBundlesForBundle:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15;
    AXPerformBlockOnMainThread();

  }
  if (v8)
    (*((void (**)(id, uint64_t, id, uint64_t))v8 + 2))(v8, 1, v7, 1);
LABEL_16:

}

uint64_t __86__UIAccessibilityLegacyLoader_loadAccessibilityBundle_didLoadCallback_loadSubbundles___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 48), "accessibilityInitializeBundle");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(result + 16))(result, 1, *(_QWORD *)(a1 + 32), 0);
  return result;
}

void __86__UIAccessibilityLegacyLoader_loadAccessibilityBundle_didLoadCallback_loadSubbundles___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        +[UIAccessibilityLoader loadAccessibilityBundleForBundle:didLoadCallback:](UIAccessibilityLoader, "loadAccessibilityBundleForBundle:didLoadCallback:", *(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5++), 0, (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

+ (id)_accessibilityBundlesForBundle:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v13[16];
  uint8_t buf[16];

  v3 = a3;
  objc_msgSend(v3, "principalClass");
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend((id)objc_msgSend(v3, "principalClass"), "accessibilityBundles"),
        (v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "allFrameworks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "allBundles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count") + objc_msgSend(v5, "count"));
    objc_msgSend(v7, "axSafelyAddObjectsFromArray:", v6);
    objc_msgSend(v7, "axSafelyAddObjectsFromArray:", v5);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v8);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v9);

    v4 = v7;
    if (+[UIAccessibilityLegacyLoader _accessibilityShouldSortBundlesBeforeLoading](UIAccessibilityLegacyLoader, "_accessibilityShouldSortBundlesBeforeLoading"))
    {
      AXLogLoading();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19D0DD000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "BundleSort", (const char *)&unk_19D149A3A, buf, 2u);
      }

      objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_263);
      AXLogLoading();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)v13 = 0;
        _os_signpost_emit_with_name_impl(&dword_19D0DD000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "BundleSort", (const char *)&unk_19D149A3A, v13, 2u);
      }

    }
  }

  return v4;
}

uint64_t __62__UIAccessibilityLegacyLoader__accessibilityBundlesForBundle___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  int64_t v5;
  int64_t v6;

  v4 = a3;
  v5 = +[UIAccessibilityLegacyLoader _accessibilityLoadingPriorityForBundle:](UIAccessibilityLegacyLoader, "_accessibilityLoadingPriorityForBundle:", a2);
  v6 = +[UIAccessibilityLegacyLoader _accessibilityLoadingPriorityForBundle:](UIAccessibilityLegacyLoader, "_accessibilityLoadingPriorityForBundle:", v4);

  if (v5 > v6)
    return -1;
  else
    return v5 < v6;
}

+ (void)_accessibilityLoadSubbundles:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_19D0DD000, a2, OS_LOG_TYPE_DEBUG, "Loading sub-bundles from %{public}@", v4, 0xCu);

}

void __60__UIAccessibilityLegacyLoader__accessibilityLoadSubbundles___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_19D0DD000, a2, a3, "  Loading sub-bundle %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)loadAccessibilityBundleForBundle:didLoadCallback:forceLoad:loadSubbundles:loadAllAccessibilityInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_19D0DD000, v0, v1, "Bundle in deny list: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)loadAccessibilityBundleForBundle:didLoadCallback:forceLoad:loadSubbundles:loadAllAccessibilityInfo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_19D0DD000, v0, v1, "Bundle is an axbundle, don't load again: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)loadAccessibilityBundleForBundle:didLoadCallback:forceLoad:loadSubbundles:loadAllAccessibilityInfo:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_19D0DD000, v0, v1, "Bundle not loaded? %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)loadAccessibilityBundleForBundle:didLoadCallback:forceLoad:loadSubbundles:loadAllAccessibilityInfo:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_19D0DD000, v0, v1, "Attempting to load: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)loadAccessibilityBundleForBundle:didLoadCallback:forceLoad:loadSubbundles:loadAllAccessibilityInfo:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_19D0DD000, v0, v1, "Bundle is assistant not inside system app: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __130__UIAccessibilityLegacyLoader_loadAccessibilityBundleForBundle_didLoadCallback_forceLoad_loadSubbundles_loadAllAccessibilityInfo___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_19D0DD000, v0, v1, "Finished loading axbundle: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)loadAccessibilityBundle:(uint64_t)a1 didLoadCallback:(uint64_t)a2 loadSubbundles:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  OUTLINED_FUNCTION_9(&dword_19D0DD000, a3, (uint64_t)a3, "AX Bundle principal class: %{public}@ %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

+ (void)loadAccessibilityBundle:(void *)a1 didLoadCallback:(uint64_t)a2 loadSubbundles:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  _os_log_error_impl(&dword_19D0DD000, a3, OS_LOG_TYPE_ERROR, "Unable to load AX Bundle: %{public}@ [%{public}@]", v5, 0x16u);

  OUTLINED_FUNCTION_1_1();
}

@end
