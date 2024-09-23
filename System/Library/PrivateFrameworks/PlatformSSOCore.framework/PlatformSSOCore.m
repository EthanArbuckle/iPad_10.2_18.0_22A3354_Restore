id PO_LOG_POPrebootDeviceConfiguration()
{
  if (PO_LOG_POPrebootDeviceConfiguration_once != -1)
    dispatch_once(&PO_LOG_POPrebootDeviceConfiguration_once, &__block_literal_global_57);
  return (id)PO_LOG_POPrebootDeviceConfiguration_log;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id PO_LOG_POJWT()
{
  if (PO_LOG_POJWT_once != -1)
    dispatch_once(&PO_LOG_POJWT_once, &__block_literal_global_110);
  return (id)PO_LOG_POJWT_log;
}

id PO_LOG_POKeyWrap()
{
  if (PO_LOG_POKeyWrap_once != -1)
    dispatch_once(&PO_LOG_POKeyWrap_once, &__block_literal_global_40);
  return (id)PO_LOG_POKeyWrap_log;
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id PO_LOG_POUserConfiguration()
{
  if (PO_LOG_POUserConfiguration_once != -1)
    dispatch_once(&PO_LOG_POUserConfiguration_once, &__block_literal_global_1);
  return (id)PO_LOG_POUserConfiguration_log;
}

id PO_LOG_PODeviceConfiguration()
{
  if (PO_LOG_PODeviceConfiguration_once != -1)
    dispatch_once(&PO_LOG_PODeviceConfiguration_once, &__block_literal_global_301);
  return (id)PO_LOG_PODeviceConfiguration_log;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_2_1@<X0>(void *a1@<X0>, uint64_t x8_0@<X8>)
{
  uint64_t v3;

  *(_QWORD *)(v3 - 40) = x8_0;
  return objc_msgSend(a1, "sharedDeviceKeys");
}

uint64_t OUTLINED_FUNCTION_4()
{
  uint64_t v0;

  return v0;
}

id PO_LOG_POKeychainHelper()
{
  if (PO_LOG_POKeychainHelper_once != -1)
    dispatch_once(&PO_LOG_POKeychainHelper_once, &__block_literal_global_32);
  return (id)PO_LOG_POKeychainHelper_log;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_24441C0C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

id PO_LOG_PODaemonCoreProcess()
{
  if (PO_LOG_PODaemonCoreProcess_once != -1)
    dispatch_once(&PO_LOG_PODaemonCoreProcess_once, &__block_literal_global_219);
  return (id)PO_LOG_PODaemonCoreProcess_log;
}

void sub_24441EDB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24441F118(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24441F610(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24441F974(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class __getPODirectoryServicesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!PlatformSSOLibraryCore_frameworkLibrary)
  {
    PlatformSSOLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!PlatformSSOLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PODirectoryServices");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getPODirectoryServicesClass_block_invoke_cold_1();
    free(v3);
  }
  getPODirectoryServicesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_2_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id PO_LOG_POKeyBag()
{
  if (PO_LOG_POKeyBag_once != -1)
    dispatch_once(&PO_LOG_POKeyBag_once, &__block_literal_global_3);
  return (id)PO_LOG_POKeyBag_log;
}

void sub_244420218(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2444202A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_244420394(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_244420548(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id PO_LOG_POSecKeyHelper()
{
  if (PO_LOG_POSecKeyHelper_once != -1)
    dispatch_once(&PO_LOG_POSecKeyHelper_once, &__block_literal_global_124);
  return (id)PO_LOG_POSecKeyHelper_log;
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id PO_LOG_PODiagnostics()
{
  if (PO_LOG_PODiagnostics_once != -1)
    dispatch_once(&PO_LOG_PODiagnostics_once, &__block_literal_global_1017);
  return (id)PO_LOG_PODiagnostics_log;
}

id PO_LOG_POAuthenticationProcess()
{
  if (PO_LOG_POAuthenticationProcess_once != -1)
    dispatch_once(&PO_LOG_POAuthenticationProcess_once, &__block_literal_global_1020);
  return (id)PO_LOG_POAuthenticationProcess_log;
}

void sub_244430EF8()
{
  objc_end_catch();
  JUMPOUT(0x244430F00);
}

void OUTLINED_FUNCTION_3_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_6_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_13(void *a1, const char *a2)
{
  uint64_t v2;

  return objc_msgSend(a1, "initWithData:encoding:", v2, 4);
}

void OUTLINED_FUNCTION_14(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_16(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 32), "statusCode");
}

uint64_t OUTLINED_FUNCTION_18()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_19(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_244439E80(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id PO_LOG_POUserLoginConfiguration()
{
  if (PO_LOG_POUserLoginConfiguration_once != -1)
    dispatch_once(&PO_LOG_POUserLoginConfiguration_once, &__block_literal_global_84);
  return (id)PO_LOG_POUserLoginConfiguration_log;
}

id PO_LOG_POXMLHelper()
{
  if (PO_LOG_POXMLHelper_once != -1)
    dispatch_once(&PO_LOG_POXMLHelper_once, &__block_literal_global_5);
  return (id)PO_LOG_POXMLHelper_log;
}

id PO_LOG_POJWTSigning()
{
  if (PO_LOG_POJWTSigning_once != -1)
    dispatch_once(&PO_LOG_POJWTSigning_once, &__block_literal_global_186);
  return (id)PO_LOG_POJWTSigning_log;
}

uint64_t OUTLINED_FUNCTION_4_2(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 32);
}

void sub_244440078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
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

id PO_LOG_POCredentialUtil()
{
  if (PO_LOG_POCredentialUtil_once != -1)
    dispatch_once(&PO_LOG_POCredentialUtil_once, &__block_literal_global_37);
  return (id)PO_LOG_POCredentialUtil_log;
}

id PO_LOG_POJWTHeader()
{
  if (PO_LOG_POJWTHeader_once != -1)
    dispatch_once(&PO_LOG_POJWTHeader_once, &__block_literal_global_126);
  return (id)PO_LOG_POJWTHeader_log;
}

void sub_244444B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
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

id PO_LOG_POACMHelper()
{
  if (PO_LOG_POACMHelper_once != -1)
    dispatch_once(&PO_LOG_POACMHelper_once, &__block_literal_global_17);
  return (id)PO_LOG_POACMHelper_log;
}

id getSOUtilsClass()
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
  v0 = (void *)getSOUtilsClass_softClass;
  v7 = getSOUtilsClass_softClass;
  if (!getSOUtilsClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSOUtilsClass_block_invoke;
    v3[3] = &unk_2514FFCD8;
    v3[4] = &v4;
    __getSOUtilsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2444451FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PO_LOG_POPreferences()
{
  if (PO_LOG_POPreferences_once != -1)
    dispatch_once(&PO_LOG_POPreferences_once, &__block_literal_global_7);
  return (id)PO_LOG_POPreferences_log;
}

Class __getSOUtilsClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AppSSOCoreLibraryCore_frameworkLibrary)
  {
    AppSSOCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AppSSOCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SOUtils");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSOUtilsClass_block_invoke_cold_1();
    free(v3);
  }
  getSOUtilsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id PO_LOG_POAgentCoreProcess()
{
  if (PO_LOG_POAgentCoreProcess_once != -1)
    dispatch_once(&PO_LOG_POAgentCoreProcess_once, &__block_literal_global_198);
  return (id)PO_LOG_POAgentCoreProcess_log;
}

id PO_LOG_PODaemonCoreConnection()
{
  if (PO_LOG_PODaemonCoreConnection_once != -1)
    dispatch_once(&PO_LOG_PODaemonCoreConnection_once, &__block_literal_global_113);
  return (id)PO_LOG_PODaemonCoreConnection_log;
}

void sub_24444B8B0(_Unwind_Exception *a1)
{
  void *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 72));
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24444BEA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24444C2D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id PO_LOG_POConfigurationManager()
{
  if (PO_LOG_POConfigurationManager_once != -1)
    dispatch_once(&PO_LOG_POConfigurationManager_once, &__block_literal_global_197);
  return (id)PO_LOG_POConfigurationManager_log;
}

void sub_24444C568(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24444C7B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24444CA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
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

void sub_24444CD20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_24444CF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_24444D1F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_24444D5A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_24444DA14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24444DD80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24444DFC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_24444E248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24444E488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_24444E710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24444E950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_24444EB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PO_LOG_POAuthPluginCoreProcess()
{
  if (PO_LOG_POAuthPluginCoreProcess_once != -1)
    dispatch_once(&PO_LOG_POAuthPluginCoreProcess_once, &__block_literal_global_11);
  return (id)PO_LOG_POAuthPluginCoreProcess_log;
}

void sub_24444F384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

id PO_LOG_POJWTEncryption()
{
  if (PO_LOG_POJWTEncryption_once != -1)
    dispatch_once(&PO_LOG_POJWTEncryption_once, &__block_literal_global_194);
  return (id)PO_LOG_POJWTEncryption_log;
}

id PO_LOG_POLoginConfiguration()
{
  if (PO_LOG_POLoginConfiguration_once != -1)
    dispatch_once(&PO_LOG_POLoginConfiguration_once, &__block_literal_global_548);
  return (id)PO_LOG_POLoginConfiguration_log;
}

void sub_2444539DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_2444584B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

id PO_LOG_POWSTrustProcess()
{
  if (PO_LOG_POWSTrustProcess_once != -1)
    dispatch_once(&PO_LOG_POWSTrustProcess_once, &__block_literal_global_326);
  return (id)PO_LOG_POWSTrustProcess_log;
}

id PO_LOG_POUserLoginState()
{
  if (PO_LOG_POUserLoginState_once != -1)
    dispatch_once(&PO_LOG_POUserLoginState_once, &__block_literal_global_14);
  return (id)PO_LOG_POUserLoginState_log;
}

id PO_LOG_POServiceCoreConnection()
{
  if (PO_LOG_POServiceCoreConnection_once != -1)
    dispatch_once(&PO_LOG_POServiceCoreConnection_once, &__block_literal_global_96);
  return (id)PO_LOG_POServiceCoreConnection_log;
}

void sub_24445D06C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

id PO_LOG_POTokenHelper()
{
  if (PO_LOG_POTokenHelper_once != -1)
    dispatch_once(&PO_LOG_POTokenHelper_once, &__block_literal_global_18);
  return (id)PO_LOG_POTokenHelper_log;
}

id PO_LOG_POConfigurationVersion()
{
  if (PO_LOG_POConfigurationVersion_once != -1)
    dispatch_once(&PO_LOG_POConfigurationVersion_once, &__block_literal_global_19);
  return (id)PO_LOG_POConfigurationVersion_log;
}

void sub_24445FE34(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_24445FF98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_244460100(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_244460174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

id PO_LOG_POCoreConfigurationUtil()
{
  if (PO_LOG_POCoreConfigurationUtil_once != -1)
    dispatch_once(&PO_LOG_POCoreConfigurationUtil_once, &__block_literal_global_39);
  return (id)PO_LOG_POCoreConfigurationUtil_log;
}

id PO_LOG_POUserUnlockKey()
{
  if (PO_LOG_POUserUnlockKey_once != -1)
    dispatch_once(&PO_LOG_POUserUnlockKey_once, &__block_literal_global_39_0);
  return (id)PO_LOG_POUserUnlockKey_log;
}

uint64_t sub_244463158()
{
  uint64_t v0;

  v0 = sub_24449C0E0();
  __swift_allocate_value_buffer(v0, qword_257365FB8);
  __swift_project_value_buffer(v0, (uint64_t)qword_257365FB8);
  return sub_24449C0D4();
}

void *variable initialization expression of POCryptoKitHPKE_P384_SHA384_AES_GCM_256.encryptionAlgorithm()
{
  return &unk_251520F78;
}

id POCryptoKitHPKE_P384_SHA384_AES_GCM_256.encryptionAlgorithm.getter()
{
  uint64_t v0;

  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P384_SHA384_AES_GCM_256_encryptionAlgorithm));
}

id POCryptoKitHPKE_P384_SHA384_AES_GCM_256.__allocating_init()()
{
  objc_class *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char *v4;
  id v5;
  uint64_t v7;

  v1 = sub_24449C290();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (char *)objc_allocWithZone(v0);
  *(_QWORD *)&v4[OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P384_SHA384_AES_GCM_256_encryptionAlgorithm] = 0x251520F78;
  v5 = &unk_251520F78;
  sub_24449C26C();
  return POCryptoKitHPKE.init(cipherSuite:)((uint64_t)v3);
}

id POCryptoKitHPKE_P384_SHA384_AES_GCM_256.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  uint64_t v6;

  v1 = sub_24449C290();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P384_SHA384_AES_GCM_256_encryptionAlgorithm) = 0x251520F78;
  v4 = &unk_251520F78;
  sub_24449C26C();
  return POCryptoKitHPKE.init(cipherSuite:)((uint64_t)v3);
}

uint64_t POCryptoKitHPKE_P384_SHA384_AES_GCM_256.decodeAndDecryptJWT(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, void *a9)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  __SecKey *v35;
  CFDataRef v36;
  CFDataRef v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  void *v43;
  void *v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  char *v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  CFDataRef v53;
  CFDataRef v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  char *v77;
  void *v78;
  char *v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;

  v76 = a7;
  v74 = a4;
  v75 = a1;
  v72 = a3;
  v78 = a2;
  v73 = sub_24449C3D4();
  v66 = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73);
  v77 = (char *)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_24449C440();
  v70 = *(_QWORD *)(v13 - 8);
  v71 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v69 = (char *)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_24449C1E8();
  v67 = *(_QWORD *)(v15 - 8);
  v68 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v79 = (char *)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_257365090);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v65 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v65 - v21;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_257365098);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v65 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v65 - v27;
  v29 = sub_24449C170();
  v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56);
  v30(v28, 1, 1, v29);
  if (a6 >> 60 == 15
    || (v80 = a5,
        v81 = a6,
        sub_2444648E8(a5, a6),
        sub_24449C158(),
        sub_2444649C8((uint64_t)v28, &qword_257365098),
        v30(v26, 0, 1, v29),
        sub_244464A04((uint64_t)v26, (uint64_t)v28, &qword_257365098),
        a8 >> 60 != 15))
  {
    v65 = a8;
    v32 = sub_24449C3BC();
    v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56);
    v33(v22, 1, 1, v32);
    if (a9)
    {
      v34 = (uint64_t)v22;
      v35 = a9;
      v36 = SecKeyCopyExternalRepresentation(v35, 0);
      if (v36)
      {
        v37 = v36;
        v38 = sub_24449C098();
        v40 = v39;

        v80 = v38;
        v81 = v40;
        sub_2444648E8(v38, v40);
        v41 = v82;
        sub_24449C3B0();
        v82 = v41;
        if (v41)
        {

          sub_24446492C(v38, v40);
          sub_2444649C8(v34, &qword_257365090);
          return sub_2444649C8((uint64_t)v28, &qword_257365098);
        }
        sub_2444649C8(v34, &qword_257365090);

        sub_24446492C(v38, v40);
        v33(v20, 0, 1, v32);
        v22 = (char *)v34;
        sub_244464A04((uint64_t)v20, v34, &qword_257365090);
      }
      else
      {

      }
    }
    v43 = (void *)objc_opt_self();
    v44 = v78;
    v45 = objc_msgSend(v43, sel_isSEPKey_, v78);
    v46 = v82;
    v47 = (uint64_t)v79;
    if (v45)
    {
      v48 = v44;
      sub_24449C1DC();
      if (!v46)
      {
        if (v74)
        {
          v49 = v69;
          sub_24449C428();
          v50 = sub_24449C410();
          v52 = v51;
          (*(void (**)(char *, uint64_t))(v70 + 8))(v49, v71);
        }
        else
        {
          v50 = 0;
          v52 = 0xF000000000000000;
        }
        v64 = v68;
        POCryptoKitHPKE.decodeAndDecryptJWT<A>(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(v75, v47, v50, v52, (uint64_t)v28, v76, v65, (uint64_t)v22, v68, MEMORY[0x24BDC64D0]);
        sub_244464970(v50, v52);
        (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v47, v64);
      }
    }
    else
    {
      v53 = SecKeyCopyExternalRepresentation((SecKeyRef)v44, 0);
      if (v53)
      {
        v54 = v53;
        v55 = sub_24449C098();
        v57 = v56;

        v80 = v55;
        v81 = v57;
        sub_2444648E8(v55, v57);
        v58 = (uint64_t)v77;
        sub_24449C3C8();
        if (v46)
        {
          sub_24446492C(v55, v57);
        }
        else
        {
          if (v74)
          {
            v60 = v69;
            sub_24449C428();
            v61 = sub_24449C410();
            v63 = v62;
            (*(void (**)(char *, uint64_t))(v70 + 8))(v60, v71);
          }
          else
          {
            v61 = 0;
            v63 = 0xF000000000000000;
          }
          POCryptoKitHPKE.decodeAndDecryptJWT<A>(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(v75, v58, v61, v63, (uint64_t)v28, v76, v65, (uint64_t)v22, v73, MEMORY[0x24BDC6AA0]);
          sub_244464970(v61, v63);
          sub_24446492C(v55, v57);
          (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v58, v73);
        }
      }
      else
      {
        if (qword_257365FB0 != -1)
          swift_once();
        v59 = sub_24449C0E0();
        __swift_project_value_buffer(v59, (uint64_t)qword_257365FB8);
        Logger.PSSO_ERROR(code:description:)(-1005);
        swift_willThrow();
      }
    }
    sub_2444649C8((uint64_t)v22, &qword_257365090);
  }
  else
  {
    if (qword_257365FB0 != -1)
      swift_once();
    v31 = sub_24449C0E0();
    __swift_project_value_buffer(v31, (uint64_t)qword_257365FB8);
    Logger.PSSO_ERROR(code:description:)(-1005);
    swift_willThrow();
  }
  return sub_2444649C8((uint64_t)v28, &qword_257365098);
}

__SecKey *POCryptoKitHPKE_P384_SHA384_AES_GCM_256.encodeAndEncryptJWT(_:publicKey:otherInfo:psk:psk_id:authPrivateKey:auth_kid:)(void *a1, __SecKey *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, void *a9, uint64_t a10, unint64_t a11)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  __SecKey *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  CFDataRef v41;
  CFDataRef v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  CFDataRef v51;
  uint64_t v52;
  unint64_t v53;
  char *v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  SecKeyRef v85;
  char *v86;
  void *v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;

  v87 = a1;
  v80 = a4;
  v76 = a7;
  v74 = a3;
  v85 = a2;
  v75 = sub_24449C440();
  v73 = *(_QWORD *)(v75 - 8);
  MEMORY[0x24BDAC7A8](v75);
  v72 = (char *)&v69 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_24449C3BC();
  v78 = *(_QWORD *)(v15 - 8);
  v79 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v82 = (char *)&v69 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573650A0);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v69 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v18);
  v81 = (char *)&v69 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v91 = (uint64_t)&v69 - v23;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_257365098);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v69 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v25);
  v30 = (__SecKey *)((char *)&v69 - v29);
  MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&v69 - v31;
  v33 = sub_24449C170();
  v84 = *(_QWORD *)(v33 - 8);
  v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v84 + 56);
  v34(v32, 1, 1, v33);
  v77 = a8;
  v35 = a8 >> 60;
  if (a6 >> 60 != 15)
  {
    v89 = a5;
    v90 = a6;
    sub_2444648E8(a5, a6);
    sub_24449C158();
    sub_2444649C8((uint64_t)v32, &qword_257365098);
    v34((char *)v30, 0, 1, v33);
    sub_244464A04((uint64_t)v30, (uint64_t)v32, &qword_257365098);
    if (v35 >= 0xF)
    {
      if (qword_257365FB0 != -1)
        swift_once();
      v36 = sub_24449C0E0();
      __swift_project_value_buffer(v36, (uint64_t)qword_257365FB8);
      Logger.PSSO_ERROR(code:description:)(-1005);
      swift_willThrow();
      v67 = (uint64_t)v32;
      goto LABEL_24;
    }
  }
  v37 = sub_24449C3D4();
  v38 = *(_QWORD *)(v37 - 8);
  v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 56);
  v40 = v91;
  v83 = v37;
  v39(v91, 1, 1);
  v86 = v32;
  if (a9)
  {
    v71 = v35;
    v30 = a9;
    v41 = SecKeyCopyExternalRepresentation(v30, 0);
    if (v41)
    {
      v42 = v41;
      v70 = v38;
      v43 = sub_24449C098();
      v45 = v44;

      v89 = v43;
      v90 = v45;
      sub_2444648E8(v43, v45);
      v46 = (uint64_t)v81;
      v47 = v88;
      sub_24449C3C8();
      if (v47)
      {

        v48 = v43;
LABEL_15:
        sub_24446492C(v48, v45);
        v56 = v91;
LABEL_19:
        sub_2444649C8(v56, &qword_2573650A0);
        v67 = (uint64_t)v86;
LABEL_24:
        sub_2444649C8(v67, &qword_257365098);
        return v30;
      }
      v88 = 0;
      v49 = v91;
      sub_2444649C8(v91, &qword_2573650A0);

      v50 = v45;
      v40 = v49;
      sub_24446492C(v43, v50);
      ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v39)(v46, 0, 1, v83);
      sub_244464A04(v46, v49, &qword_2573650A0);
      v32 = v86;
      v38 = v70;
    }
    else
    {

    }
  }
  v30 = (__SecKey *)objc_msgSend(v87, sel_header);
  sub_244464984((uint64_t)v32, (uint64_t)v27, &qword_257365098);
  (*(uint64_t (**)(char *, uint64_t, uint64_t))(v84 + 48))(v27, 1, v33);
  sub_2444649C8((uint64_t)v27, &qword_257365098);
  sub_244464984(v40, (uint64_t)v20, &qword_2573650A0);
  (*(void (**)(char *, uint64_t, uint64_t))(v38 + 48))(v20, 1, v83);
  sub_2444649C8((uint64_t)v20, &qword_2573650A0);
  _s15PlatformSSOCore39POCryptoKitHPKE_P384_SHA384_AES_GCM_256C9addValues2to3psk4authySo18POMutableJWTHeaderC_S2btF_0(v30);

  v51 = SecKeyCopyExternalRepresentation(v85, 0);
  if (!v51)
  {
    if (qword_257365FB0 != -1)
      swift_once();
    v57 = sub_24449C0E0();
    __swift_project_value_buffer(v57, (uint64_t)qword_257365FB8);
    Logger.PSSO_ERROR(code:description:)(-1005);
    swift_willThrow();
    v56 = v40;
    goto LABEL_19;
  }
  v30 = v51;
  v52 = sub_24449C098();
  v45 = v53;

  v89 = v52;
  v90 = v45;
  sub_2444648E8(v52, v45);
  v54 = v82;
  v55 = v88;
  sub_24449C3B0();
  if (v55)
  {
    v48 = v52;
    goto LABEL_15;
  }
  v58 = a11;
  v59 = (uint64_t)v86;
  if (v80)
  {
    v60 = v72;
    v88 = a11;
    sub_24449C428();
    v61 = sub_24449C410();
    v63 = v62;
    (*(void (**)(char *, uint64_t))(v73 + 8))(v60, v75);
    v58 = v88;
    v59 = (uint64_t)v86;
  }
  else
  {
    v61 = 0;
    v63 = 0xF000000000000000;
  }
  v64 = (uint64_t)v54;
  v65 = v59;
  v66 = v91;
  v30 = (__SecKey *)POCryptoKitHPKE.encodeAndEncryptJWT<A>(_:publicKey:otherInfo:psk:psk_id:authPrivateKey:auth_kid:)(v87, v64, v61, v63, v59, v76, v77, v91, a10, v58, v83, MEMORY[0x24BDC6AA0]);
  sub_244464970(v61, v63);
  sub_24446492C(v52, v45);
  (*(void (**)(char *, uint64_t))(v78 + 8))(v82, v79);
  sub_2444649C8(v66, &qword_2573650A0);
  sub_2444649C8(v65, &qword_257365098);
  return v30;
}

void POCryptoKitHPKE_P384_SHA384_AES_GCM_256.__allocating_init(cipherSuite:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void POCryptoKitHPKE_P384_SHA384_AES_GCM_256.init(cipherSuite:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_244464654()
{
  uint64_t v0;

  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P384_SHA384_AES_GCM_256_encryptionAlgorithm));
}

id POCryptoKitHPKE_P384_SHA384_AES_GCM_256.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_2444646A8()
{
  id *v0;

  return *v0;
}

id sub_2444646B0(void *a1, id *a2)
{

  *a2 = a1;
  return a1;
}

uint64_t sub_2444646E8(void *a1, id *a2)
{
  id v4;

  *a2 = a1;
  v4 = a1;
  return 1;
}

id sub_24446471C@<X0>(id result@<X0>, id *a2@<X8>)
{
  if (result)
  {
    *a2 = result;
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

_QWORD *sub_24446472C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

id sub_244464738@<X0>(void **a1@<X8>)
{
  void **v1;
  void *v2;

  v2 = *v1;
  *a1 = *v1;
  return v2;
}

uint64_t sub_244464744()
{
  sub_244464B68(&qword_257365148, (uint64_t)&unk_2444A2E0C);
  return sub_24449C584();
}

void _s15PlatformSSOCore39POCryptoKitHPKE_P384_SHA384_AES_GCM_256C9addValues2to3psk4authySo18POMutableJWTHeaderC_S2btF_0(void *a1)
{
  void *v2;
  id v3;

  v2 = (void *)sub_24449C3F8();
  objc_msgSend(a1, sel_setAlg_, v2);

  sub_24449C404();
  v3 = (id)sub_24449C3F8();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setEnc_, v3);

}

uint64_t _s15PlatformSSOCore39POCryptoKitHPKE_P384_SHA384_AES_GCM_256C8encValue6forPsk4authSSSb_SbtF_0()
{
  return sub_24449C404();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24950FADC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_2444648E8(uint64_t a1, unint64_t a2)
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

uint64_t sub_24446492C(uint64_t a1, unint64_t a2)
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

uint64_t sub_244464970(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_24446492C(a1, a2);
  return a1;
}

uint64_t sub_244464984(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2444649C8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_244464A04(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_244464A48()
{
  return type metadata accessor for POCryptoKitHPKE_P384_SHA384_AES_GCM_256();
}

uint64_t type metadata accessor for POCryptoKitHPKE_P384_SHA384_AES_GCM_256()
{
  uint64_t result;

  result = qword_257365FD0;
  if (!qword_257365FD0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_244464A8C()
{
  return swift_updateClassMetadata2();
}

void type metadata accessor for POEncryptionAlgorithm()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_257365130)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_257365130);
  }
}

uint64_t sub_244464B20()
{
  return sub_244464B68(&qword_257365138, (uint64_t)&unk_2444A2DD4);
}

uint64_t sub_244464B44()
{
  return sub_244464B68(&qword_257365140, (uint64_t)&unk_2444A2DAC);
}

uint64_t sub_244464B68(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for POEncryptionAlgorithm();
    result = MEMORY[0x24950FAF4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
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

uint64_t sub_244464BE8()
{
  uint64_t v0;

  v0 = sub_24449C0E0();
  __swift_allocate_value_buffer(v0, qword_2573661E8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2573661E8);
  return sub_24449C0D4();
}

void *sub_244464C60()
{
  qword_257366970 = 0x251520F60;
  return &unk_251520F60;
}

uint64_t *sub_244464C78()
{
  if (qword_257366200 != -1)
    swift_once();
  return &qword_257366970;
}

id sub_244464CB8()
{
  if (qword_257366200 != -1)
    swift_once();
  return (id)qword_257366970;
}

uint64_t sub_244464D38()
{
  uint64_t v0;

  v0 = sub_24449C290();
  __swift_allocate_value_buffer(v0, qword_257366978);
  __swift_project_value_buffer(v0, (uint64_t)qword_257366978);
  return sub_24449C260();
}

uint64_t sub_244464D80()
{
  uint64_t v0;

  if (qword_257366208 != -1)
    swift_once();
  v0 = sub_24449C290();
  return __swift_project_value_buffer(v0, (uint64_t)qword_257366978);
}

uint64_t sub_244464DC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_257366208 != -1)
    swift_once();
  v2 = sub_24449C290();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_257366978);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t variable initialization expression of POPrebootDataKey.encryptedKeyData()
{
  return 0;
}

uint64_t POPrebootDataKey.encryptedKeyData.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_encryptedKeyData);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_244464F88(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_encryptedKeyData);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_244464FE4@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x60))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_244465024(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_encryptedKeyData);
  swift_beginAccess();
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t variable initialization expression of POPrebootDataKey.keyData()
{
  return 0;
}

uint64_t POPrebootDataKey.keyData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_keyData;
  swift_beginAccess();
  v2 = *(_QWORD *)v1;
  sub_24446517C(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  return v2;
}

uint64_t sub_24446517C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2444648E8(a1, a2);
  return a1;
}

uint64_t sub_244465220(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;

  v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_keyData);
  swift_beginAccess();
  v6 = *v5;
  v7 = v5[1];
  *v5 = a1;
  v5[1] = a2;
  return sub_244464970(v6, v7);
}

uint64_t sub_24446527C@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x78))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_2444652BC(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = (uint64_t *)(*a2 + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_keyData);
  swift_beginAccess();
  v5 = *v4;
  v6 = v4[1];
  *v4 = v2;
  v4[1] = v3;
  sub_24446517C(v2, v3);
  return sub_244464970(v5, v6);
}

uint64_t static POPrebootDataKey.verifiedKey(prebootData:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = sub_24449C254();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_24449C170();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244465DE4();
  if (v0)
    return v1;
  result = sub_24449C050();
  if (v10 >> 60 != 15)
  {
    v11 = result;
    v12 = v10;
    sub_2444648E8(result, v10);
    sub_244465564(v11, v12);
    v14 = v2;
    v15 = v1;
    v1 = sub_24449C218();
    sub_244464970(v11, v12);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v4, v15);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return v1;
  }
  __break(1u);
  return result;
}

void sub_244465564(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_2444655A0()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (BYTE6(v0) > 0x1BuLL)
  {
    sub_2444648E8(v1, v0);
    sub_2444661C8(v1, v0);
    sub_24449C248();
  }
  else
  {
    v2 = sub_24449C0EC();
    sub_244467840();
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v3, *MEMORY[0x24BDC61A0], v2);
    swift_willThrow();
  }
  return sub_24446492C(v1, v0);
}

char *static POPrebootDataKey.createKey()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  unint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573651C0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_24449C254();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = sub_24449C170();
  v8 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (void *)objc_opt_self();
  if (qword_257366200 != -1)
    swift_once();
  v12 = objc_msgSend(v11, sel_createEncryptionKeyForAlgorithm_, qword_257366970);
  v13 = v11;
  if (v12)
  {
    v14 = objc_msgSend(v13, sel_dataForEphemeralKey_, v12);
    if (!v14)
    {
      if (qword_2573661E0 != -1)
        swift_once();
      v19 = sub_24449C0E0();
      v3 = (char *)__swift_project_value_buffer(v19, (uint64_t)qword_2573661E8);
      Logger.PSSO_ERROR(code:description:)(-1001);
      swift_willThrow();
      goto LABEL_13;
    }
    v15 = v14;
    v43 = v8;
    v44 = sub_24449C098();
    v17 = v16;

    sub_244465DE4();
    if (v0)
    {
      sub_24446492C(v44, v17);
LABEL_13:

      return v3;
    }
    v45 = v44;
    v46 = v17;
    v21 = sub_24449C230();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v3, 1, 1, v21);
    sub_244466024();
    sub_24449C224();
    v22 = v17;
    v42 = v10;
    v23 = v44;
    sub_244466068((uint64_t)v3);
    v24 = sub_24449C23C();
    v26 = v25;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v27 = v43;
    if (v26 >> 60 == 15)
    {
      if (qword_2573661E0 != -1)
        swift_once();
      v28 = sub_24449C0E0();
      v3 = (char *)__swift_project_value_buffer(v28, (uint64_t)qword_2573661E8);
      Logger.PSSO_ERROR(code:description:)(-1001);
      swift_willThrow();

      sub_24446492C(v23, v22);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v42, v47);
    }
    else
    {
      v29 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for POPrebootDataKey()), sel_init);
      v40 = v24;
      v3 = v29;
      v30 = v22;
      v31 = (uint64_t *)&v29[OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_keyData];
      swift_beginAccess();
      v32 = *v31;
      v33 = v31[1];
      *v31 = v23;
      v31[1] = v30;
      v41 = v30;
      sub_2444648E8(v23, v30);
      sub_244464970(v32, v33);
      v34 = v40;
      v35 = sub_24449C08C();
      v37 = v36;
      v38 = (uint64_t *)&v3[OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_encryptedKeyData];
      swift_beginAccess();
      *v38 = v35;
      v38[1] = v37;
      swift_bridgeObjectRelease();
      sub_244464970(v34, v26);

      sub_24446492C(v23, v41);
      (*(void (**)(char *, uint64_t))(v43 + 8))(v42, v47);
    }
  }
  else
  {
    if (qword_2573661E0 != -1)
      swift_once();
    v18 = sub_24449C0E0();
    v3 = (char *)__swift_project_value_buffer(v18, (uint64_t)qword_2573661E8);
    Logger.PSSO_ERROR(code:description:)(-1001);
    swift_willThrow();
  }
  return v3;
}

uint64_t static POPrebootDataKey.encrypt(data:key:)(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_244466CC0(a1, a2, a3);
}

char *static POPrebootDataKey.decrypt(data:key:)(char *a1, uint64_t a2, uint64_t a3)
{
  return sub_24446713C(a1, a2, a3);
}

id sub_244465CE8(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t (*a6)(uint64_t, unint64_t, id))
{
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = sub_24449C098();
  v12 = v11;

  v13 = a6(v10, v12, v9);
  v15 = v14;

  sub_24446492C(v10, v12);
  v16 = (void *)sub_24449C080();
  sub_24446492C(v13, v15);
  return v16;
}

uint64_t sub_244465DE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;
  unint64_t v13;
  uint64_t v15;
  _QWORD v16[2];

  v0 = sub_24449C200();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_24449C170();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (void *)objc_opt_self();
  v6 = objc_msgSend(v5, sel_platformSSOSystemKey);
  if (v6)
  {
    v7 = v6;
    v8 = sub_24449C098();
    v10 = v9;

LABEL_5:
    v16[0] = v8;
    v16[1] = v10;
    sub_2444648E8(v8, v10);
    sub_2444648E8(v8, v10);
    sub_24449C158();
    sub_244464970(v8, v10);
    return sub_24446492C(v8, v10);
  }
  sub_24449C1F4();
  sub_24449C164();
  sub_24449C14C();
  v11 = objc_msgSend(v5, sel_platformSSOSystemKey);
  if (v11)
  {
    v12 = v11;
    v8 = sub_24449C098();
    v10 = v13;

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    goto LABEL_5;
  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  if (qword_2573661E0 != -1)
    swift_once();
  v15 = sub_24449C0E0();
  __swift_project_value_buffer(v15, (uint64_t)qword_2573661E8);
  Logger.PSSO_ERROR(code:description:)(-1001);
  return swift_willThrow();
}

unint64_t sub_244466024()
{
  unint64_t result;

  result = qword_2573651C8;
  if (!qword_2573651C8)
  {
    result = MEMORY[0x24950FAF4](MEMORY[0x24BDCDDC0], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2573651C8);
  }
  return result;
}

uint64_t sub_244466068(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573651C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for POPrebootDataKey()
{
  return objc_opt_self();
}

void sub_2444660C8(_BYTE *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;

  if (a1)
  {
    v4 = (void *)objc_opt_self();
    v5 = sub_2444678CC(a1, a2 - (_QWORD)a1);
    v7 = v6;
    v8 = (void *)sub_24449C080();
    sub_24446492C(v5, v7);
    objc_msgSend(v4, sel_createPlatformSSOSystemKey_, v8);

  }
  else
  {
    __break(1u);
  }
}

id POPrebootDataKey.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for POPrebootDataKey();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_2444661C8(uint64_t a1, uint64_t a2)
{
  char *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  v3[3] = MEMORY[0x24BDCDDE8];
  v3[4] = MEMORY[0x24BDCDDC8];
  v3[0] = a1;
  v3[1] = a2;
  v2 = (char *)&loc_24446622C
     + *((int *)qword_244466460 + (__swift_project_boxed_opaque_existential_1(v3, MEMORY[0x24BDCDDE8])[1] >> 62));
  __asm { BR              X10 }
}

uint64_t sub_24446623C()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  __int16 v7;
  char v8;
  char v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  v6 = v2;
  v7 = v3;
  v8 = BYTE2(v3);
  v9 = BYTE3(v3);
  v10 = BYTE4(v3);
  v11 = BYTE5(v3);
  sub_2444648E8(v1, v0);
  sub_244466470(&v6, (_BYTE *)&v6 + BYTE6(v3), &v12);
  sub_24446492C(v1, v0);
  v4 = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  return v4;
}

_BYTE *sub_244466470@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_244466B08(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_244466BC8((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_244466C40((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

char *sub_2444664E4(uint64_t a1, char a2, uint64_t (*a3)(_QWORD *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  unint64_t v44;
  _QWORD v46[4];

  v46[3] = a4;
  if (a1 < 0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v11 = a5;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = MEMORY[0x24BEE4AF8];
  v43 = swift_allocObject();
  *(_QWORD *)(v43 + 16) = 15;
  v15 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (v16 = HIBYTE(a6) & 0xF) : (v16 = v11 & 0xFFFFFFFFFFFFLL), !v16))
  {
    if ((a6 & 0x2000000000000000) == 0)
      v15 = v11 & 0xFFFFFFFFFFFFLL;
    v30 = 7;
    if (((a6 >> 60) & ((v11 & 0x800000000000000) == 0)) != 0)
      v30 = 11;
    sub_2444668FC(v30 | (v15 << 16), v43, a2 & 1, v14);
    swift_bridgeObjectRelease();
    v10 = *(char **)(v14 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_38;
  }
  v38 = a1;
  v39 = v14;
  v44 = 4 * v16;
  v10 = (char *)MEMORY[0x24BEE4AF8];
  v9 = 15;
  v8 = 15;
  v17 = 15;
  while (1)
  {
    v46[0] = sub_24449C4D0();
    v46[1] = v18;
    v19 = a3(v46);
    if (v7)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v10;
    }
    v6 = v19;
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      break;
    v9 = sub_24449C470();
LABEL_9:
    if (v44 == v9 >> 14)
      goto LABEL_29;
  }
  if (v8 >> 14 == v9 >> 14 && (a2 & 1) != 0)
  {
    v9 = sub_24449C470();
    *(_QWORD *)(v43 + 16) = v9;
    v8 = v9;
    v17 = v9;
    goto LABEL_9;
  }
  if (v9 >> 14 < v8 >> 14)
  {
    __break(1u);
    goto LABEL_41;
  }
  v20 = sub_24449C4E8();
  v40 = v21;
  v41 = v20;
  v23 = v22;
  v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v10 = sub_244466A08(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
  v27 = *((_QWORD *)v10 + 2);
  v26 = *((_QWORD *)v10 + 3);
  v6 = v27 + 1;
  if (v27 >= v26 >> 1)
    v10 = sub_244466A08((char *)(v26 > 1), v27 + 1, 1, v10);
  *((_QWORD *)v10 + 2) = v6;
  v28 = &v10[32 * v27];
  *((_QWORD *)v28 + 4) = v41;
  *((_QWORD *)v28 + 5) = v23;
  *((_QWORD *)v28 + 6) = v25;
  *((_QWORD *)v28 + 7) = v40;
  *(_QWORD *)(v39 + 16) = v10;
  v29 = sub_24449C470();
  v9 = v29;
  *(_QWORD *)(v43 + 16) = v29;
  if (*((_QWORD *)v10 + 2) != v38)
  {
    v8 = v29;
    v17 = v29;
    goto LABEL_9;
  }
  v17 = v29;
  v8 = v29;
LABEL_29:
  if (v44 == v8 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
  if (v44 >= v17 >> 14)
  {
    v6 = sub_24449C4E8();
    v8 = v31;
    v9 = v32;
    v11 = v33;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      goto LABEL_43;
    goto LABEL_34;
  }
LABEL_42:
  __break(1u);
LABEL_43:
  v10 = sub_244466A08(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
LABEL_34:
  v35 = *((_QWORD *)v10 + 2);
  v34 = *((_QWORD *)v10 + 3);
  if (v35 >= v34 >> 1)
    v10 = sub_244466A08((char *)(v34 > 1), v35 + 1, 1, v10);
  *((_QWORD *)v10 + 2) = v35 + 1;
  v36 = &v10[32 * v35];
  *((_QWORD *)v36 + 4) = v6;
  *((_QWORD *)v36 + 5) = v8;
  *((_QWORD *)v36 + 6) = v9;
  *((_QWORD *)v36 + 7) = v11;
  *(_QWORD *)(v39 + 16) = v10;
LABEL_37:
  swift_bridgeObjectRetain();
  swift_release();
LABEL_38:
  swift_release();
  return v10;
}

uint64_t sub_2444668FC(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  char *v18;

  v10 = *(_QWORD *)(a2 + 16) >> 14;
  v11 = (v10 == a1 >> 14) & a3;
  if (v11 == 1)
    return v11 ^ 1u;
  if (a1 >> 14 < v10)
  {
    __break(1u);
    goto LABEL_9;
  }
  v4 = a4;
  v5 = sub_24449C4E8();
  v6 = v12;
  v7 = v13;
  v8 = v14;
  v9 = *(char **)(v4 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v4 + 16) = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_9:
    v9 = sub_244466A08(0, *((_QWORD *)v9 + 2) + 1, 1, v9);
    *(_QWORD *)(v4 + 16) = v9;
  }
  v17 = *((_QWORD *)v9 + 2);
  v16 = *((_QWORD *)v9 + 3);
  if (v17 >= v16 >> 1)
  {
    v9 = sub_244466A08((char *)(v16 > 1), v17 + 1, 1, v9);
    *(_QWORD *)(v4 + 16) = v9;
  }
  *((_QWORD *)v9 + 2) = v17 + 1;
  v18 = &v9[32 * v17];
  *((_QWORD *)v18 + 4) = v5;
  *((_QWORD *)v18 + 5) = v6;
  *((_QWORD *)v18 + 6) = v7;
  *((_QWORD *)v18 + 7) = v8;
  return v11 ^ 1u;
}

char *sub_244466A08(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573651F8);
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
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_244466B08(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_244466BC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_24449C020();
  swift_allocObject();
  result = sub_24449BFE4();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_24449C05C();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_244466C40(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_24449C020();
  swift_allocObject();
  result = sub_24449BFE4();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_244466CC0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  Swift::String v33;
  unint64_t v34;
  char *v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  Swift::String v48;
  unint64_t v49;

  v42 = a1;
  v5 = sub_24449C440();
  v40 = *(_QWORD *)(v5 - 8);
  v41 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v39 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24449C290();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_24449C380();
  MEMORY[0x24BDAC7A8](v11);
  v12 = sub_24449C314();
  v43 = *(_QWORD *)(v12 - 8);
  v44 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v45 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_24449C3A4();
  v46 = *(_QWORD *)(v14 - 8);
  v47 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = objc_msgSend((id)objc_opt_self(), sel_dataForEphemeralKey_, a3);
  if (!v17)
  {
    if (qword_2573661E0 != -1)
      swift_once();
    v23 = sub_24449C0E0();
    v21 = (void *)__swift_project_value_buffer(v23, (uint64_t)qword_2573661E8);
    Logger.PSSO_ERROR(code:description:)(-1001);
    swift_willThrow();
    return (uint64_t)v21;
  }
  v18 = v17;
  v38 = a2;
  v19 = sub_24449C098();
  v21 = v20;

  v48._countAndFlagsBits = v19;
  v48._object = v21;
  sub_2444648E8(v19, (unint64_t)v21);
  v22 = v49;
  sub_24449C398();
  if (v22)
  {
    sub_24446492C(v19, (unint64_t)v21);
    return (uint64_t)v21;
  }
  v49 = (unint64_t)v21;
  sub_24449C38C();
  if (qword_257366208 != -1)
    swift_once();
  v24 = __swift_project_value_buffer(v7, (uint64_t)qword_257366978);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v24, v7);
  v25 = v45;
  sub_24449C2E4();
  v48._countAndFlagsBits = v42;
  v48._object = v38;
  sub_244466024();
  v27 = sub_24449C308();
  v42 = v28;
  v29 = (void *)v27;
  v30 = sub_24449C2F0();
  v32 = v31;
  v33 = Data.base64URLEncodedString()();
  sub_24446492C(v30, v32);
  v48 = v33;
  sub_24449C488();
  v38 = v29;
  v34 = v42;
  Data.base64URLEncodedString()();
  sub_24449C488();
  swift_bridgeObjectRelease();
  v35 = v39;
  sub_24449C428();
  v21 = (void *)sub_24449C410();
  v37 = v36;
  swift_bridgeObjectRelease();
  result = (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v35, v41);
  if (v37 >> 60 != 15)
  {
    sub_24446492C((uint64_t)v38, v34);
    sub_24446492C(v19, v49);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v25, v44);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v16, v47);
    return (uint64_t)v21;
  }
  __break(1u);
  return result;
}

char *sub_24446713C(char *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;

  v4 = v3;
  v68 = a3;
  v6 = sub_24449C290();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_24449C368();
  v61 = *(_QWORD *)(v10 - 8);
  v62 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v63 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_24449C3A4();
  v64 = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v65 = (char *)&v54 - v16;
  v17 = sub_24449C440();
  MEMORY[0x24BDAC7A8](v17);
  sub_24449C428();
  v18 = sub_24449C41C();
  if (!v19)
  {
    if (qword_2573661E0 == -1)
    {
LABEL_8:
      v29 = sub_24449C0E0();
      __swift_project_value_buffer(v29, (uint64_t)qword_2573661E8);
      Logger.PSSO_ERROR(code:description:)(-1001);
      swift_willThrow();
      return a1;
    }
LABEL_22:
    swift_once();
    goto LABEL_8;
  }
  v20 = v18;
  v21 = v19;
  v60 = v12;
  v66 = 46;
  v67 = 0xE100000000000000;
  MEMORY[0x24BDAC7A8](v18);
  *(&v54 - 2) = (uint64_t)&v66;
  swift_bridgeObjectRetain();
  a1 = sub_2444664E4(2, 1, sub_2444677B4, (uint64_t)(&v54 - 4), v20, v21);
  swift_bridgeObjectRelease();
  if (*((_QWORD *)a1 + 2) != 2)
    goto LABEL_4;
  v59 = v4;
  v23 = *((_QWORD *)a1 + 4);
  v22 = *((_QWORD *)a1 + 5);
  v24 = *((_QWORD *)a1 + 6);
  v25 = *((_QWORD *)a1 + 7);
  swift_bridgeObjectRetain();
  v26 = MEMORY[0x24950EC00](v23, v22, v24, v25);
  swift_bridgeObjectRelease();
  v27 = Data.init(base64URLEncoded:)();
  if (v28 >> 60 == 15)
  {
LABEL_4:
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  v57 = v27;
  v58 = v28;
  if (*((_QWORD *)a1 + 2) < 2uLL)
  {
    __break(1u);
    goto LABEL_24;
  }
  v31 = *((_QWORD *)a1 + 8);
  v32 = *((_QWORD *)a1 + 9);
  v34 = *((_QWORD *)a1 + 10);
  v33 = *((_QWORD *)a1 + 11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  MEMORY[0x24950EC00](v31, v32, v34, v33);
  a1 = v35;
  swift_bridgeObjectRelease();
  v36 = Data.init(base64URLEncoded:)();
  if (v37 >> 60 == 15)
  {
    sub_244464970(v57, v58);
LABEL_5:
    if (qword_2573661E0 == -1)
      goto LABEL_8;
    goto LABEL_22;
  }
  v25 = v36;
  v26 = v37;
  v38 = objc_msgSend((id)objc_opt_self(), sel_dataForEphemeralKey_, v68);
  if (!v38)
  {
    if (qword_2573661E0 == -1)
    {
LABEL_17:
      v46 = sub_24449C0E0();
      __swift_project_value_buffer(v46, (uint64_t)qword_2573661E8);
      Logger.PSSO_ERROR(code:description:)(-1001);
      swift_willThrow();
      sub_244464970(v25, v26);
      v44 = v57;
      v45 = v58;
      goto LABEL_21;
    }
LABEL_24:
    swift_once();
    goto LABEL_17;
  }
  v39 = v38;
  v68 = v25;
  v40 = sub_24449C098();
  v42 = v41;

  v66 = v40;
  v67 = v42;
  sub_2444648E8(v40, v42);
  a1 = v65;
  v43 = v59;
  sub_24449C398();
  if (v43)
  {
    sub_244464970(v57, v58);
    sub_24446492C(v40, v42);
    v44 = v68;
    v45 = v26;
LABEL_21:
    sub_244464970(v44, v45);
    return a1;
  }
  v55 = v42;
  v56 = v40;
  v59 = v26;
  v47 = v64;
  (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v15, a1, v60);
  if (qword_257366208 != -1)
    swift_once();
  v48 = __swift_project_value_buffer(v6, (uint64_t)qword_257366978);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v48, v6);
  sub_2444648E8(v57, v58);
  v49 = v63;
  sub_24449C344();
  v50 = v68;
  v51 = v59;
  v66 = v68;
  v67 = v59;
  sub_244466024();
  v52 = sub_24449C35C();
  v53 = v56;
  a1 = (char *)v52;
  sub_244464970(v57, v58);
  sub_24446492C(v53, v55);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v49, v62);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v65, v60);
  sub_244464970(v50, v51);
  return a1;
}

uint64_t sub_2444677B4(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1])
    return 1;
  else
    return sub_24449C590() & 1;
}

uint64_t sub_244467808()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24446782C()
{
  return swift_deallocObject();
}

unint64_t sub_244467840()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257365200;
  if (!qword_257365200)
  {
    v1 = sub_24449C0EC();
    result = MEMORY[0x24950FAF4](MEMORY[0x24BDC61C0], v1);
    atomic_store(result, (unint64_t *)&qword_257365200);
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2444678CC(_BYTE *__src, uint64_t a2)
{
  uint64_t result;

  if (!a2)
    return 0;
  if (a2 <= 14)
    return sub_244466B08(__src, &__src[a2]);
  sub_24449C020();
  swift_allocObject();
  sub_24449BFE4();
  if ((unint64_t)a2 < 0x7FFFFFFF)
    return a2 << 32;
  sub_24449C05C();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

void sub_244467978()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t sub_244467988()
{
  uint64_t v0;

  v0 = sub_24449C0E0();
  __swift_allocate_value_buffer(v0, qword_257366218);
  __swift_project_value_buffer(v0, (uint64_t)qword_257366218);
  return sub_24449C0D4();
}

uint64_t sub_244467A08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC15PlatformSSOCore15POCryptoKitHPKE_cipherSuite;
  v4 = sub_24449C290();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

id POCryptoKitHPKE.__allocating_init(cipherSuite:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  v3 = (char *)objc_allocWithZone(v1);
  v4 = &v3[OBJC_IVAR____TtC15PlatformSSOCore15POCryptoKitHPKE_cipherSuite];
  v5 = sub_24449C290();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v4, a1, v5);
  v9.receiver = v3;
  v9.super_class = v1;
  v7 = objc_msgSendSuper2(&v9, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  return v7;
}

id POCryptoKitHPKE.init(cipherSuite:)(uint64_t a1)
{
  char *v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v3 = &v1[OBJC_IVAR____TtC15PlatformSSOCore15POCryptoKitHPKE_cipherSuite];
  v4 = sub_24449C290();
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v3, a1, v4);
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for POCryptoKitHPKE();
  v6 = objc_msgSendSuper2(&v8, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v6;
}

uint64_t type metadata accessor for POCryptoKitHPKE()
{
  uint64_t result;

  result = qword_257366230;
  if (!qword_257366230)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t POCryptoKitHPKE.encodeAndEncryptJWT<A>(_:publicKey:otherInfo:psk:psk_id:authPrivateKey:auth_kid:)(void *a1, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
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
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  id v66;
  id v67;
  unint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t, uint64_t);
  uint64_t v70;
  uint64_t v71;
  int v72;
  BOOL v73;
  uint64_t v74;
  unint64_t v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  int v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  unint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  id v113;
  uint64_t inited;
  uint64_t v115;
  Swift::String v116;
  void *v117;
  unint64_t v118;
  uint64_t v119;
  id v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  id v130;
  id v131;
  id v132;
  uint64_t v133;
  unint64_t v134;
  unint64_t v135;
  char *v136;
  uint64_t v137;
  unint64_t v138;
  unint64_t v139;
  unint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  unint64_t v145;
  unint64_t v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  id v153;
  void *v154;
  char *v155;
  uint64_t v156;
  char *v157;
  uint64_t v158;
  unint64_t v159;
  unint64_t v160;
  unint64_t v161;
  char *v162;
  uint64_t v163;
  id v165;
  unint64_t v166;
  uint64_t v167;
  void *v168;
  id v169;
  void *v170;
  id v171;
  void *v172;
  id v173;
  void *v174;
  uint64_t v175;
  uint64_t v176;
  void (*v177)(char *, uint64_t, uint64_t, uint64_t);
  char *v178;
  uint64_t v179;
  uint64_t (*v180)(uint64_t, uint64_t, uint64_t);
  uint64_t v181;
  char *v182;
  char *v183;
  char *v184;
  char *v185;
  char *v186;
  char *v187;
  char *v188;
  char *v189;
  char *v190;
  char *v191;
  char *v192;
  id v193;
  char *v194;
  uint64_t v195;
  char *v196;
  char *v197;
  char *v198;
  char *v199;
  uint64_t v200;
  char *v201;
  char *v202;
  char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  unint64_t v207;
  unint64_t v208;
  char *v209;
  char *v210;
  char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t AssociatedTypeWitness;
  unint64_t v219;
  unint64_t v220;
  unint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  unint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  unint64_t v229;
  uint64_t v230;
  unint64_t v231;
  uint64_t v232;

  v220 = a3;
  v213 = a8;
  v207 = a7;
  v200 = a6;
  v226 = a5;
  v221 = a4;
  v216 = a2;
  v13 = sub_24449C440();
  v195 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v194 = (char *)&v175 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v232 = sub_24449C314();
  v227 = *(_QWORD *)(v232 - 8);
  MEMORY[0x24BDAC7A8](v232);
  v16 = (char *)&v175 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v217 = sub_24449C290();
  v215 = *(_QWORD *)(v217 - 8);
  v17 = MEMORY[0x24BDAC7A8](v217);
  v211 = (char *)&v175 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v199 = (char *)&v175 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v192 = (char *)&v175 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v188 = (char *)&v175 - v23;
  v222 = a12;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v214 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v24 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v210 = (char *)&v175 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v198 = (char *)&v175 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v191 = (char *)&v175 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v187 = (char *)&v175 - v30;
  v31 = sub_24449C500();
  v205 = *(_QWORD *)(v31 - 8);
  v206 = v31;
  v32 = MEMORY[0x24BDAC7A8](v31);
  v202 = (char *)&v175 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = MEMORY[0x24BDAC7A8](v32);
  v185 = (char *)&v175 - v35;
  v224 = a11;
  v36 = *(_QWORD *)(a11 - 8);
  v37 = MEMORY[0x24BDAC7A8](v34);
  v197 = (char *)&v175 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = MEMORY[0x24BDAC7A8](v37);
  v225 = (unint64_t)&v175 - v40;
  v41 = MEMORY[0x24BDAC7A8](v39);
  v184 = (char *)&v175 - v42;
  MEMORY[0x24BDAC7A8](v41);
  v186 = (char *)&v175 - v43;
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_257365098);
  MEMORY[0x24BDAC7A8](v44);
  v204 = (uint64_t)&v175 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = sub_24449C170();
  v47 = *(_QWORD *)(v46 - 8);
  v48 = MEMORY[0x24BDAC7A8](v46);
  v190 = (char *)&v175 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = MEMORY[0x24BDAC7A8](v48);
  v183 = (char *)&v175 - v51;
  MEMORY[0x24BDAC7A8](v50);
  v203 = (char *)&v175 - v52;
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_257365208);
  v54 = MEMORY[0x24BDAC7A8](v53);
  v201 = (char *)&v175 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = MEMORY[0x24BDAC7A8](v54);
  v209 = (char *)&v175 - v57;
  v58 = MEMORY[0x24BDAC7A8](v56);
  v196 = (char *)&v175 - v59;
  v60 = MEMORY[0x24BDAC7A8](v58);
  v189 = (char *)&v175 - v61;
  v62 = MEMORY[0x24BDAC7A8](v60);
  v182 = (char *)&v175 - v63;
  MEMORY[0x24BDAC7A8](v62);
  v65 = (char *)&v175 - v64;
  v66 = objc_msgSend(a1, sel_body);
  if (!v66)
  {
    if (qword_257366210 != -1)
      swift_once();
    v78 = sub_24449C0E0();
    v71 = __swift_project_value_buffer(v78, (uint64_t)qword_257366218);
    Logger.PSSO_ERROR(code:description:)(-1005);
    swift_willThrow();
    return v71;
  }
  v176 = v13;
  v193 = a1;
  v178 = v16;
  v67 = objc_msgSend(v66, sel_dataRepresentation);
  swift_unknownObjectRelease();
  v212 = sub_24449C098();
  v208 = v68;

  v179 = v47;
  v69 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v47 + 48);
  LODWORD(v67) = v69(v226, 1, v46);
  v70 = v213;
  v71 = v224;
  v180 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v36 + 48);
  v181 = v36;
  v72 = v180(v213, 1, v224);
  v177 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v227 + 56);
  v177(v65, 1, 1, v232);
  v73 = (_DWORD)v67 == 1;
  v74 = (uint64_t)v65;
  v75 = v225;
  if (v73)
    goto LABEL_11;
  v76 = v72;
  v77 = v204;
  sub_244464984(v226, v204, &qword_257365098);
  if (v69(v77, 1, v46) == 1)
  {
    sub_2444649C8(v77, &qword_257365098);
LABEL_10:
    v72 = v76;
LABEL_11:
    v73 = v72 == 1;
    v83 = v212;
    if (v73)
    {
LABEL_14:
      (*(void (**)(char *, uint64_t, uint64_t))(v214 + 16))(v210, v216, AssociatedTypeWitness);
      (*(void (**)(char *, unint64_t, uint64_t))(v215 + 16))(v211, v219 + OBJC_IVAR____TtC15PlatformSSOCore15POCryptoKitHPKE_cipherSuite, v217);
      sub_24446517C(v220, v221);
      swift_getAssociatedConformanceWitness();
      v71 = (uint64_t)v209;
      v87 = v223;
      sub_24449C2E4();
      sub_2444649C8(v74, &qword_257365208);
      if (v87)
      {
        sub_24446492C(v83, v208);
        return v71;
      }
      v88 = v232;
      v89 = v208;
      goto LABEL_36;
    }
    v85 = v205;
    v84 = v206;
    v86 = v202;
    (*(void (**)(char *, uint64_t, uint64_t))(v205 + 16))(v202, v70, v206);
    if (v180((uint64_t)v86, 1, v71) == 1)
    {
      (*(void (**)(char *, uint64_t))(v85 + 8))(v86, v84);
      goto LABEL_14;
    }
    v226 = v74;
    v90 = v181;
    (*(void (**)(unint64_t, char *, uint64_t))(v181 + 32))(v75, v86, v71);
    (*(void (**)(char *, uint64_t, uint64_t))(v214 + 16))(v198, v216, AssociatedTypeWitness);
    (*(void (**)(char *, unint64_t, uint64_t))(v215 + 16))(v199, v219 + OBJC_IVAR____TtC15PlatformSSOCore15POCryptoKitHPKE_cipherSuite, v217);
    v92 = v220;
    v91 = v221;
    (*(void (**)(char *, unint64_t, uint64_t))(v90 + 16))(v197, v75, v71);
    sub_24446517C(v92, v91);
    v93 = v196;
    v94 = v223;
    sub_24449C2D8();
    v89 = v208;
    if (v94)
    {
      sub_24446492C(v212, v208);
      (*(void (**)(unint64_t, uint64_t))(v181 + 8))(v225, v71);
LABEL_58:
      sub_2444649C8(v226, &qword_257365208);
      return v71;
    }
    (*(void (**)(unint64_t, uint64_t))(v181 + 8))(v225, v71);
    v71 = (uint64_t)v93;
    v83 = v212;
    goto LABEL_34;
  }
  v79 = v46;
  v80 = v179;
  v81 = v203;
  (*(void (**)(char *, uint64_t, uint64_t))(v179 + 32))(v203, v77, v79);
  v82 = v207;
  if (v207 >> 60 == 15)
  {
    (*(void (**)(char *, uint64_t))(v80 + 8))(v81, v79);
    v75 = v225;
    goto LABEL_10;
  }
  v226 = v74;
  v73 = v76 == 1;
  v95 = v181;
  v175 = v79;
  if (v73)
  {
    sub_2444648E8(v200, v207);
  }
  else
  {
    v96 = v205;
    v97 = v185;
    v98 = v70;
    v99 = v206;
    (*(void (**)(char *, uint64_t, uint64_t))(v205 + 16))(v185, v98, v206);
    v100 = v180((uint64_t)v97, 1, v71);
    if (v100 != 1)
    {
      v155 = v186;
      (*(void (**)(char *, char *, uint64_t))(v95 + 32))(v186, v97, v71);
      (*(void (**)(char *, uint64_t, uint64_t))(v214 + 16))(v187, v216, AssociatedTypeWitness);
      (*(void (**)(char *, unint64_t, uint64_t))(v215 + 16))(v188, v219 + OBJC_IVAR____TtC15PlatformSSOCore15POCryptoKitHPKE_cipherSuite, v217);
      v156 = v95;
      v157 = v81;
      v158 = v220;
      v159 = v221;
      if (v221 >> 60 == 15)
        v160 = 0;
      else
        v160 = v220;
      v225 = v160;
      v161 = 0xC000000000000000;
      if (v221 >> 60 != 15)
        v161 = v221;
      v219 = v161;
      (*(void (**)(char *, char *, uint64_t))(v156 + 16))(v184, v155, v71);
      (*(void (**)(char *, char *, uint64_t))(v179 + 16))(v183, v157, v175);
      sub_24446517C(v200, v82);
      sub_24446517C(v158, v159);
      v162 = v182;
      v163 = v223;
      sub_24449C2CC();
      v89 = v208;
      if (!v163)
      {
        (*(void (**)(char *, uint64_t))(v181 + 8))(v186, v71);
        (*(void (**)(char *, uint64_t))(v179 + 8))(v203, v175);
        v83 = v212;
        v74 = v226;
        v71 = (uint64_t)v162;
        goto LABEL_35;
      }
      sub_24446492C(v212, v208);
      (*(void (**)(char *, uint64_t))(v181 + 8))(v186, v71);
LABEL_57:
      (*(void (**)(char *, uint64_t))(v179 + 8))(v203, v175);
      goto LABEL_58;
    }
    sub_2444648E8(v200, v82);
    (*(void (**)(char *, uint64_t))(v96 + 8))(v97, v99);
  }
  v89 = v208;
  v83 = v212;
  v71 = (uint64_t)v191;
  (*(void (**)(char *, uint64_t, uint64_t))(v214 + 16))(v191, v216, AssociatedTypeWitness);
  (*(void (**)(char *, unint64_t, uint64_t))(v215 + 16))(v192, v219 + OBJC_IVAR____TtC15PlatformSSOCore15POCryptoKitHPKE_cipherSuite, v217);
  v102 = v220;
  v101 = v221;
  if (v221 >> 60 == 15)
    v103 = 0;
  else
    v103 = v220;
  v225 = v103;
  v104 = 0xC000000000000000;
  if (v221 >> 60 != 15)
    v104 = v221;
  v219 = v104;
  (*(void (**)(char *, char *, uint64_t))(v179 + 16))(v190, v203, v175);
  sub_24446517C(v102, v101);
  swift_getAssociatedConformanceWitness();
  v105 = v189;
  v106 = v223;
  sub_24449C2C0();
  if (v106)
  {
    sub_24446492C(v83, v89);
    goto LABEL_57;
  }
  (*(void (**)(char *, uint64_t))(v179 + 8))(v203, v175);
  v71 = (uint64_t)v105;
LABEL_34:
  v74 = v226;
LABEL_35:
  sub_2444649C8(v74, &qword_257365208);
  v88 = v232;
LABEL_36:
  v107 = (uint64_t)v201;
  v177((char *)v71, 0, 1, v88);
  sub_244464A04(v71, v74, &qword_257365208);
  v226 = v74;
  sub_244464984(v74, v107, &qword_257365208);
  v108 = v227;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v227 + 48))(v107, 1, v88) == 1)
  {
    sub_2444649C8(v107, &qword_257365208);
    if (qword_257366210 != -1)
      swift_once();
    v109 = sub_24449C0E0();
    v71 = __swift_project_value_buffer(v109, (uint64_t)qword_257366218);
    Logger.PSSO_ERROR(code:description:)(-1001);
    swift_willThrow();
    sub_24446492C(v83, v89);
    goto LABEL_58;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v108 + 32))(v178, v107, v88);
  v110 = sub_24449C2F0();
  v112 = v111;
  v113 = objc_msgSend(v193, sel_header);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257365210);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2444A2ED0;
  v230 = 7959659;
  v231 = 0xE300000000000000;
  v115 = MEMORY[0x24BEE0D00];
  sub_24449C554();
  *(_QWORD *)(inited + 96) = v115;
  *(_QWORD *)(inited + 72) = 19269;
  *(_QWORD *)(inited + 80) = 0xE200000000000000;
  v230 = 27493;
  v231 = 0xE200000000000000;
  sub_24449C554();
  v224 = v110;
  v225 = v112;
  v116 = Data.base64URLEncodedString()();
  *(_QWORD *)(inited + 168) = v115;
  *(Swift::String *)(inited + 144) = v116;
  sub_244469140(inited);
  v117 = (void *)sub_24449C3E0();
  swift_bridgeObjectRelease();
  objc_msgSend(v113, sel_setEpk_, v117);

  v118 = v207;
  if (v207 >> 60 != 15)
  {
    v119 = v200;
    sub_2444648E8(v200, v207);
    v120 = objc_msgSend(v193, sel_header);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257365218);
    v121 = swift_initStackObject();
    *(_OWORD *)(v121 + 16) = xmmword_2444A2EE0;
    *(_QWORD *)(v121 + 32) = 0x64695F6B7370;
    *(_QWORD *)(v121 + 40) = 0xE600000000000000;
    v122 = sub_24449C08C();
    *(_QWORD *)(v121 + 72) = v115;
    *(_QWORD *)(v121 + 48) = v122;
    *(_QWORD *)(v121 + 56) = v123;
    sub_244469280(v121);
    v124 = (void *)sub_24449C3E0();
    swift_bridgeObjectRelease();
    objc_msgSend(v120, sel_addCustomClaims_, v124);

    sub_244464970(v119, v118);
  }
  if (a10 >> 60 != 15)
  {
    sub_2444648E8(a9, a10);
    v125 = objc_msgSend(v193, sel_header);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257365218);
    v126 = swift_initStackObject();
    *(_OWORD *)(v126 + 16) = xmmword_2444A2EE0;
    *(_QWORD *)(v126 + 32) = 0x64696B5F68747561;
    *(_QWORD *)(v126 + 40) = 0xE800000000000000;
    v127 = sub_24449C08C();
    *(_QWORD *)(v126 + 72) = v115;
    *(_QWORD *)(v126 + 48) = v127;
    *(_QWORD *)(v126 + 56) = v128;
    sub_244469280(v126);
    v129 = (void *)sub_24449C3E0();
    swift_bridgeObjectRelease();
    objc_msgSend(v125, sel_addCustomClaims_, v129);

    sub_244464970(a9, a10);
  }
  v130 = v193;
  v131 = objc_msgSend(v193, sel_header, v175);
  v132 = objc_msgSend(v131, sel_dataRepresentation);

  v133 = sub_24449C098();
  v135 = v134;

  Data.base64URLEncodedString()();
  v136 = v194;
  sub_24449C434();
  v137 = sub_24449C410();
  v139 = v138;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v195 + 8))(v136, v176);
  v140 = v208;
  if (v139 >> 60 == 15)
  {
    v141 = v212;
    if (qword_257366210 != -1)
      swift_once();
    v142 = sub_24449C0E0();
    v71 = __swift_project_value_buffer(v142, (uint64_t)qword_257366218);
    Logger.PSSO_ERROR(code:description:)(-1005);
    swift_willThrow();
    sub_24446492C(v133, v135);
    sub_24446492C(v224, v225);
    sub_24446492C(v141, v140);
    (*(void (**)(char *, uint64_t))(v227 + 8))(v178, v232);
    goto LABEL_58;
  }
  v223 = v133;
  v230 = v212;
  v231 = v208;
  v228 = v137;
  v229 = v139;
  sub_244466024();
  v143 = sub_24449C2FC();
  v222 = v137;
  v144 = v143;
  v146 = v145;
  Data.base64URLEncodedString()();
  v147 = (void *)sub_24449C3F8();
  swift_bridgeObjectRelease();
  objc_msgSend(v130, sel_setRawHeader_, v147);

  v148 = (void *)sub_24449C3F8();
  objc_msgSend(v130, sel_setRawEncryptedKey_, v148);

  v149 = (void *)sub_24449C3F8();
  objc_msgSend(v130, sel_setRawIV_, v149);

  v220 = v146;
  v221 = v144;
  Data.base64URLEncodedString()();
  v150 = v130;
  v151 = (void *)sub_24449C3F8();
  swift_bridgeObjectRelease();
  objc_msgSend(v150, sel_setRawCipherText_, v151);

  v152 = (void *)sub_24449C3F8();
  objc_msgSend(v150, sel_setRawAuthenticationTag_, v152);

  v230 = 0;
  v231 = 0xE000000000000000;
  v153 = objc_msgSend(v150, sel_rawHeader);
  if (v153)
  {
    v154 = v153;
    sub_24449C404();

  }
  sub_24449C488();
  swift_bridgeObjectRelease();
  sub_24449C488();
  v165 = objc_msgSend(v193, sel_rawEncryptedKey);
  v166 = v208;
  v167 = v223;
  if (v165)
  {
    v168 = v165;
    sub_24449C404();

  }
  sub_24449C488();
  swift_bridgeObjectRelease();
  sub_24449C488();
  v169 = objc_msgSend(v193, sel_rawIV);
  if (v169)
  {
    v170 = v169;
    sub_24449C404();

  }
  sub_24449C488();
  swift_bridgeObjectRelease();
  sub_24449C488();
  v171 = objc_msgSend(v193, sel_rawCipherText);
  if (v171)
  {
    v172 = v171;
    sub_24449C404();

  }
  sub_24449C488();
  swift_bridgeObjectRelease();
  sub_24449C488();
  v173 = objc_msgSend(v193, sel_rawAuthenticationTag);
  if (v173)
  {
    v174 = v173;
    sub_24449C404();

  }
  sub_24449C488();
  swift_bridgeObjectRelease();
  sub_24446492C(v221, v220);
  sub_244464970(v222, v139);
  sub_24446492C(v167, v135);
  sub_24446492C(v224, v225);
  sub_24446492C(v212, v166);
  v71 = v230;
  (*(void (**)(char *, uint64_t))(v227 + 8))(v178, v232);
  sub_2444649C8(v226, &qword_257365208);
  return v71;
}

unint64_t sub_244469140(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257365268);
  v2 = sub_24449C578();
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
    sub_244464984(v6, (uint64_t)v15, (uint64_t *)&unk_257365270);
    result = sub_24446AC40((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_24446AF34(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
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

unint64_t sub_244469280(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257365258);
  v2 = sub_24449C578();
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
    sub_244464984(v6, (uint64_t)&v15, &qword_257365260);
    v7 = v15;
    v8 = v16;
    result = sub_24446ABDC(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_24446AF34(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
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

uint64_t POCryptoKitHPKE.decodeAndDecryptJWT<A>(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t AssociatedTypeWitness;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  id v65;
  void *v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  id v72;
  void *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  id v80;
  void *v81;
  id v82;
  uint64_t v83;
  unint64_t v84;
  char v85;
  char v86;
  id v87;
  void *v88;
  id v89;
  uint64_t v90;
  unint64_t v91;
  char v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  unint64_t v97;
  id v98;
  void *v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  id v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t, uint64_t);
  int v108;
  uint64_t (*v109)(uint64_t, uint64_t, uint64_t);
  int v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t *v120;
  char *v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  unint64_t v133;
  void *v134;
  id v135;
  uint64_t v136;
  char *v137;
  unint64_t v138;
  uint64_t v139;
  uint64_t v140;
  unint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void (*v144)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v145;
  unint64_t v146;
  uint64_t v147;
  unint64_t v148;
  unint64_t v149;
  char *v150;
  char *v151;
  char *v152;
  char *v153;
  char *v154;
  char *v155;
  char *v156;
  char *v157;
  char *v158;
  char *v159;
  uint64_t v160;
  char *v161;
  char *v162;
  char *v163;
  char *v164;
  char *v165;
  char *v166;
  unint64_t v167;
  char *v168;
  char *v169;
  char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  char *v174;
  char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  unint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  unint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  unint64_t v195;
  uint64_t v196;
  unint64_t v197;
  __int128 v198;
  __int128 v199;
  id v200;

  v187 = a8;
  v167 = a7;
  v160 = a6;
  v186 = a5;
  v182 = a4;
  v181 = a3;
  v177 = a2;
  v11 = sub_24449C368();
  v190 = *(_QWORD *)(v11 - 8);
  v191 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v165 = (char *)&v143 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v179 = sub_24449C290();
  v178 = *(_QWORD *)(v179 - 8);
  v13 = MEMORY[0x24BDAC7A8](v179);
  v170 = (char *)&v143 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v163 = (char *)&v143 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v157 = (char *)&v143 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v152 = (char *)&v143 - v20;
  v176 = *(_QWORD *)(a9 - 8);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v169 = (char *)&v143 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v162 = (char *)&v143 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v156 = (char *)&v143 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v153 = (char *)&v143 - v27;
  v183 = a10;
  v185 = a9;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v172 = sub_24449C500();
  v171 = *(_QWORD *)(v172 - 8);
  v29 = MEMORY[0x24BDAC7A8](v172);
  v175 = (char *)&v143 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = MEMORY[0x24BDAC7A8](v29);
  v158 = (char *)&v143 - v32;
  v188 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v33 = MEMORY[0x24BDAC7A8](v31);
  v161 = (char *)&v143 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = MEMORY[0x24BDAC7A8](v33);
  v166 = (char *)&v143 - v36;
  v37 = MEMORY[0x24BDAC7A8](v35);
  v151 = (char *)&v143 - v38;
  MEMORY[0x24BDAC7A8](v37);
  v154 = (char *)&v143 - v39;
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_257365098);
  MEMORY[0x24BDAC7A8](v40);
  v42 = (char *)&v143 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  v192 = sub_24449C170();
  v189 = *(_QWORD *)(v192 - 8);
  v43 = MEMORY[0x24BDAC7A8](v192);
  v155 = (char *)&v143 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = MEMORY[0x24BDAC7A8](v43);
  v150 = (char *)&v143 - v46;
  MEMORY[0x24BDAC7A8](v45);
  v168 = (char *)&v143 - v47;
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_257365220);
  v49 = MEMORY[0x24BDAC7A8](v48);
  v173 = (uint64_t)&v143 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = MEMORY[0x24BDAC7A8](v49);
  v53 = (char *)&v143 - v52;
  v54 = MEMORY[0x24BDAC7A8](v51);
  v164 = (char *)&v143 - v55;
  v56 = MEMORY[0x24BDAC7A8](v54);
  v159 = (char *)&v143 - v57;
  v58 = MEMORY[0x24BDAC7A8](v56);
  v174 = (char *)&v143 - v59;
  MEMORY[0x24BDAC7A8](v58);
  v193 = (uint64_t)&v143 - v60;
  v61 = sub_24449C440();
  v62 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v64 = (char *)&v143 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
  v200 = a1;
  v65 = objc_msgSend(a1, sel_rawHeader);
  if (v65)
  {
    v66 = v65;
    sub_24449C404();

    sub_24449C434();
    v67 = sub_24449C410();
    v69 = v68;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v62 + 8))(v64, v61);
    if (v69 >> 60 != 15)
    {
      v72 = objc_msgSend(v200, sel_rawCipherText);
      if (!v72
        || (v73 = v72, sub_24449C404(), v73, v74 = Data.init(base64URLEncoded:)(), v75 >> 60 == 15))
      {
        if (qword_257366210 != -1)
          swift_once();
        v76 = sub_24449C0E0();
        __swift_project_value_buffer(v76, (uint64_t)qword_257366218);
        Logger.PSSO_ERROR(code:description:)(-1005);
        swift_willThrow();
LABEL_11:
        v77 = v67;
        v78 = v69;
        return sub_244464970(v77, v78);
      }
      v147 = v74;
      v148 = v75;
      v79 = v67;
      v149 = v69;
      v80 = objc_msgSend(v200, sel_decodedHeader);
      if (!v80)
        goto LABEL_27;
      v81 = v80;
      v82 = objc_msgSend(v80, "epk");

      v83 = sub_24449C3EC();
      v194 = 7959659;
      v195 = 0xE300000000000000;
      sub_24449C554();
      if (*(_QWORD *)(v83 + 16) && (v84 = sub_24446AC40((uint64_t)&v196), (v85 & 1) != 0))
      {
        sub_24446ACA4(*(_QWORD *)(v83 + 56) + 32 * v84, (uint64_t)&v198);
      }
      else
      {
        v198 = 0u;
        v199 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_24446AC70((uint64_t)&v196);
      if (!*((_QWORD *)&v199 + 1))
        goto LABEL_28;
      if ((swift_dynamicCast() & 1) == 0)
        goto LABEL_29;
      if (v196 == 19269 && v197 == 0xE200000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v86 = sub_24449C590();
        swift_bridgeObjectRelease();
        if ((v86 & 1) == 0)
          goto LABEL_29;
      }
      v87 = objc_msgSend(v200, sel_decodedHeader);
      if (v87)
      {
        v88 = v87;
        v89 = objc_msgSend(v87, "epk");

        v90 = sub_24449C3EC();
        v194 = 27493;
        v195 = 0xE200000000000000;
        sub_24449C554();
        if (*(_QWORD *)(v90 + 16) && (v91 = sub_24446AC40((uint64_t)&v196), (v92 & 1) != 0))
        {
          sub_24446ACA4(*(_QWORD *)(v90 + 56) + 32 * v91, (uint64_t)&v198);
        }
        else
        {
          v198 = 0u;
          v199 = 0u;
        }
        swift_bridgeObjectRelease();
        sub_24446AC70((uint64_t)&v196);
        if (*((_QWORD *)&v199 + 1))
        {
          if ((swift_dynamicCast() & 1) != 0)
          {
            v94 = Data.init(base64URLEncoded:)();
            if (v95 >> 60 != 15)
            {
              v96 = v94;
              v97 = v95;
              v98 = objc_msgSend(v200, sel_rawIV);
              if (!v98
                || (v99 = v98,
                    sub_24449C404(),
                    v99,
                    v100 = sub_24449C464(),
                    swift_bridgeObjectRelease(),
                    v100))
              {
                v101 = v149;
                if (qword_257366210 != -1)
                  swift_once();
                v102 = sub_24449C0E0();
                __swift_project_value_buffer(v102, (uint64_t)qword_257366218);
                Logger.PSSO_ERROR(code:description:)(-1005);
                swift_willThrow();
                sub_244464970(v96, v97);
                sub_244464970(v147, v148);
                v77 = v79;
                v78 = v101;
                return sub_244464970(v77, v78);
              }
              v145 = v96;
              v146 = v97;
              v103 = objc_msgSend(v200, sel_rawAuthenticationTag);
              v69 = v149;
              v67 = v79;
              if (!v103
                || (v104 = v103,
                    sub_24449C404(),
                    v104,
                    v105 = sub_24449C464(),
                    swift_bridgeObjectRelease(),
                    v105))
              {
                if (qword_257366210 != -1)
                  swift_once();
                v106 = sub_24449C0E0();
                __swift_project_value_buffer(v106, (uint64_t)qword_257366218);
                Logger.PSSO_ERROR(code:description:)(-1005);
                swift_willThrow();
                sub_244464970(v145, v146);
                sub_244464970(v147, v148);
                goto LABEL_11;
              }
              v107 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v189 + 48);
              v108 = v107(v186, 1, v192);
              v109 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v188 + 48);
              v110 = v109(v187, 1, AssociatedTypeWitness);
              v144 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v190 + 56);
              v144(v193, 1, 1, v191);
              if (v108 == 1)
                goto LABEL_53;
              sub_244464984(v186, (uint64_t)v42, &qword_257365098);
              if (v107((uint64_t)v42, 1, v192) == 1)
              {
                sub_2444649C8((uint64_t)v42, &qword_257365098);
LABEL_53:
                if (v110 == 1)
                {
LABEL_56:
                  (*(void (**)(char *, uint64_t, uint64_t))(v176 + 16))(v169, v177, v185);
                  (*(void (**)(char *, uint64_t, uint64_t))(v178 + 16))(v170, v180 + OBJC_IVAR____TtC15PlatformSSOCore15POCryptoKitHPKE_cipherSuite, v179);
                  sub_24446517C(v181, v182);
                  sub_24446517C(v145, v146);
                  v112 = v184;
                  sub_24449C344();
                  if (v112)
                  {
                    sub_2444649C8(v193, &qword_257365220);
                    sub_244464970(v145, v146);
LABEL_32:
                    sub_244464970(v147, v148);
                    v77 = v79;
                    v78 = v149;
                    return sub_244464970(v77, v78);
                  }
                  v174 = v53;
                  goto LABEL_75;
                }
                v111 = v175;
                (*(void (**)(char *, uint64_t, uint64_t))(v171 + 16))(v175, v187, v172);
                if (v109((uint64_t)v111, 1, AssociatedTypeWitness) == 1)
                {
                  (*(void (**)(char *, uint64_t))(v171 + 8))(v175, v172);
                  goto LABEL_56;
                }
                v113 = v188;
                v114 = v166;
                (*(void (**)(char *, char *, uint64_t))(v188 + 32))(v166, v175, AssociatedTypeWitness);
                (*(void (**)(char *, uint64_t, uint64_t))(v176 + 16))(v162, v177, v185);
                (*(void (**)(char *, uint64_t, uint64_t))(v178 + 16))(v163, v180 + OBJC_IVAR____TtC15PlatformSSOCore15POCryptoKitHPKE_cipherSuite, v179);
                v115 = v182;
                v116 = v181;
                if (v182 >> 60 == 15)
                  v117 = 0;
                else
                  v117 = v181;
                v192 = v117;
                v118 = 0xC000000000000000;
                if (v182 >> 60 != 15)
                  v118 = v182;
                v189 = v118;
                (*(void (**)(char *, char *, uint64_t))(v113 + 16))(v161, v114, AssociatedTypeWitness);
                sub_24446517C(v116, v115);
                sub_24446517C(v145, v146);
                v119 = v184;
                sub_24449C338();
                if (v119)
                {
                  sub_244464970(v147, v148);
                  sub_244464970(v79, v149);
                  sub_244464970(v145, v146);
                  (*(void (**)(char *, uint64_t))(v188 + 8))(v166, AssociatedTypeWitness);
                  return sub_2444649C8(v193, &qword_257365220);
                }
                (*(void (**)(char *, uint64_t))(v188 + 8))(v166, AssociatedTypeWitness);
                v120 = &v196;
                goto LABEL_74;
              }
              (*(void (**)(char *, char *, uint64_t))(v189 + 32))(v168, v42, v192);
              if (v167 >> 60 == 15)
              {
                (*(void (**)(char *, uint64_t))(v189 + 8))(v168, v192);
                goto LABEL_53;
              }
              if (v110 == 1)
              {
                sub_2444648E8(v160, v167);
              }
              else
              {
                v121 = v158;
                (*(void (**)(char *, uint64_t, uint64_t))(v171 + 16))(v158, v187, v172);
                if (v109((uint64_t)v121, 1, AssociatedTypeWitness) != 1)
                {
                  v136 = v188;
                  v137 = v154;
                  (*(void (**)(char *, char *, uint64_t))(v188 + 32))(v154, v158, AssociatedTypeWitness);
                  (*(void (**)(char *, uint64_t, uint64_t))(v176 + 16))(v153, v177, v185);
                  (*(void (**)(char *, uint64_t, uint64_t))(v178 + 16))(v152, v180 + OBJC_IVAR____TtC15PlatformSSOCore15POCryptoKitHPKE_cipherSuite, v179);
                  v138 = v182;
                  v139 = v181;
                  if (v182 >> 60 == 15)
                    v140 = 0;
                  else
                    v140 = v181;
                  v141 = 0xC000000000000000;
                  if (v182 >> 60 != 15)
                    v141 = v182;
                  v186 = v141;
                  v187 = v140;
                  (*(void (**)(char *, char *, uint64_t))(v136 + 16))(v151, v137, AssociatedTypeWitness);
                  (*(void (**)(char *, char *, uint64_t))(v189 + 16))(v150, v168, v192);
                  sub_24446517C(v160, v167);
                  sub_24446517C(v139, v138);
                  sub_24446517C(v145, v146);
                  v142 = v184;
                  sub_24449C32C();
                  if (!v142)
                  {
                    (*(void (**)(char *, uint64_t))(v188 + 8))(v154, AssociatedTypeWitness);
                    (*(void (**)(char *, uint64_t))(v189 + 8))(v168, v192);
LABEL_75:
                    v125 = v193;
                    sub_2444649C8(v193, &qword_257365220);
                    v126 = (uint64_t)v174;
                    v127 = v191;
                    v144((uint64_t)v174, 0, 1, v191);
                    sub_244464A04(v126, v125, &qword_257365220);
                    v128 = v125;
                    v129 = v173;
                    sub_244464984(v128, v173, &qword_257365220);
                    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v190 + 48))(v129, 1, v127) == 1)
                    {
                      sub_2444649C8(v173, &qword_257365220);
                      if (qword_257366210 != -1)
                        swift_once();
                      v130 = sub_24449C0E0();
                      __swift_project_value_buffer(v130, (uint64_t)qword_257366218);
                      Logger.PSSO_ERROR(code:description:)(-1001);
                      swift_willThrow();
                      sub_244464970(v147, v148);
                      sub_244464970(v79, v149);
                      sub_244464970(v145, v146);
                    }
                    else
                    {
                      (*(void (**)(char *, uint64_t, uint64_t))(v190 + 32))(v165, v173, v191);
                      v196 = v147;
                      v197 = v148;
                      *(_QWORD *)&v198 = v79;
                      *((_QWORD *)&v198 + 1) = v149;
                      sub_244466024();
                      v131 = sub_24449C350();
                      v133 = v132;
                      Data.base64URLEncodedString()();
                      v134 = (void *)sub_24449C3F8();
                      swift_bridgeObjectRelease();
                      v135 = v200;
                      objc_msgSend(v200, sel_setRawBody_, v134);

                      objc_msgSend(v135, sel_updateDecodedBody);
                      sub_24446492C(v131, v133);
                      sub_244464970(v147, v148);
                      sub_244464970(v79, v149);
                      sub_244464970(v145, v146);
                      (*(void (**)(char *, uint64_t))(v190 + 8))(v165, v191);
                    }
                    return sub_2444649C8(v193, &qword_257365220);
                  }
                  sub_244464970(v147, v148);
                  sub_244464970(v79, v149);
                  sub_244464970(v145, v146);
                  (*(void (**)(char *, uint64_t))(v188 + 8))(v154, AssociatedTypeWitness);
                  goto LABEL_87;
                }
                sub_2444648E8(v160, v167);
                (*(void (**)(char *, uint64_t))(v171 + 8))(v158, v172);
              }
              (*(void (**)(char *, uint64_t, uint64_t))(v176 + 16))(v156, v177, v185);
              (*(void (**)(char *, uint64_t, uint64_t))(v178 + 16))(v157, v180 + OBJC_IVAR____TtC15PlatformSSOCore15POCryptoKitHPKE_cipherSuite, v179);
              v122 = v182;
              v123 = v181;
              (*(void (**)(char *, char *, uint64_t))(v189 + 16))(v155, v168, v192);
              sub_24446517C(v123, v122);
              sub_24446517C(v145, v146);
              v124 = v184;
              sub_24449C320();
              if (!v124)
              {
                (*(void (**)(char *, uint64_t))(v189 + 8))(v168, v192);
                v120 = &v191;
LABEL_74:
                v174 = (char *)*(v120 - 32);
                goto LABEL_75;
              }
              sub_244464970(v147, v148);
              sub_244464970(v79, v149);
              sub_244464970(v145, v146);
LABEL_87:
              (*(void (**)(char *, uint64_t))(v189 + 8))(v168, v192);
              return sub_2444649C8(v193, &qword_257365220);
            }
          }
LABEL_29:
          if (qword_257366210 != -1)
            swift_once();
          v93 = sub_24449C0E0();
          __swift_project_value_buffer(v93, (uint64_t)qword_257366218);
          Logger.PSSO_ERROR(code:description:)(-1005);
          swift_willThrow();
          goto LABEL_32;
        }
      }
      else
      {
LABEL_27:
        v198 = 0u;
        v199 = 0u;
      }
LABEL_28:
      sub_2444649C8((uint64_t)&v198, &qword_257365228);
      goto LABEL_29;
    }
  }
  if (qword_257366210 != -1)
    swift_once();
  v70 = sub_24449C0E0();
  __swift_project_value_buffer(v70, (uint64_t)qword_257366218);
  Logger.PSSO_ERROR(code:description:)(-1005);
  return swift_willThrow();
}

id POCryptoKitHPKE.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void POCryptoKitHPKE.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id POCryptoKitHPKE.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for POCryptoKitHPKE();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_24446ABDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_24449C59C();
  sub_24449C458();
  v4 = sub_24449C5A8();
  return sub_24446AD54(a1, a2, v4);
}

unint64_t sub_24446AC40(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_24449C53C();
  return sub_24446AE34(a1, v2);
}

uint64_t sub_24446AC70(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_24446ACA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24446ACE0()
{
  return type metadata accessor for POCryptoKitHPKE();
}

uint64_t sub_24446ACE8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24449C290();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

unint64_t sub_24446AD54(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_24449C590() & 1) == 0)
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
      while (!v14 && (sub_24449C590() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_24446AE34(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_24446AEF8(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x24950ECFC](v9, a1);
      sub_24446AC70((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_24446AEF8(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

_OWORD *sub_24446AF34(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24446AF44()
{
  uint64_t v0;

  v0 = sub_24449C0E0();
  __swift_allocate_value_buffer(v0, qword_257366248);
  __swift_project_value_buffer(v0, (uint64_t)qword_257366248);
  return sub_24449C0D4();
}

void *variable initialization expression of POCryptoKitHPKE_P256_SHA256_AES_GCM_128.encryptionAlgorithm()
{
  return &unk_251520FA8;
}

id POCryptoKitHPKE_P256_SHA256_AES_GCM_128.encryptionAlgorithm.getter()
{
  uint64_t v0;

  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128_encryptionAlgorithm));
}

id POCryptoKitHPKE_P256_SHA256_AES_GCM_128.__allocating_init()()
{
  objc_class *v0;
  objc_class *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;

  v1 = v0;
  v2 = sub_24449C2B4();
  v19 = *(_QWORD *)(v2 - 8);
  v20 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_24449C29C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_24449C2A8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_24449C290();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (char *)objc_allocWithZone(v1);
  *(_QWORD *)&v16[OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128_encryptionAlgorithm] = 0x251520FA8;
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x24BDC6768], v9);
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BDC6758], v5);
  (*(void (**)(char *, _QWORD, uint64_t))(v19 + 104))(v4, *MEMORY[0x24BDC6778], v20);
  v17 = &unk_251520FA8;
  sub_24449C284();
  return POCryptoKitHPKE.init(cipherSuite:)((uint64_t)v15);
}

id POCryptoKitHPKE_P256_SHA256_AES_GCM_128.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;

  v1 = sub_24449C2B4();
  v17 = *(_QWORD *)(v1 - 8);
  v18 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_24449C29C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24449C2A8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_24449C290();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128_encryptionAlgorithm) = 0x251520FA8;
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BDC6768], v8);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDC6758], v4);
  (*(void (**)(char *, _QWORD, uint64_t))(v17 + 104))(v3, *MEMORY[0x24BDC6778], v18);
  v15 = &unk_251520FA8;
  sub_24449C284();
  return POCryptoKitHPKE.init(cipherSuite:)((uint64_t)v14);
}

Swift::String __swiftcall POCryptoKitHPKE_P256_SHA256_AES_GCM_128.encValue(forPsk:auth:)(Swift::Bool forPsk, Swift::Bool auth)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  Swift::String result;

  v2 = 0xD000000000000023;
  if (!auth)
    v2 = 0xD00000000000001ELL;
  v3 = 0x80000002444ABE30;
  if (!auth)
    v3 = 0x80000002444ABE10;
  v4 = 0x80000002444ABDD0;
  if (auth)
    v4 = 0x80000002444ABDF0;
  v5 = !forPsk;
  if (forPsk)
    v6 = v2;
  else
    v6 = 0xD00000000000001FLL;
  if (v5)
    v7 = (void *)v4;
  else
    v7 = (void *)v3;
  result._object = v7;
  result._countAndFlagsBits = v6;
  return result;
}

uint64_t POCryptoKitHPKE_P256_SHA256_AES_GCM_128.decodeAndDecryptJWT(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, void *a9)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  __SecKey *v35;
  CFDataRef v36;
  CFDataRef v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  void *v43;
  void *v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  char *v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  CFDataRef v53;
  CFDataRef v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  char *v77;
  void *v78;
  char *v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;

  v76 = a7;
  v74 = a4;
  v75 = a1;
  v72 = a3;
  v78 = a2;
  v73 = sub_24449C3A4();
  v66 = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73);
  v77 = (char *)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_24449C440();
  v70 = *(_QWORD *)(v13 - 8);
  v71 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v69 = (char *)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_24449C1D0();
  v67 = *(_QWORD *)(v15 - 8);
  v68 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v79 = (char *)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257365280);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v65 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v65 - v21;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_257365098);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v65 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v65 - v27;
  v29 = sub_24449C170();
  v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56);
  v30(v28, 1, 1, v29);
  if (a6 >> 60 == 15
    || (v80 = a5,
        v81 = a6,
        sub_2444648E8(a5, a6),
        sub_24449C158(),
        sub_2444649C8((uint64_t)v28, &qword_257365098),
        v30(v26, 0, 1, v29),
        sub_244464A04((uint64_t)v26, (uint64_t)v28, &qword_257365098),
        a8 >> 60 != 15))
  {
    v65 = a8;
    v32 = sub_24449C380();
    v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56);
    v33(v22, 1, 1, v32);
    if (a9)
    {
      v34 = (uint64_t)v22;
      v35 = a9;
      v36 = SecKeyCopyExternalRepresentation(v35, 0);
      if (v36)
      {
        v37 = v36;
        v38 = sub_24449C098();
        v40 = v39;

        v80 = v38;
        v81 = v40;
        sub_2444648E8(v38, v40);
        v41 = v82;
        sub_24449C374();
        v82 = v41;
        if (v41)
        {

          sub_24446492C(v38, v40);
          sub_2444649C8(v34, (uint64_t *)&unk_257365280);
          return sub_2444649C8((uint64_t)v28, &qword_257365098);
        }
        sub_2444649C8(v34, (uint64_t *)&unk_257365280);

        sub_24446492C(v38, v40);
        v33(v20, 0, 1, v32);
        v22 = (char *)v34;
        sub_244464A04((uint64_t)v20, v34, (uint64_t *)&unk_257365280);
      }
      else
      {

      }
    }
    v43 = (void *)objc_opt_self();
    v44 = v78;
    v45 = objc_msgSend(v43, sel_isSEPKey_, v78);
    v46 = v82;
    v47 = (uint64_t)v79;
    if (v45)
    {
      v48 = v44;
      sub_24449C1C4();
      if (!v46)
      {
        if (v74)
        {
          v49 = v69;
          sub_24449C428();
          v50 = sub_24449C410();
          v52 = v51;
          (*(void (**)(char *, uint64_t))(v70 + 8))(v49, v71);
        }
        else
        {
          v50 = 0;
          v52 = 0xF000000000000000;
        }
        v64 = v68;
        POCryptoKitHPKE.decodeAndDecryptJWT<A>(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(v75, v47, v50, v52, (uint64_t)v28, v76, v65, (uint64_t)v22, v68, MEMORY[0x24BDC6478]);
        sub_244464970(v50, v52);
        (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v47, v64);
      }
    }
    else
    {
      v53 = SecKeyCopyExternalRepresentation((SecKeyRef)v44, 0);
      if (v53)
      {
        v54 = v53;
        v55 = sub_24449C098();
        v57 = v56;

        v80 = v55;
        v81 = v57;
        sub_2444648E8(v55, v57);
        v58 = (uint64_t)v77;
        sub_24449C398();
        if (v46)
        {
          sub_24446492C(v55, v57);
        }
        else
        {
          if (v74)
          {
            v60 = v69;
            sub_24449C428();
            v61 = sub_24449C410();
            v63 = v62;
            (*(void (**)(char *, uint64_t))(v70 + 8))(v60, v71);
          }
          else
          {
            v61 = 0;
            v63 = 0xF000000000000000;
          }
          POCryptoKitHPKE.decodeAndDecryptJWT<A>(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(v75, v58, v61, v63, (uint64_t)v28, v76, v65, (uint64_t)v22, v73, MEMORY[0x24BDC6958]);
          sub_244464970(v61, v63);
          sub_24446492C(v55, v57);
          (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v58, v73);
        }
      }
      else
      {
        if (qword_257366240 != -1)
          swift_once();
        v59 = sub_24449C0E0();
        __swift_project_value_buffer(v59, (uint64_t)qword_257366248);
        Logger.PSSO_ERROR(code:description:)(-1005);
        swift_willThrow();
      }
    }
    sub_2444649C8((uint64_t)v22, (uint64_t *)&unk_257365280);
  }
  else
  {
    if (qword_257366240 != -1)
      swift_once();
    v31 = sub_24449C0E0();
    __swift_project_value_buffer(v31, (uint64_t)qword_257366248);
    Logger.PSSO_ERROR(code:description:)(-1005);
    swift_willThrow();
  }
  return sub_2444649C8((uint64_t)v28, &qword_257365098);
}

__SecKey *POCryptoKitHPKE_P256_SHA256_AES_GCM_128.encodeAndEncryptJWT(_:publicKey:otherInfo:psk:psk_id:authPrivateKey:auth_kid:)(void *a1, __SecKey *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, void *a9, uint64_t a10, unint64_t a11)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  __SecKey *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  CFDataRef v41;
  CFDataRef v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  CFDataRef v51;
  uint64_t v52;
  unint64_t v53;
  char *v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  SecKeyRef v85;
  char *v86;
  void *v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;

  v87 = a1;
  v80 = a4;
  v76 = a7;
  v74 = a3;
  v85 = a2;
  v75 = sub_24449C440();
  v73 = *(_QWORD *)(v75 - 8);
  MEMORY[0x24BDAC7A8](v75);
  v72 = (char *)&v69 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_24449C380();
  v78 = *(_QWORD *)(v15 - 8);
  v79 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v82 = (char *)&v69 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_257365290);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v69 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v18);
  v81 = (char *)&v69 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v91 = (uint64_t)&v69 - v23;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_257365098);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v69 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v25);
  v30 = (__SecKey *)((char *)&v69 - v29);
  MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&v69 - v31;
  v33 = sub_24449C170();
  v84 = *(_QWORD *)(v33 - 8);
  v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v84 + 56);
  v34(v32, 1, 1, v33);
  v77 = a8;
  v35 = a8 >> 60;
  if (a6 >> 60 != 15)
  {
    v89 = a5;
    v90 = a6;
    sub_2444648E8(a5, a6);
    sub_24449C158();
    sub_2444649C8((uint64_t)v32, &qword_257365098);
    v34((char *)v30, 0, 1, v33);
    sub_244464A04((uint64_t)v30, (uint64_t)v32, &qword_257365098);
    if (v35 >= 0xF)
    {
      if (qword_257366240 != -1)
        swift_once();
      v36 = sub_24449C0E0();
      __swift_project_value_buffer(v36, (uint64_t)qword_257366248);
      Logger.PSSO_ERROR(code:description:)(-1005);
      swift_willThrow();
      v67 = (uint64_t)v32;
      goto LABEL_24;
    }
  }
  v37 = sub_24449C3A4();
  v38 = *(_QWORD *)(v37 - 8);
  v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 56);
  v40 = v91;
  v83 = v37;
  v39(v91, 1, 1);
  v86 = v32;
  if (a9)
  {
    v71 = v35;
    v30 = a9;
    v41 = SecKeyCopyExternalRepresentation(v30, 0);
    if (v41)
    {
      v42 = v41;
      v70 = v38;
      v43 = sub_24449C098();
      v45 = v44;

      v89 = v43;
      v90 = v45;
      sub_2444648E8(v43, v45);
      v46 = (uint64_t)v81;
      v47 = v88;
      sub_24449C398();
      if (v47)
      {

        v48 = v43;
LABEL_15:
        sub_24446492C(v48, v45);
        v56 = v91;
LABEL_19:
        sub_2444649C8(v56, &qword_257365290);
        v67 = (uint64_t)v86;
LABEL_24:
        sub_2444649C8(v67, &qword_257365098);
        return v30;
      }
      v88 = 0;
      v49 = v91;
      sub_2444649C8(v91, &qword_257365290);

      v50 = v45;
      v40 = v49;
      sub_24446492C(v43, v50);
      ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v39)(v46, 0, 1, v83);
      sub_244464A04(v46, v49, &qword_257365290);
      v32 = v86;
      v38 = v70;
    }
    else
    {

    }
  }
  v30 = (__SecKey *)objc_msgSend(v87, sel_header);
  sub_244464984((uint64_t)v32, (uint64_t)v27, &qword_257365098);
  (*(uint64_t (**)(char *, uint64_t, uint64_t))(v84 + 48))(v27, 1, v33);
  sub_2444649C8((uint64_t)v27, &qword_257365098);
  sub_244464984(v40, (uint64_t)v20, &qword_257365290);
  (*(void (**)(char *, uint64_t, uint64_t))(v38 + 48))(v20, 1, v83);
  sub_2444649C8((uint64_t)v20, &qword_257365290);
  _s15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128C9addValues2to3psk4authySo18POMutableJWTHeaderC_S2btF_0(v30);

  v51 = SecKeyCopyExternalRepresentation(v85, 0);
  if (!v51)
  {
    if (qword_257366240 != -1)
      swift_once();
    v57 = sub_24449C0E0();
    __swift_project_value_buffer(v57, (uint64_t)qword_257366248);
    Logger.PSSO_ERROR(code:description:)(-1005);
    swift_willThrow();
    v56 = v40;
    goto LABEL_19;
  }
  v30 = v51;
  v52 = sub_24449C098();
  v45 = v53;

  v89 = v52;
  v90 = v45;
  sub_2444648E8(v52, v45);
  v54 = v82;
  v55 = v88;
  sub_24449C374();
  if (v55)
  {
    v48 = v52;
    goto LABEL_15;
  }
  v58 = a11;
  v59 = (uint64_t)v86;
  if (v80)
  {
    v60 = v72;
    v88 = a11;
    sub_24449C428();
    v61 = sub_24449C410();
    v63 = v62;
    (*(void (**)(char *, uint64_t))(v73 + 8))(v60, v75);
    v58 = v88;
    v59 = (uint64_t)v86;
  }
  else
  {
    v61 = 0;
    v63 = 0xF000000000000000;
  }
  v64 = (uint64_t)v54;
  v65 = v59;
  v66 = v91;
  v30 = (__SecKey *)POCryptoKitHPKE.encodeAndEncryptJWT<A>(_:publicKey:otherInfo:psk:psk_id:authPrivateKey:auth_kid:)(v87, v64, v61, v63, v59, v76, v77, v91, a10, v58, v83, MEMORY[0x24BDC6958]);
  sub_244464970(v61, v63);
  sub_24446492C(v52, v45);
  (*(void (**)(char *, uint64_t))(v78 + 8))(v82, v79);
  sub_2444649C8(v66, &qword_257365290);
  sub_2444649C8(v65, &qword_257365098);
  return v30;
}

void POCryptoKitHPKE_P256_SHA256_AES_GCM_128.__allocating_init(cipherSuite:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void POCryptoKitHPKE_P256_SHA256_AES_GCM_128.init(cipherSuite:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_24446C8A4()
{
  uint64_t v0;

  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128_encryptionAlgorithm));
}

id POCryptoKitHPKE_P256_SHA256_AES_GCM_128.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void _s15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128C9addValues2to3psk4authySo18POMutableJWTHeaderC_S2btF_0(void *a1)
{
  void *v2;
  id v3;

  v2 = (void *)sub_24449C3F8();
  objc_msgSend(a1, sel_setAlg_, v2);

  v3 = (id)sub_24449C3F8();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setEnc_, v3);

}

uint64_t sub_24446C9F0()
{
  return type metadata accessor for POCryptoKitHPKE_P256_SHA256_AES_GCM_128();
}

uint64_t type metadata accessor for POCryptoKitHPKE_P256_SHA256_AES_GCM_128()
{
  uint64_t result;

  result = qword_257366260;
  if (!qword_257366260)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24446CA34()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_24446CA74()
{
  uint64_t v0;

  v0 = sub_24449C0E0();
  __swift_allocate_value_buffer(v0, qword_257366478);
  __swift_project_value_buffer(v0, (uint64_t)qword_257366478);
  return sub_24449C0D4();
}

void *sub_24446CAEC()
{
  qword_2573669A0 = 0x251520F60;
  return &unk_251520F60;
}

uint64_t *sub_24446CB04()
{
  if (qword_257366490 != -1)
    swift_once();
  return &qword_2573669A0;
}

id sub_24446CB44()
{
  if (qword_257366490 != -1)
    swift_once();
  return (id)qword_2573669A0;
}

uint64_t sub_24446CBC4()
{
  uint64_t v0;

  v0 = sub_24449C290();
  __swift_allocate_value_buffer(v0, qword_2573669A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2573669A8);
  return sub_24449C260();
}

uint64_t sub_24446CC0C()
{
  uint64_t v0;

  if (qword_257366498 != -1)
    swift_once();
  v0 = sub_24449C290();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2573669A8);
}

uint64_t sub_24446CC54@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_257366498 != -1)
    swift_once();
  v2 = sub_24449C290();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2573669A8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t variable initialization expression of POUserUnlockKeySwift.encryptedKeyData()
{
  return 0;
}

uint64_t POUserUnlockKeySwift.encryptedKeyData.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC15PlatformSSOCore20POUserUnlockKeySwift_encryptedKeyData);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_24446CE14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC15PlatformSSOCore20POUserUnlockKeySwift_encryptedKeyData);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24446CE70(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC15PlatformSSOCore20POUserUnlockKeySwift_encryptedKeyData);
  swift_beginAccess();
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t variable initialization expression of POUserUnlockKeySwift.keyData()
{
  return 0;
}

uint64_t POUserUnlockKeySwift.keyData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC15PlatformSSOCore20POUserUnlockKeySwift_keyData;
  swift_beginAccess();
  v2 = *(_QWORD *)v1;
  sub_24446517C(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  return v2;
}

uint64_t sub_24446D058(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;

  v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC15PlatformSSOCore20POUserUnlockKeySwift_keyData);
  swift_beginAccess();
  v6 = *v5;
  v7 = v5[1];
  *v5 = a1;
  v5[1] = a2;
  return sub_244464970(v6, v7);
}

uint64_t sub_24446D0B4(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = (uint64_t *)(*a2 + OBJC_IVAR____TtC15PlatformSSOCore20POUserUnlockKeySwift_keyData);
  swift_beginAccess();
  v5 = *v4;
  v6 = v4[1];
  *v4 = v2;
  v4[1] = v3;
  sub_24446517C(v2, v3);
  return sub_244464970(v5, v6);
}

char *static POUserUnlockKeySwift.unlockKey(encryptedKey:privateKey:)(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_24446D380(a1, a2, a3);
}

_QWORD *static POUserUnlockKeySwift.createUnlockKey(publicKey:)(__SecKey *a1)
{
  return sub_24446D868(a1);
}

id POUserUnlockKeySwift.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for POUserUnlockKeySwift();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

char *sub_24446D380(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  id v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;

  v48 = a3;
  v3 = sub_24449C290();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24449C368();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v46 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_24449C1D0();
  v47 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v52 = (char *)&v38 - v14;
  swift_bridgeObjectRetain();
  v15 = Data.init(base64URLEncoded:)();
  if (v16 >> 60 == 15)
    goto LABEL_8;
  v17 = v15;
  v18 = v16;
  v43 = v8;
  v44 = v7;
  v19 = objc_allocWithZone((Class)POWrappedTokenJWTBody);
  v20 = (void *)sub_24449C080();
  v21 = objc_msgSend(v19, sel_initWithJWTData_, v20);

  if (!v21)
  {
LABEL_7:
    sub_244464970(v17, v18);
LABEL_8:
    if (qword_257366470 != -1)
      swift_once();
    v30 = sub_24449C0E0();
    __swift_project_value_buffer(v30, (uint64_t)qword_257366478);
    Logger.PSSO_ERROR(code:description:)(-1005);
    swift_willThrow();
    return v13;
  }
  v45 = v17;
  v42 = v10;
  v22 = objc_msgSend(v21, sel_encapsulatedKey);
  sub_24449C404();

  v23 = sub_24449C050();
  v25 = v24;
  swift_bridgeObjectRelease();
  if (v25 >> 60 == 15)
  {
LABEL_6:

    v17 = v45;
    goto LABEL_7;
  }
  v40 = v23;
  v41 = v25;
  v26 = objc_msgSend(v21, sel_cipherText);
  sub_24449C404();

  v27 = sub_24449C050();
  v29 = v28;
  swift_bridgeObjectRelease();
  if (v29 >> 60 == 15)
  {
    sub_244464970(v40, v41);
    goto LABEL_6;
  }
  v39 = v29;
  v32 = v48;
  v33 = v52;
  v34 = v49;
  sub_24449C1B8();
  if (v34)
  {
    sub_244464970(v27, v39);
    sub_244464970(v40, v41);

    sub_244464970(v45, v18);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v13, v33, v42);
    if (qword_257366498 != -1)
      swift_once();
    v35 = __swift_project_value_buffer(v3, (uint64_t)qword_2573669A8);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v35, v3);
    sub_2444648E8(v40, v41);
    sub_24449C344();
    v50 = v27;
    v36 = v39;
    v51 = v39;
    sub_244466024();
    v37 = v46;
    v13 = (char *)sub_24449C35C();

    sub_244464970(v40, v41);
    sub_244464970(v45, v18);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v37, v44);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v52, v42);
    sub_244464970(v27, v36);
  }
  return v13;
}

_QWORD *sub_24446D868(__SecKey *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  CFDataRef v21;
  CFDataRef v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  id v35;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  id v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  void *v44;
  void *v45;
  uint64_t *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  Swift::String v54;
  Swift::String *v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  id v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char *v72;

  v3 = (_QWORD *)sub_24449C290();
  v4 = *(v3 - 1);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24449C314();
  v66 = *(_QWORD *)(v7 - 8);
  v67 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v68 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_24449C380();
  v69 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v72 = (char *)&v56 - v13;
  v14 = (void *)objc_opt_self();
  if (qword_257366490 != -1)
    swift_once();
  v15 = objc_msgSend(v14, sel_createSEPEncryptionKeyForAlgorithm_shared_preboot_, qword_2573669A0, 1, 0);
  v16 = v14;
  if (v15)
  {
    v17 = objc_msgSend(v16, sel_dataForKey_, v15);
    if (v17)
    {
      v18 = v17;
      v19 = sub_24449C098();
      v64 = v20;
      v65 = v19;

      v21 = SecKeyCopyExternalRepresentation(a1, 0);
      if (v21)
      {
        v22 = v21;
        v63 = v15;
        v23 = sub_24449C098();
        v25 = v24;

        v26 = v25;
        v70 = v23;
        v71 = v25;
        sub_2444648E8(v23, v25);
        v27 = v72;
        sub_24449C374();
        if (v1)
        {
          sub_24446492C(v23, v26);
          sub_24446492C(v65, v64);

        }
        else
        {
          v61 = v26;
          v62 = v23;
          v31 = v27;
          v32 = v9;
          (*(void (**)(char *, char *, uint64_t))(v69 + 16))(v12, v31, v9);
          if (qword_257366498 != -1)
            swift_once();
          v33 = __swift_project_value_buffer((uint64_t)v3, (uint64_t)qword_2573669A8);
          (*(void (**)(char *, uint64_t, _QWORD *))(v4 + 16))(v6, v33, v3);
          v34 = v68;
          sub_24449C2E4();
          v35 = v63;
          v37 = v64;
          v70 = v65;
          v71 = v64;
          sub_244466024();
          v38 = sub_24449C308();
          v59 = v39;
          v60 = v38;
          v40 = objc_msgSend(objc_allocWithZone((Class)POMutableWrappedTokenJWTBody), sel_init);
          v41 = sub_24449C2F0();
          v58 = v32;
          v43 = v42;
          sub_24449C08C();
          sub_24446492C(v41, v43);
          v44 = (void *)sub_24449C3F8();
          swift_bridgeObjectRelease();
          objc_msgSend(v40, sel_setEncapsulatedKey_, v44);

          sub_24449C08C();
          v45 = (void *)sub_24449C3F8();
          swift_bridgeObjectRelease();
          v57 = v40;
          objc_msgSend(v40, sel_setCipherText_, v45);

          v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for POUserUnlockKeySwift()), sel_init);
          v46 = (_QWORD *)((char *)v3 + OBJC_IVAR____TtC15PlatformSSOCore20POUserUnlockKeySwift_keyData);
          swift_beginAccess();
          v47 = *v46;
          v48 = v46[1];
          v49 = v65;
          *v46 = v65;
          v46[1] = v37;
          sub_2444648E8(v49, v37);
          sub_244464970(v47, v48);
          v50 = objc_msgSend(v40, sel_dataRepresentation);
          v51 = sub_24449C098();
          v53 = v52;

          v54 = Data.base64URLEncodedString()();
          sub_24446492C(v51, v53);
          v55 = (Swift::String *)((char *)v3 + OBJC_IVAR____TtC15PlatformSSOCore20POUserUnlockKeySwift_encryptedKeyData);
          swift_beginAccess();
          *v55 = v54;

          swift_bridgeObjectRelease();
          sub_24446492C(v60, v59);

          sub_24446492C(v65, v37);
          sub_24446492C(v62, v61);
          (*(void (**)(char *, uint64_t))(v66 + 8))(v34, v67);
          (*(void (**)(char *, uint64_t))(v69 + 8))(v72, v58);
        }
        return v3;
      }
      if (qword_257366470 != -1)
        swift_once();
      v30 = sub_24449C0E0();
      __swift_project_value_buffer(v30, (uint64_t)qword_257366478);
      Logger.PSSO_ERROR(code:description:)(-1005);
      swift_willThrow();
      sub_24446492C(v65, v64);
    }
    else
    {
      if (qword_257366470 != -1)
        swift_once();
      v29 = sub_24449C0E0();
      __swift_project_value_buffer(v29, (uint64_t)qword_257366478);
      Logger.PSSO_ERROR(code:description:)(-1001);
      swift_willThrow();
    }

    return v3;
  }
  if (qword_257366470 != -1)
    swift_once();
  v28 = sub_24449C0E0();
  __swift_project_value_buffer(v28, (uint64_t)qword_257366478);
  Logger.PSSO_ERROR(code:description:)(-1001);
  swift_willThrow();
  return v3;
}

uint64_t type metadata accessor for POUserUnlockKeySwift()
{
  return objc_opt_self();
}

id Logger.PSSO_ERROR(code:description:)(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_24449C3F8();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend((id)objc_opt_self(), sel_errorWithCode_description_, a1, v2);

  LOBYTE(v2) = sub_24449C4F4();
  v4 = v3;
  v5 = sub_24449C0C8();
  v6 = v2;
  if (os_log_type_enabled(v5, (os_log_type_t)v2))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138543362;
    v9 = v4;
    sub_24449C50C();
    *v8 = v4;

    _os_log_impl(&dword_24440D000, v5, v6, "%{public}@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573652F8);
    swift_arrayDestroy();
    MEMORY[0x24950FB48](v8, -1, -1);
    MEMORY[0x24950FB48](v7, -1, -1);
  }
  else
  {

  }
  return v4;
}

id Logger.PSSO_ERROR_VALUE(code:description:value:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;
  os_log_type_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  id v17;

  swift_bridgeObjectRetain();
  v6 = (void *)sub_24449C3F8();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend((id)objc_opt_self(), sel_errorWithCode_description_, a1, v6);

  v8 = sub_24449C4F4();
  v9 = v7;
  v10 = a4;
  v11 = v9;
  v12 = v10;
  v13 = sub_24449C0C8();
  if (os_log_type_enabled(v13, v8))
  {
    v14 = swift_slowAlloc();
    v15 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v14 = 138543618;
    v16 = v11;
    sub_24449C50C();
    *v15 = v11;

    *(_WORD *)(v14 + 12) = 2114;
    v17 = v12;
    sub_24449C50C();
    v15[1] = v12;

    _os_log_impl(&dword_24440D000, v13, v8, "%{public}@, %{public}@", (uint8_t *)v14, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573652F8);
    swift_arrayDestroy();
    MEMORY[0x24950FB48](v15, -1, -1);
    MEMORY[0x24950FB48](v14, -1, -1);
  }
  else
  {

  }
  return v11;
}

id Logger.PSSO_SUBERROR(code:subError:description:)(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  id v13;

  swift_bridgeObjectRetain();
  v4 = a2;
  v5 = (void *)sub_24449C038();

  v6 = (void *)sub_24449C3F8();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend((id)objc_opt_self(), sel_errorWithCode_underlyingError_description_, a1, v5, v6);

  LOBYTE(v6) = sub_24449C4F4();
  v8 = v7;
  v9 = sub_24449C0C8();
  v10 = v6;
  if (os_log_type_enabled(v9, (os_log_type_t)v6))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v11 = 138543362;
    v13 = v8;
    sub_24449C50C();
    *v12 = v8;

    _os_log_impl(&dword_24440D000, v9, v10, "%{public}@", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573652F8);
    swift_arrayDestroy();
    MEMORY[0x24950FB48](v12, -1, -1);
    MEMORY[0x24950FB48](v11, -1, -1);
  }
  else
  {

  }
  return v8;
}

id Logger.PSSO_SUBERROR_VALUE(code:subError:description:value:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  os_log_type_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  id v21;

  swift_bridgeObjectRetain();
  v8 = a2;
  v9 = (void *)sub_24449C038();

  v10 = (void *)sub_24449C3F8();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend((id)objc_opt_self(), sel_errorWithCode_underlyingError_description_, a1, v9, v10);

  v12 = sub_24449C4F4();
  v13 = v11;
  v14 = a5;
  v15 = v13;
  v16 = v14;
  v17 = sub_24449C0C8();
  if (os_log_type_enabled(v17, v12))
  {
    v18 = swift_slowAlloc();
    v19 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v18 = 138543618;
    v20 = v15;
    sub_24449C50C();
    *v19 = v15;

    *(_WORD *)(v18 + 12) = 2114;
    v21 = v16;
    sub_24449C50C();
    v19[1] = v16;

    _os_log_impl(&dword_24440D000, v17, v12, "%{public}@, %{public}@", (uint8_t *)v18, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573652F8);
    swift_arrayDestroy();
    MEMORY[0x24950FB48](v19, -1, -1);
    MEMORY[0x24950FB48](v18, -1, -1);
  }
  else
  {

  }
  return v15;
}

Swift::String __swiftcall Data.base64URLEncodedString()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  Swift::String result;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v0 = sub_24449BFCC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_24449C08C();
  v22 = v4;
  v19 = 43;
  v20 = 0xE100000000000000;
  v17 = 45;
  v18 = 0xE100000000000000;
  sub_24446E8D0();
  v5 = sub_24449C524();
  v7 = v6;
  swift_bridgeObjectRelease();
  v21 = v5;
  v22 = v7;
  v19 = 47;
  v20 = 0xE100000000000000;
  v17 = 95;
  v18 = 0xE100000000000000;
  v8 = sub_24449C524();
  v10 = v9;
  swift_bridgeObjectRelease();
  v21 = v8;
  v22 = v10;
  v19 = (uint64_t)&unk_251500EA8;
  sub_24446E914();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257365310);
  sub_24446E95C();
  sub_24449C530();
  v11 = sub_24449C518();
  v13 = v12;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_bridgeObjectRelease();
  v14 = v11;
  v15 = v13;
  result._object = v15;
  result._countAndFlagsBits = v14;
  return result;
}

unint64_t sub_24446E8D0()
{
  unint64_t result;

  result = qword_257365300;
  if (!qword_257365300)
  {
    result = MEMORY[0x24950FAF4](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_257365300);
  }
  return result;
}

unint64_t sub_24446E914()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257365308;
  if (!qword_257365308)
  {
    v1 = sub_24449BFCC();
    result = MEMORY[0x24950FAF4](MEMORY[0x24BDCB778], v1);
    atomic_store(result, (unint64_t *)&qword_257365308);
  }
  return result;
}

unint64_t sub_24446E95C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257365318;
  if (!qword_257365318)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257365310);
    result = MEMORY[0x24950FAF4](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_257365318);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24950FAE8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t Data.init(base64URLEncoded:)()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_24449C464();
  sub_24446E8D0();
  sub_24449C524();
  swift_bridgeObjectRelease();
  sub_24449C524();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24449C4DC();
  sub_24449C47C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v0 = sub_24449C050();
  v2 = v1;
  sub_24446517C(v0, v1);
  swift_bridgeObjectRelease();
  if (v2 >> 60 != 15)
    sub_244464970(v0, v2);
  return v0;
}

id POCryptoKitAlgorithmCurve25519.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id POCryptoKitAlgorithmCurve25519.init()()
{
  void *v0;
  objc_class *ObjectType;
  void *v2;
  void *v3;
  id v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = (void *)sub_24449C3F8();
  v3 = (void *)sub_24449C3F8();
  v6.receiver = v0;
  v6.super_class = ObjectType;
  v4 = objc_msgSendSuper2(&v6, sel_initWithSecKeyAlgorithm_algorithmName_alg_, 0, v2, v3);

  return v4;
}

uint64_t POCryptoKitAlgorithmCurve25519.sign(_:using:error:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _QWORD v13[2];

  v7 = sub_24449C1AC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a3;
  sub_24449C194();
  if (!v3)
  {
    v13[0] = a1;
    v13[1] = a2;
    sub_244466024();
    a2 = sub_24449C1A0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return a2;
}

id POCryptoKitAlgorithmCurve25519.__allocating_init(secKeyAlgorithm:algorithmName:alg:)(void *a1)
{
  objc_class *v1;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_allocWithZone(v1);
  v4 = (void *)sub_24449C3F8();
  swift_bridgeObjectRelease();
  v5 = (void *)sub_24449C3F8();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v3, sel_initWithSecKeyAlgorithm_algorithmName_alg_, a1, v4, v5);

  return v6;
}

void POCryptoKitAlgorithmCurve25519.init(secKeyAlgorithm:algorithmName:alg:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id POCryptoKitAlgorithmCurve25519.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s15PlatformSSOCore30POCryptoKitAlgorithmCurve25519C15verifySignature_2on5usingSb10Foundation4DataV_AISo9SecKeyRefatF_0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, __SecKey *a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  CFDataRef v17;
  CFDataRef v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  _QWORD v24[4];
  uint64_t v25;
  unint64_t v26;

  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257365348);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_24449C140();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = SecKeyCopyExternalRepresentation(a5, 0);
  if (v17)
  {
    v18 = v17;
    v24[0] = a4;
    v19 = sub_24449C098();
    v21 = v20;

    v25 = v19;
    v26 = v21;
    sub_2444648E8(v19, v21);
    sub_24449C134();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
    {
      sub_24446492C(v19, v21);
      sub_24446F824((uint64_t)v12);
      v22 = 0;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
      v25 = a1;
      v26 = a2;
      v24[1] = a3;
      v24[2] = v24[0];
      sub_244466024();
      v22 = sub_24449C128();
      sub_24446492C(v19, v21);
      (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    }
  }
  else
  {
    v22 = 0;
  }
  return v22 & 1;
}

uint64_t _s15PlatformSSOCore30POCryptoKitAlgorithmCurve25519C15verifySignature_2on22usingCertificateStringSb10Foundation4DataV_AISStF_0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8;
  void *v9;
  const __CFData *v10;
  __SecCertificate *v11;
  __SecCertificate *v12;
  __SecKey *v13;
  __SecKey *v14;
  char v15;

  v8 = objc_allocWithZone(MEMORY[0x24BDBCE50]);
  swift_bridgeObjectRetain();
  v9 = (void *)sub_24449C3F8();
  swift_bridgeObjectRelease();
  v10 = (const __CFData *)objc_msgSend(v8, sel_initWithBase64EncodedString_options_, v9, 0);

  if (v10)
  {
    v11 = SecCertificateCreateWithData(0, v10);
    if (v11)
    {
      v12 = v11;
      v13 = SecCertificateCopyKey(v11);
      if (v13)
      {
        v14 = v13;
        v15 = _s15PlatformSSOCore30POCryptoKitAlgorithmCurve25519C15verifySignature_2on5usingSb10Foundation4DataV_AISo9SecKeyRefatF_0(a1, a2, a3, a4, v13);

        v10 = v12;
        v12 = v14;
      }
      else
      {
        v15 = 0;
      }

      v10 = v12;
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }
  return v15 & 1;
}

uint64_t _s15PlatformSSOCore30POCryptoKitAlgorithmCurve25519C9verifyKeyySbSo03SecH3RefaF_0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;
  id v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;

  v2 = sub_24449C1AC();
  v21 = *(_QWORD *)(v2 - 8);
  v22 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_24449C440();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_24449C0BC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24449C0B0();
  sub_24449C0A4();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_24449C428();
  v13 = sub_24449C410();
  v15 = v14;
  swift_bridgeObjectRelease();
  result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v15 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    if (objc_msgSend((id)objc_opt_self(), sel_isSEPKey_, a1))
    {
      v17 = a1;
      sub_24449C194();
      v23 = v13;
      v24 = v15;
      sub_244466024();
      v18 = sub_24449C1A0();
      sub_24446492C(v18, v19);
      (*(void (**)(char *, uint64_t))(v21 + 8))(v4, v22);
    }
    sub_244464970(v13, v15);
    return 1;
  }
  return result;
}

uint64_t type metadata accessor for POCryptoKitAlgorithmCurve25519()
{
  return objc_opt_self();
}

uint64_t sub_24446F824(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257365348);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24446F864()
{
  uint64_t v0;

  v0 = sub_24449C0E0();
  __swift_allocate_value_buffer(v0, qword_2573664A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2573664A8);
  return sub_24449C0D4();
}

void *variable initialization expression of POCryptoKitHPKE_P256_SHA256_AES_GCM_256.encryptionAlgorithm()
{
  return &unk_251520F60;
}

id POCryptoKitHPKE_P256_SHA256_AES_GCM_256.encryptionAlgorithm.getter()
{
  uint64_t v0;

  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_256_encryptionAlgorithm));
}

id POCryptoKitHPKE_P256_SHA256_AES_GCM_256.__allocating_init()()
{
  objc_class *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char *v4;
  id v5;
  uint64_t v7;

  v1 = sub_24449C290();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (char *)objc_allocWithZone(v0);
  *(_QWORD *)&v4[OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_256_encryptionAlgorithm] = 0x251520F60;
  v5 = &unk_251520F60;
  sub_24449C260();
  return POCryptoKitHPKE.init(cipherSuite:)((uint64_t)v3);
}

id POCryptoKitHPKE_P256_SHA256_AES_GCM_256.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  uint64_t v6;

  v1 = sub_24449C290();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_256_encryptionAlgorithm) = 0x251520F60;
  v4 = &unk_251520F60;
  sub_24449C260();
  return POCryptoKitHPKE.init(cipherSuite:)((uint64_t)v3);
}

uint64_t POCryptoKitHPKE_P256_SHA256_AES_GCM_256.decodeAndDecryptJWT(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, void *a9)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  __SecKey *v35;
  CFDataRef v36;
  CFDataRef v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  void *v43;
  void *v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  char *v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  CFDataRef v53;
  CFDataRef v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  char *v77;
  void *v78;
  char *v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;

  v76 = a7;
  v74 = a4;
  v75 = a1;
  v72 = a3;
  v78 = a2;
  v73 = sub_24449C3A4();
  v66 = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73);
  v77 = (char *)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_24449C440();
  v70 = *(_QWORD *)(v13 - 8);
  v71 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v69 = (char *)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_24449C1D0();
  v67 = *(_QWORD *)(v15 - 8);
  v68 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v79 = (char *)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257365280);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v65 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v65 - v21;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_257365098);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v65 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v65 - v27;
  v29 = sub_24449C170();
  v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56);
  v30(v28, 1, 1, v29);
  if (a6 >> 60 == 15
    || (v80 = a5,
        v81 = a6,
        sub_2444648E8(a5, a6),
        sub_24449C158(),
        sub_2444649C8((uint64_t)v28, &qword_257365098),
        v30(v26, 0, 1, v29),
        sub_244464A04((uint64_t)v26, (uint64_t)v28, &qword_257365098),
        a8 >> 60 != 15))
  {
    v65 = a8;
    v32 = sub_24449C380();
    v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56);
    v33(v22, 1, 1, v32);
    if (a9)
    {
      v34 = (uint64_t)v22;
      v35 = a9;
      v36 = SecKeyCopyExternalRepresentation(v35, 0);
      if (v36)
      {
        v37 = v36;
        v38 = sub_24449C098();
        v40 = v39;

        v80 = v38;
        v81 = v40;
        sub_2444648E8(v38, v40);
        v41 = v82;
        sub_24449C374();
        v82 = v41;
        if (v41)
        {

          sub_24446492C(v38, v40);
          sub_2444649C8(v34, (uint64_t *)&unk_257365280);
          return sub_2444649C8((uint64_t)v28, &qword_257365098);
        }
        sub_2444649C8(v34, (uint64_t *)&unk_257365280);

        sub_24446492C(v38, v40);
        v33(v20, 0, 1, v32);
        v22 = (char *)v34;
        sub_244464A04((uint64_t)v20, v34, (uint64_t *)&unk_257365280);
      }
      else
      {

      }
    }
    v43 = (void *)objc_opt_self();
    v44 = v78;
    v45 = objc_msgSend(v43, sel_isSEPKey_, v78);
    v46 = v82;
    v47 = (uint64_t)v79;
    if (v45)
    {
      v48 = v44;
      sub_24449C1C4();
      if (!v46)
      {
        if (v74)
        {
          v49 = v69;
          sub_24449C428();
          v50 = sub_24449C410();
          v52 = v51;
          (*(void (**)(char *, uint64_t))(v70 + 8))(v49, v71);
        }
        else
        {
          v50 = 0;
          v52 = 0xF000000000000000;
        }
        v64 = v68;
        POCryptoKitHPKE.decodeAndDecryptJWT<A>(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(v75, v47, v50, v52, (uint64_t)v28, v76, v65, (uint64_t)v22, v68, MEMORY[0x24BDC6478]);
        sub_244464970(v50, v52);
        (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v47, v64);
      }
    }
    else
    {
      v53 = SecKeyCopyExternalRepresentation((SecKeyRef)v44, 0);
      if (v53)
      {
        v54 = v53;
        v55 = sub_24449C098();
        v57 = v56;

        v80 = v55;
        v81 = v57;
        sub_2444648E8(v55, v57);
        v58 = (uint64_t)v77;
        sub_24449C398();
        if (v46)
        {
          sub_24446492C(v55, v57);
        }
        else
        {
          if (v74)
          {
            v60 = v69;
            sub_24449C428();
            v61 = sub_24449C410();
            v63 = v62;
            (*(void (**)(char *, uint64_t))(v70 + 8))(v60, v71);
          }
          else
          {
            v61 = 0;
            v63 = 0xF000000000000000;
          }
          POCryptoKitHPKE.decodeAndDecryptJWT<A>(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(v75, v58, v61, v63, (uint64_t)v28, v76, v65, (uint64_t)v22, v73, MEMORY[0x24BDC6958]);
          sub_244464970(v61, v63);
          sub_24446492C(v55, v57);
          (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v58, v73);
        }
      }
      else
      {
        if (qword_2573664A0 != -1)
          swift_once();
        v59 = sub_24449C0E0();
        __swift_project_value_buffer(v59, (uint64_t)qword_2573664A8);
        Logger.PSSO_ERROR(code:description:)(-1005);
        swift_willThrow();
      }
    }
    sub_2444649C8((uint64_t)v22, (uint64_t *)&unk_257365280);
  }
  else
  {
    if (qword_2573664A0 != -1)
      swift_once();
    v31 = sub_24449C0E0();
    __swift_project_value_buffer(v31, (uint64_t)qword_2573664A8);
    Logger.PSSO_ERROR(code:description:)(-1005);
    swift_willThrow();
  }
  return sub_2444649C8((uint64_t)v28, &qword_257365098);
}

__SecKey *POCryptoKitHPKE_P256_SHA256_AES_GCM_256.encodeAndEncryptJWT(_:publicKey:otherInfo:psk:psk_id:authPrivateKey:auth_kid:)(void *a1, __SecKey *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, void *a9, uint64_t a10, unint64_t a11)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  __SecKey *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  CFDataRef v41;
  CFDataRef v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  CFDataRef v51;
  uint64_t v52;
  unint64_t v53;
  char *v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  SecKeyRef v85;
  char *v86;
  void *v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;

  v87 = a1;
  v80 = a4;
  v76 = a7;
  v74 = a3;
  v85 = a2;
  v75 = sub_24449C440();
  v73 = *(_QWORD *)(v75 - 8);
  MEMORY[0x24BDAC7A8](v75);
  v72 = (char *)&v69 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_24449C380();
  v78 = *(_QWORD *)(v15 - 8);
  v79 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v82 = (char *)&v69 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_257365290);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v69 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v18);
  v81 = (char *)&v69 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v91 = (uint64_t)&v69 - v23;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_257365098);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v69 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v25);
  v30 = (__SecKey *)((char *)&v69 - v29);
  MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&v69 - v31;
  v33 = sub_24449C170();
  v84 = *(_QWORD *)(v33 - 8);
  v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v84 + 56);
  v34(v32, 1, 1, v33);
  v77 = a8;
  v35 = a8 >> 60;
  if (a6 >> 60 != 15)
  {
    v89 = a5;
    v90 = a6;
    sub_2444648E8(a5, a6);
    sub_24449C158();
    sub_2444649C8((uint64_t)v32, &qword_257365098);
    v34((char *)v30, 0, 1, v33);
    sub_244464A04((uint64_t)v30, (uint64_t)v32, &qword_257365098);
    if (v35 >= 0xF)
    {
      if (qword_2573664A0 != -1)
        swift_once();
      v36 = sub_24449C0E0();
      __swift_project_value_buffer(v36, (uint64_t)qword_2573664A8);
      Logger.PSSO_ERROR(code:description:)(-1005);
      swift_willThrow();
      v67 = (uint64_t)v32;
      goto LABEL_24;
    }
  }
  v37 = sub_24449C3A4();
  v38 = *(_QWORD *)(v37 - 8);
  v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 56);
  v40 = v91;
  v83 = v37;
  v39(v91, 1, 1);
  v86 = v32;
  if (a9)
  {
    v71 = v35;
    v30 = a9;
    v41 = SecKeyCopyExternalRepresentation(v30, 0);
    if (v41)
    {
      v42 = v41;
      v70 = v38;
      v43 = sub_24449C098();
      v45 = v44;

      v89 = v43;
      v90 = v45;
      sub_2444648E8(v43, v45);
      v46 = (uint64_t)v81;
      v47 = v88;
      sub_24449C398();
      if (v47)
      {

        v48 = v43;
LABEL_15:
        sub_24446492C(v48, v45);
        v56 = v91;
LABEL_19:
        sub_2444649C8(v56, &qword_257365290);
        v67 = (uint64_t)v86;
LABEL_24:
        sub_2444649C8(v67, &qword_257365098);
        return v30;
      }
      v88 = 0;
      v49 = v91;
      sub_2444649C8(v91, &qword_257365290);

      v50 = v45;
      v40 = v49;
      sub_24446492C(v43, v50);
      ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v39)(v46, 0, 1, v83);
      sub_244464A04(v46, v49, &qword_257365290);
      v32 = v86;
      v38 = v70;
    }
    else
    {

    }
  }
  v30 = (__SecKey *)objc_msgSend(v87, sel_header);
  sub_244464984((uint64_t)v32, (uint64_t)v27, &qword_257365098);
  (*(uint64_t (**)(char *, uint64_t, uint64_t))(v84 + 48))(v27, 1, v33);
  sub_2444649C8((uint64_t)v27, &qword_257365098);
  sub_244464984(v40, (uint64_t)v20, &qword_257365290);
  (*(void (**)(char *, uint64_t, uint64_t))(v38 + 48))(v20, 1, v83);
  sub_2444649C8((uint64_t)v20, &qword_257365290);
  _s15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_256C9addValues2to3psk4authySo18POMutableJWTHeaderC_S2btF_0(v30);

  v51 = SecKeyCopyExternalRepresentation(v85, 0);
  if (!v51)
  {
    if (qword_2573664A0 != -1)
      swift_once();
    v57 = sub_24449C0E0();
    __swift_project_value_buffer(v57, (uint64_t)qword_2573664A8);
    Logger.PSSO_ERROR(code:description:)(-1005);
    swift_willThrow();
    v56 = v40;
    goto LABEL_19;
  }
  v30 = v51;
  v52 = sub_24449C098();
  v45 = v53;

  v89 = v52;
  v90 = v45;
  sub_2444648E8(v52, v45);
  v54 = v82;
  v55 = v88;
  sub_24449C374();
  if (v55)
  {
    v48 = v52;
    goto LABEL_15;
  }
  v58 = a11;
  v59 = (uint64_t)v86;
  if (v80)
  {
    v60 = v72;
    v88 = a11;
    sub_24449C428();
    v61 = sub_24449C410();
    v63 = v62;
    (*(void (**)(char *, uint64_t))(v73 + 8))(v60, v75);
    v58 = v88;
    v59 = (uint64_t)v86;
  }
  else
  {
    v61 = 0;
    v63 = 0xF000000000000000;
  }
  v64 = (uint64_t)v54;
  v65 = v59;
  v66 = v91;
  v30 = (__SecKey *)POCryptoKitHPKE.encodeAndEncryptJWT<A>(_:publicKey:otherInfo:psk:psk_id:authPrivateKey:auth_kid:)(v87, v64, v61, v63, v59, v76, v77, v91, a10, v58, v83, MEMORY[0x24BDC6958]);
  sub_244464970(v61, v63);
  sub_24446492C(v52, v45);
  (*(void (**)(char *, uint64_t))(v78 + 8))(v82, v79);
  sub_2444649C8(v66, &qword_257365290);
  sub_2444649C8(v65, &qword_257365098);
  return v30;
}

void POCryptoKitHPKE_P256_SHA256_AES_GCM_256.__allocating_init(cipherSuite:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void POCryptoKitHPKE_P256_SHA256_AES_GCM_256.init(cipherSuite:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_244470D60()
{
  uint64_t v0;

  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_256_encryptionAlgorithm));
}

id POCryptoKitHPKE_P256_SHA256_AES_GCM_256.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void _s15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_256C9addValues2to3psk4authySo18POMutableJWTHeaderC_S2btF_0(void *a1)
{
  void *v2;
  id v3;

  v2 = (void *)sub_24449C3F8();
  objc_msgSend(a1, sel_setAlg_, v2);

  sub_24449C404();
  v3 = (id)sub_24449C3F8();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setEnc_, v3);

}

uint64_t _s15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_256C8encValue6forPsk4authSSSb_SbtF_0()
{
  return sub_24449C404();
}

uint64_t sub_244470EB8()
{
  return type metadata accessor for POCryptoKitHPKE_P256_SHA256_AES_GCM_256();
}

uint64_t type metadata accessor for POCryptoKitHPKE_P256_SHA256_AES_GCM_256()
{
  uint64_t result;

  result = qword_2573664C0;
  if (!qword_2573664C0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_244470EFC()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_244470F3C()
{
  uint64_t v0;

  v0 = sub_24449C0E0();
  __swift_allocate_value_buffer(v0, qword_2573666D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2573666D8);
  return sub_24449C0D4();
}

void *variable initialization expression of POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly.encryptionAlgorithm()
{
  return &unk_251520F90;
}

id POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly.encryptionAlgorithm.getter()
{
  uint64_t v0;

  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC15PlatformSSOCore44POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly_encryptionAlgorithm));
}

id POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly.__allocating_init()()
{
  objc_class *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char *v4;
  id v5;
  uint64_t v7;

  v1 = sub_24449C290();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (char *)objc_allocWithZone(v0);
  *(_QWORD *)&v4[OBJC_IVAR____TtC15PlatformSSOCore44POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly_encryptionAlgorithm] = 0x251520F90;
  v5 = &unk_251520F90;
  sub_24449C278();
  return POCryptoKitHPKE.init(cipherSuite:)((uint64_t)v3);
}

id POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  uint64_t v6;

  v1 = sub_24449C290();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC15PlatformSSOCore44POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly_encryptionAlgorithm) = 0x251520F90;
  v4 = &unk_251520F90;
  sub_24449C278();
  return POCryptoKitHPKE.init(cipherSuite:)((uint64_t)v3);
}

uint64_t POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly.decodeAndDecryptJWT(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, void *a9)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  __SecKey *v35;
  CFDataRef v36;
  CFDataRef v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  void *v43;
  void *v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  char *v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  CFDataRef v53;
  CFDataRef v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  char *v77;
  void *v78;
  char *v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;

  v76 = a7;
  v74 = a4;
  v75 = a1;
  v72 = a3;
  v78 = a2;
  v73 = sub_24449C11C();
  v66 = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73);
  v77 = (char *)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_24449C440();
  v70 = *(_QWORD *)(v13 - 8);
  v71 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v69 = (char *)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_24449C188();
  v67 = *(_QWORD *)(v15 - 8);
  v68 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v79 = (char *)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257365380);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v65 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v65 - v21;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_257365098);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v65 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v65 - v27;
  v29 = sub_24449C170();
  v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56);
  v30(v28, 1, 1, v29);
  if (a6 >> 60 == 15
    || (v80 = a5,
        v81 = a6,
        sub_2444648E8(a5, a6),
        sub_24449C158(),
        sub_2444649C8((uint64_t)v28, &qword_257365098),
        v30(v26, 0, 1, v29),
        sub_244464A04((uint64_t)v26, (uint64_t)v28, &qword_257365098),
        a8 >> 60 != 15))
  {
    v65 = a8;
    v32 = sub_24449C104();
    v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56);
    v33(v22, 1, 1, v32);
    if (a9)
    {
      v34 = (uint64_t)v22;
      v35 = a9;
      v36 = SecKeyCopyExternalRepresentation(v35, 0);
      if (v36)
      {
        v37 = v36;
        v38 = sub_24449C098();
        v40 = v39;

        v80 = v38;
        v81 = v40;
        sub_2444648E8(v38, v40);
        v41 = v82;
        sub_24449C0F8();
        v82 = v41;
        if (v41)
        {

          sub_24446492C(v38, v40);
          sub_2444649C8(v34, (uint64_t *)&unk_257365380);
          return sub_2444649C8((uint64_t)v28, &qword_257365098);
        }
        sub_2444649C8(v34, (uint64_t *)&unk_257365380);

        sub_24446492C(v38, v40);
        v33(v20, 0, 1, v32);
        v22 = (char *)v34;
        sub_244464A04((uint64_t)v20, v34, (uint64_t *)&unk_257365380);
      }
      else
      {

      }
    }
    v43 = (void *)objc_opt_self();
    v44 = v78;
    v45 = objc_msgSend(v43, sel_isSEPKey_, v78);
    v46 = v82;
    v47 = (uint64_t)v79;
    if (v45)
    {
      v48 = v44;
      sub_24449C17C();
      if (!v46)
      {
        if (v74)
        {
          v49 = v69;
          sub_24449C428();
          v50 = sub_24449C410();
          v52 = v51;
          (*(void (**)(char *, uint64_t))(v70 + 8))(v49, v71);
        }
        else
        {
          v50 = 0;
          v52 = 0xF000000000000000;
        }
        v64 = v68;
        POCryptoKitHPKE.decodeAndDecryptJWT<A>(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(v75, v47, v50, v52, (uint64_t)v28, v76, v65, (uint64_t)v22, v68, MEMORY[0x24BDC6418]);
        sub_244464970(v50, v52);
        (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v47, v64);
      }
    }
    else
    {
      v53 = SecKeyCopyExternalRepresentation((SecKeyRef)v44, 0);
      if (v53)
      {
        v54 = v53;
        v55 = sub_24449C098();
        v57 = v56;

        v80 = v55;
        v81 = v57;
        sub_2444648E8(v55, v57);
        v58 = (uint64_t)v77;
        sub_24449C110();
        if (v46)
        {
          sub_24446492C(v55, v57);
        }
        else
        {
          if (v74)
          {
            v60 = v69;
            sub_24449C428();
            v61 = sub_24449C410();
            v63 = v62;
            (*(void (**)(char *, uint64_t))(v70 + 8))(v60, v71);
          }
          else
          {
            v61 = 0;
            v63 = 0xF000000000000000;
          }
          POCryptoKitHPKE.decodeAndDecryptJWT<A>(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(v75, v58, v61, v63, (uint64_t)v28, v76, v65, (uint64_t)v22, v73, MEMORY[0x24BDC6210]);
          sub_244464970(v61, v63);
          sub_24446492C(v55, v57);
          (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v58, v73);
        }
      }
      else
      {
        if (qword_2573666D0 != -1)
          swift_once();
        v59 = sub_24449C0E0();
        __swift_project_value_buffer(v59, (uint64_t)qword_2573666D8);
        Logger.PSSO_ERROR(code:description:)(-1005);
        swift_willThrow();
      }
    }
    sub_2444649C8((uint64_t)v22, (uint64_t *)&unk_257365380);
  }
  else
  {
    if (qword_2573666D0 != -1)
      swift_once();
    v31 = sub_24449C0E0();
    __swift_project_value_buffer(v31, (uint64_t)qword_2573666D8);
    Logger.PSSO_ERROR(code:description:)(-1005);
    swift_willThrow();
  }
  return sub_2444649C8((uint64_t)v28, &qword_257365098);
}

__SecKey *POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly.encodeAndEncryptJWT(_:publicKey:otherInfo:psk:psk_id:authPrivateKey:auth_kid:)(void *a1, __SecKey *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, void *a9, uint64_t a10, unint64_t a11)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  __SecKey *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  CFDataRef v41;
  CFDataRef v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  CFDataRef v51;
  uint64_t v52;
  unint64_t v53;
  char *v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  SecKeyRef v85;
  char *v86;
  void *v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;

  v87 = a1;
  v80 = a4;
  v76 = a7;
  v74 = a3;
  v85 = a2;
  v75 = sub_24449C440();
  v73 = *(_QWORD *)(v75 - 8);
  MEMORY[0x24BDAC7A8](v75);
  v72 = (char *)&v69 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_24449C104();
  v78 = *(_QWORD *)(v15 - 8);
  v79 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v82 = (char *)&v69 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257365390);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v69 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v18);
  v81 = (char *)&v69 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v91 = (uint64_t)&v69 - v23;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_257365098);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v69 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v25);
  v30 = (__SecKey *)((char *)&v69 - v29);
  MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&v69 - v31;
  v33 = sub_24449C170();
  v84 = *(_QWORD *)(v33 - 8);
  v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v84 + 56);
  v34(v32, 1, 1, v33);
  v77 = a8;
  v35 = a8 >> 60;
  if (a6 >> 60 != 15)
  {
    v89 = a5;
    v90 = a6;
    sub_2444648E8(a5, a6);
    sub_24449C158();
    sub_2444649C8((uint64_t)v32, &qword_257365098);
    v34((char *)v30, 0, 1, v33);
    sub_244464A04((uint64_t)v30, (uint64_t)v32, &qword_257365098);
    if (v35 >= 0xF)
    {
      if (qword_2573666D0 != -1)
        swift_once();
      v36 = sub_24449C0E0();
      __swift_project_value_buffer(v36, (uint64_t)qword_2573666D8);
      Logger.PSSO_ERROR(code:description:)(-1005);
      swift_willThrow();
      v67 = (uint64_t)v32;
      goto LABEL_24;
    }
  }
  v37 = sub_24449C11C();
  v38 = *(_QWORD *)(v37 - 8);
  v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 56);
  v40 = v91;
  v83 = v37;
  v39(v91, 1, 1);
  v86 = v32;
  if (a9)
  {
    v71 = v35;
    v30 = a9;
    v41 = SecKeyCopyExternalRepresentation(v30, 0);
    if (v41)
    {
      v42 = v41;
      v70 = v38;
      v43 = sub_24449C098();
      v45 = v44;

      v89 = v43;
      v90 = v45;
      sub_2444648E8(v43, v45);
      v46 = (uint64_t)v81;
      v47 = v88;
      sub_24449C110();
      if (v47)
      {

        v48 = v43;
LABEL_15:
        sub_24446492C(v48, v45);
        v56 = v91;
LABEL_19:
        sub_2444649C8(v56, (uint64_t *)&unk_257365390);
        v67 = (uint64_t)v86;
LABEL_24:
        sub_2444649C8(v67, &qword_257365098);
        return v30;
      }
      v88 = 0;
      v49 = v91;
      sub_2444649C8(v91, (uint64_t *)&unk_257365390);

      v50 = v45;
      v40 = v49;
      sub_24446492C(v43, v50);
      ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v39)(v46, 0, 1, v83);
      sub_244464A04(v46, v49, (uint64_t *)&unk_257365390);
      v32 = v86;
      v38 = v70;
    }
    else
    {

    }
  }
  v30 = (__SecKey *)objc_msgSend(v87, sel_header);
  sub_244464984((uint64_t)v32, (uint64_t)v27, &qword_257365098);
  (*(uint64_t (**)(char *, uint64_t, uint64_t))(v84 + 48))(v27, 1, v33);
  sub_2444649C8((uint64_t)v27, &qword_257365098);
  sub_244464984(v40, (uint64_t)v20, (uint64_t *)&unk_257365390);
  (*(void (**)(char *, uint64_t, uint64_t))(v38 + 48))(v20, 1, v83);
  sub_2444649C8((uint64_t)v20, (uint64_t *)&unk_257365390);
  _s15PlatformSSOCore44POCryptoKitHPKE_Curve25519_SHA256_ChachaPolyC9addValues2to3psk4authySo18POMutableJWTHeaderC_S2btF_0(v30);

  v51 = SecKeyCopyExternalRepresentation(v85, 0);
  if (!v51)
  {
    if (qword_2573666D0 != -1)
      swift_once();
    v57 = sub_24449C0E0();
    __swift_project_value_buffer(v57, (uint64_t)qword_2573666D8);
    Logger.PSSO_ERROR(code:description:)(-1005);
    swift_willThrow();
    v56 = v40;
    goto LABEL_19;
  }
  v30 = v51;
  v52 = sub_24449C098();
  v45 = v53;

  v89 = v52;
  v90 = v45;
  sub_2444648E8(v52, v45);
  v54 = v82;
  v55 = v88;
  sub_24449C0F8();
  if (v55)
  {
    v48 = v52;
    goto LABEL_15;
  }
  v58 = a11;
  v59 = (uint64_t)v86;
  if (v80)
  {
    v60 = v72;
    v88 = a11;
    sub_24449C428();
    v61 = sub_24449C410();
    v63 = v62;
    (*(void (**)(char *, uint64_t))(v73 + 8))(v60, v75);
    v58 = v88;
    v59 = (uint64_t)v86;
  }
  else
  {
    v61 = 0;
    v63 = 0xF000000000000000;
  }
  v64 = (uint64_t)v54;
  v65 = v59;
  v66 = v91;
  v30 = (__SecKey *)POCryptoKitHPKE.encodeAndEncryptJWT<A>(_:publicKey:otherInfo:psk:psk_id:authPrivateKey:auth_kid:)(v87, v64, v61, v63, v59, v76, v77, v91, a10, v58, v83, MEMORY[0x24BDC6210]);
  sub_244464970(v61, v63);
  sub_24446492C(v52, v45);
  (*(void (**)(char *, uint64_t))(v78 + 8))(v82, v79);
  sub_2444649C8(v66, (uint64_t *)&unk_257365390);
  sub_2444649C8(v65, &qword_257365098);
  return v30;
}

void POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly.__allocating_init(cipherSuite:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly.init(cipherSuite:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_244472438()
{
  uint64_t v0;

  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC15PlatformSSOCore44POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly_encryptionAlgorithm));
}

uint64_t sub_244472460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t AssociatedTypeWitness;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  void (*v49)(char *, char *, uint64_t);
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;

  v65 = a3;
  v60 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v59 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24449C368();
  v52 = *(_QWORD *)(v6 - 8);
  v53 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v56 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24449C314();
  v57 = *(_QWORD *)(v8 - 8);
  v58 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v66 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = sub_24449C290();
  v10 = *(_QWORD *)(v71 - 8);
  v11 = MEMORY[0x24BDAC7A8](v71);
  v55 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v62 = (char *)&v46 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v46 - v15;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v18 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v19 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v21 = (char *)&v46 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v46 - v22;
  v54 = a1;
  sub_24449C20C();
  sub_24449C278();
  v67 = sub_244472A04(0x74616420656D6F53, 0xE900000000000061);
  v68 = v24;
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v21, v23, AssociatedTypeWitness);
  v61 = v10;
  v25 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v64 = v16;
  v25(v62, v16, v71);
  swift_getAssociatedConformanceWitness();
  v62 = (char *)AssociatedTypeWitness;
  v26 = v63;
  sub_24449C2E4();
  if (v26)
  {
    sub_24446492C(v67, v68);
    (*(void (**)(char *, uint64_t))(v61 + 8))(v64, v71);
    (*(void (**)(char *, char *))(v18 + 8))(v23, v62);
  }
  else
  {
    v49 = v25;
    v27 = v59;
    v28 = v60;
    v50 = a2;
    v51 = v23;
    v63 = v18;
    v29 = sub_24449C2F0();
    v31 = v30;
    v69 = v67;
    v70 = v68;
    v32 = sub_244466024();
    v33 = sub_24449C308();
    v46 = v32;
    v48 = v35;
    v47 = v33;
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v27, v54, v50);
    v49(v55, v64, v71);
    sub_2444648E8(v29, v31);
    v36 = v56;
    sub_24449C344();
    v37 = v29;
    v38 = v31;
    v39 = v47;
    v69 = v47;
    v70 = v48;
    v40 = v36;
    v41 = sub_24449C35C();
    v43 = v42;
    v44 = v57;
    v45 = v58;
    sub_24446492C(v67, v68);
    sub_24446492C(v37, v38);
    sub_24446492C(v41, v43);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v40, v53);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v66, v45);
    (*(void (**)(char *, uint64_t))(v61 + 8))(v64, v71);
    (*(void (**)(char *, char *))(v63 + 8))(v51, v62);
    sub_24446492C(v39, v48);
  }
  return 1;
}

uint64_t sub_244472A04(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  _BYTE *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v14[2];
  uint64_t v15;
  __int128 v16;
  _QWORD v17[7];

  v17[5] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v16 = a1;
  *((_QWORD *)&v16 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573653F0);
  if (!swift_dynamicCast())
  {
    v15 = 0;
    memset(v14, 0, sizeof(v14));
    sub_2444649C8((uint64_t)v14, &qword_2573653F8);
    if ((a2 & 0x1000000000000000) != 0)
      goto LABEL_20;
    if ((a2 & 0x2000000000000000) != 0)
    {
      v17[0] = a1;
      v17[1] = a2 & 0xFFFFFFFFFFFFFFLL;
      v4 = (char *)v17 + (HIBYTE(a2) & 0xF);
      v5 = v17;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        v2 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        v3 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        v2 = sub_24449C56C();
      }
      if (v2)
        v4 = (_BYTE *)(v2 + v3);
      else
        v4 = 0;
      v5 = (_BYTE *)v2;
    }
    v6 = sub_2444735D4(v5, v4);
    v8 = v7;
    if (v7 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(_QWORD *)&v14[0] = v6;
      *((_QWORD *)&v14[0] + 1) = v8;
      return *(_QWORD *)&v14[0];
    }
    if ((a2 & 0x1000000000000000) != 0)
    {
LABEL_20:
      v9 = sub_24449C494();
    }
    else if ((a2 & 0x2000000000000000) != 0)
    {
      v9 = HIBYTE(a2) & 0xF;
    }
    else
    {
      v9 = a1 & 0xFFFFFFFFFFFFLL;
    }
    *(_QWORD *)&v14[0] = sub_244473638(v9);
    *((_QWORD *)&v14[0] + 1) = v10;
    MEMORY[0x24BDAC7A8](*(_QWORD *)&v14[0]);
    sub_244472FD0();
    __asm { BR              X12 }
  }
  sub_244473F3C(v14, (uint64_t)v17);
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  sub_24449C02C();
  swift_bridgeObjectRelease();
  v14[0] = v16;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return *(_QWORD *)&v14[0];
}

id POCurve25519Verify.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id POCurve25519Verify.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id _s15PlatformSSOCore44POCryptoKitHPKE_Curve25519_SHA256_ChachaPolyCfD_0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_244472FD0()
{
  __asm { BR              X11 }
}

_QWORD *sub_244473030@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *(*v3)(_QWORD **__return_ptr, uint64_t *, char *);
  uint64_t v4;
  _QWORD *result;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;

  v8 = v4;
  LOWORD(v9) = a1;
  BYTE2(v9) = BYTE2(a1);
  HIBYTE(v9) = BYTE3(a1);
  v10 = BYTE4(a1);
  v11 = BYTE5(a1);
  v12 = BYTE6(a1);
  result = v3(&v7, &v8, (char *)&v8 + BYTE6(a1));
  if (!v2)
    result = v7;
  v6 = v9 | ((unint64_t)v10 << 32) | ((unint64_t)v11 << 40) | ((unint64_t)v12 << 48);
  *v1 = v8;
  v1[1] = v6;
  return result;
}

_QWORD *sub_2444732C0(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a3)
  {
    result = a1(&v6, a3, a4 - a3);
    if (v4)
      return result;
    return (_QWORD *)v6;
  }
  result = a1(&v6, 0, 0);
  if (!v4)
    return (_QWORD *)v6;
  return result;
}

char *sub_244473324(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v3;
  char *result;
  char *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = (char *)sub_24449BFF0();
  if (!result)
    goto LABEL_12;
  v8 = result;
  result = (char *)sub_24449C014();
  v9 = a1 - (_QWORD)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v12 = sub_24449C008();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3)
    return (char *)v14;
  return result;
}

uint64_t sub_2444733D0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_24449C4C4();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x24950EC60](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_244473448@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  char v3;
  uint64_t v4;

  if (result)
  {
    swift_bridgeObjectRetain();
    result = sub_24449C560();
    if ((v3 & 1) == 0)
    {
      v4 = result;
      result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void _s15PlatformSSOCore44POCryptoKitHPKE_Curve25519_SHA256_ChachaPolyC9addValues2to3psk4authySo18POMutableJWTHeaderC_S2btF_0(void *a1)
{
  void *v2;
  id v3;

  v2 = (void *)sub_24449C3F8();
  objc_msgSend(a1, sel_setAlg_, v2);

  sub_24449C404();
  v3 = (id)sub_24449C3F8();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setEnc_, v3);

}

uint64_t _s15PlatformSSOCore44POCryptoKitHPKE_Curve25519_SHA256_ChachaPolyC8encValue6forPsk4authSSSb_SbtF_0()
{
  return sub_24449C404();
}

_BYTE *sub_2444735D4(_BYTE *result, _BYTE *a2)
{
  uint64_t v2;

  if (result)
  {
    v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (_BYTE *)sub_244466B08(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (_BYTE *)sub_244466BC8((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (_BYTE *)sub_244466C40((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_244473638(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      sub_24449C020();
      swift_allocObject();
      sub_24449BFFC();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_24449C05C();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t sub_2444736D4(uint64_t a1, uint64_t (*a2)(_QWORD), unint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  char *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v36;
  char *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  void (*v50)(char *, char *, uint64_t);
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;

  v60 = a4;
  v68 = a3;
  v69 = a2(0);
  v63 = *(_QWORD *)(v69 - 8);
  MEMORY[0x24BDAC7A8](v69);
  v57 = (char *)&v47 - v5;
  v6 = sub_24449C368();
  v54 = *(_QWORD *)(v6 - 8);
  v55 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v59 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24449C314();
  v9 = *(_QWORD *)(v8 - 8);
  v61 = v8;
  v62 = v9;
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = sub_24449C290();
  v12 = *(_QWORD *)(v72 - 8);
  v13 = MEMORY[0x24BDAC7A8](v72);
  v56 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v47 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v47 - v18;
  v20 = sub_24449C104();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v47 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v47 - v25;
  v58 = a1;
  sub_24449C20C();
  v27 = v72;
  sub_24449C278();
  v67 = sub_244472A04(0x74616420656D6F53, 0xE900000000000061);
  v68 = v28;
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v26, v20);
  v65 = v12;
  v29 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  v29(v17, v19, v27);
  v64 = v11;
  v30 = v66;
  sub_24449C2E4();
  if (v30)
  {
    sub_24446492C(v67, v68);
    (*(void (**)(char *, uint64_t))(v65 + 8))(v19, v27);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v26, v20);
  }
  else
  {
    v50 = v29;
    v31 = v63;
    v66 = v19;
    v51 = v26;
    v52 = v21;
    v53 = v20;
    v32 = sub_24449C2F0();
    v34 = v33;
    v70 = v67;
    v71 = v68;
    sub_244466024();
    v48 = sub_24449C308();
    v49 = v36;
    (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v57, v58, v69);
    v50(v56, v66, v72);
    sub_2444648E8(v32, v34);
    v37 = v59;
    sub_24449C344();
    v38 = v34;
    v70 = v48;
    v71 = v49;
    v39 = sub_24449C35C();
    v40 = v65;
    v41 = v37;
    v42 = v61;
    v43 = v62;
    v44 = v39;
    v46 = v45;
    sub_24446492C(v67, v68);
    sub_24446492C(v32, v38);
    sub_24446492C(v44, v46);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v41, v55);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v64, v42);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v66, v72);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v51, v53);
    sub_24446492C(v48, v49);
  }
  return 1;
}

uint64_t _s15PlatformSSOCore18POCurve25519VerifyC9verifyKeyySbSo03SecF3RefaF_0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  CFDataRef v11;
  CFDataRef v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  char v19;
  _QWORD v20[4];

  v2 = sub_24449C11C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24449C188();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend((id)objc_opt_self(), sel_isSEPKey_, a1))
  {
    v10 = a1;
    sub_24449C17C();
    v19 = sub_2444736D4((uint64_t)v9, (uint64_t (*)(_QWORD))MEMORY[0x24BDC6420], MEMORY[0x24BDC6410], MEMORY[0x24BDC6418]);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    v11 = SecKeyCopyExternalRepresentation((SecKeyRef)a1, 0);
    if (v11)
    {
      v12 = v11;
      v13 = sub_24449C098();
      v15 = v14;

      v20[1] = v13;
      v20[2] = v15;
      sub_2444648E8(v13, v15);
      sub_24449C110();
      v19 = sub_2444736D4((uint64_t)v5, (uint64_t (*)(_QWORD))MEMORY[0x24BDC6220], MEMORY[0x24BDC6208], MEMORY[0x24BDC6210]);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      sub_24446492C(v13, v15);
    }
    else
    {
      if (qword_2573666D0 != -1)
        swift_once();
      v16 = sub_24449C0E0();
      __swift_project_value_buffer(v16, (uint64_t)qword_2573666D8);
      v17 = Logger.PSSO_ERROR(code:description:)(-1005);
      swift_willThrow();

      v19 = 0;
    }
  }
  return v19 & 1;
}

uint64_t sub_244473E3C()
{
  return type metadata accessor for POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly();
}

uint64_t type metadata accessor for POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly()
{
  uint64_t result;

  result = qword_2573666F0;
  if (!qword_2573666F0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_244473E80()
{
  return swift_updateClassMetadata2();
}

uint64_t type metadata accessor for POCurve25519Verify()
{
  return objc_opt_self();
}

_QWORD *sub_244473EE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[2];

  v5 = *(uint64_t **)(v3 + 16);
  v7 = *v5;
  v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  result = sub_2444732C0((_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_244473F54, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_244473F3C(__int128 *a1, uint64_t a2)
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

uint64_t sub_244473F54@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_244473448(a1, a2);
}

uint64_t lib_platform_rng()
{
  uint64_t v0;

  v0 = ccrng();
  REQUIRE_func(v0 != 0, 22, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform_lib.c");
  REQUIRE_func(0, 23, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform_lib.c");
  return v0;
}

uint64_t lib_platform_read_random(uint64_t a1, unsigned int a2)
{
  unsigned int (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  _BOOL8 v6;

  v4 = *(unsigned int (**)(uint64_t, _QWORD, uint64_t))platform_rng();
  v5 = platform_rng();
  v6 = v4(v5, a2, a1) == 0;
  return REQUIRE_func(v6, 31, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform_lib.c");
}

uint64_t rfc3394_wrap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t), uint64_t *a5, unint64_t a6, _QWORD *a7, unint64_t *a8)
{
  uint64_t v14;
  size_t v15;
  uint64_t v16;
  size_t v17;
  uint64_t v18;
  unint64_t v19;
  BOOL v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  unint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v36;
  unint64_t v37;
  _QWORD *v38;
  uint64_t *v39;
  unint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  _OWORD __s[4];
  uint64_t v45;

  v41 = a1;
  v42 = a3;
  v45 = *MEMORY[0x24BDAC8D0];
  memset(__s, 0, sizeof(__s));
  v14 = ccaes_cbc_encrypt_mode();
  MEMORY[0x24BDAC7A8](v14);
  v43 = (char *)&v36 - v15;
  bzero((char *)&v36 - v15, v15);
  MEMORY[0x24BDAC7A8](v16);
  bzero((char *)&v36 - v17, v17);
  v18 = 0xFFFFFFFFLL;
  if (HIDWORD(a6) || (a6 - 40) < 0xFFFFFFE0)
    goto LABEL_30;
  v39 = &v36;
  v40 = a8;
  v38 = a7;
  if (!a4)
  {
    v20 = (a2 & 0xFFFFFFFFFFFFFFF7) == 0x10 || a2 == 32;
    if (!v20 || !a8 || *a8 < a6 + 8)
    {
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      goto LABEL_31;
    }
    v37 = a6 + 8;
    cccbc_init();
    goto LABEL_15;
  }
  if (a8)
  {
    v19 = *v40;
    v37 = a6 + 8;
    if (v19 >= a6 + 8)
    {
LABEL_15:
      v21 = 0;
      v22 = a6 >> 3;
      if (a6 >> 3 <= 1)
        v23 = 1;
      else
        v23 = v22;
      do
      {
        v24 = *a5++;
        *((_QWORD *)&__s[v21++] + 1) = v24;
      }
      while (v23 != v21);
      v25 = 0;
      *(_QWORD *)&__s[0] = v42;
      v26 = 1;
      v41 = v22;
      do
      {
        v42 = v25;
        v27 = 0;
        v28 = (uint64_t *)__s;
        do
        {
          if (a4)
          {
            if ((a4(1, &firebloom_null_iv, v28, v28, 16) & 1) == 0)
              goto LABEL_6;
          }
          else
          {
            cccbc_clear_iv();
            firebloom_cbc_update_f();
          }
          v29 = *v28;
          v28 += 2;
          v30 = v29 ^ bswap64(v26 + v27++);
          *(_QWORD *)&__s[v27 % v22] = v30;
        }
        while (v23 != v27);
        v25 = v42 + 1;
        v26 += v41;
      }
      while (v42 != 5);
      v31 = v38;
      *v38 = *(_QWORD *)&__s[0];
      v32 = v31 + 1;
      v33 = (uint64_t *)__s + 1;
      do
      {
        v34 = *v33;
        v33 += 2;
        *v32++ = v34;
        --v23;
      }
      while (v23);
      v18 = 0;
      *v40 = v37 & 0xFFFFFFF8;
LABEL_30:
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      if (a4)
        return v18;
LABEL_31:
      cc_clear();
      return v18;
    }
  }
LABEL_6:
  memset_s(__s, 0x40uLL, 0, 0x40uLL);
  return 0xFFFFFFFFLL;
}

uint64_t rfc3394_wrap_legacy(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t), uint64_t *a5, unsigned int a6, _QWORD *a7, _DWORD *a8)
{
  uint64_t v9;
  unint64_t v11;

  v11 = *a8;
  v9 = rfc3394_wrap(a1, a2, a3, a4, a5, a6, a7, &v11);
  REQUIRE_func(HIDWORD(v11) == 0, 171, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/aeskeywrap.c");
  *a8 = v11;
  return v9;
}

uint64_t rfc3394_unwrap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, void *, unint64_t *, unint64_t *, uint64_t), _QWORD *a5, unint64_t a6, _QWORD *a7, _QWORD *a8)
{
  uint64_t v14;
  size_t v15;
  uint64_t v16;
  size_t v17;
  uint64_t v18;
  unsigned int v19;
  BOOL v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  unint64_t *v28;
  int v29;
  unsigned int v30;
  BOOL v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t *v40;
  _QWORD *v41;
  unint64_t *v42;
  uint64_t v43;
  unint64_t v44;
  _QWORD *v45;
  char *v46;
  _OWORD __s[4];
  uint64_t v48;

  v45 = a5;
  v43 = a1;
  v48 = *MEMORY[0x24BDAC8D0];
  memset(__s, 0, sizeof(__s));
  v14 = ccaes_cbc_decrypt_mode();
  MEMORY[0x24BDAC7A8](v14);
  v46 = (char *)&v37 - v15;
  bzero((char *)&v37 - v15, v15);
  MEMORY[0x24BDAC7A8](v16);
  bzero((char *)&v37 - v17, v17);
  v18 = 0xFFFFFFFFLL;
  if (HIDWORD(a6))
    goto LABEL_33;
  v39 = a3;
  v19 = a6 >> 3;
  if ((a6 >> 3) - 6 < 0xFFFFFFFC)
    goto LABEL_33;
  v40 = &v37;
  v41 = a8;
  v38 = a7;
  v44 = a6;
  if (!a4)
  {
    v20 = (a2 & 0xFFFFFFFFFFFFFFF7) == 0x10 || a2 == 32;
    if (!v20 || !a8 || *a8 < a6 - 8)
    {
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      goto LABEL_34;
    }
    cccbc_init();
    goto LABEL_15;
  }
  if (a8 && *v41 >= v44 - 8)
  {
LABEL_15:
    *(_QWORD *)&__s[0] = *v45;
    v21 = v19 - 1;
    if (v19 != 1)
    {
      v22 = (_QWORD *)__s + 1;
      v23 = v45 + 1;
      v24 = v19 - 1;
      do
      {
        v25 = *v23++;
        *v22 = v25;
        v22 += 2;
        --v24;
      }
      while (v24);
    }
    v26 = 6 * v19 - 6;
    LODWORD(v43) = 1 - v19;
    v27 = 5;
    v42 = (unint64_t *)&__s[v19 - 2];
    do
    {
      LODWORD(v45) = v27;
      if (v44 >= 0x10)
      {
        v28 = v42;
        v29 = v21;
        v30 = v26;
        do
        {
          *v28 = *(_QWORD *)&__s[v29 % v21] ^ bswap64(v30);
          if (a4)
          {
            if ((a4(0, &firebloom_null_iv, v28, v28, 16) & 1) == 0)
              goto LABEL_6;
          }
          else
          {
            cccbc_clear_iv();
            firebloom_cbc_update_f();
          }
          --v30;
          v28 -= 2;
          v31 = __OFSUB__(v29--, 1);
        }
        while (!((v29 < 0) ^ v31 | (v29 == 0)));
      }
      v27 = (_DWORD)v45 - 1;
      v26 += v43;
    }
    while ((_DWORD)v45);
    if (*(_QWORD *)&__s[0] == v39)
    {
      v32 = v38;
      if ((_DWORD)v21)
      {
        v33 = (uint64_t *)__s + 1;
        v34 = v21;
        do
        {
          v35 = *v33;
          v33 += 2;
          *v32++ = v35;
          --v34;
        }
        while (v34);
      }
      v18 = 0;
      *v41 = (8 * v21);
    }
    else
    {
      v18 = 0xFFFFFFFFLL;
    }
LABEL_33:
    memset_s(__s, 0x40uLL, 0, 0x40uLL);
    if (a4)
      return v18;
LABEL_34:
    cc_clear();
    return v18;
  }
LABEL_6:
  memset_s(__s, 0x40uLL, 0, 0x40uLL);
  return 0xFFFFFFFFLL;
}

uint64_t rfc3394_unwrap_legacy(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(_QWORD, void *, unint64_t *, unint64_t *, uint64_t), _QWORD *a5, unsigned int a6, _QWORD *a7, _DWORD *a8)
{
  uint64_t v9;
  uint64_t v11;

  v11 = *a8;
  v9 = rfc3394_unwrap(a1, a2, a3, a4, a5, a6, a7, &v11);
  REQUIRE_func(HIDWORD(v11) == 0, 261, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/aeskeywrap.c");
  *a8 = v11;
  return v9;
}

uint64_t rfc3394_wrapped_size_legacy(unsigned int a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  int v5;

  v2 = a1 + 15;
  v3 = v2 << 31 >> 31;
  v4 = v3 != v2 || v3 < 0;
  v5 = v4;
  if (!v4)
    *a2 = v3 & 0xFFFFFFF8;
  return v5 ^ 1u;
}

uint64_t rfc3394_wrapped_size(unint64_t a1, unint64_t *a2)
{
  uint64_t v2;
  BOOL v3;
  int v4;

  v2 = a1 >= 0xFFFFFFFFFFFFFFF1;
  v3 = v2 << 63 >> 63 != v2 || v2 << 63 >> 63 == -1;
  v4 = v3;
  if (!v3)
    *a2 = (a1 + 15) & 0xFFFFFFFFFFFFFFF8;
  return v4 ^ 1u;
}

BOOL rfc3394_unwrapped_size_legacy(unsigned int a1, unsigned int *a2)
{
  unsigned int v2;
  _BOOL8 result;

  v2 = a1 - 8;
  result = a1 > 7;
  *a2 = v2;
  return result;
}

BOOL rfc3394_unwrapped_size(unint64_t a1, unint64_t *a2)
{
  unint64_t v2;
  _BOOL8 result;

  v2 = a1 - 8;
  result = a1 > 7;
  *a2 = v2;
  return result;
}

uint64_t aks_fv_new_vek(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  mach_port_t aks_client_connection;
  mach_port_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  size_t v20;
  uint64_t input[2];
  _BYTE __s[4096];
  _QWORD v23[2];

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = v1;
  v23[0] = *MEMORY[0x24BDAC8D0];
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v19 = __s;
  *((_QWORD *)&v19 + 1) = v23;
  v20 = 4096;
  v13 = 3758097090;
  if (v7 && v5)
  {
    aks_client_connection = get_aks_client_connection();
    if (!aks_client_connection)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_new_vek", ":", 179, "", 0, "", "");
      v13 = 3758097084;
      goto LABEL_16;
    }
    v15 = aks_client_connection;
    if (!ccder_blob_encode_body_tl()
      || !der_utils_encode_fv_data(&v19, v9)
      || !der_utils_encode_fv_data(&v19, v11)
      || !der_utils_encode_fv_params(&v19, v12)
      || !ccder_blob_encode_tl())
    {
      goto LABEL_14;
    }
    input[0] = *((_QWORD *)&v19 + 1);
    input[1] = (uint64_t)v23 - *((_QWORD *)&v19 + 1);
    v16 = IOConnectCallMethod(v15, 0x4Au, input, 2u, 0, 0, 0, 0, __s, &v20);
    if ((_DWORD)v16)
    {
      v13 = v16;
      goto LABEL_16;
    }
    *(_QWORD *)&v18 = __s;
    *((_QWORD *)&v18 + 1) = &__s[v20];
    if (!ccder_blob_decode_range() || !der_utils_decode_fv_data(&v18, 0, v5))
      goto LABEL_14;
    if (!v3)
    {
      v13 = 0;
      goto LABEL_16;
    }
    v13 = 0;
    if ((der_utils_decode_fv_key(&v18, 0, v3) & 1) == 0)
LABEL_14:
      v13 = 3758097098;
  }
LABEL_16:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v13;
}

uint64_t get_aks_client_connection()
{
  uint64_t result;

  if (get_aks_client_dispatch_queue_onceToken != -1)
    dispatch_once(&get_aks_client_dispatch_queue_onceToken, &__block_literal_global_168);
  dispatch_sync((dispatch_queue_t)get_aks_client_dispatch_queue_connection_queue, &__block_literal_global_150);
  result = get_aks_client_connection_connection;
  if (!get_aks_client_connection_connection)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return get_aks_client_connection_connection;
  }
  return result;
}

unint64_t _aks_save_file(char *a1, const void *a2, size_t a3)
{
  unint64_t v3;
  int v6;
  int v7;
  ssize_t v8;
  int *v10;
  char *v11;
  int *v12;
  char *v13;

  v3 = (unint64_t)a1;
  if (a1)
  {
    v6 = open_dprotected_np(a1, 1793, 4, 0, 384);
    if (v6 == -1)
    {
      v10 = __error();
      v11 = strerror(*v10);
      syslog(3, "could not create file: %s (%s)\n", (const char *)v3, v11);
      return 0;
    }
    else
    {
      v7 = v6;
      v8 = write(v6, a2, a3);
      v3 = v8 != -1;
      if (v8 == -1)
      {
        v12 = __error();
        v13 = strerror(*v12);
        syslog(3, "failed to write restore bag to disk %s\n", v13);
      }
      close(v7);
    }
  }
  return v3;
}

const char *_aks_load_file(char *a1, _QWORD *a2, size_t *a3)
{
  const char *v3;
  size_t st_size;
  int v7;
  int v8;
  void *v9;
  void *v10;
  int *v12;
  char *v13;
  stat v14;

  v3 = a1;
  memset(&v14, 0, sizeof(v14));
  if (a1)
  {
    if (!stat(a1, &v14))
    {
      st_size = v14.st_size;
      v7 = open(v3, 0);
      if (v7 == -1)
      {
        v12 = __error();
        v13 = strerror(*v12);
        syslog(3, "could not open file: %s (%s)\n", v3, v13);
      }
      else
      {
        v8 = v7;
        v9 = calloc(st_size, 1uLL);
        v3 = (const char *)(v9 != 0);
        if (!v9)
        {
LABEL_7:
          close(v8);
          return v3;
        }
        v10 = v9;
        if (read(v8, v9, st_size) == st_size)
        {
          *a2 = v10;
          *a3 = st_size;
          goto LABEL_7;
        }
        close(v8);
        free(v10);
      }
    }
    return 0;
  }
  return v3;
}

uint64_t aks_delete_xart_leak(unsigned int a1, const void *a2)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x6Cu, input, 1u, a2, 0x10uLL, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_delete_xart_leak", ":", 268, "", 0, "", "");
  return 3758097084;
}

char *_iterate_path(char *result, uint64_t a2, uint64_t a3)
{
  FTS *v5;
  FTSENT *v6;
  FTSENT *v7;
  int fts_info;
  char *v9[3];

  v9[2] = *(char **)MEMORY[0x24BDAC8D0];
  if (result)
  {
    v9[0] = result;
    v9[1] = 0;
    result = (char *)fts_open(v9, 84, 0);
    if (result)
    {
      v5 = (FTS *)result;
      v6 = fts_read((FTS *)result);
      if (v6)
      {
        v7 = v6;
        do
        {
          fts_info = v7->fts_info;
          if (fts_info != 6)
          {
            if (fts_info == 1)
            {
              if (a2)
              {
                if (((*(uint64_t (**)(uint64_t, FTSENT *))(a2 + 16))(a2, v7) & 1) == 0)
                  fts_set(v5, v7, 4);
              }
            }
            else if (a3 && fts_info == 8)
            {
              (*(void (**)(uint64_t, FTSENT *))(a3 + 16))(a3, v7);
            }
          }
          v7 = fts_read(v5);
        }
        while (v7);
      }
      return (char *)fts_close(v5);
    }
  }
  return result;
}

char *aks_dump_path(char *result, int a2)
{
  const char *v3;
  _QWORD v4[4];
  int v5;
  _QWORD v6[4];
  int v7;
  char v8[1024];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v3 = result;
    bzero(v8, 0x400uLL);
    result = realpath_DARWIN_EXTSN(v3, v8);
    if (result)
    {
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 0x40000000;
      v6[2] = __aks_dump_path_block_invoke;
      v6[3] = &__block_descriptor_tmp;
      v7 = a2;
      v4[0] = MEMORY[0x24BDAC760];
      v4[1] = 0x40000000;
      v4[2] = __aks_dump_path_block_invoke_2;
      v4[3] = &__block_descriptor_tmp_126;
      v5 = a2;
      return _iterate_path(v8, (uint64_t)v6, (uint64_t)v4);
    }
  }
  return result;
}

uint64_t __aks_dump_path_block_invoke(uint64_t a1, uint64_t a2)
{
  int path_class;
  int v5;

  path_class = _get_path_class(*(const char **)(a2 + 48));
  v5 = *(_DWORD *)(a1 + 32);
  if (v5 == -1 || path_class == v5)
    printf(" dir: %s %i\n", *(const char **)(a2 + 48), path_class);
  return 1;
}

uint64_t _get_path_class(const char *a1)
{
  int v1;
  int v2;
  uint64_t v3;

  v1 = open_dprotected_np(a1, 0, 0, 1);
  if (v1 == -1)
    return 0xFFFFFFFFLL;
  v2 = v1;
  v3 = fcntl(v1, 63);
  if ((v2 & 0x80000000) == 0)
    close(v2);
  return v3;
}

uint64_t __aks_dump_path_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  int v5;

  result = _get_path_class(*(const char **)(a2 + 48));
  v5 = *(_DWORD *)(a1 + 32);
  if (v5 == -1 || (_DWORD)result == v5)
    return printf("file: %s %i\n", *(const char **)(a2 + 48), result);
  return result;
}

uint64_t aks_fs_supports_enhanced_apfs()
{
  io_registry_entry_t v0;
  io_object_t v1;
  CFTypeRef CFProperty;
  _BOOL4 v3;
  unsigned int v4;
  size_t __len;
  char __big[1024];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v0 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B20], "IODeviceTree:/filesystems");
  if (v0)
  {
    v1 = v0;
    CFProperty = IORegistryEntryCreateCFProperty(v0, CFSTR("e-apfs"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    v3 = CFProperty != 0;
    if (CFProperty)
      CFRelease(CFProperty);
    IOObjectRelease(v1);
  }
  else
  {
    v3 = 0;
  }
  __len = 1023;
  bzero(__big, 0x400uLL);
  if ((_aks_check_apfs_shared_datavolume_bootarg_init & 1) == 0)
  {
    if (!sysctlbyname("kern.bootargs", __big, &__len, 0, 0) && strnstr(__big, "-apfs_shared_datavolume", __len))
      _aks_check_apfs_shared_datavolume_bootarg_value = 1;
    _aks_check_apfs_shared_datavolume_bootarg_init = 1;
  }
  v4 = _aks_check_apfs_shared_datavolume_bootarg_value;
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s ioreg: %d, boot_arg: %d%s\n", "aks", "", "", "", "aks_fs_supports_enhanced_apfs", ":", 437, "", 0, "", v3, _aks_check_apfs_shared_datavolume_bootarg_value, "");
  return v3 | v4;
}

uint64_t aks_fs_status(const char *a1)
{
  char __str[1024];
  char v4[1024];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  bzero(v4, 0x400uLL);
  bzero(__str, 0x400uLL);
  if (realpath_DARWIN_EXTSN(a1, v4))
  {
    snprintf(__str, 0x400uLL, "%s/mobile", v4);
    aks_fs_status_with_map(v4, (uint64_t)&sharedPathMap, 35);
    if ((aks_fs_supports_enhanced_apfs() & 1) == 0)
      aks_fs_status_with_map(__str, (uint64_t)&userPathMap, 72);
  }
  return 0;
}

void aks_fs_status_with_map(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  stat v7;
  char __str[1024];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  bzero(__str, 0x400uLL);
  memset(&v7, 0, sizeof(v7));
  if (a3)
  {
    v6 = a2 + 16;
    do
    {
      snprintf(__str, 0x400uLL, "%s%s", a1, *(const char **)(v6 - 16));
      if (stat(__str, &v7))
      {
        printf("stat failed: %s\n");
      }
      else
      {
        _get_path_class(__str);
        printf("%s: mode=%o, u/g=%i:%i class=%i%s\n");
      }
      v6 += 48;
      --a3;
    }
    while (a3);
  }
}

uint64_t aks_user_fs_status(const char *a1)
{
  char v3[1024];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  bzero(v3, 0x400uLL);
  if (realpath_DARWIN_EXTSN(a1, v3))
    aks_fs_status_with_map(v3, (uint64_t)&userPathMap, 72);
  return 0;
}

const char *aks_show_allowlist()
{
  puts("shared allow list:");
  aks_show_allowlist_with_map("<var>", (uint64_t)&sharedPathMap, 35);
  puts("user allow list:");
  return aks_show_allowlist_with_map("<user>", (uint64_t)&userPathMap, 72);
}

const char *aks_show_allowlist_with_map(const char *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  const char *v4;
  const char **v5;
  const char **v6;
  char v7;

  if (a3)
  {
    v3 = a3;
    v4 = result;
    v5 = (const char **)(a2 + 16);
    v6 = (const char **)(a2 + 16);
    do
    {
      v7 = *(_BYTE *)v6;
      v6 += 6;
      if ((v7 & 1) != 0)
        result = (const char *)printf("%s%s\n", v4, *(v5 - 2));
      v5 = v6;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t aks_fv_new_kek(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  mach_port_t aks_client_connection;
  mach_port_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  size_t v18;
  uint64_t input[3];
  _BYTE __s[4096];
  uint64_t v21;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = v1;
  v21 = *MEMORY[0x24BDAC8D0];
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v17 = __s;
  *((_QWORD *)&v17 + 1) = &v21;
  v18 = 4096;
  v11 = 3758097090;
  if (v5 && v3)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v13 = aks_client_connection;
      if (!ccder_blob_encode_body_tl()
        || !der_utils_encode_fv_data(&v17, v7)
        || !der_utils_encode_fv_params(&v17, v10)
        || !ccder_blob_encode_tl())
      {
        goto LABEL_10;
      }
      input[0] = v9;
      input[1] = *((_QWORD *)&v17 + 1);
      input[2] = (uint64_t)&v21 - *((_QWORD *)&v17 + 1);
      v14 = IOConnectCallMethod(v13, 0x4Cu, input, 3u, 0, 0, 0, 0, __s, &v18);
      if ((_DWORD)v14)
      {
        v11 = v14;
        goto LABEL_12;
      }
      *(_QWORD *)&v16 = __s;
      *((_QWORD *)&v16 + 1) = &__s[v18];
      if (!ccder_blob_decode_range() || (v11 = 0, (der_utils_decode_fv_data(&v16, 0, v3) & 1) == 0))
LABEL_10:
        v11 = 3758097098;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_new_kek", ":", 508, "", 0, "", "");
      v11 = 3758097084;
    }
  }
LABEL_12:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v11;
}

uint64_t aks_fv_new_sibling_vek(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  mach_port_t aks_client_connection;
  mach_port_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  size_t v18;
  uint64_t input[2];
  _BYTE __s[4096];
  uint64_t v21;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = v1;
  v21 = *MEMORY[0x24BDAC8D0];
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v17 = __s;
  *((_QWORD *)&v17 + 1) = &v21;
  v18 = 4096;
  v11 = 3758097090;
  if (v7 && v5)
  {
    aks_client_connection = get_aks_client_connection();
    if (!aks_client_connection)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_new_sibling_vek", ":", 543, "", 0, "", "");
      v11 = 3758097084;
      goto LABEL_15;
    }
    v13 = aks_client_connection;
    if (!ccder_blob_encode_body_tl()
      || !der_utils_encode_fv_data(&v17, v9)
      || !der_utils_encode_fv_params(&v17, v10)
      || !ccder_blob_encode_tl())
    {
      goto LABEL_13;
    }
    input[0] = *((_QWORD *)&v17 + 1);
    input[1] = (uint64_t)&v21 - *((_QWORD *)&v17 + 1);
    v14 = IOConnectCallMethod(v13, 0x63u, input, 2u, 0, 0, 0, 0, __s, &v18);
    if ((_DWORD)v14)
    {
      v11 = v14;
      goto LABEL_15;
    }
    *(_QWORD *)&v16 = __s;
    *((_QWORD *)&v16 + 1) = &__s[v18];
    if (!ccder_blob_decode_range() || !der_utils_decode_fv_data(&v16, 0, v5))
      goto LABEL_13;
    if (!v3)
    {
      v11 = 0;
      goto LABEL_15;
    }
    v11 = 0;
    if ((der_utils_decode_fv_key(&v16, 0, v3) & 1) == 0)
LABEL_13:
      v11 = 3758097098;
  }
LABEL_15:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v11;
}

uint64_t aks_fv_rewrap_kek(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  mach_port_t aks_client_connection;
  mach_port_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  size_t v20;
  uint64_t input[2];
  _BYTE __s[4096];
  _QWORD v23[2];

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = v1;
  v23[0] = *MEMORY[0x24BDAC8D0];
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v19 = __s;
  *((_QWORD *)&v19 + 1) = v23;
  v20 = 4096;
  v13 = 3758097090;
  if (v9 && v7 && v5 && v3)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v15 = aks_client_connection;
      if (!der_utils_encode_fv_data(&v19, v5)
        || !ccder_blob_encode_body_tl()
        || !der_utils_encode_fv_data(&v19, v9)
        || !der_utils_encode_fv_data(&v19, v11)
        || !der_utils_encode_fv_params(&v19, v12)
        || !ccder_blob_encode_tl())
      {
        goto LABEL_14;
      }
      input[0] = *((_QWORD *)&v19 + 1);
      input[1] = (uint64_t)v23 - *((_QWORD *)&v19 + 1);
      v16 = IOConnectCallMethod(v15, 0x4Du, input, 2u, 0, 0, 0, 0, __s, &v20);
      if ((_DWORD)v16)
      {
        v13 = v16;
        goto LABEL_16;
      }
      *(_QWORD *)&v18 = __s;
      *((_QWORD *)&v18 + 1) = &__s[v20];
      if (!ccder_blob_decode_range() || (v13 = 0, (der_utils_decode_fv_data(&v18, 0, v3) & 1) == 0))
LABEL_14:
        v13 = 3758097098;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_rewrap_kek", ":", 582, "", 0, "", "");
      v13 = 3758097084;
    }
  }
LABEL_16:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v13;
}

uint64_t aks_fv_set_protection(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  mach_port_t aks_client_connection;
  mach_port_t v16;
  uint64_t v17;
  uint64_t *v19;
  __int128 v20;
  __int128 v21;
  size_t v22;
  uint64_t input[4];
  _BYTE __s[4096];
  _QWORD v25[2];

  v1 = MEMORY[0x24BDAC7A8](a1);
  v19 = v2;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = v1;
  v25[0] = *MEMORY[0x24BDAC8D0];
  v14 = 3758097098;
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v21 = __s;
  *((_QWORD *)&v21 + 1) = v25;
  v22 = 4096;
  aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_set_protection", ":", 616, "", 0, "", "");
    v14 = 3758097084;
    goto LABEL_14;
  }
  v16 = aks_client_connection;
  if (der_utils_encode_fv_data(&v21, v4)
    && der_utils_encode_fv_data(&v21, v6)
    && der_utils_encode_fv_data(&v21, v8)
    && der_utils_encode_fv_params(&v21, v13)
    && ccder_blob_encode_tl())
  {
    input[0] = v12;
    input[1] = v10;
    input[2] = *((_QWORD *)&v21 + 1);
    input[3] = (uint64_t)v25 - *((_QWORD *)&v21 + 1);
    v17 = IOConnectCallMethod(v16, 0x54u, input, 4u, 0, 0, 0, 0, __s, &v22);
    if ((_DWORD)v17)
    {
      v14 = v17;
      goto LABEL_14;
    }
    *(_QWORD *)&v20 = __s;
    *((_QWORD *)&v20 + 1) = &__s[v22];
    if (!v22)
      goto LABEL_13;
    if (!ccder_blob_decode_range())
      goto LABEL_14;
    if (!v19)
    {
LABEL_13:
      v14 = 0;
      goto LABEL_14;
    }
    v14 = 0;
    if ((der_utils_decode_fv_data(&v20, 0, v19) & 1) == 0)
      v14 = 3758097098;
  }
LABEL_14:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v14;
}

uint64_t aks_fv_unwrap_vek_with_acm(uint64_t a1)
{
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
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  mach_port_t aks_client_connection;
  mach_port_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  size_t v22;
  uint64_t input[3];
  _BYTE __s[4096];
  _QWORD v25[2];

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = v1;
  v25[0] = *MEMORY[0x24BDAC8D0];
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v21 = __s;
  *((_QWORD *)&v21 + 1) = v25;
  v22 = 4096;
  if (!v7)
  {
    v18 = 3758097090;
    goto LABEL_15;
  }
  aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_unwrap_vek_with_acm", ":", 653, "", 0, "", "");
    v18 = 3758097084;
    goto LABEL_15;
  }
  v16 = aks_client_connection;
  if (!der_utils_encode_fv_data(&v21, v5)
    || !der_utils_encode_fv_data(&v21, v7)
    || !der_utils_encode_fv_data(&v21, v9)
    || !der_utils_encode_fv_data(&v21, v11)
    || !der_utils_encode_fv_params(&v21, v14)
    || !ccder_blob_encode_tl())
  {
    goto LABEL_13;
  }
  input[0] = *((_QWORD *)&v21 + 1);
  input[1] = (uint64_t)v25 - *((_QWORD *)&v21 + 1);
  input[2] = v13;
  v17 = IOConnectCallMethod(v16, 0x4Bu, input, 3u, 0, 0, 0, 0, __s, &v22);
  if ((_DWORD)v17)
  {
    v18 = v17;
    goto LABEL_15;
  }
  *(_QWORD *)&v20 = __s;
  *((_QWORD *)&v20 + 1) = &__s[v22];
  if (!ccder_blob_decode_range())
    goto LABEL_13;
  if (!v3)
  {
    v18 = 0;
    goto LABEL_15;
  }
  v18 = 0;
  if ((der_utils_decode_fv_key(&v20, 0, v3) & 1) == 0)
LABEL_13:
    v18 = 3758097098;
LABEL_15:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v18;
}

uint64_t aks_fv_unwrap_vek_with_opts(uint64_t a1)
{
  return aks_fv_unwrap_vek_with_acm(a1);
}

void aks_gather_stats(const char *a1, char a2)
{
  char *v4;
  char *v5;
  uint64_t i;
  char *v7;
  uint64_t k;
  char *v9;
  uint64_t j;
  _QWORD v11[5];
  char v12[1024];
  statfs v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    bzero(&v13, 0x878uLL);
    bzero(v12, 0x400uLL);
    if (realpath_DARWIN_EXTSN(a1, v12))
    {
      v4 = (char *)malloc(0x818uLL);
      memset_s(v4, 0x818uLL, 0, 0x818uLL);
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 0x40000000;
      v11[2] = __aks_gather_stats_block_invoke_2;
      v11[3] = &__block_descriptor_tmp_139;
      v11[4] = v4;
      _iterate_path(v12, (uint64_t)&__block_literal_global_21, (uint64_t)v11);
      if (!statfs(v12, &v13))
      {
        if ((a2 & 1) != 0)
          printf("Free Blocks:%lld blocks of size:%d\n");
        else
          printf("%lld,%d\n");
      }
      v5 = v4 + 340;
      for (i = 1; i != 5; ++i)
      {
        if ((a2 & 1) != 0)
        {
          v9 = &v4[296 * i];
          printf("%s:\n\tNum files:\t%u,\n\tNum hardlinks:\t%u,\n\tNum compressed:\t%u,\n\tTotal Size:\t%lld,\n\tMin File Size:\t%lld,\n\tMax File Size:\t%lld,\n", class_names[i], *(_DWORD *)v9, *((_DWORD *)v9 + 2), *((_DWORD *)v9 + 1), *((_QWORD *)v9 + 2), *((_QWORD *)v9 + 3), *((_QWORD *)v9 + 4));
          printf("\tSize Distribution:");
          printf("%i", *((_DWORD *)v9 + 10));
          for (j = 0; j != 252; j += 4)
          {
            putchar(44);
            printf("%i", *(_DWORD *)&v5[j]);
          }
        }
        else
        {
          v7 = &v4[296 * i];
          printf("%i,%u,%u,%u,%lld,%lld,%lld,", i, *(_DWORD *)v7, *((_DWORD *)v7 + 2), *((_DWORD *)v7 + 1), *((_QWORD *)v7 + 2), *((_QWORD *)v7 + 3), *((_QWORD *)v7 + 4));
          printf("%i", *((_DWORD *)v7 + 10));
          for (k = 0; k != 252; k += 4)
          {
            putchar(44);
            printf("%i", *(_DWORD *)&v5[k]);
          }
        }
        putchar(10);
        v5 += 296;
      }
      free(v4);
    }
  }
}

uint64_t __aks_gather_stats_block_invoke()
{
  return 1;
}

uint64_t __aks_gather_stats_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t *v9;
  int64_t v10;
  uint64_t v11;
  int64_t *v12;
  int64_t v13;
  int64_t v14;
  BOOL v15;
  unint64_t v16;

  result = _get_path_class(*(const char **)(a2 + 48));
  if ((result - 7) >= 0xFFFFFFFA)
  {
    v5 = *(_QWORD *)(a2 + 96);
    v6 = *(_QWORD *)(v5 + 96);
    v7 = *(_QWORD *)(a1 + 32);
    ++*(_DWORD *)(v7 + 296 * result);
    if (*(unsigned __int16 *)(v5 + 6) >= 2u)
      ++*(_DWORD *)(v7 + 296 * result + 8);
    if ((*(_BYTE *)(v5 + 116) & 0x20) != 0)
      ++*(_DWORD *)(v7 + 296 * result + 4);
    v8 = v7 + 296 * result;
    v10 = *(_QWORD *)(v8 + 32);
    v9 = (int64_t *)(v8 + 32);
    *(v9 - 2) += v6;
    if (v6 > v10)
      *v9 = v6;
    v11 = v7 + 296 * result;
    v14 = *(_QWORD *)(v11 + 24);
    v12 = (int64_t *)(v11 + 24);
    v13 = v14;
    if (v14)
      v15 = v6 < v13;
    else
      v15 = 1;
    if (v15)
      *v12 = v6;
    if (v6)
      v16 = v7 + 296 * result + 4 * (63 - __clz(v6));
    else
      v16 = v7 + 296 * result;
    ++*(_DWORD *)(v16 + 40);
  }
  return result;
}

uint64_t aks_kext_set_options(unsigned int a1, uint64_t a2)
{
  mach_port_t aks_client_connection;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = 1;
  input[1] = a1;
  input[2] = a2;
  output = 0;
  outputCnt = 1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x56u, input, 3u, 0, 0, &output, &outputCnt, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_kext_set_options", ":", 820, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_kext_get_options(unsigned int a1, uint64_t *a2)
{
  uint64_t v2;
  mach_port_t aks_client_connection;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  v2 = 3758097084;
  if (!a2)
    return 3758097090;
  input[0] = 0;
  input[1] = a1;
  input[2] = 0;
  output = 0;
  outputCnt = 1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v2 = IOConnectCallMethod(aks_client_connection, 0x56u, input, 3u, 0, 0, &output, &outputCnt, 0, 0);
    if (!(_DWORD)v2)
      *a2 = output;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_kext_get_options", ":", 841, "", 0, "", "");
  }
  return v2;
}

uint64_t aks_internal_state()
{
  mach_port_t aks_client_connection;

  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x10u, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_internal_state", ":", 857, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_run_internal_test(unsigned int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x86u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_run_internal_test", ":", 871, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_stash_escrow(uint64_t a1)
{
  int v1;
  _DWORD *v2;
  _DWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  int v6;
  int v7;
  const void *v8;
  const void *v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  mach_port_t aks_client_connection;
  uint64_t v18;
  void *v19;
  size_t __count;
  uint64_t input[4];
  _BYTE __src[32768];
  uint64_t v24;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = v1;
  v24 = *MEMORY[0x24BDAC8D0];
  bzero(__src, 0x8000uLL);
  __count = 0x8000;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = v16;
    input[1] = v15;
    input[2] = v13;
    input[3] = v11;
    if (!v15 || (v18 = 3758097090, v5) && v3)
    {
      v18 = IOConnectCallMethod(aks_client_connection, 0x36u, input, 4u, v9, v7, 0, 0, __src, &__count);
      if (!(_DWORD)v18 && v15)
      {
        v19 = calloc(__count, 1uLL);
        *v5 = v19;
        if (v19)
        {
          memcpy(v19, __src, __count);
          v18 = 0;
          *v3 = __count;
        }
        else
        {
          v18 = 3758097085;
        }
      }
    }
  }
  else
  {
    v18 = 3758097084;
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_stash_escrow", ":", 890, "", 0, "", "");
  }
  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  return v18;
}

void __get_aks_client_connection_block_invoke()
{
  if (!get_aks_client_connection_connection)
    get_aks_client_connection_connection = _copy_aks_client_connection("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
}

uint64_t get_akstest_client_connection()
{
  uint64_t result;

  if (get_aks_client_dispatch_queue_onceToken != -1)
    dispatch_once(&get_aks_client_dispatch_queue_onceToken, &__block_literal_global_168);
  dispatch_sync((dispatch_queue_t)get_aks_client_dispatch_queue_connection_queue, &__block_literal_global_154);
  result = get_akstest_client_connection_connection;
  if (!get_akstest_client_connection_connection)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStoreTest");
    return get_akstest_client_connection_connection;
  }
  return result;
}

void __get_akstest_client_connection_block_invoke()
{
  if (!get_akstest_client_connection_connection)
    get_akstest_client_connection_connection = _copy_aks_client_connection("IOService:/IOResources/AppleKeyStoreTest", "AppleKeyStoreTest");
}

uint64_t akstest_new_key(mach_port_t a1, const void *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, _DWORD *a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  size_t v19;
  uint32_t outputCnt;
  unsigned int outputStruct[256];
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a4;
  input[1] = a3;
  output = 0;
  outputCnt = 1;
  bzero(outputStruct, 0x400uLL);
  v19 = 1024;
  v11 = IOConnectCallMethod(a1, 0xFu, input, 2u, a2, 0x10uLL, &output, &outputCnt, outputStruct, &v19);
  if ((_DWORD)v11)
    return v11;
  v17 = 3758097084;
  if (outputCnt == 1)
  {
    *a7 = output;
    if (aks_unpack_data(outputStruct, v19, 3u, v12, v13, v14, v15, v16, a5))
      return 3758097084;
    else
      return 0;
  }
  return v17;
}

uint64_t akstest_new_ekwk(mach_port_t a1, const void *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, _DWORD *a7, uint64_t a8, uint64_t a9, _DWORD *a10, uint64_t a11, uint64_t a12, _DWORD *a13)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  size_t v26;
  uint32_t outputCnt;
  unsigned int outputStruct[256];
  uint64_t output;
  uint64_t v30;
  uint64_t v31;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a4;
  input[1] = a3;
  output = 0;
  v30 = 0;
  v31 = 0;
  outputCnt = 3;
  bzero(outputStruct, 0x400uLL);
  v26 = 1024;
  v17 = IOConnectCallMethod(a1, 0x13u, input, 2u, a2, 0x10uLL, &output, &outputCnt, outputStruct, &v26);
  if ((_DWORD)v17)
    return v17;
  v23 = 3758097084;
  if (outputCnt == 3)
  {
    v24 = v30;
    *a7 = output;
    *a10 = v24;
    *a13 = v31;
    if (aks_unpack_data(outputStruct, v26, 5u, v18, v19, v20, v21, v22, a5))
      return 3758097084;
    else
      return 0;
  }
  return v23;
}

uint64_t akstest_new_ek(mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, size_t *a8)
{
  uint64_t v11;
  unsigned int inputStructCnt[3];
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a3;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 2, a4, a5, a6, (uint64_t)a7, (uint64_t)a8, a2);
  v11 = IOConnectCallMethod(a1, 0x14u, input, 1u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, a7, a8);
  free(*(void **)&inputStructCnt[1]);
  return v11;
}

uint64_t akstest_rewrap_ek(mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9, uint64_t a10, uint64_t a11, unsigned int a12, void *outputStruct, size_t *a14, _DWORD *a15)
{
  uint64_t v16;
  uint64_t v17;
  uint32_t outputCnt;
  unsigned int inputStructCnt[3];
  uint64_t output;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  input[0] = a3;
  input[1] = a6;
  input[2] = a9;
  input[3] = a12;
  output = 0;
  outputCnt = 1;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 4, a4, a5, a6, a7, a8, a2);
  v16 = IOConnectCallMethod(a1, 0x15u, input, 4u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], &output, &outputCnt, outputStruct, a14);
  if ((_DWORD)v16)
  {
    v17 = v16;
  }
  else if (outputCnt == 1)
  {
    v17 = 0;
    *a15 = output;
  }
  else
  {
    v17 = 3758097084;
  }
  free(*(void **)&inputStructCnt[1]);
  return v17;
}

uint64_t akstest_unwrap_key(mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7)
{
  uint64_t v10;
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
  size_t outputStructCnt;
  unsigned int inputStructCnt[3];
  unsigned int outputStruct[256];
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a3;
  input[1] = a6;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(outputStruct, 0x400uLL);
  outputStructCnt = 1024;
  aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 2, v10, v11, v12, v13, v14, a2);
  v15 = IOConnectCallMethod(a1, 0x10u, input, 2u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, outputStruct, &outputStructCnt);
  if ((_DWORD)v15)
  {
    v21 = v15;
  }
  else if (aks_unpack_data(outputStruct, outputStructCnt, 2u, v16, v17, v18, v19, v20, a7))
  {
    v21 = 3758097084;
  }
  else
  {
    v21 = 0;
  }
  free(*(void **)&inputStructCnt[1]);
  return v21;
}

uint64_t akstest_unwrap_ek(mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, unsigned int a9, uint64_t a10)
{
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
  uint64_t v22;
  uint64_t v23;
  size_t v25;
  unsigned int inputStructCnt[3];
  unsigned int outputStruct[256];
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a3;
  input[1] = a6;
  input[2] = a9;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(outputStruct, 0x400uLL);
  v25 = 1024;
  aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 3, v12, v13, v14, v15, v16, a2);
  v17 = IOConnectCallMethod(a1, 0x17u, input, 3u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, outputStruct, &v25);
  if ((_DWORD)v17)
  {
    v23 = v17;
  }
  else if (aks_unpack_data(outputStruct, v25, 2u, v18, v19, v20, v21, v22, a10))
  {
    v23 = 3758097084;
  }
  else
  {
    v23 = 0;
  }
  free(*(void **)&inputStructCnt[1]);
  return v23;
}

uint64_t akstest_check_class(mach_port_t a1, void *inputStruct, unsigned int a3)
{
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a3;
  return IOConnectCallMethod(a1, 0x11u, input, 1u, inputStruct, 0x10uLL, 0, 0, 0, 0);
}

uint64_t akstest_last_user(mach_port_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  unsigned int inputStructCnt[3];
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 1, a4, a5, a6, a7, a8, a3);
  v9 = IOConnectCallMethod(a1, 0x12u, input, 1u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, 0, 0);
  free(*(void **)&inputStructCnt[1]);
  return v9;
}

uint64_t aks_get_internal_info_for_key(uint64_t a1)
{
  int v1;
  size_t *v2;
  size_t *v3;
  _QWORD *v4;
  _QWORD *v5;
  const void *v6;
  const void *v7;
  mach_port_t aks_client_connection;
  size_t v9;
  uint64_t v10;
  size_t v11;
  void *v12;
  uint64_t v13;
  size_t __count;
  _BYTE __src[32768];
  uint64_t input[2];

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = v1;
  bzero(__src, 0x8000uLL);
  __count = 0x8000;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (v7)
      v9 = 18;
    else
      v9 = 0;
    v10 = IOConnectCallMethod(aks_client_connection, 0x5Du, input, 1u, v7, v9, 0, 0, __src, &__count);
    v11 = __count;
    if ((_DWORD)v10)
    {
      v13 = v10;
    }
    else if (__count - 32769 < 0xFFFFFFFFFFFF8000)
    {
      v13 = 3758097090;
    }
    else
    {
      v12 = calloc(__count, 1uLL);
      *v5 = v12;
      v11 = __count;
      if (v12)
      {
        *v3 = __count;
        memcpy(v12, __src, v11);
        v13 = 0;
        v11 = __count;
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
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_internal_info_for_key", ":", 1246, "", 0, "", "");
    v11 = 0x8000;
  }
  memset_s(__src, v11, 0, v11);
  return v13;
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
  v3 = *MEMORY[0x24BDD8B20];
  v4 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B20], path);
  v5 = (task_port_t *)MEMORY[0x24BDAEC58];
  if (!v4 || (v6 = v4, v7 = IOServiceOpen(v4, *MEMORY[0x24BDAEC58], 0, &connect), IOObjectRelease(v6), v7))
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

uint64_t sizeof_backup_bag()
{
  ccder_sizeof_implicit_uint64();
  ccder_sizeof_raw_octet_string();
  ccder_sizeof_raw_octet_string();
  ccder_sizeof_implicit_uint64();
  return ccder_sizeof();
}

uint64_t encode_backup_bag(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t result;
  uint64_t v6;

  v6 = a2 + a3;
  if (!ccder_blob_encode_implicit_uint64()
    || !ccder_blob_encode_body_tl()
    || !ccder_blob_encode_body_tl()
    || !ccder_blob_encode_body_tl()
    || !ccder_blob_encode_implicit_uint64())
  {
    return 4294967273;
  }
  v3 = ccder_blob_encode_tl();
  result = 4294967273;
  if (v3)
  {
    if (a2 == v6)
      return 0;
    else
      return 4294967273;
  }
  return result;
}

uint64_t decode_backup_bag(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  int v4;
  uint64_t result;
  __int128 v6;

  *(_QWORD *)&v6 = a1;
  *((_QWORD *)&v6 + 1) = a1 + a2;
  if (!ccder_blob_decode_range()
    || !der_utils_decode_implicit_uint64(&v6, 0x8000000000000000, a3)
    || !der_utils_decode_implicit_raw_octet_string_copy(&v6, 0x8000000000000001, (uint64_t)(a3 + 1), 16)
    || !der_utils_decode_implicit_raw_octet_string_copy(&v6, 0x8000000000000002, (uint64_t)(a3 + 3), 40)
    || !der_utils_decode_implicit_raw_octet_string_copy(&v6, 0x8000000000000003, (uint64_t)(a3 + 8), 16))
  {
    return 4294967277;
  }
  v4 = der_utils_decode_implicit_uint64(&v6, 0x8000000000000004, a3 + 10);
  result = 4294967277;
  if (v4)
  {
    if ((_QWORD)v6 == *((_QWORD *)&v6 + 1))
      return 0;
    else
      return 4294967277;
  }
  return result;
}

uint64_t wrap_backup_bag(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v12;
  _OWORD __s[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  memset(__s, 0, sizeof(__s));
  v12 = 40;
  *(_QWORD *)a4 = 0;
  uuid_copy((unsigned __int8 *)(a4 + 8), (const unsigned __int8 *)(a1 + 32));
  *(_QWORD *)(a4 + 80) = 1;
  platform_read_random(a4 + 64, 0x10u);
  v8 = ccsha256_di();
  if (firebloom_ccpbkdf2_hmac(v8, a3, a2, 16, a4 + 64, *(_QWORD *)(a4 + 80), 32, __s))
  {
    v10 = 4294967286;
  }
  else
  {
    v9 = rfc3394_wrap_legacy((uint64_t)__s, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, (uint64_t *)a1, 0x20u, (_QWORD *)(a4 + 24), &v12);
    if ((_DWORD)v9)
    {
      v10 = v9;
    }
    else if (v12 == 40)
    {
      v10 = 0;
    }
    else
    {
      v10 = 4294967286;
    }
  }
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  return v10;
}

uint64_t unwrap_backup_bag(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v12;
  _OWORD __s[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  memset(__s, 0, sizeof(__s));
  v12 = 32;
  if (*(_QWORD *)a1)
  {
    v10 = 4294967284;
  }
  else
  {
    v8 = ccsha256_di();
    if (firebloom_ccpbkdf2_hmac(v8, a3, a2, 16, a1 + 64, *(_QWORD *)(a1 + 80), 32, __s))
      goto LABEL_9;
    v9 = rfc3394_unwrap_legacy((uint64_t)__s, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, (_QWORD *)(a1 + 24), 0x28u, (_QWORD *)a4, &v12);
    if ((_DWORD)v9)
    {
      v10 = v9;
      goto LABEL_8;
    }
    if (v12 != 32)
    {
LABEL_9:
      v10 = 4294967286;
    }
    else
    {
      cccurve25519_make_pub();
      if (uuid_compare((const unsigned __int8 *)(a1 + 8), (const unsigned __int8 *)(a4 + 32)))
        v10 = 4294967272;
      else
        v10 = 0;
    }
  }
LABEL_8:
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  return v10;
}

uint64_t aks_stash_create_for_bag_and_kek(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  mach_port_t aks_client_connection;
  mach_port_t v15;
  __int128 v17;
  uint64_t input[7];
  _BYTE v19[4096];
  uint64_t v20;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = v1;
  v20 = *MEMORY[0x24BDAC8D0];
  v13 = 3758097098;
  bzero(v19, 0x1000uLL);
  *(_QWORD *)&v17 = v19;
  *((_QWORD *)&v17 + 1) = &v20;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v15 = aks_client_connection;
    if (der_utils_encode_fv_data(&v17, v3) && ccder_blob_encode_tl())
    {
      input[0] = v12;
      input[1] = v11;
      input[2] = v7;
      input[3] = v5;
      input[4] = v9;
      input[5] = *((_QWORD *)&v17 + 1);
      input[6] = (uint64_t)&v20 - *((_QWORD *)&v17 + 1);
      return IOConnectCallMethod(v15, 0x21u, input, 7u, 0, 0, 0, 0, 0, 0);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_stash_create_for_bag_and_kek", ":", 50, "", 0, "", "");
    return 3758097084;
  }
  return v13;
}

uint64_t aks_stash_create(uint64_t a1)
{
  return aks_stash_create_for_bag_and_kek(a1);
}

uint64_t aks_stash_load(int a1)
{
  return _aks_stash_load(a1, 0, 0);
}

uint64_t _aks_stash_load(int a1, unsigned int a2, BOOL *a3)
{
  mach_port_t aks_client_connection;
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    input[1] = a2;
    output = 0;
    outputCnt = 1;
    result = IOConnectCallMethod(aks_client_connection, 0x22u, input, 2u, 0, 0, &output, &outputCnt, 0, 0);
    if (!(_DWORD)result)
    {
      result = 0;
      if (a3)
        *a3 = output != 0;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_aks_stash_load", ":", 77, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t aks_stash_verify(int a1, _BYTE *a2)
{
  uint64_t result;
  BOOL v4;

  v4 = 0;
  if (!a2)
    return _aks_stash_load(a1, 1u, &v4);
  *a2 = 0;
  result = _aks_stash_load(a1, 1u, &v4);
  if (!(_DWORD)result)
    *a2 = v4;
  return result;
}

uint64_t aks_stash_destroy()
{
  mach_port_t aks_client_connection;

  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x25u, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_stash_destroy", ":", 125, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_stash_commit(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x24u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_stash_commit", ":", 138, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_stash_enable(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x33u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_stash_enable", ":", 154, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_stash_persist(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x35u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_stash_persist", ":", 170, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_prederived_free(void **a1)
{
  if (!a1)
    return 0xFFFFFFFFLL;
  if (*(_DWORD *)a1 != 1634431856)
    return 0xFFFFFFFFLL;
  free(a1[1]);
  free(a1);
  return 0;
}

uint64_t aks_prederived_create(int a1, uint64_t a2, unint64_t a3, int a4, void ***a5)
{
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void **v14;

  v14 = 0;
  if (!a2 && a3)
    return 0xFFFFFFFFLL;
  if (_aks_prederived_create_ctx(a4, &v14) || (v9 = calloc(0x20uLL, 1uLL)) == 0)
  {
    v12 = 0xFFFFFFFFLL;
  }
  else
  {
    v10 = v9;
    v11 = _aks_prederive_passcode(v14, a2, a3, (uint64_t)v9);
    v12 = 0xFFFFFFFFLL;
    if (a3 <= 0x7FFFFFFE
      && !v11
      && !_set_prederived_configuration(a1, a2, a3, (uint64_t)v10, (uint64_t)v14))
    {
      v12 = 0;
      if (a5)
      {
        *a5 = v14;
        v14 = 0;
      }
    }
    memset_s(v10, 0x20uLL, 0, 0x20uLL);
    free(v10);
  }
  if (v14)
    aks_prederived_free(v14);
  return v12;
}

uint64_t _aks_prederived_create_ctx(int a1, _QWORD *a2)
{
  uint64_t result;
  _DWORD *v6;
  _DWORD *v7;
  void *v8;
  int v9;
  void *v10;

  if ((a1 - 1) > 2 || a2 == 0)
    return 0xFFFFFFFFLL;
  v6 = calloc(0x20uLL, 1uLL);
  if (!v6)
    return 0xFFFFFFFFLL;
  v7 = v6;
  *((_QWORD *)v6 + 2) = 20;
  v8 = calloc(0x14uLL, 1uLL);
  *((_QWORD *)v7 + 1) = v8;
  if (!v8)
  {
LABEL_19:
    free(v7);
    return 0xFFFFFFFFLL;
  }
  *v7 = 1634431856;
  v7[6] = a1;
  result = CCRandomCopyBytes();
  if ((_DWORD)result)
  {
    v10 = (void *)*((_QWORD *)v7 + 1);
    if (v10)
      free(v10);
    goto LABEL_19;
  }
  if (a1 == 3)
    v9 = 2000;
  else
    v9 = 10000000;
  if (a1 == 2)
    v9 = 1000;
  v7[1] = v9;
  *a2 = v7;
  return result;
}

uint64_t _aks_prederive_passcode(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  if (!a1)
    return 0xFFFFFFFFLL;
  if (*a1 != 1634431856 || !a2 && a3)
    return 0xFFFFFFFFLL;
  result = 0xFFFFFFFFLL;
  if (a4 && (a1[6] - 4) >= 0xFFFFFFFD)
  {
    ccsha256_di();
    if (ccpbkdf2_hmac())
      return 0xFFFFFFFFLL;
    else
      return 0;
  }
  return result;
}

uint64_t _set_prederived_configuration(int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  mach_port_t aks_client_connection;
  mach_port_t v12;
  void *v14;
  rsize_t __n;
  void *__s;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  __n = 0;
  __s = 0;
  v10 = 3758097090;
  v14 = 0;
  if ((a2 || !a3) && a4 && a5)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v12 = aks_client_connection;
      if (!encode_list_add_data(&v14, (uint64_t)der_key_config_prederived_salt, *(_QWORD *)(a5 + 8))
        && !encode_list_add_data(&v14, (uint64_t)der_key_config_prederived_passcode, a4)
        && !encode_list_add_number(&v14, (uint64_t)der_key_config_prederived_iterations, *(unsigned int *)(a5 + 4))&& !encode_list_add_number(&v14, (uint64_t)der_key_config_prederived_type, *(unsigned int *)(a5 + 24))&& (a3 < 1 || !encode_list_add_data(&v14, (uint64_t)der_key_passcode, a2))&& !encode_list_is_empty(&v14)&& !encode_list_dict(&v14, &__s, &__n))
      {
        input[0] = a1;
        input[1] = (uint64_t)__s;
        input[2] = __n;
        v10 = IOConnectCallMethod(v12, 0x1Eu, input, 3u, 0, 0, 0, 0, 0, 0);
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_set_prederived_configuration", ":", 218, "", 0, "", "");
      v10 = 3758097084;
    }
  }
  encode_list_free(&v14);
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  return v10;
}

uint64_t aks_prederived_is_enabled(uint64_t a1)
{
  int v1;
  uint64_t *v2;
  uint64_t *v3;
  int v4;
  uint64_t result;
  uint64_t v6;
  mach_port_t aks_client_connection;
  mach_port_t v8;
  CFMutableDictionaryRef Mutable;
  uint64_t v10;
  const void *v11;
  void *v12;
  int v13;
  size_t v14[2];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  uint64_t input;
  _BYTE outputStruct[32768];
  uint64_t v25;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v25 = *MEMORY[0x24BDAC8D0];
  if (!v2)
    return 0;
  v3 = v2;
  v4 = v1;
  result = (uint64_t)calloc(0x20uLL, 1uLL);
  if (!result)
    return result;
  v6 = result;
  *(_DWORD *)result = 1634431856;
  aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_get_prederived_configuration", ":", 384, "", 0, "", "");
LABEL_16:
    aks_prederived_free((void **)v6);
    return 0;
  }
  v8 = aks_client_connection;
  bzero(outputStruct, 0x8000uLL);
  v14[0] = 0x8000;
  input = v4;
  if (IOConnectCallMethod(v8, 0x1Fu, &input, 1u, 0, 0, 0, 0, outputStruct, v14) || v14[0] > 0x8000)
    goto LABEL_16;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v16 = 0u;
  v18 = 0u;
  v19 = 0;
  v15 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14[1] = (size_t)der_key_config_prederived_salt;
  v17 = (unint64_t)der_key_config_prederived_iterations;
  v20 = der_key_config_prederived_type;
  der_dict_iterate();
  v10 = ccder_decode_tl();
  if (v10)
  {
    v11 = (const void *)v10;
    v12 = calloc(*(_QWORD *)(v6 + 16), 1uLL);
    *(_QWORD *)(v6 + 8) = v12;
    if (!v12)
    {
      v13 = 0;
      if (!Mutable)
        goto LABEL_11;
      goto LABEL_10;
    }
    memcpy(v12, v11, *(_QWORD *)(v6 + 16));
    *(_DWORD *)(v6 + 4) = der_get_number();
    *(_DWORD *)(v6 + 24) = der_get_number();
  }
  v13 = 1;
  if (Mutable)
LABEL_10:
    CFRelease(Mutable);
LABEL_11:
  if (!v13 || !*(_QWORD *)(v6 + 16))
    goto LABEL_16;
  *v3 = v6;
  return 1;
}

uint64_t aks_prederived_unlock_keybag(int a1, uint64_t a2, int a3, _DWORD *a4)
{
  BOOL v4;
  BOOL v5;
  uint64_t v7;
  _OWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  memset(v9, 0, sizeof(v9));
  if (a3)
    v4 = a2 == 0;
  else
    v4 = 0;
  v5 = v4 || a4 == 0;
  if (v5 || *a4 != 1634431856 || _aks_prederive_passcode(a4, a2, a3, (uint64_t)v9))
    v7 = 0xFFFFFFFFLL;
  else
    v7 = aks_unlock_bag(a1, (uint64_t)v9, 32);
  memset_s(v9, 0x20uLL, 0, 0x20uLL);
  return v7;
}

uint64_t aks_unlock_bag(int a1, uint64_t a2, int a3)
{
  mach_port_t aks_client_connection;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    input[1] = a2;
    input[2] = a3;
    return IOConnectCallMethod(aks_client_connection, 0xCu, input, 3u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unlock_bag", ":", 807, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_prederived_change_secret(int a1, uint64_t a2, int a3, uint64_t a4, int a5, void ***a6)
{
  void **v7;
  int v11;
  void **v12;
  int v13;
  uint64_t v14;
  void **v16;
  _OWORD v17[2];
  _OWORD __s[2];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  memset(__s, 0, sizeof(__s));
  memset(v17, 0, sizeof(v17));
  v16 = 0;
  if (!a6)
    goto LABEL_17;
  v7 = *a6;
  if (!*a6 || *(_DWORD *)v7 != 1634431856 || !a2 && a3)
    goto LABEL_17;
  if (!a4 && a5 || _aks_prederive_passcode(*a6, a2, a3, (uint64_t)__s))
    goto LABEL_17;
  v11 = _aks_prederived_create_ctx(*((_DWORD *)v7 + 6), &v16);
  v12 = v16;
  if (v11 || (v13 = _aks_prederive_passcode(v16, a4, a5, (uint64_t)v17), v12 = v16, v13))
  {
LABEL_15:
    if (v12)
      aks_prederived_free(v12);
LABEL_17:
    v14 = 0xFFFFFFFFLL;
    goto LABEL_13;
  }
  if (_set_prederived_configuration(a1, (uint64_t)__s, 32, (uint64_t)v17, (uint64_t)v16))
  {
    v12 = v16;
    goto LABEL_15;
  }
  aks_prederived_free(v7);
  v14 = 0;
  *a6 = v16;
LABEL_13:
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  memset_s(v17, 0x20uLL, 0, 0x20uLL);
  return v14;
}

uint64_t aks_create_bag(uint64_t a1, int a2, unsigned int a3, _DWORD *a4)
{
  return _create_bag(a1, a2, 0, 0, a3, -1, a4);
}

uint64_t _create_bag(uint64_t a1, int a2, uint64_t a3, int a4, unsigned int a5, int a6, _DWORD *a7)
{
  uint64_t v14;
  mach_port_t aks_client_connection;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[7];

  input[6] = *MEMORY[0x24BDAC8D0];
  v14 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a7)
    {
      input[0] = a5;
      input[1] = a6;
      input[2] = a1;
      input[3] = a2;
      input[4] = a3;
      input[5] = a4;
      output = 0;
      outputCnt = 1;
      v14 = IOConnectCallMethod(aks_client_connection, 2u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
      if (!(_DWORD)v14)
        *a7 = output;
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_create_bag", ":", 187, "", 0, "", "");
  }
  return v14;
}

uint64_t aks_create_escrow_bag(uint64_t a1, int a2, int a3, _DWORD *a4)
{
  return _create_bag(a1, a2, 0, 0, 2u, a3, a4);
}

uint64_t aks_create_escrow_bag_with_auth(uint64_t a1, int a2, uint64_t a3, int a4, int a5, _DWORD *a6)
{
  return _create_bag(a3, a4, a1, a2, 2u, a5, a6);
}

uint64_t aks_create_sync_bag(uint64_t a1, int a2, int a3, _DWORD *a4)
{
  return _create_bag(a1, a2, 0, 0, 0x8000002u, a3, a4);
}

uint64_t aks_create_sync_bag_with_auth(uint64_t a1, int a2, uint64_t a3, int a4, int a5, _DWORD *a6)
{
  return _create_bag(a3, a4, a1, a2, 0x8000002u, a5, a6);
}

uint64_t aks_invalidate_sync_bags()
{
  mach_port_t aks_client_connection;

  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x42u, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_invalidate_sync_bags", ":", 544, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_unlock_with_sync_bag(const void *a1, int a2, uint64_t a3, int a4, int a5)
{
  uint64_t v10;
  mach_port_t aks_client_connection;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  v10 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a1)
    {
      input[0] = a5;
      input[1] = a3;
      input[2] = a4;
      return IOConnectCallMethod(aks_client_connection, 0x43u, input, 3u, a1, a2, 0, 0, 0, 0);
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unlock_with_sync_bag", ":", 557, "", 0, "", "");
  }
  return v10;
}

uint64_t aks_load_bag(const void *a1, int a2, _DWORD *a3)
{
  uint64_t v6;
  mach_port_t aks_client_connection;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  v6 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v6 = 3758097090;
    if (a1)
    {
      if (a3)
      {
        output[0] = 0;
        outputCnt = 1;
        v6 = IOConnectCallMethod(aks_client_connection, 6u, 0, 0, a1, a2, output, &outputCnt, 0, 0);
        if (!(_DWORD)v6)
          *a3 = output[0];
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_load_bag", ":", 574, "", 0, "", "");
  }
  return v6;
}

uint64_t aks_invalidate_bag(const void *a1, int a2)
{
  uint64_t v4;
  mach_port_t aks_client_connection;

  v4 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a1)
      return IOConnectCallMethod(aks_client_connection, 0x57u, 0, 0, a1, a2, 0, 0, 0, 0);
    return 3758097090;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_invalidate_bag", ":", 596, "", 0, "", "");
  }
  return v4;
}

uint64_t aks_unload_bag(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 4u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unload_bag", ":", 612, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_unload_session_bags(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x37u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unload_session_bags", ":", 629, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_save_bag(uint64_t a1)
{
  int v1;
  _DWORD *v2;
  _DWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  int v6;
  mach_port_t aks_client_connection;
  mach_port_t v8;
  uint64_t result;
  void *v10;
  size_t __count;
  uint64_t input;
  _BYTE __src[32768];
  uint64_t v14;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v6 = v1;
  v14 = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v8 = aks_client_connection;
    result = 3758097090;
    if (v5)
    {
      if (v3)
      {
        bzero(__src, 0x8000uLL);
        __count = 0x8000;
        input = v6;
        result = IOConnectCallMethod(v8, 3u, &input, 1u, 0, 0, 0, 0, __src, &__count);
        if (!(_DWORD)result)
        {
          v10 = calloc(__count, 1uLL);
          *v5 = v10;
          if (v10)
          {
            memcpy(v10, __src, __count);
            result = 0;
            *v3 = __count;
          }
          else
          {
            return 3758097085;
          }
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_save_bag", ":", 646, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t aks_change_secret_opts(int a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, unsigned __int8 a10, unsigned int a11, unsigned int a12, _DWORD *a13)
{
  mach_port_t aks_client_connection;
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[13];

  input[12] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    input[1] = a11;
    input[2] = a10;
    input[3] = a2;
    input[4] = a3;
    input[5] = a4;
    input[6] = a5;
    input[7] = a6;
    input[8] = a7;
    input[9] = a8;
    input[10] = a9;
    input[11] = a12;
    output = 0;
    outputCnt = 1;
    result = IOConnectCallMethod(aks_client_connection, 0xFu, input, 0xCu, 0, 0, &output, &outputCnt, 0, 0);
    if (a13)
    {
      if (!(_DWORD)result)
        *a13 = output;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_change_secret_opts", ":", 678, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t aks_change_secret_se(int a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, unsigned __int8 a10, unsigned int a11, _DWORD *a12)
{
  return aks_change_secret_opts(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, 0, a12);
}

uint64_t aks_change_secret(int a1, uint64_t a2, int a3, uint64_t a4, int a5, unsigned int a6, _DWORD *a7)
{
  return aks_change_secret_opts(a1, a2, a3, a4, a5, 0, 0, 0, 0, 0xFFu, a6, 0, a7);
}

uint64_t aks_get_bag_uuid(int a1, _OWORD *a2)
{
  uint64_t v4;
  mach_port_t aks_client_connection;
  size_t v7;
  uint64_t input;
  __int128 outputStruct;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  v7 = 16;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
    {
      outputStruct = 0uLL;
      input = a1;
      v4 = IOConnectCallMethod(aks_client_connection, 0x17u, &input, 1u, 0, 0, 0, 0, &outputStruct, &v7);
      if (!(_DWORD)v4)
        *a2 = outputStruct;
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_bag_uuid", ":", 729, "", 0, "", "");
  }
  return v4;
}

uint64_t aks_copy_volume_cookie(int a1, _QWORD *a2, size_t *a3)
{
  return aks_copy_volume_cookie_persona(a1, (uint64_t)&UUID_NULL, a2, a3);
}

uint64_t aks_copy_volume_cookie_persona(int a1, uint64_t a2, _QWORD *a3, size_t *a4)
{
  mach_port_t aks_client_connection;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  mach_port_t v15;
  uint64_t v16;
  void *v17;
  unsigned int inputStructCnt[3];
  size_t __count;
  uint64_t input;
  _OWORD __src[2];
  __int16 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  memset(__src, 0, sizeof(__src));
  __count = 34;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v14 = 3758097090;
    if (a3 && a4)
    {
      v15 = aks_client_connection;
      input = a1;
      aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 1, v9, v10, v11, v12, v13, a2);
      if (*(_QWORD *)&inputStructCnt[1])
      {
        v16 = IOConnectCallMethod(v15, 0x44u, &input, 1u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, __src, &__count);
        if ((_DWORD)v16)
        {
          v14 = v16;
        }
        else
        {
          v17 = calloc(__count, 1uLL);
          *a3 = v17;
          v14 = 3758097085;
          if (v17)
          {
            memcpy(v17, __src, __count);
            v14 = 0;
            *a4 = __count;
          }
        }
      }
      else
      {
        v14 = 3758097085;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_copy_volume_cookie_persona", ":", 760, "", 0, "", "");
    v14 = 3758097084;
  }
  free(*(void **)&inputStructCnt[1]);
  return v14;
}

uint64_t aks_lock_bag(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0xDu, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_lock_bag", ":", 790, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_get_lock_state(int a1, _DWORD *a2)
{
  uint64_t v4;
  mach_port_t aks_client_connection;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
    {
      output = 0;
      input[0] = a1;
      outputCnt = 1;
      v4 = IOConnectCallMethod(aks_client_connection, 7u, input, 1u, 0, 0, &output, &outputCnt, 0, 0);
      if (!(_DWORD)v4)
        *a2 = output;
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_lock_state", ":", 824, "", 0, "", "");
  }
  return v4;
}

uint64_t aks_wrap_key(const void *a1, int a2, int a3, int a4, void *a5, int *a6, _DWORD *a7)
{
  uint64_t v14;
  mach_port_t aks_client_connection;
  uint64_t v16;
  size_t v18;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v14 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v14 = 3758097090;
    if (a1 && a5 && a6)
    {
      input[0] = a4;
      input[1] = a3;
      output = 0;
      outputCnt = 1;
      v18 = *a6;
      v16 = IOConnectCallMethod(aks_client_connection, 0xAu, input, 2u, a1, a2, &output, &outputCnt, a5, &v18);
      if ((_DWORD)v16)
      {
        return v16;
      }
      else
      {
        *a6 = v18;
        v14 = 0;
        if (a7)
          *a7 = output;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_wrap_key", ":", 848, "", 0, "", "");
  }
  return v14;
}

uint64_t aks_unwrap_key(const void *a1, int a2, int a3, int a4, void *a5, int *a6)
{
  uint64_t v12;
  mach_port_t aks_client_connection;
  size_t v15;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v12 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v12 = 3758097090;
    if (a1)
    {
      if (a5)
      {
        if (a6)
        {
          input[0] = a4;
          input[1] = a3;
          v15 = *a6;
          v12 = IOConnectCallMethod(aks_client_connection, 0xBu, input, 2u, a1, a2, 0, 0, a5, &v15);
          if (!(_DWORD)v12)
            *a6 = v15;
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unwrap_key", ":", 877, "", 0, "", "");
  }
  return v12;
}

uint64_t aks_rewrap_key_for_backup(const void *a1, int a2, int a3, int a4, uint64_t a5, unsigned int a6, void *a7)
{
  uint64_t v14;
  mach_port_t aks_client_connection;
  size_t v17;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  v14 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v14 = 3758097090;
    if (a1 && a7)
    {
      input[0] = a3;
      input[1] = a4;
      input[2] = a5;
      input[3] = a6;
      v17 = 108;
      return IOConnectCallMethod(aks_client_connection, 0x18u, input, 4u, a1, a2, 0, 0, a7, &v17);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_rewrap_key_for_backup", ":", 901, "", 0, "", "");
  }
  return v14;
}

uint64_t aks_get_system(int a1, _DWORD *a2)
{
  uint64_t v4;
  mach_port_t aks_client_connection;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
    {
      output = 0;
      input[0] = a1;
      outputCnt = 1;
      v4 = IOConnectCallMethod(aks_client_connection, 0xEu, input, a1 != 0, 0, 0, &output, &outputCnt, 0, 0);
      if (!(_DWORD)v4)
        *a2 = output;
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_system", ":", 922, "", 0, "", "");
  }
  return v4;
}

uint64_t aks_set_system_with_passcode(int a1, int a2, uint64_t a3, int a4)
{
  mach_port_t aks_client_connection;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    input[1] = a2;
    input[2] = a3;
    input[3] = a4;
    return IOConnectCallMethod(aks_client_connection, 5u, input, 4u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_system_with_passcode", ":", 950, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_set_system(int a1, int a2)
{
  return aks_set_system_with_passcode(a1, a2, 0, 0);
}

uint64_t aks_set_keybag_for_volume(int a1, uint64_t a2, unsigned int a3)
{
  return aks_set_keybag_for_volume_with_cookie_persona(a1, a2, a3);
}

uint64_t aks_set_keybag_for_volume_with_cookie(int a1, uint64_t a2, unsigned int a3)
{
  return aks_set_keybag_for_volume_with_cookie_persona(a1, a2, a3);
}

uint64_t aks_set_keybag_for_volume_with_cookie_persona(int a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6;
  mach_port_t aks_client_connection;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  mach_port_t v13;
  void *v14;
  unsigned int inputStructCnt[3];
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v6 = 3758097084;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v13 = aks_client_connection;
    input[0] = a1;
    input[1] = a3;
    aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 3, v8, v9, v10, v11, v12, a2);
    if (*(_QWORD *)&inputStructCnt[1])
    {
      v6 = IOConnectCallMethod(v13, 0x41u, input, 2u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, 0, 0);
      v14 = *(void **)&inputStructCnt[1];
    }
    else
    {
      v14 = 0;
      v6 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_keybag_for_volume_with_cookie_persona", ":", 987, "", 0, "", "");
    v14 = 0;
  }
  free(v14);
  return v6;
}

uint64_t aks_backup_enable_volume(uint64_t a1)
{
  uint64_t v1;
  size_t *v2;
  size_t *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  mach_port_t aks_client_connection;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  mach_port_t v18;
  uint64_t v19;
  void *v20;
  size_t __count;
  unsigned int inputStructCnt[3];
  uint64_t input[2];
  _BYTE __src[32768];
  uint64_t v26;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = v1;
  v26 = *MEMORY[0x24BDAC8D0];
  v11 = 3758097085;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(__src, 0x8000uLL);
  __count = 0x8000;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v18 = aks_client_connection;
    input[0] = v9;
    input[1] = v7;
    aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 1, v13, v14, v15, v16, v17, v10);
    if (*(_QWORD *)&inputStructCnt[1])
    {
      v19 = IOConnectCallMethod(v18, 0x6Eu, input, 2u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, __src, &__count);
      if ((_DWORD)v19)
      {
        v11 = v19;
      }
      else
      {
        v20 = calloc(__count, 1uLL);
        *v5 = v20;
        if (v20)
        {
          memcpy(v20, __src, __count);
          v11 = 0;
          *v3 = __count;
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_backup_enable_volume", ":", 1014, "", 0, "", "");
    v11 = 3758097084;
  }
  free(*(void **)&inputStructCnt[1]);
  return v11;
}

uint64_t aks_backup_disable_volume(uint64_t a1)
{
  uint64_t v2;
  mach_port_t aks_client_connection;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  mach_port_t v9;
  char *v10;
  int v12;
  char *v13;

  v2 = 3758097084;
  v13 = 0;
  v12 = 0;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v9 = aks_client_connection;
    aks_pack_data(&v13, (unsigned int *)&v12, 1, v4, v5, v6, v7, v8, a1);
    if (v13)
    {
      v2 = IOConnectCallMethod(v9, 0x6Fu, 0, 0, v13, v12, 0, 0, 0, 0);
      v10 = v13;
    }
    else
    {
      v10 = 0;
      v2 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_backup_disable_volume", ":", 1044, "", 0, "", "");
    v10 = 0;
  }
  free(v10);
  return v2;
}

uint64_t aks_backup_copy_current_bag_uuid(uint64_t a1, void *a2)
{
  uint64_t v4;
  mach_port_t aks_client_connection;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  mach_port_t v11;
  char *v12;
  size_t v14;
  int v15;
  char *v16;

  v4 = 3758097084;
  v16 = 0;
  v15 = 0;
  v14 = 16;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v11 = aks_client_connection;
    aks_pack_data(&v16, (unsigned int *)&v15, 1, v6, v7, v8, v9, v10, a1);
    if (v16)
    {
      v4 = IOConnectCallMethod(v11, 0x70u, 0, 0, v16, v15, 0, 0, a2, &v14);
      v12 = v16;
    }
    else
    {
      v12 = 0;
      v4 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_backup_copy_current_bag_uuid", ":", 1066, "", 0, "", "");
    v12 = 0;
  }
  free(v12);
  return v4;
}

uint64_t aks_backup_rewrap_key(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, unsigned int a6, void *a7)
{
  uint64_t v13;
  mach_port_t aks_client_connection;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  mach_port_t v20;
  void *v21;
  size_t v23;
  unsigned int inputStructCnt[3];
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  v13 = 3758097084;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v20 = aks_client_connection;
    v21 = 0;
    v13 = 3758097090;
    if (a2 && a7)
    {
      input[0] = a4;
      input[1] = a5;
      input[2] = a6;
      aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 2, v15, v16, v17, v18, v19, a1);
      v23 = 108;
      v13 = IOConnectCallMethod(v20, 0x71u, input, 3u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, a7, &v23);
      v21 = *(void **)&inputStructCnt[1];
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_backup_rewrap_key", ":", 1087, "", 0, "", "");
    v21 = 0;
  }
  free(v21);
  return v13;
}

uint64_t aks_backup_rewrap_ek(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, unsigned int a8, void *outputStruct)
{
  uint64_t v15;
  mach_port_t aks_client_connection;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  mach_port_t v22;
  void *v23;
  size_t v25;
  unsigned int inputStructCnt[3];
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  v15 = 3758097084;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v22 = aks_client_connection;
    v23 = 0;
    v15 = 3758097090;
    if (a2 && a4 && outputStruct)
    {
      input[0] = a6;
      input[1] = a7;
      input[2] = a8;
      aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 3, v17, v18, v19, v20, v21, a1);
      v25 = 108;
      v15 = IOConnectCallMethod(v22, 0x71u, input, 3u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, outputStruct, &v25);
      v23 = *(void **)&inputStructCnt[1];
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_backup_rewrap_ek", ":", 1113, "", 0, "", "");
    v23 = 0;
  }
  free(v23);
  return v15;
}

uint64_t aks_backup_unwrap_bag(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  _OWORD v13[5];
  uint64_t v14;
  __int128 __s;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  __s = 0u;
  v16 = 0u;
  v14 = 0;
  memset(v13, 0, sizeof(v13));
  v8 = decode_backup_bag(a1, a2, v13);
  if ((_DWORD)v8)
  {
    v9 = v8;
  }
  else
  {
    v9 = unwrap_backup_bag((uint64_t)v13, a3, a4, (uint64_t)&__s);
    if (!(_DWORD)v9)
    {
      v10 = v16;
      *a5 = __s;
      a5[1] = v10;
      v11 = v18;
      a5[2] = v17;
      a5[3] = v11;
    }
  }
  memset_s(v13, 0x58uLL, 0, 0x58uLL);
  memset_s(&__s, 0x40uLL, 0, 0x40uLL);
  return err_sks_to_aks(v9);
}

uint64_t aks_backup_copy_bag_uuid(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v4;
  _OWORD v6[5];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  memset(v6, 0, sizeof(v6));
  v4 = decode_backup_bag(a1, a2, v6);
  if (!(_DWORD)v4)
    uuid_copy(a3, (const unsigned __int8 *)v6 + 8);
  memset_s(v6, 0x58uLL, 0, 0x58uLL);
  return err_sks_to_aks(v4);
}

uint64_t aks_backup_unwrap_key(__int128 *a1, _QWORD *a2, unsigned int a3, _QWORD *a4, _QWORD *a5)
{
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  unsigned int v10;
  int __s;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a1[1];
  v12 = *a1;
  v13 = v6;
  v7 = a1[3];
  v14 = a1[2];
  v15 = v7;
  v10 = *a5;
  __s = 1;
  v8 = unwrap_data((uint64_t)&__s, 0, 0, a2, a3, a4, &v10);
  *a5 = v10;
  memset_s(&__s, 0x44uLL, 0, 0x44uLL);
  return err_sks_to_aks(v8);
}

uint64_t aks_kc_backup_unwrap_key(uint64_t a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  uint64_t v10;
  mach_port_t aks_client_connection;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v10 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v10 = 3758097090;
    if (a2 && a4)
    {
      input[0] = a1;
      input[1] = 64;
      return IOConnectCallMethod(aks_client_connection, 0x82u, input, 2u, a2, a3, 0, 0, a4, a5);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_kc_backup_unwrap_key", ":", 1193, "", 0, "", "");
  }
  return v10;
}

uint64_t aks_kc_backup_wrap_key(int a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  uint64_t v10;
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v10 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v10 = 3758097090;
    if (a2 && a4)
    {
      input[0] = a1;
      return IOConnectCallMethod(aks_client_connection, 0x81u, input, 1u, a2, a3, 0, 0, a4, a5);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_kc_backup_wrap_key", ":", 1212, "", 0, "", "");
  }
  return v10;
}

uint64_t aks_kc_backup_get_handle(int a1, _DWORD *a2)
{
  uint64_t v4;
  mach_port_t aks_client_connection;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
    {
      output = 0;
      input[0] = a1;
      outputCnt = 1;
      v4 = IOConnectCallMethod(aks_client_connection, 0x83u, input, 1u, 0, 0, &output, &outputCnt, 0, 0);
      if (!(_DWORD)v4)
        *a2 = output;
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_kc_backup_get_handle", ":", 1231, "", 0, "", "");
  }
  return v4;
}

uint64_t aks_kc_backup_get_uuid(int a1, unsigned __int8 *a2)
{
  uint64_t v4;
  mach_port_t aks_client_connection;
  uint64_t v6;
  size_t v8;
  unsigned __int8 src[8];
  uint64_t v10;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
    {
      v10 = 0;
      input[0] = a1;
      v8 = 16;
      *(_QWORD *)src = 0;
      v6 = IOConnectCallMethod(aks_client_connection, 0x84u, input, 1u, 0, 0, 0, 0, src, &v8);
      if ((_DWORD)v6)
      {
        return v6;
      }
      else if (v8 == 16)
      {
        uuid_copy(a2, src);
        return 0;
      }
      else
      {
        return 3758604298;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_kc_backup_get_uuid", ":", 1253, "", 0, "", "");
  }
  return v4;
}

uint64_t aks_kc_backup_open_keybag(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, _OWORD *a6)
{
  int v7;
  int v9;
  int v11;
  FILE **v12;
  FILE *v13;
  uint64_t bag;
  int is_enabled;
  int v16;
  uint64_t v17;

  if (a5)
  {
    v7 = a4;
    v9 = a2;
    *a5 = -1;
    v11 = aks_backup_unwrap_bag((uint64_t)a1, a2, a3, a4, a6);
    v12 = (FILE **)MEMORY[0x24BDAC8E8];
    v13 = (FILE *)*MEMORY[0x24BDAC8E8];
    if (!v11)
    {
      fprintf(v13, "%s%s:%s%s%s%s%u:%s%u:%s Unwrapped DER backup bag%s\n", "aks", "", "", "", "aks_kc_backup_open_keybag", ":", 1302, "", 0, "", "");
      v17 = 0;
      goto LABEL_9;
    }
    fprintf(v13, "%s%s:%s%s%s%s%u:%s%u:%s Failed to unwrap backup bag as DER: 0x%08x%s\n", "aks", "", "", "", "aks_kc_backup_open_keybag", ":", 1290, "", 0, "", v11, "");
    bag = aks_load_bag(a1, v9, a5);
    if ((_DWORD)bag)
    {
      v17 = bag;
      fprintf(*v12, "%s%s:%s%s%s%s%u:%s%u:%s Failed to load in-kernel backup bag: 0x%08x%s\n", "aks", "", "", "", "aks_kc_backup_open_keybag", ":", 1292, "", 0, "", bag, "");
    }
    else
    {
      is_enabled = aks_prederived_is_enabled(*a5);
      v16 = *a5;
      if (is_enabled)
      {
        v17 = aks_prederived_unlock_keybag(v16, a3, v7, 0);
        if (!(_DWORD)v17)
          goto LABEL_9;
        fprintf(*v12, "%s%s:%s%s%s%s%u:%s%u:%s Failed to unlock in-kernel backup bag with prederived secret: 0x%08x%s\n", "aks", "", "", "", "aks_kc_backup_open_keybag", ":");
      }
      else
      {
        v17 = aks_unlock_bag(v16, a3, v7);
        if (!(_DWORD)v17)
          goto LABEL_9;
        fprintf(*v12, "%s%s:%s%s%s%s%u:%s%u:%s Failed to unlock in-kernel backup bag: 0x%08x%s\n", "aks", "", "", "", "aks_kc_backup_open_keybag", ":");
      }
    }
  }
  else
  {
    v17 = 3758097090;
  }
  if (*a5 != -1)
  {
    aks_unload_bag(*a5);
    *a5 = -1;
  }
LABEL_9:
  aks_prederived_free(0);
  return v17;
}

uint64_t aks_keybag_persona_create(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  mach_port_t aks_client_connection;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  mach_port_t v15;
  char *v16;
  int v18;
  char *v19;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  v8 = 3758097084;
  v19 = 0;
  v18 = 0;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v15 = aks_client_connection;
    input[0] = a1;
    input[1] = a2;
    input[2] = a3;
    aks_pack_data(&v19, (unsigned int *)&v18, 1, v10, v11, v12, v13, v14, a4);
    if (v19)
    {
      v8 = IOConnectCallMethod(v15, 0x60u, input, 3u, v19, v18, 0, 0, 0, 0);
      v16 = v19;
    }
    else
    {
      v16 = 0;
      v8 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_keybag_persona_create", ":", 1324, "", 0, "", "");
    v16 = 0;
  }
  free(v16);
  return v8;
}

uint64_t aks_keybag_persona_create_with_flags(int a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t v10;
  mach_port_t aks_client_connection;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  mach_port_t v17;
  void *v18;
  unsigned int inputStructCnt[3];
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  v10 = 3758097084;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v17 = aks_client_connection;
    input[0] = a1;
    input[1] = a2;
    input[2] = a3;
    input[3] = a5;
    aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 1, v12, v13, v14, v15, v16, a4);
    if (*(_QWORD *)&inputStructCnt[1])
    {
      v10 = IOConnectCallMethod(v17, 0x75u, input, 4u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, 0, 0);
      v18 = *(void **)&inputStructCnt[1];
    }
    else
    {
      v18 = 0;
      v10 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_keybag_persona_create_with_flags", ":", 1346, "", 0, "", "");
    v18 = 0;
  }
  free(v18);
  return v10;
}

uint64_t aks_keybag_persona_list(uint64_t a1)
{
  int v1;
  size_t *v2;
  size_t *v3;
  _QWORD *v4;
  _QWORD *v5;
  int v6;
  uint64_t v7;
  mach_port_t aks_client_connection;
  uint64_t v9;
  void *v10;
  size_t v11;
  size_t __count;
  uint64_t input;
  _BYTE __src[8192];
  uint64_t v16;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v6 = v1;
  v16 = *MEMORY[0x24BDAC8D0];
  bzero(__src, 0x2000uLL);
  __count = 0x2000;
  input = v6;
  v7 = 3758097090;
  if (v5 && v3)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v9 = IOConnectCallMethod(aks_client_connection, 0x61u, &input, 1u, 0, 0, 0, 0, __src, &__count);
      if ((_DWORD)v9)
      {
        v7 = v9;
      }
      else
      {
        if (__count)
        {
          v10 = calloc(__count, 1uLL);
          *v5 = v10;
          if (!v10)
          {
            v7 = 3758097085;
            goto LABEL_10;
          }
          memcpy(v10, __src, __count);
          v11 = __count;
        }
        else
        {
          v11 = 0;
          *v5 = 0;
        }
        v7 = 0;
        *v3 = v11;
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_keybag_persona_list", ":", 1372, "", 0, "", "");
      v7 = 3758097084;
    }
  }
LABEL_10:
  memset_s(__src, 0x2000uLL, 0, 0x2000uLL);
  return v7;
}

uint64_t aks_keybag_persona_delete(int a1, uint64_t a2)
{
  uint64_t v4;
  mach_port_t aks_client_connection;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  mach_port_t v11;
  char *v12;
  int v14;
  char *v15;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  v15 = 0;
  v14 = 0;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v11 = aks_client_connection;
    input[0] = a1;
    aks_pack_data(&v15, (unsigned int *)&v14, 1, v6, v7, v8, v9, v10, a2);
    if (v15)
    {
      v4 = IOConnectCallMethod(v11, 0x62u, input, 1u, v15, v14, 0, 0, 0, 0);
      v12 = v15;
    }
    else
    {
      v12 = 0;
      v4 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_keybag_persona_delete", ":", 1394, "", 0, "", "");
    v12 = 0;
  }
  free(v12);
  return v4;
}

uint64_t aks_auth_token_create(int a1, uint64_t a2, int a3, unsigned int a4, void *a5, size_t *a6)
{
  uint64_t v12;
  mach_port_t aks_client_connection;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  v12 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v12 = 3758097090;
    if (a5 && a6)
    {
      input[0] = a1;
      input[1] = a4;
      input[2] = a2;
      input[3] = a3;
      return IOConnectCallMethod(aks_client_connection, 0x26u, input, 4u, 0, 0, 0, 0, a5, a6);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_auth_token_create", ":", 1415, "", 0, "", "");
  }
  return v12;
}

uint64_t aks_set_configuration(int a1, uint64_t a2, uint64_t a3, const __CFDictionary *a4)
{
  uint64_t v7;
  mach_port_t aks_client_connection;
  mach_port_t v9;
  CFTypeID TypeID;
  CFTypeID v11;
  CFTypeID v12;
  CFTypeID v13;
  CFTypeID v14;
  CFTypeID v15;
  CFTypeID v16;
  CFTypeID v17;
  CFTypeID v18;
  void *v20;
  rsize_t __n;
  void *__s;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  __n = 0;
  __s = 0;
  v7 = 3758097090;
  v20 = 0;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v9 = aks_client_connection;
    TypeID = CFNumberGetTypeID();
    if (!_copy_cf_key(a4, CFSTR("GracePeriod"), TypeID, (uint64_t)der_key_config_graceperiod, &v20))
    {
      v11 = CFNumberGetTypeID();
      if (!_copy_cf_key(a4, CFSTR("BackOffDelay"), v11, (uint64_t)der_key_config_backoff_delay, &v20))
      {
        v12 = CFNumberGetTypeID();
        if (!_copy_cf_key(a4, CFSTR("MaxUnlockAttempts"), v12, (uint64_t)der_key_config_max_unlock_attempts, &v20))
        {
          v13 = CFNumberGetTypeID();
          if (!_copy_cf_key(a4, CFSTR("EscrowPasscodePeriod"), v13, (uint64_t)der_key_config_escrow_passcode_period, &v20))
          {
            v14 = CFNumberGetTypeID();
            if (!_copy_cf_key(a4, CFSTR("EscrowTokenPeriod"), v14, (uint64_t)der_key_config_escrow_token_period, &v20))
            {
              v15 = CFDataGetTypeID();
              if (!_copy_cf_key(a4, CFSTR("UserUUID"), v15, (uint64_t)der_key_config_user_uuid, &v20))
              {
                v16 = CFDataGetTypeID();
                if (!_copy_cf_key(a4, CFSTR("BindKEKToKB"), v16, (uint64_t)der_key_config_bind_kek, &v20))
                {
                  v17 = CFBooleanGetTypeID();
                  if (!_copy_cf_key(a4, CFSTR("InactivityRebootEnabled"), v17, (uint64_t)der_key_inactivity_reboot_enabled, &v20))
                  {
                    v18 = CFBooleanGetTypeID();
                    if (!_copy_cf_key(a4, CFSTR("OnenessAutomaticMode"), v18, (uint64_t)der_key_oneness_automatic_mode, &v20)&& !encode_list_is_empty(&v20)&& (!a2 || !encode_list_add_data(&v20, (uint64_t)der_key_passcode, a2))&& !encode_list_dict(&v20, &__s, &__n))
                    {
                      input[0] = a1;
                      input[1] = (uint64_t)__s;
                      input[2] = __n;
                      v7 = IOConnectCallMethod(v9, 0x1Eu, input, 3u, 0, 0, 0, 0, 0, 0);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_configuration", ":", 1488, "", 0, "", "");
    v7 = 3758097084;
  }
  encode_list_free(&v20);
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  return v7;
}

uint64_t _copy_cf_key(const __CFDictionary *a1, const void *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t result;
  const UInt8 *BytePtr;
  uint64_t v10;
  void *value;

  value = 0;
  result = CFDictionaryGetValueIfPresent(a1, a2, (const void **)&value);
  if ((_DWORD)result)
  {
    if (CFGetTypeID(value) == a3)
    {
      if (CFNumberGetTypeID() == a3)
      {
        v10 = 0;
        if (!CFNumberGetValue((CFNumberRef)value, kCFNumberSInt64Type, &v10)
          || encode_list_add_number(a5, a4, v10))
        {
          return 0xFFFFFFFFLL;
        }
        return 0;
      }
      if (CFBooleanGetTypeID() == a3)
      {
        CFBooleanGetValue((CFBooleanRef)value);
        if (encode_list_add_BOOL(a5, a4))
          return 0xFFFFFFFFLL;
      }
      else
      {
        if (CFDataGetTypeID() != a3)
          return 0xFFFFFFFFLL;
        BytePtr = CFDataGetBytePtr((CFDataRef)value);
        CFDataGetLength((CFDataRef)value);
        if (encode_list_add_data(a5, a4, (uint64_t)BytePtr))
          return 0xFFFFFFFFLL;
      }
      return 0;
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t aks_get_configuration(uint64_t a1)
{
  int v1;
  __CFDictionary **v2;
  __CFDictionary **v3;
  int v4;
  uint64_t v5;
  mach_port_t aks_client_connection;
  mach_port_t v7;
  uint64_t v8;
  __CFDictionary *Mutable;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFTypeID TypeID;
  CFTypeID v19;
  CFTypeID v20;
  CFTypeID v21;
  CFTypeID v22;
  CFTypeID v23;
  CFTypeID v24;
  CFTypeID v25;
  CFTypeID v26;
  CFTypeID v27;
  CFTypeID v28;
  CFTypeID v29;
  CFTypeID v30;
  CFTypeID v31;
  CFTypeID v32;
  char number;
  const void *v34;
  const void *v35;
  const void *v36;
  const void *v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __CFDictionary **v46;
  size_t v47[2];
  _QWORD v48[74];
  uint64_t input;
  _BYTE outputStruct[32768];
  uint64_t v51;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v4 = v1;
  v51 = *MEMORY[0x24BDAC8D0];
  v5 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (v3)
    {
      v7 = aks_client_connection;
      bzero(outputStruct, 0x8000uLL);
      v47[0] = 0x8000;
      input = v4;
      v8 = IOConnectCallMethod(v7, 0x1Fu, &input, 1u, 0, 0, 0, 0, outputStruct, v47);
      if ((_DWORD)v8)
      {
        return v8;
      }
      else if (v47[0] > 0x8000)
      {
        return 3758604298;
      }
      else
      {
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        bzero(v48, 0x250uLL);
        v47[1] = (size_t)der_key_config_graceperiod;
        v48[4] = der_key_config_backoff_delay;
        v48[9] = der_key_config_max_unlock_attempts;
        v48[14] = der_key_config_escrow_passcode_period;
        v48[19] = der_key_config_escrow_token_period;
        v48[24] = der_key_config_flags;
        v48[29] = der_key_config_user_uuid;
        v48[34] = der_key_config_group_uuid;
        v48[39] = der_key_config_recovery_iterations;
        v48[44] = der_key_config_recovery_flags;
        v48[49] = der_key_config_recovery_target_iterations;
        v48[54] = der_key_memento_supported;
        v48[59] = der_key_memento_blob_exists;
        v48[64] = der_key_config_memento_passcode_generation;
        v48[69] = der_key_config_passcode_generation;
        der_dict_iterate();
        v10 = v48[0];
        v11 = v48[5];
        v12 = v48[10];
        v13 = v48[15];
        v14 = v48[20];
        v15 = v48[25];
        v16 = v48[30];
        v46 = v3;
        v17 = v48[35];
        v39 = v48[40];
        v40 = v48[45];
        v41 = v48[50];
        v42 = v48[55];
        v43 = v48[60];
        v44 = v48[65];
        v45 = v48[70];
        TypeID = CFNumberGetTypeID();
        _set_cf_key(Mutable, CFSTR("GracePeriod"), TypeID, v10);
        v19 = CFNumberGetTypeID();
        _set_cf_key(Mutable, CFSTR("BackOffDelay"), v19, v11);
        v20 = CFNumberGetTypeID();
        _set_cf_key(Mutable, CFSTR("MaxUnlockAttempts"), v20, v12);
        v21 = CFNumberGetTypeID();
        _set_cf_key(Mutable, CFSTR("EscrowPasscodePeriod"), v21, v13);
        v22 = CFNumberGetTypeID();
        _set_cf_key(Mutable, CFSTR("EscrowTokenPeriod"), v22, v14);
        v23 = CFNumberGetTypeID();
        _set_cf_key(Mutable, CFSTR("ConfigFlags"), v23, v15);
        v24 = CFDataGetTypeID();
        _set_cf_key(Mutable, CFSTR("UserUUID"), v24, v16);
        v25 = CFDataGetTypeID();
        _set_cf_key(Mutable, CFSTR("GroupUUID"), v25, v17);
        v26 = CFNumberGetTypeID();
        _set_cf_key(Mutable, CFSTR("RecoveryIterations"), v26, v39);
        v27 = CFNumberGetTypeID();
        _set_cf_key(Mutable, CFSTR("RecoveryFlags"), v27, v40);
        v28 = CFNumberGetTypeID();
        _set_cf_key(Mutable, CFSTR("RecoveryTargetIterations"), v28, v41);
        v29 = CFBooleanGetTypeID();
        _set_cf_key(Mutable, CFSTR("MementoSupported"), v29, v42);
        v30 = CFBooleanGetTypeID();
        _set_cf_key(Mutable, CFSTR("MementoBlobExists"), v30, v43);
        v31 = CFNumberGetTypeID();
        _set_cf_key(Mutable, CFSTR("MementoPasscodeGeneration"), v31, v44);
        v32 = CFNumberGetTypeID();
        _set_cf_key(Mutable, CFSTR("PasscodeGeneration"), v32, v45);
        number = der_get_number();
        v34 = (const void *)*MEMORY[0x24BDBD268];
        v35 = (const void *)*MEMORY[0x24BDBD270];
        if ((number & 2) != 0)
          v36 = (const void *)*MEMORY[0x24BDBD270];
        else
          v36 = (const void *)*MEMORY[0x24BDBD268];
        CFDictionarySetValue(Mutable, CFSTR("InactivityRebootEnabled"), v36);
        if ((number & 8) != 0)
          v37 = v35;
        else
          v37 = v34;
        CFDictionarySetValue(Mutable, CFSTR("OnenessAutomaticMode"), v37);
        v5 = 0;
        *v46 = Mutable;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_configuration", ":", 1556, "", 0, "", "");
  }
  return v5;
}

void _set_cf_key(__CFDictionary *a1, const void *a2, uint64_t a3, uint64_t a4)
{
  CFNumberRef v7;
  int v8;
  const void **v9;
  const UInt8 *v10;
  CFNumberRef v11;
  CFIndex valuePtr;

  if (a4)
  {
    if (CFNumberGetTypeID() == a3)
    {
      valuePtr = der_get_number();
      v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
      if (!v7)
        return;
LABEL_12:
      v11 = v7;
      CFDictionaryAddValue(a1, a2, v7);
      CFRelease(v11);
      return;
    }
    if (CFBooleanGetTypeID() == a3)
    {
      v8 = der_get_BOOL();
      v9 = (const void **)MEMORY[0x24BDBD270];
      if (!v8)
        v9 = (const void **)MEMORY[0x24BDBD268];
      CFDictionaryAddValue(a1, a2, *v9);
    }
    else if (CFDataGetTypeID() == a3)
    {
      valuePtr = 0;
      v10 = (const UInt8 *)ccder_decode_tl();
      if (v10)
      {
        v7 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v10, valuePtr);
        goto LABEL_12;
      }
    }
  }
}

uint64_t aks_assert_hold(int a1, unsigned int a2, uint64_t a3)
{
  mach_port_t aks_client_connection;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  input[2] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x1Au, input, 3u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_assert_hold", ":", 1654, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_assert_drop(int a1, unsigned int a2)
{
  mach_port_t aks_client_connection;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x1Bu, input, 2u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_assert_drop", ":", 1672, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_assert_promote(int a1, unsigned int a2)
{
  mach_port_t aks_client_connection;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a2;
    input[1] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x64u, input, 2u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_assert_promote", ":", 1687, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_oneness_heartbeat(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x91u, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_oneness_heartbeat", ":", 1707, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_assert_consume(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x65u, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_assert_consume", ":", 1722, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_recover_with_escrow_bag(int a1, uint64_t a2)
{
  mach_port_t aks_client_connection;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  mach_port_t v10;
  uint64_t v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v14 = 0;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v10 = aks_client_connection;
    aks_pack_data((char **)&v15, (unsigned int *)&v14, 3, v5, v6, v7, v8, v9, a2);
    input[0] = a1;
    input[1] = (uint64_t)v15;
    input[2] = v14;
    v11 = IOConnectCallMethod(v10, 0x12u, input, 3u, 0, 0, 0, 0, 0, 0);
    v12 = v15;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_recover_with_escrow_bag", ":", 1739, "", 0, "", "");
    v12 = 0;
    v11 = 3758097084;
  }
  free(v12);
  return v11;
}

uint64_t aks_fdr_hmac_data(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  int v6;
  int v7;
  const void *v8;
  uint64_t v9;
  mach_port_t aks_client_connection;
  uint64_t v11;
  void *v12;
  size_t __count;
  _BYTE __src[32768];
  uint64_t v16;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = (const void *)v1;
  v16 = *MEMORY[0x24BDAC8D0];
  v9 = 3758097090;
  bzero(__src, 0x8000uLL);
  __count = 0x8000;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (v8 && v5 && v3)
    {
      v11 = IOConnectCallMethod(aks_client_connection, 0x29u, 0, 0, v8, v7, 0, 0, __src, &__count);
      if ((_DWORD)v11)
      {
        v9 = v11;
      }
      else
      {
        v12 = calloc(__count, 1uLL);
        *v5 = v12;
        if (v12)
        {
          memcpy(v12, __src, __count);
          v9 = 0;
          *v3 = __count;
        }
        else
        {
          v9 = 3758097085;
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fdr_hmac_data", ":", 1758, "", 0, "", "");
    v9 = 3758097084;
  }
  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  return v9;
}

uint64_t aks_generation(int a1, unsigned int a2, _DWORD *a3)
{
  mach_port_t aks_client_connection;
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    input[1] = a2;
    output = 0;
    outputCnt = 1;
    result = IOConnectCallMethod(aks_client_connection, 0x28u, input, 2u, 0, 0, &output, &outputCnt, 0, 0);
    if (a3)
    {
      if (!(_DWORD)result)
        *a3 = output;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_generation", ":", 1781, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t _aks_verify_password(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  uint64_t v9;
  mach_port_t aks_client_connection;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  mach_port_t v16;
  const char *v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  v9 = 3758097084;
  v21 = 0;
  v20 = 0;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v16 = aks_client_connection;
    if (a2)
      v17 = a2;
    else
      v17 = "";
    aks_pack_data((char **)&v21, (unsigned int *)&v20, 2, v11, v12, v13, v14, v15, (uint64_t)v17);
    if (v21)
    {
      input[0] = a1;
      input[1] = a6;
      input[2] = (uint64_t)v21;
      input[3] = v20;
      v9 = IOConnectCallMethod(v16, 0x2Au, input, 4u, 0, 0, 0, 0, 0, 0);
      v18 = v21;
    }
    else
    {
      v18 = 0;
      v9 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_aks_verify_password", ":", 1807, "", 0, "", "");
    v18 = 0;
  }
  free(v18);
  return v9;
}

uint64_t aks_verify_password(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _aks_verify_password(a1, a2, a3, a4, a5, 0);
}

uint64_t aks_verify_password_memento(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _aks_verify_password(a1, a2, a3, a4, a5, 1u);
}

uint64_t aks_register_for_notifications()
{
  if (get_aks_client_connection())
    JUMPOUT(0x24950EF00);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_register_for_notifications", ":", 1840, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_create_signing_key(int a1, int a2, _QWORD *a3, size_t *a4)
{
  uint64_t result;
  mach_port_t aks_client_connection;
  void *v8;
  size_t __count;
  uint64_t input[2];
  _OWORD __src[16];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  __count = 256;
  input[0] = a1;
  input[1] = a2;
  result = 3758097090;
  if (a3 && a4)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      memset(__src, 0, sizeof(__src));
      result = IOConnectCallMethod(aks_client_connection, 0x31u, input, 2u, 0, 0, 0, 0, __src, &__count);
      if (!(_DWORD)result)
      {
        if (__count > 0x100)
        {
          return 3758604298;
        }
        else
        {
          v8 = calloc(__count, 1uLL);
          *a3 = v8;
          if (v8)
          {
            memcpy(v8, __src, __count);
            result = 0;
            *a4 = __count;
          }
          else
          {
            return 3758097085;
          }
        }
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_create_signing_key", ":", 1859, "", 0, "", "");
      return 3758097084;
    }
  }
  return result;
}

uint64_t aks_create_signing_key_with_params(uint64_t a1)
{
  int v1;
  const void *v2;
  size_t v3;
  _QWORD *v4;
  size_t *v5;
  int v6;
  uint64_t result;
  size_t *v8;
  _QWORD *v9;
  size_t v10;
  const void *v11;
  mach_port_t aks_client_connection;
  mach_port_t v13;
  void *v14;
  size_t __count;
  uint64_t input[2];
  _BYTE __src[32768];
  uint64_t v18;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v18 = *MEMORY[0x24BDAC8D0];
  __count = 0x8000;
  input[0] = v1;
  input[1] = v6;
  result = 3758097090;
  if (v4)
  {
    v8 = v5;
    if (v5)
    {
      v9 = v4;
      v10 = v3;
      v11 = v2;
      aks_client_connection = get_aks_client_connection();
      if (aks_client_connection)
      {
        v13 = aks_client_connection;
        bzero(__src, 0x8000uLL);
        result = IOConnectCallMethod(v13, 0x31u, input, 2u, v11, v10, 0, 0, __src, &__count);
        if (!(_DWORD)result)
        {
          if (__count > 0x8000)
          {
            return 3758604298;
          }
          else
          {
            v14 = calloc(__count, 1uLL);
            *v9 = v14;
            if (v14)
            {
              memcpy(v14, __src, __count);
              result = 0;
              *v8 = __count;
            }
            else
            {
              return 3758097085;
            }
          }
        }
      }
      else
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_create_signing_key_with_params", ":", 1881, "", 0, "", "");
        return 3758097084;
      }
    }
  }
  return result;
}

uint64_t aks_obliterate_signing_keys(uint64_t a1)
{
  return remote_session_operate(a1);
}

uint64_t remote_session_operate(uint64_t a1)
{
  int v1;
  size_t *v2;
  size_t *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint32_t v6;
  uint32_t v7;
  uint64_t v8;
  uint64_t v9;
  mach_port_t aks_client_connection;
  mach_port_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  size_t v15;
  size_t __count;
  uint64_t input[3];
  _BYTE __src[15360];
  uint64_t v20;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v20 = *MEMORY[0x24BDAC8D0];
  __count = 15360;
  input[0] = v1;
  input[1] = v8;
  input[2] = v9;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v11 = aks_client_connection;
    bzero(__src, 0x3C00uLL);
    v12 = IOConnectCallMethod(v11, v7, input, 3u, 0, 0, 0, 0, __src, &__count);
    if ((_DWORD)v12)
    {
      return v12;
    }
    else if (__count > 0x3C00)
    {
      return 3758604298;
    }
    else
    {
      v13 = 0;
      if (v5 && v3)
      {
        if (__count)
        {
          v14 = calloc(__count, 1uLL);
          *v5 = v14;
          if (!v14)
            return 3758097085;
          memcpy(v14, __src, __count);
          v15 = __count;
        }
        else
        {
          v15 = 0;
        }
        v13 = 0;
        *v3 = v15;
      }
    }
  }
  else
  {
    v13 = 3758097084;
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "remote_session_operate", ":", 2017, "", 0, "", "");
  }
  return v13;
}

uint64_t aks_sign_signing_key(int a1, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, _QWORD *a8, size_t *a9)
{
  uint64_t v9;
  mach_port_t aks_client_connection;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  mach_port_t v18;
  uint64_t v19;
  void *v20;
  unsigned int inputStructCnt[3];
  size_t __count;
  uint64_t input[3];
  _OWORD __src[16];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  memset(__src, 0, sizeof(__src));
  __count = 256;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  input[0] = a1;
  input[1] = a2;
  v9 = 3758097090;
  input[2] = a5;
  if (a8 && a9)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v18 = aks_client_connection;
      aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 2, v13, v14, v15, v16, v17, a3);
      if (*(_QWORD *)&inputStructCnt[1])
      {
        v19 = IOConnectCallMethod(v18, 0x32u, input, 3u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, __src, &__count);
        if ((_DWORD)v19)
        {
          v9 = v19;
        }
        else if (__count > 0x100)
        {
          v9 = 3758604298;
        }
        else
        {
          v20 = calloc(__count, 1uLL);
          *a8 = v20;
          v9 = 3758097085;
          if (v20)
          {
            memcpy(v20, __src, __count);
            v9 = 0;
            *a9 = __count;
          }
        }
      }
      else
      {
        v9 = 3758097085;
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_sign_signing_key", ":", 1911, "", 0, "", "");
      v9 = 3758097084;
    }
  }
  free(*(void **)&inputStructCnt[1]);
  return v9;
}

uint64_t aks_remote_session(int a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9)
{
  uint64_t v10;
  mach_port_t aks_client_connection;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  mach_port_t v17;
  uint64_t v18;
  uint32_t outputCnt;
  unsigned int inputStructCnt[3];
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v10 = 3758097084;
  input[0] = a2;
  input[1] = a1;
  output = 0;
  outputCnt = 1;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v17 = aks_client_connection;
    aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 3, v12, v13, v14, v15, v16, a3);
    if (*(_QWORD *)&inputStructCnt[1])
    {
      v18 = IOConnectCallMethod(v17, 0x2Cu, input, 2u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], &output, &outputCnt, 0, 0);
      v10 = v18;
      if (a9 && !(_DWORD)v18)
        *a9 = output;
    }
    else
    {
      v10 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_remote_session", ":", 1938, "", 0, "", "");
  }
  free(*(void **)&inputStructCnt[1]);
  return v10;
}

uint64_t aks_validate_local_key(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int v8;
  uint64_t v11;
  void *v12;
  rsize_t __smax;
  rsize_t __n;
  uint64_t v16;
  void *v17;
  void *__s;
  __int128 v19;

  v17 = 0;
  __s = 0;
  v4 = 3758097084;
  __n = 0;
  v16 = 0;
  v5 = 3758097090;
  __smax = 0;
  if (!a3 || !a4)
    goto LABEL_12;
  v8 = -536870212;
  *(_QWORD *)&v19 = a3;
  *((_QWORD *)&v19 + 1) = a3 + a4;
  if (!(a3 + a4))
    goto LABEL_19;
  v16 = 0;
  if ((ccder_blob_decode_range() & 1) == 0)
  {
    v8 = -536870198;
LABEL_19:
    syslog(3, "error parsing signing key: %d", v8);
    v5 = 3758097084;
LABEL_12:
    v12 = __s;
    v4 = v5;
    goto LABEL_13;
  }
  der_utils_decode_implicit_uint64(&v19, 0x8000000000000001, &v16);
  if (v16)
  {
    v5 = remote_session_operate(a1);
    if ((_DWORD)v5)
      syslog(3, "error: validating v1 local signing key failed: %d");
    goto LABEL_12;
  }
  v11 = aks_create_signing_key(a1, 11, &__s, &__n);
  if ((_DWORD)v11)
  {
    v5 = v11;
    syslog(3, "error: validating (create) v0 local signing key failed: %d", v11);
    goto LABEL_12;
  }
  v12 = __s;
  if (__s && __n)
  {
    v5 = aks_sign_signing_key(a1, a2, a3, a4, 11, (uint64_t)__s, __n, &v17, &__smax);
    if ((_DWORD)v5)
      syslog(3, "error: validating (sign) v0 local signing key failed: %d");
    goto LABEL_12;
  }
LABEL_13:
  if (v12)
  {
    memset_s(v12, __n, 0, __n);
    free(__s);
  }
  if (v17)
  {
    memset_s(v17, __smax, 0, __smax);
    free(v17);
  }
  return v4;
}

uint64_t aks_remote_session_step(uint64_t a1)
{
  return remote_session_operate(a1);
}

uint64_t aks_remote_peer_setup(uint64_t a1)
{
  return remote_session_operate(a1);
}

uint64_t aks_remote_peer_setup_with_acm(uint64_t a1)
{
  return remote_session_operate(a1);
}

uint64_t aks_remote_peer_confirm(uint64_t a1)
{
  return remote_session_operate(a1);
}

uint64_t aks_remote_session_token(uint64_t a1)
{
  return remote_session_operate(a1);
}

uint64_t aks_drain_backup_keys(uint64_t a1)
{
  int v1;
  _DWORD *v2;
  _DWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  int v6;
  mach_port_t aks_client_connection;
  mach_port_t v8;
  uint64_t result;
  void *v10;
  size_t __count;
  uint64_t input[2];
  _BYTE __src[32768];
  uint64_t v14;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v6 = v1;
  v14 = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v8 = aks_client_connection;
    result = 3758097090;
    if (v5)
    {
      if (v3)
      {
        bzero(__src, 0x8000uLL);
        __count = 0x8000;
        input[0] = v6;
        input[1] = 0;
        result = IOConnectCallMethod(v8, 0x14u, input, 2u, 0, 0, 0, 0, __src, &__count);
        if (!(_DWORD)result)
        {
          if (__count)
          {
            v10 = calloc(__count, 1uLL);
            *v5 = v10;
            if (v10)
            {
              memcpy(v10, __src, __count);
              result = 0;
              *v3 = __count;
            }
            else
            {
              return 3758097085;
            }
          }
          else
          {
            return 3758097136;
          }
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_drain_backup_keys", ":", 2072, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t aks_drain_backup_keys_info(uint64_t a1)
{
  int v1;
  size_t *v2;
  size_t *v3;
  _QWORD *v4;
  _QWORD *v5;
  int v6;
  mach_port_t aks_client_connection;
  mach_port_t v8;
  uint64_t result;
  void *v10;
  size_t __count;
  uint64_t input[2];
  _BYTE __src[32768];
  uint64_t v14;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v6 = v1;
  v14 = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v8 = aks_client_connection;
    result = 3758097090;
    if (v5)
    {
      if (v3)
      {
        bzero(__src, 0x8000uLL);
        __count = 0x8000;
        input[0] = v6;
        input[1] = 1;
        result = IOConnectCallMethod(v8, 0x14u, input, 2u, 0, 0, 0, 0, __src, &__count);
        if (!(_DWORD)result)
        {
          if (__count)
          {
            if (__ROR8__(0xEF7BDEF7BDEF7BDFLL * __count, 2) > 0x210842108421084uLL)
            {
              return 3758604298;
            }
            else
            {
              v10 = calloc(__count, 1uLL);
              *v5 = v10;
              if (v10)
              {
                memcpy(v10, __src, __count);
                result = 0;
                *v3 = __count / 0x7C;
              }
              else
              {
                return 3758097085;
              }
            }
          }
          else
          {
            return 3758097136;
          }
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_drain_backup_keys_info", ":", 2100, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t aks_clear_backup_bag(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x16u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_clear_backup_bag", ":", 2129, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_set_backup_bag(uint64_t a1)
{
  int v1;
  _DWORD *v2;
  _DWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  mach_port_t aks_client_connection;
  mach_port_t v14;
  _BYTE *outputStruct;
  size_t *p_count;
  uint64_t v17;
  uint64_t result;
  void *v19;
  size_t __count;
  uint64_t input[5];
  _BYTE __src[32768];
  uint64_t v23;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = v1;
  v23 = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_backup_bag", ":", 2146, "", 0, "", "");
    return 3758097084;
  }
  v14 = aks_client_connection;
  if (v5)
  {
    if (!v3)
      return 3758097090;
    outputStruct = __src;
    p_count = &__count;
    v17 = 1;
  }
  else
  {
    p_count = 0;
    outputStruct = 0;
    v17 = 0;
  }
  bzero(__src, 0x8000uLL);
  __count = 0x8000;
  input[0] = v12;
  input[1] = v11;
  input[2] = v17;
  input[3] = v9;
  input[4] = v7;
  result = IOConnectCallMethod(v14, 0x15u, input, 5u, 0, 0, 0, 0, outputStruct, p_count);
  if (v5 && !(_DWORD)result)
  {
    v19 = calloc(__count, 1uLL);
    *v5 = v19;
    if (v19)
    {
      memcpy(v19, __src, __count);
      result = 0;
      *v3 = __count;
    }
    else
    {
      return 3758097085;
    }
  }
  return result;
}

uint64_t aks_make_public_backup_bag(int a1, _DWORD *a2)
{
  uint64_t v4;
  mach_port_t aks_client_connection;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
    {
      output = 0;
      input[0] = a1;
      outputCnt = 1;
      v4 = IOConnectCallMethod(aks_client_connection, 0x52u, input, 1u, 0, 0, &output, &outputCnt, 0, 0);
      if (!(_DWORD)v4)
        *a2 = output;
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_make_public_backup_bag", ":", 2178, "", 0, "", "");
  }
  return v4;
}

uint64_t aks_remote_session_reset(uint64_t a1)
{
  return remote_session_operate(a1);
}

uint64_t aks_remote_session_reset_all()
{
  return remote_session_operate(0);
}

uint64_t aks_get_device_state(uint64_t a1)
{
  return _get_device_state(a1);
}

uint64_t _get_device_state(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint32_t v4;
  uint32_t v5;
  uint64_t v6;
  mach_port_t aks_client_connection;
  mach_port_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  int v13[2];
  __int128 __s;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  int v19;
  _BYTE outputStruct[4096];
  uint64_t input[2];

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = v1;
  *(_QWORD *)v13 = 4096;
  v6 = 3758097084;
  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  __s = 0u;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (v3)
    {
      v8 = aks_client_connection;
      bzero(outputStruct, 0x1000uLL);
      v9 = IOConnectCallMethod(v8, v5, input, 1u, 0, 0, 0, 0, outputStruct, (size_t *)v13);
      if ((_DWORD)v9)
      {
        return v9;
      }
      else
      {
        v6 = 0;
        if (!decode_extended_state((uint64_t)outputStruct, v13[0], (char *)&__s))
        {
          v10 = v17;
          *(_OWORD *)(v3 + 32) = v16;
          *(_OWORD *)(v3 + 48) = v10;
          *(_WORD *)(v3 + 64) = v18;
          v11 = v15;
          *(_OWORD *)v3 = __s;
          *(_OWORD *)(v3 + 16) = v11;
        }
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_get_device_state", ":", 2224, "", 0, "", "");
  }
  return v6;
}

uint64_t aks_get_extended_device_state(uint64_t a1)
{
  return _get_device_state(a1);
}

uint64_t aks_remote_peer_get_state(uint64_t a1)
{
  int v1;
  _DWORD *v2;
  _DWORD *v3;
  size_t v4;
  size_t v5;
  const void *v6;
  const void *v7;
  uint64_t v8;
  mach_port_t aks_client_connection;
  mach_port_t v10;
  uint64_t v11;
  size_t v13[2];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t input;
  _BYTE outputStruct[4096];
  uint64_t v27;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = 3758097084;
  v13[0] = 4096;
  input = v1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (v3)
    {
      v10 = aks_client_connection;
      bzero(outputStruct, 0x1000uLL);
      memset_s(v3, 0x10uLL, 0, 0x10uLL);
      v11 = IOConnectCallMethod(v10, 0x39u, &input, 1u, v7, v5, 0, 0, outputStruct, v13);
      if ((_DWORD)v11)
      {
        return v11;
      }
      else
      {
        v18 = 0;
        v22 = 0u;
        v14 = 0u;
        v15 = 0u;
        v17 = 0u;
        v20 = 0u;
        v21 = 0u;
        v23 = 0u;
        v24 = 0;
        v13[1] = (size_t)der_key_peer_unlock_token_status;
        v16 = (unint64_t)der_key_peer_unwrapped_escrow_record_status;
        v19 = der_key_peer_wrapped_escrow_record_status;
        *(_QWORD *)&v22 = der_key_peer_flags;
        der_dict_iterate();
        *v3 = der_get_number();
        v3[1] = der_get_number();
        v3[2] = der_get_number();
        v8 = 0;
        v3[3] = der_get_number();
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_remote_peer_get_state", ":", 2255, "", 0, "", "");
  }
  return v8;
}

uint64_t aks_remote_peer_drop(int a1, const void *a2, size_t a3)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x3Au, input, 1u, a2, a3, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_remote_peer_drop", ":", 2292, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_lock_device(int a1, int a2)
{
  mach_port_t aks_client_connection;
  uint32_t v4;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
      v4 = 32;
    else
      v4 = 8;
    return IOConnectCallMethod(aks_client_connection, v4, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_lock_device", ":", 2307, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_lock_cx(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x8Du, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_lock_cx", ":", 2327, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_unlock_device(int a1, uint64_t a2, int a3)
{
  mach_port_t aks_client_connection;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  input[1] = a2;
  input[2] = a3;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 9u, input, 3u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unlock_device", ":", 2342, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_obliterate_class_d()
{
  mach_port_t aks_client_connection;

  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x13u, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_obliterate_class_d", ":", 2355, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_migrate_s_key(int a1, unsigned int a2, uint64_t a3, unsigned int a4, const void *a5, int a6)
{
  mach_port_t aks_client_connection;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    input[1] = a2;
    input[2] = a3;
    input[3] = a4;
    return IOConnectCallMethod(aks_client_connection, 0x3Fu, input, 4u, a5, a6, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_migrate_s_key", ":", 2367, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_smartcard_register(int a1, uint64_t a2, uint64_t a3, unsigned int a4, const void *a5, size_t a6, _QWORD *a7, size_t *a8)
{
  mach_port_t aks_client_connection;
  mach_port_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  size_t v17;
  size_t __count;
  _BYTE __src[2048];
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  input[1] = a4;
  input[2] = a2;
  input[3] = a3;
  __count = 2048;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v13 = aks_client_connection;
    bzero(__src, 0x800uLL);
    v14 = IOConnectCallMethod(v13, 0x3Bu, input, 4u, a5, a6, 0, 0, __src, &__count);
    if ((_DWORD)v14)
    {
      return v14;
    }
    else if (__count > 0x800)
    {
      return 3758604298;
    }
    else
    {
      v15 = 0;
      if (a7 && a8)
      {
        if (__count)
        {
          v16 = calloc(__count, 1uLL);
          *a7 = v16;
          if (!v16)
            return 3758097085;
          memcpy(v16, __src, __count);
          v17 = __count;
        }
        else
        {
          v17 = 0;
        }
        v15 = 0;
        *a8 = v17;
      }
    }
  }
  else
  {
    v15 = 3758097084;
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_smartcard_register", ":", 2388, "", 0, "", "");
  }
  return v15;
}

uint64_t aks_smartcard_unregister(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x3Cu, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_smartcard_unregister", ":", 2412, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_smartcard_request_unlock(int a1, const void *a2, size_t a3, _QWORD *a4, size_t *a5)
{
  mach_port_t aks_client_connection;
  mach_port_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  size_t v14;
  size_t __count;
  _BYTE __src[2048];
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  __count = 2048;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v10 = aks_client_connection;
    bzero(__src, 0x800uLL);
    v11 = IOConnectCallMethod(v10, 0x3Du, input, 1u, a2, a3, 0, 0, __src, &__count);
    if ((_DWORD)v11)
    {
      return v11;
    }
    else if (__count > 0x800)
    {
      return 3758604298;
    }
    else
    {
      v12 = 0;
      if (a4 && a5)
      {
        if (__count)
        {
          v13 = calloc(__count, 1uLL);
          *a4 = v13;
          if (!v13)
            return 3758097085;
          memcpy(v13, __src, __count);
          v14 = __count;
        }
        else
        {
          v14 = 0;
        }
        v12 = 0;
        *a5 = v14;
      }
    }
  }
  else
  {
    v12 = 3758097084;
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_smartcard_request_unlock", ":", 2429, "", 0, "", "");
  }
  return v12;
}

uint64_t aks_smartcard_unlock(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, size_t *a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  mach_port_t aks_client_connection;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  size_t v19;
  size_t __count;
  unsigned int inputStructCnt[3];
  _BYTE __src[2048];
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(__src, 0x800uLL);
  __count = 2048;
  aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 2, v10, v11, v12, v13, v14, a2);
  if (!*(_QWORD *)&inputStructCnt[1])
  {
    v17 = 3758097085;
    goto LABEL_12;
  }
  aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_smartcard_unlock", ":", 2460, "", 0, "", "");
    v17 = 3758097084;
    goto LABEL_12;
  }
  v16 = IOConnectCallMethod(aks_client_connection, 0x3Eu, input, 1u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, __src, &__count);
  if ((_DWORD)v16)
  {
    v17 = v16;
    goto LABEL_12;
  }
  if (__count > 0x800)
  {
    v17 = 3758604298;
    goto LABEL_12;
  }
  v17 = 0;
  if (a6 && a7)
  {
    if (!__count)
    {
      v19 = 0;
      goto LABEL_11;
    }
    v18 = calloc(__count, 1uLL);
    *a6 = v18;
    v17 = 3758097085;
    if (v18)
    {
      memcpy(v18, __src, __count);
      v19 = __count;
LABEL_11:
      v17 = 0;
      *a7 = v19;
    }
  }
LABEL_12:
  free(*(void **)&inputStructCnt[1]);
  return v17;
}

uint64_t aks_smartcard_get_sc_usk(unint64_t a1, uint64_t a2, uint64_t *a3, _QWORD *a4)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a3 && a4)
  {
    if (aks_smartcard_get_foo((uint64_t)der_key_sc_enc_sc_usk, 0, a1, a2, a3, a4))
      return 0xFFFFFFFFLL;
    else
      return 0;
  }
  return result;
}

uint64_t aks_smartcard_get_foo(uint64_t a1, int a2, unint64_t a3, uint64_t a4, uint64_t *a5, _QWORD *a6)
{
  uint64_t result;
  uint64_t number;
  uint64_t v11;
  uint64_t v12;

  result = 0xFFFFFFFFLL;
  if (a6 && a3 && a4 && a5 && a3 + a4 > a3)
  {
    der_dict_iterate();
    if (a2)
    {
      if (*a6 == 8)
      {
        number = der_get_number();
        result = 0;
        *a5 = number;
        return result;
      }
      return 0xFFFFFFFFLL;
    }
    v11 = ccder_decode_tl();
    if (!v11)
      return 0xFFFFFFFFLL;
    v12 = v11;
    result = 0;
    *a5 = v12;
    *a6 = 0;
  }
  return result;
}

uint64_t aks_smartcard_get_ec_pub(unint64_t a1, uint64_t a2, uint64_t *a3, _QWORD *a4)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a3 && a4)
  {
    if (aks_smartcard_get_foo((uint64_t)der_key_sc_auth_eph_pub, 0, a1, a2, a3, a4))
      return 0xFFFFFFFFLL;
    else
      return 0;
  }
  return result;
}

uint64_t aks_smartcard_get_mode(unint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v5 = 8;
  if (!a3)
    return 0xFFFFFFFFLL;
  v6 = 0;
  result = aks_smartcard_get_foo((uint64_t)der_key_sc_auth_mode, 1, a1, a2, &v6, &v5);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  *a3 = v6;
  return result;
}

uint64_t aks_smartcard_get_version(unint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v5 = 8;
  if (!a3)
    return 0xFFFFFFFFLL;
  v6 = 0;
  result = aks_smartcard_get_foo((uint64_t)der_key_sc_auth_version, 1, a1, a2, &v6, &v5);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  *a3 = v6;
  return result;
}

uint64_t aks_se_fail(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x47u, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_fail", ":", 2589, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_se_set_healthy(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x49u, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_set_healthy", ":", 2605, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_se_set_secret(int a1, uint64_t a2, uint64_t a3)
{
  return __aks_se_set_secret(a1, a2, a3, 0x45u);
}

uint64_t __aks_se_set_secret(int a1, uint64_t a2, uint64_t a3, uint32_t a4)
{
  mach_port_t aks_client_connection;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  input[1] = a2;
  input[2] = a3;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, a4, input, 3u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "__aks_se_set_secret", ":", 2621, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_se_set_secret_memento(int a1, uint64_t a2, uint64_t a3)
{
  return __aks_se_set_secret(a1, a2, a3, 0x8Cu);
}

uint64_t aks_se_recover(int a1, uint64_t a2, uint64_t a3)
{
  mach_port_t aks_client_connection;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  input[1] = a2;
  input[2] = a3;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x46u, input, 3u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_recover", ":", 2649, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_change_secret_epilogue(int a1, uint64_t a2, uint64_t a3)
{
  mach_port_t aks_client_connection;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  input[1] = a2;
  input[2] = a3;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x69u, input, 3u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_change_secret_epilogue", ":", 2665, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_se_get_reset_token_for_memento_secret(uint64_t a1)
{
  int v1;
  _BYTE *v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  mach_port_t aks_client_connection;
  uint64_t v7;
  unint64_t number;
  uint64_t v9;
  rsize_t __n[2];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  _BYTE __s[4096];
  uint64_t input[4];

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = v1;
  input[1] = v4;
  input[2] = v5;
  bzero(__s, 0x1000uLL);
  __n[0] = 4096;
  aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    v9 = 3758097084;
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_get_reset_token_for_memento_secret", ":", 2683, "", 0, "", "");
    goto LABEL_10;
  }
  v7 = IOConnectCallMethod(aks_client_connection, 0x48u, input, 3u, 0, 0, 0, 0, __s, __n);
  if ((_DWORD)v7)
  {
    v9 = v7;
    goto LABEL_10;
  }
  if (__n[0] - 4097 < 0xFFFFFFFFFFFFF000)
  {
    v9 = 3758604298;
    goto LABEL_10;
  }
  v16 = 0;
  v15 = 0u;
  v13 = 0u;
  v12 = 0u;
  __n[1] = (rsize_t)der_key_config_se_reset_token;
  v14 = (unint64_t)der_key_config_se_slot;
  der_dict_iterate();
  if ((_QWORD)v12)
  {
    ccder_decode_tl();
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  if (!*((_QWORD *)&v14 + 1))
    goto LABEL_9;
  number = der_get_number();
  if (number > 0xFF)
    goto LABEL_9;
  v9 = 0;
  *v3 = number;
LABEL_10:
  memset_s(__s, __n[0], 0, __n[0]);
  return v9;
}

uint64_t aks_se_get_reset_token(uint64_t a1)
{
  return aks_se_get_reset_token_for_memento_secret(a1);
}

uint64_t aks_se_set_nonce(int a1, const void *a2, size_t a3)
{
  mach_port_t aks_client_connection;
  size_t v6;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
      v6 = a3;
    else
      v6 = 0;
    return IOConnectCallMethod(aks_client_connection, 0x58u, input, 1u, a2, v6, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_set_nonce", ":", 2737, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_se_get_reset_sig(uint64_t a1)
{
  int v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  mach_port_t aks_client_connection;
  uint64_t v12;
  _BYTE *v13;
  int v14;
  void *v15;
  size_t v16;
  size_t __n;
  int __s;
  char v20;
  _BYTE v21[3];
  uint64_t input[2];

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = v1;
  bzero(&__s, 0x1000uLL);
  __n = 4096;
  v10 = 3758097090;
  if (v9)
  {
    if (v7)
    {
      v10 = 3758097090;
      if (v5)
      {
        if (v3)
        {
          aks_client_connection = get_aks_client_connection();
          if (aks_client_connection)
          {
            v12 = IOConnectCallMethod(aks_client_connection, 0x5Au, input, 1u, 0, 0, 0, 0, &__s, &__n);
            if ((_DWORD)v12)
            {
              v10 = v12;
            }
            else if (__n - 4097 < 0xFFFFFFFFFFFFF005)
            {
              v10 = 3758604298;
            }
            else
            {
              v13 = calloc(5uLL, 1uLL);
              *v5 = v13;
              if (v13)
              {
                *v3 = 5;
                v14 = __s;
                v13[4] = v20;
                *(_DWORD *)v13 = v14;
                v15 = calloc(__n - 5, 1uLL);
                *v9 = v15;
                v10 = 3758097085;
                if (v15)
                {
                  v16 = __n;
                  *v7 = __n - 5;
                  memcpy(v15, v21, v16);
                  v10 = 0;
                }
              }
              else
              {
                v10 = 3758097085;
              }
            }
          }
          else
          {
            fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_get_reset_sig", ":", 2759, "", 0, "", "");
            v10 = 3758097084;
          }
        }
      }
    }
  }
  memset_s(&__s, __n, 0, __n);
  return v10;
}

uint64_t aks_se_get_reset_pubkey(uint64_t a1)
{
  int v1;
  size_t *v2;
  size_t *v3;
  _QWORD *v4;
  _QWORD *v5;
  size_t v6;
  uint64_t v7;
  mach_port_t aks_client_connection;
  uint64_t v9;
  void *v10;
  size_t __count;
  _BYTE __src[4096];
  uint64_t input[2];

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = v1;
  v6 = 4096;
  bzero(__src, 0x1000uLL);
  __count = 4096;
  v7 = 3758097090;
  if (v5 && v3)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v9 = IOConnectCallMethod(aks_client_connection, 0x59u, input, 1u, 0, 0, 0, 0, __src, &__count);
      v6 = __count;
      if ((_DWORD)v9)
      {
        v7 = v9;
      }
      else if (__count - 4097 < 0xFFFFFFFFFFFFF000)
      {
        v7 = 3758604298;
      }
      else
      {
        v10 = calloc(__count, 1uLL);
        *v5 = v10;
        v6 = __count;
        if (v10)
        {
          *v3 = __count;
          memcpy(v10, __src, v6);
          v7 = 0;
          v6 = __count;
        }
        else
        {
          v7 = 3758097085;
        }
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_get_reset_pubkey", ":", 2791, "", 0, "", "");
      v6 = 4096;
      v7 = 3758097084;
    }
  }
  memset_s(__src, v6, 0, v6);
  return v7;
}

uint64_t aks_se_delete_reset_token(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x5Bu, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_delete_reset_token", ":", 2815, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_se_support_in_rm(unsigned int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x5Eu, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_support_in_rm", ":", 2832, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_se_support_in_rm_is_set(BOOL *a1)
{
  mach_port_t aks_client_connection;
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  output[0] = 0;
  outputCnt = 1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    result = IOConnectCallMethod(aks_client_connection, 0x6Bu, 0, 0, 0, 0, output, &outputCnt, 0, 0);
    if (a1)
    {
      if (!(_DWORD)result)
        *a1 = output[0] != 0;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_support_in_rm_is_set", ":", 2848, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t aks_se_stage_stash()
{
  mach_port_t aks_client_connection;

  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x5Fu, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_stage_stash", ":", 2865, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_fv_lock_volume_bag()
{
  return aks_fv_set_protection(0);
}

uint64_t aks_fv_unwrap_vek(uint64_t a1)
{
  return aks_fv_unwrap_vek_with_acm(a1);
}

uint64_t aks_fv_get_blob_state(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  mach_port_t aks_client_connection;
  mach_port_t v9;
  uint64_t v10;
  __int128 v12;
  int v13[2];
  _BYTE __s[4096];
  uint64_t v15;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v6 = v1;
  v15 = *MEMORY[0x24BDAC8D0];
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v12 = __s;
  *((_QWORD *)&v12 + 1) = &v15;
  *(_QWORD *)v13 = 4096;
  v7 = 3758097090;
  if (v5 && v3)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v9 = aks_client_connection;
      if (der_utils_encode_fv_data(&v12, v5) && der_utils_encode_fv_params(&v12, v6))
      {
        v7 = 3758097098;
        if (ccder_blob_encode_tl())
        {
          v10 = IOConnectCallMethod(v9, 0x55u, 0, 0, *((const void **)&v12 + 1), (size_t)&v15 - *((_QWORD *)&v12 + 1), 0, 0, __s, (size_t *)v13);
          if (!(_DWORD)v10)
            v10 = decode_fv_blob_state((uint64_t)__s, *(uint64_t *)v13, v3);
          v7 = v10;
        }
      }
      else
      {
        v7 = 3758097098;
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_get_blob_state", ":", 2900, "", 0, "", "");
      v7 = 3758097084;
    }
  }
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v7;
}

uint64_t aks_fv_get_last_known_gp_state(__int128 *a1)
{
  uint64_t v1;
  __int128 v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char v7;

  v7 = 0;
  v5 = &v7;
  v6 = 1;
  v3 = 0uLL;
  v4 = 0;
  if (a1)
  {
    v3 = *a1;
    v4 = *((_QWORD *)a1 + 2);
    v1 = *((_QWORD *)&v3 + 1) | 0x10;
  }
  else
  {
    v1 = 16;
  }
  *((_QWORD *)&v3 + 1) = v1;
  return aks_fv_get_blob_state((uint64_t)&v3);
}

uint64_t aks_fv_get_size(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  mach_port_t aks_client_connection;
  mach_port_t v8;
  __int128 v10;
  uint32_t outputCnt;
  _BYTE __s[4096];
  uint64_t output;
  uint64_t input[2];

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v4 = v1;
  input[1] = *MEMORY[0x24BDAC8D0];
  v5 = 3758097098;
  output = 0;
  input[0] = v6;
  outputCnt = 1;
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v10 = __s;
  *((_QWORD *)&v10 + 1) = &output;
  if (v3)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v8 = aks_client_connection;
      if (der_utils_encode_fv_params(&v10, v4))
      {
        if (ccder_blob_encode_tl())
        {
          v5 = IOConnectCallMethod(v8, 0x4Eu, input, 1u, *((const void **)&v10 + 1), (size_t)&input[-1] - *((_QWORD *)&v10 + 1), &output, &outputCnt, 0, 0);
          if (!(_DWORD)v5)
            *v3 = output;
        }
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_get_size", ":", 2943, "", 0, "", "");
      v5 = 3758097084;
    }
  }
  else
  {
    v5 = 3758097090;
  }
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v5;
}

uint64_t aks_fv_import(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  mach_port_t aks_client_connection;
  mach_port_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  size_t v17;
  _BYTE __s[4096];
  uint64_t input[2];

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = v1;
  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = v9;
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v16 = __s;
  *((_QWORD *)&v16 + 1) = input;
  v17 = 4096;
  v10 = 3758097090;
  if (v7 && v5)
  {
    aks_client_connection = get_aks_client_connection();
    if (!aks_client_connection)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_import", ":", 2971, "", 0, "", "");
      v10 = 3758097084;
      goto LABEL_14;
    }
    v12 = aks_client_connection;
    if (!ccder_blob_encode_body_tl()
      || !der_utils_encode_fv_data(&v16, v7)
      || !der_utils_encode_fv_params(&v16, v8)
      || !ccder_blob_encode_tl())
    {
      goto LABEL_12;
    }
    v13 = IOConnectCallMethod(v12, 0x4Fu, input, 1u, *((const void **)&v16 + 1), (size_t)input - *((_QWORD *)&v16 + 1), 0, 0, __s, &v17);
    if ((_DWORD)v13)
    {
      v10 = v13;
      goto LABEL_14;
    }
    *(_QWORD *)&v15 = __s;
    *((_QWORD *)&v15 + 1) = &__s[v17];
    if (!ccder_blob_decode_range())
      goto LABEL_12;
    if (!v3)
    {
      v10 = 0;
      goto LABEL_14;
    }
    v10 = 0;
    if ((der_utils_decode_fv_data(&v15, 0, v3) & 1) == 0)
LABEL_12:
      v10 = 3758097098;
  }
LABEL_14:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v10;
}

uint64_t aks_fv_get_verifier_size()
{
  return aks_fv_get_size(0);
}

uint64_t aks_fv_get_access_token_size()
{
  return aks_fv_get_size(0);
}

uint64_t aks_fv_new_verifier()
{
  return aks_fv_new_kek(0);
}

uint64_t aks_fv_rewrap_verifier()
{
  return aks_fv_rewrap_kek(0);
}

uint64_t aks_fv_new_access_token()
{
  _QWORD v1[3];

  v1[0] = 0;
  v1[1] = 2;
  v1[2] = 0;
  return aks_fv_new_vek((uint64_t)v1);
}

uint64_t aks_fv_new_unbound_access_token(char a1)
{
  uint64_t v1;
  _QWORD v3[3];

  v1 = 130;
  if ((a1 & 6) == 0)
    v1 = 2;
  v3[0] = 0;
  v3[1] = v1;
  v3[2] = 0;
  return aks_fv_new_vek((uint64_t)v3);
}

uint64_t aks_fv_bind_access_token()
{
  return aks_fv_set_protection(0);
}

uint64_t aks_fv_is_access_token_unbound(uint64_t a1, BOOL *a2)
{
  uint64_t result;
  _QWORD v4[3];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  memset(v4, 0, sizeof(v4));
  v10 = 0;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v5 = 0u;
  if (!a2)
    return 3758097090;
  result = aks_fv_get_blob_state((uint64_t)v4);
  if (!(_DWORD)result)
  {
    if ((_DWORD)v5 == 1)
    {
      result = 0;
      *a2 = (DWORD1(v7) & 0x8000000) != 0;
    }
    else
    {
      return 3758604312;
    }
  }
  return result;
}

uint64_t aks_fv_load_access_token_as_system_keychain()
{
  return aks_fv_set_protection(0);
}

uint64_t aks_fv_verify_user_opts()
{
  return aks_fv_unwrap_vek_with_acm(0);
}

uint64_t aks_fv_grant_ownership(uint64_t a1)
{
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
  __int128 v13;
  __int128 v14;
  _BYTE v15[4096];
  _BYTE v16[4096];
  uint64_t v17;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = v1;
  v17 = *MEMORY[0x24BDAC8D0];
  v11 = 3758097098;
  bzero(v16, 0x1000uLL);
  bzero(v15, 0x1000uLL);
  *(_QWORD *)&v14 = v16;
  *((_QWORD *)&v14 + 1) = &v17;
  *(_QWORD *)&v13 = v15;
  *((_QWORD *)&v13 + 1) = v16;
  if (der_utils_encode_fv_data(&v14, v9)
    && der_utils_encode_fv_data(&v14, v7)
    && ccder_blob_encode_tl()
    && der_utils_encode_fv_data(&v13, v5)
    && der_utils_encode_fv_data(&v13, v3)
    && ccder_blob_encode_tl())
  {
    return aks_fv_set_protection(v10);
  }
  return v11;
}

uint64_t aks_fv_owners_exist(uint64_t a1)
{
  return aks_fv_set_protection(a1);
}

uint64_t aks_fv_remove_external_kek_group(uint64_t a1)
{
  _QWORD v2[4];

  v2[3] = a1;
  memset(v2, 0, 24);
  return aks_fv_set_protection((uint64_t)v2);
}

uint64_t aks_fv_sidp_status(uint64_t a1)
{
  uint64_t v1;
  _BYTE *v2;
  _BYTE *v3;
  _BYTE *v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t result;
  _BYTE v8[16384];
  uint64_t v9;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v6 = v1;
  v9 = *MEMORY[0x24BDAC8D0];
  bzero(v8, 0x4000uLL);
  result = aks_fv_set_protection(v6);
  if (!(_DWORD)result)
  {
    if (ccder_decode_sequence_tl() && ccder_decode_tl())
    {
      __memcpy_chk();
      if (v5)
        *v5 = 0;
      if (v3)
        *v3 = 0;
      return 0;
    }
    else
    {
      return 3758097084;
    }
  }
  return result;
}

uint64_t aks_fv_stash_kek()
{
  return aks_fv_set_protection(0);
}

uint64_t aks_fv_stash_kek_with_secret(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = 8;
  if (a1)
    v1 = 12;
  v4 = 0;
  v5 = v1;
  v6 = 0;
  v2 = aks_fv_set_protection((uint64_t)&v4);
  syslog(6, "aks_fv_prot_cmd_stash_kek(%llu) = %d", v5, v2);
  return v2;
}

uint64_t aks_fv_commit_stashed_kek()
{
  uint64_t v0;

  v0 = aks_fv_set_protection(0);
  syslog(6, "aks_fv_prot_cmd_stash_commit = %d", v0);
  return v0;
}

uint64_t aks_fv_destroy_stashed_kek()
{
  uint64_t v0;

  v0 = aks_fv_set_protection(0);
  syslog(6, "aks_fv_prot_cmd_stash_destroy = %d", v0);
  return v0;
}

uint64_t aks_fv_verify_user()
{
  return aks_fv_unwrap_vek_with_acm(0);
}

uint64_t aks_fv_delete_verifier()
{
  return aks_fv_set_protection(0);
}

uint64_t aks_absinthe_collection(uint64_t a1)
{
  unsigned int v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  mach_port_t aks_client_connection;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  mach_port_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  unsigned int inputStructCnt[3];
  size_t __count;
  _BYTE __src[32768];
  uint64_t input[2];

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  input[1] = *MEMORY[0x24BDAC8D0];
  v8 = 3758097084;
  input[0] = v1;
  bzero(__src, 0x8000uLL);
  __count = 0x8000;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  if (v5)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v15 = aks_client_connection;
      if (v7)
        v16 = v7;
      else
        v16 = "";
      aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 2, v10, v11, v12, v13, v14, (uint64_t)v16);
      v17 = IOConnectCallMethod(v15, 0x50u, input, 1u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, __src, &__count);
      if ((_DWORD)v17)
      {
        v8 = v17;
      }
      else
      {
        v18 = calloc(__count, 1uLL);
        *v5 = v18;
        if (v18)
        {
          memcpy(v18, __src, __count);
          v8 = 0;
          *v3 = (int)__count;
        }
        else
        {
          v8 = 3758097085;
        }
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_absinthe_collection", ":", 3220, "", 0, "", "");
    }
  }
  else
  {
    v8 = 3758097090;
  }
  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  free(*(void **)&inputStructCnt[1]);
  return v8;
}

uint64_t aks_absinthe_generate(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, size_t *a7)
{
  uint64_t v7;
  mach_port_t aks_client_connection;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  mach_port_t v17;
  size_t v19;
  int v20;
  char *v21;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  input[0] = a1;
  v20 = 0;
  v7 = 3758097090;
  if (a2 && a6 && a7)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v17 = aks_client_connection;
      aks_pack_data(&v21, (unsigned int *)&v20, 2, v12, v13, v14, v15, v16, a2);
      v19 = *a7;
      v7 = IOConnectCallMethod(v17, 0x51u, input, 1u, v21, v20, 0, 0, a6, &v19);
      if (!(_DWORD)v7)
        *a7 = (int)v19;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_absinthe_generate", ":", 3253, "", 0, "", "");
      v7 = 3758097084;
    }
  }
  free(v21);
  return v7;
}

uint64_t aks_drop_auxiliary_auth_by_uid(unsigned int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = 0;
  input[1] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x53u, input, 2u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_drop_auxiliary_auth_by_uid", ":", 3280, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_drop_auxiliary_auth_by_handle(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = 1;
  input[1] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x53u, input, 2u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_drop_auxiliary_auth_by_handle", ":", 3296, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_lower_iteration_count()
{
  mach_port_t aks_client_connection;

  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x5Cu, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_lower_iteration_count", ":", 3310, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_se_secret_drop(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x6Au, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_secret_drop", ":", 3326, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_get_current_sep_measurement(uint64_t a1, uint64_t a2)
{
  if (a1 && a2 && !aks_get_internal_info_for_key(0xFFFFFFFFLL))
    der_dict_get_data((uint64_t)der_key_sep_measurement);
  free(0);
  return 3758097084;
}

uint64_t aks_get_internal_info(uint64_t a1)
{
  return aks_get_internal_info_for_key(a1);
}

uint64_t aks_get_seconds_since_passcode_change(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  time_t v4;
  time_t v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = 3758097084;
  v8 = 0;
  v9 = 0;
  v7 = 0;
  if (!aks_get_internal_info_for_key(a1)
    && der_dict_get_number((uint64_t)der_key_passcode_change_time, (uint64_t)v9, (uint64_t)v9 + v8, (uint64_t)&v7))
  {
    if (a2)
    {
      v4 = time(0);
      v3 = 0;
      v5 = v4 - v7;
      if (v4 <= v7)
        v5 = 0;
      *a2 = v5;
    }
    else
    {
      v3 = 0;
    }
  }
  free(v9);
  return v3;
}

uint64_t aks_get_internal_state(uint64_t a1)
{
  int v1;
  char *v2;
  char *v3;
  uint64_t v4;
  mach_port_t aks_client_connection;
  uint64_t v6;
  rsize_t v7;
  rsize_t __n;
  _BYTE __s[4096];
  uint64_t input[2];

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  input[1] = *MEMORY[0x24BDAC8D0];
  v4 = 3758097090;
  input[0] = v1;
  bzero(__s, 0x1000uLL);
  __n = 4096;
  aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_internal_state", ":", 3405, "", 0, "", "");
    v4 = 3758097084;
    goto LABEL_11;
  }
  if (!v3)
  {
LABEL_11:
    v7 = 4096;
    goto LABEL_9;
  }
  v6 = IOConnectCallMethod(aks_client_connection, 0x8Eu, input, 1u, 0, 0, 0, 0, __s, &__n);
  v7 = __n;
  if ((_DWORD)v6)
  {
    v4 = v6;
  }
  else if (__n - 4097 >= 0xFFFFFFFFFFFFF000)
  {
    if (decode_extended_state((uint64_t)__s, __n, v3))
      v4 = 3758097090;
    else
      v4 = 0;
    v7 = __n;
  }
LABEL_9:
  memset_s(__s, v7, 0, v7);
  return v4;
}

uint64_t aks_fairplay_wrap(const void *a1, size_t a2, void *a3, size_t *a4)
{
  uint64_t result;
  mach_port_t aks_client_connection;
  size_t v10;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = 266;
  result = 3758097090;
  if (a3 && a4)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v10 = *a4;
      result = IOConnectCallMethod(aks_client_connection, 0x68u, input, 1u, a1, a2, 0, 0, a3, &v10);
      if (!(_DWORD)result)
        *a4 = (int)v10;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fairplay_wrap", ":", 3431, "", 0, "", "");
      return 3758097084;
    }
  }
  return result;
}

uint64_t _fairplay_generate_csk_internal(unsigned int a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  uint64_t result;
  mach_port_t aks_client_connection;
  size_t v11;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = ((unint64_t)a1 << 8) | 1;
  result = 3758097090;
  if (a4 && a5)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v11 = *a5;
      result = IOConnectCallMethod(aks_client_connection, 0x68u, input, 1u, a2, a3, 0, 0, a4, &v11);
      if (!(_DWORD)result)
        *a5 = (int)v11;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_fairplay_generate_csk_internal", ":", 3455, "", 0, "", "");
      return 3758097084;
    }
  }
  return result;
}

uint64_t aks_fairplay_generate_csk(const void *a1, size_t a2, void *a3, size_t *a4)
{
  return _fairplay_generate_csk_internal(0, a1, a2, a3, a4);
}

uint64_t aks_fairplay_generate_csk_v1(const void *a1, size_t a2, void *a3, size_t *a4)
{
  return _fairplay_generate_csk_internal(1u, a1, a2, a3, a4);
}

uint64_t aks_bak_get_beacon_internal(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  size_t v6;
  size_t v7;
  const void *v8;
  const void *v9;
  uint64_t v10;
  mach_port_t aks_client_connection;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  size_t v16;
  uint64_t input[2];
  _BYTE __s[16384];
  __int128 v19;
  _BYTE v20[28];
  uint64_t v21;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = v1;
  v21 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  memset(v20, 0, sizeof(v20));
  bzero(__s, 0x4000uLL);
  v16 = 0x4000;
  input[0] = 1;
  input[1] = v10;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v12 = IOConnectCallMethod(aks_client_connection, 0x87u, input, 2u, v9, v7, 0, 0, __s, &v16);
    if ((_DWORD)v12)
    {
      v14 = v12;
    }
    else
    {
      __memcpy_chk();
      *v3 = 44;
      v13 = calloc(0x2CuLL, 1uLL);
      *v5 = v13;
      if (v13)
      {
        __memcpy_chk();
        v14 = 0;
      }
      else
      {
        v14 = 3758097085;
      }
    }
  }
  else
  {
    v14 = 3758097084;
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_bak_get_beacon_internal", ":", 3491, "", 0, "", "");
  }
  memset_s(__s, 0x4000uLL, 0, 0x4000uLL);
  return v14;
}

uint64_t aks_bak_get_beacon(int a1, unsigned int a2)
{
  uint64_t beacon_internal;

  beacon_internal = aks_bak_get_beacon_internal(a1 ^ 1u | ((unint64_t)a2 << 16));
  if ((_DWORD)beacon_internal)
    return beacon_internal;
  else
    return 3758604312;
}

uint64_t aks_bak_get_swizzler_internal(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  mach_port_t aks_client_connection;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  __int128 v14;
  __int128 v15;
  _OWORD *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  size_t v25;
  _BYTE __s[16384];
  _QWORD v27[6];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  int v37;
  uint64_t input[3];

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = 2;
  input[1] = v1;
  v37 = 0;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v28 = 0u;
  memset(v27, 0, sizeof(v27));
  bzero(__s, 0x4000uLL);
  v25 = 0x4000;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v11 = IOConnectCallMethod(aks_client_connection, 0x87u, input, 2u, 0, 0, 0, 0, __s, &v25);
    if ((_DWORD)v11)
    {
      v12 = v11;
    }
    else
    {
      v12 = 3758097085;
      __memcpy_chk();
      v13 = calloc(0x28uLL, 1uLL);
      *v9 = v13;
      if (v13)
      {
        *v7 = 40;
        v14 = *(_OWORD *)&v27[1];
        v15 = *(_OWORD *)&v27[3];
        v13[4] = v27[5];
        *(_OWORD *)v13 = v14;
        *((_OWORD *)v13 + 1) = v15;
        v16 = calloc(0x91uLL, 1uLL);
        *v5 = v16;
        if (v16)
        {
          v12 = 0;
          *v3 = 145;
          v17 = v29;
          *v16 = v28;
          v16[1] = v17;
          v18 = v30;
          v19 = v31;
          v20 = v33;
          v16[4] = v32;
          v16[5] = v20;
          v16[2] = v18;
          v16[3] = v19;
          v21 = v34;
          v22 = v35;
          v23 = v36;
          *((_BYTE *)v16 + 144) = v37;
          v16[7] = v22;
          v16[8] = v23;
          v16[6] = v21;
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_bak_get_swizzler_internal", ":", 3551, "", 0, "", "");
    v12 = 3758097084;
  }
  memset_s(__s, 0x4000uLL, 0, 0x4000uLL);
  memset_s(v27, 0xC4uLL, 0, 0xC4uLL);
  return v12;
}

uint64_t aks_bak_get_swizzler()
{
  return aks_bak_get_swizzler_internal(0);
}

uint64_t aks_test_stashed_kek(uint64_t a1)
{
  mach_port_t akstest_client_connection;

  akstest_client_connection = get_akstest_client_connection();
  if (akstest_client_connection)
    return IOConnectCallMethod(akstest_client_connection, 0xCu, 0, 0, *(const void **)a1, *(_QWORD *)(a1 + 8), 0, 0, 0, 0);
  else
    return 3758097084;
}

uint64_t aks_get_dsme_key(uint64_t a1)
{
  uint64_t v1;
  size_t *v2;
  size_t *v3;
  _QWORD *v4;
  mach_port_t aks_client_connection;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  size_t v9;
  size_t __count;
  _BYTE __src[16384];
  uint64_t v13;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v4 = (_QWORD *)v1;
  v13 = *MEMORY[0x24BDAC8D0];
  bzero(__src, 0x4000uLL);
  __count = 0x4000;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v6 = 3758097090;
    if (v4 && v3)
    {
      v7 = IOConnectCallMethod(aks_client_connection, 0x96u, 0, 0, 0, 0, 0, 0, __src, &__count);
      if ((_DWORD)v7)
      {
        v6 = v7;
      }
      else
      {
        v8 = calloc(__count, 1uLL);
        *v4 = v8;
        if (v8)
        {
          v9 = __count;
          *v3 = __count;
          memcpy(v8, __src, v9);
          v6 = 0;
        }
        else
        {
          v6 = 3758097085;
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_dsme_key", ":", 3600, "", 0, "", "");
    v6 = 3758097084;
  }
  memset_s(__src, 0x4000uLL, 0, 0x4000uLL);
  return v6;
}

BOOL aks_bag_in_xart(uint64_t a1, uint64_t a2)
{
  return a2 == 4 || a2 == 32;
}

uint64_t aks_prewarm_sps()
{
  mach_port_t aks_client_connection;

  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x73u, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_prewarm_sps", ":", 3627, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_sealed_hashes_set(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  mach_port_t aks_client_connection;
  mach_port_t v6;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  char *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = 4294967285;
  if (a3 && a4 <= 0x30)
  {
    v4 = 3758097084;
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v6 = aks_client_connection;
      ccder_sizeof_raw_octet_string();
      ccder_sizeof_uint64();
      ccder_sizeof_raw_octet_string();
      v7 = ccder_sizeof();
      v8 = v7;
      MEMORY[0x24BDAC7A8](v7);
      v10 = (char *)v12 - v9;
      bzero((char *)v12 - v9, v8);
      ccder_encode_raw_octet_string();
      ccder_encode_uint64();
      ccder_encode_raw_octet_string();
      if ((char *)ccder_encode_constructed_tl() == v10)
        return IOConnectCallMethod(v6, 0x72u, 0, 0, v10, v8, 0, 0, 0, 0);
      else
        return 3758097090;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_sealed_hashes_set", ":", 3644, "", 0, "", "");
    }
  }
  return v4;
}

uint64_t aks_measure_and_seal_cryptex_manifest(const void *a1, size_t a2)
{
  mach_port_t aks_client_connection;

  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x90u, 0, 0, a1, a2, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_measure_and_seal_cryptex_manifest", ":", 3674, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_seal_cryptex_manifest_lock()
{
  mach_port_t aks_client_connection;

  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x95u, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_seal_cryptex_manifest_lock", ":", 3688, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_lkgp_recover(int a1, uint64_t a2, uint64_t a3)
{
  mach_port_t aks_client_connection;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  input[1] = a2;
  input[2] = a3;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x85u, input, 3u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_lkgp_recover", ":", 3704, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_memento_efface_blob(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x8Au, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_memento_efface_blob", ":", 3720, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_memento_get_state(uint64_t a1)
{
  int v1;
  _BYTE *v2;
  _BYTE *v3;
  mach_port_t aks_client_connection;
  uint64_t v5;
  rsize_t v6;
  uint64_t v7;
  rsize_t __n;
  _BYTE __s[4096];
  uint64_t input[2];

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = v1;
  bzero(__s, 0x1000uLL);
  __n = 4096;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v5 = IOConnectCallMethod(aks_client_connection, 0x8Bu, input, 1u, 0, 0, 0, 0, __s, &__n);
    v6 = __n;
    if ((_DWORD)v5)
    {
      v7 = v5;
    }
    else
    {
      v7 = 3758097090;
      if (__n - 4097 >= 0xFFFFFFFFFFFFF000)
      {
        if (decode_memento_state((uint64_t)__s, __n, v3))
          v7 = 3758097090;
        else
          v7 = 0;
        v6 = __n;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_memento_get_state", ":", 3738, "", 0, "", "");
    v7 = 3758097084;
    v6 = 4096;
  }
  memset_s(__s, v6, 0, v6);
  return v7;
}

uint64_t aks_set_jcop_supports_updated_kud_policy()
{
  mach_port_t aks_client_connection;
  uint64_t input;

  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x89u, &input, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_jcop_supports_updated_kud_policy", ":", 3758, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_set_cx_window(uint64_t a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x97u, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_cx_window", ":", 3774, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_get_cx_window(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  mach_port_t aks_client_connection;
  mach_port_t v4;
  uint64_t result;
  size_t v6;
  _QWORD outputStruct[513];

  v1 = MEMORY[0x24BDAC7A8](a1);
  outputStruct[512] = *MEMORY[0x24BDAC8D0];
  v6 = 4096;
  if (!v1)
    return 4294967285;
  v2 = (_QWORD *)v1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v4 = aks_client_connection;
    bzero(outputStruct, 0x1000uLL);
    result = IOConnectCallMethod(v4, 0x98u, 0, 0, 0, 0, 0, 0, outputStruct, &v6);
    if (!(_DWORD)result)
    {
      if (v6 == 8)
      {
        result = 0;
        *v2 = outputStruct[0];
      }
      else
      {
        return 3758604298;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_cx_window", ":", 3791, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t get_aks_log_pid()
{
  return 0;
}

uint64_t compress_uuid()
{
  ccsha256_di();
  ccdigest();
  return 0;
}

unint64_t time_seconds_to_abs_interval(unsigned int a1)
{
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  return 1000000000 * info.denom * (unint64_t)a1 / info.numer;
}

unint64_t time_absolute_to_nanoseconds(uint64_t a1)
{
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  return (unint64_t)info.numer * a1 / info.denom;
}

uint64_t get_usec_time()
{
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  return mach_continuous_time() * info.numer / info.denom / 0x3E8;
}

__darwin_time_t get_clock_time()
{
  timeval v1;

  v1.tv_sec = 0;
  *(_QWORD *)&v1.tv_usec = 0;
  gettimeofday(&v1, 0);
  return v1.tv_sec;
}

uint64_t ipc_seconds_to_microsecond_interval(uint64_t a1)
{
  return 1000000 * a1;
}

unint64_t ipc_microseconds_to_seconds(uint64_t a1)
{
  return (a1 + 999999) / 0xF4240uLL;
}

_QWORD *circular_queue_init(unsigned int a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v5;
  _QWORD *v6;
  size_t v7;
  void *v8;

  v2 = a1 + 1;
  v3 = v2 << 31 >> 31;
  if (v3 != v2 || v3 < 0)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s overflow%s\n", "aks", "", "", "", "circular_queue_init", ":", 341, "", 0, "", "");
    return 0;
  }
  else
  {
    v5 = calloc(0x20uLL, 1uLL);
    v6 = v5;
    if (v5)
    {
      v5[1] = 0;
      v7 = (v3 & 0x1FFFFFFFFLL) * a2;
      *(_DWORD *)v5 = a2;
      *((_DWORD *)v5 + 1) = v2;
      v8 = calloc(v7, 1uLL);
      v6[2] = v7;
      v6[3] = v8;
    }
  }
  return v6;
}

uint64_t circular_queue_size(_DWORD *a1)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t result;

  v3 = a1[2];
  v2 = a1[3];
  result = v2 - v3;
  if (v2 < v3)
    return (result + a1[1]);
  return result;
}

uint64_t circular_queue_enqueue(unsigned int *a1, const void *a2)
{
  unsigned int v3;
  unsigned int v4;

  v3 = a1[3];
  v4 = (v3 + 1) % a1[1];
  memcpy((void *)(*((_QWORD *)a1 + 3) + *a1 * v3), a2, *a1);
  a1[3] = v4;
  if (v4 == a1[2])
    a1[2] = (v4 + 1) % a1[1];
  return 0;
}

uint64_t circular_queue_dequeue(unsigned int *a1, void *__dst)
{
  unsigned int v2;
  uint64_t result;

  v2 = a1[2];
  if (v2 == a1[3])
    return 0xFFFFFFFFLL;
  if (__dst)
  {
    memcpy(__dst, (const void *)(*((_QWORD *)a1 + 3) + *a1 * v2), *a1);
    v2 = a1[2];
  }
  memset_s((void *)(*((_QWORD *)a1 + 3) + *a1 * v2), *a1, 0, *a1);
  result = 0;
  a1[2] = (a1[2] + 1) % a1[1];
  return result;
}

uint64_t circular_queue_peek(unsigned int *a1, void *__dst)
{
  unsigned int v2;

  v2 = a1[2];
  if (v2 == a1[3])
    return 0xFFFFFFFFLL;
  memcpy(__dst, (const void *)(*((_QWORD *)a1 + 3) + *a1 * v2), *a1);
  return 0;
}

uint64_t circular_queue_dequeue_all(int *a1, _QWORD *a2, unsigned int *a3)
{
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  char *v10;
  char *v11;
  unsigned int v12;
  unsigned int v13;
  const void *v14;
  size_t v15;
  uint64_t result;
  unsigned int v17;
  unsigned int v18;
  int v19;

  v7 = a1[2];
  v6 = a1[3];
  v8 = v6 - v7;
  if (v6 < v7)
    v8 += a1[1];
  if (!v8)
    return 0;
  v9 = *a1 * v8;
  v10 = (char *)calloc(v9, 1uLL);
  if (!v10)
    return 0xFFFFFFFFLL;
  v11 = v10;
  v12 = a1[2];
  v13 = a1[3];
  if (v13 <= v12)
  {
    if (v12 <= v13)
      goto LABEL_13;
    v17 = a1[1] - v12;
    memcpy(v10, (const void *)(*((_QWORD *)a1 + 3) + *a1 * v12), *a1 * v17);
    if (v8 <= v17)
      goto LABEL_13;
    v10 = &v11[*a1 * v17];
    v14 = (const void *)*((_QWORD *)a1 + 3);
    v15 = *a1 * (v8 - v17);
  }
  else
  {
    v14 = (const void *)(*((_QWORD *)a1 + 3) + *a1 * v12);
    v15 = *a1 * v8;
  }
  memcpy(v10, v14, v15);
LABEL_13:
  v18 = a1[1];
  v19 = *a1;
  a1[2] = (a1[2] + v8) % v18;
  memset_s(*((void **)a1 + 3), v19 * v18, 0, v19 * v18);
  result = 0;
  *a2 = v11;
  *a3 = v9;
  return result;
}

uint64_t circular_queue_clear(uint64_t a1)
{
  rsize_t v1;

  *(_QWORD *)(a1 + 8) = 0;
  v1 = (*(_DWORD *)a1 * *(_DWORD *)(a1 + 4));
  return memset_s(*(void **)(a1 + 24), v1, 0, v1);
}

void circular_queue_free(void *a1)
{
  rsize_t v2;

  *((_QWORD *)a1 + 1) = 0;
  v2 = (*(_DWORD *)a1 * *((_DWORD *)a1 + 1));
  memset_s(*((void **)a1 + 3), v2, 0, v2);
  memset_s(*((void **)a1 + 3), *((_QWORD *)a1 + 2), 0, *((_QWORD *)a1 + 2));
  free(*((void **)a1 + 3));
  memset_s(a1, 0x20uLL, 0, 0x20uLL);
  free(a1);
}

uint64_t class_gen_get(unsigned int a1)
{
  return (a1 >> 5) & 1;
}

BOOL persona_uuid_is_valid(uint8x16_t *a1)
{
  int8x16_t v1;
  int8x16_t v2;
  int8x16_t v3;

  v1 = (int8x16_t)vmovl_high_u8(*a1);
  v2 = (int8x16_t)vmovl_u8(*(uint8x8_t *)a1->i8);
  v3 = (int8x16_t)vmovl_u16((uint16x4_t)vorr_s8(vorr_s8(*(int8x8_t *)v2.i8, *(int8x8_t *)v1.i8), vorr_s8((int8x8_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL), (int8x8_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL))));
  return vorr_s8(*(int8x8_t *)v3.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL)) != 0;
}

BOOL is_non_zero(unsigned __int8 *a1, uint64_t a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  v2 = 0;
  do
  {
    v3 = *a1++;
    v2 |= v3;
    --a2;
  }
  while (a2);
  return v2 != 0;
}

_DWORD *pfk_params_is_valid(_DWORD *result)
{
  if (result)
    return (_DWORD *)(*result != 0);
  return result;
}

uint64_t class_gen_set(char a1, int a2)
{
  return a1 & 0x1F | (32 * a2);
}

uint64_t class_persona_get(unsigned int a1)
{
  return (a1 >> 6) & 1;
}

uint64_t class_persona_unset(int a1)
{
  return a1 & 0xFFFFFFBF;
}

uint64_t class_persona_set(int a1)
{
  return a1 | 0x40u;
}

uint64_t keychain_key(char a1)
{
  char v1;

  v1 = a1 & 0x1F;
  if ((a1 & 0x1Fu) >= 0x14)
    v1 = -1;
  return ((a1 & 0x1Fu) < 0x14) & (0xC3FC0u >> v1);
}

uint64_t class_id_get(char a1)
{
  if ((a1 & 0x1Fu) > 0x13)
    return 0xFFFFFFFFLL;
  else
    return a1 & 0x1F;
}

uint64_t fs_class_key(char a1)
{
  unsigned int v1;

  v1 = a1 & 0x1F;
  if (v1 > 0x13)
    v1 = -1;
  return (v1 < 0x12) & (0x2E03Eu >> v1);
}

uint64_t keystore_type(char a1)
{
  return a1 & 0xF;
}

BOOL store_type_equal(int a1, int a2)
{
  return ((a2 ^ a1) & 0xF) == 0;
}

uint64_t memcmp_c()
{
  return cc_cmp_safe();
}

uint64_t dump_bytes_internal(const char *a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  const char *v4;
  FILE **v5;
  unint64_t v6;
  FILE **v7;
  uint64_t v8;
  unsigned __int8 *v9;
  char *v10;
  uint64_t v11;
  int v12;
  unint64_t v15;
  char __str[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  uint64_t v25;

  v3 = a3;
  v4 = a1;
  v25 = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  *(_OWORD *)__str = 0u;
  v17 = 0u;
  v5 = (FILE **)MEMORY[0x24BDAC8E8];
  if (a3 >= 0x41)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s %sdump %s (len = %zd)%s%s\n", "aks", "", "", "", "dump_bytes_internal", ":", 786, "", 0, "", "", a1, a3, "", "");
    v4 = "";
  }
  else if (!a3)
  {
    return memset_s(__str, 0x81uLL, 0, 0x81uLL);
  }
  v6 = 0;
  v15 = v3;
  do
  {
    v7 = v5;
    if (v3 - v6 >= 0x40)
      v8 = 64;
    else
      v8 = v3 - v6;
    if (v8)
    {
      v9 = (unsigned __int8 *)(a2 + v6);
      v10 = __str;
      v11 = v8;
      do
      {
        v12 = *v9++;
        snprintf(v10, 3uLL, "%02x", v12);
        v10 += 2;
        --v11;
      }
      while (v11);
    }
    v5 = v7;
    fprintf(*v7, "%s%s:%s%s%s%s%u:%s%u:%s %s%s%s[%04zu,%04zu): %s%s%s%s\n", "aks", "", "", "", "dump_bytes_internal", ":", 796, "", 0, "", "", v4, "", v6, v8 + v6, "", __str,
      "",
      "");
    v6 += v8;
    v3 = v15;
  }
  while (v6 < v15);
  return memset_s(__str, 0x81uLL, 0, 0x81uLL);
}

_BYTE *bytes_to_str_hint(unsigned __int8 *a1, unint64_t a2)
{
  uint64_t v2;
  char *v4;
  uint64_t v5;
  int v6;

  if (a2 >= 0x10)
    v2 = 16;
  else
    v2 = a2;
  if (v2)
  {
    v4 = bytes_to_str_hint_buf;
    v5 = v2;
    do
    {
      v6 = *a1++;
      snprintf(v4, 3uLL, "%02x", v6);
      v4 += 2;
      --v5;
    }
    while (v5);
  }
  bytes_to_str_hint_buf[2 * v2] = 0;
  return bytes_to_str_hint_buf;
}

uint64_t get_kcv(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  _OWORD __s[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  memset(__s, 0, sizeof(__s));
  if (a4 == 3)
  {
    ccsha256_di();
    cchmac();
    v5 = 0;
    *(_WORD *)a3 = __s[0];
    *(_BYTE *)(a3 + 2) = BYTE2(__s[0]);
  }
  else
  {
    v5 = 0xFFFFFFFFLL;
  }
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  return v5;
}

uint64_t print_kcv(const char *a1, uint64_t a2, uint64_t a3)
{
  __int16 v5;
  char v6;

  v6 = 0;
  v5 = 0;
  get_kcv(a2, a3, (uint64_t)&v5, 3);
  return dump_bytes_internal(a1, (uint64_t)&v5, 3uLL);
}

char *byte_swap_val(char *result, unint64_t a2)
{
  unint64_t v2;
  char *v3;
  char v4;

  if (a2 >= 2)
  {
    v2 = a2 >> 1;
    v3 = &result[a2 - 1];
    do
    {
      v4 = *result;
      *result++ = *v3;
      *v3-- = v4;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t ascii_hex_to_bytes(unsigned __int8 *a1, unint64_t a2, _QWORD *a3, unint64_t *a4)
{
  uint64_t v5;
  unsigned __int8 *v6;
  unint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  char v16;
  char v17;
  char v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  char v22;
  char v23;

  v5 = 0xFFFFFFFFLL;
  if ((a2 & 1) == 0)
  {
    v6 = a1;
    if (a1)
    {
      if (a3 && a4)
      {
        v9 = a2 >> 1;
        v10 = calloc(a2 >> 1, 1uLL);
        if (v10)
        {
          if (a2 >= 2)
          {
            if (v9 <= 1)
              v11 = 1;
            else
              v11 = a2 >> 1;
            v12 = v10;
            do
            {
              v13 = *v6;
              v14 = v13 - 48;
              v15 = v13 - 97;
              if ((v13 - 65) >= 6)
                v16 = -1;
              else
                v16 = v13 - 55;
              v17 = v13 - 87;
              if (v15 > 5)
                v17 = v16;
              if (v14 < 0xA)
                v17 = v14;
              v18 = 16 * v17;
              v19 = v6[1];
              v20 = v19 - 48;
              v21 = v19 - 97;
              if ((v19 - 65) >= 6)
                v22 = -1;
              else
                v22 = v19 - 55;
              v23 = v19 - 87;
              if (v21 > 5)
                v23 = v22;
              if (v20 < 0xA)
                v23 = v20;
              *v12++ = v23 | v18;
              v6 += 2;
              --v11;
            }
            while (v11);
          }
          v5 = 0;
          *a3 = v10;
          *a4 = v9;
        }
        else
        {
          return 4294967279;
        }
      }
    }
  }
  return v5;
}

uint64_t err_sks_to_aks(uint64_t result)
{
  if ((_DWORD)result == 0 || result >= 0xFFFFFFDA)
    return dword_2444A3FD0[(int)result + 38];
  return result;
}

uint64_t fv_init_cred_from_secret(_QWORD *a1, uint64_t a2, char a3)
{
  uint64_t result;
  size_t v7;
  void *v8;
  const void *v9;

  memset_s(a1, 0x10uLL, 0, 0x10uLL);
  if ((a3 & 1) != 0)
    return 4294967285;
  if (a2 && *(_QWORD *)a2 && (v7 = *(_QWORD *)(a2 + 8)) != 0)
  {
    v8 = calloc(v7, 1uLL);
    if (v8)
    {
      *a1 = v8;
      v9 = *(const void **)a2;
      a1[1] = *(_QWORD *)(a2 + 8);
      memcpy(v8, v9, *(_QWORD *)(a2 + 8));
      return 0;
    }
    else
    {
      return 4294967279;
    }
  }
  else
  {
    result = 0;
    *a1 = 0;
    a1[1] = 0;
  }
  return result;
}

uint64_t REQUIRE_func(uint64_t result, int a2, const char *a3)
{
  if ((result & 1) == 0)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s failed REQUIRE condition (%s:%d)\n%s\n", "aks", "", "", "", "REQUIRE_func", ":", 1047, "", 0, "", a3, a2, "");
    abort();
  }
  return result;
}

uint64_t generate_wrapping_key_curve25519(__int128 *a1, __int128 *a2)
{
  __int128 v4;
  __int128 v5;
  int __s;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  memset(v14, 0, sizeof(v14));
  platform_read_random((uint64_t)v14, 0x20u);
  cccurve25519_make_pub();
  v8 = 0u;
  v9 = 0u;
  __s = 0x1000000;
  v4 = a2[1];
  v10 = *a2;
  v11 = v4;
  v5 = a1[1];
  v12 = *a1;
  v13 = v5;
  cccurve25519();
  ccsha256_di();
  ccdigest();
  memset_s(&__s, 0x64uLL, 0, 0x64uLL);
  memset_s(v14, 0x20uLL, 0, 0x20uLL);
  return 0;
}

uint64_t wrap_data(int *a1, uint64_t (*a2)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t), char a3, uint64_t *a4, unsigned int a5, uint64_t a6, unsigned int *a7)
{
  uint64_t v8;
  int v14;
  unsigned int v15;
  _OWORD *v18;
  unsigned int v19;
  uint64_t (*v20)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t);
  uint64_t *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 *v26;
  _QWORD *v27;
  int v29;
  unsigned int v30;
  _OWORD __s[2];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v30 = 0;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  memset(__s, 0, sizeof(__s));
  v8 = 0xFFFFFFFFLL;
  if (!a6 || !a7)
    goto LABEL_40;
  if (!a1)
  {
LABEL_14:
    if (a2)
    {
      if (rfc3394_wrapped_size_legacy(a5, &v30))
      {
        if (*a7 < v30)
          goto LABEL_40;
        v18 = 0;
        v19 = 0;
        v20 = a2;
        v21 = a4;
        goto LABEL_38;
      }
    }
    else
    {
      if ((a3 & 4) != 0)
      {
        if ((a5 & 0xF) != 0 || *a7 < a5)
          goto LABEL_40;
        v30 = a5;
        ccaes_cbc_encrypt_mode();
        firebloom_cbc_one_shot_f();
LABEL_39:
        v8 = 0;
        *a7 = v30;
        goto LABEL_40;
      }
      if (rfc3394_wrapped_size_legacy(a5, &v30))
      {
        if (*a7 < v30)
          goto LABEL_40;
        if ((a3 & 8) != 0)
        {
          ccsha256_di();
          cchkdf();
          v18 = __s;
        }
        else
        {
          v18 = a1 + 2;
        }
        v19 = 32;
        v20 = 0;
        v21 = a4;
LABEL_38:
        if (rfc3394_wrap_legacy((uint64_t)v18, v19, 0xA6A6A6A6A6A6A6A6, v20, v21, a5, (_QWORD *)a6, &v30))goto LABEL_40;
        goto LABEL_39;
      }
    }
    v8 = 4294967285;
    if ((a3 & 8) == 0)
      goto LABEL_42;
    goto LABEL_41;
  }
  v14 = *a1;
  if ((*a1 - 1) >= 2)
  {
    if (v14)
      goto LABEL_40;
    goto LABEL_14;
  }
  if ((a3 & 4) != 0)
    v15 = 64;
  else
    v15 = 72;
  v30 = v15;
  if (!a2 && a5 == 32 && *a7 >= v15)
  {
    if (v14 == 1)
    {
      generate_wrapping_key_curve25519((__int128 *)(a1 + 9), &v32);
    }
    else
    {
      v23 = *(_OWORD *)(a1 + 5);
      v32 = *(_OWORD *)(a1 + 1);
      v33 = v23;
      v24 = *(_OWORD *)(a1 + 13);
      v34 = *(_OWORD *)(a1 + 9);
      v35 = v24;
    }
    if ((a3 & 0x80) == 0)
    {
      v25 = v33;
      *(_OWORD *)a6 = v32;
      *(_OWORD *)(a6 + 16) = v25;
      if ((a3 & 4) != 0)
      {
        ccaes_cbc_encrypt_mode();
        firebloom_cbc_one_shot_f();
        goto LABEL_34;
      }
      v29 = 40;
      if ((a3 & 8) != 0)
      {
        ccsha256_di();
        cchkdf();
        v27 = (_QWORD *)(a6 + 32);
        v26 = __s;
      }
      else
      {
        v26 = &v34;
        v27 = (_QWORD *)(a6 + 32);
      }
      if (!rfc3394_wrap_legacy((uint64_t)v26, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, a4, 0x20u, v27, &v29))
      {
LABEL_34:
        v8 = 0;
        *a7 = v15;
        if ((a3 & 8) == 0)
          goto LABEL_42;
        goto LABEL_41;
      }
    }
  }
LABEL_40:
  if ((a3 & 8) != 0)
LABEL_41:
    memset_s(__s, 0x20uLL, 0, 0x20uLL);
LABEL_42:
  memset_s(&v32, 0x40uLL, 0, 0x40uLL);
  return v8;
}

uint64_t generate_unwrap_shared_key_curve25519(__int128 *a1, uint64_t a2, __int128 *a3)
{
  __int128 v3;
  __int128 v4;
  int __s;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v7 = 0u;
  v3 = a1[1];
  v9 = *a1;
  v10 = v3;
  v4 = a3[1];
  v11 = *a3;
  __s = 0x1000000;
  v12 = v4;
  cccurve25519();
  ccsha256_di();
  ccdigest();
  memset_s(&__s, 0x64uLL, 0, 0x64uLL);
  return 0;
}

uint64_t unwrap_data(uint64_t a1, uint64_t (*a2)(_QWORD, void *, unint64_t *, unint64_t *, uint64_t), char a3, _QWORD *a4, unsigned int a5, _QWORD *a6, unsigned int *a7)
{
  uint64_t v8;
  _OWORD *v15;
  unsigned int v16;
  uint64_t (*v17)(_QWORD, void *, unint64_t *, unint64_t *, uint64_t);
  _QWORD *v18;
  _OWORD *v19;
  int v21;
  unsigned int v22;
  _OWORD __s[2];
  _OWORD v24[2];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v22 = 0;
  memset(v24, 0, sizeof(v24));
  v8 = 0xFFFFFFFFLL;
  if (a4 && a5)
  {
    if (!a1)
      goto LABEL_6;
    if (*(_DWORD *)a1 != 1)
    {
      if (!*(_DWORD *)a1)
      {
LABEL_6:
        if (a5 <= 0x28)
        {
          if (a2)
          {
            if (rfc3394_unwrapped_size_legacy(a5, &v22) && *a7 >= v22)
            {
              v15 = 0;
              v16 = 0;
              v17 = a2;
              goto LABEL_30;
            }
          }
          else if ((a3 & 4) != 0)
          {
            if ((a5 & 0xF) == 0 && *a7 >= a5)
            {
              v22 = a5;
              ccaes_cbc_decrypt_mode();
              firebloom_cbc_one_shot_f();
LABEL_31:
              v8 = 0;
              *a7 = v22;
              goto LABEL_35;
            }
          }
          else if (rfc3394_unwrapped_size_legacy(a5, &v22) && *a7 >= v22)
          {
            if ((a3 & 8) != 0)
            {
              ccsha256_di();
              cchkdf();
              v15 = v24;
            }
            else
            {
              v15 = (_OWORD *)(a1 + 8);
            }
            v16 = 32;
            v17 = 0;
LABEL_30:
            if (!rfc3394_unwrap_legacy((uint64_t)v15, v16, 0xA6A6A6A6A6A6A6A6, v17, a4, a5, a6, &v22))
              goto LABEL_31;
            goto LABEL_40;
          }
        }
LABEL_38:
        v8 = 4294967285;
        goto LABEL_35;
      }
LABEL_22:
      v8 = 0xFFFFFFFFLL;
      goto LABEL_35;
    }
    v22 = 32;
    if (*a7 < 0x20)
      goto LABEL_38;
    memset(__s, 0, sizeof(__s));
    if ((a3 & 4) != 0)
    {
      if (a5 != 64)
        goto LABEL_38;
      generate_unwrap_shared_key_curve25519((__int128 *)a4, a1 + 4, (__int128 *)(a1 + 36));
      ccaes_cbc_decrypt_mode();
      firebloom_cbc_one_shot_f();
    }
    else
    {
      if (a5 != 72)
        goto LABEL_38;
      generate_unwrap_shared_key_curve25519((__int128 *)a4, a1 + 4, (__int128 *)(a1 + 36));
      if (a3 < 0)
        goto LABEL_22;
      v21 = 32;
      if ((a3 & 8) != 0)
      {
        ccsha256_di();
        cchkdf();
        v18 = a4 + 4;
        v19 = v24;
      }
      else
      {
        v18 = a4 + 4;
        v19 = __s;
      }
      if (rfc3394_unwrap_legacy((uint64_t)v19, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, v18, 0x28u, a6, &v21))
      {
        memset_s(__s, 0x20uLL, 0, 0x20uLL);
LABEL_40:
        v8 = 4294967277;
        goto LABEL_35;
      }
    }
    memset_s(__s, 0x20uLL, 0, 0x20uLL);
    v8 = 0;
    *a7 = 32;
  }
LABEL_35:
  if ((a3 & 8) != 0)
    memset_s(v24, 0x20uLL, 0, 0x20uLL);
  return v8;
}

uint64_t firebloom_export_pub_key(uint64_t a1, _QWORD *a2, size_t *a3)
{
  size_t v5;
  void *v6;
  void *v7;
  uint64_t result;

  v5 = ((unint64_t)(cczp_bitlen() + 7) >> 2) | 1;
  v6 = calloc(v5, 1uLL);
  if (!v6)
    return 4294967279;
  v7 = v6;
  ccec_export_pub();
  result = 0;
  *a2 = v7;
  *a3 = v5;
  return result;
}

unint64_t firebloom_cp_prime_size()
{
  return (unint64_t)(cczp_bitlen() + 7) >> 3;
}

unint64_t firebloom_sign_max_size()
{
  return (((unint64_t)(cczp_bitlen() + 7) >> 2) & 0x3FFFFFFFFFFFFFFELL) + 9;
}

unint64_t firebloom_ec_export_pub_size()
{
  return ((unint64_t)(cczp_bitlen() + 7) >> 2) | 1;
}

unint64_t firebloom_ec_compact_export_pub_size()
{
  return (unint64_t)(cczp_bitlen() + 7) >> 3;
}

uint64_t firebloom_cbc_one_shot_f()
{
  return cccbc_one_shot();
}

uint64_t firebloom_ecb_one_shot_f()
{
  return ccecb_one_shot();
}

uint64_t firebloom_cbc_update_f()
{
  return cccbc_update();
}

BOOL firebloom_ec_import()
{
  return !ccec_import_pub() && ccn_read_uint() == 0;
}

uint64_t firebloom_ec_export()
{
  ccn_write_uint_padded();
  return 1;
}

uint64_t dict_find_params_cb(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  unint64_t v10;
  _BOOL4 v11;
  char v12;
  char v13;
  _QWORD *v14;

  if (*(_QWORD *)(a5 + 8) >= *(_QWORD *)a5)
  {
    v13 = 0;
  }
  else
  {
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = der_equal(*(const void **)(*(_QWORD *)(a5 + 24) + v9), *(_QWORD *)(*(_QWORD *)(a5 + 24) + v9)+ *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a5 + 24) + v9) + 1)+ 2, a1);
      if (v11)
        break;
      ++v10;
      v9 += 40;
      if (v10 >= *(_QWORD *)a5)
        goto LABEL_10;
    }
    v14 = (_QWORD *)(*(_QWORD *)(a5 + 24) + v9);
    if (v14[1])
    {
      v12 = 0;
      *(_BYTE *)(a5 + 16) = 1;
    }
    else
    {
      ++*(_QWORD *)(a5 + 8);
      v14[1] = a3;
      v14[2] = a3 + a4;
      v14[3] = a3;
      v14[4] = a3 + a4;
      v12 = 1;
    }
LABEL_10:
    v13 = v12 | !v11;
  }
  return v13 & 1;
}

BOOL der_key_equal(unsigned __int8 *a1, const void *a2)
{
  return der_equal(a1, (uint64_t)&a1[a1[1] + 2], a2);
}

BOOL der_equal(const void *a1, uint64_t a2, const void *a3)
{
  size_t v5;

  v5 = der_get_sizeof((uint64_t)a1);
  return v5 == der_get_sizeof((uint64_t)a3) && memcmp(a1, a3, v5) == 0;
}

uint64_t der_get_sizeof(uint64_t a1)
{
  if (ccder_blob_decode_tag() && ccder_blob_decode_len())
    return a1 - a1;
  else
    return 0;
}

uint64_t der_dict_iterate()
{
  uint64_t result;

  result = ccder_blob_decode_range();
  if ((_DWORD)result)
  {
    if (ccder_blob_decode_sequence_tl())
    {
      result = ccder_blob_decode_tl();
      if ((_DWORD)result)
        return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t der_dict_find_value(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  if (a1)
  {
    der_dict_iterate();
    if (a2)
    {
      if (a3)
      {
        *a2 = 0;
        *a3 = 0;
      }
    }
  }
  return 0;
}

BOOL _dict_find_value_cb(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v8;

  v8 = der_equal(*(const void **)a5, *(_QWORD *)a5 + *(unsigned __int8 *)(*(_QWORD *)a5 + 1) + 2, a1);
  if (v8)
  {
    *(_BYTE *)(a5 + 24) = 1;
    *(_QWORD *)(a5 + 8) = a3;
    *(_QWORD *)(a5 + 16) = a3 + a4;
  }
  return !v8;
}

uint64_t der_dict_get_number(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4)
    return 0;
  if (result)
  {
    der_dict_iterate();
    return 0;
  }
  return result;
}

uint64_t der_get_number()
{
  ccder_blob_decode_tl();
  return 0;
}

uint64_t der_dict_get_data(uint64_t result)
{
  if (result)
  {
    der_dict_iterate();
    return 0;
  }
  return result;
}

double der_utils_decode_implicit_raw_octet_string(__int128 *a1, uint64_t a2, _DWORD *a3, _QWORD *a4)
{
  double result;
  __int128 v8;

  v8 = *a1;
  if (ccder_blob_decode_range())
  {
    *a4 = 0;
    *a3 = 0;
    result = *(double *)&v8;
    *a1 = v8;
  }
  return result;
}

uint64_t der_array_iterate(uint64_t a1, uint64_t a2, unsigned int (*a3)(uint64_t, _QWORD, uint64_t), uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;

  *(_QWORD *)&v12 = a1;
  *((_QWORD *)&v12 + 1) = a2;
  v6 = ccder_blob_decode_range();
  if ((_DWORD)v6)
  {
    v11 = 0;
    v7 = v12;
    if (der_utils_decode_tl(&v12, &v10, &v11))
    {
      do
      {
        v8 = v12 + v11;
        if (!a3(v7, v12 + v11 - v7, a4))
          break;
        *(_QWORD *)&v12 = v8;
        v7 = v8;
      }
      while ((der_utils_decode_tl(&v12, &v10, &v11) & 1) != 0);
    }
  }
  return v6;
}

uint64_t der_utils_decode_tl(__int128 *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  __int128 v7;

  v7 = *a1;
  result = ccder_blob_decode_tag();
  if ((_DWORD)result)
  {
    result = ccder_blob_decode_len();
    if ((_DWORD)result)
    {
      *a1 = v7;
      *a2 = 0;
      *a3 = 0;
      return 1;
    }
  }
  return result;
}

uint64_t der_get_BOOL()
{
  ccder_blob_decode_tl();
  return 0;
}

uint64_t encode_list_free(void **a1)
{
  void *v2;
  void *v3;

  if (!a1)
    return 0xFFFFFFFFLL;
  while (1)
  {
    v2 = *a1;
    if (!*a1)
      break;
    v3 = (void *)*((_QWORD *)v2 + 1);
    *a1 = *(void **)v2;
    if (v3)
    {
      memset_s(v3, *((_QWORD *)v2 + 2), 0, *((_QWORD *)v2 + 2));
      free(*((void **)v2 + 1));
    }
    memset_s(v2, 0x18uLL, 0, 0x18uLL);
    free(v2);
  }
  return 0;
}

uint64_t encode_list_remove_key(_QWORD *a1, unsigned __int8 *a2)
{
  _QWORD **v2;
  uint64_t result;
  uint64_t v4;
  _QWORD *i;
  void *v6;

  if (!a1)
    return 0xFFFFFFFFLL;
  v2 = (_QWORD **)a1;
  result = (uint64_t)_encode_list_find_key(a1, a2);
  if (result)
  {
    v4 = result;
    for (i = *v2; i != (_QWORD *)result; i = (_QWORD *)*i)
      v2 = (_QWORD **)i;
    *v2 = *(_QWORD **)result;
    v6 = *(void **)(result + 8);
    if (v6)
    {
      memset_s(v6, *(_QWORD *)(v4 + 16), 0, *(_QWORD *)(v4 + 16));
      free(*(void **)(v4 + 8));
    }
    memset_s((void *)v4, 0x18uLL, 0, 0x18uLL);
    free((void *)v4);
    return 0;
  }
  return result;
}

_QWORD *_encode_list_find_key(_QWORD *a1, unsigned __int8 *a2)
{
  _QWORD *v2;
  const void *v5;

  if (!a1)
    return 0;
  v2 = (_QWORD *)*a1;
  if (*a1)
  {
    do
    {
      v5 = (const void *)v2[1];
      if (ccder_blob_decode_sequence_tl() && der_equal(a2, (uint64_t)&a2[a2[1] + 2], v5))
        break;
      v2 = (_QWORD *)*v2;
    }
    while (v2);
  }
  return v2;
}

uint64_t encode_list_get_data(_QWORD *a1, unsigned __int8 *a2, int a3, _QWORD *a4, _QWORD *a5)
{
  _QWORD *key;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;

  key = _encode_list_find_key(a1, a2);
  if (!key)
    return 0;
  v9 = 1;
  if (a4)
  {
    if (a5)
    {
      v10 = key[1] + key[2];
      *(_QWORD *)&v15 = key[1];
      *((_QWORD *)&v15 + 1) = v10;
      v9 = ccder_blob_decode_sequence_tl();
      if ((_DWORD)v9)
      {
        if (der_utils_decode_implicit_raw_octet_string_copy(&v15, 12, 0, 0))
        {
          v11 = v15;
          if (ccder_blob_decode_tag())
          {
            if (ccder_blob_decode_len())
            {
              v13 = 0;
              v12 = v15;
              if (a3)
              {
                v13 = (v15 - v11);
                v12 = v11;
              }
              *a4 = v12;
              *a5 = v13;
            }
          }
        }
      }
    }
  }
  return v9;
}

uint64_t der_utils_decode_implicit_raw_octet_string_copy(__int128 *a1, uint64_t a2, uint64_t a3, int a4)
{
  __int128 v8;

  v8 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0 || a3 && a4)
    return 0;
  *a1 = v8;
  return 1;
}

uint64_t encode_list_cstr_get_data(_QWORD *a1, char *__s, void *a3, size_t a4)
{
  unsigned __int8 *v7;
  uint64_t result;
  void *__src;
  uint64_t v10;
  _BYTE v11[2];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[31];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  memset(v18, 0, sizeof(v18));
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  v12 = 0u;
  v11[0] = 12;
  v11[1] = strlen(__s);
  v7 = (unsigned __int8 *)der_key_validate((uint64_t)v11);
  result = 0xFFFFFFFFLL;
  if (a3 && v7)
  {
    __memcpy_chk();
    __src = 0;
    v10 = 0;
    if (encode_list_get_data(a1, v7, 0, &__src, &v10))
    {
      if (v10 == a4)
      {
        memcpy(a3, __src, a4);
        return 0;
      }
      else
      {
        return 4294967277;
      }
    }
    else
    {
      return 4294967293;
    }
  }
  return result;
}

uint64_t der_key_validate(uint64_t a1)
{
  if ((ccder_blob_decode_tl() & 1) == 0)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s bad 1%s\n", "aks", "", "", "", "der_key_validate");
    return 0;
  }
  return a1;
}

uint64_t encode_list_get_number(_QWORD *a1, unsigned __int8 *a2, uint64_t *a3)
{
  uint64_t data;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  data = encode_list_get_data(a1, a2, 1, &v7, &v8);
  v5 = data;
  if (a3 && (_DWORD)data)
    *a3 = der_get_number();
  return v5;
}

uint64_t encode_list_get_BOOL(_QWORD *a1, unsigned __int8 *a2, _BYTE *a3)
{
  uint64_t data;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  data = encode_list_get_data(a1, a2, 1, &v7, &v8);
  v5 = data;
  if (a3 && (_DWORD)data)
    *a3 = der_get_BOOL();
  return v5;
}

uint64_t encode_list_merge_dict(uint64_t a1)
{
  if (a1)
    return der_dict_iterate() - 1;
  else
    return 4294967285;
}

uint64_t _merge_dict_cb(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  unsigned __int8 *v8;
  uint64_t v9;

  v8 = (unsigned __int8 *)der_key_validate(a1);
  if (v8)
  {
    v9 = (uint64_t)v8;
    if (!encode_list_remove_key(a5, v8) && !encode_list_add_der(a5, v9, a3, a3 + a4))
      return 1;
  }
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s fail%s\n", "aks", "", "", "", "_merge_dict_cb", ":", 647, "", 0, "", "");
  return 0;
}

uint64_t encode_list_dict(_QWORD *a1, _QWORD *a2, size_t *a3)
{
  uint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  rsize_t v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  _OWORD *v15;
  size_t v16;
  char *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v22;
  char v23;
  char *v25;
  char *v26;

  v3 = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        v7 = (_QWORD *)*a1;
        if (*a1)
        {
          v8 = 0;
          v9 = 0;
          v10 = 0;
          do
          {
            v10 += v7[2];
            v7 = (_QWORD *)*v7;
            v9 -= 16;
            --v8;
          }
          while (v7);
          if (v8 >= 0xF000000000000001 && (v11 = -v9, (v12 = calloc(-v9, 1uLL)) != 0))
          {
            v13 = v12;
            v14 = (_QWORD *)*a1;
            if (*a1)
            {
              v15 = v12;
              do
              {
                *v15++ = *(_OWORD *)(v14 + 1);
                v14 = (_QWORD *)*v14;
              }
              while (v14);
            }
            qsort(v12, -(uint64_t)v8, 0x10uLL, (int (__cdecl *)(const void *, const void *))_qsort_compare);
            v16 = ccder_sizeof();
            v17 = (char *)calloc(v16, 1uLL);
            v18 = v17;
            if (v17)
            {
              v25 = v17;
              v26 = &v17[v16];
              v19 = v8 - 1;
              v20 = (uint64_t)v13 - v9 - 8;
              while (!__CFADD__(v19++, 1))
              {
                v22 = v20 - 16;
                v23 = ccder_blob_encode_body();
                v20 = v22;
                if ((v23 & 1) == 0)
                  goto LABEL_16;
              }
              if (!ccder_blob_encode_tl() || v25 != v26)
              {
LABEL_16:
                v3 = 0xFFFFFFFFLL;
                goto LABEL_20;
              }
              v3 = 0;
              *a2 = v18;
              *a3 = v16;
              v18 = 0;
            }
            else
            {
              v3 = 4294967279;
            }
LABEL_20:
            memset_s(v13, v11, 0, v11);
            free(v13);
            if (v18)
            {
              memset_s(v18, v16, 0, v16);
              free(v18);
            }
          }
          else
          {
            return 0xFFFFFFFFLL;
          }
        }
      }
    }
  }
  return v3;
}

uint64_t encode_list_add_der(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  size_t v6;
  char *v7;
  char *v8;
  int v9;
  char *v10;
  int v11;
  char *v12;
  _QWORD *v14;
  _QWORD *v15;
  char *v16;
  char *v17;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a4)
  {
    if (der_get_sizeof(a3) <= (unint64_t)(a4 - a3))
    {
      v6 = ccder_sizeof();
      v7 = (char *)calloc(v6, 1uLL);
      if (!v7)
        return 4294967279;
      v8 = v7;
      v16 = &v7[v6];
      if (ccder_blob_encode_body())
      {
        v9 = ccder_blob_encode_body();
        v10 = v16;
        if (!v9)
          v10 = 0;
        v17 = v10;
        v11 = ccder_blob_encode_tl();
        v12 = v17;
        if (!v11)
          v12 = 0;
        if (v12 && v12 == v8)
        {
          v14 = calloc(0x18uLL, 1uLL);
          if (v14)
          {
            v15 = v14;
            result = 0;
            v15[1] = v8;
            v15[2] = v6;
            *v15 = *a1;
            *a1 = v15;
            return result;
          }
        }
      }
      memset_s(v8, v6, 0, v6);
      free(v8);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t encode_list_add_key(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return encode_list_add_der(a1, a2, a3, a3 + *(unsigned __int8 *)(a3 + 1) + 2);
}

uint64_t encode_list_add_data(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  size_t v5;
  char *v6;
  char *v7;
  int v8;
  char *v9;
  int v10;
  char *v11;
  BOOL v12;
  _QWORD *v13;
  _QWORD *v14;
  char *v15;
  char *v16;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3)
  {
    ccder_sizeof();
    v5 = ccder_sizeof();
    v6 = (char *)calloc(v5, 1uLL);
    if (v6)
    {
      v7 = v6;
      v15 = &v6[v5];
      if (!ccder_blob_encode_body() || !ccder_blob_encode_tl())
        goto LABEL_19;
      v8 = ccder_blob_encode_body();
      v9 = v15;
      if (!v8)
        v9 = 0;
      v16 = v9;
      v10 = ccder_blob_encode_tl();
      v11 = v16;
      if (!v10)
        v11 = 0;
      v12 = v11 && v11 == v7;
      if (v12 && (v13 = calloc(0x18uLL, 1uLL)) != 0)
      {
        v14 = v13;
        result = 0;
        v14[1] = v7;
        v14[2] = v5;
        *v14 = *a1;
        *a1 = v14;
      }
      else
      {
LABEL_19:
        memset_s(v7, v5, 0, v5);
        free(v7);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t encode_list_cstr_add_data(_QWORD *a1, char *__s, uint64_t a3)
{
  uint64_t v5;
  uint64_t result;
  _BYTE v7[2];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[31];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  memset(v14, 0, sizeof(v14));
  v13 = 0u;
  v12 = 0u;
  v11 = 0u;
  v10 = 0u;
  v9 = 0u;
  v8 = 0u;
  v7[0] = 12;
  v7[1] = strlen(__s);
  v5 = der_key_validate((uint64_t)v7);
  result = 4294967285;
  if (a3)
  {
    if (v5)
    {
      __memcpy_chk();
      return encode_list_add_data(a1, v5, a3);
    }
  }
  return result;
}

uint64_t encode_list_add_BOOL(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  size_t v4;
  char *v5;
  char *v6;
  int v7;
  char *v8;
  int v9;
  char *v10;
  BOOL v11;
  _QWORD *v12;
  _QWORD *v13;
  char *v14;
  char *v15;

  result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    ccder_sizeof();
    v4 = ccder_sizeof();
    v5 = (char *)calloc(v4, 1uLL);
    if (v5)
    {
      v6 = v5;
      v14 = &v5[v4];
      if (!ccder_blob_encode_body() || !ccder_blob_encode_tl())
        goto LABEL_18;
      v7 = ccder_blob_encode_body();
      v8 = v14;
      if (!v7)
        v8 = 0;
      v15 = v8;
      v9 = ccder_blob_encode_tl();
      v10 = v15;
      if (!v9)
        v10 = 0;
      v11 = v10 && v10 == v6;
      if (v11 && (v12 = calloc(0x18uLL, 1uLL)) != 0)
      {
        v13 = v12;
        result = 0;
        v13[1] = v6;
        v13[2] = v4;
        *v13 = *a1;
        *a1 = v13;
      }
      else
      {
LABEL_18:
        memset_s(v6, v4, 0, v4);
        free(v6);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t encode_list_add_number(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  size_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  int v16;
  char *v17;
  int v18;
  char *v19;
  BOOL v20;
  _QWORD *v21;
  _QWORD *v22;
  char *v23;
  char *v24;
  _QWORD v25[2];

  v3 = a3;
  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = HIBYTE(a3);
  if ((HIBYTE(a3) + 1) > 1u)
  {
    v10 = 8;
  }
  else
  {
    v6 = 9;
    v7 = 48;
    v8 = 1;
    while ((unint64_t)(v6 - 2) >= 2)
    {
      v9 = a3 >> v7;
      --v6;
      v7 -= 8;
      if ((_DWORD)v5 != v9)
      {
        v8 = v6 - 1;
        goto LABEL_8;
      }
    }
    v6 = 2;
LABEL_8:
    if ((((a3 >> (8 * v8 - 8)) ^ v5) & 0x80) != 0)
      v10 = v6;
    else
      v10 = v8;
  }
  v25[0] = 0;
  result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    ccder_sizeof();
    v12 = ccder_sizeof();
    v13 = (char *)calloc(v12, 1uLL);
    if (v13)
    {
      v14 = v13;
      v15 = v10;
      do
      {
        *((_BYTE *)v25 + v15 - 1) = v3;
        v3 >>= 8;
        --v15;
      }
      while (v15);
      v23 = &v13[v12];
      if ((ccder_blob_encode_body() & 1) == 0 || !ccder_blob_encode_tl())
        goto LABEL_30;
      v16 = ccder_blob_encode_body();
      v17 = v23;
      if (!v16)
        v17 = 0;
      v24 = v17;
      v18 = ccder_blob_encode_tl();
      v19 = v24;
      if (!v18)
        v19 = 0;
      v20 = v19 && v19 == v14;
      if (v20 && (v21 = calloc(0x18uLL, 1uLL)) != 0)
      {
        v22 = v21;
        result = 0;
        v22[1] = v14;
        v22[2] = v12;
        *v22 = *a1;
        *a1 = v22;
      }
      else
      {
LABEL_30:
        memset_s(v14, v12, 0, v12);
        free(v14);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t encode_list_add_string(_QWORD *a1, uint64_t a2, char *__s)
{
  uint64_t result;
  size_t v5;
  char *v6;
  char *v7;
  int v8;
  char *v9;
  int v10;
  char *v11;
  BOOL v12;
  _QWORD *v13;
  _QWORD *v14;
  char *v15;
  char *v16;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 && __s)
  {
    strlen(__s);
    ccder_sizeof();
    v5 = ccder_sizeof();
    v6 = (char *)calloc(v5, 1uLL);
    if (v6)
    {
      v7 = v6;
      v15 = &v6[v5];
      if (!ccder_blob_encode_body() || !ccder_blob_encode_tl())
        goto LABEL_19;
      v8 = ccder_blob_encode_body();
      v9 = v15;
      if (!v8)
        v9 = 0;
      v16 = v9;
      v10 = ccder_blob_encode_tl();
      v11 = v16;
      if (!v10)
        v11 = 0;
      v12 = v11 && v11 == v7;
      if (v12 && (v13 = calloc(0x18uLL, 1uLL)) != 0)
      {
        v14 = v13;
        result = 0;
        v14[1] = v7;
        v14[2] = v5;
        *v14 = *a1;
        *a1 = v14;
      }
      else
      {
LABEL_19:
        memset_s(v7, v5, 0, v5);
        free(v7);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t encode_list_add_list(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  size_t v5;
  char *v7;
  int v8;
  char *v9;
  int v10;
  char *v11;
  BOOL v12;
  _QWORD *v13;
  char *v15;
  void *__s;
  rsize_t __n;
  char *v18;
  char *v19;

  v3 = 0;
  __s = 0;
  __n = 0;
  v4 = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    v5 = 0;
    if (a3)
    {
      if (encode_list_dict(a3, &__s, &__n))
      {
        v3 = 0;
        v5 = 0;
      }
      else
      {
        v5 = ccder_sizeof();
        v7 = (char *)calloc(v5, 1uLL);
        v3 = v7;
        if (v7)
        {
          v15 = &v7[v5];
          if (!ccder_blob_encode_body())
            goto LABEL_23;
          v18 = v3;
          v19 = v15;
          v8 = ccder_blob_encode_body();
          v9 = v19;
          if (!v8)
            v9 = 0;
          v18 = v3;
          v19 = v9;
          v10 = ccder_blob_encode_tl();
          v11 = v19;
          if (!v10)
            v11 = 0;
          v12 = v11 && v11 == v3;
          if (v12 && (v13 = calloc(0x18uLL, 1uLL)) != 0)
          {
            v4 = 0;
            v13[1] = v3;
            v13[2] = v5;
            *v13 = *a1;
            *a1 = v13;
            v3 = 0;
          }
          else
          {
LABEL_23:
            v4 = 0xFFFFFFFFLL;
          }
        }
        else
        {
          v4 = 4294967279;
        }
      }
    }
  }
  else
  {
    v5 = 0;
  }
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  if (v3)
  {
    memset_s(v3, v5, 0, v5);
    free(v3);
  }
  return v4;
}

BOOL encode_list_is_empty(_QWORD *a1)
{
  return *a1 == 0;
}

uint64_t ccder_sizeof_fv_data()
{
  return ccder_sizeof();
}

uint64_t ccder_sizeof_fv_key()
{
  uint64_t v0;

  v0 = ccder_sizeof();
  return ccder_sizeof() + v0;
}

uint64_t der_utils_encode_fv_key(__int128 *a1, uint64_t a2)
{
  uint64_t result;
  __int128 v4;

  v4 = *a1;
  if (a2)
  {
    result = ccder_blob_encode_body_tl();
    if (!(_DWORD)result)
      return result;
    if ((ccder_blob_encode_body_tl() & 1) == 0)
      return 0;
  }
  else if (!ccder_blob_encode_body_tl() || (ccder_blob_encode_tl() & 1) == 0)
  {
    return 0;
  }
  *a1 = v4;
  return 1;
}

uint64_t der_utils_decode_fv_key(__int128 *a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  uint64_t result;
  int v10;
  __int128 v11;
  int *v12;
  uint64_t v13;
  __int128 v14;

  v6 = *(_QWORD *)a3;
  v5 = *(_QWORD *)(a3 + 8);
  v7 = *(_DWORD *)(a3 + 20);
  v11 = *a1;
  if (a2)
  {
    v14 = *a1;
    v12 = 0;
    v13 = 0;
    if ((ccder_blob_decode_range() & 1) == 0)
      return 0;
    v6 = (uint64_t)v12;
    v8 = v13 - (_DWORD)v12;
    v11 = v14;
  }
  else
  {
    LODWORD(v14) = v5;
    result = der_utils_decode_implicit_raw_octet_string_copy_len(&v11, 4, v6, &v14);
    if (!(_DWORD)result)
      return result;
    v8 = v14;
  }
  v14 = v11;
  v12 = 0;
  v13 = 0;
  if ((ccder_blob_decode_range() & 1) == 0)
    return 0;
  v11 = v14;
  if ((v13 - (_DWORD)v12) > 4)
    return 0;
  v10 = *v12;
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v8;
  *(_DWORD *)(a3 + 16) = v10;
  *(_DWORD *)(a3 + 20) = v7;
  *a1 = v11;
  return 1;
}

uint64_t der_utils_decode_implicit_raw_octet_string_copy_len(__int128 *a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  __int128 v8;

  v8 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0)
    return 0;
  if (a3)
  {
    if (a4)
      *a4 = 0;
  }
  *a1 = v8;
  return 1;
}

uint64_t der_utils_encode_fv_data(__int128 *a1, uint64_t a2)
{
  uint64_t result;
  __int128 v4;

  v4 = *a1;
  if (a2)
  {
    if ((ccder_blob_encode_body_tl() & 1) == 0)
      return 0;
  }
  else
  {
    result = ccder_blob_encode_tl();
    if (!(_DWORD)result)
      return result;
  }
  *a1 = v4;
  return 1;
}

uint64_t der_utils_decode_fv_data(__int128 *a1, int a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  unsigned int v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;

  v6 = *a3;
  v5 = a3[1];
  v9 = *a1;
  if (a2)
  {
    v12 = *a1;
    v10 = 0;
    v11 = 0;
    result = ccder_blob_decode_range();
    if (!(_DWORD)result)
      return result;
    v6 = v10;
    v8 = v11 - v10;
    v9 = v12;
  }
  else
  {
    LODWORD(v12) = v5;
    result = der_utils_decode_implicit_raw_octet_string_copy_len(&v9, 4, v6, &v12);
    if (!(_DWORD)result)
      return result;
    v8 = v12;
  }
  *a3 = v6;
  a3[1] = v8;
  *a1 = v9;
  return 1;
}

uint64_t der_utils_encode_fv_params(__int128 *a1, uint64_t a2)
{
  uint64_t result;
  __int128 v4;

  v4 = *a1;
  if (a2)
  {
    if ((ccder_blob_encode_body_tl() & 1) == 0)
      return 0;
  }
  else
  {
    result = ccder_blob_encode_tl();
    if (!(_DWORD)result)
      return result;
  }
  *a1 = v4;
  return 1;
}

uint64_t der_utils_decode_fv_params(__int128 *a1)
{
  __int128 v3;

  v3 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0)
    return 0;
  *a1 = v3;
  return 1;
}

uint64_t encode_extended_state(unsigned int *a1, int a2, _QWORD *a3, _DWORD *a4)
{
  uint64_t v8;
  uint64_t v10;
  size_t v11;
  void *v12;

  v12 = 0;
  if (encode_list_add_number(&v12, (uint64_t)der_key_state_state, *a1)
    || encode_list_add_number(&v12, (uint64_t)der_key_state_lock_state, a1[1])
    || encode_list_add_number(&v12, (uint64_t)der_key_state_backoff, *((_QWORD *)a1 + 1))
    || encode_list_add_number(&v12, (uint64_t)der_key_state_failed_attempts, a1[4])
    || encode_list_add_number(&v12, (uint64_t)der_key_state_generation_state, a1[5])
    || encode_list_add_number(&v12, (uint64_t)der_key_state_recovery_countdown, *(_QWORD *)((char *)a1 + 26))|| encode_list_add_number(&v12, (uint64_t)der_key_state_more_state, *(_QWORD *)((char *)a1 + 34))|| encode_list_add_number(&v12, (uint64_t)der_key_keybag_handle, *(int *)((char *)a1 + 42))|| encode_list_add_number(&v12, (uint64_t)der_key_config_max_unlock_attempts, *(unsigned int *)((char *)a1 + 46))|| encode_list_add_data(&v12, (uint64_t)der_key_config_user_uuid, (uint64_t)a1 + 50)|| a2&& (encode_list_add_number(&v12, (uint64_t)der_key_state_assertion_set, *((char *)a1 + 66))|| encode_list_add_number(&v12, (uint64_t)der_key_state_grace_period_enabled, *((char *)a1 + 67))|| encode_list_add_number(&v12, (uint64_t)der_key_lock_time, *(_QWORD *)(a1 + 17))|| encode_list_add_number(&v12, (uint64_t)der_key_cx_window, *(_QWORD *)(a1 + 19)))|| (v10 = 0, v11 = 0, encode_list_dict(&v12, &v10, &v11)))
  {
    v8 = 0xFFFFFFFFLL;
  }
  else
  {
    v8 = 0;
    *a3 = v10;
    *a4 = v11;
  }
  encode_list_free(&v12);
  return v8;
}

uint64_t decode_extended_state(uint64_t a1, int a2, char *__s)
{
  uint64_t result;
  uint64_t number;
  _QWORD v7[57];
  __int128 v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  result = 0xFFFFFFFFLL;
  if (a2 && a1)
  {
    if (__s)
    {
      memset_s(__s, 0x54uLL, 0, 0x54uLL);
      bzero(v7, 0x228uLL);
      v7[4] = der_key_state_lock_state;
      v7[9] = der_key_state_backoff;
      v7[14] = der_key_state_failed_attempts;
      v7[19] = der_key_state_generation_state;
      v7[24] = der_key_state_assertion_set;
      v7[29] = der_key_state_grace_period_enabled;
      v7[34] = der_key_state_recovery_countdown;
      v7[39] = der_key_state_more_state;
      v7[44] = der_key_keybag_handle;
      v7[49] = der_key_config_max_unlock_attempts;
      v7[54] = der_key_config_user_uuid;
      v9 = der_key_lock_time;
      v10 = der_key_cx_window;
      der_dict_iterate();
      *(_DWORD *)__s = der_get_number();
      *((_DWORD *)__s + 1) = der_get_number();
      *((_QWORD *)__s + 1) = der_get_number();
      *((_DWORD *)__s + 4) = der_get_number();
      *((_DWORD *)__s + 5) = der_get_number();
      *(_QWORD *)(__s + 26) = der_get_number();
      *(_QWORD *)(__s + 34) = der_get_number();
      *(_DWORD *)(__s + 42) = der_get_number();
      *(_DWORD *)(__s + 46) = der_get_number();
      der_utils_decode_implicit_raw_octet_string_copy(&v8, 4, (uint64_t)(__s + 50), 16);
      __s[66] = der_get_number();
      __s[67] = der_get_number();
      *(_QWORD *)(__s + 68) = der_get_number();
      number = der_get_number();
      result = 0;
      *(_QWORD *)(__s + 76) = number;
    }
  }
  return result;
}

uint64_t decode_memento_state(uint64_t a1, int a2, _BYTE *__s)
{
  uint64_t result;
  int number;

  result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    if (der_dict_iterate())
    {
      *__s = der_get_number();
      *((_DWORD *)__s + 1) = der_get_number();
      *((_DWORD *)__s + 2) = der_get_number();
      number = der_get_number();
      result = 0;
      *((_DWORD *)__s + 3) = number;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t decode_primary_identity_state(uint64_t a1, int a2, void *__s, void *a4, uint64_t a5)
{
  uint64_t result;
  __int128 v10[2];
  __int128 v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s && a4)
  {
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    memset_s(a4, 0x10uLL, 0, 0x10uLL);
    v12 = 0;
    v10[0] = 0u;
    v11 = 0u;
    v14 = 0u;
    v15 = 0u;
    v10[1] = (unint64_t)der_key_group_uuid;
    v13 = der_key_uuid;
    der_dict_iterate();
    if (der_utils_decode_implicit_raw_octet_string_copy(v10, 4, (uint64_t)__s, 16)
      && der_utils_decode_implicit_raw_octet_string_copy((__int128 *)((char *)&v11 + 8), 4, (uint64_t)a4, 16))
    {
      return der_utils_decode_implicit_raw_octet_string_copy(&v15, 4, a5, 16) - 1;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t decode_fv_blob_state(uint64_t a1, uint64_t a2, _DWORD *__s)
{
  uint64_t result;
  int v6;
  int number;
  __int128 v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  void *v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x58uLL, 0, 0x58uLL);
    v24 = 0u;
    v26 = 0;
    v27 = 0u;
    v28 = 0;
    v30 = 0u;
    v31 = 0u;
    v33 = 0;
    v34 = 0u;
    v35 = 0;
    v37 = 0u;
    v38 = 0u;
    v40 = 0;
    v41 = 0u;
    v42 = 0;
    v44 = 0u;
    v45 = 0u;
    v8 = 0u;
    v9 = 0;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0;
    v23 = 0u;
    v10 = der_key_id;
    *(_QWORD *)&v13 = der_key_flags;
    v16 = der_key_version;
    *(_QWORD *)&v19 = der_key_state_reserved;
    v22 = der_key_state_failed_attempts;
    v25 = der_key_state_failed_attempts_other;
    v29 = der_key_config_max_unlock_attempts;
    v32 = der_key_state_backoff;
    v36 = der_key_state_backoff_other;
    v39 = der_key_config_capabilities;
    v43 = der_key_state_refcount;
    der_dict_iterate();
    *__s = der_get_number();
    if (der_utils_decode_implicit_raw_octet_string_copy((__int128 *)((char *)&v8 + 8), 4, (uint64_t)(__s + 1), 16)&& der_utils_decode_implicit_raw_octet_string_copy(&v12, 4, (uint64_t)(__s + 5), 16)&& (__s[9] = der_get_number(), __s[10] = der_get_number(), __s[11] = der_get_number(), __s[12] = der_get_number(), __s[15] = der_get_number(), __s[13] = der_get_number(), __s[14] = der_get_number(), der_utils_decode_implicit_raw_octet_string_copy_partial((__int128 *)((char *)&v20 + 8))))
    {
      v6 = __s[9];
      if ((v6 & 0x400) != 0)
      {
        *((_QWORD *)__s + 9) = der_get_number();
        v6 = __s[9];
      }
      if ((v6 & 0x800) != 0)
      {
        number = der_get_number();
        result = 0;
        __s[20] = number;
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t der_utils_decode_implicit_raw_octet_string_copy_partial(__int128 *a1)
{
  uint64_t v2;
  __int128 v4;

  v4 = *a1;
  v2 = ccder_blob_decode_range();
  if ((v2 & 1) != 0)
    *a1 = v4;
  return v2;
}

uint64_t encode_pfk_params_public(int *a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t v3;
  int v7;
  uint64_t v9;
  size_t v10;
  void *v11;

  v11 = 0;
  v3 = 4294967273;
  if (a2 && a3)
  {
    if (a1 && (v7 = *a1) != 0)
    {
      if ((v7 & 1) != 0)
      {
        encode_list_cstr_add_data(&v11, "persona_uuid", (uint64_t)(a1 + 1));
        v7 = *a1;
      }
      if ((v7 & 2) != 0)
        encode_list_cstr_add_data(&v11, "volume_uuid", (uint64_t)(a1 + 5));
      v9 = 0;
      v10 = 0;
      if (!encode_list_dict(&v11, &v9, &v10))
      {
        v3 = 0;
        *a2 = v9;
        *a3 = v10;
      }
    }
    else
    {
      v3 = 0;
      *a2 = 0;
      *a3 = 0;
    }
  }
  encode_list_free(&v11);
  return v3;
}

uint64_t decode_pfk_params_internal(uint64_t a1, uint64_t a2, char *__s)
{
  uint64_t v3;
  void *v6;

  v6 = 0;
  v3 = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x24uLL, 0, 0x24uLL);
    if (der_dict_iterate())
    {
      if (!encode_list_cstr_get_data(&v6, "volume_uuid", __s + 20, 0x10uLL))
        *(_DWORD *)__s |= 2u;
      v3 = 0;
      if (!encode_list_cstr_get_data(&v6, "persona_uuid", __s + 4, 0x10uLL))
        *(_DWORD *)__s |= 1u;
    }
    else
    {
      v3 = 0xFFFFFFFFLL;
    }
  }
  encode_list_free(&v6);
  return v3;
}

uint64_t encode_fv_params_internal(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t v3;
  uint64_t v8;
  size_t v9;
  void *v10;

  v10 = 0;
  v3 = 4294967273;
  if (a2 && a3)
  {
    if (a1)
    {
      if (!encode_list_cstr_add_data(&v10, "options", a1)
        && !encode_list_cstr_add_data(&v10, "kc", a1 + 8))
      {
        v8 = 0;
        v9 = 0;
        if (!encode_list_dict(&v10, &v8, &v9))
        {
          v3 = 0;
          *a2 = v8;
          *a3 = v9;
        }
      }
    }
    else
    {
      v3 = 0;
      *a2 = 0;
      *a3 = 0;
    }
  }
  encode_list_free(&v10);
  return v3;
}

uint64_t decode_fv_params_internal(uint64_t a1, uint64_t a2, char *__s)
{
  uint64_t v3;
  void *v6;

  v6 = 0;
  v3 = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    if (der_dict_iterate())
    {
      encode_list_cstr_get_data(&v6, "options", __s, 8uLL);
      encode_list_cstr_get_data(&v6, "kc", __s + 8, 4uLL);
      v3 = 0;
    }
    else
    {
      v3 = 0xFFFFFFFFLL;
    }
  }
  encode_list_free(&v6);
  return v3;
}

uint64_t ref_key_op_der_to_enum(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  result = 0;
  v4 = *MEMORY[0x24BDAC8D0];
  if (a1 && a2)
  {
    if (der_key_op)
      der_dict_iterate();
    return 0;
  }
  return result;
}

uint64_t der_utils_decode_implicit_raw_octet_string_alloc(__int128 *a1, uint64_t a2, uint64_t *a3, _DWORD *a4)
{
  uint64_t result;
  __int128 v8;

  v8 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0)
    return 0;
  if (a3 && a4)
  {
    result = (uint64_t)calloc(0, 1uLL);
    if (!result)
      return result;
    *a3 = result;
    *a4 = 0;
  }
  *a1 = v8;
  return 1;
}

uint64_t der_utils_decode_implicit_uint64(__int128 *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;
  __int128 v6;

  if (a3)
    *a3 = 0;
  v6 = *a1;
  result = ccder_blob_decode_range();
  if ((_DWORD)result)
  {
    if (ccn_read_uint())
    {
      return 0;
    }
    else
    {
      *a1 = v6;
      if (a3)
        *a3 = 0;
      return 1;
    }
  }
  return result;
}

uint64_t _qsort_compare(const void **a1, void **a2)
{
  int v2;
  void *__s2;
  const void *v5;

  v5 = *a1;
  __s2 = *a2;
  if (!ccder_blob_decode_sequence_tl()
    || !ccder_blob_decode_sequence_tl()
    || !ccder_blob_decode_tag()
    || !ccder_blob_decode_len()
    || !v5
    || !ccder_blob_decode_tag()
    || !ccder_blob_decode_len()
    || !__s2)
  {
    return 4294967293;
  }
  v2 = memcmp(v5, __s2, 0);
  if (v2 > 0)
    return 1;
  else
    return ((v2 < 0) << 31 >> 31);
}

uint64_t platform_get_measurement()
{
  REQUIRE_func(&lib_platform_callbacks != 0, 36, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return 4294967284;
}

uint64_t platform_rng()
{
  REQUIRE_func(&lib_platform_callbacks != 0, 62, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(lib_platform_rng != 0, 63, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return lib_platform_rng();
}

uint64_t platform_read_random(uint64_t a1, unsigned int a2)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 70, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(lib_platform_read_random != 0, 71, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return lib_platform_read_random(a1, a2);
}

uint64_t platform_pka_get_pub_key(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 78, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 79, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t platform_pka_ecdh(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 86, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 87, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t platform_pka_sign(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 94, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 95, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t platform_pka_sika_attest(unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 106, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 107, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
}

uint64_t platform_pka_shared_encrypt(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 115, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 116, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
}

uint64_t platform_ref_key_hw_crypt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 123, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 124, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5);
}

uint64_t platform_ref_key_hw_crypt_clear_cache()
{
  REQUIRE_func(&lib_platform_callbacks != 0, 131, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 132, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0]();
}

uint64_t platform_get_device_id(uint64_t a1, uint64_t a2)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 139, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 140, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2);
}

uint64_t platform_get_aon_security(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 147, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 148, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t platform_get_att_sep_chip_rev(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 155, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 156, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t platform_get_chip_id(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 163, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 164, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t platform_get_ecid(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 171, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 172, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t platform_get_board_id(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 179, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 180, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t platform_get_fuse_bits(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 187, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 188, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t platform_get_att_board_and_chip_id(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 195, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 196, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t aks_get_pad_size(int a1)
{
  return -a1 & 3;
}

char *aks_copy_packed_data(_DWORD *a1, const void *a2, int a3)
{
  char *v3;
  int v5;
  size_t v6;
  int __s;

  v3 = (char *)(a1 + 1);
  if (a2)
  {
    *a1 = a3;
    memcpy(a1 + 1, a2, a3);
    v3 += a3;
    v5 = -a3;
    v6 = -a3 & 3;
    if ((v5 & 3) != 0)
    {
      __s = 0;
      memset_s(&__s, 4uLL, 0, 4uLL);
      memcpy(v3, &__s, v6);
      v3 += v6;
    }
  }
  else
  {
    *a1 = 0;
  }
  return v3;
}

char *aks_pack_data(char **a1, unsigned int *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned int v12;
  int v13;
  uint64_t *v14;
  char *result;
  char *v16;
  int v17;
  uint64_t v18;
  const void **v19;
  const void *v20;
  uint64_t *v21;
  const void **v22;

  v21 = &a9;
  v12 = 4;
  if (a3)
  {
    v13 = a3;
    do
    {
      v14 = v21;
      v21 += 2;
      v12 += *((_DWORD *)v14 + 2) + (-*((_DWORD *)v14 + 2) & 3) + 4;
      --v13;
    }
    while (v13);
  }
  result = (char *)calloc(1uLL, v12);
  v16 = result;
  v22 = (const void **)&a9;
  v17 = 0;
  if (a3)
  {
    v18 = 4;
    do
    {
      v19 = v22;
      v20 = *v22;
      v22 += 2;
      result = aks_copy_packed_data(&v16[v18], v20, *((_DWORD *)v19 + 2));
      v18 = result - v16;
      ++v17;
    }
    while (a3 != v17);
  }
  *(_DWORD *)v16 = v17;
  *a1 = v16;
  *a2 = v12;
  return result;
}

uint64_t aks_unpack_data(unsigned int *a1, unint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned int v9;
  char *v11;
  void **v12;
  void *v13;
  char *v14;
  size_t v15;
  unsigned int v16;
  size_t *v17;
  void **v19;

  if (a2 < 4)
    return 0xFFFFFFFFLL;
  v9 = a3;
  if (*a1 >= a3)
  {
    v19 = (void **)&a9;
    if (!a3)
      return 0;
    v11 = (char *)(a1 + 1);
    while (1)
    {
      v12 = v19;
      v13 = *v19;
      v19 += 2;
      v16 = *(_DWORD *)v11;
      v14 = v11 + 4;
      v15 = v16;
      if (v16 > a2)
        break;
      if (v13)
      {
        v17 = (size_t *)v12[1];
        if (*v17 < v15)
          return 0xFFFFFFFFLL;
        memcpy(v13, v14, v15);
        *v17 = v15;
      }
      v11 = &v14[v15];
      if (!--v9)
        return 0;
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t acm_explicit_bzero(void *a1, rsize_t __n)
{
  return memset_s(a1, __n, 0, __n);
}

uint64_t acm_get_mem()
{
  return _allocatedMem_0;
}

void *acm_mem_alloc_data(size_t size)
{
  void *result;

  result = malloc_type_calloc(1uLL, size, 0xCB62F0E9uLL);
  if (result)
    _allocatedMem_2 += size;
  return result;
}

void acm_mem_free_data(void *a1, rsize_t __n)
{
  uint64_t v4;

  if (a1)
  {
    memset_s(a1, __n, 0, __n);
    free(a1);
    v4 = _allocatedMem_2 - __n;
    if (_allocatedMem_2 < __n)
      v4 = 0;
    _allocatedMem_2 = v4;
  }
}

void *acm_mem_alloc(size_t size)
{
  void *result;

  result = malloc_type_calloc(1uLL, size, 0xDB9956F0uLL);
  if (result)
    _allocatedMem_3 += size;
  return result;
}

void acm_mem_free(void *a1, rsize_t __n)
{
  uint64_t v4;

  if (a1)
  {
    memset_s(a1, __n, 0, __n);
    free(a1);
    v4 = _allocatedMem_3 - __n;
    if (_allocatedMem_3 < __n)
      v4 = 0;
    _allocatedMem_3 = v4;
  }
}

const char *acm_mem_alloc_info(const char *result, const void *a2, uint64_t a3, const char *a4, int a5, const char *a6)
{
  const char *v6;
  const char *v7;
  const char *v8;

  if (a2)
    _allocatedMem_0 += a3;
  if (gACMLoggingLevel <= 0x1Eu)
  {
    v6 = "NULL";
    if (result)
      v7 = result;
    else
      v7 = "NULL";
    if (a4)
      v8 = a4;
    else
      v8 = "NULL";
    if (a6)
      v6 = a6;
    return (const char *)printf("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_alloc_info", v7, a2, a3, _allocatedMem_0, 0, _allocatedMem_2, _allocatedMem_3, v8, a5, v6);
  }
  return result;
}

const char *acm_mem_free_info(const char *result, const void *a2, unint64_t a3, const char *a4, int a5, const char *a6)
{
  uint64_t v6;
  const char *v7;
  const char *v8;
  const char *v9;

  if (a2)
  {
    v6 = _allocatedMem_0 - a3;
    if (_allocatedMem_0 < a3)
      v6 = 0;
    _allocatedMem_0 = v6;
  }
  if (gACMLoggingLevel <= 0x1Eu)
  {
    v7 = "NULL";
    if (result)
      v8 = result;
    else
      v8 = "NULL";
    if (a4)
      v9 = a4;
    else
      v9 = "NULL";
    if (a6)
      v7 = a6;
    return (const char *)printf("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_free_info", v8, a2, a3, _allocatedMem_0, 0, _allocatedMem_2, _allocatedMem_3, v9, a5, v7);
  }
  return result;
}

uint64_t GetSerializedVerifyPolicySize(uint64_t a1, char *__s1, uint64_t a3, uint64_t a4, _DWORD *a5, unsigned int a6, _QWORD *a7)
{
  uint64_t result;
  size_t v12;
  size_t v13;
  unsigned int v14;

  v14 = 0;
  result = 4294967293;
  if (a1 && __s1 && a7)
  {
    v12 = strnlen(__s1, 0x81uLL);
    if (v12 > 0x80)
    {
      return 4294967293;
    }
    else
    {
      v13 = v12;
      result = getLengthOfParameters(a5, a6, &v14);
      if (!(_DWORD)result)
        *a7 = v13 + v14 + 26;
    }
  }
  return result;
}

uint64_t getLengthOfParameters(_DWORD *a1, unsigned int a2, _DWORD *a3)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  unsigned int v12;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "getLengthOfParameters");
  if (a3)
  {
    *a3 = 0;
    v6 = 0;
    if (a2)
    {
      v7 = a2;
      while (1)
      {
        v8 = checkParameter(a1);
        if ((_DWORD)v8)
          break;
        v9 = v6 + 8;
        v10 = a1[4];
        v6 += v10 + 8;
        if (__CFADD__(v10, v9))
          goto LABEL_10;
        a1 += 6;
        if (!--v7)
          goto LABEL_9;
      }
      v11 = v8;
      v12 = 70;
    }
    else
    {
LABEL_9:
      v11 = 0;
      *a3 = v6;
      v12 = 10;
    }
  }
  else
  {
LABEL_10:
    v12 = 70;
    v11 = 4294967293;
  }
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "getLengthOfParameters", (int)v11);
  return v11;
}

uint64_t SerializeVerifyPolicy(_OWORD *a1, char *__s1, char a3, uint64_t a4, _DWORD *a5, unsigned int a6, _OWORD *a7, size_t *a8)
{
  uint64_t result;
  int v15;
  size_t v17;
  size_t v18;
  char *v19;
  size_t v20;
  unint64_t v21;

  v21 = 0;
  result = 4294967293;
  if (a1)
  {
    if (__s1)
    {
      if (a8)
      {
        if (a7)
        {
          if (a6 <= 0xA && (a5 != 0) == (a6 != 0))
          {
            v15 = a4;
            result = GetSerializedVerifyPolicySize((uint64_t)a1, __s1, 0, a4, a5, a6, &v21);
            if (!(_DWORD)result)
            {
              if (*a8 < v21)
                return 4294967293;
              *a7 = *a1;
              v17 = strnlen(__s1, 0x81uLL);
              if (v17 > 0x80)
              {
                return 4294967293;
              }
              else
              {
                v18 = v17;
                memcpy(a7 + 1, __s1, v17 + 1);
                v19 = (char *)a7 + v18;
                v19[17] = a3;
                *(_DWORD *)(v19 + 18) = v15;
                v20 = v18 + 22;
                result = serializeParameters((uint64_t)a5, a6, (uint64_t)a7, (uint64_t *)&v20);
                if (!(_DWORD)result)
                  *a8 = v20;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t serializeParameters(uint64_t a1, int a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  size_t v14;
  void *__src[2];
  size_t __n;

  LODWORD(v6) = a2;
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "serializeParameters");
  v8 = 70;
  v9 = 4294967293;
  if (a3 && a4)
  {
    v10 = *a4;
    *(_DWORD *)(a3 + v10) = v6;
    v11 = v10 + 4;
    if ((_DWORD)v6)
    {
      v6 = v6;
      while (1)
      {
        *(_OWORD *)__src = *(_OWORD *)a1;
        __n = *(_QWORD *)(a1 + 16);
        v12 = checkParameter(__src);
        if ((_DWORD)v12)
          break;
        v13 = (_DWORD *)(a3 + v11);
        v14 = __n;
        *v13 = __src[0];
        v13[1] = v14;
        v11 += 8;
        if ((_DWORD)v14)
        {
          memcpy((void *)(a3 + v11), __src[1], v14);
          v11 += v14;
        }
        a1 += 24;
        if (!--v6)
          goto LABEL_11;
      }
      v9 = v12;
      v8 = 70;
    }
    else
    {
LABEL_11:
      v9 = 0;
      *a4 = v11;
      v8 = 10;
    }
  }
  if (v8 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "serializeParameters", (int)v9);
  return v9;
}

uint64_t DeserializeVerifyPolicy(uint64_t a1, unint64_t a2, _OWORD *a3, _QWORD *a4, BOOL *a5, _DWORD *a6, _QWORD *a7, _DWORD *a8)
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  BOOL *v20;
  BOOL v21;
  _DWORD *v22;
  int v23;
  unint64_t v25;
  _QWORD *v26;
  unsigned int v27;
  unsigned int *v28;
  unint64_t v29;

  v28 = 0;
  v27 = 0;
  v8 = 4294967293;
  v9 = a2 - 16;
  if (a2 >= 0x10 && a1 && a3 && a4 && a5 && a6 && a7 && a8)
  {
    *a3 = *(_OWORD *)a1;
    v17 = strnlen((const char *)(a1 + 16), a2 - 16);
    if (v17 > 0x80 || v9 <= v17)
      return 4294967293;
    v26 = a4;
    v18 = v17 + 1;
    v19 = acm_mem_alloc_data(v17 + 1);
    acm_mem_alloc_info("<data>", v19, v17 + 1, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 349, "DeserializeVerifyPolicy");
    if (!v19)
      return 4294967292;
    memcpy(v19, (const void *)(a1 + 16), v17 + 1);
    v29 = v17 + 17;
    if (v17 + 17 == a2 || (v20 = a5, v21 = *(_BYTE *)(a1 + v17 + 17) != 0, v29 = v17 + 18, a2 - (v17 + 18) < 4))
    {
      v8 = 4294967293;
    }
    else
    {
      v25 = v17 + 1;
      v22 = a8;
      v23 = *(_DWORD *)(a1 + v17 + 18);
      v29 = v17 + 22;
      v8 = deserializeParameters(a1, a2, &v29, &v28, &v27);
      if (!(_DWORD)v8)
      {
        *v26 = v19;
        *v20 = v21;
        *a6 = v23;
        *a7 = v28;
        *v22 = v27;
        return v8;
      }
      v18 = v25;
    }
    acm_mem_free_info("<data>", v19, v18, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 378, "DeserializeVerifyPolicy");
    acm_mem_free_data(v19, v18);
    if (v28)
      Util_SafeDeallocParameters(v28, v27);
  }
  return v8;
}

uint64_t deserializeParameters(uint64_t a1, unint64_t a2, unint64_t *a3, _QWORD *a4, _DWORD *a5)
{
  __objc2_prop_list **p_inst_props;
  unsigned int v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  size_t v20;
  uint64_t v21;
  void *v22;
  _QWORD *v24;
  _DWORD *v25;
  unint64_t *v26;
  int v27;

  p_inst_props = &OBJC_PROTOCOL___NSXPCListenerDelegate.inst_props;
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "deserializeParameters");
  v11 = 70;
  v12 = 4294967293;
  if (!a1 || !a3 || !a4 || !a5)
    goto LABEL_25;
  v13 = *a3;
  if (a2 <= *a3)
  {
    LODWORD(v14) = 0;
LABEL_23:
    v16 = 0;
LABEL_24:
    v12 = 0;
    *a4 = v16;
    *a5 = v14;
    v11 = 10;
    *a3 = v13;
    goto LABEL_25;
  }
  if (a2 - *a3 < 4 || (v14 = *(unsigned int *)(a1 + v13), v14 > 0xA))
  {
    v11 = 70;
    v12 = 4294967293;
    goto LABEL_25;
  }
  v13 += 4;
  if (!(_DWORD)v14)
    goto LABEL_23;
  v27 = v14;
  v15 = 24 * v14;
  v16 = (char *)acm_mem_alloc(24 * v14);
  acm_mem_alloc_info("array of ACMParameter", v16, v15, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 194, "deserializeParameters");
  if (!v16)
  {
    v11 = 70;
    v12 = 4294967292;
    goto LABEL_25;
  }
  v24 = a4;
  v25 = a5;
  v26 = a3;
  v17 = 0;
  while (1)
  {
    v18 = &v16[v17];
    *(_QWORD *)&v16[v17 + 8] = 0;
    if (a2 - v13 < 8
      || (*(_DWORD *)v18 = *(_DWORD *)(a1 + v13), a2 - (v13 + 4) < 4)
      || (v19 = &v16[v17],
          v20 = *(unsigned int *)(a1 + v13 + 4),
          *(_DWORD *)&v16[v17 + 16] = v20,
          v13 += 8,
          a2 - v13 < v20))
    {
      v11 = 70;
      v12 = 4294967293;
      goto LABEL_31;
    }
    v21 = checkParameter(&v16[v17]);
    if ((_DWORD)v21)
    {
      v12 = v21;
      v11 = 70;
      goto LABEL_31;
    }
    if ((_DWORD)v20)
      break;
LABEL_20:
    v17 += 24;
    if (v15 == v17)
    {
      p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___NSXPCListenerDelegate + 56);
      a5 = v25;
      a3 = v26;
      a4 = v24;
      LODWORD(v14) = v27;
      goto LABEL_24;
    }
  }
  v22 = acm_mem_alloc_data(v20);
  acm_mem_alloc_info("<data>", v22, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 212, "deserializeParameters");
  *((_QWORD *)v18 + 1) = v22;
  if (v22)
  {
    memcpy(v22, (const void *)(a1 + v13), *((unsigned int *)v19 + 4));
    v13 += *((unsigned int *)v19 + 4);
    goto LABEL_20;
  }
  v11 = 70;
  v12 = 4294967292;
LABEL_31:
  p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___NSXPCListenerDelegate + 56);
LABEL_25:
  if (v11 >= *((unsigned __int8 *)p_inst_props + 3144))
    printf("%s: %s: returning, err = %ld.\n", "ACM", "deserializeParameters", (int)v12);
  return v12;
}

uint64_t GetSerializedVerifyAclConstraintSize(int a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, _DWORD *a9, unsigned int a10, _QWORD *a11)
{
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;

  v18 = 0;
  result = 4294967293;
  if (a3)
  {
    if (a11)
    {
      if (a10 <= 0xA && (a9 != 0) == (a10 != 0))
      {
        result = getLengthOfParameters(a9, a10, &v18);
        if (!(_DWORD)result)
        {
          v15 = 29;
          if (a1 == 32)
            v15 = 33;
          v16 = v15 + a4;
          if (a1 == 32)
            v17 = a6;
          else
            v17 = 0;
          *a11 = v16 + v17 + v18;
        }
      }
    }
  }
  return result;
}

uint64_t SerializeVerifyAclConstraint(int a1, _OWORD *a2, const void *a3, unsigned int a4, const void *a5, unsigned int a6, char a7, int a8, _DWORD *a9, unsigned int a10, uint64_t a11, _QWORD *a12)
{
  uint64_t result;
  BOOL v14;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v28;
  uint64_t v30;
  unsigned int v31;

  if (!a3)
    return 4294967293;
  result = 4294967293;
  if (a12)
    v14 = a11 == 0;
  else
    v14 = 1;
  if (!v14 && a10 <= 0xA && (a9 != 0) == (a10 != 0))
  {
    v31 = 0;
    result = getLengthOfParameters(a9, a10, &v31);
    if (!(_DWORD)result)
    {
      v21 = 29;
      if (a1 == 32)
        v21 = 33;
      v22 = v21 + a4;
      if (a1 == 32)
        v23 = a6;
      else
        v23 = 0;
      if (*a12 < v22 + v23 + (unint64_t)v31)
      {
        return 4294967293;
      }
      else
      {
        v28 = a8;
        if (a2)
        {
          *(_OWORD *)a11 = *a2;
        }
        else
        {
          *(_QWORD *)a11 = 0;
          *(_QWORD *)(a11 + 8) = 0;
        }
        *(_DWORD *)(a11 + 16) = a4;
        memcpy((void *)(a11 + 20), a3, a4);
        v24 = a4 + 20;
        if (a1 == 32)
        {
          *(_DWORD *)(a11 + v24) = a6;
          v25 = a4 + 24;
          memcpy((void *)(a11 + v25), a5, a6);
          v24 = v25 + a6;
        }
        v26 = a11 + v24;
        *(_BYTE *)v26 = a7;
        *(_DWORD *)(v26 + 1) = v28;
        v30 = v24 + 5;
        result = serializeParameters((uint64_t)a9, a10, a11, &v30);
        if (!(_DWORD)result)
          *a12 = v30;
      }
    }
  }
  return result;
}

uint64_t DeserializeVerifyAclConstraint(int a1, uint64_t a2, unsigned int a3, _OWORD *a4, _QWORD *a5, _DWORD *a6, size_t *a7, _DWORD *a8, BOOL *a9, _DWORD *a10, _QWORD *a11, _DWORD *a12)
{
  uint64_t v12;
  unint64_t v16;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  size_t v23;
  unint64_t v24;
  void *v25;
  BOOL v26;
  int v27;
  int v28;
  unint64_t v30;
  _QWORD *v31;
  unsigned int v32;
  unsigned int *v33;
  unint64_t v34;

  v33 = 0;
  v34 = 0;
  v32 = 0;
  v12 = 4294967293;
  if (a2 && a4 && a5 && a6 && a9 && a10 && a11 && a12 && a3 >= 0x10)
  {
    v16 = a3;
    *a4 = *(_OWORD *)a2;
    v34 = 16;
    if ((a3 & 0xFFFFFFFC) == 0x10)
    {
      v12 = 4294967293;
    }
    else
    {
      v20 = *(unsigned int *)(a2 + 16);
      v34 = 20;
      v21 = acm_mem_alloc_data(v20);
      acm_mem_alloc_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 532, "DeserializeVerifyAclConstraint");
      if (v21)
      {
        if (v16 - 20 < v20)
          goto LABEL_24;
        memcpy(v21, (const void *)(a2 + 20), v20);
        v22 = v20 + 20;
        v34 = v20 + 20;
        v31 = a5;
        if (a1 != 32)
        {
          v25 = 0;
          LODWORD(v23) = 0;
          goto LABEL_19;
        }
        if (v16 - v22 < 4)
        {
LABEL_24:
          v25 = 0;
          LODWORD(v23) = 0;
        }
        else
        {
          v23 = *(unsigned int *)(a2 + v22);
          v24 = v20 + 24;
          v34 = v20 + 24;
          v25 = acm_mem_alloc_data(v23);
          acm_mem_alloc_info("<data>", v25, v23, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 544, "DeserializeVerifyAclConstraint");
          if (!v25)
          {
            v12 = 4294967292;
LABEL_26:
            acm_mem_free_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 580, "DeserializeVerifyAclConstraint");
            acm_mem_free_data(v21, v20);
            if (v25)
            {
              acm_mem_free_info("<data>", v25, v23, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 583, "DeserializeVerifyAclConstraint");
              acm_mem_free_data(v25, v23);
            }
            goto LABEL_30;
          }
          if (v16 - v24 >= v23)
          {
            memcpy(v25, (const void *)(a2 + v24), v23);
            v22 = v24 + v23;
            v34 = v24 + v23;
LABEL_19:
            if (v22 != v16)
            {
              v26 = *(_BYTE *)(a2 + v22) != 0;
              v34 = v22 + 1;
              if (v16 - (v22 + 1) >= 4)
              {
                v30 = v20;
                v27 = v23;
                v23 = (size_t)v25;
                v28 = *(_DWORD *)(a2 + v22 + 1);
                v34 = v22 + 5;
                v12 = deserializeParameters(a2, v16, &v34, &v33, &v32);
                if (!(_DWORD)v12)
                {
                  *v31 = v21;
                  *a7 = v23;
                  *a8 = v27;
                  *a6 = v30;
                  *a9 = v26;
                  *a10 = v28;
                  *a11 = v33;
                  *a12 = v32;
                  return v12;
                }
                v25 = (void *)v23;
                LODWORD(v23) = v27;
                v20 = v30;
                goto LABEL_26;
              }
            }
          }
        }
        v12 = 4294967293;
        goto LABEL_26;
      }
      v12 = 4294967292;
    }
  }
LABEL_30:
  if (v33)
    Util_SafeDeallocParameters(v33, v32);
  return v12;
}

uint64_t GetSerializedProcessAclSize(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5, uint64_t a6, _DWORD *a7, unsigned int a8, _QWORD *a9)
{
  uint64_t result;
  unsigned int v12;

  v12 = 0;
  result = 4294967293;
  if (a2 && a3 && a9 && a8 <= 0xA && (a7 != 0) == (a8 != 0))
  {
    result = getLengthOfParameters(a7, a8, &v12);
    if (!(_DWORD)result)
      *a9 = a3 + (unint64_t)a5 + v12 + 36;
  }
  return result;
}

uint64_t SerializeProcessAcl(_OWORD *a1, const void *a2, unsigned int a3, const void *a4, unsigned int a5, uint64_t a6, _DWORD *a7, unsigned int a8, uint64_t a9, unint64_t *a10)
{
  uint64_t result;
  BOOL v15;
  int v17;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;

  v23 = 0;
  result = 4294967293;
  if (a2 && a3)
  {
    v15 = !a10 || a9 == 0;
    if (!v15 && a8 <= 0xA && (a7 != 0) == (a8 != 0))
    {
      v17 = a6;
      result = GetSerializedProcessAclSize(4294967293, (uint64_t)a2, a3, (uint64_t)a4, a5, a6, a7, a8, &v23);
      if (!(_DWORD)result)
      {
        if (*a10 < v23)
        {
          return 4294967293;
        }
        else
        {
          if (a1)
          {
            *(_OWORD *)a9 = *a1;
          }
          else
          {
            *(_QWORD *)a9 = 0;
            *(_QWORD *)(a9 + 8) = 0;
          }
          *(_DWORD *)(a9 + 16) = a3;
          memcpy((void *)(a9 + 20), a2, a3);
          *(_DWORD *)(a9 + a3 + 20) = a5;
          v21 = a3 + 24;
          if (a5)
          {
            memcpy((void *)(a9 + v21), a4, a5);
            v21 += a5;
          }
          *(_DWORD *)(a9 + v21) = v17;
          v22 = v21 + 4;
          result = serializeParameters((uint64_t)a7, a8, a9, (uint64_t *)&v22);
          if (!(_DWORD)result)
            *a10 = v22;
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeProcessAcl(uint64_t a1, unsigned int a2, _OWORD *a3, _QWORD *a4, _DWORD *a5, _QWORD *a6, unsigned int *a7, _DWORD *a8, _QWORD *a9, _DWORD *a10)
{
  uint64_t v10;
  _QWORD *v11;
  _DWORD *v12;
  _QWORD *v13;
  unsigned int *v14;
  _DWORD *v15;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  size_t v20;
  unint64_t v21;
  _QWORD *v22;
  unsigned int *v23;
  _DWORD *v24;
  size_t v25;
  void *v26;
  void *v27;
  void *v28;
  _DWORD *v29;
  int v30;
  void *v32;
  _DWORD *v33;
  _QWORD *v34;
  unint64_t v35;
  void *v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int *v39;
  unint64_t v40;

  v39 = 0;
  v40 = 0;
  v38 = 0;
  v10 = 4294967293;
  if (a1)
  {
    if (a3)
    {
      v11 = a4;
      if (a4)
      {
        v12 = a5;
        if (a5)
        {
          v13 = a6;
          if (a6)
          {
            v14 = a7;
            if (a7)
            {
              v15 = a8;
              if (a8)
              {
                if (a9 && a10 && a2 >= 0x10)
                {
                  v17 = a2;
                  *a3 = *(_OWORD *)a1;
                  v40 = 16;
                  if ((a2 & 0xFFFFFFFC) == 0x10)
                  {
                    v10 = 4294967293;
                  }
                  else
                  {
                    v18 = *(unsigned int *)(a1 + 16);
                    v40 = 20;
                    v19 = acm_mem_alloc_data(v18);
                    acm_mem_alloc_info("<data>", v19, v18, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 722, "DeserializeProcessAcl");
                    if (v19)
                    {
                      if (v17 - 20 < v18
                        || (memcpy(v19, (const void *)(a1 + 20), v18), v40 = v18 + 20, v17 - (v18 + 20) < 4))
                      {
                        v32 = 0;
                        v37 = 0;
                        v10 = 4294967293;
                      }
                      else
                      {
                        v20 = *(unsigned int *)(a1 + v18 + 20);
                        v21 = v18 + 24;
                        v40 = v18 + 24;
                        v37 = v20;
                        if (!(_DWORD)v20)
                        {
                          v36 = 0;
                          goto LABEL_20;
                        }
                        v33 = v12;
                        v34 = v11;
                        v22 = v13;
                        v23 = v14;
                        v24 = v15;
                        v25 = v20;
                        v26 = acm_mem_alloc_data(v20);
                        acm_mem_alloc_info("<data>", v26, v25, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 734, "DeserializeProcessAcl");
                        if (v26)
                        {
                          v27 = v26;
                          v11 = v34;
                          if (v17 - v21 >= v25)
                          {
                            v36 = v27;
                            memcpy(v27, (const void *)(a1 + v21), v25);
                            v21 += v25;
                            v40 = v21;
                            v15 = v24;
                            v14 = v23;
                            v13 = v22;
                            v12 = v33;
LABEL_20:
                            if (v17 - v21 < 4)
                            {
                              v10 = 4294967293;
                            }
                            else
                            {
                              v35 = v18;
                              v28 = v19;
                              v29 = v15;
                              v30 = *(_DWORD *)(a1 + v21);
                              v40 = v21 + 4;
                              v10 = deserializeParameters(a1, v17, &v40, &v39, &v38);
                              if (!(_DWORD)v10)
                              {
                                *v11 = v28;
                                *v12 = v35;
                                *v13 = v36;
                                *v14 = v37;
                                *v29 = v30;
                                *a9 = v39;
                                *a10 = v38;
                                return v10;
                              }
                              v19 = v28;
                              v18 = v35;
                            }
                            v32 = v36;
                            goto LABEL_32;
                          }
                          v10 = 4294967293;
                          v32 = v27;
                        }
                        else
                        {
                          v32 = 0;
                          v10 = 4294967292;
                        }
                      }
LABEL_32:
                      acm_mem_free_info("<data>", v19, v18, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 763, "DeserializeProcessAcl");
                      acm_mem_free_data(v19, v18);
                      if (v32)
                      {
                        acm_mem_free_info("<data>", v32, v37, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 766, "DeserializeProcessAcl");
                        acm_mem_free_data(v32, v37);
                      }
                      goto LABEL_34;
                    }
                    v10 = 4294967292;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_34:
  if (v39)
    Util_SafeDeallocParameters(v39, v38);
  return v10;
}

uint64_t GetSerializedRequirementSize(_DWORD *a1, uint64_t *a2)
{
  uint64_t result;
  int v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v12 = 0;
  result = 4294967293;
  if (!a1)
    return result;
  if (!a2)
    return result;
  v5 = *a1;
  if (*a1 > 0x1Cu)
    return result;
  if (((1 << v5) & 0x1FFCFF4E) != 0)
  {
    result = 0;
    *a2 = a1[3] + 16;
    return result;
  }
  if (((1 << v5) & 0x30) == 0)
  {
    if (v5 != 7)
      return result;
    *a2 = 24;
    v9 = a1[5];
    if ((_DWORD)v9)
    {
      v10 = a1 + 6;
      v11 = 24;
      do
      {
        result = GetSerializedRequirementSize(*v10, &v12);
        if ((_DWORD)result)
          break;
        v11 += v12;
        *a2 = v11;
        ++v10;
        --v9;
      }
      while (v9);
      return result;
    }
    return 0;
  }
  *a2 = 20;
  v6 = a1[4];
  if (!(_DWORD)v6)
    return 0;
  v7 = a1 + 5;
  v8 = 20;
  while (1)
  {
    result = GetSerializedRequirementSize(*v7, &v12);
    if ((_DWORD)result)
      break;
    v8 += v12;
    *a2 = v8;
    ++v7;
    if (!--v6)
      return 0;
  }
  return result;
}

uint64_t SerializeRequirement(_DWORD *a1, _OWORD *a2, uint64_t *a3)
{
  uint64_t result;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v12 = 0;
  result = 4294967293;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        result = GetSerializedRequirementSize(a1, (uint64_t *)&v12);
        if (!(_DWORD)result)
        {
          if (v12 > *a3)
            return 4294967293;
          *a2 = *(_OWORD *)a1;
          v7 = *a1;
          result = 4294967293;
          if (*a1 <= 0x1Cu)
          {
            if (((1 << v7) & 0x1FFCFF4E) != 0)
            {
              memcpy(a2 + 1, a1 + 4, a1[3]);
              v8 = a1[3] + 16;
LABEL_9:
              result = 0;
              *a3 = v8;
              return result;
            }
            if (((1 << v7) & 0x30) != 0)
            {
              *((_DWORD *)a2 + 4) = a1[4];
              if (!a1[4])
              {
                v8 = 20;
                goto LABEL_9;
              }
              v9 = 0;
              v8 = 20;
              while (1)
              {
                v11 = *a3 - v8;
                result = SerializeRequirement(*(_QWORD *)&a1[2 * v9 + 5], (char *)a2 + v8, &v11);
                if ((_DWORD)result)
                  break;
                v8 += v11;
                if (++v9 >= (unint64_t)a1[4])
                  goto LABEL_9;
              }
            }
            else if (v7 == 7)
            {
              *((_QWORD *)a2 + 2) = *((_QWORD *)a1 + 2);
              if (!a1[5])
              {
                v8 = 24;
                goto LABEL_9;
              }
              v10 = 0;
              v8 = 24;
              while (1)
              {
                v11 = *a3 - v8;
                result = SerializeRequirement(*(_QWORD *)&a1[2 * v10 + 6], (char *)a2 + v8, &v11);
                if ((_DWORD)result)
                  break;
                v8 += v11;
                if (++v10 >= (unint64_t)a1[5])
                  goto LABEL_9;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeRequirement(unsigned int *a1, unint64_t a2, void **a3, size_t *a4)
{
  uint64_t v4;
  unsigned int v9;
  size_t v10;
  uint64_t v11;
  uint64_t v13;
  _OWORD *v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *__dst;

  __dst = 0;
  v4 = 4294967293;
  if (a1)
  {
    if (a2 >= 0x10)
    {
      if (a3)
      {
        if (a4)
        {
          v9 = *a1;
          if (v9 <= 0x1C)
          {
            if (((1 << v9) & 0x1FFCFF4E) != 0)
            {
              v10 = a1[3] + 16;
              if (v10 > a2)
                goto LABEL_36;
              v11 = Util_AllocRequirement(v9, 0, &__dst);
              if (!(_DWORD)v11)
              {
                if (__dst)
                {
                  memcpy(__dst, a1, v10);
LABEL_11:
                  v4 = 0;
                  *a4 = v10;
                  *a3 = __dst;
                  return v4;
                }
                return 4294967292;
              }
              goto LABEL_35;
            }
            if (((1 << v9) & 0x30) != 0)
            {
              v13 = a1[4];
              if (8 * v13 + 20 > a2)
                goto LABEL_36;
              v11 = Util_AllocRequirement(v9, v13, &__dst);
              if ((_DWORD)v11)
                goto LABEL_35;
              v14 = __dst;
              if (!__dst)
                return 4294967292;
              if (*((_DWORD *)__dst + 3) == 84)
              {
                v15 = *(_OWORD *)a1;
                *((_DWORD *)__dst + 4) = a1[4];
                *v14 = v15;
                *((_DWORD *)__dst + 3) = 84;
                if (!a1[4])
                {
                  v10 = 20;
                  goto LABEL_11;
                }
                v16 = 0;
                v10 = 20;
                while (1)
                {
                  v21 = 0;
                  v22 = 0;
                  v11 = DeserializeRequirement((char *)a1 + v10, a2 - v10, &v22, &v21);
                  if ((_DWORD)v11)
                    goto LABEL_35;
                  *(_QWORD *)((char *)__dst + 8 * v16 + 20) = v22;
                  v10 += v21;
                  if (++v16 >= (unint64_t)a1[4])
                    goto LABEL_11;
                }
              }
              goto LABEL_39;
            }
            if (v9 == 7)
            {
              v17 = a1[5];
              if (8 * v17 + 24 <= a2)
              {
                v11 = Util_AllocRequirement(7, v17, &__dst);
                if (!(_DWORD)v11)
                {
                  v18 = __dst;
                  if (!__dst)
                    return 4294967292;
                  if (*((_DWORD *)__dst + 3) != 88)
                  {
LABEL_39:
                    v4 = 4294967291;
                    goto LABEL_36;
                  }
                  v19 = *(_OWORD *)a1;
                  *((_QWORD *)__dst + 2) = *((_QWORD *)a1 + 2);
                  *v18 = v19;
                  *((_DWORD *)__dst + 3) = 88;
                  if (!a1[5])
                  {
                    v10 = 24;
                    goto LABEL_11;
                  }
                  v20 = 0;
                  v10 = 24;
                  while (1)
                  {
                    v21 = 0;
                    v22 = 0;
                    v11 = DeserializeRequirement((char *)a1 + v10, a2 - v10, &v22, &v21);
                    if ((_DWORD)v11)
                      break;
                    *((_QWORD *)__dst + v20 + 3) = v22;
                    v10 += v21;
                    if (++v20 >= (unint64_t)a1[5])
                      goto LABEL_11;
                  }
                }
LABEL_35:
                v4 = v11;
              }
            }
          }
        }
      }
    }
  }
LABEL_36:
  if (__dst)
    Util_DeallocRequirement((int *)__dst);
  return v4;
}

uint64_t GetSerializedCredentialSize(_DWORD *a1, _QWORD *a2)
{
  uint64_t result;

  result = 4294967293;
  if (a1 && a2 && *a1 <= 0x17u && ((1 << *a1) & 0xFFF7FE) != 0)
  {
    result = 0;
    *a2 = a1[7] + 32;
  }
  return result;
}

uint64_t SerializeCredential(unsigned int *__src, void *__dst, size_t *a3)
{
  uint64_t result;
  unsigned int v6;
  size_t v8;

  result = 4294967293;
  if (__src && __dst && a3)
  {
    v6 = *__src;
    if (*__src <= 0x17 && ((1 << *__src) & 0xFFF7FE) != 0)
    {
      v8 = __src[7] + 32;
      if (v8 <= *a3 && v6 <= 0x17 && ((1 << v6) & 0xFFF7FE) != 0)
      {
        memcpy(__dst, __src, v8);
        result = 0;
        *a3 = __src[7] + 32;
      }
    }
  }
  return result;
}

uint64_t DeserializeCredential(unsigned int *a1, unint64_t a2, void **a3, _QWORD *a4)
{
  uint64_t v4;
  unsigned int v8;
  uint64_t v10;
  void *__dst;

  __dst = 0;
  v4 = 4294967293;
  if (a2 >= 0x20 && a1 && a3 && a4)
  {
    v8 = *a1;
    v10 = a1[7];
    switch(*a1)
    {
      case 1u:
        if ((_DWORD)v10 == 28)
          goto LABEL_7;
        return v4;
      case 2u:
        if ((_DWORD)v10 == 136)
          goto LABEL_7;
        return v4;
      case 3u:
        if ((_DWORD)v10 == 305)
          goto LABEL_7;
        return v4;
      case 4u:
      case 5u:
      case 6u:
      case 8u:
      case 0xEu:
      case 0x10u:
      case 0x13u:
      case 0x16u:
      case 0x17u:
        if (!(_DWORD)v10)
          goto LABEL_7;
        return v4;
      case 7u:
        if ((_DWORD)v10 == 56)
          goto LABEL_7;
        return v4;
      case 9u:
        if ((_DWORD)v10 == 24)
          goto LABEL_7;
        return v4;
      case 0xAu:
        if ((_DWORD)v10 == 52)
          goto LABEL_7;
        return v4;
      case 0xCu:
      case 0xFu:
        if ((_DWORD)v10 == 8)
          goto LABEL_7;
        return v4;
      case 0xDu:
      case 0x15u:
        if ((_DWORD)v10 == 132)
          goto LABEL_7;
        return v4;
      case 0x11u:
        if ((_DWORD)v10 == 81)
          goto LABEL_7;
        return v4;
      case 0x12u:
        if ((_DWORD)v10 == 20)
          goto LABEL_7;
        return v4;
      case 0x14u:
        if ((_DWORD)v10 != 32)
          return v4;
LABEL_7:
        v4 = Util_AllocCredential(*a1, &__dst);
        if ((_DWORD)v4)
        {
          if (__dst)
          {
LABEL_16:
            Util_DeallocCredential(__dst);
            return v4;
          }
        }
        else
        {
          if (__dst)
          {
            if (*((_DWORD *)__dst + 1) > 3u || *((_DWORD *)__dst + 2) > 0x50u)
            {
              v4 = 4294967293;
            }
            else
            {
              v4 = 4294967293;
              if (v8 <= 0x17 && ((1 << v8) & 0xFFF7FE) != 0 && v10 + 32 <= a2)
              {
                memcpy(__dst, a1, v10 + 32);
                v4 = 0;
                *a3 = __dst;
                *a4 = v10 + 32;
                return v4;
              }
            }
            goto LABEL_16;
          }
          v4 = 4294967292;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

uint64_t CopyCredential(uint64_t a1, void **a2)
{
  uint64_t v2;
  void *__dst;

  __dst = 0;
  v2 = 4294967293;
  if (a1 && a2)
  {
    v2 = Util_AllocCredential(*(_DWORD *)a1, &__dst);
    if ((_DWORD)v2)
    {
      if (__dst)
        Util_DeallocCredential(__dst);
    }
    else if (__dst)
    {
      memcpy(__dst, (const void *)a1, *(unsigned int *)(a1 + 28) + 32);
      v2 = 0;
      *a2 = __dst;
    }
    else
    {
      return 4294967292;
    }
  }
  return v2;
}

uint64_t CompareCredentials(_QWORD *__s1, _QWORD *__s2, _BYTE *a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v6;
  uint64_t v7;
  size_t v8;
  _BOOL4 isNullOrEqualMem2;
  char *v13;
  char *v14;
  size_t v21;
  uint64_t v22;

  v3 = 4294967293;
  if (__s1)
  {
    v4 = __s2;
    if (__s2)
    {
      if (a3)
      {
        v6 = __s1;
        if (*(_DWORD *)__s1 == *(_DWORD *)__s2)
        {
          v7 = *((unsigned int *)__s1 + 7);
          if ((_DWORD)v7 == *((_DWORD *)__s2 + 7))
          {
            v3 = 4294967293;
            switch(*(_DWORD *)__s1)
            {
              case 1:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                v13 = (char *)__s1 + 44;
                v14 = (char *)__s2 + 44;
                goto LABEL_74;
              case 2:
                if (*((_DWORD *)__s1 + 8) != *((_DWORD *)__s2 + 8))
                  break;
                v8 = *((unsigned int *)__s1 + 9);
                if ((_DWORD)v8 != *((_DWORD *)__s2 + 9))
                  break;
                __s2 += 5;
                __s1 += 5;
                goto LABEL_8;
              case 3:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                v13 = (char *)(__s1 + 13);
                v14 = (char *)(__s2 + 13);
                goto LABEL_74;
              case 4:
              case 5:
              case 6:
              case 8:
              case 0xC:
              case 0xE:
              case 0xF:
              case 0x10:
              case 0x11:
              case 0x12:
              case 0x13:
              case 0x16:
              case 0x17:
                v8 = v7 + 32;
                goto LABEL_8;
              case 7:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                isNullOrEqualMem2 = _isNullOrEqualMem2((unint64_t)(__s1 + 4), 0x20uLL, (unint64_t)(__s2 + 4), 32);
                if (!isNullOrEqualMem2)
                  goto LABEL_100;
                v13 = (char *)(v6 + 8);
                v14 = (char *)(v4 + 8);
                v21 = 24;
                v22 = 24;
                goto LABEL_103;
              case 9:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                v13 = (char *)(__s1 + 5);
                v14 = (char *)(__s2 + 5);
                goto LABEL_74;
              case 0xA:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                isNullOrEqualMem2 = _isNullOrEqualMem2((unint64_t)__s1 + 36, 0x10uLL, (unint64_t)__s2 + 36, 16);
                if (!isNullOrEqualMem2)
                  goto LABEL_100;
                v13 = (char *)v6 + 52;
                v14 = (char *)v4 + 52;
LABEL_74:
                v21 = 16;
                v22 = 16;
                goto LABEL_103;
              case 0xD:
                v8 = *((unsigned int *)__s1 + 8);
                if ((_DWORD)v8 != *((_DWORD *)__s2 + 8))
                  break;
                __s2 = (_QWORD *)((char *)__s2 + 36);
                __s1 = (_QWORD *)((char *)__s1 + 36);
LABEL_8:
                LOBYTE(isNullOrEqualMem2) = memcmp(__s1, __s2, v8) == 0;
                goto LABEL_100;
              case 0x14:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                v14 = (char *)(__s2 + 4);
                v13 = (char *)(__s1 + 4);
                v21 = 32;
                v22 = 32;
                goto LABEL_103;
              case 0x15:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                v13 = (char *)__s1 + 36;
                v14 = (char *)__s2 + 36;
                v21 = 128;
                v22 = 128;
LABEL_103:
                LOBYTE(isNullOrEqualMem2) = _isNullOrEqualMem2((unint64_t)v13, v21, (unint64_t)v14, v22);
                goto LABEL_100;
              default:
                return v3;
            }
          }
        }
        LOBYTE(isNullOrEqualMem2) = 0;
LABEL_100:
        v3 = 0;
        *a3 = isNullOrEqualMem2;
      }
    }
  }
  return v3;
}

BOOL _isNullOrEqualMem2(unint64_t __s1, size_t __n, unint64_t __s2, uint64_t a4)
{
  _BOOL8 result;
  BOOL v6;
  BOOL v7;

  if (__n != a4)
    return 0;
  if (!(__s1 | __s2))
    return 1;
  result = 0;
  v6 = __s1 == 0;
  if (__s2)
  {
    v7 = 1;
  }
  else
  {
    v6 = 0;
    v7 = __s1 == 0;
  }
  if (v7 && !v6)
    return memcmp((const void *)__s1, (const void *)__s2, __n) == 0;
  return result;
}

uint64_t GetSerializedAddCredentialSize(uint64_t a1, _DWORD *a2, int a3, _QWORD *a4)
{
  BOOL v4;
  char v5;
  uint64_t result;

  if (a1)
    v4 = 1;
  else
    v4 = a3 == 2;
  v5 = !v4;
  result = 4294967293;
  if (a4 && a2 && (v5 & 1) == 0 && *a2 <= 0x17u && ((1 << *a2) & 0xFFF7FE) != 0)
  {
    result = 0;
    *a4 = a2[7] + 52;
  }
  return result;
}

uint64_t SerializeAddCredential(_OWORD *a1, unsigned int *__src, int a3, uint64_t a4, _QWORD *a5)
{
  BOOL v6;
  char v7;
  uint64_t result;
  size_t v12;
  uint64_t v13;

  if (a1)
    v6 = 1;
  else
    v6 = a3 == 2;
  v7 = !v6;
  result = 4294967293;
  if (a5)
  {
    if (a4)
    {
      if (__src)
      {
        if ((v7 & 1) == 0)
        {
          result = 4294967293;
          if (*__src <= 0x17 && ((1 << *__src) & 0xFFF7FE) != 0 && *a5 >= (unint64_t)__src[7] + 52)
          {
            if (a1)
            {
              *(_OWORD *)a4 = *a1;
            }
            else
            {
              *(_QWORD *)a4 = 0;
              *(_QWORD *)(a4 + 8) = 0;
            }
            v13 = *a5 - 16;
            result = SerializeCredential(__src, (void *)(a4 + 16), (size_t *)&v13);
            if (!(_DWORD)result)
            {
              v12 = v13;
              *(_DWORD *)(v13 + a4 + 16) = a3;
              *a5 = v12 + 20;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeAddCredential(uint64_t a1, unint64_t a2, _OWORD *a3, _QWORD *a4, _DWORD *a5)
{
  uint64_t v5;
  uint64_t v10;
  _DWORD *v12;
  uint64_t v13;

  v12 = 0;
  v13 = 0;
  v5 = 4294967293;
  if (a1 && a2 >= 0x34 && a3 && a4 && a5)
  {
    *a3 = *(_OWORD *)a1;
    v10 = DeserializeCredential((unsigned int *)(a1 + 16), a2 - 16, (void **)&v12, &v13);
    if ((_DWORD)v10)
    {
      v5 = v10;
    }
    else if (a2 - (v13 + 16) >= 4)
    {
      v5 = 0;
      *a5 = *(_DWORD *)(a1 + v13 + 16);
      *a4 = v12;
      return v5;
    }
  }
  if (v12)
    Util_DeallocCredential(v12);
  return v5;
}

uint64_t DeserializeAddCredentialType(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  uint64_t result;

  result = 4294967293;
  if (a2 >= 0x34 && a1)
  {
    if (a3)
    {
      result = 0;
      *a3 = *(_DWORD *)(a1 + 16);
    }
  }
  return result;
}

uint64_t SerializeCredentialList(unsigned int **a1, unsigned int a2, unsigned int *a3, _QWORD *a4)
{
  size_t v4;
  size_t v5;
  BOOL v6;
  unsigned int **v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  uint64_t result;
  size_t v16[9];

  if (a2)
    v6 = a1 == 0;
  else
    v6 = 0;
  if (v6 || a3 == 0 || a4 == 0)
    return 4294967293;
  v16[7] = v4;
  v16[8] = v5;
  *a3 = a2;
  if (a2)
  {
    v11 = a1;
    v12 = a2;
    v13 = 4;
    while (1)
    {
      v14 = *v11;
      if (!*v11)
        return 4294967293;
      v16[0] = *a4 - v13;
      result = SerializeCredential(v14, (char *)a3 + v13, v16);
      if ((_DWORD)result)
        return result;
      v13 += v16[0];
      ++v11;
      if (!--v12)
        goto LABEL_18;
    }
  }
  else
  {
    v13 = 4;
LABEL_18:
    result = 0;
    *a4 = v13;
  }
  return result;
}

uint64_t DeserializeCredentialList(unsigned int *a1, uint64_t a2, _QWORD *a3, _DWORD *a4)
{
  uint64_t v4;
  uint64_t v8;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v15 = 0;
  v4 = 4294967293;
  if (a1)
  {
    if (a3)
    {
      if (a4)
      {
        v8 = *a1;
        if (v8 <= 0x3E8)
        {
          if ((_DWORD)v8)
          {
            v10 = (char *)acm_mem_alloc(8 * v8);
            acm_mem_alloc_info("array of ACMCredentialRef", v10, 8 * v8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 1778, "DeserializeCredentialList");
            if (v10)
            {
              v11 = 0;
              v12 = 4;
              while (1)
              {
                v13 = DeserializeCredential((unsigned int *)((char *)a1 + v12), a2 - v12, (void **)&v10[v11], &v15);
                if ((_DWORD)v13)
                  break;
                v12 += v15;
                v11 += 8;
                if (8 * v8 == v11)
                  goto LABEL_12;
              }
              v4 = v13;
              DeallocCredentialList((_DWORD **)v10, v8);
            }
            else
            {
              return 4294967292;
            }
          }
          else
          {
            v10 = 0;
LABEL_12:
            v4 = 0;
            *a4 = v8;
            *a3 = v10;
          }
        }
      }
    }
  }
  return v4;
}

void DeallocCredentialList(_DWORD **a1, unsigned int a2)
{
  uint64_t v3;
  _DWORD **v4;
  uint64_t v5;
  unint64_t v6;

  if (a1)
  {
    v3 = a2;
    if (a2)
    {
      v4 = a1;
      v5 = a2;
      do
      {
        if (*v4)
        {
          Util_DeallocCredential(*v4);
          *v4 = 0;
        }
        ++v4;
        --v5;
      }
      while (v5);
    }
    v6 = 8 * v3;
    acm_mem_free_info("array of ACMCredentialRef", a1, v6, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 1816, "DeallocCredentialList");
    acm_mem_free(a1, v6);
  }
}

uint64_t GetSerializedGetContextPropertySize(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;

  if (!a3)
    return 4294967293;
  result = 0;
  *a3 = 20;
  return result;
}

__n128 SerializeGetContextProperty(__n128 *a1, unsigned __int32 a2, __n128 *a3, _QWORD *a4)
{
  __n128 result;

  if (a1 && a3 && a4 && *a4 >= 0x14uLL)
  {
    result = *a1;
    *a3 = *a1;
    a3[1].n128_u32[0] = a2;
    *a4 = 20;
  }
  return result;
}

uint64_t DeserializeGetContextProperty(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4)
{
  uint64_t result;

  result = 4294967293;
  if (a2 >= 0x10 && a1 && a3 && a4)
  {
    *a3 = *(_OWORD *)a1;
    if ((a2 & 0xFFFFFFFFFFFFFFFCLL) != 0x10)
    {
      result = 0;
      *a4 = *(_DWORD *)(a1 + 16);
    }
  }
  return result;
}

uint64_t LibSer_GetAclAuthMethod_GetSize(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  if (!a2)
    return 4294967293;
  result = 0;
  *a2 = 16;
  return result;
}

__n128 LibSer_GetAclAuthMethod_Serialize(__n128 *a1, __n128 *a2, _QWORD *a3)
{
  __n128 result;

  if (a1 && a2 && a3 && *a3 >= 0x10uLL)
  {
    result = *a1;
    *a2 = *a1;
    *a3 = 16;
  }
  return result;
}

__n128 LibSer_GetAclAuthMethod_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3)
{
  __n128 result;

  if (a2 >= 0x10 && a1)
  {
    if (a3)
    {
      result = *a1;
      *a3 = *a1;
    }
  }
  return result;
}

uint64_t LibSer_ContextCredentialGetProperty_GetSize(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;

  if (!a4)
    return 4294967293;
  result = 0;
  *a4 = 24;
  return result;
}

__n128 LibSer_ContextCredentialGetProperty_Serialize(__n128 *a1, unsigned __int32 a2, unsigned __int32 a3, __n128 *a4, _QWORD *a5)
{
  __n128 result;

  if (a1 && a4 && a5 && *a5 >= 0x18uLL)
  {
    result = *a1;
    *a4 = *a1;
    a4[1].n128_u32[0] = a2;
    a4[1].n128_u32[1] = a3;
    *a5 = 24;
  }
  return result;
}

__n128 LibSer_ContextCredentialGetProperty_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3, _DWORD *a4, _DWORD *a5)
{
  __n128 result;

  if (a2 >= 0x18 && a1 && a3 && a4)
  {
    if (a5)
    {
      result = *a1;
      *a3 = *a1;
      *a4 = a1[1].n128_u32[0];
      *a5 = a1[1].n128_u32[1];
    }
  }
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_GetSize(_QWORD *a1)
{
  uint64_t result;

  if (!a1)
    return 4294967293;
  result = 0;
  *a1 = 8;
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_Serialize(int a1, int a2, _DWORD *a3, _QWORD *a4)
{
  uint64_t result;

  result = 4294967293;
  if (a3 && a4 && *a4 >= 8uLL)
  {
    result = 0;
    *a3 = a1;
    a3[1] = a2;
    *a4 = 8;
  }
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_Deserialize(_DWORD *a1, unint64_t a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t result;

  result = 4294967293;
  if (a2 >= 8 && a1 && a3)
  {
    if (a4)
    {
      result = 0;
      *a3 = *a1;
      *a4 = a1[1];
    }
  }
  return result;
}

uint64_t LibSer_StorageAnyCmd_DeserializeCommonFields(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4)
{
  uint64_t result;

  result = 4294967293;
  if (a1 && a2 >= 0x14)
  {
    if (a3)
      *a3 = *(_OWORD *)a1;
    result = 0;
    if (a4)
      *a4 = *(_DWORD *)(a1 + 16);
  }
  return result;
}

uint64_t LibSer_StorageSetData_GetSize(uint64_t a1, _DWORD *a2, unsigned int a3, _QWORD *a4)
{
  uint64_t result;
  unsigned int v7;

  v7 = 0;
  if (!a4)
    return 4294967291;
  result = getLengthOfParameters(a2, a3, &v7);
  if (!(_DWORD)result)
    *a4 = a1 + v7 + 28;
  return result;
}

uint64_t LibSer_StorageSetData_Serialize(_OWORD *a1, int a2, const void *a3, size_t a4, _DWORD *a5, unsigned int a6, uint64_t a7, size_t *a8)
{
  uint64_t result;
  size_t v17;
  unsigned int v18;

  result = 4294967293;
  if (a1)
  {
    if (a2)
    {
      if (a7)
      {
        if (a8)
        {
          v18 = 0;
          result = getLengthOfParameters(a5, a6, &v18);
          if (!(_DWORD)result)
          {
            if (*a8 < a4 + v18 + 28)
            {
              return 4294967293;
            }
            else
            {
              *(_OWORD *)a7 = *a1;
              *(_DWORD *)(a7 + 16) = a2;
              *(_DWORD *)(a7 + 20) = a4;
              memcpy((void *)(a7 + 24), a3, a4);
              v17 = a4 + 24;
              result = serializeParameters((uint64_t)a5, a6, a7, (uint64_t *)&v17);
              if (!(_DWORD)result)
                *a8 = v17;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_StorageSetData_Deserialize(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _DWORD *a8)
{
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v14[3];

  v10 = 4294967293;
  if (a1 && a2 >= 0x18 && a6 && a3 && a4 && a5 && a7 && a8)
  {
    v14[1] = v8;
    v14[2] = v9;
    *a3 = *(_OWORD *)a1;
    *a4 = *(_DWORD *)(a1 + 16);
    v11 = *(unsigned int *)(a1 + 20);
    v14[0] = 24;
    *a6 = v11;
    if ((_DWORD)v11)
    {
      v12 = v11 + 24;
      if (v12 > a2)
        return 4294967293;
      *a5 = a1 + 24;
      v14[0] = v12;
    }
    else
    {
      *a5 = 0;
    }
    return deserializeParameters(a1, a2, v14, a7, a8);
  }
  return v10;
}

uint64_t LibSer_StorageGetData_GetSize(_DWORD *a1, unsigned int a2, _QWORD *a3)
{
  uint64_t result;
  unsigned int v5;

  v5 = 0;
  if (!a3)
    return 4294967291;
  result = getLengthOfParameters(a1, a2, &v5);
  if (!(_DWORD)result)
    *a3 = v5 + 25;
  return result;
}

uint64_t LibSer_StorageGetData_Serialize(_OWORD *a1, int a2, char a3, _DWORD *a4, unsigned int a5, uint64_t a6, _QWORD *a7)
{
  uint64_t result;
  uint64_t v15;
  unsigned int v16;

  result = 4294967293;
  if (a1)
  {
    if (a2)
    {
      if (a6)
      {
        if (a7)
        {
          v16 = 0;
          result = getLengthOfParameters(a4, a5, &v16);
          if (!(_DWORD)result)
          {
            if (*a7 < (unint64_t)v16 + 25)
            {
              return 4294967293;
            }
            else
            {
              *(_OWORD *)a6 = *a1;
              *(_DWORD *)(a6 + 16) = a2;
              *(_BYTE *)(a6 + 20) = a3;
              v15 = 21;
              result = serializeParameters((uint64_t)a4, a5, a6, &v15);
              if (!(_DWORD)result)
                *a7 = v15;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_StorageGetData_Deserialize(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4, BOOL *a5, _QWORD *a6, _DWORD *a7)
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v11[3];

  v9 = 4294967293;
  if (a1 && a2 >= 0x15 && a3 && a4 && a5)
  {
    v11[1] = v7;
    v11[2] = v8;
    *a3 = *(_OWORD *)a1;
    *a4 = *(_DWORD *)(a1 + 16);
    *a5 = *(_BYTE *)(a1 + 20) != 0;
    v11[0] = 21;
    return deserializeParameters(a1, a2, v11, a6, a7);
  }
  return v9;
}

uint64_t LibSer_GetUnlockSecret_GetSize(_DWORD *a1, unsigned int a2, _QWORD *a3)
{
  uint64_t result;
  unsigned int v5;

  v5 = 0;
  if (!a3)
    return 4294967291;
  result = getLengthOfParameters(a1, a2, &v5);
  if (!(_DWORD)result)
    *a3 = v5 + 20;
  return result;
}

uint64_t LibSer_GetUnlockSecret_Serialize(_OWORD *a1, _DWORD *a2, unsigned int a3, _OWORD *a4, _QWORD *a5)
{
  uint64_t result;
  uint64_t v11;
  unsigned int v12;

  result = 4294967293;
  if (a1)
  {
    if (a4)
    {
      if (a5)
      {
        v12 = 0;
        result = getLengthOfParameters(a2, a3, &v12);
        if (!(_DWORD)result)
        {
          if (*a5 < (unint64_t)v12 + 20)
          {
            return 4294967293;
          }
          else
          {
            *a4 = *a1;
            v11 = 16;
            result = serializeParameters((uint64_t)a2, a3, (uint64_t)a4, &v11);
            if (!(_DWORD)result)
              *a5 = v11;
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_GetUnlockSecret_Deserialize(_OWORD *a1, unint64_t a2, _OWORD *a3, _QWORD *a4, _DWORD *a5)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t result;
  unint64_t v9[3];

  if (!a1)
    return 4294967293;
  result = 4294967293;
  if (a2 >= 0x10 && a3 && a4)
  {
    if (a5)
    {
      v9[1] = v5;
      v9[2] = v6;
      *a3 = *a1;
      v9[0] = 16;
      return deserializeParameters((uint64_t)a1, a2, v9, a4, a5);
    }
  }
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_GetSize(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  if (!a2)
    return 4294967291;
  result = 0;
  *a2 = a1 + 1;
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_Serialize(void *__src, size_t __n, char a3, _BYTE *a4, _QWORD *a5)
{
  uint64_t result;
  size_t v9;

  result = 4294967293;
  if (__src && __n && a4 && a5)
  {
    v9 = __n + 1;
    if (*a5 < __n + 1)
    {
      return 4294967293;
    }
    else
    {
      *a4 = a3;
      memcpy(a4 + 1, __src, __n);
      result = 0;
      *a5 = v9;
    }
  }
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_Deserialize(_BYTE *a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _BYTE *a5)
{
  uint64_t result;

  result = 4294967293;
  if (a2 && a5 && a1 && a3)
  {
    if (a4)
    {
      result = 0;
      *a5 = *a1;
      *a3 = a1 + 1;
      *a4 = a2 - 1;
    }
  }
  return result;
}

uint64_t LibSer_SEPControl_GetSize(uint64_t a1, _DWORD *a2, unsigned int a3, _QWORD *a4)
{
  uint64_t result;
  unsigned int v7;

  v7 = 0;
  if (!a4)
    return 4294967291;
  result = getLengthOfParameters(a2, a3, &v7);
  if (!(_DWORD)result)
    *a4 = a1 + v7 + 24;
  return result;
}

uint64_t LibSer_SEPControl_Serialize(_OWORD *a1, _DWORD *a2, unsigned int a3, const void *a4, size_t a5, uint64_t a6, _QWORD *a7)
{
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;

  result = 4294967293;
  if (a6)
  {
    if (a7)
    {
      v18 = 0;
      result = getLengthOfParameters(a2, a3, &v18);
      if (!(_DWORD)result)
      {
        if (*a7 < a5 + v18 + 24)
        {
          return 4294967293;
        }
        else
        {
          if (a1)
          {
            *(_OWORD *)a6 = *a1;
          }
          else
          {
            *(_QWORD *)a6 = 0;
            *(_QWORD *)(a6 + 8) = 0;
          }
          v17 = 16;
          result = serializeParameters((uint64_t)a2, a3, a6, &v17);
          if (!(_DWORD)result)
          {
            v15 = v17;
            *(_DWORD *)(a6 + v17) = a5;
            v16 = v15 + 4;
            memcpy((void *)(a6 + v15 + 4), a4, a5);
            result = 0;
            *a7 = v16 + a5;
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_SEPControl_Deserialize(_OWORD *a1, unint64_t a2, _OWORD *a3, _QWORD *a4, _DWORD *a5, unint64_t *a6, _QWORD *a7)
{
  uint64_t result;
  unint64_t v11;
  unint64_t v12;

  if (!a1)
    return 4294967293;
  result = 4294967293;
  if (a2 >= 0x18 && a7 && a3 && a4 && a5 && a6)
  {
    *a3 = *a1;
    v12 = 16;
    result = deserializeParameters((uint64_t)a1, a2, &v12, a4, a5);
    if (!(_DWORD)result)
    {
      v11 = (unint64_t)a1 + v12 + 4;
      *a7 = *(unsigned int *)((char *)a1 + v12);
      *a6 = v11;
    }
  }
  return result;
}

uint64_t LibSer_SEPControlResponse_GetSize(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  if (!a2)
    return 4294967291;
  result = 0;
  *a2 = a1 + 4;
  return result;
}

uint64_t LibSer_SEPControlResponse_Serialize(void *__src, size_t __n, _DWORD *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v8;

  result = 4294967293;
  if (a3 && a4)
  {
    v8 = __n + 4;
    if (*a4 < __n + 4)
    {
      return 4294967293;
    }
    else
    {
      *a3 = __n;
      if (__src)
        memcpy(a3 + 1, __src, __n);
      else
        v8 = 4;
      result = 0;
      *a4 = v8;
    }
  }
  return result;
}

uint64_t LibSer_SEPControlResponse_Deserialize(unsigned int *a1, unint64_t a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t result;
  _DWORD *v6;
  unsigned int v7;

  if (!a1)
    return 4294967293;
  result = 4294967293;
  if (a2 >= 4 && a3 && a4)
  {
    result = 0;
    v7 = *a1;
    v6 = a1 + 1;
    *a4 = v7;
    if (!v7)
      v6 = 0;
    *a3 = v6;
  }
  return result;
}

uint64_t checkParameter(_DWORD *a1)
{
  if (!a1)
    return 4294967293;
  switch(*a1)
  {
    case 0:
    case 0xC:
      if (a1[4])
        return 4294967293;
      break;
    case 1:
    case 4:
    case 5:
    case 0xA:
      if (a1[4] != 4)
        return 4294967293;
      break;
    case 2:
    case 6:
    case 7:
      if (a1[4] != 16)
        return 4294967293;
      break;
    case 3:
      if ((a1[4] - 1001) < 0xFFFFFC18)
        return 4294967293;
      break;
    case 8:
    case 9:
      if (a1[4] != 1)
        return 4294967293;
      break;
    case 0xB:
      if (a1[4] > 0x400u)
        return 4294967293;
      break;
    default:
      return 4294967293;
  }
  return 0;
}

uint64_t LibCall_ACMKernelControl_Block(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  size_t v4;
  size_t v5;
  const void *v6;
  const void *v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, _QWORD, char *, size_t, uint64_t, uint64_t);
  uint64_t v13;
  _BYTE *v14;
  unsigned int v15;
  uint64_t v17;
  _BYTE v18[8192];
  uint64_t v19;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, uint64_t, uint64_t))v1;
  v19 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernelControl_Block");
  v17 = 0x2000;
  v13 = LibCall_ACMKernelControl(v12, v11, v9, v7, v5, (uint64_t)v18, (uint64_t)&v17);
  if (v3)
  {
    if (v17)
      v14 = v18;
    else
      v14 = 0;
    (*(void (**)(uint64_t, _BYTE *))(v3 + 16))(v3, v14);
  }
  if ((_DWORD)v13)
    v15 = 70;
  else
    v15 = 10;
  if (v15 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernelControl_Block", (int)v13);
  return v13;
}

uint64_t LibCall_ACMSEPControl_Block(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, unsigned int *, unint64_t *), uint64_t a2, const void *a3, size_t a4, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8)
{
  uint64_t v16;
  _BYTE *v17;
  unsigned int v18;
  size_t v20;
  _BYTE v21[1024];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSEPControl_Block");
  v20 = 1024;
  v16 = LibCall_ACMSEPControl(a1, a2, a3, a4, a5, a6, a7, v21, &v20);
  if (a8)
  {
    if (v20)
      v17 = v21;
    else
      v17 = 0;
    (*(void (**)(uint64_t, _BYTE *))(a8 + 16))(a8, v17);
  }
  if ((_DWORD)v16)
    v18 = 70;
  else
    v18 = 10;
  if (v18 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSEPControl_Block", (int)v16);
  return v16;
}

uint64_t LibCall_ACMGlobalContextCredentialGetProperty_Block(uint64_t result, uint64_t a2, int a3, int a4, uint64_t a5)
{
  uint64_t (*v9)(uint64_t, uint64_t, _QWORD, int *, uint64_t, _BYTE *, uint64_t *);
  uint64_t v10;
  _BYTE *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  _BYTE v16[256];
  uint64_t v17;

  v9 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, int *, uint64_t, _BYTE *, uint64_t *))result;
  v17 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    result = printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty_Block");
  v14 = 256;
  if (v9)
  {
    v13 = 8;
    result = LibSer_GlobalContextCredentialGetProperty_Serialize(a3, a4, &v15, &v13);
    if ((_DWORD)result)
    {
LABEL_7:
      v10 = result;
      goto LABEL_8;
    }
    if (v13 == 8)
    {
      result = v9(a2, 27, 0, &v15, 8, v16, &v14);
      goto LABEL_7;
    }
    v10 = 4294967291;
  }
  else
  {
    v10 = 4294967293;
  }
LABEL_8:
  if (a5)
  {
    if (v14)
      v11 = v16;
    else
      v11 = 0;
    result = (*(uint64_t (**)(uint64_t, uint64_t, _BYTE *))(a5 + 16))(a5, v10, v11);
  }
  if ((_DWORD)v10)
    v12 = 70;
  else
    v12 = 10;
  if (v12 >= gACMLoggingLevel)
    return printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty_Block", (int)v10);
  return result;
}

uint64_t LibCall_ACMContextVerifyPolicy_Block(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *a4, uint64_t a5)
{
  return LibCall_ACMContextVerifyPolicyWithPreflight_Block(a1, a2, a3, a4, 0, a5);
}

uint64_t LibCall_ACMContextVerifyPolicyWithPreflight_Block(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, uint64_t a6)
{
  unsigned int v12;
  uint64_t v13;
  int *v14;
  BOOL v16;
  int *v17;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyWithPreflight_Block");
  v17 = 0;
  v16 = 0;
  v12 = 70;
  v13 = 4294967293;
  if (a3 && __s1 && a6)
  {
    v13 = LibCall_ACMContextVerifyPolicyEx(a1, a2, a3, __s1, a5, 0, 0, 0, &v16, &v17);
    v14 = v17;
    if (!(_DWORD)v13)
    {
      (*(void (**)(uint64_t, BOOL, int *))(a6 + 16))(a6, v16, v17);
      v14 = v17;
    }
    if (v14)
      Util_DeallocRequirement(v14);
    if ((_DWORD)v13)
      v12 = 70;
    else
      v12 = 10;
  }
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyWithPreflight_Block", (int)v13);
  return v13;
}

int *LibCall_ACMContextVerifyPolicyEx_Block(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  _BOOL8 v17;
  int *v18;
  uint64_t v19;
  int *result;
  BOOL v21;
  int *v22;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx_Block");
  v17 = 0;
  v18 = 0;
  v22 = 0;
  v21 = 0;
  v19 = 4294967293;
  if (a3 && __s1 && a9)
  {
    v19 = LibCall_ACMContextVerifyPolicyEx(a1, a2, a3, __s1, a5, a6, a7, a8, &v21, &v22);
    v18 = v22;
    v17 = v21;
  }
  (*(void (**)(uint64_t, uint64_t, _BOOL8, int *))(a9 + 16))(a9, v19, v17, v18);
  result = v22;
  if (v22)
    result = (int *)Util_DeallocRequirement(v22);
  if (gACMLoggingLevel <= 0xAu)
    return (int *)printf("%s: %s: returning.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx_Block");
  return result;
}

uint64_t LibCall_ACMGlobalContextVerifyPolicy_Block(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, char *a3, uint64_t a4, _DWORD *a5, unsigned int a6, uint64_t a7)
{
  uint64_t result;
  int v15[2];

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicy_Block");
  *(_QWORD *)v15 = 0;
  result = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _BYTE *, uint64_t *))a1, a2, v15, 0, 1);
  if ((_DWORD)result)
  {
    if (a7)
      result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(a7 + 16))(a7, result, 0, 0);
  }
  else
  {
    result = (uint64_t)LibCall_ACMContextVerifyPolicyEx_Block(a1, a2, *(_OWORD **)v15, a3, a4, a5, a6, 0xFFFFFFFFLL, a7);
  }
  if (*(_QWORD *)v15)
    result = LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, _QWORD, void *, uint64_t, _QWORD, _QWORD))a1, a2, *(void **)v15, 1);
  if (gACMLoggingLevel <= 0xAu)
    return printf("%s: %s: returning.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicy_Block");
  return result;
}

uint64_t LibCall_ACMGetEnvironmentVariable_Block(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, uint64_t a4)
{
  void *v8;
  uint64_t v9;
  void *v10;
  _BYTE *v11;
  unsigned int v12;
  uint64_t v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGetEnvironmentVariable_Block");
  v14 = 128;
  if (!a4)
  {
    v12 = 70;
    v9 = 4294967293;
    goto LABEL_17;
  }
  if (a3 == 36)
  {
    v8 = acm_mem_alloc_data(0x800uLL);
    acm_mem_alloc_info("<data>", v8, 2048, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c", 162, "LibCall_ACMGetEnvironmentVariable_Block");
    if (!v8)
    {
      v12 = 70;
      v9 = 4294967292;
      goto LABEL_17;
    }
    v14 = 2048;
    v9 = LibCall_ACMGetEnvironmentVariable(a1, a2, 36, (uint64_t)v8, (uint64_t)&v14);
    if (!(_DWORD)v9)
    {
      if (v14)
        v10 = v8;
      else
        v10 = 0;
      (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v10);
      acm_mem_free_info("<data>", v8, 0x800uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c", 176, "LibCall_ACMGetEnvironmentVariable_Block");
      acm_mem_free_data(v8, 0x800uLL);
LABEL_16:
      v12 = 10;
      goto LABEL_17;
    }
    acm_mem_free_info("<data>", v8, 0x800uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c", 176, "LibCall_ACMGetEnvironmentVariable_Block");
    acm_mem_free_data(v8, 0x800uLL);
  }
  else
  {
    v9 = LibCall_ACMGetEnvironmentVariable(a1, a2, a3, (uint64_t)v15, (uint64_t)&v14);
    if (!(_DWORD)v9)
    {
      if (v14)
        v11 = v15;
      else
        v11 = 0;
      (*(void (**)(uint64_t, _BYTE *))(a4 + 16))(a4, v11);
      goto LABEL_16;
    }
  }
  v12 = 70;
LABEL_17:
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGetEnvironmentVariable_Block", (int)v9);
  return v9;
}

uint64_t LibCall_ACMTRMLoadState_Block(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t);
  uint64_t v7;
  _BYTE *v8;
  unsigned int v9;
  uint64_t v11;
  _BYTE v12[8192];
  uint64_t v13;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v6 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t))v1;
  v13 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMTRMLoadState_Block");
  v11 = 0x2000;
  if (v3)
  {
    v7 = LibCall_ACMTRMLoadState(v6, v5, (uint64_t)v12, (uint64_t)&v11);
    if ((_DWORD)v7)
    {
      v9 = 70;
    }
    else
    {
      if (v11)
        v8 = v12;
      else
        v8 = 0;
      (*(void (**)(uint64_t, _BYTE *))(v3 + 16))(v3, v8);
      v9 = 10;
    }
  }
  else
  {
    v9 = 70;
    v7 = 4294967293;
  }
  if (v9 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMLoadState_Block", (int)v7);
  return v7;
}

uint64_t LibCall_ACMContextUnloadToImage_Block(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  _BYTE v8[4096];
  uint64_t v9;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v4 = v1;
  v9 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextUnloadToImage_Block");
  if (v3)
  {
    v5 = LibCall_ACMContextUnloadToImage(v4);
    if ((_DWORD)v5)
    {
      v6 = 70;
    }
    else
    {
      (*(void (**)(uint64_t, _BYTE *))(v3 + 16))(v3, v8);
      v6 = 10;
    }
  }
  else
  {
    v6 = 70;
    v5 = 4294967293;
  }
  if (v6 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextUnloadToImage_Block", (int)v5);
  return v5;
}

uint64_t LibCall_ACMGetAclAuthMethod_Block(uint64_t result, uint64_t a2, __n128 *a3, uint64_t a4)
{
  void (*v7)(uint64_t, uint64_t, _QWORD, __n128 *, uint64_t, _BYTE *, uint64_t *, __n128);
  __n128 AclAuthMethod_Serialize;
  int v9;
  uint64_t v10;
  uint64_t v11;
  __n128 v12;
  _BYTE v13[256];
  uint64_t v14;

  v7 = (void (*)(uint64_t, uint64_t, _QWORD, __n128 *, uint64_t, _BYTE *, uint64_t *, __n128))result;
  v14 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    result = printf("%s: %s: called.\n", "ACM", "LibCall_ACMGetAclAuthMethod_Block");
  v11 = 256;
  if (v7 && a3 && a4)
  {
    v10 = 16;
    AclAuthMethod_Serialize = LibSer_GetAclAuthMethod_Serialize(a3, &v12, &v10);
    if (!v9 && v10 == 16)
      v7(a2, 31, 0, &v12, 16, v13, &v11, AclAuthMethod_Serialize);
    goto LABEL_9;
  }
  if (a4)
LABEL_9:
    result = (*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
  if (gACMLoggingLevel <= 0xAu)
    return printf("%s: %s: returning.\n", "ACM", "LibCall_ACMGetAclAuthMethod_Block");
  return result;
}

uint64_t LibCall_ACMContextVerifyAclConstraint(uint64_t a1, uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, unsigned __int8 a6, _DWORD *a7, unsigned int a8, unsigned int a9, uint64_t a10)
{
  return verifyAclConstraintForOperationCommandInternal(a1, a2, 0xBu, a3, a4, a5, 0, 0, a6, a7, a8, a9, a10);
}

uint64_t verifyAclConstraintForOperationCommandInternal(uint64_t result, uint64_t a2, unsigned __int8 a3, _OWORD *a4, const void *a5, uint64_t a6, const void *a7, unsigned int a8, unsigned __int8 a9, _DWORD *a10, unsigned int a11, unsigned int a12, uint64_t a13)
{
  uint64_t (*v20)(uint64_t, uint64_t, _QWORD, void *, size_t, unsigned int *, unint64_t *);
  uint64_t v21;
  int *v22;
  _BOOL8 v23;
  BOOL v24;
  int *v25;

  v20 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, void *, size_t, unsigned int *, unint64_t *))result;
  if (gACMLoggingLevel <= 0xAu)
    result = printf("%s: %s: called.\n", "ACM", "verifyAclConstraintForOperationCommandInternal");
  v25 = 0;
  v24 = 0;
  if (a4 && a5 && a6 && a13)
  {
    v21 = verifyAclConstraintInternal(v20, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, &v24, &v25);
    v22 = v25;
    v23 = v24;
  }
  else
  {
    if (!a13)
      goto LABEL_10;
    v22 = 0;
    v23 = 0;
    v21 = 4294967293;
  }
  (*(void (**)(uint64_t, uint64_t, _BOOL8, int *))(a13 + 16))(a13, v21, v23, v22);
  result = (uint64_t)v25;
  if (v25)
    result = Util_DeallocRequirement(v25);
LABEL_10:
  if (gACMLoggingLevel <= 0xAu)
    return printf("%s: %s: returning.\n", "ACM", "verifyAclConstraintForOperationCommandInternal");
  return result;
}

uint64_t LibCall_ACMContextVerifyAclConstraintForOperation(uint64_t a1, uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, const void *a6, unsigned int a7, unsigned __int8 a8, _DWORD *a9, unsigned int a10, unsigned int a11, uint64_t a12)
{
  return verifyAclConstraintForOperationCommandInternal(a1, a2, 0x20u, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t Util_GetBitCount(uint64_t a1)
{
  uint8x8_t v1;

  v1 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
  v1.i16[0] = vaddlv_u8(v1);
  return v1.u32[0];
}

BOOL Util_isNullOrZeroMemory(_BYTE *a1, uint64_t a2)
{
  if (!a1)
    return 1;
  if (*a1)
    return 0;
  return memcmp(a1, a1 + 1, a2 - 1) == 0;
}

BOOL Util_isNonNullEqualMemory(void *__s1, size_t __n, void *__s2, uint64_t a4)
{
  _BOOL8 result;

  if (__n != a4)
    return 0;
  result = 0;
  if (__s1)
  {
    if (__s2)
      return memcmp(__s1, __s2, __n) == 0;
  }
  return result;
}

char *Util_hexDumpToStrHelper(char *result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  _BYTE *v5;
  char v6;

  if (!result && a2)
    Util_hexDumpToStrHelper_cold_1();
  if (!a3 && a4)
    Util_hexDumpToStrHelper_cold_2();
  if (a2 >= a4)
    v4 = a4;
  else
    v4 = a2;
  if (v4)
  {
    v5 = (_BYTE *)(a3 + 1);
    do
    {
      *(v5 - 1) = a0123456789abcd[(unint64_t)*result >> 4];
      v6 = *result++;
      *v5 = a0123456789abcd[v6 & 0xF];
      v5 += 2;
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t Util_WriteToBuffer(uint64_t a1, size_t a2, _QWORD *a3, void *__src, size_t __n)
{
  uint64_t v10;
  size_t v11;
  uint64_t v12;
  unsigned int v13;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_WriteToBuffer");
  if (a3)
  {
    v10 = *a3;
    v11 = *a3 + __n;
    if (!__CFADD__(*a3, __n))
    {
      if (a1 && v11 > a2)
      {
        v12 = 4294967276;
        goto LABEL_19;
      }
      if (!a1 || !__src || !__n)
        goto LABEL_12;
      if (!__CFADD__(a1, v10))
      {
        memcpy((void *)(a1 + v10), __src, __n);
LABEL_12:
        v12 = 0;
        *a3 = v11;
        v13 = 10;
        goto LABEL_13;
      }
    }
    v12 = 4294967291;
  }
  else
  {
    v12 = 4294967293;
  }
LABEL_19:
  v13 = 70;
LABEL_13:
  if (v13 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_WriteToBuffer", (int)v12);
  return v12;
}

uint64_t Util_ReadFromBuffer(uint64_t a1, size_t a2, _QWORD *a3, void *__dst, size_t __n)
{
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  size_t v13;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_ReadFromBuffer");
  v10 = 4294967293;
  v11 = 70;
  if (a1 && a3)
  {
    v12 = *a3;
    v13 = *a3 + __n;
    if (!__CFADD__(*a3, __n))
    {
      if (v13 > a2)
      {
        v10 = 4294967276;
        goto LABEL_17;
      }
      if (!__dst || !__n)
        goto LABEL_11;
      if (!__CFADD__(a1, v12))
      {
        memcpy(__dst, (const void *)(a1 + v12), __n);
LABEL_11:
        v10 = 0;
        *a3 = v13;
        v11 = 10;
        goto LABEL_12;
      }
    }
    v10 = 4294967291;
LABEL_17:
    v11 = 70;
  }
LABEL_12:
  if (v11 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_ReadFromBuffer", (int)v10);
  return v10;
}

unint64_t Util_KeybagLockStateToEnvVar(unsigned int a1)
{
  unint64_t v1;

  v1 = 0x2010103020201uLL >> (8 * a1);
  if (a1 >= 7)
    LOBYTE(v1) = 1;
  return v1 & 3;
}

void Util_SafeDeallocParameters(unsigned int *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  if (a1)
  {
    v3 = a2;
    if (a2)
    {
      v4 = a1 + 4;
      v5 = a2;
      do
      {
        v6 = (void *)*((_QWORD *)v4 - 1);
        if (v6)
        {
          v7 = *v4;
          acm_mem_free_info("<data>", *((const void **)v4 - 1), v7, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 118, "Util_SafeDeallocParameters");
          acm_mem_free_data(v6, v7);
        }
        v4 += 6;
        --v5;
      }
      while (v5);
    }
    acm_mem_free_info("array of ACMParameter", a1, 24 * v3, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 121, "Util_SafeDeallocParameters");
    acm_mem_free(a1, 24 * v3);
  }
}

uint64_t Util_DeallocCredential(_DWORD *a1)
{
  uint64_t v2;
  unsigned int v3;
  const char *v4;
  rsize_t v5;
  const void *v6;
  unint64_t v7;
  int v8;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_DeallocCredential");
  if (a1)
  {
    v2 = 4294967293;
    v3 = 70;
    switch(*a1)
    {
      case 1:
        v4 = "ACMCredential - ACMCredentialDataPasscodeValidated";
        v5 = 60;
        v6 = a1;
        v7 = 60;
        v8 = 144;
        goto LABEL_6;
      case 2:
        v4 = "ACMCredential - ACMCredentialDataPassphraseEntered";
        v5 = 168;
        v6 = a1;
        v7 = 168;
        v8 = 136;
        goto LABEL_6;
      case 3:
        v4 = "ACMCredential - ACMCredentialDataBiometryMatched";
        v5 = 337;
        v6 = a1;
        v7 = 337;
        v8 = 140;
        goto LABEL_6;
      case 4:
      case 5:
      case 6:
      case 8:
      case 0xE:
      case 0x10:
      case 0x13:
      case 0x16:
      case 0x17:
        v4 = "ACMCredential";
        v5 = 32;
        v6 = a1;
        v7 = 32;
        v8 = 189;
        goto LABEL_6;
      case 7:
        v4 = "ACMCredential - ACMCredentialDataUserOutputDisplayed";
        v5 = 88;
        v6 = a1;
        v7 = 88;
        v8 = 152;
        goto LABEL_6;
      case 9:
        v4 = "ACMCredential - ACMCredentialDataContinuityUnlock";
        v5 = 56;
        v6 = a1;
        v7 = 56;
        v8 = 156;
        goto LABEL_6;
      case 0xA:
        v4 = "ACMCredential - ACMCredentialDataPasscodeValidated2";
        v5 = 84;
        v6 = a1;
        v7 = 84;
        v8 = 148;
        goto LABEL_6;
      case 0xC:
      case 0xF:
        v4 = "ACMCredential - ACMCredentialDataKextDenyList";
        v5 = 40;
        v6 = a1;
        v7 = 40;
        v8 = 161;
        goto LABEL_6;
      case 0xD:
        v4 = "ACMCredential - ACMCredentialDataPassphraseExtractable";
        v5 = 164;
        v6 = a1;
        v7 = 164;
        v8 = 132;
        goto LABEL_6;
      case 0x11:
        v4 = "ACMCredential - ACMCredentialDataSecureIntent";
        v5 = 113;
        v6 = a1;
        v7 = 113;
        v8 = 165;
        goto LABEL_6;
      case 0x12:
        v4 = "ACMCredential - ACMCredentialDataBiometryMatchAttempted";
        v5 = 52;
        v6 = a1;
        v7 = 52;
        v8 = 169;
        goto LABEL_6;
      case 0x14:
        v4 = "ACMCredential - ACMCredentialDataAP";
        v5 = 64;
        v6 = a1;
        v7 = 64;
        v8 = 173;
        goto LABEL_6;
      case 0x15:
        v4 = "ACMCredential - ACMCredentialDataSignature";
        v5 = 164;
        v6 = a1;
        v7 = 164;
        v8 = 177;
LABEL_6:
        acm_mem_free_info(v4, v6, v7, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v8, "Util_DeallocCredential");
        acm_mem_free(a1, v5);
        v2 = 0;
        v3 = 10;
        break;
      default:
        break;
    }
  }
  else
  {
    v2 = 4294967293;
    v3 = 70;
  }
  if (v3 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_DeallocCredential", (int)v2);
  return v2;
}

uint64_t Util_AllocCredential(int a1, _QWORD *a2)
{
  uint64_t result;
  _DWORD *v5;
  int v6;
  const char *v7;
  const void *v8;
  int v9;

  if (!a2)
    return 4294967293;
  result = 4294967293;
  switch(a1)
  {
    case 1:
      v5 = acm_mem_alloc(0x3CuLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataPasscodeValidated", v5, 60, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 226, "Util_AllocCredential");
      v6 = 28;
      goto LABEL_4;
    case 2:
      v5 = acm_mem_alloc(0xA8uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataPassphraseEntered", v5, 168, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 216, "Util_AllocCredential");
      v6 = 136;
      goto LABEL_4;
    case 3:
      v5 = acm_mem_alloc(0x151uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataBiometryMatched", v5, 337, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 221, "Util_AllocCredential");
      v6 = 305;
      goto LABEL_4;
    case 4:
    case 5:
    case 6:
    case 8:
    case 14:
    case 16:
    case 19:
    case 22:
    case 23:
      v5 = acm_mem_alloc(0x20uLL);
      acm_mem_alloc_info("ACMCredential", v5, 32, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 280, "Util_AllocCredential");
      v6 = 0;
      goto LABEL_4;
    case 7:
      v5 = acm_mem_alloc(0x58uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataUserOutputDisplayed", v5, 88, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 236, "Util_AllocCredential");
      v6 = 56;
      goto LABEL_4;
    case 9:
      v5 = acm_mem_alloc(0x38uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataContinuityUnlock", v5, 56, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 241, "Util_AllocCredential");
      v6 = 24;
      goto LABEL_4;
    case 10:
      v5 = acm_mem_alloc(0x54uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataPasscodeValidated2", v5, 84, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 231, "Util_AllocCredential");
      v6 = 52;
      goto LABEL_4;
    case 12:
    case 15:
      v5 = acm_mem_alloc(0x28uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataKextDenyList", v5, 40, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 247, "Util_AllocCredential");
      v6 = 8;
      goto LABEL_4;
    case 13:
      v5 = acm_mem_alloc(0xA4uLL);
      v7 = "ACMCredential - ACMCredentialDataPassphraseExtractable";
      v8 = v5;
      v9 = 211;
      goto LABEL_18;
    case 17:
      v5 = acm_mem_alloc(0x71uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataSecureIntent", v5, 113, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 252, "Util_AllocCredential");
      v6 = 81;
      goto LABEL_4;
    case 18:
      v5 = acm_mem_alloc(0x34uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataBiometryMatchAttempted", v5, 52, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 257, "Util_AllocCredential");
      v6 = 20;
      goto LABEL_4;
    case 20:
      v5 = acm_mem_alloc(0x40uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataAP", v5, 64, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 262, "Util_AllocCredential");
      v6 = 32;
      goto LABEL_4;
    case 21:
      v5 = acm_mem_alloc(0xA4uLL);
      v7 = "ACMCredential - ACMCredentialDataSignature";
      v8 = v5;
      v9 = 267;
LABEL_18:
      acm_mem_alloc_info(v7, v8, 164, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v9, "Util_AllocCredential");
      v6 = 132;
LABEL_4:
      if (v5)
      {
        result = 0;
        *v5 = a1;
        v5[1] = 1;
        v5[7] = v6;
        v5[3] = -1;
        *a2 = v5;
      }
      else
      {
        result = 4294967292;
      }
      break;
    default:
      return result;
  }
  return result;
}

uint64_t Util_AllocRequirement(int a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  unsigned int v7;
  _DWORD *v8;
  int v9;
  const char *v11;
  const void *v12;
  int v13;
  const char *v14;
  const void *v15;
  int v16;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_AllocRequirement");
  if (a3)
  {
    v6 = 4294967293;
    v7 = 70;
    switch(a1)
    {
      case 1:
        v8 = acm_mem_alloc(0x14uLL);
        v11 = "ACMRequirement - ACMRequirementDataPasscodeValidated";
        v12 = v8;
        v13 = 338;
        goto LABEL_49;
      case 2:
        v8 = acm_mem_alloc(0x14uLL);
        v11 = "ACMRequirement - ACMRequirementDataPassphraseEntered";
        v12 = v8;
        v13 = 343;
        goto LABEL_49;
      case 3:
        v8 = acm_mem_alloc(0xACuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataBiometryMatched", v8, 172, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 348, "Util_AllocRequirement");
        v9 = 156;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 4:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6)
          goto LABEL_53;
        v8 = acm_mem_alloc(0x64uLL);
        v14 = "ACMRequirement - ACMRequirementDataOr";
        v15 = v8;
        v16 = 406;
        goto LABEL_28;
      case 5:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6)
          goto LABEL_53;
        v8 = acm_mem_alloc(0x64uLL);
        v14 = "ACMRequirement - ACMRequirementDataAnd";
        v15 = v8;
        v16 = 398;
LABEL_28:
        acm_mem_alloc_info(v14, v15, 100, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v16, "Util_AllocRequirement");
        v9 = 84;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 6:
      case 9:
      case 10:
      case 11:
      case 12:
      case 14:
      case 15:
      case 18:
      case 19:
      case 22:
      case 23:
      case 27:
      case 28:
        v8 = acm_mem_alloc(0x10uLL);
        acm_mem_alloc_info("ACMRequirement", v8, 16, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 333, "Util_AllocRequirement");
        v9 = 0;
        if (v8)
          goto LABEL_6;
        goto LABEL_50;
      case 7:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6)
          goto LABEL_53;
        v8 = acm_mem_alloc(0x68uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKofN", v8, 104, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 391, "Util_AllocRequirement");
        v9 = 88;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 8:
        v8 = acm_mem_alloc(0x410uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataAccessGroups", v8, 1040, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 378, "Util_AllocRequirement");
        v9 = 1024;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 13:
        v8 = acm_mem_alloc(0x30uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataUserOutputDisplayed", v8, 48, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 363, "Util_AllocRequirement");
        v9 = 32;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 16:
      case 17:
        break;
      case 20:
        v8 = acm_mem_alloc(0x14uLL);
        v11 = "ACMRequirement - ACMRequirementDataSecureIntent";
        v12 = v8;
        v13 = 353;
        goto LABEL_49;
      case 21:
        v8 = acm_mem_alloc(0x14uLL);
        v11 = "ACMRequirement - ACMRequirementDataBiometryMatchAttempted";
        v12 = v8;
        v13 = 358;
LABEL_49:
        acm_mem_alloc_info(v11, v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v13, "Util_AllocRequirement");
        v9 = 4;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 24:
        v8 = acm_mem_alloc(0x434uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataAP", v8, 1076, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 368, "Util_AllocRequirement");
        v9 = 1060;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 25:
        v8 = acm_mem_alloc(0x3BuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKeyRef", v8, 59, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 373, "Util_AllocRequirement");
        v9 = 43;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 26:
        v8 = acm_mem_alloc(0x2CuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataRatchet", v8, 44, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 384, "Util_AllocRequirement");
        v9 = 28;
        if (!v8)
        {
LABEL_50:
          v6 = 4294967292;
          goto LABEL_54;
        }
LABEL_6:
        *v8 = a1;
        *(_QWORD *)(v8 + 1) = 0x100000001;
        v8[3] = v9;
        if ((a1 & 0xFFFFFFFE) == 4)
        {
          v8[4] = a2;
        }
        else if (a1 == 1000)
        {
          v8[13] = a2;
        }
        else if (a1 == 7)
        {
          v8[5] = a2;
        }
        v6 = 0;
        *a3 = v8;
        v7 = 10;
        break;
      default:
        switch(a1)
        {
          case 1000:
            if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6)
              goto LABEL_53;
            v8 = acm_mem_alloc(0x88uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKofNWithAttributes", v8, 136, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 414, "Util_AllocRequirement");
            v9 = 120;
            if (!v8)
              goto LABEL_50;
            goto LABEL_6;
          case 1001:
            v8 = acm_mem_alloc(0xB8uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataBiometryMatchedWithAttributes", v8, 184, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 419, "Util_AllocRequirement");
            v9 = 168;
            if (!v8)
              goto LABEL_50;
            goto LABEL_6;
          case 1002:
            v8 = acm_mem_alloc(0x14uLL);
            v11 = "ACMRequirement - ACMRequirementDataPushButtonWithAttributes";
            v12 = v8;
            v13 = 424;
            goto LABEL_49;
          case 1003:
            v8 = acm_mem_alloc(0x14uLL);
            v11 = "ACMRequirement - ACMRequirementDataSecureStateWithAttributes";
            v12 = v8;
            v13 = 429;
            goto LABEL_49;
          case 1004:
            v8 = acm_mem_alloc(0x20uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataPasscodeValidatedWithAttributes", v8, 32, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 434, "Util_AllocRequirement");
            v9 = 16;
            if (!v8)
              goto LABEL_50;
            goto LABEL_6;
          default:
            goto LABEL_17;
        }
    }
  }
  else
  {
LABEL_53:
    v6 = 4294967293;
LABEL_54:
    v7 = 70;
  }
LABEL_17:
  if (v7 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_AllocRequirement", (int)v6);
  return v6;
}

uint64_t Util_CreateRequirement(int a1, uint64_t a2)
{
  uint64_t v5;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_CreateRequirement");
  v5 = 0;
  Util_AllocRequirement(a1, a2, &v5);
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: returning.\n", "ACM", "Util_CreateRequirement");
  return v5;
}

uint64_t Util_DeallocRequirement(int *a1)
{
  int v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;
  const char *v9;
  rsize_t v10;
  int *v11;
  unint64_t v12;
  int v13;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_DeallocRequirement");
  if (!a1)
  {
    v7 = 4294967293;
    v8 = 70;
    goto LABEL_28;
  }
  v2 = *a1;
  if (*a1 > 6)
  {
    if (v2 == 7)
    {
      if (a1[5])
      {
        v6 = 0;
        do
          Util_DeallocRequirement(*(_QWORD *)&a1[2 * v6++ + 6]);
        while (v6 < a1[5]);
      }
    }
    else
    {
      if (v2 != 1000)
        goto LABEL_25;
      if (a1[13])
      {
        v4 = 0;
        do
          Util_DeallocRequirement(*(_QWORD *)&a1[2 * v4++ + 14]);
        while (v4 < a1[13]);
      }
    }
  }
  else if (v2 == 4)
  {
    if (a1[4])
    {
      v5 = 0;
      do
        Util_DeallocRequirement(*(_QWORD *)&a1[2 * v5++ + 5]);
      while (v5 < a1[4]);
    }
  }
  else
  {
    if (v2 != 5)
      goto LABEL_25;
    if (a1[4])
    {
      v3 = 0;
      do
        Util_DeallocRequirement(*(_QWORD *)&a1[2 * v3++ + 5]);
      while (v3 < a1[4]);
    }
  }
  v2 = *a1;
LABEL_25:
  v7 = 4294967293;
  v8 = 70;
  switch(v2)
  {
    case 1:
      v9 = "ACMRequirement - ACMRequirementDataPasscodeValidated";
      v10 = 20;
      v11 = a1;
      v12 = 20;
      v13 = 542;
      goto LABEL_27;
    case 2:
      v9 = "ACMRequirement - ACMRequirementDataPassphraseEntered";
      v10 = 20;
      v11 = a1;
      v12 = 20;
      v13 = 546;
      goto LABEL_27;
    case 3:
      v9 = "ACMRequirement - ACMRequirementDataBiometryMatched";
      v10 = 172;
      v11 = a1;
      v12 = 172;
      v13 = 550;
      goto LABEL_27;
    case 4:
      v9 = "ACMRequirement - ACMRequirementDataOr";
      v10 = 100;
      v11 = a1;
      v12 = 100;
      v13 = 595;
      goto LABEL_27;
    case 5:
      v9 = "ACMRequirement - ACMRequirementDataAnd";
      v10 = 100;
      v11 = a1;
      v12 = 100;
      v13 = 589;
      goto LABEL_27;
    case 6:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
    case 15:
    case 18:
    case 19:
    case 22:
    case 23:
    case 27:
    case 28:
      v9 = "ACMRequirement";
      v10 = 16;
      v11 = a1;
      v12 = 16;
      v13 = 538;
      goto LABEL_27;
    case 7:
      v9 = "ACMRequirement - ACMRequirementDataKofN";
      v10 = 104;
      v11 = a1;
      v12 = 104;
      v13 = 584;
      goto LABEL_27;
    case 8:
      v9 = "ACMRequirement - ACMRequirementDataAccessGroups";
      v10 = 1040;
      v11 = a1;
      v12 = 1040;
      v13 = 574;
      goto LABEL_27;
    case 13:
      v9 = "ACMRequirement - ACMRequirementDataUserOutputDisplayed";
      v10 = 48;
      v11 = a1;
      v12 = 48;
      v13 = 562;
      goto LABEL_27;
    case 16:
    case 17:
      break;
    case 20:
      v9 = "ACMRequirement - ACMRequirementDataSecureIntent";
      v10 = 20;
      v11 = a1;
      v12 = 20;
      v13 = 554;
      goto LABEL_27;
    case 21:
      v9 = "ACMRequirement - ACMRequirementDataBiometryMatchAttempted";
      v10 = 20;
      v11 = a1;
      v12 = 20;
      v13 = 558;
      goto LABEL_27;
    case 24:
      v9 = "ACMRequirement - ACMRequirementDataAP";
      v10 = 1076;
      v11 = a1;
      v12 = 1076;
      v13 = 566;
      goto LABEL_27;
    case 25:
      v9 = "ACMRequirement - ACMRequirementDataKeyRef";
      v10 = 59;
      v11 = a1;
      v12 = 59;
      v13 = 570;
      goto LABEL_27;
    case 26:
      v9 = "ACMRequirement - ACMRequirementDataRatchet";
      v10 = 44;
      v11 = a1;
      v12 = 44;
      v13 = 579;
LABEL_27:
      acm_mem_free_info(v9, v11, v12, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v13, "Util_DeallocRequirement");
      acm_mem_free(a1, v10);
      v7 = 0;
      v8 = 10;
      break;
    default:
      switch(v2)
      {
        case 1000:
          v9 = "ACMRequirement - ACMRequirementDataKofNWithAttributes";
          v10 = 136;
          v11 = a1;
          v12 = 136;
          v13 = 601;
          goto LABEL_27;
        case 1001:
          v9 = "ACMRequirement - ACMRequirementDataBiometryMatchedWithAttributes";
          v10 = 184;
          v11 = a1;
          v12 = 184;
          v13 = 605;
          goto LABEL_27;
        case 1002:
          v9 = "ACMRequirement - ACMRequirementDataPushButtonWithAttributes";
          v10 = 20;
          v11 = a1;
          v12 = 20;
          v13 = 609;
          goto LABEL_27;
        case 1003:
          v9 = "ACMRequirement - ACMRequirementDataSecureStateWithAttributes";
          v10 = 20;
          v11 = a1;
          v12 = 20;
          v13 = 613;
          goto LABEL_27;
        case 1004:
          v9 = "ACMRequirement - ACMRequirementDataPasscodeValidatedWithAttributes";
          v10 = 32;
          v11 = a1;
          v12 = 32;
          v13 = 617;
          goto LABEL_27;
        default:
          goto LABEL_28;
      }
  }
LABEL_28:
  if (v8 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_DeallocRequirement", (int)v7);
  return v7;
}

void Util_hexDumpToStrHelper_cold_1()
{
  __assert_rtn("Util_hexDumpToStrHelper", "CommonUtil.c", 32, "src || !srcLen");
}

void Util_hexDumpToStrHelper_cold_2()
{
  __assert_rtn("Util_hexDumpToStrHelper", "CommonUtil.c", 33, "dst || !dstCapacity");
}

uint64_t ACMContextCreate(uint64_t *a1)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMContextCreate";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v6 = 0;
  v2 = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _BYTE *, uint64_t *))ioKitTransport, (uint64_t)&v6, a1, &_logLevel, 1);
  if ((_DWORD)v2)
  {
    updateLogLevelFromKext();
    v3 = 70;
  }
  else
  {
    v3 = 10;
    if (a1 && _logLevel <= 0x28u)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        v4 = *a1;
        if (*a1)
          LODWORD(v4) = *(_DWORD *)(v4 + 16);
        *(_DWORD *)buf = 136315650;
        v8 = "ACMLib";
        v9 = 2080;
        v10 = "ACMContextCreate";
        v11 = 1024;
        LODWORD(v12) = v4;
        _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: CS[%u] created.\n", buf, 0x1Cu);
      }
      v3 = 10;
    }
  }
  if (v3 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMContextCreate";
    v11 = 2048;
    v12 = (int)v2;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v2;
}

uint64_t ioKitTransport(uint64_t *a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v18 = 136315394;
    v19 = "ACMLib";
    v20 = 2080;
    v21 = "ioKitTransport";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v18, 0x16u);
  }
  if (a1)
  {
    v14 = init();
    v15 = 70;
    if ((_DWORD)v14)
    {
      v16 = v14;
    }
    else
    {
      v16 = performCommand(*a1, a2, a3, a4, a5, a6, a7);
      if ((_DWORD)v16)
        v15 = 70;
      else
        v15 = 10;
    }
  }
  else
  {
    v15 = 70;
    v16 = 4294967293;
  }
  if (v15 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v18 = 136315650;
    v19 = "ACMLib";
    v20 = 2080;
    v21 = "ioKitTransport";
    v22 = 2048;
    v23 = (int)v16;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v18, 0x20u);
  }
  return v16;
}

_DWORD *ACMContextCreateWithExternalForm(_OWORD *a1, uint64_t a2)
{
  _DWORD *v4;
  int v5;
  unsigned int v6;
  uint64_t v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  _DWORD *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "ACMLib";
    v11 = 2080;
    v12 = "ACMContextCreateWithExternalForm";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v8 = 0;
  v4 = LibCall_ACMContextCreateWithExternalForm((uint64_t (*)(uint64_t, uint64_t, _QWORD, _OWORD *, uint64_t, _QWORD *, uint64_t *))ioKitTransport, (uint64_t)&v8, a1, a2, &_logLevel, 1);
  if (v4)
  {
    if (_logLevel <= 0x28u && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v5 = v4[4];
      *(_DWORD *)buf = 136315650;
      v10 = "ACMLib";
      v11 = 2080;
      v12 = "ACMContextCreateWithExternalForm";
      v13 = 1024;
      LODWORD(v14) = v5;
      _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: CS[%u] acquired.\n", buf, 0x1Cu);
    }
    v6 = 30;
  }
  else
  {
    updateLogLevelFromKext();
    v6 = 70;
  }
  if (v6 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "ACMLib";
    v11 = 2080;
    v12 = "ACMContextCreateWithExternalForm";
    v13 = 2048;
    v14 = v4;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, -> ctx = %p.\n", buf, 0x20u);
  }
  return v4;
}

uint64_t ACMContextDelete(_DWORD *a1, int a2)
{
  unsigned int v4;
  int v5;
  const char *v6;
  uint64_t v7;
  unsigned int v8;
  _DWORD *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v4 = _logLevel;
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextDelete";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
    v4 = _logLevel;
  }
  if (a1 && v4 <= 0x28 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    v6 = "deleted";
    *(_DWORD *)buf = 136315906;
    v12 = "ACMLib";
    v14 = "ACMContextDelete";
    v13 = 2080;
    if (a2)
      v6 = "destroyed";
    v15 = 1024;
    LODWORD(v16[0]) = v5;
    WORD2(v16[0]) = 2080;
    *(_QWORD *)((char *)v16 + 6) = v6;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: CS[%u] %s.\n", buf, 0x26u);
  }
  v10 = a1;
  v7 = LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, _QWORD, void *, uint64_t, _QWORD, _QWORD))ioKitTransport, (uint64_t)&v10, a1, a2);
  if ((_DWORD)v7)
    v8 = 70;
  else
    v8 = 10;
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextDelete";
    v15 = 2048;
    v16[0] = (int)v7;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

void ACMContextGetExternalForm(const void *a1, uint64_t a2)
{
  int v4;
  const char *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "ACMContextGetExternalForm";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v4, 0x16u);
  }
  if (!a1 || !a2 || init() || performCommand((uint64_t)a1, 19, 0, a1, 0x10uLL, 0, 0))
    (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, 0, 0);
  else
    (*(void (**)(uint64_t, const void *, uint64_t))(a2 + 16))(a2, a1, 16);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "ACMContextGetExternalForm";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", (uint8_t *)&v4, 0x16u);
  }
}

uint64_t init()
{
  uint64_t v0;
  mach_port_t v1;
  const __CFDictionary *v2;
  io_service_t MatchingService;
  io_object_t v4;
  unsigned int v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "init";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v7, 0x16u);
  }
  if ((_initialized & 1) != 0)
  {
    v0 = 0;
  }
  else
  {
    v1 = *MEMORY[0x24BDD8B20];
    v2 = IOServiceMatching("AppleCredentialManager");
    MatchingService = IOServiceGetMatchingService(v1, v2);
    if (!MatchingService)
    {
      v5 = 70;
      v0 = 4294967291;
      goto LABEL_10;
    }
    v4 = MatchingService;
    v0 = IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, (io_connect_t *)&_connect);
    if ((_DWORD)v0)
    {
      v5 = 70;
      goto LABEL_10;
    }
    IOObjectRelease(v4);
    _initialized = 1;
  }
  v5 = 10;
LABEL_10:
  if (v5 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v7 = 136315650;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "init";
    v11 = 2048;
    v12 = (int)v0;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v7, 0x20u);
  }
  return v0;
}

uint64_t performCommand(uint64_t a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  _BYTE *v14;
  void *v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  rsize_t v19;
  unsigned int v20;
  size_t v22;
  size_t inputStructCnt;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  _BYTE v29[10];
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "ACMLib";
    v26 = 2080;
    v27 = "performCommand";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  inputStructCnt = 0;
  v14 = LibCall_BuildCommand(a2, 0, a3, a4, a5, &inputStructCnt);
  if (v14)
  {
    v15 = v14;
    if (!a6 && a7)
    {
      v18 = 4294967293;
    }
    else
    {
      if (a7)
        v16 = *a7;
      else
        v16 = 0;
      v22 = v16;
      v17 = IOConnectCallStructMethod(_connect, 0, v14, inputStructCnt, a6, &v22);
      v18 = v17;
      if (a1)
        LODWORD(a1) = *(_DWORD *)(a1 + 16);
      if ((_DWORD)v17)
      {
        if (_logLevel <= 0x46u && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316418;
          v25 = "ACMLib";
          v26 = 2080;
          v27 = "performCommand";
          v28 = 1024;
          *(_DWORD *)v29 = a2;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          v30 = 1024;
          v31 = v18;
          v32 = 1024;
          v33 = v18;
          _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: cmd(%u) on CS[%u] -> err 0x%x (%d).\n", buf, 0x2Eu);
        }
      }
      else
      {
        if (_logLevel <= 0x28u && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          v25 = "ACMLib";
          v26 = 2080;
          v27 = "performCommand";
          v28 = 1024;
          *(_DWORD *)v29 = a2;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: cmd(%u) on CS[%u] -> ok.\n", buf, 0x22u);
        }
        v18 = 0;
        if (a7)
          *a7 = v22;
      }
    }
    v19 = inputStructCnt;
    acm_mem_free_info("<data>", v15, inputStructCnt, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 134, "performCommand");
    acm_mem_free_data(v15, v19);
    if ((_DWORD)v18)
      v20 = 70;
    else
      v20 = 10;
  }
  else
  {
    v20 = 70;
    v18 = 4294967291;
  }
  if (v20 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "ACMLib";
    v26 = 2080;
    v27 = "performCommand";
    v28 = 2048;
    *(_QWORD *)v29 = (int)v18;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v18;
}

uint64_t ACMContextAddCredential(_OWORD *a1, unsigned int *a2)
{
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMContextAddCredential";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextAddCredentialWithScope(a1, a2, 1);
}

uint64_t ACMContextAddCredentialWithScope(_OWORD *a1, unsigned int *a2, int a3)
{
  BOOL v6;
  char v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t SerializedAddCredentialSize;
  size_t v11;
  void *v12;
  uint64_t v13;
  rsize_t v14;
  size_t size;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "ACMLib";
    v19 = 2080;
    v20 = "ACMContextAddCredentialWithScope";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size = 0;
  if (a1)
    v6 = 1;
  else
    v6 = a3 == 2;
  v7 = !v6;
  v8 = 70;
  v9 = 4294967293;
  if (a2 && (v7 & 1) == 0)
  {
    SerializedAddCredentialSize = init();
    if ((_DWORD)SerializedAddCredentialSize
      || (SerializedAddCredentialSize = GetSerializedAddCredentialSize((uint64_t)a1, a2, a3, &size),
          (_DWORD)SerializedAddCredentialSize))
    {
      v9 = SerializedAddCredentialSize;
      v8 = 70;
    }
    else
    {
      v11 = size;
      v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 325, "ACMContextAddCredentialWithScope");
      if (v12)
      {
        v13 = SerializeAddCredential(a1, a2, a3, (uint64_t)v12, &size);
        if (!(_DWORD)v13)
          v13 = performCommand((uint64_t)a1, 5, 0, v12, size, 0, 0);
        v9 = v13;
        v14 = size;
        acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 338, "ACMContextAddCredentialWithScope");
        acm_mem_free_data(v12, v14);
        if ((_DWORD)v9)
          v8 = 70;
        else
          v8 = 10;
      }
      else
      {
        v8 = 70;
        v9 = 4294967292;
      }
    }
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "ACMLib";
    v19 = 2080;
    v20 = "ACMContextAddCredentialWithScope";
    v21 = 2048;
    v22 = (int)v9;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v9;
}

uint64_t ACMContextRemoveCredentialsByType(_OWORD *a1, int a2)
{
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMContextRemoveCredentialsByType";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextRemoveCredentialsByTypeAndScope(a1, a2, 1);
}

uint64_t ACMContextRemoveCredentialsByTypeAndScope(_OWORD *a1, int a2, int a3)
{
  uint64_t v6;
  _OWORD *v7;
  uint64_t v8;
  unsigned int v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextRemoveCredentialsByTypeAndScope";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  if (a1 || a3 == 2)
  {
    v6 = init();
    if ((_DWORD)v6)
    {
      v8 = v6;
      v9 = 70;
    }
    else
    {
      v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 386, "ACMContextRemoveCredentialsByTypeAndScope");
      if (v7)
      {
        if (a1)
        {
          *v7 = *a1;
        }
        else
        {
          *(_QWORD *)v7 = 0;
          *((_QWORD *)v7 + 1) = 0;
        }
        *((_DWORD *)v7 + 4) = a2;
        *((_DWORD *)v7 + 5) = a3;
        v8 = performCommand((uint64_t)a1, 9, 0, v7, 0x18uLL, 0, 0);
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 407, "ACMContextRemoveCredentialsByTypeAndScope");
        acm_mem_free_data(v7, 0x18uLL);
        if ((_DWORD)v8)
          v9 = 70;
        else
          v9 = 10;
      }
      else
      {
        v9 = 70;
        v8 = 4294967292;
      }
    }
  }
  else
  {
    v9 = 70;
    v8 = 4294967293;
  }
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v11 = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextRemoveCredentialsByTypeAndScope";
    v15 = 2048;
    v16 = (int)v8;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return v8;
}

uint64_t ACMContextRemoveCredentialsByValue(uint64_t a1, _DWORD *a2)
{
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMContextRemoveCredentialsByValue";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextRemoveCredentialsByValueAndScope(a1, a2, 1);
}

uint64_t ACMContextRemoveCredentialsByValueAndScope(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  BOOL v6;
  char v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t SerializedAddCredentialSize;
  size_t v11;
  void *v12;
  uint64_t v13;
  rsize_t v14;
  size_t size;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "ACMLib";
    v19 = 2080;
    v20 = "ACMContextRemoveCredentialsByValueAndScope";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size = 0;
  if (a1)
    v6 = 1;
  else
    v6 = (_DWORD)a3 == 2;
  v7 = !v6;
  v8 = 70;
  v9 = 4294967293;
  if (a2 && (v7 & 1) == 0)
  {
    SerializedAddCredentialSize = init();
    if ((_DWORD)SerializedAddCredentialSize
      || (SerializedAddCredentialSize = GetSerializedAddCredentialSize(a1, a2, a3, &size),
          (_DWORD)SerializedAddCredentialSize))
    {
      v9 = SerializedAddCredentialSize;
      v8 = 70;
    }
    else
    {
      v11 = size;
      v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 457, "ACMContextRemoveCredentialsByValueAndScope");
      if (v12)
      {
        v13 = SerializeRemoveCredential(a1, a2, a3, v12, &size);
        if (!(_DWORD)v13)
          v13 = performCommand(a1, 6, 0, v12, size, 0, 0);
        v9 = v13;
        v14 = size;
        acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 470, "ACMContextRemoveCredentialsByValueAndScope");
        acm_mem_free_data(v12, v14);
        if ((_DWORD)v9)
          v8 = 70;
        else
          v8 = 10;
      }
      else
      {
        v8 = 70;
        v9 = 4294967292;
      }
    }
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "ACMLib";
    v19 = 2080;
    v20 = "ACMContextRemoveCredentialsByValueAndScope";
    v21 = 2048;
    v22 = (int)v9;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v9;
}

uint64_t ACMContextContainsCredentialType(_OWORD *a1, int a2)
{
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMContextContainsCredentialType";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextContainsCredentialTypeEx(a1, a2, 0);
}

uint64_t ACMContextContainsCredentialTypeEx(_OWORD *a1, int a2, int a3)
{
  uint64_t v6;
  _DWORD *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  size_t v13;
  int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextContainsCredentialTypeEx";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v14 = 0;
  v13 = 4;
  if (a1)
  {
    v6 = init();
    if ((_DWORD)v6)
    {
      v11 = v6;
      v8 = 70;
    }
    else
    {
      v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 576, "ACMContextContainsCredentialTypeEx");
      v8 = 70;
      if (v7)
      {
        *(_OWORD *)v7 = *a1;
        v7[4] = a2;
        v7[5] = a3;
        v9 = performCommand((uint64_t)a1, 4, 0, v7, 0x18uLL, &v14, &v13);
        if (v14)
          v10 = 0;
        else
          v10 = -7;
        if (v9)
          v11 = v9;
        else
          v11 = v10;
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 590, "ACMContextContainsCredentialTypeEx");
        acm_mem_free_data(v7, 0x18uLL);
        if ((_DWORD)v11)
          v8 = 70;
        else
          v8 = 10;
      }
      else
      {
        v11 = 4294967292;
      }
    }
  }
  else
  {
    v8 = 70;
    v11 = 4294967293;
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextContainsCredentialTypeEx";
    v19 = 2048;
    v20 = (int)v11;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v11;
}

uint64_t ACMGlobalContextAddCredential(unsigned int *a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  _DWORD *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMGlobalContextAddCredential";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v6 = 0;
  if (a1)
  {
    v2 = ACMContextCreate((uint64_t *)&v6);
    if (!(_DWORD)v2)
      v2 = ACMContextAddCredentialWithScope(v6, a1, 2);
    v3 = v2;
    if (v6)
      ACMContextDelete(v6, 1);
    if ((_DWORD)v3)
      v4 = 70;
    else
      v4 = 10;
  }
  else
  {
    v4 = 70;
    v3 = 4294967293;
  }
  if (v4 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMGlobalContextAddCredential";
    v11 = 2048;
    v12 = (int)v3;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v3;
}

uint64_t ACMGlobalContextRemoveCredentialsByType(int a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  _DWORD *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMGlobalContextRemoveCredentialsByType";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v6 = 0;
  v2 = ACMContextCreate((uint64_t *)&v6);
  if (!(_DWORD)v2)
    v2 = ACMContextRemoveCredentialsByTypeAndScope(v6, a1, 2);
  v3 = v2;
  if (v6)
    ACMContextDelete(v6, 1);
  if ((_DWORD)v3)
    v4 = 70;
  else
    v4 = 10;
  if (v4 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMGlobalContextRemoveCredentialsByType";
    v11 = 2048;
    v12 = (int)v3;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v3;
}

uint64_t ACMContextRemovePassphraseCredentialsByPurposeAndScope(_OWORD *a1, int a2, int a3)
{
  uint64_t v6;
  _OWORD *v7;
  uint64_t v8;
  unsigned int v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextRemovePassphraseCredentialsByPurposeAndScope";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  if (a1 || a3 == 2)
  {
    v6 = init();
    if ((_DWORD)v6)
    {
      v8 = v6;
      v9 = 70;
    }
    else
    {
      v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 492, "ACMContextRemovePassphraseCredentialsByPurposeAndScope");
      if (v7)
      {
        if (a1)
        {
          *v7 = *a1;
        }
        else
        {
          *(_QWORD *)v7 = 0;
          *((_QWORD *)v7 + 1) = 0;
        }
        *((_DWORD *)v7 + 4) = a2;
        *((_DWORD *)v7 + 5) = a3;
        v8 = performCommand((uint64_t)a1, 16, 0, v7, 0x18uLL, 0, 0);
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 513, "ACMContextRemovePassphraseCredentialsByPurposeAndScope");
        acm_mem_free_data(v7, 0x18uLL);
        if ((_DWORD)v8)
          v9 = 70;
        else
          v9 = 10;
      }
      else
      {
        v9 = 70;
        v8 = 4294967292;
      }
    }
  }
  else
  {
    v9 = 70;
    v8 = 4294967293;
  }
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v11 = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextRemovePassphraseCredentialsByPurposeAndScope";
    v15 = 2048;
    v16 = (int)v8;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return v8;
}

uint64_t ACMContextReplacePassphraseCredentialsWithScope(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  BOOL v6;
  char v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t SerializedAddCredentialSize;
  size_t v11;
  void *v12;
  uint64_t v13;
  rsize_t v14;
  size_t size;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "ACMLib";
    v19 = 2080;
    v20 = "ACMContextReplacePassphraseCredentialsWithScope";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size = 0;
  if (a1)
    v6 = 1;
  else
    v6 = (_DWORD)a3 == 2;
  v7 = !v6;
  v8 = 70;
  v9 = 4294967293;
  if (a2 && (v7 & 1) == 0)
  {
    SerializedAddCredentialSize = init();
    if ((_DWORD)SerializedAddCredentialSize
      || (SerializedAddCredentialSize = GetSerializedAddCredentialSize(a1, a2, a3, &size),
          (_DWORD)SerializedAddCredentialSize))
    {
      v9 = SerializedAddCredentialSize;
      v8 = 70;
    }
    else
    {
      v11 = size;
      v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 538, "ACMContextReplacePassphraseCredentialsWithScope");
      if (v12)
      {
        v13 = SerializeRemoveCredential(a1, a2, a3, v12, &size);
        if (!(_DWORD)v13)
          v13 = performCommand(a1, 15, 0, v12, size, 0, 0);
        v9 = v13;
        bzero(v12, size);
        v14 = size;
        acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 552, "ACMContextReplacePassphraseCredentialsWithScope");
        acm_mem_free_data(v12, v14);
        if ((_DWORD)v9)
          v8 = 70;
        else
          v8 = 10;
      }
      else
      {
        v8 = 70;
        v9 = 4294967292;
      }
    }
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "ACMLib";
    v19 = 2080;
    v20 = "ACMContextReplacePassphraseCredentialsWithScope";
    v21 = 2048;
    v22 = (int)v9;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v9;
}

uint64_t ACMContextContainsPassphraseCredentialWithPurpose(_OWORD *a1, int a2, int a3)
{
  uint64_t v6;
  _DWORD *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  size_t v13;
  int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextContainsPassphraseCredentialWithPurpose";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v14 = 0;
  v13 = 4;
  if (a1)
  {
    v6 = init();
    if ((_DWORD)v6)
    {
      v11 = v6;
      v8 = 70;
    }
    else
    {
      v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 614, "ACMContextContainsPassphraseCredentialWithPurpose");
      v8 = 70;
      if (v7)
      {
        *(_OWORD *)v7 = *a1;
        v7[4] = a2;
        v7[5] = a3;
        v9 = performCommand((uint64_t)a1, 13, 0, v7, 0x18uLL, &v14, &v13);
        if (v14)
          v10 = 0;
        else
          v10 = -7;
        if (v9)
          v11 = v9;
        else
          v11 = v10;
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 628, "ACMContextContainsPassphraseCredentialWithPurpose");
        acm_mem_free_data(v7, 0x18uLL);
        if ((_DWORD)v11)
          v8 = 70;
        else
          v8 = 10;
      }
      else
      {
        v11 = 4294967292;
      }
    }
  }
  else
  {
    v8 = 70;
    v11 = 4294967293;
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextContainsPassphraseCredentialWithPurpose";
    v19 = 2048;
    v20 = (int)v11;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v11;
}

uint64_t ACMContextVerifyPolicy(_OWORD *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  unsigned int v7;
  _OWORD *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "ACMLib";
    v12 = 2080;
    v13 = "ACMContextVerifyPolicy";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v9 = a1;
  v6 = LibCall_ACMContextVerifyPolicy_Block((uint64_t (*)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v9, a1, a2, a3);
  if ((_DWORD)v6)
    v7 = 70;
  else
    v7 = 10;
  if (v7 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "ACMLib";
    v12 = 2080;
    v13 = "ACMContextVerifyPolicy";
    v14 = 2048;
    v15 = (int)v6;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v6;
}

uint64_t ACMContextVerifyPolicyWithPreflight(_OWORD *a1, char *__s1, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  unsigned int v9;
  _OWORD *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "ACMLib";
    v14 = 2080;
    v15 = "ACMContextVerifyPolicyWithPreflight";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v11 = a1;
  v8 = LibCall_ACMContextVerifyPolicyWithPreflight_Block((uint64_t (*)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v11, a1, __s1, a3, a4);
  if ((_DWORD)v8)
    v9 = 70;
  else
    v9 = 10;
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "ACMLib";
    v14 = 2080;
    v15 = "ACMContextVerifyPolicyWithPreflight";
    v16 = 2048;
    v17 = (int)v8;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v8;
}

void ACMContextVerifyPolicyEx(_OWORD *a1, char *__s1, uint64_t a3, _DWORD *a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  _OWORD *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextVerifyPolicyEx";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v14 = a1;
  LibCall_ACMContextVerifyPolicyEx_Block((uint64_t (*)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v14, a1, __s1, a3, a4, a5, a6, a7);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextVerifyPolicyEx";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

void ACMGlobalContextVerifyPolicy(char *a1, uint64_t a2, _DWORD *a3, unsigned int a4, uint64_t a5)
{
  uint64_t v10;
  int v11[2];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "ACMLib";
    v14 = 2080;
    v15 = "ACMGlobalContextVerifyPolicy";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  *(_QWORD *)v11 = 0;
  v10 = ACMContextCreate((uint64_t *)v11);
  if ((_DWORD)v10)
  {
    if (a5)
      (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(a5 + 16))(a5, v10, 0, 0);
  }
  else
  {
    ACMContextVerifyPolicyEx(*(_OWORD **)v11, a1, a2, a3, a4, 0xFFFFFFFFLL, a5);
  }
  if (*(_QWORD *)v11)
    ACMContextDelete(*(_DWORD **)v11, 1);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "ACMLib";
    v14 = 2080;
    v15 = "ACMGlobalContextVerifyPolicy";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

uint64_t ACMContextVerifyAclConstraint(_OWORD *a1, const void *a2, uint64_t a3, unsigned __int8 a4, _DWORD *a5, unsigned int a6, unsigned int a7, uint64_t a8)
{
  _OWORD *v9;

  v9 = a1;
  return LibCall_ACMContextVerifyAclConstraint((uint64_t)ioKitTransport, (uint64_t)&v9, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t ACMContextVerifyAclConstraintForOperation(_OWORD *a1, const void *a2, uint64_t a3, const void *a4, unsigned int a5, unsigned __int8 a6, _DWORD *a7, unsigned int a8, unsigned int a9, uint64_t a10)
{
  _OWORD *v11;

  v11 = a1;
  return LibCall_ACMContextVerifyAclConstraintForOperation((uint64_t)ioKitTransport, (uint64_t)&v11, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t ACMContextGetTrackingNumber(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 16);
  return result;
}

uint64_t ACMParseAclAndCopyConstraintCharacteristics(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t SerializedProcessAclSize;
  size_t v8;
  void *v9;
  uint64_t v10;
  size_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  rsize_t v15;
  rsize_t v16;
  unsigned int v17;
  size_t __n;
  size_t size;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  __n = 4096;
  size = 0;
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "ACMLib";
    v23 = 2080;
    v24 = "ACMParseAclAndCopyConstraintCharacteristics";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v6 = 4294967293;
  if (!a1 || !a2 || !a3)
    goto LABEL_28;
  SerializedProcessAclSize = init();
  if ((_DWORD)SerializedProcessAclSize
    || (SerializedProcessAclSize = GetSerializedProcessAclSize(0, (uint64_t)a1, a2, 0, 0, 0, 0, 0, &size),
        (_DWORD)SerializedProcessAclSize))
  {
    v6 = SerializedProcessAclSize;
LABEL_28:
    (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t))(a3 + 16))(a3, v6, 0, 4096);
    goto LABEL_19;
  }
  v8 = size;
  v9 = acm_mem_alloc_data(size);
  acm_mem_alloc_info("<data>", v9, v8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 744, "ACMParseAclAndCopyConstraintCharacteristics");
  if (!v9)
  {
    v6 = 4294967292;
    goto LABEL_28;
  }
  v10 = SerializeProcessAcl(0, a1, a2, 0, 0, 0, 0, 0, (uint64_t)v9, &size);
  if ((_DWORD)v10)
  {
    v6 = v10;
    v12 = 0;
    v14 = 0;
    v11 = 4096;
    goto LABEL_15;
  }
  v11 = 4096;
  v12 = acm_mem_alloc_data(0x1000uLL);
  acm_mem_alloc_info("<data>", v12, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 750, "ACMParseAclAndCopyConstraintCharacteristics");
  if (!v12)
  {
    v14 = 0;
LABEL_31:
    v6 = 4294967292;
    goto LABEL_15;
  }
  v13 = performCommand(0, 20, 0, v9, size, v12, &__n);
  v11 = __n;
  if ((_DWORD)v13)
  {
    v6 = v13;
    v14 = 0;
    goto LABEL_15;
  }
  v14 = acm_mem_alloc_data(__n);
  acm_mem_alloc_info("<data>", v14, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 756, "ACMParseAclAndCopyConstraintCharacteristics");
  v11 = __n;
  if (!v14)
    goto LABEL_31;
  memcpy(v14, v12, __n);
  v6 = 0;
  v11 = __n;
LABEL_15:
  (*(void (**)(uint64_t, uint64_t, void *, size_t))(a3 + 16))(a3, v6, v14, v11);
  v15 = size;
  acm_mem_free_info("<data>", v9, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 767, "ACMParseAclAndCopyConstraintCharacteristics");
  acm_mem_free_data(v9, v15);
  if (v12)
  {
    acm_mem_free_info("<data>", v12, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 770, "ACMParseAclAndCopyConstraintCharacteristics");
    acm_mem_free_data(v12, 0x1000uLL);
  }
  if (v14)
  {
    v16 = __n;
    acm_mem_free_info("<data>", v14, __n, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 773, "ACMParseAclAndCopyConstraintCharacteristics");
    acm_mem_free_data(v14, v16);
  }
LABEL_19:
  if ((_DWORD)v6)
    v17 = 70;
  else
    v17 = 10;
  if (v17 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "ACMLib";
    v23 = 2080;
    v24 = "ACMParseAclAndCopyConstraintCharacteristics";
    v25 = 2048;
    v26 = (int)v6;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v6;
}

uint64_t ACMCredentialGetProperty(int *a1, int a2, uint64_t a3)
{
  unsigned int v6;
  uint64_t v7;
  uint64_t v9;
  int *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMCredentialGetProperty";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v9 = 0;
  v10 = 0;
  v6 = 70;
  v7 = 4294967293;
  if (a1 && a3)
  {
    v7 = LibCall_ACMCredentialGetPropertyData(a1, a2, &v10, &v9);
    if ((_DWORD)v7)
    {
      v6 = 70;
    }
    else
    {
      (*(void (**)(uint64_t, int *, uint64_t))(a3 + 16))(a3, v10, v9);
      v6 = 10;
    }
  }
  if (v6 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMCredentialGetProperty";
    v15 = 2048;
    v16 = (int)v7;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

void ACMRequirementGetSubrequirements(int *a1, uint64_t a2)
{
  int v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMRequirementGetSubrequirements";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v8, 0x16u);
  }
  if (a1 && a2)
  {
    v4 = *a1;
    if (*a1 == 4)
    {
      if (a1[4])
      {
        v6 = 0;
        do
          (*(void (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)&a1[2 * v6++ + 5]);
        while (v6 < a1[4]);
      }
    }
    else if (v4 == 5)
    {
      if (a1[4])
      {
        v7 = 0;
        do
          (*(void (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)&a1[2 * v7++ + 5]);
        while (v7 < a1[4]);
      }
    }
    else if (v4 == 7 && a1[5])
    {
      v5 = 0;
      do
        (*(void (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)&a1[2 * v5++ + 6]);
      while (v5 < a1[5]);
    }
  }
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMRequirementGetSubrequirements";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", (uint8_t *)&v8, 0x16u);
  }
}

uint64_t ACMRequirementGetProperty(int *a1, int a2, uint64_t a3)
{
  unsigned int v6;
  uint64_t v7;
  unint64_t v9;
  int *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMRequirementGetProperty";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v9 = 0;
  v10 = 0;
  v6 = 70;
  v7 = 4294967293;
  if (a1 && a3)
  {
    v7 = LibCall_ACMRequirementGetPropertyData(a1, a2, &v10, &v9);
    if ((_DWORD)v7)
    {
      v6 = 70;
    }
    else
    {
      (*(void (**)(uint64_t, int *, unint64_t))(a3 + 16))(a3, v10, v9);
      v6 = 10;
    }
  }
  if (v6 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMRequirementGetProperty";
    v15 = 2048;
    v16 = (int)v7;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

uint64_t ACMRequirementGetProperties(int *a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;
  int v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMRequirementGetProperties";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v8, 0x16u);
  }
  v4 = 4294967293;
  v5 = 70;
  if (a1 && a2)
  {
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 1, a1, 4);
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 2, a1 + 1, 4);
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 3, a1 + 2, 4);
    v4 = 0;
    v6 = *a1;
    v5 = 10;
    switch(*a1)
    {
      case 1:
        goto LABEL_10;
      case 2:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 200, a1 + 4, 4);
        goto LABEL_13;
      case 3:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 100, a1 + 4, 4);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 300, a1 + 5, 8);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 302, a1 + 9, 8);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 301, a1 + 13, 8);
        goto LABEL_13;
      case 4:
      case 5:
      case 6:
        break;
      case 7:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 700, a1 + 4, 4);
        goto LABEL_13;
      default:
        if (v6 != 20 && v6 != 21)
          break;
LABEL_10:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 100, a1 + 4, 4);
LABEL_13:
        v4 = 0;
        v5 = 10;
        break;
    }
  }
  if (v5 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v8 = 136315650;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMRequirementGetProperties";
    v12 = 2048;
    v13 = (int)v4;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v8, 0x20u);
  }
  return v4;
}

void ACMGetAclAuthMethod(__n128 *a1, uint64_t a2)
{
  __n128 *v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMGetAclAuthMethod";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v4 = a1;
  LibCall_ACMGetAclAuthMethod_Block((uint64_t)ioKitTransport, (uint64_t)&v4, a1, a2);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMGetAclAuthMethod";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

uint64_t ACMSetEnvironmentVariable(int a1, const void *a2, size_t a3)
{
  uint64_t v6;
  unsigned int v7;
  uint64_t v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "ACMLib";
    v12 = 2080;
    v13 = "ACMSetEnvironmentVariable";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v9 = 0;
  v6 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD))ioKitTransport, (uint64_t)&v9, a1, 0, 0, 0, a2, a3);
  if ((_DWORD)v6)
    v7 = 70;
  else
    v7 = 10;
  if (v7 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v11 = "ACMLib";
    v12 = 2080;
    v13 = "ACMSetEnvironmentVariable";
    v14 = 2048;
    v15 = (int)v6;
    v16 = 1024;
    v17 = a1;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, var=%u.\n", buf, 0x26u);
  }
  return v6;
}

uint64_t ACMSetEnvironmentVariableWithAccessPolicy(int a1, _OWORD *a2, _OWORD *a3, uint64_t a4, const void *a5, size_t a6)
{
  uint64_t v12;
  unsigned int v13;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "ACMLib";
    v18 = 2080;
    v19 = "ACMSetEnvironmentVariableWithAccessPolicy";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v15 = 0;
  v12 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD))ioKitTransport, (uint64_t)&v15, a1, a2, a3, a4, a5, a6);
  if ((_DWORD)v12)
    v13 = 70;
  else
    v13 = 10;
  if (v13 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v17 = "ACMLib";
    v18 = 2080;
    v19 = "ACMSetEnvironmentVariableWithAccessPolicy";
    v20 = 2048;
    v21 = (int)v12;
    v22 = 1024;
    v23 = a1;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, var=%u.\n", buf, 0x26u);
  }
  return v12;
}

uint64_t ACMGetEnvironmentVariable(int a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMGetEnvironmentVariable";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v7 = 0;
  v4 = LibCall_ACMGetEnvironmentVariable_Block((uint64_t (*)(uint64_t, uint64_t, _QWORD, int *, uint64_t, uint64_t, uint64_t))ioKitTransport, (uint64_t)&v7, a1, a2);
  if ((_DWORD)v4)
    v5 = 70;
  else
    v5 = 10;
  if (v5 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMGetEnvironmentVariable";
    v12 = 2048;
    v13 = (int)v4;
    v14 = 1024;
    v15 = a1;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, var=%u.\n", buf, 0x26u);
  }
  return v4;
}

uint64_t ACMKernelControl(int a1)
{
  uint64_t v2;
  unsigned int v3;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMKernelControl";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v2 = LibCall_ACMKernelControl_Block((uint64_t)ioKitTransport);
  if ((_DWORD)v2)
    v3 = 70;
  else
    v3 = 10;
  if (v3 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMKernelControl";
    v9 = 2048;
    v10 = (int)v2;
    v11 = 1024;
    v12 = a1;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, code=%u.\n", buf, 0x26u);
  }
  return v2;
}

uint64_t ACMSEPControl(const void *a1, size_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = 0;
  return LibCall_ACMSEPControl_Block((uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, uint64_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v4, a1, a2, 0, 0, 0, a3);
}

uint64_t ACMSEPControlEx(uint64_t a1, _DWORD *a2, unsigned int a3, const void *a4, size_t a5, uint64_t a6)
{
  uint64_t v7;

  v7 = 0;
  return LibCall_ACMSEPControl_Block((uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, uint64_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v7, a4, a5, a1, a2, a3, a6);
}

void ACMGlobalContextCredentialGetProperty(int a1, int a2, uint64_t a3)
{
  uint64_t v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMGlobalContextCredentialGetProperty";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v6 = 0;
  LibCall_ACMGlobalContextCredentialGetProperty_Block((uint64_t)ioKitTransport, (uint64_t)&v6, a1, a2, a3);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMGlobalContextCredentialGetProperty";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

void ACMContextCredentialGetProperty(__n128 *a1, unsigned __int32 a2, unsigned __int32 a3, uint64_t a4)
{
  uint64_t v8;
  __n128 *v9;
  uint64_t v10;
  uint8_t v11[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextCredentialGetProperty";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v10 = 256;
  if (a4)
  {
    v9 = a1;
    v8 = LibCall_ACMContextCredentialGetProperty((uint64_t (*)(uint64_t, uint64_t, _QWORD, __n128 *, uint64_t, uint64_t, uint64_t, __n128))ioKitTransport, (uint64_t)&v9, a1, a2, a3, (uint64_t)buf, (uint64_t)&v10);
    (*(void (**)(uint64_t, uint64_t, uint8_t *, uint64_t))(a4 + 16))(a4, v8, buf, v10);
  }
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v11 = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextCredentialGetProperty";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", v11, 0x16u);
  }
}

uint64_t ACMContextSetData(_OWORD *a1, int a2, const void *a3, size_t a4)
{
  uint64_t v8;
  unsigned int v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextSetData";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  v8 = ACMContextSetDataEx(a1, a2, 0, 0, a3, a4);
  if ((_DWORD)v8)
    v9 = 70;
  else
    v9 = 10;
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v11 = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextSetData";
    v15 = 2048;
    v16 = (int)v8;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return v8;
}

uint64_t ACMContextSetDataEx(_OWORD *a1, int a2, _DWORD *a3, unsigned int a4, const void *a5, size_t a6)
{
  uint64_t v12;
  unsigned int v13;
  _OWORD *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "ACMLib";
    v18 = 2080;
    v19 = "ACMContextSetDataEx";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v15 = a1;
  v12 = LibCall_ACMContextSetData((uint64_t (*)(uint64_t, uint64_t, _QWORD, void *, size_t, _QWORD, _QWORD))ioKitTransport, (uint64_t)&v15, a1, a2, a3, a4, a5, a6);
  if ((_DWORD)v12)
    v13 = 70;
  else
    v13 = 10;
  if (v13 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v17 = "ACMLib";
    v18 = 2080;
    v19 = "ACMContextSetDataEx";
    v20 = 2048;
    v21 = (int)v12;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v12;
}

uint64_t ACMContextGetData(_OWORD *a1, int a2, uint64_t a3)
{
  uint64_t Data;
  unsigned int v7;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "ACMLib";
    v11 = 2080;
    v12 = "ACMContextGetData";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v9, 0x16u);
  }
  Data = ACMContextGetDataEx(a1, a2, 0, 0, a3);
  if ((_DWORD)Data)
    v7 = 70;
  else
    v7 = 10;
  if (v7 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v9 = 136315650;
    v10 = "ACMLib";
    v11 = 2080;
    v12 = "ACMContextGetData";
    v13 = 2048;
    v14 = (int)Data;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v9, 0x20u);
  }
  return Data;
}

uint64_t ACMContextGetDataEx(_OWORD *a1, int a2, _DWORD *a3, unsigned int a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  rsize_t v15;
  unsigned int v16;
  _OWORD *v18;
  _OWORD *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int size;
  int size_4;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    size_4 = 136315394;
    v24 = "ACMLib";
    v25 = 2080;
    v26 = "ACMContextGetDataEx";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&size_4, 0x16u);
  }
  size = 0;
  v20 = 0;
  v21 = 4;
  v19 = a1;
  v10 = LibCall_ACMContextGetData((uint64_t (*)(uint64_t, uint64_t, _QWORD, void *, size_t, uint64_t, uint64_t))ioKitTransport, (uint64_t)&v19, a1, a2, 1, a3, a4, (uint64_t)&size, (uint64_t)&v21);
  if (!(_DWORD)v10)
  {
    v11 = size;
    if (size)
    {
      v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 1199, "ACMContextGetDataEx");
      if (!v12)
      {
        v16 = 70;
        v14 = 4294967292;
        goto LABEL_15;
      }
      v20 = size;
      v18 = a1;
      v13 = LibCall_ACMContextGetData((uint64_t (*)(uint64_t, uint64_t, _QWORD, void *, size_t, uint64_t, uint64_t))ioKitTransport, (uint64_t)&v18, a1, a2, 0, a3, a4, (uint64_t)v12, (uint64_t)&v20);
      v14 = v13;
      if (a5 && !(_DWORD)v13)
        (*(void (**)(uint64_t, void *, uint64_t))(a5 + 16))(a5, v12, v20);
      v15 = size;
      acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 1213, "ACMContextGetDataEx");
      acm_mem_free_data(v12, v15);
      if ((_DWORD)v14)
        goto LABEL_11;
    }
    else if (a5)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(a5 + 16))(a5, 0, 0);
    }
    v14 = 0;
    v16 = 10;
    goto LABEL_15;
  }
  v14 = v10;
LABEL_11:
  v16 = 70;
LABEL_15:
  if (v16 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    size_4 = 136315650;
    v24 = "ACMLib";
    v25 = 2080;
    v26 = "ACMContextGetDataEx";
    v27 = 2048;
    v28 = (int)v14;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&size_4, 0x20u);
  }
  return v14;
}

uint64_t ACMContextGetDataProperty(_OWORD *a1, unsigned __int16 a2, unsigned __int16 a3, uint64_t a4)
{
  uint64_t Data;
  unsigned int v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextGetDataProperty";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  Data = ACMContextGetData(a1, a2 | (a3 << 16), a4);
  if ((_DWORD)Data)
    v9 = 70;
  else
    v9 = 10;
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v11 = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextGetDataProperty";
    v15 = 2048;
    v16 = (int)Data;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return Data;
}

uint64_t ACMContextGetInfo(__int128 *a1, int a2, _QWORD *a3)
{
  uint64_t v6;
  unsigned int v7;
  __int128 *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "ACMLib";
    v12 = 2080;
    v13 = "ACMContextGetInfo";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v9 = a1;
  v6 = LibCall_ACMContextGetInfo((uint64_t (*)(uint64_t, uint64_t, _QWORD, int *, uint64_t, _OWORD *, unint64_t *))ioKitTransport, (uint64_t)&v9, a1, a2, a3);
  if ((_DWORD)v6)
    v7 = 70;
  else
    v7 = 10;
  if (v7 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "ACMLib";
    v12 = 2080;
    v13 = "ACMContextGetInfo";
    v14 = 2048;
    v15 = (int)v6;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v6;
}

uint64_t ACMPing()
{
  uint64_t v1;

  v1 = 0;
  return LibCall_ACMPing((uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))ioKitTransport, (uint64_t)&v1, 29);
}

void updateLogLevelFromKext()
{
  unsigned __int8 v0;
  unsigned int v1;
  uint32_t outputCnt;
  uint64_t output;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "updateLogLevelFromKext";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  output = 0;
  outputCnt = 1;
  if (IOConnectCallScalarMethod(_connect, 2u, 0, 0, &output, &outputCnt))
    goto LABEL_8;
  v0 = output;
  v1 = output;
  _logLevel = output;
  if (output <= 0x1EuLL && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "updateLogLevelFromKext";
    v8 = 1024;
    v9 = v0;
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: log level set to %d.\n", buf, 0x1Cu);
LABEL_8:
    v1 = _logLevel;
  }
  if (v1 <= 0xA && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "updateLogLevelFromKext";
    _os_log_impl(&dword_24440D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

_BYTE *LibCall_BuildCommand(char a1, char a2, char a3, const void *a4, size_t a5, _QWORD *a6)
{
  _BYTE *v12;
  BOOL v13;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_BuildCommand");
  v12 = 0;
  if (a5)
    v13 = a4 == 0;
  else
    v13 = 0;
  if (!v13 && a6)
  {
    if (a5 >= 0xFFFFFFFFFFFFFFF8)
    {
      v12 = 0;
    }
    else
    {
      v12 = acm_mem_alloc_data(a5 + 8);
      acm_mem_alloc_info("<data>", v12, a5 + 8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 22, "LibCall_BuildCommand");
      if (v12)
      {
        *a6 = a5 + 8;
        *(_DWORD *)v12 = 1396920900;
        v12[4] = a1;
        v12[5] = a2;
        v12[6] = a3;
        if (a5)
          memcpy(v12 + 8, a4, a5);
      }
    }
  }
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: returning.\n", "ACM", "LibCall_BuildCommand");
  return v12;
}

uint64_t LibCall_ACMContextCreate(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _BYTE *, uint64_t *), uint64_t a2, _QWORD *a3, _BYTE *a4, int a5)
{
  unsigned int v10;
  uint64_t v11;
  _DWORD *v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  uint64_t v18;
  _BYTE v19[21];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCreate");
  v10 = 70;
  v11 = 4294967293;
  if (!a1 || !a3)
    goto LABEL_25;
  v12 = acm_mem_alloc(0x14uLL);
  acm_mem_alloc_info("ACMHandleWithPayload", v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 50, "LibCall_ACMContextCreate");
  if (!v12)
  {
    v10 = 70;
    v11 = 4294967292;
    goto LABEL_25;
  }
  memset(v19, 0, sizeof(v19));
  if (a5)
  {
    v18 = 21;
    v13 = a1(a2, 36, 0, 0, 0, v19, &v18);
    if (!(_DWORD)v13)
    {
      if (v18 != 21)
      {
        v11 = 4294967291;
        goto LABEL_23;
      }
      v11 = 0;
      goto LABEL_20;
    }
    v11 = v13;
    if ((_DWORD)v13 != -3)
    {
LABEL_23:
      acm_mem_free_info("ACMHandleWithPayload", v12, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 89, "LibCall_ACMContextCreate");
      acm_mem_free(v12, 0x14uLL);
      v10 = 70;
      goto LABEL_25;
    }
  }
  v18 = 17;
  v14 = a1(a2, 1, 0, 0, 0, v19, &v18);
  if (v18 == 17)
    v15 = 0;
  else
    v15 = -5;
  if (v14)
    v11 = v14;
  else
    v11 = v15;
  if (!v14 && v18 == 17)
  {
LABEL_20:
    v16 = *(_DWORD *)&v19[17];
    *(_OWORD *)v12 = *(_OWORD *)v19;
    v12[4] = v16;
    *a3 = v12;
    if (a4)
      *a4 = v19[16];
  }
  if ((_DWORD)v11)
    goto LABEL_23;
  v10 = 10;
LABEL_25:
  if (v10 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCreate", (int)v11);
  return v11;
}

_DWORD *LibCall_ACMContextCreateWithExternalForm(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, uint64_t, _QWORD *, uint64_t *), uint64_t a2, _OWORD *a3, uint64_t a4, _BYTE *a5, int a6)
{
  _DWORD *v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v20;
  _QWORD v21[2];

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCreateWithExternalForm");
  v12 = 0;
  v13 = 70;
  v14 = -3;
  if (a1 && a3 && a4 == 16)
  {
    memset(v21, 0, 9);
    if (a6)
    {
      v20 = 9;
      v15 = a1(a2, 37, 0, a3, 16, v21, &v20);
      if (!v15)
      {
        if (v20 == 9)
        {
          v14 = 0;
          goto LABEL_19;
        }
        v14 = -5;
        goto LABEL_28;
      }
      v14 = v15;
      if (v15 != -3)
        goto LABEL_28;
    }
    v20 = 5;
    v16 = a1(a2, 18, 0, a3, 16, v21, &v20);
    if (v20 == 5)
      v17 = 0;
    else
      v17 = -5;
    if (v16)
      v14 = v16;
    else
      v14 = v17;
    if (!v16 && v20 == 5)
    {
LABEL_19:
      if (LODWORD(v21[0]))
      {
        v12 = acm_mem_alloc(0x14uLL);
        acm_mem_alloc_info("ACMHandleWithPayload", v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 128, "LibCall_ACMContextCreateWithExternalForm");
        if (!v12)
        {
          v13 = 70;
          v14 = -4;
          goto LABEL_31;
        }
        v18 = *(_DWORD *)((char *)v21 + 5);
        *(_OWORD *)v12 = *a3;
        v12[4] = v18;
        if (a5)
          *a5 = BYTE4(v21[0]);
        if (v14)
        {
          acm_mem_free_info("ACMHandleWithPayload", v12, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 147, "LibCall_ACMContextCreateWithExternalForm");
          acm_mem_free(v12, 0x14uLL);
LABEL_29:
          v13 = 70;
          goto LABEL_31;
        }
      }
      else
      {
        v12 = 0;
      }
      goto LABEL_30;
    }
LABEL_28:
    v12 = 0;
    if (v14)
      goto LABEL_29;
LABEL_30:
    v14 = 0;
    v13 = 10;
  }
LABEL_31:
  if (v13 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCreateWithExternalForm", v14);
  return v12;
}

uint64_t LibCall_ACMContextDelete(void (*a1)(uint64_t, uint64_t, _QWORD, void *, uint64_t, _QWORD, _QWORD), uint64_t a2, void *a3, int a4)
{
  uint64_t v8;
  unsigned int v9;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextDelete");
  if (a1 && a3)
  {
    if (a4)
      a1(a2, 2, 0, a3, 16, 0, 0);
    goto LABEL_7;
  }
  if (a3)
  {
LABEL_7:
    acm_mem_free_info("ACMHandleWithPayload", a3, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 172, "LibCall_ACMContextDelete");
    acm_mem_free(a3, 0x14uLL);
    v8 = 0;
    v9 = 10;
    goto LABEL_8;
  }
  v9 = 70;
  v8 = 4294967293;
LABEL_8:
  if (v9 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextDelete", (int)v8);
  return v8;
}

uint64_t LibCall_ACMContexAddCredentialWithScope(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, void *, size_t, _QWORD, _QWORD), uint64_t a2, _OWORD *a3, unsigned int *a4, int a5)
{
  BOOL v10;
  char v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t SerializedAddCredentialSize;
  size_t v15;
  void *v16;
  uint64_t v17;
  rsize_t v18;
  size_t size;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContexAddCredentialWithScope");
  size = 0;
  if (a3)
    v10 = 1;
  else
    v10 = a5 == 2;
  v11 = !v10;
  v12 = 70;
  v13 = 4294967293;
  if (a4 && (v11 & 1) == 0)
  {
    SerializedAddCredentialSize = GetSerializedAddCredentialSize((uint64_t)a3, a4, a5, &size);
    if ((_DWORD)SerializedAddCredentialSize)
    {
      v13 = SerializedAddCredentialSize;
      v12 = 70;
    }
    else
    {
      v15 = size;
      v16 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v16, v15, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 192, "LibCall_ACMContexAddCredentialWithScope");
      if (v16)
      {
        v17 = SerializeAddCredential(a3, a4, a5, (uint64_t)v16, &size);
        if (!(_DWORD)v17)
          v17 = a1(a2, 5, 0, v16, size, 0, 0);
        v13 = v17;
        v18 = size;
        acm_mem_free_info("<data>", v16, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 203, "LibCall_ACMContexAddCredentialWithScope");
        acm_mem_free_data(v16, v18);
        if ((_DWORD)v13)
          v12 = 70;
        else
          v12 = 10;
      }
      else
      {
        v12 = 70;
        v13 = 4294967292;
      }
    }
  }
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContexAddCredentialWithScope", (int)v13);
  return v13;
}

uint64_t LibCall_ACMContexRemoveCredentialsByTypeAndScope(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, uint64_t, _QWORD, _QWORD), uint64_t a2, _OWORD *a3, int a4, int a5)
{
  _OWORD *v10;
  uint64_t v11;
  unsigned int v12;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
  if (a3 || a5 == 2)
  {
    v10 = acm_mem_alloc_data(0x18uLL);
    acm_mem_alloc_info("<data>", v10, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 217, "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
    if (v10)
    {
      if (a3)
      {
        *v10 = *a3;
      }
      else
      {
        *(_QWORD *)v10 = 0;
        *((_QWORD *)v10 + 1) = 0;
      }
      *((_DWORD *)v10 + 4) = a4;
      *((_DWORD *)v10 + 5) = a5;
      v11 = a1(a2, 9, 0, v10, 24, 0, 0);
      acm_mem_free_info("<data>", v10, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 233, "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
      acm_mem_free_data(v10, 0x18uLL);
      if ((_DWORD)v11)
        v12 = 70;
      else
        v12 = 10;
    }
    else
    {
      v12 = 70;
      v11 = 4294967292;
    }
  }
  else
  {
    v12 = 70;
    v11 = 4294967293;
  }
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContexRemoveCredentialsByTypeAndScope", (int)v11);
  return v11;
}

uint64_t LibCall_ACMContextRemoveCredentialsByValueAndScope(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, void *, size_t, _QWORD, _QWORD), uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  BOOL v10;
  char v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t SerializedAddCredentialSize;
  size_t v15;
  void *v16;
  uint64_t v17;
  rsize_t v18;
  size_t size;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextRemoveCredentialsByValueAndScope");
  size = 0;
  if (a3)
    v10 = 1;
  else
    v10 = (_DWORD)a5 == 2;
  v11 = !v10;
  v12 = 70;
  v13 = 4294967293;
  if (a4 && (v11 & 1) == 0)
  {
    SerializedAddCredentialSize = GetSerializedAddCredentialSize(a3, a4, a5, &size);
    if ((_DWORD)SerializedAddCredentialSize)
    {
      v13 = SerializedAddCredentialSize;
      v12 = 70;
    }
    else
    {
      v15 = size;
      v16 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v16, v15, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 251, "LibCall_ACMContextRemoveCredentialsByValueAndScope");
      if (v16)
      {
        v17 = SerializeRemoveCredential(a3, a4, a5, v16, &size);
        if (!(_DWORD)v17)
          v17 = a1(a2, 6, 0, v16, size, 0, 0);
        v13 = v17;
        v18 = size;
        acm_mem_free_info("<data>", v16, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 264, "LibCall_ACMContextRemoveCredentialsByValueAndScope");
        acm_mem_free_data(v16, v18);
        if ((_DWORD)v13)
          v12 = 70;
        else
          v12 = 10;
      }
      else
      {
        v12 = 70;
        v13 = 4294967292;
      }
    }
  }
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextRemoveCredentialsByValueAndScope", (int)v13);
  return v13;
}

uint64_t LibCall_ACMContextVerifyPolicyAndCopyRequirementEx(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, BOOL *a9, _QWORD *a10)
{
  unsigned int v18;
  uint64_t v19;
  uint64_t SerializedVerifyPolicySize;
  size_t v21;
  _OWORD *v22;
  uint64_t v23;
  unsigned int *v24;
  uint64_t v25;
  unint64_t v26;
  rsize_t v27;
  size_t v29;
  void *v30;
  unint64_t v31;
  size_t v32;
  size_t size;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
  v32 = 0;
  size = 0;
  v30 = 0;
  v31 = 4096;
  v18 = 70;
  v19 = 4294967293;
  v29 = 0;
  if (a1 && a3 && __s1 && a9)
  {
    if ((a6 != 0) != (a7 != 0))
    {
      v18 = 70;
      v19 = 4294967293;
    }
    else
    {
      SerializedVerifyPolicySize = GetSerializedVerifyPolicySize((uint64_t)a3, __s1, a5, a8, a6, a7, &size);
      if ((_DWORD)SerializedVerifyPolicySize)
      {
        v19 = SerializedVerifyPolicySize;
        v18 = 70;
      }
      else
      {
        v21 = size;
        v22 = acm_mem_alloc_data(size);
        acm_mem_alloc_info("<data>", v22, v21, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 293, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
        if (v22)
        {
          v32 = size;
          v23 = SerializeVerifyPolicy(a3, __s1, a5, a8, a6, a7, v22, &v32);
          if ((_DWORD)v23)
          {
            v19 = v23;
            v24 = 0;
          }
          else
          {
            v24 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
            acm_mem_alloc_info("<data>", v24, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 300, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
            if (v24)
            {
              v25 = a1(a2, 3, 0, v22, v32, v24, &v31);
              if ((_DWORD)v25)
              {
                v19 = v25;
              }
              else
              {
                v26 = v31 - 4;
                if (v31 < 4)
                {
                  v19 = 4294967291;
                }
                else
                {
                  *a9 = *v24 != 0;
                  if (a10)
                  {
                    v19 = DeserializeRequirement(v24 + 1, v26, &v30, &v29);
                    if (!(_DWORD)v19)
                      *a10 = v30;
                  }
                  else
                  {
                    v19 = 0;
                  }
                }
              }
            }
            else
            {
              v19 = 4294967292;
            }
          }
          v27 = size;
          acm_mem_free_info("<data>", v22, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 324, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
          acm_mem_free_data(v22, v27);
          if (v24)
          {
            acm_mem_free_info("<data>", v24, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 327, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
            acm_mem_free_data(v24, 0x1000uLL);
          }
          if ((_DWORD)v19)
            v18 = 70;
          else
            v18 = 10;
        }
        else
        {
          v18 = 70;
          v19 = 4294967292;
        }
      }
    }
  }
  if (v18 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx", (int)v19);
  return v19;
}

uint64_t LibCall_ACMRequirementDelete(uint64_t a1, int *a2)
{
  unsigned int v4;
  uint64_t v5;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMRequirementDelete");
  v4 = 70;
  v5 = 4294967293;
  if (a1 && a2)
  {
    v5 = Util_DeallocRequirement(a2);
    if ((_DWORD)v5)
      v4 = 70;
    else
      v4 = 10;
  }
  if (v4 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMRequirementDelete", (int)v5);
  return v5;
}

uint64_t LibCall_ACMKernelControl(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, size_t, uint64_t, uint64_t), uint64_t a2, int a3, const void *a4, size_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t (*v13)(uint64_t, uint64_t, _QWORD, char *, size_t, uint64_t, uint64_t);
  BOOL v14;
  _DWORD *v15;
  _DWORD *v16;
  uint64_t v17;
  unsigned int v18;
  _QWORD v20[2];

  v13 = a1;
  v20[1] = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    a1 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, uint64_t, uint64_t))printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernelControl");
  if (!v13)
    goto LABEL_16;
  v14 = a5 != 0;
  if (a4)
    v14 = a5 - 4097 < 0xFFFFFFFFFFFFF000;
  if (v14)
  {
LABEL_16:
    v18 = 70;
    v17 = 4294967293;
  }
  else
  {
    v20[0] = v20;
    MEMORY[0x24BDAC7A8](a1);
    v15 = (_DWORD *)((char *)v20 - ((a5 + 19) & 0xFFFFFFFFFFFFFFF0));
    *v15 = a3;
    v16 = v15 + 1;
    if (a5)
    {
      memcpy(v15 + 1, a4, a5);
      v16 = (_DWORD *)((char *)v16 + a5);
    }
    if (v16 != (_DWORD *)((char *)v15 + a5 + 4))
      LibCall_ACMKernelControl_cold_1();
    v17 = v13(a2, 26, 0, (char *)v20 - ((a5 + 19) & 0xFFFFFFFFFFFFFFF0), a5 + 4, a6, a7);
    if ((_DWORD)v17)
      v18 = 70;
    else
      v18 = 10;
  }
  if (v18 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernelControl", (int)v17);
  return v17;
}

_DWORD *LibCall_ACMCredentialDelete(_DWORD *a1)
{
  if (a1)
    return (_DWORD *)Util_DeallocCredential(a1);
  return a1;
}

unsigned int *LibCall_ACMCredentialGetType(unsigned int *result)
{
  if (result)
    return (unsigned int *)*result;
  return result;
}

uint64_t LibCall_ACMCredentialSetProperty(int *a1, int a2, _OWORD *__src, size_t __n)
{
  int v4;
  uint64_t result;
  int v7;
  _OWORD *v8;
  BOOL v9;
  _BOOL4 v10;
  __int128 v11;
  _BOOL4 v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  if (!a1)
    return 4294967293;
  v4 = __n;
  if ((__src != 0) != (__n != 0))
    return 4294967293;
  result = 4294967293;
  if (a2 > 399)
  {
    if (a2 > 601)
    {
      if (a2 <= 801)
      {
        if (a2 != 602)
        {
          if (a2 == 701)
          {
            if (__n <= 0x80 && *a1 == 13)
            {
              a1[8] = __n;
              v14 = a1 + 9;
LABEL_118:
              memcpy(v14, __src, __n);
              return 0;
            }
          }
          else if (a2 == 801 && __n == 16 && *a1 == 17)
          {
            result = 0;
            *((_OWORD *)a1 + 2) = *__src;
          }
          return result;
        }
        v13 = *a1 == 12 || *a1 == 15;
        if (__n != 4 || !v13)
          return result;
LABEL_79:
        result = 0;
        a1[9] = *(_DWORD *)__src;
        return result;
      }
      if (a2 == 802)
      {
        if (__n != 65 || *a1 != 17)
          return result;
        result = 0;
        *((_OWORD *)a1 + 3) = *__src;
        v11 = __src[1];
        v16 = __src[2];
        v17 = __src[3];
        *((_BYTE *)a1 + 112) = *((_BYTE *)__src + 64);
        *((_OWORD *)a1 + 5) = v16;
        *((_OWORD *)a1 + 6) = v17;
        goto LABEL_92;
      }
      if (a2 != 901)
      {
        if (a2 == 1001 && __n <= 0x80 && *a1 == 21)
        {
          memcpy(a1 + 9, __src, __n);
          result = 0;
          a1[8] = v4;
        }
        return result;
      }
      if (__n != 32 || *a1 != 20)
        return result;
    }
    else
    {
      if (a2 > 501)
      {
        switch(a2)
        {
          case 502:
            if (__n == 16 && *a1 == 10)
            {
LABEL_102:
              result = 0;
              *(_OWORD *)(a1 + 13) = *__src;
            }
            break;
          case 503:
            if (__n == 16 && *a1 == 10)
            {
              result = 0;
              v15 = *__src;
LABEL_99:
              *(_OWORD *)(a1 + 17) = v15;
            }
            break;
          case 601:
            v9 = *a1 == 12 || *a1 == 15;
            v10 = v9;
            if (__n == 4 && v10)
            {
LABEL_64:
              result = 0;
              a1[8] = *(_DWORD *)__src;
            }
            break;
        }
        return result;
      }
      if (a2 != 400)
      {
        if (a2 != 401)
        {
          if (a2 == 501 && __n == 16 && *a1 == 10)
          {
LABEL_16:
            result = 0;
            *(_OWORD *)(a1 + 9) = *__src;
          }
          return result;
        }
        if (__n != 24 || *a1 != 7)
          return result;
        result = 0;
        v11 = *__src;
        *((_QWORD *)a1 + 10) = *((_QWORD *)__src + 2);
LABEL_92:
        *((_OWORD *)a1 + 4) = v11;
        return result;
      }
      if (__n != 32 || *a1 != 7)
        return result;
    }
    result = 0;
    v18 = __src[1];
    *((_OWORD *)a1 + 2) = *__src;
    *((_OWORD *)a1 + 3) = v18;
    return result;
  }
  if (a2 > 199)
  {
    switch(a2)
    {
      case 300:
        if (__n == 16 && *a1 == 3)
          goto LABEL_16;
        break;
      case 301:
        if (__n == 32 && *a1 == 3)
        {
          result = 0;
          v15 = *__src;
          *(_OWORD *)(a1 + 21) = __src[1];
          goto LABEL_99;
        }
        break;
      case 302:
        if (__n == 16 && *a1 == 3)
          goto LABEL_102;
        break;
      case 303:
        if (__n == 65 && *a1 == 3)
        {
          result = 0;
          *(_OWORD *)(a1 + 30) = *__src;
          v19 = __src[1];
          v20 = __src[2];
          v21 = __src[3];
          *((_BYTE *)a1 + 184) = *((_BYTE *)__src + 64);
          *(_OWORD *)(a1 + 42) = v21;
          *(_OWORD *)(a1 + 38) = v20;
          *(_OWORD *)(a1 + 34) = v19;
        }
        break;
      case 304:
        if (__n == 16 && *a1 == 3)
        {
          result = 0;
          *(_OWORD *)((char *)a1 + 185) = *__src;
        }
        break;
      case 305:
        if (__n == 4 && *a1 == 3)
        {
          result = 0;
          *(int *)((char *)a1 + 201) = *(_DWORD *)__src;
        }
        break;
      case 306:
        if (__n <= 0x80 && *a1 == 3)
        {
          memcpy((char *)a1 + 209, __src, __n);
          result = 0;
          *(int *)((char *)a1 + 205) = v4;
        }
        break;
      default:
        if (a2 == 200)
        {
          if (__n <= 0x80 && *a1 == 2)
          {
            a1[9] = __n;
            v14 = a1 + 10;
            goto LABEL_118;
          }
        }
        else if (a2 == 201 && __n == 4 && *a1 == 2)
        {
          goto LABEL_64;
        }
        break;
    }
    return result;
  }
  if (a2 > 100)
  {
    if (a2 == 101)
    {
      if (__n == 4)
      {
        switch(*a1)
        {
          case 1:
          case 3:
          case 9:
          case 10:
            goto LABEL_64;
          case 2:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
            return result;
          default:
            if (*a1 == 18)
              goto LABEL_64;
            break;
        }
      }
      return result;
    }
    if (a2 != 102 || __n != 4 || *a1 != 1)
      return result;
    goto LABEL_79;
  }
  if (a2 == 5)
  {
    if (__n == 4)
    {
      result = 0;
      a1[3] = *(_DWORD *)__src;
    }
  }
  else if (a2 == 100 && __n == 16)
  {
    v7 = *a1;
    if (*a1 > 8)
    {
      if (v7 == 9)
      {
        v8 = a1 + 10;
        a1[9] = 16;
      }
      else
      {
        if (v7 != 18)
          return result;
        v8 = a1 + 9;
      }
    }
    else if (v7 == 1)
    {
      v8 = a1 + 11;
      a1[10] = 16;
    }
    else
    {
      if (v7 != 3)
        return result;
      v8 = a1 + 26;
      a1[25] = 16;
    }
    result = 0;
    *v8 = *__src;
  }
  return result;
}

uint64_t LibCall_ACMCredentialGetPropertyData(int *a1, int a2, int **a3, uint64_t *a4)
{
  uint64_t result;
  int *v8;
  int *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  int *v15;
  int *v16;
  int *v17;
  int v18;
  _BOOL4 isNullOrZeroMemory;
  BOOL v20;
  int *v21;
  uint64_t v22;
  int *v23;

  result = 4294967293;
  if (!a1 || !a3 || !a4)
    return result;
  if (a2 > 399)
  {
    if (a2 > 601)
    {
      if (a2 > 801)
      {
        if (a2 == 802)
        {
          if (*a1 != 17)
            return result;
          v11 = a1 + 12;
LABEL_87:
          v12 = 65;
          v13 = v11;
          v14 = 65;
        }
        else
        {
          if (a2 != 901)
          {
            if (a2 != 1001 || *a1 != 21)
              return result;
            v15 = a1 + 9;
            if (Util_isNullOrZeroMemory((_BYTE *)a1 + 36, 128))
            {
              v15 = 0;
              v10 = 0;
            }
            else
            {
              v10 = a1[8];
            }
            result = 0;
            *a3 = v15;
LABEL_99:
            *a4 = v10;
            return result;
          }
          if (*a1 != 20)
            return result;
          v11 = a1 + 8;
          v12 = 32;
          v13 = v11;
          v14 = 32;
        }
      }
      else
      {
        if (a2 == 602)
        {
          if (*a1 != 15 && *a1 != 12)
            return result;
          goto LABEL_61;
        }
        if (a2 == 701)
        {
          if (*a1 != 13)
            return result;
          result = 0;
          *a3 = a1 + 9;
          v10 = a1[8];
          goto LABEL_99;
        }
        if (a2 != 801 || *a1 != 17)
          return result;
        v11 = a1 + 8;
        v12 = 16;
        v13 = v11;
        v14 = 16;
      }
      isNullOrZeroMemory = Util_isNullOrZeroMemory(v13, v14);
      result = 0;
      v20 = !isNullOrZeroMemory;
      if (isNullOrZeroMemory)
        v21 = 0;
      else
        v21 = (int *)v11;
      if (v20)
        v22 = v12;
      else
        v22 = 0;
      *a3 = v21;
      *a4 = v22;
      return result;
    }
    if (a2 > 501)
    {
      if (a2 == 502)
      {
        if (*a1 != 10)
          return result;
        v9 = a1 + 13;
      }
      else
      {
        if (a2 != 503)
        {
          if (a2 != 601 || *a1 != 15 && *a1 != 12)
            return result;
          goto LABEL_77;
        }
        if (*a1 != 10)
          return result;
        v9 = a1 + 17;
      }
LABEL_68:
      *a3 = v9;
      result = Util_isNullOrZeroMemory(v9, 16);
      if ((_DWORD)result)
      {
        result = 0;
        *a4 = 0;
        *a3 = 0;
        return result;
      }
LABEL_70:
      v10 = 16;
      goto LABEL_99;
    }
    if (a2 == 400)
    {
      if (*a1 != 7)
        return result;
      result = 0;
      v16 = a1 + 8;
LABEL_84:
      *a3 = v16;
      v10 = 32;
      goto LABEL_99;
    }
    if (a2 == 401)
    {
      if (*a1 != 7)
        return result;
      result = 0;
      *a3 = a1 + 16;
      v10 = 24;
      goto LABEL_99;
    }
    if (a2 != 501 || *a1 != 10)
      return result;
LABEL_15:
    v9 = a1 + 9;
    goto LABEL_68;
  }
  if (a2 > 199)
  {
    switch(a2)
    {
      case 300:
        if (*a1 == 3)
        {
          result = 0;
          v8 = a1 + 9;
          goto LABEL_50;
        }
        break;
      case 301:
        if (*a1 == 3)
        {
          result = 0;
          v16 = a1 + 17;
          goto LABEL_84;
        }
        break;
      case 302:
        if (*a1 == 3)
        {
          result = 0;
          v8 = a1 + 13;
          goto LABEL_50;
        }
        break;
      case 303:
        if (*a1 == 3)
        {
          v11 = a1 + 30;
          goto LABEL_87;
        }
        break;
      case 304:
        if (*a1 == 3)
        {
          result = 0;
          v8 = (int *)((char *)a1 + 185);
LABEL_50:
          *a3 = v8;
          goto LABEL_70;
        }
        break;
      case 305:
        if (*a1 == 3)
        {
          result = 0;
          v17 = (int *)((char *)a1 + 201);
          goto LABEL_97;
        }
        break;
      case 306:
        if (*a1 == 3)
        {
          result = 0;
          v10 = *(unsigned int *)((char *)a1 + 205);
          v23 = (int *)((char *)a1 + 209);
          if (!*(int *)((char *)a1 + 205))
            v23 = 0;
          *a3 = v23;
          goto LABEL_99;
        }
        break;
      default:
        if (a2 == 200)
        {
          if (*a1 == 2)
          {
            result = 0;
            *a3 = a1 + 10;
            v10 = a1[9];
            goto LABEL_99;
          }
        }
        else if (a2 == 201 && *a1 == 2)
        {
          goto LABEL_77;
        }
        break;
    }
    return result;
  }
  if (a2 > 99)
  {
    if (a2 != 100)
    {
      if (a2 != 101)
      {
        if (a2 != 102 || *a1 != 1)
          return result;
LABEL_61:
        result = 0;
        v17 = a1 + 9;
        goto LABEL_97;
      }
      if (*a1 > 0x12 || ((1 << *a1) & 0x4060A) == 0)
        return result;
LABEL_77:
      result = 0;
      v17 = a1 + 8;
LABEL_97:
      *a3 = v17;
LABEL_98:
      v10 = 4;
      goto LABEL_99;
    }
    v18 = *a1;
    if (*a1 <= 8)
    {
      if (v18 == 1)
      {
        v9 = a1 + 11;
      }
      else
      {
        if (v18 != 3)
          return result;
        v9 = a1 + 26;
      }
      goto LABEL_68;
    }
    if (v18 == 9)
    {
      v9 = a1 + 10;
      goto LABEL_68;
    }
    if (v18 != 18)
      return result;
    goto LABEL_15;
  }
  switch(a2)
  {
    case 1:
      result = 0;
      *a3 = a1 + 4;
      v10 = 8;
      goto LABEL_99;
    case 2:
      result = 0;
      v17 = a1 + 6;
      goto LABEL_97;
    case 3:
      result = 0;
      *a3 = a1;
      goto LABEL_98;
    case 4:
      result = 0;
      v17 = a1 + 1;
      goto LABEL_97;
    case 5:
      result = 0;
      v17 = a1 + 3;
      goto LABEL_97;
    default:
      return result;
  }
  return result;
}

uint64_t LibCall_ACMRequirementGetState(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 4);
  return result;
}

uint64_t LibCall_ACMRequirementGetPriority(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 8);
  return result;
}

uint64_t LibCall_ACMRequirementGetPropertyData(int *a1, int a2, int **a3, unint64_t *a4)
{
  uint64_t v4;
  int *v7;
  int *v8;
  int *v9;
  unint64_t v10;
  _DWORD *v11;
  BOOL v12;
  int v13;

  v4 = 4294967293;
  if (!a1 || !a3 || !a4)
    return v4;
  v4 = 4294967293;
  if (a2 > 399)
  {
    if (a2 > 600)
    {
      if (a2 == 601)
      {
        if (*a1 == 26)
        {
          if (a1[3] >= 0x1C)
          {
            v7 = a1 + 7;
LABEL_45:
            *a3 = v7;
            v10 = 16;
            goto LABEL_72;
          }
          return 4294967282;
        }
        return 4294967293;
      }
      if (a2 != 602)
      {
        if (a2 != 700)
          return v4;
        if (*a1 == 7)
        {
LABEL_28:
          v8 = a1 + 4;
          goto LABEL_58;
        }
        return 4294967293;
      }
      if (*a1 != 26)
        return 4294967293;
      if (a1[3] < 0x1C)
        return 4294967282;
      *a3 = a1 + 4;
      v10 = 8;
    }
    else
    {
      if (a2 == 400)
      {
        if (*a1 == 13)
        {
          v9 = a1 + 4;
LABEL_64:
          *a3 = v9;
          v10 = 32;
          goto LABEL_72;
        }
        return 4294967293;
      }
      if (a2 != 500)
      {
        if (a2 != 600)
          return v4;
        if (*a1 == 26)
        {
          if (a1[3] >= 0x1C)
          {
            v8 = a1 + 6;
LABEL_58:
            *a3 = v8;
            goto LABEL_59;
          }
          return 4294967282;
        }
        return 4294967293;
      }
      if (*a1 != 25)
        return 4294967293;
      *a3 = a1 + 4;
      v10 = 43;
    }
LABEL_72:
    v4 = 0;
    *a4 = v10;
    return v4;
  }
  if (a2 > 99)
  {
    switch(a2)
    {
      case 300:
        if (*a1 != 3)
          return 4294967293;
        v7 = a1 + 5;
        goto LABEL_45;
      case 301:
        if (*a1 != 3)
          return 4294967293;
        v9 = a1 + 13;
        goto LABEL_64;
      case 302:
        if (*a1 != 3)
          return 4294967293;
        v7 = a1 + 9;
        goto LABEL_45;
      case 303:
        if (*a1 != 3)
          return 4294967293;
        v10 = 0;
        v11 = a1 + 21;
        break;
      case 304:
        if (*a1 != 3)
          return 4294967293;
        if (a1[3] < 0x9C)
          return 4294967282;
        v8 = a1 + 41;
        goto LABEL_58;
      case 305:
        if (*a1 != 3)
          return 4294967293;
        if (a1[3] < 0x9C)
          return 4294967282;
        v8 = a1 + 42;
        goto LABEL_58;
      case 306:
        if (*a1 != 24)
          return 4294967293;
        *a3 = a1 + 5;
        v10 = a1[4];
        goto LABEL_72;
      case 307:
        if (*a1 != 24)
          return 4294967293;
        v9 = a1 + 261;
        goto LABEL_64;
      default:
        if (a2 == 100)
        {
          v13 = *a1;
          if (*a1 > 19)
          {
            if (v13 == 20 || v13 == 21)
              goto LABEL_28;
          }
          else if (v13 == 1 || v13 == 3)
          {
            goto LABEL_28;
          }
          return v4;
        }
        if (a2 != 200)
          return v4;
        if (*a1 != 2)
          return 4294967293;
        goto LABEL_28;
    }
    while (!Util_isNullOrZeroMemory((_BYTE *)v11 + v10, 16))
    {
      v12 = v10 >= 0x40;
      v10 += 16;
      if (v12)
      {
        v10 = 80;
        goto LABEL_71;
      }
    }
    if (!v10)
      v11 = 0;
LABEL_71:
    *a3 = v11;
    goto LABEL_72;
  }
  switch(a2)
  {
    case 1:
      *a3 = a1;
LABEL_59:
      v10 = 4;
      goto LABEL_72;
    case 2:
      v8 = a1 + 1;
      goto LABEL_58;
    case 3:
      v8 = a1 + 2;
      goto LABEL_58;
  }
  return v4;
}

uint64_t LibCall_ACMPing(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), uint64_t a2, uint64_t a3)
{
  unsigned int v6;
  uint64_t v7;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMPing");
  v6 = 70;
  if (a1 && ((_DWORD)a3 == 47 || (_DWORD)a3 == 29))
  {
    v7 = a1(a2, a3, 0, 0, 0, 0, 0);
    if ((_DWORD)v7)
      v6 = 70;
    else
      v6 = 10;
  }
  else
  {
    v7 = 4294967293;
  }
  if (v6 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMPing", (int)v7);
  return v7;
}

uint64_t LibCall_ACMKernDoubleClickNotify(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), uint64_t a2)
{
  unsigned int v4;
  uint64_t v5;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernDoubleClickNotify");
  v4 = 70;
  if (a1)
  {
    v5 = a1(a2, 28, 0, 0, 0, 0, 0);
    if ((_DWORD)v5)
      v4 = 70;
    else
      v4 = 10;
  }
  else
  {
    v5 = 4294967293;
  }
  if (v4 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernDoubleClickNotify", (int)v5);
  return v5;
}

uint64_t LibCall_ACMContextCredentialGetProperty(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, __n128 *, uint64_t, uint64_t, uint64_t, __n128), uint64_t a2, __n128 *a3, unsigned __int32 a4, unsigned __int32 a5, uint64_t a6, uint64_t a7)
{
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  __n128 Property_Serialize;
  uint64_t v19;
  __n128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCredentialGetProperty");
  v14 = 70;
  v15 = 4294967293;
  if (a1)
  {
    if (a3)
    {
      v15 = 4294967293;
      if (a6)
      {
        if (a7)
        {
          v19 = 24;
          Property_Serialize = LibSer_ContextCredentialGetProperty_Serialize(a3, a4, a5, &v20, &v19);
          if ((_DWORD)v16)
          {
            v15 = v16;
          }
          else if (v19 == 24)
          {
            v15 = a1(a2, 33, 0, &v20, 24, a6, a7, Property_Serialize);
            if (!(_DWORD)v15)
            {
              v14 = 10;
              goto LABEL_11;
            }
          }
          else
          {
            v15 = 4294967291;
          }
          v14 = 70;
        }
      }
    }
  }
LABEL_11:
  if (v14 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCredentialGetProperty", (int)v15);
  return v15;
}

uint64_t LibCall_ACMGlobalContextCredentialGetProperty(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6)
{
  unsigned int v12;
  uint64_t v13;
  uint64_t Property_Serialize;
  uint64_t v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty");
  v12 = 70;
  v13 = 4294967293;
  if (a1 && a5 && a6)
  {
    v16 = 8;
    Property_Serialize = LibSer_GlobalContextCredentialGetProperty_Serialize(a3, a4, &v17, &v16);
    if ((_DWORD)Property_Serialize)
    {
      v13 = Property_Serialize;
    }
    else if (v16 == 8)
    {
      v13 = a1(a2, 27, 0, &v17, 8, a5, a6);
      if (!(_DWORD)v13)
      {
        v12 = 10;
        goto LABEL_10;
      }
    }
    else
    {
      v13 = 4294967291;
    }
    v12 = 70;
  }
LABEL_10:
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty", (int)v13);
  return v13;
}

uint64_t LibCall_ACMContextVerifyPolicyEx(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, BOOL *a9, int **a10)
{
  uint64_t v18;
  uint64_t SerializedVerifyPolicySize;
  size_t v20;
  _OWORD *v21;
  uint64_t v22;
  unsigned int *v23;
  uint64_t v24;
  unint64_t v25;
  rsize_t v26;
  unsigned int v27;
  size_t v29;
  int *v30;
  unint64_t v31;
  size_t size;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx");
  v31 = 4096;
  size = 0;
  v29 = 0;
  v30 = 0;
  v18 = 4294967293;
  if (!a3 || !__s1 || !a9)
  {
LABEL_18:
    if (!(_DWORD)v18)
      goto LABEL_21;
    goto LABEL_19;
  }
  SerializedVerifyPolicySize = GetSerializedVerifyPolicySize((uint64_t)a3, __s1, a5, a8, a6, a7, &size);
  if (!(_DWORD)SerializedVerifyPolicySize)
  {
    v20 = size;
    v21 = acm_mem_alloc_data(size);
    acm_mem_alloc_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1257, "LibCall_ACMContextVerifyPolicyEx");
    if (v21)
    {
      v22 = SerializeVerifyPolicy(a3, __s1, a5, a8, a6, a7, v21, &size);
      if ((_DWORD)v22)
      {
        v18 = v22;
        v23 = 0;
      }
      else
      {
        v23 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
        acm_mem_alloc_info("<data>", v23, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1263, "LibCall_ACMContextVerifyPolicyEx");
        if (v23)
        {
          v24 = a1(a2, 3, 0, v21, size, v23, &v31);
          if ((_DWORD)v24)
          {
            v18 = v24;
          }
          else
          {
            v25 = v31 - 4;
            if (v31 < 4)
            {
              v18 = 4294967291;
            }
            else
            {
              *a9 = *v23 != 0;
              if (a10)
              {
                v18 = DeserializeRequirement(v23 + 1, v25, (void **)&v30, &v29);
                if (!(_DWORD)v18)
                  *a10 = v30;
              }
              else
              {
                v18 = 0;
              }
            }
          }
        }
        else
        {
          v18 = 4294967292;
        }
      }
      v26 = size;
      acm_mem_free_info("<data>", v21, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1288, "LibCall_ACMContextVerifyPolicyEx");
      acm_mem_free_data(v21, v26);
      if (v23)
      {
        acm_mem_free_info("<data>", v23, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1291, "LibCall_ACMContextVerifyPolicyEx");
        acm_mem_free_data(v23, 0x1000uLL);
      }
    }
    else
    {
      v18 = 4294967292;
    }
    goto LABEL_18;
  }
  v18 = SerializedVerifyPolicySize;
LABEL_19:
  if (v30)
    Util_DeallocRequirement(v30);
LABEL_21:
  if ((_DWORD)v18)
    v27 = 70;
  else
    v27 = 10;
  if (v27 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx", (int)v18);
  return v18;
}

uint64_t LibCall_ACMGlobalContextVerifyPolicyEx(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, char *a3, uint64_t a4, _DWORD *a5, unsigned int a6, BOOL *a7, int **a8)
{
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  int v20[2];

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicyEx");
  *(_QWORD *)v20 = 0;
  v16 = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _BYTE *, uint64_t *))a1, a2, v20, 0, 1);
  if (!(_DWORD)v16)
    v16 = LibCall_ACMContextVerifyPolicyEx(a1, a2, *(_OWORD **)v20, a3, a4, a5, a6, 0xFFFFFFFFLL, a7, a8);
  v17 = v16;
  if (*(_QWORD *)v20)
    LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, _QWORD, void *, uint64_t, _QWORD, _QWORD))a1, a2, *(void **)v20, 1);
  if ((_DWORD)v17)
    v18 = 70;
  else
    v18 = 10;
  if (v18 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicyEx", (int)v17);
  return v17;
}

uint64_t LibCall_ACMGetEnvironmentVariable(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  unsigned int v9;
  uint64_t v10;
  int v12;

  v12 = a3;
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGetEnvironmentVariable");
  v9 = 70;
  v10 = 4294967293;
  if (a1 && a4 && a5)
  {
    v10 = a1(a2, 25, 0, &v12, 4, a4, a5);
    if ((_DWORD)v10)
      v9 = 70;
    else
      v9 = 10;
  }
  if (v9 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGetEnvironmentVariable", (int)v10);
  return v10;
}

uint64_t LibCall_ACMSetEnvironmentVariable(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD), uint64_t a2, int a3, _OWORD *a4, _OWORD *a5, uint64_t a6, const void *a7, size_t a8)
{
  uint64_t (*v15)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD);
  BOOL v16;
  char *v17;
  uint64_t v18;
  unsigned int v19;
  _QWORD v21[2];

  v15 = a1;
  v21[1] = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    a1 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD))printf("%s: %s: called.\n", "ACM", "LibCall_ACMSetEnvironmentVariable");
  if (v15 && a6 == 16 * (a5 != 0) && (a7 ? (v16 = a8 - 129 < 0xFFFFFFFFFFFFFF80) : (v16 = a8 != 0), !v16))
  {
    MEMORY[0x24BDAC7A8](a1);
    v17 = (char *)v21 - ((a8 + 59) & 0xFFFFFFFFFFFFFFF0);
    *(_DWORD *)v17 = a3;
    *((_DWORD *)v17 + 1) = 2;
    *((_DWORD *)v17 + 2) = a8;
    *(_OWORD *)(v17 + 12) = 0u;
    *(_OWORD *)(v17 + 28) = 0u;
    if (a4)
      *(_OWORD *)(v17 + 12) = *a4;
    if (a5)
      *(_OWORD *)(v17 + 28) = *a5;
    if (a8)
      memcpy(v17 + 44, a7, a8);
    v18 = v15(a2, 44, 0, (char *)v21 - ((a8 + 59) & 0xFFFFFFFFFFFFFFF0), a8 + 44, 0, 0);
    if ((_DWORD)v18)
      v19 = 70;
    else
      v19 = 10;
  }
  else
  {
    v19 = 70;
    v18 = 4294967293;
  }
  if (v19 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSetEnvironmentVariable", (int)v18);
  return v18;
}

uint64_t LibCall_ACMTRMLoadState(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v8;
  uint64_t v9;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMTRMLoadState");
  v8 = 70;
  v9 = 4294967293;
  if (a1 && a3 && a4)
  {
    v9 = a1(a2, 38, 0, 0, 0, a3, a4);
    if ((_DWORD)v9)
      v8 = 70;
    else
      v8 = 10;
  }
  if (v8 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMLoadState", (int)v9);
  return v9;
}

uint64_t LibCall_ACMTRMSaveState(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD), uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  BOOL v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMTRMSaveState");
  if (a1)
  {
    v10 = (unint64_t)(a4 - 8193) < 0xFFFFFFFFFFFFE000;
    if (!a3)
      v10 = a4 != 0;
    v11 = 70;
    if (!v10)
    {
      if (a5)
        v12 = 43;
      else
        v12 = 39;
      v13 = a1(a2, v12, 0, a3, a4, 0, 0);
      if ((_DWORD)v13)
        v11 = 70;
      else
        v11 = 10;
      goto LABEL_13;
    }
  }
  else
  {
    v11 = 70;
  }
  v13 = 4294967293;
LABEL_13:
  if (v11 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMSaveState", (int)v13);
  return v13;
}

uint64_t LibCall_ACMContextLoadFromImage(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, _QWORD, char *, uint64_t, _OWORD *, unint64_t *);
  unsigned int v11;
  uint64_t v12;
  _DWORD *v13;
  uint64_t v14;
  int v15;
  unint64_t v17;
  _OWORD v18[17];
  uint64_t v19;
  char v20;
  _BYTE v21[3];
  __int16 v22;
  uint64_t v23;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, uint64_t, _OWORD *, unint64_t *))v1;
  v23 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextLoadFromImage");
  v11 = 70;
  v12 = 4294967293;
  if (v10 && v7 && (unint64_t)(v5 - 4097) >= 0xFFFFFFFFFFFFF000)
  {
    v13 = acm_mem_alloc(0x14uLL);
    acm_mem_alloc_info("ACMHandleWithPayload", v13, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1447, "LibCall_ACMContextLoadFromImage");
    if (v13)
    {
      bzero(v21, 0x1005uLL);
      v20 = 1;
      *(_WORD *)&v21[1] = 6;
      v22 = v5;
      __memcpy_chk();
      memset(v18, 0, sizeof(v18));
      v19 = 0;
      v17 = 280;
      v14 = v10(v9, 48, 0, &v20, 4102, v18, &v17);
      if ((_DWORD)v14)
      {
        v12 = v14;
      }
      else if (v17 < 0x18)
      {
        v12 = 4294967291;
      }
      else
      {
        if (LOBYTE(v18[0]))
        {
          v12 = 0;
          v15 = DWORD1(v18[1]);
          *(_OWORD *)v13 = *(_OWORD *)((char *)v18 + 4);
          v13[4] = v15;
          *v3 = v13;
          v11 = 10;
          goto LABEL_11;
        }
        v12 = 4294967280;
      }
      acm_mem_free_info("ACMHandleWithPayload", v13, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1508, "LibCall_ACMContextLoadFromImage");
      acm_mem_free(v13, 0x14uLL);
      v11 = 70;
    }
    else
    {
      v11 = 70;
      v12 = 4294967292;
    }
  }
LABEL_11:
  if (v11 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextLoadFromImage", (int)v12);
  return v12;
}

uint64_t LibCall_ACMContextUnloadToImage(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  __int128 *v6;
  __int128 *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, _QWORD, int *, uint64_t, _BYTE *, int *);
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  int v16[2];
  _BYTE v17[2];
  unsigned __int16 v18;
  size_t __n;
  int v20;
  __int128 v21;
  uint64_t v22;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, int *, uint64_t, _BYTE *, int *))v1;
  v22 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextUnloadToImage");
  v11 = 70;
  v12 = 4294967293;
  if (v10 && v5 && v3)
  {
    v21 = 0uLL;
    v20 = 1310721;
    if (v7)
      v21 = *v7;
    else
      v21 = 0uLL;
    bzero(v17, 0x1106uLL);
    *(_QWORD *)v16 = 4358;
    v13 = v10(v9, 49, 0, &v20, 20, v17, v16);
    if ((_DWORD)v13)
    {
      v12 = v13;
LABEL_18:
      v11 = 70;
      goto LABEL_14;
    }
    if (*(_QWORD *)v16 < 6uLL)
    {
      v11 = 70;
      v12 = 4294967291;
    }
    else
    {
      if (v17[0])
      {
        v15 = v18;
        v12 = Util_ReadFromBuffer((uint64_t)v17, *(size_t *)v16, &v15, v5, (unsigned __int16)__n);
        if (!(_DWORD)v12)
        {
          *v3 = v15 - v18;
          v11 = 10;
          goto LABEL_14;
        }
        goto LABEL_18;
      }
      v11 = 70;
      v12 = 4294967280;
    }
  }
LABEL_14:
  if (v11 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextUnloadToImage", (int)v12);
  return v12;
}

uint64_t LibCall_ACMContextSetData(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, void *, size_t, _QWORD, _QWORD), uint64_t a2, _OWORD *a3, int a4, _DWORD *a5, unsigned int a6, const void *a7, size_t a8)
{
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  void *v20;
  uint64_t v21;
  rsize_t v22;
  size_t size;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextSetData");
  size = 0;
  v16 = 70;
  v17 = 4294967293;
  if (a1 && a3)
  {
    if ((a7 != 0) != (a8 != 0))
    {
      v16 = 70;
      v17 = 4294967293;
    }
    else if (a8 > 0xE00)
    {
      v16 = 70;
      v17 = 4294967276;
    }
    else
    {
      v18 = LibSer_StorageSetData_GetSize(a8, a5, a6, &size);
      if ((_DWORD)v18)
      {
        v17 = v18;
        v16 = 70;
      }
      else
      {
        v19 = size;
        v20 = acm_mem_alloc_data(size);
        acm_mem_alloc_info("<data>", v20, v19, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1593, "LibCall_ACMContextSetData");
        if (v20)
        {
          v21 = LibSer_StorageSetData_Serialize(a3, a4, a7, a8, a5, a6, (uint64_t)v20, &size);
          if (!(_DWORD)v21)
            v21 = a1(a2, 40, 0, v20, size, 0, 0);
          v17 = v21;
          v22 = size;
          acm_mem_free_info("<data>", v20, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1605, "LibCall_ACMContextSetData");
          acm_mem_free_data(v20, v22);
          if ((_DWORD)v17)
            v16 = 70;
          else
            v16 = 10;
        }
        else
        {
          v16 = 70;
          v17 = 4294967292;
        }
      }
    }
  }
  if (v16 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextSetData", (int)v17);
  return v17;
}

uint64_t LibCall_ACMContextGetData(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, void *, size_t, uint64_t, uint64_t), uint64_t a2, _OWORD *a3, int a4, char a5, _DWORD *a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  size_t v21;
  void *v22;
  uint64_t Data_Serialize;
  rsize_t v24;
  uint64_t v26;
  size_t size;

  if (gACMLoggingLevel <= 0xAu)
  {
    v16 = a8;
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextGetData");
    a8 = v16;
  }
  size = 0;
  v17 = 70;
  v18 = 4294967293;
  if (a1)
  {
    v26 = a2;
    if (a3)
    {
      v18 = 4294967293;
      if (a8)
      {
        if (a9)
        {
          v19 = a8;
          v20 = LibSer_StorageGetData_GetSize(a6, a7, &size);
          if ((_DWORD)v20)
          {
            v18 = v20;
            v17 = 70;
          }
          else
          {
            v21 = size;
            v22 = acm_mem_alloc_data(size);
            acm_mem_alloc_info("<data>", v22, v21, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1628, "LibCall_ACMContextGetData");
            if (v22)
            {
              Data_Serialize = LibSer_StorageGetData_Serialize(a3, a4, a5, a6, a7, (uint64_t)v22, &size);
              if (!(_DWORD)Data_Serialize)
                Data_Serialize = a1(v26, 41, 0, v22, size, v19, a9);
              v18 = Data_Serialize;
              v24 = size;
              acm_mem_free_info("<data>", v22, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1640, "LibCall_ACMContextGetData");
              acm_mem_free_data(v22, v24);
              if ((_DWORD)v18)
                v17 = 70;
              else
                v17 = 10;
            }
            else
            {
              v17 = 70;
              v18 = 4294967292;
            }
          }
        }
      }
    }
  }
  if (v17 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextGetData", (int)v18);
  return v18;
}

uint64_t LibCall_ACMPublishTrustedAccessories(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD), uint64_t a2, const void *a3, size_t a4)
{
  uint64_t (*v7)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD);
  BOOL v8;
  char v9;
  unsigned int v10;
  uint64_t v11;
  _DWORD *v12;
  _QWORD v14[2];

  v7 = a1;
  v14[1] = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    a1 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD))printf("%s: %s: called.\n", "ACM", "LibCall_ACMPublishTrustedAccessories");
  if (v7)
  {
    if (a3)
      v8 = 1;
    else
      v8 = a4 == 0;
    v9 = !v8;
    v10 = 70;
    v11 = 4294967293;
    if ((a4 & 0xF) == 0 && a4 <= 0x100 && (v9 & 1) == 0)
    {
      MEMORY[0x24BDAC7A8](a1);
      v12 = (_DWORD *)((char *)v14 - ((a4 + 23) & 0xFFFFFFFFFFFFFFF0));
      *v12 = 1;
      v12[1] = a4;
      if (a4)
        memcpy(v12 + 2, a3, a4);
      v11 = v7(a2, 45, 0, (char *)v14 - ((a4 + 23) & 0xFFFFFFFFFFFFFFF0), a4 + 8, 0, 0);
      if ((_DWORD)v11)
        v10 = 70;
      else
        v10 = 10;
    }
  }
  else
  {
    v10 = 70;
    v11 = 4294967293;
  }
  if (v10 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMPublishTrustedAccessories", (int)v11);
  return v11;
}

uint64_t LibCall_ACMContextGetInfo(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, int *, uint64_t, _OWORD *, unint64_t *), uint64_t a2, __int128 *a3, int a4, _QWORD *a5)
{
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;
  _OWORD v15[9];
  int v16;
  __int128 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextGetInfo");
  v10 = 70;
  v11 = 4294967293;
  if (a3 && a1 && a5)
  {
    v16 = 1;
    v18 = a4;
    v17 = *a3;
    memset(v15, 0, 140);
    v14 = 140;
    v12 = a1(a2, 46, 0, &v16, 24, v15, &v14);
    if ((_DWORD)v12)
    {
      v11 = v12;
    }
    else if (v14 < 0xC)
    {
      v11 = 4294967291;
    }
    else
    {
      if (LODWORD(v15[0]))
      {
        v11 = 0;
        *a5 = *(_QWORD *)((char *)v15 + 4);
        v10 = 10;
        goto LABEL_10;
      }
      v11 = 4294967281;
    }
    v10 = 70;
  }
LABEL_10:
  if (v10 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextGetInfo", (int)v11);
  return v11;
}

uint64_t verifyAclConstraintInternal(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, void *, size_t, unsigned int *, unint64_t *), uint64_t a2, uint64_t a3, _OWORD *a4, const void *a5, uint64_t a6, const void *a7, unsigned int a8, unsigned __int8 a9, _DWORD *a10, unsigned int a11, unsigned int a12, BOOL *a13, int **a14)
{
  uint64_t v20;
  uint64_t SerializedVerifyAclConstraintSize;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unsigned int *v25;
  uint64_t v26;
  unint64_t v27;
  rsize_t v28;
  unsigned int v29;
  size_t v33;
  int *v34;
  unint64_t v35;
  size_t v36;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "verifyAclConstraintInternal");
  v36 = 0;
  v34 = 0;
  v35 = 4096;
  v33 = 0;
  v20 = 4294967293;
  if (!a4 || !a5 || !a6 || !a13)
  {
LABEL_19:
    if (!(_DWORD)v20)
      goto LABEL_22;
    goto LABEL_20;
  }
  SerializedVerifyAclConstraintSize = GetSerializedVerifyAclConstraintSize(a3, (uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a9, a12, a10, a11, &v36);
  if (!(_DWORD)SerializedVerifyAclConstraintSize)
  {
    v22 = v36;
    v23 = acm_mem_alloc_data(v36);
    acm_mem_alloc_info("<data>", v23, v22, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1929, "verifyAclConstraintInternal");
    if (v23)
    {
      v24 = SerializeVerifyAclConstraint(a3, a4, a5, a6, a7, a8, a9, a12, a10, a11, (uint64_t)v23, &v36);
      if ((_DWORD)v24)
      {
        v20 = v24;
        v25 = 0;
      }
      else
      {
        v25 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
        acm_mem_alloc_info("<data>", v25, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1935, "verifyAclConstraintInternal");
        if (v25)
        {
          v26 = a1(a2, a3, 0, v23, v36, v25, &v35);
          if ((_DWORD)v26)
          {
            v20 = v26;
          }
          else
          {
            v27 = v35 - 4;
            if (v35 < 4)
            {
              v20 = 4294967291;
            }
            else
            {
              *a13 = *v25 != 0;
              if (a14)
              {
                v20 = DeserializeRequirement(v25 + 1, v27, (void **)&v34, &v33);
                if (!(_DWORD)v20)
                  *a14 = v34;
              }
              else
              {
                v20 = 0;
              }
            }
          }
        }
        else
        {
          v20 = 4294967292;
        }
      }
      v28 = v36;
      acm_mem_free_info("<data>", v23, v36, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1958, "verifyAclConstraintInternal");
      acm_mem_free_data(v23, v28);
      if (v25)
      {
        acm_mem_free_info("<data>", v25, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1961, "verifyAclConstraintInternal");
        acm_mem_free_data(v25, 0x1000uLL);
      }
    }
    else
    {
      v20 = 4294967292;
    }
    goto LABEL_19;
  }
  v20 = SerializedVerifyAclConstraintSize;
LABEL_20:
  if (v34)
    Util_DeallocRequirement(v34);
LABEL_22:
  if ((_DWORD)v20)
    v29 = 70;
  else
    v29 = 10;
  if (v29 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "verifyAclConstraintInternal", (int)v20);
  return v20;
}

uint64_t LibCall_ACMSecContextProcessAcl(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, int *, uint64_t *), uint64_t a2, _OWORD *a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, _DWORD *a8, unsigned int a9, unsigned int a10, _DWORD *a11, BOOL *a12)
{
  return processAclCommandInternal(a1, a2, 12, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, 0, 0);
}

uint64_t processAclCommandInternal(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, int *, uint64_t *), uint64_t a2, int a3, _OWORD *a4, unsigned __int8 *a5, uint64_t a6, unsigned __int8 *a7, uint64_t a8, _DWORD *a9, unsigned int a10, unsigned int a11, _DWORD *a12, BOOL *a13, _QWORD *a14, unint64_t *a15)
{
  unsigned int v19;
  uint64_t v20;
  unsigned __int8 *v21;
  uint64_t v22;
  unsigned __int8 *v23;
  unsigned int v24;
  uint64_t v25;
  BOOL v26;
  int v27;
  uint64_t SerializedProcessAclSize;
  uint64_t v29;
  void *v30;
  _DWORD *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  rsize_t v36;
  unsigned int v37;
  int v39;
  unint64_t v44;
  size_t v45;

  v19 = gACMLoggingLevel;
  if (gACMLoggingLevel <= 0xAu)
  {
    printf("%s: %s: called.\n", "ACM", "processAclCommandInternal");
    v19 = gACMLoggingLevel;
  }
  if (v19 <= 0x14)
  {
    printf("%s: %s: command = %u.\n", "ACM", "processAclCommandInternal", a3);
    v19 = gACMLoggingLevel;
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: context = %p.\n", "ACM", "processAclCommandInternal", a4);
      v19 = gACMLoggingLevel;
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s: acl = %p, aclLength = %zu.\n", "ACM", "processAclCommandInternal", a5, a6);
        v19 = gACMLoggingLevel;
        if (gACMLoggingLevel <= 0x14u)
        {
          printf("%s: %s (len=%u): acl:", "ACM", "processAclCommandInternal", a6);
          v19 = gACMLoggingLevel;
        }
      }
    }
  }
  if (a6)
  {
    v20 = a6;
    v21 = a5;
    do
    {
      if (v19 <= 0x14)
      {
        printf("%02x ", *v21);
        v19 = gACMLoggingLevel;
      }
      ++v21;
      --v20;
    }
    while (v20);
  }
  if (v19 < 0x15)
  {
    putchar(10);
    v19 = gACMLoggingLevel;
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: operation = %p, operationLength = %zu.\n", "ACM", "processAclCommandInternal", a7, a8);
      v19 = gACMLoggingLevel;
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s (len=%u): operation:", "ACM", "processAclCommandInternal", a8);
        v19 = gACMLoggingLevel;
      }
    }
  }
  v39 = a3;
  if (a8)
  {
    v22 = a8;
    v23 = a7;
    do
    {
      if (v19 <= 0x14)
      {
        printf("%02x ", *v23);
        v19 = gACMLoggingLevel;
      }
      ++v23;
      --v22;
    }
    while (v22);
  }
  if (v19 < 0x15)
  {
    putchar(10);
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: parameters = %p, parameterCount = %u.\n", "ACM", "processAclCommandInternal", a9, a10);
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s: maxGlobalCredentialAge = %u.\n", "ACM", "processAclCommandInternal", a11);
        if (gACMLoggingLevel <= 0x14u)
        {
          printf("%s: %s: constraintState = %p.\n", "ACM", "processAclCommandInternal", a12);
          if (gACMLoggingLevel <= 0x14u)
            printf("%s: %s: requirePasscode = %p.\n", "ACM", "processAclCommandInternal", a13);
        }
      }
    }
  }
  if (a7 || a9 || a12)
  {
    if (a5)
      v26 = a6 == 0;
    else
      v26 = 1;
    v27 = v26;
    v24 = 70;
    v25 = 4294967293;
    if (!a7)
      goto LABEL_79;
    if (!a8)
      goto LABEL_79;
    if (v27)
      goto LABEL_79;
    v24 = 70;
    v25 = 4294967293;
    if ((a9 != 0) != (a10 != 0) || !a12)
      goto LABEL_79;
    v45 = 0;
    v44 = 4096;
    if (gACMLoggingLevel <= 0xAu)
      printf("%s: %s: called.\n", "ACM", "processAclInternal");
    SerializedProcessAclSize = GetSerializedProcessAclSize((uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a11, a9, a10, &v45);
    if ((_DWORD)SerializedProcessAclSize)
    {
      v25 = SerializedProcessAclSize;
      v37 = 70;
      goto LABEL_74;
    }
    v29 = v45;
    v30 = acm_mem_alloc_data(v45);
    acm_mem_alloc_info("<data>", v30, v29, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1776, "processAclInternal");
    if (!v30)
    {
      v37 = 70;
      v25 = 4294967292;
      goto LABEL_74;
    }
    v44 = 4096;
    v31 = acm_mem_alloc_data(0x1000uLL);
    acm_mem_alloc_info("<data>", v31, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1780, "processAclInternal");
    if (!v31)
    {
      v35 = 0;
      v34 = 0;
      v25 = 4294967292;
      goto LABEL_68;
    }
    v32 = SerializeProcessAcl(a4, a5, a6, a7, a8, a11, a9, a10, (uint64_t)v30, &v45);
    if ((_DWORD)v32 || (v32 = a1(a2, v39, 0, (char *)v30, v45, v31, (uint64_t *)&v44), (_DWORD)v32))
    {
      v25 = v32;
      v34 = 0;
      v35 = 0;
      goto LABEL_67;
    }
    v33 = v44;
    if (v44 >= 8)
    {
      *a12 = *v31;
      if (a13)
        *a13 = v31[1] != 0;
      v25 = 0;
      v34 = 0;
      if (v39 != 30 || !a14)
      {
        v35 = 0;
        goto LABEL_67;
      }
      v35 = 0;
      if (!a15)
      {
LABEL_67:
        acm_mem_free_info("<data>", v31, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1817, "processAclInternal");
        acm_mem_free_data(v31, 0x1000uLL);
LABEL_68:
        v36 = v45;
        acm_mem_free_info("<data>", v30, v45, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1821, "processAclInternal");
        acm_mem_free_data(v30, v36);
        if ((_DWORD)v25 && v35)
        {
          acm_mem_free_info("<data>", v35, v34, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1825, "processAclInternal");
          acm_mem_free_data(v35, v34);
          v37 = 70;
        }
        else if ((_DWORD)v25)
        {
          v37 = 70;
        }
        else
        {
          v37 = 10;
        }
LABEL_74:
        if (v37 >= gACMLoggingLevel)
          printf("%s: %s: returning, err = %ld.\n", "ACM", "processAclInternal", (int)v25);
        goto LABEL_76;
      }
      if (v33 >= 0xC)
      {
        v34 = v31[2];
        if ((_DWORD)v34)
        {
          if (v33 >= v34 + 12)
          {
            v35 = acm_mem_alloc_data(v31[2]);
            acm_mem_alloc_info("<data>", v35, v34, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1805, "processAclInternal");
            if (v35)
            {
              memcpy(v35, v31 + 3, v34);
              v25 = 0;
              *a14 = v35;
              *a15 = v34;
            }
            else
            {
              v25 = 4294967292;
            }
            goto LABEL_67;
          }
          goto LABEL_84;
        }
        v34 = 0;
        v35 = 0;
        v25 = 0;
        goto LABEL_67;
      }
    }
    v34 = 0;
LABEL_84:
    v35 = 0;
    v25 = 4294967291;
    goto LABEL_67;
  }
  if (a4)
  {
    v24 = 70;
    v25 = 4294967293;
    goto LABEL_79;
  }
  v24 = 70;
  v25 = 4294967293;
  if (a5 && a13 && a6)
  {
    v25 = aclRequiresPasscodeInternal(a1, a2, a5, a6, a13);
LABEL_76:
    if ((_DWORD)v25)
      v24 = 70;
    else
      v24 = 10;
  }
LABEL_79:
  if (v24 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "processAclCommandInternal", (int)v25);
  return v25;
}

uint64_t LibCall_ACMSecContextProcessAclAndCopyAuthMethod(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, int *, uint64_t *), uint64_t a2, _OWORD *a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, _DWORD *a8, unsigned int a9, unsigned int a10, _DWORD *a11, BOOL *a12, _QWORD *a13, unint64_t *a14)
{
  return processAclCommandInternal(a1, a2, 30, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

uint64_t LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, void *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, const void *a6, unsigned int a7, unsigned __int8 a8, _DWORD *a9, unsigned int a10, unsigned int a11, BOOL *a12, int **a13)
{
  unsigned int v21;
  uint64_t v22;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement");
  v21 = 70;
  v22 = 4294967293;
  if (a3)
  {
    if (a4)
    {
      if (a5)
      {
        v21 = 70;
        v22 = 4294967293;
        if ((a9 != 0) == (a10 != 0))
        {
          if (a12)
          {
            v22 = verifyAclConstraintInternal(a1, a2, 11, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
            if ((_DWORD)v22)
              v21 = 70;
            else
              v21 = 10;
          }
        }
      }
    }
  }
  if (v21 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement", (int)v22);
  return v22;
}

uint64_t LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, _QWORD, _QWORD), uint64_t a2, const void *a3, unsigned int a4, _OWORD *a5, uint64_t a6, int a7, _OWORD *a8, uint64_t a9)
{
  uint64_t (*v16)(uint64_t, uint64_t, _QWORD, char *, uint64_t, _QWORD, _QWORD);
  BOOL v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  size_t v21;
  char *v22;
  _QWORD v24[2];

  v16 = a1;
  v24[1] = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    a1 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, uint64_t, _QWORD, _QWORD))printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser");
  v17 = a4 - 113 < 0xFFFFFF90;
  if (!a3)
    v17 = a4 != 0;
  if (v17)
  {
    v18 = 70;
    v19 = 4294967293;
  }
  else
  {
    v18 = 70;
    v19 = 4294967293;
    if (a8)
    {
      if (a9 == 16)
      {
        v19 = 4294967293;
        if (a5)
        {
          if (a6 == 16)
          {
            v20 = a4 + 36;
            MEMORY[0x24BDAC7A8](a1);
            v22 = (char *)v24 - ((v21 + 51) & 0x1FFFFFFF0);
            *(_DWORD *)v22 = a7;
            *(_OWORD *)(v22 + 4) = *a8;
            *(_OWORD *)(v22 + 20) = *a5;
            if (a3)
              memcpy(v22 + 36, a3, v21);
            v19 = v16(a2, 14, 0, v22, v20, 0, 0);
            if ((_DWORD)v19)
              v18 = 70;
            else
              v18 = 10;
          }
        }
      }
    }
  }
  if (v18 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser", (int)v19);
  return v19;
}

uint64_t LibCall_ACMSecSetBuiltinBiometry(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD), uint64_t a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  char v9;

  v9 = a3;
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecSetBuiltinBiometry");
  v5 = LibCall_ACMSetEnvironmentVariable(a1, a2, 30, 0, 0, 0, &v9, 1uLL);
  v6 = v5;
  if ((_DWORD)v5)
    v7 = 70;
  else
    v7 = 10;
  if (v7 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecSetBuiltinBiometry", (int)v5);
  return v6;
}

uint64_t LibCall_ACMSecSetBiometryAvailability(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, char a3, int a4)
{
  uint64_t v8;
  unsigned int v9;
  char v10;
  uint64_t v11;
  char v13;
  unint64_t v14;
  char v15;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecSetBiometryAvailability");
  v15 = 0;
  v14 = 1;
  v13 = 0;
  v8 = LibCall_ACMGetEnvironmentVariable(a1, a2, 6, (uint64_t)&v15, (uint64_t)&v14);
  if ((_DWORD)v8)
  {
    v11 = v8;
    v9 = 70;
  }
  else
  {
    v9 = 70;
    if (v14 > 1)
    {
      v11 = 4294967291;
    }
    else
    {
      v10 = v15 & ~a3;
      if (a4)
        v10 = v15 | a3;
      v13 = v10;
      v11 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD))a1, a2, 6, 0, 0, 0, &v13, 1uLL);
      if ((_DWORD)v11)
        v9 = 70;
      else
        v9 = 10;
    }
  }
  if (v9 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecSetBiometryAvailability", (int)v11);
  return v11;
}

uint64_t LibCall_ACMSecContextGetUnlockSecret(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), uint64_t a2, _OWORD *a3, _DWORD *a4, unsigned int a5, void *a6, size_t *a7, _BYTE *a8)
{
  unsigned int v16;
  uint64_t v17;
  uint64_t UnlockSecret_Serialize;
  size_t v19;
  char v21;
  size_t __n;
  void *__src;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[129];
  _OWORD v27[4];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecContextGetUnlockSecret");
  memset(v27, 0, sizeof(v27));
  v25 = 64;
  v24 = 129;
  if (!a3)
    goto LABEL_18;
  v16 = 70;
  v17 = 4294967293;
  if (!a6 || !a7 || !a8)
    goto LABEL_14;
  if ((a4 != 0) != (a5 != 0))
  {
LABEL_18:
    v16 = 70;
    v17 = 4294967293;
    goto LABEL_14;
  }
  UnlockSecret_Serialize = LibSer_GetUnlockSecret_Serialize(a3, a4, a5, v27, &v25);
  if ((_DWORD)UnlockSecret_Serialize
    || (UnlockSecret_Serialize = a1(a2, 50, 0, v27, v25, v26, &v24), (_DWORD)UnlockSecret_Serialize)
    || (__n = 0,
        __src = 0,
        v21 = 0,
        UnlockSecret_Serialize = LibSer_GetUnlockSecretResponse_Deserialize(v26, v24, &__src, &__n, &v21),
        (_DWORD)UnlockSecret_Serialize))
  {
    v17 = UnlockSecret_Serialize;
  }
  else
  {
    v19 = __n;
    if (*a7 < __n)
    {
      v17 = 4294967276;
    }
    else
    {
      if (__src)
      {
        memcpy(a6, __src, __n);
        v17 = 0;
        *a7 = v19;
        *a8 = v21;
        v16 = 10;
        goto LABEL_14;
      }
      v17 = 4294967291;
    }
  }
  v16 = 70;
LABEL_14:
  if (v16 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecContextGetUnlockSecret", (int)v17);
  return v17;
}

uint64_t LibCall_ACMSEPControl(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, unsigned int *, unint64_t *), uint64_t a2, const void *a3, size_t a4, uint64_t a5, _DWORD *a6, unsigned int a7, void *a8, size_t *a9)
{
  BOOL v16;
  uint64_t Size;
  uint64_t v18;
  uint64_t v19;
  _OWORD *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  void *v26;
  size_t v27;
  uint64_t v29;
  void *v30;
  size_t v31;
  const void *v32;
  unint64_t v33;
  uint64_t v34;
  unsigned int v35[256];
  uint64_t v36;

  v30 = a8;
  v36 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSEPControl");
  v33 = 1024;
  v34 = 0;
  if (!a1)
    goto LABEL_17;
  v16 = a4 - 4097 < 0xFFFFFFFFFFFFF000;
  if (!a3)
    v16 = a4 != 0;
  if (v16)
  {
LABEL_17:
    v25 = 70;
    v24 = 4294967293;
    goto LABEL_21;
  }
  Size = LibSer_SEPControl_GetSize(a4, a6, a7, &v34);
  if ((_DWORD)Size)
  {
LABEL_18:
    v24 = Size;
LABEL_25:
    v25 = 70;
    goto LABEL_21;
  }
  v18 = a5;
  v19 = a2;
  v20 = (_OWORD *)MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v29 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = LibSer_SEPControl_Serialize(v20, a6, a7, a3, a4, (uint64_t)v22, &v34);
  if ((_DWORD)v23)
  {
    v24 = v23;
    goto LABEL_20;
  }
  v24 = a1(v19, 51, 0, v22, v34, v35, &v33);
  if ((_DWORD)v24)
  {
LABEL_20:
    v25 = 70;
    goto LABEL_21;
  }
  v25 = 10;
  v26 = v30;
  if (!v30 || !a9)
    goto LABEL_21;
  v31 = 0;
  v32 = 0;
  Size = LibSer_SEPControlResponse_Deserialize(v35, v33, &v32, &v31);
  if ((_DWORD)Size)
    goto LABEL_18;
  v27 = v31;
  if (*a9 < v31)
  {
    v24 = 4294967276;
    goto LABEL_25;
  }
  if (v32)
    memcpy(v26, v32, v31);
  v24 = 0;
  *a9 = v27;
  v25 = 10;
LABEL_21:
  if (v25 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSEPControl", (int)v24);
  return v24;
}

uint64_t aclRequiresPasscodeInternal(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, int *, uint64_t *), uint64_t a2, const void *a3, unsigned int a4, _BYTE *a5)
{
  size_t v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  v18 = 4;
  v10 = a4;
  v11 = a4 + 4;
  MEMORY[0x24BDAC7A8](a1);
  v12 = (unsigned int *)((char *)&v17 - ((v10 + 19) & 0x1FFFFFFF0));
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "aclRequiresPasscodeInternal");
  v13 = 70;
  v14 = 4294967293;
  if (a3 && a5)
  {
    *v12 = a4;
    memcpy(v12 + 1, a3, v10);
    v15 = a1(a2, 17, 0, (char *)&v17 - ((v10 + 19) & 0x1FFFFFFF0), v11, &v19, &v18);
    if ((_DWORD)v15)
    {
      v14 = v15;
      v13 = 70;
    }
    else if (v18 == 4)
    {
      v14 = 0;
      *a5 = 1;
      v13 = 10;
    }
    else
    {
      v13 = 70;
      v14 = 4294967291;
    }
  }
  if (v13 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "aclRequiresPasscodeInternal", (int)v14);
  return v14;
}

void LibCall_ACMKernelControl_cold_1()
{
  __assert_rtn("LibCall_ACMKernelControl", "LibCall.c", 373, "commandCursor == commandBuffer + sizeof(commandBuffer)");
}

uint64_t __getPODirectoryServicesClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[POKeyBag isUserKeybagUnlocked].cold.1(v0);
}

uint64_t __getSOUtilsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[POAgentCoreProcess initWithXPCConnection:identifierProvider:jwksStroageProvider:].cold.1(v0);
}

uint64_t sub_24449BFCC()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_24449BFD8()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_24449BFE4()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_24449BFF0()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_24449BFFC()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_24449C008()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_24449C014()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_24449C020()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_24449C02C()
{
  return MEMORY[0x24BDCC1E0]();
}

uint64_t sub_24449C038()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_24449C044()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_24449C050()
{
  return MEMORY[0x24BDCDC08]();
}

uint64_t sub_24449C05C()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_24449C068()
{
  return MEMORY[0x24BDCDC28]();
}

uint64_t sub_24449C074()
{
  return MEMORY[0x24BDCDC40]();
}

uint64_t sub_24449C080()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_24449C08C()
{
  return MEMORY[0x24BDCDCA8]();
}

uint64_t sub_24449C098()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_24449C0A4()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_24449C0B0()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_24449C0BC()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_24449C0C8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24449C0D4()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_24449C0E0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24449C0EC()
{
  return MEMORY[0x24BDC61A8]();
}

uint64_t sub_24449C0F8()
{
  return MEMORY[0x24BDC61D0]();
}

uint64_t sub_24449C104()
{
  return MEMORY[0x24BDC61E0]();
}

uint64_t sub_24449C110()
{
  return MEMORY[0x24BDC6200]();
}

uint64_t sub_24449C11C()
{
  return MEMORY[0x24BDC6220]();
}

uint64_t sub_24449C128()
{
  return MEMORY[0x24BDC6268]();
}

uint64_t sub_24449C134()
{
  return MEMORY[0x24BDC6278]();
}

uint64_t sub_24449C140()
{
  return MEMORY[0x24BDC6280]();
}

uint64_t sub_24449C14C()
{
  return MEMORY[0x24BDC63A0]();
}

uint64_t sub_24449C158()
{
  return MEMORY[0x24BDC63B0]();
}

uint64_t sub_24449C164()
{
  return MEMORY[0x24BDC63C0]();
}

uint64_t sub_24449C170()
{
  return MEMORY[0x24BDC63E0]();
}

uint64_t sub_24449C17C()
{
  return MEMORY[0x24BDC6408]();
}

uint64_t sub_24449C188()
{
  return MEMORY[0x24BDC6420]();
}

uint64_t sub_24449C194()
{
  return MEMORY[0x24BDC6428]();
}

uint64_t sub_24449C1A0()
{
  return MEMORY[0x24BDC6430]();
}

uint64_t sub_24449C1AC()
{
  return MEMORY[0x24BDC6438]();
}

uint64_t sub_24449C1B8()
{
  return MEMORY[0x24BE2A3F0]();
}

uint64_t sub_24449C1C4()
{
  return MEMORY[0x24BDC6470]();
}

uint64_t sub_24449C1D0()
{
  return MEMORY[0x24BDC6480]();
}

uint64_t sub_24449C1DC()
{
  return MEMORY[0x24BDC64C8]();
}

uint64_t sub_24449C1E8()
{
  return MEMORY[0x24BDC64D8]();
}

uint64_t sub_24449C1F4()
{
  return MEMORY[0x24BDC6500]();
}

uint64_t sub_24449C200()
{
  return MEMORY[0x24BDC6510]();
}

uint64_t sub_24449C20C()
{
  return MEMORY[0x24BDC6558]();
}

uint64_t sub_24449C218()
{
  return MEMORY[0x24BDC6580]();
}

uint64_t sub_24449C224()
{
  return MEMORY[0x24BDC65A8]();
}

uint64_t sub_24449C230()
{
  return MEMORY[0x24BDC65D0]();
}

uint64_t sub_24449C23C()
{
  return MEMORY[0x24BDC6620]();
}

uint64_t sub_24449C248()
{
  return MEMORY[0x24BDC6628]();
}

uint64_t sub_24449C254()
{
  return MEMORY[0x24BDC6638]();
}

uint64_t sub_24449C260()
{
  return MEMORY[0x24BDC6718]();
}

uint64_t sub_24449C26C()
{
  return MEMORY[0x24BDC6728]();
}

uint64_t sub_24449C278()
{
  return MEMORY[0x24BDC6730]();
}

uint64_t sub_24449C284()
{
  return MEMORY[0x24BDC6738]();
}

uint64_t sub_24449C290()
{
  return MEMORY[0x24BDC6740]();
}

uint64_t sub_24449C29C()
{
  return MEMORY[0x24BDC6760]();
}

uint64_t sub_24449C2A8()
{
  return MEMORY[0x24BDC6770]();
}

uint64_t sub_24449C2B4()
{
  return MEMORY[0x24BDC6788]();
}

uint64_t sub_24449C2C0()
{
  return MEMORY[0x24BDC6790]();
}

uint64_t sub_24449C2CC()
{
  return MEMORY[0x24BDC6798]();
}

uint64_t sub_24449C2D8()
{
  return MEMORY[0x24BDC67A0]();
}

uint64_t sub_24449C2E4()
{
  return MEMORY[0x24BDC67B0]();
}

uint64_t sub_24449C2F0()
{
  return MEMORY[0x24BDC67B8]();
}

uint64_t sub_24449C2FC()
{
  return MEMORY[0x24BDC67C8]();
}

uint64_t sub_24449C308()
{
  return MEMORY[0x24BDC67D0]();
}

uint64_t sub_24449C314()
{
  return MEMORY[0x24BDC67E0]();
}

uint64_t sub_24449C320()
{
  return MEMORY[0x24BDC67F8]();
}

uint64_t sub_24449C32C()
{
  return MEMORY[0x24BDC6800]();
}

uint64_t sub_24449C338()
{
  return MEMORY[0x24BDC6808]();
}

uint64_t sub_24449C344()
{
  return MEMORY[0x24BDC6810]();
}

uint64_t sub_24449C350()
{
  return MEMORY[0x24BDC6820]();
}

uint64_t sub_24449C35C()
{
  return MEMORY[0x24BDC6830]();
}

uint64_t sub_24449C368()
{
  return MEMORY[0x24BDC6840]();
}

uint64_t sub_24449C374()
{
  return MEMORY[0x24BDC6898]();
}

uint64_t sub_24449C380()
{
  return MEMORY[0x24BDC68D0]();
}

uint64_t sub_24449C38C()
{
  return MEMORY[0x24BDC68F8]();
}

uint64_t sub_24449C398()
{
  return MEMORY[0x24BDC6930]();
}

uint64_t sub_24449C3A4()
{
  return MEMORY[0x24BDC6968]();
}

uint64_t sub_24449C3B0()
{
  return MEMORY[0x24BDC6A80]();
}

uint64_t sub_24449C3BC()
{
  return MEMORY[0x24BDC6A88]();
}

uint64_t sub_24449C3C8()
{
  return MEMORY[0x24BDC6A98]();
}

uint64_t sub_24449C3D4()
{
  return MEMORY[0x24BDC6AA8]();
}

uint64_t sub_24449C3E0()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_24449C3EC()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_24449C3F8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24449C404()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24449C410()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_24449C41C()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_24449C428()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_24449C434()
{
  return MEMORY[0x24BDCFAD8]();
}

uint64_t sub_24449C440()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_24449C44C()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_24449C458()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_24449C464()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_24449C470()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_24449C47C()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_24449C488()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_24449C494()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24449C4A0()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_24449C4AC()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_24449C4B8()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_24449C4C4()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_24449C4D0()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_24449C4DC()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_24449C4E8()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_24449C4F4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_24449C500()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_24449C50C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_24449C518()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_24449C524()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_24449C530()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_24449C53C()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_24449C548()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_24449C554()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_24449C560()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_24449C56C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24449C578()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_24449C584()
{
  return MEMORY[0x24BEE31B8]();
}

uint64_t sub_24449C590()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24449C59C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24449C5A8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return MEMORY[0x24BDAC158]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x24BDAC160]();
}

uint64_t CCRandomCopyBytes()
{
  return MEMORY[0x24BDAC2C8]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x24BDBB7A8]();
}

void CFAllocatorSetDefault(CFAllocatorRef allocator)
{
  MEMORY[0x24BDBB7B8](allocator);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB8](allocator, capacity, theData);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x24BDBBE98](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
  MEMORY[0x24BDBC4B8](theString, chars, numChars);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x24BDBC528](alloc, theString, *(_QWORD *)&encoding, lossByte);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x24BDD7F40](*(_QWORD *)&connect, *(_QWORD *)&type, *(_QWORD *)&port, reference);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x24BDD88C0](*(_QWORD *)&mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t SecAccessConstraintCreateBiometryAny()
{
  return MEMORY[0x24BDE8760]();
}

uint64_t SecAccessConstraintCreateBiometryCurrentSet()
{
  return MEMORY[0x24BDE8768]();
}

uint64_t SecAccessConstraintCreateCompanion()
{
  return MEMORY[0x24BDE8770]();
}

uint64_t SecAccessConstraintCreateKofN()
{
  return MEMORY[0x24BDE8778]();
}

uint64_t SecAccessControlAddConstraintForOperation()
{
  return MEMORY[0x24BDE8780]();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x24BDE87A0](allocator, protection, flags, error);
}

uint64_t SecAccessControlGetConstraint()
{
  return MEMORY[0x24BDE87A8]();
}

uint64_t SecAccessControlSetConstraints()
{
  return MEMORY[0x24BDE87C0]();
}

uint64_t SecAccessControlSetProtection()
{
  return MEMORY[0x24BDE87C8]();
}

uint64_t SecCFAllocatorZeroize()
{
  return MEMORY[0x24BDE8808]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x24BDE8850](certificate);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x24BDE8888](certificate);
}

uint64_t SecCertificateCopyPublicKeySHA1Digest()
{
  return MEMORY[0x24BDE88C0]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

uint64_t SecGenerateSelfSignedCertificate()
{
  return MEMORY[0x24BDE8A40]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x24BDE8A48](identityRef, certificateRef);
}

OSStatus SecIdentityCopyPrivateKey(SecIdentityRef identityRef, SecKeyRef *privateKeyRef)
{
  return MEMORY[0x24BDE8A50](identityRef, privateKeyRef);
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x24BDE8A58]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

CFDictionaryRef SecKeyCopyAttributes(SecKeyRef key)
{
  return (CFDictionaryRef)MEMORY[0x24BDE8A98](key);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8AA8](key, error);
}

CFDataRef SecKeyCopyKeyExchangeResult(SecKeyRef privateKey, SecKeyAlgorithm algorithm, SecKeyRef publicKey, CFDictionaryRef parameters, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8AB0](privateKey, algorithm, publicKey, parameters, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x24BDE8AC8](key);
}

CFDataRef SecKeyCreateDecryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef ciphertext, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8AE8](key, algorithm, ciphertext, error);
}

uint64_t SecKeyCreateDecryptedDataWithParameters()
{
  return MEMORY[0x24BDE8AF0]();
}

CFDataRef SecKeyCreateEncryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef plaintext, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8B00](key, algorithm, plaintext, error);
}

uint64_t SecKeyCreateEncryptedDataWithParameters()
{
  return MEMORY[0x24BDE8B08]();
}

uint64_t SecKeyCreateRSAPublicKey()
{
  return MEMORY[0x24BDE8B28]();
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B30](parameters, error);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8B38](key, algorithm, dataToSign, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B40](keyData, attributes, error);
}

Boolean SecKeyIsAlgorithmSupported(SecKeyRef key, SecKeyOperationType operation, SecKeyAlgorithm algorithm)
{
  return MEMORY[0x24BDE8B88](key, operation, algorithm);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x24BDE8BA8](key, algorithm, signedData, signature, error);
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return (SecPolicyRef)MEMORY[0x24BDE8C28]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x24BDE8CC8](rnd, count, bytes);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x24BDE8D90](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x24BDE8DD8](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x24BDE8DF0](trust, error);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x24BDE8E28](trust, anchorCertificates);
}

OSStatus SecTrustSetAnchorCertificatesOnly(SecTrustRef trust, Boolean anchorCertificatesOnly)
{
  return MEMORY[0x24BDE8E30](trust, anchorCertificatesOnly);
}

uint64_t SecTrustStoreContains()
{
  return MEMORY[0x24BDE8E68]();
}

uint64_t SecTrustStoreForDomain()
{
  return MEMORY[0x24BDE8E80]();
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

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
  MEMORY[0x24BDACB10](dso, description, *(_QWORD *)&flags, activity_block);
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x24BDAD328](__count, __size);
}

uint64_t cc_clear()
{
  return MEMORY[0x24BDAD348]();
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x24BDAD350]();
}

uint64_t ccaes_cbc_decrypt_mode()
{
  return MEMORY[0x24BDAD358]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x24BDAD360]();
}

uint64_t cccbc_clear_iv()
{
  return MEMORY[0x24BDAD398]();
}

uint64_t cccbc_init()
{
  return MEMORY[0x24BDAD3A0]();
}

uint64_t cccbc_one_shot()
{
  return MEMORY[0x24BDAD3A8]();
}

uint64_t cccbc_update()
{
  return MEMORY[0x24BDAD3B8]();
}

uint64_t cccurve25519()
{
  return MEMORY[0x24BDAD3E0]();
}

uint64_t cccurve25519_make_pub()
{
  return MEMORY[0x24BDAD3F0]();
}

uint64_t ccder_blob_decode_len()
{
  return MEMORY[0x24BDAD408]();
}

uint64_t ccder_blob_decode_range()
{
  return MEMORY[0x24BDAD418]();
}

uint64_t ccder_blob_decode_sequence_tl()
{
  return MEMORY[0x24BDAD420]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x24BDAD428]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x24BDAD430]();
}

uint64_t ccder_blob_encode_body()
{
  return MEMORY[0x24BDAD440]();
}

uint64_t ccder_blob_encode_body_tl()
{
  return MEMORY[0x24BDAD448]();
}

uint64_t ccder_blob_encode_implicit_raw_octet_string()
{
  return MEMORY[0x24BDAD450]();
}

uint64_t ccder_blob_encode_implicit_uint64()
{
  return MEMORY[0x24BDAD458]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x24BDAD460]();
}

uint64_t ccder_decode_sequence_tl()
{
  return MEMORY[0x24BDAD480]();
}

uint64_t ccder_decode_tl()
{
  return MEMORY[0x24BDAD490]();
}

uint64_t ccder_encode_constructed_tl()
{
  return MEMORY[0x24BDAD4B0]();
}

uint64_t ccder_encode_raw_octet_string()
{
  return MEMORY[0x24BDAD4C8]();
}

uint64_t ccder_encode_uint64()
{
  return MEMORY[0x24BDAD4D8]();
}

uint64_t ccder_sizeof()
{
  return MEMORY[0x24BDAD4E0]();
}

uint64_t ccder_sizeof_implicit_uint64()
{
  return MEMORY[0x24BDAD4F0]();
}

uint64_t ccder_sizeof_raw_octet_string()
{
  return MEMORY[0x24BDAD510]();
}

uint64_t ccder_sizeof_uint64()
{
  return MEMORY[0x24BDAD520]();
}

uint64_t ccdigest()
{
  return MEMORY[0x24BDAD538]();
}

uint64_t ccec_export_pub()
{
  return MEMORY[0x24BDAD5B0]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x24BDAD5D0]();
}

uint64_t ccecb_one_shot()
{
  return MEMORY[0x24BDAD620]();
}

uint64_t cchkdf()
{
  return MEMORY[0x24BDAD690]();
}

uint64_t cchmac()
{
  return MEMORY[0x24BDAD6A8]();
}

uint64_t ccn_read_uint()
{
  return MEMORY[0x24BDAD720]();
}

uint64_t ccn_write_uint_padded()
{
  return MEMORY[0x24BDAD730]();
}

uint64_t ccpbkdf2_hmac()
{
  return MEMORY[0x24BDAD750]();
}

uint64_t ccrng()
{
  return MEMORY[0x24BDAD758]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x24BDAD828]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x24BDAD928]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x24BDAE550](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x24BDAE558](a1, *(_QWORD *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x24BDAE568](a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return MEMORY[0x24BDAE570](a1, a2, *(_QWORD *)&a3);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x24BDAEEC8](__s, __smax, *(_QWORD *)&__c, __n);
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

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x24BDAF198](*(_QWORD *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
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

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x24BDAF230](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
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

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int putchar(int a1)
{
  return MEMORY[0x24BDAF9F0](*(_QWORD *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x24BDAFAC0](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x24BDAFEB0](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x24BDAFF88](__big, __little, __len);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x24BDB0308](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x24BDB0310](dst, src);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0338](uu, out);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

xmlBufferPtr xmlBufferCreate(void)
{
  return (xmlBufferPtr)MEMORY[0x24BEDE638]();
}

void xmlBufferFree(xmlBufferPtr buf)
{
  MEMORY[0x24BEDE650](buf);
}

xmlNodePtr xmlDocGetRootElement(const xmlDoc *doc)
{
  return (xmlNodePtr)MEMORY[0x24BEDE740](doc);
}

void xmlFreeDoc(xmlDocPtr cur)
{
  MEMORY[0x24BEDE760](cur);
}

void xmlFreeNs(xmlNsPtr cur)
{
  MEMORY[0x24BEDE790](cur);
}

xmlChar *__cdecl xmlGetProp(const xmlNode *node, const xmlChar *name)
{
  return (xmlChar *)MEMORY[0x24BEDE828](node, name);
}

int xmlNodeDump(xmlBufferPtr buf, xmlDocPtr doc, xmlNodePtr cur, int level, int format)
{
  return MEMORY[0x24BEDEA38](buf, doc, cur, *(_QWORD *)&level, *(_QWORD *)&format);
}

xmlChar *__cdecl xmlNodeGetContent(const xmlNode *cur)
{
  return (xmlChar *)MEMORY[0x24BEDEA50](cur);
}

xmlDocPtr xmlParseMemory(const char *buffer, int size)
{
  return (xmlDocPtr)MEMORY[0x24BEDEAC8](buffer, *(_QWORD *)&size);
}

xmlNsPtr xmlSearchNsByHref(xmlDocPtr doc, xmlNodePtr node, const xmlChar *href)
{
  return (xmlNsPtr)MEMORY[0x24BEDEBE0](doc, node, href);
}

const xmlChar *__cdecl xmlStrchr(const xmlChar *str, xmlChar val)
{
  return (const xmlChar *)MEMORY[0x24BEDEC48](str, val);
}

xmlChar *__cdecl xmlStrdup(const xmlChar *cur)
{
  return (xmlChar *)MEMORY[0x24BEDEC58](cur);
}

xmlXPathObjectPtr xmlXPathEvalExpression(const xmlChar *str, xmlXPathContextPtr ctxt)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEED0](str, ctxt);
}

void xmlXPathFreeContext(xmlXPathContextPtr ctxt)
{
  MEMORY[0x24BEDEEE8](ctxt);
}

void xmlXPathFreeObject(xmlXPathObjectPtr obj)
{
  MEMORY[0x24BEDEEF8](obj);
}

xmlXPathContextPtr xmlXPathNewContext(xmlDocPtr doc)
{
  return (xmlXPathContextPtr)MEMORY[0x24BEDEF58](doc);
}

xmlXPathObjectPtr xmlXPathNodeEval(xmlNodePtr node, const xmlChar *str, xmlXPathContextPtr ctx)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEF98](node, str, ctx);
}

int xmlXPathRegisterNs(xmlXPathContextPtr ctxt, const xmlChar *prefix, const xmlChar *ns_uri)
{
  return MEMORY[0x24BEDF038](ctxt, prefix, ns_uri);
}

