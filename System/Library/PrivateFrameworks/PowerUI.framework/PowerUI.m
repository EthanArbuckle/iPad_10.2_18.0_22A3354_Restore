void sub_215A74278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_215A7919C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  uint64_t v36;

  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 200), 8);
  _Block_object_dispose((const void *)(v36 - 152), 8);
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

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_215A7DEDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  char a67;
  char a71;

  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Block_object_dispose(&STACK[0x240], 8);
  _Block_object_dispose(&STACK[0x270], 8);
  _Block_object_dispose(&STACK[0x2A0], 8);
  _Block_object_dispose(&STACK[0x2D0], 8);
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

void sub_215A7F588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62,uint64_t a63)
{
  char a66;
  char a70;
  uint64_t v70;

  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a62, 8);
  _Block_object_dispose(&a66, 8);
  _Block_object_dispose(&a70, 8);
  _Block_object_dispose(&STACK[0x208], 8);
  _Block_object_dispose((const void *)(v70 - 232), 8);
  _Block_object_dispose((const void *)(v70 - 200), 8);
  _Block_object_dispose((const void *)(v70 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_215A8019C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a64;
  char a68;
  uint64_t v68;

  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a48, 8);
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose(&a56, 8);
  _Block_object_dispose(&a60, 8);
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&a68, 8);
  _Block_object_dispose((const void *)(v68 - 248), 8);
  _Block_object_dispose((const void *)(v68 - 216), 8);
  _Block_object_dispose((const void *)(v68 - 184), 8);
  _Block_object_dispose((const void *)(v68 - 152), 8);
  _Block_object_dispose((const void *)(v68 - 120), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_5_0(void *a1, const char *a2)
{
  return objc_msgSend(a1, "UTF8String");
}

void sub_215A80D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_215A8123C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215A813C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215A87C70(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_215A89D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
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

void sub_215A8A9A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 216), 8);
  _Block_object_dispose((const void *)(v34 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_215A8B1BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  uint64_t v55;

  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose((const void *)(v55 - 240), 8);
  _Block_object_dispose((const void *)(v55 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_215A8BEEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a65;
  char a71;
  uint64_t v71;

  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x220], 8);
  _Block_object_dispose((const void *)(v71 - 240), 8);
  _Block_object_dispose((const void *)(v71 - 208), 8);
  _Block_object_dispose((const void *)(v71 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_215A8CF84(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_215A8D324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_215A8EC7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  uint64_t v41;

  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 240), 8);
  _Unwind_Resume(a1);
}

void sub_215A8FA24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215A8FE78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_1(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

char *OUTLINED_FUNCTION_2_1()
{
  mach_error_t v0;

  return mach_error_string(v0);
}

void sub_215A9215C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215A92370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
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

void sub_215A92670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_215A92A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215A92C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215A92ECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_215A93254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 168), 8);
  _Block_object_dispose((const void *)(v34 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_215A93650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_215A93BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_215A93E38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_215A94160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_215A943A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_215A94520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215A946B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215A94840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215A94A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_215A94C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_215A94F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_215A951E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_215A954A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 184), 8);
  _Block_object_dispose((const void *)(v32 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_215A9581C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_215A9598C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215A95B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_215A95F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_215A9623C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_215A96420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_215A96624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_215A96D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_215A9713C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  uint64_t v0;

  return v0;
}

id OUTLINED_FUNCTION_5_1(uint64_t a1, void *a2)
{
  return a2;
}

id OUTLINED_FUNCTION_6_1(uint64_t a1, void *a2)
{
  return a2;
}

id OUTLINED_FUNCTION_9(uint64_t a1, void *a2)
{
  return a2;
}

id OUTLINED_FUNCTION_10(uint64_t a1, void *a2)
{
  return a2;
}

void sub_215A9BE18(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x258], 8);
  _Block_object_dispose(&STACK[0x278], 8);
  _Block_object_dispose(&STACK[0x340], 8);
  _Block_object_dispose(&STACK[0x360], 8);
  _Unwind_Resume(a1);
}

void sub_215A9D750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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

void sub_215A9DA38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_215A9DC44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_215A9E10C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_215A9E3CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_215A9E6A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_215A9EB0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215A9EE30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215A9F044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215A9FBA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_215AA5728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id a36)
{
  id *v36;

  objc_destroyWeak(v36);
  objc_destroyWeak(location);
  objc_destroyWeak(&a36);
  _Unwind_Resume(a1);
}

void sessionEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  void (*v22)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *);
  uint8_t v23[16];
  _BYTE buf[12];
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (!v7)
    sessionEventCallback_cold_1();
  v8 = v7;
  objc_msgSend(v7, "accessoryLog");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v10;
    v25 = 2112;
    v26 = v11;
    _os_log_impl(&dword_215A71000, v9, OS_LOG_TYPE_DEFAULT, "BT SessionEvent: %@, %@", buf, 0x16u);

  }
  if (a3 | a2)
  {
    if ((_DWORD)a2 || (_DWORD)a3 != 1)
    {
      objc_msgSend(v8, "accessoryLog");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if ((a2 & 0xFFFFFFFE) == 2)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_215A71000, v19, OS_LOG_TYPE_DEFAULT, "The current BT session terminated, try to attach to the next one.", buf, 2u);
        }

        objc_msgSend(v8, "attachToBluetoothSession");
      }
      else
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          sessionEventCallback_cold_3(a2, v19);

      }
    }
    else
    {
      objc_msgSend(v8, "accessoryLog");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sessionEventCallback_cold_2();

      v13 = dispatch_walltime(0, 60000000000);
      objc_msgSend(v8, "queue");
      v14 = objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __sessionEventCallback_block_invoke;
      v20[3] = &unk_24D3FB7B0;
      v21 = v8;
      dispatch_after(v13, v14, v20);

    }
  }
  else
  {
    objc_msgSend(v8, "accessoryLog");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, v15, OS_LOG_TYPE_DEFAULT, "BT Session connected successfully.", buf, 2u);
    }

    objc_msgSend(v8, "setSession:", a1);
    *(_QWORD *)buf = 0;
    objc_msgSend(v8, "session");
    BTAccessoryManagerGetDefault();
    objc_msgSend(v8, "accessoryLog");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_215A71000, v16, OS_LOG_TYPE_DEFAULT, "Set up connection callback", v23, 2u);
    }

    objc_msgSend(v8, "session");
    BTServiceAddCallbacksWithFilter();
    objc_msgSend(v8, "accessoryLog");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_215A71000, v17, OS_LOG_TYPE_DEFAULT, "Set up message receiving callback", v23, 2u);
    }

    *(_QWORD *)v23 = incomingCustomMessageCallback;
    BTAccessoryManagerRegisterCustomMessageClient();
    v22 = incomingTimeSeriesMessageCallback;
    BTAccessoryManagerRegisterCustomMessageClient();
  }

}

void btConnectionUpdateCallback(uint64_t a1, uint64_t a2, int a3, int a4, int a5, void *a6)
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  double v22;
  _BOOL4 v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  dispatch_time_t v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id WeakRetained;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  _QWORD block[4];
  id v50;
  uint64_t v51;
  uint8_t buf[4];
  NSObject *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  if (!v10)
    btConnectionUpdateCallback_cold_1();
  v11 = v10;
  if ((a4 - 13) >= 0xFFFFFFFE && !a5)
  {
    v12 = (void *)os_transaction_create();
    objc_msgSend(v11, "btHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "getAddressStringForDevice:", a1);
    v14 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "accessoryLog");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v14;
      _os_log_impl(&dword_215A71000, v15, OS_LOG_TYPE_DEFAULT, "New connection callback. Address: %@", buf, 0xCu);
    }

    objc_msgSend(v11, "btHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "protocolForDevice:", a1);

    if (v17)
    {
      if (v17 == 255)
      {
        objc_msgSend(v11, "accessoryLog");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_215A71000, v18, OS_LOG_TYPE_DEFAULT, "Device is not supported", buf, 2u);
        }
      }
      else if (a3 || a4 != 11)
      {
        if (a3 != 1)
        {
LABEL_45:

          goto LABEL_46;
        }
        objc_msgSend(v11, "accessoryLog");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v53 = v14;
          _os_log_impl(&dword_215A71000, v33, OS_LOG_TYPE_DEFAULT, "Supported device (%@) was disconnected.", buf, 0xCu);
        }

        objc_msgSend(v11, "walletMonitor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stopMonitoring");

        if (_os_feature_enabled_impl() && (objc_msgSend(v11, "firstNotificationDisplayed") & 1) == 0)
        {
          objc_msgSend(v11, "returnAccessoryStatusForDevice:", v14);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v35, "currentState") == 1)
          {
            objc_msgSend(v35, "lastSentDate");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v36 == 0;

            if (!v37)
            {
              objc_initWeak((id *)buf, v11);
              +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "btHandler");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "firstUseNotificationRequestForDeviceType:", objc_msgSend(v39, "productIDForDevice:", a1));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "postNotificationWithRequest:", v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              WeakRetained = objc_loadWeakRetained((id *)buf);
              v43 = WeakRetained;
              if (v41)
              {
                objc_msgSend(WeakRetained, "accessoryLog");
                v44 = objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                  btConnectionUpdateCallback_cold_2();

              }
              else
              {
                objc_msgSend(WeakRetained, "setFirstNotificationDisplayed:", 1);

                +[PowerUISmartChargeUtilities setNumber:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setNumber:forPreferenceKey:inDomain:", &unk_24D443870, CFSTR("firstNoteDisplayed"), CFSTR("com.apple.smartcharging.topoffprotection.audioaccessories"));
              }

              objc_destroyWeak((id *)buf);
            }
          }

        }
        objc_msgSend(v11, "latestAnalyticsForDevice");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "objectForKeyedSubscript:", v14);
        v18 = objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v18 = v18;
          AnalyticsSendEventLazy();
          objc_msgSend(v11, "accessoryLog");
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v53 = v18;
            _os_log_impl(&dword_215A71000, v47, OS_LOG_TYPE_DEFAULT, "Reported prediction metrics to CoreAnalytics %@", buf, 0xCu);
          }

          objc_msgSend(v11, "latestAnalyticsForDevice");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setObject:forKeyedSubscript:", 0, v14);

        }
      }
      else
      {
        objc_msgSend(v11, "btConnectionSemaphore");
        v19 = objc_claimAutoreleasedReturnValue();
        dispatch_semaphore_signal(v19);

        objc_msgSend(v11, "returnAccessoryStatusForDevice:", v14);
        v18 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject lastTimeseriesDate](v18, "lastTimeseriesDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSinceDate:", v21);
        v23 = v22 > 86400.0;

        if (v23)
          objc_msgSend(v11, "timeSeriesForDevice:", v14);
        objc_msgSend(v11, "persistentlyHandleSeeingDevice:", v14);
        objc_msgSend(v11, "predictor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isSufficientDataAvailableForEngagementForDevice:", v14);
        if (v17 == 3)
          v26 = 1;
        else
          v26 = v25;

        if (v26)
        {
          objc_msgSend(v11, "walletMonitor");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "startMonitoring");

          objc_msgSend(v11, "acceptMessageFromRightBudForDevice");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setValue:forKey:", MEMORY[0x24BDBD1C8], v14);

          objc_msgSend(v11, "acceptMessageFromLeftBudForDevice");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setValue:forKey:", MEMORY[0x24BDBD1C8], v14);

          objc_msgSend(v11, "accessoryLog");
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v53 = v14;
            _os_log_impl(&dword_215A71000, v30, OS_LOG_TYPE_DEFAULT, "Supported device (%@) was connected, queue update.", buf, 0xCu);
          }

          v31 = dispatch_walltime(0, 1000000000);
          objc_msgSend(v11, "queue");
          v32 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __btConnectionUpdateCallback_block_invoke;
          block[3] = &unk_24D3FC6E0;
          v50 = v11;
          v51 = a1;
          dispatch_after(v31, v32, block);

        }
        else
        {
          objc_msgSend(v11, "accessoryLog");
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v53 = v14;
            _os_log_impl(&dword_215A71000, v45, OS_LOG_TYPE_DEFAULT, "Supported device (%@) was connected, but device history is not old enough or there were not enough connections. Do not send prediction.", buf, 0xCu);
          }

          -[NSObject setManagerState:](v18, "setManagerState:", 10);
        }
      }
    }
    else
    {
      objc_msgSend(v11, "accessoryLog");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        btConnectionUpdateCallback_cold_3();
    }

    goto LABEL_45;
  }
LABEL_46:

}

void sub_215AA66F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void incomingCustomMessageCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  unsigned __int8 v38;
  __int16 v39;
  __int16 v40;
  unsigned __int16 v41;
  int v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v10 = (void *)os_transaction_create();
  v11 = a6;
  if (!v11)
    incomingCustomMessageCallback_cold_1();
  v12 = v11;
  objc_msgSend(v11, "btHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "getAddressStringForDevice:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 == 11)
  {
    v42 = 0;
    v41 = 0;
    v40 = 0;
    v39 = 0;
    v38 = 0;
    decodeAccessoryMessage(a4, (_WORD *)&v42 + 1, &v42, &v41, (_BYTE *)&v40 + 1, &v40, (_BYTE *)&v39 + 1, &v39, &v38);
    objc_msgSend(v12, "accessoryLog");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v36 = v10;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", HIWORD(v42));
      v37 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", (unsigned __int16)v42);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v41);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", HIBYTE(v40));
      v35 = a2;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v40);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", HIBYTE(v39));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v39);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v38);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138414338;
      v44 = v37;
      v45 = 2112;
      v46 = v16;
      v47 = 2112;
      v48 = v17;
      v49 = 2112;
      v50 = v18;
      v51 = 2112;
      v52 = v19;
      v53 = 2112;
      v54 = v20;
      v55 = 2112;
      v56 = v21;
      v57 = 2112;
      v58 = v22;
      v59 = 2112;
      v60 = v23;
      _os_log_impl(&dword_215A71000, v15, OS_LOG_TYPE_DEFAULT, "Received a message from device '%@' - successRatio: %@ - timeSpentAtLowerSoC: %@ - timeSpentAtHigherSoC: %@ - engagementEventsSinceLastReport: %@ - underchargeEventsSinceLastReport: %@ - chargingEventsSinceLastReport: %@ - budSocAtLastEngagement: %@ - side: %@", buf, 0x5Cu);

      v10 = v36;
      a2 = v35;

      v14 = v37;
    }

    if (v38 == 2)
    {
      objc_msgSend(v12, "acceptMessageFromLeftBudForDevice");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v38 != 1)
      {
        v27 = 0;
LABEL_23:

        goto LABEL_24;
      }
      objc_msgSend(v12, "acceptMessageFromRightBudForDevice");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v26 = v24;
    objc_msgSend(v24, "objectForKeyedSubscript:", v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27 || !objc_msgSend(v27, "BOOLValue"))
      goto LABEL_23;
    objc_msgSend(v12, "btHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nameForProductID:", objc_msgSend(v28, "productIDForDevice:", a2));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    WORD1(v33) = HIWORD(v42);
    LOBYTE(v33) = v39;
    objc_msgSend(v12, "reportSessionMetricsForSide:withTimeSpendAtLowerSoC:timeSpentAtHigherSoC:engagementEventsSinceLastReport:underchargeEventsSinceLastReport:chargingEventsSinceLastReport:budSocAtLastEngagement:successRatio:deviceType:", v38, (unsigned __int16)v42, v41, HIBYTE(v40), v40, HIBYTE(v39), v33, v29);
    if (v38 == 2)
    {
      objc_msgSend(v12, "acceptMessageFromLeftBudForDevice");
      v31 = objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], v14);
    }
    else
    {
      if (v38 != 1)
        goto LABEL_22;
      objc_msgSend(v12, "acceptMessageFromRightBudForDevice");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], v14);

      if (!+[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild"))
        goto LABEL_22;
      WORD1(v34) = HIWORD(v42);
      LOBYTE(v34) = v39;
      objc_msgSend(v12, "recordBudMetricsLocallyForDevice:withTimeSpendAtLowerSoC:timeSpentAtHigherSoC:engagementEventsSinceLastReport:underchargeEventsSinceLastReport:chargingEventsSinceLastReport:budSocAtLastEngagement:successRatio:", v14, (unsigned __int16)v42, v41, HIBYTE(v40), v40, HIBYTE(v39), v34);
      objc_msgSend(v12, "accessoryLog");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, v31, OS_LOG_TYPE_DEFAULT, "Internal device, write bud metrics to defaults.", buf, 2u);
      }
    }

LABEL_22:
    objc_msgSend(v12, "returnAccessoryStatusForDevice:", v14);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setMinutesSavedSinceLastReport:", (unsigned __int16)v42);
    objc_msgSend(v32, "setUnderchargesSinceLastReport:", v40);
    objc_msgSend(v32, "setChargingEventsSinceLastReport:", HIBYTE(v39));
    objc_msgSend(v32, "setManagerState:", 7);

    goto LABEL_23;
  }
  objc_msgSend(v12, "accessoryLog");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    incomingCustomMessageCallback_cold_2(a5, (uint64_t)v14, v25);

LABEL_24:
}

void incomingTimeSeriesMessageCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  unsigned int v19;
  unsigned int v20;
  NSObject *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint8_t *v25;
  void *v26;
  NSObject *v27;
  unsigned int v28;
  unint64_t v29;
  int v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  unsigned int v35;
  unsigned int v36;
  void *v37;
  uint8_t v38[4];
  _BYTE v39[14];
  __int16 v40;
  unsigned int v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  int v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v10 = (void *)os_transaction_create();
  v11 = a6;
  if (!v11)
    incomingTimeSeriesMessageCallback_cold_1();
  v12 = v11;
  objc_msgSend(v11, "btHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "getAddressStringForDevice:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "accessoryLog");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v47 = a5;
    v48 = 2112;
    v49 = v14;
    _os_log_impl(&dword_215A71000, v15, OS_LOG_TYPE_DEFAULT, "Received time series message of size %zu from device '%@'.", buf, 0x16u);
  }

  if (a5 == 983)
  {
    bzero(buf, 0x620uLL);
    v16 = 0;
    v17 = a4 + 9;
    do
    {
      v18 = &buf[v16];
      *(_QWORD *)v18 = *(_QWORD *)(v17 - 9);
      *((_WORD *)v18 + 4) = *(_WORD *)(v17 - 1);
      v16 += 16;
      v17 += 10;
    }
    while (v16 != 1568);
    v19 = *(unsigned __int16 *)(a4 + 980);
    v20 = *(unsigned __int8 *)(a4 + 982);
    objc_msgSend(v12, "accessoryLog");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v38 = 138413058;
      *(_QWORD *)v39 = v14;
      *(_WORD *)&v39[8] = 1024;
      *(_DWORD *)&v39[10] = v20;
      v40 = 1024;
      v41 = v19;
      v42 = 1024;
      LODWORD(v43) = 98;
      _os_log_impl(&dword_215A71000, v21, OS_LOG_TYPE_DEFAULT, "Received time series data for device '%@' (bud side: %u, FW version: %u, #records: %u):", v38, 0x1Eu);
    }

    objc_msgSend(v12, "budSideToRecord");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "unsignedShortValue");

    if (v23 == v20)
    {
      v35 = v19;
      v36 = v20;
      v37 = v10;
      v24 = 0;
      v25 = buf;
      do
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)*(unint64_t *)v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "accessoryLog");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = v25[8];
          v29 = *(_QWORD *)v25;
          v30 = v25[9];
          *(_DWORD *)v38 = 67110146;
          *(_DWORD *)v39 = v24;
          *(_WORD *)&v39[4] = 2112;
          *(_QWORD *)&v39[6] = v26;
          v40 = 1024;
          v41 = v28;
          v42 = 2048;
          v43 = v29;
          v44 = 1024;
          v45 = v30;
          _os_log_impl(&dword_215A71000, v27, OS_LOG_TYPE_DEFAULT, "%d: %@: eventData: %u - timestamp: %llu - offset: %u", v38, 0x28u);
        }

        ++v24;
        v25 += 16;
      }
      while (v24 != 98);
      objc_msgSend(v12, "accessoryLog");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addTimeSeriesDataToStream:withSide:withFirmwareVersion:withLog:", buf, v36, v35, v31);

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v32 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "persistentlySetLastTimeseriesDate:forDevice:", v32, v14);
      v10 = v37;
    }
    else
    {
      objc_msgSend(v12, "accessoryLog");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "budSideToRecord");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v38 = 67109378;
        *(_DWORD *)v39 = v20;
        *(_WORD *)&v39[4] = 2112;
        *(_QWORD *)&v39[6] = v34;
        _os_log_impl(&dword_215A71000, v32, OS_LOG_TYPE_DEFAULT, "Bud side in message (%hhu) does not match bud side to record (%@), skip this message.", v38, 0x12u);

      }
    }

  }
  else
  {
    objc_msgSend(v12, "accessoryLog");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      incomingTimeSeriesMessageCallback_cold_2();

  }
}

uint64_t __sessionEventCallback_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "attachToBluetoothSession");
}

uint64_t __btConnectionUpdateCallback_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "runUpdateForDevice:withHash:asInitialUpdate:", *(_QWORD *)(a1 + 40), 0, 1);
}

id __btConnectionUpdateCallback_block_invoke_265(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t decodeAccessoryMessage(uint64_t result, _WORD *a2, _WORD *a3, _WORD *a4, _BYTE *a5, _BYTE *a6, _BYTE *a7, _BYTE *a8, _BYTE *a9)
{
  *a2 = *(_WORD *)result;
  *a3 = *(_WORD *)(result + 2);
  *a4 = *(_WORD *)(result + 4);
  *a5 = *(_BYTE *)(result + 6);
  *a6 = *(_BYTE *)(result + 7);
  *a7 = *(_BYTE *)(result + 8);
  *a8 = *(_BYTE *)(result + 9);
  *a9 = *(_BYTE *)(result + 10);
  return result;
}

void sub_215AA76A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

_DWORD *prepare9ByteMessage(_DWORD *result, int a2, int a3)
{
  char v3;

  if (a3 != 1)
  {
    if (a3 == 3)
      v3 = 2;
    else
      v3 = a3 == 2;
    *(_BYTE *)result = v3;
    result = (_DWORD *)((char *)result + 1);
  }
  *result = a2;
  return result;
}

void sub_215AAA9E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
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

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_215AAE98C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id *location)
{
  uint64_t v17;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v17 - 200));
  _Unwind_Resume(a1);
}

void sub_215AAEA8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
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

void OUTLINED_FUNCTION_9_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

double OUTLINED_FUNCTION_11()
{
  double v0;

  return v0;
}

void OUTLINED_FUNCTION_13(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_14()
{
  uint64_t v0;

  return v0;
}

void sub_215ACC4DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void sub_215ACF8E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a57, 8);
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

void sub_215AD134C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a57, 8);
  _Unwind_Resume(a1);
}

void sub_215AD1E24(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_215AD2488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_215AD2E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void __67__durationModel_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  durationModel *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[durationModel initWithMLModel:]([durationModel alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __58__durationModel_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  durationModelOutput *v6;
  void *v7;
  durationModelOutput *v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD, durationModelOutput *);
  id v11;

  v11 = a2;
  if (v11)
  {
    v5 = a3;
    v6 = [durationModelOutput alloc];
    objc_msgSend(v11, "featureValueForName:", CFSTR("duration_pred"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v8 = -[durationModelOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void (**)(uint64_t, _QWORD, durationModelOutput *))(v9 + 16);
    v8 = a3;
    v10(v9, 0, v8);
  }

}

void __66__durationModel_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  durationModelOutput *v6;
  void *v7;
  durationModelOutput *v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD, durationModelOutput *);
  id v11;

  v11 = a2;
  if (v11)
  {
    v5 = a3;
    v6 = [durationModelOutput alloc];
    objc_msgSend(v11, "featureValueForName:", CFSTR("duration_pred"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v8 = -[durationModelOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void (**)(uint64_t, _QWORD, durationModelOutput *))(v9 + 16);
    v8 = a3;
    v10(v9, 0, v8);
  }

}

void __64__deoc_model_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  deoc_model *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[deoc_model initWithMLModel:]([deoc_model alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __55__deoc_model_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  deoc_modelOutput *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  deoc_modelOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, deoc_modelOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [deoc_modelOutput alloc];
    objc_msgSend(v14, "featureValueForName:", CFSTR("next_drain_is_significant"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "int64Value");
    objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[deoc_modelOutput initWithNext_drain_is_significant:classProbability:](v6, "initWithNext_drain_is_significant:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, deoc_modelOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void __63__deoc_model_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  deoc_modelOutput *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  deoc_modelOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, deoc_modelOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [deoc_modelOutput alloc];
    objc_msgSend(v14, "featureValueForName:", CFSTR("next_drain_is_significant"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "int64Value");
    objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[deoc_modelOutput initWithNext_drain_is_significant:classProbability:](v6, "initWithNext_drain_is_significant:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, deoc_modelOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void __65__engageModel_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  engageModel *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[engageModel initWithMLModel:]([engageModel alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __56__engageModel_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  engageModelOutput *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  engageModelOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, engageModelOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [engageModelOutput alloc];
    objc_msgSend(v14, "featureValueForName:", CFSTR("engage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "int64Value");
    objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[engageModelOutput initWithEngage:classProbability:](v6, "initWithEngage:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, engageModelOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void __64__engageModel_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  engageModelOutput *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  engageModelOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, engageModelOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [engageModelOutput alloc];
    objc_msgSend(v14, "featureValueForName:", CFSTR("engage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "int64Value");
    objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[engageModelOutput initWithEngage:classProbability:](v6, "initWithEngage:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, engageModelOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void __65__easy_engage_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  easy_engage *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[easy_engage initWithMLModel:]([easy_engage alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __56__easy_engage_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  easy_engageOutput *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  easy_engageOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, easy_engageOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [easy_engageOutput alloc];
    objc_msgSend(v14, "featureValueForName:", CFSTR("engage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "int64Value");
    objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[easy_engageOutput initWithEngage:classProbability:](v6, "initWithEngage:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, easy_engageOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void __64__easy_engage_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  easy_engageOutput *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  easy_engageOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, easy_engageOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [easy_engageOutput alloc];
    objc_msgSend(v14, "featureValueForName:", CFSTR("engage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "int64Value");
    objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[easy_engageOutput initWithEngage:classProbability:](v6, "initWithEngage:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, easy_engageOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void __65__deoc_series_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  deoc_series *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[deoc_series initWithMLModel:]([deoc_series alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __56__deoc_series_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  deoc_seriesOutput *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  deoc_seriesOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, deoc_seriesOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [deoc_seriesOutput alloc];
    objc_msgSend(v14, "featureValueForName:", CFSTR("target"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "int64Value");
    objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[deoc_seriesOutput initWithTarget:classProbability:](v6, "initWithTarget:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, deoc_seriesOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void __64__deoc_series_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  deoc_seriesOutput *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  deoc_seriesOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, deoc_seriesOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [deoc_seriesOutput alloc];
    objc_msgSend(v14, "featureValueForName:", CFSTR("target"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "int64Value");
    objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[deoc_seriesOutput initWithTarget:classProbability:](v6, "initWithTarget:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, deoc_seriesOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void __67__base_duration_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  base_duration *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[base_duration initWithMLModel:]([base_duration alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __58__base_duration_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  base_durationOutput *v6;
  void *v7;
  base_durationOutput *v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD, base_durationOutput *);
  id v11;

  v11 = a2;
  if (v11)
  {
    v5 = a3;
    v6 = [base_durationOutput alloc];
    objc_msgSend(v11, "featureValueForName:", CFSTR("duration_pred"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v8 = -[base_durationOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void (**)(uint64_t, _QWORD, base_durationOutput *))(v9 + 16);
    v8 = a3;
    v10(v9, 0, v8);
  }

}

void __66__base_duration_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  base_durationOutput *v6;
  void *v7;
  base_durationOutput *v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD, base_durationOutput *);
  id v11;

  v11 = a2;
  if (v11)
  {
    v5 = a3;
    v6 = [base_durationOutput alloc];
    objc_msgSend(v11, "featureValueForName:", CFSTR("duration_pred"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v8 = -[base_durationOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void (**)(uint64_t, _QWORD, base_durationOutput *))(v9 + 16);
    v8 = a3;
    v10(v9, 0, v8);
  }

}

void __90__deoc_two_stage_sequential_low_second_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  deoc_two_stage_sequential_low_second *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[deoc_two_stage_sequential_low_second initWithMLModel:]([deoc_two_stage_sequential_low_second alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __81__deoc_two_stage_sequential_low_second_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  deoc_two_stage_sequential_low_secondOutput *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  deoc_two_stage_sequential_low_secondOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, deoc_two_stage_sequential_low_secondOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [deoc_two_stage_sequential_low_secondOutput alloc];
    objc_msgSend(v14, "featureValueForName:", CFSTR("target"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "int64Value");
    objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[deoc_two_stage_sequential_low_secondOutput initWithTarget:classProbability:](v6, "initWithTarget:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, deoc_two_stage_sequential_low_secondOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void __89__deoc_two_stage_sequential_low_second_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  deoc_two_stage_sequential_low_secondOutput *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  deoc_two_stage_sequential_low_secondOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, deoc_two_stage_sequential_low_secondOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [deoc_two_stage_sequential_low_secondOutput alloc];
    objc_msgSend(v14, "featureValueForName:", CFSTR("target"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "int64Value");
    objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[deoc_two_stage_sequential_low_secondOutput initWithTarget:classProbability:](v6, "initWithTarget:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, deoc_two_stage_sequential_low_secondOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void __68__deoc_iphone_80_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  deoc_iphone_80 *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[deoc_iphone_80 initWithMLModel:]([deoc_iphone_80 alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __59__deoc_iphone_80_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  deoc_iphone_80Output *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  deoc_iphone_80Output *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, deoc_iphone_80Output *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [deoc_iphone_80Output alloc];
    objc_msgSend(v14, "featureValueForName:", CFSTR("target"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "int64Value");
    objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[deoc_iphone_80Output initWithTarget:classProbability:](v6, "initWithTarget:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, deoc_iphone_80Output *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void __67__deoc_iphone_80_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  deoc_iphone_80Output *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  deoc_iphone_80Output *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, deoc_iphone_80Output *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [deoc_iphone_80Output alloc];
    objc_msgSend(v14, "featureValueForName:", CFSTR("target"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "int64Value");
    objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[deoc_iphone_80Output initWithTarget:classProbability:](v6, "initWithTarget:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, deoc_iphone_80Output *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void __64__deoc_ultra_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  deoc_ultra *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[deoc_ultra initWithMLModel:]([deoc_ultra alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __55__deoc_ultra_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  deoc_ultraOutput *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  deoc_ultraOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, deoc_ultraOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [deoc_ultraOutput alloc];
    objc_msgSend(v14, "featureValueForName:", CFSTR("target"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "int64Value");
    objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[deoc_ultraOutput initWithTarget:classProbability:](v6, "initWithTarget:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, deoc_ultraOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void __63__deoc_ultra_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  deoc_ultraOutput *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  deoc_ultraOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, deoc_ultraOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [deoc_ultraOutput alloc];
    objc_msgSend(v14, "featureValueForName:", CFSTR("target"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "int64Value");
    objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[deoc_ultraOutput initWithTarget:classProbability:](v6, "initWithTarget:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, deoc_ultraOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void __67__long_duration_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  long_duration *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[long_duration initWithMLModel:]([long_duration alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __58__long_duration_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  long_durationOutput *v6;
  void *v7;
  long_durationOutput *v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD, long_durationOutput *);
  id v11;

  v11 = a2;
  if (v11)
  {
    v5 = a3;
    v6 = [long_durationOutput alloc];
    objc_msgSend(v11, "featureValueForName:", CFSTR("duration_pred"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v8 = -[long_durationOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void (**)(uint64_t, _QWORD, long_durationOutput *))(v9 + 16);
    v8 = a3;
    v10(v9, 0, v8);
  }

}

void __66__long_duration_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  long_durationOutput *v6;
  void *v7;
  long_durationOutput *v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD, long_durationOutput *);
  id v11;

  v11 = a2;
  if (v11)
  {
    v5 = a3;
    v6 = [long_durationOutput alloc];
    objc_msgSend(v11, "featureValueForName:", CFSTR("duration_pred"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v8 = -[long_durationOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void (**)(uint64_t, _QWORD, long_durationOutput *))(v9 + 16);
    v8 = a3;
    v10(v9, 0, v8);
  }

}

void __68__deoc_iphone_95_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  deoc_iphone_95 *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[deoc_iphone_95 initWithMLModel:]([deoc_iphone_95 alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __59__deoc_iphone_95_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  deoc_iphone_95Output *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  deoc_iphone_95Output *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, deoc_iphone_95Output *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [deoc_iphone_95Output alloc];
    objc_msgSend(v14, "featureValueForName:", CFSTR("target"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "int64Value");
    objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[deoc_iphone_95Output initWithTarget:classProbability:](v6, "initWithTarget:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, deoc_iphone_95Output *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void __67__deoc_iphone_95_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  deoc_iphone_95Output *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  deoc_iphone_95Output *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, deoc_iphone_95Output *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [deoc_iphone_95Output alloc];
    objc_msgSend(v14, "featureValueForName:", CFSTR("target"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "int64Value");
    objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[deoc_iphone_95Output initWithTarget:classProbability:](v6, "initWithTarget:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, deoc_iphone_95Output *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void __65__base_engage_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  base_engage *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[base_engage initWithMLModel:]([base_engage alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __56__base_engage_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  base_engageOutput *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  base_engageOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, base_engageOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [base_engageOutput alloc];
    objc_msgSend(v14, "featureValueForName:", CFSTR("engage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "int64Value");
    objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[base_engageOutput initWithEngage:classProbability:](v6, "initWithEngage:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, base_engageOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void __64__base_engage_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  base_engageOutput *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  base_engageOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, base_engageOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [base_engageOutput alloc];
    objc_msgSend(v14, "featureValueForName:", CFSTR("engage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "int64Value");
    objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[base_engageOutput initWithEngage:classProbability:](v6, "initWithEngage:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, base_engageOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void __91__deoc_two_stage_sequential_high_second_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  deoc_two_stage_sequential_high_second *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[deoc_two_stage_sequential_high_second initWithMLModel:]([deoc_two_stage_sequential_high_second alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __82__deoc_two_stage_sequential_high_second_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  deoc_two_stage_sequential_high_secondOutput *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  deoc_two_stage_sequential_high_secondOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, deoc_two_stage_sequential_high_secondOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [deoc_two_stage_sequential_high_secondOutput alloc];
    objc_msgSend(v14, "featureValueForName:", CFSTR("target"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "int64Value");
    objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[deoc_two_stage_sequential_high_secondOutput initWithTarget:classProbability:](v6, "initWithTarget:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, deoc_two_stage_sequential_high_secondOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void __90__deoc_two_stage_sequential_high_second_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  deoc_two_stage_sequential_high_secondOutput *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  deoc_two_stage_sequential_high_secondOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, deoc_two_stage_sequential_high_secondOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [deoc_two_stage_sequential_high_secondOutput alloc];
    objc_msgSend(v14, "featureValueForName:", CFSTR("target"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "int64Value");
    objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[deoc_two_stage_sequential_high_secondOutput initWithTarget:classProbability:](v6, "initWithTarget:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, deoc_two_stage_sequential_high_secondOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void __71__deoc_model_iphone_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  deoc_model_iphone *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[deoc_model_iphone initWithMLModel:]([deoc_model_iphone alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __62__deoc_model_iphone_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  deoc_model_iphoneOutput *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  deoc_model_iphoneOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, deoc_model_iphoneOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [deoc_model_iphoneOutput alloc];
    objc_msgSend(v14, "featureValueForName:", CFSTR("next_drain_is_significant"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "int64Value");
    objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[deoc_model_iphoneOutput initWithNext_drain_is_significant:classProbability:](v6, "initWithNext_drain_is_significant:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, deoc_model_iphoneOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void __70__deoc_model_iphone_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  deoc_model_iphoneOutput *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  deoc_model_iphoneOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, deoc_model_iphoneOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [deoc_model_iphoneOutput alloc];
    objc_msgSend(v14, "featureValueForName:", CFSTR("next_drain_is_significant"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "int64Value");
    objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[deoc_model_iphoneOutput initWithNext_drain_is_significant:classProbability:](v6, "initWithNext_drain_is_significant:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, deoc_model_iphoneOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void sessionEventCallback_cold_1()
{
  __assert_rtn("sessionEventCallback", "PowerUIAudioAccessorySmartChargeManager.m", 667, "smartChargeManager != NULL");
}

void sessionEventCallback_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "An error occured attaching the BT session, try again in 60 seconds.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

void sessionEventCallback_cold_3(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_215A71000, a2, v4, "BT session returned unknown event code '%@' - this should not happen!", v5);

}

void btConnectionUpdateCallback_cold_1()
{
  __assert_rtn("btConnectionUpdateCallback", "PowerUIAudioAccessorySmartChargeManager.m", 712, "smartChargeManager != NULL");
}

void btConnectionUpdateCallback_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_215A71000, v0, v1, "Unable to display first use notification: %@", v2);
  OUTLINED_FUNCTION_2();
}

void btConnectionUpdateCallback_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_215A71000, v0, v1, "ERROR getting protocol for device with address: %@", v2);
  OUTLINED_FUNCTION_2();
}

void incomingCustomMessageCallback_cold_1()
{
  __assert_rtn("incomingCustomMessageCallback", "PowerUIAudioAccessorySmartChargeManager.m", 802, "smartChargeManager != NULL");
}

void incomingCustomMessageCallback_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  __int16 v6;
  uint8_t v7[14];
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  v8 = &unk_24D443888;
  v9 = v6;
  v10 = a2;
  _os_log_error_impl(&dword_215A71000, a3, OS_LOG_TYPE_ERROR, "ERROR: Unexpected message size (size of %@ bytes != %@) from device '%@', aborting.", v7, 0x20u);

}

void incomingTimeSeriesMessageCallback_cold_1()
{
  __assert_rtn("incomingTimeSeriesMessageCallback", "PowerUIAudioAccessorySmartChargeManager.m", 889, "smartChargeManager != NULL");
}

void incomingTimeSeriesMessageCallback_cold_2()
{
  os_log_t v0;
  uint8_t v1[12];
  __int16 v2;
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  v2 = 1024;
  v3 = 983;
  _os_log_error_impl(&dword_215A71000, v0, OS_LOG_TYPE_ERROR, "Unexpected data size: %zu != %u)", v1, 0x12u);
  OUTLINED_FUNCTION_2();
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x24BE02948]();
}

uint64_t ADClientSetValueForScalarKey()
{
  return MEMORY[0x24BE02970]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t BMDeviceBatteryGaugingOCVStateAsString()
{
  return MEMORY[0x24BE0C120]();
}

uint64_t BMDeviceBatteryGaugingPeriodicFullChargeStateAsString()
{
  return MEMORY[0x24BE0C128]();
}

uint64_t BMDeviceBatteryGaugingQMaxStateAsString()
{
  return MEMORY[0x24BE0C130]();
}

uint64_t BMDeviceSmartChargingModeOfOperationAsString()
{
  return MEMORY[0x24BE0C140]();
}

uint64_t BMDeviceSmartChargingOBCEventAsString()
{
  return MEMORY[0x24BE0C148]();
}

uint64_t BTAccessoryManagerGetDefault()
{
  return MEMORY[0x24BE66CB8]();
}

uint64_t BTAccessoryManagerRegisterCustomMessageClient()
{
  return MEMORY[0x24BE66DB0]();
}

uint64_t BTAccessoryManagerSendCustomMessage()
{
  return MEMORY[0x24BE66DD8]();
}

uint64_t BTDeviceAddressFromString()
{
  return MEMORY[0x24BE66E50]();
}

uint64_t BTDeviceConnect()
{
  return MEMORY[0x24BE66E60]();
}

uint64_t BTDeviceFromAddress()
{
  return MEMORY[0x24BE66E78]();
}

uint64_t BTDeviceGetAddressString()
{
  return MEMORY[0x24BE66E88]();
}

uint64_t BTDeviceGetConnectedServices()
{
  return MEMORY[0x24BE66E98]();
}

uint64_t BTDeviceGetDeviceId()
{
  return MEMORY[0x24BE66EB0]();
}

uint64_t BTDeviceIsAppleAudioDevice()
{
  return MEMORY[0x24BE66F18]();
}

uint64_t BTServiceAddCallbacksWithFilter()
{
  return MEMORY[0x24BE670A0]();
}

uint64_t BTSessionAttachWithQueue()
{
  return MEMORY[0x24BE670B0]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C260]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x24BDBC1A0](keysToSet, keysToRemove, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC930](flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, timeout);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

uint64_t IOPSCopyBatteryLevelLimits()
{
  return MEMORY[0x24BDD87C8]();
}

uint64_t IOPSGaugingMitigationGetState()
{
  return MEMORY[0x24BDD8810]();
}

uint64_t IOPSLimitBatteryLevel()
{
  return MEMORY[0x24BDD8848]();
}

uint64_t IOPSLimitBatteryLevelCancel()
{
  return MEMORY[0x24BDD8850]();
}

uint64_t IOPSLimitBatteryLevelRegister()
{
  return MEMORY[0x24BDD8858]();
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x24BDD88A8](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

uint64_t MGIsDeviceOfType()
{
  return MEMORY[0x24BED84B8]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x24BE74F60]();
}

uint64_t SBGetIsAlive()
{
  return MEMORY[0x24BEB0B78]();
}

uint64_t SBSSpringBoardBlockableServerPort()
{
  return MEMORY[0x24BEB0D40]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x24BDE8D78](allocator, token);
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
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

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x24BDAE008](when, delta);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDAEB58](*(_QWORD *)&error_value);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x24BDAF150](*(_QWORD *)&val);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x24BDAF4E0]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x24BDB0180](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x24BDB05E0](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x24BDB05E8](identifier, criteria, handler);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x24BDB0620](identifier);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x24BDB0710](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x24BDB0758]();
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x24BDB0948](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x24BDB0970]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB0990](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x24BDB0B50]();
}

