@implementation UAFCommonUtilities

+ (id)bundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)bundle_sUAFBundle;
  if (!bundle_sUAFBundle)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)bundle_sUAFBundle;
    bundle_sUAFBundle = v3;

    v2 = (void *)bundle_sUAFBundle;
  }
  return v2;
}

+ (BOOL)isInternalInstall
{
  if (qword_2540B1C88 != -1)
    dispatch_once(&qword_2540B1C88, &__block_literal_global_6);
  return _MergedGlobals_4;
}

uint64_t __39__UAFCommonUtilities_isInternalInstall__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_content();
  _MergedGlobals_4 = result;
  return result;
}

+ (BOOL)isDictationEnabled
{
  void *v2;
  char v3;

  objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dictationIsEnabled");

  return v3;
}

+ (BOOL)isAssistantEnabled
{
  void *v2;
  char v3;

  objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "assistantIsEnabled");

  return v3;
}

+ (id)currentAssistantLanguage
{
  id *v2;
  void *v3;
  const __CFString *v4;
  id *v5;
  void *v6;
  _Unwind_Exception *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v2 = (id *)qword_2540B1C90;
  v12 = qword_2540B1C90;
  if (!qword_2540B1C90)
  {
    v3 = (void *)AssistantServicesLibrary_1();
    v2 = (id *)dlsym(v3, "kAFSessionLanguage");
    v10[3] = (uint64_t)v2;
    qword_2540B1C90 = (uint64_t)v2;
  }
  _Block_object_dispose(&v9, 8);
  if (!v2)
    goto LABEL_8;
  v4 = (const __CFString *)objc_retainAutorelease(*v2);
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v5 = (id *)qword_2540B1C98;
  v12 = qword_2540B1C98;
  if (!qword_2540B1C98)
  {
    v6 = (void *)AssistantServicesLibrary_1();
    v5 = (id *)dlsym(v6, "kAssistantBackedUpDomain");
    v10[3] = (uint64_t)v5;
    qword_2540B1C98 = (uint64_t)v5;
  }
  _Block_object_dispose(&v9, 8);
  if (!v5)
  {
LABEL_8:
    dlerror();
    v8 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v8);
  }
  return (id)(id)CFPreferencesCopyAppValue(v4, (CFStringRef)objc_retainAutorelease(*v5));
}

+ (BOOL)deviceSupportAssistantEngine
{
  void *v2;
  void *v3;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = getAFDeviceSupportsSAESymbolLoc_ptr;
  v9 = getAFDeviceSupportsSAESymbolLoc_ptr;
  if (!getAFDeviceSupportsSAESymbolLoc_ptr)
  {
    v3 = (void *)AssistantServicesLibrary_1();
    v2 = dlsym(v3, "AFDeviceSupportsSAE");
    v7[3] = (uint64_t)v2;
    getAFDeviceSupportsSAESymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    dlerror();
    v5 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return ((uint64_t (*)(void))v2)();
}

+ (BOOL)deviceSupportFullUOD
{
  void *v2;
  void *v3;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = getAFDeviceSupportsSiriUODSymbolLoc_ptr;
  v9 = getAFDeviceSupportsSiriUODSymbolLoc_ptr;
  if (!getAFDeviceSupportsSiriUODSymbolLoc_ptr)
  {
    v3 = (void *)AssistantServicesLibrary_1();
    v2 = dlsym(v3, "AFDeviceSupportsSiriUOD");
    v7[3] = (uint64_t)v2;
    getAFDeviceSupportsSiriUODSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    dlerror();
    v5 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return ((uint64_t (*)(void))v2)();
}

+ (BOOL)deviceSupportAndUseHybridASR
{
  void *v2;
  void *v3;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = getAFShouldRunAsrOnServerForUODSymbolLoc_ptr;
  v9 = getAFShouldRunAsrOnServerForUODSymbolLoc_ptr;
  if (!getAFShouldRunAsrOnServerForUODSymbolLoc_ptr)
  {
    v3 = (void *)AssistantServicesLibrary_1();
    v2 = dlsym(v3, "AFShouldRunAsrOnServerForUOD");
    v7[3] = (uint64_t)v2;
    getAFShouldRunAsrOnServerForUODSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    dlerror();
    v5 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return ((uint64_t (*)(void))v2)();
}

+ (BOOL)isFullUODSupportedForStatus:(id)a3 language:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  _Unwind_Exception *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v6;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v9 = getAFUODStatusSupportedFullSymbolLoc_ptr;
  v17 = getAFUODStatusSupportedFullSymbolLoc_ptr;
  if (!getAFUODStatusSupportedFullSymbolLoc_ptr)
  {
    v10 = (void *)AssistantServicesLibrary_1();
    v9 = dlsym(v10, "AFUODStatusSupportedFull");
    v15[3] = (uint64_t)v9;
    getAFUODStatusSupportedFullSymbolLoc_ptr = v9;
  }
  _Block_object_dispose(&v14, 8);
  if (!v9)
  {
    dlerror();
    v13 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v14, 8);
    _Unwind_Resume(v13);
  }
  v11 = ((uint64_t (*)(id, id))v9)(v7, v8);

  return v11;
}

+ (BOOL)isHybridUODSupportedForStatus:(id)a3 language:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  _Unwind_Exception *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v6;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v9 = getAFUODStatusSupportedHybridSymbolLoc_ptr;
  v17 = getAFUODStatusSupportedHybridSymbolLoc_ptr;
  if (!getAFUODStatusSupportedHybridSymbolLoc_ptr)
  {
    v10 = (void *)AssistantServicesLibrary_1();
    v9 = dlsym(v10, "AFUODStatusSupportedHybrid");
    v15[3] = (uint64_t)v9;
    getAFUODStatusSupportedHybridSymbolLoc_ptr = v9;
  }
  _Block_object_dispose(&v14, 8);
  if (!v9)
  {
    dlerror();
    v13 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v14, 8);
    _Unwind_Resume(v13);
  }
  v11 = ((uint64_t (*)(id, id))v9)(v7, v8);

  return v11;
}

+ (BOOL)isTop13Locale:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  _Unwind_Exception *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v4 = getAFIsTop13LocaleSymbolLoc_ptr;
  v12 = getAFIsTop13LocaleSymbolLoc_ptr;
  if (!getAFIsTop13LocaleSymbolLoc_ptr)
  {
    v5 = (void *)AssistantServicesLibrary_1();
    v4 = dlsym(v5, "AFIsTop13Locale");
    v10[3] = (uint64_t)v4;
    getAFIsTop13LocaleSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v9, 8);
  if (!v4)
  {
    dlerror();
    v8 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v8);
  }
  v6 = ((uint64_t (*)(id))v4)(v3);

  return v6;
}

+ (BOOL)isUODAttentionRequired:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  _Unwind_Exception *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v4 = getAFUODAttentionRequiredSymbolLoc_ptr;
  v12 = getAFUODAttentionRequiredSymbolLoc_ptr;
  if (!getAFUODAttentionRequiredSymbolLoc_ptr)
  {
    v5 = (void *)AssistantServicesLibrary_1();
    v4 = dlsym(v5, "AFUODAttentionRequired");
    v10[3] = (uint64_t)v4;
    getAFUODAttentionRequiredSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v9, 8);
  if (!v4)
  {
    dlerror();
    v8 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v8);
  }
  v6 = ((uint64_t (*)(id))v4)(v3);

  return v6;
}

+ (BOOL)gmsWantsAssets
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)qword_2540B1CA0;
  v9 = qword_2540B1CA0;
  if (!qword_2540B1CA0)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getGMAvailabilityWrapperClass_block_invoke;
    v5[3] = &unk_24F1F7190;
    v5[4] = &v6;
    __getGMAvailabilityWrapperClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  return objc_msgSend(v3, "isOkayToHaveAsset");
}

+ (void)resetAutoAsset:(id)a3 userInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  _QWORD block[4];
  id v15;
  id v16;
  NSObject *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "autoAssetType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      objc_msgSend(v5, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v19 = "+[UAFCommonUtilities resetAutoAsset:userInfo:]";
      v20 = 2114;
      v21 = v10;
      _os_log_impl(&dword_229282000, v8, OS_LOG_TYPE_DEFAULT, "%s Removing autoassetset %{public}@", buf, 0x16u);

    }
    v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    +[UAFAutoAssetManager getSerialQueue](UAFAutoAssetManager, "getSerialQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__UAFCommonUtilities_resetAutoAsset_userInfo___block_invoke;
    block[3] = &unk_24F1F7BA0;
    v15 = v5;
    v16 = v6;
    v17 = v11;
    v8 = v11;
    dispatch_sync(v12, block);

    dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  }
  else if (v9)
  {
    objc_msgSend(v5, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v19 = "+[UAFCommonUtilities resetAutoAsset:userInfo:]";
    v20 = 2114;
    v21 = v13;
    _os_log_impl(&dword_229282000, v8, OS_LOG_TYPE_DEFAULT, "%s No auto asset type defined for %{public}@", buf, 0x16u);

  }
}

void __46__UAFCommonUtilities_resetAutoAsset_userInfo___block_invoke(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  objc_msgSend(a1[4], "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__UAFCommonUtilities_resetAutoAsset_userInfo___block_invoke_2;
  v3[3] = &unk_24F1F7B78;
  v4 = a1[5];
  v5 = a1[4];
  v6 = a1[6];
  +[UAFAutoAssetManager removeAutoAssetSet:completion:](UAFAutoAssetManager, "removeAutoAssetSet:completion:", v2, v3);

}

void __46__UAFCommonUtilities_resetAutoAsset_userInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "code") != 6551)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 136315394;
      v17 = "+[UAFCommonUtilities resetAutoAsset:userInfo:]_block_invoke_2";
      v18 = 2114;
      v19 = v8;
      _os_log_impl(&dword_229282000, v7, OS_LOG_TYPE_DEFAULT, "%s Attempting force removing asset set %{public}@", (uint8_t *)&v16, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UAFAutoAssetManager forceRemoveAutoAssetSet:](UAFAutoAssetManager, "forceRemoveAutoAssetSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 136315650;
        v17 = "+[UAFCommonUtilities resetAutoAsset:userInfo:]_block_invoke";
        v18 = 2114;
        v19 = v12;
        v20 = 2112;
        v21 = v10;
        _os_log_impl(&dword_229282000, v11, OS_LOG_TYPE_DEFAULT, "%s Force remove of %{public}@ failed: %@", (uint8_t *)&v16, 0x20u);

      }
      v13 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("force-"), "stringByAppendingString:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, v15);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

+ (id)resetAutoAsset:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "resetAutoAsset:userInfo:", v4, v5);

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)resetAutoAssets:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend((id)objc_opt_class(), "resetAutoAsset:userInfo:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++), v4, (_QWORD)v12);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)resetAutoAssets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_opt_class();
  +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getAllAssetSets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetAutoAssets:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)setUAFPopulation:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_getAssetTypeFromConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend((id)objc_opt_class(), "_setUAFPopulation:forAssetTypes:", v3, v4);

  return v5;
}

+ (BOOL)setUAFPopulation:(id)a3 assetSet:(id)a4
{
  __CFString *v5;
  id v6;
  UAFConfigurationManager *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  __CFString *v11;
  id v12;
  void *v13;
  BOOL v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v20;
  id v21;

  v5 = (__CFString *)a3;
  v6 = a4;
  v7 = -[UAFConfigurationManager initWithURLs:]([UAFConfigurationManager alloc], "initWithURLs:", 0);
  -[UAFConfigurationManager getAssetSet:](v7, "getAssetSet:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "autoAssetType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v14 = 0;
LABEL_25:

      goto LABEL_26;
    }
    v10 = objc_msgSend((id)objc_opt_class(), "isInternalInstall");
    if (((v5 == 0) & v10) != 0)
      v11 = CFSTR("Carry");
    else
      v11 = v5;
    if ((v10 & 1) != 0 || v5)
    {
      v20 = 0;
      v21 = 0;
      v15 = objc_msgSend((id)objc_opt_class(), "_getPopulationMapping:toAudience:toServer:", v11, &v21, &v20);
      v5 = (__CFString *)v21;
      v12 = v20;
      if (!v15)
      {
        v14 = 0;
LABEL_24:

        v5 = v11;
        goto LABEL_25;
      }
      if ((-[__CFString isEqualToString:](v11, "isEqualToString:", v5) & 1) == 0)
      {
        if (v12)
        {
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = 0;
        }
LABEL_19:
        v17 = objc_msgSend((id)objc_opt_class(), "_setPallasAudience:forType:", v5, v9);
        v18 = objc_msgSend((id)objc_opt_class(), "_setPallasURL:forType:", v13, v9);
        if (v17)
          v16 = v17;
        else
          v16 = v18;

        goto LABEL_23;
      }
    }
    else
    {
      v12 = 0;
      v11 = 0;
      v13 = 0;
      if (!objc_msgSend(0, "isEqualToString:", 0))
        goto LABEL_19;
    }
    v16 = objc_msgSend((id)objc_opt_class(), "_setPallasAudience:forType:", v11, v9);
LABEL_23:
    v14 = v16 == 0;
    goto LABEL_24;
  }
  v14 = 0;
LABEL_26:

  return v14;
}

+ (BOOL)setUAFPallasURL:(id)a3 assetSet:(id)a4
{
  id v5;
  id v6;
  UAFConfigurationManager *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v5 = a3;
  v6 = a4;
  v7 = -[UAFConfigurationManager initWithURLs:]([UAFConfigurationManager alloc], "initWithURLs:", 0);
  -[UAFConfigurationManager getAssetSet:](v7, "getAssetSet:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "autoAssetType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (v5)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      v11 = objc_msgSend((id)objc_opt_class(), "_setPallasURL:forType:", v10, v9) == 0;

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)getAutoAssetType:(id)a3
{
  id v3;
  UAFConfigurationManager *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v4 = -[UAFConfigurationManager initWithURLs:]([UAFConfigurationManager alloc], "initWithURLs:", 0);
  -[UAFConfigurationManager getAssetSet:](v4, "getAssetSet:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "autoAssetType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)getUAFPopulationForAssetSet:(id)a3
{
  void *v3;
  __CFString *v4;

  +[UAFCommonUtilities getAutoAssetType:](UAFCommonUtilities, "getAutoAssetType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "getUAFPopulationForAssetType:", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_24F1F9848;
  }

  return v4;
}

+ (id)getUAFPopulationForAssetType:(id)a3
{
  void *v3;
  void *v4;
  __CFString *v5;

  +[UAFCommonUtilities _getPallasAudienceForType:](UAFCommonUtilities, "_getPallasAudienceForType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = &stru_24F1F9848;

  return v5;
}

+ (id)getUAFPallasURLForAssetSet:(id)a3
{
  void *v3;
  __CFString *v4;

  +[UAFCommonUtilities getAutoAssetType:](UAFCommonUtilities, "getAutoAssetType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "getUAFPallasURLForAssetType:", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_24F1F9848;
  }

  return v4;
}

+ (id)getUAFPallasURLForAssetType:(id)a3
{
  void *v3;
  void *v4;
  __CFString *v5;

  +[UAFCommonUtilities _getPallasURLForType:](UAFCommonUtilities, "_getPallasURLForType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "description");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_24F1F9848;
  }

  return v5;
}

+ (id)_getAssetTypeFromConfig
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getAllAssetSets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "autoAssetType", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          if (!v7)
            v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v10, "autoAssetType");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)getDefaultStoragePath
{
  uint64_t v2;
  void *v3;
  passwd *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v9;
  int *v10;
  char *v11;
  uint64_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  +[UAFCommonUtilities getUID:andEUID:](UAFCommonUtilities, "getUID:andEUID:", &v12, (char *)&v12 + 4);
  *__error() = 0;
  if (HIDWORD(v12))
    v2 = HIDWORD(v12);
  else
    v2 = v12;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[UAFCommonUtilities getPWUID:](UAFCommonUtilities, "getPWUID:", v3);

  if (v4 && v4->pw_dir)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "+[UAFCommonUtilities getDefaultStoragePath]";
        _os_log_error_impl(&dword_229282000, v6, OS_LOG_TYPE_ERROR, "%s Failed to resolve home dir path.", buf, 0xCu);
      }

    }
    -[NSObject stringByAppendingString:](v5, "stringByAppendingString:", CFSTR("/Library/UnifiedAssetFramework"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = *__error();
      v10 = __error();
      v11 = strerror(*v10);
      *(_DWORD *)buf = 136315650;
      v14 = "+[UAFCommonUtilities getDefaultStoragePath]";
      v15 = 1024;
      v16 = v9;
      v17 = 2082;
      v18 = v11;
      _os_log_error_impl(&dword_229282000, v5, OS_LOG_TYPE_ERROR, "%s Could not retrieve pwent: %d %{public}s", buf, 0x1Cu);
    }
    v7 = 0;
  }

  return v7;
}

+ (id)_getInternalBaseConfigDir
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "rootDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("/AppleInternal/Library/UnifiedAssetFramework"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_getInternalConfigFilePath
{
  return CFSTR("/Pallas/pallas_internal.plist");
}

+ (BOOL)_getPopulationMapping:(id)a3 toAudience:(id *)a4 toServer:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_getInternalBaseConfigDir");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_getInternalConfigFilePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:error:", v11, &v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v25;
  v14 = v13;
  if (!v12 || v13)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "absoluteURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v27 = "+[UAFCommonUtilities _getPopulationMapping:toAudience:toServer:]";
      v28 = 2112;
      v29 = v24;
      v30 = 2112;
      v31 = v14;
      _os_log_error_impl(&dword_229282000, v18, OS_LOG_TYPE_ERROR, "%s Failed to load %@ %@", buf, 0x20u);

    }
    goto LABEL_13;
  }
  if (a5)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("URL"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*a5, "isEqualToString:", CFSTR("nil")))
      *a5 = 0;
  }
  if (!a4)
    goto LABEL_10;
  objc_msgSend(v12, "objectForKeyedSubscript:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Audience"));
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*a4, "isEqualToString:", CFSTR("prod")) & 1) != 0
    || objc_msgSend(*a4, "isEqualToString:", CFSTR("seed")))
  {
    *a4 = CFSTR("0c88076f-c292-4dad-95e7-304db9d29d34");
LABEL_10:
    v17 = 1;
    goto LABEL_14;
  }
  if (objc_msgSend(*a4, "isEqualToString:", CFSTR("nil")))
  {
    v20 = 0;
    *a4 = 0;
  }
  else
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v7);
    v20 = v21 == 0;
    if (v21)
      *a4 = objc_retainAutorelease(v7);

    if (*a4)
      goto LABEL_10;
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 1;
  if (v20 && !v22)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "+[UAFCommonUtilities _getPopulationMapping:toAudience:toServer:]";
      v28 = 2114;
      v29 = v7;
      _os_log_error_impl(&dword_229282000, v18, OS_LOG_TYPE_ERROR, "%s %{public}@ is not a valid population", buf, 0x16u);
    }
LABEL_13:

    v17 = 0;
  }
LABEL_14:

  return v17;
}

+ (BOOL)_setUAFPopulation:(id)a3 forAssetTypes:(id)a4
{
  id v5;
  id v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v28;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_msgSend((id)objc_opt_class(), "isInternalInstall");
    v8 = 0;
    v9 = 0;
    v10 = 0;
    if (v5 && v7)
    {
      v35 = 0;
      v36 = 0;
      v11 = objc_msgSend((id)objc_opt_class(), "_getPopulationMapping:toAudience:toServer:", v5, &v36, &v35);
      v9 = v36;
      v12 = v35;
      v10 = v12;
      if (!v11)
      {
        v13 = 0;
LABEL_30:

        goto LABEL_31;
      }
      if (v12)
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v12);
      else
        v8 = 0;
    }
    v28 = v6;
    v29 = v5;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v6;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v19 = objc_msgSend((id)objc_opt_class(), "_setPallasURL:forType:", v8, v18);
          UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v19)
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              MEMORY[0x22E2C68F8](v19);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315906;
              v38 = "+[UAFCommonUtilities _setUAFPopulation:forAssetTypes:]";
              v39 = 2114;
              v40 = v8;
              v41 = 2114;
              v42 = v18;
              v43 = 2114;
              v44 = v22;
              _os_log_error_impl(&dword_229282000, v21, OS_LOG_TYPE_ERROR, "%s Failed to set Pallas URL to %{public}@ for %{public}@: %{public}@", buf, 0x2Au);

            }
          }
          else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v38 = "+[UAFCommonUtilities _setUAFPopulation:forAssetTypes:]";
            v39 = 2114;
            v40 = v29;
            v41 = 2114;
            v42 = v8;
            v43 = 2114;
            v44 = v18;
            _os_log_impl(&dword_229282000, v21, OS_LOG_TYPE_DEFAULT, "%s Setting MobileAsset to UAF population %{public}@ Pallas URL %{public}@ for asset type %{public}@", buf, 0x2Au);
          }

          v23 = objc_msgSend((id)objc_opt_class(), "_setPallasAudience:forType:", v9, v18);
          UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v23)
          {
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              MEMORY[0x22E2C68F8](v23);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315906;
              v38 = "+[UAFCommonUtilities _setUAFPopulation:forAssetTypes:]";
              v39 = 2114;
              v40 = v9;
              v41 = 2114;
              v42 = v18;
              v43 = 2114;
              v44 = v26;
              _os_log_error_impl(&dword_229282000, v25, OS_LOG_TYPE_ERROR, "%s Failed to set Pallas audience to %{public}@ for %{public}@: %{public}@", buf, 0x2Au);

            }
          }
          else if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v38 = "+[UAFCommonUtilities _setUAFPopulation:forAssetTypes:]";
            v39 = 2114;
            v40 = v29;
            v41 = 2114;
            v42 = v9;
            v43 = 2114;
            v44 = v18;
            _os_log_impl(&dword_229282000, v25, OS_LOG_TYPE_DEFAULT, "%s Setting MobileAsset to UAF population %{public}@ Pallas Audience %{public}@ for asset type %{public}@", buf, 0x2Au);
          }

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
      }
      while (v15);
    }

    v13 = 1;
    v6 = v28;
    v5 = v29;
    goto LABEL_30;
  }
  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v38 = "+[UAFCommonUtilities _setUAFPopulation:forAssetTypes:]";
    _os_log_impl(&dword_229282000, v10, OS_LOG_TYPE_DEFAULT, "%s Skipping setUAFPopulation due to nil AssetTypes", buf, 0xCu);
  }
  v13 = 1;
LABEL_31:

  return v13;
}

+ (id)_getPallasURLForType:(id)a3
{
  JUMPOUT(0x22E2C68D4);
}

+ (id)_getPallasAudienceForType:(id)a3
{
  JUMPOUT(0x22E2C68C8);
}

+ (int64_t)_setPallasURL:(id)a3 forType:(id)a4
{
  JUMPOUT(0x22E2C68ECLL);
}

+ (int64_t)_setPallasAudience:(id)a3 forType:(id)a4
{
  JUMPOUT(0x22E2C68E0);
}

+ (id)rootDirectory
{
  return &stru_24F1F9848;
}

+ (id)simulatorResourcesDirectory
{
  return 0;
}

+ (id)valueForEntitlement:(id)a3
{
  __CFString *v3;
  __SecTask *v4;
  __SecTask *v5;
  void *v6;
  CFErrorRef v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  CFErrorRef error;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (__CFString *)a3;
  v4 = SecTaskCreateFromSelf(0);
  if (v4)
  {
    v5 = v4;
    error = 0;
    v6 = (void *)SecTaskCopyValueForEntitlement(v4, v3, &error);
    CFRelease(v5);
    if (!v6)
    {
      v7 = error;
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v7)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v14 = "+[UAFCommonUtilities valueForEntitlement:]";
          _os_log_error_impl(&dword_229282000, v9, OS_LOG_TYPE_ERROR, "%s SecTaskCopyValueForEntitlement() failed", buf, 0xCu);
        }

        CFRelease(error);
      }
      else
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v14 = "+[UAFCommonUtilities valueForEntitlement:]";
          v15 = 2114;
          v16 = v3;
          _os_log_debug_impl(&dword_229282000, v9, OS_LOG_TYPE_DEBUG, "%s %{public}@ entitlement not present", buf, 0x16u);
        }

      }
    }
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "+[UAFCommonUtilities valueForEntitlement:]";
      _os_log_error_impl(&dword_229282000, v10, OS_LOG_TYPE_ERROR, "%s SecTaskCreateFromSelf() failed.", buf, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

+ (int)openFD:(id)a3 oflags:(int)a4 mode:(int)a5 error:(id *)a6
{
  int v7;
  int v8;

  v7 = open((const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation"), a4, a5);
  v8 = v7;
  if (a6 && v7 == -1)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

+ (int)rename:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  const std::__fs::filesystem::path *v9;
  id v10;
  const std::__fs::filesystem::path *v11;
  std::error_code *v12;
  int v13;
  int v14;

  v7 = objc_retainAutorelease(a3);
  v8 = a4;
  v9 = (const std::__fs::filesystem::path *)objc_msgSend(v7, "fileSystemRepresentation");
  v10 = objc_retainAutorelease(v8);
  v11 = (const std::__fs::filesystem::path *)objc_msgSend(v10, "fileSystemRepresentation");

  rename(v9, v11, v12);
  v14 = v13;
  if (a5 && v13 == -1)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v14;
}

+ (int)stat:(id)a3 withBuf:(stat *)a4 error:(id *)a5
{
  int v6;
  int v7;

  v6 = stat((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), a4);
  v7 = v6;
  if (a5 && v6 == -1)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

+ (void)getUID:(unsigned int *)a3 andEUID:(unsigned int *)a4
{
  if (a3)
    *a3 = getuid();
  if (a4)
    *a4 = geteuid();
}

+ (passwd)getPWUID:(id)a3
{
  return getpwuid(objc_msgSend(a3, "unsignedIntValue"));
}

+ (id)mobileGestaltQuery:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MGCopyAnswer();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)systemLanguageLocale
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "countryCode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = v7;

        v2 = v9;
      }
    }

  }
  objc_msgSend(v2, "languageCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v2, "countryCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("-%@"), v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }

  return v10;
}

+ (id)getMAPath:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("/private/var/MobileAsset/AssetsV2");
  if (a3 == 2)
    v3 = CFSTR("/private/var/MobileAsset/PreinstalledAssetsV2/InstallWithOs");
  if (a3 == 1)
    return CFSTR("/System/Library/PreinstalledAssetsV2/RequiredByOs");
  else
    return (id)v3;
}

+ (id)getFreeDiskSpaceInBytes
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  +[UAFCommonUtilities getMAPath:](UAFCommonUtilities, "getMAPath:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "+[UAFCommonUtilities getFreeDiskSpaceInBytes]";
    v16 = 2112;
    v17 = v2;
    _os_log_impl(&dword_229282000, v3, OS_LOG_TYPE_DEFAULT, "%s #settings Using path to check for free space: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v4, "attributesOfFileSystemForPath:error:", v2, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;

  if (v6)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    *(_DWORD *)buf = 136315394;
    v15 = "+[UAFCommonUtilities getFreeDiskSpaceInBytes]";
    v16 = 2112;
    v17 = v6;
    v10 = "%s #settings Error getting free disk space: %@";
    v11 = v7;
    v12 = 22;
LABEL_11:
    _os_log_error_impl(&dword_229282000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
    goto LABEL_5;
  }
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDD0D18]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    goto LABEL_7;
  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "+[UAFCommonUtilities getFreeDiskSpaceInBytes]";
    v10 = "%s #settings Error getting free size";
    v11 = v7;
    v12 = 12;
    goto LABEL_11;
  }
LABEL_5:

  v8 = 0;
LABEL_7:

  return v8;
}

+ (unint64_t)getFreeDiskSpaceNeededInBytes:(unint64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  NSObject *v8;
  unint64_t v9;
  int v11;
  const char *v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "getFreeDiskSpaceInBytes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "unsignedIntegerValue");
    v7 = 2 * a3;
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315650;
      v12 = "+[UAFCommonUtilities getFreeDiskSpaceNeededInBytes:]";
      v13 = 2048;
      v14 = v6;
      v15 = 2048;
      v16 = v7;
      _os_log_impl(&dword_229282000, v8, OS_LOG_TYPE_DEFAULT, "%s #settings Free space %llu / Download size %llu", (uint8_t *)&v11, 0x20u);
    }

    if (v7 >= v6)
      v9 = v7 - v6;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)serializeDictToJSONData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  int v15;
  const char *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v5) & 1) == 0)
  {
    if (a4)
    {
      v9 = (void *)MEMORY[0x24BDD1540];
      v19 = *MEMORY[0x24BDD0FD8];
      v20[0] = CFSTR("not a valid dictionary for JSON serialization");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), 5100, v10);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v15 = 136315138;
    v16 = "+[UAFCommonUtilities serializeDictToJSONData:error:]";
    v11 = "%s not a valid dictionary for JSON serialization";
    v12 = v7;
    v13 = 12;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v5, 11, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
LABEL_13:

      v6 = 0;
      goto LABEL_14;
    }
    if (a4)
      v8 = (const __CFString *)*a4;
    else
      v8 = CFSTR("unknown");
    v15 = 136315394;
    v16 = "+[UAFCommonUtilities serializeDictToJSONData:error:]";
    v17 = 2114;
    v18 = v8;
    v11 = "%s could not serialize dictionary to json: %{public}@";
    v12 = v7;
    v13 = 22;
LABEL_12:
    _os_log_impl(&dword_229282000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v15, v13);
    goto LABEL_13;
  }
LABEL_14:

  return v6;
}

+ (id)serializeDictToJSONStr:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  +[UAFCommonUtilities serializeDictToJSONData:error:](UAFCommonUtilities, "serializeDictToJSONData:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || a4 && *a4)
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x24BDD17C8]);
    v8 = objc_retainAutorelease(v5);
    v6 = (void *)objc_msgSend(v7, "initWithBytes:length:encoding:", objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), 4);
  }

  return v6;
}

+ (id)getISO8601Timestamp:(id)a3 withFractionalSeconds:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithAbbreviation:", CFSTR("GMT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315394;
      v13 = "+[UAFCommonUtilities getISO8601Timestamp:withFractionalSeconds:]";
      v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_229282000, v7, OS_LOG_TYPE_INFO, "%s Failed to get GMT timezone, falling back to system TZ '%{public}@'", (uint8_t *)&v12, 0x16u);

    }
  }
  if (v4)
    v9 = 3955;
  else
    v9 = 1907;
  objc_msgSend(MEMORY[0x24BDD15D0], "stringFromDate:timeZone:formatOptions:", v5, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)trialClientWithProject:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(MEMORY[0x24BEBA9A0], "projectIdFromName:", v3);
  if (!(_DWORD)v4 || (v5 = v4, (TRIProject_ProjectId_IsValidValue() & 1) == 0))
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "+[UAFCommonUtilities trialClientWithProject:]";
      v13 = 2114;
      v14 = v3;
      _os_log_error_impl(&dword_229282000, v7, OS_LOG_TYPE_ERROR, "%s Could not find TRIProject for %{public}@", (uint8_t *)&v11, 0x16u);
    }
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BEBA908], "clientWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "+[UAFCommonUtilities trialClientWithProject:]";
      v13 = 2114;
      v14 = v3;
      _os_log_error_impl(&dword_229282000, v10, OS_LOG_TYPE_ERROR, "%s Could not create trial client for project %{public}@", (uint8_t *)&v11, 0x16u);
    }

    v7 = 0;
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v7 = v6;
  v8 = v7;
LABEL_8:

  return v8;
}

+ (id)getDirectoryPath:(id)a3 trialNamespace:(id)a4 trialFactor:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  int v22;
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  v11 = 0;
  if (v8 && v9)
  {
    +[UAFTrialConversions entitledTrialNamespaceNames](UAFTrialConversions, "entitledTrialNamespaceNames");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "containsObject:", v8) & 1) == 0)
    {
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v22 = 136315650;
        v23 = "+[UAFCommonUtilities getDirectoryPath:trialNamespace:trialFactor:]";
        v24 = 2114;
        v25 = v10;
        v26 = 2114;
        v27 = v8;
        _os_log_error_impl(&dword_229282000, v14, OS_LOG_TYPE_ERROR, "%s Not including %{public}@ as its trial Namespace %{public}@ isn't entitled", (uint8_t *)&v22, 0x20u);
      }
      goto LABEL_17;
    }
    objc_msgSend(v7, "levelForFactor:withNamespaceName:", v10, v8);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 136315394;
        v23 = "+[UAFCommonUtilities getDirectoryPath:trialNamespace:trialFactor:]";
        v24 = 2112;
        v25 = v10;
        _os_log_impl(&dword_229282000, v20, OS_LOG_TYPE_DEFAULT, "%s No level for factor %@", (uint8_t *)&v22, 0x16u);
      }

      v14 = 0;
      goto LABEL_17;
    }
    v14 = v13;
    if (-[NSObject levelOneOfCase](v13, "levelOneOfCase") == 101)
    {
      -[NSObject directoryValue](v14, "directoryValue");
      v15 = objc_claimAutoreleasedReturnValue();
      if ((-[NSObject hasPath](v15, "hasPath") & 1) != 0)
      {
        -[NSObject directoryValue](v14, "directoryValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "length");

        if (v18)
        {
          -[NSObject directoryValue](v14, "directoryValue");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "path");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
          goto LABEL_19;
        }
LABEL_17:
        v11 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v22 = 136315650;
        v23 = "+[UAFCommonUtilities getDirectoryPath:trialNamespace:trialFactor:]";
        v24 = 2112;
        v25 = v10;
        v26 = 1024;
        LODWORD(v27) = -[NSObject levelOneOfCase](v14, "levelOneOfCase");
        _os_log_error_impl(&dword_229282000, v15, OS_LOG_TYPE_ERROR, "%s TRILevel is not a directory type: %@ %d", (uint8_t *)&v22, 0x1Cu);
      }
    }

    goto LABEL_17;
  }
LABEL_19:

  return v11;
}

+ (id)experimentIdentifiersTrialClient:(id)a3 trialNamespace:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  +[UAFTrialConversions entitledTrialNamespaceNames](UAFTrialConversions, "entitledTrialNamespaceNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "containsObject:", v6) & 1) != 0)
  {
    objc_msgSend(v5, "experimentIdentifiersWithNamespaceName:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "+[UAFCommonUtilities experimentIdentifiersTrialClient:trialNamespace:]";
      v13 = 2114;
      v14 = v6;
      _os_log_error_impl(&dword_229282000, v9, OS_LOG_TYPE_ERROR, "%s Not including trial Namespace %{public}@ isn't entitled", (uint8_t *)&v11, 0x16u);
    }

    v8 = 0;
  }

  return v8;
}

+ (BOOL)isInexpensiveNetworkAvailable
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x24BDE07E8], "sharedDefaultEvaluator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "status") & 0xFFFFFFFFFFFFFFFDLL) == 1)
    v4 = objc_msgSend(v3, "isExpensive") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

+ (BOOL)isGameModeEnabled
{
  uint64_t v3;
  int out_token;

  out_token = 0;
  v3 = 0;
  notify_register_check("com.apple.system.console_mode_changed", &out_token);
  notify_get_state(out_token, &v3);
  return v3 != 0;
}

+ (BOOL)isChinaDeviceRegionCode
{
  void *v2;
  char v3;

  MGCopyAnswer();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("CH"));

  return v3;
}

@end
