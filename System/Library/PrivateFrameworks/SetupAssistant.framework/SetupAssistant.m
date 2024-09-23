void sub_1A4E94854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E949CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL BYSetupAssistantNeedsToRun()
{
  void *v0;
  int v1;
  NSObject *v2;
  _BOOL8 v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  int v13;
  const __CFString *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[BYPreferencesController buddyPreferencesInternal](BYPreferencesController, "buddyPreferencesInternal");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("ForceNoBuddy"));

  if (v1)
  {
    _BYLaunchLogSubsystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1A4E92000, v2, OS_LOG_TYPE_DEFAULT, "BYSetupAssistantNeedsToRun is NO due to ForceNoBuddy.", (uint8_t *)&v13, 2u);
    }
    v3 = 0;
LABEL_22:

    return v3;
  }
  if (_isSupportedDeviceClass_onceToken != -1)
    dispatch_once(&_isSupportedDeviceClass_onceToken, &__block_literal_global_137);
  if (!_isSupportedDeviceClass_isSupported)
    return 0;
  v4 = LaunchSentinelExists();
  v3 = !v4;
  if (MGGetBoolAnswer())
  {
    if (BYSetupAssistantNeedsToRun_onceToken != -1)
      dispatch_once(&BYSetupAssistantNeedsToRun_onceToken, &__block_literal_global_8);
    v5 = (void *)BYSetupAssistantNeedsToRun_dateFormatter;
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeZone:", v6);

    v2 = CFPreferencesCopyAppValue(CFSTR("lastPrepareLaunchSentinel"), CFSTR("com.apple.purplebuddy"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && -[NSObject count](v2, "count") == 2)
    {
      -[NSObject objectAtIndexedSubscript:](v2, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectAtIndexedSubscript:](v2, "objectAtIndexedSubscript:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
      v8 = 0;
    }
    _BYLaunchLogSubsystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (v4)
        v10 = CFSTR("no");
      else
        v10 = CFSTR("yes");
      objc_msgSend((id)BYSetupAssistantNeedsToRun_dateFormatter, "stringFromDate:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v10;
      v15 = 2114;
      v16 = v11;
      v17 = 2114;
      v18 = v8;
      _os_log_impl(&dword_1A4E92000, v9, OS_LOG_TYPE_DEFAULT, "BYSetupAssistantNeedsToRun = %{public}@, last cache update at %{public}@ with result %{public}@", (uint8_t *)&v13, 0x20u);

    }
    goto LABEL_22;
  }
  return v3;
}

id _BYLaunchLogSubsystem()
{
  if (_BYLaunchLogSubsystem_onceToken != -1)
    dispatch_once(&_BYLaunchLogSubsystem_onceToken, &__block_literal_global_3);
  return (id)_BYLaunchLogSubsystem_oslog;
}

BOOL LaunchSentinelExists()
{
  sem_t *v0;
  sem_t *v1;

  v0 = sem_open("purplebuddy.sentinel", 0);
  v1 = v0;
  if (v0 != (sem_t *)-1)
    sem_close(v0);
  return v1 != (sem_t *)-1;
}

BOOL BYSetupAssistantHasCompletedInitialRun()
{
  void *v0;
  int v1;
  NSObject *v2;
  uint8_t v4[16];

  +[BYPreferencesController buddyPreferencesInternal](BYPreferencesController, "buddyPreferencesInternal");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("ForceNoBuddy"));

  if (!v1)
    return CFPreferencesGetAppBooleanValue(CFSTR("SetupFinishedAllSteps"), CFSTR("com.apple.purplebuddy"), 0) != 0;
  _BYLaunchLogSubsystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A4E92000, v2, OS_LOG_TYPE_DEFAULT, "BYSetupAssistantHasCompletedInitialRun is YES due to ForceNoBuddy.", v4, 2u);
  }

  return 1;
}

void sub_1A4E951A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

id getVTPreferencesClass()
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
  v0 = (void *)getVTPreferencesClass_softClass;
  v7 = getVTPreferencesClass_softClass;
  if (!getVTPreferencesClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVTPreferencesClass_block_invoke;
    v3[3] = &unk_1E4E26900;
    v3[4] = &v4;
    __getVTPreferencesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A4E95274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

Class __getVTPreferencesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!VoiceTriggerLibraryCore_frameworkLibrary)
  {
    VoiceTriggerLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!VoiceTriggerLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VTPreferences");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getVTPreferencesClass_block_invoke_cold_1();
    free(v3);
  }
  getVTPreferencesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAFPreferencesClass_block_invoke(uint64_t a1)
{
  Class result;

  AssistantServicesLibrary();
  result = objc_getClass("AFPreferences");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAFPreferencesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAFPreferencesClass_block_invoke_cold_1();
    return (Class)AssistantServicesLibrary();
  }
  return result;
}

uint64_t AssistantServicesLibrary()
{
  uint64_t v0;
  void *v2;

  if (!AssistantServicesLibraryCore_frameworkLibrary)
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
  uint64_t v3;

  AssistantServicesLibrary();
  result = objc_getClass("AFSettingsConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAFSettingsConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getAFSettingsConnectionClass_block_invoke_cold_1();
    return (Class)__getAFVoiceInfoClass_block_invoke(v3);
  }
  return result;
}

BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient *__getAFVoiceInfoClass_block_invoke(uint64_t a1)
{
  BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient *result;
  BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient *v3;
  SEL v4;

  AssistantServicesLibrary();
  result = (BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient *)objc_getClass("AFVoiceInfo");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAFVoiceInfoClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient *)__getAFVoiceInfoClass_block_invoke_cold_1();
    return -[BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient init](v3, v4);
  }
  return result;
}

void sub_1A4E95A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E95D88(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1A4E95E90(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1A4E95F98(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1A4E96160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4E96328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4E964F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4E966B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4E96880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4E96D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __getDMTEnrollmentStatusViewModelClass_block_invoke(uint64_t a1)
{
  DeviceManagementToolsLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("DMTEnrollmentStatusViewModel");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getDMTEnrollmentStatusViewModelClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getDMTEnrollmentStatusViewModelClass_block_invoke_cold_1();
    DeviceManagementToolsLibrary();
  }
}

void DeviceManagementToolsLibrary()
{
  void *v0;

  if (!DeviceManagementToolsLibraryCore_frameworkLibrary)
    DeviceManagementToolsLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!DeviceManagementToolsLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getDMTEnrollmentCompletionViewModelClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;

  DeviceManagementToolsLibrary();
  result = objc_getClass("DMTEnrollmentCompletionViewModel");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getDMTEnrollmentCompletionViewModelClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getDMTEnrollmentCompletionViewModelClass_block_invoke_cold_1();
    return (Class)+[BYSetupStateManager sharedManager](v3, v4);
  }
  return result;
}

void sub_1A4E97BC0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1A4E98648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFMDFMIPManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!FindMyDeviceLibraryCore_frameworkLibrary)
  {
    FindMyDeviceLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!FindMyDeviceLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("FMDFMIPManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getFMDFMIPManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getFMDFMIPManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1A4E98D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBKDeviceClass()
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
  v0 = (void *)getBKDeviceClass_softClass;
  v7 = getBKDeviceClass_softClass;
  if (!getBKDeviceClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getBKDeviceClass_block_invoke;
    v3[3] = &unk_1E4E26900;
    v3[4] = &v4;
    __getBKDeviceClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A4E98FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBKDeviceDescriptorClass()
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
  v0 = (void *)getBKDeviceDescriptorClass_softClass;
  v7 = getBKDeviceDescriptorClass_softClass;
  if (!getBKDeviceDescriptorClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getBKDeviceDescriptorClass_block_invoke;
    v3[3] = &unk_1E4E26900;
    v3[4] = &v4;
    __getBKDeviceDescriptorClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A4E99058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E99124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E9937C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getBiometricKitClass_block_invoke(uint64_t a1)
{
  BiometricKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("BiometricKit");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBiometricKitClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getBiometricKitClass_block_invoke_cold_1();
    BiometricKitLibrary();
  }
}

void BiometricKitLibrary()
{
  void *v0;

  if (!BiometricKitLibraryCore_frameworkLibrary)
    BiometricKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!BiometricKitLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getBKDeviceClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  BiometricKitLibrary();
  result = objc_getClass("BKDevice");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBKDeviceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getBKDeviceClass_block_invoke_cold_1();
    return (Class)__getBKDeviceDescriptorClass_block_invoke(v3);
  }
  return result;
}

Class __getBKDeviceDescriptorClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  BiometricKitLibrary();
  result = objc_getClass("BKDeviceDescriptor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBKDeviceDescriptorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getBKDeviceDescriptorClass_block_invoke_cold_1();
    return (Class)__getSOSUtilitiesClass_block_invoke(v3);
  }
  return result;
}

Class __getSOSUtilitiesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SOSLibraryCore_frameworkLibrary)
  {
    SOSLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SOSLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SOSUtilities");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSOSUtilitiesClass_block_invoke_cold_1();
    free(v3);
  }
  getSOSUtilitiesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getPKSetupAssistantContextClass_block_invoke(uint64_t a1)
{
  PassKitUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PKSetupAssistantContext");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPKSetupAssistantContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPKSetupAssistantContextClass_block_invoke_cold_1();
    PassKitUILibrary();
  }
}

void PassKitUILibrary()
{
  void *v0;

  if (!PassKitUILibraryCore_frameworkLibrary)
    PassKitUILibraryCore_frameworkLibrary = _sl_dlopen();
  if (!PassKitUILibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getPKPaymentSetupAssistantControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  PassKitUILibrary();
  result = objc_getClass("PKPaymentSetupAssistantController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPKPaymentSetupAssistantControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getPKPaymentSetupAssistantControllerClass_block_invoke_cold_1();
    return (Class)OUTLINED_FUNCTION_0_1(v3);
  }
  return result;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1A4E9A994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_1A4E9C2B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSBSIsSystemApertureAvailableSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (SpringBoardServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary;
  }
  else
  {
    SpringBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary;
    if (!SpringBoardServicesLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "SBSIsSystemApertureAvailable");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getSBSIsSystemApertureAvailableSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void BYUserSwitchContextHasBeenUsed()
{
  id v0;

  +[BYManagedAppleIDBootstrap sharedManager](BYManagedAppleIDBootstrap, "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "userSwitchContextHasBeenUsed");

}

void sub_1A4E9CED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E9F2E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getACAccountStoreClass()
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
  v0 = (void *)getACAccountStoreClass_softClass;
  v7 = getACAccountStoreClass_softClass;
  if (!getACAccountStoreClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getACAccountStoreClass_block_invoke;
    v3[3] = &unk_1E4E26900;
    v3[4] = &v4;
    __getACAccountStoreClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A4E9F60C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E9F928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E9FFA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
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

id getAKAppleIDAuthenticationControllerClass(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  id v9;
  uint8_t v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v8 = (void *)getAKAppleIDAuthenticationControllerClass_softClass;
  v16 = getAKAppleIDAuthenticationControllerClass_softClass;
  if (!getAKAppleIDAuthenticationControllerClass_softClass)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getAKAppleIDAuthenticationControllerClass_block_invoke;
    v12[3] = &unk_1E4E26900;
    v12[4] = &v13;
    __getAKAppleIDAuthenticationControllerClass_block_invoke((uint64_t)v12, a2, a3, a4, a5, a6, a7, a8, v11);
    v8 = (void *)v14[3];
  }
  v9 = v8;
  _Block_object_dispose(&v13, 8);
  return v9;
}

void sub_1A4EA00AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EA03EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EA098C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    ManagedConfigurationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ManagedConfigurationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("MCProfileConnection");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getMCProfileConnectionClass_block_invoke_cold_1();
    free(v3);
  }
  getMCProfileConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSecureBackupClass_block_invoke(uint64_t a1)
{
  Class result;

  CloudServicesLibrary();
  result = objc_getClass("SecureBackup");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSecureBackupClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSecureBackupClass_block_invoke_cold_1();
    return (Class)CloudServicesLibrary();
  }
  return result;
}

uint64_t CloudServicesLibrary()
{
  uint64_t v0;
  void *v2;

  if (!CloudServicesLibraryCore_frameworkLibrary)
    CloudServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = CloudServicesLibraryCore_frameworkLibrary;
  if (!CloudServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getACAccountStoreClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AccountsLibraryCore_frameworkLibrary)
  {
    AccountsLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AccountsLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("ACAccountStore");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getACAccountStoreClass_block_invoke_cold_1();
    free(v3);
  }
  getACAccountStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getAKAppleIDAuthenticationContextClass_block_invoke(uint64_t a1)
{
  AuthKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AKAppleIDAuthenticationContext");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAKAppleIDAuthenticationContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAKAppleIDAuthenticationContextClass_block_invoke_cold_1();
    AuthKitLibrary();
  }
}

void AuthKitLibrary()
{
  void *v0;

  if (!AuthKitLibraryCore_frameworkLibrary)
    AuthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AuthKitLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void __getAKAppleIDAuthenticationControllerClass_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  AuthKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AKAppleIDAuthenticationController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAKAppleIDAuthenticationControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v10 = (void *)__getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_1_0(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1A4EA150C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL BYIsRunningInStoreDemoMode()
{
  return CFPreferencesGetAppBooleanValue(CFSTR("StoreDemoMode"), CFSTR("com.apple.demo-settings"), 0) != 0;
}

void BYAssistantFixUpVoiceTriggerStateIfNeeded()
{
  void *v0;
  void *v1;
  void *v2;
  int v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  BYFlowSkipController *v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  objc_msgSend(getVTPreferencesClass_0(), "sharedPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "languageCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v0, "voiceTriggerEnabled");
  objc_msgSend(getSSRVoiceProfileManagerClass(), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSATEnrolledForSiriProfileId:forLanguageCode:", 0, v2);

  if (v3 && (v5 & 1) == 0)
  {
    _BYLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "VT enabled with no training data, disabling", buf, 2u);
    }

    objc_msgSend(v0, "setVoiceTriggerEnabled:", 0);
    objc_msgSend(getSSRVoiceProfileManagerClass(), "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasVoiceProfileIniCloudForLanguageCode:", v2);

    _BYLoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1A4E92000, v9, OS_LOG_TYPE_DEFAULT, "Found voice profile in the cloud. Enabling VT on sync.", v13, 2u);
      }

      objc_msgSend(getSSRVoiceProfileManagerClass(), "sharedInstance");
      v11 = (BYFlowSkipController *)objc_claimAutoreleasedReturnValue();
      -[BYFlowSkipController enableVoiceTriggerUponVoiceProfileSyncForLanguage:](v11, "enableVoiceTriggerUponVoiceProfileSyncForLanguage:", v2);
    }
    else
    {
      if (v10)
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1A4E92000, v9, OS_LOG_TYPE_DEFAULT, "Couldn't find voice profile in the cloud. Posting Siri followup.", v12, 2u);
      }

      v11 = objc_alloc_init(BYFlowSkipController);
      -[BYFlowSkipController didSkipFlow:](v11, "didSkipFlow:", CFSTR("siri"));
    }

  }
}

id getVTPreferencesClass_0()
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
  v0 = (void *)getVTPreferencesClass_softClass_0;
  v7 = getVTPreferencesClass_softClass_0;
  if (!getVTPreferencesClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVTPreferencesClass_block_invoke_0;
    v3[3] = &unk_1E4E26900;
    v3[4] = &v4;
    __getVTPreferencesClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A4EA1E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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
  v0 = (void *)getAFPreferencesClass_softClass_0;
  v7 = getAFPreferencesClass_softClass_0;
  if (!getAFPreferencesClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAFPreferencesClass_block_invoke_0;
    v3[3] = &unk_1E4E26900;
    v3[4] = &v4;
    __getAFPreferencesClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A4EA1EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSSRVoiceProfileManagerClass()
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
  v0 = (void *)getSSRVoiceProfileManagerClass_softClass;
  v7 = getSSRVoiceProfileManagerClass_softClass;
  if (!getSSRVoiceProfileManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSSRVoiceProfileManagerClass_block_invoke;
    v3[3] = &unk_1E4E26900;
    v3[4] = &v4;
    __getSSRVoiceProfileManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A4EA1FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t BYAssistantScreenShouldRunForVTConfirmation()
{
  void *v0;
  void *v1;
  char v2;
  uint64_t v3;
  int AppBooleanValue;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  const __CFString *v8;
  id v9;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(getVTPreferencesClass_0(), "sharedPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getSSRVoiceProfileManagerClass(), "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isVoiceTriggerRepromptRequired");

  v3 = objc_msgSend(v0, "voiceTriggerEnabled");
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("forceNeedsConfirmation"), CFSTR("com.apple.VoiceTriggerUI.vtconf"), 0);
  v5 = AppBooleanValue;
  if ((v2 & 1) != 0 || AppBooleanValue)
  {
    _BYLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if ((v3 & 1) != 0)
    {
      if (v7)
      {
        v8 = &stru_1E4E29440;
        if (v5)
          v8 = CFSTR("(forced)");
        v11 = 138412290;
        v12 = v8;
        _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "Showing VT Confirmation %@", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      if (v7)
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "Not showing VT Confirmation because voicetrigger is turned off", (uint8_t *)&v11, 2u);
      }

      objc_msgSend(getSSRVoiceProfileManagerClass(), "sharedInstance");
      v6 = objc_claimAutoreleasedReturnValue();
      v9 = (id)-[NSObject voiceTriggerRepromptFinished](v6, "voiceTriggerRepromptFinished");
    }

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t BYAssistantScreenShouldRunForPHSUpgrade()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  int v5;
  char ShouldRunForVTConfirmation;
  int v7;
  void *v8;
  char v9;
  int v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(getVTPreferencesClass_0(), "sharedPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "languageCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = MGGetBoolAnswer();
  objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "assistantIsEnabled");

  ShouldRunForVTConfirmation = BYAssistantScreenShouldRunForVTConfirmation();
  v7 = objc_msgSend(v0, "voiceTriggerEnabled");
  objc_msgSend(getSSRVoiceProfileManagerClass(), "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSATEnrolledForSiriProfileId:forLanguageCode:", 0, v2);

  if ((ShouldRunForVTConfirmation & 1) != 0)
    goto LABEL_16;
  if ((v9 & 1) != 0)
  {
    v10 = 1;
    if (!(_DWORD)v3)
      goto LABEL_17;
  }
  else
  {
    objc_msgSend(getSSRVoiceProfileManagerClass(), "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "hasVoiceProfileIniCloudForLanguageCode:", v2);

    if (!(_DWORD)v3)
      goto LABEL_17;
  }
  if (((v7 ^ 1 | v10) & 1) == 0)
  {
    _BYLoggingFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = v2;
      v13 = "Showing VT upgrade since VT is enabled but not trained for language code %{public}@";
      goto LABEL_14;
    }
LABEL_15:

LABEL_16:
    v3 = 1;
    goto LABEL_17;
  }
  v3 = 0;
  if (!_BOOLeanPrefVal(CFSTR("AssistantPHSOffered"), CFSTR("com.apple.purplebuddy"))
    && ((v5 ^ 1) & 1) == 0
    && (v7 & v10 & 1) == 0)
  {
    _BYLoggingFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = v2;
      v13 = "Showing VT offer for language code %{public}@";
LABEL_14:
      _os_log_impl(&dword_1A4E92000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0xCu);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
LABEL_17:

  return v3;
}

uint64_t BYAssistantScreenShouldBeShownInSetupAssistant()
{
  BYCapabilities *v0;
  void *v1;
  int v2;
  void *v3;
  int v4;
  int ShouldRunForPHSUpgrade;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  dispatch_semaphore_t v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v28;
  _QWORD v29[4];
  NSObject *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE buf[24];
  void *v41;
  uint64_t *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(BYCapabilities);
  if (-[BYCapabilities canShowSiriScreen](v0, "canShowSiriScreen"))
  {
    objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "synchronize");

    v2 = MGGetBoolAnswer();
    objc_msgSend(getVTPreferencesClass_0(), "sharedPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "voiceTriggerEnabled");
    ShouldRunForPHSUpgrade = BYAssistantScreenShouldRunForPHSUpgrade();
    objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "assistantIsEnabled");

    if (_BOOLeanPrefVal(CFSTR("AssistantPresented"), CFSTR("com.apple.purplebuddy")))
    {
      v8 = 1;
    }
    else
    {
      +[BYPreferencesController buddyPreferences](BYPreferencesController, "buddyPreferences");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "BOOLForKey:", CFSTR("AssistantPresented"));

    }
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasPresentedCompactVoiceTriggerDisclosure");

    if ((v12 & 1) != 0)
    {
      _BYLoggingFacility();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4E92000, v13, OS_LOG_TYPE_DEFAULT, "Siri compact trigger disclosure has been seen", buf, 2u);
      }
    }
    else
    {
      objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "languageCode");
      v13 = objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v3, "isCompactVoiceTriggerAvailableForLanguageCode:", v13))
      {
        *((_BYTE *)v33 + 24) = 1;
      }
      else
      {
        _BYLoggingFacility();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4E92000, v15, OS_LOG_TYPE_DEFAULT, "Compact trigger not supported for language", buf, 2u);
        }

        v28 = v2;
        v16 = dispatch_semaphore_create(0);
        v36 = 0;
        v37 = &v36;
        v38 = 0x2050000000;
        v17 = (void *)getAFSettingsConnectionClass_softClass_0;
        v39 = getAFSettingsConnectionClass_softClass_0;
        v18 = MEMORY[0x1E0C809B0];
        if (!getAFSettingsConnectionClass_softClass_0)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __getAFSettingsConnectionClass_block_invoke_0;
          v41 = &unk_1E4E26900;
          v42 = &v36;
          __getAFSettingsConnectionClass_block_invoke_0((uint64_t)buf);
          v17 = (void *)v37[3];
        }
        v19 = objc_retainAutorelease(v17);
        _Block_object_dispose(&v36, 8);
        v20 = objc_alloc_init(v19);
        v29[0] = v18;
        v29[1] = 3221225472;
        v29[2] = __BYAssistantScreenShouldBeShownInSetupAssistant_block_invoke;
        v29[3] = &unk_1E4E27350;
        v31 = &v32;
        v21 = v16;
        v30 = v21;
        objc_msgSend(v20, "isJustSiriEnabledInTheHome:", v29);
        dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);

        v2 = v28;
      }
    }

    _BYLoggingFacility();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v7;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = ShouldRunForPHSUpgrade;
      _os_log_impl(&dword_1A4E92000, v22, OS_LOG_TYPE_DEFAULT, "Siri enabled: %d, isPHSUpgrade needed: %d", buf, 0xEu);
    }

    if (((v7 ^ 1 | ShouldRunForPHSUpgrade) & 1) != 0)
    {
      if ((v8 & 1) == 0)
        goto LABEL_20;
    }
    else if (((v2 ^ 1 | v4 | v8) & 1) == 0)
    {
LABEL_20:
      objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v23, "isCurrentLocaleNativelySupported");

      _BYLoggingFacility();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localeIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v26;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v9;
        _os_log_impl(&dword_1A4E92000, v24, OS_LOG_TYPE_DEFAULT, "Siri support for current locale \"%{public}@\": %d", buf, 0x12u);

      }
      goto LABEL_28;
    }
    if ((v7 & v4) != 1 || !*((_BYTE *)v33 + 24))
    {
      v9 = 0;
      goto LABEL_30;
    }
    _BYLoggingFacility();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E92000, v24, OS_LOG_TYPE_DEFAULT, "Siri needs to be shown for disclosure", buf, 2u);
    }
    v9 = 1;
LABEL_28:

LABEL_30:
    _Block_object_dispose(&v32, 8);

    goto LABEL_31;
  }
  v9 = 0;
LABEL_31:

  return v9;
}

void sub_1A4EA2818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL BYSetupAssistantIsRunningSilentTokenUpgrade()
{
  return CFPreferencesGetAppBooleanValue(CFSTR("silentTokenUpgradeInProgress"), CFSTR("com.apple.purplebuddy.notbackedup"), 0) != 0;
}

uint64_t Daemon_BYSetupAssistantNeedsToRun()
{
  void *v0;
  void *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (Daemon_BYSetupAssistantNeedsToRun_onceToken != -1)
    dispatch_once(&Daemon_BYSetupAssistantNeedsToRun_onceToken, &__block_literal_global_99);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _BYLaunchLogSubsystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v1, "timeIntervalSinceDate:", v0);
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_1A4E92000, v2, OS_LOG_TYPE_DEFAULT, "Daemon needs-to-run took %fs", (uint8_t *)&v6, 0xCu);
  }

  v4 = Daemon_BYSetupAssistantNeedsToRun_needsToRun;
  return v4;
}

uint64_t Internal_BYSetupAssistantNeedsToRun()
{
  void *v0;
  int v1;
  NSObject *v2;
  const char *v3;
  int v4;
  _BOOL4 v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v10;
  const char *v11;
  _BOOL4 v12;
  void *v13;
  int v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  int v18;
  const char *v19;
  void *v20;
  int v21;
  int AppBooleanValue;
  _BOOL4 v23;
  uint8_t v24[16];

  +[BYPreferencesController buddyPreferencesInternal](BYPreferencesController, "buddyPreferencesInternal");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("ForceNoBuddy"));

  if (v1)
  {
    _BYLaunchLogSubsystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      v3 = "BYSetupAssistantNeedsToRun is NO due to ForceNoBuddy.";
LABEL_17:
      _os_log_impl(&dword_1A4E92000, v2, OS_LOG_TYPE_DEFAULT, v3, v24, 2u);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (_isSupportedDeviceClass_onceToken != -1)
    dispatch_once(&_isSupportedDeviceClass_onceToken, &__block_literal_global_137);
  if (!_isSupportedDeviceClass_isSupported)
  {
    _BYLaunchLogSubsystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      v3 = "BYSetupAssistantNeedsToRun is NO due to unsupported device class.";
      goto LABEL_17;
    }
LABEL_18:

    return 0;
  }
  if (_isAudioAccessory_onceToken != -1)
    dispatch_once(&_isAudioAccessory_onceToken, &__block_literal_global_142);
  v4 = _isAudioAccessory_isAudioAccessory;
  v5 = _BOOLeanPrefVal(CFSTR("SetupDone"), CFSTR("com.apple.purplebuddy"));
  v6 = v5;
  if (!v4)
  {
    if (!v5)
    {
      _BYLaunchLogSubsystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        v11 = "BYSetupAssistantNeedsToRun is YES because !setupDone";
        goto LABEL_30;
      }
LABEL_31:

      return 1;
    }
    if (_isAppleTV_onceToken != -1)
      dispatch_once(&_isAppleTV_onceToken, &__block_literal_global_143);
    if (_isAppleTV_isAppleTV)
    {
      if (_setupAssistantIntPrefVal(CFSTR("TVSetupVersion")) > 0xE)
      {
        if (CFPreferencesGetAppBooleanValue(CFSTR("TVBuddyCompletedSuccessfully"), CFSTR("com.apple.purplebuddy"), 0))
          return 0;
        _BYLaunchLogSubsystem();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v24 = 0;
          v11 = "BYSetupAssistantNeedstoRun is YES because !TVBuddyCompletedSuccessfully";
          goto LABEL_30;
        }
      }
      else
      {
        _BYLaunchLogSubsystem();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v24 = 0;
          v11 = "BYSetupAssistantNeedsToRun is YES to show upgrade mini buddy";
LABEL_30:
          _os_log_impl(&dword_1A4E92000, v10, OS_LOG_TYPE_DEFAULT, v11, v24, 2u);
          goto LABEL_31;
        }
      }
      goto LABEL_31;
    }
    v12 = +[BYManagedAppleIDBootstrap isMultiUser](BYManagedAppleIDBootstrap, "isMultiUser");
    +[BYManagedAppleIDBootstrap sharedManager](BYManagedAppleIDBootstrap, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isLoginUser");

    if (v14)
    {
      _BYLaunchLogSubsystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
LABEL_36:
        v8 = 0;
LABEL_91:

        return v8;
      }
      *(_WORD *)v24 = 0;
      v16 = "BYSetupAssistantNeedsToRun is NO for login window in multi-user.";
LABEL_35:
      _os_log_impl(&dword_1A4E92000, v15, OS_LOG_TYPE_DEFAULT, v16, v24, 2u);
      goto LABEL_36;
    }
    +[BYManagedAppleIDBootstrap sharedManager](BYManagedAppleIDBootstrap, "sharedManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "passwordChangeFlowNeedsToRun");

    if (v18)
    {
      _BYLaunchLogSubsystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        v19 = "BYSetupAssistantNeedsToRun is YES for password change requirement";
LABEL_89:
        _os_log_impl(&dword_1A4E92000, v15, OS_LOG_TYPE_DEFAULT, v19, v24, 2u);
      }
    }
    else if (objc_msgSend(MEMORY[0x1E0D1C1E8], "awaitUserConfigurationEnabled"))
    {
      _BYLaunchLogSubsystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        v19 = "BYSetupAssistantNeedsToRun is YES to await user configuration";
        goto LABEL_89;
      }
    }
    else
    {
      if (v12)
      {
        _BYLaunchLogSubsystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          goto LABEL_36;
        *(_WORD *)v24 = 0;
        v16 = "BYSetupAssistantNeedsToRun is NO for multi-user with NO password change requirement.";
        goto LABEL_35;
      }
      objc_msgSend(getMCProfileConnectionClass(), "sharedConnection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "shouldShowSetupAssistant");

      if (v21)
      {
        _BYLaunchLogSubsystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v24 = 0;
          v19 = "BYSetupAssistantNeedsToRun is YES because ManagedConfiguration says so";
          goto LABEL_89;
        }
      }
      else
      {
        if (_setupAssistantIntPrefVal(CFSTR("SetupVersion")) <= 0xA)
        {
          AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("StoreDemoMode"), CFSTR("com.apple.demo-settings"), 0);
          _BYLaunchLogSubsystem();
          v15 = objc_claimAutoreleasedReturnValue();
          v23 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
          if (!AppBooleanValue)
          {
            if (v23)
            {
              *(_WORD *)v24 = 0;
              v19 = "BYSetupAssistantNeedsToRun is YES to show upgrade mini buddy";
              goto LABEL_89;
            }
            goto LABEL_90;
          }
          if (v23)
          {
            *(_WORD *)v24 = 0;
            _os_log_impl(&dword_1A4E92000, v15, OS_LOG_TYPE_DEFAULT, "BYSetupAssistantNeedsToRun ignoring out of date Buddy version for store demo mode", v24, 2u);
          }

        }
        if (_BOOLeanPrefVal(CFSTR("ShouldRunKeychainSyncMiniBuddy"), CFSTR("com.apple.purplebuddy.notbackedup")))
        {
          _BYLaunchLogSubsystem();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v24 = 0;
            v19 = "BYSetupAssistantNeedsToRun is YES to show keychain sync mini buddy";
            goto LABEL_89;
          }
        }
        else if (_BOOLeanPrefVal(CFSTR("ShouldRunMesaMiniBuddy"), CFSTR("com.apple.purplebuddy.notbackedup")))
        {
          _BYLaunchLogSubsystem();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v24 = 0;
            v19 = "BYSetupAssistantNeedsToRun is YES to show mesa mini buddy";
            goto LABEL_89;
          }
        }
        else if (_BOOLeanPrefVal(CFSTR("ShouldRunPaymentMiniBuddy"), CFSTR("com.apple.purplebuddy.notbackedup")))
        {
          _BYLaunchLogSubsystem();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v24 = 0;
            v19 = "BYSetupAssistantNeedsToRun is YES to show stockholm buddy";
            goto LABEL_89;
          }
        }
        else if (_BOOLeanPrefVal(CFSTR("ShouldRunDiagnosticsMiniBuddy"), CFSTR("com.apple.purplebuddy.notbackedup")))
        {
          _BYLaunchLogSubsystem();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v24 = 0;
            v19 = "BYSetupAssistantNeedsToRun is YES to show diagnostics buddy";
            goto LABEL_89;
          }
        }
        else if (_BOOLeanPrefVal(CFSTR("ShouldRunCombinedDiagnosticsMismatchMiniBuddy"), CFSTR("com.apple.purplebuddy.notbackedup")))
        {
          _BYLaunchLogSubsystem();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v24 = 0;
            v19 = "BYSetupAssistantNeedsToRun is YES to show combined diagnostics mismatch buddy";
            goto LABEL_89;
          }
        }
        else if (_BOOLeanPrefVal(CFSTR("ShouldRunHSA2MiniBuddy"), CFSTR("com.apple.purplebuddy.notbackedup")))
        {
          _BYLaunchLogSubsystem();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v24 = 0;
            v19 = "BYSetupAssistantNeedsToRun is YES to show HSA2 buddy";
            goto LABEL_89;
          }
        }
        else if (_BOOLeanPrefVal(CFSTR("ShouldRunStoreDemoDeviceMiniBuddy"), CFSTR("com.apple.purplebuddy.notbackedup")))
        {
          _BYLaunchLogSubsystem();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v24 = 0;
            v19 = "BYSetupAssistantNeedsToRun is YES to show post demo restore buddy";
            goto LABEL_89;
          }
        }
        else if (_BOOLeanPrefVal(CFSTR("ShouldRunStolenDeviceProtectionMiniBuddy"), CFSTR("com.apple.purplebuddy.notbackedup")))
        {
          _BYLaunchLogSubsystem();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v24 = 0;
            v19 = "BYSetupAssistantNeedsToRun is YES to show stolen device protection buddy";
            goto LABEL_89;
          }
        }
        else
        {
          if (!_BOOLeanPrefVal(CFSTR("ShouldRunStandardMiniBuddy"), CFSTR("com.apple.purplebuddy.notbackedup")))
          {
            if (!_BOOLeanPrefVal(CFSTR("ShouldRunRestoreSIMSetupMiniBuddy"), CFSTR("com.apple.purplebuddy.notbackedup")))return 0;
            _BYLaunchLogSubsystem();
            v15 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              goto LABEL_90;
            *(_WORD *)v24 = 0;
            v19 = "BYSetupAssistantNeedsToRun is YES to show SIMSetup after restore";
            goto LABEL_89;
          }
          _BYLaunchLogSubsystem();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v24 = 0;
            v19 = "BYSetupAssistantNeedsToRun is YES to show standard mini-buddy";
            goto LABEL_89;
          }
        }
      }
    }
LABEL_90:
    v8 = 1;
    goto LABEL_91;
  }
  if (!v5)
  {
    _BYLaunchLogSubsystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1A4E92000, v7, OS_LOG_TYPE_DEFAULT, "Audio BYSetupAssistantNeedsToRun is YES because !setupDone", v24, 2u);
    }

  }
  return !v6;
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

uint64_t BYClearLaunchSentinel()
{
  NSObject *v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v4[8];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  _BYLaunchLogSubsystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A4E92000, v0, OS_LOG_TYPE_DEFAULT, "Clear Launch Sentinel", v4, 2u);
  }

  if (LaunchSentinelExists() && sem_unlink("purplebuddy.sentinel"))
  {
    _BYLaunchLogSubsystem();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      BYClearLaunchSentinel_cold_1();
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v1 = objc_claimAutoreleasedReturnValue();
    v5[0] = v1;
    v5[1] = &unk_1E4E34488;
    CFPreferencesSetAppValue(CFSTR("lastPrepareLaunchSentinel"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2), CFSTR("com.apple.purplebuddy"));
    v2 = 1;
  }

  return v2;
}

uint64_t BYSetLaunchSentinel(BOOL *a1)
{
  BOOL v2;
  BOOL v3;
  NSObject *v4;
  sem_t *v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t buf[8];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = LaunchSentinelExists();
  v3 = v2;
  if (a1)
    *a1 = v2;
  _BYLaunchLogSubsystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_DEFAULT, "Set Launch Sentinel", buf, 2u);
  }

  if (v3)
    goto LABEL_8;
  v5 = sem_open("purplebuddy.sentinel", 512, 292, 1);
  if (v5 != (sem_t *)-1)
  {
    sem_close(v5);
LABEL_8:
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    v10[1] = &unk_1E4E344A0;
    CFPreferencesSetAppValue(CFSTR("lastPrepareLaunchSentinel"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2), CFSTR("com.apple.purplebuddy"));
    v7 = 1;
    goto LABEL_9;
  }
  _BYLaunchLogSubsystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    BYSetLaunchSentinel_cold_1();
  v7 = 0;
LABEL_9:

  return v7;
}

void BYSetupAssistantPrepareLaunchSentinel()
{
  NSObject *v0;
  pid_t v1;
  void *v2;
  pid_t v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  int v8;
  BYBuddyDaemonGeneralClient *v9;
  void *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  CFUserNotificationRef v15;
  void *v16;
  NSObject *v17;
  BYBuddyDaemonGeneralClient *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  BOOL v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  pid_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  _BYLaunchLogSubsystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = getpid();
    BYProcessNameForPID(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = getpid();
    NSUserName();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v27 = v2;
    v28 = 1024;
    v29 = v3;
    v30 = 2112;
    v31 = v4;
    _os_log_impl(&dword_1A4E92000, v0, OS_LOG_TYPE_DEFAULT, "Prepare launch sentinel from %{public}@[%i] for user '%@'", buf, 0x1Cu);

  }
  if (+[BYManagedAppleIDBootstrap isMultiUser](BYManagedAppleIDBootstrap, "isMultiUser")
    || CFPreferencesGetAppBooleanValue(CFSTR("daemonizeNeedsToRun"), CFSTR("com.apple.purplebuddy"), 0))
  {
    +[BYManagedAppleIDBootstrap sharedManager](BYManagedAppleIDBootstrap, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isLoginUser");

    if (v6)
    {
      _BYLaunchLogSubsystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4E92000, v7, OS_LOG_TYPE_DEFAULT, "In login window. Buddy does not need to run.", buf, 2u);
      }

      v8 = 0;
    }
    else
    {
      v9 = objc_alloc_init(BYBuddyDaemonGeneralClient);
      v8 = -[BYBuddyDaemonGeneralClient setupAssistantNeedsToRun](v9, "setupAssistantNeedsToRun");

    }
  }
  else
  {
    v8 = Internal_BYSetupAssistantNeedsToRun();
  }
  if (!+[BFFSettingsManager hasStashedValuesOnDisk](BFFSettingsManager, "hasStashedValuesOnDisk"))
  {
LABEL_20:
    if (v8)
    {
      BYClearLaunchSentinel();
      +[BYSetupStateNotifier sharedNotifier](BYSetupStateNotifier, "sharedNotifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "notifySetupShouldRemainAlive");
    }
    else
    {
      dispatch_get_global_queue(9, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v17, &__block_literal_global_119);

      if (_BOOLeanPrefVal(CFSTR("SilentICDPUpgrade"), CFSTR("com.apple.purplebuddy.notbackedup")))
      {
        v18 = objc_alloc_init(BYBuddyDaemonGeneralClient);
        -[BYBuddyDaemonGeneralClient performSilentICDPUpgrade](v18, "performSilentICDPUpgrade");
        CFPreferencesSetAppValue(CFSTR("SilentICDPUpgrade"), 0, CFSTR("com.apple.purplebuddy.notbackedup"));
        CFPreferencesAppSynchronize(CFSTR("com.apple.purplebuddy.notbackedup"));

      }
      v25 = 0;
      BYSetLaunchSentinel(&v25);
      if (v25)
        goto LABEL_32;
      _BYLaunchLogSubsystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4E92000, v19, OS_LOG_TYPE_DEFAULT, "Posting Buddy finished", buf, 2u);
      }

      +[BYSetupStateNotifier sharedNotifier](BYSetupStateNotifier, "sharedNotifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "notifyStateChangedTo:", 2);

      +[BYSetupStateManager sharedManager](BYSetupStateManager, "sharedManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "didRestoreFromBackup");

      if (!v22)
        goto LABEL_32;
      _BYLoggingFacility();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4E92000, v23, OS_LOG_TYPE_DEFAULT, "Silently marking MC as finished", buf, 2u);
      }

      objc_msgSend(getMCProfileConnectionClass(), "sharedConnection");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setupAssistantDidFinish");

      +[BYSetupStateManager sharedManager](BYSetupStateManager, "sharedManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "clearRestoreType");
    }

LABEL_32:
    CFPreferencesAppSynchronize(CFSTR("com.apple.purplebuddy"));
    kdebug_trace();
    return;
  }
  +[BYPreferencesController buddyPreferencesInternal](BYPreferencesController, "buddyPreferencesInternal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLForKey:", CFSTR("DoNotRemoveStash"));

  _BYLoggingFacility();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!v11)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E92000, v12, OS_LOG_TYPE_DEFAULT, "Detected safe haven on disk; forcibly removing!",
        buf,
        2u);
    }

    +[BFFSettingsManager removeSafeHaven](BFFSettingsManager, "removeSafeHaven");
    +[BFFSettingsManager postDidRestoreSafeHavenNotification](BFFSettingsManager, "postDidRestoreSafeHavenNotification");
    if (MGGetBoolAnswer())
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("Setup Assistant found unexpected restore data"), *MEMORY[0x1E0C9B800]);
      objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("Please file a radar to PEP Setup Assistant | 1.0."), *MEMORY[0x1E0C9B810]);
      v15 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 0, 0, (CFDictionaryRef)v14);
      CFRelease(v15);

    }
    goto LABEL_20;
  }
  if (v13)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E92000, v12, OS_LOG_TYPE_DEFAULT, "Not removing safe haven stash (default set)", buf, 2u);
  }

}

BOOL _BOOLeanPrefVal(void *a1, void *a2)
{
  const __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  const __CFBoolean *v6;
  _BOOL8 v7;

  v3 = (const __CFString *)*MEMORY[0x1E0C9B250];
  v4 = a2;
  v5 = a1;
  CFPreferencesSynchronize(v4, CFSTR("mobile"), v3);
  v6 = (const __CFBoolean *)CFPreferencesCopyValue(v5, v4, CFSTR("mobile"), v3);

  if (!v6)
    return 0;
  v7 = CFBooleanGetValue(v6) != 0;
  CFRelease(v6);
  return v7;
}

id getMCProfileConnectionClass()
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
  v0 = (void *)getMCProfileConnectionClass_softClass_0;
  v7 = getMCProfileConnectionClass_softClass_0;
  if (!getMCProfileConnectionClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getMCProfileConnectionClass_block_invoke_0;
    v3[3] = &unk_1E4E26900;
    v3[4] = &v4;
    __getMCProfileConnectionClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A4EA3CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void BYSetupAssistantEnsureSilentLoginUpgrade()
{
  BYBuddyDaemonGeneralClient *v0;

  if (+[BYManagedAppleIDBootstrap isMultiUser](BYManagedAppleIDBootstrap, "isMultiUser")
    || CFPreferencesGetAppBooleanValue(CFSTR("daemonizeNeedsToRun"), CFSTR("com.apple.purplebuddy"), 0))
  {
    v0 = objc_alloc_init(BYBuddyDaemonGeneralClient);
    -[BYBuddyDaemonGeneralClient ensureSilentLoginUpgrade](v0, "ensureSilentLoginUpgrade");

  }
}

void BYSetupAssistantEnsureShortLivedTokenUpgrade()
{
  BYBuddyDaemonGeneralClient *v0;

  if (+[BYManagedAppleIDBootstrap isMultiUser](BYManagedAppleIDBootstrap, "isMultiUser")
    || CFPreferencesGetAppBooleanValue(CFSTR("daemonizeNeedsToRun"), CFSTR("com.apple.purplebuddy"), 0))
  {
    v0 = objc_alloc_init(BYBuddyDaemonGeneralClient);
    -[BYBuddyDaemonGeneralClient ensureShortLivedTokenUpgrade](v0, "ensureShortLivedTokenUpgrade");

  }
}

void BYObserveFinishSetupTriggers()
{
  BYBuddyDaemonGeneralClient *v0;

  v0 = objc_alloc_init(BYBuddyDaemonGeneralClient);
  -[BYBuddyDaemonGeneralClient observeFinishSetupTriggers](v0, "observeFinishSetupTriggers");

}

void BYSetupAssistantCreateAuthContext(void *a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[8];
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  _BYLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E92000, v2, OS_LOG_TYPE_DEFAULT, "Creating and storing context for biometric...", buf, 2u);
  }

  v8 = &unk_1E4E344B8;
  v9[0] = &unk_1E4E344A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __BYSetupAssistantCreateAuthContext_block_invoke;
  v5[3] = &unk_1E4E273F8;
  v6 = v1;
  v4 = v1;
  +[BYAuthenticationContext createContextWithSecret:policy:options:completion:](BYAuthenticationContext, "createContextWithSecret:policy:options:completion:", v4, 1007, v3, v5);

}

Class __getVTPreferencesClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!VoiceTriggerLibraryCore_frameworkLibrary_0)
  {
    VoiceTriggerLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!VoiceTriggerLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VTPreferences");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getVTPreferencesClass_block_invoke_cold_1();
    free(v3);
  }
  getVTPreferencesClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getAFPreferencesClass_block_invoke_0(uint64_t a1)
{
  AssistantServicesLibrary_0();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AFPreferences");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAFPreferencesClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAFPreferencesClass_block_invoke_cold_1();
    AssistantServicesLibrary_0();
  }
}

void AssistantServicesLibrary_0()
{
  void *v0;

  if (!AssistantServicesLibraryCore_frameworkLibrary_0)
    AssistantServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!AssistantServicesLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getSSRVoiceProfileManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SpeakerRecognitionLibraryCore_frameworkLibrary)
  {
    SpeakerRecognitionLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SpeakerRecognitionLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SSRVoiceProfileManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSSRVoiceProfileManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getSSRVoiceProfileManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAFSettingsConnectionClass_block_invoke_0(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AssistantServicesLibrary_0();
  result = objc_getClass("AFSettingsConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAFSettingsConnectionClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getAFSettingsConnectionClass_block_invoke_cold_1();
    return (Class)___isSupportedDeviceClass_block_invoke(v3);
  }
  return result;
}

uint64_t ___isSupportedDeviceClass_block_invoke()
{
  uint64_t result;
  BOOL v2;

  result = MGGetSInt32Answer();
  v2 = (_DWORD)result == 7 || (result - 1) < 4;
  _isSupportedDeviceClass_isSupported = v2;
  return result;
}

uint64_t ___isAudioAccessory_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  _isAudioAccessory_isAudioAccessory = (_DWORD)result == 7;
  return result;
}

uint64_t ___isAppleTV_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  _isAppleTV_isAppleTV = (_DWORD)result == 4;
  return result;
}

uint64_t _setupAssistantIntPrefVal(void *a1)
{
  const __CFString *v1;
  __CFString *v2;
  const __CFNumber *v3;
  uint64_t v4;
  unsigned int valuePtr;

  v1 = (const __CFString *)*MEMORY[0x1E0C9B250];
  v2 = a1;
  CFPreferencesSynchronize(CFSTR("com.apple.purplebuddy"), CFSTR("mobile"), v1);
  v3 = (const __CFNumber *)CFPreferencesCopyValue(v2, CFSTR("com.apple.purplebuddy"), CFSTR("mobile"), v1);

  if (!v3)
    return 0;
  valuePtr = 0;
  if (CFNumberGetValue(v3, kCFNumberIntType, &valuePtr))
    v4 = valuePtr;
  else
    v4 = 0;
  CFRelease(v3);
  return v4;
}

Class __getMCProfileConnectionClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ManagedConfigurationLibraryCore_frameworkLibrary_0)
  {
    ManagedConfigurationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!ManagedConfigurationLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("MCProfileConnection");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getMCProfileConnectionClass_block_invoke_cold_1();
    free(v3);
  }
  getMCProfileConnectionClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  NSObject *v5;

  _os_log_error_impl(a1, v5, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1A4EA4914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EA4F10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_1A4EA5D2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EA6160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EA6734(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
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

void sub_1A4EA97E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4EA9928(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getWFClientClass()
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
  v0 = (void *)getWFClientClass_softClass;
  v7 = getWFClientClass_softClass;
  if (!getWFClientClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getWFClientClass_block_invoke;
    v3[3] = &unk_1E4E26900;
    v3[4] = &v4;
    __getWFClientClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A4EAB83C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EABCF8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
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

Class __getWFClientClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!WiFiKitLibraryCore_frameworkLibrary)
  {
    WiFiKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!WiFiKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("WFClient");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getWFClientClass_block_invoke_cold_1();
    free(v3);
  }
  getWFClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A4EACCC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EACDA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EADEC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose((const void *)(v37 - 160), 8);
  _Block_object_dispose(&a37, 8);
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

void sub_1A4EAEBB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAALoginContextTransientStorageClass()
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
  v0 = (void *)getAALoginContextTransientStorageClass_softClass;
  v7 = getAALoginContextTransientStorageClass_softClass;
  if (!getAALoginContextTransientStorageClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAALoginContextTransientStorageClass_block_invoke;
    v3[3] = &unk_1E4E26900;
    v3[4] = &v4;
    __getAALoginContextTransientStorageClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A4EAEE40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAALoginPluginManagerClass_block_invoke(uint64_t a1)
{
  AppleAccountLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AALoginPluginManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAALoginPluginManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAALoginPluginManagerClass_block_invoke_cold_1();
    AppleAccountLibrary();
  }
}

void AppleAccountLibrary()
{
  void *v0;

  if (!AppleAccountLibraryCore_frameworkLibrary_0)
    AppleAccountLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!AppleAccountLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getAASetupAssistantServiceClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AppleAccountLibrary();
  result = objc_getClass("AASetupAssistantService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAASetupAssistantServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getAASetupAssistantServiceClass_block_invoke_cold_1();
    return (Class)__getACAccountStoreClass_block_invoke_0(v3);
  }
  return result;
}

Class __getACAccountStoreClass_block_invoke_0(uint64_t a1)
{
  Class result;

  AccountsLibrary();
  result = objc_getClass("ACAccountStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getACAccountStoreClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getACAccountStoreClass_block_invoke_cold_1();
    return (Class)AccountsLibrary();
  }
  return result;
}

uint64_t AccountsLibrary()
{
  uint64_t v0;
  void *v2;

  if (!AccountsLibraryCore_frameworkLibrary_0)
    AccountsLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  v0 = AccountsLibraryCore_frameworkLibrary_0;
  if (!AccountsLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void __getCDPContextClass_block_invoke(uint64_t a1)
{
  CoreCDPLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CDPContext");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCDPContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCDPContextClass_block_invoke_cold_1();
    CoreCDPLibrary();
  }
}

void CoreCDPLibrary()
{
  void *v0;

  if (!CoreCDPLibraryCore_frameworkLibrary)
    CoreCDPLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CoreCDPLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getCDPStateControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  CoreCDPLibrary();
  result = objc_getClass("CDPStateController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCDPStateControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getCDPStateControllerClass_block_invoke_cold_1();
    return (Class)__getAALoginContextTransientStorageClass_block_invoke(v3);
  }
  return result;
}

Class __getAALoginContextTransientStorageClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;

  AppleAccountLibrary();
  result = objc_getClass("AALoginContextTransientStorage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAALoginContextTransientStorageClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getAALoginContextTransientStorageClass_block_invoke_cold_1();
    return (Class)+[BYWarranty shouldDisplay](v3, v4);
  }
  return result;
}

id BYStringForFlowItemDispositions(uint64_t a1)
{
  id v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = v2;
  if (!a1)
  {
    v4 = CFSTR("none");
LABEL_12:
    objc_msgSend(v3, "addObject:", v4);
    goto LABEL_13;
  }
  if ((a1 & 2) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("not chosen"));
    if ((a1 & 4) == 0)
    {
LABEL_4:
      if ((a1 & 8) == 0)
        goto LABEL_5;
      goto LABEL_10;
    }
  }
  else if ((a1 & 4) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v3, "addObject:", CFSTR("myself"));
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_11;
  }
LABEL_10:
  objc_msgSend(v3, "addObject:", CFSTR("guardian"));
  if ((a1 & 0x10) != 0)
  {
LABEL_11:
    v4 = CFSTR("child");
    goto LABEL_12;
  }
LABEL_13:
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_1A4EAF9EC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 80));
  _Unwind_Resume(a1);
}

void sub_1A4EB02AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t BYBackupMetadataReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  char v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  char v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  char v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  char v65;
  unsigned int v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char v70;
  char v71;
  unsigned int v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  char v76;
  char v77;
  unsigned int v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  char v82;
  char v83;
  unsigned int v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char v88;
  char v89;
  unsigned int v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char v94;
  char v95;
  unsigned int v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  char v100;
  char v101;
  unsigned int v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  char v106;
  char v107;
  unsigned int v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  char v112;
  void *v113;
  uint64_t v114;
  BOOL v115;
  uint64_t v116;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
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
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
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
              goto LABEL_142;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_144;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_142:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_144:
          v114 = 80;
          goto LABEL_157;
        case 2u:
          PBReaderReadData();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 40;
          goto LABEL_140;
        case 3u:
          v26 = 0;
          v27 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 108) |= 8u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v19 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_148;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_148:
          v114 = 32;
          goto LABEL_157;
        case 4u:
          v31 = 0;
          v32 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 108) |= 4u;
          while (2)
          {
            v33 = *v3;
            v34 = *(_QWORD *)(a2 + v33);
            if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
              *(_QWORD *)(a2 + v33) = v34 + 1;
              v19 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                v14 = v32++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_152;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_152:
          v114 = 28;
          goto LABEL_157;
        case 5u:
          v36 = 0;
          v37 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 108) |= 2u;
          while (2)
          {
            v38 = *v3;
            v39 = *(_QWORD *)(a2 + v38);
            if (v39 == -1 || v39 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
              *(_QWORD *)(a2 + v38) = v39 + 1;
              v19 |= (unint64_t)(v40 & 0x7F) << v36;
              if (v40 < 0)
              {
                v36 += 7;
                v14 = v37++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_156;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_156:
          v114 = 24;
LABEL_157:
          *(_DWORD *)(a1 + v114) = v19;
          continue;
        case 6u:
          v41 = 0;
          v42 = 0;
          v43 = 0;
          *(_WORD *)(a1 + 108) |= 0x100u;
          while (2)
          {
            v44 = *v3;
            v45 = *(_QWORD *)(a2 + v44);
            if (v45 == -1 || v45 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v46 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v45);
              *(_QWORD *)(a2 + v44) = v45 + 1;
              v43 |= (unint64_t)(v46 & 0x7F) << v41;
              if (v46 < 0)
              {
                v41 += 7;
                v14 = v42++ >= 9;
                if (v14)
                {
                  v43 = 0;
                  goto LABEL_161;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v43 = 0;
LABEL_161:
          v115 = v43 != 0;
          v116 = 100;
          goto LABEL_206;
        case 7u:
          v47 = 0;
          v48 = 0;
          v49 = 0;
          *(_WORD *)(a1 + 108) |= 0x80u;
          while (2)
          {
            v50 = *v3;
            v51 = *(_QWORD *)(a2 + v50);
            if (v51 == -1 || v51 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v52 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v51);
              *(_QWORD *)(a2 + v50) = v51 + 1;
              v49 |= (unint64_t)(v52 & 0x7F) << v47;
              if (v52 < 0)
              {
                v47 += 7;
                v14 = v48++ >= 9;
                if (v14)
                {
                  v49 = 0;
                  goto LABEL_165;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v49 = 0;
LABEL_165:
          v115 = v49 != 0;
          v116 = 99;
          goto LABEL_206;
        case 8u:
          v53 = 0;
          v54 = 0;
          v55 = 0;
          *(_WORD *)(a1 + 108) |= 0x4000u;
          while (2)
          {
            v56 = *v3;
            v57 = *(_QWORD *)(a2 + v56);
            if (v57 == -1 || v57 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v58 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v57);
              *(_QWORD *)(a2 + v56) = v57 + 1;
              v55 |= (unint64_t)(v58 & 0x7F) << v53;
              if (v58 < 0)
              {
                v53 += 7;
                v14 = v54++ >= 9;
                if (v14)
                {
                  v55 = 0;
                  goto LABEL_169;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v55 = 0;
LABEL_169:
          v115 = v55 != 0;
          v116 = 106;
          goto LABEL_206;
        case 9u:
          v59 = 0;
          v60 = 0;
          v61 = 0;
          *(_WORD *)(a1 + 108) |= 0x400u;
          while (2)
          {
            v62 = *v3;
            v63 = *(_QWORD *)(a2 + v62);
            if (v63 == -1 || v63 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v64 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v63);
              *(_QWORD *)(a2 + v62) = v63 + 1;
              v61 |= (unint64_t)(v64 & 0x7F) << v59;
              if (v64 < 0)
              {
                v59 += 7;
                v14 = v60++ >= 9;
                if (v14)
                {
                  v61 = 0;
                  goto LABEL_173;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v61 = 0;
LABEL_173:
          v115 = v61 != 0;
          v116 = 102;
          goto LABEL_206;
        case 0xAu:
          v65 = 0;
          v66 = 0;
          v67 = 0;
          *(_WORD *)(a1 + 108) |= 0x20u;
          while (2)
          {
            v68 = *v3;
            v69 = *(_QWORD *)(a2 + v68);
            if (v69 == -1 || v69 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v70 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v69);
              *(_QWORD *)(a2 + v68) = v69 + 1;
              v67 |= (unint64_t)(v70 & 0x7F) << v65;
              if (v70 < 0)
              {
                v65 += 7;
                v14 = v66++ >= 9;
                if (v14)
                {
                  v67 = 0;
                  goto LABEL_177;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v67 = 0;
LABEL_177:
          v115 = v67 != 0;
          v116 = 97;
          goto LABEL_206;
        case 0xBu:
          v71 = 0;
          v72 = 0;
          v73 = 0;
          *(_WORD *)(a1 + 108) |= 0x40u;
          while (2)
          {
            v74 = *v3;
            v75 = *(_QWORD *)(a2 + v74);
            if (v75 == -1 || v75 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v76 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v75);
              *(_QWORD *)(a2 + v74) = v75 + 1;
              v73 |= (unint64_t)(v76 & 0x7F) << v71;
              if (v76 < 0)
              {
                v71 += 7;
                v14 = v72++ >= 9;
                if (v14)
                {
                  v73 = 0;
                  goto LABEL_181;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v73 = 0;
LABEL_181:
          v115 = v73 != 0;
          v116 = 98;
          goto LABEL_206;
        case 0xCu:
          v77 = 0;
          v78 = 0;
          v79 = 0;
          *(_WORD *)(a1 + 108) |= 1u;
          while (2)
          {
            v80 = *v3;
            v81 = *(_QWORD *)(a2 + v80);
            if (v81 == -1 || v81 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v82 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v81);
              *(_QWORD *)(a2 + v80) = v81 + 1;
              v79 |= (unint64_t)(v82 & 0x7F) << v77;
              if (v82 < 0)
              {
                v77 += 7;
                v14 = v78++ >= 9;
                if (v14)
                {
                  v79 = 0;
                  goto LABEL_185;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v79 = 0;
LABEL_185:
          *(_QWORD *)(a1 + 8) = v79;
          continue;
        case 0xDu:
          PBReaderReadData();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 88;
          goto LABEL_140;
        case 0xEu:
          v83 = 0;
          v84 = 0;
          v85 = 0;
          *(_WORD *)(a1 + 108) |= 0x10u;
          while (2)
          {
            v86 = *v3;
            v87 = *(_QWORD *)(a2 + v86);
            if (v87 == -1 || v87 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v88 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v87);
              *(_QWORD *)(a2 + v86) = v87 + 1;
              v85 |= (unint64_t)(v88 & 0x7F) << v83;
              if (v88 < 0)
              {
                v83 += 7;
                v14 = v84++ >= 9;
                if (v14)
                {
                  v85 = 0;
                  goto LABEL_189;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v85 = 0;
LABEL_189:
          v115 = v85 != 0;
          v116 = 96;
          goto LABEL_206;
        case 0xFu:
          v89 = 0;
          v90 = 0;
          v91 = 0;
          *(_WORD *)(a1 + 108) |= 0x2000u;
          while (2)
          {
            v92 = *v3;
            v93 = *(_QWORD *)(a2 + v92);
            if (v93 == -1 || v93 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v94 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v93);
              *(_QWORD *)(a2 + v92) = v93 + 1;
              v91 |= (unint64_t)(v94 & 0x7F) << v89;
              if (v94 < 0)
              {
                v89 += 7;
                v14 = v90++ >= 9;
                if (v14)
                {
                  v91 = 0;
                  goto LABEL_193;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v91 = 0;
LABEL_193:
          v115 = v91 != 0;
          v116 = 105;
          goto LABEL_206;
        case 0x10u:
          PBReaderReadData();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 72;
          goto LABEL_140;
        case 0x11u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 64;
          goto LABEL_140;
        case 0x12u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 48;
          goto LABEL_140;
        case 0x13u:
          v95 = 0;
          v96 = 0;
          v97 = 0;
          *(_WORD *)(a1 + 108) |= 0x200u;
          while (2)
          {
            v98 = *v3;
            v99 = *(_QWORD *)(a2 + v98);
            if (v99 == -1 || v99 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v100 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v99);
              *(_QWORD *)(a2 + v98) = v99 + 1;
              v97 |= (unint64_t)(v100 & 0x7F) << v95;
              if (v100 < 0)
              {
                v95 += 7;
                v14 = v96++ >= 9;
                if (v14)
                {
                  v97 = 0;
                  goto LABEL_197;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v97 = 0;
LABEL_197:
          v115 = v97 != 0;
          v116 = 101;
          goto LABEL_206;
        case 0x14u:
          v101 = 0;
          v102 = 0;
          v103 = 0;
          *(_WORD *)(a1 + 108) |= 0x800u;
          while (2)
          {
            v104 = *v3;
            v105 = *(_QWORD *)(a2 + v104);
            if (v105 == -1 || v105 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v106 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v105);
              *(_QWORD *)(a2 + v104) = v105 + 1;
              v103 |= (unint64_t)(v106 & 0x7F) << v101;
              if (v106 < 0)
              {
                v101 += 7;
                v14 = v102++ >= 9;
                if (v14)
                {
                  v103 = 0;
                  goto LABEL_201;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v103 = 0;
LABEL_201:
          v115 = v103 != 0;
          v116 = 103;
          goto LABEL_206;
        case 0x15u:
          v107 = 0;
          v108 = 0;
          v109 = 0;
          *(_WORD *)(a1 + 108) |= 0x1000u;
          break;
        case 0x16u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 56;
          goto LABEL_140;
        case 0x17u:
          PBReaderReadData();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 16;
LABEL_140:
          v113 = *(void **)(a1 + v25);
          *(_QWORD *)(a1 + v25) = v24;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v110 = *v3;
        v111 = *(_QWORD *)(a2 + v110);
        if (v111 == -1 || v111 >= *(_QWORD *)(a2 + *v4))
          break;
        v112 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v111);
        *(_QWORD *)(a2 + v110) = v111 + 1;
        v109 |= (unint64_t)(v112 & 0x7F) << v107;
        if ((v112 & 0x80) == 0)
          goto LABEL_203;
        v107 += 7;
        v14 = v108++ >= 9;
        if (v14)
        {
          v109 = 0;
          goto LABEL_205;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_203:
      if (*(_BYTE *)(a2 + *v5))
        v109 = 0;
LABEL_205:
      v115 = v109 != 0;
      v116 = 104;
LABEL_206:
      *(_BYTE *)(a1 + v116) = v115;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id BYDataStashCreate()
{
  BYBuddyDaemonGeneralClient *v0;
  void *v1;

  v0 = objc_alloc_init(BYBuddyDaemonGeneralClient);
  -[BYBuddyDaemonGeneralClient backupMetadata](v0, "backupMetadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id BYDaemonCreateMetadataArchive()
{
  NSObject *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  dispatch_time_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  objc_class *v23;
  dispatch_semaphore_t v24;
  id v25;
  dispatch_semaphore_t v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  dispatch_time_t v31;
  NSObject *v32;
  dispatch_semaphore_t v33;
  void *v34;
  objc_class *v35;
  id v36;
  NSObject *v37;
  dispatch_time_t v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  id v42;
  void *v43;
  objc_class *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  BYSeedProgramManager *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  dispatch_semaphore_t dsema;
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  NSObject *v74;
  _QWORD block[4];
  NSObject *v76;
  id v77;
  _QWORD v78[4];
  id v79;
  dispatch_semaphore_t v80;
  uint8_t v81[8];
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint8_t *v85;
  __int128 *p_buf;
  uint8_t v87[8];
  uint8_t *v88;
  uint64_t v89;
  uint64_t v90;
  __int128 buf;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, uint64_t);
  uint8_t *v94;
  uint8_t *v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  _BYLoggingFacility();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1A4E92000, v0, OS_LOG_TYPE_DEFAULT, "BYDataStash: Creating backup metadata...", (uint8_t *)&buf, 2u);
  }

  v1 = (void *)objc_opt_new();
  objc_msgSend(v1, "setVersion:", 3);
  *(_QWORD *)v81 = 0;
  v82 = (uint64_t)v81;
  v83 = 0x2050000000;
  v2 = (void *)getNRMigratorClass_softClass;
  v84 = (void *)getNRMigratorClass_softClass;
  v3 = MEMORY[0x1E0C809B0];
  if (!getNRMigratorClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v92 = (uint64_t)__getNRMigratorClass_block_invoke;
    v93 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E4E26900;
    v94 = v81;
    __getNRMigratorClass_block_invoke((uint64_t)&buf);
    v2 = *(void **)(v82 + 24);
  }
  v4 = objc_retainAutorelease(v2);
  _Block_object_dispose(v81, 8);
  objc_msgSend(v4, "sharedMigrator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "migrationConsentRequestData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "setNanoRegistryData:", v6);
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setDeviceAnalyticsOptIn:", objc_msgSend(v7, "userBoolValueForSetting:", *MEMORY[0x1E0D46FC0]));

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAppAnalyticsOptIn:", objc_msgSend(v8, "userBoolValueForSetting:", *MEMORY[0x1E0D46EF0]));

  *(_QWORD *)v87 = 0;
  v88 = v87;
  v89 = 0x2020000000;
  v90 = 0;
  v9 = dispatch_semaphore_create(0);
  *(_QWORD *)v81 = 0;
  v82 = (uint64_t)v81;
  v83 = 0x2050000000;
  v10 = (void *)getSBSHardwareButtonServiceClass_softClass;
  v84 = (void *)getSBSHardwareButtonServiceClass_softClass;
  if (!getSBSHardwareButtonServiceClass_softClass)
  {
    *(_QWORD *)&buf = v3;
    *((_QWORD *)&buf + 1) = 3221225472;
    v92 = (uint64_t)__getSBSHardwareButtonServiceClass_block_invoke;
    v93 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E4E26900;
    v94 = v81;
    __getSBSHardwareButtonServiceClass_block_invoke((uint64_t)&buf);
    v10 = *(void **)(v82 + 24);
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(v81, 8);
  objc_msgSend(v11, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = v3;
  *((_QWORD *)&buf + 1) = 3221225472;
  v92 = (uint64_t)___homebuttonHapticType_block_invoke;
  v93 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E4E27B98;
  v95 = v87;
  v13 = v9;
  v94 = (uint8_t *)v13;
  objc_msgSend(v12, "fetchHapticTypeForButtonKind:completion:", 1, &buf);

  v14 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(v13, v14))
  {
    _BYLoggingFacility();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v81 = 0;
      _os_log_impl(&dword_1A4E92000, v15, OS_LOG_TYPE_DEFAULT, "BYDataStash: Failed to fetch home button haptic", v81, 2u);
    }

  }
  v16 = *((_QWORD *)v88 + 3);

  _Block_object_dispose(v87, 8);
  objc_msgSend(v1, "setHomeButtonHapticKind:", v16);
  *(_QWORD *)v81 = 0;
  v82 = (uint64_t)v81;
  v83 = 0x2050000000;
  v17 = (void *)getCLLocationManagerClass_softClass;
  v84 = (void *)getCLLocationManagerClass_softClass;
  if (!getCLLocationManagerClass_softClass)
  {
    *(_QWORD *)&buf = v3;
    *((_QWORD *)&buf + 1) = 3221225472;
    v92 = (uint64_t)__getCLLocationManagerClass_block_invoke;
    v93 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E4E26900;
    v94 = v81;
    __getCLLocationManagerClass_block_invoke((uint64_t)&buf);
    v17 = *(void **)(v82 + 24);
  }
  v18 = objc_retainAutorelease(v17);
  _Block_object_dispose(v81, 8);
  objc_msgSend(v1, "setLocationServicesOptIn:", objc_msgSend(v18, "locationServicesEnabled:", 0));
  *(_QWORD *)v81 = 0;
  v82 = (uint64_t)v81;
  v83 = 0x2050000000;
  v19 = (void *)getAFPreferencesClass_softClass_1;
  v84 = (void *)getAFPreferencesClass_softClass_1;
  if (!getAFPreferencesClass_softClass_1)
  {
    *(_QWORD *)&buf = v3;
    *((_QWORD *)&buf + 1) = 3221225472;
    v92 = (uint64_t)__getAFPreferencesClass_block_invoke_1;
    v93 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E4E26900;
    v94 = v81;
    __getAFPreferencesClass_block_invoke_1((uint64_t)&buf);
    v19 = *(void **)(v82 + 24);
  }
  v20 = objc_retainAutorelease(v19);
  _Block_object_dispose(v81, 8);
  objc_msgSend(v20, "sharedPreferences");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setSiriOptIn:", objc_msgSend(v21, "assistantIsEnabled"));

  *(_QWORD *)v81 = 0;
  v82 = (uint64_t)v81;
  v83 = 0x2050000000;
  v22 = (void *)getAFSettingsConnectionClass_softClass_1;
  v84 = (void *)getAFSettingsConnectionClass_softClass_1;
  if (!getAFSettingsConnectionClass_softClass_1)
  {
    *(_QWORD *)&buf = v3;
    *((_QWORD *)&buf + 1) = 3221225472;
    v92 = (uint64_t)__getAFSettingsConnectionClass_block_invoke_1;
    v93 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E4E26900;
    v94 = v81;
    __getAFSettingsConnectionClass_block_invoke_1((uint64_t)&buf);
    v22 = *(void **)(v82 + 24);
  }
  v23 = objc_retainAutorelease(v22);
  _Block_object_dispose(v81, 8);
  v70 = objc_alloc_init(v23);
  v24 = dispatch_semaphore_create(0);
  v78[0] = v3;
  v78[1] = 3221225472;
  v78[2] = __BYDaemonCreateMetadataArchive_block_invoke;
  v78[3] = &unk_1E4E27B58;
  v25 = v1;
  v79 = v25;
  dsema = v24;
  v80 = dsema;
  objc_msgSend(v70, "getSiriDataSharingOptInStatusWithCompletion:", v78);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v92 = 0x3032000000;
  v93 = __Block_byref_object_copy__7;
  v94 = (uint8_t *)__Block_byref_object_dispose__7;
  v95 = 0;
  v26 = dispatch_semaphore_create(0);
  *(_QWORD *)v87 = 0;
  v88 = v87;
  v89 = 0x2050000000;
  v27 = (void *)getFMDFMIPManagerClass_softClass_0;
  v90 = getFMDFMIPManagerClass_softClass_0;
  if (!getFMDFMIPManagerClass_softClass_0)
  {
    *(_QWORD *)v81 = v3;
    v82 = 3221225472;
    v83 = (uint64_t)__getFMDFMIPManagerClass_block_invoke_0;
    v84 = &unk_1E4E26900;
    v85 = v87;
    __getFMDFMIPManagerClass_block_invoke_0((uint64_t)v81);
    v27 = (void *)*((_QWORD *)v88 + 3);
  }
  v28 = objc_retainAutorelease(v27);
  _Block_object_dispose(v87, 8);
  objc_msgSend(v28, "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)v81 = v3;
  v82 = 3221225472;
  v83 = (uint64_t)___findMyiPhoneOptIn_block_invoke;
  v84 = &unk_1E4E26AA0;
  p_buf = &buf;
  v30 = v26;
  v85 = (uint8_t *)v30;
  objc_msgSend(v29, "fmipStateWithCompletion:", v81);

  v31 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(v30, v31))
  {
    _BYLoggingFacility();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v87 = 0;
      _os_log_impl(&dword_1A4E92000, v32, OS_LOG_TYPE_DEFAULT, "BYDataStash: Failed to fetch FMiP opt-in", v87, 2u);
    }

  }
  v71 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  if (v71)
    objc_msgSend(v25, "setFindMyiPhoneOptIn:", objc_msgSend(v71, "BOOLValue"));
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v92 = 0x3032000000;
  v93 = __Block_byref_object_copy__7;
  v94 = (uint8_t *)__Block_byref_object_dispose__7;
  v95 = 0;
  v33 = dispatch_semaphore_create(0);
  *(_QWORD *)v87 = 0;
  v88 = v87;
  v89 = 0x2050000000;
  v34 = (void *)getSTManagementStateClass_softClass;
  v90 = getSTManagementStateClass_softClass;
  if (!getSTManagementStateClass_softClass)
  {
    *(_QWORD *)v81 = v3;
    v82 = 3221225472;
    v83 = (uint64_t)__getSTManagementStateClass_block_invoke;
    v84 = &unk_1E4E26900;
    v85 = v87;
    __getSTManagementStateClass_block_invoke((uint64_t)v81);
    v34 = (void *)*((_QWORD *)v88 + 3);
  }
  v35 = objc_retainAutorelease(v34);
  _Block_object_dispose(v87, 8);
  v36 = objc_alloc_init(v35);
  *(_QWORD *)v81 = v3;
  v82 = 3221225472;
  v83 = (uint64_t)___screenTimeEnabled_block_invoke;
  v84 = &unk_1E4E27C20;
  p_buf = &buf;
  v37 = v33;
  v85 = (uint8_t *)v37;
  objc_msgSend(v36, "screenTimeStateWithCompletionHandler:", v81);
  v38 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(v37, v38))
  {
    _BYLoggingFacility();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v87 = 0;
      _os_log_impl(&dword_1A4E92000, v39, OS_LOG_TYPE_DEFAULT, "BYDataStash: Failed to fetch Screen Time state", v87, 2u);
    }

  }
  v40 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  if (v40)
    objc_msgSend(v25, "setScreenTimeEnabled:", objc_msgSend(v40, "BOOLValue"));
  dispatch_get_global_queue(21, 0);
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __BYDaemonCreateMetadataArchive_block_invoke_198;
  block[3] = &unk_1E4E27798;
  v41 = (id)objc_claimAutoreleasedReturnValue();
  v76 = v41;
  v42 = v25;
  v77 = v42;
  dispatch_sync(v41, block);
  *(_QWORD *)v81 = 0;
  v82 = (uint64_t)v81;
  v83 = 0x2050000000;
  v43 = (void *)getUISUserInterfaceStyleModeClass_softClass;
  v84 = (void *)getUISUserInterfaceStyleModeClass_softClass;
  if (!getUISUserInterfaceStyleModeClass_softClass)
  {
    *(_QWORD *)&buf = v3;
    *((_QWORD *)&buf + 1) = 3221225472;
    v92 = (uint64_t)__getUISUserInterfaceStyleModeClass_block_invoke;
    v93 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E4E26900;
    v94 = v81;
    __getUISUserInterfaceStyleModeClass_block_invoke((uint64_t)&buf);
    v43 = *(void **)(v82 + 24);
  }
  v44 = objc_retainAutorelease(v43);
  _Block_object_dispose(v81, 8);
  v45 = (void *)objc_msgSend([v44 alloc], "initWithDelegate:", 0);
  if (objc_msgSend(v45, "modeValue"))
  {
    v46 = objc_msgSend(v45, "modeValue");
    if (v46 == 102)
      v47 = 100;
    else
      v47 = v46;
    objc_msgSend(v42, "setUserInterfaceStyleMode:", v47);
  }
  *(_QWORD *)v81 = 0;
  v82 = (uint64_t)v81;
  v83 = 0x2050000000;
  v48 = (void *)getPKPassLibraryClass_softClass;
  v84 = (void *)getPKPassLibraryClass_softClass;
  if (!getPKPassLibraryClass_softClass)
  {
    *(_QWORD *)&buf = v3;
    *((_QWORD *)&buf + 1) = 3221225472;
    v92 = (uint64_t)__getPKPassLibraryClass_block_invoke;
    v93 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E4E26900;
    v94 = v81;
    __getPKPassLibraryClass_block_invoke((uint64_t)&buf);
    v48 = *(void **)(v82 + 24);
  }
  v49 = objc_retainAutorelease(v48);
  _Block_object_dispose(v81, 8);
  objc_msgSend(v49, "sharedInstance");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "backupMetadata");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setWalletData:", v51);

  v72[0] = v3;
  v72[1] = 3221225472;
  v72[2] = __BYDaemonCreateMetadataArchive_block_invoke_2;
  v72[3] = &unk_1E4E27798;
  v52 = v42;
  v73 = v52;
  v53 = v41;
  v74 = v53;
  dispatch_sync(v53, v72);
  v54 = objc_alloc_init(BYSeedProgramManager);
  if (-[BYSeedProgramManager currentSeedProgram](v54, "currentSeedProgram"))
  {
    -[BYSeedProgramManager currentEnrollmentMetadata](v54, "currentEnrollmentMetadata");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "objectForKeyedSubscript:", *MEMORY[0x1E0D8C980]);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setSeedEnrollmentProgram:", v56);

    objc_msgSend(v55, "objectForKeyedSubscript:", *MEMORY[0x1E0D8C978]);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setSeedEnrollmentAssetAudience:", v57);

    objc_msgSend(v55, "objectForKeyedSubscript:", *MEMORY[0x1E0D8C988]);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setSeedEnrollmentCatalogID:", v58);

  }
  +[BYPreferencesController buddyPreferencesInternal](BYPreferencesController, "buddyPreferencesInternal");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "objectForKey:", CFSTR("FakeBetaSeedEnrollmentProgram"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v52, "setSeedEnrollmentProgram:", v60);
  +[BYPreferencesController buddyPreferencesInternal](BYPreferencesController, "buddyPreferencesInternal");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "objectForKey:", CFSTR("FakeBetaSeedEnrollmentAssetAudience"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v52, "setSeedEnrollmentAssetAudience:", v62);
  +[BYPreferencesController buddyPreferencesInternal](BYPreferencesController, "buddyPreferencesInternal");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "objectForKey:", CFSTR("FakeBetaSeedEnrollmentProgramID"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v52, "setSeedEnrollmentCatalogID:", v64);
  objc_msgSend(v52, "setMessagesContactsPresented:", CFPreferencesGetAppBooleanValue(CFSTR("MessagesContactsPresented"), CFSTR("com.apple.purplebuddy"), 0) != 0);
  objc_msgSend(v52, "setSettingsContactsPresented:", CFPreferencesGetAppBooleanValue(CFSTR("SettingsContactsPresented"), CFSTR("com.apple.purplebuddy"), 0) != 0);
  objc_msgSend(v52, "setSettingsDataUsagePresented:", CFPreferencesGetAppBooleanValue(CFSTR("SettingsDataUsagePresented"), CFSTR("com.apple.purplebuddy"), 0) != 0);
  +[BYActionButtonStore currentData](BYActionButtonStore, "currentData");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setActionButtonData:", v65);

  _BYLoggingFacility();
  v66 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v52;
    _os_log_impl(&dword_1A4E92000, v66, OS_LOG_TYPE_DEFAULT, "BYDataStash: Finished creating backup metadata: %@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(v52, "data");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  return v67;
}

void sub_1A4EB548C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EB5698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BYBackupMetadata *BYMetadataCreateWithOptions(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7, unsigned int a8, unsigned __int8 a9, uint64_t a10, void *a11, void *a12, void *a13, unsigned __int8 a14, unsigned __int8 a15, void *a16)
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  BYBackupMetadata *v25;

  v20 = a16;
  v21 = a13;
  v22 = a12;
  v23 = a11;
  v24 = a1;
  v25 = objc_alloc_init(BYBackupMetadata);
  -[BYBackupMetadata setVersion:](v25, "setVersion:", 3);
  -[BYBackupMetadata setNanoRegistryData:](v25, "setNanoRegistryData:", v24);

  -[BYBackupMetadata setDeviceAnalyticsOptIn:](v25, "setDeviceAnalyticsOptIn:", a2);
  -[BYBackupMetadata setAppAnalyticsOptIn:](v25, "setAppAnalyticsOptIn:", a3);
  -[BYBackupMetadata setLocationServicesOptIn:](v25, "setLocationServicesOptIn:", a5);
  -[BYBackupMetadata setSiriOptIn:](v25, "setSiriOptIn:", a6);
  -[BYBackupMetadata setFindMyiPhoneOptIn:](v25, "setFindMyiPhoneOptIn:", a7);
  -[BYBackupMetadata setScreenTimeEnabled:](v25, "setScreenTimeEnabled:", a8);
  -[BYBackupMetadata setAutoUpdateEnabled:](v25, "setAutoUpdateEnabled:", a9);
  -[BYBackupMetadata setUserInterfaceStyleMode:](v25, "setUserInterfaceStyleMode:", a10);
  -[BYBackupMetadata setWalletData:](v25, "setWalletData:", v23);

  -[BYBackupMetadata setSeedEnrollmentProgram:](v25, "setSeedEnrollmentProgram:", v22);
  -[BYBackupMetadata setSeedEnrollmentAssetAudience:](v25, "setSeedEnrollmentAssetAudience:", v21);

  -[BYBackupMetadata setMessagesContactsPresented:](v25, "setMessagesContactsPresented:", a14);
  -[BYBackupMetadata setSettingsDataUsagePresented:](v25, "setSettingsDataUsagePresented:", a15);
  -[BYBackupMetadata setActionButtonData:](v25, "setActionButtonData:", v20);

  return v25;
}

id BYMetadataFromDataArchive(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v7[16];

  v1 = a1;
  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v1);

  if (BYBackupMetadataReadFrom((uint64_t)v2, (uint64_t)v3))
  {
    if (objc_msgSend(v2, "version") <= 2)
    {
      objc_msgSend(v2, "setSiriDataSharingOptIn:", 0);
      objc_msgSend(v2, "setHasSiriDataSharingOptIn:", 0);
    }
    v4 = v2;
  }
  else
  {
    _BYLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_DEFAULT, "BYDataStash: Could not parse data in stash", v7, 2u);
    }

    v4 = 0;
  }

  return v4;
}

id BYMetadataFromBackup(void *a1, uint64_t a2)
{
  void *v2;
  id v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE buf[24];
  void *v23;
  uint64_t *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v5 = (void *)getMBManagerClass_softClass;
  v21 = getMBManagerClass_softClass;
  if (!getMBManagerClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getMBManagerClass_block_invoke;
    v23 = &unk_1E4E26900;
    v24 = &v18;
    __getMBManagerClass_block_invoke((uint64_t)buf);
    v5 = (void *)v19[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v18, 8);
  v7 = objc_alloc_init(v6);
  v17 = 0;
  objc_msgSend(v7, "getBuddyDataStashForBackupUDID:snapshotID:error:", v4, a2, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  if (v9 || !v8)
  {
    _BYLoggingFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v8, "length");
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v13 = 0;
        v14 = v9;
      }
      else if (v9)
      {
        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v9, "domain");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v2, objc_msgSend(v9, "code"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 1;
      }
      else
      {
        v13 = 0;
        v14 = 0;
      }
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v14;
      _os_log_impl(&dword_1A4E92000, v11, OS_LOG_TYPE_DEFAULT, "BYDataStash: Failed to read data stash in backup, data length = %llu, error = %{public}@", buf, 0x16u);
      if (v13)
      {

      }
    }

    v10 = 0;
  }
  else
  {
    BYMetadataFromDataArchive(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void sub_1A4EB5BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNRMigratorClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!NanoRegistryLibraryCore_frameworkLibrary)
  {
    NanoRegistryLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!NanoRegistryLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("NRMigrator");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getNRMigratorClass_block_invoke_cold_1();
    free(v3);
  }
  getNRMigratorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

intptr_t ___homebuttonHapticType_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

Class __getSBSHardwareButtonServiceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SpringBoardServicesLibraryCore_frameworkLibrary_0)
  {
    SpringBoardServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!SpringBoardServicesLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SBSHardwareButtonService");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSBSHardwareButtonServiceClass_block_invoke_cold_1();
    free(v3);
  }
  getSBSHardwareButtonServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCLLocationManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CoreLocationLibraryCore_frameworkLibrary)
  {
    CoreLocationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreLocationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CLLocationManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCLLocationManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getCLLocationManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getAFPreferencesClass_block_invoke_1(uint64_t a1)
{
  AssistantServicesLibrary_1();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AFPreferences");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAFPreferencesClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAFPreferencesClass_block_invoke_cold_1();
    AssistantServicesLibrary_1();
  }
}

void AssistantServicesLibrary_1()
{
  void *v0;

  if (!AssistantServicesLibraryCore_frameworkLibrary_1)
    AssistantServicesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  if (!AssistantServicesLibraryCore_frameworkLibrary_1)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getAFSettingsConnectionClass_block_invoke_1(uint64_t a1)
{
  Class result;
  uint64_t v3;
  uint64_t v4;

  AssistantServicesLibrary_1();
  result = objc_getClass("AFSettingsConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAFSettingsConnectionClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getAFSettingsConnectionClass_block_invoke_cold_1();
    return (Class)__Block_byref_object_copy__7(v3, v4);
  }
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void ___findMyiPhoneOptIn_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v6;
  NSObject *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    _BYLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = _BYIsInternalInstall();
      v9 = v6;
      if ((v8 & 1) == 0)
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "domain");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v3, objc_msgSend(v6, "code"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543362;
      v15 = v9;
      _os_log_impl(&dword_1A4E92000, v7, OS_LOG_TYPE_DEFAULT, "BYDataStash: Could not determine if Find my Phone is enabled: %{public}@", buf, 0xCu);
      if ((v8 & 1) == 0)
      {

      }
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2 == 1);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

Class __getFMDFMIPManagerClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!FindMyDeviceLibraryCore_frameworkLibrary_0)
  {
    FindMyDeviceLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!FindMyDeviceLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("FMDFMIPManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getFMDFMIPManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getFMDFMIPManagerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void ___screenTimeEnabled_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v6;
  NSObject *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    _BYLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = _BYIsInternalInstall();
      v9 = v6;
      if ((v8 & 1) == 0)
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "domain");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v3, objc_msgSend(v6, "code"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543362;
      v15 = v9;
      _os_log_impl(&dword_1A4E92000, v7, OS_LOG_TYPE_DEFAULT, "BYDataStash: Could not determine if ScreenTime is enabled: %{public}@", buf, 0xCu);
      if ((v8 & 1) == 0)
      {

      }
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2 == 2);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

Class __getSTManagementStateClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
  {
    ScreenTimeCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("STManagementState");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSTManagementStateClass_block_invoke_cold_1();
    free(v3);
  }
  getSTManagementStateClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSUManagerClientClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SoftwareUpdateServicesLibraryCore_frameworkLibrary)
  {
    SoftwareUpdateServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SoftwareUpdateServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SUManagerClient");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSUManagerClientClass_block_invoke_cold_1();
    free(v3);
  }
  getSUManagerClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getUISUserInterfaceStyleModeClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!UIKitServicesLibraryCore_frameworkLibrary)
  {
    UIKitServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!UIKitServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("UISUserInterfaceStyleMode");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getUISUserInterfaceStyleModeClass_block_invoke_cold_1();
    free(v3);
  }
  getUISUserInterfaceStyleModeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPKPassLibraryClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!PassKitCoreLibraryCore_frameworkLibrary)
  {
    PassKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!PassKitCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PKPassLibrary");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getPKPassLibraryClass_block_invoke_cold_1();
    free(v3);
  }
  getPKPassLibraryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getMBManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!MobileBackupLibraryCore_frameworkLibrary)
  {
    MobileBackupLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!MobileBackupLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("MBManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getMBManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getMBManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A4EB7658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAFPreferencesClass_0()
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
  v0 = (void *)getAFPreferencesClass_softClass_2;
  v7 = getAFPreferencesClass_softClass_2;
  if (!getAFPreferencesClass_softClass_2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAFPreferencesClass_block_invoke_2;
    v3[3] = &unk_1E4E26900;
    v3[4] = &v4;
    __getAFPreferencesClass_block_invoke_2((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A4EB7724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSSRVoiceProfileManagerClass_0()
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
  v0 = (void *)getSSRVoiceProfileManagerClass_softClass_0;
  v7 = getSSRVoiceProfileManagerClass_softClass_0;
  if (!getSSRVoiceProfileManagerClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSSRVoiceProfileManagerClass_block_invoke_0;
    v3[3] = &unk_1E4E26900;
    v3[4] = &v4;
    __getSSRVoiceProfileManagerClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A4EB77DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAFSettingsConnectionClass()
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
  v0 = (void *)getAFSettingsConnectionClass_softClass_2;
  v7 = getAFSettingsConnectionClass_softClass_2;
  if (!getAFSettingsConnectionClass_softClass_2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAFSettingsConnectionClass_block_invoke_2;
    v3[3] = &unk_1E4E26900;
    v3[4] = &v4;
    __getAFSettingsConnectionClass_block_invoke_2((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A4EB8138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EBA910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCLLocationManagerClass()
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
  v0 = (void *)getCLLocationManagerClass_softClass_0;
  v7 = getCLLocationManagerClass_softClass_0;
  if (!getCLLocationManagerClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCLLocationManagerClass_block_invoke_0;
    v3[3] = &unk_1E4E26900;
    v3[4] = &v4;
    __getCLLocationManagerClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A4EBAB08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EBB04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EBB274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EBB554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EBB72C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void __getAFPreferencesClass_block_invoke_2(uint64_t a1)
{
  AssistantServicesLibrary_2();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AFPreferences");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAFPreferencesClass_softClass_2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAFPreferencesClass_block_invoke_cold_1();
    AssistantServicesLibrary_2();
  }
}

void AssistantServicesLibrary_2()
{
  void *v0;

  if (!AssistantServicesLibraryCore_frameworkLibrary_2)
    AssistantServicesLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  if (!AssistantServicesLibraryCore_frameworkLibrary_2)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getSSRVoiceProfileManagerClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SpeakerRecognitionLibraryCore_frameworkLibrary_0)
  {
    SpeakerRecognitionLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!SpeakerRecognitionLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SSRVoiceProfileManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSSRVoiceProfileManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getSSRVoiceProfileManagerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPKPassLibraryClass_block_invoke_0(uint64_t a1)
{
  Class result;

  PassKitCoreLibrary();
  result = objc_getClass("PKPassLibrary");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPKPassLibraryClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPKPassLibraryClass_block_invoke_cold_1();
    return (Class)PassKitCoreLibrary();
  }
  return result;
}

uint64_t PassKitCoreLibrary()
{
  uint64_t v0;
  void *v2;

  if (!PassKitCoreLibraryCore_frameworkLibrary_0)
    PassKitCoreLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  v0 = PassKitCoreLibraryCore_frameworkLibrary_0;
  if (!PassKitCoreLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getAFSettingsConnectionClass_block_invoke_2(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AssistantServicesLibrary_2();
  result = objc_getClass("AFSettingsConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAFSettingsConnectionClass_softClass_2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getAFSettingsConnectionClass_block_invoke_cold_1();
    return (Class)__getVTPreferencesClass_block_invoke_1(v3);
  }
  return result;
}

Class __getVTPreferencesClass_block_invoke_1(uint64_t a1)
{
  Class result;
  void *v3;

  if (!VoiceTriggerLibraryCore_frameworkLibrary_1)
  {
    VoiceTriggerLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!VoiceTriggerLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VTPreferences");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getVTPreferencesClass_block_invoke_cold_1();
    free(v3);
  }
  getVTPreferencesClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAFVoiceInfoClass_block_invoke_0(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AssistantServicesLibrary_2();
  result = objc_getClass("AFVoiceInfo");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAFVoiceInfoClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getAFVoiceInfoClass_block_invoke_cold_1();
    return (Class)__getCLLocationManagerClass_block_invoke_0(v3);
  }
  return result;
}

Class __getCLLocationManagerClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CoreLocationLibraryCore_frameworkLibrary_0)
  {
    CoreLocationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!CoreLocationLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CLLocationManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCLLocationManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getCLLocationManagerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSTManagementStateClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ScreenTimeCoreLibraryCore_frameworkLibrary_0)
  {
    ScreenTimeCoreLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!ScreenTimeCoreLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("STManagementState");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSTManagementStateClass_block_invoke_cold_1();
    free(v3);
  }
  getSTManagementStateClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSUManagerClientClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SoftwareUpdateServicesLibraryCore_frameworkLibrary_0)
  {
    SoftwareUpdateServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!SoftwareUpdateServicesLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SUManagerClient");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSUManagerClientClass_block_invoke_cold_1();
    free(v3);
  }
  getSUManagerClientClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getNRMigratorClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!NanoRegistryLibraryCore_frameworkLibrary_0)
  {
    NanoRegistryLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!NanoRegistryLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("NRMigrator");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getNRMigratorClass_block_invoke_cold_1();
    free(v3);
  }
  getNRMigratorClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getUISUserInterfaceStyleModeClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!UIKitServicesLibraryCore_frameworkLibrary_0)
  {
    UIKitServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!UIKitServicesLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("UISUserInterfaceStyleMode");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getUISUserInterfaceStyleModeClass_block_invoke_cold_1();
    free(v3);
  }
  getUISUserInterfaceStyleModeClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_4(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  NSObject *v11;

  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0xCu);
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  void *v0;

  return objc_msgSend(v0, "code");
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return _BYIsInternalInstall();
}

void wifidDidBecomeAlive(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  _QWORD v6[6];
  uint8_t buf[16];

  _BYLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_DEFAULT, "Wifi did become alive", buf, 2u);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __wifidDidBecomeAlive_block_invoke;
  v6[3] = &__block_descriptor_48_e5_v8__0l;
  v6[4] = a3;
  v6[5] = a2;
  if (wifidDidBecomeAlive_onceToken != -1)
    dispatch_once(&wifidDidBecomeAlive_onceToken, v6);
}

void scanComplete(uint64_t a1, void *a2, int a3, void *a4)
{
  id v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  _BYLoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109376;
    v8[1] = objc_msgSend(v6, "count");
    v9 = 1024;
    v10 = a3;
    _os_log_impl(&dword_1A4E92000, v7, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: Wifi scan raw results: %d candidates, Error? %d", (uint8_t *)v8, 0xEu);
  }

  objc_msgSend(a4, "_scanComplete:error:", v6, a3 != 0);
}

uint64_t __wifidDidBecomeAlive_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scanWifiListWithDevice:", *(_QWORD *)(a1 + 40));
}

void sub_1A4EBF824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _BYLoggingFacility()
{
  if (_BYLoggingFacility_onceToken != -1)
    dispatch_once(&_BYLoggingFacility_onceToken, &__block_literal_global_19);
  return (id)_BYLoggingFacility_oslog;
}

uint64_t _BYIsInternalInstall()
{
  if (_BYIsInternalInstall_onceToken != -1)
    dispatch_once(&_BYIsInternalInstall_onceToken, &__block_literal_global_5_0);
  return _BYIsInternalInstall_internal;
}

uint64_t _BYLoggingEnabled()
{
  if (_BYLoggingEnabled__onceToken != -1)
    dispatch_once(&_BYLoggingEnabled__onceToken, &__block_literal_global_7_0);
  return _BYLoggingEnabled_shouldLog;
}

uint64_t _checkLoggingEnabled()
{
  uint64_t v0;
  CFPropertyListRef v1;
  void *v2;
  CFTypeID v3;
  CFTypeID v4;

  if ((MGGetBoolAnswer() & 1) != 0)
    return 1;
  v1 = CFPreferencesCopyAppValue(CFSTR("SetupLogging"), CFSTR("com.apple.purplebuddy"));
  if (!v1)
    return 0;
  v2 = (void *)v1;
  v3 = CFGetTypeID(v1);
  if (v3 == CFStringGetTypeID())
  {
    v0 = objc_msgSend(v2, "BOOLValue");
  }
  else
  {
    v4 = CFGetTypeID(v2);
    v0 = v4 == CFBooleanGetTypeID() && v2 == (void *)*MEMORY[0x1E0C9AE50];
  }
  CFRelease(v2);
  return v0;
}

id BYProcessNameForPID(int a1)
{
  void *v1;
  size_t v3;
  int v4[2];
  int v5;
  int v6;
  _OWORD v7[40];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  memset(v7, 0, 512);
  v3 = 648;
  *(_QWORD *)v4 = 0xE00000001;
  v5 = 1;
  v6 = a1;
  if (sysctl(v4, 4u, v7, &v3, 0, 0) < 0)
  {
    v1 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (char *)&v7[15] + 3);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

void sub_1A4EC0C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EC0E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EC0F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose((const void *)(v8 - 64), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_1A4EC11E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose((const void *)(v8 - 64), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EC137C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EC1584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFPreferencesClass_block_invoke_3(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AssistantServicesLibraryCore_frameworkLibrary_3)
  {
    AssistantServicesLibraryCore_frameworkLibrary_3 = _sl_dlopen();
    if (!AssistantServicesLibraryCore_frameworkLibrary_3)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AFPreferences");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAFPreferencesClass_block_invoke_cold_1();
    free(v3);
  }
  getAFPreferencesClass_softClass_3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSUManagerClientClass_block_invoke_1(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SoftwareUpdateServicesLibraryCore_frameworkLibrary_1)
  {
    SoftwareUpdateServicesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!SoftwareUpdateServicesLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SUManagerClient");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSUManagerClientClass_block_invoke_cold_1();
    free(v3);
  }
  getSUManagerClientClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPKPassLibraryClass_block_invoke_1(uint64_t a1)
{
  Class result;
  void *v3;

  if (!PassKitCoreLibraryCore_frameworkLibrary_1)
  {
    PassKitCoreLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!PassKitCoreLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PKPassLibrary");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getPKPassLibraryClass_block_invoke_cold_1();
    free(v3);
  }
  getPKPassLibraryClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getNRMigratorClass_block_invoke_1(uint64_t a1)
{
  Class result;
  void *v3;

  if (!NanoRegistryLibraryCore_frameworkLibrary_1)
  {
    NanoRegistryLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!NanoRegistryLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("NRMigrator");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getNRMigratorClass_block_invoke_cold_1();
    free(v3);
  }
  getNRMigratorClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getOBBundleClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!OnBoardingKitLibraryCore_frameworkLibrary)
  {
    OnBoardingKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!OnBoardingKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("OBBundle");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getOBBundleClass_block_invoke_cold_1();
    free(v3);
  }
  getOBBundleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getFMDFMIPManagerClass_block_invoke_1(uint64_t a1)
{
  Class result;
  void *v3;

  if (!FindMyDeviceLibraryCore_frameworkLibrary_1)
  {
    FindMyDeviceLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!FindMyDeviceLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("FMDFMIPManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getFMDFMIPManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getFMDFMIPManagerClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSTManagementStateClass_block_invoke_1(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ScreenTimeCoreLibraryCore_frameworkLibrary_1)
  {
    ScreenTimeCoreLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!ScreenTimeCoreLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("STManagementState");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSTManagementStateClass_block_invoke_cold_1();
    free(v3);
  }
  getSTManagementStateClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getUISUserInterfaceStyleModeClass_block_invoke_1(uint64_t a1)
{
  Class result;
  void *v3;

  if (!UIKitServicesLibraryCore_frameworkLibrary_1)
  {
    UIKitServicesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!UIKitServicesLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("UISUserInterfaceStyleMode");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getUISUserInterfaceStyleModeClass_block_invoke_cold_1();
    free(v3);
  }
  getUISUserInterfaceStyleModeClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCADisplayClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!QuartzCoreLibraryCore_frameworkLibrary)
  {
    QuartzCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!QuartzCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CADisplay");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCADisplayClass_block_invoke_cold_1();
    free(v3);
  }
  getCADisplayClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id _BYSignpostSubsystem()
{
  if (_BYSignpostSubsystem_onceToken != -1)
    dispatch_once(&_BYSignpostSubsystem_onceToken, &__block_literal_global_20);
  return (id)_BYSignpostSubsystem_log;
}

os_signpost_id_t _BYSignpostCreate(NSObject *a1)
{
  os_signpost_id_t v1;

  v1 = os_signpost_id_generate(a1);
  mach_continuous_time();
  return v1;
}

unint64_t _BYSignpostGetNanoseconds(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if (_BYSignpostGetNanoseconds_onceToken != -1)
    dispatch_once(&_BYSignpostGetNanoseconds_onceToken, &__block_literal_global_3_0);
  v3 = mach_continuous_time();
  LODWORD(v4) = _BYSignpostGetNanoseconds_timebase_info;
  LODWORD(v5) = *(_DWORD *)algn_1EE78D794;
  return (unint64_t)((double)v4 / (double)v5 * (double)(v3 - a2));
}

void sub_1A4EC2858(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void _networkReachabilityCallback(uint64_t a1, uint64_t a2, void *a3)
{
  int v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = objc_msgSend(v6, "currentNetworkType");
  v5 = objc_msgSend(v6, "_networkTypeFromFlags:", a2);
  if (v4 != (_DWORD)v5)
    objc_msgSend(v6, "setCurrentNetworkType:", v5);

}

uint64_t MobileWiFiLibrary()
{
  uint64_t v0;
  void *v2;

  if (!MobileWiFiLibraryCore_frameworkLibrary)
    MobileWiFiLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = MobileWiFiLibraryCore_frameworkLibrary;
  if (!MobileWiFiLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *__getSFLicenseVersionNumberSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (SettingsFoundationLibraryCore_frameworkLibrary)
  {
    v2 = (void *)SettingsFoundationLibraryCore_frameworkLibrary;
  }
  else
  {
    SettingsFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)SettingsFoundationLibraryCore_frameworkLibrary;
    if (!SettingsFoundationLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "SFLicenseVersionNumber");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getSFLicenseVersionNumberSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A4EC5FF4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4EC61A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4EC6220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A4EC77CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4EC80C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t _buddyFinished(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uncachePasscode");
}

id getSecureBackupClass()
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
  v0 = (void *)getSecureBackupClass_softClass_0;
  v7 = getSecureBackupClass_softClass_0;
  if (!getSecureBackupClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSecureBackupClass_block_invoke_0;
    v3[3] = &unk_1E4E26900;
    v3[4] = &v4;
    __getSecureBackupClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A4EC8188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EC92B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSecureBackupClass_block_invoke_0(uint64_t a1)
{
  Class result;

  CloudServicesLibrary_0();
  result = objc_getClass("SecureBackup");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSecureBackupClass_block_invoke_cold_1_0();
  getSecureBackupClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CloudServicesLibrary_0()
{
  uint64_t v0;
  void *v2;

  if (!CloudServicesLibraryCore_frameworkLibrary_0)
    CloudServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  v0 = CloudServicesLibraryCore_frameworkLibrary_0;
  if (!CloudServicesLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getCDPContextClass_block_invoke_0(uint64_t a1)
{
  Class result;

  CoreCDPLibrary_0();
  result = objc_getClass("CDPContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCDPContextClass_block_invoke_cold_1_0();
  getCDPContextClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void CoreCDPLibrary_0()
{
  void *v0;

  if (!CoreCDPLibraryCore_frameworkLibrary_0)
    CoreCDPLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!CoreCDPLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getCDPStateControllerClass_block_invoke_0(uint64_t a1)
{
  Class result;

  CoreCDPLibrary_0();
  result = objc_getClass("CDPStateController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCDPStateControllerClass_block_invoke_cold_1_0();
  getCDPStateControllerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __getVTPreferencesClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAFPreferencesClass_block_invoke_cold_1(v0);
}

uint64_t __getAFPreferencesClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAFSettingsConnectionClass_block_invoke_cold_1(v0);
}

uint64_t __getAFSettingsConnectionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAFVoiceInfoClass_block_invoke_cold_1(v0);
}

uint64_t __getAFVoiceInfoClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getDMTEnrollmentStatusViewModelClass_block_invoke_cold_1(v0);
}

uint64_t __getDMTEnrollmentStatusViewModelClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getDMTEnrollmentCompletionViewModelClass_block_invoke_cold_1(v0);
}

uint64_t __getDMTEnrollmentCompletionViewModelClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __34__BYFindMyManager_isFindMyEnabled__block_invoke_cold_1(v0);
}

uint64_t __getFMDFMIPManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[BYAuthenticationContext event:params:reply:].cold.1(v0);
}

uint64_t __getBiometricKitClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getBKDeviceClass_block_invoke_cold_1(v0);
}

uint64_t __getBKDeviceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getBKDeviceDescriptorClass_block_invoke_cold_1(v0);
}

uint64_t __getBKDeviceDescriptorClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSOSUtilitiesClass_block_invoke_cold_1(v0);
}

uint64_t __getSOSUtilitiesClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPKSetupAssistantContextClass_block_invoke_cold_1(v0);
}

uint64_t __getPKSetupAssistantContextClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPKPaymentSetupAssistantControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getPKPaymentSetupAssistantControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[BYSeedProgramManager currentSeedProgram].cold.1(v0);
}

uint64_t __getMCProfileConnectionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSecureBackupClass_block_invoke_cold_1(v0);
}

uint64_t __getSecureBackupClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getACAccountStoreClass_block_invoke_cold_1(v0);
}

uint64_t __getACAccountStoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAKAppleIDAuthenticationContextClass_block_invoke_cold_1(v0);
}

uint64_t __getAKAppleIDAuthenticationContextClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1();
}

uint64_t __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __BYAssistantScreenShouldBeShownInSetupAssistant_block_invoke_cold_1(v0);
}

void BYClearLaunchSentinel_cold_1()
{
  int *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v0 = __error();
  v1 = strerror(*v0);
  v4 = 136315138;
  v5 = v1;
  OUTLINED_FUNCTION_0_3(&dword_1A4E92000, v2, v3, "Failed to remove Buddy sentinel! %s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_1();
}

void BYSetLaunchSentinel_cold_1()
{
  int *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v0 = __error();
  v1 = strerror(*v0);
  v4 = 136315138;
  v5 = v1;
  OUTLINED_FUNCTION_0_3(&dword_1A4E92000, v2, v3, "Failed to create Buddy sentinel: %s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_1();
}

uint64_t __getSSRVoiceProfileManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[BuddyFeatureFlags isUseCDPContextSecretInsteadOfSBDSecretEnabled].cold.1(v0);
}

uint64_t __getWFClientClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __123__BYAppleIDAccountsManager_loginDelegateAccountsWithUsername_password_rawPassword_skipiTunes_onlyAppleIDPlugin_completion___block_invoke_2_cold_1(v0);
}

uint64_t __getAALoginPluginManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAASetupAssistantServiceClass_block_invoke_cold_1(v0);
}

uint64_t __getAASetupAssistantServiceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCDPContextClass_block_invoke_cold_1(v0);
}

uint64_t __getCDPContextClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCDPStateControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getCDPStateControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAALoginContextTransientStorageClass_block_invoke_cold_1(v0);
}

uint64_t __getAALoginContextTransientStorageClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __33__BYDeviceMigrationManager_start__block_invoke_2_cold_1(v0);
}

uint64_t __getNRMigratorClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSBSHardwareButtonServiceClass_block_invoke_cold_1(v0);
}

uint64_t __getSBSHardwareButtonServiceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCLLocationManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getCLLocationManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSTManagementStateClass_block_invoke_cold_1(v0);
}

uint64_t __getSTManagementStateClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getSUManagerClientClass_block_invoke_cold_1();
}

uint64_t __getSUManagerClientClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getUISUserInterfaceStyleModeClass_block_invoke_cold_1(v0);
}

uint64_t __getUISUserInterfaceStyleModeClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPKPassLibraryClass_block_invoke_cold_1(v0);
}

uint64_t __getPKPassLibraryClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getMBManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getMBManagerClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[BYBackupMetadata(SetupAssistantSupport) expressSettings].cold.1(v0);
}

uint64_t __getOBBundleClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCADisplayClass_block_invoke_cold_1(v0);
}

uint64_t __getCADisplayClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[BYTelephonyStateNotifier initForNotifying].cold.1(v0);
}

void __getSecureBackupClass_block_invoke_cold_1_0()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getCDPContextClass_block_invoke_cold_1_0(v0);
}

void __getCDPContextClass_block_invoke_cold_1_0()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getCDPStateControllerClass_block_invoke_cold_1_0(v0);
}

void __getCDPStateControllerClass_block_invoke_cold_1_0()
{
  abort_report_np();
  AnalyticsRolloverEvents();
}

uint64_t AnalyticsRolloverEvents()
{
  return MEMORY[0x1E0D15410]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1E0D01E18]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
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

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x1E0C98A50](applicationID, userName, hostName);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98A58](keysToFetch, applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A88](keysToSet, keysToRemove, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
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

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1E0CBB918](*(_QWORD *)&mainPort, path);
}

uint64_t MDMAuthenticationResultsCacheFilePath()
{
  return MEMORY[0x1E0D1C138]();
}

uint64_t MDMCloudConfigurationSetAsideDetailsFilePath()
{
  return MEMORY[0x1E0D1C148]();
}

uint64_t MDMPostSetupAutoInstallSetAsideProfilePath()
{
  return MEMORY[0x1E0D1C170]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x1E0DE2B38]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1E0DE2B68]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

uint64_t MKBDeviceLockAssertion()
{
  return MEMORY[0x1E0D4E488]();
}

uint64_t MKBKeyBagKeyStashCreateWithMode()
{
  return MEMORY[0x1E0D4E518]();
}

uint64_t MKBKeyBagKeyStashPersist()
{
  return MEMORY[0x1E0D4E528]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x1E0CB3428]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1E0D82C68]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t PPSCreateTelemetryIdentifier()
{
  return MEMORY[0x1E0D7FE50]();
}

uint64_t PPSSendTelemetry()
{
  return MEMORY[0x1E0D7FE68]();
}

uint64_t SASExpressSettingsReadFrom()
{
  return MEMORY[0x1E0D8D740]();
}

uint64_t SCNetworkReachabilityCreateWithOptions()
{
  return MEMORY[0x1E0CE88D0]();
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1E0CE88D8](target, flags);
}

Boolean SCNetworkReachabilityScheduleWithRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1E0CE88E8](target, runLoop, runLoopMode);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x1E0CE88F0](target, callout, context);
}

Boolean SCNetworkReachabilityUnscheduleFromRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1E0CE8900](target, runLoop, runLoopMode);
}

uint64_t WiFiDeviceClientGetTypeID()
{
  return MEMORY[0x1E0D4FB38]();
}

uint64_t WiFiDeviceClientScanAsync()
{
  return MEMORY[0x1E0D4FBA0]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x1E0D4FBE0]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x1E0D4FC08]();
}

uint64_t WiFiManagerClientRegisterDeviceAttachmentCallback()
{
  return MEMORY[0x1E0D4FC58]();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return MEMORY[0x1E0D4FC88]();
}

uint64_t WiFiManagerClientUnscheduleFromRunLoop()
{
  return MEMORY[0x1E0D4FCC0]();
}

uint64_t WiFiNetworkGet11dCountryCodeFromIe()
{
  return MEMORY[0x1E0D4FCF0]();
}

uint64_t _AXSRestoreSettingsFromDataBlobForBuddy()
{
  return MEMORY[0x1E0DDDB58]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFPreferencesFlushCachesForIdentifier()
{
  return MEMORY[0x1E0C9A328]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1E0C82B18](from, to, state, *(_QWORD *)&flags);
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

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
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

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
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

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1E0C843F0](*(_QWORD *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
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

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1E0C84488](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x1E0C84678]();
}

uint64_t os_eligibility_set_input()
{
  return MEMORY[0x1E0C84688]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1E0C84A00]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84BC8](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84F68](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

int sem_close(sem_t *a1)
{
  return MEMORY[0x1E0C85290](a1);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return (sem_t *)MEMORY[0x1E0C852A8](a1, *(_QWORD *)&a2);
}

int sem_unlink(const char *a1)
{
  return MEMORY[0x1E0C852B8](a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

uint64_t voucher_copy()
{
  return MEMORY[0x1E0C85B18]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1E0C85D80](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

uint64_t xpc_activity_set_completion_status()
{
  return MEMORY[0x1E0C85DA8]();
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x1E0C85DB0](activity, criteria);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85DC8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x1E0C85DD0](identifier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1E0C86420](object1, object2);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

