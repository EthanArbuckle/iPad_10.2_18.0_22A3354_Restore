void sub_1A3754330(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A37547E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id _SUICLayerNullActions()
{
  if (_SUICLayerNullActions_onceToken != -1)
    dispatch_once(&_SUICLayerNullActions_onceToken, &__block_literal_global);
  return (id)_SUICLayerNullActions_actions;
}

double _SUICSpringAnimationSolveForInput(double a1)
{
  double v2;
  float v3;

  if (_SUICInitializeStaticVariables_onceToken != -1)
    dispatch_once(&_SUICInitializeStaticVariables_onceToken, &__block_literal_global_164);
  v2 = fmin(fmax(a1, 0.0), 1.0);
  *(float *)&v2 = v2;
  objc_msgSend((id)_SUICSpringAnimationTimingFunction, "_solveForInput:", v2);
  objc_msgSend((id)_SUICSpringAnimationTimingAnimation, "_solveForInput:");
  return v3;
}

id _SUICMagicCurve()
{
  if (_SUICMagicCurve_onceToken != -1)
    dispatch_once(&_SUICMagicCurve_onceToken, &__block_literal_global_25);
  return (id)_SUICMagicCurve_curve;
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

void SUICSetSiriUILanguageCode(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", __currentLanguageCode) & 1) == 0)
  {
    v2 = (void *)__stringTables;
    __stringTables = 0;

    v3 = objc_msgSend(v1, "copy");
    v4 = (void *)__currentLanguageCode;
    __currentLanguageCode = v3;

    v5 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315650;
      v7 = "SUICSetSiriUILanguageCode";
      v8 = 2080;
      v9 = "SUICSetSiriUILanguageCode";
      v10 = 2112;
      v11 = __currentLanguageCode;
      _os_log_impl(&dword_1A3752000, v5, OS_LOG_TYPE_DEFAULT, "%s %s updated language code to: %@", (uint8_t *)&v6, 0x20u);
    }
  }

}

void SUICPurgeCachedLocalizedStrings()
{
  void *v0;

  v0 = (void *)__stringTables;
  __stringTables = 0;

}

id SUICGetSiriUILanguageCode()
{
  return (id)__currentLanguageCode;
}

BOOL SUICSiriLanguageIsRTL()
{
  return objc_msgSend(MEMORY[0x1E0C99DC8], "characterDirectionForLanguage:", __currentLanguageCode) == 2;
}

void sub_1A37587DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3758914(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
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

uint64_t IsCharacterAtIndexMemberOfCharacterSet(void *a1, _QWORD *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a1;
  v6 = a3;
  v7 = objc_msgSend(v5, "characterAtIndex:", *a2);
  if (v7 >> 11 == 27 && (v8 = *a2 + 1, v8 < objc_msgSend(v5, "length")))
  {
    ++*a2;
    v9 = objc_msgSend(v6, "longCharacterIsMember:", objc_msgSend(v5, "characterAtIndex:") + ((_DWORD)v7 << 10) - 56613888);
  }
  else
  {
    v9 = objc_msgSend(v6, "characterIsMember:", v7);
  }
  v10 = v9;

  return v10;
}

void sub_1A375D3D4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1A375D588(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1A375F14C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1A375FFFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  id *v27;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A37601E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *__getBYSetupAssistantHasCompletedInitialRunSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (SetupAssistantLibraryCore_frameworkLibrary)
  {
    v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
  }
  else
  {
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
    if (!SetupAssistantLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "BYSetupAssistantHasCompletedInitialRun");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

const __CFString *SUICProgressStateNameForState(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 4)
    return CFSTR("None");
  else
    return off_1E4A55120[a1 + 1];
}

const __CFString *SUICProgressEventNameForEvent(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 5)
    return CFSTR("Start");
  else
    return off_1E4A550F0[a1 + 1];
}

void sub_1A3760E38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, id *a11, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id a33)
{
  id *v33;

  objc_destroyWeak(v33);
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(a12);
  objc_destroyWeak(&a33);
  _Unwind_Resume(a1);
}

void sub_1A3761F48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3762160(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A3762304(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A3762B24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *SUICStringForAutoDismissalReason(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return 0;
  else
    return off_1E4A55258[a1 - 1];
}

void sub_1A3764130(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_1A3764488(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

double _calculateChipNormal(uint64_t a1, int a2, int a3, float32x4_t a4)
{
  float32x4_t *v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x2_t v7;
  float32x2_t v8;
  int8x16_t v9;
  float32x4_t *v10;
  float32x4_t v11;
  int32x4_t v12;
  float32x2_t v13;
  float32x2_t v14;
  int8x16_t v15;
  float32x4_t v16;
  float32x2_t v17;
  int32x4_t v18;
  double result;

  v4 = (float32x4_t *)(a1 + 48 * a2);
  a4.i64[0] = v4[2].i64[0];
  a4.i32[2] = 0;
  v5 = vaddq_f32(a4, *v4);
  v6 = vmulq_f32(v5, v5);
  v6.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32((int32x4_t)v6, 2), vadd_f32(*(float32x2_t *)v6.f32, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v6.f32, 1))).u32[0];
  v7 = vrsqrte_f32((float32x2_t)v6.u32[0]);
  v8 = vmul_f32(v7, vrsqrts_f32((float32x2_t)v6.u32[0], vmul_f32(v7, v7)));
  v9 = (int8x16_t)vmulq_n_f32(v5, vmul_f32(v8, vrsqrts_f32((float32x2_t)v6.u32[0], vmul_f32(v8, v8))).f32[0]);
  v10 = (float32x4_t *)(a1 + 48 * a3);
  v6.i64[0] = v10[2].i64[0];
  v6.i32[2] = 0;
  v11 = vaddq_f32(v6, *v10);
  v12 = (int32x4_t)vmulq_f32(v11, v11);
  v12.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v12, 2), vadd_f32(*(float32x2_t *)v12.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v12.i8, 1))).u32[0];
  v13 = vrsqrte_f32((float32x2_t)v12.u32[0]);
  v14 = vmul_f32(v13, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v13, v13)));
  v15 = (int8x16_t)vmulq_n_f32(v11, vmul_f32(v14, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v14, v14))).f32[0]);
  v16 = (float32x4_t)vextq_s8(v9, v9, 8uLL);
  v16.i32[1] = v9.i32[0];
  v17.i32[0] = vextq_s8(v15, v15, 8uLL).u32[0];
  v17.i32[1] = v15.i32[0];
  *(float32x2_t *)v16.f32 = vmla_f32(vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v15, v15, 4uLL), vneg_f32(*(float32x2_t *)v16.f32)), v17, (float32x2_t)*(_OWORD *)&vextq_s8(v9, v9, 4uLL));
  v16.i32[2] = vmlas_n_f32((float)-*(float *)&v9.i32[1] * *(float *)v15.i32, *(float *)&v15.i32[1], *(float *)v9.i32);
  v18 = (int32x4_t)vmulq_f32(v16, v16);
  v18.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v18, 2), vadd_f32(*(float32x2_t *)v18.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v18.i8, 1))).u32[0];
  *(float32x2_t *)v15.i8 = vrsqrte_f32((float32x2_t)v18.u32[0]);
  *(float32x2_t *)v15.i8 = vmul_f32(*(float32x2_t *)v15.i8, vrsqrts_f32((float32x2_t)v18.u32[0], vmul_f32(*(float32x2_t *)v15.i8, *(float32x2_t *)v15.i8)));
  *(_QWORD *)&result = vmulq_n_f32(v16, vmul_f32(*(float32x2_t *)v15.i8, vrsqrts_f32((float32x2_t)v18.u32[0], vmul_f32(*(float32x2_t *)v15.i8, *(float32x2_t *)v15.i8))).f32[0]).u64[0];
  return result;
}

double matrix4x4_translation()
{
  __asm { FMOV            V3.4S, #1.0 }
  return *(double *)&_PromotedConst;
}

void sub_1A3768A70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

float matrix_perspective_right_hand(float a1, float a2)
{
  return (float)(1.0 / tanf(a1 * 0.5)) / a2;
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

id OUTLINED_FUNCTION_4(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_6()
{
  uint64_t v0;

  return v0;
}

void sub_1A376B838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A376BA40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A376C60C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

id SUICGetIndexCacheEntryKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7, double a8, double a9)
{
  void *v14;
  void *v15;
  void *v16;

  v14 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromCGRect(*(CGRect *)&a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@.%ld.%.2f.%ld.%d.%d"), v15, a1, *(_QWORD *)&a9, a2, a3, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void sub_1A3770F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1A3775D70(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t SUICCommonPhysicsInternal_Init(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t i;
  uint64_t result;
  float v8;

  *(_BYTE *)(a1 + 161) = UIAccessibilityIsReduceMotionEnabled();
  *(_QWORD *)a1 = a2;
  for (i = 24; i != 156; i += 4)
  {
    result = rand();
    *(float *)(a1 + i) = (float)((float)((float)(int)result * 4.6566e-10) * 600.0) + -300.0;
  }
  if (a2 <= 89)
  {
    if (a2 == 30)
    {
      v8 = 0.2;
      goto LABEL_14;
    }
    if (a2 == 60)
    {
      v8 = 0.3;
      goto LABEL_14;
    }
LABEL_15:
    SUICCommonPhysicsInternal_Init_cold_1();
  }
  if (a2 == 90)
  {
    v8 = 0.7;
    goto LABEL_14;
  }
  if (a2 == 120)
  {
    v8 = 1.0;
    goto LABEL_14;
  }
  if (a2 != 240)
    goto LABEL_15;
  v8 = 1.5;
LABEL_14:
  *(float *)(a1 + 12) = 1.0 / (float)(unint64_t)a2;
  *(float *)(a1 + 16) = v8;
  *(_DWORD *)(a1 + 8) = a3;
  *(_DWORD *)(a1 + 20) = 0;
  *(_BYTE *)(a1 + 160) = 0;
  return result;
}

void SUICLightPhysics_Init(uint64_t a1, uint64_t a2, int a3)
{
  SUICCommonPhysicsInternal_Init(a1, a2, a3);
  if (*(_QWORD *)a1)
  {
    _setupSpring(a1, a1 + 244, 2uLL, 0.0);
    _setupSpring(a1, a1 + 260, 3uLL, 0.0);
    _setupSpring(a1, a1 + 200, 0, 0.0);
    _setupSpring(a1, a1 + 216, 0, 0.0);
    _setupSpring(a1, a1 + 184, *(_BYTE *)(a1 + 161) == 0, 0.0);
    _setupSpring(a1, a1 + 168, 1uLL, 0.0);
  }
}

void SUICOrbPhysics_Init(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t i;

  SUICCommonPhysicsInternal_Init(a1, a2, a3);
  *(_QWORD *)(a1 + 168) = 0;
  *(_DWORD *)(a1 + 924) = 0;
  *(_DWORD *)(a1 + 932) = 0;
  *(_BYTE *)(a1 + 936) = 0;
  *(_OWORD *)(a1 + 800) = 0u;
  if (*(_QWORD *)a1)
  {
    _setupSpring(a1, a1 + 176, 1uLL, 1.25);
    _setupSpring(a1, a1 + 192, 2uLL, 0.0);
    _setupSpring(a1, a1 + 208, 1uLL, 0.0);
    _setupSpring(a1, a1 + 224, 2uLL, 1.0);
    _setupSpring(a1, a1 + 240, 1uLL, 1.0);
    _setupSpring(a1, a1 + 256, 3uLL, 0.0);
    _setupSpring(a1, a1 + 272, 2uLL, 0.0);
    _setupSpring(a1, a1 + 288, 0, 0.0);
    _setupSpring(a1, a1 + 304, *(_BYTE *)(a1 + 161) == 0, 0.0);
    for (i = 320; i != 416; i += 16)
      _setupSpring(a1, a1 + i, 0, 0.0);
  }
}

void SUICLightPhysics_UpdatePhysics(uint64_t a1, float a2)
{
  int v3;
  int v4;
  BOOL v5;

  v3 = (int)((float)(a2 / *(float *)(a1 + 12)) + 0.5);
  if (*(_DWORD *)(a1 + 8) < v3)
    v3 = *(_DWORD *)(a1 + 8);
  if (v3 <= 1)
    v3 = 1;
  v4 = v3 - 1;
  do
  {
    SUICLightPhysicsInternal_UpdatePhysicsTick(a1);
    if (*(_BYTE *)(a1 + 160))
      v5 = 1;
    else
      v5 = v4 == 0;
    --v4;
  }
  while (!v5);
  SUICLightPhysicsInternal_FinalizeStateForFrame(a1);
}

float SUICLightPhysicsInternal_UpdatePhysicsTick(uint64_t a1)
{
  float v1;
  int v2;
  float v3;
  float v4;
  double v5;
  float v6;
  double v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  double v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  double v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  BOOL v47;
  float v48;
  double v49;
  float v50;
  float v51;
  float v52;
  double v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float result;

  v1 = *(float *)(a1 + 20);
  v2 = *(unsigned __int8 *)(a1 + 161);
  v3 = (float)(v1 * v1) * 0.7 + 0.699999988;
  if (*(_BYTE *)(a1 + 161))
    v3 = 0.7;
  v4 = *(float *)(a1 + 180);
  v5 = (float)(v4 * v3);
  v6 = *(float *)(a1 + 168);
  v7 = v6;
  v8 = v5 + v6 * (1.0 - v4);
  v9 = v8 - v6;
  if (v9 != 0.0)
  {
    v10 = *(float *)(a1 + 172);
    v11 = *(float *)(a1 + 176);
    v12 = v9 - v10;
    if ((float)(v9 - v10) <= v11)
    {
      if (v12 >= (float)-v11)
        v13 = v10 + v12;
      else
        v13 = v10 - v11;
    }
    else
    {
      v13 = v10 + v11;
    }
    *(float *)(a1 + 172) = v13;
    if (v9 >= 0.0)
    {
      if (v13 <= v9)
      {
LABEL_14:
        v14 = v6 + v13;
        *(float *)(a1 + 168) = v14;
        v7 = v14;
        goto LABEL_15;
      }
    }
    else if (v13 >= v9)
    {
      goto LABEL_14;
    }
    *(float *)(a1 + 172) = v9;
    v13 = v9;
    goto LABEL_14;
  }
LABEL_15:
  v15 = *(float *)(a1 + 12);
  v16 = v7 * 0.07;
  *(float *)(a1 + 276) = v16;
  if (!*(_BYTE *)(a1 + 160))
  {
    v17 = *(float *)(a1 + 212);
    v18 = (float)(v1 * v17);
    v19 = *(float *)(a1 + 200);
    v20 = v18 + v19 * (1.0 - v17);
    v21 = v20 - v19;
    if (v21 != 0.0)
    {
      v22 = *(float *)(a1 + 204);
      v23 = *(float *)(a1 + 208);
      v24 = v21 - v22;
      if ((float)(v21 - v22) <= v23)
      {
        if (v24 >= (float)-v23)
          v25 = v22 + v24;
        else
          v25 = v22 - v23;
      }
      else
      {
        v25 = v22 + v23;
      }
      *(float *)(a1 + 204) = v25;
      if (v21 >= 0.0)
      {
        if (v25 <= v21)
        {
LABEL_27:
          *(float *)(a1 + 200) = v19 + v25;
          goto LABEL_28;
        }
      }
      else if (v25 >= v21)
      {
        goto LABEL_27;
      }
      *(float *)(a1 + 204) = v21;
      v25 = v21;
      goto LABEL_27;
    }
  }
LABEL_28:
  if (!*(_BYTE *)(a1 + 240))
    goto LABEL_53;
  v26 = *(float *)(a1 + 244);
  v27 = (float)(*(float *)(a1 + 256) * 0.0) + v26 * (1.0 - *(float *)(a1 + 256));
  v28 = v27 - v26;
  if (v28 != 0.0)
  {
    v29 = *(float *)(a1 + 248);
    v30 = *(float *)(a1 + 252);
    v31 = v28 - v29;
    if ((float)(v28 - v29) <= v30)
    {
      if (v31 >= (float)-v30)
        v32 = v29 + v31;
      else
        v32 = v29 - v30;
    }
    else
    {
      v32 = v29 + v30;
    }
    *(float *)(a1 + 248) = v32;
    if (v28 >= 0.0)
    {
      if (v32 <= v28)
      {
LABEL_40:
        v26 = v26 + v32;
        *(float *)(a1 + 244) = v26;
        goto LABEL_41;
      }
    }
    else if (v32 >= v28)
    {
      goto LABEL_40;
    }
    *(float *)(a1 + 248) = v28;
    v32 = v28;
    goto LABEL_40;
  }
LABEL_41:
  v33 = *(float *)(a1 + 272);
  v34 = (float)(v26 * v33);
  v35 = *(float *)(a1 + 260);
  v36 = v34 + v35 * (1.0 - v33);
  v37 = v36 - v35;
  if (v37 == 0.0)
    goto LABEL_53;
  v38 = *(float *)(a1 + 264);
  v39 = v37 - v38;
  v40 = *(float *)(a1 + 268);
  if ((float)(v37 - v38) <= v40)
  {
    if (v39 >= (float)-v40)
      v41 = v38 + v39;
    else
      v41 = v38 - v40;
  }
  else
  {
    v41 = v38 + v40;
  }
  *(float *)(a1 + 264) = v41;
  if (v37 < 0.0)
  {
    if (v41 >= v37)
      goto LABEL_52;
    goto LABEL_51;
  }
  if (v41 > v37)
  {
LABEL_51:
    *(float *)(a1 + 264) = v37;
    v41 = v37;
  }
LABEL_52:
  *(float *)(a1 + 260) = v35 + v41;
LABEL_53:
  v42 = 0.3;
  if (!v2)
    v42 = 2.5;
  v43 = *(float *)(a1 + 200);
  v44 = v15 * (float)(v42 * v43);
  v45 = *(float *)(a1 + 188);
  v46 = v45 * 20.0;
  v47 = v45 <= 0.0;
  v48 = 0.0;
  if (!v47)
    v48 = v46;
  v49 = v15;
  if (v49 * 25.0 < v44)
  {
    v50 = v49 * 25.0;
    v44 = v50;
  }
  v51 = v43 + (float)(v48 * *(float *)(a1 + 16));
  if (v51 > 1.3)
    v51 = 1.3;
  v52 = *(float *)(a1 + 228);
  v53 = (float)(v52 * v51);
  v54 = *(float *)(a1 + 216);
  v55 = v53 + v54 * (1.0 - v52);
  v56 = v55 - v54;
  if (v56 != 0.0)
  {
    v57 = *(float *)(a1 + 220);
    v58 = *(float *)(a1 + 224);
    v59 = v56 - v57;
    if ((float)(v56 - v57) <= v58)
    {
      if (v59 >= (float)-v58)
        v60 = v57 + v59;
      else
        v60 = v57 - v58;
    }
    else
    {
      v60 = v57 + v58;
    }
    *(float *)(a1 + 220) = v60;
    if (v56 >= 0.0)
    {
      if (v60 <= v56)
      {
LABEL_72:
        *(float *)(a1 + 216) = v54 + v60;
        goto LABEL_73;
      }
    }
    else if (v60 >= v56)
    {
      goto LABEL_72;
    }
    *(float *)(a1 + 220) = v56;
    v60 = v56;
    goto LABEL_72;
  }
LABEL_73:
  v61 = v49 * 0.7;
  v62 = v61 + v44 * 0.5;
  if (v2)
  {
    v62 = v62 * 0.4;
    v63 = v49 * 0.6;
    if (v62 > v63)
      v62 = v63;
  }
  result = v62 + *(float *)(a1 + 156);
  *(float *)(a1 + 156) = result;
  return result;
}

void SUICLightPhysicsInternal_FinalizeStateForFrame(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  float32x2_t v5;
  uint64_t v6;
  __int32 v7;
  float32x4_t v8;
  __int32 v9;
  __float2 v10;
  __float2 v11;
  __float2 v12;
  float v13;
  float32x2_t v14;
  double v15;
  float v16;
  float32x4_t v17;
  __int32 v18;
  float32x4_t v19;

  v2 = 0;
  v3 = 0;
  v4 = a1 + 32;
  v17 = (float32x4_t)vdupq_n_s32(0x41490FDBu);
  v5 = (float32x2_t)vdup_n_s32(0x3F8CCCCDu);
  do
  {
    noise2();
    v19.i64[0] = v6;
    noise2();
    v18 = v7;
    noise2();
    v8 = v19;
    v8.i32[1] = v18;
    v8.i32[2] = v9;
    v19 = vmulq_f32(v8, v17);
    v10 = __sincosf_stret(v19.f32[2]);
    v11 = __sincosf_stret(v19.f32[1]);
    v12 = __sincosf_stret(v19.f32[0]);
    v13 = (float)(v10.__sinval * (float)-(float)(v12.__sinval * v11.__sinval)) + (float)(v10.__cosval * v11.__cosval);
    v14.f32[0] = v13;
    v14.f32[1] = -(float)(v12.__cosval * v10.__sinval);
    if (*(_QWORD *)(a1 + 232) != 1)
      goto LABEL_10;
    v14.f32[1] = (float)-(float)(v12.__cosval * v10.__sinval) * 0.5;
    if (v3 <= 2)
    {
      v15 = v13 * 0.5 + -0.375;
LABEL_8:
      v16 = v15;
      goto LABEL_9;
    }
    if (v3 < 7)
    {
      v15 = v13 * 0.5 + 0.375;
      goto LABEL_8;
    }
    v16 = 150.0;
LABEL_9:
    v14.f32[0] = v16;
LABEL_10:
    *(float32x2_t *)(a1 + 8 * v3++ + 280) = vmul_f32(v14, v5);
    v2 += 3;
    v4 += 12;
  }
  while (v2 != 33);
}

float SiriOrbPhysicsInternal_UpdateChipsSizes(uint64_t a1)
{
  uint64_t v1;
  float v2;
  float v3;
  double v4;
  float result;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float *v12;
  double v13;
  uint64_t i;
  double v15;
  uint64_t v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 168);
  v2 = 1.0;
  if (!v1)
    v2 = 0.0;
  v3 = *(float *)(a1 + 316);
  v4 = (float)(v3 * v2);
  result = *(float *)(a1 + 304);
  v6 = v4 + result * (1.0 - v3);
  v7 = v6 - result;
  if (v7 != 0.0)
  {
    v8 = *(float *)(a1 + 308);
    v9 = v7 - v8;
    v10 = *(float *)(a1 + 312);
    if ((float)(v7 - v8) <= v10)
    {
      if (v9 >= (float)-v10)
        v11 = v8 + v9;
      else
        v11 = v8 - v10;
    }
    else
    {
      v11 = v8 + v10;
    }
    *(float *)(a1 + 308) = v11;
    if (v7 >= 0.0)
    {
      if (v11 <= v7)
      {
LABEL_14:
        result = result + v11;
        *(float *)(a1 + 304) = result;
        goto LABEL_15;
      }
    }
    else if (v11 >= v7)
    {
      goto LABEL_14;
    }
    *(float *)(a1 + 308) = v7;
    v11 = v7;
    goto LABEL_14;
  }
LABEL_15:
  v12 = (float *)(a1 + 320);
  if (!v1)
  {
    v13 = 0.166666672;
LABEL_21:
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v15 = result;
    if (v13 <= v15)
    {
      LODWORD(v25) = 1065353216;
      if (v13 + 0.166666667 <= v15)
      {
        HIDWORD(v25) = 1065353216;
        if (v13 + 0.333333333 <= v15)
        {
          LODWORD(v26) = 1065353216;
          if (v13 + 0.5 <= v15)
          {
            HIDWORD(v26) = 1065353216;
            if (v13 + 0.666666667 <= v15)
            {
              LODWORD(v27) = 1065353216;
              if (v13 + 0.833333333 <= v15)
                HIDWORD(v27) = 1065353216;
            }
          }
        }
      }
    }
    v16 = 0;
    v17 = 0.0;
    while (1)
    {
      v18 = *v12;
      v19 = (float)(*(float *)((char *)&v25 + v16) * v12[3]) + *v12 * (1.0 - v12[3]);
      v20 = v19 - *v12;
      if (v20 != 0.0)
        break;
LABEL_41:
      v17 = v17 + v18;
      v16 += 4;
      v12 += 4;
      if (v16 == 24)
      {
        *(_DWORD *)(a1 + 920) = *(_DWORD *)(a1 + 320);
        result = v17 * 0.166666667;
        *(float *)(a1 + 916) = result;
        return result;
      }
    }
    v21 = v12[1];
    v22 = v12[2];
    v23 = v20 - v21;
    if ((float)(v20 - v21) <= v22)
    {
      if (v23 >= (float)-v22)
        v24 = v21 + v23;
      else
        v24 = v21 - v22;
    }
    else
    {
      v24 = v21 + v22;
    }
    v12[1] = v24;
    if (v20 >= 0.0)
    {
      if (v24 <= v20)
      {
LABEL_40:
        v18 = v18 + v24;
        *v12 = v18;
        goto LABEL_41;
      }
    }
    else if (v24 >= v20)
    {
      goto LABEL_40;
    }
    v12[1] = v20;
    v24 = v20;
    goto LABEL_40;
  }
  v13 = 0.0;
  if (*(float *)(a1 + 400) <= 0.999)
    goto LABEL_21;
  for (i = 0; i != 24; i += 4)
    v12[i] = 1.0;
  *(_QWORD *)(a1 + 916) = 0x3F8000003F800000;
  return result;
}

void SUICOrbPhysics_UpdatePhysics(float32x4_t *a1, float a2)
{
  int v3;
  int v4;
  BOOL v5;

  v3 = (int)((float)(a2 / a1->f32[3]) + 0.5);
  if (a1->i32[2] < v3)
    v3 = a1->i32[2];
  if (v3 <= 1)
    v3 = 1;
  v4 = v3 - 1;
  do
  {
    SUICOrbPhysicsInternal_UpdatePhysicsTick(a1);
    if (a1[10].i8[0])
      v5 = 1;
    else
      v5 = v4 == 0;
    --v4;
  }
  while (!v5);
  SUICOrbPhysicsInternal_FinalizeStateForFrame((uint64_t)a1);
}

float32_t SUICOrbPhysicsInternal_UpdatePhysicsTick(float32x4_t *a1)
{
  uint64_t v2;
  float v3;
  int v4;
  float v5;
  float v6;
  float32x4_t v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  double v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  double v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  double v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  double v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  double v81;
  double v82;
  double v83;
  float v84;
  float v85;
  float v86;
  float v87;
  double v88;
  float v89;
  float v90;
  float v91;
  float v92;
  float v93;
  float v94;
  float v95;
  float v96;
  float v97;
  float v98;
  float v99;
  float v100;
  float v101;
  float v102;
  float v103;
  double v104;
  float32x4_t *v105;
  float32x4_t v106;
  uint64_t v107;
  float32x4_t v108;
  float v109;
  float v110;
  float v111;
  float v112;
  float v113;
  float v114;
  float v115;
  float v116;
  float32_t result;
  float v118;

  v118 = a1->f32[3];
  a1[57].f32[3] = v118 + a1[57].f32[3];
  v2 = a1[10].i64[1];
  SiriOrbPhysicsInternal_UpdateChipsSizes((uint64_t)a1);
  v3 = a1[57].f32[3];
  v4 = a1[10].u8[1];
  v5 = (float)(v3 - a1[58].f32[1]) * 4.2 + 2.35619449;
  v6 = cosf(v5) * 0.5 + 0.5;
  if (v4)
    v6 = 0.0;
  v8 = a1[1].f32[1] * a1[1].f32[1];
  if (v4)
  {
    v10 = 1.25;
  }
  else
  {
    v9 = v8 * 0.25 + 1.25;
    v10 = v9;
  }
  v11 = 1.0;
  v12 = v10;
  switch(v2)
  {
    case 0:
      if (v4)
        v12 = a1[11].f32[0];
      else
        v12 = 0.0;
      if (a1[57].f32[2] < 0.25)
      {
        a1[10].i8[0] = 1;
        a1[11].i32[0] = 0;
      }
      break;
    case 2:
      if (a1[58].i8[8])
      {
        if (a1[16].f32[0] < 0.025)
        {
          a1[58].f32[1] = v3;
          v13 = (float)(v3 - v3) * 4.2 + 2.35619449;
          v6 = cosf(v13) * 0.5 + 0.5;
          if (v4)
            v6 = 0.0;
        }
        a1[58].i8[8] = 0;
      }
      v12 = v6 * 0.25 + 1.0;
      v11 = 0.2;
      break;
    case 3:
      v12 = 1.0;
      v11 = 0.9;
      break;
    default:
      break;
  }
  if (a1[10].i8[0])
  {
    v14 = a1[11].f32[0];
    v15 = v118;
    goto LABEL_114;
  }
  v14 = a1[11].f32[0];
  v16 = (float)(v12 * a1[11].f32[3]) + v14 * (1.0 - a1[11].f32[3]);
  v17 = v16 - v14;
  if (v17 != 0.0)
  {
    v18 = a1[11].f32[1];
    v19 = a1[11].f32[2];
    v20 = v17 - v18;
    if ((float)(v17 - v18) <= v19)
    {
      if (v20 >= (float)-v19)
        v21 = v18 + v20;
      else
        v21 = v18 - v19;
    }
    else
    {
      v21 = v18 + v19;
    }
    a1[11].f32[1] = v21;
    if (v17 >= 0.0)
    {
      if (v21 <= v17)
      {
LABEL_32:
        v14 = v14 + v21;
        a1[11].f32[0] = v14;
        goto LABEL_33;
      }
    }
    else if (v21 >= v17)
    {
      goto LABEL_32;
    }
    a1[11].f32[1] = v17;
    v21 = v17;
    goto LABEL_32;
  }
LABEL_33:
  if (v2 == 3)
    v12 = v10;
  v22 = a1[12].f32[3];
  v23 = (float)(v12 * v22);
  v24 = a1[12].f32[0];
  v25 = v23 + v24 * (1.0 - v22);
  v26 = v25 - v24;
  if (v26 != 0.0)
  {
    v27 = a1[12].f32[1];
    v28 = a1[12].f32[2];
    v29 = v26 - v27;
    if ((float)(v26 - v27) <= v28)
    {
      if (v29 >= (float)-v28)
        v30 = v27 + v29;
      else
        v30 = v27 - v28;
    }
    else
    {
      v30 = v27 + v28;
    }
    a1[12].f32[1] = v30;
    if (v26 >= 0.0)
    {
      if (v30 <= v26)
      {
LABEL_46:
        a1[12].f32[0] = v24 + v30;
        goto LABEL_47;
      }
    }
    else if (v30 >= v26)
    {
      goto LABEL_46;
    }
    a1[12].f32[1] = v26;
    v30 = v26;
    goto LABEL_46;
  }
LABEL_47:
  v31 = a1[13].f32[0];
  v32 = (float)(v8 * a1[13].f32[3]) + v31 * (1.0 - a1[13].f32[3]);
  v33 = v32 - v31;
  v15 = v118;
  if (v33 == 0.0)
    goto LABEL_59;
  v34 = a1[13].f32[1];
  v35 = a1[13].f32[2];
  v36 = v33 - v34;
  if ((float)(v33 - v34) <= v35)
  {
    if (v36 >= (float)-v35)
      v37 = v34 + v36;
    else
      v37 = v34 - v35;
  }
  else
  {
    v37 = v34 + v35;
  }
  a1[13].f32[1] = v37;
  if (v33 < 0.0)
  {
    if (v37 >= v33)
      goto LABEL_58;
    goto LABEL_57;
  }
  if (v37 > v33)
  {
LABEL_57:
    a1[13].f32[1] = v33;
    v37 = v33;
  }
LABEL_58:
  a1[13].f32[0] = v31 + v37;
LABEL_59:
  v38 = a1[14].f32[3];
  v39 = (float)(v11 * v38);
  v40 = a1[14].f32[0];
  v41 = v39 + v40 * (1.0 - v38);
  v42 = v41 - v40;
  if (v42 == 0.0)
    goto LABEL_71;
  v43 = a1[14].f32[1];
  v44 = a1[14].f32[2];
  v45 = v42 - v43;
  if ((float)(v42 - v43) <= v44)
  {
    if (v45 >= (float)-v44)
      v46 = v43 + v45;
    else
      v46 = v43 - v44;
  }
  else
  {
    v46 = v43 + v44;
  }
  a1[14].f32[1] = v46;
  if (v42 < 0.0)
  {
    if (v46 >= v42)
      goto LABEL_70;
    goto LABEL_69;
  }
  if (v46 > v42)
  {
LABEL_69:
    a1[14].f32[1] = v42;
    v46 = v42;
  }
LABEL_70:
  a1[14].f32[0] = v40 + v46;
LABEL_71:
  v47 = 1.0;
  if (v2 == 2)
    v48 = 0.0;
  else
    v48 = 1.0;
  v49 = a1[15].f32[0];
  v50 = (float)(v48 * a1[15].f32[3]) + v49 * (1.0 - a1[15].f32[3]);
  v51 = v50 - v49;
  if (v51 != 0.0)
  {
    v52 = a1[15].f32[1];
    v53 = a1[15].f32[2];
    v54 = v51 - v52;
    if ((float)(v51 - v52) <= v53)
    {
      if (v54 >= (float)-v53)
        v55 = v52 + v54;
      else
        v55 = v52 - v53;
    }
    else
    {
      v55 = v52 + v53;
    }
    a1[15].f32[1] = v55;
    if (v51 >= 0.0)
    {
      if (v55 <= v51)
      {
LABEL_85:
        a1[15].f32[0] = v49 + v55;
        goto LABEL_86;
      }
    }
    else if (v55 >= v51)
    {
      goto LABEL_85;
    }
    a1[15].f32[1] = v51;
    v55 = v51;
    goto LABEL_85;
  }
LABEL_86:
  if (v2 != 3)
    v47 = 0.0;
  v56 = a1[17].f32[3];
  v57 = (float)(v47 * v56);
  v58 = a1[17].f32[0];
  v59 = v57 + v58 * (1.0 - v56);
  v60 = v59 - v58;
  if (v60 != 0.0)
  {
    v61 = a1[17].f32[1];
    v62 = v60 - v61;
    v63 = a1[17].f32[2];
    if ((float)(v60 - v61) <= v63)
    {
      if (v62 >= (float)-v63)
        v64 = v61 + v62;
      else
        v64 = v61 - v63;
    }
    else
    {
      v64 = v61 + v63;
    }
    a1[17].f32[1] = v64;
    if (v60 >= 0.0)
    {
      if (v64 <= v60)
      {
LABEL_99:
        a1[17].f32[0] = v58 + v64;
        goto LABEL_100;
      }
    }
    else if (v64 >= v60)
    {
      goto LABEL_99;
    }
    a1[17].f32[1] = v60;
    v64 = v60;
    goto LABEL_99;
  }
LABEL_100:
  v65 = 0.0;
  if (v2 == 2)
    v65 = 1.0;
  v66 = a1[16].f32[3];
  v67 = (float)(v65 * v66);
  v68 = a1[16].f32[0];
  v69 = v67 + v68 * (1.0 - v66);
  v70 = v69 - v68;
  if (v70 != 0.0)
  {
    v71 = a1[16].f32[1];
    v72 = v70 - v71;
    v73 = a1[16].f32[2];
    if ((float)(v70 - v71) <= v73)
    {
      if (v72 >= (float)-v73)
        v74 = v71 + v72;
      else
        v74 = v71 - v73;
    }
    else
    {
      v74 = v71 + v73;
    }
    a1[16].f32[1] = v74;
    if (v70 >= 0.0)
    {
      if (v74 <= v70)
      {
LABEL_113:
        a1[16].f32[0] = v68 + v74;
        goto LABEL_114;
      }
    }
    else if (v74 >= v70)
    {
      goto LABEL_113;
    }
    a1[16].f32[1] = v70;
    v74 = v70;
    goto LABEL_113;
  }
LABEL_114:
  v75 = v14 * 1.15;
  a1[57].f32[0] = v75;
  if (!v4)
    a1[57].f32[0] = a1[57].f32[1] * v75;
  v76 = fabsf(a1[12].f32[1]);
  v77 = fabsf(a1[11].f32[1]);
  v78 = fabsf(a1[17].f32[1]);
  v79 = fabsf(a1[16].f32[1]);
  v80 = v76 * 3.0;
  v81 = a1[12].f32[0];
  if (v81 <= 1.33)
  {
    v83 = v15;
  }
  else
  {
    v82 = (v81 + -1.33) * 10.0;
    v83 = v15;
    v80 = v80 + v82 * v15;
  }
  v84 = 1.0;
  if (!v4)
    v84 = 10.0;
  v85 = a1[13].f32[0];
  v86 = v80 + (float)((float)(v84 * v85) * v15);
  v87 = fmaxf(a1[19].f32[1], 0.0);
  v88 = a1[57].f32[1];
  v89 = v86 + v87 * 20.0 * v88;
  v90 = v89 + v77 * 4.0 * v88;
  v91 = v90 + v78 * 4.0;
  v92 = v91 + v79 * 4.0;
  if (v83 * 25.0 < v92)
  {
    v93 = v83 * 25.0;
    v92 = v93;
  }
  v94 = v85
      + (float)((float)((float)((float)((float)(v78 * 5.0) + (float)(v76 * 10.0)) + (float)(v77 * 5.0))
                      + (float)(v87 * 20.0))
              * a1[1].f32[0]);
  if (v94 > 1.3)
    v94 = 1.3;
  v95 = a1[57].f32[2] * v94;
  v96 = a1[18].f32[0];
  v97 = (float)(a1[18].f32[3] * v95) + v96 * (1.0 - a1[18].f32[3]);
  v98 = v97 - v96;
  if (v98 != 0.0)
  {
    v99 = a1[18].f32[1];
    v100 = v98 - v99;
    v101 = a1[18].f32[2];
    if ((float)(v98 - v99) <= v101)
    {
      if (v100 >= (float)-v101)
        v102 = v99 + v100;
      else
        v102 = v99 - v101;
    }
    else
    {
      v102 = v99 + v101;
    }
    a1[18].f32[1] = v102;
    if (v98 >= 0.0)
    {
      if (v102 <= v98)
      {
LABEL_136:
        a1[18].f32[0] = v96 + v102;
        goto LABEL_137;
      }
    }
    else if (v102 >= v98)
    {
      goto LABEL_136;
    }
    a1[18].f32[1] = v98;
    v102 = v98;
    goto LABEL_136;
  }
LABEL_137:
  v103 = a1[16].f32[0];
  v104 = v95 * 0.0025;
  *(float *)&v104 = v104;
  if (v4)
    *(float *)&v104 = 0.0002;
  v105 = a1 + 50;
  v106 = vaddq_f32(vmlaq_n_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v104, 0), (float32x4_t)xmmword_1A377E730, v15), a1[50]);
  a1[50] = v106;
  if (v106.f32[0] > 2.0)
  {
    v7.f32[0] = v106.f32[0] + -2.0;
    HIDWORD(v107) = v106.i32[1];
    *(float *)&v107 = v106.f32[0] + -2.0;
    v7.i32[1] = v106.i32[1];
    v7.i32[2] = v106.i32[2];
    a1[50].i32[2] = v106.i32[2];
    v105->i64[0] = v107;
    v106 = v7;
  }
  if (v106.f32[1] > 2.0)
  {
    v108 = v106;
    v108.f32[1] = v106.f32[1] + -2.0;
    v105->i64[0] = v108.i64[0];
    v108.i32[2] = v106.i32[2];
    a1[50].i32[2] = v106.i32[2];
    v106 = v108;
  }
  if (v106.f32[2] > 2.0)
  {
    a1[50].f32[2] = v106.f32[2] + -2.0;
    v105->i64[0] = v106.i64[0];
  }
  v109 = v83 * 1.25663706;
  v110 = v109 + (float)(v6 * (float)((float)(v109 * 4.0) - v109));
  if (v4)
    v110 = v110 * 0.5;
  v111 = v110 + a1[58].f32[0];
  if (v111 > 6.28318531)
  {
    v112 = v111 + -6.28318531;
    v111 = v112;
  }
  a1[58].f32[0] = v111;
  v113 = v83 * 0.7;
  v114 = v113 + v92 * 0.5;
  v115 = (float)((float)(v113 * 8.0) * v103) + (float)((float)(1.0 - v103) * v114);
  if (v4)
  {
    v115 = v115 * 0.4;
    v116 = v83 * 0.6;
    if (v115 > v116)
      v115 = v116;
  }
  result = v115 + a1[9].f32[3];
  a1[9].f32[3] = result;
  return result;
}

void SUICOrbPhysicsInternal_FinalizeStateForFrame(uint64_t a1)
{
  uint64_t v2;
  float v3;
  uint64_t v4;
  unint64_t v5;
  float32x4_t v6;
  uint64_t v7;
  __int32 v8;
  __int32 v9;
  float v10;
  float32x4_t v11;
  __float2 v12;
  __float2 v13;
  float32x4_t v14;
  __float2 v15;
  uint64_t v16;
  int32x4_t v17;
  unint64_t v18;
  int32x4_t v19;
  uint64_t v20;
  float32x4_t cosval_low;
  float32x4_t v22;
  float32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int32x4_t v31;
  float v32;
  __float2 v33;
  uint64_t v34;
  float v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  uint64_t v39;
  float32_t v40;
  uint64_t v41;
  uint64_t v42;
  float v43;
  float32x4_t v44;
  float32x4_t v45;
  int32x4_t v46;
  int32x4_t v47;
  int32x4_t v48;
  int32x4_t *v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  int32x4_t v58;
  int32x4_t v59;
  __int32 v60;
  int32x4_t v61;
  float32x4_t v62;
  int32x4_t v63;
  int32x4_t v64;
  int32x4_t v65;
  __int128 v66;
  int32x4_t v67;
  int32x4_t v68;
  int32x4_t v69;
  __int128 v70;

  v2 = 0;
  v3 = *(float *)(a1 + 256);
  v4 = a1 + 816;
  v52 = (float32x4_t)*(unsigned int *)(a1 + 176);
  v53 = *(float *)(a1 + 176);
  LODWORD(v5) = 0;
  *((float *)&v5 + 1) = v53;
  v51 = (float32x4_t)v5;
  v6.i64[0] = 0;
  v6.i64[1] = LODWORD(v53);
  v55 = (float32x4_t)vdupq_n_s32(0x41490FDBu);
  v54 = (float32x4_t)vdupq_n_s32(0x3F8CCCCDu);
  v50 = v6;
  do
  {
    noise2();
    v62.i64[0] = v7;
    noise2();
    v60 = v8;
    noise2();
    v10 = 1.0;
    if (!*(_BYTE *)(a1 + 161))
      v10 = *(float *)(a1 + 16 * v2 + 320);
    v11 = v62;
    v11.i32[1] = v60;
    v11.i32[2] = v9;
    v62 = vmulq_f32(v11, v55);
    v12 = __sincosf_stret(v62.f32[2]);
    v13 = __sincosf_stret(v62.f32[0]);
    v14.i32[0] = 0;
    v14.i32[1] = LODWORD(v13.__cosval);
    v14.i64[1] = LODWORD(v13.__sinval);
    v57 = v14;
    v14.i32[0] = 0;
    v14.f32[1] = -v13.__sinval;
    v14.i64[1] = LODWORD(v13.__cosval);
    v56 = v14;
    v15 = __sincosf_stret(v62.f32[1]);
    v16 = 0;
    v17.i32[3] = 0;
    v17.i64[0] = LODWORD(v15.__cosval);
    *(float *)&v17.i32[2] = -v15.__sinval;
    LODWORD(v18) = 0;
    *((float *)&v18 + 1) = v15.__cosval + (float)(1.0 - v15.__cosval);
    v19.i64[0] = LODWORD(v15.__sinval);
    v19.i64[1] = LODWORD(v15.__cosval);
    v63 = v17;
    v64 = (int32x4_t)v18;
    v65 = v19;
    v66 = xmmword_1A377E0D0;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v67 + v16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)COERCE_UNSIGNED_INT(v13.__cosval + (float)(1.0 - v13.__cosval)), COERCE_FLOAT(*(_OWORD *)((char *)&v63 + v16))), v57, *(float32x2_t *)&v63.i8[v16], 1), v56, *(float32x4_t *)((char *)&v63 + v16), 2), (float32x4_t)xmmword_1A377E0D0, *(float32x4_t *)((char *)&v63 + v16), 3);
      v16 += 16;
    }
    while (v16 != 64);
    v20 = 0;
    v22 = (float32x4_t)COERCE_UNSIGNED_INT(-v12.__sinval);
    cosval_low = (float32x4_t)LODWORD(v12.__cosval);
    cosval_low.i32[1] = LODWORD(v12.__sinval);
    v22.i32[1] = LODWORD(v12.__cosval);
    v23.i64[0] = 0;
    v63 = v67;
    v64 = v68;
    v65 = v69;
    v66 = v70;
    v67 = 0uLL;
    v68 = 0uLL;
    v69 = 0uLL;
    v70 = 0uLL;
    do
    {
      v23.i64[1] = COERCE_UNSIGNED_INT(v12.__cosval + (float)(1.0 - v12.__cosval));
      *(float32x4_t *)((char *)&v67 + v20) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(cosval_low, COERCE_FLOAT(*(_OWORD *)((char *)&v63 + v20))), v22, *(float32x2_t *)&v63.i8[v20], 1), v23, *(float32x4_t *)((char *)&v63 + v20), 2), (float32x4_t)xmmword_1A377E0D0, *(float32x4_t *)((char *)&v63 + v20), 3);
      v20 += 16;
    }
    while (v20 != 64);
    v25 = v67;
    v24 = v68;
    v27 = v69;
    v26 = (int32x4_t)v70;
    v28 = vzip1q_s32(v67, v69);
    v29 = vzip2q_s32(v67, v69);
    v30 = vzip1q_s32(v68, (int32x4_t)v70);
    v31 = vzip2q_s32(v68, (int32x4_t)v70);
    *(float32x4_t *)(v4 + 16 * v2) = vaddq_f32((float32x4_t)vzip2q_s32(v29, v31), vmlaq_f32(vmlaq_f32(vmulq_f32((float32x4_t)vzip1q_s32(v28, v30), v54), (float32x4_t)0, (float32x4_t)vzip2q_s32(v28, v30)), (float32x4_t)0, (float32x4_t)vzip1q_s32(v29, v31)));
    if (v3 <= 0.0001)
    {
      v42 = 0;
      v43 = (float)(v53 * (float)(v10 * *(float *)(a1 + 224))) * 0.04;
      v44.i32[0] = 0;
      v44.i64[1] = 0;
      v44.f32[1] = v43;
      v45.i64[0] = 0;
      v45.i64[1] = LODWORD(v43);
      v63 = v25;
      v64 = v24;
      v65 = v27;
      v66 = (__int128)v26;
      v67 = 0uLL;
      v68 = 0uLL;
      v69 = 0uLL;
      v70 = 0uLL;
      do
      {
        *(float32x4_t *)((char *)&v67 + v42) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)LODWORD(v43), COERCE_FLOAT(*(_OWORD *)((char *)&v63 + v42))), v44, *(float32x2_t *)&v63.i8[v42], 1), v45, *(float32x4_t *)((char *)&v63 + v42), 2), (float32x4_t)xmmword_1A377E0D0, *(float32x4_t *)((char *)&v63 + v42), 3);
        v42 += 16;
      }
      while (v42 != 64);
    }
    else
    {
      v32 = ((double)(int)v2 + (double)(int)v2) * 3.14159265 / 6.0 - *(float *)(a1 + 928);
      v61 = v27;
      v62 = (float32x4_t)v26;
      v58 = v25;
      v59 = v24;
      v33 = __sincosf_stret(v32);
      v34 = 0;
      v35 = (float)(v10 * *(float *)(a1 + 224)) * 0.04;
      v36.i32[0] = 0;
      v36.i64[1] = 0;
      v36.f32[1] = v35;
      v37.i64[0] = 0;
      v37.i64[1] = LODWORD(v35);
      v38.i32[2] = 0;
      v38.i32[3] = 1.0;
      v63 = v58;
      v64 = v59;
      v65 = v61;
      v66 = (__int128)v62;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v67 + v34) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)LODWORD(v35), COERCE_FLOAT(*(_OWORD *)((char *)&v63 + v34))), v36, *(float32x2_t *)&v63.i8[v34], 1), v37, *(float32x4_t *)((char *)&v63 + v34), 2), (float32x4_t)xmmword_1A377E0D0, *(float32x4_t *)((char *)&v63 + v34), 3);
        v34 += 16;
      }
      while (v34 != 64);
      v39 = 0;
      v40 = (float)(v3 * v33.__sinval) * 0.03;
      v38.f32[1] = v40;
      v63 = v67;
      v64 = v68;
      v65 = v69;
      v66 = v70;
      v67 = 0uLL;
      v68 = 0uLL;
      v69 = 0uLL;
      v70 = 0uLL;
      do
      {
        v38.f32[0] = (float)(v3 * v33.__cosval) * 0.03;
        *(float32x4_t *)((char *)&v67 + v39) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1A377E0B0, COERCE_FLOAT(*(_OWORD *)((char *)&v63 + v39))), (float32x4_t)xmmword_1A377E0A0, *(float32x2_t *)&v63.i8[v39], 1), (float32x4_t)xmmword_1A377E090, *(float32x4_t *)((char *)&v63 + v39), 2), v38, *(float32x4_t *)((char *)&v63 + v39), 3);
        v39 += 16;
      }
      while (v39 != 64);
      v41 = 0;
      v63 = v67;
      v64 = v68;
      v65 = v69;
      v66 = v70;
      v67 = 0uLL;
      v68 = 0uLL;
      v69 = 0uLL;
      v70 = 0uLL;
      do
      {
        *(float32x4_t *)((char *)&v67 + v41) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v52, COERCE_FLOAT(*(_OWORD *)((char *)&v63 + v41))), v51, *(float32x2_t *)&v63.i8[v41], 1), v50, *(float32x4_t *)((char *)&v63 + v41), 2), (float32x4_t)xmmword_1A377E0D0, *(float32x4_t *)((char *)&v63 + v41), 3);
        v41 += 16;
      }
      while (v41 != 64);
    }
    v46 = v68;
    v47 = v69;
    v48 = (int32x4_t)v70;
    v49 = (int32x4_t *)(a1 + (v2 << 6));
    v49[26] = v67;
    v49[27] = v46;
    v49[28] = v47;
    v49[29] = v48;
    ++v2;
  }
  while (v2 != 6);
}

void _setupSpring(uint64_t a1, uint64_t a2, unint64_t a3, float a4)
{
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;

  v6 = 0.0;
  v7 = 0.0;
  if (a3 <= 3)
  {
    v6 = flt_1A377E770[a3];
    v7 = flt_1A377E780[a3];
  }
  if (a3 != 0 && *(_BYTE *)(a1 + 161) != 0)
  {
    v6 = v6 * 0.5;
    v8 = v7 * 0.25;
  }
  else
  {
    v8 = v7;
  }
  v9 = *(_QWORD *)a1;
  if (*(uint64_t *)a1 <= 59)
  {
    if (!v9)
      return;
    if (v9 == 30)
    {
      v8 = v8 * 9.0;
      v12 = 1.0;
      v13 = 1.0 - v6;
      v14 = 4.0;
LABEL_18:
      v6 = v12 - powf(v13, v14);
    }
  }
  else
  {
    if (v9 != 60)
    {
      if (v9 != 90)
      {
        if (v9 == 240)
        {
          v8 = v8 * 0.222222222;
          v10 = 1.0 - v6;
          v11 = 1.0 - fabsf(sqrtf(v10));
          if (v10 == -INFINITY)
            v6 = -INFINITY;
          else
            v6 = v11;
        }
        goto LABEL_19;
      }
      v8 = v8 * 1.7;
      v12 = 1.0;
      v13 = 1.0 - v6;
      v14 = 1.3;
      goto LABEL_18;
    }
    v8 = v8 * 3.0;
    v6 = 1.0 - (float)((float)(1.0 - v6) * (float)(1.0 - v6));
  }
LABEL_19:
  *(float *)a2 = a4;
  *(_DWORD *)(a2 + 4) = 0;
  *(float *)(a2 + 8) = v8;
  *(float *)(a2 + 12) = v6;
}

void SUICCommonPhysicsInternal_Init_cold_1()
{
  __assert_rtn("SUICCommonPhysicsInternal_Init", "SUICGfxPhysics.m", 300, "!\"Unknown physics rate\"");
}

uint64_t AFDeviceSupportsSystemAssistantExperience()
{
  return MEMORY[0x1E0CFE468]();
}

uint64_t AFLogInitIfNeeded()
{
  return MEMORY[0x1E0CFE528]();
}

uint64_t AFMapsNavigationStatusIsActive()
{
  return MEMORY[0x1E0CFE540]();
}

uint64_t AFOutputVoiceLanguageForRecognitionLanguage()
{
  return MEMORY[0x1E0CFE598]();
}

uint64_t AFPreferencesSupportedLanguages()
{
  return MEMORY[0x1E0CFE5F0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x1E0CD23D0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x1E0CD25F0](retstr, a, b);
}

BOOL CATransform3DEqualToTransform(CATransform3D *a, CATransform3D *b)
{
  return MEMORY[0x1E0CD25F8](a, b);
}

CATransform3D *__cdecl CATransform3DInvert(CATransform3D *__return_ptr retstr, CATransform3D *t)
{
  return (CATransform3D *)MEMORY[0x1E0CD2618](retstr, t);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1E0CD2638](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2640](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1E0CD2658](retstr, t, angle, x, y, z);
}

uint64_t CEMEmojiTokenGetString()
{
  return MEMORY[0x1E0D15D90]();
}

uint64_t CEMEnumerateEmojiTokensInStringWithBlock()
{
  return MEMORY[0x1E0D15DA8]();
}

uint64_t CEMStringContainsEmoji()
{
  return MEMORY[0x1E0D15DC0]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x1E0C98040](locArray, prefArray);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BCB8](red, green, blue, alpha);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x1E0C9BCD8](color1, color2);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C020](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
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

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
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

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CTParagraphStyleGetCompositionLanguageForLanguage()
{
  return MEMORY[0x1E0CA7F68]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1E0DE2B68]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1E0CC6980]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0DC32E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1E0DC4548]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0DC4BE8]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x1E0DC5248]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1E0DC52B0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

float __exp10f(float a1)
{
  float result;

  MEMORY[0x1E0C80AD0](a1);
  return result;
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x1E0C80BD0](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

float cosf(float a1)
{
  float result;

  MEMORY[0x1E0C82B48](a1);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
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

float exp2f(float a1)
{
  float result;

  MEMORY[0x1E0C83290](a1);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void glAttachShader(GLuint program, GLuint shader)
{
  MEMORY[0x1E0CD0968](*(_QWORD *)&program, *(_QWORD *)&shader);
}

void glBindBuffer(GLenum target, GLuint buffer)
{
  MEMORY[0x1E0CD0978](*(_QWORD *)&target, *(_QWORD *)&buffer);
}

void glBindFramebuffer(GLenum target, GLuint framebuffer)
{
  MEMORY[0x1E0CD0980](*(_QWORD *)&target, *(_QWORD *)&framebuffer);
}

void glBindRenderbuffer(GLenum target, GLuint renderbuffer)
{
  MEMORY[0x1E0CD0988](*(_QWORD *)&target, *(_QWORD *)&renderbuffer);
}

uint64_t glBindVertexArrayOES()
{
  return MEMORY[0x1E0CD0998]();
}

void glBlendFunc(GLenum sfactor, GLenum dfactor)
{
  MEMORY[0x1E0CD09B8](*(_QWORD *)&sfactor, *(_QWORD *)&dfactor);
}

void glBufferData(GLenum target, GLsizeiptr size, const GLvoid *data, GLenum usage)
{
  MEMORY[0x1E0CD09C8](*(_QWORD *)&target, size, data, *(_QWORD *)&usage);
}

GLenum glCheckFramebufferStatus(GLenum target)
{
  return MEMORY[0x1E0CD09D8](*(_QWORD *)&target);
}

void glClear(GLbitfield mask)
{
  MEMORY[0x1E0CD09E0](*(_QWORD *)&mask);
}

void glClearColor(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
{
  MEMORY[0x1E0CD09E8](red, green, blue, alpha);
}

void glCompileShader(GLuint shader)
{
  MEMORY[0x1E0CD0A08](*(_QWORD *)&shader);
}

GLuint glCreateProgram(void)
{
  return MEMORY[0x1E0CD0A18]();
}

GLuint glCreateShader(GLenum type)
{
  return MEMORY[0x1E0CD0A20](*(_QWORD *)&type);
}

void glDeleteBuffers(GLsizei n, const GLuint *buffers)
{
  MEMORY[0x1E0CD0A30](*(_QWORD *)&n, buffers);
}

void glDeleteFramebuffers(GLsizei n, const GLuint *framebuffers)
{
  MEMORY[0x1E0CD0A38](*(_QWORD *)&n, framebuffers);
}

void glDeleteProgram(GLuint program)
{
  MEMORY[0x1E0CD0A40](*(_QWORD *)&program);
}

void glDeleteRenderbuffers(GLsizei n, const GLuint *renderbuffers)
{
  MEMORY[0x1E0CD0A48](*(_QWORD *)&n, renderbuffers);
}

void glDeleteShader(GLuint shader)
{
  MEMORY[0x1E0CD0A50](*(_QWORD *)&shader);
}

void glDisable(GLenum cap)
{
  MEMORY[0x1E0CD0A88](*(_QWORD *)&cap);
}

void glDrawArrays(GLenum mode, GLint first, GLsizei count)
{
  MEMORY[0x1E0CD0AA0](*(_QWORD *)&mode, *(_QWORD *)&first, *(_QWORD *)&count);
}

void glDrawElements(GLenum mode, GLsizei count, GLenum type, const GLvoid *indices)
{
  MEMORY[0x1E0CD0AB0](*(_QWORD *)&mode, *(_QWORD *)&count, *(_QWORD *)&type, indices);
}

void glEnable(GLenum cap)
{
  MEMORY[0x1E0CD0AB8](*(_QWORD *)&cap);
}

void glEnableVertexAttribArray(GLuint index)
{
  MEMORY[0x1E0CD0AC0](*(_QWORD *)&index);
}

void glFinish(void)
{
  MEMORY[0x1E0CD0AD0]();
}

void glFramebufferRenderbuffer(GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer)
{
  MEMORY[0x1E0CD0AE8](*(_QWORD *)&target, *(_QWORD *)&attachment, *(_QWORD *)&renderbuffertarget, *(_QWORD *)&renderbuffer);
}

void glGenBuffers(GLsizei n, GLuint *buffers)
{
  MEMORY[0x1E0CD0B00](*(_QWORD *)&n, buffers);
}

void glGenFramebuffers(GLsizei n, GLuint *framebuffers)
{
  MEMORY[0x1E0CD0B08](*(_QWORD *)&n, framebuffers);
}

void glGenRenderbuffers(GLsizei n, GLuint *renderbuffers)
{
  MEMORY[0x1E0CD0B10](*(_QWORD *)&n, renderbuffers);
}

uint64_t glGenVertexArraysOES()
{
  return MEMORY[0x1E0CD0B20]();
}

int glGetAttribLocation(GLuint program, const GLchar *name)
{
  return MEMORY[0x1E0CD0B48](*(_QWORD *)&program, name);
}

GLenum glGetError(void)
{
  return MEMORY[0x1E0CD0B58]();
}

void glGetProgramiv(GLuint program, GLenum pname, GLint *params)
{
  MEMORY[0x1E0CD0B78](*(_QWORD *)&program, *(_QWORD *)&pname, params);
}

void glGetRenderbufferParameteriv(GLenum target, GLenum pname, GLint *params)
{
  MEMORY[0x1E0CD0B80](*(_QWORD *)&target, *(_QWORD *)&pname, params);
}

void glGetShaderiv(GLuint shader, GLenum pname, GLint *params)
{
  MEMORY[0x1E0CD0B98](*(_QWORD *)&shader, *(_QWORD *)&pname, params);
}

void glLinkProgram(GLuint program)
{
  MEMORY[0x1E0CD0BD0](*(_QWORD *)&program);
}

void glShaderSource(GLuint shader, GLsizei count, const GLchar *const *string, const GLint *length)
{
  MEMORY[0x1E0CD0C28](*(_QWORD *)&shader, *(_QWORD *)&count, string, length);
}

void glUseProgram(GLuint program)
{
  MEMORY[0x1E0CD0CE8](*(_QWORD *)&program);
}

void glVertexAttrib3f(GLuint indx, GLfloat x, GLfloat y, GLfloat z)
{
  MEMORY[0x1E0CD0CF0](*(_QWORD *)&indx, x, y, z);
}

void glVertexAttrib4f(GLuint indx, GLfloat x, GLfloat y, GLfloat z, GLfloat w)
{
  MEMORY[0x1E0CD0CF8](*(_QWORD *)&indx, x, y, z, w);
}

void glVertexAttribPointer(GLuint indx, GLint size, GLenum type, GLBOOLean normalized, GLsizei stride, const GLvoid *ptr)
{
  MEMORY[0x1E0CD0D08](*(_QWORD *)&indx, *(_QWORD *)&size, *(_QWORD *)&type, normalized, *(_QWORD *)&stride, ptr);
}

void glViewport(GLint x, GLint y, GLsizei width, GLsizei height)
{
  MEMORY[0x1E0CD0D10](*(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

float logf(float a1)
{
  float result;

  MEMORY[0x1E0C83C00](a1);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

uint64_t noise2()
{
  return MEMORY[0x1E0D7D390]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
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

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C84BC0](a1, a2);
  return result;
}

uint64_t proc_pidoriginatorinfo()
{
  return MEMORY[0x1E0C84C48]();
}

int rand(void)
{
  return MEMORY[0x1E0C84FB0]();
}

float sinf(float a1)
{
  float result;

  MEMORY[0x1E0C85420](a1);
  return result;
}

float tanf(float a1)
{
  float result;

  MEMORY[0x1E0C857F0](a1);
  return result;
}

