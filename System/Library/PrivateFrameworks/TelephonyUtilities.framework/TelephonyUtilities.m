void __HIDTouchEventCallback(uint64_t a1, id a2, __IOHIDServiceClient *a3)
{
  uint64_t IntegerValue;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[4];
  NSObject *v26;
  const __CFString *v27;
  const __CFString *v28;
  uint8_t buf[4];
  NSObject *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  IntegerValue = IOHIDEventGetIntegerValue();
  if (IntegerValue == 11 || IntegerValue == 7)
  {
    v7 = IntegerValue;
    if (a2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        a2 = 0;
        if (a3)
          goto LABEL_10;
        goto LABEL_12;
      }
      a2 = a2;
    }
    if (a3)
    {
LABEL_10:
      v8 = (__CFString *)IOHIDServiceClientCopyProperty(a3, CFSTR("Product"));
      goto LABEL_13;
    }
LABEL_12:
    v8 = &stru_1E38A53C8;
LABEL_13:
    v9 = IOHIDEventGetIntegerValue();
    objc_msgSend((id)__HIDTouchEventCallback_longPressTimer, "invalidate");
    v10 = (void *)__HIDTouchEventCallback_longPressTimer;
    __HIDTouchEventCallback_longPressTimer = 0;

    if (v9)
    {
      if (IOHIDEventGetIntegerValue() != 33)
        goto LABEL_37;
      v11 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("Headset"));
      if (!a2 || (v11 & 1) != 0)
        goto LABEL_37;
      TUDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19A50D000, v12, OS_LOG_TYPE_DEFAULT, "TUHardwareControlsBroadcaster scheduling a long press timer", buf, 2u);
      }

      v13 = (void *)MEMORY[0x1E0C99E88];
      v27 = CFSTR("kTUCarPlayHardwareControlButtonNameKey");
      v28 = CFSTR("kTUCarPlayHardwareControlButtonWhiteTelephoneLongPress");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", a2, sel_longPressTimerFired_, v14, 0, 0.5);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = __HIDTouchEventCallback_longPressTimer;
      __HIDTouchEventCallback_longPressTimer = v15;
      goto LABEL_36;
    }
    if (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("Headset")))
    {
      if (v7 != 11)
        goto LABEL_37;
      eventNotificationForHeadsetTelephonyPage();
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else if (v7 == 11)
    {
      eventNotificationForTelephonyPage();
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v7 != 7)
        goto LABEL_37;
      eventNotificationForKeyboardOrKeypadPage();
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v14 = v17;
    if (v17)
    {
      -[NSObject userInfo](v17, "userInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "valueForKey:", CFSTR("kTUCarPlayHardwareControlButtonNameKey"));
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = (void *)v19;
        -[NSObject userInfo](v14, "userInfo");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "valueForKey:", CFSTR("kTUCarPlayHardwareControlButtonNameKey"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a2, "eventTypeToIgnore");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22 == v23)
        {
          objc_msgSend(a2, "setEventTypeToIgnore:", 0);
          TUDefaultLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v14;
            _os_log_impl(&dword_19A50D000, v16, OS_LOG_TYPE_DEFAULT, "TUHardwareControlsBroadcaster ignoring notification: %@", buf, 0xCu);
          }
LABEL_36:

          goto LABEL_37;
        }
      }
      else
      {

      }
      TUDefaultLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v14;
        _os_log_impl(&dword_19A50D000, v24, OS_LOG_TYPE_DEFAULT, "TUHardwareControlsBroadcaster sending hardware control notification: %@", buf, 0xCu);
      }

      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = ____HIDTouchEventCallback_block_invoke;
      v25[3] = &unk_1E38A1360;
      v26 = v14;
      v14 = v14;
      TUGuaranteeExecutionOnMainThreadAsync(v25);
      v16 = v26;
      goto LABEL_36;
    }
LABEL_37:

  }
}

void sub_19A5121FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A512A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A512ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A512DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A512FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id TUDefaultLog()
{
  if (TUDefaultLog_onceToken != -1)
    dispatch_once(&TUDefaultLog_onceToken, &__block_literal_global_31);
  return (id)TUDefaultLog_TUDefaultLog;
}

uint64_t TUObjectsAreEqualOrNil(unint64_t a1, uint64_t a2)
{
  if (a1 | a2)
    return objc_msgSend((id)a1, "isEqual:", a2);
  else
    return 1;
}

void sub_19A516854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A5175B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A517988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A519CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A519F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t TUShouldUseSuperboxTelephonyProvider()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "isInternalInstall"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "tu_defaults");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "BOOLForKey:", CFSTR("TUShouldUseSuperBoxTelephonyProvider"));

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

id getCHRecentCallClass()
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
  v0 = (void *)getCHRecentCallClass_softClass;
  v7 = getCHRecentCallClass_softClass;
  if (!getCHRecentCallClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCHRecentCallClass_block_invoke;
    v3[3] = &unk_1E38A1710;
    v3[4] = &v4;
    __getCHRecentCallClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19A51CE18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCHRecentCallClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!CallHistoryLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E38A1DA0;
    v5 = 0;
    CallHistoryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CallHistoryLibraryCore_frameworkLibrary)
    __getCHRecentCallClass_block_invoke_cold_1(&v3);
  result = objc_getClass("CHRecentCall");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCHRecentCallClass_block_invoke_cold_2();
  getCHRecentCallClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCHRecentCallClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!CallHistoryLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_1E38A4298;
    v5 = 0;
    CallHistoryLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!CallHistoryLibraryCore_frameworkLibrary_0)
    __getCHRecentCallClass_block_invoke_cold_1_0(&v3);
  result = objc_getClass("CHRecentCall");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCHRecentCallClass_block_invoke_cold_2_0();
  getCHRecentCallClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19A51D23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A51D484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _TUIsInternalInstall()
{
  return os_variant_has_internal_diagnostics();
}

uint64_t TUCallScreeningEnabled(void *a1, void *a2)
{
  uint64_t result;

  result = TUCallScreeningActivatable(a1, a2);
  if ((_DWORD)result)
    return TUCallScreeningDisabledUserDefault() ^ 1;
  return result;
}

uint64_t TUCallScreeningDisabledUserDefault()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "tu_defaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("CallScreeningDisabled"));

  return v1;
}

BOOL TUCallScreeningActivatable(void *a1, void *a2)
{
  TUFeatureFlags *v3;
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v3 = a1;
  v4 = a2;
  if (!v3)
    v3 = objc_alloc_init(TUFeatureFlags);
  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "deviceType") == 2 && TUCallScreeningEnabledForCurrentLocale(v3, v4))
  {
    objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((BOOLeanValueForKeyInServerBag((uint64_t)CFSTR("disable-call-screening"), v6) & 1) != 0
      || !-[TUFeatureFlags callScreeningEnabled](v3, "callScreeningEnabled")
      || (TUCallScreeningDisabledMDMProfile() & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      if (TULockdownModeEnabled_onceToken != -1)
        dispatch_once(&TULockdownModeEnabled_onceToken, &__block_literal_global_150);
      v7 = TULockdownModeEnabled_lockdownModeEnabled == 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t TUDisableLinks()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = BOOLeanValueForKeyInServerBag((uint64_t)CFSTR("disable-conversation-links"), v0);

  return v1;
}

uint64_t BOOLeanValueForKeyInServerBag(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "objectForKey:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

id TUISOCountryCodeForMCC(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;

  v1 = a1;
  v2 = v1;
  if (TUISOCountryCodeForMCC_once == -1)
  {
    if (v1)
      goto LABEL_3;
LABEL_9:
    v3 = 0;
    goto LABEL_10;
  }
  dispatch_once(&TUISOCountryCodeForMCC_once, &__block_literal_global_22);
  if (!v2)
    goto LABEL_9;
LABEL_3:
  objc_msgSend((id)TUISOCountryCodeForMCC_sCountryCodeCache, "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    TUCTServerConnection();
    v4 = _CTServerConnectionCopyISOForMCC();
    if (v4 == 0x2300000001 || (v5 = v4, !(_DWORD)v4))
    {
      v3 = 0;
      goto LABEL_10;
    }
    TUDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      TUISOCountryCodeForMCC_cold_1(v5, SHIDWORD(v5), v6);

    goto LABEL_9;
  }
LABEL_10:

  return v3;
}

uint64_t TUCallScreeningEnabledForCurrentLocale(void *a1, void *a2)
{
  TUFeatureFlags *v3;
  id v4;
  BOOL v5;
  _BOOL4 v6;
  id *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v15;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (!v3)
    v3 = objc_alloc_init(TUFeatureFlags);
  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("LVMAllowAllLocales"), CFSTR("com.apple.TelephonyUtilities"), &keyExistsAndHasValidFormat))
  {
    v5 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    v5 = 1;
  }
  if (v5)
  {
    v13 = v4;
    if (!v13)
    {
      TUCurrentLocaleIdentifier();
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v6 = -[TUFeatureFlags lvmExpansionLiveOnEnabled](v3, "lvmExpansionLiveOnEnabled");
    v7 = (id *)&TULVMAvailableLocales;
    if (v6)
      v7 = (id *)&TULVMExpansionAvailableLocalesF24;
    v8 = *v7;
    objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("lvm-supported-locales"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(","));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      TUDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v11;
        _os_log_impl(&dword_19A50D000, v12, OS_LOG_TYPE_DEFAULT, "Using LVMSupportedLocales from serverBag: %@", buf, 0xCu);
      }

    }
    else
    {
      v11 = v8;
    }
    v15 = objc_msgSend(v11, "containsObject:", v13);

  }
  else
  {
    TUDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v13, OS_LOG_TYPE_DEFAULT, "LVMAllowAllLocales set, allowing everything", buf, 2u);
    }
    v15 = 1;
  }

  return v15;
}

uint64_t TUCallScreeningDisabledMDMProfile()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isLiveVoicemailAllowed") ^ 1;

  return v1;
}

void sub_19A51FDF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  os_unfair_lock_s *v14;
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  os_unfair_lock_unlock(v14);
  _Unwind_Resume(a1);
}

void sub_19A51FF98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19A52041C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19A520660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19A520800(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_19A520B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19A520D94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t TUShouldCreateSuperboxProvider()
{
  uint64_t v0;
  void *v1;
  void *v2;

  if ((TUShouldUseSuperboxTelephonyProvider() & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "isInternalInstall"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "tu_defaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v0 = objc_msgSend(v2, "BOOLForKey:", CFSTR("TUShouldCreateSuperBoxProviderKey"));

  }
  else
  {
    v0 = 0;
  }

  return v0;
}

void sub_19A521F2C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 72));
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19A5221E0(_Unwind_Exception *a1)
{
  os_unfair_recursive_lock_unlock();
  _Unwind_Resume(a1);
}

void sub_19A5223B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A5224BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void TUGuaranteeExecutionOnMainThreadSync(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void (**block)(void);

  v1 = (void *)MEMORY[0x1E0CB3978];
  block = a1;
  objc_msgSend(v1, "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "mainThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
    block[2]();
  else
    dispatch_sync(MEMORY[0x1E0C80D38], block);

}

void sub_19A523748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19A5238B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A523A94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getPNRPhoneNumberResolverClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!PhoneNumberResolverLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E38A1748;
    v5 = 0;
    PhoneNumberResolverLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PhoneNumberResolverLibraryCore_frameworkLibrary)
    __getPNRPhoneNumberResolverClass_block_invoke_cold_1(&v3);
  result = objc_getClass("PNRPhoneNumberResolver");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPNRPhoneNumberResolverClass_block_invoke_cold_2();
  getPNRPhoneNumberResolverClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t TUCurrentProcessHasEntitlementCapability(void *a1)
{
  id v1;
  __SecTask *v2;
  __SecTask *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  CFErrorRef error;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  CFErrorRef v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (v2)
  {
    v3 = v2;
    error = 0;
    v4 = (void *)SecTaskCopyValueForEntitlement(v2, CFSTR("com.apple.telephonyutilities.callservicesd"), &error);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_msgSend(v4, "containsObject:", v1);
    }
    else
    {
      TUDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v11 = v4;
        v12 = 2112;
        v13 = CFSTR("com.apple.telephonyutilities.callservicesd");
        v14 = 2112;
        v15 = error;
        _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Unexpected value %@ for %@ entitlement: %@", buf, 0x20u);
      }

      v5 = 0;
    }
    CFRelease(v3);

  }
  else
  {
    TUDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "[WARN] Unexpected NULL value returned from SecTaskCreateFromSelf()", buf, 2u);
    }

    v5 = 0;
  }

  return v5;
}

uint64_t tu_tcc_identity_create(uint64_t a1, uint64_t a2)
{
  uint64_t (*v4)(uint64_t, uint64_t);
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v4 = (uint64_t (*)(uint64_t, uint64_t))gettcc_identity_createSymbolLoc_ptr;
  v10 = gettcc_identity_createSymbolLoc_ptr;
  if (!gettcc_identity_createSymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __gettcc_identity_createSymbolLoc_block_invoke;
    v6[3] = &unk_1E38A1710;
    v6[4] = &v7;
    __gettcc_identity_createSymbolLoc_block_invoke((uint64_t)v6);
    v4 = (uint64_t (*)(uint64_t, uint64_t))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v4)
    tu_tcc_identity_create_cold_1();
  return v4(a1, a2);
}

void sub_19A524068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__gettcc_identity_createSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!TCCLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E38A3000;
    v5 = 0;
    TCCLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!TCCLibraryCore_frameworkLibrary)
    __gettcc_identity_createSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)TCCLibraryCore_frameworkLibrary, "tcc_identity_create");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  gettcc_identity_createSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19A524410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x19AEC97C8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_19A525334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void TUAddTelephonyCenterObserver(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v5[9];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __TUAddTelephonyCenterObserver_block_invoke;
  v5[3] = &__block_descriptor_72_e5_v8__0l;
  v5[4] = a1;
  v5[5] = a2;
  v5[6] = a3;
  v5[7] = a4;
  v5[8] = a5;
  TUDispatchMainIfNecessaryAndWait(v5, 0);
}

void TUDispatchMainIfNecessaryAndWait(void *a1, int a2)
{
  void (**block)(void);

  block = a1;
  if (TUDispatchMainIfNecessaryAndWait_onceToken != -1)
    dispatch_once(&TUDispatchMainIfNecessaryAndWait_onceToken, &__block_literal_global_27);
  if (dispatch_get_specific((const void *)TUDispatchMainIfNecessaryAndWait_sMainQueueMarker))
  {
    block[2]();
  }
  else if (a2)
  {
    dispatch_sync(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

id getLockdownModeManagerClass()
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
  v0 = (void *)getLockdownModeManagerClass_softClass;
  v7 = getLockdownModeManagerClass_softClass;
  if (!getLockdownModeManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getLockdownModeManagerClass_block_invoke;
    v3[3] = &unk_1E38A1710;
    v3[4] = &v4;
    __getLockdownModeManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19A525C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLockdownModeManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!LockdownModeLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E38A2D68;
    v5 = 0;
    LockdownModeLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!LockdownModeLibraryCore_frameworkLibrary)
    __getLockdownModeManagerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("LockdownModeManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getLockdownModeManagerClass_block_invoke_cold_2();
  getLockdownModeManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getAVSystemController_UplinkMuteDidChangeNotification()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getAVSystemController_UplinkMuteDidChangeNotificationSymbolLoc_ptr;
  v6 = getAVSystemController_UplinkMuteDidChangeNotificationSymbolLoc_ptr;
  if (!getAVSystemController_UplinkMuteDidChangeNotificationSymbolLoc_ptr)
  {
    v1 = (void *)MediaExperienceLibrary();
    v0 = (id *)dlsym(v1, "AVSystemController_UplinkMuteDidChangeNotification");
    v4[3] = (uint64_t)v0;
    getAVSystemController_UplinkMuteDidChangeNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getAVSystemController_UplinkMuteDidChangeNotification_cold_1();
  return *v0;
}

void sub_19A52675C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getAVSystemController_UplinkMuteAttribute()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getAVSystemController_UplinkMuteAttributeSymbolLoc_ptr;
  v6 = getAVSystemController_UplinkMuteAttributeSymbolLoc_ptr;
  if (!getAVSystemController_UplinkMuteAttributeSymbolLoc_ptr)
  {
    v1 = (void *)MediaExperienceLibrary();
    v0 = (id *)dlsym(v1, "AVSystemController_UplinkMuteAttribute");
    v4[3] = (uint64_t)v0;
    getAVSystemController_UplinkMuteAttributeSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getAVSystemController_UplinkMuteAttribute_cold_1();
  return *v0;
}

void sub_19A5267F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getAVSystemController_SystemVolumeDidChangeNotification()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getAVSystemController_SystemVolumeDidChangeNotificationSymbolLoc_ptr;
  v6 = getAVSystemController_SystemVolumeDidChangeNotificationSymbolLoc_ptr;
  if (!getAVSystemController_SystemVolumeDidChangeNotificationSymbolLoc_ptr)
  {
    v1 = (void *)MediaExperienceLibrary();
    v0 = (id *)dlsym(v1, "AVSystemController_SystemVolumeDidChangeNotification");
    v4[3] = (uint64_t)v0;
    getAVSystemController_SystemVolumeDidChangeNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getAVSystemController_SystemVolumeDidChangeNotification_cold_1();
  return *v0;
}

void sub_19A52688C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getAVSystemController_PickableRoutesDidChangeNotification()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getAVSystemController_PickableRoutesDidChangeNotificationSymbolLoc_ptr;
  v6 = getAVSystemController_PickableRoutesDidChangeNotificationSymbolLoc_ptr;
  if (!getAVSystemController_PickableRoutesDidChangeNotificationSymbolLoc_ptr)
  {
    v1 = (void *)MediaExperienceLibrary();
    v0 = (id *)dlsym(v1, "AVSystemController_PickableRoutesDidChangeNotification");
    v4[3] = (uint64_t)v0;
    getAVSystemController_PickableRoutesDidChangeNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getAVSystemController_PickableRoutesDidChangeNotification_cold_1();
  return *v0;
}

void sub_19A526924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getAVSystemController_PickableRoutesAttribute()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getAVSystemController_PickableRoutesAttributeSymbolLoc_ptr;
  v6 = getAVSystemController_PickableRoutesAttributeSymbolLoc_ptr;
  if (!getAVSystemController_PickableRoutesAttributeSymbolLoc_ptr)
  {
    v1 = (void *)MediaExperienceLibrary();
    v0 = (id *)dlsym(v1, "AVSystemController_PickableRoutesAttribute");
    v4[3] = (uint64_t)v0;
    getAVSystemController_PickableRoutesAttributeSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getAVSystemController_PickableRoutesAttribute_cold_1();
  return *v0;
}

void sub_19A5269BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getAVSystemController_DownlinkMuteAttribute()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getAVSystemController_DownlinkMuteAttributeSymbolLoc_ptr;
  v6 = getAVSystemController_DownlinkMuteAttributeSymbolLoc_ptr;
  if (!getAVSystemController_DownlinkMuteAttributeSymbolLoc_ptr)
  {
    v1 = (void *)MediaExperienceLibrary();
    v0 = (id *)dlsym(v1, "AVSystemController_DownlinkMuteAttribute");
    v4[3] = (uint64_t)v0;
    getAVSystemController_DownlinkMuteAttributeSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getAVSystemController_DownlinkMuteAttribute_cold_1();
  return *v0;
}

void sub_19A526A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getAVSystemControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  MediaExperienceLibrary();
  result = objc_getClass("AVSystemController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAVSystemControllerClass_block_invoke_cold_1();
  getAVSystemControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id TUNetworkCountryCode()
{
  return (id)CPPhoneNumberCopyNetworkCountryCode();
}

uint64_t TUCallScreeningEnabledM3(void *a1)
{
  TUFeatureFlags *v1;
  uint64_t v2;

  v1 = a1;
  if (!v1)
    v1 = objc_alloc_init(TUFeatureFlags);
  v2 = TUCallScreeningActivatable(v1, 0)
    && (TUCallScreeningDisabledUserDefault() & 1) == 0
    && -[TUFeatureFlags callScreeningEnabledM3](v1, "callScreeningEnabledM3");

  return v2;
}

uint64_t MediaExperienceLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!MediaExperienceLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E38A2780;
    v3 = 0;
    MediaExperienceLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MediaExperienceLibraryCore_frameworkLibrary)
    MediaExperienceLibrary_cold_1(&v1);
  return MediaExperienceLibraryCore_frameworkLibrary;
}

uint64_t MediaExperienceLibrary_0()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!MediaExperienceLibraryCore_frameworkLibrary_0)
  {
    v2 = xmmword_1E38A2AF0;
    v3 = 0;
    MediaExperienceLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!MediaExperienceLibraryCore_frameworkLibrary_0)
    MediaExperienceLibrary_cold_1_0(&v1);
  return MediaExperienceLibraryCore_frameworkLibrary_0;
}

uint64_t sub_19A527078(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t CarrierVoiceSpamReportHelper.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 24);
  v1 = v0 + OBJC_IVAR____TtC18TelephonyUtilities28CarrierVoiceSpamReportHelper_logger;
  v2 = sub_19A637A74();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();

  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_19A527150()
{
  uint64_t result;
  unint64_t v1;

  result = sub_19A637A74();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for CarrierVoiceSpamReportHelper()
{
  uint64_t result;

  result = qword_1EE3A68E8;
  if (!qword_1EE3A68E8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t CarrierVoiceSpamReportHelper.init(voiceSpamReportTelephonyManager:featureFlags:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  sub_19A637A68();
  *(_QWORD *)(v2 + OBJC_IVAR____TtC18TelephonyUtilities28CarrierVoiceSpamReportHelper_metricsDictionary) = MEMORY[0x1E0DEE9E0];
  v5 = OBJC_IVAR____TtC18TelephonyUtilities28CarrierVoiceSpamReportHelper_dateFormatter;
  *(_QWORD *)(v2 + v5) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3578]), sel_init);
  type metadata accessor for AnalyticsLogger();
  v6 = swift_allocObject();
  v7 = OBJC_IVAR____TtC18TelephonyUtilities28CarrierVoiceSpamReportHelper_analyticsLogger;
  sub_19A637A68();
  *(_QWORD *)(v2 + v7) = v6;
  sub_19A62E8D4(a1, v2 + 24);
  *(_QWORD *)(v2 + 16) = a2;
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97298]), sel_init);
  __swift_destroy_boxed_opaque_existential_0(a1);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC18TelephonyUtilities28CarrierVoiceSpamReportHelper_contactStore) = v8;
  return v2;
}

uint64_t AnalyticsLogger.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC18TelephonyUtilities15AnalyticsLogger_logger;
  v2 = sub_19A637A74();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_19A5273E0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_19A637A74();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for AnalyticsLogger()
{
  uint64_t result;

  result = qword_1EE3A6898;
  if (!qword_1EE3A6898)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_19A527488()
{
  uint64_t result;
  unint64_t v1;

  result = sub_19A637A74();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for VoiceSpamReportTelephonyManager()
{
  uint64_t result;

  result = qword_1EE3A6880;
  if (!qword_1EE3A6880)
    return swift_getSingletonMetadata();
  return result;
}

_QWORD *sub_19A527554()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A6C60);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_19A65E0B0;
  strcpy((char *)(v2 + 32), "PhoneSettings");
  *(_WORD *)(v2 + 46) = -4864;
  *(_QWORD *)(v2 + 48) = 0xD000000000000021;
  *(_QWORD *)(v2 + 56) = 0x800000019A65D8B0;
  v0[2] = v2;
  v0[3] = 0x4E72656972726143;
  v0[4] = 0xEB00000000656D61;
  sub_19A637A68();
  sub_19A527078(0, (unint64_t *)&unk_1EE3A68F8);
  v3 = (void *)sub_19A637BD0();
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CA6E38]), sel_initWithQueue_, v3);

  *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC18TelephonyUtilities31VoiceSpamReportTelephonyManager_ctClient) = v4;
  return v1;
}

_QWORD *sub_19A527698()
{
  uint64_t v0;
  _QWORD *result;

  type metadata accessor for VoiceSpamReportTelephonyManager();
  v0 = swift_allocObject();
  result = sub_19A527554();
  qword_1EE3A6868 = v0;
  return result;
}

uint64_t static VoiceSpamReportTelephonyManager.shared.getter()
{
  if (qword_1EE3A6878 != -1)
    swift_once();
  return swift_retain();
}

void sub_19A528158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id eventNotificationForKeyboardOrKeypadPage()
{
  void *v0;
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (IOHIDEventGetIntegerValue() != 42)
    return 0;
  v0 = (void *)MEMORY[0x1E0CB37C0];
  v4 = CFSTR("kTUCarPlayHardwareControlButtonNameKey");
  v5[0] = CFSTR("kTUCarPlayHardwareControlButtonDelete");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "notificationWithName:object:userInfo:", CFSTR("TUCarPlayHardwareControlEventNotification"), 0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id eventNotificationForTelephonyPage()
{
  uint64_t IntegerValue;
  void *v1;
  void *v2;
  const __CFString **v3;
  const __CFString **v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  IntegerValue = IOHIDEventGetIntegerValue();
  v1 = 0;
  if (IntegerValue <= 46)
  {
    switch(IntegerValue)
    {
      case ' ':
        v38 = CFSTR("kTUCarPlayHardwareControlButtonNameKey");
        v39[0] = CFSTR("kTUCarPlayHardwareControlButtonGreenTelephone");
        v2 = (void *)MEMORY[0x1E0C99D80];
        v3 = (const __CFString **)v39;
        v4 = &v38;
        break;
      case '!':
        v36 = CFSTR("kTUCarPlayHardwareControlButtonNameKey");
        v37 = CFSTR("kTUCarPlayHardwareControlButtonWhiteTelephone");
        v2 = (void *)MEMORY[0x1E0C99D80];
        v3 = &v37;
        v4 = &v36;
        break;
      case '&':
        v34 = CFSTR("kTUCarPlayHardwareControlButtonNameKey");
        v35 = CFSTR("kTUCarPlayHardwareControlButtonRedTelephone");
        v2 = (void *)MEMORY[0x1E0C99D80];
        v3 = &v35;
        v4 = &v34;
        break;
      default:
        goto LABEL_26;
    }
  }
  else
  {
    switch(IntegerValue)
    {
      case 176:
        v30[0] = CFSTR("kTUCarPlayHardwareControlButtonNameKey");
        v30[1] = CFSTR("kTUCarPlayHardwareControlKeypadValueKey");
        v31[0] = CFSTR("kTUCarPlayHardwareControlButtonKeypad");
        v31[1] = CFSTR("0");
        v2 = (void *)MEMORY[0x1E0C99D80];
        v3 = (const __CFString **)v31;
        v4 = (const __CFString **)v30;
        goto LABEL_24;
      case 177:
        v28[0] = CFSTR("kTUCarPlayHardwareControlButtonNameKey");
        v28[1] = CFSTR("kTUCarPlayHardwareControlKeypadValueKey");
        v29[0] = CFSTR("kTUCarPlayHardwareControlButtonKeypad");
        v29[1] = CFSTR("1");
        v2 = (void *)MEMORY[0x1E0C99D80];
        v3 = (const __CFString **)v29;
        v4 = (const __CFString **)v28;
        goto LABEL_24;
      case 178:
        v26[0] = CFSTR("kTUCarPlayHardwareControlButtonNameKey");
        v26[1] = CFSTR("kTUCarPlayHardwareControlKeypadValueKey");
        v27[0] = CFSTR("kTUCarPlayHardwareControlButtonKeypad");
        v27[1] = CFSTR("2");
        v2 = (void *)MEMORY[0x1E0C99D80];
        v3 = (const __CFString **)v27;
        v4 = (const __CFString **)v26;
        goto LABEL_24;
      case 179:
        v24[0] = CFSTR("kTUCarPlayHardwareControlButtonNameKey");
        v24[1] = CFSTR("kTUCarPlayHardwareControlKeypadValueKey");
        v25[0] = CFSTR("kTUCarPlayHardwareControlButtonKeypad");
        v25[1] = CFSTR("3");
        v2 = (void *)MEMORY[0x1E0C99D80];
        v3 = (const __CFString **)v25;
        v4 = (const __CFString **)v24;
        goto LABEL_24;
      case 180:
        v22[0] = CFSTR("kTUCarPlayHardwareControlButtonNameKey");
        v22[1] = CFSTR("kTUCarPlayHardwareControlKeypadValueKey");
        v23[0] = CFSTR("kTUCarPlayHardwareControlButtonKeypad");
        v23[1] = CFSTR("4");
        v2 = (void *)MEMORY[0x1E0C99D80];
        v3 = (const __CFString **)v23;
        v4 = (const __CFString **)v22;
        goto LABEL_24;
      case 181:
        v20[0] = CFSTR("kTUCarPlayHardwareControlButtonNameKey");
        v20[1] = CFSTR("kTUCarPlayHardwareControlKeypadValueKey");
        v21[0] = CFSTR("kTUCarPlayHardwareControlButtonKeypad");
        v21[1] = CFSTR("5");
        v2 = (void *)MEMORY[0x1E0C99D80];
        v3 = (const __CFString **)v21;
        v4 = (const __CFString **)v20;
        goto LABEL_24;
      case 182:
        v18[0] = CFSTR("kTUCarPlayHardwareControlButtonNameKey");
        v18[1] = CFSTR("kTUCarPlayHardwareControlKeypadValueKey");
        v19[0] = CFSTR("kTUCarPlayHardwareControlButtonKeypad");
        v19[1] = CFSTR("6");
        v2 = (void *)MEMORY[0x1E0C99D80];
        v3 = (const __CFString **)v19;
        v4 = (const __CFString **)v18;
        goto LABEL_24;
      case 183:
        v16[0] = CFSTR("kTUCarPlayHardwareControlButtonNameKey");
        v16[1] = CFSTR("kTUCarPlayHardwareControlKeypadValueKey");
        v17[0] = CFSTR("kTUCarPlayHardwareControlButtonKeypad");
        v17[1] = CFSTR("7");
        v2 = (void *)MEMORY[0x1E0C99D80];
        v3 = (const __CFString **)v17;
        v4 = (const __CFString **)v16;
        goto LABEL_24;
      case 184:
        v14[0] = CFSTR("kTUCarPlayHardwareControlButtonNameKey");
        v14[1] = CFSTR("kTUCarPlayHardwareControlKeypadValueKey");
        v15[0] = CFSTR("kTUCarPlayHardwareControlButtonKeypad");
        v15[1] = CFSTR("8");
        v2 = (void *)MEMORY[0x1E0C99D80];
        v3 = (const __CFString **)v15;
        v4 = (const __CFString **)v14;
        goto LABEL_24;
      case 185:
        v12[0] = CFSTR("kTUCarPlayHardwareControlButtonNameKey");
        v12[1] = CFSTR("kTUCarPlayHardwareControlKeypadValueKey");
        v13[0] = CFSTR("kTUCarPlayHardwareControlButtonKeypad");
        v13[1] = CFSTR("9");
        v2 = (void *)MEMORY[0x1E0C99D80];
        v3 = (const __CFString **)v13;
        v4 = (const __CFString **)v12;
        goto LABEL_24;
      case 186:
        v8[0] = CFSTR("kTUCarPlayHardwareControlButtonNameKey");
        v8[1] = CFSTR("kTUCarPlayHardwareControlKeypadValueKey");
        v9[0] = CFSTR("kTUCarPlayHardwareControlButtonKeypad");
        v9[1] = CFSTR("*");
        v2 = (void *)MEMORY[0x1E0C99D80];
        v3 = (const __CFString **)v9;
        v4 = (const __CFString **)v8;
        goto LABEL_24;
      case 187:
        v10[0] = CFSTR("kTUCarPlayHardwareControlButtonNameKey");
        v10[1] = CFSTR("kTUCarPlayHardwareControlKeypadValueKey");
        v11[0] = CFSTR("kTUCarPlayHardwareControlButtonKeypad");
        v11[1] = CFSTR("#");
        v2 = (void *)MEMORY[0x1E0C99D80];
        v3 = (const __CFString **)v11;
        v4 = (const __CFString **)v10;
LABEL_24:
        v5 = 2;
        goto LABEL_25;
      default:
        if (IntegerValue != 47)
          goto LABEL_26;
        v32 = CFSTR("kTUCarPlayHardwareControlButtonNameKey");
        v33 = CFSTR("kTUCarPlayHardwareControlButtonMute");
        v2 = (void *)MEMORY[0x1E0C99D80];
        v3 = &v33;
        v4 = &v32;
        break;
    }
  }
  v5 = 1;
LABEL_25:
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v3, v4, v5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("TUCarPlayHardwareControlEventNotification"), 0, v1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id eventNotificationForHeadsetTelephonyPage()
{
  void *v0;
  void *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (IOHIDEventGetIntegerValue() == 33)
  {
    v3 = CFSTR("kTUHeadsetHardwareControlButtonNameKey");
    v4[0] = CFSTR("kTUHeadsetHardwareControlButtonWhiteTelephone");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v0 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("TUHeadsetHardwareControlEventNotification"), 0, v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void sub_19A52B21C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19A52B588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19A52B8F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19A52BC88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_19A52BF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19A52C2F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19A52C678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19A52CA24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19A52CDDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19A52D194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19A52D52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19A52DA18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19A52DC2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19A52E12C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_19A532B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A532DF8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

id getSWCollaborationHighlightClass()
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
  v0 = (void *)getSWCollaborationHighlightClass_softClass;
  v7 = getSWCollaborationHighlightClass_softClass;
  if (!getSWCollaborationHighlightClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSWCollaborationHighlightClass_block_invoke;
    v3[3] = &unk_1E38A1710;
    v3[4] = &v4;
    __getSWCollaborationHighlightClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19A532FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSWHighlightCenterClass_block_invoke(uint64_t a1)
{
  Class result;

  SharedWithYouLibrary();
  result = objc_getClass("SWHighlightCenter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSWHighlightCenterClass_block_invoke_cold_1();
  getSWHighlightCenterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void SharedWithYouLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!SharedWithYouLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_1E38A1730;
    v2 = 0;
    SharedWithYouLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SharedWithYouLibraryCore_frameworkLibrary)
    SharedWithYouLibrary_cold_1(&v0);
}

Class __getSWCollaborationHighlightClass_block_invoke(uint64_t a1)
{
  Class result;

  SharedWithYouLibrary();
  result = objc_getClass("SWCollaborationHighlight");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSWCollaborationHighlightClass_block_invoke_cold_1();
  getSWCollaborationHighlightClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id legacySchemeIfEnabled(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  if (tuFeatureFlags_once != -1)
    dispatch_once(&tuFeatureFlags_once, &__block_literal_global_2);
  if ((objc_msgSend((id)tuFeatureFlags_sFeatureFlags, "faceTimeLegacyAppEnabled") & 1) != 0)
  {
    objc_msgSend(v1, "stringByAppendingString:", CFSTR("-legacy"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = v1;
  }
  v3 = v2;

  return v3;
}

id _FormatDestinationID(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "destinationIdIsPhoneNumber"))
  {
    IMFormatPhoneNumber();
    v2 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v2;
  }
  return v1;
}

void __tuFeatureFlags_block_invoke()
{
  TUFeatureFlags *v0;
  void *v1;

  v0 = objc_alloc_init(TUFeatureFlags);
  v1 = (void *)tuFeatureFlags_sFeatureFlags;
  tuFeatureFlags_sFeatureFlags = (uint64_t)v0;

}

void sub_19A53C90C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19A541274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19A543660(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

id TUPhoneNumberNormalizedPhoneNumberString(uint64_t a1, void *a2)
{
  id v2;
  const __CFString *v3;
  const __CFString *v4;
  uint64_t v5;
  const void *v6;
  void *String;

  v2 = a2;
  v3 = (const __CFString *)_PNCopyStrippedNumberWithoutPauses();
  if (v3)
  {
    v4 = v3;
    if (CFStringGetLength(v3) < 1)
    {
      String = 0;
    }
    else
    {
      v5 = CFPhoneNumberCreate();
      if (!v5 || (v6 = (const void *)v5, String = (void *)CFPhoneNumberCreateString(), CFRelease(v6), !String))
      {
        CFRetain(v4);
        String = (void *)v4;
      }
    }
    CFRelease(v4);
  }
  else
  {
    String = 0;
  }

  return String;
}

uint64_t TUDialAssistIsEnabled(void *a1)
{
  id v1;
  uint64_t v2;
  BOOL v3;
  TUCoreTelephonyClient *v4;
  void *v5;
  int v6;
  BOOL v7;
  NSObject *v8;
  uint8_t v11[15];
  Boolean keyExistsAndHasValidFormat;

  v1 = a1;
  if (TUDialAssistEnabledOverride)
  {
    v2 = 1;
  }
  else if (MGGetBoolAnswer())
  {
    +[TUDialAssist sharedInstance](TUDialAssist, "sharedInstance");

    keyExistsAndHasValidFormat = 0;
    if (CFPreferencesGetAppBooleanValue(CFSTR("ForceInternationalAssist"), TUDialAssistDomain, &keyExistsAndHasValidFormat))
    {
      v3 = keyExistsAndHasValidFormat == 0;
    }
    else
    {
      v3 = 1;
    }
    if (v3)
    {
      v4 = [TUCoreTelephonyClient alloc];
      v8 = -[TUCoreTelephonyClient initWithQueue:](v4, "initWithQueue:", MEMORY[0x1E0C80D38]);
      objc_msgSend(v1, "UUIDString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[NSObject isDialAssistSupportedForSubscriptionLabelIdentifier:error:](v8, "isDialAssistSupportedForSubscriptionLabelIdentifier:error:", v5, 0);

      if (v6)
      {
        if (CFPreferencesGetAppBooleanValue(CFSTR("enable-dial-assist"), TUDialAssistDomain, &keyExistsAndHasValidFormat))
        {
          v7 = 1;
        }
        else
        {
          v7 = keyExistsAndHasValidFormat == 0;
        }
        v2 = v7;
      }
      else
      {
        v2 = 0;
      }
    }
    else
    {
      TUDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "International assist forced; overriding carrier bundle check",
          v11,
          2u);
      }
      v2 = 1;
    }

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id TUNumberToDial(void *a1, void *a2, void *a3, void *a4, _BYTE *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  TUDefaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138413058;
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    v30 = 2112;
    v31 = v11;
    v32 = 2112;
    v33 = v12;
    _os_log_impl(&dword_19A50D000, v13, OS_LOG_TYPE_DEFAULT, "Calling: TUNumberToDial(inputNumber=%@, inputCountryCode=%@, outputCountryCode=%@, options=%@)", (uint8_t *)&v26, 0x2Au);
  }

  if (v10)
  {
    if (v11)
      goto LABEL_5;
LABEL_24:
    TUDefaultLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)CPPhoneNumberCopyNetworkCountryCode();
      v26 = 138412290;
      v27 = v25;
      _os_log_impl(&dword_19A50D000, v24, OS_LOG_TYPE_DEFAULT, "No output country code provided, assuming network country code: %@", (uint8_t *)&v26, 0xCu);

    }
    v11 = (id)CPPhoneNumberCopyNetworkCountryCode();
    if (a5)
      goto LABEL_6;
    goto LABEL_7;
  }
  TUDefaultLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (void *)CPPhoneNumberCopyHomeCountryCode();
    v26 = 138412290;
    v27 = v23;
    _os_log_impl(&dword_19A50D000, v22, OS_LOG_TYPE_DEFAULT, "No input country code provided, assuming home country code: %@", (uint8_t *)&v26, 0xCu);

  }
  v10 = (id)CPPhoneNumberCopyHomeCountryCode();
  if (!v11)
    goto LABEL_24;
LABEL_5:
  if (a5)
LABEL_6:
    *a5 = 0;
LABEL_7:
  if (v9 && objc_msgSend(v9, "length"))
  {
    v14 = v9;
    if (v10 && v11)
    {
      TUDefaultLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_19A50D000, v15, OS_LOG_TYPE_DEFAULT, "Invoking dial assist...", (uint8_t *)&v26, 2u);
      }

      objc_msgSend(v12, "valueForKey:", TUNumberToDialOptionsSuppressLocalAssistKey);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "BOOLValue");

      _TUNumberToDialForNumber(v14, v10, v11, v17, a5);
      v18 = objc_claimAutoreleasedReturnValue();

      v14 = (id)v18;
    }
    TUDefaultLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 138412290;
      v27 = v14;
      _os_log_impl(&dword_19A50D000, v19, OS_LOG_TYPE_DEFAULT, "Returning %@", (uint8_t *)&v26, 0xCu);
    }

  }
  else
  {
    TUDefaultLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_19A50D000, v20, OS_LOG_TYPE_DEFAULT, "Non-existent or empty number", (uint8_t *)&v26, 2u);
    }

    v14 = v9;
  }

  return v14;
}

id TUHomeCountryCode()
{
  return (id)CPPhoneNumberCopyHomeCountryCode();
}

id _TUNumberToDialForNumber(void *a1, void *a2, void *a3, int a4, _BYTE *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  const char *v17;
  uint64_t (*v18)(uint64_t, unsigned __int8 *);
  char valid;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  unsigned __int8 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  TUNumberWithOldStylePausesTransformed(v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (PNIsValidPhoneNumberForCountry())
  {
    v13 = v12;

    v9 = v13;
  }
  v14 = objc_msgSend(v10, "isEqualToString:", v11);
  TUDefaultLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (a4)
    {
      if (v16)
      {
        *(_DWORD *)buf = 138412546;
        v29 = v10;
        v30 = 2112;
        v31 = v11;
        v17 = "Home country code %@ is equal to our active country code %@, but we were asked to suppress local assist.";
LABEL_25:
        _os_log_impl(&dword_19A50D000, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 0x16u);
        goto LABEL_26;
      }
      goto LABEL_26;
    }
    if (v16)
    {
      *(_DWORD *)buf = 138412546;
      v29 = v10;
      v30 = 2112;
      v31 = v11;
      _os_log_impl(&dword_19A50D000, v15, OS_LOG_TYPE_DEFAULT, "Home country code %@ is equal to our active country code %@.  We'll use local assist function.", buf, 0x16u);
    }
    v18 = (uint64_t (*)(uint64_t, unsigned __int8 *))MEMORY[0x1E0D17828];
  }
  else
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412546;
      v29 = v10;
      v30 = 2112;
      v31 = v11;
      _os_log_impl(&dword_19A50D000, v15, OS_LOG_TYPE_DEFAULT, "Our home country code %@ is not equal to active country code %@.  We'll use international assist function.", buf, 0x16u);
    }
    v18 = (uint64_t (*)(uint64_t, unsigned __int8 *))MEMORY[0x1E0D17818];
  }

  valid = PNIsValidPhoneNumberForCountry();
  TUDefaultLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if ((valid & 1) == 0)
  {
    if (v20)
    {
      *(_DWORD *)buf = 138412546;
      v29 = v9;
      v30 = 2112;
      v31 = v10;
      v17 = "PN says number %@ is not valid for home country %@.  Returning early with no assist.";
      goto LABEL_25;
    }
LABEL_26:

LABEL_31:
    v23 = v9;
    goto LABEL_32;
  }
  if (v20)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v15, OS_LOG_TYPE_DEFAULT, "Number looks valid.  Applying assist.", buf, 2u);
  }

  v21 = CFPhoneNumberCreate();
  if (!v21)
  {
LABEL_28:
    TUDefaultLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v9;
      _os_log_impl(&dword_19A50D000, v25, OS_LOG_TYPE_DEFAULT, "Returning %@", buf, 0xCu);
    }

    goto LABEL_31;
  }
  v22 = (void *)v21;
  v27 = 0;
  v23 = (id)v18(v21, &v27);
  TUDefaultLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v29 = v22;
    v30 = 2112;
    v31 = v23;
    v32 = 1024;
    v33 = v27;
    _os_log_impl(&dword_19A50D000, v24, OS_LOG_TYPE_DEFAULT, "Assist function with input (%@) yielded %@, didAssist = %d", buf, 0x1Cu);
  }

  CFRelease(v22);
  if (!v27 || !v23)
  {

    goto LABEL_28;
  }
  if (a5)
    *a5 = 1;
LABEL_32:

  return v23;
}

id TUActiveCountryCode()
{
  return (id)CPPhoneNumberCopyActiveCountryCode();
}

id TUCountryCodeForIncomingCall()
{
  return (id)CPPhoneNumberCopyCountryCodeForIncomingVoiceCall();
}

id TUDialAssistedDialRequest(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  v2 = (void *)CPPhoneNumberCopyHomeCountryCode();
  v3 = (void *)CPPhoneNumberCopyNetworkCountryCode();
  _TUDialAssistedDialRequestUsingCountryCodes(v1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id _TUDialAssistedDialRequestUsingCountryCodes(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  TUFeatureFlags *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int IsEnabled;
  void *v17;
  int v18;
  id v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  id v27;
  void *v28;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  TUHandle *v36;
  void *v37;
  TUHandle *v38;
  int v39;
  char valid;
  void *v41;
  void *v42;
  void *v43;
  TUHandle *v44;
  void *v45;
  TUHandle *v46;
  void *v47;
  NSObject *v48;
  int v49;
  int v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  unsigned __int8 v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  _BOOL4 v59;
  __int16 v60;
  int v61;
  __int16 v62;
  _BOOL4 v63;
  __int16 v64;
  int v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v54 = a3;
  v7 = objc_alloc_init(TUFeatureFlags);
  if (!-[TUFeatureFlags groupConversations](v7, "groupConversations")
    || (objc_msgSend(v5, "provider"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "supportsDynamicSystemUI"),
        v8,
        !v9))
  {
    v10 = (id)objc_msgSend(v5, "copy");
    objc_msgSend(v5, "localSenderIdentityAccountUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v53 = v11;
    }
    else
    {
      objc_msgSend(v5, "provider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "prioritizedSenderIdentities");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "accountUUID");
      v53 = (id)objc_claimAutoreleasedReturnValue();

    }
    IsEnabled = TUDialAssistIsEnabled(v53);
    objc_msgSend(v10, "handle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10
      || (objc_msgSend(v10, "isDialAssisted") & 1) != 0
      || (objc_msgSend(v17, "type") == 2 ? (v18 = IsEnabled) : (v18 = 0), v18 != 1))
    {
      TUDefaultLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v17;
        v26 = objc_msgSend(v5, "isDialAssisted");
        objc_msgSend(v10, "handle");
        v52 = v10;
        v27 = v6;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v57 = v5;
        v58 = 1024;
        v59 = v5 == 0;
        v60 = 1024;
        v61 = v26;
        v17 = v25;
        v62 = 1024;
        v63 = objc_msgSend(v28, "type") != 2;
        v64 = 1024;
        v65 = IsEnabled ^ 1;
        _os_log_impl(&dword_19A50D000, v24, OS_LOG_TYPE_DEFAULT, "Not attempting dial assist for dial request %@ because request is nil (%d) or dial request is dialAssisted (%d) or handle is not a phone number (%d) dial assist is not enabled (%d)", buf, 0x24u);

        v6 = v27;
        v10 = v52;
      }

      goto LABEL_20;
    }
    v19 = v6;
    v55 = 0;
    v20 = objc_msgSend(v10, "performLocalDialAssist");
    if (!v54 || !v20)
    {
      if ((objc_msgSend(v10, "performDialAssist") & 1) != 0)
        goto LABEL_23;
      v39 = 0;
      goto LABEL_43;
    }
    objc_msgSend(v17, "value");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    TUNumberWithOldStylePausesTransformed(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = v17;
    objc_msgSend(v17, "value");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((PNIsValidPhoneNumberForCountry() & 1) != 0)
    {

    }
    else
    {
      valid = PNIsValidPhoneNumberForCountry();

      if ((valid & 1) == 0)
      {
        v39 = 0;
        goto LABEL_36;
      }
    }
    objc_msgSend(v10, "handle");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "value");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    TUNumberToDial(v42, v54, v54, 0, &v55);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      v44 = [TUHandle alloc];
      objc_msgSend(v51, "siriDisplayName");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = -[TUHandle initWithType:value:siriDisplayName:](v44, "initWithType:value:siriDisplayName:", 2, v43, v45);
      objc_msgSend(v10, "setHandle:", v46);

    }
    else
    {
      objc_msgSend(v10, "setHandle:", 0);
    }

    v39 = 1;
LABEL_36:
    v17 = v51;

    if (!v55 && (objc_msgSend(v10, "performDialAssist") & 1) != 0)
    {
      if ((v39 & 1) != 0)
      {
        objc_msgSend(v5, "contactIdentifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = v19;
        if (!v47)
        {
LABEL_47:
          objc_msgSend(v10, "setDialAssisted:", v55);
LABEL_20:

          goto LABEL_21;
        }
        TUDefaultLog();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19A50D000, v48, OS_LOG_TYPE_DEFAULT, "Dial assisting because the request matches a contact card", buf, 2u);
        }

        objc_msgSend(v10, "handle");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "value");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        v34 = v19;
        goto LABEL_26;
      }
LABEL_23:
      v51 = v17;
      TUDefaultLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19A50D000, v30, OS_LOG_TYPE_DEFAULT, "Dial assisting because the request is not valid for the local network", buf, 2u);
      }

      objc_msgSend(v10, "handle");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "value");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v6 = v19;
      v34 = v19;
LABEL_26:
      TUNumberToDial(v32, v34, v54, 0, &v55);
      v35 = objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        v36 = [TUHandle alloc];
        objc_msgSend(v51, "siriDisplayName");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = -[TUHandle initWithType:value:siriDisplayName:](v36, "initWithType:value:siriDisplayName:", 2, v35, v37);
        objc_msgSend(v10, "setHandle:", v38);

      }
      else
      {
        objc_msgSend(v10, "setHandle:", 0);
      }
      v17 = v51;
LABEL_46:

      goto LABEL_47;
    }
LABEL_43:
    TUDefaultLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v49 = v55;
      v50 = objc_msgSend(v10, "performDialAssist");
      *(_DWORD *)buf = 138413058;
      v57 = v5;
      v58 = 1024;
      v59 = v49;
      v60 = 1024;
      v61 = v50 ^ 1;
      v62 = 1024;
      v63 = v39;
      _os_log_impl(&dword_19A50D000, v35, OS_LOG_TYPE_DEFAULT, "Not dial assisting for dial request %@, because is was local assisted (%d) or dial assist was not requested (%d) or is a valid number for the local network already (%d)", buf, 0x1Eu);
    }
    v6 = v19;
    goto LABEL_46;
  }
  v10 = v5;
LABEL_21:

  return v10;
}

void sub_19A547B48(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19A548950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A548B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A548DC8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_19A54970C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A54DD70(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_19A54DFF0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 64));
  _Unwind_Resume(a1);
}

void sub_19A553A94(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_ptr;
  v6 = getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_ptr;
  if (!getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_block_invoke;
    v2[3] = &unk_1E38A1710;
    v2[4] = &v3;
    __getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_block_invoke((uint64_t)v2);
    v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A563038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!IMCoreLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E38A2288;
    v5 = 0;
    IMCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IMCoreLibraryCore_frameworkLibrary)
    __getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)IMCoreLibraryCore_frameworkLibrary, "IMSPIGetGroupPhotosForChatsWithGroupIDs");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t TUCallCenterVideoCallPredicate_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isVideo");
}

uint64_t TUCallCenterHostedOnCurrentDevicePredicate_block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHostedOnCurrentDevice");
}

uint64_t TUCallCenterEndpointOnCurrentDevicePredicate_block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEndpointOnCurrentDevice");
}

uint64_t TUCallCenterHostedOnOrEndpointOnCurrentDevicePredicate_block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isHostedOnCurrentDevice") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isEndpointOnCurrentDevice");

  return v3;
}

uint64_t TUCallCenterCallOnDefaultPairedDevicePredicate_block_invoke_6(uint64_t a1, void *a2)
{
  return TUCallCenterHostedOnOrEndpointOnCurrentDevicePredicate_block_invoke_5(a1, a2) ^ 1;
}

uint64_t TUCallCenterAudioCallHostedOnOrEndpointOnCurrentDevicePredicate_block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a2;
  v3 = objc_msgSend(v2, "isVideo");
  if ((v3 & 1) != 0)
    v4 = 0;
  else
    v4 = TUCallCenterHostedOnOrEndpointOnCurrentDevicePredicate_block_invoke_5(v3, v2);

  return v4;
}

uint64_t TUCallCenterIncomingAudioCallHostedOnOrEndpointOnCurrentDevicePredicate_block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "status") == 4)
    v3 = (*((uint64_t (**)(uint64_t, void *))TUCallCenterAudioCallHostedOnOrEndpointOnCurrentDevicePredicate + 2))((uint64_t)TUCallCenterAudioCallHostedOnOrEndpointOnCurrentDevicePredicate, v2);
  else
    v3 = 0;

  return v3;
}

uint64_t TUCallCenterIncomingVideoCallPredicate_block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "status") == 4)
    v3 = objc_msgSend(v2, "isVideo");
  else
    v3 = 0;

  return v3;
}

BOOL TUCallCenterDisplayedAudioCallPredicate_block_invoke_12(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  int v4;

  v2 = a2;
  if ((objc_msgSend(v2, "isVideo") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v4 = objc_msgSend(v2, "status");
    v3 = v4 == 2 || (v4 & 0xFFFFFFFD) == 1;
  }

  return v3;
}

uint64_t TUCallCenterDisplayedAudioConferenceCallPredicate_block_invoke_13(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (TUCallCenterDisplayedAudioCallPredicate_block_invoke_12((uint64_t)v2, v2))
    v3 = objc_msgSend(v2, "isConferenced");
  else
    v3 = 0;

  return v3;
}

uint64_t TUCallCenterScreeningCallPredicate_block_invoke_14(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "status") == 1)
    v3 = objc_msgSend(v2, "isScreening");
  else
    v3 = 0;

  return v3;
}

uint64_t TUCallCenterCallDateConnectedComparator_block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "dateConnected");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateConnected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t TUCallCenterCallDateConnectedComparator_block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(v3, "isVideo") & 1) != 0 || objc_msgSend(v3, "status") != *(_DWORD *)(a1 + 32))
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isConferenced") ^ 1;

  return v4;
}

void sub_19A565D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _validDictionaryForDestinations(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E38E8F98, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  return v2;
}

id TUMakeNeighborhoodConduitError(uint64_t a1, void *a2)
{
  const __CFString *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  switch(a1)
  {
    case 1:
      v4 = CFSTR("The selected conversation is not active on the target device.");
      v5 = CFSTR("Conversation Not Active");
      break;
    case 2:
      v4 = CFSTR("The requested conversation could not be found.");
      v5 = CFSTR("Conversation Not Found");
      break;
    case 3:
      v4 = CFSTR("One or more input arguments were invalid.");
      v5 = CFSTR("Invalid Arguments");
      break;
    case 4:
      v4 = CFSTR("The handoff system was in an unexpected state.");
      v5 = CFSTR("Internal Status Error");
      break;
    case 5:
      v4 = CFSTR("The operation did not complete in a timely manner.");
      v5 = CFSTR("Operation Timed Out");
      break;
    case 6:
      v4 = CFSTR("The requested device could not be located at this time.");
      v5 = CFSTR("Device Not Found");
      break;
    case 7:
      v4 = CFSTR("The target device is not in a split session initiated by this device.");
      v5 = CFSTR("Target Not Split Paired");
      break;
    case 8:
      v4 = CFSTR("There is no registered delegate that can approve split sessions.");
      v5 = CFSTR("No Split Session Approver");
      break;
    case 9:
      v4 = CFSTR("The XPC client does not have the requisite entitlement.");
      v5 = CFSTR("Client Not Entitled");
      break;
    case 10:
      v4 = CFSTR("The XPC client has not implemented split-session approval.");
      v5 = CFSTR("Approval Not Implemented");
      break;
    case 11:
      v4 = CFSTR("The requested activity cannot be continued on tvOS.");
      v5 = CFSTR("Activity Not Continuable");
      break;
    case 12:
      v4 = CFSTR("No caller ID is available for this device.");
      v5 = CFSTR("No Caller ID");
      break;
    case 13:
      v4 = CFSTR("No public token is available for this device.");
      v5 = CFSTR("No Public Token");
      break;
    case 14:
      v4 = CFSTR("A timeout occurred when provisioning a pseudonym for this device.");
      v5 = CFSTR("Pseudonym Provisioning Timeout");
      break;
    case 15:
      v4 = CFSTR("An error occurred when provisioning a pseudonym for this device.");
      v5 = CFSTR("Pseudonym Provisioning Failure");
      break;
    case 16:
      v4 = CFSTR("A join request is already in progress.");
      v5 = CFSTR("Join In Progress");
      break;
    case 17:
      v4 = CFSTR("The operation was canceled by the user.");
      v5 = CFSTR("Canceled");
      break;
    case 18:
      v4 = CFSTR("The operation could not be completed because the target device is not paired.");
      v5 = CFSTR("Device Not Paired");
      break;
    case 19:
      v4 = CFSTR("The current SharePlay activity is not supported on Apple TV.");
      v5 = CFSTR("Unsupported on Apple TV");
      break;
    case 20:
      v4 = CFSTR("The device is already in a split session and cannot join another.");
      v5 = CFSTR("Split Session Already Active");
      break;
    case 21:
      v4 = CFSTR("This Apple TV is not capable of shareplay with this iOS device (perhaps version is too old).");
      v5 = CFSTR("Apple TV is incapable of handoff");
      break;
    case 22:
      v4 = CFSTR("The requested suggestion is either unrecognized or no longer available for response.");
      v5 = CFSTR("Requested suggestion is incorrect");
      break;
    case 23:
      v4 = CFSTR("This device or the one which we're you're trying to connect is unable to connect to the network.");
      v5 = CFSTR("FaceTime network is unreachable");
      break;
    case 24:
      v4 = CFSTR("The connected device must be signed in to use FaceTime on Apple TV.");
      v5 = CFSTR("Device not signed in");
      break;
    case 25:
      v4 = CFSTR("A blocked contact is part of the remote members list.");
      v5 = CFSTR("Blocked Contact");
      break;
    case 26:
      v4 = CFSTR("An invalid contact is part of the remote members list.");
      v5 = CFSTR("Invalid Contact");
      break;
    default:
      v4 = CFSTR("This operation has not yet been implemented. Please check back later.");
      v5 = CFSTR("Not Yet Implemented");
      if (a1 != 10101)
      {
        v5 = 0;
        v4 = 0;
      }
      break;
  }
  v6 = *MEMORY[0x1E0CB2D68];
  if (a2)
  {
    v21[0] = *MEMORY[0x1E0CB2D50];
    v21[1] = v6;
    v22[0] = v5;
    v22[1] = v4;
    v21[2] = *MEMORY[0x1E0CB3388];
    v22[2] = a2;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = a2;
    v9 = v22;
    v10 = v21;
    v11 = v7;
    v12 = 3;
  }
  else
  {
    v19[0] = *MEMORY[0x1E0CB2D50];
    v19[1] = v6;
    v20[0] = v5;
    v20[1] = v4;
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = 0;
    v9 = v20;
    v10 = v19;
    v11 = v13;
    v12 = 2;
  }
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v9, v10, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0CB35C8]);

  v17 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", CFSTR("TUNeighborhoodActivityConduitErrorDomain"), a1, v15);
  return v17;
}

void sub_19A568850(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A5689D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A568E64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19A5697A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_19A56B75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAVSystemController_PickedRouteAttribute()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getAVSystemController_PickedRouteAttributeSymbolLoc_ptr;
  v6 = getAVSystemController_PickedRouteAttributeSymbolLoc_ptr;
  if (!getAVSystemController_PickedRouteAttributeSymbolLoc_ptr)
  {
    v1 = (void *)MediaExperienceLibrary();
    v0 = (id *)dlsym(v1, "AVSystemController_PickedRouteAttribute");
    v4[3] = (uint64_t)v0;
    getAVSystemController_PickedRouteAttributeSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getAVSystemController_PickedRouteAttribute_cold_1();
  return *v0;
}

void sub_19A56C03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19A56C2E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A56C720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A56D010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *__getAVAudioSessionCategoryPhoneCallSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!AudioSessionLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E38A2798;
    v5 = 0;
    AudioSessionLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AudioSessionLibraryCore_frameworkLibrary)
    __getAVAudioSessionCategoryPhoneCallSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)AudioSessionLibraryCore_frameworkLibrary, "AVAudioSessionCategoryPhoneCall");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAVAudioSessionCategoryPhoneCallSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

char *OUTLINED_FUNCTION_1_2()
{
  return dlerror();
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_19A570594(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19A5705EC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19A570654(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19A570758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  os_unfair_lock_s *v14;
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  os_unfair_lock_unlock(v14);
  _Unwind_Resume(a1);
}

void sub_19A570818(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL CSDMessagingVoucherReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  CSDMessagingHandle *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = objc_alloc_init(CSDMessagingHandle);
          objc_storeStrong((id *)(a1 + 16), v17);
          if (PBReaderPlaceMark() && (CSDMessagingHandleReadFrom((uint64_t)v17, a2) & 1) != 0)
          {
            PBReaderRecallMark();
            goto LABEL_28;
          }

          return 0;
        case 2u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 24;
          goto LABEL_27;
        case 3u:
          PBReaderReadData();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 32;
          goto LABEL_27;
        case 4u:
          PBReaderReadData();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 8;
LABEL_27:
          v17 = *(CSDMessagingHandle **)(a1 + v19);
          *(_QWORD *)(a1 + v19) = v18;
LABEL_28:

          goto LABEL_29;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
LABEL_29:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          break;
      }
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19A5720FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19A574FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getBYSetupUserDispositionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E38A2930;
    v5 = 0;
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SetupAssistantLibraryCore_frameworkLibrary)
    __getBYSetupUserDispositionClass_block_invoke_cold_1(&v3);
  result = objc_getClass("BYSetupUserDisposition");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBYSetupUserDispositionClass_block_invoke_cold_2();
  getBYSetupUserDispositionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t _TUPhoneNumbersEqualCallback(void *a1, void *a2)
{
  objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  objc_msgSend(objc_retainAutorelease(a2), "UTF8String");
  TUHomeCountryCode();
  return CPPhoneNumbersEqual();
}

BOOL _TUNamesEqualCallback(const __CFString *a1, const __CFString *a2)
{
  return CFStringCompare(a1, a2, 1uLL) == kCFCompareEqualTo;
}

__CFArray *_TUCopyPersonsForUIDs(const __CFArray *a1, __CFDictionary **a2, int a3, const void *a4)
{
  const __CFAllocator *v8;
  __int128 v9;
  const __CFSet *v10;
  const __CFDictionary *v11;
  __int128 v12;
  CFIndex Count;
  CFIndex v14;
  CFIndex v15;
  ABRecordID ValueAtIndex;
  const void *v17;
  CFTypeRef v18;
  CFTypeRef v19;
  CFStringRef v20;
  CFStringRef v21;
  const void *Value;
  BOOL v23;
  const void *v24;
  CFIndex v25;
  CFIndex v26;
  CFIndex i;
  CFTypeRef v28;
  int v29;
  __CFDictionary *v30;
  __CFArray *theArray;
  ABPropertyID property;
  const __CFDictionary *v34;
  const __CFArray *v35;
  const void *v36;
  CFDictionaryKeyCallBacks keyCallBacks;
  CFSetCallBacks callBacks;

  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  theArray = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  v9 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 32);
  *(_OWORD *)&callBacks.release = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 16);
  *(_OWORD *)&callBacks.equal = v9;
  *(_OWORD *)&callBacks.version = *MEMORY[0x1E0C9B3B0];
  callBacks.equal = (CFSetEqualCallBack)_TUPhoneNumbersEqualCallback;
  v10 = CFSetCreateMutable(v8, 0, &callBacks);
  v11 = 0;
  v12 = *(_OWORD *)(MEMORY[0x1E0C9B390] + 32);
  *(_OWORD *)&keyCallBacks.release = *(_OWORD *)(MEMORY[0x1E0C9B390] + 16);
  *(_OWORD *)&keyCallBacks.equal = v12;
  *(_OWORD *)&keyCallBacks.version = *MEMORY[0x1E0C9B390];
  keyCallBacks.equal = (CFDictionaryEqualCallBack)_TUNamesEqualCallback;
  if (a3)
    v11 = CFDictionaryCreateMutable(v8, 0, &keyCallBacks, MEMORY[0x1E0C9B3A0]);
  if (a2)
    *a2 = CFDictionaryCreateMutable(v8, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  Count = CFArrayGetCount(a1);
  if (Count)
  {
    v14 = Count;
    v15 = 0;
    property = *MEMORY[0x1E0CF61A0];
    v35 = a1;
    v36 = a4;
    v34 = v11;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, v15);
      if (ABAddressBookGetPersonWithRecordID(a4, ValueAtIndex))
      {
        v17 = (const void *)ABPersonCopyPreferredLinkedPersonForName();
        if (v17)
          break;
      }
LABEL_30:
      if (++v15 == v14)
        goto LABEL_31;
    }
    v18 = v17;
    v19 = ABRecordCopyValue(v17, property);
    if (v11 && (v20 = ABRecordCopyCompositeName(v18)) != 0)
    {
      v21 = v20;
      Value = CFDictionaryGetValue(v11, v20);
      v23 = Value != 0;
      if (Value)
      {
        v24 = Value;
        CFRelease(v18);
        v18 = CFRetain(v24);
      }
      else
      {
        CFDictionarySetValue(v11, v21, v18);
      }
      CFRelease(v21);
      if (!a2)
        goto LABEL_24;
    }
    else
    {
      v23 = 0;
      if (!a2)
        goto LABEL_24;
    }
    if (v19)
    {
      v25 = ABMultiValueGetCount(v19);
      if (!v25)
        goto LABEL_25;
      v26 = v25;
      for (i = 0; i != v26; ++i)
      {
        v28 = ABMultiValueCopyValueAtIndex(v19, i);
        v29 = CFSetContainsValue(v10, v28);
        v30 = *a2;
        if (v29)
        {
          CFDictionaryRemoveValue(v30, v28);
        }
        else
        {
          CFDictionarySetValue(v30, v28, v18);
          CFSetAddValue(v10, v28);
        }
        CFRelease(v28);
      }
    }
LABEL_24:
    if (!v19)
    {
LABEL_26:
      if (!v23)
        CFArrayAppendValue(theArray, v18);
      a1 = v35;
      a4 = v36;
      v11 = v34;
      if (v18)
        CFRelease(v18);
      goto LABEL_30;
    }
LABEL_25:
    CFRelease(v19);
    goto LABEL_26;
  }
LABEL_31:
  if (v10)
    CFRelease(v10);
  if (v11)
    CFRelease(v11);
  return theArray;
}

id callHistoryQueue()
{
  if (callHistoryQueue_onceToken != -1)
    dispatch_once(&callHistoryQueue_onceToken, &__block_literal_global_24);
  return (id)callHistoryQueue_callHistoryQueue;
}

void __callHistoryQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("Call History Queue", 0);
  v1 = (void *)callHistoryQueue_callHistoryQueue;
  callHistoryQueue_callHistoryQueue = (uint64_t)v0;

}

CFStringRef _queue_TUCopyMostRecentNumberForNumbers(const __CFArray *a1)
{
  const __CFString *ValueAtIndex;

  if (!a1 || !CFArrayGetCount(a1))
    return 0;
  ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, 0);
  return CFStringCreateCopy(0, ValueAtIndex);
}

__CFArray *_queue_TUCreateOrderedPeopleFromUIDs(const __CFArray *a1, const __CFArray *a2, CFTypeRef *a3, int a4, const void *a5)
{
  __CFArray *v7;
  CFIndex Count;
  CFStringRef v9;
  const void **v10;
  const __CFArray *v11;
  BOOL v12;
  int v13;
  const void *ValueAtIndex;
  CFTypeID TypeID;
  CFTypeID v16;
  CFTypeRef v17;
  CFDictionaryRef v18;
  const void *Value;
  const void *v20;
  CFIndex FirstIndexOfValue;
  CFIndex v22;
  const void *v23;
  CFTypeID v24;
  CFTypeRef v25;
  CFArrayCallBacks v27;
  CFDictionaryRef theDict;
  CFRange v29;

  theDict = 0;
  v7 = _TUCopyPersonsForUIDs(a1, &theDict, a4, a5);
  if (theDict)
  {
    Count = CFDictionaryGetCount(theDict);
    v9 = (CFStringRef)Count;
    if (Count)
    {
      v10 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
      CFDictionaryGetKeysAndValues(theDict, v10, 0);
      memset(&v27, 0, 32);
      v27.equal = (CFArrayEqualCallBack)_TUPhoneNumbersEqualCallback;
      v11 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v10, (CFIndex)v9, &v27);
      v9 = _queue_TUCopyMostRecentNumberForNumbers(v11);
      if (v11)
        CFRelease(v11);
      if (v10)
        free(v10);
    }
  }
  else
  {
    v9 = 0;
  }
  if (a2)
    v12 = a3 == 0;
  else
    v12 = 1;
  v13 = !v12;
  if (!v12 && CFArrayGetCount(a2))
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a2, 0);
    TypeID = CFStringGetTypeID();
    v16 = CFGetTypeID(ValueAtIndex);
    v17 = 0;
    if (TypeID == v16)
      v17 = CFRetain(ValueAtIndex);
    *a3 = v17;
  }
  v18 = theDict;
  if (v9)
  {
    Value = CFDictionaryGetValue(theDict, v9);
    if (Value)
    {
      v20 = Value;
      v29.length = CFArrayGetCount(v7);
      v29.location = 0;
      FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v7, v29, v20);
      if (FirstIndexOfValue != -1)
      {
        v22 = FirstIndexOfValue;
        CFArrayRemoveValueAtIndex(v7, FirstIndexOfValue);
        CFArrayInsertValueAtIndex(v7, 0, v20);
        if (v13)
        {
          if (CFArrayGetCount(a2) > v22)
          {
            if (*a3)
              CFRelease(*a3);
            v23 = CFArrayGetValueAtIndex(a2, v22);
            v24 = CFStringGetTypeID();
            if (v24 == CFGetTypeID(v23))
              v25 = CFRetain(v23);
            else
              v25 = 0;
            *a3 = v25;
          }
        }
      }
    }
    CFRelease(v9);
    v18 = theDict;
  }
  if (v18)
    CFRelease(v18);
  return v7;
}

uint64_t TUCopyOrderedPeopleForDestinationIDWithHintInAddressBook(void *a1, _QWORD *a2, char a3, uint64_t a4, int a5, const void *a6)
{
  id v10;
  const __CFArray *v11;
  void *v12;
  CFIndex Count;
  ABRecordID ValueAtIndex;
  CFArrayRef v15;
  const void *v16;
  CFTypeID TypeID;
  CFTypeRef v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD v22[9];
  char v23;
  void *values;
  CFTypeRef v25;
  CFTypeRef cf;
  CFArrayRef theArray;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v10 = a1;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  cf = 0;
  theArray = 0;
  v25 = 0;
  if (objc_msgSend(v10, "destinationIdIsEmailAddress"))
  {
    v11 = (const __CFArray *)ABAddressBookCopyArrayOfUIDsMatchingEmailAddress();
    if (!v11)
      goto LABEL_28;
LABEL_11:
    Count = CFArrayGetCount(v11);
    if (Count == 1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v11, 0);
      if (ABAddressBookGetPersonWithRecordID(a6, ValueAtIndex))
      {
        values = (void *)ABPersonCopyPreferredLinkedPersonForName();
        if (values)
        {
          v15 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&values, 1, MEMORY[0x1E0C9B378]);
          v29[3] = (uint64_t)v15;
          if (a2)
          {
            if (theArray)
            {
              if (CFArrayGetCount(theArray) == 1)
              {
                v16 = CFArrayGetValueAtIndex(theArray, 0);
                if (v16)
                {
                  TypeID = CFStringGetTypeID();
                  if (TypeID == CFGetTypeID(v16))
                    v18 = CFRetain(v16);
                  else
                    v18 = 0;
                  *a2 = v18;
                }
              }
            }
          }
          CFRelease(values);
        }
      }
    }
    else if (Count > 1)
    {
      goto LABEL_26;
    }
    if (v29[3])
    {
LABEL_27:
      CFRelease(v11);
      goto LABEL_28;
    }
LABEL_26:
    callHistoryQueue();
    v19 = objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __TUCopyOrderedPeopleForDestinationIDWithHintInAddressBook_block_invoke;
    v22[3] = &unk_1E38A2978;
    v22[4] = &v28;
    v22[5] = v11;
    v22[6] = theArray;
    v22[7] = a2;
    v23 = a3;
    v22[8] = a6;
    dispatch_sync(v19, v22);

    goto LABEL_27;
  }
  if (objc_msgSend(v10, "destinationIdIsPhoneNumber"))
  {
    if (a5)
      TUNetworkCountryCode();
    else
      TUHomeCountryCode();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      TUHomeCountryCode();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = (const __CFArray *)ABAddressBookCopyArrayOfUIDsMatchingPhoneNumberWithCountryAndHint();

    if (v11)
      goto LABEL_11;
  }
LABEL_28:
  if (theArray)
    CFRelease(theArray);
  if (cf)
    CFRelease(cf);
  if (v25)
    CFRelease(v25);
  v20 = v29[3];
  _Block_object_dispose(&v28, 8);

  return v20;
}

void sub_19A57781C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19A57E688(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19A57E6FC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19A57E880(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19A57F968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCATransactionClass()
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
  v0 = (void *)getCATransactionClass_softClass;
  v7 = getCATransactionClass_softClass;
  if (!getCATransactionClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCATransactionClass_block_invoke;
    v3[3] = &unk_1E38A1710;
    v3[4] = &v4;
    __getCATransactionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19A5813A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A5817D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  _Block_object_dispose(&a61, 8);
  _Unwind_Resume(a1);
}

id getkCAGravityResizeAspectFill()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getkCAGravityResizeAspectFillSymbolLoc_ptr;
  v6 = getkCAGravityResizeAspectFillSymbolLoc_ptr;
  if (!getkCAGravityResizeAspectFillSymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = (id *)dlsym(v1, "kCAGravityResizeAspectFill");
    v4[3] = (uint64_t)v0;
    getkCAGravityResizeAspectFillSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getkCAGravityResizeAspectFill_cold_1();
  return *v0;
}

void sub_19A581880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19A58196C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCATransactionClass_block_invoke(uint64_t a1)
{
  Class result;

  QuartzCoreLibrary();
  result = objc_getClass("CATransaction");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCATransactionClass_block_invoke_cold_1();
  getCATransactionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t QuartzCoreLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!QuartzCoreLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E38A29E8;
    v3 = 0;
    QuartzCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!QuartzCoreLibraryCore_frameworkLibrary)
    QuartzCoreLibrary_cold_1(&v1);
  return QuartzCoreLibraryCore_frameworkLibrary;
}

Class __getCALayerClass_block_invoke(uint64_t a1)
{
  Class result;

  QuartzCoreLibrary();
  result = objc_getClass("CALayer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCALayerClass_block_invoke_cold_1();
  getCALayerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCGAffineTransformMakeRotationSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!CoreGraphicsLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E38A2A00;
    v5 = 0;
    CoreGraphicsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreGraphicsLibraryCore_frameworkLibrary)
    __getCGAffineTransformMakeRotationSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)CoreGraphicsLibraryCore_frameworkLibrary, "CGAffineTransformMakeRotation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getCGAffineTransformMakeRotationSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCAContextClass_block_invoke(uint64_t a1)
{
  Class result;

  QuartzCoreLibrary();
  result = objc_getClass("CAContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCAContextClass_block_invoke_cold_1();
  getCAContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19A582488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19A5826EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19A5827BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getAVSystemController_RouteDescriptionKey_BTDetails_EndpointTypeSymbolLoc_ptr;
  v6 = getAVSystemController_RouteDescriptionKey_BTDetails_EndpointTypeSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_BTDetails_EndpointTypeSymbolLoc_ptr)
  {
    v1 = (void *)MediaExperienceLibrary_0();
    v0 = (id *)dlsym(v1, "AVSystemController_RouteDescriptionKey_BTDetails_EndpointType");
    v4[3] = (uint64_t)v0;
    getAVSystemController_RouteDescriptionKey_BTDetails_EndpointTypeSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_cold_1();
  return *v0;
}

void sub_19A5829DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Headphones()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_HeadphonesSymbolLoc_ptr;
  v6 = getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_HeadphonesSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_HeadphonesSymbolLoc_ptr)
  {
    v1 = (void *)MediaExperienceLibrary_0();
    v0 = (id *)dlsym(v1, "AVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Headphones");
    v4[3] = (uint64_t)v0;
    getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_HeadphonesSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Headphones_cold_1();
  return *v0;
}

void sub_19A582A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Vehicle()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_VehicleSymbolLoc_ptr;
  v6 = getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_VehicleSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_VehicleSymbolLoc_ptr)
  {
    v1 = (void *)MediaExperienceLibrary_0();
    v0 = (id *)dlsym(v1, "AVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Vehicle");
    v4[3] = (uint64_t)v0;
    getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_VehicleSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Vehicle_cold_1();
  return *v0;
}

void sub_19A582B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Speakers()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_SpeakersSymbolLoc_ptr;
  v6 = getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_SpeakersSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_SpeakersSymbolLoc_ptr)
  {
    v1 = (void *)MediaExperienceLibrary_0();
    v0 = (id *)dlsym(v1, "AVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Speakers");
    v4[3] = (uint64_t)v0;
    getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_SpeakersSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Speakers_cold_1();
  return *v0;
}

void sub_19A582BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_TTY()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_TTYSymbolLoc_ptr;
  v6 = getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_TTYSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_TTYSymbolLoc_ptr)
  {
    v1 = (void *)MediaExperienceLibrary_0();
    v0 = (id *)dlsym(v1, "AVSystemController_RouteDescriptionKey_BTDetails_EndpointType_TTY");
    v4[3] = (uint64_t)v0;
    getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_TTYSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_TTY_cold_1();
  return *v0;
}

void sub_19A582C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19A582D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19A582E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19A582EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19A583080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19A583140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19A5831EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19A5832BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19A58338C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19A58345C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19A58352C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19A583604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19A58394C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19A583A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19A583B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19A583D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A584248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A584360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A584454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_3_0(uint64_t result, float a2)
{
  _QWORD *v2;
  float *v3;

  *v3 = a2;
  *v2 = result;
  return result;
}

void sub_19A587F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A5881F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A588320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void TUGuaranteeExecutionOnMainThreadAsync(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void (**block)(void);

  v1 = (void *)MEMORY[0x1E0CB3978];
  block = a1;
  objc_msgSend(v1, "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "mainThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
    block[2]();
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

id TUBundle()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)TUBundle___tuBundle;
  if (!TUBundle___tuBundle)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.TelephonyUtilities"));
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)TUBundle___tuBundle;
    TUBundle___tuBundle = v1;

    v0 = (void *)TUBundle___tuBundle;
  }
  return v0;
}

uint64_t _TURecursiveSize(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  char v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v28 = 0;
  if (!objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, &v28))
  {
    v17 = 0;
    goto LABEL_21;
  }
  if (v28)
  {
    if ((objc_msgSend(v6, "hasSuffix:", CFSTR("/")) & 1) == 0)
    {
      objc_msgSend(v6, "stringByAppendingString:", CFSTR("/"));
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v7;
    }
    v21 = a3;
    objc_msgSend(v5, "enumeratorAtPath:", v6);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v8);
          objc_msgSend(v6, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 0;
          v15 = _TURecursiveSize(v5, v14, &v23);
          v16 = v23;

          if ((_DWORD)v15)
          {

            goto LABEL_26;
          }
          v11 += v16;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      v11 = 0;
    }

    a3 = v21;
  }
  else
  {
    v11 = 0;
  }
  v22 = 0;
  objc_msgSend(v5, "attributesOfItemAtPath:error:", v6, &v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = v18;
    v17 = objc_msgSend(v18, "fileSize") + v11;

LABEL_21:
    v15 = 0;
    if (a3)
      *a3 = v17;
    goto LABEL_26;
  }
  if (a3)
    *a3 = 0;
  v15 = 13;
LABEL_26:

  return v15;
}

uint64_t TURecursiveSize(void *a1, _QWORD *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a1;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _TURecursiveSize(v5, v4, a2);

  return v6;
}

id TUFormattedPhoneNumber(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "length"))
  {
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = v3;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "TUFormattedPhoneNumber called with number: '%@' and country code '%@'", (uint8_t *)&v11, 0x16u);
    }

    v6 = (void *)PNCreateFormattedStringWithCountry();
    TUDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "    - PNCreateFormattedStringWithCountry returned %@", (uint8_t *)&v11, 0xCu);
    }

    if (!v6)
    {
      v6 = (void *)PNCreateFormattedStringWithCountry();
      TUDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412290;
        v12 = v6;
        _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "    - we got nil, using fallback code PNCreateFormattedStringWithCountry(us) returned %@", (uint8_t *)&v11, 0xCu);
      }

      if (!v6)
      {
        v6 = (void *)objc_msgSend(v3, "copy");
        TUDefaultLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v11 = 138412290;
          v12 = v6;
          _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "    - that also failed, we'll return the original string %@", (uint8_t *)&v11, 0xCu);
        }

      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id TUUnformattedPhoneNumber()
{
  return (id)_PNCreateStringByStrippingFormattingAndNotVisiblyAllowable();
}

id TUNumberWithOldStylePausesTransformed(void *a1)
{
  id v1;
  void *v2;
  unint64_t v3;
  int v4;
  void *v5;
  void *v6;
  __int16 v8;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v1, "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "length"))
  {
    v3 = 0;
    do
    {
      v8 = 0;
      v4 = objc_msgSend(v1, "characterAtIndex:", v3);
      v8 = v4;
      if ((v4 & 0xFFFFFFDF) == 0x57)
      {
        v8 = 59;
      }
      else if ((v4 & 0xFFFFFFDF) == 0x50)
      {
        v8 = 44;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v8, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "appendString:", v5);

      ++v3;
    }
    while (v3 < objc_msgSend(v1, "length"));
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id TUHardPauseDigitsDisplayString(void *a1)
{
  id v1;
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    v2 = objc_msgSend(v1, "length");
    v3 = (void *)MEMORY[0x1E0CB3940];
    TUBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v2 < 7)
    {
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DIAL_%@_SHORT_FORMAT"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", v6, v1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DIAL_%@_LONG_FORMAT"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "substringToIndex:", 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id TUStringKeyForProduct(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  objc_msgSend((id)CUTWeakLinkClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceType");
  v4 = v1;
  if ((unint64_t)(v3 - 1) <= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", off_1E38A2D98[v3 - 1], v1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

id TUStringKeyForNetwork(void *a1)
{
  id v1;
  void *v2;
  const __CFString *v3;
  void *v4;

  v1 = a1;
  objc_msgSend((id)CUTWeakLinkClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "supportsWLAN"))
    v3 = CFSTR("%@_WLAN");
  else
    v3 = CFSTR("%@_WIFI");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v3, v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id TUStringKeyForNetworkAndProduct(void *a1)
{
  void *v1;
  void *v2;

  TUStringKeyForNetwork(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  TUStringKeyForProduct(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t TUStringKeyForPlatform(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_IOS"), a1);
}

id TUCopyIDSCanonicalAddressForDestinationID()
{
  void *v0;
  id v1;
  void *v2;

  IMStripFormattingFromAddress();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "destinationIdIsTemporary"))
  {
    v1 = (id)IDSCopyIDForTemporaryID();
  }
  else if (objc_msgSend(v0, "destinationIdIsPseudonym"))
  {
    v1 = (id)IDSCopyIDForPseudonymID();
  }
  else if (objc_msgSend(v0, "destinationIdIsTokenURI"))
  {
    v1 = v0;
  }
  else if (objc_msgSend(v0, "destinationIdIsEmailAddress"))
  {
    v1 = (id)MEMORY[0x19AEC8C58](v0);
  }
  else
  {
    v1 = (id)IDSCopyIDForPhoneNumber();
  }
  v2 = v1;

  return v2;
}

id TUCopyIDSCanonicalAddressForHandle(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;

  v1 = a1;
  objc_msgSend(v1, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IMStripFormattingFromAddress();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v1, "type");
  switch(v4)
  {
    case 3:
      v5 = MEMORY[0x19AEC8C58](v3);
      goto LABEL_12;
    case 2:
      v5 = IDSCopyIDForPhoneNumber();
      goto LABEL_12;
    case 1:
      if (objc_msgSend(v3, "destinationIdIsTemporary"))
      {
        v5 = IDSCopyIDForTemporaryID();
LABEL_12:
        v8 = (void *)v5;

        v3 = v8;
        break;
      }
      if (objc_msgSend(v3, "destinationIdIsPseudonym"))
      {
        v5 = IDSCopyIDForPseudonymID();
        goto LABEL_12;
      }
      objc_msgSend(v1, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "destinationIdIsTokenURI");

      if (v7)
      {
        objc_msgSend(v1, "value");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      break;
  }

  return v3;
}

id TUCopyIDSFromIDForHandle(void *a1)
{
  id v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  objc_msgSend(v1, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "destinationIdIsTokenURI");

  if (v3)
  {
    objc_msgSend(v1, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "normalizedTokenURI");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    TUCopyIDSCanonicalAddressForDestinationID();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v1 = v4;
  }
  else
  {
    TUCopyIDSCanonicalAddressForHandle(v1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

id TUHandleForIDSCanonicalAddress(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  int v6;

  v1 = a1;
  v2 = (void *)IDSCopyRawAddressForDestination();
  if (objc_msgSend(v2, "length"))
  {
    if (objc_msgSend(v1, "destinationIdIsTokenURI"))
    {
      v3 = v1;
LABEL_9:
      +[TUHandle normalizedGenericHandleForValue:](TUHandle, "normalizedGenericHandleForValue:", v3);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (objc_msgSend(v2, "destinationIdIsEmailAddress"))
    {
      +[TUHandle normalizedEmailAddressHandleForValue:](TUHandle, "normalizedEmailAddressHandleForValue:", v2);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = objc_msgSend(v2, "destinationIdIsPhoneNumber");
      v3 = v2;
      if (!v6)
        goto LABEL_9;
      +[TUHandle normalizedPhoneNumberHandleForValue:isoCountryCode:](TUHandle, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v2, 0);
      v5 = objc_claimAutoreleasedReturnValue();
    }
LABEL_10:
    v4 = (void *)v5;
    goto LABEL_11;
  }
  v4 = 0;
LABEL_11:

  return v4;
}

id TUNormalizedHandleForTUHandle(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v1 = a1;
  v2 = objc_msgSend(v1, "type");
  if (v2 == 1)
  {
    objc_msgSend(v1, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[TUHandle normalizedGenericHandleForValue:](TUHandle, "normalizedGenericHandleForValue:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v5 = (void *)v10;
    goto LABEL_9;
  }
  if (v2 == 3)
  {
    objc_msgSend(v1, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[TUHandle normalizedEmailAddressHandleForValue:](TUHandle, "normalizedEmailAddressHandleForValue:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (v2 != 2)
  {
    v5 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v1, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "isoCountryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TUHandle normalizedPhoneNumberHandleForValue:isoCountryCode:](TUHandle, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "normalizedValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    TUCopyIDSCanonicalAddressForHandle(v1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    TUHandleForIDSCanonicalAddress(v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
LABEL_9:

  }
LABEL_11:
  objc_msgSend(v1, "siriDisplayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSiriDisplayName:", v11);

  return v5;
}

uint64_t TULoggableStringForHandle()
{
  return IDSLoggableDescriptionForHandleOnService();
}

uint64_t TULoggableStringForObject()
{
  return IDSLoggableDescriptionForObjectOnService();
}

uint64_t TULoggableStringForHandles()
{
  return IDSLoggableDescriptionForHandlesOnService();
}

void TUDispatchMainIfNecessary(void *a1)
{
  TUDispatchMainIfNecessaryAndWait(a1, 0);
}

uint64_t _TUAssertShouldCrashApplication()
{
  return os_variant_has_internal_diagnostics();
}

uint64_t TUCTServerConnection()
{
  if (TUCTServerConnection_onceToken != -1)
    dispatch_once(&TUCTServerConnection_onceToken, &__block_literal_global_66);
  return TUCTServerConnection_sConnection;
}

void TUAddLocalNSObserver(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v7 = a1;
  v8 = a3;
  v9 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __TUAddLocalNSObserver_block_invoke;
  v13[3] = &unk_1E38A1768;
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v17 = a2;
  v10 = v9;
  v11 = v8;
  v12 = v7;
  TUDispatchMainIfNecessaryAndWait(v13, 0);

}

void TUAddDarwinObserver(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v5[9];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __TUAddDarwinObserver_block_invoke;
  v5[3] = &__block_descriptor_72_e5_v8__0l;
  v5[4] = a1;
  v5[5] = a2;
  v5[6] = a3;
  v5[7] = a4;
  v5[8] = a5;
  TUDispatchMainIfNecessaryAndWait(v5, 0);
}

void TURemoveTelephonyCenterObserver(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v3[7];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __TURemoveTelephonyCenterObserver_block_invoke;
  v3[3] = &__block_descriptor_56_e5_v8__0l;
  v3[4] = a1;
  v3[5] = a2;
  v3[6] = a3;
  TUDispatchMainIfNecessaryAndWait(v3, 0);
}

void TURemoveEveryTelephonyCenterObserver(uint64_t a1)
{
  _QWORD v1[5];

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __TURemoveEveryTelephonyCenterObserver_block_invoke;
  v1[3] = &__block_descriptor_40_e5_v8__0l;
  v1[4] = a1;
  TUDispatchMainIfNecessaryAndWait(v1, 0);
}

const __CFString *TUInCallRemoteAlertViewControllerClassName()
{
  return CFSTR("PHInCallRemoteAlertShellViewController");
}

id TUConvertDestinationIDToLatinNumbers(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (!objc_msgSend(v1, "length") || (v2 = (void *)IMCopyStringWithLatinNumbers()) == 0)
    v2 = (void *)objc_msgSend(v1, "copy");

  return v2;
}

const __CFString *TUCallHandoffActivityType()
{
  return CFSTR("com.apple.mobilephone.callhandoff");
}

const __CFString *TUCallPhoneAppHistoryActivityType()
{
  return CFSTR("com.apple.mobilephone.apphistory");
}

uint64_t TUIsCallHandoffActivityType(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "lowercaseString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobilephone.callhandoff"));

  return v2;
}

BOOL TUShouldShowCallHandoff()
{
  return !+[TUCallCapabilities isThumperCallingEnabled](TUCallCapabilities, "isThumperCallingEnabled")
      || CTCallIsCallHandoffPossible() != 0;
}

BOOL TUIsMMIOrUSSDNumber(void *a1)
{
  id v1;
  const __CFBoolean *IsMmiOrUssd;
  _BOOL8 v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    IsMmiOrUssd = (const __CFBoolean *)CTCallPhoneNumberIsMmiOrUssd();
    v3 = CFBooleanGetValue(IsMmiOrUssd) != 0;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t TUIsEmergencyNumberOrIsWhiteListed(void *a1)
{
  id v1;
  NSObject *v2;

  v1 = a1;
  if (TUCTServerConnection_onceToken != -1)
    dispatch_once(&TUCTServerConnection_onceToken, &__block_literal_global_66);
  if (_CTServerConnectionIsEmergencyNumberWithWhitelistIncluded())
  {
    TUDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      TUIsEmergencyNumberOrIsWhiteListed_cold_1();

  }
  return 0;
}

uint64_t TUIsEmergencyNumber(void *a1)
{
  id v1;
  NSObject *v2;

  v1 = a1;
  if (TUCTServerConnection_onceToken != -1)
    dispatch_once(&TUCTServerConnection_onceToken, &__block_literal_global_66);
  if (_CTServerConnectionIsEmergencyNumber())
  {
    TUDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      TUIsEmergencyNumber_cold_1();

  }
  return 0;
}

id TUThumperCarrierName()
{
  NSObject *v0;

  if (TUCTServerConnection_onceToken != -1)
    dispatch_once(&TUCTServerConnection_onceToken, &__block_literal_global_66);
  if (_CTServerConnectionGetThumperName())
  {
    TUDefaultLog();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      TUThumperCarrierName_cold_1();

  }
  return 0;
}

void TUMapItemForPhoneNumberRef(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setPhoneNumbers:", v6);

    v7 = (void *)objc_msgSend(objc_alloc((Class)CUTWeakLinkClass()), "initWithRequest:", v5);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __TUMapItemForPhoneNumberRef_block_invoke;
    v8[3] = &unk_1E38A2BF0;
    v9 = v4;
    objc_msgSend(v7, "startWithCompletionHandler:", v8);

  }
  else if (v3)
  {
    (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
  }

}

void TUMapItemForDestinationID(void *a1, void *a2)
{
  id v3;
  const void *v4;
  id v5;

  v5 = a2;
  v3 = a1;
  TUNetworkCountryCode();
  v4 = (const void *)CFPhoneNumberCreate();

  if (v4)
  {
    TUMapItemForPhoneNumberRef((uint64_t)v4, v5);
    CFRelease(v4);
  }
  else if (v5)
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
  }

}

id TUMapItemForPhoneNumberRefSync(uint64_t a1)
{
  dispatch_semaphore_t v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7;
  v18 = __Block_byref_object_dispose__7;
  v19 = 0;
  if (a1)
  {
    v2 = dispatch_semaphore_create(0);
    if (TUMapItemForPhoneNumberRefSync_onceToken != -1)
      dispatch_once(&TUMapItemForPhoneNumberRefSync_onceToken, &__block_literal_global_91);
    v3 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setPhoneNumbers:", v4);

    v5 = (void *)objc_msgSend(objc_alloc((Class)CUTWeakLinkClass()), "initWithRequest:", v3);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __TUMapItemForPhoneNumberRefSync_block_invoke_2;
    v11[3] = &unk_1E38A2C18;
    v13 = &v14;
    v6 = v2;
    v12 = v6;
    objc_msgSend(v5, "_phoneOnlyStartWithCompletionHandler:queue:", v11, TUMapItemForPhoneNumberRefSync_callbackQueue);
    v7 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v6, v7);

    v8 = (void *)v15[5];
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;
  _Block_object_dispose(&v14, 8);

  return v9;
}

void sub_19A58A6D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t TUNumbersAreEqualOrNil(unint64_t a1, uint64_t a2)
{
  if (a1 | a2)
    return objc_msgSend((id)a1, "isEqualToNumber:", a2);
  else
    return 1;
}

BOOL TUStringsAreCaseInsensitiveEqual(void *a1, uint64_t a2)
{
  _BOOL8 result;

  result = 0;
  if (a1)
  {
    if (a2)
      return objc_msgSend(a1, "caseInsensitiveCompare:", a2) == 0;
  }
  return result;
}

BOOL TUStringsAreCaseInsensitiveEqualOrNil(void *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  _BOOL8 v6;

  v3 = a1;
  v4 = a2;
  v5 = (void *)v4;
  if (v3 | v4)
  {
    v6 = 0;
    if (v3 && v4)
      v6 = objc_msgSend((id)v3, "caseInsensitiveCompare:", v4) == 0;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

uint64_t TUStringsAreEqualOrNil(unint64_t a1, uint64_t a2)
{
  if (a1 | a2)
    return objc_msgSend((id)a1, "isEqualToString:", a2);
  else
    return 1;
}

uint64_t TUDestinationIDsAreEqual(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "destinationIdIsPhoneNumber")
    && objc_msgSend(v4, "destinationIdIsPhoneNumber"))
  {
    TUNetworkCountryCode();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[TUPhoneNumber areDigits:equalToDigits:usingCountryCode:](TUPhoneNumber, "areDigits:equalToDigits:usingCountryCode:", v3, v4, v5))
    {
      v6 = 1;
    }
    else
    {
      TUHomeCountryCode();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = +[TUPhoneNumber areDigits:equalToDigits:usingCountryCode:](TUPhoneNumber, "areDigits:equalToDigits:usingCountryCode:", v3, v4, v7);

    }
  }
  else
  {
    v6 = objc_msgSend(v3, "isEqualToIgnoringCase:", v4);
  }

  return v6;
}

uint64_t TUHandlesAreCanonicallyEqual(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = a1;
  TUNetworkCountryCode();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TUHomeCountryCode();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = TUHandlesAreCanonicallyEqualUsingCountryCodes(v4, v3, v5, v6);

  return v7;
}

uint64_t TUHandlesAreCanonicallyEqualUsingCountryCodes(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  uint64_t v13;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    v12 = objc_msgSend(v7, "isCanonicallyEqualToHandle:isoCountryCode:", v8, v9);
    if (!v11 || (v12 & 1) != 0)
    {
      if ((v12 & 1) != 0)
        goto LABEL_9;
      goto LABEL_8;
    }
LABEL_7:
    if ((objc_msgSend(v7, "isCanonicallyEqualToHandle:isoCountryCode:", v8, v11) & 1) != 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (v10)
    goto LABEL_7;
LABEL_8:
  if ((objc_msgSend(v7, "isEqualToHandle:", v8) & 1) == 0)
  {
    v13 = objc_msgSend(v7, "isEquivalentToHandle:", v8);
    goto LABEL_11;
  }
LABEL_9:
  v13 = 1;
LABEL_11:

  return v13;
}

uint64_t TUIncomingInvitationTimeout()
{
  return 30;
}

uint64_t TUOutgoingInvitationTimeoutForCallProvider(void *a1)
{
  objc_msgSend(a1, "isFaceTimeProvider");
  return 30;
}

uint64_t TUOutgoingInvitationTimeoutForCallProviderAndIsUpgrade(void *a1, int a2, int a3)
{
  if ((objc_msgSend(a1, "isFaceTimeProvider") & a2 & a3) != 0)
    return 60;
  else
    return 30;
}

uint64_t TUConnectionTimeoutForCallService(int a1)
{
  if ((a1 & 0xFFFFFFFE) == 2)
    return 180;
  else
    return 0;
}

uint64_t TUTransferTimeout()
{
  return 10;
}

void TUOpenUserActivityForConversationRequest(void *a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  const __CFString *v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v1;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Launching InCallService via NSUserActivity for join request: %@", buf, 0xCu);
  }

  v3 = (void *)CUTWeakLinkClass();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", CFSTR("TUUserActivityTypeJoinConversationRequest"));
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v1, 1, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v5)
  {
    v13 = CFSTR("TUUserActivityJoinConversationRequestUserInfoKey");
    v14 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUserInfo:", v7);

    v11 = v6;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.InCallService"), 0, &v11);
    v9 = v11;

    if (v8)
    {
      objc_msgSend(v3, "defaultWorkspace");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject openUserActivity:usingApplicationRecord:configuration:completionHandler:](v10, "openUserActivity:usingApplicationRecord:configuration:completionHandler:", v4, v8, 0, &__block_literal_global_103);
    }
    else
    {
      TUDefaultLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        TUOpenUserActivityForConversationRequest_cold_2();
    }

  }
  else
  {
    TUDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      TUOpenUserActivityForConversationRequest_cold_1();
    v9 = v6;
  }

}

uint64_t TUOpenURLWithError(void *a1, int a2, int a3, _QWORD *a4)
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v18;
  void *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v21 = v7;
    v22 = 1024;
    v23 = a2;
    v24 = 1024;
    v25 = a3;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "url: %@ isSensitive: %d promptToUnlock: %d", buf, 0x18u);
  }

  if (a3)
  {
    TUUnlockDeviceWithPromptFrontBoardOptionsDictionary(0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend((id)CUTWeakLinkClass(), "defaultWorkspace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a2)
  {
    v19 = 0;
    v12 = objc_msgSend(v10, "openSensitiveURL:withOptions:error:", v7, v9, &v19);
    v13 = v19;
  }
  else
  {
    v18 = 0;
    v12 = objc_msgSend(v10, "openURL:withOptions:error:", v7, v9, &v18);
    v13 = v18;
  }
  v14 = v13;

  if ((v12 & 1) != 0)
  {
    v15 = 1;
  }
  else
  {
    TUDefaultLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      TUOpenURLWithError_cold_1();

    if (a4)
    {
      v14 = objc_retainAutorelease(v14);
      v15 = 0;
      *a4 = v14;
    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

id TUUnlockDeviceWithPromptFrontBoardOptionsDictionary(int a1)
{
  void *v2;
  void **v3;
  void *v4;
  uint64_t v5;
  void **v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!TUUnlockDeviceWithPromptFrontBoardOptionsDictionary___FBSOpenApplicationOptionKeyUnlockDevice)
  {
    v3 = (void **)CUTWeakLinkSymbol();
    if (v3)
      v4 = *v3;
    else
      v4 = 0;
    objc_storeStrong((id *)&TUUnlockDeviceWithPromptFrontBoardOptionsDictionary___FBSOpenApplicationOptionKeyUnlockDevice, v4);
  }
  v5 = TUUnlockDeviceWithPromptFrontBoardOptionsDictionary___FBSOpenApplicationOptionKeyPromptUnlockDevice;
  if (!TUUnlockDeviceWithPromptFrontBoardOptionsDictionary___FBSOpenApplicationOptionKeyPromptUnlockDevice)
  {
    v6 = (void **)CUTWeakLinkSymbol();
    if (v6)
      v7 = *v6;
    else
      v7 = 0;
    objc_storeStrong((id *)&TUUnlockDeviceWithPromptFrontBoardOptionsDictionary___FBSOpenApplicationOptionKeyPromptUnlockDevice, v7);
    v5 = TUUnlockDeviceWithPromptFrontBoardOptionsDictionary___FBSOpenApplicationOptionKeyPromptUnlockDevice;
  }
  if (TUUnlockDeviceWithPromptFrontBoardOptionsDictionary___FBSOpenApplicationOptionKeyUnlockDevice)
    v8 = v5 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    v12[0] = TUUnlockDeviceWithPromptFrontBoardOptionsDictionary___FBSOpenApplicationOptionKeyUnlockDevice;
    v12[1] = v5;
    v13[0] = MEMORY[0x1E0C9AAB0];
    v13[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addEntriesFromDictionary:", v9);

  }
  if (a1)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("SBSInCallOpenApplicationOptionKeyPromptUnlockUI"));
  v10 = (void *)objc_msgSend(v2, "copy");

  return v10;
}

uint64_t TUOpenURL(void *a1)
{
  return TUOpenURLWithError(a1, 0, 0, 0);
}

uint64_t TUOpenSensitiveURL(void *a1)
{
  return TUOpenURLWithError(a1, 1, 0, 0);
}

uint64_t TUUnlockAndOpenURL(void *a1)
{
  return TUOpenURLWithError(a1, 0, 1, 0);
}

uint64_t TUUnlockAndOpenSensitiveURL(void *a1)
{
  return TUOpenURLWithError(a1, 1, 1, 0);
}

uint64_t TUShouldForegroundLaunchForActivity()
{
  return 1;
}

__CFString *TUURLHostForTelephoneNumber(void *a1)
{
  id v1;
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    TUConvertDestinationIDToLatinNumbers(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    TUSanitizedTelephoneNumber(v2);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  if (v3)
    v4 = v3;
  else
    v4 = &stru_1E38A53C8;
  v5 = v4;

  return v5;
}

__CFString *TUSanitizedTelephoneNumber(void *a1)
{
  __CFString *v1;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  __CFString *Mutable;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  UniChar v9;
  uint64_t v10;
  CFIndex v11;
  int64_t v12;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  CFIndex v17;
  __CFString *v18;
  UniChar chars;
  UniChar buffer[8];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __CFString *v29;
  const UniChar *v30;
  const char *v31;
  uint64_t v32;
  CFIndex v33;
  int64_t v34;
  int64_t v35;
  CFRange v36;

  v1 = a1;
  Length = CFStringGetLength(v1);
  v29 = v1;
  v32 = 0;
  v33 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v1);
  CStringPtr = 0;
  v30 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  *(_OWORD *)buffer = 0u;
  v22 = 0u;
  v31 = CStringPtr;
  v34 = 0;
  v35 = 0;
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (Length >= 1)
  {
    v6 = 0;
    v7 = 0;
    v8 = 64;
    do
    {
      v9 = 0;
      if ((unint64_t)v7 >= 4)
        v10 = 4;
      else
        v10 = v7;
      chars = 0;
      v11 = v33;
      if (v33 > v7)
      {
        if (v30)
        {
          v9 = v30[v7 + v32];
        }
        else if (v31)
        {
          v9 = v31[v32 + v7];
        }
        else
        {
          v12 = v34;
          if (v35 <= v7 || v34 > v7)
          {
            v14 = v10 + v6;
            v15 = v8 - v10;
            v16 = v7 - v10;
            v17 = v16 + 64;
            if (v16 + 64 >= v33)
              v17 = v33;
            v34 = v16;
            v35 = v17;
            if (v33 >= v15)
              v11 = v15;
            v36.length = v11 + v14;
            v36.location = v16 + v32;
            CFStringGetCharacters(v29, v36, buffer);
            v12 = v34;
          }
          v9 = buffer[v7 - v12];
        }
        chars = v9;
        if ((unsigned __int16)(v9 + 223) > 0x19u)
        {
          if ((unsigned __int16)(v9 + 191) > 0x19u)
          {
            if ((unsigned __int16)(v9 + 240) > 9u)
            {
              switch(v9)
              {
                case 0xFF03u:
                  v9 = 35;
                  break;
                case 0xFF04u:
                case 0xFF05u:
                case 0xFF06u:
                case 0xFF07u:
                case 0xFF08u:
                case 0xFF09u:
                  goto LABEL_30;
                case 0xFF0Au:
                  v9 = 42;
                  break;
                case 0xFF0Bu:
                  v9 = 43;
                  break;
                case 0xFF0Cu:
                  v9 = 44;
                  break;
                default:
                  if (v9 != 65307)
                    goto LABEL_30;
                  v9 = 59;
                  break;
              }
            }
            else
            {
              v9 += 288;
            }
          }
          else
          {
            v9 += 239;
          }
        }
        else
        {
          v9 += 271;
        }
        chars = v9;
      }
LABEL_30:
      if ((unsigned __int16)(v9 - 48) < 0xAu
        || (unsigned __int16)((v9 & 0xFFDF) - 65) < 0x1Au
        || v9 <= 0x3Bu && ((1 << v9) & 0x8001C0800000000) != 0)
      {
        CFStringAppendCharacters(Mutable, &chars, 1);
      }
      ++v7;
      --v6;
      ++v8;
    }
    while (Length != v7);
  }
  v18 = Mutable;
  CFRelease(v18);

  return v18;
}

id TUNotificationFromXPCObject()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("Name"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("Object"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("UserInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37C0]), "initWithName:object:userInfo:", v2, v3, v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

__CFString *TUStringForCallService(unsigned int a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_1E38A2DC0[a1];
}

__CFString *TUStringForCallStatus(unsigned int a1)
{
  if (a1 > 6)
    return 0;
  else
    return off_1E38A2DE0[a1];
}

uint64_t TUCallTTYTypeForTUDialRequestTTYType(uint64_t a1)
{
  if (a1 == 3)
    return 2;
  else
    return a1 == 2;
}

uint64_t TUDialRequestTTYTypeForTUCallTTYType(int a1)
{
  uint64_t v1;

  v1 = 1;
  if (a1 == 1)
    v1 = 2;
  if (a1 == 2)
    return 3;
  else
    return v1;
}

uint64_t TUMultiwayMaxConcurrentStreams()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.telephonyutilities.callservicesd"));
  v1 = objc_msgSend(v0, "integerForKey:", CFSTR("multiwayMaxConcurrentStreams"));
  if (v1 >= 1)
    v2 = v1;
  else
    v2 = 6;

  return v2;
}

uint64_t TUAllowLocalVideoRecording()
{
  void *v0;
  int v1;
  void *v2;
  uint64_t v3;

  if (!CFPreferencesAppValueIsForced(CFSTR("enableLocalVideoRecording"), CFSTR("com.apple.VideoConference")))
  {
    objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v0, "isInternalInstall");

    if (!v1)
      return 0;
  }
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.VideoConference"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("enableLocalVideoRecording"));

  return v3;
}

uint64_t TUAllowCallsDuringScreenSharing()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.springboard"));
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("SBAllowNotificationsDuringScreenSharing"));
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = v1;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "allowCallsDuringScreenSharing=%d", (uint8_t *)v4, 8u);
  }

  return v1;
}

uint64_t TULockdownModeEnabled()
{
  if (TULockdownModeEnabled_onceToken != -1)
    dispatch_once(&TULockdownModeEnabled_onceToken, &__block_literal_global_150);
  return TULockdownModeEnabled_lockdownModeEnabled;
}

uint64_t TUKickMemberTimeout()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend((id)CUTWeakLinkClass(), "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("qr-member-block-timeout"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "unsignedIntegerValue");
  else
    v3 = 30;

  return v3;
}

uint64_t TUBusinessConnectCallingDisabledUserDefault()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "tu_defaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("BusinessConnectCallingDisabled"));

  return v1;
}

id TUCurrentLocaleIdentifier()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "regionCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(v0, "languageCode");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v2, v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v0, "languageIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "currentLanguageIdentifier = %@", buf, 0xCu);
  }

  return v3;
}

uint64_t TUCurrentLocaleEligibleForCallScreeningOnboarding(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  int v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  int v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v4)
  {
    TUCurrentLocaleIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("en-CA")))
  {
    TUDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "We want to show call screening onboarding for en-CA, returning true", (uint8_t *)&v14, 2u);
    }

    v7 = 1;
  }
  else
  {
    v8 = TUCallScreeningEnabledForCurrentLocale(v3, v5);
    v9 = objc_msgSend(&unk_1E38E9828, "containsObject:", v5);
    TUDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CFSTR("NO");
      if (v8)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      if (v9)
        v11 = CFSTR("YES");
      v14 = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "CallScreeningEnabledForCurrentLocale: %@ localeInLVMAvailableLocales: %@", (uint8_t *)&v14, 0x16u);
    }

    v7 = v8 & (v9 ^ 1u);
  }

  return v7;
}

uint64_t TUCallScreeningRTTEnabled(void *a1)
{
  TUFeatureFlags *v1;
  uint64_t v2;

  v1 = a1;
  if (!v1)
    v1 = objc_alloc_init(TUFeatureFlags);
  v2 = TUCallScreeningActivatable(v1, 0)
    && (TUCallScreeningDisabledUserDefault() & 1) == 0
    && -[TUFeatureFlags callScreeningRTTEnabled](v1, "callScreeningRTTEnabled");

  return v2;
}

uint64_t TUCallRecordingActivatable(void *a1)
{
  TUFeatureFlags *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  if (!v1)
    v1 = objc_alloc_init(TUFeatureFlags);
  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BOOLeanValueForKeyInServerBag((uint64_t)CFSTR("disable-call-recording"), v2) & 1) != 0
    || !+[TUEligibilityChecker isCallRecordingEligible](TUEligibilityChecker, "isCallRecordingEligible"))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "deviceType") == 2 && -[TUFeatureFlags callRecordingEnabled](v1, "callRecordingEnabled");

  }
  return v4;
}

uint64_t TUCallRecordingEnabled(void *a1)
{
  TUFeatureFlags *v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (!v1)
    v1 = objc_alloc_init(TUFeatureFlags);
  if (TUCallRecordingActivatable(v1))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "tu_defaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("CallRecordingDisabled")) ^ 1;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id TUCallTranscriptionSupportedLocales(void *a1)
{
  TUFeatureFlags *v1;
  _BOOL4 v2;
  id *v3;
  id v4;

  v1 = a1;
  if (!v1)
    v1 = objc_alloc_init(TUFeatureFlags);
  v2 = -[TUFeatureFlags callTranscriptionExpansionEnabled](v1, "callTranscriptionExpansionEnabled");
  v3 = (id *)&TUCTAvailableLocalesExpansion;
  if (!v2)
    v3 = (id *)&TUCTAvailableLocales;
  v4 = *v3;

  return v4;
}

uint64_t TUCallTranscriptionSupported(void *a1, void *a2)
{
  TUFeatureFlags *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a1;
  v4 = a2;
  if (!v3)
    v3 = objc_alloc_init(TUFeatureFlags);
  v5 = v4;
  v6 = v5;
  if (!v5)
  {
    TUCurrentLocaleIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  TUCallTranscriptionSupportedLocales(v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  return v8;
}

uint64_t TUCaptionsLoggingEnabled()
{
  uint64_t result;
  void *v1;
  uint64_t v2;

  result = os_variant_has_internal_diagnostics();
  if ((_DWORD)result)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "tu_defaults");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "BOOLForKey:", CFSTR("CaptionsLoggingEnabled"));

    return v2;
  }
  return result;
}

uint64_t TUBusinessConnectCallingEnabled(void *a1)
{
  TUFeatureFlags *v1;
  uint64_t v2;

  v1 = a1;
  if (!v1)
    v1 = objc_alloc_init(TUFeatureFlags);
  if (-[TUFeatureFlags callsBusinessMetadataQuery](v1, "callsBusinessMetadataQuery"))
    v2 = TUBusinessConnectCallingDisabledUserDefault() ^ 1;
  else
    v2 = 0;

  return v2;
}

uint64_t TUClarityEnabled()
{
  if (TUClarityEnabled_onceToken != -1)
    dispatch_once(&TUClarityEnabled_onceToken, &__block_literal_global_186);
  return TUClarityEnabled_clarityEnabled;
}

void sub_19A58BF24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t TUVideoMessagingEnabled()
{
  void *v0;
  uint64_t v1;
  TUFeatureFlags *v2;

  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BOOLeanValueForKeyInServerBag((uint64_t)CFSTR("disable-video-messaging"), v0) & 1) != 0)
  {
    v1 = 0;
  }
  else
  {
    v2 = objc_alloc_init(TUFeatureFlags);
    v1 = -[TUFeatureFlags videoMessagingEnabled](v2, "videoMessagingEnabled");

  }
  return v1;
}

uint64_t TUDisableMacOSResultsStyling()
{
  return 0;
}

uint64_t TUBinaryGCD(int a1, int a2)
{
  uint64_t v2;
  char v3;
  int v4;
  int v5;
  int v6;
  int v7;
  BOOL v8;
  unsigned int v9;
  unsigned int v10;

  v2 = a2 | a1;
  if (a1 && a2)
  {
    if (((a2 | a1) & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      v3 = 0;
      v4 = a1;
      do
      {
        a1 = v4 >> 1;
        a2 >>= 1;
        ++v3;
        v5 = a2 | (v4 >> 1);
        v4 >>= 1;
      }
      while ((v5 & 1) == 0);
    }
    do
    {
      v6 = a1;
      a1 >>= 1;
    }
    while ((v6 & 1) == 0);
    do
    {
      do
      {
        v7 = a2;
        a2 >>= 1;
      }
      while ((v7 & 1) == 0);
      v9 = v6 - v7;
      v8 = v6 - v7 < 0;
      if (v6 >= v7)
        v6 = v7;
      if (v8)
        v10 = -v9;
      else
        v10 = v9;
      a2 = v10 >> 1;
    }
    while (v10 > 1);
    return (v6 << v3);
  }
  return v2;
}

double TUClosestLandscapeAspect(double a1, double a2)
{
  double v2;

  v2 = a1 / a2;
  if (fabs(v2 + -1.77777778) < 0.05)
    return 16.0;
  if (fabs(v2 + -1.6) < 0.05)
    return 8.0;
  if (fabs(v2 + -1.33333333) >= 0.05)
    return 3.0;
  return 4.0;
}

void TUOpenURLAndActivateWithCompletion(void *a1, char a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a3;
  if ((a2 & 1) == 0)
  {
    TUDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Attempting to open without activating the app on the platform that dones't support it url: %@", buf, 0xCu);
    }

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __TUOpenURLAndActivateWithCompletion_block_invoke;
  v10[3] = &unk_1E38A2CC0;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  TUOpenURLWithCompletion(v9, v10);

}

void TUOpenURLWithCompletion(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "url: %@", buf, 0xCu);
  }

  objc_msgSend((id)CUTWeakLinkClass(), "defaultWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __TUOpenURLWithCompletion_block_invoke;
  v8[3] = &unk_1E38A2CE8;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "openURL:configuration:completionHandler:", v3, 0, v8);

}

void TUOpenHomeScreenWithCompletion(void *a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v1 = a1;
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "TUOpenHomeScreen Request", v4, 2u);
  }

  objc_msgSend((id)CUTWeakLinkClass(), "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openApplicationWithBundleIdentifier:configuration:completionHandler:", CFSTR("com.apple.springboard"), 0, v1);

}

void TUOpenFaceTimeAppWithCompletion(void *a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  v1 = a1;
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "TUOpenFaceTimeApp Request", v5, 2u);
  }

  objc_msgSend((id)CUTWeakLinkClass(), "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  TUPreferredFaceTimeBundleIdentifier();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openApplicationWithBundleIdentifier:configuration:completionHandler:", v4, 0, v1);

}

void TURegisterIDSAvailabilityListener()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D34368], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addListenerID:forService:", CFSTR("com.apple.TelephonyUtilities.FTCServiceAvailabilityListenerID"), *MEMORY[0x1E0D34210]);

}

uint64_t TUIsIDSAvailableForFaceTime()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  const __CFString *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  LODWORD(v0) = +[TUCallCapabilities supportsDisplayingFaceTimeVideoCalls](TUCallCapabilities, "supportsDisplayingFaceTimeVideoCalls");
  objc_msgSend(MEMORY[0x1E0D34368], "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "availabilityForListenerID:forService:", CFSTR("com.apple.TelephonyUtilities.FTCServiceAvailabilityListenerID"), *MEMORY[0x1E0D34210]);
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("NO");
    if ((_DWORD)v0)
      v5 = CFSTR("YES");
    else
      v5 = CFSTR("NO");
    v7 = 138412802;
    v8 = v5;
    v9 = 2112;
    v10 = v1;
    if (v2 == 1)
      v4 = CFSTR("YES");
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "TUIsIDSAvailableForFaceTime supportsDisplayingFaceTimeVideoCalls: %@ IDSServiceAvailabilityController: %@ isFaceTimeServiceAvailable: %@", (uint8_t *)&v7, 0x20u);
  }

  if (v2 == 1)
    v0 = v0;
  else
    v0 = 0;

  return v0;
}

uint64_t TUIsBareMakoAccount()
{
  id v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  char v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0D34358]);
  v1 = (void *)objc_msgSend(v0, "initWithService:", *MEMORY[0x1E0D34210]);
  objc_msgSend(v1, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v17 = v1;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          objc_msgSend(v9, "handles");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v19;
            while (2)
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v19 != v13)
                  objc_enumerationMutation(v10);
                if ((objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "isUserVisible") & 1) != 0)
                {
                  v6 = 1;
                  goto LABEL_17;
                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
              if (v12)
                continue;
              break;
            }
          }
LABEL_17:

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

    v15 = v6 ^ 1;
    v1 = v17;
  }
  else
  {
    v15 = 0;
  }

  return v15 & 1;
}

id TUNameForContactWithFormatterStyle(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint8_t v24[16];

  v3 = a1;
  v4 = v3;
  if (!v3)
  {
    TUDefaultLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_19A50D000, v22, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find name for null contact", v24, 2u);
    }

    v7 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v3, "nickname");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && objc_msgSend(v7, "length"))
    goto LABEL_9;
  objc_msgSend(v4, "givenName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(v4, "familyName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (!v10)
      goto LABEL_8;
    v8 = (void *)objc_opt_new();
    objc_msgSend(v4, "givenName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setGivenName:", v11);

    objc_msgSend(v4, "familyName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFamilyName:", v12);

    objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v8, a2, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v15;
  }

LABEL_8:
  if (!v7)
    goto LABEL_10;
LABEL_9:
  if (!objc_msgSend(v7, "length"))
  {
LABEL_10:
    objc_msgSend(v4, "givenName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByTrimmingCharactersInSet:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v18;
    if (!v18)
    {
LABEL_12:
      objc_msgSend(v4, "familyName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringByTrimmingCharactersInSet:", v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v21;
      goto LABEL_16;
    }
  }
  if (!objc_msgSend(v7, "length"))
    goto LABEL_12;
LABEL_16:

  return v7;
}

id TUAppendItemToURLFragment(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
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
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = v7;
  v9 = 0;
  if (v5 && v6 && v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fragment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "fragment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("?%@"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", v14);
      v15 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    }
    objc_msgSend(v10, "setFragment:", 0);
    if (v15)
    {
      v32 = v8;
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", v6, v8);
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "queryItems");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = (void *)v16;
      v18 = v10;
      if (v17)
      {
        objc_msgSend(v15, "queryItems");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "arrayByAddingObject:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setQueryItems:", v20);

      }
      else
      {
        v33[0] = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setQueryItems:", v19);
      }

      objc_msgSend(v15, "URL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "absoluteString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringByReplacingOccurrencesOfString:withString:", CFSTR("?"), &stru_1E38A53C8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)MEMORY[0x1E0CB3998];
      v25 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v18, "URL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "absoluteString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithFormat:", CFSTR("%@#%@"), v27, v23);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsWithString:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v18;
      objc_msgSend(v29, "URL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v32;
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

uint64_t TUSharePlayForceDisabled()
{
  return 0;
}

uint64_t TUSharePlayProtocolVersion()
{
  return 4;
}

uint64_t TUMinimumSupportedSharePlayProtocolVersion()
{
  return 4;
}

uint64_t TUVisionFeatureVersion()
{
  return 0;
}

uint64_t TUMinimumSupportedVisionFeatureVersion()
{
  return 5;
}

uint64_t TUVisionCallEstablishmentVersion()
{
  return 0;
}

uint64_t TUIsPhotosSharePlayAvailable()
{
  return 0;
}

uint64_t TUIsRequestToScreenShareAvailable(void *a1, int a2, int a3)
{
  uint64_t v5;
  id v6;
  uint64_t v7;

  v5 = TUClarityEnabled_onceToken;
  v6 = a1;
  if (v5 != -1)
    dispatch_once(&TUClarityEnabled_onceToken, &__block_literal_global_186);
  v7 = TUIsRequestToScreenShareAvailableWithAssistiveAccessEnabled(v6, a2, a3, TUClarityEnabled_clarityEnabled);

  return v7;
}

uint64_t TUIsRequestToScreenShareAvailableWithAssistiveAccessEnabled(void *a1, int a2, int a3, int a4)
{
  TUFeatureFlags *v7;
  uint64_t v8;

  v7 = a1;
  if (!v7)
    v7 = objc_alloc_init(TUFeatureFlags);
  v8 = a3 & ~a4 & (a2 ^ 1) & -[TUFeatureFlags requestToScreenShareEnabled](v7, "requestToScreenShareEnabled");

  return v8;
}

BOOL TUDeviceHasHomeButton()
{
  if (TUDeviceHasHomeButton_onceToken != -1)
    dispatch_once(&TUDeviceHasHomeButton_onceToken, &__block_literal_global_207);
  return TUDeviceHasHomeButton_homeButtonType != 2;
}

uint64_t TUDeviceHasDynamicIsland()
{
  if (TUDeviceHasDynamicIsland_onceToken != -1)
    dispatch_once(&TUDeviceHasDynamicIsland_onceToken, &__block_literal_global_210);
  return TUDeviceHasDynamicIsland___supportsDynamicIsland;
}

uint64_t TUIsPersonaAvailable()
{
  return 0;
}

uint64_t TUIsStoreDemoModeEnabled()
{
  if (TUIsStoreDemoModeEnabled_onceToken != -1)
    dispatch_once(&TUIsStoreDemoModeEnabled_onceToken, &__block_literal_global_213);
  return TUIsStoreDemoModeEnabled_storeDemoModeEnabled;
}

uint64_t TUSimulatedModeEnabled()
{
  uint64_t result;
  TUFeatureFlags *v1;
  uint64_t v2;

  result = os_variant_has_internal_diagnostics();
  if ((_DWORD)result)
  {
    v1 = objc_alloc_init(TUFeatureFlags);
    v2 = -[TUFeatureFlags simulatedModeEnabled](v1, "simulatedModeEnabled");

    return v2;
  }
  return result;
}

uint64_t TUSilenceUnknownFaceTimeCallersDefaultValue()
{
  void *v0;
  uint64_t v1;

  objc_msgSend((id)CUTWeakLinkClass(), "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isGreenTea");

  return v1;
}

const __CFString *TUDeviceHasChinaSKU()
{
  const __CFString *result;
  const __CFString *v1;
  CFComparisonResult v2;

  result = (const __CFString *)MGGetStringAnswer();
  if (result)
  {
    v1 = result;
    v2 = CFStringCompare(result, CFSTR("CH"), 0);
    CFRelease(v1);
    return (const __CFString *)(v2 == kCFCompareEqualTo);
  }
  return result;
}

Class __getCLFSystemShellSwitcherClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!ClarityFoundationLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E38A2D80;
    v5 = 0;
    ClarityFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ClarityFoundationLibraryCore_frameworkLibrary)
    __getCLFSystemShellSwitcherClass_block_invoke_cold_1(&v3);
  result = objc_getClass("CLFSystemShellSwitcher");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCLFSystemShellSwitcherClass_block_invoke_cold_2();
  getCLFSystemShellSwitcherClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_2_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_19A58E694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id TUOversizedLog()
{
  if (TUOversizedLog_onceToken != -1)
    dispatch_once(&TUOversizedLog_onceToken, &__block_literal_global_8);
  return (id)TUOversizedLog_TUOversizedLog;
}

id TUOversizedLogQueue()
{
  if (TUOversizedLogQueue_onceToken != -1)
    dispatch_once(&TUOversizedLogQueue_onceToken, &__block_literal_global_10_1);
  return (id)TUOversizedLogQueue_TUOversizedLogQueue;
}

id TUConduitLog()
{
  if (TUConduitLog_onceToken != -1)
    dispatch_once(&TUConduitLog_onceToken, &__block_literal_global_12_1);
  return (id)TUConduitLog___log;
}

id TUGreenTeaLog()
{
  if (TUGreenTeaLog_onceToken != -1)
    dispatch_once(&TUGreenTeaLog_onceToken, &__block_literal_global_14_1);
  return (id)TUGreenTeaLog_TUGreenTeaLog;
}

void TUGreenTeaLogOutgoingSiriCallToHandle(void *a1)
{
  id v1;
  NSObject *v2;
  _BOOL4 v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  TUGreenTeaLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (v3)
    {
      objc_msgSend(v1, "value");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Making outgoing call via Siri to %@", (uint8_t *)&v5, 0xCu);

    }
  }
  else if (v3)
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Making outgoing call via Siri", (uint8_t *)&v5, 2u);
  }

}

uint64_t CSDMessagingMemberAssociationClaimReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  CSDMessagingHandle *v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  uint64_t v40;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 56) |= 4u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_51;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_53;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_51:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_53:
        v40 = 52;
        goto LABEL_62;
      case 2u:
        v24 = objc_alloc_init(CSDMessagingHandle);
        v25 = 40;
        goto LABEL_38;
      case 3u:
        v26 = 0;
        v27 = 0;
        v28 = 0;
        *(_BYTE *)(a1 + 56) |= 1u;
        while (2)
        {
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v30 + 1;
            v28 |= (unint64_t)(v31 & 0x7F) << v26;
            if (v31 < 0)
            {
              v26 += 7;
              v14 = v27++ >= 9;
              if (v14)
              {
                v28 = 0;
                goto LABEL_57;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v28 = 0;
LABEL_57:
        *(_QWORD *)(a1 + 8) = v28;
        goto LABEL_63;
      case 4u:
        PBReaderReadString();
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = 32;
        goto LABEL_42;
      case 5u:
        v24 = objc_alloc_init(CSDMessagingHandle);
        v25 = 16;
LABEL_38:
        objc_storeStrong((id *)(a1 + v25), v24);
        if (PBReaderPlaceMark() && (CSDMessagingHandleReadFrom((uint64_t)v24, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_63:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 6u:
        PBReaderReadString();
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = 24;
LABEL_42:
        v34 = *(void **)(a1 + v33);
        *(_QWORD *)(a1 + v33) = v32;

        goto LABEL_63;
      case 7u:
        v35 = 0;
        v36 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 56) |= 2u;
        while (2)
        {
          v37 = *v3;
          v38 = *(_QWORD *)(a2 + v37);
          if (v38 == -1 || v38 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v39 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v38);
            *(_QWORD *)(a2 + v37) = v38 + 1;
            v19 |= (unint64_t)(v39 & 0x7F) << v35;
            if (v39 < 0)
            {
              v35 += 7;
              v14 = v36++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_61;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_61:
        v40 = 48;
LABEL_62:
        *(_DWORD *)(a1 + v40) = v19;
        goto LABEL_63;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_63;
    }
  }
}

uint64_t _TUReplyWithMessageStore_HandleMessageStoreChanged(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_handleMessagesStoreChanged");
}

id _TUFormatReplyForOptions(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = a1;
  TUBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CANNED_REPLY_ACTION_SHEET_OPTION_FORMAT_%@"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", v4, v2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_19A59A588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A59A8EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A59B738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A59B9C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A59D100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getFTDeviceSupportClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!FTServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E38A2FD0;
    v5 = 0;
    FTServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!FTServicesLibraryCore_frameworkLibrary)
    __getFTDeviceSupportClass_block_invoke_cold_1(&v3);
  result = objc_getClass("FTDeviceSupport");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getFTDeviceSupportClass_block_invoke_cold_2();
  getFTDeviceSupportClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19A59FF24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getNPSManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E38A3048;
    v5 = 0;
    NanoPreferencesSyncLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
    __getNPSManagerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("NPSManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getNPSManagerClass_block_invoke_cold_2();
  getNPSManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19A5A126C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19A5A31C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A5A348C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A5A3650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A5A6810(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19A5A6BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A5A6D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A5A6EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A5A6FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A5A7148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A5A72B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A5ACE10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_19A5AF8D8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_19A5AFD7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19A5B1D84(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, (os_log_type_t)0x90u, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, (os_log_type_t)0x90u, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_4_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, (os_log_type_t)0x90u, a4, (uint8_t *)va, 0x20u);
}

void sub_19A5B6CB4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_19A5B6F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBCSBusinessQueryServiceClass()
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
  v0 = (void *)getBCSBusinessQueryServiceClass_softClass;
  v7 = getBCSBusinessQueryServiceClass_softClass;
  if (!getBCSBusinessQueryServiceClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getBCSBusinessQueryServiceClass_block_invoke;
    v3[3] = &unk_1E38A1710;
    v3[4] = &v4;
    __getBCSBusinessQueryServiceClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19A5B7A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A5B7C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBCSBusinessQueryServiceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!BusinessChatServiceLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E38A36A8;
    v5 = 0;
    BusinessChatServiceLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!BusinessChatServiceLibraryCore_frameworkLibrary)
    __getBCSBusinessQueryServiceClass_block_invoke_cold_1(&v3);
  result = objc_getClass("BCSBusinessQueryService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBCSBusinessQueryServiceClass_block_invoke_cold_2();
  getBCSBusinessQueryServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void TUNotifyOfReplyWithMessage(void *a1, void *a2, uint64_t a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  void *v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("Recipient");
  v18[1] = CFSTR("Destination");
  v19[0] = a1;
  v19[1] = a2;
  v18[2] = CFSTR("PersonID");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a4;
  v9 = a2;
  v10 = a1;
  objc_msgSend(v7, "numberWithInt:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = CFSTR("Message");
  v19[2] = v11;
  v19[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  TUDefaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = CFSTR("com.apple.telephonyutilities.TUReplyWithMessageBulletinBoardMessage");
    v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_19A50D000, v13, OS_LOG_TYPE_DEFAULT, "TUNotifyOfReplyWithMessage: Sending BB message with name=%@ payload=%@", (uint8_t *)&v14, 0x16u);
  }

  if (TUNotifyOfReplyWithMessage__pred_BBDataProviderSendMessageBulletinBoard != -1)
    dispatch_once(&TUNotifyOfReplyWithMessage__pred_BBDataProviderSendMessageBulletinBoard, &__block_literal_global_42);
  TUNotifyOfReplyWithMessage__BBDataProviderSendMessage(CFSTR("com.apple.MobileSMS"), CFSTR("com.apple.telephonyutilities.TUReplyWithMessageBulletinBoardMessage"), v12);

}

void TUNotifyOfRemindMeLater(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  void *v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v19[0] = v5;
  v18[0] = CFSTR("Caller");
  v18[1] = CFSTR("IsWhenILeave");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a1;
  objc_msgSend(v7, "numberWithBool:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v9;
  v18[2] = CFSTR("ReminderIdentifier");
  objc_msgSend(v8, "calendarItemIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v19[2] = v10;
  v18[3] = CFSTR("LocationText");
  v11 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)

  TUDefaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = CFSTR("com.apple.telephonyutilities.TURemindMeLaterBulletinBoardMessage");
    v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_19A50D000, v13, OS_LOG_TYPE_DEFAULT, "TUNotifyOfRemindMeLater: Sending BB message with name=%@ payload=%@", (uint8_t *)&v14, 0x16u);
  }

  if (TUNotifyOfRemindMeLater__pred_BBDataProviderSendMessageBulletinBoard != -1)
    dispatch_once(&TUNotifyOfRemindMeLater__pred_BBDataProviderSendMessageBulletinBoard, &__block_literal_global_31_0);
  TUNotifyOfRemindMeLater__BBDataProviderSendMessage(CFSTR("com.apple.reminders"), CFSTR("com.apple.telephonyutilities.TURemindMeLaterBulletinBoardMessage"), v12);

}

void TUNotifyOfRemindMeLaterWhenILeave(void *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  void *v15;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v17[0] = a1;
  v16[0] = CFSTR("Caller");
  v16[1] = CFSTR("IsWhenILeave");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  v7 = a2;
  v8 = a1;
  objc_msgSend(v5, "numberWithBool:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  v17[2] = v7;
  v16[2] = CFSTR("CallBackString");
  v16[3] = CFSTR("WhenILeaveString");
  v17[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  TUDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = CFSTR("com.apple.telephonyutilities.TURemindMeLaterBulletinBoardMessage");
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_19A50D000, v11, OS_LOG_TYPE_DEFAULT, "TUNotifyOfRemindMeLaterWhenILeave: Sending BB message with name=%@ payload=%@", (uint8_t *)&v12, 0x16u);
  }

  if (TUNotifyOfRemindMeLaterWhenILeave__pred_BBDataProviderSendMessageBulletinBoard != -1)
    dispatch_once(&TUNotifyOfRemindMeLaterWhenILeave__pred_BBDataProviderSendMessageBulletinBoard, &__block_literal_global_34_1);
  TUNotifyOfRemindMeLaterWhenILeave__BBDataProviderSendMessage(CFSTR("com.apple.reminders"), CFSTR("com.apple.telephonyutilities.TURemindMeLaterBulletinBoardMessage"), v10);

}

void sub_19A5C5878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A5C6010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19A5C6104(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t screenCaptureCapabilities()
{
  uint64_t v0;
  NSObject *v1;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = objc_msgSend((id)CUTWeakLinkClass(), "captureCapabilities");
  TUDefaultLog();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 134217984;
    v4 = v0;
    _os_log_impl(&dword_19A50D000, v1, OS_LOG_TYPE_DEFAULT, "captureCapabilities: %ld", (uint8_t *)&v3, 0xCu);
  }

  return v0;
}

void *__getIMSPIQueryMessageWithGUIDAndLoadAttachmentsWithQOSSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!IMCoreLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_1E38A3978;
    v5 = 0;
    IMCoreLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!IMCoreLibraryCore_frameworkLibrary_0)
    __getIMSPIQueryMessageWithGUIDAndLoadAttachmentsWithQOSSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)IMCoreLibraryCore_frameworkLibrary_0, "IMSPIQueryMessageWithGUIDAndLoadAttachmentsWithQOS");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getIMSPIQueryMessageWithGUIDAndLoadAttachmentsWithQOSSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                                + 8)
                                                                                    + 24);
  return result;
}

void sub_19A5D26B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *TUPreferredFaceTimeBundleIdentifier()
{
  return CFSTR("com.apple.facetime");
}

void sub_19A5D5684(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19A5D6E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKShareClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!CloudKitLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E38A3BD0;
    v5 = 0;
    CloudKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CloudKitLibraryCore_frameworkLibrary)
    __getCKShareClass_block_invoke_cold_1(&v3);
  result = objc_getClass("CKShare");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCKShareClass_block_invoke_cold_2();
  getCKShareClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19A5D9D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSWCollaborationHighlightClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!SharedWithYouLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_1E38A3C10;
    v5 = 0;
    SharedWithYouLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!SharedWithYouLibraryCore_frameworkLibrary_0)
    __getSWCollaborationHighlightClass_block_invoke_cold_1_0(&v3);
  result = objc_getClass("SWCollaborationHighlight");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSWCollaborationHighlightClass_block_invoke_cold_2();
  getSWCollaborationHighlightClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t TUCurrentProcessHasEntitlement(void *a1)
{
  __CFString *v1;
  __SecTask *v2;
  __SecTask *v3;
  CFTypeRef v4;
  void *v5;
  CFTypeID v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  CFErrorRef error;
  uint8_t buf[4];
  __CFString *v13;
  __int16 v14;
  CFErrorRef v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (v2)
  {
    v3 = v2;
    error = 0;
    v4 = SecTaskCopyValueForEntitlement(v2, v1, &error);
    if (v4)
    {
      v5 = (void *)v4;
      v6 = CFGetTypeID(v4);
      if (v6 == CFBooleanGetTypeID())
        v7 = objc_msgSend(v5, "BOOLValue");
      else
        v7 = 0;
      CFRelease(v5);
    }
    else
    {
      TUDefaultLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v1;
        v14 = 2112;
        v15 = error;
        _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Unexpected value for %@ entitlement: %@", buf, 0x16u);
      }

      v7 = 0;
    }
    CFRelease(v3);
  }
  else
  {
    TUDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Unexpected NULL value returned from SecTaskCreateFromSelf()", buf, 2u);
    }

    v7 = 0;
  }

  return v7;
}

void sub_19A5E683C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_19A5E7568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getTPSCarrierBundleControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!TelephonyPreferencesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E38A3CA0;
    v5 = 0;
    TelephonyPreferencesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!TelephonyPreferencesLibraryCore_frameworkLibrary)
    __getTPSCarrierBundleControllerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("TPSCarrierBundleController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getTPSCarrierBundleControllerClass_block_invoke_cold_2();
  getTPSCarrierBundleControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _MKBGetDeviceLockState()
{
  uint64_t (*v0)(_QWORD);
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (uint64_t (*)(_QWORD))getMKBGetDeviceLockStateSymbolLoc_ptr;
  v6 = getMKBGetDeviceLockStateSymbolLoc_ptr;
  if (!getMKBGetDeviceLockStateSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getMKBGetDeviceLockStateSymbolLoc_block_invoke;
    v2[3] = &unk_1E38A1710;
    v2[4] = &v3;
    __getMKBGetDeviceLockStateSymbolLoc_block_invoke((uint64_t)v2);
    v0 = (uint64_t (*)(_QWORD))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    _MKBGetDeviceLockState_cold_1();
  return v0(0);
}

void sub_19A5E9984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMKBGetDeviceLockStateSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!MobileKeyBagLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E38A3CB8;
    v5 = 0;
    MobileKeyBagLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MobileKeyBagLibraryCore_frameworkLibrary)
    __getMKBGetDeviceLockStateSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)MobileKeyBagLibraryCore_frameworkLibrary, "MKBGetDeviceLockState");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMKBGetDeviceLockStateSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19A5EA65C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19A5EB5F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_19A5EB9B0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 64));
  _Unwind_Resume(a1);
}

TUCallProviderManager *callProviderManagerGeneratorBlock_block_invoke()
{
  return objc_alloc_init(TUCallProviderManager);
}

id legacyAddressBookIdentifierToContactIdentifierTransformBlock_block_invoke_2(uint64_t a1, void *a2, int a3)
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == -1)
    return 0;
  objc_msgSend(a2, "contactIdentifierFromPersonID:", v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_19A5F5A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getPSSimStatusCacheClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!SettingsCellularLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E38A3FF8;
    v5 = 0;
    SettingsCellularLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SettingsCellularLibraryCore_frameworkLibrary)
    __getPSSimStatusCacheClass_block_invoke_cold_1(&v3);
  result = objc_getClass("PSSimStatusCache");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPSSimStatusCacheClass_block_invoke_cold_2();
  getPSSimStatusCacheClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

double __CUTWeakCGSizeZero()
{
  if (__CUTWeakCGSizeZero__pred_CGSizeZeroCoreGraphics_0 != -1)
    dispatch_once(&__CUTWeakCGSizeZero__pred_CGSizeZeroCoreGraphics_0, &__block_literal_global_1410);
  return *(double *)&__CUTStaticWeak_CGSizeZero_0;
}

void sub_19A5FB2B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A5FBB84(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19A5FC1E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  os_unfair_lock_s *v19;
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  os_unfair_lock_unlock(v19);
  _Unwind_Resume(a1);
}

void sub_19A5FC6D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A5FD218(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_19A5FE830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19A6002D8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_19A602E68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19A6039F0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19A6090F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19A60BA20(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_19A60CDB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_19A60CFFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19A60D8B4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getIMNicknameProviderClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!IMCoreLibraryCore_frameworkLibrary_1)
  {
    v4 = xmmword_1E38A4880;
    v5 = 0;
    IMCoreLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!IMCoreLibraryCore_frameworkLibrary_1)
    __getIMNicknameProviderClass_block_invoke_cold_1(&v3);
  result = objc_getClass("IMNicknameProvider");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getIMNicknameProviderClass_block_invoke_cold_2();
  getIMNicknameProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19A60EE44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A60EFD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A60F318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getINPersonClass()
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
  v0 = (void *)getINPersonClass_softClass;
  v7 = getINPersonClass_softClass;
  if (!getINPersonClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getINPersonClass_block_invoke;
    v3[3] = &unk_1E38A1710;
    v3[4] = &v4;
    __getINPersonClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19A60F3D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getINStartCallIntentClass_block_invoke(uint64_t a1)
{
  Class result;

  IntentsLibrary();
  result = objc_getClass("INStartCallIntent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getINStartCallIntentClass_block_invoke_cold_1();
  getINStartCallIntentClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t IntentsLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!IntentsLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E38A48D8;
    v3 = 0;
    IntentsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IntentsLibraryCore_frameworkLibrary)
    IntentsLibrary_cold_1(&v1);
  return IntentsLibraryCore_frameworkLibrary;
}

Class __getINPersonHandleClass_block_invoke(uint64_t a1)
{
  Class result;

  IntentsLibrary();
  result = objc_getClass("INPersonHandle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getINPersonHandleClass_block_invoke_cold_1();
  getINPersonHandleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getINPersonClass_block_invoke(uint64_t a1)
{
  Class result;

  IntentsLibrary();
  result = objc_getClass("INPerson");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getINPersonClass_block_invoke_cold_1();
  getINPersonClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19A611D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A613A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A613BE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A613D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A613EE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A613FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A6140C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A614364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A61757C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t CSDMessagingHandleReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  BOOL v16;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  void *v26;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (2)
    {
      if (!*(_BYTE *)(a2 + *v5))
      {
        v8 = 0;
        v9 = 0;
        v10 = 0;
        while (1)
        {
          v11 = *v3;
          v12 = *(_QWORD *)(a2 + v11);
          if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
            break;
          v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
          *(_QWORD *)(a2 + v11) = v12 + 1;
          v10 |= (unint64_t)(v13 & 0x7F) << v8;
          if ((v13 & 0x80) == 0)
            goto LABEL_12;
          v8 += 7;
          v14 = v9++ >= 9;
          if (v14)
          {
            v10 = 0;
            v15 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
        v15 = *(unsigned __int8 *)(a2 + *v5);
        if (*(_BYTE *)(a2 + *v5))
          v10 = 0;
LABEL_14:
        if (v15)
          v16 = 1;
        else
          v16 = (v10 & 7) == 4;
        if (!v16)
        {
          switch((v10 >> 3))
          {
            case 1u:
              v17 = 0;
              v18 = 0;
              v19 = 0;
              *(_BYTE *)(a1 + 40) |= 1u;
              break;
            case 2u:
              PBReaderReadString();
              v23 = objc_claimAutoreleasedReturnValue();
              v24 = 32;
              goto LABEL_31;
            case 4u:
              PBReaderReadString();
              v23 = objc_claimAutoreleasedReturnValue();
              v24 = 8;
              goto LABEL_31;
            case 5u:
              PBReaderReadString();
              v23 = objc_claimAutoreleasedReturnValue();
              v24 = 16;
LABEL_31:
              v26 = *(void **)(a1 + v24);
              *(_QWORD *)(a1 + v24) = v23;

              goto LABEL_36;
            default:
              result = PBReaderSkipValueWithTag();
              if (!(_DWORD)result)
                return result;
LABEL_36:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
          }
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_33;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_35;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_35:
          *(_DWORD *)(a1 + 24) = v19;
          goto LABEL_36;
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19A61C41C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t aBlock[6];

  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v6 = sub_19A637A5C();
  v7 = sub_19A637BB8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = swift_slowAlloc();
    v15 = swift_slowAlloc();
    aBlock[0] = v15;
    *(_DWORD *)v8 = 136315394;
    swift_bridgeObjectRetain();
    sub_19A61C7BC(a1, a2, aBlock);
    sub_19A637C24();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v8 + 12) = 2080;
    sub_19A61CDFC();
    swift_bridgeObjectRetain();
    v9 = sub_19A637A98();
    v11 = v10;
    swift_bridgeObjectRelease();
    sub_19A61C7BC(v9, v11, aBlock);
    sub_19A637C24();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_19A50D000, v6, v7, "logging core analytics view %s with dictionary %s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x19AEC987C](v15, -1, -1);
    MEMORY[0x19AEC987C](v8, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  v12 = (void *)sub_19A637AB0();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  aBlock[4] = (uint64_t)sub_19A61C6E4;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_19A61C6EC;
  aBlock[3] = (uint64_t)&block_descriptor;
  v14 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v14);

}

uint64_t sub_19A61C6C0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19A61C6E4()
{
  return swift_bridgeObjectRetain();
}

id sub_19A61C6EC(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_19A61CDFC();
    v4 = (void *)sub_19A637A80();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t AnalyticsLogger.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC18TelephonyUtilities15AnalyticsLogger_logger;
  v2 = sub_19A637A74();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_19A61C7BC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_19A61C88C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_19A61CE58((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_19A61CE58((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_19A61C88C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_19A637C30();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_19A61CA44(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_19A637C6C();
  if (!v8)
  {
    sub_19A637C78();
    __break(1u);
LABEL_17:
    result = sub_19A637CC0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_19A61CA44(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_19A61CAD8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_19A61CCB0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_19A61CCB0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_19A61CAD8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_19A61CC4C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_19A637C48();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_19A637C78();
      __break(1u);
LABEL_10:
      v2 = sub_19A637B04();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_19A637CC0();
    __break(1u);
LABEL_14:
    result = sub_19A637C78();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_19A61CC4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A6BC8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_19A61CCB0(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A6BC8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_19A637CC0();
  __break(1u);
  return result;
}

unint64_t sub_19A61CDFC()
{
  unint64_t result;

  result = qword_1EE3A98A8;
  if (!qword_1EE3A98A8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EE3A98A8);
  }
  return result;
}

uint64_t sub_19A61CE38()
{
  return type metadata accessor for AnalyticsLogger();
}

uint64_t method lookup function for AnalyticsLogger()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AnalyticsLogger.logEvent(_:withCoreAnalyticsDictionary:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t sub_19A61CE58(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void type metadata accessor for CMFormatDescription(uint64_t a1)
{
  sub_19A61CFE8(a1, &qword_1EE3A98B0);
}

__n128 __swift_memcpy24_4(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_19A61CEC4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_19A61CEE4(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 24) = v3;
  return result;
}

void type metadata accessor for CMTime(uint64_t a1)
{
  sub_19A61CFE8(a1, &qword_1EE3A98B8);
}

uint64_t sub_19A61CF24(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy48_4(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_19A61CF68(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_19A61CF88(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 48) = v3;
  return result;
}

void type metadata accessor for CMTimeRange(uint64_t a1)
{
  sub_19A61CFE8(a1, &qword_1EE3A98C0);
}

void type metadata accessor for CMTimeFlags(uint64_t a1)
{
  sub_19A61CFE8(a1, &qword_1EE3A98C8);
}

void sub_19A61CFE8(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_19A61D03C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[83] = v1;
  v2[82] = a1;
  v3 = sub_19A637918();
  v2[84] = v3;
  v2[85] = *(_QWORD *)(v3 - 8);
  v2[86] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19A61D0CC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (qword_1EE3A9860 != -1)
    swift_once();
  v1 = v0[86];
  v2 = v0[85];
  v3 = v0[84];
  v4 = v0[82];
  v5 = sub_19A637A74();
  v0[87] = __swift_project_value_buffer(v5, (uint64_t)qword_1EE3AA8E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v6 = sub_19A637A5C();
  v7 = sub_19A637BB8();
  v8 = os_log_type_enabled(v6, v7);
  v9 = v0[86];
  v10 = v0[85];
  v11 = v0[84];
  if (v8)
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    v21[0] = v13;
    *(_DWORD *)v12 = 136446210;
    sub_19A624228(&qword_1EE3A9A68, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v14 = sub_19A637CE4();
    v0[81] = sub_19A61C7BC(v14, v15, v21);
    sub_19A637C24();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    _os_log_impl(&dword_19A50D000, v6, v7, "Appending audio tracks from url %{public}s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AEC987C](v13, -1, -1);
    MEMORY[0x19AEC987C](v12, -1, -1);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v10 + 8))(v0[86], v0[84]);
  }

  v16 = objc_allocWithZone(MEMORY[0x1E0C8B3C0]);
  v17 = (void *)sub_19A6378C4();
  v18 = objc_msgSend(v16, sel_initWithURL_options_, v17, 0);
  v0[88] = v18;

  v19 = *MEMORY[0x1E0C8A7A0];
  v0[89] = *MEMORY[0x1E0C8A7A0];
  v0[15] = v0 + 73;
  v0[10] = v0;
  v0[11] = sub_19A61D3BC;
  v0[46] = swift_continuation_init();
  v0[42] = MEMORY[0x1E0C809B0];
  v0[43] = 0x40000000;
  v0[44] = sub_19A61E7A0;
  v0[45] = &block_descriptor_0;
  objc_msgSend(v18, sel_loadTracksWithMediaType_completionHandler_, v19, v0 + 42);
  return swift_continuation_await();
}

uint64_t sub_19A61D3BC()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 720) = *(_QWORD *)(*(_QWORD *)v0 + 112);
  return swift_task_switch();
}

uint64_t sub_19A61D460()
{
  _QWORD *v0;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;

  v1 = v0[73];
  if ((v1 & 0xC000000000000001) != 0)
  {
    v2 = (id)MEMORY[0x19AEC8688](0, v0[73]);
  }
  else
  {
    if (!*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
      __break(1u);
    v2 = *(id *)(v1 + 32);
  }
  v3 = v2;
  swift_bridgeObjectRelease();
  v0[91] = v3;
  v4 = v0[89];
  v5 = (void *)v0[88];
  v0[7] = v0 + 79;
  v0[2] = v0;
  v0[3] = sub_19A61D580;
  v0[51] = swift_continuation_init();
  v0[47] = MEMORY[0x1E0C809B0];
  v0[48] = 0x40000000;
  v0[49] = sub_19A61E7A0;
  v0[50] = &block_descriptor_8;
  objc_msgSend(v5, sel_loadTracksWithMediaType_completionHandler_, v4, v0 + 47);
  return swift_continuation_await();
}

uint64_t sub_19A61D580()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 736) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_19A61D624()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD *v7;
  NSObject *v9;
  uint64_t v10;
  uint8_t *v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;

  v1 = *(_QWORD *)(v0 + 632);
  if ((v1 & 0xC000000000000001) != 0)
  {
    v2 = (id)MEMORY[0x19AEC8688](1, *(_QWORD *)(v0 + 632));
  }
  else
  {
    if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10) < 2uLL)
      __break(1u);
    v2 = *(id *)(v1 + 40);
  }
  v3 = v2;
  *(_QWORD *)(v0 + 744) = v2;
  v4 = *(_QWORD *)(v0 + 728);
  swift_bridgeObjectRelease();
  if (v4)
  {
    v5 = *(void **)(v0 + 728);
    if (v3)
    {
      *(_QWORD *)(v0 + 752) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9A98);
      v5;
      v6 = v3;
      *(_QWORD *)(v0 + 760) = sub_19A637A20();
      v7 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 768) = v7;
      *v7 = v0;
      v7[1] = sub_19A61DB64;
      return sub_19A637C0C();
    }
    v3 = v5;
    v13 = sub_19A637A5C();
    v14 = sub_19A637BB8();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_19A50D000, v13, v14, "Missing remote audio track", v15, 2u);
      MEMORY[0x19AEC987C](v15, -1, -1);
    }
    v12 = *(void **)(v0 + 704);

    type metadata accessor for RecordingCompositionError();
    sub_19A624228(&qword_1EE3A9A88, (uint64_t (*)(uint64_t))type metadata accessor for RecordingCompositionError, (uint64_t)&unk_19A65DFA8);
    swift_allocError();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();

  }
  else
  {
    v9 = sub_19A637A5C();
    v10 = sub_19A637BB8();
    if (os_log_type_enabled(v9, (os_log_type_t)v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_19A50D000, v9, (os_log_type_t)v10, "Missing local audio track", v11, 2u);
      MEMORY[0x19AEC987C](v11, -1, -1);
    }
    v12 = *(void **)(v0 + 704);

    type metadata accessor for RecordingCompositionError();
    sub_19A624228(&qword_1EE3A9A88, (uint64_t (*)(uint64_t))type metadata accessor for RecordingCompositionError, (uint64_t)&unk_19A65DFA8);
    swift_allocError();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
  }

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19A61D928()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint8_t *v10;

  v1 = *(void **)(v0 + 736);
  v2 = *(_QWORD *)(v0 + 728);
  swift_willThrow();

  if (v2)
  {
    v3 = *(id *)(v0 + 728);
    v4 = sub_19A637A5C();
    v5 = sub_19A637BB8();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_19A50D000, v4, v5, "Missing remote audio track", v6, 2u);
      MEMORY[0x19AEC987C](v6, -1, -1);
    }
    v7 = *(void **)(v0 + 704);

    type metadata accessor for RecordingCompositionError();
    sub_19A624228(&qword_1EE3A9A88, (uint64_t (*)(uint64_t))type metadata accessor for RecordingCompositionError, (uint64_t)&unk_19A65DFA8);
    swift_allocError();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();

  }
  else
  {
    v8 = sub_19A637A5C();
    v9 = sub_19A637BB8();
    if (os_log_type_enabled(v8, (os_log_type_t)v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19A50D000, v8, (os_log_type_t)v9, "Missing local audio track", v10, 2u);
      MEMORY[0x19AEC987C](v10, -1, -1);
    }
    v7 = *(void **)(v0 + 704);

    type metadata accessor for RecordingCompositionError();
    sub_19A624228(&qword_1EE3A9A88, (uint64_t (*)(uint64_t))type metadata accessor for RecordingCompositionError, (uint64_t)&unk_19A65DFA8);
    swift_allocError();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
  }

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19A61DB64()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 776) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_19A61DC1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  void *v13;
  id v14;
  _QWORD *v15;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v1 = *(_QWORD *)(v0 + 728);
  v2 = *(uint64_t **)(v0 + 664);
  v3 = *(_QWORD *)(v0 + 240);
  v4 = *(_QWORD *)(v0 + 280);
  v5 = *(_QWORD *)(v0 + 248);
  v6 = *(_QWORD *)(v0 + 272);
  v7 = *(_OWORD *)(v0 + 256);
  v8 = (void *)v2[4];
  v9 = *v2;
  v10 = v2[2];
  v11 = v2[1];
  *(_QWORD *)(v0 + 608) = 0;
  *(_QWORD *)(v0 + 288) = v3;
  *(_QWORD *)(v0 + 296) = v5;
  *(_OWORD *)(v0 + 304) = v7;
  *(_QWORD *)(v0 + 320) = v6;
  *(_QWORD *)(v0 + 328) = v4;
  *(_QWORD *)(v0 + 440) = v9;
  *(_QWORD *)(v0 + 448) = v11;
  *(_QWORD *)(v0 + 456) = v10;
  v12 = objc_msgSend(v8, sel_insertTimeRange_ofTrack_atTime_error_, v0 + 288, v1, v0 + 440, v0 + 608);
  v13 = *(void **)(v0 + 608);
  if (v12)
  {
    v14 = v13;
    *(_QWORD *)(v0 + 784) = sub_19A637A20();
    v15 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 792) = v15;
    *v15 = v0;
    v15[1] = sub_19A61DDBC;
    return sub_19A637C0C();
  }
  else
  {
    v17 = *(void **)(v0 + 744);
    v18 = *(void **)(v0 + 728);
    v19 = *(void **)(v0 + 704);
    v20 = v13;
    sub_19A63787C();

    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_19A61DDBC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 800) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_19A61DE74()
{
  uint64_t v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  unsigned int v11;
  void *v12;
  id v13;
  _QWORD *v14;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v1 = *(uint64_t **)(v0 + 664);
  v2 = (void *)v1[5];
  v3 = *v1;
  v4 = v1[2];
  v5 = v1[1];
  *(_QWORD *)(v0 + 144) = *(_QWORD *)(v0 + 192);
  v6 = *(_QWORD *)(v0 + 744);
  v7 = *(_QWORD *)(v0 + 232);
  v8 = *(_QWORD *)(v0 + 200);
  v9 = *(_QWORD *)(v0 + 224);
  v10 = *(_OWORD *)(v0 + 208);
  *(_QWORD *)(v0 + 592) = 0;
  *(_QWORD *)(v0 + 152) = v8;
  *(_OWORD *)(v0 + 160) = v10;
  *(_QWORD *)(v0 + 176) = v9;
  *(_QWORD *)(v0 + 184) = v7;
  *(_QWORD *)(v0 + 536) = v3;
  *(_QWORD *)(v0 + 544) = v5;
  *(_QWORD *)(v0 + 552) = v4;
  v11 = objc_msgSend(v2, sel_insertTimeRange_ofTrack_atTime_error_, v0 + 144, v6, v0 + 536, v0 + 592);
  v12 = *(void **)(v0 + 592);
  if (v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9AA0);
    v13 = v12;
    *(_QWORD *)(v0 + 808) = sub_19A637A2C();
    v14 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 816) = v14;
    *v14 = v0;
    v14[1] = sub_19A61E028;
    return sub_19A637C0C();
  }
  else
  {
    v16 = *(void **)(v0 + 744);
    v17 = *(void **)(v0 + 728);
    v18 = *(void **)(v0 + 704);
    v19 = v12;
    sub_19A63787C();

    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_19A61E028()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 824) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_19A61E0E0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CMTimeValue value;
  CMTimeScale timescale;
  CMTimeFlags flags;
  NSObject *v11;
  uint64_t v12;
  CMTimeValue v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  CMTimeValue v24;
  CMTimeScale v25;
  CMTimeFlags v26;
  CMTimeEpoch v27;
  CMTimeValue v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  NSObject *log;
  os_log_type_t type;
  void *typea;
  CMTimeEpoch epoch;
  CMTimeValue v38;
  CMTimeFlags v39;
  CMTimeScale v40;
  CMTime v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v1 = *(uint64_t **)(v0 + 664);
  v2 = *(_QWORD *)(v0 + 560);
  v3 = *(_DWORD *)(v0 + 568);
  v4 = *(_DWORD *)(v0 + 572);
  v5 = *(_QWORD *)(v0 + 576);
  v6 = *v1;
  v7 = v1[2];
  *(_QWORD *)(v0 + 520) = v1[1];
  *(_QWORD *)(v0 + 528) = v7;
  *(_QWORD *)(v0 + 488) = v2;
  *(_DWORD *)(v0 + 496) = v3;
  *(_DWORD *)(v0 + 500) = v4;
  *(_QWORD *)(v0 + 504) = v5;
  *(_QWORD *)(v0 + 512) = v6;
  CMTimeAdd(&v41, (CMTime *)(v0 + 512), (CMTime *)(v0 + 488));
  value = v41.value;
  timescale = v41.timescale;
  flags = v41.flags;
  epoch = v41.epoch;
  v11 = sub_19A637A5C();
  type = sub_19A637BB8();
  v39 = flags;
  v40 = timescale;
  v38 = value;
  if (os_log_type_enabled(v11, type))
  {
    v12 = swift_slowAlloc();
    v13 = swift_slowAlloc();
    v41.value = v13;
    *(_DWORD *)v12 = 134349314;
    sub_19A637C18();
    *(_QWORD *)(v0 + 624) = v14;
    sub_19A637C24();
    *(_WORD *)(v12 + 12) = 2080;
    *(_QWORD *)(v0 + 464) = v2;
    *(_DWORD *)(v0 + 472) = v3;
    *(_DWORD *)(v0 + 476) = v4;
    *(_QWORD *)(v0 + 480) = v5;
    type metadata accessor for CMTime(0);
    v15 = sub_19A637AD4();
    *(_QWORD *)(v0 + 640) = sub_19A61C7BC(v15, v16, &v41.value);
    sub_19A637C24();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_19A50D000, v11, type, "Added audio duration = %{public}f (%s)", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x19AEC987C](v13, -1, -1);
    MEMORY[0x19AEC987C](v12, -1, -1);
  }

  v17 = sub_19A637A5C();
  v18 = sub_19A637BB8();
  v19 = os_log_type_enabled(v17, v18);
  v20 = *(void **)(v0 + 744);
  v21 = *(void **)(v0 + 728);
  v22 = *(void **)(v0 + 704);
  if (v19)
  {
    typea = *(void **)(v0 + 704);
    v23 = swift_slowAlloc();
    v24 = swift_slowAlloc();
    v41.value = v24;
    *(_DWORD *)v23 = 134349314;
    v26 = v39;
    v25 = v40;
    log = v17;
    v27 = epoch;
    v28 = v38;
    sub_19A637C18();
    *(_QWORD *)(v0 + 600) = v29;
    sub_19A637C24();
    *(_WORD *)(v23 + 12) = 2080;
    *(_QWORD *)(v0 + 416) = v38;
    *(_DWORD *)(v0 + 424) = v40;
    *(_DWORD *)(v0 + 428) = v39;
    *(_QWORD *)(v0 + 432) = epoch;
    type metadata accessor for CMTime(0);
    v30 = sub_19A637AD4();
    *(_QWORD *)(v0 + 616) = sub_19A61C7BC(v30, v31, &v41.value);
    sub_19A637C24();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_19A50D000, log, v18, "Total audio duration = %{public}f (%s)", (uint8_t *)v23, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x19AEC987C](v24, -1, -1);
    MEMORY[0x19AEC987C](v23, -1, -1);

  }
  else
  {

    v26 = v39;
    v25 = v40;
    v27 = epoch;
    v28 = v38;
  }
  v32 = *(_QWORD *)(v0 + 664);
  *(_QWORD *)v32 = v28;
  *(_DWORD *)(v32 + 8) = v25;
  *(_DWORD *)(v32 + 12) = v26;
  *(_QWORD *)(v32 + 16) = v27;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19A61E4D8()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v1 = (void *)v0[90];
  swift_willThrow();

  v0[91] = 0;
  v2 = v0[89];
  v3 = (void *)v0[88];
  v0[7] = v0 + 79;
  v0[2] = v0;
  v0[3] = sub_19A61D580;
  v0[51] = swift_continuation_init();
  v0[47] = MEMORY[0x1E0C809B0];
  v0[48] = 0x40000000;
  v0[49] = sub_19A61E7A0;
  v0[50] = &block_descriptor_8;
  objc_msgSend(v3, sel_loadTracksWithMediaType_completionHandler_, v2, v0 + 47);
  return swift_continuation_await();
}

uint64_t sub_19A61E5CC()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(v0 + 744);
  v2 = *(void **)(v0 + 728);
  v3 = *(void **)(v0 + 704);

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19A61E668()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(v0 + 744);
  v2 = *(void **)(v0 + 728);
  v3 = *(void **)(v0 + 704);

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19A61E704()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(v0 + 744);
  v2 = *(void **)(v0 + 728);
  v3 = *(void **)(v0 + 704);

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19A61E7A0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9A70);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    sub_19A6241EC();
    **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = sub_19A637B40();
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_19A61E838(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[9] = a1;
  v2[10] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9A80);
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  v3 = sub_19A637918();
  v2[15] = v3;
  v2[16] = *(_QWORD *)(v3 - 8);
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  v2[25] = swift_task_alloc();
  v2[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19A61E980()
{
  uint64_t v0;
  unint64_t v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void (*v15)(unint64_t, uint64_t, uint64_t);
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, unint64_t, uint64_t);
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t, uint64_t);
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  os_log_type_t v66;
  uint64_t v67;
  uint8_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  NSObject *v83;
  os_log_type_t v84;
  uint8_t *v85;
  uint64_t v86;
  uint8_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD *v91;
  _QWORD *v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  _QWORD *v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  _QWORD *v106;
  uint64_t v107;
  os_log_type_t type;
  unint64_t v109;
  void (*v110)(uint64_t, uint64_t);
  uint64_t v111;
  void (*v112)(uint64_t, unint64_t, uint64_t);
  void (*v113)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v114;
  uint64_t v115[2];

  v115[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v3 = (void *)sub_19A6378C4();
  *(_QWORD *)(v0 + 16) = 0;
  v4 = objc_msgSend(v2, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v3, 0, 0, v0 + 16);

  v5 = *(void **)(v0 + 16);
  if (!v4)
  {
    v19 = v5;
    sub_19A63787C();

    swift_willThrow();
LABEL_41:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v6 = sub_19A637B40();
  v7 = v5;

  v115[0] = MEMORY[0x1E0DEE9D8];
  v8 = *(_QWORD *)(v0 + 128);
  v111 = *(_QWORD *)(v6 + 16);
  if (v111)
  {
    v9 = 0;
    v10 = MEMORY[0x1E0DEE9D8];
    while (v9 < *(_QWORD *)(v6 + 16))
    {
      v1 = v10;
      v11 = *(_QWORD *)(v0 + 112);
      v12 = *(_QWORD *)(v0 + 120);
      v13 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v14 = *(_QWORD *)(v8 + 72);
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v8 + 16))(v11, v6 + v13 + v14 * v9, v12);
      v113 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
      v113(v11, 0, 1, v12);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v11, 1, v12) == 1)
        goto LABEL_17;
      v15 = *(void (**)(unint64_t, uint64_t, uint64_t))(v8 + 32);
      v15(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120));
      if ((sub_19A6378A0() & 1) != 0)
      {
        (*(void (**)(_QWORD, _QWORD))(v8 + 8))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 120));
        v10 = v1;
      }
      else
      {
        v15(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 120));
        v10 = v1;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_19A62A788(0, *(_QWORD *)(v1 + 16) + 1, 1);
          v10 = v115[0];
        }
        v1 = *(_QWORD *)(v10 + 16);
        v16 = *(_QWORD *)(v10 + 24);
        if (v1 >= v16 >> 1)
        {
          sub_19A62A788(v16 > 1, v1 + 1, 1);
          v10 = v115[0];
        }
        v17 = *(_QWORD *)(v0 + 200);
        v18 = *(_QWORD *)(v0 + 120);
        *(_QWORD *)(v10 + 16) = v1 + 1;
        v15(v10 + v13 + v1 * v14, v17, v18);
        v115[0] = v10;
      }
      if (v111 == ++v9)
        goto LABEL_16;
    }
    __break(1u);
LABEL_51:
    swift_once();
    goto LABEL_18;
  }
  v113 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
  v10 = MEMORY[0x1E0DEE9D8];
LABEL_16:
  v1 = v10;
  v113(*(_QWORD *)(v0 + 112), 1, 1, *(_QWORD *)(v0 + 120));
LABEL_17:
  v20 = *(_QWORD *)(v0 + 112);
  swift_bridgeObjectRelease();
  sub_19A62410C(v20);
  if (qword_1EE3A9860 != -1)
    goto LABEL_51;
LABEL_18:
  v21 = *(_QWORD *)(v0 + 192);
  v22 = *(_QWORD *)(v0 + 120);
  v23 = *(_QWORD *)(v0 + 128);
  v24 = *(_QWORD *)(v0 + 72);
  v25 = sub_19A637A74();
  *(_QWORD *)(v0 + 216) = __swift_project_value_buffer(v25, (uint64_t)qword_1EE3AA8E0);
  v26 = *(void (**)(uint64_t, unint64_t, uint64_t))(v23 + 16);
  *(_QWORD *)(v0 + 224) = v26;
  v112 = v26;
  v26(v21, v24, v22);
  swift_retain_n();
  v27 = sub_19A637A5C();
  v28 = sub_19A637BB8();
  v29 = os_log_type_enabled(v27, v28);
  v30 = *(_QWORD *)(v0 + 192);
  v31 = *(_QWORD *)(v0 + 120);
  v32 = *(_QWORD *)(v0 + 128);
  if (v29)
  {
    type = v28;
    v33 = swift_slowAlloc();
    v107 = swift_slowAlloc();
    v115[0] = v107;
    *(_DWORD *)v33 = 136446466;
    sub_19A624228(&qword_1EE3A9A68, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v34 = sub_19A637CE4();
    *(_QWORD *)(v0 + 56) = sub_19A61C7BC(v34, v35, v115);
    sub_19A637C24();
    swift_bridgeObjectRelease();
    v36 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
    v36(v30, v31);
    *(_WORD *)(v33 + 12) = 2082;
    v37 = swift_retain();
    v38 = MEMORY[0x19AEC8580](v37, v31);
    v40 = v39;
    swift_release();
    *(_QWORD *)(v0 + 64) = sub_19A61C7BC(v38, v40, v115);
    sub_19A637C24();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_19A50D000, v27, type, "Appending assets in directory to composition session %{public}s with fileAssets %{public}s", (uint8_t *)v33, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x19AEC987C](v107, -1, -1);
    MEMORY[0x19AEC987C](v33, -1, -1);

  }
  else
  {
    v36 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
    v36(v30, v31);
    swift_release_n();

  }
  v110 = v36;
  *(_QWORD *)(v0 + 232) = v36;
  v41 = *(_QWORD *)(v1 + 16);
  if (v41)
  {
    v42 = *(_QWORD *)(v0 + 128);
    v43 = v1 + ((*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80));
    v44 = *(_QWORD *)(v42 + 72);
    swift_retain();
    while (1)
    {
      v45 = *(_QWORD *)(v0 + 120);
      v46 = *(_QWORD *)(v0 + 96);
      v112(v46, v43, v45);
      v113(v46, 0, 1, v45);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v42 + 48))(v46, 1, v45) == 1)
        break;
      v47 = *(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 32);
      v47(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 120));
      sub_19A6378AC();
      v48 = sub_19A637B10();
      swift_bridgeObjectRelease();
      v49 = *(_QWORD *)(v0 + 176);
      v50 = *(_QWORD *)(v0 + 120);
      if ((v48 & 1) != 0)
      {
        v52 = *(_QWORD *)(v0 + 104);
        swift_release();
        v47(v52, v49, v50);
        v51 = 0;
        goto LABEL_31;
      }
      v110(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 120));
      v43 += v44;
      if (!--v41)
        goto LABEL_28;
    }
  }
  else
  {
    swift_retain();
LABEL_28:
    v113(*(_QWORD *)(v0 + 96), 1, 1, *(_QWORD *)(v0 + 120));
  }
  swift_release();
  v51 = 1;
LABEL_31:
  v53 = *(_QWORD *)(v0 + 120);
  v54 = *(_QWORD *)(v0 + 128);
  v55 = *(_QWORD *)(v0 + 104);
  v56 = *(_QWORD *)(v0 + 88);
  v113(v55, v51, 1, v53);
  sub_19A62414C(v55, v56);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v54 + 48))(v56, 1, v53) == 1)
  {
    v57 = *(_QWORD *)(v0 + 120);
    v58 = *(_QWORD *)(v0 + 104);
    v59 = *(_QWORD *)(v0 + 88);
    v60 = *(_QWORD *)(v0 + 72);
    swift_release();
    sub_19A62410C(v59);
    type metadata accessor for RecordingCompositionError();
    sub_19A624228(&qword_1EE3A9A88, (uint64_t (*)(uint64_t))type metadata accessor for RecordingCompositionError, (uint64_t)&unk_19A65DFA8);
    swift_allocError();
    v112(v61, v60, v57);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    sub_19A62410C(v58);
    goto LABEL_41;
  }
  v62 = *(_QWORD *)(v0 + 184);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 128) + 32))(v62, *(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 120));
  v63 = swift_task_alloc();
  *(_QWORD *)(v63 + 16) = v62;
  v64 = sub_19A6204F4((uint64_t (*)(char *))sub_19A6241D0, v63, v1);
  *(_QWORD *)(v0 + 240) = v64;
  swift_task_dealloc();
  swift_bridgeObjectRetain_n();
  v65 = sub_19A637A5C();
  v66 = sub_19A637BB8();
  if (os_log_type_enabled(v65, v66))
  {
    v67 = *(_QWORD *)(v0 + 120);
    v68 = (uint8_t *)swift_slowAlloc();
    v69 = swift_slowAlloc();
    v115[0] = v69;
    *(_DWORD *)v68 = 136315138;
    v70 = swift_bridgeObjectRetain();
    v71 = MEMORY[0x19AEC8580](v70, v67);
    v73 = v72;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 48) = sub_19A61C7BC(v71, v73, v115);
    sub_19A637C24();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19A50D000, v65, v66, "Identified caption files %s", v68, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AEC987C](v69, -1, -1);
    MEMORY[0x19AEC987C](v68, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v74 = *(_QWORD *)(v64 + 16);
  if (v74 != 2)
  {
    v88 = *(_QWORD *)(v0 + 184);
    v89 = *(_QWORD *)(v0 + 120);
    v90 = *(_QWORD *)(v0 + 104);
    type metadata accessor for RecordingCompositionError();
    sub_19A624228(&qword_1EE3A9A88, (uint64_t (*)(uint64_t))type metadata accessor for RecordingCompositionError, (uint64_t)&unk_19A65DFA8);
    swift_allocError();
    v92 = v91;
    swift_bridgeObjectRelease();
    *v92 = v74;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    sub_19A62410C(v90);
    v93 = v88;
    v94 = v89;
LABEL_40:
    v110(v93, v94);
    goto LABEL_41;
  }
  v76 = *(_QWORD *)(v0 + 160);
  v75 = *(_QWORD *)(v0 + 168);
  v77 = *(_QWORD *)(v0 + 120);
  v78 = *(_DWORD *)(*(_QWORD *)(v0 + 128) + 80);
  *(_DWORD *)(v0 + 312) = v78;
  v79 = v64 + ((v78 + 32) & ~(unint64_t)v78);
  v112(v76, v79, v77);
  sub_19A6378D0();
  v110(v76, v77);
  v80 = sub_19A6378AC();
  v82 = v81;
  *(_QWORD *)(v0 + 248) = v80;
  *(_QWORD *)(v0 + 256) = v81;
  v110(v75, v77);
  swift_bridgeObjectRetain_n();
  v83 = sub_19A637A5C();
  v84 = sub_19A637BB8();
  if (os_log_type_enabled(v83, v84))
  {
    v109 = v79;
    v85 = (uint8_t *)swift_slowAlloc();
    v86 = swift_slowAlloc();
    v115[0] = v86;
    *(_DWORD *)v85 = 136446210;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 40) = sub_19A61C7BC(v80, v82, v115);
    sub_19A637C24();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19A50D000, v83, v84, "Appending 1st captions file %{public}s", v85, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AEC987C](v86, -1, -1);
    v87 = v85;
    v79 = v109;
    MEMORY[0x19AEC987C](v87, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v96 = *(_QWORD **)(v0 + 80);
  v97 = v96[8];
  v98 = v96[9];
  if (v98)
  {
    if ((v80 != v97 || v98 != v82) && (sub_19A637CF0() & 1) == 0)
    {
      v114 = *(_QWORD *)(v0 + 184);
      v99 = *(_QWORD *)(v0 + 120);
      v100 = *(_QWORD *)(v0 + 104);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      type metadata accessor for RecordingCompositionError();
      sub_19A624228(&qword_1EE3A9A88, (uint64_t (*)(uint64_t))type metadata accessor for RecordingCompositionError, (uint64_t)&unk_19A65DFA8);
      swift_allocError();
      *v101 = v97;
      v101[1] = v98;
      v101[2] = v80;
      v101[3] = v82;
      swift_storeEnumTagMultiPayload();
      swift_willThrow();
      swift_bridgeObjectRelease();
      sub_19A62410C(v100);
      v93 = v114;
      v94 = v99;
      goto LABEL_40;
    }
  }
  else
  {
    v96[8] = v80;
    v96[9] = v82;
    v96[10] = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain();
  }
  v102 = *(uint64_t **)(v0 + 80);
  v112(*(_QWORD *)(v0 + 152), v79, *(_QWORD *)(v0 + 120));
  v103 = *v102;
  v104 = v102[1];
  v105 = v102[2];
  v106 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 264) = v106;
  *v106 = v0;
  v106[1] = sub_19A61F6EC;
  return sub_19A625124(*(_QWORD *)(v0 + 152), v103, v104, v105);
}

uint64_t sub_19A61F6EC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 272) = v0;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v2 + 232))(*(_QWORD *)(v2 + 152), *(_QWORD *)(v2 + 120));
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_19A61F7D0()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  _BOOL4 v12;
  unint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, unint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  void (*v37)(uint64_t, uint64_t);
  uint64_t v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(v0 + 240);
  if (*(_QWORD *)(v1 + 16) < 2uLL)
    __break(1u);
  v2 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
  v3 = *(_QWORD *)(v0 + 160);
  v4 = *(_QWORD *)(v0 + 168);
  v5 = *(_QWORD *)(v0 + 120);
  v6 = v1
     + ((*(unsigned __int8 *)(v0 + 312) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 312))
     + *(_QWORD *)(*(_QWORD *)(v0 + 128) + 72);
  (*(void (**)(uint64_t, unint64_t, uint64_t))(v0 + 224))(v3, v6, v5);
  sub_19A6378D0();
  v2(v3, v5);
  v7 = sub_19A6378AC();
  v9 = v8;
  v2(v4, v5);
  swift_bridgeObjectRetain();
  v10 = sub_19A637A5C();
  v11 = sub_19A637BB8();
  v12 = os_log_type_enabled(v10, v11);
  v13 = *(_QWORD *)(v0 + 256);
  v36 = v6;
  if (v12)
  {
    v14 = *(_QWORD *)(v0 + 248);
    v15 = (uint8_t *)swift_slowAlloc();
    v34 = v7;
    v16 = swift_slowAlloc();
    v38[0] = v16;
    *(_DWORD *)v15 = 136446210;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 32) = sub_19A61C7BC(v14, v13, v38);
    sub_19A637C24();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19A50D000, v10, v11, "Appending 2nd captions file %{public}s", v15, 0xCu);
    swift_arrayDestroy();
    v17 = v16;
    v7 = v34;
    MEMORY[0x19AEC987C](v17, -1, -1);
    MEMORY[0x19AEC987C](v15, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v18 = *(_QWORD **)(v0 + 80);
  v19 = v18[11];
  v20 = v18[12];
  if (!v20)
  {
    v18[11] = v7;
    v18[12] = v9;
    v18[13] = MEMORY[0x1E0DEE9D8];
    v20 = v9;
    v21 = v7;
    goto LABEL_12;
  }
  if (v7 == v19 && v20 == v9)
  {
    swift_bridgeObjectRelease();
    v21 = v7;
LABEL_12:
    v22 = *(void (**)(uint64_t, unint64_t, uint64_t))(v0 + 224);
    v23 = *(_QWORD *)(v0 + 144);
    v24 = *(_QWORD *)(v0 + 120);
    v25 = *(uint64_t **)(v0 + 80);
    sub_19A624010(v21, v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v22(v23, v36, v24);
    swift_bridgeObjectRelease();
    v26 = *v25;
    v27 = v25[1];
    v28 = v25[2];
    v29 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 280) = v29;
    *v29 = v0;
    v29[1] = sub_19A61FC7C;
    return sub_19A625124(*(_QWORD *)(v0 + 144), v26, v27, v28);
  }
  if ((sub_19A637CF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v21 = v19;
    goto LABEL_12;
  }
  v35 = *(_QWORD *)(v0 + 184);
  v37 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
  v31 = *(_QWORD *)(v0 + 120);
  v32 = *(_QWORD *)(v0 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  type metadata accessor for RecordingCompositionError();
  sub_19A624228(&qword_1EE3A9A88, (uint64_t (*)(uint64_t))type metadata accessor for RecordingCompositionError, (uint64_t)&unk_19A65DFA8);
  swift_allocError();
  *v33 = v19;
  v33[1] = v20;
  v33[2] = v7;
  v33[3] = v9;
  swift_storeEnumTagMultiPayload();
  swift_willThrow();
  swift_bridgeObjectRelease();
  sub_19A62410C(v32);
  v37(v35, v31);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19A61FC7C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 288) = v0;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v2 + 232))(*(_QWORD *)(v2 + 144), *(_QWORD *)(v2 + 120));
  return swift_task_switch();
}

uint64_t sub_19A61FD3C()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 224))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 120));
  v1 = sub_19A637A5C();
  v2 = sub_19A637BB8();
  if (os_log_type_enabled(v1, v2))
  {
    v11 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
    v3 = *(_QWORD *)(v0 + 136);
    v4 = *(_QWORD *)(v0 + 120);
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v12[0] = v6;
    *(_DWORD *)v5 = 136446210;
    sub_19A624228(&qword_1EE3A9A68, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v7 = sub_19A637CE4();
    *(_QWORD *)(v0 + 24) = sub_19A61C7BC(v7, v8, v12);
    sub_19A637C24();
    swift_bridgeObjectRelease();
    v11(v3, v4);
    _os_log_impl(&dword_19A50D000, v1, v2, "Identified audio file %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AEC987C](v6, -1, -1);
    MEMORY[0x19AEC987C](v5, -1, -1);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v0 + 232))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 120));
  }

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 296) = v9;
  *v9 = v0;
  v9[1] = sub_19A61FF34;
  return sub_19A61D03C(*(_QWORD *)(v0 + 184));
}

uint64_t sub_19A61FF34()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 304) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19A61FFDC()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
  v3 = *(_QWORD *)(v0 + 184);
  v4 = *(_QWORD *)(v0 + 120);
  v5 = *(_QWORD *)(v0 + 104);
  if (*(_QWORD *)(v1 + 56))
  {
    sub_19A62410C(*(_QWORD *)(v0 + 104));
    v2(v3, v4);
  }
  else
  {
    v6 = sub_19A6378AC();
    v8 = v7;
    sub_19A62410C(v5);
    v2(v3, v4);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v1 + 48) = v6;
    *(_QWORD *)(v1 + 56) = v8;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19A62014C()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
  v2 = *(_QWORD *)(v0 + 184);
  v3 = *(_QWORD *)(v0 + 120);
  sub_19A62410C(*(_QWORD *)(v0 + 104));
  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19A620284()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
  v2 = *(_QWORD *)(v0 + 184);
  v3 = *(_QWORD *)(v0 + 120);
  sub_19A62410C(*(_QWORD *)(v0 + 104));
  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19A6203BC()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
  v2 = *(_QWORD *)(v0 + 184);
  v3 = *(_QWORD *)(v0 + 120);
  sub_19A62410C(*(_QWORD *)(v0 + 104));
  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19A6204F4(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  char *v19;
  char v20;
  uint64_t v21;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t (*v33)(char *);
  uint64_t v34;
  char *v35;
  uint64_t v36;

  v4 = v3;
  v33 = a1;
  v34 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9A80);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_19A637918();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v31 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x1E0C80A78](v11);
  v35 = (char *)&v26 - v14;
  v36 = MEMORY[0x1E0DEE9D8];
  v32 = *(_QWORD *)(a3 + 16);
  if (v32)
  {
    v15 = 0;
    v30 = a3;
    while (v15 < *(_QWORD *)(a3 + 16))
    {
      v16 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
      v17 = *(_QWORD *)(v10 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(v8, a3 + v16 + v17 * v15, v9);
      v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
      v29(v8, 0, 1, v9);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
        goto LABEL_17;
      v18 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
      v19 = v35;
      v18(v35, v8, v9);
      v20 = v33(v19);
      if (v4)
      {
        (*(void (**)(char *, uint64_t))(v10 + 8))(v35, v9);
        swift_bridgeObjectRelease();
        return swift_release();
      }
      if ((v20 & 1) != 0)
      {
        v18(v31, v35, v9);
        v21 = v36;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v28 = 0;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_19A62A788(0, *(_QWORD *)(v21 + 16) + 1, 1);
          v21 = v36;
        }
        v24 = *(_QWORD *)(v21 + 16);
        v23 = *(_QWORD *)(v21 + 24);
        v25 = v24 + 1;
        if (v24 >= v23 >> 1)
        {
          v27 = v24 + 1;
          sub_19A62A788(v23 > 1, v24 + 1, 1);
          v25 = v27;
          v21 = v36;
        }
        *(_QWORD *)(v21 + 16) = v25;
        result = ((uint64_t (*)(unint64_t, char *, uint64_t))v18)(v21 + v16 + v24 * v17, v31, v9);
        v36 = v21;
        v4 = v28;
      }
      else
      {
        result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v35, v9);
      }
      a3 = v30;
      if (v32 == ++v15)
      {
        v29(v8, 1, 1, v9);
        goto LABEL_17;
      }
    }
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
LABEL_17:
    swift_bridgeObjectRelease();
    sub_19A62410C((uint64_t)v8);
    return v36;
  }
  return result;
}

BOOL sub_19A6207B8()
{
  sub_19A637918();
  sub_19A624228(&qword_1EE3A9AB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0028]);
  return (sub_19A637AA4() & 1) == 0;
}

uint64_t sub_19A620830(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[20] = a1;
  v2[21] = v1;
  v3 = sub_19A637A74();
  v2[22] = v3;
  v2[23] = *(_QWORD *)(v3 - 8);
  v2[24] = swift_task_alloc();
  v2[25] = swift_task_alloc();
  v4 = sub_19A637894();
  v2[26] = v4;
  v2[27] = *(_QWORD *)(v4 - 8);
  v2[28] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9A80);
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  v2[33] = swift_task_alloc();
  v5 = sub_19A637984();
  v2[34] = v5;
  v2[35] = *(_QWORD *)(v5 - 8);
  v2[36] = swift_task_alloc();
  v6 = sub_19A637918();
  v2[37] = v6;
  v2[38] = *(_QWORD *)(v6 - 8);
  v2[39] = swift_task_alloc();
  v2[40] = swift_task_alloc();
  v2[41] = swift_task_alloc();
  v2[42] = swift_task_alloc();
  v2[43] = swift_task_alloc();
  v2[44] = swift_task_alloc();
  v2[45] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19A6209E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  sub_19A624268(*(_QWORD *)(v0 + 168) + 64, v0 + 64);
  sub_19A624268(v0 + 64, v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  if (!v1)
    goto LABEL_5;
  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 56);
  sub_19A624268(*(_QWORD *)(v0 + 168) + 88, v0 + 88);
  sub_19A624268(v0 + 88, v0 + 16);
  v4 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 368) = v4;
  if (!v4)
    goto LABEL_5;
  v5 = *(_QWORD *)(v0 + 168);
  v6 = *(_QWORD *)(v0 + 32);
  *(_QWORD *)(v0 + 376) = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 384) = v6;
  *(_QWORD *)(v0 + 392) = *(_QWORD *)(v5 + 48);
  v7 = *(_QWORD *)(v5 + 56);
  *(_QWORD *)(v0 + 400) = v7;
  if (v7)
  {
    swift_bridgeObjectRetain();
    v8 = sub_19A6378AC();
    v10 = v9;
    *(_QWORD *)(v0 + 408) = v8;
    *(_QWORD *)(v0 + 416) = v9;
    v11 = dword_1EE3A9AC0;
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 424) = v12;
    *v12 = v0;
    v12[1] = sub_19A620C8C;
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1EE3A9AC0 + v11))(v2, v1, v3, v8, v10, *(_QWORD *)(v0 + 160));
  }
  else
  {
LABEL_5:
    type metadata accessor for RecordingCompositionError();
    sub_19A624228(&qword_1EE3A9A88, (uint64_t (*)(uint64_t))type metadata accessor for RecordingCompositionError, (uint64_t)&unk_19A65DFA8);
    swift_allocError();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_19A620C8C()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = (_QWORD *)*v1;
  v2[54] = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  v4 = v2[46];
  v5 = dword_1EE3A9AC0;
  v6 = (_QWORD *)swift_task_alloc();
  v2[55] = v6;
  *v6 = v2;
  v6[1] = sub_19A620D94;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1EE3A9AC0 + v5))(v2[47], v4, v2[48], v2[51], v2[52], v2[20]);
}

uint64_t sub_19A620D94()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 448) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_19A620E4C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19A620F98()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19A6210E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  void (*v24)(uint64_t, uint64_t, uint64_t);
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(_QWORD, _QWORD);
  void (*v40)(uint64_t, uint64_t);
  _QWORD *v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t, uint64_t, uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  _BOOL4 v64;
  uint64_t v65;
  void (*v66)(uint64_t, uint64_t, uint64_t);
  void (*v67)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint8_t *v72;
  uint64_t v73;
  unint64_t v74;
  void (*v75)(uint64_t, uint64_t);
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t, uint64_t, uint64_t);
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  void (*v85)(uint64_t, uint64_t);
  uint64_t v86;
  uint64_t v87;
  void *v88;
  id v89;
  void *v90;
  unsigned int v91;
  void *v92;
  id v93;
  id v94;
  void *v95;
  void *v96;
  unsigned int v97;
  void *v98;
  id v99;
  NSObject *v100;
  os_log_type_t v101;
  uint8_t *v102;
  void (*v103)(uint64_t, uint64_t);
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t (*v108)(void);
  void (*v109)(uint64_t, uint64_t);
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void (*v131)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v132;
  uint64_t v133;
  void (*v134)(uint64_t, uint64_t);
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void (*v138)(uint64_t, uint64_t, uint64_t);
  uint64_t v139;
  id v140;
  void (*v141)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v142;
  uint64_t v143[3];

  v143[2] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(v0 + 304);
  v2 = *(_QWORD *)(v0 + 280);
  v3 = *(_QWORD *)(v0 + 288);
  v4 = *(_QWORD *)(v0 + 264);
  v5 = *(_QWORD *)(v0 + 272);
  v6 = *(_QWORD *)(v0 + 224);
  v126 = *(_QWORD *)(v0 + 216);
  v130 = *(_QWORD *)(v0 + 296);
  v136 = *(_QWORD *)(v0 + 168);
  sub_19A637C3C();
  swift_bridgeObjectRelease();
  v143[0] = 0x2F706D742FLL;
  v143[1] = 0xE500000000000000;
  sub_19A637978();
  sub_19A63796C();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v5);
  sub_19A637AF8();
  swift_bridgeObjectRelease();
  sub_19A637AF8();
  v7 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v1 + 56);
  *(_QWORD *)(v0 + 456) = v7;
  v8 = v130;
  v131 = v7;
  v7(v4, 1, 1, v8);
  *(_DWORD *)(v0 + 536) = *MEMORY[0x1E0CAFD78];
  v9 = *(void (**)(uint64_t))(v126 + 104);
  *(_QWORD *)(v0 + 464) = v9;
  v9(v6);
  sub_19A6378E8();
  v10 = *(void **)(v136 + 24);
  sub_19A637ABC();
  v11 = objc_allocWithZone(MEMORY[0x1E0C8AFC0]);
  v12 = v10;
  v13 = (void *)sub_19A637AB0();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v11, sel_initWithAsset_presetName_, v12, v13);
  *(_QWORD *)(v0 + 472) = v14;

  if (qword_1EE3A9860 != -1)
    swift_once();
  v16 = *(_QWORD *)(v0 + 352);
  v15 = *(_QWORD *)(v0 + 360);
  v18 = *(_QWORD *)(v0 + 296);
  v17 = *(_QWORD *)(v0 + 304);
  v19 = *(_QWORD *)(v0 + 200);
  v20 = *(_QWORD *)(v0 + 176);
  v21 = *(_QWORD *)(v0 + 184);
  v22 = __swift_project_value_buffer(v20, (uint64_t)qword_1EE3AA8E0);
  *(_QWORD *)(v0 + 480) = v22;
  v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16);
  *(_QWORD *)(v0 + 488) = v23;
  v23(v19, v22, v20);
  v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
  *(_QWORD *)(v0 + 496) = v24;
  v24(v16, v15, v18);
  v25 = sub_19A637A5C();
  v26 = sub_19A637BB8();
  v27 = os_log_type_enabled(v25, v26);
  v28 = *(_QWORD *)(v0 + 352);
  v30 = *(_QWORD *)(v0 + 296);
  v29 = *(_QWORD *)(v0 + 304);
  if (v27)
  {
    v140 = v14;
    v32 = *(_QWORD *)(v0 + 248);
    v31 = *(_QWORD *)(v0 + 256);
    v33 = (uint8_t *)swift_slowAlloc();
    v137 = swift_slowAlloc();
    v143[0] = v137;
    *(_DWORD *)v33 = 136446210;
    v24(v31, v28, v30);
    v131(v31, 0, 1, v30);
    sub_19A62414C(v31, v32);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v29 + 48))(v32, 1, v30) == 1)
    {
      v34 = 7104878;
      sub_19A62410C(*(_QWORD *)(v0 + 248));
      v35 = 0xE300000000000000;
    }
    else
    {
      v43 = *(_QWORD *)(v0 + 336);
      v44 = *(_QWORD *)(v0 + 344);
      v46 = *(_QWORD *)(v0 + 296);
      v45 = *(_QWORD *)(v0 + 304);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v45 + 32))(v44, *(_QWORD *)(v0 + 248), v46);
      v24(v43, v44, v46);
      v34 = sub_19A637AD4();
      v35 = v47;
      (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v44, v46);
    }
    v48 = *(_QWORD *)(v0 + 352);
    v50 = *(_QWORD *)(v0 + 296);
    v49 = *(_QWORD *)(v0 + 304);
    v123 = *(_QWORD *)(v0 + 184);
    v127 = *(_QWORD *)(v0 + 176);
    v132 = *(_QWORD *)(v0 + 200);
    sub_19A62410C(*(_QWORD *)(v0 + 256));
    *(_QWORD *)(v0 + 152) = sub_19A61C7BC(v34, v35, v143);
    sub_19A637C24();
    swift_bridgeObjectRelease();
    v51 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
    v51(v48, v50);
    _os_log_impl(&dword_19A50D000, v25, v26, "Starting audio export to %{public}s", v33, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AEC987C](v137, -1, -1);
    MEMORY[0x19AEC987C](v33, -1, -1);

    v52 = *(void (**)(uint64_t, uint64_t))(v123 + 8);
    v52(v132, v127);
    v14 = v140;
    *(_QWORD *)(v0 + 504) = v52;
    *(_QWORD *)(v0 + 512) = v51;
    if (!v140)
      goto LABEL_10;
LABEL_7:
    v14;
    v41 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 520) = v41;
    *v41 = v0;
    v41[1] = sub_19A621D10;
    return sub_19A637BDC();
  }
  v36 = *(_QWORD *)(v0 + 200);
  v37 = *(_QWORD *)(v0 + 176);
  v38 = *(_QWORD *)(v0 + 184);
  v39 = *(void (**)(_QWORD, _QWORD))(v29 + 8);
  v39(*(_QWORD *)(v0 + 352), *(_QWORD *)(v0 + 296));

  v40 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
  v40(v36, v37);
  *(_QWORD *)(v0 + 504) = v40;
  *(_QWORD *)(v0 + 512) = v39;
  if (v14)
    goto LABEL_7;
LABEL_10:
  v138 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 488);
  v141 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 496);
  v53 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 464);
  v54 = *(unsigned int *)(v0 + 536);
  v55 = *(_QWORD *)(v0 + 392);
  v56 = *(_QWORD *)(v0 + 400);
  v57 = *(_QWORD *)(v0 + 328);
  v133 = *(_QWORD *)(v0 + 296);
  v135 = *(_QWORD *)(v0 + 480);
  v58 = *(_QWORD *)(v0 + 224);
  v59 = *(_QWORD *)(v0 + 208);
  v60 = *(_QWORD *)(v0 + 192);
  v124 = *(_QWORD *)(v0 + 176);
  v128 = *(_QWORD *)(v0 + 320);
  v122 = *(_QWORD *)(v0 + 216);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A6C60);
  v61 = swift_allocObject();
  *(_OWORD *)(v61 + 16) = xmmword_19A65DF40;
  *(_QWORD *)(v61 + 32) = v55;
  *(_QWORD *)(v61 + 40) = v56;
  v53(v58, v54, v59);
  sub_19A623F44();
  sub_19A6378F4();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v122 + 8))(v58, v59);
  v138(v60, v135, v124);
  v141(v128, v57, v133);
  v62 = sub_19A637A5C();
  v63 = sub_19A637BB8();
  v64 = os_log_type_enabled(v62, v63);
  v65 = *(_QWORD *)(v0 + 320);
  if (v64)
  {
    v142 = v63;
    v66 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 496);
    v67 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v0 + 456);
    v68 = *(_QWORD *)(v0 + 296);
    v69 = *(_QWORD *)(v0 + 304);
    v71 = *(_QWORD *)(v0 + 232);
    v70 = *(_QWORD *)(v0 + 240);
    v72 = (uint8_t *)swift_slowAlloc();
    v139 = swift_slowAlloc();
    v143[0] = v139;
    *(_DWORD *)v72 = 136446210;
    v66(v70, v65, v68);
    v67(v70, 0, 1, v68);
    sub_19A62414C(v70, v71);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v69 + 48))(v71, 1, v68) == 1)
    {
      v73 = 7104878;
      sub_19A62410C(*(_QWORD *)(v0 + 232));
      v74 = 0xE300000000000000;
    }
    else
    {
      v79 = *(void (**)(uint64_t, uint64_t))(v0 + 512);
      v80 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 496);
      v81 = *(_QWORD *)(v0 + 336);
      v82 = *(_QWORD *)(v0 + 312);
      v83 = *(_QWORD *)(v0 + 296);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v0 + 304) + 32))(v82, *(_QWORD *)(v0 + 232), v83);
      v80(v81, v82, v83);
      v73 = sub_19A637AD4();
      v74 = v84;
      v79(v82, v83);
    }
    v78 = v0 + 112;
    v85 = *(void (**)(uint64_t, uint64_t))(v0 + 512);
    v86 = *(_QWORD *)(v0 + 320);
    v87 = *(_QWORD *)(v0 + 296);
    v129 = *(_QWORD *)(v0 + 192);
    v134 = *(void (**)(uint64_t, uint64_t))(v0 + 504);
    v125 = *(_QWORD *)(v0 + 176);
    sub_19A62410C(*(_QWORD *)(v0 + 240));
    *(_QWORD *)(v0 + 128) = sub_19A61C7BC(v73, v74, v143);
    sub_19A637C24();
    swift_bridgeObjectRelease();
    v85(v86, v87);
    _os_log_impl(&dword_19A50D000, v62, v142, "Finished audio export, moving audio file to %{public}s", v72, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AEC987C](v139, -1, -1);
    MEMORY[0x19AEC987C](v72, -1, -1);

    v134(v129, v125);
  }
  else
  {
    v75 = *(void (**)(uint64_t, uint64_t))(v0 + 504);
    v76 = *(_QWORD *)(v0 + 192);
    v77 = *(_QWORD *)(v0 + 176);
    (*(void (**)(_QWORD, _QWORD))(v0 + 512))(*(_QWORD *)(v0 + 320), *(_QWORD *)(v0 + 296));

    v75(v76, v77);
    v78 = v0 + 112;
  }
  v88 = (void *)objc_opt_self();
  v89 = objc_msgSend(v88, sel_defaultManager);
  v90 = (void *)sub_19A6378C4();
  *(_QWORD *)(v0 + 112) = 0;
  v91 = objc_msgSend(v89, sel_removeItemAtURL_error_, v90, v78);

  v92 = *(void **)(v0 + 112);
  if (v91)
  {
    v93 = v92;
    v94 = objc_msgSend(v88, sel_defaultManager);
    v95 = (void *)sub_19A6378C4();
    v96 = (void *)sub_19A6378C4();
    *(_QWORD *)(v0 + 120) = 0;
    v97 = objc_msgSend(v94, sel_moveItemAtURL_toURL_error_, v95, v96, v0 + 120);

    v98 = *(void **)(v0 + 120);
    if (v97)
    {
      v99 = v98;
      v100 = sub_19A637A5C();
      v101 = sub_19A637BB8();
      if (os_log_type_enabled(v100, v101))
      {
        v102 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v102 = 0;
        _os_log_impl(&dword_19A50D000, v100, v101, "Composition export succeeded", v102, 2u);
        MEMORY[0x19AEC987C](v102, -1, -1);
      }
      v103 = *(void (**)(uint64_t, uint64_t))(v0 + 512);
      v104 = *(void **)(v0 + 472);
      v105 = *(_QWORD *)(v0 + 360);
      v106 = *(_QWORD *)(v0 + 328);
      v107 = *(_QWORD *)(v0 + 296);

      v103(v106, v107);
      v103(v105, v107);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      v108 = *(uint64_t (**)(void))(v0 + 8);
      return v108();
    }
    v109 = *(void (**)(uint64_t, uint64_t))(v0 + 512);
    v117 = *(void **)(v0 + 472);
    v118 = *(_QWORD *)(v0 + 360);
    v119 = *(_QWORD *)(v0 + 328);
    v120 = *(_QWORD *)(v0 + 296);
    v121 = v98;
    sub_19A63787C();

    swift_willThrow();
    v109(v119, v120);
    v115 = v118;
    v116 = v120;
  }
  else
  {
    v109 = *(void (**)(uint64_t, uint64_t))(v0 + 512);
    v110 = *(void **)(v0 + 472);
    v111 = *(_QWORD *)(v0 + 360);
    v112 = *(_QWORD *)(v0 + 328);
    v113 = *(_QWORD *)(v0 + 296);
    v114 = v92;
    sub_19A63787C();

    swift_willThrow();
    v109(v112, v113);
    v115 = v111;
    v116 = v113;
  }
  v109(v115, v116);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v108 = *(uint64_t (**)(void))(v0 + 8);
  return v108();
}

uint64_t sub_19A621D10()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 528) = v0;
  swift_task_dealloc();

  if (v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_19A621DD8()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  void (*v13)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t *v19;
  unint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  unsigned int v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  unsigned int v44;
  void *v45;
  id v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  void (*v50)(uint64_t, uint64_t);
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t (*v55)(void);
  void (*v56)(uint64_t, uint64_t);
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(uint64_t, uint64_t);
  uint64_t v77;
  void (*v78)(uint64_t, uint64_t, uint64_t);
  uint64_t v79;
  void (*v80)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v81;
  uint64_t v82[2];

  v82[1] = *MEMORY[0x1E0C80C00];
  v78 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 488);
  v80 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 496);
  v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 464);
  v2 = *(unsigned int *)(v0 + 536);
  v3 = *(_QWORD *)(v0 + 392);
  v4 = *(_QWORD *)(v0 + 400);
  v5 = *(_QWORD *)(v0 + 328);
  v75 = *(_QWORD *)(v0 + 296);
  v77 = *(_QWORD *)(v0 + 480);
  v6 = *(_QWORD *)(v0 + 224);
  v7 = *(_QWORD *)(v0 + 208);
  v8 = *(_QWORD *)(v0 + 192);
  v71 = *(_QWORD *)(v0 + 176);
  v73 = *(_QWORD *)(v0 + 320);
  v70 = *(_QWORD *)(v0 + 216);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A6C60);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_19A65DF40;
  *(_QWORD *)(v9 + 32) = v3;
  *(_QWORD *)(v9 + 40) = v4;
  v1(v6, v2, v7);
  sub_19A623F44();
  sub_19A6378F4();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v6, v7);
  v78(v8, v77, v71);
  v80(v73, v5, v75);
  v10 = sub_19A637A5C();
  v11 = sub_19A637BB8();
  if (os_log_type_enabled(v10, v11))
  {
    v81 = v11;
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 496);
    v13 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v0 + 456);
    v14 = *(_QWORD *)(v0 + 320);
    v16 = *(_QWORD *)(v0 + 296);
    v15 = *(_QWORD *)(v0 + 304);
    v18 = *(_QWORD *)(v0 + 232);
    v17 = *(_QWORD *)(v0 + 240);
    v19 = (uint8_t *)swift_slowAlloc();
    v79 = swift_slowAlloc();
    v82[0] = v79;
    *(_DWORD *)v19 = 136446210;
    v12(v17, v14, v16);
    v13(v17, 0, 1, v16);
    sub_19A62414C(v17, v18);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v18, 1, v16) == 1)
    {
      sub_19A62410C(*(_QWORD *)(v0 + 232));
      v20 = 0xE300000000000000;
      v21 = 7104878;
    }
    else
    {
      v26 = *(void (**)(uint64_t, uint64_t))(v0 + 512);
      v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 496);
      v28 = *(_QWORD *)(v0 + 336);
      v29 = *(_QWORD *)(v0 + 312);
      v30 = *(_QWORD *)(v0 + 296);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v0 + 304) + 32))(v29, *(_QWORD *)(v0 + 232), v30);
      v27(v28, v29, v30);
      v21 = sub_19A637AD4();
      v20 = v31;
      v26(v29, v30);
    }
    v25 = v0 + 112;
    v32 = *(void (**)(uint64_t, uint64_t))(v0 + 512);
    v33 = *(_QWORD *)(v0 + 320);
    v34 = *(_QWORD *)(v0 + 296);
    v74 = *(_QWORD *)(v0 + 192);
    v76 = *(void (**)(uint64_t, uint64_t))(v0 + 504);
    v72 = *(_QWORD *)(v0 + 176);
    sub_19A62410C(*(_QWORD *)(v0 + 240));
    *(_QWORD *)(v0 + 128) = sub_19A61C7BC(v21, v20, v82);
    sub_19A637C24();
    swift_bridgeObjectRelease();
    v32(v33, v34);
    _os_log_impl(&dword_19A50D000, v10, v81, "Finished audio export, moving audio file to %{public}s", v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AEC987C](v79, -1, -1);
    MEMORY[0x19AEC987C](v19, -1, -1);

    v76(v74, v72);
  }
  else
  {
    v22 = *(void (**)(uint64_t, uint64_t))(v0 + 504);
    v23 = *(_QWORD *)(v0 + 192);
    v24 = *(_QWORD *)(v0 + 176);
    (*(void (**)(_QWORD, _QWORD))(v0 + 512))(*(_QWORD *)(v0 + 320), *(_QWORD *)(v0 + 296));

    v22(v23, v24);
    v25 = v0 + 112;
  }
  v35 = (void *)objc_opt_self();
  v36 = objc_msgSend(v35, sel_defaultManager);
  v37 = (void *)sub_19A6378C4();
  *(_QWORD *)(v0 + 112) = 0;
  v38 = objc_msgSend(v36, sel_removeItemAtURL_error_, v37, v25);

  v39 = *(void **)(v0 + 112);
  if (!v38)
  {
    v56 = *(void (**)(uint64_t, uint64_t))(v0 + 512);
    v57 = *(void **)(v0 + 472);
    v58 = *(_QWORD *)(v0 + 360);
    v59 = *(_QWORD *)(v0 + 328);
    v60 = *(_QWORD *)(v0 + 296);
    v61 = v39;
    sub_19A63787C();

    swift_willThrow();
    v56(v59, v60);
    v62 = v58;
    v63 = v60;
LABEL_14:
    v56(v62, v63);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v55 = *(uint64_t (**)(void))(v0 + 8);
    return v55();
  }
  v40 = v39;
  v41 = objc_msgSend(v35, sel_defaultManager);
  v42 = (void *)sub_19A6378C4();
  v43 = (void *)sub_19A6378C4();
  *(_QWORD *)(v0 + 120) = 0;
  v44 = objc_msgSend(v41, sel_moveItemAtURL_toURL_error_, v42, v43, v0 + 120);

  v45 = *(void **)(v0 + 120);
  if (!v44)
  {
    v56 = *(void (**)(uint64_t, uint64_t))(v0 + 512);
    v64 = *(void **)(v0 + 472);
    v65 = *(_QWORD *)(v0 + 360);
    v66 = *(_QWORD *)(v0 + 328);
    v67 = *(_QWORD *)(v0 + 296);
    v68 = v45;
    sub_19A63787C();

    swift_willThrow();
    v56(v66, v67);
    v62 = v65;
    v63 = v67;
    goto LABEL_14;
  }
  v46 = v45;
  v47 = sub_19A637A5C();
  v48 = sub_19A637BB8();
  if (os_log_type_enabled(v47, v48))
  {
    v49 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v49 = 0;
    _os_log_impl(&dword_19A50D000, v47, v48, "Composition export succeeded", v49, 2u);
    MEMORY[0x19AEC987C](v49, -1, -1);
  }
  v50 = *(void (**)(uint64_t, uint64_t))(v0 + 512);
  v51 = *(void **)(v0 + 472);
  v52 = *(_QWORD *)(v0 + 360);
  v53 = *(_QWORD *)(v0 + 328);
  v54 = *(_QWORD *)(v0 + 296);

  v50(v53, v54);
  v50(v52, v54);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v55 = *(uint64_t (**)(void))(v0 + 8);
  return v55();
}

uint64_t sub_19A622530()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void (*v13)(uint64_t, uint64_t);
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(v0 + 528);
  v2 = v1;
  v3 = v1;
  v4 = sub_19A637A5C();
  v5 = sub_19A637BAC();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 528);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    *(_DWORD *)v7 = 136446210;
    v18[0] = v8;
    *(_QWORD *)(v0 + 136) = v6;
    v9 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9A70);
    v10 = sub_19A637AD4();
    *(_QWORD *)(v0 + 144) = sub_19A61C7BC(v10, v11, v18);
    sub_19A637C24();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_19A50D000, v4, v5, "Error exporting audio: %{public}s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AEC987C](v8, -1, -1);
    MEMORY[0x19AEC987C](v7, -1, -1);
  }
  else
  {
    v12 = *(void **)(v0 + 528);

  }
  v13 = *(void (**)(uint64_t, uint64_t))(v0 + 512);
  v14 = *(void **)(v0 + 472);
  v15 = *(_QWORD *)(v0 + 360);
  v16 = *(_QWORD *)(v0 + 296);
  swift_willThrow();

  v13(v15, v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static RecordingMediaComposer.composeRecording(from:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[46] = a1;
  v2 = sub_19A637894();
  v1[47] = v2;
  v1[48] = *(_QWORD *)(v2 - 8);
  v1[49] = swift_task_alloc();
  v3 = sub_19A637918();
  v1[50] = v3;
  v1[51] = *(_QWORD *)(v3 - 8);
  v1[52] = swift_task_alloc();
  v1[53] = swift_task_alloc();
  v1[54] = swift_task_alloc();
  v1[55] = swift_task_alloc();
  v1[56] = swift_task_alloc();
  v1[57] = swift_task_alloc();
  v1[58] = swift_task_alloc();
  return swift_task_switch();
}

void sub_19A6228E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void (*v22)(uint64_t, uint64_t);
  void *v23;
  id v24;
  char *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  NSObject *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  id v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  unsigned __int8 *v54;
  void *v55;
  unsigned int v56;
  int v57;
  _QWORD *v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  uint8_t *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD *v66;
  uint64_t v67;
  void (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t, uint64_t, uint64_t);
  uint64_t v70[2];

  v70[1] = *MEMORY[0x1E0C80C00];
  if (qword_1EE3A9860 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 464);
  v3 = *(_QWORD *)(v0 + 400);
  v2 = *(_QWORD *)(v0 + 408);
  v4 = *(_QWORD *)(v0 + 368);
  v5 = sub_19A637A74();
  *(_QWORD *)(v0 + 472) = __swift_project_value_buffer(v5, (uint64_t)qword_1EE3AA8E0);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  *(_QWORD *)(v0 + 480) = v6;
  v6(v1, v4, v3);
  v7 = sub_19A637A5C();
  v8 = sub_19A637BA0();
  v9 = os_log_type_enabled(v7, v8);
  v10 = *(_QWORD *)(v0 + 464);
  v11 = *(_QWORD *)(v0 + 408);
  if (v9)
  {
    v67 = *(_QWORD *)(v0 + 400);
    v12 = (uint8_t *)swift_slowAlloc();
    v69 = v6;
    v13 = swift_slowAlloc();
    v70[0] = v13;
    *(_DWORD *)v12 = 136315138;
    v14 = sub_19A637888();
    *(_QWORD *)(v0 + 360) = sub_19A61C7BC(v14, v15, v70);
    sub_19A637C24();
    swift_bridgeObjectRelease();
    v16 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v16(v10, v67);
    _os_log_impl(&dword_19A50D000, v7, v8, "ingesting files from url %s", v12, 0xCu);
    swift_arrayDestroy();
    v17 = v13;
    v6 = v69;
    MEMORY[0x19AEC987C](v17, -1, -1);
    MEMORY[0x19AEC987C](v12, -1, -1);
  }
  else
  {
    v16 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v16(v10, *(_QWORD *)(v0 + 400));
  }

  *(_QWORD *)(v0 + 488) = v16;
  v19 = *(_QWORD *)(v0 + 384);
  v18 = *(_QWORD *)(v0 + 392);
  v20 = *(_QWORD *)(v0 + 376);
  *(_QWORD *)(v0 + 344) = 0;
  *(_QWORD *)(v0 + 280) = 48;
  *(_QWORD *)(v0 + 288) = 0xE100000000000000;
  *(_DWORD *)(v0 + 560) = *MEMORY[0x1E0CAFD78];
  v21 = *(void (**)(uint64_t))(v19 + 104);
  *(_QWORD *)(v0 + 496) = v21;
  v21(v18);
  *(_QWORD *)(v0 + 504) = sub_19A623F44();
  sub_19A637900();
  v22 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
  *(_QWORD *)(v0 + 512) = v22;
  v22(v18, v20);
  swift_bridgeObjectRelease();
  v23 = (void *)objc_opt_self();
  *(_QWORD *)(v0 + 520) = v23;
  v24 = objc_msgSend(v23, sel_defaultManager);
  v25 = (char *)swift_slowAlloc();
  sub_19A6378DC();
  v26 = (void *)sub_19A637AB0();
  swift_bridgeObjectRelease();
  LODWORD(v19) = objc_msgSend(v24, sel_fileExistsAtPath_isDirectory_, v26, v25);

  v27 = *(_QWORD *)(v0 + 456);
  v28 = *(_QWORD *)(v0 + 400);
  if (!(_DWORD)v19)
  {

    v16(v27, v28);
    goto LABEL_11;
  }
  v29 = *v25;

  v16(v27, v28);
  if ((v29 & 1) == 0)
  {
LABEL_11:
    v39 = sub_19A637A5C();
    v40 = sub_19A637BA0();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v41 = 0;
      _os_log_impl(&dword_19A50D000, v39, v40, "No handoff detected. Not necessary to compose several files together", v41, 2u);
      MEMORY[0x19AEC987C](v41, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    (*(void (**)(void))(v0 + 8))();
    return;
  }
  v68 = v16;
  v6(*(_QWORD *)(v0 + 448), *(_QWORD *)(v0 + 368), *(_QWORD *)(v0 + 400));
  v30 = sub_19A637A5C();
  v31 = sub_19A637BA0();
  v32 = os_log_type_enabled(v30, v31);
  v33 = *(_QWORD *)(v0 + 448);
  v34 = *(_QWORD *)(v0 + 400);
  if (v32)
  {
    v35 = (uint8_t *)swift_slowAlloc();
    v36 = swift_slowAlloc();
    v70[0] = v36;
    *(_DWORD *)v35 = 136315138;
    sub_19A624228(&qword_1EE3A9A68, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v37 = sub_19A637CE4();
    *(_QWORD *)(v0 + 352) = sub_19A61C7BC(v37, v38, v70);
    sub_19A637C24();
    swift_bridgeObjectRelease();
    v68(v33, v34);
    _os_log_impl(&dword_19A50D000, v30, v31, "Detected handoff recording for %s", v35, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AEC987C](v36, -1, -1);
    MEMORY[0x19AEC987C](v35, -1, -1);
  }
  else
  {
    v16(*(_QWORD *)(v0 + 448), *(_QWORD *)(v0 + 400));
  }

  v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C8B268]), sel_init);
  v43 = *MEMORY[0x1E0C8A7A0];
  v44 = v42;
  v45 = objc_msgSend(v44, sel_addMutableTrackWithMediaType_preferredTrackID_, v43, 0);
  if (!v45)
  {
    __break(1u);
    goto LABEL_25;
  }
  v46 = v45;
  v47 = objc_msgSend(v44, sel_addMutableTrackWithMediaType_preferredTrackID_, v43, 0);

  if (!v47)
  {
LABEL_25:
    __break(1u);
    return;
  }
  v48 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 8);
  v49 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v50 = *(_QWORD *)(v0 + 440);
  v51 = *(_QWORD *)(v0 + 400);
  v52 = *(_QWORD *)(v0 + 368);
  *(_QWORD *)(v0 + 128) = *MEMORY[0x1E0CA2E68];
  *(_QWORD *)(v0 + 136) = v48;
  *(_QWORD *)(v0 + 144) = v49;
  *(_QWORD *)(v0 + 152) = v44;
  *(_QWORD *)(v0 + 160) = v46;
  *(_QWORD *)(v0 + 168) = v47;
  *(_OWORD *)(v0 + 176) = 0u;
  *(_OWORD *)(v0 + 192) = 0u;
  *(_OWORD *)(v0 + 208) = 0u;
  *(_OWORD *)(v0 + 224) = 0u;
  v6(v50, v52, v51);
  v53 = objc_msgSend(v23, sel_defaultManager);
  v54 = (unsigned __int8 *)swift_slowAlloc();
  sub_19A6378DC();
  v55 = (void *)sub_19A637AB0();
  swift_bridgeObjectRelease();
  v56 = objc_msgSend(v53, sel_fileExistsAtPath_isDirectory_, v55, v54);

  if (v56)
  {
    v57 = *v54;

    if (v57 == 1)
    {
      v58 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 528) = v58;
      *v58 = v0;
      v58[1] = sub_19A623140;
      sub_19A61E838(*(_QWORD *)(v0 + 440));
      return;
    }
  }
  else
  {

  }
  v59 = *(_QWORD *)(v0 + 344);
  v60 = sub_19A637A5C();
  v61 = sub_19A637BA0();
  if (os_log_type_enabled(v60, v61))
  {
    v62 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v62 = 134349056;
    *(_QWORD *)(v0 + 328) = v59;
    sub_19A637C24();
    _os_log_impl(&dword_19A50D000, v60, v61, "Composed %{public}ld sub-recordings", v62, 0xCu);
    MEMORY[0x19AEC987C](v62, -1, -1);
  }

  v63 = *(_OWORD *)(v0 + 208);
  *(_OWORD *)(v0 + 80) = *(_OWORD *)(v0 + 192);
  *(_OWORD *)(v0 + 96) = v63;
  *(_OWORD *)(v0 + 112) = *(_OWORD *)(v0 + 224);
  v64 = *(_OWORD *)(v0 + 144);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 128);
  *(_OWORD *)(v0 + 32) = v64;
  v65 = *(_OWORD *)(v0 + 176);
  *(_OWORD *)(v0 + 48) = *(_OWORD *)(v0 + 160);
  *(_OWORD *)(v0 + 64) = v65;
  sub_19A623F88((_QWORD *)(v0 + 16));
  v66 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 544) = v66;
  *v66 = v0;
  v66[1] = sub_19A623508;
  sub_19A620830(*(_QWORD *)(v0 + 368));
}

uint64_t sub_19A623140()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 536) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19A6231E8()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  id v13;
  char *v14;
  void *v15;
  unsigned int v16;
  char v17;
  _QWORD *v18;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD *v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);

  v28 = *(void (**)(uint64_t, uint64_t))(v0 + 512);
  v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 496);
  v2 = *(unsigned int *)(v0 + 560);
  v4 = *(_QWORD *)(v0 + 432);
  v3 = *(_QWORD *)(v0 + 440);
  v5 = *(_QWORD *)(v0 + 400);
  v29 = *(_QWORD *)(v0 + 408);
  v30 = *(void (**)(uint64_t, uint64_t))(v0 + 488);
  v6 = *(_QWORD *)(v0 + 392);
  v7 = *(_QWORD *)(v0 + 376);
  *(_QWORD *)(v0 + 336) = *(_QWORD *)(v0 + 344);
  *(_QWORD *)(v0 + 264) = sub_19A637CE4();
  *(_QWORD *)(v0 + 272) = v8;
  v1(v6, v2, v7);
  sub_19A63790C();
  v28(v6, v7);
  swift_bridgeObjectRelease();
  v30(v3, v5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 32))(v3, v4, v5);
  v9 = *(_QWORD *)(v0 + 344);
  v10 = __OFADD__(v9, 1);
  v11 = v9 + 1;
  if (v10)
    __break(1u);
  v12 = *(void **)(v0 + 520);
  *(_QWORD *)(v0 + 344) = v11;
  v13 = objc_msgSend(v12, sel_defaultManager);
  v14 = (char *)swift_slowAlloc();
  sub_19A6378DC();
  v15 = (void *)sub_19A637AB0();
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v13, sel_fileExistsAtPath_isDirectory_, v15, v14);

  if (v16)
  {
    v17 = *v14;

    if ((v17 & 1) != 0)
    {
      v18 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 528) = v18;
      *v18 = v0;
      v18[1] = sub_19A623140;
      return sub_19A61E838(*(_QWORD *)(v0 + 440));
    }
  }
  else
  {

  }
  v20 = *(_QWORD *)(v0 + 344);
  v21 = sub_19A637A5C();
  v22 = sub_19A637BA0();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v23 = 134349056;
    *(_QWORD *)(v0 + 328) = v20;
    sub_19A637C24();
    _os_log_impl(&dword_19A50D000, v21, v22, "Composed %{public}ld sub-recordings", v23, 0xCu);
    MEMORY[0x19AEC987C](v23, -1, -1);
  }

  v24 = *(_OWORD *)(v0 + 208);
  *(_OWORD *)(v0 + 80) = *(_OWORD *)(v0 + 192);
  *(_OWORD *)(v0 + 96) = v24;
  *(_OWORD *)(v0 + 112) = *(_OWORD *)(v0 + 224);
  v25 = *(_OWORD *)(v0 + 144);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 128);
  *(_OWORD *)(v0 + 32) = v25;
  v26 = *(_OWORD *)(v0 + 176);
  *(_OWORD *)(v0 + 48) = *(_OWORD *)(v0 + 160);
  *(_OWORD *)(v0 + 64) = v26;
  sub_19A623F88((_QWORD *)(v0 + 16));
  v27 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 544) = v27;
  *v27 = v0;
  v27[1] = sub_19A623508;
  return sub_19A620830(*(_QWORD *)(v0 + 368));
}

uint64_t sub_19A623508()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 552) = v0;
  swift_task_dealloc();
  if (!v0)
    sub_19A624040(v2 + 16);
  return swift_task_switch();
}

uint64_t sub_19A6235C0()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  _QWORD *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  id v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  _BOOL4 v33;
  void (*v34)(id, uint64_t);
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t);
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58[2];

  v58[1] = *MEMORY[0x1E0C80C00];
  v1 = sub_19A637A5C();
  v2 = sub_19A637BA0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19A50D000, v1, v2, "Succesful export", v3, 2u);
    MEMORY[0x19AEC987C](v3, -1, -1);
  }
  v4 = (_QWORD *)(v0 + 344);

  v5 = sub_19A637A5C();
  v6 = sub_19A637BB8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19A50D000, v5, v6, "Cleaning up directory structure", v7, 2u);
    MEMORY[0x19AEC987C](v7, -1, -1);
  }

  swift_beginAccess();
  if (__OFSUB__(*v4, 1))
  {
    __break(1u);
LABEL_18:
    __break(1u);
  }
  if (*v4 - 1 < 0)
    goto LABEL_18;
  if (*v4 != 1)
  {
    v8 = 0;
    v53 = *v4 - 1;
    do
    {
      v54 = *(void (**)(uint64_t, uint64_t))(v0 + 512);
      v55 = *(id *)(v0 + 520);
      v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 496);
      v14 = *(unsigned int *)(v0 + 560);
      v15 = *(_QWORD *)(v0 + 392);
      v16 = *(_QWORD *)(v0 + 376);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A6C60);
      v17 = swift_allocObject();
      *(_OWORD *)(v17 + 16) = xmmword_19A65DF40;
      v57 = v8;
      *(_QWORD *)(v0 + 304) = v8;
      *(_QWORD *)(v17 + 32) = sub_19A637CE4();
      *(_QWORD *)(v17 + 40) = v18;
      v13(v15, v14, v16);
      sub_19A6378F4();
      swift_bridgeObjectRelease();
      v54(v15, v16);
      v19 = objc_msgSend(v55, sel_defaultManager);
      v20 = (void *)sub_19A6378C4();
      *(_QWORD *)(v0 + 312) = 0;
      v21 = objc_msgSend(v19, sel_removeItemAtURL_error_, v20, v0 + 312);

      v22 = *(void **)(v0 + 312);
      if (v21)
      {
        v9 = *(void (**)(uint64_t, uint64_t))(v0 + 488);
        v10 = *(_QWORD *)(v0 + 424);
        v11 = *(_QWORD *)(v0 + 400);
        v12 = v22;
        v9(v10, v11);
      }
      else
      {
        v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 480);
        v25 = *(_QWORD *)(v0 + 416);
        v24 = *(_QWORD *)(v0 + 424);
        v26 = *(_QWORD *)(v0 + 400);
        v27 = v22;
        v28 = (void *)sub_19A63787C();

        swift_willThrow();
        v23(v25, v24, v26);
        v29 = v28;
        v30 = v28;
        v31 = sub_19A637A5C();
        v32 = sub_19A637BAC();
        v33 = os_log_type_enabled(v31, v32);
        v34 = *(void (**)(id, uint64_t))(v0 + 488);
        v36 = *(void **)(v0 + 416);
        v35 = *(void **)(v0 + 424);
        v37 = *(_QWORD *)(v0 + 400);
        if (v33)
        {
          v38 = swift_slowAlloc();
          v56 = v35;
          v39 = swift_slowAlloc();
          v58[0] = v39;
          *(_DWORD *)v38 = 136446466;
          sub_19A624228(&qword_1EE3A9A68, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
          v40 = sub_19A637CE4();
          *(_QWORD *)(v38 + 4) = sub_19A61C7BC(v40, v41, v58);
          swift_bridgeObjectRelease();
          v34(v36, v37);
          *(_WORD *)(v38 + 12) = 2082;
          *(_QWORD *)(v0 + 320) = v28;
          v42 = v28;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9A70);
          v43 = sub_19A637AD4();
          *(_QWORD *)(v38 + 14) = sub_19A61C7BC(v43, v44, v58);
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_19A50D000, v31, v32, "Failed to remove subdirectory %{public}s with error %{public}s", (uint8_t *)v38, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x19AEC987C](v39, -1, -1);
          MEMORY[0x19AEC987C](v38, -1, -1);

          v45 = v56;
        }
        else
        {

          v34(v36, v37);
          v45 = v35;
        }
        v34(v45, v37);
      }
      v8 = v57 + 1;
    }
    while (v53 != v57 + 1);
  }
  (*(void (**)(_QWORD, _QWORD))(v0 + 488))(*(_QWORD *)(v0 + 440), *(_QWORD *)(v0 + 400));
  v46 = *(void **)(v0 + 160);
  v47 = *(void **)(v0 + 168);
  v48 = *(_QWORD *)(v0 + 192);
  v49 = *(_QWORD *)(v0 + 200);
  v50 = *(_QWORD *)(v0 + 216);
  v51 = *(_QWORD *)(v0 + 224);

  swift_bridgeObjectRelease();
  sub_19A6240CC(v48, v49);
  sub_19A6240CC(v50, v51);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19A623B68()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  (*(void (**)(void))(v0 + 488))();
  v1 = *(void **)(v0 + 160);
  v2 = *(void **)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 192);
  v4 = *(_QWORD *)(v0 + 200);
  v5 = *(_QWORD *)(v0 + 216);
  v6 = *(_QWORD *)(v0 + 224);

  swift_bridgeObjectRelease();
  sub_19A6240CC(v3, v4);
  sub_19A6240CC(v5, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19A623CA8()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(void **)(v0 + 552);
  sub_19A624040(v0 + 16);
  v2 = v1;
  v3 = v1;
  v4 = sub_19A637A5C();
  v5 = sub_19A637BAC();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 552);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    v9 = v6;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 296) = v10;
    sub_19A637C24();
    *v8 = v10;

    _os_log_impl(&dword_19A50D000, v4, v5, "Issue exporting composition: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9D80);
    swift_arrayDestroy();
    MEMORY[0x19AEC987C](v8, -1, -1);
    MEMORY[0x19AEC987C](v7, -1, -1);
  }
  else
  {
    v11 = *(void **)(v0 + 552);

  }
  swift_willThrow();
  (*(void (**)(void))(v0 + 488))();
  v12 = *(void **)(v0 + 160);
  v13 = *(void **)(v0 + 168);
  v14 = *(_QWORD *)(v0 + 192);
  v15 = *(_QWORD *)(v0 + 200);
  v16 = *(_QWORD *)(v0 + 216);
  v17 = *(_QWORD *)(v0 + 224);

  swift_bridgeObjectRelease();
  sub_19A6240CC(v14, v15);
  sub_19A6240CC(v16, v17);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_19A623F44()
{
  unint64_t result;

  result = qword_1EE3A9A58;
  if (!qword_1EE3A9A58)
  {
    result = MEMORY[0x19AEC97E0](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, &qword_1EE3A9A58);
  }
  return result;
}

_QWORD *sub_19A623F88(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  v2 = (void *)a1[3];
  v3 = (void *)a1[4];
  v4 = (void *)a1[5];
  v5 = a1[8];
  v6 = a1[9];
  v7 = a1[11];
  v8 = a1[12];
  swift_bridgeObjectRetain();
  v9 = v2;
  v10 = v3;
  v11 = v4;
  sub_19A624010(v5, v6);
  sub_19A624010(v7, v8);
  return a1;
}

uint64_t sub_19A624010(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_19A624040(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 24);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 88);
  v7 = *(_QWORD *)(a1 + 96);

  swift_bridgeObjectRelease();
  sub_19A6240CC(v4, v5);
  sub_19A6240CC(v6, v7);
  return a1;
}

uint64_t sub_19A6240CC(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

ValueMetadata *type metadata accessor for RecordingMediaComposer()
{
  return &type metadata for RecordingMediaComposer;
}

uint64_t sub_19A62410C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9A80);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_19A62414C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9A80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for RecordingCompositionError()
{
  uint64_t result;

  result = qword_1EE3A9B38;
  if (!qword_1EE3A9B38)
    return swift_getSingletonMetadata();
  return result;
}

BOOL sub_19A6241D0()
{
  return sub_19A6207B8();
}

unint64_t sub_19A6241EC()
{
  unint64_t result;

  result = qword_1EE3A9AA8;
  if (!qword_1EE3A9AA8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EE3A9AA8);
  }
  return result;
}

uint64_t sub_19A624228(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x19AEC97E0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_19A624268(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9AB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_19A6242B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[11] = a5;
  v6[12] = a6;
  v6[9] = a3;
  v6[10] = a4;
  v6[7] = a1;
  v6[8] = a2;
  v7 = sub_19A637894();
  v6[13] = v7;
  v6[14] = *(_QWORD *)(v7 - 8);
  v6[15] = swift_task_alloc();
  v8 = sub_19A637918();
  v6[16] = v8;
  v6[17] = *(_QWORD *)(v8 - 8);
  v6[18] = swift_task_alloc();
  v6[19] = swift_task_alloc();
  v6[20] = swift_task_alloc();
  v6[21] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19A624394()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t, uint64_t);
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;

  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 120);
  v12 = *(_QWORD *)(v0 + 136);
  v13 = *(_QWORD *)(v0 + 128);
  v4 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 112);
  v6 = *(_QWORD *)(v0 + 80);
  v5 = *(_QWORD *)(v0 + 88);
  sub_19A6378B8();
  swift_bridgeObjectRetain();
  sub_19A637AF8();
  swift_bridgeObjectRetain();
  sub_19A637AF8();
  swift_bridgeObjectRelease();
  sub_19A637AF8();
  *(_QWORD *)(v0 + 16) = v6;
  *(_QWORD *)(v0 + 24) = v5;
  *(_DWORD *)(v0 + 224) = *MEMORY[0x1E0CAFD78];
  v7 = *(void (**)(uint64_t))(v3 + 104);
  *(_QWORD *)(v0 + 176) = v7;
  v7(v2);
  *(_QWORD *)(v0 + 184) = sub_19A623F44();
  sub_19A637900();
  v8 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  *(_QWORD *)(v0 + 192) = v8;
  v8(v2, v4);
  swift_bridgeObjectRelease();
  v9 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
  *(_QWORD *)(v0 + 200) = v9;
  v9(v1, v13);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 208) = v10;
  *v10 = v0;
  v10[1] = sub_19A624534;
  return sub_19A6259A4(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
}

uint64_t sub_19A624534()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 216) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19A6245DC()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  id v23;
  void *v24;
  unsigned int v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void (*v34)(uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t (*v39)(void);
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t, uint64_t);
  uint64_t v49[3];

  v49[2] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(v0 + 56);
  v47 = *(void (**)(uint64_t, uint64_t))(v0 + 192);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 176);
  v3 = *(unsigned int *)(v0 + 224);
  v4 = *(_QWORD *)(v0 + 120);
  v5 = *(_QWORD *)(v0 + 104);
  v6 = *(_QWORD *)(v0 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A6C60);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_19A65DF40;
  v49[0] = v1;
  v49[1] = v6;
  swift_bridgeObjectRetain();
  sub_19A637AF8();
  *(_QWORD *)(v7 + 32) = v1;
  *(_QWORD *)(v7 + 40) = v6;
  v2(v4, v3, v5);
  sub_19A6378F4();
  swift_bridgeObjectRelease();
  v47(v4, v5);
  if (qword_1EE3A9860 != -1)
    swift_once();
  v9 = *(_QWORD *)(v0 + 144);
  v8 = *(_QWORD *)(v0 + 152);
  v10 = *(_QWORD *)(v0 + 128);
  v11 = *(_QWORD *)(v0 + 136);
  v12 = sub_19A637A74();
  __swift_project_value_buffer(v12, (uint64_t)qword_1EE3AA8E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v9, v8, v10);
  v13 = sub_19A637A5C();
  v14 = sub_19A637BB8();
  v15 = os_log_type_enabled(v13, v14);
  v16 = *(_QWORD *)(v0 + 144);
  v17 = *(_QWORD *)(v0 + 128);
  if (v15)
  {
    v48 = *(void (**)(uint64_t, uint64_t))(v0 + 200);
    v18 = (uint8_t *)swift_slowAlloc();
    v19 = swift_slowAlloc();
    v49[0] = v19;
    *(_DWORD *)v18 = 136446210;
    sub_19A624228(&qword_1EE3A9A68, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v20 = sub_19A637CE4();
    *(_QWORD *)(v0 + 48) = sub_19A61C7BC(v20, v21, v49);
    sub_19A637C24();
    swift_bridgeObjectRelease();
    v48(v16, v17);
    _os_log_impl(&dword_19A50D000, v13, v14, "Moving captionComposition1 to final destination %{public}s", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AEC987C](v19, -1, -1);
    MEMORY[0x19AEC987C](v18, -1, -1);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v0 + 200))(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 128));
  }

  v22 = (void *)objc_opt_self();
  v23 = objc_msgSend(v22, sel_defaultManager);
  v24 = (void *)sub_19A6378C4();
  *(_QWORD *)(v0 + 32) = 0;
  v25 = objc_msgSend(v23, sel_removeItemAtURL_error_, v24, v0 + 32);

  v26 = *(void **)(v0 + 32);
  v27 = *(_QWORD *)(v0 + 152);
  if (!v25)
  {
    v40 = *(void (**)(uint64_t, uint64_t))(v0 + 200);
    v41 = *(_QWORD *)(v0 + 128);
    v42 = v26;
    sub_19A63787C();

    swift_willThrow();
    v40(v27, v41);
LABEL_11:
    (*(void (**)(_QWORD, _QWORD))(v0 + 200))(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 128));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v39 = *(uint64_t (**)(void))(v0 + 8);
    return v39();
  }
  v28 = v26;
  v29 = objc_msgSend(v22, sel_defaultManager);
  v30 = (void *)sub_19A6378C4();
  v31 = (void *)sub_19A6378C4();
  *(_QWORD *)(v0 + 40) = 0;
  v32 = objc_msgSend(v29, sel_moveItemAtURL_toURL_error_, v30, v31, v0 + 40);

  v33 = *(void **)(v0 + 40);
  v34 = *(void (**)(uint64_t, uint64_t))(v0 + 200);
  if (!v32)
  {
    v43 = *(_QWORD *)(v0 + 152);
    v44 = *(_QWORD *)(v0 + 128);
    v45 = v33;
    sub_19A63787C();

    swift_willThrow();
    v34(v43, v44);
    goto LABEL_11;
  }
  v35 = *(_QWORD *)(v0 + 168);
  v36 = *(_QWORD *)(v0 + 152);
  v37 = *(_QWORD *)(v0 + 128);
  v38 = v33;
  v34(v36, v37);
  v34(v35, v37);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v39 = *(uint64_t (**)(void))(v0 + 8);
  return v39();
}

uint64_t sub_19A624ABC()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(v0 + 200))(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 128));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t *sub_19A624B6C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      v11 = a2[2];
      v12 = a2[3];
      a1[2] = v11;
      a1[3] = v12;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v8 = sub_19A637918();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_19A624C54(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else if (!(_DWORD)result)
  {
    v3 = sub_19A637918();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  return result;
}

_QWORD *sub_19A624CBC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    v9 = a2[2];
    v10 = a2[3];
    a1[2] = v9;
    a1[3] = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_19A637918();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_QWORD *sub_19A624D7C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_19A624E5C((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      a1[3] = a2[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = sub_19A637918();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_19A624E5C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RecordingCompositionError();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_19A624E98(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = sub_19A637918();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_19A624F20(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_19A624E5C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = sub_19A637918();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_19A624FB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_19A624FC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_19A624FD8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_19A624FE8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_19A637918();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_19A625064()
{
  uint64_t v0;

  v0 = sub_19A637A74();
  __swift_allocate_value_buffer(v0, qword_1EE3AA8E0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EE3AA8E0);
  return sub_19A637A68();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_19A625124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v5[21] = a4;
  v5[22] = v4;
  v5[19] = a2;
  v5[20] = a3;
  v5[18] = a1;
  v6 = sub_19A637918();
  v5[23] = v6;
  v5[24] = *(_QWORD *)(v6 - 8);
  v5[25] = swift_task_alloc();
  v5[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19A62519C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v24;
  uint64_t v25;

  if (qword_1EE3A9860 != -1)
    swift_once();
  v1 = v0[18];
  v2 = v0[26];
  v3 = v0[23];
  v4 = v0[24];
  v5 = sub_19A637A74();
  v0[27] = __swift_project_value_buffer(v5, (uint64_t)qword_1EE3AA8E0);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[28] = v6;
  v6(v2, v1, v3);
  v7 = sub_19A637A5C();
  v8 = sub_19A637BA0();
  v9 = os_log_type_enabled(v7, v8);
  v10 = v0[26];
  v11 = v0[24];
  if (v9)
  {
    v24 = v0[23];
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    v25 = v13;
    *(_DWORD *)v12 = 136315138;
    v14 = sub_19A637888();
    v0[17] = sub_19A61C7BC(v14, v15, &v25);
    sub_19A637C24();
    swift_bridgeObjectRelease();
    v16 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v16(v10, v24);
    _os_log_impl(&dword_19A50D000, v7, v8, "Appending track with url %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AEC987C](v13, -1, -1);
    MEMORY[0x19AEC987C](v12, -1, -1);
  }
  else
  {
    v16 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v16(v10, v0[23]);
  }

  v0[29] = v16;
  v17 = objc_allocWithZone(MEMORY[0x1E0C8B3C0]);
  v18 = (void *)sub_19A6378C4();
  v19 = objc_msgSend(v17, sel_initWithURL_options_, v18, 0);
  v0[30] = v19;

  v20 = *MEMORY[0x1E0C8A7F8];
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_19A625430;
  v21 = swift_continuation_init();
  v0[10] = MEMORY[0x1E0C809B0];
  v22 = v0 + 10;
  v22[1] = 0x40000000;
  v22[2] = sub_19A61E7A0;
  v22[3] = &block_descriptor_1;
  v22[4] = v21;
  objc_msgSend(v19, sel_loadTracksWithMediaType_completionHandler_, v20, v22);
  return swift_continuation_await();
}

uint64_t sub_19A625430()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 248) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

void sub_19A625490()
{
  uint64_t v0;
  unint64_t v1;
  id v2;
  void *v3;
  void *v4;
  CMTimeEpoch v5;
  unint64_t v6;
  CMTimeValue v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  _BOOL4 v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v1 = *(_QWORD *)(v0 + 120);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v11 = sub_19A637C90();
    swift_bridgeObjectRelease();
    if (v11)
      goto LABEL_3;
LABEL_8:
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 224))(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 184));
    v12 = sub_19A637A5C();
    v13 = sub_19A637BAC();
    v14 = os_log_type_enabled(v12, v13);
    v15 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
    v16 = *(_QWORD *)(v0 + 200);
    v17 = *(_QWORD *)(v0 + 184);
    if (v14)
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v22 = v19;
      *(_DWORD *)v18 = 136315138;
      sub_19A624228(&qword_1EE3A9A68, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
      v20 = sub_19A637CE4();
      *(_QWORD *)(v0 + 128) = sub_19A61C7BC(v20, v21, &v22);
      sub_19A637C24();
      swift_bridgeObjectRelease();
      v15(v16, v17);
      _os_log_impl(&dword_19A50D000, v12, v13, "Missing tracks in movieURL %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x19AEC987C](v19, -1, -1);
      MEMORY[0x19AEC987C](v18, -1, -1);
    }
    else
    {
      v15(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 184));
    }

    sub_19A637C84();
    return;
  }
  if (!*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_8;
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    v2 = (id)MEMORY[0x19AEC8688](0, v1);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v2 = *(id *)(v1 + 32);
LABEL_6:
    v3 = v2;
    v4 = *(void **)(v0 + 240);
    v6 = *(_QWORD *)(v0 + 160);
    v5 = *(_QWORD *)(v0 + 168);
    v7 = *(_QWORD *)(v0 + 152);
    swift_bridgeObjectRelease();
    v8 = v3;
    v9 = sub_19A626A44((uint64_t)v8, v4, v7, v6, v5);
    v10 = *(void **)(v0 + 240);
    sub_19A626598((unint64_t)v9);

    swift_task_dealloc();
    swift_task_dealloc();
    (*(void (**)(void))(v0 + 8))();
    return;
  }
  __break(1u);
}

uint64_t sub_19A6257AC()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;

  v1 = *(void **)(v0 + 248);
  swift_willThrow();

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 224))(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 184));
  v2 = sub_19A637A5C();
  v3 = sub_19A637BAC();
  if (os_log_type_enabled(v2, v3))
  {
    v11 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
    v4 = *(_QWORD *)(v0 + 200);
    v5 = *(_QWORD *)(v0 + 184);
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v12 = v7;
    *(_DWORD *)v6 = 136315138;
    sub_19A624228(&qword_1EE3A9A68, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v8 = sub_19A637CE4();
    *(_QWORD *)(v0 + 128) = sub_19A61C7BC(v8, v9, &v12);
    sub_19A637C24();
    swift_bridgeObjectRelease();
    v11(v4, v5);
    _os_log_impl(&dword_19A50D000, v2, v3, "Missing tracks in movieURL %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AEC987C](v7, -1, -1);
    MEMORY[0x19AEC987C](v6, -1, -1);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v0 + 232))(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 184));
  }

  return sub_19A637C84();
}

uint64_t sub_19A6259A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[32] = a3;
  v4[33] = a4;
  v4[30] = a1;
  v4[31] = a2;
  v5 = sub_19A637918();
  v4[34] = v5;
  v4[35] = *(_QWORD *)(v5 - 8);
  v4[36] = swift_task_alloc();
  v4[37] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19A625A44()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void **v26;
  __int128 v27;
  char *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  NSObject *v40;
  os_log_type_t v41;
  _BOOL4 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  void *v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  unsigned int v54;
  id v55;
  NSObject *v56;
  os_log_type_t v57;
  uint64_t v58;
  _QWORD *v59;
  id v60;
  uint64_t v61;
  _QWORD *v62;
  __int128 v64;
  id v65;
  id v66;
  uint64_t v67;
  void **v68;
  void *v69;
  _QWORD *v70;
  _QWORD *v71;
  _QWORD *v72;
  void *v73;
  uint64_t v74[8];

  v74[6] = *MEMORY[0x1E0C80C00];
  v0[29] = 0;
  v1 = v0 + 29;
  CMFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x74657874u, 0x77767474u, 0, (CMFormatDescriptionRef *)v0 + 29);
  if (qword_1EE3A9860 != -1)
    goto LABEL_30;
  while (1)
  {
    v2 = sub_19A637A74();
    v72 = v0;
    v0[38] = __swift_project_value_buffer(v2, (uint64_t)qword_1EE3AA8E0);
    v3 = sub_19A637A5C();
    v4 = sub_19A637BB8();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19A50D000, v3, v4, "Setting up writer to combine tracks", v5, 2u);
      MEMORY[0x19AEC987C](v5, -1, -1);
    }
    v6 = v0[37];
    v7 = v0[34];
    v8 = v0[35];
    v9 = v0[30];

    v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C8B020]), sel_initWithMediaType_outputSettings_sourceFormatHint_, *MEMORY[0x1E0C8A7F8], 0, v0[29]);
    v0[39] = v10;
    objc_msgSend(v10, sel_setExpectsMediaDataInRealTime_, 1);
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
    v0[40] = v11;
    v11(v6, v9, v7);
    v12 = (void *)*MEMORY[0x1E0C8A2E8];
    v13 = objc_allocWithZone(MEMORY[0x1E0C8B018]);
    v14 = v12;
    v15 = sub_19A627408(v6, (uint64_t)v14);
    v0[41] = v15;
    v16 = v15;

    v66 = v10;
    objc_msgSend(v16, sel_addInput_, v10);
    objc_msgSend(v16, sel_startWriting);
    v17 = MEMORY[0x1E0CA2E68];
    v18 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v0[21] = *MEMORY[0x1E0CA2E68];
    v0[22] = *(_QWORD *)(v17 + 8);
    v0[23] = v18;
    v65 = v16;
    objc_msgSend(v16, sel_startSessionAtSourceTime_, v1 - 8);
    v19 = sub_19A637A5C();
    v20 = sub_19A637BB8();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_19A50D000, v19, v20, "Writing remote captions to combining writer", v21, 2u);
      MEMORY[0x19AEC987C](v21, -1, -1);
    }
    v22 = v0[33];

    v23 = v0[33];
    if (v22 >> 62)
      break;
    v24 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v25 = v10;
    if (!v24)
      goto LABEL_32;
LABEL_8:
    v70 = v1 - 5;
    v71 = v1 - 11;
    v26 = (void **)(v1 - 2);
    v0 = 0;
    v69 = (void *)objc_opt_self();
    *(_QWORD *)&v27 = 138412290;
    v64 = v27;
    v1 = v72;
    v67 = v24;
    v68 = v26;
    while (1)
    {
      v28 = (char *)v0 + 1;
      if (__OFADD__(v0, 1))
        break;
      v29 = *(void **)(v23 + 32 + 8 * (_QWORD)v0);
      *v26 = 0;
      v30 = v29;
      v31 = objc_msgSend(v30, sel_text);
      if (!v31)
      {
        sub_19A637ABC();
        v31 = (id)sub_19A637AB0();
        swift_bridgeObjectRelease();
      }
      objc_msgSend(v30, sel_timeRange, v64);
      v32 = v74[0];
      v33 = v30;
      v34 = v74[2];
      v35 = v74[1];
      v73 = v33;
      objc_msgSend(v33, sel_timeRange);
      v36 = v74[3];
      v37 = v74[5];
      v38 = v74[4];
      v1[18] = v32;
      v1[19] = v35;
      v1[20] = v34;
      v1[24] = v36;
      v1[25] = v38;
      v1[26] = v37;
      v39 = objc_msgSend(v69, sel_createWebVTTTextSampleBuffer_startTime_duration_sampleBufferOut_, v31, v71, v70, v26);

      if (v39 || (v50 = *v26) == 0)
      {
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        v40 = sub_19A637A5C();
        v41 = sub_19A637BAC();
        v42 = os_log_type_enabled(v40, v41);
        v43 = v1[32];
        v44 = v1[33];
        if (v42)
        {
          v45 = v72[31];
          v46 = swift_slowAlloc();
          v47 = swift_slowAlloc();
          v74[0] = v47;
          *(_DWORD *)v46 = 67109378;
          *(_DWORD *)(v46 + 4) = v39;
          *(_WORD *)(v46 + 8) = 2080;
          v72[15] = v45;
          v1 = v72;
          v72[16] = v43;
          v72[17] = v44;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v48 = sub_19A637AD4();
          *(_QWORD *)(v46 + 10) = sub_19A61C7BC(v48, v49, v74);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_19A50D000, v40, v41, "Error while creating sample buffer %d for %s", (uint8_t *)v46, 0x12u);
          swift_arrayDestroy();
          MEMORY[0x19AEC987C](v47, -1, -1);
          MEMORY[0x19AEC987C](v46, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
        }

        v24 = v67;
        v26 = v68;
        v28 = (char *)v0 + 1;
      }
      else
      {
        v51 = sub_19A637A5C();
        v52 = sub_19A637BA0();
        if (os_log_type_enabled(v51, v52))
        {
          v53 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v53 = 0;
          _os_log_impl(&dword_19A50D000, v51, v52, "Adding text buffer", v53, 2u);
          MEMORY[0x19AEC987C](v53, -1, -1);
        }

        v54 = objc_msgSend(v66, sel_appendSampleBuffer_, v50);
        if (v54)
        {
          v55 = v65;
          v56 = sub_19A637A5C();
          v57 = sub_19A637BAC();
          v1 = v72;
          if (os_log_type_enabled(v56, v57))
          {
            v58 = swift_slowAlloc();
            v59 = (_QWORD *)swift_slowAlloc();
            *(_DWORD *)v58 = v64;
            v60 = objc_msgSend(v55, sel_error);
            if (v60)
              v60 = (id)_swift_stdlib_bridgeErrorToNSError();
            *(_QWORD *)(v58 + 4) = v60;
            *v59 = v60;

            _os_log_impl(&dword_19A50D000, v56, v57, "Error while adding sample buffer %@", (uint8_t *)v58, 0xCu);
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9D80);
            swift_arrayDestroy();
            MEMORY[0x19AEC987C](v59, -1, -1);
            MEMORY[0x19AEC987C](v58, -1, -1);

            v26 = v68;
            v28 = (char *)v0 + 1;
          }
          else
          {

            v28 = (char *)v0 + 1;
          }
        }
        else
        {

          v1 = v72;
        }
      }
      v0 = (_QWORD *)((char *)v0 + 1);
      if (v28 == (char *)v24)
      {
        v25 = v66;
        goto LABEL_33;
      }
    }
    __break(1u);
LABEL_30:
    swift_once();
  }
  swift_bridgeObjectRetain();
  v24 = sub_19A637C90();
  v23 = v0[33];
  v25 = v10;
  if (v24)
    goto LABEL_8;
LABEL_32:
  v1 = v72;
LABEL_33:
  swift_bridgeObjectRelease();
  objc_msgSend(v25, sel_markAsFinished);
  v1[2] = v1;
  v1[3] = sub_19A6262F4;
  v61 = swift_continuation_init();
  v1[10] = MEMORY[0x1E0C809B0];
  v62 = v1 + 10;
  v62[1] = 0x40000000;
  v62[2] = sub_19A626750;
  v62[3] = &block_descriptor_2;
  v62[4] = v61;
  objc_msgSend(v65, sel_finishWritingWithCompletionHandler_, v62);
  return swift_continuation_await();
}

uint64_t sub_19A6262F4()
{
  return swift_task_switch();
}

uint64_t sub_19A62636C()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 320))(*(_QWORD *)(v0 + 288), *(_QWORD *)(v0 + 240), *(_QWORD *)(v0 + 272));
  v1 = sub_19A637A5C();
  v2 = sub_19A637BB8();
  if (os_log_type_enabled(v1, v2))
  {
    v15 = *(void **)(v0 + 312);
    v16 = *(void **)(v0 + 328);
    v3 = *(_QWORD *)(v0 + 288);
    v14 = *(_QWORD *)(v0 + 280);
    v4 = *(_QWORD *)(v0 + 272);
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v17[0] = v6;
    *(_DWORD *)v5 = 136315138;
    sub_19A624228(&qword_1EE3A9A68, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v7 = sub_19A637CE4();
    *(_QWORD *)(v0 + 224) = sub_19A61C7BC(v7, v8, v17);
    sub_19A637C24();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v3, v4);
    _os_log_impl(&dword_19A50D000, v1, v2, "Finishing combining captions writing to %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AEC987C](v6, -1, -1);
    MEMORY[0x19AEC987C](v5, -1, -1);

  }
  else
  {
    v9 = *(void **)(v0 + 312);
    v11 = *(_QWORD *)(v0 + 280);
    v10 = *(_QWORD *)(v0 + 288);
    v12 = *(_QWORD *)(v0 + 272);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19A626598(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_19A637C90();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_19A637C90();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x19AEC8694](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_19A626758(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_19A637C90();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_19A637B58();
  }
  __break(1u);
  return result;
}

uint64_t sub_19A626750()
{
  return swift_continuation_resume();
}

uint64_t sub_19A626758(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_19A637C90();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_19A637C90();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_19A6272F4();
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9B78);
          v12 = sub_19A626950(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_19A6272B8();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_19A637CC0();
  __break(1u);
  return result;
}

void (*sub_19A626950(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_19A6269D0(v6, a2, a3);
  return sub_19A6269A4;
}

void sub_19A6269A4(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_19A6269D0(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x19AEC8688](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_19A626A3C;
  }
  __break(1u);
  return result;
}

void sub_19A626A3C(id *a1)
{

}

id sub_19A626A44(uint64_t a1, void *a2, CMTimeValue a3, unint64_t a4, CMTimeEpoch a5)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  unsigned int (*v35)(uint64_t, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char v39;
  void (*v40)(char *, uint64_t);
  char *v41;
  id v42;
  id v43;
  void *v44;
  uint64_t v45;
  id v46;
  NSObject *v47;
  os_log_type_t v48;
  _BOOL4 v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  id v53;
  uint64_t v54;
  _QWORD *v55;
  id v56;
  void *v57;
  CMTimeEpoch epoch;
  uint64_t v59;
  CMTimeValue v60;
  CMTimeEpoch v61;
  uint64_t v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  uint64_t v68;
  id v69;
  uint64_t v70;
  unint64_t v71;
  __int128 v72;
  CMTimeValue v73;
  CMTimeEpoch v74;
  CMTimeValue value;
  unint64_t v76;
  char *v77;
  uint64_t v78;
  id v79;
  char *v80;
  char *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  CMTime lhs;
  CMTimeValue v86;
  uint64_t v87;
  CMTimeEpoch v88;
  CMTime v89;
  CMTime rhs;
  unint64_t v91;
  uint64_t v92;

  v74 = a5;
  v76 = a4;
  v73 = a3;
  v92 = *MEMORY[0x1E0C80C00];
  v8 = sub_19A637BF4();
  v78 = *(_QWORD *)(v8 - 8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v77 = (char *)&v68 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9B90);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v11 = (char *)&v68 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9B98);
  v12 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v80 = (char *)&v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v68 - v15;
  MEMORY[0x1E0C80A78](v14);
  v84 = (uint64_t)&v68 - v17;
  v18 = objc_allocWithZone(MEMORY[0x1E0C8AFD0]);
  lhs.value = 0;
  v19 = a2;
  v20 = objc_msgSend(v18, sel_initWithAsset_error_, v19, &lhs);
  if (v20)
  {
    v21 = v20;
    v70 = v5;
    v22 = (id)lhs.value;

    v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C8B000]), sel_initWithTrack_outputSettings_, a1, 0);
    if ((objc_msgSend(v21, sel_canAddOutput_, v23) & 1) != 0)
    {
      objc_msgSend(v21, sel_addOutput_, v23);
      objc_msgSend(v21, sel_startReading);
    }
    v69 = v21;
    v24 = (id)MEMORY[0x1E0DEE9D8];
    v91 = MEMORY[0x1E0DEE9D8];
    v25 = objc_msgSend(v23, sel_copyNextSampleBuffer);
    v27 = v78;
    v28 = (uint64_t)v80;
    if (v25)
    {
      v29 = v25;
      v71 = HIDWORD(v76);
      *(_QWORD *)&v26 = 138543362;
      v72 = v26;
      v81 = v16;
      v82 = v23;
      while (1)
      {
        v30 = sub_19A637BC4();
        if (v30)
        {
          v31 = (void *)v30;
          v32 = v84;
          sub_19A637C00();

          v33 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 56);
          v33(v32, 0, 1, v8);
        }
        else
        {
          v33 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 56);
          v32 = v84;
          v33(v84, 1, 1, v8);
        }
        sub_19A637BE8();
        v33((uint64_t)v16, 0, 1, v8);
        v34 = (uint64_t)&v11[*(int *)(v83 + 48)];
        sub_19A627384(v32, (uint64_t)v11);
        sub_19A627384((uint64_t)v16, v34);
        v35 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48);
        if (v35((uint64_t)v11, 1, v8) == 1)
        {
          v36 = (uint64_t)v16;
          v37 = v28;
          sub_19A6273CC(v36, &qword_1EE3A9B98);
          sub_19A6273CC(v32, &qword_1EE3A9B98);
          if (v35(v34, 1, v8) != 1)
            goto LABEL_16;
          sub_19A6273CC((uint64_t)v11, &qword_1EE3A9B98);
        }
        else
        {
          sub_19A627384((uint64_t)v11, v28);
          if (v35(v34, 1, v8) == 1)
          {
            sub_19A6273CC((uint64_t)v16, &qword_1EE3A9B98);
            sub_19A6273CC(v84, &qword_1EE3A9B98);
            v37 = v28;
            (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v28, v8);
LABEL_16:
            sub_19A6273CC((uint64_t)v11, &qword_1EE3A9B90);
            goto LABEL_29;
          }
          v38 = v77;
          (*(void (**)(char *, uint64_t, uint64_t))(v27 + 32))(v77, v34, v8);
          sub_19A624228(&qword_1EE3A9BA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF280], MEMORY[0x1E0DEF298]);
          v39 = sub_19A637AA4();
          v40 = *(void (**)(char *, uint64_t))(v27 + 8);
          v41 = v80;
          v40(v38, v8);
          sub_19A6273CC((uint64_t)v16, &qword_1EE3A9B98);
          sub_19A6273CC(v84, &qword_1EE3A9B98);
          v37 = (uint64_t)v41;
          v40(v41, v8);
          sub_19A6273CC((uint64_t)v11, &qword_1EE3A9B98);
          if ((v39 & 1) == 0)
            goto LABEL_29;
        }
        v42 = objc_msgSend((id)objc_opt_self(), sel_parseWebVTTSampleBuffer_, v29);
        v43 = objc_msgSend(v42, sel_error);
        if (v43)
        {
          v44 = v43;
          if (qword_1EE3A9860 != -1)
            swift_once();
          v45 = sub_19A637A74();
          __swift_project_value_buffer(v45, (uint64_t)qword_1EE3AA8E0);
          v46 = v44;
          v47 = sub_19A637A5C();
          v48 = sub_19A637BAC();
          v49 = os_log_type_enabled(v47, v48);
          v16 = v81;
          if (v49)
          {
            v50 = swift_slowAlloc();
            v79 = v42;
            v51 = v50;
            v52 = (_QWORD *)swift_slowAlloc();
            *(_DWORD *)v51 = v72;
            v53 = v46;
            v54 = _swift_stdlib_bridgeErrorToNSError();
            *(_QWORD *)(v51 + 4) = v54;
            *v52 = v54;

            _os_log_impl(&dword_19A50D000, v47, v48, "Error reading from transcription container %{public}@", (uint8_t *)v51, 0xCu);
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9D80);
            swift_arrayDestroy();
            v55 = v52;
            v27 = v78;
            MEMORY[0x19AEC987C](v55, -1, -1);
            MEMORY[0x19AEC987C](v51, -1, -1);

            v29 = v79;
          }
          else
          {

            v29 = v46;
          }
          v28 = (uint64_t)v80;
          goto LABEL_7;
        }
        v56 = objc_msgSend(v42, sel_text);
        if (v56)
        {
          v57 = v56;
          v79 = v42;
          sub_19A637ABC();

          CMSampleBufferGetPresentationTimeStamp(&lhs, (CMSampleBufferRef)v29);
          rhs.value = v73;
          rhs.timescale = v76;
          rhs.flags = v71;
          rhs.epoch = v74;
          CMTimeAdd(&v89, &lhs, &rhs);
          value = v89.value;
          epoch = v89.epoch;
          v59 = *(_QWORD *)&v89.timescale;
          CMSampleBufferGetDuration(&lhs, (CMSampleBufferRef)v29);
          v60 = lhs.value;
          v61 = lhs.epoch;
          v62 = *(_QWORD *)&lhs.timescale;
          v63 = objc_allocWithZone(MEMORY[0x1E0C8B058]);
          v64 = (void *)sub_19A637AB0();
          swift_bridgeObjectRelease();
          lhs.value = value;
          *(_QWORD *)&lhs.timescale = v59;
          lhs.epoch = epoch;
          v86 = v60;
          v87 = v62;
          v88 = v61;
          v65 = objc_msgSend(v63, sel_initWithText_timeRange_, v64, &lhs);

          v66 = v65;
          MEMORY[0x19AEC8550]();
          if (*(_QWORD *)((v91 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v91 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_19A637B64();
          sub_19A637B70();
          sub_19A637B58();

          v29 = v66;
          v27 = v78;
          v28 = (uint64_t)v80;
          goto LABEL_30;
        }

        v29 = v42;
LABEL_29:
        v28 = v37;
LABEL_30:
        v16 = v81;
LABEL_7:

        v23 = v82;
        v29 = objc_msgSend(v82, sel_copyNextSampleBuffer);
        if (!v29)
        {
          v24 = (id)v91;
          break;
        }
      }
    }

  }
  else
  {
    v24 = (id)lhs.value;
    sub_19A63787C();

    swift_willThrow();
  }
  return v24;
}

unint64_t sub_19A6272B8()
{
  unint64_t result;

  result = qword_1EE3A9B80;
  if (!qword_1EE3A9B80)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EE3A9B80);
  }
  return result;
}

unint64_t sub_19A6272F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE3A9B88;
  if (!qword_1EE3A9B88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3A9B78);
    result = MEMORY[0x19AEC97E0](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1EE3A9B88);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x19AEC97D4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_19A627384(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9B98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_19A6273CC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id sub_19A627408(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  id v11;
  id v12;
  uint64_t v13;
  id v15[2];

  v3 = v2;
  v15[1] = *(id *)MEMORY[0x1E0C80C00];
  v6 = (void *)sub_19A6378C4();
  v15[0] = 0;
  v7 = objc_msgSend(v3, sel_initWithURL_fileType_error_, v6, a2, v15);

  v8 = v15[0];
  if (v7)
  {
    v9 = sub_19A637918();
    v10 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8);
    v11 = v8;
    v10(a1, v9);
  }
  else
  {
    v12 = v15[0];
    sub_19A63787C();

    swift_willThrow();
    v13 = sub_19A637918();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a1, v13);
  }
  return v7;
}

uint64_t destroy for CaptionComposition()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s18TelephonyUtilities18CaptionCompositionVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for CaptionComposition(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CaptionComposition(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CaptionComposition(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CaptionComposition(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CaptionComposition()
{
  return &type metadata for CaptionComposition;
}

uint64_t LanguageManager.locale.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for LanguageManager() + 20);
  v4 = sub_19A6379F0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for LanguageManager()
{
  uint64_t result;

  result = qword_1EE3A6BB0;
  if (!qword_1EE3A6BB0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t LanguageManager.locale.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for LanguageManager() + 20);
  v4 = sub_19A6379F0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*LanguageManager.locale.modify())()
{
  type metadata accessor for LanguageManager();
  return nullsub_1;
}

uint64_t LanguageManager.preferredLanguages.getter()
{
  type metadata accessor for LanguageManager();
  return swift_bridgeObjectRetain();
}

uint64_t LanguageManager.preferredLanguages.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for LanguageManager() + 24);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*LanguageManager.preferredLanguages.modify())()
{
  type metadata accessor for LanguageManager();
  return nullsub_1;
}

uint64_t LanguageManager.init(featureFlags:locale:preferredLanguages:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t result;

  v8 = type metadata accessor for LanguageManager();
  sub_19A637A68();
  *a4 = a1;
  v9 = (char *)a4 + *(int *)(v8 + 20);
  v10 = sub_19A6379F0();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9, a2, v10);
  *(_QWORD *)((char *)a4 + *(int *)(v8 + 24)) = a3;
  return result;
}

double LanguageManager.siriSupportedLanguages.getter()
{
  id *v0;
  uint64_t v1;
  double result;

  if (objc_msgSend(*v0, sel_lvmExpansionLiveOnEnabled))
    sub_19A637B34();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A6C60);
  v1 = swift_allocObject();
  *(_QWORD *)&result = 1;
  *(_OWORD *)(v1 + 16) = xmmword_19A65DF40;
  *(_QWORD *)(v1 + 32) = 0x53552D6E65;
  *(_QWORD *)(v1 + 40) = 0xE500000000000000;
  return result;
}

uint64_t LanguageManager.languageIdentifier(for:)()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v0 = __swift_instantiateConcreteTypeFromMangledName(qword_1EE3A6908);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_19A6379D8();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v24 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3A6BA0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19A6379E4();
  sub_19A6379C0();
  v13 = *(void (**)(char *, uint64_t))(v4 + 8);
  v13(v9, v3);
  v14 = sub_19A63799C();
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v12, 1, v14) == 1)
  {
    v16 = 0x53552D6E65;
    v17 = (uint64_t *)&unk_1EE3A6BA0;
    v18 = (uint64_t)v12;
  }
  else
  {
    v25 = sub_19A637990();
    v20 = v19;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v12, v14);
    sub_19A6379E4();
    sub_19A6379CC();
    v13(v7, v3);
    v21 = sub_19A6379B4();
    v22 = *(_QWORD *)(v21 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v2, 1, v21) != 1)
    {
      sub_19A637990();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v2, v21);
      v26 = v25;
      v27 = v20;
      swift_bridgeObjectRetain();
      sub_19A637AF8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_19A637AF8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v26;
    }
    v16 = 0x53552D6E65;
    swift_bridgeObjectRelease();
    v17 = qword_1EE3A6908;
    v18 = (uint64_t)v2;
  }
  sub_19A6273CC(v18, v17);
  return v16;
}

Swift::String __swiftcall LanguageManager.mappedLanguageIdentifier(supportedLanguages:)(Swift::OpaquePointer_optional supportedLanguages)
{
  uint64_t v1;
  uint64_t v2;
  void *rawValue;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  id *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  Swift::String result;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  v2 = v1;
  rawValue = supportedLanguages.value._rawValue;
  v4 = sub_19A637A74();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v72 - v9;
  v11 = type metadata accessor for LanguageManager();
  v12 = MEMORY[0x1E0C80A78](v11);
  v73 = (uint64_t)&v72 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v72 - v15;
  MEMORY[0x1E0C80A78](v14);
  v18 = (id *)((char *)&v72 - v17);
  sub_19A62840C(v2, (uint64_t)&v72 - v17);
  v76 = (uint64_t)v10;
  v77 = v4;
  v74 = (uint64_t)v8;
  if (!rawValue)
  {
    if (!objc_msgSend(*v18, sel_lvmExpansionLiveOnEnabled) || (v79 = 0, sub_19A637B34(), !v79))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A6C60);
      v19 = swift_allocObject();
      *(_OWORD *)(v19 + 16) = xmmword_19A65DF40;
      *(_QWORD *)(v19 + 32) = 0x53552D6E65;
      *(_QWORD *)(v19 + 40) = 0xE500000000000000;
    }
  }
  swift_bridgeObjectRetain();
  sub_19A628450((uint64_t)v18);
  v20 = (void *)objc_opt_self();
  v21 = (void *)sub_19A637B28();
  v22 = (void *)sub_19A637B28();
  v23 = objc_msgSend(v20, sel_matchedLanguagesFromAvailableLanguages_forPreferredLanguages_, v21, v22);

  v24 = (_QWORD *)sub_19A637B40();
  v25 = LanguageManager.languageIdentifier(for:)();
  v27 = v26;
  if (!v24[2])
  {
    v75 = v25;
    swift_bridgeObjectRelease();
    v51 = v2 + *(int *)(v11 + 28);
    v72 = v5;
    v52 = v74;
    v53 = v77;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v74, v51, v77);
    v54 = v73;
    sub_19A62840C(v2, v73);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    v55 = sub_19A637A5C();
    v56 = sub_19A637BB8();
    if (os_log_type_enabled(v55, v56))
    {
      v57 = swift_slowAlloc();
      v76 = swift_slowAlloc();
      v79 = v76;
      *(_DWORD *)v57 = 136315650;
      v58 = swift_bridgeObjectRetain();
      v59 = MEMORY[0x19AEC8580](v58, MEMORY[0x1E0DEA968]);
      v61 = v60;
      swift_bridgeObjectRelease();
      v78 = sub_19A61C7BC(v59, v61, &v79);
      sub_19A637C24();
      swift_bridgeObjectRelease();
      sub_19A628450(v54);
      *(_WORD *)(v57 + 12) = 2080;
      v62 = swift_bridgeObjectRetain();
      v63 = MEMORY[0x19AEC8580](v62, MEMORY[0x1E0DEA968]);
      v65 = v64;
      swift_bridgeObjectRelease();
      v78 = sub_19A61C7BC(v63, v65, &v79);
      sub_19A637C24();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v57 + 22) = 2080;
      swift_bridgeObjectRetain();
      v66 = v75;
      v78 = sub_19A61C7BC(v75, v27, &v79);
      sub_19A637C24();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19A50D000, v55, v56, "No preferred languages %s supported by Siri: %s. Returning fallback current %s", (uint8_t *)v57, 0x20u);
      v67 = v76;
      swift_arrayDestroy();
      MEMORY[0x19AEC987C](v67, -1, -1);
      v68 = v57;
      v49 = v66;
      MEMORY[0x19AEC987C](v68, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v74, v77);
      v28 = v27;
      goto LABEL_13;
    }
    sub_19A628450(v54);

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v52, v53);
    v28 = v27;
LABEL_12:
    v49 = v75;
    goto LABEL_13;
  }
  v28 = v24[5];
  v75 = v24[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v29 = v5;
  v30 = v77;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v76, v2 + *(int *)(v11 + 28), v77);
  sub_19A62840C(v2, (uint64_t)v16);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v31 = sub_19A637A5C();
  v32 = sub_19A637BB8();
  v33 = v32;
  if (!os_log_type_enabled(v31, v32))
  {
    sub_19A628450((uint64_t)v16);

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v76, v30);
    goto LABEL_12;
  }
  v34 = swift_slowAlloc();
  v72 = v29;
  v35 = v34;
  v74 = swift_slowAlloc();
  v79 = v74;
  *(_DWORD *)v35 = 136315906;
  LODWORD(v73) = v33;
  v36 = swift_bridgeObjectRetain();
  v37 = MEMORY[0x19AEC8580](v36, MEMORY[0x1E0DEA968]);
  v39 = v38;
  swift_bridgeObjectRelease();
  v78 = sub_19A61C7BC(v37, v39, &v79);
  sub_19A637C24();
  swift_bridgeObjectRelease();
  sub_19A628450((uint64_t)v16);
  *(_WORD *)(v35 + 12) = 2080;
  v40 = swift_bridgeObjectRetain();
  v41 = MEMORY[0x1E0DEA968];
  v42 = MEMORY[0x19AEC8580](v40, MEMORY[0x1E0DEA968]);
  v44 = v43;
  swift_bridgeObjectRelease();
  v78 = sub_19A61C7BC(v42, v44, &v79);
  sub_19A637C24();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  *(_WORD *)(v35 + 22) = 2080;
  v45 = swift_bridgeObjectRetain();
  v46 = MEMORY[0x19AEC8580](v45, v41);
  v48 = v47;
  swift_bridgeObjectRelease();
  v78 = sub_19A61C7BC(v46, v48, &v79);
  sub_19A637C24();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  *(_WORD *)(v35 + 32) = 2080;
  swift_bridgeObjectRetain();
  v49 = v75;
  v78 = sub_19A61C7BC(v75, v28, &v79);
  sub_19A637C24();
  swift_bridgeObjectRelease_n();
  _os_log_impl(&dword_19A50D000, v31, (os_log_type_t)v73, "Mapping preferred languages %s to languages supported by Siri: %s. Mapped languages: %s Returning identifier %s", (uint8_t *)v35, 0x2Au);
  v50 = v74;
  swift_arrayDestroy();
  MEMORY[0x19AEC987C](v50, -1, -1);
  MEMORY[0x19AEC987C](v35, -1, -1);

  (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v76, v77);
LABEL_13:
  v69 = v49;
  v70 = (void *)v28;
  result._object = v70;
  result._countAndFlagsBits = v69;
  return result;
}

uint64_t sub_19A62840C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LanguageManager();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_19A628450(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for LanguageManager();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Swift::String_optional __swiftcall LanguageManager.localizedString(forKey:table:bundle:languageCode:)(Swift::String forKey, Swift::String table, NSBundle bundle, Swift::String_optional languageCode)
{
  uint64_t v4;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  Swift::String_optional result;
  uint64_t v29;

  object = languageCode.value._object;
  countAndFlagsBits = languageCode.value._countAndFlagsBits;
  v8 = type metadata accessor for LanguageManager();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_19A62840C(v4, (uint64_t)v10);
  if (object)
  {
    v13 = object;
  }
  else
  {
    v14 = *(_QWORD **)&v10[*(int *)(v8 + 24)];
    if (!v14[2])
    {
LABEL_10:
      __break(1u);
      goto LABEL_11;
    }
    countAndFlagsBits = v14[4];
    v13 = (void *)v14[5];
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  sub_19A628450((uint64_t)v10);
  v15 = -[objc_class localizations](bundle.super.isa, sel_localizations);
  if (!v15)
  {
    sub_19A637B40();
    v15 = (id)sub_19A637B28();
    swift_bridgeObjectRelease();
  }
  v16 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A6C60);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_19A65DF40;
  *(_QWORD *)(v17 + 32) = countAndFlagsBits;
  *(_QWORD *)(v17 + 40) = v13;
  v18 = (void *)sub_19A637B28();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(v16, sel_preferredLocalizationsFromArray_forPreferences_, v15, v18);

  v20 = sub_19A637B40();
  if (!*(_QWORD *)(v20 + 16))
  {
    __break(1u);
    goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21 = (void *)sub_19A637AB0();
  v22 = (void *)sub_19A637AB0();
  v23 = (void *)sub_19A637AB0();
  swift_bridgeObjectRelease();
  v24 = -[objc_class localizedStringForKey:value:table:localization:](bundle.super.isa, sel_localizedStringForKey_value_table_localization_, v21, 0, v22, v23);

  v25 = sub_19A637ABC();
  v27 = v26;

  v11 = v25;
  v12 = v27;
LABEL_11:
  result.value._object = v12;
  result.value._countAndFlagsBits = v11;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for LanguageManager(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_19A6379F0();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_unknownObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[7];
    *(uint64_t *)((char *)v7 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    v14 = (char *)v7 + v13;
    v15 = (char *)a2 + v13;
    v16 = sub_19A637A74();
    v17 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
    swift_bridgeObjectRetain();
    v17(v14, v15, v16);
  }
  return v7;
}

uint64_t destroy for LanguageManager(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_unknownObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_19A6379F0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  v6 = a1 + *(int *)(a2 + 28);
  v7 = sub_19A637A74();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

_QWORD *initializeWithCopy for LanguageManager(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_19A6379F0();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_unknownObjectRetain();
  v10(v7, v8, v9);
  v11 = a3[7];
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = sub_19A637A74();
  v15 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  v15(v12, v13, v14);
  return a1;
}

_QWORD *assignWithCopy for LanguageManager(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_19A6379F0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[7];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_19A637A74();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

_QWORD *initializeWithTake for LanguageManager(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_19A6379F0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_19A637A74();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

_QWORD *assignWithTake for LanguageManager(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  *a1 = *a2;
  swift_unknownObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_19A6379F0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  swift_bridgeObjectRelease();
  v10 = a3[7];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_19A637A74();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for LanguageManager()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_19A628B40(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_19A6379F0();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 20);
    }
    else
    {
      v10 = sub_19A637A74();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 28);
    }
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(&a1[v11], a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for LanguageManager()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_19A628BEC(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v8 = sub_19A6379F0();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = sub_19A637A74();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 28);
    }
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(&v5[v11], a2, a2, v10);
  }
  return result;
}

uint64_t sub_19A628C88()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_19A6379F0();
  if (v1 <= 0x3F)
  {
    result = sub_19A637A74();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t dispatch thunk of VoiceSpamReportTelephonyManagerProtocol.carrierVoiceCallSpamReportingAddress(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of VoiceSpamReportTelephonyManagerProtocol.sendVoiceCallSpamReportToCarrier(with:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of VoiceSpamReportTelephonyManagerProtocol.carrierName(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of VoiceSpamReportTelephonyManagerProtocol.isSIMInHomeCountry(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of VoiceSpamReportTelephonyManagerProtocol.carrierHasWiFiCallingEnabled(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of VoiceSpamReportTelephonyManagerProtocol.carrierIsInRoaming(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

Swift::String_optional __swiftcall VoiceSpamReportTelephonyManager.carrierVoiceCallSpamReportingAddress(for:)(Swift::String_optional a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  Swift::String_optional result;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15[4];

  v2 = sub_19A628F2C(a1.value._countAndFlagsBits, (unint64_t)a1.value._object);
  if (!v2)
    goto LABEL_8;
  v3 = v2;
  sub_19A6294AC(*(_QWORD *)(v1 + 16), v2, (uint64_t)v15);
  if (!v15[3])
  {

    sub_19A6298A4((uint64_t)v15);
LABEL_8:
    v4 = 0;
    v5 = 0;
    goto LABEL_9;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_8;
  }
  v4 = v13;
  v5 = (void *)v14;
  swift_bridgeObjectRetain_n();
  v6 = sub_19A637A5C();
  v7 = sub_19A637BB8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v15[0] = v9;
    *(_DWORD *)v8 = 136315138;
    swift_bridgeObjectRetain();
    sub_19A61C7BC(v13, v14, v15);
    sub_19A637C24();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19A50D000, v6, v7, "voice call spam reporting carrier address - %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AEC987C](v9, -1, -1);
    MEMORY[0x19AEC987C](v8, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

LABEL_9:
  v10 = v4;
  v11 = v5;
  result.value._object = v11;
  result.value._countAndFlagsBits = v10;
  return result;
}

void *sub_19A628F2C(uint64_t a1, unint64_t a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  id v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  _QWORD *v26;
  id v27;
  _QWORD *v28;
  uint64_t v29;
  unint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v38;
  uint64_t v40;

  v3 = objc_msgSend((id)objc_opt_self(), sel_fetchSubscriptionsInUse);
  if (!v3)
  {
    v18 = sub_19A637A5C();
    v19 = sub_19A637BAC();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_19A50D000, v18, v19, "Not able to fetch subscriptions active in device.", v20, 2u);
      MEMORY[0x19AEC987C](v20, -1, -1);
    }

    return 0;
  }
  v4 = v3;
  sub_19A527078(0, &qword_1EE3A9C20);
  v5 = sub_19A637B40();

  if (v5 >> 62)
  {
LABEL_37:
    swift_bridgeObjectRetain();
    v6 = sub_19A637C90();
    swift_bridgeObjectRelease();
    if (v6)
      goto LABEL_4;
    goto LABEL_38;
  }
  v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v6)
  {
LABEL_38:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain_n();
    v31 = sub_19A637A5C();
    v32 = sub_19A637BB8();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      *(_DWORD *)v33 = 136315138;
      v40 = v34;
      if (a2)
        v35 = a1;
      else
        v35 = 0;
      if (a2)
        v36 = a2;
      else
        v36 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      sub_19A61C7BC(v35, v36, &v40);
      sub_19A637C24();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_19A50D000, v31, v32, "Not able to find subscription context for SIM ID - %s", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x19AEC987C](v34, -1, -1);
      MEMORY[0x19AEC987C](v33, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    return 0;
  }
LABEL_4:
  v7 = 4;
  while (1)
  {
    if ((v5 & 0xC000000000000001) != 0)
      v8 = (id)MEMORY[0x19AEC8688](v7 - 4, v5);
    else
      v8 = *(id *)(v5 + 8 * v7);
    v9 = v8;
    v10 = v7 - 3;
    if (__OFADD__(v7 - 4, 1))
    {
      __break(1u);
      goto LABEL_37;
    }
    v11 = objc_msgSend(v8, sel_labelID);
    if (v11)
      break;
    if (!a2)
      goto LABEL_27;
LABEL_6:

LABEL_7:
    ++v7;
    if (v10 == v6)
      goto LABEL_38;
  }
  v12 = v11;
  v13 = sub_19A637ABC();
  v15 = v14;

  if (!a2)
  {

    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  if (v13 != a1 || v15 != a2)
  {
    v17 = sub_19A637CF0();
    swift_bridgeObjectRelease();
    if ((v17 & 1) != 0)
      goto LABEL_27;
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
LABEL_27:
  swift_bridgeObjectRelease();
  v21 = v9;
  swift_bridgeObjectRetain_n();
  v22 = v21;
  v23 = sub_19A637A5C();
  v24 = sub_19A637BB8();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = swift_slowAlloc();
    v26 = (_QWORD *)swift_slowAlloc();
    v38 = swift_slowAlloc();
    v40 = v38;
    *(_DWORD *)v25 = 138412546;
    v27 = v22;
    sub_19A637C24();
    *v26 = v9;
    v28 = v26;

    *(_WORD *)(v25 + 12) = 2080;
    if (a2)
      v29 = a1;
    else
      v29 = 0;
    if (a2)
      v30 = a2;
    else
      v30 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_19A61C7BC(v29, v30, &v40);
    sub_19A637C24();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_19A50D000, v23, v24, "Found subscription context %@ for SIM ID %s", (uint8_t *)v25, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9D80);
    swift_arrayDestroy();
    MEMORY[0x19AEC987C](v28, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x19AEC987C](v38, -1, -1);
    MEMORY[0x19AEC987C](v25, -1, -1);

  }
  else
  {
    swift_bridgeObjectRelease_n();

  }
  return v9;
}

double sub_19A6294AC@<D0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  id v7;
  void *v8;
  id v9;
  id v10;
  double result;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  id v30;
  id v31[2];

  v31[1] = *(id *)MEMORY[0x1E0C80C00];
  v7 = *(id *)(v3 + OBJC_IVAR____TtC18TelephonyUtilities31VoiceSpamReportTelephonyManager_ctClient);
  sub_19A62A4AC(a1);
  v8 = (void *)sub_19A637B28();
  swift_bridgeObjectRelease();
  v31[0] = 0;
  v9 = objc_msgSend(v7, sel_context_getCarrierBundleValue_error_, a2, v8, v31);

  v29 = v31[0];
  if (v9)
  {
    *(_QWORD *)(a3 + 24) = sub_19A527078(0, (unint64_t *)&qword_1EE3A98A8);
    *(_QWORD *)a3 = v9;
    v10 = v29;
  }
  else
  {
    v12 = v31[0];
    v13 = (void *)sub_19A63787C();

    swift_willThrow();
    swift_bridgeObjectRetain();
    v14 = a2;
    v15 = v13;
    swift_bridgeObjectRetain();
    v16 = v14;
    v17 = v13;
    v18 = sub_19A637A5C();
    v19 = sub_19A637BAC();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = swift_slowAlloc();
      v21 = (_QWORD *)swift_slowAlloc();
      v30 = (id)swift_slowAlloc();
      v31[0] = v30;
      *(_DWORD *)v20 = 136315650;
      v22 = swift_bridgeObjectRetain();
      v23 = MEMORY[0x19AEC8580](v22, MEMORY[0x1E0DEA968]);
      v25 = v24;
      swift_bridgeObjectRelease();
      sub_19A61C7BC(v23, v25, (uint64_t *)v31);
      sub_19A637C24();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 12) = 2112;
      v26 = v16;
      sub_19A637C24();
      *v21 = v16;

      *(_WORD *)(v20 + 22) = 2080;
      swift_getErrorValue();
      v27 = sub_19A637D08();
      sub_19A61C7BC(v27, v28, (uint64_t *)v31);
      sub_19A637C24();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_19A50D000, v18, v19, "Error while extracting carrier bundle value for key hierarchy: %s for subscription context: %@. Error - %s", (uint8_t *)v20, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9D80);
      swift_arrayDestroy();
      MEMORY[0x19AEC987C](v21, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x19AEC987C](v30, -1, -1);
      MEMORY[0x19AEC987C](v20, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

uint64_t sub_19A6298A4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9C10);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Swift::Bool __swiftcall VoiceSpamReportTelephonyManager.sendVoiceCallSpamReportToCarrier(with:for:)(Swift::String with, Swift::String_optional a2)
{
  void *object;
  uint64_t countAndFlagsBits;
  void *v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;

  object = a2.value._object;
  countAndFlagsBits = a2.value._countAndFlagsBits;
  if (!(unint64_t)VoiceSpamReportTelephonyManager.carrierVoiceCallSpamReportingAddress(for:)(a2).value._object)
  {
    v15 = sub_19A637A5C();
    v16 = sub_19A637BAC();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_19A50D000, v15, v16, "not sending voice call spam report to carrier since carrier address is nil", v17, 2u);
      MEMORY[0x19AEC987C](v17, -1, -1);
    }

    goto LABEL_11;
  }
  v4 = sub_19A628F2C(countAndFlagsBits, (unint64_t)object);
  if (!v4)
  {
    swift_bridgeObjectRelease();
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  v5 = v4;
  v6 = sub_19A637A5C();
  v7 = sub_19A637BB8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19A50D000, v6, v7, "starting to send SMS to carrier regarding spam call report.... Calling into CT", v8, 2u);
    MEMORY[0x19AEC987C](v8, -1, -1);
  }

  v9 = objc_msgSend((id)objc_opt_self(), sel_sharedMessageCenter);
  if (!v9)
  {
    __break(1u);
    return (char)v9;
  }
  v10 = v9;
  v11 = v5;
  v12 = (void *)sub_19A637AB0();
  v13 = (void *)sub_19A637AB0();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v10, sel_sendSMSWithText_text_serviceCenter_toAddress_, v11, v12, 0, v13);

LABEL_12:
  LOBYTE(v9) = v14;
  return (char)v9;
}

Swift::String_optional __swiftcall VoiceSpamReportTelephonyManager.carrierName(of:)(Swift::String_optional of)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  Swift::String_optional result;
  void *v8;
  void *v9;
  _BYTE v10[24];
  uint64_t v11;

  v2 = sub_19A628F2C(of.value._countAndFlagsBits, (unint64_t)of.value._object);
  if (!v2)
    goto LABEL_7;
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A6C60);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_19A65DF40;
  v5 = *(_QWORD *)(v1 + 32);
  *(_QWORD *)(v4 + 32) = *(_QWORD *)(v1 + 24);
  *(_QWORD *)(v4 + 40) = v5;
  swift_bridgeObjectRetain();
  sub_19A6294AC(v4, v3, (uint64_t)v10);
  swift_bridgeObjectRelease();

  if (!v11)
  {
    sub_19A6298A4((uint64_t)v10);
    goto LABEL_6;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_6:
    v2 = 0;
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v2 = v8;
  v6 = v9;
LABEL_8:
  result.value._object = v6;
  result.value._countAndFlagsBits = (uint64_t)v2;
  return result;
}

Swift::Bool __swiftcall VoiceSpamReportTelephonyManager.isSIMInHomeCountry(for:)(Swift::String_optional a1)
{
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v23;
  id v24[2];

  object = a1.value._object;
  countAndFlagsBits = a1.value._countAndFlagsBits;
  v24[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = sub_19A628F2C(a1.value._countAndFlagsBits, (unint64_t)a1.value._object);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = *(void **)(v1 + OBJC_IVAR____TtC18TelephonyUtilities31VoiceSpamReportTelephonyManager_ctClient);
  v24[0] = 0;
  v7 = objc_msgSend(v6, sel_copyRegistrationDisplayStatus_error_, v5, v24);
  if (!v7)
  {
    v11 = v24[0];
    v12 = (void *)sub_19A63787C();

    swift_willThrow();
    swift_bridgeObjectRetain();
    v13 = v12;
    swift_bridgeObjectRetain();
    v14 = v12;
    v15 = sub_19A637A5C();
    v16 = sub_19A637BAC();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = swift_slowAlloc();
      v23 = (void *)swift_slowAlloc();
      v24[0] = v23;
      *(_DWORD *)v17 = 136315394;
      if (object)
        v18 = countAndFlagsBits;
      else
        v18 = 0;
      if (object)
        v19 = (unint64_t)object;
      else
        v19 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      sub_19A61C7BC(v18, v19, (uint64_t *)v24);
      sub_19A637C24();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2080;
      swift_getErrorValue();
      v20 = sub_19A637D08();
      sub_19A61C7BC(v20, v21, (uint64_t *)v24);
      sub_19A637C24();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_19A50D000, v15, v16, "error while getting registration display status simUUIDString: %s, error: %s", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x19AEC987C](v23, -1, -1);
      MEMORY[0x19AEC987C](v17, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  v8 = v7;
  v9 = v24[0];
  v10 = objc_msgSend(v8, sel_isInHomeCountry);

  return v10;
}

Swift::Bool __swiftcall VoiceSpamReportTelephonyManager.carrierHasWiFiCallingEnabled(for:)(Swift::String_optional a1)
{
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v23;
  id v24[2];

  object = a1.value._object;
  countAndFlagsBits = a1.value._countAndFlagsBits;
  v24[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = sub_19A628F2C(a1.value._countAndFlagsBits, (unint64_t)a1.value._object);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = *(void **)(v1 + OBJC_IVAR____TtC18TelephonyUtilities31VoiceSpamReportTelephonyManager_ctClient);
  v24[0] = 0;
  v7 = objc_msgSend(v6, sel_getCallCapabilities_error_, v5, v24);
  if (!v7)
  {
    v11 = v24[0];
    v12 = (void *)sub_19A63787C();

    swift_willThrow();
    swift_bridgeObjectRetain();
    v13 = v12;
    swift_bridgeObjectRetain();
    v14 = v12;
    v15 = sub_19A637A5C();
    v16 = sub_19A637BAC();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = swift_slowAlloc();
      v23 = (void *)swift_slowAlloc();
      v24[0] = v23;
      *(_DWORD *)v17 = 136315394;
      if (object)
        v18 = countAndFlagsBits;
      else
        v18 = 0;
      if (object)
        v19 = (unint64_t)object;
      else
        v19 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      sub_19A61C7BC(v18, v19, (uint64_t *)v24);
      sub_19A637C24();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2080;
      swift_getErrorValue();
      v20 = sub_19A637D08();
      sub_19A61C7BC(v20, v21, (uint64_t *)v24);
      sub_19A637C24();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_19A50D000, v15, v16, "error while getting call capabilitie simUUIDString: %s, error: %s", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x19AEC987C](v23, -1, -1);
      MEMORY[0x19AEC987C](v17, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  v8 = v7;
  v9 = v24[0];
  v10 = objc_msgSend(v8, sel_isWifiCallingAvailable);

  return v10;
}

Swift::Bool __swiftcall VoiceSpamReportTelephonyManager.carrierIsInRoaming(for:)(Swift::String_optional a1)
{
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void *v30;
  id v31[2];

  object = a1.value._object;
  countAndFlagsBits = a1.value._countAndFlagsBits;
  v31[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = sub_19A628F2C(a1.value._countAndFlagsBits, (unint64_t)a1.value._object);
  if (!v4)
  {
LABEL_20:
    v17 = 0;
    goto LABEL_21;
  }
  v5 = v4;
  v6 = *(void **)(v1 + OBJC_IVAR____TtC18TelephonyUtilities31VoiceSpamReportTelephonyManager_ctClient);
  v31[0] = 0;
  v7 = objc_msgSend(v6, sel_copyRegistrationStatus_error_, v5, v31);
  v8 = v31[0];
  if (!v7)
  {
    v18 = v31[0];
    v19 = (void *)sub_19A63787C();

    swift_willThrow();
    swift_bridgeObjectRetain();
    v20 = v19;
    swift_bridgeObjectRetain();
    v21 = v19;
    v22 = sub_19A637A5C();
    v23 = sub_19A637BAC();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = swift_slowAlloc();
      v30 = (void *)swift_slowAlloc();
      v31[0] = v30;
      *(_DWORD *)v24 = 136315394;
      if (object)
        v25 = countAndFlagsBits;
      else
        v25 = 0;
      if (object)
        v26 = (unint64_t)object;
      else
        v26 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      sub_19A61C7BC(v25, v26, (uint64_t *)v31);
      sub_19A637C24();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2080;
      swift_getErrorValue();
      v27 = sub_19A637D08();
      sub_19A61C7BC(v27, v28, (uint64_t *)v31);
      sub_19A637C24();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_19A50D000, v22, v23, "error while getting ct registration status for simUUIDString: %s, error: %s", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x19AEC987C](v30, -1, -1);
      MEMORY[0x19AEC987C](v24, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    goto LABEL_20;
  }
  v9 = v7;
  v10 = sub_19A637ABC();
  v12 = v11;
  v13 = v8;

  v14 = *MEMORY[0x1E0CA77A0];
  if (!*MEMORY[0x1E0CA77A0])
  {
    __break(1u);
    return v14;
  }
  if (v10 == sub_19A637ABC() && v12 == v15)
    v17 = 1;
  else
    v17 = sub_19A637CF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

LABEL_21:
  LOBYTE(v14) = v17 & 1;
  return v14;
}

uint64_t sub_19A62A4AC(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v9 = MEMORY[0x1E0DEE9D8];
    sub_19A62A7A4(0, v1, 0);
    v2 = v9;
    v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_19A62A7A4(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_19A62A7A4(v5 > 1, v6 + 1, 1);
        v2 = v9;
      }
      v4 += 16;
      *(_QWORD *)(v2 + 16) = v6 + 1;
      sub_19A62A7C0(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t VoiceSpamReportTelephonyManager.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC18TelephonyUtilities31VoiceSpamReportTelephonyManager_logger;
  v2 = sub_19A637A74();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  return v0;
}

uint64_t VoiceSpamReportTelephonyManager.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC18TelephonyUtilities31VoiceSpamReportTelephonyManager_logger;
  v2 = sub_19A637A74();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_19A62A6A4(uint64_t a1, uint64_t a2)
{
  return VoiceSpamReportTelephonyManager.carrierVoiceCallSpamReportingAddress(for:)(*(Swift::String_optional *)&a1).value._countAndFlagsBits;
}

BOOL sub_19A62A6C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return VoiceSpamReportTelephonyManager.sendVoiceCallSpamReportToCarrier(with:for:)(*(Swift::String *)&a1, *(Swift::String_optional *)&a3);
}

uint64_t sub_19A62A6E8(uint64_t a1, uint64_t a2)
{
  return VoiceSpamReportTelephonyManager.carrierName(of:)(*(Swift::String_optional *)&a1).value._countAndFlagsBits;
}

BOOL sub_19A62A708(uint64_t a1, uint64_t a2)
{
  return VoiceSpamReportTelephonyManager.isSIMInHomeCountry(for:)(*(Swift::String_optional *)&a1);
}

BOOL sub_19A62A72C(uint64_t a1, uint64_t a2)
{
  return VoiceSpamReportTelephonyManager.carrierHasWiFiCallingEnabled(for:)(*(Swift::String_optional *)&a1);
}

BOOL sub_19A62A750(uint64_t a1, uint64_t a2)
{
  return VoiceSpamReportTelephonyManager.carrierIsInRoaming(for:)(*(Swift::String_optional *)&a1);
}

uint64_t sub_19A62A774()
{
  return type metadata accessor for VoiceSpamReportTelephonyManager();
}

uint64_t method lookup function for VoiceSpamReportTelephonyManager()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_19A62A788(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_19A62A7D0(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_19A62A7A4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_19A62A9B0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

_OWORD *sub_19A62A7C0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_19A62A7D0(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9C28);
  v10 = *(_QWORD *)(sub_19A637918() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_19A637918() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_19A637CC0();
  __break(1u);
  return result;
}

uint64_t sub_19A62A9B0(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9C18);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_19A637CC0();
  __break(1u);
  return result;
}

void sub_19A62AB1C()
{
  qword_1EE3A9C30 = 3289153;
  *(_QWORD *)algn_1EE3A9C38 = 0xE300000000000000;
}

void sub_19A62AB38()
{
  qword_1EE3A9C40 = 0x6C6C61436F56;
  *(_QWORD *)algn_1EE3A9C48 = 0xE600000000000000;
}

void sub_19A62AB58()
{
  qword_1EE3A9C50 = 116;
  *(_QWORD *)algn_1EE3A9C58 = 0xE100000000000000;
}

void sub_19A62AB70()
{
  qword_1EE3A9C60 = 114;
  *(_QWORD *)algn_1EE3A9C68 = 0xE100000000000000;
}

void sub_19A62AB88()
{
  qword_1EE3A9C70 = 118;
  *(_QWORD *)algn_1EE3A9C78 = 0xE100000000000000;
}

void sub_19A62ABA0()
{
  qword_1EE3A9C80 = 102;
  unk_1EE3A9C88 = 0xE100000000000000;
}

uint64_t CarrierVoiceSpamReportHelper.__allocating_init(voiceSpamReportTelephonyManager:featureFlags:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  CarrierVoiceSpamReportHelper.init(voiceSpamReportTelephonyManager:featureFlags:)(a1, a2);
  return v4;
}

uint64_t sub_19A62AC04(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  const char *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  _DWORD v26[4];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9C98);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!objc_msgSend(*(id *)(v2 + 16), sel_voiceCallSpamReportToCarrierEnabled))
  {
    v11 = sub_19A637A5C();
    v12 = sub_19A637BB8();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      v14 = "voiceCallSpamReportToCarrierEnabled is false, so we cannot report spam";
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  v7 = a1[3];
  v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v7, v8);
  v9 = sub_19A637984();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) == 1)
  {
    sub_19A6273CC((uint64_t)v6, &qword_1EE3A9C98);
    v11 = sub_19A637A5C();
    v12 = sub_19A637BAC();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      v14 = "simUUIDString is nil, so we cannot report spam";
LABEL_7:
      _os_log_impl(&dword_19A50D000, v11, v12, v14, v13, 2u);
      MEMORY[0x19AEC987C](v13, -1, -1);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v16 = sub_19A63796C();
  v18 = v17;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v6, v9);
  v19 = *(_QWORD *)(v2 + 48);
  v20 = *(_QWORD *)(v2 + 56);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + 24), v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 8))(v16, v18, v19, v20);
  v22 = v21;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v23 = sub_19A637A5C();
  v24 = sub_19A637BB8();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v25 = 67109120;
    v26[3] = v22 != 0;
    sub_19A637C24();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_19A50D000, v23, v24, "Carrier report spam calls: %{BOOL}d.", v25, 8u);
    MEMORY[0x19AEC987C](v25, -1, -1);

    if (!v22)
      return 0;
  }
  else
  {
    swift_bridgeObjectRelease();

    if (!v22)
      return 0;
  }
  swift_bridgeObjectRelease();
  return 1;
}

void sub_19A62AEF8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t *v11;
  id v12;
  void *v13;
  id v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  os_log_type_t v30;
  uint8_t *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  id v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  void *v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  NSObject *v79;
  os_log_type_t v80;
  uint8_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  id v88;
  char v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  NSObject *v93;
  id v94;
  uint64_t v95;
  char v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD *v103;
  NSObject *v104;
  uint64_t v105;
  __int128 v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9C98);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v99 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9CA0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v99 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(*(id *)(v1 + 16), sel_voiceCallSpamReportToCarrierEnabled))
  {
    v10 = sub_19A62BCD0(MEMORY[0x1E0DEE9D8]);
    v11 = (unint64_t *)(v2 + OBJC_IVAR____TtC18TelephonyUtilities28CarrierVoiceSpamReportHelper_metricsDictionary);
    swift_beginAccess();
    *v11 = v10;
    swift_bridgeObjectRelease();
    sub_19A62C1B0(a1);
    v12 = objc_allocWithZone(MEMORY[0x1E0CB3940]);
    v13 = (void *)sub_19A637AB0();
    swift_bridgeObjectRelease();
    v14 = objc_msgSend(v12, sel_initWithString_, v13);

    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v109 = *v11;
    *v11 = 0x8000000000000000;
    sub_19A62E778((uint64_t)v14, 0xD00000000000001ELL, 0x800000019A65D900, isUniquelyReferenced_nonNull_native);
    *v11 = v109;
    swift_bridgeObjectRelease();
    swift_endAccess();
    if ((sub_19A62CC5C(a1) & 1) != 0)
    {
      v16 = sub_19A62D130(a1);
      if (v17)
      {
        v18 = v16;
        v19 = v17;
        v103 = a1;
        v104 = v9;
        v20 = v2 + OBJC_IVAR____TtC18TelephonyUtilities28CarrierVoiceSpamReportHelper_logger;
        sub_19A62E8D4((uint64_t)a1, (uint64_t)&v106);
        swift_bridgeObjectRetain_n();
        v21 = sub_19A637A5C();
        v22 = sub_19A637BB8();
        v23 = os_log_type_enabled(v21, v22);
        v101 = v18;
        v102 = v20;
        if (v23)
        {
          v24 = swift_slowAlloc();
          v100 = swift_slowAlloc();
          v109 = v100;
          *(_DWORD *)v24 = 136315394;
          v99 = v24 + 4;
          v25 = v107;
          v26 = v108;
          __swift_project_boxed_opaque_existential_1(&v106, v107);
          v27 = sub_19A62BF08(v25, v26);
          v105 = sub_19A61C7BC(v27, v28, (uint64_t *)&v109);
          sub_19A637C24();
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v106);
          *(_WORD *)(v24 + 12) = 2080;
          swift_bridgeObjectRetain();
          v105 = sub_19A61C7BC(v18, v19, (uint64_t *)&v109);
          sub_19A637C24();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_19A50D000, v21, v22, "Starting to send report for spam call to carrier. Spam voice call - %s. spam voice call JSON metadata - %s", (uint8_t *)v24, 0x16u);
          v29 = v100;
          swift_arrayDestroy();
          MEMORY[0x19AEC987C](v29, -1, -1);
          MEMORY[0x19AEC987C](v24, -1, -1);

        }
        else
        {

          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v106);
          swift_bridgeObjectRelease_n();
        }
        v58 = v103;
        sub_19A62E8D4(v2 + 24, (uint64_t)&v106);
        v59 = v108;
        v99 = v107;
        v100 = (uint64_t)__swift_project_boxed_opaque_existential_1(&v106, v107);
        v60 = v58[3];
        v61 = v58[4];
        __swift_project_boxed_opaque_existential_1(v58, v60);
        (*(void (**)(uint64_t, uint64_t))(v61 + 16))(v60, v61);
        v62 = sub_19A637984();
        v63 = *(_QWORD *)(v62 - 8);
        v64 = v19;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v63 + 48))(v6, 1, v62) == 1)
        {
          sub_19A6273CC((uint64_t)v6, &qword_1EE3A9C98);
          v65 = 0;
          v66 = 0;
        }
        else
        {
          v65 = sub_19A63796C();
          v66 = v67;
          (*(void (**)(char *, uint64_t))(v63 + 8))(v6, v62);
        }
        v68 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v59 + 16))(v101, v64, v65, v66, v99, v59);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v106);
        if ((v68 & 1) != 0)
        {
          v69 = (uint64_t)v103;
          sub_19A62E8D4((uint64_t)v103, (uint64_t)&v106);
          v70 = sub_19A637A5C();
          v71 = sub_19A637BB8();
          if (os_log_type_enabled(v70, v71))
          {
            v72 = (uint8_t *)swift_slowAlloc();
            v73 = swift_slowAlloc();
            v109 = v73;
            *(_DWORD *)v72 = 136315138;
            v74 = v107;
            v75 = v108;
            __swift_project_boxed_opaque_existential_1(&v106, v107);
            v76 = v75;
            v69 = (uint64_t)v103;
            v77 = sub_19A62BF08(v74, v76);
            v105 = sub_19A61C7BC(v77, v78, (uint64_t *)&v109);
            sub_19A637C24();
            swift_bridgeObjectRelease();
            __swift_destroy_boxed_opaque_existential_0((uint64_t)&v106);
            _os_log_impl(&dword_19A50D000, v70, v71, "successfully report carrier call: %s", v72, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x19AEC987C](v73, -1, -1);
            MEMORY[0x19AEC987C](v72, -1, -1);

          }
          else
          {

            __swift_destroy_boxed_opaque_existential_0((uint64_t)&v106);
          }
          v93 = v104;
          v94 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, 3);
        }
        else
        {
          v69 = (uint64_t)v103;
          sub_19A62E8D4((uint64_t)v103, (uint64_t)&v106);
          v79 = sub_19A637A5C();
          v80 = sub_19A637BB8();
          if (os_log_type_enabled(v79, v80))
          {
            v81 = (uint8_t *)swift_slowAlloc();
            v82 = swift_slowAlloc();
            v109 = v82;
            *(_DWORD *)v81 = 136315138;
            v83 = v107;
            v84 = v108;
            __swift_project_boxed_opaque_existential_1(&v106, v107);
            v85 = v84;
            v69 = (uint64_t)v103;
            v86 = sub_19A62BF08(v83, v85);
            v105 = sub_19A61C7BC(v86, v87, (uint64_t *)&v109);
            sub_19A637C24();
            swift_bridgeObjectRelease();
            __swift_destroy_boxed_opaque_existential_0((uint64_t)&v106);
            _os_log_impl(&dword_19A50D000, v79, v80, "failed to report carrier call: %s", v81, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x19AEC987C](v82, -1, -1);
            MEMORY[0x19AEC987C](v81, -1, -1);

          }
          else
          {

            __swift_destroy_boxed_opaque_existential_0((uint64_t)&v106);
          }
          v93 = v104;
          v94 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, 2);
        }
        v95 = (uint64_t)v94;
        swift_beginAccess();
        v96 = swift_isUniquelyReferenced_nonNull_native();
        v109 = *v11;
        *v11 = 0x8000000000000000;
        sub_19A62E778(v95, 0xD000000000000023, 0x800000019A65D920, v96);
        *v11 = v109;
        swift_bridgeObjectRelease();
        swift_endAccess();
        v97 = *v11;
        v98 = sub_19A637B94();
        (*(void (**)(NSObject *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v98 - 8) + 56))(v93, 1, 1, v98);
        sub_19A62E8D4(v69, (uint64_t)&v106);
        v46 = (_QWORD *)swift_allocObject();
        v46[2] = 0;
        v46[3] = 0;
        v46[4] = v2;
        sub_19A62E91C(&v106, (uint64_t)(v46 + 5));
        v46[10] = v97;
        swift_retain();
        swift_bridgeObjectRetain();
        v47 = &unk_1EE3A9CC0;
        v92 = (uint64_t)v93;
        goto LABEL_32;
      }
      sub_19A62E8D4((uint64_t)a1, (uint64_t)&v106);
      v48 = sub_19A637A5C();
      v49 = sub_19A637BB8();
      if (os_log_type_enabled(v48, v49))
      {
        v50 = (uint8_t *)swift_slowAlloc();
        v51 = swift_slowAlloc();
        v109 = v51;
        *(_DWORD *)v50 = 136315138;
        v103 = (_QWORD *)v2;
        v104 = v9;
        v52 = a1;
        v53 = v107;
        v54 = v108;
        __swift_project_boxed_opaque_existential_1(&v106, v107);
        v55 = v54;
        a1 = v52;
        v56 = sub_19A62BF08(v53, v55);
        v105 = sub_19A61C7BC(v56, v57, (uint64_t *)&v109);
        v2 = (uint64_t)v103;
        v9 = (char *)v104;
        sub_19A637C24();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v106);
        _os_log_impl(&dword_19A50D000, v48, v49, "Could not create voice call spam report for call %s. Dropping voice call reporting", v50, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x19AEC987C](v51, -1, -1);
        MEMORY[0x19AEC987C](v50, -1, -1);

      }
      else
      {

        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v106);
      }
      v88 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, 2);
      swift_beginAccess();
      v89 = swift_isUniquelyReferenced_nonNull_native();
      v109 = *v11;
      *v11 = 0x8000000000000000;
      sub_19A62E778((uint64_t)v88, 0xD000000000000023, 0x800000019A65D920, v89);
      *v11 = v109;
      swift_bridgeObjectRelease();
      swift_endAccess();
      v90 = *v11;
      v91 = sub_19A637B94();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v91 - 8) + 56))(v9, 1, 1, v91);
      sub_19A62E8D4((uint64_t)a1, (uint64_t)&v106);
      v46 = (_QWORD *)swift_allocObject();
      v46[2] = 0;
      v46[3] = 0;
      v46[4] = v2;
      sub_19A62E91C(&v106, (uint64_t)(v46 + 5));
      v46[10] = v90;
      swift_retain();
      swift_bridgeObjectRetain();
      v47 = &unk_1EE3A9CB8;
    }
    else
    {
      sub_19A62E8D4((uint64_t)a1, (uint64_t)&v106);
      v32 = sub_19A637A5C();
      v33 = sub_19A637BB8();
      if (os_log_type_enabled(v32, v33))
      {
        v34 = (uint8_t *)swift_slowAlloc();
        v35 = swift_slowAlloc();
        v109 = v35;
        *(_DWORD *)v34 = 136315138;
        v103 = (_QWORD *)v2;
        v104 = v9;
        v36 = a1;
        v37 = v107;
        v38 = v108;
        __swift_project_boxed_opaque_existential_1(&v106, v107);
        v39 = v38;
        a1 = v36;
        v40 = sub_19A62BF08(v37, v39);
        v105 = sub_19A61C7BC(v40, v41, (uint64_t *)&v109);
        v2 = (uint64_t)v103;
        v9 = (char *)v104;
        sub_19A637C24();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v106);
        _os_log_impl(&dword_19A50D000, v32, v33, "Cellular service not suitable for reporting spam voice call - %s. Stopping voice call reporting", v34, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x19AEC987C](v35, -1, -1);
        MEMORY[0x19AEC987C](v34, -1, -1);

      }
      else
      {

        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v106);
      }
      v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, 2);
      swift_beginAccess();
      v43 = swift_isUniquelyReferenced_nonNull_native();
      v109 = *v11;
      *v11 = 0x8000000000000000;
      sub_19A62E778((uint64_t)v42, 0xD000000000000023, 0x800000019A65D920, v43);
      *v11 = v109;
      swift_bridgeObjectRelease();
      swift_endAccess();
      v44 = *v11;
      v45 = sub_19A637B94();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(v9, 1, 1, v45);
      sub_19A62E8D4((uint64_t)a1, (uint64_t)&v106);
      v46 = (_QWORD *)swift_allocObject();
      v46[2] = 0;
      v46[3] = 0;
      v46[4] = v2;
      sub_19A62E91C(&v106, (uint64_t)(v46 + 5));
      v46[10] = v44;
      swift_bridgeObjectRetain();
      swift_retain();
      v47 = &unk_1EE3A9CB0;
    }
    v92 = (uint64_t)v9;
LABEL_32:
    sub_19A62DF04(v92, (uint64_t)v47, (uint64_t)v46);
    swift_release();
    *v11 = sub_19A62BCD0(MEMORY[0x1E0DEE9D8]);
    swift_bridgeObjectRelease();
    return;
  }
  v104 = sub_19A637A5C();
  v30 = sub_19A637BB8();
  if (os_log_type_enabled(v104, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v31 = 0;
    _os_log_impl(&dword_19A50D000, v104, v30, "voiceCallSpamReportToCarrierEnabled is false, so we cannot report spam", v31, 2u);
    MEMORY[0x19AEC987C](v31, -1, -1);
  }

}

unint64_t sub_19A62BCD0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3A9DC0);
  v2 = (_QWORD *)sub_19A637CB4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_19A62E408(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_19A62BDE8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9DA0);
  v2 = (_QWORD *)sub_19A637CB4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_19A62E408(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_19A62BF08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[2];
  uint64_t v16;
  unint64_t v17;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9C98);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9CE0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = 0;
  v17 = 0xE000000000000000;
  sub_19A637C3C();
  sub_19A637AF8();
  (*(void (**)(uint64_t, uint64_t))(a2 + 8))(a1, a2);
  v10 = sub_19A637960();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_19A6273CC((uint64_t)v9, &qword_1EE3A9CE0);
  }
  else
  {
    sub_19A637948();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
  }
  sub_19A637AF8();
  swift_bridgeObjectRelease();
  sub_19A637AF8();
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  v12 = sub_19A637984();
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v6, 1, v12) == 1)
  {
    sub_19A6273CC((uint64_t)v6, &qword_1EE3A9C98);
  }
  else
  {
    sub_19A63796C();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v6, v12);
  }
  sub_19A637AF8();
  swift_bridgeObjectRelease();
  sub_19A637AF8();
  v15[1] = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 24))(a1, a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9DA8);
  sub_19A637AC8();
  sub_19A637AF8();
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_19A62C1B0(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9C98);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (void *)objc_opt_self();
  v8 = objc_msgSend(v7, sel_mainBundle);
  v9 = sub_19A637870();

  v10 = a1[3];
  v11 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v10);
  (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v10, v11);
  v12 = sub_19A637984();
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v6, 1, v12) == 1)
  {
    sub_19A6273CC((uint64_t)v6, &qword_1EE3A9C98);
    v14 = sub_19A637A5C();
    v15 = sub_19A637BAC();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_19A50D000, v14, v15, "simUUID String is nil", v16, 2u);
      MEMORY[0x19AEC987C](v16, -1, -1);
    }
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  v17 = sub_19A63796C();
  v19 = v18;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v6, v12);
  v20 = v2 + 3;
  v21 = v2[6];
  v22 = v2[7];
  __swift_project_boxed_opaque_existential_1(v20, v21);
  v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 24))(v17, v19, v21, v22);
  v24 = v23;
  swift_bridgeObjectRelease();
  if (!v24)
  {
    v14 = objc_msgSend(v7, sel_mainBundle);
    v9 = sub_19A637870();
LABEL_6:

  }
  return v9;
}

uint64_t sub_19A62C468(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  id v10;
  char isUniquelyReferenced_nonNull_native;
  id v12;
  void *v13;
  id v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  __int128 v21[2];
  unint64_t v22;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9CA0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x1E0DEE9D8];
  v8 = sub_19A62BCD0(MEMORY[0x1E0DEE9D8]);
  v9 = (unint64_t *)(v2 + OBJC_IVAR____TtC18TelephonyUtilities28CarrierVoiceSpamReportHelper_metricsDictionary);
  swift_beginAccess();
  *v9 = v8;
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, 1);
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v22 = *v9;
  *v9 = 0x8000000000000000;
  sub_19A62E778((uint64_t)v10, 0xD000000000000023, 0x800000019A65D920, isUniquelyReferenced_nonNull_native);
  *v9 = v22;
  swift_bridgeObjectRelease();
  swift_endAccess();
  sub_19A62C1B0(a1);
  v12 = objc_allocWithZone(MEMORY[0x1E0CB3940]);
  v13 = (void *)sub_19A637AB0();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v12, sel_initWithString_, v13);

  swift_beginAccess();
  v15 = swift_isUniquelyReferenced_nonNull_native();
  v22 = *v9;
  *v9 = 0x8000000000000000;
  sub_19A62E778((uint64_t)v14, 0xD00000000000001ELL, 0x800000019A65D900, v15);
  *v9 = v22;
  swift_bridgeObjectRelease();
  swift_endAccess();
  v16 = *v9;
  v17 = sub_19A637B94();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v6, 1, 1, v17);
  sub_19A62E8D4((uint64_t)a1, (uint64_t)v21);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = v2;
  sub_19A62E91C(v21, (uint64_t)(v18 + 5));
  v18[10] = v16;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_19A62DF04((uint64_t)v6, (uint64_t)&unk_1EE3A9CC8, (uint64_t)v18);
  swift_release();
  *v9 = sub_19A62BCD0(v7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_19A62C71C(_QWORD *a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t result;
  unint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  int64_t v38;
  unint64_t v39;
  int64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  id v45;
  void *v46;
  id v47[2];

  v4 = v1;
  v47[1] = *(id *)MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v19 = sub_19A637A5C();
    v20 = sub_19A637BB8();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = 2;
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_19A50D000, v19, v20, "remoteParticipantHandles is nil so the type is NoCallerID", v22, 2u);
      MEMORY[0x19AEC987C](v22, -1, -1);

    }
    else
    {

      return 2;
    }
    return v21;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9CE8);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_19A65E130;
  v7 = (void *)*MEMORY[0x1E0C966E8];
  v8 = (void *)*MEMORY[0x1E0C967C0];
  *(_QWORD *)(v6 + 32) = *MEMORY[0x1E0C966E8];
  *(_QWORD *)(v6 + 40) = v8;
  v9 = (void *)*MEMORY[0x1E0C966A8];
  *(_QWORD *)(v6 + 48) = *MEMORY[0x1E0C966A8];
  v10 = (void *)objc_opt_self();
  v11 = v7;
  v12 = v8;
  v13 = v9;
  result = (uint64_t)objc_msgSend(v10, sel_descriptorForUsedKeys);
  if (result)
  {
    *(_QWORD *)(v6 + 56) = result;
    v47[0] = (id)v6;
    sub_19A637B58();
    v15 = a1[2];
    if (v15 > 1)
    {
      swift_bridgeObjectRelease();
      v16 = sub_19A637A5C();
      v17 = sub_19A637BAC();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_19A50D000, v16, v17, "Number of handles > 1 which is not expected from telephony call.", v18, 2u);
        MEMORY[0x19AEC987C](v18, -1, -1);
      }

      return 1;
    }
    v23 = *(id *)(v4 + OBJC_IVAR____TtC18TelephonyUtilities28CarrierVoiceSpamReportHelper_contactStore);
    if (v15)
    {
      swift_bridgeObjectRetain();
      v24 = sub_19A62E2FC(0, 1, 1, MEMORY[0x1E0DEE9D8]);
      v26 = a1[4];
      v25 = a1[5];
      v2 = v24[2];
      v3 = v24[3];
      v27 = v2 + 1;
      swift_bridgeObjectRetain();
      if (v2 >= v3 >> 1)
        goto LABEL_46;
      goto LABEL_11;
    }
LABEL_13:
    v29 = (void *)sub_19A637B28();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9D50);
    v30 = (void *)sub_19A637B28();
    swift_bridgeObjectRelease();
    v47[0] = 0;
    v31 = objc_msgSend(v23, sel_contactsByContactHandleForContactHandles_keyDescriptors_error_, v29, v30, v47);

    v32 = v47[0];
    if (!v31)
    {
      v45 = v47[0];
      v46 = (void *)sub_19A63787C();

      swift_willThrow();
      return 1;
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3A9D58);
    v23 = (_QWORD *)sub_19A637A8C();
    v33 = v32;

    v24 = v23 + 8;
    v34 = 1 << *((_BYTE *)v23 + 32);
    v35 = -1;
    if (v34 < 64)
      v35 = ~(-1 << v34);
    v26 = v35 & v23[8];
    v25 = (unint64_t)(v34 + 63) >> 6;
    swift_bridgeObjectRetain();
    v27 = 0;
    while (1)
    {
      while (v26)
      {
        v36 = __clz(__rbit64(v26));
        v26 &= v26 - 1;
        v37 = v36 | (v27 << 6);
        if (v23[2])
          goto LABEL_38;
      }
      v38 = v27 + 1;
      if (__OFADD__(v27, 1))
      {
        __break(1u);
LABEL_46:
        v24 = sub_19A62E2FC((_QWORD *)(v3 > 1), v27, 1, v24);
LABEL_11:
        v24[2] = v27;
        v28 = &v24[2 * v2];
        v28[4] = v26;
        v28[5] = v25;
        swift_bridgeObjectRelease();
        goto LABEL_13;
      }
      if (v38 >= v25)
        goto LABEL_42;
      v39 = v24[v38];
      ++v27;
      if (!v39)
      {
        v27 = v38 + 1;
        if (v38 + 1 >= v25)
          goto LABEL_42;
        v39 = v24[v27];
        if (!v39)
        {
          v27 = v38 + 2;
          if (v38 + 2 >= v25)
            goto LABEL_42;
          v39 = v24[v27];
          if (!v39)
          {
            v27 = v38 + 3;
            if (v38 + 3 >= v25)
              goto LABEL_42;
            v39 = v24[v27];
            if (!v39)
            {
              v27 = v38 + 4;
              if (v38 + 4 >= v25)
                goto LABEL_42;
              v39 = v24[v27];
              if (!v39)
              {
                v40 = v38 + 5;
                if (v40 >= v25)
                  goto LABEL_42;
                v39 = v24[v40];
                if (!v39)
                {
                  while (1)
                  {
                    v27 = v40 + 1;
                    if (__OFADD__(v40, 1))
                      __break(1u);
                    if (v27 >= v25)
                      break;
                    v39 = v24[v27];
                    ++v40;
                    if (v39)
                      goto LABEL_37;
                  }
LABEL_42:
                  swift_release();
                  swift_bridgeObjectRelease();
                  return 1;
                }
                v27 = v40;
              }
            }
          }
        }
      }
LABEL_37:
      v26 = (v39 - 1) & v39;
      v37 = __clz(__rbit64(v39)) + (v27 << 6);
      if (v23[2])
      {
LABEL_38:
        v41 = (uint64_t *)(v23[6] + 16 * v37);
        v43 = *v41;
        v42 = v41[1];
        swift_bridgeObjectRetain();
        sub_19A62E408(v43, v42);
        if ((v44 & 1) != 0)
        {
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
        swift_bridgeObjectRelease();
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_19A62CC5C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  char isUniquelyReferenced_nonNull_native;
  NSObject *v44;
  os_log_type_t v45;
  uint64_t v46;
  _QWORD *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t (*v52)(char *, uint64_t, uint64_t);
  _QWORD *v53;
  void (*v54)(uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[3];
  uint64_t v58;
  uint64_t v59;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9C98);
  v4 = MEMORY[0x1E0C80A78](v3);
  v50 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v48 - v7;
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v48 - v9;
  v51 = v1;
  v55 = v1 + 24;
  sub_19A62E8D4(v1 + 24, (uint64_t)v57);
  v12 = v58;
  v11 = v59;
  v48 = __swift_project_boxed_opaque_existential_1(v57, v58);
  v13 = a1[3];
  v14 = a1[4];
  v15 = __swift_project_boxed_opaque_existential_1(a1, v13);
  v16 = *(void (**)(uint64_t, uint64_t))(v14 + 16);
  v53 = v15;
  v54 = v16;
  v16(v13, v14);
  v17 = sub_19A637984();
  v18 = *(_QWORD *)(v17 - 8);
  v52 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  v19 = v52(v10, 1, v17);
  v49 = v18;
  if (v19 == 1)
  {
    sub_19A6273CC((uint64_t)v10, &qword_1EE3A9C98);
    v20 = 0;
    v21 = 0;
  }
  else
  {
    v20 = sub_19A63796C();
    v21 = v22;
    (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v17);
  }
  v23 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 40))(v20, v21, v12, v11);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v57);
  sub_19A62E8D4(v55, (uint64_t)v57);
  v24 = v58;
  v25 = v59;
  __swift_project_boxed_opaque_existential_1(v57, v58);
  v54(v13, v14);
  if (v52(v8, 1, v17) == 1)
  {
    sub_19A6273CC((uint64_t)v8, &qword_1EE3A9C98);
    v26 = 0;
    v27 = 0;
  }
  else
  {
    v26 = sub_19A63796C();
    v27 = v28;
    (*(void (**)(char *, uint64_t))(v49 + 8))(v8, v17);
  }
  v29 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 32))(v26, v27, v24, v25);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v57);
  sub_19A62E8D4(v55, (uint64_t)v57);
  v30 = v58;
  v31 = v59;
  __swift_project_boxed_opaque_existential_1(v57, v58);
  v32 = (uint64_t)v50;
  v54(v13, v14);
  if (v52((char *)v32, 1, v17) == 1)
  {
    sub_19A6273CC(v32, &qword_1EE3A9C98);
    v33 = 0;
    v34 = 0;
  }
  else
  {
    v33 = sub_19A63796C();
    v34 = v35;
    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v32, v17);
  }
  v36 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 48))(v33, v34, v30, v31);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v57);
  v37 = objc_allocWithZone(MEMORY[0x1E0CB37E8]);
  if ((v23 & 1) != 0)
  {
    v38 = objc_msgSend(v37, sel_initWithInteger_, 1);
    v39 = OBJC_IVAR____TtC18TelephonyUtilities28CarrierVoiceSpamReportHelper_metricsDictionary;
    v40 = v51;
  }
  else
  {
    v40 = v51;
    if ((v29 & 1) != 0)
    {
      v41 = 2;
    }
    else if ((v36 & 1) != 0)
    {
      v41 = 3;
    }
    else
    {
      v41 = 4;
    }
    v38 = objc_msgSend(v37, sel_initWithInteger_, v41);
    v39 = OBJC_IVAR____TtC18TelephonyUtilities28CarrierVoiceSpamReportHelper_metricsDictionary;
  }
  v42 = (uint64_t *)(v40 + v39);
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v56 = *v42;
  *v42 = 0x8000000000000000;
  sub_19A62E778((uint64_t)v38, 0xD000000000000029, 0x800000019A65DB50, isUniquelyReferenced_nonNull_native);
  *v42 = v56;
  swift_bridgeObjectRelease();
  swift_endAccess();
  v44 = sub_19A637A5C();
  v45 = sub_19A637BB8();
  if (os_log_type_enabled(v44, v45))
  {
    v46 = swift_slowAlloc();
    *(_DWORD *)v46 = 67109376;
    LODWORD(v57[0]) = v23 & 1;
    sub_19A637C24();
    *(_WORD *)(v46 + 8) = 1024;
    LODWORD(v57[0]) = v29 & 1;
    sub_19A637C24();
    _os_log_impl(&dword_19A50D000, v44, v45, "Carrier has WiFi calling enabled - %{BOOL}d. SIM in home country - %{BOOL}d.", (uint8_t *)v46, 0xEu);
    MEMORY[0x19AEC987C](v46, -1, -1);
  }

  return (v23 | v29) & 1;
}

uint64_t sub_19A62D130(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t inited;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t *boxed_opaque_existential_0;
  id v48;
  id v49;
  NSObject *v50;
  os_log_type_t v51;
  uint64_t v52;
  _QWORD *v53;
  void *v54;
  id v55;
  uint64_t v57;
  uint64_t v58;
  os_log_type_t type;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v2 = a1[3];
  v3 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v2);
  v4 = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3);
  if (v4)
  {
    if (v4[2])
    {
      v6 = v4[4];
      v5 = v4[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    swift_bridgeObjectRelease();
  }
  v6 = 0;
  v5 = 0;
LABEL_6:
  v7 = sub_19A62DC20(a1);
  v9 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9D68);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19A65E140;
  if (qword_1EE3A9880 != -1)
    swift_once();
  v11 = *(_QWORD *)algn_1EE3A9C58;
  *(_QWORD *)(inited + 32) = qword_1EE3A9C50;
  *(_QWORD *)(inited + 40) = v11;
  *(_QWORD *)(inited + 48) = v7;
  *(_QWORD *)(inited + 56) = v9;
  v12 = qword_1EE3A9890;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12 != -1)
    swift_once();
  v13 = *(_QWORD *)algn_1EE3A9C78;
  *(_QWORD *)(inited + 64) = qword_1EE3A9C70;
  *(_QWORD *)(inited + 72) = v13;
  v14 = qword_1EE3A9870;
  swift_bridgeObjectRetain();
  if (v14 != -1)
    swift_once();
  v15 = *(_QWORD *)algn_1EE3A9C38;
  *(_QWORD *)(inited + 80) = qword_1EE3A9C30;
  *(_QWORD *)(inited + 88) = v15;
  v16 = qword_1EE3A9888;
  swift_bridgeObjectRetain();
  if (v16 != -1)
    swift_once();
  v17 = *(_QWORD *)algn_1EE3A9C68;
  *(_QWORD *)(inited + 96) = qword_1EE3A9C60;
  *(_QWORD *)(inited + 104) = v17;
  v18 = qword_1EE3A9878;
  swift_bridgeObjectRetain();
  if (v18 != -1)
    swift_once();
  v19 = *(_QWORD *)algn_1EE3A9C48;
  *(_QWORD *)(inited + 112) = qword_1EE3A9C40;
  *(_QWORD *)(inited + 120) = v19;
  v20 = qword_1EE3A9898;
  swift_bridgeObjectRetain();
  if (v20 != -1)
    swift_once();
  v21 = unk_1EE3A9C88;
  *(_QWORD *)(inited + 128) = qword_1EE3A9C80;
  *(_QWORD *)(inited + 136) = v21;
  *(_QWORD *)(inited + 144) = v6;
  *(_QWORD *)(inited + 152) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_19A62BDE8(inited);
  v22 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3A9D70);
  v23 = (void *)sub_19A637A80();
  swift_bridgeObjectRelease();
  v64 = 0;
  v24 = objc_msgSend(v22, sel_dataWithJSONObject_options_error_, v23, 0, &v64);

  v25 = v64;
  if (v24)
  {
    v26 = sub_19A637930();
    v28 = v27;

    sub_19A62E8D4((uint64_t)a1, (uint64_t)&v64);
    v29 = v28 >> 62;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_19A62F24C(v26, v28);
    v30 = sub_19A637A5C();
    v31 = sub_19A637BB8();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = swift_slowAlloc();
      v60 = swift_slowAlloc();
      *(_QWORD *)&v62 = v60;
      *(_DWORD *)v32 = 136316162;
      v57 = v6;
      v58 = v7;
      type = v31;
      v33 = v65;
      v34 = v66;
      __swift_project_boxed_opaque_existential_1(&v64, v65);
      v35 = sub_19A62BF08(v33, v34);
      v63 = sub_19A61C7BC(v35, v36, (uint64_t *)&v62);
      sub_19A637C24();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v64);
      *(_WORD *)(v32 + 12) = 2080;
      v38 = qword_1EE3A9C30;
      v37 = *(_QWORD *)algn_1EE3A9C38;
      swift_bridgeObjectRetain();
      v63 = sub_19A61C7BC(v38, v37, (uint64_t *)&v62);
      sub_19A637C24();
      swift_bridgeObjectRelease();
      *(_WORD *)(v32 + 22) = 2080;
      v39 = qword_1EE3A9C40;
      v40 = *(_QWORD *)algn_1EE3A9C48;
      swift_bridgeObjectRetain();
      v63 = sub_19A61C7BC(v39, v40, (uint64_t *)&v62);
      sub_19A637C24();
      swift_bridgeObjectRelease();
      *(_WORD *)(v32 + 32) = 2080;
      if (v5)
        v41 = v57;
      else
        v41 = 0;
      if (v5)
        v42 = v5;
      else
        v42 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      v63 = sub_19A61C7BC(v41, v42, (uint64_t *)&v62);
      sub_19A637C24();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v32 + 42) = 2080;
      swift_bridgeObjectRetain();
      v63 = sub_19A61C7BC(v58, v9, (uint64_t *)&v62);
      sub_19A637C24();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19A50D000, v30, type, "Creating JSON metadata for reporting voice call: %s with following components: \n\nreport  version - %s; \n"
        "\n"
        "report type - %s; \n"
        "\n"
        "spam caller handle - %s; \n"
        "\n"
        "spam call timestamp - %s",
        (uint8_t *)v32,
        0x34u);
      swift_arrayDestroy();
      MEMORY[0x19AEC987C](v60, -1, -1);
      v43 = v32;
      v29 = v28 >> 62;
      MEMORY[0x19AEC987C](v43, -1, -1);

    }
    else
    {

      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v64);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
    }
    __asm { BR              X10 }
  }
  v44 = v25;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v45 = (void *)sub_19A63787C();

  swift_willThrow();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9C18);
  v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = xmmword_19A65DF40;
  swift_getErrorValue();
  *(_QWORD *)(v46 + 56) = v61;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v46 + 32));
  (*(void (**)(uint64_t *))(*(_QWORD *)(v61 - 8) + 16))(boxed_opaque_existential_0);
  sub_19A637D44();
  swift_bridgeObjectRelease();
  v48 = v45;
  v49 = v45;
  v50 = sub_19A637A5C();
  v51 = sub_19A637BAC();
  if (os_log_type_enabled(v50, v51))
  {
    v52 = swift_slowAlloc();
    v53 = (_QWORD *)swift_slowAlloc();
    v54 = (void *)swift_slowAlloc();
    v64 = v54;
    *(_DWORD *)v52 = 136315394;
    sub_19A61C7BC(0xD00000000000001ALL, 0x800000019A65DB00, (uint64_t *)&v64);
    sub_19A637C24();
    *(_WORD *)(v52 + 12) = 2112;
    v55 = v45;
    *(_QWORD *)&v62 = _swift_stdlib_bridgeErrorToNSError();
    sub_19A637C24();
    *v53 = v62;

    _os_log_impl(&dword_19A50D000, v50, v51, "Unable to report carrier spam in %s because %@", (uint8_t *)v52, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9D80);
    swift_arrayDestroy();
    MEMORY[0x19AEC987C](v53, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x19AEC987C](v54, -1, -1);
    MEMORY[0x19AEC987C](v52, -1, -1);

  }
  else
  {

  }
  return 0;
}

uint64_t sub_19A62DC20(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v26;
  uint64_t v27;

  v2 = sub_19A637A14();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A9CE0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_19A637960();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1[3];
  v14 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v13);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_19A6273CC((uint64_t)v8, &qword_1EE3A9CE0);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    v16 = OBJC_IVAR____TtC18TelephonyUtilities28CarrierVoiceSpamReportHelper_dateFormatter;
    v17 = v27;
    v18 = *(id *)(v27 + OBJC_IVAR____TtC18TelephonyUtilities28CarrierVoiceSpamReportHelper_dateFormatter);
    sub_19A637A08();
    v19 = (void *)sub_19A6379FC();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    objc_msgSend(v18, sel_setTimeZone_, v19);

    v20 = *(id *)(v17 + v16);
    v21 = (void *)sub_19A637AB0();
    objc_msgSend(v20, sel_setDateFormat_, v21);

    v22 = *(id *)(v17 + v16);
    v23 = (void *)sub_19A637954();
    v24 = objc_msgSend(v22, sel_stringFromDate_, v23);

    v15 = sub_19A637ABC();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  return v15;
}

uint64_t sub_19A62DE90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v10;

  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v10;
  *v10 = v6;
  v10[1] = sub_19A62F368;
  v10[3] = a6;
  v10[4] = a4;
  v10[2] = a5;
  return swift_task_switch();
}

uint64_t sub_19A62DF04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_19A637B94();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_19A637B88();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_19A6273CC(a1, &qword_1EE3A9CA0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_19A637B7C();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_19A62E050(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_19A62E06C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  _QWORD *v6;
  char v7;
  id v8;
  char isUniquelyReferenced_nonNull_native;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD **)(v0 + 16);
  v3 = v2[3];
  v4 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v3);
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 24);
  swift_bridgeObjectRetain();
  v6 = (_QWORD *)v5(v3, v4);
  v7 = sub_19A62C71C(v6);
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, (v7 + 1));
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_19A62E778((uint64_t)v8, 0xD000000000000025, 0x800000019A65DA40, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  sub_19A61C41C(0xD00000000000002CLL, 0x800000019A65DA70, v1);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t CarrierVoiceSpamReportHelper.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 24);
  v1 = v0 + OBJC_IVAR____TtC18TelephonyUtilities28CarrierVoiceSpamReportHelper_logger;
  v2 = sub_19A637A74();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();

  swift_release();
  return v0;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_19A62E24C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_19A62E2B0;
  return v6(a1);
}

uint64_t sub_19A62E2B0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

_QWORD *sub_19A62E2FC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A6C60);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_19A62F120(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_19A62E408(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_19A637D50();
  sub_19A637AEC();
  v4 = sub_19A637D5C();
  return sub_19A62EB50(a1, a2, v4);
}

uint64_t sub_19A62E46C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3A9DC0);
  v38 = a2;
  v6 = sub_19A637CA8();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_19A637D50();
    sub_19A637AEC();
    result = sub_19A637D5C();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

void sub_19A62E778(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v10 = *v4;
  v12 = sub_19A62E408(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_19A62EC30();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];

      *(_QWORD *)(v19 + 8 * v12) = a1;
      return;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v23 = v18[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  sub_19A62E46C(v15, a4 & 1);
  v20 = sub_19A62E408(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_19A637CFC();
  __break(1u);
}

uint64_t sub_19A62E8D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_19A62E91C(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_19A62E934()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = v0 + 40;
  v4 = *(_QWORD *)(v0 + 80);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_19A62F368;
  v6 = (_QWORD *)swift_task_alloc();
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_19A62F368;
  v6[3] = v4;
  v6[4] = v2;
  v6[2] = v3;
  return swift_task_switch();
}

uint64_t sub_19A62E9D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = v0 + 40;
  v4 = *(_QWORD *)(v0 + 80);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_19A62EA64;
  v6 = (_QWORD *)swift_task_alloc();
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_19A62F368;
  v6[3] = v4;
  v6[4] = v2;
  v6[2] = v3;
  return swift_task_switch();
}

uint64_t sub_19A62EA64()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 40);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19A62EAEC()
{
  return type metadata accessor for CarrierVoiceSpamReportHelper();
}

uint64_t method lookup function for CarrierVoiceSpamReportHelper()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CarrierVoiceSpamReportHelper.__allocating_init(voiceSpamReportTelephonyManager:featureFlags:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of CarrierVoiceSpamReportHelper.carrierAllowsReportVoiceCall(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of CarrierVoiceSpamReportHelper.reportSpam(voiceCall:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of CarrierVoiceSpamReportHelper.reportSpamAlertControllerCarrierName(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of CarrierVoiceSpamReportHelper.logEventForCancelledScenario(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of CarrierSpamModelable.callDate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of CarrierSpamModelable.simUUID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of CarrierSpamModelable.formattedRemoteParticipantHandles.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

unint64_t sub_19A62EB50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_19A637CF0() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_19A637CF0() & 1) == 0);
    }
  }
  return v6;
}

id sub_19A62EC30()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3A9DC0);
  v2 = *v0;
  v3 = sub_19A637C9C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_19A62EDE0(uint64_t a1, unint64_t a2)
{
  uint64_t v4;

  sub_19A62F24C(a1, a2);
  sub_19A62EF84(a1, a2);
  sub_19A62F290(a1, a2);
  v4 = sub_19A637AE0();
  swift_release();
  return v4;
}

uint64_t sub_19A62EE54@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_19A637AE0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

_QWORD *sub_19A62EE8C(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a1)
    v4 = a2 - a1;
  else
    v4 = 0;
  result = a3(&v6, a1, v4);
  if (!v3)
    return (_QWORD *)v6;
  return result;
}

uint64_t sub_19A62EED8(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *(*a4)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t result;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  result = sub_19A63784C();
  v9 = result;
  if (result)
  {
    result = sub_19A637864();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v9 += a1 - result;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
    __break(1u);
    goto LABEL_15;
  }
  v12 = sub_19A637858();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  v14 = v9 + v13;
  if (v9)
    v15 = v14;
  else
    v15 = 0;
  result = (uint64_t)sub_19A62EE8C(v9, v15, a4);
  if (v4)
    return v16;
  return result;
}

void sub_19A62EF84(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = sub_19A63793C();
  MEMORY[0x1E0C80A78](v3);
  __asm { BR              X10 }
}

_QWORD *sub_19A62F000()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  size_t v6;
  uint64_t v7;

  if (BYTE6(v0))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3A6BC8);
    v4 = (_QWORD *)swift_allocObject();
    v6 = _swift_stdlib_malloc_size(v4);
    v4[2] = BYTE6(v0);
    v4[3] = 2 * v6 - 64;
    sub_19A62F24C(v2, v0);
    v7 = sub_19A637924();
    sub_19A62F290(v2, v0);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v1);
    if (v7 != BYTE6(v0))
    {
      __break(1u);
      JUMPOUT(0x19A62F0D4);
    }
  }
  return v4;
}

uint64_t sub_19A62F0EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_19A637AE0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_19A62F120(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_19A637CC0();
  __break(1u);
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_19A62F24C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_19A62F290(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t sub_19A62F2D4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_19A62F2F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_19A62EA64;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EE3A9DB0 + dword_1EE3A9DB0))(a1, v4);
}

void __swiftcall LiveLookupManagerProxy.init()(LiveLookupManagerProxy *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id LiveLookupManagerProxy.init()()
{
  char *v0;
  uint64_t v1;
  char *v2;
  objc_super v4;

  v1 = OBJC_IVAR___LiveLookupManagerProxy_manager;
  sub_19A637A50();
  v2 = v0;
  *(_QWORD *)&v0[v1] = sub_19A637A44();

  v4.receiver = v2;
  v4.super_class = (Class)LiveLookupManagerProxy;
  return objc_msgSendSuper2(&v4, sel_init);
}

unint64_t type metadata accessor for LiveLookupManagerProxy()
{
  unint64_t result;

  result = qword_1EE3A9DD8;
  if (!qword_1EE3A9DD8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EE3A9DD8);
  }
  return result;
}

void __getSWHighlightCenterClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSWHighlightCenterClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TUCollaborationHighlightProvider.m"), 20, CFSTR("Unable to find class %s"), "SWHighlightCenter");

  __break(1u);
}

void SharedWithYouLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SharedWithYouLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TUCollaborationHighlightProvider.m"), 19, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSWCollaborationHighlightClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSWCollaborationHighlightClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TUCollaborationHighlightProvider.m"), 21, CFSTR("Unable to find class %s"), "SWCollaborationHighlight");

  __break(1u);
}

void __getPNRPhoneNumberResolverClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PhoneNumberResolverLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TUGeoLocationMetadataCacheDataProvider.m"), 19, CFSTR("%s"), *a1);

  __break(1u);
}

void __getPNRPhoneNumberResolverClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPNRPhoneNumberResolverClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TUGeoLocationMetadataCacheDataProvider.m"), 20, CFSTR("Unable to find class %s"), "PNRPhoneNumberResolver");

  __break(1u);
}

void TUISOCountryCodeForMCC_cold_1(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_19A50D000, log, OS_LOG_TYPE_ERROR, "Error getting ISO country code (domain=%d, code=%d)", (uint8_t *)v3, 0xEu);
}

void __getCHRecentCallClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CallHistoryLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TUCallHistoryController.m"), 28, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCHRecentCallClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCHRecentCallClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TUCallHistoryController.m"), 29, CFSTR("Unable to find class %s"), "CHRecentCall");

  __break(1u);
}

void __getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *IMCoreLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TUConversation.m"), 41, CFSTR("%s"), *a1);

  __break(1u);
}

void getAVSystemController_PickableRoutesDidChangeNotification_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_PickableRoutesDidChangeNotification(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioSystemController.m"), 38, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

void getAVSystemController_SystemVolumeDidChangeNotification_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_SystemVolumeDidChangeNotification(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioSystemController.m"), 44, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

void getAVSystemController_UplinkMuteDidChangeNotification_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_UplinkMuteDidChangeNotification(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioSystemController.m"), 46, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

void getAVSystemController_UplinkMuteAttribute_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_UplinkMuteAttribute(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioSystemController.m"), 45, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

void getAVSystemController_DownlinkMuteAttribute_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_DownlinkMuteAttribute(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioSystemController.m"), 35, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

void getAVSystemController_PickedRouteAttribute_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_PickedRouteAttribute(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioSystemController.m"), 37, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

void getAVSystemController_PickableRoutesAttribute_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_PickableRoutesAttribute(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioSystemController.m"), 36, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

void __getAVSystemControllerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVSystemControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TUAudioSystemController.m"), 34, CFSTR("Unable to find class %s"), "AVSystemController");

  __break(1u);
}

void MediaExperienceLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MediaExperienceLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TUAudioSystemController.m"), 33, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAVAudioSessionCategoryPhoneCallSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AudioSessionLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TUAudioSystemController.m"), 53, CFSTR("%s"), *a1);

  __break(1u);
}

void __getBYSetupUserDispositionClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SetupAssistantLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TUContactsDataProvider.m"), 37, CFSTR("%s"), *a1);

  __break(1u);
}

void __getBYSetupUserDispositionClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBYSetupUserDispositionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TUContactsDataProvider.m"), 38, CFSTR("Unable to find class %s"), "BYSetupUserDisposition");

  __break(1u);
}

void getkCAGravityResizeAspectFill_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkCAGravityResizeAspectFill(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TURemoteVideoClient.m"), 21, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

void __getCATransactionClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCATransactionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TURemoteVideoClient.m"), 25, CFSTR("Unable to find class %s"), "CATransaction");

  __break(1u);
}

void QuartzCoreLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *QuartzCoreLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TURemoteVideoClient.m"), 20, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCALayerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCALayerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TURemoteVideoClient.m"), 24, CFSTR("Unable to find class %s"), "CALayer");

  __break(1u);
}

void __getCGAffineTransformMakeRotationSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreGraphicsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TURemoteVideoClient.m"), 17, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCAContextClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCAContextClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TURemoteVideoClient.m"), 23, CFSTR("Unable to find class %s"), "CAContext");

  __break(1u);
}

void getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 31, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

void getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Headphones_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Headphones(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 32, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

void getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Vehicle_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Vehicle(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 35, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

void getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Speakers_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Speakers(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 33, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

void getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_TTY_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_TTY(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 34, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

void MediaExperienceLibrary_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MediaExperienceLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TUAudioRoute.m"), 25, CFSTR("%s"), *a1);

  __break(1u);
}

void TUIsEmergencyNumberOrIsWhiteListed_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  uint64_t v3;

  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_2(&dword_19A50D000, v0, v1, "_CTServerConnectionIsEmergencyNumberWithWhitelistIncluded - encountered error %d %ld", v2, v3);
  OUTLINED_FUNCTION_1();
}

void TUIsEmergencyNumber_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  uint64_t v3;

  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_2(&dword_19A50D000, v0, v1, "_CTServerConnectionIsEmergencyNumber - encountered error %d %ld", v2, v3);
  OUTLINED_FUNCTION_1();
}

void TUThumperCarrierName_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  uint64_t v3;

  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_2(&dword_19A50D000, v0, v1, "_CTServerConnectionGetThumperName - encountered error %d %ld", v2, v3);
  OUTLINED_FUNCTION_1();
}

void TUOpenUserActivityForConversationRequest_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Failed to archive join request object with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void TUOpenUserActivityForConversationRequest_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Failed to create application record for InCallService with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void TUOpenURLWithError_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19A50D000, v0, v1, "Failed to open URL %@: %@");
  OUTLINED_FUNCTION_1();
}

void __getLockdownModeManagerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *LockdownModeLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TUUtilities.m"), 56, CFSTR("%s"), *a1);

  __break(1u);
}

void __getLockdownModeManagerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getLockdownModeManagerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TUUtilities.m"), 57, CFSTR("Unable to find class %s"), "LockdownModeManager");

  __break(1u);
}

void __getCLFSystemShellSwitcherClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ClarityFoundationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TUUtilities.m"), 62, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCLFSystemShellSwitcherClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCLFSystemShellSwitcherClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TUUtilities.m"), 63, CFSTR("Unable to find class %s"), "CLFSystemShellSwitcher");

  __break(1u);
}

void __getFTDeviceSupportClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *FTServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TUCollaborationManager.m"), 25, CFSTR("%s"), *a1);

  __break(1u);
}

void __getFTDeviceSupportClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getFTDeviceSupportClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TUCollaborationManager.m"), 26, CFSTR("Unable to find class %s"), "FTDeviceSupport");

  __break(1u);
}

void tu_tcc_identity_create_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tcc_identity_t tu_tcc_identity_create(tcc_identity_type_t, const char *)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("NSBundle+TelephonyUtilities.m"), 13, CFSTR("%s"), dlerror());

  __break(1u);
}

void __gettcc_identity_createSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *TCCLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("NSBundle+TelephonyUtilities.m"), 12, CFSTR("%s"), *a1);

  __break(1u);
}

void __getNPSManagerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *NanoPreferencesSyncLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TUUserConfiguration.m"), 29, CFSTR("%s"), *a1);

  __break(1u);
}

void __getNPSManagerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getNPSManagerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TUUserConfiguration.m"), 30, CFSTR("Unable to find class %s"), "NPSManager");

  __break(1u);
}

void __getBCSBusinessQueryServiceClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *BusinessChatServiceLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TUBusinessServicesMetadataDataProvider.m"), 19, CFSTR("%s"), *a1);

  __break(1u);
}

void __getBCSBusinessQueryServiceClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBCSBusinessQueryServiceClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TUBusinessServicesMetadataDataProvider.m"), 20, CFSTR("Unable to find class %s"), "BCSBusinessQueryService");

  __break(1u);
}

void __getIMSPIQueryMessageWithGUIDAndLoadAttachmentsWithQOSSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *IMCoreLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TUConversationManager.m"), 51, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCKShareClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CloudKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TUConversationActivityCreateSessionRequest.m"), 17, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCKShareClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCKShareClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TUConversationActivityCreateSessionRequest.m"), 18, CFSTR("Unable to find class %s"), "CKShare");

  __break(1u);
}

void __getSWCollaborationHighlightClass_block_invoke_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SharedWithYouLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TUCollaborationNotice.m"), 16, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSWCollaborationHighlightClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSWCollaborationHighlightClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TUCollaborationNotice.m"), 17, CFSTR("Unable to find class %s"), "SWCollaborationHighlight");

  __break(1u);
}

void __getTPSCarrierBundleControllerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *TelephonyPreferencesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TUConfigurationProvider.m"), 41, CFSTR("%s"), *a1);

  __break(1u);
}

void __getTPSCarrierBundleControllerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getTPSCarrierBundleControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TUConfigurationProvider.m"), 42, CFSTR("Unable to find class %s"), "TPSCarrierBundleController");

  __break(1u);
}

void _MKBGetDeviceLockState_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int _MKBGetDeviceLockState(CFDictionaryRef)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TUHandle.m"), 30, CFSTR("%s"), dlerror());

  __break(1u);
}

void __getMKBGetDeviceLockStateSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MobileKeyBagLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TUHandle.m"), 29, CFSTR("%s"), *a1);

  __break(1u);
}

void __getPSSimStatusCacheClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SettingsCellularLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TUPSSimStatusCacheSoftLinking.m"), 16, CFSTR("%s"), *a1);

  __break(1u);
}

void __getPSSimStatusCacheClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPSSimStatusCacheClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TUPSSimStatusCacheSoftLinking.m"), 17, CFSTR("Unable to find class %s"), "PSSimStatusCache");

  __break(1u);
}

void __getCHRecentCallClass_block_invoke_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CallHistoryLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TUCallHistoryControllerXPCClient.m"), 20, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCHRecentCallClass_block_invoke_cold_2_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCHRecentCallClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TUCallHistoryControllerXPCClient.m"), 21, CFSTR("Unable to find class %s"), "CHRecentCall");

  __break(1u);
}

void __getIMNicknameProviderClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *IMCoreLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TUNicknamesMetadataCacheDataProvider.m"), 17, CFSTR("%s"), *a1);

  __break(1u);
}

void __getIMNicknameProviderClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getIMNicknameProviderClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TUNicknamesMetadataCacheDataProvider.m"), 18, CFSTR("Unable to find class %s"), "IMNicknameProvider");

  __break(1u);
}

void __getINStartCallIntentClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getINStartCallIntentClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TUIntentController.m"), 23, CFSTR("Unable to find class %s"), "INStartCallIntent");

  __break(1u);
}

void IntentsLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *IntentsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TUIntentController.m"), 20, CFSTR("%s"), *a1);

  __break(1u);
}

void __getINPersonHandleClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getINPersonHandleClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TUIntentController.m"), 22, CFSTR("Unable to find class %s"), "INPersonHandle");

  __break(1u);
}

void __getINPersonClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getINPersonClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TUIntentController.m"), 21, CFSTR("Unable to find class %s"), "INPerson");

  __break(1u);
}

uint64_t sub_19A63784C()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_19A637858()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_19A637864()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_19A637870()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_19A63787C()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_19A637888()
{
  return MEMORY[0x1E0CAFD40]();
}

uint64_t sub_19A637894()
{
  return MEMORY[0x1E0CAFD90]();
}

uint64_t sub_19A6378A0()
{
  return MEMORY[0x1E0CAFDF8]();
}

uint64_t sub_19A6378AC()
{
  return MEMORY[0x1E0CAFE08]();
}

uint64_t sub_19A6378B8()
{
  return MEMORY[0x1E0CAFE30]();
}

uint64_t sub_19A6378C4()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_19A6378D0()
{
  return MEMORY[0x1E0CAFE68]();
}

uint64_t sub_19A6378DC()
{
  return MEMORY[0x1E0CAFF30]();
}

uint64_t sub_19A6378E8()
{
  return MEMORY[0x1E0CAFF98]();
}

uint64_t sub_19A6378F4()
{
  return MEMORY[0x1E0CAFFB8]();
}

uint64_t sub_19A637900()
{
  return MEMORY[0x1E0CAFFD0]();
}

uint64_t sub_19A63790C()
{
  return MEMORY[0x1E0CAFFE0]();
}

uint64_t sub_19A637918()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_19A637924()
{
  return MEMORY[0x1E0CB0128]();
}

uint64_t sub_19A637930()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_19A63793C()
{
  return MEMORY[0x1E0CB02C0]();
}

uint64_t sub_19A637948()
{
  return MEMORY[0x1E0CB05C8]();
}

uint64_t sub_19A637954()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_19A637960()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_19A63796C()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_19A637978()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_19A637984()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_19A637990()
{
  return MEMORY[0x1E0CB0AC0]();
}

uint64_t sub_19A63799C()
{
  return MEMORY[0x1E0CB0AE8]();
}

uint64_t sub_19A6379A8()
{
  return MEMORY[0x1E0CB0C38]();
}

uint64_t sub_19A6379B4()
{
  return MEMORY[0x1E0CB0C48]();
}

uint64_t sub_19A6379C0()
{
  return MEMORY[0x1E0CB0D80]();
}

uint64_t sub_19A6379CC()
{
  return MEMORY[0x1E0CB0DA8]();
}

uint64_t sub_19A6379D8()
{
  return MEMORY[0x1E0CB0DB8]();
}

uint64_t sub_19A6379E4()
{
  return MEMORY[0x1E0CB0DF0]();
}

uint64_t sub_19A6379F0()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_19A6379FC()
{
  return MEMORY[0x1E0CB1440]();
}

uint64_t sub_19A637A08()
{
  return MEMORY[0x1E0CB1460]();
}

uint64_t sub_19A637A14()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t sub_19A637A20()
{
  return MEMORY[0x1E0DE9480]();
}

uint64_t sub_19A637A2C()
{
  return MEMORY[0x1E0DE94C0]();
}

uint64_t sub_19A637A38()
{
  return MEMORY[0x1E0CBC208]();
}

uint64_t sub_19A637A44()
{
  return MEMORY[0x1E0CBC210]();
}

uint64_t sub_19A637A50()
{
  return MEMORY[0x1E0CBC218]();
}

uint64_t sub_19A637A5C()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_19A637A68()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_19A637A74()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_19A637A80()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_19A637A8C()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_19A637A98()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_19A637AA4()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_19A637AB0()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_19A637ABC()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_19A637AC8()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_19A637AD4()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t sub_19A637AE0()
{
  return MEMORY[0x1E0DEA6F0]();
}

uint64_t sub_19A637AEC()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_19A637AF8()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_19A637B04()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_19A637B10()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_19A637B1C()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_19A637B28()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_19A637B34()
{
  return MEMORY[0x1E0CB1AE0]();
}

uint64_t sub_19A637B40()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_19A637B4C()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_19A637B58()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_19A637B64()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_19A637B70()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_19A637B7C()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_19A637B88()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_19A637B94()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_19A637BA0()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_19A637BAC()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_19A637BB8()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_19A637BC4()
{
  return MEMORY[0x1E0DEF200]();
}

uint64_t sub_19A637BD0()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_19A637BDC()
{
  return MEMORY[0x1E0DE94D0]();
}

uint64_t sub_19A637BE8()
{
  return MEMORY[0x1E0DEF270]();
}

uint64_t sub_19A637BF4()
{
  return MEMORY[0x1E0DEF280]();
}

uint64_t sub_19A637C00()
{
  return MEMORY[0x1E0DEF2B8]();
}

uint64_t sub_19A637C0C()
{
  return MEMORY[0x1E0DE94F0]();
}

uint64_t sub_19A637C18()
{
  return MEMORY[0x1E0DEF340]();
}

uint64_t sub_19A637C24()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_19A637C30()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_19A637C3C()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_19A637C48()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_19A637C54()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_19A637C60()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_19A637C6C()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_19A637C78()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_19A637C84()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_19A637C90()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_19A637C9C()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_19A637CA8()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_19A637CB4()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_19A637CC0()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_19A637CCC()
{
  return MEMORY[0x1E0DECDA0]();
}

uint64_t sub_19A637CD8()
{
  return MEMORY[0x1E0DECDA8]();
}

uint64_t sub_19A637CE4()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_19A637CF0()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_19A637CFC()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_19A637D08()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_19A637D14()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_19A637D20()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_19A637D2C()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_19A637D38()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_19A637D44()
{
  return MEMORY[0x1E0DEDED8]();
}

uint64_t sub_19A637D50()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_19A637D5C()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t ABAddressBookCopyArrayOfUIDsMatchingEmailAddress()
{
  return MEMORY[0x1E0CF5678]();
}

uint64_t ABAddressBookCopyArrayOfUIDsMatchingPhoneNumberWithCountryAndHint()
{
  return MEMORY[0x1E0CF5680]();
}

ABRecordRef ABAddressBookGetPersonWithRecordID(ABAddressBookRef addressBook, ABRecordID recordID)
{
  return (ABRecordRef)MEMORY[0x1E0CF57A8](addressBook, *(_QWORD *)&recordID);
}

CFTypeRef ABMultiValueCopyValueAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  return (CFTypeRef)MEMORY[0x1E0CF5A40](multiValue, index);
}

CFIndex ABMultiValueGetCount(ABMultiValueRef multiValue)
{
  return MEMORY[0x1E0CF5A58](multiValue);
}

uint64_t ABPersonCopyPreferredLinkedPersonForName()
{
  return MEMORY[0x1E0CF5AF8]();
}

CFStringRef ABRecordCopyCompositeName(ABRecordRef record)
{
  return (CFStringRef)MEMORY[0x1E0CF5C80](record);
}

CFTypeRef ABRecordCopyValue(ABRecordRef record, ABPropertyID property)
{
  return (CFTypeRef)MEMORY[0x1E0CF5C90](record, *(_QWORD *)&property);
}

ABRecordID ABRecordGetRecordID(ABRecordRef record)
{
  return MEMORY[0x1E0CF5CA8](record);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80330](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80338](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80340](c, data, *(_QWORD *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D78](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DB0](theArray, idx, value);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x1E0C988F0](center, observer);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

uint64_t CFPhoneNumberCopyISOCountryCode()
{
  return MEMORY[0x1E0D17810]();
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x1E0D17838]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x1E0D17848]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

Boolean CFPreferencesAppValueIsForced(CFStringRef key, CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A38](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1E0C98D80](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
  MEMORY[0x1E0C98EE8](theString, chars, numChars);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

OSStatus CMBlockBufferCopyDataBytes(CMBlockBufferRef theSourceBuffer, size_t offsetToData, size_t dataLength, void *destination)
{
  return MEMORY[0x1E0C9EB68](theSourceBuffer, offsetToData, dataLength, destination);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1E0C9EB88](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x1E0C9EB98](theBuffer);
}

uint64_t CMFBlockListAddItemForAllServices()
{
  return MEMORY[0x1E0D13258]();
}

uint64_t CMFBlockListCopyItemsForAllServicesService()
{
  return MEMORY[0x1E0D13260]();
}

uint64_t CMFBlockListIsItemBlocked()
{
  return MEMORY[0x1E0D13268]();
}

uint64_t CMFBlockListRemoveItemFromAllServices()
{
  return MEMORY[0x1E0D13270]();
}

uint64_t CMFItemCopyBusinessID()
{
  return MEMORY[0x1E0D13280]();
}

uint64_t CMFItemCopyEmailAddress()
{
  return MEMORY[0x1E0D13288]();
}

uint64_t CMFItemCopyPhoneNumber()
{
  return MEMORY[0x1E0D13290]();
}

uint64_t CMFItemCreateWithBusinessID()
{
  return MEMORY[0x1E0D13298]();
}

uint64_t CMFItemCreateWithEmailAddress()
{
  return MEMORY[0x1E0D132A0]();
}

uint64_t CMFItemCreateWithPhoneNumber()
{
  return MEMORY[0x1E0D132A8]();
}

uint64_t CMFItemGetType()
{
  return MEMORY[0x1E0D132B0]();
}

OSStatus CMFormatDescriptionCreate(CFAllocatorRef allocator, CMMediaType mediaType, FourCharCode mediaSubType, CFDictionaryRef extensions, CMFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9EDB0](allocator, *(_QWORD *)&mediaType, *(_QWORD *)&mediaSubType, extensions, formatDescriptionOut);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1E0C9EF40](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x1E0C9EFB0](sbuf);
}

CMTime *__cdecl CMSampleBufferGetDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1E0C9EFC8](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1E0C9F008](retstr, sbuf);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F298](retstr, lhs, rhs);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return (CFStringRef)MEMORY[0x1E0C9F2F8](allocator, time);
}

uint64_t CPPhoneNumberCopyActiveCountryCode()
{
  return MEMORY[0x1E0CFA330]();
}

uint64_t CPPhoneNumberCopyCountryCodeForIncomingVoiceCall()
{
  return MEMORY[0x1E0CFA348]();
}

uint64_t CPPhoneNumberCopyHomeCountryCode()
{
  return MEMORY[0x1E0CFA360]();
}

uint64_t CPPhoneNumberCopyNetworkCountryCode()
{
  return MEMORY[0x1E0CFA370]();
}

uint64_t CPPhoneNumbersEqual()
{
  return MEMORY[0x1E0CFA3A0]();
}

uint64_t CTCallIsCallHandoffPossible()
{
  return MEMORY[0x1E0CA6BE0]();
}

uint64_t CTCallPhoneNumberIsMmiOrUssd()
{
  return MEMORY[0x1E0CA6BE8]();
}

uint64_t CTTelephonyCenterAddObserver()
{
  return MEMORY[0x1E0CA6CC0]();
}

uint64_t CTTelephonyCenterGetDefault()
{
  return MEMORY[0x1E0CA6CC8]();
}

uint64_t CTTelephonyCenterRemoveEveryObserver()
{
  return MEMORY[0x1E0CA6CD0]();
}

uint64_t CTTelephonyCenterRemoveObserver()
{
  return MEMORY[0x1E0CA6CD8]();
}

uint64_t CTTelephonyCenterSetDefaultRunloop()
{
  return MEMORY[0x1E0CA6CE0]();
}

uint64_t CUTWeakLinkClass()
{
  return MEMORY[0x1E0D131E0]();
}

uint64_t CUTWeakLinkSymbol()
{
  return MEMORY[0x1E0D131E8]();
}

uint64_t CreateCMFItemFromString()
{
  return MEMORY[0x1E0D132B8]();
}

uint64_t ICFCallProviderShouldAllowIncomingCallWithQueue()
{
  return MEMORY[0x1E0D3A8F8]();
}

uint64_t IDSCopyAddressDestinationForDestination()
{
  return MEMORY[0x1E0D33DC0]();
}

uint64_t IDSCopyIDForEmailAddress()
{
  return MEMORY[0x1E0D33DF0]();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return MEMORY[0x1E0D33DF8]();
}

uint64_t IDSCopyIDForPseudonymID()
{
  return MEMORY[0x1E0D33E08]();
}

uint64_t IDSCopyIDForTemporaryID()
{
  return MEMORY[0x1E0D33E10]();
}

uint64_t IDSCopyRawAddressForDestination()
{
  return MEMORY[0x1E0D33E28]();
}

uint64_t IDSCopyTokenAndIDForTokenWithID()
{
  return MEMORY[0x1E0D33E30]();
}

uint64_t IDSIDAliasHashUInt64()
{
  return MEMORY[0x1E0D34860]();
}

uint64_t IDSLoggableDescriptionForHandleOnService()
{
  return MEMORY[0x1E0D348C8]();
}

uint64_t IDSLoggableDescriptionForHandlesOnService()
{
  return MEMORY[0x1E0D348D0]();
}

uint64_t IDSLoggableDescriptionForObjectOnService()
{
  return MEMORY[0x1E0D348D8]();
}

uint64_t IMCopyStringWithLatinNumbers()
{
  return MEMORY[0x1E0D36378]();
}

uint64_t IMFormatPhoneNumber()
{
  return MEMORY[0x1E0D36458]();
}

uint64_t IMStringIsEmail()
{
  return MEMORY[0x1E0D36868]();
}

uint64_t IMStringIsHardwareID()
{
  return MEMORY[0x1E0D36880]();
}

uint64_t IMStringIsPhoneNumber()
{
  return MEMORY[0x1E0D36890]();
}

uint64_t IMStringIsPseudonymID()
{
  return MEMORY[0x1E0D36898]();
}

uint64_t IMStringIsTemporaryID()
{
  return MEMORY[0x1E0D368A8]();
}

uint64_t IMStripFormattingFromAddress()
{
  return MEMORY[0x1E0D368B0]();
}

uint64_t IMWeakLinkSymbol()
{
  return MEMORY[0x1E0D36978]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x1E0CBB130]();
}

uint64_t IOHIDEventSystemClientCreate()
{
  return MEMORY[0x1E0CBB1F0]();
}

uint64_t IOHIDEventSystemClientRegisterEventCallback()
{
  return MEMORY[0x1E0CBB220]();
}

uint64_t IOHIDEventSystemClientScheduleWithRunLoop()
{
  return MEMORY[0x1E0CBB250]();
}

uint64_t IOHIDEventSystemClientSetMatchingMultiple()
{
  return MEMORY[0x1E0CBB270]();
}

uint64_t IOHIDEventSystemClientUnscheduleWithRunLoop()
{
  return MEMORY[0x1E0CBB2C0]();
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0CBB4B0](service, key);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGGetSInt64Answer()
{
  return MEMORY[0x1E0DE2B78]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x1E0DE2C00]();
}

uint64_t MobileGestalt_get_deviceCornerRadius()
{
  return MEMORY[0x1E0DE2C10]();
}

uint64_t MobileGestalt_get_homeButtonType()
{
  return MEMORY[0x1E0DE2C38]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1E0CB3240]((__n128)aSize, *(__n128 *)&aSize.height);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1E0D82CC0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t PNCopyBestGuessCountryCodeForNumber()
{
  return MEMORY[0x1E0D17860]();
}

uint64_t PNCreateFormattedStringWithCountry()
{
  return MEMORY[0x1E0D17878]();
}

uint64_t PNIsValidPhoneNumberForCountry()
{
  return MEMORY[0x1E0D17888]();
}

uint64_t SBSIsSystemApertureAvailable()
{
  return MEMORY[0x1E0DAB778]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1E0CD65E0](task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

uint64_t _CTServerConnectionCopyISOForMCC()
{
  return MEMORY[0x1E0CA6EB8]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x1E0CA6F30]();
}

uint64_t _CTServerConnectionGetThumperName()
{
  return MEMORY[0x1E0CA6FD8]();
}

uint64_t _CTServerConnectionIsEmergencyNumber()
{
  return MEMORY[0x1E0CA6FF8]();
}

uint64_t _CTServerConnectionIsEmergencyNumberWithWhitelistIncluded()
{
  return MEMORY[0x1E0CA7000]();
}

uint64_t _PNCopyStrippedNumberWithoutPauses()
{
  return MEMORY[0x1E0D178C0]();
}

uint64_t _PNCreateStringByStrippingFormattingAndNotVisiblyAllowable()
{
  return MEMORY[0x1E0D178C8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C78](*(_QWORD *)&a1);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AC8](cls);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x1E0C82C58](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

intptr_t dispatch_block_testcancel(dispatch_block_t block)
{
  return MEMORY[0x1E0C82C90](block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1E0C82D08](key);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x1E0C82E80](queue, key, context, destructor);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x1E0C84678]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1E0C84948]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1E0C85180]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

uint64_t sandbox_extension_issue_file_to_process_by_pid()
{
  return MEMORY[0x1E0C851B8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1E0DF0F98]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

