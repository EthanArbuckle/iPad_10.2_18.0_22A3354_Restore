void sub_100004C60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id onBatteryStatusChanged_bounce(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a1, "onBatteryStatusChanged:andMessageType:andMessageArgument:", a2, a3, a4);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100006F20(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007098(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007158(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000072DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000079A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void sub_10001857C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
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

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_10001B424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
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

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_10001F764(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
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

void sub_100023D9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100023EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;

  _Block_object_dispose(&a15, 8);
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

void sub_100023F9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100024008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100024120(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10002424C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000242B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MOPerformanceMeasurement;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_1000243B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1000244A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{

  _Unwind_Resume(a1);
}

void sub_100024540(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10002D51C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_10002D98C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002DCB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000322D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
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

void sub_10003459C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&STACK[0x2D0], 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Block_object_dispose(&STACK[0x260], 8);
  _Block_object_dispose(&STACK[0x400], 8);
  _Unwind_Resume(a1);
}

void sub_100035734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100037CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_4_0(uint64_t a1, uint64_t a2)
{
  return a2;
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

int main(int argc, const char **argv, const char **envp)
{
  int v3;
  id os_log;
  NSObject *v5;
  NSObject *v6;
  rlim_t v7;
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  MODaemonUniverse *v17;
  id v18;
  NSObject *v19;
  rlimit v21;
  uint8_t buf[4];
  unsigned int rlim_cur;
  __int16 v24;
  unsigned int rlim_max;

  setlinebuf(__stdoutp);
  v21.rlim_cur = 0;
  v21.rlim_max = 0;
  v3 = getrlimit(8, &v21);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      main_cold_4();
LABEL_4:

    goto LABEL_13;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    rlim_cur = v21.rlim_cur;
    v24 = 1024;
    rlim_max = v21.rlim_max;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Initial No. file rlimits %u ~ %u", buf, 0xEu);
  }

  if (v21.rlim_cur <= 0x7FF)
  {
    v7 = v21.rlim_max;
    if (v21.rlim_max >= 0x800)
      v7 = 2048;
    v21.rlim_cur = v7;
    if (setrlimit(8, &v21))
    {
      v8 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      v6 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        main_cold_3();
      goto LABEL_4;
    }
  }
LABEL_13:
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v10 = objc_msgSend(v9, "isDiagnosticSubmissionAllowed");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v12 = objc_msgSend(v11, "isHealthDataSubmissionAllowed");

  v13 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    rlim_cur = v10;
    v24 = 1024;
    rlim_max = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Starting momentsd - Analytics enablement [d&u:%d, iha:%d]\n", buf, 0xEu);
  }

  if ((_set_user_dir_suffix("com.apple.momentsd") & 1) == 0)
  {
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      main_cold_2(v16);

  }
  v17 = objc_alloc_init(MODaemonUniverse);
  -[MODaemonUniverse setupServices](v17, "setupServices");
  -[MODaemonUniverse run](v17, "run");
  v18 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    main_cold_1(v19);

  return 0;
}

void OUTLINED_FUNCTION_0_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_100044D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004A59C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
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

void sub_10004C394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void sub_10004F744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
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

void sub_10004FAF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100060C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a67;

  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&STACK[0x200], 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Block_object_dispose(&STACK[0x2A0], 8);
  _Block_object_dispose(&STACK[0x2D0], 8);
  _Block_object_dispose(&STACK[0x2F0], 8);
  _Unwind_Resume(a1);
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

void sub_100061704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_1000654E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
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

void sub_100065874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_100065E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_100066220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000668B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100066E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100069D70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_3_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 8), "UTF8String");
}

void OUTLINED_FUNCTION_1_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id OUTLINED_FUNCTION_4_3(void *a1, const char *a2)
{
  return objc_msgSend(a1, "count");
}

void sub_10006DBB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void sub_10006E87C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a61, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_100071534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void sub_100073694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
  _Block_object_dispose(&a56, 8);
  _Unwind_Resume(a1);
}

void sub_100075718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100075A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000764B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

void sub_100077A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0_11(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_7_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_8_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return NSRequestConcreteImplementation(v2, v1, a1);
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1, uint64_t a2)
{
  return objc_opt_class(a1, a2);
}

void sub_10007C10C(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x228], 8);
  _Block_object_dispose(&STACK[0x258], 8);
  _Block_object_dispose(&STACK[0x288], 8);
  _Block_object_dispose(&STACK[0x2B8], 8);
  _Block_object_dispose(&STACK[0x490], 8);
  _Block_object_dispose(&STACK[0x4C0], 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

id checkLockedState_bounce(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "checkLockedState");
}

id onMatchedBatteries_bounce(void *a1, const char *a2)
{
  return objc_msgSend(a1, "onMatchedBatteries:", a2);
}

void OUTLINED_FUNCTION_1_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_5_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

id _mo_log_facility_get_os_log(dispatch_once_t *predicate)
{
  if (*predicate != -1)
    dispatch_once_f(predicate, predicate, (dispatch_function_t)_mo_log_facility_prepare);
  return (id)predicate[2];
}

os_log_t _mo_log_facility_prepare(uint64_t a1)
{
  os_log_t result;

  result = os_log_create("com.apple.momentsd", *(const char **)(a1 + 8));
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

void sub_10008DCB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

void sub_10009086C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 208), 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

void sub_100094BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

id getSWHighlightCenterClass()
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
  v0 = (void *)getSWHighlightCenterClass_softClass;
  v7 = getSWHighlightCenterClass_softClass;
  if (!getSWHighlightCenterClass_softClass)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = __getSWHighlightCenterClass_block_invoke;
    v3[3] = &unk_1002AF360;
    v3[4] = &v4;
    __getSWHighlightCenterClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100098F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSWHighlightCenterClass_block_invoke(uint64_t a1)
{
  Class result;
  __int128 v3;
  uint64_t v4;

  if (!SharedWithYouLibraryCore_frameworkLibrary)
  {
    v3 = off_1002B1218;
    v4 = 0;
    SharedWithYouLibraryCore_frameworkLibrary = _sl_dlopen(&v3, 0);
  }
  result = objc_getClass("SWHighlightCenter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getSWHighlightCenterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100099F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17(uint64_t a1)
{

}

void sub_10009A6B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10009BC80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_3(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0xCu);
}

void sub_1000A1950()
{
  operator delete();
}

void sub_1000A1C78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25)
{
  void *v25;
  void *v26;
  uint64_t v27;

  *(_QWORD *)(v27 - 80) = &a18;
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v27 - 80));

  _Unwind_Resume(a1);
}

void sub_1000A1DB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000A1EC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000A1FE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000A2210(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000A233C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000A2474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10)
{

  _Unwind_Resume(a1);
}

void std::vector<double>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 8 * a2;
  }
  else
  {
    std::vector<double>::__append((char **)a1, a2 - v2);
  }
}

void sub_1000A255C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000A2664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

Hdbscan *std::unique_ptr<Hdbscan>::reset[abi:ne180100](Hdbscan **a1, Hdbscan *a2)
{
  Hdbscan *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    Hdbscan::~Hdbscan(result);
    operator delete();
  }
  return result;
}

void Hdbscan::~Hdbscan(Hdbscan *this)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void **v9;

  v2 = (void *)*((_QWORD *)this + 25);
  if (v2)
  {
    *((_QWORD *)this + 26) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 22);
  if (v3)
  {
    *((_QWORD *)this + 23) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 19);
  if (v4)
  {
    *((_QWORD *)this + 20) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((_QWORD *)this + 16);
  if (v5)
  {
    *((_QWORD *)this + 17) = v5;
    operator delete(v5);
  }
  v9 = (void **)((char *)this + 104);
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](&v9);
  v9 = (void **)((char *)this + 80);
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](&v9);
  v6 = (void *)*((_QWORD *)this + 6);
  if (v6)
  {
    *((_QWORD *)this + 7) = v6;
    operator delete(v6);
  }
  v7 = (void *)*((_QWORD *)this + 3);
  if (v7)
  {
    *((_QWORD *)this + 4) = v7;
    operator delete(v7);
  }
  v8 = *(void **)this;
  if (*(_QWORD *)this)
  {
    *((_QWORD *)this + 1) = v8;
    operator delete(v8);
  }
}

void std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<double>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::vector<double>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = *a1;
  v2 = a1[1];
  if (v2 != *a1)
  {
    v4 = a1[1];
    do
    {
      v6 = *(void **)(v4 - 24);
      v4 -= 24;
      v5 = v6;
      if (v6)
      {
        *(_QWORD *)(v2 - 16) = v5;
        operator delete(v5);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

_QWORD *std::vector<std::vector<double>>::__init_with_size[abi:ne180100]<std::vector<double>*,std::vector<double>*>(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    std::vector<std::vector<double>>::__vallocate[abi:ne180100](result, a4);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<double>>,std::vector<double>*,std::vector<double>*,std::vector<double>*>((uint64_t)(v6 + 2), a2, a3, (_QWORD *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_1000A28AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::vector<double>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<double>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<double>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_1000A29B0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

_QWORD *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<double>>,std::vector<double>*,std::vector<double>*,std::vector<double>*>(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v4;
  uint64_t v6;
  _QWORD v8[3];
  char v9;
  _QWORD *v10;
  _QWORD *v11;

  v4 = a4;
  v10 = a4;
  v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  v9 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      *v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(v4, *(const void **)v6, *(_QWORD *)(v6 + 8), (uint64_t)(*(_QWORD *)(v6 + 8) - *(_QWORD *)v6) >> 3);
      v4 = v11 + 3;
      v11 += 3;
      v6 += 24;
    }
    while (v6 != a3);
  }
  v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<double>>,std::vector<double>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_1000A2AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<double>>,std::vector<double>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<double>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1000A2B1C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<double>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<double>>,std::vector<double>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<double>>,std::vector<double>*>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<double>>,std::vector<double>*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = **(_QWORD **)(a1 + 16);
  v2 = **(_QWORD **)(a1 + 8);
  if (v1 != v2)
  {
    v3 = **(_QWORD **)(a1 + 16);
    do
    {
      v5 = *(void **)(v3 - 24);
      v3 -= 24;
      v4 = v5;
      if (v5)
      {
        *(_QWORD *)(v1 - 16) = v4;
        operator delete(v4);
      }
      v1 = v3;
    }
    while (v3 != v2);
  }
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

_QWORD *std::vector<std::vector<double>>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;
  size_t v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<std::vector<double>>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    v5 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v4, v5);
    a1[1] = &v4[v5];
  }
  return a1;
}

void sub_1000A2D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void std::vector<double>::__append(char **a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = *a1;
    v9 = v7 - *a1;
    v10 = a2 + (v9 >> 3);
    if (v10 >> 61)
      std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]();
    v11 = v9 >> 3;
    v12 = v5 - v8;
    if (v12 >> 2 > v10)
      v10 = v12 >> 2;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v4, v13);
      v8 = *a1;
      v7 = a1[1];
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[8 * v11];
    v16 = &v14[8 * v13];
    bzero(v15, 8 * a2);
    v17 = &v15[8 * a2];
    while (v7 != v8)
    {
      v18 = *((_QWORD *)v7 - 1);
      v7 -= 8;
      *((_QWORD *)v15 - 1) = v18;
      v15 -= 8;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
      operator delete(v8);
  }
}

_BYTE *OUTLINED_FUNCTION_2_3(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_4_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void OUTLINED_FUNCTION_6_2(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, a5, 2u);
}

void sub_1000B4008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18(uint64_t a1)
{

}

void sub_1000B4F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000B5D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000B6938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000B7060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000B79DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000B8014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000B86B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1000B8EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000B961C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000B9900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1000BA040(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000BAAFC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1000BC580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000BCF94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000BD400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000BDA50(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1000BE450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000BECD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1000C009C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000C0468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000C06A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000C091C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000C0BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000C0E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000C1094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000C3A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19(uint64_t a1)
{

}

void sub_1000C5CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

void sub_1000C6904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  uint64_t v49;

  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v49 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1000C6F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1000C74C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void sub_1000C82F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000CBD04(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x908], 8);
  _Block_object_dispose(&STACK[0x938], 8);
  _Unwind_Resume(a1);
}

void sub_1000D453C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_1000D57A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000D7618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a70;
  uint64_t v70;

  _Block_object_dispose(&a70, 8);
  _Block_object_dispose(&STACK[0x218], 8);
  _Block_object_dispose(&STACK[0x248], 8);
  _Block_object_dispose(&STACK[0x278], 8);
  _Block_object_dispose(&STACK[0x2A8], 8);
  _Block_object_dispose(&STACK[0x2D8], 8);
  _Block_object_dispose(&STACK[0x308], 8);
  _Block_object_dispose(&STACK[0x338], 8);
  _Block_object_dispose((const void *)(v70 - 248), 8);
  _Block_object_dispose((const void *)(v70 - 200), 8);
  _Block_object_dispose((const void *)(v70 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1000D95A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_8_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 8u);
}

void OUTLINED_FUNCTION_4_5(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, a3, a4, a5, 0xCu);
}

id OUTLINED_FUNCTION_5_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "count");
}

void sub_1000DD3C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20(uint64_t a1)
{

}

void sub_1000DEA74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

id __Block_byref_object_copy__62(uint64_t a1, uint64_t a2)
{
  id result;

  result = objc_retainBlock(*(id *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__63(uint64_t a1)
{

}

uint64_t MomentsLibraryCore(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD v8[2];
  uint64_t v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v1 = MomentsLibraryCore_frameworkLibrary;
  v7 = MomentsLibraryCore_frameworkLibrary;
  if (!MomentsLibraryCore_frameworkLibrary)
  {
    v8[0] = *(_OWORD *)off_1002B27A8;
    v8[1] = *(_OWORD *)off_1002B27B8;
    v9 = 0;
    v2 = _sl_dlopen(v8, a1);
    v5[3] = v2;
    MomentsLibraryCore_frameworkLibrary = v2;
    v1 = v2;
  }
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1000E07E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getMOPromptManagerClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getMOPromptManagerClass_softClass;
  v6 = getMOPromptManagerClass_softClass;
  if (!getMOPromptManagerClass_softClass)
  {
    MomentsLibraryCore(0);
    Class = objc_getClass("MOPromptManager");
    v4[3] = (uint64_t)Class;
    getMOPromptManagerClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1000E087C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getMOEventBundleClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getMOEventBundleClass_softClass;
  v6 = getMOEventBundleClass_softClass;
  if (!getMOEventBundleClass_softClass)
  {
    MomentsLibraryCore(0);
    Class = objc_getClass("MOEventBundle");
    v4[3] = (uint64_t)Class;
    getMOEventBundleClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1000E0910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getMOEventClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getMOEventClass_softClass;
  v6 = getMOEventClass_softClass;
  if (!getMOEventClass_softClass)
  {
    MomentsLibraryCore(0);
    Class = objc_getClass("MOEvent");
    v4[3] = (uint64_t)Class;
    getMOEventClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1000E09A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1000E1540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21(uint64_t a1)
{

}

void sub_1000E20EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void sub_1000E31D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void sub_1000E7E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000E7F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000E8084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000ED26C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22(uint64_t a1)
{

}

void sub_1000F1EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_13(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

void sub_1000F6F08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000F70F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100106490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23(uint64_t a1)
{

}

void sub_10010734C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100108034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100108A30(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_100109C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10010DEF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24(uint64_t a1)
{

}

void sub_10010FDA8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 232), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_100110584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a51, 8);
  _Unwind_Resume(a1);
}

void sub_100110E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 200), 8);
  _Block_object_dispose((const void *)(v33 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1001118D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10011282C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100113590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  uint64_t v59;

  _Block_object_dispose(&a59, 8);
  _Block_object_dispose((const void *)(v59 - 224), 8);
  _Block_object_dispose((const void *)(v59 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_100113C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100114494(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1001146A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

id OUTLINED_FUNCTION_14@<X0>(uint64_t a1@<X8>)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 8) + 40), "count");
}

void OUTLINED_FUNCTION_15(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_6_3(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_100122DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 200), 8);
  _Block_object_dispose((const void *)(v37 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__25(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25(uint64_t a1)
{

}

void sub_100126D58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__26(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__26(uint64_t a1)
{

}

void sub_1001271B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10012DCEC(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x240], 8);
  _Unwind_Resume(a1);
}

void sub_10012F49C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 208), 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__27(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__27(uint64_t a1)
{

}

void OUTLINED_FUNCTION_4_7(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t _mo_analytics_get_event(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void log_analytics_submission(void *a1, void *a2)
{
  id v3;
  id v4;
  NSMutableString *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  id os_log;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  NSMutableString *v21;
  _BYTE v22[128];

  v3 = a1;
  v4 = a2;
  v5 = objc_opt_new(NSMutableString);
  -[NSMutableString appendFormat:](v5, "appendFormat:", CFSTR("\n=== BEGIN analytics submission for event %@ ===\n"), v3);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_35));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v12));
        -[NSMutableString appendFormat:](v5, "appendFormat:", CFSTR("%@ : %@\n"), v12, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v9);
  }

  -[NSMutableString appendFormat:](v5, "appendFormat:", CFSTR("=== END analytics submission for event %@ ===\n"), v3);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
  v15 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

}

int64_t __log_analytics_submission_block_invoke(id a1, NSString *a2, NSString *a3)
{
  return -[NSString compare:](a2, "compare:", a3);
}

void sub_100138E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__28(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__28(uint64_t a1)
{

}

void sub_1001391F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100139588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_100139968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_11(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_5_7()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_6_4(uint64_t a1, uint64_t a2)
{
  return a2;
}

void OUTLINED_FUNCTION_13_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_15_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_17(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10013A4C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__29(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__29(uint64_t a1)
{

}

void sub_10013AC0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_10013B1C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10013B7BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_1_12(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "count");
}

void sub_100141AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Block_object_dispose(&a59, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__30(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__30(uint64_t a1)
{

}

void sub_1001425CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10014C4E0(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x450], 8);
  _Block_object_dispose(&STACK[0x470], 8);
  _Block_object_dispose(&STACK[0x490], 8);
  _Block_object_dispose(&STACK[0x4B0], 8);
  _Block_object_dispose(&STACK[0x4D0], 8);
  _Block_object_dispose(&STACK[0x4F0], 8);
  _Block_object_dispose(&STACK[0x510], 8);
  _Block_object_dispose(&STACK[0x540], 8);
  _Block_object_dispose(&STACK[0x570], 8);
  _Block_object_dispose(&STACK[0x5A0], 8);
  _Block_object_dispose(&STACK[0x5D0], 8);
  _Block_object_dispose(&STACK[0x600], 8);
  _Block_object_dispose(&STACK[0xD10], 8);
  _Block_object_dispose(&STACK[0x630], 8);
  _Unwind_Resume(a1);
}

void sub_100152420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1001547E4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_1_13(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void sub_10015E618(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x238], 8);
  _Block_object_dispose(&STACK[0x268], 8);
  _Block_object_dispose(&STACK[0x298], 8);
  _Block_object_dispose(&STACK[0x2C8], 8);
  _Block_object_dispose(&STACK[0x4A0], 8);
  _Block_object_dispose(&STACK[0x4D0], 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__31(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__31(uint64_t a1)
{

}

void sub_10015FDE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,uint64_t a22,uint64_t a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,void *a38,uint64_t a39,uint64_t a40,uint64_t a41,void *a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  void *__p;
  void *v68;
  void *v69;
  void *v70;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_10016049C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(double *a1, double *a2, double *a3, double result)
{
  double *v4;
  unint64_t v7;
  double *v8;
  double *v9;
  int v10;
  double *v11;
  double *v12;
  double *v13;
  double v14;
  double v15;
  double *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double *v21;
  double v22;
  double *v23;
  double v24;
  double v25;
  double v26;
  double *v27;
  double v28;
  double v29;
  double v30;

  if (a3 != a2)
  {
    v4 = a3;
    do
    {
      v7 = v4 - a1;
      if (v7 < 2)
        break;
      if (v7 == 3)
      {
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(a1, a1 + 1, v4 - 1);
        return result;
      }
      if (v7 == 2)
      {
        result = *(v4 - 1);
        v30 = *a1;
        if (result < *a1)
        {
          *a1 = result;
          *(v4 - 1) = v30;
        }
        return result;
      }
      if ((char *)v4 - (char *)a1 <= 63)
        return std::__selection_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(a1, v4, result);
      v8 = &a1[v7 >> 1];
      v9 = v4 - 1;
      v10 = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(a1, v8, v4 - 1);
      result = *a1;
      if (*a1 >= *v8)
      {
        v11 = v4 - 1;
        while (--v11 != a1)
        {
          if (*v11 < *v8)
          {
            *a1 = *v11;
            *v11 = result;
            ++v10;
            goto LABEL_13;
          }
        }
        v21 = a1 + 1;
        if (result >= *v9)
        {
          while (v21 != v9)
          {
            v22 = *v21;
            if (result < *v21)
            {
              *v21++ = *v9;
              *v9 = v22;
              goto LABEL_45;
            }
            ++v21;
          }
          return result;
        }
LABEL_45:
        if (v21 == v9)
          return result;
        while (1)
        {
          v25 = *a1;
          do
          {
            v26 = *v21++;
            result = v26;
          }
          while (v25 >= v26);
          v27 = v21 - 1;
          do
          {
            v28 = *--v9;
            v29 = v28;
          }
          while (v25 < v28);
          if (v27 >= v9)
            break;
          *v27 = v29;
          *v9 = result;
        }
        a1 = v21 - 1;
        if (v27 > a2)
          return result;
      }
      else
      {
        v11 = v4 - 1;
LABEL_13:
        v12 = a1 + 1;
        if (a1 + 1 >= v11)
        {
          v16 = a1 + 1;
        }
        else
        {
          v13 = a1 + 1;
          while (1)
          {
            v14 = *v8;
            do
            {
              v15 = *v13++;
              result = v15;
            }
            while (v15 < v14);
            v16 = v13 - 1;
            do
            {
              v17 = *--v11;
              v18 = v17;
            }
            while (v17 >= v14);
            if (v16 >= v11)
              break;
            *v16 = v18;
            *v11 = result;
            ++v10;
            if (v16 == v8)
              v8 = v11;
          }
        }
        if (v16 != v8)
        {
          result = *v8;
          v19 = *v16;
          if (*v8 < *v16)
          {
            *v16 = result;
            *v8 = v19;
            ++v10;
          }
        }
        if (v16 == a2)
          return result;
        if (!v10)
        {
          if (v16 <= a2)
          {
            v23 = v16 + 1;
            while (v23 != v4)
            {
              v24 = *(v23 - 1);
              result = *v23++;
              if (result < v24)
                goto LABEL_29;
            }
          }
          else
          {
            while (v12 != v16)
            {
              v20 = *(v12 - 1);
              result = *v12++;
              if (result < v20)
                goto LABEL_29;
            }
          }
          return result;
        }
LABEL_29:
        if (v16 <= a2)
          a1 = v16 + 1;
        else
          v4 = v16;
      }
    }
    while (v4 != a2);
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(double *a1, double *a2, double *a3)
{
  double v3;
  double v4;
  double v5;
  double v6;

  v3 = *a2;
  v4 = *a1;
  v5 = *a3;
  if (*a2 < *a1)
  {
    if (v5 < v3)
    {
      *a1 = v5;
      *a3 = v4;
      return 1;
    }
    *a1 = v3;
    *a2 = v4;
    if (*a3 >= v4)
      return 1;
    *a2 = *a3;
    *a3 = v4;
    return 2;
  }
  if (v5 < v3)
  {
    *a2 = v5;
    *a3 = v3;
    v6 = *a1;
    if (*a2 >= *a1)
      return 1;
    *a1 = *a2;
    *a2 = v6;
    return 2;
  }
  return 0;
}

double std::__selection_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(double *a1, double *a2, double result)
{
  double *v3;
  double *v4;
  double *v5;
  double *v6;
  double v7;
  double v8;

  while (a1 != a2 - 1)
  {
    v3 = a1++;
    if (v3 != a2 && a1 != a2)
    {
      result = *v3;
      v4 = a1;
      v5 = v3;
      v6 = a1;
      do
      {
        v7 = *v6++;
        v8 = v7;
        if (v7 < result)
        {
          result = v8;
          v5 = v4;
        }
        v4 = v6;
      }
      while (v6 != a2);
      if (v5 != v3)
      {
        result = *v3;
        *v3 = *v5;
        *v5 = result;
      }
    }
  }
  return result;
}

void sub_1001611D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__32(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__32(uint64_t a1)
{

}

void sub_1001642F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100164698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100164A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10016540C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
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

void sub_100165C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1001662DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100166870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100166FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1001675F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
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

void sub_1001681A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

void sub_100168C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_100169174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100169400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10016A07C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_14(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_fault_impl(a1, v4, OS_LOG_TYPE_FAULT, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_9_1(uint64_t result, float a2)
{
  _QWORD *v2;
  float *v3;

  *v3 = a2;
  *v2 = result;
  return result;
}

void sub_10016E9C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&STACK[0x260], 8);
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__33(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__33(uint64_t a1)
{

}

void sub_1001719A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1001731E0(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x440], 8);
  _Block_object_dispose(&STACK[0x460], 8);
  _Block_object_dispose(&STACK[0x480], 8);
  _Block_object_dispose(&STACK[0x4A0], 8);
  _Block_object_dispose(&STACK[0x4C0], 8);
  _Block_object_dispose(&STACK[0x7E0], 8);
  _Unwind_Resume(a1);
}

void sub_100173CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100177BB0(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x250], 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__34(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__34(uint64_t a1)
{

}

void sub_100178F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  _Block_object_dispose(&a55, 8);
  _Unwind_Resume(a1);
}

void sub_10017C514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10017D074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_100181848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a67;

  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

void sub_100184518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__35(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__35(uint64_t a1)
{

}

id OUTLINED_FUNCTION_5_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "weekday");
}

void sub_10018ACF8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose(&STACK[0x2F0], 8);
  _Block_object_dispose(&STACK[0x310], 8);
  _Block_object_dispose(&STACK[0x330], 8);
  _Block_object_dispose(&STACK[0x360], 8);
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__36(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__36(uint64_t a1)
{

}

dispatch_time_t MODispatchGroupWait(void *a1, dispatch_time_t a2, void *a3)
{
  NSObject *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;

  v5 = a1;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MODiagnosticReporter defaultReporter](MODiagnosticReporter, "defaultReporter"));
  objc_msgSend(v7, "maxTimeout");
  v9 = (double)(unint64_t)v8 * 1000000000.0;
  v10 = (unint64_t)v9;
  if (a2 == -1)
  {
    v11 = dispatch_time(0, 3 * v10);
  }
  else
  {
    if (v10 >= a2)
      v11 = a2;
    else
      v11 = (unint64_t)v9;
    if (v10 >= a2)
      a2 = 0;
    else
      a2 -= v11;
  }
  if (dispatch_group_wait(v5, v11))
  {
    objc_msgSend(v7, "reportIncident:subtype:context:", CFSTR("Hang"), CFSTR("GroupTimeout"), v6);
    if (a2)
      a2 = dispatch_group_wait(v5, a2) == 0;
  }
  else
  {
    a2 = 1;
  }

  return a2;
}

BOOL MOSemaphoreWait_Internal(void *a1, _QWORD *a2, void *a3, double a4)
{
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  intptr_t v10;
  void *v11;
  id v12;
  void *v13;
  _BOOL8 v14;
  NSErrorUserInfoKey v16;
  const __CFString *v17;

  v7 = a3;
  v8 = a1;
  v9 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v10 = dispatch_semaphore_wait(v8, v9);

  if (v10)
  {
    v16 = NSLocalizedDescriptionKey;
    v17 = CFSTR("semaphore wait timeout");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 15, v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MODiagnosticReporter defaultReporter](MODiagnosticReporter, "defaultReporter"));
    objc_msgSend(v13, "reportIncident:subtype:context:", CFSTR("Hang"), CFSTR("SemaphoreTimeout"), v7);

    v14 = v12 == 0;
    if (a2 && v12)
    {
      v12 = objc_retainAutorelease(v12);
      v14 = 0;
      *a2 = v12;
    }
  }
  else
  {
    v12 = 0;
    v14 = 1;
  }

  return v14;
}

BOOL MOSemaphoreWaitAndFaultIfTimeout_Internal(void *a1, _QWORD *a2, void *a3, double a4)
{
  _BOOL8 v4;
  id os_log;
  NSObject *v6;

  v4 = MOSemaphoreWait_Internal(a1, a2, a3, a4);
  if (!v4)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      MOSemaphoreWaitAndFaultIfTimeout_Internal_cold_1(v6);

  }
  return v4;
}

BOOL MOSemaphoreWaitDefaultTimeout_Internal(void *a1, _QWORD *a2, void *a3)
{
  return MOSemaphoreWait_Internal(a1, a2, a3, 3600.0);
}

BOOL MOSemaphoreWaitAndFaultIfTimeoutDefaultTimeout_Internal(void *a1, _QWORD *a2, void *a3)
{
  return MOSemaphoreWaitAndFaultIfTimeout_Internal(a1, a2, a3, 3600.0);
}

void sub_100193EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__37(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__37(uint64_t a1)
{

}

void sub_100196288(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose(&STACK[0x5E0], 8);
  _Block_object_dispose(&STACK[0x610], 8);
  _Block_object_dispose(&STACK[0x640], 8);
  _Block_object_dispose(&STACK[0x670], 8);
  _Block_object_dispose(&STACK[0x6A0], 8);
  _Block_object_dispose(&STACK[0x6D0], 8);
  _Block_object_dispose(&STACK[0x700], 8);
  _Block_object_dispose(&STACK[0x730], 8);
  _Block_object_dispose(&STACK[0x760], 8);
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1001992D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_10019D4E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_10019F9E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1001A14D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Unwind_Resume(a1);
}

void sub_1001A3EBC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 232), 8);
  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1001A4C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1001A6B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_7_2(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_1001A8704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__38(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__38(uint64_t a1)
{

}

void sub_1001A8F54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a50, 8);
  _Unwind_Resume(a1);
}

void sub_1001A9F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void sub_1001AA8E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_1001AC2D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a65;
  char a71;

  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

void sub_1001ACF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
  uint64_t v54;

  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose((const void *)(v54 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1001AFA74(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1001B19A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_9(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

void sub_1001C2BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 208), 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__39(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__39(uint64_t a1)
{

}

void sub_1001C469C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__40(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__40(uint64_t a1)
{

}

void sub_1001C5118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  _Block_object_dispose(&a57, 8);
  _Unwind_Resume(a1);
}

void sub_1001C8FBC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1001C9720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_1001C9C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1001CA694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1001CBCB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a51, 8);
  _Unwind_Resume(a1);
}

void sub_1001CC6D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a55, 8);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_14_0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "count");
}

void sub_1001D0528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__41(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__41(uint64_t a1)
{

}

void sub_1001D1978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a47, 8);
  _Unwind_Resume(a1);
}

void sub_1001D24A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1001D3FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1001D4F4C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1001D582C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1001D5DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_7_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x30u);
}

void _MODiagnosticReporter_NotificationHandler(uint64_t a1, uint64_t a2)
{
  id os_log;
  NSObject *v5;
  void *v6;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    _MODiagnosticReporter_NotificationHandler_cold_1(a2, v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MODiagnosticReporter defaultReporter](MODiagnosticReporter, "defaultReporter"));
  objc_msgSend(v6, "_notificationHandlerWithNotificationRef:andOptionFlags:", a1, a2);

}

void sub_1001D7CCC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

uint64_t one-time initialization function for shared()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  __swift_allocate_value_buffer(v0, static MOFeedbackAssistantLogger.shared);
  __swift_project_value_buffer(v0, (uint64_t)static MOFeedbackAssistantLogger.shared);
  return Logger.init(subsystem:category:)(0xD000000000000023, 0x8000000100245940, 0xD000000000000013, 0x800000010029F590);
}

uint64_t MOFeedbackAssistantLogger.shared.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for shared != -1)
    swift_once(&one-time initialization token for shared, one-time initialization function for shared);
  v0 = type metadata accessor for Logger(0);
  return __swift_project_value_buffer(v0, (uint64_t)static MOFeedbackAssistantLogger.shared);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t static MOFeedbackAssistantLogger.shared.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (one-time initialization token for shared != -1)
    swift_once(&one-time initialization token for shared, one-time initialization function for shared);
  v2 = type metadata accessor for Logger(0);
  v3 = __swift_project_value_buffer(v2, (uint64_t)static MOFeedbackAssistantLogger.shared);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

id MOFeedbackAssistantLogger.init()()
{
  return MOFeedbackAssistantLogger.init()(type metadata accessor for MOFeedbackAssistantLogger);
}

uint64_t type metadata accessor for MOFeedbackAssistantLogger()
{
  return objc_opt_self(_TtC8momentsd25MOFeedbackAssistantLogger);
}

id MOFeedbackAssistantLogger.__deallocating_deinit()
{
  return MOFeedbackAssistantLogger.__deallocating_deinit(type metadata accessor for MOFeedbackAssistantLogger);
}

uint64_t static MOFeedbackAssistant.triggerFeedbackAssistantFlow(flowIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t ObjectType;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD v25[4];

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin();
  v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TaskPriority(0);
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  v9 = (_QWORD *)swift_allocObject(&unk_1002B65A0, 56, 7);
  v9[2] = 0;
  v10 = v9 + 2;
  v9[3] = 0;
  v9[4] = a1;
  v9[5] = a2;
  v9[6] = v2;
  v11 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  v12 = swift_bridgeObjectRetain(a2);
  if (v11 == 1)
  {
    outlined destroy of TaskPriority?((uint64_t)v6);
    v13 = 7168;
LABEL_6:
    v22 = 0;
    goto LABEL_7;
  }
  v14 = TaskPriority.rawValue.getter(v12);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  v13 = v14 | 0x1C00;
  v15 = *v10;
  if (!*v10)
    goto LABEL_6;
  v16 = v9[3];
  ObjectType = swift_getObjectType(*v10);
  swift_unknownObjectRetain(v15, v18);
  v19 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v16);
  v21 = v20;
  swift_unknownObjectRelease(v15);
  if (!(v21 | v19))
    goto LABEL_6;
  v25[0] = 0;
  v25[1] = 0;
  v22 = v25;
  v25[2] = v19;
  v25[3] = v21;
LABEL_7:
  v23 = swift_task_create(v13, v22, (char *)&type metadata for () + 8, &async function pointer to partial apply for closure #1 in static MOFeedbackAssistant.triggerFeedbackAssistantFlow(flowIdentifier:), v9);
  return swift_release(v23);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t closure #1 in static MOFeedbackAssistant.triggerFeedbackAssistantFlow(flowIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[34] = a5;
  v6[35] = a6;
  v6[33] = a4;
  return swift_task_switch(closure #1 in static MOFeedbackAssistant.triggerFeedbackAssistantFlow(flowIdentifier:), 0, 0);
}

uint64_t closure #1 in static MOFeedbackAssistant.triggerFeedbackAssistantFlow(flowIdentifier:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  unint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  unint64_t v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t ObjCClassFromMetadata;
  void *v25;
  id v26;
  Swift::String v27;
  Swift::String v28;
  Swift::String v29;
  uint64_t countAndFlagsBits;
  void *object;
  id v32;
  unint64_t v33;
  unint64_t v34;
  const char *v35;
  unint64_t v36;
  Swift::String v37;
  Swift::String v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  _BOOL4 v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  _BOOL4 v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  id v72;
  Swift::String v73;
  Swift::String v74;
  Swift::String v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  id v79;
  Swift::String v80;
  Swift::String v81;
  Swift::String v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  id v86;
  Swift::String v87;
  Swift::String v88;
  Swift::String v89;
  uint64_t v90;
  NSObject *v91;
  os_log_type_t v92;
  _BOOL4 v93;
  unint64_t v94;
  uint64_t v95;
  uint8_t *v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  Swift::String v103;
  Swift::String v104;
  Swift::String v105;
  Swift::String v106;

  if ((objc_msgSend((id)objc_opt_self(MOPlatformInfo), "isSeedBuild") & 1) != 0)
  {
    v1 = v0 + 256;
    *(_QWORD *)(v0 + 80) = 0;
    *(_QWORD *)(v0 + 88) = 0;
    *(_QWORD *)(v0 + 96) = 0;
    *(_QWORD *)(v0 + 104) = 0;
    if (one-time initialization token for shared != -1)
      swift_once(&one-time initialization token for shared, one-time initialization function for shared);
    v99 = v0 + 248;
    v2 = *(_QWORD *)(v0 + 272);
    v3 = type metadata accessor for Logger(0);
    *(_QWORD *)(v0 + 288) = __swift_project_value_buffer(v3, (uint64_t)static MOFeedbackAssistantLogger.shared);
    v4 = swift_bridgeObjectRetain_n(v2, 2);
    v5 = Logger.logObject.getter(v4);
    v6 = static os_log_type_t.default.getter();
    v7 = os_log_type_enabled(v5, v6);
    v8 = *(_QWORD *)(v0 + 272);
    if (v7)
    {
      v9 = *(_QWORD *)(v0 + 264);
      v10 = (uint8_t *)swift_slowAlloc(12, -1);
      v11 = swift_slowAlloc(32, -1);
      v102 = v11;
      *(_DWORD *)v10 = 136315138;
      swift_bridgeObjectRetain(v8);
      v12 = v9;
      v1 = v0 + 256;
      *(_QWORD *)(v0 + 256) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v8, &v102);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 256, v0 + 264, v10 + 4, v10 + 12);
      swift_bridgeObjectRelease_n(v8, 3);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Warming up feedback assistant flow for form %s", v10, 0xCu);
      swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v11, -1, -1);
      swift_slowDealloc(v10, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n(v8, 2);
    }

    v100 = v0 + 224;
    if (*(_QWORD *)(v0 + 264) == 0xD00000000000002BLL && *(_QWORD *)(v0 + 272) == 0x80000001002452A0
      || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      v23 = *(_QWORD *)(v0 + 280);
      swift_bridgeObjectRelease_n(0, 2);
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v23);
      v25 = (void *)objc_opt_self(NSBundle);
      v26 = objc_msgSend(v25, "bundleForClass:", ObjCClassFromMetadata);
      v103._countAndFlagsBits = 0xD000000000000058;
      v103._object = (void *)0x80000001002455F0;
      v27._object = (void *)0x8000000100245360;
      v27._countAndFlagsBits = 0xD00000000000001FLL;
      v28._countAndFlagsBits = 0;
      v28._object = (void *)0xE000000000000000;
      v29 = NSLocalizedString(_:tableName:bundle:value:comment:)(v27, (Swift::String_optional)0, (NSBundle)v26, v28, v103);
      countAndFlagsBits = v29._countAndFlagsBits;
      object = v29._object;

      *(Swift::String *)(v0 + 80) = v29;
      v32 = objc_msgSend(v25, "bundleForClass:", ObjCClassFromMetadata);
      v33 = 0xD00000000000003DLL;
      v34 = 0xD00000000000005FLL;
      v98 = 0x8000000100245690;
      v35 = "Please share your feedback on enabling Journaling Suggestions";
    }
    else if (*(_QWORD *)(v0 + 264) == 0xD00000000000002ALL && *(_QWORD *)(v0 + 272) == 0x80000001002452D0
           || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      v69 = *(_QWORD *)(v0 + 280);
      swift_bridgeObjectRelease_n(0, 2);
      v70 = swift_getObjCClassFromMetadata(v69);
      v71 = (void *)objc_opt_self(NSBundle);
      v72 = objc_msgSend(v71, "bundleForClass:", v70);
      v104._countAndFlagsBits = 0xD000000000000058;
      v104._object = (void *)0x8000000100245530;
      v73._object = (void *)0x8000000100245360;
      v73._countAndFlagsBits = 0xD00000000000001FLL;
      v74._countAndFlagsBits = 0;
      v74._object = (void *)0xE000000000000000;
      v75 = NSLocalizedString(_:tableName:bundle:value:comment:)(v73, (Swift::String_optional)0, (NSBundle)v72, v74, v104);
      countAndFlagsBits = v75._countAndFlagsBits;
      object = v75._object;

      *(Swift::String *)(v0 + 80) = v75;
      v32 = objc_msgSend(v71, "bundleForClass:", v70);
      v33 = 0xD00000000000003DLL;
      v34 = 0xD00000000000005FLL;
      v98 = 0x8000000100245590;
      v35 = "Please share your feedback on Journaling Suggestions settings";
    }
    else
    {
      if (*(_QWORD *)(v0 + 264) == 0xD000000000000029 && *(_QWORD *)(v0 + 272) == 0x8000000100245300
        || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        v76 = *(_QWORD *)(v0 + 280);
        swift_bridgeObjectRelease_n(0, 2);
        v77 = swift_getObjCClassFromMetadata(v76);
        v78 = (void *)objc_opt_self(NSBundle);
        v79 = objc_msgSend(v78, "bundleForClass:", v77);
        v105._object = (void *)0x8000000100245460;
        v80._object = (void *)0x8000000100245360;
        v80._countAndFlagsBits = 0xD00000000000001FLL;
        v81._countAndFlagsBits = 0;
        v81._object = (void *)0xE000000000000000;
        v105._countAndFlagsBits = 0xD00000000000003DLL;
        v82 = NSLocalizedString(_:tableName:bundle:value:comment:)(v80, (Swift::String_optional)0, (NSBundle)v79, v81, v105);
        object = v82._object;

        *(Swift::String *)(v0 + 80) = v82;
        countAndFlagsBits = v82._countAndFlagsBits;
        v32 = objc_msgSend(v78, "bundleForClass:", v77);
        v34 = 0xD000000000000044;
        v98 = 0x80000001002454E0;
        v36 = 0x80000001002454A0;
        v33 = 0xD00000000000003DLL;
        goto LABEL_16;
      }
      if ((*(_QWORD *)(v0 + 264) != 0xD000000000000026 || *(_QWORD *)(v0 + 272) != 0x8000000100245330)
        && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
      {
        v90 = swift_bridgeObjectRetain_n(*(_QWORD *)(v0 + 272), 2);
        v91 = Logger.logObject.getter(v90);
        v92 = static os_log_type_t.error.getter();
        v93 = os_log_type_enabled(v91, v92);
        v94 = *(_QWORD *)(v0 + 272);
        if (v93)
        {
          v95 = *(_QWORD *)(v0 + 264);
          v96 = (uint8_t *)swift_slowAlloc(12, -1);
          v97 = swift_slowAlloc(32, -1);
          v102 = v97;
          *(_DWORD *)v96 = 136315138;
          swift_bridgeObjectRetain(v94);
          *(_QWORD *)(v0 + 248) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v95, v94, &v102);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v99, v1, v96 + 4, v96 + 12);
          swift_bridgeObjectRelease_n(v94, 3);
          _os_log_impl((void *)&_mh_execute_header, v91, v92, "Invalid flow identifier %s", v96, 0xCu);
          swift_arrayDestroy(v97, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v97, -1, -1);
          swift_slowDealloc(v96, -1, -1);
        }
        else
        {
          swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 272), 2);
        }

        v40 = 0;
        v39 = 0;
        object = 0;
        countAndFlagsBits = 0;
        goto LABEL_17;
      }
      v83 = *(_QWORD *)(v0 + 280);
      swift_bridgeObjectRelease_n(0, 2);
      v84 = swift_getObjCClassFromMetadata(v83);
      v85 = (void *)objc_opt_self(NSBundle);
      v86 = objc_msgSend(v85, "bundleForClass:", v84);
      v106._countAndFlagsBits = 0xD000000000000040;
      v106._object = (void *)0x8000000100245380;
      v87._object = (void *)0x8000000100245360;
      v87._countAndFlagsBits = 0xD00000000000001FLL;
      v88._countAndFlagsBits = 0;
      v88._object = (void *)0xE000000000000000;
      v89 = NSLocalizedString(_:tableName:bundle:value:comment:)(v87, (Swift::String_optional)0, (NSBundle)v86, v88, v106);
      countAndFlagsBits = v89._countAndFlagsBits;
      object = v89._object;

      *(Swift::String *)(v0 + 80) = v89;
      v32 = objc_msgSend(v85, "bundleForClass:", v84);
      v33 = 0xD000000000000034;
      v34 = 0xD000000000000047;
      v98 = 0x8000000100245410;
      v35 = "Please share your feedback on Journaling Suggestions";
    }
    v36 = (unint64_t)(v35 - 32) | 0x8000000000000000;
LABEL_16:
    v37._countAndFlagsBits = 0;
    v37._object = (void *)0xE000000000000000;
    v38 = NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&v33, (Swift::String_optional)0, (NSBundle)v32, v37, *(Swift::String *)&v34);
    v39 = v38._countAndFlagsBits;
    v40 = v38._object;

    *(Swift::String *)(v0 + 96) = v38;
LABEL_17:
    v41 = *(_QWORD *)(v0 + 272);
    swift_bridgeObjectRetain_n(object, 2);
    v42 = swift_bridgeObjectRetain_n(v41, 2);
    v43 = Logger.logObject.getter(v42);
    v44 = static os_log_type_t.default.getter();
    v45 = os_log_type_enabled(v43, v44);
    v46 = *(_QWORD *)(v0 + 272);
    if (v45)
    {
      v47 = *(_QWORD *)(v0 + 264);
      v48 = swift_slowAlloc(22, -1);
      v49 = swift_slowAlloc(64, -1);
      v102 = v49;
      *(_DWORD *)v48 = 136315394;
      swift_bridgeObjectRetain(v46);
      *(_QWORD *)(v0 + 224) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v47, v46, &v102);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v100, v0 + 232, v48 + 4, v48 + 12);
      swift_bridgeObjectRelease_n(v46, 3);
      *(_WORD *)(v48 + 12) = 2080;
      *(_QWORD *)(v0 + 64) = countAndFlagsBits;
      *(_QWORD *)(v0 + 72) = object;
      swift_bridgeObjectRetain(object);
      v50 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
      v51 = String.init<A>(describing:)(v0 + 64, v50);
      v53 = v52;
      *(_QWORD *)(v0 + 240) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v51, v52, &v102);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 240, v99, v48 + 14, v48 + 22);
      swift_bridgeObjectRelease(v53);
      swift_bridgeObjectRelease_n(object, 2);
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "Retrieved prompt title for %s: %s", (uint8_t *)v48, 0x16u);
      swift_arrayDestroy(v49, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v49, -1, -1);
      swift_slowDealloc(v48, -1, -1);

      v40 = *(void **)(v0 + 104);
      v101 = *(_QWORD *)(v0 + 96);
    }
    else
    {
      v101 = v39;
      swift_bridgeObjectRelease_n(v46, 2);
      swift_bridgeObjectRelease_n(object, 2);

    }
    v55 = *(_QWORD *)(v0 + 272);
    swift_bridgeObjectRetain_n(v40, 2);
    v56 = swift_bridgeObjectRetain_n(v55, 2);
    v57 = Logger.logObject.getter(v56);
    v58 = static os_log_type_t.default.getter();
    v59 = os_log_type_enabled(v57, v58);
    v60 = *(_QWORD *)(v0 + 272);
    if (v59)
    {
      v61 = *(_QWORD *)(v0 + 264);
      v62 = swift_slowAlloc(22, -1);
      v63 = swift_slowAlloc(64, -1);
      v102 = v63;
      *(_DWORD *)v62 = 136315394;
      swift_bridgeObjectRetain(v60);
      *(_QWORD *)(v0 + 200) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v61, v60, &v102);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 200, v0 + 208, v62 + 4, v62 + 12);
      swift_bridgeObjectRelease_n(v60, 3);
      *(_WORD *)(v62 + 12) = 2080;
      *(_QWORD *)(v0 + 112) = v101;
      *(_QWORD *)(v0 + 120) = v40;
      swift_bridgeObjectRetain(v40);
      v64 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
      v65 = String.init<A>(describing:)(v0 + 112, v64);
      v67 = v66;
      *(_QWORD *)(v0 + 216) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v65, v66, &v102);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 216, v100, v62 + 14, v62 + 22);
      swift_bridgeObjectRelease(v67);
      swift_bridgeObjectRelease_n(v40, 2);
      _os_log_impl((void *)&_mh_execute_header, v57, v58, "Retrieved prompt message for %s: %s", (uint8_t *)v62, 0x16u);
      swift_arrayDestroy(v63, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v63, -1, -1);
      swift_slowDealloc(v62, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 272), 2);
      swift_bridgeObjectRelease_n(v40, 2);
    }

    type metadata accessor for FBKSFeedbackCount(0);
    v68 = (_QWORD *)swift_task_alloc(async function pointer to static FBKSFeedbackCount.fetchCountsForForm(identifier:)[1]);
    *(_QWORD *)(v0 + 296) = v68;
    *v68 = v0;
    v68[1] = closure #1 in static MOFeedbackAssistant.triggerFeedbackAssistantFlow(flowIdentifier:);
    return static FBKSFeedbackCount.fetchCountsForForm(identifier:)(*(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 272));
  }
  if (one-time initialization token for shared != -1)
    swift_once(&one-time initialization token for shared, one-time initialization function for shared);
  v13 = *(_QWORD *)(v0 + 272);
  v14 = type metadata accessor for Logger(0);
  __swift_project_value_buffer(v14, (uint64_t)static MOFeedbackAssistantLogger.shared);
  v15 = swift_bridgeObjectRetain_n(v13, 2);
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  v18 = os_log_type_enabled(v16, v17);
  v19 = *(_QWORD *)(v0 + 272);
  if (v18)
  {
    v20 = *(_QWORD *)(v0 + 264);
    v21 = (uint8_t *)swift_slowAlloc(12, -1);
    v22 = swift_slowAlloc(32, -1);
    v102 = v22;
    *(_DWORD *)v21 = 136315138;
    swift_bridgeObjectRetain(v19);
    *(_QWORD *)(v0 + 232) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v19, &v102);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 232, v0 + 240, v21 + 4, v21 + 12);
    swift_bridgeObjectRelease_n(v19, 3);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Skipping feedback assistant flow for form %s because this is not a Seed build", v21, 0xCu);
    swift_arrayDestroy(v22, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v22, -1, -1);
    swift_slowDealloc(v21, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 272), 2);
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  _BOOL4 v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  uint8_t *v20;
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
  NSObject *v32;
  os_log_type_t v33;
  _BOOL4 v34;
  unint64_t v35;
  uint8_t *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  os_log_type_t v41;
  _BOOL4 v42;
  void *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  os_log_type_t v51;
  _BOOL4 v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  os_log_type_t v59;
  _BOOL4 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v64;
  uint64_t v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  uint64_t v70;
  id v71;
  _QWORD *v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t (*v78)(id);
  uint64_t v79;

  v76 = v0 + 176;
  v1 = *(void **)(v0 + 304);
  swift_bridgeObjectRetain_n(*(_QWORD *)(v0 + 272), 2);
  v2 = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(void **)(v0 + 304);
    v6 = *(_QWORD *)(v0 + 264);
    v5 = *(_QWORD *)(v0 + 272);
    v7 = swift_slowAlloc(22, -1);
    v73 = (_QWORD *)swift_slowAlloc(8, -1);
    v75 = swift_slowAlloc(32, -1);
    v79 = v75;
    *(_DWORD *)v7 = 136315394;
    swift_bridgeObjectRetain(v5);
    *(_QWORD *)(v0 + 184) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v5, &v79);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 184, v0 + 192, v7 + 4, v7 + 12);
    swift_bridgeObjectRelease_n(v5, 3);
    *(_WORD *)(v7 + 12) = 2112;
    *(_QWORD *)(v0 + 192) = v4;
    v8 = v4;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 192, v0 + 200, v7 + 14, v7 + 22);
    *v73 = v4;

    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Retrieved stats for %s: %@", (uint8_t *)v7, 0x16u);
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy(v73, 1, v9);
    swift_slowDealloc(v73, -1, -1);
    swift_arrayDestroy(v75, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v75, -1, -1);
    swift_slowDealloc(v7, -1, -1);
  }
  else
  {
    v10 = *(void **)(v0 + 304);
    swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 272), 2);

  }
  v11 = (void *)FBKSFeedbackCount.currentCampaign.getter();

  if (v11)
  {
    v12 = *(_QWORD *)(v0 + 272);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 104));
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 88));
    v13 = swift_bridgeObjectRetain_n(v12, 2);
    v14 = Logger.logObject.getter(v13);
    v15 = static os_log_type_t.default.getter();
    v16 = os_log_type_enabled(v14, v15);
    v17 = *(void **)(v0 + 304);
    v18 = *(_QWORD *)(v0 + 272);
    if (v16)
    {
      v19 = *(_QWORD *)(v0 + 264);
      v20 = (uint8_t *)swift_slowAlloc(12, -1);
      v21 = swift_slowAlloc(32, -1);
      v79 = v21;
      *(_DWORD *)v20 = 136315138;
      swift_bridgeObjectRetain(v18);
      *(_QWORD *)(v0 + 176) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v18, &v79);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v76, v0 + 184, v20 + 4, v20 + 12);
      swift_bridgeObjectRelease_n(v18, 3);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Skipping feedback flow for %s given we already have a campain going", v20, 0xCu);
      swift_arrayDestroy(v21, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v21, -1, -1);
      swift_slowDealloc(v20, -1, -1);

      return (*(uint64_t (**)(void))(v0 + 8))();
    }

    v38 = v18;
LABEL_27:
    swift_bridgeObjectRelease_n(v38, 2);

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  if (FBKSFeedbackCount.declineCount.getter() >= 2)
  {
    v39 = *(_QWORD *)(v0 + 272);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 104));
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 88));
    v40 = swift_bridgeObjectRetain_n(v39, 2);
    v14 = Logger.logObject.getter(v40);
    v41 = static os_log_type_t.default.getter();
    v42 = os_log_type_enabled(v14, v41);
    v43 = *(void **)(v0 + 304);
    v44 = *(_QWORD *)(v0 + 272);
    if (v42)
    {
      v45 = *(_QWORD *)(v0 + 264);
      v77 = *(void **)(v0 + 304);
      v46 = swift_slowAlloc(22, -1);
      v47 = swift_slowAlloc(32, -1);
      v79 = v47;
      *(_DWORD *)v46 = 136315394;
      swift_bridgeObjectRetain(v44);
      *(_QWORD *)(v0 + 208) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v45, v44, &v79);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 208, v0 + 216, v46 + 4, v46 + 12);
      swift_bridgeObjectRelease_n(v44, 3);
      *(_WORD *)(v46 + 12) = 2048;
      *(_QWORD *)(v0 + 160) = 2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 160, v0 + 168, v46 + 14, v46 + 22);
      _os_log_impl((void *)&_mh_execute_header, v14, v41, "Skipping feedback flow for %s given user dismissed %ld time(s) already", (uint8_t *)v46, 0x16u);
      swift_arrayDestroy(v47, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v47, -1, -1);
      v48 = v46;
LABEL_24:
      swift_slowDealloc(v48, -1, -1);

      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    goto LABEL_25;
  }
  v22 = FBKSFeedbackCount.feedbackFiled.getter();
  v23 = v22;
  if ((unint64_t)v22 >> 62)
  {
    if (v22 >= 0)
      v22 &= 0xFFFFFFFFFFFFFF8uLL;
    v24 = _CocoaArrayWrapper.endIndex.getter(v22);
  }
  else
  {
    v24 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v25 = swift_bridgeObjectRelease(v23);
  if (v24 >= 3)
  {
    v49 = *(_QWORD *)(v0 + 272);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 104));
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 88));
    v50 = swift_bridgeObjectRetain_n(v49, 2);
    v14 = Logger.logObject.getter(v50);
    v51 = static os_log_type_t.default.getter();
    v52 = os_log_type_enabled(v14, v51);
    v53 = *(_QWORD *)(v0 + 272);
    if (!v52)
    {

      v38 = v53;
      goto LABEL_27;
    }
    v54 = *(_QWORD *)(v0 + 264);
    v77 = *(void **)(v0 + 304);
    v55 = swift_slowAlloc(22, -1);
    v56 = swift_slowAlloc(32, -1);
    v79 = v56;
    *(_DWORD *)v55 = 136315394;
    swift_bridgeObjectRetain(v53);
    *(_QWORD *)(v0 + 152) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v54, v53, &v79);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 152, v0 + 160, v55 + 4, v55 + 12);
    swift_bridgeObjectRelease_n(v53, 3);
    *(_WORD *)(v55 + 12) = 2048;
    *(_QWORD *)(v0 + 128) = 3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 128, v0 + 136, v55 + 14, v55 + 22);
    _os_log_impl((void *)&_mh_execute_header, v14, v51, "Skipping feedback flow for %s given we already got feedback %ld time(s)", (uint8_t *)v55, 0x16u);
    swift_arrayDestroy(v56, 1, (char *)&type metadata for Any + 8);
    v57 = v56;
    goto LABEL_23;
  }
  v26 = FBKSFeedbackCount.errors.getter(v25);
  v27 = v26;
  if ((unint64_t)v26 >> 62)
  {
    if (v26 >= 0)
      v26 &= 0xFFFFFFFFFFFFFF8uLL;
    v28 = _CocoaArrayWrapper.endIndex.getter(v26);
  }
  else
  {
    v28 = *(_QWORD *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease(v27);
  v29 = *(_QWORD *)(v0 + 272);
  if (v28 >= 5)
  {
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 104));
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 88));
    v58 = swift_bridgeObjectRetain_n(v29, 2);
    v14 = Logger.logObject.getter(v58);
    v59 = static os_log_type_t.default.getter();
    v60 = os_log_type_enabled(v14, v59);
    v43 = *(void **)(v0 + 304);
    v44 = *(_QWORD *)(v0 + 272);
    if (v60)
    {
      v77 = *(void **)(v0 + 304);
      v61 = *(_QWORD *)(v0 + 264);
      v55 = swift_slowAlloc(22, -1);
      v62 = swift_slowAlloc(32, -1);
      v79 = v62;
      *(_DWORD *)v55 = 136315394;
      swift_bridgeObjectRetain(v44);
      *(_QWORD *)(v0 + 136) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v61, v44, &v79);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 136, v0 + 144, v55 + 4, v55 + 12);
      swift_bridgeObjectRelease_n(v44, 3);
      *(_WORD *)(v55 + 12) = 2048;
      *(_QWORD *)(v0 + 144) = 5;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 144, v0 + 152, v55 + 14, v55 + 22);
      _os_log_impl((void *)&_mh_execute_header, v14, v59, "Skipping feedback flow for %s given we already got %ld error(s) for this form", (uint8_t *)v55, 0x16u);
      swift_arrayDestroy(v62, 1, (char *)&type metadata for Any + 8);
      v57 = v62;
LABEL_23:
      swift_slowDealloc(v57, -1, -1);
      v48 = v55;
      goto LABEL_24;
    }
LABEL_25:

    v38 = v44;
    goto LABEL_27;
  }
  v30 = v0 + 96;
  v31 = swift_bridgeObjectRetain_n(*(_QWORD *)(v0 + 272), 2);
  v32 = Logger.logObject.getter(v31);
  v33 = static os_log_type_t.default.getter();
  v34 = os_log_type_enabled(v32, v33);
  v35 = *(_QWORD *)(v0 + 272);
  if (v34)
  {
    v74 = *(_QWORD *)(v0 + 264);
    v36 = (uint8_t *)swift_slowAlloc(12, -1);
    v37 = swift_slowAlloc(32, -1);
    v79 = v37;
    *(_DWORD *)v36 = 136315138;
    swift_bridgeObjectRetain(v35);
    *(_QWORD *)(v0 + 168) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v74, v35, &v79);
    v30 = v0 + 96;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 168, v76, v36 + 4, v36 + 12);
    swift_bridgeObjectRelease_n(v35, 3);
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "Triggering flow for %s !!", v36, 0xCu);
    swift_arrayDestroy(v37, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v37, -1, -1);
    swift_slowDealloc(v36, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 272), 2);
  }

  v64 = *(_QWORD *)(v0 + 264);
  v65 = *(_QWORD *)(v0 + 272);
  v66 = objc_allocWithZone((Class)type metadata accessor for FBKSForm(0));
  swift_bridgeObjectRetain(v65);
  v67 = (void *)FBKSForm.init(identifier:)(v64, v65);
  *(_QWORD *)(v0 + 320) = v67;
  dispatch thunk of FBKSForm.authenticationMethod.setter(1);
  v68 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FBKSLaunchConfiguration(0)), "init");
  *(_QWORD *)(v0 + 328) = v68;
  swift_beginAccess(v0 + 80, v0 + 40, 0, 0);
  dispatch thunk of FBKSLaunchConfiguration.localizedPromptTitle.setter(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88));
  swift_beginAccess(v30, v0 + 16, 0, 0);
  dispatch thunk of FBKSLaunchConfiguration.localizedPromptMessage.setter(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104));
  dispatch thunk of FBKSLaunchConfiguration.promptStyle.setter(1);
  v69 = objc_allocWithZone((Class)type metadata accessor for FBKSDraftLauncher(0));
  *(_QWORD *)(v0 + 336) = FBKSDraftLauncher.init(feedbackForm:)(v67);
  v70 = *((unsigned int *)&async function pointer to dispatch thunk of FBKSDraftLauncher.collectFeedback(launchConfiguration:)
        + 1);
  v78 = (uint64_t (*)(id))((char *)&async function pointer to dispatch thunk of FBKSDraftLauncher.collectFeedback(launchConfiguration:)
                                   + async function pointer to dispatch thunk of FBKSDraftLauncher.collectFeedback(launchConfiguration:));
  v71 = v68;
  v72 = (_QWORD *)swift_task_alloc(v70);
  *(_QWORD *)(v0 + 344) = v72;
  *v72 = v0;
  v72[1] = closure #1 in static MOFeedbackAssistant.triggerFeedbackAssistantFlow(flowIdentifier:);
  return v78(v68);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 344);
  *(_QWORD *)(*v1 + 352) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = closure #1 in static MOFeedbackAssistant.triggerFeedbackAssistantFlow(flowIdentifier:);
  }
  else
  {

    v4 = closure #1 in static MOFeedbackAssistant.triggerFeedbackAssistantFlow(flowIdentifier:);
  }
  return swift_task_switch(v4, 0, 0);
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(v0 + 328);
  v2 = *(void **)(v0 + 320);
  v3 = *(void **)(v0 + 304);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = *(void **)(v0 + 328);
  v2 = *(void **)(v0 + 336);
  v3 = *(void **)(v0 + 320);
  v4 = *(void **)(v0 + 304);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t closure #1 in static MOFeedbackAssistant.triggerFeedbackAssistantFlow(flowIdentifier:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD **)v2;
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 296);
  v3[38] = a1;
  v3[39] = v1;
  swift_task_dealloc(v4);
  if (v1)
  {
    swift_bridgeObjectRelease(v3[13]);
    swift_bridgeObjectRelease(v3[11]);
    v5 = closure #1 in static MOFeedbackAssistant.triggerFeedbackAssistantFlow(flowIdentifier:);
  }
  else
  {
    v5 = closure #1 in static MOFeedbackAssistant.triggerFeedbackAssistantFlow(flowIdentifier:);
  }
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_1001DA998()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t partial apply for closure #1 in static MOFeedbackAssistant.triggerFeedbackAssistantFlow(flowIdentifier:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = swift_task_alloc(dword_10030766C);
  v4 = *(_OWORD *)(v0 + 40);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = partial apply for closure #1 in static MOFeedbackAssistant.triggerFeedbackAssistantFlow(flowIdentifier:);
  *(_OWORD *)(v3 + 272) = v4;
  *(_QWORD *)(v3 + 264) = v2;
  return swift_task_switch(closure #1 in static MOFeedbackAssistant.triggerFeedbackAssistantFlow(flowIdentifier:), 0, 0);
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = *v0;
  v1 = *(_QWORD *)(v4 + 16);
  v2 = *v0;
  v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t outlined destroy of TaskPriority?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id MOWeatherDataProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id MOFeedbackAssistant.init()()
{
  return MOFeedbackAssistantLogger.init()(type metadata accessor for MOFeedbackAssistant);
}

id MOFeedbackAssistantLogger.init()(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "init");
}

uint64_t type metadata accessor for MOFeedbackAssistant()
{
  return objc_opt_self(_TtC8momentsd19MOFeedbackAssistant);
}

id @objc MOFeedbackAssistantLogger.init()(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)a3();
  return objc_msgSendSuper2(&v4, "init");
}

id MOFeedbackAssistant.__deallocating_deinit()
{
  return MOFeedbackAssistantLogger.__deallocating_deinit(type metadata accessor for MOFeedbackAssistant);
}

id MOFeedbackAssistantLogger.__deallocating_deinit(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
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
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  __swift_destroy_boxed_opaque_existential_0(v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
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
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
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

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = _swift_stdlib_malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
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
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = _swift_stdlib_malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
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

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

uint64_t MOWeatherDataProvider.fetchCurrentWeather(for:completion:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin();
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = (_QWORD *)swift_allocObject(&unk_1002B66D0, 56, 7);
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = a1;
  v9[5] = a2;
  v9[6] = a3;
  v10 = a1;
  swift_retain(a3);
  v11 = _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&async function pointer to partial apply for closure #1 in MOWeatherDataProvider.fetchCurrentWeather(for:completion:), (uint64_t)v9);
  return swift_release(v11);
}

uint64_t closure #1 in MOWeatherDataProvider.fetchCurrentWeather(for:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
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
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  v7 = type metadata accessor for WeatherCondition(0);
  v6[7] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v6[8] = v8;
  v6[9] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitSpeed>);
  v6[10] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v6[11] = v10;
  v6[12] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Wind(0);
  v6[13] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v6[14] = v12;
  v6[15] = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitTemperature>);
  v6[16] = v13;
  v14 = *(_QWORD *)(v13 - 8);
  v6[17] = v14;
  v6[18] = swift_task_alloc((*(_QWORD *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for CurrentWeather(0);
  v6[19] = v15;
  v16 = *(_QWORD *)(v15 - 8);
  v6[20] = v16;
  v17 = (*(_QWORD *)(v16 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v6[21] = swift_task_alloc(v17);
  v6[22] = swift_task_alloc(v17);
  v6[23] = swift_task_alloc(v17);
  v6[24] = swift_task_alloc(v17);
  v18 = type metadata accessor for Weather(0);
  v6[25] = v18;
  v19 = *(_QWORD *)(v18 - 8);
  v6[26] = v19;
  v6[27] = swift_task_alloc((*(_QWORD *)(v19 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(closure #1 in MOWeatherDataProvider.fetchCurrentWeather(for:completion:), 0, 0);
}

uint64_t closure #1 in MOWeatherDataProvider.fetchCurrentWeather(for:completion:)()
{
  _QWORD *v0;
  _QWORD *v1;

  type metadata accessor for WeatherService(0);
  v0[28] = static WeatherService.shared.getter();
  v1 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to WeatherService.weather(for:) + 1));
  v0[29] = v1;
  *v1 = v0;
  v1[1] = closure #1 in MOWeatherDataProvider.fetchCurrentWeather(for:completion:);
  return WeatherService.weather(for:)(v0[27], v0[4]);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 232);
  *(_QWORD *)(*v1 + 240) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = closure #1 in MOWeatherDataProvider.fetchCurrentWeather(for:completion:);
  }
  else
  {
    swift_release(*(_QWORD *)(v2 + 224));
    v4 = closure #1 in MOWeatherDataProvider.fetchCurrentWeather(for:completion:);
  }
  return swift_task_switch(v4, 0, 0);
}

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
  uint64_t (*v9)(uint64_t, uint64_t);
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
  objc_class *v22;
  char *v23;
  uint64_t *v24;
  uint64_t *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
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
  void (*v51)(id, _QWORD);
  uint64_t v52;
  uint64_t v53;

  v1 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 192);
  v52 = *(_QWORD *)(v0 + 208);
  v53 = *(_QWORD *)(v0 + 200);
  v4 = *(_QWORD *)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 184);
  v45 = *(_QWORD *)(v0 + 168);
  v5 = *(_QWORD *)(v0 + 152);
  v46 = *(_QWORD *)(v0 + 144);
  v47 = *(_QWORD *)(v0 + 136);
  v6 = *(_QWORD *)(v0 + 120);
  v38 = *(_QWORD *)(v0 + 112);
  v40 = *(_QWORD *)(v0 + 104);
  v36 = *(_QWORD *)(v0 + 160);
  v37 = *(_QWORD *)(v0 + 96);
  v48 = *(_QWORD *)(v0 + 128);
  v49 = *(_QWORD *)(v0 + 88);
  v7 = *(_QWORD *)(v0 + 72);
  v50 = *(_QWORD *)(v0 + 80);
  v42 = *(_QWORD *)(v0 + 64);
  v43 = *(_QWORD *)(v0 + 56);
  v51 = *(void (**)(id, _QWORD))(v0 + 40);
  v8 = ((uint64_t (*)(void))Weather.currentWeather.getter)();
  CurrentWeather.temperature.getter(v8);
  v9 = *(uint64_t (**)(uint64_t, uint64_t))(v36 + 8);
  v10 = v9(v2, v5);
  v11 = Weather.currentWeather.getter(v10);
  CurrentWeather.wind.getter(v11);
  v12 = v9(v3, v5);
  Wind.speed.getter(v12);
  v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v38 + 8))(v6, v40);
  v14 = Weather.currentWeather.getter(v13);
  CurrentWeather.condition.getter(v14);
  v15 = v9(v4, v5);
  v16 = WeatherCondition.description.getter(v15);
  v39 = v17;
  v41 = v16;
  v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v42 + 8))(v7, v43);
  v19 = Weather.currentWeather.getter(v18);
  v44 = CurrentWeather.symbolName.getter(v19);
  v21 = v20;
  v9(v45, v5);
  v22 = (objc_class *)type metadata accessor for MOWeatherData(0);
  v23 = (char *)objc_allocWithZone(v22);
  (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(&v23[OBJC_IVAR____TtC8momentsd13MOWeatherData_temperature], v46, v48);
  (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(&v23[OBJC_IVAR____TtC8momentsd13MOWeatherData_windSpeed], v37, v50);
  v24 = (uint64_t *)&v23[OBJC_IVAR____TtC8momentsd13MOWeatherData_weatherSummary];
  *v24 = v41;
  v24[1] = v39;
  v25 = (uint64_t *)&v23[OBJC_IVAR____TtC8momentsd13MOWeatherData_symbolName];
  *v25 = v44;
  v25[1] = v21;
  *(_QWORD *)(v0 + 16) = v23;
  *(_QWORD *)(v0 + 24) = v22;
  v26 = objc_msgSendSuper2((objc_super *)(v0 + 16), "init");
  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v37, v50);
  (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v46, v48);
  v51(v26, 0);

  (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v1, v53);
  v27 = *(_QWORD *)(v0 + 184);
  v28 = *(_QWORD *)(v0 + 192);
  v30 = *(_QWORD *)(v0 + 168);
  v29 = *(_QWORD *)(v0 + 176);
  v31 = *(_QWORD *)(v0 + 144);
  v32 = *(_QWORD *)(v0 + 120);
  v33 = *(_QWORD *)(v0 + 96);
  v34 = *(_QWORD *)(v0 + 72);
  swift_task_dealloc(*(_QWORD *)(v0 + 216));
  swift_task_dealloc(v28);
  swift_task_dealloc(v27);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(_QWORD, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 240);
  v2 = *(void (**)(_QWORD, uint64_t))(v0 + 40);
  swift_release(*(_QWORD *)(v0 + 224));
  swift_errorRetain(v1);
  v2(0, v1);
  swift_errorRelease(v1);
  swift_errorRelease(v1);
  v3 = *(_QWORD *)(v0 + 184);
  v4 = *(_QWORD *)(v0 + 192);
  v6 = *(_QWORD *)(v0 + 168);
  v5 = *(_QWORD *)(v0 + 176);
  v7 = *(_QWORD *)(v0 + 144);
  v8 = *(_QWORD *)(v0 + 120);
  v9 = *(_QWORD *)(v0 + 96);
  v10 = *(_QWORD *)(v0 + 72);
  swift_task_dealloc(*(_QWORD *)(v0 + 216));
  swift_task_dealloc(v4);
  swift_task_dealloc(v3);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t partial apply for closure #1 in MOWeatherDataProvider.fetchCurrentWeather(for:completion:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc(dword_1003076E4);
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = partial apply for closure #1 in MOWeatherDataProvider.fetchCurrentWeather(for:completion:);
  return closure #1 in MOWeatherDataProvider.fetchCurrentWeather(for:completion:)(a1, v4, v5, v6, v7, v8);
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t ObjectType;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD v21[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6);
  if ((_DWORD)v8 == 1)
  {
    outlined destroy of TaskPriority?(a1);
    v9 = 7168;
    v10 = *(_QWORD *)(a3 + 16);
    if (v10)
    {
LABEL_3:
      v11 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v10);
      swift_unknownObjectRetain(v10, v13);
      v14 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v11);
      v16 = v15;
      swift_unknownObjectRelease(v10);
      goto LABEL_6;
    }
  }
  else
  {
    v17 = TaskPriority.rawValue.getter(v8);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v9 = v17 | 0x1C00;
    v10 = *(_QWORD *)(a3 + 16);
    if (v10)
      goto LABEL_3;
  }
  v14 = 0;
  v16 = 0;
LABEL_6:
  v18 = swift_allocObject(&unk_1002B67C0, 32, 7);
  *(_QWORD *)(v18 + 16) = a2;
  *(_QWORD *)(v18 + 24) = a3;
  if (v16 | v14)
  {
    v21[0] = 0;
    v21[1] = 0;
    v19 = v21;
    v21[2] = v14;
    v21[3] = v16;
  }
  else
  {
    v19 = 0;
  }
  return swift_task_create(v9, v19, (char *)&type metadata for () + 8, &_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TATu, v18);
}

void thunk for @escaping @callee_unowned @convention(block) (@unowned MOWeatherData?, @unowned NSError?) -> ()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = _convertErrorToNSError(_:)(a2);
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

uint64_t MOWeatherDataProvider.fetchHourlyWeather(for:startDate:endDate:completion:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  void (*v26)(char *, char *, uint64_t);
  char *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;

  v32 = a4;
  v33 = a5;
  v8 = type metadata accessor for Date(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  v11 = ((uint64_t (*)(void))__chkstk_darwin)();
  v12 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v14 = (char *)&v32 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v15);
  v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v19(v14, a2, v8);
  v19(v12, a3, v8);
  v20 = *(unsigned __int8 *)(v9 + 80);
  v21 = (v20 + 40) & ~v20;
  v22 = (v10 + v20 + v21) & ~v20;
  v23 = (v10 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  v24 = (char *)swift_allocObject(&unk_1002B66F8, v23 + 16, v20 | 7);
  *((_QWORD *)v24 + 2) = 0;
  *((_QWORD *)v24 + 3) = 0;
  *((_QWORD *)v24 + 4) = a1;
  v25 = &v24[v21];
  v26 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  v26(v25, v14, v8);
  v26(&v24[v22], v12, v8);
  v27 = &v24[v23];
  v28 = v33;
  *(_QWORD *)v27 = v32;
  *((_QWORD *)v27 + 1) = v28;
  v29 = a1;
  swift_retain(v28);
  v30 = _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v17, (uint64_t)&async function pointer to partial apply for closure #1 in MOWeatherDataProvider.fetchHourlyWeather(for:startDate:endDate:completion:), (uint64_t)v24);
  return swift_release(v30);
}

uint64_t closure #1 in MOWeatherDataProvider.fetchHourlyWeather(for:startDate:endDate:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
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
  unint64_t v23;

  v8[7] = a7;
  v8[8] = a8;
  v8[5] = a5;
  v8[6] = a6;
  v8[4] = a4;
  v9 = type metadata accessor for WeatherCondition(0);
  v8[9] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v8[10] = v10;
  v8[11] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitSpeed>);
  v8[12] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v8[13] = v12;
  v8[14] = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Wind(0);
  v8[15] = v13;
  v14 = *(_QWORD *)(v13 - 8);
  v8[16] = v14;
  v8[17] = swift_task_alloc((*(_QWORD *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitTemperature>);
  v8[18] = v15;
  v16 = *(_QWORD *)(v15 - 8);
  v8[19] = v16;
  v8[20] = swift_task_alloc((*(_QWORD *)(v16 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for HourWeather(0);
  v8[21] = v17;
  v18 = *(_QWORD *)(v17 - 8);
  v8[22] = v18;
  v8[23] = swift_task_alloc((*(_QWORD *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeatherQuery<Forecast<HourWeather>>);
  v8[24] = v19;
  v20 = *(_QWORD *)(v19 - 8);
  v8[25] = v20;
  v8[26] = swift_task_alloc((*(_QWORD *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Forecast<HourWeather>);
  v8[27] = v21;
  v22 = *(_QWORD *)(v21 - 8);
  v8[28] = v22;
  v23 = (*(_QWORD *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8[29] = swift_task_alloc(v23);
  v8[30] = swift_task_alloc(v23);
  return swift_task_switch(closure #1 in MOWeatherDataProvider.fetchHourlyWeather(for:startDate:endDate:completion:), 0, 0);
}

uint64_t closure #1 in MOWeatherDataProvider.fetchHourlyWeather(for:startDate:endDate:completion:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = v0[5];
  v1 = v0[6];
  type metadata accessor for WeatherService(0);
  v0[31] = static WeatherService.shared.getter();
  static WeatherQuery<A>.hourly(startDate:endDate:)(v2, v1);
  v3 = (_QWORD *)swift_task_alloc(async function pointer to WeatherService.weather<A>(for:including:)[1]);
  v0[32] = v3;
  *v3 = v0;
  v3[1] = closure #1 in MOWeatherDataProvider.fetchHourlyWeather(for:startDate:endDate:completion:);
  return WeatherService.weather<A>(for:including:)(v0[29], v0[4], v0[26], v0[27]);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 248);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 256);
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 200);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 208);
  v6 = *(_QWORD *)(*(_QWORD *)v1 + 192);
  *(_QWORD *)(*(_QWORD *)v1 + 264) = v0;
  swift_task_dealloc(v2);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_release(v3);
  if (v0)
    v7 = closure #1 in MOWeatherDataProvider.fetchHourlyWeather(for:startDate:endDate:completion:);
  else
    v7 = closure #1 in MOWeatherDataProvider.fetchHourlyWeather(for:startDate:endDate:completion:);
  return swift_task_switch(v7, 0, 0);
}

{
  uint64_t v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *v20;
  char *v21;
  uint64_t *v22;
  uint64_t *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(void *, _QWORD);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
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
  void *v51;

  v1 = *(id *)(v0 + 216);
  (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(v0 + 224) + 32))(*(_QWORD *)(v0 + 240), *(_QWORD *)(v0 + 232), v1);
  v2 = Forecast.startIndex.getter(v1);
  v3 = Forecast.endIndex.getter(v1);
  v4 = v2 + v3;
  if (__OFADD__(v2, v3))
  {
    __break(1u);
    goto LABEL_5;
  }
  v5 = *(_QWORD *)(v0 + 160);
  v6 = *(_QWORD *)(v0 + 136);
  v45 = *(_QWORD *)(v0 + 152);
  v46 = *(_QWORD *)(v0 + 144);
  v8 = *(_QWORD *)(v0 + 120);
  v7 = *(_QWORD *)(v0 + 128);
  v44 = *(_QWORD *)(v0 + 112);
  v9 = *(_QWORD *)(v0 + 88);
  v47 = *(_QWORD *)(v0 + 104);
  v49 = *(_QWORD *)(v0 + 96);
  v39 = *(_QWORD *)(v0 + 80);
  v40 = *(_QWORD *)(v0 + 72);
  v10 = Forecast.subscript.getter((uint64_t)v4 / 2, *(_QWORD *)(v0 + 216));
  v11 = HourWeather.temperature.getter(v10);
  v12 = HourWeather.wind.getter(v11);
  Wind.speed.getter(v12);
  v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  v14 = HourWeather.condition.getter(v13);
  v15 = WeatherCondition.description.getter(v14);
  v42 = v16;
  v43 = v15;
  v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v39 + 8))(v9, v40);
  v18 = HourWeather.symbolName.getter(v17);
  v41 = v19;
  v20 = (objc_class *)type metadata accessor for MOWeatherData(0);
  v21 = (char *)objc_allocWithZone(v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(&v21[OBJC_IVAR____TtC8momentsd13MOWeatherData_temperature], v5, v46);
  (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(&v21[OBJC_IVAR____TtC8momentsd13MOWeatherData_windSpeed], v44, v49);
  v22 = (uint64_t *)&v21[OBJC_IVAR____TtC8momentsd13MOWeatherData_weatherSummary];
  *v22 = v43;
  v22[1] = v42;
  v23 = (uint64_t *)&v21[OBJC_IVAR____TtC8momentsd13MOWeatherData_symbolName];
  *v23 = v18;
  v23[1] = v41;
  *(_QWORD *)(v0 + 16) = v21;
  *(_QWORD *)(v0 + 24) = v20;
  v24 = objc_msgSendSuper2((objc_super *)(v0 + 16), "init");
  (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v44, v49);
  (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v5, v46);
  v51 = &_swiftEmptyArrayStorage;
  v1 = v24;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  v2 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
  v4 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v2 >= v4 >> 1)
LABEL_5:
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v4 > 1, v2 + 1, 1);
  v25 = *(_QWORD *)(v0 + 224);
  v48 = *(_QWORD *)(v0 + 216);
  v50 = *(_QWORD *)(v0 + 240);
  v26 = *(_QWORD *)(v0 + 176);
  v27 = *(_QWORD *)(v0 + 184);
  v28 = *(_QWORD *)(v0 + 168);
  v29 = *(void (**)(void *, _QWORD))(v0 + 56);
  v30 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v2, v1);
  specialized Array._endMutation()(v30);
  v29(v51, 0);
  swift_bridgeObjectRelease(v51);

  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v27, v28);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v50, v48);
  v31 = *(_QWORD *)(v0 + 232);
  v32 = *(_QWORD *)(v0 + 208);
  v33 = *(_QWORD *)(v0 + 184);
  v34 = *(_QWORD *)(v0 + 160);
  v35 = *(_QWORD *)(v0 + 136);
  v36 = *(_QWORD *)(v0 + 112);
  v37 = *(_QWORD *)(v0 + 88);
  swift_task_dealloc(*(_QWORD *)(v0 + 240));
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(_QWORD, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(v0 + 264);
  v2 = *(void (**)(_QWORD, uint64_t))(v0 + 56);
  swift_errorRetain(v1);
  v2(0, v1);
  swift_errorRelease(v1);
  swift_errorRelease(v1);
  v3 = *(_QWORD *)(v0 + 232);
  v4 = *(_QWORD *)(v0 + 208);
  v5 = *(_QWORD *)(v0 + 184);
  v6 = *(_QWORD *)(v0 + 160);
  v7 = *(_QWORD *)(v0 + 136);
  v8 = *(_QWORD *)(v0 + 112);
  v9 = *(_QWORD *)(v0 + 88);
  swift_task_dealloc(*(_QWORD *)(v0 + 240));
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t partial apply for closure #1 in MOWeatherDataProvider.fetchHourlyWeather(for:startDate:endDate:completion:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
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
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;

  v4 = *(_QWORD *)(type metadata accessor for Date(0) - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = (v5 + 40) & ~v5;
  v7 = *(_QWORD *)(v4 + 64);
  v8 = (v7 + v5 + v6) & ~v5;
  v9 = v1[2];
  v10 = v1[3];
  v11 = v1[4];
  v12 = (uint64_t)v1 + v6;
  v13 = (uint64_t)v1 + v8;
  v14 = (_QWORD *)((char *)v1 + ((v7 + v8 + 7) & 0xFFFFFFFFFFFFFFF8));
  v15 = *v14;
  v16 = v14[1];
  v17 = (_QWORD *)swift_task_alloc(dword_1003076F4);
  *(_QWORD *)(v2 + 16) = v17;
  *v17 = v2;
  v17[1] = partial apply for closure #1 in MOWeatherDataProvider.fetchCurrentWeather(for:completion:);
  return closure #1 in MOWeatherDataProvider.fetchHourlyWeather(for:startDate:endDate:completion:)(a1, v9, v10, v11, v12, v13, v15, v16);
}

void thunk for @escaping @callee_unowned @convention(block) (@unowned NSArray?, @unowned NSError?) -> ()(objc_class *a1, uint64_t a2, uint64_t a3)
{
  Class isa;
  uint64_t v6;
  id v7;

  isa = a1;
  if (a1)
  {
    type metadata accessor for MOWeatherData(0);
    isa = Array._bridgeToObjectiveC()().super.isa;
  }
  if (a2)
    v6 = _convertErrorToNSError(_:)(a2);
  else
    v6 = 0;
  v7 = (id)v6;
  (*(void (**)(uint64_t, Class))(a3 + 16))(a3, isa);

}

id MOWeatherDataProvider.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MOWeatherDataProvider();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for MOWeatherDataProvider()
{
  return objc_opt_self(_TtC8momentsd21MOWeatherDataProvider);
}

id MOWeatherDataProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MOWeatherDataProvider();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSArray?, @unowned NSError?) -> ()(objc_class *a1, uint64_t a2)
{
  uint64_t v2;

  thunk for @escaping @callee_unowned @convention(block) (@unowned NSArray?, @unowned NSError?) -> ()(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t objectdestroy_3Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void (*v9)(uint64_t, uint64_t);

  v1 = type metadata accessor for Date(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 40) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  v7 = (v5 + v3 + v4) & ~v3;
  v8 = (v5 + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  v9 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v9(v0 + v4, v1);
  v9(v0 + v7, v1);
  swift_release(*(_QWORD *)(v0 + v8 + 8));
  return swift_deallocObject(v0, v8 + 16, v6);
}

uint64_t closure #1 in MOWeatherDataProvider.fetchHourlyWeather(for:startDate:endDate:completion:)partial apply(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
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
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;

  v4 = *(_QWORD *)(type metadata accessor for Date(0) - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = (v5 + 40) & ~v5;
  v7 = *(_QWORD *)(v4 + 64);
  v8 = (v7 + v5 + v6) & ~v5;
  v9 = v1[2];
  v10 = v1[3];
  v11 = v1[4];
  v12 = (uint64_t)v1 + v6;
  v13 = (uint64_t)v1 + v8;
  v14 = (_QWORD *)((char *)v1 + ((v7 + v8 + 7) & 0xFFFFFFFFFFFFFFF8));
  v15 = *v14;
  v16 = v14[1];
  v17 = (_QWORD *)swift_task_alloc(dword_1003076F4);
  *(_QWORD *)(v2 + 16) = v17;
  *v17 = v2;
  v17[1] = partial apply for closure #1 in static MOFeedbackAssistant.triggerFeedbackAssistantFlow(flowIdentifier:);
  return closure #1 in MOWeatherDataProvider.fetchHourlyWeather(for:startDate:endDate:completion:)(a1, v9, v10, v11, v12, v13, v15, v16);
}

uint64_t sub_1001DCB78()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned MOWeatherData?, @unowned NSError?) -> ()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  thunk for @escaping @callee_unowned @convention(block) (@unowned MOWeatherData?, @unowned NSError?) -> ()(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  swift_release(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TQ0_;
  return v6(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TQ0_()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1001DCC8C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TA(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10030775C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = partial apply for closure #1 in static MOFeedbackAssistant.triggerFeedbackAssistantFlow(flowIdentifier:);
  return ((uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu
                                                 + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu))(a1, v4);
}

id MOWeatherData.__allocating_init(temperature:windSpeed:weatherSummry:symbolName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  objc_class *v7;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  id v20;
  objc_super v25;

  v7 = v6;
  v11 = (char *)objc_allocWithZone(v7);
  v12 = &v11[OBJC_IVAR____TtC8momentsd13MOWeatherData_temperature];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitTemperature>);
  v14 = *(_QWORD *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v12, a1, v13);
  v15 = &v11[OBJC_IVAR____TtC8momentsd13MOWeatherData_windSpeed];
  v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitSpeed>);
  v17 = *(_QWORD *)(v16 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v15, a2, v16);
  v18 = &v11[OBJC_IVAR____TtC8momentsd13MOWeatherData_weatherSummary];
  *(_QWORD *)v18 = a3;
  *((_QWORD *)v18 + 1) = a4;
  v19 = &v11[OBJC_IVAR____TtC8momentsd13MOWeatherData_symbolName];
  *(_QWORD *)v19 = a5;
  *((_QWORD *)v19 + 1) = a6;
  v25.receiver = v11;
  v25.super_class = v7;
  v20 = objc_msgSendSuper2(&v25, "init");
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(a2, v16);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a1, v13);
  return v20;
}

uint64_t MOWeatherData.temperature.getter@<X0>(uint64_t a1@<X8>)
{
  return MOWeatherData.temperature.getter(&OBJC_IVAR____TtC8momentsd13MOWeatherData_temperature, &demangling cache variable for type metadata for Measurement<NSUnitTemperature>, a1);
}

uint64_t MOWeatherData.temperature.setter(uint64_t a1)
{
  return MOWeatherData.temperature.setter(a1, &OBJC_IVAR____TtC8momentsd13MOWeatherData_temperature, &demangling cache variable for type metadata for Measurement<NSUnitTemperature>);
}

uint64_t key path setter for MOWeatherData.temperature : MOWeatherData(uint64_t a1, _QWORD **a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitTemperature>);
  __chkstk_darwin(v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))((swift_isaMask & **a2) + 0x78))(v6);
}

uint64_t (*MOWeatherData.temperature.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC8momentsd13MOWeatherData_temperature, a1, 33, 0);
  return MOWeatherData.windSpeed.modify;
}

Class @objc MOWeatherData.temperature.getter(uint64_t a1, uint64_t a2, uint64_t *a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  Class isa;
  _BYTE v14[24];
  NSMeasurement v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a3);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v10 = a1 + *a4;
  swift_beginAccess(v10, v14, 0, 0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  v15 = Measurement._bridgeToObjectiveC()();
  isa = v15.super.isa;
  (*(void (**)(char *, uint64_t, __n128))(v7 + 8))(v9, v6, *(__n128 *)&v15._doubleValue);
  return isa;
}

uint64_t MOWeatherData.windSpeed.getter@<X0>(uint64_t a1@<X8>)
{
  return MOWeatherData.temperature.getter(&OBJC_IVAR____TtC8momentsd13MOWeatherData_windSpeed, &demangling cache variable for type metadata for Measurement<NSUnitSpeed>, a1);
}

uint64_t MOWeatherData.temperature.getter@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[24];

  v6 = v3 + *a1;
  swift_beginAccess(v6, v9, 0, 0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a3, v6, v7);
}

void @objc MOWeatherData.temperature.setter(char *a1, uint64_t a2, uint64_t a3, uint64_t *a4, unint64_t *a5, _QWORD *a6, _QWORD *a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, _BYTE *, uint64_t);
  char *v19;
  _BYTE v21[24];

  v12 = __swift_instantiateConcreteTypeFromMangledName(a4);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = &v21[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v16 = type metadata accessor for NSUnitTemperature(0, a5, a6);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)(a3, v16);
  v17 = &a1[*a7];
  swift_beginAccess(v17, v21, 33, 0);
  v18 = *(void (**)(char *, _BYTE *, uint64_t))(v13 + 40);
  v19 = a1;
  v18(v17, v15, v12);
  swift_endAccess(v21);

}

uint64_t MOWeatherData.windSpeed.setter(uint64_t a1)
{
  return MOWeatherData.temperature.setter(a1, &OBJC_IVAR____TtC8momentsd13MOWeatherData_windSpeed, &demangling cache variable for type metadata for Measurement<NSUnitSpeed>);
}

uint64_t MOWeatherData.temperature.setter(uint64_t a1, _QWORD *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[24];

  v6 = v3 + *a2;
  swift_beginAccess(v6, v9, 33, 0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v6, a1, v7);
  return swift_endAccess(v9);
}

uint64_t key path setter for MOWeatherData.windSpeed : MOWeatherData(uint64_t a1, _QWORD **a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitSpeed>);
  __chkstk_darwin(v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))((swift_isaMask & **a2) + 0x90))(v6);
}

uint64_t (*MOWeatherData.windSpeed.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC8momentsd13MOWeatherData_windSpeed, a1, 33, 0);
  return MOWeatherData.windSpeed.modify;
}

uint64_t MOWeatherData.weatherSummary.getter()
{
  return MOWeatherData.weatherSummary.getter(&OBJC_IVAR____TtC8momentsd13MOWeatherData_weatherSummary);
}

uint64_t MOWeatherData.weatherSummary.setter(uint64_t a1, uint64_t a2)
{
  return MOWeatherData.weatherSummary.setter(a1, a2, &OBJC_IVAR____TtC8momentsd13MOWeatherData_weatherSummary);
}

uint64_t (*MOWeatherData.weatherSummary.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC8momentsd13MOWeatherData_weatherSummary, a1, 33, 0);
  return MOWeatherData.windSpeed.modify;
}

id @objc MOWeatherData.weatherSummary.getter(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  _BYTE v7[24];

  v3 = a1 + *a3;
  swift_beginAccess(v3, v7, 0, 0);
  v4 = *(_QWORD *)(v3 + 8);
  swift_bridgeObjectRetain(v4);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return v5;
}

uint64_t MOWeatherData.symbolName.getter()
{
  return MOWeatherData.weatherSummary.getter(&OBJC_IVAR____TtC8momentsd13MOWeatherData_symbolName);
}

uint64_t MOWeatherData.weatherSummary.getter(_QWORD *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  _BYTE v5[24];

  v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess(v2, v5, 0, 0);
  v3 = *v2;
  swift_bridgeObjectRetain(v2[1]);
  return v3;
}

uint64_t @objc MOWeatherData.weatherSummary.setter(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v12[24];

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = (uint64_t *)(a1 + *a4);
  swift_beginAccess(v9, v12, 1, 0);
  v10 = v9[1];
  *v9 = v6;
  v9[1] = v8;
  return swift_bridgeObjectRelease(v10);
}

uint64_t MOWeatherData.symbolName.setter(uint64_t a1, uint64_t a2)
{
  return MOWeatherData.weatherSummary.setter(a1, a2, &OBJC_IVAR____TtC8momentsd13MOWeatherData_symbolName);
}

uint64_t MOWeatherData.weatherSummary.setter(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  _QWORD *v6;
  uint64_t v7;
  _BYTE v9[24];

  v6 = (_QWORD *)(v3 + *a3);
  swift_beginAccess(v6, v9, 1, 0);
  v7 = v6[1];
  *v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease(v7);
}

uint64_t (*MOWeatherData.symbolName.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC8momentsd13MOWeatherData_symbolName, a1, 33, 0);
  return MOWeatherData.symbolName.modify;
}

id MOWeatherData.init(temperature:windSpeed:weatherSummry:symbolName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char *v6;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  id v19;
  objc_super v23;

  v11 = &v6[OBJC_IVAR____TtC8momentsd13MOWeatherData_temperature];
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitTemperature>);
  v13 = *(_QWORD *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v11, a1, v12);
  v14 = &v6[OBJC_IVAR____TtC8momentsd13MOWeatherData_windSpeed];
  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitSpeed>);
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v14, a2, v15);
  v17 = &v6[OBJC_IVAR____TtC8momentsd13MOWeatherData_weatherSummary];
  *(_QWORD *)v17 = a3;
  *((_QWORD *)v17 + 1) = a4;
  v18 = &v6[OBJC_IVAR____TtC8momentsd13MOWeatherData_symbolName];
  *(_QWORD *)v18 = a5;
  *((_QWORD *)v18 + 1) = a6;
  v23.receiver = v6;
  v23.super_class = (Class)type metadata accessor for MOWeatherData(0);
  v19 = objc_msgSendSuper2(&v23, "init");
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a2, v15);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a1, v12);
  return v19;
}

uint64_t type metadata accessor for MOWeatherData(uint64_t a1)
{
  uint64_t result;

  result = type metadata singleton initialization cache for MOWeatherData;
  if (!type metadata singleton initialization cache for MOWeatherData)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MOWeatherData);
  return result;
}

uint64_t MOWeatherData.getTemperature()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((swift_isaMask & *v0) + 0x70))();
}

uint64_t MOWeatherData.getWinSpeed()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((swift_isaMask & *v0) + 0x88))();
}

Swift::String __swiftcall MOWeatherData.getWeatherSummary()()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  Swift::String result;

  v1 = (*(uint64_t (**)(void))((swift_isaMask & *v0) + 0xA0))();
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

Swift::String __swiftcall MOWeatherData.getSymbolName()()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  Swift::String result;

  v1 = (*(uint64_t (**)(void))((swift_isaMask & *v0) + 0xB8))();
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

void MOWeatherData.init()()
{
  _swift_stdlib_reportUnimplementedInitializer("momentsd.MOWeatherData", 22, "init()", 6, 0);
  __break(1u);
}

id MOWeatherData.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MOWeatherData(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1001DDC60(_QWORD **a1)
{
  return (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0x70))();
}

uint64_t sub_1001DDC9C(_QWORD **a1)
{
  return (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0x88))();
}

uint64_t sub_1001DDCD8@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0xA0))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1001DDD18(uint64_t *a1, _QWORD **a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))((swift_isaMask & **a2) + 0xA8);
  swift_bridgeObjectRetain(v3);
  return v4(v2, v3);
}

uint64_t sub_1001DDD6C@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0xB8))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1001DDDAC(uint64_t *a1, _QWORD **a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))((swift_isaMask & **a2) + 0xC0);
  swift_bridgeObjectRetain(v3);
  return v4(v2, v3);
}

uint64_t ObjC metadata update function for MOWeatherData()
{
  return type metadata accessor for MOWeatherData(0);
}

void type metadata completion function for MOWeatherData(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[4];

  type metadata accessor for Measurement<NSUnitTemperature>(319, &lazy cache variable for type metadata for Measurement<NSUnitTemperature>, &lazy cache variable for type metadata for NSUnitTemperature, NSUnitTemperature_ptr);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    type metadata accessor for Measurement<NSUnitTemperature>(319, &lazy cache variable for type metadata for Measurement<NSUnitSpeed>, &lazy cache variable for type metadata for NSUnitSpeed, NSUnitSpeed_ptr);
    if (v5 <= 0x3F)
    {
      v6[1] = *(_QWORD *)(v4 - 8) + 64;
      v6[2] = &unk_10029F5F8;
      v6[3] = &unk_10029F5F8;
      swift_updateClassMetadata2(a1, 256, 4, v6, a1 + 80);
    }
  }
}

void type metadata accessor for Measurement<NSUnitTemperature>(uint64_t a1, unint64_t *a2, unint64_t *a3, _QWORD *a4)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = type metadata accessor for NSUnitTemperature(255, a3, a4);
    v7 = type metadata accessor for Measurement(a1, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t type metadata accessor for NSUnitTemperature(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

void hdbscanResult::hdbscanResult(hdbscanResult *this)
{
  *((_QWORD *)this + 8) = 0;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
}

{
  *((_QWORD *)this + 8) = 0;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
}

uint64_t hdbscanResult::hdbscanResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  char *v9;
  char *v10;

  *(_OWORD *)(a1 + 48) = 0u;
  v9 = (char *)(a1 + 48);
  *(_QWORD *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  v10 = (char *)(a1 + 24);
  *(_OWORD *)a1 = 0u;
  if (a1 != a2)
    std::vector<int>::__assign_with_size[abi:ne180100]<int *,int *>((char *)a1, *(char **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2);
  if (v10 != (char *)a3)
    std::vector<outlierScore>::__assign_with_size[abi:ne180100]<outlierScore*,outlierScore*>(v10, *(char **)a3, *(_QWORD *)(a3 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 3));
  if (v9 != (char *)a4)
    std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(v9, *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 3);
  *(_BYTE *)(a1 + 72) = a5;
  return a1;
}

void sub_1001DE0D8(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void *v5;

  v5 = *v3;
  if (*v3)
  {
    *(_QWORD *)(v1 + 56) = v5;
    operator delete(v5);
  }
  hdbscanResult::hdbscanResult(v2, v1);
  _Unwind_Resume(a1);
}

char *std::vector<int>::__assign_with_size[abi:ne180100]<int *,int *>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  void **v12;
  char *v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (a4 > (v8 - *(_QWORD *)result) >> 2)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 62)
      std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 1;
    if (v8 >> 1 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL)
      v11 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<int>::__vallocate[abi:ne180100](v7, v11);
    v13 = (char *)v7[1];
    v12 = (void **)(v7 + 1);
    v9 = v13;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v12 = (void **)(result + 8);
  v14 = (_BYTE *)*((_QWORD *)result + 1);
  v15 = (v14 - v9) >> 2;
  if (v15 >= a4)
    goto LABEL_16;
  v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    v9 = (char *)*v12;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v12 = &v9[v17];
  return result;
}

char *std::vector<int>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

char *std::vector<outlierScore>::__assign_with_size[abi:ne180100]<outlierScore*,outlierScore*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void **v13;
  char *v14;
  _BYTE *v15;
  char *v16;
  uint64_t v17;
  size_t v18;
  void *v19;
  char *v20;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - *(_QWORD *)result) >> 3) < a4)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]();
    v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    v11 = 2 * v10;
    if (2 * v10 <= a4)
      v11 = a4;
    if (v10 >= 0x555555555555555)
      v12 = 0xAAAAAAAAAAAAAAALL;
    else
      v12 = v11;
    result = std::vector<std::vector<double>>::__vallocate[abi:ne180100](v7, v12);
    v14 = (char *)v7[1];
    v13 = (void **)(v7 + 1);
    v9 = v14;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v17 - 4;
      v19 = v9;
      v20 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v13 = (void **)(result + 8);
  v15 = (_BYTE *)*((_QWORD *)result + 1);
  if (0xAAAAAAAAAAAAAAABLL * ((v15 - v9) >> 3) >= a4)
    goto LABEL_16;
  v16 = &__src[8 * ((v15 - v9) >> 3)];
  if (v15 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v15 - v9 - 4);
    v9 = (char *)*v13;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v17 - 4;
    v19 = v9;
    v20 = v16;
LABEL_18:
    result = (char *)memmove(v19, v20, v18);
  }
LABEL_19:
  *v13 = &v9[v17];
  return result;
}

char *std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  void **v12;
  char *v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (a4 > (v8 - *(_QWORD *)result) >> 3)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 61)
      std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 2;
    if (v8 >> 2 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8)
      v11 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<double>::__vallocate[abi:ne180100](v7, v11);
    v13 = (char *)v7[1];
    v12 = (void **)(v7 + 1);
    v9 = v13;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v12 = (void **)(result + 8);
  v14 = (_BYTE *)*((_QWORD *)result + 1);
  v15 = (v14 - v9) >> 3;
  if (v15 >= a4)
    goto LABEL_16;
  v16 = &__src[8 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    v9 = (char *)*v12;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v12 = &v9[v17];
  return result;
}

void outlierScore::outlierScore(outlierScore *this, double a2, double a3, int a4)
{
  *(double *)this = a3;
  *((double *)this + 1) = a2;
  *((_DWORD *)this + 4) = a4;
}

{
  *(double *)this = a3;
  *((double *)this + 1) = a2;
  *((_DWORD *)this + 4) = a4;
}

BOOL outlierScore::operator<(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v2;
  _QWORD v5[3];
  _QWORD v6[3];

  v6[0] = a1 + 8;
  v6[1] = a1;
  v6[2] = a1 + 16;
  v5[0] = a2 + 8;
  v5[1] = a2;
  v5[2] = a2 + 16;
  v2 = std::__tuple_compare_three_way[abi:ne180100]<double const&,double const&,int const&,double const&,double const&,int const&,0ul,1ul,2ul>((uint64_t)v6, (uint64_t)v5);
  return v2 != 129 && (v2 & 0x80u) != 0;
}

uint64_t std::__tuple_compare_three_way[abi:ne180100]<double const&,double const&,int const&,double const&,double const&,int const&,0ul,1ul,2ul>(uint64_t a1, uint64_t a2)
{
  double v2;
  double v3;
  uint64_t v4;
  double *v5;
  double *v6;
  BOOL v7;
  BOOL v8;
  int v9;
  int v10;
  BOOL v11;

  v2 = **(double **)a1;
  v3 = **(double **)a2;
  if (v2 == v3)
    LODWORD(v4) = 0;
  else
    LODWORD(v4) = -127;
  if (v2 > v3)
    LODWORD(v4) = 1;
  if (v2 < v3)
    v4 = 0xFFFFFFFFLL;
  else
    v4 = v4;
  if (!(_DWORD)v4)
  {
    v5 = *(double **)(a1 + 8);
    v6 = *(double **)(a2 + 8);
    v7 = *v5 < *v6;
    v8 = *v5 <= *v6;
    if (*v5 == *v6)
      LODWORD(v4) = 0;
    else
      LODWORD(v4) = -127;
    if (!v8)
      LODWORD(v4) = 1;
    if (v7)
      v4 = 0xFFFFFFFFLL;
    else
      v4 = v4;
    if (!(_DWORD)v4)
    {
      v9 = **(_DWORD **)(a1 + 16);
      v10 = **(_DWORD **)(a2 + 16);
      v11 = v9 == v10;
      if (v9 < v10)
        LODWORD(v4) = -1;
      else
        LODWORD(v4) = 1;
      if (v11)
        return 0;
      else
        return v4;
    }
  }
  return v4;
}

void cluster::cluster(cluster *this)
{
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 6) = (char *)this + 56;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 9) = 0;
  *((_QWORD *)this + 10) = 0;
  *((_QWORD *)this + 11) = 0;
  *(_DWORD *)this = ++cluster::counter;
}

{
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 6) = (char *)this + 56;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 9) = 0;
  *((_QWORD *)this + 10) = 0;
  *((_QWORD *)this + 11) = 0;
  *(_DWORD *)this = ++cluster::counter;
}

void cluster::cluster(cluster *this, int a2, cluster *a3, double a4, int a5)
{
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 6) = (char *)this + 56;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 9) = 0;
  *((_QWORD *)this + 10) = 0;
  *((_QWORD *)this + 11) = 0;
  *(_DWORD *)this = ++cluster::counter;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 0;
  *((double *)this + 1) = a4;
  *((_DWORD *)this + 6) = a5;
  *((_DWORD *)this + 31) = a2;
  *((_DWORD *)this + 32) = 0;
  *((_QWORD *)this + 13) = a3;
  *((_QWORD *)this + 14) = 0;
  *((_QWORD *)this + 12) = 0x7FEFFFFFFFFFFFFFLL;
  if (a3)
    *((_BYTE *)a3 + 120) = 1;
  *((_BYTE *)this + 120) = 0;
  std::vector<cluster *>::resize((uint64_t)this + 72, 0);
}

void sub_1001DE6AC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  void **v3;
  _QWORD **v4;
  void *v6;

  v6 = *v3;
  if (*v3)
  {
    *(_QWORD *)(v2 + 80) = v6;
    operator delete(v6);
  }
  std::__tree<int>::destroy(v1, *v4);
  _Unwind_Resume(a1);
}

void std::vector<cluster *>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 8 * a2;
  }
  else
  {
    std::vector<cluster *>::__append((void **)a1, a2 - v2);
  }
}

BOOL cluster::operator==(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t cluster::detachPoints(uint64_t this, int a2, double a3)
{
  int v3;
  int v4;
  std::logic_error *exception;

  v3 = *(_DWORD *)(this + 24);
  *(double *)(this + 112) = *(double *)(this + 112) + (double)a2 * (1.0 / a3 - 1.0 / *(double *)(this + 8));
  v4 = v3 - a2;
  *(_DWORD *)(this + 24) = v4;
  if (v4)
  {
    if (v4 < 0)
    {
      exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      std::invalid_argument::invalid_argument[abi:ne180100](exception, "Cluster cannot have less than 0 points.");
    }
  }
  else
  {
    *(double *)(this + 16) = a3;
  }
  return this;
}

void sub_1001DE7A4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::invalid_argument::invalid_argument[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void cluster::propagate(cluster *this)
{
  uint64_t v1;
  double v3;
  int v4;
  int v5;
  unint64_t v6;
  _QWORD *v7;
  char **v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  double v28;
  double v29;
  double v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;

  v1 = *((_QWORD *)this + 13);
  if (v1)
  {
    v3 = *((double *)this + 12);
    if (v3 == 1.79769313e308)
    {
      v3 = *((double *)this + 2);
      *((double *)this + 12) = v3;
    }
    if (v3 < *(double *)(v1 + 96))
      *(double *)(v1 + 96) = v3;
    v4 = *((_DWORD *)this + 10);
    if (*((_BYTE *)this + 120))
    {
      v5 = *((_DWORD *)this + 11);
      if (v4 <= v5)
      {
        if (v4 >= v5)
        {
          if (v4 != v5)
            return;
          v28 = *((double *)this + 14);
          v29 = *((double *)this + 4);
          *(_DWORD *)(v1 + 44) += v4;
          v30 = *(double *)(v1 + 32);
          v8 = (char **)(v1 + 72);
          if (v28 >= v29)
          {
            v38 = *(_QWORD *)(v1 + 88);
            *(double *)(v1 + 32) = v28 + v30;
            v7 = *(_QWORD **)(v1 + 80);
            if ((unint64_t)v7 >= v38)
            {
              v39 = ((char *)v7 - *v8) >> 3;
              if (!((unint64_t)(v39 + 1) >> 61))
              {
                v40 = v38 - (_QWORD)*v8;
                v41 = v40 >> 2;
                if (v40 >> 2 <= (unint64_t)(v39 + 1))
                  v41 = v39 + 1;
                if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF8)
                  v42 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v42 = v41;
                if (v42)
                  v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v1 + 88, v42);
                else
                  v43 = 0;
                v31 = &v43[8 * v39];
                v32 = &v43[8 * v42];
                *(_QWORD *)v31 = this;
                v16 = v31 + 8;
                v44 = *(char **)(v1 + 72);
                v33 = *(char **)(v1 + 80);
                if (v33 == v44)
                  goto LABEL_41;
                do
                {
                  v45 = *((_QWORD *)v33 - 1);
                  v33 -= 8;
                  *((_QWORD *)v31 - 1) = v45;
                  v31 -= 8;
                }
                while (v33 != v44);
                goto LABEL_40;
              }
              goto LABEL_58;
            }
            goto LABEL_18;
          }
          *(double *)(v1 + 32) = v29 + v30;
          v18 = *(_QWORD *)(v1 + 80);
          v19 = (char *)*((_QWORD *)this + 9);
          v20 = (char *)*((_QWORD *)this + 10);
          v21 = (v20 - v19) >> 3;
          v17 = v1 + 72;
        }
        else
        {
          *(_DWORD *)(v1 + 44) += v5;
          *(double *)(v1 + 32) = *((double *)this + 4) + *(double *)(v1 + 32);
          v17 = v1 + 72;
          v18 = *(_QWORD *)(v1 + 80);
          v19 = (char *)*((_QWORD *)this + 9);
          v20 = (char *)*((_QWORD *)this + 10);
          v21 = (v20 - v19) >> 3;
        }
        std::vector<cluster *>::__insert_with_size[abi:ne180100]<std::__wrap_iter<cluster **>,std::__wrap_iter<cluster **>>(v17, v18, v19, v20, v21);
        return;
      }
      v6 = *(_QWORD *)(v1 + 88);
      *(_DWORD *)(v1 + 44) += v4;
      *(double *)(v1 + 32) = *((double *)this + 14) + *(double *)(v1 + 32);
      v7 = *(_QWORD **)(v1 + 80);
      if ((unint64_t)v7 >= v6)
      {
        v8 = (char **)(v1 + 72);
        v9 = *(_QWORD *)(v1 + 72);
        v10 = ((uint64_t)v7 - v9) >> 3;
        if (!((unint64_t)(v10 + 1) >> 61))
        {
          v11 = v6 - v9;
          v12 = v11 >> 2;
          if (v11 >> 2 <= (unint64_t)(v10 + 1))
            v12 = v10 + 1;
          if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
            v13 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v13 = v12;
          if (v13)
            v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v1 + 88, v13);
          else
            v14 = 0;
          v31 = &v14[8 * v10];
          v32 = &v14[8 * v13];
          *(_QWORD *)v31 = this;
          v16 = v31 + 8;
          v36 = *(char **)(v1 + 72);
          v33 = *(char **)(v1 + 80);
          if (v33 == v36)
            goto LABEL_41;
          do
          {
            v37 = *((_QWORD *)v33 - 1);
            v33 -= 8;
            *((_QWORD *)v31 - 1) = v37;
            v31 -= 8;
          }
          while (v33 != v36);
LABEL_40:
          v33 = *v8;
LABEL_41:
          *(_QWORD *)(v1 + 72) = v31;
          *(_QWORD *)(v1 + 80) = v16;
          *(_QWORD *)(v1 + 88) = v32;
          if (v33)
            operator delete(v33);
          goto LABEL_43;
        }
        goto LABEL_58;
      }
    }
    else
    {
      v15 = *(_QWORD *)(v1 + 88);
      *(_DWORD *)(v1 + 44) += v4;
      *(double *)(v1 + 32) = *((double *)this + 14) + *(double *)(v1 + 32);
      v7 = *(_QWORD **)(v1 + 80);
      if ((unint64_t)v7 >= v15)
      {
        v8 = (char **)(v1 + 72);
        v22 = *(_QWORD *)(v1 + 72);
        v23 = ((uint64_t)v7 - v22) >> 3;
        if (!((unint64_t)(v23 + 1) >> 61))
        {
          v24 = v15 - v22;
          v25 = v24 >> 2;
          if (v24 >> 2 <= (unint64_t)(v23 + 1))
            v25 = v23 + 1;
          if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8)
            v26 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v26 = v25;
          if (v26)
            v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v1 + 88, v26);
          else
            v27 = 0;
          v31 = &v27[8 * v23];
          v32 = &v27[8 * v26];
          *(_QWORD *)v31 = this;
          v16 = v31 + 8;
          v34 = *(char **)(v1 + 72);
          v33 = *(char **)(v1 + 80);
          if (v33 == v34)
            goto LABEL_41;
          do
          {
            v35 = *((_QWORD *)v33 - 1);
            v33 -= 8;
            *((_QWORD *)v31 - 1) = v35;
            v31 -= 8;
          }
          while (v33 != v34);
          goto LABEL_40;
        }
LABEL_58:
        std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]();
      }
    }
LABEL_18:
    *v7 = this;
    v16 = v7 + 1;
LABEL_43:
    *(_QWORD *)(v1 + 80) = v16;
  }
}

uint64_t **cluster::addPointsToVirtualChildCluster(uint64_t **result, _QWORD *a2)
{
  int *v2;
  int *v3;
  uint64_t **v4;
  int *v5;
  int *v6;
  BOOL v7;

  v2 = (int *)(a2 + 1);
  v3 = (int *)*a2;
  if ((_QWORD *)*a2 != a2 + 1)
  {
    v4 = result + 6;
    do
    {
      result = std::__tree<int>::__emplace_unique_key_args<int,int const&>(v4, v3 + 7, v3 + 7);
      v5 = (int *)*((_QWORD *)v3 + 1);
      if (v5)
      {
        do
        {
          v6 = v5;
          v5 = *(int **)v5;
        }
        while (v5);
      }
      else
      {
        do
        {
          v6 = (int *)*((_QWORD *)v3 + 2);
          v7 = *(_QWORD *)v6 == (_QWORD)v3;
          v3 = v6;
        }
        while (!v7);
      }
      v3 = v6;
    }
    while (v6 != v2);
  }
  return result;
}

BOOL cluster::virtualChildClusterConstraintsPoint(cluster *this, int a2)
{
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  int v6;
  BOOL v7;
  char **v8;

  v4 = (char *)*((_QWORD *)this + 7);
  v2 = (char *)this + 56;
  v3 = v4;
  if (!v4)
    goto LABEL_11;
  v5 = v2;
  do
  {
    v6 = *((_DWORD *)v3 + 7);
    v7 = v6 < a2;
    if (v6 >= a2)
      v8 = (char **)v3;
    else
      v8 = (char **)(v3 + 8);
    if (!v7)
      v5 = v3;
    v3 = *v8;
  }
  while (*v8);
  if (v5 == v2 || *((_DWORD *)v5 + 7) > a2)
LABEL_11:
    v5 = v2;
  return v5 != v2;
}

uint64_t cluster::addVirtualChildConstraintsSatisfied(uint64_t this, int a2)
{
  *(_DWORD *)(this + 44) += a2;
  return this;
}

uint64_t cluster::addConstraintsSatisfied(uint64_t this, int a2)
{
  *(_DWORD *)(this + 40) += a2;
  return this;
}

void cluster::releaseVirtualChildCluster(cluster *this)
{
  _QWORD *v1;

  v1 = (_QWORD *)((char *)this + 56);
  std::__tree<int>::destroy((uint64_t)this + 48, *((_QWORD **)this + 7));
  *(v1 - 1) = v1;
  *v1 = 0;
  v1[1] = 0;
}

uint64_t cluster::getClusterId(cluster *this)
{
  return *(unsigned int *)this;
}

void cluster_factory::createNewCluster(cluster_factory *this, int a2, cluster *a3, double a4)
{
  operator new();
}

void sub_1001DED5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  uint64_t v11;

  std::__split_buffer<std::unique_ptr<cluster>>::~__split_buffer((uint64_t)&a10);
  v11 = a9;
  a9 = 0;
  if (v11)
    std::default_delete<cluster>::operator()[abi:ne180100]((uint64_t)&a9, v11);
  _Unwind_Resume(a1);
}

void std::vector<cluster *>::__append(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = v7 - (_BYTE *)*a1;
    v9 = a2 + (v8 >> 3);
    if (v9 >> 61)
      std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 3;
    v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 2 > v9)
      v9 = v11 >> 2;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v4, v12);
    else
      v13 = 0;
    v14 = &v13[8 * v10];
    v15 = &v13[8 * v12];
    bzero(v14, 8 * a2);
    v16 = &v14[8 * a2];
    v18 = (char *)*a1;
    v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        v19 = *((_QWORD *)v17 - 1);
        v17 -= 8;
        *((_QWORD *)v14 - 1) = v19;
        v14 -= 8;
      }
      while (v17 != v18);
      v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
      operator delete(v17);
  }
}

char *std::vector<cluster *>::__insert_with_size[abi:ne180100]<std::__wrap_iter<cluster **>,std::__wrap_iter<cluster **>>(uint64_t a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  char *v5;
  char *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  int64_t v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  void *__p;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;

  v5 = (char *)__dst;
  if (a5 < 1)
    return v5;
  v7 = __src;
  v11 = *(_QWORD *)(a1 + 16);
  v9 = a1 + 16;
  v10 = v11;
  v12 = *(_QWORD *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 3)
  {
    v13 = *(void **)a1;
    v14 = a5 + ((uint64_t)(v12 - *(_QWORD *)a1) >> 3);
    if (v14 >> 61)
      std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]();
    v15 = (__dst - (uint64_t)v13) >> 3;
    v16 = v10 - (_QWORD)v13;
    if (v16 >> 2 > v14)
      v14 = v16 >> 2;
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8)
      v17 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v17 = v14;
    v37 = v9;
    if (v17)
      v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v9, v17);
    else
      v18 = 0;
    v28 = &v18[8 * v15];
    __p = v18;
    v34 = v28;
    v36 = &v18[8 * v17];
    v29 = 8 * a5;
    v30 = &v28[8 * a5];
    do
    {
      v31 = *(_QWORD *)v7;
      v7 += 8;
      *(_QWORD *)v28 = v31;
      v28 += 8;
      v29 -= 8;
    }
    while (v29);
    v35 = v30;
    v5 = std::vector<cluster *>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v5);
    if (v35 != v34)
      v35 += (v34 - v35 + 7) & 0xFFFFFFFFFFFFFFF8;
    if (__p)
      operator delete(__p);
    return v5;
  }
  v19 = v12 - __dst;
  v20 = (uint64_t)(v12 - __dst) >> 3;
  if (v20 >= a5)
  {
    v21 = &__src[8 * a5];
    v23 = *(char **)(v9 - 8);
LABEL_17:
    v24 = &v5[8 * a5];
    v25 = &v23[-8 * a5];
    v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      v26 = v23;
      do
      {
        v27 = *(_QWORD *)v25;
        v25 += 8;
        *(_QWORD *)v26 = v27;
        v26 += 8;
      }
      while ((unint64_t)v25 < v12);
    }
    *(_QWORD *)(a1 + 8) = v26;
    if (v23 != v24)
      memmove(&v23[-8 * ((v23 - v24) >> 3)], v5, v23 - v24);
    if (v21 != v7)
      memmove(v5, v7, v21 - v7);
    return v5;
  }
  v21 = &__src[8 * v20];
  v22 = a4 - v21;
  if (a4 != v21)
    memmove(*(void **)(v9 - 8), &__src[8 * v20], a4 - v21);
  v23 = (char *)(v12 + v22);
  *(_QWORD *)(a1 + 8) = v12 + v22;
  if (v19 >= 1)
    goto LABEL_17;
  return v5;
}

void sub_1001DF080(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

char *std::vector<cluster *>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  int64_t v12;
  char *v13;
  void *v14;
  void *v15;

  v5 = *(char **)(a2 + 8);
  v6 = (char *)*a1;
  v7 = v5;
  if (*a1 != __src)
  {
    v8 = __src;
    v7 = *(char **)(a2 + 8);
    do
    {
      v9 = *((_QWORD *)v8 - 1);
      v8 -= 8;
      *((_QWORD *)v7 - 1) = v9;
      v7 -= 8;
    }
    while (v8 != v6);
  }
  *(_QWORD *)(a2 + 8) = v7;
  v10 = a1[1];
  v11 = *(_QWORD *)(a2 + 16);
  v12 = v10 - __src;
  if (v10 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v10 - __src);
    v7 = *(char **)(a2 + 8);
  }
  *(_QWORD *)(a2 + 16) = v11 + v12;
  v13 = (char *)*a1;
  *a1 = v7;
  *(_QWORD *)(a2 + 8) = v13;
  v14 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = v14;
  v15 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(_QWORD *)(a2 + 24) = v15;
  *(_QWORD *)a2 = *(_QWORD *)(a2 + 8);
  return v5;
}

uint64_t std::vector<std::unique_ptr<cluster>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::unique_ptr<cluster>>,std::reverse_iterator<std::unique_ptr<cluster>*>,std::reverse_iterator<std::unique_ptr<cluster>*>,std::reverse_iterator<std::unique_ptr<cluster>*>>((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::unique_ptr<cluster>>,std::reverse_iterator<std::unique_ptr<cluster>*>,std::reverse_iterator<std::unique_ptr<cluster>*>,std::reverse_iterator<std::unique_ptr<cluster>*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[3];
  char v14;
  __int128 v15;
  __int128 v16;

  v7 = a7;
  *(_QWORD *)&v16 = a6;
  *((_QWORD *)&v16 + 1) = a7;
  v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  if (a3 == a5)
  {
    v11 = a6;
  }
  else
  {
    v8 = (_QWORD *)(a7 - 8);
    v9 = (_QWORD *)(a7 - 8);
    do
    {
      v10 = *--a3;
      *a3 = 0;
      *v9-- = v10;
      *((_QWORD *)&v16 + 1) = v8;
      v7 -= 8;
      v8 = v9;
    }
    while (a3 != a5);
    v11 = v16;
  }
  v14 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<cluster>>,std::reverse_iterator<std::unique_ptr<cluster>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v13);
  return v11;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<cluster>>,std::reverse_iterator<std::unique_ptr<cluster>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<cluster>>,std::reverse_iterator<std::unique_ptr<cluster>*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<cluster>>,std::reverse_iterator<std::unique_ptr<cluster>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;

  v1 = *(uint64_t **)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(uint64_t **)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = *v1;
    *v1 = 0;
    if (v3)
      std::default_delete<cluster>::operator()[abi:ne180100]((uint64_t)v1, v3);
    ++v1;
  }
}

uint64_t std::__split_buffer<std::unique_ptr<cluster>>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<std::unique_ptr<cluster>>::__destruct_at_end[abi:ne180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<std::unique_ptr<cluster>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t i;
  uint64_t v5;

  for (i = *(_QWORD *)(a1 + 16); i != a2; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;
    v5 = *(_QWORD *)(i - 8);
    *(_QWORD *)(i - 8) = 0;
    if (v5)
      std::default_delete<cluster>::operator()[abi:ne180100](i - 8, v5);
  }
}

void std::__tree<int>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<int>::destroy(a1, *a2);
    std::__tree<int>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t **std::__tree<int>::__emplace_unique_key_args<int,int const&>(uint64_t **a1, int *a2, _DWORD *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  int v7;
  uint64_t **v8;
  int v9;
  uint64_t *v10;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = *((_DWORD *)v5 + 7);
        if (v7 >= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = (uint64_t *)operator new(0x20uLL);
    *((_DWORD *)v10 + 7) = *a3;
    std::__tree<int>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }
  return v8;
}

uint64_t *std::__tree<int>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::default_delete<cluster>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v3;

  if (a2)
  {
    v3 = *(void **)(a2 + 72);
    if (v3)
    {
      *(_QWORD *)(a2 + 80) = v3;
      operator delete(v3);
    }
    std::__tree<int>::destroy(a2 + 48, *(_QWORD **)(a2 + 56));
    operator delete();
  }
}

double EuclideanDistance::computeDistance(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  double v6;
  unsigned int v7;
  double v8;

  v3 = a2[1] - *a2;
  if (v3)
  {
    v4 = 0;
    v5 = v3 >> 3;
    v6 = 0.0;
    v7 = 1;
    do
    {
      if ((uint64_t)(a3[1] - *a3) >> 3 <= v4)
        break;
      v8 = *(double *)(*a2 + 8 * v4) - *(double *)(*a3 + 8 * v4);
      v6 = v6 + v8 * v8;
      v4 = v7;
    }
    while (v5 > v7++);
  }
  else
  {
    v6 = 0.0;
  }
  return sqrt(v6);
}

uint64_t bitSet::get(bitSet *this, int a2)
{
  if (*((_QWORD *)this + 1) <= (unint64_t)a2)
    return 0;
  else
    return (*(_QWORD *)(*(_QWORD *)this + (((unint64_t)a2 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a2) & 1;
}

void bitSet::set(bitSet *this, int a2)
{
  unint64_t v3;

  v3 = a2;
  if (*((_QWORD *)this + 1) <= (unint64_t)a2)
    std::vector<BOOL>::resize((uint64_t)this, a2 + 64, 0);
  *(_QWORD *)(*(_QWORD *)this + ((v3 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v3;
}

void bitSet::ensure(bitSet *this, int a2)
{
  if (*((_QWORD *)this + 1) <= (unint64_t)a2)
    std::vector<BOOL>::resize((uint64_t)this, a2 + 64, 0);
}

void std::vector<BOOL>::resize(uint64_t a1, unint64_t a2, int a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;
  unint64_t v9;
  unint64_t v11;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  char *v15;
  __int128 v16;
  char *v17;
  uint64_t v18;
  char *v19;
  int v20;
  char *v21;
  __int128 v22;
  char *v23;
  int v24;

  v5 = *(_QWORD *)(a1 + 8);
  v6 = a2 - v5;
  if (a2 <= v5)
  {
    *(_QWORD *)(a1 + 8) = a2;
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 16);
    v9 = v8 << 6;
    if (v8 << 6 < v6 || v5 > (v8 << 6) - v6)
    {
      v21 = 0;
      v22 = 0uLL;
      if ((a2 & 0x8000000000000000) != 0)
        std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]();
      v11 = v8 << 7;
      if (v11 <= ((a2 + 63) & 0xFFFFFFFFFFFFFFC0))
        v11 = (a2 + 63) & 0xFFFFFFFFFFFFFFC0;
      if (v9 <= 0x3FFFFFFFFFFFFFFELL)
        v12 = v11;
      else
        v12 = 0x7FFFFFFFFFFFFFFFLL;
      std::vector<BOOL>::reserve(&v21, v12);
      v13 = *(unint64_t **)a1;
      v14 = *(_QWORD *)(a1 + 8);
      *(_QWORD *)&v22 = v14 + v6;
      v23 = v21;
      v24 = 0;
      std::__copy_aligned[abi:ne180100]<std::vector<BOOL>,true>(v13, 0, (uint64_t)&v13[v14 >> 6], v14 & 0x3F, (uint64_t)&v23, (uint64_t)&v19);
      v17 = v19;
      LODWORD(v18) = v20;
      v15 = *(char **)a1;
      *(_QWORD *)a1 = v21;
      v21 = v15;
      v16 = *(_OWORD *)(a1 + 8);
      *(_OWORD *)(a1 + 8) = v22;
      v22 = v16;
      if (v15)
        operator delete(v15);
    }
    else
    {
      v17 = (char *)(*(_QWORD *)a1 + 8 * (v5 >> 6));
      v18 = *(_QWORD *)(a1 + 8) & 0x3FLL;
      *(_QWORD *)(a1 + 8) = a2;
    }
    if (a2 != v5)
    {
      if (a3)
      {
        v21 = v17;
        LODWORD(v22) = v18;
        std::__fill_n[abi:ne180100]<true,std::vector<BOOL>>(&v21, v6);
      }
      else
      {
        v21 = v17;
        LODWORD(v22) = v18;
        std::__fill_n[abi:ne180100]<false,std::vector<BOOL>>((uint64_t)&v21, v6);
      }
    }
  }
}

void sub_1001DF934(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::vector<BOOL>::reserve(char **a1, unint64_t a2)
{
  unint64_t v3;
  char *v4;
  __int128 v5;
  char *v6;
  int v7;
  char *v8;
  int v9;
  char *v10;
  __int128 v11;

  if (a2 > (_QWORD)a1[2] << 6)
  {
    if ((a2 & 0x8000000000000000) != 0)
      std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]();
    v10 = 0;
    v11 = 0uLL;
    std::vector<BOOL>::__vallocate[abi:ne180100](&v10, a2);
    v3 = (unint64_t)a1[1];
    v8 = *a1;
    v9 = 0;
    v6 = &v8[8 * (v3 >> 6)];
    v7 = v3 & 0x3F;
    std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(&v10, (uint64_t)&v8, (uint64_t)&v6, v3);
    v4 = *a1;
    *a1 = v10;
    v10 = v4;
    v5 = *(_OWORD *)(a1 + 1);
    *(_OWORD *)(a1 + 1) = v11;
    v11 = v5;
    if (v4)
      operator delete(v4);
  }
}

void sub_1001DF9F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void *std::vector<BOOL>::__vallocate[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  void *result;
  uint64_t v4;

  if (a2 < 0)
    std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]();
  result = std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 2), ((unint64_t)(a2 - 1) >> 6) + 1);
  *a1 = result;
  a1[1] = 0;
  a1[2] = v4;
  return result;
}

void std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;

  v4 = a1[1];
  v5 = v4 + a4;
  a1[1] = v4 + a4;
  if (!v4 || ((v5 - 1) ^ (v4 - 1)) >= 0x40)
  {
    if (v5 >= 0x41)
      v6 = (v5 - 1) >> 6;
    else
      v6 = 0;
    *(_QWORD *)(*a1 + 8 * v6) = 0;
  }
  v7 = *(_DWORD *)(a2 + 8);
  v8 = *(_QWORD *)a3;
  v9 = *(_DWORD *)(a3 + 8);
  v10 = *a1 + 8 * (v4 >> 6);
  v16 = *(_QWORD *)a2;
  v17 = v7;
  v14 = v8;
  v15 = v9;
  v12 = v10;
  v13 = v4 & 0x3F;
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,0>(&v16, &v14, &v12, (uint64_t)&v11);
}

void std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;

  v5 = *((_DWORD *)a1 + 2);
  v6 = *a2;
  v7 = *((_DWORD *)a2 + 2);
  v16 = *a1;
  v17 = v5;
  v14 = v6;
  v15 = v7;
  v8 = *((_DWORD *)a3 + 2);
  v12 = *a3;
  v13 = v8;
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>((uint64_t)&v16, (uint64_t)&v14, (uint64_t)&v12, (uint64_t)&v18);
  v9 = v19;
  v10 = v20;
  v11 = v21;
  *(_QWORD *)a4 = v18;
  *(_DWORD *)(a4 + 8) = v9;
  *(_QWORD *)(a4 + 16) = v10;
  *(_DWORD *)(a4 + 24) = v11;
}

void std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  _QWORD *v4;
  int v5;
  int i;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;

  v4 = *(_QWORD **)a1;
  v5 = *(_DWORD *)(a1 + 8);
  for (i = *(_DWORD *)(a3 + 8); *(_QWORD *)a1 != *(_QWORD *)a2 || v5 != *(_DWORD *)(a2 + 8); v5 = *(_DWORD *)(a1 + 8))
  {
    v8 = *(uint64_t **)a3;
    v9 = 1 << i;
    if (((*v4 >> v5) & 1) != 0)
      v10 = *v8 | v9;
    else
      v10 = *v8 & ~v9;
    *v8 = v10;
    if (v5 == 63)
    {
      v11 = 0;
      *(_QWORD *)a1 = v4 + 1;
    }
    else
    {
      v11 = v5 + 1;
    }
    *(_DWORD *)(a1 + 8) = v11;
    v12 = *(_DWORD *)(a3 + 8);
    if (v12 == 63)
    {
      i = 0;
      *(_QWORD *)a3 += 8;
    }
    else
    {
      i = v12 + 1;
    }
    *(_DWORD *)(a3 + 8) = i;
    v4 = *(_QWORD **)a1;
  }
  *(_QWORD *)a4 = v4;
  *(_DWORD *)(a4 + 8) = v5;
  *(_QWORD *)(a4 + 16) = *(_QWORD *)a3;
  *(_DWORD *)(a4 + 24) = i;
}

unint64_t *std::__copy_aligned[abi:ne180100]<std::vector<BOOL>,true>@<X0>(unint64_t *__src@<X0>, unsigned int a2@<W1>, uint64_t a3@<X2>, unsigned int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  int64_t v8;
  unint64_t *v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *v16;

  v8 = a4 - (unint64_t)a2 + 8 * (a3 - (_QWORD)__src);
  if (v8 <= 0)
  {
    v16 = *(unint64_t **)a5;
  }
  else
  {
    v9 = __src;
    __src = *(unint64_t **)a5;
    if (a2)
    {
      if (v8 >= (unint64_t)(64 - a2))
        v10 = 64 - a2;
      else
        v10 = v8;
      v8 -= v10;
      v11 = *v9++;
      *__src = *__src & ~((0xFFFFFFFFFFFFFFFFLL >> (64 - a2 - v10)) & (-1 << a2)) | v11 & (0xFFFFFFFFFFFFFFFFLL >> (64 - a2 - v10)) & (-1 << a2);
      v12 = v10 + *(unsigned int *)(a5 + 8);
      __src = (unint64_t *)((char *)__src + ((v12 >> 3) & 0x3FFFFFF8));
      *(_QWORD *)a5 = __src;
      *(_DWORD *)(a5 + 8) = v12 & 0x3F;
    }
    if (v8 >= 0)
      v13 = v8;
    else
      v13 = v8 + 63;
    v14 = v13 >> 6;
    if ((unint64_t)(v8 + 63) >= 0x7F)
    {
      memmove(__src, v9, 8 * v14);
      __src = *(unint64_t **)a5;
    }
    v15 = v8 - (v14 << 6);
    v16 = &__src[v14];
    *(_QWORD *)a5 = v16;
    if (v15 >= 1)
    {
      *v16 = *v16 & ~(0xFFFFFFFFFFFFFFFFLL >> (((_BYTE)v14 << 6) - v8)) | v9[v14] & (0xFFFFFFFFFFFFFFFFLL >> (((_BYTE)v14 << 6) - v8));
      *(_DWORD *)(a5 + 8) = v15;
    }
  }
  *(_QWORD *)a6 = v16;
  *(_DWORD *)(a6 + 8) = *(_DWORD *)(a5 + 8);
  return __src;
}

_QWORD *std::__fill_n[abi:ne180100]<true,std::vector<BOOL>>(_QWORD *result, unint64_t a2)
{
  unint64_t v2;
  _QWORD *v3;
  int v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;

  v2 = a2;
  v3 = result;
  v4 = *((_DWORD *)result + 2);
  v5 = (_QWORD *)*result;
  if (v4)
  {
    if ((64 - v4) >= a2)
      v6 = a2;
    else
      v6 = (64 - v4);
    *v5++ |= (0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4);
    v2 = a2 - v6;
    *result = v5;
  }
  v7 = v2 >> 6;
  if (v2 >= 0x40)
    result = memset(v5, 255, 8 * v7);
  if ((v2 & 0x3F) != 0)
  {
    v8 = &v5[v7];
    *v3 = v8;
    *v8 |= 0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F);
  }
  return result;
}

void std::__fill_n[abi:ne180100]<false,std::vector<BOOL>>(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  int v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;

  v2 = a2;
  v4 = *(_DWORD *)(a1 + 8);
  v5 = *(_QWORD **)a1;
  if (v4)
  {
    if ((64 - v4) >= a2)
      v6 = a2;
    else
      v6 = (64 - v4);
    *v5++ &= ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4));
    v2 = a2 - v6;
    *(_QWORD *)a1 = v5;
  }
  v7 = v2 >> 6;
  if (v2 >= 0x40)
    bzero(v5, 8 * v7);
  if ((v2 & 0x3F) != 0)
  {
    v8 = &v5[v7];
    *(_QWORD *)a1 = v8;
    *v8 &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F));
  }
}

void undirectedGraph::quicksortByEdgeWeight(undirectedGraph *this)
{
  uint64_t v1;
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  std::vector<int> __p;
  std::vector<int> v9;

  v1 = (uint64_t)(*((_QWORD *)this + 8) - *((_QWORD *)this + 7)) >> 3;
  if ((int)v1 >= 2)
  {
    std::vector<int>::vector(&v9, v1 >> 1);
    std::vector<int>::vector(&__p, v1 >> 1);
    v3 = 0;
    *v9.__begin_ = 0;
    *__p.__begin_ = v1 - 1;
    do
    {
      v4 = v9.__begin_[v3];
      v5 = __p.__begin_[v3];
      v6 = undirectedGraph::selectPivotIndex(this, v4, v5);
      v7 = undirectedGraph::partition(this, v4, v5, v6);
      if (v7 <= (int)v4 + 1)
      {
        --v3;
      }
      else
      {
        v9.__begin_[v3] = v4;
        __p.__begin_[v3] = v7 - 1;
      }
      if (v7 < v5 - 1)
      {
        v9.__begin_[++v3] = v7 + 1;
        __p.__begin_[v3] = v5;
      }
    }
    while ((v3 & 0x80000000) == 0);
    if (__p.__begin_)
    {
      __p.__end_ = __p.__begin_;
      operator delete(__p.__begin_);
    }
    if (v9.__begin_)
    {
      v9.__end_ = v9.__begin_;
      operator delete(v9.__begin_);
    }
  }
}

void sub_1001DFFF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t undirectedGraph::selectPivotIndex(undirectedGraph *this, uint64_t a2, int a3)
{
  uint64_t result;
  uint64_t v4;
  double v5;
  int v6;
  uint64_t v7;
  double v8;
  double v9;

  if ((int)a2 - a3 < 2)
    return a2;
  v4 = *((_QWORD *)this + 7);
  v5 = *(double *)(v4 + 8 * (int)a2);
  v6 = a3 - a2;
  if (a3 < (int)a2)
    ++v6;
  v7 = (a2 + (v6 >> 1));
  v8 = *(double *)(v4 + 8 * (int)v7);
  v9 = *(double *)(v4 + 8 * a3);
  if (v5 <= v8)
  {
    result = v7;
    if (v8 > v9)
    {
      if (v9 >= v5)
        return a3;
      else
        return a2;
    }
  }
  else
  {
    result = a2;
    if (v5 > v9)
    {
      if (v9 >= v8)
        return a3;
      else
        return v7;
    }
  }
  return result;
}

uint64_t undirectedGraph::partition(undirectedGraph *this, uint64_t a2, int a3, int a4)
{
  uint64_t v4;
  double v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;

  v4 = *((_QWORD *)this + 7);
  v5 = *(double *)(v4 + 8 * a4);
  if (a4 != a3)
  {
    v6 = *((_QWORD *)this + 1);
    v7 = *(_DWORD *)(v6 + 4 * a4);
    v8 = *((_QWORD *)this + 4);
    v9 = *(_DWORD *)(v8 + 4 * a4);
    *(_DWORD *)(v6 + 4 * a4) = *(_DWORD *)(v6 + 4 * a3);
    *(_DWORD *)(v8 + 4 * a4) = *(_DWORD *)(v8 + 4 * a3);
    *(_QWORD *)(v4 + 8 * a4) = *(_QWORD *)(v4 + 8 * a3);
    *(_DWORD *)(v6 + 4 * a3) = v7;
    *(_DWORD *)(v8 + 4 * a3) = v9;
    *(double *)(v4 + 8 * a3) = v5;
  }
  if ((int)a2 < a3)
  {
    v10 = (int)a2;
    do
    {
      v11 = *(double *)(v4 + 8 * v10);
      if (v11 < v5)
      {
        if ((_DWORD)v10 != (_DWORD)a2)
        {
          v12 = *((_QWORD *)this + 1);
          v13 = *(_DWORD *)(v12 + 4 * v10);
          v14 = *((_QWORD *)this + 4);
          v15 = *(_DWORD *)(v14 + 4 * v10);
          *(_DWORD *)(v12 + 4 * v10) = *(_DWORD *)(v12 + 4 * (int)a2);
          *(_DWORD *)(v14 + 4 * v10) = *(_DWORD *)(v14 + 4 * (int)a2);
          *(_QWORD *)(v4 + 8 * v10) = *(_QWORD *)(v4 + 8 * (int)a2);
          *(_DWORD *)(v12 + 4 * (int)a2) = v13;
          *(_DWORD *)(v14 + 4 * (int)a2) = v15;
          *(double *)(v4 + 8 * (int)a2) = v11;
        }
        a2 = (a2 + 1);
      }
      ++v10;
    }
    while (a3 != v10);
  }
  if ((_DWORD)a2 != a3)
  {
    v16 = *((_QWORD *)this + 1);
    v17 = *(_DWORD *)(v16 + 4 * (int)a2);
    v18 = *((_QWORD *)this + 4);
    v19 = *(_DWORD *)(v18 + 4 * (int)a2);
    v20 = *(_QWORD *)(v4 + 8 * (int)a2);
    *(_DWORD *)(v16 + 4 * (int)a2) = *(_DWORD *)(v16 + 4 * a3);
    *(_DWORD *)(v18 + 4 * (int)a2) = *(_DWORD *)(v18 + 4 * a3);
    *(_QWORD *)(v4 + 8 * (int)a2) = *(_QWORD *)(v4 + 8 * a3);
    *(_DWORD *)(v16 + 4 * a3) = v17;
    *(_DWORD *)(v18 + 4 * a3) = v19;
    *(_QWORD *)(v4 + 8 * a3) = v20;
  }
  return a2;
}

double undirectedGraph::swapEdges(undirectedGraph *this, int a2, int a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  double result;

  if (a2 != a3)
  {
    v3 = *((_QWORD *)this + 1);
    v4 = *(_DWORD *)(v3 + 4 * a2);
    v5 = *((_QWORD *)this + 4);
    v6 = *(_DWORD *)(v5 + 4 * a2);
    v7 = *((_QWORD *)this + 7);
    result = *(double *)(v7 + 8 * a2);
    *(_DWORD *)(v3 + 4 * a2) = *(_DWORD *)(v3 + 4 * a3);
    *(_DWORD *)(v5 + 4 * a2) = *(_DWORD *)(v5 + 4 * a3);
    *(_QWORD *)(v7 + 8 * a2) = *(_QWORD *)(v7 + 8 * a3);
    *(_DWORD *)(v3 + 4 * a3) = v4;
    *(_DWORD *)(v5 + 4 * a3) = v6;
    *(double *)(v7 + 8 * a3) = result;
  }
  return result;
}

uint64_t undirectedGraph::getNumVertices(undirectedGraph *this)
{
  return *(unsigned int *)this;
}

uint64_t undirectedGraph::getNumEdges(undirectedGraph *this)
{
  return (*((_QWORD *)this + 8) - *((_QWORD *)this + 7)) >> 3;
}

uint64_t undirectedGraph::getFirstVertexAtIndex(undirectedGraph *this, int a2)
{
  return *(unsigned int *)(*((_QWORD *)this + 1) + 4 * a2);
}

uint64_t undirectedGraph::getSecondVertexAtIndex(undirectedGraph *this, int a2)
{
  return *(unsigned int *)(*((_QWORD *)this + 4) + 4 * a2);
}

double undirectedGraph::getEdgeWeightAtIndex(undirectedGraph *this, int a2)
{
  return *(double *)(*((_QWORD *)this + 7) + 8 * a2);
}

uint64_t undirectedGraph::getEdgeListForVertex(undirectedGraph *this, int a2)
{
  return *((_QWORD *)this + 10) + 24 * a2;
}

std::vector<int> *__cdecl std::vector<int>::vector(std::vector<int> *this, std::vector<int>::size_type __n)
{
  std::vector<int>::pointer end;

  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<int>::__vallocate[abi:ne180100](this, __n);
    end = this->__end_;
    bzero(end, 4 * __n);
    this->__end_ = &end[__n];
  }
  return this;
}

void sub_1001E025C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

_DWORD *hdbscanConstraint::hdbscanConstraint(_DWORD *result, int a2, int a3, int a4)
{
  result[1] = a2;
  result[2] = a3;
  *result = a4;
  return result;
}

{
  result[1] = a2;
  result[2] = a3;
  *result = a4;
  return result;
}

uint64_t hdbscanConstraint::getPointA(hdbscanConstraint *this)
{
  return *((unsigned int *)this + 1);
}

uint64_t hdbscanConstraint::getPointB(hdbscanConstraint *this)
{
  return *((unsigned int *)this + 2);
}

uint64_t hdbscanConstraint::getConstraintType(hdbscanConstraint *this)
{
  return *(unsigned int *)this;
}

double ManhattanDistance::computeDistance(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  double result;
  unsigned int v7;

  v3 = a2[1] - *a2;
  if (!v3)
    return 0.0;
  v4 = 0;
  v5 = v3 >> 3;
  result = 0.0;
  v7 = 1;
  do
  {
    if ((uint64_t)(a3[1] - *a3) >> 3 <= v4)
      break;
    result = result + vabdd_f64(*(double *)(*a2 + 8 * v4), *(double *)(*a3 + 8 * v4));
    v4 = v7;
  }
  while (v5 > v7++);
  return result;
}

void hdbscanStar::hdbscanAlgorithm::calculateCoreDistances(_QWORD *a1@<X0>, int a2@<W1>, void **a3@<X8>)
{
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  double v11;
  double *v12;
  int v13;
  double v14;
  uint64_t v15;
  void *v16;
  uint64_t __len;
  void *__b[3];

  v5 = -1431655765 * ((uint64_t)(a1[1] - *a1) >> 3);
  std::vector<double>::vector(a3, v5);
  v6 = a2 - 1;
  if (a2 == 1)
  {
    if (v5 >= 1)
      bzero(*a3, 8 * v5);
  }
  else if (v5 >= 1)
  {
    v7 = 0;
    v8 = a2 - 2;
    __len = 8 * (a2 - 1);
    do
    {
      std::vector<double>::vector(__b, v6);
      if (a2 >= 2)
        memset_pattern16(__b[0], &unk_10029F660, __len);
      v9 = 0;
      v10 = __b[0];
      do
      {
        if (v7 != v9)
        {
          v11 = *(double *)(*(_QWORD *)(*a1 + 24 * v7) + 8 * v9);
          v12 = (double *)((char *)__b[0] + __len - 8);
          v13 = a2;
          while (--v13 >= 1)
          {
            v14 = *v12--;
            if (v11 >= v14)
              goto LABEL_15;
          }
          v13 = v6 & (v6 >> 31);
LABEL_15:
          if (v13 < v6)
          {
            v15 = a2 - 2;
            if ((int)v8 > v13)
            {
              do
              {
                v10[v15] = v10[v15 - 1];
                --v15;
              }
              while (v15 > v13);
            }
            *(double *)&v10[v13] = v11;
          }
        }
        ++v9;
      }
      while (v9 != v5);
      v16 = __b[0];
      *((_QWORD *)*a3 + v7) = *((_QWORD *)__b[0] + v8);
      __b[1] = v16;
      operator delete(v16);
      ++v7;
    }
    while (v7 != v5);
  }
}

void sub_1001E04BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  void *v12;

  v12 = *(void **)a11;
  if (*(_QWORD *)a11)
  {
    *(_QWORD *)(a11 + 8) = v12;
    operator delete(v12);
  }
  _Unwind_Resume(exception_object);
}

void hdbscanStar::hdbscanAlgorithm::constructMst(_QWORD *a1@<X0>, uint64_t *a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  char v4;
  unint64_t v7;
  int v8;
  std::vector<int>::size_type v9;
  uint64_t v10;
  int v11;
  int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  std::vector<int>::pointer begin;
  std::vector<int>::pointer v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  char *v31;
  char v33;
  std::vector<int>::size_type __n;
  uint64_t v35;
  void *__p;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  std::vector<int> v45;
  void *__b;
  _BYTE *v47;
  std::vector<int> v48;
  void *v49[4];

  v4 = a3;
  v7 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a1[1] - *a1) >> 3);
  if (a3)
    v8 = -1431655765 * ((uint64_t)(a1[1] - *a1) >> 3);
  else
    v8 = 0;
  memset(v49, 0, 24);
  v9 = (int)v7 - 1 + v8;
  std::vector<int>::vector(&v48, v9);
  std::vector<double>::vector(&__b, v9);
  if ((int)v7 >= 2)
    memset_pattern16(__b, &unk_10029F660, 8 * (v7 - 1));
  __n = v9;
  v35 = (v7 - 1);
  v33 = v4;
  bitSet::set((bitSet *)v49, v7 - 1);
  if ((int)v7 >= 2)
  {
    v10 = v7;
    v11 = 1;
    v12 = v7 - 1;
    do
    {
      v13 = v7;
      v14 = 0;
      v15 = v12;
      v16 = v12;
      v12 = -1;
      v17 = 1.79769313e308;
      do
      {
        if (v15 != v14 && (bitSet::get((bitSet *)v49, v14) & 1) == 0)
        {
          v18 = *(double *)(*(_QWORD *)(*a1 + 24 * (int)v16) + 8 * v14);
          if (*(double *)(*a2 + 8 * v16) > v18)
            v18 = *(double *)(*a2 + 8 * v16);
          v19 = *(double *)(*a2 + 8 * v14);
          if (v19 <= v18)
            v19 = v18;
          v20 = *((double *)__b + v14);
          if (v19 < v20)
          {
            *((double *)__b + v14) = v19;
            v48.__begin_[v14] = v15;
            v20 = v19;
          }
          if (v20 <= v17)
          {
            v12 = v14;
            v17 = v20;
          }
        }
        ++v14;
      }
      while (v10 != v14);
      bitSet::set((bitSet *)v49, v12);
      ++v11;
      v7 = v13;
    }
    while (v11 != (_DWORD)v13);
  }
  std::vector<int>::vector(&v45, __n);
  if ((int)v7 >= 2)
  {
    v21 = 0;
    begin = v45.__begin_;
    do
    {
      begin[v21] = v21;
      ++v21;
    }
    while (v35 != v21);
  }
  if ((v33 & 1) != 0)
  {
    v23 = v48.__begin_;
    if (2 * (int)v7 > (int)v7)
    {
      v24 = 0;
      v25 = 2 * v7 - 1;
      v26 = *a2;
      if (v25 <= (int)v7)
        v25 = v7;
      v27 = v25;
      v28 = 4 * (int)v7 - 4;
      v29 = (char *)v45.__begin_ + v28;
      v30 = (char *)v48.__begin_ + v28;
      v31 = (char *)__b + 8 * (int)v7 - 8;
      do
      {
        *(_DWORD *)&v30[4 * v24] = v24;
        *(_DWORD *)&v29[4 * v24] = v24;
        *(_QWORD *)&v31[8 * v24] = *(_QWORD *)(v26 + 8 * v24);
        ++v24;
      }
      while (v27 - (int)v7 + 1 != v24);
    }
  }
  else
  {
    v23 = v48.__begin_;
  }
  v42 = 0;
  v43 = 0;
  v44 = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&v42, v23, (uint64_t)v48.__end_, v48.__end_ - v23);
  v39 = 0;
  v40 = 0;
  v41 = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&v39, v45.__begin_, (uint64_t)v45.__end_, v45.__end_ - v45.__begin_);
  __p = 0;
  v37 = 0;
  v38 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&__p, __b, (uint64_t)v47, (v47 - (_BYTE *)__b) >> 3);
  undirectedGraph::undirectedGraph(a4, v7, (uint64_t)&v42, (uint64_t)&v39, (uint64_t)&__p);
  if (__p)
  {
    v37 = __p;
    operator delete(__p);
  }
  if (v39)
  {
    v40 = v39;
    operator delete(v39);
  }
  if (v42)
  {
    v43 = v42;
    operator delete(v42);
  }
  if (v45.__begin_)
  {
    v45.__end_ = v45.__begin_;
    operator delete(v45.__begin_);
  }
  if (__b)
  {
    v47 = __b;
    operator delete(__b);
  }
  if (v48.__begin_)
  {
    v48.__end_ = v48.__begin_;
    operator delete(v48.__begin_);
  }
  if (v49[0])
    operator delete(v49[0]);
}

void sub_1001E080C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29)
{
  uint64_t v29;
  void *v31;

  if (__p)
    operator delete(__p);
  if (a16)
    operator delete(a16);
  if (a19)
    operator delete(a19);
  if (a22)
    operator delete(a22);
  if (a25)
    operator delete(a25);
  if (a28)
    operator delete(a28);
  v31 = *(void **)(v29 - 128);
  if (v31)
    operator delete(v31);
  _Unwind_Resume(exception_object);
}

void hdbscanStar::hdbscanAlgorithm::computeHierarchyAndClusterTree(undirectedGraph *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char **a7, cluster_factory *a8)
{
  int NumVertices;
  int v10;
  std::vector<int>::pointer begin;
  unint64_t v12;
  std::vector<int>::pointer v13;
  unint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char **v27;
  std::vector<int> v30;
  std::vector<int> v31;

  undirectedGraph::getNumEdges(a1);
  NumVertices = undirectedGraph::getNumVertices(a1);
  std::vector<int>::vector(&v31, NumVertices);
  v10 = undirectedGraph::getNumVertices(a1);
  std::vector<int>::vector(&v30, v10);
  begin = v30.__begin_;
  if (v30.__end_ != v30.__begin_)
  {
    v12 = v30.__end_ - v30.__begin_;
    v13 = v31.__begin_;
    if (v12 <= 1)
      v12 = 1;
    do
    {
      *begin++ = 1;
      *v13++ = 1;
      --v12;
    }
    while (v12);
  }
  v14 = (unint64_t)a7[2];
  v15 = a7[1];
  if ((unint64_t)v15 >= v14)
  {
    v17 = (v15 - *a7) >> 3;
    if ((unint64_t)(v17 + 1) >> 61)
      std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]();
    v18 = v14 - (_QWORD)*a7;
    v19 = v18 >> 2;
    if (v18 >> 2 <= (unint64_t)(v17 + 1))
      v19 = v17 + 1;
    if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8)
      v20 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v20 = v19;
    if (v20)
      v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a7 + 2), v20);
    else
      v21 = 0;
    v22 = &v21[8 * v17];
    v23 = &v21[8 * v20];
    *(_QWORD *)v22 = 0;
    v16 = v22 + 8;
    v25 = *a7;
    v24 = a7[1];
    if (v24 == *a7)
    {
      v27 = a7;
    }
    else
    {
      do
      {
        v26 = *((_QWORD *)v24 - 1);
        v24 -= 8;
        *((_QWORD *)v22 - 1) = v26;
        v22 -= 8;
      }
      while (v24 != v25);
      v27 = a7;
      v24 = *a7;
    }
    *v27 = v22;
    v27[1] = v16;
    v27[2] = v23;
    if (v24)
      operator delete(v24);
  }
  else
  {
    *(_QWORD *)v15 = 0;
    v16 = v15 + 8;
  }
  a7[1] = v16;
  undirectedGraph::getNumVertices(a1);
  cluster_factory::createNewCluster(a8, 1, 0, NAN);
}

void sub_1001E1A18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,void *__p,uint64_t a40)
{
  uint64_t v40;
  void *v42;
  void *v43;
  void *v44;

  v42 = *(void **)(v40 - 248);
  if (v42)
  {
    *(_QWORD *)(v40 - 240) = v42;
    operator delete(v42);
  }
  std::__tree<int>::destroy(v40 - 224, *(_QWORD **)(v40 - 216));
  std::__tree<int>::destroy(v40 - 200, *(_QWORD **)(v40 - 192));
  std::__tree<int>::destroy(v40 - 176, *(_QWORD **)(v40 - 168));
  v43 = *(void **)(v40 - 152);
  if (v43)
  {
    *(_QWORD *)(v40 - 144) = v43;
    operator delete(v43);
  }
  v44 = *(void **)(v40 - 128);
  if (v44)
  {
    *(_QWORD *)(v40 - 120) = v44;
    operator delete(v44);
  }
  _Unwind_Resume(a1);
}

void hdbscanStar::hdbscanAlgorithm::calculateNumConstraintsSatisfied(_QWORD *a1, _QWORD *a2, uint64_t **a3, _QWORD *a4)
{
  uint64_t *v4;
  uint64_t *v5;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v11;
  _DWORD *v12;
  __int128 *v13;
  _DWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  BOOL v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  unint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  int PointA;
  unint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  int PointB;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  _QWORD *v53;
  uint64_t *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  _QWORD *v60;
  void *__p;
  void *v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  int v66;
  uint64_t v67;
  int v68;
  _DWORD *v69;
  unint64_t v70;
  unint64_t v71;

  v5 = *a3;
  v4 = a3[1];
  if (v4 != *a3)
  {
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v9 = a1 + 1;
    v8 = (_QWORD *)*a1;
    if ((_QWORD *)*a1 == a1 + 1)
    {
      v11 = 0;
    }
    else
    {
      v11 = 0;
      v12 = 0;
      do
      {
        v13 = *(__int128 **)(*(_QWORD *)(*a2 + 8 * *((int *)v8 + 7)) + 104);
        if (v13)
        {
          v14 = v69;
          if (v69 != v12)
          {
            while (!cluster::operator==(v14, v13))
            {
              v14 += 34;
              if (v14 == v12)
                goto LABEL_10;
            }
            v12 = v14;
LABEL_10:
            v11 = v70;
          }
          if (v12 == (_DWORD *)v11)
          {
            if (v11 >= v71)
            {
              v11 = std::vector<cluster>::__push_back_slow_path<cluster const&>((uint64_t *)&v69, v13);
            }
            else
            {
              std::construct_at[abi:ne180100]<cluster,cluster const&,cluster*>(v11, v13);
              v11 += 136;
            }
            v70 = v11;
          }
          v12 = (_DWORD *)v11;
        }
        v15 = (_QWORD *)v8[1];
        if (v15)
        {
          do
          {
            v16 = v15;
            v15 = (_QWORD *)*v15;
          }
          while (v15);
        }
        else
        {
          do
          {
            v16 = (_QWORD *)v8[2];
            v24 = *v16 == (_QWORD)v8;
            v8 = v16;
          }
          while (!v24);
        }
        v8 = v16;
      }
      while (v16 != v9);
      v5 = *a3;
      v4 = a3[1];
    }
    if (v5 != v4)
    {
      v55 = v4;
      v53 = a2;
      v17 = a1;
      do
      {
        v18 = *v5;
        v68 = *((_DWORD *)v5 + 2);
        v67 = v18;
        v19 = *(int *)(*a4 + 4 * (int)hdbscanConstraint::getPointA((hdbscanConstraint *)&v67));
        v20 = *(int *)(*a4 + 4 * (int)hdbscanConstraint::getPointB((hdbscanConstraint *)&v67));
        if (hdbscanConstraint::getConstraintType((hdbscanConstraint *)&v67) || (_DWORD)v19 != (_DWORD)v20)
        {
          if (hdbscanConstraint::getConstraintType((hdbscanConstraint *)&v67) == 1)
          {
            v24 = (_DWORD)v19 && (_DWORD)v19 == (_DWORD)v20;
            if (!v24)
            {
              if ((_DWORD)v19)
              {
                v25 = (_QWORD *)*v17;
                if ((_QWORD *)*v17 != v9)
                {
                  while (*((_DWORD *)v25 + 7) != (_DWORD)v19)
                  {
                    v26 = (_QWORD *)v25[1];
                    if (v26)
                    {
                      do
                      {
                        v27 = v26;
                        v26 = (_QWORD *)*v26;
                      }
                      while (v26);
                    }
                    else
                    {
                      do
                      {
                        v27 = (_QWORD *)v25[2];
                        v24 = *v27 == (_QWORD)v25;
                        v25 = v27;
                      }
                      while (!v24);
                    }
                    v25 = v27;
                    if (v27 == v9)
                      goto LABEL_57;
                  }
                  if (v25 != v9)
                    cluster::addConstraintsSatisfied(*(_QWORD *)(*v53 + 8 * v19), 1);
                }
              }
LABEL_57:
              if ((_DWORD)v20)
              {
                v28 = (_QWORD *)*v17;
                if ((_QWORD *)*v17 != v9)
                {
                  while (*((_DWORD *)v28 + 7) != (_DWORD)v19)
                  {
                    v29 = (_QWORD *)v28[1];
                    if (v29)
                    {
                      do
                      {
                        v30 = v29;
                        v29 = (_QWORD *)*v29;
                      }
                      while (v29);
                    }
                    else
                    {
                      do
                      {
                        v30 = (_QWORD *)v28[2];
                        v24 = *v30 == (_QWORD)v28;
                        v28 = v30;
                      }
                      while (!v24);
                    }
                    v28 = v30;
                    if (v30 == v9)
                      goto LABEL_69;
                  }
                  if (v28 != v9)
                    cluster::addConstraintsSatisfied(*(_QWORD *)(*v53 + 8 * v20), 1);
                }
              }
LABEL_69:
              if (!(_DWORD)v19)
              {
                v31 = v70;
                if (v69 != (_DWORD *)v70)
                {
                  v32 = (uint64_t)(v69 + 12);
                  while (1)
                  {
                    v33 = *(_OWORD *)(v32 - 48);
                    v34 = *(_OWORD *)(v32 - 16);
                    v57 = *(_OWORD *)(v32 - 32);
                    v58 = v34;
                    v56 = v33;
                    std::set<int>::set[abi:ne180100](&v59, v32);
                    v35 = v32 - 48;
                    __p = 0;
                    v62 = 0;
                    v63 = 0;
                    std::vector<cluster *>::__init_with_size[abi:ne180100]<cluster **,cluster **>(&__p, *(const void **)(v32 + 24), *(_QWORD *)(v32 + 32), (uint64_t)(*(_QWORD *)(v32 + 32) - *(_QWORD *)(v32 + 24)) >> 3);
                    v36 = *(_OWORD *)(v32 + 48);
                    v37 = *(_OWORD *)(v32 + 64);
                    v66 = *(_DWORD *)(v32 + 80);
                    v64 = v36;
                    v65 = v37;
                    PointA = hdbscanConstraint::getPointA((hdbscanConstraint *)&v67);
                    if (cluster::virtualChildClusterConstraintsPoint((cluster *)&v56, PointA))
                      break;
                    if (__p)
                    {
                      v62 = __p;
                      operator delete(__p);
                    }
                    std::__tree<int>::destroy((uint64_t)&v59, v60);
                    v32 += 136;
                    if (v35 + 136 == v31)
                      goto LABEL_70;
                  }
                  cluster::addVirtualChildConstraintsSatisfied((uint64_t)&v56, 1);
                  if (__p)
                  {
                    v62 = __p;
                    operator delete(__p);
                  }
                  std::__tree<int>::destroy((uint64_t)&v59, v60);
                }
              }
LABEL_70:
              v17 = a1;
              if (!(_DWORD)v20)
              {
                v39 = v70;
                if (v69 != (_DWORD *)v70)
                {
                  v40 = (uint64_t)(v69 + 12);
                  while (1)
                  {
                    v41 = *(_OWORD *)(v40 - 48);
                    v42 = *(_OWORD *)(v40 - 16);
                    v57 = *(_OWORD *)(v40 - 32);
                    v58 = v42;
                    v56 = v41;
                    std::set<int>::set[abi:ne180100](&v59, v40);
                    v43 = v40 - 48;
                    __p = 0;
                    v62 = 0;
                    v63 = 0;
                    std::vector<cluster *>::__init_with_size[abi:ne180100]<cluster **,cluster **>(&__p, *(const void **)(v40 + 24), *(_QWORD *)(v40 + 32), (uint64_t)(*(_QWORD *)(v40 + 32) - *(_QWORD *)(v40 + 24)) >> 3);
                    v44 = *(_OWORD *)(v40 + 48);
                    v45 = *(_OWORD *)(v40 + 64);
                    v66 = *(_DWORD *)(v40 + 80);
                    v64 = v44;
                    v65 = v45;
                    PointB = hdbscanConstraint::getPointB((hdbscanConstraint *)&v67);
                    if (cluster::virtualChildClusterConstraintsPoint((cluster *)&v56, PointB))
                      break;
                    if (__p)
                    {
                      v62 = __p;
                      operator delete(__p);
                    }
                    std::__tree<int>::destroy((uint64_t)&v59, v60);
                    v40 += 136;
                    if (v43 + 136 == v39)
                      goto LABEL_71;
                  }
                  cluster::addVirtualChildConstraintsSatisfied((uint64_t)&v56, 1);
                  if (__p)
                  {
                    v62 = __p;
                    operator delete(__p);
                  }
                  std::__tree<int>::destroy((uint64_t)&v59, v60);
                }
              }
            }
          }
        }
        else
        {
          v21 = (_QWORD *)*v17;
          if ((_QWORD *)*v17 != v9)
          {
            while (*((_DWORD *)v21 + 7) != (_DWORD)v19)
            {
              v22 = (_QWORD *)v21[1];
              if (v22)
              {
                do
                {
                  v23 = v22;
                  v22 = (_QWORD *)*v22;
                }
                while (v22);
              }
              else
              {
                do
                {
                  v23 = (_QWORD *)v21[2];
                  v24 = *v23 == (_QWORD)v21;
                  v21 = v23;
                }
                while (!v24);
              }
              v21 = v23;
              if (v23 == v9)
                goto LABEL_71;
            }
            if (v21 != v9)
              cluster::addConstraintsSatisfied(*(_QWORD *)(*v53 + 8 * v19), 2);
          }
        }
LABEL_71:
        v5 = (uint64_t *)((char *)v5 + 12);
      }
      while (v5 != v55);
      v11 = v70;
    }
    if (v69 != (_DWORD *)v11)
    {
      v47 = (uint64_t)(v69 + 12);
      do
      {
        v48 = *(_OWORD *)(v47 - 48);
        v49 = *(_OWORD *)(v47 - 16);
        v57 = *(_OWORD *)(v47 - 32);
        v58 = v49;
        v56 = v48;
        std::set<int>::set[abi:ne180100](&v59, v47);
        v50 = v47 - 48;
        __p = 0;
        v62 = 0;
        v63 = 0;
        std::vector<cluster *>::__init_with_size[abi:ne180100]<cluster **,cluster **>(&__p, *(const void **)(v47 + 24), *(_QWORD *)(v47 + 32), (uint64_t)(*(_QWORD *)(v47 + 32) - *(_QWORD *)(v47 + 24)) >> 3);
        v51 = *(_OWORD *)(v47 + 48);
        v52 = *(_OWORD *)(v47 + 64);
        v66 = *(_DWORD *)(v47 + 80);
        v64 = v51;
        v65 = v52;
        cluster::releaseVirtualChildCluster((cluster *)&v56);
        if (__p)
        {
          v62 = __p;
          operator delete(__p);
        }
        std::__tree<int>::destroy((uint64_t)&v59, v60);
        v47 += 136;
      }
      while (v50 + 136 != v11);
    }
    *(_QWORD *)&v56 = &v69;
    std::vector<cluster>::__destroy_vector::operator()[abi:ne180100]((void ***)&v56);
  }
}

void sub_1001E20F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void **a13)
{
  uint64_t v13;

  cluster::~cluster((cluster *)&a13);
  a13 = (void **)(v13 - 112);
  std::vector<cluster>::__destroy_vector::operator()[abi:ne180100](&a13);
  _Unwind_Resume(a1);
}

uint64_t hdbscanStar::hdbscanAlgorithm::createNewCluster(uint64_t a1, uint64_t *a2, cluster *this, int a4, cluster_factory *a5, double a6)
{
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  BOOL v15;
  uint64_t v17[3];

  v11 = *(_QWORD **)a1;
  if (*(_QWORD *)a1 != a1 + 8)
  {
    v12 = *a2;
    do
    {
      *(_DWORD *)(v12 + 4 * *((int *)v11 + 7)) = a4;
      v13 = (_QWORD *)v11[1];
      if (v13)
      {
        do
        {
          v14 = v13;
          v13 = (_QWORD *)*v13;
        }
        while (v13);
      }
      else
      {
        do
        {
          v14 = (_QWORD *)v11[2];
          v15 = *v14 == (_QWORD)v11;
          v11 = v14;
        }
        while (!v15);
      }
      v11 = v14;
    }
    while (v14 != (_QWORD *)(a1 + 8));
  }
  cluster::detachPoints((uint64_t)this, *(_DWORD *)(a1 + 16), a6);
  if (a4)
    cluster_factory::createNewCluster(a5, a4, this, a6);
  std::set<int>::set[abi:ne180100](v17, a1);
  cluster::addPointsToVirtualChildCluster((uint64_t **)this, v17);
  std::__tree<int>::destroy((uint64_t)v17, (_QWORD *)v17[1]);
  return 0;
}

void sub_1001E2280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, _QWORD *a11)
{
  std::__tree<int>::destroy((uint64_t)&a10, a11);
  _Unwind_Resume(a1);
}

void hdbscanStar::hdbscanAlgorithm::findProminentClusters(uint64_t a1@<X0>, _QWORD *a2@<X1>, int a3@<W2>, std::vector<int> *a4@<X8>)
{
  uint64_t v7;
  char *v8;
  int v9;
  _QWORD *i;
  int v11;
  uint64_t **v12;
  uint64_t **v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t **v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t *v27;
  char *v28;
  int v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  int v33;
  uint64_t *v34;
  int v35;
  uint64_t v36;
  _DWORD *v37;
  unint64_t v38;
  __int32 *v39;
  __int32 v40;
  __int32 *v41;
  __int32 *v42;
  _DWORD *v43;
  _DWORD *v44;
  uint64_t v45;
  __int32 *__s;
  __int32 *v47;
  uint64_t v48;
  uint64_t *v49;
  _QWORD *v50;
  uint64_t v51;
  void *__p;
  char *v53;
  uint64_t v54;

  v7 = *(_QWORD *)(*(_QWORD *)a1 + 8);
  v53 = 0;
  v54 = 0;
  __p = 0;
  std::vector<cluster *>::__init_with_size[abi:ne180100]<cluster **,cluster **>(&__p, *(const void **)(v7 + 72), *(_QWORD *)(v7 + 80), (uint64_t)(*(_QWORD *)(v7 + 80) - *(_QWORD *)(v7 + 72)) >> 3);
  std::vector<int>::vector(a4, a3);
  v50 = 0;
  v51 = 0;
  v49 = (uint64_t *)&v50;
  v8 = (char *)__p;
  if (__p != v53)
  {
    do
    {
      v9 = *(_DWORD *)(*(_QWORD *)v8 + 128);
      LODWORD(v43) = v9;
      for (i = v50; i; i = (_QWORD *)*i)
      {
        v11 = *((_DWORD *)i + 8);
        if (v9 >= v11)
        {
          if (v11 >= v9)
          {
            __s = (__int32 *)&v43;
            v24 = std::__tree<std::__value_type<int,std::vector<int>>,std::__map_value_compare<int,std::__value_type<int,std::vector<int>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<int>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&v49, (int *)&v43, (uint64_t)&std::piecewise_construct, &__s);
            v13 = v24;
            v14 = *(_QWORD *)v8;
            v15 = v24[6];
            v25 = (uint64_t)(v24 + 7);
            v26 = v24[7];
            if (v15 < v26)
            {
LABEL_17:
              *(_DWORD *)v15 = *(_DWORD *)(v14 + 124);
              v27 = (uint64_t *)((char *)v15 + 4);
              goto LABEL_36;
            }
            v18 = v24[5];
            v30 = ((char *)v15 - (char *)v18) >> 2;
            if (!((unint64_t)(v30 + 1) >> 62))
            {
              v31 = (char *)v26 - (char *)v18;
              v32 = ((char *)v26 - (char *)v18) >> 1;
              if (v32 <= v30 + 1)
                v32 = v30 + 1;
              if (v31 >= 0x7FFFFFFFFFFFFFFCLL)
                v22 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v22 = v32;
              if (v22)
              {
                v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v25, v22);
                v18 = v13[5];
                v15 = v13[6];
              }
              else
              {
                v23 = 0;
              }
              v28 = &v23[4 * v30];
              *(_DWORD *)v28 = *(_DWORD *)(v14 + 124);
              v27 = (uint64_t *)(v28 + 4);
              while (v15 != v18)
              {
                v33 = *((_DWORD *)v15 - 1);
                v15 = (uint64_t *)((char *)v15 - 4);
                *((_DWORD *)v28 - 1) = v33;
                v28 -= 4;
              }
              goto LABEL_34;
            }
LABEL_54:
            std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]();
          }
          ++i;
        }
      }
      __s = (__int32 *)&v43;
      v12 = std::__tree<std::__value_type<int,std::vector<int>>,std::__map_value_compare<int,std::__value_type<int,std::vector<int>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<int>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&v49, (int *)&v43, (uint64_t)&std::piecewise_construct, &__s);
      v13 = v12;
      v14 = *(_QWORD *)v8;
      v15 = v12[6];
      v16 = (uint64_t)(v12 + 7);
      v17 = v12[7];
      if (v15 < v17)
        goto LABEL_17;
      v18 = v12[5];
      v19 = ((char *)v15 - (char *)v18) >> 2;
      if ((unint64_t)(v19 + 1) >> 62)
        goto LABEL_54;
      v20 = (char *)v17 - (char *)v18;
      v21 = ((char *)v17 - (char *)v18) >> 1;
      if (v21 <= v19 + 1)
        v21 = v19 + 1;
      if (v20 >= 0x7FFFFFFFFFFFFFFCLL)
        v22 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v22 = v21;
      if (v22)
      {
        v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v16, v22);
        v18 = v13[5];
        v15 = v13[6];
      }
      else
      {
        v23 = 0;
      }
      v28 = &v23[4 * v19];
      *(_DWORD *)v28 = *(_DWORD *)(v14 + 124);
      v27 = (uint64_t *)(v28 + 4);
      while (v15 != v18)
      {
        v29 = *((_DWORD *)v15 - 1);
        v15 = (uint64_t *)((char *)v15 - 4);
        *((_DWORD *)v28 - 1) = v29;
        v28 -= 4;
      }
LABEL_34:
      v13[5] = (uint64_t *)v28;
      v13[6] = v27;
      v13[7] = (uint64_t *)&v23[4 * v22];
      if (v18)
        operator delete(v18);
LABEL_36:
      v13[6] = v27;
      v8 += 8;
    }
    while (v8 != v53);
    while (v51)
    {
      v34 = v49;
      __s = 0;
      v47 = 0;
      v48 = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&__s, (const void *)v49[5], v49[6], (v49[6] - v49[5]) >> 2);
      v35 = *((_DWORD *)v34 + 8);
      std::__tree<std::__value_type<int,std::vector<int>>,std::__map_value_compare<int,std::__value_type<int,std::vector<int>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<int>>>>::__erase_unique<int>((uint64_t)&v49, (int *)v34 + 8);
      v36 = *a2 + 24 * v35;
      v44 = 0;
      v45 = 0;
      v43 = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&v43, *(const void **)v36, *(_QWORD *)(v36 + 8), (uint64_t)(*(_QWORD *)(v36 + 8) - *(_QWORD *)v36) >> 2);
      v37 = v44;
      if (v44 != v43)
      {
        v38 = 0;
        v39 = v47;
        v37 = v43;
        do
        {
          v40 = v37[v38];
          v41 = wmemchr(__s, v40, v39 - __s);
          if (v41)
            v42 = v41;
          else
            v42 = v39;
          v39 = v47;
          if (v42 != v47)
            a4->__begin_[v38] = v40;
          ++v38;
          v37 = v43;
        }
        while (v38 < v44 - v43);
      }
      if (v37)
      {
        v44 = v37;
        operator delete(v37);
      }
      if (__s)
      {
        v47 = __s;
        operator delete(__s);
      }
    }
  }
  std::__tree<std::__value_type<int,std::vector<int>>,std::__map_value_compare<int,std::__value_type<int,std::vector<int>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<int>>>>::destroy((uint64_t)&v49, v50);
  if (__p)
  {
    v53 = (char *)__p;
    operator delete(__p);
  }
}

void sub_1001E2614(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void hdbscanStar::hdbscanAlgorithm::findMembershipScore(_QWORD *a1@<X0>, uint64_t **a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  unint64_t v6;
  int v7;
  __int32 *v8;
  __int32 *v9;
  __int32 v10;
  __int32 *v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  int v22;
  int *v23;
  double *v24;
  unint64_t v25;
  uint64_t *v26;
  _QWORD *v27;
  uint64_t v28;
  double *v29;
  BOOL v30;
  double *v31;
  double v32;
  double *v33;
  double v34;
  double v35;
  double v36;
  unint64_t v37;
  uint64_t v38;
  double *v39;
  double v40;
  double v41;
  uint64_t v42;
  int *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v48;
  double *v49;
  void *__p;
  char *v51;
  char *v52;

  v5 = a1[1] - *a1;
  v6 = (unint64_t)v5 >> 2;
  __p = (void *)0x7FEFFFFFFFFFFFFFLL;
  std::vector<double>::vector(a3, (int)(v5 >> 2), &__p);
  if ((int)v6 >= 1)
  {
    v7 = 0;
    while (*(double *)(*a3 + 8 * v7) != 1.79769313e308)
    {
LABEL_55:
      ++v7;
LABEL_56:
      if (v7 >= (int)v6)
        return;
    }
    v8 = (__int32 *)a1[1];
    v9 = (__int32 *)(*a1 + 4 * v7);
    v10 = *v9;
    __p = 0;
    v51 = 0;
    v52 = 0;
    do
    {
      v11 = wmemchr(v9, v10, v8 - v9);
      if (v11)
        v8 = v11;
      if (v8 == (__int32 *)a1[1])
        break;
      v12 = ((unint64_t)v8 - *a1) >> 2;
      v13 = v51;
      if (v51 >= v52)
      {
        v15 = (char *)__p;
        v16 = (v51 - (_BYTE *)__p) >> 2;
        v17 = v16 + 1;
        if ((unint64_t)(v16 + 1) >> 62)
          std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]();
        v18 = v52 - (_BYTE *)__p;
        if ((v52 - (_BYTE *)__p) >> 1 > v17)
          v17 = v18 >> 1;
        if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFFCLL)
          v19 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v19 = v17;
        if (v19)
        {
          v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v52, v19);
          v15 = (char *)__p;
          v13 = v51;
        }
        else
        {
          v20 = 0;
        }
        v21 = &v20[4 * v16];
        *(_DWORD *)v21 = v12;
        v14 = v21 + 4;
        while (v13 != v15)
        {
          v22 = *((_DWORD *)v13 - 1);
          v13 -= 4;
          *((_DWORD *)v21 - 1) = v22;
          v21 -= 4;
        }
        __p = v21;
        v51 = v14;
        v52 = &v20[4 * v19];
        if (v15)
          operator delete(v15);
      }
      else
      {
        *(_DWORD *)v51 = v12;
        v14 = v13 + 4;
      }
      v51 = v14;
      v9 = v8 + 1;
      v8 = (__int32 *)a1[1];
    }
    while (v9 != v8);
    if (v10)
    {
      std::vector<double>::vector(&v48, (v51 - (_BYTE *)__p) >> 2);
      v23 = (int *)__p;
      v24 = (double *)v48;
      if (v51 != __p)
      {
        v25 = (v51 - (_BYTE *)__p) >> 2;
        v26 = *a2;
        if (v25 <= 1)
          v25 = 1;
        v27 = v48;
        do
        {
          v28 = *v26++;
          *v27++ = v28;
          --v25;
        }
        while (v25);
      }
      v29 = v24 + 1;
      v30 = v24 == v49 || v29 == v49;
      v31 = v24;
      if (!v30)
      {
        v32 = *v24;
        v31 = v24;
        v33 = v24 + 1;
        do
        {
          v34 = *v33++;
          v35 = v34;
          if (v32 < v34)
          {
            v32 = v35;
            v31 = v29;
          }
          v29 = v33;
        }
        while (v33 != v49);
      }
      if (v24 == v49)
      {
        if (!v24)
          goto LABEL_52;
      }
      else
      {
        v36 = *v31;
        v37 = v49 - v24;
        v38 = *a3;
        if (v37 <= 1)
          v37 = 1;
        v39 = v24;
        do
        {
          v40 = *v39++;
          v41 = (v36 - v40) / v36;
          v42 = *v23++;
          *(double *)(v38 + 8 * v42) = v41;
          --v37;
        }
        while (v37);
      }
      v49 = v24;
      operator delete(v24);
    }
    else
    {
      v43 = (int *)__p;
      if (v51 != __p)
      {
        v44 = (v51 - (_BYTE *)__p) >> 2;
        v45 = *a3;
        if (v44 <= 1)
          v44 = 1;
        do
        {
          v46 = *v43++;
          *(_QWORD *)(v45 + 8 * v46) = 0;
          --v44;
        }
        while (v44);
      }
      ++v7;
    }
LABEL_52:
    if (__p)
    {
      v51 = (char *)__p;
      operator delete(__p);
    }
    if (!v10)
      goto LABEL_56;
    goto LABEL_55;
  }
}

void sub_1001E2958(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  uint64_t v15;
  void *v17;

  if (__p)
    operator delete(__p);
  v17 = *(void **)v15;
  if (*(_QWORD *)v15)
  {
    *(_QWORD *)(v15 + 8) = v17;
    operator delete(v17);
  }
  _Unwind_Resume(exception_object);
}

uint64_t hdbscanStar::hdbscanAlgorithm::propagateTree(uint64_t **a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  char v4;
  _QWORD *v5;
  _QWORD **v6;
  _QWORD *v7;
  BOOL v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  __int128 v13;
  int v14;
  void *__p[3];
  uint64_t *v16;
  _QWORD *v17;
  uint64_t v18;

  v17 = 0;
  v18 = 0;
  v16 = (uint64_t *)&v17;
  memset(__p, 0, sizeof(__p));
  v1 = *a1;
  v2 = a1[1];
  if (*a1 == v2)
  {
    v4 = 0;
  }
  else
  {
    do
    {
      v3 = *v1;
      if (*v1 && !*(_BYTE *)(v3 + 120))
      {
        v14 = *(_DWORD *)(v3 + 124);
        std::__tree<std::__value_type<int,cluster *>,std::__map_value_compare<int,std::__value_type<int,cluster *>,std::less<int>,true>,std::allocator<std::__value_type<int,cluster *>>>::__erase_unique<int>((uint64_t)&v16, &v14);
        LODWORD(v13) = v14;
        *((_QWORD *)&v13 + 1) = v3;
        std::__tree<std::__value_type<int,cluster *>,std::__map_value_compare<int,std::__value_type<int,cluster *>,std::less<int>,true>,std::allocator<std::__value_type<int,cluster *>>>::__emplace_unique_key_args<int,std::pair<int const,cluster *>>(&v16, (int *)&v13, &v13);
        bitSet::set((bitSet *)__p, v14);
      }
      ++v1;
    }
    while (v1 != v2);
    if (v18)
    {
      v4 = 0;
      do
      {
        v5 = v17;
        v6 = &v17;
        if (v17)
        {
          do
          {
            v7 = v5;
            v5 = (_QWORD *)v5[1];
          }
          while (v5);
        }
        else
        {
          do
          {
            v7 = v6[2];
            v8 = *v7 == (_QWORD)v6;
            v6 = (_QWORD **)v7;
          }
          while (v8);
        }
        v9 = v7[5];
        std::__tree<std::__value_type<int,cluster *>,std::__map_value_compare<int,std::__value_type<int,cluster *>,std::less<int>,true>,std::allocator<std::__value_type<int,cluster *>>>::__erase_unique<int>((uint64_t)&v16, (int *)v7 + 8);
        cluster::propagate((cluster *)v9);
        v10 = *(double *)(v9 + 112) == INFINITY;
        v11 = *(_QWORD *)(v9 + 104);
        if (v11)
        {
          v14 = *(_DWORD *)(v11 + 124);
          if ((bitSet::get((bitSet *)__p, v14) & 1) == 0)
          {
            std::__tree<std::__value_type<int,cluster *>,std::__map_value_compare<int,std::__value_type<int,cluster *>,std::less<int>,true>,std::allocator<std::__value_type<int,cluster *>>>::__erase_unique<int>((uint64_t)&v16, &v14);
            LODWORD(v13) = v14;
            *((_QWORD *)&v13 + 1) = v11;
            std::__tree<std::__value_type<int,cluster *>,std::__map_value_compare<int,std::__value_type<int,cluster *>,std::less<int>,true>,std::allocator<std::__value_type<int,cluster *>>>::__emplace_unique_key_args<int,std::pair<int const,cluster *>>(&v16, (int *)&v13, &v13);
            bitSet::set((bitSet *)__p, v14);
          }
        }
        v4 |= v10;
      }
      while (v18);
    }
    else
    {
      v4 = 0;
    }
    if (__p[0])
      operator delete(__p[0]);
  }
  std::__tree<int>::destroy((uint64_t)&v16, v17);
  return v4 & 1;
}

void sub_1001E2B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, char a16, _QWORD *a17)
{
  if (__p)
    operator delete(__p);
  std::__tree<int>::destroy((uint64_t)&a16, a17);
  _Unwind_Resume(a1);
}

void hdbscanStar::hdbscanAlgorithm::calculateOutlierScores(_QWORD *a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X2>, _QWORD *a4@<X3>, unint64_t *a5@<X8>)
{
  unint64_t v6;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  __int128 v17;
  __n128 *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  char *v24;
  __int128 v25;
  char *v26;
  char *v27;
  char *v28;
  __int128 v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;

  v6 = a2[1] - *a2;
  a5[1] = 0;
  a5[2] = 0;
  *a5 = 0;
  if ((int)(v6 >> 3) < 1)
  {
    v18 = 0;
    v30 = 0;
  }
  else
  {
    v11 = 0;
    v12 = (v6 >> 3);
    do
    {
      v13 = *(double *)(*a2 + 8 * v11);
      if (v13 == 0.0)
        v14 = 0.0;
      else
        v14 = 1.0 - *(double *)(*(_QWORD *)(*a1 + 8 * *(int *)(*a3 + 4 * v11)) + 96) / v13;
      outlierScore::outlierScore((outlierScore *)&v33, v14, *(double *)(*a4 + 8 * v11), v11);
      v16 = a5[1];
      v15 = a5[2];
      if (v16 >= v15)
      {
        v19 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v16 - *a5) >> 3);
        v20 = v19 + 1;
        if (v19 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]();
        v21 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v15 - *a5) >> 3);
        if (2 * v21 > v20)
          v20 = 2 * v21;
        if (v21 >= 0x555555555555555)
          v22 = 0xAAAAAAAAAAAAAAALL;
        else
          v22 = v20;
        if (v22)
          v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<double>>>((uint64_t)(a5 + 2), v22);
        else
          v23 = 0;
        v24 = &v23[24 * v19];
        v25 = v33;
        *((_QWORD *)v24 + 2) = v34;
        *(_OWORD *)v24 = v25;
        v27 = (char *)*a5;
        v26 = (char *)a5[1];
        v28 = v24;
        if (v26 != (char *)*a5)
        {
          do
          {
            v29 = *(_OWORD *)(v26 - 24);
            *((_DWORD *)v28 - 2) = *((_DWORD *)v26 - 2);
            *(_OWORD *)(v28 - 24) = v29;
            v28 -= 24;
            v26 -= 24;
          }
          while (v26 != v27);
          v26 = (char *)*a5;
        }
        v18 = (__n128 *)(v24 + 24);
        *a5 = (unint64_t)v28;
        a5[1] = (unint64_t)(v24 + 24);
        a5[2] = (unint64_t)&v23[24 * v22];
        if (v26)
          operator delete(v26);
      }
      else
      {
        v17 = v33;
        *(_QWORD *)(v16 + 16) = v34;
        *(_OWORD *)v16 = v17;
        v18 = (__n128 *)(v16 + 24);
      }
      a5[1] = (unint64_t)v18;
      ++v11;
    }
    while (v11 != v12);
    v30 = *a5;
  }
  v31 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v18 - v30) >> 3));
  if (v18 == (__n128 *)v30)
    v32 = 0;
  else
    v32 = v31;
  std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *,false>(v30, v18, (uint64_t)&v33, v32, 1);
}

void sub_1001E2D90(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void cluster::~cluster(cluster *this)
{
  void *v2;

  v2 = (void *)*((_QWORD *)this + 9);
  if (v2)
  {
    *((_QWORD *)this + 10) = v2;
    operator delete(v2);
  }
  std::__tree<int>::destroy((uint64_t)this + 48, *((_QWORD **)this + 7));
}

_QWORD *std::vector<double>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<double>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_1001E2E48(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<int>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1001E2EC0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t undirectedGraph::undirectedGraph(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v9;
  char *v10;
  char *v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _DWORD *v18;
  _DWORD **v19;
  unint64_t v20;
  _QWORD *v21;
  _DWORD *v22;
  _DWORD *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  int v30;
  uint64_t v31;
  int v32;
  int v33;
  uint64_t v34;
  _DWORD *v35;
  _DWORD **v36;
  unint64_t v37;
  _QWORD *v38;
  _DWORD *v39;
  _DWORD *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  char *v46;
  int v47;

  *(_OWORD *)(a1 + 8) = 0u;
  v9 = (uint64_t *)(a1 + 8);
  *(_OWORD *)(a1 + 56) = 0u;
  v10 = (char *)(a1 + 56);
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  v11 = (char *)(a1 + 32);
  v12 = (uint64_t *)(a1 + 80);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_DWORD *)a1 = a2;
  if (a1 + 8 != a3)
    std::vector<int>::__assign_with_size[abi:ne180100]<int *,int *>((char *)(a1 + 8), *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 2);
  if (v11 != (char *)a4)
    std::vector<int>::__assign_with_size[abi:ne180100]<int *,int *>(v11, *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 2);
  if (v10 != (char *)a5)
    std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(v10, *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 3);
  std::vector<std::vector<int>>::resize(v12, a2);
  v13 = *(_QWORD *)(a1 + 64) - *(_QWORD *)(a1 + 56);
  if ((int)(v13 >> 3) >= 1)
  {
    v14 = 0;
    v15 = (v13 >> 3);
    do
    {
      v16 = *v12 + 24 * *(int *)(*v9 + 4 * v14);
      v17 = *(_QWORD *)v11;
      v19 = (_DWORD **)(v16 + 8);
      v18 = *(_DWORD **)(v16 + 8);
      v21 = (_QWORD *)(v16 + 16);
      v20 = *(_QWORD *)(v16 + 16);
      if ((unint64_t)v18 >= v20)
      {
        v23 = *(_DWORD **)v16;
        v24 = ((uint64_t)v18 - *(_QWORD *)v16) >> 2;
        v25 = v24 + 1;
        if ((unint64_t)(v24 + 1) >> 62)
          goto LABEL_45;
        v26 = v20 - (_QWORD)v23;
        if (v26 >> 1 > v25)
          v25 = v26 >> 1;
        if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL)
          v27 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v27 = v25;
        if (v27)
        {
          v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v21, v27);
          v18 = *v19;
          v23 = *(_DWORD **)v16;
        }
        else
        {
          v28 = 0;
        }
        v29 = &v28[4 * v24];
        *(_DWORD *)v29 = *(_DWORD *)(v17 + 4 * v14);
        v22 = v29 + 4;
        while (v18 != v23)
        {
          v30 = *--v18;
          *((_DWORD *)v29 - 1) = v30;
          v29 -= 4;
        }
        *(_QWORD *)v16 = v29;
        *v19 = v22;
        *v21 = &v28[4 * v27];
        if (v23)
          operator delete(v23);
      }
      else
      {
        *v18 = *(_DWORD *)(v17 + 4 * v14);
        v22 = v18 + 1;
      }
      *v19 = v22;
      v31 = *v9;
      v32 = *(_DWORD *)(*v9 + 4 * v14);
      v33 = *(_DWORD *)(*(_QWORD *)v11 + 4 * v14);
      if (v32 != v33)
      {
        v34 = *v12 + 24 * v33;
        v36 = (_DWORD **)(v34 + 8);
        v35 = *(_DWORD **)(v34 + 8);
        v38 = (_QWORD *)(v34 + 16);
        v37 = *(_QWORD *)(v34 + 16);
        if ((unint64_t)v35 >= v37)
        {
          v40 = *(_DWORD **)v34;
          v41 = ((uint64_t)v35 - *(_QWORD *)v34) >> 2;
          v42 = v41 + 1;
          if ((unint64_t)(v41 + 1) >> 62)
LABEL_45:
            std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]();
          v43 = v37 - (_QWORD)v40;
          if (v43 >> 1 > v42)
            v42 = v43 >> 1;
          if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFFCLL)
            v44 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v44 = v42;
          if (v44)
          {
            v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v38, v44);
            v35 = *v36;
            v40 = *(_DWORD **)v34;
            v32 = *(_DWORD *)(v31 + 4 * v14);
          }
          else
          {
            v45 = 0;
          }
          v46 = &v45[4 * v41];
          *(_DWORD *)v46 = v32;
          v39 = v46 + 4;
          while (v35 != v40)
          {
            v47 = *--v35;
            *((_DWORD *)v46 - 1) = v47;
            v46 -= 4;
          }
          *(_QWORD *)v34 = v46;
          *v36 = v39;
          *v38 = &v45[4 * v44];
          if (v40)
            operator delete(v40);
        }
        else
        {
          *v35 = v32;
          v39 = v35 + 1;
        }
        *v36 = v39;
      }
      ++v14;
    }
    while (v14 != v15);
  }
  return a1;
}

void sub_1001E31B4(_Unwind_Exception *a1, uint64_t a2, void **a3, _QWORD *a4, ...)
{
  void **v4;
  void **v5;
  void *v7;
  void *v8;
  void *v9;
  va_list va;

  va_start(va, a4);
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  v7 = *a3;
  if (*a3)
  {
    a4[8] = v7;
    operator delete(v7);
  }
  v8 = *v5;
  if (*v5)
  {
    a4[5] = v8;
    operator delete(v8);
  }
  v9 = *v4;
  if (*v4)
  {
    a4[2] = v9;
    operator delete(v9);
  }
  _Unwind_Resume(a1);
}

void std::vector<std::vector<int>>::resize(uint64_t *a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  BOOL v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a1[1];
  v4 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a1) >> 3);
  v5 = a2 >= v4;
  v6 = a2 - v4;
  if (v6 != 0 && v5)
  {
    std::vector<std::vector<int>>::__append(a1, v6);
  }
  else if (!v5)
  {
    v7 = *a1 + 24 * a2;
    if (v3 != v7)
    {
      v8 = a1[1];
      do
      {
        v10 = *(void **)(v8 - 24);
        v8 -= 24;
        v9 = v10;
        if (v10)
        {
          *(_QWORD *)(v3 - 16) = v9;
          operator delete(v9);
        }
        v3 = v8;
      }
      while (v8 != v7);
    }
    a1[1] = v7;
  }
}

void std::vector<std::vector<int>>::__append(uint64_t *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  size_t v13;
  size_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      v13 = 24 * ((24 * a2 - 24) / 0x18) + 24;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 3);
    v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]();
    v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 3);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v9;
    v19 = v4;
    if (v11)
      v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<double>>>(v4, v11);
    else
      v12 = 0;
    v15 = v12;
    v16 = &v12[24 * v8];
    v18 = &v12[24 * v11];
    v14 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v16, v14);
    v17 = &v16[v14];
    std::vector<std::vector<int>>::__swap_out_circular_buffer(a1, &v15);
    std::__split_buffer<std::vector<int>>::~__split_buffer((uint64_t)&v15);
  }
}

void sub_1001E33F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::vector<int>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<int>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>,std::reverse_iterator<std::vector<int>*>,std::reverse_iterator<std::vector<int>*>>((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>,std::reverse_iterator<std::vector<int>*>,std::reverse_iterator<std::vector<int>*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;
  __int128 v13;
  __int128 v14;

  v7 = a7;
  *(_QWORD *)&v14 = a6;
  *((_QWORD *)&v14 + 1) = a7;
  v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    v9 = a6;
  }
  else
  {
    do
    {
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(_QWORD *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      v7 = *((_QWORD *)&v14 + 1) - 24;
      *((_QWORD *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = *(void **)v1;
    if (*(_QWORD *)v1)
    {
      *(_QWORD *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<int>>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<std::vector<int>>::__destruct_at_end[abi:ne180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<std::vector<int>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;

  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != a2)
  {
    v5 = *(void **)(v2 - 24);
    *(_QWORD *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(_QWORD *)(v2 - 16) = v5;
      operator delete(v5);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

_QWORD *std::__list_imp<int>::clear(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  if (result[2])
  {
    v1 = result;
    result = (_QWORD *)result[1];
    v2 = *v1;
    v3 = *result;
    *(_QWORD *)(v3 + 8) = *(_QWORD *)(*v1 + 8);
    **(_QWORD **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        v4 = (_QWORD *)result[1];
        operator delete(result);
        result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

_QWORD *std::vector<std::vector<int>>::__construct_one_at_end[abi:ne180100]<std::vector<int> const&>(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  _QWORD *result;

  v3 = *(_QWORD **)(a1 + 8);
  *v3 = 0;
  v3[1] = 0;
  v3[2] = 0;
  result = std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(v3, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2);
  *(_QWORD *)(a1 + 8) = v3 + 3;
  return result;
}

void sub_1001E36CC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<int>>::__push_back_slow_path<std::vector<int> const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];
  char *v15;
  char *v16;
  uint64_t *v17;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v17 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<double>>>(v7, v9);
  else
    v10 = 0;
  v11 = &v10[24 * v4];
  v14[0] = v10;
  v14[1] = v11;
  v15 = v11;
  v16 = &v10[24 * v9];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  *((_QWORD *)v11 + 2) = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(v11, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2);
  v15 += 24;
  std::vector<std::vector<int>>::__swap_out_circular_buffer(a1, v14);
  v12 = a1[1];
  std::__split_buffer<std::vector<int>>::~__split_buffer((uint64_t)v14);
  return v12;
}

void sub_1001E37D4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::vector<int>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<cluster *>::__init_with_size[abi:ne180100]<cluster **,cluster **>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<double>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1001E3844(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<double>::vector(_QWORD *a1, unint64_t a2, _QWORD *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<double>::__vallocate[abi:ne180100](a1, a2);
    v6 = (_QWORD *)a1[1];
    v7 = &v6[a2];
    v8 = 8 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 8;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_1001E38C4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *,false>(unint64_t a1, __n128 *a2, uint64_t a3, uint64_t a4, char a5)
{
  __n128 *v9;
  __n128 *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  char v23;
  BOOL v24;
  __n128 v25;
  __int128 v26;
  __n128 v27;
  uint64_t v28;
  unint64_t v29;

LABEL_1:
  v9 = (__n128 *)((char *)a2 - 24);
  v10 = (__n128 *)a1;
LABEL_2:
  v11 = 1 - a4;
  while (2)
  {
    a1 = (unint64_t)v10;
    v12 = v11;
    v13 = (char *)a2 - (char *)v10;
    v14 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)v10) >> 3);
    switch(v14)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        if (outlierScore::operator<((uint64_t)&a2[-2].n128_i64[1], (uint64_t)v10))
        {
          v29 = v10[1].n128_u64[0];
          v27 = *v10;
          v25 = *v9;
          v10[1].n128_u32[0] = a2[-1].n128_u32[2];
          *v10 = v25;
          *v9 = v27;
          a2[-1].n128_u32[2] = v29;
        }
        return;
      case 3uLL:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>((uint64_t)v10, (uint64_t)&v10[1].n128_i64[1], (uint64_t)&a2[-2].n128_i64[1]);
        return;
      case 4uLL:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>(v10, (uint64_t)&v10[1].n128_i64[1], (uint64_t)&v10[3], (uint64_t)&a2[-2].n128_i64[1]);
        return;
      case 5uLL:
        std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>(v10, (uint64_t)&v10[1].n128_i64[1], (uint64_t)&v10[3], (uint64_t)&v10[4].n128_i64[1], (uint64_t)&a2[-2].n128_i64[1]);
        return;
      default:
        if (v13 <= 575)
        {
          if ((a5 & 1) != 0)
            std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>((uint64_t)v10, (uint64_t)a2);
          else
            std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>((uint64_t)v10, (uint64_t)a2);
          return;
        }
        if (v12 != 1)
        {
          v15 = v14 >> 1;
          v16 = (uint64_t)v10 + 24 * (v14 >> 1);
          if ((unint64_t)v13 < 0xC01)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>((uint64_t)v10 + 24 * v15, (uint64_t)v10, (uint64_t)&a2[-2].n128_i64[1]);
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>((uint64_t)v10, (uint64_t)v10 + 24 * v15, (uint64_t)&a2[-2].n128_i64[1]);
            v17 = 3 * v15;
            v18 = (uint64_t)&v10[-1] + 24 * v15 - 8;
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>((uint64_t)&v10[1].n128_i64[1], v18, (uint64_t)&a2[-3]);
            v19 = (uint64_t)&v10[3];
            v20 = (uint64_t)&v10[1].n128_i64[v17 + 1];
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>(v19, v20, (uint64_t)&a2[-5].n128_i64[1]);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>(v18, v16, v20);
            v28 = *(_QWORD *)(a1 + 16);
            v26 = *(_OWORD *)a1;
            v21 = *(_OWORD *)v16;
            *(_DWORD *)(a1 + 16) = *(_DWORD *)(v16 + 16);
            *(_OWORD *)a1 = v21;
            *(_DWORD *)(v16 + 16) = v28;
            *(_OWORD *)v16 = v26;
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          if (!outlierScore::operator<(a1 - 24, a1))
          {
            v10 = (__n128 *)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,outlierScore *,std::__less<void,void> &>(a1, (unint64_t)a2);
            goto LABEL_16;
          }
LABEL_11:
          v22 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,outlierScore *,std::__less<void,void> &>((__int128 *)a1, (unint64_t)a2);
          if ((v23 & 1) == 0)
            goto LABEL_14;
          v24 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>((__n128 *)a1, (__n128 *)v22);
          v10 = (__n128 *)(v22 + 24);
          if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>((__n128 *)(v22 + 24), a2))
          {
            v11 = v12 + 1;
            if (v24)
              continue;
LABEL_14:
            std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *,false>(a1, v22, a3, -v12, a5 & 1);
            v10 = (__n128 *)(v22 + 24);
LABEL_16:
            a5 = 0;
            a4 = -v12;
            goto LABEL_2;
          }
          a4 = -v12;
          a2 = (__n128 *)v22;
          if (v24)
            return;
          goto LABEL_1;
        }
        if (v10 != a2)
          std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *,outlierScore *>((uint64_t)v10, (uint64_t)a2, (uint64_t)a2, a3);
        return;
    }
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (result != a2)
  {
    v15 = v2;
    v16 = v3;
    v5 = result;
    v6 = result + 24;
    if (result + 24 != a2)
    {
      v7 = 0;
      v8 = result;
      do
      {
        v9 = v8;
        v8 = v6;
        result = outlierScore::operator<(v6, v9);
        if ((_DWORD)result)
        {
          v13 = *(_OWORD *)v8;
          v14 = *(_QWORD *)(v8 + 16);
          v10 = v7;
          while (1)
          {
            v11 = v5 + v10;
            *(_OWORD *)(v11 + 24) = *(_OWORD *)(v5 + v10);
            *(_DWORD *)(v11 + 40) = *(_DWORD *)(v5 + v10 + 16);
            if (!v10)
              break;
            v10 -= 24;
            result = outlierScore::operator<((uint64_t)&v13, v10 + v5);
            if ((result & 1) == 0)
            {
              v12 = v5 + v10 + 24;
              goto LABEL_10;
            }
          }
          v12 = v5;
LABEL_10:
          *(_OWORD *)v12 = v13;
          *(_DWORD *)(v12 + 16) = v14;
        }
        v6 = v8 + 24;
        v7 += 24;
      }
      while (v8 + 24 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (result != a2)
  {
    v12 = v2;
    v13 = v3;
    v5 = result;
    v6 = result + 24;
    if (result + 24 != a2)
    {
      v7 = result - 24;
      do
      {
        v8 = v5;
        v5 = v6;
        result = outlierScore::operator<(v6, v8);
        if ((_DWORD)result)
        {
          v10 = *(_OWORD *)v5;
          v11 = *(_QWORD *)(v5 + 16);
          v9 = v7;
          do
          {
            *(_OWORD *)(v9 + 48) = *(_OWORD *)(v9 + 24);
            *(_DWORD *)(v9 + 64) = *(_DWORD *)(v9 + 40);
            result = outlierScore::operator<((uint64_t)&v10, v9);
            v9 -= 24;
          }
          while ((result & 1) != 0);
          *(_OWORD *)(v9 + 48) = v10;
          *(_DWORD *)(v9 + 64) = v11;
        }
        v6 = v5 + 24;
        v7 += 24;
      }
      while (v5 + 24 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v6;
  uint64_t result;
  __int128 v8;
  uint64_t v9;
  int v10;
  __int128 v11;
  uint64_t v12;
  int v13;
  __int128 v14;
  uint64_t v15;
  int v16;
  __int128 v17;
  uint64_t v18;
  int v19;
  __int128 v20;
  uint64_t v21;
  int v22;

  v6 = outlierScore::operator<(a2, a1);
  result = outlierScore::operator<(a3, a2);
  if (!v6)
  {
    if (!(_DWORD)result)
      return result;
    v11 = *(_OWORD *)a2;
    v12 = *(_QWORD *)(a2 + 16);
    v13 = *(_DWORD *)(a3 + 16);
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *(_DWORD *)(a2 + 16) = v13;
    *(_DWORD *)(a3 + 16) = v12;
    *(_OWORD *)a3 = v11;
    if (!outlierScore::operator<(a2, a1))
      return 1;
    v14 = *(_OWORD *)a1;
    v15 = *(_QWORD *)(a1 + 16);
    v16 = *(_DWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_DWORD *)(a1 + 16) = v16;
    *(_DWORD *)(a2 + 16) = v15;
    *(_OWORD *)a2 = v14;
    return 2;
  }
  if (!(_DWORD)result)
  {
    v17 = *(_OWORD *)a1;
    v18 = *(_QWORD *)(a1 + 16);
    v19 = *(_DWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_DWORD *)(a1 + 16) = v19;
    *(_DWORD *)(a2 + 16) = v18;
    *(_OWORD *)a2 = v17;
    if (!outlierScore::operator<(a3, a2))
      return 1;
    v20 = *(_OWORD *)a2;
    v21 = *(_QWORD *)(a2 + 16);
    v22 = *(_DWORD *)(a3 + 16);
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *(_DWORD *)(a2 + 16) = v22;
    *(_DWORD *)(a3 + 16) = v21;
    *(_OWORD *)a3 = v20;
    return 2;
  }
  v8 = *(_OWORD *)a1;
  v9 = *(_QWORD *)(a1 + 16);
  v10 = *(_DWORD *)(a3 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a3;
  *(_DWORD *)(a1 + 16) = v10;
  *(_DWORD *)(a3 + 16) = v9;
  *(_OWORD *)a3 = v8;
  return 1;
}

unint64_t std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,outlierScore *,std::__less<void,void> &>(unint64_t a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v4;
  unint64_t v5;
  _BOOL4 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 *v10;
  __int128 v11;
  __int128 v12;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  v2 = a2;
  v14 = *(_OWORD *)a1;
  v15 = *(_QWORD *)(a1 + 16);
  if (outlierScore::operator<((uint64_t)&v14, a2 - 24))
  {
    v4 = a1;
    do
      v4 += 24;
    while (!outlierScore::operator<((uint64_t)&v14, v4));
  }
  else
  {
    v5 = a1 + 24;
    do
    {
      v4 = v5;
      if (v5 >= v2)
        break;
      v6 = outlierScore::operator<((uint64_t)&v14, v5);
      v5 = v4 + 24;
    }
    while (!v6);
  }
  if (v4 < v2)
  {
    do
      v2 -= 24;
    while (outlierScore::operator<((uint64_t)&v14, v2));
  }
  while (v4 < v2)
  {
    v7 = *(_OWORD *)v4;
    v17 = *(_QWORD *)(v4 + 16);
    v16 = v7;
    v8 = *(_OWORD *)v2;
    *(_DWORD *)(v4 + 16) = *(_DWORD *)(v2 + 16);
    *(_OWORD *)v4 = v8;
    v9 = v16;
    *(_DWORD *)(v2 + 16) = v17;
    *(_OWORD *)v2 = v9;
    do
      v4 += 24;
    while (!outlierScore::operator<((uint64_t)&v14, v4));
    do
      v2 -= 24;
    while (outlierScore::operator<((uint64_t)&v14, v2));
  }
  v10 = (__int128 *)(v4 - 24);
  if (v4 - 24 != a1)
  {
    v11 = *v10;
    *(_DWORD *)(a1 + 16) = *(_DWORD *)(v4 - 8);
    *(_OWORD *)a1 = v11;
  }
  v12 = v14;
  *(_DWORD *)(v4 - 8) = v15;
  *v10 = v12;
  return v4;
}

uint64_t std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,outlierScore *,std::__less<void,void> &>(__int128 *a1, unint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  __int128 v9;
  int v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v4 = 0;
  v15 = *a1;
  v16 = *((_QWORD *)a1 + 2);
  do
    v4 += 24;
  while (outlierScore::operator<((uint64_t)a1 + v4, (uint64_t)&v15));
  v5 = (unint64_t)a1 + v4;
  v6 = (uint64_t)a1 + v4 - 24;
  if (v4 == 24)
  {
    do
    {
      if (v5 >= a2)
        break;
      a2 -= 24;
    }
    while (!outlierScore::operator<(a2, (uint64_t)&v15));
  }
  else
  {
    do
      a2 -= 24;
    while (!outlierScore::operator<(a2, (uint64_t)&v15));
  }
  if (v5 < a2)
  {
    v7 = (unint64_t)a1 + v4;
    v8 = a2;
    do
    {
      v17 = *(_OWORD *)v7;
      v9 = v17;
      v18 = *(_QWORD *)(v7 + 16);
      v10 = v18;
      v11 = *(_DWORD *)(v8 + 16);
      *(_OWORD *)v7 = *(_OWORD *)v8;
      *(_DWORD *)(v7 + 16) = v11;
      *(_DWORD *)(v8 + 16) = v10;
      *(_OWORD *)v8 = v9;
      do
        v7 += 24;
      while (outlierScore::operator<(v7, (uint64_t)&v15));
      do
        v8 -= 24;
      while (!outlierScore::operator<(v8, (uint64_t)&v15));
    }
    while (v7 < v8);
    v6 = v7 - 24;
  }
  if ((__int128 *)v6 != a1)
  {
    v12 = *(_OWORD *)v6;
    *((_DWORD *)a1 + 4) = *(_DWORD *)(v6 + 16);
    *a1 = v12;
  }
  v13 = v15;
  *(_DWORD *)(v6 + 16) = v16;
  *(_OWORD *)v6 = v13;
  return v6;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>(__n128 *a1, __n128 *a2)
{
  unint64_t v4;
  _BOOL8 result;
  __n128 *v6;
  __n128 v7;
  unint64_t v8;
  unsigned __int32 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v4 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)a1) >> 3);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v6 = (__n128 *)((char *)a2 - 24);
      if (outlierScore::operator<((uint64_t)&a2[-2].n128_i64[1], (uint64_t)a1))
      {
        v7 = *a1;
        v8 = a1[1].n128_u64[0];
        v9 = v6[1].n128_u32[0];
        *a1 = *v6;
        a1[1].n128_u32[0] = v9;
        v6[1].n128_u32[0] = v8;
        *v6 = v7;
      }
      return 1;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>((uint64_t)a1, (uint64_t)&a1[1].n128_i64[1], (uint64_t)&a2[-2].n128_i64[1]);
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>(a1, (uint64_t)&a1[1].n128_i64[1], (uint64_t)&a1[3], (uint64_t)&a2[-2].n128_i64[1]);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>(a1, (uint64_t)&a1[1].n128_i64[1], (uint64_t)&a1[3], (uint64_t)&a1[4].n128_i64[1], (uint64_t)&a2[-2].n128_i64[1]);
      return 1;
    default:
      v10 = (uint64_t)&a1[3];
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>((uint64_t)a1, (uint64_t)&a1[1].n128_i64[1], (uint64_t)&a1[3]);
      v11 = (uint64_t)&a1[4].n128_i64[1];
      if (&a1[4].n128_i8[8] == (__int8 *)a2)
        return 1;
      v12 = 0;
      v13 = 0;
      break;
  }
  while (1)
  {
    if (outlierScore::operator<(v11, v10))
    {
      v17 = *(_OWORD *)v11;
      v18 = *(_QWORD *)(v11 + 16);
      v14 = v12;
      while (1)
      {
        v15 = (char *)a1 + v14;
        *(__n128 *)(v15 + 72) = *(__n128 *)((char *)a1 + v14 + 48);
        *((_DWORD *)v15 + 22) = *(unsigned __int32 *)((char *)a1[4].n128_u32 + v14);
        if (v14 == -48)
          break;
        v14 -= 24;
        if (!outlierScore::operator<((uint64_t)&v17, (uint64_t)(v15 + 24)))
        {
          v16 = (uint64_t)&a1[4].n128_i64[1] + v14;
          goto LABEL_12;
        }
      }
      v16 = (uint64_t)a1;
LABEL_12:
      *(_OWORD *)v16 = v17;
      *(_DWORD *)(v16 + 16) = v18;
      if (++v13 == 8)
        return v11 + 24 == (_QWORD)a2;
    }
    v10 = v11;
    v12 += 24;
    v11 += 24;
    if ((__n128 *)v11 == a2)
      return 1;
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __n128 result;
  __int128 v9;
  uint64_t v10;
  int v11;
  __n128 v12;
  uint64_t v13;
  int v14;
  unint64_t v15;
  unsigned __int32 v16;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>((uint64_t)a1, a2, a3);
  if (outlierScore::operator<(a4, a3))
  {
    v9 = *(_OWORD *)a3;
    v10 = *(_QWORD *)(a3 + 16);
    v11 = *(_DWORD *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(_DWORD *)(a3 + 16) = v11;
    *(_DWORD *)(a4 + 16) = v10;
    *(_OWORD *)a4 = v9;
    if (outlierScore::operator<(a3, a2))
    {
      v12 = *(__n128 *)a2;
      v13 = *(_QWORD *)(a2 + 16);
      v14 = *(_DWORD *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(_DWORD *)(a2 + 16) = v14;
      *(_DWORD *)(a3 + 16) = v13;
      *(__n128 *)a3 = v12;
      if (outlierScore::operator<(a2, (uint64_t)a1))
      {
        result = *a1;
        v15 = a1[1].n128_u64[0];
        v16 = *(_DWORD *)(a2 + 16);
        *a1 = *(__n128 *)a2;
        a1[1].n128_u32[0] = v16;
        *(_DWORD *)(a2 + 16) = v15;
        *(__n128 *)a2 = result;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __n128 result;
  __int128 v11;
  uint64_t v12;
  int v13;
  __int128 v14;
  uint64_t v15;
  int v16;
  __n128 v17;
  uint64_t v18;
  int v19;
  unint64_t v20;
  unsigned __int32 v21;

  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>(a1, a2, a3, a4);
  if (outlierScore::operator<(a5, a4))
  {
    v11 = *(_OWORD *)a4;
    v12 = *(_QWORD *)(a4 + 16);
    v13 = *(_DWORD *)(a5 + 16);
    *(_OWORD *)a4 = *(_OWORD *)a5;
    *(_DWORD *)(a4 + 16) = v13;
    *(_DWORD *)(a5 + 16) = v12;
    *(_OWORD *)a5 = v11;
    if (outlierScore::operator<(a4, a3))
    {
      v14 = *(_OWORD *)a3;
      v15 = *(_QWORD *)(a3 + 16);
      v16 = *(_DWORD *)(a4 + 16);
      *(_OWORD *)a3 = *(_OWORD *)a4;
      *(_DWORD *)(a3 + 16) = v16;
      *(_DWORD *)(a4 + 16) = v15;
      *(_OWORD *)a4 = v14;
      if (outlierScore::operator<(a3, a2))
      {
        v17 = *(__n128 *)a2;
        v18 = *(_QWORD *)(a2 + 16);
        v19 = *(_DWORD *)(a3 + 16);
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *(_DWORD *)(a2 + 16) = v19;
        *(_DWORD *)(a3 + 16) = v18;
        *(__n128 *)a3 = v17;
        if (outlierScore::operator<(a2, (uint64_t)a1))
        {
          result = *a1;
          v20 = a1[1].n128_u64[0];
          v21 = *(_DWORD *)(a2 + 16);
          *a1 = *(__n128 *)a2;
          a1[1].n128_u32[0] = v21;
          *(_DWORD *)(a2 + 16) = v20;
          *(__n128 *)a2 = result;
        }
      }
    }
  }
  return result;
}

uint64_t std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *,outlierScore *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  int v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v24;
  uint64_t v25;

  if (a1 != a2)
  {
    v8 = a2 - a1;
    v9 = (a2 - a1) / 24;
    if (a2 - a1 >= 25)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = a1 + 24 * v10;
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>(a1, a4, v9, v12);
        v12 -= 24;
        --v11;
      }
      while (v11);
    }
    v13 = a2;
    if (a2 != a3)
    {
      v14 = a2;
      do
      {
        if (outlierScore::operator<(v14, a1))
        {
          v15 = *(_OWORD *)v14;
          v16 = *(_QWORD *)(v14 + 16);
          v17 = *(_DWORD *)(a1 + 16);
          *(_OWORD *)v14 = *(_OWORD *)a1;
          *(_DWORD *)(v14 + 16) = v17;
          *(_DWORD *)(a1 + 16) = v16;
          *(_OWORD *)a1 = v15;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>(a1, a4, v9, a1);
        }
        v14 += 24;
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 25)
    {
      v18 = v8 / 0x18uLL;
      v19 = a2 - 24;
      do
      {
        v24 = *(_OWORD *)a1;
        v25 = *(_QWORD *)(a1 + 16);
        v20 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>(a1, a4, v18);
        if (v19 == v20)
        {
          *(_OWORD *)v20 = v24;
          *(_DWORD *)(v20 + 16) = v25;
        }
        else
        {
          v21 = *(_OWORD *)v19;
          *(_DWORD *)(v20 + 16) = *(_DWORD *)(v19 + 16);
          *(_OWORD *)v20 = v21;
          *(_OWORD *)v19 = v24;
          *(_DWORD *)(v19 + 16) = v25;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>(a1, v20 + 24, a4, 0xAAAAAAAAAAAAAAABLL * ((v20 + 24 - a1) >> 3));
        }
        v19 -= 24;
      }
      while (v18-- > 2);
    }
    return v13;
  }
  return a3;
}

__n128 std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __n128 result;
  __n128 *v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  __n128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a3 - 2;
  if (a3 >= 2)
  {
    v21 = v4;
    v22 = v5;
    v7 = a4;
    v9 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * ((a4 - a1) >> 3)))
    {
      v11 = (0x5555555555555556 * ((a4 - a1) >> 3)) | 1;
      v12 = a1 + 24 * v11;
      v13 = 0x5555555555555556 * ((a4 - a1) >> 3) + 2;
      if (v13 < a3 && outlierScore::operator<(a1 + 24 * v11, v12 + 24))
      {
        v12 += 24;
        v11 = v13;
      }
      if (!outlierScore::operator<(v12, v7))
      {
        v19 = *(__n128 *)v7;
        v20 = *(_QWORD *)(v7 + 16);
        do
        {
          v15 = (__n128 *)v12;
          v16 = *(_OWORD *)v12;
          *(_DWORD *)(v7 + 16) = *(_DWORD *)(v12 + 16);
          *(_OWORD *)v7 = v16;
          if (v9 < v11)
            break;
          v17 = (2 * v11) | 1;
          v12 = a1 + 24 * v17;
          v18 = 2 * v11 + 2;
          if (v18 < a3 && outlierScore::operator<(a1 + 24 * v17, v12 + 24))
          {
            v12 += 24;
            v17 = v18;
          }
          v7 = (uint64_t)v15;
          v11 = v17;
        }
        while (!outlierScore::operator<(v12, (uint64_t)&v19));
        result = v19;
        v15[1].n128_u32[0] = v20;
        *v15 = result;
      }
    }
  }
  return result;
}

uint64_t std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;

  v5 = 0;
  v6 = a3 - 2;
  if (a3 < 2)
    v6 = a3 - 1;
  v7 = v6 >> 1;
  do
  {
    v8 = a1 + 24 * v5 + 24;
    v9 = (2 * v5) | 1;
    v10 = 2 * v5 + 2;
    if (v10 < a3 && outlierScore::operator<(a1 + 24 * v5 + 24, a1 + 24 * v5 + 48))
    {
      v8 += 24;
      v9 = v10;
    }
    v11 = *(_OWORD *)v8;
    *(_DWORD *)(a1 + 16) = *(_DWORD *)(v8 + 16);
    *(_OWORD *)a1 = v11;
    a1 = v8;
    v5 = v9;
  }
  while (v9 <= v7);
  return v8;
}

double std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,outlierScore *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double result;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (a4 >= 2)
  {
    v15 = v4;
    v16 = v5;
    v7 = (unint64_t)(a4 - 2) >> 1;
    v8 = a1 + 24 * v7;
    v9 = a2 - 24;
    if (outlierScore::operator<(v8, a2 - 24))
    {
      v13 = *(_OWORD *)v9;
      v14 = *(_QWORD *)(v9 + 16);
      do
      {
        v11 = v8;
        v12 = *(_OWORD *)v8;
        *(_DWORD *)(v9 + 16) = *(_DWORD *)(v8 + 16);
        *(_OWORD *)v9 = v12;
        if (!v7)
          break;
        v7 = (v7 - 1) >> 1;
        v8 = a1 + 24 * v7;
        v9 = v11;
      }
      while (outlierScore::operator<(v8, (uint64_t)&v13));
      result = *(double *)&v13;
      *(_OWORD *)v11 = v13;
      *(_DWORD *)(v11 + 16) = v14;
    }
  }
  return result;
}

uint64_t std::vector<cluster>::__push_back_slow_path<cluster const&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t *v17;

  v3 = *a1;
  v4 = 0xF0F0F0F0F0F0F0F1 * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0x1E1E1E1E1E1E1E1)
    std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xF0F0F0F0F0F0F0F1 * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0xF0F0F0F0F0F0F0)
    v9 = 0x1E1E1E1E1E1E1E1;
  else
    v9 = v5;
  v17 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cluster>>(v7, v9);
  else
    v10 = 0;
  v13 = v10;
  v14 = &v10[136 * v4];
  v16 = &v10[136 * v9];
  std::construct_at[abi:ne180100]<cluster,cluster const&,cluster*>((uint64_t)v14, a2);
  v15 = v14 + 136;
  std::vector<cluster>::__swap_out_circular_buffer(a1, &v13);
  v11 = a1[1];
  std::__split_buffer<cluster>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_1001E4AD0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<cluster>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::construct_at[abi:ne180100]<cluster,cluster const&,cluster*>(uint64_t a1, __int128 *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v4 = *a2;
  v5 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)a1 = v4;
  std::set<int>::set[abi:ne180100]((uint64_t *)(a1 + 48), (uint64_t)(a2 + 3));
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  std::vector<cluster *>::__init_with_size[abi:ne180100]<cluster **,cluster **>((_QWORD *)(a1 + 72), *((const void **)a2 + 9), *((_QWORD *)a2 + 10), (uint64_t)(*((_QWORD *)a2 + 10) - *((_QWORD *)a2 + 9)) >> 3);
  v6 = a2[6];
  v7 = a2[7];
  *(_DWORD *)(a1 + 128) = *((_DWORD *)a2 + 32);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  return a1;
}

void sub_1001E4B5C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  std::__tree<int>::destroy(v2, *(_QWORD **)(v1 + 56));
  _Unwind_Resume(a1);
}

void std::vector<cluster>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  __int128 *v4;
  __int128 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = (__int128 *)*a1;
  v4 = (__int128 *)a1[1];
  v6 = a2[1];
  while (v4 != v5)
  {
    v6 -= 136;
    v4 = (__int128 *)((char *)v4 - 136);
    std::construct_at[abi:ne180100]<cluster,cluster,cluster*>(v6, v4);
  }
  a2[1] = v6;
  v7 = *a1;
  *a1 = v6;
  a2[1] = v7;
  v8 = a1[1];
  a1[1] = a2[2];
  a2[2] = v8;
  v9 = a1[2];
  a1[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<cluster>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1E1E1E1E1E1E1E2)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(136 * a2);
}

__n128 std::construct_at[abi:ne180100]<cluster,cluster,cluster*>(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __n128 result;
  __int128 v9;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
  v4 = (_QWORD *)a2 + 7;
  v5 = *((_QWORD *)a2 + 7);
  *(_QWORD *)(a1 + 56) = v5;
  v6 = a1 + 56;
  v7 = *((_QWORD *)a2 + 8);
  *(_QWORD *)(a1 + 64) = v7;
  if (v7)
  {
    *(_QWORD *)(v5 + 16) = v6;
    *((_QWORD *)a2 + 6) = v4;
    *v4 = 0;
    *((_QWORD *)a2 + 8) = 0;
  }
  else
  {
    *(_QWORD *)(a1 + 48) = v6;
  }
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  *(_OWORD *)(a1 + 72) = *(__int128 *)((char *)a2 + 72);
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 11);
  *((_QWORD *)a2 + 9) = 0;
  *((_QWORD *)a2 + 10) = 0;
  *((_QWORD *)a2 + 11) = 0;
  result = (__n128)a2[6];
  v9 = a2[7];
  *(_DWORD *)(a1 + 128) = *((_DWORD *)a2 + 32);
  *(__n128 *)(a1 + 96) = result;
  *(_OWORD *)(a1 + 112) = v9;
  return result;
}

void std::__destroy_at[abi:ne180100]<cluster,0>(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 72);
  if (v2)
  {
    *(_QWORD *)(a1 + 80) = v2;
    operator delete(v2);
  }
  std::__tree<int>::destroy(a1 + 48, *(_QWORD **)(a1 + 56));
}

uint64_t std::__split_buffer<cluster>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 136;
    std::__destroy_at[abi:ne180100]<cluster,0>(i - 136);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::vector<cluster>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 136;
        std::__destroy_at[abi:ne180100]<cluster,0>(v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t *std::__tree<int>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  BOOL v5;
  uint64_t *v6;

  v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      v3 = v2;
      v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    v4 = a2;
    do
    {
      v3 = (uint64_t *)v4[2];
      v5 = *v3 == (_QWORD)v4;
      v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2)
    *a1 = v3;
  v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t **v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *a2;
  v3 = a2;
  if (*a2)
  {
    v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      v3 = a2;
      goto LABEL_7;
    }
    do
    {
      v3 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  v2 = v3[1];
  if (v2)
  {
LABEL_7:
    v5 = 0;
    *(_QWORD *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  v5 = 1;
LABEL_8:
  v6 = (uint64_t **)v3[2];
  v7 = *v6;
  if (*v6 == v3)
  {
    *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      v7 = 0;
      result = (uint64_t *)v2;
    }
    else
    {
      v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    v9 = a2[2];
    v3[2] = v9;
    *(_QWORD *)(v9 + 8 * (*(_QWORD *)a2[2] != (_QWORD)a2)) = v3;
    v11 = *a2;
    v10 = a2[1];
    *(_QWORD *)(v11 + 16) = v3;
    *v3 = v11;
    v3[1] = v10;
    if (v10)
      *(_QWORD *)(v10 + 16) = v3;
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2)
      result = v3;
  }
  if (!v8 || !result)
    return result;
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    v12 = v7[2];
    if (*(uint64_t **)v12 == v7)
      break;
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      v13 = *(uint64_t **)(v12 + 8);
      v14 = *v13;
      *(_QWORD *)(v12 + 8) = *v13;
      if (v14)
        *(_QWORD *)(v14 + 16) = v12;
      v13[2] = *(_QWORD *)(v12 + 16);
      *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v13;
      *v13 = v12;
      *(_QWORD *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7)
        result = v7;
      v7 = *(uint64_t **)(*v7 + 8);
    }
    v15 = (_QWORD *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      v16 = (uint64_t *)v7[1];
      if (!v16)
        goto LABEL_56;
LABEL_55:
      if (*((_BYTE *)v16 + 24))
      {
LABEL_56:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v22 = v15[1];
        *v7 = v22;
        if (v22)
          *(_QWORD *)(v22 + 16) = v7;
        v15[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v16 = v7;
      }
      else
      {
        v15 = v7;
      }
      v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      v25 = *v24;
      *(_QWORD *)(v23 + 8) = *v24;
      if (v25)
        *(_QWORD *)(v25 + 16) = v23;
      v24[2] = *(_QWORD *)(v23 + 16);
      *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
      *v24 = v23;
      goto LABEL_72;
    }
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24))
      goto LABEL_55;
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }
    if (!*((_BYTE *)v17 + 24))
      goto LABEL_53;
LABEL_49:
    v7 = *(uint64_t **)(v17[2] + 8 * (*(_QWORD *)v17[2] == (_QWORD)v17));
  }
  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    v18 = v7[1];
    *(_QWORD *)v12 = v18;
    if (v18)
      *(_QWORD *)(v18 + 16) = v12;
    v7[2] = *(_QWORD *)(v12 + 16);
    *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(_QWORD *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12)
      result = v7;
    v7 = *(uint64_t **)v12;
  }
  v19 = (_QWORD *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24))
    goto LABEL_68;
  v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24))
      v21 = v17 == result;
    else
      v21 = 1;
    if (v21)
      goto LABEL_53;
    goto LABEL_49;
  }
  if (v19 && !*((_BYTE *)v19 + 24))
  {
LABEL_68:
    v20 = v7;
  }
  else
  {
    *((_BYTE *)v20 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    v26 = *v20;
    v7[1] = *v20;
    if (v26)
      *(_QWORD *)(v26 + 16) = v7;
    v20[2] = v7[2];
    *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v20;
    *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    v19 = v7;
  }
  v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  v24 = *(uint64_t **)v23;
  v27 = *(_QWORD *)(*(_QWORD *)v23 + 8);
  *(_QWORD *)v23 = v27;
  if (v27)
    *(_QWORD *)(v27 + 16) = v23;
  v24[2] = *(_QWORD *)(v23 + 16);
  *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(_QWORD *)(v23 + 16) = v24;
  return result;
}

uint64_t **std::__tree<int>::__assign_multi<std::__tree_const_iterator<int,std::__tree_node<int,void *> *,long>>(uint64_t **result, int *a2, int *a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  int *v9;
  int *v10;
  BOOL v11;
  int *v12;
  int *v13;
  uint64_t **v14;
  uint64_t *v15;
  uint64_t *v16;

  v5 = result;
  if (result[2])
  {
    v6 = *result;
    v7 = result[1];
    *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1])
      v8 = (uint64_t *)v6[1];
    else
      v8 = v6;
    v14 = result;
    v15 = v8;
    v16 = v8;
    if (v8)
    {
      v15 = std::__tree<int>::_DetachedTreeCache::__detach_next((uint64_t)v8);
      if (a2 != a3)
      {
        v9 = a2;
        do
        {
          *((_DWORD *)v8 + 7) = v9[7];
          std::__tree<int>::__node_insert_multi(v5, (uint64_t)v8);
          v8 = v15;
          v16 = v15;
          if (v15)
            v15 = std::__tree<int>::_DetachedTreeCache::__detach_next((uint64_t)v15);
          v10 = (int *)*((_QWORD *)v9 + 1);
          if (v10)
          {
            do
            {
              a2 = v10;
              v10 = *(int **)v10;
            }
            while (v10);
          }
          else
          {
            do
            {
              a2 = (int *)*((_QWORD *)v9 + 2);
              v11 = *(_QWORD *)a2 == (_QWORD)v9;
              v9 = a2;
            }
            while (!v11);
          }
          if (!v8)
            break;
          v9 = a2;
        }
        while (a2 != a3);
      }
    }
    result = (uint64_t **)std::__tree<int>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v14);
  }
  if (a2 != a3)
  {
    do
    {
      result = (uint64_t **)std::__tree<int>::__emplace_multi<int const&>(v5, a2 + 7);
      v12 = (int *)*((_QWORD *)a2 + 1);
      if (v12)
      {
        do
        {
          v13 = v12;
          v12 = *(int **)v12;
        }
        while (v12);
      }
      else
      {
        do
        {
          v13 = (int *)*((_QWORD *)a2 + 2);
          v11 = *(_QWORD *)v13 == (_QWORD)a2;
          a2 = v13;
        }
        while (!v11);
      }
      a2 = v13;
    }
    while (v13 != a3);
  }
  return result;
}

void sub_1001E52F4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__tree<int>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::__tree<int>::__node_insert_multi(uint64_t **a1, uint64_t a2)
{
  uint64_t **v3;
  uint64_t *v4;
  uint64_t **v5;

  v3 = a1 + 1;
  v4 = a1[1];
  if (v4)
  {
    do
    {
      while (1)
      {
        v3 = (uint64_t **)v4;
        if (*(_DWORD *)(a2 + 28) >= *((_DWORD *)v4 + 7))
          break;
        v4 = (uint64_t *)*v4;
        v5 = v3;
        if (!*v3)
          goto LABEL_8;
      }
      v4 = (uint64_t *)v4[1];
    }
    while (v4);
    v5 = v3 + 1;
  }
  else
  {
    v5 = a1 + 1;
  }
LABEL_8:
  std::__tree<int>::__insert_node_at(a1, (uint64_t)v3, v5, (uint64_t *)a2);
  return a2;
}

_QWORD *std::__tree<int>::_DetachedTreeCache::__detach_next(uint64_t a1)
{
  _QWORD *result;
  _QWORD *v3;
  _QWORD *v4;

  result = *(_QWORD **)(a1 + 16);
  if (result)
  {
    v3 = (_QWORD *)*result;
    if (*result == a1)
    {
      *result = 0;
      while (1)
      {
        v4 = (_QWORD *)result[1];
        if (!v4)
          break;
        do
        {
          result = v4;
          v4 = (_QWORD *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; v3 = (_QWORD *)result[1])
      {
        do
        {
          result = v3;
          v3 = (_QWORD *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

uint64_t std::__tree<int>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  std::__tree<int>::destroy(*(_QWORD *)a1, *(_QWORD **)(a1 + 16));
  v2 = *(_QWORD **)(a1 + 8);
  if (v2)
  {
    v3 = (_QWORD *)v2[2];
    if (v3)
    {
      do
      {
        v2 = v3;
        v3 = (_QWORD *)v3[2];
      }
      while (v3);
      *(_QWORD *)(a1 + 8) = v2;
    }
    std::__tree<int>::destroy(*(_QWORD *)a1, v2);
  }
  return a1;
}

uint64_t *std::__tree<int>::__emplace_multi<int const&>(uint64_t **a1, int *a2)
{
  uint64_t *v4;
  int v5;
  uint64_t **v6;
  uint64_t *v7;
  uint64_t **v8;

  v4 = (uint64_t *)operator new(0x20uLL);
  v5 = *a2;
  *((_DWORD *)v4 + 7) = *a2;
  v6 = a1 + 1;
  v7 = a1[1];
  if (v7)
  {
    do
    {
      while (1)
      {
        v6 = (uint64_t **)v7;
        if (v5 >= *((_DWORD *)v7 + 7))
          break;
        v7 = (uint64_t *)*v7;
        v8 = v6;
        if (!*v6)
          goto LABEL_8;
      }
      v7 = (uint64_t *)v7[1];
    }
    while (v7);
    v8 = v6 + 1;
  }
  else
  {
    v8 = a1 + 1;
  }
LABEL_8:
  std::__tree<int>::__insert_node_at(a1, (uint64_t)v6, v8, v4);
  return v4;
}

uint64_t *std::list<int>::__assign_with_sentinel[abi:ne180100]<std::__list_const_iterator<int,void *>,std::__list_const_iterator<int,void *>>(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *i;

  for (i = (uint64_t *)a1[1]; a2 != a3 && i != a1; i = (uint64_t *)i[1])
  {
    *((_DWORD *)i + 4) = *(_DWORD *)(a2 + 16);
    a2 = *(_QWORD *)(a2 + 8);
  }
  if (i == a1)
    return std::list<int>::__insert_with_sentinel[abi:ne180100]<std::__list_const_iterator<int,void *>,std::__list_const_iterator<int,void *>>((uint64_t)a1, a1, a2, a3);
  else
    return std::list<int>::erase((uint64_t)a1, i, a1);
}

uint64_t *std::list<int>::__insert_with_sentinel[abi:ne180100]<std::__list_const_iterator<int,void *>,std::__list_const_iterator<int,void *>>(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;

  if (a3 != a4)
  {
    v8 = operator new(0x18uLL);
    v9 = v8;
    *v8 = 0;
    v8[1] = 0;
    *((_DWORD *)v8 + 4) = *(_DWORD *)(a3 + 16);
    v10 = *(_QWORD *)(a3 + 8);
    v11 = 1;
    if (v10 != a4)
    {
      v12 = v8;
      do
      {
        v8 = operator new(0x18uLL);
        *v8 = v12;
        v8[1] = 0;
        *((_DWORD *)v8 + 4) = *(_DWORD *)(v10 + 16);
        v12[1] = v8;
        ++v11;
        v10 = *(_QWORD *)(v10 + 8);
        v12 = v8;
      }
      while (v10 != a4);
    }
    v13 = *a2;
    *(_QWORD *)(v13 + 8) = v9;
    *v9 = v13;
    *a2 = (uint64_t)v8;
    v8[1] = a2;
    *(_QWORD *)(a1 + 16) += v11;
    return v9;
  }
  return a2;
}

void sub_1001E55C8(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;

  __cxa_begin_catch(a1);
  do
  {
    v2 = (_QWORD *)*v1;
    operator delete(v1);
    v1 = v2;
  }
  while (v2);
  __cxa_rethrow();
}

void sub_1001E55E8(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t *std::list<int>::erase(uint64_t a1, uint64_t *__p, uint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (__p != a3)
  {
    v5 = *a3;
    v6 = *__p;
    *(_QWORD *)(v6 + 8) = *(_QWORD *)(*a3 + 8);
    **(_QWORD **)(v5 + 8) = v6;
    do
    {
      v7 = (uint64_t *)__p[1];
      --*(_QWORD *)(a1 + 16);
      operator delete(__p);
      __p = v7;
    }
    while (v7 != a3);
  }
  return a3;
}

void std::__tree<std::__value_type<int,std::vector<int>>,std::__map_value_compare<int,std::__value_type<int,std::vector<int>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<int>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  void *v4;

  if (a2)
  {
    std::__tree<std::__value_type<int,std::vector<int>>,std::__map_value_compare<int,std::__value_type<int,std::vector<int>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<int>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<int,std::vector<int>>,std::__map_value_compare<int,std::__value_type<int,std::vector<int>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<int>>>>::destroy(a1, a2[1]);
    v4 = (void *)a2[5];
    if (v4)
    {
      a2[6] = v4;
      operator delete(v4);
    }
    operator delete(a2);
  }
}

uint64_t **std::__tree<std::__value_type<int,std::vector<int>>,std::__map_value_compare<int,std::__value_type<int,std::vector<int>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<int>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  int v8;
  uint64_t **v9;
  int v10;
  _DWORD *v11;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10)
          break;
        v6 = *v9;
        v7 = v9;
        if (!*v9)
          goto LABEL_10;
      }
      if (v10 >= v8)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    v11 = operator new(0x40uLL);
    v11[8] = **a4;
    *((_QWORD *)v11 + 6) = 0;
    *((_QWORD *)v11 + 7) = 0;
    *((_QWORD *)v11 + 5) = 0;
    std::__tree<int>::__insert_node_at(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

uint64_t std::__tree<std::__value_type<int,std::vector<int>>,std::__map_value_compare<int,std::__value_type<int,std::vector<int>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<int>>>>::__erase_unique<int>(uint64_t a1, int *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  BOOL v6;
  uint64_t *v7;

  v2 = *(_QWORD *)(a1 + 8);
  if (!v2)
    return 0;
  v3 = *a2;
  v4 = a1 + 8;
  do
  {
    v5 = *(_DWORD *)(v2 + 32);
    v6 = v5 < v3;
    if (v5 >= v3)
      v7 = (uint64_t *)v2;
    else
      v7 = (uint64_t *)(v2 + 8);
    if (!v6)
      v4 = v2;
    v2 = *v7;
  }
  while (*v7);
  if (v4 == a1 + 8 || v3 < *(_DWORD *)(v4 + 32))
    return 0;
  std::__tree<std::__value_type<int,std::vector<int>>,std::__map_value_compare<int,std::__value_type<int,std::vector<int>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<int>>>>::erase((uint64_t **)a1, (uint64_t *)v4);
  return 1;
}

uint64_t *std::__tree<std::__value_type<int,std::vector<int>>,std::__map_value_compare<int,std::__value_type<int,std::vector<int>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<int>>>>::erase(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v3;
  void *v4;

  v3 = std::__tree<int>::__remove_node_pointer(a1, a2);
  v4 = (void *)a2[5];
  if (v4)
  {
    a2[6] = (uint64_t)v4;
    operator delete(v4);
  }
  operator delete(a2);
  return v3;
}

uint64_t std::__tree<std::__value_type<int,cluster *>,std::__map_value_compare<int,std::__value_type<int,cluster *>,std::less<int>,true>,std::allocator<std::__value_type<int,cluster *>>>::__erase_unique<int>(uint64_t a1, int *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  BOOL v6;
  uint64_t *v7;

  v2 = *(_QWORD *)(a1 + 8);
  if (!v2)
    return 0;
  v3 = *a2;
  v4 = a1 + 8;
  do
  {
    v5 = *(_DWORD *)(v2 + 32);
    v6 = v5 < v3;
    if (v5 >= v3)
      v7 = (uint64_t *)v2;
    else
      v7 = (uint64_t *)(v2 + 8);
    if (!v6)
      v4 = v2;
    v2 = *v7;
  }
  while (*v7);
  if (v4 == a1 + 8 || v3 < *(_DWORD *)(v4 + 32))
    return 0;
  std::__tree<int>::__remove_node_pointer((uint64_t **)a1, (uint64_t *)v4);
  operator delete((void *)v4);
  return 1;
}

uint64_t **std::__tree<std::__value_type<int,cluster *>,std::__map_value_compare<int,std::__value_type<int,cluster *>,std::less<int>,true>,std::allocator<std::__value_type<int,cluster *>>>::__emplace_unique_key_args<int,std::pair<int const,cluster *>>(uint64_t **a1, int *a2, _OWORD *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  int v7;
  uint64_t **v8;
  int v9;
  uint64_t *v10;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = *((_DWORD *)v5 + 8);
        if (v7 >= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v10 + 2) = *a3;
    std::__tree<int>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }
  return v8;
}

uint64_t *std::set<int>::set[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::set<int>::insert[abi:ne180100]<std::__tree_const_iterator<int,std::__tree_node<int,void *> *,long>>(a1, *(int **)a2, (int *)(a2 + 8));
  return a1;
}

void sub_1001E5990(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<int>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::set<int>::insert[abi:ne180100]<std::__tree_const_iterator<int,std::__tree_node<int,void *> *,long>>(uint64_t *result, int *a2, int *a3)
{
  int *v4;
  uint64_t **v5;
  uint64_t *v6;
  int *v7;
  int *v8;
  BOOL v9;

  if (a2 != a3)
  {
    v4 = a2;
    v5 = (uint64_t **)result;
    v6 = result + 1;
    do
    {
      result = std::__tree<int>::__emplace_hint_unique_key_args<int,int const&>(v5, v6, v4 + 7, v4 + 7);
      v7 = (int *)*((_QWORD *)v4 + 1);
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = *(int **)v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (int *)*((_QWORD *)v4 + 2);
          v9 = *(_QWORD *)v8 == (_QWORD)v4;
          v4 = v8;
        }
        while (!v9);
      }
      v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *std::__tree<int>::__emplace_hint_unique_key_args<int,int const&>(uint64_t **a1, uint64_t *a2, int *a3, _DWORD *a4)
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t v10;
  uint64_t *v11;

  v6 = std::__tree<int>::__find_equal<int>(a1, a2, &v11, &v10, a3);
  v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = (uint64_t *)operator new(0x20uLL);
    *((_DWORD *)v7 + 7) = *a4;
    std::__tree<int>::__insert_node_at(a1, (uint64_t)v11, v8, v7);
  }
  return v7;
}

uint64_t *std::__tree<int>::__find_equal<int>(_QWORD *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
{
  uint64_t *v5;
  int v6;
  int v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  BOOL v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  int v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  int v22;

  v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, v7 = *((_DWORD *)a2 + 7), *a5 < v7))
  {
    v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      v9 = (uint64_t *)*a2;
      do
      {
        v10 = v9;
        v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      v13 = a2;
      do
      {
        v10 = (uint64_t *)v13[2];
        v14 = *v10 == (_QWORD)v13;
        v13 = v10;
      }
      while (v14);
    }
    v15 = *a5;
    if (*((_DWORD *)v10 + 7) < *a5)
      goto LABEL_17;
    v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v17 = (uint64_t *)v16;
          v18 = *(_DWORD *)(v16 + 28);
          if (v15 >= v18)
            break;
          v16 = *v17;
          v5 = v17;
          if (!*v17)
            goto LABEL_29;
        }
        if (v18 >= v15)
          break;
        v5 = v17 + 1;
        v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  v11 = a2[1];
  if (v11)
  {
    v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      v14 = *a4 == (_QWORD)v19;
      v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 7))
  {
    v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v21 = (uint64_t *)v20;
          v22 = *(_DWORD *)(v20 + 28);
          if (v6 >= v22)
            break;
          v20 = *v21;
          v5 = v21;
          if (!*v21)
            goto LABEL_48;
        }
        if (v22 >= v6)
          break;
        v5 = v21 + 1;
        v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

void Hdbscan::loadDataSet(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = a1 + 80;
  if ((uint64_t *)v2 != a2)
    std::vector<std::vector<double>>::__assign_with_size[abi:ne180100]<std::vector<double>*,std::vector<double>*>(v2, *a2, a2[1], 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3));
}

void Hdbscan::loadDistanceMatrix(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = a1 + 104;
  if ((uint64_t *)v2 != a2)
    std::vector<std::vector<double>>::__assign_with_size[abi:ne180100]<std::vector<double>*,std::vector<double>*>(v2, *a2, a2[1], 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3));
}

void Hdbscan::execute(uint64_t *a1, int a2, int a3, std::string *__str)
{
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[48];
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD v15[3];
  _QWORD v16[2];
  _OWORD v17[3];
  std::string v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v22 = 0;
  v23 = 0;
  memset(v17, 0, sizeof(v17));
  memset(&v18, 0, sizeof(v18));
  v21 = 0;
  v16[0] = 0;
  v16[1] = 0;
  v15[2] = v16;
  v15[0] = 0;
  v15[1] = 0;
  v13 = 0;
  v14 = v15;
  v11 = 0;
  v12 = 0;
  if ((uint64_t *)((char *)&v17[1] + 8) != a1 + 10)
    std::vector<std::vector<double>>::__assign_with_size[abi:ne180100]<std::vector<double>*,std::vector<double>*>((uint64_t)&v17[1] + 8, a1[10], a1[11], 0xAAAAAAAAAAAAAAABLL * ((a1[11] - a1[10]) >> 3));
  v19 = a2;
  v20 = a3;
  std::string::operator=(&v18, __str);
  v8 = a1[13];
  if (v17 != (_OWORD *)(a1 + 13))
  {
    v9 = a1[14];
    if (v9 != v8)
      std::vector<std::vector<double>>::__assign_with_size[abi:ne180100]<std::vector<double>*,std::vector<double>*>((uint64_t)v17, v8, v9, 0xAAAAAAAAAAAAAAABLL * ((v9 - v8) >> 3));
  }
  hdbscanParameters::hdbscanParameters((hdbscanParameters *)v10, (const hdbscanParameters *)v17);
  hdbscanRunner::run((uint64_t)v10);
}

void sub_1001E622C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *__p,uint64_t a35,uint64_t a36,char a37,_QWORD *a38)
{
  uint64_t v38;

  hdbscanParameters::~hdbscanParameters((hdbscanParameters *)&a10);
  if (__p)
  {
    a35 = (uint64_t)__p;
    operator delete(__p);
  }
  std::__tree<int>::destroy((uint64_t)&a37, a38);
  std::__tree<int>::destroy(v38 - 232, *(_QWORD **)(v38 - 224));
  hdbscanParameters::~hdbscanParameters((hdbscanParameters *)(v38 - 208));
  _Unwind_Resume(a1);
}

void hdbscanResult::~hdbscanResult(hdbscanResult *this)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)*((_QWORD *)this + 6);
  if (v2)
  {
    *((_QWORD *)this + 7) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 3);
  if (v3)
  {
    *((_QWORD *)this + 4) = v3;
    operator delete(v3);
  }
  v4 = *(void **)this;
  if (*(_QWORD *)this)
  {
    *((_QWORD *)this + 1) = v4;
    operator delete(v4);
  }
}

void hdbscanParameters::~hdbscanParameters(hdbscanParameters *this)
{
  void *v2;
  void **v3;

  v2 = (void *)*((_QWORD *)this + 10);
  if (v2)
  {
    *((_QWORD *)this + 11) = v2;
    operator delete(v2);
  }
  if (*((char *)this + 71) < 0)
    operator delete(*((void **)this + 6));
  v3 = (void **)((char *)this + 24);
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](&v3);
  v3 = (void **)this;
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](&v3);
}

void Hdbscan::displayResult(Hdbscan *this)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  const std::locale::facet *v5;
  uint64_t v6;
  unsigned int *v7;
  unint64_t v8;
  unsigned int v9;
  _QWORD *v10;
  const std::locale::facet *v11;
  uint64_t v12;
  const std::locale::facet *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  const std::locale::facet *v20;
  uint64_t v21;
  void *v22;
  _BYTE *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *__p;
  void *v29;
  uint64_t v30;
  char v31;
  std::locale v32;

  v22 = 0;
  v23 = 0;
  v24 = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&v22, *(const void **)this, *((_QWORD *)this + 1), (uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 2);
  v25 = 0;
  v26 = 0;
  v27 = 0;
  std::vector<outlierScore>::__init_with_size[abi:ne180100]<outlierScore*,outlierScore*>(&v25, *((const void **)this + 3), *((_QWORD *)this + 4), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)this + 4) - *((_QWORD *)this + 3)) >> 3));
  __p = 0;
  v29 = 0;
  v30 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&__p, *((const void **)this + 6), *((_QWORD *)this + 7), (uint64_t)(*((_QWORD *)this + 7) - *((_QWORD *)this + 6)) >> 3);
  v31 = *((_BYTE *)this + 72);
  v2 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&std::cout, (uint64_t)"HDBSCAN clustering for ", 23);
  v3 = (_QWORD *)std::ostream::operator<<(v2, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)this + 14) - *((_QWORD *)this + 13)) >> 3));
  v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)" objects.", 9);
  std::ios_base::getloc((const std::ios_base *)((char *)v4 + *(_QWORD *)(*v4 - 24)));
  v5 = std::locale::use_facet(&v32, &std::ctype<char>::id);
  v6 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 10);
  std::locale::~locale(&v32);
  std::ostream::put(v4, v6);
  std::ostream::flush(v4);
  v7 = (unsigned int *)v22;
  if (v23 != v22)
  {
    v8 = 0;
    v9 = 1;
    do
    {
      v10 = (_QWORD *)std::ostream::operator<<(&std::cout, v7[v8]);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)" ", 1);
      v8 = v9;
      v7 = (unsigned int *)v22;
      ++v9;
    }
    while (v8 < (v23 - (_BYTE *)v22) >> 2);
  }
  std::ios_base::getloc((const std::ios_base *)((char *)&std::cout
                                              + (unint64_t)std::cout.__vftable[-2].~basic_ostream_0));
  v11 = std::locale::use_facet(&v32, &std::ctype<char>::id);
  v12 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v11->__vftable[2].~facet_0)(v11, 10);
  std::locale::~locale(&v32);
  std::ostream::put(&std::cout, v12);
  std::ostream::flush(&std::cout);
  std::ios_base::getloc((const std::ios_base *)((char *)&std::cout
                                              + (unint64_t)std::cout.__vftable[-2].~basic_ostream_0));
  v13 = std::locale::use_facet(&v32, &std::ctype<char>::id);
  v14 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 10);
  std::locale::~locale(&v32);
  std::ostream::put(&std::cout, v14);
  std::ostream::flush(&std::cout);
  v15 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&std::cout, (uint64_t)"The Clustering contains ", 24);
  v16 = (_QWORD *)std::ostream::operator<<(v15, *((unsigned int *)this + 57));
  v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)" clusters with ", 15);
  v18 = (_QWORD *)std::ostream::operator<<(v17, *((unsigned int *)this + 56));
  v19 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)" noise Points.", 14);
  std::ios_base::getloc((const std::ios_base *)((char *)v19 + *(_QWORD *)(*v19 - 24)));
  v20 = std::locale::use_facet(&v32, &std::ctype<char>::id);
  v21 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v20->__vftable[2].~facet_0)(v20, 10);
  std::locale::~locale(&v32);
  std::ostream::put(v19, v21);
  std::ostream::flush(v19);
  if (__p)
  {
    v29 = __p;
    operator delete(__p);
  }
  if (v25)
  {
    v26 = v25;
    operator delete(v25);
  }
  if (v22)
  {
    v23 = v22;
    operator delete(v22);
  }
}

void sub_1001E666C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  if (__p)
    operator delete(__p);
  if (a10)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

void std::vector<std::vector<double>>::__assign_with_size[abi:ne180100]<std::vector<double>*,std::vector<double>*>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  char v21;

  v8 = a1 + 16;
  v9 = *(char **)a1;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3) < a4)
  {
    std::vector<std::vector<double>>::__vdeallocate((uint64_t *)a1);
    if (a4 > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]();
    v10 = 0x5555555555555556 * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3);
    if (v10 <= a4)
      v10 = a4;
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3) >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v10;
    std::vector<std::vector<double>>::__vallocate[abi:ne180100]((_QWORD *)a1, v11);
    v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<double>>,std::vector<double>*,std::vector<double>*,std::vector<double>*>(v8, a2, a3, *(_QWORD **)(a1 + 8));
    goto LABEL_11;
  }
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 8) - (_QWORD)v9) >> 3) < a4)
  {
    v13 = a2 + 8 * ((uint64_t)(*(_QWORD *)(a1 + 8) - (_QWORD)v9) >> 3);
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<double> *,std::vector<double> *,std::vector<double> *>((int)&v20, a2, v13, v9);
    v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<double>>,std::vector<double>*,std::vector<double>*,std::vector<double>*>(v8, v13, a3, *(_QWORD **)(a1 + 8));
LABEL_11:
    *(_QWORD *)(a1 + 8) = v12;
    return;
  }
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<double> *,std::vector<double> *,std::vector<double> *>((int)&v21, a2, a3, v9);
  v15 = v14;
  v16 = *(_QWORD *)(a1 + 8);
  if (v16 != v14)
  {
    v17 = *(_QWORD *)(a1 + 8);
    do
    {
      v19 = *(void **)(v17 - 24);
      v17 -= 24;
      v18 = v19;
      if (v19)
      {
        *(_QWORD *)(v16 - 16) = v18;
        operator delete(v18);
      }
      v16 = v17;
    }
    while (v17 != v15);
  }
  *(_QWORD *)(a1 + 8) = v15;
}

void sub_1001E6848(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1001E6850(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void std::vector<std::vector<double>>::__vdeallocate(uint64_t *a1)
{
  if (*a1)
  {
    std::vector<std::vector<double>>::__clear[abi:ne180100](a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

uint64_t std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<double> *,std::vector<double> *,std::vector<double> *>(int a1, uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v5;

  v5 = a2;
  if (a2 != a3)
  {
    do
    {
      if ((char *)v5 != a4)
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(a4, *(char **)v5, *(_QWORD *)(v5 + 8), (uint64_t)(*(_QWORD *)(v5 + 8) - *(_QWORD *)v5) >> 3);
      v5 += 24;
      a4 += 24;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void hdbscanParameters::hdbscanParameters(hdbscanParameters *this, const hdbscanParameters *a2)
{
  __int128 v4;
  uint64_t v5;

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  std::vector<std::vector<double>>::__init_with_size[abi:ne180100]<std::vector<double>*,std::vector<double>*>(this, *(_QWORD *)a2, *((_QWORD *)a2 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 1) - *(_QWORD *)a2) >> 3));
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 0;
  std::vector<std::vector<double>>::__init_with_size[abi:ne180100]<std::vector<double>*,std::vector<double>*>((_QWORD *)this + 3, *((_QWORD *)a2 + 3), *((_QWORD *)a2 + 4), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 4) - *((_QWORD *)a2 + 3)) >> 3));
  if (*((char *)a2 + 71) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)this + 2, *((const std::string::value_type **)a2 + 6), *((_QWORD *)a2 + 7));
  }
  else
  {
    v4 = *((_OWORD *)a2 + 3);
    *((_QWORD *)this + 8) = *((_QWORD *)a2 + 8);
    *((_OWORD *)this + 3) = v4;
  }
  v5 = *((_QWORD *)a2 + 9);
  *((_QWORD *)this + 10) = 0;
  *((_QWORD *)this + 9) = v5;
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 12) = 0;
  std::vector<hdbscanConstraint>::__init_with_size[abi:ne180100]<hdbscanConstraint*,hdbscanConstraint*>((_QWORD *)this + 10, *((const void **)a2 + 10), *((_QWORD *)a2 + 11), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 11) - *((_QWORD *)a2 + 10)) >> 2));
}

void sub_1001E69DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

_QWORD *std::vector<hdbscanConstraint>::__init_with_size[abi:ne180100]<hdbscanConstraint*,hdbscanConstraint*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<hdbscanConstraint>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1001E6B08(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<hdbscanConstraint>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x1555555555555556)
    std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<hdbscanConstraint>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[12 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<hdbscanConstraint>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(12 * a2);
}

_QWORD *std::vector<outlierScore>::__init_with_size[abi:ne180100]<outlierScore*,outlierScore*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<std::vector<double>>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8 - 4);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1001E6C14(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(uint64_t **a1, int *a2, uint64_t a3, unsigned int **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  int v8;
  uint64_t **v9;
  int v10;
  uint64_t *v11;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v10 = *((_DWORD *)v6 + 7);
        if (v8 >= v10)
          break;
        v6 = *v9;
        v7 = v9;
        if (!*v9)
          goto LABEL_10;
      }
      if (v10 >= v8)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    v11 = (uint64_t *)operator new(0x28uLL);
    *(uint64_t *)((char *)v11 + 28) = **a4;
    std::__tree<int>::__insert_node_at(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  std::ostream::sentry::sentry(v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  std::ostream::sentry::~sentry(v13);
  return a1;
}

void sub_1001E6DF4(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  std::ostream::sentry::~sentry(&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x1001E6DD4);
}

void sub_1001E6E3C(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_1001E6F70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

void hdbscanRunner::run(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  void **v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  int v16;
  uint64_t v18;
  unint64_t v19;
  double v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void **v26;
  uint64_t v27;
  const void *v28;
  uint64_t v29;
  void *v30[3];
  _QWORD v31[3];
  void *v32[3];
  _QWORD v33[3];
  std::vector<int> v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  _QWORD v39[3];
  void **v40;
  void *v41;
  void *v42[3];
  void *v43;
  uint64_t v44;
  void *__p;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;

  v2 = *(_QWORD *)(a1 + 32) - *(_QWORD *)(a1 + 24);
  if (!v2)
    v2 = *(_QWORD *)(a1 + 8) - *(_QWORD *)a1;
  v3 = 0xAAAAAAAAAAAAAAABLL * (v2 >> 3);
  hdbscanResult::hdbscanResult((hdbscanResult *)&v63);
  v4 = *(void ***)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = (int)v3;
  if (v5 == *(_QWORD *)a1)
  {
    std::vector<std::vector<double>>::vector(&v40, (int)v3);
    if ((int)v3 >= 1)
    {
      v7 = 0;
      while (1)
      {
        v8 = v6;
        std::vector<double>::resize((uint64_t)&v40[3 * v7], v6);
        if (v7)
          break;
LABEL_42:
        ++v7;
        v6 = v8;
        if (v7 == v3)
          goto LABEL_43;
      }
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *(_BYTE *)(a1 + 71);
        if (v11 < 0)
        {
          if (!*(_QWORD *)(a1 + 56))
          {
LABEL_31:
            v43 = &off_1002B6828;
            v22 = *(_QWORD *)(a1 + 24) + 24 * v7;
            v61 = 0;
            v62 = 0;
            v60 = 0;
            std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v60, *(const void **)v22, *(_QWORD *)(v22 + 8), (uint64_t)(*(_QWORD *)(v22 + 8) - *(_QWORD *)v22) >> 3);
            v23 = *(_QWORD *)(a1 + 24) + v9;
            v58 = 0;
            v59 = 0;
            v57 = 0;
            std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v57, *(const void **)v23, *(_QWORD *)(v23 + 8), (uint64_t)(*(_QWORD *)(v23 + 8) - *(_QWORD *)v23) >> 3);
            v20 = EuclideanDistance::computeDistance((uint64_t)&v43, &v60, &v57);
            if (v57)
            {
              v58 = v57;
              operator delete(v57);
            }
            v21 = v60;
            if (!v60)
              goto LABEL_40;
            v61 = v60;
            goto LABEL_39;
          }
        }
        else if (!*(_BYTE *)(a1 + 71))
        {
          goto LABEL_31;
        }
        if (v11 >= 0)
          v12 = *(unsigned __int8 *)(a1 + 71);
        else
          v12 = *(_QWORD *)(a1 + 56);
        if (v12 != 9)
          goto LABEL_41;
        if (v11 >= 0)
          v13 = a1 + 48;
        else
          v13 = *(_QWORD *)(a1 + 48);
        if (*(_QWORD *)v13 == 0x616564696C637545 && *(_BYTE *)(v13 + 8) == 110)
        {
          v43 = &off_1002B6828;
          v24 = *(_QWORD *)(a1 + 24) + 24 * v7;
          v55 = 0;
          v56 = 0;
          v54 = 0;
          std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v54, *(const void **)v24, *(_QWORD *)(v24 + 8), (uint64_t)(*(_QWORD *)(v24 + 8) - *(_QWORD *)v24) >> 3);
          v25 = *(_QWORD *)(a1 + 24) + v9;
          v53 = 0;
          v51 = 0;
          v52 = 0;
          std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v51, *(const void **)v25, *(_QWORD *)(v25 + 8), (uint64_t)(*(_QWORD *)(v25 + 8) - *(_QWORD *)v25) >> 3);
          v20 = EuclideanDistance::computeDistance((uint64_t)&v43, &v54, &v51);
          if (v51)
          {
            v52 = v51;
            operator delete(v51);
          }
          v21 = v54;
          if (!v54)
            goto LABEL_40;
          v55 = v54;
          goto LABEL_39;
        }
        v15 = *(_QWORD *)v13;
        v16 = *(unsigned __int8 *)(v13 + 8);
        if (v15 != 0x61747461686E614DLL || v16 != 110)
          goto LABEL_41;
        v43 = &off_1002B6878;
        v18 = *(_QWORD *)(a1 + 24) + 24 * v7;
        v50 = 0;
        v48 = 0;
        v49 = 0;
        std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v48, *(const void **)v18, *(_QWORD *)(v18 + 8), (uint64_t)(*(_QWORD *)(v18 + 8) - *(_QWORD *)v18) >> 3);
        v19 = *(_QWORD *)(a1 + 24) + v9;
        v47 = 0;
        __p = 0;
        v46 = 0;
        std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&__p, *(const void **)v19, *(_QWORD *)(v19 + 8), (uint64_t)(*(_QWORD *)(v19 + 8) - *(_QWORD *)v19) >> 3);
        v20 = ManhattanDistance::computeDistance((uint64_t)&v43, &v48, &__p);
        if (__p)
        {
          v46 = __p;
          operator delete(__p);
        }
        v21 = v48;
        if (v48)
        {
          v49 = v48;
LABEL_39:
          operator delete(v21);
        }
LABEL_40:
        v26 = v40;
        *((double *)v40[3 * v7] + v10) = v20;
        *((double *)v26[v9 / 8] + v7) = v20;
LABEL_41:
        ++v10;
        v9 += 24;
        if (v7 == v10)
          goto LABEL_42;
      }
    }
LABEL_43:
    if (&v40 != (void ***)a1)
      std::vector<std::vector<double>>::__assign_with_size[abi:ne180100]<std::vector<double>*,std::vector<double>*>(a1, (uint64_t)v40, (uint64_t)v41, 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)v41 - (_BYTE *)v40) >> 3));
    v43 = &v40;
    std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v43);
    v4 = *(void ***)a1;
    v5 = *(_QWORD *)(a1 + 8);
  }
  memset(v42, 0, sizeof(v42));
  std::vector<std::vector<double>>::__init_with_size[abi:ne180100]<std::vector<double>*,std::vector<double>*>(v42, (uint64_t)v4, v5, 0xAAAAAAAAAAAAAAABLL * ((v5 - (uint64_t)v4) >> 3));
  hdbscanStar::hdbscanAlgorithm::calculateCoreDistances(v42, *(_DWORD *)(a1 + 72), &v43);
  v40 = v42;
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](&v40);
  memset(v39, 0, sizeof(v39));
  std::vector<std::vector<double>>::__init_with_size[abi:ne180100]<std::vector<double>*,std::vector<double>*>(v39, *(_QWORD *)a1, *(_QWORD *)(a1 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3));
  v36 = 0;
  v37 = 0;
  v38 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v36, v43, v44, (v44 - (uint64_t)v43) >> 3);
  hdbscanStar::hdbscanAlgorithm::constructMst(v39, (uint64_t *)&v36, 1, (uint64_t)&v40);
  if (v36)
  {
    v37 = v36;
    operator delete(v36);
  }
  v35 = v39;
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v35);
  undirectedGraph::quicksortByEdgeWeight((undirectedGraph *)&v40);
  std::vector<double>::vector(&v35, v6);
  std::vector<int>::vector(&v34, v6);
  memset(v33, 0, sizeof(v33));
  memset(v32, 0, sizeof(v32));
  memset(v31, 0, sizeof(v31));
  v27 = *(unsigned int *)(a1 + 76);
  v28 = *(const void **)(a1 + 80);
  v29 = *(_QWORD *)(a1 + 88);
  memset(v30, 0, sizeof(v30));
  std::vector<hdbscanConstraint>::__init_with_size[abi:ne180100]<hdbscanConstraint*,hdbscanConstraint*>(v30, v28, v29, 0xAAAAAAAAAAAAAAABLL * ((v29 - (uint64_t)v28) >> 2));
  hdbscanStar::hdbscanAlgorithm::computeHierarchyAndClusterTree((undirectedGraph *)&v40, v27, (uint64_t)v30, (uint64_t)v33, (uint64_t)&v35, (uint64_t)&v34, (char **)v32, (cluster_factory *)v31);
}

void sub_1001E77B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,uint64_t a37,void *a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,void *a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,void *a53,uint64_t a54,uint64_t a55,void *a56,uint64_t a57,uint64_t a58,void *a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a65;
  uint64_t v65;

  STACK[0x240] = (unint64_t)&a65;
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100]((void ***)&STACK[0x240]);
  hdbscanResult::~hdbscanResult((hdbscanResult *)(v65 - 184));
  _Unwind_Resume(a1);
}

void undirectedGraph::~undirectedGraph(undirectedGraph *this)
{
  void *v2;
  void *v3;
  void *v4;
  void **v5;

  v5 = (void **)((char *)this + 80);
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](&v5);
  v2 = (void *)*((_QWORD *)this + 7);
  if (v2)
  {
    *((_QWORD *)this + 8) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 4);
  if (v3)
  {
    *((_QWORD *)this + 5) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 1);
  if (v4)
  {
    *((_QWORD *)this + 2) = v4;
    operator delete(v4);
  }
}

void std::vector<std::unique_ptr<cluster>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::unique_ptr<cluster>>::__base_destruct_at_end[abi:ne180100]((uint64_t)v2, (uint64_t *)*v2);
    operator delete(**a1);
  }
}

void std::vector<std::unique_ptr<cluster>>::__base_destruct_at_end[abi:ne180100](uint64_t a1, uint64_t *a2)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;

  v4 = *(uint64_t **)(a1 + 8);
  if (v4 != a2)
  {
    v5 = v4 - 1;
    do
    {
      v6 = *v5;
      *v5 = 0;
      if (v6)
        std::default_delete<cluster>::operator()[abi:ne180100]((uint64_t)v5, v6);
    }
    while (v5-- != a2);
  }
  *(_QWORD *)(a1 + 8) = a2;
}

id _MOErrorInvalidParameterCreate(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v5;
  void *v6;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %@"), a1, NSLocalizedDescriptionKey));
  v6 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 7, v2));
  return v3;
}

void main_cold_1(NSObject *a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Closing momentsd"), &stru_1002B68D0, 0));
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v4, 0xCu);

}

void main_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to set temporary directory.", v1, 2u);
}

void main_cold_3()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_6((void *)&_mh_execute_header, v1, v2, "Unable to setrlimit: [%i] %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_5();
}

void main_cold_4()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_6((void *)&_mh_execute_header, v1, v2, "Unable to getrlimit: [%i] %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_5();
}

void MOSemaphoreWaitAndFaultIfTimeout_Internal_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Semaphore wait timed out", v1, 2u);
}

void _MODiagnosticReporter_NotificationHandler_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", a1));
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, a2, v4, "_MODiagnosticReporter_NotificationHandler with flags %@", (uint8_t *)&v5);

}

void hdbscanResult::hdbscanResult(void **a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = *a1;
  if (v3)
  {
    *(_QWORD *)(a2 + 32) = v3;
    operator delete(v3);
  }
  v4 = *(void **)a2;
  if (*(_QWORD *)a2)
  {
    *(_QWORD *)(a2 + 8) = v4;
    operator delete(v4);
  }
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

id objc_msgSend_Engagement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "Engagement");
}

id objc_msgSend_EventData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "EventData");
}

id objc_msgSend_Events(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "Events");
}

id objc_msgSend_FormatDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "FormatDate:");
}

id objc_msgSend_IHAState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IHAState");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_Media(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "Media");
}

id objc_msgSend_Moments(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "Moments");
}

id objc_msgSend_NowPlaying(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NowPlaying");
}

id objc_msgSend_Stats(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "Stats");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URL");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__MOStatusFromUNStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_MOStatusFromUNStatus:");
}

id objc_msgSend__MomentsBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_MomentsBundle");
}

id objc_msgSend__MomentsDefaultLanguageBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_MomentsDefaultLanguageBundle");
}

id objc_msgSend__Moments_AllCapitalizedStringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_Moments_AllCapitalizedStringForKey:");
}

id objc_msgSend__Moments_CapitalizedStringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_Moments_CapitalizedStringForKey:");
}

id objc_msgSend__Moments_LocalizedStringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_Moments_LocalizedStringForKey:");
}

id objc_msgSend__Moments_LocalizedStringForKey_withTable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_Moments_LocalizedStringForKey:withTable:");
}

id objc_msgSend__Moments_LocalizedStringWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_Moments_LocalizedStringWithFormat:arguments:");
}

id objc_msgSend__Moments_LowercaseNounForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_Moments_LowercaseNounForKey:");
}

id objc_msgSend__Moments_TitleCapitalizedStringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_Moments_TitleCapitalizedStringForKey:");
}

id objc_msgSend__UpdateAssetPriority_parameters_isSong_isFirstPartyApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_UpdateAssetPriority:parameters:isSong:isFirstPartyApp:");
}

id objc_msgSend___Moments_TitleCapitalizedStringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__Moments_TitleCapitalizedStringForKey:");
}

id objc_msgSend__abortIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_abortIfNeeded:");
}

id objc_msgSend__acquireBackgroundAssertionForFileDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_acquireBackgroundAssertionForFileDescriptor:");
}

id objc_msgSend__acquireBackgroundProcessingPermissionForStoreURL_cacheFileExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_acquireBackgroundProcessingPermissionForStoreURL:cacheFileExtension:");
}

id objc_msgSend__acquireBackgroundProcessingPermissions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_acquireBackgroundProcessingPermissions");
}

id objc_msgSend__actionForBundle_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_actionForBundle:type:");
}

id objc_msgSend__actionFromEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_actionFromEvent:");
}

id objc_msgSend__addMetricWithKey_name_unit_denominator_pcMetricID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addMetricWithKey:name:unit:denominator:pcMetricID:");
}

id objc_msgSend__aggregateBundlesForCoarseGranularity_withParameters_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_aggregateBundlesForCoarseGranularity:withParameters:handler:");
}

id objc_msgSend__aggregateBundlesForFineGranularity_withParameters_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_aggregateBundlesForFineGranularity:withParameters:handler:");
}

id objc_msgSend__aggregateEventBundles_withAggregtaionDateInterval_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_aggregateEventBundles:withAggregtaionDateInterval:handler:");
}

id objc_msgSend__allResourcesImpl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_allResourcesImpl");
}

id objc_msgSend__analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_analyzeTrendsInEvents:withContext:andRefreshVariant:andHandler:");
}

id objc_msgSend__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_annotateEventBundlesWithStartDate:endDate:allEvents:eventBundles:handler:");
}

id objc_msgSend__annotateEvents_isFirstParty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_annotateEvents:isFirstParty:");
}

id objc_msgSend__annotateEvents_significantContact_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_annotateEvents:significantContact:type:");
}

id objc_msgSend__annotateEvents_withSourceEventForSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_annotateEvents:withSourceEventForSet:");
}

id objc_msgSend__assignPriorityScoreForPhotoResources_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_assignPriorityScoreForPhotoResources:");
}

id objc_msgSend__assignPriorityScoreForPlace_placeInfoArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_assignPriorityScoreForPlace:placeInfoArray:");
}

id objc_msgSend__assignResourcePriorityScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_assignResourcePriorityScore:");
}

id objc_msgSend__buildCuratedAssetMap_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildCuratedAssetMap:handler:");
}

id objc_msgSend__buildMappingFromBaseEvents_toContextEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildMappingFromBaseEvents:toContextEvents:");
}

id objc_msgSend__buildMappingFromBaseEvents_toPatternEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildMappingFromBaseEvents:toPatternEvents:");
}

id objc_msgSend__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bundleEvents:startDate:endDate:submitMetricsFlg:refreshVariant:handler:");
}

id objc_msgSend__bundleEventsWithContext_andRefreshVariant_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bundleEventsWithContext:andRefreshVariant:andHandler:");
}

id objc_msgSend__bundleEventsWithRefreshVariant_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bundleEventsWithRefreshVariant:andHandler:");
}

id objc_msgSend__bundlesForContact_fromInputBundles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bundlesForContact:fromInputBundles:");
}

id objc_msgSend__calculateDistanceBetweenUserLocation_PhotoLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_calculateDistanceBetweenUserLocation:PhotoLocation:");
}

id objc_msgSend__calculateDistanceFromHome_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_calculateDistanceFromHome:");
}

id objc_msgSend__calculateEndDateFromMediaPlaySessions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_calculateEndDateFromMediaPlaySessions:");
}

id objc_msgSend__calculateEventStats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_calculateEventStats:");
}

id objc_msgSend__calculateNormSquare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_calculateNormSquare:");
}

id objc_msgSend__calculateRankingScore_withMinRecommendedBundleCountRequirement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_calculateRankingScore:withMinRecommendedBundleCountRequirement:");
}

id objc_msgSend__calculateStartDateFromMediaPlaySessions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_calculateStartDateFromMediaPlaySessions:");
}

id objc_msgSend__callLikeInteraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_callLikeInteraction:");
}

id objc_msgSend__cancel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancel");
}

id objc_msgSend__checkAndFetchInvalidEvents_Events_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkAndFetchInvalidEvents:Events:handler:");
}

id objc_msgSend__checkAndUpdateNumericLimits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkAndUpdateNumericLimits:");
}

id objc_msgSend__checkElegibilityAndRequestDataExportForTrigger_withFeedback_requestUpload_refreshVariant_context_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkElegibilityAndRequestDataExportForTrigger:withFeedback:requestUpload:refreshVariant:context:reply:");
}

id objc_msgSend__checkIfEligibleForOpportunisticScheduledNotificationUsingEventBundles_withTrigger_usingAppSchedule_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkIfEligibleForOpportunisticScheduledNotificationUsingEventBundles:withTrigger:usingAppSchedule:");
}

id objc_msgSend__checkIfEligibleToPostInOnboardingPeriodUsingEventBundles_usingAppSchedule_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkIfEligibleToPostInOnboardingPeriodUsingEventBundles:usingAppSchedule:");
}

id objc_msgSend__checkWorkoutExistsInHealthDB_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkWorkoutExistsInHealthDB:handler:");
}

id objc_msgSend__cleanUpEventBundlesWithRefreshVariant_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cleanUpEventBundlesWithRefreshVariant:andHandler:");
}

id objc_msgSend__cleanUpEventsWithRefreshVariant_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cleanUpEventsWithRefreshVariant:andHandler:");
}

id objc_msgSend__clearAllNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearAllNotifications");
}

id objc_msgSend__clearEventBundles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearEventBundles");
}

id objc_msgSend__clearEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearEvents");
}

id objc_msgSend__clearEventsWithContext_andRefreshVariant_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearEventsWithContext:andRefreshVariant:andHandler:");
}

id objc_msgSend__clearFSMs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearFSMs");
}

id objc_msgSend__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_collectCompleteEventsBetweenStartDate:endDate:refreshVariant:withStoredEvents:handler:");
}

id objc_msgSend__collectEventsWithContext_andRefreshVariant_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_collectEventsWithContext:andRefreshVariant:andHandler:");
}

id objc_msgSend__collectEventsWithRefreshVariant_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_collectEventsWithRefreshVariant:andHandler:");
}

id objc_msgSend__collectSignificantContactsFromInteractions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_collectSignificantContactsFromInteractions:");
}

id objc_msgSend__collectTimeCorrelatedEventsWithStartDate_endDate_events_submitMetricsFlg_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_collectTimeCorrelatedEventsWithStartDate:endDate:events:submitMetricsFlg:handler:");
}

id objc_msgSend__collectWithRefreshVariant_andCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_collectWithRefreshVariant:andCompletion:");
}

id objc_msgSend__compressAssetsForThirdPartyBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_compressAssetsForThirdPartyBundle:");
}

id objc_msgSend__computeBPROptForPairs_withTotalBundleCountsForInterfaceTypesHigherTier_WithTotalBundleCountsForInterfaceTypesLowerTier_bprOpt_pairWiseMult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_computeBPROptForPairs:withTotalBundleCountsForInterfaceTypesHigherTier:WithTotalBundleCountsForInterfaceTypesLowerTier:bprOpt:pairWiseMult:");
}

id objc_msgSend__computeEngagementScoreParams(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_computeEngagementScoreParams");
}

id objc_msgSend__computeEvergreenScoreParams_withRankingParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_computeEvergreenScoreParams:withRankingParams:");
}

id objc_msgSend__computeGradient_initialParams_Update_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_computeGradient:initialParams:Update:");
}

id objc_msgSend__computeSensedBundleEngagementScoreParams_withRankingParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_computeSensedBundleEngagementScoreParams:withRankingParams:");
}

id objc_msgSend__computeWithRefreshVariant_andCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_computeWithRefreshVariant:andCompletion:");
}

id objc_msgSend__concatenatedEventIdentifierForBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_concatenatedEventIdentifierForBundle:");
}

id objc_msgSend__configureFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureFromDictionary:");
}

id objc_msgSend__contactCandidatesForMegaBundleFromStats_contactClassificationMap_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contactCandidatesForMegaBundleFromStats:contactClassificationMap:parameters:");
}

id objc_msgSend__contactClassificationMapFromEventBundles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contactClassificationMapFromEventBundles:");
}

id objc_msgSend__conversationsFromInteractions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_conversationsFromInteractions:");
}

id objc_msgSend__convertContextvalueToString_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_convertContextvalueToString:forKey:");
}

id objc_msgSend__convertStringArrayIntoCombinedHashedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_convertStringArrayIntoCombinedHashedString:");
}

id objc_msgSend__createAnomalyEventFromEvent_andFeature_andThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createAnomalyEventFromEvent:andFeature:andThreshold:");
}

id objc_msgSend__createBundlesFromEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createBundlesFromEvents:");
}

id objc_msgSend__createContactMegaBundleFromBundles_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createContactMegaBundleFromBundles:parameters:");
}

id objc_msgSend__createEventFromAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createEventFromAsset:");
}

id objc_msgSend__createEventFromConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createEventFromConversation:");
}

id objc_msgSend__createEventFromMediaPlayGroupsByDayTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createEventFromMediaPlayGroupsByDayTitle:");
}

id objc_msgSend__createEventFromMediaPlaySessions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createEventFromMediaPlaySessions:");
}

id objc_msgSend__createEventFromMindfulSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createEventFromMindfulSession:");
}

id objc_msgSend__createEventFromPeopleDensityEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createEventFromPeopleDensityEvent:");
}

id objc_msgSend__createEventFromPhotoMemory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createEventFromPhotoMemory:");
}

id objc_msgSend__createEventFromProx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createEventFromProx:");
}

id objc_msgSend__createEventFromStateOfMind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createEventFromStateOfMind:");
}

id objc_msgSend__createEventFromVisit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createEventFromVisit:");
}

id objc_msgSend__createEventFromWorkout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createEventFromWorkout:");
}

id objc_msgSend__createEventsFromConversations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createEventsFromConversations:");
}

id objc_msgSend__createEventsFromStateOfMind_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createEventsFromStateOfMind:handler:");
}

id objc_msgSend__createEventsFromVisits_familiarityIndex_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createEventsFromVisits:familiarityIndex:handler:");
}

id objc_msgSend__createEventsFromWorkout_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createEventsFromWorkout:handler:");
}

id objc_msgSend__createLifeEventContextWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createLifeEventContextWithError:");
}

id objc_msgSend__createMOEventFromDiningEvent_existingMOEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createMOEventFromDiningEvent:existingMOEvent:");
}

id objc_msgSend__createMOEventFromEntityIdentifier_existingMOEvent_category_date_confidenceScore_locations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createMOEventFromEntityIdentifier:existingMOEvent:category:date:confidenceScore:locations:");
}

id objc_msgSend__createMOEventFromEntityIdentifier_existingMOEvent_logErrorWhenEventHasError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createMOEventFromEntityIdentifier:existingMOEvent:logErrorWhenEventHasError:");
}

id objc_msgSend__createMOEventFromShoppingEvent_existingMOEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createMOEventFromShoppingEvent:existingMOEvent:");
}

id objc_msgSend__createMOEventFromTransportationEvent_existingMOEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createMOEventFromTransportationEvent:existingMOEvent:");
}

id objc_msgSend__createMOEventsBetweenStartDate_endDate_excludingEntityIdentifiers_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createMOEventsBetweenStartDate:endDate:excludingEntityIdentifiers:error:");
}

id objc_msgSend__createMediaDictionaryFromBundles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createMediaDictionaryFromBundles:");
}

id objc_msgSend__createNewEventsBetweenStartDate_endDate_withStoredEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createNewEventsBetweenStartDate:endDate:withStoredEvents:");
}

id objc_msgSend__createNewEventsFromActivities_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createNewEventsFromActivities:handler:");
}

id objc_msgSend__createNewEventsFromConversations_storedEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createNewEventsFromConversations:storedEvents:");
}

id objc_msgSend__createNewEventsFromPhotoMemories_storedEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createNewEventsFromPhotoMemories:storedEvents:handler:");
}

id objc_msgSend__createNewEventsFromStateOfMind_storedEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createNewEventsFromStateOfMind:storedEvents:handler:");
}

id objc_msgSend__createNewEventsFromVisits_familiarityIndex_withStoredEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createNewEventsFromVisits:familiarityIndex:withStoredEvents:handler:");
}

id objc_msgSend__createNewEventsFromWorkouts_storedEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createNewEventsFromWorkouts:storedEvents:handler:");
}

id objc_msgSend__createNewEventsWithStoredEvents_peopleDensityEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createNewEventsWithStoredEvents:peopleDensityEvents:");
}

id objc_msgSend__createNewEventsWithStoredEvents_proxEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createNewEventsWithStoredEvents:proxEvents:");
}

id objc_msgSend__createNewLeisureMediaEventsFromMediaPlays_storedEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createNewLeisureMediaEventsFromMediaPlays:storedEvents:");
}

id objc_msgSend__createNewMediaPlayEventsFromMediaPlays_storedEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createNewMediaPlayEventsFromMediaPlays:storedEvents:");
}

id objc_msgSend__createQueryBasedonEvents_withPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createQueryBasedonEvents:withPredicate:");
}

id objc_msgSend__createWatchDogWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createWatchDogWithName:");
}

id objc_msgSend__crossPlatformUnifiedMeContactWithKeysToFetch_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:");
}

id objc_msgSend__dailyRoutineCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dailyRoutineCheck:");
}

id objc_msgSend__dataDumpWithRefreshVariant_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dataDumpWithRefreshVariant:completion:");
}

id objc_msgSend__dedupAssetForMediaBundle_nonPlayedMediaBudnles_isRecommendTab_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dedupAssetForMediaBundle:nonPlayedMediaBudnles:isRecommendTab:");
}

id objc_msgSend__deleteEWAForExpiredEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteEWAForExpiredEvents:");
}

id objc_msgSend__deleteEWAOnRehydrationFailure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteEWAOnRehydrationFailure:");
}

id objc_msgSend__deletePatternEvents_forContext_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deletePatternEvents:forContext:handler:");
}

id objc_msgSend__deletePhotoMemoryPlistFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deletePhotoMemoryPlistFile:");
}

id objc_msgSend__deleteSensedEvents_forContext_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteSensedEvents:forContext:handler:");
}

id objc_msgSend__deleteStaleEWAEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteStaleEWAEvents");
}

id objc_msgSend__detectDailyRoutine_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_detectDailyRoutine:");
}

id objc_msgSend__detectHindsightVisitsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_detectHindsightVisitsWithCompletionHandler:");
}

id objc_msgSend__doesAssetHaveFaceProcessing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_doesAssetHaveFaceProcessing:");
}

id objc_msgSend__doesAssetHaveSceneProcessing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_doesAssetHaveSceneProcessing:");
}

id objc_msgSend__dominantBundleCreatedFromOutingBundles_activityBundles_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dominantBundleCreatedFromOutingBundles:activityBundles:parameters:");
}

id objc_msgSend__eligibleInteraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_eligibleInteraction:");
}

id objc_msgSend__enrichSuggestedEventsWithEventKit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enrichSuggestedEventsWithEventKit:");
}

id objc_msgSend__entityIdentifierFromMomentEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_entityIdentifierFromMomentEvent:");
}

id objc_msgSend__evaluateEndedSession_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_evaluateEndedSession:duration:");
}

id objc_msgSend__eventsForContactFromEventBundles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_eventsForContactFromEventBundles:");
}

id objc_msgSend__fetchAndSaveMotionActivityBetweenStartDate_EndDate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchAndSaveMotionActivityBetweenStartDate:EndDate:handler:");
}

id objc_msgSend__fetchAndSetDemographicsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchAndSetDemographicsWithCompletionHandler:");
}

id objc_msgSend__fetchAppCateogryByBundleIds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchAppCateogryByBundleIds:");
}

id objc_msgSend__fetchBundleInforForRanking_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchBundleInforForRanking:");
}

id objc_msgSend__fetchClassificationForSignificantContacts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchClassificationForSignificantContacts:");
}

id objc_msgSend__fetchConversationEventsBetweenStartDate_endDate_withStoredEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchConversationEventsBetweenStartDate:endDate:withStoredEvents:handler:");
}

id objc_msgSend__fetchCuratedAssetsForPhotoMemory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchCuratedAssetsForPhotoMemory:");
}

id objc_msgSend__fetchCuratedPhotosFromHighlights_StartDate_EndDate_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchCuratedPhotosFromHighlights:StartDate:EndDate:BundleInterfaceType:Locations:IsLocationCheckMandatory:handler:");
}

id objc_msgSend__fetchDeviceLocationsFromStartDate_endDate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchDeviceLocationsFromStartDate:endDate:handler:");
}

id objc_msgSend__fetchEarliestVisitDateInRoutineWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchEarliestVisitDateInRoutineWithHandler:");
}

id objc_msgSend__fetchEventBundlesWithOptions_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchEventBundlesWithOptions:CompletionHandler:");
}

id objc_msgSend__fetchEventBundlesWithOptions_withContext_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchEventBundlesWithOptions:withContext:andHandler:");
}

id objc_msgSend__fetchEventsFromCacheWithOptions_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchEventsFromCacheWithOptions:CompletionHandler:");
}

id objc_msgSend__fetchEventsFromDBAndRehydrateEventsWithOptions_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchEventsFromDBAndRehydrateEventsWithOptions:CompletionHandler:");
}

id objc_msgSend__fetchEventsWithOptions_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchEventsWithOptions:CompletionHandler:");
}

id objc_msgSend__fetchEventsWithOptions_withContext_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchEventsWithOptions:withContext:andHandler:");
}

id objc_msgSend__fetchFamiliarityIndexesLOIForDateInterval_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchFamiliarityIndexesLOIForDateInterval:CompletionHandler:");
}

id objc_msgSend__fetchInteractionsBetweenStartDate_EndDate_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchInteractionsBetweenStartDate:EndDate:CompletionHandler:");
}

id objc_msgSend__fetchLifeEventsBetweenStartDate_endDate_withStoredEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchLifeEventsBetweenStartDate:endDate:withStoredEvents:handler:");
}

id objc_msgSend__fetchLocationsFrom_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchLocationsFrom:handler:");
}

id objc_msgSend__fetchMediaPlayEventsBetweenStartDate_endDate_withStoredEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchMediaPlayEventsBetweenStartDate:endDate:withStoredEvents:handler:");
}

id objc_msgSend__fetchMindfulSessionBetweenStartDate_EndDate_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchMindfulSessionBetweenStartDate:EndDate:CompletionHandler:");
}

id objc_msgSend__fetchMotionActivityBetweenStartDate_EndDate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchMotionActivityBetweenStartDate:EndDate:handler:");
}

id objc_msgSend__fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchMotionActivityBetweenStartDate:endDate:withStoredEvents:handler:");
}

id objc_msgSend__fetchNowPlayingEventsBetweenStartDate_EndDate_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchNowPlayingEventsBetweenStartDate:EndDate:CompletionHandler:");
}

id objc_msgSend__fetchPeopleDensityBetweenStartDate_EndDate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchPeopleDensityBetweenStartDate:EndDate:handler:");
}

id objc_msgSend__fetchPeopleDensityEventsBetweenStartDate_endDate_withStoredEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchPeopleDensityEventsBetweenStartDate:endDate:withStoredEvents:handler:");
}

id objc_msgSend__fetchPhotoMemoriesBetweenStartDate_EndDate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchPhotoMemoriesBetweenStartDate:EndDate:handler:");
}

id objc_msgSend__fetchPhotoMemoryEventsBetweenStartDate_endDate_withStoredEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchPhotoMemoryEventsBetweenStartDate:endDate:withStoredEvents:handler:");
}

id objc_msgSend__fetchPhotosTraitsFromAssets_StartDate_EndDate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchPhotosTraitsFromAssets:StartDate:EndDate:handler:");
}

id objc_msgSend__fetchPreviousBundlesWithDateInterval_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchPreviousBundlesWithDateInterval:handler:");
}

id objc_msgSend__fetchProxBetweenStartDate_EndDate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchProxBetweenStartDate:EndDate:handler:");
}

id objc_msgSend__fetchProxEventsBetweenStartDate_endDate_withStoredEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchProxEventsBetweenStartDate:endDate:withStoredEvents:handler:");
}

id objc_msgSend__fetchRealTimeVisitsBetweenStartDate_EndDate_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchRealTimeVisitsBetweenStartDate:EndDate:CompletionHandler:");
}

id objc_msgSend__fetchRealTimeVisitsForStartDate_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchRealTimeVisitsForStartDate:CompletionHandler:");
}

id objc_msgSend__fetchSharedPhotosBetweenStartDate_EndDate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchSharedPhotosBetweenStartDate:EndDate:handler:");
}

id objc_msgSend__fetchSignificantLocationEnablementStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchSignificantLocationEnablementStatus");
}

id objc_msgSend__fetchStateOfMindBetweenStartDate_EndDate_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchStateOfMindBetweenStartDate:EndDate:CompletionHandler:");
}

id objc_msgSend__fetchStateOfMindEventsBetweenStartDate_endDate_withStoredEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchStateOfMindEventsBetweenStartDate:endDate:withStoredEvents:handler:");
}

id objc_msgSend__fetchStitchedVisitsBetweenStartDate_EndDate_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchStitchedVisitsBetweenStartDate:EndDate:CompletionHandler:");
}

id objc_msgSend__fetchTripsBetweenStartDate_EndDate_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchTripsBetweenStartDate:EndDate:CompletionHandler:");
}

id objc_msgSend__fetchUnprocessedPhotosBetweenStartDate_EndDate_Locations_IsLocationCheckMandatory_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchUnprocessedPhotosBetweenStartDate:EndDate:Locations:IsLocationCheckMandatory:handler:");
}

id objc_msgSend__fetchUserAgeWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchUserAgeWithHandler:");
}

id objc_msgSend__fetchUserBiologicalSexWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchUserBiologicalSexWithHandler:");
}

id objc_msgSend__fetchUserDataWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchUserDataWithCompletionHandler:");
}

id objc_msgSend__fetchVisitsBetweenStartDate_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchVisitsBetweenStartDate:CompletionHandler:");
}

id objc_msgSend__fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchVisitsBetweenStartDate:endDate:withStoredEvents:handler:");
}

id objc_msgSend__fetchWorkoutEventsBetweenStartDate_endDate_withStoredEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchWorkoutEventsBetweenStartDate:endDate:withStoredEvents:handler:");
}

id objc_msgSend__fetchWorkoutRouteLocations_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchWorkoutRouteLocations:CompletionHandler:");
}

id objc_msgSend__fetchWorkoutRoutes_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchWorkoutRoutes:CompletionHandler:");
}

id objc_msgSend__fetchWorkoutsBetweenStartDate_EndDate_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchWorkoutsBetweenStartDate:EndDate:CompletionHandler:");
}

id objc_msgSend__fillCurationInfoForRanking_forBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fillCurationInfoForRanking:forBundle:");
}

id objc_msgSend__fillDistincnessInfoForRanking_forBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fillDistincnessInfoForRanking:forBundle:");
}

id objc_msgSend__fillEngagementInfoForRanking_forBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fillEngagementInfoForRanking:forBundle:");
}

id objc_msgSend__fillHeuristicsInfoForRanking_forBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fillHeuristicsInfoForRanking:forBundle:");
}

id objc_msgSend__fillQualityInfoForRanking_forBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fillQualityInfoForRanking:forBundle:");
}

id objc_msgSend__fillRecencyInfoForRanking_forBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fillRecencyInfoForRanking:forBundle:");
}

id objc_msgSend__fillRichnessInfoForRanking_forBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fillRichnessInfoForRanking:forBundle:");
}

id objc_msgSend__filterAndAnnotateResults_denyList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_filterAndAnnotateResults:denyList:");
}

id objc_msgSend__filterMediaSessionsBasedOnApps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_filterMediaSessionsBasedOnApps:");
}

id objc_msgSend__filterMediaSessionsBasedOnMusicApps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_filterMediaSessionsBasedOnMusicApps:");
}

id objc_msgSend__filterPlaceUsingPredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_filterPlaceUsingPredicates:");
}

id objc_msgSend__filterPreOnboardedVisitEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_filterPreOnboardedVisitEvents:handler:");
}

id objc_msgSend__findEventsWithBurstyInteractionsFromEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findEventsWithBurstyInteractionsFromEvents:");
}

id objc_msgSend__findEventsWithLongDailyCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findEventsWithLongDailyCall:");
}

id objc_msgSend__findEventsWithOutgoingMessageBurstFromEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findEventsWithOutgoingMessageBurstFromEvents:");
}

id objc_msgSend__findEventsWithPatternEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findEventsWithPatternEvents:");
}

id objc_msgSend__findHabitualTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findHabitualTime:");
}

id objc_msgSend__findMatchingEventFor_inEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findMatchingEventFor:inEvents:");
}

id objc_msgSend__findMatchingFamiliarityIndexValue_forVisit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findMatchingFamiliarityIndexValue:forVisit:");
}

id objc_msgSend__findTopNRoutines_withN_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findTopNRoutines:withN:");
}

id objc_msgSend__findUnrehydratedEventsWithStoredEvents_conversations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findUnrehydratedEventsWithStoredEvents:conversations:");
}

id objc_msgSend__findUnrehydratedEventsWithStoredEvents_photoMemories_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findUnrehydratedEventsWithStoredEvents:photoMemories:");
}

id objc_msgSend__findUnrehydratedEventsWithStoredEvents_stateOfMind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findUnrehydratedEventsWithStoredEvents:stateOfMind:");
}

id objc_msgSend__findUnrehydratedEventsWithStoredEvents_workouts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findUnrehydratedEventsWithStoredEvents:workouts:");
}

id objc_msgSend__generateBPROptUsing_initialParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateBPROptUsing:initialParams:");
}

id objc_msgSend__generateClusterAndAnomalyBundlesWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateClusterAndAnomalyBundlesWithHandler:");
}

id objc_msgSend__generateMediaPlayGroupsByDayTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateMediaPlayGroupsByDayTitle:");
}

id objc_msgSend__generateMediaPlaySessionGroupsByDay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateMediaPlaySessionGroupsByDay:");
}

id objc_msgSend__generateMediaPlaySessionsFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateMediaPlaySessionsFrom:");
}

id objc_msgSend__getApplicationsWithDataAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getApplicationsWithDataAccess:");
}

id objc_msgSend__getArrayScheduledDateComponents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getArrayScheduledDateComponents");
}

id objc_msgSend__getAuthorizationNotificationsError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getAuthorizationNotificationsError");
}

id objc_msgSend__getBaseEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getBaseEvents:");
}

id objc_msgSend__getBundleIdSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getBundleIdSet:");
}

id objc_msgSend__getClientsWithDataAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getClientsWithDataAccess:");
}

id objc_msgSend__getClusterBundleFrom_withEmbeddings_andCreationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getClusterBundleFrom:withEmbeddings:andCreationDate:");
}

id objc_msgSend__getContextEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getContextEvents:");
}

id objc_msgSend__getCurrentAppDefaultActionURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getCurrentAppDefaultActionURL");
}

id objc_msgSend__getCurrentApplicationIcon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getCurrentApplicationIcon");
}

id objc_msgSend__getCurrentSystemDefaultActionURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getCurrentSystemDefaultActionURL");
}

id objc_msgSend__getDefaultAnalyticsResultWithOnboardingStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getDefaultAnalyticsResultWithOnboardingStatus:");
}

id objc_msgSend__getDefaultFallbackFactorDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getDefaultFallbackFactorDict");
}

id objc_msgSend__getDefaultRichnessWeightDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getDefaultRichnessWeightDict");
}

id objc_msgSend__getDiagnosticReporterConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getDiagnosticReporterConfiguration:");
}

id objc_msgSend__getDistanceMatrixFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getDistanceMatrixFrom:");
}

id objc_msgSend__getEarliestDateForCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getEarliestDateForCategory:");
}

id objc_msgSend__getEarliestDateForCategory_postlaunch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getEarliestDateForCategory_postlaunch:");
}

id objc_msgSend__getEmbeddingDistanceFrom_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getEmbeddingDistanceFrom:to:");
}

id objc_msgSend__getEventBasedOnTime_category_startTime_endTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getEventBasedOnTime:category:startTime:endTime:");
}

id objc_msgSend__getEventBundleBasedOnMediaTypeEnum_playSessionMediaType_startTime_endTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getEventBundleBasedOnMediaTypeEnum:playSessionMediaType:startTime:endTime:");
}

id objc_msgSend__getEventBundleBasedOnMediaTypeEnumForThirdPartyApps_startTime_endTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getEventBundleBasedOnMediaTypeEnumForThirdPartyApps:startTime:endTime:");
}

id objc_msgSend__getEventsBasedOnTypes_isFirstPartyApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getEventsBasedOnTypes:isFirstPartyApp:");
}

id objc_msgSend__getEventsOnDay_startTime_endTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getEventsOnDay:startTime:endTime:");
}

id objc_msgSend__getFallbackStateForSetting_postlaunch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getFallbackStateForSetting_postlaunch:");
}

id objc_msgSend__getFileDescriptorForPersistenceStoreFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getFileDescriptorForPersistenceStoreFile:");
}

id objc_msgSend__getGenericNotificationErrorWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getGenericNotificationErrorWithReason:");
}

id objc_msgSend__getMediaAppCategoryPlistFileURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getMediaAppCategoryPlistFileURL");
}

id objc_msgSend__getMediaAppInfoPlistFileURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getMediaAppInfoPlistFileURL");
}

id objc_msgSend__getMediaOnRepeatMegaBundle_mediaTypeEnum_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getMediaOnRepeatMegaBundle:mediaTypeEnum:parameters:");
}

id objc_msgSend__getMediaOnRepeatMegaBundleForThirdParty_mediaTypeEnum_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getMediaOnRepeatMegaBundleForThirdParty:mediaTypeEnum:parameters:");
}

id objc_msgSend__getMetadataForTrigger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getMetadataForTrigger:");
}

id objc_msgSend__getMomentsFrameworkNotAvailableNotificationsError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getMomentsFrameworkNotAvailableNotificationsError");
}

id objc_msgSend__getNewTargetTimeToWriteEventBundlesUsingAppSchedule_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getNewTargetTimeToWriteEventBundlesUsingAppSchedule:withCompletionHandler:");
}

id objc_msgSend__getNextNotificationDateComponentsWithOptions_afterDate_numWeeks_setComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getNextNotificationDateComponentsWithOptions:afterDate:numWeeks:setComponents:");
}

id objc_msgSend__getNextScheduledCalendarNotificationTrigger(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getNextScheduledCalendarNotificationTrigger");
}

id objc_msgSend__getNextScheduledOpportunisticNotificationDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getNextScheduledOpportunisticNotificationDate");
}

id objc_msgSend__getNextUnscheduledNotificationDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getNextUnscheduledNotificationDate");
}

id objc_msgSend__getOnboardingNotCompleteNotificationsError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getOnboardingNotCompleteNotificationsError");
}

id objc_msgSend__getOpportunisticNotificationTrigger(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getOpportunisticNotificationTrigger");
}

id objc_msgSend__getPhotoMemoryPlistFileURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getPhotoMemoryPlistFileURL");
}

id objc_msgSend__getPhotosByAssetProperties_UserLocations_IsLocationCheckMandatory_MinDistance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getPhotosByAssetProperties:UserLocations:IsLocationCheckMandatory:MinDistance:");
}

id objc_msgSend__getPlayedMediaMegaBundle_mediaTypeEnum_paramters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getPlayedMediaMegaBundle:mediaTypeEnum:paramters:");
}

id objc_msgSend__getPlayedMediaMegaBundleForThirdParty_mediaTypeEnum_paramters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getPlayedMediaMegaBundleForThirdParty:mediaTypeEnum:paramters:");
}

id objc_msgSend__getRichnessScoreWeightFromConfigurationManager_withDefaultWeightDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getRichnessScoreWeightFromConfigurationManager:withDefaultWeightDict:");
}

id objc_msgSend__getSettingKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getSettingKey:");
}

id objc_msgSend__getSettingName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getSettingName:");
}

id objc_msgSend__getSnapshotDictionaryForAnalyticsWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getSnapshotDictionaryForAnalyticsWithHandler:");
}

id objc_msgSend__getSortedArrayScheduledDatesWithOptions_afterDate_numWeeks_setComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getSortedArrayScheduledDatesWithOptions:afterDate:numWeeks:setComponents:");
}

id objc_msgSend__getStateForSetting_postlaunch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getStateForSetting_postlaunch:");
}

id objc_msgSend__getThirdPartyKeyByAlbumArtist_albumOrArtist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getThirdPartyKeyByAlbumArtist:albumOrArtist:");
}

id objc_msgSend__getThirdPartyTitleKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getThirdPartyTitleKey:");
}

id objc_msgSend__getThirdPartyTitleKey_dayKey_isRecommendTab_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getThirdPartyTitleKey:dayKey:isRecommendTab:");
}

id objc_msgSend__getTimeSpanOfMOEventArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getTimeSpanOfMOEventArray:");
}

id objc_msgSend__getUnscheduledNotificationTrigger(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getUnscheduledNotificationTrigger");
}

id objc_msgSend__getVisitInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getVisitInfo:");
}

id objc_msgSend__getWorkVisitEventsDuringCall_withCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getWorkVisitEventsDuringCall:withCall:");
}

id objc_msgSend__groupBaseEventsByDay_category_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_groupBaseEventsByDay:category:");
}

id objc_msgSend__groupBundleByApps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_groupBundleByApps:");
}

id objc_msgSend__groupBundles_parameters_granularity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_groupBundles:parameters:granularity:");
}

id objc_msgSend__groupEventsByApps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_groupEventsByApps:");
}

id objc_msgSend__groupMediaPlayGroupsByTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_groupMediaPlayGroupsByTitle:");
}

id objc_msgSend__groupMediaPlaySessionsByDay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_groupMediaPlaySessionsByDay:");
}

id objc_msgSend__groupMediaPlaySessionsByTitleDay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_groupMediaPlaySessionsByTitleDay:");
}

id objc_msgSend__groupTransitBundles_parameters_granularity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_groupTransitBundles:parameters:granularity:");
}

id objc_msgSend__handoffCurrentReplyToQueue_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handoffCurrentReplyToQueue:block:");
}

id objc_msgSend__hasFirstPartyBundleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hasFirstPartyBundleID");
}

id objc_msgSend__initConnectionToService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initConnectionToService");
}

id objc_msgSend__initializeBatchedTypeDetector(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initializeBatchedTypeDetector");
}

id objc_msgSend__initializeStreamingTypeDetector(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initializeStreamingTypeDetector");
}

id objc_msgSend__isAllowedToPromptEventCategory_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isAllowedToPromptEventCategory:withReply:");
}

id objc_msgSend__isAllowedToPromptEventCategory_postlaunch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isAllowedToPromptEventCategory_postlaunch:");
}

id objc_msgSend__isAllowedToPromptResourceType_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isAllowedToPromptResourceType:withReply:");
}

id objc_msgSend__isAllowedToPromptResourceType_postlaunch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isAllowedToPromptResourceType_postlaunch:");
}

id objc_msgSend__isBundleUserInteractive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isBundleUserInteractive:");
}

id objc_msgSend__isEligibleForUnscheduledNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isEligibleForUnscheduledNotification");
}

id objc_msgSend__isFirstPartyApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isFirstPartyApp:");
}

id objc_msgSend__isInSongOnRepetBundles_mediaTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isInSongOnRepetBundles:mediaTitle:");
}

id objc_msgSend__isResourceTypeAllowedForResource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isResourceTypeAllowedForResource:");
}

id objc_msgSend__isStringUnique_inThis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isStringUnique:inThis:");
}

id objc_msgSend__isUserInOnboardingPeriod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isUserInOnboardingPeriod:");
}

id objc_msgSend__learningFromAppDenyList(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_learningFromAppDenyList");
}

id objc_msgSend__limitMOResourcesAndUpdatePriority_parameters_isSong_isFirstPartyApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_limitMOResourcesAndUpdatePriority:parameters:isSong:isFirstPartyApp:");
}

id objc_msgSend__lineSearch_initialParams_With_And_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lineSearch:initialParams:With:And:handler:");
}

id objc_msgSend__locationCheckForMergingOutingBundle_activityBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_locationCheckForMergingOutingBundle:activityBundle:");
}

id objc_msgSend__logEngagementEvent_timestamp_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logEngagementEvent:timestamp:withContext:");
}

id objc_msgSend__maximumGoodnessScoreDeltaFromBundle_toCluster_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_maximumGoodnessScoreDeltaFromBundle:toCluster:");
}

id objc_msgSend__megaBundleFromActivityTimeContextBundles_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_megaBundleFromActivityTimeContextBundles:parameters:");
}

id objc_msgSend__megaBundleFromContactBundles_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_megaBundleFromContactBundles:parameters:");
}

id objc_msgSend__megaBundlesForCoarseGranularityFromMediaPlaySessionsBundles_paramters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_megaBundlesForCoarseGranularityFromMediaPlaySessionsBundles:paramters:");
}

id objc_msgSend__megaBundlesFromMediaPlaySessionsBundles_paramters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_megaBundlesFromMediaPlaySessionsBundles:paramters:");
}

id objc_msgSend__megaBundlesFromOutingActivityTimeContextBundles_parameters_granularity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_megaBundlesFromOutingActivityTimeContextBundles:parameters:granularity:");
}

id objc_msgSend__mergeScoresToBundles_usingScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mergeScoresToBundles:usingScore:");
}

id objc_msgSend__messageInteraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_messageInteraction:");
}

id objc_msgSend__needRefreshAppInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_needRefreshAppInfo:");
}

id objc_msgSend__needsActivityRegistrationAfterRegisteringClientsForDataAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_needsActivityRegistrationAfterRegisteringClientsForDataAccess:");
}

id objc_msgSend__notificationHandlerWithNotificationRef_andOptionFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notificationHandlerWithNotificationRef:andOptionFlags:");
}

id objc_msgSend__onRoutineStateUpdate_error_currentTime_hasTimedout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onRoutineStateUpdate:error:currentTime:hasTimedout:");
}

id objc_msgSend__outgoingMessageBurstCount_bundleIdPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_outgoingMessageBurstCount:bundleIdPrefix:");
}

id objc_msgSend__pas_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pas_componentsJoinedByString:");
}

id objc_msgSend__pas_filteredArrayWithTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pas_filteredArrayWithTest:");
}

id objc_msgSend__pas_mappedArrayWithTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pas_mappedArrayWithTransform:");
}

id objc_msgSend__peopleAwarenessSubscribe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_peopleAwarenessSubscribe:");
}

id objc_msgSend__performAnnotationWithEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performAnnotationWithEvents:handler:");
}

id objc_msgSend__performAnnotationWithEvents_withPatternEvents_dateInterval_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performAnnotationWithEvents:withPatternEvents:dateInterval:handler:");
}

id objc_msgSend__performAnnotationWithEvents_withPatternEvents_eventBundles_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performAnnotationWithEvents:withPatternEvents:eventBundles:handler:");
}

id objc_msgSend__performAnnotationWithEvents_withPatternEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performAnnotationWithEvents:withPatternEvents:handler:");
}

id objc_msgSend__performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performAnnotationWithEvents:withPatternEvents:withBundleWindowStart:withBundleWindowEnd:handler:");
}

id objc_msgSend__performAnnotationWithSeed_startDate_endDate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performAnnotationWithSeed:startDate:endDate:handler:");
}

id objc_msgSend__persistEWAMetricsPrivate_withData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_persistEWAMetricsPrivate:withData:");
}

id objc_msgSend__persistMediaAppInfoPlistFile_withData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_persistMediaAppInfoPlistFile:withData:");
}

id objc_msgSend__persistPhotoMemoryPlistFile_withData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_persistPhotoMemoryPlistFile:withData:");
}

id objc_msgSend__personsFromEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_personsFromEvent:");
}

id objc_msgSend__pet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pet");
}

id objc_msgSend__placeInferencePlaceTypeFromMapItemPlaceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_placeInferencePlaceTypeFromMapItemPlaceType:");
}

id objc_msgSend__postNotificationWithTitle_message_defaultActionURL_notificationIdentifier_withIcon_usingTrigger_useSubordinateIcon_userInfo_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_postNotificationWithTitle:message:defaultActionURL:notificationIdentifier:withIcon:usingTrigger:useSubordinateIcon:userInfo:handler:");
}

id objc_msgSend__postTimeToWriteSystemNotificationUsingEventBundles_withTrigger_usingAppSchedule_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_postTimeToWriteSystemNotificationUsingEventBundles:withTrigger:usingAppSchedule:completionHandler:");
}

id objc_msgSend__printOnboardingStatusAnalytics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_printOnboardingStatusAnalytics:");
}

id objc_msgSend__printSettingValue_withType_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_printSettingValue:withType:handler:");
}

id objc_msgSend__processEvents_forDetector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processEvents:forDetector:");
}

id objc_msgSend__providerIdOfStartDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_providerIdOfStartDate:endDate:");
}

id objc_msgSend__providerIdOfTrip_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_providerIdOfTrip:");
}

id objc_msgSend__purgeEventsAndBundlesWithRefreshVariant_andCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_purgeEventsAndBundlesWithRefreshVariant:andCompletion:");
}

id objc_msgSend__purgeEventsWithContext_andRefreshVariant_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_purgeEventsWithContext:andRefreshVariant:andHandler:");
}

id objc_msgSend__readEWAPlistFilePrivate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readEWAPlistFilePrivate:");
}

id objc_msgSend__readMediaAppInfoPlistFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readMediaAppInfoPlistFile:");
}

id objc_msgSend__readPhotoMemoryPlistFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readPhotoMemoryPlistFile:");
}

id objc_msgSend__recordDedupeKey_alreadySeenKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_recordDedupeKey:alreadySeenKeys:");
}

id objc_msgSend__recordResource_alreadySeenKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_recordResource:alreadySeenKeys:");
}

id objc_msgSend__redactString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_redactString:");
}

id objc_msgSend__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_refreshEventsWithContext:andRefreshVariant:andSoftKindFlag:andHandler:");
}

id objc_msgSend__registerApplicationsForDataAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerApplicationsForDataAccess:");
}

id objc_msgSend__registerClientsForDataAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerClientsForDataAccess:");
}

id objc_msgSend__registerForOnboardingRefresh_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerForOnboardingRefresh:");
}

id objc_msgSend__rehydrateConversations_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydrateConversations:handler:");
}

id objc_msgSend__rehydrateEventBundles_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydrateEventBundles:withHandler:");
}

id objc_msgSend__rehydrateEvents_andCreateNewEventsfromMotionActivity_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydrateEvents:andCreateNewEventsfromMotionActivity:handler:");
}

id objc_msgSend__rehydrateEvents_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydrateEvents:withHandler:");
}

id objc_msgSend__rehydrateEventsBySingleSource_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydrateEventsBySingleSource:handler:");
}

id objc_msgSend__rehydrateLifeEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydrateLifeEvents:handler:");
}

id objc_msgSend__rehydrateMotionActivity_forLocationSetting_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydrateMotionActivity:forLocationSetting:handler:");
}

id objc_msgSend__rehydratePeopleDensityEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydratePeopleDensityEvents:handler:");
}

id objc_msgSend__rehydratePhotoMemories_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydratePhotoMemories:handler:");
}

id objc_msgSend__rehydrateProx_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydrateProx:handler:");
}

id objc_msgSend__rehydrateSharedPhotos_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydrateSharedPhotos:handler:");
}

id objc_msgSend__rehydrateStateOfMind_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydrateStateOfMind:handler:");
}

id objc_msgSend__rehydrateStoreEvents_withVisits_familiarityIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydrateStoreEvents:withVisits:familiarityIndex:");
}

id objc_msgSend__rehydrateStoredEvents_fromConversations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydrateStoredEvents:fromConversations:");
}

id objc_msgSend__rehydrateStoredEvents_fromMindfulSession_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydrateStoredEvents:fromMindfulSession:handler:");
}

id objc_msgSend__rehydrateStoredEvents_fromPeopleDensityEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydrateStoredEvents:fromPeopleDensityEvents:");
}

id objc_msgSend__rehydrateStoredEvents_fromPhotoMemories_fetchResult_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydrateStoredEvents:fromPhotoMemories:fetchResult:handler:");
}

id objc_msgSend__rehydrateStoredEvents_fromProxEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydrateStoredEvents:fromProxEvents:");
}

id objc_msgSend__rehydrateStoredEvents_fromStateOfMind_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydrateStoredEvents:fromStateOfMind:handler:");
}

id objc_msgSend__rehydrateStoredEvents_fromWorkouts_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydrateStoredEvents:fromWorkouts:handler:");
}

id objc_msgSend__rehydrateStoredLifeEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydrateStoredLifeEvents:");
}

id objc_msgSend__rehydrateVisits_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydrateVisits:handler:");
}

id objc_msgSend__rehydrateWeather_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydrateWeather:handler:");
}

id objc_msgSend__rehydrateWorkouts_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydrateWorkouts:handler:");
}

id objc_msgSend__rehydratedMediaEvents_usingNowPlayingEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydratedMediaEvents:usingNowPlayingEvents:");
}

id objc_msgSend__rehydratedMediaPlayEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydratedMediaPlayEvents:handler:");
}

id objc_msgSend__rehydratedMediaSessionsForEvents_usingNowPlayingEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rehydratedMediaSessionsForEvents:usingNowPlayingEvents:");
}

id objc_msgSend__removeDuplicateAssetsForBundleType_bundleSuperType_musicAlbumSet_podcastEpisodeSet_isRecommendTab_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeDuplicateAssetsForBundleType:bundleSuperType:musicAlbumSet:podcastEpisodeSet:isRecommendTab:");
}

id objc_msgSend__removeDuplicateFromResource_nonMediaKeySet_mediaOnRepeatDict_eventBundleDayKey_keyName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeDuplicateFromResource:nonMediaKeySet:mediaOnRepeatDict:eventBundleDayKey:keyName:");
}

id objc_msgSend__removeDuplicateFromResourceThridParty_mediaKeySet_dayKey_isRecommendTab_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeDuplicateFromResourceThridParty:mediaKeySet:dayKey:isRecommendTab:");
}

id objc_msgSend__removeDuplicatePhotoResourceFromActivityBundles_compareWithHomeBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeDuplicatePhotoResourceFromActivityBundles:compareWithHomeBundle:");
}

id objc_msgSend__removeEntriesInPlist_forCategory_forURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeEntriesInPlist:forCategory:forURL:");
}

id objc_msgSend__removeMotionActivityDeletedAtSource_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeMotionActivityDeletedAtSource:handler:");
}

id objc_msgSend__removeOldMediaAppCategoryPlistFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeOldMediaAppCategoryPlistFile:");
}

id objc_msgSend__removePeopleDensityEventsDeletedAtSource_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removePeopleDensityEventsDeletedAtSource:handler:");
}

id objc_msgSend__removeProxDeletedAtSource_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeProxDeletedAtSource:handler:");
}

id objc_msgSend__removeSuggestedEventsDeletedAtSource_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeSuggestedEventsDeletedAtSource:handler:");
}

id objc_msgSend__removeTripEventsDeletedAtSource_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeTripEventsDeletedAtSource:handler:");
}

id objc_msgSend__removeVisitsDeletedAtSource_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeVisitsDeletedAtSource:handler:");
}

id objc_msgSend__routineStartCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_routineStartCheck:");
}

id objc_msgSend__runAnalyticsWithContext_andRefreshVariant_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runAnalyticsWithContext:andRefreshVariant:andHandler:");
}

id objc_msgSend__saveConversations_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveConversations:handler:");
}

id objc_msgSend__saveEvents_category_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveEvents:category:handler:");
}

id objc_msgSend__saveEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveEvents:handler:");
}

id objc_msgSend__saveMediaPlayGroupsByDayTitle_startDate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveMediaPlayGroupsByDayTitle:startDate:handler:");
}

id objc_msgSend__saveMediaPlaySessionsEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveMediaPlaySessionsEvents:handler:");
}

id objc_msgSend__saveMindfulSessions_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveMindfulSessions:handler:");
}

id objc_msgSend__savePeopleDensityEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_savePeopleDensityEvents:handler:");
}

id objc_msgSend__savePropertyToDictionary_withKey_andValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_savePropertyToDictionary:withKey:andValue:");
}

id objc_msgSend__saveTimeOfLastIncident(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveTimeOfLastIncident");
}

id objc_msgSend__saveToDictionary_object_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveToDictionary:object:forKey:");
}

id objc_msgSend__saveWorkouts_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveWorkouts:handler:");
}

id objc_msgSend__sceneLabelsForSceneClassifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sceneLabelsForSceneClassifications:");
}

id objc_msgSend__scheduleDatabaseUpgradeWithContext_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scheduleDatabaseUpgradeWithContext:andHandler:");
}

id objc_msgSend__scheduleMediaAnalysisDeferredProcessing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scheduleMediaAnalysisDeferredProcessing:");
}

id objc_msgSend__scheduleSendBarrierBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scheduleSendBarrierBlock:");
}

id objc_msgSend__serviceSuggestionsNotificationsEnablingTest_withOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serviceSuggestionsNotificationsEnablingTest:withOptions:completionHandler:");
}

id objc_msgSend__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serviceSuggestionsNotificationsInternalUsingTrigger:useAppSchedule:completionHandler:");
}

id objc_msgSend__serviceSuggestionsNotificationsTestForBundle_usingTrigger_useAppSchedule_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serviceSuggestionsNotificationsTestForBundle:usingTrigger:useAppSchedule:completionHandler:");
}

id objc_msgSend__setDynamicProperties_familiarityIndexResultsLOIs_visit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDynamicProperties:familiarityIndexResultsLOIs:visit:");
}

id objc_msgSend__setDynamicProperties_mediaPlay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDynamicProperties:mediaPlay:");
}

id objc_msgSend__setDynamicProperties_mindfulSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDynamicProperties:mindfulSession:");
}

id objc_msgSend__setDynamicProperties_stateOfMind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDynamicProperties:stateOfMind:");
}

id objc_msgSend__setDynamicProperties_visit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDynamicProperties:visit:");
}

id objc_msgSend__setDynamicProperties_workout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDynamicProperties:workout:");
}

id objc_msgSend__setDynamicPropertiesForEvent_fromCoversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDynamicPropertiesForEvent:fromCoversation:");
}

id objc_msgSend__setDynamicPropertiesForMemoryEvent_fromMemory_keyAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDynamicPropertiesForMemoryEvent:fromMemory:keyAsset:");
}

id objc_msgSend__setMotionTypeAndDurationFor_fromMotionActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setMotionTypeAndDurationFor:fromMotionActivity:");
}

id objc_msgSend__setToIdentityMatrix_forNumRows_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setToIdentityMatrix:forNumRows:");
}

id objc_msgSend__sharedWithYouEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sharedWithYouEnabled");
}

id objc_msgSend__shouldConsiderEventCategory_postlaunch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldConsiderEventCategory_postlaunch:");
}

id objc_msgSend__shouldConsiderResourceType_postlaunch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldConsiderResourceType_postlaunch:");
}

id objc_msgSend__shouldEventBeDeleted_patternDict_forkey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldEventBeDeleted:patternDict:forkey:");
}

id objc_msgSend__shouldMarkAsPreOnboardedVisit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldMarkAsPreOnboardedVisit:");
}

id objc_msgSend__shouldMergeBundle_toCluster_parameters_granularity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldMergeBundle:toCluster:parameters:granularity:");
}

id objc_msgSend__shouldMergeBundleForCoarseGranularity_toCluster_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldMergeBundleForCoarseGranularity:toCluster:parameters:");
}

id objc_msgSend__shouldMergeBundleForFineGranularity_toCluster_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldMergeBundleForFineGranularity:toCluster:parameters:");
}

id objc_msgSend__shouldMergeTransitBundle_toCluster_parameters_granularity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldMergeTransitBundle:toCluster:parameters:granularity:");
}

id objc_msgSend__shouldMergeTransitBundleForFineGranularity_toCluster_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldMergeTransitBundleForFineGranularity:toCluster:parameters:");
}

id objc_msgSend__shouldRemoveBundle_checkVisibilityCategoryForUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldRemoveBundle:checkVisibilityCategoryForUI:");
}

id objc_msgSend__sortAndMergeBundlesForThirdPartyApps_playtimeDict_paramters_mediaActionIsRepeat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sortAndMergeBundlesForThirdPartyApps:playtimeDict:paramters:mediaActionIsRepeat:");
}

id objc_msgSend__sortBundlesBySumPlaytime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sortBundlesBySumPlaytime:");
}

id objc_msgSend__sortResourcesByPriorityScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sortResourcesByPriorityScore:");
}

id objc_msgSend__sortResourcesBySumPlaytime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sortResourcesBySumPlaytime:");
}

id objc_msgSend__statsForContactFromEventBundles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_statsForContactFromEventBundles:");
}

id objc_msgSend__storeEvents_withContext_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_storeEvents:withContext:andHandler:");
}

id objc_msgSend__stripMediaActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stripMediaActions:");
}

id objc_msgSend__submitEventBundleRankingAnalytics_withRankingInput_andSubmissionDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_submitEventBundleRankingAnalytics:withRankingInput:andSubmissionDate:");
}

id objc_msgSend__submitRankingParamsAnalytics_withSubmissionDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_submitRankingParamsAnalytics:withSubmissionDate:");
}

id objc_msgSend__submitSuggestionPerformanceAnalyticsFromEventBundles_WithOnboardingStatus_andCompletionResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_submitSuggestionPerformanceAnalyticsFromEventBundles:WithOnboardingStatus:andCompletionResult:");
}

id objc_msgSend__suppressDuplicateContactBundles_comparedWithContactTrendbundles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_suppressDuplicateContactBundles:comparedWithContactTrendbundles:");
}

id objc_msgSend__suppressDuplicateHomeBundles_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_suppressDuplicateHomeBundles:parameters:");
}

id objc_msgSend__testDatum_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_testDatum:");
}

id objc_msgSend__timeZoneAtLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_timeZoneAtLocation:");
}

id objc_msgSend__timeZoneFromLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_timeZoneFromLocation:");
}

id objc_msgSend__totalDistanceInCanonicalUnit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_totalDistanceInCanonicalUnit");
}

id objc_msgSend__totalEnergyBurnedInCanonicalUnit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_totalEnergyBurnedInCanonicalUnit");
}

id objc_msgSend__trendsWithRefreshVariant_andCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_trendsWithRefreshVariant:andCompletion:");
}

id objc_msgSend__updateCachedRoutineStateWithCurrentTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateCachedRoutineStateWithCurrentTime:");
}

id objc_msgSend__updateClassificationForEvent_withClassificationDict_contactDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateClassificationForEvent:withClassificationDict:contactDict:");
}

id objc_msgSend__updateClassificationForEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateClassificationForEvents:");
}

id objc_msgSend__updateConversationsDeletedAtSource_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateConversationsDeletedAtSource:handler:");
}

id objc_msgSend__updateDeviceLocationsForMotionEvents_forLocationSetting_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateDeviceLocationsForMotionEvents:forLocationSetting:handler:");
}

id objc_msgSend__updateEventsDeletedAtSingleSource_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateEventsDeletedAtSingleSource:handler:");
}

id objc_msgSend__updateFeatureGroupEWADict_withCurrentFeature_andCurrentEvent_andCurrentEventTimeStamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateFeatureGroupEWADict:withCurrentFeature:andCurrentEvent:andCurrentEventTimeStamp:");
}

id objc_msgSend__updateIdentifiersForEventBundles_eventIDsToBundleIDMapping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateIdentifiersForEventBundles:eventIDsToBundleIDMapping:");
}

id objc_msgSend__updateIdentifiersForEvergreenBundles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateIdentifiersForEvergreenBundles:");
}

id objc_msgSend__updateLearnFromAppStatusTable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLearnFromAppStatusTable:");
}

id objc_msgSend__updateLongTermBundles_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLongTermBundles:context:");
}

id objc_msgSend__updateMOEventWithEndDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateMOEventWithEndDate:endDate:");
}

id objc_msgSend__updateMOPlacePriorityScore_priorityScore_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateMOPlacePriorityScore:priorityScore:handler:");
}

id objc_msgSend__updateMOResourceDictionary_dictKey_dictValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateMOResourceDictionary:dictKey:dictValue:");
}

id objc_msgSend__updateMediaPlayEventsDeletedAtSource_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateMediaPlayEventsDeletedAtSource:handler:");
}

id objc_msgSend__updateMediaPlaySessionEventsDeletedAtSource_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateMediaPlaySessionEventsDeletedAtSource:handler:");
}

id objc_msgSend__updateMetadataOfMotionEvents_withMotionActities_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateMetadataOfMotionEvents:withMotionActities:handler:");
}

id objc_msgSend__updatePhotoEventsDeletedAtSource_library_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePhotoEventsDeletedAtSource:library:handler:");
}

id objc_msgSend__updatePhotoMemoriesDeletedAtSource_library_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePhotoMemoriesDeletedAtSource:library:handler:");
}

id objc_msgSend__updateRankingDictionary_mediaLength_sumPlaytime_mediaActionIsRepeat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateRankingDictionary:mediaLength:sumPlaytime:mediaActionIsRepeat:");
}

id objc_msgSend__updateRankingParamsMO_with_forEvergreenScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateRankingParamsMO:with:forEvergreenScore:");
}

id objc_msgSend__updateSharedContentsDeletedAtSource_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSharedContentsDeletedAtSource:handler:");
}

id objc_msgSend__updateWorkoutsDeletedAtSource_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateWorkoutsDeletedAtSource:handler:");
}

id objc_msgSend__userConsentCompleted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_userConsentCompleted");
}

id objc_msgSend__usingAppSchedule(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_usingAppSchedule");
}

id objc_msgSend__validResource_bundle_denyList_sourceAppBundleIds_removedAppBundleIds_lftaStatusDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validResource:bundle:denyList:sourceAppBundleIds:removedAppBundleIds:lftaStatusDict:");
}

id objc_msgSend__visitAlreadyHaveValidEvent_Events_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_visitAlreadyHaveValidEvent:Events:");
}

id objc_msgSend__workoutActivityTypeFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_workoutActivityTypeFromString:");
}

id objc_msgSend_aboveDoorShortAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aboveDoorShortAddress");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_accessTypeFromActionType_actionSubtype_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessTypeFromActionType:actionSubtype:");
}

id objc_msgSend_acquireRefreshLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireRefreshLock");
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "action");
}

id objc_msgSend_actionFromBaseEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionFromBaseEvents:");
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionIdentifier");
}

id objc_msgSend_actionMetaData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionMetaData");
}

id objc_msgSend_actionName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionName");
}

id objc_msgSend_actionNameConfidence(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionNameConfidence");
}

id objc_msgSend_actionNameFromLifeEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionNameFromLifeEvent:");
}

id objc_msgSend_actionSubType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionSubType");
}

id objc_msgSend_actionSubtype(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionSubtype");
}

id objc_msgSend_actionType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionType");
}

id objc_msgSend_actionTypeFromLifeEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionTypeFromLifeEvent:");
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actions");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activate");
}

id objc_msgSend_activityContextEmbedding(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityContextEmbedding");
}

id objc_msgSend_activityInterfaceTypeEngagementWeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityInterfaceTypeEngagementWeight");
}

id objc_msgSend_activitySummary_suppressionGoodnessScoreThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activitySummary_suppressionGoodnessScoreThreshold");
}

id objc_msgSend_activityTypeFromPhotoTraitsHistogram(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityTypeFromPhotoTraitsHistogram");
}

id objc_msgSend_addActionsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addActionsObject:");
}

id objc_msgSend_addBackgroundAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addBackgroundAction:");
}

id objc_msgSend_addBundlesToDataExportSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addBundlesToDataExportSession:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEvent:");
}

id objc_msgSend_addEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEvents:");
}

id objc_msgSend_addEventsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEventsObject:");
}

id objc_msgSend_addEventsToDataExportSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEventsToDataExportSession:");
}

id objc_msgSend_addFinishBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFinishBlock:");
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIndex:");
}

id objc_msgSend_addInteraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addInteraction:");
}

id objc_msgSend_addMetaDataForRankForKey_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMetaDataForRankForKey:value:");
}

id objc_msgSend_addMetadataToDataExportSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMetadataToDataExportSession:");
}

id objc_msgSend_addNotificationRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNotificationRequest:withCompletionHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addPeopleDensityContextForEventBundle_sortedBaseEvents_contextEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPeopleDensityContextForEventBundle:sortedBaseEvents:contextEvents:");
}

id objc_msgSend_addPersonRelationshipsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPersonRelationshipsObject:");
}

id objc_msgSend_addPersonsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPersonsObject:");
}

id objc_msgSend_addPhotoResources_universe_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPhotoResources:universe:handler:");
}

id objc_msgSend_addPhotoResourcesWithDateArray_universe_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPhotoResourcesWithDateArray:universe:handler:");
}

id objc_msgSend_addPhotoTraitsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPhotoTraitsObject:");
}

id objc_msgSend_addPlacesObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPlacesObject:");
}

id objc_msgSend_addRankingModelToDataExportSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRankingModelToDataExportSession:");
}

id objc_msgSend_addResource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addResource:");
}

id objc_msgSend_addResources_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addResources:");
}

id objc_msgSend_addResourcesFromOutingBundle_toActivityBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addResourcesFromOutingBundle:toActivityBundle:");
}

id objc_msgSend_addResourcesObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addResourcesObject:");
}

id objc_msgSend_addSocialContextForEventBundle_sortedBaseEvents_contextEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSocialContextForEventBundle:sortedBaseEvents:contextEvents:");
}

id objc_msgSend_addStateOfMindMetaDataForRankForBundle_withEmotionEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addStateOfMindMetaDataForRankForBundle:withEmotionEvents:");
}

id objc_msgSend_addStateOfMindResourceForBundle_withEmotionEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addStateOfMindResourceForBundle:withEmotionEvents:");
}

id objc_msgSend_addTimeOverlapsScoreForEventBundle_baseEvents_contextEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTimeOverlapsScoreForEventBundle:baseEvents:contextEvents:");
}

id objc_msgSend_addVisitEvent_toTripBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addVisitEvent:toTripBundle:");
}

id objc_msgSend_addedCharacters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addedCharacters");
}

id objc_msgSend_addedCharactersAppEntry(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addedCharactersAppEntry");
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "address");
}

id objc_msgSend_addressFormatOption(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addressFormatOption");
}

id objc_msgSend_adjacentKeywordsForEventBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjacentKeywordsForEventBundle:");
}

id objc_msgSend_adjustmentVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustmentVersion");
}

id objc_msgSend_administrativeArea(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "administrativeArea");
}

id objc_msgSend_administrativeAreaCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "administrativeAreaCode");
}

id objc_msgSend_age(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "age");
}

id objc_msgSend_ageRange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ageRange");
}

id objc_msgSend_aggregateBundles_withParameters_granularity_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aggregateBundles:withParameters:granularity:handler:");
}

id objc_msgSend_aggregateBundles_withParameters_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aggregateBundles:withParameters:handler:");
}

id objc_msgSend_aggregateEventBundles_withAggregtaionDateInterval_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aggregateEventBundles:withAggregtaionDateInterval:handler:");
}

id objc_msgSend_aggregationDateInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aggregationDateInterval");
}

id objc_msgSend_aggregationDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aggregationDuration");
}

id objc_msgSend_aggregationMethod(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aggregationMethod");
}

id objc_msgSend_aggregationWindowMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aggregationWindowMap");
}

id objc_msgSend_album(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "album");
}

id objc_msgSend_all(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "all");
}

id objc_msgSend_allContactIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allContactIdentifiers");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allPhotoAssetsFromBundleStartDay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allPhotoAssetsFromBundleStartDay:");
}

id objc_msgSend_allPlaceNames(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allPlaceNames");
}

id objc_msgSend_allResources(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allResources");
}

id objc_msgSend_allStateOfMindIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allStateOfMindIdentifiers");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allowDuplicatedWorkouts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowDuplicatedWorkouts");
}

id objc_msgSend_allowedSourceTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowedSourceTypes");
}

id objc_msgSend_analysisService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analysisService");
}

id objc_msgSend_analyzeEvents_analyticsPlans_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analyzeEvents:analyticsPlans:handler:");
}

id objc_msgSend_analyzeEvents_options_resultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analyzeEvents:options:resultHandler:");
}

id objc_msgSend_andPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "andPredicateWithSubpredicates:");
}

id objc_msgSend_andStringFromArray_propertyPath_maxCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "andStringFromArray:propertyPath:maxCount:");
}

id objc_msgSend_annotateAnomalyBundles_withEmbeddings_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotateAnomalyBundles:withEmbeddings:handler:");
}

id objc_msgSend_annotateBaseEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotateBaseEvents:");
}

id objc_msgSend_annotateBaseEvents_contextEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotateBaseEvents:contextEvents:");
}

id objc_msgSend_annotateBaseEvents_dateInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotateBaseEvents:dateInterval:");
}

id objc_msgSend_annotateEventBundle_dateIntervalEvents_emotionEvents_bundleDurationThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotateEventBundle:dateIntervalEvents:emotionEvents:bundleDurationThreshold:");
}

id objc_msgSend_annotateEventBundle_dateIntervalEvents_playbackMediaEvents_lessSignificantPlaySessionMediaTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotateEventBundle:dateIntervalEvents:playbackMediaEvents:lessSignificantPlaySessionMediaTypes:");
}

id objc_msgSend_annotateEventBundle_dateIntervalEvents_playbackMediaEvents_mediaDurationThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotateEventBundle:dateIntervalEvents:playbackMediaEvents:mediaDurationThreshold:");
}

id objc_msgSend_annotateEventBundle_dateIntervalEvents_playbackMediaEvents_mediaDurationThreshold_lessSignificantPlaySessionMediaTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotateEventBundle:dateIntervalEvents:playbackMediaEvents:mediaDurationThreshold:lessSignificantPlaySessionMediaTypes:");
}

id objc_msgSend_annotateEventBundle_playbackMediaEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotateEventBundle:playbackMediaEvents:");
}

id objc_msgSend_annotateEventBundle_playbackMediaEvents_lessSignificantPlaySessionMediaTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotateEventBundle:playbackMediaEvents:lessSignificantPlaySessionMediaTypes:");
}

id objc_msgSend_annotateEventBundle_visitEvents_poiCategoryBlocklist_mediumConfidenceThreshold_highConfidenceThreshold_aoiConfidenceThreshold_universe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotateEventBundle:visitEvents:poiCategoryBlocklist:mediumConfidenceThreshold:highConfidenceThreshold:aoiConfidenceThreshold:universe:");
}

id objc_msgSend_annotateEventBundle_withContextEvents_andBaseEventReference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotateEventBundle:withContextEvents:andBaseEventReference:");
}

id objc_msgSend_aoiMergingRangeMinimumThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aoiMergingRangeMinimumThreshold");
}

id objc_msgSend_aoiRangeWeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aoiRangeWeight");
}

id objc_msgSend_aoiVisitLabelConfidentThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aoiVisitLabelConfidentThreshold");
}

id objc_msgSend_appBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appBundle");
}

id objc_msgSend_appEntryEngagementEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appEntryEngagementEvents");
}

id objc_msgSend_appEntryEventTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appEntryEventTimestamp");
}

id objc_msgSend_appEntryEventToEnum_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appEntryEventToEnum:");
}

id objc_msgSend_appEntryEventToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appEntryEventToString:");
}

id objc_msgSend_appEntryEventType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appEntryEventType");
}

id objc_msgSend_appEntryTypeToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appEntryTypeToString:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendDefaultMetaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendDefaultMetaData:");
}

id objc_msgSend_appendDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendDouble:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendInteger:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_applyAOIBasedGroupingOnEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyAOIBasedGroupingOnEvents:");
}

id objc_msgSend_applyNameBasedGroupingOnEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyNameBasedGroupingOnEvents:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_areaOfInterests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "areaOfInterests");
}

id objc_msgSend_areasOfInterest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "areasOfInterest");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_artist(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artist");
}

id objc_msgSend_ascending(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ascending");
}

id objc_msgSend_assetPriorityScoringForTimeAtHomeBundlesWithBundle_withMediaResources_withPhotoResources_withEmotionResources_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetPriorityScoringForTimeAtHomeBundlesWithBundle:withMediaResources:withPhotoResources:withEmotionResources:");
}

id objc_msgSend_assetUserActivityProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetUserActivityProperties");
}

id objc_msgSend_assets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assets");
}

id objc_msgSend_assetsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetsCount");
}

id objc_msgSend_associateEventBundles_effectiveInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "associateEventBundles:effectiveInterval:");
}

id objc_msgSend_associatedEventPermission(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "associatedEventPermission");
}

id objc_msgSend_associations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "associations");
}

id objc_msgSend_attributions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributions");
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authorizationStatus");
}

id objc_msgSend_automotive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "automotive");
}

id objc_msgSend_autoupdatingCurrentLocale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "autoupdatingCurrentLocale");
}

id objc_msgSend_availability(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "availability");
}

id objc_msgSend_averageLocationFromLocations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "averageLocationFromLocations:");
}

id objc_msgSend_avgSubBundleGoodnessScores(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "avgSubBundleGoodnessScores");
}

id objc_msgSend_backgroundActions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundActions");
}

id objc_msgSend_bagForProfile_profileVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bagForProfile:profileVersion:");
}

id objc_msgSend_beginDataExport(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginDataExport");
}

id objc_msgSend_betweenDate_andDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "betweenDate:andDate:");
}

id objc_msgSend_bfsStartingFrom_connectedPartIndx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bfsStartingFrom:connectedPartIndx:");
}

id objc_msgSend_bgColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bgColor");
}

id objc_msgSend_binForNumber_bins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "binForNumber:bins:");
}

id objc_msgSend_binsFromStart_toEnd_gap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "binsFromStart:toEnd:gap:");
}

id objc_msgSend_biologicalSex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "biologicalSex");
}

id objc_msgSend_biologicalSexWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "biologicalSexWithError:");
}

id objc_msgSend_biomeManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "biomeManager");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_BOOLeanKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLeanKeys");
}

id objc_msgSend_BOOLeanValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLeanValue");
}

id objc_msgSend_bprRegularizationFactor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bprRegularizationFactor");
}

id objc_msgSend_bucketedKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bucketedKeys");
}

id objc_msgSend_buildActivityMetaDataForEventBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildActivityMetaDataForEventBundle:");
}

id objc_msgSend_buildAnalyticsPlans(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildAnalyticsPlans");
}

id objc_msgSend_buildClusteringMetaDataForEventBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildClusteringMetaDataForEventBundle:");
}

id objc_msgSend_buildEvergreenMetaDataForEventBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildEvergreenMetaDataForEventBundle:");
}

id objc_msgSend_buildLabelsForEventBundles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildLabelsForEventBundles:");
}

id objc_msgSend_buildMediaPlayMetaDataForEventBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildMediaPlayMetaDataForEventBundle:");
}

id objc_msgSend_buildMetaDataForEventBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildMetaDataForEventBundle:");
}

id objc_msgSend_buildOutingMetaDataForEventBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildOutingMetaDataForEventBundle:");
}

id objc_msgSend_buildPhotoMemoryMetaDataForEventBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildPhotoMemoryMetaDataForEventBundle:");
}

id objc_msgSend_buildPromptDescriptionForEventBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildPromptDescriptionForEventBundle:");
}

id objc_msgSend_buildRankingMetaDataDict_withBaseEvents_andContextEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildRankingMetaDataDict:withBaseEvents:andContextEvents:");
}

id objc_msgSend_buildResources(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildResources");
}

id objc_msgSend_buildSharedContentMetaDataForEventBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildSharedContentMetaDataForEventBundle:");
}

id objc_msgSend_buildSignificantContactMetaDataForEventBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildSignificantContactMetaDataForEventBundle:");
}

id objc_msgSend_buildSimpleMealTagIntervalsForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildSimpleMealTagIntervalsForDate:");
}

id objc_msgSend_buildSimpleTimeTagIntervalsForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildSimpleTimeTagIntervalsForDate:");
}

id objc_msgSend_buildStateOfMindMetaDataForEventBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildStateOfMindMetaDataForEventBundle:");
}

id objc_msgSend_buildTimeAtHomeMetaDataForEventBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildTimeAtHomeMetaDataForEventBundle:");
}

id objc_msgSend_buildTimeContextMetaDataForEventBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildTimeContextMetaDataForEventBundle:");
}

id objc_msgSend_buildTimeContextTransitMetaDataForEventBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildTimeContextTransitMetaDataForEventBundle:");
}

id objc_msgSend_buildTimeTagIntervalsForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildTimeTagIntervalsForDate:");
}

id objc_msgSend_buildTrendMetaDataForEventBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildTrendMetaDataForEventBundle:");
}

id objc_msgSend_buildTripMetaDataForEventBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildTripMetaDataForEventBundle:");
}

id objc_msgSend_builder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "builder");
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundle");
}

id objc_msgSend_bundleActionType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleActionType");
}

id objc_msgSend_bundleBaseEventCateory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleBaseEventCateory");
}

id objc_msgSend_bundleClusteringManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleClusteringManager");
}

id objc_msgSend_bundleCreationDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleCreationDate");
}

id objc_msgSend_bundleEndDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleEndDate");
}

id objc_msgSend_bundleEventIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleEventIDs");
}

id objc_msgSend_bundleEventsWithRefreshVariant_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleEventsWithRefreshVariant:andHandler:");
}

id objc_msgSend_bundleEvergreenType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleEvergreenType");
}

id objc_msgSend_bundleEvergreenTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleEvergreenTypes");
}

id objc_msgSend_bundleExpirationDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleExpirationDate");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleGoodnessScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleGoodnessScore");
}

id objc_msgSend_bundleGoodnessScoreThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleGoodnessScoreThreshold");
}

id objc_msgSend_bundleHasOneWayRoute_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleHasOneWayRoute:parameters:");
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleID");
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleId");
}

id objc_msgSend_bundleIdAppInfoMappings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdAppInfoMappings");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleIncludesAnomalousEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIncludesAnomalousEvent");
}

id objc_msgSend_bundleInterface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleInterface");
}

id objc_msgSend_bundleInterfaceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleInterfaceType");
}

id objc_msgSend_bundleInterfaceTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleInterfaceTypes");
}

id objc_msgSend_bundleManagementPolicy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleManagementPolicy");
}

id objc_msgSend_bundleNameFromBundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleNameFromBundleId:");
}

id objc_msgSend_bundlePCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundlePCount");
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundlePath");
}

id objc_msgSend_bundlePlaceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundlePlaceType");
}

id objc_msgSend_bundlePlaceUserType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundlePlaceUserType");
}

id objc_msgSend_bundlePromptLanguageFormat(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundlePromptLanguageFormat");
}

id objc_msgSend_bundleRecencyDaysElapsed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleRecencyDaysElapsed");
}

id objc_msgSend_bundleRichnessDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleRichnessDict");
}

id objc_msgSend_bundleSourceBooksExists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleSourceBooksExists");
}

id objc_msgSend_bundleSourceHealthExists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleSourceHealthExists");
}

id objc_msgSend_bundleSourceMotionExists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleSourceMotionExists");
}

id objc_msgSend_bundleSourcePDExists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleSourcePDExists");
}

id objc_msgSend_bundleSourcePhotoExists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleSourcePhotoExists");
}

id objc_msgSend_bundleSourcePostAnalyticsExists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleSourcePostAnalyticsExists");
}

id objc_msgSend_bundleSourceProactiveExists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleSourceProactiveExists");
}

id objc_msgSend_bundleSourceRoutineExists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleSourceRoutineExists");
}

id objc_msgSend_bundleSourceScreenTimeExists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleSourceScreenTimeExists");
}

id objc_msgSend_bundleSourceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleSourceType");
}

id objc_msgSend_bundleStartDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleStartDate");
}

id objc_msgSend_bundleSubType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleSubType");
}

id objc_msgSend_bundleSubTypeToAnalyticsSuggestionTypeMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleSubTypeToAnalyticsSuggestionTypeMap");
}

id objc_msgSend_bundleSuperType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleSuperType");
}

id objc_msgSend_bundleTimeTag(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleTimeTag");
}

id objc_msgSend_bundleType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleType");
}

id objc_msgSend_bundleVisitMapItemSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleVisitMapItemSource");
}

id objc_msgSend_bundleVisitPlaceLabelGranularity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleVisitPlaceLabelGranularity");
}

id objc_msgSend_bundleVisitPlaceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleVisitPlaceType");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_burstyInteractionCountFeatureNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "burstyInteractionCountFeatureNormalized");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bytes");
}

id objc_msgSend_cNContactIdentifierFromPPContactIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cNContactIdentifierFromPPContactIdentifier:");
}

id objc_msgSend_cacheEndDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheEndDate");
}

id objc_msgSend_cacheStartDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheStartDate");
}

id objc_msgSend_cachedEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedEvents");
}

id objc_msgSend_calculateAndSetMetricsForCorrelatedEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calculateAndSetMetricsForCorrelatedEvents:");
}

id objc_msgSend_calculateAndSetMetricsForRawEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calculateAndSetMetricsForRawEvents:");
}

id objc_msgSend_calculateAndSetMetricsForSemanticallyBundledEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calculateAndSetMetricsForSemanticallyBundledEvents:");
}

id objc_msgSend_calculateConnectedComponentWithGraphTraversal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calculateConnectedComponentWithGraphTraversal:");
}

id objc_msgSend_calculateDeltaTime_fromPreviousTime_withBinArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calculateDeltaTime:fromPreviousTime:withBinArray:");
}

id objc_msgSend_calculateEventBundlesFromEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calculateEventBundlesFromEvents:");
}

id objc_msgSend_calculateZeroCountsForEvents_withCalendar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calculateZeroCountsForEvents:withCalendar:");
}

id objc_msgSend_calendarWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calendarWithIdentifier:");
}

id objc_msgSend_callDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callDuration");
}

id objc_msgSend_callDurationFeatureNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callDurationFeatureNormalized");
}

id objc_msgSend_callPlace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callPlace");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancel");
}

id objc_msgSend_capitalizationType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "capitalizationType");
}

id objc_msgSend_capitalizationTypeFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "capitalizationTypeFromString:");
}

id objc_msgSend_capitalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "capitalized");
}

id objc_msgSend_capitalizedStringWithLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "capitalizedStringWithLocale:");
}

id objc_msgSend_captureCurrentDBStateForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "captureCurrentDBStateForTrigger:withFeedback:additionalMetadata:shouldUpload:andHandler:");
}

id objc_msgSend_castEvergreenSubType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "castEvergreenSubType:");
}

id objc_msgSend_categories(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "categories");
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "category");
}

id objc_msgSend_categoryTypeForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "categoryTypeForIdentifier:");
}

id objc_msgSend_categoryWithIdentifier_actions_intentIdentifiers_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "categoryWithIdentifier:actions:intentIdentifiers:options:");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_characterIsMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterIsMember:");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_checkAuthorizationStatusForNotificationCenter_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkAuthorizationStatusForNotificationCenter:completion:");
}

id objc_msgSend_checkConditionForMetaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkConditionForMetaData:");
}

id objc_msgSend_checkLockedState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkLockedState");
}

id objc_msgSend_checkManagedConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkManagedConfiguration");
}

id objc_msgSend_checkResourceIsReachableAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkResourceIsReachableAndReturnError:");
}

id objc_msgSend_checkTriggerSuccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkTriggerSuccess:");
}

id objc_msgSend_chooseResourcesWithGoodPhotos_withPhotoCurationScore_andFaceCount_numPhotosThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chooseResourcesWithGoodPhotos:withPhotoCurationScore:andFaceCount:numPhotosThreshold:");
}

id objc_msgSend_cityDisplayNameWithFallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cityDisplayNameWithFallback:");
}

id objc_msgSend_cityFromAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cityFromAddress:");
}

id objc_msgSend_cityName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cityName");
}

id objc_msgSend_cleanUpBeforeUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanUpBeforeUpdate");
}

id objc_msgSend_cleanUpEventBundlesWithRefreshVariant_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanUpEventBundlesWithRefreshVariant:andHandler:");
}

id objc_msgSend_cleanUpEventsWithRefreshVariant_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanUpEventsWithRefreshVariant:andHandler:");
}

id objc_msgSend_clearCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearCache");
}

id objc_msgSend_clearEventsWithRefreshVariant_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearEventsWithRefreshVariant:andHandler:");
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "client");
}

id objc_msgSend_clientConnection_hasInternalEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientConnection:hasInternalEntitlement:");
}

id objc_msgSend_clientEventToEnum_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientEventToEnum:");
}

id objc_msgSend_clientIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientIdentifier");
}

id objc_msgSend_clientIdentifierAppEntry(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientIdentifierAppEntry");
}

id objc_msgSend_clientWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientWithIdentifier:");
}

id objc_msgSend_clonedObjectWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clonedObjectWithContext:");
}

id objc_msgSend_closeTrip_hometownReferenceLocations_contextEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "closeTrip:hometownReferenceLocations:contextEvents:");
}

id objc_msgSend_clusterMetadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clusterMetadata");
}

id objc_msgSend_clusteringInterfaceTypeEngagementWeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clusteringInterfaceTypeEngagementWeight");
}

id objc_msgSend_coarseGranularity_contactBundleAggregationCallCountThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coarseGranularity_contactBundleAggregationCallCountThreshold");
}

id objc_msgSend_coarseGranularity_contactBundleAggregationCallDurationThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coarseGranularity_contactBundleAggregationCallDurationThreshold");
}

id objc_msgSend_coarseGranularity_contactBundleAggregationMessageCountThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coarseGranularity_contactBundleAggregationMessageCountThreshold");
}

id objc_msgSend_coarseGranularity_contactBundleAggregationOutGoingMessageCountThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coarseGranularity_contactBundleAggregationOutGoingMessageCountThreshold");
}

id objc_msgSend_coarseGranularity_contactMegaBundleLookBackDays(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coarseGranularity_contactMegaBundleLookBackDays");
}

id objc_msgSend_coarseGranularity_mediaBundleAggregationPodcastPlayTimePercentageThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coarseGranularity_mediaBundleAggregationPodcastPlayTimePercentageThreshold");
}

id objc_msgSend_coarseGranularity_mediaBundleAggregationPodcastTotalPlayTimeThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coarseGranularity_mediaBundleAggregationPodcastTotalPlayTimeThreshold");
}

id objc_msgSend_coarseGranularity_outingBundlesAggregationDistanceThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coarseGranularity_outingBundlesAggregationDistanceThreshold");
}

id objc_msgSend_coarseGranularity_outingBundlesAggregationDistanceToClusterThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coarseGranularity_outingBundlesAggregationDistanceToClusterThreshold");
}

id objc_msgSend_coarseGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coarseGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold");
}

id objc_msgSend_coarseGranularity_outingBundlesAggregationTimeIntervalThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coarseGranularity_outingBundlesAggregationTimeIntervalThreshold");
}

id objc_msgSend_coarseGranularity_outingBundlesExclusionGoodnessScoreThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coarseGranularity_outingBundlesExclusionGoodnessScoreThreshold");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_collectEventsWithRefreshVariant_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectEventsWithRefreshVariant:andHandler:");
}

id objc_msgSend_combineEmotionResources_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "combineEmotionResources:");
}

id objc_msgSend_combineMediaResources_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "combineMediaResources:");
}

id objc_msgSend_combinePhotoResources_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "combinePhotoResources:");
}

id objc_msgSend_combinedPlaceTypeHistogram(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "combinedPlaceTypeHistogram");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_compareRegionCode_regionName_otherRegionCode_otherRegionName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compareRegionCode:regionName:otherRegionCode:otherRegionName:");
}

id objc_msgSend_component_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "component:fromDate:");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_components_fromDate_toDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:toDate:options:");
}

id objc_msgSend_componentsInTimeZone_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsInTimeZone:fromDate:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_compressAssetsForThirdPartyBundles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compressAssetsForThirdPartyBundles:");
}

id objc_msgSend_concatenatePlaceNameAndPlaceStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "concatenatePlaceNameAndPlaceStart:");
}

id objc_msgSend_concurrentMediaAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "concurrentMediaAction");
}

id objc_msgSend_condensedRecords(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "condensedRecords");
}

id objc_msgSend_condensedRecordsFromRecords_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "condensedRecordsFromRecords:");
}

id objc_msgSend_conditions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conditions");
}

id objc_msgSend_conditionsFromCapitalizations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conditionsFromCapitalizations:");
}

id objc_msgSend_conditionsFromConditionStrings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conditionsFromConditionStrings:");
}

id objc_msgSend_conditionsFromExtendStrings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conditionsFromExtendStrings:");
}

id objc_msgSend_conditionsFromLabels_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conditionsFromLabels:");
}

id objc_msgSend_confidence(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "confidence");
}

id objc_msgSend_confidenceScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "confidenceScore");
}

id objc_msgSend_configManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configManager");
}

id objc_msgSend_configurationManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationManager");
}

id objc_msgSend_configure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configure:");
}

id objc_msgSend_configureWithDaemonClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureWithDaemonClient:");
}

id objc_msgSend_constructLearnedFromTheAppDictionary_denyList_statusDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constructLearnedFromTheAppDictionary:denyList:statusDict:");
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contact");
}

id objc_msgSend_contactClassificationMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactClassificationMap");
}

id objc_msgSend_contactIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactIdentifier");
}

id objc_msgSend_contactLocationWorkFeature(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactLocationWorkFeature");
}

id objc_msgSend_contactMatchingDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactMatchingDictionary");
}

id objc_msgSend_contactNamesHistogram(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactNamesHistogram");
}

id objc_msgSend_containInterestingCategoryInTrip_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containInterestingCategoryInTrip:");
}

id objc_msgSend_containTargetAOIInGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containTargetAOIInGroup:");
}

id objc_msgSend_containTheSameEventSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containTheSameEventSet:");
}

id objc_msgSend_containsDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsDate:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_containsValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsValueForKey:");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "content");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "context");
}

id objc_msgSend_convertAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertAction:");
}

id objc_msgSend_convertClusterMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertClusterMetadata:");
}

id objc_msgSend_convertDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertDirection:");
}

id objc_msgSend_convertEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertEvent:");
}

id objc_msgSend_convertEventBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertEventBundle:");
}

id objc_msgSend_convertMechanism_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertMechanism:");
}

id objc_msgSend_convertMediaEvent_toMediaType_mediaGenre_mediaSourceAppType_numAudioMediaPlaySessionsPerDay_numVideoMediaPlaySessionsPerDay_numFirstPartyMediaPlaySessionsPerDay_numThirdPartyMediaPlaySessionsPerDay_durationAudioMediaPlaySessionsPerDay_durationVideoMediaPlaySessionsPerDay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertMediaEvent:toMediaType:mediaGenre:mediaSourceAppType:numAudioMediaPlaySessionsPerDay:numVideoMediaPlaySessionsPerDay:numFirstPartyMediaPlaySessionsPerDay:numThirdPartyMediaPlaySessionsPerDay:durationAudioMediaPlaySessionsPerDay:durationVideoMediaPlaySessionsPerDay:");
}

id objc_msgSend_convertMetadataForRankgDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertMetadataForRankgDictionary:");
}

id objc_msgSend_convertOutlierMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertOutlierMetadata:");
}

id objc_msgSend_convertPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPerson:");
}

id objc_msgSend_convertPlace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPlace:");
}

id objc_msgSend_convertResource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertResource:");
}

id objc_msgSend_convertSignificantContactEvent_toContactIDsInConversation_callLikeMechanismIncluded_textLikeMechanismIncluded_numAudioLikeInteractions_numVideoLikeInteractions_numTextLikeInteractions_totalDurationOfCallLikeInteractions_maxDurationOfCallLikeInteractions_minDurationOfCallLikeInteractions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertSignificantContactEvent:toContactIDsInConversation:callLikeMechanismIncluded:textLikeMechanismIncluded:numAudioLikeInteractions:numVideoLikeInteractions:numTextLikeInteractions:totalDurationOfCallLikeInteractions:maxDurationOfCallLikeInteractions:minDurationOfCallLikeInteractions:");
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coordinate");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countForFetchRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countForFetchRequest:error:");
}

id objc_msgSend_countForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countForObject:");
}

id objc_msgSend_countOfAssetCollections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfAssetCollections");
}

id objc_msgSend_countTotalPlayTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countTotalPlayTime:");
}

id objc_msgSend_country(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "country");
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countryCode");
}

id objc_msgSend_countryCodeFromAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countryCodeFromAddress:");
}

id objc_msgSend_countryFromAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countryFromAddress:");
}

id objc_msgSend_countryName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countryName");
}

id objc_msgSend_creatMediaActionWithMediaInfo_mediaNameConfidence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "creatMediaActionWithMediaInfo:mediaNameConfidence:");
}

id objc_msgSend_createActivityMegaBundleFromBundles_withParameters_isCoarseGranularity_isWeeklySummary_timeZoneManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createActivityMegaBundleFromBundles:withParameters:isCoarseGranularity:isWeeklySummary:timeZoneManager:");
}

id objc_msgSend_createBundleInformationForAnalyticsWithBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createBundleInformationForAnalyticsWithBundle:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDominantBundleFromBundles_withParameters_timeZoneManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDominantBundleFromBundles:withParameters:timeZoneManager:");
}

id objc_msgSend_createEventForMotionActivityWithStartDate_andEndDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createEventForMotionActivityWithStartDate:andEndDate:");
}

id objc_msgSend_createEventFromHighlight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createEventFromHighlight:");
}

id objc_msgSend_createEventFromSuggestedEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createEventFromSuggestedEvent:");
}

id objc_msgSend_createEventFromTopicQuery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createEventFromTopicQuery:");
}

id objc_msgSend_createEventFromTrip_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createEventFromTrip:");
}

id objc_msgSend_createEventsFromActivities_withMininumEventSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createEventsFromActivities:withMininumEventSize:");
}

id objc_msgSend_createMediaResourceWithMediaInfo_playSessions_eventIdentifiersMapping_isDominant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createMediaResourceWithMediaInfo:playSessions:eventIdentifiersMapping:isDominant:");
}

id objc_msgSend_createMegaBundleFromBundles_parameters_timeZoneManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createMegaBundleFromBundles:parameters:timeZoneManager:");
}

id objc_msgSend_createModel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createModel");
}

id objc_msgSend_createMotionActivityMegaBundleFromBundles_withSamePlace_withParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createMotionActivityMegaBundleFromBundles:withSamePlace:withParameters:");
}

id objc_msgSend_createOutingMegaBundleFromBundles_withParameters_isCoarseGranularity_timeZoneManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createOutingMegaBundleFromBundles:withParameters:isCoarseGranularity:timeZoneManager:");
}

id objc_msgSend_createService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createService:");
}

id objc_msgSend_createTransitMegaBundleFromBundles_withParameters_isCoarseGranularity_timeZoneManager_groupedOutingBundles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createTransitMegaBundleFromBundles:withParameters:isCoarseGranularity:timeZoneManager:groupedOutingBundles:");
}

id objc_msgSend_createTrendBundlesFrom_withEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createTrendBundlesFrom:withEvents:");
}

id objc_msgSend_createTripWithVisitEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createTripWithVisitEvent:");
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "creationDate");
}

id objc_msgSend_creativityEvergreenTypeEngagementWeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "creativityEvergreenTypeEngagementWeight");
}

id objc_msgSend_crossReference_withEvents_withGroupingStrategy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crossReference:withEvents:withGroupingStrategy:");
}

id objc_msgSend_curationParameterDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "curationParameterDict");
}

id objc_msgSend_curationScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "curationScore");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentConnection");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_currentManagedObjectModel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentManagedObjectModel");
}

id objc_msgSend_currentRelevanceScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRelevanceScore");
}

id objc_msgSend_cycling(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cycling");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "data");
}

id objc_msgSend_dataAccessManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataAccessManager");
}

id objc_msgSend_dataAccessTypeFromResourceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataAccessTypeFromResourceType:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_dataWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithData:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingComponents_toDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingComponents:toDate:options:");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateByAddingUnit_value_toDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:");
}

id objc_msgSend_dateFormatFromTemplate_options_locale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFormatFromTemplate:options:locale:");
}

id objc_msgSend_dateFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFormatter");
}

id objc_msgSend_dateFormatterForKeyword(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFormatterForKeyword");
}

id objc_msgSend_dateFromComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFromComponents:");
}

id objc_msgSend_dateFromDate_hour_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFromDate:hour:");
}

id objc_msgSend_dateFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFromString:");
}

id objc_msgSend_dateInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateInterval");
}

id objc_msgSend_dateOfBirthComponentsWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateOfBirthComponentsWithError:");
}

id objc_msgSend_dateReferenceTag(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateReferenceTag");
}

id objc_msgSend_dateReferenceTagFromStartDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateReferenceTagFromStartDate:endDate:");
}

id objc_msgSend_dateReferenceTagFromStartDate_endDate_nowDate_timeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateReferenceTagFromStartDate:endDate:nowDate:timeZone:");
}

id objc_msgSend_dateWithTimeInterval_sinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeInterval:sinceDate:");
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "day");
}

id objc_msgSend_dayCountInTrip_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dayCountInTrip:");
}

id objc_msgSend_dayNameFormatterInEnglish(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dayNameFormatterInEnglish");
}

id objc_msgSend_dayOfWeekFromStartDate_endDate_timeZoneManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dayOfWeekFromStartDate:endDate:timeZoneManager:");
}

id objc_msgSend_dayOfWeekHistogram(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dayOfWeekHistogram");
}

id objc_msgSend_dayOfWeekString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dayOfWeekString:");
}

id objc_msgSend_dayOfWeekTagFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dayOfWeekTagFromDate:");
}

id objc_msgSend_dayOfWeekTagFromStartDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dayOfWeekTagFromStartDate:endDate:");
}

id objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeArrayOfObjectsOfClass:forKey:");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeDoubleForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeDoubleForKey:");
}

id objc_msgSend_decodeFloatForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeFloatForKey:");
}

id objc_msgSend_decodeInt32ForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeInt32ForKey:");
}

id objc_msgSend_decodeInt64ForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeInt64ForKey:");
}

id objc_msgSend_decodeIntForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntForKey:");
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_decodeToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeToDictionary:");
}

id objc_msgSend_dedupAssetForMediaBundleThirdParty_nonPlayedMediaBudnles_isRecommendTab_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dedupAssetForMediaBundleThirdParty:nonPlayedMediaBudnles:isRecommendTab:");
}

id objc_msgSend_dedupeHostingAtHomeBundles_withEvents_withCalendar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dedupeHostingAtHomeBundles:withEvents:withCalendar:");
}

id objc_msgSend_defaultDatabaseDirectory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultDatabaseDirectory");
}

id objc_msgSend_defaultDeferredProcessingTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultDeferredProcessingTypes");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultModelsDirectory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultModelsDirectory");
}

id objc_msgSend_defaultReporter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultReporter");
}

id objc_msgSend_defaultService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultService");
}

id objc_msgSend_defaultSound(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultSound");
}

id objc_msgSend_defaultStoresDirectory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultStoresDirectory");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_defaultsManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultsManager");
}

id objc_msgSend_defineClassCollections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defineClassCollections");
}

id objc_msgSend_deleteEventsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteEventsPassingTest:");
}

id objc_msgSend_deleteObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteObject:");
}

id objc_msgSend_deleteObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteObjectForKey:");
}

id objc_msgSend_deletePhotoMemoryPlistFile(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deletePhotoMemoryPlistFile");
}

id objc_msgSend_denominator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "denominator");
}

id objc_msgSend_densityScanDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "densityScanDuration");
}

id objc_msgSend_densityScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "densityScore");
}

id objc_msgSend_deploymentId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deploymentId");
}

id objc_msgSend_dequeue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeue");
}

id objc_msgSend_deregisterTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deregisterTaskWithIdentifier:");
}

id objc_msgSend_describeCategory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "describeCategory");
}

id objc_msgSend_describeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "describeCategory:");
}

id objc_msgSend_describeProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "describeProvider");
}

id objc_msgSend_describeProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "describeProvider:");
}

id objc_msgSend_describeType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "describeType:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_descriptionOfLifeEventCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionOfLifeEventCategory:");
}

id objc_msgSend_descriptionOfMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionOfMode:");
}

id objc_msgSend_descriptionOfMotionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionOfMotionType:");
}

id objc_msgSend_descriptionOfPhotoMomentSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionOfPhotoMomentSource:");
}

id objc_msgSend_destination(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destination");
}

id objc_msgSend_destinationFromVisitEvent_state_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destinationFromVisitEvent:state:");
}

id objc_msgSend_destinationType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destinationType");
}

id objc_msgSend_detectHindsightVisitsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "detectHindsightVisitsWithCompletionHandler:");
}

id objc_msgSend_detectionType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "detectionType");
}

id objc_msgSend_determineAddedCharacterBinRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "determineAddedCharacterBinRange:");
}

id objc_msgSend_determineOnboardingDurationBinRange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "determineOnboardingDurationBinRange");
}

id objc_msgSend_deviceSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceSource");
}

id objc_msgSend_dfsStartingFrom_connectedPartIndx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dfsStartingFrom:connectedPartIndx:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_didAppEntryEventPosted_withBundles_timestamp_duringInterval_withInfo_withTrialExperimentIDs_withOnboardingStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didAppEntryEventPosted:withBundles:timestamp:duringInterval:withInfo:withTrialExperimentIDs:withOnboardingStatus:");
}

id objc_msgSend_didEngagementEventPosted_withBundles_timestamp_withContext_withTrialExperimentIDs_withOnboardingStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didEngagementEventPosted:withBundles:timestamp:withContext:withTrialExperimentIDs:withOnboardingStatus:");
}

id objc_msgSend_didUpdateWithStatus_andError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateWithStatus:andError:");
}

id objc_msgSend_direction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "direction");
}

id objc_msgSend_dispatcher(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dispatcher");
}

id objc_msgSend_displayEndDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayEndDate");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayName");
}

id objc_msgSend_displayNameOfScoredTopics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayNameOfScoredTopics:");
}

id objc_msgSend_displayStartDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayStartDate");
}

id objc_msgSend_distance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distance");
}

id objc_msgSend_distanceFromEvent_trip_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceFromEvent:trip:");
}

id objc_msgSend_distanceFromHome(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceFromHome");
}

id objc_msgSend_distanceFromHomeToCLLocation_universe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceFromHomeToCLLocation:universe:");
}

id objc_msgSend_distanceFromHomeToLocation_universe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceFromHomeToLocation:universe:");
}

id objc_msgSend_distanceFromLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceFromLocation:");
}

id objc_msgSend_distanceFromLocation_hometownReferenceLocations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceFromLocation:hometownReferenceLocations:");
}

id objc_msgSend_distanceFromVisitToPlace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceFromVisitToPlace");
}

id objc_msgSend_distanceFromlat1_lon1_tolat2_lon2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceFromlat1:lon1:tolat2:lon2:");
}

id objc_msgSend_distanceThresholdDefault(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceThresholdDefault");
}

id objc_msgSend_distanceThresholdForCoarseGroup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceThresholdForCoarseGroup");
}

id objc_msgSend_distanceThresholdWithSamePlaceName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceThresholdWithSamePlaceName");
}

id objc_msgSend_distanceToHomeFeatureNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceToHomeFeatureNormalized");
}

id objc_msgSend_distanceToHomeInMiles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceToHomeInMiles");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distantFuture");
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distantPast");
}

id objc_msgSend_distinctnessScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distinctnessScore");
}

id objc_msgSend_doTrialSetup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doTrialSetup");
}

id objc_msgSend_doesInterval_overlapWithAnyIntervalFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doesInterval:overlapWithAnyIntervalFromArray:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domain");
}

id objc_msgSend_domains(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domains");
}

id objc_msgSend_dominantBundle_mainActionSelectionThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dominantBundle_mainActionSelectionThreshold");
}

id objc_msgSend_dominantBundle_mediaPlaySessionDominantFactorThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dominantBundle_mediaPlaySessionDominantFactorThreshold");
}

id objc_msgSend_dominantBundle_mediaPlaySessionsOverlapsMinimumDistance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dominantBundle_mediaPlaySessionsOverlapsMinimumDistance");
}

id objc_msgSend_dominantBundle_overlappingThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dominantBundle_overlappingThreshold");
}

id objc_msgSend_dominantBundle_suppressMediaBundleComparedWithActivityBundleThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dominantBundle_suppressMediaBundleComparedWithActivityBundleThreshold");
}

id objc_msgSend_dominantBundle_suppressMediaBundleComparedWithHomeBundleThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dominantBundle_suppressMediaBundleComparedWithHomeBundleThreshold");
}

id objc_msgSend_dominantInterestingPOIFromEvents_timeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dominantInterestingPOIFromEvents:timeZone:");
}

id objc_msgSend_dominantMediaNameFromEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dominantMediaNameFromEvents:");
}

id objc_msgSend_dominantMediaNameFromPlaySessions_intervalOfInterest_dominantFactorThreshold_confidence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dominantMediaNameFromPlaySessions:intervalOfInterest:dominantFactorThreshold:confidence:");
}

id objc_msgSend_dominantMediaNameFromPlaySessions_intervalsOfInterest_dominantFactorThreshold_confidence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dominantMediaNameFromPlaySessions:intervalsOfInterest:dominantFactorThreshold:confidence:");
}

id objc_msgSend_dominantPOIFormEvents_timeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dominantPOIFormEvents:timeZone:");
}

id objc_msgSend_dominantPlaceFromEvents_timeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dominantPlaceFromEvents:timeZone:");
}

id objc_msgSend_dominantPlaceNamesFromEvents_countryMode_timeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dominantPlaceNamesFromEvents:countryMode:timeZone:");
}

id objc_msgSend_dominantPlacesFromEvents_timeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dominantPlacesFromEvents:timeZone:");
}

id objc_msgSend_donateEvents_andBundles_andOnboardingStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donateEvents:andBundles:andOnboardingStatus:");
}

id objc_msgSend_doubleKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleKeys");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_downsampleLocations_outputSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downsampleLocations:outputSize:");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "duration");
}

id objc_msgSend_durationOfTrip_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "durationOfTrip:");
}

id objc_msgSend_dynamicModelParameterDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dynamicModelParameterDict");
}

id objc_msgSend_earlierDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "earlierDate:");
}

id objc_msgSend_eligibleForBundling_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eligibleForBundling:");
}

id objc_msgSend_embeddingDistanceWeights(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "embeddingDistanceWeights");
}

id objc_msgSend_embeddingType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "embeddingType");
}

id objc_msgSend_emotionAttachmentBundleDurationThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emotionAttachmentBundleDurationThreshold");
}

id objc_msgSend_enableMultiLibraryMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableMultiLibraryMode");
}

id objc_msgSend_enclosingArea(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enclosingArea");
}

id objc_msgSend_enclosingPlaceNameHistogram(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enclosingPlaceNameHistogram");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeDictionary:");
}

id objc_msgSend_encodeDouble_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeDouble:forKey:");
}

id objc_msgSend_encodeFloat_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeFloat:forKey:");
}

id objc_msgSend_encodeInt32_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt32:forKey:");
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt64:forKey:");
}

id objc_msgSend_encodeInt_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt:forKey:");
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInteger:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endDate");
}

id objc_msgSend_endSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endSession");
}

id objc_msgSend_endSessionAndUploadAsync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endSessionAndUploadAsync");
}

id objc_msgSend_endSessionSyncWithReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endSessionSyncWithReply:");
}

id objc_msgSend_endTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endTime");
}

id objc_msgSend_endTimeAppEntry(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endTimeAppEntry");
}

id objc_msgSend_engagementAndSuggestionAnalyticsManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "engagementAndSuggestionAnalyticsManager");
}

id objc_msgSend_engagementDelegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "engagementDelegate");
}

id objc_msgSend_engagementHistoryManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "engagementHistoryManager");
}

id objc_msgSend_engagementScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "engagementScore");
}

id objc_msgSend_engagementScoreParameterDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "engagementScoreParameterDict");
}

id objc_msgSend_engagementScoreParamsUpdateDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "engagementScoreParamsUpdateDate");
}

id objc_msgSend_engagementScoreWeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "engagementScoreWeight");
}

id objc_msgSend_engagementStream(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "engagementStream");
}

id objc_msgSend_enqueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueue:");
}

id objc_msgSend_enrichmentState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enrichmentState");
}

id objc_msgSend_entitlementDelegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entitlementDelegate");
}

id objc_msgSend_entityIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entityIdentifier");
}

id objc_msgSend_entityTagsForIdentifier_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entityTagsForIdentifier:options:error:");
}

id objc_msgSend_entityTagsForIdentifiers_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entityTagsForIdentifiers:options:error:");
}

id objc_msgSend_entry(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entry");
}

id objc_msgSend_entryDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entryDate");
}

id objc_msgSend_entryEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entryEvent");
}

id objc_msgSend_enumerateEntriesForActivityEventsThatOverlapWithDateInterval_ascending_error_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateEntriesForActivityEventsThatOverlapWithDateInterval:ascending:error:usingBlock:");
}

id objc_msgSend_enumerateIndexesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateIndexesUsingBlock:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsWithOptions_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsWithOptions:usingBlock:");
}

id objc_msgSend_enumerateStoredLocationsWithOptions_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateStoredLocationsWithOptions:usingBlock:");
}

id objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_event(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "event");
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventBody");
}

id objc_msgSend_eventBundleManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventBundleManager");
}

id objc_msgSend_eventBundleRanking(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventBundleRanking");
}

id objc_msgSend_eventBundleStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventBundleStore");
}

id objc_msgSend_eventBundleStore_needsEngagementInfoForBundles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventBundleStore:needsEngagementInfoForBundles:");
}

id objc_msgSend_eventCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventCount");
}

id objc_msgSend_eventID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventID");
}

id objc_msgSend_eventIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventIdentifier");
}

id objc_msgSend_eventIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventIdentifiers");
}

id objc_msgSend_eventManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventManager");
}

id objc_msgSend_eventStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventStore");
}

id objc_msgSend_eventWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventWithIdentifier:");
}

id objc_msgSend_eventWithOptions_originalTrendsData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventWithOptions:originalTrendsData:");
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "events");
}

id objc_msgSend_evergreenEngagementScoreParameterDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evergreenEngagementScoreParameterDict");
}

id objc_msgSend_evergreenEngagementScoreParamsUpdateDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evergreenEngagementScoreParamsUpdateDate");
}

id objc_msgSend_evergreenInterfaceTypeEngagementWeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evergreenInterfaceTypeEngagementWeight");
}

id objc_msgSend_evergreenManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evergreenManager");
}

id objc_msgSend_evergreenPromptExists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evergreenPromptExists");
}

id objc_msgSend_evergreenType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evergreenType");
}

id objc_msgSend_evergreenTypeFromEvergreenTypeString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evergreenTypeFromEvergreenTypeString:");
}

id objc_msgSend_exchangeObjectAtIndex_withObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exchangeObjectAtIndex:withObjectAtIndex:");
}

id objc_msgSend_execute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "execute:");
}

id objc_msgSend_executeFetchRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeFetchRequest:error:");
}

id objc_msgSend_executeQuery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeQuery:");
}

id objc_msgSend_executeRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeRequest:error:");
}

id objc_msgSend_exit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exit");
}

id objc_msgSend_exitDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exitDate");
}

id objc_msgSend_experimentId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "experimentId");
}

id objc_msgSend_experimentIdentifiersWithNamespaceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "experimentIdentifiersWithNamespaceName:");
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expirationDate");
}

id objc_msgSend_exportManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exportManager");
}

id objc_msgSend_expressionForConstantValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expressionForConstantValue:");
}

id objc_msgSend_expressionForFunction_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expressionForFunction:arguments:");
}

id objc_msgSend_expressionValueWithObject_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expressionValueWithObject:context:");
}

id objc_msgSend_extendedAttributes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extendedAttributes");
}

id objc_msgSend_extendedBundleNameFromBundleName_bundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extendedBundleNameFromBundleName:bundleId:");
}

id objc_msgSend_externalQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "externalQueue");
}

id objc_msgSend_extraContextEmbedding(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extraContextEmbedding");
}

id objc_msgSend_extractActivtyContextEmbedding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractActivtyContextEmbedding:");
}

id objc_msgSend_extractAnomalyEventsFrom_withFeatures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractAnomalyEventsFrom:withFeatures:");
}

id objc_msgSend_extractContextsFromPhotoTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractContextsFromPhotoTraits:");
}

id objc_msgSend_extractExtraContextEmbedding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractExtraContextEmbedding:");
}

id objc_msgSend_extractFeaturesFromEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractFeaturesFromEvents:");
}

id objc_msgSend_extractHardwareAndSoftwareMetadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractHardwareAndSoftwareMetadata");
}

id objc_msgSend_extractLocationContextEmbedding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractLocationContextEmbedding:");
}

id objc_msgSend_extractRoutineEventsFrom_withFeatures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractRoutineEventsFrom:withFeatures:");
}

id objc_msgSend_extractSocialContextEmbedding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractSocialContextEmbedding:");
}

id objc_msgSend_extractTimeContextEmbedding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractTimeContextEmbedding:");
}

id objc_msgSend_extractTrendEventsFrom_withFeatures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractTrendEventsFrom:withFeatures:");
}

id objc_msgSend_fDefaultsManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fDefaultsManager");
}

id objc_msgSend_fUniverse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fUniverse");
}

id objc_msgSend_faceAdjustmentVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "faceAdjustmentVersion");
}

id objc_msgSend_faceCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "faceCount");
}

id objc_msgSend_factor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "factor");
}

id objc_msgSend_factorLevelsWithNamespaceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "factorLevelsWithNamespaceName:");
}

id objc_msgSend_failWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failWithError:");
}

id objc_msgSend_familiarityIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "familiarityIndex");
}

id objc_msgSend_familiarityIndexFeature(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "familiarityIndexFeature");
}

id objc_msgSend_familiarityIndexLOI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "familiarityIndexLOI");
}

id objc_msgSend_family(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "family");
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "familyName");
}

id objc_msgSend_favorite(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "favorite");
}

id objc_msgSend_fetchAllEventsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAllEventsWithCompletionHandler:");
}

id objc_msgSend_fetchAnalyticsEventsWithOptions_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAnalyticsEventsWithOptions:CompletionHandler:");
}

id objc_msgSend_fetchAndPersistBundlesForTimeInterval_eventsIdsToDrop_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAndPersistBundlesForTimeInterval:eventsIdsToDrop:withHandler:");
}

id objc_msgSend_fetchAndPersistEventsForTimeInterval_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAndPersistEventsForTimeInterval:withHandler:");
}

id objc_msgSend_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAndSaveBundlingDataForTrigger:withFeedback:additionalMetadata:shouldUpload:andHandler:");
}

id objc_msgSend_fetchAndSaveConversationsBetweenStartDate_EndDate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAndSaveConversationsBetweenStartDate:EndDate:handler:");
}

id objc_msgSend_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAndSaveLifeEventsBetweenStartDate:endDate:handler:");
}

id objc_msgSend_fetchAndSaveMediaPlayEventsBetweenStartDate_EndDate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAndSaveMediaPlayEventsBetweenStartDate:EndDate:handler:");
}

id objc_msgSend_fetchAndSaveMindfulSessionsBetweenStartDate_EndDate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAndSaveMindfulSessionsBetweenStartDate:EndDate:handler:");
}

id objc_msgSend_fetchAndSaveMotionActivityBetweenStartDate_EndDate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAndSaveMotionActivityBetweenStartDate:EndDate:handler:");
}

id objc_msgSend_fetchAndSavePeopleDensityEventsBetweenStartDate_EndDate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAndSavePeopleDensityEventsBetweenStartDate:EndDate:handler:");
}

id objc_msgSend_fetchAndSavePhotoMemoriesStartDate_EndDate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAndSavePhotoMemoriesStartDate:EndDate:handler:");
}

id objc_msgSend_fetchAndSaveProxBetweenStartDate_EndDate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAndSaveProxBetweenStartDate:EndDate:handler:");
}

id objc_msgSend_fetchAndSaveSharedContentBetweenStartDate_EndDate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAndSaveSharedContentBetweenStartDate:EndDate:handler:");
}

id objc_msgSend_fetchAndSaveSharedPhotosBetweenStartDate_EndDate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAndSaveSharedPhotosBetweenStartDate:EndDate:handler:");
}

id objc_msgSend_fetchAndSaveTripsBetweenStartDate_EndDate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAndSaveTripsBetweenStartDate:EndDate:handler:");
}

id objc_msgSend_fetchAndSaveVisitsBetweenStartDate_EndDate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAndSaveVisitsBetweenStartDate:EndDate:handler:");
}

id objc_msgSend_fetchAndSaveWorkoutsBetweenStartDate_EndDate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAndSaveWorkoutsBetweenStartDate:EndDate:handler:");
}

id objc_msgSend_fetchAppEntryEngagementEventsWithTypes_fromStartDate_toEndDate_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAppEntryEngagementEventsWithTypes:fromStartDate:toEndDate:withError:");
}

id objc_msgSend_fetchAssetCollectionsWithLocalIdentifiers_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAssetCollectionsWithLocalIdentifiers:options:");
}

id objc_msgSend_fetchAssetCollectionsWithType_subtype_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAssetCollectionsWithType:subtype:options:");
}

id objc_msgSend_fetchAssetUsingID_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAssetUsingID:handler:");
}

id objc_msgSend_fetchAssetUsingID_universe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAssetUsingID:universe:");
}

id objc_msgSend_fetchAssetsWithLocalIdentifiers_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAssetsWithLocalIdentifiers:options:");
}

id objc_msgSend_fetchAssetsWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAssetsWithOptions:");
}

id objc_msgSend_fetchAttributionsForHighlight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAttributionsForHighlight:");
}

id objc_msgSend_fetchBundleTypeDistributionFromStoreWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchBundleTypeDistributionFromStoreWithHandler:");
}

id objc_msgSend_fetchConsolidatedEvents_withStored_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchConsolidatedEvents:withStored:handler:");
}

id objc_msgSend_fetchConversationEventsBetweenStartDate_endDate_withStoredEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchConversationEventsBetweenStartDate:endDate:withStoredEvents:handler:");
}

id objc_msgSend_fetchCuratedAssetsInAssetCollection_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCuratedAssetsInAssetCollection:options:");
}

id objc_msgSend_fetchCustomUserAssetsInMemory_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCustomUserAssetsInMemory:options:");
}

id objc_msgSend_fetchDeviceLocationsFromStartDate_endDate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchDeviceLocationsFromStartDate:endDate:handler:");
}

id objc_msgSend_fetchEarliestVisitDateInRoutineWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchEarliestVisitDateInRoutineWithHandler:");
}

id objc_msgSend_fetchError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchError");
}

id objc_msgSend_fetchEventBundleWithGranularity_interfaceTypes_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchEventBundleWithGranularity:interfaceTypes:CompletionHandler:");
}

id objc_msgSend_fetchEventBundleWithOptions_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchEventBundleWithOptions:CompletionHandler:");
}

id objc_msgSend_fetchEventBundlesWithOptions_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchEventBundlesWithOptions:CompletionHandler:");
}

id objc_msgSend_fetchEventBundlesWithOptions_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchEventBundlesWithOptions:handler:");
}

id objc_msgSend_fetchEventsWithOptions_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchEventsWithOptions:CompletionHandler:");
}

id objc_msgSend_fetchEventsWithStartDateAfter_Category_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchEventsWithStartDateAfter:Category:CompletionHandler:");
}

id objc_msgSend_fetchFSMWithName_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchFSMWithName:CompletionHandler:");
}

id objc_msgSend_fetchFamiliarityIndexResultsWithOptions_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchFamiliarityIndexResultsWithOptions:handler:");
}

id objc_msgSend_fetchHomeLOI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchHomeLOI");
}

id objc_msgSend_fetchHourlyWeatherFor_startDate_endDate_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchHourlyWeatherFor:startDate:endDate:completion:");
}

id objc_msgSend_fetchKeyAssetByMemoryUUIDForMemories_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchKeyAssetByMemoryUUIDForMemories:options:");
}

id objc_msgSend_fetchLastEventOfCategories_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchLastEventOfCategories:CompletionHandler:");
}

id objc_msgSend_fetchLastEventOfCategories_isHighConfidenceOnly_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchLastEventOfCategories:isHighConfidenceOnly:CompletionHandler:");
}

id objc_msgSend_fetchLastEventOfCategory_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchLastEventOfCategory:CompletionHandler:");
}

id objc_msgSend_fetchLifeEventsBetweenStartDate_endDate_withStoredEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchLifeEventsBetweenStartDate:endDate:withStoredEvents:handler:");
}

id objc_msgSend_fetchLocationsOfInterestOfType_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchLocationsOfInterestOfType:withHandler:");
}

id objc_msgSend_fetchLocationsOfInterestVisitedSinceDate_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchLocationsOfInterestVisitedSinceDate:withHandler:");
}

id objc_msgSend_fetchMeContact(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchMeContact");
}

id objc_msgSend_fetchMePersonWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchMePersonWithOptions:");
}

id objc_msgSend_fetchMediaPlayEventsBetweenStartDate_endDate_withStoredEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchMediaPlayEventsBetweenStartDate:endDate:withStoredEvents:handler:");
}

id objc_msgSend_fetchMomentsBackingMemory_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchMomentsBackingMemory:options:");
}

id objc_msgSend_fetchMomentsEngagementForBundles_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchMomentsEngagementForBundles:CompletionHandler:");
}

id objc_msgSend_fetchMomentsEventDataBetweenStartDate_EndDate_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchMomentsEventDataBetweenStartDate:EndDate:CompletionHandler:");
}

id objc_msgSend_fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchMotionActivityBetweenStartDate:endDate:withStoredEvents:handler:");
}

id objc_msgSend_fetchOptionsWithPhotoLibrary_orObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchOptionsWithPhotoLibrary:orObject:");
}

id objc_msgSend_fetchPedometerDataFor_toEndDate_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPedometerDataFor:toEndDate:CompletionHandler:");
}

id objc_msgSend_fetchPeopleDensityEventsBetweenStartDate_endDate_withStoredEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPeopleDensityEventsBetweenStartDate:endDate:withStoredEvents:handler:");
}

id objc_msgSend_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPeopleDensityHistoryFromStartDate:endDate:completionHandler:");
}

id objc_msgSend_fetchPersonsInAsset_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPersonsInAsset:options:");
}

id objc_msgSend_fetchPhotoMemoryEventsBetweenStartDate_endDate_withStoredEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPhotoMemoryEventsBetweenStartDate:endDate:withStoredEvents:handler:");
}

id objc_msgSend_fetchPhotosBetweenStartDate_EndDate_SuggestionID_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPhotosBetweenStartDate:EndDate:SuggestionID:BundleInterfaceType:Locations:IsLocationCheckMandatory:handler:");
}

id objc_msgSend_fetchPropertySetsIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPropertySetsIfNeeded");
}

id objc_msgSend_fetchProxEventsBetweenStartDate_endDate_withStoredEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchProxEventsBetweenStartDate:endDate:withStoredEvents:handler:");
}

id objc_msgSend_fetchProximityHistoryFromStartDate_endDate_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchProximityHistoryFromStartDate:endDate:completionHandler:");
}

id objc_msgSend_fetchRehydratedEventBundlesWithOptions_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRehydratedEventBundlesWithOptions:CompletionHandler:");
}

id objc_msgSend_fetchRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRequest");
}

id objc_msgSend_fetchRequestWithEntityName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRequestWithEntityName:");
}

id objc_msgSend_fetchRoutineStateWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRoutineStateWithHandler:");
}

id objc_msgSend_fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:");
}

id objc_msgSend_fetchSharedContentBetweenStartDate_EndDate_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchSharedContentBetweenStartDate:EndDate:CompletionHandler:");
}

id objc_msgSend_fetchSignificantLocationEnablementStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchSignificantLocationEnablementStatus");
}

id objc_msgSend_fetchStateOfMindEventsBetweenStartDate_endDate_withStoredEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchStateOfMindEventsBetweenStartDate:endDate:withStoredEvents:handler:");
}

id objc_msgSend_fetchStoredVisitsWithOptions_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchStoredVisitsWithOptions:handler:");
}

id objc_msgSend_fetchSuggestedEventBetweenStartDate_EndDate_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchSuggestedEventBetweenStartDate:EndDate:CompletionHandler:");
}

id objc_msgSend_fetchSuggestionEngagementEventsWithTypes_fromStartDate_toEndDate_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchSuggestionEngagementEventsWithTypes:fromStartDate:toEndDate:withError:");
}

id objc_msgSend_fetchSummaryCurationForHighlight_fetchOptions_allowsOnDemand_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchSummaryCurationForHighlight:fetchOptions:allowsOnDemand:error:");
}

id objc_msgSend_fetchTripsBetweenStartDate_EndDate_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchTripsBetweenStartDate:EndDate:CompletionHandler:");
}

id objc_msgSend_fetchUserAgeWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchUserAgeWithHandler:");
}

id objc_msgSend_fetchUserBiologicalSexWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchUserBiologicalSexWithHandler:");
}

id objc_msgSend_fetchUserCuratedAssetsInMemory_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchUserCuratedAssetsInMemory:options:");
}

id objc_msgSend_fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchVisitsBetweenStartDate:endDate:withStoredEvents:handler:");
}

id objc_msgSend_fetchWorkoutEventsBetweenStartDate_endDate_withStoredEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchWorkoutEventsBetweenStartDate:endDate:withStoredEvents:handler:");
}

id objc_msgSend_fetchedObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchedObjects");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_filterBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterBundle");
}

id objc_msgSend_filterEventBundlesEligibleForSummarization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterEventBundlesEligibleForSummarization:");
}

id objc_msgSend_filterEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterEvents:");
}

id objc_msgSend_filterEventsIntersectingDateRange_rangeStart_rangeEnd_eventInterval_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterEventsIntersectingDateRange:rangeStart:rangeEnd:eventInterval:handler:");
}

id objc_msgSend_filterEventsIntersectingDateRange_rangeStart_rangeEnd_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterEventsIntersectingDateRange:rangeStart:rangeEnd:handler:");
}

id objc_msgSend_filterPhoneVisits_farFromWorkoutEvents_forEventBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterPhoneVisits:farFromWorkoutEvents:forEventBundle:");
}

id objc_msgSend_filterUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterUsingPredicate:");
}

id objc_msgSend_filterWithIsIncluded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterWithIsIncluded:");
}

id objc_msgSend_filtered(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filtered");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_filteredSetUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredSetUsingPredicate:");
}

id objc_msgSend_finalizeClientTaskWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finalizeClientTaskWithName:");
}

id objc_msgSend_finalizeDataExportWithUpload_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finalizeDataExportWithUpload:handler:");
}

id objc_msgSend_findDuplicatePhotoResourceFromBundle_comparedWithPrimaryBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findDuplicatePhotoResourceFromBundle:comparedWithPrimaryBundle:");
}

id objc_msgSend_findMatchingVisitFor_inVisits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findMatchingVisitFor:inVisits:");
}

id objc_msgSend_findRehydrateEvents_forBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findRehydrateEvents:forBundle:");
}

id objc_msgSend_fineGranularity_activityBundlesAggregationTimeIntervalThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fineGranularity_activityBundlesAggregationTimeIntervalThreshold");
}

id objc_msgSend_fineGranularity_outingBundlesAggregationDistanceThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fineGranularity_outingBundlesAggregationDistanceThreshold");
}

id objc_msgSend_fineGranularity_outingBundlesAggregationDistanceToClusterThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fineGranularity_outingBundlesAggregationDistanceToClusterThreshold");
}

id objc_msgSend_fineGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fineGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold");
}

id objc_msgSend_fineGranularity_outingBundlesAggregationTimeIntervalThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fineGranularity_outingBundlesAggregationTimeIntervalThreshold");
}

id objc_msgSend_fineGranularity_outingBundlesExclusionGoodnessScoreThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fineGranularity_outingBundlesExclusionGoodnessScoreThreshold");
}

id objc_msgSend_fineGranularity_transitBundlesDestinationMaximumDistanceThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fineGranularity_transitBundlesDestinationMaximumDistanceThreshold");
}

id objc_msgSend_fineGranularity_transitBundlesDestinationMaximumTimeThresholdCycle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fineGranularity_transitBundlesDestinationMaximumTimeThresholdCycle");
}

id objc_msgSend_fineGranularity_transitBundlesDestinationMaximumTimeThresholdPedestrian(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fineGranularity_transitBundlesDestinationMaximumTimeThresholdPedestrian");
}

id objc_msgSend_fineGranularity_transitBundlesDestinationOneWayRouteMinimumDistanceThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fineGranularity_transitBundlesDestinationOneWayRouteMinimumDistanceThreshold");
}

id objc_msgSend_fineGranularity_transitBundlesWorkoutMinimumDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fineGranularity_transitBundlesWorkoutMinimumDuration");
}

id objc_msgSend_finerGranularityMapItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finerGranularityMapItem");
}

id objc_msgSend_finerGranularityMapItemConfidence(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finerGranularityMapItemConfidence");
}

id objc_msgSend_firstCreationDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstCreationDate");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_firstPartyTimePlayedRatio(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstPartyTimePlayedRatio");
}

id objc_msgSend_firstSaturdayBeforeReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstSaturdayBeforeReferenceDate:");
}

id objc_msgSend_fitData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fitData:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floatValue");
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "format");
}

id objc_msgSend_formatAddressCurrentFormatWithFallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formatAddressCurrentFormatWithFallback:");
}

id objc_msgSend_formatAddressParkingDisplayNameWithFallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formatAddressParkingDisplayNameWithFallback:");
}

id objc_msgSend_formatAddressWithFormatOption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formatAddressWithFormatOption:");
}

id objc_msgSend_formatAdministrativeAreaWithFormatOption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formatAdministrativeAreaWithFormatOption:");
}

id objc_msgSend_formatCountryWithFormatOption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formatCountryWithFormatOption:");
}

id objc_msgSend_formatLocalityWithFormatOption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formatLocalityWithFormatOption:");
}

id objc_msgSend_formats(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formats");
}

id objc_msgSend_formatsFromLabels_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formatsFromLabels:");
}

id objc_msgSend_formattedBundleLabelsForMetaData_bundleType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formattedBundleLabelsForMetaData:bundleType:");
}

id objc_msgSend_formattedBundlePromptsForMetaData_bundleType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formattedBundlePromptsForMetaData:bundleType:");
}

id objc_msgSend_formattedStringsForMetaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formattedStringsForMetaData:");
}

id objc_msgSend_formattedStringsForMetaData_templateType_bundleType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formattedStringsForMetaData:templateType:bundleType:");
}

id objc_msgSend_formattedStringsForMetaData_templates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formattedStringsForMetaData:templates:");
}

id objc_msgSend_frequencyPenalty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frequencyPenalty");
}

id objc_msgSend_fromDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fromDate");
}

id objc_msgSend_fromFirstParty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fromFirstParty");
}

id objc_msgSend_fsmStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fsmStore");
}

id objc_msgSend_fullBundleOrderedSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fullBundleOrderedSet");
}

id objc_msgSend_gaPR(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gaPR");
}

id objc_msgSend_generateBiomeEventsFromBundle_andOnboardingStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateBiomeEventsFromBundle:andOnboardingStatus:");
}

id objc_msgSend_generateBiomeEventsFromEvent_andOnboardingStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateBiomeEventsFromEvent:andOnboardingStatus:");
}

id objc_msgSend_generateBiomeEventsFromMomentsEventDataBundle_withBundleEngagement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateBiomeEventsFromMomentsEventDataBundle:withBundleEngagement:");
}

id objc_msgSend_generateBundleRanking_withMinRecommendedBundleCountRequirement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateBundleRanking:withMinRecommendedBundleCountRequirement:");
}

id objc_msgSend_generateClusterBundles_withEmbeddings_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateClusterBundles:withEmbeddings:handler:");
}

id objc_msgSend_generateDailyTripsFromBaseEvents_contextEvents_pregeneratedTripBundles_hometownReferenceLocations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateDailyTripsFromBaseEvents:contextEvents:pregeneratedTripBundles:hometownReferenceLocations:");
}

id objc_msgSend_generateRankingInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateRankingInput:");
}

id objc_msgSend_generateSummaryTripsFromBaseEvents_hometownReferenceLocations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateSummaryTripsFromBaseEvents:hometownReferenceLocations:");
}

id objc_msgSend_genre(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "genre");
}

id objc_msgSend_geoAddressData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "geoAddressData");
}

id objc_msgSend_geoAddressObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "geoAddressObject");
}

id objc_msgSend_geoMapItemHandle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "geoMapItemHandle");
}

id objc_msgSend_getActivityContextDistanceFrom_withWeights_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getActivityContextDistanceFrom:withWeights:");
}

id objc_msgSend_getAllowedToPromptConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAllowedToPromptConfiguration");
}

id objc_msgSend_getAndSetAgeGender(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAndSetAgeGender");
}

id objc_msgSend_getAnomalyDetector(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAnomalyDetector");
}

id objc_msgSend_getAnomalyDetectorDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAnomalyDetectorDict");
}

id objc_msgSend_getAppNotificationAuthorizationStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAppNotificationAuthorizationStatus");
}

id objc_msgSend_getApplicationsWithDataAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getApplicationsWithDataAccess:");
}

id objc_msgSend_getApplicationsWithDataAccess_withinTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getApplicationsWithDataAccess:withinTimeInterval:");
}

id objc_msgSend_getBMBundleSumaryForBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBMBundleSumaryForBundle:");
}

id objc_msgSend_getBaseEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBaseEvents:");
}

id objc_msgSend_getBiomeContextDictionaryWithUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBiomeContextDictionaryWithUserInfo:");
}

id objc_msgSend_getBoolDefaultsForKey_withFallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBoolDefaultsForKey:withFallback:");
}

id objc_msgSend_getBoolSettingForKey_withFallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBoolSettingForKey:withFallback:");
}

id objc_msgSend_getBoolTrialLevelForKey_withFallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBoolTrialLevelForKey:withFallback:");
}

id objc_msgSend_getBuildVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBuildVersion");
}

id objc_msgSend_getBundleRelativeDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBundleRelativeDate");
}

id objc_msgSend_getBundleType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBundleType");
}

id objc_msgSend_getBundlingDatesForVariant_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBundlingDatesForVariant:withHandler:");
}

id objc_msgSend_getBundlingJSONURLWithDirectorySuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBundlingJSONURLWithDirectorySuffix:");
}

id objc_msgSend_getBytes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:range:");
}

id objc_msgSend_getCharacterCountBin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCharacterCountBin:");
}

id objc_msgSend_getClassificationInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getClassificationInfo:");
}

id objc_msgSend_getClientsWithDataAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getClientsWithDataAccess:");
}

id objc_msgSend_getClientsWithDataAccess_withinTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getClientsWithDataAccess:withinTimeInterval:");
}

id objc_msgSend_getClusterLabels(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getClusterLabels");
}

id objc_msgSend_getClusteringParams(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getClusteringParams");
}

id objc_msgSend_getCoarseInferenceTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCoarseInferenceTag:");
}

id objc_msgSend_getCollectAndComputeAuthorization(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCollectAndComputeAuthorization");
}

id objc_msgSend_getCollectDatesForVariant_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCollectDatesForVariant:withHandler:");
}

id objc_msgSend_getContextEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getContextEvents:");
}

id objc_msgSend_getContextEventsForBaseEvents_events_withPatternEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getContextEventsForBaseEvents:events:withPatternEvents:");
}

id objc_msgSend_getCustomLabelsForMetaData_labelFormatter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCustomLabelsForMetaData:labelFormatter:");
}

id objc_msgSend_getCustomPromptsForMetaData_labelFormatter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCustomPromptsForMetaData:labelFormatter:");
}

id objc_msgSend_getDaemonPlistFileURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDaemonPlistFileURL");
}

id objc_msgSend_getDedupeKeyError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDedupeKeyError:");
}

id objc_msgSend_getDedupeKeyForResourceData_type_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDedupeKeyForResourceData:type:error:");
}

id objc_msgSend_getDeliveredNotificationsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDeliveredNotificationsWithCompletionHandler:");
}

id objc_msgSend_getDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDictionary");
}

id objc_msgSend_getDictionaryForData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDictionaryForData:error:");
}

id objc_msgSend_getDistanceFrom_withWeights_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDistanceFrom:withWeights:");
}

id objc_msgSend_getDominantBundleFromBundles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDominantBundleFromBundles:");
}

id objc_msgSend_getDoubleDefaultsForKey_withFallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDoubleDefaultsForKey:withFallback:");
}

id objc_msgSend_getDoubleSettingForKey_withFallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDoubleSettingForKey:withFallback:");
}

id objc_msgSend_getDoubleTrialLevelForKey_withFallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDoubleTrialLevelForKey:withFallback:");
}

id objc_msgSend_getDurationOfMOEventArray(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDurationOfMOEventArray");
}

id objc_msgSend_getEWAPlistFileURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getEWAPlistFileURL");
}

id objc_msgSend_getEmbeddingsFromBundles_forEmbeddingType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getEmbeddingsFromBundles:forEmbeddingType:");
}

id objc_msgSend_getEngagementBundleSumarySetForBundles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getEngagementBundleSumarySetForBundles:");
}

id objc_msgSend_getEngagmentTypeForEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getEngagmentTypeForEvent:");
}

id objc_msgSend_getEventBundleStartedWithInterval_interfaceTypes_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getEventBundleStartedWithInterval:interfaceTypes:CompletionHandler:");
}

id objc_msgSend_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getEvergreenTypeCountForAppEntryEvent:withMinAddedCharacterCount:andMaxAddedCharacterCount:fromStartDate:toEndDate:onceForEachBundle:skipForEvents:");
}

id objc_msgSend_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getEvergreenTypeCountForSuggestionEngagmentEvent:from:to:onceForEachBundle:skipForEvents:");
}

id objc_msgSend_getEvergreenTypeCountForSuggestionsWithJournalCreatedFromStartDate_toEndDate_withMinimumAddedCharacters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getEvergreenTypeCountForSuggestionsWithJournalCreatedFromStartDate:toEndDate:withMinimumAddedCharacters:");
}

id objc_msgSend_getExtraContextDistanceFrom_withWeights_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getExtraContextDistanceFrom:withWeights:");
}

id objc_msgSend_getFallbackPermission_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getFallbackPermission:");
}

id objc_msgSend_getFinerGranularityPlaceName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getFinerGranularityPlaceName");
}

id objc_msgSend_getFloatDefaultsForKey_withFallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getFloatDefaultsForKey:withFallback:");
}

id objc_msgSend_getFloatSettingForKey_withFallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getFloatSettingForKey:withFallback:");
}

id objc_msgSend_getFloatTrialLevelForKey_withFallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getFloatTrialLevelForKey:withFallback:");
}

id objc_msgSend_getHWModel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getHWModel");
}

id objc_msgSend_getHealthKitManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getHealthKitManager");
}

id objc_msgSend_getHomeVisitChunksForStandardDay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getHomeVisitChunksForStandardDay:");
}

id objc_msgSend_getInferenceTagMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getInferenceTagMap");
}

id objc_msgSend_getIntegerDefaultsForKey_withFallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getIntegerDefaultsForKey:withFallback:");
}

id objc_msgSend_getIntegerSettingForKey_withFallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getIntegerSettingForKey:withFallback:");
}

id objc_msgSend_getIntegerTrialLevelForKey_withFallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getIntegerTrialLevelForKey:withFallback:");
}

id objc_msgSend_getInterestingDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getInterestingDestination:");
}

id objc_msgSend_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getInterfaceTypeCountForAppEntryEvent:withMinAddedCharacterCount:andMaxAddedCharacterCount:fromStartDate:toEndDate:onceForEachBundle:skipForEvents:");
}

id objc_msgSend_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getInterfaceTypeCountForSuggestionEngagmentEvent:from:to:onceForEachBundle:skipForEvents:");
}

id objc_msgSend_getInterfaceTypeCountForUniqueSuggestionsDeletedFromStartDate_toEndDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getInterfaceTypeCountForUniqueSuggestionsDeletedFromStartDate:toEndDate:");
}

id objc_msgSend_getInterfaceTypeCountForUniqueSuggestionsViewedButNotEngagedFromStartDate_toEndDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getInterfaceTypeCountForUniqueSuggestionsViewedButNotEngagedFromStartDate:toEndDate:");
}

id objc_msgSend_getInterfaceTypeCountForUniqueSuggestionsViewedFromStartDate_toEndDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getInterfaceTypeCountForUniqueSuggestionsViewedFromStartDate:toEndDate:");
}

id objc_msgSend_getInterfaceTypeCountForUniqueSuggestionsWithJournalCreatedButNoWritingFromStartDate_toEndDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getInterfaceTypeCountForUniqueSuggestionsWithJournalCreatedButNoWritingFromStartDate:toEndDate:");
}

id objc_msgSend_getInterfaceTypeCountForUniqueSuggestionsWithJournalCreatedFromStartDate_toEndDate_withMinimumAddedCharacters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getInterfaceTypeCountForUniqueSuggestionsWithJournalCreatedFromStartDate:toEndDate:withMinimumAddedCharacters:");
}

id objc_msgSend_getInterfaceTypeEnum_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getInterfaceTypeEnum:");
}

id objc_msgSend_getInterfaceTypeString_superType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getInterfaceTypeString:superType:");
}

id objc_msgSend_getInternalEntitlementsForConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getInternalEntitlementsForConnection:");
}

id objc_msgSend_getLocation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getLocation");
}

id objc_msgSend_getLocationContextDistanceFrom_withWeights_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getLocationContextDistanceFrom:withWeights:");
}

id objc_msgSend_getMOPlaySessionMediaType_bundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getMOPlaySessionMediaType:bundleId:");
}

id objc_msgSend_getMediaOnRepeatBundleDaily_mediaTypeEnum_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getMediaOnRepeatBundleDaily:mediaTypeEnum:parameters:");
}

id objc_msgSend_getMediaOnRepeatBundleDailyForThirdPartyApp_mediaTypeEnum_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getMediaOnRepeatBundleDailyForThirdPartyApp:mediaTypeEnum:parameters:");
}

id objc_msgSend_getMomentsNotificationsSchedule_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getMomentsNotificationsSchedule:");
}

id objc_msgSend_getNotificationScheduledDeliverySetting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getNotificationScheduledDeliverySetting");
}

id objc_msgSend_getNotificationSettingsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getNotificationSettingsWithCompletionHandler:");
}

id objc_msgSend_getNotifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getNotifier");
}

id objc_msgSend_getObjects_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getObjects:range:");
}

id objc_msgSend_getOnboardingFlowCompletionStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getOnboardingFlowCompletionStatus");
}

id objc_msgSend_getOnboardingFlowRefreshCompletionStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getOnboardingFlowRefreshCompletionStatus");
}

id objc_msgSend_getOutlierScoreDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getOutlierScoreDict");
}

id objc_msgSend_getPatternDetectorDatesForVariant_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPatternDetectorDatesForVariant:withHandler:");
}

id objc_msgSend_getPendingNotificationRequestsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPendingNotificationRequestsWithCompletionHandler:");
}

id objc_msgSend_getPersonalizedSensingAllowedBundles_allowVisits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPersonalizedSensingAllowedBundles:allowVisits:");
}

id objc_msgSend_getPersonsInAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPersonsInAsset:");
}

id objc_msgSend_getPhotoAssetsForBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPhotoAssetsForBundle:");
}

id objc_msgSend_getPlaceFromBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPlaceFromBundle:");
}

id objc_msgSend_getPlaceName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPlaceName");
}

id objc_msgSend_getPlayedMediaBundleDaily_mediaTypeEnum_parameters_isPlayedSong_songOnRepeatBundles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPlayedMediaBundleDaily:mediaTypeEnum:parameters:isPlayedSong:songOnRepeatBundles:");
}

id objc_msgSend_getPlayedMediaBundleDailyForThirdPartyApp_mediaTypeEnum_parameters_songOnRepeatBundles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPlayedMediaBundleDailyForThirdPartyApp:mediaTypeEnum:parameters:songOnRepeatBundles:");
}

id objc_msgSend_getPlistFileURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPlistFileURL");
}

id objc_msgSend_getPreferredName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPreferredName");
}

id objc_msgSend_getProductType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getProductType");
}

id objc_msgSend_getProductVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getProductVersion");
}

id objc_msgSend_getRankingParamsandCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getRankingParamsandCompletionHandler:");
}

id objc_msgSend_getRefreshVariantName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getRefreshVariantName:");
}

id objc_msgSend_getResourcesForOutingSummaryBundleWithWorkoutResources_photoResources_mediaResources_emotionResources_shouldUpLevelPhoto_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getResourcesForOutingSummaryBundleWithWorkoutResources:photoResources:mediaResources:emotionResources:shouldUpLevelPhoto:");
}

id objc_msgSend_getResourcesForWeeklyWorkoutSummaryBundleWithWorkoutResources_photoResources_mediaResources_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getResourcesForWeeklyWorkoutSummaryBundleWithWorkoutResources:photoResources:mediaResources:");
}

id objc_msgSend_getResourcesFromBundles_forSummaryBundle_withParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getResourcesFromBundles:forSummaryBundle:withParameters:");
}

id objc_msgSend_getSensedEventGroupSettingNameFromCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSensedEventGroupSettingNameFromCategory:");
}

id objc_msgSend_getSensedEventGroupSettingNameFromResourceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSensedEventGroupSettingNameFromResourceType:");
}

id objc_msgSend_getSensedEventSettingNameFromCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSensedEventSettingNameFromCategory:");
}

id objc_msgSend_getSensedEventSettingNameFromResourceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSensedEventSettingNameFromResourceType:");
}

id objc_msgSend_getService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getService:");
}

id objc_msgSend_getSnapshotDictionaryForAnalytics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSnapshotDictionaryForAnalytics");
}

id objc_msgSend_getSocialContextDistanceFrom_withWeights_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSocialContextDistanceFrom:withWeights:");
}

id objc_msgSend_getStateForSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getStateForSetting:");
}

id objc_msgSend_getStateForSettingFast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getStateForSettingFast:");
}

id objc_msgSend_getStringDefaultsForKey_withFallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getStringDefaultsForKey:withFallback:");
}

id objc_msgSend_getStringFromBMDeviceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getStringFromBMDeviceType:");
}

id objc_msgSend_getStringSettingForKey_withFallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getStringSettingForKey:withFallback:");
}

id objc_msgSend_getStringTrialLevelForKey_withFallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getStringTrialLevelForKey:withFallback:");
}

id objc_msgSend_getStringTypeForResources_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getStringTypeForResources:");
}

id objc_msgSend_getSubTypeString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSubTypeString");
}

id objc_msgSend_getSuggestionAssetsForBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSuggestionAssetsForBundle:");
}

id objc_msgSend_getSuperTypeString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSuperTypeString");
}

id objc_msgSend_getSystemNotificationAuthorizationStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSystemNotificationAuthorizationStatus");
}

id objc_msgSend_getTemplateDirectoryURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTemplateDirectoryURL");
}

id objc_msgSend_getTestDataStats(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTestDataStats");
}

id objc_msgSend_getTheBestPersonRelationtshipTagFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTheBestPersonRelationtshipTagFor:");
}

id objc_msgSend_getTimeContextDistanceFrom_withWeights_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTimeContextDistanceFrom:withWeights:");
}

id objc_msgSend_getTimeDeltaMetricMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTimeDeltaMetricMap");
}

id objc_msgSend_getTimeSpanOfMOEventBundleArray(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTimeSpanOfMOEventBundleArray");
}

id objc_msgSend_getTotalDurationOfMOEventBundleArray(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTotalDurationOfMOEventBundleArray");
}

id objc_msgSend_getTrainDataStats(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTrainDataStats");
}

id objc_msgSend_getTrialExperimentIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTrialExperimentIdentifiers");
}

id objc_msgSend_getTripEventBundles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTripEventBundles:");
}

id objc_msgSend_getWeatherSummary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getWeatherSummary");
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "givenName");
}

id objc_msgSend_graphDiningActivityEventFromContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "graphDiningActivityEventFromContext:error:");
}

id objc_msgSend_graphObjectFromEntityIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "graphObjectFromEntityIdentifier:error:");
}

id objc_msgSend_graphShoppingActivityEventFromContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "graphShoppingActivityEventFromContext:error:");
}

id objc_msgSend_graphSoftwareFromContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "graphSoftwareFromContext:error:");
}

id objc_msgSend_graphTransportationActivityEventFromContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "graphTransportationActivityEventFromContext:error:");
}

id objc_msgSend_gratitudeEvergreenTypeEngagementWeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gratitudeEvergreenTypeEngagementWeight");
}

id objc_msgSend_groupBaseEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupBaseEvents:");
}

id objc_msgSend_groupConversationFeature(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupConversationFeature");
}

id objc_msgSend_groupDevicesBaseOnType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupDevicesBaseOnType:");
}

id objc_msgSend_groupDisplayName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupDisplayName");
}

id objc_msgSend_groupName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupName");
}

id objc_msgSend_groupedEvents_keyFunc_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupedEvents:keyFunc:");
}

id objc_msgSend_groupedEventsFromEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupedEventsFromEvents:");
}

id objc_msgSend_groupedEventsFromEvents_propertyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupedEventsFromEvents:propertyPath:");
}

id objc_msgSend_handleBatteryNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleBatteryNotification:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_hasAnyApplicationsWithDataAccessWithinTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAnyApplicationsWithDataAccessWithinTimeInterval:");
}

id objc_msgSend_hasAnyClientsWithDataAccessWithinTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAnyClientsWithDataAccessWithinTimeInterval:");
}

id objc_msgSend_hasAppEntryEngagementEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAppEntryEngagementEvent:");
}

id objc_msgSend_hasLocality(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasLocality");
}

id objc_msgSend_hasNextObjectPair(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasNextObjectPair");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hasSuggestionEngagementEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuggestionEngagementEvent:");
}

id objc_msgSend_hasThoroughfare(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasThoroughfare");
}

id objc_msgSend_hasWorkoutRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasWorkoutRoute:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hash");
}

id objc_msgSend_healthKitManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "healthKitManager");
}

id objc_msgSend_healthStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "healthStore");
}

id objc_msgSend_heuristicsParameterDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heuristicsParameterDict");
}

id objc_msgSend_heuristicsScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heuristicsScore");
}

id objc_msgSend_highlights(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "highlights");
}

id objc_msgSend_homeAvailability(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeAvailability");
}

id objc_msgSend_homeLOI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeLOI");
}

id objc_msgSend_hometownReferenceLocations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hometownReferenceLocations");
}

id objc_msgSend_horizontalAccuracy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "horizontalAccuracy");
}

id objc_msgSend_horizontalUncertainty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "horizontalUncertainty");
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hour");
}

id objc_msgSend_hours(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hours");
}

id objc_msgSend_iTunesStoreIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iTunesStoreIdentifier");
}

id objc_msgSend_iconForApplicationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iconForApplicationIdentifier:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_identifierFromProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifierFromProvider");
}

id objc_msgSend_identifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifiers");
}

id objc_msgSend_identifyRepetitiveSignificantContactBundlesFromBundles_precedingSignificantContactBundles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifyRepetitiveSignificantContactBundlesFromBundles:precedingSignificantContactBundles:");
}

id objc_msgSend_importProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "importProperties");
}

id objc_msgSend_importedBy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "importedBy");
}

id objc_msgSend_inSameCityOfEvent_trip_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inSameCityOfEvent:trip:");
}

id objc_msgSend_includeDeletedBundles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "includeDeletedBundles");
}

id objc_msgSend_includedInSummaryBundleOnly(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "includedInSummaryBundleOnly");
}

id objc_msgSend_indexDate_aggregationDuration_referenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexDate:aggregationDuration:referenceDate:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexSet");
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "init");
}

id objc_msgSend_init_sourceAppBundleIds_removedAppBundleIds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "init:sourceAppBundleIds:removedAppBundleIds:");
}

id objc_msgSend_initAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initAndReturnError:");
}

id objc_msgSend_initByCastingFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initByCastingFrom:");
}

id objc_msgSend_initFileURLWithPath_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initFileURLWithPath:relativeToURL:");
}

id objc_msgSend_initForSoftLinkwithMOEventClass_moEventBundleClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForSoftLinkwithMOEventClass:moEventBundleClass:");
}

id objc_msgSend_initScheduleWithHour_minute_weekdays_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initScheduleWithHour:minute:weekdays:");
}

id objc_msgSend_initSubEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initSubEvent");
}

id objc_msgSend_initWithActionMO_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActionMO:");
}

id objc_msgSend_initWithActionName_actionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActionName:actionType:");
}

id objc_msgSend_initWithActionName_actionType_actionSubtype_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActionName:actionType:actionSubtype:");
}

id objc_msgSend_initWithActionName_actionType_actionSubtype_actionMetaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActionName:actionType:actionSubtype:actionMetaData:");
}

id objc_msgSend_initWithActionName_actionType_actionSubtype_actionNameConfidence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActionName:actionType:actionSubtype:actionNameConfidence:");
}

id objc_msgSend_initWithAdvertisingCapability_serviceLevel_observationInterval_storageDuration_densityCallbackConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAdvertisingCapability:serviceLevel:observationInterval:storageDuration:densityCallbackConfiguration:");
}

id objc_msgSend_initWithAllowedCategories_dateInterval_ascending_limit_includeDeletedBundles_skipRanking_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAllowedCategories:dateInterval:ascending:limit:includeDeletedBundles:skipRanking:");
}

id objc_msgSend_initWithAllowedCategories_dateInterval_ascending_limit_includeDeletedBundles_skipRanking_interfaceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAllowedCategories:dateInterval:ascending:limit:includeDeletedBundles:skipRanking:interfaceType:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithArray_copyItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:copyItems:");
}

id objc_msgSend_initWithAscending_confidence_dateInterval_labelVisit_limit_sources_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAscending:confidence:dateInterval:labelVisit:limit:sources:");
}

id objc_msgSend_initWithBundleId_suggestionId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleId:suggestionId:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithBundleIdentifier_bundleStartDate_bundleEndDate_bundleCreationDate_bundleExpirationDate_bundleInterfaceType_bundleSourceHealthExists_bundleSourcePhotoExists_bundleSourceProactiveExists_bundleSourceRoutineExists_bundlePromptLanguageFormat_bundlePromptToneID_bundlePromptParametersAvailability_bundlePlaceType_bundlePlaceUserType_bundleBaseEventCateory_bundleEventIDs_bundleActionType_backgroundActions_bundleIsFamilyIncluded_bundleTimeTag_isBundleResourceTypeUnknown_isBundleResourceTypeValueIncluded_isBundleResourceTypePhotoAssetsIncluded_isBundleResourceTypeMediaIncluded_isBundleResourceTypeWebLinkIncluded_isBundleResourceTypeInterenceTagIncluded_bundlEngagement_bundleVersion_rankingVersion_suggestionType_suggestionTimestamp_suggestionClientIdentifier_suggestionViewContainerName_suggestionViewVisibleTime_appEntryEventType_appEntryEventClientIdentifier_appEntryEventTimestamp_appEntryEventStartTime_appEntryEventEndTime_appEntryEventTotalCharacters_appEntryEventAddedCharacters_clientActivityEventType_clientActivityEventClientIdentifier_clientActivityEventTimestamp_suggestionIdentifier_photoSourceType_photoLibraryType_bundleSourcePostAnalyticsExists_bundleSourcePDExists_bundleSourceMotionExists_bundleSourceBooksExists_bundleSourceScreenTimeExists_gaPRArray_bundlePCount_ranking_labelConfidenceScore_timeCorrelationScore_callDuration_interactionCount_interactionType_callPlace_distanceFromHome_homeAvailability_workAvailability_bundleVisitMapItemSource_bundleVisitPlaceType_bundleVisitPlaceLabelGranularity_bundleIncludesAnomalousEvent_isFiltered_bundleSuperType_bundleSubType_isAggregatedAndSuppressed_summarizationGranularity_includedInSummaryBundleOnly_subBundleIDs_subSuggestionIDs_firstCreationDate_resources_persons_mainPlace_otherPlaces_photoTraits_clusterMetadata_outlierMetadata_bundleGoodnessScore_distinctnessScore_richnessScore_engagementScore_heuristicsScore_metadataForRank_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:bundleStartDate:bundleEndDate:bundleCreationDate:bundleExpirationDate:bundleInterfaceType:bundleSourceHealthExists:bundleSourcePhotoExists:bundleSourceProactiveExists:bundleSourceRoutineExists:bundlePromptLanguageFormat:bundlePromptToneID:bundlePromptParametersAvailability:bundlePlaceType:bundlePlaceUserType:bundleBaseEventCateory:bundleEventIDs:bundleActionType:backgroundActions:bundleIsFamilyIncluded:bundleTimeTag:isBundleResourceTypeUnknown:isBundleResourceTypeValueIncluded:isBundleResourceTypePhotoAssetsIncluded:isBundleResourceTypeMediaIncluded:isBundleResourceTypeWebLinkIncluded:isBundleResourceTypeInterenceTagIncluded:bundlEngagement:bundleVersion:rankingVersion:suggestionType:suggestionTimestamp:suggestionClientIdentifier:suggestionViewContainerName:suggestionViewVisibleTime:appEntryEventType:appEntryEventClientIdentifier:appEntryEventTimestamp:appEntryEventStartTime:appEntryEventEndTime:appEntryEventTotalCharacters:appEntryEventAddedCharacters:clientActivityEventType:clientActivityEventClientIdentifier:clientActivityEventTimestamp:suggestionIdentifier:photoSourceType:photoLibraryType:bundleSourcePostAnalyticsExists:bundleSourcePDExists:bundleSourceMotionExists:bundleSourceBooksExists:bundleSourceScreenTimeExists:gaPRArray:bundlePCount:ranking:labelConfidenceScore:timeCorrelationScore:callDuration:interactionCount:interactionType:callPlace:distanceFromHome:homeAvailability:workAvailability:bundleVisitMapItemSource:bundleVisitPlaceType:bundleVisitPlaceLabelGranularity:bundleIncludesAnomalousEvent:isFiltered:bundleSuperType:bundleSubType:isAggregatedAndSuppressed:summarizationGranularity:includedInSummaryBundleOnly:subBundleIDs:subSuggestionIDs:firstCreationDate:resources:persons:mainPlace:otherPlaces:photoTraits:clusterMetadata:outlierMetadata:bundleGoodnessScore:distinctnessScore:richnessScore:engagementScore:heuristicsScore:metadataForRank:");
}

id objc_msgSend_initWithBundleIdentifier_creationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:creationDate:");
}

id objc_msgSend_initWithBundleIdentifier_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:queue:");
}

id objc_msgSend_initWithBundleIdentifier_suggestionID_bundleType_creationDate_firstCreationDate_endDate_expirationDate_events_filtered_interfaceType_photoSource_promptLanguage_source_startDate_action_concurrentMediaAction_actions_persons_place_predominantWeather_resources_time_metaDataForRank_suggestionEngagements_suggestionEngagementViewCount_appEntryEngagements_isAggregatedAndSuppressed_summarizationGranularity_places_subBundleIDs_subSuggestionIDs_includedInSummaryBundleOnly_bundleSubType_bundleSuperType_photoTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:suggestionID:bundleType:creationDate:firstCreationDate:endDate:expirationDate:events:filtered:interfaceType:photoSource:promptLanguage:source:startDate:action:concurrentMediaAction:actions:persons:place:predominantWeather:resources:time:metaDataForRank:suggestionEngagements:suggestionEngagementViewCount:appEntryEngagements:isAggregatedAndSuppressed:summarizationGranularity:places:subBundleIDs:subSuggestionIDs:includedInSummaryBundleOnly:bundleSubType:bundleSuperType:photoTraits:");
}

id objc_msgSend_initWithBundleIdentifier_suggestionID_startDate_endDate_creationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:");
}

id objc_msgSend_initWithBundleIdentifier_usingBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:usingBundle:");
}

id objc_msgSend_initWithCDContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCDContact:");
}

id objc_msgSend_initWithCDInteraction_meIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCDInteraction:meIdentifier:");
}

id objc_msgSend_initWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCString:encoding:");
}

id objc_msgSend_initWithCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCalendarIdentifier:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCategory_provider_failureCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCategory:provider:failureCount:");
}

id objc_msgSend_initWithCategory_provider_spiSuccess_spiError_failCount_successAfterPreFailCount_totalCount_rehydrationTrigger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:");
}

id objc_msgSend_initWithClusterMetadataMO_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClusterMetadataMO:");
}

id objc_msgSend_initWithConditions_formats_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConditions:formats:context:");
}

id objc_msgSend_initWithConditions_labels_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConditions:labels:context:");
}

id objc_msgSend_initWithConfig_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfig:error:");
}

id objc_msgSend_initWithConfigurationManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfigurationManager:");
}

id objc_msgSend_initWithContactIdentifier_scoredContact_interactions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContactIdentifier:scoredContact:interactions:");
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:");
}

id objc_msgSend_initWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:error:");
}

id objc_msgSend_initWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContext:");
}

id objc_msgSend_initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:");
}

id objc_msgSend_initWithDailyAggregateCallDuration_callDuration_burstyInteractionCount_burstyOutgoingInteractionCount_multipleInteractionTypes_contactLocationWork_isFamilyContact_isCoworkerContact_isRepetitiveContact_isGroupConversation_peopleCountWeightedSum_peopleCountWeightedAverage_peopleCountMax_peopleDensityWeightedSum_peopleDensityWeightedAverage_peopleDensityMax_peopleDensityWeightedConfidenceSum_peopleDensityWeightedConfidenceAverage_mediaTotalPlayTime_mediaLength_mediaActionIsRepeat_timeAtHomeDuration_photosAtHomeCurationScore_workoutDuration_motionActivityWalkSpan_visitDuration_poiCategoryInterestingness_familiarityIndex_stateOfMindDomains_stateOfMindLabels_stateOfMindReflectiveIntervals_stateOfMindValenceClassifications_stateOfMindValenceValues_stateOfMindLoggedIn3pApp_stateOfMindLoggedInJournalApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDailyAggregateCallDuration:callDuration:burstyInteractionCount:burstyOutgoingInteractionCount:multipleInteractionTypes:contactLocationWork:isFamilyContact:isCoworkerContact:isRepetitiveContact:isGroupConversation:peopleCountWeightedSum:peopleCountWeightedAverage:peopleCountMax:peopleDensityWeightedSum:peopleDensityWeightedAverage:peopleDensityMax:peopleDensityWeightedConfidenceSum:peopleDensityWeightedConfidenceAverage:mediaTotalPlayTime:mediaLength:mediaActionIsRepeat:timeAtHomeDuration:photosAtHomeCurationScore:workoutDuration:motionActivityWalkSpan:visitDuration:poiCategoryInterestingness:familiarityIndex:stateOfMindDomains:stateOfMindLabels:stateOfMindReflectiveIntervals:stateOfMindValenceClassifications:stateOfMindValenceValues:stateOfMindLoggedIn3pApp:stateOfMindLoggedInJournalApp:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDateInterval_ascending_category_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDateInterval:ascending:category:limit:");
}

id objc_msgSend_initWithDateInterval_ascending_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDateInterval:ascending:limit:");
}

id objc_msgSend_initWithDateInterval_ascending_limit_filterBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDateInterval:ascending:limit:filterBundle:");
}

id objc_msgSend_initWithDateInterval_ascending_limit_includeDeletedBundles_skipRanking_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:");
}

id objc_msgSend_initWithDateInterval_ascending_limit_includeDeletedBundles_skipRanking_interfaceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:interfaceType:");
}

id objc_msgSend_initWithDateInterval_horizontalAccuracy_batchSize_boundingBoxLocation_type_smoothingRequired_downsampleRequired_smoothingErrorThreshold_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:type:smoothingRequired:downsampleRequired:smoothingErrorThreshold:ascending:");
}

id objc_msgSend_initWithDateInterval_spatialGranularity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDateInterval:spatialGranularity:");
}

id objc_msgSend_initWithDefaultsManager_enableTrialClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDefaultsManager:enableTrialClient:");
}

id objc_msgSend_initWithDestination_destinationType_startDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDestination:destinationType:startDate:endDate:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithDisplayName_pcMetricID_unit_denominator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDisplayName:pcMetricID:unit:denominator:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithDoubleValue_unit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDoubleValue:unit:");
}

id objc_msgSend_initWithDuetStore_ppContactStore_cnContactStore_momentStore_configurationManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDuetStore:ppContactStore:cnContactStore:momentStore:configurationManager:");
}

id objc_msgSend_initWithEKEvent_calendarInternPool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEKEvent:calendarInternPool:");
}

id objc_msgSend_initWithEKOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEKOptions:");
}

id objc_msgSend_initWithEvent_bundle_isBundle_IHAState_age_ageRange_biologicalSex_startDate_endDate_categoryOfEvent_bundleInterface_bundleEvergreenType_sugSeetEngType_appEntryEngType_megaSignalTypeUsed_viewVisibleSuggestionsCount_viewTotalSuggestionsCount_onboardingFlowCompletionState_isJournalAppInstalled_isJournalAppLocked_isJournalSuggestionSkipped_isActivitySettingsSwitchEnabled_isCommunicationSettingsSwitchEnabled_isSignificantLocationSettingsSwitchEnabled_isMediaSettingsSwitchEnabled_isNearbyPeopleSettingsSwitchEnabled_isPhotoSettingsSwitchEnabled_isStateOfMindSettingsSwitchEnabled_isReflectionSettingsSwitchEnabled_isBroadSystemLocationSettingsSwitchEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEvent:bundle:isBundle:IHAState:age:ageRange:biologicalSex:startDate:endDate:categoryOfEvent:bundleInterface:bundleEvergreenType:sugSeetEngType:appEntryEngType:megaSignalTypeUsed:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:");
}

id objc_msgSend_initWithEvent_islandID_subDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEvent:islandID:subDate:");
}

id objc_msgSend_initWithEventBundle_forEmbeddingType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEventBundle:forEmbeddingType:");
}

id objc_msgSend_initWithEventBundleMO_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEventBundleMO:");
}

id objc_msgSend_initWithEventDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEventDictionary:");
}

id objc_msgSend_initWithEventIdentifier_startDate_endDate_creationDate_provider_category_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:");
}

id objc_msgSend_initWithEventIdentifier_startDate_endDate_creationDate_sourceCreationDate_expirationDate_provider_category_placeUserType_poiCategory_placeDiscovery_locationMode_workoutType_workoutBundleID_mediaGenre_mediaType_mediaRepetitions_mediaSumTimePlayed_sourceParty_mediaPlayerBundleID_numAudioMediaPlaySessionsPerDay_durationAudioMediaPlaySessionsPerDay_numVideoMediaPlaySessionsPerDay_durationVideoMediaPlaySessionsPerDay_numFirstPartyMediaPlaySessionsPerDay_numThirdPartyMediaPlaySessionsPerDay_numContacts_contactIDsInConversation_contactIDMostSignificantInConversation_interactionContactScore_textLikeMechanismIncluded_callLikeMechanismIncluded_numTextLikeInteractions_numAudioLikeInteractions_numVideoLikeInteractions_totalDurationOfCallLikeInteractions_minDurationOfCallLikeInteractions_maxDurationOfCallLikeInteractions_photoMomentSource_photoMomentInferences_photoMomentHolidays_numPhotoMomentHolidays_numPhotoMomentInferences_numPhotoMomentPublicEvents_numPhotoMomentPersons_isFamilyInPhotoMoment_momentIncludesFavoritedAsset_momentIncludesVideo_momentIncludesPhoto_suggestedEventCategory_numAttendees_numtripParts_tripMode_numScoredTopics_numItemAuthors_numItemRecipients_isGatheringComplete_gaPR_pCount_mapItemSource_placeType_placeLabelGranularity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEventIdentifier:startDate:endDate:creationDate:sourceCreationDate:expirationDate:provider:category:placeUserType:poiCategory:placeDiscovery:locationMode:workoutType:workoutBundleID:mediaGenre:mediaType:mediaRepetitions:mediaSumTimePlayed:sourceParty:mediaPlayerBundleID:numAudioMediaPlaySessionsPerDay:durationAudioMediaPlaySessionsPerDay:numVideoMediaPlaySessionsPerDay:durationVideoMediaPlaySessionsPerDay:numFirstPartyMediaPlaySessionsPerDay:numThirdPartyMediaPlaySessionsPerDay:numContacts:contactIDsInConversation:contactIDMostSignificantInConversation:interactionContactScore:textLikeMechanismIncluded:callLikeMechanismIncluded:numTextLikeInteractions:numAudioLikeInteractions:numVideoLikeInteractions:totalDurationOfCallLikeInteractions:minDurationOfCallLikeInteractions:maxDurationOfCallLikeInteractions:photoMomentSource:photoMomentInferences:photoMomentHolidays:numPhotoMomentHolidays:numPhotoMomentInferences:numPhotoMomentPublicEvents:numPhotoMomentPersons:isFamilyInPhotoMoment:momentIncludesFavoritedAsset:momentIncludesVideo:momentIncludesPhoto:suggestedEventCategory:numAttendees:numtripParts:tripMode:numScoredTopics:numItemAuthors:numItemRecipients:isGatheringComplete:gaPR:pCount:mapItemSource:placeType:placeLabelGranularity:");
}

id objc_msgSend_initWithEventMO_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEventMO:");
}

id objc_msgSend_initWithEventManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEventManager:");
}

id objc_msgSend_initWithEventManager_setDefaultValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEventManager:setDefaultValues:");
}

id objc_msgSend_initWithEventSet_filtered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEventSet:filtered:");
}

id objc_msgSend_initWithEvergreenTypeName_promptIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEvergreenTypeName:promptIndexes:");
}

id objc_msgSend_initWithFSMMO_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFSMMO:");
}

id objc_msgSend_initWithFetchRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFetchRequest:");
}

id objc_msgSend_initWithFirstObject_secondObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFirstObject:secondObject:");
}

id objc_msgSend_initWithFirstPartyAppRatio_firstPartyAppTime_musciAppTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFirstPartyAppRatio:firstPartyAppTime:musciAppTime:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithFormat_capitalizationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:capitalizationType:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithIdentifier_actionName_actionType_actionSubtype_actionNameConfidence_actionMetaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:");
}

id objc_msgSend_initWithIdentifier_isFiltered_phenoType_topLevelActivityHistogram_secondLevelActivityHistogram_activityTypeFromPhotoTraitsHistogram_timeTagHistogram_dayOfWeekHistogram_timeContextFromPhotoTraitsHistogram_placeNameHistogram_combinedPlaceTypeHistogram_enclosingPlaceNameHistogram_placeTypeFromPhotoTraitsHistogram_contactNamesHistogram_personRelationshipHistogram_socialEventFromPhotoTraitsHistogram_otherSubjectFromPhotoTraitsHistogram_subBundleGoodnessScores_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:isFiltered:phenoType:topLevelActivityHistogram:secondLevelActivityHistogram:activityTypeFromPhotoTraitsHistogram:timeTagHistogram:dayOfWeekHistogram:timeContextFromPhotoTraitsHistogram:placeNameHistogram:combinedPlaceTypeHistogram:enclosingPlaceNameHistogram:placeTypeFromPhotoTraitsHistogram:contactNamesHistogram:personRelationshipHistogram:socialEventFromPhotoTraitsHistogram:otherSubjectFromPhotoTraitsHistogram:subBundleGoodnessScores:");
}

id objc_msgSend_initWithIdentifier_name_relevantAssetUUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:name:relevantAssetUUIDs:");
}

id objc_msgSend_initWithIdentifier_name_type_assets_data_value_priorityScore_photoCurationScore_photoFaceCount_photoAssetMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:");
}

id objc_msgSend_initWithIdentifier_personId_displayName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:personId:displayName:");
}

id objc_msgSend_initWithIdentifier_phenoType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:phenoType:");
}

id objc_msgSend_initWithIdentifier_placeName_enclosingArea_placeType_placeUserType_location_locationMode_poiCategory_distanceToHomeInMiles_placeNameConfidence_familiarityIndexLOI_priorityScore_startDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:");
}

id objc_msgSend_initWithIdentifier_startDate_endDate_interfaceType_rankingScore_attachedPhotoAssets_bundleInterfaceType_bundleEvergreenType_bundleSubType_bundleSuperType_bundleGoodnessScore_ordinalRankInRecommendedTab_visibilityCategoryForUI_assets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:startDate:endDate:interfaceType:rankingScore:attachedPhotoAssets:bundleInterfaceType:bundleEvergreenType:bundleSubType:bundleSuperType:bundleGoodnessScore:ordinalRankInRecommendedTab:visibilityCategoryForUI:assets:");
}

id objc_msgSend_initWithIdentifier_startDate_endDate_mechanism_direction_bundleId_groupName_sender_recipients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:startDate:endDate:mechanism:direction:bundleId:groupName:sender:recipients:");
}

id objc_msgSend_initWithIdentifier_timestamp_timeString_timeZone_timeTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:timestamp:timeString:timeZone:timeTag:");
}

id objc_msgSend_initWithIdentifier_updateDate_isSignificant_outlierScore_outlierScoreThreshold_bundleGoodnessScore_bundleGoodnessScoreThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:updateDate:isSignificant:outlierScore:outlierScoreThreshold:bundleGoodnessScore:bundleGoodnessScoreThreshold:");
}

id objc_msgSend_initWithIdentifiers_ascending_filterBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifiers:ascending:filterBundle:");
}

id objc_msgSend_initWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInt:");
}

id objc_msgSend_initWithIsFiltered_isTopLevelActivityTypePhenotypeDetected_isSecondLevelActivityTypePhenotypeDetected_isWeekendPhenotypeDetected_isTimeTagPhenotypeDetected_isDayOfWeekPhenotypeDetected_isPlaceNamePhenotypeDetected_isCombinedPlacePhenotypeDetected_isEnclosingAreaNamePhenotypeDetected_isPersonsPhenotypeDetected_isPersonRelationshipPhenotypeDetected_isActivityTypeFromPhotoTraitsPhenotypeDetected_isTimeContextFromPhotoTraitsPhenotypeDetected_isLocationContextFromPhotoTraitsPhenotypeDetected_isSocialContextFromPhotoTraitsPhenotypeDetected_isExtraContextFromPhotoTraitsPhenotypeDetected_isOtherSubjectFromPhotoTraitsPhenotypeDetected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIsFiltered:isTopLevelActivityTypePhenotypeDetected:isSecondLevelActivityTypePhenotypeDetected:isWeekendPhenotypeDetected:isTimeTagPhenotypeDetected:isDayOfWeekPhenotypeDetected:isPlaceNamePhenotypeDetected:isCombinedPlacePhenotypeDetected:isEnclosingAreaNamePhenotypeDetected:isPersonsPhenotypeDetected:isPersonRelationshipPhenotypeDetected:isActivityTypeFromPhotoTraitsPhenotypeDetected:isTimeContextFromPhotoTraitsPhenotypeDetected:isLocationContextFromPhotoTraitsPhenotypeDetected:isSocialContextFromPhotoTraitsPhenotypeDetected:isExtraContextFromPhotoTraitsPhenotypeDetected:isOtherSubjectFromPhotoTraitsPhenotypeDetected:");
}

id objc_msgSend_initWithIsSignificant_outlierScore_updatedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIsSignificant:outlierScore:updatedDate:");
}

id objc_msgSend_initWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:ascending:");
}

id objc_msgSend_initWithKeyword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKeyword:");
}

id objc_msgSend_initWithKeyword_category_trainDateInterval_testDateInterval_aggregationDuration_aggregationMethod_valueFunction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueFunction:");
}

id objc_msgSend_initWithKeyword_category_trainDateInterval_testDateInterval_aggregationDuration_aggregationMethod_valueType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueType:");
}

id objc_msgSend_initWithKeyword_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKeyword:value:");
}

id objc_msgSend_initWithLatitude_longitude_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLatitude:longitude:");
}

id objc_msgSend_initWithLatitude_longitude_horizontalUncertainty_date_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLatitude:longitude:horizontalUncertainty:date:");
}

id objc_msgSend_initWithLifeEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLifeEvent:");
}

id objc_msgSend_initWithLocalIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocalIdentifier:");
}

id objc_msgSend_initWithLocalIdentifier_name_contactIdentifier_family_isPHPersonTypeImportant_isMePerson_mePersonIdentified_personRelationships_priorityScore_significanceScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocalIdentifier:name:contactIdentifier:family:isPHPersonTypeImportant:isMePerson:mePersonIdentified:personRelationships:priorityScore:significanceScore:");
}

id objc_msgSend_initWithLocalIdentifier_name_contactIdentifier_family_priorityScore_significanceScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocalIdentifier:name:contactIdentifier:family:priorityScore:significanceScore:");
}

id objc_msgSend_initWithLocalToPhotoLibraryIdentifier_location_mediaType_mediaSubtypes_favorite_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocalToPhotoLibraryIdentifier:location:mediaType:mediaSubtypes:favorite:");
}

id objc_msgSend_initWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocaleIdentifier:");
}

id objc_msgSend_initWithLoggingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLoggingEnabled:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:");
}

id objc_msgSend_initWithName_cadenceInSeconds_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:cadenceInSeconds:andHandler:");
}

id objc_msgSend_initWithName_managedObjectModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:managedObjectModel:");
}

id objc_msgSend_initWithName_mapItemHandle_priorityScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:mapItemHandle:priorityScore:");
}

id objc_msgSend_initWithName_measureRecentPeak_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:measureRecentPeak:");
}

id objc_msgSend_initWithName_mode_state_subState_timeRangeStartDate_timeRangeEndDate_lastProcessedDate_metaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:mode:state:subState:timeRangeStartDate:timeRangeEndDate:lastProcessedDate:metaData:");
}

id objc_msgSend_initWithName_performers_venue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:performers:venue:");
}

id objc_msgSend_initWithName_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:type:");
}

id objc_msgSend_initWithName_type_assets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:type:assets:");
}

id objc_msgSend_initWithName_type_dict_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:type:dict:value:");
}

id objc_msgSend_initWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:value:");
}

id objc_msgSend_initWithNotificationEventTimestamp_notificationPostingTimestamp_notificationSuggestionCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNotificationEventTimestamp:notificationPostingTimestamp:notificationSuggestionCount:");
}

id objc_msgSend_initWithNotifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNotifier:");
}

id objc_msgSend_initWithNowPlayingEvent_name_isRemote_deviceSource_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNowPlayingEvent:name:isRemote:deviceSource:timestamp:");
}

id objc_msgSend_initWithNowPlayingStream_momentStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNowPlayingStream:momentStore:");
}

id objc_msgSend_initWithNumVertices_edges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNumVertices:edges:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithObjects_others_comparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:others:comparator:");
}

id objc_msgSend_initWithOutlierMetadataMO_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOutlierMetadataMO:");
}

id objc_msgSend_initWithParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParameters:");
}

id objc_msgSend_initWithPersistenceManager_andConfigurationManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersistenceManager:andConfigurationManager:");
}

id objc_msgSend_initWithPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPerson:");
}

id objc_msgSend_initWithPersonDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersonDictionary:");
}

id objc_msgSend_initWithPersonMO_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersonMO:");
}

id objc_msgSend_initWithPersonRelationshipMO_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersonRelationshipMO:");
}

id objc_msgSend_initWithPersonRelationshipTag_score_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersonRelationshipTag:score:");
}

id objc_msgSend_initWithPersonRelationships_isMEPerson_significanceScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersonRelationships:isMEPerson:significanceScore:");
}

id objc_msgSend_initWithPhotoTraitMO_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPhotoTraitMO:");
}

id objc_msgSend_initWithPlace_startDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlace:startDate:endDate:");
}

id objc_msgSend_initWithPlaceInferencePlaceType_placeInferenceUserSpecificPlaceType_geoPOICategoryType_placeNameConfidence_familiarityIndexLOI_distanceToHomeInMiles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlaceInferencePlaceType:placeInferenceUserSpecificPlaceType:geoPOICategoryType:placeNameConfidence:familiarityIndexLOI:distanceToHomeInMiles:");
}

id objc_msgSend_initWithPlaceMO_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlaceMO:");
}

id objc_msgSend_initWithPlaceName_enclosingArea_placeType_placeUserType_location_locationMode_poiCategory_distanceToHomeInMiles_placeNameConfidence_familiarityIndexLOI_startDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlaceName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:startDate:endDate:");
}

id objc_msgSend_initWithPlaceName_placeType_placeUserType_location_locationMode_poiCategory_distanceToHomeInMiles_placeNameConfidence_familiarityIndexLOI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlaceName:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:");
}

id objc_msgSend_initWithPortraitStore_momentStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPortraitStore:momentStore:");
}

id objc_msgSend_initWithPortraitStore_momentStore_configurationManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPortraitStore:momentStore:configurationManager:");
}

id objc_msgSend_initWithQueryDescriptors_limit_resultsHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueryDescriptors:limit:resultsHandler:");
}

id objc_msgSend_initWithRandomization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRandomization:");
}

id objc_msgSend_initWithRelationship_score_source_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRelationship:score:source:");
}

id objc_msgSend_initWithResourceMO_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithResourceMO:");
}

id objc_msgSend_initWithRestorationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRestorationIdentifier:");
}

id objc_msgSend_initWithRoute_dataHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRoute:dataHandler:");
}

id objc_msgSend_initWithSampleType_predicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSampleType:predicate:");
}

id objc_msgSend_initWithSampleType_predicate_limit_sortDescriptors_resultsHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:");
}

id objc_msgSend_initWithScoredContact_interactionScore_interaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithScoredContact:interactionScore:interaction:");
}

id objc_msgSend_initWithServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServiceName:");
}

id objc_msgSend_initWithStartDate_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartDate:duration:");
}

id objc_msgSend_initWithStartDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartDate:endDate:");
}

id objc_msgSend_initWithStartDate_endDate_EventManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartDate:endDate:EventManager:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithSuggestionEvent_entryEvent_clientActivityEvent_onboardingFlowCompletionState_isJournalAppInstalled_isJournalAppLocked_isJournalSuggestionSkipped_isActivitySettingsSwitchEnabled_isCommunicationSettingsSwitchEnabled_isSignificantLocationSettingsSwitchEnabled_isMediaSettingsSwitchEnabled_isNearbyPeopleSettingsSwitchEnabled_isPhotoSettingsSwitchEnabled_isStateOfMindSettingsSwitchEnabled_isReflectionSettingsSwitchEnabled_isBroadSystemLocationSettingsSwitchEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuggestionEvent:entryEvent:clientActivityEvent:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithSymbol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSymbol:");
}

id objc_msgSend_initWithTagThresholds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTagThresholds:");
}

id objc_msgSend_initWithTemplatePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTemplatePath:");
}

id objc_msgSend_initWithTimeInterval_sinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimeInterval:sinceDate:");
}

id objc_msgSend_initWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_initWithTimeMO_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimeMO:");
}

id objc_msgSend_initWithTimeSeries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimeSeries:");
}

id objc_msgSend_initWithTimeTag_dateInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimeTag:dateInterval:");
}

id objc_msgSend_initWithTimestamp_timeString_timeZone_timeTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimestamp:timeString:timeZone:timeTag:");
}

id objc_msgSend_initWithTitle_album_bundleId_productId_genre_mediaType_artist_startDate_endDate_duration_isRemote_deviceSource_bgColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:");
}

id objc_msgSend_initWithTitle_album_bundleId_productId_genre_mediaType_artist_sumTimePlayed_repetitions_mediaPlaySessions_firstPartyTimePlayedRatio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:album:bundleId:productId:genre:mediaType:artist:sumTimePlayed:repetitions:mediaPlaySessions:firstPartyTimePlayedRatio:");
}

id objc_msgSend_initWithTopicStore_momentStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTopicStore:momentStore:");
}

id objc_msgSend_initWithType_actionName_actionNameConfidence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:actionName:actionNameConfidence:");
}

id objc_msgSend_initWithType_clientIdentifier_clientVersion_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:clientIdentifier:clientVersion:bag:");
}

id objc_msgSend_initWithType_clientIdentifier_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:clientIdentifier:timestamp:");
}

id objc_msgSend_initWithType_clientIdentifier_timestamp_identifier_startTime_endTime_totalCharacters_addedCharacters_usedPhotoAssets_appEntryEventType_bundleInterfaceTypes_bundleEvergreenTypes_bundleSummary_assets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:clientIdentifier:timestamp:identifier:startTime:endTime:totalCharacters:addedCharacters:usedPhotoAssets:appEntryEventType:bundleInterfaceTypes:bundleEvergreenTypes:bundleSummary:assets:");
}

id objc_msgSend_initWithType_photoAssetMediaType_photoFaceCount_photoCurationScore_photoOverallAestheticScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:photoAssetMediaType:photoFaceCount:photoCurationScore:photoOverallAestheticScore:");
}

id objc_msgSend_initWithType_predicate_anchor_limit_resultsHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:predicate:anchor:limit:resultsHandler:");
}

id objc_msgSend_initWithType_timestamp_clientIdentifier_viewContainerName_viewVisibleTime_suggestionType_viewVisibleSuggestionsCount_viewTotalSuggestionsCount_typeAppEntry_typeAppEntryStr_timestampAppEntry_startTimeAppEntry_endTimeAppEntry_clientIdentifierAppEntry_totalCharactersAppEntry_addedCharactersAppEntry_engagementSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:timestamp:clientIdentifier:viewContainerName:viewVisibleTime:suggestionType:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:typeAppEntry:typeAppEntryStr:timestampAppEntry:startTimeAppEntry:endTimeAppEntry:clientIdentifierAppEntry:totalCharactersAppEntry:addedCharactersAppEntry:engagementSource:");
}

id objc_msgSend_initWithType_timestamp_fullBundleOrderedSet_clientIdentifier_viewContainerName_viewVisibleTime_suggestionType_viewVisibleSuggestionsCount_viewTotalSuggestionsCount_notificationInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:timestamp:fullBundleOrderedSet:clientIdentifier:viewContainerName:viewVisibleTime:suggestionType:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:notificationInfo:");
}

id objc_msgSend_initWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithUniverse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUniverse:");
}

id objc_msgSend_initWithUniverseDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUniverseDictionary:");
}

id objc_msgSend_initWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUnsignedInteger:");
}

id objc_msgSend_initWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUnsignedLong:");
}

id objc_msgSend_initWithWeather_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWeather:");
}

id objc_msgSend_initWithWeatherIdentifier_startDate_endDate_weatherSummary_weatherSymbolName_temperature_windSpeed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWeatherIdentifier:startDate:endDate:weatherSummary:weatherSymbolName:temperature:windSpeed:");
}

id objc_msgSend_initWithWeatherMO_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWeatherMO:");
}

id objc_msgSend_initWithembeddingDistanceWeights_minPoints_minClusterSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithembeddingDistanceWeights:minPoints:minClusterSize:");
}

id objc_msgSend_initializeVisualIdentifierView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeVisualIdentifierView");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerKeys");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interactionContactScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interactionContactScore");
}

id objc_msgSend_interactionContacts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interactionContacts");
}

id objc_msgSend_interactionCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interactionCount");
}

id objc_msgSend_interactionGroupName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interactionGroupName");
}

id objc_msgSend_interactionKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interactionKey");
}

id objc_msgSend_interactionMechanisms(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interactionMechanisms");
}

id objc_msgSend_interactionScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interactionScore");
}

id objc_msgSend_interactionScoredContact(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interactionScoredContact");
}

id objc_msgSend_interactionStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interactionStore");
}

id objc_msgSend_interactionType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interactionType");
}

id objc_msgSend_interactions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interactions");
}

id objc_msgSend_interestingPOIDurationInTrip_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interestingPOIDurationInTrip:");
}

id objc_msgSend_interestingPOIFeature(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interestingPOIFeature");
}

id objc_msgSend_interfaceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceType");
}

id objc_msgSend_interfaceTypeCountFromSuggestionEngagementDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceTypeCountFromSuggestionEngagementDict");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_internalQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "internalQueue");
}

id objc_msgSend_intersectSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectSet:");
}

id objc_msgSend_intersectedActivityOrVisitForObject_other_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectedActivityOrVisitForObject:other:");
}

id objc_msgSend_intersectedSubBundleIDForObject_other_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectedSubBundleIDForObject:other:");
}

id objc_msgSend_intersectionWithDateInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectionWithDateInterval:");
}

id objc_msgSend_intersectsDateInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectsDateInterval:");
}

id objc_msgSend_intersectsSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectsSet:");
}

id objc_msgSend_interval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interval");
}

id objc_msgSend_intervalsFromEvents_boundaryInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intervalsFromEvents:boundaryInterval:");
}

id objc_msgSend_intializeEntityTaggingService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intializeEntityTaggingService");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isActivitySettingsSwitchEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isActivitySettingsSwitchEnabled");
}

id objc_msgSend_isAfterDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAfterDate:");
}

id objc_msgSend_isAggregatedAndSuppressed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAggregatedAndSuppressed");
}

id objc_msgSend_isAllowedToCollectAndCompute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAllowedToCollectAndCompute");
}

id objc_msgSend_isAllowedToProcessEventCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAllowedToProcessEventCategory:");
}

id objc_msgSend_isAllowedToPromptEventCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAllowedToPromptEventCategory:");
}

id objc_msgSend_isAllowedToPromptResourceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAllowedToPromptResourceType:");
}

id objc_msgSend_isBeforeDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBeforeDate:");
}

id objc_msgSend_isBroadSystemLocationSettingsSwitchEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBroadSystemLocationSettingsSwitchEnabled");
}

id objc_msgSend_isBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBundle");
}

id objc_msgSend_isBundle_insideTheSameDayAsOtherBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBundle:insideTheSameDayAsOtherBundle:");
}

id objc_msgSend_isBundleActionSpecific(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBundleActionSpecific");
}

id objc_msgSend_isBundleAggregated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBundleAggregated");
}

id objc_msgSend_isBundlePlaceTypeSpecific(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBundlePlaceTypeSpecific");
}

id objc_msgSend_isBundleTimeTagSpecific(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBundleTimeTagSpecific");
}

id objc_msgSend_isCandidateForMemoryEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCandidateForMemoryEvent:");
}

id objc_msgSend_isClusteringResultValid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isClusteringResultValid");
}

id objc_msgSend_isCommunicationSettingsSwitchEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCommunicationSettingsSwitchEnabled");
}

id objc_msgSend_isCoworkerContact(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCoworkerContact");
}

id objc_msgSend_isDataDumpEnabledForTrigger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDataDumpEnabledForTrigger:");
}

id objc_msgSend_isDate_equalToDate_toUnitGranularity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDate:equalToDate:toUnitGranularity:");
}

id objc_msgSend_isDate_inSameDayAsDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDate:inSameDayAsDate:");
}

id objc_msgSend_isDateInToday_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDateInToday:");
}

id objc_msgSend_isDateInTomorrow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDateInTomorrow:");
}

id objc_msgSend_isDateInWeekend_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDateInWeekend:");
}

id objc_msgSend_isDateInYesterday_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDateInYesterday:");
}

id objc_msgSend_isDesirableCategoryOrTrigger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDesirableCategoryOrTrigger:");
}

id objc_msgSend_isDiagnosticSubmissionAllowed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDiagnosticSubmissionAllowed");
}

id objc_msgSend_isDominantPlaceForVisits_startDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDominantPlaceForVisits:startDate:endDate:");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEnabled");
}

id objc_msgSend_isEnriched(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEnriched");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualBaseActionForObject_other_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualBaseActionForObject:other:");
}

id objc_msgSend_isEqualBasicPropertiesForObject_other_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualBasicPropertiesForObject:other:");
}

id objc_msgSend_isEqualPersonsForObject_other_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualPersonsForObject:other:");
}

id objc_msgSend_isEqualPropertyForObject_other_propertyPath_threshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualPropertyForObject:other:propertyPath:threshold:");
}

id objc_msgSend_isEqualResourcesForObject_other_resourceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualResourcesForObject:other:resourceType:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToConversation:");
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDate:");
}

id objc_msgSend_isEqualToDateInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDateInterval:");
}

id objc_msgSend_isEqualToEventBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToEventBundle:");
}

id objc_msgSend_isEqualToFetchOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToFetchOptions:");
}

id objc_msgSend_isEqualToLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToLocation:");
}

id objc_msgSend_isEqualToMediaPlay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToMediaPlay:");
}

id objc_msgSend_isEqualToMediaPlaySession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToMediaPlaySession:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToSet:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isEqualToTimeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToTimeZone:");
}

id objc_msgSend_isEqualToVisitMoment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToVisitMoment:");
}

id objc_msgSend_isEvergreenBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEvergreenBundle:");
}

id objc_msgSend_isEvergreenEngagementScoreParamsUpdateOnHold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEvergreenEngagementScoreParamsUpdateOnHold");
}

id objc_msgSend_isFamilyContact(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFamilyContact");
}

id objc_msgSend_isFavorite(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFavorite");
}

id objc_msgSend_isFiltered(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFiltered");
}

id objc_msgSend_isFirstPartyApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFirstPartyApp:");
}

id objc_msgSend_isFitnessPlusSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFitnessPlusSession");
}

id objc_msgSend_isFlightBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFlightBundle:");
}

id objc_msgSend_isFollowingDayAfterDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFollowingDayAfterDate:");
}

id objc_msgSend_isFollowingMonthAfterDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFollowingMonthAfterDate:");
}

id objc_msgSend_isFollowingWeekAfterDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFollowingWeekAfterDate:");
}

id objc_msgSend_isFollowingYearAfterDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFollowingYearAfterDate:");
}

id objc_msgSend_isFromMe(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFromMe");
}

id objc_msgSend_isGComplete(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isGComplete");
}

id objc_msgSend_isGatheringComplete(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isGatheringComplete");
}

id objc_msgSend_isGroupConversation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isGroupConversation");
}

id objc_msgSend_isGroupingEligibleForEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isGroupingEligibleForEvent:");
}

id objc_msgSend_isHealthDataSubmissionAllowed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHealthDataSubmissionAllowed");
}

id objc_msgSend_isHighConfidence(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHighConfidence");
}

id objc_msgSend_isHomeWorkVisit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHomeWorkVisit");
}

id objc_msgSend_isIndoors(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isIndoors");
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInternalBuild");
}

id objc_msgSend_isInvalid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInvalid");
}

id objc_msgSend_isJournalAppInstalled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isJournalAppInstalled");
}

id objc_msgSend_isJournalAppLocked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isJournalAppLocked");
}

id objc_msgSend_isJournalSuggestionSkipped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isJournalSuggestionSkipped");
}

id objc_msgSend_isMe(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMe");
}

id objc_msgSend_isMePerson(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMePerson");
}

id objc_msgSend_isMediaSettingsSwitchEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMediaSettingsSwitchEnabled");
}

id objc_msgSend_isNearbyPeopleSettingsSwitchEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNearbyPeopleSettingsSwitchEnabled");
}

id objc_msgSend_isOnOrAfter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isOnOrAfter:");
}

id objc_msgSend_isOnOrBefore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isOnOrBefore:");
}

id objc_msgSend_isOutingBundleFromHomeOrWorkVisit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isOutingBundleFromHomeOrWorkVisit:");
}

id objc_msgSend_isOutingBundleInsideOneDay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isOutingBundleInsideOneDay:");
}

id objc_msgSend_isPHPersonTypeImportant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPHPersonTypeImportant");
}

id objc_msgSend_isParamsUpdateOnHold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isParamsUpdateOnHold");
}

id objc_msgSend_isPhotoSettingsSwitchEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPhotoSettingsSwitchEnabled");
}

id objc_msgSend_isPinned(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPinned");
}

id objc_msgSend_isPreOnboardedVisit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPreOnboardedVisit");
}

id objc_msgSend_isPreferredLanguageMidSentenceCaseCapable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPreferredLanguageMidSentenceCaseCapable");
}

id objc_msgSend_isPreferredLanguageNounCap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPreferredLanguageNounCap");
}

id objc_msgSend_isPreferredLanguageTitlecaseCapable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPreferredLanguageTitlecaseCapable");
}

id objc_msgSend_isReadyToSubmitAnalytics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isReadyToSubmitAnalytics");
}

id objc_msgSend_isReflectionSettingsSwitchEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isReflectionSettingsSwitchEnabled");
}

id objc_msgSend_isRejected(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRejected");
}

id objc_msgSend_isRemote(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRemote");
}

id objc_msgSend_isRepetitiveContact(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRepetitiveContact");
}

id objc_msgSend_isSameDayOfEvent_trip_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSameDayOfEvent:trip:");
}

id objc_msgSend_isSameDayWithDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSameDayWithDate:");
}

id objc_msgSend_isSameDayWithDate_timeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSameDayWithDate:timeZone:");
}

id objc_msgSend_isSameMonthWithDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSameMonthWithDate:");
}

id objc_msgSend_isSameWeekWithDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSameWeekWithDate:");
}

id objc_msgSend_isSameYearWithDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSameYearWithDate:");
}

id objc_msgSend_isScoredContactUsable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isScoredContactUsable");
}

id objc_msgSend_isSeedBuild(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSeedBuild");
}

id objc_msgSend_isSensitivePOI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSensitivePOI");
}

id objc_msgSend_isServiceAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isServiceAvailable");
}

id objc_msgSend_isShortVisit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isShortVisit");
}

id objc_msgSend_isSignificant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSignificant");
}

id objc_msgSend_isSignificantContactWithHighSignificanceScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSignificantContactWithHighSignificanceScore");
}

id objc_msgSend_isSignificantLocationSettingsSwitchEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSignificantLocationSettingsSwitchEnabled");
}

id objc_msgSend_isStateOfMindSettingsSwitchEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isStateOfMindSettingsSwitchEnabled");
}

id objc_msgSend_isSubsetOfSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubsetOfSet:");
}

id objc_msgSend_isValidJSONObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidJSONObject:");
}

id objc_msgSend_isValidThirdPartyEvent_bundleCategory_mediaTypeString_playTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidThirdPartyEvent:bundleCategory:mediaTypeString:playTime:");
}

id objc_msgSend_isVerified(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isVerified");
}

id objc_msgSend_isWorkVisit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isWorkVisit");
}

id objc_msgSend_itemAttributionsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemAttributionsCount");
}

id objc_msgSend_itemFromMeFeature(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemFromMeFeature");
}

id objc_msgSend_itemIsPinned(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemIsPinned");
}

id objc_msgSend_itemRecipients(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemRecipients");
}

id objc_msgSend_itemSenders(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemSenders");
}

id objc_msgSend_itemShareDirection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemShareDirection");
}

id objc_msgSend_itemSyndicationStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemSyndicationStatus");
}

id objc_msgSend_itemURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemURL");
}

id objc_msgSend_iterRankedContactsWithQuery_error_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iterRankedContactsWithQuery:error:block:");
}

id objc_msgSend_iterScoredEventsWithQuery_error_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iterScoredEventsWithQuery:error:block:");
}

id objc_msgSend_iterScoresForTopicMapping_query_error_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iterScoresForTopicMapping:query:error:block:");
}

id objc_msgSend_journalEntryIsCancelled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "journalEntryIsCancelled");
}

id objc_msgSend_journalEntryIsCreated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "journalEntryIsCreated");
}

id objc_msgSend_journalEntryIsDeleted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "journalEntryIsDeleted");
}

id objc_msgSend_journalEntryIsEdited(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "journalEntryIsEdited");
}

id objc_msgSend_jsonDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "jsonDictionary");
}

id objc_msgSend_keysOfEntriesPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysOfEntriesPassingTest:");
}

id objc_msgSend_keysSortedByValueUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysSortedByValueUsingComparator:");
}

id objc_msgSend_keysSortedByValueUsingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysSortedByValueUsingSelector:");
}

id objc_msgSend_keyword(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyword");
}

id objc_msgSend_keywordForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keywordForDate:");
}

id objc_msgSend_keywordForEventBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keywordForEventBundle:");
}

id objc_msgSend_keywordForTemplateType_bundleType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keywordForTemplateType:bundleType:");
}

id objc_msgSend_keywordFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keywordFromString:");
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kind");
}

id objc_msgSend_kindnessEvergreenTypeEngagementWeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kindnessEvergreenTypeEngagementWeight");
}

id objc_msgSend_labelConfidenceForEventBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labelConfidenceForEventBundle:");
}

id objc_msgSend_labelConfidenceScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labelConfidenceScore");
}

id objc_msgSend_labelConfidenceScoreFeature(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labelConfidenceScoreFeature");
}

id objc_msgSend_labelQualityScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labelQualityScore");
}

id objc_msgSend_labelSpecificityNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labelSpecificityNormalized");
}

id objc_msgSend_labels(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labels");
}

id objc_msgSend_largeAoiMergingRangeMinimumThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "largeAoiMergingRangeMinimumThreshold");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastProcessedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastProcessedDate");
}

id objc_msgSend_laterDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "laterDate:");
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "latitude");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_levelForFactor_withNamespaceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "levelForFactor:withNamespaceName:");
}

id objc_msgSend_levelOneOfCase(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "levelOneOfCase");
}

id objc_msgSend_librarySpecificFetchOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "librarySpecificFetchOptions");
}

id objc_msgSend_lifeEventCategory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lifeEventCategory");
}

id objc_msgSend_lifeEventContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lifeEventContext");
}

id objc_msgSend_lifeEventManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lifeEventManager");
}

id objc_msgSend_likelySamePlaceCheckForEvent_otherEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "likelySamePlaceCheckForEvent:otherEvent:");
}

id objc_msgSend_likelySamePlaceCheckForEvent_otherEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "likelySamePlaceCheckForEvent:otherEvents:");
}

id objc_msgSend_limit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "limit");
}

id objc_msgSend_loadDictionaryFromPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadDictionaryFromPath:");
}

id objc_msgSend_loadDistanceMatrix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadDistanceMatrix:");
}

id objc_msgSend_loadLabelTemplatesFromDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadLabelTemplatesFromDirectory:");
}

id objc_msgSend_loadPersistentStoresWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadPersistentStoresWithCompletionHandler:");
}

id objc_msgSend_loadStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadStore");
}

id objc_msgSend_loadSummaryTripMonitorFromStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadSummaryTripMonitorFromStore:");
}

id objc_msgSend_localEndDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localEndDate");
}

id objc_msgSend_localIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localIdentifier");
}

id objc_msgSend_localStartDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localStartDate");
}

id objc_msgSend_localTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localTime");
}

id objc_msgSend_localTimeOfDate_timeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localTimeOfDate:timeZone:");
}

id objc_msgSend_localToPhotoLibraryIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localToPhotoLibraryIdentifier");
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localeIdentifier");
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localeWithLocaleIdentifier:");
}

id objc_msgSend_locality(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locality");
}

id objc_msgSend_localizedCapitalizedString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedCapitalizedString");
}

id objc_msgSend_localizedDateStringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDateStringFromDate:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedFullName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedFullName");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedName");
}

id objc_msgSend_localizedString_withTable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedString:withTable:");
}

id objc_msgSend_localizedStringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringFromDate_dateStyle_timeStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringFromDate:dateStyle:timeStyle:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_localizedUppercaseString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedUppercaseString");
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "location");
}

id objc_msgSend_locationContextEmbedding(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationContextEmbedding");
}

id objc_msgSend_locationFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationFromDictionary:");
}

id objc_msgSend_locationMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationMode");
}

id objc_msgSend_locations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locations");
}

id objc_msgSend_locationsFromMotionEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationsFromMotionEvents:");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lock");
}

id objc_msgSend_loiIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loiIdentifier");
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longValue");
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longitude");
}

id objc_msgSend_lookupTrendsDataWithOptions_events_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lookupTrendsDataWithOptions:events:");
}

id objc_msgSend_lowerCaseArrayOfStrings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lowerCaseArrayOfStrings:");
}

id objc_msgSend_lowercaseLetterCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lowercaseLetterCharacterSet");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainPlace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainPlace");
}

id objc_msgSend_majorVisitsFromVisits_referenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "majorVisitsFromVisits:referenceDate:");
}

id objc_msgSend_majorityGroupFromEvents_propertyPath_valuePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "majorityGroupFromEvents:propertyPath:valuePath:");
}

id objc_msgSend_makeDuplicationHashForEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeDuplicationHashForEvent:");
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedObjectContext");
}

id objc_msgSend_managedObjectWithEvent_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedObjectWithEvent:inManagedObjectContext:");
}

id objc_msgSend_managedObjectWithEventBundle_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedObjectWithEventBundle:inManagedObjectContext:");
}

id objc_msgSend_managedObjectWithObject_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedObjectWithObject:inManagedObjectContext:");
}

id objc_msgSend_managedObjectWithObject_inManagedObjectContext_forContext_forEvergreenScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedObjectWithObject:inManagedObjectContext:forContext:forEvergreenScore:");
}

id objc_msgSend_mapBurstyInteractionCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapBurstyInteractionCount:");
}

id objc_msgSend_mapCallDurationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapCallDurationType:");
}

id objc_msgSend_mapDistanceToHomeInMiles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapDistanceToHomeInMiles:");
}

id objc_msgSend_mapGEOPOICategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapGEOPOICategory:");
}

id objc_msgSend_mapItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapItem");
}

id objc_msgSend_mapItemID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapItemID");
}

id objc_msgSend_mapItemLocation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapItemLocation");
}

id objc_msgSend_mapItemPlaceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapItemPlaceType");
}

id objc_msgSend_mapLabelConfidenceScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapLabelConfidenceScore:");
}

id objc_msgSend_mapMediaGenre_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapMediaGenre:");
}

id objc_msgSend_mapMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapMediaType:");
}

id objc_msgSend_mapOnboardingFlowCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapOnboardingFlowCompletion:");
}

id objc_msgSend_mapPersonRelationshipTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapPersonRelationshipTag:");
}

id objc_msgSend_mapSourceBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapSourceBundleID:");
}

id objc_msgSend_mapTimeCorrelationScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapTimeCorrelationScore:");
}

id objc_msgSend_mapVisitPlaceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapVisitPlaceType:");
}

id objc_msgSend_mask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mask");
}

id objc_msgSend_matchedEventBundleForEventBundle_otherEventBundles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "matchedEventBundleForEventBundle:otherEventBundles:");
}

id objc_msgSend_matchesInString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "matchesInString:options:range:");
}

id objc_msgSend_materializeTripBundle_contextEvents_updateWithFilteredEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "materializeTripBundle:contextEvents:updateWithFilteredEvents:");
}

id objc_msgSend_max(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "max");
}

id objc_msgSend_maxDistanceSpanFromStartUsingSparseLocations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxDistanceSpanFromStartUsingSparseLocations:");
}

id objc_msgSend_maxTimeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxTimeout");
}

id objc_msgSend_maximumCommuteDistanceForTripThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maximumCommuteDistanceForTripThreshold");
}

id objc_msgSend_maximumDistanceFromBundle_toBundleCluster_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maximumDistanceFromBundle:toBundleCluster:");
}

id objc_msgSend_maximumWatchPhoneVisitDistance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maximumWatchPhoneVisitDistance");
}

id objc_msgSend_meContact(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "meContact");
}

id objc_msgSend_mePerson(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mePerson");
}

id objc_msgSend_mePersonIdentified(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mePersonIdentified");
}

id objc_msgSend_mealtagFromStartDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mealtagFromStartDate:endDate:");
}

id objc_msgSend_mean(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mean");
}

id objc_msgSend_meanOf_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "meanOf:");
}

id objc_msgSend_mechanism(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mechanism");
}

id objc_msgSend_mediaAlbum(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaAlbum");
}

id objc_msgSend_mediaAnalysisProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaAnalysisProperties");
}

id objc_msgSend_mediaArtist(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaArtist");
}

id objc_msgSend_mediaBundleMaxResourcesPerBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaBundleMaxResourcesPerBundle");
}

id objc_msgSend_mediaEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaEvent");
}

id objc_msgSend_mediaFirstPartyTimePlayedRatio(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaFirstPartyTimePlayedRatio");
}

id objc_msgSend_mediaGenre(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaGenre");
}

id objc_msgSend_mediaKeywordWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaKeywordWithType:");
}

id objc_msgSend_mediaPlaySessions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaPlaySessions");
}

id objc_msgSend_mediaPlayerBundleId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaPlayerBundleId");
}

id objc_msgSend_mediaProductId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaProductId");
}

id objc_msgSend_mediaRepetitions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaRepetitions");
}

id objc_msgSend_mediaScoreFeatureNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaScoreFeatureNormalized");
}

id objc_msgSend_mediaSubtypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaSubtypes");
}

id objc_msgSend_mediaSumTimePlayed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaSumTimePlayed");
}

id objc_msgSend_mediaTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaTitle");
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaType");
}

id objc_msgSend_medianOf_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "medianOf:");
}

id objc_msgSend_megaSignalTypeUsed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "megaSignalTypeUsed");
}

id objc_msgSend_member_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "member:");
}

id objc_msgSend_members(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "members");
}

id objc_msgSend_merge(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "merge");
}

id objc_msgSend_mergeEventArraysFromDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeEventArraysFromDict:");
}

id objc_msgSend_mergeOutingBundlesWithInDayWithGroupedBundles_remainingSingletonBundles_parameters_isCoarseGranularity_timeZoneManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeOutingBundlesWithInDayWithGroupedBundles:remainingSingletonBundles:parameters:isCoarseGranularity:timeZoneManager:");
}

id objc_msgSend_metaData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metaData");
}

id objc_msgSend_metaDataForRank(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metaDataForRank");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadata");
}

id objc_msgSend_metadataForRank(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataForRank");
}

id objc_msgSend_metricForVisitsFromBundle_andNextBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricForVisitsFromBundle:andNextBundle:");
}

id objc_msgSend_metricName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricName");
}

id objc_msgSend_metricNameFromEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricNameFromEvent:");
}

id objc_msgSend_metrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metrics");
}

id objc_msgSend_min(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "min");
}

id objc_msgSend_minClusterSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minClusterSize");
}

id objc_msgSend_minPoints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minPoints");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minute");
}

id objc_msgSend_minutes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minutes");
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mode");
}

id objc_msgSend_momentPropertyOfAssets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "momentPropertyOfAssets");
}

id objc_msgSend_momentStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "momentStore");
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "month");
}

id objc_msgSend_monthDayFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monthDayFormatter");
}

id objc_msgSend_motionActivityEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "motionActivityEvent");
}

id objc_msgSend_motionActivityManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "motionActivityManager");
}

id objc_msgSend_motionActivityMixedRunningWalkingDistanceThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "motionActivityMixedRunningWalkingDistanceThreshold");
}

id objc_msgSend_motionActivityMixedRunningWalkingDurationThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "motionActivityMixedRunningWalkingDurationThreshold");
}

id objc_msgSend_motionActivityMixedRunningWalkingSpanThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "motionActivityMixedRunningWalkingSpanThreshold");
}

id objc_msgSend_motionActivityReferencePointRatio(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "motionActivityReferencePointRatio");
}

id objc_msgSend_motionActivityRunDistanceThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "motionActivityRunDistanceThreshold");
}

id objc_msgSend_motionActivityRunDurationThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "motionActivityRunDurationThreshold");
}

id objc_msgSend_motionActivityRunSpanThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "motionActivityRunSpanThreshold");
}

id objc_msgSend_motionActivityWalkBundlesMaximumDurationBetweenWalksAtSamePlace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "motionActivityWalkBundlesMaximumDurationBetweenWalksAtSamePlace");
}

id objc_msgSend_motionActivityWalkBundlesMinimumDurationForNoAssetsOrPlaceLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "motionActivityWalkBundlesMinimumDurationForNoAssetsOrPlaceLabel");
}

id objc_msgSend_motionActivityWalkBundlesMinimumRangeOfLocationForWalkAreaMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "motionActivityWalkBundlesMinimumRangeOfLocationForWalkAreaMap");
}

id objc_msgSend_motionActivityWalkCadenceThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "motionActivityWalkCadenceThreshold");
}

id objc_msgSend_motionActivityWalkDurationThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "motionActivityWalkDurationThreshold");
}

id objc_msgSend_motionActivityWalkMinimumLocationUncertainty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "motionActivityWalkMinimumLocationUncertainty");
}

id objc_msgSend_motionActivityWalkSpanThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "motionActivityWalkSpanThreshold");
}

id objc_msgSend_motionDistance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "motionDistance");
}

id objc_msgSend_motionManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "motionManager");
}

id objc_msgSend_motionStepCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "motionStepCount");
}

id objc_msgSend_motionType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "motionType");
}

id objc_msgSend_muid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "muid");
}

id objc_msgSend_multipleInteractionTypesFeature(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "multipleInteractionTypesFeature");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableBytes");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_needCapitalizationForKeyword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needCapitalizationForKeyword:");
}

id objc_msgSend_needExtensionForKeyword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needExtensionForKeyword:");
}

id objc_msgSend_newBackgroundContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newBackgroundContext");
}

id objc_msgSend_nextDateAfterDate_matchingComponents_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextDateAfterDate:matchingComponents:options:");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextObject");
}

id objc_msgSend_nextObjectPairWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextObjectPairWithHandler:");
}

id objc_msgSend_nextTriggerDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextTriggerDate");
}

id objc_msgSend_nodeRefForSceneClassId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nodeRefForSceneClassId:");
}

id objc_msgSend_notPredicateWithSubpredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notPredicateWithSubpredicate:");
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notification");
}

id objc_msgSend_notificationsManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationsManager");
}

id objc_msgSend_notifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifier");
}

id objc_msgSend_notify_withPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notify:withPayload:");
}

id objc_msgSend_notifyAndPersist_withPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyAndPersist:withPayload:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "now");
}

id objc_msgSend_nowPlayingMediaManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nowPlayingMediaManager");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "null");
}

id objc_msgSend_numAnomalyEventsNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numAnomalyEventsNormalized");
}

id objc_msgSend_numAppTypeResourcesNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numAppTypeResourcesNormalized");
}

id objc_msgSend_numCoworkersNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numCoworkersNormalized");
}

id objc_msgSend_numFamilyNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numFamilyNormalized");
}

id objc_msgSend_numFriendsNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numFriendsNormalized");
}

id objc_msgSend_numInterfaceTagTypeResourcesNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numInterfaceTagTypeResourcesNormalized");
}

id objc_msgSend_numKidsNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numKidsNormalized");
}

id objc_msgSend_numMapItemTypeResourcesNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numMapItemTypeResourcesNormalized");
}

id objc_msgSend_numMediaTypeResourcesNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numMediaTypeResourcesNormalized");
}

id objc_msgSend_numOtherPersonsNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numOtherPersonsNormalized");
}

id objc_msgSend_numPetsNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numPetsNormalized");
}

id objc_msgSend_numPhotoAssetsResourcesNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numPhotoAssetsResourcesNormalized");
}

id objc_msgSend_numRoutineEventsNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numRoutineEventsNormalized");
}

id objc_msgSend_numStateOfMindEventsNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numStateOfMindEventsNormalized");
}

id objc_msgSend_numTrendEventsNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numTrendEventsNormalized");
}

id objc_msgSend_numUniqueResourceTypesNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numUniqueResourceTypesNormalized");
}

id objc_msgSend_numValueTypeResourcesNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numValueTypeResourcesNormalized");
}

id objc_msgSend_numWebLinkTypeResourcesNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numWebLinkTypeResourcesNormalized");
}

id objc_msgSend_numWorkoutIconAssetsNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numWorkoutIconAssetsNormalized");
}

id objc_msgSend_numWorkoutRingAssetsNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numWorkoutRingAssetsNormalized");
}

id objc_msgSend_numWorkoutRouteMapAssetsNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numWorkoutRouteMapAssetsNormalized");
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberFromString:");
}

id objc_msgSend_numberOfRanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfRanges");
}

id objc_msgSend_numberOfSteps(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfSteps");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyWithoutLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyWithoutLog:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsAtIndexes:");
}

id objc_msgSend_onBatteryStatusChanged_andMessageType_andMessageArgument_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onBatteryStatusChanged:andMessageType:andMessageArgument:");
}

id objc_msgSend_onDisable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onDisable");
}

id objc_msgSend_onEnable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onEnable");
}

id objc_msgSend_onLockStateChangeNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onLockStateChangeNotification:");
}

id objc_msgSend_onMatchedBatteries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onMatchedBatteries:");
}

id objc_msgSend_onNotification_withPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onNotification:withPayload:");
}

id objc_msgSend_onObserverCountChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onObserverCountChange:");
}

id objc_msgSend_onboardingAndSettingsPersistence(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onboardingAndSettingsPersistence");
}

id objc_msgSend_onboardingDateFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onboardingDateFor:");
}

id objc_msgSend_onboardingDateForJournalingSuggestions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onboardingDateForJournalingSuggestions");
}

id objc_msgSend_onboardingDateKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onboardingDateKey:");
}

id objc_msgSend_onboardingDatesBySourceTypeWithStandardSuite_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onboardingDatesBySourceTypeWithStandardSuite:");
}

id objc_msgSend_onboardingFlowCompletionState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onboardingFlowCompletionState");
}

id objc_msgSend_openPhotoLibraryWithWellKnownIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openPhotoLibraryWithWellKnownIdentifier:error:");
}

id objc_msgSend_openURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:configuration:completionHandler:");
}

id objc_msgSend_operationQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationQueue");
}

id objc_msgSend_optInDNU(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optInDNU");
}

id objc_msgSend_optInIHA(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optInIHA");
}

id objc_msgSend_orPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orPredicateWithSubpredicates:");
}

id objc_msgSend_otherPlaces(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "otherPlaces");
}

id objc_msgSend_otherSubjectFromPhotoTraitsHistogram(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "otherSubjectFromPhotoTraitsHistogram");
}

id objc_msgSend_outingInterfaceTypeEngagementWeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outingInterfaceTypeEngagementWeight");
}

id objc_msgSend_outlier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outlier");
}

id objc_msgSend_outlierMetadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outlierMetadata");
}

id objc_msgSend_outlierScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outlierScore");
}

id objc_msgSend_outlierScoreThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outlierScoreThreshold");
}

id objc_msgSend_overallAestheticScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overallAestheticScore");
}

id objc_msgSend_overlappingTimeIntervalBetween_andOtherBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overlappingTimeIntervalBetween:andOtherBundle:");
}

id objc_msgSend_overlapsIndexOfBaseEvents_contextEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overlapsIndexOfBaseEvents:contextEvents:");
}

id objc_msgSend_overlapsScoreForStartDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overlapsScoreForStartDate:endDate:");
}

id objc_msgSend_pCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pCount");
}

id objc_msgSend_pairWiseWeights(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pairWiseWeights");
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parameters");
}

id objc_msgSend_parkingDisplayName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parkingDisplayName");
}

id objc_msgSend_participants(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "participants");
}

id objc_msgSend_partitionedEventBundles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "partitionedEventBundles:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "path");
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_patternDetectorName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "patternDetectorName");
}

id objc_msgSend_patterns(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "patterns");
}

id objc_msgSend_pcMetricID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pcMetricID");
}

id objc_msgSend_pedometer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pedometer");
}

id objc_msgSend_pendingState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingState");
}

id objc_msgSend_peopleCountMaxNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peopleCountMaxNormalized");
}

id objc_msgSend_peopleCountWeightedAverageNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peopleCountWeightedAverageNormalized");
}

id objc_msgSend_peopleCountWeightedSumNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peopleCountWeightedSumNormalized");
}

id objc_msgSend_peopleDensityMaxNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peopleDensityMaxNormalized");
}

id objc_msgSend_peopleDensityWeightedAverageNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peopleDensityWeightedAverageNormalized");
}

id objc_msgSend_peopleDiscoveryEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peopleDiscoveryEvent");
}

id objc_msgSend_peopleDiscoveryManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peopleDiscoveryManager");
}

id objc_msgSend_perform(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "perform");
}

id objc_msgSend_performAnnotationWithEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performAnnotationWithEvents:handler:");
}

id objc_msgSend_performAnnotationWithEvents_withPatternEvents_dateInterval_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performAnnotationWithEvents:withPatternEvents:dateInterval:handler:");
}

id objc_msgSend_performAnnotationWithEvents_withPatternEvents_eventBundles_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performAnnotationWithEvents:withPatternEvents:eventBundles:handler:");
}

id objc_msgSend_performAnnotationWithEvents_withPatternEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performAnnotationWithEvents:withPatternEvents:handler:");
}

id objc_msgSend_performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performAnnotationWithEvents:withPatternEvents:withBundleWindowStart:withBundleWindowEnd:handler:");
}

id objc_msgSend_performAnnotationWithSeed_startDate_endDate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performAnnotationWithSeed:startDate:endDate:handler:");
}

id objc_msgSend_performBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlock:");
}

id objc_msgSend_performBlockAndWait_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlockAndWait:");
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:");
}

id objc_msgSend_performers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performers");
}

id objc_msgSend_persistBuildVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistBuildVersion");
}

id objc_msgSend_persistBundlingDataWithoutRandomization(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistBundlingDataWithoutRandomization");
}

id objc_msgSend_persistCollectionDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistCollectionDate");
}

id objc_msgSend_persistDaemonMetrics_withData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistDaemonMetrics:withData:");
}

id objc_msgSend_persistEWAMetrics_withData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistEWAMetrics:withData:");
}

id objc_msgSend_persistLearnedFromTheAppStatusTable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistLearnedFromTheAppStatusTable:");
}

id objc_msgSend_persistMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistMetadata:");
}

id objc_msgSend_persistRankingModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistRankingModel:");
}

id objc_msgSend_persistenceManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistenceManager");
}

id objc_msgSend_persistentStoreCoordinator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentStoreCoordinator");
}

id objc_msgSend_personForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personForIdentifier:");
}

id objc_msgSend_personId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personId");
}

id objc_msgSend_personRelationshipHistogram(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personRelationshipHistogram");
}

id objc_msgSend_personRelationships(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personRelationships");
}

id objc_msgSend_personUri(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personUri");
}

id objc_msgSend_personalizedSensingFilter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personalizedSensingFilter");
}

id objc_msgSend_personalizedSensingVisitsAllowed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personalizedSensingVisitsAllowed");
}

id objc_msgSend_persons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persons");
}

id objc_msgSend_pet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pet");
}

id objc_msgSend_phenotype(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phenotype");
}

id objc_msgSend_photoAnalysisClient(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoAnalysisClient");
}

id objc_msgSend_photoAsset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoAsset");
}

id objc_msgSend_photoAssetMediaType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoAssetMediaType");
}

id objc_msgSend_photoCreationDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoCreationDate");
}

id objc_msgSend_photoCurationScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoCurationScore");
}

id objc_msgSend_photoEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoEvent");
}

id objc_msgSend_photoFaceCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoFaceCount");
}

id objc_msgSend_photoLibrary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoLibrary");
}

id objc_msgSend_photoLocalDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoLocalDate");
}

id objc_msgSend_photoManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoManager");
}

id objc_msgSend_photoMemoryAssets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoMemoryAssets");
}

id objc_msgSend_photoMemoryCategory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoMemoryCategory");
}

id objc_msgSend_photoMemoryInterfaceTypeEngagementWeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoMemoryInterfaceTypeEngagementWeight");
}

id objc_msgSend_photoMemoryIsFavorite(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoMemoryIsFavorite");
}

id objc_msgSend_photoMemoryRelevanceScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoMemoryRelevanceScore");
}

id objc_msgSend_photoMemorySubCategory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoMemorySubCategory");
}

id objc_msgSend_photoMemoryTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoMemoryTitle");
}

id objc_msgSend_photoMomentHolidays(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoMomentHolidays");
}

id objc_msgSend_photoMomentInferences(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoMomentInferences");
}

id objc_msgSend_photoMomentInterfaceTypeEngagementWeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoMomentInterfaceTypeEngagementWeight");
}

id objc_msgSend_photoMomentLocalIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoMomentLocalIdentifier");
}

id objc_msgSend_photoMomentPersons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoMomentPersons");
}

id objc_msgSend_photoMomentPublicEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoMomentPublicEvents");
}

id objc_msgSend_photoMomentSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoMomentSource");
}

id objc_msgSend_photoOverallAestheticScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoOverallAestheticScore");
}

id objc_msgSend_photoSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoSource");
}

id objc_msgSend_photoSourceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoSourceType");
}

id objc_msgSend_photoTraits(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoTraits");
}

id objc_msgSend_place(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "place");
}

id objc_msgSend_placeDiscovery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeDiscovery");
}

id objc_msgSend_placeFromBaseEvents_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeFromBaseEvents:action:");
}

id objc_msgSend_placeFromRoutes_referencePointRatio_minimumRangeOfLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeFromRoutes:referencePointRatio:minimumRangeOfLocation:");
}

id objc_msgSend_placeFromVisitEvent_preferredCategories_poiCategoryBlocklist_mediumConfidenceThreshold_highConfidenceThreshold_aoiConfidenceThreshold_universe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeFromVisitEvent:preferredCategories:poiCategoryBlocklist:mediumConfidenceThreshold:highConfidenceThreshold:aoiConfidenceThreshold:universe:");
}

id objc_msgSend_placeFromVisitEvents_preferredCategories_poiCategoryBlocklist_mediumConfidenceThreshold_highConfidenceThreshold_aoiConfidenceThreshold_universe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeFromVisitEvents:preferredCategories:poiCategoryBlocklist:mediumConfidenceThreshold:highConfidenceThreshold:aoiConfidenceThreshold:universe:");
}

id objc_msgSend_placeFromVisitEvents_usedEvents_preferredCategories_poiCategoryBlocklist_mediumConfidenceThreshold_highConfidenceThreshold_aoiConfidenceThreshold_universe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeFromVisitEvents:usedEvents:preferredCategories:poiCategoryBlocklist:mediumConfidenceThreshold:highConfidenceThreshold:aoiConfidenceThreshold:universe:");
}

id objc_msgSend_placeInference(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeInference");
}

id objc_msgSend_placeMapItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeMapItem");
}

id objc_msgSend_placeName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeName");
}

id objc_msgSend_placeNameConfidence(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeNameConfidence");
}

id objc_msgSend_placeNameHistogram(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeNameHistogram");
}

id objc_msgSend_placeNameOfEvent_addressFormatOption_countryMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeNameOfEvent:addressFormatOption:countryMode:");
}

id objc_msgSend_placeSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeSource");
}

id objc_msgSend_placeType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeType");
}

id objc_msgSend_placeTypeFromPhotoTraitsHistogram(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeTypeFromPhotoTraitsHistogram");
}

id objc_msgSend_placeUserType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeUserType");
}

id objc_msgSend_places(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "places");
}

id objc_msgSend_platform(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "platform");
}

id objc_msgSend_playbackState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackState");
}

id objc_msgSend_plistAppInfoFileURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "plistAppInfoFileURL");
}

id objc_msgSend_poiCategory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "poiCategory");
}

id objc_msgSend_postRefreshTriggerAfterOnboarding(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postRefreshTriggerAfterOnboarding");
}

id objc_msgSend_postRefreshTriggerAfterSettingChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postRefreshTriggerAfterSettingChange");
}

id objc_msgSend_postprocessGroupedEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postprocessGroupedEvents:");
}

id objc_msgSend_predicateForBasicFilteringOfEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForBasicFilteringOfEvents");
}

id objc_msgSend_predicateForObjectsFromWorkout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForObjectsFromWorkout:");
}

id objc_msgSend_predicateForObjectsWithUUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForObjectsWithUUIDs:");
}

id objc_msgSend_predicateForSamplesWithStartDate_endDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForSamplesWithStartDate:endDate:options:");
}

id objc_msgSend_predicateOfEmotionLogsWithStartDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateOfEmotionLogsWithStartDate:endDate:");
}

id objc_msgSend_predicateOfEventsWithPlaySessions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateOfEventsWithPlaySessions");
}

id objc_msgSend_predicateOfEventsWithPlaySessionsWithStartDate_endData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateOfEventsWithPlaySessionsWithStartDate:endData:");
}

id objc_msgSend_predicateOfEventsWithPlaySessionsWithStartDate_endData_distanceThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateOfEventsWithPlaySessionsWithStartDate:endData:distanceThreshold:");
}

id objc_msgSend_predicateOfMediaPlaySessionsWithStartDate_endDate_distanceThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateOfMediaPlaySessionsWithStartDate:endDate:distanceThreshold:");
}

id objc_msgSend_predicateOfSocialContextEventWithStartDate_endData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateOfSocialContextEventWithStartDate:endData:");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_predicateWithStartDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithStartDate:endDate:");
}

id objc_msgSend_predicateWithStartDate_endDate_distanceThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithStartDate:endDate:distanceThreshold:");
}

id objc_msgSend_predicatesOfDesiredExperiences(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicatesOfDesiredExperiences");
}

id objc_msgSend_predominantWeather(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predominantWeather");
}

id objc_msgSend_predominantWeatherFromBaseEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predominantWeatherFromBaseEvents:");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredLanguages");
}

id objc_msgSend_preferredLocalization(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredLocalization");
}

id objc_msgSend_preferredLocalizations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredLocalizations");
}

id objc_msgSend_preferredName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredName");
}

id objc_msgSend_prepareData_aggregationDuration_aggregationMethod_valueFunction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareData:aggregationDuration:aggregationMethod:valueFunction:");
}

id objc_msgSend_prepositionWithPlaceType_userPlaceType_mapItemPlaceType_distanceFromVisitToPlace_snappingThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepositionWithPlaceType:userPlaceType:mapItemPlaceType:distanceFromVisitToPlace:snappingThreshold:");
}

id objc_msgSend_preprocessEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preprocessEvents:");
}

id objc_msgSend_primarySourceTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "primarySourceTypes");
}

id objc_msgSend_printGroupedEvents_tag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "printGroupedEvents:tag:");
}

id objc_msgSend_priorityScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "priorityScore");
}

id objc_msgSend_proactiveTravelManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proactiveTravelManager");
}

id objc_msgSend_processBundlesForCreatingDominantBundles_withParameters_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processBundlesForCreatingDominantBundles:withParameters:handler:");
}

id objc_msgSend_processEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processEvents:");
}

id objc_msgSend_processEvents_withRefreshVariant_forDateInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processEvents:withRefreshVariant:forDateInterval:");
}

id objc_msgSend_processHindsightVisitsWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processHindsightVisitsWithHandler:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processInfo");
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processName");
}

id objc_msgSend_processPatternEvents_withEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processPatternEvents:withEvents:");
}

id objc_msgSend_processTimeZoneEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processTimeZoneEvents:");
}

id objc_msgSend_processVisitEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processVisitEvent:");
}

id objc_msgSend_productId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "productId");
}

id objc_msgSend_promotionScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promotionScore");
}

id objc_msgSend_promptCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promptCount");
}

id objc_msgSend_promptDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promptDescription");
}

id objc_msgSend_promptIndexes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promptIndexes");
}

id objc_msgSend_promptLanguage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promptLanguage");
}

id objc_msgSend_promptLanguages(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promptLanguages");
}

id objc_msgSend_propertyNameDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyNameDictionary");
}

id objc_msgSend_proposition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proposition");
}

id objc_msgSend_protectedStoreFilesExtensions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "protectedStoreFilesExtensions");
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider");
}

id objc_msgSend_providerId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerId");
}

id objc_msgSend_providerIdFromConcatenatedIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerIdFromConcatenatedIdentifiers:");
}

id objc_msgSend_pruneEventBundles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pruneEventBundles:");
}

id objc_msgSend_pruner(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pruner");
}

id objc_msgSend_publishOnboardingStatusAnalytics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publishOnboardingStatusAnalytics");
}

id objc_msgSend_publisher(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publisher");
}

id objc_msgSend_publishersForDevices_withUseCase_startTime_endTime_maxEvents_lastN_reversed_includeLocal_pipeline_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publishersForDevices:withUseCase:startTime:endTime:maxEvents:lastN:reversed:includeLocal:pipeline:");
}

id objc_msgSend_purgeDanglingEventBundlesWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeDanglingEventBundlesWithHandler:");
}

id objc_msgSend_purgeDeletedEventBundlesWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeDeletedEventBundlesWithCompletionHandler:");
}

id objc_msgSend_purgeEventBundlesWithNoEventsAssociatedWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeEventBundlesWithNoEventsAssociatedWithCompletionHandler:");
}

id objc_msgSend_purgeEventBundlesWithRehydrationFailureCount_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeEventBundlesWithRehydrationFailureCount:andHandler:");
}

id objc_msgSend_purgeExpiredEventBundlesWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeExpiredEventBundlesWithCompletionHandler:");
}

id objc_msgSend_purgeExpiredEventsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeExpiredEventsWithCompletionHandler:");
}

id objc_msgSend_purgeInvalidEvergreenBundlesWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeInvalidEvergreenBundlesWithCompletionHandler:");
}

id objc_msgSend_purgeRehydrationFailedEventsForType_rehydrationFailCount_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeRehydrationFailedEventsForType:rehydrationFailCount:CompletionHandler:");
}

id objc_msgSend_purgeUnknownEventsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeUnknownEventsWithCompletionHandler:");
}

id objc_msgSend_purgeVisitEventsBeforeDate_WithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeVisitEventsBeforeDate:WithCompletionHandler:");
}

id objc_msgSend_purposeEvergreenTypeEngagementWeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purposeEvergreenTypeEngagementWeight");
}

id objc_msgSend_queryActivityWithAttribute_fromDate_toDate_toQueue_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryActivityWithAttribute:fromDate:toDate:toQueue:withHandler:");
}

id objc_msgSend_queryInteractionsUsingPredicate_sortDescriptors_limit_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:");
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryItems");
}

id objc_msgSend_queryPedometerDataFromDate_toDate_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryPedometerDataFromDate:toDate:withHandler:");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queue");
}

id objc_msgSend_quickClassificationFaceAdjustmentVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "quickClassificationFaceAdjustmentVersion");
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "range");
}

id objc_msgSend_rangeAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeAtIndex:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rangeOfUnit_startDate_interval_forDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfUnit:startDate:interval:forDate:");
}

id objc_msgSend_rangeOfWeekendStartDate_interval_containingDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfWeekendStartDate:interval:containingDate:");
}

id objc_msgSend_rankingAlgorithmVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rankingAlgorithmVersion");
}

id objc_msgSend_rankingDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rankingDictionary");
}

id objc_msgSend_rankingParams(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rankingParams");
}

id objc_msgSend_rankingScoreThresholdDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rankingScoreThresholdDict");
}

id objc_msgSend_readEWAPlistFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readEWAPlistFile:");
}

id objc_msgSend_readLearnedFromTheAppStatusTable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readLearnedFromTheAppStatusTable");
}

id objc_msgSend_readParametersWithConfigurationManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readParametersWithConfigurationManager:");
}

id objc_msgSend_readPersistenceTable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readPersistenceTable:");
}

id objc_msgSend_recipients(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recipients");
}

id objc_msgSend_recommendedTabVisitFIThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recommendedTabVisitFIThreshold");
}

id objc_msgSend_redactString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "redactString:");
}

id objc_msgSend_redactURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "redactURL:");
}

id objc_msgSend_redactedAlbum(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "redactedAlbum");
}

id objc_msgSend_redactedTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "redactedTitle");
}

id objc_msgSend_reduceWithInitial_nextPartialResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reduceWithInitial:nextPartialResult:");
}

id objc_msgSend_referenceCountry(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "referenceCountry");
}

id objc_msgSend_referenceCountryCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "referenceCountryCode");
}

id objc_msgSend_referenceDateFromStartDate_endDate_index_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "referenceDateFromStartDate:endDate:index:");
}

id objc_msgSend_referenceState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "referenceState");
}

id objc_msgSend_referenceStateCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "referenceStateCode");
}

id objc_msgSend_reflectiveInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reflectiveInterval");
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refresh");
}

id objc_msgSend_refreshWithRefreshVariant_andCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshWithRefreshVariant:andCompletion:");
}

id objc_msgSend_registerApplicationsForDataAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerApplicationsForDataAccess:");
}

id objc_msgSend_registerClientsForDataAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClientsForDataAccess:");
}

id objc_msgSend_registerDefaultRefreshActivity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDefaultRefreshActivity");
}

id objc_msgSend_registerDispatcher_forNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDispatcher:forNotification:");
}

id objc_msgSend_registerFirstRefreshActivity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerFirstRefreshActivity");
}

id objc_msgSend_registerFirstRefreshActivityWithPreRegisteredTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerFirstRefreshActivityWithPreRegisteredTask:");
}

id objc_msgSend_registerForNotification_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForNotification:withHandler:");
}

id objc_msgSend_registerForNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForNotifications");
}

id objc_msgSend_registerForTaskWithIdentifier_usingQueue_launchHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForTaskWithIdentifier:usingQueue:launchHandler:");
}

id objc_msgSend_registerLightRefreshActivity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerLightRefreshActivity");
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "regularExpressionWithPattern:options:error:");
}

id objc_msgSend_rehydrateConversations_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rehydrateConversations:handler:");
}

id objc_msgSend_rehydrateEvents_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rehydrateEvents:withHandler:");
}

id objc_msgSend_rehydrateLifeEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rehydrateLifeEvents:handler:");
}

id objc_msgSend_rehydrateMotionActivity_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rehydrateMotionActivity:handler:");
}

id objc_msgSend_rehydratePeopleDensityEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rehydratePeopleDensityEvents:handler:");
}

id objc_msgSend_rehydratePhotoMemories_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rehydratePhotoMemories:handler:");
}

id objc_msgSend_rehydrateProx_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rehydrateProx:handler:");
}

id objc_msgSend_rehydrateSharedPhotos_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rehydrateSharedPhotos:handler:");
}

id objc_msgSend_rehydrateStateOfMind_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rehydrateStateOfMind:handler:");
}

id objc_msgSend_rehydrateVisits_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rehydrateVisits:handler:");
}

id objc_msgSend_rehydrateWeather_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rehydrateWeather:handler:");
}

id objc_msgSend_rehydrateWorkouts_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rehydrateWorkouts:handler:");
}

id objc_msgSend_rehydratedMediaPlayEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rehydratedMediaPlayEvents:handler:");
}

id objc_msgSend_rehydratedScoredTopicsEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rehydratedScoredTopicsEvent:");
}

id objc_msgSend_rehydratedSharedContentEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rehydratedSharedContentEvents:");
}

id objc_msgSend_rehydratedSuggestedEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rehydratedSuggestedEvents:");
}

id objc_msgSend_rehydratedTripEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rehydratedTripEvents:");
}

id objc_msgSend_rehydrationFailCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rehydrationFailCount");
}

id objc_msgSend_relatedPersons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relatedPersons");
}

id objc_msgSend_relationship(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relationship");
}

id objc_msgSend_releaseRefreshLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseRefreshLock");
}

id objc_msgSend_relevantAssetUUIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relevantAssetUUIDs");
}

id objc_msgSend_remoteDevicesWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteDevicesWithError:");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxy");
}

id objc_msgSend_removeAllBundlesWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllBundlesWithCompletionHandler:");
}

id objc_msgSend_removeAllEventsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllEventsWithCompletionHandler:");
}

id objc_msgSend_removeAllFSMsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllFSMsWithCompletionHandler:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeAllPendingNotificationRequests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllPendingNotificationRequests");
}

id objc_msgSend_removeDuplicateAssetsAccrossMultipleBundleTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDuplicateAssetsAccrossMultipleBundleTypes:");
}

id objc_msgSend_removeDuplicateAssetsFromMediaBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDuplicateAssetsFromMediaBundle:");
}

id objc_msgSend_removeDuplicateAssetsPerBundleTypeForThirdParty_bundleSuperType_titleSet_isRecommendTab_isMediaOnRepeat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDuplicateAssetsPerBundleTypeForThirdParty:bundleSuperType:titleSet:isRecommendTab:isMediaOnRepeat:");
}

id objc_msgSend_removeDuplicatePhotoResourceFromBundle_comparedWithPrimaryBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDuplicatePhotoResourceFromBundle:comparedWithPrimaryBundle:");
}

id objc_msgSend_removeDuplicateWorkouts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDuplicateWorkouts:");
}

id objc_msgSend_removeEventBundles_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEventBundles:CompletionHandler:");
}

id objc_msgSend_removeEventBundlesStartedWithinInterval_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEventBundlesStartedWithinInterval:CompletionHandler:");
}

id objc_msgSend_removeEvents_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEvents:CompletionHandler:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsAtIndexes:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removePhoneActivitiesOverlappingWorkouts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePhoneActivitiesOverlappingWorkouts:");
}

id objc_msgSend_renderTypeFrom_isFirstPartyApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderTypeFrom:isFirstPartyApp:");
}

id objc_msgSend_repetitions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "repetitions");
}

id objc_msgSend_replaceCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceCharactersInRange:withString:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_replacePromptIndicesOfEvergreen_isTah_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replacePromptIndicesOfEvergreen:isTah:");
}

id objc_msgSend_reportIncident_subtype_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportIncident:subtype:context:");
}

id objc_msgSend_reportIncidentAfterUserConsent_subtype_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportIncidentAfterUserConsent:subtype:context:");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "request");
}

id objc_msgSend_requestCurationScoreByAssetUUIDForAssetUUIDs_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestCurationScoreByAssetUUIDForAssetUUIDs:error:");
}

id objc_msgSend_requestDeferredProcessingTypes_assets_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestDeferredProcessingTypes:assets:error:");
}

id objc_msgSend_requestPersonalTraitsForAssetsWithUUIDs_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestPersonalTraitsForAssetsWithUUIDs:error:");
}

id objc_msgSend_requestWithIdentifier_content_trigger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithIdentifier:content:trigger:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reset");
}

id objc_msgSend_resilienceEvergreenTypeEngagementWeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resilienceEvergreenTypeEngagementWeight");
}

id objc_msgSend_resolveMapItemFromHandle_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolveMapItemFromHandle:completionHandler:");
}

id objc_msgSend_resourceFromWorkoutEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourceFromWorkoutEvent:");
}

id objc_msgSend_resourceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourceType");
}

id objc_msgSend_resourceURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourceURL");
}

id objc_msgSend_resources(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resources");
}

id objc_msgSend_resourcesFromBaseEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourcesFromBaseEvents:");
}

id objc_msgSend_resourcesFromEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourcesFromEvents:handler:");
}

id objc_msgSend_responseDataItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseDataItems");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "result");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resume");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reverseObjectEnumerator");
}

id objc_msgSend_richnessScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "richnessScore");
}

id objc_msgSend_richnessWeightsDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "richnessWeightsDict");
}

id objc_msgSend_routineEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "routineEvent");
}

id objc_msgSend_routineManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "routineManager");
}

id objc_msgSend_routineServiceManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "routineServiceManager");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "run");
}

id objc_msgSend_runAnalyticsWithRefreshVariant_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runAnalyticsWithRefreshVariant:andHandler:");
}

id objc_msgSend_runHDBSCANClusteringOn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runHDBSCANClusteringOn:");
}

id objc_msgSend_running(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "running");
}

id objc_msgSend_safeSavePropertyToDictionary_withKey_andValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "safeSavePropertyToDictionary:withKey:andValue:");
}

id objc_msgSend_samePlaceCheckForEvent_otherEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "samePlaceCheckForEvent:otherEvent:");
}

id objc_msgSend_save_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "save:");
}

id objc_msgSend_saveEventBundles_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveEventBundles:handler:");
}

id objc_msgSend_saveHighlights_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveHighlights:handler:");
}

id objc_msgSend_saveSuggestedEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveSuggestedEvents:handler:");
}

id objc_msgSend_saveTrips_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveTrips:handler:");
}

id objc_msgSend_scanDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanDuration");
}

id objc_msgSend_sceneAnalysisProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sceneAnalysisProperties");
}

id objc_msgSend_sceneAnalysisTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sceneAnalysisTimestamp");
}

id objc_msgSend_sceneAnalysisVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sceneAnalysisVersion");
}

id objc_msgSend_sceneClassifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sceneClassifications");
}

id objc_msgSend_sceneIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sceneIdentifier");
}

id objc_msgSend_scheduleClientTask_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleClientTask:withName:");
}

id objc_msgSend_scheduleInternalClientTask_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleInternalClientTask:withName:");
}

id objc_msgSend_scheduleInternalClientTask_withName_andAllowHandoffReplayQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleInternalClientTask:withName:andAllowHandoffReplayQueue:");
}

id objc_msgSend_scheduleSendBarrierBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleSendBarrierBlock:");
}

id objc_msgSend_scheduleWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleWithBlock:");
}

id objc_msgSend_scheduledDeliverySetting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledDeliverySetting");
}

id objc_msgSend_score(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "score");
}

id objc_msgSend_scoreVisitBundleAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scoreVisitBundleAssets:");
}

id objc_msgSend_scoredContact(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scoredContact");
}

id objc_msgSend_scoredPersonEntityTags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scoredPersonEntityTags");
}

id objc_msgSend_scoredTopics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scoredTopics");
}

id objc_msgSend_scoresForTopicMapping_query_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scoresForTopicMapping:query:error:");
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "second");
}

id objc_msgSend_secondLevelActivityHistogram(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondLevelActivityHistogram");
}

id objc_msgSend_secondObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondObject");
}

id objc_msgSend_secondsFromGMT(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondsFromGMT");
}

id objc_msgSend_secondsFromGMTForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondsFromGMTForDate:");
}

id objc_msgSend_sendDataToCoreAnalytics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDataToCoreAnalytics:");
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:");
}

id objc_msgSend_sendNotification_withPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendNotification:withPayload:");
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sender");
}

id objc_msgSend_serializeEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serializeEvent:");
}

id objc_msgSend_serializeEventBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serializeEventBundle:");
}

id objc_msgSend_serviceDictLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceDictLock");
}

id objc_msgSend_serviceSuggestionsNotificationsWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceSuggestionsNotificationsWithHandler:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set");
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAction:");
}

id objc_msgSend_setActionForActivityBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionForActivityBundle:");
}

id objc_msgSend_setActionMetaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionMetaData:");
}

id objc_msgSend_setActionNameConfidence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionNameConfidence:");
}

id objc_msgSend_setActionSubType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionSubType:");
}

id objc_msgSend_setActionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionType:");
}

id objc_msgSend_setActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActions:");
}

id objc_msgSend_setActionsAndPlacesFromBundles_forDominantBundle_withParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionsAndPlacesFromBundles:forDominantBundle:withParameters:");
}

id objc_msgSend_setActionsAndPlacesFromBundles_forSummaryBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionsAndPlacesFromBundles:forSummaryBundle:");
}

id objc_msgSend_setActivityContextEmbedding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityContextEmbedding:");
}

id objc_msgSend_setActivityInterfaceTypeEngagementWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityInterfaceTypeEngagementWeight:");
}

id objc_msgSend_setActivityNameFromActionName_metaData_keyword_keywordType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityNameFromActionName:metaData:keyword:keywordType:");
}

id objc_msgSend_setActivityTypeFromPhotoTraitsHistogram_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityTypeFromPhotoTraitsHistogram:");
}

id objc_msgSend_setActual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActual:");
}

id objc_msgSend_setAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAddress:");
}

id objc_msgSend_setAge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAge:");
}

id objc_msgSend_setAgeBucketed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAgeBucketed:");
}

id objc_msgSend_setAggregationDateInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAggregationDateInterval:");
}

id objc_msgSend_setAllContactIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllContactIdentifiers:");
}

id objc_msgSend_setAllPlaceNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllPlaceNames:");
}

id objc_msgSend_setAllStateOfMindIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllStateOfMindIdentifiers:");
}

id objc_msgSend_setAnnotator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnnotator:");
}

id objc_msgSend_setAnomalyDetector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnomalyDetector:");
}

id objc_msgSend_setAppBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppBundle:");
}

id objc_msgSend_setAppEntryEngagementEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppEntryEngagementEvent:");
}

id objc_msgSend_setAppEntryEngagementEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppEntryEngagementEvents:");
}

id objc_msgSend_setAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssets:");
}

id objc_msgSend_setAvgSubBundleGoodnessScores_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvgSubBundleGoodnessScores:");
}

id objc_msgSend_setBackgroundActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundActions:");
}

id objc_msgSend_setBiologicalSex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBiologicalSex:");
}

id objc_msgSend_setBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBody:");
}

id objc_msgSend_setBprRegularizationFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBprRegularizationFactor:");
}

id objc_msgSend_setBundleEndDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleEndDate:");
}

id objc_msgSend_setBundleGoodnessScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleGoodnessScore:");
}

id objc_msgSend_setBundleGoodnessScoreThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleGoodnessScoreThreshold:");
}

id objc_msgSend_setBundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleId:");
}

id objc_msgSend_setBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleIdentifier:");
}

id objc_msgSend_setBundleIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleIdentifiers:");
}

id objc_msgSend_setBundleInterfaceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleInterfaceType:");
}

id objc_msgSend_setBundleRecencyDaysElapsed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleRecencyDaysElapsed:");
}

id objc_msgSend_setBundleRichnessDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleRichnessDict:");
}

id objc_msgSend_setBundleStartDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleStartDate:");
}

id objc_msgSend_setBundleSubType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleSubType:");
}

id objc_msgSend_setBundleSuperType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleSuperType:");
}

id objc_msgSend_setBundleType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleType:");
}

id objc_msgSend_setBurstyInteractionCountFeatureNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBurstyInteractionCountFeatureNormalized:");
}

id objc_msgSend_setByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingObject:");
}

id objc_msgSend_setByAddingObjectsFromSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingObjectsFromSet:");
}

id objc_msgSend_setCacheEndDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCacheEndDate:");
}

id objc_msgSend_setCacheStartDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCacheStartDate:");
}

id objc_msgSend_setCachedEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedEvents:");
}

id objc_msgSend_setCadenceSeconds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCadenceSeconds:");
}

id objc_msgSend_setCalendar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCalendar:");
}

id objc_msgSend_setCallDurationFeatureNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallDurationFeatureNormalized:");
}

id objc_msgSend_setCapitalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCapitalized:");
}

id objc_msgSend_setCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCategory:");
}

id objc_msgSend_setCategoryIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCategoryIdentifier:");
}

id objc_msgSend_setCityName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCityName:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setClusterMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClusterMetadata:");
}

id objc_msgSend_setClusteringInterfaceTypeEngagementWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClusteringInterfaceTypeEngagementWeight:");
}

id objc_msgSend_setCombinedPlaceTypeHistogram_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCombinedPlaceTypeHistogram:");
}

id objc_msgSend_setCommonFields_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCommonFields:");
}

id objc_msgSend_setConcurrentMediaAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConcurrentMediaAction:");
}

id objc_msgSend_setCondensedRecords_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCondensedRecords:");
}

id objc_msgSend_setConfidenceScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfidenceScore:");
}

id objc_msgSend_setContactClassificationMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactClassificationMap:");
}

id objc_msgSend_setContactIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactIdentifier:");
}

id objc_msgSend_setContactLocationWorkFeature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactLocationWorkFeature:");
}

id objc_msgSend_setContactNamesHistogram_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactNamesHistogram:");
}

id objc_msgSend_setCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCount:");
}

id objc_msgSend_setCreationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCreationDate:");
}

id objc_msgSend_setCreativityEvergreenTypeEngagementWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCreativityEvergreenTypeEngagementWeight:");
}

id objc_msgSend_setCurationParameterDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurationParameterDict:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDate:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDateReferenceTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateReferenceTag:");
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setDay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDay:");
}

id objc_msgSend_setDayOfWeekHistogram_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDayOfWeekHistogram:");
}

id objc_msgSend_setDecayRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDecayRate:");
}

id objc_msgSend_setDecimatedValue_forKey_dictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDecimatedValue:forKey:dictionary:");
}

id objc_msgSend_setDefaultActionURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultActionURL:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDensityScanDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDensityScanDuration:");
}

id objc_msgSend_setDensityScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDensityScore:");
}

id objc_msgSend_setDerivedMetrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDerivedMetrics");
}

id objc_msgSend_setDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDestination:");
}

id objc_msgSend_setDistanceFromVisitToPlace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDistanceFromVisitToPlace:");
}

id objc_msgSend_setDistanceToHomeFeatureNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDistanceToHomeFeatureNormalized:");
}

id objc_msgSend_setDistanceToHomeInMiles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDistanceToHomeInMiles:");
}

id objc_msgSend_setDoesRelativeDateFormatting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDoesRelativeDateFormatting:");
}

id objc_msgSend_setDomains_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDomains:");
}

id objc_msgSend_setDynamicModelParameterDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDynamicModelParameterDict:");
}

id objc_msgSend_setEWADict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEWADict:");
}

id objc_msgSend_setEnclosingArea_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnclosingArea:");
}

id objc_msgSend_setEnclosingPlaceNameHistogram_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnclosingPlaceNameHistogram:");
}

id objc_msgSend_setEndDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndDate:");
}

id objc_msgSend_setEngagementDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEngagementDelegate:");
}

id objc_msgSend_setEngagementScoreParameterDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEngagementScoreParameterDict:");
}

id objc_msgSend_setEngagementScoreParamsUpdateDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEngagementScoreParamsUpdateDate:");
}

id objc_msgSend_setEntitlementDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEntitlementDelegate:");
}

id objc_msgSend_setEventCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventCount:");
}

id objc_msgSend_setEventIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventIdentifier:");
}

id objc_msgSend_setEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEvents:");
}

id objc_msgSend_setEvergreenEngagementScoreParameterDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEvergreenEngagementScoreParameterDict:");
}

id objc_msgSend_setEvergreenEngagementScoreParamsUpdateDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEvergreenEngagementScoreParamsUpdateDate:");
}

id objc_msgSend_setEvergreenInterfaceTypeEngagementWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEvergreenInterfaceTypeEngagementWeight:");
}

id objc_msgSend_setEvergreenPromptExists_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEvergreenPromptExists:");
}

id objc_msgSend_setEvergreenType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEvergreenType:");
}

id objc_msgSend_setExpirationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpirationDate:");
}

id objc_msgSend_setExportManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportManager:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setExtendedAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExtendedAttributes:");
}

id objc_msgSend_setExtraContextEmbedding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExtraContextEmbedding:");
}

id objc_msgSend_setFDefaultsManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFDefaultsManager:");
}

id objc_msgSend_setFamiliarityIndexFeature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFamiliarityIndexFeature:");
}

id objc_msgSend_setFamiliarityIndexLOI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFamiliarityIndexLOI:");
}

id objc_msgSend_setFeatureExtractor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeatureExtractor:");
}

id objc_msgSend_setFeatureTransformer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeatureTransformer:");
}

id objc_msgSend_setFetchBatchSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchBatchSize:");
}

id objc_msgSend_setFetchLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchLimit:");
}

id objc_msgSend_setFetchPropertySets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchPropertySets:");
}

id objc_msgSend_setFiltered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFiltered:");
}

id objc_msgSend_setFirstCreationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstCreationDate:");
}

id objc_msgSend_setFirstObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstObject:");
}

id objc_msgSend_setFirstWeekday_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstWeekday:");
}

id objc_msgSend_setFormattingContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFormattingContext:");
}

id objc_msgSend_setFrequencyPenalty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrequencyPenalty:");
}

id objc_msgSend_setFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFromDate:");
}

id objc_msgSend_setFromFirstParty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFromFirstParty:");
}

id objc_msgSend_setGaPR_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGaPR:");
}

id objc_msgSend_setGender_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGender:");
}

id objc_msgSend_setGeoAddressObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGeoAddressObject:");
}

id objc_msgSend_setGratitudeEvergreenTypeEngagementWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGratitudeEvergreenTypeEngagementWeight:");
}

id objc_msgSend_setGroupConversationFeature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupConversationFeature:");
}

id objc_msgSend_setHeuristicsParameterDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeuristicsParameterDict:");
}

id objc_msgSend_setHighlightCurationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighlightCurationType:");
}

id objc_msgSend_setHour_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHour:");
}

id objc_msgSend_setIHAState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIHAState:");
}

id objc_msgSend_setIcon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIcon:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIdentifierFromProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifierFromProvider:");
}

id objc_msgSend_setIncludeGuestAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludeGuestAssets:");
}

id objc_msgSend_setIncludePendingMemories_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludePendingMemories:");
}

id objc_msgSend_setIncludedDetectionTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludedDetectionTypes:");
}

id objc_msgSend_setIncludedInSummaryBundleOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludedInSummaryBundleOnly:");
}

id objc_msgSend_setInteractionContactScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteractionContactScore:");
}

id objc_msgSend_setInteractionContacts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteractionContacts:");
}

id objc_msgSend_setInteractionGroupName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteractionGroupName:");
}

id objc_msgSend_setInteractionKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteractionKey:");
}

id objc_msgSend_setInteractionMechanisms_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteractionMechanisms:");
}

id objc_msgSend_setInteractionScoredContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteractionScoredContact:");
}

id objc_msgSend_setInteractions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteractions:");
}

id objc_msgSend_setInterestingPOIFeature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterestingPOIFeature:");
}

id objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterface:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setInterfaceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterfaceType:");
}

id objc_msgSend_setInterfaceTypeCountFromSuggestionEngagementDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterfaceTypeCountFromSuggestionEngagementDict:");
}

id objc_msgSend_setInternalPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInternalPredicate:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsAggregatedAndSuppressed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsAggregatedAndSuppressed:");
}

id objc_msgSend_setIsBundleActionSpecific_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsBundleActionSpecific:");
}

id objc_msgSend_setIsBundleAggregated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsBundleAggregated:");
}

id objc_msgSend_setIsBundlePlaceTypeSpecific_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsBundlePlaceTypeSpecific:");
}

id objc_msgSend_setIsBundleTimeTagSpecific_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsBundleTimeTagSpecific:");
}

id objc_msgSend_setIsCoworkerContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsCoworkerContact:");
}

id objc_msgSend_setIsEvergreenEngagementScoreParamsUpdateOnHold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsEvergreenEngagementScoreParamsUpdateOnHold:");
}

id objc_msgSend_setIsFamilyContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsFamilyContact:");
}

id objc_msgSend_setIsFiltered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsFiltered:");
}

id objc_msgSend_setIsFitnessPlusSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsFitnessPlusSession:");
}

id objc_msgSend_setIsGComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsGComplete:");
}

id objc_msgSend_setIsGatheringComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsGatheringComplete:");
}

id objc_msgSend_setIsHighConfidence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsHighConfidence:");
}

id objc_msgSend_setIsIndoors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsIndoors:");
}

id objc_msgSend_setIsInvalid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsInvalid:");
}

id objc_msgSend_setIsMePerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsMePerson:");
}

id objc_msgSend_setIsPHPersonTypeImportant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsPHPersonTypeImportant:");
}

id objc_msgSend_setIsParamsUpdateOnHold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsParamsUpdateOnHold:");
}

id objc_msgSend_setIsPreOnboardedVisit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsPreOnboardedVisit:");
}

id objc_msgSend_setIsRepetitiveContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsRepetitiveContact:");
}

id objc_msgSend_setIsScoredContactUsable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsScoredContactUsable:");
}

id objc_msgSend_setIsSensitivePOI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsSensitivePOI:");
}

id objc_msgSend_setIsShortVisit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsShortVisit:");
}

id objc_msgSend_setIsSignificant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsSignificant:");
}

id objc_msgSend_setIsWorkVisit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsWorkVisit:");
}

id objc_msgSend_setItemAttributionsCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemAttributionsCount:");
}

id objc_msgSend_setItemFromMeFeature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemFromMeFeature:");
}

id objc_msgSend_setItemIsPinned_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemIsPinned:");
}

id objc_msgSend_setItemRecipients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemRecipients:");
}

id objc_msgSend_setItemSenders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemSenders:");
}

id objc_msgSend_setItemShareDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemShareDirection:");
}

id objc_msgSend_setItemSyndicationStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemSyndicationStatus:");
}

id objc_msgSend_setItemURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemURL:");
}

id objc_msgSend_setJournalEntryIsCancelled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJournalEntryIsCancelled:");
}

id objc_msgSend_setJournalEntryIsCreated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJournalEntryIsCreated:");
}

id objc_msgSend_setJournalEntryIsDeleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJournalEntryIsDeleted:");
}

id objc_msgSend_setJournalEntryIsEdited_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJournalEntryIsEdited:");
}

id objc_msgSend_setKeyword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyword:");
}

id objc_msgSend_setKindnessEvergreenTypeEngagementWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKindnessEvergreenTypeEngagementWeight:");
}

id objc_msgSend_setLabelQualityScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLabelQualityScore:");
}

id objc_msgSend_setLabelSpecificityNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLabelSpecificityNormalized:");
}

id objc_msgSend_setLabels_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLabels:");
}

id objc_msgSend_setLastAnalyticsSubmissionDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastAnalyticsSubmissionDate");
}

id objc_msgSend_setLastProcessedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastProcessedDate:");
}

id objc_msgSend_setLatitude_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLatitude:");
}

id objc_msgSend_setLifeEventCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLifeEventCategory:");
}

id objc_msgSend_setLifeEventContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLifeEventContext:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocation:");
}

id objc_msgSend_setLocationContextEmbedding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocationContextEmbedding:");
}

id objc_msgSend_setLocationMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocationMode:");
}

id objc_msgSend_setLongitude_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLongitude:");
}

id objc_msgSend_setMapItemID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMapItemID:");
}

id objc_msgSend_setMapItemLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMapItemLocation:");
}

id objc_msgSend_setMapItemPlaceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMapItemPlaceType:");
}

id objc_msgSend_setMatchingIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMatchingIdentifiers:");
}

id objc_msgSend_setMatchingSourceBundleIds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMatchingSourceBundleIds:");
}

id objc_msgSend_setMePersonIdentified_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMePersonIdentified:");
}

id objc_msgSend_setMediaActionForWorkoutBundle_withMediaPlaySessionDominantFactorThreshold_mediaPlaySessionsOverlapsMinimumDistance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaActionForWorkoutBundle:withMediaPlaySessionDominantFactorThreshold:mediaPlaySessionsOverlapsMinimumDistance:");
}

id objc_msgSend_setMediaAlbum_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaAlbum:");
}

id objc_msgSend_setMediaArtist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaArtist:");
}

id objc_msgSend_setMediaFirstPartyTimePlayedRatio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaFirstPartyTimePlayedRatio:");
}

id objc_msgSend_setMediaGenre_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaGenre:");
}

id objc_msgSend_setMediaPlaySessions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaPlaySessions:");
}

id objc_msgSend_setMediaPlayerBundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaPlayerBundleId:");
}

id objc_msgSend_setMediaProductId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaProductId:");
}

id objc_msgSend_setMediaRepetitions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaRepetitions:");
}

id objc_msgSend_setMediaScoreFeatureNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaScoreFeatureNormalized:");
}

id objc_msgSend_setMediaSumTimePlayed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaSumTimePlayed:");
}

id objc_msgSend_setMediaTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaTitle:");
}

id objc_msgSend_setMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaType:");
}

id objc_msgSend_setMetaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetaData:");
}

id objc_msgSend_setMetaDataForAction_metaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetaDataForAction:metaData:");
}

id objc_msgSend_setMetaDataForActions_metaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetaDataForActions:metaData:");
}

id objc_msgSend_setMetaDataForActivityAction_metaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetaDataForActivityAction:metaData:");
}

id objc_msgSend_setMetaDataForActivityConcurrentMediaAction_metaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetaDataForActivityConcurrentMediaAction:metaData:");
}

id objc_msgSend_setMetaDataForActivityPlace_metaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetaDataForActivityPlace:metaData:");
}

id objc_msgSend_setMetaDataForDiningAction_metaData_startDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetaDataForDiningAction:metaData:startDate:endDate:");
}

id objc_msgSend_setMetaDataForPersons_suggestionId_metaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetaDataForPersons:suggestionId:metaData:");
}

id objc_msgSend_setMetaDataForPhotos_metaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetaDataForPhotos:metaData:");
}

id objc_msgSend_setMetaDataForPlace_metaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetaDataForPlace:metaData:");
}

id objc_msgSend_setMetaDataForPlaces_metaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetaDataForPlaces:metaData:");
}

id objc_msgSend_setMetaDataForRank_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetaDataForRank:");
}

id objc_msgSend_setMetaDataForTime_startDate_endDate_metaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetaDataForTime:startDate:endDate:metaData:");
}

id objc_msgSend_setMetaDataWithKeyword_extendedKeyword_value_metaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetaDataWithKeyword:extendedKeyword:value:metaData:");
}

id objc_msgSend_setMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetrics:");
}

id objc_msgSend_setMinute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinute:");
}

id objc_msgSend_setMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMode:");
}

id objc_msgSend_setMonth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMonth:");
}

id objc_msgSend_setMotionDistance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMotionDistance:");
}

id objc_msgSend_setMotionStepCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMotionStepCount:");
}

id objc_msgSend_setMotionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMotionType:");
}

id objc_msgSend_setMultipleInteractionTypesFeature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMultipleInteractionTypesFeature:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNotificationCategories_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationCategories:");
}

id objc_msgSend_setNumAnomalyEventsNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumAnomalyEventsNormalized:");
}

id objc_msgSend_setNumCoworkersNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumCoworkersNormalized:");
}

id objc_msgSend_setNumFamilyNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumFamilyNormalized:");
}

id objc_msgSend_setNumFriendsNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumFriendsNormalized:");
}

id objc_msgSend_setNumKidsNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumKidsNormalized:");
}

id objc_msgSend_setNumMediaTypeResourcesNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumMediaTypeResourcesNormalized:");
}

id objc_msgSend_setNumOtherPersonsNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumOtherPersonsNormalized:");
}

id objc_msgSend_setNumPetsNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumPetsNormalized:");
}

id objc_msgSend_setNumPhotoAssetsResourcesNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumPhotoAssetsResourcesNormalized:");
}

id objc_msgSend_setNumRoutineEventsNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumRoutineEventsNormalized:");
}

id objc_msgSend_setNumStateOfMindEventsNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumStateOfMindEventsNormalized:");
}

id objc_msgSend_setNumTrendEventsNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumTrendEventsNormalized:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOnboardingFlowCompletionStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnboardingFlowCompletionStatus:");
}

id objc_msgSend_setOptInDNU_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOptInDNU:");
}

id objc_msgSend_setOptInIHA_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOptInIHA:");
}

id objc_msgSend_setOption_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOption:forKey:");
}

id objc_msgSend_setOtherSubjectFromPhotoTraitsHistogram_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOtherSubjectFromPhotoTraitsHistogram:");
}

id objc_msgSend_setOutingInterfaceTypeEngagementWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutingInterfaceTypeEngagementWeight:");
}

id objc_msgSend_setOutlier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutlier:");
}

id objc_msgSend_setOutlierMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutlierMetadata:");
}

id objc_msgSend_setOutlierScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutlierScore:");
}

id objc_msgSend_setOutlierScoreThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutlierScoreThreshold:");
}

id objc_msgSend_setPCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPCount:");
}

id objc_msgSend_setPairWiseWeights_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPairWiseWeights:");
}

id objc_msgSend_setParticipants_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParticipants:");
}

id objc_msgSend_setPatternDetectorName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPatternDetectorName:");
}

id objc_msgSend_setPatterns_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPatterns:");
}

id objc_msgSend_setPeopleCountMaxNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeopleCountMaxNormalized:");
}

id objc_msgSend_setPeopleCountWeightedAverageNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeopleCountWeightedAverageNormalized:");
}

id objc_msgSend_setPeopleCountWeightedSumNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeopleCountWeightedSumNormalized:");
}

id objc_msgSend_setPeopleDensityMaxNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeopleDensityMaxNormalized:");
}

id objc_msgSend_setPeopleDensityWeightedAverageNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeopleDensityWeightedAverageNormalized:");
}

id objc_msgSend_setPersistentStoreDescriptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersistentStoreDescriptions:");
}

id objc_msgSend_setPersonContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersonContext:");
}

id objc_msgSend_setPersonRelationshipHistogram_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersonRelationshipHistogram:");
}

id objc_msgSend_setPersonRelationships_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersonRelationships:");
}

id objc_msgSend_setPersons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersons:");
}

id objc_msgSend_setPhenotype_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhenotype:");
}

id objc_msgSend_setPhotoAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhotoAsset:");
}

id objc_msgSend_setPhotoAssetMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhotoAssetMediaType:");
}

id objc_msgSend_setPhotoCreationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhotoCreationDate:");
}

id objc_msgSend_setPhotoCurationScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhotoCurationScore:");
}

id objc_msgSend_setPhotoFaceCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhotoFaceCount:");
}

id objc_msgSend_setPhotoLibrary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhotoLibrary:");
}

id objc_msgSend_setPhotoMemoryAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhotoMemoryAssets:");
}

id objc_msgSend_setPhotoMemoryCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhotoMemoryCategory:");
}

id objc_msgSend_setPhotoMemoryInterfaceTypeEngagementWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhotoMemoryInterfaceTypeEngagementWeight:");
}

id objc_msgSend_setPhotoMemoryIsFavorite_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhotoMemoryIsFavorite:");
}

id objc_msgSend_setPhotoMemoryRelevanceScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhotoMemoryRelevanceScore:");
}

id objc_msgSend_setPhotoMemorySubCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhotoMemorySubCategory:");
}

id objc_msgSend_setPhotoMemoryTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhotoMemoryTitle:");
}

id objc_msgSend_setPhotoMomentInterfaceTypeEngagementWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhotoMomentInterfaceTypeEngagementWeight:");
}

id objc_msgSend_setPhotoMomentSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhotoMomentSource:");
}

id objc_msgSend_setPhotoOverallAestheticScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhotoOverallAestheticScore:");
}

id objc_msgSend_setPhotoSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhotoSource:");
}

id objc_msgSend_setPhotoTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhotoTraits:");
}

id objc_msgSend_setPlace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlace:");
}

id objc_msgSend_setPlaceDiscovery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceDiscovery:");
}

id objc_msgSend_setPlaceMapItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceMapItem:");
}

id objc_msgSend_setPlaceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceName:");
}

id objc_msgSend_setPlaceNameConfidence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceNameConfidence:");
}

id objc_msgSend_setPlaceNameHistogram_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceNameHistogram:");
}

id objc_msgSend_setPlaceSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceSource:");
}

id objc_msgSend_setPlaceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceType:");
}

id objc_msgSend_setPlaceTypeFromPhotoTraitsHistogram_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceTypeFromPhotoTraitsHistogram:");
}

id objc_msgSend_setPlaceUserType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceUserType:");
}

id objc_msgSend_setPlaces_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaces:");
}

id objc_msgSend_setPoiCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPoiCategory:");
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicate:");
}

id objc_msgSend_setPredominantWeather_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredominantWeather:");
}

id objc_msgSend_setPreregistered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreregistered:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setPriorityScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriorityScore:");
}

id objc_msgSend_setPromptLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPromptLanguage:");
}

id objc_msgSend_setPromptLanguages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPromptLanguages:");
}

id objc_msgSend_setPropertiesBasedOnEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPropertiesBasedOnEvents");
}

id objc_msgSend_setPropertiesOfEventMO_withEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPropertiesOfEventMO:withEvent:");
}

id objc_msgSend_setPropertiesOfFSMMO_withFSM_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPropertiesOfFSMMO:withFSM:");
}

id objc_msgSend_setProposition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProposition:");
}

id objc_msgSend_setProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProvider:");
}

id objc_msgSend_setPurposeEvergreenTypeEngagementWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPurposeEvergreenTypeEngagementWeight:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRange:");
}

id objc_msgSend_setRankingDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRankingDictionary:");
}

id objc_msgSend_setRankingParamsFromRankingParamsMO_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRankingParamsFromRankingParamsMO:");
}

id objc_msgSend_setRankingScoreThresholdDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRankingScoreThresholdDict:");
}

id objc_msgSend_setRawValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRawValue:");
}

id objc_msgSend_setRecommendedTabVisitFIThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecommendedTabVisitFIThreshold:");
}

id objc_msgSend_setReferenceDataWithCountry_countryCode_state_stateCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReferenceDataWithCountry:countryCode:state:stateCode:");
}

id objc_msgSend_setReflectiveInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReflectiveInterval:");
}

id objc_msgSend_setRehydrationFailCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRehydrationFailCount:");
}

id objc_msgSend_setRelationship_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelationship:");
}

id objc_msgSend_setRelevantAssetUUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelevantAssetUUIDs:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRequiresExternalPower_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresExternalPower:");
}

id objc_msgSend_setRequiresNetworkConnectivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresNetworkConnectivity:");
}

id objc_msgSend_setRequiresProtectionClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresProtectionClass:");
}

id objc_msgSend_setResilienceEvergreenTypeEngagementWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResilienceEvergreenTypeEngagementWeight:");
}

id objc_msgSend_setResources_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResources:");
}

id objc_msgSend_setResultType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResultType:");
}

id objc_msgSend_setReturnsObjectsAsFaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReturnsObjectsAsFaults:");
}

id objc_msgSend_setRichnessWeightsDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRichnessWeightsDict:");
}

id objc_msgSend_setRoutineDetector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRoutineDetector:");
}

id objc_msgSend_setScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScore:");
}

id objc_msgSend_setScoreWithBiases_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScoreWithBiases:");
}

id objc_msgSend_setScoredTopics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScoredTopics:");
}

id objc_msgSend_setScoringDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScoringDate:");
}

id objc_msgSend_setSecond_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecond:");
}

id objc_msgSend_setSecondLevelActivityHistogram_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecondLevelActivityHistogram:");
}

id objc_msgSend_setSecondObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecondObject:");
}

id objc_msgSend_setShareCountFeatureNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShareCountFeatureNormalized:");
}

id objc_msgSend_setShouldAddStoreAsynchronously_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldAddStoreAsynchronously:");
}

id objc_msgSend_setShouldBackgroundDefaultAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldBackgroundDefaultAction:");
}

id objc_msgSend_setShouldInferMappingModelAutomatically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldInferMappingModelAutomatically:");
}

id objc_msgSend_setShouldMigrateStoreAutomatically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldMigrateStoreAutomatically:");
}

id objc_msgSend_setShouldPrefetchCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldPrefetchCount:");
}

id objc_msgSend_setShouldShowSubordinateIcon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldShowSubordinateIcon:");
}

id objc_msgSend_setSignificanceScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignificanceScore:");
}

id objc_msgSend_setSignificantContactInterfaceTypeEngagementWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignificantContactInterfaceTypeEngagementWeight:");
}

id objc_msgSend_setSocialContextEmbedding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSocialContextEmbedding:");
}

id objc_msgSend_setSocialEventFromPhotoTraitsHistogram_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSocialEventFromPhotoTraitsHistogram:");
}

id objc_msgSend_setSortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSortDescriptors:");
}

id objc_msgSend_setSound_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSound:");
}

id objc_msgSend_setSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSource:");
}

id objc_msgSend_setSourceCreationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceCreationDate:");
}

id objc_msgSend_setSourceEventAccessType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceEventAccessType:");
}

id objc_msgSend_setSourceEventIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceEventIdentifier:");
}

id objc_msgSend_setStartDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartDate:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:");
}

id objc_msgSend_setState_forSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:forSetting:");
}

id objc_msgSend_setStateIHA_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateIHA:");
}

id objc_msgSend_setStateOfMindDomainCountNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateOfMindDomainCountNormalized:");
}

id objc_msgSend_setStateOfMindEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateOfMindEvent:");
}

id objc_msgSend_setStateOfMindInterfaceTypeEngagementWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateOfMindInterfaceTypeEngagementWeight:");
}

id objc_msgSend_setStateOfMindLabelCountNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateOfMindLabelCountNormalized:");
}

id objc_msgSend_setStateOfMindLoggedIn3pApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateOfMindLoggedIn3pApp:");
}

id objc_msgSend_setStateOfMindLoggedInJournalApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateOfMindLoggedInJournalApp:");
}

id objc_msgSend_setStateOnCharger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateOnCharger:");
}

id objc_msgSend_setStateUnlocked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateUnlocked:");
}

id objc_msgSend_setStaticModelParameterMatrix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStaticModelParameterMatrix:");
}

id objc_msgSend_setSubBundleGoodnessScores_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubBundleGoodnessScores:");
}

id objc_msgSend_setSubBundleIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubBundleIDs:");
}

id objc_msgSend_setSubSuggestionIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubSuggestionIDs:");
}

id objc_msgSend_setSubstate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubstate:");
}

id objc_msgSend_setSuggestedEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuggestedEvent:");
}

id objc_msgSend_setSuggestedEventCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuggestedEventCategory:");
}

id objc_msgSend_setSuggestedEventIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuggestedEventIdentifier:");
}

id objc_msgSend_setSuggestedEventTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuggestedEventTitle:");
}

id objc_msgSend_setSuggestionEngagementEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuggestionEngagementEvent:");
}

id objc_msgSend_setSuggestionEngagementEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuggestionEngagementEvents:");
}

id objc_msgSend_setSuggestionEngagementViewCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuggestionEngagementViewCount:");
}

id objc_msgSend_setSuggestionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuggestionID:");
}

id objc_msgSend_setSuggestionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuggestionIdentifier:");
}

id objc_msgSend_setSuggestionIsDeleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuggestionIsDeleted:");
}

id objc_msgSend_setSuggestionIsSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuggestionIsSelected:");
}

id objc_msgSend_setSuggestionQuickAddEntry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuggestionQuickAddEntry:");
}

id objc_msgSend_setSummarizationGranularity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSummarizationGranularity:");
}

id objc_msgSend_setTaskCompleted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskCompleted");
}

id objc_msgSend_setTaskExpiredWithRetryAfter_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskExpiredWithRetryAfter:error:");
}

id objc_msgSend_setTemperature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTemperature:");
}

id objc_msgSend_setTemplateOperator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTemplateOperator:");
}

id objc_msgSend_setTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTime:");
}

id objc_msgSend_setTimeAtHomeDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeAtHomeDuration:");
}

id objc_msgSend_setTimeAtHomeSubType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeAtHomeSubType:");
}

id objc_msgSend_setTimeContextEmbedding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeContextEmbedding:");
}

id objc_msgSend_setTimeContextFromPhotoTraitsHistogram_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeContextFromPhotoTraitsHistogram:");
}

id objc_msgSend_setTimeContextInterfaceTypeEngagementWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeContextInterfaceTypeEngagementWeight:");
}

id objc_msgSend_setTimeCorrelationScoreFeature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeCorrelationScoreFeature:");
}

id objc_msgSend_setTimeRangeEndDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeRangeEndDate:");
}

id objc_msgSend_setTimeRangeStartDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeRangeStartDate:");
}

id objc_msgSend_setTimeString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeString:");
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeStyle:");
}

id objc_msgSend_setTimeTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeTag:");
}

id objc_msgSend_setTimeTagHistogram_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeTagHistogram:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setTimeZoneRecords_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeZoneRecords:");
}

id objc_msgSend_setTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimestamp:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setToDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToDate:");
}

id objc_msgSend_setTopLevelActivityHistogram_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTopLevelActivityHistogram:");
}

id objc_msgSend_setTopicsOfInterestInterfaceTypeEngagementWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTopicsOfInterestInterfaceTypeEngagementWeight:");
}

id objc_msgSend_setTrendDetector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrendDetector:");
}

id objc_msgSend_setTrendDetectorName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrendDetectorName:");
}

id objc_msgSend_setTrendInterfaceTypeEngagementWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrendInterfaceTypeEngagementWeight:");
}

id objc_msgSend_setTrends_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrends:");
}

id objc_msgSend_setTripInterfaceTypeEngagementWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTripInterfaceTypeEngagementWeight:");
}

id objc_msgSend_setTripParts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTripParts:");
}

id objc_msgSend_setTripTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTripTitle:");
}

id objc_msgSend_setTrySchedulingBefore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrySchedulingBefore:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURL:");
}

id objc_msgSend_setUnderlyingQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnderlyingQueue:");
}

id objc_msgSend_setUpdatedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdatedDate:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUserSpecificPlaceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserSpecificPlaceType:");
}

id objc_msgSend_setValence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValence:");
}

id objc_msgSend_setValenceClassification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValenceClassification:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValue_forKey_dictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:dictionary:");
}

id objc_msgSend_setValue_forKey_dictionary_bins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:dictionary:bins:");
}

id objc_msgSend_setValueType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValueType:");
}

id objc_msgSend_setValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues");
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:");
}

id objc_msgSend_setViewCountBasedAdjustmentParameterDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewCountBasedAdjustmentParameterDict:");
}

id objc_msgSend_setViewCountNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewCountNormalized:");
}

id objc_msgSend_setVisitEventsRejectedByWatchLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisitEventsRejectedByWatchLocation:");
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWantsNotificationResponsesDelivered");
}

id objc_msgSend_setWeatherIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWeatherIdentifier:");
}

id objc_msgSend_setWeatherSummary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWeatherSummary:");
}

id objc_msgSend_setWeatherSymbolName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWeatherSymbolName:");
}

id objc_msgSend_setWeekday_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWeekday:");
}

id objc_msgSend_setWindSpeed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWindSpeed:");
}

id objc_msgSend_setWisdomEvergreenTypeEngagementWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWisdomEvergreenTypeEngagementWeight:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithSet:");
}

id objc_msgSend_setWorkoutDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWorkoutDuration:");
}

id objc_msgSend_setWorkoutDurationFeatureNormalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWorkoutDurationFeatureNormalized:");
}

id objc_msgSend_setWorkoutLocationRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWorkoutLocationRoute:");
}

id objc_msgSend_setWorkoutLocationStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWorkoutLocationStart:");
}

id objc_msgSend_setWorkoutTotalDistance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWorkoutTotalDistance:");
}

id objc_msgSend_setWorkoutTotalEnergyBurned_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWorkoutTotalEnergyBurned:");
}

id objc_msgSend_setWorkoutType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWorkoutType:");
}

id objc_msgSend_setWorkoutTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWorkoutTypes:");
}

id objc_msgSend_setYear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setYear:");
}

id objc_msgSend_setYourMediaInterfaceTypeEngagementWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setYourMediaInterfaceTypeEngagementWeight:");
}

id objc_msgSend_setYourSharedContentInterfaceTypeEngagementWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setYourSharedContentInterfaceTypeEngagementWeight:");
}

id objc_msgSend_setYourTimeAtHomeInterfaceTypeEngagementWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setYourTimeAtHomeInterfaceTypeEngagementWeight:");
}

id objc_msgSend_setupFallbackAppBrandedNotificationsWithDateComponents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupFallbackAppBrandedNotificationsWithDateComponents:handler:");
}

id objc_msgSend_setupPeriodicTimeToWriteMomentsNotificationsWithSchedule_options_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPeriodicTimeToWriteMomentsNotificationsWithSchedule:options:handler:");
}

id objc_msgSend_setupServices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupServices");
}

id objc_msgSend_setupSummaryTripMonitorWithHomeLOI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupSummaryTripMonitorWithHomeLOI:");
}

id objc_msgSend_shareCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareCount");
}

id objc_msgSend_shareCountFeatureNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareCountFeatureNormalized");
}

id objc_msgSend_shareEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareEvents:");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedScheduler");
}

id objc_msgSend_sharedWithYouManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedWithYouManager");
}

id objc_msgSend_sharingComposition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharingComposition");
}

id objc_msgSend_shortAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shortAddress");
}

id objc_msgSend_shouldIncludeVisitIntoActionsFromBundles_forDominantBundle_withParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldIncludeVisitIntoActionsFromBundles:forDominantBundle:withParameters:");
}

id objc_msgSend_showUserNotificationWithTitle_message_cancelButtonTitle_acceptButtonTitle_withAcceptanceBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showUserNotificationWithTitle:message:cancelButtonTitle:acceptButtonTitle:withAcceptanceBlock:");
}

id objc_msgSend_shuffleStrings_shuffleMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shuffleStrings:shuffleMode:");
}

id objc_msgSend_shuffleWithSeed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shuffleWithSeed:");
}

id objc_msgSend_shuffledIndexesWithSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shuffledIndexesWithSize:");
}

id objc_msgSend_significanceScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "significanceScore");
}

id objc_msgSend_significantContactEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "significantContactEvent");
}

id objc_msgSend_significantContactInterfaceTypeEngagementWeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "significantContactInterfaceTypeEngagementWeight");
}

id objc_msgSend_significantContactManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "significantContactManager");
}

id objc_msgSend_simpleTimetagFromStartDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "simpleTimetagFromStartDate:endDate:");
}

id objc_msgSend_sinkWithCompletion_receiveInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sinkWithCompletion:receiveInput:");
}

id objc_msgSend_skipRanking(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "skipRanking");
}

id objc_msgSend_slHighlight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "slHighlight");
}

id objc_msgSend_snapToTheDay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "snapToTheDay");
}

id objc_msgSend_snapableEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "snapableEvent:");
}

id objc_msgSend_socialContextEmbedding(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "socialContextEmbedding");
}

id objc_msgSend_socialEventFromPhotoTraitsHistogram(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "socialEventFromPhotoTraitsHistogram");
}

id objc_msgSend_socialScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "socialScore");
}

id objc_msgSend_software(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "software");
}

id objc_msgSend_softwareId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "softwareId");
}

id objc_msgSend_sortBundlesByTimespan(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortBundlesByTimespan");
}

id objc_msgSend_sortData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortData:");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortMOEventArrayByEndDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortMOEventArrayByEndDate");
}

id objc_msgSend_sortMOEventArrayByStartDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortMOEventArrayByStartDate");
}

id objc_msgSend_sortMOEventBundleArrayByEndDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortMOEventBundleArrayByEndDate");
}

id objc_msgSend_sortMOEventBundleArrayByStartDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortMOEventBundleArrayByStartDate");
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_sortUsingDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortUsingDescriptors:");
}

id objc_msgSend_sortedActivityEventsFromBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedActivityEventsFromBundle:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingDescriptors:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_sortedBundleBasedOnGoodnessScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedBundleBasedOnGoodnessScore:");
}

id objc_msgSend_sortedBundleByPhotoAssetsCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedBundleByPhotoAssetsCount:");
}

id objc_msgSend_sortedVisitEventsFromBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedVisitEventsFromBundle:");
}

id objc_msgSend_sortedWorkoutEventsFromBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedWorkoutEventsFromBundle:");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "source");
}

id objc_msgSend_sourceAppBundleIds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceAppBundleIds");
}

id objc_msgSend_sourceCreationDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceCreationDate");
}

id objc_msgSend_sourceEventAccessType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceEventAccessType");
}

id objc_msgSend_sourceEventIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceEventIdentifier");
}

id objc_msgSend_sourceRevision(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceRevision");
}

id objc_msgSend_splitEventArrayByCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "splitEventArrayByCategory:");
}

id objc_msgSend_splitIntoWeekdays_withADPDEvents_withCalendar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "splitIntoWeekdays:withADPDEvents:withCalendar:");
}

id objc_msgSend_standardDeviationOf_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardDeviationOf:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_startDataExportSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDataExportSession");
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDate");
}

id objc_msgSend_startMonitoringForPeopleDiscovery_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startMonitoringForPeopleDiscovery:handler:");
}

id objc_msgSend_startOfDay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startOfDay");
}

id objc_msgSend_startOfDayForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startOfDayForDate:");
}

id objc_msgSend_startOfDayWithBoundaryOfADay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startOfDayWithBoundaryOfADay:");
}

id objc_msgSend_startSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startSession");
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTime");
}

id objc_msgSend_startTimeAppEntry(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTimeAppEntry");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "state");
}

id objc_msgSend_stateCodeFromAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateCodeFromAddress:");
}

id objc_msgSend_stateFromAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateFromAddress:");
}

id objc_msgSend_stateOfMindDomainCountNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateOfMindDomainCountNormalized");
}

id objc_msgSend_stateOfMindEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateOfMindEvent");
}

id objc_msgSend_stateOfMindInterfaceTypeEngagementWeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateOfMindInterfaceTypeEngagementWeight");
}

id objc_msgSend_stateOfMindLabelCountNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateOfMindLabelCountNormalized");
}

id objc_msgSend_stateOfMindLoggedIn3pApp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateOfMindLoggedIn3pApp");
}

id objc_msgSend_stateOfMindLoggedInJournalApp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateOfMindLoggedInJournalApp");
}

id objc_msgSend_stateOfMindType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateOfMindType");
}

id objc_msgSend_stateOnCharger(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateOnCharger");
}

id objc_msgSend_stateUnlocked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateUnlocked");
}

id objc_msgSend_staticModelParameterMatrix(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "staticModelParameterMatrix");
}

id objc_msgSend_stationary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stationary");
}

id objc_msgSend_stayAtTheSameDestinationWithPrevDestinationCode_prevDestinationName_newDestinationCode_newDestinationName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stayAtTheSameDestinationWithPrevDestinationCode:prevDestinationName:newDestinationCode:newDestinationName:");
}

id objc_msgSend_std(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "std");
}

id objc_msgSend_stopMonitoringForPeopleDiscoveryWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopMonitoringForPeopleDiscoveryWithHandler:");
}

id objc_msgSend_storeEvent_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeEvent:CompletionHandler:");
}

id objc_msgSend_storeEventBundles_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeEventBundles:CompletionHandler:");
}

id objc_msgSend_storeEvents_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeEvents:CompletionHandler:");
}

id objc_msgSend_storeEvents_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeEvents:handler:");
}

id objc_msgSend_storeRankingParams_forContext_forEvergreenScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeRankingParams:forContext:forEvergreenScore:");
}

id objc_msgSend_storeWithDirectory_readOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeWithDirectory:readOnly:");
}

id objc_msgSend_stream(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stream");
}

id objc_msgSend_streamNowPlayingEventsFromSource_startDate_endDate_error_processEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "streamNowPlayingEventsFromSource:startDate:endDate:error:processEvent:");
}

id objc_msgSend_stream_publisher(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stream_publisher");
}

id objc_msgSend_stream_source(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stream_source");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByPaddingToLength_withString_startingAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByPaddingToLength:withString:startingAtIndex:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringFromDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringFromState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromState:");
}

id objc_msgSend_stringFromTemplateOperator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromTemplateOperator:");
}

id objc_msgSend_stringFromValueType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromValueType:");
}

id objc_msgSend_stringKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringKeys");
}

id objc_msgSend_stringOfMapItemPlaceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringOfMapItemPlaceType:");
}

id objc_msgSend_stringOfPlaceInferencePlaceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringOfPlaceInferencePlaceType:");
}

id objc_msgSend_stringOfPlaceUserType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringOfPlaceUserType:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_structuredAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "structuredAddress");
}

id objc_msgSend_subBundleGoodnessScores(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subBundleGoodnessScores");
}

id objc_msgSend_subBundleIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subBundleIDs");
}

id objc_msgSend_subStateFromVisitEvent_state_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subStateFromVisitEvent:state:");
}

id objc_msgSend_subSuggestionIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subSuggestionIDs");
}

id objc_msgSend_subTypeFromBaseEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subTypeFromBaseEvents:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_subcategory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subcategory");
}

id objc_msgSend_submitAppEntryEngagementEventAnalytics_appEntryEngagementType_timestamp_withInfo_withTrialExperimentIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitAppEntryEngagementEventAnalytics:appEntryEngagementType:timestamp:withInfo:withTrialExperimentIDs:");
}

id objc_msgSend_submitEngagementAnalyticsWithOnboardingStatus_AndCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitEngagementAnalyticsWithOnboardingStatus:AndCompletionHandler:");
}

id objc_msgSend_submitEngagementAndSuggestionPerformanceAnalyticsWithOnboardingStatus_AndCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitEngagementAndSuggestionPerformanceAnalyticsWithOnboardingStatus:AndCompletionHandler:");
}

id objc_msgSend_submitEngagementHistoryUpdateWithEvent_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitEngagementHistoryUpdateWithEvent:userInfo:");
}

id objc_msgSend_submitEventBundleInternalAnalytics_withSubmissionDate_withRefreshVariant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitEventBundleInternalAnalytics:withSubmissionDate:withRefreshVariant:");
}

id objc_msgSend_submitMOEventData_startDate_endDate_subDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitMOEventData:startDate:endDate:subDate:");
}

id objc_msgSend_submitMetricForEventBundleWithPromptMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitMetricForEventBundleWithPromptMetrics:");
}

id objc_msgSend_submitMetricsWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitMetricsWithError:");
}

id objc_msgSend_submitNotificationEngagementEventAnalyticsForBundles_userInfo_fromTrigger_withPostingDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitNotificationEngagementEventAnalyticsForBundles:userInfo:fromTrigger:withPostingDate:");
}

id objc_msgSend_submitSuggestionEngagementEventAnalytics_suggestionEngagementType_timestamp_withContext_withTrialExperimentIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitSuggestionEngagementEventAnalytics:suggestionEngagementType:timestamp:withContext:withTrialExperimentIDs:");
}

id objc_msgSend_submitSuggestionPerformanceAnalyticsWithOnboardingStatus_AndCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitSuggestionPerformanceAnalyticsWithOnboardingStatus:AndCompletionHandler:");
}

id objc_msgSend_submitTaskRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitTaskRequest:error:");
}

id objc_msgSend_submitUserDataWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitUserDataWithCompletionHandler:");
}

id objc_msgSend_substate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substate");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitle");
}

id objc_msgSend_suggestedEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestedEvent");
}

id objc_msgSend_suggestedEventCategory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestedEventCategory");
}

id objc_msgSend_suggestedEventIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestedEventIdentifier");
}

id objc_msgSend_suggestedEventManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestedEventManager");
}

id objc_msgSend_suggestedEventTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestedEventTitle");
}

id objc_msgSend_suggestedMePersonIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestedMePersonIdentifier");
}

id objc_msgSend_suggestedMePersonIdentifierWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestedMePersonIdentifierWithError:");
}

id objc_msgSend_suggestionEngagementEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestionEngagementEvents");
}

id objc_msgSend_suggestionEngagementViewCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestionEngagementViewCount");
}

id objc_msgSend_suggestionEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestionEvent");
}

id objc_msgSend_suggestionEventToEnum_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestionEventToEnum:");
}

id objc_msgSend_suggestionID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestionID");
}

id objc_msgSend_suggestionId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestionId");
}

id objc_msgSend_suggestionIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestionIdentifier");
}

id objc_msgSend_suggestionIsDeleted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestionIsDeleted");
}

id objc_msgSend_suggestionIsSelected(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestionIsSelected");
}

id objc_msgSend_suggestionQuickAddEntry(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestionQuickAddEntry");
}

id objc_msgSend_suggestionTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestionTimestamp");
}

id objc_msgSend_suggestionType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestionType");
}

id objc_msgSend_suggestionTypeToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestionTypeToString:");
}

id objc_msgSend_suggestionUIVisibilityCategoryToMOEventBundleVisibilityCategoryForUIMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestionUIVisibilityCategoryToMOEventBundleVisibilityCategoryForUIMap");
}

id objc_msgSend_sumTimePlayed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sumTimePlayed");
}

id objc_msgSend_summarizationGranularity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "summarizationGranularity");
}

id objc_msgSend_summarizeMotionActivityBundlesWithSamePlaceName_withParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "summarizeMotionActivityBundlesWithSamePlaceName:withParameters:");
}

id objc_msgSend_summaryDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "summaryDictionary");
}

id objc_msgSend_summaryTripMonitor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "summaryTripMonitor");
}

id objc_msgSend_supportedMetricKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportedMetricKeys");
}

id objc_msgSend_supressCoarseGranularityPropertyOfEventBundle_dominantBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supressCoarseGranularityPropertyOfEventBundle:dominantBundle:");
}

id objc_msgSend_supressCoarseGranularityPropertyOfEventBundles_primaryBundles_bundleMapping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supressCoarseGranularityPropertyOfEventBundles:primaryBundles:bundleMapping:");
}

id objc_msgSend_swHighlightCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "swHighlightCenter");
}

id objc_msgSend_symbol(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "symbol");
}

id objc_msgSend_symbolName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "symbolName");
}

id objc_msgSend_syncService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncService");
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_systemCacheDirectoryPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemCacheDirectoryPath");
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemTimeZone");
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tag");
}

id objc_msgSend_taskRequestForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskRequestForIdentifier:");
}

id objc_msgSend_temperature(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "temperature");
}

id objc_msgSend_templateOperator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "templateOperator");
}

id objc_msgSend_templateOperatorFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "templateOperatorFromString:");
}

id objc_msgSend_templates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "templates");
}

id objc_msgSend_testData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "testData:");
}

id objc_msgSend_testDateInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "testDateInterval");
}

id objc_msgSend_testMomentsNotificationsWithOptions_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "testMomentsNotificationsWithOptions:handler:");
}

id objc_msgSend_thoroughfare(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thoroughfare");
}

id objc_msgSend_tick(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tick");
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "time");
}

id objc_msgSend_timeAtHomeDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeAtHomeDuration");
}

id objc_msgSend_timeAtHomeSubType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeAtHomeSubType");
}

id objc_msgSend_timeContextEmbedding(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeContextEmbedding");
}

id objc_msgSend_timeContextFromPhotoTraitsHistogram(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeContextFromPhotoTraitsHistogram");
}

id objc_msgSend_timeContextInterfaceTypeEngagementWeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeContextInterfaceTypeEngagementWeight");
}

id objc_msgSend_timeCorrelationScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeCorrelationScore");
}

id objc_msgSend_timeCorrelationScoreFeature(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeCorrelationScoreFeature");
}

id objc_msgSend_timeForDate_timeZoneManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeForDate:timeZoneManager:");
}

id objc_msgSend_timeFromStartDate_endDate_timeZoneManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeFromStartDate:endDate:timeZoneManager:");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_timeIntervalThresholdDefault(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalThresholdDefault");
}

id objc_msgSend_timeIntervalThresholdForCoarseGroup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalThresholdForCoarseGroup");
}

id objc_msgSend_timeIntervalThresholdWithSamePlaceName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalThresholdWithSamePlaceName");
}

id objc_msgSend_timeOfDay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeOfDay:");
}

id objc_msgSend_timeOfDayPrefixFromStartDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeOfDayPrefixFromStartDate:endDate:");
}

id objc_msgSend_timeRangeEndDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeRangeEndDate");
}

id objc_msgSend_timeRangeStartDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeRangeStartDate");
}

id objc_msgSend_timeString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeString");
}

id objc_msgSend_timeStringFromTimeTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeStringFromTimeTag:");
}

id objc_msgSend_timeTag(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeTag");
}

id objc_msgSend_timeTagHistogram(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeTagHistogram");
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZone");
}

id objc_msgSend_timeZoneAtDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneAtDate:");
}

id objc_msgSend_timeZoneForSecondsFromGMT_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneForSecondsFromGMT:");
}

id objc_msgSend_timeZoneManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneManager");
}

id objc_msgSend_timeZoneObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneObject");
}

id objc_msgSend_timeZoneRecords(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneRecords");
}

id objc_msgSend_timeZoneWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneWithName:");
}

id objc_msgSend_timespanFromEvents_boundaryInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timespanFromEvents:boundaryInterval:");
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timestamp");
}

id objc_msgSend_timestampAppEntry(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timestampAppEntry");
}

id objc_msgSend_timetag(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timetag");
}

id objc_msgSend_timetagFromStartDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timetagFromStartDate:endDate:");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "title");
}

id objc_msgSend_toDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toDate");
}

id objc_msgSend_toggle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toggle:");
}

id objc_msgSend_topLevelActivityHistogram(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topLevelActivityHistogram");
}

id objc_msgSend_topicStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topicStore");
}

id objc_msgSend_topicsOfInterestInterfaceTypeEngagementWeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topicsOfInterestInterfaceTypeEngagementWeight");
}

id objc_msgSend_totalCharacters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "totalCharacters");
}

id objc_msgSend_totalCharactersAppEntry(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "totalCharactersAppEntry");
}

id objc_msgSend_trainDateInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trainDateInterval");
}

id objc_msgSend_transferPlaceForEvent_landmarkEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transferPlaceForEvent:landmarkEvent:");
}

id objc_msgSend_transformFeaturesFromEvents_withFeatures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transformFeaturesFromEvents:withFeatures:");
}

id objc_msgSend_transformTripPlan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transformTripPlan:");
}

id objc_msgSend_transportationType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transportationType");
}

id objc_msgSend_treatmentId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "treatmentId");
}

id objc_msgSend_trendInterfaceTypeEngagementWeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trendInterfaceTypeEngagementWeight");
}

id objc_msgSend_trends(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trends");
}

id objc_msgSend_triggerFeedbackAssistantFlow_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerFeedbackAssistantFlow:handler:");
}

id objc_msgSend_triggerFeedbackAssistantFlowWithFlowIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerFeedbackAssistantFlowWithFlowIdentifier:");
}

id objc_msgSend_triggerTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerTypes");
}

id objc_msgSend_triggerWithDateMatchingComponents_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerWithDateMatchingComponents:repeats:");
}

id objc_msgSend_trimmedFrom_with_respectOnboardingDate_shouldUseStandardSuite_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trimmedFrom:with:respectOnboardingDate:shouldUseStandardSuite:");
}

id objc_msgSend_tripInterfaceTypeEngagementWeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tripInterfaceTypeEngagementWeight");
}

id objc_msgSend_tripParts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tripParts");
}

id objc_msgSend_tripStateFromVisitEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tripStateFromVisitEvent:");
}

id objc_msgSend_tripTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tripTitle");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "type");
}

id objc_msgSend_typeAppEntry(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "typeAppEntry");
}

id objc_msgSend_typeAppEntryStr(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "typeAppEntryStr");
}

id objc_msgSend_typeOfDayTagFromStartDate_endDate_timeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "typeOfDayTagFromStartDate:endDate:timeZone:");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_unionWithDateInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionWithDateInterval:");
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueIdentifier");
}

id objc_msgSend_unit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unit");
}

id objc_msgSend_universe(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "universe");
}

id objc_msgSend_unknown(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unknown");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unlock");
}

id objc_msgSend_unregisterDispatcher_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterDispatcher:");
}

id objc_msgSend_unregisterForNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterForNotification:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedLongValue");
}

id objc_msgSend_updateActionWithBaseEvents_contextEvents_eventBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateActionWithBaseEvents:contextEvents:eventBundle:");
}

id objc_msgSend_updateBundle_forAppEntryEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateBundle:forAppEntryEvent:");
}

id objc_msgSend_updateBundle_forSuggestionEvent_withSummary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateBundle:forSuggestionEvent:withSummary:");
}

id objc_msgSend_updateConversationsDeletedAtSource_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateConversationsDeletedAtSource:handler:");
}

id objc_msgSend_updateEngagementScoreParamsUsingBFGS(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateEngagementScoreParamsUsingBFGS");
}

id objc_msgSend_updateEventBundles_CompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateEventBundles:CompletionHandler:");
}

id objc_msgSend_updateFSM_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFSM:completionHandler:");
}

id objc_msgSend_updateLearnedFromTheAppDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLearnedFromTheAppDictionary:");
}

id objc_msgSend_updateLearnedFromTheAppDictionary_denyList_statusDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLearnedFromTheAppDictionary:denyList:statusDict:");
}

id objc_msgSend_updateManagedObject_eventBundle_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateManagedObject:eventBundle:inManagedObjectContext:");
}

id objc_msgSend_updateMediaPlayEventsDeletedAtSource_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMediaPlayEventsDeletedAtSource:handler:");
}

id objc_msgSend_updateMetaDataForRankInEventBundles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMetaDataForRankInEventBundles:");
}

id objc_msgSend_updateOnboardingStatusDictionaryKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateOnboardingStatusDictionaryKeys:");
}

id objc_msgSend_updatePhotoMemoriesEventsDeletedAtSource_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePhotoMemoriesEventsDeletedAtSource:handler:");
}

id objc_msgSend_updateRankMetaDataFrom_forSummaryBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRankMetaDataFrom:forSummaryBundle:");
}

id objc_msgSend_updateSharedContentsDeletedAtSource_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSharedContentsDeletedAtSource:handler:");
}

id objc_msgSend_updateSharedPhotoEventsDeletedAtSource_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSharedPhotoEventsDeletedAtSource:handler:");
}

id objc_msgSend_updateSuggestionIDAndFirstCreationDateForNewEventBundles_previousEventBundles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSuggestionIDAndFirstCreationDateForNewEventBundles:previousEventBundles:");
}

id objc_msgSend_updateSummaryTripMonitor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSummaryTripMonitor:");
}

id objc_msgSend_updateTaskRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTaskRequest:error:");
}

id objc_msgSend_updateTrendsData_lastEventDate_lastEventInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTrendsData:lastEventDate:lastEventInterval:");
}

id objc_msgSend_updateTrendsData_model_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTrendsData:model:");
}

id objc_msgSend_updateTrendsData_prevTrendsData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTrendsData:prevTrendsData:");
}

id objc_msgSend_updateTrendsData_result_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTrendsData:result:");
}

id objc_msgSend_updateTripMetaDataForRank_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTripMetaDataForRank:");
}

id objc_msgSend_updateWorkoutsDeletedAtSource_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWorkoutsDeletedAtSource:handler:");
}

id objc_msgSend_updatedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedDate");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_userCacheDirectoryPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userCacheDirectoryPath");
}

id objc_msgSend_userDataDumpDirectoryPathWithSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userDataDumpDirectoryPathWithSuffix:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userLibraryPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userLibraryPath");
}

id objc_msgSend_userNotificationCenterAppBranded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userNotificationCenterAppBranded");
}

id objc_msgSend_userNotificationCenterSystemBranded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userNotificationCenterSystemBranded");
}

id objc_msgSend_userSpecificPlaceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userSpecificPlaceType");
}

id objc_msgSend_userType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userType");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uuid");
}

id objc_msgSend_uuidFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uuidFromString:");
}

id objc_msgSend_valence(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valence");
}

id objc_msgSend_valenceClassification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valenceClassification");
}

id objc_msgSend_validateIfActiveClientHasAnyEntitlementInArray_withErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateIfActiveClientHasAnyEntitlementInArray:withErrorHandler:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "value");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKeyPath:");
}

id objc_msgSend_valueFunction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueFunction");
}

id objc_msgSend_valueFunctionType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueFunctionType");
}

id objc_msgSend_valueType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueType");
}

id objc_msgSend_valueTypeFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueTypeFromString:");
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "values");
}

id objc_msgSend_venue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "venue");
}

id objc_msgSend_verifiedType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifiedType");
}

id objc_msgSend_viewContainerName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewContainerName");
}

id objc_msgSend_viewCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewCount");
}

id objc_msgSend_viewCountBasedAdjustmentParameterDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewCountBasedAdjustmentParameterDict");
}

id objc_msgSend_viewCountNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewCountNormalized");
}

id objc_msgSend_viewTotalSuggestionsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewTotalSuggestionsCount");
}

id objc_msgSend_viewVisibleSuggestionsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewVisibleSuggestionsCount");
}

id objc_msgSend_viewVisibleTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewVisibleTime");
}

id objc_msgSend_visibilityState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visibilityState");
}

id objc_msgSend_visitCountInTrip_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visitCountInTrip:");
}

id objc_msgSend_visitEventsRejectedByWatchLocation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visitEventsRejectedByWatchLocation");
}

id objc_msgSend_visitLabelHighConfidenceThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visitLabelHighConfidenceThreshold");
}

id objc_msgSend_visitLabelMediumConfidenceThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visitLabelMediumConfidenceThreshold");
}

id objc_msgSend_visitMinimumIntersectionWithActivityAbsoluteTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visitMinimumIntersectionWithActivityAbsoluteTime");
}

id objc_msgSend_visualIdentifierViewWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visualIdentifierViewWithError:");
}

id objc_msgSend_waitForQueueEmpty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitForQueueEmpty");
}

id objc_msgSend_walking(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "walking");
}

id objc_msgSend_wasBuildVersionUpdated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wasBuildVersionUpdated");
}

id objc_msgSend_weatherIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weatherIdentifier");
}

id objc_msgSend_weatherManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weatherManager");
}

id objc_msgSend_weatherSummary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weatherSummary");
}

id objc_msgSend_weatherSymbolName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weatherSymbolName");
}

id objc_msgSend_weekday(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weekday");
}

id objc_msgSend_weekdays(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weekdays");
}

id objc_msgSend_weightedAverageForObjects_weightPath_valuePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weightedAverageForObjects:weightPath:valuePath:");
}

id objc_msgSend_weightedDurationWithTimeZone_overnightStartDateHour_overnightDurationHours_overnightDurationWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weightedDurationWithTimeZone:overnightStartDateHour:overnightDurationHours:overnightDurationWeight:");
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whitespaceAndNewlineCharacterSet");
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whitespaceCharacterSet");
}

id objc_msgSend_wifiFingerprintLabelType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wifiFingerprintLabelType");
}

id objc_msgSend_windSpeed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windSpeed");
}

id objc_msgSend_wisdomEvergreenTypeEngagementWeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wisdomEvergreenTypeEngagementWeight");
}

id objc_msgSend_withResourcesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withResourcesUsingBlock:");
}

id objc_msgSend_workAvailability(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workAvailability");
}

id objc_msgSend_workoutActivityType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workoutActivityType");
}

id objc_msgSend_workoutDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workoutDuration");
}

id objc_msgSend_workoutDurationFeatureNormalized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workoutDurationFeatureNormalized");
}

id objc_msgSend_workoutEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workoutEvent");
}

id objc_msgSend_workoutLocationRoute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workoutLocationRoute");
}

id objc_msgSend_workoutLocationStart(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workoutLocationStart");
}

id objc_msgSend_workoutMetaDataCreatedForBundles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workoutMetaDataCreatedForBundles:");
}

id objc_msgSend_workoutRouteType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workoutRouteType");
}

id objc_msgSend_workoutTimeIntervalBetweenBundle_andNextBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workoutTimeIntervalBetweenBundle:andNextBundle:");
}

id objc_msgSend_workoutTotalDistance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workoutTotalDistance");
}

id objc_msgSend_workoutTotalEnergyBurned(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workoutTotalEnergyBurned");
}

id objc_msgSend_workoutType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workoutType");
}

id objc_msgSend_workoutTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workoutTypes");
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:error:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:options:error:");
}

id objc_msgSend_xpcProcessName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcProcessName");
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "year");
}

id objc_msgSend_yieldConditionForMetaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "yieldConditionForMetaData:");
}

id objc_msgSend_yieldConditionForValueData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "yieldConditionForValueData:");
}

id objc_msgSend_yieldPresenceCheckForValueData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "yieldPresenceCheckForValueData:");
}

id objc_msgSend_yourMediaInterfaceTypeEngagementWeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "yourMediaInterfaceTypeEngagementWeight");
}

id objc_msgSend_yourSharedContentInterfaceTypeEngagementWeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "yourSharedContentInterfaceTypeEngagementWeight");
}

id objc_msgSend_yourTimeAtHomeInterfaceTypeEngagementWeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "yourTimeAtHomeInterfaceTypeEngagementWeight");
}
