void sub_199F02B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SLDClientGlobalWorkloop()
{
  if (SLDClientGlobalWorkloop_onceToken != -1)
    dispatch_once(&SLDClientGlobalWorkloop_onceToken, &__block_literal_global_25);
  return (id)SLDClientGlobalWorkloop_workloop;
}

void sub_199F035B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_199F038F8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_199F03C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199F03DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SLIsRunningInSLTester()
{
  if (SLIsRunningInSLTester_onceToken != -1)
    dispatch_once(&SLIsRunningInSLTester_onceToken, &__block_literal_global_36);
  return SLIsRunningInSLTester_sIsRunningInSLTester;
}

uint64_t SLIsRunningInGelatoTester()
{
  if (SLIsRunningInGelatoTester_onceToken != -1)
    dispatch_once(&SLIsRunningInGelatoTester_onceToken, &__block_literal_global_33);
  return SLIsRunningInGelatoTester_sIsRunningInSLTester;
}

uint64_t SLIsRunningInDaemon()
{
  if (SLIsRunningInDaemon_onceToken != -1)
    dispatch_once(&SLIsRunningInDaemon_onceToken, &__block_literal_global_30);
  return SLIsRunningInDaemon_sIsRunningInDaemon;
}

void sub_199F041EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199F04390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SLFrameworkLogHandle()
{
  if (SLFrameworkLogHandle_onceToken != -1)
    dispatch_once(&SLFrameworkLogHandle_onceToken, &__block_literal_global_3);
  return (id)SLFrameworkLogHandle_osLog;
}

void sub_199F044FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_1_3(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_15(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id OUTLINED_FUNCTION_0_5(id a1)
{
  return a1;
}

void sub_199F049F0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;
  id *v5;

  v5 = v3;
  objc_destroyWeak(v5);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_199F04A44()
{
  JUMPOUT(0x199F04A34);
}

void sub_199F04D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SLDaemonLogHandle()
{
  if (SLDaemonLogHandle_onceToken != -1)
    dispatch_once(&SLDaemonLogHandle_onceToken, &__block_literal_global_5);
  return (id)SLDaemonLogHandle_osLog;
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

uint64_t SLDConnectionIsEntitled(void *a1)
{
  id v1;
  uint64_t HasLegacyHighlightsEntitlement;

  v1 = a1;
  if ((SLDConnectionHasPublicEntitlement(v1) & 1) != 0)
    HasLegacyHighlightsEntitlement = 1;
  else
    HasLegacyHighlightsEntitlement = SLDConnectionHasLegacyHighlightsEntitlement(v1);

  return HasLegacyHighlightsEntitlement;
}

uint64_t SLDConnectionHasPublicEntitlement(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForEntitlement:", CFSTR("com.apple.developer.shared-with-you"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

uint64_t SLDConnectionHasLegacyHighlightsEntitlement(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForEntitlement:", CFSTR("com.apple.private.sociallayer.highlights"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

void sub_199F05B78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

id SLDGlobalWorkloop()
{
  if (SLDGlobalWorkloop_onceToken != -1)
    dispatch_once(&SLDGlobalWorkloop_onceToken, &__block_literal_global_23);
  return (id)SLDGlobalWorkloop_workloop;
}

void sub_199F062F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199F063D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199F065A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_199F066AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199F068B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SLDAllowedServiceClasses()
{
  if (SLDAllowedServiceClasses_onceToken != -1)
    dispatch_once(&SLDAllowedServiceClasses_onceToken, &__block_literal_global_3);
  return (id)SLDAllowedServiceClasses_sClasses;
}

void sub_199F06D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199F07250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  objc_destroyWeak((id *)(v9 - 56));
  _Unwind_Resume(a1);
}

id SLGeneralTelemetryLogHandle()
{
  if (SLGeneralTelemetryLogHandle_onceToken != -1)
    dispatch_once(&SLGeneralTelemetryLogHandle_onceToken, &__block_literal_global_14);
  return (id)SLGeneralTelemetryLogHandle_osLog;
}

void sub_199F07A3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location,id a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id a33)
{
  id *v33;
  id *v34;

  objc_destroyWeak(v33);
  objc_destroyWeak(v34);
  _Block_object_dispose(&a19, 8);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a26);
  objc_destroyWeak(a10);
  objc_destroyWeak(&a33);
  _Unwind_Resume(a1);
}

void sub_199F080D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_199F08738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199F089A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_11(id *a1)
{
  return objc_msgSend(*a1, "serviceClass");
}

uint64_t OUTLINED_FUNCTION_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "serviceClass");
}

void OUTLINED_FUNCTION_14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

void sub_199F0996C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_199F099C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

id getCloudSharingClass()
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
  v0 = (void *)getCloudSharingClass_softClass;
  v7 = getCloudSharingClass_softClass;
  if (!getCloudSharingClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCloudSharingClass_block_invoke;
    v3[3] = &unk_1E3794510;
    v3[4] = &v4;
    __getCloudSharingClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_199F0FFBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCloudSharingClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CloudSharingLibraryCore_frameworkLibrary)
  {
    CloudSharingLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CloudSharingLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CloudSharing");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCloudSharingClass_block_invoke_cold_1();
    free(v3);
  }
  getCloudSharingClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_199F10FF0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_199F118D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_199F121F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_199F179B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_199F18078(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Unwind_Resume(a1);
}

void sub_199F186CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_199F18D78(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Unwind_Resume(a1);
}

void sub_199F193C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_199F19A6C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Unwind_Resume(a1);
}

void sub_199F1A0BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_199F1A65C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t SLDConnectionIsEntitledForCollaborationHandshake(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForEntitlement:", CFSTR("com.apple.private.sociallayer.collaboration-handshake"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

uint64_t SLDConnectionIsEntitledForAccessibility(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForEntitlement:", CFSTR("com.apple.private.sociallayer.accessibility"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

uint64_t SLDConnectionIsEntitledForShareableContent(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForEntitlement:", CFSTR("com.apple.private.sociallayer.shareable-content"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

uint64_t CTContentSizeCategoryForSlotStyle(void *a1)
{
  unint64_t v1;
  uint64_t v2;

  v1 = objc_msgSend(a1, "preferredContentSizeCategory");
  if (v1 > 0xB)
    v2 = MEMORY[0x1E0CA8210];
  else
    v2 = qword_1E3794AB0[v1];
  return *(_QWORD *)v2;
}

id CoreGlyphsCatalog()
{
  if (CoreGlyphsCatalog_onceToken != -1)
    dispatch_once(&CoreGlyphsCatalog_onceToken, &__block_literal_global_27);
  return (id)CoreGlyphsCatalog_catalog;
}

id SLDAssetCatalog()
{
  if (SLDAssetCatalog_onceToken != -1)
    dispatch_once(&SLDAssetCatalog_onceToken, &__block_literal_global_31);
  return (id)SLDAssetCatalog_catalog;
}

CGImage *SLDCreateImageNamed(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  CGImage *v7;

  v3 = a1;
  v4 = a2;
  SLDAssetCatalog();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "imageWithName:scaleFactor:", v4, (double)objc_msgSend(v3, "displayScale"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  if (v6 && objc_msgSend(v6, "image"))
  {
    v7 = (CGImage *)objc_msgSend(v6, "image");
    CGImageRetain(v7);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id SLDContactMonogramAttributedString(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const __CTFontDescriptor *v16;
  CTFontRef v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  CGColorRef ConstantColor;
  void *v22;
  uint64_t v23;
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E3797070);
  if (objc_msgSend(v6, "length"))
  {
    v29[0] = *MEMORY[0x1E0CA83D8];
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = v5;
    objc_msgSend(v8, "numberWithDouble:", a3 * 105.0 / 225.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v10;
    v29[1] = *MEMORY[0x1E0CA8418];
    v11 = *MEMORY[0x1E0CA8450];
    v28[0] = *MEMORY[0x1E0CA8428];
    v12 = *MEMORY[0x1E0CA84E8];
    v27[0] = v11;
    v27[1] = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CA84C8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    CTContentSizeCategoryForSlotStyle(v9);
    v16 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
    v17 = CTFontCreateWithFontDescriptor(v16, 0.0, 0);
    CFRelease(v16);

    v18 = objc_alloc(MEMORY[0x1E0CB3498]);
    v19 = *MEMORY[0x1E0CA8188];
    v26[0] = v17;
    v20 = *MEMORY[0x1E0CA8550];
    v25[0] = v19;
    v25[1] = v20;
    ConstantColor = CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E0C9DA30]);
    v25[2] = *MEMORY[0x1E0CA85A0];
    v26[1] = ConstantColor;
    v26[2] = &unk_1E37A9F78;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v18, "initWithString:attributes:", v6, v22);

    v7 = (void *)v23;
  }

  return v7;
}

CGColor *SLDCreateColorNamed(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  CGColor *v13;

  v3 = a1;
  v4 = a2;
  v5 = v3;
  v6 = v4;
  SLDAssetCatalog();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_msgSend(v5, "userInterfaceStyle");
    v9 = objc_msgSend(v5, "assetDeviceIdiom");
    if (v8 == 1)
      v10 = CFSTR("UIAppearanceDark");
    else
      v10 = CFSTR("UIAppearanceLight");
    objc_msgSend(v7, "colorWithName:displayGamut:deviceIdiom:appearanceName:", v6, 0, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v12 = objc_msgSend(v5, "assetDeviceIdiom");
      if (SLDAssetCatalogGenericAppearanceName_onceToken != -1)
        dispatch_once(&SLDAssetCatalogGenericAppearanceName_onceToken, &__block_literal_global_55);
      objc_msgSend(v7, "colorWithName:displayGamut:deviceIdiom:appearanceName:", v6, 0, v12, SLDAssetCatalogGenericAppearanceName_genericName);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v11 = 0;
  }

  if (v11 && objc_msgSend(v11, "cgColor"))
  {
    v13 = (CGColor *)objc_msgSend(v11, "cgColor");
    CGColorRetain(v13);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t SLDCUINamedImageDeviceClass()
{
  if (SLDCUINamedImageDeviceClass_onceToken != -1)
    dispatch_once(&SLDCUINamedImageDeviceClass_onceToken, &__block_literal_global_38);
  return 0;
}

const __CFString *SLDAssetCatalogPreferredAppearanceName(int a1)
{
  if (a1)
    return CFSTR("UIAppearanceDark");
  else
    return CFSTR("UIAppearanceLight");
}

id SLDSystemVectorGlyph(void *a1, int a2, uint64_t a3, uint64_t a4, int a5, double a6, double a7)
{
  id v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;

  v13 = a1;
  if (SLDCUINamedImageDeviceClass_onceToken != -1)
    dispatch_once(&SLDCUINamedImageDeviceClass_onceToken, &__block_literal_global_38);
  if (a2)
    v14 = 4;
  else
    v14 = 5;
  v15 = CFSTR("UIAppearanceLight");
  if (a5)
    v15 = CFSTR("UIAppearanceDark");
  v16 = v15;
  CoreGlyphsCatalog();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "namedVectorGlyphWithName:scaleFactor:deviceIdiom:layoutDirection:glyphSize:glyphWeight:glyphPointSize:appearanceName:", v13, 0, v14, a3, a4, v16, a6, a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    CoreGlyphsCatalog();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (SLDAssetCatalogGenericAppearanceName_onceToken != -1)
      dispatch_once(&SLDAssetCatalogGenericAppearanceName_onceToken, &__block_literal_global_55);
    objc_msgSend(v19, "namedVectorGlyphWithName:scaleFactor:deviceIdiom:layoutDirection:glyphSize:glyphWeight:glyphPointSize:appearanceName:", v13, 0, v14, a3, a4, SLDAssetCatalogGenericAppearanceName_genericName, a6, a7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

double SLDVectorGlyphMinimumViableSize(void *a1, double a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v3 = a1;
  objc_msgSend(v3, "contentBoundsUnrounded");
  v5 = v4 * 0.5;
  objc_msgSend(v3, "alignmentRectUnrounded");
  v7 = v5 - fmin(v6, 0.0);
  objc_msgSend(v3, "alignmentRectUnrounded");
  v9 = v8;
  objc_msgSend(v3, "alignmentRectUnrounded");
  v11 = v9 + v10;
  objc_msgSend(v3, "contentBoundsUnrounded");
  if (v11 >= v12)
    v13 = v11;
  else
    v13 = v12;
  v14 = v13 - v5;
  if (v7 >= v14)
    v14 = v7;
  v15 = SLRoundToScale(v14 + v14, a2);
  objc_msgSend(v3, "contentBounds");

  return v15;
}

id SLDSystemVectorGlyphWithSlotStyle(void *a1, void *a2, uint64_t a3, uint64_t a4, double a5)
{
  id v9;
  id v10;
  double v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;

  v9 = a2;
  v10 = a1;
  v11 = (double)objc_msgSend(v10, "displayScale");
  v12 = objc_msgSend(v10, "layoutDirection") == 1;
  v13 = objc_msgSend(v10, "userInterfaceStyle");

  SLDSystemVectorGlyph(v9, v12, a3, a4, v13 == 1, v11, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t SLDCreateRasterizedVectorGlyph(void *a1, const char *a2, double a3, double a4, double a5)
{
  return objc_msgSend(a1, "rasterizeImageUsingScaleFactor:forTargetSize:", a5, a3, a4);
}

uint64_t SLDCreateRasterizedSystemVectorGlyph(void *a1, int a2, uint64_t a3, uint64_t a4, int a5, double a6, double a7, double a8, double a9)
{
  void *v12;
  void *v13;
  uint64_t v14;

  SLDSystemVectorGlyph(a1, a2, a3, a4, a5, a8, a9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = objc_msgSend(v12, "rasterizeImageUsingScaleFactor:forTargetSize:", a8, a6, a7);
  else
    v14 = 0;

  return v14;
}

uint64_t SLDCreateRasterizedSystemVectorGlyphWithSlotStyle(void *a1, void *a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7)
{
  id v13;
  id v14;
  double v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;

  v13 = a2;
  v14 = a1;
  v15 = (double)objc_msgSend(v14, "displayScale");
  v16 = objc_msgSend(v14, "layoutDirection") == 1;
  v17 = objc_msgSend(v14, "userInterfaceStyle");

  v18 = SLDCreateRasterizedSystemVectorGlyph(v13, v16, a3, a4, v17 == 1, a5, a6, v15, a7);
  return v18;
}

void SLDRenderTintedImageInContext(CGContext *a1, CGImage *a2, CGColor *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  CGRect v14;
  CGRect v15;
  CGRect v16;

  CGContextSaveGState(a1);
  CGContextSetAlpha(a1, 1.0);
  v14.origin.x = a4;
  v14.origin.y = a5;
  v14.size.width = a6;
  v14.size.height = a7;
  CGContextBeginTransparencyLayerWithRect(a1, v14, 0);
  v15.origin.x = a4;
  v15.origin.y = a5;
  v15.size.width = a6;
  v15.size.height = a7;
  CGContextDrawImage(a1, v15, a2);
  CGContextSetFillColorWithColor(a1, a3);
  CGContextSetBlendMode(a1, kCGBlendModeSourceIn);
  v16.origin.x = a4;
  v16.origin.y = a5;
  v16.size.width = a6;
  v16.size.height = a7;
  CGContextFillRect(a1, v16);
  CGContextEndTransparencyLayer(a1);
  CGContextRestoreGState(a1);
}

void SLDRenderContactMonogramInContextAtRect(void *a1, void *a2, CGContext *a3, int a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  id v17;
  id v18;
  unsigned int v19;
  CGColor *v20;
  CGColor *v21;
  __CFArray *Mutable;
  CGColorSpace *DeviceRGB;
  CGGradient *v24;
  CGFloat MaxX;
  void *v26;
  void *v27;
  double v28;
  const __CTLine *v29;
  double TypographicBounds;
  double MidX;
  double v32;
  double MidY;
  double v34;
  CGFloat Width;
  double v36;
  double v37;
  double v38;
  double v39;
  CGImage *v40;
  CGColor *ConstantColor;
  const __CFAttributedString *v42;
  CGFloat descent;
  CGFloat ascent;
  CGPoint v45;
  CGPoint v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v17 = a1;
  v18 = a2;
  v19 = objc_msgSend(v17, "displayScale");
  CGContextSaveGState(a3);
  if (a4)
  {
    CGContextTranslateCTM(a3, 0.0, a5);
    CGContextScaleCTM(a3, 1.0, -1.0);
  }
  CGContextBeginPath(a3);
  v47.origin.x = a6;
  v47.origin.y = a7;
  v47.size.width = a8;
  v47.size.height = a9;
  CGContextAddEllipseInRect(a3, v47);
  CGContextClip(a3);
  CGContextClosePath(a3);
  CGContextSetAlpha(a3, 0.9);
  v48.origin.x = a6;
  v48.origin.y = a7;
  v48.size.width = a8;
  v48.size.height = a9;
  CGContextFillRect(a3, v48);
  v20 = SLDCreateColorNamed(v17, CFSTR("MonogramGradientStartColor"));
  v21 = SLDCreateColorNamed(v17, CFSTR("MonogramGradientEndColor"));
  Mutable = CFArrayCreateMutable(0, 2, MEMORY[0x1E0C9B378]);
  CFArrayAppendValue(Mutable, v20);
  CFArrayAppendValue(Mutable, v21);
  CGContextSetAlpha(a3, 1.0);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v24 = CGGradientCreateWithColors(DeviceRGB, Mutable, 0);
  v49.origin.x = a6;
  v49.origin.y = a7;
  v49.size.width = a8;
  v49.size.height = a9;
  MaxX = CGRectGetMaxX(v49);
  v50.origin.x = a6;
  v50.origin.y = a7;
  v50.size.width = a8;
  v50.size.height = a9;
  v46.y = CGRectGetMaxY(v50);
  v45.x = a6;
  v45.y = a7;
  v46.x = MaxX;
  CGContextDrawLinearGradient(a3, v24, v45, v46, 0);
  if (v18
    && (objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v18, 1002),
        (v26 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v27 = v26;
    v28 = (double)v19;
    SLDContactMonogramAttributedString(v17, v26, a8);
    v42 = (const __CFAttributedString *)objc_claimAutoreleasedReturnValue();
    v29 = CTLineCreateWithAttributedString(v42);
    descent = 0.0;
    ascent = 0.0;
    TypographicBounds = CTLineGetTypographicBounds(v29, &ascent, &descent, 0);
    ascent = SLRoundToScale(ascent, v28);
    descent = SLRoundToScale(descent, v28);
    v51.origin.x = a6;
    v51.origin.y = a7;
    v51.size.width = a8;
    v51.size.height = a9;
    MidX = CGRectGetMidX(v51);
    v32 = SLRoundToScale(MidX, v28);
    v52.origin.x = a6;
    v52.origin.y = a7;
    v52.size.width = a8;
    v52.size.height = a9;
    MidY = CGRectGetMidY(v52);
    v34 = SLRoundToScale(MidY, v28);
    v53.origin.x = a6;
    v53.origin.y = a7;
    v53.size.width = a8;
    v53.size.height = a9;
    Width = CGRectGetWidth(v53);
    v36 = SLRoundToScale(Width * 0.800000012, v28) / TypographicBounds;
    if (v36 > 1.0)
      v36 = 1.0;
    v37 = SLRoundToScale(v36, v28);
    v38 = SLRoundToScale(TypographicBounds * 0.5, v28);
    v39 = SLRoundToScale((ascent - descent) * 0.5, v28);
    CGContextTranslateCTM(a3, v32, v34);
    CGContextScaleCTM(a3, v37, v37);
    CGContextSetTextPosition(a3, -v38, -v39);
    CTLineDraw(v29, a3);
    CFRelease(v29);

  }
  else
  {
    v40 = SLDCreateImageNamed(v17, CFSTR("silhouette-large"));
    ConstantColor = CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E0C9DA30]);
    SLDRenderTintedImageInContext(a3, v40, ConstantColor, a6, a7, a8, a9);
    CGImageRelease(v40);
  }
  CGColorSpaceRelease(DeviceRGB);
  CGColorRelease(v20);
  CGColorRelease(v21);
  CFRelease(Mutable);
  CGGradientRelease(v24);
  CGContextRestoreGState(a3);

}

void SLDRenderContactSilhouetteInContextAtRect(void *a1, CGContext *a2, int a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  id v15;
  CGColor *v16;
  CGColor *v17;
  __CFArray *Mutable;
  CGColorSpace *DeviceRGB;
  CGGradient *v20;
  CGFloat MaxX;
  CGImage *v22;
  CGColor *ConstantColor;
  CGPoint v24;
  CGPoint v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v15 = a1;
  CGContextSaveGState(a2);
  if (a3)
  {
    CGContextTranslateCTM(a2, 0.0, a4);
    CGContextScaleCTM(a2, 1.0, -1.0);
  }
  CGContextBeginPath(a2);
  v26.origin.x = a5;
  v26.origin.y = a6;
  v26.size.width = a7;
  v26.size.height = a8;
  CGContextAddEllipseInRect(a2, v26);
  CGContextClip(a2);
  CGContextClosePath(a2);
  CGContextSetAlpha(a2, 0.9);
  v27.origin.x = a5;
  v27.origin.y = a6;
  v27.size.width = a7;
  v27.size.height = a8;
  CGContextFillRect(a2, v27);
  v16 = SLDCreateColorNamed(v15, CFSTR("MonogramGradientStartColor"));
  v17 = SLDCreateColorNamed(v15, CFSTR("MonogramGradientEndColor"));
  Mutable = CFArrayCreateMutable(0, 2, MEMORY[0x1E0C9B378]);
  CFArrayAppendValue(Mutable, v16);
  CFArrayAppendValue(Mutable, v17);
  CGContextSetAlpha(a2, 1.0);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v20 = CGGradientCreateWithColors(DeviceRGB, Mutable, 0);
  v28.origin.x = a5;
  v28.origin.y = a6;
  v28.size.width = a7;
  v28.size.height = a8;
  MaxX = CGRectGetMaxX(v28);
  v29.origin.x = a5;
  v29.origin.y = a6;
  v29.size.width = a7;
  v29.size.height = a8;
  v25.y = CGRectGetMaxY(v29);
  v24.x = a5;
  v24.y = a6;
  v25.x = MaxX;
  CGContextDrawLinearGradient(a2, v20, v24, v25, 0);
  v22 = SLDCreateImageNamed(v15, CFSTR("silhouette-large"));

  ConstantColor = CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E0C9DA30]);
  SLDRenderTintedImageInContext(a2, v22, ConstantColor, a5, a6, a7, a8);
  CGImageRelease(v22);
  CGColorSpaceRelease(DeviceRGB);
  CGColorRelease(v16);
  CGColorRelease(v17);
  CFRelease(Mutable);
  CGGradientRelease(v20);
  CGContextRestoreGState(a2);
}

CGImageRef SLDCreateGroupPhotoImageWithGroupID(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void (*v4)(id);
  void *v5;
  void *v6;
  void *v7;
  CGImageRef v8;
  NSObject *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v16[0] = v1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v4 = (void (*)(id))getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_ptr;
    v15 = getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_ptr;
    if (!getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_ptr)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_block_invoke;
      v11[3] = &unk_1E3794510;
      v11[4] = &v12;
      __getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_block_invoke((uint64_t)v11);
      v4 = (void (*)(id))v13[3];
    }
    _Block_object_dispose(&v12, 8);
    if (!v4)
    {
      SLDCreateGroupPhotoImageWithGroupID_cold_1();
      __break(1u);
    }
    v4(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKey:", v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = SLDCreateGroupPhotoImageWithData(v6);
    }
    else
    {
      SLDaemonLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        SLDCreateGroupPhotoImageWithGroupID_cold_2(v9);

      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_199F1CC94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CGImageRef SLDCreateGroupPhotoImageWithData(void *a1)
{
  const __CFData *v1;
  const __CFData *v2;
  CGDataProvider *v3;
  CGDataProvider *v4;
  CGImageSource *v5;
  CGImageRef ImageAtIndex;
  NSObject *v7;

  v1 = a1;
  v2 = v1;
  if (!v1)
  {
LABEL_8:
    ImageAtIndex = 0;
    goto LABEL_9;
  }
  v3 = CGDataProviderCreateWithCFData(v1);
  if (!v3
    || (v4 = v3, v5 = CGImageSourceCreateWithDataProvider(v3, 0), CFRelease(v4), !v5)
    || (ImageAtIndex = CGImageSourceCreateImageAtIndex(v5, 0, 0), CFRelease(v5), !ImageAtIndex))
  {
    SLDaemonLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      SLDCreateGroupPhotoImageWithData_cold_1(v2, v7);

    goto LABEL_8;
  }
LABEL_9:

  return ImageAtIndex;
}

CFIndex SLDGetHyphenationPosition(const __CFString *a1, CFIndex a2, CFRange a3, CFLocaleRef locale)
{
  return CFStringGetHyphenationLocationBeforeIndex(a1, a2, a3, 0, locale, 0);
}

BOOL SLDAuditTokensAreEqual(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 20) == *(_DWORD *)(a2 + 20) && *(_DWORD *)(a1 + 28) == *(_DWORD *)(a2 + 28);
}

void *__getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (IMCoreLibraryCore_frameworkLibrary)
  {
    v2 = (void *)IMCoreLibraryCore_frameworkLibrary;
  }
  else
  {
    IMCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)IMCoreLibraryCore_frameworkLibrary;
    if (!IMCoreLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "IMSPIGetGroupPhotosForChatsWithGroupIDs");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_199F1FEE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199F22618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199F22AE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199F22CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199F23C3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_199F24154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199F24778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_199F24D1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_199F25710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_199F290B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_199F29360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199F29534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_199F295D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_199F29680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_199F29920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__35(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__36(uint64_t a1)
{

}

void sub_199F2A238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

_BYTE *OUTLINED_FUNCTION_4_1(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

BOOL SLHandleIsEmail(void *a1)
{
  __CFString *v1;
  _BOOL8 v2;

  v1 = a1;
  if (-[__CFString length](v1, "length"))
    v2 = CFStringFind(v1, CFSTR("@"), 0).location != -1;
  else
    v2 = 0;

  return v2;
}

uint64_t SLHandleIsPhoneNumber(void *a1)
{
  __CFString *v1;
  uint64_t v2;
  char v3;
  CFIndex Length;
  CFIndex v6;
  CFIndex i;
  UChar32 CharacterAtIndex;
  int v9;

  v1 = a1;
  v2 = -[__CFString length](v1, "length");
  v3 = 0;
  if (v1 && v2)
  {
    Length = CFStringGetLength(v1);
    if (Length < 2)
    {
LABEL_4:
      v3 = 0;
      goto LABEL_5;
    }
    v6 = Length;
    v3 = 0;
    for (i = 0; v6 != i; ++i)
    {
      CharacterAtIndex = CFStringGetCharacterAtIndex(v1, i);
      if (CharacterAtIndex <= 111)
      {
        switch(CharacterAtIndex)
        {
          case ' ':
          case '"':
          case '#':
          case '\'':
          case '(':
          case ')':
          case '*':
          case '+':
          case ',':
          case '-':
          case '.':
          case '/':
          case ':':
          case ';':
          case '?':
            goto LABEL_9;
          default:
            goto LABEL_24;
        }
      }
      if (CharacterAtIndex > 8209)
      {
        if (CharacterAtIndex > 8235)
        {
          if (CharacterAtIndex == 8236)
            goto LABEL_9;
          v9 = 8237;
        }
        else
        {
          if (CharacterAtIndex == 8210)
            goto LABEL_9;
          v9 = 8234;
        }
        if (CharacterAtIndex != v9)
          goto LABEL_24;
      }
      else if (CharacterAtIndex <= 8207)
      {
        if (CharacterAtIndex == 112)
          continue;
        if (CharacterAtIndex != 160)
        {
LABEL_24:
          if (u_charDigitValue(CharacterAtIndex) == -1)
            goto LABEL_4;
        }
      }
LABEL_9:
      v3 = 1;
    }
  }
LABEL_5:

  return v3 & 1;
}

void sub_199F2D244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_199F2DEFC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_199F2ECF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_199F2F600(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_199F30E1C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_199F31BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  uint64_t v53;

  _Block_object_dispose(&a53, 8);
  _Block_object_dispose((const void *)(v53 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_199F32928(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_199F33280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  uint64_t v45;

  _Block_object_dispose(&a45, 8);
  _Block_object_dispose((const void *)(v45 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_199F33D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

void sub_199F3500C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199F35BC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_199F35CC0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getMFMessageComposeViewControllerClass()
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
  v0 = (void *)getMFMessageComposeViewControllerClass_softClass;
  v7 = getMFMessageComposeViewControllerClass_softClass;
  if (!getMFMessageComposeViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getMFMessageComposeViewControllerClass_block_invoke;
    v3[3] = &unk_1E3794510;
    v3[4] = &v4;
    __getMFMessageComposeViewControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_199F35FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMFMessageComposeViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!MessageUILibraryCore_frameworkLibrary)
  {
    MessageUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!MessageUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("MFMessageComposeViewController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getMFMessageComposeViewControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getMFMessageComposeViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_199F37C0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_199F37D28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_199F38A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199F3962C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_199F398BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_199F39EFC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_199F3A0DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getCSCloudSharingClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CloudSharingLibraryCore_frameworkLibrary_0)
  {
    CloudSharingLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!CloudSharingLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CSCloudSharing");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCSCloudSharingClass_block_invoke_cold_1();
    free(v3);
  }
  getCSCloudSharingClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_4_2(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_199F3BAD0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void *getIMSPILastAddressedHandleForChatWithGUIDSymbolLoc()
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
  v0 = (void *)getIMSPILastAddressedHandleForChatWithGUIDSymbolLoc_ptr;
  v6 = getIMSPILastAddressedHandleForChatWithGUIDSymbolLoc_ptr;
  if (!getIMSPILastAddressedHandleForChatWithGUIDSymbolLoc_ptr)
  {
    v1 = (void *)IMCoreLibrary();
    v0 = dlsym(v1, "IMSPILastAddressedHandleForChatWithGUID");
    v4[3] = (uint64_t)v0;
    getIMSPILastAddressedHandleForChatWithGUIDSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_199F3C310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t IMCoreLibrary()
{
  uint64_t v0;
  void *v2;

  if (!IMCoreLibraryCore_frameworkLibrary_0)
    IMCoreLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  v0 = IMCoreLibraryCore_frameworkLibrary_0;
  if (!IMCoreLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *getIMSPIResetChatRegistrySymbolLoc()
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
  v0 = (void *)getIMSPIResetChatRegistrySymbolLoc_ptr;
  v6 = getIMSPIResetChatRegistrySymbolLoc_ptr;
  if (!getIMSPIResetChatRegistrySymbolLoc_ptr)
  {
    v1 = (void *)IMCoreLibrary();
    v0 = dlsym(v1, "IMSPIResetChatRegistry");
    v4[3] = (uint64_t)v0;
    getIMSPIResetChatRegistrySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_199F3C450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_199F40DD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  id *v18;
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return objc_opt_class();
}

void sub_199F429FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199F435F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_199F43778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_199F444C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_199F4453C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SLShareableContentLogHandle()
{
  if (SLShareableContentLogHandle_onceToken != -1)
    dispatch_once(&SLShareableContentLogHandle_onceToken, &__block_literal_global_7);
  return (id)SLShareableContentLogHandle_osLog;
}

void sub_199F46020(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_199F46F58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_199F47330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SLDValidateSupplementaryData(void *a1)
{
  id v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t i;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v2 = v1;
    v3 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v3)
    {
      v4 = v3;
      v13 = v1;
      v5 = *(_QWORD *)v15;
      v6 = 1;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v15 != v5)
            objc_enumerationMutation(v2);
          v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            SLDaemonLogHandle();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
              SLDValidateSupplementaryData_cold_2();

            v6 = 0;
          }
          -[NSObject objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            SLDaemonLogHandle();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
              SLDValidateSupplementaryData_cold_1();

            v6 = 0;
          }

        }
        v4 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v4);
      v1 = v13;
    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    SLDaemonLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      SLDValidateSupplementaryData_cold_3((uint64_t)v1, v2);
    v6 = 0;
  }

  return v6 & 1;
}

void sub_199F4AD94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_199F4BB1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199F4CA5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199F4D5BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_199F4E490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_199F505F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199F50CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199F517FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_199F51DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199F52148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199F522AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_15_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_fault_impl(a1, v4, OS_LOG_TYPE_FAULT, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_18(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void OUTLINED_FUNCTION_19(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, a3, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_20(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_23()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_25(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

id OUTLINED_FUNCTION_26(id a1, float a2)
{
  id *v2;
  float *v3;

  *v3 = a2;
  *v2 = a1;
  return a1;
}

void sub_199F55A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getIMCollaborationClearTransmissionClass()
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
  v0 = (void *)getIMCollaborationClearTransmissionClass_softClass;
  v7 = getIMCollaborationClearTransmissionClass_softClass;
  if (!getIMCollaborationClearTransmissionClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getIMCollaborationClearTransmissionClass_block_invoke;
    v3[3] = &unk_1E3794510;
    v3[4] = &v4;
    __getIMCollaborationClearTransmissionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_199F56434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getIMCollaborationNoticeTransmissionClass()
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
  v0 = (void *)getIMCollaborationNoticeTransmissionClass_softClass;
  v7 = getIMCollaborationNoticeTransmissionClass_softClass;
  if (!getIMCollaborationNoticeTransmissionClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getIMCollaborationNoticeTransmissionClass_block_invoke;
    v3[3] = &unk_1E3794510;
    v3[4] = &v4;
    __getIMCollaborationNoticeTransmissionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_199F565E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getIMCollaborationNoticeDispatcherClass()
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
  v0 = (void *)getIMCollaborationNoticeDispatcherClass_softClass;
  v7 = getIMCollaborationNoticeDispatcherClass_softClass;
  if (!getIMCollaborationNoticeDispatcherClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getIMCollaborationNoticeDispatcherClass_block_invoke;
    v3[3] = &unk_1E3794510;
    v3[4] = &v4;
    __getIMCollaborationNoticeDispatcherClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_199F568BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getIMCollaborationClearTransmissionClass_block_invoke(uint64_t a1)
{
  IMSharedUtilitiesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("IMCollaborationClearTransmission");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getIMCollaborationClearTransmissionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getIMCollaborationClearTransmissionClass_block_invoke_cold_1();
    IMSharedUtilitiesLibrary();
  }
}

void IMSharedUtilitiesLibrary()
{
  void *v0;

  if (!IMSharedUtilitiesLibraryCore_frameworkLibrary)
    IMSharedUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!IMSharedUtilitiesLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getIMCollaborationNoticeTransmissionClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  IMSharedUtilitiesLibrary();
  result = objc_getClass("IMCollaborationNoticeTransmission");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getIMCollaborationNoticeTransmissionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getIMCollaborationNoticeTransmissionClass_block_invoke_cold_1();
    return (Class)__getIMCollaborationNoticeDispatcherClass_block_invoke(v3);
  }
  return result;
}

Class __getIMCollaborationNoticeDispatcherClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!IMCoreLibraryCore_frameworkLibrary_1)
  {
    IMCoreLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!IMCoreLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("IMCollaborationNoticeDispatcher");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    __getIMCollaborationNoticeDispatcherClass_block_invoke_cold_1();
    free(v3);
  }
  getIMCollaborationNoticeDispatcherClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

id SLFrameworkBundle()
{
  if (SLFrameworkBundle_onceToken != -1)
    dispatch_once(&SLFrameworkBundle_onceToken, &__block_literal_global_17);
  return (id)SLFrameworkBundle_sBundle;
}

BOOL SL_CGFloatApproximatelyEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 0.00000999999975;
}

double SLRoundToScale(double a1, double a2)
{
  if (fabs(a2) < 0.00000999999975)
    a2 = 1.0;
  if (a2 == 1.0)
    return round(a1);
  else
    return round(a2 * a1) / a2;
}

double SLRectCenteredInRectToScale(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v16;
  double v17;
  BOOL v18;
  double v19;
  double result;

  v16 = a9;
  v17 = a5 + (a7 - a3) * 0.5;
  if (fabs(a9) < 0.00000999999975)
    v16 = 1.0;
  v18 = v16 == 1.0;
  v19 = round(v16 * v17) / v16;
  result = round(v17);
  if (!v18)
    return v19;
  return result;
}

id SLDisplayNameWithPhoneNumberOrEmailForContact(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "phoneNumbers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(v3, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "value");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      IMFormattedDisplayStringForNumber();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v2, "emailAddresses");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        objc_msgSend(v6, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        IMFormattedDisplayStringForNumber();
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = 0;
      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id SLFormattedDisplayNameForPerson(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  int IsEmail;
  void *v8;

  v1 = a1;
  objc_msgSend(v1, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v1, "contact");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    SLDisplayNameWithPhoneNumberOrEmailForContact(v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v1, "handle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x19AEC452C]();

    objc_msgSend(v1, "handle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      IsEmail = IMStringIsEmail();

      if (!IsEmail)
      {
        v8 = 0;
        goto LABEL_8;
      }
      objc_msgSend(v1, "handle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    IMFormattedDisplayStringForNumber();
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v4;

LABEL_8:
  return v8;
}

void SLSendPortraitFeedbackTypeAppButtonForAttribution(void *a1)
{
  id v1;
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v1 = a1;
  if (v1)
  {
    SLApplicationIdentifierForPortraitFeedback();
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v4 = (void *)objc_opt_new();
      objc_msgSend(v1, "uniqueIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *MEMORY[0x1E0D70F10];
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __SLSendPortraitFeedbackTypeAppButtonForAttribution_block_invoke;
      v7[3] = &unk_1E3795E80;
      v8 = v1;
      objc_msgSend(v4, "feedbackForAttributionIdentifier:type:client:variant:completion:", v5, 0, v3, v6, v7);

    }
    else
    {
      SLFrameworkLogHandle();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        SLSendPortraitFeedbackTypeAppButtonForAttribution_cold_2();
    }
  }
  else
  {
    SLFrameworkLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      SLSendPortraitFeedbackTypeAppButtonForAttribution_cold_1();
  }

}

id SLApplicationIdentifierForPortraitFeedback()
{
  void *v0;
  void *v1;
  void *v2;
  NSObject *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "applicationIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    SLFrameworkLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_INFO, "SLApplicationIdentifierForPortraitFeedback: identifier is '%@'", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    SLFrameworkLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      SLApplicationIdentifierForPortraitFeedback_cold_1();
    v2 = 0;
  }

  return v2;
}

void SLSendPortraitFeedbackTypeDisplayedHighlight(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v1 = a1;
  v2 = v1;
  if (v1 && (objc_msgSend(v1, "identifier"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    SLApplicationIdentifierForPortraitFeedback();
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      v6 = (void *)objc_opt_new();
      objc_msgSend(v2, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *MEMORY[0x1E0D70F10];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __SLSendPortraitFeedbackTypeDisplayedHighlight_block_invoke;
      v9[3] = &unk_1E3795E80;
      v10 = v2;
      objc_msgSend(v6, "feedbackForHighlightIdentifier:type:client:variant:completion:", v7, 0, v5, v8, v9);

    }
    else
    {
      SLFrameworkLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        SLSendPortraitFeedbackTypeDisplayedHighlight_cold_2();
    }
  }
  else
  {
    SLFrameworkLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      SLSendPortraitFeedbackTypeDisplayedHighlight_cold_1();
  }

}

void SLSendPortraitFeedbackTypeUserInteractedWithHighlight(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v1 = a1;
  v2 = v1;
  if (v1 && (objc_msgSend(v1, "identifier"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    SLApplicationIdentifierForPortraitFeedback();
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      v6 = (void *)objc_opt_new();
      objc_msgSend(v2, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *MEMORY[0x1E0D70F10];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __SLSendPortraitFeedbackTypeUserInteractedWithHighlight_block_invoke;
      v9[3] = &unk_1E3795E80;
      v10 = v2;
      objc_msgSend(v6, "feedbackForHighlightIdentifier:type:client:variant:completion:", v7, 1, v5, v8, v9);

    }
    else
    {
      SLFrameworkLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        SLSendPortraitFeedbackTypeUserInteractedWithHighlight_cold_2();
    }
  }
  else
  {
    SLFrameworkLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      SLSendPortraitFeedbackTypeUserInteractedWithHighlight_cold_1();
  }

}

uint64_t SLPersonIsEqualToPerson(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "handle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v9 = objc_msgSend(v5, "isEqual:", v6);
    else
      v9 = 0;
  }

  return v9;
}

uint64_t SLAppHasPublicEntitlement()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v0, "entitlements");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKey:ofClass:", CFSTR("com.apple.developer.shared-with-you"), objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = objc_msgSend(v2, "BOOLValue");
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t SLPersonArrayisEqualToArray(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t IsEqualToPerson;

  v3 = a1;
  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (v5 = objc_msgSend(v4, "count"), v5 != objc_msgSend(v3, "count")))
  {
LABEL_12:
    IsEqualToPerson = 0;
    goto LABEL_13;
  }
  if (objc_msgSend(v3, "count"))
  {
    v6 = 0;
    while (1)
    {
      objc_msgSend(v3, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      IsEqualToPerson = SLPersonIsEqualToPerson(v7, v8);

      if ((IsEqualToPerson & 1) != 0 && ++v6 < (unint64_t)objc_msgSend(v3, "count"))
        continue;
      goto LABEL_13;
    }

    goto LABEL_12;
  }
  IsEqualToPerson = 1;
LABEL_13:

  return IsEqualToPerson;
}

uint64_t SLPersonArrayContainsPerson(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((SLPersonIsEqualToPerson(*(void **)(*((_QWORD *)&v10 + 1) + 8 * i), v4) & 1) != 0)
        {
          v6 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

id SLURLMinusFragmentForCKURLs(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "absoluteString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsString:", CFSTR("https://www.icloud.com/"));

    v5 = v2;
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("https://www.icloud.com/notes"), CFSTR("https://www.icloud.com/reminders"), CFSTR("https://www.icloud.com/freeform"), CFSTR("https://www.icloud.com/keynote"), CFSTR("https://www.icloud.com/pages"), CFSTR("https://www.icloud.com/numbers"), CFSTR("https://www.icloud.com/share"), CFSTR("https://www.icloud.com/iclouddrive"), CFSTR("https://www.icloud.com/safari-tab-groups"), 0);
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v18 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
            objc_msgSend(v2, "absoluteString");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v11) = objc_msgSend(v12, "containsString:", v11);

            if ((v11 & 1) != 0)
            {

              objc_msgSend(v2, "absoluteString");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("#"));
              v6 = (id)objc_claimAutoreleasedReturnValue();
              v14 = (void *)MEMORY[0x1E0C99E98];
              objc_msgSend(v6, "firstObject");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "URLWithString:", v15);
              v5 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_14;
            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v8)
            continue;
          break;
        }
      }
      v13 = v6;
      v5 = v2;
LABEL_14:

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id getCKPostSharingContextClass()
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
  v0 = (void *)getCKPostSharingContextClass_softClass;
  v7 = getCKPostSharingContextClass_softClass;
  if (!getCKPostSharingContextClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCKPostSharingContextClass_block_invoke;
    v3[3] = &unk_1E3794510;
    v3[4] = &v4;
    __getCKPostSharingContextClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_199F5D26C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCKContainerSetupInfoClass()
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
  v0 = (void *)getCKContainerSetupInfoClass_softClass;
  v7 = getCKContainerSetupInfoClass_softClass;
  if (!getCKContainerSetupInfoClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCKContainerSetupInfoClass_block_invoke;
    v3[3] = &unk_1E3794510;
    v3[4] = &v4;
    __getCKContainerSetupInfoClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_199F5D490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCKPostSharingContextClass_block_invoke(uint64_t a1)
{
  CloudKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CKPostSharingContext");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCKPostSharingContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCKPostSharingContextClass_block_invoke_cold_1();
    CloudKitLibrary();
  }
}

void CloudKitLibrary()
{
  void *v0;

  if (!CloudKitLibraryCore_frameworkLibrary)
    CloudKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CloudKitLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getCKContainerSetupInfoClass_block_invoke(uint64_t a1)
{
  Class result;
  int v3;
  int v4;
  os_log_t v5;

  CloudKitLibrary();
  result = objc_getClass("CKContainerSetupInfo");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCKContainerSetupInfoClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getCKContainerSetupInfoClass_block_invoke_cold_1();
    return (Class)OUTLINED_FUNCTION_3_4(v3, v4, v5);
  }
  return result;
}

void OUTLINED_FUNCTION_3_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_5_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_199F5F920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCKContainerSetupInfoClass_0()
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
  v0 = (void *)getCKContainerSetupInfoClass_softClass_0;
  v7 = getCKContainerSetupInfoClass_softClass_0;
  if (!getCKContainerSetupInfoClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCKContainerSetupInfoClass_block_invoke_0;
    v3[3] = &unk_1E3794510;
    v3[4] = &v4;
    __getCKContainerSetupInfoClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_199F61AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKContainerSetupInfoClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CloudKitLibraryCore_frameworkLibrary_0)
  {
    CloudKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!CloudKitLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CKContainerSetupInfo");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCKContainerSetupInfoClass_block_invoke_cold_1();
    free(v3);
  }
  getCKContainerSetupInfoClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_199F6246C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  uint64_t v28;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t getIMSPIRemoveMessageGUIDFromSyndicationSymbolLoc()
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
  v0 = getIMSPIRemoveMessageGUIDFromSyndicationSymbolLoc_ptr;
  v6 = getIMSPIRemoveMessageGUIDFromSyndicationSymbolLoc_ptr;
  if (!getIMSPIRemoveMessageGUIDFromSyndicationSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getIMSPIRemoveMessageGUIDFromSyndicationSymbolLoc_block_invoke;
    v2[3] = &unk_1E3794510;
    v2[4] = &v3;
    __getIMSPIRemoveMessageGUIDFromSyndicationSymbolLoc_block_invoke((uint64_t)v2);
    v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_199F62A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getIMSPIRemoveMessageGUIDFromSyndicationSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (IMCoreLibraryCore_frameworkLibrary_2)
  {
    v2 = (void *)IMCoreLibraryCore_frameworkLibrary_2;
  }
  else
  {
    IMCoreLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    v2 = (void *)IMCoreLibraryCore_frameworkLibrary_2;
    if (!IMCoreLibraryCore_frameworkLibrary_2)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "IMSPIRemoveMessageGUIDFromSyndication");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getIMSPIRemoveMessageGUIDFromSyndicationSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_199F62CF4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_199F63300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_199F6396C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_199F63B7C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_199F63C94(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_199F64244(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_199F6448C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_199F651EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKContainerSetupInfoClass_block_invoke_1(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CloudKitLibraryCore_frameworkLibrary_1)
  {
    CloudKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!CloudKitLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CKContainerSetupInfo");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCKContainerSetupInfoClass_block_invoke_cold_1();
    free(v3);
  }
  getCKContainerSetupInfoClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t static SecKeyRef.SecKeyConversionErrors.== infix(_:_:)()
{
  return 1;
}

void SecKeyRef.SecKeyConversionErrors.hash(into:)()
{
  Hasher._combine(_:)(0);
}

Swift::Int SecKeyRef.SecKeyConversionErrors.hashValue.getter()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance SecKeyRef.SecKeyConversionErrors()
{
  return 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SecKeyRef.SecKeyConversionErrors()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance SecKeyRef.SecKeyConversionErrors()
{
  Hasher._combine(_:)(0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SecKeyRef.SecKeyConversionErrors()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void SecKeyRef.p256PublicKey.getter()
{
  __SecKey *v0;
  CFDataRef v1;
  CFDataRef v2;
  uint64_t v3;
  uint64_t v4;
  __SecKey *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  __SecKey *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13[2];
  uint64_t v14;

  v1 = SecKeyCopyExternalRepresentation(v0, 0);
  if (v1)
  {
    v2 = v1;
    v13[0] = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v13[1] = v3;
    P256.Signing.PublicKey.init<A>(x963Representation:)();

  }
  else
  {
    if (one-time initialization token for default != -1)
      swift_once();
    v4 = type metadata accessor for Logger();
    __swift_project_value_buffer(v4, (uint64_t)static Log.default);
    v5 = v0;
    v6 = Logger.logObject.getter();
    v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      v13[0] = v9;
      *(_DWORD *)v8 = 136315138;
      v14 = (uint64_t)v5;
      type metadata accessor for SecKeyRef(0);
      v10 = v5;
      v11 = String.init<A>(reflecting:)();
      v14 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v11, v12, v13);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_199EFF000, v6, v7, "Failed to create external representation of current SecKey %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x19AEC4EBC](v9, -1, -1);
      MEMORY[0x19AEC4EBC](v8, -1, -1);

    }
    else
    {

    }
    lazy protocol witness table accessor for type SecKeyRef.SecKeyConversionErrors and conformance SecKeyRef.SecKeyConversionErrors();
    swift_allocError();
    swift_willThrow();
  }
}

SecKeyRef P256.Signing.PublicKey.secKey.getter()
{
  uint64_t inited;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  const __CFData *isa;
  const __CFDictionary *v13;
  SecKeyRef v14;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_199FA7840;
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 40) = v1;
  v2 = (void *)*MEMORY[0x1E0CD6A50];
  type metadata accessor for CFStringRef(0);
  v4 = v3;
  *(_QWORD *)(inited + 72) = v3;
  *(_QWORD *)(inited + 48) = v2;
  *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 88) = v5;
  v6 = (void *)*MEMORY[0x1E0CD6A10];
  *(_QWORD *)(inited + 120) = v4;
  *(_QWORD *)(inited + 96) = v6;
  v7 = v2;
  v8 = v6;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  v9 = MEMORY[0x19AEC3A88]();
  v11 = v10;
  isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v9, v11);
  v13 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v14 = SecKeyCreateWithData(isa, v13, 0);

  return v14;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
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
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Any>);
  v2 = static _DictionaryStorage.allocate(capacity:)();
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
    outlined init with copy of (NSAttributedStringKey, Any)(v6, (uint64_t)&v15, &demangling cache variable for type metadata for (String, Any));
    v7 = v15;
    v8 = v16;
    result = specialized __RawDictionaryStorage.find<A>(_:)(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)outlined init with take of Any(&v17, (_OWORD *)(v3[7] + 32 * result));
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

{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef?, Any>);
  v2 = static _DictionaryStorage.allocate(capacity:)();
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
    outlined init with copy of (NSAttributedStringKey, Any)(v6, (uint64_t)&v13, &demangling cache variable for type metadata for (CFStringRef?, Any));
    v7 = v13;
    result = specialized __RawDictionaryStorage.find<A>(_:)(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)outlined init with take of Any(&v14, (_OWORD *)(v3[7] + 32 * result));
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

{
  return specialized Dictionary.init(dictionaryLiteral:)(a1, &demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, [CFStringRef? : Any]>);
}

{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef?, CFStringRef>);
  v2 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 40);
  while (1)
  {
    v5 = *(v4 - 1);
    v6 = *v4;
    v7 = v5;
    v8 = v6;
    result = specialized __RawDictionaryStorage.find<A>(_:)(v5);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = 8 * result;
    *(_QWORD *)(v2[6] + v11) = v5;
    *(_QWORD *)(v2[7] + v11) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 2;
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

{
  return specialized Dictionary.init(dictionaryLiteral:)(a1, &demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, [CFStringRef? : CFStringRef]>);
}

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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<NSAttributedStringKey, Any>);
  v2 = static _DictionaryStorage.allocate(capacity:)();
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
    outlined init with copy of (NSAttributedStringKey, Any)(v6, (uint64_t)&v13, &demangling cache variable for type metadata for (NSAttributedStringKey, Any));
    v7 = v13;
    result = specialized __RawDictionaryStorage.find<A>(_:)(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)outlined init with take of Any(&v14, (_OWORD *)(v3[7] + 32 * result));
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

{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, Int>);
  v2 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = (id)*(v4 - 1);
    result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v2[6] + v9) = v6;
    *(_QWORD *)(v2[7] + v9) = v5;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v4 += 2;
    v2[2] = v12;
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

{
  return specialized Dictionary.init(dictionaryLiteral:)(a1, &demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, [CFStringRef : Int]>);
}

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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, SWPersonIdentity>);
  v2 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)();
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
    result = specialized __RawDictionaryStorage.find<A>(_:)(v5, v6);
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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, Any>);
  v2 = static _DictionaryStorage.allocate(capacity:)();
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
    outlined init with copy of (NSAttributedStringKey, Any)(v6, (uint64_t)&v13, &demangling cache variable for type metadata for (CFStringRef, Any));
    v7 = v13;
    result = specialized __RawDictionaryStorage.find<A>(_:)(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)outlined init with take of Any(&v14, (_OWORD *)(v3[7] + 32 * result));
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

{
  return specialized Dictionary.init(dictionaryLiteral:)(a1, &demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, [CFStringRef : Any]>);
}

{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, CGFloat>);
  v2 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = (id)*(v4 - 1);
    result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v2[6] + v9) = v6;
    *(_QWORD *)(v2[7] + v9) = v5;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v2[2] = v12;
    v4 += 2;
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

{
  return specialized Dictionary.init(dictionaryLiteral:)(a1, &demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, [CFStringRef : CGFloat]>);
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  id v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)();
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  v5 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v6 = *v5;
    v7 = (id)*(v5 - 1);
    swift_bridgeObjectRetain();
    result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v7);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = 8 * result;
    *(_QWORD *)(v3[6] + v10) = v7;
    *(_QWORD *)(v3[7] + v10) = v6;
    v11 = v3[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v3[2] = v13;
    v5 += 2;
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

uint64_t P256.Signing.PublicKey.secKeyData.getter()
{
  __SecKey *v0;
  __SecKey *v1;
  CFDataRef v2;
  CFDataRef v3;
  CFErrorRef error[2];

  error[1] = *(CFErrorRef *)MEMORY[0x1E0C80C00];
  v0 = P256.Signing.PublicKey.secKey.getter();
  if (v0)
  {
    v1 = v0;
    error[0] = 0;
    v2 = SecKeyCopyExternalRepresentation(v0, error);
    if (v2)
    {
      v3 = v2;
      static Data._conditionallyBridgeFromObjectiveC(_:result:)();

    }
    if (error[0])

  }
  return 0;
}

id default argument 2 of KeyQueryController.init(service:targetQueue:queryController:)@<X0>(_QWORD *a1@<X8>)
{
  id result;
  id v3;

  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (result)
  {
    v3 = result;
    result = (id)type metadata accessor for IDSIDQueryController();
    a1[3] = result;
    a1[4] = &protocol witness table for IDSIDQueryController;
    *a1 = v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t lazy protocol witness table accessor for type SecKeyRef.SecKeyConversionErrors and conformance SecKeyRef.SecKeyConversionErrors()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SecKeyRef.SecKeyConversionErrors and conformance SecKeyRef.SecKeyConversionErrors;
  if (!lazy protocol witness table cache variable for type SecKeyRef.SecKeyConversionErrors and conformance SecKeyRef.SecKeyConversionErrors)
  {
    result = MEMORY[0x19AEC4E20](&protocol conformance descriptor for SecKeyRef.SecKeyConversionErrors, &type metadata for SecKeyRef.SecKeyConversionErrors);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SecKeyRef.SecKeyConversionErrors and conformance SecKeyRef.SecKeyConversionErrors);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SecKeyRef.SecKeyConversionErrors and conformance SecKeyRef.SecKeyConversionErrors;
  if (!lazy protocol witness table cache variable for type SecKeyRef.SecKeyConversionErrors and conformance SecKeyRef.SecKeyConversionErrors)
  {
    result = MEMORY[0x19AEC4E20](&protocol conformance descriptor for SecKeyRef.SecKeyConversionErrors, &type metadata for SecKeyRef.SecKeyConversionErrors);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SecKeyRef.SecKeyConversionErrors and conformance SecKeyRef.SecKeyConversionErrors);
  }
  return result;
}

uint64_t default argument 2 of PersonIdentityGenerator.paddedPublicKeys(for:using:alignment:)()
{
  return 32;
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NSAttributedStringKey(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NSAttributedStringKey(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance NSAttributedStringKey(uint64_t a1, id *a2)
{
  uint64_t result;

  result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance NSAttributedStringKey(uint64_t a1, id *a2)
{
  char v3;

  v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance NSAttributedStringKey@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = MEMORY[0x19AEC3B6C](v2);
  result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance NSAttributedStringKey(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NSAttributedStringKey(a1, a2, MEMORY[0x1E0DEA950]);
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NSAttributedStringKey(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NSAttributedStringKey()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance NSAttributedStringKey()
{
  Swift::Int v0;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance CFStringRef(uint64_t a1)
{
  MEMORY[0x19AEC4E20](&protocol conformance descriptor for CFStringRef, a1);
  return _CFObject.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance CFStringRef()
{
  MEMORY[0x19AEC4E20](&protocol conformance descriptor for CFStringRef);
  return _CFObject.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CFStringRef(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  MEMORY[0x19AEC4E20](&protocol conformance descriptor for CFStringRef, a2);
  _CFObject.hash(into:)();
  return Hasher._finalize()();
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance SLCollaborationAttributionViewMetricVariant@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance UIContentSizeCategory()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3)
    v5 = 1;
  else
    v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance CFStringRef(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x19AEC4E20](&protocol conformance descriptor for CFStringRef, a3);
  return static _CFObject.== infix(_:_:)();
}

void protocol witness for RawRepresentable.rawValue.getter in conformance IDSIDStatus(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance NSAttributedStringKey@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = MEMORY[0x19AEC3B6C](*a1, a1[1]);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance NSAttributedStringKey@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance NSAttributedStringKey()
{
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
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
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = _StringGuts._allocateForDeconstruct()(a5, a6);
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
  v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
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
      v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = _StringGuts.copyUTF8(into:)();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      v2 = String.UTF8View._foreignCount()();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
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
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void type metadata accessor for SecKeyRef(uint64_t a1)
{
  type metadata accessor for SecKeyRef(a1, &lazy cache variable for type metadata for SecKeyRef);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x19AEC4E08]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void type metadata accessor for CFStringRef(uint64_t a1)
{
  type metadata accessor for SecKeyRef(a1, &lazy cache variable for type metadata for CFStringRef);
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
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

unint64_t type metadata accessor for IDSIDQueryController()
{
  unint64_t result;

  result = lazy cache variable for type metadata for IDSIDQueryController;
  if (!lazy cache variable for type metadata for IDSIDQueryController)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for IDSIDQueryController);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SecKeyRef.SecKeyConversionErrors(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for SecKeyRef.SecKeyConversionErrors(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_199F678B4 + 4 * byte_199FA7860[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_199F678D4 + 4 * byte_199FA7865[v4]))();
}

_BYTE *sub_199F678B4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_199F678D4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_199F678DC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_199F678E4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_199F678EC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_199F678F4(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t getEnumTag for SecKeyRef.SecKeyConversionErrors()
{
  return 0;
}

ValueMetadata *type metadata accessor for SecKeyRef.SecKeyConversionErrors()
{
  return &type metadata for SecKeyRef.SecKeyConversionErrors;
}

void type metadata accessor for SLHighlightPillMetricVariant(uint64_t a1)
{
  type metadata accessor for SecKeyRef(a1, &lazy cache variable for type metadata for SLHighlightPillMetricVariant);
}

void type metadata accessor for CFNumberRef(uint64_t a1)
{
  type metadata accessor for SecKeyRef(a1, &lazy cache variable for type metadata for CFNumberRef);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for _NSRange(uint64_t a1)
{
  type metadata accessor for SecKeyRef(a1, &lazy cache variable for type metadata for _NSRange);
}

void type metadata accessor for SLCollaborationAttributionViewMetricVariant(uint64_t a1)
{
  type metadata accessor for SecKeyRef(a1, &lazy cache variable for type metadata for SLCollaborationAttributionViewMetricVariant);
}

void type metadata accessor for SLHighlightDisambiguationPillMetricVariant(uint64_t a1)
{
  type metadata accessor for SecKeyRef(a1, &lazy cache variable for type metadata for SLHighlightDisambiguationPillMetricVariant);
}

uint64_t base witness table accessor for Hashable in CFStringRef()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t (*)(uint64_t))type metadata accessor for CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
}

uint64_t base witness table accessor for Equatable in CFStringRef()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t (*)(uint64_t))type metadata accessor for CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
}

uint64_t lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x19AEC4E20](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t outlined init with copy of (NSAttributedStringKey, Any)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
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

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void type metadata accessor for CGColorRef(uint64_t a1)
{
  type metadata accessor for SecKeyRef(a1, &lazy cache variable for type metadata for CGColorRef);
}

void type metadata accessor for CTFontRef(uint64_t a1)
{
  type metadata accessor for SecKeyRef(a1, &lazy cache variable for type metadata for CTFontRef);
}

void type metadata accessor for NSAttributedStringKey(uint64_t a1)
{
  type metadata accessor for SecKeyRef(a1, &lazy cache variable for type metadata for NSAttributedStringKey);
}

void type metadata accessor for CTLineRef(uint64_t a1)
{
  type metadata accessor for SecKeyRef(a1, &lazy cache variable for type metadata for CTLineRef);
}

uint64_t getEnumTagSinglePayload for CGSize(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CGSize(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  type metadata accessor for SecKeyRef(a1, &lazy cache variable for type metadata for CGSize);
}

uint64_t initializeBufferWithCopyOfBuffer for NSEdgeInsets(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for NSEdgeInsets(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for NSEdgeInsets(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for NSEdgeInsets(uint64_t a1)
{
  type metadata accessor for SecKeyRef(a1, &lazy cache variable for type metadata for NSEdgeInsets);
}

void type metadata accessor for SecKeyRef(uint64_t a1, unint64_t *a2)
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

uint64_t base witness table accessor for RawRepresentable in NSAttributedStringKey()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in NSAttributedStringKey()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
}

uint64_t base witness table accessor for Equatable in NSAttributedStringKey()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
}

void ConversationAttributionView.attribution.getter()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  id v3;
  unint64_t v4;
  id v5;
  uint64_t v6;

  v1 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
  if (!v1)
    goto LABEL_12;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_attributions);

  type metadata accessor for SLAttribution();
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v4 >> 62))
  {
    if (*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_4;
LABEL_9:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  v6 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v6)
    goto LABEL_9;
LABEL_4:
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_10:
    MEMORY[0x19AEC3E78](0, v4);
    goto LABEL_7;
  }
  if (*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v5 = *(id *)(v4 + 32);
LABEL_7:
    swift_bridgeObjectRelease();
    return;
  }
  __break(1u);
LABEL_12:
  __break(1u);
}

unint64_t type metadata accessor for SLAttribution()
{
  unint64_t result;

  result = lazy cache variable for type metadata for SLAttribution;
  if (!lazy cache variable for type metadata for SLAttribution)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for SLAttribution);
  }
  return result;
}

void ConversationAttributionView.__allocating_init(variant:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

id ConversationAttributionView.__allocating_init(highlight:variant:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = specialized CollaborationAttributionView.init(highlight:variant:)(a1, 2);

  return v4;
}

id ConversationAttributionView.__allocating_init(attribution:maxWidth:)(void *a1, double a2)
{
  objc_class *v2;
  id v5;
  id v6;
  id v7;

  v5 = objc_allocWithZone(v2);
  v6 = objc_msgSend(objc_allocWithZone((Class)SLCollaborationHighlight), sel_initWithAttribution_, a1);
  v7 = specialized CollaborationAttributionView.init(highlight:variant:)(v6, 2);
  objc_msgSend(v7, sel_setMaxWidth_, a2);

  return v7;
}

id ConversationAttributionView.init(attribution:maxWidth:)(void *a1, double a2)
{
  id v4;
  id v5;

  v4 = objc_msgSend(objc_allocWithZone((Class)SLCollaborationHighlight), sel_initWithAttribution_, a1);
  v5 = specialized CollaborationAttributionView.init(highlight:variant:)(v4, 2);
  objc_msgSend(v5, sel_setMaxWidth_, a2);

  return v5;
}

id ConversationAttributionView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

uint64_t ConversationAttributionView.init(coder:)(void *a1)
{

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

id ConversationAttributionView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConversationAttributionView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ConversationAttributionView()
{
  return objc_opt_self();
}

uint64_t method lookup function for ConversationAttributionView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ConversationAttributionView.attribution.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of ConversationAttributionView.__allocating_init(attribution:maxWidth:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 352))();
}

void specialized GenericPasswordConvertible.description.getter()
{
  type metadata accessor for SymmetricKey();
  lazy protocol witness table accessor for type SymmetricKey and conformance SymmetricKey(&lazy protocol witness table cache variable for type SymmetricKey and conformance SymmetricKey, MEMORY[0x1E0CA9398]);
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
  __asm { BR              X10 }
}

unint64_t sub_199F68218()
{
  unint64_t v0;
  uint64_t v1;
  Swift::String v2;
  Swift::String v3;

  _StringGuts.grow(_:)(37);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 0x2E736574796220;
  v3._object = (void *)0xE700000000000000;
  String.append(_:)(v3);
  outlined consume of Data._Representation(v1, v0);
  return 0xD00000000000001CLL;
}

void GenericPasswordConvertible.description.getter(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(a2 + 24))();
  __asm { BR              X10 }
}

unint64_t sub_199F6854C()
{
  unint64_t v0;
  uint64_t v1;
  Swift::String v2;
  Swift::String v3;

  _StringGuts.grow(_:)(37);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 0x2E736574796220;
  v3._object = (void *)0xE700000000000000;
  String.append(_:)(v3);
  outlined consume of Data._Representation(v1, v0);
  return 0xD00000000000001CLL;
}

uint64_t outlined copy of Data._Representation(uint64_t a1, unint64_t a2)
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

uint64_t SymmetricKey.init<A>(rawRepresentation:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  SymmetricKey.init<A>(data:)();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
}

uint64_t SymmetricKey.rawRepresentation.getter()
{
  uint64_t v1;

  type metadata accessor for SymmetricKey();
  lazy protocol witness table accessor for type SymmetricKey and conformance SymmetricKey(&lazy protocol witness table cache variable for type SymmetricKey and conformance SymmetricKey, MEMORY[0x1E0CA9398]);
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
  return v1;
}

uint64_t ContiguousBytes.dataRepresentation.getter()
{
  uint64_t v1;

  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
  return v1;
}

uint64_t protocol witness for GenericPasswordConvertible.init<A>(rawRepresentation:) in conformance SymmetricKey(uint64_t a1, uint64_t a2)
{
  return SymmetricKey.init<A>(rawRepresentation:)(a1, a2);
}

uint64_t protocol witness for GenericPasswordConvertible.rawRepresentation.getter in conformance SymmetricKey()
{
  uint64_t v1;

  lazy protocol witness table accessor for type SymmetricKey and conformance SymmetricKey(&lazy protocol witness table cache variable for type SymmetricKey and conformance SymmetricKey, MEMORY[0x1E0CA9398]);
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
  return v1;
}

void closure #1 in ContiguousBytes.dataRepresentation.getter(UInt8 *bytes@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  CFIndex v4;
  CFDataRef v5;
  CFDataRef v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  if (bytes)
    v4 = a2 - (_QWORD)bytes;
  else
    v4 = 0;
  v5 = CFDataCreateWithBytesNoCopy(0, bytes, v4, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  if (v5)
  {
    v6 = v5;
    v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v9 = v8;

  }
  else
  {
    v7 = 0;
    v9 = 0xC000000000000000;
  }
  *a3 = v7;
  a3[1] = v9;
}

uint64_t instantiation function for generic protocol witness table for SymmetricKey(uint64_t a1)
{
  uint64_t result;

  result = lazy protocol witness table accessor for type SymmetricKey and conformance SymmetricKey(&lazy protocol witness table cache variable for type SymmetricKey and conformance SymmetricKey, (uint64_t)&protocol conformance descriptor for SymmetricKey);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t lazy protocol witness table accessor for type SymmetricKey and conformance SymmetricKey(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for SymmetricKey();
    result = MEMORY[0x19AEC4E20](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t dispatch thunk of GenericPasswordConvertible.init<A>(rawRepresentation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of GenericPasswordConvertible.rawRepresentation.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

void specialized HighlightDisambiguationPillMetricVariant.heightOfTallestItem.getter(void *a1, id a2)
{
  unint64_t v3;
  id v4;
  void *v5;
  id v6;
  const __CTFont *v7;
  const __CTFont *v8;
  const __CTFont *v9;
  const __CTFont *v10;
  const __CTFont *v11;
  const __CTFont *v12;
  const __CTFont *v13;
  const __CTFont *v14;
  const __CTFont *v15;
  const __CTFont *v16;
  const __CTFont *v17;
  const __CTFont *v18;

  if ((objc_msgSend(a2, sel_isGroupConversation) & 1) != 0)
  {
    if (objc_msgSend(a1, sel_layoutDirection) == (id)1)
      v3 = 0xEC0000007466656CLL;
    else
      v3 = 0xED00007468676972;
    v4 = a1;
    v5 = (void *)MEMORY[0x19AEC3B6C](0x2E6E6F7276656863, v3);
    swift_bridgeObjectRelease();
    v6 = SLDSystemVectorGlyphWithSlotStyle(v4, v5, 1, 4, 10.0);

    objc_msgSend(v6, sel_contentBounds);
    v7 = (const __CTFont *)MEMORY[0x1E0CA84B0];
    v8 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(MEMORY[0x1E0CA84B0], 17.0);
    CTFontGetAscent(v8);

    v9 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(v7, 17.0);
    CTFontGetDescent(v9);

    v10 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(v7, 17.0);
    CTFontGetLeading(v10);

    v11 = (const __CTFont *)MEMORY[0x1E0CA84D0];
    v12 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(MEMORY[0x1E0CA84D0], 15.0);
    CTFontGetAscent(v12);

    v13 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(v11, 15.0);
    CTFontGetDescent(v13);

    v14 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(v11, 15.0);
    CTFontGetLeading(v14);

  }
  else
  {
    v15 = (const __CTFont *)MEMORY[0x1E0CA84B0];
    v16 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(MEMORY[0x1E0CA84B0], 17.0);
    CTFontGetAscent(v16);

    v17 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(v15, 17.0);
    CTFontGetDescent(v17);

    v18 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(v15, 17.0);
    CTFontGetLeading(v18);

  }
}

{
  unint64_t v3;
  id v4;
  void *v5;
  id v6;
  const __CTFont *v7;
  const __CTFont *v8;
  const __CTFont *v9;
  const __CTFont *v10;
  const __CTFont *v11;
  const __CTFont *v12;
  const __CTFont *v13;
  const __CTFont *v14;
  const __CTFont *v15;

  if ((objc_msgSend(a2, sel_isGroupConversation) & 1) != 0)
  {
    if (objc_msgSend(a1, sel_layoutDirection) == (id)1)
      v3 = 0xEC0000007466656CLL;
    else
      v3 = 0xED00007468676972;
    v4 = a1;
    v5 = (void *)MEMORY[0x19AEC3B6C](0x2E6E6F7276656863, v3);
    swift_bridgeObjectRelease();
    v6 = SLDSystemVectorGlyphWithSlotStyle(v4, v5, 1, 4, 10.0);

    objc_msgSend(v6, sel_contentBounds);
    v7 = specialized VisionDisambiguationPillMetric.firstLineFont.getter((CTFontRef)v4);
    CTFontGetAscent(v7);

    v8 = specialized VisionDisambiguationPillMetric.firstLineFont.getter((CTFontRef)v4);
    CTFontGetDescent(v8);

    v9 = specialized VisionDisambiguationPillMetric.firstLineFont.getter((CTFontRef)v4);
    CTFontGetLeading(v9);

    v10 = specialized VisionDisambiguationPillMetric.secondLineFont.getter((CTFontRef)v4);
    CTFontGetAscent(v10);

    v11 = specialized VisionDisambiguationPillMetric.secondLineFont.getter((CTFontRef)v4);
    CTFontGetDescent(v11);

    v12 = specialized VisionDisambiguationPillMetric.secondLineFont.getter((CTFontRef)v4);
    CTFontGetLeading(v12);

  }
  else
  {
    v13 = specialized VisionDisambiguationPillMetric.firstLineFont.getter((CTFontRef)a1);
    CTFontGetAscent(v13);

    v14 = specialized VisionDisambiguationPillMetric.firstLineFont.getter((CTFontRef)a1);
    CTFontGetDescent(v14);

    v15 = specialized VisionDisambiguationPillMetric.firstLineFont.getter((CTFontRef)a1);
    CTFontGetLeading(v15);

  }
}

uint64_t (*iOSDisambiguationPillMetric.style.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t (*iOSDisambiguationPillMetric.tag.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

double iOSDisambiguationPillMetric.margins.getter()
{
  return 12.0;
}

double iOSDisambiguationPillMetric.avatarDiameter.getter()
{
  return 40.0;
}

uint64_t iOSDisambiguationPillMetric.useSingleLineLayout.getter(int a1, id a2)
{
  return objc_msgSend(a2, sel_isGroupConversation) ^ 1;
}

double iOSDisambiguationPillMetric.labelHorizontalMargins.getter()
{
  return 0.0;
}

CGColorRef iOSDisambiguationPillMetric.firstLineColor.getter(void *a1)
{
  return iOSDisambiguationPillMetric.firstLineColor.getter(a1, 1.0);
}

CTFontRef iOSDisambiguationPillMetric.firstLineFont.getter()
{
  return specialized iOSDisambiguationPillMetric.firstLineFont.getter(MEMORY[0x1E0CA84B0], 17.0);
}

CGColorRef iOSDisambiguationPillMetric.secondLineColor.getter(void *a1)
{
  return iOSDisambiguationPillMetric.firstLineColor.getter(a1, 0.5);
}

CTFontRef iOSDisambiguationPillMetric.secondLineFont.getter()
{
  return specialized iOSDisambiguationPillMetric.firstLineFont.getter(MEMORY[0x1E0CA84D0], 15.0);
}

uint64_t protocol witness for HighlightDisambiguationPillMetricVariant.useSingleLineLayout.getter in conformance iOSDisambiguationPillMetric()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 8), sel_isGroupConversation) ^ 1;
}

double protocol witness for HighlightDisambiguationPillMetricVariant.margins.getter in conformance iOSDisambiguationPillMetric()
{
  return 12.0;
}

double protocol witness for HighlightDisambiguationPillMetricVariant.avatarDiameter.getter in conformance iOSDisambiguationPillMetric()
{
  return 40.0;
}

double protocol witness for HighlightDisambiguationPillMetricVariant.labelHorizontalMargins.getter in conformance iOSDisambiguationPillMetric()
{
  return 0.0;
}

CGColorRef protocol witness for HighlightDisambiguationPillMetricVariant.firstLineColor.getter in conformance iOSDisambiguationPillMetric()
{
  return protocol witness for HighlightDisambiguationPillMetricVariant.firstLineColor.getter in conformance iOSDisambiguationPillMetric(1.0);
}

CTFontRef protocol witness for HighlightDisambiguationPillMetricVariant.firstLineFont.getter in conformance iOSDisambiguationPillMetric()
{
  return specialized iOSDisambiguationPillMetric.firstLineFont.getter(MEMORY[0x1E0CA84B0], 17.0);
}

CGColorRef protocol witness for HighlightDisambiguationPillMetricVariant.secondLineColor.getter in conformance iOSDisambiguationPillMetric()
{
  return protocol witness for HighlightDisambiguationPillMetricVariant.firstLineColor.getter in conformance iOSDisambiguationPillMetric(0.5);
}

CTFontRef protocol witness for HighlightDisambiguationPillMetricVariant.secondLineFont.getter in conformance iOSDisambiguationPillMetric()
{
  return specialized iOSDisambiguationPillMetric.firstLineFont.getter(MEMORY[0x1E0CA84D0], 15.0);
}

double protocol witness for HighlightDisambiguationPillMetricVariant.chevronLeadingMargin.getter in conformance iOSDisambiguationPillMetric()
{
  return 5.0;
}

double protocol witness for HighlightDisambiguationPillMetricVariant.pillHeight.getter in conformance iOSDisambiguationPillMetric()
{
  void **v0;
  double v1;

  specialized HighlightDisambiguationPillMetricVariant.heightOfTallestItem.getter(*v0, v0[1]);
  return v1 + 12.0 + 12.0;
}

void protocol witness for HighlightDisambiguationPillMetricVariant.heightOfTallestItem.getter in conformance iOSDisambiguationPillMetric()
{
  void **v0;

  specialized HighlightDisambiguationPillMetricVariant.heightOfTallestItem.getter(*v0, v0[1]);
}

double protocol witness for HighlightDisambiguationPillMetricVariant.firstLineFontHeight.getter in conformance iOSDisambiguationPillMetric(uint64_t a1, uint64_t a2)
{
  return protocol witness for HighlightDisambiguationPillMetricVariant.firstLineFontHeight.getter in conformance iOSDisambiguationPillMetric(17.0, a1, a2, MEMORY[0x1E0CA84B0]);
}

double protocol witness for HighlightDisambiguationPillMetricVariant.secondLineFontHeight.getter in conformance iOSDisambiguationPillMetric(uint64_t a1, uint64_t a2)
{
  return protocol witness for HighlightDisambiguationPillMetricVariant.firstLineFontHeight.getter in conformance iOSDisambiguationPillMetric(15.0, a1, a2, MEMORY[0x1E0CA84D0]);
}

double protocol witness for HighlightDisambiguationPillMetricVariant.firstLineFontHeight.getter in conformance iOSDisambiguationPillMetric(CGFloat a1, uint64_t a2, uint64_t a3, const __CTFont *a4)
{
  const __CTFont *v6;
  double Ascent;
  const __CTFont *v8;
  double Descent;
  const __CTFont *v10;
  double Leading;

  v6 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(a4, a1);
  Ascent = CTFontGetAscent(v6);

  v8 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(a4, a1);
  Descent = CTFontGetDescent(v8);

  v10 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(a4, a1);
  Leading = CTFontGetLeading(v10);

  return Ascent + Descent + Leading;
}

id protocol witness for HighlightDisambiguationPillMetricVariant.firstLineAttributedString(from:) in conformance iOSDisambiguationPillMetric(uint64_t a1, uint64_t a2)
{
  void **v2;

  return specialized HighlightDisambiguationPillMetricVariant.firstLineAttributedString(from:)(a1, a2, *v2, MEMORY[0x1E0CA84B0], 17.0, 1.0);
}

id protocol witness for HighlightDisambiguationPillMetricVariant.secondLineAttributedString(from:) in conformance iOSDisambiguationPillMetric(uint64_t a1, uint64_t a2)
{
  void **v2;

  return specialized HighlightDisambiguationPillMetricVariant.firstLineAttributedString(from:)(a1, a2, *v2, MEMORY[0x1E0CA84D0], 15.0, 0.5);
}

uint64_t (*VisionDisambiguationPillMetric.style.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t (*VisionDisambiguationPillMetric.tag.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

double VisionDisambiguationPillMetric.margins.getter()
{
  return 20.0;
}

double VisionDisambiguationPillMetric.avatarDiameter.getter()
{
  return 52.0;
}

double VisionDisambiguationPillMetric.labelHorizontalMargins.getter()
{
  return 0.0;
}

CGColorRef VisionDisambiguationPillMetric.firstLineColor.getter()
{
  return CGColorCreateGenericRGB(1.0, 1.0, 1.0, 1.0);
}

CGColorRef VisionDisambiguationPillMetric.secondLineColor.getter()
{
  return CGColorCreateGenericRGB(1.0, 1.0, 1.0, 0.4);
}

id iOSDisambiguationPillMetric.secondLineString.getter(int a1, id a2)
{
  if (objc_msgSend(a2, sel_isGroupConversation))
    return specialized static DisambiguationPillMetrics.secondLineString(for:)(a2);
  else
    return 0;
}

double protocol witness for HighlightDisambiguationPillMetricVariant.margins.getter in conformance VisionDisambiguationPillMetric()
{
  return 20.0;
}

double protocol witness for HighlightDisambiguationPillMetricVariant.avatarDiameter.getter in conformance VisionDisambiguationPillMetric()
{
  return 52.0;
}

double protocol witness for HighlightDisambiguationPillMetricVariant.labelHorizontalMargins.getter in conformance VisionDisambiguationPillMetric()
{
  return 0.0;
}

CGColorRef protocol witness for HighlightDisambiguationPillMetricVariant.firstLineColor.getter in conformance VisionDisambiguationPillMetric()
{
  return CGColorCreateGenericRGB(1.0, 1.0, 1.0, 1.0);
}

CTFontRef protocol witness for HighlightDisambiguationPillMetricVariant.firstLineFont.getter in conformance VisionDisambiguationPillMetric()
{
  CTFontRef *v0;

  return specialized VisionDisambiguationPillMetric.firstLineFont.getter(*v0);
}

CGColorRef protocol witness for HighlightDisambiguationPillMetricVariant.secondLineColor.getter in conformance VisionDisambiguationPillMetric()
{
  return CGColorCreateGenericRGB(1.0, 1.0, 1.0, 0.4);
}

CTFontRef protocol witness for HighlightDisambiguationPillMetricVariant.secondLineFont.getter in conformance VisionDisambiguationPillMetric()
{
  CTFontRef *v0;

  return specialized VisionDisambiguationPillMetric.secondLineFont.getter(*v0);
}

id protocol witness for HighlightDisambiguationPillMetricVariant.secondLineString.getter in conformance iOSDisambiguationPillMetric()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 8);
  if (objc_msgSend(v1, sel_isGroupConversation))
    return specialized static DisambiguationPillMetrics.secondLineString(for:)(v1);
  else
    return 0;
}

double protocol witness for HighlightDisambiguationPillMetricVariant.pillHeight.getter in conformance VisionDisambiguationPillMetric()
{
  void **v0;
  double v1;

  specialized HighlightDisambiguationPillMetricVariant.heightOfTallestItem.getter(*v0, v0[1]);
  return v1 + 20.0 + 20.0;
}

void protocol witness for HighlightDisambiguationPillMetricVariant.heightOfTallestItem.getter in conformance VisionDisambiguationPillMetric()
{
  void **v0;

  specialized HighlightDisambiguationPillMetricVariant.heightOfTallestItem.getter(*v0, v0[1]);
}

double protocol witness for HighlightDisambiguationPillMetricVariant.firstLineFontHeight.getter in conformance VisionDisambiguationPillMetric(uint64_t a1, uint64_t a2)
{
  return protocol witness for HighlightDisambiguationPillMetricVariant.firstLineFontHeight.getter in conformance VisionDisambiguationPillMetric(a1, a2, (uint64_t (*)(uint64_t))specialized VisionDisambiguationPillMetric.firstLineFont.getter);
}

double protocol witness for HighlightDisambiguationPillMetricVariant.secondLineFontHeight.getter in conformance VisionDisambiguationPillMetric(uint64_t a1, uint64_t a2)
{
  return protocol witness for HighlightDisambiguationPillMetricVariant.firstLineFontHeight.getter in conformance VisionDisambiguationPillMetric(a1, a2, (uint64_t (*)(uint64_t))specialized VisionDisambiguationPillMetric.secondLineFont.getter);
}

double protocol witness for HighlightDisambiguationPillMetricVariant.firstLineFontHeight.getter in conformance VisionDisambiguationPillMetric(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t *v3;
  uint64_t v5;
  const __CTFont *v6;
  double Ascent;
  const __CTFont *v8;
  double Descent;
  const __CTFont *v10;
  double Leading;

  v5 = *v3;
  v6 = (const __CTFont *)a3(v5);
  Ascent = CTFontGetAscent(v6);

  v8 = (const __CTFont *)a3(v5);
  Descent = CTFontGetDescent(v8);

  v10 = (const __CTFont *)a3(v5);
  Leading = CTFontGetLeading(v10);

  return Ascent + Descent + Leading;
}

id protocol witness for HighlightDisambiguationPillMetricVariant.firstLineAttributedString(from:) in conformance VisionDisambiguationPillMetric(uint64_t a1, uint64_t a2)
{
  void **v2;

  return specialized HighlightDisambiguationPillMetricVariant.firstLineAttributedString(from:)(a1, a2, *v2, (uint64_t (*)(void *))specialized VisionDisambiguationPillMetric.firstLineFont.getter, 1.0);
}

id protocol witness for HighlightDisambiguationPillMetricVariant.secondLineAttributedString(from:) in conformance VisionDisambiguationPillMetric(uint64_t a1, uint64_t a2)
{
  void **v2;

  return specialized HighlightDisambiguationPillMetricVariant.firstLineAttributedString(from:)(a1, a2, *v2, (uint64_t (*)(void *))specialized VisionDisambiguationPillMetric.secondLineFont.getter, 0.4);
}

void MacDisambiguationPillMetric.style.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*MacDisambiguationPillMetric.style.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

void MacDisambiguationPillMetric.tag.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = a1;
}

uint64_t (*MacDisambiguationPillMetric.tag.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

double MacDisambiguationPillMetric.margins.getter()
{
  return 0.0;
}

double MacDisambiguationPillMetric.avatarDiameter.getter()
{
  return 16.0;
}

uint64_t MacDisambiguationPillMetric.useChevron.getter()
{
  return 1;
}

double MacDisambiguationPillMetric.labelHorizontalMargins.getter()
{
  return 0.0;
}

CGColorRef MacDisambiguationPillMetric.firstLineColor.getter(void *a1)
{
  return iOSDisambiguationPillMetric.firstLineColor.getter(a1, 1.0);
}

CGColorRef iOSDisambiguationPillMetric.firstLineColor.getter(void *a1, CGFloat a2)
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;

  if (objc_msgSend(a1, sel_userInterfaceStyle) == (id)1)
  {
    v3 = 1.0;
    v4 = 1.0;
    v5 = 1.0;
  }
  else
  {
    v3 = 0.0;
    v4 = 0.0;
    v5 = 0.0;
  }
  return CGColorCreateGenericRGB(v3, v4, v5, a2);
}

uint64_t MacDisambiguationPillMetric.firstLineFont.getter()
{
  const __CTFont *UIFontForLanguage;
  const __CTFont *v1;
  CTFontRef CopyWithSymbolicTraits;
  uint64_t result;

  UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontMenuItem, 0.0, 0);
  if (UIFontForLanguage)
  {
    v1 = UIFontForLanguage;
    CopyWithSymbolicTraits = CTFontCreateCopyWithSymbolicTraits(UIFontForLanguage, 0.0, 0, 2u, 2u);

    if (CopyWithSymbolicTraits)
      return (uint64_t)CopyWithSymbolicTraits;
  }
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void MacDisambiguationPillMetric.secondLineColor.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void MacDisambiguationPillMetric.secondLineFont.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void MacDisambiguationPillMetric.secondLineString.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

id protocol witness for HighlightDisambiguationPillMetricVariant.tag.getter in conformance MacDisambiguationPillMetric()
{
  uint64_t v0;

  return *(id *)(v0 + 8);
}

double protocol witness for HighlightDisambiguationPillMetricVariant.margins.getter in conformance MacDisambiguationPillMetric()
{
  return 0.0;
}

double protocol witness for HighlightDisambiguationPillMetricVariant.avatarDiameter.getter in conformance MacDisambiguationPillMetric()
{
  return 16.0;
}

double protocol witness for HighlightDisambiguationPillMetricVariant.labelHorizontalMargins.getter in conformance MacDisambiguationPillMetric()
{
  return 0.0;
}

CGColorRef protocol witness for HighlightDisambiguationPillMetricVariant.firstLineColor.getter in conformance iOSDisambiguationPillMetric(CGFloat a1)
{
  id *v1;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;

  if (objc_msgSend(*v1, sel_userInterfaceStyle) == (id)1)
  {
    v3 = 1.0;
    v4 = 1.0;
    v5 = 1.0;
  }
  else
  {
    v3 = 0.0;
    v4 = 0.0;
    v5 = 0.0;
  }
  return CGColorCreateGenericRGB(v3, v4, v5, a1);
}

uint64_t protocol witness for HighlightDisambiguationPillMetricVariant.firstLineFont.getter in conformance MacDisambiguationPillMetric()
{
  const __CTFont *UIFontForLanguage;
  const __CTFont *v1;
  CTFontRef CopyWithSymbolicTraits;
  uint64_t result;

  UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontMenuItem, 0.0, 0);
  if (UIFontForLanguage)
  {
    v1 = UIFontForLanguage;
    CopyWithSymbolicTraits = CTFontCreateCopyWithSymbolicTraits(UIFontForLanguage, 0.0, 0, 2u, 2u);

    if (CopyWithSymbolicTraits)
      return (uint64_t)CopyWithSymbolicTraits;
  }
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t protocol witness for HighlightDisambiguationPillMetricVariant.firstLineString.getter in conformance MacDisambiguationPillMetric()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = *(id *)(v0 + 8);
  v2 = specialized static DisambiguationPillMetrics.firstLineString(for:)(v1);

  return v2;
}

void protocol witness for HighlightDisambiguationPillMetricVariant.secondLineColor.getter in conformance MacDisambiguationPillMetric()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void protocol witness for HighlightDisambiguationPillMetricVariant.secondLineFont.getter in conformance MacDisambiguationPillMetric()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void protocol witness for HighlightDisambiguationPillMetricVariant.secondLineString.getter in conformance MacDisambiguationPillMetric()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

double protocol witness for HighlightDisambiguationPillMetricVariant.chevronSize.getter in conformance MacDisambiguationPillMetric()
{
  void **v0;

  return specialized HighlightDisambiguationPillMetricVariant.chevronSize.getter(*v0);
}

uint64_t protocol witness for HighlightDisambiguationPillMetricVariant.chevronImage.getter in conformance MacDisambiguationPillMetric()
{
  void **v0;

  return specialized HighlightDisambiguationPillMetricVariant.chevronImage.getter(*v0);
}

double protocol witness for HighlightDisambiguationPillMetricVariant.pillHeight.getter in conformance MacDisambiguationPillMetric()
{
  double v0;

  specialized HighlightDisambiguationPillMetricVariant.firstLineFontHeight.getter();
  if (v0 < 16.0)
    return 16.0;
  else
    return v0 + 0.0;
}

double protocol witness for HighlightDisambiguationPillMetricVariant.heightOfTallestItem.getter in conformance MacDisambiguationPillMetric()
{
  double v0;

  specialized HighlightDisambiguationPillMetricVariant.firstLineFontHeight.getter();
  return fmax(v0, 16.0);
}

uint64_t protocol witness for HighlightDisambiguationPillMetricVariant.firstLineAttributedString(from:) in conformance MacDisambiguationPillMetric(uint64_t a1, uint64_t a2)
{
  void **v2;

  return specialized HighlightDisambiguationPillMetricVariant.firstLineAttributedString(from:)(a1, a2, *v2);
}

id DisambiguationPillMetrics.__allocating_init(slotStyle:tag:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithSlotStyle_tag_variant_, a1, a2, objc_msgSend(a2, sel_variant));

  return v5;
}

id DisambiguationPillMetrics.init(slotStyle:tag:)(void *a1, id a2)
{
  void *v2;
  id v5;

  v5 = objc_msgSend(v2, sel_initWithSlotStyle_tag_variant_, a1, a2, objc_msgSend(a2, sel_variant));

  return v5;
}

id DisambiguationPillMetrics.__allocating_init(slotStyle:tag:variant:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return DisambiguationPillMetrics.init(slotStyle:tag:variant:)(a1, a2, a3);
}

id DisambiguationPillMetrics.init(slotStyle:tag:variant:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v7;
  char *v8;
  ValueMetadata *v9;
  _UNKNOWN **v10;
  id result;
  char *v12;
  objc_super v13;
  _BYTE v14[128];

  v7 = (uint64_t)&v3[OBJC_IVAR___SLHighlightDisambiguationPillMetrics____lazy_storage___pillMetrics];
  _s11SocialLayer36SLHighlightDisambiguationPillMetrics33_C5DA7C7764DCEDFB9B9BF94750149602LLVSgWOi0_((uint64_t)v14);
  outlined init with take of SLHighlightDisambiguationPillMetrics?((uint64_t)v14, v7);
  switch(a3)
  {
    case 2:
      v8 = &v3[OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics];
      v9 = &type metadata for VisionDisambiguationPillMetric;
      v10 = &protocol witness table for VisionDisambiguationPillMetric;
      goto LABEL_7;
    case 1:
      v8 = &v3[OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics];
      v9 = &type metadata for MacDisambiguationPillMetric;
      v10 = &protocol witness table for MacDisambiguationPillMetric;
LABEL_7:
      *((_QWORD *)v8 + 3) = v9;
      *((_QWORD *)v8 + 4) = v10;
      *(_QWORD *)v8 = a1;
      *((_QWORD *)v8 + 1) = a2;
      v13.receiver = v3;
      v13.super_class = (Class)type metadata accessor for DisambiguationPillMetrics();
      return objc_msgSendSuper2(&v13, sel_init);
    case 0:
      v8 = &v3[OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics];
      v9 = &type metadata for iOSDisambiguationPillMetric;
      v10 = &protocol witness table for iOSDisambiguationPillMetric;
      goto LABEL_7;
  }
  type metadata accessor for SLHighlightDisambiguationPillMetricVariant(0);
  v12 = v3;
  result = (id)_diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
  __break(1u);
  return result;
}

double DisambiguationPillMetrics.pillMetrics.getter@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  double result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _OWORD v19[8];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _OWORD v29[8];

  v3 = v1 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics____lazy_storage___pillMetrics;
  outlined init with take of SLHighlightDisambiguationPillMetrics?(v1 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics____lazy_storage___pillMetrics, (uint64_t)v28);
  outlined init with take of SLHighlightDisambiguationPillMetrics?((uint64_t)v28, (uint64_t)v29);
  if (_s11SocialLayer36SLHighlightDisambiguationPillMetrics33_C5DA7C7764DCEDFB9B9BF94750149602LLVSgWOg((uint64_t)v29) == 1)
  {
    closure #1 in DisambiguationPillMetrics.pillMetrics.getter(v1, (uint64_t)&v11);
    v19[4] = v15;
    v19[5] = v16;
    v19[6] = v17;
    v19[7] = v18;
    v19[0] = v11;
    v19[1] = v12;
    v19[2] = v13;
    v19[3] = v14;
    destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors(v19);
    outlined init with take of SLHighlightDisambiguationPillMetrics?((uint64_t)v19, v3);
    v24 = v15;
    v25 = v16;
    v26 = v17;
    v27 = v18;
    v20 = v11;
    v21 = v12;
    v4 = v13;
    v5 = v14;
  }
  else
  {
    v24 = v29[4];
    v25 = v29[5];
    v26 = v29[6];
    v27 = v29[7];
    v20 = v29[0];
    v21 = v29[1];
    v4 = v29[2];
    v5 = v29[3];
  }
  v22 = v4;
  v23 = v5;
  v6 = v25;
  a1[4] = v24;
  a1[5] = v6;
  v7 = v27;
  a1[6] = v26;
  a1[7] = v7;
  v8 = v21;
  *a1 = v20;
  a1[1] = v8;
  result = *(double *)&v22;
  v10 = v23;
  a1[2] = v22;
  a1[3] = v10;
  return result;
}

double closure #1 in DisambiguationPillMetrics.pillMetrics.getter@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const __CFAttributedString *v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  double v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  double v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  double v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  double v75;
  const __CTLine *v76;
  double width;
  double v78;
  double v79;
  double v80;
  double v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const __CFAttributedString *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const __CFAttributedString *v91;
  uint64_t v92;
  uint64_t v93;
  double v94;
  double v95;
  uint64_t v96;
  uint64_t v97;
  double v98;
  uint64_t v99;
  uint64_t v100;
  double v101;
  double v102;
  uint64_t v103;
  uint64_t v104;
  double v105;
  double v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  const __CTLine *v117;
  const __CTLine *v118;
  double v119;
  double v120;
  double v121;
  double result;
  double v123;
  double v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  double v128;
  double v129;
  double v130;
  uint64_t v131;
  _QWORD v132[3];
  uint64_t v133;
  uint64_t v134;
  _QWORD v135[3];
  uint64_t v136;
  uint64_t v137;
  _QWORD v138[3];
  uint64_t v139;
  uint64_t v140;
  _QWORD v141[3];
  uint64_t v142;
  uint64_t v143;
  _QWORD v144[3];
  uint64_t v145;
  uint64_t v146;
  _QWORD v147[3];
  uint64_t v148;
  uint64_t v149;
  CGRect BoundsWithOptions;
  CGRect v151;
  CGRect v152;

  v3 = a1 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics;
  outlined init with copy of HighlightDisambiguationPillMetricVariant(a1 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v147);
  v4 = v148;
  v5 = v149;
  __swift_project_boxed_opaque_existential_1(v147, v148);
  v6 = (*(double (**)(uint64_t, uint64_t))(v5 + 40))(v4, v5);
  v8 = v7;
  v10 = v9;
  v131 = v11;
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v144);
  v12 = v145;
  v13 = v146;
  __swift_project_boxed_opaque_existential_1(v144, v145);
  v130 = (*(double (**)(uint64_t, uint64_t))(v13 + 160))(v12, v13);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v144);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v144);
  v14 = v145;
  v15 = v146;
  __swift_project_boxed_opaque_existential_1(v144, v145);
  v129 = (*(double (**)(uint64_t, uint64_t))(v15 + 48))(v14, v15);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v141);
  v16 = v142;
  v17 = v143;
  __swift_project_boxed_opaque_existential_1(v141, v142);
  v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 24))(v16, v17);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v138);
  v19 = v139;
  v20 = v140;
  __swift_project_boxed_opaque_existential_1(v138, v139);
  v21 = (*(double (**)(uint64_t, uint64_t))(v20 + 56))(v19, v20);
  v127 = v22;
  v128 = v21;
  v125 = v24;
  v126 = v23;
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
  v25 = v136;
  v26 = v137;
  __swift_project_boxed_opaque_existential_1(v135, v136);
  v124 = (*(double (**)(uint64_t, uint64_t))(v26 + 176))(v25, v26);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
  v27 = v136;
  v28 = v137;
  __swift_project_boxed_opaque_existential_1(v135, v136);
  v29 = (*(uint64_t (**)(uint64_t, uint64_t))(v28 + 24))(v27, v28);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
  v30 = 0.0;
  v31 = 0.0;
  if ((v29 & 1) == 0)
  {
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    v32 = v136;
    v33 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    v31 = (*(double (**)(uint64_t, uint64_t))(v33 + 184))(v32, v33);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v138);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v141);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v144);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v147);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
  v34 = v136;
  v35 = v137;
  __swift_project_boxed_opaque_existential_1(v135, v136);
  v36 = (*(uint64_t (**)(uint64_t, uint64_t))(v35 + 16))(v34, v35);
  objc_msgSend((id)v36, sel_maxWidth);
  v38 = v37;

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
  v39 = v136;
  v40 = v137;
  __swift_project_boxed_opaque_existential_1(v135, v136);
  LOBYTE(v36) = (*(uint64_t (**)(uint64_t, uint64_t))(v40 + 32))(v39, v40);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
  if ((v36 & 1) != 0)
  {
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    v41 = v136;
    v42 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    v30 = (*(double (**)(uint64_t, uint64_t))(v42 + 136))(v41, v42);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
  }
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
  v43 = v136;
  v44 = v137;
  __swift_project_boxed_opaque_existential_1(v135, v136);
  v45 = (*(uint64_t (**)(uint64_t, uint64_t))(v44 + 32))(v43, v44);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
  v46 = 0.0;
  if ((v45 & 1) != 0)
  {
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    v47 = v136;
    v48 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    v46 = (*(double (**)(uint64_t, uint64_t))(v48 + 112))(v47, v48);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
  }
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
  v49 = v136;
  v50 = v137;
  __swift_project_boxed_opaque_existential_1(v135, v136);
  v51 = (*(uint64_t (**)(uint64_t, uint64_t))(v50 + 24))(v49, v50);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
  if ((v51 & 1) != 0)
  {
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    v52 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v132);
    v53 = v133;
    v54 = v134;
    __swift_project_boxed_opaque_existential_1(v132, v133);
    v55 = (*(uint64_t (**)(uint64_t, uint64_t))(v54 + 80))(v53, v54);
    v56 = (const __CFAttributedString *)(*(uint64_t (**)(uint64_t))(v52 + 192))(v55);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v132);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    v57 = v136;
    v58 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    (*(void (**)(uint64_t, uint64_t))(v58 + 40))(v57, v58);
    v60 = v59;
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v132);
    v61 = v133;
    v62 = v134;
    __swift_project_boxed_opaque_existential_1(v132, v133);
    v63 = v60 + (*(double (**)(uint64_t, uint64_t))(v62 + 48))(v61, v62);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v132);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    v64 = v136;
    v65 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    (*(void (**)(uint64_t, uint64_t))(v65 + 56))(v64, v65);
    v67 = v63 + v66;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    v68 = v136;
    v69 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    (*(void (**)(uint64_t, uint64_t))(v69 + 56))(v68, v69);
    v71 = v30 + v46 + v67 + v70;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    v72 = v136;
    v73 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    (*(void (**)(uint64_t, uint64_t))(v73 + 40))(v72, v73);
    v75 = v71 + v74;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    v76 = CTLineCreateWithAttributedString(v56);
    BoundsWithOptions = CTLineGetBoundsWithOptions(v76, 0);
    width = BoundsWithOptions.size.width;

    if (width >= v38 - v75)
      v78 = v38 - v75;
    else
      v78 = width;
    v79 = v75 + v78;
    v80 = 0.0;
    v81 = 0.0;
  }
  else
  {
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    v82 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v132);
    v83 = v133;
    v84 = v134;
    __swift_project_boxed_opaque_existential_1(v132, v133);
    v85 = (*(uint64_t (**)(uint64_t, uint64_t))(v84 + 80))(v83, v84);
    v86 = (const __CFAttributedString *)(*(uint64_t (**)(uint64_t))(v82 + 192))(v85);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v132);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    v87 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v132);
    v88 = v133;
    v89 = v134;
    __swift_project_boxed_opaque_existential_1(v132, v133);
    v90 = (*(uint64_t (**)(uint64_t, uint64_t))(v89 + 104))(v88, v89);
    v91 = (const __CFAttributedString *)(*(uint64_t (**)(uint64_t))(v87 + 200))(v90);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v132);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    v92 = v136;
    v93 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    (*(void (**)(uint64_t, uint64_t))(v93 + 40))(v92, v93);
    v123 = v31;
    v95 = v94;
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v132);
    v96 = v133;
    v97 = v134;
    __swift_project_boxed_opaque_existential_1(v132, v133);
    v98 = v95 + (*(double (**)(uint64_t, uint64_t))(v97 + 48))(v96, v97);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v132);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    v99 = v136;
    v100 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    (*(void (**)(uint64_t, uint64_t))(v100 + 56))(v99, v100);
    v102 = v98 + v101;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    v103 = v136;
    v104 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    (*(void (**)(uint64_t, uint64_t))(v104 + 56))(v103, v104);
    v106 = v102 + v105;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    v107 = v136;
    v108 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    (*(void (**)(uint64_t, uint64_t))(v108 + 40))(v107, v108);
    v109 = v10;
    v110 = v8;
    v111 = v6;
    v113 = v106 + v112;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    v114 = v30 + v46 + v113;
    v115 = v38 - v113;
    v116 = v38 - v114;
    v117 = CTLineCreateWithAttributedString(v86);
    v118 = CTLineCreateWithAttributedString(v91);
    v151 = CTLineGetBoundsWithOptions(v117, 0);
    v119 = v151.size.width;
    v152 = CTLineGetBoundsWithOptions(v118, 0);
    v120 = v152.size.width;

    if (v119 >= v115)
      v78 = v115;
    else
      v78 = v119;
    if (v120 >= v116)
      v80 = v116;
    else
      v80 = v120;
    v81 = v123;
    if (v78 > v80)
      v121 = v78;
    else
      v121 = v80;
    v79 = v113 + v121;
    v6 = v111;
    v8 = v110;
    v10 = v109;
  }
  *(double *)a2 = v6;
  *(_QWORD *)(a2 + 8) = v8;
  *(_QWORD *)(a2 + 16) = v10;
  *(_QWORD *)(a2 + 24) = v131;
  *(double *)(a2 + 32) = v79;
  *(double *)(a2 + 40) = v130;
  *(double *)(a2 + 48) = v129;
  *(_BYTE *)(a2 + 56) = v18 & 1;
  *(double *)(a2 + 64) = v128;
  *(_QWORD *)(a2 + 72) = v127;
  *(_QWORD *)(a2 + 80) = v126;
  *(_QWORD *)(a2 + 88) = v125;
  *(double *)(a2 + 96) = v78;
  result = v124;
  *(double *)(a2 + 104) = v124;
  *(double *)(a2 + 112) = v80;
  *(double *)(a2 + 120) = v81;
  return result;
}

uint64_t static DisambiguationPillMetrics.accessibilityLabel(for:)(void *a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  Swift::String v6;

  v2 = specialized static DisambiguationPillMetrics.firstLineString(for:)(a1);
  v3 = specialized static DisambiguationPillMetrics.secondLineString(for:)(a1);
  v5 = v4;
  swift_bridgeObjectRetain();
  v6._countAndFlagsBits = (uint64_t)v3;
  v6._object = v5;
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2;
}

id DisambiguationPillMetrics.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void DisambiguationPillMetrics.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id DisambiguationPillMetrics.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DisambiguationPillMetrics();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

double DisambiguationPillMetrics.margins.getter()
{
  __int128 v1;

  DisambiguationPillMetrics.pillMetrics.getter(&v1);
  return *(double *)&v1;
}

double DisambiguationPillMetrics.pillHeight.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;

  v1 = v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics;
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v11);
  v2 = v12;
  v3 = v13;
  __swift_project_boxed_opaque_existential_1(v11, v12);
  v4 = (*(double (**)(uint64_t, uint64_t))(v3 + 40))(v2, v3);
  v6 = v5;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v1, (uint64_t)v11);
  v7 = v12;
  v8 = v13;
  __swift_project_boxed_opaque_existential_1(v11, v12);
  v9 = v4 + (*(double (**)(uint64_t, uint64_t))(v8 + 168))(v7, v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  return v6 + v9;
}

double DisambiguationPillMetrics.pillSize.getter()
{
  __int128 v1;
  double v2;

  DisambiguationPillMetrics.pillMetrics.getter(&v1);
  return v2;
}

double DisambiguationPillMetrics.avatarDiameter.getter()
{
  _OWORD v1[3];
  double v2;

  DisambiguationPillMetrics.pillMetrics.getter(v1);
  return v2;
}

uint64_t DisambiguationPillMetrics.useSingleLineLayout.getter()
{
  _OWORD v1[3];
  unsigned __int8 v2;

  DisambiguationPillMetrics.pillMetrics.getter(v1);
  return v2;
}

uint64_t DisambiguationPillMetrics.useChevron.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[3];
  uint64_t v5;
  uint64_t v6;

  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v4);
  v1 = v5;
  v2 = v6;
  __swift_project_boxed_opaque_existential_1(v4, v5);
  LOBYTE(v1) = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 32))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return v1 & 1;
}

uint64_t DisambiguationPillMetrics.chevronImage.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[3];
  uint64_t v6;
  uint64_t v7;

  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v5);
  v1 = v6;
  v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 152))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

double DisambiguationPillMetrics.chevronSize.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  v1 = v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics;
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v9);
  v2 = v10;
  v3 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  v5 = 0.0;
  if ((v4 & 1) != 0)
  {
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v1, (uint64_t)v9);
    v6 = v10;
    v7 = v11;
    __swift_project_boxed_opaque_existential_1(v9, v10);
    v5 = (*(double (**)(uint64_t, uint64_t))(v7 + 136))(v6, v7);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  }
  return v5;
}

double DisambiguationPillMetrics.chevronLeadingMargin.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  v1 = v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics;
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v9);
  v2 = v10;
  v3 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  v5 = 0.0;
  if ((v4 & 1) != 0)
  {
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v1, (uint64_t)v9);
    v6 = v10;
    v7 = v11;
    __swift_project_boxed_opaque_existential_1(v9, v10);
    v5 = (*(double (**)(uint64_t, uint64_t))(v7 + 112))(v6, v7);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  }
  return v5;
}

double DisambiguationPillMetrics.labelHorizontalMargins.getter()
{
  _OWORD v1[4];
  double v2;

  DisambiguationPillMetrics.pillMetrics.getter(v1);
  return v2;
}

uint64_t DisambiguationPillMetrics.line(from:maxWidth:)(const __CFAttributedString *a1)
{
  CTLineRef v1;
  uint64_t TruncatedLineWithTokenHandler;
  uint64_t v3;
  uint64_t result;

  v1 = CTLineCreateWithAttributedString(a1);
  TruncatedLineWithTokenHandler = CTLineCreateTruncatedLineWithTokenHandler();
  if (TruncatedLineWithTokenHandler)
  {
    v3 = TruncatedLineWithTokenHandler;

    return v3;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

double DisambiguationPillMetrics.firstLineSize.getter()
{
  _OWORD v1[6];
  double v2;

  DisambiguationPillMetrics.pillMetrics.getter(v1);
  return v2;
}

uint64_t DisambiguationPillMetrics.firstLineColor.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[3];
  uint64_t v6;
  uint64_t v7;

  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v5);
  v1 = v6;
  v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 64))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

uint64_t DisambiguationPillMetrics.firstLineFont.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[3];
  uint64_t v6;
  uint64_t v7;

  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v5);
  v1 = v6;
  v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 72))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

uint64_t DisambiguationPillMetrics.firstLineAttributedString.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];

  v1 = v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics;
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v11);
  v2 = v11[4];
  __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v1, (uint64_t)v8);
  v3 = v9;
  v4 = v10;
  __swift_project_boxed_opaque_existential_1(v8, v9);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 80))(v3, v4);
  v6 = (*(uint64_t (**)(uint64_t))(v2 + 192))(v5);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  return v6;
}

uint64_t DisambiguationPillMetrics.secondLineColor.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[3];
  uint64_t v6;
  uint64_t v7;

  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v5);
  v1 = v6;
  v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

uint64_t DisambiguationPillMetrics.secondLineFont.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[3];
  uint64_t v6;
  uint64_t v7;

  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v5);
  v1 = v6;
  v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 96))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

double DisambiguationPillMetrics.secondLineSize.getter()
{
  _OWORD v1[7];
  double v2;

  DisambiguationPillMetrics.pillMetrics.getter(v1);
  return v2;
}

uint64_t DisambiguationPillMetrics.secondLineAttributedString.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];

  v1 = v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics;
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v11);
  v2 = v11[4];
  __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v1, (uint64_t)v8);
  v3 = v9;
  v4 = v10;
  __swift_project_boxed_opaque_existential_1(v8, v9);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 104))(v3, v4);
  v6 = (*(uint64_t (**)(uint64_t))(v2 + 200))(v5);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  return v6;
}

id @objc static DisambiguationPillMetrics.firstLineString(for:)(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(void))
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = a4();
  v8 = v7;

  v9 = (void *)MEMORY[0x19AEC3B6C](v6, v8);
  swift_bridgeObjectRelease();
  return v9;
}

CTFontRef specialized iOSDisambiguationPillMetric.firstLineFont.getter(CTFontRef result, CGFloat a2)
{
  void *v2;
  _QWORD *v4;
  uint64_t inited;
  void *v6;
  uint64_t v7;
  void **v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  const __CFDictionary *isa;
  const __CTFontDescriptor *v18;
  CTFontRef v19;

  v2 = (void *)*MEMORY[0x1E0CA8430];
  if (*MEMORY[0x1E0CA8430])
  {
    v4 = result;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef? : Any])>);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_199FA7E60;
    v6 = (void *)*MEMORY[0x1E0CA8418];
    *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CA8418];
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef?, Any)>);
    v7 = swift_initStackObject();
    v8 = (void **)MEMORY[0x1E0CA84E8];
    *(_OWORD *)(v7 + 16) = xmmword_199FA7840;
    v9 = *v8;
    *(_QWORD *)(v7 + 32) = *v8;
    v10 = MEMORY[0x1E0DEF040];
    *(_QWORD *)(v7 + 40) = *v4;
    v11 = (void *)*MEMORY[0x1E0CA8450];
    *(_QWORD *)(v7 + 64) = v10;
    *(_QWORD *)(v7 + 72) = v11;
    type metadata accessor for CFStringRef(0);
    *(_QWORD *)(v7 + 104) = v12;
    *(_QWORD *)(v7 + 80) = v2;
    v13 = v11;
    v14 = v2;
    v15 = v6;
    v16 = v9;
    *(_QWORD *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v7);
    specialized Dictionary.init(dictionaryLiteral:)(inited);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef? : Any]);
    lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t (*)(uint64_t))type metadata accessor for CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v18 = CTFontDescriptorCreateWithAttributes(isa);
    v19 = CTFontCreateWithFontDescriptor(v18, a2, 0);

    return v19;
  }
  else
  {
    __break(1u);
  }
  return result;
}

CTFontRef specialized VisionDisambiguationPillMetric.firstLineFont.getter(CTFontRef result)
{
  void *v1;
  CTFontRef v2;
  uint64_t inited;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  Class isa;
  id v11;
  const __CTFontDescriptor *v12;
  CTFontRef v13;

  v1 = (void *)*MEMORY[0x1E0CA8430];
  if (*MEMORY[0x1E0CA8430])
  {
    v2 = result;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef? : CFStringRef])>);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_199FA7E60;
    v4 = (void *)*MEMORY[0x1E0CA8418];
    *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CA8418];
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef?, CFStringRef)>);
    v5 = swift_initStackObject();
    *(_OWORD *)(v5 + 16) = xmmword_199FA7E60;
    v6 = (void *)*MEMORY[0x1E0CA8450];
    *(_QWORD *)(v5 + 32) = *MEMORY[0x1E0CA8450];
    *(_QWORD *)(v5 + 40) = v1;
    v7 = v6;
    v8 = v1;
    v9 = v4;
    *(_QWORD *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v5);
    specialized Dictionary.init(dictionaryLiteral:)(inited);
    type metadata accessor for CFStringRef(0);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef? : CFStringRef]);
    lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t (*)(uint64_t))type metadata accessor for CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v11 = -[__CTFont fontContentSizeCategory](v2, sel_fontContentSizeCategory);
    v12 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
    v13 = CTFontCreateWithFontDescriptor(v12, 0.0, 0);

    return v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

CTFontRef specialized VisionDisambiguationPillMetric.secondLineFont.getter(CTFontRef result)
{
  void *v1;
  CTFontRef v2;
  uint64_t inited;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  Class isa;
  id v15;
  const __CTFontDescriptor *v16;
  CTFontRef v17;

  v1 = (void *)*MEMORY[0x1E0CA8430];
  if (*MEMORY[0x1E0CA8430])
  {
    v2 = result;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef? : Any])>);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_199FA7E60;
    v4 = (void *)*MEMORY[0x1E0CA8418];
    *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CA8418];
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef?, Any)>);
    v5 = swift_initStackObject();
    *(_OWORD *)(v5 + 16) = xmmword_199FA7840;
    v6 = (void *)*MEMORY[0x1E0CA84E8];
    *(_QWORD *)(v5 + 32) = *MEMORY[0x1E0CA84E8];
    v7 = MEMORY[0x1E0DEF040];
    *(_QWORD *)(v5 + 40) = *MEMORY[0x1E0CA84D0];
    v8 = (void *)*MEMORY[0x1E0CA8450];
    *(_QWORD *)(v5 + 64) = v7;
    *(_QWORD *)(v5 + 72) = v8;
    type metadata accessor for CFStringRef(0);
    *(_QWORD *)(v5 + 104) = v9;
    *(_QWORD *)(v5 + 80) = v1;
    v10 = v8;
    v11 = v1;
    v12 = v4;
    v13 = v6;
    *(_QWORD *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v5);
    specialized Dictionary.init(dictionaryLiteral:)(inited);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef? : Any]);
    lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t (*)(uint64_t))type metadata accessor for CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v15 = -[__CTFont fontContentSizeCategory](v2, sel_fontContentSizeCategory);
    v16 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
    v17 = CTFontCreateWithFontDescriptor(v16, 0.0, 0);

    return v17;
  }
  else
  {
    __break(1u);
  }
  return result;
}

double specialized HighlightDisambiguationPillMetricVariant.chevronSize.getter(void *a1)
{
  unint64_t v2;
  id v3;
  void *v4;
  id v5;
  double v6;
  double v7;

  if (objc_msgSend(a1, sel_layoutDirection) == (id)1)
    v2 = 0xEC0000007466656CLL;
  else
    v2 = 0xED00007468676972;
  v3 = a1;
  v4 = (void *)MEMORY[0x19AEC3B6C](0x2E6E6F7276656863, v2);
  swift_bridgeObjectRelease();
  v5 = SLDSystemVectorGlyphWithSlotStyle(v3, v4, 1, 4, 10.0);

  objc_msgSend(v5, sel_contentBounds);
  v7 = v6;

  return v7;
}

uint64_t specialized HighlightDisambiguationPillMetricVariant.chevronImage.getter(void *a1)
{
  unint64_t v2;
  id v3;
  void *v4;
  id v5;
  unint64_t v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unsigned int v14;
  const char *v15;
  uint64_t v16;

  if (objc_msgSend(a1, sel_layoutDirection) == (id)1)
    v2 = 0xEC0000007466656CLL;
  else
    v2 = 0xED00007468676972;
  v3 = a1;
  v4 = (void *)MEMORY[0x19AEC3B6C](0x2E6E6F7276656863, v2);
  swift_bridgeObjectRelease();
  v5 = SLDSystemVectorGlyphWithSlotStyle(v3, v4, 1, 4, 10.0);

  if (objc_msgSend(v3, sel_layoutDirection) == (id)1)
    v6 = 0xEC0000007466656CLL;
  else
    v6 = 0xED00007468676972;
  v7 = v3;
  v8 = (void *)MEMORY[0x19AEC3B6C](0x2E6E6F7276656863, v6);
  swift_bridgeObjectRelease();
  v9 = SLDSystemVectorGlyphWithSlotStyle(v7, v8, 1, 4, 10.0);

  objc_msgSend(v9, sel_contentBounds);
  v11 = v10;
  v13 = v12;

  v14 = objc_msgSend(v7, sel_displayScale);
  v16 = SLDCreateRasterizedVectorGlyph(v5, v15, v11, v13, (double)v14);

  return v16;
}

void specialized HighlightDisambiguationPillMetricVariant.firstLineFontHeight.getter()
{
  const __CTFont *UIFontForLanguage;
  const __CTFont *v1;
  const __CTFont *CopyWithSymbolicTraits;
  const __CTFont *v3;
  const __CTFont *v4;
  const __CTFont *v5;
  const __CTFont *v6;
  const __CTFont *v7;
  const __CTFont *v8;

  UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontMenuItem, 0.0, 0);
  if (!UIFontForLanguage)
    goto LABEL_8;
  v1 = UIFontForLanguage;
  CopyWithSymbolicTraits = CTFontCreateCopyWithSymbolicTraits(UIFontForLanguage, 0.0, 0, 2u, 2u);

  if (!CopyWithSymbolicTraits)
    goto LABEL_8;
  CTFontGetAscent(CopyWithSymbolicTraits);

  v3 = CTFontCreateUIFontForLanguage(kCTFontUIFontMenuItem, 0.0, 0);
  if (!v3)
    goto LABEL_8;
  v4 = v3;
  v5 = CTFontCreateCopyWithSymbolicTraits(v3, 0.0, 0, 2u, 2u);

  if (!v5)
    goto LABEL_8;
  CTFontGetDescent(v5);

  v6 = CTFontCreateUIFontForLanguage(kCTFontUIFontMenuItem, 0.0, 0);
  if (v6 && (v7 = v6, v8 = CTFontCreateCopyWithSymbolicTraits(v6, 0.0, 0, 2u, 2u), v7, v8))
  {
    CTFontGetLeading(v8);

  }
  else
  {
LABEL_8:
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

uint64_t specialized HighlightDisambiguationPillMetricVariant.firstLineAttributedString(from:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t inited;
  void *v7;
  id v8;
  const __CTFont *UIFontForLanguage;
  const __CTFont *v10;
  CTFontRef CopyWithSymbolicTraits;
  void *v12;
  uint64_t v13;
  id v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGColorRef GenericRGB;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  Class isa;
  id v29;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_199FA7E70;
  v7 = (void *)*MEMORY[0x1E0DC1138];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
  swift_bridgeObjectRetain();
  v8 = v7;
  UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontMenuItem, 0.0, 0);
  if (UIFontForLanguage
    && (v10 = UIFontForLanguage,
        CopyWithSymbolicTraits = CTFontCreateCopyWithSymbolicTraits(UIFontForLanguage, 0.0, 0, 2u, 2u),
        v10,
        CopyWithSymbolicTraits))
  {
    type metadata accessor for CTFontRef(0);
    *(_QWORD *)(inited + 40) = CopyWithSymbolicTraits;
    v12 = (void *)*MEMORY[0x1E0DC1140];
    *(_QWORD *)(inited + 64) = v13;
    *(_QWORD *)(inited + 72) = v12;
    v14 = v12;
    if (objc_msgSend(a3, sel_userInterfaceStyle) == (id)1)
    {
      v15 = 1.0;
      v16 = 1.0;
      v17 = 1.0;
    }
    else
    {
      v15 = 0.0;
      v16 = 0.0;
      v17 = 0.0;
    }
    GenericRGB = CGColorCreateGenericRGB(v15, v16, v17, 1.0);
    type metadata accessor for CGColorRef(0);
    *(_QWORD *)(inited + 80) = GenericRGB;
    v19 = (void *)*MEMORY[0x1E0CB2CE0];
    *(_QWORD *)(inited + 104) = v20;
    *(_QWORD *)(inited + 112) = v19;
    v21 = v19;
    v22 = objc_msgSend(a3, sel_localization);
    v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v25 = v24;

    *(_QWORD *)(inited + 144) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(inited + 120) = v23;
    *(_QWORD *)(inited + 128) = v25;
    specialized Dictionary.init(dictionaryLiteral:)(inited);
    v26 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
    v27 = (void *)MEMORY[0x19AEC3B6C](a1, a2);
    swift_bridgeObjectRelease();
    type metadata accessor for NSAttributedStringKey(0);
    lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v29 = objc_msgSend(v26, sel_initWithString_attributes_, v27, isa);

    return (uint64_t)v29;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

id specialized HighlightDisambiguationPillMetricVariant.firstLineAttributedString(from:)(uint64_t a1, uint64_t a2, void *a3, const __CTFont *a4, CGFloat a5, CGFloat a6)
{
  uint64_t inited;
  void *v13;
  id v14;
  CTFontRef v15;
  void *v16;
  uint64_t v17;
  id v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGColorRef GenericRGB;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  Class isa;
  id v33;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_199FA7E70;
  v13 = (void *)*MEMORY[0x1E0DC1138];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
  swift_bridgeObjectRetain();
  v14 = v13;
  v15 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(a4, a5);
  type metadata accessor for CTFontRef(0);
  *(_QWORD *)(inited + 40) = v15;
  v16 = (void *)*MEMORY[0x1E0DC1140];
  *(_QWORD *)(inited + 64) = v17;
  *(_QWORD *)(inited + 72) = v16;
  v18 = v16;
  if (objc_msgSend(a3, sel_userInterfaceStyle) == (id)1)
  {
    v19 = 1.0;
    v20 = 1.0;
    v21 = 1.0;
  }
  else
  {
    v19 = 0.0;
    v20 = 0.0;
    v21 = 0.0;
  }
  GenericRGB = CGColorCreateGenericRGB(v19, v20, v21, a6);
  type metadata accessor for CGColorRef(0);
  *(_QWORD *)(inited + 80) = GenericRGB;
  v23 = (void *)*MEMORY[0x1E0CB2CE0];
  *(_QWORD *)(inited + 104) = v24;
  *(_QWORD *)(inited + 112) = v23;
  v25 = v23;
  v26 = objc_msgSend(a3, sel_localization);
  v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v29 = v28;

  *(_QWORD *)(inited + 144) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 120) = v27;
  *(_QWORD *)(inited + 128) = v29;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  v30 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
  v31 = (void *)MEMORY[0x19AEC3B6C](a1, a2);
  swift_bridgeObjectRelease();
  type metadata accessor for NSAttributedStringKey(0);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v33 = objc_msgSend(v30, sel_initWithString_attributes_, v31, isa);

  return v33;
}

id specialized HighlightDisambiguationPillMetricVariant.firstLineAttributedString(from:)(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(void *), CGFloat a5)
{
  uint64_t inited;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  CGColorRef GenericRGB;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  Class isa;
  id v28;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_199FA7E70;
  v11 = (void *)*MEMORY[0x1E0DC1138];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
  swift_bridgeObjectRetain();
  v12 = v11;
  v13 = a4(a3);
  type metadata accessor for CTFontRef(0);
  *(_QWORD *)(inited + 40) = v13;
  v14 = (void *)*MEMORY[0x1E0DC1140];
  *(_QWORD *)(inited + 64) = v15;
  *(_QWORD *)(inited + 72) = v14;
  v16 = v14;
  GenericRGB = CGColorCreateGenericRGB(1.0, 1.0, 1.0, a5);
  type metadata accessor for CGColorRef(0);
  *(_QWORD *)(inited + 80) = GenericRGB;
  v18 = (void *)*MEMORY[0x1E0CB2CE0];
  *(_QWORD *)(inited + 104) = v19;
  *(_QWORD *)(inited + 112) = v18;
  v20 = v18;
  v21 = objc_msgSend(a3, sel_localization);
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v24 = v23;

  *(_QWORD *)(inited + 144) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 120) = v22;
  *(_QWORD *)(inited + 128) = v24;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  v25 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
  v26 = (void *)MEMORY[0x19AEC3B6C](a1, a2);
  swift_bridgeObjectRelease();
  type metadata accessor for NSAttributedStringKey(0);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v28 = objc_msgSend(v25, sel_initWithString_attributes_, v26, isa);

  return v28;
}

uint64_t specialized static DisambiguationPillMetrics.firstLineString(for:)(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  _BYTE *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  id v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[16];

  v2 = type metadata accessor for Locale();
  MEMORY[0x1E0C80A78](v2);
  v3 = type metadata accessor for String.LocalizationValue();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v7 = &v31[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = MEMORY[0x1E0C80A78](v5);
  v10 = &v31[-v9];
  v11 = MEMORY[0x1E0C80A78](v8);
  v13 = &v31[-v12];
  MEMORY[0x1E0C80A78](v11);
  v15 = &v31[-v14];
  if (objc_msgSend(a1, sel_isFromMe))
  {
    String.LocalizationValue.init(stringLiteral:)();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v4 + 16))(v13, v15, v3);
    v16 = SLFrameworkBundle();
    static Locale.current.getter();
    v17 = String.init(localized:table:bundle:localization:locale:comment:)();
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v15, v3);
  }
  else
  {
    v18 = objc_msgSend(a1, sel_sender);
    v19 = objc_msgSend(v18, sel_shortDisplayName);

    v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v22 = v21;

    swift_bridgeObjectRelease();
    v23 = HIBYTE(v22) & 0xF;
    if ((v22 & 0x2000000000000000) == 0)
      v23 = v20 & 0xFFFFFFFFFFFFLL;
    if (v23)
    {
      v24 = objc_msgSend(a1, sel_sender);
      v25 = objc_msgSend(v24, sel_shortDisplayName);

      v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      return v26;
    }
    String.LocalizationValue.init(stringLiteral:)();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v4 + 16))(v7, v10, v3);
    v28 = SLFrameworkBundle();
    static Locale.current.getter();
    String.init(localized:table:bundle:localization:locale:comment:)();
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v10, v3);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_199FA7E60;
    v30 = MEMORY[0x1E0DEB490];
    *(_QWORD *)(v29 + 56) = MEMORY[0x1E0DEB418];
    *(_QWORD *)(v29 + 64) = v30;
    *(_QWORD *)(v29 + 32) = 1;
    v17 = static String.localizedStringWithFormat(_:_:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v17;
}

id specialized static DisambiguationPillMetrics.secondLineString(for:)(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  id v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  id result;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  _QWORD v43[2];

  v2 = type metadata accessor for Locale();
  MEMORY[0x1E0C80A78](v2);
  v3 = type metadata accessor for String.LocalizationValue();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v7 = (char *)v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v5);
  v10 = (char *)v43 - v9;
  v11 = MEMORY[0x1E0C80A78](v8);
  v13 = (char *)v43 - v12;
  v14 = MEMORY[0x1E0C80A78](v11);
  v16 = (char *)v43 - v15;
  v17 = MEMORY[0x1E0C80A78](v14);
  v19 = (char *)v43 - v18;
  MEMORY[0x1E0C80A78](v17);
  v21 = (char *)v43 - v20;
  if (!objc_msgSend(a1, sel_isGroupConversation))
  {
    String.LocalizationValue.init(stringLiteral:)();
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v10, v3);
    v31 = SLFrameworkBundle();
    static Locale.current.getter();
    v32 = String.init(localized:table:bundle:localization:locale:comment:)();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v10, v3);
    return (id)v32;
  }
  v43[0] = v3;
  v22 = objc_msgSend(a1, sel_groupDisplayName);
  if (!v22)
    goto LABEL_9;
  v23 = v22;
  v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v26 = v25;

  swift_bridgeObjectRelease();
  v27 = HIBYTE(v26) & 0xF;
  if ((v26 & 0x2000000000000000) == 0)
    v27 = v24 & 0xFFFFFFFFFFFFLL;
  if (!v27)
  {
LABEL_9:
    v33 = objc_msgSend(a1, sel_otherRecipientCount);
    v34 = objc_msgSend(v33, sel_unsignedIntegerValue);

    String.LocalizationValue.init(stringLiteral:)();
    if (v34)
    {
      v35 = v43[0];
      (*(void (**)(char *, char *, _QWORD))(v4 + 16))(v19, v21, v43[0]);
      v36 = SLFrameworkBundle();
      static Locale.current.getter();
      String.init(localized:table:bundle:localization:locale:comment:)();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v21, v35);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      v37 = swift_allocObject();
      *(_OWORD *)(v37 + 16) = xmmword_199FA7E60;
      v38 = objc_msgSend(a1, sel_otherRecipientCount);
      v39 = objc_msgSend(v38, sel_unsignedIntegerValue);

      v40 = MEMORY[0x1E0DEBBF8];
      *(_QWORD *)(v37 + 56) = MEMORY[0x1E0DEBB98];
      *(_QWORD *)(v37 + 64) = v40;
      *(_QWORD *)(v37 + 32) = v39;
      v32 = static String.localizedStringWithFormat(_:_:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      v41 = v43[0];
      (*(void (**)(char *, char *, _QWORD))(v4 + 16))(v13, v16, v43[0]);
      v42 = SLFrameworkBundle();
      static Locale.current.getter();
      v32 = String.init(localized:table:bundle:localization:locale:comment:)();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v16, v41);
    }
    return (id)v32;
  }
  result = objc_msgSend(a1, sel_groupDisplayName);
  if (result)
  {
    v29 = result;
    v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();

    return (id)v30;
  }
  else
  {
    __break(1u);
  }
  return result;
}

double _s11SocialLayer36SLHighlightDisambiguationPillMetrics33_C5DA7C7764DCEDFB9B9BF94750149602LLVSgWOi0_(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 2;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  return result;
}

uint64_t outlined init with take of SLHighlightDisambiguationPillMetrics?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SLHighlightDisambiguationPillMetrics?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for DisambiguationPillMetrics()
{
  return objc_opt_self();
}

uint64_t outlined init with copy of HighlightDisambiguationPillMetricVariant(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

ValueMetadata *type metadata accessor for iOSDisambiguationPillMetric()
{
  return &type metadata for iOSDisambiguationPillMetric;
}

ValueMetadata *type metadata accessor for VisionDisambiguationPillMetric()
{
  return &type metadata for VisionDisambiguationPillMetric;
}

_QWORD *initializeBufferWithCopyOfBuffer for MacDisambiguationPillMetric(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  v6 = v4;
  return a1;
}

void destroy for MacDisambiguationPillMetric(id *a1)
{

}

uint64_t assignWithCopy for MacDisambiguationPillMetric(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  return a1;
}

uint64_t assignWithTake for MacDisambiguationPillMetric(uint64_t a1, _OWORD *a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for iOSDisambiguationPillMetric(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for iOSDisambiguationPillMetric(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MacDisambiguationPillMetric()
{
  return &type metadata for MacDisambiguationPillMetric;
}

uint64_t method lookup function for DisambiguationPillMetrics()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DisambiguationPillMetrics.__allocating_init(slotStyle:tag:variant:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

__n128 __swift_memcpy128_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t getEnumTagSinglePayload for SLHighlightDisambiguationPillMetrics(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 128))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 56);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SLHighlightDisambiguationPillMetrics(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 128) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 128) = 0;
    if (a2)
      *(_BYTE *)(result + 56) = a2 + 1;
  }
  return result;
}

void *type metadata accessor for SLHighlightDisambiguationPillMetrics()
{
  return &unk_1E37931A0;
}

uint64_t _s11SocialLayer36SLHighlightDisambiguationPillMetrics33_C5DA7C7764DCEDFB9B9BF94750149602LLVSgWOg(uint64_t a1)
{
  unsigned int v1;
  BOOL v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 56);
  v2 = v1 >= 2;
  v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2)
    return (v3 + 1);
  else
    return 0;
}

CGColorRef static CGColorRef.labelColor(for:)(uint64_t a1)
{
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;

  if (a1)
  {
    v1 = 1.0;
    v2 = 1.0;
    v3 = 1.0;
  }
  else
  {
    v1 = 0.0;
    v2 = 0.0;
    v3 = 0.0;
  }
  return CGColorCreateGenericRGB(v1, v2, v3, 1.0);
}

CGColorRef static CGColorRef.secondaryLabelColor(for:)(uint64_t a1)
{
  CGFloat v1;
  CGFloat v2;

  if (a1)
  {
    v1 = 0.921568627;
    v2 = 0.960784314;
  }
  else
  {
    v1 = 0.235294118;
    v2 = 0.262745098;
  }
  return CGColorCreateGenericRGB(v1, v1, v2, 0.6);
}

BOOL static Platform.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void Platform.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int Platform.hashValue.getter(unsigned __int8 a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance Platform(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Platform()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance Platform()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Platform()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t CollaborationAttributionViewMetricsProviding.platform.getter()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v1 = objc_msgSend(v0, sel_userInterfaceIdiom);

  if ((unint64_t)v1 >= 6)
    return 2;
  else
    return (0x202030102uLL >> (8 * v1));
}

double CollaborationAttributionViewMetricsProviding.placeholderGlyphMinSize.getter(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  v4 = (void *)(*(uint64_t (**)(void))(a2 + 16))();
  v5 = (void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)(a2 + 8) + 8))(a1);
  objc_msgSend(v4, sel_minViableSizeWithStyle_, v5);
  v7 = v6;

  return v7;
}

CTFontRef CollaborationAttributionViewMetricsProviding.baseFont.getter(uint64_t a1, uint64_t a2)
{
  uint64_t inited;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  Class isa;
  void *v11;
  void *v12;
  const __CTFontDescriptor *v13;
  CTFontRef v14;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef : Int])>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_199FA7E60;
  v5 = (void *)*MEMORY[0x1E0CA8418];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CA8418];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Int)>);
  v6 = swift_initStackObject();
  *(_OWORD *)(v6 + 16) = xmmword_199FA7E60;
  v7 = (void *)*MEMORY[0x1E0CA8400];
  *(_QWORD *)(v6 + 32) = *MEMORY[0x1E0CA8400];
  *(_QWORD *)(v6 + 40) = 0x8000;
  v8 = v5;
  v9 = v7;
  *(_QWORD *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v6);
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef : Int]);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t (*)(uint64_t))type metadata accessor for CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v11 = (void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)(a2 + 8) + 8))(a1);
  v12 = (void *)CTContentSizeCategoryForSlotStyle(v11);

  v13 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  v14 = CTFontCreateWithFontDescriptor(v13, 0.0, 0);

  return v14;
}

double CollaborationAttributionViewMetricsProviding.avatarLabelSpace.getter()
{
  return 0.0;
}

double CollaborationAttributionViewMetricsProviding.titleSubtitleSpace.getter()
{
  return 3.0;
}

id CollaborationAttributionViewMetricsProviding.titleAttributedString(for:style:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void (*v22)(char *, uint64_t, uint64_t);
  const __CTFont *v23;
  void *v24;
  id v25;
  void *v26;
  CTFontRef v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGColorRef GenericRGB;
  uint64_t inited;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  const __CTFont *v38;
  id v39;
  CGColor *v40;
  id v41;
  void *v42;
  Class isa;
  uint64_t v45;
  void *v46;
  id v47;

  v9 = *(_QWORD *)(a4 - 8);
  v10 = MEMORY[0x1E0C80A78](a1);
  v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v10);
  v15 = (char *)&v45 - v14;
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v45 - v16;
  v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 40))(v19, v18);
  if (v20)
  {
    v21 = (void *)v20;
    if (String.count.getter() >= 1)
    {
      v45 = a1;
      v22 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
      v22(v17, v4, a4);
      v23 = v21;
      if (swift_dynamicCast())
      {
        v24 = v46;

        v22(v15, v4, a4);
        (*(void (**)(char *, uint64_t))(v9 + 8))(v15, a4);
      }
      else
      {
        v22(v15, v4, a4);
        (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v12, v15, a4);
        if (!swift_dynamicCast())
        {
          v27 = v23;
          if (a3)
            goto LABEL_10;
          goto LABEL_12;
        }
        v26 = v46;

      }
      v27 = specialized static CollaborationAttributionViewMetricsProvider.boldFontWithFont(font:)(v23);

      if (a3)
      {
LABEL_10:
        v28 = 1.0;
        v29 = 1.0;
        v30 = 1.0;
LABEL_13:
        GenericRGB = CGColorCreateGenericRGB(v28, v29, v30, 1.0);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, Any)>);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_199FA7840;
        v33 = (void *)*MEMORY[0x1E0DC1138];
        *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
        type metadata accessor for CTFontRef(0);
        *(_QWORD *)(inited + 40) = v27;
        v34 = (void *)*MEMORY[0x1E0DC1140];
        *(_QWORD *)(inited + 64) = v35;
        *(_QWORD *)(inited + 72) = v34;
        type metadata accessor for CGColorRef(0);
        *(_QWORD *)(inited + 104) = v36;
        *(_QWORD *)(inited + 80) = GenericRGB;
        v37 = v33;
        v38 = v27;
        v39 = v34;
        v40 = GenericRGB;
        specialized Dictionary.init(dictionaryLiteral:)(inited);
        v41 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
        swift_bridgeObjectRetain();
        v42 = (void *)MEMORY[0x19AEC3B6C](v45, a2);
        swift_bridgeObjectRelease();
        type metadata accessor for NSAttributedStringKey(0);
        lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
        isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        v25 = objc_msgSend(v41, sel_initWithString_attributes_, v42, isa);

        return v25;
      }
LABEL_12:
      v28 = 0.0;
      v29 = 0.0;
      v30 = 0.0;
      goto LABEL_13;
    }

  }
  return 0;
}

id CollaborationAttributionViewMetricsProviding.subtitleAttributedString(for:style:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  id v12;
  CGColorRef GenericRGB;
  uint64_t inited;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  CGColor *v22;
  id v23;
  void *v24;
  Class isa;

  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 40))(a4, a5);
  if (!v8)
    return 0;
  v9 = (void *)v8;
  if (String.count.getter() < 1)
  {

    return 0;
  }
  if (a3)
  {
    v10 = 0.921568627;
    v11 = 0.960784314;
  }
  else
  {
    v10 = 0.235294118;
    v11 = 0.262745098;
  }
  GenericRGB = CGColorCreateGenericRGB(v10, v10, v11, 0.6);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_199FA7840;
  v15 = (void *)*MEMORY[0x1E0DC1138];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
  type metadata accessor for CTFontRef(0);
  *(_QWORD *)(inited + 40) = v9;
  v16 = (void *)*MEMORY[0x1E0DC1140];
  *(_QWORD *)(inited + 64) = v17;
  *(_QWORD *)(inited + 72) = v16;
  type metadata accessor for CGColorRef(0);
  *(_QWORD *)(inited + 104) = v18;
  *(_QWORD *)(inited + 80) = GenericRGB;
  v19 = v15;
  v20 = v9;
  v21 = v16;
  v22 = GenericRGB;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  v23 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
  swift_bridgeObjectRetain();
  v24 = (void *)MEMORY[0x19AEC3B6C](a1, a2);
  swift_bridgeObjectRelease();
  type metadata accessor for NSAttributedStringKey(0);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v23, sel_initWithString_attributes_, v24, isa);

  return v12;
}

id CollaborationAttributionViewStandardMetrics.intrinsicHeight.getter(void *a1, void *a2)
{
  const __CFAttributedString *v4;
  const __CFAttributedString *v5;
  CTLineRef v6;
  const __CTLine *TruncatedLineWithTokenHandler;
  const __CFAttributedString *v8;
  const __CFAttributedString *v9;
  CTLineRef v10;
  const __CTLine *v11;
  CGFloat v13[2];

  v13[1] = *(CGFloat *)MEMORY[0x1E0C80C00];
  v4 = (const __CFAttributedString *)specialized CollaborationAttributionViewMetricsProviding.titleAttributedString(for:style:)(0x6C6F686563616C50, 0xEB00000000726564, (uint64_t)objc_msgSend(a1, sel_userInterfaceStyle), a1);
  if (v4)
  {
    v5 = v4;
    v6 = CTLineCreateWithAttributedString(v4);
    TruncatedLineWithTokenHandler = (const __CTLine *)CTLineCreateTruncatedLineWithTokenHandler();

    if (TruncatedLineWithTokenHandler)
    {
      CTLineGetBoundsWithOptions(TruncatedLineWithTokenHandler, 8uLL);
      v13[0] = 0.0;
      CTLineGetTypographicBounds(TruncatedLineWithTokenHandler, 0, v13, 0);

    }
  }
  v8 = (const __CFAttributedString *)specialized CollaborationAttributionViewMetricsProviding.subtitleAttributedString(for:style:)(0x6C6F686563616C50, 0xEB00000000726564, (uint64_t)objc_msgSend(a1, sel_userInterfaceStyle), a1);
  if (v8)
  {
    v9 = v8;
    v10 = CTLineCreateWithAttributedString(v8);
    v11 = (const __CTLine *)CTLineCreateTruncatedLineWithTokenHandler();

    if (v11)
    {
      CTLineGetBoundsWithOptions(v11, 8uLL);
      v13[0] = 0.0;
      CTLineGetTypographicBounds(v11, 0, v13, 0);

    }
  }
  return objc_msgSend(a2, sel_minViableSizeWithStyle_, a1);
}

uint64_t specialized static CollaborationAttributionViewMetricsProvider.singleLineTitle<A>(for:metrics:)(uint64_t a1, uint64_t a2, id a3, void *a4)
{
  const __CFAttributedString *v6;
  const __CFAttributedString *v7;
  CTLineRef v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t TruncatedLineWithTokenHandler;

  v6 = (const __CFAttributedString *)specialized CollaborationAttributionViewMetricsProviding.titleAttributedString(for:style:)(a1, a2, (uint64_t)objc_msgSend(a3, sel_userInterfaceStyle), a3);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = CTLineCreateWithAttributedString(v6);
  v9 = (void *)objc_opt_self();
  v10 = a3;
  v11 = a4;
  v12 = objc_msgSend(v9, sel_currentDevice);
  objc_msgSend(v12, sel_userInterfaceIdiom);

  v13 = v10;
  v14 = v11;
  v15 = objc_msgSend(v9, sel_currentDevice);
  objc_msgSend(v15, sel_userInterfaceIdiom);

  TruncatedLineWithTokenHandler = CTLineCreateTruncatedLineWithTokenHandler();
  return TruncatedLineWithTokenHandler;
}

uint64_t static CollaborationAttributionViewMetricsProvider.singleLineTitle<A>(for:metrics:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return static CollaborationAttributionViewMetricsProvider.singleLineTitle<A>(for:metrics:)(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, id, uint64_t, uint64_t))CollaborationAttributionViewMetricsProviding.titleAttributedString(for:style:));
}

uint64_t static CollaborationAttributionViewMetricsProvider.singleLineSubtitle<A>(for:metrics:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return static CollaborationAttributionViewMetricsProvider.singleLineTitle<A>(for:metrics:)(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, id, uint64_t, uint64_t))CollaborationAttributionViewMetricsProviding.subtitleAttributedString(for:style:));
}

uint64_t static CollaborationAttributionViewMetricsProvider.singleLineTitle<A>(for:metrics:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, id, uint64_t, uint64_t))
{
  uint64_t v11;
  void *v12;
  id v13;
  const __CFAttributedString *v14;
  const __CFAttributedString *v15;
  CTLineRef v16;
  uint64_t TruncatedLineWithTokenHandler;

  v11 = *(_QWORD *)(a5 + 8);
  v12 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(a4, v11);
  v13 = objc_msgSend(v12, sel_userInterfaceStyle);

  v14 = (const __CFAttributedString *)a6(a1, a2, v13, a4, a5);
  if (!v14)
    return 0;
  v15 = v14;
  v16 = CTLineCreateWithAttributedString(v14);
  (*(void (**)(uint64_t, uint64_t))(v11 + 16))(a4, v11);
  (*(void (**)(uint64_t, uint64_t))(a5 + 32))(a4, a5);
  (*(void (**)(uint64_t, uint64_t))(a5 + 48))(a4, a5);
  TruncatedLineWithTokenHandler = CTLineCreateTruncatedLineWithTokenHandler();

  return TruncatedLineWithTokenHandler;
}

CTFontRef protocol witness for CollaborationAttributionViewMetricsProviding.baseFont.getter in conformance CollaborationAttributionViewStandardMetrics()
{
  void **v0;

  return specialized CollaborationAttributionViewMetricsProviding.baseFont.getter(*v0);
}

double protocol witness for CollaborationAttributionViewMetricsProviding.avatarLabelSpace.getter in conformance CollaborationAttributionViewStandardMetrics()
{
  return 10.0;
}

double protocol witness for CollaborationAttributionViewMetricsProviding.titleSubtitleSpace.getter in conformance CollaborationAttributionViewStandardMetrics()
{
  return 3.0;
}

double protocol witness for RemoteViewMetricsProviding.drawingSize() in conformance CollaborationAttributionViewStandardMetrics(uint64_t a1, uint64_t a2)
{
  return protocol witness for RemoteViewMetricsProviding.drawingSize() in conformance CollaborationAttributionViewStandardMetrics(a1, a2, (void (*)(_QWORD, _QWORD, double))CollaborationAttributionViewStandardMetrics.intrinsicHeight.getter);
}

id CollaborationAttributionViewStandardVisionMetrics.intrinsicHeight.getter(void *a1, void *a2)
{
  const __CFAttributedString *v4;
  const __CFAttributedString *v5;
  CTLineRef v6;
  const __CTLine *TruncatedLineWithTokenHandler;
  const __CFAttributedString *v8;
  const __CFAttributedString *v9;
  CTLineRef v10;
  const __CTLine *v11;
  CGFloat v13[2];

  v13[1] = *(CGFloat *)MEMORY[0x1E0C80C00];
  v4 = (const __CFAttributedString *)specialized CollaborationAttributionViewMetricsProviding.titleAttributedString(for:style:)(0x6C6F686563616C50, 0xEB00000000726564, (uint64_t)objc_msgSend(a1, sel_userInterfaceStyle), a1);
  if (v4)
  {
    v5 = v4;
    v6 = CTLineCreateWithAttributedString(v4);
    TruncatedLineWithTokenHandler = (const __CTLine *)CTLineCreateTruncatedLineWithTokenHandler();

    if (TruncatedLineWithTokenHandler)
    {
      CTLineGetBoundsWithOptions(TruncatedLineWithTokenHandler, 8uLL);
      v13[0] = 0.0;
      CTLineGetTypographicBounds(TruncatedLineWithTokenHandler, 0, v13, 0);

    }
  }
  v8 = (const __CFAttributedString *)specialized CollaborationAttributionViewMetricsProviding.subtitleAttributedString(for:style:)(0x6C6F686563616C50, 0xEB00000000726564, (uint64_t)objc_msgSend(a1, sel_userInterfaceStyle), a1);
  if (v8)
  {
    v9 = v8;
    v10 = CTLineCreateWithAttributedString(v8);
    v11 = (const __CTLine *)CTLineCreateTruncatedLineWithTokenHandler();

    if (v11)
    {
      CTLineGetBoundsWithOptions(v11, 8uLL);
      v13[0] = 0.0;
      CTLineGetTypographicBounds(v11, 0, v13, 0);

    }
  }
  return objc_msgSend(a2, sel_minViableSizeWithStyle_, a1);
}

double protocol witness for RemoteViewMetricsProviding.drawingSize() in conformance CollaborationAttributionViewStandardVisionMetrics(uint64_t a1, uint64_t a2)
{
  return protocol witness for RemoteViewMetricsProviding.drawingSize() in conformance CollaborationAttributionViewStandardMetrics(a1, a2, (void (*)(_QWORD, _QWORD, double))CollaborationAttributionViewStandardVisionMetrics.intrinsicHeight.getter);
}

id protocol witness for CollaborationAttributionViewMetricsProviding.placeholderGlyphConfig.getter in conformance CollaborationAttributionViewCompactMetrics()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

id protocol witness for CollaborationAttributionViewMetricsProviding.placeholderGlyphMinSize.getter in conformance CollaborationAttributionViewCompactMetrics()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_minViableSizeWithStyle_, *(_QWORD *)v0);
}

uint64_t protocol witness for CollaborationAttributionViewMetricsProviding.baseFont.getter in conformance CollaborationAttributionViewCompactMetrics()
{
  return 0;
}

double protocol witness for CollaborationAttributionViewMetricsProviding.avatarLabelSpace.getter in conformance CollaborationAttributionViewCompactMetrics()
{
  return 0.0;
}

id protocol witness for RemoteViewMetricsProviding.style.getter in conformance CollaborationAttributionViewCompactMetrics()
{
  id *v0;

  return *v0;
}

double protocol witness for RemoteViewMetricsProviding.maxWidth.getter in conformance CollaborationAttributionViewCompactMetrics()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

double protocol witness for RemoteViewMetricsProviding.drawingSize() in conformance CollaborationAttributionViewCompactMetrics()
{
  uint64_t *v0;
  uint64_t v1;
  double v2;
  void *v3;
  double v4;
  double v5;

  v1 = *v0;
  v2 = *((double *)v0 + 1);
  v3 = (void *)v0[2];
  objc_msgSend(v3, sel_minViableSizeWithStyle_, v1);
  if (v2 > v4)
    v5 = v2;
  else
    v5 = v4;
  objc_msgSend(v3, sel_minViableSizeWithStyle_, v1);
  return v5;
}

double protocol witness for CollaborationAttributionViewMetricsProviding.avatarDiameter.getter in conformance CollaborationAttributionViewCompactVisionMetrics()
{
  uint64_t v0;

  return *(double *)(v0 + 8) + -8.0;
}

double protocol witness for RemoteViewMetricsProviding.drawingSize() in conformance CollaborationAttributionViewCompactVisionMetrics()
{
  uint64_t *v0;
  uint64_t v1;
  double v2;
  void *v3;
  double v4;
  double v5;
  double v6;

  v1 = *v0;
  v2 = *((double *)v0 + 1);
  v3 = (void *)v0[2];
  v4 = v2 + -8.0;
  objc_msgSend(v3, sel_minViableSizeWithStyle_, v1);
  if (v4 > v5)
    v6 = v4;
  else
    v6 = v5;
  objc_msgSend(v3, sel_minViableSizeWithStyle_, v1);
  return v6;
}

id CollaborationAttributionViewConversationMetrics.intrinsicHeight.getter(id a1, void *a2)
{
  const __CTLine *v4;
  const __CTLine *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  CGFloat v11[2];

  v11[1] = *(CGFloat *)MEMORY[0x1E0C80C00];
  v4 = (const __CTLine *)specialized static CollaborationAttributionViewMetricsProvider.singleLineTitle<A>(for:metrics:)(0x6C6F686563616C50, 0xEB00000000726564, a1, a2);
  if (v4)
  {
    v5 = v4;
    CTLineGetBoundsWithOptions(v4, 8uLL);
    v11[0] = 0.0;
    CTLineGetTypographicBounds(v5, 0, v11, 0);

  }
  v6 = (void *)objc_opt_self();
  v7 = a1;
  v8 = a2;
  v9 = objc_msgSend(v6, sel_currentDevice);
  objc_msgSend(v9, sel_userInterfaceIdiom);

  return objc_msgSend(v8, sel_minViableSizeWithStyle_, v7);
}

double protocol witness for CollaborationAttributionViewMetricsProviding.avatarDiameter.getter in conformance CollaborationAttributionViewConversationMetrics()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  double result;

  v1 = *(void **)v0;
  v2 = *(void **)(v0 + 16);
  v3 = (void *)objc_opt_self();
  v4 = v1;
  v5 = v2;
  v6 = objc_msgSend(v3, sel_currentDevice);
  v7 = objc_msgSend(v6, sel_userInterfaceIdiom);

  result = 30.0;
  if (v7 == (id)5)
    return 20.0;
  return result;
}

CTFontRef protocol witness for CollaborationAttributionViewMetricsProviding.baseFont.getter in conformance CollaborationAttributionViewConversationMetrics()
{
  void **v0;

  return specialized CollaborationAttributionViewMetricsProviding.baseFont.getter(*v0);
}

double protocol witness for CollaborationAttributionViewMetricsProviding.avatarLabelSpace.getter in conformance CollaborationAttributionViewConversationMetrics()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  double result;

  v1 = *(void **)v0;
  v2 = *(void **)(v0 + 16);
  v3 = (void *)objc_opt_self();
  v4 = v1;
  v5 = v2;
  v6 = objc_msgSend(v3, sel_currentDevice);
  v7 = objc_msgSend(v6, sel_userInterfaceIdiom);

  result = 10.0;
  if (v7 == (id)5)
    return 8.0;
  return result;
}

double protocol witness for RemoteViewMetricsProviding.drawingSize() in conformance CollaborationAttributionViewConversationMetrics(uint64_t a1, uint64_t a2)
{
  return protocol witness for RemoteViewMetricsProviding.drawingSize() in conformance CollaborationAttributionViewStandardMetrics(a1, a2, (void (*)(_QWORD, _QWORD, double))CollaborationAttributionViewConversationMetrics.intrinsicHeight.getter);
}

id CollaborationAttributionViewConversationVisionMetrics.intrinsicHeight.getter(void *a1, void *a2)
{
  const __CFAttributedString *v4;
  const __CFAttributedString *v5;
  CTLineRef v6;
  const __CTLine *TruncatedLineWithTokenHandler;
  CGFloat v9[2];

  v9[1] = *(CGFloat *)MEMORY[0x1E0C80C00];
  v4 = (const __CFAttributedString *)specialized CollaborationAttributionViewMetricsProviding.titleAttributedString(for:style:)(0x6C6F686563616C50, 0xEB00000000726564, (uint64_t)objc_msgSend(a1, sel_userInterfaceStyle), a1);
  if (v4)
  {
    v5 = v4;
    v6 = CTLineCreateWithAttributedString(v4);
    TruncatedLineWithTokenHandler = (const __CTLine *)CTLineCreateTruncatedLineWithTokenHandler();

    if (TruncatedLineWithTokenHandler)
    {
      CTLineGetBoundsWithOptions(TruncatedLineWithTokenHandler, 8uLL);
      v9[0] = 0.0;
      CTLineGetTypographicBounds(TruncatedLineWithTokenHandler, 0, v9, 0);

    }
  }
  return objc_msgSend(a2, sel_minViableSizeWithStyle_, a1);
}

double protocol witness for CollaborationAttributionViewMetricsProviding.avatarLabelSpace.getter in conformance CollaborationAttributionViewConversationVisionMetrics()
{
  return 13.0;
}

double protocol witness for RemoteViewMetricsProviding.drawingSize() in conformance CollaborationAttributionViewConversationVisionMetrics(uint64_t a1, uint64_t a2)
{
  return protocol witness for RemoteViewMetricsProviding.drawingSize() in conformance CollaborationAttributionViewStandardMetrics(a1, a2, (void (*)(_QWORD, _QWORD, double))CollaborationAttributionViewConversationVisionMetrics.intrinsicHeight.getter);
}

double protocol witness for RemoteViewMetricsProviding.drawingSize() in conformance CollaborationAttributionViewStandardMetrics(uint64_t a1, uint64_t a2, void (*a3)(_QWORD, _QWORD, double))
{
  double *v3;
  double v4;

  v4 = v3[1];
  a3(*(_QWORD *)v3, *((_QWORD *)v3 + 2), v4);
  return v4;
}

id CollaborationAttributionViewMetricsProvider.__allocating_init(slotStyle:tag:)(void *a1, void *a2)
{
  objc_class *v2;
  objc_class *v3;
  id v6;
  id v7;
  double v8;
  double v9;
  id v10;
  id v11;

  v3 = v2;
  v6 = objc_allocWithZone(v3);
  v7 = objc_msgSend(a2, sel_variant);
  objc_msgSend(a2, sel_maxWidth);
  v9 = v8;
  v10 = objc_msgSend(a2, sel_placeholderGlyphConfiguration);
  v11 = objc_msgSend(v6, sel_initWithVariant_slotStyle_maxWidth_placeholderGlyphConfig_, v7, a1, v10, v9);

  return v11;
}

id CollaborationAttributionViewMetricsProvider.init(slotStyle:tag:)(void *a1, id a2)
{
  void *v2;
  id v5;
  double v6;
  double v7;
  id v8;
  id v9;

  v5 = objc_msgSend(a2, sel_variant);
  objc_msgSend(a2, sel_maxWidth);
  v7 = v6;
  v8 = objc_msgSend(a2, sel_placeholderGlyphConfiguration);
  v9 = objc_msgSend(v2, sel_initWithVariant_slotStyle_maxWidth_placeholderGlyphConfig_, v5, a1, v8, v7);

  return v9;
}

uint64_t CollaborationAttributionViewMetricsProvider.__allocating_init(variant:slotStyle:maxWidth:placeholderGlyphConfig:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  objc_class *v4;
  char *v9;
  uint64_t v10;
  void *v11;
  _UNKNOWN **v12;
  char *v13;
  uint64_t result;
  void *v15;
  id v16;
  objc_super v17;

  v9 = (char *)objc_allocWithZone(v4);
  switch(a1)
  {
    case 0:
      v10 = OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics;
      v11 = &unk_1E3793420;
      v12 = &protocol witness table for CollaborationAttributionViewStandardMetrics;
      goto LABEL_8;
    case 1:
      v10 = OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics;
      v11 = &unk_1E3793338;
      v12 = &protocol witness table for CollaborationAttributionViewCompactMetrics;
      goto LABEL_8;
    case 2:
      v10 = OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics;
      v11 = &unk_1E3793508;
      v12 = &protocol witness table for CollaborationAttributionViewConversationMetrics;
      goto LABEL_8;
    case 3:
      v10 = OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics;
      v11 = &unk_1E37936D8;
      v12 = &protocol witness table for CollaborationAttributionViewStandardVisionMetrics;
      goto LABEL_8;
    case 4:
      v10 = OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics;
      v11 = &unk_1E37935F0;
      v12 = &protocol witness table for CollaborationAttributionViewCompactVisionMetrics;
      goto LABEL_8;
    case 5:
      v10 = OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics;
      v11 = &unk_1E37937C0;
      v12 = &protocol witness table for CollaborationAttributionViewConversationVisionMetrics;
LABEL_8:
      v13 = &v9[v10];
      *((_QWORD *)v13 + 3) = v11;
      *((_QWORD *)v13 + 4) = v12;
      *(_QWORD *)v13 = a2;
      *((double *)v13 + 1) = a4;
      *((_QWORD *)v13 + 2) = a3;
      v17.receiver = v9;
      v17.super_class = v4;
      result = (uint64_t)objc_msgSendSuper2(&v17, sel_init);
      break;
    default:
      v15 = v9;
      type metadata accessor for SLCollaborationAttributionViewMetricVariant(0);
      v16 = v15;
      result = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
      __break(1u);
      break;
  }
  return result;
}

uint64_t CollaborationAttributionViewMetricsProvider.init(variant:slotStyle:maxWidth:placeholderGlyphConfig:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  char *v4;
  uint64_t v5;
  void *v6;
  _UNKNOWN **v7;
  char *v8;
  uint64_t result;
  char *v10;
  objc_super v11;

  switch(a1)
  {
    case 0:
      v5 = OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics;
      v6 = &unk_1E3793420;
      v7 = &protocol witness table for CollaborationAttributionViewStandardMetrics;
      goto LABEL_8;
    case 1:
      v5 = OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics;
      v6 = &unk_1E3793338;
      v7 = &protocol witness table for CollaborationAttributionViewCompactMetrics;
      goto LABEL_8;
    case 2:
      v5 = OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics;
      v6 = &unk_1E3793508;
      v7 = &protocol witness table for CollaborationAttributionViewConversationMetrics;
      goto LABEL_8;
    case 3:
      v5 = OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics;
      v6 = &unk_1E37936D8;
      v7 = &protocol witness table for CollaborationAttributionViewStandardVisionMetrics;
      goto LABEL_8;
    case 4:
      v5 = OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics;
      v6 = &unk_1E37935F0;
      v7 = &protocol witness table for CollaborationAttributionViewCompactVisionMetrics;
      goto LABEL_8;
    case 5:
      v5 = OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics;
      v6 = &unk_1E37937C0;
      v7 = &protocol witness table for CollaborationAttributionViewConversationVisionMetrics;
LABEL_8:
      v8 = &v4[v5];
      *((_QWORD *)v8 + 3) = v6;
      *((_QWORD *)v8 + 4) = v7;
      *(_QWORD *)v8 = a2;
      *((double *)v8 + 1) = a4;
      *((_QWORD *)v8 + 2) = a3;
      v11.receiver = v4;
      v11.super_class = (Class)type metadata accessor for CollaborationAttributionViewMetricsProvider();
      result = (uint64_t)objc_msgSendSuper2(&v11, sel_init);
      break;
    default:
      type metadata accessor for SLCollaborationAttributionViewMetricVariant(0);
      v10 = v4;
      result = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
      __break(1u);
      break;
  }
  return result;
}

uint64_t type metadata accessor for CollaborationAttributionViewMetricsProvider()
{
  return objc_opt_self();
}

id CollaborationAttributionViewMetricsProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CollaborationAttributionViewMetricsProvider.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CollaborationAttributionViewMetricsProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CollaborationAttributionViewMetricsProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t CollaborationAttributionViewMetricsProvider.drawingSize.getter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (_QWORD *)(v0 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics + 24);
  v3 = *(_QWORD *)(v0 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics + 32);
  __swift_project_boxed_opaque_existential_1(v1, v2);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 8) + 24))(v2);
}

uint64_t CollaborationAttributionViewMetricsProvider.avatarDiameter.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics + 24);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics), v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 32))(v1, v2);
}

uint64_t CollaborationAttributionViewMetricsProvider.avatarLabelSpace.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics + 24);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics), v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 48))(v1, v2);
}

uint64_t CollaborationAttributionViewMetricsProvider.titleSubtitleSpace.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics + 24);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics), v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 56))(v1, v2);
}

CTLineRef_optional __swiftcall CollaborationAttributionViewMetricsProvider.singleLineTitle(for:)(Swift::String a1)
{
  return (CTLineRef_optional)CollaborationAttributionViewMetricsProvider.singleLineTitle(for:)(a1._countAndFlagsBits, (uint64_t)a1._object, (uint64_t (*)(uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t))static CollaborationAttributionViewMetricsProvider.singleLineTitle<A>(for:metrics:));
}

CTLineRef_optional __swiftcall CollaborationAttributionViewMetricsProvider.singleLineSubtitle(for:)(Swift::String a1)
{
  return (CTLineRef_optional)CollaborationAttributionViewMetricsProvider.singleLineTitle(for:)(a1._countAndFlagsBits, (uint64_t)a1._object, (uint64_t (*)(uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t))static CollaborationAttributionViewMetricsProvider.singleLineSubtitle<A>(for:metrics:));
}

uint64_t CollaborationAttributionViewMetricsProvider.singleLineTitle(for:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t))
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v7 = (_QWORD *)(v3 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics);
  v8 = *(_QWORD *)(v3 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics + 24);
  v9 = v7[4];
  v10 = __swift_project_boxed_opaque_existential_1(v7, v8);
  type metadata accessor for CollaborationAttributionViewMetricsProvider();
  return a3(a1, a2, v10, v8, v9);
}

unint64_t lazy protocol witness table accessor for type Platform and conformance Platform()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Platform and conformance Platform;
  if (!lazy protocol witness table cache variable for type Platform and conformance Platform)
  {
    result = MEMORY[0x19AEC4E20](&protocol conformance descriptor for Platform, &type metadata for Platform);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Platform and conformance Platform);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Platform(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for Platform(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_199F6F63C + 4 * byte_199FA8001[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_199F6F670 + 4 * byte_199FA7FFC[v4]))();
}

uint64_t sub_199F6F670(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_199F6F678(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x199F6F680);
  return result;
}

uint64_t sub_199F6F68C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x199F6F694);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_199F6F698(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_199F6F6A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for Platform(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for Platform(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Platform()
{
  return &type metadata for Platform;
}

uint64_t dispatch thunk of RemoteViewMetricsProviding.style.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of RemoteViewMetricsProviding.maxWidth.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of RemoteViewMetricsProviding.drawingSize()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of CollaborationAttributionViewMetricsProviding.placeholderGlyphConfig.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of CollaborationAttributionViewMetricsProviding.avatarDiameter.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of CollaborationAttributionViewMetricsProviding.baseFont.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of CollaborationAttributionViewMetricsProviding.avatarLabelSpace.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of CollaborationAttributionViewMetricsProviding.titleSubtitleSpace.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t method lookup function for CollaborationAttributionViewMetricsProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CollaborationAttributionViewMetricsProvider.__allocating_init(variant:slotStyle:maxWidth:placeholderGlyphConfig:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

id @objc CollaborationAttributionViewMetricsProvider.singleLineTitle(for:)(char *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  char *v12;
  void *v13;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  v9 = *(_QWORD *)&a1[OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics + 24];
  v10 = *(_QWORD *)&a1[OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics + 32];
  v11 = __swift_project_boxed_opaque_existential_1(&a1[OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics], v9);
  type metadata accessor for CollaborationAttributionViewMetricsProvider();
  v12 = a1;
  v13 = (void *)a4(v6, v8, v11, v9, v10);

  swift_bridgeObjectRelease();
  return v13;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *type metadata accessor for CollaborationAttributionViewStandardMetrics()
{
  return &unk_1E3793420;
}

_QWORD *initializeBufferWithCopyOfBuffer for CollaborationAttributionViewCompactMetrics(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = *(void **)(a2 + 16);
  a1[2] = v5;
  v6 = v3;
  v7 = v5;
  return a1;
}

void destroy for CollaborationAttributionViewCompactMetrics(id *a1)
{

}

void *type metadata accessor for CollaborationAttributionViewCompactMetrics()
{
  return &unk_1E3793338;
}

void *type metadata accessor for CollaborationAttributionViewConversationMetrics()
{
  return &unk_1E3793508;
}

void *type metadata accessor for CollaborationAttributionViewStandardVisionMetrics()
{
  return &unk_1E37936D8;
}

void *type metadata accessor for CollaborationAttributionViewCompactVisionMetrics()
{
  return &unk_1E37935F0;
}

uint64_t assignWithCopy for CollaborationAttributionViewStandardMetrics(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v7 = *(void **)(a2 + 16);
  v8 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v7;
  v9 = v7;

  return a1;
}

uint64_t assignWithTake for CollaborationAttributionViewStandardMetrics(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  v5 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = a2[2];

  return a1;
}

uint64_t getEnumTagSinglePayload for CollaborationAttributionViewStandardMetrics(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CollaborationAttributionViewStandardMetrics(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void *type metadata accessor for CollaborationAttributionViewConversationVisionMetrics()
{
  return &unk_1E37937C0;
}

CTFontRef specialized static CollaborationAttributionViewMetricsProvider.boldFontWithFont(font:)(const __CTFont *a1)
{
  uint64_t inited;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  const __CFDictionary *isa;
  const __CTFontDescriptor *v9;
  const __CTFontDescriptor *CopyWithAttributes;
  CTFontRef v11;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef : Int])>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_199FA7E60;
  v3 = (void *)*MEMORY[0x1E0CA8418];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CA8418];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Int)>);
  v4 = swift_initStackObject();
  *(_OWORD *)(v4 + 16) = xmmword_199FA7E60;
  v5 = (void *)*MEMORY[0x1E0CA8400];
  *(_QWORD *)(v4 + 32) = *MEMORY[0x1E0CA8400];
  *(_QWORD *)(v4 + 40) = 32770;
  v6 = v3;
  v7 = v5;
  *(_QWORD *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v4);
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef : Int]);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t (*)(uint64_t))type metadata accessor for CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v9 = CTFontCopyFontDescriptor(a1);
  CopyWithAttributes = CTFontDescriptorCreateCopyWithAttributes(v9, isa);
  v11 = CTFontCreateWithFontDescriptor(CopyWithAttributes, 0.0, 0);

  return v11;
}

id specialized CollaborationAttributionViewMetricsProviding.titleAttributedString(for:style:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  CTFontRef v7;
  CTFontRef v8;
  const __CTFont *v9;
  CTFontRef v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  id v14;
  CGColorRef GenericRGB;
  uint64_t inited;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  const __CTFont *v22;
  id v23;
  CGColor *v24;
  id v25;
  void *v26;
  Class isa;

  v7 = specialized CollaborationAttributionViewMetricsProviding.baseFont.getter(a4);
  if (!v7)
    return 0;
  v8 = v7;
  if (String.count.getter() <= 0)
  {

    return 0;
  }
  else
  {
    v9 = v8;
    v10 = specialized static CollaborationAttributionViewMetricsProvider.boldFontWithFont(font:)(v9);

    if (a3)
    {
      v11 = 1.0;
      v12 = 1.0;
      v13 = 1.0;
    }
    else
    {
      v11 = 0.0;
      v12 = 0.0;
      v13 = 0.0;
    }
    GenericRGB = CGColorCreateGenericRGB(v11, v12, v13, 1.0);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, Any)>);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_199FA7840;
    v17 = (void *)*MEMORY[0x1E0DC1138];
    *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
    type metadata accessor for CTFontRef(0);
    *(_QWORD *)(inited + 40) = v10;
    v18 = (void *)*MEMORY[0x1E0DC1140];
    *(_QWORD *)(inited + 64) = v19;
    *(_QWORD *)(inited + 72) = v18;
    type metadata accessor for CGColorRef(0);
    *(_QWORD *)(inited + 104) = v20;
    *(_QWORD *)(inited + 80) = GenericRGB;
    v21 = v17;
    v22 = v10;
    v23 = v18;
    v24 = GenericRGB;
    specialized Dictionary.init(dictionaryLiteral:)(inited);
    v25 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
    swift_bridgeObjectRetain();
    v26 = (void *)MEMORY[0x19AEC3B6C](a1, a2);
    swift_bridgeObjectRelease();
    type metadata accessor for NSAttributedStringKey(0);
    lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v14 = objc_msgSend(v25, sel_initWithString_attributes_, v26, isa);

  }
  return v14;
}

{
  CTFontRef v7;
  CTFontRef v8;
  const __CTFont *v9;
  CTFontRef v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  id v14;
  CGColorRef GenericRGB;
  uint64_t inited;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  const __CTFont *v22;
  id v23;
  CGColor *v24;
  id v25;
  void *v26;
  Class isa;

  v7 = specialized CollaborationAttributionViewMetricsProviding.baseFont.getter(a4);
  if (!v7)
    return 0;
  v8 = v7;
  if (String.count.getter() <= 0)
  {

    return 0;
  }
  else
  {
    v9 = v8;
    v10 = specialized static CollaborationAttributionViewMetricsProvider.boldFontWithFont(font:)(v9);

    if (a3)
    {
      v11 = 1.0;
      v12 = 1.0;
      v13 = 1.0;
    }
    else
    {
      v11 = 0.0;
      v12 = 0.0;
      v13 = 0.0;
    }
    GenericRGB = CGColorCreateGenericRGB(v11, v12, v13, 1.0);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, Any)>);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_199FA7840;
    v17 = (void *)*MEMORY[0x1E0DC1138];
    *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
    type metadata accessor for CTFontRef(0);
    *(_QWORD *)(inited + 40) = v10;
    v18 = (void *)*MEMORY[0x1E0DC1140];
    *(_QWORD *)(inited + 64) = v19;
    *(_QWORD *)(inited + 72) = v18;
    type metadata accessor for CGColorRef(0);
    *(_QWORD *)(inited + 104) = v20;
    *(_QWORD *)(inited + 80) = GenericRGB;
    v21 = v17;
    v22 = v10;
    v23 = v18;
    v24 = GenericRGB;
    specialized Dictionary.init(dictionaryLiteral:)(inited);
    v25 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
    swift_bridgeObjectRetain();
    v26 = (void *)MEMORY[0x19AEC3B6C](a1, a2);
    swift_bridgeObjectRelease();
    type metadata accessor for NSAttributedStringKey(0);
    lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v14 = objc_msgSend(v25, sel_initWithString_attributes_, v26, isa);

  }
  return v14;
}

{
  CTFontRef v7;
  CTFontRef v8;
  const __CTFont *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  id v13;
  CGColorRef GenericRGB;
  uint64_t inited;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const __CTFont *v20;
  id v21;
  id v22;
  CGColor *v23;
  id v24;
  void *v25;
  Class isa;

  v7 = specialized CollaborationAttributionViewMetricsProviding.baseFont.getter(a4);
  if (!v7)
    return 0;
  v8 = v7;
  if (String.count.getter() <= 0)
  {

    return 0;
  }
  else
  {
    v9 = v8;
    if (a3)
    {
      v10 = 1.0;
      v11 = 1.0;
      v12 = 1.0;
    }
    else
    {
      v10 = 0.0;
      v11 = 0.0;
      v12 = 0.0;
    }
    GenericRGB = CGColorCreateGenericRGB(v10, v11, v12, 1.0);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, Any)>);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_199FA7840;
    v16 = (void *)*MEMORY[0x1E0DC1138];
    *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
    type metadata accessor for CTFontRef(0);
    *(_QWORD *)(inited + 40) = v9;
    v17 = (void *)*MEMORY[0x1E0DC1140];
    *(_QWORD *)(inited + 64) = v18;
    *(_QWORD *)(inited + 72) = v17;
    type metadata accessor for CGColorRef(0);
    *(_QWORD *)(inited + 104) = v19;
    *(_QWORD *)(inited + 80) = GenericRGB;
    v20 = v9;
    v21 = v16;
    v22 = v17;
    v23 = GenericRGB;
    specialized Dictionary.init(dictionaryLiteral:)(inited);
    v24 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
    swift_bridgeObjectRetain();
    v25 = (void *)MEMORY[0x19AEC3B6C](a1, a2);
    swift_bridgeObjectRelease();
    type metadata accessor for NSAttributedStringKey(0);
    lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v13 = objc_msgSend(v24, sel_initWithString_attributes_, v25, isa);

  }
  return v13;
}

CTFontRef specialized CollaborationAttributionViewMetricsProviding.baseFont.getter(void *a1)
{
  uint64_t inited;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  Class isa;
  void *v9;
  const __CTFontDescriptor *v10;
  CTFontRef v11;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef : Int])>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_199FA7E60;
  v3 = (void *)*MEMORY[0x1E0CA8418];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CA8418];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Int)>);
  v4 = swift_initStackObject();
  *(_OWORD *)(v4 + 16) = xmmword_199FA7E60;
  v5 = (void *)*MEMORY[0x1E0CA8400];
  *(_QWORD *)(v4 + 32) = *MEMORY[0x1E0CA8400];
  *(_QWORD *)(v4 + 40) = 0x8000;
  v6 = v3;
  v7 = v5;
  *(_QWORD *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v4);
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef : Int]);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t (*)(uint64_t))type metadata accessor for CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v9 = (void *)CTContentSizeCategoryForSlotStyle(a1);
  v10 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  v11 = CTFontCreateWithFontDescriptor(v10, 0.0, 0);

  return v11;
}

id specialized CollaborationAttributionViewMetricsProviding.subtitleAttributedString(for:style:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  CTFontRef v7;
  CTFontRef v8;
  CGFloat v9;
  CGFloat v10;
  id v11;
  CGColorRef GenericRGB;
  uint64_t inited;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const __CTFont *v19;
  id v20;
  CGColor *v21;
  id v22;
  void *v23;
  Class isa;

  v7 = specialized CollaborationAttributionViewMetricsProviding.baseFont.getter(a4);
  if (!v7)
    return 0;
  v8 = v7;
  if (String.count.getter() < 1)
  {

    return 0;
  }
  else
  {
    if (a3)
    {
      v9 = 0.921568627;
      v10 = 0.960784314;
    }
    else
    {
      v9 = 0.235294118;
      v10 = 0.262745098;
    }
    GenericRGB = CGColorCreateGenericRGB(v9, v9, v10, 0.6);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, Any)>);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_199FA7840;
    v14 = (void *)*MEMORY[0x1E0DC1138];
    *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
    type metadata accessor for CTFontRef(0);
    *(_QWORD *)(inited + 40) = v8;
    v15 = (void *)*MEMORY[0x1E0DC1140];
    *(_QWORD *)(inited + 64) = v16;
    *(_QWORD *)(inited + 72) = v15;
    type metadata accessor for CGColorRef(0);
    *(_QWORD *)(inited + 104) = v17;
    *(_QWORD *)(inited + 80) = GenericRGB;
    v18 = v14;
    v19 = v8;
    v20 = v15;
    v21 = GenericRGB;
    specialized Dictionary.init(dictionaryLiteral:)(inited);
    v22 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
    swift_bridgeObjectRetain();
    v23 = (void *)MEMORY[0x19AEC3B6C](a1, a2);
    swift_bridgeObjectRelease();
    type metadata accessor for NSAttributedStringKey(0);
    lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v11 = objc_msgSend(v22, sel_initWithString_attributes_, v23, isa);

  }
  return v11;
}

id CollaborationAttributionView.init(highlight:variant:)(void *a1, uint64_t a2)
{
  id v3;

  v3 = specialized CollaborationAttributionView.init(highlight:variant:)(a1, a2);

  return v3;
}

uint64_t CollaborationAttributionView.delegate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SLCollaborationAttributionView_delegate;
  swift_beginAccess();
  return MEMORY[0x19AEC4F4C](v1);
}

uint64_t CollaborationAttributionView.delegate.setter()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*CollaborationAttributionView.delegate.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___SLCollaborationAttributionView_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x19AEC4F4C](v5);
  return CollaborationAttributionView.delegate.modify;
}

void CollaborationAttributionView.delegate.modify(void **a1, char a2)
{
  void *v3;

  v3 = *a1;
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t CollaborationAttributionView.remoteContentDidLoad.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___SLCollaborationAttributionView_remoteContentDidLoad);
  swift_beginAccess();
  v2 = *v1;
  outlined copy of (@escaping @callee_guaranteed () -> ())?(*v1);
  return v2;
}

uint64_t CollaborationAttributionView.remoteContentDidLoad.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;

  v5 = (uint64_t *)(v2 + OBJC_IVAR___SLCollaborationAttributionView_remoteContentDidLoad);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  return outlined consume of (@escaping @callee_guaranteed () -> ())?(v6);
}

uint64_t (*CollaborationAttributionView.remoteContentDidLoad.modify())()
{
  swift_beginAccess();
  return CollaborationAttributionView.remoteContentDidLoad.modify;
}

void *CollaborationAttributionView.highlight.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___SLCollaborationAttributionView_highlight);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void CollaborationAttributionView.highlight.setter(void *a1)
{
  char *v1;
  char *v2;
  void **v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  char v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v2 = v1;
  v4 = (void **)&v2[OBJC_IVAR___SLCollaborationAttributionView_highlight];
  swift_beginAccess();
  v5 = *v4;
  *v4 = a1;
  v6 = a1;
  if (!a1)
  {
    if (!v5)
    {
LABEL_15:
      v7 = v5;
      goto LABEL_16;
    }
LABEL_6:
    v10 = CollaborationAttributionView.minViableGlyphSize()();
    if (*(_QWORD *)&v2[OBJC_IVAR___SLCollaborationAttributionView_variant] == 4)
      v11 = 44.0;
    else
      v11 = 0.0;
    objc_msgSend(v2, sel_bounds);
    if (v12 > v10)
      v13 = v12;
    else
      v13 = v10;
    if (v13 <= v11)
      v13 = v11;
    objc_msgSend(v2, sel_setMaxWidth_, v13);
    v14 = objc_msgSend(v2, sel_slotView);
    objc_msgSend(v14, sel__updateContent);

    objc_msgSend(v2, sel_invalidateIntrinsicContentSize);
    goto LABEL_15;
  }
  if (!v5)
    goto LABEL_6;
  type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for SLHighlight);
  v7 = v5;
  v8 = v6;
  v9 = static NSObject.== infix(_:_:)();

  if ((v9 & 1) == 0)
    goto LABEL_6;
LABEL_16:

}

void (*CollaborationAttributionView.highlight.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void **v5;
  void *v6;
  id v7;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___SLCollaborationAttributionView_highlight;
  v3[4] = v1;
  v3[5] = v4;
  v5 = (void **)(v1 + v4);
  swift_beginAccess();
  v6 = *v5;
  v3[3] = *v5;
  v7 = v6;
  return CollaborationAttributionView.highlight.modify;
}

void CollaborationAttributionView.highlight.modify(uint64_t a1, char a2)
{
  _QWORD *v2;
  void *v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  id v13;
  id v14;
  char v15;
  char *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  char *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;

  v2 = *(_QWORD **)a1;
  v4 = (void **)(*(_QWORD *)a1 + 24);
  v3 = *v4;
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v7 = *(void **)(v6 + v5);
  *(_QWORD *)(v6 + v5) = *v4;
  if ((a2 & 1) != 0)
  {
    v8 = v3;
    if (v3)
    {
      if (v7)
      {
        type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for SLHighlight);
        v9 = v7;
        v10 = v8;
        v11 = static NSObject.== infix(_:_:)();

        if ((v11 & 1) != 0)
          goto LABEL_21;
      }
    }
    else if (!v7)
    {
LABEL_20:
      v9 = v7;
LABEL_21:

      v12 = *v4;
      goto LABEL_33;
    }
    v16 = (char *)v2[4];
    v17 = CollaborationAttributionView.minViableGlyphSize()();
    if (*(_QWORD *)&v16[OBJC_IVAR___SLCollaborationAttributionView_variant] == 4)
      v18 = 44.0;
    else
      v18 = 0.0;
    objc_msgSend(v16, sel_bounds);
    if (v19 > v17)
      v20 = v19;
    else
      v20 = v17;
    if (v20 <= v18)
      v20 = v18;
    objc_msgSend(v16, sel_setMaxWidth_, v20);
    v21 = objc_msgSend(v16, sel_slotView);
    objc_msgSend(v21, sel__updateContent);

    objc_msgSend(v16, sel_invalidateIntrinsicContentSize);
    goto LABEL_20;
  }
  v12 = v3;
  if (!v3)
  {
    if (!v7)
    {
LABEL_32:

      goto LABEL_33;
    }
LABEL_23:
    v22 = (char *)v2[4];
    v23 = CollaborationAttributionView.minViableGlyphSize()();
    if (*(_QWORD *)&v22[OBJC_IVAR___SLCollaborationAttributionView_variant] == 4)
      v24 = 44.0;
    else
      v24 = 0.0;
    objc_msgSend(v22, sel_bounds);
    if (v25 > v23)
      v26 = v25;
    else
      v26 = v23;
    if (v26 <= v24)
      v26 = v24;
    objc_msgSend(v22, sel_setMaxWidth_, v26);
    v27 = objc_msgSend(v22, sel_slotView);
    objc_msgSend(v27, sel__updateContent);

    objc_msgSend(v22, sel_invalidateIntrinsicContentSize);
    goto LABEL_32;
  }
  if (!v7)
    goto LABEL_23;
  type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for SLHighlight);
  v13 = v7;
  v14 = v12;
  v15 = static NSObject.== infix(_:_:)();

  if ((v15 & 1) == 0)
    goto LABEL_23;

  v12 = v14;
LABEL_33:

  free(v2);
}

uint64_t CollaborationAttributionView.title.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___SLCollaborationAttributionView_title);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t CollaborationAttributionView.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR___SLCollaborationAttributionView_title);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*CollaborationAttributionView.title.modify())()
{
  swift_beginAccess();
  return CollaborationAttributionView.title.modify;
}

uint64_t CollaborationAttributionView.automaticallyAdjustsMaxWidthToFitBounds.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SLCollaborationAttributionView_automaticallyAdjustsMaxWidthToFitBounds);
  swift_beginAccess();
  return *v1;
}

id CollaborationAttributionView.automaticallyAdjustsMaxWidthToFitBounds.setter(char a1)
{
  char *v1;
  char *v3;
  id result;
  char v5;

  v3 = &v1[OBJC_IVAR___SLCollaborationAttributionView_automaticallyAdjustsMaxWidthToFitBounds];
  result = (id)swift_beginAccess();
  v5 = *v3;
  *v3 = a1;
  if ((v5 & 1) == 0 && (a1 & 1) != 0)
    return objc_msgSend(v1, sel_setNeedsLayout);
  return result;
}

void (*CollaborationAttributionView.automaticallyAdjustsMaxWidthToFitBounds.modify(_QWORD *a1))(id **a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  _BYTE *v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___SLCollaborationAttributionView_automaticallyAdjustsMaxWidthToFitBounds;
  v3[3] = v1;
  v3[4] = v4;
  v5 = (_BYTE *)(v1 + v4);
  swift_beginAccess();
  *((_BYTE *)v3 + 40) = *v5;
  return CollaborationAttributionView.automaticallyAdjustsMaxWidthToFitBounds.modify;
}

void CollaborationAttributionView.automaticallyAdjustsMaxWidthToFitBounds.modify(id **a1)
{
  id *v1;
  _BYTE *v2;
  id v3;
  int v4;
  char v5;

  v1 = *a1;
  v3 = (*a1)[3];
  v2 = (*a1)[4];
  v4 = *((unsigned __int8 *)*a1 + 40);
  v5 = v2[(_QWORD)v3];
  v2[(_QWORD)v3] = v4;
  if ((v5 & 1) == 0 && v4)
    objc_msgSend(v1[3], sel_setNeedsLayout);
  free(v1);
}

double CollaborationAttributionView.minViableGlyphSize()()
{
  char *v0;
  id v1;
  void *v2;
  id v3;
  double v4;
  double v5;
  id v6;
  double v7;
  double v8;
  id v9;
  id v10;
  _BOOL8 v11;
  id v12;
  id v13;
  double v14;

  v1 = objc_msgSend(v0, sel_lastRenderedSlotStyle);
  if (v1)
  {
    v2 = v1;
    v3 = *(id *)&v0[OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration];
    objc_msgSend(v3, sel_minViableSizeWithStyle_, v2);
    v5 = v4;

  }
  else
  {
    v6 = objc_msgSend(v0, sel_traitCollection);
    objc_msgSend(v6, sel_displayScale);
    v8 = v7;

    v9 = objc_msgSend(v0, sel_traitCollection);
    v10 = objc_msgSend(v9, sel_layoutDirection);

    v11 = v10 == (id)1;
    v12 = objc_msgSend(v0, sel_traitCollection);
    v13 = objc_msgSend(v12, sel_userInterfaceStyle);

    objc_msgSend(*(id *)&v0[OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration], sel_minViableSizeWithDisplayScale_RTL_darkMode_, v11, v13 == (id)2, v8);
    return v14;
  }
  return v5;
}

id CollaborationAttributionView.updatePlaceholderSymbol(scale:weight:pointSize:)(uint64_t a1, uint64_t a2, double a3)
{
  char *v3;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;

  if ((unint64_t)(a1 - 1) >= 3)
    v6 = 0;
  else
    v6 = a1;
  v7 = objc_allocWithZone((Class)SLDImageSymbolConfiguration);
  v8 = (void *)MEMORY[0x19AEC3B6C](0xD000000000000022, 0x8000000199FB02A0);
  v9 = objc_msgSend(v7, sel_initWithName_coreUISize_weight_pointSize_, v8, v6, a2, a3);

  v10 = *(void **)&v3[OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration];
  *(_QWORD *)&v3[OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration] = v9;
  v11 = v9;
  CollaborationAttributionView.placeholderGlyphConfiguration.didset();

  v12 = CollaborationAttributionView.minViableGlyphSize()();
  v13 = 44.0;
  if (*(_QWORD *)&v3[OBJC_IVAR___SLCollaborationAttributionView_variant] != 4)
    v13 = 0.0;
  if (v12 > v13)
    v14 = v12;
  else
    v14 = v13;
  objc_msgSend(v3, sel_maxWidth);
  if (v14 > v15)
    v15 = v14;
  return objc_msgSend(v3, sel_setMaxWidth_, v15);
}

void CollaborationAttributionView._renderRemoteContent(forLayerContextID:style:forTitle:maxWidth:attributionIdentifiers:usingService:yield:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, double a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t ObjectType;
  id v17;
  void *v18;
  Class isa;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  _QWORD aBlock[6];

  ObjectType = swift_getObjectType();
  v17 = *(id *)(v9 + OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration);
  v18 = (void *)MEMORY[0x19AEC3B6C](a3, a4);
  isa = Array._bridgeToObjectiveC()().super.isa;
  v20 = *(_QWORD *)(v9 + OBJC_IVAR___SLCollaborationAttributionView_variant);
  v21 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = v21;
  *(_QWORD *)(v22 + 24) = a2;
  *(double *)(v22 + 32) = a5;
  *(_QWORD *)(v22 + 40) = a8;
  *(_QWORD *)(v22 + 48) = a9;
  *(_QWORD *)(v22 + 56) = ObjectType;
  aBlock[4] = partial apply for closure #1 in CollaborationAttributionView._renderRemoteContent(forLayerContextID:style:forTitle:maxWidth:attributionIdentifiers:usingService:yield:);
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed UISSlotRemoteContent?) -> ();
  aBlock[3] = &block_descriptor_21;
  v23 = _Block_copy(aBlock);
  v24 = v17;
  v25 = a2;
  swift_retain();
  swift_release();
  objc_msgSend(a7, sel_collaborationAttributionViewForTitle_attributionIdentifiers_style_placeholderGlyphConfiguration_maxWidth_variant_layerContextID_reply_, v18, isa, v25, v24, v20, a1, a5, v23);
  _Block_release(v23);

}

double CollaborationAttributionView.expectedHeight(for:)(double a1)
{
  char *v1;
  double Width;
  id v4;
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  CGRect v11;

  objc_msgSend(v1, sel_frame);
  Width = CGRectGetWidth(v11);
  if (SL_CGFloatApproximatelyEqualToFloat(a1, Width)
    || (v4 = objc_msgSend(v1, sel_lastRenderedSlotStyle)) == 0)
  {
    v5 = objc_msgSend(v1, sel_slotView);
    objc_msgSend(v5, sel_intrinsicContentSize);
    v8 = v9;
  }
  else
  {
    v5 = v4;
    v6 = objc_msgSend(objc_allocWithZone((Class)SLDCollaborationAttributionViewEmptySlotContent), sel_initWithStyle_variant_maxWidth_placeholderGlyphConfig_forRemote_, v4, *(_QWORD *)&v1[OBJC_IVAR___SLCollaborationAttributionView_variant], *(_QWORD *)&v1[OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration], 0, a1);
    objc_msgSend(v6, sel_contentSize);
    v8 = v7;

  }
  return v8;
}

uint64_t key path getter for CollaborationAttributionView.remoteContentDidLoad : CollaborationAttributionView@<X0>(_QWORD **a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0xA0))();
  if (result)
  {
    v5 = result;
    v6 = v4;
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v5;
    *(_QWORD *)(result + 24) = v6;
    v7 = partial apply for thunk for @escaping @callee_guaranteed () -> (@out ());
  }
  else
  {
    v7 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())result;
  return result;
}

uint64_t key path setter for CollaborationAttributionView.remoteContentDidLoad : CollaborationAttributionView(uint64_t *a1, _QWORD **a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t (*v7)(uint64_t (*)(), uint64_t);

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = partial apply for thunk for @escaping @callee_guaranteed () -> (@out ());
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *(uint64_t (**)(uint64_t (*)(), uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0xA8);
  outlined copy of (@escaping @callee_guaranteed () -> ())?(v3);
  return v7(v6, v5);
}

void CollaborationAttributionView.placeholderGlyphConfiguration.didset()
{
  char *v0;
  char *v1;
  void *v2;
  id v3;
  char v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v1 = v0;
  v2 = *(void **)&v0[OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration];
  type metadata accessor for SLHighlight(0, (unint64_t *)&lazy cache variable for type metadata for SLDImageSymbolConfiguration);
  v3 = v2;
  v4 = static NSObject.== infix(_:_:)();

  if ((v4 & 1) == 0)
  {
    v5 = CollaborationAttributionView.minViableGlyphSize()();
    if (*(_QWORD *)&v1[OBJC_IVAR___SLCollaborationAttributionView_variant] == 4)
      v6 = 44.0;
    else
      v6 = 0.0;
    objc_msgSend(v1, sel_bounds);
    if (v7 > v5)
      v8 = v7;
    else
      v8 = v5;
    if (v8 <= v6)
      v8 = v6;
    objc_msgSend(v1, sel_setMaxWidth_, v8);
    v9 = objc_msgSend(v1, sel_slotView);
    objc_msgSend(v9, sel__updateContent);

    objc_msgSend(v1, sel_invalidateIntrinsicContentSize);
  }
}

id CollaborationAttributionView.__allocating_init(highlight:variant:)(void *a1, uint64_t a2)
{
  objc_class *v2;
  id v5;
  id v6;

  v5 = objc_allocWithZone(v2);
  v6 = specialized CollaborationAttributionView.init(highlight:variant:)(a1, a2);

  return v6;
}

id CollaborationAttributionView.__allocating_init(variant:)(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return CollaborationAttributionView.init(variant:)(a1);
}

id CollaborationAttributionView.init(variant:)(uint64_t a1)
{
  _BYTE *v1;
  _QWORD *v3;
  _QWORD *v4;
  id v5;
  char *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  double v16;
  uint64_t ObjCClassFromMetadata;
  objc_super v19;

  swift_unknownObjectWeakInit();
  v3 = &v1[OBJC_IVAR___SLCollaborationAttributionView_remoteContentDidLoad];
  *v3 = 0;
  v3[1] = 0;
  *(_QWORD *)&v1[OBJC_IVAR___SLCollaborationAttributionView_highlight] = 0;
  v4 = &v1[OBJC_IVAR___SLCollaborationAttributionView_title];
  *v4 = 0;
  v4[1] = 0;
  v1[OBJC_IVAR___SLCollaborationAttributionView_automaticallyAdjustsMaxWidthToFitBounds] = 0;
  *(_QWORD *)&v1[OBJC_IVAR___SLCollaborationAttributionView_variant] = a1;
  v5 = objc_allocWithZone((Class)SLDImageSymbolConfiguration);
  v6 = v1;
  v7 = (void *)MEMORY[0x19AEC3B6C](0xD000000000000022, 0x8000000199FB02A0);
  v8 = objc_msgSend(v5, sel_initWithName_coreUISize_weight_pointSize_, v7, 2, 3, 22.0);

  v9 = OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration;
  *(_QWORD *)&v6[OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration] = v8;
  v10 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v10, sel_scale);
  v12 = v11;

  v13 = *(id *)&v6[v9];
  objc_msgSend(v13, sel_minViableSizeWithDisplayScale_RTL_darkMode_, 0, 0, v12);
  v15 = v14;

  v16 = 44.0;
  if (a1 != 4)
    v16 = 0.0;
  if (v15 <= v16)
    v15 = v16;
  type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for SLDCollaborationAttributionViewService);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v19.receiver = v6;
  v19.super_class = (Class)type metadata accessor for CollaborationAttributionView();
  return objc_msgSendSuper2(&v19, sel_initWithServiceProxyClass_maxWidth_, ObjCClassFromMetadata, v15);
}

id CollaborationAttributionView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

uint64_t CollaborationAttributionView.init(coder:)(void *a1)
{

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

Swift::Void __swiftcall CollaborationAttributionView.layoutSubviews()()
{
  _QWORD *v0;
  id v1;
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for CollaborationAttributionView();
  v1 = objc_msgSendSuper2(&v6, sel_layoutSubviews);
  if (((*(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))(v1) & 1) != 0)
  {
    v2 = CollaborationAttributionView.minViableGlyphSize()();
    if (*(_QWORD *)((char *)v0 + OBJC_IVAR___SLCollaborationAttributionView_variant) == 4)
      v3 = 44.0;
    else
      v3 = 0.0;
    objc_msgSend(v0, sel_bounds);
    if (v4 > v2)
      v5 = v4;
    else
      v5 = v2;
    if (v5 <= v3)
      v5 = v3;
    objc_msgSend(v0, sel_setMaxWidth_, v5);
  }
}

Swift::Void __swiftcall CollaborationAttributionView.traitCollectionDidChange(_:)(UITraitCollection_optional a1)
{
  void *v1;
  Class isa;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  objc_super v11;

  isa = a1.value.super.isa;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for CollaborationAttributionView();
  objc_msgSendSuper2(&v11, sel_traitCollectionDidChange_, isa);
  if (isa)
    isa = (Class)-[objc_class preferredContentSizeCategory](isa, sel_preferredContentSizeCategory);
  v3 = objc_msgSend(v1, sel_traitCollection);
  v4 = objc_msgSend(v3, sel_preferredContentSizeCategory);

  if (!isa)
  {

    goto LABEL_11;
  }
  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = v6;
  if (v5 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v7 == v8)
  {

    swift_bridgeObjectRelease_n();
    return;
  }
  v10 = _stringCompareWithSmolCheck(_:_:expecting:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v10 & 1) == 0)
LABEL_11:
    objc_msgSend(v1, sel_invalidateIntrinsicContentSize);
}

id CollaborationAttributionView.makePlaceholderSlotContent(for:)(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  BOOL v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id result;
  id v13;
  id v14;
  CGRect v15;

  v2 = v1;
  v4 = *(_QWORD *)&v1[OBJC_IVAR___SLCollaborationAttributionView_variant];
  v5 = v4 == 4 || v4 == 1;
  if (!v5 || (objc_msgSend(v2, sel_maxWidth), v6 <= 0.0))
  {
    v14 = a1;
    objc_msgSend(v2, sel_bounds);
    v13 = objc_msgSend(objc_allocWithZone((Class)SLDCollaborationAttributionViewEmptySlotContent), sel_initWithStyle_variant_maxWidth_placeholderGlyphConfig_forRemote_, v14, v4, *(_QWORD *)&v2[OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration], 0, CGRectGetWidth(v15));

    return v13;
  }
  v7 = *(void **)&v2[OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration];
  v8 = (void *)objc_opt_self();
  v9 = v7;
  objc_msgSend(v2, sel_maxWidth);
  v10 = objc_msgSend(v8, sel_placeholderTagForMaxWidth_placeholderGlyphConfiguration_, v9);
  v11 = objc_msgSend(objc_allocWithZone((Class)SLDCollaborationAttributionViewSlotDrawer), sel_init);
  result = objc_msgSend(v11, sel_drawingWithStyle_tag_forRemote_, a1, v10, 0);
  if (result)
  {
    v13 = objc_msgSend((id)objc_opt_self(), sel_contentWithDrawing_style_, result, a1);

    swift_unknownObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

void CollaborationAttributionView.renderRemoteContent(forLayerContextID:style:yield:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD aBlock[6];

  v24 = a1;
  v25 = a3;
  v7 = type metadata accessor for DispatchWorkItemFlags();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = type metadata accessor for DispatchQoS();
  v11 = *(_QWORD *)(v26 - 8);
  MEMORY[0x1E0C80A78](v26);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend(v4, sel_serviceProxy);
  v15 = objc_msgSend(v14, sel_collaborationAttributionViewService);

  if (v15)
  {
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for OS_dispatch_queue);
    v16 = static OS_dispatch_queue.main.getter();
    v23 = v8;
    v17 = (void *)v16;
    v18 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v19 = (_QWORD *)swift_allocObject();
    v20 = v24;
    v19[2] = v18;
    v19[3] = v20;
    v19[4] = a2;
    v19[5] = v15;
    v19[6] = v25;
    v19[7] = a4;
    aBlock[4] = partial apply for closure #1 in CollaborationAttributionView.renderRemoteContent(forLayerContextID:style:yield:);
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    aBlock[3] = &block_descriptor;
    v21 = _Block_copy(aBlock);
    v22 = a2;
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    static DispatchQoS.unspecified.getter();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    MEMORY[0x19AEC3D94](0, v13, v10, v21);
    _Block_release(v21);
    swift_unknownObjectRelease();

    (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v7);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v26);
  }
}

void closure #1 in CollaborationAttributionView.renderRemoteContent(forLayerContextID:style:yield:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t (*v20)(void);
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  id v27;
  unint64_t v28;
  void *v29;
  void *v30;
  id v31;
  unint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  _QWORD *v44;
  id v45;
  uint64_t v46;
  double v47;
  id v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  char *v57;
  char *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  id v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  _QWORD aBlock[6];

  v75 = a5;
  v76 = a3;
  v74 = a2;
  v9 = type metadata accessor for DispatchWorkItemFlags();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for DispatchQoS();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v17 = (_QWORD *)MEMORY[0x19AEC4F4C](a1 + 16);
  if (v17)
  {
    v18 = v17;
    v72 = v16;
    v73 = a4;
    v71 = a6;
    v19 = (_QWORD *)MEMORY[0x1E0DEEDD8];
    v20 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v17) + 0xB8);
    v21 = v20();
    if (v21)
    {
      v22 = (void *)v21;
      objc_opt_self();
      v23 = (void *)swift_dynamicCastObjCClass();
      if (!v23)

    }
    else
    {
      v23 = 0;
    }
    v24 = (*(uint64_t (**)(void))((*v19 & *v18) + 0xE8))();
    if (v25)
    {
      v26 = v25;
      v70 = v24;
    }
    else if (v23)
    {
      v27 = objc_msgSend(v23, sel_fileName);
      v70 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v26 = v28;

    }
    else
    {
      v26 = 0x8000000199FB0580;
      v70 = 0xD000000000000017;
    }
    v29 = (void *)v20();
    if (!v29)
    {
      swift_bridgeObjectRelease();
      static os_log_type_t.info.getter();
      type metadata accessor for SLHighlight(0, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
      v60 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:_:_:)();

      return;
    }
    v30 = v29;
    v67 = v26;
    v62 = v14;
    v63 = v13;
    v31 = objc_msgSend(v29, sel_attributions);

    type metadata accessor for SLHighlight(0, (unint64_t *)&lazy cache variable for type metadata for SLAttribution);
    v32 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    v66 = v9;
    v65 = v10;
    v64 = v12;
    if (v32 >> 62)
    {
      swift_bridgeObjectRetain();
      v33 = _CocoaArrayWrapper.endIndex.getter();
    }
    else
    {
      v33 = *(_QWORD *)((v32 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    v34 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    v68 = v23;
    v69 = v18;
    if (v33)
    {
      if (v33 < 1)
      {
        __break(1u);
        return;
      }
      v35 = 0;
      do
      {
        if ((v32 & 0xC000000000000001) != 0)
          v36 = (id)MEMORY[0x19AEC3E78](v35, v32);
        else
          v36 = *(id *)(v32 + 8 * v35 + 32);
        v37 = v36;
        v38 = objc_msgSend(v36, sel_uniqueIdentifier);
        v39 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v41 = v40;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v34 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v34[2] + 1, 1, v34);
        v43 = v34[2];
        v42 = v34[3];
        if (v43 >= v42 >> 1)
          v34 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v42 > 1), v43 + 1, 1, v34);
        ++v35;
        v34[2] = v43 + 1;
        v44 = &v34[2 * v43];
        v44[4] = v39;
        v44[5] = v41;
      }
      while (v33 != v35);
    }
    swift_bridgeObjectRelease_n();
    v45 = v69;
    objc_msgSend(v69, sel_maxWidth);
    v46 = v73;
    if (v47 <= 0.0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      static os_log_type_t.info.getter();
      type metadata accessor for SLHighlight(0, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
      v61 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:_:_:)();

    }
    else
    {
      v48 = objc_msgSend(v45, sel_remoteRenderingQueue);
      v49 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v50 = (_QWORD *)swift_allocObject();
      v51 = v74;
      v50[2] = v49;
      v50[3] = v51;
      v52 = v76;
      v53 = v70;
      v50[4] = v76;
      v50[5] = v53;
      v50[6] = v67;
      v50[7] = v34;
      v54 = v75;
      v50[8] = v46;
      v50[9] = v54;
      v50[10] = v71;
      aBlock[4] = partial apply for closure #2 in closure #1 in CollaborationAttributionView.renderRemoteContent(forLayerContextID:style:yield:);
      aBlock[5] = v50;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
      aBlock[3] = &block_descriptor_41;
      v55 = _Block_copy(aBlock);
      swift_retain();
      v56 = v52;
      swift_unknownObjectRetain();
      swift_retain();
      v57 = v72;
      static DispatchQoS.unspecified.getter();
      v77 = MEMORY[0x1E0DEE9D8];
      lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
      lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
      v58 = v64;
      v59 = v66;
      dispatch thunk of SetAlgebra.init<A>(_:)();
      MEMORY[0x19AEC3D94](0, v57, v58, v55);
      _Block_release(v55);

      (*(void (**)(char *, uint64_t))(v65 + 8))(v58, v59);
      (*(void (**)(char *, uint64_t))(v62 + 8))(v57, v63);
      swift_release();
      swift_release();
    }
  }
}

void closure #2 in closure #1 in CollaborationAttributionView.renderRemoteContent(forLayerContextID:style:yield:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;

  v16 = a1 + 16;
  swift_beginAccess();
  v17 = (void *)MEMORY[0x19AEC4F4C](v16);
  if (v17)
  {
    v18 = v17;
    objc_msgSend(v17, sel_maxWidth);
    CollaborationAttributionView._renderRemoteContent(forLayerContextID:style:forTitle:maxWidth:attributionIdentifiers:usingService:yield:)(a2, a3, a4, a5, v19, a6, a7, a8, a9);

  }
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable () -> ()(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t closure #1 in CollaborationAttributionView._renderRemoteContent(forLayerContextID:style:forTitle:maxWidth:attributionIdentifiers:usingService:yield:)(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD aBlock[6];

  v27 = a4;
  v28 = a6;
  v12 = type metadata accessor for DispatchWorkItemFlags();
  v31 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for DispatchQoS();
  v29 = *(_QWORD *)(v15 - 8);
  v30 = v15;
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a2 + 16;
  type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for OS_dispatch_queue);
  v19 = (void *)static OS_dispatch_queue.main.getter();
  v20 = swift_allocObject();
  swift_beginAccess();
  v21 = (void *)MEMORY[0x19AEC4F4C](v18);
  swift_unknownObjectWeakInit();

  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = v20;
  *(_QWORD *)(v22 + 24) = a3;
  *(_QWORD *)(v22 + 32) = a1;
  *(double *)(v22 + 40) = a7;
  *(_QWORD *)(v22 + 48) = v27;
  *(_QWORD *)(v22 + 56) = a5;
  *(_QWORD *)(v22 + 64) = v28;
  aBlock[4] = partial apply for closure #1 in closure #1 in CollaborationAttributionView._renderRemoteContent(forLayerContextID:style:forTitle:maxWidth:attributionIdentifiers:usingService:yield:);
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = &block_descriptor_28;
  v23 = _Block_copy(aBlock);
  v24 = a1;
  swift_retain();
  v25 = a3;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = MEMORY[0x1E0DEE9D8];
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x19AEC3D94](0, v17, v14, v23);
  _Block_release(v23);

  (*(void (**)(char *, uint64_t))(v31 + 8))(v14, v12);
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v17, v30);
}

void closure #1 in closure #1 in CollaborationAttributionView._renderRemoteContent(forLayerContextID:style:forTitle:maxWidth:attributionIdentifiers:usingService:yield:)(uint64_t a1, uint64_t a2, void *a3, void (*a4)(void), double a5)
{
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;

  v9 = a1 + 16;
  swift_beginAccess();
  v10 = (_QWORD *)MEMORY[0x19AEC4F4C](v9);
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, sel_setLastRenderedSlotStyle_, a2);
    objc_msgSend(v11, sel_setRemoteContentIsLoaded_, a3 != 0);
    if (a3)
    {
      v12 = a3;
      a4();
      objc_msgSend(v11, sel_setNeedsLayout);
      v13 = objc_msgSend(v11, sel_layoutIfNeeded);
      v14 = (void *)(*(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & *v11) + 0x88))(v13);
      if (v14)
      {
        objc_msgSend(v14, sel_collaborationAttributionViewDidLoadNewRemoteContent_, v11);

        swift_unknownObjectRelease();
      }
      else
      {

      }
    }
    else
    {
      static os_log_type_t.error.getter();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      v15 = swift_allocObject();
      *(_OWORD *)(v15 + 16) = xmmword_199FA7E70;
      swift_getMetatypeMetadata();
      v16 = String.init<A>(describing:)();
      v18 = v17;
      *(_QWORD *)(v15 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v15 + 64) = lazy protocol witness table accessor for type String and conformance String();
      *(_QWORD *)(v15 + 32) = v16;
      *(_QWORD *)(v15 + 40) = v18;
      *(_QWORD *)(v15 + 96) = type metadata accessor for CollaborationAttributionView();
      *(_QWORD *)(v15 + 104) = lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type CollaborationAttributionView and conformance NSObject, v19, (uint64_t (*)(uint64_t))type metadata accessor for CollaborationAttributionView, MEMORY[0x1E0DEFD08]);
      *(_QWORD *)(v15 + 72) = v11;
      *(_QWORD *)(v15 + 136) = MEMORY[0x1E0DEF040];
      *(_QWORD *)(v15 + 144) = lazy protocol witness table accessor for type CGFloat and conformance CGFloat();
      *(double *)(v15 + 112) = a5;
      type metadata accessor for SLHighlight(0, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
      v20 = v11;
      v12 = (id)static OS_os_log.default.getter();
      os_log(_:dso:log:_:_:)();

      swift_bridgeObjectRelease();
    }

  }
}

void thunk for @escaping @callee_guaranteed (@guaranteed UISSlotRemoteContent?) -> ()(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

id CollaborationAttributionView.__allocating_init(serviceProxyClass:maxWidth:)(double a1)
{
  objc_class *v1;

  return objc_msgSend(objc_allocWithZone(v1), sel_initWithServiceProxyClass_maxWidth_, swift_getObjCClassFromMetadata(), a1);
}

void CollaborationAttributionView.init(serviceProxyClass:maxWidth:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CollaborationAttributionView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void CollaborationAttributionView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CollaborationAttributionView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CollaborationAttributionView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id specialized CollaborationAttributionView.init(highlight:variant:)(void *a1, uint64_t a2)
{
  _BYTE *v2;
  _QWORD *v5;
  void **v6;
  _QWORD *v7;
  void *v8;
  char *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  double v16;
  double v17;
  id v18;
  double v19;
  double v20;
  double v21;
  uint64_t ObjCClassFromMetadata;
  objc_super v24;

  swift_unknownObjectWeakInit();
  v5 = &v2[OBJC_IVAR___SLCollaborationAttributionView_remoteContentDidLoad];
  *v5 = 0;
  v5[1] = 0;
  v6 = (void **)&v2[OBJC_IVAR___SLCollaborationAttributionView_highlight];
  *(_QWORD *)&v2[OBJC_IVAR___SLCollaborationAttributionView_highlight] = 0;
  v7 = &v2[OBJC_IVAR___SLCollaborationAttributionView_title];
  *v7 = 0;
  v7[1] = 0;
  v2[OBJC_IVAR___SLCollaborationAttributionView_automaticallyAdjustsMaxWidthToFitBounds] = 0;
  swift_beginAccess();
  v8 = *v6;
  *v6 = a1;
  v9 = v2;
  v10 = a1;

  v11 = objc_allocWithZone((Class)SLDImageSymbolConfiguration);
  v12 = (void *)MEMORY[0x19AEC3B6C](0xD000000000000022, 0x8000000199FB02A0);
  v13 = objc_msgSend(v11, sel_initWithName_coreUISize_weight_pointSize_, v12, 2, 3, 22.0);

  v14 = OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration;
  *(_QWORD *)&v9[OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration] = v13;
  *(_QWORD *)&v9[OBJC_IVAR___SLCollaborationAttributionView_variant] = a2;
  v15 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v15, sel_scale);
  v17 = v16;

  v18 = *(id *)&v9[v14];
  objc_msgSend(v18, sel_minViableSizeWithDisplayScale_RTL_darkMode_, 0, 0, v17);
  v20 = v19;

  v21 = 44.0;
  if (a2 != 4)
    v21 = 0.0;
  if (v20 <= v21)
    v20 = v21;
  type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for SLDCollaborationAttributionViewService);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v24.receiver = v9;
  v24.super_class = (Class)type metadata accessor for CollaborationAttributionView();
  return objc_msgSendSuper2(&v24, sel_initWithServiceProxyClass_maxWidth_, ObjCClassFromMetadata, v20);
}

uint64_t outlined copy of (@escaping @callee_guaranteed () -> ())?(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t outlined consume of (@escaping @callee_guaranteed () -> ())?(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t type metadata accessor for CollaborationAttributionView()
{
  return objc_opt_self();
}

uint64_t sub_199F73430()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_199F73454()
{
  uint64_t v0;

  swift_release();

  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #1 in CollaborationAttributionView.renderRemoteContent(forLayerContextID:style:yield:)()
{
  uint64_t v0;

  closure #1 in CollaborationAttributionView.renderRemoteContent(forLayerContextID:style:yield:)(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
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

unint64_t lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A];
  if (!lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    result = MEMORY[0x19AEC4E20](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A]);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x19AEC4E14](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_199F73548@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x88))();
  *a2 = result;
  return result;
}

uint64_t sub_199F73588(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x90);
  v3 = swift_unknownObjectRetain();
  return v2(v3);
}

uint64_t sub_199F735D0@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0xB8))();
  *a2 = result;
  return result;
}

uint64_t sub_199F73610(id *a1, _QWORD **a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **a2) + 0xC0);
  v4 = *a1;
  return v3(v2);
}

uint64_t sub_199F7365C@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0xE8))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_199F7369C(uint64_t *a1, _QWORD **a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0xF0);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_199F736F0@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x100))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_199F73734(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x108))(*a1);
}

uint64_t method lookup function for CollaborationAttributionView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CollaborationAttributionView.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of CollaborationAttributionView.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of CollaborationAttributionView.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of CollaborationAttributionView.remoteContentDidLoad.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of CollaborationAttributionView.remoteContentDidLoad.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of CollaborationAttributionView.remoteContentDidLoad.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of CollaborationAttributionView.highlight.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of CollaborationAttributionView.highlight.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of CollaborationAttributionView.highlight.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of CollaborationAttributionView.title.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of CollaborationAttributionView.title.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of CollaborationAttributionView.title.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of CollaborationAttributionView.automaticallyAdjustsMaxWidthToFitBounds.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of CollaborationAttributionView.automaticallyAdjustsMaxWidthToFitBounds.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of CollaborationAttributionView.automaticallyAdjustsMaxWidthToFitBounds.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of CollaborationAttributionView.__allocating_init(highlight:variant:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 280))();
}

uint64_t dispatch thunk of CollaborationAttributionView.__allocating_init(variant:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 288))();
}

uint64_t dispatch thunk of CollaborationAttributionView.updatePlaceholderSymbol(scale:weight:pointSize:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of CollaborationAttributionView.expectedHeight(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x150))();
}

uint64_t sub_199F73968()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned UISSlotAnyContent) -> (@unowned ObjCBool)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t outlined destroy of weak CollaborationAttributionViewDelegate?(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_199F739D0()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in CollaborationAttributionView._renderRemoteContent(forLayerContextID:style:forTitle:maxWidth:attributionIdentifiers:usingService:yield:)(void *a1)
{
  uint64_t v1;

  return closure #1 in CollaborationAttributionView._renderRemoteContent(forLayerContextID:style:forTitle:maxWidth:attributionIdentifiers:usingService:yield:)(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(double *)(v1 + 32));
}

uint64_t sub_199F73A18()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #1 in closure #1 in CollaborationAttributionView._renderRemoteContent(forLayerContextID:style:forTitle:maxWidth:attributionIdentifiers:usingService:yield:)()
{
  uint64_t v0;

  closure #1 in closure #1 in CollaborationAttributionView._renderRemoteContent(forLayerContextID:style:forTitle:maxWidth:attributionIdentifiers:usingService:yield:)(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32), *(void (**)(void))(v0 + 48), *(double *)(v0 + 40));
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x19AEC4E20](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x19AEC4E20](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x19AEC4E20](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CGFloat and conformance CGFloat()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    result = MEMORY[0x19AEC4E20](MEMORY[0x1E0DEF098], MEMORY[0x1E0DEF040]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

uint64_t sub_199F73B34()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@out ())()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_199F73B78()
{
  uint64_t v0;

  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #2 in closure #1 in CollaborationAttributionView.renderRemoteContent(forLayerContextID:style:yield:)()
{
  uint64_t v0;

  closure #2 in closure #1 in CollaborationAttributionView.renderRemoteContent(forLayerContextID:style:yield:)(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(void **)(v0 + 64), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
}

uint64_t type metadata accessor for SLHighlight(uint64_t a1, unint64_t *a2)
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

BOOL static NodeIdentity.< infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t);
  uint64_t v9;
  uint64_t v11;

  v0 = type metadata accessor for SHA256Digest();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x1E0C80A78](v0);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v11 - v5;
  NodeIdentity.hash.getter((uint64_t)&v11 - v5);
  v7 = SHA256Digest.hashValue.getter();
  v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v6, v0);
  NodeIdentity.hash.getter((uint64_t)v4);
  v9 = SHA256Digest.hashValue.getter();
  v8(v4, v0);
  return v7 < v9;
}

uint64_t NodeIdentity.hash.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;
  _QWORD v16[6];

  v2 = v1;
  v16[5] = *MEMORY[0x1E0C80C00];
  v4 = type metadata accessor for SHA256();
  MEMORY[0x1E0C80A78](v4);
  v5 = type metadata accessor for P256.Signing.PublicKey();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for NodeIdentity(0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of NodeIdentity(v2, (uint64_t)v11);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v16[1] = a1;
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v11, v5);
    v12 = SHA256.init()();
    MEMORY[0x19AEC3A88](v12);
    __asm { BR              X10 }
  }
  v14 = type metadata accessor for SHA256Digest();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(a1, v11, v14);
}

uint64_t type metadata accessor for NodeIdentity(uint64_t a1)
{
  return type metadata accessor for NodeIdentity(a1, (uint64_t *)&type metadata singleton initialization cache for NodeIdentity);
}

uint64_t outlined init with copy of NodeIdentity(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NodeIdentity(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static NodeIdentity.== infix(_:_:)()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char v8;
  void (*v9)(char *, uint64_t);
  uint64_t v11;

  v0 = type metadata accessor for SHA256Digest();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CA92F8];
  v2 = *(_QWORD *)(v0 - 8);
  v3 = MEMORY[0x1E0C80A78](v0);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v11 - v6;
  NodeIdentity.hash.getter((uint64_t)&v11 - v6);
  NodeIdentity.hash.getter((uint64_t)v5);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef((unint64_t *)&lazy protocol witness table cache variable for type SHA256Digest and conformance SHA256Digest, v1, MEMORY[0x1E0CA92F0]);
  v8 = static Digest.== infix(_:_:)();
  v9 = *(void (**)(char *, uint64_t))(v2 + 8);
  v9(v5, v0);
  v9(v7, v0);
  return v8 & 1;
}

BOOL protocol witness for static Comparable.< infix(_:_:) in conformance NodeIdentity()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t);
  uint64_t v9;
  uint64_t v11;

  v0 = type metadata accessor for SHA256Digest();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x1E0C80A78](v0);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v11 - v5;
  NodeIdentity.hash.getter((uint64_t)&v11 - v5);
  v7 = SHA256Digest.hashValue.getter();
  v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v6, v0);
  NodeIdentity.hash.getter((uint64_t)v4);
  v9 = SHA256Digest.hashValue.getter();
  v8(v4, v0);
  return v7 < v9;
}

BOOL protocol witness for static Comparable.<= infix(_:_:) in conformance NodeIdentity()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t);
  uint64_t v9;
  uint64_t v11;

  v0 = type metadata accessor for SHA256Digest();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x1E0C80A78](v0);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v11 - v5;
  NodeIdentity.hash.getter((uint64_t)&v11 - v5);
  v7 = SHA256Digest.hashValue.getter();
  v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v6, v0);
  NodeIdentity.hash.getter((uint64_t)v4);
  v9 = SHA256Digest.hashValue.getter();
  v8(v4, v0);
  return v7 >= v9;
}

BOOL protocol witness for static Comparable.>= infix(_:_:) in conformance NodeIdentity()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t);
  uint64_t v9;
  uint64_t v11;

  v0 = type metadata accessor for SHA256Digest();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x1E0C80A78](v0);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v11 - v5;
  NodeIdentity.hash.getter((uint64_t)&v11 - v5);
  v7 = SHA256Digest.hashValue.getter();
  v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v6, v0);
  NodeIdentity.hash.getter((uint64_t)v4);
  v9 = SHA256Digest.hashValue.getter();
  v8(v4, v0);
  return v7 >= v9;
}

BOOL protocol witness for static Comparable.> infix(_:_:) in conformance NodeIdentity()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t);
  uint64_t v9;
  uint64_t v11;

  v0 = type metadata accessor for SHA256Digest();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x1E0C80A78](v0);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v11 - v5;
  NodeIdentity.hash.getter((uint64_t)&v11 - v5);
  v7 = SHA256Digest.hashValue.getter();
  v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v6, v0);
  NodeIdentity.hash.getter((uint64_t)v4);
  v9 = SHA256Digest.hashValue.getter();
  v8(v4, v0);
  return v7 < v9;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NodeIdentity()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char v8;
  void (*v9)(char *, uint64_t);
  uint64_t v11;

  v0 = type metadata accessor for SHA256Digest();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CA92F8];
  v2 = *(_QWORD *)(v0 - 8);
  v3 = MEMORY[0x1E0C80A78](v0);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v11 - v6;
  NodeIdentity.hash.getter((uint64_t)&v11 - v6);
  NodeIdentity.hash.getter((uint64_t)v5);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef((unint64_t *)&lazy protocol witness table cache variable for type SHA256Digest and conformance SHA256Digest, v1, MEMORY[0x1E0CA92F0]);
  v8 = static Digest.== infix(_:_:)();
  v9 = *(void (**)(char *, uint64_t))(v2 + 8);
  v9(v5, v0);
  v9(v7, v0);
  return v8 & 1;
}

uint64_t MerkleNode.node.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of NodeIdentity(v1 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_node, a1);
}

uint64_t MerkleNode.parent.getter()
{
  return MerkleNode.parent.getter();
}

{
  swift_beginAccess();
  return swift_retain();
}

uint64_t MerkleNode.parent.setter(uint64_t a1)
{
  return MerkleNode.parent.setter(a1, &OBJC_IVAR____TtC11SocialLayer10MerkleNode_parent);
}

uint64_t (*MerkleNode.parent.modify())()
{
  swift_beginAccess();
  return CollaborationAttributionView.title.modify;
}

uint64_t MerkleNode.left.getter()
{
  return MerkleNode.parent.getter();
}

uint64_t MerkleNode.left.setter(uint64_t a1)
{
  return MerkleNode.parent.setter(a1, &OBJC_IVAR____TtC11SocialLayer10MerkleNode_left);
}

uint64_t (*MerkleNode.left.modify())()
{
  swift_beginAccess();
  return CollaborationAttributionView.remoteContentDidLoad.modify;
}

uint64_t MerkleNode.right.getter()
{
  return MerkleNode.parent.getter();
}

uint64_t MerkleNode.right.setter(uint64_t a1)
{
  return MerkleNode.parent.setter(a1, &OBJC_IVAR____TtC11SocialLayer10MerkleNode_right);
}

uint64_t MerkleNode.parent.setter(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)(v2 + *a2);
  swift_beginAccess();
  *v4 = a1;
  return swift_release();
}

uint64_t (*MerkleNode.right.modify())()
{
  swift_beginAccess();
  return CollaborationAttributionView.title.modify;
}

uint64_t MerkleNode.hash.getter@<X0>(uint64_t a1@<X8>)
{
  return NodeIdentity.hash.getter(a1);
}

uint64_t MerkleNode.__allocating_init(node:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  *(_QWORD *)(v2 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_parent) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_left) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_right) = 0;
  outlined init with take of NodeIdentity(a1, v2 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_node);
  return v2;
}

uint64_t MerkleNode.init(node:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_parent) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_left) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_right) = 0;
  outlined init with take of NodeIdentity(a1, v1 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_node);
  return v1;
}

uint64_t MerkleNode.deinit()
{
  uint64_t v0;

  outlined destroy of NodeIdentity(v0 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_node);
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t MerkleNode.__deallocating_deinit()
{
  uint64_t v0;

  outlined destroy of NodeIdentity(v0 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_node);
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t MerkleTree.nodes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t MerkleTree.root.getter()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t MerkleTree.root.setter(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 24) = a1;
  return swift_release();
}

uint64_t (*MerkleTree.root.modify())()
{
  swift_beginAccess();
  return CollaborationAttributionView.title.modify;
}

uint64_t MerkleTree.rootHash.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;

  v3 = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 96))();
  if (v3)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 184))(v3);
    swift_release();
    v4 = type metadata accessor for SHA256Digest();
    v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56);
    v6 = a1;
    v7 = 0;
  }
  else
  {
    v4 = type metadata accessor for SHA256Digest();
    v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56);
    v6 = a1;
    v7 = 1;
  }
  return v5(v6, v7, 1, v4);
}

uint64_t MerkleTree.__allocating_init(nodeIdentities:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  MerkleTree.init(nodeIdentities:)(a1);
  return v2;
}

uint64_t MerkleTree.init(nodeIdentities:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;

  v3 = type metadata accessor for NodeIdentity(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)v19 - v8;
  *(_QWORD *)(v1 + 24) = 0;
  v10 = *(_QWORD *)(a1 + 16);
  if (v10)
  {
    v19[1] = v1 + 24;
    v20 = v1;
    v21 = MEMORY[0x1E0DEE9D8];
    specialized ContiguousArray.reserveCapacity(_:)();
    v11 = *(unsigned __int8 *)(v4 + 80);
    v19[0] = a1;
    v12 = a1 + ((v11 + 32) & ~v11);
    v13 = *(_QWORD *)(v4 + 72);
    do
    {
      outlined init with copy of NodeIdentity(v12, (uint64_t)v9);
      outlined init with copy of NodeIdentity((uint64_t)v9, (uint64_t)v7);
      type metadata accessor for MerkleNode(0);
      v14 = swift_allocObject();
      *(_QWORD *)(v14 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_parent) = 0;
      *(_QWORD *)(v14 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_left) = 0;
      *(_QWORD *)(v14 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_right) = 0;
      outlined init with take of NodeIdentity((uint64_t)v7, v14 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_node);
      outlined destroy of NodeIdentity((uint64_t)v9);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      v12 += v13;
      --v10;
    }
    while (v10);
    v15 = v21;
    swift_bridgeObjectRelease();
    v1 = v20;
  }
  else
  {
    swift_bridgeObjectRelease();
    v15 = MEMORY[0x1E0DEE9D8];
  }
  *(_QWORD *)(v1 + 16) = v15;
  v16 = swift_bridgeObjectRetain();
  v17 = MerkleTree.buildTree(nodes:)(v16);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(_QWORD *)(v1 + 24) = v17;
  swift_release();
  return v1;
}

unint64_t MerkleTree.verify(node:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v22;
  uint64_t v23;
  char *v24;
  void (*v25)(char *, uint64_t);
  unint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  _QWORD v30[7];
  uint64_t v31;
  unint64_t v32;
  char *v33;
  char *v34;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v39 = a1;
  v42 = *MEMORY[0x1E0C80C00];
  v2 = type metadata accessor for SHA256();
  v30[6] = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for P256.Signing.PublicKey();
  v37 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v36 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = type metadata accessor for NodeIdentity(0);
  MEMORY[0x1E0C80A78](v38);
  v40 = (uint64_t)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for SHA256Digest();
  v41 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)v30 - v12;
  v14 = *(_QWORD *)(v1 + 16);
  if (!(v14 >> 62))
  {
    v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v15)
      goto LABEL_3;
LABEL_12:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  v15 = _CocoaArrayWrapper.endIndex.getter();
  if (!v15)
    goto LABEL_12;
LABEL_3:
  v30[1] = v1;
  v16 = 0;
  v34 = v11;
  v35 = v14 & 0xC000000000000001;
  v30[3] = v2;
  v30[4] = v4;
  v31 = v15;
  v32 = v14;
  v30[5] = v5;
  v33 = v13;
  while (1)
  {
    if (v35)
    {
      v17 = MEMORY[0x19AEC3E78](v16, v14);
    }
    else
    {
      v17 = *(_QWORD *)(v14 + 8 * v16 + 32);
      swift_retain();
    }
    v18 = v40;
    v19 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
      __break(1u);
      JUMPOUT(0x199F752F0);
    }
    outlined init with copy of NodeIdentity(v39, v40);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v37 + 32))(v36, v18, v5);
      v20 = SHA256.init()();
      MEMORY[0x19AEC3A88](v20);
      __asm { BR              X9 }
    }
    v22 = v33;
    v23 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v41 + 32))(v33, v18, v8);
    v24 = v34;
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 184))(v23);
    lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef((unint64_t *)&lazy protocol witness table cache variable for type SHA256Digest and conformance SHA256Digest, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA92F8], MEMORY[0x1E0CA92F0]);
    if ((static Digest.== infix(_:_:)() & 1) != 0)
      break;
    swift_release();
    v25 = *(void (**)(char *, uint64_t))(v41 + 8);
    v25(v24, v8);
    v25(v22, v8);
    ++v16;
    v14 = v32;
    if (v19 == v31)
      goto LABEL_12;
  }
  swift_bridgeObjectRelease();
  v27 = swift_retain();
  v26 = MerkleTree.generateProofOfInclusion(node:)(v27);
  swift_release_n();
  v28 = *(void (**)(char *, uint64_t))(v41 + 8);
  v28(v24, v8);
  v28(v22, v8);
  return v26;
}

uint64_t MerkleTree.buildTree(nodes:)(unint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = a1 >> 62;
  if (a1 >> 62)
    goto LABEL_32;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v3)
    return v3;
LABEL_3:
  if (v3 != 1)
  {
    v6 = MEMORY[0x1E0DEE9D8];
    v13 = MEMORY[0x1E0DEE9D8];
    if (v3 < 1)
    {
LABEL_25:
      v12 = MerkleTree.buildTree(nodes:)(v6);
      swift_bridgeObjectRelease();
      return v12;
    }
    v7 = 0;
    v2 = a1 & 0xFFFFFFFFFFFFFF8;
    while ((a1 & 0xC000000000000001) == 0)
    {
      if (v7 >= *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_30;
      v8 = *(_QWORD *)(a1 + 8 * v7 + 32);
      swift_retain();
      if ((uint64_t)(v7 + 1) >= v3)
        goto LABEL_19;
      if (v7 + 1 >= *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_31;
      v9 = *(_QWORD *)(a1 + 8 * v7 + 40);
      swift_retain();
LABEL_20:
      specialized MerkleTree.createParent(leftNode:rightNode:)(v8, v9);
      v10 = swift_retain();
      MEMORY[0x19AEC3C8C](v10);
      if (*(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      swift_release();
      swift_release();
      swift_release();
      v11 = v7 + 2;
      if (__OFADD__(v7, 2))
      {
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        swift_bridgeObjectRetain();
        v3 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (!v3)
          return v3;
        goto LABEL_3;
      }
      v7 += 2;
      if (v11 >= v3)
      {
        v6 = v13;
        goto LABEL_25;
      }
    }
    v8 = MEMORY[0x19AEC3E78](v7, a1);
    if ((uint64_t)(v7 + 1) < v3)
    {
      v9 = MEMORY[0x19AEC3E78]();
      goto LABEL_20;
    }
LABEL_19:
    swift_retain();
    v9 = v8;
    goto LABEL_20;
  }
  if (!v2)
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_6;
LABEL_27:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  result = _CocoaArrayWrapper.endIndex.getter();
  if (!result)
    goto LABEL_27;
LABEL_6:
  if ((a1 & 0xC000000000000001) != 0)
  {
    v3 = MEMORY[0x19AEC3E78](0, a1);
    goto LABEL_9;
  }
  if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v3 = *(_QWORD *)(a1 + 32);
    swift_retain();
LABEL_9:
    swift_bridgeObjectRelease();
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t closure #1 in MerkleTree.createParent(leftNode:rightNode:)()
{
  MEMORY[0x19AEC3C74]();
  type metadata accessor for SHA256();
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type SHA256 and conformance SHA256, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA9940], MEMORY[0x1E0CA9930]);
  return dispatch thunk of HashFunction.update(bufferPointer:)();
}

unint64_t MerkleTree.generateProofOfInclusion(node:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t result;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;

  v3 = type metadata accessor for SHA256Digest();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x1E0DEE9D8];
  v30 = MEMORY[0x1E0DEE9D8];
  if (!a1)
    return result;
  v8 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 96);
  v9 = swift_retain();
  v10 = v8(v9);
  if (v10)
  {
    v11 = v10;
    swift_release();
    if (a1 == v11)
      goto LABEL_15;
  }
  v12 = *(uint64_t (**)(void))(*(_QWORD *)a1 + 112);
  v13 = v12();
  if (!v13
    || (v14 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v13 + 136))(v13), swift_release(), !v14)
    || (v15 = swift_release(), v14 != a1))
  {
    v16 = v12();
    if (v16)
    {
      v17 = (_QWORD *)v16;
      v18 = 17;
      goto LABEL_9;
    }
LABEL_15:
    swift_release();
    return MEMORY[0x1E0DEE9D8];
  }
  v27 = ((uint64_t (*)(uint64_t))v12)(v15);
  if (!v27)
    goto LABEL_15;
  v17 = (_QWORD *)v27;
  v18 = 20;
LABEL_9:
  v19 = (*(uint64_t (**)(void))(*v17 + 8 * v18))();
  v20 = swift_release();
  if (!v19)
    goto LABEL_15;
  (*(void (**)(uint64_t))(*(_QWORD *)v19 + 184))(v20);
  v21 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, 1, 1, MEMORY[0x1E0DEE9D8]);
  v23 = *(_QWORD *)(v21 + 16);
  v22 = *(_QWORD *)(v21 + 24);
  v24 = v23 + 1;
  if (v23 >= v22 >> 1)
  {
    v29 = v23 + 1;
    v28 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v22 > 1, v23 + 1, 1, v21);
    v24 = v29;
    v21 = v28;
  }
  *(_QWORD *)(v21 + 16) = v24;
  v25 = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v4 + 32))(v21+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(_QWORD *)(v4 + 72) * v23, v6, v3);
  v30 = v21;
  (*(void (**)(uint64_t))(*(_QWORD *)v19 + 112))(v25);
  v26 = MerkleTree.generateProofOfInclusion(node:)();
  swift_release();
  specialized Array.append<A>(contentsOf:)(v26);
  swift_release();
  swift_release();
  return v30;
}

uint64_t MerkleTree.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t MerkleTree.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t specialized __DataStorage.withUnsafeBytes<A>(in:apply:)(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = __DataStorage._bytes.getter();
  if (!result || (result = __DataStorage._offset.getter(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      __DataStorage._length.getter();
      type metadata accessor for SHA256();
      lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type SHA256 and conformance SHA256, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA9940], MEMORY[0x1E0CA9930]);
      return dispatch thunk of HashFunction.update(bufferPointer:)();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t outlined init with take of NodeIdentity(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NodeIdentity(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of NodeIdentity(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for NodeIdentity(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for MerkleNode(uint64_t a1)
{
  return type metadata accessor for NodeIdentity(a1, (uint64_t *)&type metadata singleton initialization cache for MerkleNode);
}

uint64_t type metadata accessor for NodeIdentity(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t base witness table accessor for Equatable in NodeIdentity()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type NodeIdentity and conformance NodeIdentity, type metadata accessor for NodeIdentity, (uint64_t)&protocol conformance descriptor for NodeIdentity);
}

uint64_t sub_199F75A7C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 112))();
  *a2 = result;
  return result;
}

uint64_t sub_199F75AAC(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))(**(_QWORD **)a2 + 120);
  v3 = swift_retain();
  return v2(v3);
}

uint64_t sub_199F75ADC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 136))();
  *a2 = result;
  return result;
}

uint64_t sub_199F75B0C(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))(**(_QWORD **)a2 + 144);
  v3 = swift_retain();
  return v2(v3);
}

uint64_t sub_199F75B3C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 160))();
  *a2 = result;
  return result;
}

uint64_t sub_199F75B6C(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))(**(_QWORD **)a2 + 168);
  v3 = swift_retain();
  return v2(v3);
}

uint64_t sub_199F75B9C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 96))();
  *a2 = result;
  return result;
}

uint64_t sub_199F75BCC(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))(**(_QWORD **)a2 + 104);
  v3 = swift_retain();
  return v2(v3);
}

uint64_t *initializeBufferWithCopyOfBuffer for NodeIdentity(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
      v6 = type metadata accessor for P256.Signing.PublicKey();
    else
      v6 = type metadata accessor for SHA256Digest();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for NodeIdentity(uint64_t a1)
{
  uint64_t v2;

  if (swift_getEnumCaseMultiPayload() == 1)
    v2 = type metadata accessor for P256.Signing.PublicKey();
  else
    v2 = type metadata accessor for SHA256Digest();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for NodeIdentity(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (swift_getEnumCaseMultiPayload() == 1)
    v4 = type metadata accessor for P256.Signing.PublicKey();
  else
    v4 = type metadata accessor for SHA256Digest();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for NodeIdentity(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    outlined destroy of NodeIdentity(a1);
    if (swift_getEnumCaseMultiPayload() == 1)
      v4 = type metadata accessor for P256.Signing.PublicKey();
    else
      v4 = type metadata accessor for SHA256Digest();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for NodeIdentity(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (swift_getEnumCaseMultiPayload() == 1)
    v4 = type metadata accessor for P256.Signing.PublicKey();
  else
    v4 = type metadata accessor for SHA256Digest();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for NodeIdentity(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    outlined destroy of NodeIdentity(a1);
    if (swift_getEnumCaseMultiPayload() == 1)
      v4 = type metadata accessor for P256.Signing.PublicKey();
    else
      v4 = type metadata accessor for SHA256Digest();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for NodeIdentity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for NodeIdentity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t destructiveInjectEnumTag for NodeIdentity()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t type metadata completion function for NodeIdentity()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for SHA256Digest();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for P256.Signing.PublicKey();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t ObjC metadata update function for MerkleNode()
{
  return type metadata accessor for MerkleNode(0);
}

uint64_t type metadata completion function for MerkleNode()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for NodeIdentity(319);
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for MerkleNode()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MerkleNode.parent.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of MerkleNode.parent.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of MerkleNode.parent.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of MerkleNode.left.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of MerkleNode.left.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of MerkleNode.left.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of MerkleNode.right.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of MerkleNode.right.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of MerkleNode.right.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of MerkleNode.hash.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of MerkleNode.__allocating_init(node:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t type metadata accessor for MerkleTree()
{
  return objc_opt_self();
}

uint64_t method lookup function for MerkleTree()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MerkleTree.root.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of MerkleTree.root.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of MerkleTree.root.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of MerkleTree.rootHash.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of MerkleTree.__allocating_init(nodeIdentities:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of MerkleTree.verify(node:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t specialized MerkleTree.createParent(leftNode:rightNode:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  uint64_t v18;
  void (*v19)(uint64_t);
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;

  v25 = type metadata accessor for NodeIdentity(0);
  MEMORY[0x1E0C80A78](v25);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for SHA256Digest();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for SHA256();
  v26 = *(_QWORD *)(v10 - 8);
  v27 = v10;
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = SHA256.init()();
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 184))(v13);
  v29 = v12;
  SHA256Digest.withUnsafeBytes<A>(_:)();
  v14 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
  v15 = v14(v9, v6);
  (*(void (**)(uint64_t))(*(_QWORD *)a2 + 184))(v15);
  v28 = v12;
  SHA256Digest.withUnsafeBytes<A>(_:)();
  v14(v9, v6);
  SHA256.finalize()();
  swift_storeEnumTagMultiPayload();
  type metadata accessor for MerkleNode(0);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_parent) = 0;
  *(_QWORD *)(v16 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_left) = 0;
  *(_QWORD *)(v16 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_right) = 0;
  outlined init with take of NodeIdentity((uint64_t)v5, v16 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_node);
  v17 = *(void (**)(uint64_t))(*(_QWORD *)a1 + 120);
  v18 = swift_retain();
  v17(v18);
  v19 = *(void (**)(uint64_t))(*(_QWORD *)a2 + 120);
  v20 = swift_retain();
  v19(v20);
  v21 = (_QWORD *)(v16 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_left);
  swift_beginAccess();
  *v21 = a1;
  swift_retain();
  swift_release();
  v22 = (_QWORD *)(v16 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_right);
  swift_beginAccess();
  *v22 = a2;
  swift_retain();
  swift_release();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v12, v27);
  return v16;
}

uint64_t partial apply for closure #2 in MerkleTree.createParent(leftNode:rightNode:)()
{
  return closure #1 in MerkleTree.createParent(leftNode:rightNode:)();
}

uint64_t partial apply for closure #1 in MerkleTree.createParent(leftNode:rightNode:)()
{
  return partial apply for closure #2 in MerkleTree.createParent(leftNode:rightNode:)();
}

uint64_t ProcessVerifierError.message.getter(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t ProcessVerifierError.message.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ProcessVerifierError.message.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t ProcessVerifierError.description.getter(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ProcessVerifierError()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ProcessVerifier.useStaticKeyForTesting.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SLDProcessVerifier_useStaticKeyForTesting);
  swift_beginAccess();
  return *v1;
}

uint64_t ProcessVerifier.useStaticKeyForTesting.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___SLDProcessVerifier_useStaticKeyForTesting);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*ProcessVerifier.useStaticKeyForTesting.modify())()
{
  swift_beginAccess();
  return CollaborationAttributionView.remoteContentDidLoad.modify;
}

uint64_t ProcessVerifier.staticTestingKey.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v3 = type metadata accessor for SymmetricKeySize();
  MEMORY[0x1E0C80A78](v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey??);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v17 - v8;
  v10 = v1 + OBJC_IVAR___SLDProcessVerifier____lazy_storage___staticTestingKey;
  swift_beginAccess();
  outlined init with copy of (NSAttributedStringKey, Any)(v10, (uint64_t)v9, &demangling cache variable for type metadata for SymmetricKey??);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11) != 1)
    return outlined init with take of SymmetricKey?((uint64_t)v9, a1);
  outlined destroy of SymmetricKey??((uint64_t)v9, &demangling cache variable for type metadata for SymmetricKey??);
  v13 = (_BYTE *)(v1 + OBJC_IVAR___SLDProcessVerifier_useStaticKeyForTesting);
  swift_beginAccess();
  if (*v13 == 1)
  {
    static SymmetricKeySize.bits128.getter();
    SymmetricKey.init(size:)();
    v14 = type metadata accessor for SymmetricKey();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(a1, 0, 1, v14);
  }
  else
  {
    v16 = type metadata accessor for SymmetricKey();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a1, 1, 1, v16);
  }
  outlined init with copy of (NSAttributedStringKey, Any)(a1, (uint64_t)v7, &demangling cache variable for type metadata for SymmetricKey?);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v7, 0, 1, v11);
  swift_beginAccess();
  outlined assign with take of SymmetricKey??((uint64_t)v7, v10);
  return swift_endAccess();
}

uint64_t static ProcessVerifier.tagData(from:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v3 = type metadata accessor for String.Encoding();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    static String.Encoding.utf8.getter();
    a2 = String.data(using:allowLossyConversion:)();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return a2;
}

_DWORD *ProcessVerifier.sign(process:tag:)(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  NSObject *ObjectType;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  id v12;
  _DWORD *v13;
  uint64_t v14;
  _DWORD *v15;
  _DWORD *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  _QWORD *v31;
  id v32;
  uint8_t *v33;
  _QWORD v34[2];
  uint8_t *v35;
  uint64_t v36;
  char *v37;
  unint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  ObjectType = swift_getObjectType();
  v8 = type metadata accessor for SymmetricKey();
  v40 = *(_QWORD *)(v8 - 8);
  v41 = v8;
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (void *)objc_opt_self();
  v42 = 0;
  v12 = objc_msgSend(v11, sel_archivedDataWithRootObject_requiringSecureCoding_error_, a1, 1, &v42);
  v13 = v42;
  if (!v12)
  {
    v16 = v13;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    goto LABEL_6;
  }
  v39 = ObjectType;
  v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v16 = v15;

  ProcessVerifier.acquireKey()((uint64_t)v10);
  if (v3)
  {
    outlined consume of Data._Representation(v14, (unint64_t)v16);
    ObjectType = v39;
LABEL_6:
    if (one-time initialization token for ProcessVerifier != -1)
      swift_once();
    v19 = type metadata accessor for Logger();
    __swift_project_value_buffer(v19, (uint64_t)static Log.ProcessVerifier);
    v20 = Logger.logObject.getter();
    v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v16 = (_DWORD *)swift_slowAlloc();
      v22 = swift_slowAlloc();
      v42 = ObjectType;
      v43[0] = v22;
      *v16 = 136315138;
      swift_getMetatypeMetadata();
      v23 = String.init<A>(describing:)();
      v42 = (id)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v23, v24, v43);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_199EFF000, v20, v21, "sign() caught error: %s", (uint8_t *)v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x19AEC4EBC](v22, -1, -1);
      MEMORY[0x19AEC4EBC](v16, -1, -1);
    }

    swift_willThrow();
    return v16;
  }
  v17 = (unint64_t)v16;
  v18 = v14;
  v16 = specialized ProcessVerifier.createSealedBox(from:using:tag:)(v14, (uint64_t)v16, (uint64_t)v10, a2, a3);
  v37 = v10;
  v38 = v17;
  if (one-time initialization token for ProcessVerifier != -1)
    swift_once();
  v26 = type metadata accessor for Logger();
  __swift_project_value_buffer(v26, (uint64_t)static Log.ProcessVerifier);
  v27 = a1;
  v28 = Logger.logObject.getter();
  v29 = static os_log_type_t.debug.getter();
  v39 = v28;
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc();
    v31 = (_QWORD *)swift_slowAlloc();
    v35 = v30;
    v36 = v18;
    *(_DWORD *)v30 = 138412290;
    v34[1] = v30 + 4;
    v42 = v27;
    v32 = v27;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v31 = v27;

    v33 = v35;
    _os_log_impl(&dword_199EFF000, v39, v29, "sign() successfully signed process: %@", v35, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x19AEC4EBC](v31, -1, -1);
    MEMORY[0x19AEC4EBC](v33, -1, -1);
    outlined consume of Data._Representation(v36, v38);
  }
  else
  {
    outlined consume of Data._Representation(v18, v38);

  }
  (*(void (**)(char *, uint64_t))(v40 + 8))(v37, v41);
  return v16;
}

uint64_t ProcessVerifier.acquireKey()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  _BYTE *v14;
  uint64_t result;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;

  v21 = a1;
  v3 = type metadata accessor for SymmetricKeySize();
  MEMORY[0x1E0C80A78](v3);
  v4 = type metadata accessor for SymmetricKey();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v20 - v12;
  v14 = (_BYTE *)(v1 + OBJC_IVAR___SLDProcessVerifier_useStaticKeyForTesting);
  swift_beginAccess();
  if (*v14 == 1)
  {
    ProcessVerifier.staticTestingKey.getter((uint64_t)v13);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v13, 1, v4) != 1)
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(v21, v13, v4);
    outlined destroy of SymmetricKey??((uint64_t)v13, &demangling cache variable for type metadata for SymmetricKey?);
  }
  result = specialized GenericPasswordStore.readKey<A>(account:)(0xD000000000000028, 0x8000000199FB0810, (uint64_t)v11);
  if (v2)
    return result;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v11, 1, v4) == 1)
  {
    outlined destroy of SymmetricKey??((uint64_t)v11, &demangling cache variable for type metadata for SymmetricKey?);
    if (one-time initialization token for ProcessVerifier != -1)
      swift_once();
    v16 = type metadata accessor for Logger();
    __swift_project_value_buffer(v16, (uint64_t)static Log.ProcessVerifier);
    v17 = Logger.logObject.getter();
    v18 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_199EFF000, v17, v18, "acquireKey() did not find an existing key in the keychain. Creating one.", v19, 2u);
      MEMORY[0x19AEC4EBC](v19, -1, -1);
    }

    static SymmetricKeySize.bits128.getter();
    SymmetricKey.init(size:)();
    specialized GenericPasswordStore.storeKey<A>(_:account:)((uint64_t)v7, 0xD000000000000028, 0x8000000199FB0810);
    v13 = v7;
  }
  else
  {
    v13 = v11;
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(v21, v13, v4);
}

char *ProcessVerifier.verify(data:tag:)(uint64_t a1, unint64_t a2, uint8_t *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint8_t *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v27;
  char *v28;
  char *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  char *v35;
  uint64_t v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  uint8_t *v43;
  uint8_t *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint8_t *v50;
  uint64_t v51;
  char *v52;
  NSObject *ObjectType;
  uint8_t *v54;
  unint64_t v55;
  uint64_t v56;

  v50 = a3;
  v51 = a4;
  v52 = (char *)a2;
  ObjectType = swift_getObjectType();
  v6 = type metadata accessor for AES.GCM.SealedBox();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for SymmetricKey();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  ProcessVerifier.acquireKey()((uint64_t)v13);
  if (!v4)
  {
    v47 = v7;
    v48 = v11;
    v49 = v10;
    v14 = v51;
    v15 = (uint64_t)v52;
    outlined copy of Data._Representation(a1, (unint64_t)v52);
    specialized AES.GCM.SealedBox.init<A>(combined:)(a1, v15);
    v16 = v9;
    v17 = v13;
    if (v14 >> 60 == 15)
    {
      v27 = static AES.GCM.open(_:using:)();
      v9 = v28;
      (*(void (**)(char *, uint64_t))(v47 + 8))(v16, v6);
    }
    else
    {
      v18 = v50;
      v54 = v50;
      v55 = v14;
      outlined copy of Data._Representation((uint64_t)v50, v14);
      lazy protocol witness table accessor for type Data and conformance Data();
      v27 = static AES.GCM.open<A>(_:using:authenticating:)();
      v9 = v29;
      (*(void (**)(char *, uint64_t))(v47 + 8))(v16, v6);
      outlined consume of Data?((uint64_t)v18, v14);
    }
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSKeyedUnarchiver);
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for RBSProcessIdentity);
    v30 = (void *)static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
    if (v30)
    {
      v51 = v27;
      v52 = v9;
      if (one-time initialization token for ProcessVerifier != -1)
        swift_once();
      v31 = type metadata accessor for Logger();
      __swift_project_value_buffer(v31, (uint64_t)static Log.ProcessVerifier);
      v9 = v30;
      v32 = Logger.logObject.getter();
      v33 = static os_log_type_t.debug.getter();
      ObjectType = v32;
      if (os_log_type_enabled(v32, v33))
      {
        v34 = (uint8_t *)swift_slowAlloc();
        v47 = swift_slowAlloc();
        v50 = v34;
        *(_DWORD *)v34 = 138412290;
        v54 = (uint8_t *)v9;
        v35 = v9;
        v17 = v13;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        v36 = v47;
        *(_QWORD *)v47 = v30;

        v37 = v33;
        v38 = v50;
        _os_log_impl(&dword_199EFF000, ObjectType, v37, "verify() successfully verified process: %@", v50, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        MEMORY[0x19AEC4EBC](v36, -1, -1);
        MEMORY[0x19AEC4EBC](v38, -1, -1);
        outlined consume of Data._Representation(v51, (unint64_t)v52);
      }
      else
      {
        outlined consume of Data._Representation(v51, (unint64_t)v52);

      }
      (*(void (**)(char *, uint64_t))(v48 + 8))(v17, v49);
      return v9;
    }
    if (one-time initialization token for ProcessVerifier != -1)
      swift_once();
    v39 = type metadata accessor for Logger();
    __swift_project_value_buffer(v39, (uint64_t)static Log.ProcessVerifier);
    v40 = Logger.logObject.getter();
    v41 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = v27;
      v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_199EFF000, v40, v41, "verify() could not unarchive a process identity from signed data.", v43, 2u);
      v44 = v43;
      v27 = v42;
      MEMORY[0x19AEC4EBC](v44, -1, -1);
    }

    lazy protocol witness table accessor for type ProcessVerifierError and conformance ProcessVerifierError();
    swift_allocError();
    *v45 = 0xD000000000000041;
    v45[1] = 0x8000000199FB06E0;
    swift_willThrow();
    outlined consume of Data._Representation(v27, (unint64_t)v9);
    (*(void (**)(char *, uint64_t))(v48 + 8))(v13, v49);
  }
  if (one-time initialization token for ProcessVerifier != -1)
    swift_once();
  v19 = type metadata accessor for Logger();
  __swift_project_value_buffer(v19, (uint64_t)static Log.ProcessVerifier);
  v20 = Logger.logObject.getter();
  v21 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    v23 = swift_slowAlloc();
    v56 = v23;
    *(_DWORD *)v22 = 136315138;
    v9 = (char *)(v22 + 12);
    v54 = (uint8_t *)ObjectType;
    swift_getMetatypeMetadata();
    v24 = String.init<A>(describing:)();
    v54 = (uint8_t *)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &v56);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_199EFF000, v20, v21, "verify() caught error: %s", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AEC4EBC](v23, -1, -1);
    MEMORY[0x19AEC4EBC](v22, -1, -1);
  }

  swift_willThrow();
  return v9;
}

uint64_t specialized GenericPasswordStore.readKey<A>(account:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t inited;
  uint64_t v7;
  uint64_t countAndFlagsBits;
  void *object;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const __CFDictionary *isa;
  OSStatus v20;
  uint64_t v21;
  uint64_t v22;
  CFStringRef v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  Swift::String v30;
  _OWORD *v31;
  __int128 v33;
  CFTypeRef result[37];

  result[35] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_199FA8470;
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 40) = v7;
  if (one-time initialization token for KeychainAccessGroup != -1)
    swift_once();
  countAndFlagsBits = KeychainAccessGroup._countAndFlagsBits;
  object = KeychainAccessGroup._object;
  v10 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 48) = countAndFlagsBits;
  *(_QWORD *)(inited + 56) = object;
  *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 88) = v11;
  v12 = (void *)*MEMORY[0x1E0CD6CA8];
  type metadata accessor for CFStringRef(0);
  *(_QWORD *)(inited + 120) = v13;
  *(_QWORD *)(inited + 96) = v12;
  *(_QWORD *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 136) = v14;
  *(_QWORD *)(inited + 168) = v10;
  *(_QWORD *)(inited + 144) = a1;
  *(_QWORD *)(inited + 152) = a2;
  *(_QWORD *)(inited + 176) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 184) = v15;
  v16 = MEMORY[0x1E0DEAFA0];
  *(_QWORD *)(inited + 216) = MEMORY[0x1E0DEAFA0];
  *(_BYTE *)(inited + 192) = 1;
  *(_QWORD *)(inited + 224) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 232) = v17;
  *(_QWORD *)(inited + 264) = v16;
  *(_BYTE *)(inited + 240) = 1;
  swift_bridgeObjectRetain();
  v18 = v12;
  swift_bridgeObjectRetain();
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  result[0] = 0;
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v20 = SecItemCopyMatching(isa, result);

  if (v20 == -25300)
  {
    v22 = type metadata accessor for SymmetricKey();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(a3, 1, 1, v22);
  }
  else if (v20)
  {
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    *(_QWORD *)&v33 = 0xD000000000000016;
    *((_QWORD *)&v33 + 1) = 0x8000000199FB0860;
    v23 = SecCopyErrorMessageString(v20, 0);
    if (v23)
    {
      v24 = (__CFString *)v23;
      v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v27 = v26;

    }
    else
    {
      v25 = dispatch thunk of CustomStringConvertible.description.getter();
      v27 = v29;
    }
    v30._countAndFlagsBits = v25;
    v30._object = v27;
    String.append(_:)(v30);
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type GenericPasswordStoreError and conformance GenericPasswordStoreError();
    swift_allocError();
    *v31 = v33;
    swift_willThrow();
  }
  else if (result[0] && (swift_unknownObjectRetain(), swift_dynamicCast()))
  {
    SymmetricKey.init<A>(data:)();
    v21 = type metadata accessor for SymmetricKey();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(a3, 0, 1, v21);
  }
  else
  {
    v28 = type metadata accessor for SymmetricKey();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(a3, 1, 1, v28);
  }
  return swift_unknownObjectRelease();
}

void specialized AES.GCM.SealedBox.init<A>(combined:)(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_199F77DC4()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (BYTE6(v0) > 0x1BuLL)
  {
    outlined copy of Data._Representation(v1, v0);
    specialized Data.init<A>(_:)(v1, v0);
    AES.GCM.SealedBox.init(combined:)();
  }
  else
  {
    v2 = type metadata accessor for CryptoKitError();
    lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CryptoKitError and conformance CryptoKitError, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA91E8], MEMORY[0x1E0CA91F0]);
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v3, *MEMORY[0x1E0CA91E0], v2);
    swift_willThrow();
  }
  return outlined consume of Data._Representation(v1, v0);
}

id ProcessVerifier.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ProcessVerifier.init()()
{
  _BYTE *v0;
  objc_class *ObjectType;
  char *v2;
  uint64_t v3;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  v0[OBJC_IVAR___SLDProcessVerifier_useStaticKeyForTesting] = 0;
  v2 = &v0[OBJC_IVAR___SLDProcessVerifier____lazy_storage___staticTestingKey];
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  v5.receiver = v0;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_init);
}

id ProcessVerifier.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void specialized GenericPasswordStore.storeKey<A>(_:account:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t inited;
  uint64_t v6;
  uint64_t countAndFlagsBits;
  void *object;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  const __CFDictionary *isa;
  OSStatus v23;
  CFStringRef v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  Swift::String v30;
  _OWORD *v31;
  __int128 v32;
  __int128 v33;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_199FA8480;
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 40) = v6;
  if (one-time initialization token for KeychainAccessGroup != -1)
    swift_once();
  countAndFlagsBits = KeychainAccessGroup._countAndFlagsBits;
  object = KeychainAccessGroup._object;
  v9 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 48) = countAndFlagsBits;
  *(_QWORD *)(inited + 56) = object;
  *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 88) = v10;
  v11 = (void *)*MEMORY[0x1E0CD6CA8];
  type metadata accessor for CFStringRef(0);
  v13 = v12;
  *(_QWORD *)(inited + 120) = v12;
  *(_QWORD *)(inited + 96) = v11;
  *(_QWORD *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 136) = v14;
  *(_QWORD *)(inited + 168) = v9;
  *(_QWORD *)(inited + 144) = a2;
  *(_QWORD *)(inited + 152) = a3;
  *(_QWORD *)(inited + 176) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 184) = v15;
  v16 = (void *)*MEMORY[0x1E0CD68A8];
  *(_QWORD *)(inited + 216) = v13;
  *(_QWORD *)(inited + 192) = v16;
  *(_QWORD *)(inited + 224) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 232) = v17;
  *(_QWORD *)(inited + 264) = MEMORY[0x1E0DEAFA0];
  *(_BYTE *)(inited + 240) = 1;
  *(_QWORD *)(inited + 272) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 280) = v18;
  type metadata accessor for SymmetricKey();
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type SymmetricKey and conformance SymmetricKey, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA93C8], MEMORY[0x1E0CA9398]);
  swift_bridgeObjectRetain();
  v19 = v11;
  swift_bridgeObjectRetain();
  v20 = v16;
  v21 = MEMORY[0x1E0CB0338];
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
  *(_QWORD *)(inited + 312) = v21;
  *(_OWORD *)(inited + 288) = v32;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v23 = SecItemAdd(isa, 0);

  if (v23)
  {
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    *(_QWORD *)&v33 = 0xD000000000000016;
    *((_QWORD *)&v33 + 1) = 0x8000000199FB0840;
    v24 = SecCopyErrorMessageString(v23, 0);
    if (v24)
    {
      v25 = (__CFString *)v24;
      v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v28 = v27;

    }
    else
    {
      v26 = dispatch thunk of CustomStringConvertible.description.getter();
      v28 = v29;
    }
    v30._countAndFlagsBits = v26;
    v30._object = v28;
    String.append(_:)(v30);
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type GenericPasswordStoreError and conformance GenericPasswordStoreError();
    swift_allocError();
    *v31 = v33;
    swift_willThrow();
  }
}

char *specialized ProcessVerifier.createSealedBox(from:using:tag:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v32 = a4;
  v33 = a1;
  v34 = a2;
  v35 = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AES.GCM.Nonce?);
  v7 = MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v30 - v10;
  v12 = type metadata accessor for AES.GCM.SealedBox();
  v30 = *(_QWORD *)(v12 - 8);
  v31 = v12;
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v30 - v16;
  v18 = type metadata accessor for AES.GCM.Nonce();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v21 = (char *)&v30 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  AES.GCM.Nonce.init()();
  if (a5 >> 60 == 15)
  {
    v38 = v33;
    v39 = v34;
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v9, v21, v18);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v9, 0, 1, v18);
    lazy protocol witness table accessor for type Data and conformance Data();
    v22 = v40;
    static AES.GCM.seal<A>(_:using:nonce:)();
    if (v22)
    {
      outlined destroy of SymmetricKey??((uint64_t)v9, &demangling cache variable for type metadata for AES.GCM.Nonce?);
      (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
      return v9;
    }
    v40 = v18;
    outlined destroy of SymmetricKey??((uint64_t)v9, &demangling cache variable for type metadata for AES.GCM.Nonce?);
    v9 = (char *)AES.GCM.SealedBox.combined.getter();
    v26 = v25;
    v17 = v15;
  }
  else
  {
    v38 = v33;
    v39 = v34;
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v11, v21, v18);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v11, 0, 1, v18);
    v23 = v32;
    v36 = v32;
    v37 = a5;
    outlined copy of Data._Representation(v32, a5);
    lazy protocol witness table accessor for type Data and conformance Data();
    v24 = v40;
    static AES.GCM.seal<A, B>(_:using:nonce:authenticating:)();
    if (v24)
    {
      outlined destroy of SymmetricKey??((uint64_t)v11, &demangling cache variable for type metadata for AES.GCM.Nonce?);
      (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
      outlined consume of Data?(v23, a5);
      return v9;
    }
    v40 = v18;
    outlined destroy of SymmetricKey??((uint64_t)v11, &demangling cache variable for type metadata for AES.GCM.Nonce?);
    v9 = (char *)AES.GCM.SealedBox.combined.getter();
    v26 = v27;
    outlined consume of Data?(v23, a5);
  }
  (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v31);
  if (v26 >> 60 == 15)
  {
    lazy protocol witness table accessor for type ProcessVerifierError and conformance ProcessVerifierError();
    swift_allocError();
    *v28 = 0xD000000000000045;
    v28[1] = 0x8000000199FB07C0;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v40);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v40);
  }
  return v9;
}

unint64_t lazy protocol witness table accessor for type ProcessVerifierError and conformance ProcessVerifierError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ProcessVerifierError and conformance ProcessVerifierError;
  if (!lazy protocol witness table cache variable for type ProcessVerifierError and conformance ProcessVerifierError)
  {
    result = MEMORY[0x19AEC4E20](&protocol conformance descriptor for ProcessVerifierError, &type metadata for ProcessVerifierError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ProcessVerifierError and conformance ProcessVerifierError);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Data and conformance Data()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    result = MEMORY[0x19AEC4E20](MEMORY[0x1E0CB0310], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return outlined consume of Data._Representation(a1, a2);
  return a1;
}

_QWORD *initializeBufferWithCopyOfBuffer for ProcessVerifierError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ProcessVerifierError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for ProcessVerifierError(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for ProcessVerifierError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ProcessVerifierError(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ProcessVerifierError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
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
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ProcessVerifierError()
{
  return &type metadata for ProcessVerifierError;
}

uint64_t ObjC metadata update function for ProcessVerifier()
{
  return type metadata accessor for ProcessVerifier();
}

uint64_t type metadata accessor for ProcessVerifier()
{
  uint64_t result;

  result = type metadata singleton initialization cache for ProcessVerifier;
  if (!type metadata singleton initialization cache for ProcessVerifier)
    return swift_getSingletonMetadata();
  return result;
}

void type metadata completion function for ProcessVerifier()
{
  unint64_t v0;

  type metadata accessor for SymmetricKey??();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void type metadata accessor for SymmetricKey??()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for SymmetricKey??)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for SymmetricKey?);
    v0 = type metadata accessor for Optional();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for SymmetricKey??);
  }
}

uint64_t outlined destroy of SymmetricKey??(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined assign with take of SymmetricKey??(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey??);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of SymmetricKey?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t lazy protocol witness table accessor for type GenericPasswordStoreError and conformance GenericPasswordStoreError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GenericPasswordStoreError and conformance GenericPasswordStoreError;
  if (!lazy protocol witness table cache variable for type GenericPasswordStoreError and conformance GenericPasswordStoreError)
  {
    result = MEMORY[0x19AEC4E20](&protocol conformance descriptor for GenericPasswordStoreError, &type metadata for GenericPasswordStoreError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GenericPasswordStoreError and conformance GenericPasswordStoreError);
  }
  return result;
}

void specialized Sequence.compactMap<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  int64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;

  v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for IDSAccount);
    lazy protocol witness table accessor for type IDSAccount and conformance NSObject();
    Set.Iterator.init(_cocoa:)();
    v1 = v27;
    v26 = v28;
    v3 = v29;
    v2 = v30;
    v4 = v31;
  }
  else
  {
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v26 = a1 + 56;
    v3 = ~v5;
    v6 = -v5;
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v4 = v7 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v2 = 0;
  }
  v23 = v3;
  v25 = (unint64_t)(v3 + 64) >> 6;
  v24 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  while (1)
  {
    v8 = v2;
    if ((v1 & 0x8000000000000000) == 0)
      break;
    if (!__CocoaSet.Iterator.next()())
      goto LABEL_38;
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for IDSAccount);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v11 = v32;
    swift_unknownObjectRelease();
    if (!v32)
      goto LABEL_38;
LABEL_31:
    v15 = objc_msgSend(v11, sel_loginID, v23);
    if (v15)
    {
      v16 = v15;
      v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v19 = v18;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v24 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v24[2] + 1, 1, v24);
      v21 = v24[2];
      v20 = v24[3];
      if (v21 >= v20 >> 1)
        v24 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v20 > 1), v21 + 1, 1, v24);
      v24[2] = v21 + 1;
      v22 = &v24[2 * v21];
      v22[4] = v17;
      v22[5] = v19;
    }
    else
    {

    }
  }
  if (v4)
  {
    v9 = __clz(__rbit64(v4));
    v4 &= v4 - 1;
    v10 = v9 | (v2 << 6);
LABEL_30:
    v11 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v10);
    if (!v11)
      goto LABEL_38;
    goto LABEL_31;
  }
  v12 = v2 + 1;
  if (!__OFADD__(v2, 1))
  {
    if (v12 >= v25)
      goto LABEL_38;
    v13 = *(_QWORD *)(v26 + 8 * v12);
    ++v2;
    if (!v13)
    {
      v2 = v8 + 2;
      if (v8 + 2 >= v25)
        goto LABEL_38;
      v13 = *(_QWORD *)(v26 + 8 * v2);
      if (!v13)
      {
        v2 = v8 + 3;
        if (v8 + 3 >= v25)
          goto LABEL_38;
        v13 = *(_QWORD *)(v26 + 8 * v2);
        if (!v13)
        {
          v2 = v8 + 4;
          if (v8 + 4 >= v25)
            goto LABEL_38;
          v13 = *(_QWORD *)(v26 + 8 * v2);
          if (!v13)
          {
            v2 = v8 + 5;
            if (v8 + 5 >= v25)
              goto LABEL_38;
            v13 = *(_QWORD *)(v26 + 8 * v2);
            if (!v13)
            {
              v14 = v8 + 6;
              while (v25 != v14)
              {
                v13 = *(_QWORD *)(v26 + 8 * v14++);
                if (v13)
                {
                  v2 = v14 - 1;
                  goto LABEL_29;
                }
              }
LABEL_38:
              outlined consume of Set<IDSAccount>.Iterator._Variant();
              return;
            }
          }
        }
      }
    }
LABEL_29:
    v4 = (v13 - 1) & v13;
    v10 = __clz(__rbit64(v13)) + (v2 << 6);
    goto LABEL_30;
  }
  __break(1u);
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t a1)
{
  return specialized Array.append<A>(contentsOf:)(a1, (uint64_t (*)(void))specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:), (uint64_t (*)(_QWORD))MEMORY[0x1E0CA92F8]);
}

{
  return specialized Array.append<A>(contentsOf:)(a1, (uint64_t (*)(void))specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:), (uint64_t (*)(_QWORD))MEMORY[0x1E0CA9758]);
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(_QWORD))
{
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = *v3;
  v6 = *(_QWORD *)(*v3 + 16);
  if (__OFADD__(v6, v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  if (swift_isUniquelyReferenced_nonNull_native()
    && (int64_t)(v6 + v4) <= *(_QWORD *)(v5 + 24) >> 1)
  {
    v10 = *(_QWORD *)(a1 + 16);
    if (v10)
      goto LABEL_5;
LABEL_15:
    if (!v4)
      goto LABEL_16;
    goto LABEL_18;
  }
  v5 = a2();
  v10 = *(_QWORD *)(a1 + 16);
  if (!v10)
    goto LABEL_15;
LABEL_5:
  v11 = *(_QWORD *)(v5 + 16);
  v12 = (*(_QWORD *)(v5 + 24) >> 1) - v11;
  v13 = a3(0);
  if (v12 < (uint64_t)v10)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v14 = *(_QWORD *)(v13 - 8);
  v15 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v16 = *(_QWORD *)(v14 + 72);
  v17 = v5 + v15 + v16 * v11;
  v18 = a1 + v15;
  v19 = v16 * v10;
  v20 = v17 + v19;
  v21 = v18 + v19;
  if (v18 < v20 && v17 < v21)
    goto LABEL_21;
  swift_arrayInitWithCopy();
  if (v10 < v4)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v23 = *(_QWORD *)(v5 + 16);
  v24 = __OFADD__(v23, v10);
  v25 = v23 + v10;
  if (!v24)
  {
    *(_QWORD *)(v5 + 16) = v25;
LABEL_16:
    result = swift_bridgeObjectRelease();
    *v3 = v5;
    return result;
  }
LABEL_20:
  __break(1u);
LABEL_21:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

Swift::Int *SL_GLT_KEY_BIT_COUNT.unsafeMutableAddressor()
{
  return &SL_GLT_KEY_BIT_COUNT;
}

uint64_t one-time initialization function for SL_GLT_SEED_EXTRACTION_LABEL()
{
  uint64_t result;
  uint64_t v1;

  result = specialized Data.init<A>(_:)(0xD000000000000017, 0x8000000199FB0A10);
  SL_GLT_SEED_EXTRACTION_LABEL = result;
  *(_QWORD *)algn_1EE378378 = v1;
  return result;
}

uint64_t *SL_GLT_SEED_EXTRACTION_LABEL.unsafeMutableAddressor()
{
  if (one-time initialization token for SL_GLT_SEED_EXTRACTION_LABEL != -1)
    swift_once();
  return &SL_GLT_SEED_EXTRACTION_LABEL;
}

uint64_t KeyQueryController.service.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___SLKeyQueryController_service);
  swift_bridgeObjectRetain();
  return v1;
}

id KeyQueryController.queue.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___SLKeyQueryController_queue);
}

uint64_t KeyQueryController.queryController.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of HighlightDisambiguationPillMetricVariant(v1 + OBJC_IVAR___SLKeyQueryController_queryController, a1);
}

id KeyQueryController.idsService.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___SLKeyQueryController_idsService);
}

void KeyQueryController.pushTokenForSelf.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___SLKeyQueryController____lazy_storage___pushTokenForSelf);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR___SLKeyQueryController____lazy_storage___pushTokenForSelf);
  v3 = *(_QWORD *)(v0 + OBJC_IVAR___SLKeyQueryController____lazy_storage___pushTokenForSelf + 8);
  if (v3 >> 60 != 15)
    goto LABEL_5;
  v4 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, sel_pushToken);

    if (v6)
    {
      v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      v9 = v8;

      v10 = *v1;
      v11 = v1[1];
      *v1 = v7;
      v1[1] = v9;
      outlined copy of Data._Representation(v7, v9);
      outlined consume of Data?(v10, v11);
LABEL_5:
      outlined copy of Data?(v2, v3);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t outlined copy of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return outlined copy of Data._Representation(a1, a2);
  return a1;
}

uint64_t KeyQueryController.pushTokenForSelf.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;

  v3 = (_QWORD *)(v2 + OBJC_IVAR___SLKeyQueryController____lazy_storage___pushTokenForSelf);
  v4 = *(_QWORD *)(v2 + OBJC_IVAR___SLKeyQueryController____lazy_storage___pushTokenForSelf);
  v5 = *(_QWORD *)(v2 + OBJC_IVAR___SLKeyQueryController____lazy_storage___pushTokenForSelf + 8);
  *v3 = a1;
  v3[1] = a2;
  return outlined consume of Data?(v4, v5);
}

uint64_t (*KeyQueryController.pushTokenForSelf.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  a1[2] = v1;
  KeyQueryController.pushTokenForSelf.getter();
  *a1 = v3;
  a1[1] = v4;
  return KeyQueryController.pushTokenForSelf.modify;
}

uint64_t KeyQueryController.pushTokenForSelf.modify(uint64_t *a1, char a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;

  v2 = a1[1];
  v3 = *a1;
  v4 = (uint64_t *)(a1[2] + OBJC_IVAR___SLKeyQueryController____lazy_storage___pushTokenForSelf);
  v5 = *v4;
  v6 = v4[1];
  *v4 = *a1;
  v4[1] = v2;
  if ((a2 & 1) == 0)
    return outlined consume of Data?(v5, v6);
  outlined copy of Data._Representation(v3, v2);
  outlined consume of Data?(v5, v6);
  return outlined consume of Data._Representation(v3, v2);
}

id KeyQueryController.localAccountHandles.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id result;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = OBJC_IVAR___SLKeyQueryController____lazy_storage___localAccountHandles;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR___SLKeyQueryController____lazy_storage___localAccountHandles);
  v3 = v2;
  if (v2 != 1)
    goto LABEL_4;
  result = objc_msgSend(*(id *)(v0 + OBJC_IVAR___SLKeyQueryController_idsService), sel_accounts);
  if (result)
  {
    v5 = result;
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for IDSAccount);
    lazy protocol witness table accessor for type IDSAccount and conformance NSObject();
    v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    specialized Sequence.compactMap<A>(_:)(v6);
    v3 = v7;
    swift_bridgeObjectRelease();
    v8 = *(_QWORD *)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v3;
    swift_bridgeObjectRetain();
    outlined consume of [String]??(v8);
LABEL_4:
    outlined copy of [String]??(v2);
    return (id)v3;
  }
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type IDSAccount and conformance NSObject()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type IDSAccount and conformance NSObject;
  if (!lazy protocol witness table cache variable for type IDSAccount and conformance NSObject)
  {
    v1 = type metadata accessor for SLHighlight(255, &lazy cache variable for type metadata for IDSAccount);
    result = MEMORY[0x19AEC4E20](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type IDSAccount and conformance NSObject);
  }
  return result;
}

uint64_t outlined consume of [String]??(uint64_t result)
{
  if (result != 1)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t outlined copy of [String]??(uint64_t result)
{
  if (result != 1)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t KeyQueryController.localAccountHandles.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR___SLKeyQueryController____lazy_storage___localAccountHandles);
  *(_QWORD *)(v1 + OBJC_IVAR___SLKeyQueryController____lazy_storage___localAccountHandles) = a1;
  return outlined consume of [String]??(v2);
}

uint64_t (*KeyQueryController.localAccountHandles.modify(id *a1))(_QWORD *a1, char a2)
{
  void *v1;

  a1[1] = v1;
  *a1 = KeyQueryController.localAccountHandles.getter();
  return KeyQueryController.localAccountHandles.modify;
}

uint64_t KeyQueryController.localAccountHandles.modify(_QWORD *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[1];
  v3 = *(_QWORD *)(v2 + OBJC_IVAR___SLKeyQueryController____lazy_storage___localAccountHandles);
  *(_QWORD *)(v2 + OBJC_IVAR___SLKeyQueryController____lazy_storage___localAccountHandles) = *a1;
  if ((a2 & 1) == 0)
    return outlined consume of [String]??(v3);
  swift_bridgeObjectRetain();
  outlined consume of [String]??(v3);
  return swift_bridgeObjectRelease();
}

id KeyQueryController.__allocating_init(service:targetQueue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  objc_class *v4;
  id v8;
  uint64_t ObjectType;
  id result;
  id v11;
  uint64_t v12;
  _QWORD v13[5];

  v4 = v3;
  v8 = objc_allocWithZone(v4);
  ObjectType = swift_getObjectType();
  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (result)
  {
    v11 = result;
    v13[3] = type metadata accessor for SLHighlight(0, (unint64_t *)&lazy cache variable for type metadata for IDSIDQueryController);
    v13[4] = &protocol witness table for IDSIDQueryController;
    v13[0] = v11;
    v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(ObjectType + 176))(a1, a2, a3, v13);
    swift_deallocPartialClassInstance();
    return (id)v12;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id KeyQueryController.init(service:targetQueue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjectType;
  id result;
  id v8;
  uint64_t v9;
  _QWORD v10[5];

  ObjectType = swift_getObjectType();
  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (result)
  {
    v8 = result;
    v10[3] = type metadata accessor for SLHighlight(0, (unint64_t *)&lazy cache variable for type metadata for IDSIDQueryController);
    v10[4] = &protocol witness table for IDSIDQueryController;
    v10[0] = v8;
    v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(ObjectType + 176))(a1, a2, a3, v10);
    swift_deallocPartialClassInstance();
    return (id)v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t KeyQueryController.__allocating_init(service:targetQueue:queryController:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  objc_class *v4;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v9 = objc_allocWithZone(v4);
  specialized KeyQueryController.init(service:targetQueue:queryController:)(a1, a2, a3, a4);
  v11 = v10;

  return v11;
}

uint64_t KeyQueryController.init(service:targetQueue:queryController:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  specialized KeyQueryController.init(service:targetQueue:queryController:)(a1, a2, a3, a4);
  v6 = v5;

  return v6;
}

uint64_t KeyQueryController.publicKeysAndTPS(for:documentIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v5[13] = a4;
  v5[14] = v4;
  v5[11] = a2;
  v5[12] = a3;
  v5[10] = a1;
  v6 = type metadata accessor for P256.Signing.PublicKey();
  v5[15] = v6;
  v5[16] = *(_QWORD *)(v6 - 8);
  v5[17] = swift_task_alloc();
  v5[18] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: P256.Signing.PublicKey, tps: Data));
  v5[19] = swift_task_alloc();
  v5[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t KeyQueryController.publicKeysAndTPS(for:documentIdentifier:)()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  char *v7;
  unint64_t v8;
  unint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t (*v24)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v25;

  if (one-time initialization token for keyController != -1)
    swift_once();
  v1 = (void *)v0[14];
  v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Log.keyController);
  swift_bridgeObjectRetain_n();
  v3 = v1;
  v4 = Logger.logObject.getter();
  v5 = static os_log_type_t.default.getter();
  v6 = os_log_type_enabled(v4, v5);
  v7 = (char *)v0[14];
  v8 = v0[11];
  v9 = &lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey;
  if (v6)
  {
    v10 = v0[10];
    v11 = swift_slowAlloc();
    v23 = swift_slowAlloc();
    v25 = v23;
    *(_DWORD *)v11 = 136315394;
    swift_bridgeObjectRetain();
    v0[8] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v8, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v11 + 12) = 2080;
    v12 = *(_QWORD *)&v7[OBJC_IVAR___SLKeyQueryController_service];
    v13 = *(_QWORD *)&v7[OBJC_IVAR___SLKeyQueryController_service + 8];
    swift_bridgeObjectRetain();
    v0[9] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v13, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_199EFF000, v4, v5, "Querying for IDSEndpoints for handles %s on service: %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    v9 = &lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey;
    MEMORY[0x19AEC4EBC](v23, -1, -1);
    MEMORY[0x19AEC4EBC](v11, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();

  }
  v14 = v0[14];
  v15 = *(_QWORD *)(v14 + OBJC_IVAR___SLKeyQueryController_queryController + 24);
  v16 = *(_QWORD *)(v14 + OBJC_IVAR___SLKeyQueryController_queryController + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v14 + OBJC_IVAR___SLKeyQueryController_queryController), v15);
  v17 = (uint64_t *)(v14 + v9[104]);
  v18 = *v17;
  v19 = v17[1];
  v20 = *(_QWORD *)(v14 + OBJC_IVAR___SLKeyQueryController_queue);
  v24 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(v16 + 8)
                                                                                            + *(_QWORD *)(v16 + 8));
  v21 = (_QWORD *)swift_task_alloc();
  v0[21] = v21;
  *v21 = v0;
  v21[1] = KeyQueryController.publicKeysAndTPS(for:documentIdentifier:);
  return v24(v0[10], v0[11], v18, v19, v20, v15, v16);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t);
  void *v25;
  uint64_t v26;
  uint64_t v27;

  v1 = *(_QWORD *)(v0 + 176);
  *(_QWORD *)(v0 + 56) = v1;
  if (*(_QWORD *)(v1 + 16))
  {
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v1 + 32, v0 + 16);
    specialized Array.replaceSubrange<A>(_:with:)(0, 1);
    v2 = *(_QWORD *)(v0 + 40);
    v3 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v2);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
    v5 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, unint64_t, _QWORD, _QWORD))((*MEMORY[0x1E0DEEDD8] & **(_QWORD **)(v0 + 112))
                                                                                             + 0xD0))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 136), 0, 0xF000000000000000, *(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104));
    v7 = v6;
    v8 = *(_QWORD *)(v0 + 160);
    v9 = *(_QWORD *)(v0 + 144);
    v10 = *(_QWORD *)(v0 + 128);
    v22 = *(_QWORD *)(v0 + 120);
    v23 = *(_QWORD *)(v0 + 152);
    v25 = *(void **)(v0 + 112);
    v26 = *(_QWORD *)(v0 + 104);
    v27 = *(_QWORD *)(v0 + 96);
    v11 = (uint64_t *)(v8 + *(int *)(v9 + 48));
    v12 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    ((void (*)(_QWORD))v12)(*(_QWORD *)(v0 + 136));
    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
    *v11 = v5;
    v11[1] = v7;
    v13 = (uint64_t *)(v23 + *(int *)(v9 + 48));
    v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
    v24(v23, v8, v22);
    *v13 = v5;
    v13[1] = v7;
    outlined copy of Data._Representation(v5, v7);
    v12(v23, v22);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<P256.Signing.PublicKey>);
    v14 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_199FA7E60;
    v24(v23, v8, v22);
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v10 + 32))(v15 + v14, v23, v22);
    v16 = *(_QWORD *)(v0 + 56);
    v17 = v25;
    outlined copy of Data._Representation(v5, v7);
    swift_bridgeObjectRetain();
    v18 = specialized Sequence.compactMap<A>(_:)(v16, v17, v5, v7, v27, v26);
    v19 = *(_QWORD *)(v0 + 160);
    v20 = *(void **)(v0 + 112);
    swift_bridgeObjectRelease();
    outlined consume of Data._Representation(v5, v7);

    swift_bridgeObjectRelease();
    specialized Array.append<A>(contentsOf:)(v18, (uint64_t (*)(void))specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:), (uint64_t (*)(_QWORD))MEMORY[0x1E0CA9758]);
    outlined destroy of SymmetricKey??(v19, &demangling cache variable for type metadata for (key: P256.Signing.PublicKey, tps: Data));
    v21 = v15;
  }
  else
  {
    swift_bridgeObjectRelease();
    v21 = 0;
    v5 = 0;
    v7 = 0;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(v0 + 8))(v21, v5, v7);
}

uint64_t KeyQueryController.publicKeysAndTPS(for:documentIdentifier:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 176) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> KeyQueryController.validateKeyType(_:isPublicKey:)(SecKeyRef _, Swift::Bool isPublicKey)
{
  CFDictionaryRef v2;
  CFDictionaryRef v3;
  uint64_t v4;

  v2 = SecKeyCopyAttributes(_);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    type metadata accessor for CFStringRef(0);
    lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t (*)(uint64_t))type metadata accessor for CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
    static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();

  }
  lazy protocol witness table accessor for type KeyQueryController.DiversificationErrors and conformance KeyQueryController.DiversificationErrors();
  swift_allocError();
  swift_willThrow();
}

id KeyQueryController.diversify(publicKey:tps:docId:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  Class isa;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v19[2];

  v19[1] = *(id *)MEMORY[0x1E0C80C00];
  if (a4 >> 60 == 15)
    isa = 0;
  else
    isa = Data._bridgeToObjectiveC()().super.isa;
  v11 = (void *)objc_opt_self();
  v12 = (void *)MEMORY[0x19AEC3B6C](a5, a6);
  v19[0] = 0;
  v13 = objc_msgSend(v11, sel_diversifyPublicKey_trackingPreventionSalt_withDocumentIdentifier_error_, a2, isa, v12, v19);

  if (v13)
  {
    v14 = v19[0];
    v15 = objc_msgSend(v13, sel_diversifiedKey);
    v16 = v15;
    SecKeyRef.p256PublicKey.getter();
    if (v6)
    {

    }
    else
    {

      v17 = objc_msgSend(v13, sel_trackingPreventionSalt);
      v16 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)();

    }
  }
  else
  {
    v16 = v19[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v16;
}

NSObject *KeyQueryController.diversifyKey(_:trackingPreventionSalt:documentIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4, char *a5, char *a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  SecKeyRef v24;
  SecKeyRef v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  char *v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char *v38;
  unint64_t v39;
  os_log_t v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  os_log_t v49;
  char *v50;
  char *v51;
  _QWORD *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;

  v50 = a5;
  v51 = a6;
  v48 = a3;
  v49 = a4;
  v47 = a1;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for P256.Signing.PublicKey?);
  v8 = MEMORY[0x1E0C80A78](v7);
  v44 = (uint64_t)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v46 = (uint64_t)&v43 - v10;
  v45 = type metadata accessor for P256.Signing.PublicKey();
  v11 = *(_QWORD *)(v45 - 8);
  v12 = MEMORY[0x1E0C80A78](v45);
  v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v12);
  v17 = (char *)&v43 - v16;
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v43 - v18;
  v20 = type metadata accessor for Logger();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  v23 = (char *)&v43 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = P256.Signing.PublicKey.secKey.getter();
  if (v24)
  {
    v25 = v24;
    v26 = (*(uint64_t (**)(uint64_t, SecKeyRef, uint64_t, os_log_t, char *, char *))((*MEMORY[0x1E0DEEDD8] & *v52) + 0xC8))(v47, v24, v48, v49, v50, v51);

  }
  else
  {
    v50 = v14;
    v51 = v17;
    v53 = v19;
    v27 = v11;
    v28 = v45;
    if (one-time initialization token for keyController != -1)
      swift_once();
    v29 = v20;
    v30 = __swift_project_value_buffer(v20, (uint64_t)static Log.keyController);
    (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v23, v30, v20);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v27 + 16);
    v32 = v53;
    v31(v53, a2, v28);
    v26 = Logger.logObject.getter();
    LODWORD(v52) = static os_log_type_t.error.getter();
    v33 = os_log_type_enabled(v26, (os_log_type_t)v52);
    v34 = v46;
    if (v33)
    {
      v49 = v26;
      v26 = swift_slowAlloc();
      v48 = swift_slowAlloc();
      v55 = v48;
      LODWORD(v26->isa) = 136315138;
      v31((char *)v34, (uint64_t)v32, v28);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v27 + 56))(v34, 0, 1, v28);
      v35 = v44;
      outlined init with copy of P256.Signing.PublicKey?(v34, v44);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v35, 1, v28) == 1)
      {
        v36 = 0xE300000000000000;
        v37 = 7104878;
      }
      else
      {
        v38 = v51;
        (*(void (**)(char *, uint64_t, uint64_t))(v27 + 32))(v51, v35, v28);
        v31(v50, (uint64_t)v38, v28);
        v37 = String.init<A>(reflecting:)();
        v36 = v39;
        (*(void (**)(char *, uint64_t))(v27 + 8))(v38, v28);
      }
      outlined destroy of SymmetricKey??(v46, &demangling cache variable for type metadata for P256.Signing.PublicKey?);
      v54 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v37, v36, &v55);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v53, v28);
      v40 = v49;
      _os_log_impl(&dword_199EFF000, v49, (os_log_type_t)v52, "Failed to create SecKey from P256 publicKey %s", (uint8_t *)v26, 0xCu);
      v41 = v48;
      swift_arrayDestroy();
      MEMORY[0x19AEC4EBC](v41, -1, -1);
      MEMORY[0x19AEC4EBC](v26, -1, -1);

    }
    else
    {
      (*(void (**)(char *, uint64_t))(v27 + 8))(v32, v28);

    }
    (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v29);
    lazy protocol witness table accessor for type KeyQueryController.DiversificationErrors and conformance KeyQueryController.DiversificationErrors();
    swift_allocError();
    swift_willThrow();
  }
  return v26;
}

uint64_t KeyQueryController.signData(data:documentIdentifier:trackingPreventionSalt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  int *v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t);

  v6[22] = a5;
  v6[23] = v5;
  v6[20] = a3;
  v6[21] = a4;
  v6[18] = a1;
  v6[19] = a2;
  v6[24] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: P256.Signing.PublicKey, tps: Data));
  v6[25] = swift_task_alloc();
  v6[26] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for P256.Signing.PublicKey?);
  v6[27] = swift_task_alloc();
  v7 = swift_task_alloc();
  v6[28] = v7;
  v8 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v5) + 0xE0);
  v11 = (uint64_t (*)(uint64_t))((char *)v8 + *v8);
  v9 = (_QWORD *)swift_task_alloc();
  v6[29] = v9;
  *v9 = v6;
  v9[1] = KeyQueryController.signData(data:documentIdentifier:trackingPreventionSalt:);
  return v11(v7);
}

uint64_t KeyQueryController.signData(data:documentIdentifier:trackingPreventionSalt:)()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 240) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  SecKeyRef v6;
  void (*v7)(uint64_t, uint64_t);
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  _BOOL4 v14;
  unint64_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  id v27;
  void *v28;
  Class isa;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v1 = *(_QWORD *)(v0 + 216);
  outlined init with copy of P256.Signing.PublicKey?(*(_QWORD *)(v0 + 224), v1);
  v2 = type metadata accessor for P256.Signing.PublicKey();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  v5 = *(_QWORD *)(v0 + 216);
  if (v4 == 1)
  {
    outlined destroy of SymmetricKey??(*(_QWORD *)(v0 + 216), &demangling cache variable for type metadata for P256.Signing.PublicKey?);
LABEL_9:
    outlined destroy of SymmetricKey??(*(_QWORD *)(v0 + 224), &demangling cache variable for type metadata for P256.Signing.PublicKey?);
    goto LABEL_13;
  }
  v6 = P256.Signing.PublicKey.secKey.getter();
  *(_QWORD *)(v0 + 248) = v6;
  v7 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v7(v5, v2);
  if (!v6)
    goto LABEL_9;
  v8 = *(void **)(v0 + 240);
  v9 = (*(uint64_t (**)(_QWORD, SecKeyRef, _QWORD, _QWORD, _QWORD, _QWORD))((*MEMORY[0x1E0DEEDD8] & **(_QWORD **)(v0 + 184))
                                                                                    + 0xC8))(*(_QWORD *)(v0 + 208), v6, *(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 160));
  if (!v8)
  {
    v19 = v9;
    v20 = v10;
    v21 = *(_QWORD *)(v0 + 200);
    v22 = *(_QWORD *)(v0 + 192);
    v36 = *(_QWORD *)(v0 + 184);
    v23 = *(_QWORD *)(v0 + 152);
    v24 = *(_QWORD *)(v0 + 160);
    v37 = *(_QWORD *)(v0 + 144);
    v25 = (uint64_t *)(*(_QWORD *)(v0 + 208) + *(int *)(v22 + 48));
    *v25 = v9;
    v25[1] = v10;
    v26 = (uint64_t *)(v21 + *(int *)(v22 + 48));
    (*(void (**)(uint64_t))(v3 + 16))(v21);
    *v26 = v19;
    v26[1] = v20;
    v27 = objc_allocWithZone(MEMORY[0x1E0D34E90]);
    swift_bridgeObjectRetain();
    outlined copy of Data._Representation(v19, v20);
    v28 = (void *)MEMORY[0x19AEC3B6C](v23, v24);
    swift_bridgeObjectRelease();
    isa = Data._bridgeToObjectiveC()().super.isa;
    v30 = objc_msgSend(v27, sel_initWithDiversifier_trackingPreventionSecret_, v28, isa);
    *(_QWORD *)(v0 + 256) = v30;
    outlined consume of Data._Representation(v19, v20);

    v7(v21, v2);
    v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D34E98]), sel_initWithKeyType_diversifier_, 1, v30);
    *(_QWORD *)(v0 + 264) = v31;
    v32 = *(void **)(v36 + OBJC_IVAR___SLKeyQueryController_idsService);
    *(_QWORD *)(v0 + 56) = v0 + 120;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = KeyQueryController.signData(data:documentIdentifier:trackingPreventionSalt:);
    v33 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x1E0C809B0];
    v34 = (_QWORD *)(v0 + 80);
    v34[1] = 0x40000000;
    v34[2] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSData?, @unowned NSError?) -> () with result type Data;
    v34[3] = &block_descriptor_0;
    v34[4] = v33;
    objc_msgSend(v32, sel_signData_withAlgorithm_options_completion_, v37, 1, v31, v34);
    return swift_continuation_await();
  }
  outlined destroy of SymmetricKey??(*(_QWORD *)(v0 + 224), &demangling cache variable for type metadata for P256.Signing.PublicKey?);

  if (one-time initialization token for default != -1)
    swift_once();
  v11 = type metadata accessor for Logger();
  __swift_project_value_buffer(v11, (uint64_t)static Log.default);
  swift_bridgeObjectRetain_n();
  v12 = Logger.logObject.getter();
  v13 = static os_log_type_t.error.getter();
  v14 = os_log_type_enabled(v12, v13);
  v15 = *(_QWORD *)(v0 + 160);
  if (v14)
  {
    v16 = *(_QWORD *)(v0 + 152);
    v17 = (uint8_t *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    v38 = v18;
    *(_DWORD *)v17 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 136) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v15, &v38);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_199EFF000, v12, v13, "Error while signing data for document with identifier: %s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AEC4EBC](v18, -1, -1);
    MEMORY[0x19AEC4EBC](v17, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

LABEL_13:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, unint64_t))(v0 + 8))(0, 0xF000000000000000);
}

{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 272) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(void **)(v0 + 256);
  v1 = *(void **)(v0 + 264);
  v3 = *(void **)(v0 + 248);
  v4 = *(_QWORD *)(v0 + 224);
  v5 = *(_QWORD *)(v0 + 208);

  outlined destroy of SymmetricKey??(v5, &demangling cache variable for type metadata for (key: P256.Signing.PublicKey, tps: Data));
  outlined destroy of SymmetricKey??(v4, &demangling cache variable for type metadata for P256.Signing.PublicKey?);
  v7 = *(_QWORD *)(v0 + 120);
  v6 = *(_QWORD *)(v0 + 128);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v7, v6);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  _BOOL4 v5;
  unint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v11;

  v1 = *(void **)(v0 + 240);
  if (one-time initialization token for default != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Log.default);
  swift_bridgeObjectRetain_n();
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.error.getter();
  v5 = os_log_type_enabled(v3, v4);
  v6 = *(_QWORD *)(v0 + 160);
  if (v5)
  {
    v7 = *(_QWORD *)(v0 + 152);
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v11 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 136) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v7, v6, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_199EFF000, v3, v4, "Error while signing data for document with identifier: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AEC4EBC](v9, -1, -1);
    MEMORY[0x19AEC4EBC](v8, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, unint64_t))(v0 + 8))(0, 0xF000000000000000);
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  unint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v16;

  v1 = *(void **)(v0 + 264);
  v3 = *(void **)(v0 + 248);
  v2 = *(void **)(v0 + 256);
  v4 = *(_QWORD *)(v0 + 224);
  v5 = *(_QWORD *)(v0 + 208);
  swift_willThrow();

  outlined destroy of SymmetricKey??(v5, &demangling cache variable for type metadata for (key: P256.Signing.PublicKey, tps: Data));
  outlined destroy of SymmetricKey??(v4, &demangling cache variable for type metadata for P256.Signing.PublicKey?);

  v6 = *(void **)(v0 + 272);
  if (one-time initialization token for default != -1)
    swift_once();
  v7 = type metadata accessor for Logger();
  __swift_project_value_buffer(v7, (uint64_t)static Log.default);
  swift_bridgeObjectRetain_n();
  v8 = Logger.logObject.getter();
  v9 = static os_log_type_t.error.getter();
  v10 = os_log_type_enabled(v8, v9);
  v11 = *(_QWORD *)(v0 + 160);
  if (v10)
  {
    v12 = *(_QWORD *)(v0 + 152);
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v16 = v14;
    *(_DWORD *)v13 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 136) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v11, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_199EFF000, v8, v9, "Error while signing data for document with identifier: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AEC4EBC](v14, -1, -1);
    MEMORY[0x19AEC4EBC](v13, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, unint64_t))(v0 + 8))(0, 0xF000000000000000);
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSData?, @unowned NSError?) -> () with result type Data(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    v8 = a2;
    v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v11 = v10;

    v12 = *(uint64_t **)(*(_QWORD *)(v3 + 64) + 40);
    *v12 = v9;
    v12[1] = v11;
    return swift_continuation_throwingResume();
  }
}

uint64_t KeyQueryController.localPublicKey()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = v1;
  return swift_task_switch();
}

{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t KeyQueryController.localPublicKey()()
{
  uint64_t v0;
  _QWORD *v1;
  unint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  char *v9;
  unint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v1 = (_QWORD *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **(_QWORD **)(v0 + 40)) + 0x98))();
  if (v1)
  {
    if (v1[2])
    {
      v2 = v1[5];
      v32 = v1[4];
      *(_QWORD *)(v0 + 48) = v2;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (one-time initialization token for keyController != -1)
        swift_once();
      v3 = *(void **)(v0 + 40);
      v4 = type metadata accessor for Logger();
      *(_QWORD *)(v0 + 56) = v4;
      __swift_project_value_buffer(v4, (uint64_t)static Log.keyController);
      swift_bridgeObjectRetain_n();
      v5 = v3;
      v6 = Logger.logObject.getter();
      v7 = static os_log_type_t.default.getter();
      v8 = os_log_type_enabled(v6, v7);
      v9 = *(char **)(v0 + 40);
      v10 = &lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey;
      if (v8)
      {
        v11 = swift_slowAlloc();
        v31 = swift_slowAlloc();
        v33[0] = v31;
        *(_DWORD *)v11 = 136315394;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 16) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v2, v33);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v11 + 12) = 2080;
        v13 = *(_QWORD *)&v9[OBJC_IVAR___SLKeyQueryController_service];
        v12 = *(_QWORD *)&v9[OBJC_IVAR___SLKeyQueryController_service + 8];
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 24) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v12, v33);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_199EFF000, v6, v7, "Querying for IDSEndpoints for handles %s on service: %s", (uint8_t *)v11, 0x16u);
        swift_arrayDestroy();
        v10 = &lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey;
        MEMORY[0x19AEC4EBC](v31, -1, -1);
        MEMORY[0x19AEC4EBC](v11, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v21 = *(_QWORD *)(v0 + 40);
      v22 = *(_QWORD *)(v21 + OBJC_IVAR___SLKeyQueryController_queryController + 24);
      v23 = *(_QWORD *)(v21 + OBJC_IVAR___SLKeyQueryController_queryController + 32);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v21 + OBJC_IVAR___SLKeyQueryController_queryController), v22);
      v24 = (uint64_t *)(v21 + v10[104]);
      v25 = *v24;
      v26 = v24[1];
      v27 = *(_QWORD *)(v21 + OBJC_IVAR___SLKeyQueryController_queue);
      v28 = *(int **)(v23 + 8);
      v29 = *v28;
      v30 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 64) = v30;
      *v30 = v0;
      v30[1] = KeyQueryController.localPublicKey();
      return ((uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v28 + v29))(v32, v2, v25, v26, v27, v22, v23);
    }
    swift_bridgeObjectRelease();
  }
  if (one-time initialization token for default != -1)
    swift_once();
  v14 = type metadata accessor for Logger();
  __swift_project_value_buffer(v14, (uint64_t)static Log.default);
  v15 = Logger.logObject.getter();
  v16 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_199EFF000, v15, v16, "KeyQueryController.localPublicKey() Could not get localHandle", v17, 2u);
    MEMORY[0x19AEC4EBC](v17, -1, -1);
  }
  v18 = *(_QWORD *)(v0 + 32);

  v19 = type metadata accessor for P256.Signing.PublicKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v18, 1, 1, v19);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v16)(void);

  v1 = v0;
  v2 = specialized _arrayConditionalCast<A, B>(_:)(*(_QWORD *)(v0 + 72));
  swift_bridgeObjectRelease();
  if (v2)
  {
    if (v2 >> 62)
    {
      swift_bridgeObjectRetain();
      v12 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v12)
      {
LABEL_4:
        v16 = *(void (**)(void))((*MEMORY[0x1E0DEEDD8] & **(_QWORD **)(v0 + 40)) + 0x80);
        if ((v2 & 0xC000000000000001) != 0)
          v3 = (id)MEMORY[0x19AEC3E78](0, v2);
        else
          v3 = *(id *)(v2 + 32);
        v4 = objc_msgSend(v3, sel_pushToken);
        static Data._unconditionallyBridgeFromObjectiveC(_:)();
        v6 = v5;

        v16();
        __asm { BR              X10 }
      }
    }
    else if (*(_QWORD *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_4;
    }
    v13 = *(_QWORD *)(v0 + 32);
    swift_bridgeObjectRelease();
    v14 = type metadata accessor for P256.Signing.PublicKey();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  }
  else
  {
    if (one-time initialization token for default != -1)
      swift_once();
    __swift_project_value_buffer(*(_QWORD *)(v0 + 56), (uint64_t)static Log.default);
    v7 = Logger.logObject.getter();
    v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_199EFF000, v7, v8, "KeyQueryController.localPublicKey() Could not get currentRemoteDevice", v9, 2u);
      MEMORY[0x19AEC4EBC](v9, -1, -1);
    }
    v10 = *(_QWORD *)(v1 + 32);

    v11 = type metadata accessor for P256.Signing.PublicKey();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  }
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t specialized _arrayConditionalCast<A, B>(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  _BYTE v5[40];
  uint64_t v6;

  v6 = MEMORY[0x1E0DEE9D8];
  v2 = *(_QWORD *)(a1 + 16);
  specialized ContiguousArray.reserveCapacity(_:)();
  if (!v2)
    return v6;
  for (i = a1 + 32; ; i += 40)
  {
    outlined init with copy of HighlightDisambiguationPillMetricVariant(i, (uint64_t)v5);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Endpoint);
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for IDSEndpoint);
    if (!swift_dynamicCast())
      break;
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized ContiguousArray._endMutation()();
    if (!--v2)
      return v6;
  }
  swift_release();

  return 0;
}

void IDSEndpoint.applicationPublicDeviceKey.getter()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  v1 = objc_msgSend(v0, sel_applicationPublicDeviceIdentity);
  if (v1)
  {
    v2 = v1;
    SecKeyRef.p256PublicKey.getter();

  }
  else
  {
    if (one-time initialization token for keyController != -1)
      swift_once();
    v3 = type metadata accessor for Logger();
    __swift_project_value_buffer(v3, (uint64_t)static Log.keyController);
    v4 = Logger.logObject.getter();
    v5 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_199EFF000, v4, v5, "Failed to convert IDSEndpoint's publicIdentity to SecKey, this is a failing forward declare!", v6, 2u);
      MEMORY[0x19AEC4EBC](v6, -1, -1);
    }

    lazy protocol witness table accessor for type KeyQueryController.DiversificationErrors and conformance KeyQueryController.DiversificationErrors();
    swift_allocError();
    swift_willThrow();
  }
}

uint64_t KeyQueryController.localPublicKey(using:trackingPreventionSalt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t);

  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for P256.Signing.PublicKey?);
  v7 = swift_task_alloc();
  v6[8] = v7;
  v8 = type metadata accessor for P256.Signing.PublicKey();
  v6[9] = v8;
  v6[10] = *(_QWORD *)(v8 - 8);
  v6[11] = swift_task_alloc();
  v9 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v5) + 0xE0);
  v12 = (uint64_t (*)(uint64_t))((char *)v9 + *v9);
  v10 = (_QWORD *)swift_task_alloc();
  v6[12] = v10;
  *v10 = v6;
  v10[1] = KeyQueryController.localPublicKey(using:trackingPreventionSalt:);
  return v12(v7);
}

uint64_t KeyQueryController.localPublicKey(using:trackingPreventionSalt:)()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    outlined destroy of SymmetricKey??(v3, &demangling cache variable for type metadata for P256.Signing.PublicKey?);
    lazy protocol witness table accessor for type KeyQueryController.DiversificationErrors and conformance KeyQueryController.DiversificationErrors();
    swift_allocError();
    swift_willThrow();
LABEL_5:
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v4 = *(_QWORD *)(v0 + 88);
  v5 = *(_QWORD **)(v0 + 56);
  v17 = *(_QWORD *)(v0 + 48);
  v18 = *(_QWORD *)(v0 + 104);
  v7 = *(_QWORD *)(v0 + 32);
  v6 = *(_QWORD *)(v0 + 40);
  v8 = *(_QWORD *)(v0 + 16);
  v9 = *(_QWORD *)(v0 + 24);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v4, v3, v1);
  v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & *v5)
                                                                                        + 0xD0))(v8, v4, v6, v17, v9, v7);
  v12 = v11;
  v13 = *(_QWORD *)(v0 + 80);
  v14 = *(_QWORD *)(v0 + 72);
  if (v18)
  {
    (*(void (**)(_QWORD, uint64_t))(v13 + 8))(*(_QWORD *)(v0 + 88), v14);
    goto LABEL_5;
  }
  v16 = v10;
  (*(void (**)(_QWORD, uint64_t))(v13 + 8))(*(_QWORD *)(v0 + 88), v14);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v16, v12);
}

{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id KeyQueryController.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void KeyQueryController.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id KeyQueryController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for KeyQueryController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static KeyQueryController.DiversificationErrors.== infix(_:_:)()
{
  return 1;
}

void KeyQueryController.DiversificationErrors.hash(into:)()
{
  Hasher._combine(_:)(0);
}

Swift::Int KeyQueryController.DiversificationErrors.hashValue.getter()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t IDSIDQueryController.currentRemoteDevice(for:service:queue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  v6[7] = a5;
  v6[8] = v5;
  v6[5] = a3;
  v6[6] = a4;
  v6[3] = a1;
  v6[4] = a2;
  return swift_task_switch();
}

uint64_t IDSIDQueryController.currentRemoteDevice(for:service:queue:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  __int128 v21;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = (void *)objc_opt_self();
  v4 = (void *)MEMORY[0x19AEC3B6C](v1, v2);
  v5 = objc_msgSend(v3, sel_normalizedHandleWithDestinationID_, v4);

  if (!v5)
    goto LABEL_6;
  v6 = objc_msgSend(v5, sel_value);

  if (!v6)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = (id)MEMORY[0x19AEC3B6C](v7);
    swift_bridgeObjectRelease();
  }
  v8 = objc_msgSend(v6, sel_IDSFormattedDestinationID);

  if (v8)
  {
    v9 = *(_QWORD *)(v0 + 64);
    v10 = *(_QWORD *)(v0 + 40);
    v21 = *(_OWORD *)(v0 + 48);
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v13 = v12;

    *(_QWORD *)(v0 + 72) = v13;
    v14 = swift_task_alloc();
    *(_QWORD *)(v0 + 80) = v14;
    *(_QWORD *)(v14 + 16) = v9;
    *(_QWORD *)(v14 + 24) = v11;
    *(_QWORD *)(v14 + 32) = v13;
    *(_QWORD *)(v14 + 40) = v10;
    *(_OWORD *)(v14 + 48) = v21;
    v15 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v15;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Endpoint]);
    *v15 = v0;
    v15[1] = IDSIDQueryController.currentRemoteDevice(for:service:queue:);
    return withCheckedContinuation<A>(isolation:function:_:)();
  }
  else
  {
LABEL_6:
    if (one-time initialization token for keyController != -1)
      swift_once();
    v17 = type metadata accessor for Logger();
    __swift_project_value_buffer(v17, (uint64_t)static Log.keyController);
    v18 = Logger.logObject.getter();
    v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_199EFF000, v18, v19, "Failed to format destination handle to IDS destinationID", v20, 2u);
      MEMORY[0x19AEC4EBC](v20, -1, -1);
    }

    return (*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x1E0DEE9D8]);
  }
}

{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

void closure #1 in IDSIDQueryController.currentRemoteDevice(for:service:queue:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD aBlock[6];

  v38 = a2;
  v39 = a7;
  v34 = a6;
  v35 = a5;
  v36 = a3;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[Endpoint], Never>);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = MEMORY[0x19AEC3B6C](a3, a4);
  v40 = MEMORY[0x19AEC3B6C](a5, a6);
  v16 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v37 = objc_msgSend(v16, sel_bundleIdentifier);

  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a1, v12);
  v17 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v18 = (v14 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  v19 = (v18 + 15) & 0xFFFFFFFFFFFFFFF8;
  v20 = (v19 + 23) & 0xFFFFFFFFFFFFFFF8;
  v21 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v21 + v17, v15, v12);
  v22 = v38;
  v23 = v39;
  *(_QWORD *)(v21 + v18) = v38;
  v24 = (_QWORD *)(v21 + v19);
  *v24 = v36;
  v24[1] = a4;
  v25 = (_QWORD *)(v21 + v20);
  v26 = v34;
  *v25 = v35;
  v25[1] = v26;
  *(_QWORD *)(v21 + ((v20 + 23) & 0xFFFFFFFFFFFFFFF8)) = v23;
  aBlock[4] = partial apply for closure #1 in closure #1 in IDSIDQueryController.currentRemoteDevice(for:service:queue:);
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@unowned IDSIDStatus) -> ();
  aBlock[3] = &block_descriptor_17;
  v27 = _Block_copy(aBlock);
  v28 = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v29 = v23;
  swift_release();
  v30 = v28;
  v32 = (void *)v40;
  v31 = (void *)v41;
  v33 = v37;
  objc_msgSend(v30, sel_refreshIDStatusForDestination_service_listenerID_queue_completionBlock_, v41, v40, v37, v29, v27);
  _Block_release(v27);

}

void closure #1 in closure #1 in IDSIDQueryController.currentRemoteDevice(for:service:queue:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  id v23;
  id v24;
  unint64_t v25;
  char *v26;
  void *v27;
  Class v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  Class isa;
  uint64_t v33;
  id v34;
  uint64_t v35;
  _QWORD aBlock[6];

  v34 = a3;
  v35 = a8;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[Endpoint], Never>);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_QWORD *)(v15 + 64);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 == 2)
  {
    if (one-time initialization token for keyController != -1)
      swift_once();
    v18 = type metadata accessor for Logger();
    __swift_project_value_buffer(v18, (uint64_t)static Log.keyController);
    v19 = Logger.logObject.getter();
    v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_199EFF000, v19, v20, "Failed to refresh IDSStatus, can't proceed", v21, 2u);
      MEMORY[0x19AEC4EBC](v21, -1, -1);
    }

    aBlock[0] = MEMORY[0x1E0DEE9D8];
    CheckedContinuation.resume(returning:)();
  }
  else
  {
    v33 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_199FA7E60;
    *(_QWORD *)(v22 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v22 + 32) = a4;
    *(_QWORD *)(v22 + 40) = a5;
    swift_bridgeObjectRetain();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v31 = MEMORY[0x19AEC3B6C](a6, a7);
    v23 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v24 = objc_msgSend(v23, sel_bundleIdentifier);

    if (v24)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))((char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v33, v14);
      v25 = (*(unsigned __int8 *)(v15 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
      v26 = (char *)swift_allocObject();
      *((_QWORD *)v26 + 2) = a6;
      *((_QWORD *)v26 + 3) = a7;
      *((_QWORD *)v26 + 4) = a4;
      *((_QWORD *)v26 + 5) = a5;
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(&v26[v25], v17, v14);
      aBlock[4] = partial apply for closure #1 in closure #1 in closure #1 in IDSIDQueryController.currentRemoteDevice(for:service:queue:);
      aBlock[5] = v26;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed [AnyHashable : Any]?) -> ();
      aBlock[3] = &block_descriptor_23;
      v27 = _Block_copy(aBlock);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_release();
      v29 = (void *)v31;
      v28 = isa;
      objc_msgSend(v34, sel_currentRemoteDevicesForDestinations_service_listenerID_queue_completionBlock_, isa, v31, v24, v35, v27);
      _Block_release(v27);

    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t closure #1 in closure #1 in closure #1 in IDSIDQueryController.currentRemoteDevice(for:service:queue:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint8_t *v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25[5];
  __int128 v26;
  __int128 v27;

  if (one-time initialization token for keyController != -1)
    swift_once();
  v10 = type metadata accessor for Logger();
  __swift_project_value_buffer(v10, (uint64_t)static Log.keyController);
  swift_bridgeObjectRetain_n();
  v11 = Logger.logObject.getter();
  v12 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v11, v12))
  {
    swift_bridgeObjectRelease_n();

    if (a1)
      goto LABEL_5;
LABEL_9:
    v26 = 0u;
    v27 = 0u;
LABEL_14:
    outlined destroy of SymmetricKey??((uint64_t)&v26, &demangling cache variable for type metadata for Any?);
    goto LABEL_15;
  }
  v24 = a1;
  v13 = (uint8_t *)swift_slowAlloc();
  v14 = swift_slowAlloc();
  v25[0] = v14;
  *(_DWORD *)v13 = 136315138;
  swift_bridgeObjectRetain();
  *(_QWORD *)&v26 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a2, a3, v25);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease_n();
  _os_log_impl(&dword_199EFF000, v11, v12, "Received IDSEndpoints on service: %s", v13, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x19AEC4EBC](v14, -1, -1);
  v15 = v13;
  a1 = v24;
  MEMORY[0x19AEC4EBC](v15, -1, -1);

  if (!v24)
    goto LABEL_9;
LABEL_5:
  swift_bridgeObjectRetain();
  AnyHashable.init<A>(_:)();
  if (*(_QWORD *)(a1 + 16) && (v16 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v25), (v17 & 1) != 0))
  {
    outlined init with copy of Any(*(_QWORD *)(a1 + 56) + 32 * v16, (uint64_t)&v26);
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
  }
  outlined destroy of AnyHashable((uint64_t)v25);
  if (!*((_QWORD *)&v27 + 1))
    goto LABEL_14;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [IDSEndpoint]);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v18 = specialized _arrayForceCast<A, B>(_:)(v25[0]);
    swift_bridgeObjectRelease();
    v25[0] = v18;
    goto LABEL_19;
  }
LABEL_15:
  swift_bridgeObjectRetain_n();
  v19 = Logger.logObject.getter();
  v20 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    v25[0] = v22;
    *(_DWORD *)v21 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v26 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a4, a5, v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_199EFF000, v19, v20, "Failed to find remoteDevices for destination %s", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AEC4EBC](v22, -1, -1);
    MEMORY[0x19AEC4EBC](v21, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v25[0] = MEMORY[0x1E0DEE9D8];
LABEL_19:
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[Endpoint], Never>);
  return CheckedContinuation.resume(returning:)();
}

uint64_t specialized _arrayForceCast<A, B>(_:)(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void **v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  __int128 v14;
  uint64_t v15;
  _UNKNOWN **v16;
  uint64_t v17;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x1E0DEE9D8];
  if (!v2)
    return v3;
  v17 = MEMORY[0x1E0DEE9D8];
  result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v3 = v17;
    if ((a1 & 0xC000000000000001) != 0)
    {
      v5 = 0;
      do
      {
        v6 = MEMORY[0x19AEC3E78](v5, a1);
        v17 = v3;
        v8 = *(_QWORD *)(v3 + 16);
        v7 = *(_QWORD *)(v3 + 24);
        if (v8 >= v7 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v7 > 1, v8 + 1, 1);
          v3 = v17;
        }
        ++v5;
        v15 = type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for IDSEndpoint);
        v16 = &protocol witness table for IDSEndpoint;
        *(_QWORD *)&v14 = v6;
        *(_QWORD *)(v3 + 16) = v8 + 1;
        outlined init with take of Endpoint(&v14, v3 + 40 * v8 + 32);
      }
      while (v2 != v5);
    }
    else
    {
      v9 = (void **)(a1 + 32);
      do
      {
        v10 = *v9;
        v17 = v3;
        v12 = *(_QWORD *)(v3 + 16);
        v11 = *(_QWORD *)(v3 + 24);
        v13 = v10;
        if (v12 >= v11 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v11 > 1, v12 + 1, 1);
          v3 = v17;
        }
        v15 = type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for IDSEndpoint);
        v16 = &protocol witness table for IDSEndpoint;
        *(_QWORD *)&v14 = v13;
        *(_QWORD *)(v3 + 16) = v12 + 1;
        outlined init with take of Endpoint(&v14, v3 + 40 * v12 + 32);
        ++v9;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned IDSIDStatus) -> ()(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t protocol witness for EndpointQueryController.currentRemoteDevice(for:service:queue:) in conformance IDSIDQueryController(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v12;
  _QWORD *v13;

  v12 = *v5;
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = protocol witness for EndpointQueryController.currentRemoteDevice(for:service:queue:) in conformance IDSIDQueryController;
  v13[7] = a5;
  v13[8] = v12;
  v13[5] = a3;
  v13[6] = a4;
  v13[3] = a1;
  v13[4] = a2;
  return swift_task_switch();
}

void protocol witness for Endpoint.applicationPublicDeviceKey.getter in conformance IDSEndpoint()
{
  IDSEndpoint.applicationPublicDeviceKey.getter();
}

void closure #1 in static Data.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_199F7DBC4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x199F7DDA8);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;

  Hasher.init(_seed:)();
  String.hash(into:)();
  v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  Swift::Int v2;

  Hasher.init(_seed:)();
  type metadata accessor for CFStringRef(0);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t (*)(uint64_t))type metadata accessor for CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  _CFObject.hash(into:)();
  v2 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

{
  Swift::Int v2;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(void *a1)
{
  id v2;
  Swift::Int v3;

  Hasher.init(_seed:)();
  if (a1)
  {
    Hasher._combine(_:)(1u);
    type metadata accessor for CFStringRef(0);
    lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t (*)(uint64_t))type metadata accessor for CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
    v2 = a1;
    _CFObject.hash(into:)();

  }
  else
  {
    Hasher._combine(_:)(0);
  }
  v3 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)((uint64_t)a1, v3);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
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
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  void *v6;
  id v7;
  char v8;
  uint64_t v9;
  id v10;
  char v11;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    type metadata accessor for CFStringRef(0);
    v6 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * i);
    lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t (*)(uint64_t))type metadata accessor for CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
    v7 = v6;
    v8 = static _CFObject.== infix(_:_:)();

    if ((v8 & 1) == 0)
    {
      v9 = ~v4;
      for (i = (i + 1) & v9; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v9)
      {
        v10 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v11 = static _CFObject.== infix(_:_:)();

        if ((v11 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;
  void *v9;
  id v10;
  char v11;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = v2;
    v8 = ~v4;
    do
    {
      v9 = *(void **)(*(_QWORD *)(v6 + 48) + 8 * v5);
      if (v9)
      {
        if (a1)
        {
          type metadata accessor for CFStringRef(0);
          lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t (*)(uint64_t))type metadata accessor for CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
          v10 = v9;
          v11 = static _CFObject.== infix(_:_:)();

          if ((v11 & 1) != 0)
            return v5;
        }
      }
      else if (!a1)
      {
        return v5;
      }
      v5 = (v5 + 1) & v8;
    }
    while (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

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
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
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
          v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v15 = v14;
          if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16)
            break;
          v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
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
      outlined init with copy of AnyHashable(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x19AEC3E48](v9, a1);
      outlined destroy of AnyHashable((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t specialized Sequence.compactMap<A>(_:)(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  char *v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  _QWORD v36[2];
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;

  v7 = v6;
  v44 = a5;
  v45 = a6;
  v42 = a3;
  v43 = a4;
  v41 = a2;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for P256.Signing.PublicKey?);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for P256.Signing.PublicKey();
  v46 = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x1E0C80A78](v12);
  v39 = (char *)v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v13);
  v16 = MEMORY[0x1E0C80A78](v15);
  v18 = (char *)v36 - v17;
  MEMORY[0x1E0C80A78](v16);
  v37 = (char *)v36 - v20;
  v21 = *(_QWORD *)(a1 + 16);
  if (!v21)
    return MEMORY[0x1E0DEE9D8];
  v40 = v19;
  v22 = (_QWORD *)(a1 + 32);
  v36[1] = a1;
  swift_bridgeObjectRetain();
  v47 = MEMORY[0x1E0DEE9D8];
  v38 = v18;
  v23 = v40;
  do
  {
    v25 = v22[3];
    v24 = v22[4];
    __swift_project_boxed_opaque_existential_1(v22, v25);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v24);
    if (v7)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v47;
    }
    v26 = v38;
    v27 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & *v41)
                                                                                         + 0xD0))(v38, v23, v42, v43, v44, v45);
    v7 = 0;
    outlined consume of Data._Representation(v27, v28);
    v29 = v46;
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v23, v12);
    v30 = *(void (**)(char *, char *, uint64_t))(v29 + 32);
    v30(v11, v26, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v11, 0, 1, v12);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v11, 1, v12) == 1)
    {
      outlined destroy of SymmetricKey??((uint64_t)v11, &demangling cache variable for type metadata for P256.Signing.PublicKey?);
    }
    else
    {
      v31 = v37;
      v30(v37, v11, v12);
      v30(v39, v31, v12);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v47 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v47 + 16) + 1, 1, v47);
      v33 = *(_QWORD *)(v47 + 16);
      v32 = *(_QWORD *)(v47 + 24);
      if (v33 >= v32 >> 1)
        v47 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v32 > 1, v33 + 1, 1, v47);
      v34 = v47;
      *(_QWORD *)(v47 + 16) = v33 + 1;
      v30((char *)(v34+ ((*(unsigned __int8 *)(v46 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80))+ *(_QWORD *)(v46 + 72) * v33), v39, v12);
    }
    v22 += 5;
    --v21;
  }
  while (v21);
  swift_bridgeObjectRelease();
  return v47;
}

void specialized KeyQueryController.init(service:targetQueue:queryController:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  char *v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  char *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  objc_class *Controller;
  uint64_t v20;
  id v21;
  uint64_t v22;
  objc_super v23;
  uint64_t v24;

  v21 = a3;
  v22 = a4;
  v20 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v7 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for OS_dispatch_queue.Attributes();
  MEMORY[0x1E0C80A78](v10);
  v11 = type metadata accessor for DispatchQoS();
  MEMORY[0x1E0C80A78](v11);
  *(_OWORD *)&v4[OBJC_IVAR___SLKeyQueryController____lazy_storage___pushTokenForSelf] = xmmword_199FA7850;
  *(_QWORD *)&v4[OBJC_IVAR___SLKeyQueryController____lazy_storage___localAccountHandles] = 1;
  v12 = &v4[OBJC_IVAR___SLKeyQueryController_service];
  *(_QWORD *)v12 = a1;
  *((_QWORD *)v12 + 1) = a2;
  v13 = objc_allocWithZone(MEMORY[0x1E0D34358]);
  v14 = v4;
  swift_bridgeObjectRetain();
  v15 = (void *)MEMORY[0x19AEC3B6C](a1, a2);
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v13, sel_initWithService_, v15);

  if (v16)
  {
    *(_QWORD *)&v14[OBJC_IVAR___SLKeyQueryController_idsService] = v16;
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for OS_dispatch_queue);
    v17 = v21;
    static DispatchQoS.unspecified.getter();
    v24 = MEMORY[0x1E0DEE9D8];
    lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810], MEMORY[0x1E0DEF828]);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
    lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E0DEF8D0], v20);
    *(_QWORD *)&v14[OBJC_IVAR___SLKeyQueryController_queue] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
    v18 = v22;
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v22, (uint64_t)&v14[OBJC_IVAR___SLKeyQueryController_queryController]);

    Controller = (objc_class *)type metadata accessor for KeyQueryController();
    v23.receiver = v14;
    v23.super_class = Controller;
    objc_msgSendSuper2(&v23, sel_init);
    __swift_destroy_boxed_opaque_existential_0(v18);
  }
  else
  {
    __break(1u);
  }
}

uint64_t specialized Array.replaceSubrange<A>(_:with:)(uint64_t a1, int64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Endpoint);
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_20;
  v13 = v4[2];
  v14 = __OFSUB__(v13, a2);
  v15 = v13 - a2;
  if (v14)
    goto LABEL_26;
  if ((v15 & 0x8000000000000000) == 0)
  {
    v16 = (char *)&v4[5 * a2 + 4];
    if (a1 != a2 || &v4[5 * a1 + 4] >= (_QWORD *)&v16[40 * v15])
      result = (uint64_t)memmove(&v4[5 * a1 + 4], v16, 40 * v15);
    v17 = v4[2];
    v14 = __OFADD__(v17, v8);
    v18 = v17 - v7;
    if (!v14)
    {
      v4[2] = v18;
LABEL_20:
      *(_QWORD *)v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type KeyQueryController.DiversificationErrors and conformance KeyQueryController.DiversificationErrors()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type KeyQueryController.DiversificationErrors and conformance KeyQueryController.DiversificationErrors;
  if (!lazy protocol witness table cache variable for type KeyQueryController.DiversificationErrors and conformance KeyQueryController.DiversificationErrors)
  {
    result = MEMORY[0x19AEC4E20](&protocol conformance descriptor for KeyQueryController.DiversificationErrors, &type metadata for KeyQueryController.DiversificationErrors);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type KeyQueryController.DiversificationErrors and conformance KeyQueryController.DiversificationErrors);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type KeyQueryController.DiversificationErrors and conformance KeyQueryController.DiversificationErrors;
  if (!lazy protocol witness table cache variable for type KeyQueryController.DiversificationErrors and conformance KeyQueryController.DiversificationErrors)
  {
    result = MEMORY[0x19AEC4E20](&protocol conformance descriptor for KeyQueryController.DiversificationErrors, &type metadata for KeyQueryController.DiversificationErrors);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type KeyQueryController.DiversificationErrors and conformance KeyQueryController.DiversificationErrors);
  }
  return result;
}

uint64_t outlined init with copy of P256.Signing.PublicKey?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for P256.Signing.PublicKey?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for KeyQueryController()
{
  return objc_opt_self();
}

void partial apply for closure #1 in IDSIDQueryController.currentRemoteDevice(for:service:queue:)(uint64_t a1)
{
  uint64_t v1;

  closure #1 in IDSIDQueryController.currentRemoteDevice(for:service:queue:)(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(void **)(v1 + 56));
}

uint64_t sub_199F7EE00@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x80))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_199F7EE40(uint64_t *a1, _QWORD **a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t (*v4)(uint64_t, unint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, unint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x88);
  outlined copy of Data._Representation(*a1, v3);
  return v4(v2, v3);
}

uint64_t sub_199F7EE98@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x98))();
  *a2 = result;
  return result;
}

uint64_t sub_199F7EED8(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0xA0);
  v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t dispatch thunk of Endpoint.applicationPublicDeviceKey.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of EndpointQueryController.currentRemoteDevice(for:service:queue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v15;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a7 + 8)
                                                                                              + *(_QWORD *)(a7 + 8));
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v15;
  *v15 = v7;
  v15[1] = dispatch thunk of EndpointQueryController.currentRemoteDevice(for:service:queue:);
  return v17(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t dispatch thunk of EndpointQueryController.currentRemoteDevice(for:service:queue:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t method lookup function for KeyQueryController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of KeyQueryController.pushTokenForSelf.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of KeyQueryController.pushTokenForSelf.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of KeyQueryController.pushTokenForSelf.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of KeyQueryController.localAccountHandles.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of KeyQueryController.localAccountHandles.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of KeyQueryController.localAccountHandles.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of KeyQueryController.__allocating_init(service:targetQueue:queryController:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of KeyQueryController.publicKeysAndTPS(for:documentIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  int *v10;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t);

  v10 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v4) + 0xB8);
  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)v10 + *v10);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = dispatch thunk of KeyQueryController.publicKeysAndTPS(for:documentIdentifier:);
  return v13(a1, a2, a3, a4);
}

uint64_t dispatch thunk of KeyQueryController.publicKeysAndTPS(for:documentIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v8;

  v8 = *v3;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 8))(a1, a2, a3);
}

uint64_t dispatch thunk of KeyQueryController.validateKeyType(_:isPublicKey:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of KeyQueryController.diversify(publicKey:tps:docId:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of KeyQueryController.diversifyKey(_:trackingPreventionSalt:documentIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of KeyQueryController.signData(data:documentIdentifier:trackingPreventionSalt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  int *v12;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v5) + 0xD8);
  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v12 + *v12);
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = dispatch thunk of KeyQueryController.signData(data:documentIdentifier:trackingPreventionSalt:);
  return v15(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of KeyQueryController.localPublicKey()(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v1) + 0xE0);
  v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = dispatch thunk of KeyQueryController.localPublicKey();
  return v7(a1);
}

uint64_t dispatch thunk of KeyQueryController.localPublicKey()()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t dispatch thunk of KeyQueryController.localPublicKey(using:trackingPreventionSalt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  int *v12;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v5) + 0xE8);
  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v12 + *v12);
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = dispatch thunk of KeyQueryController.localPublicKey(using:trackingPreventionSalt:);
  return v15(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of KeyQueryController.localPublicKey(using:trackingPreventionSalt:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  v6 = *v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t storeEnumTagSinglePayload for KeyQueryController.DiversificationErrors(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_199F7F514 + 4 * byte_199FA8560[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_199F7F534 + 4 * byte_199FA8565[v4]))();
}

_BYTE *sub_199F7F514(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_199F7F534(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_199F7F53C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_199F7F544(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_199F7F54C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_199F7F554(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for KeyQueryController.DiversificationErrors()
{
  return &type metadata for KeyQueryController.DiversificationErrors;
}

uint64_t sub_199F7F570()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[Endpoint], Never>);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)(v0
                     + ((((((v4 + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)));
  return swift_deallocObject();
}

void partial apply for closure #1 in closure #1 in IDSIDQueryController.currentRemoteDevice(for:service:queue:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[Endpoint], Never>)
                 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  closure #1 in closure #1 in IDSIDQueryController.currentRemoteDevice(for:service:queue:)(a1, v1 + v4, *(void **)(v1 + v5), *(_QWORD *)(v1 + v6), *(_QWORD *)(v1 + v6 + 8), *(_QWORD *)(v1 + ((v6 + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1 + ((v6 + 23) & 0xFFFFFFFFFFFFFFF8) + 8), *(_QWORD *)(v1 + ((((v6 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFF8)));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_199F7F6C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[Endpoint], Never>);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in closure #1 in IDSIDQueryController.currentRemoteDevice(for:service:queue:)(uint64_t a1)
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[Endpoint], Never>);
  return closure #1 in closure #1 in closure #1 in IDSIDQueryController.currentRemoteDevice(for:service:queue:)(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t outlined destroy of AnyHashable(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 8))();
  return a1;
}

uint64_t outlined init with take of Endpoint(__int128 *a1, uint64_t a2)
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

uint64_t outlined init with copy of AnyHashable(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

unint64_t lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A];
  if (!lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
    result = MEMORY[0x19AEC4E20](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A]);
  }
  return result;
}

uint64_t outlined consume of Set<IDSAccount>.Iterator._Variant()
{
  return swift_release();
}

uint64_t HeaderFallback.init(title:subtitle:image:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  *a6 = result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

uint64_t HeaderFallback.title.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HeaderFallback.title.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*HeaderFallback.title.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t HeaderFallback.subtitle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HeaderFallback.subtitle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*HeaderFallback.subtitle.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

void *HeaderFallback.image.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 32);
  v2 = v1;
  return v1;
}

void HeaderFallback.image.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
}

uint64_t (*HeaderFallback.image.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t HeaderFallback.imageView.getter()
{
  uint64_t v0;
  void *v1;
  uint64_t result;
  id v3;

  v1 = *(void **)(v0 + 32);
  result = HeaderFallback.isComplete.getter();
  if ((result & 1) != 0)
  {
    if (v1)
    {
      v3 = v1;
      return Image.init(uiImage:)();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

BOOL HeaderFallback.isComplete.getter()
{
  _QWORD *v0;
  unint64_t v1;
  unint64_t v3;
  uint64_t v4;

  if (!v0[4])
    return 0;
  v1 = v0[1];
  if (!((v1 & 0x2000000000000000) != 0 ? HIBYTE(v1) & 0xF : *v0 & 0xFFFFFFFFFFFFLL))
    return 0;
  v3 = v0[3];
  v4 = v0[2] & 0xFFFFFFFFFFFFLL;
  if ((v3 & 0x2000000000000000) != 0)
    v4 = HIBYTE(v3) & 0xF;
  return v4 != 0;
}

id CollaborationAttributionViewRepresentable.highlight.getter()
{
  id *v0;

  return *v0;
}

uint64_t CollaborationAttributionViewRepresentable.fallback.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = v1[2];
  v3 = v1[3];
  v4 = v1[4];
  v5 = (void *)v1[5];
  *a1 = v1[1];
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = v4;
  a1[4] = v5;
  v6 = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

__n128 CollaborationAttributionViewRepresentable.init(highlight:fallback:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __n128 result;
  __int128 v4;
  uint64_t v5;

  result = *(__n128 *)a2;
  v4 = *(_OWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)a3 = a1;
  *(__n128 *)(a3 + 8) = result;
  *(_OWORD *)(a3 + 24) = v4;
  *(_QWORD *)(a3 + 40) = v5;
  return result;
}

_QWORD *CollaborationAttributionViewRepresentable.makeUIView(context:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  _QWORD *v5;
  double v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v22;
  uint64_t v23;

  v1 = *(void **)v0;
  v2 = *(void **)(v0 + 40);
  v3 = objc_allocWithZone((Class)type metadata accessor for CollaborationAttributionView());
  v4 = v1;
  v5 = specialized CollaborationAttributionView.init(highlight:variant:)(v4, 0);

  LODWORD(v6) = 1132068864;
  objc_msgSend(v5, sel_setContentCompressionResistancePriority_forAxis_, 0, v6);
  objc_msgSend(v5, sel_setRemoteRenderingEnabled_, 1);
  (*(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v5) + 0x108))(1);
  if (one-time initialization token for default != -1)
    swift_once();
  v7 = type metadata accessor for Logger();
  __swift_project_value_buffer(v7, (uint64_t)static Log.default);
  v8 = v2;
  v9 = v4;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v10 = v8;
  v11 = v9;
  v12 = Logger.logObject.getter();
  v13 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    v23 = v22;
    *(_DWORD *)v14 = 136315138;
    v15 = objc_msgSend(v11, sel_attributions);
    v16 = type metadata accessor for SLAttribution();
    v17 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    v18 = MEMORY[0x19AEC3CB0](v17, v16);
    v20 = v19;
    swift_bridgeObjectRelease();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v18, v20, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_199EFF000, v12, v13, "LTP: makeUIView called with highlight: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AEC4EBC](v22, -1, -1);
    MEMORY[0x19AEC4EBC](v14, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

  }
  return v5;
}

uint64_t CollaborationAttributionViewRepresentable.updateUIView(_:context:)(_QWORD *a1)
{
  void **v1;
  void *v2;
  uint64_t (*v3)(void *);
  id v4;

  v2 = *v1;
  v3 = *(uint64_t (**)(void *))((*MEMORY[0x1E0DEEDD8] & *a1) + 0xC0);
  v4 = v2;
  return v3(v2);
}

uint64_t protocol witness for UIViewRepresentable.updateUIView(_:context:) in conformance CollaborationAttributionViewRepresentable(_QWORD *a1)
{
  void **v1;
  void *v2;
  uint64_t (*v3)(void *);
  id v4;

  v2 = *v1;
  v3 = *(uint64_t (**)(void *))((*MEMORY[0x1E0DEEDD8] & *a1) + 0xC0);
  v4 = v2;
  return v3(v2);
}

uint64_t protocol witness for UIViewRepresentable.sizeThatFits(_:uiView:context:) in conformance CollaborationAttributionViewRepresentable()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t protocol witness for static View._makeView(view:inputs:) in conformance CollaborationAttributionViewRepresentable()
{
  lazy protocol witness table accessor for type CollaborationAttributionViewRepresentable and conformance CollaborationAttributionViewRepresentable();
  return static UIViewRepresentable._makeView(view:inputs:)();
}

uint64_t protocol witness for static View._makeViewList(view:inputs:) in conformance CollaborationAttributionViewRepresentable()
{
  lazy protocol witness table accessor for type CollaborationAttributionViewRepresentable and conformance CollaborationAttributionViewRepresentable();
  return static UIViewRepresentable._makeViewList(view:inputs:)();
}

uint64_t protocol witness for static View._viewListCount(inputs:) in conformance CollaborationAttributionViewRepresentable()
{
  return static View._viewListCount(inputs:)();
}

void protocol witness for View.body.getter in conformance CollaborationAttributionViewRepresentable()
{
  lazy protocol witness table accessor for type CollaborationAttributionViewRepresentable and conformance CollaborationAttributionViewRepresentable();
  UIViewRepresentable.body.getter();
  __break(1u);
}

unint64_t lazy protocol witness table accessor for type CollaborationAttributionViewRepresentable and conformance CollaborationAttributionViewRepresentable()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CollaborationAttributionViewRepresentable and conformance CollaborationAttributionViewRepresentable;
  if (!lazy protocol witness table cache variable for type CollaborationAttributionViewRepresentable and conformance CollaborationAttributionViewRepresentable)
  {
    result = MEMORY[0x19AEC4E20](&protocol conformance descriptor for CollaborationAttributionViewRepresentable, &type metadata for CollaborationAttributionViewRepresentable);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CollaborationAttributionViewRepresentable and conformance CollaborationAttributionViewRepresentable);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CollaborationAttributionViewRepresentable and conformance CollaborationAttributionViewRepresentable;
  if (!lazy protocol witness table cache variable for type CollaborationAttributionViewRepresentable and conformance CollaborationAttributionViewRepresentable)
  {
    result = MEMORY[0x19AEC4E20](&protocol conformance descriptor for CollaborationAttributionViewRepresentable, &type metadata for CollaborationAttributionViewRepresentable);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CollaborationAttributionViewRepresentable and conformance CollaborationAttributionViewRepresentable);
  }
  return result;
}

uint64_t associated type witness table accessor for View.Body : View in CollaborationAttributionViewRepresentable()
{
  return MEMORY[0x1E0CE0788];
}

void destroy for HeaderFallback(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

_QWORD *initializeWithCopy for HeaderFallback(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = (void *)a2[4];
  a1[4] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6 = v5;
  return a1;
}

_QWORD *assignWithCopy for HeaderFallback(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a1[4];
  v5 = (void *)a2[4];
  a1[4] = v5;
  v6 = v5;

  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for HeaderFallback(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for HeaderFallback(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HeaderFallback(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
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
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HeaderFallback()
{
  return &type metadata for HeaderFallback;
}

void destroy for CollaborationAttributionViewRepresentable(id *a1)
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

_QWORD *initializeWithCopy for CollaborationAttributionViewRepresentable(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = *(_QWORD *)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v5;
  v6 = *(void **)(a2 + 40);
  a1[4] = *(_QWORD *)(a2 + 32);
  a1[5] = v6;
  v7 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8 = v6;
  return a1;
}

uint64_t assignWithCopy for CollaborationAttributionViewRepresentable(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(void **)(a1 + 40);
  v8 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v8;
  v9 = v8;

  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for CollaborationAttributionViewRepresentable(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  v6 = *(void **)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);

  return a1;
}

uint64_t getEnumTagSinglePayload for CollaborationAttributionViewRepresentable(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CollaborationAttributionViewRepresentable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CollaborationAttributionViewRepresentable()
{
  return &type metadata for CollaborationAttributionViewRepresentable;
}

uint64_t Log.default.unsafeMutableAddressor()
{
  return Log.default.unsafeMutableAddressor(&one-time initialization token for default, (uint64_t)static Log.default);
}

uint64_t >> prefix<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v4[4];
  _QWORD v5[2];

  v4[2] = a2;
  type metadata accessor for Optional();
  _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in >> prefix<A>(_:), (uint64_t)v4, MEMORY[0x1E0DEDCE8], MEMORY[0x1E0DEA968], v2, (uint64_t)v5);
  if (v5[1])
    return v5[0];
  else
    return 7104878;
}

uint64_t Log.ProcessVerifier.unsafeMutableAddressor()
{
  return Log.default.unsafeMutableAddressor(&one-time initialization token for ProcessVerifier, (uint64_t)static Log.ProcessVerifier);
}

uint64_t Log.keyController.unsafeMutableAddressor()
{
  return Log.default.unsafeMutableAddressor(&one-time initialization token for keyController, (uint64_t)static Log.keyController);
}

BOOL Subsystem.init(rawValue:)(Swift::String string)
{
  void *object;
  Swift::String v2;
  Swift::Int v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of Subsystem.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  return v3 != 0;
}

unint64_t Subsystem.rawValue.getter()
{
  return 0xD00000000000001ELL;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Subsystem()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance Subsystem()
{
  return String.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Subsystem()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance Subsystem@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::Int v3;
  uint64_t result;

  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of protocol witness for RawRepresentable.init(rawValue:) in conformance Subsystem, *a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3 != 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance Subsystem(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000001ELL;
  a1[1] = 0x8000000199FAF9F0;
}

uint64_t one-time initialization function for keyController()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.keyController);
  __swift_project_value_buffer(v0, (uint64_t)static Log.keyController);
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.init<A>(subsystem:category:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  dispatch thunk of RawRepresentable.rawValue.getter();
  Logger.init(subsystem:category:)();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 8))(a1, a4);
}

uint64_t static Log.keyController.getter@<X0>(uint64_t a1@<X8>)
{
  return static Log.keyController.getter(&one-time initialization token for keyController, (uint64_t)static Log.keyController, a1);
}

uint64_t one-time initialization function for personIdentityGenerator()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.personIdentityGenerator);
  __swift_project_value_buffer(v0, (uint64_t)static Log.personIdentityGenerator);
  return Logger.init(subsystem:category:)();
}

uint64_t Log.personIdentityGenerator.unsafeMutableAddressor()
{
  return Log.default.unsafeMutableAddressor(&one-time initialization token for personIdentityGenerator, (uint64_t)static Log.personIdentityGenerator);
}

uint64_t Log.default.unsafeMutableAddressor(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Log.personIdentityGenerator.getter@<X0>(uint64_t a1@<X8>)
{
  return static Log.keyController.getter(&one-time initialization token for personIdentityGenerator, (uint64_t)static Log.personIdentityGenerator, a1);
}

uint64_t one-time initialization function for ProcessVerifier()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.ProcessVerifier);
  __swift_project_value_buffer(v0, (uint64_t)static Log.ProcessVerifier);
  return Logger.init(subsystem:category:)();
}

uint64_t static Log.ProcessVerifier.getter@<X0>(uint64_t a1@<X8>)
{
  return static Log.keyController.getter(&one-time initialization token for ProcessVerifier, (uint64_t)static Log.ProcessVerifier, a1);
}

uint64_t one-time initialization function for default()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.default);
  __swift_project_value_buffer(v0, (uint64_t)static Log.default);
  return Logger.init(subsystem:category:)();
}

uint64_t static Log.default.getter@<X0>(uint64_t a1@<X8>)
{
  return static Log.keyController.getter(&one-time initialization token for default, (uint64_t)static Log.default, a1);
}

uint64_t static Log.keyController.getter@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = type metadata accessor for Logger();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t partial apply for closure #1 in >> prefix<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return closure #1 in >> prefix<A>(_:)(a1, a2);
}

uint64_t _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, char *);
  uint64_t v28;

  v25 = a5;
  v26 = a2;
  v28 = a4;
  v27 = a1;
  v24 = a3;
  v9 = *(_QWORD *)(a3 - 8);
  v10 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v13 + 16);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x1E0C80A78](v10);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16);
  v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v21 + 16))(v20, v6);
  v22 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v20, 1, v14) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v14);
    v27(v18, v12);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    if (v7)
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v25, v12, v24);
    v22 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(a6, v22, 1);
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD v7[4];
  uint64_t v8;
  unint64_t v9;

  v7[2] = a2;
  type metadata accessor for Optional();
  _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in DefaultStringInterpolation.appendInterpolation<A>(_:), (uint64_t)v7, MEMORY[0x1E0DEDCE8], MEMORY[0x1E0DEA968], v2, (uint64_t)&v8);
  if (v9)
    v3 = v8;
  else
    v3 = 7104878;
  if (v9)
    v4 = v9;
  else
    v4 = 0xE300000000000000;
  v5 = v4;
  String.append(_:)(*(Swift::String *)&v3);
  return swift_bridgeObjectRelease();
}

uint64_t closure #1 in >> prefix<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  MEMORY[0x1E0C80A78](a1);
  (*(void (**)(char *))(v4 + 16))((char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  result = String.init<A>(reflecting:)();
  *a2 = result;
  a2[1] = v6;
  return result;
}

unint64_t lazy protocol witness table accessor for type Subsystem and conformance Subsystem()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Subsystem and conformance Subsystem;
  if (!lazy protocol witness table cache variable for type Subsystem and conformance Subsystem)
  {
    result = MEMORY[0x19AEC4E20](&protocol conformance descriptor for Subsystem, &type metadata for Subsystem);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Subsystem and conformance Subsystem);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for Subsystem(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_199F80DE4 + 4 * asc_199FA883C[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_199F80E04 + 4 * byte_199FA8841[v4]))();
}

_BYTE *sub_199F80DE4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_199F80E04(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_199F80E0C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_199F80E14(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_199F80E1C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_199F80E24(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for Subsystem()
{
  return &type metadata for Subsystem;
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
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

uint64_t partial apply for closure #1 in DefaultStringInterpolation.appendInterpolation<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return partial apply for closure #1 in >> prefix<A>(_:)(a1, a2);
}

void specialized Data.init<A>(_:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[3] = MEMORY[0x1E0CB0338];
  v3[4] = MEMORY[0x1E0CB0318];
  v3[0] = a1;
  v3[1] = a2;
  v2 = (char *)&loc_199F80F08
     + dword_199F8113C[__swift_project_boxed_opaque_existential_1(v3, MEMORY[0x1E0CB0338])[1] >> 62];
  __asm { BR              X10 }
}

uint64_t sub_199F80F18()
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
  outlined copy of Data._Representation(v1, v0);
  closure #1 in Data.init<A>(_:)(&v6, (_BYTE *)&v6 + BYTE6(v3), &v12);
  outlined consume of Data._Representation(v1, v0);
  v4 = v12;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v13);
  return v4;
}

uint64_t specialized Data.init<A>(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  _BYTE *v6;
  unint64_t v7;
  unint64_t v8;
  Swift::Int v9;
  uint64_t v10;
  __int128 v14[2];
  uint64_t v15;
  __int128 v16;
  _QWORD v17[7];

  v17[5] = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v16 = a1;
  *((_QWORD *)&v16 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousBytes);
  if (!swift_dynamicCast())
  {
    v15 = 0;
    memset(v14, 0, sizeof(v14));
    outlined destroy of SymmetricKey??((uint64_t)v14, &demangling cache variable for type metadata for ContiguousBytes?);
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
        v2 = _StringObject.sharedUTF8.getter();
      }
      if (v2)
        v4 = (_BYTE *)(v2 + v3);
      else
        v4 = 0;
      v5 = (_BYTE *)v2;
    }
    v6 = specialized Data._Representation.init(_:)(v5, v4);
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
      v9 = String.UTF8View._foreignCount()();
    }
    else if ((a2 & 0x2000000000000000) != 0)
    {
      v9 = HIBYTE(a2) & 0xF;
    }
    else
    {
      v9 = a1 & 0xFFFFFFFFFFFFLL;
    }
    *(_QWORD *)&v14[0] = specialized Data._Representation.init(count:)(v9);
    *((_QWORD *)&v14[0] + 1) = v10;
    MEMORY[0x1E0C80A78](*(_QWORD *)&v14[0]);
    specialized Data._Representation.withUnsafeMutableBytes<A>(_:)();
    __asm { BR              X12 }
  }
  outlined init with take of Endpoint(v14, (uint64_t)v17);
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
  swift_bridgeObjectRelease();
  v14[0] = v16;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
  return *(_QWORD *)&v14[0];
}

BOOL static PersonIdentityGenerator.GenerationErrors.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void PersonIdentityGenerator.GenerationErrors.hash(into:)(uint64_t a1, char a2)
{
  Hasher._combine(_:)(a2 & 1);
}

Swift::Int PersonIdentityGenerator.GenerationErrors.hashValue.getter(char a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1 & 1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance PersonIdentityGenerator.GenerationErrors(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

id PersonIdentityGenerator.queue.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___SLPersonIdentityGenerator_queue);
}

id PersonIdentityGenerator.keyQueryController.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___SLPersonIdentityGenerator_keyQueryController);
}

void *PersonIdentityGenerator.SLIDSServiceNameGelato.unsafeMutableAddressor()
{
  return &static PersonIdentityGenerator.SLIDSServiceNameGelato;
}

unint64_t static PersonIdentityGenerator.SLIDSServiceNameGelato.getter()
{
  return 0xD00000000000001ELL;
}

id PersonIdentityGenerator.__allocating_init(queue:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return PersonIdentityGenerator.init(queue:)(a1);
}

id PersonIdentityGenerator.init(queue:)(void *a1)
{
  objc_class *ObjectType;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id result;
  id v8;
  uint64_t v9;
  char *v10;
  id v11;
  objc_super v12;
  _QWORD v13[5];

  ObjectType = (objc_class *)swift_getObjectType();
  v3 = objc_allocWithZone((Class)type metadata accessor for KeyQueryController());
  v4 = swift_getObjectType();
  v5 = (void *)objc_opt_self();
  v6 = a1;
  result = objc_msgSend(v5, sel_sharedInstance);
  if (result)
  {
    v8 = result;
    v13[3] = type metadata accessor for SLHighlight(0, (unint64_t *)&lazy cache variable for type metadata for IDSIDQueryController);
    v13[4] = &protocol witness table for IDSIDQueryController;
    v13[0] = v8;
    v9 = (*(uint64_t (**)(unint64_t, unint64_t, id, _QWORD *))(v4 + 176))(0xD00000000000001ELL, 0x8000000199FB0A50, v6, v13);
    swift_deallocPartialClassInstance();
    v10 = (char *)objc_allocWithZone(ObjectType);
    *(_QWORD *)&v10[OBJC_IVAR___SLPersonIdentityGenerator_queue] = v6;
    *(_QWORD *)&v10[OBJC_IVAR___SLPersonIdentityGenerator_keyQueryController] = v9;
    v12.receiver = v10;
    v12.super_class = ObjectType;
    v11 = objc_msgSendSuper2(&v12, sel_init);
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id PersonIdentityGenerator.__allocating_init(queue:keyQueryController:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  char *v5;
  objc_super v7;

  v5 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v5[OBJC_IVAR___SLPersonIdentityGenerator_queue] = a1;
  *(_QWORD *)&v5[OBJC_IVAR___SLPersonIdentityGenerator_keyQueryController] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id PersonIdentityGenerator.init(queue:keyQueryController:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v2[OBJC_IVAR___SLPersonIdentityGenerator_queue] = a1;
  *(_QWORD *)&v2[OBJC_IVAR___SLPersonIdentityGenerator_keyQueryController] = a2;
  v7.receiver = v2;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[23] = a3;
  v4[24] = v3;
  v4[21] = a1;
  v4[22] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for P256.Signing.PublicKey?);
  v4[25] = swift_task_alloc();
  v5 = type metadata accessor for P256.Signing.PublicKey();
  v4[26] = v5;
  v4[27] = *(_QWORD *)(v5 - 8);
  v4[28] = swift_task_alloc();
  v4[29] = swift_task_alloc();
  v6 = type metadata accessor for NodeIdentity(0);
  v4[30] = v6;
  v4[31] = *(_QWORD *)(v6 - 8);
  v4[32] = swift_task_alloc();
  v4[33] = swift_task_alloc();
  v4[34] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SHA256Digest?);
  v4[35] = swift_task_alloc();
  return swift_task_switch();
}

{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v5 = (_QWORD *)*v4;
  v5[42] = a1;
  v5[43] = a2;
  v5[44] = a3;
  v5[45] = v3;
  swift_task_dealloc();
  if (v3)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(_QWORD **)(v0 + 168);
  v2 = v1[2];
  *(_QWORD *)(v0 + 288) = v2;
  if (v2)
  {
    *(_QWORD *)(v0 + 296) = MEMORY[0x1E0DEE9E0];
    *(_QWORD *)(v0 + 304) = 0;
    v3 = v1[4];
    *(_QWORD *)(v0 + 312) = v3;
    v4 = v1[5];
    *(_QWORD *)(v0 + 320) = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 328) = v5;
    *v5 = v0;
    v5[1] = PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:);
    return PersonIdentityGenerator.paddedPublicKeys(for:using:alignment:)(v3, v4, *(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 184), 32);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x1E0DEE9E0]);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t inited;
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
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  size_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  id v75;
  Class isa;
  Class v77;
  Class v78;
  id v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  char v91;
  uint64_t *v92;
  uint64_t v93;
  char v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  _QWORD *v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  size_t v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void (*v114)(uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 336);
  if (!v1)
  {
    swift_bridgeObjectRelease();
    v28 = *(_QWORD *)(v0 + 296);
    goto LABEL_46;
  }
  v3 = *(_QWORD *)(v0 + 344);
  v2 = *(_QWORD *)(v0 + 352);
  swift_bridgeObjectRetain();
  outlined copy of Data._Representation(v3, v2);
  outlined consume of Data._Representation(v3, v2);
  v4 = *(_QWORD *)(v1 + 16);
  v5 = MEMORY[0x1E0DEE9D8];
  v111 = v1;
  if (v4)
  {
    v6 = (uint64_t *)(v0 + 136);
    v7 = *(_QWORD *)(v0 + 216);
    *(_QWORD *)(v0 + 136) = MEMORY[0x1E0DEE9D8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4, 0);
    v8 = v1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    v113 = *(_QWORD *)(v7 + 72);
    v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    do
    {
      v10 = *(_QWORD *)(v0 + 256);
      v11 = *(_QWORD *)(v0 + 232);
      v13 = *(_QWORD *)(v0 + 208);
      v12 = *(_QWORD *)(v0 + 216);
      v9(v11, v8, v13);
      v9(v10, v11, v13);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
      v5 = *(_QWORD *)(v0 + 136);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v5 + 16) + 1, 1);
        v5 = *v6;
      }
      v15 = *(_QWORD *)(v5 + 16);
      v14 = *(_QWORD *)(v5 + 24);
      if (v15 >= v14 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v14 > 1, v15 + 1, 1);
        v5 = *v6;
      }
      v17 = *(_QWORD *)(v0 + 248);
      v16 = *(_QWORD *)(v0 + 256);
      *(_QWORD *)(v5 + 16) = v15 + 1;
      outlined init with take of NodeIdentity(v16, v5+ ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80))+ *(_QWORD *)(v17 + 72) * v15);
      v8 += v113;
      --v4;
    }
    while (v4);
  }
  type metadata accessor for MerkleTree();
  inited = swift_initStackObject();
  *(_QWORD *)(inited + 24) = 0;
  v19 = *(_QWORD *)(v5 + 16);
  v110 = inited;
  if (v19)
  {
    v20 = *(_QWORD *)(v0 + 248);
    *(_QWORD *)(v0 + 128) = MEMORY[0x1E0DEE9D8];
    specialized ContiguousArray.reserveCapacity(_:)();
    v21 = v5 + ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
    v22 = *(_QWORD *)(v20 + 72);
    do
    {
      v23 = *(_QWORD *)(v0 + 264);
      v24 = *(_QWORD *)(v0 + 272);
      outlined init with copy of NodeIdentity(v21, v24);
      outlined init with copy of NodeIdentity(v24, v23);
      type metadata accessor for MerkleNode(0);
      v25 = swift_allocObject();
      *(_QWORD *)(v25 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_parent) = 0;
      *(_QWORD *)(v25 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_left) = 0;
      *(_QWORD *)(v25 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_right) = 0;
      outlined init with take of NodeIdentity(v23, v25 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_node);
      outlined destroy of NodeIdentity(v24);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      v21 += v22;
      --v19;
    }
    while (v19);
    v26 = *(_QWORD *)(v0 + 128);
    swift_bridgeObjectRelease();
    v27 = v110;
  }
  else
  {
    v27 = inited;
    swift_bridgeObjectRelease();
    v26 = MEMORY[0x1E0DEE9D8];
  }
  *(_QWORD *)(v27 + 16) = v26;
  v29 = swift_bridgeObjectRetain();
  v30 = MerkleTree.buildTree(nodes:)(v29);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(_QWORD *)(v27 + 24) = v30;
  swift_release();
  v31 = *(_QWORD *)(v0 + 280);
  if (!v30)
  {
    v47 = type metadata accessor for SHA256Digest();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v31, 1, 1, v47);
    goto LABEL_22;
  }
  v32 = *(void (**)(uint64_t))(*(_QWORD *)v30 + 184);
  v33 = swift_retain();
  v32(v33);
  swift_release();
  v34 = type metadata accessor for SHA256Digest();
  v35 = *(_QWORD *)(v34 - 8);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v35 + 56))(v31, 0, 1, v34);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v31, 1, v34) == 1)
  {
LABEL_22:
    v48 = *(_QWORD *)(v0 + 344);
    v49 = *(_QWORD *)(v0 + 352);
    v50 = *(_QWORD *)(v0 + 336);
    v51 = *(_QWORD *)(v0 + 280);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    outlined consume of (keys: [P256.Signing.PublicKey], tps: Data)?(v50, v48, v49);
    outlined destroy of SymmetricKey??(v51, &demangling cache variable for type metadata for SHA256Digest?);
    v28 = *(_QWORD *)(v0 + 296);
    goto LABEL_46;
  }
  lazy protocol witness table accessor for type SHA256Digest and conformance SHA256Digest();
  v36 = Digest.makeIterator()();
  v38 = specialized _copySequenceToContiguousArray<A>(_:)(v36, v37);
  swift_bridgeObjectRelease();
  v39 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt8]);
  *(_QWORD *)(v0 + 40) = v39;
  *(_QWORD *)(v0 + 48) = lazy protocol witness table accessor for type [UInt8] and conformance <A> [A]();
  *(_QWORD *)(v0 + 16) = v38;
  v40 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v39);
  v41 = *v40;
  v42 = *(_QWORD *)(*v40 + 16);
  if (v42)
  {
    v43 = v111;
    if (v42 <= 0xE)
    {
      *(_QWORD *)(v0 + 118) = 0;
      *(_QWORD *)(v0 + 112) = 0;
      *(_BYTE *)(v0 + 126) = v42;
      memcpy((void *)(v0 + 112), (const void *)(v41 + 32), v42);
      v108 = *(_QWORD *)(v0 + 112);
      v46 = *(unsigned int *)(v0 + 120) | ((unint64_t)*(unsigned __int8 *)(v0 + 124) << 32) | ((unint64_t)*(unsigned __int8 *)(v0 + 125) << 40) | ((unint64_t)*(unsigned __int8 *)(v0 + 126) << 48);
      swift_retain();
    }
    else
    {
      type metadata accessor for __DataStorage();
      swift_allocObject();
      swift_retain();
      v44 = __DataStorage.init(bytes:length:)();
      v45 = v44;
      if (v42 >= 0x7FFFFFFF)
      {
        type metadata accessor for Data.RangeReference();
        v52 = swift_allocObject();
        *(_QWORD *)(v52 + 16) = 0;
        *(_QWORD *)(v52 + 24) = v42;
        v108 = v52;
        v46 = v45 | 0x8000000000000000;
      }
      else
      {
        v108 = v42 << 32;
        v46 = v44 | 0x4000000000000000;
      }
    }
  }
  else
  {
    swift_retain();
    v108 = 0;
    v46 = 0xC000000000000000;
    v43 = v111;
  }
  v53 = *(_QWORD *)(v0 + 280);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v53, v34);
  v54 = *(_QWORD *)(v43 + 16);
  v55 = *(_QWORD *)(v0 + 216);
  v109 = v46;
  if (v54)
  {
    v56 = v43 + ((*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80));
    v112 = *(_QWORD *)(v55 + 72);
    v114 = *(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 16);
    swift_bridgeObjectRetain();
    v57 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    while (1)
    {
      v58 = *(_QWORD *)(v0 + 208);
      v59 = *(_QWORD *)(v0 + 216);
      v60 = *(_QWORD *)(v0 + 200);
      v114(v60, v56, v58);
      v61 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v59 + 56);
      v61(v60, 0, 1, v58);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v59 + 48))(v60, 1, v58) == 1)
        break;
      v63 = *(_QWORD *)(v0 + 216);
      v62 = *(_QWORD *)(v0 + 224);
      v64 = *(_QWORD *)(v0 + 208);
      v65 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v63 + 32))(v62, *(_QWORD *)(v0 + 200), v64);
      v66 = MEMORY[0x19AEC3A88](v65);
      v68 = v67;
      (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v62, v64);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v57 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v57[2] + 1, 1, v57);
      v70 = v57[2];
      v69 = v57[3];
      if (v70 >= v69 >> 1)
        v57 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v69 > 1), v70 + 1, 1, v57);
      v57[2] = v70 + 1;
      v71 = &v57[2 * v70];
      v71[4] = v66;
      v71[5] = v68;
      v56 += v112;
      if (!--v54)
        goto LABEL_36;
    }
    v72 = v108;
  }
  else
  {
    swift_bridgeObjectRetain();
    v61 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v55 + 56);
LABEL_36:
    v72 = v108;
    v61(*(_QWORD *)(v0 + 200), 1, 1, *(_QWORD *)(v0 + 208));
  }
  v73 = *(_QWORD *)(v0 + 344);
  v74 = *(_QWORD *)(v0 + 352);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRetain();
  outlined copy of Data._Representation(v73, v74);
  swift_bridgeObjectRelease();
  v75 = objc_allocWithZone(MEMORY[0x1E0CD73E0]);
  outlined copy of Data._Representation(v72, v109);
  isa = Data._bridgeToObjectiveC()().super.isa;
  v77 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v78 = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v73, v74);
  v79 = objc_msgSend(v75, sel_initWithRootHash_publicKeys_trackingPreventionSalt_, isa, v77, v78);
  outlined consume of Data._Representation(v72, v109);

  if (v79)
  {
    v81 = *(_QWORD *)(v0 + 344);
    v80 = *(_QWORD *)(v0 + 352);
    v82 = *(_QWORD *)(v0 + 336);
    v84 = *(_QWORD *)(v0 + 312);
    v83 = *(_QWORD *)(v0 + 320);
    v28 = *(_QWORD *)(v0 + 296);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)((uint64_t)v79, v84, v83, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    outlined consume of (keys: [P256.Signing.PublicKey], tps: Data)?(v82, v81, v80);
    v86 = v72;
    v87 = v109;
  }
  else
  {
    v88 = *(_QWORD *)(v0 + 312);
    v89 = *(_QWORD *)(v0 + 320);
    swift_bridgeObjectRetain();
    v90 = specialized __RawDictionaryStorage.find<A>(_:)(v88, v89);
    LOBYTE(v89) = v91;
    swift_bridgeObjectRelease();
    if ((v89 & 1) == 0)
    {
      v105 = *(_QWORD *)(v0 + 344);
      v106 = *(_QWORD *)(v0 + 352);
      v107 = *(_QWORD *)(v0 + 336);
      swift_bridgeObjectRelease();
      outlined consume of (keys: [P256.Signing.PublicKey], tps: Data)?(v107, v105, v106);
      outlined consume of Data._Representation(v72, v109);
      v28 = *(_QWORD *)(v0 + 296);
      goto LABEL_45;
    }
    v92 = (uint64_t *)(v0 + 296);
    v93 = *(_QWORD *)(v0 + 296);
    v94 = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v0 + 160) = v93;
    if ((v94 & 1) == 0)
    {
      specialized _NativeDictionary.copy()();
      v92 = (uint64_t *)(v0 + 160);
    }
    v28 = *v92;
    v96 = *(_QWORD *)(v0 + 344);
    v95 = *(_QWORD *)(v0 + 352);
    v97 = *(_QWORD *)(v0 + 336);
    swift_bridgeObjectRelease();
    v98 = *(void **)(*(_QWORD *)(v28 + 56) + 8 * v90);
    specialized _NativeDictionary._delete(at:)(v90, v28);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    outlined consume of (keys: [P256.Signing.PublicKey], tps: Data)?(v97, v96, v95);
    v86 = v72;
    v87 = v109;
  }
  outlined consume of Data._Representation(v86, v87);
LABEL_45:
  swift_setDeallocating();
  swift_bridgeObjectRelease();
  swift_release();
LABEL_46:
  v99 = *(_QWORD *)(v0 + 304) + 1;
  if (v99 == *(_QWORD *)(v0 + 288))
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v28);
  }
  else
  {
    *(_QWORD *)(v0 + 296) = v28;
    *(_QWORD *)(v0 + 304) = v99;
    v101 = *(_QWORD *)(v0 + 168) + 16 * v99;
    v102 = *(_QWORD *)(v101 + 32);
    *(_QWORD *)(v0 + 312) = v102;
    v103 = *(_QWORD *)(v101 + 40);
    *(_QWORD *)(v0 + 320) = v103;
    swift_bridgeObjectRetain();
    v104 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 328) = v104;
    *v104 = v0;
    v104[1] = PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:);
    return PersonIdentityGenerator.paddedPublicKeys(for:using:alignment:)(v102, v103, *(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 184), 32);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (one-time initialization token for default != -1)
    swift_once();
  v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Log.default);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v2 = Logger.logObject.getter();
  v3 = static os_log_type_t.error.getter();
  v4 = os_log_type_enabled(v2, v3);
  v5 = *(_QWORD *)(v0 + 184);
  if (v4)
  {
    v13 = *(_QWORD *)(v0 + 176);
    v6 = swift_slowAlloc();
    v7 = swift_slowAlloc();
    v14[0] = v7;
    *(_DWORD *)v6 = 136315394;
    v8 = swift_bridgeObjectRetain();
    v9 = MEMORY[0x19AEC3CB0](v8, MEMORY[0x1E0DEA968]);
    v11 = v10;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 152) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v11, v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v6 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 144) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v5, v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_199EFF000, v2, v3, "Error while requesting public keys for handle: %s documentIdentifier: %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x19AEC4EBC](v7, -1, -1);
    MEMORY[0x19AEC4EBC](v6, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PersonIdentityGenerator.paddedPublicKeys(for:using:alignment:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[7] = a5;
  v6[8] = v5;
  v6[5] = a3;
  v6[6] = a4;
  v6[3] = a1;
  v6[4] = a2;
  v7 = type metadata accessor for P256.Signing.PrivateKey();
  v6[9] = v7;
  v6[10] = *(_QWORD *)(v7 - 8);
  v6[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for P256.Signing.PublicKey?);
  v6[12] = swift_task_alloc();
  v8 = type metadata accessor for P256.Signing.PublicKey();
  v6[13] = v8;
  v6[14] = *(_QWORD *)(v8 - 8);
  v6[15] = swift_task_alloc();
  v6[16] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t PersonIdentityGenerator.paddedPublicKeys(for:using:alignment:)()
{
  _QWORD *v0;
  int *v1;
  _QWORD *v2;
  int *v4;

  v1 = *(int **)((*MEMORY[0x1E0DEEDD8] & **(_QWORD **)(v0[8] + OBJC_IVAR___SLPersonIdentityGenerator_keyQueryController))
               + 0xB8);
  v4 = (int *)((char *)v1 + *v1);
  v2 = (_QWORD *)swift_task_alloc();
  v0[17] = v2;
  *v2 = v0;
  v2[1] = PersonIdentityGenerator.paddedPublicKeys(for:using:alignment:);
  return ((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4)(v0[3], v0[4], v0[5], v0[6]);
}

{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void (*v18)(unint64_t, unint64_t, uint64_t);
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;

  v1 = *(_QWORD *)(v0 + 144);
  if (!v1)
  {
    v27 = 0;
    v28 = 0;
LABEL_23:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 8))(v27, v28, v1);
  }
  v3 = *(_QWORD *)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 160);
  v4 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  outlined copy of Data._Representation(v3, v2);
  result = outlined consume of Data._Representation(v3, v2);
  if (!v4)
  {
    __break(1u);
    goto LABEL_25;
  }
  v6 = *(_QWORD *)(v0 + 56);
  v7 = *(_QWORD *)(v1 + 16) % v6;
  if (!v7)
    goto LABEL_16;
  v8 = v6 - v7;
  if (__OFSUB__(v6, v7))
  {
    __break(1u);
  }
  else if ((v8 & 0x8000000000000000) == 0)
  {
    if (v8)
    {
      v9 = *(_QWORD *)(v0 + 112);
      v10 = *(_QWORD *)(v0 + 80);
      v3 = MEMORY[0x1E0DEE9D8];
      do
      {
        while (1)
        {
          v12 = *(_QWORD *)(v0 + 96);
          v11 = *(_QWORD *)(v0 + 104);
          v13 = *(_QWORD *)(v0 + 88);
          v14 = *(_QWORD *)(v0 + 72);
          P256.Signing.PrivateKey.init(compactRepresentable:)();
          P256.Signing.PrivateKey.publicKey.getter();
          (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v13, v14);
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v9 + 56))(v12, 0, 1, v11);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v12, 1, v11) != 1)
            break;
          outlined destroy of SymmetricKey??(*(_QWORD *)(v0 + 96), &demangling cache variable for type metadata for P256.Signing.PublicKey?);
          if (!--v8)
            goto LABEL_17;
        }
        v16 = *(_QWORD *)(v0 + 120);
        v15 = *(_QWORD *)(v0 + 128);
        v17 = *(_QWORD *)(v0 + 104);
        v18 = *(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 32);
        v18(v15, *(_QWORD *)(v0 + 96), v17);
        v18(v16, v15, v17);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v3 + 16) + 1, 1, v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<P256.Signing.PublicKey>, (uint64_t (*)(_QWORD))MEMORY[0x1E0CA9758]);
        v20 = *(_QWORD *)(v3 + 16);
        v19 = *(_QWORD *)(v3 + 24);
        if (v20 >= v19 >> 1)
          v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v19 > 1, v20 + 1, 1, v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<P256.Signing.PublicKey>, (uint64_t (*)(_QWORD))MEMORY[0x1E0CA9758]);
        v21 = *(_QWORD *)(v0 + 120);
        v22 = *(_QWORD *)(v0 + 104);
        *(_QWORD *)(v3 + 16) = v20 + 1;
        v18(v3+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(_QWORD *)(v9 + 72) * v20, v21, v22);
        --v8;
      }
      while (v8);
LABEL_17:
      if (one-time initialization token for personIdentityGenerator == -1)
      {
LABEL_18:
        v23 = type metadata accessor for Logger();
        __swift_project_value_buffer(v23, (uint64_t)static Log.personIdentityGenerator);
        swift_bridgeObjectRetain();
        v24 = Logger.logObject.getter();
        v25 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v24, v25))
        {
          v26 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v26 = 134217984;
          *(_QWORD *)(v0 + 16) = *(_QWORD *)(v3 + 16);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_199EFF000, v24, v25, "Added %ld anonymous keys", v26, 0xCu);
          MEMORY[0x19AEC4EBC](v26, -1, -1);
        }
        else
        {
          swift_bridgeObjectRelease();
        }

        specialized Array.append<A>(contentsOf:)(v3);
        swift_bridgeObjectRelease();
        v27 = v1;
        v28 = *(_QWORD *)(v0 + 152);
        v1 = *(_QWORD *)(v0 + 160);
        goto LABEL_23;
      }
LABEL_25:
      swift_once();
      goto LABEL_18;
    }
LABEL_16:
    v3 = MEMORY[0x1E0DEE9D8];
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t PersonIdentityGenerator.paddedPublicKeys(for:using:alignment:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  v5 = *v4;
  *(_QWORD *)(v5 + 144) = a1;
  *(_QWORD *)(v5 + 152) = a2;
  *(_QWORD *)(v5 + 160) = a3;
  swift_task_dealloc();
  if (!v3)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t Digest.data.getter()
{
  uint64_t v0;
  uint64_t v1;

  v0 = Digest.bytes.getter();
  v1 = specialized Data.init<A>(_:)(v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t @objc closure #1 in PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:)(int a1, int a2, void *aBlock, void *a4)
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4[2] = a4;
  v4[3] = _Block_copy(aBlock);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v4[4] = v6;
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;
  v4[5] = v8;
  a4;
  v10 = (_QWORD *)swift_task_alloc();
  v4[6] = v10;
  *v10 = v4;
  v10[1] = @objc closure #1 in PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:);
  return PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:)(v6, v7, v9);
}

uint64_t @objc closure #1 in PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:)()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  Class isa;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);

  v2 = v0;
  v3 = *v1;
  v4 = *(void **)(*v1 + 16);
  v5 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v0)
  {
    v6 = _convertErrorToNSError(_:)();

    isa = 0;
    v8 = (void *)v6;
  }
  else
  {
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for SWPersonIdentity);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v6 = 0;
    v8 = isa;
  }
  v9 = *(void (***)(_QWORD, _QWORD, _QWORD))(v3 + 24);
  ((void (**)(_QWORD, Class, uint64_t))v9)[2](v9, isa, v6);

  _Block_release(v9);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  unint64_t v5;

  v1 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **(_QWORD **)(*(_QWORD *)(v0 + 32)
                                                                  + OBJC_IVAR___SLPersonIdentityGenerator_keyQueryController))
                            + 0x98))();
  *(_QWORD *)(v0 + 40) = v1;
  if (v1)
  {
    v2 = v1;
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 48) = v3;
    *v3 = v0;
    v3[1] = PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:);
    return PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:)(v2, *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  }
  else
  {
    v5 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E0DEE9D8]);
    return (*(uint64_t (**)(unint64_t))(v0 + 8))(v5);
  }
}

{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 64));
}

{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 56) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 64) = a1;
  return swift_task_switch();
}

uint64_t @objc closure #1 in PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:)(int a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  uint64_t v5;
  id v6;

  v3[4] = a3;
  v3[5] = _Block_copy(aBlock);
  v3[2] = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3[3] = v5;
  v3[6] = v5;
  v6 = a3;
  return swift_task_switch();
}

uint64_t @objc closure #1 in PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  void *v6;
  Class isa;
  void (**v8)(_QWORD, _QWORD, _QWORD);

  v1 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **(_QWORD **)(*(_QWORD *)(v0 + 32)
                                                                  + OBJC_IVAR___SLPersonIdentityGenerator_keyQueryController))
                            + 0x98))();
  *(_QWORD *)(v0 + 56) = v1;
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)(v0 + 16);
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 64) = v4;
    *v4 = v0;
    v4[1] = @objc closure #1 in PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:);
    return PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:)(v2, v3, *(_QWORD *)(v0 + 48));
  }
  else
  {
    v6 = *(void **)(v0 + 32);
    specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E0DEE9D8]);

    swift_bridgeObjectRelease();
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for SWPersonIdentity);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v8 = *(void (***)(_QWORD, _QWORD, _QWORD))(v0 + 40);
    ((void (**)(_QWORD, Class, _QWORD))v8)[2](v8, isa, 0);

    _Block_release(v8);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

{
  uint64_t v0;
  Class isa;
  void (**v2)(_QWORD, _QWORD, _QWORD);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for SWPersonIdentity);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v2 = *(void (***)(_QWORD, _QWORD, _QWORD))(v0 + 40);
  ((void (**)(_QWORD, Class, _QWORD))v2)[2](v2, isa, 0);

  _Block_release(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);

  v1 = *(void **)(v0 + 72);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = (void *)_convertErrorToNSError(_:)();

  v3 = *(void (***)(_QWORD, _QWORD, _QWORD))(v0 + 40);
  ((void (**)(_QWORD, _QWORD, void *))v3)[2](v3, 0, v2);

  _Block_release(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t @objc closure #1 in PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 72) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 80) = a1;
  return swift_task_switch();
}

uint64_t PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[30] = a3;
  v4[31] = v3;
  v4[28] = a1;
  v4[29] = a2;
  v5 = type metadata accessor for SHA256Digest();
  v4[32] = v5;
  v4[33] = *(_QWORD *)(v5 - 8);
  v4[34] = swift_task_alloc();
  v4[35] = type metadata accessor for NodeIdentity(0);
  v4[36] = swift_task_alloc();
  v4[37] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: P256.Signing.PublicKey, tps: Data));
  v4[38] = swift_task_alloc();
  v4[39] = swift_task_alloc();
  v4[40] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for P256.Signing.PublicKey?);
  v4[41] = swift_task_alloc();
  v6 = type metadata accessor for P256.Signing.PublicKey();
  v4[42] = v6;
  v4[43] = *(_QWORD *)(v6 - 8);
  v4[44] = swift_task_alloc();
  v4[45] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SHA256Digest?);
  v4[46] = swift_task_alloc();
  v4[47] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:)()
{
  uint64_t v0;
  void *v1;
  uint64_t inited;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void (*v27)(unint64_t, unint64_t, uint64_t);
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t, uint64_t);
  int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  id v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  char v52;
  char v53;
  _QWORD *v54;
  id v55;
  void *v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  void *v64;
  _BYTE *v65;
  uint64_t v66;
  id v67;
  id v68;
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  int *v76;
  uint64_t v77;
  _QWORD *v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81[2];

  v81[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(v0 + 224);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_199FA7840;
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 40) = v3;
  v4 = (void *)*MEMORY[0x1E0CD6A50];
  type metadata accessor for CFStringRef(0);
  v6 = v5;
  *(_QWORD *)(inited + 72) = v5;
  *(_QWORD *)(inited + 48) = v4;
  *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 88) = v7;
  v8 = (void *)*MEMORY[0x1E0CD6A10];
  *(_QWORD *)(inited + 120) = v6;
  *(_QWORD *)(inited + 96) = v8;
  v9 = v4;
  v10 = v8;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  v11 = objc_msgSend(v1, sel_publicKeys);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRetain();
  v13 = specialized Sequence.compactMap<A>(_:)(v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  if (v13 >> 62)
    goto LABEL_17;
  v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v14; v14 = _CocoaArrayWrapper.endIndex.getter())
  {
    v15 = 0;
    v16 = *(_QWORD *)(v0 + 344);
    v80 = v13 & 0xC000000000000001;
    v17 = MEMORY[0x1E0DEE9D8];
    v79 = v13;
    while (1)
    {
      v18 = v80 ? (id)MEMORY[0x19AEC3E78](v15, v13) : *(id *)(v13 + 8 * v15 + 32);
      v19 = v18;
      v20 = v15 + 1;
      if (__OFADD__(v15, 1))
        break;
      SecKeyRef.p256PublicKey.getter();
      v22 = *(_QWORD *)(v0 + 328);
      v21 = *(_QWORD *)(v0 + 336);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v16 + 56))(v22, 0, 1, v21);

      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v22, 1, v21) == 1)
      {
        outlined destroy of SymmetricKey??(*(_QWORD *)(v0 + 328), &demangling cache variable for type metadata for P256.Signing.PublicKey?);
      }
      else
      {
        v23 = v14;
        v25 = *(_QWORD *)(v0 + 352);
        v24 = *(_QWORD *)(v0 + 360);
        v26 = *(_QWORD *)(v0 + 336);
        v27 = *(void (**)(unint64_t, unint64_t, uint64_t))(v16 + 32);
        v27(v24, *(_QWORD *)(v0 + 328), v26);
        v27(v25, v24, v26);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v17 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v17 + 16) + 1, 1, v17, &demangling cache variable for type metadata for _ContiguousArrayStorage<P256.Signing.PublicKey>, (uint64_t (*)(_QWORD))MEMORY[0x1E0CA9758]);
        v29 = *(_QWORD *)(v17 + 16);
        v28 = *(_QWORD *)(v17 + 24);
        if (v29 >= v28 >> 1)
          v17 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v28 > 1, v29 + 1, 1, v17, &demangling cache variable for type metadata for _ContiguousArrayStorage<P256.Signing.PublicKey>, (uint64_t (*)(_QWORD))MEMORY[0x1E0CA9758]);
        v30 = *(_QWORD *)(v0 + 352);
        v31 = *(_QWORD *)(v0 + 336);
        *(_QWORD *)(v17 + 16) = v29 + 1;
        v27(v17+ ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80))+ *(_QWORD *)(v16 + 72) * v29, v30, v31);
        v14 = v23;
        v13 = v79;
      }
      ++v15;
      if (v20 == v14)
        goto LABEL_19;
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
  }
  v17 = MEMORY[0x1E0DEE9D8];
LABEL_19:
  v32 = *(_QWORD *)(v0 + 376);
  v34 = *(_QWORD *)(v0 + 256);
  v33 = *(_QWORD *)(v0 + 264);
  swift_bridgeObjectRelease_n();
  v35 = specialized PersonIdentityGenerator.merkleTreeForPublicKeys(_:)(v17);
  *(_QWORD *)(v0 + 384) = v35;
  v36 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(_QWORD *)v35 + 120))(v36);
  v37 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 48);
  *(_QWORD *)(v0 + 392) = v37;
  v38 = v37(v32, 1, v34);
  v39 = *(_QWORD *)(v0 + 376);
  if (v38 == 1)
  {
    outlined destroy of SymmetricKey??(*(_QWORD *)(v0 + 376), &demangling cache variable for type metadata for SHA256Digest?);
    v40 = 0;
    v41 = 0xF000000000000000;
  }
  else
  {
    v43 = *(_QWORD *)(v0 + 256);
    v42 = *(_QWORD *)(v0 + 264);
    lazy protocol witness table accessor for type SHA256Digest and conformance SHA256Digest();
    v44 = Digest.makeIterator()();
    v46 = specialized _copySequenceToContiguousArray<A>(_:)(v44, v45);
    swift_bridgeObjectRelease();
    v40 = specialized Data.init<A>(_:)(v46);
    v41 = v47;
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v39, v43);
  }
  v48 = objc_msgSend(*(id *)(v0 + 224), sel_rootHash);
  v49 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v51 = v50;

  if (v41 >> 60 == 15)
  {
    outlined consume of Data?(v40, v41);
    outlined consume of Data?(v49, v51);
  }
  else
  {
    outlined copy of Data?(v40, v41);
    specialized static Data.== infix(_:_:)(v40, v41);
    v53 = v52;
    outlined consume of Data._Representation(v49, v51);
    outlined consume of Data?(v40, v41);
    outlined consume of Data?(v40, v41);
    if ((v53 & 1) != 0)
    {
      v54 = *(_QWORD **)(*(_QWORD *)(v0 + 248) + OBJC_IVAR___SLPersonIdentityGenerator_keyQueryController);
      v55 = objc_msgSend(*(id *)(v0 + 224), sel_trackingPreventionSalt);
      if (v55)
      {
        v56 = v55;
        v57 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        v59 = v58;

      }
      else
      {
        v57 = 0;
        v59 = 0xF000000000000000;
      }
      *(_QWORD *)(v0 + 400) = v57;
      *(_QWORD *)(v0 + 408) = v59;
      v76 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v54) + 0xE8);
      v77 = *v76;
      v78 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 416) = v78;
      *v78 = v0;
      v78[1] = PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:);
      return ((uint64_t (*)(_QWORD, _QWORD, _QWORD, uint64_t, unint64_t))((char *)v76 + v77))(*(_QWORD *)(v0 + 320), *(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 240), v57, v59);
    }
  }
  if (one-time initialization token for default != -1)
    swift_once();
  v60 = type metadata accessor for Logger();
  __swift_project_value_buffer(v60, (uint64_t)static Log.default);
  v61 = Logger.logObject.getter();
  v62 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v61, v62))
  {
    v63 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v63 = 0;
    _os_log_impl(&dword_199EFF000, v61, v62, "PersonIdentityGenerator: Root hash of given identity did not match the root hash of the tree generated by the identity.", v63, 2u);
    MEMORY[0x19AEC4EBC](v63, -1, -1);
  }

  lazy protocol witness table accessor for type PersonIdentityGenerator.GenerationErrors and conformance PersonIdentityGenerator.GenerationErrors();
  v64 = (void *)swift_allocError();
  *v65 = 1;
  swift_willThrow();
  swift_release();
  if (one-time initialization token for default != -1)
    swift_once();
  v66 = type metadata accessor for Logger();
  __swift_project_value_buffer(v66, (uint64_t)static Log.default);
  v67 = v64;
  v68 = v64;
  v69 = Logger.logObject.getter();
  v70 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v69, v70))
  {
    v71 = (uint8_t *)swift_slowAlloc();
    v72 = swift_slowAlloc();
    v81[0] = v72;
    *(_DWORD *)v71 = 136315138;
    swift_getErrorValue();
    v73 = Error.localizedDescription.getter();
    *(_QWORD *)(v0 + 216) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v73, v74, v81);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_199EFF000, v69, v70, "PersonIdentityGenerator: Error while generating identity proof: %s", v71, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AEC4EBC](v72, -1, -1);
    MEMORY[0x19AEC4EBC](v71, -1, -1);
  }
  else
  {

  }
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
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  void (*v9)(uint64_t);
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  void *v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  _QWORD *v32;
  unsigned int (*v33)(uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  size_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint64_t v56;
  uint8_t *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  _BYTE *v61;
  uint64_t v62;
  id v63;
  id v64;
  NSObject *v65;
  os_log_type_t v66;
  uint8_t *v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  void (*v72)(_QWORD, uint64_t, uint64_t, _QWORD);
  uint64_t v73;
  uint64_t v74;
  id v75;
  Class isa;
  id v77;
  Class v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  void (*v83)(uint64_t, unint64_t, uint64_t);
  _QWORD *v84;
  uint64_t v85;
  _BYTE __dst[14];
  unsigned __int8 v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(v0 + 432);
  v1 = *(_QWORD *)(v0 + 440);
  v3 = *(_QWORD *)(v0 + 336);
  v4 = *(_QWORD *)(v0 + 344);
  v5 = *(_QWORD *)(v0 + 312);
  v6 = *(_QWORD *)(v0 + 296);
  v7 = (_QWORD *)(*(_QWORD *)(v0 + 320) + *(int *)(v0 + 448));
  *v7 = v1;
  v7[1] = v2;
  v8 = (_QWORD *)(v5 + *(int *)(v6 + 48));
  v9 = *(void (**)(uint64_t))(v4 + 16);
  v9(v5);
  *v8 = v1;
  v8[1] = v2;
  v10 = P256.Signing.PublicKey.secKeyData.getter();
  v12 = v11;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v3);
  if (v12 >> 60 == 15)
  {
    if (one-time initialization token for default != -1)
      swift_once();
    v13 = type metadata accessor for Logger();
    __swift_project_value_buffer(v13, (uint64_t)static Log.default);
    v14 = Logger.logObject.getter();
    v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_199EFF000, v14, v15, "PersonIdentityGenerator: Could not generate local key data", v16, 2u);
      MEMORY[0x19AEC4EBC](v16, -1, -1);
    }
    v17 = *(_QWORD *)(v0 + 320);

    lazy protocol witness table accessor for type PersonIdentityGenerator.GenerationErrors and conformance PersonIdentityGenerator.GenerationErrors();
    v18 = (void *)swift_allocError();
    *v19 = 0;
    swift_willThrow();
    swift_release();
    goto LABEL_35;
  }
  v80 = v10;
  v81 = v12;
  v20 = *(_QWORD *)(v0 + 384);
  v21 = *(_QWORD *)(v0 + 336);
  v22 = *(_QWORD *)(v0 + 344);
  v23 = *(_QWORD *)(v0 + 304);
  v24 = *(_QWORD *)(v0 + 288);
  ((void (*)(uint64_t, _QWORD, uint64_t))v9)(v23, *(_QWORD *)(v0 + 320), v21);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(v24, v23, v21);
  swift_storeEnumTagMultiPayload();
  v25 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v20 + 136))(v24);
  if (!v25)
  {
    if (one-time initialization token for default != -1)
      swift_once();
    v53 = type metadata accessor for Logger();
    __swift_project_value_buffer(v53, (uint64_t)static Log.default);
    v54 = Logger.logObject.getter();
    v55 = static os_log_type_t.error.getter();
    v56 = v80;
    if (!os_log_type_enabled(v54, v55))
      goto LABEL_34;
    v57 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v57 = 0;
    v58 = "PersonIdentityGenerator: Could not get inclusionNodes to generate the identity proof";
    goto LABEL_33;
  }
  if ((v27 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    if (one-time initialization token for default != -1)
      swift_once();
    v59 = type metadata accessor for Logger();
    __swift_project_value_buffer(v59, (uint64_t)static Log.default);
    v54 = Logger.logObject.getter();
    v55 = static os_log_type_t.error.getter();
    v56 = v80;
    if (!os_log_type_enabled(v54, v55))
      goto LABEL_34;
    v57 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v57 = 0;
    v58 = "PersonIdentityGenerator: Could not get localKeyIndex to generate the identity proof";
LABEL_33:
    _os_log_impl(&dword_199EFF000, v54, v55, v58, v57, 2u);
    MEMORY[0x19AEC4EBC](v57, -1, -1);
LABEL_34:
    v17 = *(_QWORD *)(v0 + 320);
    v60 = *(_QWORD *)(v0 + 288);

    lazy protocol witness table accessor for type PersonIdentityGenerator.GenerationErrors and conformance PersonIdentityGenerator.GenerationErrors();
    v18 = (void *)swift_allocError();
    *v61 = 1;
    swift_willThrow();
    outlined consume of Data?(v56, v81);
    swift_release();
    outlined destroy of NodeIdentity(v60);
LABEL_35:
    outlined destroy of SymmetricKey??(v17, &demangling cache variable for type metadata for (key: P256.Signing.PublicKey, tps: Data));
    if (one-time initialization token for default != -1)
      swift_once();
    v62 = type metadata accessor for Logger();
    __swift_project_value_buffer(v62, (uint64_t)static Log.default);
    v63 = v18;
    v64 = v18;
    v65 = Logger.logObject.getter();
    v66 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v65, v66))
    {
      v67 = (uint8_t *)swift_slowAlloc();
      v68 = swift_slowAlloc();
      *(_QWORD *)__dst = v68;
      *(_DWORD *)v67 = 136315138;
      swift_getErrorValue();
      v69 = Error.localizedDescription.getter();
      *(_QWORD *)(v0 + 216) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v69, v70, (uint64_t *)__dst);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_199EFF000, v65, v66, "PersonIdentityGenerator: Error while generating identity proof: %s", v67, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x19AEC4EBC](v68, -1, -1);
      MEMORY[0x19AEC4EBC](v67, -1, -1);
    }
    else
    {

    }
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
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v28 = v26;
  v29 = *(_QWORD *)(v25 + 16);
  v30 = *(_QWORD *)(v0 + 264);
  if (v29)
  {
    v79 = v26;
    v31 = v25 + ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80));
    v82 = *(_QWORD *)(v30 + 72);
    v83 = *(void (**)(uint64_t, unint64_t, uint64_t))(v30 + 16);
    v84 = (_QWORD *)(v0 + 144);
    swift_bridgeObjectRetain();
    v32 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    v85 = v30;
    while (1)
    {
      v33 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 392);
      v34 = *(_QWORD *)(v0 + 368);
      v35 = *(_QWORD *)(v0 + 256);
      v83(v34, v31, v35);
      v36 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 56);
      v36(v34, 0, 1, v35);
      if (v33(v34, 1, v35) == 1)
        break;
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v30 + 32))(*(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 368), *(_QWORD *)(v0 + 256));
      lazy protocol witness table accessor for type SHA256Digest and conformance SHA256Digest();
      v37 = Digest.makeIterator()();
      v39 = specialized _copySequenceToContiguousArray<A>(_:)(v37, v38);
      swift_bridgeObjectRelease();
      v40 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt8]);
      *(_QWORD *)(v0 + 168) = v40;
      *(_QWORD *)(v0 + 176) = lazy protocol witness table accessor for type [UInt8] and conformance <A> [A]();
      *(_QWORD *)(v0 + 144) = v39;
      v41 = __swift_project_boxed_opaque_existential_1(v84, v40);
      v42 = *v41;
      v43 = *(_QWORD *)(*v41 + 16);
      if (v43)
      {
        if (v43 <= 0xE)
        {
          memset(__dst, 0, sizeof(__dst));
          v87 = v43;
          memcpy(__dst, (const void *)(v42 + 32), v43);
          v46 = *(_QWORD *)__dst;
          v47 = *(unsigned int *)&__dst[8] | ((unint64_t)__dst[12] << 32) | ((unint64_t)__dst[13] << 40) | ((unint64_t)v87 << 48);
          swift_retain();
        }
        else
        {
          type metadata accessor for __DataStorage();
          swift_allocObject();
          swift_retain();
          v44 = __DataStorage.init(bytes:length:)();
          v45 = v44;
          if (v43 >= 0x7FFFFFFF)
          {
            type metadata accessor for Data.RangeReference();
            v46 = swift_allocObject();
            *(_QWORD *)(v46 + 16) = 0;
            *(_QWORD *)(v46 + 24) = v43;
            v47 = v45 | 0x8000000000000000;
          }
          else
          {
            v46 = v43 << 32;
            v47 = v44 | 0x4000000000000000;
          }
        }
      }
      else
      {
        swift_retain();
        v46 = 0;
        v47 = 0xC000000000000000;
      }
      v48 = *(_QWORD *)(v0 + 272);
      v49 = *(_QWORD *)(v0 + 256);
      swift_release();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v84);
      (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v48, v49);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v32 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v32[2] + 1, 1, v32);
      v51 = v32[2];
      v50 = v32[3];
      v30 = v85;
      if (v51 >= v50 >> 1)
        v32 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v50 > 1), v51 + 1, 1, v32);
      v32[2] = v51 + 1;
      v52 = &v32[2 * v51];
      v52[4] = v46;
      v52[5] = v47;
      v31 += v82;
      if (!--v29)
      {
        v28 = v79;
        v36(*(_QWORD *)(v0 + 368), 1, 1, *(_QWORD *)(v0 + 256));
        goto LABEL_43;
      }
    }
    v28 = v79;
  }
  else
  {
    v72 = *(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v30 + 56);
    swift_bridgeObjectRetain();
    v72(*(_QWORD *)(v0 + 368), 1, 1, *(_QWORD *)(v0 + 256));
  }
LABEL_43:
  v73 = *(_QWORD *)(v0 + 320);
  v74 = *(_QWORD *)(v0 + 288);
  swift_bridgeObjectRelease_n();
  v75 = objc_allocWithZone(MEMORY[0x1E0CD73E8]);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v77 = objc_msgSend(v75, sel_initWithInclusionHashes_, isa);

  objc_msgSend(v77, sel_setLocalKeyIndex_, v28);
  v78 = Data._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v77, sel_setPublicKey_, v78);
  outlined consume of Data?(v80, v81);
  swift_release();

  outlined destroy of NodeIdentity(v74);
  outlined destroy of SymmetricKey??(v73, &demangling cache variable for type metadata for (key: P256.Signing.PublicKey, tps: Data));
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
  return (*(uint64_t (**)(id))(v0 + 8))(v77);
}

{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(v0 + 400);
  v2 = *(_QWORD *)(v0 + 408);
  swift_release();
  outlined consume of Data?(v1, v2);
  v3 = *(void **)(v0 + 424);
  if (one-time initialization token for default != -1)
    swift_once();
  v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)static Log.default);
  v5 = v3;
  v6 = v3;
  v7 = Logger.logObject.getter();
  v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v14[0] = v10;
    *(_DWORD *)v9 = 136315138;
    swift_getErrorValue();
    v11 = Error.localizedDescription.getter();
    *(_QWORD *)(v0 + 216) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v11, v12, v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_199EFF000, v7, v8, "PersonIdentityGenerator: Error while generating identity proof: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AEC4EBC](v10, -1, -1);
    MEMORY[0x19AEC4EBC](v9, -1, -1);
  }
  else
  {

  }
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
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v6 = *v3;
  *(_QWORD *)(*v3 + 424) = v2;
  swift_task_dealloc();
  if (!v2)
  {
    v7 = *(_QWORD *)(v6 + 400);
    v8 = *(_QWORD *)(v6 + 408);
    v9 = *(_QWORD *)(v6 + 296);
    *(_QWORD *)(v6 + 432) = a2;
    *(_QWORD *)(v6 + 440) = a1;
    outlined consume of Data?(v7, v8);
    *(_DWORD *)(v6 + 448) = *(_DWORD *)(v9 + 48);
  }
  return swift_task_switch();
}

uint64_t @objc closure #1 in PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:)(void *a1, int a2, void *aBlock, void *a4)
{
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;

  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;
  v4[5] = v8;
  v10 = a1;
  a4;
  v11 = (_QWORD *)swift_task_alloc();
  v4[6] = v11;
  *v11 = v4;
  v11[1] = @objc closure #1 in PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:);
  return PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:)((uint64_t)v10, v7, v9);
}

uint64_t @objc closure #1 in PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:)(void *a1)
{
  void *v1;
  uint64_t *v2;
  void *v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;

  v3 = v1;
  v6 = *(void **)(*v2 + 16);
  v5 = *(void **)(*v2 + 24);
  v7 = *v2;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  v8 = *(void (***)(_QWORD, _QWORD, _QWORD))(v7 + 32);
  if (v3)
  {
    v9 = (void *)_convertErrorToNSError(_:)();

    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v9);
    _Block_release(v8);
  }
  else
  {
    ((void (**)(_QWORD, void *, _QWORD))v8)[2](*(_QWORD *)(v7 + 32), a1, 0);
    _Block_release(v8);

  }
  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  return swift_task_switch();
}

uint64_t PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:)()
{
  _QWORD *v0;
  int *v1;
  _QWORD *v2;
  int *v4;

  v1 = *(int **)((*MEMORY[0x1E0DEEDD8] & **(_QWORD **)(v0[7] + OBJC_IVAR___SLPersonIdentityGenerator_keyQueryController))
               + 0xD8);
  v4 = (int *)((char *)v1 + *v1);
  v2 = (_QWORD *)swift_task_alloc();
  v0[8] = v2;
  *v2 = v0;
  v2[1] = PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:);
  return ((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v4)(v0[2], v0[3], v0[4], v0[5], v0[6]);
}

uint64_t PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *v3;
  v7 = swift_task_dealloc();
  if (!v2)
  {
    v7 = a1;
    v8 = a2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
}

uint64_t @objc closure #1 in PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:)(void *a1, int a2, void *a3, void *aBlock, void *a5)
{
  _QWORD *v5;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  id v17;

  v5[2] = a1;
  v5[3] = a5;
  v5[4] = _Block_copy(aBlock);
  v5[5] = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5[6] = v9;
  if (a3)
  {
    v10 = a3;
    v11 = a1;
    v12 = a5;
    v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v15 = v14;

  }
  else
  {
    v16 = a1;
    v17 = a5;
    v13 = 0;
    v15 = 0xF000000000000000;
  }
  v5[7] = v13;
  v5[8] = v15;
  return swift_task_switch();
}

uint64_t @objc closure #1 in PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:)()
{
  _QWORD *v0;
  int *v1;
  _QWORD *v2;
  int *v4;

  v1 = *(int **)((*MEMORY[0x1E0DEEDD8] & **(_QWORD **)(v0[3] + OBJC_IVAR___SLPersonIdentityGenerator_keyQueryController))
               + 0xD8);
  v4 = (int *)((char *)v1 + *v1);
  v2 = (_QWORD *)swift_task_alloc();
  v0[9] = v2;
  *v2 = v0;
  v2[1] = @objc closure #1 in PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:);
  return ((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v4)(v0[2], v0[5], v0[6], v0[7], v0[8]);
}

{
  uint64_t v0;
  void *v1;
  unint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);

  v1 = *(void **)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v4 = *(void **)(v0 + 24);

  outlined consume of Data?(v3, v2);
  swift_bridgeObjectRelease();
  v5 = (void *)_convertErrorToNSError(_:)();

  v6 = *(void (***)(_QWORD, _QWORD, _QWORD))(v0 + 32);
  ((void (**)(_QWORD, _QWORD, void *))v6)[2](v6, 0, v5);

  _Block_release(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t @objc closure #1 in PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  Class isa;
  void (**v12)(_QWORD, _QWORD, _QWORD);

  v6 = *v3;
  *(_QWORD *)(v6 + 80) = v2;
  swift_task_dealloc();
  if (v2)
    return swift_task_switch();
  v9 = *(_QWORD *)(v6 + 56);
  v8 = *(_QWORD *)(v6 + 64);
  v10 = *(void **)(v6 + 24);

  outlined consume of Data?(v9, v8);
  swift_bridgeObjectRelease();
  if (a2 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?(a1, a2);
  }
  v12 = *(void (***)(_QWORD, _QWORD, _QWORD))(v6 + 32);
  ((void (**)(_QWORD, Class, _QWORD))v12)[2](v12, isa, 0);

  _Block_release(v12);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

id PersonIdentityGenerator.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void PersonIdentityGenerator.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id PersonIdentityGenerator.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t Digest.bytes.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = Digest.makeIterator()();
  v2 = specialized _copySequenceToContiguousArray<A>(_:)(v0, v1);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t _sIeghH_IeAgH_TR(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = _sIeghH_IeAgH_TRTQ0_;
  return v6();
}

uint64_t _sIeAgH_ytIeAgHr_TR(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = _sIeghH_IeAgH_TRTQ0_;
  return v7();
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = type metadata accessor for TaskPriority();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  outlined destroy of SymmetricKey??(a1, &demangling cache variable for type metadata for TaskPriority?);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TQ0_;
  return v6(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TQ0_()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

_QWORD *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
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
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

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
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Endpoint>);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4])
          memmove(v12, a4 + 4, 40 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v12 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

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
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Data>);
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
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

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
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<_NSRange>);
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
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, unint64_t a4)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<SHA256Digest>, (uint64_t (*)(_QWORD))MEMORY[0x1E0CA92F8]);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<P256.Signing.PublicKey>, (uint64_t (*)(_QWORD))MEMORY[0x1E0CA9758]);
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(_QWORD *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t _StringGuts._slowEnsureMatchingEncoding(_:)(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = String.UTF16View.index(_:offsetBy:)();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x19AEC3C38](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

{
  uint64_t *v3;
  uint64_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Endpoint>);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8)
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Endpoint);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<NodeIdentity>);
  v10 = *(_QWORD *)(type metadata accessor for NodeIdentity(0) - 8);
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
  v16 = *(_QWORD *)(type metadata accessor for NodeIdentity(0) - 8);
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
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void specialized Data._Representation.withUnsafeMutableBytes<A>(_:)()
{
  __asm { BR              X11 }
}

_QWORD *sub_199F86730@<X0>(uint64_t a1@<X8>)
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

_BYTE *closure #1 in Data.init<A>(_:)@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
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
    result = (_BYTE *)specialized Data.InlineData.init(_:)(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)specialized Data.LargeSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)specialized Data.InlineSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t outlined consume of (keys: [P256.Signing.PublicKey], tps: Data)?(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    return outlined consume of Data._Representation(a2, a3);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SHA256Digest and conformance SHA256Digest()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type SHA256Digest and conformance SHA256Digest;
  if (!lazy protocol witness table cache variable for type SHA256Digest and conformance SHA256Digest)
  {
    v1 = type metadata accessor for SHA256Digest();
    result = MEMORY[0x19AEC4E20](MEMORY[0x1E0CA92F0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SHA256Digest and conformance SHA256Digest);
  }
  return result;
}

_QWORD *_sSw17withMemoryRebound2to_q0_xm_q0_SryxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lFs5UInt8V_s5NeverOs16IndexingIteratorVySS8UTF8ViewVG_SitTgm5(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
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

char *specialized __DataStorage.withUnsafeMutableBytes<A>(in:apply:)(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, char *, char *))
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

  result = (char *)__DataStorage._bytes.getter();
  if (!result)
    goto LABEL_12;
  v8 = result;
  result = (char *)__DataStorage._offset.getter();
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
  v12 = __DataStorage._length.getter();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3)
    return (char *)v14;
  return result;
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, SWPersonIdentity>);
  v38 = a2;
  v6 = static _DictionaryStorage.resize(original:capacity:move:)();
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
    Hasher.init(_seed:)();
    String.hash(into:)();
    result = Hasher._finalize()();
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

unint64_t specialized _NativeDictionary._delete(at:)(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  Swift::Int v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = _HashTable.previousHole(before:)();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        v9 = Hasher._finalize()();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
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
    specialized _NativeDictionary.copy()();
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
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v15, a4 & 1);
  v20 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
}

id specialized _NativeDictionary.copy()()
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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, SWPersonIdentity>);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)();
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

uint64_t specialized closure #1 in closure #3 in Data.init<A>(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  char v3;
  uint64_t v4;

  if (result)
  {
    swift_bridgeObjectRetain();
    result = _StringGuts.copyUTF8(into:)();
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

uint64_t specialized _copySequenceToContiguousArray<A>(_:)(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  size_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  char v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  _QWORD *v12;
  size_t v13;
  unint64_t v14;
  size_t v15;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v2 = *(_QWORD *)(result + 16);
  v3 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  if (v2 != a2)
  {
    if (v2 > a2)
    {
      v5 = a2;
      if (a2 < 0)
      {
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
      if (!v2)
      {
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      v6 = result;
      result = swift_bridgeObjectRetain();
      v4 = 0;
      v7 = v3 + 4;
      while (1)
      {
        v8 = *(_BYTE *)(v6 + v5 + 32);
        if (!v4)
        {
          v9 = v3[3];
          if ((uint64_t)((v9 >> 1) + 0x4000000000000000) < 0)
            goto LABEL_29;
          v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
          if (v10 <= 1)
            v11 = 1;
          else
            v11 = v10;
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
          v12 = (_QWORD *)swift_allocObject();
          v13 = 2 * _swift_stdlib_malloc_size(v12) - 64;
          v12[2] = v11;
          v12[3] = v13;
          v14 = (unint64_t)(v12 + 4);
          v15 = v3[3] >> 1;
          if (v3[2])
          {
            if (v12 != v3 || v14 >= (unint64_t)v3 + v15 + 32)
              memmove(v12 + 4, v3 + 4, v15);
            v3[2] = 0;
          }
          v7 = (_BYTE *)(v14 + v15);
          v4 = (v13 >> 1) - v15;
          result = swift_release();
          v3 = v12;
        }
        v17 = __OFSUB__(v4--, 1);
        if (v17)
          break;
        ++v5;
        *v7++ = v8;
        if (v2 == v5)
        {
          result = swift_bridgeObjectRelease();
          goto LABEL_24;
        }
      }
      __break(1u);
LABEL_29:
      __break(1u);
    }
    __break(1u);
    goto LABEL_31;
  }
  v4 = 0;
LABEL_24:
  v18 = v3[3];
  if (v18 < 2)
    return (uint64_t)v3;
  v19 = v18 >> 1;
  v17 = __OFSUB__(v19, v4);
  v20 = v19 - v4;
  if (!v17)
  {
    v3[2] = v20;
    return (uint64_t)v3;
  }
LABEL_33:
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type [UInt8] and conformance <A> [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [UInt8] and conformance <A> [A];
  if (!lazy protocol witness table cache variable for type [UInt8] and conformance <A> [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [UInt8]);
    result = MEMORY[0x19AEC4E20](MEMORY[0x1E0CB1B08], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [UInt8] and conformance <A> [A]);
  }
  return result;
}

uint64_t specialized Data.InlineData.withUnsafeBytes<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a1;
  v9 = a2;
  v10 = BYTE2(a2);
  v11 = BYTE3(a2);
  v12 = BYTE4(a2);
  v13 = BYTE5(a2);
  closure #1 in static Data.== infix(_:_:)((uint64_t)&v8, (uint64_t)&v8 + BYTE6(a2), a3, a4);
  if (!v4)
    v5 = v7;
  return v5 & 1;
}

uint64_t specialized __DataStorage.withUnsafeBytes<A>(in:apply:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = __DataStorage._bytes.getter();
  v11 = result;
  if (result)
  {
    result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = __DataStorage._length.getter();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  closure #1 in static Data.== infix(_:_:)(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void specialized static Data.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_199F877C0()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_199F877F4 + dword_199F879CC[v0 >> 62]))();
}

uint64_t sub_199F87804@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (v1 == BYTE6(v2))
  {
    if (v1 >= 1)
      __asm { BR              X10 }
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

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
    v5 = a4 + 40 * a1 + 32;
    v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Endpoint);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

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
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized Sequence.compactMap<A>(_:)(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  const __CFData *isa;
  const __CFDictionary *v8;
  SecKeyRef v9;
  uint64_t v10;
  uint64_t v11;

  result = MEMORY[0x1E0DEE9D8];
  v11 = MEMORY[0x1E0DEE9D8];
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    v4 = (unint64_t *)(a1 + 40);
    do
    {
      v6 = *(v4 - 1);
      v5 = *v4;
      outlined copy of Data._Representation(v6, *v4);
      isa = Data._bridgeToObjectiveC()().super.isa;
      v8 = Dictionary._bridgeToObjectiveC()().super.isa;
      v9 = SecKeyCreateWithData(isa, v8, 0);

      v10 = outlined consume of Data._Representation(v6, v5);
      if (v9)
      {
        MEMORY[0x19AEC3C8C](v10);
        if (*(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v11;
  }
  return result;
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(a5(0) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized Data.InlineData.init(_:)(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
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

uint64_t specialized Data.LargeSlice.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  type metadata accessor for __DataStorage();
  swift_allocObject();
  result = __DataStorage.init(bytes:length:)();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for Data.RangeReference();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t specialized Data.InlineSlice.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  type metadata accessor for __DataStorage();
  swift_allocObject();
  result = __DataStorage.init(bytes:length:)();
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

_BYTE *specialized Data._Representation.init(_:)(_BYTE *result, _BYTE *a2)
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
      return (_BYTE *)specialized Data.InlineData.init(_:)(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (_BYTE *)specialized Data.LargeSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (_BYTE *)specialized Data.InlineSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t specialized Data._Representation.init(count:)(uint64_t result)
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
      type metadata accessor for __DataStorage();
      swift_allocObject();
      __DataStorage.init(length:)();
      if (v1 >= 0x7FFFFFFF)
      {
        type metadata accessor for Data.RangeReference();
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

uint64_t specialized Data.init<A>(_:)(uint64_t a1)
{
  _QWORD *v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  unint64_t v10;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt8]);
  v10 = lazy protocol witness table accessor for type [UInt8] and conformance <A> [A]();
  v8[0] = a1;
  v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  v3 = (_BYTE *)(*v2 + 32);
  v4 = &v3[*(_QWORD *)(*v2 + 16)];
  swift_bridgeObjectRetain();
  closure #1 in Data.init<A>(_:)(v3, v4, &v7);
  v5 = v7;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  return v5;
}

uint64_t specialized PersonIdentityGenerator.merkleTreeForPublicKeys(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t);
  unint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = type metadata accessor for P256.Signing.PublicKey();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for NodeIdentity(0);
  v6 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a1 + 16);
  v10 = MEMORY[0x1E0DEE9D8];
  if (v9)
  {
    v19 = MEMORY[0x1E0DEE9D8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v9, 0);
    v11 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v16 = *(_QWORD *)(v3 + 72);
    v17 = v3;
    v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    do
    {
      v12(v5, v11, v2);
      v12(v8, (uint64_t)v5, v2);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      v10 = v19;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v10 + 16) + 1, 1);
        v10 = v19;
      }
      v14 = *(_QWORD *)(v10 + 16);
      v13 = *(_QWORD *)(v10 + 24);
      if (v14 >= v13 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v13 > 1, v14 + 1, 1);
        v10 = v19;
      }
      *(_QWORD *)(v10 + 16) = v14 + 1;
      outlined init with take of NodeIdentity((uint64_t)v8, v10+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v14);
      v3 = v17;
      v11 += v16;
      --v9;
    }
    while (v9);
  }
  type metadata accessor for MerkleTree();
  swift_allocObject();
  return MerkleTree.init(nodeIdentities:)(v10);
}

unint64_t lazy protocol witness table accessor for type PersonIdentityGenerator.GenerationErrors and conformance PersonIdentityGenerator.GenerationErrors()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type PersonIdentityGenerator.GenerationErrors and conformance PersonIdentityGenerator.GenerationErrors;
  if (!lazy protocol witness table cache variable for type PersonIdentityGenerator.GenerationErrors and conformance PersonIdentityGenerator.GenerationErrors)
  {
    result = MEMORY[0x19AEC4E20](&protocol conformance descriptor for PersonIdentityGenerator.GenerationErrors, &type metadata for PersonIdentityGenerator.GenerationErrors);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PersonIdentityGenerator.GenerationErrors and conformance PersonIdentityGenerator.GenerationErrors);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type PersonIdentityGenerator.GenerationErrors and conformance PersonIdentityGenerator.GenerationErrors;
  if (!lazy protocol witness table cache variable for type PersonIdentityGenerator.GenerationErrors and conformance PersonIdentityGenerator.GenerationErrors)
  {
    result = MEMORY[0x19AEC4E20](&protocol conformance descriptor for PersonIdentityGenerator.GenerationErrors, &type metadata for PersonIdentityGenerator.GenerationErrors);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PersonIdentityGenerator.GenerationErrors and conformance PersonIdentityGenerator.GenerationErrors);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PersonIdentityGenerator.GenerationErrors(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PersonIdentityGenerator.GenerationErrors(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_199F885F0 + 4 * byte_199FA8915[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_199F88624 + 4 * byte_199FA8910[v4]))();
}

uint64_t sub_199F88624(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_199F8862C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x199F88634);
  return result;
}

uint64_t sub_199F88640(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x199F88648);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_199F8864C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_199F88654(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *destructiveInjectEnumTag for PersonIdentityGenerator.GenerationErrors(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PersonIdentityGenerator.GenerationErrors()
{
  return &type metadata for PersonIdentityGenerator.GenerationErrors;
}

uint64_t type metadata accessor for PersonIdentityGenerator()
{
  return objc_opt_self();
}

uint64_t method lookup function for PersonIdentityGenerator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PersonIdentityGenerator.__allocating_init(queue:keyQueryController:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_199F886B0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 40));
  return swift_deallocObject();
}

uint64_t partial apply for @objc closure #1 in PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:)()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;

  v2 = (void *)v0[2];
  v3 = v0[3];
  v4 = (void *)v0[4];
  v5 = (void *)v0[5];
  v6 = (void *)v0[6];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = _sIeghH_IeAgH_TRTQ0_;
  return ((uint64_t (*)(void *, int, void *, void *, void *))((char *)&async function pointer to @objc closure #1 in PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:)
                                                                      + async function pointer to @objc closure #1 in PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:)))(v2, v3, v4, v5, v6);
}

uint64_t _sIeghH_IeAgH_TRTA()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = _sIeghH_IeAgH_TRTQ0_;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&_sIeghH_IeAgH_TRTu + _sIeghH_IeAgH_TRTu))(v2, v3, v4);
}

uint64_t _sIeAgH_ytIeAgHr_TRTA(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = _sIeghH_IeAgH_TRTQ0_;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&_sIeAgH_ytIeAgHr_TRTu
                                                                   + _sIeAgH_ytIeAgHr_TRTu))(a1, v4, v5, v6);
}

uint64_t sub_199F88878()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TA(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = dispatch thunk of KeyQueryController.localPublicKey();
  return ((uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5Tu
                                                 + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5Tu))(a1, v4);
}

uint64_t partial apply for @objc closure #1 in PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:)()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  v2 = (void *)v0[2];
  v3 = v0[3];
  v5 = (void *)v0[4];
  v4 = (void *)v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = _sIeghH_IeAgH_TRTQ0_;
  return ((uint64_t (*)(void *, int, void *, void *))((char *)&async function pointer to @objc closure #1 in PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:)
                                                              + async function pointer to @objc closure #1 in PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:)))(v2, v3, v5, v4);
}

uint64_t sub_199F88990()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t partial apply for @objc closure #1 in PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = dispatch thunk of KeyQueryController.localPublicKey();
  return ((uint64_t (*)(int, void *, void *))((char *)&async function pointer to @objc closure #1 in PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:)
                                                      + async function pointer to @objc closure #1 in PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:)))(v2, v3, v4);
}

uint64_t objectdestroy_29Tm()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t partial apply for @objc closure #1 in PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  v2 = v0[2];
  v3 = v0[3];
  v5 = (void *)v0[4];
  v4 = (void *)v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = _sIeghH_IeAgH_TRTQ0_;
  return ((uint64_t (*)(int, int, void *, void *))((char *)&async function pointer to @objc closure #1 in PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:)
                                                           + async function pointer to @objc closure #1 in PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:)))(v2, v3, v5, v4);
}

uint64_t objectdestroy_13Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

char *specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 16 * a1 + 32);
    v6 = 16 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

_QWORD *partial apply for specialized closure #3 in Data.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
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
  result = _sSw17withMemoryRebound2to_q0_xm_q0_SryxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lFs5UInt8V_s5NeverOs16IndexingIteratorVySS8UTF8ViewVG_SitTgm5((_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))partial apply for specialized closure #1 in closure #3 in Data.init<A>(_:), (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t partial apply for specialized closure #1 in closure #3 in Data.init<A>(_:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return specialized closure #1 in closure #3 in Data.init<A>(_:)(a1, a2);
}

void GenericPasswordStore.storeKey<A>(_:account:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t inited;
  uint64_t v9;
  uint64_t countAndFlagsBits;
  void *object;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  const __CFDictionary *isa;
  OSStatus v28;
  CFStringRef v29;
  __CFString *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  Swift::String v35;
  _QWORD *v36;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_199FA8480;
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 40) = v9;
  if (one-time initialization token for KeychainAccessGroup != -1)
    swift_once();
  countAndFlagsBits = KeychainAccessGroup._countAndFlagsBits;
  object = KeychainAccessGroup._object;
  v12 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 48) = countAndFlagsBits;
  *(_QWORD *)(inited + 56) = object;
  *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 88) = v13;
  v14 = (void *)*MEMORY[0x1E0CD6CA8];
  type metadata accessor for CFStringRef(0);
  v16 = v15;
  *(_QWORD *)(inited + 120) = v15;
  *(_QWORD *)(inited + 96) = v14;
  *(_QWORD *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 136) = v17;
  *(_QWORD *)(inited + 168) = v12;
  *(_QWORD *)(inited + 144) = a2;
  *(_QWORD *)(inited + 152) = a3;
  *(_QWORD *)(inited + 176) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 184) = v18;
  v19 = (void *)*MEMORY[0x1E0CD68A8];
  *(_QWORD *)(inited + 216) = v16;
  *(_QWORD *)(inited + 192) = v19;
  *(_QWORD *)(inited + 224) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 232) = v20;
  *(_QWORD *)(inited + 264) = MEMORY[0x1E0DEAFA0];
  *(_BYTE *)(inited + 240) = 1;
  *(_QWORD *)(inited + 272) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 280) = v21;
  v22 = *(uint64_t (**)(uint64_t, uint64_t))(a5 + 24);
  swift_bridgeObjectRetain();
  v23 = v14;
  swift_bridgeObjectRetain();
  v24 = v19;
  v25 = v22(a4, a5);
  *(_QWORD *)(inited + 312) = MEMORY[0x1E0CB0338];
  *(_QWORD *)(inited + 288) = v25;
  *(_QWORD *)(inited + 296) = v26;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v28 = SecItemAdd(isa, 0);

  if (v28)
  {
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    v29 = SecCopyErrorMessageString(v28, 0);
    if (v29)
    {
      v30 = (__CFString *)v29;
      v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v33 = v32;

    }
    else
    {
      v31 = dispatch thunk of CustomStringConvertible.description.getter();
      v33 = v34;
    }
    v35._countAndFlagsBits = v31;
    v35._object = v33;
    String.append(_:)(v35);
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type GenericPasswordStoreError and conformance GenericPasswordStoreError();
    swift_allocError();
    *v36 = 0xD000000000000016;
    v36[1] = 0x8000000199FB0840;
    swift_willThrow();
  }
}

uint64_t GenericPasswordStore.readKey<A>(account:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t inited;
  uint64_t v10;
  uint64_t countAndFlagsBits;
  void *object;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  const __CFDictionary *isa;
  OSStatus v23;
  CFStringRef v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  Swift::String v30;
  _OWORD *v31;
  __int128 v35;
  CFTypeRef result[37];

  result[35] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_199FA8470;
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 40) = v10;
  if (one-time initialization token for KeychainAccessGroup != -1)
    swift_once();
  countAndFlagsBits = KeychainAccessGroup._countAndFlagsBits;
  object = KeychainAccessGroup._object;
  v13 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 48) = countAndFlagsBits;
  *(_QWORD *)(inited + 56) = object;
  *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 88) = v14;
  v15 = (void *)*MEMORY[0x1E0CD6CA8];
  type metadata accessor for CFStringRef(0);
  *(_QWORD *)(inited + 120) = v16;
  *(_QWORD *)(inited + 96) = v15;
  *(_QWORD *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 136) = v17;
  *(_QWORD *)(inited + 168) = v13;
  *(_QWORD *)(inited + 144) = a1;
  *(_QWORD *)(inited + 152) = a2;
  *(_QWORD *)(inited + 176) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 184) = v18;
  v19 = MEMORY[0x1E0DEAFA0];
  *(_QWORD *)(inited + 216) = MEMORY[0x1E0DEAFA0];
  *(_BYTE *)(inited + 192) = 1;
  *(_QWORD *)(inited + 224) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 232) = v20;
  *(_QWORD *)(inited + 264) = v19;
  *(_BYTE *)(inited + 240) = 1;
  swift_bridgeObjectRetain();
  v21 = v15;
  swift_bridgeObjectRetain();
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  result[0] = 0;
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v23 = SecItemCopyMatching(isa, result);

  if (v23 == -25300)
    goto LABEL_9;
  if (!v23)
  {
    if (result[0])
    {
      swift_unknownObjectRetain();
      if ((swift_dynamicCast() & 1) != 0)
      {
        (*(void (**)(__int128 *, _QWORD, _QWORD, uint64_t))(a4 + 16))(&v35, MEMORY[0x1E0CB0338], MEMORY[0x1E0CB0318], a3);
        if (!v5)
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(a5, 0, 1, a3);
        return swift_unknownObjectRelease();
      }
    }
LABEL_9:
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(a5, 1, 1, a3);
    return swift_unknownObjectRelease();
  }
  _StringGuts.grow(_:)(24);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v35 = 0xD000000000000016;
  *((_QWORD *)&v35 + 1) = 0x8000000199FB0860;
  v24 = SecCopyErrorMessageString(v23, 0);
  if (v24)
  {
    v25 = (__CFString *)v24;
    v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v28 = v27;

  }
  else
  {
    v26 = dispatch thunk of CustomStringConvertible.description.getter();
    v28 = v29;
  }
  v30._countAndFlagsBits = v26;
  v30._object = v28;
  String.append(_:)(v30);
  swift_bridgeObjectRelease();
  lazy protocol witness table accessor for type GenericPasswordStoreError and conformance GenericPasswordStoreError();
  swift_allocError();
  *v31 = v35;
  swift_willThrow();
  return swift_unknownObjectRelease();
}

void one-time initialization function for KeychainAccessGroup()
{
  strcpy((char *)&KeychainAccessGroup, "sociallayerd");
  BYTE5(KeychainAccessGroup._object) = 0;
  HIWORD(KeychainAccessGroup._object) = -5120;
}

Swift::String *KeychainAccessGroup.unsafeMutableAddressor()
{
  if (one-time initialization token for KeychainAccessGroup != -1)
    swift_once();
  return &KeychainAccessGroup;
}

uint64_t GenericPasswordStoreError.message.getter(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t GenericPasswordStoreError.message.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*GenericPasswordStoreError.message.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t GenericPasswordStoreError.description.getter(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t Int32.message.getter(OSStatus a1)
{
  CFStringRef v1;
  __CFString *v2;
  uint64_t v3;

  v1 = SecCopyErrorMessageString(a1, 0);
  if (!v1)
    return dispatch thunk of CustomStringConvertible.description.getter();
  v2 = (__CFString *)v1;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> GenericPasswordStore.deleteKey(account:)(Swift::String account)
{
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t inited;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const __CFDictionary *isa;
  OSStatus v11;
  CFStringRef v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  Swift::String v18;
  _QWORD *v19;

  object = account._object;
  countAndFlagsBits = account._countAndFlagsBits;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_199FA7E70;
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 40) = v4;
  v5 = (void *)*MEMORY[0x1E0CD6CA8];
  type metadata accessor for CFStringRef(0);
  *(_QWORD *)(inited + 72) = v6;
  *(_QWORD *)(inited + 48) = v5;
  *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 88) = v7;
  *(_QWORD *)(inited + 120) = MEMORY[0x1E0DEAFA0];
  *(_BYTE *)(inited + 96) = 1;
  *(_QWORD *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 136) = v8;
  *(_QWORD *)(inited + 168) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 144) = countAndFlagsBits;
  *(_QWORD *)(inited + 152) = object;
  v9 = v5;
  swift_bridgeObjectRetain();
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v11 = SecItemDelete(isa);

  if (v11 != -25300 && v11)
  {
    _StringGuts.grow(_:)(29);
    swift_bridgeObjectRelease();
    v12 = SecCopyErrorMessageString(v11, 0);
    if (v12)
    {
      v13 = (__CFString *)v12;
      v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v16 = v15;

    }
    else
    {
      v14 = dispatch thunk of CustomStringConvertible.description.getter();
      v16 = v17;
    }
    v18._countAndFlagsBits = v14;
    v18._object = v16;
    String.append(_:)(v18);
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type GenericPasswordStoreError and conformance GenericPasswordStoreError();
    swift_allocError();
    *v19 = 0xD00000000000001BLL;
    v19[1] = 0x8000000199FB0CC0;
    swift_willThrow();
  }
}

ValueMetadata *type metadata accessor for GenericPasswordStoreError()
{
  return &type metadata for GenericPasswordStoreError;
}

ValueMetadata *type metadata accessor for GenericPasswordStore()
{
  return &type metadata for GenericPasswordStore;
}

uint64_t SLLocString(key:localization:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v8;

  v2 = type metadata accessor for Locale();
  MEMORY[0x1E0C80A78](v2);
  v3 = type metadata accessor for String.LocalizationValue();
  MEMORY[0x1E0C80A78](v3);
  (*(void (**)(char *, uint64_t))(v5 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  v6 = SLFrameworkBundle();
  swift_bridgeObjectRetain();
  static Locale.current.getter();
  return String.init(localized:table:bundle:localization:locale:comment:)();
}

BOOL static AttributionTextPrefix.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void AttributionTextPrefix.hash(into:)(uint64_t a1, char a2)
{
  Hasher._combine(_:)(a2 & 1);
}

Swift::Int AttributionTextPrefix.hashValue.getter(char a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1 & 1);
  return Hasher._finalize()();
}

void *HighlightPillSenderNameAttribute.name.unsafeMutableAddressor()
{
  return &static HighlightPillSenderNameAttribute.name;
}

unint64_t static HighlightPillSenderNameAttribute.name.getter()
{
  return 0xD000000000000017;
}

uint64_t protocol witness for static DecodableAttributedStringKey.decode(from:) in conformance HighlightPillSenderNameAttribute()
{
  return static DecodableAttributedStringKey<>.decode(from:)();
}

uint64_t protocol witness for static EncodableAttributedStringKey.encode(_:to:) in conformance HighlightPillSenderNameAttribute()
{
  return static EncodableAttributedStringKey<>.encode(_:to:)();
}

uint64_t protocol witness for static MarkdownDecodableAttributedStringKey.decodeMarkdown(from:) in conformance HighlightPillSenderNameAttribute()
{
  lazy protocol witness table accessor for type HighlightPillSenderNameAttribute and conformance HighlightPillSenderNameAttribute();
  return static MarkdownDecodableAttributedStringKey<>.decodeMarkdown(from:)();
}

unint64_t protocol witness for static AttributedStringKey.name.getter in conformance HighlightPillSenderNameAttribute()
{
  return 0xD000000000000017;
}

void *HighlightPillNumContactsAttribute.name.unsafeMutableAddressor()
{
  return &static HighlightPillNumContactsAttribute.name;
}

unint64_t static HighlightPillNumContactsAttribute.name.getter()
{
  return 0xD000000000000018;
}

uint64_t protocol witness for static MarkdownDecodableAttributedStringKey.decodeMarkdown(from:) in conformance HighlightPillNumContactsAttribute()
{
  lazy protocol witness table accessor for type HighlightPillNumContactsAttribute and conformance HighlightPillNumContactsAttribute();
  return static MarkdownDecodableAttributedStringKey<>.decodeMarkdown(from:)();
}

unint64_t protocol witness for static AttributedStringKey.name.getter in conformance HighlightPillNumContactsAttribute()
{
  return 0xD000000000000018;
}

void *HighlightPillListOfNamesAttribute.name.unsafeMutableAddressor()
{
  return &static HighlightPillListOfNamesAttribute.name;
}

unint64_t static HighlightPillListOfNamesAttribute.name.getter()
{
  return 0xD000000000000022;
}

uint64_t protocol witness for static MarkdownDecodableAttributedStringKey.decodeMarkdown(from:) in conformance HighlightPillListOfNamesAttribute()
{
  lazy protocol witness table accessor for type HighlightPillListOfNamesAttribute and conformance HighlightPillListOfNamesAttribute();
  return static MarkdownDecodableAttributedStringKey<>.decodeMarkdown(from:)();
}

unint64_t protocol witness for static AttributedStringKey.name.getter in conformance HighlightPillListOfNamesAttribute()
{
  return 0xD000000000000022;
}

uint64_t one-time initialization function for senderName()
{
  uint64_t result;

  result = MEMORY[0x19AEC3B6C](0xD000000000000017, 0x8000000199FB0CE0);
  static NSAttributedStringKey.senderName = result;
  return result;
}

uint64_t *NSAttributedStringKey.senderName.unsafeMutableAddressor()
{
  if (one-time initialization token for senderName != -1)
    swift_once();
  return &static NSAttributedStringKey.senderName;
}

id static NSAttributedStringKey.senderName.getter()
{
  return static NSAttributedStringKey.senderName.getter(&one-time initialization token for senderName, (id *)&static NSAttributedStringKey.senderName);
}

uint64_t one-time initialization function for numContacts()
{
  uint64_t result;

  result = MEMORY[0x19AEC3B6C](0xD000000000000018, 0x8000000199FB0D00);
  static NSAttributedStringKey.numContacts = result;
  return result;
}

uint64_t *NSAttributedStringKey.numContacts.unsafeMutableAddressor()
{
  if (one-time initialization token for numContacts != -1)
    swift_once();
  return &static NSAttributedStringKey.numContacts;
}

id static NSAttributedStringKey.numContacts.getter()
{
  return static NSAttributedStringKey.senderName.getter(&one-time initialization token for numContacts, (id *)&static NSAttributedStringKey.numContacts);
}

uint64_t one-time initialization function for listOfNames()
{
  uint64_t result;

  result = MEMORY[0x19AEC3B6C](0xD000000000000022, 0x8000000199FB0D20);
  static NSAttributedStringKey.listOfNames = result;
  return result;
}

uint64_t *NSAttributedStringKey.listOfNames.unsafeMutableAddressor()
{
  if (one-time initialization token for listOfNames != -1)
    swift_once();
  return &static NSAttributedStringKey.listOfNames;
}

id static NSAttributedStringKey.listOfNames.getter()
{
  return static NSAttributedStringKey.senderName.getter(&one-time initialization token for listOfNames, (id *)&static NSAttributedStringKey.listOfNames);
}

id static NSAttributedStringKey.senderName.getter(_QWORD *a1, id *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

uint64_t AttributeScopes.HighlightPillAttributes.foundation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for AttributeScopes.FoundationAttributes();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

void protocol witness for static DecodingConfigurationProviding.decodingConfiguration.getter in conformance AttributeScopes.HighlightPillAttributes()
{
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type AttributeScopes.HighlightPillAttributes and conformance AttributeScopes.HighlightPillAttributes, (uint64_t (*)(uint64_t))type metadata accessor for AttributeScopes.HighlightPillAttributes, (uint64_t)&protocol conformance descriptor for AttributeScopes.HighlightPillAttributes);
  JUMPOUT(0x19AEC3704);
}

void protocol witness for static EncodingConfigurationProviding.encodingConfiguration.getter in conformance AttributeScopes.HighlightPillAttributes()
{
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type AttributeScopes.HighlightPillAttributes and conformance AttributeScopes.HighlightPillAttributes, (uint64_t (*)(uint64_t))type metadata accessor for AttributeScopes.HighlightPillAttributes, (uint64_t)&protocol conformance descriptor for AttributeScopes.HighlightPillAttributes);
  JUMPOUT(0x19AEC3710);
}

uint64_t SLLocAttributedString(key:localization:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v14[4];

  v14[1] = a2;
  v3 = type metadata accessor for AttributedString.FormattingOptions();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEF88];
  MEMORY[0x1E0C80A78](v3);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for String.LocalizationValue();
  MEMORY[0x1E0C80A78](v8);
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  v11 = SLFrameworkBundle();
  v12 = type metadata accessor for Locale();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v7, 1, 1, v12);
  swift_getKeyPath();
  v14[3] = MEMORY[0x1E0DEE9D8];
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type AttributedString.FormattingOptions and conformance AttributedString.FormattingOptions, v4, MEMORY[0x1E0CAEF98]);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AttributedString.FormattingOptions]);
  lazy protocol witness table accessor for type [AttributedString.FormattingOptions] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  type metadata accessor for AttributeScopes.HighlightPillAttributes();
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type AttributeScopes.HighlightPillAttributes and conformance AttributeScopes.HighlightPillAttributes, (uint64_t (*)(uint64_t))type metadata accessor for AttributeScopes.HighlightPillAttributes, (uint64_t)&protocol conformance descriptor for AttributeScopes.HighlightPillAttributes);
  return AttributedString.init<A>(localized:options:table:bundle:localization:locale:comment:including:)();
}

uint64_t sub_199F89F9C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = type metadata accessor for AttributeScopes.HighlightPillAttributes();
  *a1 = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type [AttributedString.FormattingOptions] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [AttributedString.FormattingOptions] and conformance [A];
  if (!lazy protocol witness table cache variable for type [AttributedString.FormattingOptions] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [AttributedString.FormattingOptions]);
    result = MEMORY[0x19AEC4E20](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [AttributedString.FormattingOptions] and conformance [A]);
  }
  return result;
}

uint64_t type metadata accessor for AttributeScopes.HighlightPillAttributes()
{
  uint64_t result;

  result = type metadata singleton initialization cache for AttributeScopes.HighlightPillAttributes;
  if (!type metadata singleton initialization cache for AttributeScopes.HighlightPillAttributes)
    return swift_getSingletonMetadata();
  return result;
}

Swift::tuple_localizedString_NSMutableAttributedString_baseFontTargetRanges_OpaquePointer_senderFontTargetRanges_OpaquePointer __swiftcall MeAttributionLocAttributedString(prefix:multiline:localization:)(SocialLayer::AttributionTextPrefix prefix, Swift::Bool multiline, Swift::String_optional localization)
{
  uint64_t countAndFlagsBits;
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD aBlock[6];
  void *v36;
  void *v37;
  Swift::tuple_localizedString_NSMutableAttributedString_baseFontTargetRanges_OpaquePointer_senderFontTargetRanges_OpaquePointer result;

  countAndFlagsBits = localization.value._countAndFlagsBits;
  v4 = type metadata accessor for String.LocalizationValue();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for AttributedString();
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&aBlock[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&aBlock[-1] - v13;
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&aBlock[-1] - v15;
  v18 = v17;
  v20 = v19;
  String.LocalizationValue.init(stringLiteral:)();
  SLLocAttributedString(key:localization:)((uint64_t)v7, countAndFlagsBits);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v21 = (id)type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSMutableAttributedString);
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v14, v16, v20);
  swift_getKeyPath();
  type metadata accessor for AttributeScopes.HighlightPillAttributes();
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type AttributeScopes.HighlightPillAttributes and conformance AttributeScopes.HighlightPillAttributes, (uint64_t (*)(uint64_t))type metadata accessor for AttributeScopes.HighlightPillAttributes, (uint64_t)&protocol conformance descriptor for AttributeScopes.HighlightPillAttributes);
  v22 = (void *)NSAttributedString.init<A>(_:including:)();
  v23 = (unint64_t)objc_msgSend(v22, sel_length);
  if ((v23 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v11 = (char *)v23;
    v36 = (void *)MEMORY[0x1E0DEE9D8];
    v37 = (void *)MEMORY[0x1E0DEE9D8];
    v24 = one-time initialization token for senderName;
    v21 = v22;
    if (v24 == -1)
      goto LABEL_3;
  }
  swift_once();
LABEL_3:
  v25 = static NSAttributedStringKey.senderName;
  v26 = swift_allocObject();
  *(_QWORD *)(v26 + 16) = &v36;
  *(_QWORD *)(v26 + 24) = &v37;
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = partial apply for closure #1 in MeAttributionLocAttributedString(prefix:multiline:localization:);
  *(_QWORD *)(v27 + 24) = v26;
  aBlock[4] = partial apply for thunk for @escaping @callee_guaranteed () -> (@out ());
  aBlock[5] = v27;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@in_guaranteed Any?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  aBlock[3] = &block_descriptor_1;
  v28 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v21, sel_enumerateAttribute_inRange_options_usingBlock_, v25, 0, v11, 0, v28);
  _Block_release(v28);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v16, v20);
  LOBYTE(v28) = swift_isEscapingClosureAtFileLocation();
  v29 = (objc_class *)swift_release();
  if ((v28 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v33 = v36;
    v32 = v37;
    swift_release();
    v29 = (objc_class *)v21;
    v30 = v32;
    v31 = v33;
  }
  result.senderFontTargetRanges._rawValue = v31;
  result.baseFontTargetRanges._rawValue = v30;
  result.localizedString.super.super.isa = v29;
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed Any?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v9)(__int128 *, uint64_t, uint64_t, uint64_t);
  __int128 v11;
  __int128 v12;

  v9 = *(void (**)(__int128 *, uint64_t, uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    *((_QWORD *)&v12 + 1) = swift_getObjectType();
    *(_QWORD *)&v11 = a2;
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
  }
  swift_unknownObjectRetain();
  v9(&v11, a3, a4, a5);
  return outlined destroy of Any?((uint64_t)&v11);
}

Swift::tuple_localizedString_NSMutableAttributedString_baseFontTargetRanges_OpaquePointer_senderFontTargetRanges_OpaquePointer __swiftcall NameAttributionLocAttributedString(prefix:name:multiline:localization:)(SocialLayer::AttributionTextPrefix prefix, Swift::String name, Swift::Bool multiline, Swift::String_optional localization)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  Swift::String v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  char isEscapingClosureAtFileLocation;
  objc_class *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[2];
  Swift::String v42;
  uint64_t v43;
  uint64_t v44;
  Swift::String_optional v45;
  uint64_t v46;
  _QWORD aBlock[6];
  void *v48;
  void *v49;
  Swift::tuple_localizedString_NSMutableAttributedString_baseFontTargetRanges_OpaquePointer_senderFontTargetRanges_OpaquePointer result;

  v45 = localization;
  v42 = name;
  v6 = type metadata accessor for String.LocalizationValue();
  v43 = *(_QWORD *)(v6 - 8);
  v44 = v6;
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue.StringInterpolation();
  v10 = MEMORY[0x1E0C80A78](v9);
  v11 = MEMORY[0x1E0C80A78](v10);
  v12 = MEMORY[0x1E0C80A78](v11);
  MEMORY[0x1E0C80A78](v12);
  v46 = type metadata accessor for AttributedString();
  v13 = *(_QWORD *)(v46 - 8);
  v14 = MEMORY[0x1E0C80A78](v46);
  v41[1] = (char *)v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x1E0C80A78](v14);
  v18 = (char *)v41 - v17;
  MEMORY[0x1E0C80A78](v16);
  v20 = (char *)v41 - v19;
  if ((prefix & 1) != 0)
  {
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
    if (multiline)
    {
      v21 = 0x3E72623C68746957;
      v22 = 0xEA00000000005B5ELL;
    }
    else
    {
      v21 = 0x5B5E2068746957;
      v22 = 0xE700000000000000;
    }
  }
  else
  {
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
    if (multiline)
    {
      v21 = 0x3E72623C6D6F7246;
      v22 = 0xEA00000000005B5ELL;
    }
    else
    {
      v21 = 0x5B5E206D6F7246;
      v22 = 0xE700000000000000;
    }
  }
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v21);
  v23 = v13;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v42);
  v24._object = (void *)0x8000000199FB0E30;
  v24._countAndFlagsBits = 0xD000000000000020;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v24);
  String.LocalizationValue.init(stringInterpolation:)();
  SLLocAttributedString(key:localization:)((uint64_t)v8, v45.value._countAndFlagsBits);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v8, v44);
  v25 = (id)type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSMutableAttributedString);
  v26 = v46;
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v18, v20, v46);
  swift_getKeyPath();
  v27 = type metadata accessor for AttributeScopes.HighlightPillAttributes();
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type AttributeScopes.HighlightPillAttributes and conformance AttributeScopes.HighlightPillAttributes, (uint64_t (*)(uint64_t))type metadata accessor for AttributeScopes.HighlightPillAttributes, (uint64_t)&protocol conformance descriptor for AttributeScopes.HighlightPillAttributes);
  v28 = (void *)NSAttributedString.init<A>(_:including:)();
  v29 = (uint64_t)objc_msgSend(v28, sel_length);
  if (v29 < 0)
  {
    __break(1u);
  }
  else
  {
    v27 = v29;
    v48 = (void *)MEMORY[0x1E0DEE9D8];
    v49 = (void *)MEMORY[0x1E0DEE9D8];
    v30 = one-time initialization token for senderName;
    v25 = v28;
    if (v30 == -1)
      goto LABEL_10;
  }
  swift_once();
LABEL_10:
  v31 = static NSAttributedStringKey.senderName;
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = &v48;
  *(_QWORD *)(v32 + 24) = &v49;
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = partial apply for closure #1 in NameAttributionLocAttributedString(prefix:name:multiline:localization:);
  *(_QWORD *)(v33 + 24) = v32;
  aBlock[4] = thunk for @callee_guaranteed (@in_guaranteed Any?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ()partial apply;
  aBlock[5] = v33;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@in_guaranteed Any?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  aBlock[3] = &block_descriptor_13;
  v34 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v25, sel_enumerateAttribute_inRange_options_usingBlock_, v31, 0, v27, 0, v34);
  _Block_release(v34);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v26);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  v36 = (objc_class *)swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v40 = v48;
    v39 = v49;
    swift_release();
    v36 = (objc_class *)v25;
    v37 = v39;
    v38 = v40;
  }
  result.senderFontTargetRanges._rawValue = v38;
  result.baseFontTargetRanges._rawValue = v37;
  result.localizedString.super.super.isa = v36;
  return result;
}

Swift::tuple_localizedString_NSMutableAttributedString_baseFontTargetRanges_OpaquePointer_senderFontTargetRanges_OpaquePointer __swiftcall NumContactsAttributionLocAttributedString(prefix:numContacts:multiline:localization:)(SocialLayer::AttributionTextPrefix prefix, Swift::Int numContacts, Swift::Bool multiline, Swift::String_optional localization)
{
  void *object;
  uint64_t countAndFlagsBits;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  id v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  unsigned int v38;
  uint64_t v39;
  unint64_t v40;
  unsigned int v41;
  uint64_t v42;
  char *v43;
  Swift::String v44;
  Swift::String v45;
  id v46;
  uint64_t v47;
  unint64_t v48;
  void *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  char isEscapingClosureAtFileLocation;
  objc_class *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[5];
  Swift::Int v63;
  int v64;
  _BOOL4 v65;
  char *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  _QWORD aBlock[6];
  void *v73;
  void *v74;
  Swift::tuple_localizedString_NSMutableAttributedString_baseFontTargetRanges_OpaquePointer_senderFontTargetRanges_OpaquePointer result;

  object = localization.value._object;
  countAndFlagsBits = localization.value._countAndFlagsBits;
  v64 = prefix;
  v65 = multiline;
  v63 = numContacts;
  v6 = type metadata accessor for String.LocalizationValue.StringInterpolation();
  v7 = MEMORY[0x1E0C80A78](v6);
  v62[3] = (char *)v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v7);
  v62[2] = (char *)v62 - v10;
  v11 = MEMORY[0x1E0C80A78](v9);
  v62[1] = (char *)v62 - v12;
  MEMORY[0x1E0C80A78](v11);
  v13 = type metadata accessor for AttributedString();
  v69 = *(_QWORD *)(v13 - 8);
  v70 = v13;
  v14 = MEMORY[0x1E0C80A78](v13);
  v62[4] = (char *)v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x1E0C80A78](v14);
  v66 = (char *)v62 - v17;
  MEMORY[0x1E0C80A78](v16);
  v71 = (char *)v62 - v18;
  v19 = type metadata accessor for Locale();
  MEMORY[0x1E0C80A78](v19);
  v20 = type metadata accessor for String.LocalizationValue();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x1E0C80A78](v20);
  v24 = (char *)v62 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x1E0C80A78](v22);
  v27 = (char *)v62 - v26;
  MEMORY[0x1E0C80A78](v25);
  v29 = (char *)v62 - v28;
  String.LocalizationValue.init(stringLiteral:)();
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v27, v29, v20);
  v30 = SLFrameworkBundle();
  swift_bridgeObjectRetain();
  static Locale.current.getter();
  v67 = countAndFlagsBits;
  v68 = object;
  String.init(localized:table:bundle:localization:locale:comment:)();
  v31 = *(void (**)(char *, uint64_t))(v21 + 8);
  v31(v29, v20);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  v32 = swift_allocObject();
  v33 = MEMORY[0x1E0DEB418];
  *(_OWORD *)(v32 + 16) = xmmword_199FA7E60;
  v34 = MEMORY[0x1E0DEB490];
  *(_QWORD *)(v32 + 56) = v33;
  *(_QWORD *)(v32 + 64) = v34;
  *(_QWORD *)(v32 + 32) = v63;
  v35 = static String.localizedStringWithFormat(_:_:)();
  v37 = v36;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v64 & 1) != 0)
  {
    if (v65)
    {
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v38 = 1752459607;
      goto LABEL_6;
    }
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
    v41 = 1752459607;
  }
  else
  {
    if (v65)
    {
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v38 = 1836020294;
LABEL_6:
      v39 = v38 | 0x3E72623C00000000;
      v40 = 0xEA00000000005B5ELL;
      goto LABEL_10;
    }
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
    v41 = 1836020294;
  }
  v39 = v41 | 0x5B5E2000000000;
  v40 = 0xE700000000000000;
LABEL_10:
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v39);
  v42 = v69;
  v43 = v71;
  v44._countAndFlagsBits = v35;
  v44._object = v37;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v44);
  swift_bridgeObjectRelease();
  v45._countAndFlagsBits = 0xD000000000000021;
  v45._object = (void *)0x8000000199FB0E60;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v45);
  String.LocalizationValue.init(stringInterpolation:)();
  SLLocAttributedString(key:localization:)((uint64_t)v24, v67);
  v31(v24, v20);
  v46 = (id)type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSMutableAttributedString);
  v47 = v70;
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v66, v43, v70);
  swift_getKeyPath();
  type metadata accessor for AttributeScopes.HighlightPillAttributes();
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type AttributeScopes.HighlightPillAttributes and conformance AttributeScopes.HighlightPillAttributes, (uint64_t (*)(uint64_t))type metadata accessor for AttributeScopes.HighlightPillAttributes, (uint64_t)&protocol conformance descriptor for AttributeScopes.HighlightPillAttributes);
  v48 = 0;
  v49 = (void *)NSAttributedString.init<A>(_:including:)();
  v50 = (unint64_t)objc_msgSend(v49, sel_length);
  if ((v50 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v48 = v50;
    v73 = (void *)MEMORY[0x1E0DEE9D8];
    v74 = (void *)MEMORY[0x1E0DEE9D8];
    v51 = one-time initialization token for numContacts;
    v46 = v49;
    if (v51 == -1)
      goto LABEL_12;
  }
  swift_once();
LABEL_12:
  v52 = static NSAttributedStringKey.numContacts;
  v53 = swift_allocObject();
  *(_QWORD *)(v53 + 16) = &v73;
  *(_QWORD *)(v53 + 24) = &v74;
  v54 = swift_allocObject();
  *(_QWORD *)(v54 + 16) = partial apply for closure #1 in NameAttributionLocAttributedString(prefix:name:multiline:localization:);
  *(_QWORD *)(v54 + 24) = v53;
  aBlock[4] = thunk for @callee_guaranteed (@in_guaranteed Any?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ()partial apply;
  aBlock[5] = v54;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@in_guaranteed Any?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  aBlock[3] = &block_descriptor_23_0;
  v55 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v46, sel_enumerateAttribute_inRange_options_usingBlock_, v52, 0, v48, 0, v55);
  _Block_release(v55);

  (*(void (**)(char *, uint64_t))(v42 + 8))(v71, v47);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  v57 = (objc_class *)swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v61 = v73;
    v60 = v74;
    swift_release();
    v57 = (objc_class *)v46;
    v58 = v60;
    v59 = v61;
  }
  result.senderFontTargetRanges._rawValue = v59;
  result.baseFontTargetRanges._rawValue = v58;
  result.localizedString.super.super.isa = v57;
  return result;
}

Swift::String __swiftcall formattedDisplayNameListAndNOthers(prefix:names:nOthers:localization:)(SocialLayer::AttributionTextPrefix prefix, Swift::OpaquePointer names, Swift::Int nOthers, Swift::String_optional localization)
{
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  id v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  Swift::Int v65;
  char *v66;
  char *v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  Swift::String result;
  char *v79;
  char *v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  char *v85;
  char *v86;
  char *v87;
  char *v88;
  char *v89;
  char *v90;
  char *v91;
  char *v92;
  unint64_t v93;
  unint64_t v94;
  char *v95;
  char *v96;
  char *v97;
  char *v98;
  Swift::Int v99;
  uint64_t v100;
  uint64_t v101;
  void (*v102)(char *, char *, uint64_t);
  uint64_t v103;
  uint64_t v104;
  __int128 v105;
  int v106;
  char *v107;
  uint64_t v108;
  Swift::String_optional v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;

  v109 = localization;
  v106 = prefix;
  v6 = type metadata accessor for Locale();
  MEMORY[0x1E0C80A78](v6);
  v107 = (char *)&v79 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v108 = type metadata accessor for String.LocalizationValue();
  v104 = *(_QWORD *)(v108 - 8);
  v8 = MEMORY[0x1E0C80A78](v108);
  v9 = MEMORY[0x1E0C80A78](v8);
  v10 = MEMORY[0x1E0C80A78](v9);
  v88 = (char *)&v79 - v11;
  v12 = MEMORY[0x1E0C80A78](v10);
  v87 = (char *)&v79 - v13;
  v14 = MEMORY[0x1E0C80A78](v12);
  v86 = (char *)&v79 - v15;
  v16 = MEMORY[0x1E0C80A78](v14);
  v85 = (char *)&v79 - v17;
  v18 = MEMORY[0x1E0C80A78](v16);
  v92 = (char *)&v79 - v19;
  v20 = MEMORY[0x1E0C80A78](v18);
  v91 = (char *)&v79 - v21;
  v22 = MEMORY[0x1E0C80A78](v20);
  v90 = (char *)&v79 - v23;
  v24 = MEMORY[0x1E0C80A78](v22);
  v89 = (char *)&v79 - v25;
  v26 = MEMORY[0x1E0C80A78](v24);
  v98 = (char *)&v79 - v27;
  v28 = MEMORY[0x1E0C80A78](v26);
  v97 = (char *)&v79 - v29;
  v30 = MEMORY[0x1E0C80A78](v28);
  v96 = (char *)&v79 - v31;
  MEMORY[0x1E0C80A78](v30);
  v95 = (char *)&v79 - v34;
  v111 = 0;
  v112 = 0xE000000000000000;
  v35 = *((_QWORD *)names._rawValue + 2);
  if (!v35)
    goto LABEL_22;
  v79 = v33;
  v80 = v32;
  v99 = nOthers;
  v36 = 0;
  v101 = v35 - 1;
  v37 = (uint64_t *)((char *)names._rawValue + 40);
  v94 = 0x8000000199FB0F50;
  v105 = xmmword_199FA7E60;
  v93 = 0x8000000199FB0F70;
  v84 = 0x8000000199FB0EF0;
  v83 = 0x8000000199FB0F20;
  v82 = 0x8000000199FB0E90;
  v81 = 0x8000000199FB0ED0;
  v103 = v35;
  do
  {
    v51 = *(v37 - 1);
    v45 = *v37;
    if (!v36)
    {
      swift_bridgeObjectRetain();
      v110 = v51;
      if ((v106 & 1) != 0)
      {
        v38 = v95;
        String.LocalizationValue.init(stringLiteral:)();
        v39 = v45;
        v40 = v104;
        v41 = v108;
        v102 = *(void (**)(char *, char *, uint64_t))(v104 + 16);
        v102(v96, v38, v108);
      }
      else
      {
        v38 = v97;
        String.LocalizationValue.init(stringLiteral:)();
        v39 = v45;
        v40 = v104;
        v41 = v108;
        v102 = *(void (**)(char *, char *, uint64_t))(v104 + 16);
        v102(v98, v38, v108);
      }
      v55 = SLFrameworkBundle();
      goto LABEL_4;
    }
    swift_bridgeObjectRetain();
    if (v36 >= v101 && v99 < 1)
    {
      v110 = v51;
      if ((v106 & 1) == 0)
      {
        v38 = v87;
        String.LocalizationValue.init(stringLiteral:)();
        v52 = v104;
        v41 = v108;
        v102 = *(void (**)(char *, char *, uint64_t))(v104 + 16);
        v102(v88, v38, v108);
        v53 = SLFrameworkBundle();
        swift_bridgeObjectRetain();
        static Locale.current.getter();
        v54 = v52;
        v43 = v103;
        String.init(localized:table:bundle:localization:locale:comment:)();
        v44 = *(void (**)(char *, uint64_t))(v54 + 8);
        goto LABEL_5;
      }
      v38 = v85;
      String.LocalizationValue.init(stringLiteral:)();
      v39 = v45;
      v40 = v104;
      v41 = v108;
      v102 = *(void (**)(char *, char *, uint64_t))(v104 + 16);
      v102(v86, v38, v108);
      v55 = SLFrameworkBundle();
LABEL_4:
      v42 = v55;
      swift_bridgeObjectRetain();
      static Locale.current.getter();
      v43 = v103;
      String.init(localized:table:bundle:localization:locale:comment:)();
      v44 = *(void (**)(char *, uint64_t))(v40 + 8);
      v45 = v39;
LABEL_5:
      v46 = v110;
      v44(v38, v41);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      v47 = swift_allocObject();
      *(_OWORD *)(v47 + 16) = v105;
      *(_QWORD *)(v47 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v47 + 64) = lazy protocol witness table accessor for type String and conformance String();
      *(_QWORD *)(v47 + 32) = v46;
      *(_QWORD *)(v47 + 40) = v45;
      v48 = static String.localizedStringWithFormat(_:_:)();
      v50 = v49;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      MEMORY[0x19AEC3C08](v48, v50);
      goto LABEL_6;
    }
    v100 = v45;
    if ((v106 & 1) != 0)
    {
      v56 = v89;
      String.LocalizationValue.init(stringLiteral:)();
      v57 = v104;
      v58 = v108;
      v102 = *(void (**)(char *, char *, uint64_t))(v104 + 16);
      v102(v90, v56, v108);
    }
    else
    {
      v56 = v91;
      String.LocalizationValue.init(stringLiteral:)();
      v57 = v104;
      v58 = v108;
      v102 = *(void (**)(char *, char *, uint64_t))(v104 + 16);
      v102(v92, v56, v108);
    }
    v59 = SLFrameworkBundle();
    swift_bridgeObjectRetain();
    static Locale.current.getter();
    String.init(localized:table:bundle:localization:locale:comment:)();
    v44 = *(void (**)(char *, uint64_t))(v57 + 8);
    v44(v56, v58);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    v60 = swift_allocObject();
    *(_OWORD *)(v60 + 16) = v105;
    *(_QWORD *)(v60 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v60 + 64) = lazy protocol witness table accessor for type String and conformance String();
    v61 = v100;
    *(_QWORD *)(v60 + 32) = v51;
    *(_QWORD *)(v60 + 40) = v61;
    v62 = static String.localizedStringWithFormat(_:_:)();
    v64 = v63;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    MEMORY[0x19AEC3C08](v62, v64);
    v43 = v103;
LABEL_6:
    ++v36;
    v37 += 2;
    swift_bridgeObjectRelease();
  }
  while (v43 != v36);
  v65 = v99;
  v66 = v80;
  v67 = v79;
  if (v99 >= 1)
  {
    String.LocalizationValue.init(stringLiteral:)();
    v68 = v108;
    v102(v67, v66, v108);
    v69 = SLFrameworkBundle();
    swift_bridgeObjectRetain();
    static Locale.current.getter();
    String.init(localized:table:bundle:localization:locale:comment:)();
    v44(v66, v68);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    v70 = swift_allocObject();
    v71 = MEMORY[0x1E0DEB418];
    *(_OWORD *)(v70 + 16) = v105;
    v72 = MEMORY[0x1E0DEB490];
    *(_QWORD *)(v70 + 56) = v71;
    *(_QWORD *)(v70 + 64) = v72;
    *(_QWORD *)(v70 + 32) = v65;
    v73 = static String.localizedStringWithFormat(_:_:)();
    v75 = v74;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    MEMORY[0x19AEC3C08](v73, v75);
    swift_bridgeObjectRelease();
  }
LABEL_22:
  v76 = v111;
  v77 = (void *)v112;
  result._object = v77;
  result._countAndFlagsBits = v76;
  return result;
}

Swift::tuple_localizedString_NSMutableAttributedString_baseFontTargetRanges_OpaquePointer_senderFontTargetRanges_OpaquePointer __swiftcall ListOfNamesAttributionLocAttributedString(prefix:listOfNamesString:multiline:localization:)(SocialLayer::AttributionTextPrefix prefix, Swift::String listOfNamesString, Swift::Bool multiline, Swift::String_optional localization)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  Swift::String v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  char isEscapingClosureAtFileLocation;
  objc_class *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[2];
  Swift::String v42;
  uint64_t v43;
  uint64_t v44;
  Swift::String_optional v45;
  uint64_t v46;
  _QWORD aBlock[6];
  void *v48;
  void *v49;
  Swift::tuple_localizedString_NSMutableAttributedString_baseFontTargetRanges_OpaquePointer_senderFontTargetRanges_OpaquePointer result;

  v45 = localization;
  v42 = listOfNamesString;
  v6 = type metadata accessor for String.LocalizationValue();
  v43 = *(_QWORD *)(v6 - 8);
  v44 = v6;
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue.StringInterpolation();
  v10 = MEMORY[0x1E0C80A78](v9);
  v11 = MEMORY[0x1E0C80A78](v10);
  v12 = MEMORY[0x1E0C80A78](v11);
  MEMORY[0x1E0C80A78](v12);
  v46 = type metadata accessor for AttributedString();
  v13 = *(_QWORD *)(v46 - 8);
  v14 = MEMORY[0x1E0C80A78](v46);
  v41[1] = (char *)v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x1E0C80A78](v14);
  v18 = (char *)v41 - v17;
  MEMORY[0x1E0C80A78](v16);
  v20 = (char *)v41 - v19;
  if ((prefix & 1) != 0)
  {
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
    if (multiline)
    {
      v21 = 0x3E72623C68746957;
      v22 = 0xEA00000000005B5ELL;
    }
    else
    {
      v21 = 0x5B5E2068746957;
      v22 = 0xE700000000000000;
    }
  }
  else
  {
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
    if (multiline)
    {
      v21 = 0x3E72623C6D6F7246;
      v22 = 0xEA00000000005B5ELL;
    }
    else
    {
      v21 = 0x5B5E206D6F7246;
      v22 = 0xE700000000000000;
    }
  }
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v21);
  v23 = v13;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v42);
  v24._object = (void *)0x8000000199FB0F90;
  v24._countAndFlagsBits = 0xD00000000000002BLL;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v24);
  String.LocalizationValue.init(stringInterpolation:)();
  SLLocAttributedString(key:localization:)((uint64_t)v8, v45.value._countAndFlagsBits);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v8, v44);
  v25 = (id)type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSMutableAttributedString);
  v26 = v46;
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v18, v20, v46);
  swift_getKeyPath();
  v27 = type metadata accessor for AttributeScopes.HighlightPillAttributes();
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type AttributeScopes.HighlightPillAttributes and conformance AttributeScopes.HighlightPillAttributes, (uint64_t (*)(uint64_t))type metadata accessor for AttributeScopes.HighlightPillAttributes, (uint64_t)&protocol conformance descriptor for AttributeScopes.HighlightPillAttributes);
  v28 = (void *)NSAttributedString.init<A>(_:including:)();
  v29 = (uint64_t)objc_msgSend(v28, sel_length);
  if (v29 < 0)
  {
    __break(1u);
  }
  else
  {
    v27 = v29;
    v48 = (void *)MEMORY[0x1E0DEE9D8];
    v49 = (void *)MEMORY[0x1E0DEE9D8];
    v30 = one-time initialization token for listOfNames;
    v25 = v28;
    if (v30 == -1)
      goto LABEL_10;
  }
  swift_once();
LABEL_10:
  v31 = static NSAttributedStringKey.listOfNames;
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = &v48;
  *(_QWORD *)(v32 + 24) = &v49;
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = partial apply for closure #1 in NameAttributionLocAttributedString(prefix:name:multiline:localization:);
  *(_QWORD *)(v33 + 24) = v32;
  aBlock[4] = thunk for @callee_guaranteed (@in_guaranteed Any?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ()partial apply;
  aBlock[5] = v33;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@in_guaranteed Any?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  aBlock[3] = &block_descriptor_33;
  v34 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v25, sel_enumerateAttribute_inRange_options_usingBlock_, v31, 0, v27, 0, v34);
  _Block_release(v34);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v26);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  v36 = (objc_class *)swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v40 = v48;
    v39 = v49;
    swift_release();
    v36 = (objc_class *)v25;
    v37 = v39;
    v38 = v40;
  }
  result.senderFontTargetRanges._rawValue = v38;
  result.baseFontTargetRanges._rawValue = v37;
  result.localizedString.super.super.isa = v36;
  return result;
}

uint64_t closure #1 in MeAttributionLocAttributedString(prefix:multiline:localization:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t *a6)
{
  _QWORD *v10;
  uint64_t result;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  char v22;
  _BYTE v23[24];
  uint64_t v24;

  outlined init with copy of Any?(a1, (uint64_t)v23);
  if (v24)
  {
    if ((swift_dynamicCast() & 1) != 0 && v22 == 1)
    {
      v10 = (_QWORD *)*a5;
      result = swift_isUniquelyReferenced_nonNull_native();
      *a5 = (uint64_t)v10;
      if ((result & 1) == 0)
      {
        result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v10[2] + 1, 1, v10);
        v10 = (_QWORD *)result;
        *a5 = result;
      }
      v12 = v10[2];
      v13 = v10[3];
      v14 = v12 + 1;
      if (v12 >= v13 >> 1)
      {
        v20 = v10;
        v21 = v10[2];
        result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v13 > 1), v12 + 1, 1, v20);
        v12 = v21;
        v10 = (_QWORD *)result;
      }
      v10[2] = v14;
      v15 = &v10[2 * v12];
      v15[4] = a2;
      v15[5] = a3;
      *a5 = (uint64_t)v10;
      return result;
    }
  }
  else
  {
    outlined destroy of Any?((uint64_t)v23);
  }
  v16 = (_QWORD *)*a6;
  result = swift_isUniquelyReferenced_nonNull_native();
  *a6 = (uint64_t)v16;
  if ((result & 1) == 0)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v16[2] + 1, 1, v16);
    v16 = (_QWORD *)result;
    *a6 = result;
  }
  v18 = v16[2];
  v17 = v16[3];
  if (v18 >= v17 >> 1)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v17 > 1), v18 + 1, 1, v16);
    v16 = (_QWORD *)result;
  }
  v16[2] = v18 + 1;
  v19 = &v16[2 * v18];
  v19[4] = a2;
  v19[5] = a3;
  *a6 = (uint64_t)v16;
  return result;
}

void attributedStringSplitByLineBreak(inString:)(void *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  Swift::Int v7;
  Swift::Int v8;
  id v9;
  uint64_t v10;
  Swift::Int v11;
  BOOL v12;
  uint64_t v13;

  v2 = objc_msgSend(a1, sel_string);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  lazy protocol witness table accessor for type String and conformance String();
  v3 = StringProtocol.components<A>(separatedBy:)();
  swift_bridgeObjectRelease();
  v13 = MEMORY[0x1E0DEE9D8];
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    v5 = 0;
    v6 = (_QWORD *)(v3 + 40);
    while (1)
    {
      v7 = (*v6 & 0x1000000000000000) != 0
         ? String.UTF16View._foreignCount()()
         : String.UTF16View._nativeGetOffset(for:)();
      v8 = v7;
      v9 = objc_msgSend(a1, sel_attributedSubstringFromRange_, v5, v7);
      MEMORY[0x19AEC3C8C]();
      if (*(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      v10 = String.count.getter();

      v11 = v8 + v10;
      if (__OFADD__(v8, v10))
        break;
      v12 = __OFADD__(v5, v11);
      v5 += v11;
      if (v12)
        goto LABEL_14;
      v6 += 2;
      if (!--v4)
        goto LABEL_10;
    }
    __break(1u);
LABEL_14:
    __break(1u);
  }
  else
  {
LABEL_10:
    swift_bridgeObjectRelease();
  }
}

double specialized HighlightPillMetricVariant.overlappedAvatarVisibleWidth.getter(void *a1)
{
  unint64_t v2;
  double v3;

  v2 = (unint64_t)objc_msgSend(a1, sel_preferredContentSizeCategory);
  v3 = 12.0;
  if (v2 <= 0xB)
    v3 = dbl_199FA91E0[v2];
  return SLRoundToScale(v3, (double)objc_msgSend(a1, sel_displayScale));
}

void specialized HighlightPillMetricVariant.avatarContainerWidth.getter(void *a1, uint64_t a2, uint64_t a3)
{
  char *v5;
  uint64_t v6;
  unint64_t v7;
  double v8;

  v5 = (char *)objc_msgSend(a1, sel_preferredContentSizeCategory);
  v6 = 3;
  if ((unint64_t)(v5 - 9) < 3)
    v6 = 1;
  if (v6 >= a3)
    v6 = a3;
  if (__OFSUB__(v6, 1))
  {
    __break(1u);
  }
  else
  {
    objc_msgSend(a1, sel_preferredContentSizeCategory);
    v7 = (unint64_t)objc_msgSend(a1, sel_preferredContentSizeCategory);
    if (v7 > 0xB)
      v8 = 19.92;
    else
      v8 = dbl_199FA9350[v7];
    SLRoundToScale(v8, (double)objc_msgSend(a1, sel_displayScale));
  }
}

{
  char *v5;
  uint64_t v6;

  v5 = (char *)objc_msgSend(a1, sel_preferredContentSizeCategory);
  v6 = 3;
  if ((unint64_t)(v5 - 9) < 3)
    v6 = 1;
  if (v6 >= a3)
    v6 = a3;
  if (__OFSUB__(v6, 1))
  {
    __break(1u);
  }
  else
  {
    objc_msgSend(a1, sel_preferredContentSizeCategory);
    specialized HighlightPillMetricVariant.overlappedAvatarVisibleWidth.getter(a1);
  }
}

uint64_t specialized HighlightPillMetricVariant.chevronFontDescriptor.getter(void *a1)
{
  uint64_t inited;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  Class isa;
  id v14;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef : Any])>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_199FA7E60;
  v3 = (void *)*MEMORY[0x1E0CA8418];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CA8418];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Any)>);
  v4 = swift_initStackObject();
  *(_OWORD *)(v4 + 16) = xmmword_199FA7840;
  v5 = (void *)*MEMORY[0x1E0CA8400];
  v6 = MEMORY[0x1E0DEB418];
  *(_QWORD *)(v4 + 32) = *MEMORY[0x1E0CA8400];
  *(_QWORD *)(v4 + 40) = 0x8000;
  v7 = (void *)*MEMORY[0x1E0CA84E8];
  v8 = (uint64_t *)MEMORY[0x1E0CA84C8];
  *(_QWORD *)(v4 + 64) = v6;
  *(_QWORD *)(v4 + 72) = v7;
  v9 = *v8;
  *(_QWORD *)(v4 + 104) = MEMORY[0x1E0DEF040];
  *(_QWORD *)(v4 + 80) = v9;
  v10 = v3;
  v11 = v5;
  v12 = v7;
  *(_QWORD *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v4);
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef : Any]);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t (*)(uint64_t))type metadata accessor for CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(a1, sel_fontContentSizeCategory);
  v15 = CTFontDescriptorCreateWithTextStyleAndAttributes();

  return v15;
}

void specialized HighlightPillMetricVariant.chevronSize.getter(void *a1)
{
  id v2;
  void *v3;
  unint64_t v4;
  id v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  id v10;

  v2 = objc_msgSend(a1, sel_layoutDirection);
  v3 = (void *)VisionPillMetric.chevronFontDescriptor.getter(a1, 0);
  if (CTFontDescriptorCopyAttribute((CTFontDescriptorRef)v3, (CFStringRef)*MEMORY[0x1E0CA83D8]))
  {
    if (v2 == (id)1)
      v4 = 0xEC0000007466656CLL;
    else
      v4 = 0xED00007468676972;
    type metadata accessor for CFNumberRef(0);
    v5 = (id)swift_dynamicCastUnknownClassUnconditional();
    CGFloat.init(truncating:)();
    v7 = v6;

    v8 = a1;
    v9 = (void *)MEMORY[0x19AEC3B6C](0x2E6E6F7276656863, v4);
    swift_bridgeObjectRelease();
    v10 = SLDSystemVectorGlyphWithSlotStyle(v8, v9, 1, 5, v7);

    objc_msgSend(v10, sel_contentBounds);
  }
  else
  {
    __break(1u);
  }
}

{
  id v2;
  void *v3;
  unint64_t v4;
  id v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  id v10;

  v2 = objc_msgSend(a1, sel_layoutDirection);
  v3 = (void *)specialized HighlightPillMetricVariant.chevronFontDescriptor.getter(a1);
  if (CTFontDescriptorCopyAttribute((CTFontDescriptorRef)v3, (CFStringRef)*MEMORY[0x1E0CA83D8]))
  {
    if (v2 == (id)1)
      v4 = 0xEC0000007466656CLL;
    else
      v4 = 0xED00007468676972;
    type metadata accessor for CFNumberRef(0);
    v5 = (id)swift_dynamicCastUnknownClassUnconditional();
    CGFloat.init(truncating:)();
    v7 = v6;

    v8 = a1;
    v9 = (void *)MEMORY[0x19AEC3B6C](0x2E6E6F7276656863, v4);
    swift_bridgeObjectRelease();
    v10 = SLDSystemVectorGlyphWithSlotStyle(v8, v9, 1, 5, v7);

    objc_msgSend(v10, sel_contentBounds);
  }
  else
  {
    __break(1u);
  }
}

CTFontRef specialized HighlightPillMetricVariant.baseFont.getter(void *a1)
{
  uint64_t inited;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  Class isa;
  void *v9;
  const __CTFontDescriptor *v10;
  CTFontRef v11;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef : Int])>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_199FA7E60;
  v3 = (void *)*MEMORY[0x1E0CA8418];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CA8418];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Int)>);
  v4 = swift_initStackObject();
  *(_OWORD *)(v4 + 16) = xmmword_199FA7E60;
  v5 = (void *)*MEMORY[0x1E0CA8400];
  *(_QWORD *)(v4 + 32) = *MEMORY[0x1E0CA8400];
  *(_QWORD *)(v4 + 40) = 0x8000;
  v6 = v3;
  v7 = v5;
  *(_QWORD *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v4);
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef : Int]);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t (*)(uint64_t))type metadata accessor for CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v9 = (void *)CTContentSizeCategoryForSlotStyle(a1);
  v10 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  v11 = CTFontCreateWithFontDescriptor(v10, 0.0, 0);

  return v11;
}

CTFontRef specialized HighlightPillMetricVariant.senderFont.getter(void *a1)
{
  uint64_t inited;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  Class isa;
  id v14;
  const __CTFontDescriptor *v15;
  CTFontRef v16;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef : Any])>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_199FA7E60;
  v3 = (void *)*MEMORY[0x1E0CA8418];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CA8418];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Any)>);
  v4 = swift_initStackObject();
  *(_OWORD *)(v4 + 16) = xmmword_199FA7840;
  v5 = (void *)*MEMORY[0x1E0CA8400];
  v6 = MEMORY[0x1E0DEB418];
  *(_QWORD *)(v4 + 32) = *MEMORY[0x1E0CA8400];
  *(_QWORD *)(v4 + 40) = 32770;
  v7 = (void *)*MEMORY[0x1E0CA84E8];
  v8 = (uint64_t *)MEMORY[0x1E0CA84D8];
  *(_QWORD *)(v4 + 64) = v6;
  *(_QWORD *)(v4 + 72) = v7;
  v9 = *v8;
  *(_QWORD *)(v4 + 104) = MEMORY[0x1E0DEF040];
  *(_QWORD *)(v4 + 80) = v9;
  v10 = v3;
  v11 = v5;
  v12 = v7;
  *(_QWORD *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v4);
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef : Any]);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t (*)(uint64_t))type metadata accessor for CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(a1, sel_fontContentSizeCategory);
  v15 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  v16 = CTFontCreateWithFontDescriptor(v15, 0.0, 0);

  return v16;
}

uint64_t (*VisionPillMetric.style.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t VisionPillMetric.isCollaboration.getter(uint64_t a1, char a2)
{
  return a2 & 1;
}

uint64_t (*VisionPillMetric.isCollaboration.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t (*VisionPillMetric.clientMaxWidth.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t VisionPillMetric.availableImageCount.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t (*VisionPillMetric.availableImageCount.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

double VisionPillMetric.maximumWidth.getter(void *a1)
{
  char *v1;

  v1 = (char *)objc_msgSend(a1, sel_preferredContentSizeCategory);
  if ((unint64_t)(v1 - 5) > 6)
    return 340.0;
  else
    return dbl_199FA92B8[(_QWORD)(v1 - 5)];
}

double VisionPillMetric.pillMargins.getter()
{
  return 4.0;
}

double VisionPillMetric.labelHorizontalMargins.getter(void *a1, double a2)
{
  char *v4;

  v4 = (char *)objc_msgSend(a1, sel_preferredContentSizeCategory);
  if ((unint64_t)(v4 - 7) < 2)
  {
    if (a2 <= 380.0)
      return 0.0;
    goto LABEL_12;
  }
  if ((unint64_t)(v4 - 10) < 2)
  {
    if (a2 < 466.0)
      return 0.0;
    goto LABEL_12;
  }
  if (v4 != (char *)9 || a2 > 353.0)
LABEL_12:
    objc_msgSend(a1, sel_preferredContentSizeCategory);
  return 0.0;
}

BOOL VisionPillMetric.useDoubleLineLabel.getter(void *a1, double a2)
{
  char *v3;
  _BOOL4 v4;
  _BOOL4 v5;

  v3 = (char *)objc_msgSend(a1, sel_preferredContentSizeCategory);
  v4 = a2 <= 353.0;
  if (v3 != (char *)9)
    v4 = 0;
  if ((unint64_t)(v3 - 10) >= 2)
    v5 = v4;
  else
    v5 = a2 < 466.0;
  if ((unint64_t)(v3 - 7) >= 2)
    return v5;
  else
    return a2 <= 380.0;
}

double VisionPillMetric.avatarDiameter.getter(void *a1)
{
  char *v1;
  double result;

  v1 = (char *)objc_msgSend(a1, sel_preferredContentSizeCategory);
  result = 24.0;
  if ((unint64_t)(v1 - 9) <= 2)
    return dbl_199FA92A0[(_QWORD)(v1 - 9)];
  return result;
}

double VisionPillMetric.overlappedAvatarVisibleWidth.getter(void *a1)
{
  unint64_t v2;
  double v3;

  v2 = (unint64_t)objc_msgSend(a1, sel_preferredContentSizeCategory);
  if (v2 > 0xB)
    v3 = 19.92;
  else
    v3 = dbl_199FA9350[v2];
  return SLRoundToScale(v3, (double)objc_msgSend(a1, sel_displayScale));
}

BOOL VisionPillMetric.allowLineWrapForMultilineSingleSenderName.getter(void *a1, double a2)
{
  char *v4;
  double v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  const __CFLocale *v12;

  v4 = (char *)objc_msgSend(a1, sel_preferredContentSizeCategory);
  if ((unint64_t)(v4 - 7) < 2)
  {
    v5 = 380.0;
LABEL_8:
    if (a2 > v5)
      return 0;
    goto LABEL_9;
  }
  if ((unint64_t)(v4 - 10) >= 2)
  {
    if (v4 != (char *)9)
      return 0;
    v5 = 353.0;
    goto LABEL_8;
  }
  if (a2 >= 466.0)
    return 0;
LABEL_9:
  if ((char *)objc_msgSend(a1, sel_preferredContentSizeCategory) - 9 <= (char *)2)
  {
    v6 = objc_msgSend(a1, sel_localization);
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v9 = v8;

    v10 = objc_allocWithZone(MEMORY[0x1E0C99DC8]);
    v11 = (void *)MEMORY[0x19AEC3B6C](v7, v9);
    swift_bridgeObjectRelease();
    v12 = (const __CFLocale *)objc_msgSend(v10, sel_initWithLocaleIdentifier_, v11);

    LODWORD(v11) = CFStringIsHyphenationAvailableForLocale(v12);
    return (_DWORD)v11 != 0;
  }
  return 0;
}

void VisionPillMetric.chevronSize.getter(void *a1)
{
  id v2;
  void *v3;
  unint64_t v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v2 = objc_msgSend(a1, sel_layoutDirection);
  v3 = (void *)VisionPillMetric.chevronFontDescriptor.getter(a1, 0);
  if (CTFontDescriptorCopyAttribute((CTFontDescriptorRef)v3, (CFStringRef)*MEMORY[0x1E0CA83D8]))
  {
    if (v2 == (id)1)
      v4 = 0xEC0000007466656CLL;
    else
      v4 = 0xED00007468676972;
    type metadata accessor for CFNumberRef(0);
    v5 = (id)swift_dynamicCastUnknownClassUnconditional();
    CGFloat.init(truncating:)();
    v7 = v6;

    v8 = (void *)MEMORY[0x19AEC3B6C](0x2E6E6F7276656863, v4);
    swift_bridgeObjectRelease();
    v9 = SLDSystemVectorGlyphWithSlotStyle(a1, v8, 1, 5, v7);

    objc_msgSend(v9, sel_contentBounds);
  }
  else
  {
    __break(1u);
  }
}

double protocol witness for HighlightPillMetricVariant.maximumWidth.getter in conformance VisionPillMetric()
{
  id *v0;
  char *v1;

  v1 = (char *)objc_msgSend(*v0, sel_preferredContentSizeCategory);
  if ((unint64_t)(v1 - 5) > 6)
    return 340.0;
  else
    return dbl_199FA92B8[(_QWORD)(v1 - 5)];
}

double protocol witness for HighlightPillMetricVariant.labelHorizontalMargins.getter in conformance VisionPillMetric()
{
  uint64_t v0;

  VisionPillMetric.labelHorizontalMargins.getter(*(void **)v0, *(double *)(v0 + 16));
  return 0.0;
}

double protocol witness for HighlightPillMetricVariant.avatarDiameter.getter in conformance VisionPillMetric()
{
  id *v0;
  unint64_t v1;
  double result;

  v1 = (unint64_t)objc_msgSend(*v0, sel_preferredContentSizeCategory);
  result = 24.0;
  if (v1 <= 0xB)
    return dbl_199FA92F0[v1];
  return result;
}

double protocol witness for HighlightPillMetricVariant.overlappedAvatarVisibleWidth.getter in conformance VisionPillMetric()
{
  id *v0;
  id v1;
  unint64_t v2;
  double v3;

  v1 = *v0;
  v2 = (unint64_t)objc_msgSend(*v0, sel_preferredContentSizeCategory);
  if (v2 > 0xB)
    v3 = 19.92;
  else
    v3 = dbl_199FA9350[v2];
  return SLRoundToScale(v3, (double)objc_msgSend(v1, sel_displayScale));
}

void protocol witness for HighlightPillMetricVariant.avatarContainerWidth.getter in conformance VisionPillMetric()
{
  uint64_t v0;

  specialized HighlightPillMetricVariant.avatarContainerWidth.getter(*(void **)v0, *(unsigned __int8 *)(v0 + 8), *(_QWORD *)(v0 + 24));
}

BOOL protocol witness for HighlightPillMetricVariant.useDoubleLineLabel.getter in conformance VisionPillMetric()
{
  uint64_t v0;
  double v1;
  char *v2;
  _BOOL4 v3;
  _BOOL4 v4;

  v1 = *(double *)(v0 + 16);
  v2 = (char *)objc_msgSend(*(id *)v0, sel_preferredContentSizeCategory);
  v3 = v1 <= 353.0;
  if (v2 != (char *)9)
    v3 = 0;
  if ((unint64_t)(v2 - 10) >= 2)
    v4 = v3;
  else
    v4 = v1 < 466.0;
  if ((unint64_t)(v2 - 7) >= 2)
    return v4;
  else
    return v1 <= 380.0;
}

BOOL protocol witness for HighlightPillMetricVariant.allowLineWrapForMultilineSingleSenderName.getter in conformance VisionPillMetric()
{
  uint64_t v0;

  return VisionPillMetric.allowLineWrapForMultilineSingleSenderName.getter(*(void **)v0, *(double *)(v0 + 16));
}

uint64_t protocol witness for HighlightPillMetricVariant.baseFont.getter in conformance VisionPillMetric()
{
  _QWORD *v0;

  return VisionPillMetric.baseFont.getter(*v0, 0);
}

uint64_t protocol witness for HighlightPillMetricVariant.senderFont.getter in conformance VisionPillMetric()
{
  _QWORD *v0;

  return VisionPillMetric.senderFont.getter(*v0, 0);
}

double protocol witness for HighlightPillMetricVariant.pillMargins.getter in conformance VisionPillMetric()
{
  return 4.0;
}

uint64_t protocol witness for HighlightPillMetricVariant.chevronFontDescriptor.getter in conformance VisionPillMetric()
{
  _QWORD *v0;

  return VisionPillMetric.chevronFontDescriptor.getter(*v0, 0);
}

void protocol witness for HighlightPillMetricVariant.chevronSize.getter in conformance VisionPillMetric()
{
  void **v0;

  VisionPillMetric.chevronSize.getter(*v0);
}

uint64_t (*VisionSafariBannerPillMetric.style.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t VisionSafariBannerPillMetric.isCollaboration.getter(uint64_t a1, char a2)
{
  return a2 & 1;
}

uint64_t (*VisionSafariBannerPillMetric.isCollaboration.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t (*VisionSafariBannerPillMetric.clientMaxWidth.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t VisionSafariBannerPillMetric.availableImageCount.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t (*VisionSafariBannerPillMetric.availableImageCount.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

double VisionSafariBannerPillMetric.labelHorizontalMargins.getter()
{
  return 0.0;
}

double VisionSafariBannerPillMetric.avatarDiameter.getter()
{
  return 24.0;
}

double VisionSafariBannerPillMetric.overlappedAvatarVisibleWidth.getter(void *a1)
{
  return SLRoundToScale(19.92, (double)objc_msgSend(a1, sel_displayScale));
}

uint64_t VisionPillMetric.chevronFontDescriptor.getter(void *a1)
{
  uint64_t inited;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  Class isa;
  id v9;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef : CGFloat])>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_199FA7E60;
  v3 = (void *)*MEMORY[0x1E0CA8418];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CA8418];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, CGFloat)>);
  v4 = swift_initStackObject();
  *(_OWORD *)(v4 + 16) = xmmword_199FA7E60;
  v5 = (void *)*MEMORY[0x1E0CA84E8];
  *(_QWORD *)(v4 + 32) = *MEMORY[0x1E0CA84E8];
  *(_QWORD *)(v4 + 40) = *MEMORY[0x1E0CA84D8];
  v6 = v3;
  v7 = v5;
  *(_QWORD *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v4);
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef : CGFloat]);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t (*)(uint64_t))type metadata accessor for CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(a1, sel_fontContentSizeCategory);
  v10 = CTFontDescriptorCreateWithTextStyleAndAttributes();

  return v10;
}

CTFontRef VisionPillMetric.baseFont.getter(void *a1)
{
  uint64_t inited;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  Class isa;
  void *v9;
  const __CTFontDescriptor *v10;
  CTFontRef v11;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef : CGFloat])>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_199FA7E60;
  v3 = (void *)*MEMORY[0x1E0CA8418];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CA8418];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, CGFloat)>);
  v4 = swift_initStackObject();
  *(_OWORD *)(v4 + 16) = xmmword_199FA7E60;
  v5 = (void *)*MEMORY[0x1E0CA84E8];
  *(_QWORD *)(v4 + 32) = *MEMORY[0x1E0CA84E8];
  *(_QWORD *)(v4 + 40) = *MEMORY[0x1E0CA84D8];
  v6 = v3;
  v7 = v5;
  *(_QWORD *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v4);
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef : CGFloat]);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t (*)(uint64_t))type metadata accessor for CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v9 = (void *)CTContentSizeCategoryForSlotStyle(a1);
  v10 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  v11 = CTFontCreateWithFontDescriptor(v10, 0.0, 0);

  return v11;
}

CTFontRef VisionPillMetric.senderFont.getter(void *a1)
{
  uint64_t inited;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  Class isa;
  id v9;
  const __CTFontDescriptor *v10;
  CTFontRef v11;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef : CGFloat])>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_199FA7E60;
  v3 = (void *)*MEMORY[0x1E0CA8418];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CA8418];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, CGFloat)>);
  v4 = swift_initStackObject();
  *(_OWORD *)(v4 + 16) = xmmword_199FA7E60;
  v5 = (void *)*MEMORY[0x1E0CA84E8];
  *(_QWORD *)(v4 + 32) = *MEMORY[0x1E0CA84E8];
  *(_QWORD *)(v4 + 40) = *MEMORY[0x1E0CA84D8];
  v6 = v3;
  v7 = v5;
  *(_QWORD *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v4);
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef : CGFloat]);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t (*)(uint64_t))type metadata accessor for CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(a1, sel_fontContentSizeCategory);
  v10 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  v11 = CTFontCreateWithFontDescriptor(v10, 0.0, 0);

  return v11;
}

uint64_t protocol witness for HighlightPillMetricVariant.maxImageCount.getter in conformance VisionSafariBannerPillMetric()
{
  return 3;
}

double protocol witness for HighlightPillMetricVariant.maximumWidth.getter in conformance VisionSafariBannerPillMetric()
{
  return 320.0;
}

double protocol witness for HighlightPillMetricVariant.labelHorizontalMargins.getter in conformance VisionSafariBannerPillMetric()
{
  return 0.0;
}

double protocol witness for HighlightPillMetricVariant.avatarDiameter.getter in conformance VisionSafariBannerPillMetric()
{
  return 24.0;
}

double protocol witness for HighlightPillMetricVariant.overlappedAvatarVisibleWidth.getter in conformance VisionSafariBannerPillMetric()
{
  id *v0;

  return SLRoundToScale(19.92, (double)objc_msgSend(*v0, sel_displayScale));
}

void protocol witness for HighlightPillMetricVariant.avatarContainerWidth.getter in conformance VisionSafariBannerPillMetric()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  if (v1 >= 3)
    v1 = 3;
  if (__OFSUB__(v1, 1))
    __break(1u);
  else
    SLRoundToScale(19.92, (double)objc_msgSend(*(id *)v0, sel_displayScale));
}

void protocol witness for HighlightPillMetricVariant.chevronSize.getter in conformance VisionSafariBannerPillMetric()
{
  void **v0;

  specialized HighlightPillMetricVariant.chevronSize.getter(*v0);
}

uint64_t (*iOSPillMetric.style.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t iOSPillMetric.isCollaboration.getter(uint64_t a1, char a2)
{
  return a2 & 1;
}

uint64_t (*iOSPillMetric.isCollaboration.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t (*iOSPillMetric.clientMaxWidth.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t iOSPillMetric.availableImageCount.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t (*iOSPillMetric.availableImageCount.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t iOSPillMetric.maxImageCount.getter(void *a1)
{
  if ((char *)objc_msgSend(a1, sel_preferredContentSizeCategory) - 9 < (char *)3)
    return 1;
  else
    return 3;
}

uint64_t iOSPillMetric.maxNameCount.getter(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return 2;
  else
    return 1;
}

double iOSPillMetric.maximumWidth.getter(void *a1)
{
  char *v1;

  v1 = (char *)objc_msgSend(a1, sel_preferredContentSizeCategory);
  if ((unint64_t)(v1 - 5) > 6)
    return 250.0;
  else
    return dbl_199FA9498[(_QWORD)(v1 - 5)];
}

double iOSPillMetric.labelHorizontalMargins.getter(void *a1, double a2)
{
  char *v4;

  v4 = (char *)objc_msgSend(a1, sel_preferredContentSizeCategory);
  if ((unint64_t)(v4 - 7) < 2)
  {
    if (a2 <= 280.0)
      return 0.0;
    goto LABEL_12;
  }
  if ((unint64_t)(v4 - 10) < 2)
  {
    if (a2 < 343.0)
      return 0.0;
    goto LABEL_12;
  }
  if (v4 != (char *)9 || a2 > 260.0)
LABEL_12:
    objc_msgSend(a1, sel_preferredContentSizeCategory);
  return 0.0;
}

BOOL iOSPillMetric.useDoubleLineLabel.getter(void *a1, double a2)
{
  char *v3;
  _BOOL4 v4;
  _BOOL4 v5;

  v3 = (char *)objc_msgSend(a1, sel_preferredContentSizeCategory);
  v4 = a2 <= 260.0;
  if (v3 != (char *)9)
    v4 = 0;
  if ((unint64_t)(v3 - 10) >= 2)
    v5 = v4;
  else
    v5 = a2 < 343.0;
  if ((unint64_t)(v3 - 7) >= 2)
    return v5;
  else
    return a2 <= 280.0;
}

double iOSPillMetric.avatarDiameter.getter(void *a1)
{
  char *v1;
  double result;

  v1 = (char *)objc_msgSend(a1, sel_preferredContentSizeCategory);
  result = 16.0;
  if ((unint64_t)(v1 - 7) <= 4)
    return dbl_199FA9470[(_QWORD)(v1 - 7)];
  return result;
}

double VisionPillMetric.avatarOverlapKnockoutWidth.getter(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  char *v5;
  uint64_t v6;
  double result;

  v4 = a1;
  v5 = (char *)objc_msgSend(v4, sel_preferredContentSizeCategory);

  v6 = 3;
  if ((unint64_t)(v5 - 9) < 3)
    v6 = 1;
  if (v6 >= a3)
    v6 = a3;
  result = 0.0;
  if (v6 > 1)
    return 1.0;
  return result;
}

BOOL iOSPillMetric.allowLineWrapForMultilineSingleSenderName.getter(void *a1, double a2)
{
  char *v4;
  double v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  const __CFLocale *v12;

  v4 = (char *)objc_msgSend(a1, sel_preferredContentSizeCategory);
  if ((unint64_t)(v4 - 7) < 2)
  {
    v5 = 280.0;
LABEL_8:
    if (a2 > v5)
      return 0;
    goto LABEL_9;
  }
  if ((unint64_t)(v4 - 10) >= 2)
  {
    if (v4 != (char *)9)
      return 0;
    v5 = 260.0;
    goto LABEL_8;
  }
  if (a2 >= 343.0)
    return 0;
LABEL_9:
  if ((char *)objc_msgSend(a1, sel_preferredContentSizeCategory) - 9 <= (char *)2)
  {
    v6 = objc_msgSend(a1, sel_localization);
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v9 = v8;

    v10 = objc_allocWithZone(MEMORY[0x1E0C99DC8]);
    v11 = (void *)MEMORY[0x19AEC3B6C](v7, v9);
    swift_bridgeObjectRelease();
    v12 = (const __CFLocale *)objc_msgSend(v10, sel_initWithLocaleIdentifier_, v11);

    LODWORD(v11) = CFStringIsHyphenationAvailableForLocale(v12);
    return (_DWORD)v11 != 0;
  }
  return 0;
}

BOOL iOSPillMetric.onlyDisplayNameOrSenderCount.getter(void *a1)
{
  return (char *)objc_msgSend(a1, sel_preferredContentSizeCategory) - 9 < (char *)3;
}

uint64_t protocol witness for HighlightPillMetricVariant.maxNameCount.getter in conformance iOSPillMetric()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 8))
    return 2;
  else
    return 1;
}

uint64_t protocol witness for HighlightPillMetricVariant.maxImageCount.getter in conformance iOSPillMetric()
{
  id *v0;

  if ((char *)objc_msgSend(*v0, sel_preferredContentSizeCategory) - 9 < (char *)3)
    return 1;
  else
    return 3;
}

uint64_t protocol witness for HighlightPillMetricVariant.finalImageCount.getter in conformance iOSPillMetric()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = (char *)objc_msgSend(*(id *)v0, sel_preferredContentSizeCategory);
  v3 = 3;
  if ((unint64_t)(v2 - 9) < 3)
    v3 = 1;
  if (v1 >= v3)
    return v3;
  else
    return v1;
}

double protocol witness for HighlightPillMetricVariant.maximumWidth.getter in conformance iOSPillMetric()
{
  id *v0;
  char *v1;

  v1 = (char *)objc_msgSend(*v0, sel_preferredContentSizeCategory);
  if ((unint64_t)(v1 - 5) > 6)
    return 250.0;
  else
    return dbl_199FA9498[(_QWORD)(v1 - 5)];
}

double protocol witness for HighlightPillMetricVariant.labelHorizontalMargins.getter in conformance iOSPillMetric()
{
  uint64_t v0;

  iOSPillMetric.labelHorizontalMargins.getter(*(void **)v0, *(double *)(v0 + 16));
  return 0.0;
}

double protocol witness for HighlightPillMetricVariant.avatarDiameter.getter in conformance iOSPillMetric()
{
  id *v0;
  unint64_t v1;
  double result;

  v1 = (unint64_t)objc_msgSend(*v0, sel_preferredContentSizeCategory);
  result = 16.0;
  if (v1 <= 0xB)
    return dbl_199FA94D0[v1];
  return result;
}

double protocol witness for HighlightPillMetricVariant.overlappedAvatarVisibleWidth.getter in conformance iOSPillMetric()
{
  void **v0;

  return specialized HighlightPillMetricVariant.overlappedAvatarVisibleWidth.getter(*v0);
}

void protocol witness for HighlightPillMetricVariant.avatarContainerWidth.getter in conformance iOSPillMetric()
{
  uint64_t v0;

  specialized HighlightPillMetricVariant.avatarContainerWidth.getter(*(void **)v0, *(unsigned __int8 *)(v0 + 8), *(_QWORD *)(v0 + 24));
}

double protocol witness for HighlightPillMetricVariant.avatarOverlapKnockoutWidth.getter in conformance VisionPillMetric()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  char *v3;
  uint64_t v4;
  double result;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(id *)v0;
  v3 = (char *)objc_msgSend(v2, sel_preferredContentSizeCategory);

  v4 = 3;
  if ((unint64_t)(v3 - 9) < 3)
    v4 = 1;
  if (v1 < v4)
    v4 = v1;
  result = 0.0;
  if (v4 > 1)
    return 1.0;
  return result;
}

BOOL protocol witness for HighlightPillMetricVariant.useDoubleLineLabel.getter in conformance iOSPillMetric()
{
  uint64_t v0;
  double v1;
  char *v2;
  _BOOL4 v3;
  _BOOL4 v4;

  v1 = *(double *)(v0 + 16);
  v2 = (char *)objc_msgSend(*(id *)v0, sel_preferredContentSizeCategory);
  v3 = v1 <= 260.0;
  if (v2 != (char *)9)
    v3 = 0;
  if ((unint64_t)(v2 - 10) >= 2)
    v4 = v3;
  else
    v4 = v1 < 343.0;
  if ((unint64_t)(v2 - 7) >= 2)
    return v4;
  else
    return v1 <= 280.0;
}

BOOL protocol witness for HighlightPillMetricVariant.allowLineWrapForMultilineSingleSenderName.getter in conformance iOSPillMetric()
{
  uint64_t v0;

  return iOSPillMetric.allowLineWrapForMultilineSingleSenderName.getter(*(void **)v0, *(double *)(v0 + 16));
}

BOOL protocol witness for HighlightPillMetricVariant.onlyDisplayNameOrSenderCount.getter in conformance iOSPillMetric()
{
  id *v0;

  return (char *)objc_msgSend(*v0, sel_preferredContentSizeCategory) - 9 < (char *)3;
}

double protocol witness for HighlightPillMetricVariant.pillMargins.getter in conformance iOSPillMetric()
{
  id *v0;

  if ((char *)objc_msgSend(*v0, sel_preferredContentSizeCategory) - 7 > (char *)4)
    return 4.0;
  else
    return 6.0;
}

void protocol witness for HighlightPillMetricVariant.chevronSize.getter in conformance iOSPillMetric()
{
  void **v0;

  specialized HighlightPillMetricVariant.chevronSize.getter(*v0);
}

void TVPillMetrics.style.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*TVPillMetrics.style.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

void TVPillMetrics.clientMaxWidth.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 8) = a1;
}

uint64_t (*TVPillMetrics.clientMaxWidth.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t TVPillMetrics.availableImageCount.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t TVPillMetrics.availableImageCount.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t (*TVPillMetrics.availableImageCount.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t TVPillMetrics.maxImageCount.getter()
{
  return 3;
}

uint64_t TVPillMetrics.maxNameCount.getter()
{
  return 8;
}

uint64_t TVPillMetrics.shouldDisplayPin.getter()
{
  return 1;
}

double TVPillMetrics.maximumWidth.getter()
{
  return 10000.0;
}

double TVPillMetrics.pillMargins.getter()
{
  return 9.0;
}

double TVPillMetrics.labelHorizontalMargins.getter()
{
  return 0.0;
}

double TVPillMetrics.avatarDiameter.getter()
{
  return 32.0;
}

double TVPillMetrics.avatarOverlapKnockoutWidth.getter(uint64_t a1, uint64_t a2)
{
  double result;

  result = 0.0;
  if (a2 > 1)
    return 2.0;
  return result;
}

uint64_t TVPillMetrics.useDoubleLineLabel.getter()
{
  return 0;
}

uint64_t protocol witness for HighlightPillMetricVariant.maxNameCount.getter in conformance TVPillMetrics()
{
  return 8;
}

uint64_t protocol witness for HighlightPillMetricVariant.finalImageCount.getter in conformance TVPillMetrics()
{
  uint64_t v0;

  if (*(uint64_t *)(v0 + 16) >= 3)
    return 3;
  else
    return *(_QWORD *)(v0 + 16);
}

double protocol witness for HighlightPillMetricVariant.maximumWidth.getter in conformance TVPillMetrics()
{
  return 10000.0;
}

double protocol witness for HighlightPillMetricVariant.labelHorizontalMargins.getter in conformance TVPillMetrics()
{
  return 0.0;
}

double protocol witness for HighlightPillMetricVariant.avatarDiameter.getter in conformance TVPillMetrics()
{
  return 32.0;
}

double protocol witness for HighlightPillMetricVariant.overlappedAvatarVisibleWidth.getter in conformance TVPillMetrics()
{
  id *v0;

  return SLRoundToScale(24.0, (double)objc_msgSend(*v0, sel_displayScale));
}

void protocol witness for HighlightPillMetricVariant.avatarContainerWidth.getter in conformance TVPillMetrics()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  if (v1 >= 3)
    v1 = 3;
  if (__OFSUB__(v1, 1))
    __break(1u);
  else
    SLRoundToScale(24.0, (double)objc_msgSend(*(id *)v0, sel_displayScale));
}

double protocol witness for HighlightPillMetricVariant.avatarOverlapKnockoutWidth.getter in conformance TVPillMetrics()
{
  uint64_t v0;
  double result;

  result = 0.0;
  if (*(uint64_t *)(v0 + 16) > 1)
    return 2.0;
  return result;
}

CTFontRef protocol witness for HighlightPillMetricVariant.baseFont.getter in conformance TVPillMetrics()
{
  void **v0;

  return specialized HighlightPillMetricVariant.baseFont.getter(*v0);
}

CTFontRef protocol witness for HighlightPillMetricVariant.senderFont.getter in conformance TVPillMetrics()
{
  void **v0;

  return specialized HighlightPillMetricVariant.senderFont.getter(*v0);
}

double protocol witness for HighlightPillMetricVariant.pillMargins.getter in conformance TVPillMetrics()
{
  return 9.0;
}

uint64_t protocol witness for HighlightPillMetricVariant.chevronFontDescriptor.getter in conformance TVPillMetrics()
{
  void **v0;

  return specialized HighlightPillMetricVariant.chevronFontDescriptor.getter(*v0);
}

double protocol witness for HighlightPillMetricVariant.chevronSize.getter in conformance TVPillMetrics()
{
  return 0.0;
}

void MacPillMetric.style.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*MacPillMetric.style.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t MacPillMetric.isCollaboration.getter(uint64_t a1, char a2)
{
  return a2 & 1;
}

uint64_t MacPillMetric.isCollaboration.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 8) = result;
  return result;
}

uint64_t (*MacPillMetric.isCollaboration.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

void MacPillMetric.clientMaxWidth.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 16) = a1;
}

uint64_t (*MacPillMetric.clientMaxWidth.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t MacPillMetric.availableImageCount.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t MacPillMetric.availableImageCount.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = result;
  return result;
}

uint64_t (*MacPillMetric.availableImageCount.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t MacPillMetric.maxImageCount.getter()
{
  return 3;
}

uint64_t MacPillMetric.maxNameCount.getter(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return 3;
  else
    return 1;
}

uint64_t MacPillMetric.shouldDisplayPin.getter()
{
  return 1;
}

double MacPillMetric.maximumWidth.getter()
{
  return 320.0;
}

double MacPillMetric.labelHorizontalMargins.getter()
{
  return 0.0;
}

double MacPillMetric.avatarDiameter.getter()
{
  return 12.0;
}

double MacPillMetric.avatarOverlapKnockoutWidth.getter(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  if (a3 < 2)
    return 0.0;
  else
    return SLRoundToScale(0.75, (double)objc_msgSend(a1, sel_displayScale, v3, v4));
}

uint64_t MacPillMetric.useDoubleLineLabel.getter()
{
  return 0;
}

double MacPillMetric.chevronSize.getter()
{
  return 7.0;
}

uint64_t protocol witness for HighlightPillMetricVariant.textPrefix.getter in conformance MacPillMetric()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t protocol witness for HighlightPillMetricVariant.maxNameCount.getter in conformance MacPillMetric()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 8))
    return 3;
  else
    return 1;
}

uint64_t protocol witness for HighlightPillMetricVariant.finalImageCount.getter in conformance MacPillMetric()
{
  uint64_t v0;

  if (*(uint64_t *)(v0 + 24) >= 3)
    return 3;
  else
    return *(_QWORD *)(v0 + 24);
}

double protocol witness for HighlightPillMetricVariant.labelHorizontalMargins.getter in conformance MacPillMetric()
{
  return 0.0;
}

double protocol witness for HighlightPillMetricVariant.avatarDiameter.getter in conformance MacPillMetric()
{
  return 12.0;
}

double protocol witness for HighlightPillMetricVariant.overlappedAvatarVisibleWidth.getter in conformance MacPillMetric()
{
  id *v0;

  return SLRoundToScale(9.0, (double)objc_msgSend(*v0, sel_displayScale));
}

void protocol witness for HighlightPillMetricVariant.avatarContainerWidth.getter in conformance MacPillMetric()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  if (v1 >= 3)
    v1 = 3;
  if (__OFSUB__(v1, 1))
    __break(1u);
  else
    SLRoundToScale(9.0, (double)objc_msgSend(*(id *)v0, sel_displayScale));
}

double protocol witness for HighlightPillMetricVariant.avatarOverlapKnockoutWidth.getter in conformance MacPillMetric()
{
  uint64_t v0;

  if (*(uint64_t *)(v0 + 24) < 2)
    return 0.0;
  else
    return SLRoundToScale(0.75, (double)objc_msgSend(*(id *)v0, sel_displayScale));
}

CTFontRef protocol witness for HighlightPillMetricVariant.baseFont.getter in conformance MacPillMetric()
{
  void **v0;

  return specialized HighlightPillMetricVariant.baseFont.getter(*v0);
}

CTFontRef protocol witness for HighlightPillMetricVariant.senderFont.getter in conformance MacPillMetric()
{
  void **v0;

  return specialized HighlightPillMetricVariant.senderFont.getter(*v0);
}

uint64_t protocol witness for HighlightPillMetricVariant.chevronFontDescriptor.getter in conformance MacPillMetric()
{
  void **v0;

  return specialized HighlightPillMetricVariant.chevronFontDescriptor.getter(*v0);
}

double protocol witness for HighlightPillMetricVariant.chevronSize.getter in conformance MacPillMetric()
{
  return 7.0;
}

uint64_t (*MacSafariBannerPillMetrics.style.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t MacSafariBannerPillMetrics.isCollaboration.getter(uint64_t a1, char a2)
{
  return a2 & 1;
}

uint64_t (*MacSafariBannerPillMetrics.isCollaboration.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t (*MacSafariBannerPillMetrics.clientMaxWidth.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t MacSafariBannerPillMetrics.availableImageCount.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t (*MacSafariBannerPillMetrics.availableImageCount.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

double MacSafariBannerPillMetrics.maximumWidth.getter()
{
  return 500.0;
}

double MacSafariBannerPillMetrics.pillMargins.getter()
{
  return 4.0;
}

double MacSafariBannerPillMetrics.labelHorizontalMargins.getter()
{
  return 0.0;
}

double MacSafariBannerPillMetrics.avatarDiameter.getter()
{
  return 16.0;
}

double MacSafariBannerPillMetrics.avatarOverlapKnockoutWidth.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result;

  result = 0.0;
  if (a3 > 1)
    return 1.0;
  return result;
}

CTFontRef MacSafariBannerPillMetrics.baseFont.getter(void *a1)
{
  uint64_t inited;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  Class isa;
  void *v9;
  const __CTFontDescriptor *v10;
  CTFontRef v11;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef : Int])>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_199FA7E60;
  v3 = (void *)*MEMORY[0x1E0CA8418];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CA8418];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Int)>);
  v4 = swift_initStackObject();
  *(_OWORD *)(v4 + 16) = xmmword_199FA7E60;
  v5 = (void *)*MEMORY[0x1E0CA8400];
  *(_QWORD *)(v4 + 32) = *MEMORY[0x1E0CA8400];
  *(_QWORD *)(v4 + 40) = 0x8000;
  v6 = v3;
  v7 = v5;
  *(_QWORD *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v4);
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef : Int]);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t (*)(uint64_t))type metadata accessor for CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v9 = (void *)CTContentSizeCategoryForSlotStyle(a1);
  v10 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  v11 = CTFontCreateWithFontDescriptor(v10, 0.0, 0);

  return v11;
}

CTFontRef MacSafariBannerPillMetrics.senderFont.getter(void *a1)
{
  uint64_t inited;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  Class isa;
  id v14;
  const __CTFontDescriptor *v15;
  CTFontRef v16;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef : Any])>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_199FA7E60;
  v3 = (void *)*MEMORY[0x1E0CA8418];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CA8418];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Any)>);
  v4 = swift_initStackObject();
  *(_OWORD *)(v4 + 16) = xmmword_199FA7840;
  v5 = (void *)*MEMORY[0x1E0CA8400];
  v6 = MEMORY[0x1E0DEB418];
  *(_QWORD *)(v4 + 32) = *MEMORY[0x1E0CA8400];
  *(_QWORD *)(v4 + 40) = 32770;
  v7 = (void *)*MEMORY[0x1E0CA84E8];
  v8 = (uint64_t *)MEMORY[0x1E0CA84D8];
  *(_QWORD *)(v4 + 64) = v6;
  *(_QWORD *)(v4 + 72) = v7;
  v9 = *v8;
  *(_QWORD *)(v4 + 104) = MEMORY[0x1E0DEF040];
  *(_QWORD *)(v4 + 80) = v9;
  v10 = v3;
  v11 = v5;
  v12 = v7;
  *(_QWORD *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v4);
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef : Any]);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t (*)(uint64_t))type metadata accessor for CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(a1, sel_fontContentSizeCategory);
  v15 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  v16 = CTFontCreateWithFontDescriptor(v15, 0.0, 0);

  return v16;
}

double protocol witness for HighlightPillMetricVariant.maximumWidth.getter in conformance MacSafariBannerPillMetrics()
{
  return 500.0;
}

double protocol witness for HighlightPillMetricVariant.labelHorizontalMargins.getter in conformance MacSafariBannerPillMetrics()
{
  return 0.0;
}

double protocol witness for HighlightPillMetricVariant.overlappedAvatarVisibleWidth.getter in conformance MacSafariBannerPillMetrics()
{
  id *v0;

  return SLRoundToScale(12.0, (double)objc_msgSend(*v0, sel_displayScale));
}

void protocol witness for HighlightPillMetricVariant.avatarContainerWidth.getter in conformance MacSafariBannerPillMetrics()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  if (v1 >= 3)
    v1 = 3;
  if (__OFSUB__(v1, 1))
    __break(1u);
  else
    SLRoundToScale(12.0, (double)objc_msgSend(*(id *)v0, sel_displayScale));
}

double protocol witness for HighlightPillMetricVariant.avatarOverlapKnockoutWidth.getter in conformance MacSafariBannerPillMetrics()
{
  uint64_t v0;
  double result;

  result = 0.0;
  if (*(uint64_t *)(v0 + 24) > 1)
    return 1.0;
  return result;
}

CTFontRef protocol witness for HighlightPillMetricVariant.baseFont.getter in conformance MacSafariBannerPillMetrics()
{
  void **v0;

  return MacSafariBannerPillMetrics.baseFont.getter(*v0);
}

CTFontRef protocol witness for HighlightPillMetricVariant.senderFont.getter in conformance MacSafariBannerPillMetrics()
{
  void **v0;

  return MacSafariBannerPillMetrics.senderFont.getter(*v0);
}

double protocol witness for HighlightPillMetricVariant.pillMargins.getter in conformance MacSafariBannerPillMetrics()
{
  return 4.0;
}

uint64_t (*iOSSafariBannerPillMetrics.style.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t iOSSafariBannerPillMetrics.isCollaboration.getter(uint64_t a1, char a2)
{
  return a2 & 1;
}

uint64_t (*iOSSafariBannerPillMetrics.isCollaboration.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t (*iOSSafariBannerPillMetrics.clientMaxWidth.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t iOSSafariBannerPillMetrics.availableImageCount.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t (*iOSSafariBannerPillMetrics.availableImageCount.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

double iOSSafariBannerPillMetrics.labelHorizontalMargins.getter()
{
  return 0.0;
}

double iOSSafariBannerPillMetrics.avatarDiameter.getter()
{
  return 35.0;
}

double protocol witness for HighlightPillMetricVariant.labelHorizontalMargins.getter in conformance iOSSafariBannerPillMetrics()
{
  return 0.0;
}

double protocol witness for HighlightPillMetricVariant.avatarDiameter.getter in conformance iOSSafariBannerPillMetrics()
{
  return 35.0;
}

double protocol witness for HighlightPillMetricVariant.overlappedAvatarVisibleWidth.getter in conformance iOSSafariBannerPillMetrics()
{
  id *v0;

  return SLRoundToScale(26.25, (double)objc_msgSend(*v0, sel_displayScale));
}

void protocol witness for HighlightPillMetricVariant.avatarContainerWidth.getter in conformance iOSSafariBannerPillMetrics()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  if (v1 >= 3)
    v1 = 3;
  if (__OFSUB__(v1, 1))
    __break(1u);
  else
    SLRoundToScale(26.25, (double)objc_msgSend(*(id *)v0, sel_displayScale));
}

BOOL SLHighlightPillMetricVariant.isMacOS.getter(uint64_t a1)
{
  return ((a1 - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

id PillMetrics.__allocating_init(slotStyle:tag:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithSlotStyle_tag_variant_, a1, a2, objc_msgSend(a2, sel_variant));

  return v5;
}

id PillMetrics.init(slotStyle:tag:)(void *a1, id a2)
{
  void *v2;
  id v5;

  v5 = objc_msgSend(v2, sel_initWithSlotStyle_tag_variant_, a1, a2, objc_msgSend(a2, sel_variant));

  return v5;
}

uint64_t PillMetrics.__allocating_init(slotStyle:tag:variant:)(void *a1, void *a2, uint64_t a3)
{
  objc_class *v3;
  id v7;
  uint64_t v8;

  v7 = objc_allocWithZone(v3);
  v8 = specialized PillMetrics.init(slotStyle:tag:variant:)(a1, a2, a3);

  return v8;
}

uint64_t PillMetrics.init(slotStyle:tag:variant:)(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;

  v5 = specialized PillMetrics.init(slotStyle:tag:variant:)(a1, a2, a3);

  return v5;
}

void static PillMetrics.localizedFromSenderAttributedString(for:prefix:multiline:maxSenderNames:localization:)(void *a1, char a2, int a3, uint64_t a4, uint64_t a5, void *a6)
{
  specialized static PillMetrics.localizedFromSenderAttributedString(for:prefix:multiline:maxSenderNames:localization:)(a1, a2 & 1, a3, a4, a5, a6);
}

uint64_t static PillMetrics.truncatedLine(from:maxWidth:)(const __CFAttributedString *a1)
{
  CTLineRef v1;
  uint64_t TruncatedLineWithTokenHandler;

  v1 = CTLineCreateWithAttributedString(a1);
  TruncatedLineWithTokenHandler = CTLineCreateTruncatedLineWithTokenHandler();

  return TruncatedLineWithTokenHandler;
}

__n128 PillMetrics.pillMetrics.getter@<Q0>(uint64_t a1@<X8>)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char v5;
  __n128 result;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __n128 v12;
  __int128 v13;
  _OWORD v14[8];
  _QWORD v15[16];
  _BYTE v16[128];
  _QWORD v17[16];
  _BYTE v18[8];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __n128 v25;
  uint64_t v26;

  v3 = (uint64_t)&v1[OBJC_IVAR___SLHighlightPillMetrics____lazy_storage___pillMetrics];
  outlined init with take of SLDHighlightPillMetrics?((uint64_t)&v1[OBJC_IVAR___SLHighlightPillMetrics____lazy_storage___pillMetrics], (uint64_t)v17);
  outlined init with take of SLDHighlightPillMetrics?((uint64_t)v17, (uint64_t)v18);
  if (_s11SocialLayer23SLDHighlightPillMetrics33_00C2B47D0280335DFFDBB3BC8927527ALLVSgWOg((uint64_t)v18) == 1)
  {
    closure #1 in PillMetrics.pillMetrics.getter(v1, (uint64_t)v16);
    v14[4] = *(_OWORD *)&v16[64];
    v14[5] = *(_OWORD *)&v16[80];
    v14[6] = *(_OWORD *)&v16[96];
    v14[7] = *(_OWORD *)&v16[112];
    v14[0] = *(_OWORD *)v16;
    v14[1] = *(_OWORD *)&v16[16];
    v14[2] = *(_OWORD *)&v16[32];
    v14[3] = *(_OWORD *)&v16[48];
    destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors(v14);
    outlined init with take of SLDHighlightPillMetrics?(v3, (uint64_t)v15);
    outlined init with take of SLDHighlightPillMetrics?((uint64_t)v14, v3);
    outlined retain of SLDHighlightPillMetrics((uint64_t)v16);
    outlined release of SLDHighlightPillMetrics?(v15, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of SLDHighlightPillMetrics?);
    v4 = *(_QWORD *)&v16[120];
    v12 = *(__n128 *)&v16[104];
    v13 = *(_OWORD *)&v16[88];
    v10 = *(_OWORD *)&v16[56];
    v11 = *(_OWORD *)&v16[72];
    v8 = *(_OWORD *)&v16[8];
    v9 = *(_OWORD *)&v16[40];
    v7 = *(_OWORD *)&v16[24];
    v5 = v16[0];
  }
  else
  {
    v4 = v26;
    v12 = v25;
    v13 = v24;
    v10 = v22;
    v11 = v23;
    v8 = v19;
    v9 = v21;
    v7 = v20;
    v5 = v18[0];
  }
  outlined release of SLDHighlightPillMetrics?(v17, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of SLDHighlightPillMetrics?);
  *(_BYTE *)a1 = v5;
  *(_OWORD *)(a1 + 8) = v8;
  *(_OWORD *)(a1 + 24) = v7;
  *(_OWORD *)(a1 + 40) = v9;
  *(_OWORD *)(a1 + 56) = v10;
  *(_OWORD *)(a1 + 72) = v11;
  *(_OWORD *)(a1 + 88) = v13;
  result = v12;
  *(__n128 *)(a1 + 104) = v12;
  *(_QWORD *)(a1 + 120) = v4;
  return result;
}

void closure #1 in PillMetrics.pillMetrics.getter(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  double v40;
  char v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  uint64_t v50;
  double v51;
  char v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const __CFAttributedString *v59;
  uint64_t v60;
  double v61;
  id v62;
  unint64_t v63;
  uint64_t v64;
  const __CTLine *TruncatedLineWithTokenHandler;
  const __CTLine *v66;
  id v67;
  void *v68;
  double v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  double v73;
  uint64_t v74;
  double v75;
  uint64_t v76;
  uint64_t v77;
  double v78;
  char v79;
  void *v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const __CFAttributedString *v86;
  uint64_t v87;
  double v88;
  uint64_t (*v89)(uint64_t, _QWORD);
  id v90;
  uint64_t v91;
  double v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  id v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  const __CFAttributedString *v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  void *v107;
  void *v108;
  unint64_t v109;
  unint64_t v110;
  const __CFAttributedString *v111;
  const __CFAttributedString *v112;
  uint64_t v113;
  double v114;
  uint64_t (*v115)(uint64_t, _QWORD);
  id v116;
  uint64_t v117;
  double v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  id v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  id v133;
  const __CFAttributedString *v134;
  CTLineRef v135;
  double width;
  double height;
  uint64_t v138;
  double v139;
  double v140;
  uint64_t v141;
  double v142;
  double v143;
  double v144;
  double v145;
  CTLineRef v146;
  CTLineRef v147;
  const __CTLine *v148;
  CTLineRef v149;
  const __CTLine *v150;
  CGFloat v151;
  CGFloat x;
  CGFloat y;
  CGFloat v154;
  CGFloat v155;
  double v156;
  CGFloat v157;
  double v158;
  double v159;
  double v160;
  double v161;
  id v162;
  const __CTLine *v163;
  uint64_t v164;
  double v165;
  double v166;
  uint64_t v167;
  double v168;
  double v169;
  double v170;
  void *v171;
  void *v172;
  double v173;
  double v174;
  double v175;
  double v176;
  uint64_t v177;
  double v178;
  double v179;
  const __CFAttributedString *v180;
  double v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  _QWORD v191[3];
  uint64_t v192;
  double v193;
  double v194;
  double v195;
  const __CTLine *v196;
  void *v197;
  uint64_t v198;
  double v199;
  double v200;
  uint64_t v201;
  double v202;
  double v203;
  uint64_t v204;
  _QWORD v205[3];
  uint64_t v206;
  double v207;
  double v208;
  double v209;
  const __CTLine *v210;
  void *v211;
  uint64_t v212;
  double v213;
  double v214;
  uint64_t v215;
  double v216;
  double v217;
  uint64_t v218;
  _QWORD v219[3];
  uint64_t v220;
  uint64_t v221;
  char v222;
  CGRect BoundsWithOptions;
  CGRect v224;
  CGRect v225;
  CGRect v226;
  CGRect v227;
  CGRect v228;
  CGRect v229;

  v4 = type metadata accessor for AttributedString();
  MEMORY[0x1E0C80A78](v4);
  v5 = (uint64_t)&a1[OBJC_IVAR___SLHighlightPillMetrics_metrics];
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)&a1[OBJC_IVAR___SLHighlightPillMetrics_metrics], (uint64_t)v205);
  v6 = v206;
  v7 = v207;
  __swift_project_boxed_opaque_existential_1(v205, v206);
  v8 = (*(double (**)(uint64_t, double))(*(_QWORD *)&v7 + 168))(v6, COERCE_DOUBLE(*(_QWORD *)&v7));
  v184 = v9;
  v185 = v8;
  v11 = v10;
  v187 = v12;
  v13 = OBJC_IVAR___SLHighlightPillMetrics_tag;
  objc_msgSend(*(id *)&a1[OBJC_IVAR___SLHighlightPillMetrics_tag], sel_maxWidth);
  v15 = v14;
  objc_msgSend(a1, sel_avatarKnockoutWidth);
  v183 = v16;
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v191);
  v17 = v192;
  v18 = v193;
  __swift_project_boxed_opaque_existential_1(v191, v192);
  v188 = (*(double (**)(uint64_t, double))(*(_QWORD *)&v18 + 88))(v17, COERCE_DOUBLE(*(_QWORD *)&v18));
  v20 = v19;
  v22 = v21;
  v24 = v23;
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v219);
  v25 = v220;
  v26 = v221;
  __swift_project_boxed_opaque_existential_1(v219, v220);
  v186 = (*(double (**)(uint64_t, uint64_t))(v26 + 192))(v25, v26);
  v182 = v27;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v219);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v191);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
  objc_msgSend(a1, sel_specMaxWidth);
  v29 = v28;
  objc_msgSend(*(id *)&a1[v13], sel_maxWidth);
  v31 = v30;
  objc_msgSend(a1, sel_avatarContainerWidth);
  v33 = v32;
  objc_msgSend(*(id *)&a1[v13], sel_maxWidth);
  if (v34 <= 0.0)
  {
    TruncatedLineWithTokenHandler = 0;
    v68 = 0;
    v69 = 0.0;
    v70 = v182;
    v71 = v183;
    v72 = v188;
    v73 = v20;
    v74 = v22;
    v76 = v184;
    v75 = v185;
LABEL_58:
    *(_BYTE *)a2 = v34 > 0.0;
    *(double *)(a2 + 8) = v75;
    *(double *)(a2 + 16) = v11;
    *(_QWORD *)(a2 + 24) = v76;
    *(double *)(a2 + 32) = v187;
    *(double *)(a2 + 40) = v15;
    *(double *)(a2 + 48) = v69;
    *(_QWORD *)(a2 + 56) = TruncatedLineWithTokenHandler;
    *(_QWORD *)(a2 + 64) = v68;
    *(_QWORD *)(a2 + 72) = v71;
    *(double *)(a2 + 80) = v72;
    *(double *)(a2 + 88) = v73;
    *(_QWORD *)(a2 + 96) = v74;
    *(double *)(a2 + 104) = v24;
    *(double *)(a2 + 112) = v186;
    *(_QWORD *)(a2 + 120) = v70;
    return;
  }
  v175 = v34;
  v179 = v11;
  if (v31 >= v29)
    v35 = v29;
  else
    v35 = v31;
  v222 = 1;
  v173 = v187 + v186 + v24 + v20 + v11 + v33;
  v36 = v35 - v173;
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
  v37 = v206;
  v38 = v207;
  __swift_project_boxed_opaque_existential_1(v205, v206);
  (*(void (**)(uint64_t, double))(*(_QWORD *)&v38 + 128))(v37, COERCE_DOUBLE(*(_QWORD *)&v38));
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
  v39 = v206;
  v40 = v207;
  __swift_project_boxed_opaque_existential_1(v205, v206);
  v41 = (*(uint64_t (**)(uint64_t, double))(*(_QWORD *)&v40 + 128))(v39, COERCE_DOUBLE(*(_QWORD *)&v40));
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
  if ((v41 & 1) == 0)
  {
    v178 = v20;
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
    v77 = v206;
    v78 = v207;
    __swift_project_boxed_opaque_existential_1(v205, v206);
    v79 = (*(uint64_t (**)(uint64_t, double))(*(_QWORD *)&v78 + 144))(v77, COERCE_DOUBLE(*(_QWORD *)&v78));
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
    v80 = *(void **)&a1[v13];
    v177 = v22;
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
    if ((v79 & 1) != 0)
    {
      v81 = v80;
      specialized static PillMetrics.localizedSenderOrNumContactsString(for:metrics:)(v81, v205);
      v83 = v82;
      v85 = v84;

      __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
      outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
      v86 = (const __CFAttributedString *)specialized static PillMetrics.senderNameAttributedString(for:metrics:)(v83, v85, v205);
      swift_bridgeObjectRelease();
    }
    else
    {
      v113 = v206;
      v114 = v207;
      __swift_project_boxed_opaque_existential_1(v205, v206);
      v115 = *(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)&v114 + 16);
      v116 = v80;
      LOBYTE(v113) = v115(v113, *(_QWORD *)&v114) & 1;
      outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v191);
      v117 = v192;
      v118 = v193;
      __swift_project_boxed_opaque_existential_1(v191, v192);
      v119 = (*(uint64_t (**)(uint64_t, double))(*(_QWORD *)&v118 + 40))(v117, COERCE_DOUBLE(*(_QWORD *)&v118));
      outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v219);
      v120 = v220;
      v121 = v221;
      __swift_project_boxed_opaque_existential_1(v219, v220);
      v122 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v121 + 24))(v120, v121);
      v123 = objc_msgSend(v122, sel_localization);

      v124 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v126 = v125;

      specialized static PillMetrics.localizedFromSenderAttributedString(for:prefix:multiline:maxSenderNames:localization:)(v116, v113, 0, v119, v124, v126);
      v128 = v127;
      v130 = v129;
      v132 = v131;
      swift_bridgeObjectRelease();

      __swift_destroy_boxed_opaque_existential_0((uint64_t)v219);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v191);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
      outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
      v133 = v128;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      specialized static PillMetrics.fromSenderAttributedString(for:metrics:multiline:)(v133, v130, v132, v205);
      v86 = v134;

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
    v44 = v188;
    v176 = v24;
    v135 = CTLineCreateWithAttributedString(v86);
    TruncatedLineWithTokenHandler = (const __CTLine *)CTLineCreateTruncatedLineWithTokenHandler();

    if (TruncatedLineWithTokenHandler)
    {
      BoundsWithOptions = CTLineGetBoundsWithOptions(TruncatedLineWithTokenHandler, 0);
      width = BoundsWithOptions.size.width;
      height = BoundsWithOptions.size.height;
    }
    else
    {
      width = 0.0;
      height = 0.0;
    }
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
    v138 = v206;
    v139 = v207;
    __swift_project_boxed_opaque_existential_1(v205, v206);
    v140 = height
         + (*(double (**)(uint64_t, double))(*(_QWORD *)&v139 + 168))(v138, COERCE_DOUBLE(*(_QWORD *)&v139));
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
    v141 = v206;
    v142 = v207;
    __swift_project_boxed_opaque_existential_1(v205, v206);
    (*(void (**)(uint64_t, double))(*(_QWORD *)&v142 + 168))(v141, COERCE_DOUBLE(*(_QWORD *)&v142));
    v144 = v143;

    v145 = v140 + v144;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
    v68 = 0;
    goto LABEL_57;
  }
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
  v42 = v206;
  v43 = v207;
  __swift_project_boxed_opaque_existential_1(v205, v206);
  v44 = (*(double (**)(uint64_t, double))(*(_QWORD *)&v43 + 88))(v42, COERCE_DOUBLE(*(_QWORD *)&v43));
  v178 = v45;
  v47 = v46;
  v49 = v48;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
  v50 = v206;
  v51 = v207;
  __swift_project_boxed_opaque_existential_1(v205, v206);
  v52 = (*(uint64_t (**)(uint64_t, double))(*(_QWORD *)&v51 + 144))(v50, COERCE_DOUBLE(*(_QWORD *)&v51));
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
  v53 = *(void **)&a1[v13];
  v176 = v49;
  v177 = v47;
  if ((v52 & 1) == 0)
  {
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
    v87 = v206;
    v88 = v207;
    __swift_project_boxed_opaque_existential_1(v205, v206);
    v89 = *(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)&v88 + 16);
    v90 = v53;
    LOBYTE(v87) = v89(v87, *(_QWORD *)&v88) & 1;
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v191);
    v91 = v192;
    v92 = v193;
    __swift_project_boxed_opaque_existential_1(v191, v192);
    v93 = (*(uint64_t (**)(uint64_t, double))(*(_QWORD *)&v92 + 40))(v91, COERCE_DOUBLE(*(_QWORD *)&v92));
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v219);
    v94 = v220;
    v95 = v221;
    __swift_project_boxed_opaque_existential_1(v219, v220);
    v96 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v95 + 24))(v94, v95);
    v97 = objc_msgSend(v96, sel_localization);

    v98 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v100 = v99;

    specialized static PillMetrics.localizedFromSenderAttributedString(for:prefix:multiline:maxSenderNames:localization:)(v90, v87, 1, v93, v98, v100);
    v102 = v101;
    v59 = v103;
    v105 = v104;
    swift_bridgeObjectRelease();

    __swift_destroy_boxed_opaque_existential_0((uint64_t)v219);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v191);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
    v106 = v102;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    specialized static PillMetrics.fromSenderAttributedString(for:metrics:multiline:)(v106, (uint64_t)v59, v105, v205);
    v108 = v107;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
    v171 = v108;
    attributedStringSplitByLineBreak(inString:)(v108);
    v110 = v109;
    if (v109 >> 62)
    {
      swift_bridgeObjectRetain();
      v63 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      v63 = *(_QWORD *)((v109 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v189 = v44;
    v172 = v106;
    if ((uint64_t)v63 < 1)
    {
      type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSAttributedString);
      AttributedString.init(stringLiteral:)();
      v180 = (const __CFAttributedString *)NSAttributedString.init(_:)();
    }
    else if ((v110 & 0xC000000000000001) != 0)
    {
      v180 = (const __CFAttributedString *)MEMORY[0x19AEC3E78](0, v110);
      if (v63 > 1)
      {
        v111 = (const __CFAttributedString *)MEMORY[0x19AEC3E78](1, v110);
LABEL_27:
        v112 = v111;
        swift_bridgeObjectRelease();
LABEL_36:
        v147 = CTLineCreateWithAttributedString(v180);
        TruncatedLineWithTokenHandler = (const __CTLine *)CTLineCreateTruncatedLineWithTokenHandler();

        v148 = TruncatedLineWithTokenHandler;
        v149 = CTLineCreateWithAttributedString(v112);
        v68 = (void *)CTLineCreateTruncatedLineWithTokenHandler();

        v150 = v68;
        v151 = 0.0;
        x = 0.0;
        y = 0.0;
        width = 0.0;
        v154 = 0.0;
        if (v148)
        {
          v224 = CTLineGetBoundsWithOptions(v148, 0);
          x = v224.origin.x;
          y = v224.origin.y;
          width = v224.size.width;
          v154 = v224.size.height;

        }
        v155 = 0.0;
        v156 = 0.0;
        v157 = 0.0;
        if (v150)
        {
          v225 = CTLineGetBoundsWithOptions(v150, 0);
          v151 = v225.origin.x;
          v155 = v225.origin.y;
          v156 = v225.size.width;
          v157 = v225.size.height;

        }
        v226.origin.x = x;
        v226.origin.y = y;
        v226.size.width = width;
        v226.size.height = v154;
        v158 = CGRectGetHeight(v226);
        v227.origin.x = v151;
        v227.origin.y = v155;
        v227.size.width = v156;
        v227.size.height = v157;
        v159 = CGRectGetHeight(v227);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        v160 = v158 + v159;
        v44 = v189;
        goto LABEL_54;
      }
    }
    else
    {
      if (!*(_QWORD *)((v110 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_45;
      }
      v180 = (const __CFAttributedString *)*(id *)(v110 + 32);
      if (v63 > 1)
      {
        if (*(_QWORD *)((v110 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL)
        {
LABEL_62:
          __break(1u);
          goto LABEL_63;
        }
        v111 = (const __CFAttributedString *)*(id *)(v110 + 40);
        goto LABEL_27;
      }
    }
    swift_bridgeObjectRelease();
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSAttributedString);
    AttributedString.init(stringLiteral:)();
    v112 = (const __CFAttributedString *)NSAttributedString.init(_:)();
    goto LABEL_36;
  }
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
  v54 = v53;
  specialized static PillMetrics.localizedSenderOrNumContactsString(for:metrics:)(v54, v205);
  v56 = v55;
  v58 = v57;

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
  v59 = (const __CFAttributedString *)specialized static PillMetrics.senderNameAttributedString(for:metrics:)(v56, v58, v205);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
  v60 = v206;
  v61 = v207;
  __swift_project_boxed_opaque_existential_1(v205, v206);
  LOBYTE(v54) = (*(uint64_t (**)(uint64_t, double))(*(_QWORD *)&v61 + 136))(v60, COERCE_DOUBLE(*(_QWORD *)&v61));
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
  if ((v54 & 1) == 0)
  {
    v146 = CTLineCreateWithAttributedString(v59);
    TruncatedLineWithTokenHandler = (const __CTLine *)CTLineCreateTruncatedLineWithTokenHandler();

LABEL_48:
    v68 = 0;
    goto LABEL_49;
  }
  v62 = *(id *)&a1[OBJC_IVAR___SLHighlightPillMetrics_style];
  v63 = (unint64_t)specialized static PillMetrics.senderLabelMultilineWithLineWrap(fullString:maxLineWidth:style:)(v59, v62, v36);

  if (!(v63 >> 62))
  {
    v64 = *(_QWORD *)((v63 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v64 >= 1)
      goto LABEL_10;
LABEL_46:
    TruncatedLineWithTokenHandler = 0;
    goto LABEL_47;
  }
LABEL_45:
  swift_bridgeObjectRetain();
  v64 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v64 < 1)
    goto LABEL_46;
LABEL_10:
  if ((v63 & 0xC000000000000001) != 0)
  {
    TruncatedLineWithTokenHandler = (const __CTLine *)MEMORY[0x19AEC3E78](0, v63);
    if ((unint64_t)v64 > 1)
    {
      v67 = (id)MEMORY[0x19AEC3E78](1, v63);
      goto LABEL_15;
    }
    goto LABEL_47;
  }
  if (!*(_QWORD *)((v63 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_62;
  }
  TruncatedLineWithTokenHandler = *(const __CTLine **)(v63 + 32);
  v66 = TruncatedLineWithTokenHandler;
  if ((unint64_t)v64 <= 1)
  {
LABEL_47:
    swift_bridgeObjectRelease();
    goto LABEL_48;
  }
  if (*(_QWORD *)((v63 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
  {
    v67 = *(id *)(v63 + 40);
LABEL_15:
    v68 = v67;
    swift_bridgeObjectRelease();
LABEL_49:
    v156 = 0.0;
    width = 0.0;
    if (TruncatedLineWithTokenHandler)
    {
      v228 = CTLineGetBoundsWithOptions(TruncatedLineWithTokenHandler, 0);
      width = v228.size.width;
    }
    if (v68)
    {
      v229 = CTLineGetBoundsWithOptions((CTLineRef)v68, 0);
      v156 = v229.size.width;
    }
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
    specialized static PillMetrics.doubleLineFontHeight(for:)(v205);
    v160 = v161;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);

LABEL_54:
    if (width <= v156)
      width = v156;
    v162 = v68;
    v163 = TruncatedLineWithTokenHandler;
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
    v164 = v206;
    v165 = v207;
    __swift_project_boxed_opaque_existential_1(v205, v206);
    v166 = v160
         + (*(double (**)(uint64_t, double))(*(_QWORD *)&v165 + 168))(v164, COERCE_DOUBLE(*(_QWORD *)&v165));
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
    v167 = v206;
    v168 = v207;
    __swift_project_boxed_opaque_existential_1(v205, v206);
    (*(void (**)(uint64_t, double))(*(_QWORD *)&v168 + 168))(v167, COERCE_DOUBLE(*(_QWORD *)&v168));
    v170 = v169;

    v145 = v166 + v170;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
LABEL_57:
    v181 = v145;
    v190 = v44;
    LOBYTE(v191[0]) = 1;
    v76 = v184;
    v75 = v185;
    *(double *)&v191[1] = v185;
    *(double *)&v191[2] = v179;
    v192 = v184;
    v193 = v187;
    v195 = v145;
    v174 = v173 + width;
    v194 = v174;
    v196 = TruncatedLineWithTokenHandler;
    v197 = v68;
    v70 = v182;
    v71 = v183;
    v198 = v183;
    v199 = v44;
    v73 = v178;
    v200 = v178;
    v201 = v177;
    v24 = v176;
    v202 = v176;
    v203 = v186;
    v204 = v182;
    LOBYTE(v205[0]) = v222;
    *(double *)&v205[1] = v185;
    *(double *)&v205[2] = v179;
    v206 = v184;
    v207 = v187;
    v208 = v174;
    v209 = v181;
    v210 = TruncatedLineWithTokenHandler;
    v211 = v68;
    v212 = v183;
    v213 = v190;
    v214 = v178;
    v215 = v177;
    v216 = v176;
    v217 = v186;
    v218 = v182;
    outlined retain of SLDHighlightPillMetrics((uint64_t)v191);
    outlined release of SLDHighlightPillMetrics((uint64_t)v205);
    v72 = v190;
    v69 = v181;
    v74 = v177;
    v11 = v179;
    v15 = v174;
    v34 = v175;
    goto LABEL_58;
  }
LABEL_63:
  __break(1u);
}

id PillMetrics.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void PillMetrics.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id PillMetrics.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PillMetrics();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

double PillMetrics.margins.getter()
{
  _QWORD v1[2];

  PillMetrics.pillMetrics.getter((uint64_t)v1);
  outlined release of SLDHighlightPillMetrics((uint64_t)v1);
  return *(double *)&v1[1];
}

double PillMetrics.pillSize.getter()
{
  _QWORD v1[6];

  PillMetrics.pillMetrics.getter((uint64_t)v1);
  outlined release of SLDHighlightPillMetrics((uint64_t)v1);
  return *(double *)&v1[5];
}

uint64_t PillMetrics.hasValidMetricsForDrawing.getter()
{
  _BYTE v1[128];

  PillMetrics.pillMetrics.getter((uint64_t)v1);
  outlined release of SLDHighlightPillMetrics((uint64_t)v1);
  return v1[0];
}

id PillMetrics.firstLine.getter()
{
  id v0;
  id v1;
  _BYTE v3[56];
  id v4;

  PillMetrics.pillMetrics.getter((uint64_t)v3);
  v0 = v4;
  v1 = v4;
  outlined release of SLDHighlightPillMetrics((uint64_t)v3);
  return v0;
}

id PillMetrics.secondLine.getter()
{
  id v0;
  id v1;
  _BYTE v3[64];
  id v4;

  PillMetrics.pillMetrics.getter((uint64_t)v3);
  v0 = v4;
  v1 = v4;
  outlined release of SLDHighlightPillMetrics((uint64_t)v3);
  return v0;
}

double PillMetrics.overlappedAvatarKnockoutBorderWidth.getter()
{
  _QWORD v1[16];

  PillMetrics.pillMetrics.getter((uint64_t)v1);
  outlined release of SLDHighlightPillMetrics((uint64_t)v1);
  return *(double *)&v1[9];
}

double PillMetrics.labelHorizontalMargins.getter()
{
  _QWORD v1[11];

  PillMetrics.pillMetrics.getter((uint64_t)v1);
  outlined release of SLDHighlightPillMetrics((uint64_t)v1);
  return *(double *)&v1[10];
}

double PillMetrics.specMaxWidth.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  double v3;
  _QWORD v5[3];
  uint64_t v6;
  uint64_t v7;

  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v5);
  v1 = v6;
  v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  v3 = (*(double (**)(uint64_t, uint64_t))(v2 + 80))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

double PillMetrics.minimumLabelHorizontalMargines.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  double v3;
  _QWORD v5[3];
  uint64_t v6;
  uint64_t v7;

  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v5);
  v1 = v6;
  v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  v3 = (*(double (**)(uint64_t, uint64_t))(v2 + 88))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

double PillMetrics.avatarDiameter.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  double v3;
  _QWORD v5[3];
  uint64_t v6;
  uint64_t v7;

  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v5);
  v1 = v6;
  v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  v3 = (*(double (**)(uint64_t, uint64_t))(v2 + 96))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

double PillMetrics.avatarContainerWidth.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  double v3;
  _QWORD v5[3];
  uint64_t v6;
  uint64_t v7;

  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v5);
  v1 = v6;
  v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  v3 = (*(double (**)(uint64_t, uint64_t))(v2 + 112))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

double PillMetrics.avatarKnockoutWidth.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  double v3;
  _QWORD v5[3];
  uint64_t v6;
  uint64_t v7;

  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v5);
  v1 = v6;
  v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  v3 = (*(double (**)(uint64_t, uint64_t))(v2 + 120))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

double PillMetrics.overlappedAvatarVisibleWidth.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  double v3;
  _QWORD v5[3];
  uint64_t v6;
  uint64_t v7;

  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v5);
  v1 = v6;
  v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  v3 = (*(double (**)(uint64_t, uint64_t))(v2 + 104))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

uint64_t PillMetrics.useDoubleLinedLabel.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[3];
  uint64_t v5;
  uint64_t v6;

  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v4);
  v1 = v5;
  v2 = v6;
  __swift_project_boxed_opaque_existential_1(v4, v5);
  LOBYTE(v1) = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 128))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return v1 & 1;
}

double PillMetrics.chevronSize.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  double v3;
  _QWORD v5[3];
  uint64_t v6;
  uint64_t v7;

  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v5);
  v1 = v6;
  v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  v3 = (*(double (**)(uint64_t, uint64_t))(v2 + 192))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

id static PillMetrics.metricsPlaceholder(for:variant:maxWidth:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  void *v5;
  uint64_t v7;
  _QWORD *v8;
  id result;

  v5 = a1;
  switch(a2)
  {
    case 0:
      *(_QWORD *)(a3 + 24) = &type metadata for iOSPillMetric;
      *(_QWORD *)(a3 + 32) = &protocol witness table for iOSPillMetric;
      goto LABEL_13;
    case 1:
      *(_QWORD *)(a3 + 24) = &type metadata for iOSPillMetric;
      *(_QWORD *)(a3 + 32) = &protocol witness table for iOSPillMetric;
      goto LABEL_16;
    case 2:
      *(_QWORD *)(a3 + 24) = &type metadata for MacPillMetric;
      *(_QWORD *)(a3 + 32) = &protocol witness table for MacPillMetric;
      goto LABEL_13;
    case 3:
      *(_QWORD *)(a3 + 24) = &type metadata for MacPillMetric;
      *(_QWORD *)(a3 + 32) = &protocol witness table for MacPillMetric;
      goto LABEL_16;
    case 4:
      *(_QWORD *)(a3 + 24) = &type metadata for MacSafariBannerPillMetrics;
      *(_QWORD *)(a3 + 32) = &protocol witness table for MacSafariBannerPillMetrics;
      goto LABEL_13;
    case 5:
      *(_QWORD *)(a3 + 24) = &type metadata for MacSafariBannerPillMetrics;
      *(_QWORD *)(a3 + 32) = &protocol witness table for MacSafariBannerPillMetrics;
      goto LABEL_16;
    case 6:
      *(_QWORD *)(a3 + 24) = &type metadata for iOSSafariBannerPillMetrics;
      *(_QWORD *)(a3 + 32) = &protocol witness table for iOSSafariBannerPillMetrics;
      goto LABEL_13;
    case 7:
      *(_QWORD *)(a3 + 24) = &type metadata for iOSSafariBannerPillMetrics;
      *(_QWORD *)(a3 + 32) = &protocol witness table for iOSSafariBannerPillMetrics;
      goto LABEL_16;
    case 8:
      *(_QWORD *)(a3 + 24) = &type metadata for TVPillMetrics;
      *(_QWORD *)(a3 + 32) = &protocol witness table for TVPillMetrics;
      *(_QWORD *)a3 = a1;
      *(double *)(a3 + 8) = a4;
      v8 = (_QWORD *)(a3 + 16);
      goto LABEL_18;
    case 9:
      *(_QWORD *)(a3 + 24) = &type metadata for VisionPillMetric;
      *(_QWORD *)(a3 + 32) = &protocol witness table for VisionPillMetric;
      goto LABEL_13;
    case 10:
      *(_QWORD *)(a3 + 24) = &type metadata for VisionPillMetric;
      *(_QWORD *)(a3 + 32) = &protocol witness table for VisionPillMetric;
      goto LABEL_16;
    case 11:
      *(_QWORD *)(a3 + 24) = &type metadata for VisionSafariBannerPillMetric;
      *(_QWORD *)(a3 + 32) = &protocol witness table for VisionSafariBannerPillMetric;
LABEL_13:
      v7 = swift_allocObject();
      v5 = a1;
      *(_QWORD *)a3 = v7;
      *(_QWORD *)(v7 + 16) = a1;
      *(_BYTE *)(v7 + 24) = 0;
      goto LABEL_17;
    case 12:
      *(_QWORD *)(a3 + 24) = &type metadata for VisionSafariBannerPillMetric;
      *(_QWORD *)(a3 + 32) = &protocol witness table for VisionSafariBannerPillMetric;
LABEL_16:
      v7 = swift_allocObject();
      v5 = a1;
      *(_QWORD *)a3 = v7;
      *(_QWORD *)(v7 + 16) = a1;
      *(_BYTE *)(v7 + 24) = 1;
LABEL_17:
      *(double *)(v7 + 32) = a4;
      v8 = (_QWORD *)(v7 + 40);
LABEL_18:
      *v8 = 1;
      result = v5;
      break;
    default:
      type metadata accessor for SLHighlightPillMetricVariant(0);
      result = (id)_diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
      __break(1u);
      break;
  }
  return result;
}

double static PillMetrics.pillHeight(style:variant:maxWidth:)(void *a1, uint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double height;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  Swift::String v24;
  Swift::String_optional v25;
  Class isa;
  void *rawValue;
  void *v28;
  objc_class *v29;
  const __CFAttributedString *v30;
  const __CFAttributedString *v31;
  const __CTLine *v32;
  _QWORD v34[3];
  uint64_t v35;
  uint64_t v36;
  Swift::tuple_localizedString_NSMutableAttributedString_baseFontTargetRanges_OpaquePointer_senderFontTargetRanges_OpaquePointer v37;
  CGRect BoundsWithOptions;

  static PillMetrics.metricsPlaceholder(for:variant:maxWidth:)(a1, a2, (uint64_t)v34, a3);
  v3 = v35;
  v4 = v36;
  __swift_project_boxed_opaque_existential_1(v34, v35);
  v5 = (*(double (**)(uint64_t, uint64_t))(v4 + 168))(v3, v4);
  v7 = v6;
  v8 = v35;
  v9 = v36;
  __swift_project_boxed_opaque_existential_1(v34, v35);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v9 + 128))(v8, v9) & 1) != 0)
  {
    specialized static PillMetrics.doubleLineFontHeight(for:)(v34);
    height = v10;
  }
  else
  {
    v12 = v35;
    v13 = v36;
    __swift_project_boxed_opaque_existential_1(v34, v35);
    v14 = (*(double (**)(uint64_t, uint64_t))(v13 + 96))(v12, v13);
    v15 = v35;
    v16 = v36;
    __swift_project_boxed_opaque_existential_1(v34, v35);
    LOBYTE(v15) = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 16))(v15, v16) & 1;
    v17 = v35;
    v18 = v36;
    __swift_project_boxed_opaque_existential_1(v34, v35);
    v19 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v18 + 24))(v17, v18);
    v20 = objc_msgSend(v19, sel_localization);

    v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v23 = v22;

    v24._countAndFlagsBits = 0x6C6F686563616C50;
    v24._object = (void *)0xEB00000000726564;
    v25.value._countAndFlagsBits = v21;
    v25.value._object = v23;
    v37 = NameAttributionLocAttributedString(prefix:name:multiline:localization:)((SocialLayer::AttributionTextPrefix)v15, v24, 0, v25);
    isa = v37.localizedString.super.super.isa;
    rawValue = v37.baseFontTargetRanges._rawValue;
    v28 = v37.senderFontTargetRanges._rawValue;
    swift_bridgeObjectRelease();
    v29 = isa;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    specialized static PillMetrics.fromSenderAttributedString(for:metrics:multiline:)(v29, (uint64_t)rawValue, (uint64_t)v28, v34);
    v31 = v30;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v32 = CTLineCreateWithAttributedString(v31);

    BoundsWithOptions = CTLineGetBoundsWithOptions(v32, 0);
    height = BoundsWithOptions.size.height;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    if (v14 > height)
      height = v14;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
  return v7 + v5 + height;
}

double static PillMetrics.pillMargins(style:variant:maxWidth:)(void *a1, uint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  static PillMetrics.metricsPlaceholder(for:variant:maxWidth:)(a1, a2, (uint64_t)v7, a3);
  v3 = v8;
  v4 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  v5 = (*(double (**)(uint64_t, uint64_t))(v4 + 168))(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v5;
}

uint64_t static PillMetrics.maxSendersToDisplay(style:variant:)(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  static PillMetrics.metricsPlaceholder(for:variant:maxWidth:)(a1, a2, (uint64_t)v9, 100.0);
  v2 = v10;
  v3 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 40))(v2, v3);
  v5 = v10;
  v6 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 48))(v5, v6);
  if (v7 > v4)
    v4 = v7;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  return v4;
}

uint64_t static PillMetrics.chevronFontDescriptor(style:variant:)(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;

  static PillMetrics.metricsPlaceholder(for:variant:maxWidth:)(a1, a2, (uint64_t)v6, 100.0);
  v2 = v7;
  v3 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 184))(v2, v3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

double static PillMetrics.chevronSize(style:variant:)(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;

  static PillMetrics.metricsPlaceholder(for:variant:maxWidth:)(a1, a2, (uint64_t)v6, 100.0);
  v2 = v7;
  v3 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  v4 = (*(double (**)(uint64_t, uint64_t))(v3 + 192))(v2, v3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

uint64_t PillMetrics.imageCount.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[3];
  uint64_t v6;
  uint64_t v7;

  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v5);
  v1 = v6;
  v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 64))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

uint64_t PillMetrics.shouldDisplayPin.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[3];
  uint64_t v5;
  uint64_t v6;

  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v4);
  v1 = v5;
  v2 = v6;
  __swift_project_boxed_opaque_existential_1(v4, v5);
  LOBYTE(v1) = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 72))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return v1 & 1;
}

uint64_t PillMetrics.chevronFontDescriptor.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[3];
  uint64_t v6;
  uint64_t v7;

  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v5);
  v1 = v6;
  v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 184))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

uint64_t PillMetrics.baseFont.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[3];
  uint64_t v6;
  uint64_t v7;

  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v5);
  v1 = v6;
  v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 152))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

uint64_t sub_199F917D8()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in MeAttributionLocAttributedString(prefix:multiline:localization:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return closure #1 in MeAttributionLocAttributedString(prefix:multiline:localization:)(a1, a2, a3, a4, *(uint64_t **)(v4 + 16), *(uint64_t **)(v4 + 24));
}

uint64_t sub_199F91800()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_199F91828()
{
  return swift_deallocObject();
}

uint64_t sub_199F91838()
{
  return swift_deallocObject();
}

uint64_t sub_199F91848()
{
  return swift_deallocObject();
}

uint64_t sub_199F91858()
{
  return swift_deallocObject();
}

uint64_t sub_199F91868()
{
  return swift_deallocObject();
}

uint64_t sub_199F91878()
{
  return swift_deallocObject();
}

uint64_t specialized PillMetrics.init(slotStyle:tag:variant:)(void *a1, void *a2, uint64_t a3)
{
  char *v3;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  char *v42;
  char *v43;
  uint64_t v44;
  id v45;
  id v46;
  uint64_t result;
  char *v48;
  objc_super v49;
  _BYTE v50[128];

  v7 = (uint64_t)&v3[OBJC_IVAR___SLHighlightPillMetrics____lazy_storage___pillMetrics];
  _s11SocialLayer23SLDHighlightPillMetrics33_00C2B47D0280335DFFDBB3BC8927527ALLVSgWOi0_((uint64_t)v50);
  outlined init with take of SLDHighlightPillMetrics?((uint64_t)v50, v7);
  switch(a3)
  {
    case 0:
      v8 = v3;
      v9 = a1;
      objc_msgSend(a2, sel_maxWidth);
      v11 = v10;
      v12 = objc_msgSend(a2, sel_maxPossibleImageCount);
      v13 = (uint64_t *)&v8[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      v13[3] = (uint64_t)&type metadata for iOSPillMetric;
      v13[4] = (uint64_t)&protocol witness table for iOSPillMetric;
      goto LABEL_13;
    case 1:
      v26 = v3;
      v21 = a1;
      objc_msgSend(a2, sel_maxWidth);
      v11 = v27;
      v12 = objc_msgSend(a2, sel_maxPossibleImageCount);
      v23 = (uint64_t *)&v26[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      v23[3] = (uint64_t)&type metadata for iOSPillMetric;
      v23[4] = (uint64_t)&protocol witness table for iOSPillMetric;
      goto LABEL_16;
    case 2:
      v24 = v3;
      v9 = a1;
      objc_msgSend(a2, sel_maxWidth);
      v11 = v25;
      v12 = objc_msgSend(a2, sel_maxPossibleImageCount);
      v13 = (uint64_t *)&v24[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      v13[3] = (uint64_t)&type metadata for MacPillMetric;
      v13[4] = (uint64_t)&protocol witness table for MacPillMetric;
      goto LABEL_13;
    case 3:
      v28 = v3;
      v21 = a1;
      objc_msgSend(a2, sel_maxWidth);
      v11 = v29;
      v12 = objc_msgSend(a2, sel_maxPossibleImageCount);
      v23 = (uint64_t *)&v28[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      v23[3] = (uint64_t)&type metadata for MacPillMetric;
      v23[4] = (uint64_t)&protocol witness table for MacPillMetric;
      goto LABEL_16;
    case 4:
      v16 = v3;
      v9 = a1;
      objc_msgSend(a2, sel_maxWidth);
      v11 = v17;
      v12 = objc_msgSend(a2, sel_maxPossibleImageCount);
      v13 = (uint64_t *)&v16[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      v13[3] = (uint64_t)&type metadata for MacSafariBannerPillMetrics;
      v13[4] = (uint64_t)&protocol witness table for MacSafariBannerPillMetrics;
      goto LABEL_13;
    case 5:
      v32 = v3;
      v21 = a1;
      objc_msgSend(a2, sel_maxWidth);
      v11 = v33;
      v12 = objc_msgSend(a2, sel_maxPossibleImageCount);
      v23 = (uint64_t *)&v32[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      v23[3] = (uint64_t)&type metadata for MacSafariBannerPillMetrics;
      v23[4] = (uint64_t)&protocol witness table for MacSafariBannerPillMetrics;
      goto LABEL_16;
    case 6:
      v34 = v3;
      v9 = a1;
      objc_msgSend(a2, sel_maxWidth);
      v11 = v35;
      v12 = objc_msgSend(a2, sel_maxPossibleImageCount);
      v13 = (uint64_t *)&v34[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      v13[3] = (uint64_t)&type metadata for iOSSafariBannerPillMetrics;
      v13[4] = (uint64_t)&protocol witness table for iOSSafariBannerPillMetrics;
      goto LABEL_13;
    case 7:
      v30 = v3;
      v21 = a1;
      objc_msgSend(a2, sel_maxWidth);
      v11 = v31;
      v12 = objc_msgSend(a2, sel_maxPossibleImageCount);
      v23 = (uint64_t *)&v30[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      v23[3] = (uint64_t)&type metadata for iOSSafariBannerPillMetrics;
      v23[4] = (uint64_t)&protocol witness table for iOSSafariBannerPillMetrics;
      goto LABEL_16;
    case 8:
      v37 = v3;
      v38 = a1;
      objc_msgSend(a2, sel_maxWidth);
      v40 = v39;
      v41 = objc_msgSend(a2, sel_maxPossibleImageCount);
      v42 = &v37[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      *(_QWORD *)v42 = v38;
      *((_QWORD *)v42 + 1) = v40;
      *((_QWORD *)v42 + 3) = &type metadata for TVPillMetrics;
      *((_QWORD *)v42 + 4) = &protocol witness table for TVPillMetrics;
      *((_QWORD *)v42 + 2) = v41;
      goto LABEL_18;
    case 9:
      v18 = v3;
      v9 = a1;
      objc_msgSend(a2, sel_maxWidth);
      v11 = v19;
      v12 = objc_msgSend(a2, sel_maxPossibleImageCount);
      v13 = (uint64_t *)&v18[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      v13[3] = (uint64_t)&type metadata for VisionPillMetric;
      v13[4] = (uint64_t)&protocol witness table for VisionPillMetric;
      goto LABEL_13;
    case 10:
      v43 = v3;
      v21 = a1;
      objc_msgSend(a2, sel_maxWidth);
      v11 = v44;
      v12 = objc_msgSend(a2, sel_maxPossibleImageCount);
      v23 = (uint64_t *)&v43[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      v23[3] = (uint64_t)&type metadata for VisionPillMetric;
      v23[4] = (uint64_t)&protocol witness table for VisionPillMetric;
      goto LABEL_16;
    case 11:
      v14 = v3;
      v9 = a1;
      objc_msgSend(a2, sel_maxWidth);
      v11 = v15;
      v12 = objc_msgSend(a2, sel_maxPossibleImageCount);
      v13 = (uint64_t *)&v14[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      v13[3] = (uint64_t)&type metadata for VisionSafariBannerPillMetric;
      v13[4] = (uint64_t)&protocol witness table for VisionSafariBannerPillMetric;
LABEL_13:
      v36 = swift_allocObject();
      *v13 = v36;
      *(_QWORD *)(v36 + 16) = v9;
      *(_BYTE *)(v36 + 24) = 0;
      goto LABEL_17;
    case 12:
      v20 = v3;
      v21 = a1;
      objc_msgSend(a2, sel_maxWidth);
      v11 = v22;
      v12 = objc_msgSend(a2, sel_maxPossibleImageCount);
      v23 = (uint64_t *)&v20[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      v23[3] = (uint64_t)&type metadata for VisionSafariBannerPillMetric;
      v23[4] = (uint64_t)&protocol witness table for VisionSafariBannerPillMetric;
LABEL_16:
      v36 = swift_allocObject();
      *v23 = v36;
      *(_QWORD *)(v36 + 16) = v21;
      *(_BYTE *)(v36 + 24) = 1;
LABEL_17:
      *(_QWORD *)(v36 + 32) = v11;
      *(_QWORD *)(v36 + 40) = v12;
LABEL_18:
      *(_QWORD *)&v3[OBJC_IVAR___SLHighlightPillMetrics_style] = a1;
      *(_QWORD *)&v3[OBJC_IVAR___SLHighlightPillMetrics_tag] = a2;
      *(_QWORD *)&v3[OBJC_IVAR___SLHighlightPillMetrics_variant] = a3;
      v45 = a1;
      v46 = a2;

      v49.receiver = v3;
      v49.super_class = (Class)type metadata accessor for PillMetrics();
      result = (uint64_t)objc_msgSendSuper2(&v49, sel_init);
      break;
    default:
      type metadata accessor for SLHighlightPillMetricVariant(0);
      v48 = v3;
      result = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
      __break(1u);
      break;
  }
  return result;
}

void specialized static PillMetrics.fromSenderAttributedString(for:metrics:multiline:)(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  id v7;
  unint64_t v8;
  int64_t v9;
  uint64_t inited;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  void **v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void *v22;
  id v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGColorRef GenericRGB;
  uint64_t v28;
  uint64_t v29;
  void **v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  id v49;
  void *v50;
  id v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  id v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  BOOL v71;
  Class v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  Class isa;
  id v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  id v86;

  v7 = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!objc_msgSend(v7, sel_length))
    goto LABEL_5;
  v8 = (unint64_t)objc_msgSend(v7, sel_length);
  if ((v8 & 0x8000000000000000) != 0)
    goto LABEL_49;
  v9 = v8;
  v84 = a3;
  v85 = a2;
  v86 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_199FA7E70;
  v11 = (void *)*MEMORY[0x1E0DC1138];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
  v12 = a4[3];
  v13 = a4[4];
  __swift_project_boxed_opaque_existential_1(a4, v12);
  v14 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 152);
  v83 = v11;
  v15 = v14(v12, v13);
  type metadata accessor for CTFontRef(0);
  v16 = (void **)MEMORY[0x1E0DC1140];
  *(_QWORD *)(inited + 40) = v15;
  v17 = *v16;
  v82 = v18;
  *(_QWORD *)(inited + 64) = v18;
  *(_QWORD *)(inited + 72) = v17;
  v19 = a4[3];
  v20 = a4[4];
  __swift_project_boxed_opaque_existential_1(a4, v19);
  v21 = *(uint64_t (**)(uint64_t, uint64_t))(v20 + 24);
  v81 = v17;
  v22 = (void *)v21(v19, v20);
  v23 = objc_msgSend(v22, sel_userInterfaceStyle);

  if (v23)
  {
    v24 = 1.0;
    v25 = 1.0;
    v26 = 1.0;
  }
  else
  {
    v24 = 0.0;
    v25 = 0.0;
    v26 = 0.0;
  }
  GenericRGB = CGColorCreateGenericRGB(v24, v25, v26, 1.0);
  type metadata accessor for CGColorRef(0);
  v29 = v28;
  v30 = (void **)MEMORY[0x1E0CB2CE0];
  *(_QWORD *)(inited + 80) = GenericRGB;
  v31 = *v30;
  *(_QWORD *)(inited + 104) = v28;
  *(_QWORD *)(inited + 112) = v31;
  v32 = a4[3];
  v33 = a4[4];
  __swift_project_boxed_opaque_existential_1(a4, v32);
  v34 = *(uint64_t (**)(uint64_t, uint64_t))(v33 + 24);
  v35 = v31;
  v36 = (void *)v34(v32, v33);
  v37 = objc_msgSend(v36, sel_localization);

  v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v40 = v39;

  *(_QWORD *)(inited + 144) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 120) = v38;
  *(_QWORD *)(inited + 128) = v40;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  v41 = swift_initStackObject();
  *(_OWORD *)(v41 + 16) = xmmword_199FA7E70;
  *(_QWORD *)(v41 + 32) = v83;
  v43 = a4[3];
  v42 = a4[4];
  __swift_project_boxed_opaque_existential_1(a4, v43);
  v44 = *(uint64_t (**)(uint64_t, uint64_t))(v42 + 160);
  v45 = v83;
  *(_QWORD *)(v41 + 40) = v44(v43, v42);
  *(_QWORD *)(v41 + 64) = v82;
  *(_QWORD *)(v41 + 72) = v81;
  v46 = a4[3];
  v47 = a4[4];
  __swift_project_boxed_opaque_existential_1(a4, v46);
  v48 = *(uint64_t (**)(uint64_t, uint64_t))(v47 + 24);
  v49 = v81;
  v50 = (void *)v48(v46, v47);
  v51 = objc_msgSend(v50, sel_userInterfaceStyle);

  if (v51)
  {
    v52 = 1.0;
    v53 = 1.0;
    v54 = 1.0;
  }
  else
  {
    v52 = 0.0;
    v53 = 0.0;
    v54 = 0.0;
  }
  *(_QWORD *)(v41 + 80) = CGColorCreateGenericRGB(v52, v53, v54, 1.0);
  *(_QWORD *)(v41 + 104) = v29;
  *(_QWORD *)(v41 + 112) = v35;
  v55 = a4[3];
  v56 = a4[4];
  __swift_project_boxed_opaque_existential_1(a4, v55);
  v57 = *(uint64_t (**)(uint64_t, uint64_t))(v56 + 24);
  v58 = v35;
  v59 = (void *)v57(v55, v56);
  v60 = objc_msgSend(v59, sel_localization);

  v61 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v63 = v62;

  *(_QWORD *)(v41 + 144) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v41 + 120) = v61;
  *(_QWORD *)(v41 + 128) = v63;
  specialized Dictionary.init(dictionaryLiteral:)(v41);
  v64 = *(_QWORD *)(v85 + 16);
  if (!v64)
  {
LABEL_27:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v73 = *(_QWORD *)(v84 + 16);
    if (v73)
    {
      v74 = (uint64_t *)(v84 + 40);
      do
      {
        v75 = *(v74 - 1);
        v76 = *v74;
        v77 = v75 + *v74;
        if (__OFADD__(v75, *v74))
          goto LABEL_46;
        if (v9 >= v77)
          v78 = v75 + *v74;
        else
          v78 = v9;
        if (v75 > 0 || v77 <= 0)
        {
          if (v75 < 0 || v75 >= v9)
            goto LABEL_29;
          v71 = __OFSUB__(v78, v75);
          v78 -= v75;
          if (v71)
            goto LABEL_48;
        }
        if (v78 >= 1)
        {
          type metadata accessor for NSAttributedStringKey(0);
          lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
          isa = Dictionary._bridgeToObjectiveC()().super.isa;
          objc_msgSend(v86, sel_setAttributes_range_, isa, v75, v76);

        }
LABEL_29:
        v74 += 2;
        --v73;
      }
      while (v73);
    }
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  v65 = (uint64_t *)(v85 + 40);
  while (1)
  {
    v66 = *(v65 - 1);
    v67 = *v65;
    v68 = v66 + *v65;
    if (__OFADD__(v66, *v65))
      break;
    if (v9 >= v68)
      v69 = v66 + *v65;
    else
      v69 = v9;
    if (v66 <= 0 && v68 > 0)
      goto LABEL_25;
    if ((v66 & 0x8000000000000000) == 0 && v66 < v9)
    {
      v71 = __OFSUB__(v69, v66);
      v69 -= v66;
      if (v71)
        goto LABEL_47;
LABEL_25:
      if (v69 >= 1)
      {
        type metadata accessor for NSAttributedStringKey(0);
        lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
        v72 = Dictionary._bridgeToObjectiveC()().super.isa;
        objc_msgSend(v86, sel_setAttributes_range_, v72, v66, v67);

      }
    }
    v65 += 2;
    if (!--v64)
      goto LABEL_27;
  }
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
}

void specialized static PillMetrics.doubleLineFontHeight(for:)(_QWORD *a1)
{
  const __CFAttributedString *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  Swift::String v13;
  Swift::String_optional v14;
  Class isa;
  void *rawValue;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  const __CFAttributedString *v24;
  const __CFAttributedString *v25;
  const __CFAttributedString *v26;
  const __CTLine *v27;
  const __CTLine *v28;
  Swift::tuple_localizedString_NSMutableAttributedString_baseFontTargetRanges_OpaquePointer_senderFontTargetRanges_OpaquePointer v29;

  v3 = type metadata accessor for AttributedString();
  MEMORY[0x1E0C80A78](v3);
  v4 = a1[3];
  v5 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  LOBYTE(v4) = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5) & 1;
  v6 = a1[3];
  v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v6);
  v8 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v7 + 24))(v6, v7);
  v9 = objc_msgSend(v8, sel_localization);

  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;

  v13._countAndFlagsBits = 0x6C6F686563616C50;
  v13._object = (void *)0xEB00000000726564;
  v14.value._countAndFlagsBits = v10;
  v14.value._object = v12;
  v29 = NameAttributionLocAttributedString(prefix:name:multiline:localization:)((SocialLayer::AttributionTextPrefix)v4, v13, 1, v14);
  isa = v29.localizedString.super.super.isa;
  rawValue = v29.baseFontTargetRanges._rawValue;
  v17 = v29.senderFontTargetRanges._rawValue;
  swift_bridgeObjectRelease();
  v18 = isa;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized static PillMetrics.fromSenderAttributedString(for:metrics:multiline:)(v18, (uint64_t)rawValue, (uint64_t)v17, a1);
  v20 = v19;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  attributedStringSplitByLineBreak(inString:)(v20);
  v22 = v21;
  if (!(v21 >> 62))
  {
    v23 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v23 >= 1)
      goto LABEL_3;
LABEL_12:
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSAttributedString);
    AttributedString.init(stringLiteral:)();
    v1 = (const __CFAttributedString *)NSAttributedString.init(_:)();
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  v23 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v23 < 1)
    goto LABEL_12;
LABEL_3:
  if ((v22 & 0xC000000000000001) != 0)
  {
    v24 = (const __CFAttributedString *)MEMORY[0x19AEC3E78](0, v22);
  }
  else
  {
    if (!*(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_17;
    }
    v24 = (const __CFAttributedString *)*(id *)(v22 + 32);
  }
  v1 = v24;
  if ((unint64_t)v23 < 2)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSAttributedString);
    AttributedString.init(stringLiteral:)();
    v26 = (const __CFAttributedString *)NSAttributedString.init(_:)();
    goto LABEL_14;
  }
  if ((v22 & 0xC000000000000001) != 0)
  {
LABEL_17:
    v25 = (const __CFAttributedString *)MEMORY[0x19AEC3E78](1, v22);
    goto LABEL_10;
  }
  if (*(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
  {
    v25 = (const __CFAttributedString *)*(id *)(v22 + 40);
LABEL_10:
    v26 = v25;
    swift_bridgeObjectRelease();
LABEL_14:
    v27 = CTLineCreateWithAttributedString(v1);
    CTLineGetBoundsWithOptions(v27, 0);
    v28 = CTLineCreateWithAttributedString(v26);
    CTLineGetBoundsWithOptions(v28, 0);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return;
  }
  __break(1u);
}

void specialized static PillMetrics.localizedSenderOrNumContactsString(for:metrics:)(void *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char **v21;
  id v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  unint64_t v31;
  uint64_t v32;
  id v33;
  unint64_t v34;
  id v35;
  void *v36;
  id v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  id v64;
  unint64_t v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  _QWORD *v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;

  v87 = a2;
  v3 = type metadata accessor for Locale();
  MEMORY[0x1E0C80A78](v3);
  v88 = (char *)&v86 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for String.LocalizationValue();
  v89 = *(_QWORD *)(v5 - 8);
  v90 = v5;
  v6 = MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v86 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v6);
  v11 = (char *)&v86 - v10;
  v12 = MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&v86 - v13;
  v15 = MEMORY[0x1E0C80A78](v12);
  v86 = (char *)&v86 - v16;
  v17 = MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v86 - v18;
  MEMORY[0x1E0C80A78](v17);
  v21 = (char **)((char *)&v86 - v20);
  v22 = objc_msgSend(a1, sel_groupName);
  if (v22)
  {
    v23 = v22;
    v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v26 = v25;

  }
  else
  {
    v24 = 0;
    v26 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  v27 = HIBYTE(v26) & 0xF;
  if ((v26 & 0x2000000000000000) == 0)
    v27 = v24 & 0xFFFFFFFFFFFFLL;
  if (v27)
  {
    v28 = objc_msgSend(a1, sel_groupName);
    if (v28)
    {
      v29 = v28;
LABEL_9:
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      return;
    }
    goto LABEL_64;
  }
  v30 = objc_msgSend(a1, sel_sendersToDisplay);
  type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for SLPerson);
  v31 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v31 >> 62)
  {
    swift_bridgeObjectRetain();
    v32 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    v32 = *(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v32 != 1 || objc_msgSend(a1, sel_allSendersCount) != (id)1)
  {
    String.LocalizationValue.init(stringLiteral:)();
    v46 = v87[3];
    v47 = v87[4];
    __swift_project_boxed_opaque_existential_1(v87, v46);
    v48 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v47 + 24))(v46, v47);
    v49 = objc_msgSend(v48, sel_localization);

    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v51 = v89;
    v50 = v90;
    (*(void (**)(char *, char *, uint64_t))(v89 + 16))(v8, v11, v90);
    v52 = SLFrameworkBundle();
    swift_bridgeObjectRetain();
    static Locale.current.getter();
    String.init(localized:table:bundle:localization:locale:comment:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v11, v50);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    v53 = swift_allocObject();
    *(_OWORD *)(v53 + 16) = xmmword_199FA7E60;
    v54 = objc_msgSend(a1, (SEL)&selRef_notificationTokenSettingsChanges + 7);
    v55 = MEMORY[0x1E0DEB490];
    *(_QWORD *)(v53 + 56) = MEMORY[0x1E0DEB418];
    *(_QWORD *)(v53 + 64) = v55;
    *(_QWORD *)(v53 + 32) = v54;
    static String.localizedStringWithFormat(_:_:)();
    swift_bridgeObjectRelease();
LABEL_22:
    swift_bridgeObjectRelease();
    return;
  }
  v33 = objc_msgSend(a1, sel_sendersToDisplay);
  v34 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v34 >> 62))
  {
    if (*(_QWORD *)((v34 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_16;
LABEL_48:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_49;
  }
  swift_bridgeObjectRetain();
  v72 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v72)
    goto LABEL_48;
LABEL_16:
  if ((v34 & 0xC000000000000001) != 0)
  {
LABEL_49:
    v35 = (id)MEMORY[0x19AEC3E78](0, v34);
    goto LABEL_19;
  }
  if (!*(_QWORD *)((v34 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_51;
  }
  v35 = *(id *)(v34 + 32);
LABEL_19:
  v36 = v35;
  swift_bridgeObjectRelease();
  type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSObject);
  v37 = objc_msgSend(a1, sel_meSender);
  v38 = static NSObject.== infix(_:_:)();

  if ((v38 & 1) != 0)
  {
    String.LocalizationValue.init(stringLiteral:)();
    v39 = v87[3];
    v40 = v87[4];
    __swift_project_boxed_opaque_existential_1(v87, v39);
    v41 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v40 + 24))(v39, v40);
    v42 = objc_msgSend(v41, sel_localization);

    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v44 = v89;
    v43 = v90;
    (*(void (**)(char *, char **, uint64_t))(v89 + 16))(v19, v21, v90);
    v45 = SLFrameworkBundle();
    swift_bridgeObjectRetain();
    static Locale.current.getter();
    String.init(localized:table:bundle:localization:locale:comment:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char **, uint64_t))(v44 + 8))(v21, v43);
    return;
  }
  v56 = objc_msgSend(a1, sel_sendersToDisplay);
  v34 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v34 >> 62))
  {
    if (*(_QWORD *)((v34 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_25;
LABEL_52:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_53;
  }
LABEL_51:
  swift_bridgeObjectRetain();
  v73 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v73)
    goto LABEL_52;
LABEL_25:
  if ((v34 & 0xC000000000000001) != 0)
  {
LABEL_53:
    v57 = (id)MEMORY[0x19AEC3E78](0, v34);
    goto LABEL_28;
  }
  if (!*(_QWORD *)((v34 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_55;
  }
  v57 = *(id *)(v34 + 32);
LABEL_28:
  v58 = v57;
  swift_bridgeObjectRelease();
  v21 = &selRef_numberOfItems;
  v59 = objc_msgSend(v58, sel_shortDisplayName);

  v60 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v62 = v61;

  swift_bridgeObjectRelease();
  if ((v62 & 0x2000000000000000) != 0)
    v63 = HIBYTE(v62) & 0xF;
  else
    v63 = v60 & 0xFFFFFFFFFFFFLL;
  v64 = objc_msgSend(a1, sel_sendersToDisplay);
  v34 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v65 = v34 >> 62;
  if (v63)
  {
    if (!v65)
    {
      if (*(_QWORD *)((v34 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_34;
      goto LABEL_56;
    }
LABEL_55:
    swift_bridgeObjectRetain();
    v74 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v74)
    {
LABEL_34:
      if ((v34 & 0xC000000000000001) == 0)
      {
        if (*(_QWORD *)((v34 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          v66 = *(id *)(v34 + 32);
LABEL_37:
          v67 = v66;
          swift_bridgeObjectRelease();
          v29 = objc_msgSend(v67, v21[431]);

          goto LABEL_9;
        }
        __break(1u);
LABEL_59:
        swift_bridgeObjectRetain();
        v75 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (!v75)
          goto LABEL_60;
        goto LABEL_40;
      }
LABEL_57:
      v66 = (id)MEMORY[0x19AEC3E78](0, v34);
      goto LABEL_37;
    }
LABEL_56:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_57;
  }
  if (v65)
    goto LABEL_59;
  if (!*(_QWORD *)((v34 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_60:
    swift_bridgeObjectRelease();
LABEL_61:
    v76 = v86;
    String.LocalizationValue.init(stringLiteral:)();
    v77 = v87[3];
    v78 = v87[4];
    __swift_project_boxed_opaque_existential_1(v87, v77);
    v79 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v78 + 24))(v77, v78);
    v80 = objc_msgSend(v79, sel_localization);

    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v82 = v89;
    v81 = v90;
    (*(void (**)(char *, char *, uint64_t))(v89 + 16))(v14, v76, v90);
    v83 = SLFrameworkBundle();
    swift_bridgeObjectRetain();
    static Locale.current.getter();
    String.init(localized:table:bundle:localization:locale:comment:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v82 + 8))(v76, v81);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    v84 = swift_allocObject();
    *(_OWORD *)(v84 + 16) = xmmword_199FA7E60;
    v85 = MEMORY[0x1E0DEB490];
    *(_QWORD *)(v84 + 56) = MEMORY[0x1E0DEB418];
    *(_QWORD *)(v84 + 64) = v85;
    *(_QWORD *)(v84 + 32) = 1;
    static String.localizedStringWithFormat(_:_:)();
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
LABEL_40:
  if ((v34 & 0xC000000000000001) != 0)
  {
    v68 = (id)MEMORY[0x19AEC3E78](0, v34);
    goto LABEL_43;
  }
  if (*(_QWORD *)((v34 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v68 = *(id *)(v34 + 32);
LABEL_43:
    v69 = v68;
    swift_bridgeObjectRelease();
    v70 = SLFormattedDisplayNameForPerson(v69);
    if (v70)
    {
      v71 = v70;
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      return;
    }

    goto LABEL_61;
  }
  __break(1u);
LABEL_64:
  __break(1u);
}

void specialized static PillMetrics.localizedFromSenderAttributedString(for:prefix:multiline:maxSenderNames:localization:)(void *a1, char a2, int a3, uint64_t a4, uint64_t a5, id a6)
{
  char **v6;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  Swift::String v30;
  Swift::String_optional v31;
  char **v32;
  id v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  id v37;
  unint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  id v42;
  char v43;
  Swift::String_optional v44;
  unint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  char v49;
  char *v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  char **v58;
  id v59;
  char **v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  char **v69;
  id v70;
  id v71;
  id v72;
  id v73;
  void *v74;
  id v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  id v80;
  unint64_t v81;
  id v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  Swift::String v91;
  Swift::String_optional v92;
  _BYTE *v93;
  char *v94;
  Swift::Int v95;
  Swift::String v96;
  unint64_t v97;
  Swift::String_optional v98;
  Swift::Int v99;
  Swift::Bool v100;
  SocialLayer::AttributionTextPrefix v101;
  Swift::String_optional v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  id v109;
  int v110;
  id v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  int v121;
  uint64_t v122;

  v122 = a4;
  v121 = a3;
  v10 = a2 & 1;
  v11 = type metadata accessor for Locale();
  MEMORY[0x1E0C80A78](v11);
  v120 = (char *)&v106 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for String.LocalizationValue();
  v118 = *(_QWORD *)(v13 - 8);
  v119 = v13;
  v14 = MEMORY[0x1E0C80A78](v13);
  v117 = (char *)&v106 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v116 = (char *)&v106 - v16;
  v17 = (uint64_t)&selRef_contextMenuItemsForAttributionView_;
  v18 = (unint64_t)a1;
  v19 = objc_msgSend(a1, sel_groupName);
  if (v19)
  {
    v20 = v19;
    v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v23 = v22;

  }
  else
  {
    v21 = 0;
    v23 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  v24 = HIBYTE(v23) & 0xF;
  if ((v23 & 0x2000000000000000) == 0)
    v24 = v21 & 0xFFFFFFFFFFFFLL;
  if (v24)
  {
    v25 = objc_msgSend((id)v18, sel_groupName);
    if (v25)
    {
      v26 = v25;
LABEL_9:
      v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v29 = v28;

      v30._countAndFlagsBits = v27;
      v30._object = v29;
      v31.value._countAndFlagsBits = a5;
      v31.value._object = a6;
      NameAttributionLocAttributedString(prefix:name:multiline:localization:)((SocialLayer::AttributionTextPrefix)v10, v30, v121 & 1, v31);
LABEL_10:
      swift_bridgeObjectRelease();
      return;
    }
    goto LABEL_127;
  }
  v32 = &selRef_numberOfItems;
  v33 = objc_msgSend((id)v18, sel_sendersToDisplay);
  v34 = type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for SLPerson);
  v35 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v35 >> 62)
    goto LABEL_90;
  v36 = *(_QWORD *)((v35 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_13:
  swift_bridgeObjectRelease();
  if (v36 != 1 || objc_msgSend((id)v18, sel_allSendersCount) != (id)1)
  {
    if (v122 < 2)
    {
      v71 = objc_msgSend((id)v18, sel_allSendersCount);
LABEL_106:
      v99 = (Swift::Int)v71;
      v100 = v121 & 1;
      v101 = (char)v10;
LABEL_107:
      v102.value._countAndFlagsBits = a5;
      v102.value._object = a6;
      NumContactsAttributionLocAttributedString(prefix:numContacts:multiline:localization:)(v101, v99, v100, v102);
      return;
    }
    v45 = (unint64_t)objc_msgSend((id)v18, v32[202]);
    v17 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if ((unint64_t)v17 >> 62)
    {
      if (v17 < 0)
        v34 = v17;
      else
        v34 = v17 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain();
      v39 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v39)
      {
LABEL_25:
        v112 = v17 & 0xC000000000000001;
        v108 = a5;
        v109 = a6;
        v115 = v17;
        if ((v17 & 0xC000000000000001) == 0)
        {
          v106 = v17 & 0xFFFFFFFFFFFFFF8;
          if (!*(_QWORD *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_114;
          }
          a6 = *(id *)(v17 + 32);
          goto LABEL_28;
        }
LABEL_112:
        a6 = (id)MEMORY[0x19AEC3E78](0, v17);
        v106 = v17 & 0xFFFFFFFFFFFFFF8;
LABEL_28:
        v46 = type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSObject);
        a5 = 0;
        v113 = v39 - 1;
        v114 = v46;
        v32 = (char **)MEMORY[0x1E0DEE9D8];
        v110 = v10;
        v47 = (void *)v18;
        v107 = (void *)v18;
        while (1)
        {
          v34 = (unint64_t)v32;
          v48 = objc_msgSend(v47, sel_meSender, v106);
          v49 = static NSObject.== infix(_:_:)();

          if ((v49 & 1) != 0)
          {
            v111 = a6;
            v50 = v116;
            String.LocalizationValue.init(stringLiteral:)();
            v6 = (char **)v118;
            v51 = v119;
            (*(void (**)(char *, char *, uint64_t))(v118 + 16))(v117, v50, v119);
            v52 = SLFrameworkBundle();
            swift_bridgeObjectRetain();
            a6 = v120;
            static Locale.current.getter();
            v53 = String.init(localized:table:bundle:localization:locale:comment:)();
            v18 = v54;
            ((void (*)(char *, uint64_t))v6[1])(v50, v51);
            v55 = HIBYTE(v18) & 0xF;
            if ((v18 & 0x2000000000000000) == 0)
              v55 = v53 & 0xFFFFFFFFFFFFLL;
            if (!v55)
            {

              swift_bridgeObjectRelease();
              v10 = v110;
              v47 = v107;
              goto LABEL_55;
            }
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v34 = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, (int64_t)(v32[2] + 1), 1, v32);
            v47 = v107;
            v32 = (char **)v34;
            v57 = *(_QWORD *)(v34 + 16);
            v56 = *(_QWORD *)(v34 + 24);
            a6 = (id)(v57 + 1);
            if (v57 >= v56 >> 1)
              v32 = (char **)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v56 > 1), v57 + 1, 1, (_QWORD *)v34);
            v32[2] = (char *)a6;
            v58 = &v32[2 * v57];
            v58[4] = (char *)v53;
            v58[5] = (char *)v18;

            goto LABEL_52;
          }
          v59 = objc_msgSend(a6, (SEL)0x1F35F31F1);
          v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v60 = (char **)a6;
          v62 = v61;

          swift_bridgeObjectRelease();
          v63 = HIBYTE(v62) & 0xF;
          if ((v62 & 0x2000000000000000) == 0)
            v63 = v18 & 0xFFFFFFFFFFFFLL;
          if (v63)
          {
            v6 = v60;
            a6 = objc_msgSend(v60, (SEL)0x1F35F31F1);
            v32 = (char **)v34;
          }
          else
          {
            v6 = v60;
            a6 = SLFormattedDisplayNameForPerson(v60);
            v32 = (char **)v34;
            if (!a6)
              goto LABEL_54;
          }
          v64 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v18 = v65;

          v66 = HIBYTE(v18) & 0xF;
          if ((v18 & 0x2000000000000000) == 0)
            v66 = v64 & 0xFFFFFFFFFFFFLL;
          if (v66)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v32 = (char **)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, (int64_t)(v32[2] + 1), 1, v32);
            v68 = (unint64_t)v32[2];
            v67 = (unint64_t)v32[3];
            a6 = (id)(v68 + 1);
            if (v68 >= v67 >> 1)
              v32 = (char **)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v67 > 1), v68 + 1, 1, v32);
            v32[2] = (char *)a6;
            v69 = &v32[2 * v68];
            v69[4] = (char *)v64;
            v69[5] = (char *)v18;

LABEL_52:
            v10 = v110;
            goto LABEL_55;
          }
          swift_bridgeObjectRelease();
LABEL_54:

LABEL_55:
          if (v113 == a5)
            goto LABEL_79;
          v17 = a5 + 1;
          if (v112)
          {
            v70 = (id)MEMORY[0x19AEC3E78](a5 + 1, v115);
          }
          else
          {
            if ((unint64_t)v17 >= *(_QWORD *)(v106 + 16))
              goto LABEL_89;
            v70 = *(id *)(v115 + 8 * a5 + 40);
          }
          a6 = v70;
          if (__OFADD__(v17, 1))
          {
            __break(1u);
LABEL_89:
            __break(1u);
LABEL_90:
            swift_bridgeObjectRetain();
            v36 = _CocoaArrayWrapper.endIndex.getter();
            swift_bridgeObjectRelease();
            goto LABEL_13;
          }
          ++a5;
          if ((uint64_t)v32[2] >= v122)
          {

LABEL_79:
            swift_bridgeObjectRelease();
            a5 = v108;
            a6 = v109;
            goto LABEL_96;
          }
        }
      }
    }
    else
    {
      v39 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v39)
        goto LABEL_25;
    }
    swift_bridgeObjectRelease();
    v32 = (char **)MEMORY[0x1E0DEE9D8];
    v47 = (void *)v18;
LABEL_96:
    if ((uint64_t)v32[2] < (uint64_t)objc_msgSend(v47, sel_allSendersCount))
    {
      v93 = objc_msgSend(v47, sel_allSendersCount);
      v94 = v32[2];
      v95 = v93 - v94;
      if (!__OFSUB__(v93, v94))
        goto LABEL_101;
      __break(1u);
    }
    v95 = 0;
LABEL_101:
    v96 = formattedDisplayNameListAndNOthers(prefix:names:nOthers:localization:)((SocialLayer::AttributionTextPrefix)v10, (Swift::OpaquePointer)v32, v95, (Swift::String_optional)0);
    swift_bridgeObjectRelease();
    v97 = ((unint64_t)v96._object >> 56) & 0xF;
    if (((uint64_t)v96._object & 0x2000000000000000) == 0)
      v97 = v96._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
    if (v97)
    {
      v98.value._countAndFlagsBits = a5;
      v98.value._object = a6;
      ListOfNamesAttributionLocAttributedString(prefix:listOfNamesString:multiline:localization:)((SocialLayer::AttributionTextPrefix)v10, v96, v121 & 1, v98);
      goto LABEL_10;
    }
    swift_bridgeObjectRelease();
    v71 = objc_msgSend(v47, sel_allSendersCount);
    goto LABEL_106;
  }
  v37 = objc_msgSend((id)v18, v32[202]);
  v38 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v38 >> 62))
  {
    v39 = *(_QWORD *)((v38 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v39)
      goto LABEL_17;
LABEL_109:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_110;
  }
  swift_bridgeObjectRetain();
  v39 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v39)
    goto LABEL_109;
LABEL_17:
  if ((v38 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)((v38 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v40 = *(id *)(v38 + 32);
      goto LABEL_20;
    }
    __break(1u);
    goto LABEL_112;
  }
LABEL_110:
  v40 = (id)MEMORY[0x19AEC3E78](0, v38);
LABEL_20:
  v41 = v40;
  swift_bridgeObjectRelease();
  type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSObject);
  v6 = (char **)v18;
  v42 = objc_msgSend((id)v18, sel_meSender);
  v43 = static NSObject.== infix(_:_:)();

  if ((v43 & 1) != 0)
  {
    v44.value._countAndFlagsBits = a5;
    v44.value._object = a6;
    MeAttributionLocAttributedString(prefix:multiline:localization:)((SocialLayer::AttributionTextPrefix)v10, v121 & 1, v44);
    return;
  }
  v72 = objc_msgSend((id)v18, v32[202]);
  v45 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v45 >> 62))
  {
    if (*(_QWORD *)((v45 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_66;
LABEL_115:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_116;
  }
LABEL_114:
  swift_bridgeObjectRetain();
  v103 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v103)
    goto LABEL_115;
LABEL_66:
  if ((v45 & 0xC000000000000001) != 0)
  {
LABEL_116:
    v73 = (id)MEMORY[0x19AEC3E78](0, v45);
    goto LABEL_69;
  }
  if (!*(_QWORD *)((v45 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_118;
  }
  v73 = *(id *)(v45 + 32);
LABEL_69:
  v74 = v73;
  swift_bridgeObjectRelease();
  v6 = &selRef_numberOfItems;
  v75 = objc_msgSend(v74, sel_shortDisplayName);

  v76 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v78 = v77;

  swift_bridgeObjectRelease();
  if ((v78 & 0x2000000000000000) != 0)
    v79 = HIBYTE(v78) & 0xF;
  else
    v79 = v76 & 0xFFFFFFFFFFFFLL;
  v80 = objc_msgSend((id)v18, v32[202], v106);
  v34 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v81 = v34 >> 62;
  if (v79)
  {
    if (!v81)
    {
      if (*(_QWORD *)((v34 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_75;
      goto LABEL_119;
    }
LABEL_118:
    swift_bridgeObjectRetain();
    v104 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v104)
    {
LABEL_75:
      if ((v34 & 0xC000000000000001) == 0)
      {
        if (*(_QWORD *)((v34 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          v82 = *(id *)(v34 + 32);
LABEL_78:
          v83 = v82;
          swift_bridgeObjectRelease();
          v26 = objc_msgSend(v83, v6[431]);

          goto LABEL_9;
        }
        __break(1u);
LABEL_122:
        swift_bridgeObjectRetain();
        v105 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (!v105)
          goto LABEL_123;
        goto LABEL_82;
      }
LABEL_120:
      v82 = (id)MEMORY[0x19AEC3E78](0, v34);
      goto LABEL_78;
    }
LABEL_119:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_120;
  }
  if (v81)
    goto LABEL_122;
  if (!*(_QWORD *)((v34 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_123:
    swift_bridgeObjectRelease();
LABEL_124:
    v100 = v121 & 1;
    v101 = (char)v10;
    v99 = 1;
    goto LABEL_107;
  }
LABEL_82:
  if ((v34 & 0xC000000000000001) != 0)
  {
    v84 = (id)MEMORY[0x19AEC3E78](0, v34);
    goto LABEL_85;
  }
  if (*(_QWORD *)((v34 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v84 = *(id *)(v34 + 32);
LABEL_85:
    v85 = v84;
    swift_bridgeObjectRelease();
    v86 = SLFormattedDisplayNameForPerson(v85);
    if (v86)
    {
      v87 = v86;
      v88 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v90 = v89;

      v91._countAndFlagsBits = v88;
      v91._object = v90;
      v92.value._countAndFlagsBits = a5;
      v92.value._object = a6;
      NameAttributionLocAttributedString(prefix:name:multiline:localization:)((SocialLayer::AttributionTextPrefix)v10, v91, v121 & 1, v92);
      swift_bridgeObjectRelease();

      return;
    }

    goto LABEL_124;
  }
  __break(1u);
LABEL_127:
  __break(1u);
}

uint64_t type metadata accessor for PillMetrics()
{
  return objc_opt_self();
}

uint64_t outlined release of SLDHighlightPillMetrics(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 64);

  return a1;
}

id specialized static PillMetrics.senderNameAttributedString(for:metrics:)(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t inited;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  id v15;
  uint64_t v16;
  void **v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  id v23;
  void *v24;
  id v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGColorRef GenericRGB;
  void **v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  Class isa;

  v6 = type metadata accessor for AttributedString();
  MEMORY[0x1E0C80A78](v6);
  if (String.count.getter() < 1)
  {
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSMutableAttributedString);
    AttributedString.init(stringLiteral:)();
    v9 = (id)NSAttributedString.init(_:)();
  }
  else
  {
    v7 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
    swift_bridgeObjectRetain();
    v8 = (void *)MEMORY[0x19AEC3B6C](a1, a2);
    swift_bridgeObjectRelease();
    v9 = objc_msgSend(v7, sel_initWithString_, v8);

  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_199FA7E70;
  v11 = (void *)*MEMORY[0x1E0DC1138];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
  v12 = a3[3];
  v13 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v12);
  v14 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 160);
  v15 = v11;
  v16 = v14(v12, v13);
  type metadata accessor for CTFontRef(0);
  v17 = (void **)MEMORY[0x1E0DC1140];
  *(_QWORD *)(inited + 40) = v16;
  v18 = *v17;
  *(_QWORD *)(inited + 64) = v19;
  *(_QWORD *)(inited + 72) = v18;
  v20 = a3[3];
  v21 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v20);
  v22 = *(uint64_t (**)(uint64_t, uint64_t))(v21 + 24);
  v23 = v18;
  v24 = (void *)v22(v20, v21);
  v25 = objc_msgSend(v24, sel_userInterfaceStyle);

  if (v25)
  {
    v26 = 1.0;
    v27 = 1.0;
    v28 = 1.0;
  }
  else
  {
    v26 = 0.0;
    v27 = 0.0;
    v28 = 0.0;
  }
  GenericRGB = CGColorCreateGenericRGB(v26, v27, v28, 1.0);
  type metadata accessor for CGColorRef(0);
  v30 = (void **)MEMORY[0x1E0CB2CE0];
  *(_QWORD *)(inited + 80) = GenericRGB;
  v31 = *v30;
  *(_QWORD *)(inited + 104) = v32;
  *(_QWORD *)(inited + 112) = v31;
  v33 = a3[3];
  v34 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v33);
  v35 = *(uint64_t (**)(uint64_t, uint64_t))(v34 + 24);
  v36 = v31;
  v37 = (void *)v35(v33, v34);
  v38 = objc_msgSend(v37, sel_localization);

  v39 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v41 = v40;

  *(_QWORD *)(inited + 144) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 120) = v39;
  *(_QWORD *)(inited + 128) = v41;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for NSAttributedStringKey(0);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setAttributes_range_, isa, 0, objc_msgSend(v9, sel_length));

  return v9;
}

const __CTLine *specialized static PillMetrics.senderLabelMultilineWithLineWrap(fullString:maxLineWidth:style:)(const __CFAttributedString *a1, void *a2, CGFloat a3)
{
  uint64_t v6;
  uint64_t v7;
  const __CTLine *result;
  const __CTLine *v9;
  CTLineRef v10;
  const __CTLine *TruncatedLineWithTokenHandler;
  id v12;
  uint64_t v13;
  const __CTLine *v14;
  const __CTLine *HyphenatedLineWithOffset;
  id v16;
  void *v17;
  const __CFLocale *v18;
  id v19;
  id v20;
  CFIndex v21;
  id v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  int64_t v26;
  const __CTLine *v28;
  void *v29;
  id v30;
  NSUInteger v31;
  NSRange v32;
  uint64_t v33;
  const __CTLine *v34;
  CTLineRef v35;
  const __CTLine *v36;
  uint64_t v37;
  const __CTLine *v38;
  char *v39;
  uint64_t v40;
  NSRange v41;
  CFRange v42;
  NSRange v43;
  CGRect BoundsWithOptions;
  CGRect v45;

  v6 = type metadata accessor for AttributedString();
  MEMORY[0x1E0C80A78](v6);
  v39 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = CTLineCreateWithAttributedString(a1);
  if (!result)
  {
    __break(1u);
    return result;
  }
  v9 = result;
  BoundsWithOptions = CTLineGetBoundsWithOptions(result, 0);
  if (CGRectGetWidth(BoundsWithOptions) <= a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_199FA8AD0;
    *(_QWORD *)(v33 + 32) = v9;
    v40 = v33;
    specialized Array._endMutation()();
    return (const __CTLine *)v40;
  }
  v10 = CTLineCreateWithAttributedString(a1);
  TruncatedLineWithTokenHandler = (const __CTLine *)CTLineCreateTruncatedLineWithTokenHandler();

  v12 = objc_msgSend(a2, sel_localization);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  HyphenatedLineWithOffset = v14;

  v16 = objc_allocWithZone(MEMORY[0x1E0C99DC8]);
  v17 = (void *)MEMORY[0x19AEC3B6C](v13, HyphenatedLineWithOffset);
  swift_bridgeObjectRelease();
  v18 = (const __CFLocale *)objc_msgSend(v16, sel_initWithLocaleIdentifier_, v17);

  v19 = -[__CFAttributedString length](a1, sel_length);
  v20 = -[__CFAttributedString length](a1, sel_length);
  v21 = (CFIndex)v20 - 1;
  if (__OFSUB__(v20, 1))
  {
LABEL_34:
    __break(1u);
LABEL_35:
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    goto LABEL_25;
  }
  v38 = TruncatedLineWithTokenHandler;
  while (1)
  {
    v24 = (__CFString *)-[__CFAttributedString string](a1, sel_string);
    if (!v24)
    {
      v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v24 = (__CFString *)MEMORY[0x19AEC3B6C](v25);
      swift_bridgeObjectRelease();
    }
    v42.location = 0;
    v42.length = (CFIndex)v19;
    v26 = SLDGetHyphenationPosition(v24, v21, v42, v18);

    if (v26 == -1 || v26 >= v21)
    {
      HyphenatedLineWithOffset = 0;
      v34 = v38;
      goto LABEL_23;
    }
    v28 = v9;
    v29 = (void *)MEMORY[0x19AEC3B6C](45, 0xE100000000000000);
    HyphenatedLineWithOffset = (const __CTLine *)CTLineCreateHyphenatedLineWithOffset();

    v45 = CTLineGetBoundsWithOptions(HyphenatedLineWithOffset, 0);
    if (CGRectGetWidth(v45) <= a3)
      break;
LABEL_8:

    v21 = v26;
  }
  v30 = -[__CFAttributedString length](a1, sel_length);
  v31 = (NSUInteger)v30 - v26;
  if (__OFSUB__(v30, v26))
  {
    __break(1u);
    goto LABEL_34;
  }
  v41.location = 0;
  v41.length = (NSUInteger)v19;
  v43.location = v26;
  v43.length = v31;
  v32 = NSUnionRange(v41, v43);
  if (v32.location || (id)v32.length != v19)
  {
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSAttributedString);
    AttributedString.init(stringLiteral:)();
    v22 = (id)NSAttributedString.init(_:)();
  }
  else
  {
    v22 = -[__CFAttributedString attributedSubstringFromRange:](a1, sel_attributedSubstringFromRange_, v26, v31);
  }
  v23 = v22;
  if ((uint64_t)objc_msgSend(v22, sel_length) < 1)
  {

    goto LABEL_8;
  }

  v34 = HyphenatedLineWithOffset;
  v35 = CTLineCreateWithAttributedString((CFAttributedStringRef)v23);
  HyphenatedLineWithOffset = (const __CTLine *)CTLineCreateTruncatedLineWithTokenHandler();

LABEL_23:
  v40 = MEMORY[0x1E0DEE9D8];
  if (!v34)
  {

    v9 = HyphenatedLineWithOffset;
    goto LABEL_31;
  }
  a1 = v34;
  MEMORY[0x19AEC3C8C]();
  if (*(_QWORD *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    goto LABEL_35;
LABEL_25:
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  if (HyphenatedLineWithOffset)
  {
    v36 = HyphenatedLineWithOffset;
    MEMORY[0x19AEC3C8C]();
    if (*(_QWORD *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();

  }
LABEL_31:

  return (const __CTLine *)v40;
}

uint64_t specialized static PillMetrics.accessibilityLabel(for:)(void *a1)
{
  id v2;
  unint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;

  v2 = objc_msgSend(a1, sel_sendersToDisplay);
  type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for SLPerson);
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v4)
    goto LABEL_10;
  v5 = objc_msgSend(a1, sel_groupName);
  if (v5)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;

    v5 = (id)(v6 & 0xFFFFFFFFFFFFLL);
  }
  else
  {
    v8 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  v9 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0)
    v9 = (uint64_t)v5;
  if (!v9)
    return 0;
LABEL_10:
  specialized static PillMetrics.localizedFromSenderAttributedString(for:prefix:multiline:maxSenderNames:localization:)(a1, 0, 0, 3, 0, 0);
  v11 = v10;
  v12 = objc_msgSend(v10, sel_string);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v13;
}

unint64_t lazy protocol witness table accessor for type AttributionTextPrefix and conformance AttributionTextPrefix()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AttributionTextPrefix and conformance AttributionTextPrefix;
  if (!lazy protocol witness table cache variable for type AttributionTextPrefix and conformance AttributionTextPrefix)
  {
    result = MEMORY[0x19AEC4E20](&protocol conformance descriptor for AttributionTextPrefix, &type metadata for AttributionTextPrefix);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AttributionTextPrefix and conformance AttributionTextPrefix);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type HighlightPillSenderNameAttribute and conformance HighlightPillSenderNameAttribute()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type HighlightPillSenderNameAttribute and conformance HighlightPillSenderNameAttribute;
  if (!lazy protocol witness table cache variable for type HighlightPillSenderNameAttribute and conformance HighlightPillSenderNameAttribute)
  {
    result = MEMORY[0x19AEC4E20](&protocol conformance descriptor for HighlightPillSenderNameAttribute, &type metadata for HighlightPillSenderNameAttribute);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HighlightPillSenderNameAttribute and conformance HighlightPillSenderNameAttribute);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type HighlightPillSenderNameAttribute and conformance HighlightPillSenderNameAttribute;
  if (!lazy protocol witness table cache variable for type HighlightPillSenderNameAttribute and conformance HighlightPillSenderNameAttribute)
  {
    result = MEMORY[0x19AEC4E20](&protocol conformance descriptor for HighlightPillSenderNameAttribute, &type metadata for HighlightPillSenderNameAttribute);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HighlightPillSenderNameAttribute and conformance HighlightPillSenderNameAttribute);
  }
  return result;
}

uint64_t associated type witness table accessor for AttributedStringKey.Value : Hashable in HighlightPillSenderNameAttribute()
{
  return MEMORY[0x1E0DEAFB0];
}

unint64_t lazy protocol witness table accessor for type HighlightPillNumContactsAttribute and conformance HighlightPillNumContactsAttribute()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type HighlightPillNumContactsAttribute and conformance HighlightPillNumContactsAttribute;
  if (!lazy protocol witness table cache variable for type HighlightPillNumContactsAttribute and conformance HighlightPillNumContactsAttribute)
  {
    result = MEMORY[0x19AEC4E20](&protocol conformance descriptor for HighlightPillNumContactsAttribute, &type metadata for HighlightPillNumContactsAttribute);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HighlightPillNumContactsAttribute and conformance HighlightPillNumContactsAttribute);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type HighlightPillNumContactsAttribute and conformance HighlightPillNumContactsAttribute;
  if (!lazy protocol witness table cache variable for type HighlightPillNumContactsAttribute and conformance HighlightPillNumContactsAttribute)
  {
    result = MEMORY[0x19AEC4E20](&protocol conformance descriptor for HighlightPillNumContactsAttribute, &type metadata for HighlightPillNumContactsAttribute);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HighlightPillNumContactsAttribute and conformance HighlightPillNumContactsAttribute);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type HighlightPillListOfNamesAttribute and conformance HighlightPillListOfNamesAttribute()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type HighlightPillListOfNamesAttribute and conformance HighlightPillListOfNamesAttribute;
  if (!lazy protocol witness table cache variable for type HighlightPillListOfNamesAttribute and conformance HighlightPillListOfNamesAttribute)
  {
    result = MEMORY[0x19AEC4E20](&protocol conformance descriptor for HighlightPillListOfNamesAttribute, &type metadata for HighlightPillListOfNamesAttribute);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HighlightPillListOfNamesAttribute and conformance HighlightPillListOfNamesAttribute);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type HighlightPillListOfNamesAttribute and conformance HighlightPillListOfNamesAttribute;
  if (!lazy protocol witness table cache variable for type HighlightPillListOfNamesAttribute and conformance HighlightPillListOfNamesAttribute)
  {
    result = MEMORY[0x19AEC4E20](&protocol conformance descriptor for HighlightPillListOfNamesAttribute, &type metadata for HighlightPillListOfNamesAttribute);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HighlightPillListOfNamesAttribute and conformance HighlightPillListOfNamesAttribute);
  }
  return result;
}

uint64_t base witness table accessor for DecodingConfigurationProviding in AttributeScopes.HighlightPillAttributes()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type AttributeScopes.HighlightPillAttributes and conformance AttributeScopes.HighlightPillAttributes, (uint64_t (*)(uint64_t))type metadata accessor for AttributeScopes.HighlightPillAttributes, (uint64_t)&protocol conformance descriptor for AttributeScopes.HighlightPillAttributes);
}

uint64_t base witness table accessor for EncodingConfigurationProviding in AttributeScopes.HighlightPillAttributes()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type AttributeScopes.HighlightPillAttributes and conformance AttributeScopes.HighlightPillAttributes, (uint64_t (*)(uint64_t))type metadata accessor for AttributeScopes.HighlightPillAttributes, (uint64_t)&protocol conformance descriptor for AttributeScopes.HighlightPillAttributes);
}

uint64_t storeEnumTagSinglePayload for AttributionTextPrefix(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_199F94908 + 4 * byte_199FA8B0D[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_199F9493C + 4 * byte_199FA8B08[v4]))();
}

uint64_t sub_199F9493C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_199F94944(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x199F9494CLL);
  return result;
}

uint64_t sub_199F94958(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x199F94960);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_199F94964(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_199F9496C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AttributionTextPrefix()
{
  return &type metadata for AttributionTextPrefix;
}

ValueMetadata *type metadata accessor for HighlightPillSenderNameAttribute()
{
  return &type metadata for HighlightPillSenderNameAttribute;
}

ValueMetadata *type metadata accessor for HighlightPillNumContactsAttribute()
{
  return &type metadata for HighlightPillNumContactsAttribute;
}

ValueMetadata *type metadata accessor for HighlightPillListOfNamesAttribute()
{
  return &type metadata for HighlightPillListOfNamesAttribute;
}

uint64_t initializeBufferWithCopyOfBuffer for AttributeScopes.HighlightPillAttributes(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AttributeScopes.FoundationAttributes();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for AttributeScopes.HighlightPillAttributes(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AttributeScopes.FoundationAttributes();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for AttributeScopes.HighlightPillAttributes(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AttributeScopes.FoundationAttributes();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for AttributeScopes.HighlightPillAttributes(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AttributeScopes.FoundationAttributes();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for AttributeScopes.HighlightPillAttributes(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AttributeScopes.FoundationAttributes();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for AttributeScopes.HighlightPillAttributes(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AttributeScopes.FoundationAttributes();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for AttributeScopes.HighlightPillAttributes()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_199F94B44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AttributeScopes.FoundationAttributes();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AttributeScopes.HighlightPillAttributes()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_199F94B8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AttributeScopes.FoundationAttributes();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata completion function for AttributeScopes.HighlightPillAttributes()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for AttributeScopes.FoundationAttributes();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for VisionPillMetric()
{
  return &type metadata for VisionPillMetric;
}

ValueMetadata *type metadata accessor for VisionSafariBannerPillMetric()
{
  return &type metadata for VisionSafariBannerPillMetric;
}

ValueMetadata *type metadata accessor for iOSPillMetric()
{
  return &type metadata for iOSPillMetric;
}

uint64_t initializeBufferWithCopyOfBuffer for TVPillMetrics(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v4 = v3;
  return a1;
}

uint64_t assignWithCopy for TVPillMetrics(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for TVPillMetrics(uint64_t a1, _QWORD *a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  *(_QWORD *)(a1 + 16) = a2[2];
  return a1;
}

ValueMetadata *type metadata accessor for TVPillMetrics()
{
  return &type metadata for TVPillMetrics;
}

void destroy for MacPillMetric(id *a1)
{

}

uint64_t initializeWithCopy for MacPillMetric(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v4 = v3;
  return a1;
}

ValueMetadata *type metadata accessor for MacPillMetric()
{
  return &type metadata for MacPillMetric;
}

ValueMetadata *type metadata accessor for MacSafariBannerPillMetrics()
{
  return &type metadata for MacSafariBannerPillMetrics;
}

uint64_t assignWithCopy for VisionPillMetric(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t assignWithTake for VisionPillMetric(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for VisionPillMetric(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VisionPillMetric(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for iOSSafariBannerPillMetrics()
{
  return &type metadata for iOSSafariBannerPillMetrics;
}

uint64_t method lookup function for PillMetrics()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PillMetrics.__allocating_init(slotStyle:tag:variant:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 216))();
}

void destroy for SLDHighlightPillMetrics(uint64_t a1)
{

}

uint64_t initializeWithCopy for SLDHighlightPillMetrics(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  __int128 v5;
  id v6;
  id v7;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v3 = *(void **)(a2 + 56);
  v4 = *(void **)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v3;
  *(_QWORD *)(a1 + 64) = v4;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  v6 = v3;
  v7 = v4;
  return a1;
}

uint64_t assignWithCopy for SLDHighlightPillMetrics(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v4 = *(void **)(a1 + 56);
  v5 = *(void **)(a2 + 56);
  *(_QWORD *)(a1 + 56) = v5;
  v6 = v5;

  v7 = *(void **)(a1 + 64);
  v8 = *(void **)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v8;
  v9 = v8;

  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  return a1;
}

uint64_t assignWithTake for SLDHighlightPillMetrics(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);

  v4 = *(void **)(a1 + 64);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);

  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  return a1;
}

uint64_t getEnumTagSinglePayload for SLDHighlightPillMetrics(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 128))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 56);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SLDHighlightPillMetrics(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 128) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 128) = 0;
    if (a2)
      *(_QWORD *)(result + 56) = a2;
  }
  return result;
}

void *type metadata accessor for SLDHighlightPillMetrics()
{
  return &unk_1E3792848;
}

uint64_t outlined init with take of SLDHighlightPillMetrics?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SLDHighlightPillMetrics?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void outlined consume of SLDHighlightPillMetrics?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, void *a9)
{
  if (a8 != (void *)1)
  {

  }
}

uint64_t sub_199F9530C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t _s11SocialLayer23SLDHighlightPillMetrics33_00C2B47D0280335DFFDBB3BC8927527ALLVSgWOg(uint64_t a1)
{
  unint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  v2 = v1 - 1;
  if (v2 < 0)
    v2 = -1;
  return (v2 + 1);
}

uint64_t outlined retain of SLDHighlightPillMetrics(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 56);
  v3 = *(id *)(a1 + 64);
  v4 = v2;
  return a1;
}

_QWORD *outlined release of SLDHighlightPillMetrics?(_QWORD *a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15]);
  return a1;
}

id outlined copy of SLDHighlightPillMetrics?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, void *a9)
{
  id v9;
  id result;

  if (a8 != (void *)1)
  {
    v9 = a9;
    return a8;
  }
  return result;
}

double _s11SocialLayer23SLDHighlightPillMetrics33_00C2B47D0280335DFFDBB3BC8927527ALLVSgWOi0_(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 1;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  return result;
}

uint64_t outlined init with copy of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ResourceBundleClass.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

objc_class *one-time initialization function for resourceBundle()
{
  uint64_t ObjCClassFromMetadata;
  objc_class *result;

  type metadata accessor for ResourceBundleClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = (objc_class *)objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  resourceBundle.super.isa = result;
  return result;
}

uint64_t one-time initialization function for preview(uint64_t a1)
{
  return one-time initialization function for preview(a1, static ImageResource.preview, 0x77656976657250, 0xE700000000000000);
}

uint64_t ImageResource.preview.unsafeMutableAddressor()
{
  return ImageResource.preview.unsafeMutableAddressor(&one-time initialization token for preview, (uint64_t)static ImageResource.preview);
}

uint64_t static ImageResource.preview.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.preview.getter(&one-time initialization token for preview, (uint64_t)static ImageResource.preview, a1);
}

uint64_t one-time initialization function for slAttributionViewMarqueeMask(uint64_t a1)
{
  return one-time initialization function for preview(a1, static ImageResource.slAttributionViewMarqueeMask, 0xD00000000000001CLL, 0x8000000199FB1330);
}

uint64_t one-time initialization function for preview(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for ImageResource();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  if (one-time initialization token for resourceBundle != -1)
    swift_once();
  return MEMORY[0x19AEC386C](a3, a4, resourceBundle.super.isa);
}

uint64_t ImageResource.slAttributionViewMarqueeMask.unsafeMutableAddressor()
{
  return ImageResource.preview.unsafeMutableAddressor(&one-time initialization token for slAttributionViewMarqueeMask, (uint64_t)static ImageResource.slAttributionViewMarqueeMask);
}

uint64_t ImageResource.preview.unsafeMutableAddressor(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = type metadata accessor for ImageResource();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static ImageResource.slAttributionViewMarqueeMask.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.preview.getter(&one-time initialization token for slAttributionViewMarqueeMask, (uint64_t)static ImageResource.slAttributionViewMarqueeMask, a1);
}

uint64_t static ImageResource.preview.getter@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = type metadata accessor for ImageResource();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t __getCloudSharingClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SLSecurityScopedURL URL].cold.1(v0);
}

uint64_t SLDCreateGroupPhotoImageWithGroupID_cold_1()
{
  NSObject *v0;

  dlerror();
  v0 = abort_report_np();
  return SLDCreateGroupPhotoImageWithGroupID_cold_2(v0);
}

void SLDCreateGroupPhotoImageWithGroupID_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_199EFF000, log, OS_LOG_TYPE_ERROR, "SLDCreateGroupPhotoImageWithGroupID failed to retrieve group photo data from IMSPI.", v1, 2u);
}

void SLDCreateGroupPhotoImageWithData_cold_1(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 134217984;
  v5 = objc_msgSend(a1, "length");
  OUTLINED_FUNCTION_0_1(&dword_199EFF000, a2, v3, "SLDCreateGroupPhotoImageWithData had group photo data, but the group photo image ref was still nil. groupPhotoData.length: %li", (uint8_t *)&v4);
}

uint64_t __getMFMessageComposeViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SLDShareableContentService allowsConnection:].cold.1(v0);
}

uint64_t __getCSCloudSharingClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SLDFaceTimeService initiateTUConversationForAttributionIdentifier:videoEnabled:completion:].cold.1(v0);
}

void SLDValidateSupplementaryData_cold_1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;

  v0 = (void *)OUTLINED_FUNCTION_23();
  v1 = OUTLINED_FUNCTION_26(v0, 5.7779e-34);
  OUTLINED_FUNCTION_15_0(&dword_199EFF000, v2, v3, "#SLDCK supplementaryData values must be NSURLs, not %@");

  OUTLINED_FUNCTION_21();
}

void SLDValidateSupplementaryData_cold_2()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;

  v0 = (void *)OUTLINED_FUNCTION_23();
  v1 = OUTLINED_FUNCTION_26(v0, 5.7779e-34);
  OUTLINED_FUNCTION_15_0(&dword_199EFF000, v2, v3, "#SLDCK supplementaryData keys must be strings, not %@");

  OUTLINED_FUNCTION_21();
}

void SLDValidateSupplementaryData_cold_3(uint64_t a1, NSObject *a2)
{
  id v3;
  id v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  OUTLINED_FUNCTION_8();
  v4 = v3;
  OUTLINED_FUNCTION_19(&dword_199EFF000, a2, OS_LOG_TYPE_FAULT, "#SLDCK supplementaryData is supposed to be a dictionary, not a %@", v5);

  OUTLINED_FUNCTION_6();
}

uint64_t __getIMCollaborationClearTransmissionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getIMCollaborationNoticeTransmissionClass_block_invoke_cold_1(v0);
}

uint64_t __getIMCollaborationNoticeTransmissionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getIMCollaborationNoticeDispatcherClass_block_invoke_cold_1(v0);
}

void __getIMCollaborationNoticeDispatcherClass_block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;

  v0 = abort_report_np();
  -[SLInteractionHandler initWithAppIdentifier:].cold.1(v0, v1);
}

void SLSendPortraitFeedbackTypeAppButtonForAttribution_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "SLSendPortraitFeedbackTypeAppButtonForAttribution: attempted to send feedback for a nil attribution.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void SLSendPortraitFeedbackTypeAppButtonForAttribution_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "SLSendPortraitFeedbackTypeAppButtonForAttribution: unable to send feedback without an application identifier.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void SLApplicationIdentifierForPortraitFeedback_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "SLApplicationIdentifierForPortraitFeedback: Unable to create bundleRecord to find applicationIdentifier for Portrait feedback.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void SLSendPortraitFeedbackTypeDisplayedHighlight_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "SLSendPortraitFeedbackTypeForHighlight: attempted to send feedback for an invalid highlight.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void SLSendPortraitFeedbackTypeDisplayedHighlight_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "SLSendPortraitFeedbackTypeDisplayedForHighlight: unable to send feedback without an application identifier.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void SLSendPortraitFeedbackTypeUserInteractedWithHighlight_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "SLSendPortraitFeedbackTypeUserInteractedWithHighlight: attempted to send feedback for an invalid highlight.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void SLSendPortraitFeedbackTypeUserInteractedWithHighlight_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "SLSendPortraitFeedbackTypeUserInteractedWithHighlight: unable to send feedback without an application identifier.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

uint64_t __getCKPostSharingContextClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCKContainerSetupInfoClass_block_invoke_cold_1(v0);
}

uint64_t __getCKContainerSetupInfoClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SLDActiveCallService activeCallViewForStyle:maxWidth:layerContextID:reply:].cold.1(v0);
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return MEMORY[0x1E0CAE8A8]();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return MEMORY[0x1E0CAE8B8]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t __DataStorage.init(length:)()
{
  return MEMORY[0x1E0CAE8D8]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t type metadata accessor for __DataStorage()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t static AttributeScope.decodingConfiguration.getter()
{
  return MEMORY[0x1E0CAE920]();
}

uint64_t static AttributeScope.encodingConfiguration.getter()
{
  return MEMORY[0x1E0CAE928]();
}

uint64_t type metadata accessor for AttributeScopes.FoundationAttributes()
{
  return MEMORY[0x1E0CAEE20]();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x1E0CAEE50]();
}

uint64_t AttributedString.init(stringLiteral:)()
{
  return MEMORY[0x1E0CAEF60]();
}

uint64_t type metadata accessor for AttributedString.FormattingOptions()
{
  return MEMORY[0x1E0CAEF88]();
}

uint64_t AttributedString.init<A>(localized:options:table:bundle:localization:locale:comment:including:)()
{
  return MEMORY[0x1E0CAF218]();
}

uint64_t type metadata accessor for AttributedString()
{
  return MEMORY[0x1E0CAF240]();
}

uint64_t static AttributedStringKey.runBoundaries.getter()
{
  return MEMORY[0x1E0CAF558]();
}

uint64_t static AttributedStringKey.inheritedByAddedText.getter()
{
  return MEMORY[0x1E0CAF560]();
}

uint64_t static AttributedStringKey.invalidationConditions.getter()
{
  return MEMORY[0x1E0CAF568]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t static DecodableAttributedStringKey<>.decode(from:)()
{
  return MEMORY[0x1E0CAFC20]();
}

uint64_t static EncodableAttributedStringKey<>.encode(_:to:)()
{
  return MEMORY[0x1E0CAFC30]();
}

uint64_t static MarkdownDecodableAttributedStringKey<>.decodeMarkdown(from:)()
{
  return MEMORY[0x1E0CAFD00]();
}

uint64_t static MarkdownDecodableAttributedStringKey.markdownName.getter()
{
  return MEMORY[0x1E0CAFD08]();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
  MEMORY[0x1E0CB0088]();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return MEMORY[0x1E0CB0140]();
}

uint64_t Data._Representation.replaceSubrange(_:with:count:)()
{
  return MEMORY[0x1E0CB0160]();
}

uint64_t Data._Representation.append(contentsOf:)()
{
  return MEMORY[0x1E0CB0188]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x1E0CB01F0]();
}

uint64_t static Data._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1E0CB0220]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t static Locale.current.getter()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t type metadata accessor for Locale()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t CGFloat.init(truncating:)()
{
  return MEMORY[0x1E0CB1708]();
}

uint64_t static _CFObject.== infix(_:_:)()
{
  return MEMORY[0x1E0DEF0A0]();
}

uint64_t _CFObject.hash(into:)()
{
  return MEMORY[0x1E0DEF0A8]();
}

uint64_t _CFObject.hashValue.getter()
{
  return MEMORY[0x1E0DEF0B0]();
}

uint64_t ImageResource.init(name:bundle:)()
{
  return MEMORY[0x1E0CA9B98]();
}

uint64_t type metadata accessor for ImageResource()
{
  return MEMORY[0x1E0CA9BA8]();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t UIViewRepresentable._resetUIView(_:coordinator:destroy:)()
{
  return MEMORY[0x1E0CDB658]();
}

uint64_t static UIViewRepresentable.dismantleUIView(_:coordinator:)()
{
  return MEMORY[0x1E0CDB668]();
}

uint64_t UIViewRepresentable.sizeThatFits(_:uiView:context:)()
{
  return MEMORY[0x1E0CDB678]();
}

uint64_t static UIViewRepresentable._makeViewList(view:inputs:)()
{
  return MEMORY[0x1E0CDB688]();
}

uint64_t static UIViewRepresentable._layoutOptions(_:)()
{
  return MEMORY[0x1E0CDB698]();
}

uint64_t UIViewRepresentable._identifiedViewTree(in:)()
{
  return MEMORY[0x1E0CDB6A8]();
}

uint64_t UIViewRepresentable._overrideLayoutTraits(_:for:)()
{
  return MEMORY[0x1E0CDB6B8]();
}

uint64_t UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)()
{
  return MEMORY[0x1E0CDB6D0]();
}

uint64_t static UIViewRepresentable._modifyBridgedViewInputs(_:)()
{
  return MEMORY[0x1E0CDB6E0]();
}

uint64_t UIViewRepresentable.body.getter()
{
  return MEMORY[0x1E0CDB6F0]();
}

uint64_t static UIViewRepresentable._makeView(view:inputs:)()
{
  return MEMORY[0x1E0CDB6F8]();
}

uint64_t UIViewRepresentable<>.makeCoordinator()()
{
  return MEMORY[0x1E0CDB708]();
}

uint64_t static View._viewListCount(inputs:)()
{
  return MEMORY[0x1E0CDE380]();
}

uint64_t Image.init(uiImage:)()
{
  return MEMORY[0x1E0CDF6A8]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t type metadata accessor for CryptoKitError()
{
  return MEMORY[0x1E0CA91E8]();
}

uint64_t dispatch thunk of HashFunction.update(bufferPointer:)()
{
  return MEMORY[0x1E0CA92A8]();
}

uint64_t SHA256Digest.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x1E0CA92E0]();
}

uint64_t SHA256Digest.hashValue.getter()
{
  return MEMORY[0x1E0CA92E8]();
}

uint64_t type metadata accessor for SHA256Digest()
{
  return MEMORY[0x1E0CA92F8]();
}

uint64_t SymmetricKey.init<A>(data:)()
{
  return MEMORY[0x1E0CA93B0]();
}

uint64_t SymmetricKey.init(size:)()
{
  return MEMORY[0x1E0CA93B8]();
}

uint64_t type metadata accessor for SymmetricKey()
{
  return MEMORY[0x1E0CA93C8]();
}

uint64_t static SymmetricKeySize.bits128.getter()
{
  return MEMORY[0x1E0CA9440]();
}

uint64_t type metadata accessor for SymmetricKeySize()
{
  return MEMORY[0x1E0CA9458]();
}

uint64_t static AES.GCM.open(_:using:)()
{
  return MEMORY[0x1E0CA94B8]();
}

uint64_t static AES.GCM.open<A>(_:using:authenticating:)()
{
  return MEMORY[0x1E0CA94C0]();
}

uint64_t static AES.GCM.seal<A, B>(_:using:nonce:authenticating:)()
{
  return MEMORY[0x1E0CA94C8]();
}

uint64_t static AES.GCM.seal<A>(_:using:nonce:)()
{
  return MEMORY[0x1E0CA94D0]();
}

uint64_t AES.GCM.Nonce.init()()
{
  return MEMORY[0x1E0CA94F0]();
}

uint64_t type metadata accessor for AES.GCM.Nonce()
{
  return MEMORY[0x1E0CA94F8]();
}

uint64_t AES.GCM.SealedBox.combined.getter()
{
  return MEMORY[0x1E0CA9528]();
}

uint64_t AES.GCM.SealedBox.init(combined:)()
{
  return MEMORY[0x1E0CA9530]();
}

uint64_t type metadata accessor for AES.GCM.SealedBox()
{
  return MEMORY[0x1E0CA9538]();
}

uint64_t P256.Signing.PrivateKey.publicKey.getter()
{
  return MEMORY[0x1E0CA96E8]();
}

uint64_t P256.Signing.PrivateKey.init(compactRepresentable:)()
{
  return MEMORY[0x1E0CA96F0]();
}

uint64_t type metadata accessor for P256.Signing.PrivateKey()
{
  return MEMORY[0x1E0CA96F8]();
}

uint64_t P256.Signing.PublicKey.x963Representation.getter()
{
  return MEMORY[0x1E0CA9748]();
}

uint64_t P256.Signing.PublicKey.init<A>(x963Representation:)()
{
  return MEMORY[0x1E0CA9750]();
}

uint64_t type metadata accessor for P256.Signing.PublicKey()
{
  return MEMORY[0x1E0CA9758]();
}

uint64_t Digest.makeIterator()()
{
  return MEMORY[0x1E0CA9908]();
}

uint64_t static Digest.== infix(_:_:)()
{
  return MEMORY[0x1E0CA9910]();
}

uint64_t SHA256.finalize()()
{
  return MEMORY[0x1E0CA9920]();
}

uint64_t SHA256.init()()
{
  return MEMORY[0x1E0CA9938]();
}

uint64_t type metadata accessor for SHA256()
{
  return MEMORY[0x1E0CA9940]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x1E0CB17D8]();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1E0CB17F8]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t String.LocalizationValue.init(stringLiteral:)()
{
  return MEMORY[0x1E0CB18A0]();
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
  MEMORY[0x1E0CB18C0](a1._countAndFlagsBits, a1._object);
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
  MEMORY[0x1E0CB18D8](a1._countAndFlagsBits, a1._object);
}

uint64_t String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return MEMORY[0x1E0CB18E0]();
}

uint64_t type metadata accessor for String.LocalizationValue.StringInterpolation()
{
  return MEMORY[0x1E0CB18E8]();
}

uint64_t String.LocalizationValue.init(stringInterpolation:)()
{
  return MEMORY[0x1E0CB18F0]();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return MEMORY[0x1E0CB18F8]();
}

uint64_t String.LocalizationValue.init(_:)()
{
  return MEMORY[0x1E0CB1900]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x1E0CB1940]();
}

uint64_t static String.localizedStringWithFormat(_:_:)()
{
  return MEMORY[0x1E0CB1950]();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return MEMORY[0x1E0CB1988]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t String.init(localized:table:bundle:localization:locale:comment:)()
{
  return MEMORY[0x1E0CB1A38]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t String.init<A>(reflecting:)()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x1E0DEA7B8]();
}

Swift::Void __swiftcall String.append(contentsOf:)(Swift::String contentsOf)
{
  MEMORY[0x1E0DEA7E0](contentsOf._countAndFlagsBits, contentsOf._object);
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x1E0DEA800](a1._countAndFlagsBits, a1._object);
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x1E0DEA880]();
}

Swift::Int __swiftcall String.UTF16View._foreignCount()()
{
  return MEMORY[0x1E0DEA8D0]();
}

uint64_t String.UTF16View._nativeGetOffset(for:)()
{
  return MEMORY[0x1E0DEA8E8]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t UnsafeRawBufferPointer.regions.getter()
{
  return MEMORY[0x1E0CB1AB8]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1E0DEADA0]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x1E0CB1AC0]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)()
{
  return MEMORY[0x1E0CB1E68]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t NSAttributedString.init<A>(_:including:)()
{
  return MEMORY[0x1E0CB1EB8]();
}

uint64_t NSAttributedString.init(_:)()
{
  return MEMORY[0x1E0CB1EC8]();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t static OS_os_log.default.getter()
{
  return MEMORY[0x1E0DF22B8]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return MEMORY[0x1E0CB2410]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t __CocoaSet.makeIterator()()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return MEMORY[0x1E0DEC110]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x1E0DEC168](seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return MEMORY[0x1E0DEC1B0]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x1E0DEC2A8](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1E0DECBE0]();
}

{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return MEMORY[0x1E0DECE70]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x1E0DECF28](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t withCheckedContinuation<A>(isolation:function:_:)()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1E0DEDEF8]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x1E0DEDF10](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
  MEMORY[0x1E0DEDF18](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x1E0DEDF40]();
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2648](retstr, tx, ty, tz);
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
  MEMORY[0x1E0C801D8](*(_QWORD *)&algorithm, key, keyLength, data, dataLength, macOut);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
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

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x1E0C99050](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1E0C990B0](theString, idx);
}

CFIndex CFStringGetHyphenationLocationBeforeIndex(CFStringRef string, CFIndex location, CFRange limitRange, CFOptionFlags options, CFLocaleRef locale, UTF32Char *character)
{
  return MEMORY[0x1E0C990E8](string, location, limitRange.location, limitRange.length, options, locale, character);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

Boolean CFStringIsHyphenationAvailableForLocale(CFLocaleRef locale)
{
  return MEMORY[0x1E0C991C8](locale);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x1E0C9BB98]();
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BCB0](red, green, blue, alpha);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BCB8](red, green, blue, alpha);
}

CGColorRef CGColorGetConstantColor(CFStringRef colorName)
{
  return (CGColorRef)MEMORY[0x1E0C9BD10](colorName);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1E0C9BD68](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

uint64_t CGColorSpaceGetRGB()
{
  return MEMORY[0x1E0D1AAE8]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9BFC8](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextBeginPath(CGContextRef c)
{
  MEMORY[0x1E0C9C000](c);
}

void CGContextBeginTransparencyLayerWithRect(CGContextRef c, CGRect rect, CFDictionaryRef auxInfo)
{
  MEMORY[0x1E0C9C010](c, auxInfo, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x1E0C9C028](c);
}

void CGContextClosePath(CGContextRef c)
{
  MEMORY[0x1E0C9C048](c);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x1E0C9C050](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x1E0C9C198](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
  MEMORY[0x1E0C9C1B8](c, *(_QWORD *)&mode);
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
  MEMORY[0x1E0C9C200](c);
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C210](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
  MEMORY[0x1E0C9C3B8](c, alpha);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

uint64_t CGContextSetFontRenderingStyle()
{
  return MEMORY[0x1E0C9C430]();
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x1E0C9C458](c, *(_QWORD *)&quality);
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x1E0C9C4A0](c, red, green, blue, alpha);
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
  MEMORY[0x1E0C9C530](c, t);
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9C538](c, x, y);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C5F0](data);
}

uint64_t CGFontCacheGetLocalCache()
{
  return MEMORY[0x1E0C9C6C0]();
}

uint64_t CGFontCacheReset()
{
  return MEMORY[0x1E0C9C6C8]();
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1E0C9CA90](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x1E0C9CAC0](gradient);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

CGImageSourceRef CGImageSourceCreateWithDataProvider(CGDataProviderRef provider, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5A0](provider, options);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x1E0C9D2C8](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3D0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CTFontDescriptorRef CTFontCopyFontDescriptor(CTFontRef font)
{
  return (CTFontDescriptorRef)MEMORY[0x1E0CA79B0](font);
}

CTFontRef CTFontCreateCopyWithSymbolicTraits(CTFontRef font, CGFloat size, const CGAffineTransform *matrix, CTFontSymbolicTraits symTraitValue, CTFontSymbolicTraits symTraitMask)
{
  return (CTFontRef)MEMORY[0x1E0CA7A38](font, matrix, *(_QWORD *)&symTraitValue, *(_QWORD *)&symTraitMask, size);
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return (CTFontRef)MEMORY[0x1E0CA7A68](*(_QWORD *)&uiType, language, size);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1E0CA7A70](descriptor, matrix, size);
}

CFTypeRef CTFontDescriptorCopyAttribute(CTFontDescriptorRef descriptor, CFStringRef attribute)
{
  return (CFTypeRef)MEMORY[0x1E0CA7AA0](descriptor, attribute);
}

CTFontDescriptorRef CTFontDescriptorCreateCopyWithAttributes(CTFontDescriptorRef original, CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1E0CA7AB8](original, attributes);
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1E0CA7B00](attributes);
}

uint64_t CTFontDescriptorCreateWithTextStyleAndAttributes()
{
  return MEMORY[0x1E0CA7B20]();
}

CGFloat CTFontGetAscent(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x1E0CA7BA0](font);
  return result;
}

CGFloat CTFontGetDescent(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x1E0CA7BD8](font);
  return result;
}

CGFloat CTFontGetLeading(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x1E0CA7C20](font);
  return result;
}

uint64_t CTFontRemoveFromCaches()
{
  return MEMORY[0x1E0CA7D58]();
}

void CTFrameDraw(CTFrameRef frame, CGContextRef context)
{
  MEMORY[0x1E0CA7DA0](frame, context);
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x1E0CA7DD8](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x1E0CA7DE0](attrString);
}

CGSize CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetterRef framesetter, CFRange stringRange, CFDictionaryRef frameAttributes, CGSize constraints, CFRange *fitRange)
{
  double v5;
  double v6;
  CGSize result;

  MEMORY[0x1E0CA7DF8](framesetter, stringRange.location, stringRange.length, frameAttributes, fitRange, (__n128)constraints, *(__n128 *)&constraints.height);
  result.height = v6;
  result.width = v5;
  return result;
}

uint64_t CTLineCreateHyphenatedLineWithOffset()
{
  return MEMORY[0x1E0CA7E58]();
}

uint64_t CTLineCreateTruncatedLineWithTokenHandler()
{
  return MEMORY[0x1E0CA7E80]();
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1E0CA7E88](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
  MEMORY[0x1E0CA7EA8](line, context);
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0CA7EC0](line, options);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

double CTLineGetPenOffsetForFlush(CTLineRef line, CGFloat flushFactor, double flushWidth)
{
  double result;

  MEMORY[0x1E0CA7EF0](line, flushFactor, flushWidth);
  return result;
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  double result;

  MEMORY[0x1E0CA7F18](line, ascent, descent, leading);
  return result;
}

uint64_t IMFormattedDisplayStringForNumber()
{
  return MEMORY[0x1E0D36470]();
}

uint64_t IMStringIsEmail()
{
  return MEMORY[0x1E0D36868]();
}

uint64_t IMStringIsPhoneNumber()
{
  return MEMORY[0x1E0D36890]();
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

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0DC32E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t SWFrameworkLogHandle()
{
  return MEMORY[0x1E0CD7478]();
}

uint64_t SWPerformActionForDocumentURL()
{
  return MEMORY[0x1E0CD7490]();
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x1E0CD6218](*(_QWORD *)&status, reserved);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6290](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1E0CD62A0](query);
}

CFDictionaryRef SecKeyCopyAttributes(SecKeyRef key)
{
  return (CFDictionaryRef)MEMORY[0x1E0CD62F0](key);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD62F8](key, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1E0CD63A0](keyData, attributes, error);
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1E0DC52E8]();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x1E0C81580](__buf, __nbytes);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
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

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1E0C82EF8]();
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
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

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FD8](label);
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

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
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

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
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

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1E0C851B0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x1E0DEEBD8]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

int32_t u_charDigitValue(UChar32 c)
{
  return MEMORY[0x1E0DE5958](*(_QWORD *)&c);
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x1E0C86778]();
}

