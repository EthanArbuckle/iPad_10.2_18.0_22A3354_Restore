void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void SiriInvokeOnMainQueue(void *a1)
{
  void (**v1)(void);
  void (**block)(void);

  v1 = a1;
  if (v1)
  {
    block = v1;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      block[2]();
    else
      dispatch_async(MEMORY[0x1E0C80D38], block);
    v1 = block;
  }

}

double SiriSystemUpTimeFromCFAbsoluteCurrentTime(double a1)
{
  double Current;
  void *v3;
  double v4;
  double v5;

  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemUptime");
  v5 = a1 - (Current - v4);

  return v5;
}

uint64_t SASDismissalReasonToSISchemaDismissalReason(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x41)
    return 0;
  else
    return dword_1D13782B0[a1 - 1];
}

uint64_t SASDismissalIsError(unint64_t a1)
{
  return (a1 < 0x3C) & (0x95800061620F000uLL >> a1);
}

uint64_t SASDismissalReasonGetCancellationReason(unint64_t a1)
{
  uint64_t v1;

  v1 = 14;
  if (((1 << a1) & 0x2400401800040020) == 0)
    v1 = 0;
  if (a1 <= 0x3D)
    return v1;
  else
    return 0;
}

void sub_1D133573C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D133598C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

BOOL SiriPresentationRotationStyleGetIsValid(unint64_t a1)
{
  return a1 < 3;
}

BOOL SiriPresentationRotationStyleGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

const __CFString *SiriPresentationRotationStyleGetName(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(unknown)");
  else
    return off_1E91FBED8[a1];
}

uint64_t SiriPresentationRotationStyleGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SiriPresentationRotationStyleGetFromName_onceToken != -1)
      dispatch_once(&SiriPresentationRotationStyleGetFromName_onceToken, &__block_literal_global);
    objc_msgSend((id)SiriPresentationRotationStyleGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_1D1336390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D1337204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  id *v23;

  _Block_object_dispose(&a23, 8);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D1337540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D1339C70(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __getAWAttentionAwarenessConfigurationClass_block_invoke(uint64_t a1)
{
  AttentionAwarenessLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AWAttentionAwarenessConfiguration");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAWAttentionAwarenessConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAWAttentionAwarenessConfigurationClass_block_invoke_cold_1();
    AttentionAwarenessLibrary();
  }
}

void AttentionAwarenessLibrary()
{
  void *v0;

  if (!AttentionAwarenessLibraryCore_frameworkLibrary)
    AttentionAwarenessLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AttentionAwarenessLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void __getAWAttentionAwarenessClientClass_block_invoke(uint64_t a1)
{
  AttentionAwarenessLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AWAttentionAwarenessClient");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAWAttentionAwarenessClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAWAttentionAwarenessClientClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_3();
  }
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x26u);
}

id OUTLINED_FUNCTION_10(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_11()
{
  void *v0;

  return objc_msgSend(v0, "isMetadataValid");
}

void sub_1D133BBA8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1D133BCC0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D133BE4C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D133C060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D133DCC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D13402DC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D1340D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D134472C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id soft_SBUIGetUserAgent()
{
  void (*v0)(void);
  _Unwind_Exception *v2;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (void (*)(void))getSBUIGetUserAgentSymbolLoc_ptr;
  v7 = getSBUIGetUserAgentSymbolLoc_ptr;
  if (!getSBUIGetUserAgentSymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSBUIGetUserAgentSymbolLoc_block_invoke;
    v3[3] = &unk_1E91FC090;
    v3[4] = &v4;
    __getSBUIGetUserAgentSymbolLoc_block_invoke((uint64_t)v3);
    v0 = (void (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v2 = (_Unwind_Exception *)soft_SBUIGetUserAgent_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v2);
  }
  v0();
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1D1344DAC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void *__getSBUIGetUserAgentSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (SpringBoardUILibraryCore_frameworkLibrary)
  {
    v2 = (void *)SpringBoardUILibraryCore_frameworkLibrary;
  }
  else
  {
    SpringBoardUILibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)SpringBoardUILibraryCore_frameworkLibrary;
    if (!SpringBoardUILibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "SBUIGetUserAgent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getSBUIGetUserAgentSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

unsigned int SASMyriadUtilCurrentBoostForDecay(int a1, double *a2, double a3, double a4, double a5)
{
  double v5;
  double v6;

  if (a3 <= 0.0)
    return 0;
  v5 = a5 - a4;
  if (v5 >= a3)
    v6 = a3;
  else
    v6 = v5;
  if (v6 < 0.0)
    v6 = 0.0;
  *a2 = v5;
  return llround((1.0 - v6 / a3) * (double)a1);
}

void sub_1D1347018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D13471B0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D1347A74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL SASHeadphonesAuthenticationInvalidationReasonGetIsValid(unint64_t a1)
{
  return a1 < 5;
}

BOOL SASHeadphonesAuthenticationInvalidationReasonGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 4;
}

const __CFString *SASHeadphonesAuthenticationInvalidationReasonGetName(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("(unknown)");
  else
    return off_1E91FC598[a1];
}

uint64_t SASHeadphonesAuthenticationInvalidationReasonGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SASHeadphonesAuthenticationInvalidationReasonGetFromName_onceToken != -1)
      dispatch_once(&SASHeadphonesAuthenticationInvalidationReasonGetFromName_onceToken, &__block_literal_global_7);
    objc_msgSend((id)SASHeadphonesAuthenticationInvalidationReasonGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_1D134F1C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D134F700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *SASPresentationManagerErrorGetName(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return CFSTR("SASPresentationManagerErrorInvalidStateTransition");
  else
    return off_1E91FC6E8[a1 - 1];
}

uint64_t SASCarPlayTransportTypeToSISchemaCarPlayConnection(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  else
    return dword_1D1378450[a1];
}

uint64_t SASCarPlayEnhancedVoiceTriggerModeToSISchemaEnhancedVoiceTriggerMode(unint64_t a1)
{
  if (a1 > 3)
    return 4;
  else
    return dword_1D1378460[a1];
}

void sub_1D1350B48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D1350CE0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D1351180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D1351318(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D1351F08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D13520BC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D13527B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D1352F44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

char *OUTLINED_FUNCTION_3_0()
{
  int v0;

  return strerror(v0);
}

void sub_1D1356AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D1356C94(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D13582BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D13584C4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Block_object_dispose((const void *)(v4 - 128), 8);
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

void sub_1D1358F18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D13590B0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

BOOL SASTestingInputTypeGetIsValid(unint64_t a1)
{
  return a1 < 3;
}

BOOL SASTestingInputTypeGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

const __CFString *SASTestingInputTypeGetName(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(unknown)");
  else
    return off_1E91FC9D0[a1];
}

uint64_t SASTestingInputTypeGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SASTestingInputTypeGetFromName_onceToken != -1)
      dispatch_once(&SASTestingInputTypeGetFromName_onceToken, &__block_literal_global_14);
    objc_msgSend((id)SASTestingInputTypeGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id SASCarPlayEnhancedSiriCharacteristicsToString(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if ((v1 & 1) != 0)
    {
      objc_msgSend(v2, "addObject:", CFSTR("zll"));
      if ((v1 & 2) == 0)
      {
LABEL_4:
        if ((v1 & 4) == 0)
        {
LABEL_6:
          objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
          v1 = objc_claimAutoreleasedReturnValue();

          return (id)v1;
        }
LABEL_5:
        objc_msgSend(v3, "addObject:", CFSTR("mixable"));
        goto LABEL_6;
      }
    }
    else if ((v1 & 2) == 0)
    {
      goto LABEL_4;
    }
    objc_msgSend(v3, "addObject:", CFSTR("zllButton"));
    if ((v1 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  return (id)v1;
}

BOOL SASCarPlayEnhancedSiriCharacteristicsContainsCharacteristic(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

void sub_1D135A58C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  id *v5;
  uint64_t v6;

  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 120));
  _Unwind_Resume(a1);
}

void sub_1D135AA2C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  void *v0;

  return objc_msgSend(v0, "source");
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  void *v0;

  return objc_msgSend(v0, "event");
}

uint64_t SASRemoteTypeFromSiriTVRemoteType(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 6)
    return 0;
  return result;
}

uint64_t SASRequestSourceGetName(unint64_t a1)
{
  if (a1 > 0x33)
    return 0;
  else
    return (uint64_t)*(&off_1E91FCBC0 + a1);
}

uint64_t CARAutomaticFeatureStateGetName(unint64_t a1)
{
  if (a1 < 3)
    return (uint64_t)*(&off_1E91FCD60 + a1);
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
    CARAutomaticFeatureStateGetName_cold_1();
  return 0;
}

__CFString *SASLockStateGetName(uint64_t a1)
{
  char v1;
  void *v2;
  void *v3;
  __CFString *v4;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if ((v1 & 1) != 0)
      objc_msgSend(v2, "addObject:", CFSTR("SASLockStateScreenLocked"));
    if ((v1 & 2) != 0)
      objc_msgSend(v3, "addObject:", CFSTR("SASLockStatePasscodeLocked"));
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" & "));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = CFSTR("SASLockStateUnlocked");
  }
  return v4;
}

const __CFString *SASRequestInputTypeGetDescription(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("SASRequestInputTypeNone");
  if (a1 == 1)
    v1 = CFSTR("SASRequestInputTypeText");
  if (a1 == 2)
    return CFSTR("SASRequestInputTypeSpeech");
  else
    return v1;
}

uint64_t SASRequestSourceIsHTT(unint64_t a1)
{
  return (a1 < 0x2C) & (0x810F0430C06uLL >> a1);
}

uint64_t AFDirectActionSourceFromSASRequestSource(unint64_t a1)
{
  if (a1 < 0x34)
    return qword_1D1378560[a1];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
    AFDirectActionSourceFromSASRequestSource_cold_1();
  return 0;
}

void sub_1D135EC18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D135EDB0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D1360614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D13607AC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D1360CB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D1360EA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _PasscodeLockStateDidChange(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_lockStateDidChange:", 0);
}

void _AFPreferencesDidChangeCallback(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "assistantIsEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "setAssistantIsEnabled:", v4);

}

void sub_1D136176C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id soft_SBUIGetUserAgent_0()
{
  void (*v0)(void);
  _Unwind_Exception *v2;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (void (*)(void))getSBUIGetUserAgentSymbolLoc_ptr_0;
  v7 = getSBUIGetUserAgentSymbolLoc_ptr_0;
  if (!getSBUIGetUserAgentSymbolLoc_ptr_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSBUIGetUserAgentSymbolLoc_block_invoke_0;
    v3[3] = &unk_1E91FC090;
    v3[4] = &v4;
    __getSBUIGetUserAgentSymbolLoc_block_invoke_0((uint64_t)v3);
    v0 = (void (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v2 = (_Unwind_Exception *)soft_SBUIGetUserAgent_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v2);
  }
  v0();
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1D1361A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1361B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSBUIGetUserAgentSymbolLoc_block_invoke_0(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (SpringBoardUILibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)SpringBoardUILibraryCore_frameworkLibrary_0;
  }
  else
  {
    SpringBoardUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
    v2 = (void *)SpringBoardUILibraryCore_frameworkLibrary_0;
    if (!SpringBoardUILibraryCore_frameworkLibrary_0)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "SBUIGetUserAgent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getSBUIGetUserAgentSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (MobileKeyBagLibraryCore_frameworkLibrary)
  {
    v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
  }
  else
  {
    MobileKeyBagLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
    if (!MobileKeyBagLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "MKBDeviceUnlockedSinceBoot");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMKBDeviceUnlockedSinceBootSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1D13624E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _HomeButtonTripleClickEnabled(uint64_t a1, uint64_t a2)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___HomeButtonTripleClickEnabled_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void sub_1D1363100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D1363984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1364834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1D1366D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D1366EB4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

const __CFString *SiriTVStringForRemoteType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return CFSTR("SiriTVRemoteTypeUnknown");
  else
    return off_1E91FCF60[a1 - 1];
}

const __CFString *SASButtonEventTypeGetName(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("SASButtonEventTypeUnknown");
  else
    return off_1E91FCF90[a1 - 1];
}

void sub_1D13699D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D1369B70(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

const __CFString *SASRequestStateGetName(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("SASRequestStateOff");
  else
    return off_1E91FD040[a1 - 1];
}

BOOL SASDismissalReasonGetIsValid(unint64_t a1)
{
  return a1 < 0x43;
}

BOOL SASDismissalReasonGetIsValidAndSpecified(unint64_t a1)
{
  return a1 < 0x43;
}

const __CFString *SASDismissalReasonGetName(unint64_t a1)
{
  if (a1 > 0x42)
    return CFSTR("(unknown)");
  else
    return off_1E91FD0A8[a1];
}

uint64_t SASDismissalReasonGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SASDismissalReasonGetFromName_onceToken != -1)
      dispatch_once(&SASDismissalReasonGetFromName_onceToken, &__block_literal_global_22);
    objc_msgSend((id)SASDismissalReasonGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_1D136BCFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

unint64_t UserEngagementStatus.init(rawValue:)(unint64_t result)
{
  if (result > 2)
    return 0;
  return result;
}

BOOL sub_1D136F878(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1D136F890()
{
  return sub_1D1372F44();
}

uint64_t *sub_1D136F8BC@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;

  v2 = *result;
  v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2)
    v2 = 0;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

void sub_1D136F8D8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t PerceptionEntityQueryType.init(rawValue:)()
{
  return 0;
}

uint64_t sub_1D136F8F8()
{
  sub_1D1372F38();
  sub_1D1372F44();
  return sub_1D1372F50();
}

uint64_t sub_1D136F93C()
{
  sub_1D1372F38();
  sub_1D1372F44();
  return sub_1D1372F50();
}

_QWORD *sub_1D136F97C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;

  v2 = *result != 0;
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

uint64_t sub_1D136F994()
{
  uint64_t v0;

  return sub_1D136F9A4(*(uint64_t (**)(uint64_t))(v0 + 8), v0, 0);
}

uint64_t sub_1D136F9A4(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_1D136FAE4(int a1, void *aBlock)
{
  uint64_t v2;
  void (**v3)(void *, _QWORD);

  v3 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v3[2](v3, 0);
  _Block_release(v3);
  return sub_1D1370650(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t PerceptionModelImpl.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t PerceptionModelImpl.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

id PerceptionEntityWrapper.__allocating_init(model:)(uint64_t a1)
{
  swift_getObjectType();
  return sub_1D137004C(a1);
}

id PerceptionEntityWrapper.init(model:)(uint64_t a1)
{
  char *v1;

  swift_getObjectType();
  return sub_1D137009C(a1, v1);
}

id PerceptionEntityWrapper.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id PerceptionEntityWrapper.init()()
{
  uint64_t v0;
  objc_class *v1;
  char *v2;
  id v3;
  objc_super v5;

  type metadata accessor for PerceptionModelImpl();
  v0 = swift_allocObject();
  v1 = (objc_class *)type metadata accessor for PerceptionEntityWrapper();
  v2 = (char *)objc_allocWithZone(v1);
  *(_QWORD *)&v2[OBJC_IVAR___SASPerceptionEntityWrapper_model] = v0;
  v5.receiver = v2;
  v5.super_class = v1;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v3;
}

uint64_t sub_1D136FCDC(uint64_t (*a1)(_QWORD))
{
  return a1(0);
}

uint64_t sub_1D136FD60()
{
  uint64_t v0;

  return sub_1D136F9A4(*(uint64_t (**)(uint64_t))(v0 + 8), v0, 2);
}

id PerceptionEntityWrapper.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PerceptionEntityWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D136FDB0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_1D137065C;
  return v6();
}

uint64_t sub_1D136FE04(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1D137065C;
  return v7();
}

uint64_t sub_1D136FE58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1D1372F2C();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1D1372F20();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1D137057C(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1D1372F14();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1D136FF9C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1D1370000;
  return v6(a1);
}

uint64_t sub_1D1370000()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

id sub_1D137004C(uint64_t a1)
{
  objc_class *v2;
  char *v3;
  objc_super v5;

  v2 = (objc_class *)type metadata accessor for PerceptionEntityWrapper();
  v3 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v3[OBJC_IVAR___SASPerceptionEntityWrapper_model] = a1;
  v5.receiver = v3;
  v5.super_class = v2;
  return objc_msgSendSuper2(&v5, sel_init);
}

id sub_1D137009C(uint64_t a1, char *a2)
{
  objc_super v3;

  *(_QWORD *)&a2[OBJC_IVAR___SASPerceptionEntityWrapper_model] = a1;
  v3.receiver = a2;
  v3.super_class = (Class)type metadata accessor for PerceptionEntityWrapper();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for PerceptionModelImpl()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for PerceptionEntityWrapper()
{
  return objc_opt_self();
}

unint64_t sub_1D1370128()
{
  unint64_t result;

  result = qword_1EFC5A3C8;
  if (!qword_1EFC5A3C8)
  {
    result = MEMORY[0x1D17E6E34](&protocol conformance descriptor for UserEngagementStatus, &type metadata for UserEngagementStatus);
    atomic_store(result, (unint64_t *)&qword_1EFC5A3C8);
  }
  return result;
}

unint64_t sub_1D1370170()
{
  unint64_t result;

  result = qword_1EFC5A3D0;
  if (!qword_1EFC5A3D0)
  {
    result = MEMORY[0x1D17E6E34](&protocol conformance descriptor for PerceptionEntityQueryType, &type metadata for PerceptionEntityQueryType);
    atomic_store(result, (unint64_t *)&qword_1EFC5A3D0);
  }
  return result;
}

ValueMetadata *type metadata accessor for UserEngagementStatus()
{
  return &type metadata for UserEngagementStatus;
}

ValueMetadata *type metadata accessor for PerceptionEntityQueryType()
{
  return &type metadata for PerceptionEntityQueryType;
}

uint64_t method lookup function for PerceptionModelImpl()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PerceptionModelImpl.performQuery(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 80) + *(_QWORD *)(*(_QWORD *)v1 + 80));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1D1370244;
  return v6(a1);
}

uint64_t sub_1D1370244(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t method lookup function for PerceptionEntityWrapper()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PerceptionEntityWrapper.__allocating_init(model:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of PerceptionEntityWrapper.userEngagementStatus(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of PerceptionEntityWrapper.userEngagementStatus()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1D1370244;
  return v5();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D17E6E28]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1D137036C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D1370398()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1D1370404;
  return ((uint64_t (*)(int, void *))((char *)&dword_1EFC5A4B8 + dword_1EFC5A4B8))(v2, v3);
}

uint64_t sub_1D1370404()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1D1370450()
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
  v5[1] = sub_1D137065C;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1EFC5A4C8 + dword_1EFC5A4C8))(v2, v3, v4);
}

uint64_t objectdestroy_6Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D13704F8(uint64_t a1)
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
  v7[1] = sub_1D137065C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EFC5A4D8 + dword_1EFC5A4D8))(a1, v4, v5, v6);
}

uint64_t sub_1D137057C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC5A4B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D13705BC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D13705E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1D1370404;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EFC5A4E8 + dword_1EFC5A4E8))(a1, v4);
}

uint64_t sub_1D1370650(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t __getAWAttentionAwarenessConfigurationClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAWAttentionAwarenessClientClass_block_invoke_cold_1(v0);
}

uint64_t __getAWAttentionAwarenessClientClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SASPresentationServer init].cold.1(v0);
}

uint64_t soft_SBUIGetUserAgent_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __87__SiriActivationService__handlePocketStateFetchForScreenWakeForPresentationIdentifier___block_invoke_cold_1(v0);
}

void CARAutomaticFeatureStateGetName_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_1D132F000, v0, v1, "%s Unsupported CARAutomaticFeatureState value: %lu", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void AFDirectActionSourceFromSASRequestSource_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_1D132F000, v0, v1, "%s Unsupported SASRequestSource value: %lu, returning back AFDirectActionSourceUnknown.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

uint64_t sub_1D1372F14()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1D1372F20()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1D1372F2C()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1D1372F38()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1D1372F44()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1D1372F50()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t AFAccessibilitySupportsAttentionAwareFeatures()
{
  return MEMORY[0x1E0CFE368]();
}

uint64_t AFActivationEventGetDescription()
{
  return MEMORY[0x1E0CFE370]();
}

uint64_t AFAnalyticsEventCreateCurrent()
{
  return MEMORY[0x1E0CFE380]();
}

uint64_t AFAssistantCapable()
{
  return MEMORY[0x1E0CFE388]();
}

uint64_t AFAssistantRestricted()
{
  return MEMORY[0x1E0CFE390]();
}

uint64_t AFCDAFaceDetection()
{
  return MEMORY[0x1E0CFE3C0]();
}

uint64_t AFDeviceSupportsAOP()
{
  return MEMORY[0x1E0CFE3F0]();
}

uint64_t AFDeviceSupportsEchoCancellation()
{
  return MEMORY[0x1E0CFE400]();
}

uint64_t AFDeviceSupportsSystemAssistantExperience()
{
  return MEMORY[0x1E0CFE468]();
}

uint64_t AFDeviceSupportsZLL()
{
  return MEMORY[0x1E0CFE478]();
}

uint64_t AFDirectActionCreateRequestInfo()
{
  return MEMORY[0x1E0CFE488]();
}

uint64_t AFDirectActionEventGetName()
{
  return MEMORY[0x1E0CFE490]();
}

uint64_t AFIsATV()
{
  return MEMORY[0x1E0CFE4B0]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x1E0CFE4D0]();
}

uint64_t AFIsPad()
{
  return MEMORY[0x1E0CFE4E8]();
}

uint64_t AFMachAbsoluteTimeGetTimeInterval()
{
  return MEMORY[0x1E0CFE538]();
}

uint64_t AFMyriadEmitSelfMetrics()
{
  return MEMORY[0x1E0CFE568]();
}

uint64_t AFMyriadGoodnessComputeExponentialBoost()
{
  return MEMORY[0x1E0CFE570]();
}

uint64_t AFPreferencesAlwaysEyesFreeEnabled()
{
  return MEMORY[0x1E0CFE5A8]();
}

uint64_t AFPreferencesLanguageIsSupported()
{
  return MEMORY[0x1E0CFE5C0]();
}

uint64_t AFPreferencesStreamingDictationEnabled()
{
  return MEMORY[0x1E0CFE5E0]();
}

uint64_t AFPreferencesTypeToSiriEnabled()
{
  return MEMORY[0x1E0CFE5F8]();
}

uint64_t AFRequestCancellationReasonGetName()
{
  return MEMORY[0x1E0CFE608]();
}

uint64_t AFSiriDeactivationOptionsGetNames()
{
  return MEMORY[0x1E0CFE688]();
}

uint64_t AFSiriDeactivationReasonGetName()
{
  return MEMORY[0x1E0CFE698]();
}

uint64_t AFSpeechEventGetDescription()
{
  return MEMORY[0x1E0CFE6F8]();
}

uint64_t AFSupportsCallHangUp()
{
  return MEMORY[0x1E0CFE738]();
}

uint64_t AFSupportsSCDAFramework()
{
  return MEMORY[0x1E0CFE748]();
}

uint64_t AFSupportsSiriInCall()
{
  return MEMORY[0x1E0CFE750]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t BKSHIDServicesIsSmartCoverClosed()
{
  return MEMORY[0x1E0D00B48]();
}

uint64_t BTDeviceAddressFromString()
{
  return MEMORY[0x1E0D4E198]();
}

uint64_t BTDeviceGetAddressString()
{
  return MEMORY[0x1E0D4E1E8]();
}

uint64_t BTDeviceGetDeviceType()
{
  return MEMORY[0x1E0D4E220]();
}

uint64_t BTDeviceIsTemporaryPaired()
{
  return MEMORY[0x1E0D4E248]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
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

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

uint64_t CRIsPairedWithCertificateSerialNumber()
{
  return MEMORY[0x1E0D0D308]();
}

uint64_t IAPBluetoothDeviceMode()
{
  return MEMORY[0x1E0D33C90]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
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

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1E0D7FE28]();
}

uint64_t _AXSHomeButtonAssistant()
{
  return MEMORY[0x1E0DDD820]();
}

uint64_t _AXSTripleClickCopyOptions()
{
  return MEMORY[0x1E0DDDD50]();
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

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
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

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

int sysctlnametomib(const char *a1, int *a2, size_t *a3)
{
  return MEMORY[0x1E0C857B0](a1, a2, a3);
}

