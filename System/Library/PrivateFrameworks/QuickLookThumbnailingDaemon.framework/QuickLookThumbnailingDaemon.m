uint64_t DiskStoreKeyHash(int *a1)
{
  return *a1;
}

id generationFailedErrorWithUnderlyingError(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v9 = v8;
  if (v6)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB3388]);
  if (v7)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2938]);
  v10 = (void *)MEMORY[0x1E0CD32D0];
  objc_msgSend(v5, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithCode:request:additionalUserInfo:", 0, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void sub_1D54B4FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D54B5A1C(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 96));
  _Unwind_Resume(a1);
}

id _log()
{
  uint64_t v0;
  void *v1;

  v0 = MEMORY[0x1E0CD3398];
  v1 = *(void **)(MEMORY[0x1E0CD3398] + 56);
  if (!v1)
  {
    QLTInitLogging();
    v1 = *(void **)(v0 + 56);
  }
  return v1;
}

id _log_0()
{
  uint64_t v0;
  void *v1;

  v0 = MEMORY[0x1E0CD3398];
  v1 = *(void **)(MEMORY[0x1E0CD3398] + 8);
  if (!v1)
  {
    QLTInitLogging();
    v1 = *(void **)(v0 + 8);
  }
  return v1;
}

id _log_1()
{
  uint64_t v0;
  void *v1;

  v0 = MEMORY[0x1E0CD3398];
  v1 = *(void **)(MEMORY[0x1E0CD3398] + 72);
  if (!v1)
  {
    QLTInitLogging();
    v1 = *(void **)(v0 + 72);
  }
  return v1;
}

id _log_2()
{
  void **v0;
  void *v1;

  v0 = (void **)MEMORY[0x1E0CD3398];
  v1 = (void *)*MEMORY[0x1E0CD3398];
  if (!*MEMORY[0x1E0CD3398])
  {
    QLTInitLogging();
    v1 = *v0;
  }
  return v1;
}

id _log_3()
{
  uint64_t v0;
  void *v1;

  v0 = MEMORY[0x1E0CD3398];
  v1 = *(void **)(MEMORY[0x1E0CD3398] + 24);
  if (!v1)
  {
    QLTInitLogging();
    v1 = *(void **)(v0 + 24);
  }
  return v1;
}

id _log_4()
{
  uint64_t v0;
  void *v1;

  v0 = MEMORY[0x1E0CD3398];
  v1 = *(void **)(MEMORY[0x1E0CD3398] + 128);
  if (!v1)
  {
    QLTInitLogging();
    v1 = *(void **)(v0 + 128);
  }
  return v1;
}

id _log_5()
{
  uint64_t v0;
  void *v1;

  v0 = MEMORY[0x1E0CD3398];
  v1 = *(void **)(MEMORY[0x1E0CD3398] + 40);
  if (!v1)
  {
    QLTInitLogging();
    v1 = *(void **)(v0 + 40);
  }
  return v1;
}

id _log_6()
{
  uint64_t v0;
  void *v1;

  v0 = MEMORY[0x1E0CD3398];
  v1 = *(void **)(MEMORY[0x1E0CD3398] + 176);
  if (!v1)
  {
    QLTInitLogging();
    v1 = *(void **)(v0 + 176);
  }
  return v1;
}

id _log_7()
{
  uint64_t v0;
  void *v1;

  v0 = MEMORY[0x1E0CD3398];
  v1 = *(void **)(MEMORY[0x1E0CD3398] + 64);
  if (!v1)
  {
    QLTInitLogging();
    v1 = *(void **)(v0 + 64);
  }
  return v1;
}

id _log_8()
{
  uint64_t v0;
  void *v1;

  v0 = MEMORY[0x1E0CD3398];
  v1 = *(void **)(MEMORY[0x1E0CD3398] + 48);
  if (!v1)
  {
    QLTInitLogging();
    v1 = *(void **)(v0 + 48);
  }
  return v1;
}

id _log_9()
{
  uint64_t v0;
  void *v1;

  v0 = MEMORY[0x1E0CD3398];
  v1 = *(void **)(MEMORY[0x1E0CD3398] + 168);
  if (!v1)
  {
    QLTInitLogging();
    v1 = *(void **)(v0 + 168);
  }
  return v1;
}

void sub_1D54B6D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D54B77FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D54B8258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  os_activity_scope_leave(&state);
  _Block_object_dispose(&a22, 8);
  _Unwind_Resume(a1);
}

BOOL DiskStoreKeyEqual(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

void sub_1D54B8DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D54BA110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D54BA918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1D54BAC84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D54BBC3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _dbLog()
{
  uint64_t v0;
  void *v1;

  v0 = MEMORY[0x1E0CD3398];
  v1 = *(void **)(MEMORY[0x1E0CD3398] + 88);
  if (!v1)
  {
    QLTInitLogging();
    v1 = *(void **)(v0 + 88);
  }
  return v1;
}

void sub_1D54BC8D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D54BC9A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D54BCAB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D54BF41C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D54BF6F4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1D54BF81C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D54BFACC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D54C0A40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  id *v27;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D54C5A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

uint64_t traceSQL(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  NSObject *v5;

  v4 = MEMORY[0x1E0CD3398];
  v5 = *(NSObject **)(MEMORY[0x1E0CD3398] + 8);
  if (a2)
  {
    if (!v5)
    {
      QLTInitLogging();
      v5 = *(NSObject **)(v4 + 8);
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      traceSQL_cold_2(v5, a2, a3);
  }
  else
  {
    if (!v5)
    {
      QLTInitLogging();
      v5 = *(NSObject **)(v4 + 8);
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      traceSQL_cold_1();
  }
  return 0;
}

void sub_1D54C7798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_8(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

id OUTLINED_FUNCTION_13(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_14()
{
  sqlite3 *v0;

  return sqlite3_errcode(v0);
}

void sub_1D54CADC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
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

void sub_1D54CB26C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 184), 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

uint64_t UIKitLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = UIKitLibraryCore_frameworkLibrary;
  v6 = UIKitLibraryCore_frameworkLibrary;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E99D2E58;
    v8 = *(_OWORD *)&off_1E99D2E68;
    v1 = _sl_dlopen();
    v4[3] = v1;
    UIKitLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1D54CB934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t UIKitLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = UIKitLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getUIImageClass()
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
  v0 = (void *)getUIImageClass_softClass;
  v7 = getUIImageClass_softClass;
  if (!getUIImageClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getUIImageClass_block_invoke;
    v3[3] = &unk_1E99D2E80;
    v3[4] = &v4;
    __getUIImageClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D54CBA44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIImageClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  UIKitLibrary();
  result = objc_getClass("UIImage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUIImageClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getUIImageClass_block_invoke_cold_1();
    return (Class)getUIGraphicsBeginImageContextWithOptionsSymbolLoc(v3);
  }
  return result;
}

void *getUIGraphicsBeginImageContextWithOptionsSymbolLoc()
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
  v0 = (void *)getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr;
  v6 = getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr;
  if (!getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr)
  {
    v1 = (void *)UIKitLibrary();
    v0 = dlsym(v1, "UIGraphicsBeginImageContextWithOptions");
    v4[3] = (uint64_t)v0;
    getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1D54CBB28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t _UIGraphicsBeginImageContextWithOptions(uint64_t a1, double a2, double a3, double a4)
{
  uint64_t (*UIGraphicsBeginImageContextWithOptionsSymbolLoc)(uint64_t, double, double, double);
  uint64_t v10;

  UIGraphicsBeginImageContextWithOptionsSymbolLoc = (uint64_t (*)(uint64_t, double, double, double))getUIGraphicsBeginImageContextWithOptionsSymbolLoc();
  if (UIGraphicsBeginImageContextWithOptionsSymbolLoc)
    return UIGraphicsBeginImageContextWithOptionsSymbolLoc(a1, a2, a3, a4);
  v10 = _UIGraphicsBeginImageContextWithOptions_cold_1();
  return getUIGraphicsGetCurrentContextSymbolLoc(v10);
}

void *getUIGraphicsGetCurrentContextSymbolLoc()
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
  v0 = (void *)getUIGraphicsGetCurrentContextSymbolLoc_ptr;
  v6 = getUIGraphicsGetCurrentContextSymbolLoc_ptr;
  if (!getUIGraphicsGetCurrentContextSymbolLoc_ptr)
  {
    v1 = (void *)UIKitLibrary();
    v0 = dlsym(v1, "UIGraphicsGetCurrentContext");
    v4[3] = (uint64_t)v0;
    getUIGraphicsGetCurrentContextSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1D54CBC10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t _UIGraphicsGetCurrentContext()
{
  uint64_t (*CurrentContextSymbolLoc)(void);
  uint64_t v2;

  CurrentContextSymbolLoc = (uint64_t (*)(void))getUIGraphicsGetCurrentContextSymbolLoc();
  if (CurrentContextSymbolLoc)
    return CurrentContextSymbolLoc();
  v2 = _UIGraphicsBeginImageContextWithOptions_cold_1();
  return getUIGraphicsEndImageContextSymbolLoc(v2);
}

void *getUIGraphicsEndImageContextSymbolLoc()
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
  v0 = (void *)getUIGraphicsEndImageContextSymbolLoc_ptr;
  v6 = getUIGraphicsEndImageContextSymbolLoc_ptr;
  if (!getUIGraphicsEndImageContextSymbolLoc_ptr)
  {
    v1 = (void *)UIKitLibrary();
    v0 = dlsym(v1, "UIGraphicsEndImageContext");
    v4[3] = (uint64_t)v0;
    getUIGraphicsEndImageContextSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1D54CBCBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t _UIGraphicsEndImageContext()
{
  uint64_t (*UIGraphicsEndImageContextSymbolLoc)(void);
  uint64_t v2;

  UIGraphicsEndImageContextSymbolLoc = (uint64_t (*)(void))getUIGraphicsEndImageContextSymbolLoc();
  if (UIGraphicsEndImageContextSymbolLoc)
    return UIGraphicsEndImageContextSymbolLoc();
  v2 = _UIGraphicsBeginImageContextWithOptions_cold_1();
  return getUIGraphicsPushContextSymbolLoc(v2);
}

void *getUIGraphicsPushContextSymbolLoc()
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
  v0 = (void *)getUIGraphicsPushContextSymbolLoc_ptr;
  v6 = getUIGraphicsPushContextSymbolLoc_ptr;
  if (!getUIGraphicsPushContextSymbolLoc_ptr)
  {
    v1 = (void *)UIKitLibrary();
    v0 = dlsym(v1, "UIGraphicsPushContext");
    v4[3] = (uint64_t)v0;
    getUIGraphicsPushContextSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1D54CBD68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t _UIGraphicsPushContext(uint64_t a1)
{
  uint64_t (*UIGraphicsPushContextSymbolLoc)(uint64_t);
  uint64_t v4;

  UIGraphicsPushContextSymbolLoc = (uint64_t (*)(uint64_t))getUIGraphicsPushContextSymbolLoc();
  if (UIGraphicsPushContextSymbolLoc)
    return UIGraphicsPushContextSymbolLoc(a1);
  v4 = _UIGraphicsBeginImageContextWithOptions_cold_1();
  return getUIGraphicsPopContextSymbolLoc(v4);
}

void *getUIGraphicsPopContextSymbolLoc()
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
  v0 = (void *)getUIGraphicsPopContextSymbolLoc_ptr;
  v6 = getUIGraphicsPopContextSymbolLoc_ptr;
  if (!getUIGraphicsPopContextSymbolLoc_ptr)
  {
    v1 = (void *)UIKitLibrary();
    v0 = dlsym(v1, "UIGraphicsPopContext");
    v4[3] = (uint64_t)v0;
    getUIGraphicsPopContextSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1D54CBE28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

QLExtensionHostContextThumbnailOperation *_UIGraphicsPopContext()
{
  uint64_t (*UIGraphicsPopContextSymbolLoc)(void);
  QLExtensionHostContextThumbnailOperation *v2;
  SEL v3;
  id v4;
  id v5;
  id v6;

  UIGraphicsPopContextSymbolLoc = (uint64_t (*)(void))getUIGraphicsPopContextSymbolLoc();
  if (UIGraphicsPopContextSymbolLoc)
    return (QLExtensionHostContextThumbnailOperation *)UIGraphicsPopContextSymbolLoc();
  v2 = (QLExtensionHostContextThumbnailOperation *)_UIGraphicsBeginImageContextWithOptions_cold_1();
  return -[QLExtensionHostContextThumbnailOperation initWithAppex:request:completionHandler:](v2, v3, v4, v5, v6);
}

void sub_1D54CC2C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D54CCA34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

id OUTLINED_FUNCTION_2_1(uint64_t a1)
{
  return objc_loadWeakRetained((id *)(a1 + 32));
}

BOOL file_exists(char *a1, _BYTE *a2)
{
  unint64_t v4;
  stat v6;
  char v7[1024];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (v7 == a1)
    v4 = 0;
  else
    v4 = __strlcpy_chk();
  if (*a2)
  {
    if (strcmp(a1, "/"))
      v4 = __strlcat_chk();
    if (v4 > 0x3FF)
      return 0;
    v4 = __strlcat_chk();
  }
  if (v4 >= 0x400)
    return 0;
  memset(&v6, 0, sizeof(v6));
  return stat(v7, &v6) == 0;
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

void sub_1D54CEEBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D54CF2AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_1D54D0218(_Unwind_Exception *a1)
{
  _FPRestorePersona();
  _Unwind_Resume(a1);
}

id cancelledError(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CD32D0];
  objc_msgSend(a1, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithCode:request:additionalUserInfo:", 5, v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id generationFailedError(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CD32D0];
  objc_msgSend(a1, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithCode:request:additionalUserInfo:", 0, v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_1D54D2A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

double CGCeiling(double a1)
{
  return ceil(a1);
}

double CGFloor(double a1)
{
  return floor(a1);
}

void sub_1D54D5DB8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D54D5F44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

_BYTE *OUTLINED_FUNCTION_4_2(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_5_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_3_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  void *v0;

  return objc_msgSend(v0, "length");
}

uint64_t OUTLINED_FUNCTION_10(void *a1, const char *a2)
{
  return objc_msgSend(a1, "location");
}

void OUTLINED_FUNCTION_14_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_16(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x34u);
}

id QLGetValidCacheLocation()
{
  if (overrideCacheLocation)
    objc_msgSend((id)overrideCacheLocation, "stringByAppendingPathComponent:", *MEMORY[0x1E0CD3390]);
  else
    QLTGetDefaultCacheLocation();
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1D54D9094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D54D92A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void OUTLINED_FUNCTION_1_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_9_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  uint64_t v0;
  void *v1;

  return objc_msgSend(v1, "bufferPointedToByBlobInfo:", v0);
}

id OUTLINED_FUNCTION_14_1(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  void *v0;

  return objc_msgSend(v0, "location");
}

uint64_t OUTLINED_FUNCTION_19()
{
  void *v0;

  return objc_msgSend(v0, "length");
}

id OUTLINED_FUNCTION_20(uint64_t a1, void *a2)
{
  return a2;
}

char *OUTLINED_FUNCTION_21(int *a1)
{
  return strerror(*a1);
}

int *OUTLINED_FUNCTION_22()
{
  return __error();
}

void sub_1D54D9EC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D54DA0D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D54DA4E0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D54DA8AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ql_create_tables_initial(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;

  v3 = a1;
  if (objc_msgSend(v3, "execute:", CFSTR("CREATE TABLE thumbnails( docid integer not null, vol_uuid blob not null, last_hit_date integer not null, last_seen_path text not null, PRIMARY KEY (docid, vol_uuid))")))
  {
    v4 = objc_msgSend(v3, "setUserVersion:", 1);
    if (!a2)
      goto LABEL_7;
  }
  else
  {
    v4 = 0;
    if (!a2)
      goto LABEL_7;
  }
  if ((v4 & 1) == 0)
  {
    objc_msgSend(v3, "lastError");
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_7:

  return v4;
}

uint64_t ql_add_cache_delete(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;

  v3 = a1;
  if (objc_msgSend(v3, "execute:", CFSTR("ALTER TABLE thumbnails ADD COLUMN size integer"))
    && objc_msgSend(v3, "execute:", CFSTR("CREATE INDEX thumbnail_last_hit_date ON thumbnails(last_hit_date)")))
  {
    v4 = objc_msgSend(v3, "setUserVersion:", 2);
    if (!a2)
      goto LABEL_8;
  }
  else
  {
    v4 = 0;
    if (!a2)
      goto LABEL_8;
  }
  if ((v4 & 1) == 0)
  {
    objc_msgSend(v3, "lastError");
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_8:

  return v4;
}

uint64_t ql_add_index_on_volume_uuid(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;

  v3 = a1;
  if (objc_msgSend(v3, "execute:", CFSTR("CREATE INDEX thumbnail_vol_uuid ON thumbnails(vol_uuid)")))
  {
    v4 = objc_msgSend(v3, "setUserVersion:", 3);
    if (!a2)
      goto LABEL_7;
  }
  else
  {
    v4 = 0;
    if (!a2)
      goto LABEL_7;
  }
  if ((v4 & 1) == 0)
  {
    objc_msgSend(v3, "lastError");
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_7:

  return v4;
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

void sub_1D54DAEDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D54DB3F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D54DB864(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D54DBD10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D54DC140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D54DC370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D54DC5B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D54DC8D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D54DE1E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D54DE370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t QLCacheInDebugMode()
{
  if (QLCacheInDebugMode_onceToken != -1)
    dispatch_once(&QLCacheInDebugMode_onceToken, &__block_literal_global_7);
  return QLCacheInDebugMode__cacheIsInDebugMode;
}

void sub_1D54E05B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1D54E0788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D54E0E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D54E1380(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D54E15F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D54E3580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  id *v30;
  id *v31;

  objc_destroyWeak(v31);
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D54E4040(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)&STACK[0x3B0]);
  _Unwind_Resume(a1);
}

void sub_1D54E4500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

uint64_t sub_1D54E4AE8()
{
  sub_1D54E5278(&qword_1EFF39370, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1D5500D00);
  return sub_1D54FC938();
}

uint64_t sub_1D54E4B28()
{
  sub_1D54E5278(&qword_1EFF39370, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1D5500D00);
  return sub_1D54FC92C();
}

uint64_t sub_1D54E4B6C()
{
  sub_1D54E5278(&qword_1EFF393A8, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1D5500D44);
  return sub_1D54FC44C();
}

id sub_1D54E4BAC()
{
  id *v0;

  return *v0;
}

uint64_t sub_1D54E4BB4@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_1D54E4BBC(uint64_t a1, uint64_t a2)
{
  return sub_1D54E4C84(a1, a2, MEMORY[0x1E0DEA950]);
}

uint64_t sub_1D54E4BC8()
{
  sub_1D54FC668();
  sub_1D54FC674();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D54E4C08()
{
  uint64_t v0;

  sub_1D54FC668();
  sub_1D54FC95C();
  sub_1D54FC674();
  v0 = sub_1D54FC980();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1D54E4C78(uint64_t a1, uint64_t a2)
{
  return sub_1D54E4C84(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

uint64_t sub_1D54E4C84(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1D54FC668();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1D54E4CC0(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_1D54FC650();
  *a2 = 0;
  return result;
}

uint64_t sub_1D54E4D34(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_1D54FC65C();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1D54E4DB0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_1D54FC668();
  v2 = sub_1D54FC644();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

BOOL sub_1D54E4DF0(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1D54E4E04()
{
  return sub_1D54FC668();
}

uint64_t sub_1D54E4E14()
{
  sub_1D54E5278(&qword_1EFF393A8, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1D5500D44);
  return sub_1D54FC488();
}

uint64_t sub_1D54E4E54()
{
  sub_1D54E5278(&qword_1EFF393A8, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1D5500D44);
  return sub_1D54FC464();
}

uint64_t sub_1D54E4E94(void *a1)
{
  id v2;

  sub_1D54E5278(&qword_1EFF393A8, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1D5500D44);
  v2 = a1;
  return sub_1D54FC458();
}

uint64_t sub_1D54E4EF8()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = *v0;
  v2 = sub_1D54FC788();

  return v2;
}

uint64_t sub_1D54E4F2C()
{
  sub_1D54E5278(&qword_1EFF393A8, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1D5500D44);
  return sub_1D54FC47C();
}

uint64_t sub_1D54E4F7C()
{
  sub_1D54FC95C();
  sub_1D54FC62C();
  return sub_1D54FC980();
}

_QWORD *sub_1D54E4FD8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_1D54E4FE8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_1D54E4FF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_1D54FC668();
  v2 = v1;
  if (v0 == sub_1D54FC668() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_1D54FC908();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void sub_1D54E507C(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

uint64_t sub_1D54E5088()
{
  sub_1D54E5278(&qword_1EFF393A8, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1D5500D44);
  return sub_1D54FC470();
}

BOOL sub_1D54E50E0(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1D54E50F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1D54FC644();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1D54E5138@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1D54FC668();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void type metadata accessor for QLThumbnailError(uint64_t a1)
{
  sub_1D54E53D4(a1, &qword_1EFF39348);
}

void type metadata accessor for QLFileThumbnailRequestOptions(uint64_t a1)
{
  sub_1D54E53D4(a1, &qword_1ED9A6640);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_1D54E53D4(a1, &qword_1ED9A66F8);
}

uint64_t sub_1D54E519C()
{
  sub_1D54E5278(&qword_1ED9A6630, (uint64_t (*)(uint64_t))type metadata accessor for QLFileThumbnailRequestOptions, (uint64_t)&unk_1D5500E54);
  sub_1D54E5278(&qword_1EFF393B0, (uint64_t (*)(uint64_t))type metadata accessor for QLFileThumbnailRequestOptions, (uint64_t)&unk_1D5500B54);
  return sub_1D54FC8D8();
}

uint64_t sub_1D54E5220()
{
  return sub_1D54E5278(&qword_1EFF39350, (uint64_t (*)(uint64_t))type metadata accessor for QLFileThumbnailRequestOptions, (uint64_t)&unk_1D5500B1C);
}

uint64_t sub_1D54E524C()
{
  return sub_1D54E5278(&qword_1EFF39358, (uint64_t (*)(uint64_t))type metadata accessor for QLFileThumbnailRequestOptions, (uint64_t)&unk_1D5500AF4);
}

uint64_t sub_1D54E5278(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1D827388C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1D54E52B8()
{
  return sub_1D54E5278(&qword_1EFF39360, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1D5500C18);
}

uint64_t sub_1D54E52E4()
{
  return sub_1D54E5278(&qword_1EFF39368, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1D5500C44);
}

uint64_t sub_1D54E5310()
{
  return sub_1D54E5278(&qword_1EFF39370, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1D5500D00);
}

uint64_t sub_1D54E533C()
{
  return sub_1D54E5278(&qword_1EFF39378, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1D5500CCC);
}

uint64_t sub_1D54E5368()
{
  return sub_1D54E5278(&qword_1EFF39380, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1D5500C88);
}

uint64_t sub_1D54E5394()
{
  return sub_1D54E5278(&qword_1EFF39388, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_1D5500DEC);
}

void type metadata accessor for Code(uint64_t a1)
{
  sub_1D54E53D4(a1, &qword_1EFF393B8);
}

void sub_1D54E53D4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1D54E5418()
{
  return sub_1D54E5278(&qword_1EFF39390, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_1D5500DB0);
}

unint64_t sub_1D54E5448()
{
  unint64_t result;

  result = qword_1EFF39398;
  if (!qword_1EFF39398)
  {
    result = MEMORY[0x1D827388C](MEMORY[0x1E0DEB470], MEMORY[0x1E0DEB418]);
    atomic_store(result, (unint64_t *)&qword_1EFF39398);
  }
  return result;
}

uint64_t sub_1D54E548C()
{
  return sub_1D54E5278(&qword_1EFF393A0, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_1D5500E28);
}

uint64_t sub_1D54E54B8()
{
  return sub_1D54E5278(&qword_1EFF393A8, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1D5500D44);
}

uint64_t sub_1D54E54E4()
{
  return sub_1D54E5278(&qword_1ED9A6638, (uint64_t (*)(uint64_t))type metadata accessor for QLFileThumbnailRequestOptions, (uint64_t)&unk_1D5500B84);
}

uint64_t sub_1D54E5518()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A66B8);
  sub_1D54FC590();
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1D5500EC0;
  sub_1D54FC56C();
  sub_1D54FC548();
  sub_1D54FC584();
  sub_1D54FC554();
  sub_1D54FC560();
  v1 = sub_1D54E9694(v0);
  swift_setDeallocating();
  swift_arrayDestroy();
  result = swift_deallocClassInstance();
  qword_1EFF3A240 = v1;
  return result;
}

uint64_t sub_1D54E5608()
{
  uint64_t v0;

  v0 = sub_1D54FC5C0();
  __swift_allocate_value_buffer(v0, qword_1ED9A6938);
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED9A6938);
  return sub_1D54FC5B4();
}

uint64_t sub_1D54E5684()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  _QWORD v8[2];

  v0 = sub_1D54FC740();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v0);
  v2 = sub_1D54FC5E4();
  MEMORY[0x1E0C80A78](v2);
  v3 = sub_1D54FC74C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D54EA260(0, &qword_1ED9A6620);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0DEF8D8], v3);
  sub_1D54FC5D8();
  v8[1] = MEMORY[0x1E0DEE9D8];
  sub_1D54E5278((unint64_t *)&unk_1ED9A6610, v1, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A6600);
  sub_1D54EA298();
  sub_1D54FC7B8();
  result = sub_1D54FC770();
  qword_1EFF3A248 = result;
  return result;
}

BOOL sub_1D54E5838(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1D54E584C()
{
  sub_1D54FC95C();
  sub_1D54FC968();
  return sub_1D54FC980();
}

uint64_t sub_1D54E5890()
{
  return sub_1D54FC968();
}

uint64_t sub_1D54E58B8()
{
  sub_1D54FC95C();
  sub_1D54FC968();
  return sub_1D54FC980();
}

uint64_t sub_1D54E58F8()
{
  uint64_t v0;

  v0 = qword_1EFF393C0;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1D54E5934()
{
  sub_1D54E9E50();
  return sub_1D54FC938();
}

uint64_t sub_1D54E595C()
{
  sub_1D54E9E50();
  return sub_1D54FC92C();
}

uint64_t sub_1D54E5988(uint64_t a1, uint64_t a2, int a3, char a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v6 + 272) = a5;
  *(_QWORD *)(v6 + 280) = v5;
  *(_BYTE *)(v6 + 516) = a4;
  *(_DWORD *)(v6 + 512) = a3;
  *(_QWORD *)(v6 + 256) = a1;
  *(_QWORD *)(v6 + 264) = a2;
  v7 = sub_1D54FC590();
  *(_QWORD *)(v6 + 288) = v7;
  *(_QWORD *)(v6 + 296) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v6 + 304) = swift_task_alloc();
  *(_QWORD *)(v6 + 312) = swift_task_alloc();
  *(_QWORD *)(v6 + 320) = swift_task_alloc();
  *(_QWORD *)(v6 + 328) = swift_task_alloc();
  *(_QWORD *)(v6 + 336) = swift_task_alloc();
  *(_QWORD *)(v6 + 344) = swift_task_alloc();
  *(_QWORD *)(v6 + 352) = swift_task_alloc();
  *(_QWORD *)(v6 + 360) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1D54E5A4C()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  id v11;
  _BYTE *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _BYTE *v17;
  id v18;
  id v19;
  char *v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  char *v30;
  _BYTE *v31;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  os_log_type_t type;
  uint64_t v37;
  uint64_t v38[2];

  v1 = *(void **)(v0 + 264);
  v2 = objc_msgSend(*(id *)(v0 + 256), sel_request);
  *(_QWORD *)(v0 + 368) = v2;
  v3 = objc_msgSend(v1, sel_contentType);
  if (!v3)
    goto LABEL_12;
  v4 = v3;
  v6 = *(_QWORD *)(v0 + 352);
  v5 = *(_QWORD *)(v0 + 360);
  v7 = *(_QWORD *)(v0 + 288);
  v8 = *(_QWORD *)(v0 + 296);
  sub_1D54FC53C();

  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32);
  *(_QWORD *)(v0 + 376) = v9;
  v9(v5, v6, v7);
  if (qword_1ED9A6730 != -1)
    swift_once();
  v10 = *(_QWORD *)(v0 + 360);
  swift_beginAccess();
  v11 = (id)qword_1ED9A6550;
  v12 = (_BYTE *)sub_1D54EC214(v10, (char)objc_msgSend(v2, sel_shouldUseRestrictedExtension));
  *(_QWORD *)(v0 + 384) = v12;

  if (!v12)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 296) + 8))(*(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 288));
LABEL_12:
    sub_1D54E7848();
    swift_allocError();
    *v31 = 0;
    swift_willThrow();

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
  if ((v12[OBJC_IVAR___QLThumbnailExtension_externalResourcesAccessAllowed] & 1) == 0)
    objc_msgSend(*(id *)(v0 + 264), sel_setParentDirectoryWrapper_, 0);
  if (qword_1ED9A65D0 != -1)
    swift_once();
  v13 = *(void **)(v0 + 264);
  v14 = sub_1D54FC5C0();
  *(_QWORD *)(v0 + 392) = __swift_project_value_buffer(v14, (uint64_t)qword_1ED9A6938);
  v15 = v2;
  v16 = v13;
  v17 = v12;
  v18 = v15;
  v19 = v16;
  v20 = v17;
  v21 = sub_1D54FC5A8();
  v22 = sub_1D54FC71C();
  v23 = os_log_type_enabled(v21, v22);
  v24 = *(void **)(v0 + 264);
  if (v23)
  {
    type = v22;
    v25 = swift_slowAlloc();
    v35 = (_QWORD *)swift_slowAlloc();
    v37 = swift_slowAlloc();
    v38[0] = v37;
    *(_DWORD *)v25 = 138413058;
    *(_QWORD *)(v0 + 224) = v24;
    v26 = v24;
    sub_1D54FC794();
    *v35 = v24;

    *(_WORD *)(v25 + 12) = 2080;
    v27 = MEMORY[0x1D82727B8](objc_msgSend(v18, sel_size));
    *(_QWORD *)(v0 + 232) = sub_1D54E9054(v27, v28, v38);
    sub_1D54FC794();

    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 22) = 2048;
    v29 = objc_msgSend(v18, sel_badgeType);

    *(_QWORD *)(v0 + 240) = v29;
    sub_1D54FC794();

    *(_WORD *)(v25 + 32) = 2112;
    *(_QWORD *)(v0 + 248) = v20;
    v30 = v20;
    sub_1D54FC794();
    v35[1] = v12;

    _os_log_impl(&dword_1D54AE000, v21, type, "Generating thumbnail for %@ (size %s) with badge type %lu with extension %@", (uint8_t *)v25, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9A6650);
    swift_arrayDestroy();
    MEMORY[0x1D8273904](v35, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1D8273904](v37, -1, -1);
    MEMORY[0x1D8273904](v25, -1, -1);

  }
  else
  {

  }
  v33 = *(_QWORD *)&v20[OBJC_IVAR___QLThumbnailExtension_queueLock];
  v34 = swift_task_alloc();
  *(_QWORD *)(v34 + 16) = v20;
  os_unfair_lock_lock((os_unfair_lock_t)(v33 + 24));
  sub_1D54EF804((void **)(v33 + 16), *(_QWORD *)(v34 + 16), v38);
  *(_QWORD *)(v0 + 400) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(v33 + 24));
  *(_QWORD *)(v0 + 408) = v38[0];
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1D54E5FC8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  int v7;
  void *v8;
  uint64_t v9;

  v1 = *(void **)(v0 + 408);
  v2 = *(_QWORD *)(v0 + 384);
  v3 = *(void **)(v0 + 368);
  v5 = *(_QWORD *)(v0 + 272);
  v4 = *(_QWORD *)(v0 + 280);
  v6 = *(_BYTE *)(v0 + 516);
  v7 = *(_DWORD *)(v0 + 512);
  v8 = *(void **)(v0 + 264);
  *(_QWORD *)(v0 + 120) = v0 + 208;
  *(_QWORD *)(v0 + 80) = v0;
  *(_QWORD *)(v0 + 88) = sub_1D54E6074;
  v9 = swift_continuation_init();
  sub_1D54E788C(v9, v7, v6, v3, v8, v5, v2, v4, v1);
  return swift_continuation_await();
}

uint64_t sub_1D54E6074()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 112);
  *(_QWORD *)(*v0 + 416) = v2;
  if (v2)
    swift_willThrow();
  else
    *(_QWORD *)(v1 + 424) = *(_QWORD *)(v1 + 208);
  return swift_task_switch();
}

uint64_t sub_1D54E60E8()
{
  uint64_t v0;
  double v1;
  double v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  id v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  SEL *v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  id v41;
  void *v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  id v57;
  void *v58;
  SEL *v59;
  void (*v60)(uint64_t, uint64_t, uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  int64_t v68;
  unint64_t v69;
  unint64_t v70;
  void (*v71)(uint64_t, uint64_t, uint64_t);
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(uint64_t, uint64_t);
  int64_t v76;
  unint64_t v77;
  int64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  _BYTE *v84;
  NSObject *v85;
  os_log_type_t v86;
  uint8_t *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  _BYTE *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  _BYTE *v100;
  uint64_t v101;
  uint64_t v102;
  char v103;
  uint64_t v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  _QWORD *v108;
  uint64_t v109;
  uint64_t v110;
  void (*v111)(uint64_t, uint64_t);
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  _BYTE *v118;
  void *v119;
  id v120;
  id v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  _QWORD *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  int64_t v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  void (*v134)(uint64_t, unint64_t, uint64_t);
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;

  v3 = *(void **)(v0 + 424);
  v4 = *(_QWORD *)(v0 + 280);
  v5 = *(void **)(v4 + OBJC_IVAR___QLThumbnailExtensionGenerator_operation);
  *(_QWORD *)(v4 + OBJC_IVAR___QLThumbnailExtensionGenerator_operation) = 0;

  v6 = objc_msgSend(v3, sel_metadata);
  *(_QWORD *)(v0 + 432) = v6;
  v7 = objc_msgSend(v3, sel_bitmapImages);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)(v0 + 400);
    v10 = *(void **)(v0 + 368);
    v11 = *(void **)(v0 + 280);
    sub_1D54EA260(0, &qword_1ED9A66E8);
    v12 = sub_1D54FC6BC();

    v13 = v10;
    v14 = v11;
    v15 = sub_1D54E98FC(v12, v13);
    if (v9)
    {
      v16 = *(void **)(v0 + 408);
      v17 = *(void **)(v0 + 384);
      v18 = *(void **)(v0 + 368);
      v133 = *(_QWORD *)(v0 + 360);
      v19 = *(_QWORD *)(v0 + 288);
      v20 = *(_QWORD *)(v0 + 296);
      v21 = *(void **)(v0 + 280);

      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v133, v19);
      swift_bridgeObjectRelease();
LABEL_59:
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
    v31 = v15;
    v32 = *(void **)(v0 + 368);
    v33 = *(void **)(v0 + 280);
    swift_bridgeObjectRelease();

    goto LABEL_8;
  }
  v22 = objc_msgSend(*(id *)(v0 + 424), sel_ioSurface);
  if (v22)
  {
    v23 = v22;
    v24 = *(void **)(v0 + 368);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A66D0);
    v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_1D5500ED0;
    objc_msgSend(v24, sel_scale);
    v27 = v26;
    v28 = CGImageCreateFromIOSurface();
    if (!v28)
    {
      v79 = *(void **)(v0 + 424);
      v80 = *(void **)(v0 + 408);
      v81 = *(void **)(v0 + 384);
      v82 = v6;
      v83 = *(void **)(v0 + 368);
      v129 = *(_QWORD *)(v0 + 296);
      v131 = *(_QWORD *)(v0 + 288);
      v135 = *(_QWORD *)(v0 + 360);
      sub_1D54E7848();
      swift_allocError();
      *v84 = 2;
      swift_willThrow();
      *(_QWORD *)(v25 + 16) = 0;

      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v129 + 8))(v135, v131);
      goto LABEL_59;
    }
    v29 = (void *)v28;
    v30 = objc_msgSend((id)objc_opt_self(), sel_imageWithCGImage_scale_orientation_, v28, 1, v27);

    *(_QWORD *)(v25 + 32) = v30;
    sub_1D54FC6C8();
    v31 = v25;

LABEL_8:
    v34 = *(void **)(v0 + 368);
    objc_msgSend(v34, sel_minimumDimension);
    v1 = v35;
    v36 = (SEL *)&selRef_errorWithDomain_code_userInfo_;
    objc_msgSend(v34, sel_scale);
    v2 = v37;
    if (v31 >> 62)
    {
LABEL_66:
      swift_bridgeObjectRetain_n();
      v38 = sub_1D54FC890();
      if (v38)
      {
LABEL_10:
        v39 = 0;
        v40 = v1 * v2;
        while (1)
        {
          if ((v31 & 0xC000000000000001) != 0)
            v41 = (id)MEMORY[0x1D8272854](v39, v31);
          else
            v41 = *(id *)(v31 + 8 * v39 + 32);
          v42 = v41;
          v43 = v39 + 1;
          if (__OFADD__(v39, 1))
          {
            __break(1u);
            goto LABEL_65;
          }
          objc_msgSend(v41, sel_size);
          v45 = v44;
          objc_msgSend(v42, v36[399]);
          if (v40 > v45 * v46)
            break;
          objc_msgSend(v42, sel_size);
          v1 = v47;
          objc_msgSend(v42, v36[399]);
          v2 = v48;

          if (v40 > v1 * v2)
            goto LABEL_49;
          ++v39;
          if (v43 == v38)
            goto LABEL_18;
        }

LABEL_49:
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        v85 = sub_1D54FC5A8();
        v86 = sub_1D54FC734();
        if (os_log_type_enabled(v85, v86))
        {
          v87 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v87 = 0;
          _os_log_impl(&dword_1D54AE000, v85, v86, "Thumbnail generator returned an image smaller than the minimum size, returning no thumbnail", v87, 2u);
          MEMORY[0x1D8273904](v87, -1, -1);
        }
        v89 = *(void **)(v0 + 424);
        v88 = *(void **)(v0 + 432);
        v90 = *(void **)(v0 + 384);
        v91 = *(void **)(v0 + 368);
        v132 = *(void **)(v0 + 408);
        v136 = *(_QWORD *)(v0 + 360);
        v92 = *(_QWORD *)(v0 + 288);
        v93 = *(_QWORD *)(v0 + 296);

        sub_1D54E7848();
        swift_allocError();
        *v94 = 2;
        swift_willThrow();

        goto LABEL_53;
      }
    }
    else
    {
      v38 = *(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      if (v38)
        goto LABEL_10;
    }
LABEL_18:
    v49 = *(void **)(v0 + 424);
    v50 = *(void **)(v0 + 408);
    v51 = *(void **)(v0 + 384);
    v52 = *(_QWORD *)(v0 + 360);
    v53 = *(void **)(v0 + 368);
    v54 = *(_QWORD *)(v0 + 296);
    v55 = *(_QWORD *)(v0 + 288);
    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v52, v55);

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(unint64_t, _QWORD))(v0 + 8))(v31, *(_QWORD *)(v0 + 432));
  }
  v57 = objc_msgSend(*(id *)(v0 + 424), sel_item);
  *(_QWORD *)(v0 + 440) = v57;
  if (!v57)
  {
    v95 = *(void **)(v0 + 424);
    v96 = v6;
    v97 = *(void **)(v0 + 408);
    v98 = *(void **)(v0 + 384);
    v99 = *(void **)(v0 + 368);
    v136 = *(_QWORD *)(v0 + 360);
    v92 = *(_QWORD *)(v0 + 288);
    v93 = *(_QWORD *)(v0 + 296);
    sub_1D54E7848();
    swift_allocError();
    *v100 = 2;
    swift_willThrow();

LABEL_53:
    (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v136, v92);
    goto LABEL_59;
  }
  v58 = v57;
  v127 = v6;
  v59 = (SEL *)objc_msgSend(v57, sel_contentType);
  if (!v59)
  {
LABEL_58:
    v112 = *(void **)(v0 + 424);
    v113 = *(void **)(v0 + 408);
    v114 = *(void **)(v0 + 384);
    v115 = *(void **)(v0 + 368);
    v137 = *(_QWORD *)(v0 + 360);
    v116 = *(_QWORD *)(v0 + 288);
    v117 = *(_QWORD *)(v0 + 296);
    sub_1D54E7848();
    swift_allocError();
    *v118 = 2;
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v117 + 8))(v137, v116);
    goto LABEL_59;
  }
  v36 = v59;
  v126 = v58;
  v60 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 376);
  v62 = *(_QWORD *)(v0 + 336);
  v61 = *(_QWORD *)(v0 + 344);
  v63 = *(_QWORD *)(v0 + 288);
  sub_1D54FC53C();

  v60(v61, v62, v63);
  if (qword_1EFF39330 != -1)
    swift_once();
  v31 = *(_QWORD *)(v0 + 296);
  v64 = qword_1EFF3A240;
  v134 = *(void (**)(uint64_t, unint64_t, uint64_t))(v31 + 16);
  v134(*(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 344), *(_QWORD *)(v0 + 288));
  v128 = v64 + 56;
  v65 = -1;
  v66 = -1 << *(_BYTE *)(v64 + 32);
  if (-v66 < 64)
    v65 = ~(-1 << -(char)v66);
  v67 = v65 & *(_QWORD *)(v64 + 56);
  v130 = (unint64_t)(63 - v66) >> 6;
  swift_bridgeObjectRetain_n();
  v68 = 0;
  do
  {
    if (v67)
    {
      v69 = __clz(__rbit64(v67));
      v67 &= v67 - 1;
      v70 = v69 | (v68 << 6);
    }
    else
    {
      v76 = v68 + 1;
      if (__OFADD__(v68, 1))
      {
LABEL_65:
        __break(1u);
        goto LABEL_66;
      }
      if (v76 >= v130)
        goto LABEL_57;
      v77 = *(_QWORD *)(v128 + 8 * v76);
      ++v68;
      if (!v77)
      {
        v68 = v76 + 1;
        if (v76 + 1 >= v130)
          goto LABEL_57;
        v77 = *(_QWORD *)(v128 + 8 * v68);
        if (!v77)
        {
          v68 = v76 + 2;
          if (v76 + 2 >= v130)
            goto LABEL_57;
          v77 = *(_QWORD *)(v128 + 8 * v68);
          if (!v77)
          {
            v68 = v76 + 3;
            if (v76 + 3 >= v130)
              goto LABEL_57;
            v77 = *(_QWORD *)(v128 + 8 * v68);
            if (!v77)
            {
              v68 = v76 + 4;
              if (v76 + 4 >= v130)
                goto LABEL_57;
              v77 = *(_QWORD *)(v128 + 8 * v68);
              if (!v77)
              {
                v78 = v76 + 5;
                if (v78 >= v130)
                {
LABEL_57:
                  v109 = *(_QWORD *)(v0 + 344);
                  v110 = *(_QWORD *)(v0 + 288);
                  v111 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
                  v111(*(_QWORD *)(v0 + 328), v110);
                  swift_release();
                  swift_bridgeObjectRelease();
                  v111(v109, v110);
                  v58 = v126;
                  goto LABEL_58;
                }
                v77 = *(_QWORD *)(v128 + 8 * v78);
                if (!v77)
                {
                  while (1)
                  {
                    v68 = v78 + 1;
                    if (__OFADD__(v78, 1))
                      break;
                    if (v68 >= v130)
                      goto LABEL_57;
                    v77 = *(_QWORD *)(v128 + 8 * v68);
                    ++v78;
                    if (v77)
                      goto LABEL_46;
                  }
                  __break(1u);
LABEL_69:
                  swift_once();
LABEL_56:
                  -[SEL setGenerationQueue:](v36, sel_setGenerationQueue_, qword_1EFF3A248);
                  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A66D0);
                  v106 = swift_allocObject();
                  *(_QWORD *)(v0 + 464) = v106;
                  *(_OWORD *)(v106 + 16) = xmmword_1D5500ED0;
                  *(_QWORD *)(v0 + 56) = v0 + 216;
                  *(_QWORD *)(v0 + 16) = v0;
                  *(_QWORD *)(v0 + 24) = sub_1D54E6DE8;
                  v107 = swift_continuation_init();
                  *(_QWORD *)(v0 + 144) = MEMORY[0x1E0C809B0];
                  v108 = (_QWORD *)(v0 + 144);
                  v108[1] = 0x40000000;
                  v108[2] = sub_1D54E7E90;
                  v108[3] = &block_descriptor;
                  v108[4] = v107;
                  -[SEL generateThumbnailWithCompletionHandler:](v36, sel_generateThumbnailWithCompletionHandler_, v108);
                  return swift_continuation_await();
                }
                v68 = v78;
              }
            }
          }
        }
      }
LABEL_46:
      v67 = (v77 - 1) & v77;
      v70 = __clz(__rbit64(v77)) + (v68 << 6);
    }
    v71 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 376);
    v72 = *(_QWORD *)(v0 + 320);
    v73 = *(_QWORD *)(v0 + 312);
    v74 = *(_QWORD *)(v0 + 288);
    v134(v72, *(_QWORD *)(v64 + 48) + *(_QWORD *)(v31 + 72) * v70, v74);
    v71(v73, v72, v74);
    v36 = (SEL *)sub_1D54FC578();
    v75 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
    *(_QWORD *)(v0 + 448) = v75;
    v75(v73, v74);
  }
  while ((v36 & 1) == 0);
  v101 = *(_QWORD *)(v0 + 304);
  v102 = *(_QWORD *)(v0 + 288);
  v75(*(_QWORD *)(v0 + 328), v102);
  swift_release();
  swift_bridgeObjectRelease();
  sub_1D54FC548();
  v103 = sub_1D54FC578();
  v75(v101, v102);
  if ((v103 & 1) != 0)
  {
    v104 = *(unsigned __int8 *)(v0 + 516);
    v105 = objc_msgSend(objc_allocWithZone((Class)QLTGeneratorThumbnailRequest), sel_initWithRequest_generationHandler_, *(_QWORD *)(v0 + 368), 0);
    v36 = (SEL *)objc_msgSend(objc_allocWithZone((Class)QLPreviewThumbnailGenerator), sel_initWithGeneratorRequest_lowQuality_thumbnailItem_, v105, v104, v126);
    *(_QWORD *)(v0 + 456) = v36;

    if (qword_1EFF39338 != -1)
      goto LABEL_69;
    goto LABEL_56;
  }
  v119 = *(void **)(v0 + 424);
  v120 = objc_msgSend(v119, sel_iconFlavor);
  v121 = objc_msgSend(v119, sel_metadata);
  v122 = objc_msgSend(v121, sel_additionalProperties);

  if (v122)
  {
    v123 = sub_1D54FC614();

  }
  else
  {
    v123 = sub_1D54E7F1C(MEMORY[0x1E0DEE9D8]);
  }
  v124 = sub_1D54E8044(v123);
  *(_QWORD *)(v0 + 480) = v124;
  swift_bridgeObjectRelease();
  v125 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 488) = v125;
  *v125 = v0;
  v125[1] = sub_1D54E7218;
  return sub_1D54E5988(*(_QWORD *)(v0 + 256), v126, v120, *(unsigned __int8 *)(v0 + 516), v124);
}

uint64_t sub_1D54E6D2C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(void **)(v0 + 384);
  v2 = *(_QWORD *)(v0 + 360);
  v3 = *(void **)(v0 + 368);
  v4 = *(_QWORD *)(v0 + 288);
  v5 = *(_QWORD *)(v0 + 296);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
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

uint64_t sub_1D54E6DE8()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 472) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1D54E6E48()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  void (*v3)(uint64_t, uint64_t);
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  id v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE *v41;
  uint64_t v42;
  unint64_t v43;

  v2 = *(void **)(v0 + 456);
  v1 = *(_QWORD *)(v0 + 464);
  v4 = *(void **)(v0 + 440);
  v3 = *(void (**)(uint64_t, uint64_t))(v0 + 448);
  v5 = *(_QWORD *)(v0 + 344);
  v6 = *(_QWORD *)(v0 + 288);
  *(_QWORD *)(v1 + 32) = *(_QWORD *)(v0 + 216);
  v43 = v1;
  sub_1D54FC6C8();

  v3(v5, v6);
  v7 = *(void **)(v0 + 368);
  objc_msgSend(v7, sel_minimumDimension);
  v9 = v8;
  objc_msgSend(v7, sel_scale);
  v11 = v10;
  if (!(v43 >> 62))
  {
    v12 = *(_QWORD *)((v43 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v12)
      goto LABEL_3;
LABEL_11:
    v23 = *(void **)(v0 + 424);
    v24 = *(void **)(v0 + 408);
    v25 = *(void **)(v0 + 384);
    v26 = *(_QWORD *)(v0 + 360);
    v27 = *(void **)(v0 + 368);
    v28 = *(_QWORD *)(v0 + 296);
    v29 = *(_QWORD *)(v0 + 288);
    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v26, v29);

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(unint64_t, _QWORD))(v0 + 8))(v43, *(_QWORD *)(v0 + 432));
  }
LABEL_17:
  swift_bridgeObjectRetain_n();
  v12 = sub_1D54FC890();
  if (!v12)
    goto LABEL_11;
LABEL_3:
  v13 = 0;
  v14 = v9 * v11;
  while (1)
  {
    if ((v43 & 0xC000000000000001) != 0)
      v15 = (id)MEMORY[0x1D8272854](v13, v43);
    else
      v15 = *(id *)(v43 + 8 * v13 + 32);
    v16 = v15;
    v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_17;
    }
    objc_msgSend(v15, sel_size);
    v19 = v18;
    objc_msgSend(v16, sel_scale);
    if (v14 > v19 * v20)
      break;
    objc_msgSend(v16, sel_size);
    v9 = v21;
    objc_msgSend(v16, sel_scale);
    v11 = v22;

    if (v14 > v9 * v11)
      goto LABEL_13;
    ++v13;
    if (v17 == v12)
      goto LABEL_11;
  }

LABEL_13:
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  v31 = sub_1D54FC5A8();
  v32 = sub_1D54FC734();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_1D54AE000, v31, v32, "Thumbnail generator returned an image smaller than the minimum size, returning no thumbnail", v33, 2u);
    MEMORY[0x1D8273904](v33, -1, -1);
  }
  v35 = *(void **)(v0 + 424);
  v34 = *(void **)(v0 + 432);
  v36 = *(void **)(v0 + 408);
  v37 = *(void **)(v0 + 384);
  v38 = *(void **)(v0 + 368);
  v42 = *(_QWORD *)(v0 + 360);
  v40 = *(_QWORD *)(v0 + 288);
  v39 = *(_QWORD *)(v0 + 296);

  sub_1D54E7848();
  swift_allocError();
  *v41 = 2;
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v42, v40);
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

uint64_t sub_1D54E7218(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;

  v6 = *v3;
  *(_QWORD *)(*v3 + 496) = v2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v2)
  {

    *(_QWORD *)(v6 + 504) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_1D54E729C()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  id v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  uint64_t v40;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 448);
  v2 = *(_QWORD *)(v0 + 344);
  v3 = *(_QWORD *)(v0 + 288);

  v1(v2, v3);
  v4 = *(_QWORD *)(v0 + 504);
  v5 = *(void **)(v0 + 368);
  objc_msgSend(v5, sel_minimumDimension);
  v7 = v6;
  objc_msgSend(v5, sel_scale);
  v9 = v8;
  if (!(v4 >> 62))
  {
    v10 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v10)
      goto LABEL_3;
LABEL_11:
    v21 = *(void **)(v0 + 424);
    v22 = *(void **)(v0 + 408);
    v23 = *(void **)(v0 + 384);
    v24 = *(_QWORD *)(v0 + 360);
    v25 = *(void **)(v0 + 368);
    v26 = *(_QWORD *)(v0 + 296);
    v27 = *(_QWORD *)(v0 + 288);
    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v27);

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(unint64_t, _QWORD))(v0 + 8))(v4, *(_QWORD *)(v0 + 432));
  }
LABEL_17:
  swift_bridgeObjectRetain_n();
  v10 = sub_1D54FC890();
  if (!v10)
    goto LABEL_11;
LABEL_3:
  v11 = 0;
  v12 = v7 * v9;
  while (1)
  {
    if ((v4 & 0xC000000000000001) != 0)
      v13 = (id)MEMORY[0x1D8272854](v11, v4);
    else
      v13 = *(id *)(v4 + 8 * v11 + 32);
    v14 = v13;
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_17;
    }
    objc_msgSend(v13, sel_size);
    v17 = v16;
    objc_msgSend(v14, sel_scale);
    if (v12 > v17 * v18)
      break;
    objc_msgSend(v14, sel_size);
    v7 = v19;
    objc_msgSend(v14, sel_scale);
    v9 = v20;

    if (v12 > v7 * v9)
      goto LABEL_13;
    ++v11;
    if (v15 == v10)
      goto LABEL_11;
  }

LABEL_13:
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  v29 = sub_1D54FC5A8();
  v30 = sub_1D54FC734();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v31 = 0;
    _os_log_impl(&dword_1D54AE000, v29, v30, "Thumbnail generator returned an image smaller than the minimum size, returning no thumbnail", v31, 2u);
    MEMORY[0x1D8273904](v31, -1, -1);
  }
  v33 = *(void **)(v0 + 424);
  v32 = *(void **)(v0 + 432);
  v34 = *(void **)(v0 + 408);
  v35 = *(void **)(v0 + 384);
  v36 = *(void **)(v0 + 368);
  v40 = *(_QWORD *)(v0 + 360);
  v38 = *(_QWORD *)(v0 + 288);
  v37 = *(_QWORD *)(v0 + 296);

  sub_1D54E7848();
  swift_allocError();
  *v39 = 2;
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v40, v38);
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

uint64_t sub_1D54E7650()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void (*v3)(uint64_t, uint64_t);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v1 = *(_QWORD *)(v0 + 464);
  v3 = *(void (**)(uint64_t, uint64_t))(v0 + 448);
  v2 = *(void **)(v0 + 456);
  v5 = *(void **)(v0 + 432);
  v4 = *(void **)(v0 + 440);
  v6 = *(void **)(v0 + 424);
  v7 = *(void **)(v0 + 408);
  v10 = *(void **)(v0 + 384);
  v11 = *(void **)(v0 + 368);
  v12 = *(_QWORD *)(v0 + 344);
  v13 = *(_QWORD *)(v0 + 360);
  v8 = *(_QWORD *)(v0 + 288);
  swift_willThrow();
  *(_QWORD *)(v1 + 16) = 0;
  swift_release();

  v3(v12, v8);
  v3(v13, v8);
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

uint64_t sub_1D54E7764()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(void **)(v0 + 440);
  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 448);
  v4 = *(void **)(v0 + 424);
  v3 = *(void **)(v0 + 432);
  v5 = *(void **)(v0 + 384);
  v6 = *(_QWORD *)(v0 + 360);
  v7 = *(void **)(v0 + 368);
  v8 = *(_QWORD *)(v0 + 344);
  v9 = *(_QWORD *)(v0 + 288);

  v1(v8, v9);
  v1(v6, v9);
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

unint64_t sub_1D54E7848()
{
  unint64_t result;

  result = qword_1EFF393D8;
  if (!qword_1EFF393D8)
  {
    result = MEMORY[0x1D827388C](&unk_1D5501000, &type metadata for ThumbnailExtensionGenerator.Errors);
    atomic_store(result, (unint64_t *)&qword_1EFF393D8);
  }
  return result;
}

void sub_1D54E788C(uint64_t a1, int a2, char a3, id a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  char isUniquelyReferenced_nonNull_native;
  void *v19;
  id v20;
  char v21;
  id v22;
  unsigned int v23;
  char v24;
  id v25;
  id v26;
  char v27;
  id v28;
  unsigned __int8 v29;
  char v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  __int128 aBlock;
  void (*v54)(uint64_t, void *, void *);
  void *v55;
  uint64_t (*v56)(void *, void *);
  uint64_t v57;
  uint64_t v58;
  _OWORD v59[2];

  v14 = MEMORY[0x1E0DEE9E0];
  v15 = (void *)MEMORY[0x1E0DEDBC8];
  if (a2)
  {
    v16 = (void *)*MEMORY[0x1E0CD3328];
    v55 = (void *)MEMORY[0x1E0DEDBC8];
    LODWORD(aBlock) = a2;
    sub_1D54EA328(&aBlock, v59);
    v17 = v16;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v58 = v14;
    sub_1D54F1E44(v59, v17, isUniquelyReferenced_nonNull_native);
    v14 = v58;

    swift_bridgeObjectRelease();
  }
  if ((a3 & 1) != 0)
  {
    v19 = (void *)*MEMORY[0x1E0CD3340];
    v55 = (void *)MEMORY[0x1E0DEAFA0];
    LOBYTE(aBlock) = 1;
    sub_1D54EA328(&aBlock, v59);
    v20 = v19;
    v21 = swift_isUniquelyReferenced_nonNull_native();
    v58 = v14;
    sub_1D54F1E44(v59, v20, v21);
    v14 = v58;

    swift_bridgeObjectRelease();
  }
  if (objc_msgSend(a4, sel_interpolationQuality))
  {
    v22 = (id)*MEMORY[0x1E0CD3330];
    v23 = objc_msgSend(a4, sel_interpolationQuality);
    v55 = v15;
    LODWORD(aBlock) = v23;
    sub_1D54EA328(&aBlock, v59);
    v24 = swift_isUniquelyReferenced_nonNull_native();
    v58 = v14;
    sub_1D54F1E44(v59, v22, v24);
    v14 = v58;

    swift_bridgeObjectRelease();
  }
  if (objc_msgSend(a4, sel_badgeType))
  {
    v25 = (id)*MEMORY[0x1E0CD3320];
    v26 = objc_msgSend(a4, sel_badgeType);
    v55 = (void *)MEMORY[0x1E0DEBB98];
    *(_QWORD *)&aBlock = v26;
    sub_1D54EA328(&aBlock, v59);
    v27 = swift_isUniquelyReferenced_nonNull_native();
    v58 = v14;
    sub_1D54F1E44(v59, v25, v27);
    v14 = v58;

    swift_bridgeObjectRelease();
  }
  if (objc_msgSend(a4, sel_thirdPartyVideoDecodersAllowed))
  {
    v28 = (id)*MEMORY[0x1E0CD3338];
    v29 = objc_msgSend(a4, sel_thirdPartyVideoDecodersAllowed);
    v55 = (void *)MEMORY[0x1E0DEAFA0];
    LOBYTE(aBlock) = v29;
    sub_1D54EA328(&aBlock, v59);
    v30 = swift_isUniquelyReferenced_nonNull_native();
    v58 = v14;
    sub_1D54F1E44(v59, v28, v30);

    swift_bridgeObjectRelease();
  }
  objc_msgSend(a4, sel_size);
  v32 = v31;
  v34 = v33;
  objc_msgSend(a4, sel_minimumDimension);
  v36 = v35;
  objc_msgSend(a4, sel_scale);
  v38 = v37;
  if (!a6)
  {
    v39 = objc_msgSend(a4, sel_externalThumbnailGeneratorData);
    sub_1D54FC614();

  }
  v40 = objc_allocWithZone(MEMORY[0x1E0CD3298]);
  type metadata accessor for QLFileThumbnailRequestOptions(0);
  sub_1D54E5278(&qword_1ED9A6630, (uint64_t (*)(uint64_t))type metadata accessor for QLFileThumbnailRequestOptions, (uint64_t)&unk_1D5500E54);
  swift_bridgeObjectRetain();
  v41 = a5;
  v42 = (void *)sub_1D54FC608();
  swift_bridgeObjectRelease();
  v43 = (void *)sub_1D54FC608();
  swift_bridgeObjectRelease();
  v44 = objc_msgSend(v40, sel_initWithItem_maximumSize_minimumSize_scale_options_generationData_, v41, v42, v43, v32, v34, v36, v38);

  v45 = swift_allocObject();
  *(_QWORD *)(v45 + 16) = a1;
  v46 = objc_allocWithZone((Class)QLExtensionHostContextThumbnailOperation);
  v56 = sub_1D54EA398;
  v57 = v45;
  *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v54 = sub_1D54E88A0;
  v55 = &block_descriptor_24;
  v47 = _Block_copy(&aBlock);
  v48 = objc_msgSend(v46, sel_initWithAppex_request_completionHandler_, a7, v44, v47);
  _Block_release(v47);
  swift_release();
  v49 = *(void **)(a8 + OBJC_IVAR___QLThumbnailExtensionGenerator_operation);
  *(_QWORD *)(a8 + OBJC_IVAR___QLThumbnailExtensionGenerator_operation) = v48;
  v50 = v48;

  objc_msgSend(a9, sel_addOperation_, v50);
}

uint64_t sub_1D54E7D84(void *a1, void *a2, uint64_t a3)
{
  id v3;
  void *v6;
  _QWORD *v7;
  id v8;
  void *v9;

  if (a1)
  {
    **(_QWORD **)(*(_QWORD *)(a3 + 64) + 40) = a1;
    v3 = a1;
    return swift_continuation_throwingResume();
  }
  else
  {
    if (a2)
    {
      v6 = a2;
    }
    else
    {
      type metadata accessor for QLThumbnailError(0);
      sub_1D54E8998(MEMORY[0x1E0DEE9D8]);
      sub_1D54E5278(&qword_1EFF393A8, (uint64_t (*)(uint64_t))type metadata accessor for QLThumbnailError, (uint64_t)&unk_1D5500D44);
      sub_1D54FC494();
      v6 = v9;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF39440);
    swift_allocError();
    *v7 = v6;
    v8 = a2;
    return swift_continuation_throwingResumeWithError();
  }
}

uint64_t sub_1D54E7E90(uint64_t result, void *a2, void *a3)
{
  _QWORD *v4;
  id v5;
  id v6;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF39440);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else if (a2)
  {
    **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 64) + 40) = a2;
    v6 = a2;
    return swift_continuation_throwingResume();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_1D54E7F1C(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF39450);
  v2 = sub_1D54FC8B4();
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
    sub_1D54EA340(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_1D54F01A4(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_1D54EA328(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_1D54E8044(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[2];
  _OWORD v37[3];
  _OWORD v38[2];
  __int128 v39;
  _OWORD v40[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF39448);
    v2 = sub_1D54FC8B4();
  }
  else
  {
    v2 = MEMORY[0x1E0DEE9E0];
  }
  v28 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v27)
        goto LABEL_37;
      v14 = *(_QWORD *)(v28 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v27)
          goto LABEL_37;
        v14 = *(_QWORD *)(v28 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v27)
            goto LABEL_37;
          v14 = *(_QWORD *)(v28 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v19 = *v17;
    v18 = v17[1];
    sub_1D54EA1DC(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1D54EA328(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_1D54EA328(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_1D54EA328(v36, v37);
    sub_1D54EA328(v37, &v33);
    result = sub_1D54FC7D0();
    v20 = -1 << *(_BYTE *)(v2 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(_QWORD *)(v10 + 32) = v31;
    result = (uint64_t)sub_1D54EA328(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_1D54EA338();
    return v2;
  }
  v14 = *(_QWORD *)(v28 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1D54E856C(void *a1, void *a2, int a3, char a4, uint64_t a5, void *aBlock, void *a7)
{
  _QWORD *v7;
  id v14;
  id v15;
  _QWORD *v16;

  v7[3] = a2;
  v7[4] = a7;
  v7[2] = a1;
  v7[5] = _Block_copy(aBlock);
  if (a5)
    a5 = sub_1D54FC614();
  v7[6] = a5;
  v14 = a1;
  v15 = a2;
  a7;
  v16 = (_QWORD *)swift_task_alloc();
  v7[7] = v16;
  *v16 = v7;
  v16[1] = sub_1D54E8658;
  return sub_1D54E5988((uint64_t)v14, (uint64_t)v15, a3, a4 & 1, a5);
}

uint64_t sub_1D54E8658(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;

  v4 = v2;
  v7 = *(void **)(*v3 + 24);
  v6 = *(void **)(*v3 + 32);
  v8 = *(void **)(*v3 + 16);
  v9 = *v3;
  swift_task_dealloc();

  v10 = *(void (***)(_QWORD, _QWORD, _QWORD, _QWORD))(v9 + 40);
  swift_bridgeObjectRelease();
  if (v4)
  {
    v11 = (void *)sub_1D54FC4A0();

    ((void (**)(_QWORD, _QWORD, _QWORD, void *))v10)[2](v10, 0, 0, v11);
    _Block_release(v10);
  }
  else
  {
    sub_1D54EA260(0, &qword_1ED9A66F0);
    v12 = (void *)sub_1D54FC6B0();
    ((void (**)(_QWORD, void *, void *, _QWORD))v10)[2](v10, v12, a2, 0);

    _Block_release(v10);
    swift_bridgeObjectRelease();

  }
  return (*(uint64_t (**)(void))(v9 + 8))();
}

id sub_1D54E8774()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR___QLThumbnailExtensionGenerator_operation), sel_cancel);
}

id ThumbnailExtensionGenerator.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ThumbnailExtensionGenerator.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___QLThumbnailExtensionGenerator_operation] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ThumbnailExtensionGenerator();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ThumbnailExtensionGenerator.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ThumbnailExtensionGenerator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void sub_1D54E88A0(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_1D54E8914(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D8273874]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1D54E8964(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unint64_t sub_1D54E8998(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF39450);
  v2 = sub_1D54FC8B4();
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
    sub_1D54EA340(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_1D54E8AC0(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_1D54EA328(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_1D54E8AC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D54FC95C();
  sub_1D54FC674();
  v4 = sub_1D54FC980();
  return sub_1D54E8B24(a1, a2, v4);
}

unint64_t sub_1D54E8B24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v15;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_1D54FC908() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_1D54FC908() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((sub_1D54FC908() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_1D54E8C68(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_1D54EA3F8;
  return v6();
}

uint64_t sub_1D54E8CBC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1D54EA3F8;
  return v7();
}

uint64_t sub_1D54E8D10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1D54FC710();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1D54FC704();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1D54EA0E8(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1D54FC6F8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1D54E8E54(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1D54E8EB8;
  return v6(a1);
}

uint64_t sub_1D54E8EB8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1D54E8F04(uint64_t (*a1)(void))
{
  return a1();
}

void sub_1D54E8F24(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_1D54FC794();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
}

_BYTE **sub_1D54E8FD4(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_1D54E8FE4(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_1D54E9054(v6, v7, a3);
  v8 = *a1 + 8;
  sub_1D54FC794();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1D54E9054(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1D54E9124(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1D54EA1DC((uint64_t)v12, *a3);
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
      sub_1D54EA1DC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1D54E9124(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1D54FC7A0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1D54E92DC(a5, a6);
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
  v8 = sub_1D54FC824();
  if (!v8)
  {
    sub_1D54FC884();
    __break(1u);
LABEL_17:
    result = sub_1D54FC8C0();
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

uint64_t sub_1D54E92DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1D54E9370(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1D54E9548(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1D54E9548(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1D54E9370(uint64_t a1, unint64_t a2)
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
      v3 = sub_1D54E94E4(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1D54FC80C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1D54FC884();
      __break(1u);
LABEL_10:
      v2 = sub_1D54FC698();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1D54FC8C0();
    __break(1u);
LABEL_14:
    result = sub_1D54FC884();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1D54E94E4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A66C8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1D54E9548(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A66C8);
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
  result = sub_1D54FC8C0();
  __break(1u);
  return result;
}

uint64_t sub_1D54E9694(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t result;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;

  v2 = sub_1D54FC590();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v27 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF39460);
    v10 = sub_1D54FC7F4();
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v28 = v9;
    v29 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v32 = v10 + 56;
    while (1)
    {
      v30 = v11;
      v31(v8, v29 + v13 * v11, v2);
      sub_1D54E5278(&qword_1ED9A6588, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0340], MEMORY[0x1E0DF0358]);
      v14 = sub_1D54FC620();
      v15 = ~(-1 << *(_BYTE *)(v10 + 32));
      v16 = v14 & v15;
      v17 = (v14 & (unint64_t)v15) >> 6;
      v18 = *(_QWORD *)(v32 + 8 * v17);
      v19 = 1 << (v14 & v15);
      if ((v19 & v18) != 0)
      {
        do
        {
          v31(v6, *(_QWORD *)(v10 + 48) + v16 * v13, v2);
          sub_1D54E5278(&qword_1ED9A6590, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0340], MEMORY[0x1E0DF0360]);
          v20 = sub_1D54FC638();
          v21 = v3;
          v22 = *(void (**)(char *, uint64_t))(v3 + 8);
          v22(v6, v2);
          if ((v20 & 1) != 0)
          {
            v22(v8, v2);
            v3 = v21;
            v9 = v28;
            goto LABEL_4;
          }
          v16 = (v16 + 1) & v15;
          v17 = v16 >> 6;
          v18 = *(_QWORD *)(v32 + 8 * (v16 >> 6));
          v19 = 1 << v16;
          v3 = v21;
        }
        while ((v18 & (1 << v16)) != 0);
        v9 = v28;
      }
      *(_QWORD *)(v32 + 8 * v17) = v19 | v18;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v16 * v13, v8, v2);
      v24 = *(_QWORD *)(v10 + 16);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (v25)
        break;
      *(_QWORD *)(v10 + 16) = v26;
LABEL_4:
      v11 = v30 + 1;
      if (v30 + 1 == v9)
        return v10;
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9E8];
  }
  return result;
}

uint64_t sub_1D54E98FC(unint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  _BYTE *v18;
  uint64_t v20;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_1D54FC890();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  result = MEMORY[0x1E0DEE9D8];
  if (v3)
  {
    v20 = MEMORY[0x1E0DEE9D8];
    result = sub_1D54FC848();
    if (v3 < 0)
    {
      __break(1u);
    }
    else
    {
      v5 = 0;
      while (1)
      {
        v6 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1D8272854](v5, a1) : *(id *)(a1 + 8 * v5 + 32);
        v7 = v6;
        objc_msgSend(a2, sel_scale);
        v9 = v8;
        v10 = objc_msgSend(v7, sel_data);
        v11 = sub_1D54FC4B8();
        v13 = v12;

        v14 = (void *)sub_1D54FC4AC();
        sub_1D54EA21C(v11, v13);
        v15 = objc_msgSend(v7, sel_format);
        v16 = (void *)QLCreateCGImageWithDataAndFormat();

        if (!v16)
          break;
        ++v5;
        v17 = objc_msgSend((id)objc_opt_self(), sel_imageWithCGImage_scale_orientation_, v16, 1, v9);

        sub_1D54FC830();
        sub_1D54FC854();
        sub_1D54FC860();
        sub_1D54FC83C();
        if (v3 == v5)
          return v20;
      }
      sub_1D54E7848();
      swift_allocError();
      *v18 = 2;
      swift_willThrow();

      return swift_release();
    }
  }
  return result;
}

uint64_t type metadata accessor for ThumbnailExtensionGenerator()
{
  return objc_opt_self();
}

uint64_t method lookup function for ThumbnailExtensionGenerator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ThumbnailExtensionGenerator.generateThumbnail(thumbnailRequest:item:flavor:wantsLowQuality:generationData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  int *v12;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v5) + 0x70);
  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v12 + *v12);
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_1D54E9C08;
  return v15(a1, a2, a3, a4, a5);
}

uint64_t sub_1D54E9C08(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  v6 = *v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t dispatch thunk of ThumbnailExtensionGenerator.cancel()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ThumbnailExtensionGenerator.Errors(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ThumbnailExtensionGenerator.Errors(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_1D54E9D70 + 4 * byte_1D5500EF5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1D54E9DA4 + 4 * byte_1D5500EF0[v4]))();
}

uint64_t sub_1D54E9DA4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D54E9DAC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D54E9DB4);
  return result;
}

uint64_t sub_1D54E9DC0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D54E9DC8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1D54E9DCC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D54E9DD4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D54E9DE0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1D54E9DEC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ThumbnailExtensionGenerator.Errors()
{
  return &type metadata for ThumbnailExtensionGenerator.Errors;
}

unint64_t sub_1D54E9E0C()
{
  unint64_t result;

  result = qword_1EFF393F0;
  if (!qword_1EFF393F0)
  {
    result = MEMORY[0x1D827388C](&unk_1D5500FD8, &type metadata for ThumbnailExtensionGenerator.Errors);
    atomic_store(result, (unint64_t *)&qword_1EFF393F0);
  }
  return result;
}

unint64_t sub_1D54E9E50()
{
  unint64_t result;

  result = qword_1EFF393F8;
  if (!qword_1EFF393F8)
  {
    result = MEMORY[0x1D827388C](&unk_1D5500F58, &type metadata for ThumbnailExtensionGenerator.Errors);
    atomic_store(result, (unint64_t *)&qword_1EFF393F8);
  }
  return result;
}

uint64_t sub_1D54E9E94()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 48));
  return swift_deallocObject();
}

uint64_t sub_1D54E9ED8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  int v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD *v9;

  v2 = *(void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = *(_DWORD *)(v0 + 32);
  v5 = *(_BYTE *)(v0 + 36);
  v6 = *(_QWORD *)(v0 + 40);
  v7 = *(void **)(v0 + 48);
  v8 = *(void **)(v0 + 56);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v9;
  *v9 = v1;
  v9[1] = sub_1D54E9F70;
  return ((uint64_t (*)(void *, void *, int, char, uint64_t, void *, void *))((char *)&dword_1EFF39400
                                                                                     + dword_1EFF39400))(v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_1D54E9F70()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1D54E9FBC()
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
  v5[1] = sub_1D54EA3F8;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1EFF39410 + dword_1EFF39410))(v2, v3, v4);
}

uint64_t objectdestroy_6Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D54EA064(uint64_t a1)
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
  v7[1] = sub_1D54EA3F8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EFF39420 + dword_1EFF39420))(a1, v4, v5, v6);
}

uint64_t sub_1D54EA0E8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A66E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D54EA128()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D54EA14C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1D54E9F70;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EFF39430 + dword_1EFF39430))(a1, v4);
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

uint64_t sub_1D54EA1DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1D54EA21C(uint64_t a1, unint64_t a2)
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

uint64_t sub_1D54EA260(uint64_t a1, unint64_t *a2)
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

unint64_t sub_1D54EA298()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED9A6608;
  if (!qword_1ED9A6608)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED9A6600);
    result = MEMORY[0x1D827388C](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ED9A6608);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D8273880](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_OWORD *sub_1D54EA328(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1D54EA338()
{
  return swift_release();
}

uint64_t sub_1D54EA340(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF39458);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D54EA388()
{
  return swift_deallocObject();
}

uint64_t sub_1D54EA398(void *a1, void *a2)
{
  uint64_t v2;

  return sub_1D54E7D84(a1, a2, *(_QWORD *)(v2 + 16));
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

uint64_t sub_1D54EA3FC(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v3 = v2;
  v6 = objc_msgSend(v2, sel_attributes);
  v7 = sub_1D54FC614();

  if (!*(_QWORD *)(v7 + 16))
  {
    v15 = 0u;
    v16 = 0u;
LABEL_7:
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  v8 = sub_1D54F01A4(a1, a2);
  if ((v9 & 1) == 0)
  {
    v15 = 0u;
    v16 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_1D54EA1DC(*(_QWORD *)(v7 + 56) + 32 * v8, (uint64_t)&v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v16 + 1))
  {
    sub_1D54EA328(&v15, &v17);
    goto LABEL_15;
  }
LABEL_8:
  v10 = objc_msgSend(v3, sel_nsExtensionAttributes, v15, (_QWORD)v16, *((_QWORD *)&v16 + 1));
  v11 = sub_1D54FC614();

  if (*(_QWORD *)(v11 + 16))
  {
    swift_bridgeObjectRetain();
    v12 = sub_1D54F01A4(a1, a2);
    if ((v13 & 1) != 0)
    {
      sub_1D54EA1DC(*(_QWORD *)(v11 + 56) + 32 * v12, (uint64_t)&v17);
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1D54F565C((uint64_t)&v15, &qword_1ED9A66D8);
LABEL_15:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A66D8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A65F8);
  if (swift_dynamicCast())
    return v15;
  else
    return 0;
}

uint64_t sub_1D54EA5DC(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v3 = v2;
  v6 = objc_msgSend(v2, sel_attributes);
  v7 = sub_1D54FC614();

  if (!*(_QWORD *)(v7 + 16))
  {
    v15 = 0u;
    v16 = 0u;
LABEL_7:
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  v8 = sub_1D54F01A4(a1, a2);
  if ((v9 & 1) == 0)
  {
    v15 = 0u;
    v16 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_1D54EA1DC(*(_QWORD *)(v7 + 56) + 32 * v8, (uint64_t)&v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v16 + 1))
  {
    sub_1D54EA328(&v15, &v17);
    goto LABEL_15;
  }
LABEL_8:
  v10 = objc_msgSend(v3, sel_nsExtensionAttributes, v15, (_QWORD)v16, *((_QWORD *)&v16 + 1));
  v11 = sub_1D54FC614();

  if (*(_QWORD *)(v11 + 16))
  {
    swift_bridgeObjectRetain();
    v12 = sub_1D54F01A4(a1, a2);
    if ((v13 & 1) != 0)
    {
      sub_1D54EA1DC(*(_QWORD *)(v11 + 56) + 32 * v12, (uint64_t)&v17);
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1D54F565C((uint64_t)&v15, &qword_1ED9A66D8);
LABEL_15:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A66D8);
  if (swift_dynamicCast())
    return v15;
  else
    return 2;
}

uint64_t sub_1D54EA7B4(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v3 = v2;
  v6 = objc_msgSend(v2, sel_attributes);
  v7 = sub_1D54FC614();

  if (!*(_QWORD *)(v7 + 16))
  {
    v15 = 0u;
    v16 = 0u;
LABEL_7:
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  v8 = sub_1D54F01A4(a1, a2);
  if ((v9 & 1) == 0)
  {
    v15 = 0u;
    v16 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_1D54EA1DC(*(_QWORD *)(v7 + 56) + 32 * v8, (uint64_t)&v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v16 + 1))
  {
    sub_1D54EA328(&v15, &v17);
    goto LABEL_15;
  }
LABEL_8:
  v10 = objc_msgSend(v3, sel_nsExtensionAttributes, v15, (_QWORD)v16, *((_QWORD *)&v16 + 1));
  v11 = sub_1D54FC614();

  if (*(_QWORD *)(v11 + 16))
  {
    swift_bridgeObjectRetain();
    v12 = sub_1D54F01A4(a1, a2);
    if ((v13 & 1) != 0)
    {
      sub_1D54EA1DC(*(_QWORD *)(v11 + 56) + 32 * v12, (uint64_t)&v17);
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1D54F565C((uint64_t)&v15, &qword_1ED9A66D8);
LABEL_15:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A66D8);
  if (swift_dynamicCast())
    return v15;
  else
    return 0;
}

uint64_t sub_1D54EA98C(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  v3 = v2;
  v6 = objc_msgSend(v2, sel_attributes);
  v7 = sub_1D54FC614();

  if (!*(_QWORD *)(v7 + 16))
  {
    v17 = 0u;
    v18 = 0u;
LABEL_7:
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  v8 = sub_1D54F01A4(a1, a2);
  if ((v9 & 1) == 0)
  {
    v17 = 0u;
    v18 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_1D54EA1DC(*(_QWORD *)(v7 + 56) + 32 * v8, (uint64_t)&v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v18 + 1))
  {
    sub_1D54EA328(&v17, &v19);
    goto LABEL_15;
  }
LABEL_8:
  v10 = objc_msgSend(v3, sel_nsExtensionAttributes, v17, (_QWORD)v18, *((_QWORD *)&v18 + 1));
  v11 = sub_1D54FC614();

  if (*(_QWORD *)(v11 + 16))
  {
    swift_bridgeObjectRetain();
    v12 = sub_1D54F01A4(a1, a2);
    if ((v13 & 1) != 0)
    {
      sub_1D54EA1DC(*(_QWORD *)(v11 + 56) + 32 * v12, (uint64_t)&v19);
    }
    else
    {
      v19 = 0u;
      v20 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1D54F565C((uint64_t)&v17, &qword_1ED9A66D8);
LABEL_15:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A66D8);
  v14 = swift_dynamicCast();
  v15 = v17;
  if (!v14)
    return 0;
  return v15;
}

uint64_t sub_1D54EAB68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v0 = sub_1D54FC68C();
  if (v1)
  {
    v2 = v0;
    v3 = v1;
    do
    {
      v6 = sub_1D54FC68C();
      if (!v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v2 == v6 && v3 == v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v4 = sub_1D54FC908();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v4 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      v2 = sub_1D54FC68C();
      v3 = v5;
    }
    while (v5);
  }
  swift_bridgeObjectRelease();
  sub_1D54FC68C();
  v9 = v8;
  swift_bridgeObjectRelease();
  v10 = v9 == 0;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1D54EACCC(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  uint64_t v16;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A6580);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1D54FC4D0();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_1D54F565C(a1, &qword_1ED9A6580);
    sub_1D54F08F4(a2, (uint64_t)v8);
    sub_1D54ECDCC(a2);
    return sub_1D54F565C((uint64_t)v8, &qword_1ED9A6580);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v16 = *v3;
    *v3 = 0x8000000000000000;
    sub_1D54F1F64((uint64_t)v12, a2, isUniquelyReferenced_nonNull_native);
    *v3 = v16;
    swift_bridgeObjectRelease();
    return sub_1D54ECDCC(a2);
  }
}

id sub_1D54EAE30()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ThumbnailExtensionMonitor()), sel_init);
  result = sub_1D54EB788();
  qword_1ED9A6550 = (uint64_t)v0;
  return result;
}

id static ThumbnailExtensionMonitor.shared.getter()
{
  if (qword_1ED9A6730 != -1)
    swift_once();
  swift_beginAccess();
  return (id)qword_1ED9A6550;
}

void static ThumbnailExtensionMonitor.shared.setter(uint64_t a1)
{
  void *v2;

  if (qword_1ED9A6730 != -1)
    swift_once();
  swift_beginAccess();
  v2 = (void *)qword_1ED9A6550;
  qword_1ED9A6550 = a1;

}

uint64_t (*static ThumbnailExtensionMonitor.shared.modify())()
{
  if (qword_1ED9A6730 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1D54EB09C()
{
  uint64_t v0;

  v0 = sub_1D54FC50C();
  type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  swift_bridgeObjectRetain();
  sub_1D54FC680();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1D54EB144()
{
  sub_1D54FC95C();
  sub_1D54FC590();
  sub_1D54E5278(&qword_1ED9A6588, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0340], MEMORY[0x1E0DF0358]);
  sub_1D54FC62C();
  sub_1D54FC974();
  return sub_1D54FC980();
}

uint64_t sub_1D54EB1CC()
{
  sub_1D54FC590();
  sub_1D54E5278(&qword_1ED9A6588, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0340], MEMORY[0x1E0DF0358]);
  sub_1D54FC62C();
  return sub_1D54FC974();
}

uint64_t sub_1D54EB23C()
{
  sub_1D54FC95C();
  sub_1D54FC590();
  sub_1D54E5278(&qword_1ED9A6588, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0340], MEMORY[0x1E0DF0358]);
  sub_1D54FC62C();
  sub_1D54FC974();
  return sub_1D54FC980();
}

uint64_t sub_1D54EB2C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;

  if ((sub_1D54FC530() & 1) != 0)
    v6 = *(_BYTE *)(a1 + *(int *)(a3 + 20)) ^ *(_BYTE *)(a2 + *(int *)(a3 + 20)) ^ 1;
  else
    v6 = 0;
  return v6 & 1;
}

uint64_t sub_1D54EB320()
{
  uint64_t v0;

  v0 = sub_1D54FC5C0();
  __swift_allocate_value_buffer(v0, qword_1ED9A6960);
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED9A6960);
  return sub_1D54FC5B4();
}

id ThumbnailExtensionMonitor.init()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  objc_class *v22;
  _QWORD v24[3];
  uint64_t v25;
  uint64_t v26;
  objc_super v27;
  uint64_t v28;

  v26 = sub_1D54FC74C();
  v1 = *(_QWORD *)(v26 - 8);
  MEMORY[0x1E0C80A78](v26);
  v3 = (char *)v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1D54FC740();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v4);
  v6 = sub_1D54FC5E4();
  MEMORY[0x1E0C80A78](v6);
  v25 = OBJC_IVAR___QLThumbnailExtensionMonitor_queue;
  v24[1] = sub_1D54EA260(0, &qword_1ED9A6620);
  v7 = v0;
  sub_1D54FC5D8();
  v28 = MEMORY[0x1E0DEE9D8];
  sub_1D54E5278((unint64_t *)&unk_1ED9A6610, v5, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A6600);
  sub_1D54ED0CC((unint64_t *)&qword_1ED9A6608, &qword_1ED9A6600);
  sub_1D54FC7B8();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0DEF8D0], v26);
  *(_QWORD *)(v24[2] + v25) = sub_1D54FC770();
  v8 = MEMORY[0x1E0DEE9E0];
  *(_QWORD *)&v7[OBJC_IVAR___QLThumbnailExtensionMonitor_identitiesByType] = MEMORY[0x1E0DEE9E0];
  *(_QWORD *)&v7[OBJC_IVAR___QLThumbnailExtensionMonitor_extensionByIdentifier] = v8;
  *(_QWORD *)&v7[OBJC_IVAR___QLThumbnailExtensionMonitor_matchingExtensionsCache] = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A66D0);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1D5501050;
  v10 = objc_allocWithZone(MEMORY[0x1E0CAA560]);
  v11 = (void *)sub_1D54FC644();
  v12 = objc_msgSend(v10, sel_initWithExtensionPointIdentifier_, v11);

  *(_QWORD *)(v9 + 32) = v12;
  v13 = objc_allocWithZone(MEMORY[0x1E0CAA560]);
  v14 = (void *)sub_1D54FC644();
  v15 = objc_msgSend(v13, sel_initWithExtensionPointIdentifier_, v14);

  *(_QWORD *)(v9 + 40) = v15;
  v16 = objc_allocWithZone(MEMORY[0x1E0CAA560]);
  v17 = (void *)sub_1D54FC644();
  v18 = objc_msgSend(v16, sel_initWithExtensionPointIdentifier_, v17);

  *(_QWORD *)(v9 + 48) = v18;
  v28 = v9;
  sub_1D54FC6C8();
  v19 = objc_allocWithZone(MEMORY[0x1E0CAA568]);
  sub_1D54EA260(0, (unint64_t *)&unk_1ED9A6660);
  v20 = (void *)sub_1D54FC6B0();
  swift_bridgeObjectRelease();
  v21 = objc_msgSend(v19, sel_initWithQueries_, v20);

  *(_QWORD *)&v7[OBJC_IVAR___QLThumbnailExtensionMonitor_queryController] = v21;
  v22 = (objc_class *)type metadata accessor for ThumbnailExtensionMonitor();
  v27.receiver = v7;
  v27.super_class = v22;
  return objc_msgSendSuper2(&v27, sel_init);
}

uint64_t type metadata accessor for ThumbnailExtensionMonitor()
{
  return objc_opt_self();
}

id sub_1D54EB788()
{
  void *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD *v10;
  char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char *v15;
  id v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD aBlock[6];

  v24 = sub_1D54FC5CC();
  v26 = *(_QWORD *)(v24 - 8);
  MEMORY[0x1E0C80A78](v24);
  v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1D54FC5E4();
  v27 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v25 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED9A65C8 != -1)
    swift_once();
  v5 = sub_1D54FC5C0();
  __swift_project_value_buffer(v5, (uint64_t)qword_1ED9A6960);
  v6 = v0;
  v7 = sub_1D54FC5A8();
  v8 = sub_1D54FC728();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    v22 = v3;
    v23 = v2;
    *(_DWORD *)v9 = 138412290;
    aBlock[0] = v6;
    v11 = v6;
    v3 = v22;
    v2 = v23;
    sub_1D54FC794();
    *v10 = v6;

    _os_log_impl(&dword_1D54AE000, v7, v8, "Setup cache for %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9A6650);
    swift_arrayDestroy();
    MEMORY[0x1D8273904](v10, -1, -1);
    MEMORY[0x1D8273904](v9, -1, -1);

  }
  else
  {

  }
  v12 = *(void **)&v6[OBJC_IVAR___QLThumbnailExtensionMonitor_queue];
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v6;
  aBlock[4] = sub_1D54F5718;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D54EBC00;
  aBlock[3] = &block_descriptor_13;
  v14 = _Block_copy(aBlock);
  v15 = v6;
  v16 = v12;
  v17 = v25;
  sub_1D54FC5D8();
  v28 = MEMORY[0x1E0DEE9D8];
  sub_1D54E5278(&qword_1ED9A65D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A65E0);
  sub_1D54ED0CC((unint64_t *)&unk_1ED9A65E8, &qword_1ED9A65E0);
  v18 = v24;
  sub_1D54FC7B8();
  MEMORY[0x1D82727A0](0, v17, v2, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v26 + 8))(v2, v18);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v17, v3);
  swift_release();
  v19 = OBJC_IVAR___QLThumbnailExtensionMonitor_queryController;
  objc_msgSend(*(id *)&v15[OBJC_IVAR___QLThumbnailExtensionMonitor_queryController], sel_setDelegate_, v15);
  return objc_msgSend(*(id *)&v15[v19], sel_resume);
}

uint64_t sub_1D54EBB14(uint64_t a1)
{
  id v1;
  id v2;
  unint64_t v3;

  v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(a1
                                                             + OBJC_IVAR___QLThumbnailExtensionMonitor_queryController), sel_queries));
  if (!v1)
  {
    sub_1D54EA260(0, (unint64_t *)&unk_1ED9A6660);
    sub_1D54FC6BC();
    v1 = (id)sub_1D54FC6B0();
    swift_bridgeObjectRelease();
  }
  v2 = objc_msgSend((id)objc_opt_self(), sel_executeQueries_, v1);

  sub_1D54EA260(0, &qword_1ED9A6628);
  v3 = sub_1D54FC6BC();

  sub_1D54ED1D8(v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D54EBC00(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

BOOL sub_1D54EBC2C(uint64_t a1, double a2, double a3)
{
  double v5;
  char v6;

  v5 = COERCE_DOUBLE(sub_1D54EBD88(a1));
  if ((v6 & 1) != 0)
    return 0;
  if (a2 == 0.0 && a3 == 0.0)
    return 1;
  if (v5 <= a2)
    return v5 <= a3;
  return 0;
}

uint64_t sub_1D54EBD88(uint64_t a1)
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
  char *v11;
  uint64_t v12;
  char *v13;
  char v14;
  void (*v15)(char *, uint64_t);
  void (*v16)(char *, uint64_t, uint64_t);
  char v17;
  uint64_t v18;
  uint64_t v20;
  id v21;
  id v22;
  char *v23;
  uint64_t v24;
  uint64_t ObjectType;
  char *v26;

  v2 = v1;
  ObjectType = swift_getObjectType();
  v4 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1D54FC590();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v24 - v12;
  sub_1D54FC548();
  v14 = sub_1D54FC578();
  v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  v15(v13, v7);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v16(v11, a1, v7);
  if ((v14 & 1) != 0)
  {
    v15(v11, v7);
    return 0x4031000000000000;
  }
  if (qword_1EFF39340 != -1)
    swift_once();
  __swift_project_value_buffer(v7, (uint64_t)qword_1EFF3A250);
  v17 = sub_1D54FC578();
  v15(v11, v7);
  if ((v17 & 1) != 0)
    return 0x4031000000000000;
  v20 = ((uint64_t (*)(char *, uint64_t, uint64_t))v16)(v6, a1, v7);
  v6[*(int *)(v4 + 20)] = 0;
  MEMORY[0x1E0C80A78](v20);
  *(&v24 - 4) = v2;
  *(&v24 - 3) = (uint64_t)v6;
  *(&v24 - 2) = ObjectType;
  v22 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A65C0);
  sub_1D54FC758();

  v23 = v26;
  sub_1D54ECDCC((uint64_t)v6);
  if (!v23)
    return 0;
  v18 = *(_QWORD *)&v23[OBJC_IVAR___QLThumbnailExtension_minimumThumbnailDimension];

  return v18;
}

uint64_t sub_1D54EBFD8(void *a1)
{
  uint64_t v1;
  uint64_t ObjectType;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v21[2];

  ObjectType = swift_getObjectType();
  v4 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1D54FC590();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)v21 - v12;
  v14 = objc_msgSend(a1, sel_contentType);
  if (!v14)
    return 0;
  v15 = v14;
  sub_1D54FC53C();

  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v11, v7);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v13, v7);
  v16 = objc_msgSend(a1, sel_shouldUseRestrictedExtension);
  v6[*(int *)(v4 + 20)] = (char)v16;
  MEMORY[0x1E0C80A78](v16);
  v21[-4] = v1;
  v21[-3] = v6;
  v21[-2] = ObjectType;
  v18 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A65C0);
  sub_1D54FC758();

  v19 = v21[1];
  sub_1D54ECDCC((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  return v19;
}

uint64_t type metadata accessor for ThumbnailExtensionMonitor.Predicate(uint64_t a1)
{
  return sub_1D54EFA1C(a1, qword_1EFF39550);
}

uint64_t sub_1D54EC214(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  _BYTE v14[16];
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;

  ObjectType = swift_getObjectType();
  v6 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  MEMORY[0x1E0C80A78](v6);
  v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = sub_1D54FC590();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v8, a1, v9);
  v8[*(int *)(v6 + 20)] = a2;
  v10 = *(void **)(v2 + OBJC_IVAR___QLThumbnailExtensionMonitor_queue);
  v15 = v2;
  v16 = v8;
  v17 = ObjectType;
  v11 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A65C0);
  sub_1D54FC758();

  v12 = v18;
  sub_1D54ECDCC((uint64_t)v8);
  return v12;
}

void sub_1D54EC47C(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
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
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  NSObject *v49;
  os_log_type_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  id v55;
  unint64_t v56;
  unint64_t v57;
  os_log_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  os_log_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;

  v83 = a3;
  v81 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  v5 = MEMORY[0x1E0C80A78](v81);
  v82 = (uint64_t)&v73 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v79 = (uint64_t)&v73 - v7;
  v87 = sub_1D54FC5C0();
  v85 = *(_QWORD *)(v87 - 8);
  v8 = MEMORY[0x1E0C80A78](v87);
  v84 = (char *)&v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v80 = (char *)&v73 - v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A6580);
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v73 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v73 - v15;
  v17 = sub_1D54FC4D0();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  v20 = (char *)&v73 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v86 = a1;
  v21 = a1 + OBJC_IVAR___QLThumbnailExtensionMonitor_matchingExtensionsCache;
  swift_beginAccess();
  v22 = *(_QWORD *)v21;
  if (!*(_QWORD *)(*(_QWORD *)v21 + 16))
  {
    v23 = a2;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v17);
LABEL_7:
    sub_1D54F565C((uint64_t)v16, &qword_1ED9A6580);
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  v23 = a2;
  v24 = sub_1D54F03B8(a2);
  if ((v25 & 1) != 0)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v18 + 16))(v16, *(_QWORD *)(v22 + 56) + *(_QWORD *)(v18 + 72) * v24, v17);
    v26 = 0;
  }
  else
  {
    v26 = 1;
  }
  v27 = v86;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, v26, 1, v17);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
    goto LABEL_7;
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v20, v16, v17);
  v28 = v27 + OBJC_IVAR___QLThumbnailExtensionMonitor_extensionByIdentifier;
  swift_beginAccess();
  v29 = *(_QWORD *)v28;
  if (*(_QWORD *)(*(_QWORD *)v28 + 16))
  {
    swift_bridgeObjectRetain();
    v30 = sub_1D54F0288((uint64_t)v20);
    if ((v31 & 1) != 0)
    {
      v32 = *(id *)(*(_QWORD *)(v29 + 56) + 8 * v30);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
      goto LABEL_26;
    }
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  sub_1D54F08F4(v23, (uint64_t)v14);
  sub_1D54F565C((uint64_t)v14, &qword_1ED9A6580);
  swift_endAccess();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
LABEL_13:
  v33 = v23;
  v34 = (void *)sub_1D54EDE0C(v23);
  v36 = v35;
  v38 = v37;
  v39 = v87;
  if (v34)
  {
    v40 = v34;
    v78 = v35;
    v41 = qword_1ED9A65C8;
    v42 = v34;
    v43 = v85;
    if (v41 != -1)
      swift_once();
    v44 = __swift_project_value_buffer(v39, (uint64_t)qword_1ED9A6960);
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v84, v44, v39);
    v45 = v23;
    v46 = v82;
    sub_1D54F55D4(v45, v82);
    v47 = v42;
    swift_bridgeObjectRetain();
    v48 = v47;
    v49 = sub_1D54FC5A8();
    v50 = sub_1D54FC728();
    LODWORD(v80) = v50;
    if (os_log_type_enabled(v49, v50))
    {
      v51 = swift_slowAlloc();
      v79 = v33;
      v52 = v51;
      v53 = swift_slowAlloc();
      v74 = v38;
      v54 = (_QWORD *)v53;
      v75 = v53;
      v77 = swift_slowAlloc();
      v90 = v77;
      *(_DWORD *)v52 = 138412802;
      v76 = v49;
      v88 = (uint64_t)v48;
      v55 = v48;
      sub_1D54FC794();
      *v54 = v40;

      *(_WORD *)(v52 + 12) = 2080;
      v88 = sub_1D54FC50C();
      v89 = v56;
      swift_bridgeObjectRetain();
      sub_1D54FC680();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v88 = sub_1D54E9054(v88, v89, &v90);
      sub_1D54FC794();
      swift_bridgeObjectRelease();
      sub_1D54ECDCC(v46);
      *(_WORD *)(v52 + 22) = 2080;
      v57 = v74;
      swift_bridgeObjectRetain();
      v88 = sub_1D54E9054(v78, v57, &v90);
      sub_1D54FC794();
      swift_bridgeObjectRelease_n();
      v58 = v76;
      _os_log_impl(&dword_1D54AE000, v76, (os_log_type_t)v80, "Found %@ for %s, reason: %s", (uint8_t *)v52, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9A6650);
      v59 = v75;
      swift_arrayDestroy();
      MEMORY[0x1D8273904](v59, -1, -1);
      v60 = v77;
      swift_arrayDestroy();
      MEMORY[0x1D8273904](v60, -1, -1);
      v61 = v52;
      v33 = v79;
      MEMORY[0x1D8273904](v61, -1, -1);

      (*(void (**)(char *, uint64_t))(v85 + 8))(v84, v87);
    }
    else
    {

      sub_1D54ECDCC(v46);
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v43 + 8))(v84, v39);
    }
    v32 = (id)sub_1D54EEDBC(v33, v48);

  }
  else
  {
    v62 = v85;
    if (qword_1ED9A65C8 != -1)
      swift_once();
    v63 = __swift_project_value_buffer(v39, (uint64_t)qword_1ED9A6960);
    v64 = v80;
    (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v80, v63, v39);
    v65 = v79;
    sub_1D54F55D4(v33, v79);
    swift_bridgeObjectRetain();
    v66 = sub_1D54FC5A8();
    v67 = sub_1D54FC734();
    v68 = v67;
    if (os_log_type_enabled(v66, v67))
    {
      v69 = swift_slowAlloc();
      v86 = swift_slowAlloc();
      v90 = v86;
      *(_DWORD *)v69 = 136315394;
      LODWORD(v84) = v68;
      v70 = sub_1D54FC50C();
      v78 = v36;
      v82 = v69 + 4;
      v88 = v70;
      v89 = v71;
      swift_bridgeObjectRetain();
      sub_1D54FC680();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v88 = sub_1D54E9054(v88, v89, &v90);
      sub_1D54FC794();
      swift_bridgeObjectRelease();
      sub_1D54ECDCC(v65);
      *(_WORD *)(v69 + 12) = 2080;
      swift_bridgeObjectRetain();
      v88 = sub_1D54E9054(v78, v38, &v90);
      sub_1D54FC794();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1D54AE000, v66, (os_log_type_t)v84, "No extension found for %s, reason: %s", (uint8_t *)v69, 0x16u);
      v72 = v86;
      swift_arrayDestroy();
      MEMORY[0x1D8273904](v72, -1, -1);
      MEMORY[0x1D8273904](v69, -1, -1);

      (*(void (**)(char *, uint64_t))(v62 + 8))(v64, v87);
    }
    else
    {
      sub_1D54ECDCC(v65);

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v62 + 8))(v64, v39);
    }
    v32 = 0;
  }
LABEL_26:
  *v83 = v32;
}

void sub_1D54ECDB0(_QWORD *a1@<X8>)
{
  uint64_t v1;

  sub_1D54EC47C(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_1D54ECDCC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D54ECE08(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  char *v15;
  id v16;
  _QWORD v18[2];
  _QWORD aBlock[6];

  v3 = sub_1D54FC5CC();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v18[0] = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1D54FC5E4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(void **)&v1[OBJC_IVAR___QLThumbnailExtensionMonitor_queue];
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v1;
  *(_QWORD *)(v12 + 24) = a1;
  aBlock[4] = sub_1D54ED0AC;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D54EBC00;
  aBlock[3] = &block_descriptor_0;
  v13 = _Block_copy(aBlock);
  v14 = v11;
  v15 = v1;
  v16 = a1;
  sub_1D54FC5D8();
  v18[1] = MEMORY[0x1E0DEE9D8];
  sub_1D54E5278(&qword_1ED9A65D8, v4, MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A65E0);
  sub_1D54ED0CC((unint64_t *)&unk_1ED9A65E8, &qword_1ED9A65E0);
  sub_1D54FC7B8();
  MEMORY[0x1D82727A0](0, v10, v6, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v18[0] + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return swift_release();
}

uint64_t sub_1D54ED004(int a1, id a2)
{
  id v2;
  unint64_t v3;

  v2 = objc_msgSend(a2, sel_extensionIdentities);
  sub_1D54EA260(0, &qword_1ED9A6628);
  v3 = sub_1D54FC6BC();

  sub_1D54ED1D8(v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D54ED080()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1D54ED0AC()
{
  uint64_t v0;

  return sub_1D54ED004(*(_QWORD *)(v0 + 16), *(id *)(v0 + 24));
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

uint64_t sub_1D54ED0CC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1D827388C](MEMORY[0x1E0DEAF38], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1D54ED1D8(unint64_t a1)
{
  uint64_t v1;
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
  uint64_t v14;
  uint64_t v15;
  void (*v16)(_QWORD *@<X8>);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  void *v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  char **v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  void *v44;
  id v45;
  void (*v46)(char *, uint64_t *, uint64_t);
  char *v47;
  char *v48;
  uint64_t v49;
  char *v50;
  id v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  _BOOL8 v55;
  uint64_t v56;
  char v57;
  unint64_t v58;
  char v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  void *v71;
  void (*v72)(uint64_t, uint64_t);
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char v88;
  char v89;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v91;
  uint64_t result;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  char *v99;
  char *v100;
  void (*v101)(_QWORD *@<X8>);
  uint64_t v102;
  unint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  char *v108;
  uint64_t *v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  void (*v115)(_QWORD *@<X8>);
  uint64_t v116;
  id v117;
  _QWORD *v118;
  uint64_t v119;
  uint64_t v120;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A6580);
  MEMORY[0x1E0C80A78](v4);
  v100 = (char *)&v93 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A65A0);
  MEMORY[0x1E0C80A78](v6);
  v108 = (char *)&v93 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1D54FC590();
  v109 = *(uint64_t **)(v8 - 8);
  v9 = MEMORY[0x1E0C80A78](v8);
  v116 = (uint64_t)&v93 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v9);
  v107 = (char *)&v93 - v12;
  MEMORY[0x1E0C80A78](v11);
  v113 = (char *)&v93 - v13;
  v112 = sub_1D54FC4D0();
  v114 = *(_QWORD *)(v112 - 8);
  v14 = MEMORY[0x1E0C80A78](v112);
  v16 = (void (*)(_QWORD *@<X8>))((char *)&v93 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = MEMORY[0x1E0C80A78](v14);
  v99 = (char *)&v93 - v18;
  MEMORY[0x1E0C80A78](v17);
  v111 = (uint64_t)&v93 - v19;
  v20 = sub_1D54FC5F0();
  v21 = *(uint64_t **)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  v23 = (uint64_t *)((char *)&v93 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  v24 = *(void **)(v2 + OBJC_IVAR___QLThumbnailExtensionMonitor_queue);
  *v23 = v24;
  ((void (*)(_QWORD *, _QWORD, uint64_t))v21[13])(v23, *MEMORY[0x1E0DEF740], v20);
  v25 = v24;
  v26 = sub_1D54FC5FC();
  ((void (*)(_QWORD *, uint64_t))v21[1])(v23, v20);
  if ((v26 & 1) == 0)
    goto LABEL_83;
  v120 = MEMORY[0x1E0DEE9E8];
  v26 = v2 + OBJC_IVAR___QLThumbnailExtensionMonitor_identitiesByType;
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)v26 + 16))
  {
    swift_isUniquelyReferenced_nonNull_native();
    v119 = *(_QWORD *)v26;
    *(_QWORD *)v26 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9A6680);
    sub_1D54FC878();
    *(_QWORD *)v26 = v119;
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  v21 = (uint64_t *)v108;
  if (a1 >> 62)
    goto LABEL_84;
  v27 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
LABEL_6:
  v115 = v16;
  if (!v27)
  {
    v101 = 0;
LABEL_38:
    swift_bridgeObjectRelease();
    v21 = (uint64_t *)(v2 + OBJC_IVAR___QLThumbnailExtensionMonitor_extensionByIdentifier);
    swift_beginAccess();
    v63 = (char *)*v21;
    v64 = *(_QWORD *)(*v21 + 64);
    v108 = (char *)(*v21 + 64);
    v65 = 1 << v63[32];
    if (v65 < 64)
      v66 = ~(-1 << v65);
    else
      v66 = -1;
    v67 = v66 & v64;
    v110 = (id)((unint64_t)(v65 + 63) >> 6);
    v113 = v63;
    swift_bridgeObjectRetain();
    v68 = 0;
    v69 = v100;
    v8 = v112;
    v109 = v21;
    while (1)
    {
      v26 = v114;
      if (v67)
      {
        v73 = __clz(__rbit64(v67));
        v74 = (v67 - 1) & v67;
        v75 = v73 | (v68 << 6);
      }
      else
      {
        v76 = v68 + 1;
        if (__OFADD__(v68, 1))
          goto LABEL_81;
        if (v76 >= (uint64_t)v110)
        {
LABEL_76:
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v114 + 56))(v69, 1, 1, v8);
LABEL_77:
          swift_release();
          swift_bridgeObjectRelease();
          return sub_1D54F56E4((uint64_t)v101);
        }
        v77 = *(_QWORD *)&v108[8 * v76];
        ++v68;
        if (!v77)
        {
          v68 = v76 + 1;
          if (v76 + 1 >= (uint64_t)v110)
            goto LABEL_76;
          v77 = *(_QWORD *)&v108[8 * v68];
          if (!v77)
          {
            v68 = v76 + 2;
            if (v76 + 2 >= (uint64_t)v110)
              goto LABEL_76;
            v77 = *(_QWORD *)&v108[8 * v68];
            if (!v77)
            {
              v68 = v76 + 3;
              if (v76 + 3 >= (uint64_t)v110)
                goto LABEL_76;
              v77 = *(_QWORD *)&v108[8 * v68];
              if (!v77)
              {
                v68 = v76 + 4;
                if (v76 + 4 >= (uint64_t)v110)
                  goto LABEL_76;
                v77 = *(_QWORD *)&v108[8 * v68];
                if (!v77)
                {
                  v78 = v76 + 5;
                  if (v78 >= (uint64_t)v110)
                    goto LABEL_76;
                  v77 = *(_QWORD *)&v108[8 * v78];
                  if (!v77)
                  {
                    while (1)
                    {
                      v68 = v78 + 1;
                      if (__OFADD__(v78, 1))
                        break;
                      if (v68 >= (uint64_t)v110)
                        goto LABEL_76;
                      v77 = *(_QWORD *)&v108[8 * v68];
                      ++v78;
                      if (v77)
                        goto LABEL_64;
                    }
                    __break(1u);
                    goto LABEL_86;
                  }
                  v68 = v78;
                }
              }
            }
          }
        }
LABEL_64:
        v74 = (v77 - 1) & v77;
        v75 = __clz(__rbit64(v77)) + (v68 << 6);
      }
      v79 = *(_QWORD *)(v114 + 72);
      a1 = *(_QWORD *)(v114 + 16);
      ((void (*)(char *, unint64_t, uint64_t))a1)(v69, *((_QWORD *)v113 + 6) + v79 * v75, v8);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v69, 0, 1, v8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v69, 1, v8) == 1)
        goto LABEL_77;
      v116 = v74;
      v117 = (id)v68;
      (*(void (**)(void (*)(_QWORD *@<X8>), char *, uint64_t))(v26 + 32))(v16, v69, v8);
      v2 = (uint64_t)v16;
      v80 = v120;
      if (!*(_QWORD *)(v120 + 16))
        goto LABEL_72;
      sub_1D54E5278((unint64_t *)&unk_1ED9A6560, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
      swift_bridgeObjectRetain();
      v81 = sub_1D54FC620();
      v82 = -1 << *(_BYTE *)(v80 + 32);
      v83 = v81 & ~v82;
      if (((*(_QWORD *)(v80 + 56 + ((v83 >> 3) & 0xFFFFFFFFFFFFF8)) >> v83) & 1) == 0)
        break;
      v84 = ~v82;
      while (1)
      {
        v86 = v111;
        v85 = v112;
        ((void (*)(uint64_t, unint64_t, uint64_t))a1)(v111, *(_QWORD *)(v80 + 48) + v83 * v79, v112);
        sub_1D54E5278((unint64_t *)&unk_1ED9A6570, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09D0]);
        v2 = sub_1D54FC638();
        v72 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
        v72(v86, v85);
        if ((v2 & 1) != 0)
          break;
        v83 = (v83 + 1) & v84;
        v26 = v114;
        if (((*(_QWORD *)(v80 + 56 + ((v83 >> 3) & 0xFFFFFFFFFFFFF8)) >> v83) & 1) == 0)
          goto LABEL_71;
      }
      swift_bridgeObjectRelease();
      v69 = v100;
      v8 = v112;
      v21 = v109;
LABEL_44:
      v16 = v115;
      v72((uint64_t)v115, v8);
      v67 = v116;
      v68 = (uint64_t)v117;
    }
LABEL_71:
    swift_bridgeObjectRelease();
    v69 = v100;
    v8 = v112;
    v2 = (uint64_t)v115;
    v21 = v109;
LABEL_72:
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v87 = sub_1D54F0288(v2);
    v89 = v88;
    swift_bridgeObjectRelease();
    if ((v89 & 1) != 0)
    {
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v91 = *v21;
      v118 = (_QWORD *)*v21;
      *v21 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_1D54F25B0();
        v91 = (uint64_t)v118;
      }
      (*(void (**)(unint64_t, uint64_t))(v26 + 8))(*(_QWORD *)(v91 + 48) + v87 * v79, v8);
      v70 = (uint64_t)v118;
      v71 = *(void **)(v118[7] + 8 * v87);
      sub_1D54F18AC(v87, (uint64_t)v118);
      *v21 = v70;

      swift_bridgeObjectRelease();
    }
    swift_endAccess();
    v72 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    goto LABEL_44;
  }
  v101 = 0;
  v28 = 0;
  v103 = a1 & 0xC000000000000001;
  v95 = a1 & 0xFFFFFFFFFFFFFF8;
  v94 = a1 + 32;
  v102 = 0x80000001D5506860;
  v98 = v2;
  v97 = a1;
  v106 = v26;
  v96 = v27;
  while (1)
  {
LABEL_9:
    if (v103)
    {
      v29 = (id)MEMORY[0x1D8272854](v28, a1);
    }
    else
    {
      if (v28 >= *(_QWORD *)(v95 + 16))
        goto LABEL_82;
      v29 = *(id *)(v94 + 8 * v28);
    }
    v30 = v29;
    v31 = __OFADD__(v28++, 1);
    if (v31)
      goto LABEL_80;
    v32 = sub_1D54EA3FC(0xD000000000000017, v102);
    if (v32)
      break;

    if (v28 == v27)
      goto LABEL_38;
  }
  v33 = v32;
  v104 = v28;
  v34 = objc_msgSend(v30, sel_uniqueIdentifier);
  v26 = (uint64_t)v99;
  sub_1D54FC4C4();

  v105 = v33;
  v35 = v111;
  sub_1D54F2E64(v111, (char *)v26);
  v36 = v105;
  (*(void (**)(uint64_t, uint64_t))(v114 + 8))(v35, v112);
  v37 = v30;
  v38 = *(_QWORD *)(v36 + 16);
  if (!v38)
  {

    swift_bridgeObjectRelease();
    v16 = v115;
    goto LABEL_35;
  }
  v110 = v37;
  v117 = (id)objc_opt_self();
  v39 = v36 + 40;
  v16 = v101;
  v2 = (uint64_t)v109;
  v40 = &selRef_status;
  while (1)
  {
    swift_bridgeObjectRetain();
    v44 = (void *)sub_1D54FC644();
    swift_bridgeObjectRelease();
    v45 = objc_msgSend(v117, v40[294], v44, 1);

    if (!v45)
      goto LABEL_21;
    (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v2 + 56))(v21, 1, 1, v8);
    sub_1D54E5278(&qword_1ED9A6598, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0340], MEMORY[0x1E0DF0370]);
    sub_1D54FC8E4();

    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v2 + 48))(v21, 1, v8) == 1)
      goto LABEL_21;
    v46 = *(void (**)(char *, uint64_t *, uint64_t))(v2 + 32);
    v47 = v107;
    v46(v107, v21, v8);
    v48 = v113;
    v46(v113, (uint64_t *)v47, v8);
    v21 = *(uint64_t **)(v2 + 16);
    v49 = v116;
    v50 = v48;
    v26 = v106;
    ((void (*)(uint64_t, char *, uint64_t))v21)(v116, v50, v8);
    swift_beginAccess();
    v51 = v110;
    sub_1D54F56E4((uint64_t)v16);
    v2 = swift_isUniquelyReferenced_nonNull_native();
    v119 = *(_QWORD *)v26;
    v52 = v119;
    *(_QWORD *)v26 = 0x8000000000000000;
    a1 = sub_1D54F0320(v49);
    v54 = *(_QWORD *)(v52 + 16);
    v55 = (v53 & 1) == 0;
    v56 = v54 + v55;
    if (__OFADD__(v54, v55))
    {
      __break(1u);
LABEL_79:
      __break(1u);
LABEL_80:
      __break(1u);
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
LABEL_84:
      swift_bridgeObjectRetain();
      v27 = sub_1D54FC890();
      goto LABEL_6;
    }
    v57 = v53;
    if (*(_QWORD *)(v52 + 24) < v56)
      break;
    if ((v2 & 1) == 0)
    {
      sub_1D54F27D8();
      v52 = v119;
    }
LABEL_30:
    v2 = (uint64_t)v109;
    *(_QWORD *)v26 = v52;
    swift_bridgeObjectRelease();
    v60 = *(_QWORD **)v26;
    if ((v57 & 1) != 0)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      v60[(a1 >> 6) + 8] |= 1 << a1;
      v16 = (void (*)(_QWORD *@<X8>))(v60[6] + *(_QWORD *)(v2 + 72) * a1);
      swift_bridgeObjectRetain();
      ((void (*)(void (*)(_QWORD *@<X8>), uint64_t, uint64_t))v21)(v16, v116, v8);
      *(_QWORD *)(v60[7] + 8 * a1) = MEMORY[0x1E0DEE9D8];
      v61 = v60[2];
      v31 = __OFADD__(v61, 1);
      v62 = v61 + 1;
      if (v31)
        goto LABEL_79;
      v60[2] = v62;
    }
    v41 = v60[7];
    v42 = swift_bridgeObjectRelease();
    MEMORY[0x1D82726E0](v42);
    if (*(_QWORD *)((*(_QWORD *)(v41 + 8 * a1) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v41 + 8 * a1) & 0xFFFFFFFFFFFFFF8)
                                                                                            + 0x18) >> 1)
      sub_1D54FC6D4();
    sub_1D54FC6EC();
    sub_1D54FC6C8();
    v43 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
    v43(v116, v8);
    swift_endAccess();
    v43((uint64_t)v113, v8);
    v16 = sub_1D54EDDFC;
    v21 = (uint64_t *)v108;
    v40 = &selRef_status;
LABEL_21:
    v39 += 16;
    if (!--v38)
    {
      v101 = v16;

      swift_bridgeObjectRelease();
      v16 = v115;
      v2 = v98;
      a1 = v97;
      v27 = v96;
LABEL_35:
      v28 = v104;
      if (v104 == v27)
        goto LABEL_38;
      goto LABEL_9;
    }
  }
  sub_1D54F10F4(v56, v2);
  v52 = v119;
  v58 = sub_1D54F0320(v116);
  if ((v57 & 1) == (v59 & 1))
  {
    a1 = v58;
    goto LABEL_30;
  }
LABEL_86:
  result = sub_1D54FC920();
  __break(1u);
  return result;
}

void sub_1D54EDDFC(_QWORD *a1@<X8>)
{
  *a1 = MEMORY[0x1E0DEE9D8];
}

uint64_t sub_1D54EDE0C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
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
  _QWORD *v14;
  void *v15;
  id v16;
  uint64_t result;
  void (*v18)(char *, uint64_t, uint64_t);
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  unsigned int v31;
  unint64_t v32;
  void *v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  unsigned int v38;
  uint64_t v39;
  void *v40;
  void *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v2 = v1;
  v4 = sub_1D54FC590();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v42 - v9;
  v11 = sub_1D54FC5F0();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char **)((char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = *(void **)(v2 + OBJC_IVAR___QLThumbnailExtensionMonitor_queue);
  *v14 = v15;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E0DEF740], v11);
  v16 = v15;
  LOBYTE(v15) = sub_1D54FC5FC();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v12 + 8))(v14, v11);
  if ((v15 & 1) != 0)
  {
    v18 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v18(v10, a1, v4);
    v19 = (uint64_t *)(v2 + OBJC_IVAR___QLThumbnailExtensionMonitor_identitiesByType);
    swift_beginAccess();
    v20 = *v19;
    v21 = *(_QWORD *)(v20 + 16);
    v42 = v8;
    if (v21)
    {
      swift_bridgeObjectRetain();
      v22 = sub_1D54F0320((uint64_t)v10);
      if ((v23 & 1) != 0)
      {
        v24 = *(_QWORD *)(*(_QWORD *)(v20 + 56) + 8 * v22);
        swift_bridgeObjectRetain();
      }
      else
      {
        v24 = 0;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      v24 = 0;
    }
    v25 = swift_allocObject();
    *(_QWORD *)(v25 + 16) = 1;
    v45 = swift_allocObject();
    *(_QWORD *)(v45 + 16) = 1;
    v44 = swift_allocObject();
    *(_QWORD *)(v44 + 16) = 1;
    if (*(_BYTE *)(a1 + *(int *)(type metadata accessor for ThumbnailExtensionMonitor.Predicate(0) + 20)) == 1 && v24)
    {
      v26 = swift_bridgeObjectRetain();
      v27 = sub_1D54EE520(v26);
      swift_bridgeObjectRelease();
      if (v27)
      {
        swift_bridgeObjectRelease();
LABEL_22:
        (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
        swift_release();
        swift_release();
        swift_release();
        return (uint64_t)v27;
      }
      v43 = v4;
      v28 = v5;
    }
    else
    {
      v43 = v4;
      v28 = v5;
    }
    v29 = (void *)objc_opt_self();
    v30 = (void *)sub_1D54FC524();
    v31 = objc_msgSend(v29, sel_contentTypeIsIWorkType_, v30);

    if (v31 && v24 && (v32 = swift_bridgeObjectRetain(), v27 = sub_1D54EE6CC(v32), swift_bridgeObjectRelease(), v27))
    {
      swift_bridgeObjectRelease();
      v5 = v28;
      v4 = v43;
    }
    else
    {
      v33 = (void *)sub_1D54FC524();
      v34 = objc_msgSend(v29, sel_contentTypeIsInternallyClaimed_, v33);

      if (v34)
      {
        v27 = sub_1D54EE884(v25, v24, (void (*)(char *__return_ptr, id *))sub_1D54EE388);
        swift_bridgeObjectRelease();
        v36 = (uint64_t)v42;
        v35 = v43;
        v18(v42, (uint64_t)v10, v43);
        v5 = v28;
        if (!v27)
          v27 = sub_1D54EE9BC(v44, v2, v36);
        (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v36, v35);
        v4 = v35;
      }
      else
      {
        v37 = (void *)sub_1D54FC524();
        v38 = objc_msgSend(v29, sel_externalGeneratorPreferredForType_, v37);

        v5 = v28;
        v39 = v45;
        if (v38 && (v40 = sub_1D54EE884(v45, v24, (void (*)(char *__return_ptr, id *))sub_1D54EE930)) != 0)
        {
          v27 = v40;
          swift_bridgeObjectRelease();
          v4 = v43;
        }
        else
        {
          v41 = sub_1D54EE884(v25, v24, (void (*)(char *__return_ptr, id *))sub_1D54EE388);
          v4 = v43;
          if (v41)
          {
            v27 = v41;
            swift_bridgeObjectRelease();
          }
          else
          {
            v27 = sub_1D54EE884(v39, v24, (void (*)(char *__return_ptr, id *))sub_1D54EE930);
            swift_bridgeObjectRelease();
            if (!v27)
              v27 = sub_1D54EE9BC(v44, v2, (uint64_t)v10);
          }
        }
      }
    }
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

uint64_t sub_1D54EE388@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  uint64_t result;

  v3 = objc_msgSend(*a1, sel_bundleIdentifier);
  sub_1D54FC668();

  LOBYTE(v3) = sub_1D54EAB68();
  result = swift_bridgeObjectRelease();
  *a2 = v3 & 1;
  return result;
}

void *sub_1D54EE410(unint64_t a1, void (*a2)(char *__return_ptr, id *))
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v10;
  id v11;

  if (a1 >> 62)
    goto LABEL_14;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; v4 = sub_1D54FC890())
  {
    v5 = 4;
    while (1)
    {
      v6 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1D8272854](v5 - 4, a1) : *(id *)(a1 + 8 * v5);
      v7 = v6;
      v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      v11 = v6;
      a2(&v10, &v11);
      if (v10 == 1)
      {
        swift_bridgeObjectRelease();
        return v7;
      }

      ++v5;
      if (v8 == v4)
        goto LABEL_10;
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
  }
LABEL_10:
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_1D54EE520(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;

  if (a1 >> 62)
    goto LABEL_18;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; v2 = sub_1D54FC890())
  {
    v3 = 4;
    while (1)
    {
      v4 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1D8272854](v3 - 4, a1) : *(id *)(a1 + 8 * v3);
      v5 = v4;
      v6 = v3 - 3;
      if (__OFADD__(v3 - 4, 1))
        break;
      v7 = objc_msgSend(v4, sel_extensionPointIdentifier);
      v8 = sub_1D54FC668();
      v10 = v9;

      if (v8 == sub_1D54FC668() && v10 == v11)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_16:
        swift_bridgeObjectRelease();
        return v5;
      }
      v13 = sub_1D54FC908();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v13 & 1) != 0)
        goto LABEL_16;

      ++v3;
      if (v6 == v2)
        goto LABEL_19;
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
  }
LABEL_19:
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_1D54EE6CC(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  char v11;
  unint64_t v13;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_15;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; v2 = sub_1D54FC890())
  {
    v3 = v1 & 0xC000000000000001;
    v4 = 4;
    v13 = v1;
    while (1)
    {
      v5 = v3 ? (id)MEMORY[0x1D8272854](v4 - 4, v1) : *(id *)(v1 + 8 * v4);
      v6 = v5;
      v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
        break;
      v8 = objc_msgSend(v5, sel_containingBundleRecord);
      if (v8)
      {
        v9 = v8;
        v10 = objc_msgSend(v8, sel_bundleIdentifier);

        if (v10)
        {
          sub_1D54FC668();

          v11 = sub_1D54EAB68();
          v1 = v13;
          swift_bridgeObjectRelease();
          if ((v11 & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return v6;
          }
        }
      }

      ++v4;
      if (v7 == v2)
        goto LABEL_16;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
LABEL_16:
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_1D54EE884(uint64_t a1, uint64_t a2, void (*a3)(char *__return_ptr, id *))
{
  void *v3;
  void **v4;
  void *v5;
  unint64_t v7;
  void *v8;
  id v9;

  v4 = (void **)(a1 + 16);
  v3 = *(void **)(a1 + 16);
  v5 = v3;
  if (v3 == (void *)1)
  {
    if (a2)
    {
      v7 = swift_bridgeObjectRetain();
      v5 = sub_1D54EE410(v7, a3);
      swift_bridgeObjectRelease();
    }
    else
    {
      v5 = 0;
    }
    swift_beginAccess();
    v8 = *v4;
    *v4 = v5;
    v9 = v5;
    sub_1D54F56C4(v8);
  }
  sub_1D54F56D4(v3);
  return v5;
}

uint64_t sub_1D54EE930@<X0>(id *a1@<X0>, BOOL *a2@<X8>)
{
  id v3;
  uint64_t result;

  v3 = objc_msgSend(*a1, sel_bundleIdentifier);
  sub_1D54FC668();

  LOBYTE(v3) = sub_1D54EAB68();
  result = swift_bridgeObjectRelease();
  *a2 = (v3 & 1) == 0;
  return result;
}

void *sub_1D54EE9BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void **v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void **)(a1 + 16);
  v3 = *(void **)(a1 + 16);
  v5 = v3;
  if (v3 == (void *)1)
  {
    v5 = (void *)sub_1D54EEA3C(a2, a3);
    swift_beginAccess();
    v6 = *v4;
    *v4 = v5;
    v7 = v5;
    sub_1D54F56C4(v6);
  }
  sub_1D54F56D4(v3);
  return v5;
}

uint64_t sub_1D54EEA3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  unint64_t v15;
  void (*v16)(char *, uint64_t);
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  char v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t result;
  uint64_t v34;
  _QWORD *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char *v42;
  _QWORD *v43;

  v4 = sub_1D54FC590();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v34 - v9;
  v11 = (uint64_t *)(a1 + OBJC_IVAR___QLThumbnailExtensionMonitor_identitiesByType);
  swift_beginAccess();
  v40 = v11;
  v12 = *v11;
  swift_bridgeObjectRetain_n();
  v13 = (_QWORD *)sub_1D54F3BFC(v12);
  swift_bridgeObjectRelease();
  v43 = v13;
  sub_1D54F3B7C(&v43);
  swift_bridgeObjectRelease();
  v14 = v43;
  v41 = v43[2];
  if (!v41)
  {
LABEL_25:
    swift_release();
    return 0;
  }
  v15 = 0;
  v42 = (char *)v43 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  v38 = v5;
  v39 = v4;
  v34 = a2;
  v35 = v43;
  v36 = v10;
  v37 = v8;
  while (1)
  {
    if (v15 >= v14[2])
      goto LABEL_28;
    v17 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v17(v10, &v42[*(_QWORD *)(v5 + 72) * v15], v4);
    if ((sub_1D54FC578() & 1) != 0)
      break;
    v16 = *(void (**)(char *, uint64_t))(v5 + 8);
LABEL_4:
    ++v15;
    v16(v10, v4);
    if (v15 == v41)
      goto LABEL_25;
  }
  v17(v8, v10, v4);
  v18 = *v40;
  v19 = *(_QWORD *)(*v40 + 16);
  swift_bridgeObjectRetain();
  if (v19)
  {
    v20 = sub_1D54F0320((uint64_t)v8);
    v21 = MEMORY[0x1E0DEE9D8];
    if ((v22 & 1) != 0)
    {
      v21 = *(_QWORD *)(*(_QWORD *)(v18 + 56) + 8 * v20);
      swift_bridgeObjectRetain();
    }
  }
  else
  {
    v21 = MEMORY[0x1E0DEE9D8];
  }
  swift_bridgeObjectRelease();
  if (!(v21 >> 62))
  {
    v23 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v23)
      goto LABEL_13;
    goto LABEL_21;
  }
  swift_bridgeObjectRetain_n();
  v23 = sub_1D54FC890();
  swift_bridgeObjectRelease();
  if (!v23)
  {
LABEL_21:
    swift_bridgeObjectRelease_n();
    v8 = v37;
    v5 = v38;
    v16 = *(void (**)(char *, uint64_t))(v38 + 8);
    v4 = v39;
    v16(v37, v39);
    v14 = v35;
    v10 = v36;
    goto LABEL_4;
  }
LABEL_13:
  v24 = 4;
  while (1)
  {
    v25 = v24 - 4;
    if ((v21 & 0xC000000000000001) == 0)
      break;
    v26 = (id)MEMORY[0x1D8272854](v24 - 4, v21);
    v27 = v24 - 3;
    if (__OFADD__(v25, 1))
      goto LABEL_27;
LABEL_19:
    v28 = v26;
    v29 = objc_msgSend(v28, sel_bundleIdentifier);
    sub_1D54FC668();

    v30 = sub_1D54EAB68();
    swift_bridgeObjectRelease();
    if ((v30 & 1) != 0)
    {
      swift_bridgeObjectRelease_n();
      v31 = *(void (**)(char *, uint64_t))(v38 + 8);
      v32 = v39;
      v31(v37, v39);
      v31(v36, v32);
      swift_release();
      return (uint64_t)v28;
    }

    ++v24;
    if (v27 == v23)
      goto LABEL_21;
  }
  v26 = *(id *)(v21 + 8 * v24);
  v27 = v24 - 3;
  if (!__OFADD__(v25, 1))
    goto LABEL_19;
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
  result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_1D54EEDBC(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  id v21;
  uint64_t result;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  id v29;
  uint64_t v30;
  char **v31;
  void (*v32)(char *, uint64_t);
  id v33;
  id v34;
  id v35;
  id v36;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v3 = v2;
  v44 = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A6580);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  MEMORY[0x1E0C80A78](v8);
  v45 = (uint64_t)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1D54FC4D0();
  v43 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v41 - v14;
  v16 = sub_1D54FC5F0();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v19 = (uint64_t *)((char *)&v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v20 = *(void **)(v3 + OBJC_IVAR___QLThumbnailExtensionMonitor_queue);
  *v19 = v20;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v17 + 104))(v19, *MEMORY[0x1E0DEF740], v16);
  v21 = v20;
  LOBYTE(v20) = sub_1D54FC5FC();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v17 + 8))(v19, v16);
  if ((v20 & 1) != 0)
  {
    v23 = objc_msgSend(a2, sel_uniqueIdentifier);
    sub_1D54FC4C4();

    v24 = (uint64_t *)(v3 + OBJC_IVAR___QLThumbnailExtensionMonitor_extensionByIdentifier);
    swift_beginAccess();
    v25 = *v24;
    v26 = *(_QWORD *)(*v24 + 16);
    v42 = v7;
    if (v26)
    {
      swift_bridgeObjectRetain();
      v27 = sub_1D54F0288((uint64_t)v15);
      if ((v28 & 1) != 0)
      {
        v29 = *(id *)(*(_QWORD *)(v25 + 56) + 8 * v27);
        swift_bridgeObjectRelease();
        v30 = v43;
        (*(void (**)(char *, uint64_t))(v43 + 8))(v15, v10);
        v31 = &selRef_status;
LABEL_7:
        v38 = v45;
        sub_1D54F55D4(v44, v45);
        v39 = objc_msgSend(a2, v31[283]);
        v40 = (uint64_t)v42;
        sub_1D54FC4C4();

        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v30 + 56))(v40, 0, 1, v10);
        swift_beginAccess();
        sub_1D54EACCC(v40, v38);
        swift_endAccess();
        return (uint64_t)v29;
      }
      swift_bridgeObjectRelease();
    }
    v30 = v43;
    v32 = *(void (**)(char *, uint64_t))(v43 + 8);
    v32(v15, v10);
    v33 = objc_allocWithZone((Class)type metadata accessor for ThumbnailExtension(0));
    v34 = a2;
    v35 = sub_1D54F52DC(v34);

    v31 = &selRef_status;
    v36 = objc_msgSend(v34, sel_uniqueIdentifier);
    sub_1D54FC4C4();

    swift_beginAccess();
    v29 = v35;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v46 = *v24;
    *v24 = 0x8000000000000000;
    sub_1D54F20E4((uint64_t)v29, (uint64_t)v13, isUniquelyReferenced_nonNull_native);
    *v24 = v46;
    swift_bridgeObjectRelease();
    v32(v13, v10);
    swift_endAccess();
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

id ThumbnailExtensionMonitor.__deallocating_deinit(uint64_t a1)
{
  return sub_1D54EF9D8(a1, type metadata accessor for ThumbnailExtensionMonitor);
}

uint64_t sub_1D54EF1C8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A65A0);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1D54FC590();
  __swift_allocate_value_buffer(v3, qword_1EFF3A250);
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_1EFF3A250);
  sub_1D54FC59C();
  v5 = *(_QWORD *)(v3 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1, v3);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(v4, v2, v3);
  __break(1u);
  return result;
}

uint64_t sub_1D54EF2A8(char a1)
{
  return qword_1D55012C0[a1];
}

uint64_t sub_1D54EF2C8(char *a1, char *a2)
{
  return sub_1D54EF2D4(*a1, *a2);
}

uint64_t sub_1D54EF2D4(char a1, char a2)
{
  char v3;

  if (qword_1D55012C0[a1] == qword_1D55012C0[a2] && qword_1D55012D8[a1] == qword_1D55012D8[a2])
    v3 = 1;
  else
    v3 = sub_1D54FC908();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_1D54EF358()
{
  return sub_1D54EF360();
}

uint64_t sub_1D54EF360()
{
  sub_1D54FC95C();
  sub_1D54FC674();
  swift_bridgeObjectRelease();
  return sub_1D54FC980();
}

uint64_t sub_1D54EF3C8()
{
  return sub_1D54EF3D0();
}

uint64_t sub_1D54EF3D0()
{
  sub_1D54FC674();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D54EF410()
{
  return sub_1D54EF418();
}

uint64_t sub_1D54EF418()
{
  sub_1D54FC95C();
  sub_1D54FC674();
  swift_bridgeObjectRelease();
  return sub_1D54FC980();
}

uint64_t sub_1D54EF47C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1D54F5294();
  *a1 = result;
  return result;
}

uint64_t sub_1D54EF4A8@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_1D54EF2A8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t ThumbnailExtension.supportsInteractiveThumbnailBadges.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___QLThumbnailExtension_supportsInteractiveThumbnailBadges);
}

uint64_t ThumbnailExtension.generatorIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___QLThumbnailExtension_generatorIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_1D54EF540()
{
  void *v0;

  swift_bridgeObjectRetain();
  v0 = (void *)sub_1D54FC644();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ThumbnailExtension.generatorVersion.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___QLThumbnailExtension_generatorVersion);
  swift_bridgeObjectRetain();
  return v1;
}

double ThumbnailExtension.minimumThumbnailDimension.getter()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR___QLThumbnailExtension_minimumThumbnailDimension);
}

uint64_t sub_1D54EF61C()
{
  return sub_1D54FC4DC();
}

uint64_t sub_1D54EF664()
{
  uint64_t v0;

  return (6u >> (*(_BYTE *)(v0 + OBJC_IVAR___QLThumbnailExtension_supportedConcurrencyLevel) & 7)) & 1;
}

uint64_t sub_1D54EF6D8()
{
  void *v0;
  id v1;

  v1 = objc_msgSend(v0, sel_description);
  sub_1D54FC668();

  sub_1D54FC680();
  swift_bridgeObjectRelease();
  sub_1D54FC680();
  swift_bridgeObjectRetain();
  sub_1D54FC680();
  swift_bridgeObjectRelease();
  sub_1D54FC680();
  sub_1D54FC4F4();
  sub_1D54FC86C();
  return 0;
}

uint64_t sub_1D54EF7DC()
{
  return sub_1D54FC4E8();
}

id sub_1D54EF804@<X0>(void **a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  void *v4;
  id v7;
  void *v8;
  id v9;

  v4 = *a1;
  if (*a1)
  {
    *a3 = v4;
  }
  else
  {
    v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3828]), sel_init);
    sub_1D54FC800();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1D54FC680();
    swift_bridgeObjectRelease();
    v8 = (void *)sub_1D54FC644();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_setName_, v8, 0xD000000000000015, 0x80000001D55068C0);

    objc_msgSend(v7, sel_setMaxConcurrentOperationCount_, qword_1D55012F0[*(char *)(a2 + OBJC_IVAR___QLThumbnailExtension_supportedConcurrencyLevel)]);
    *a1 = v7;
    *a3 = v7;
    v9 = v7;
    v4 = 0;
  }
  return v4;
}

id ThumbnailExtension.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ThumbnailExtension.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ThumbnailExtension.__deallocating_deinit()
{
  return sub_1D54EF9D8(0, (uint64_t (*)(void))type metadata accessor for ThumbnailExtension);
}

id sub_1D54EF9D8(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t type metadata accessor for ThumbnailExtension(uint64_t a1)
{
  return sub_1D54EFA1C(a1, qword_1ED9A65A8);
}

uint64_t sub_1D54EFA1C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1D54EFA50()
{
  return sub_1D54E5278((unint64_t *)&unk_1ED9A6560, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
}

uint64_t sub_1D54EFAF4()
{
  return sub_1D54FC4E8();
}

uint64_t method lookup function for ThumbnailExtensionMonitor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ThumbnailExtensionMonitor.canGenerateThumbnail(with:at:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of ThumbnailExtensionMonitor.bestExtension(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of ThumbnailExtensionMonitor.bestExtension(for:shouldUseRestrictedExtension:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of ThumbnailExtensionMonitor.queryControllerDidUpdate(_:resultDifference:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
}

uint64_t sub_1D54EFB9C()
{
  return type metadata accessor for ThumbnailExtension(0);
}

uint64_t sub_1D54EFBA4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1D54FC4F4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for ThumbnailExtension()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ThumbnailExtension.exIdentity.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ThumbnailExtension.supportsConcurrentRequests.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of ThumbnailExtension.id.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t storeEnumTagSinglePayload for ThumbnailExtension.ConcurrencyLevel(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_1D54EFCF8 + 4 * byte_1D5501065[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1D54EFD2C + 4 * byte_1D5501060[v4]))();
}

uint64_t sub_1D54EFD2C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D54EFD34(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D54EFD3CLL);
  return result;
}

uint64_t sub_1D54EFD48(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D54EFD50);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1D54EFD54(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D54EFD5C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ThumbnailExtension.ConcurrencyLevel()
{
  return &type metadata for ThumbnailExtension.ConcurrencyLevel;
}

_QWORD *sub_1D54EFD78(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1D54FC590();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_1D54EFE00(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1D54FC590();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_1D54EFE34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1D54FC590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_1D54EFE90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1D54FC590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_1D54EFEEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1D54FC590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_1D54EFF48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1D54FC590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_1D54EFFA4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1D54EFFB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = sub_1D54FC590();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 2)
    return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t sub_1D54F003C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1D54F0048(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1D54FC590();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  return result;
}

uint64_t sub_1D54F00C0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1D54FC590();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1D54F0130()
{
  return sub_1D54E5278(&qword_1EFF39588, type metadata accessor for ThumbnailExtensionMonitor.Predicate, (uint64_t)&unk_1D550118C);
}

unint64_t sub_1D54F0160()
{
  unint64_t result;

  result = qword_1EFF39590;
  if (!qword_1EFF39590)
  {
    result = MEMORY[0x1D827388C](&unk_1D5501294, &type metadata for ThumbnailExtension.ConcurrencyLevel);
    atomic_store(result, (unint64_t *)&qword_1EFF39590);
  }
  return result;
}

unint64_t sub_1D54F01A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D54FC95C();
  sub_1D54FC674();
  v4 = sub_1D54FC980();
  return sub_1D54F0458(a1, a2, v4);
}

unint64_t sub_1D54F0208(uint64_t a1)
{
  uint64_t v2;

  sub_1D54FC668();
  sub_1D54FC95C();
  sub_1D54FC674();
  v2 = sub_1D54FC980();
  swift_bridgeObjectRelease();
  return sub_1D54F0538(a1, v2);
}

unint64_t sub_1D54F0288(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  sub_1D54FC4D0();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998];
  sub_1D54E5278((unint64_t *)&unk_1ED9A6560, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
  v3 = sub_1D54FC620();
  return sub_1D54F06AC(a1, v3, v2, (unint64_t *)&unk_1ED9A6570, MEMORY[0x1E0CB09D0]);
}

unint64_t sub_1D54F0320(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  sub_1D54FC590();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0340];
  sub_1D54E5278(&qword_1ED9A6588, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0340], MEMORY[0x1E0DF0358]);
  v3 = sub_1D54FC620();
  return sub_1D54F06AC(a1, v3, v2, &qword_1ED9A6590, MEMORY[0x1E0DF0360]);
}

unint64_t sub_1D54F03B8(uint64_t a1)
{
  uint64_t v2;

  sub_1D54FC95C();
  sub_1D54FC590();
  sub_1D54E5278(&qword_1ED9A6588, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0340], MEMORY[0x1E0DF0358]);
  sub_1D54FC62C();
  type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  sub_1D54FC974();
  v2 = sub_1D54FC980();
  return sub_1D54F07DC(a1, v2);
}

unint64_t sub_1D54F0458(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1D54FC908() & 1) == 0)
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
      while (!v14 && (sub_1D54FC908() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1D54F0538(uint64_t a1, uint64_t a2)
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
    v6 = sub_1D54FC668();
    v8 = v7;
    if (v6 == sub_1D54FC668() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_1D54FC908();
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
          v13 = sub_1D54FC668();
          v15 = v14;
          if (v13 == sub_1D54FC668() && v15 == v16)
            break;
          v18 = sub_1D54FC908();
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

unint64_t sub_1D54F06AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), unint64_t *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, unint64_t, uint64_t);
  char v17;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  unint64_t *v21;
  uint64_t v22;

  v21 = a4;
  v22 = a5;
  v6 = v5;
  v19 = a1;
  v20 = a3;
  v8 = a3(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v19 - v10;
  v12 = -1 << *(_BYTE *)(v6 + 32);
  v13 = a2 & ~v12;
  if (((*(_QWORD *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
  {
    v14 = ~v12;
    v15 = *(_QWORD *)(v9 + 72);
    v16 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
    do
    {
      v16(v11, *(_QWORD *)(v6 + 48) + v15 * v13, v8);
      sub_1D54E5278(v21, v20, v22);
      v17 = sub_1D54FC638();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      if ((v17 & 1) != 0)
        break;
      v13 = (v13 + 1) & v14;
    }
    while (((*(_QWORD *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
  }
  return v13;
}

unint64_t sub_1D54F07DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v5 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v2 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    while (1)
    {
      sub_1D54F55D4(*(_QWORD *)(v2 + 48) + v12 * v10, (uint64_t)v8);
      if ((sub_1D54FC530() & 1) != 0 && v8[*(int *)(v5 + 20)] == *(_BYTE *)(a1 + *(int *)(v5 + 20)))
        break;
      sub_1D54ECDCC((uint64_t)v8);
      v10 = (v10 + 1) & v11;
      if (((*(_QWORD *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        return v10;
    }
    sub_1D54ECDCC((uint64_t)v8);
  }
  return v10;
}

uint64_t sub_1D54F08F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_1D54F03B8(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    v17 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1D54F2A08();
      v9 = v17;
    }
    v10 = *(_QWORD *)(v9 + 48);
    v11 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
    sub_1D54ECDCC(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * v6);
    v12 = *(_QWORD *)(v9 + 56);
    v13 = sub_1D54FC4D0();
    v14 = *(_QWORD *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v14 + 32))(a2, v12 + *(_QWORD *)(v14 + 72) * v6, v13);
    sub_1D54F1B4C(v6, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a2, 0, 1, v13);
  }
  else
  {
    v16 = sub_1D54FC4D0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a2, 1, 1, v16);
  }
}

uint64_t sub_1D54F0A28(uint64_t a1, char a2)
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
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  _QWORD *v18;
  unint64_t v19;
  int64_t v20;
  void *v21;
  _OWORD *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  char v35;
  _OWORD v36[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A66A8);
  v35 = a2;
  v6 = sub_1D54FC8A8();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v34 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v33 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v16 = v15 | (v13 << 6);
      goto LABEL_22;
    }
    v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v17 >= v33)
      break;
    v18 = (_QWORD *)(v5 + 64);
    v19 = *(_QWORD *)(v34 + 8 * v17);
    ++v13;
    if (!v19)
    {
      v13 = v17 + 1;
      if (v17 + 1 >= v33)
        goto LABEL_34;
      v19 = *(_QWORD *)(v34 + 8 * v13);
      if (!v19)
      {
        v20 = v17 + 2;
        if (v20 >= v33)
        {
LABEL_34:
          swift_release();
          if ((v35 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v19 = *(_QWORD *)(v34 + 8 * v20);
        if (!v19)
        {
          while (1)
          {
            v13 = v20 + 1;
            if (__OFADD__(v20, 1))
              goto LABEL_43;
            if (v13 >= v33)
              goto LABEL_34;
            v19 = *(_QWORD *)(v34 + 8 * v13);
            ++v20;
            if (v19)
              goto LABEL_21;
          }
        }
        v13 = v20;
      }
    }
LABEL_21:
    v10 = (v19 - 1) & v19;
    v16 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_22:
    v21 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v16);
    v22 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v16);
    if ((v35 & 1) != 0)
    {
      sub_1D54EA328(v22, v36);
    }
    else
    {
      sub_1D54EA1DC((uint64_t)v22, (uint64_t)v36);
      v23 = v21;
    }
    sub_1D54FC668();
    sub_1D54FC95C();
    sub_1D54FC674();
    v24 = sub_1D54FC980();
    result = swift_bridgeObjectRelease();
    v25 = -1 << *(_BYTE *)(v7 + 32);
    v26 = v24 & ~v25;
    v27 = v26 >> 6;
    if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v28 = 0;
      v29 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v30 = v27 == v29;
        if (v27 == v29)
          v27 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v11 + 8 * v27);
      }
      while (v31 == -1);
      v14 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v14) = v21;
    result = (uint64_t)sub_1D54EA328(v36, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v18 = (_QWORD *)(v5 + 64);
  if ((v35 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v32 = 1 << *(_BYTE *)(v5 + 32);
  if (v32 >= 64)
    bzero(v18, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v18 = -1 << v32;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1D54F0D60(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t i;
  int v42;

  v3 = v2;
  v5 = sub_1D54FC4D0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A6690);
  v42 = a2;
  v10 = sub_1D54FC8A8();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_41;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v40 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v38 = v2;
  v39 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  result = swift_retain();
  v18 = 0;
  for (i = v9; ; v9 = i)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v21 = v20 | (v18 << 6);
      goto LABEL_22;
    }
    v22 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v39)
      break;
    v23 = v40;
    v24 = v40[v22];
    ++v18;
    if (!v24)
    {
      v18 = v22 + 1;
      if (v22 + 1 >= v39)
        goto LABEL_34;
      v24 = v40[v18];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v39)
        {
LABEL_34:
          swift_release();
          v3 = v38;
          if ((v42 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v40[v25];
        if (!v24)
        {
          while (1)
          {
            v18 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v18 >= v39)
              goto LABEL_34;
            v24 = v40[v18];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v18 = v25;
      }
    }
LABEL_21:
    v15 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v18 << 6);
LABEL_22:
    v26 = *(_QWORD *)(v6 + 72);
    v27 = *(_QWORD *)(v9 + 48) + v26 * v21;
    if ((v42 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v27, v5);
      v28 = *(id *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v27, v5);
      v28 = *(id *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    }
    sub_1D54E5278((unint64_t *)&unk_1ED9A6560, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
    result = sub_1D54FC620();
    v29 = -1 << *(_BYTE *)(v11 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v16 + 8 * v31);
      }
      while (v35 == -1);
      v19 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v26 * v19, v8, v5);
    *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v19) = v28;
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release();
  v3 = v38;
  v23 = v40;
  if ((v42 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v36 = 1 << *(_BYTE *)(v9 + 32);
  if (v36 >= 64)
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v36;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v11;
  return result;
}

uint64_t sub_1D54F10F4(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t i;
  int v42;

  v3 = v2;
  v5 = sub_1D54FC590();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9A6698);
  v42 = a2;
  v10 = sub_1D54FC8A8();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_41;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v40 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v38 = v2;
  v39 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  result = swift_retain();
  v18 = 0;
  for (i = v9; ; v9 = i)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v21 = v20 | (v18 << 6);
      goto LABEL_22;
    }
    v22 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v39)
      break;
    v23 = v40;
    v24 = v40[v22];
    ++v18;
    if (!v24)
    {
      v18 = v22 + 1;
      if (v22 + 1 >= v39)
        goto LABEL_34;
      v24 = v40[v18];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v39)
        {
LABEL_34:
          swift_release();
          v3 = v38;
          if ((v42 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v40[v25];
        if (!v24)
        {
          while (1)
          {
            v18 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v18 >= v39)
              goto LABEL_34;
            v24 = v40[v18];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v18 = v25;
      }
    }
LABEL_21:
    v15 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v18 << 6);
LABEL_22:
    v26 = *(_QWORD *)(v6 + 72);
    v27 = *(_QWORD *)(v9 + 48) + v26 * v21;
    if ((v42 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v27, v5);
      v28 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v27, v5);
      v28 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21);
      swift_bridgeObjectRetain();
    }
    sub_1D54E5278(&qword_1ED9A6588, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0340], MEMORY[0x1E0DF0358]);
    result = sub_1D54FC620();
    v29 = -1 << *(_BYTE *)(v11 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v16 + 8 * v31);
      }
      while (v35 == -1);
      v19 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v26 * v19, v8, v5);
    *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v19) = v28;
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release();
  v3 = v38;
  v23 = v40;
  if ((v42 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v36 = 1 << *(_BYTE *)(v9 + 32);
  if (v36 >= 64)
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v36;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v11;
  return result;
}

uint64_t sub_1D54F1488(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
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
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (**v29)(char *, unint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  int64_t v44;
  _QWORD *v45;
  void (**v46)(char *, unint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  int v49;
  char *v50;
  uint64_t (**v51)(unint64_t, char *, uint64_t);
  char *v52;
  uint64_t v53;

  v3 = v2;
  v53 = sub_1D54FC4D0();
  v5 = *(_QWORD *)(v53 - 8);
  MEMORY[0x1E0C80A78](v53);
  v52 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  v47 = *(_QWORD *)(v7 - 8);
  v48 = v7;
  MEMORY[0x1E0C80A78](v7);
  v50 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF39598);
  v49 = a2;
  v10 = sub_1D54FC8A8();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_41;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v45 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v43 = v2;
  v44 = (unint64_t)(v12 + 63) >> 6;
  v46 = (void (**)(char *, unint64_t, uint64_t))(v5 + 16);
  v51 = (uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32);
  v16 = v10 + 64;
  result = swift_retain();
  v18 = 0;
  v19 = (uint64_t)v50;
  while (1)
  {
    if (v15)
    {
      v21 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v22 = v21 | (v18 << 6);
      goto LABEL_22;
    }
    v23 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v23 >= v44)
      break;
    v24 = v45;
    v25 = v45[v23];
    ++v18;
    if (!v25)
    {
      v18 = v23 + 1;
      if (v23 + 1 >= v44)
        goto LABEL_34;
      v25 = v45[v18];
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v44)
        {
LABEL_34:
          swift_release();
          v3 = v43;
          if ((v49 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v25 = v45[v26];
        if (!v25)
        {
          while (1)
          {
            v18 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_43;
            if (v18 >= v44)
              goto LABEL_34;
            v25 = v45[v18];
            ++v26;
            if (v25)
              goto LABEL_21;
          }
        }
        v18 = v26;
      }
    }
LABEL_21:
    v15 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v18 << 6);
LABEL_22:
    v27 = *(_QWORD *)(v47 + 72);
    v28 = *(_QWORD *)(v9 + 48) + v27 * v22;
    if ((v49 & 1) != 0)
    {
      sub_1D54F5618(v28, v19);
      v29 = (void (**)(char *, unint64_t, uint64_t))v51;
    }
    else
    {
      sub_1D54F55D4(v28, v19);
      v29 = v46;
    }
    v30 = v9;
    v31 = *(_QWORD *)(v9 + 56);
    v32 = v5;
    v33 = *(_QWORD *)(v5 + 72);
    (*v29)(v52, v31 + v33 * v22, v53);
    sub_1D54FC95C();
    sub_1D54FC590();
    sub_1D54E5278(&qword_1ED9A6588, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0340], MEMORY[0x1E0DF0358]);
    sub_1D54FC62C();
    sub_1D54FC974();
    result = sub_1D54FC980();
    v34 = -1 << *(_BYTE *)(v11 + 32);
    v35 = result & ~v34;
    v36 = v35 >> 6;
    if (((-1 << v35) & ~*(_QWORD *)(v16 + 8 * (v35 >> 6))) != 0)
    {
      v20 = __clz(__rbit64((-1 << v35) & ~*(_QWORD *)(v16 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
      v19 = (uint64_t)v50;
    }
    else
    {
      v37 = 0;
      v38 = (unint64_t)(63 - v34) >> 6;
      v19 = (uint64_t)v50;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v39 = v36 == v38;
        if (v36 == v38)
          v36 = 0;
        v37 |= v39;
        v40 = *(_QWORD *)(v16 + 8 * v36);
      }
      while (v40 == -1);
      v20 = __clz(__rbit64(~v40)) + (v36 << 6);
    }
    *(_QWORD *)(v16 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    sub_1D54F5618(v19, *(_QWORD *)(v11 + 48) + v27 * v20);
    result = (*v51)(*(_QWORD *)(v11 + 56) + v33 * v20, v52, v53);
    ++*(_QWORD *)(v11 + 16);
    v5 = v32;
    v9 = v30;
  }
  swift_release();
  v3 = v43;
  v24 = v45;
  if ((v49 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v41 = 1 << *(_BYTE *)(v9 + 32);
  if (v41 >= 64)
    bzero(v24, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v41;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v11;
  return result;
}

unint64_t sub_1D54F18AC(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, unint64_t, uint64_t);
  unint64_t v34;
  uint64_t v35;

  v4 = sub_1D54FC4D0();
  v35 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_1D54FC7C4();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v34 = (result + 1) & v11;
      v12 = *(_QWORD *)(v35 + 72);
      v33 = *(void (**)(char *, unint64_t, uint64_t))(v35 + 16);
      v13 = v11;
      do
      {
        v14 = v8;
        v15 = v12;
        v16 = v12 * v10;
        v17 = v13;
        v33(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        sub_1D54E5278((unint64_t *)&unk_1ED9A6560, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
        v18 = sub_1D54FC620();
        result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v7, v4);
        v13 = v17;
        v19 = v18 & v17;
        if (a1 >= (uint64_t)v34)
        {
          if (v19 >= v34 && a1 >= (uint64_t)v19)
          {
LABEL_16:
            v22 = *(_QWORD *)(a2 + 48);
            result = v22 + v15 * a1;
            v8 = v14;
            if (v15 * a1 < v16 || (v12 = v15, result >= v22 + v16 + v15))
            {
              result = swift_arrayInitWithTakeFrontToBack();
LABEL_21:
              v13 = v17;
              v12 = v15;
            }
            else if (v15 * a1 != v16)
            {
              result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_21;
            }
            v23 = *(_QWORD *)(a2 + 56);
            v24 = (_QWORD *)(v23 + 8 * a1);
            v25 = (_QWORD *)(v23 + 8 * v10);
            if (a1 != v10 || (a1 = v10, v24 >= v25 + 1))
            {
              *v24 = *v25;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v34 || a1 >= (uint64_t)v19)
        {
          goto LABEL_16;
        }
        v8 = v14;
        v12 = v15;
LABEL_5:
        v10 = (v10 + 1) & v13;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v27 = *v26;
    v28 = (-1 << a1) - 1;
  }
  else
  {
    v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v28 = *v26;
    v27 = (-1 << a1) - 1;
  }
  *v26 = v28 & v27;
  v29 = *(_QWORD *)(a2 + 16);
  v30 = __OFSUB__(v29, 1);
  v31 = v29 - 1;
  if (v30)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v31;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1D54F1B4C(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  int64_t v22;
  unint64_t v23;
  BOOL v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;

  v34 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  v4 = *(_QWORD *)(v34 - 8);
  result = MEMORY[0x1E0C80A78](v34);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_1D54FC7C4();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v33 = (result + 1) & v11;
      v12 = *(_QWORD *)(v4 + 72);
      v13 = v11;
      do
      {
        v14 = v12;
        v15 = v12 * v10;
        v16 = v13;
        sub_1D54F55D4(*(_QWORD *)(a2 + 48) + v12 * v10, (uint64_t)v7);
        sub_1D54FC95C();
        sub_1D54FC590();
        sub_1D54E5278(&qword_1ED9A6588, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0340], MEMORY[0x1E0DF0358]);
        sub_1D54FC62C();
        sub_1D54FC974();
        v17 = sub_1D54FC980();
        result = sub_1D54ECDCC((uint64_t)v7);
        v13 = v16;
        v18 = v17 & v16;
        if (a1 >= (uint64_t)v33)
        {
          if (v18 < v33)
          {
            v12 = v14;
          }
          else
          {
            v12 = v14;
            if (a1 >= (uint64_t)v18)
              goto LABEL_12;
          }
        }
        else
        {
          v12 = v14;
          if (v18 >= v33 || a1 >= (uint64_t)v18)
          {
LABEL_12:
            if (v12 * a1 < v15
              || *(_QWORD *)(a2 + 48) + v12 * a1 >= (unint64_t)(*(_QWORD *)(a2 + 48) + v15 + v12))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v12 * a1 != v15)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v19 = *(_QWORD *)(a2 + 56);
            v20 = *(_QWORD *)(*(_QWORD *)(sub_1D54FC4D0() - 8) + 72);
            v21 = v20 * a1;
            result = v19 + v20 * a1;
            v22 = v20 * v10;
            v23 = v19 + v20 * v10 + v20;
            if (v21 < v22 || result >= v23)
            {
              result = swift_arrayInitWithTakeFrontToBack();
              a1 = v10;
              v12 = v14;
              v13 = v16;
            }
            else
            {
              a1 = v10;
              v25 = v21 == v22;
              v12 = v14;
              v13 = v16;
              if (!v25)
              {
                result = swift_arrayInitWithTakeBackToFront();
                v13 = v16;
                a1 = v10;
              }
            }
          }
        }
        v10 = (v10 + 1) & v13;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v27 = *v26;
    v28 = (-1 << a1) - 1;
  }
  else
  {
    v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v28 = *v26;
    v27 = (-1 << a1) - 1;
  }
  *v26 = v28 & v27;
  v29 = *(_QWORD *)(a2 + 16);
  v30 = __OFSUB__(v29, 1);
  v31 = v29 - 1;
  if (v30)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v31;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_1D54F1E44(_OWORD *a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  _OWORD *v16;
  _OWORD *result;
  unint64_t v18;
  char v19;

  v4 = (_QWORD **)v3;
  v7 = (_QWORD *)*v3;
  v9 = sub_1D54F0208((uint64_t)a2);
  v10 = v7[2];
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
  }
  else
  {
    v13 = v8;
    v14 = v7[3];
    if (v14 >= v12 && (a3 & 1) != 0)
    {
LABEL_7:
      v15 = *v4;
      if ((v13 & 1) != 0)
      {
LABEL_8:
        v16 = (_OWORD *)(v15[7] + 32 * v9);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
        return sub_1D54EA328(a1, v16);
      }
      goto LABEL_11;
    }
    if (v14 >= v12 && (a3 & 1) == 0)
    {
      sub_1D54F23EC();
      goto LABEL_7;
    }
    sub_1D54F0A28(v12, a3 & 1);
    v18 = sub_1D54F0208((uint64_t)a2);
    if ((v13 & 1) == (v19 & 1))
    {
      v9 = v18;
      v15 = *v4;
      if ((v13 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1D54F2240(v9, (uint64_t)a2, a1, v15);
      return a2;
    }
  }
  type metadata accessor for QLFileThumbnailRequestOptions(0);
  result = (_OWORD *)sub_1D54FC920();
  __break(1u);
  return result;
}

uint64_t sub_1D54F1F64(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t v25;

  v4 = (_QWORD **)v3;
  v8 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (_QWORD *)*v3;
  v13 = sub_1D54F03B8(a2);
  v14 = v11[2];
  v15 = (v12 & 1) == 0;
  v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    v17 = v12;
    v18 = v11[3];
    if (v18 >= v16 && (a3 & 1) != 0)
    {
LABEL_7:
      v19 = *v4;
      if ((v17 & 1) != 0)
      {
LABEL_8:
        v20 = v19[7];
        v21 = sub_1D54FC4D0();
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 40))(v20 + *(_QWORD *)(*(_QWORD *)(v21 - 8) + 72) * v13, a1, v21);
      }
      goto LABEL_11;
    }
    if (v18 >= v16 && (a3 & 1) == 0)
    {
      sub_1D54F2A08();
      goto LABEL_7;
    }
    sub_1D54F1488(v16, a3 & 1);
    v23 = sub_1D54F03B8(a2);
    if ((v17 & 1) == (v24 & 1))
    {
      v13 = v23;
      v19 = *v4;
      if ((v17 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1D54F55D4(a2, (uint64_t)v10);
      return sub_1D54F22A4(v13, (uint64_t)v10, a1, v19);
    }
  }
  result = sub_1D54FC920();
  __break(1u);
  return result;
}

void sub_1D54F20E4(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;

  v4 = (_QWORD **)v3;
  v8 = sub_1D54FC4D0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_1D54F0288(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  v18 = v13;
  v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    v20 = *v4;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7];

      *(_QWORD *)(v21 + 8 * v14) = a1;
      return;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_1D54F25B0();
    goto LABEL_7;
  }
  sub_1D54F0D60(v17, a3 & 1);
  v22 = sub_1D54F0288(a2);
  if ((v18 & 1) != (v23 & 1))
  {
LABEL_14:
    sub_1D54FC920();
    __break(1u);
    return;
  }
  v14 = v22;
  v20 = *v4;
  if ((v18 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  sub_1D54F2354(v14, (uint64_t)v11, a1, v20);
}

_OWORD *sub_1D54F2240(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  _OWORD *result;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  result = sub_1D54EA328(a3, (_OWORD *)(a4[7] + 32 * a1));
  v6 = a4[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a4[2] = v8;
  return result;
}

uint64_t sub_1D54F22A4(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  sub_1D54F5618(a2, v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1);
  v10 = a4[7];
  v11 = sub_1D54FC4D0();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, a3, v11);
  v13 = a4[2];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    a4[2] = v15;
  return result;
}

uint64_t sub_1D54F2354(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_1D54FC4D0();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  *(_QWORD *)(a4[7] + 8 * a1) = a3;
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

id sub_1D54F23EC()
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
  void *v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  _OWORD v22[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A66A8);
  v2 = *v0;
  v3 = sub_1D54FC89C();
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
    v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      v9 = v19 + 1;
      if (v19 + 1 >= v13)
        goto LABEL_26;
      v20 = *(_QWORD *)(v6 + 8 * v9);
      if (!v20)
        break;
    }
LABEL_25:
    v12 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 32 * v15;
    sub_1D54EA1DC(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    sub_1D54EA328(v22, (_OWORD *)(*(_QWORD *)(v4 + 56) + v18));
    result = v17;
  }
  v21 = v19 + 2;
  if (v21 >= v13)
    goto LABEL_26;
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
  {
    v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v9);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_1D54F25B0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = sub_1D54FC4D0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A6690);
  v24 = v0;
  v5 = *v0;
  v6 = sub_1D54FC89C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v24 = v7;
    return result;
  }
  result = (id)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v25 = v5 + 64;
  v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      v11 = v20 + 1;
      if (v20 + 1 >= v26)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v11);
      if (!v21)
        break;
    }
LABEL_25:
    v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v17, v1);
    v18 = 8 * v16;
    v19 = *(void **)(*(_QWORD *)(v5 + 56) + v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v19;
    result = v19;
  }
  v22 = v20 + 2;
  if (v22 >= v26)
    goto LABEL_26;
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v11 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v11);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1D54F27D8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = sub_1D54FC590();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9A6698);
  v24 = v0;
  v5 = *v0;
  v6 = sub_1D54FC89C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v24 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v25 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      v11 = v20 + 1;
      if (v20 + 1 >= v26)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v11);
      if (!v21)
        break;
    }
LABEL_25:
    v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v17, v1);
    v18 = 8 * v16;
    v19 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v16);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v19;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v26)
    goto LABEL_26;
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v11 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v11);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1D54F2A08()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *result;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;

  v1 = sub_1D54FC4D0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  v27 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFF39598);
  v24 = v0;
  v8 = *v0;
  v9 = sub_1D54FC89C();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
  {
LABEL_23:
    result = (void *)swift_release();
    *v24 = v10;
    return result;
  }
  result = (void *)(v9 + 64);
  v12 = (unint64_t)((1 << *(_BYTE *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 64 + 8 * v12)
    result = memmove(result, (const void *)(v8 + 64), 8 * v12);
  v25 = v8 + 64;
  v13 = 0;
  *(_QWORD *)(v10 + 16) = *(_QWORD *)(v8 + 16);
  v14 = 1 << *(_BYTE *)(v8 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v8 + 64);
  v26 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v17 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v18 = v17 | (v13 << 6);
      goto LABEL_9;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v21 >= v26)
      goto LABEL_23;
    v22 = *(_QWORD *)(v25 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v26)
        goto LABEL_23;
      v22 = *(_QWORD *)(v25 + 8 * v13);
      if (!v22)
        break;
    }
LABEL_22:
    v16 = (v22 - 1) & v22;
    v18 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_9:
    v19 = *(_QWORD *)(v27 + 72) * v18;
    sub_1D54F55D4(*(_QWORD *)(v8 + 48) + v19, (uint64_t)v7);
    v20 = *(_QWORD *)(v2 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v8 + 56) + v20, v1);
    sub_1D54F5618((uint64_t)v7, *(_QWORD *)(v10 + 48) + v19);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v10 + 56) + v20, v4, v1);
  }
  v23 = v21 + 2;
  if (v23 >= v26)
    goto LABEL_23;
  v22 = *(_QWORD *)(v25 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v26)
      goto LABEL_23;
    v22 = *(_QWORD *)(v25 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1D54F2C84(char a1, int64_t a2, char a3, _QWORD *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A66B8);
  v10 = *(_QWORD *)(sub_1D54FC590() - 8);
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
  v16 = *(_QWORD *)(sub_1D54FC590() - 8);
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
  result = sub_1D54FC8C0();
  __break(1u);
  return result;
}

uint64_t sub_1D54F2E64(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  char *v25;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v3 = v2;
  v6 = sub_1D54FC4D0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_1D54E5278((unint64_t *)&unk_1ED9A6560, v11, MEMORY[0x1E0CB09C8]);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_1D54FC620();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  v15 = v10;
  v16 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v27 = v3;
    v28 = a1;
    v29 = ~v13;
    v30 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    while (1)
    {
      v19 = v15;
      v20 = v18;
      v18(v9, *(_QWORD *)(v15 + 48) + v17 * v14, v6);
      sub_1D54E5278((unint64_t *)&unk_1ED9A6570, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09D0]);
      v21 = sub_1D54FC638();
      v22 = *(void (**)(char *, uint64_t))(v30 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v14 = (v14 + 1) & v29;
      v15 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v16 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v27;
        a1 = v28;
        v23 = v30;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v31, v6);
    v20(v28, *(_QWORD *)(*v27 + 48) + v17 * v14, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    v23 = v7;
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = v31;
    v18(v9, v31, v6);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    sub_1D54F342C((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_1D54F30C0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  int64_t v34;
  _QWORD *v35;
  uint64_t v36;

  v1 = v0;
  v2 = sub_1D54FC4D0();
  v36 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9A6670);
  v6 = sub_1D54FC7E8();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v35 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v33 = v0;
    v34 = (unint64_t)(v8 + 63) >> 6;
    v12 = v6 + 56;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v34)
          goto LABEL_33;
        v19 = v35[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v34)
            goto LABEL_33;
          v19 = v35[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v34)
              goto LABEL_33;
            v19 = v35[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v34)
              {
LABEL_33:
                swift_release();
                v1 = v33;
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 > 63)
                  bzero(v35, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v35 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
                break;
              }
              v19 = v35[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v34)
                    goto LABEL_33;
                  v19 = v35[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_23;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_23:
        v11 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = v5;
      v22 = *(_QWORD *)(v5 + 48);
      v23 = *(_QWORD *)(v36 + 72);
      v24 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 32);
      v24(v4, v22 + v23 * v17, v2);
      sub_1D54E5278((unint64_t *)&unk_1ED9A6560, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
      result = sub_1D54FC620();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v12 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v24)(*(_QWORD *)(v7 + 48) + v15 * v23, v4, v2);
      ++*(_QWORD *)(v7 + 16);
      v5 = v21;
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_1D54F342C(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = a1;
  v6 = sub_1D54FC4D0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v25 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_1D54F30C0();
  }
  else
  {
    if (v11 > v10)
    {
      sub_1D54F3630();
      goto LABEL_12;
    }
    sub_1D54F3854();
  }
  v12 = *v3;
  sub_1D54E5278((unint64_t *)&unk_1ED9A6560, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
  v13 = sub_1D54FC620();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v15 = ~v14;
    v16 = *(_QWORD *)(v7 + 72);
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v17(v9, *(_QWORD *)(v12 + 48) + v16 * a2, v6);
      sub_1D54E5278((unint64_t *)&unk_1ED9A6570, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09D0]);
      v18 = sub_1D54FC638();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v18 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v15;
    }
    while (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v19 = v26;
  v20 = *v25;
  *(_QWORD *)(*v25 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v20 + 48) + *(_QWORD *)(v7 + 72) * a2, v19, v6);
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (!v23)
  {
    *(_QWORD *)(v20 + 16) = v24;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_1D54FC914();
  __break(1u);
  return result;
}

void *sub_1D54F3630()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;

  v1 = v0;
  v2 = sub_1D54FC4D0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9A6670);
  v6 = *v0;
  v7 = sub_1D54FC7DC();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v17)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v20, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v20, v5, v2);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
  {
LABEL_28:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_30;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_1D54F3854()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;

  v1 = v0;
  v2 = sub_1D54FC4D0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9A6670);
  v7 = sub_1D54FC7E8();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v8;
    return result;
  }
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v10 = *(_QWORD *)(v6 + 56);
  v31 = v0;
  v32 = v6 + 56;
  if (v9 < 64)
    v11 = ~(-1 << v9);
  else
    v11 = -1;
  v12 = v11 & v10;
  v33 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 56;
  result = swift_retain();
  v15 = 0;
  while (1)
  {
    if (v12)
    {
      v17 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v18 = v17 | (v15 << 6);
      goto LABEL_24;
    }
    v19 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v19 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v19);
    ++v15;
    if (!v20)
    {
      v15 = v19 + 1;
      if (v19 + 1 >= v33)
        goto LABEL_33;
      v20 = *(_QWORD *)(v32 + 8 * v15);
      if (!v20)
      {
        v15 = v19 + 2;
        if (v19 + 2 >= v33)
          goto LABEL_33;
        v20 = *(_QWORD *)(v32 + 8 * v15);
        if (!v20)
          break;
      }
    }
LABEL_23:
    v12 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v15 << 6);
LABEL_24:
    v22 = *(_QWORD *)(v3 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v22 * v18, v2);
    sub_1D54E5278((unint64_t *)&unk_1ED9A6560, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
    result = sub_1D54FC620();
    v23 = -1 << *(_BYTE *)(v8 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6))) != 0)
    {
      v16 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v13 + 8 * v25);
      }
      while (v29 == -1);
      v16 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v16 * v22, v5, v2);
    ++*(_QWORD *)(v8 + 16);
  }
  v21 = v19 + 3;
  if (v21 >= v33)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v31;
    goto LABEL_35;
  }
  v20 = *(_QWORD *)(v32 + 8 * v21);
  if (v20)
  {
    v15 = v21;
    goto LABEL_23;
  }
  while (1)
  {
    v15 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v15 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v15);
    ++v21;
    if (v20)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1D54F3B7C(_QWORD **a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6[2];

  v2 = *(_QWORD *)(sub_1D54FC590() - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = (_QWORD *)sub_1D54F5280(v3);
  v4 = v3[2];
  v6[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = sub_1D54F3D14(v6);
  *a1 = v3;
  return result;
}

size_t sub_1D54F3BFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  size_t result;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A66B8);
  v3 = *(_QWORD *)(sub_1D54FC590() - 8);
  v4 = *(_QWORD *)(v3 + 72);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      v9 = sub_1D54F4FB8(&v10, (uint64_t)v6 + v5, v1, a1);
      swift_bridgeObjectRetain();
      sub_1D54EA338();
      if (v9 == v1)
        return (size_t)v6;
      __break(1u);
      return MEMORY[0x1E0DEE9D8];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1D54F3D14(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  int v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t, uint64_t);
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t *v56;
  char *v57;
  char v58;
  void (*v59)(char *, uint64_t);
  char *v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(char *, uint64_t, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  unint64_t v65;
  unint64_t v66;
  char *v67;
  char *v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  BOOL v80;
  unint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  BOOL v90;
  uint64_t v91;
  char v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  BOOL v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  char *v109;
  char *v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  char *v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  unint64_t v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  void (*v133)(char *, uint64_t, uint64_t);
  uint64_t v134;
  char *v135;
  char *v136;
  uint64_t v137;
  char *v138;
  uint64_t *v139;
  char *v140;
  uint64_t v141;
  uint64_t v142;

  v3 = sub_1D54FC590();
  v141 = *(_QWORD *)(v3 - 8);
  v4 = MEMORY[0x1E0C80A78](v3);
  v129 = (char *)&v124 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x1E0C80A78](v4);
  v140 = (char *)&v124 - v7;
  v8 = MEMORY[0x1E0C80A78](v6);
  v136 = (char *)&v124 - v9;
  MEMORY[0x1E0C80A78](v8);
  v135 = (char *)&v124 - v10;
  v11 = a1;
  v12 = a1[1];
  result = sub_1D54FC8FC();
  if (result >= v12)
  {
    if (v12 < 0)
      goto LABEL_137;
    if (v12)
      return sub_1D54F46D8(0, v12, 1, a1);
    return result;
  }
  if (v12 >= 0)
    v14 = v12;
  else
    v14 = v12 + 1;
  if (v12 < -1)
    goto LABEL_145;
  v127 = result;
  v132 = v1;
  if (v12 < 2)
  {
    v19 = (char *)MEMORY[0x1E0DEE9D8];
    v131 = MEMORY[0x1E0DEE9D8]
         + ((*(unsigned __int8 *)(v141 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v141 + 80));
    v18 = a1;
    v126 = MEMORY[0x1E0DEE9D8];
    if (v12 != 1)
    {
      v22 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
LABEL_103:
      v116 = v19;
      if (v22 >= 2)
      {
        v117 = *v18;
        do
        {
          v118 = v22 - 2;
          if (v22 < 2)
            goto LABEL_132;
          if (!v117)
            goto LABEL_144;
          v119 = *(_QWORD *)&v116[16 * v118 + 32];
          v120 = *(_QWORD *)&v116[16 * v22 + 24];
          v121 = v132;
          sub_1D54F4914(v117 + *(_QWORD *)(v141 + 72) * v119, v117 + *(_QWORD *)(v141 + 72) * *(_QWORD *)&v116[16 * v22 + 16], v117 + *(_QWORD *)(v141 + 72) * v120, v131);
          v132 = v121;
          if (v121)
            break;
          if (v120 < v119)
            goto LABEL_133;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v116 = sub_1D54F4FA4((uint64_t)v116);
          if (v118 >= *((_QWORD *)v116 + 2))
            goto LABEL_134;
          v122 = &v116[16 * v118 + 32];
          *(_QWORD *)v122 = v119;
          *((_QWORD *)v122 + 1) = v120;
          v123 = *((_QWORD *)v116 + 2);
          if (v22 > v123)
            goto LABEL_135;
          memmove(&v116[16 * v22 + 16], &v116[16 * v22 + 32], 16 * (v123 - v22));
          *((_QWORD *)v116 + 2) = v123 - 1;
          v22 = v123 - 1;
        }
        while (v123 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v126 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v15 = v14 >> 1;
    v16 = sub_1D54FC6E0();
    *(_QWORD *)(v16 + 16) = v15;
    v17 = *(unsigned __int8 *)(v141 + 80);
    v126 = v16;
    v131 = v16 + ((v17 + 32) & ~v17);
    v18 = v11;
  }
  v20 = 0;
  v19 = (char *)MEMORY[0x1E0DEE9D8];
  v139 = v18;
  v21 = v3;
  v142 = v3;
  while (1)
  {
    v23 = v20++;
    v130 = v23;
    v134 = v12;
    if (v20 >= v12)
      goto LABEL_36;
    v128 = *v18;
    v24 = v141;
    v25 = v128 + *(_QWORD *)(v141 + 72) * v20;
    v26 = *(char **)(v141 + 16);
    v27 = v135;
    v137 = *(_QWORD *)(v141 + 72);
    v138 = v26;
    ((void (*)(char *, uint64_t, uint64_t))v26)(v135, v25, v21);
    v28 = v136;
    sub_1D54FC518();
    v29 = sub_1D54FC530();
    v30 = *(void (**)(char *, uint64_t))(v24 + 8);
    v30(v28, v21);
    v30(v27, v21);
    v20 = v23 + 2;
    if (v23 + 2 < v134)
    {
      v31 = v128 + v137 * v20;
      while (1)
      {
        v32 = v20;
        v33 = v135;
        v34 = v142;
        ((void (*)(char *, uint64_t, uint64_t))v138)(v135, v31, v142);
        v35 = v136;
        sub_1D54FC518();
        v36 = sub_1D54FC530();
        v30(v35, v34);
        v30(v33, v34);
        if (((v29 ^ v36) & 1) != 0)
          break;
        v20 = v32 + 1;
        v31 += v137;
        if (v134 == v32 + 1)
        {
          v20 = v134;
          v21 = v142;
          goto LABEL_22;
        }
      }
      v21 = v142;
      v20 = v32;
LABEL_22:
      v23 = v130;
    }
    v18 = v139;
    if ((v29 & 1) == 0)
      goto LABEL_36;
    if (v20 < v23)
      goto LABEL_138;
    if (v23 < v20)
    {
      v125 = v19;
      v37 = 0;
      v38 = v137;
      v39 = v137 * (v20 - 1);
      v40 = v20 * v137;
      v41 = v23;
      v42 = v23 * v137;
      v43 = v132;
      v138 = (char *)v20;
      do
      {
        if (v41 != v20 + v37 - 1)
        {
          v45 = v128;
          if (!v128)
            goto LABEL_143;
          v46 = v128 + v42;
          v132 = v128 + v39;
          v133 = *(void (**)(char *, uint64_t, uint64_t))(v141 + 32);
          v133(v129, v128 + v42, v142);
          if (v42 < v39 || v46 >= v45 + v40)
          {
            v44 = (char *)v132;
            v21 = v142;
            swift_arrayInitWithTakeFrontToBack();
          }
          else
          {
            v21 = v142;
            v44 = (char *)v132;
            if (v42 != v39)
              swift_arrayInitWithTakeBackToFront();
          }
          v133(v44, (uint64_t)v129, v21);
          v38 = v137;
          v20 = (uint64_t)v138;
        }
        ++v41;
        --v37;
        v39 -= v38;
        v40 -= v38;
        v42 += v38;
      }
      while (v41 < v20 + v37);
      v18 = v139;
      v19 = v125;
      v23 = v130;
    }
    else
    {
LABEL_36:
      v43 = v132;
    }
    if (v20 < v134)
    {
      if (__OFSUB__(v20, v23))
        goto LABEL_136;
      if (v20 - v23 < v127)
        break;
    }
LABEL_55:
    if (v20 < v23)
      goto LABEL_131;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v132 = v43;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v19 = sub_1D54F4DA0(0, *((_QWORD *)v19 + 2) + 1, 1, v19);
    v66 = *((_QWORD *)v19 + 2);
    v65 = *((_QWORD *)v19 + 3);
    v22 = v66 + 1;
    if (v66 >= v65 >> 1)
      v19 = sub_1D54F4DA0((char *)(v65 > 1), v66 + 1, 1, v19);
    *((_QWORD *)v19 + 2) = v22;
    v67 = v19 + 32;
    v68 = &v19[16 * v66 + 32];
    *(_QWORD *)v68 = v23;
    *((_QWORD *)v68 + 1) = v20;
    if (v66)
    {
      while (1)
      {
        v69 = v22 - 1;
        if (v22 >= 4)
        {
          v74 = &v67[16 * v22];
          v75 = *((_QWORD *)v74 - 8);
          v76 = *((_QWORD *)v74 - 7);
          v80 = __OFSUB__(v76, v75);
          v77 = v76 - v75;
          if (v80)
            goto LABEL_120;
          v79 = *((_QWORD *)v74 - 6);
          v78 = *((_QWORD *)v74 - 5);
          v80 = __OFSUB__(v78, v79);
          v72 = v78 - v79;
          v73 = v80;
          if (v80)
            goto LABEL_121;
          v81 = v22 - 2;
          v82 = &v67[16 * v22 - 32];
          v84 = *(_QWORD *)v82;
          v83 = *((_QWORD *)v82 + 1);
          v80 = __OFSUB__(v83, v84);
          v85 = v83 - v84;
          if (v80)
            goto LABEL_123;
          v80 = __OFADD__(v72, v85);
          v86 = v72 + v85;
          if (v80)
            goto LABEL_126;
          if (v86 >= v77)
          {
            v104 = &v67[16 * v69];
            v106 = *(_QWORD *)v104;
            v105 = *((_QWORD *)v104 + 1);
            v80 = __OFSUB__(v105, v106);
            v107 = v105 - v106;
            if (v80)
              goto LABEL_130;
            v97 = v72 < v107;
            goto LABEL_92;
          }
        }
        else
        {
          if (v22 != 3)
          {
            v98 = *((_QWORD *)v19 + 4);
            v99 = *((_QWORD *)v19 + 5);
            v80 = __OFSUB__(v99, v98);
            v91 = v99 - v98;
            v92 = v80;
            goto LABEL_86;
          }
          v71 = *((_QWORD *)v19 + 4);
          v70 = *((_QWORD *)v19 + 5);
          v80 = __OFSUB__(v70, v71);
          v72 = v70 - v71;
          v73 = v80;
        }
        if ((v73 & 1) != 0)
          goto LABEL_122;
        v81 = v22 - 2;
        v87 = &v67[16 * v22 - 32];
        v89 = *(_QWORD *)v87;
        v88 = *((_QWORD *)v87 + 1);
        v90 = __OFSUB__(v88, v89);
        v91 = v88 - v89;
        v92 = v90;
        if (v90)
          goto LABEL_125;
        v93 = &v67[16 * v69];
        v95 = *(_QWORD *)v93;
        v94 = *((_QWORD *)v93 + 1);
        v80 = __OFSUB__(v94, v95);
        v96 = v94 - v95;
        if (v80)
          goto LABEL_128;
        if (__OFADD__(v91, v96))
          goto LABEL_129;
        if (v91 + v96 >= v72)
        {
          v97 = v72 < v96;
LABEL_92:
          if (v97)
            v69 = v81;
          goto LABEL_94;
        }
LABEL_86:
        if ((v92 & 1) != 0)
          goto LABEL_124;
        v100 = &v67[16 * v69];
        v102 = *(_QWORD *)v100;
        v101 = *((_QWORD *)v100 + 1);
        v80 = __OFSUB__(v101, v102);
        v103 = v101 - v102;
        if (v80)
          goto LABEL_127;
        if (v103 < v91)
          goto LABEL_14;
LABEL_94:
        v108 = v69 - 1;
        if (v69 - 1 >= v22)
        {
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
          goto LABEL_140;
        }
        if (!*v139)
          goto LABEL_142;
        v109 = v19;
        v110 = &v67[16 * v108];
        v111 = *(_QWORD *)v110;
        v112 = &v67[16 * v69];
        v113 = *((_QWORD *)v112 + 1);
        v114 = v132;
        sub_1D54F4914(*v139 + *(_QWORD *)(v141 + 72) * *(_QWORD *)v110, *v139 + *(_QWORD *)(v141 + 72) * *(_QWORD *)v112, *v139 + *(_QWORD *)(v141 + 72) * v113, v131);
        v132 = v114;
        if (v114)
          goto LABEL_114;
        if (v113 < v111)
          goto LABEL_117;
        if (v69 > *((_QWORD *)v109 + 2))
          goto LABEL_118;
        *(_QWORD *)v110 = v111;
        *(_QWORD *)&v67[16 * v108 + 8] = v113;
        v115 = *((_QWORD *)v109 + 2);
        if (v69 >= v115)
          goto LABEL_119;
        v19 = v109;
        v22 = v115 - 1;
        memmove(&v67[16 * v69], v112 + 16, 16 * (v115 - 1 - v69));
        *((_QWORD *)v109 + 2) = v115 - 1;
        v21 = v142;
        if (v115 <= 2)
          goto LABEL_14;
      }
    }
    v22 = 1;
LABEL_14:
    v18 = v139;
    v12 = v139[1];
    if (v20 >= v12)
      goto LABEL_103;
  }
  if (__OFADD__(v23, v127))
    goto LABEL_139;
  v47 = v134;
  if (v23 + v127 < v134)
    v47 = v23 + v127;
  if (v47 >= v23)
  {
    if (v20 != v47)
    {
      v125 = v19;
      v48 = *(_QWORD *)(v141 + 72);
      v49 = *(void (**)(char *, uint64_t, uint64_t))(v141 + 16);
      v132 = v43;
      v133 = v49;
      v137 = v48 * (v20 - 1);
      v134 = v48;
      v50 = v20 * v48;
      v51 = v21;
      v128 = v47;
      do
      {
        v53 = 0;
        v54 = (char *)v23;
        v138 = (char *)v20;
        while (1)
        {
          v55 = v135;
          v56 = v18;
          v133(v135, v50 + v53 + *v18, v51);
          v57 = v136;
          sub_1D54FC518();
          v58 = sub_1D54FC530();
          v59 = *(void (**)(char *, uint64_t))(v141 + 8);
          v60 = v57;
          v51 = v142;
          v59(v60, v142);
          v59(v55, v51);
          if ((v58 & 1) == 0)
            break;
          v61 = *v56;
          if (!*v56)
            goto LABEL_141;
          v62 = v137 + v53 + v61;
          v63 = *(void (**)(char *, uint64_t, uint64_t))(v141 + 32);
          v63(v140, v61 + v50 + v53, v142);
          swift_arrayInitWithTakeFrontToBack();
          v51 = v142;
          v63((char *)v62, (uint64_t)v140, v142);
          ++v54;
          v53 -= v134;
          v52 = v138;
          v18 = v139;
          if (v138 == v54)
            goto LABEL_47;
        }
        v52 = v138;
        v18 = v56;
LABEL_47:
        v20 = (uint64_t)(v52 + 1);
        v137 += v134;
        v50 += v134;
        v23 = v130;
      }
      while (v20 != v128);
      v21 = v51;
      v20 = v128;
      v43 = v132;
      v19 = v125;
    }
    goto LABEL_55;
  }
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  result = sub_1D54FC884();
  __break(1u);
  return result;
}

uint64_t sub_1D54F46D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  _QWORD *v34;
  uint64_t v35;

  v26 = a1;
  v7 = sub_1D54FC590();
  v34 = *(_QWORD **)(v7 - 8);
  v8 = MEMORY[0x1E0C80A78](v7);
  v33 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x1E0C80A78](v8);
  v29 = (char *)&v24 - v11;
  result = MEMORY[0x1E0C80A78](v10);
  v28 = (char *)&v24 - v13;
  v32 = a3;
  v25 = a2;
  if (a3 != a2)
  {
    v14 = v34[9];
    v27 = (void (*)(char *, uint64_t, uint64_t))v34[2];
    v30 = v14;
    v31 = v14 * (v32 - 1);
    v35 = v14 * v32;
LABEL_5:
    v15 = 0;
    v16 = v26;
    while (1)
    {
      v17 = v28;
      v27(v28, v35 + v15 + *a4, v7);
      v18 = v29;
      sub_1D54FC518();
      v19 = sub_1D54FC530();
      v20 = (void (*)(char *, uint64_t))v34[1];
      v20(v18, v7);
      result = ((uint64_t (*)(char *, uint64_t))v20)(v17, v7);
      if ((v19 & 1) == 0)
      {
LABEL_4:
        v31 += v30;
        ++v32;
        v35 += v30;
        if (v32 == v25)
          return result;
        goto LABEL_5;
      }
      v21 = *a4;
      if (!*a4)
        break;
      v22 = v31 + v15 + v21;
      v23 = (void (*)(char *, uint64_t, uint64_t))v34[4];
      v23(v33, v21 + v35 + v15, v7);
      swift_arrayInitWithTakeFrontToBack();
      result = ((uint64_t (*)(uint64_t, char *, uint64_t))v23)(v22, v33, v7);
      ++v16;
      v15 -= v30;
      if (v32 == v16)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1D54F4914(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v24;
  void (*v25)(char *, uint64_t);
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v31;
  unint64_t v32;
  char v33;
  void (*v34)(char *, uint64_t);
  unint64_t v35;
  unint64_t v36;
  uint64_t result;
  uint64_t v38;
  void (*v39)(char *, unint64_t, uint64_t);
  unint64_t v40;
  void (*v41)(char *, unint64_t, uint64_t);
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;

  v8 = sub_1D54FC590();
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v38 - v12;
  v42 = v14;
  v15 = *(_QWORD *)(v14 + 72);
  if (!v15)
  {
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  v16 = a1;
  if (a2 - a1 == 0x8000000000000000 && v15 == -1)
    goto LABEL_62;
  v17 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v15 == -1)
    goto LABEL_63;
  v18 = (uint64_t)(a2 - a1) / v15;
  v45 = a1;
  v44 = a4;
  v19 = v17 / v15;
  if (v18 >= v17 / v15)
  {
    if ((v19 & 0x8000000000000000) == 0)
    {
      v41 = (void (*)(char *, unint64_t, uint64_t))a1;
      v21 = v19 * v15;
      if (a4 < a2 || a2 + v21 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v40 = a4;
      v29 = a4 + v21;
      v43 = a4 + v21;
      v45 = a2;
      if (v21 >= 1 && (unint64_t)v41 < a2)
      {
        v31 = -v15;
        v39 = *(void (**)(char *, unint64_t, uint64_t))(v42 + 16);
        do
        {
          v32 = a3 + v31;
          v39(v13, v29 + v31, v8);
          sub_1D54FC518();
          v33 = sub_1D54FC530();
          v34 = *(void (**)(char *, uint64_t))(v42 + 8);
          v34(v11, v8);
          v34(v13, v8);
          if ((v33 & 1) != 0)
          {
            v35 = a2 + v31;
            if (a3 < a2 || v32 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != a2)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v45 += v31;
          }
          else
          {
            v36 = v43;
            v43 += v31;
            if (a3 < v36 || v32 >= v36)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != v36)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v35 = a2;
          }
          v29 = v43;
          if (v43 <= v40)
            break;
          a2 = v35;
          a3 += v31;
        }
        while (v35 > (unint64_t)v41);
      }
      goto LABEL_60;
    }
  }
  else if ((v18 & 0x8000000000000000) == 0)
  {
    v20 = v18 * v15;
    if (a4 < v16 || v16 + v20 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != v16)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v22 = a4 + v20;
    v43 = v22;
    if (v20 >= 1 && a2 < a3)
    {
      v41 = *(void (**)(char *, unint64_t, uint64_t))(v42 + 16);
      do
      {
        v41(v13, a2, v8);
        sub_1D54FC518();
        v24 = sub_1D54FC530();
        v25 = *(void (**)(char *, uint64_t))(v42 + 8);
        v25(v11, v8);
        v25(v13, v8);
        v26 = v45;
        if ((v24 & 1) != 0)
        {
          v27 = a2 + v15;
          if (v45 < a2 || v45 >= v27)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v45 == a2)
          {
            v26 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          v28 = v44 + v15;
          if (v45 < v44 || v45 >= v28)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v45 != v44)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v44 = v28;
          v27 = a2;
        }
        v45 = v26 + v15;
        if (v44 >= v22)
          break;
        a2 = v27;
      }
      while (v27 < a3);
    }
LABEL_60:
    sub_1D54F4E98(&v45, &v44, (uint64_t *)&v43);
    return 1;
  }
LABEL_64:
  result = sub_1D54FC8C0();
  __break(1u);
  return result;
}

char *sub_1D54F4DA0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A66C0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1D54F4E98(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = sub_1D54FC590();
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_14;
  if (v8 / v7 < 0)
  {
LABEL_15:
    result = sub_1D54FC8C0();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
    return swift_arrayInitWithTakeFrontToBack();
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront();
  return result;
}

char *sub_1D54F4FA4(uint64_t a1)
{
  return sub_1D54F4DA0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1D54F4FB8(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  _QWORD *v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v8 = sub_1D54FC590();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x1E0C80A78](v10);
  v15 = (char *)&v32 - v14;
  v39 = a4;
  v18 = *(_QWORD *)(a4 + 64);
  v17 = a4 + 64;
  v16 = v18;
  v37 = v17;
  v19 = -1 << *(_BYTE *)(v17 - 32);
  if (-v19 < 64)
    v20 = ~(-1 << -(char)v19);
  else
    v20 = -1;
  v21 = v20 & v16;
  if (!a2)
  {
    v22 = 0;
    a3 = 0;
LABEL_38:
    v31 = v37;
    *a1 = v39;
    a1[1] = v31;
    a1[2] = ~v19;
    a1[3] = v22;
    a1[4] = v21;
    return a3;
  }
  if (!a3)
  {
    v22 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v34 = -1 << *(_BYTE *)(v17 - 32);
  v35 = a1;
  v22 = 0;
  v23 = 0;
  v36 = (unint64_t)(63 - v19) >> 6;
  v33 = v36 - 1;
  v38 = a3;
  if (!v21)
    goto LABEL_9;
LABEL_8:
  v24 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  v25 = v24 | (v22 << 6);
  while (1)
  {
    ++v23;
    v29 = *(_QWORD *)(v9 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v12, *(_QWORD *)(v39 + 48) + v29 * v25, v8);
    v30 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v30(v15, v12, v8);
    result = ((uint64_t (*)(uint64_t, char *, uint64_t))v30)(a2, v15, v8);
    a3 = v38;
    if (v23 == v38)
      goto LABEL_37;
    a2 += v29;
    if (v21)
      goto LABEL_8;
LABEL_9:
    v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v26 >= v36)
      goto LABEL_32;
    v27 = *(_QWORD *)(v37 + 8 * v26);
    if (!v27)
      break;
LABEL_18:
    v21 = (v27 - 1) & v27;
    v25 = __clz(__rbit64(v27)) + (v26 << 6);
    v22 = v26;
  }
  v22 += 2;
  if (v26 + 1 >= v36)
  {
    v21 = 0;
    v22 = v26;
    goto LABEL_36;
  }
  v27 = *(_QWORD *)(v37 + 8 * v22);
  if (v27)
    goto LABEL_14;
  v28 = v26 + 2;
  if (v26 + 2 >= v36)
    goto LABEL_32;
  v27 = *(_QWORD *)(v37 + 8 * v28);
  if (v27)
    goto LABEL_17;
  v22 = v26 + 3;
  if (v26 + 3 >= v36)
  {
    v21 = 0;
    v22 = v26 + 2;
    goto LABEL_36;
  }
  v27 = *(_QWORD *)(v37 + 8 * v22);
  if (v27)
  {
LABEL_14:
    v26 = v22;
    goto LABEL_18;
  }
  v28 = v26 + 4;
  if (v26 + 4 >= v36)
  {
LABEL_32:
    v21 = 0;
LABEL_36:
    a3 = v23;
LABEL_37:
    v19 = v34;
    a1 = v35;
    goto LABEL_38;
  }
  v27 = *(_QWORD *)(v37 + 8 * v28);
  if (v27)
  {
LABEL_17:
    v26 = v28;
    goto LABEL_18;
  }
  while (1)
  {
    v26 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v26 >= v36)
    {
      v21 = 0;
      v22 = v33;
      goto LABEL_36;
    }
    v27 = *(_QWORD *)(v37 + 8 * v26);
    ++v28;
    if (v27)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1D54F5280(_QWORD *a1)
{
  return sub_1D54F2C84(0, a1[2], 0, a1);
}

uint64_t sub_1D54F5294()
{
  unint64_t v0;

  v0 = sub_1D54FC8F0();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

id sub_1D54F52DC(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _BYTE *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  id v20;
  id v21;
  unsigned __int8 v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  double v37;
  uint64_t v38;
  objc_class *v39;
  uint64_t v41;
  objc_super v42;
  id v43;

  v3 = sub_1D54FC4F4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v1;
  v8 = a1;
  sub_1D54FC500();
  (*(void (**)(_BYTE *, char *, uint64_t))(v4 + 32))(&v7[OBJC_IVAR___QLThumbnailExtension_identity], v6, v3);
  v9 = objc_msgSend(v8, sel_bundleIdentifier);
  v10 = sub_1D54FC668();
  v12 = v11;

  v13 = (uint64_t *)&v7[OBJC_IVAR___QLThumbnailExtension_generatorIdentifier];
  *v13 = v10;
  v13[1] = v12;
  v14 = objc_msgSend(v8, sel_bundleVersion);
  v15 = sub_1D54FC668();
  v17 = v16;

  v18 = (uint64_t *)&v7[OBJC_IVAR___QLThumbnailExtension_generatorVersion];
  *v18 = v15;
  v18[1] = v17;
  v19 = *MEMORY[0x1E0D83698];
  sub_1D54EA260(0, &qword_1ED9A6648);
  v20 = objc_msgSend(v8, sel_entitlementNamed_ofClass_, v19, swift_getObjCClassFromMetadata());
  sub_1D54FC7AC();
  swift_unknownObjectRelease();
  if ((swift_dynamicCast() & 1) != 0)
  {
    v21 = v43;
    v22 = objc_msgSend(v43, sel_BOOLValue);

  }
  else
  {
    v22 = 0;
  }
  v7[OBJC_IVAR___QLThumbnailExtension_externalResourcesAccessAllowed] = v22;
  v23 = sub_1D54FC668();
  v25 = sub_1D54EA5DC(v23, v24);
  swift_bridgeObjectRelease();
  v7[OBJC_IVAR___QLThumbnailExtension_supportsInteractiveThumbnailBadges] = v25 & 1;
  v26 = sub_1D54FC668();
  sub_1D54EA7B4(v26, v27);
  v29 = v28;
  swift_bridgeObjectRelease();
  if (v29)
  {
    v30 = sub_1D54FC8F0();
    swift_bridgeObjectRelease();
    if (v30 >= 3)
      v31 = 1;
    else
      v31 = v30;
  }
  else
  {
    v31 = 1;
  }
  v7[OBJC_IVAR___QLThumbnailExtension_supportedConcurrencyLevel] = v31;
  v32 = sub_1D54FC668();
  v34 = sub_1D54EA98C(v32, v33);
  v36 = v35;
  swift_bridgeObjectRelease();
  v37 = (double)v34;
  if ((v36 & 1) != 0)
    v37 = 0.0;
  *(double *)&v7[OBJC_IVAR___QLThumbnailExtension_minimumThumbnailDimension] = v37;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A6700);
  v38 = swift_allocObject();
  *(_DWORD *)(v38 + 24) = 0;
  *(_QWORD *)(v38 + 16) = 0;
  *(_QWORD *)&v7[OBJC_IVAR___QLThumbnailExtension_queueLock] = v38;

  v39 = (objc_class *)type metadata accessor for ThumbnailExtension(0);
  v42.receiver = v7;
  v42.super_class = v39;
  return objc_msgSendSuper2(&v42, sel_init);
}

uint64_t sub_1D54F55D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D54F5618(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D54F565C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1D54F5698()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 16);
  if (v1 != (void *)1)

  return swift_deallocObject();
}

void sub_1D54F56C4(id a1)
{
  if (a1 != (id)1)

}

id sub_1D54F56D4(id result)
{
  if (result != (id)1)
    return result;
  return result;
}

uint64_t sub_1D54F56E4(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_1D54F56F4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1D54F5718()
{
  uint64_t v0;

  return sub_1D54EBB14(*(_QWORD *)(v0 + 16));
}

void sub_1D54F572C(_QWORD *a1@<X8>)
{
  sub_1D54ECDB0(a1);
}

void traceSQL_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "SQL %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void traceSQL_cold_2(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[12];
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "tracingPrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  v9 = 2080;
  v10 = a3;
  OUTLINED_FUNCTION_7(&dword_1D54AE000, v5, v7, "SQL %@ %s", v8);

  OUTLINED_FUNCTION_1_0();
}

uint64_t __getUIImageClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return _UIGraphicsBeginImageContextWithOptions_cold_1(v0);
}

uint64_t _UIGraphicsBeginImageContextWithOptions_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __48__QLExtensionHostContextThumbnailOperation_main__block_invoke_cold_1(v0);
}

uint64_t sub_1D54FC434()
{
  return MEMORY[0x1E0CAE6E0]();
}

uint64_t sub_1D54FC440()
{
  return MEMORY[0x1E0CAE6F8]();
}

uint64_t sub_1D54FC44C()
{
  return MEMORY[0x1E0CAF8D8]();
}

uint64_t sub_1D54FC458()
{
  return MEMORY[0x1E0CAF8E8]();
}

uint64_t sub_1D54FC464()
{
  return MEMORY[0x1E0CAF8F8]();
}

uint64_t sub_1D54FC470()
{
  return MEMORY[0x1E0CAF900]();
}

uint64_t sub_1D54FC47C()
{
  return MEMORY[0x1E0CAF920]();
}

uint64_t sub_1D54FC488()
{
  return MEMORY[0x1E0CAF930]();
}

uint64_t sub_1D54FC494()
{
  return MEMORY[0x1E0CAF940]();
}

uint64_t sub_1D54FC4A0()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1D54FC4AC()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1D54FC4B8()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1D54FC4C4()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1D54FC4D0()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1D54FC4DC()
{
  return MEMORY[0x1E0CAA4C8]();
}

uint64_t sub_1D54FC4E8()
{
  return MEMORY[0x1E0CAA4E8]();
}

uint64_t sub_1D54FC4F4()
{
  return MEMORY[0x1E0CAA508]();
}

uint64_t sub_1D54FC500()
{
  return MEMORY[0x1E0CAA518]();
}

uint64_t sub_1D54FC50C()
{
  return MEMORY[0x1E0DF0190]();
}

uint64_t sub_1D54FC518()
{
  return MEMORY[0x1E0DF01C8]();
}

uint64_t sub_1D54FC524()
{
  return MEMORY[0x1E0DF01F8]();
}

uint64_t sub_1D54FC530()
{
  return MEMORY[0x1E0DF0218]();
}

uint64_t sub_1D54FC53C()
{
  return MEMORY[0x1E0DF0220]();
}

uint64_t sub_1D54FC548()
{
  return MEMORY[0x1E0DF0240]();
}

uint64_t sub_1D54FC554()
{
  return MEMORY[0x1E0DF0250]();
}

uint64_t sub_1D54FC560()
{
  return MEMORY[0x1E0DF0288]();
}

uint64_t sub_1D54FC56C()
{
  return MEMORY[0x1E0DF02C8]();
}

uint64_t sub_1D54FC578()
{
  return MEMORY[0x1E0DF0308]();
}

uint64_t sub_1D54FC584()
{
  return MEMORY[0x1E0DF0338]();
}

uint64_t sub_1D54FC590()
{
  return MEMORY[0x1E0DF0340]();
}

uint64_t sub_1D54FC59C()
{
  return MEMORY[0x1E0DF0380]();
}

uint64_t sub_1D54FC5A8()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1D54FC5B4()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1D54FC5C0()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1D54FC5CC()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1D54FC5D8()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1D54FC5E4()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1D54FC5F0()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1D54FC5FC()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1D54FC608()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1D54FC614()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1D54FC620()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1D54FC62C()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1D54FC638()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1D54FC644()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1D54FC650()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1D54FC65C()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1D54FC668()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1D54FC674()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1D54FC680()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1D54FC68C()
{
  return MEMORY[0x1E0DEA840]();
}

uint64_t sub_1D54FC698()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1D54FC6A4()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1D54FC6B0()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1D54FC6BC()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1D54FC6C8()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1D54FC6D4()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1D54FC6E0()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1D54FC6EC()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1D54FC6F8()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1D54FC704()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1D54FC710()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1D54FC71C()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1D54FC728()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1D54FC734()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1D54FC740()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1D54FC74C()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1D54FC758()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_1D54FC764()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1D54FC770()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1D54FC77C()
{
  return MEMORY[0x1E0C9B9E8]();
}

uint64_t sub_1D54FC788()
{
  return MEMORY[0x1E0DEFCF0]();
}

uint64_t sub_1D54FC794()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1D54FC7A0()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1D54FC7AC()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1D54FC7B8()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1D54FC7C4()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1D54FC7D0()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1D54FC7DC()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1D54FC7E8()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1D54FC7F4()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1D54FC800()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1D54FC80C()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1D54FC818()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1D54FC824()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1D54FC830()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1D54FC83C()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1D54FC848()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1D54FC854()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1D54FC860()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1D54FC86C()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1D54FC878()
{
  return MEMORY[0x1E0DECB18]();
}

uint64_t sub_1D54FC884()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1D54FC890()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1D54FC89C()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1D54FC8A8()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1D54FC8B4()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1D54FC8C0()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1D54FC8CC()
{
  return MEMORY[0x1E0CB25F0]();
}

uint64_t sub_1D54FC8D8()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1D54FC8E4()
{
  return MEMORY[0x1E0DECEF8]();
}

uint64_t sub_1D54FC8F0()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1D54FC8FC()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1D54FC908()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1D54FC914()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1D54FC920()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1D54FC92C()
{
  return MEMORY[0x1E0CB2628]();
}

uint64_t sub_1D54FC938()
{
  return MEMORY[0x1E0CB2640]();
}

uint64_t sub_1D54FC944()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1D54FC950()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1D54FC95C()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1D54FC968()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1D54FC974()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1D54FC980()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
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

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddCommonMode(CFRunLoopRef rl, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BE0](rl, mode);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1E0C98CB0](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98CC8](allocator, order, context);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D00](rl);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C990E0](string, buffer, maxBufLen);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C993C8](allocator, buffer, bufLen, isDirectory);
}

CFURLEnumeratorRef CFURLEnumeratorCreateForMountedVolumes(CFAllocatorRef alloc, CFURLEnumeratorOptions option, CFArrayRef propertyKeys)
{
  return (CFURLEnumeratorRef)MEMORY[0x1E0C99458](alloc, option, propertyKeys);
}

CFURLEnumeratorResult CFURLEnumeratorGetNextURL(CFURLEnumeratorRef enumerator, CFURLRef *url, CFErrorRef *error)
{
  return MEMORY[0x1E0C99468](enumerator, url, error);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C99490](url, resolveAgainstBase, buffer, maxBufLen);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1E0C9BB70](context);
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x1E0C9BF28](a1);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextBeginPath(CGContextRef c)
{
  MEMORY[0x1E0C9C000](c);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x1E0C9C028](c);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x1E0C9C4A0](c, red, green, blue, alpha);
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x1E0C9C4A8](c, red, green, blue, alpha);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x1E0C9C570](c);
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x1E0C9C5D8](provider);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C5F0](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CB80](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x1E0CBC2D8]();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC348](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9CC38](image);
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

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC5F0](isrc);
}

uint64_t CGPathCreateWithContinuousRoundedRect()
{
  return MEMORY[0x1E0C9D3B0]();
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t CacheDeleteRegisterInfoCallbacks()
{
  return MEMORY[0x1E0D09B98]();
}

uint64_t GSLibraryResolveDocumentId2()
{
  return MEMORY[0x1E0D25D20]();
}

uint64_t LICreateIconFromCachedBitmap()
{
  return MEMORY[0x1E0D4E3E8]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB2C00]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1E0CB2DA0](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x1E0CB2DA8](table, key, value);
}

void NSMapRemove(NSMapTable *table, const void *key)
{
  MEMORY[0x1E0CB2DC8](table, key);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t QLAdaptSizeInSize()
{
  return MEMORY[0x1E0D835F8]();
}

uint64_t QLAdaptSizeToRectWithRounding2()
{
  return MEMORY[0x1E0D83600]();
}

uint64_t QLCGImageRefPNGRepresentation()
{
  return MEMORY[0x1E0CD3310]();
}

uint64_t QLCreateCGImageWithDataAndFormat()
{
  return MEMORY[0x1E0CD3318]();
}

uint64_t QLDrawLockIcon()
{
  return MEMORY[0x1E0D83608]();
}

uint64_t QLGetCGPDFPageProxyRect()
{
  return MEMORY[0x1E0D83618]();
}

uint64_t QLGetDrawRectFromPageRectWithMinimumDimension()
{
  return MEMORY[0x1E0D83620]();
}

uint64_t QLImageCreateForDefaultThumbnailGenerationFromData()
{
  return MEMORY[0x1E0CD3348]();
}

uint64_t QLSInitLogging()
{
  return MEMORY[0x1E0D83640]();
}

uint64_t QLSThumbnailSizeIsSufficientForLowQuality()
{
  return MEMORY[0x1E0D83648]();
}

uint64_t QLTCreateCGContext()
{
  return MEMORY[0x1E0CD3350]();
}

uint64_t QLTGetDefaultCacheLocation()
{
  return MEMORY[0x1E0CD3358]();
}

uint64_t QLTInitLogging()
{
  return MEMORY[0x1E0CD3360]();
}

uint64_t QLThumbnailingImageIOCreateImageSourceFromData()
{
  return MEMORY[0x1E0D83650]();
}

uint64_t QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSource()
{
  return MEMORY[0x1E0D83658]();
}

uint64_t QLThumbnailingImageIOGetSizeFromImageSourceAtIndex()
{
  return MEMORY[0x1E0D83660]();
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

uint64_t _CFURLPromiseCopyPhysicalURL()
{
  return MEMORY[0x1E0C9A730]();
}

uint64_t _FPRestorePersona()
{
  return MEMORY[0x1E0CAAD38]();
}

uint64_t _QLSAppPreferencesIntValueForKey()
{
  return MEMORY[0x1E0D83668]();
}

uint64_t _QLThumbnailComputeBaselineFromData()
{
  return MEMORY[0x1E0D83670]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1E0C80C40]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
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

uint64_t _sqlite3_db_truncate()
{
  return MEMORY[0x1E0DE8530]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t container_create_or_lookup_path_for_current_user()
{
  return MEMORY[0x1E0C82818]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
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

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CB0](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CD8](data, offset, length);
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

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
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

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83378](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

uint64_t fp_current_or_default_log()
{
  return MEMORY[0x1E0CAAD68]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

ssize_t fsgetpath(char *a1, size_t a2, fsid_t *a3, uint64_t a4)
{
  return MEMORY[0x1E0C83550](a1, a2, a3, a4);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83610](a1, a2, a3, a4, *(_QWORD *)&a5);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
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

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x1E0C841B0](a1, *(_QWORD *)&a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int msync(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C84210](a1, a2, *(_QWORD *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
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

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
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

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
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

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

uint64_t rootless_check_datavault_flag()
{
  return MEMORY[0x1E0C85140]();
}

uint64_t rootless_convert_to_datavault()
{
  return MEMORY[0x1E0C85150]();
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1E0DE8598](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1E0DE85A8](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1E0DE85B0](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE8678](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8690](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1E0DE86A0](a1, *(_QWORD *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1E0DE8780](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1E0DE8790](*(_QWORD *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x1E0DE87D0](a1);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8820](a1);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x1E0DE8868](filename, ppDb);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE88B0](pStmt);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x1E0DE8998](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int sqlite3_trace_v2(sqlite3 *a1, unsigned int uMask, int (__cdecl *xCallback)(unsigned int, void *, void *, void *), void *pCtx)
{
  return MEMORY[0x1E0DE89F0](a1, *(_QWORD *)&uMask, xCallback, pCtx);
}

char *__cdecl sqlite3_vmprintf(const char *a1, va_list a2)
{
  return (char *)MEMORY[0x1E0DE8A88](a1, a2);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return MEMORY[0x1E0DE8A98](db, zDb, *(_QWORD *)&eMode, pnLog, pnCkpt);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
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

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

kern_return_t vm_copy(vm_map_t target_task, vm_address_t source_address, vm_size_t size, vm_address_t dest_address)
{
  return MEMORY[0x1E0C85A90](*(_QWORD *)&target_task, source_address, size, dest_address);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C85A98](*(_QWORD *)&target_task, address, size);
}

uint64_t voucher_process_can_use_arbitrary_personas()
{
  return MEMORY[0x1E0C85B70]();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

