void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_1DB1FE740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB1FE8B0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DB1FEB24(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1DB1FEE00(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB1FF084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getFKBankConnectOfflineLabConsentCoordinatorClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!FinanceKitLibraryCore_frameworkLibrary)
  {
    FinanceKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!FinanceKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("FKBankConnectOfflineLabConsentCoordinator");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getFKBankConnectOfflineLabConsentCoordinatorClass_block_invoke_cold_1();
    free(v3);
  }
  getFKBankConnectOfflineLabConsentCoordinatorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

void sub_1DB1FF4EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB1FF70C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1DB1FFAE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

Class __getFPAccessControlManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!FileProviderLibraryCore_frameworkLibrary)
  {
    FileProviderLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!FileProviderLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("FPAccessControlManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getFPAccessControlManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getFPAccessControlManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getNudityDetectionPreferencesHelperClass()
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
  v0 = (void *)getNudityDetectionPreferencesHelperClass_softClass;
  v7 = getNudityDetectionPreferencesHelperClass_softClass;
  if (!getNudityDetectionPreferencesHelperClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getNudityDetectionPreferencesHelperClass_block_invoke;
    v3[3] = &unk_1EA26B260;
    v3[4] = &v4;
    __getNudityDetectionPreferencesHelperClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB200B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB20141C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1DB201684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB202B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
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
  v0 = (void *)getCLLocationManagerClass_softClass;
  v7 = getCLLocationManagerClass_softClass;
  if (!getCLLocationManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCLLocationManagerClass_block_invoke;
    v3[3] = &unk_1EA26B260;
    v3[4] = &v4;
    __getCLLocationManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB203030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNudityDetectionPreferencesHelperClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!CommunicationSafetySettingsUILibraryCore_frameworkLibrary)
  {
    CommunicationSafetySettingsUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CommunicationSafetySettingsUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getNudityDetectionPreferencesHelperClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("NudityDetectionPreferencesHelper");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getNudityDetectionPreferencesHelperClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AppleMobileFileIntegrityLibrary()
{
  uint64_t v0;
  void *v2;

  if (!AppleMobileFileIntegrityLibraryCore_frameworkLibrary)
    AppleMobileFileIntegrityLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = AppleMobileFileIntegrityLibraryCore_frameworkLibrary;
  if (!AppleMobileFileIntegrityLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getHKHealthStoreClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!HealthKitLibraryCore_frameworkLibrary)
  {
    HealthKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!HealthKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getHKHealthStoreClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("HKHealthStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getHKHealthStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCLLocationManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!CoreLocationLibraryCore_frameworkLibrary)
  {
    CoreLocationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreLocationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getCLLocationManagerClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("CLLocationManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getCLLocationManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DB205D50(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 256));
  _Unwind_Resume(a1);
}

void sub_1DB2083C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
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

void sub_1DB2095E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a63, 8);
  _Unwind_Resume(a1);
}

uint64_t getDRGetAllLogFileURLsSymbolLoc()
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
  v0 = getDRGetAllLogFileURLsSymbolLoc_ptr;
  v6 = getDRGetAllLogFileURLsSymbolLoc_ptr;
  if (!getDRGetAllLogFileURLsSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getDRGetAllLogFileURLsSymbolLoc_block_invoke;
    v2[3] = &unk_1EA26B260;
    v2[4] = &v3;
    __getDRGetAllLogFileURLsSymbolLoc_block_invoke((uint64_t)v2);
    v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DB2096C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB2098E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getOBPrivacyPresenterClass()
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
  v0 = (void *)getOBPrivacyPresenterClass_softClass;
  v7 = getOBPrivacyPresenterClass_softClass;
  if (!getOBPrivacyPresenterClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getOBPrivacyPresenterClass_block_invoke;
    v3[3] = &unk_1EA26B260;
    v3[4] = &v4;
    __getOBPrivacyPresenterClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB20A798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAKAppleIDAuthenticationControllerClass()
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
  v0 = (void *)getAKAppleIDAuthenticationControllerClass_softClass;
  v7 = getAKAppleIDAuthenticationControllerClass_softClass;
  if (!getAKAppleIDAuthenticationControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAKAppleIDAuthenticationControllerClass_block_invoke;
    v3[3] = &unk_1EA26B260;
    v3[4] = &v4;
    __getAKAppleIDAuthenticationControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB20AFB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB20B2A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getNRPairedDeviceRegistryClass()
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
  v0 = (void *)getNRPairedDeviceRegistryClass_softClass;
  v7 = getNRPairedDeviceRegistryClass_softClass;
  if (!getNRPairedDeviceRegistryClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getNRPairedDeviceRegistryClass_block_invoke;
    v3[3] = &unk_1EA26B260;
    v3[4] = &v4;
    __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB20B95C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB20C978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB20CAEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak((id *)(v17 - 56));
  _Unwind_Resume(a1);
}

void sub_1DB20CCA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB20D288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB20D434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB20E3C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB20E8B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB20F348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB20F50C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB20F744(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB20F920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getHealthAppAnalyticsStoreClass()
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
  v0 = (void *)getHealthAppAnalyticsStoreClass_softClass;
  v7 = getHealthAppAnalyticsStoreClass_softClass;
  if (!getHealthAppAnalyticsStoreClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getHealthAppAnalyticsStoreClass_block_invoke;
    v3[3] = &unk_1EA26B260;
    v3[4] = &v4;
    __getHealthAppAnalyticsStoreClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB20FDA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB2101D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB210368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  uint64_t v17;

  _Block_object_dispose((const void *)(v17 - 80), 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB21065C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB210A18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  _Block_object_dispose(&a19, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PSGEOVisualLocalizationCrowdsourcingIsAllowed()
{
  void *v0;
  void *v1;
  uint64_t v2;
  _Unwind_Exception *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = getGEOVisualLocalizationCrowdsourcingIsAllowedSymbolLoc_ptr;
  v8 = getGEOVisualLocalizationCrowdsourcingIsAllowedSymbolLoc_ptr;
  if (!getGEOVisualLocalizationCrowdsourcingIsAllowedSymbolLoc_ptr)
  {
    v1 = (void *)GeoServicesLibrary();
    v0 = dlsym(v1, "GEOVisualLocalizationCrowdsourcingIsAllowed");
    v6[3] = (uint64_t)v0;
    getGEOVisualLocalizationCrowdsourcingIsAllowedSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)__43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  return ((uint64_t (*)(uint64_t))v0)(v2);
}

void *__getOSAGetSubmittableLogsSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (CrashReporterSupportLibraryCore_frameworkLibrary)
  {
    v2 = (void *)CrashReporterSupportLibraryCore_frameworkLibrary;
  }
  else
  {
    CrashReporterSupportLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)CrashReporterSupportLibraryCore_frameworkLibrary;
    if (!CrashReporterSupportLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "OSAGetSubmittableLogs");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getOSAGetSubmittableLogsSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getRTCReportingClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!RTCReportingLibraryCore_frameworkLibrary)
  {
    RTCReportingLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!RTCReportingLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("RTCReporting");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getRTCReportingClass_block_invoke_cold_1();
    free(v3);
  }
  getRTCReportingClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCloudTelemetryReporterClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CloudTelemetryLibraryCore_frameworkLibrary)
  {
    CloudTelemetryLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CloudTelemetryLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CloudTelemetryReporter");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCloudTelemetryReporterClass_block_invoke_cold_1();
    free(v3);
  }
  getCloudTelemetryReporterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAATransparencyLoggingClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AppAnalyticsLibraryCore_frameworkLibrary)
  {
    AppAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AppAnalyticsLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AATransparencyLogging");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAATransparencyLoggingClass_block_invoke_cold_1();
    free(v3);
  }
  getAATransparencyLoggingClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getDESSubmissionLogFileURLsSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (DistributedEvaluationLibraryCore_frameworkLibrary)
  {
    v2 = (void *)DistributedEvaluationLibraryCore_frameworkLibrary;
  }
  else
  {
    DistributedEvaluationLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)DistributedEvaluationLibraryCore_frameworkLibrary;
    if (!DistributedEvaluationLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "DESSubmissionLogFileURLs");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getDESSubmissionLogFileURLsSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSPMLLoggingClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SearchLibraryCore_frameworkLibrary)
  {
    SearchLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SearchLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SPMLLogging");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSPMLLoggingClass_block_invoke_cold_1();
    free(v3);
  }
  getSPMLLoggingClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPLDiagnosticsClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!PhotoLibraryServicesLibraryCore_frameworkLibrary)
  {
    PhotoLibraryServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!PhotoLibraryServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PLDiagnostics");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getPLDiagnosticsClass_block_invoke_cold_1();
    free(v3);
  }
  getPLDiagnosticsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSDRGetAllLogFileURLsSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (SymptomDiagnosticReporterLibraryCore_frameworkLibrary)
  {
    v2 = (void *)SymptomDiagnosticReporterLibraryCore_frameworkLibrary;
  }
  else
  {
    SymptomDiagnosticReporterLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)SymptomDiagnosticReporterLibraryCore_frameworkLibrary;
    if (!SymptomDiagnosticReporterLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "SDRGetAllLogFileURLs");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getSDRGetAllLogFileURLsSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getDRGetAllLogFileURLsSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (DiagnosticRequestLibraryCore_frameworkLibrary)
  {
    v2 = (void *)DiagnosticRequestLibraryCore_frameworkLibrary;
  }
  else
  {
    DiagnosticRequestLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)DiagnosticRequestLibraryCore_frameworkLibrary;
    if (!DiagnosticRequestLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "DRGetAllLogFileURLs");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getDRGetAllLogFileURLsSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPLDatabaseReaderClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!PowerlogDatabaseReaderLibraryCore_frameworkLibrary)
  {
    PowerlogDatabaseReaderLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!PowerlogDatabaseReaderLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PLDatabaseReader");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getPLDatabaseReaderClass_block_invoke_cold_1();
    free(v3);
  }
  getPLDatabaseReaderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getOBPrivacyPresenterClass_block_invoke(uint64_t a1)
{
  Class result;

  OnBoardingKitLibrary();
  result = objc_getClass("OBPrivacyPresenter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getOBPrivacyPresenterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getOBPrivacyPresenterClass_block_invoke_cold_1();
    return (Class)OnBoardingKitLibrary();
  }
  return result;
}

uint64_t OnBoardingKitLibrary()
{
  uint64_t v0;
  void *v2;

  if (!OnBoardingKitLibraryCore_frameworkLibrary)
    OnBoardingKitLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = OnBoardingKitLibraryCore_frameworkLibrary;
  if (!OnBoardingKitLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getSFSafariViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SafariServicesLibraryCore_frameworkLibrary)
  {
    SafariServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SafariServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SFSafariViewController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSFSafariViewControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getSFSafariViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t GeoServicesLibrary()
{
  uint64_t v0;
  void *v2;

  if (!GeoServicesLibraryCore_frameworkLibrary)
    GeoServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = GeoServicesLibraryCore_frameworkLibrary;
  if (!GeoServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getAKAppleIDAuthenticationControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  AuthKitLibrary();
  result = objc_getClass("AKAppleIDAuthenticationController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAKAppleIDAuthenticationControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1();
    return (Class)AuthKitLibrary();
  }
  return result;
}

uint64_t AuthKitLibrary()
{
  uint64_t v0;
  void *v2;

  if (!AuthKitLibraryCore_frameworkLibrary)
    AuthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = AuthKitLibraryCore_frameworkLibrary;
  if (!AuthKitLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getNRPairedDeviceRegistryClass_block_invoke(uint64_t a1)
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
    result = objc_getClass("NRPairedDeviceRegistry");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getNRPairedDeviceRegistryClass_block_invoke_cold_1();
    free(v3);
  }
  getNRPairedDeviceRegistryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAFSettingsConnectionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AssistantServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AFSettingsConnection");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAFSettingsConnectionClass_block_invoke_cold_1();
    free(v3);
  }
  getAFSettingsConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCIDVUIIdentityProofingDataSharingFlowManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CoreIDVUILibraryCore_frameworkLibrary)
  {
    CoreIDVUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreIDVUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CIDVUIIdentityProofingDataSharingFlowManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCIDVUIIdentityProofingDataSharingFlowManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getCIDVUIIdentityProofingDataSharingFlowManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                             + 24);
  return result;
}

Class __getHealthAppAnalyticsStoreClass_block_invoke(uint64_t a1)
{
  Class result;

  HealthAppServicesLibrary();
  result = objc_getClass("HealthAppAnalyticsStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHealthAppAnalyticsStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHealthAppAnalyticsStoreClass_block_invoke_cold_1();
    return (Class)HealthAppServicesLibrary();
  }
  return result;
}

uint64_t HealthAppServicesLibrary()
{
  uint64_t v0;
  void *v2;

  if (!HealthAppServicesLibraryCore_frameworkLibrary)
    HealthAppServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = HealthAppServicesLibraryCore_frameworkLibrary;
  if (!HealthAppServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getHKHealthStoreClass_block_invoke_0(uint64_t a1)
{
  Class result;

  HealthKitLibrary();
  result = objc_getClass("HKHealthStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getHKHealthStoreClass_block_invoke_cold_1();
  getHKHealthStoreClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void HealthKitLibrary()
{
  void *v0;

  if (!HealthKitLibraryCore_frameworkLibrary_0)
    HealthKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!HealthKitLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

PUIReportSensorAppController *__getHKHealthRecordsStoreClass_block_invoke(uint64_t a1)
{
  PUIReportSensorAppController *result;
  PUIReportSensorAppController *v3;
  SEL v4;

  HealthKitLibrary();
  result = (PUIReportSensorAppController *)objc_getClass("HKHealthRecordsStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKHealthRecordsStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (PUIReportSensorAppController *)__getHKHealthRecordsStoreClass_block_invoke_cold_1();
    return -[PUIReportSensorAppController init](v3, v4);
  }
  return result;
}

void sub_1DB214210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __isGreenTeaSKU_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  isGreenTeaSKU_deviceIsChinaSKU = result;
  return result;
}

void sub_1DB2191CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPAAccessReaderClass()
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
  v0 = (void *)getPAAccessReaderClass_softClass;
  v7 = getPAAccessReaderClass_softClass;
  if (!getPAAccessReaderClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPAAccessReaderClass_block_invoke;
    v3[3] = &unk_1EA26B260;
    v3[4] = &v4;
    __getPAAccessReaderClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB219288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPAAccessReaderClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!PrivacyAccountingLibraryCore_frameworkLibrary)
  {
    PrivacyAccountingLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!PrivacyAccountingLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PAAccessReader");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getPAAccessReaderClass_block_invoke_cold_1();
    free(v3);
  }
  getPAAccessReaderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id PUI_LocalizedStringForRestrictions(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PUI_BundleForPrivacySettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("Restrictions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PUI_BundleForPrivacySettingsFramework()
{
  if (PUI_BundleForPrivacySettingsFramework_onceToken != -1)
    dispatch_once(&PUI_BundleForPrivacySettingsFramework_onceToken, &__block_literal_global_6);
  return (id)PUI_BundleForPrivacySettingsFramework__privacySettingsFrameworkBundle;
}

id PUI_LocalizedStringForLocationServices(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PUI_BundleForPrivacySettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("Location Services"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PUI_LocalizedStringForLocationServicesPrivacy(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PUI_BundleForPrivacySettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("LocationServicesPrivacy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PUI_LocalizedStringForPrivacy(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PUI_BundleForPrivacySettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("Privacy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PUI_LocalizedStringForAlmanac(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PUI_BundleForPrivacySettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("Almanac-ALMANAC"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PUI_LocalizedStringForDimSum(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PUI_BundleForPrivacySettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("Dim-Sum"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PUI_LocalizedStringForAdSupport(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PUI_BundleForPrivacySettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("AppleAdvertising"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PUI_LocalizedStringForTrackers(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PUI_BundleForPrivacySettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("Trackers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PUI_LocalizedStringForAppReport(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PUI_BundleForPrivacySettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("AppReport"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PUI_LocalizedStringForLockdownMode(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PUI_BundleForPrivacySettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("LockdownMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PUI_LocalizedStringForSafety(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PUI_BundleForPrivacySettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("Safety"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PUI_LocalizedStringForProblemReporting(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PUI_BundleForPrivacySettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("ProblemReporting"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PUI_LocalizedStringForProblemReportingCinnamon(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PUI_BundleForPrivacySettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("ProblemReporting-Cinnamon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PUI_LocalizedStringForProblemReportingBankConnect(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PUI_BundleForPrivacySettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("ProblemReporting-BankConnect"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PUI_RebrandedKeyForAppleID(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  if ((objc_msgSend(v1, "containsString:", CFSTR("REBRAND")) & 1) != 0 || (_os_feature_enabled_impl() & 1) == 0)
  {
    v2 = v1;
  }
  else
  {
    objc_msgSend(v1, "stringByAppendingString:", CFSTR("_REBRAND"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;

  return v3;
}

id getLocalizedDeviceName()
{
  if (getLocalizedDeviceName_onceToken != -1)
    dispatch_once(&getLocalizedDeviceName_onceToken, &__block_literal_global_35);
  return (id)getLocalizedDeviceName_localizedDeviceName;
}

void __getLocalizedDeviceName_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)getLocalizedDeviceName_localizedDeviceName;
  getLocalizedDeviceName_localizedDeviceName = v0;

}

void sub_1DB21CC18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB21D310(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id bundleIdentifiersWithPickerAccess()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v0 = (void *)getCNPrivateAccessAggregatorClass_softClass;
  v9 = getCNPrivateAccessAggregatorClass_softClass;
  if (!getCNPrivateAccessAggregatorClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getCNPrivateAccessAggregatorClass_block_invoke;
    v5[3] = &unk_1EA26B260;
    v5[4] = &v6;
    __getCNPrivateAccessAggregatorClass_block_invoke((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v1, "allLoggedBundledIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_1DB21D5BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCNLimitedAccessContactPickerViewControllerClass()
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
  v0 = (void *)getCNLimitedAccessContactPickerViewControllerClass_softClass;
  v7 = getCNLimitedAccessContactPickerViewControllerClass_softClass;
  if (!getCNLimitedAccessContactPickerViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCNLimitedAccessContactPickerViewControllerClass_block_invoke;
    v3[3] = &unk_1EA26B260;
    v3[4] = &v4;
    __getCNLimitedAccessContactPickerViewControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB21E150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB21ED70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1DB220874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id *location,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,id a57)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a57);
  _Unwind_Resume(a1);
}

void sub_1DB2214B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id *location)
{
  uint64_t v29;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v29 - 256));
  _Unwind_Resume(a1);
}

void __getCNPrivateAccessAggregatorClass_block_invoke(uint64_t a1)
{
  ContactsUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CNPrivateAccessAggregator");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCNPrivateAccessAggregatorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCNPrivateAccessAggregatorClass_block_invoke_cold_1();
    ContactsUILibrary();
  }
}

void ContactsUILibrary()
{
  void *v0;

  if (!ContactsUILibraryCore_frameworkLibrary)
    ContactsUILibraryCore_frameworkLibrary = _sl_dlopen();
  if (!ContactsUILibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getCNLimitedAccessContactPickerViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  ContactsUILibrary();
  result = objc_getClass("CNLimitedAccessContactPickerViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCNLimitedAccessContactPickerViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                             + 24);
  }
  else
  {
    v3 = __getCNLimitedAccessContactPickerViewControllerClass_block_invoke_cold_1();
    return (Class)__getCNContactGroupVisualizerClass_block_invoke(v3);
  }
  return result;
}

Class __getCNContactGroupVisualizerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  ContactsUILibrary();
  result = objc_getClass("CNContactGroupVisualizer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCNContactGroupVisualizerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getCNContactGroupVisualizerClass_block_invoke_cold_1();
    return (Class)__PUIContactsAuthorizationStatesForService_block_invoke(v3);
  }
  return result;
}

id PUIDisplayNameForApp(__CFBundle *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CFURLRef v8;
  void *v9;

  CFBundleGetIdentifier(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {
    CFBundleGetInfoDictionary(a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AAC8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v6, "length"))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE88]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "length"))
      {
        v6 = v7;
      }
      else
      {
        v8 = CFBundleCopyBundleURL(a1);
        -[__CFURL lastPathComponent](v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByDeletingPathExtension");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }

    v4 = v6;
  }

  return v4;
}

id PUIWatchBundleIDForBundleID(void *a1)
{
  id v1;
  NSObject *v2;
  dispatch_semaphore_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  NSObject *v11;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  _PUILoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v1;
    _os_log_impl(&dword_1DB1FB000, v2, OS_LOG_TYPE_DEFAULT, "Fetching watch app bundle id for companion bundle id %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  v3 = dispatch_semaphore_create(0);
  objc_msgSend(MEMORY[0x1E0CF8858], "sharedDeviceConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __PUIWatchBundleIDForBundleID_block_invoke;
  v9[3] = &unk_1EA26C258;
  p_buf = &buf;
  v5 = v1;
  v10 = v5;
  v6 = v3;
  v11 = v6;
  objc_msgSend(v4, "fetchWatchAppBundleIDForCompanionAppBundleID:completion:", v5, v9);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v7;
}

void sub_1DB221E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

id PUIDisplayNameForWatchApp(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *j;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  _BYTE v44[128];
  uint8_t v45[128];
  uint8_t buf[4];
  id v47;
  __int16 v48;
  id v49;
  _QWORD v50[3];
  _QWORD v51[6];

  v51[3] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v50[0] = CFSTR("com.apple.findmy.finddevices");
  PUI_LocalizedStringForLocationServices(CFSTR("APP_NAME_FIND_DEVICES"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v2;
  v50[1] = CFSTR("com.apple.findmy.finditems");
  PUI_LocalizedStringForLocationServices(CFSTR("APP_NAME_FIND_ITEMS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v3;
  v50[2] = CFSTR("com.apple.findmy.findpeople");
  PUI_LocalizedStringForLocationServices(CFSTR("APP_NAME_FIND_PEOPLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (id)*MEMORY[0x1E0C9AE88];
    v9 = (id)*MEMORY[0x1E0C9AAC8];
    v34 = v8;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF8858], "sharedDeviceConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    v13 = (void *)objc_msgSend(v11, "copyLocalizedValuesFromAllDevicesForInfoPlistKeys:forAppWithBundleID:fetchingFirstMatchingLocalizationInList:error:", v10, v1, v12, &v43);
    v14 = v43;

    if (v14)
    {
      _PUILoggingFacility();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v47 = v1;
        v48 = 2112;
        v49 = v14;
        _os_log_impl(&dword_1DB1FB000, v15, OS_LOG_TYPE_DEFAULT, "Error fetching watch app name for %@, error %@", buf, 0x16u);
      }
      v7 = 0;
    }
    else
    {
      v33 = v10;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v32 = v13;
      v15 = v13;
      v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v40;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v40 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
            -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", v9);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v20);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = v28;
              v30 = v9;
LABEL_26:
              objc_msgSend(v28, "objectForKeyedSubscript:", v30);
              v7 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_27;
            }
          }
          v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
          if (v17)
            continue;
          break;
        }
      }

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v15 = v15;
      v7 = (void *)-[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v7)
      {
        v23 = *(_QWORD *)v36;
        while (2)
        {
          for (j = 0; j != v7; j = (char *)j + 1)
          {
            if (*(_QWORD *)v36 != v23)
              objc_enumerationMutation(v15);
            v25 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j);
            -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKeyedSubscript:", v34);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27)
            {
              -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v25);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = v28;
              v30 = v34;
              goto LABEL_26;
            }
          }
          v7 = (void *)-[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
          if (v7)
            continue;
          break;
        }
      }
LABEL_27:
      v14 = 0;
      v10 = v33;
      v13 = v32;
    }

  }
  return v7;
}

id PUIGetActivePairedDevice()
{
  char v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v0 = objc_opt_respondsToSelector();
  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D51838], "activePairedDeviceSelectorBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v0 & 1) != 0)
    objc_msgSend(v1, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v2);
  else
    objc_msgSend(v1, "getAllDevicesWithArchivedDevicesMatching:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0D516E0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "BOOLValue"))
    v6 = 0;
  else
    v6 = v4;
  v7 = v6;

  return v7;
}

BOOL PUIIsAppClip(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  uint64_t v7;

  v1 = (objc_class *)MEMORY[0x1E0CA5870];
  v2 = a1;
  v7 = 0;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v2, 0, &v7);

  objc_msgSend(v3, "appClipMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

void PUIResetIDFAIfNeeded()
{
  void *v0;
  NSObject *v1;
  void *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = (void *)TCCAccessCopyBundleIdentifiersForService();
  if (!objc_msgSend(v0, "count"))
  {
    _PUILoggingFacility();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 136315138;
      v4 = "PUIResetIDFAIfNeeded";
      _os_log_impl(&dword_1DB1FB000, v1, OS_LOG_TYPE_DEFAULT, "%s: all apps were disabled for kTCCServiceUserTracking. Resetting ad identifier.", (uint8_t *)&v3, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "clearAdvertisingIdentifier");

  }
}

uint64_t PUICompareSpecifiersByName(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(a1, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "localizedCaseInsensitiveCompare:", v5);
  return v6;
}

void PUIAnalyticsLogView(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v8 = a1;
  v9 = a2;
  v10 = a3;
  v5 = v10;
  v6 = v9;
  v7 = v8;
  AnalyticsSendEventLazy();

}

id PUITribecaSupportedText()
{
  if (PUITribecaSupportedText_token != -1)
    dispatch_once(&PUITribecaSupportedText_token, &__block_literal_global_8);
  return (id)PUITribecaSupportedText_text;
}

uint64_t PUIIsUserParcElisabethEligible()
{
  int domain_answer;
  NSObject *v1;
  _BOOL4 v2;
  uint64_t v4;
  uint64_t v5;

  v4 = 0;
  v5 = 0;
  domain_answer = os_eligibility_get_domain_answer();
  _PUILoggingFacility();
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = os_log_type_enabled(v1, OS_LOG_TYPE_ERROR);
  if (domain_answer)
  {
    if (v2)
      PUIIsUserParcElisabethEligible_cold_2(domain_answer, v1);
  }
  else if (v2)
  {
    PUIIsUserParcElisabethEligible_cold_1(v1);
  }

  return 0;
}

id PUIAllApplicationsSupportingDisclosureReview()
{
  void *v0;
  void *v1;
  uint64_t v2;
  _Unwind_Exception *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = getPDUAllApplicationsSupportingDisclosureReviewSymbolLoc_ptr;
  v8 = getPDUAllApplicationsSupportingDisclosureReviewSymbolLoc_ptr;
  if (!getPDUAllApplicationsSupportingDisclosureReviewSymbolLoc_ptr)
  {
    v1 = (void *)PrivacyDisclosureUILibrary();
    v0 = dlsym(v1, "PDUAllApplicationsSupportingDisclosureReview");
    v6[3] = (uint64_t)v0;
    getPDUAllApplicationsSupportingDisclosureReviewSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)__43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  ((void (*)(uint64_t))v0)(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t PrivacyDisclosureUILibrary()
{
  uint64_t v0;
  void *v2;

  if (!PrivacyDisclosureUILibraryCore_frameworkLibrary)
    PrivacyDisclosureUILibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = PrivacyDisclosureUILibraryCore_frameworkLibrary;
  if (!PrivacyDisclosureUILibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_1DB22351C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DB224A14(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 256));
  _Unwind_Resume(a1);
}

id PUIWebsiteIconView()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (PUIWebsiteIconView_onceToken != -1)
    dispatch_once(&PUIWebsiteIconView_onceToken, &__block_literal_global_12);
  v0 = (void *)objc_opt_new();
  objc_msgSend(v0, "setFrame:", 0.0, 0.0, *(double *)&PUIWebsiteIconView_iconSize_0, *(double *)&PUIWebsiteIconView_iconSize_1);
  objc_msgSend(v0, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v0, "widthAnchor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "constraintEqualToConstant:", *(double *)&PUIWebsiteIconView_iconSize_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActive:", 1);

  objc_msgSend(v0, "heightAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToConstant:", *(double *)&PUIWebsiteIconView_iconSize_1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", 1);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setTextColor:", v5);

  objc_msgSend(v0, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setBackgroundColor:", v6);

  objc_msgSend(v0, "_setContinuousCornerRadius:", *(double *)&PUIWebsiteIconView_cornerRadius);
  objc_msgSend(v0, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMasksToBounds:", 1);

  return v0;
}

id PUIImageFromLabel(void *a1)
{
  id v1;
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  void *v6;
  double v7;
  CGFloat v8;
  void *v9;
  void *v10;
  CGSize v12;

  v1 = a1;
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;
  v12.width = v3;
  v12.height = v5;
  UIGraphicsBeginImageContextWithOptions(v12, 0, v8);

  objc_msgSend(v1, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "renderInContext:", UIGraphicsGetCurrentContext());
  UIGraphicsGetImageFromCurrentImageContext();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v10;
}

void sub_1DB227934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void sub_1DB227E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB22847C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB22A118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL PUIWriteBytesToStream(void *a1, uint64_t a2, unint64_t a3, _QWORD *a4)
{
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  id v13;
  _BOOL8 v14;

  v7 = a1;
  if (a3)
  {
    v8 = 0;
    v9 = 512;
    v10 = a3;
    while (1)
    {
      v11 = objc_msgSend(v7, "write:maxLength:", a2 + v8, v10);
      if (v11 < 0)
        break;
      if (!v11)
      {
        v9 = 640;
        break;
      }
      v10 -= v11;
      if (v10)
      {
        v8 += v11;
        if (v8 < a3)
          continue;
      }
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], v9, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v13 != 0;
    if (a4 && v13)
    {
      v13 = objc_retainAutorelease(v13);
      *a4 = v13;
      v12 = 1;
    }
  }
  else
  {
LABEL_7:
    v12 = 0;
    v13 = 0;
  }
  v14 = !v12;

  return v14;
}

void sub_1DB22B934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCLCopyAppsUsingLocationSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (CoreLocationLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)CoreLocationLibraryCore_frameworkLibrary_0;
  }
  else
  {
    CoreLocationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    v2 = (void *)CoreLocationLibraryCore_frameworkLibrary_0;
    if (!CoreLocationLibraryCore_frameworkLibrary_0)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "CLCopyAppsUsingLocation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getCLCopyAppsUsingLocationSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DB22FF4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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

Class __getPAAccessReaderClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!PrivacyAccountingLibraryCore_frameworkLibrary_0)
  {
    PrivacyAccountingLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!PrivacyAccountingLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PAAccessReader");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getPAAccessReaderClass_block_invoke_cold_1();
    free(v3);
  }
  getPAAccessReaderClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getAMSAcknowledgePrivacyTaskClass()
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
  v0 = (void *)getAMSAcknowledgePrivacyTaskClass_softClass;
  v7 = getAMSAcknowledgePrivacyTaskClass_softClass;
  if (!getAMSAcknowledgePrivacyTaskClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAMSAcknowledgePrivacyTaskClass_block_invoke;
    v3[3] = &unk_1EA26B260;
    v3[4] = &v4;
    __getAMSAcknowledgePrivacyTaskClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB230A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getOBPrivacyImproveFitnessPlusIdentifier()
{
  id *v0;
  _Unwind_Exception *v2;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr_0;
  v7 = getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr_0;
  if (!getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_block_invoke;
    v3[3] = &unk_1EA26B260;
    v3[4] = &v4;
    __getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_block_invoke((uint64_t)v3);
    v0 = (id *)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v2 = (_Unwind_Exception *)__43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v2);
  }
  return *v0;
}

void sub_1DB230E20(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

Class __getAMSAcknowledgePrivacyTaskClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AppleMediaServicesLibraryCore_frameworkLibrary)
  {
    AppleMediaServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AppleMediaServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AMSAcknowledgePrivacyTask");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAMSAcknowledgePrivacyTaskClass_block_invoke_cold_1();
    free(v3);
  }
  getAMSAcknowledgePrivacyTaskClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (OnBoardingKitLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)OnBoardingKitLibraryCore_frameworkLibrary_0;
  }
  else
  {
    OnBoardingKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    v2 = (void *)OnBoardingKitLibraryCore_frameworkLibrary_0;
    if (!OnBoardingKitLibraryCore_frameworkLibrary_0)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "OBPrivacyImproveFitnessPlusIdentifier");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getASDSubscriptionEntitlementsClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AppStoreDaemonLibraryCore_frameworkLibrary)
  {
    AppStoreDaemonLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AppStoreDaemonLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("ASDSubscriptionEntitlements");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getASDSubscriptionEntitlementsClass_block_invoke_cold_1();
    free(v3);
  }
  getASDSubscriptionEntitlementsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

BOOL PUILocationIsActivePairedDevice()
{
  void *v0;

  PUIGetActivePairedDevice();
  v0 = (void *)objc_claimAutoreleasedReturnValue();

  return v0 != 0;
}

BOOL PUILocationIsDisplayNameForWatchApp(void *a1)
{
  void *v1;

  PUIDisplayNameForWatchApp(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1 != 0;
}

BOOL PUILocationIsWatchBundleIDForBundleID(void *a1)
{
  void *v1;

  PUIWatchBundleIDForBundleID(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1 != 0;
}

uint64_t PSUICLCopyAppsUsingLocation()
{
  void *v0;
  void *v1;
  uint64_t v2;
  _Unwind_Exception *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = getCLCopyAppsUsingLocationSymbolLoc_ptr_0;
  v8 = getCLCopyAppsUsingLocationSymbolLoc_ptr_0;
  if (!getCLCopyAppsUsingLocationSymbolLoc_ptr_0)
  {
    v1 = (void *)CoreLocationLibrary();
    v0 = dlsym(v1, "CLCopyAppsUsingLocation");
    v6[3] = (uint64_t)v0;
    getCLCopyAppsUsingLocationSymbolLoc_ptr_0 = v0;
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)__43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  return ((uint64_t (*)(uint64_t))v0)(v2);
}

id getCLLocationManagerClass_0()
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
    v3[3] = &unk_1EA26B260;
    v3[4] = &v4;
    __getCLLocationManagerClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB234D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t entityStateCallback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateLocationUsage");
}

id getCLAppStatusChangedNotification()
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
  v0 = (id *)getCLAppStatusChangedNotificationSymbolLoc_ptr;
  v7 = getCLAppStatusChangedNotificationSymbolLoc_ptr;
  if (!getCLAppStatusChangedNotificationSymbolLoc_ptr)
  {
    v1 = (void *)CoreLocationLibrary();
    v0 = (id *)dlsym(v1, "CLAppStatusChangedNotification");
    v5[3] = (uint64_t)v0;
    getCLAppStatusChangedNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)__43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

uint64_t appInstallCallback(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint8_t v5[16];

  _PUILoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB1FB000, v3, OS_LOG_TYPE_DEFAULT, "app installed", v5, 2u);
  }

  return objc_msgSend(a2, "reloadSpecifiers");
}

uint64_t appUninstallCallback(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint8_t v5[16];

  _PUILoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB1FB000, v3, OS_LOG_TYPE_DEFAULT, "app uninstalled", v5, 2u);
  }

  return objc_msgSend(a2, "reloadSpecifiers");
}

uint64_t isModificationAllowedForID(void *a1)
{
  void *v1;
  _BOOL8 v2;

  if (!objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.findmy")))
    return 1;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47018]) != 2;

  return v2;
}

id getPSGFindMyiPhoneControllerClass()
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
  v0 = (void *)getPSGFindMyiPhoneControllerClass_softClass;
  v7 = getPSGFindMyiPhoneControllerClass_softClass;
  if (!getPSGFindMyiPhoneControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPSGFindMyiPhoneControllerClass_block_invoke;
    v3[3] = &unk_1EA26B260;
    v3[4] = &v4;
    __getPSGFindMyiPhoneControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB236394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB236604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB236B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1DB23811C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id *location,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,id a53)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a53);
  _Unwind_Resume(a1);
}

void sub_1DB238DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB2392FC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1DB23AB10(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __loadLocationFillSystemImage_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("location.fill"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)locationFillSystemImage;
  locationFillSystemImage = v0;

  v2 = (void *)locationFillSystemImage;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemPurpleColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_flatImageWithColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithRenderingMode:", 1);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)locationFillSystemImageWithSystemPurpleColor;
  locationFillSystemImageWithSystemPurpleColor = v5;

  v7 = (void *)locationFillSystemImage;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_flatImageWithColor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithRenderingMode:", 1);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)locationFillSystemImageWithSecondaryLabelColor;
  locationFillSystemImageWithSecondaryLabelColor = v10;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("location"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemPurpleColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_flatImageWithColor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageWithRenderingMode:", 1);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)locationSystemImageWithSystemPurpleColor;
  locationSystemImageWithSystemPurpleColor = v14;

}

uint64_t CoreLocationLibrary()
{
  uint64_t v0;
  void *v2;

  if (!CoreLocationLibraryCore_frameworkLibrary_1)
    CoreLocationLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  v0 = CoreLocationLibraryCore_frameworkLibrary_1;
  if (!CoreLocationLibraryCore_frameworkLibrary_1)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getCLLocationManagerClass_block_invoke_0(uint64_t a1)
{
  Class result;

  CoreLocationLibrary();
  result = objc_getClass("CLLocationManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCLLocationManagerClass_block_invoke_cold_1();
  getCLLocationManagerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPSGFindMyiPhoneControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  GeneralSettingsUILibrary();
  result = objc_getClass("PSGFindMyiPhoneController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPSGFindMyiPhoneControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPSGFindMyiPhoneControllerClass_block_invoke_cold_1();
    return (Class)GeneralSettingsUILibrary();
  }
  return result;
}

uint64_t GeneralSettingsUILibrary()
{
  uint64_t v0;
  void *v2;

  if (!GeneralSettingsUILibraryCore_frameworkLibrary)
    GeneralSettingsUILibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = GeneralSettingsUILibraryCore_frameworkLibrary;
  if (!GeneralSettingsUILibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void PSPXTCCSettingsLimitedAccessSubtitle(void *a1)
{
  id v1;
  void (*PXTCCSettingsLimitedAccessSubtitleSymbolLoc)(id);
  void *v3;
  id v4;
  PUIPhotoServicesAuthorizationLevelController *v5;
  SEL v6;
  id v7;

  v1 = a1;
  PXTCCSettingsLimitedAccessSubtitleSymbolLoc = (void (*)(id))getPXTCCSettingsLimitedAccessSubtitleSymbolLoc();
  if (PXTCCSettingsLimitedAccessSubtitleSymbolLoc)
  {
    PXTCCSettingsLimitedAccessSubtitleSymbolLoc(v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v3;
  }
  else
  {
    v5 = (PUIPhotoServicesAuthorizationLevelController *)__43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
    -[PUIPhotoServicesAuthorizationLevelController setSpecifier:](v5, v6, v7);
  }
}

void sub_1DB23ED1C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id PUIPhotosPolicyBundleIdentifiersWithRecentPickerUsage()
{
  void *v0;
  double v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
    v1 = 2592000.0;
  else
    v1 = 86400.0;
  objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photosPickerPresentedLibraryLogsByClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    v8 = *MEMORY[0x1E0D744B0];
    v9 = *MEMORY[0x1E0D744B8];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", v8, (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceNow");
        if (v14 <= 0.0 && v1 > -v14)
          objc_msgSend(v0, "addObject:", v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  v16 = (void *)objc_msgSend(v0, "copy");
  return v16;
}

void sub_1DB23FB68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB241578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id *location,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,id a59)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a59);
  _Unwind_Resume(a1);
}

void sub_1DB242334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id *location,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,id a61)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a61);
  _Unwind_Resume(a1);
}

void PUIPhotosAuthorizationStatesForService(uint64_t a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = (void *)tcc_server_create();
  tcc_service_singleton_for_CF_name();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  _PUILoggingFacility();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = a1;
    _os_log_impl(&dword_1DB1FB000, v13, OS_LOG_TYPE_DEFAULT, "Requesting TCC auth records for service: %@", buf, 0xCu);
  }

  v17 = MEMORY[0x1E0C809B0];
  v14 = v10;
  v18 = v14;
  v15 = v11;
  v19 = v15;
  v16 = v12;
  v20 = v16;
  tcc_server_message_get_authorization_records_by_service();
  if (a2)
    *a2 = (id)objc_msgSend(v14, "copy", v17, 3221225472, __PUIPhotosAuthorizationStatesForService_block_invoke, &unk_1EA26C208, v14, v15, v16, a1);
  if (a3)
    *a3 = (id)objc_msgSend(v15, "copy");
  if (a4)
    *a4 = (id)objc_msgSend(v16, "copy");

}

void *getPXTCCSettingsFullAccessSubtitleSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getPXTCCSettingsFullAccessSubtitleSymbolLoc_ptr;
  v6 = getPXTCCSettingsFullAccessSubtitleSymbolLoc_ptr;
  if (!getPXTCCSettingsFullAccessSubtitleSymbolLoc_ptr)
  {
    v1 = (void *)PhotosUICoreLibrary();
    v0 = dlsym(v1, "PXTCCSettingsFullAccessSubtitle");
    v4[3] = (uint64_t)v0;
    getPXTCCSettingsFullAccessSubtitleSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DB24353C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t PhotosUICoreLibrary()
{
  uint64_t v0;
  void *v2;

  if (!PhotosUICoreLibraryCore_frameworkLibrary)
    PhotosUICoreLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = PhotosUICoreLibraryCore_frameworkLibrary;
  if (!PhotosUICoreLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *getPXTCCSettingsLimitedAccessSubtitleSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getPXTCCSettingsLimitedAccessSubtitleSymbolLoc_ptr;
  v6 = getPXTCCSettingsLimitedAccessSubtitleSymbolLoc_ptr;
  if (!getPXTCCSettingsLimitedAccessSubtitleSymbolLoc_ptr)
  {
    v1 = (void *)PhotosUICoreLibrary();
    v0 = dlsym(v1, "PXTCCSettingsLimitedAccessSubtitle");
    v4[3] = (uint64_t)v0;
    getPXTCCSettingsLimitedAccessSubtitleSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DB24367C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t gettcc_server_message_prompt_authorization_valueSymbolLoc()
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
  v0 = gettcc_server_message_prompt_authorization_valueSymbolLoc_ptr;
  v6 = gettcc_server_message_prompt_authorization_valueSymbolLoc_ptr;
  if (!gettcc_server_message_prompt_authorization_valueSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __gettcc_server_message_prompt_authorization_valueSymbolLoc_block_invoke;
    v2[3] = &unk_1EA26B260;
    v2[4] = &v3;
    __gettcc_server_message_prompt_authorization_valueSymbolLoc_block_invoke((uint64_t)v2);
    v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DB24372C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__gettcc_server_message_prompt_authorization_valueSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (TCCLibraryCore_frameworkLibrary)
  {
    v2 = (void *)TCCLibraryCore_frameworkLibrary;
  }
  else
  {
    TCCLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)TCCLibraryCore_frameworkLibrary;
    if (!TCCLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "tcc_server_message_prompt_authorization_value");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  gettcc_server_message_prompt_authorization_valueSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

void sub_1DB24467C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  _Block_object_dispose(&a42, 8);
  _Unwind_Resume(a1);
}

void *__getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke(uint64_t a1)
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
  result = dlsym(v2, "SBSCopyDisplayIdentifiers");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getSBSCopyDisplayIdentifiersSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DB244E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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
    v3[3] = &unk_1EA26B260;
    v3[4] = &v4;
    __getLockdownModeManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB244F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_WKSystemPreferencesClass()
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
  v0 = (void *)get_WKSystemPreferencesClass_softClass;
  v7 = get_WKSystemPreferencesClass_softClass;
  if (!get_WKSystemPreferencesClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __get_WKSystemPreferencesClass_block_invoke;
    v3[3] = &unk_1EA26B260;
    v3[4] = &v4;
    __get_WKSystemPreferencesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB2451EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUMUserManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!UserManagementLibraryCore_frameworkLibrary)
  {
    UserManagementLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!UserManagementLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("UMUserManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getUMUserManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getUMUserManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getLockdownModeManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!LockdownModeLibraryCore_frameworkLibrary)
  {
    LockdownModeLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!LockdownModeLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("LockdownModeManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getLockdownModeManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getLockdownModeManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getPSUIDeviceTakeOverControllerClass()
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
  v0 = (void *)getPSUIDeviceTakeOverControllerClass_softClass;
  v7 = getPSUIDeviceTakeOverControllerClass_softClass;
  if (!getPSUIDeviceTakeOverControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPSUIDeviceTakeOverControllerClass_block_invoke;
    v3[3] = &unk_1EA26B260;
    v3[4] = &v4;
    __getPSUIDeviceTakeOverControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB2455D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPSUIDeviceTakeOverControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!PreferencesUILibraryCore_frameworkLibrary)
  {
    PreferencesUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!PreferencesUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PSUIDeviceTakeOverController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getPSUIDeviceTakeOverControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getPSUIDeviceTakeOverControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DB245994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getCLLocationManagerClass_1()
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
  v0 = (void *)getCLLocationManagerClass_softClass_1;
  v7 = getCLLocationManagerClass_softClass_1;
  if (!getCLLocationManagerClass_softClass_1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCLLocationManagerClass_block_invoke_1;
    v3[3] = &unk_1EA26B260;
    v3[4] = &v4;
    __getCLLocationManagerClass_block_invoke_1((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB2464EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB24679C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB2478BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB24926C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

id getTUCallCapabilitiesClass()
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
  v0 = (void *)getTUCallCapabilitiesClass_softClass;
  v7 = getTUCallCapabilitiesClass_softClass;
  if (!getTUCallCapabilitiesClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getTUCallCapabilitiesClass_block_invoke;
    v3[3] = &unk_1EA26B260;
    v3[4] = &v4;
    __getTUCallCapabilitiesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB249350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCLLocationManagerClass_block_invoke_1(uint64_t a1)
{
  Class result;

  CoreLocationLibrary_0();
  result = objc_getClass("CLLocationManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCLLocationManagerClass_block_invoke_cold_1();
  getCLLocationManagerClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreLocationLibrary_0()
{
  uint64_t v0;
  void *v2;

  if (!CoreLocationLibraryCore_frameworkLibrary_2)
    CoreLocationLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  v0 = CoreLocationLibraryCore_frameworkLibrary_2;
  if (!CoreLocationLibraryCore_frameworkLibrary_2)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getTUCallCapabilitiesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
  {
    TelephonyUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("TUCallCapabilities");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getTUCallCapabilitiesClass_block_invoke_cold_1();
    free(v3);
  }
  getTUCallCapabilitiesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DB24AB7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB24AC58(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB24AF64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t compareConfigurationNames(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(a1, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "localizedCaseInsensitiveCompare:", v5);
  return v6;
}

uint64_t compareAppNames(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(a1, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "localizedCaseInsensitiveCompare:", v5);
  return v6;
}

void sub_1DB24D664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB24D9D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  id *v10;
  uint64_t v11;

  objc_destroyWeak(v10);
  objc_destroyWeak((id *)(v11 - 112));
  _Unwind_Resume(a1);
}

void sub_1DB24DAF8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB24EC7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose((const void *)(v31 - 152), 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

Class __getSFSafariViewControllerClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SafariServicesLibraryCore_frameworkLibrary_0)
  {
    SafariServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!SafariServicesLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SFSafariViewController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSFSafariViewControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getSFSafariViewControllerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAKAccountManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  AuthKitLibrary_0();
  result = objc_getClass("AKAccountManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAKAccountManagerClass_block_invoke_cold_1();
  getAKAccountManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AuthKitLibrary_0()
{
  uint64_t v0;
  void *v2;

  if (!AuthKitLibraryCore_frameworkLibrary_0)
    AuthKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  v0 = AuthKitLibraryCore_frameworkLibrary_0;
  if (!AuthKitLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getAKDeviceListRequestContextClass_block_invoke(uint64_t a1)
{
  Class result;

  AuthKitLibrary_0();
  result = objc_getClass("AKDeviceListRequestContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAKDeviceListRequestContextClass_block_invoke_cold_1();
  getAKDeviceListRequestContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

PUILockdownModeOnboardingCell *__getAKAppleIDAuthenticationControllerClass_block_invoke_0(uint64_t a1)
{
  PUILockdownModeOnboardingCell *result;
  PUILockdownModeOnboardingCell *v3;
  SEL v4;
  int64_t v5;
  id v6;

  AuthKitLibrary_0();
  result = (PUILockdownModeOnboardingCell *)objc_getClass("AKAppleIDAuthenticationController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAKAppleIDAuthenticationControllerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (PUILockdownModeOnboardingCell *)__getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1();
    return -[PUILockdownModeOnboardingCell initWithStyle:reuseIdentifier:](v3, v4, v5, v6);
  }
  return result;
}

id _PUILoggingFacility()
{
  if (_PUILoggingFacility_onceToken != -1)
    dispatch_once(&_PUILoggingFacility_onceToken, &__block_literal_global_23);
  return (id)_PUILoggingFacility_oslog;
}

id PUILogForCategory(unint64_t a1)
{
  if (a1 >= 2)
    PUILogForCategory_cold_1();
  if (PUILogForCategory_loggingToken != -1)
    dispatch_once(&PUILogForCategory_loggingToken, &__block_literal_global_5);
  return (id)PUILogForCategory_logObjects[a1];
}

uint64_t sub_1DB2529B0()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_1DB255778();
}

void sub_1DB252A34()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v1 = (void *)sub_1DB255730();
  sub_1DB252B0C(MEMORY[0x1E0DEE9D8]);
  type metadata accessor for OpenExternalURLOptionsKey();
  sub_1DB253940(&qword_1F02D3750, (uint64_t)&unk_1DB25A0F4);
  v2 = (id)sub_1DB255784();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_openURL_options_completionHandler_, v1, v2, 0);

}

unint64_t sub_1DB252B0C(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D3758);
  v2 = sub_1DB2557FC();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1DB25387C(v6, (uint64_t)&v13);
    v7 = v13;
    result = sub_1DB253248(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_1DB2538C4(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
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

id sub_1DB252C70(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  void *v5;
  objc_class *ObjectType;
  void *v10;
  id v11;
  id v12;
  objc_super v14;

  v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    v10 = (void *)sub_1DB2557A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v14.receiver = v5;
  v14.super_class = ObjectType;
  v11 = objc_msgSendSuper2(&v14, sel_initWithStyle_reuseIdentifier_specifier_, a1, v10, a4);

  v12 = v11;
  if (v12)

  return v12;
}

id sub_1DB252E60()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PrivacySettingsPlacardCell()
{
  return objc_opt_self();
}

uint64_t sub_1DB252EB4(uint64_t a1, uint64_t a2)
{
  return sub_1DB252FFC(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

uint64_t sub_1DB252EC0(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_1DB2557B4();
  *a2 = 0;
  return result;
}

uint64_t sub_1DB252F34(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_1DB2557C0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1DB252FB0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_1DB2557CC();
  v2 = sub_1DB2557A8();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1DB252FF0(uint64_t a1, uint64_t a2)
{
  return sub_1DB252FFC(a1, a2, MEMORY[0x1E0DEA950]);
}

uint64_t sub_1DB252FFC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1DB2557CC();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1DB253038()
{
  sub_1DB2557CC();
  sub_1DB2557E4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DB253078()
{
  uint64_t v0;

  sub_1DB2557CC();
  sub_1DB255820();
  sub_1DB2557E4();
  v0 = sub_1DB25582C();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1DB2530E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_1DB2557CC();
  v2 = v1;
  if (v0 == sub_1DB2557CC() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_1DB255814();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1DB253170@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1DB2557A8();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1DB2531B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1DB2557CC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1DB2531DC()
{
  sub_1DB253940(&qword_1F02D3750, (uint64_t)&unk_1DB25A0F4);
  sub_1DB253940(&qword_1F02D3788, (uint64_t)&unk_1DB25A048);
  return sub_1DB255808();
}

unint64_t sub_1DB253248(uint64_t a1)
{
  uint64_t v2;

  sub_1DB2557CC();
  sub_1DB255820();
  sub_1DB2557E4();
  v2 = sub_1DB25582C();
  swift_bridgeObjectRelease();
  return sub_1DB2532C8(a1, v2);
}

unint64_t sub_1DB2532C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_1DB2557CC();
    v8 = v7;
    if (v6 == sub_1DB2557CC() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_1DB255814();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_1DB2557CC();
          v15 = v14;
          if (v13 == sub_1DB2557CC() && v15 == v16)
            break;
          v18 = sub_1DB255814();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_1DB25343C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t ObjCClassFromMetadata;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21[6];

  v1 = v0;
  swift_getObjectType();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D3730);
  v16 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78]();
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DB255748();
  MEMORY[0x1E0C80A78]();
  sub_1DB25579C();
  MEMORY[0x1E0C80A78]();
  objc_msgSend(v1, sel_setSelectionStyle_, 0);
  sub_1DB255790();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v6 = (void *)objc_opt_self();
  v7 = objc_msgSend(v6, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1DB25573C();
  v8 = sub_1DB2557D8();
  v10 = v9;
  sub_1DB255790();
  v11 = objc_msgSend(v6, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1DB25573C();
  v12 = sub_1DB2557D8();
  v17 = v8;
  v18 = v10;
  v19 = v12;
  v20 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D3738);
  sub_1DB2537AC(&qword_1F02D3740, &qword_1F02D3738, MEMORY[0x1E0D8D640]);
  sub_1DB255760();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DB25576C();
  v21[3] = v2;
  v21[4] = sub_1DB2537AC(&qword_1F02D3748, &qword_1F02D3730, MEMORY[0x1E0CDC120]);
  __swift_allocate_boxed_opaque_existential_1(v21);
  sub_1DB255754();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v4, v2);
  return MEMORY[0x1DF0AAB70](v21);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0AB4DC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1DB25375C()
{
  return sub_1DB2529B0();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0AB4E8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1DB2537AC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1DF0AB4F4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
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

void type metadata accessor for OpenExternalURLOptionsKey()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1F02D3768)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1F02D3768);
  }
}

uint64_t sub_1DB25387C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D3760);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1DB2538C4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1DB2538D4()
{
  return sub_1DB253940(&qword_1F02D3770, (uint64_t)&unk_1DB25A00C);
}

uint64_t sub_1DB2538F8()
{
  return sub_1DB253940(&qword_1F02D3778, (uint64_t)&unk_1DB259FE0);
}

uint64_t sub_1DB25391C()
{
  return sub_1DB253940(&qword_1F02D3780, (uint64_t)&unk_1DB25A07C);
}

uint64_t sub_1DB253940(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for OpenExternalURLOptionsKey();
    result = MEMORY[0x1DF0AB4F4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DB253980()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t get_aks_client_connection()
{
  uint64_t result;

  if (get_aks_client_dispatch_queue_onceToken != -1)
    dispatch_once(&get_aks_client_dispatch_queue_onceToken, &__block_literal_global_168_0);
  dispatch_sync((dispatch_queue_t)get_aks_client_dispatch_queue_connection_queue, &__block_literal_global_150_0);
  result = get_aks_client_connection_connection;
  if (!get_aks_client_connection_connection)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return get_aks_client_connection_connection;
  }
  return result;
}

void __get_aks_client_connection_block_invoke()
{
  if (!get_aks_client_connection_connection)
    get_aks_client_connection_connection = _copy_aks_client_connection("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
}

dispatch_queue_t __get_aks_client_dispatch_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("aks-client-queue", 0);
  get_aks_client_dispatch_queue_connection_queue = (uint64_t)result;
  return result;
}

uint64_t _copy_aks_client_connection(char *path, const char *a2)
{
  mach_port_t v3;
  io_service_t v4;
  task_port_t *v5;
  io_object_t v6;
  kern_return_t v7;
  const __CFDictionary *v8;
  io_service_t MatchingService;
  io_object_t v10;
  uint64_t result;
  kern_return_t v12;
  io_connect_t connect;

  connect = 0;
  v3 = *MEMORY[0x1E0CBBAB8];
  v4 = IORegistryEntryFromPath(*MEMORY[0x1E0CBBAB8], path);
  v5 = (task_port_t *)MEMORY[0x1E0C83DA0];
  if (!v4 || (v6 = v4, v7 = IOServiceOpen(v4, *MEMORY[0x1E0C83DA0], 0, &connect), IOObjectRelease(v6), v7))
  {
    v8 = IOServiceMatching(a2);
    MatchingService = IOServiceGetMatchingService(v3, v8);
    if (MatchingService)
    {
      v10 = MatchingService;
      IOServiceOpen(MatchingService, *v5, 0, &connect);
      IOObjectRelease(v10);
    }
  }
  result = connect;
  if (connect)
  {
    v12 = IOConnectCallMethod(connect, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    result = connect;
    if (v12)
    {
      IOServiceClose(connect);
      return 0;
    }
  }
  return result;
}

uint64_t aks_bak_get_beacon_internal()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  size_t v5;
  size_t v6;
  const void *v7;
  const void *v8;
  uint64_t v9;
  mach_port_t aks_client_connection;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  size_t v15;
  uint64_t input[2];
  _BYTE __s[16384];
  __int128 v18;
  _BYTE v19[28];
  uint64_t v20;

  v0 = MEMORY[0x1E0C80A78]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = v0;
  v20 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  memset(v19, 0, sizeof(v19));
  bzero(__s, 0x4000uLL);
  v15 = 0x4000;
  input[0] = 1;
  input[1] = v9;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v11 = IOConnectCallMethod(aks_client_connection, 0x87u, input, 2u, v8, v6, 0, 0, __s, &v15);
    if ((_DWORD)v11)
    {
      v13 = v11;
    }
    else
    {
      __memcpy_chk();
      *v2 = 44;
      v12 = calloc(0x2CuLL, 1uLL);
      *v4 = v12;
      if (v12)
      {
        __memcpy_chk();
        v13 = 0;
      }
      else
      {
        v13 = 3758097085;
      }
    }
  }
  else
  {
    v13 = 3758097084;
    fprintf((FILE *)*MEMORY[0x1E0C80C20], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_bak_get_beacon_internal", ":", 3491, "", 0, "", "");
  }
  memset_s(__s, 0x4000uLL, 0, 0x4000uLL);
  return v13;
}

uint64_t aks_bak_get_beacon()
{
  uint64_t beacon_internal;

  beacon_internal = aks_bak_get_beacon_internal();
  if ((_DWORD)beacon_internal)
    return beacon_internal;
  else
    return 3758604312;
}

uint64_t __getFKBankConnectOfflineLabConsentCoordinatorClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getFPAccessControlManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getFPAccessControlManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1(v0);
}

void __getNudityDetectionPreferencesHelperClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getHKHealthStoreClass_block_invoke_cold_1(v0);
}

void __getHKHealthStoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getCLLocationManagerClass_block_invoke_cold_1(v0);
}

void __getCLLocationManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  -[PUITCCAccessController setSpecifier:].cold.1(v0);
}

uint64_t __getRTCReportingClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCloudTelemetryReporterClass_block_invoke_cold_1(v0);
}

uint64_t __getCloudTelemetryReporterClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAATransparencyLoggingClass_block_invoke_cold_1(v0);
}

uint64_t __getAATransparencyLoggingClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __get_DPReportFileManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getSPMLLoggingClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPLDiagnosticsClass_block_invoke_cold_1(v0);
}

uint64_t __getPLDiagnosticsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPLDatabaseReaderClass_block_invoke_cold_1(v0);
}

uint64_t __getPLDatabaseReaderClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getOBPrivacyPresenterClass_block_invoke_cold_1(v0);
}

uint64_t __getOBPrivacyPresenterClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSFSafariViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getSFSafariViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getNRPairedDeviceRegistryClass_block_invoke_cold_1(v0);
}

uint64_t __getNRPairedDeviceRegistryClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAFSettingsConnectionClass_block_invoke_cold_1(v0);
}

uint64_t __getAFSettingsConnectionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCIDVUIIdentityProofingDataSharingFlowManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getCIDVUIIdentityProofingDataSharingFlowManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getHealthAppAnalyticsStoreClass_block_invoke_cold_1(v0);
}

uint64_t __getHealthAppAnalyticsStoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getHKHealthRecordsStoreClass_block_invoke_cold_1(v0);
}

uint64_t __getHKHealthRecordsStoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __44__PUIAccessoriesController_refreshDADevices__block_invoke_2_cold_1(v0);
}

uint64_t __getPAAccessReaderClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __72__PUIContactsAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2_cold_1(v0);
}

uint64_t __getCNPrivateAccessAggregatorClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCNLimitedAccessContactPickerViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getCNLimitedAccessContactPickerViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCNContactGroupVisualizerClass_block_invoke_cold_1(v0);
}

uint64_t __getCNContactGroupVisualizerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __PUIContactsAuthorizationStatesForService_block_invoke_cold_1(v0);
}

void PUIIsUserParcElisabethEligible_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB1FB000, log, OS_LOG_TYPE_ERROR, "PE:Unable to determine eligibility ", v1, 2u);
}

void PUIIsUserParcElisabethEligible_cold_2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DB1FB000, a2, OS_LOG_TYPE_ERROR, "PE: Cannot determine eligibility due to error: %d", (uint8_t *)v2, 8u);
}

uint64_t __getAMSAcknowledgePrivacyTaskClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getASDSubscriptionEntitlementsClass_block_invoke_cold_1(v0);
}

uint64_t __getASDSubscriptionEntitlementsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __56__PUILocationServicesListController_updateLocationUsage__block_invoke_cold_1(v0);
}

uint64_t __getPSGFindMyiPhoneControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __77__PUIPhotoServicesAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2_cold_1(v0);
}

uint64_t __getUMUserManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getLockdownModeManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getLockdownModeManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __get_WKSystemPreferencesClass_block_invoke_cold_1(v0);
}

uint64_t __getPSUIDeviceTakeOverControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __69__PUIAccessoriesAppSpecificControllerViewController_refreshDADevices__block_invoke_2_cold_1(v0);
}

uint64_t __getTUCallCapabilitiesClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[PUILockdownModeController init].cold.1(v0);
}

void __getAKAccountManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAKDeviceListRequestContextClass_block_invoke_cold_1(v0);
}

void __getAKDeviceListRequestContextClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  -[PUIMotionFitnessController specifiers].cold.1(v0);
}

void PUILogForCategory_cold_1()
{
  __assert_rtn("PUILogForCategory", "PUILogging.m", 23, "category < PUILoggingCategoryCount");
}

uint64_t sub_1DB255730()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1DB25573C()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1DB255748()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1DB255754()
{
  return MEMORY[0x1E0CDC100]();
}

uint64_t sub_1DB255760()
{
  return MEMORY[0x1E0CDC108]();
}

uint64_t sub_1DB25576C()
{
  return MEMORY[0x1E0CDD3C0]();
}

uint64_t sub_1DB255778()
{
  return MEMORY[0x1E0D8D630]();
}

uint64_t sub_1DB255784()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1DB255790()
{
  return MEMORY[0x1E0CB18A0]();
}

uint64_t sub_1DB25579C()
{
  return MEMORY[0x1E0CB18F8]();
}

uint64_t sub_1DB2557A8()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1DB2557B4()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1DB2557C0()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1DB2557CC()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1DB2557D8()
{
  return MEMORY[0x1E0CB1A40]();
}

uint64_t sub_1DB2557E4()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1DB2557F0()
{
  return MEMORY[0x1E0DC2B20]();
}

uint64_t sub_1DB2557FC()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1DB255808()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1DB255814()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1DB255820()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1DB25582C()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t ADClientSetValueForScalarKey()
{
  return MEMORY[0x1E0CF63D8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C98000](bundle);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1E0C980D0](allocator, bundleURL);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1E0C980E8](bundleID);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98130](bundle);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988C8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFArrayRef CFPreferencesCopyApplicationList(CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x1E0C98A48](userName, hostName);
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

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t GEOGetDefaultBOOL()
{
  return MEMORY[0x1E0D265E0]();
}

uint64_t GEOGetDefaultInteger()
{
  return MEMORY[0x1E0D265E8]();
}

uint64_t GEOSetDefault()
{
  return MEMORY[0x1E0D26B20]();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD80](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1E0CBB918](*(_QWORD *)&mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1E0CBBA10](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t LICreateIconForBundle()
{
  return MEMORY[0x1E0D4E3D8]();
}

uint64_t LICreateIconForImage()
{
  return MEMORY[0x1E0D4E3E0]();
}

uint64_t LocalizableGTStringKeyForKey()
{
  return MEMORY[0x1E0D80440]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t PSBlankIconImage()
{
  return MEMORY[0x1E0D80718]();
}

uint64_t PSBundlePathForPreferenceBundle()
{
  return MEMORY[0x1E0D80730]();
}

uint64_t PSIsInEDUMode()
{
  return MEMORY[0x1E0D80888]();
}

uint64_t PSIsLocationRestricted()
{
  return MEMORY[0x1E0D80890]();
}

uint64_t PSIsRunningInAssistant()
{
  return MEMORY[0x1E0D808A0]();
}

uint64_t PSIsiPad()
{
  return MEMORY[0x1E0D808A8]();
}

uint64_t PSRoundToPixel()
{
  return MEMORY[0x1E0D808E8]();
}

uint64_t PSSiriImage()
{
  return MEMORY[0x1E0D80900]();
}

uint64_t PSUsedByManagedAccount()
{
  return MEMORY[0x1E0D80980]();
}

uint64_t PreferencesTableViewFooterColor()
{
  return MEMORY[0x1E0D809A8]();
}

uint64_t PreferencesTableViewFooterFont()
{
  return MEMORY[0x1E0D809B0]();
}

uint64_t SFIsAppWithBundleIDInstalled()
{
  return MEMORY[0x1E0D8D668]();
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return MEMORY[0x1E0D8D678]();
}

uint64_t SFRuntimeAbsoluteFilePathForPath()
{
  return MEMORY[0x1E0D8D6B0]();
}

uint64_t ScreenScale()
{
  return MEMORY[0x1E0D809B8]();
}

uint64_t SpecifiersFromPlist()
{
  return MEMORY[0x1E0D809C0]();
}

uint64_t TCCAccessCopyBundleIdentifiersDisabledForService()
{
  return MEMORY[0x1E0DB0FA0]();
}

uint64_t TCCAccessCopyBundleIdentifiersForService()
{
  return MEMORY[0x1E0DB0FA8]();
}

uint64_t TCCAccessCopyInformation()
{
  return MEMORY[0x1E0DB0FB0]();
}

uint64_t TCCAccessGetOverride()
{
  return MEMORY[0x1E0DB0FD8]();
}

uint64_t TCCAccessSetForBundleId()
{
  return MEMORY[0x1E0DB1070]();
}

uint64_t TCCAccessSetOverride()
{
  return MEMORY[0x1E0DB1078]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0DC4910](category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0DC4BC0](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0DC4BD8]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0DC4BE8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0DC4BF0]();
}

uint64_t _AXSAudioDonationSiriImprovementEnabled()
{
  return MEMORY[0x1E0DDD5D0]();
}

uint64_t _AXSSetAudioDonationSiriImprovementEnabled()
{
  return MEMORY[0x1E0DDDBB8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1E0C81828](__count, __size);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
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

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1E0C840D0](__s, __smax, *(_QWORD *)&__c, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
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

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

uint64_t tcc_authorization_record_get_authorization_right()
{
  return MEMORY[0x1E0DB1208]();
}

uint64_t tcc_authorization_record_get_service()
{
  return MEMORY[0x1E0DB1220]();
}

uint64_t tcc_authorization_record_get_subject_identity()
{
  return MEMORY[0x1E0DB1230]();
}

uint64_t tcc_identity_create()
{
  return MEMORY[0x1E0DB1290]();
}

uint64_t tcc_identity_get_identifier()
{
  return MEMORY[0x1E0DB12A0]();
}

uint64_t tcc_server_create()
{
  return MEMORY[0x1E0DB1320]();
}

uint64_t tcc_server_message_get_authorization_records_by_identity()
{
  return MEMORY[0x1E0DB1328]();
}

uint64_t tcc_server_message_get_authorization_records_by_service()
{
  return MEMORY[0x1E0DB1330]();
}

uint64_t tcc_server_message_prompt_authorization_value()
{
  return MEMORY[0x1E0DB1340]();
}

uint64_t tcc_server_message_set_authorization_value()
{
  return MEMORY[0x1E0DB1360]();
}

uint64_t tcc_service_get_name()
{
  return MEMORY[0x1E0DB1380]();
}

uint64_t tcc_service_singleton_for_CF_name()
{
  return MEMORY[0x1E0DB1390]();
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C85F00](xBOOL);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

