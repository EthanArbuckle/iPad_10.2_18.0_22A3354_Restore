BOOL SiriUIDeviceIsPad()
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom") == 1;

  return v1;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_21765D7B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKTextBalloonViewClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!ChatKitLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D7D9480;
    v5 = 0;
    ChatKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ChatKitLibraryCore_frameworkLibrary)
    __getCKTextBalloonViewClass_block_invoke_cold_1(&v3);
  result = objc_getClass("CKTextBalloonView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCKTextBalloonViewClass_block_invoke_cold_2();
  getCKTextBalloonViewClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2176607D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSearchUICardViewControllerClass()
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
  v0 = (void *)getSearchUICardViewControllerClass_softClass;
  v7 = getSearchUICardViewControllerClass_softClass;
  if (!getSearchUICardViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSearchUICardViewControllerClass_block_invoke;
    v3[3] = &unk_24D7D9460;
    v3[4] = &v4;
    __getSearchUICardViewControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_217660A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217661AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,id a37)
{
  id *v37;
  id *v38;

  objc_destroyWeak(v38);
  objc_destroyWeak(v37);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a37);
  _Unwind_Resume(a1);
}

void sub_217661FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217663100(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

Class __getAPUICardServiceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!AppPredictionUILibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D7D9600;
    v5 = 0;
    AppPredictionUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AppPredictionUILibraryCore_frameworkLibrary)
    __getAPUICardServiceClass_block_invoke_cold_1(&v3);
  result = objc_getClass("APUICardService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAPUICardServiceClass_block_invoke_cold_2();
  getAPUICardServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSearchUICardViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  SearchUILibrary();
  result = objc_getClass("SearchUICardViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSearchUICardViewControllerClass_block_invoke_cold_1();
  getSearchUICardViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void SearchUILibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = 0;
  if (!SearchUILibraryCore_frameworkLibrary)
  {
    v1 = xmmword_24D7D9618;
    v2 = 0;
    SearchUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SearchUILibraryCore_frameworkLibrary)
    SearchUILibrary_cold_1(&v0);
}

Class __getSearchUIBackgroundColorViewClass_block_invoke(uint64_t a1)
{
  Class result;

  SearchUILibrary();
  result = objc_getClass("SearchUIBackgroundColorView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSearchUIBackgroundColorViewClass_block_invoke_cold_1();
  getSearchUIBackgroundColorViewClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_217669270(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_21766DE04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 152), 8);
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

void sub_21766E49C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_21766F21C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21766F638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSASSystemStateClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!SiriActivationLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D7D9840;
    v5 = 0;
    SiriActivationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SiriActivationLibraryCore_frameworkLibrary)
    __getSASSystemStateClass_block_invoke_cold_1(&v3);
  result = objc_getClass("SASSystemState");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSASSystemStateClass_block_invoke_cold_2();
  getSASSystemStateClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getVTPreferencesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!VoiceTriggerLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D7D9858;
    v5 = 0;
    VoiceTriggerLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!VoiceTriggerLibraryCore_frameworkLibrary)
    __getVTPreferencesClass_block_invoke_cold_1(&v3);
  result = objc_getClass("VTPreferences");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getVTPreferencesClass_block_invoke_cold_2();
  getVTPreferencesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAnalyticsSendEventLazySymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!CoreAnalyticsLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D7D9870;
    v5 = 0;
    CoreAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreAnalyticsLibraryCore_frameworkLibrary)
    __getAnalyticsSendEventLazySymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)CoreAnalyticsLibraryCore_frameworkLibrary, "AnalyticsSendEventLazy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAnalyticsSendEventLazySymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_217675B80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217678844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SiriUIViewModeToSISchemaSiriPresentationType(uint64_t a1)
{
  if ((unint64_t)(a1 - 4) > 4)
    return 0;
  else
    return dword_217697ED8[a1 - 4];
}

void sub_21767BBF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21767BEC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
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

void sub_21767C3B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21767C83C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21767CCA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21767CF5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_217680B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

id SiriUIDismissalReasonStringFromReason(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (SiriUIDismissalReasonStringFromReason_onceToken != -1)
    dispatch_once(&SiriUIDismissalReasonStringFromReason_onceToken, &__block_literal_global_9);
  v2 = (void *)SiriUIDismissalReasonStringFromReason_reasonStrings;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL SiriUISystemLanguageIsRTL()
{
  void *v0;
  void *v1;
  void *v2;
  _BOOL8 v3;

  v0 = (void *)MEMORY[0x24BDBCEA0];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v0, "characterDirectionForLanguage:", v2) == 2;

  return v3;
}

BOOL SiriLanguageIsRTL()
{
  void *v0;
  _BOOL8 v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v0, "assistantLanguageForceRTL") & 1) != 0)
  {
    v1 = 1;
  }
  else
  {
    v2 = (void *)MEMORY[0x24BDBCEA0];
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "languageCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v2, "characterDirectionForLanguage:", v4) == 2;

  }
  return v1;
}

void SiriUIBlockExecuteMonitored(void *a1, void *a2)
{
  void (**v3)(_QWORD);
  id v4;

  v3 = a1;
  v4 = a2;
  if (v3)
    v3[2](v3);

}

void sub_217684C54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, __int128 a11, __int128 a12, __int128 a13, __int128 a14, uint64_t a15, char a16)
{
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void (*v23)(uint64_t, uint64_t, id);
  uint64_t v24;
  NSObject *v25;
  void *v26;

  if (a2 == 1)
  {
    v17 = objc_begin_catch(exception_object);
    v18 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    objc_msgSend(v17, "reason");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appendFormat:", CFSTR("Exception raised while executing monitored block: %@\n"));

    a13 = 0u;
    a14 = 0u;
    a11 = 0u;
    a12 = 0u;
    objc_msgSend(v17, "callStackSymbols");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &a11, &a16, 16);
    if (v20)
    {
      v21 = *(_QWORD *)a12;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)a12 != v21)
            objc_enumerationMutation(v19);
          objc_msgSend(v18, "appendFormat:", CFSTR("%@\n"));
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &a11, &a16, 16);
      }
      while (v20);
    }

    LoadCrashSupportIfNecessary();
    v23 = (void (*)(uint64_t, uint64_t, id))SiriUISimulateCrash;
    if (SiriUISimulateCrash)
    {
      v24 = getpid();
      v23(v24, 2327501518, v18);
    }
    v25 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      SiriUIBlockExecuteMonitored_cold_1((uint64_t)v18, v25);
    if (v16)
      (*(void (**)(uint64_t))(v16 + 16))(v16);

    objc_end_catch();
    JUMPOUT(0x217684C10);
  }
  _Unwind_Resume(exception_object);
}

void LoadCrashSupportIfNecessary()
{
  void *v0;
  NSObject *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  if (!LoadCrashSupportIfNecessary___CrashReportHandle)
  {
    v0 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport"), "fileSystemRepresentation"), 1);
    LoadCrashSupportIfNecessary___CrashReportHandle = (uint64_t)v0;
    if (v0)
    {
      SiriUISimulateCrash = dlsym(v0, "SimulateCrash");
    }
    else
    {
      v1 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v2 = 136315138;
        v3 = "LoadCrashSupportIfNecessary";
        _os_log_impl(&dword_21764F000, v1, OS_LOG_TYPE_DEFAULT, "%s Unable to load CrashReporterSupport framework.", (uint8_t *)&v2, 0xCu);
      }
    }
  }
}

void SiriUIInvokeOnMainQueue(void *a1)
{
  void (**v1)(void);
  void (**block)(void);

  v1 = a1;
  if (v1)
  {
    block = v1;
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      block[2]();
    else
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    v1 = block;
  }

}

double SiriUIUtteranceWidthForAvailableWidthAndInsets(double a1, double a2, double a3, double a4, double a5)
{
  return fmax(ceil(a1 - a3 - a5), 0.0);
}

CGFloat SiriUIRectForLabelWithDistanceFromTopToBaseline(void *a1, CGFloat a2, double a3, double a4, double a5)
{
  id v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  CGRect v17;

  v8 = a1;
  objc_msgSend(v8, "frame");
  v10 = v9;
  objc_msgSend(v8, "sizeThatFits:", a4, a5);
  v12 = v11;
  v14 = v13;
  v17.origin.x = a2;
  v17.origin.y = v10;
  v17.size.width = v12;
  v17.size.height = v14;
  CGRectGetHeight(v17);
  objc_msgSend(v8, "font");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "descender");
  return a2;
}

CGFloat SiriUIRectForLabelWithDistanceFromBottomToBaseline(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  CGRect v19;
  CGRect v20;

  v9 = a1;
  objc_msgSend(v9, "frame");
  v11 = v10;
  objc_msgSend(v9, "sizeThatFits:", a4, a5);
  v13 = v12;
  v15 = v14;
  v19.origin.x = a2;
  v19.origin.y = a3;
  v19.size.width = a4;
  v19.size.height = a5;
  CGRectGetHeight(v19);
  v20.origin.x = a2;
  v20.origin.y = v11;
  v20.size.width = v13;
  v20.size.height = v15;
  CGRectGetHeight(v20);
  objc_msgSend(v9, "font");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "descender");
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scale");

  return a2;
}

void SiriUIAspectFitSizeInSizeWithScale(double a1, double a2, double a3, double a4, double a5)
{
  void *v5;

  if (a1 > 0.0 && a2 > 0.0 && a5 <= 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");

  }
}

BOOL SiriUIDeviceIsPhone()
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom") == 0;

  return v1;
}

BOOL SiriUIDeviceIsPod()
{
  const void *v0;
  _BOOL8 v1;

  v0 = (const void *)MGCopyAnswer();
  v1 = CFEqual(v0, CFSTR("iPod")) != 0;
  CFRelease(v0);
  return v1;
}

uint64_t SiriUIIsLargePhoneLayout()
{
  void *v0;
  int v1;

  +[SiriUIDeviceInfo sharedInstance](SiriUIDeviceInfo, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isLargeFormatPhone");

  if (v1)
    return SiriUIDeviceIsZoomed() ^ 1;
  else
    return 0;
}

uint64_t SiriUIDeviceIsZoomed()
{
  void *v0;
  uint64_t v1;

  +[SiriUIDeviceInfo sharedInstance](SiriUIDeviceInfo, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isDeviceZoomed");

  return v1;
}

BOOL SiriUIDeviceIsSmallPhone()
{
  void *v0;
  double v1;
  CGFloat v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGRect v10;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_referenceBounds");
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;

  v10.origin.x = v2;
  v10.origin.y = v4;
  v10.size.width = v6;
  v10.size.height = v8;
  return CGRectGetWidth(v10) <= 320.0;
}

BOOL SiriUIDeviceIsLargeFormatPad()
{
  void *v0;
  double v1;
  CGFloat v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGRect v10;
  CGRect v11;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_referenceBounds");
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;

  v10.origin.x = v2;
  v10.origin.y = v4;
  v10.size.width = v6;
  v10.size.height = v8;
  if (CGRectGetWidth(v10) < 1024.0)
    return 0;
  v11.origin.x = v2;
  v11.origin.y = v4;
  v11.size.width = v6;
  v11.size.height = v8;
  return CGRectGetHeight(v11) >= 1366.0;
}

BOOL SiriUIIsExtendedWidth()
{
  _BOOL8 result;

  result = SiriUIDeviceIsLargeFormatPad();
  if (result)
    return !SiriUIIsCompactWidth();
  return result;
}

BOOL SiriUIIsCompactWidth()
{
  void *v0;
  double v1;
  CGFloat v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double Width;
  uint64_t v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "siriui_applicationFrame");
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;

  if (SiriUIIsLargePhoneLayout())
  {
    v16.origin.x = v2;
    v16.origin.y = v4;
    v16.size.width = v6;
    v16.size.height = v8;
    Width = CGRectGetWidth(v16);
    v17.origin.x = v2;
    v17.origin.y = v4;
    v17.size.width = v6;
    v17.size.height = v8;
    return Width < CGRectGetHeight(v17);
  }
  else
  {
    if (SiriUIDeviceIsPad())
    {
      v18.origin.x = v2;
      v18.origin.y = v4;
      v18.size.width = v6;
      v18.size.height = v8;
      v11 = CGRectGetWidth(v18) <= 374.0;
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "keyWindow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v14, "horizontalSizeClass") == 1 || v11;
  }
  return v10;
}

uint64_t SiriUIIsAllOrientationsSupported()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  if (v1 == 1)
    return 1;
  else
    return SiriUIIsLargePhoneLayout();
}

BOOL SiriUIIsCompactHeight()
{
  void *v0;
  void *v1;
  _BOOL8 v2;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend(v1, "verticalSizeClass") == 1;
  return v2;
}

BOOL SiriUIAllowsLandscape()
{
  return (SiriUIIsLargePhoneLayout() & 1) != 0 || !SiriUIIsCompactWidth();
}

uint64_t SiriUIDeviceShouldFreezeAura()
{
  void *v0;
  uint64_t v1;

  +[SiriUIDeviceInfo sharedInstance](SiriUIDeviceInfo, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "deviceShouldFreezeAura");

  return v1;
}

uint64_t SiriUIDeviceShouldUseFrozenBackdropSnapshot()
{
  void *v0;
  uint64_t v1;

  +[SiriUIDeviceInfo sharedInstance](SiriUIDeviceInfo, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "deviceShouldUseFrozenBackdropSnapshot");

  return v1;
}

uint64_t SiriUIDeviceShouldDeferFlamesView()
{
  void *v0;
  uint64_t v1;

  +[SiriUIDeviceInfo sharedInstance](SiriUIDeviceInfo, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "deviceShouldDeferFlamesView");

  return v1;
}

uint64_t SiriUIDeviceHasSideButton()
{
  if (SiriUIDeviceHasSideButton_onceToken != -1)
    dispatch_once(&SiriUIDeviceHasSideButton_onceToken, &__block_literal_global_121);
  return SiriUIDeviceHasSideButton_hasSideButton;
}

uint64_t SiriUIDisableAlternativesFeature()
{
  void *v0;
  void *v1;
  uint64_t v2;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.siri.alternatives"));
  objc_msgSend(v0, "objectForKey:", CFSTR("SiriUIAlternativesDisabledKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

uint64_t SiriUIShowSpeechAlternativeScore()
{
  void *v1;
  void *v2;
  uint64_t v3;

  if ((AFIsCustomerInstallOrPPT() & 1) != 0)
    return 0;
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.siri.alternatives"));
  objc_msgSend(v1, "objectForKey:", CFSTR("SiriUIAlternativesShowScoreKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

uint64_t SiriLanguageSemanticContentAttribute()
{
  if (SiriLanguageIsRTL())
    return 4;
  else
    return 3;
}

uint64_t SiriUISystemLanguageSemanticContentAttribute()
{
  if (SiriUISystemLanguageIsRTL())
    return 4;
  else
    return 3;
}

uint64_t SiriLanguageTextAlignmentLeft()
{
  if (SiriLanguageIsRTL())
    return 2;
  else
    return 0;
}

uint64_t SiriLanguageTextAlignmentRight()
{
  if (SiriLanguageIsRTL())
    return 0;
  else
    return 2;
}

uint64_t SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets()
{
  return 1;
}

uint64_t SiriUIIsHTTForTextInputEnabled()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BEA8620], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isHoldToTalkForTextInputEnabled");

  return v1;
}

uint64_t SiriUIIsStreamingDictationEnabled()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BEA8620], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isStreamingDictationEnabled");

  return v1;
}

uint64_t SiriUISafeForLockScreen()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BEA8620], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isSiriSafeForLockScreen");

  return v1;
}

void SiriUISyncCachedPreferences()
{
  id v0;

  objc_msgSend(MEMORY[0x24BEA8620], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "updatePreferences");

}

const __CFString *SiriUINSStringFromSiriUIViewMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 4) > 4)
    return CFSTR("SiriUIViewModeNone");
  else
    return off_24D7D9DA8[a1 - 4];
}

uint64_t SiriUIIsValidPoint(double a1, double a2)
{
  double v2;
  _BOOL4 v3;
  double v4;
  _BOOL4 v5;

  v2 = fabs(a1);
  v3 = v2 < INFINITY;
  if (v2 > INFINITY)
    v3 = 1;
  v4 = fabs(a2);
  v5 = v4 < INFINITY;
  if (v4 > INFINITY)
    v5 = 1;
  return v5 & v3;
}

double SiriUITextHyphenationFactor()
{
  void *v0;
  NSString *v1;
  _BOOL4 IsAccessibilityCategory;
  double result;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "preferredContentSizeCategory");
  v1 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v1);

  result = 0.0;
  if (IsAccessibilityCategory)
    return 0.5;
  return result;
}

double SiriUIMapRectMakeWithZoomLevel(CLLocationDegrees a1, CLLocationDegrees a2, double a3)
{
  double v5;
  CLLocationCoordinate2D v7;

  v5 = a3 * 3000.0 * MEMORY[0x219A0F498]();
  v7.latitude = a1;
  v7.longitude = a2;
  return MKMapPointForCoordinate(v7).x - v5 * 0.5;
}

id SiriUIMapRegionFromMapRect(double a1, double a2, double a3, double a4)
{
  id v8;
  double v9;
  CLLocationCoordinate2D v10;
  CLLocationCoordinate2D v11;
  MKMapPoint v13;
  MKMapPoint v14;
  MKMapPoint v15;
  MKMapPoint v16;

  v8 = objc_alloc_init(MEMORY[0x24BE84EB0]);
  v13.x = a1;
  v13.y = a2 + a4 * 0.5;
  objc_msgSend(v8, "setWestLng:", MKCoordinateForMapPoint(v13).longitude);
  v14.x = a1 + a3;
  v14.y = a2 + a4 * 0.5;
  objc_msgSend(v8, "setEastLng:", MKCoordinateForMapPoint(v14).longitude);
  v9 = a1 + a3 * 0.5;
  v15.x = v9;
  v15.y = a2;
  v10 = MKCoordinateForMapPoint(v15);
  objc_msgSend(v8, "setNorthLat:", v10.latitude, v10.longitude);
  v16.y = a2 + a4;
  v16.x = v9;
  v11 = MKCoordinateForMapPoint(v16);
  objc_msgSend(v8, "setSouthLat:", v11.latitude, v11.longitude);
  return v8;
}

BOOL SiriUIAceViewHasButtons(void *a1)
{
  id v1;
  _BOOL8 v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v1, "allConfirmationOptions");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v2 = 0;
          goto LABEL_9;
        }
        objc_msgSend(v1, "confirmationOptions");
        v5 = objc_claimAutoreleasedReturnValue();
        v4 = (void *)v5;
        goto LABEL_8;
      }
      objc_msgSend(v1, "items");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v4 = v3;
    v5 = objc_msgSend(v3, "count");
LABEL_8:
    v2 = v5 != 0;

    goto LABEL_9;
  }
  v2 = 1;
LABEL_9:

  return v2;
}

void sub_217686264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSearchUIDefaultBrowserAppIconImageClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!SearchUILibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_24D7D9D90;
    v5 = 0;
    SearchUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!SearchUILibraryCore_frameworkLibrary_0)
    __getSearchUIDefaultBrowserAppIconImageClass_block_invoke_cold_1(&v3);
  result = objc_getClass("SearchUIDefaultBrowserAppIconImage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSearchUIDefaultBrowserAppIconImageClass_block_invoke_cold_2();
  getSearchUIDefaultBrowserAppIconImageClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *SiriUIPresentationStateGetName(unint64_t a1)
{
  NSObject *v3;

  if (a1 < 7)
    return off_24D7D9E20[a1];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    SiriUIPresentationStateGetName_cold_1(a1, v3);
  return 0;
}

void sub_217688704(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_217688A5C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217688FE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21768AD84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_21768E114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getSUICKPEntryPointClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!SearchUICardKitProviderSupportLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D7DA008;
    v5 = 0;
    SearchUICardKitProviderSupportLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SearchUICardKitProviderSupportLibraryCore_frameworkLibrary)
    __getSUICKPEntryPointClass_block_invoke_cold_1(&v3);
  result = objc_getClass("SUICKPEntryPoint");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSUICKPEntryPointClass_block_invoke_cold_2();
  getSUICKPEntryPointClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getINUICKPEntryPointClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!IntentsUICardKitProviderSupportLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D7DA020;
    v5 = 0;
    IntentsUICardKitProviderSupportLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IntentsUICardKitProviderSupportLibraryCore_frameworkLibrary)
    __getINUICKPEntryPointClass_block_invoke_cold_1(&v3);
  result = objc_getClass("INUICKPEntryPoint");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getINUICKPEntryPointClass_block_invoke_cold_2();
  getINUICKPEntryPointClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getVSUICKPEntryPointClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!VoiceShortcutsUICardKitProviderSupportLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D7DA038;
    v5 = 0;
    VoiceShortcutsUICardKitProviderSupportLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!VoiceShortcutsUICardKitProviderSupportLibraryCore_frameworkLibrary)
    __getVSUICKPEntryPointClass_block_invoke_cold_1(&v3);
  result = objc_getClass("VSUICKPEntryPoint");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getVSUICKPEntryPointClass_block_invoke_cold_2();
  getVSUICKPEntryPointClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSCKPProviderClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!SiriUICardKitProviderSupportLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D7DA050;
    v5 = 0;
    SiriUICardKitProviderSupportLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SiriUICardKitProviderSupportLibraryCore_frameworkLibrary)
    __getSCKPProviderClass_block_invoke_cold_1(&v3);
  result = objc_getClass("SCKPProvider");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSCKPProviderClass_block_invoke_cold_2();
  getSCKPProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getCKTextBalloonViewClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ChatKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SiriUIMessageContentTemplateView.m"), 17, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCKTextBalloonViewClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCKTextBalloonViewClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SiriUIMessageContentTemplateView.m"), 18, CFSTR("Unable to find class %s"), "CKTextBalloonView");

  __break(1u);
}

void __getAPUICardServiceClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AppPredictionUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SiriUICardSnippetViewController.m"), 102, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAPUICardServiceClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAPUICardServiceClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SiriUICardSnippetViewController.m"), 103, CFSTR("Unable to find class %s"), "APUICardService");

  __break(1u);
}

void __getSearchUICardViewControllerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSearchUICardViewControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SiriUICardSnippetViewController.m"), 94, CFSTR("Unable to find class %s"), "SearchUICardViewController");

  __break(1u);
}

void SearchUILibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SearchUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SiriUICardSnippetViewController.m"), 93, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSearchUIBackgroundColorViewClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSearchUIBackgroundColorViewClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SiriUICardSnippetViewController.m"), 95, CFSTR("Unable to find class %s"), "SearchUIBackgroundColorView");

  __break(1u);
}

void __getSASSystemStateClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SiriActivationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SiriUICarDNDUseSiriHeaderViewController.m"), 35, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSASSystemStateClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSASSystemStateClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SiriUICarDNDUseSiriHeaderViewController.m"), 36, CFSTR("Unable to find class %s"), "SASSystemState");

  __break(1u);
}

void __getVTPreferencesClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *VoiceTriggerLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SiriUICarDNDUseSiriHeaderViewController.m"), 47, CFSTR("%s"), *a1);

  __break(1u);
}

void __getVTPreferencesClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getVTPreferencesClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SiriUICarDNDUseSiriHeaderViewController.m"), 48, CFSTR("Unable to find class %s"), "VTPreferences");

  __break(1u);
}

void __getAnalyticsSendEventLazySymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreAnalyticsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SiriUICarDNDUseSiriHeaderViewController.m"), 29, CFSTR("%s"), *a1);

  __break(1u);
}

void SiriUIBlockExecuteMonitored_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "SiriUIBlockExecuteMonitored";
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_21764F000, a2, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v2, 0x16u);
}

void __getSearchUIDefaultBrowserAppIconImageClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SearchUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SiriUIUtilities.m"), 41, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSearchUIDefaultBrowserAppIconImageClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSearchUIDefaultBrowserAppIconImageClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SiriUIUtilities.m"), 42, CFSTR("Unable to find class %s"), "SearchUIDefaultBrowserAppIconImage");

  __break(1u);
}

void SiriUIPresentationStateGetName_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "SiriUIPresentationStateGetName";
  v4 = 2048;
  v5 = a1;
  _os_log_error_impl(&dword_21764F000, a2, OS_LOG_TYPE_ERROR, "%s Unknown SiriUIPresentationState %li", (uint8_t *)&v2, 0x16u);
}

void __getSUICKPEntryPointClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SearchUICardKitProviderSupportLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SiriUICardProviderRegistry.m"), 27, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSUICKPEntryPointClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSUICKPEntryPointClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SiriUICardProviderRegistry.m"), 28, CFSTR("Unable to find class %s"), "SUICKPEntryPoint");

  __break(1u);
}

void __getINUICKPEntryPointClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *IntentsUICardKitProviderSupportLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SiriUICardProviderRegistry.m"), 24, CFSTR("%s"), *a1);

  __break(1u);
}

void __getINUICKPEntryPointClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getINUICKPEntryPointClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SiriUICardProviderRegistry.m"), 25, CFSTR("Unable to find class %s"), "INUICKPEntryPoint");

  __break(1u);
}

void __getVSUICKPEntryPointClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *VoiceShortcutsUICardKitProviderSupportLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SiriUICardProviderRegistry.m"), 33, CFSTR("%s"), *a1);

  __break(1u);
}

void __getVSUICKPEntryPointClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getVSUICKPEntryPointClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SiriUICardProviderRegistry.m"), 34, CFSTR("Unable to find class %s"), "VSUICKPEntryPoint");

  __break(1u);
}

void __getSCKPProviderClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SiriUICardKitProviderSupportLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SiriUICardProviderRegistry.m"), 30, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSCKPProviderClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSCKPProviderClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SiriUICardProviderRegistry.m"), 31, CFSTR("Unable to find class %s"), "SCKPProvider");

  __break(1u);
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x24BE02948]();
}

uint64_t AFAnalyticsContextCreateWithError()
{
  return MEMORY[0x24BE08B68]();
}

uint64_t AFAnalyticsEventTypeGetName()
{
  return MEMORY[0x24BE08B98]();
}

uint64_t AFAssistantRestricted()
{
  return MEMORY[0x24BE08BB0]();
}

uint64_t AFDeviceSupportsSystemAssistantExperience()
{
  return MEMORY[0x24BE08CC8]();
}

uint64_t AFIsCustomerInstallOrPPT()
{
  return MEMORY[0x24BE08D88]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x24BE08DA8]();
}

uint64_t AFLogDirectory()
{
  return MEMORY[0x24BE08E00]();
}

uint64_t AFPreferencesTypeToSiriEnabled()
{
  return MEMORY[0x24BE08EF0]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
  MEMORY[0x24BDBDCB0](c, *(_QWORD *)&clockwise, x, y, radius, startAngle, endAngle);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x24BDBDFB0](c, *(_QWORD *)&mode);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBE0D0](c, color);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x24BDBE118](c);
}

CGImageRef CGImageCreateCopy(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE5E8](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateIncremental(CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9160](options);
}

CGImageSourceStatus CGImageSourceGetStatus(CGImageSourceRef isrc)
{
  return MEMORY[0x24BDD9198](isrc);
}

void CGImageSourceUpdateData(CGImageSourceRef isrc, CFDataRef data, BOOL final)
{
  MEMORY[0x24BDD91B0](isrc, data, final);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF078]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x24BDC0498](retstr, value, *(_QWORD *)&timescale);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x24BDC0580](retstr, start, duration);
}

uint64_t INIntentSlotValueTransformToLocation()
{
  return MEMORY[0x24BDD9948]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x24BED8488]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

CLLocationCoordinate2D MKCoordinateForMapPoint(MKMapPoint mapPoint)
{
  double v1;
  double v2;
  CLLocationCoordinate2D result;

  MEMORY[0x24BDDAF18]((__n128)mapPoint, *(__n128 *)&mapPoint.y);
  result.longitude = v2;
  result.latitude = v1;
  return result;
}

MKMapPoint MKMapPointForCoordinate(CLLocationCoordinate2D coordinate)
{
  double v1;
  double v2;
  MKMapPoint result;

  MEMORY[0x24BDDAF98]((__n128)coordinate, *(__n128 *)&coordinate.longitude);
  result.y = v2;
  result.x = v1;
  return result;
}

double MKMapPointsPerMeterAtLatitude(CLLocationDegrees latitude)
{
  double result;

  MEMORY[0x24BDDAFA0](latitude);
  return result;
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x24BDD1238]();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BDF6678]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x24BDF5760](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x24BDF5790](target, flags);
}

uint64_t SFFeedbackListenerRegister()
{
  return MEMORY[0x24BE85160]();
}

uint64_t SFFeedbackNotify()
{
  return MEMORY[0x24BE85168]();
}

uint64_t SRUIFPopulateSendCommandWithInstrumentationTurn()
{
  return MEMORY[0x24BEA86D8]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x24BDF7228]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x24BDF7288]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x24BDF7290]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x24BDF74F0]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x24BDF7618]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x24BDF7698](category);
}

uint64_t UIEdgeInsetsMakeWithEdges()
{
  return MEMORY[0x24BDF7700]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x24BDF7C78]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x24BDF7C88]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x24BDF7C90]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x24BDF7CA0]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x24BDF7CA8]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x24BDF7CB0]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x24BDF7CE0]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x24BDF7D08]();
}

uint64_t UISystemRootDirectory()
{
  return MEMORY[0x24BDF7DD0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x24BDD19C0](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x24BDADF60](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

