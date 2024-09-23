void sub_229288BDC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id UAFGetLogCategory(id *a1)
{
  if (UAFGetLogCategory_once != -1)
    dispatch_once(&UAFGetLogCategory_once, &__block_literal_global_16);
  return *a1;
}

void sub_2292898B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 112));
  _Unwind_Resume(a1);
}

uint64_t _AFLanguageDidChangeCallback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_assistantLanguageUpdate");
}

id getAFLanguageCodeDidChangeDarwinNotification()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getAFLanguageCodeDidChangeDarwinNotificationSymbolLoc_ptr;
  v7 = getAFLanguageCodeDidChangeDarwinNotificationSymbolLoc_ptr;
  if (!getAFLanguageCodeDidChangeDarwinNotificationSymbolLoc_ptr)
  {
    v1 = (void *)AssistantServicesLibrary();
    v0 = (id *)dlsym(v1, "AFLanguageCodeDidChangeDarwinNotification");
    v5[3] = (uint64_t)v0;
    getAFLanguageCodeDidChangeDarwinNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

uint64_t _AFPreferencesDidChangeCallback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_assistantPreferencesAndLanguageUpdate");
}

id getkAFPreferencesDidChangeDarwinNotification()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAFPreferencesDidChangeDarwinNotificationSymbolLoc_ptr;
  v7 = getkAFPreferencesDidChangeDarwinNotificationSymbolLoc_ptr;
  if (!getkAFPreferencesDidChangeDarwinNotificationSymbolLoc_ptr)
  {
    v1 = (void *)AssistantServicesLibrary();
    v0 = (id *)dlsym(v1, "kAFPreferencesDidChangeDarwinNotification");
    v5[3] = (uint64_t)v0;
    getkAFPreferencesDidChangeDarwinNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

uint64_t _SiriXAssetDidChangeCallback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "refreshUnderstandingOnDeviceAssetsAvailableAsync");
}

id getAFSiriXAssetDidChangeDarwinNotification()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getAFSiriXAssetDidChangeDarwinNotificationSymbolLoc_ptr;
  v7 = getAFSiriXAssetDidChangeDarwinNotificationSymbolLoc_ptr;
  if (!getAFSiriXAssetDidChangeDarwinNotificationSymbolLoc_ptr)
  {
    v1 = (void *)AssistantServicesLibrary();
    v0 = (id *)dlsym(v1, "AFSiriXAssetDidChangeDarwinNotification");
    v5[3] = (uint64_t)v0;
    getAFSiriXAssetDidChangeDarwinNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

uint64_t _UAFAssetStatusDidChangeCallback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "refreshUAFAssetStatusAsync");
}

void sub_22928A2C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  _Block_object_dispose(&location, 8);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_22928A8F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_22928AADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22928ADB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_22928B4D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22928BAB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22928BF14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22928C134(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_22928C304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22928C408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22928C798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_22928CAD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22928D140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_22928D494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22928D57C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AssistantServicesLibrary()
{
  uint64_t v0;
  void *v2;

  if (AssistantServicesLibraryCore_frameworkLibrary)
    return AssistantServicesLibraryCore_frameworkLibrary;
  AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = AssistantServicesLibraryCore_frameworkLibrary;
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getAFSettingsConnectionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;

  AssistantServicesLibrary();
  result = objc_getClass("AFSettingsConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAFSettingsConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)abort_report_np();
    return (Class)+[UAFConfiguration assetRootSupported](v3, v4);
  }
  return result;
}

void UAFRegisterXPCActivities()
{
  void *v0;
  NSObject *v1;
  _BOOL4 v2;
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  _BOOL4 v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)*MEMORY[0x24BDAC5A0];
  UAFGetLogCategory((id *)&UAFLogContextXPCActivity);
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "_RegisterPeriodicUAFSubscriptionActivity";
    _os_log_impl(&dword_229282000, v1, OS_LOG_TYPE_DEFAULT, "%s XPC: Registering the Periodic UAF Subscription XPC Activity", (uint8_t *)&v8, 0xCu);
  }

  _RegisterXPCActivity("com.apple.siri.xpc_activity.uaf-subscription-maintenance", v0, &__block_literal_global, &__block_literal_global_179);
  v2 = +[UAFCommonUtilities isInexpensiveNetworkAvailable](UAFCommonUtilities, "isInexpensiveNetworkAvailable");
  v3 = +[UAFCommonUtilities isGameModeEnabled](UAFCommonUtilities, "isGameModeEnabled");
  UAFGetLogCategory((id *)&UAFLogContextXPCActivity);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v2 || v3)
  {
    if (v5)
    {
      v8 = 136315650;
      v9 = "UAFRegisterXPCActivities";
      v10 = 1024;
      v11 = v2;
      v12 = 1024;
      v13 = v3;
      _os_log_impl(&dword_229282000, v4, OS_LOG_TYPE_DEFAULT, "%s Scheduling on-boot activity for next opportunity: Inexpensive network availability: %d, GameMode: %d", (uint8_t *)&v8, 0x18u);
    }

    UAFGetLogCategory((id *)&UAFLogContextXPCActivity);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = 136315138;
      v9 = "_RegisterOnBootUAFActivity";
      _os_log_debug_impl(&dword_229282000, v6, OS_LOG_TYPE_DEBUG, "%s XPC: Registering the On Boot UAF XPC Activity", (uint8_t *)&v8, 0xCu);
    }

    _RegisterXPCActivity("com.apple.siri.xpc_activity.uaf-on-boot", v0, &__block_literal_global_195, &__block_literal_global_196);
  }
  else
  {
    if (v5)
    {
      v8 = 136315138;
      v9 = "UAFRegisterXPCActivities";
      _os_log_impl(&dword_229282000, v4, OS_LOG_TYPE_DEFAULT, "%s Inexpensive network available and game mode disabled, skipping on-boot activity registration", (uint8_t *)&v8, 0xCu);
    }

  }
  UAFGetLogCategory((id *)&UAFLogContextXPCActivity);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315138;
    v9 = "_RegisterPostUpgradeUAFActivity";
    _os_log_debug_impl(&dword_229282000, v7, OS_LOG_TYPE_DEBUG, "%s XPC: Registering the Post-Upgrade UAF XPC Activity", (uint8_t *)&v8, 0xCu);
  }

  _RegisterXPCActivity("com.apple.siri.xpc_activity.uaf-post-upgrade", v0, &__block_literal_global_198, &__block_literal_global_199);
}

void _RegisterXPCActivity(const char *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD handler[4];
  id v13;
  id v14;
  id v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = ___RegisterXPCActivity_block_invoke;
    handler[3] = &unk_24F1F7440;
    v14 = v9;
    v15 = v8;
    v13 = v10;
    v11 = v10;
    xpc_activity_register(a1, v7, handler);

  }
  else
  {
    xpc_activity_unregister(a1);
  }

}

void sub_229290C1C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_229296268(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x3C0], 8);
  _Unwind_Resume(a1);
}

void sub_229298BA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

uint64_t AFSiriXAssetDidChangeCallback(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "updateSiriAssetAvailabilityForObserver");
  return result;
}

id getAFSiriXAssetDidChangeDarwinNotification_0()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getAFSiriXAssetDidChangeDarwinNotificationSymbolLoc_ptr_0;
  v7 = getAFSiriXAssetDidChangeDarwinNotificationSymbolLoc_ptr_0;
  if (!getAFSiriXAssetDidChangeDarwinNotificationSymbolLoc_ptr_0)
  {
    v1 = (void *)AssistantServicesLibrary_0();
    v0 = (id *)dlsym(v1, "AFSiriXAssetDidChangeDarwinNotification");
    v5[3] = (uint64_t)v0;
    getAFSiriXAssetDidChangeDarwinNotificationSymbolLoc_ptr_0 = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

void sub_22929A840(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_22929B128(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_22929B4F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_22929B60C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22929BB74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  _Block_object_dispose(&location, 8);
  _Unwind_Resume(a1);
}

void sub_22929C89C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id a35)
{
  uint64_t v35;

  objc_destroyWeak(location);
  objc_destroyWeak(&a35);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_22929CFA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t AssistantServicesLibrary_0()
{
  uint64_t v0;
  void *v2;

  if (AssistantServicesLibraryCore_frameworkLibrary_0)
    return AssistantServicesLibraryCore_frameworkLibrary_0;
  AssistantServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  v0 = AssistantServicesLibraryCore_frameworkLibrary_0;
  if (!AssistantServicesLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getAFSettingsConnectionClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;

  AssistantServicesLibrary_0();
  result = objc_getClass("AFSettingsConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAFSettingsConnectionClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)abort_report_np();
    return (Class)+[UAFAssetSetMetadata supportedFileVersions](v3, v4);
  }
  return result;
}

void sub_22929FD08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,id a44)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a44);
  _Unwind_Resume(a1);
}

const __CFString *UAFSubscriptionDownloadStatusDescription(unint64_t a1)
{
  if (a1 > 7)
    return CFSTR("unknown status");
  else
    return off_24F1F7B28[a1];
}

id getAFPreferencesClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAFPreferencesClass_softClass;
  v7 = getAFPreferencesClass_softClass;
  if (!getAFPreferencesClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAFPreferencesClass_block_invoke;
    v3[3] = &unk_24F1F7190;
    v3[4] = &v4;
    __getAFPreferencesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2292A0EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2292A1658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFPreferencesClass_block_invoke(uint64_t a1)
{
  Class result;

  AssistantServicesLibrary_1();
  result = objc_getClass("AFPreferences");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAFPreferencesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    return (Class)AssistantServicesLibrary_1();
  }
  return result;
}

uint64_t AssistantServicesLibrary_1()
{
  uint64_t v0;
  void *v2;

  if (AssistantServicesLibraryCore_frameworkLibrary_1)
    return AssistantServicesLibraryCore_frameworkLibrary_1;
  AssistantServicesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  v0 = AssistantServicesLibraryCore_frameworkLibrary_1;
  if (!AssistantServicesLibraryCore_frameworkLibrary_1)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getGMAvailabilityWrapperClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_2540B1CA8)
  {
    qword_2540B1CA8 = _sl_dlopen();
    if (!qword_2540B1CA8)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("GMAvailabilityWrapper");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  qword_2540B1CA0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2292A65D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_2292A817C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _AFLanguageDidChangeCallback_0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_assistantLanguageUpdate");
}

id getAFLanguageCodeDidChangeDarwinNotification_0()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getAFLanguageCodeDidChangeDarwinNotificationSymbolLoc_ptr_0;
  v7 = getAFLanguageCodeDidChangeDarwinNotificationSymbolLoc_ptr_0;
  if (!getAFLanguageCodeDidChangeDarwinNotificationSymbolLoc_ptr_0)
  {
    v1 = (void *)AssistantServicesLibrary_2();
    v0 = (id *)dlsym(v1, "AFLanguageCodeDidChangeDarwinNotification");
    v5[3] = (uint64_t)v0;
    getAFLanguageCodeDidChangeDarwinNotificationSymbolLoc_ptr_0 = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

uint64_t _AFPreferencesDidChangeCallback_0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_assistantPreferencesUpdate");
}

id getkAFPreferencesDidChangeDarwinNotification_0()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAFPreferencesDidChangeDarwinNotificationSymbolLoc_ptr_0;
  v7 = getkAFPreferencesDidChangeDarwinNotificationSymbolLoc_ptr_0;
  if (!getkAFPreferencesDidChangeDarwinNotificationSymbolLoc_ptr_0)
  {
    v1 = (void *)AssistantServicesLibrary_2();
    v0 = (id *)dlsym(v1, "kAFPreferencesDidChangeDarwinNotification");
    v5[3] = (uint64_t)v0;
    getkAFPreferencesDidChangeDarwinNotificationSymbolLoc_ptr_0 = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

uint64_t _LanguageChangedCallback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_systemLanguageUpdate");
}

uint64_t _GMSAvailabilityDidChangeCallback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_assistantGMSAvailabilityUpdate");
}

void sub_2292A9094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t AssistantServicesLibrary_2()
{
  uint64_t v0;
  void *v2;

  if (AssistantServicesLibraryCore_frameworkLibrary_2)
    return AssistantServicesLibraryCore_frameworkLibrary_2;
  AssistantServicesLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  v0 = AssistantServicesLibraryCore_frameworkLibrary_2;
  if (!AssistantServicesLibraryCore_frameworkLibrary_2)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_2292ABFB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFPreferencesClass_block_invoke_0(uint64_t a1)
{
  Class result;

  AssistantServicesLibrary_3();
  result = objc_getClass("AFPreferences");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    _MergedGlobals_6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    return (Class)AssistantServicesLibrary_3();
  }
  return result;
}

uint64_t AssistantServicesLibrary_3()
{
  uint64_t v0;
  void *v2;

  if (AssistantServicesLibraryCore_frameworkLibrary_3)
    return AssistantServicesLibraryCore_frameworkLibrary_3;
  AssistantServicesLibraryCore_frameworkLibrary_3 = _sl_dlopen();
  v0 = AssistantServicesLibraryCore_frameworkLibrary_3;
  if (!AssistantServicesLibraryCore_frameworkLibrary_3)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_2292ACCEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _ProjectToNamespacesMapping()
{
  _QWORD v1[4];
  _QWORD v2[5];

  v2[4] = *MEMORY[0x24BDAC8D0];
  v1[0] = &unk_24F202C68;
  v1[1] = &unk_24F202D28;
  v2[0] = &unk_24F202F08;
  v2[1] = &unk_24F202F20;
  v1[2] = &unk_24F202D58;
  v1[3] = &unk_24F202D88;
  v2[2] = &unk_24F202F38;
  v2[3] = &unk_24F202F50;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v2, v1, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t levelHasValidPath(void *a1)
{
  id v1;
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v1 = a1;
  v2 = v1;
  if (!v1)
    goto LABEL_14;
  v3 = objc_msgSend(v1, "levelOneOfCase");
  switch(v3)
  {
    case 0:
      goto LABEL_14;
    case 100:
      objc_msgSend(v2, "fileValue");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
        goto LABEL_14;
      v5 = (void *)v8;
      objc_msgSend(v2, "fileValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "hasPath"))
      {
        objc_msgSend(v2, "fileValue");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
        v9 = v7;
        objc_msgSend(v7, "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "length");

        if (v11)
          break;
LABEL_14:
        v12 = 0;
        goto LABEL_15;
      }
LABEL_13:

      goto LABEL_14;
    case 101:
      objc_msgSend(v2, "directoryValue");
      v4 = objc_claimAutoreleasedReturnValue();
      if (!v4)
        goto LABEL_14;
      v5 = (void *)v4;
      objc_msgSend(v2, "directoryValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "hasPath"))
      {
        objc_msgSend(v2, "directoryValue");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      goto LABEL_13;
  }
  v12 = 1;
LABEL_15:

  return v12;
}

id newFactorLevelWithLevel(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "hasFactor"))
  {
    objc_msgSend(v3, "factor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFactor:", v6);

  }
  if (v4)
    objc_msgSend(v5, "setLevel:", v4);
  else
    objc_msgSend(v5, "setHasLevel:", 0);

  return v5;
}

id factorLevelsFromAssets(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v37 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v40 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        if (objc_msgSend(v9, "state") == 6)
        {
          v10 = (void *)objc_opt_new();
          v11 = v9;
          v12 = v37;
          v13 = (void *)objc_opt_new();
          objc_msgSend(v13, "setNamespaceName:", v12);
          v14 = objc_msgSend(MEMORY[0x24BEBA990], "namespaceIdFromName:", v12);

          objc_msgSend(v13, "setNamespaceId:", v14);
          objc_msgSend(v11, "attributes");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Factor"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setName:", v16);

          objc_msgSend(v13, "setType:", 101);
          objc_msgSend(v13, "setHasAlias:", 0);
          objc_msgSend(v13, "setHasId_p:", 0);
          objc_msgSend(v10, "setFactor:", v13);

          v17 = v11;
          v18 = (void *)objc_opt_new();
          v19 = (void *)objc_opt_new();
          objc_msgSend(v18, "setDirectoryValue:", v19);

          objc_msgSend(v17, "getLocalFileUrl");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "path");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "directoryValue");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setPath:", v21);

          objc_msgSend(v18, "directoryValue");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setIsOnDemand:", 0);

          v24 = (void *)objc_opt_new();
          objc_msgSend(v18, "directoryValue");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setAsset:", v24);

          objc_msgSend(v17, "assetId");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "directoryValue");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "asset");
          v28 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v28, "setAssetId:", v26);

          v29 = (void *)objc_opt_new();
          objc_msgSend(v18, "setMetadata:", v29);

          objc_msgSend(v17, "attributes");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v43[0] = MEMORY[0x24BDAC760];
          v43[1] = 3221225472;
          v43[2] = __levelFromAsset_block_invoke;
          v43[3] = &unk_24F1F7CE8;
          v31 = v18;
          v44 = v31;
          objc_msgSend(v30, "enumerateKeysAndObjectsUsingBlock:", v43);

          objc_msgSend(v31, "metadata");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("isRoot"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v28) = objc_msgSend(v33, "BOOLValue");

          if ((v28 & 1) == 0)
          {
            objc_msgSend(v31, "metadata");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v17, "wasPreinstalled"))
              v35 = CFSTR("YES");
            else
              v35 = CFSTR("NO");
            objc_msgSend(v34, "setObject:forKey:", v35, CFSTR("preinstalled"));

          }
          objc_msgSend(v10, "setLevel:", v31);

          objc_msgSend(v38, "addObject:", v10);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v6);
  }

  return v38;
}

void sub_2292AEE14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void createError(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v3 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BDD0FC8];
    v9[0] = a2;
    v4 = (void *)MEMORY[0x24BDBCE70];
    v5 = a2;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    *a1 = v7;
  }
}

void __levelFromAsset_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = *(void **)(a1 + 32);
      v8 = v5;
      objc_msgSend(v7, "metadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v8, v6);

    }
  }
  else
  {
    v6 = 0;
  }

}

void sub_2292B0FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t upgradeBlocks_block_invoke()
{
  return 1;
}

void sub_2292B5C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_2292B5F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2292B6350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2292B6604(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_2292B6E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2292B75E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2292B7C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2292B805C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2292B8E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2292B9648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2292B9D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2292BC6E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2292BC8E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_2292BDD98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2292BFBE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_2292BFDC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2292C13D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2292C1608(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2292C1740(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2292C1DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getMorphunAssetsClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_2540B1DC8;
  v7 = qword_2540B1DC8;
  if (!qword_2540B1DC8)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getMorphunAssetsClass_block_invoke;
    v3[3] = &unk_24F1F7190;
    v3[4] = &v4;
    __getMorphunAssetsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2292C37BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMorphunAssetsClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_2540B1DD0)
  {
    qword_2540B1DD0 = _sl_dlopen();
    if (!qword_2540B1DD0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("MorphunAssets");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  qword_2540B1DC8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

UAFAutoBugCapture *UAFFaultCapture(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[UAFAutoBugCapture captureWithType:subType:context:logCategory:](UAFAutoBugCapture, "captureWithType:subType:context:logCategory:", a2, a3, a4, a1);
}

id _MapTrialProjectsToNamespacesFromConfig()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  id obj;
  unsigned int v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v28 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "getAllAssetSets");
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v38;
    v26 = *(_QWORD *)v38;
    v27 = v0;
    do
    {
      v4 = 0;
      v29 = v2;
      do
      {
        if (*(_QWORD *)v38 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v4);
        objc_msgSend(v5, "name");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "getAssetSet:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v7, "isTrialAvailable"))
        {
          v8 = (void *)MEMORY[0x24BEBA9A0];
          objc_msgSend(v5, "trialProject");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v8, "projectIdFromName:", v9);

          if (v10)
          {
            v31 = v10;
            v32 = v7;
            v11 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
            v33 = 0u;
            v34 = 0u;
            v35 = 0u;
            v36 = 0u;
            objc_msgSend(v5, "assets");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v34;
              do
              {
                for (i = 0; i != v14; ++i)
                {
                  if (*(_QWORD *)v34 != v15)
                    objc_enumerationMutation(v12);
                  v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
                  objc_msgSend(v17, "trialNamespace");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v18)
                  {
                    v19 = (void *)MEMORY[0x24BEBA990];
                    objc_msgSend(v17, "trialNamespace");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    v21 = objc_msgSend(v19, "namespaceIdFromName:", v20);

                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v21);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v11, "addObject:", v22);

                  }
                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
              }
              while (v14);
            }

            objc_msgSend(v11, "allObjects");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v31);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v23, v24);

            v3 = v26;
            v0 = v27;
            v2 = v29;
            v7 = v32;
          }
        }

        ++v4;
      }
      while (v4 != v2);
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v2);
  }

  return v28;
}

void sub_2292D8834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  _Block_object_dispose(&a61, 8);
  objc_destroyWeak(location);
  _Block_object_dispose(&a42, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__7(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_2292DA0EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t MAGetPallasAudience()
{
  return MEMORY[0x24BE66B48]();
}

uint64_t MAGetPallasUrlForType()
{
  return MEMORY[0x24BE66B50]();
}

uint64_t MASetPallasAudienceForType()
{
  return MEMORY[0x24BE66B58]();
}

uint64_t MASetPallasUrlForType()
{
  return MEMORY[0x24BE66B60]();
}

uint64_t MAStringForMAOperationResult()
{
  return MEMORY[0x24BE66B70]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

uint64_t TRIProject_ProjectId_IsValidValue()
{
  return MEMORY[0x24BEBA9A8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x24BDAE5F8]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x24BDAE720](*(_QWORD *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x24BDAE788]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

uint64_t nw_path_create_default_evaluator()
{
  return MEMORY[0x24BDE17E8]();
}

uint64_t nw_path_evaluator_cancel()
{
  return MEMORY[0x24BDE1818]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x24BDE1828]();
}

uint64_t nw_path_evaluator_set_update_handler()
{
  return MEMORY[0x24BDE1848]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x24BDE1938](path);
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return MEMORY[0x24BDE19C8](path);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x24BEDD0F8](to, from);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x24BDAFB80](__from, __to, __ec);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF48](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x24BEDDF58](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x24BEDDF60](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF98](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x24BEDDFF0](a1, *(_QWORD *)&ms);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE008](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x24BEDE010](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x24BEDE018](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x24BEDE020](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE028](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE050](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE068](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x24BEDE108](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x24BEDE118](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x24BEDE128](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x24BEDE148](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x24BEDE1C0](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE1E0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
}

char *__cdecl sqlite3_vmprintf(const char *a1, va_list a2)
{
  return (char *)MEMORY[0x24BEDE380](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x24BDB05D0](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x24BDB05E0](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x24BDB05E8](identifier, criteria, handler);
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x24BDB0608](activity, criteria);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x24BDB0610](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x24BDB0618](activity);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x24BDB0620](identifier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

