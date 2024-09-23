void sub_214741AE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214743C88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  id v9;
  NSObject *v10;

  if (a2 == 1)
  {
    v9 = objc_begin_catch(exception_object);
    if (!objc_msgSend(MEMORY[0x24BE4BD98], "isInternalInstall"))
    {
      AXLogRTT();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __39__RTTController_handleDatabaseRequest___block_invoke_cold_1();

      objc_end_catch();
      JUMPOUT(0x214743648);
    }
    objc_exception_throw(objc_retainAutorelease(v9));
  }
  _Unwind_Resume(exception_object);
}

void sub_214743F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214744FDC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_214745704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214745BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2147467CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10)
{
  id *v10;
  id *v11;
  id *v12;
  id *v13;
  id *v14;
  uint64_t v15;

  objc_destroyWeak(v14);
  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak((id *)(v15 - 128));
  _Unwind_Resume(a1);
}

void sub_214747EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_214748588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214749A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXUIClientClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AccessibilityUILibraryCore_frameworkLibrary)
  {
    AccessibilityUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AccessibilityUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AXUIClient");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAXUIClientClass_block_invoke_cold_1();
    free(v3);
  }
  getAXUIClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getSFSpeechRecognizerClass_block_invoke(uint64_t a1)
{
  SpeechLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SFSpeechRecognizer");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSFSpeechRecognizerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSFSpeechRecognizerClass_block_invoke_cold_1();
    SpeechLibrary();
  }
}

void SpeechLibrary()
{
  void *v0;

  if (!SpeechLibraryCore_frameworkLibrary)
    SpeechLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!SpeechLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void __getSFSpeechURLRecognitionRequestClass_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  SpeechLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SFSpeechURLRecognitionRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSFSpeechURLRecognitionRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v10 = (void *)__getSFSpeechURLRecognitionRequestClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_0(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

id accessibilityRTTUtilitiesBundle()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)accessibilityRTTUtilitiesBundle_AXBundle;
  if (!accessibilityRTTUtilitiesBundle_AXBundle)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)accessibilityRTTUtilitiesBundle_AXBundle;
    accessibilityRTTUtilitiesBundle_AXBundle = v1;

    v0 = (void *)accessibilityRTTUtilitiesBundle_AXBundle;
  }
  return v0;
}

id ttyLocString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  accessibilityRTTUtilitiesBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, v1, CFSTR("TTYSupport"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id ttyLocStringAndLocale(void *a1, void *a2)
{
  id v3;
  const __CFAllocator *v4;
  id v5;
  void *v6;
  const __CFURL *v7;
  CFBundleRef v8;
  void *v9;
  uint64_t v10;

  v3 = a1;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = a2;
  accessibilityRTTUtilitiesBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleURL");
  v7 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v8 = CFBundleCreate(v4, v7);

  v9 = (void *)CFBundleCopyLocalizedStringForLocalization();
  if (objc_msgSend(v9, "isEqualToString:", v3))
  {
    ttyLocString(v3);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  if (v8)
    CFRelease(v8);

  return v9;
}

void sub_21474AEC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21474B0F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void transportMethodDidChange()
{
  id v0;

  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "headphoneStateChangedNotification:", 0);

}

void sub_21474C118(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21474C758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21474CA9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void sub_21474CC5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21474D434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214750244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_214751B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void destructor(id a1)
{
  if (a1)

}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_2147542CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_214755514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21475598C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_214755D68(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

Class __getAXSpringBoardServerClass_block_invoke(uint64_t a1)
{
  Class result;

  AccessibilityUtilitiesLibrary();
  result = objc_getClass("AXSpringBoardServer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAXSpringBoardServerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAXSpringBoardServerClass_block_invoke_cold_1();
    return (Class)AccessibilityUtilitiesLibrary();
  }
  return result;
}

uint64_t AccessibilityUtilitiesLibrary()
{
  uint64_t v0;
  void *v2;

  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
    AccessibilityUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = AccessibilityUtilitiesLibraryCore_frameworkLibrary;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void RTTSetDownlinkMute(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE64828];
  v7 = 0;
  objc_msgSend(v2, "setAttribute:forKey:error:", v3, v4, &v7);
  v5 = v7;

  AXLogRTT();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v9 = a1;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_21473C000, v6, OS_LOG_TYPE_INFO, "Toggled downlink mute: %d - err: %@", buf, 0x12u);
  }

}

void RTTRequestNotificationAuthorization()
{
  void *v0;
  char v1;
  NSObject *v2;
  id v3;
  uint8_t buf[16];

  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "showsRTTNotifications");

  if ((v1 & 1) != 0)
  {
    RTTNotificationCenter();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "requestAuthorizationWithOptions:completionHandler:", 32, &__block_literal_global_4);

  }
  else
  {
    AXLogRTT();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21473C000, v2, OS_LOG_TYPE_INFO, "Not requesting user notification permission because feature is user disabled", buf, 2u);
    }

  }
}

id RTTNotificationCenter()
{
  if (RTTNotificationCenter_onceToken != -1)
    dispatch_once(&RTTNotificationCenter_onceToken, &__block_literal_global_9);
  return (id)RTTNotificationCenter_rttNotificationCenter;
}

void RTTGenerateUserNotificationForContact(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[16];

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "showsRTTNotifications");

  if ((v12 & 1) != 0)
  {
    v13 = (void *)UtteranceCoalescer;
    if (!UtteranceCoalescer)
    {
      v14 = objc_alloc_init(MEMORY[0x24BDFE490]);
      v15 = (void *)UtteranceCoalescer;
      UtteranceCoalescer = (uint64_t)v14;

      objc_msgSend((id)UtteranceCoalescer, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
      v13 = (void *)UtteranceCoalescer;
    }
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __RTTGenerateUserNotificationForContact_block_invoke;
    v17[3] = &unk_24D204300;
    v18 = v7;
    v19 = v8;
    v20 = v9;
    v21 = v10;
    objc_msgSend(v13, "afterDelay:processBlock:", v17, 5.0);

    v16 = v18;
  }
  else
  {
    AXLogRTT();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21473C000, v16, OS_LOG_TYPE_INFO, "Not generating user notification because feature is user disabled", buf, 2u);
    }
  }

}

void sub_214757BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void RTTRemoveUserNotifications(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v18 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  RTTNotificationCenter();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deliveredNotifications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v8, "request");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "content");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "threadIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v1);

        if (v12)
        {
          objc_msgSend(v8, "request");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v14);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v5);
  }

  AXLogRTT();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = objc_msgSend(v18, "count");
    *(_DWORD *)buf = 134218242;
    v24 = v16;
    v25 = 2112;
    v26 = v1;
    _os_log_impl(&dword_21473C000, v15, OS_LOG_TYPE_INFO, "Removing %lu RTT notifications for call %@", buf, 0x16u);
  }

  RTTNotificationCenter();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeDeliveredNotificationsWithIdentifiers:", v18);

}

void sub_214757F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getUNUserNotificationCenterClass_block_invoke(uint64_t a1)
{
  UserNotificationsLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("UNUserNotificationCenter");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUNUserNotificationCenterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getUNUserNotificationCenterClass_block_invoke_cold_1();
    UserNotificationsLibrary();
  }
}

void UserNotificationsLibrary()
{
  void *v0;

  if (!UserNotificationsLibraryCore_frameworkLibrary)
    UserNotificationsLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!UserNotificationsLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getUNNotificationCategoryClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  UserNotificationsLibrary();
  result = objc_getClass("UNNotificationCategory");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUNNotificationCategoryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getUNNotificationCategoryClass_block_invoke_cold_1();
    return (Class)___RTTSendUserNotification_block_invoke(v3);
  }
  return result;
}

Class __getUNMutableNotificationContentClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  UserNotificationsLibrary();
  result = objc_getClass("UNMutableNotificationContent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUNMutableNotificationContentClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getUNMutableNotificationContentClass_block_invoke_cold_1();
    return (Class)__getUNNotificationRequestClass_block_invoke(v3);
  }
  return result;
}

RTTTranscriptionController *__getUNNotificationRequestClass_block_invoke(uint64_t a1)
{
  RTTTranscriptionController *result;
  RTTTranscriptionController *v3;
  SEL v4;
  id v5;

  UserNotificationsLibrary();
  result = (RTTTranscriptionController *)objc_getClass("UNNotificationRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUNNotificationRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (RTTTranscriptionController *)__getUNNotificationRequestClass_block_invoke_cold_1();
    return -[RTTTranscriptionController initWithDelegate:](v3, v4, v5);
  }
  return result;
}

void sub_2147583F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getAXLTLiveTranscriptionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!LiveTranscriptionLibraryCore_frameworkLibrary)
  {
    LiveTranscriptionLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!LiveTranscriptionLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AXLTLiveTranscription");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAXLTLiveTranscriptionClass_block_invoke_cold_1();
    free(v3);
  }
  getAXLTLiveTranscriptionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_214758F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
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

void sub_21475920C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21475968C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_214759CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_21475A0D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21475A528(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_2_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void AccessibilitySettingsChangedOnCompanion()
{
  NSObject *v0;
  void *v1;
  NSObject *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  uint8_t v5[8];
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  AXLogRTT();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21473C000, v0, OS_LOG_TYPE_INFO, "Settings changed on companion", v5, 2u);
  }

  v6[0] = kAXSTTYSoftwareEnabledPreference;
  v6[1] = kAXSTTYPreferredRelayNumberPreference;
  v6[2] = kAXSTTYShouldBeRealtimePreference;
  v6[3] = CFSTR("TTYCannedResponsesPreference");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", &__block_literal_global_328);
  AXLogRTT();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21473C000, v2, OS_LOG_TYPE_INFO, "Posting transport changed because accessibility settings on companion changed", v5, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("AXTTYPreferredTransportMethodChangedNotification"), 0, 0, 1u);
  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPreferredTransportMethod");

}

void sub_21475B0F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _axSettingsHandlePreferenceChanged(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_handlePreferenceChanged:", a3);

}

void sub_21475CA1C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

uint64_t AXTTYTextStreamToken()
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BDC3170]);
}

uint64_t AXTTYIsTextHeldForRTTCall()
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BDC3160]);
}

void sub_21475DBD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21475DF74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
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

void sub_21475EA88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __getAXUIClientClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSFSpeechRecognizerClass_block_invoke_cold_1(v0);
}

uint64_t __getSFSpeechRecognizerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSFSpeechURLRecognitionRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getSFSpeechURLRecognitionRequestClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[RTTTelephonyUtilities phoneNumberForContext:].cold.1(v0);
}

uint64_t __getAXSpringBoardServerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getUNUserNotificationCenterClass_block_invoke_cold_1(v0);
}

uint64_t __getUNUserNotificationCenterClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getUNNotificationCategoryClass_block_invoke_cold_1(v0);
}

uint64_t __getUNNotificationCategoryClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___RTTSendUserNotification_block_invoke_cold_1(v0);
}

uint64_t __getUNMutableNotificationContentClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getUNNotificationRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getUNNotificationRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[RTTTranscriptionController startTranscribingForCallUUID:].cold.1(v0);
}

uint64_t __getAXLTLiveTranscriptionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[RTTDatabaseManager conversationForCallUID:].cold.2(v0);
}

uint64_t AXLogRTT()
{
  return MEMORY[0x24BDFE168]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x24BDFE240]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x24BDFE248]();
}

uint64_t AXPidSuspend()
{
  return MEMORY[0x24BDFE928]();
}

uint64_t AXPidUnsuspend()
{
  return MEMORY[0x24BDFE930]();
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x24BDBBA70]();
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x24BDBBA98](allocator, bundleURL);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC060]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x24BDBC1A8](key, value, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x24BDBC360](mode, returnAfterSourceHandled, seconds);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return MEMORY[0x24BED2070]();
}

uint64_t _AXSInUnitTestMode()
{
  return MEMORY[0x24BED22D0]();
}

uint64_t _AXSIsNonUIBuild()
{
  return MEMORY[0x24BED2300]();
}

uint64_t _AXSSoftwareTTYSetEnabled()
{
  return MEMORY[0x24BED2508]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x24BED25B0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x24BDADDA0]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
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

void *__cdecl dispatch_queue_get_specific(dispatch_queue_t queue, const void *key)
{
  return (void *)MEMORY[0x24BDADEF0](queue, key);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x24BDADF00](queue, key, context, destructor);
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

int dlclose(void *__handle)
{
  return MEMORY[0x24BDAE060](__handle);
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

uid_t geteuid(void)
{
  return MEMORY[0x24BDAE5F8]();
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x24BDAE710](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

