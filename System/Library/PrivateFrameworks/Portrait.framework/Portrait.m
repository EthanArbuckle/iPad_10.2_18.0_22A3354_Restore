void PTKTraceInit()
{
  if (initializeOnceToken != -1)
    dispatch_once_f(&initializeOnceToken, 0, (dispatch_function_t)ptKTraceInitialize);
}

id _PTLogSystem()
{
  if (_PTLogSystem_onceToken != -1)
    dispatch_once(&_PTLogSystem_onceToken, &__block_literal_global_1);
  return (id)_PTLogSystem_log;
}

uint64_t PTDefaultsGetDictionary()
{
  return 0;
}

void computeGaussianKernel2D(uint64_t a1)
{
  float v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  float v7;
  uint64_t i;

  v2 = 0.0;
  v3 = -1;
  v4 = a1;
  do
  {
    v5 = 0;
    v6 = -1;
    do
    {
      v7 = pow(2.71828183, (float)((float)((float)((float)v6 * (float)v6) + (float)((float)(int)v3 * (float)(int)v3)) * -0.5))* 0.159154943;
      v2 = v2 + v7;
      *(float *)(v4 + v5) = v7;
      ++v6;
      v5 += 12;
    }
    while (v5 != 36);
    ++v3;
    v4 += 4;
  }
  while (v3 != 2);
  for (i = 0; i != 36; i += 4)
    *(float *)(a1 + i) = *(float *)(a1 + i) / v2;
}

id PTDefaultsPublicGetDictionary()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)&sPortraitDefaultsLock);
  if ((sCachedPortraitDefaultsLoaded & 1) == 0)
  {
    v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.coremedia"));
    objc_msgSend(v0, "dictionaryRepresentation");
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)PTDefaultsPublicGetDictionary_sCachedPortraitDefaults;
    PTDefaultsPublicGetDictionary_sCachedPortraitDefaults = v1;

    sCachedPortraitDefaultsLoaded = 1;
  }
  v3 = (id)PTDefaultsPublicGetDictionary_sCachedPortraitDefaults;
  os_unfair_lock_unlock((os_unfair_lock_t)&sPortraitDefaultsLock);
  return v3;
}

uint64_t FigCFDictionaryGetInt32IfPresent(const __CFDictionary *a1, const void *a2, void *a3)
{
  uint64_t result;
  CFTypeID TypeID;
  void *value;

  value = 0;
  if (!a2)
    FigCFDictionaryGetInt32IfPresent_cold_1();
  if (!a3)
    FigCFDictionaryGetInt32IfPresent_cold_2();
  result = CFDictionaryGetValueIfPresent(a1, a2, (const void **)&value);
  if ((_DWORD)result)
  {
    TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(value))
    {
      CFNumberGetValue((CFNumberRef)value, kCFNumberSInt32Type, a3);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t orientationForTransform(double *a1)
{
  uint64_t v1;
  double *i;

  v1 = 0;
  for (i = (double *)&qword_1C9343A48;
        vabdd_f64(*a1, *(i - 2)) >= 0.00999999978
     || vabdd_f64(a1[1], *(i - 1)) >= 0.00999999978
     || vabdd_f64(a1[2], *i) >= 0.00999999978
     || vabdd_f64(a1[3], i[1]) >= 0.00999999978;
        i += 6)
  {
    if (++v1 == 8)
      return 0xFFFFFFFFLL;
  }
  return orientationForTransform_kDegreeMapping[v1];
}

uint64_t __vfx_script_thumbsup_graph_E58E02C9_8189_4980_ABED_6DF4C8EF7375(double a1)
{
  uint64_t result;
  __int128 *v2;
  __int128 v3;
  float v4;
  __int128 v5;

  result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(__int128 **)(result + 32);
  v3 = *v2;
  v4 = 1.0;
  if (!**(_BYTE **)(result + 16))
    v4 = -1.0;
  **(int32x2_t **)(result + 24) = vdup_n_s32(0x3BB0F27Cu);
  v5 = v3;
  *((float *)&v5 + 1) = v4;
  DWORD2(v5) = DWORD2(v3);
  *v2 = v5;
  return result;
}

uint64_t __vfx_script_thumbsup_graph_B59F1B79_7E62_4E5A_99DF_F365094C2D38(double a1)
{
  uint64_t result;

  result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  **(_DWORD **)(result + 24) = **(_DWORD **)(result + 16) & ~(**(int **)(result + 16) >> 31);
  return result;
}

uint64_t __vfx_script_thumbsup_graph_A591C9B7_84C4_4BEA_8829_4366B5881232(double a1)
{
  uint64_t result;
  float *v2;
  float v3;
  float v4;

  result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(float **)(result + 40);
  v3 = 1.0;
  if (**(_BYTE **)(result + 16))
    v4 = 1.0;
  else
    v4 = -1.0;
  if (!**(_BYTE **)(result + 24))
    v3 = -1.0;
  **(float **)(result + 32) = v4;
  *v2 = v3;
  return result;
}

double __vfx_script_thumbsup_graph_891A5752_872E_4295_B8CA_3104EA0A6053(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  double result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = 1.37667655e-16;
  *(_OWORD *)*(_QWORD *)(arguments_buffer_delayInitStub + 16) = xmmword_1C9343860;
  return result;
}

__n128 __vfx_script_thumbsup_graph_5BEF5B4C_59E5_4DBA_86B0_DB00779F419D(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  __n128 *v2;
  __n128 result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(__n128 **)(arguments_buffer_delayInitStub + 24);
  result = *v2;
  *(int32x4_t *)*(_QWORD *)(arguments_buffer_delayInitStub + 16) = vdupq_n_s32(0x3CA3D70Au);
  __asm { FMOV            V1.4S, #-1.0 }
  _Q1.n128_u32[0] = result.n128_u32[0];
  _Q1.n128_u32[2] = result.n128_u32[2];
  *v2 = _Q1;
  return result;
}

float __vfx_script_thumbsup_graph_451D2F34_D7DE_4C4D_9A5C_B1A778F1CA1C(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  _OWORD *v2;
  _BOOL4 v3;
  __int128 v4;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(_OWORD **)(arguments_buffer_delayInitStub + 32);
  v3 = **(_BYTE **)(arguments_buffer_delayInitStub + 16) == 0;
  **(_DWORD **)(arguments_buffer_delayInitStub + 40) = **(_DWORD **)(arguments_buffer_delayInitStub + 24) & ~(**(int **)(arguments_buffer_delayInitStub + 24) >> 31);
  LODWORD(v4) = dword_1C93438B8[v3];
  DWORD1(v4) = 1025758986;
  *((_QWORD *)&v4 + 1) = __PAIR64__(1.0, -0.5);
  result = 1.0;
  *v2 = v4;
  return result;
}

uint64_t __vfx_script_thumbsup_graph_38F35C26_FEA0_47AB_B998_9FF24156FD6D(double a1)
{
  uint64_t result;

  result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  **(_DWORD **)(result + 24) = **(_DWORD **)(result + 16) & ~(**(int **)(result + 16) >> 31);
  return result;
}

__n128 __vfx_script_thumbsup_graph_31C4109F_11CA_46CC_B9D5_22B60B283208(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  __n128 *v2;
  __n128 result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(__n128 **)(arguments_buffer_delayInitStub + 24);
  result = *v2;
  *(int32x4_t *)*(_QWORD *)(arguments_buffer_delayInitStub + 16) = vdupq_n_s32(0x3CA3D70Au);
  __asm { FMOV            V1.4S, #-1.0 }
  _Q1.n128_u32[0] = result.n128_u32[0];
  _Q1.n128_u32[2] = result.n128_u32[2];
  *v2 = _Q1;
  return result;
}

double __vfx_script_thumbsup_graph_0E7F5D5F_BCDE_46CD_975C_9DB38EBC84DE(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  double result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = 1.37667655e-16;
  *(_OWORD *)*(_QWORD *)(arguments_buffer_delayInitStub + 16) = xmmword_1C9343860;
  return result;
}

float __vfx_script_rain_graph_FA88FCF0_73CA_480E_A020_897384F93F5C(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 20.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

float __vfx_script_rain_graph_D92B57F2_E5A5_43D9_A4FF_0A35F0F95C81(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  uint64_t v2;
  _OWORD *v3;
  int v4;
  _BOOL4 v6;
  _BOOL4 v7;
  float v8;
  float v9;
  __int128 v10;
  __int128 v11;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(_QWORD *)(arguments_buffer_delayInitStub + 32);
  v3 = *(_OWORD **)(arguments_buffer_delayInitStub + 40);
  v4 = **(_DWORD **)(arguments_buffer_delayInitStub + 16);
  v6 = v4 == 90 || v4 == 270;
  v7 = **(_DWORD **)(arguments_buffer_delayInitStub + 24) == 4;
  v8 = 1.03;
  if (!v7 || !v6)
    v8 = 1.375;
  v9 = *(float *)"33s?ffF?";
  if (!v7 || !v6)
    v9 = 1.0;
  if (!v6)
    v8 = *(float *)"ffF?";
  DWORD1(v10) = 0;
  *((_QWORD *)&v10 + 1) = 0;
  LODWORD(v11) = 0;
  *((_QWORD *)&v11 + 1) = 0;
  *((float *)&v11 + 1) = v8;
  result = 1.25;
  if (v6)
    result = v9;
  *(float *)&v10 = result;
  *(_OWORD *)v2 = v11;
  *v3 = v10;
  *(_DWORD *)(v2 + 12) = 1065353216;
  return result;
}

float __vfx_script_rain_graph_C718F1B2_4BA3_4E66_8269_7C49E171E2EC(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float *v2;
  double v3;
  float v4;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(float **)(arguments_buffer_delayInitStub + 32);
  *(float *)&v3 = fminf(fmaxf(**(float **)(arguments_buffer_delayInitStub + 24) * 0.5, 0.0), 1.0);
  vfx_script_texture_sample1d_delayInitStub(v3);
  result = fmaxf(v4, 0.0) * 0.5;
  *v2 = result;
  return result;
}

float __vfx_script_rain_graph_999F57E4_3BBD_4410_9780_400191D6A26B(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float *v2;
  float result;
  float v4;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(float **)(arguments_buffer_delayInitStub + 40);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 10.0;
  v4 = **(float **)(arguments_buffer_delayInitStub + 24) + 0.5;
  **(float **)(arguments_buffer_delayInitStub + 32) = result;
  *v2 = v4;
  return result;
}

float __vfx_script_rain_graph_43A66462_6D38_40C4_9563_E3E4B018C43A(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 30000.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

uint64_t __vfx_script_rain_graph_2E9C9DD9_AFB9_44F3_9725_49E195037824(double a1)
{
  uint64_t result;
  _QWORD *v2;
  uint64_t v3;

  result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(_QWORD **)(result + 24);
  v3 = **(unsigned __int8 **)(result + 16);
  *v2 = v3;
  v2[1] = v3;
  return result;
}

float __vfx_script_rain_graph_25FC010E_3796_4569_84C9_8E9B3FC08F4B(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 650.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

float __vfx_script_lighting_graph_B9299884_EF40_4793_BAD0_BB82A60C4C1E(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 300.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

float __vfx_script_lighting_graph_9DD82DB1_83CC_4C95_8122_529530C0E9A5(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 1000.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

float __vfx_script_lighting_graph_2A1A65D6_42D2_422D_B043_7BA6751C7A80(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 6.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

float __vfx_script_hearts_graph_D45D06FA_D64A_4215_983D_70FBC27B23B0(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 2000.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

uint64_t __vfx_script_hearts_graph_B8CFD00B_F83D_48B4_B9F3_B556F2C755C4(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float *v2;
  int v3;
  double v4;
  uint64_t result;
  unsigned int v6;
  float v7;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(float **)(arguments_buffer_delayInitStub + 16);
  v3 = **(_DWORD **)(arguments_buffer_delayInitStub + 8);
  result = vfx_script_clock_simulation_index_delayInitStub(v4);
  v6 = 277803737
     * (((747796405 * (result + v3) + 553376759) >> (((747796405 * (result + v3) + 553376759) >> 28)
                                                                 + 4)) ^ (747796405 * (result + v3) + 553376759));
  v7 = -4.0;
  if ((float)(COERCE_FLOAT((v6 >> 31) ^ (v6 >> 9) | 0x3F800000) + -1.0) > 0.5)
    v7 = 4.0;
  *v2 = v7;
  v2[1] = v7;
  return result;
}

uint64_t __vfx_script_hearts_graph_B0667801_C60E_4D93_B9A1_27F790726520(double a1)
{
  uint64_t result;
  float v2;

  result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = **(float **)(result + 16) * 9.0;
  if (!**(_BYTE **)(result + 24))
    v2 = 0.0;
  **(float **)(result + 32) = v2;
  return result;
}

uint64_t __vfx_script_hearts_graph_781609DE_FEF0_4B99_B009_050ADBDF1B32(double a1)
{
  uint64_t result;
  float32x4_t *v2;
  float *v3;
  float32x4_t v4;
  float v5;

  result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(float32x4_t **)(result + 40);
  v3 = *(float **)(result + 48);
  v4 = vaddq_f32(*(float32x4_t *)*(_QWORD *)(result + 16), (float32x4_t)xmmword_1C9323350);
  v5 = **(float **)(result + 24) + 0.5;
  if (**(_BYTE **)(result + 32))
    v5 = 0.0;
  *v2 = v4;
  *v3 = v5;
  v2->i32[3] = 1065353216;
  return result;
}

double __vfx_script_hearts_graph_77839324_3A35_4199_A55E_F65CEF5F32BF(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  _DWORD *v2;
  _OWORD *v3;
  int v4;
  double result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(_DWORD **)(arguments_buffer_delayInitStub + 24);
  v3 = *(_OWORD **)(arguments_buffer_delayInitStub + 32);
  v4 = dword_1C9322B98[**(_BYTE **)(arguments_buffer_delayInitStub + 16) == 0];
  *v2 = v4;
  v2[1] = v4;
  result = 0.0;
  *v3 = 0u;
  return result;
}

double __vfx_script_hearts_graph_6501AA18_D88F_4677_984C_34E780A7C1F0(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  double result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = 0.00000133972957;
  *(_OWORD *)*(_QWORD *)(arguments_buffer_delayInitStub + 16) = xmmword_1C9322F10;
  return result;
}

float __vfx_script_hearts_graph_4E082B7E_A3DB_40F5_9D67_FBFC9824FD2D(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = (float)((float)(fminf(fmaxf(**(float **)(arguments_buffer_delayInitStub + 16), 0.0), 1.0) * 0.5) + 0.5) * 0.4;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

float __vfx_script_hearts_graph_4267197A_7D75_425E_8F36_26328B281570(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  _OWORD *v2;
  _OWORD *v3;
  float *v4;
  float v5;
  __int128 v6;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(_OWORD **)(arguments_buffer_delayInitStub + 32);
  v3 = *(_OWORD **)(arguments_buffer_delayInitStub + 40);
  v4 = *(float **)(arguments_buffer_delayInitStub + 48);
  v5 = **(float **)(arguments_buffer_delayInitStub + 24);
  simd_matrix3x3(*(float32x4_t *)*(_QWORD *)(arguments_buffer_delayInitStub + 16));
  *v2 = v6;
  result = (float)(fminf(fmaxf(v5, 0.0), 1.0) * 0.5) + 0.5;
  *v3 = xmmword_1C9323360;
  *v4 = result;
  return result;
}

uint64_t __vfx_script_hearts_graph_27B2C751_CFE3_4369_B337_BEA7A4125BA6(double a1)
{
  uint64_t result;
  _QWORD *v2;
  uint64_t v3;

  result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(_QWORD **)(result + 24);
  v3 = **(unsigned __int8 **)(result + 16);
  *v2 = v3;
  v2[1] = v3;
  return result;
}

double __vfx_script_fireworks_graph_FB239A73_A49B_49A1_B28F_F8EB686AE087(double a1)
{
  _QWORD *arguments_buffer_delayInitStub;
  _QWORD *v2;
  _QWORD *v3;
  double result;

  arguments_buffer_delayInitStub = (_QWORD *)vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = (_QWORD *)arguments_buffer_delayInitStub[2];
  v3 = (_QWORD *)arguments_buffer_delayInitStub[3];
  *(int32x4_t *)arguments_buffer_delayInitStub[4] = vdupq_n_s32(0x3E19999Au);
  *v2 = 0x40ABAE1540023D71;
  result = 0.0000119018532;
  *v3 = 0x3EE8F5C23E6C8B44;
  return result;
}

float __vfx_script_fireworks_graph_EF83050E_3420_4C5E_B29A_63DE74130B60(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 12000.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

uint64_t __vfx_script_fireworks_graph_EA69B710_0EB0_430A_84ED_99FDFB897003(double a1)
{
  uint64_t result;
  _QWORD *v2;
  uint64_t v3;

  result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(_QWORD **)(result + 24);
  v3 = **(unsigned __int8 **)(result + 16);
  *v2 = v3;
  v2[1] = v3;
  return result;
}

float __vfx_script_fireworks_graph_E9D5C3AC_14D8_4C9E_A340_8873556A15AC(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 5000.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

float __vfx_script_fireworks_graph_CECA8E5C_A7BB_4D57_BBA3_E684CB761DA9(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 8000.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

uint64_t __vfx_script_fireworks_graph_CC976411_EC12_4A2C_A577_DD5F08309A69(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  _DWORD *v2;
  double v3;
  uint64_t result;
  int v5;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(_DWORD **)(arguments_buffer_delayInitStub + 40);
  *(float *)&v3 = fminf(fmaxf((float)(**(float **)(arguments_buffer_delayInitStub + 32)- **(float **)(arguments_buffer_delayInitStub + 24))/ (float)((float)(**(float **)(arguments_buffer_delayInitStub + 24) + 1.0)- **(float **)(arguments_buffer_delayInitStub + 24)), 0.0), 1.0);
  result = vfx_script_texture_sample1d_delayInitStub(v3);
  *v2 = v5;
  return result;
}

float __vfx_script_fireworks_graph_C9C0CC36_AD87_4391_B404_40CBC37682DC(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  _QWORD *v2;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(_QWORD **)(arguments_buffer_delayInitStub + 24);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 250.0;
  *v2 = (unint64_t)result;
  v2[1] = (unint64_t)result;
  return result;
}

float __vfx_script_fireworks_graph_C96088C0_AF79_4824_9185_0DFF8E90BFB3(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  _QWORD *v2;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(_QWORD **)(arguments_buffer_delayInitStub + 24);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 30.0;
  *v2 = (unint64_t)result;
  v2[1] = (unint64_t)result;
  return result;
}

double __vfx_script_fireworks_graph_BE082C18_F014_49F4_AE91_49F0A20CA327(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  _QWORD *v2;
  double result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(_QWORD **)(arguments_buffer_delayInitStub + 16);
  *(int32x4_t *)*(_QWORD *)(arguments_buffer_delayInitStub + 24) = vdupq_n_s32(0x3CF5C28Fu);
  result = 1.29236965e-19;
  *v2 = 0x3C03126F3AD844D0;
  return result;
}

double __vfx_script_fireworks_graph_A5860394_860A_466B_9036_4241BA694F84(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  _QWORD *v2;
  double result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(_QWORD **)(arguments_buffer_delayInitStub + 16);
  *(int32x4_t *)*(_QWORD *)(arguments_buffer_delayInitStub + 24) = vdupq_n_s32(0x3D4CCCCDu);
  result = 7.15400071e-19;
  *v2 = 0x3C2A64C33BB78035;
  return result;
}

double __vfx_script_fireworks_graph_9F0A8F07_3A67_4589_A511_28A794F02526(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  _QWORD *v2;
  double result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(_QWORD **)(arguments_buffer_delayInitStub + 16);
  *(int32x4_t *)*(_QWORD *)(arguments_buffer_delayInitStub + 24) = vdupq_n_s32(0x3B03126Fu);
  result = 2.05564881e-20;
  *v2 = 0x3BD844D13BC49BA6;
  return result;
}

double __vfx_script_fireworks_graph_9C215676_B35D_4738_8604_1B0696C120C9(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  double result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = -128.000092;
  **(_QWORD **)(arguments_buffer_delayInitStub + 16) = 0xC0600000C0933333;
  return result;
}

double __vfx_script_fireworks_graph_913AA320_A3AD_4B97_B3CE_288034B4B02B(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  double result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = 2.23432441e-18;
  **(_QWORD **)(arguments_buffer_delayInitStub + 16) = 0x3C449BA63C09A027;
  return result;
}

float __vfx_script_fireworks_graph_70391988_6235_4105_AB03_8B09A79D6EF6(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  _QWORD *v2;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(_QWORD **)(arguments_buffer_delayInitStub + 24);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 30.0;
  *v2 = (unint64_t)result;
  v2[1] = (unint64_t)result;
  return result;
}

float __vfx_script_fireworks_graph_68ABBDD2_799D_4316_B610_A615A6E5C6C0(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 7000.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

double __vfx_script_fireworks_graph_647D8C58_3A96_4185_83BF_F834C05973E6(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  _QWORD *v2;
  float32x4_t v3;
  float32x4_t *v4;
  double result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(_QWORD **)(arguments_buffer_delayInitStub + 24);
  v3 = vmulq_f32(*(float32x4_t *)*(_QWORD *)(arguments_buffer_delayInitStub + 16), (float32x4_t)vdupq_n_s32(0x3F19999Au));
  v4 = *(float32x4_t **)(arguments_buffer_delayInitStub + 40);
  *(int32x4_t *)*(_QWORD *)(arguments_buffer_delayInitStub + 32) = vdupq_n_s32(0x3DCCCCCDu);
  *v4 = v3;
  result = 0.00000157165527;
  *v2 = 0x3EBA5E353E3D3C37;
  return result;
}

float __vfx_script_fireworks_graph_5DD07B06_8DCA_42DA_80D9_81BBED0FBF33(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float *v2;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(float **)(arguments_buffer_delayInitStub + 16);
  result = *v2;
  **(float **)(arguments_buffer_delayInitStub + 24) = *v2;
  return result;
}

double __vfx_script_fireworks_graph_5C6FE0C4_5B31_468F_9708_94003733DEC5(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  _QWORD *v2;
  double result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(_QWORD **)(arguments_buffer_delayInitStub + 16);
  *(int32x4_t *)*(_QWORD *)(arguments_buffer_delayInitStub + 24) = vdupq_n_s32(0x3D4CCCCDu);
  result = 1.50053695e-20;
  *v2 = 0x3BD1B7183AAD03DBLL;
  return result;
}

float __vfx_script_fireworks_graph_5AFE93DC_23D2_46C1_93C9_29F6F7292984(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 0.8;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

double __vfx_script_fireworks_graph_5AC753AC_F888_4AEE_B41F_BA9FA15941CC(double a1)
{
  _QWORD *arguments_buffer_delayInitStub;
  _QWORD *v2;
  _QWORD *v3;
  double result;

  arguments_buffer_delayInitStub = (_QWORD *)vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = (_QWORD *)arguments_buffer_delayInitStub[2];
  v3 = (_QWORD *)arguments_buffer_delayInitStub[3];
  *(int32x4_t *)arguments_buffer_delayInitStub[4] = vdupq_n_s32(0x3DF5C28Fu);
  *v2 = 0x40E8000040300000;
  result = 0.00000157165527;
  *v3 = 0x3EBA5E353E3D3C37;
  return result;
}

double __vfx_script_fireworks_graph_514A5D4A_9A37_436A_B056_B2F8227D2BE1(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  double result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = -128.000092;
  **(_QWORD **)(arguments_buffer_delayInitStub + 16) = 0xC0600000C0933333;
  return result;
}

float __vfx_script_fireworks_graph_4F9764F9_0AFB_41B2_A2E5_90D5BEA2660F(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 10000.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

double __vfx_script_fireworks_graph_4F52B7E1_CA7E_4C70_B2C9_199EA88DF652(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  _QWORD *v2;
  double result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(_QWORD **)(arguments_buffer_delayInitStub + 16);
  *(int32x4_t *)*(_QWORD *)(arguments_buffer_delayInitStub + 24) = vdupq_n_s32(0x3DCCCCCDu);
  result = 1.71806921e-18;
  *v2 = 0x3C3FB15A3BC2A455;
  return result;
}

float __vfx_script_fireworks_graph_4E8B4DDD_D3C2_4DDF_ACF2_2ECC08723FDB(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  unsigned int v2;
  unsigned int v3;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = 747796405 * **(_DWORD **)(arguments_buffer_delayInitStub + 8) - 903319789;
  v3 = 277803737 * ((v2 >> ((v2 >> 28) + 4)) ^ v2);
  result = (float)(COERCE_FLOAT((v3 >> 31) ^ (v3 >> 9) | 0x3F800000) + -1.0) * 6.0;
  **(_QWORD **)(arguments_buffer_delayInitStub + 16) = (int)result;
  return result;
}

double __vfx_script_fireworks_graph_402F3097_0BA4_4A83_9FEB_E7261701F766(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  _QWORD *v2;
  double result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(_QWORD **)(arguments_buffer_delayInitStub + 16);
  *(int32x4_t *)*(_QWORD *)(arguments_buffer_delayInitStub + 24) = vdupq_n_s32(0x3CF5C28Fu);
  result = 1.29236965e-19;
  *v2 = 0x3C03126F3AD844D0;
  return result;
}

double __vfx_script_fireworks_graph_3C6ED067_7943_49AD_A0AE_15130042E793(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  _QWORD *v2;
  double result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(_QWORD **)(arguments_buffer_delayInitStub + 16);
  *(int32x4_t *)*(_QWORD *)(arguments_buffer_delayInitStub + 24) = vdupq_n_s32(0x3D4CCCCDu);
  result = 3.9690488e-19;
  *v2 = 0x3C1D49523B01C2E4;
  return result;
}

float __vfx_script_fireworks_graph_32BE36EE_4AAF_45ED_8B70_F204A610CBF9(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 140.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

uint64_t __vfx_script_fireworks_graph_224CDDEA_614F_4333_A343_6F25B6068E45(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  _DWORD *v2;
  double v3;
  uint64_t result;
  int v5;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(_DWORD **)(arguments_buffer_delayInitStub + 40);
  *(float *)&v3 = fminf(fmaxf((float)(**(float **)(arguments_buffer_delayInitStub + 32)- **(float **)(arguments_buffer_delayInitStub + 24))/ (float)((float)(**(float **)(arguments_buffer_delayInitStub + 24) + 1.0)- **(float **)(arguments_buffer_delayInitStub + 24)), 0.0), 1.0);
  result = vfx_script_texture_sample1d_delayInitStub(v3);
  *v2 = v5;
  return result;
}

float __vfx_script_fireworks_graph_1F546ADD_0390_45D8_A31D_6FD1CEDB0057(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 10000.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

float __vfx_script_fireworks_graph_1E09F83D_74E8_4C33_AF7B_D1F4C7561C24(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  _QWORD *v2;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(_QWORD **)(arguments_buffer_delayInitStub + 24);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 50.0;
  *v2 = (unint64_t)result;
  v2[1] = (unint64_t)result;
  return result;
}

float __vfx_script_fireworks_graph_155128CD_E118_4113_8D6F_8B7F5BA2555D(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 1.12;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

int8x16_t __vfx_script_fireworks_graph_10EDDCB9_24C0_4755_971D_D6EC1FAF1000(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  int8x16_t *v2;
  float v3;
  float32x4_t v4;
  unsigned int v5;
  int8x16_t result;
  float32x4_t v12;
  int8x16_t v13;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(int8x16_t **)(arguments_buffer_delayInitStub + 24);
  v12 = *(float32x4_t *)*(_QWORD *)(arguments_buffer_delayInitStub + 16);
  vfx_script_clock_delta_time_delayInitStub(*(double *)v12.i64);
  v4 = vmulq_n_f32(v12, 1.0 - (float)(v3 + v3));
  v4.i32[3] = 1.0;
  v13 = (int8x16_t)v4;
  if (vfx_script_clock_is_first_frame_delayInitStub(*(double *)v4.i64))
    v5 = -1;
  else
    v5 = 0;
  __asm { FMOV            V1.4S, #1.0 }
  result = vbslq_s8((int8x16_t)vdupq_n_s32(v5), _Q1, v13);
  *v2 = result;
  return result;
}

float __vfx_script_fireworks_graph_07D62C9C_6FAA_4BD9_910F_CDEA5CFCCC06(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float *v2;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(float **)(arguments_buffer_delayInitStub + 16);
  result = *v2;
  **(float **)(arguments_buffer_delayInitStub + 24) = *v2;
  return result;
}

__n128 __vfx_script_confetti_graph_C7F30F02_BA8A_4DBA_8AB9_BEAFDE59A291(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float32x4_t v2;
  float32x4_t v3;
  __n128 result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2.i64[0] = 0;
  v2.i32[3] = 0;
  v3.i64[0] = 0;
  v3.i32[3] = 0;
  v3.f32[2] = **(float **)(arguments_buffer_delayInitStub + 24) * 0.5;
  v2.f32[2] = (float)(v3.f32[2] - **(float **)(arguments_buffer_delayInitStub + 32)) * 0.5;
  result = (__n128)vsubq_f32(vaddq_f32(*(float32x4_t *)*(_QWORD *)(arguments_buffer_delayInitStub + 16), v3), v2);
  result.n128_u32[3] = 1.0;
  *(__n128 *)*(_QWORD *)(arguments_buffer_delayInitStub + 40) = result;
  return result;
}

uint64_t __vfx_script_confetti_graph_B0667801_C60E_4D93_B9A1_27F790726520(double a1)
{
  uint64_t result;
  unint64_t *v2;
  unint64_t *v3;
  float v4;
  BOOL v5;
  float v6;
  float v7;
  float v8;
  unint64_t v9;

  result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(unint64_t **)(result + 56);
  v3 = *(unint64_t **)(result + 64);
  v4 = **(float **)(result + 32);
  v5 = fabsf(v4) <= 0.00000011921;
  v6 = **(float **)(result + 24) / v4;
  v7 = 0.0;
  if (v5)
    v6 = 0.0;
  if (**(_BYTE **)(result + 40))
    v7 = 1.0;
  v8 = (float)(**(float **)(result + 16) * 150.0) * v6;
  v9 = (unint64_t)(float)(v8 + (float)((float)((float)(v8 * 0.5) - v8) * v7));
  if (!**(_BYTE **)(result + 48))
    v9 = 0;
  *v2 = v9;
  v2[1] = v9;
  *v3 = v9;
  v3[1] = v9;
  return result;
}

uint64_t __vfx_script_confetti_graph_A9645361_1E28_4A66_8CE1_0FBB358E68C4(double a1)
{
  uint64_t result;
  unint64_t *v2;
  unint64_t *v3;
  float v4;
  BOOL v5;
  float v6;
  float v7;
  float v8;
  unint64_t v9;

  result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(unint64_t **)(result + 56);
  v3 = *(unint64_t **)(result + 64);
  v4 = **(float **)(result + 24) * 0.5;
  v5 = fabsf(v4) <= 0.00000011921;
  v6 = (float)(v4 - **(float **)(result + 32)) / v4;
  if (v5)
    v6 = 0.0;
  v7 = (float)(**(float **)(result + 16) * 10.0) * v6;
  v8 = 1.0;
  if (!**(_BYTE **)(result + 40))
    v8 = 0.0;
  v9 = (unint64_t)(float)((float)(v7 * v8) + 0.0);
  if (!**(_BYTE **)(result + 48))
    v9 = 0;
  *v2 = v9;
  v2[1] = v9;
  *v3 = v9;
  v3[1] = v9;
  return result;
}

float __vfx_script_confetti_graph_77839324_3A35_4199_A55E_F65CEF5F32BF(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float *v2;
  int v3;
  unsigned int v5;
  int8x8_t v6;
  float v7;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(float **)(arguments_buffer_delayInitStub + 24);
  v3 = **(_DWORD **)(arguments_buffer_delayInitStub + 16);
  if (v3 == 270 || v3 == 90)
    v5 = -1;
  else
    v5 = 0;
  v6 = vbsl_s8((int8x8_t)vdup_n_s32(v5), (int8x8_t)0x4080000040600000, (int8x8_t)0x4060000040400000);
  v7 = fminf(*(float *)v6.i32, *(float *)&v6.i32[1]);
  result = fmaxf(*(float *)v6.i32, *(float *)&v6.i32[1]);
  *v2 = v7;
  v2[1] = result;
  return result;
}

__n128 __vfx_script_confetti_graph_5ECD10AA_AB39_44AA_809D_DE6EF1C771A6(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  __n128 *v2;
  __n128 result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(__n128 **)(arguments_buffer_delayInitStub + 16);
  result = *v2;
  *(__n128 *)*(_QWORD *)(arguments_buffer_delayInitStub + 24) = *v2;
  return result;
}

float __vfx_script_confetti_graph_586EC683_ECAC_48E9_B645_74C36BE0B254(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float *v2;
  int v3;
  unsigned int v5;
  int8x8_t v6;
  float v7;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(float **)(arguments_buffer_delayInitStub + 24);
  v3 = **(_DWORD **)(arguments_buffer_delayInitStub + 16);
  if (v3 == 270 || v3 == 90)
    v5 = -1;
  else
    v5 = 0;
  v6 = vbsl_s8((int8x8_t)vdup_n_s32(v5), (int8x8_t)0x40A0000040900000, (int8x8_t)0x4080000040600000);
  v7 = fminf(*(float *)v6.i32, *(float *)&v6.i32[1]);
  result = fmaxf(*(float *)v6.i32, *(float *)&v6.i32[1]);
  *v2 = v7;
  v2[1] = result;
  return result;
}

__n128 __vfx_script_confetti_graph_47C93548_02F8_4EF6_928F_74CE4F39BBDE(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  __n128 *v2;
  __n128 result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(__n128 **)(arguments_buffer_delayInitStub + 16);
  result = *v2;
  *(__n128 *)*(_QWORD *)(arguments_buffer_delayInitStub + 24) = *v2;
  return result;
}

__n128 __vfx_script_confetti_graph_47AC3C7A_C039_41DA_AD43_881D7E0F565A(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float *v2;
  float32x4_t v3;
  float32x4_t v4;
  __n128 result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(float **)(arguments_buffer_delayInitStub + 24);
  v3.i64[0] = 0;
  v3.i32[3] = 0;
  v3.f32[2] = -*v2;
  v4.i64[0] = 0;
  v4.i32[3] = 0;
  v4.f32[2] = (float)(*v2 - **(float **)(arguments_buffer_delayInitStub + 32)) * 0.5;
  result = (__n128)vaddq_f32(vaddq_f32(vaddq_f32(*(float32x4_t *)*(_QWORD *)(arguments_buffer_delayInitStub + 16), v3), v4), (float32x4_t)xmmword_1C9343760);
  result.n128_u32[3] = 1.0;
  *(__n128 *)*(_QWORD *)(arguments_buffer_delayInitStub + 40) = result;
  return result;
}

uint64_t __vfx_script_confetti_graph_16E7F806_2D73_4A39_B82C_90F26336105A(double a1)
{
  uint64_t result;
  unint64_t *v2;
  unint64_t *v3;
  float v4;
  BOOL v5;
  float v6;
  float v7;
  float v8;
  unint64_t v9;

  result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(unint64_t **)(result + 56);
  v3 = *(unint64_t **)(result + 64);
  v4 = **(float **)(result + 24);
  v5 = fabsf(v4) <= 0.00000011921;
  v6 = (float)(v4 - **(float **)(result + 32)) / v4;
  if (v5)
    v6 = 0.0;
  v7 = (float)(**(float **)(result + 16) * 30.0) * v6;
  v8 = 1.0;
  if (!**(_BYTE **)(result + 40))
    v8 = 0.0;
  v9 = (unint64_t)(float)((float)(v7 * v8) + 0.0);
  if (!**(_BYTE **)(result + 48))
    v9 = 0;
  *v2 = v9;
  v2[1] = v9;
  *v3 = v9;
  v3[1] = v9;
  return result;
}

float __vfx_script_balloons_graph_F1142E3A_E67C_40DC_BC13_10D44D3F90F7(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  _QWORD *v2;
  float v3;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(_QWORD **)(arguments_buffer_delayInitStub + 40);
  v3 = **(float **)(arguments_buffer_delayInitStub + 16);
  if (!**(_BYTE **)(arguments_buffer_delayInitStub + 24))
    v3 = 0.0;
  result = v3 * (float)**(unint64_t **)(arguments_buffer_delayInitStub + 32);
  *v2 = (unint64_t)result;
  v2[1] = (unint64_t)result;
  return result;
}

uint64_t __vfx_script_balloons_graph_C007B07C_DCA2_428B_9117_ECF37793469A(double a1)
{
  uint64_t result;
  int *v2;
  __int128 *v3;
  _QWORD *v4;
  int v5;
  __int128 v6;
  __int128 v7;
  float v8;
  BOOL v9;

  result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(int **)(result + 16);
  v3 = *(__int128 **)(result + 32);
  v4 = *(_QWORD **)(result + 40);
  v5 = *v2;
  *(_QWORD *)&v6 = **(_QWORD **)(result + 24);
  v7 = *v3;
  v8 = 0.0;
  if (fabsf(*((float *)&v6 + 1)) > 0.00000011921)
    v8 = (float)(*(float *)&v6 / *((float *)&v6 + 1)) * 0.25;
  v9 = *(float *)&v6 <= *((float *)&v6 + 1);
  LODWORD(v6) = 0.25;
  if (!v9)
    *(float *)&v6 = v8;
  DWORD2(v7) = *v2;
  DWORD1(v6) = HIDWORD(*v4);
  *v3 = v7;
  DWORD2(v6) = v5;
  *(_OWORD *)v4 = v6;
  *((_DWORD *)v3 + 3) = 1065353216;
  return result;
}

float __vfx_script_balloons_graph_8F8209A1_99A0_4036_A138_3AB3E67064C6(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  _QWORD *v2;
  float v3;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(_QWORD **)(arguments_buffer_delayInitStub + 40);
  v3 = **(float **)(arguments_buffer_delayInitStub + 16);
  if (!**(_BYTE **)(arguments_buffer_delayInitStub + 24))
    v3 = 0.0;
  result = v3 * (float)**(unint64_t **)(arguments_buffer_delayInitStub + 32);
  *v2 = (unint64_t)result;
  v2[1] = (unint64_t)result;
  return result;
}

float __vfx_script_balloons_graph_5CC22647_AE13_4002_961E_197A930CB43A(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  unsigned int v2;
  unsigned int v3;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = 747796405 * **(_DWORD **)(arguments_buffer_delayInitStub + 8) - 903319789;
  v3 = 277803737 * ((v2 >> ((v2 >> 28) + 4)) ^ v2);
  result = (float)(COERCE_FLOAT((v3 >> 31) ^ (v3 >> 9) | 0x3F800000) + -1.0) * 6.0;
  **(_QWORD **)(arguments_buffer_delayInitStub + 16) = (int)result;
  return result;
}

uint64_t __vfx_script_balloons_graph_0C92C45F_EBE3_4B04_B05E_4634866C142E(double a1)
{
  uint64_t result;
  float *v2;
  _QWORD *v3;
  float v4;
  uint64_t v5;
  float v6;
  BOOL v7;
  float v8;
  __int128 v14;

  result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(float **)(result + 16);
  v3 = *(_QWORD **)(result + 32);
  v4 = *v2;
  v5 = **(_QWORD **)(result + 24);
  v6 = 0.0;
  if (fabsf(*((float *)&v5 + 1)) > 0.00000011921)
    v6 = (float)(*(float *)&v5 / *((float *)&v5 + 1)) * 0.5;
  v7 = *(float *)&v5 <= *((float *)&v5 + 1);
  v8 = 0.5;
  if (!v7)
    v8 = v6;
  __asm { FMOV            V3.4S, #1.0 }
  v14 = _Q3;
  *(float *)&v14 = v8;
  *((float *)&v14 + 2) = *v2;
  *(_QWORD *)&_Q3 = *v3;
  *(_OWORD *)*(_QWORD *)(result + 40) = v14;
  *((float *)&_Q3 + 2) = -v4;
  *(_OWORD *)v3 = _Q3;
  return result;
}

char **__vfx_get_script_table_thumbsup()
{
  return &__vfx_get_script_table_thumbsup::scriptTable;
}

char **__vfx_get_script_table_rain()
{
  return &__vfx_get_script_table_rain::scriptTable;
}

char **__vfx_get_script_table_lighting()
{
  return &__vfx_get_script_table_lighting::scriptTable;
}

char **__vfx_get_script_table_lasers()
{
  return &__vfx_get_script_table_lasers::scriptTable;
}

char **__vfx_get_script_table_hearts()
{
  return &__vfx_get_script_table_hearts::scriptTable;
}

char **__vfx_get_script_table_fireworks()
{
  return &__vfx_get_script_table_fireworks::scriptTable;
}

char **__vfx_get_script_table_confetti()
{
  return &__vfx_get_script_table_confetti::scriptTable;
}

char **__vfx_get_script_table_balloons()
{
  return &__vfx_get_script_table_balloons::scriptTable;
}

__n64 simd_matrix3x3(float32x4_t a1)
{
  float v9;
  __n64 result;

  _Q2 = a1;
  _S3 = a1.i32[1];
  _S4 = a1.i32[2];
  __asm { FMLS            S0, S4, V2.S[2] }
  _S6 = _Q2.i32[3];
  __asm { FMLA            S0, S6, V2.S[3] }
  v9 = vmlas_n_f32(vmuls_lane_f32(a1.f32[2], _Q2, 3), a1.f32[1], _Q2.f32[0]);
  __asm
  {
    FMLA            S5, S3, V2.S[1]
    FMLA            S5, S6, V2.S[3]
    FMLS            S5, S2, V2.S[0]
    FMLA            S18, S4, V2.S[1]
    FMLA            S6, S4, V2.S[2]
    FMLS            S6, S2, V2.S[0]
    FMLS            S6, S3, V2.S[1]
  }
  result.n64_f32[1] = v9 + v9;
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void SetEspressoArray(uint64_t *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  int v8;
  NSObject *v9;

  v3 = a2;
  v4 = *a1;
  v5 = a1[11] * a1[10];
  if (v5 == objc_msgSend(v3, "count"))
  {
    if (v5)
    {
      for (i = 0; i != v5; ++i)
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "floatValue");
        *(_DWORD *)(v4 + 4 * i) = v8;

      }
    }
  }
  else
  {
    _PTLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      SetEspressoArray_cold_1(v3, v5, v9);

  }
}

id CopyEspressoArray(int **a1)
{
  int *v1;
  uint64_t v2;
  void *i;
  double v4;
  int v5;
  void *v6;
  void *v7;

  v1 = *a1;
  v2 = (_QWORD)a1[11] * (_QWORD)a1[10];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v2);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); v2; --v2)
  {
    v5 = *v1++;
    LODWORD(v4) = v5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "addObject:", v6);

  }
  v7 = (void *)objc_msgSend(i, "copy");

  return v7;
}

void _DebugLogEspressoBufferRow(_QWORD *a1, unint64_t a2)
{
  void *v3;
  NSObject *v4;

  if (a1[11] <= a2)
    _DebugLogEspressoBufferRow_cold_2();
  _CSVStringForFloats(*a1 + 4 * a1[10] * a2, 1, a1[10]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _PTLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    _DebugLogEspressoBufferRow_cold_1((uint64_t)v3, a2);

}

id _CSVStringForFloats(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v6;
  unint64_t v7;

  v6 = (void *)objc_opt_new();
  if (a3)
  {
    v7 = 0;
    do
    {
      if (v7)
        objc_msgSend(v6, "appendString:", CFSTR(","));
      objc_msgSend(v6, "appendFormat:", CFSTR("%g"), *(float *)(a1 + 4 * v7));
      v7 += a2;
    }
    while (v7 < a3);
  }
  return v6;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_13(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_14(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_15(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_3_0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "length");
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

uint64_t OUTLINED_FUNCTION_7_0(void *a1, const char *a2)
{
  return objc_msgSend(a1, "pixelFormat");
}

std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *this)
{
  size_t i;
  size_t v2;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v3;

  i = this->__i_;
  v2 = (i + 1) % 0x270;
  v3 = this->__x_[(i + 397) % 0x270] ^ ((this->__x_[v2] & 0x7FFFFFFE | this->__x_[i] & 0x80000000) >> 1) ^ ((int)(this->__x_[v2] << 31) >> 31) & 0x9908B0DF;
  this->__x_[i] = v3;
  this->__i_ = v2;
  LODWORD(i) = ((v3 ^ (v3 >> 11)) << 7) & 0x9D2C5680 ^ v3 ^ (v3 >> 11);
  return ((_DWORD)i << 15) & 0xEFC60000 ^ i ^ ((((_DWORD)i << 15) & 0xEFC60000 ^ i) >> 18);
}

double std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>(uint64_t a1, std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *this, double *a3)
{
  double v5;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if (*(_BYTE *)(a1 + 24))
  {
    *(_BYTE *)(a1 + 24) = 0;
    v5 = *(double *)(a1 + 16);
  }
  else
  {
    do
    {
      do
      {
        v7 = (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
        v8 = (v7
            + (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this)
            * 4294967300.0)
           * 5.42101086e-20
           * 2.0
           + -1.0;
        v9 = (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
        v10 = (v9
             + (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this)
             * 4294967300.0)
            * 5.42101086e-20
            * 2.0
            + -1.0;
        v11 = v10 * v10 + v8 * v8;
      }
      while (v11 > 1.0);
    }
    while (v11 == 0.0);
    v12 = sqrt(log(v10 * v10 + v8 * v8) * -2.0 / v11);
    *(double *)(a1 + 16) = v10 * v12;
    *(_BYTE *)(a1 + 24) = 1;
    v5 = v8 * v12;
  }
  return *a3 + v5 * a3[1];
}

uint64_t std::uniform_int_distribution<unsigned int>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>(int a1, std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *this, _DWORD *a3)
{
  uint64_t result;
  int v4;
  unsigned int v6;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unsigned int v12;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v13;

  result = a3[1];
  v4 = result - *a3;
  if ((_DWORD)result != *a3)
  {
    v6 = v4 + 1;
    if (v4 == -1)
    {
      return std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
    }
    else
    {
      v8 = __clz(v6);
      v9 = 31;
      if (((v6 << v8) & 0x7FFFFFFF) != 0)
        v9 = 32;
      v10 = v9 - v8;
      v11 = v10 >> 5;
      if ((v10 & 0x1F) != 0)
        ++v11;
      if (v11 <= v10)
        v12 = 0xFFFFFFFF >> -(v10 / v11);
      else
        v12 = 0;
      do
        v13 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this) & v12;
      while (v13 >= v6);
      return *a3 + v13;
    }
  }
  return result;
}

uint64_t PTThreadTimeGet()
{
  thread_inspect_t v0;
  mach_msg_type_number_t thread_info_outCnt;
  integer_t thread_info_out[4];
  __int128 v4;
  uint64_t v5;

  v5 = 0;
  *(_OWORD *)thread_info_out = 0u;
  v4 = 0u;
  thread_info_outCnt = 10;
  v0 = MEMORY[0x1CAA3AC58]();
  if (thread_info(v0, 3u, thread_info_out, &thread_info_outCnt))
    return -1;
  else
    return thread_info_out[1] + 1000000 * thread_info_out[0];
}

uint64_t PTThreadTimeSubtract(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 - a3;
}

uint64_t PTThreadTimeAdd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3 + a1;
}

id AssetReaderError(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB2D50];
  v8[0] = a1;
  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = a1;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Portrait.AssetReader"), -1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_1C92A0F28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C92A0FB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id loadTracksWithMediaType(void *a1, void *a2)
{
  id v3;
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a1;
  v4 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v5 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __loadTracksWithMediaType_block_invoke;
  v9[3] = &unk_1E822A150;
  v11 = &v12;
  v6 = v5;
  v10 = v6;
  objc_msgSend(v3, "loadTracksWithMediaType:completionHandler:", v4, v9);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void sub_1C92A127C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C92A23D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
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

void __loadTracksWithMediaType_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _PTLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __loadTracksWithMediaType_block_invoke_cold_1();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __loadMetadataForFormat_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _PTLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __loadMetadataForFormat_block_invoke_cold_1();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

uint64_t PTParameterPairSerialization_GetParameter(uint64_t a1, unsigned int a2, int a3, int a4, float *a5)
{
  unsigned __int16 v6;
  uint64_t v7;
  unsigned int *v8;
  NSObject *v9;
  NSObject *v11;

  if (a2)
  {
    v6 = a4;
    v7 = a2;
    v8 = (unsigned int *)(a1 + 4);
    while (a3 != bswap32(*((unsigned __int16 *)v8 - 2)) >> 16)
    {
      v8 += 2;
      if (!--v7)
        goto LABEL_5;
    }
    if (a4 == 2)
    {
      *(_DWORD *)a5 = bswap32(*v8);
    }
    else if (a4 == 1)
    {
      *a5 = _PTSwapBigGetFloat(v8);
    }
    else
    {
      _PTLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        PTParameterPairSerialization_GetParameter_cold_2(a3, v6, v11);

    }
    return 1;
  }
  else
  {
LABEL_5:
    _PTLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      PTParameterPairSerialization_GetParameter_cold_1(a3, v9);

    return 0;
  }
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t PTGroupIDFromFTTrack(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("GroupID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = -1;

  return v3;
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t CanTriggerTwoHandReaction(void *a1, void *a2, float a3)
{
  id v5;
  id v6;
  int v7;
  void *v8;
  float v9;
  void *v10;
  float v11;
  float v12;
  uint64_t v13;
  void *v14;
  float v15;
  unsigned int v16;
  void *v17;
  float v18;
  unsigned int v19;

  v5 = a1;
  v6 = a2;
  v7 = objc_msgSend(v6, "type");
  if (v7 != objc_msgSend(v5, "type"))
    goto LABEL_4;
  objc_msgSend(v5, "confidence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  if (v9 >= a3)
  {

  }
  else
  {
    objc_msgSend(v6, "confidence");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v12 = v11;

    if (v12 < a3)
    {
LABEL_4:
      v13 = 0;
      goto LABEL_15;
    }
  }
  objc_msgSend(v5, "confidence");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  if (v15 < a3 && (v16 = objc_msgSend(v5, "fpMitigation"), v16 < 8) && ((0xD9u >> v16) & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v6, "confidence");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    if (v18 >= a3 || (v19 = objc_msgSend(v6, "fpMitigation"), v19 > 7))
      v13 = 1;
    else
      v13 = (0x26u >> v19) & 1;

  }
LABEL_15:

  return v13;
}

float GetDurationMilliseconds(CMTime *a1, CMTime *a2)
{
  CMTime v3;
  CMTime lhs;
  CMTime time;

  lhs = *a2;
  v3 = *a1;
  CMTimeSubtract(&time, &lhs, &v3);
  return CMTimeGetSeconds(&time) * 1000.0;
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

CFDictionaryRef PTCinematographyDictionaryFromCMTime(uint64_t a1)
{
  const __CFAllocator *v2;
  CMTime v3;

  if ((*(_BYTE *)(a1 + 12) & 1) == 0)
    return (CFDictionaryRef)0;
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = *(CMTime *)a1;
  return CMTimeCopyAsDictionary(&v3, v2);
}

id PTCinematographyDictionaryFromCGRect(double a1, double a2, double a3, double a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("x");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v13[1] = CFSTR("y");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  v13[2] = CFSTR("w");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  v13[3] = CFSTR("h");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

double CGRectFromPTCinematographyDictionary(void *a1)
{
  id v1;
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("x"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("y"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");

  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("w"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");

  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("h"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "doubleValue");
  return v4;
}

CFStringRef NSStringFromCMTime(CMTime *a1)
{
  const __CFAllocator *v1;
  CMTime v3;

  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = *a1;
  return (id)CMTimeCopyDescription(v1, &v3);
}

uint64_t Main_balloons_graph_002BE311_BD95_45E8_95C2_2D34D7AFF9B4(double a1, uint64_t a2, int a3, float *a4, float *a5)
{
  float v8;
  float v9;
  float v10;
  float v11;
  uint64_t result;
  float v13;
  unsigned int v14;
  float v15;
  float v16;
  float v17;

  v8 = *((float *)&a1 + 1);
  v9 = *(float *)&a1;
  *(float *)&a1 = (float)(*(float *)&a1 / *((float *)&a1 + 1)) * 0.25;
  if (fabsf(*((float *)&a1 + 1)) > 0.00000011921)
    v10 = *(float *)&a1;
  else
    v10 = 0.0;
  v17 = v9;
  if (fabsf(v9) > 0.00000011921)
    v11 = (float)(*((float *)&a1 + 1) / v9) * 0.25;
  else
    v11 = 0.0;
  *(float *)&a1 = (float)(*((float *)&a1 + 1) / v9) * 0.25;
  result = vfx_script_clock_simulation_index_delayInitStub(a1);
  if (v17 <= v8)
    v13 = 0.25;
  else
    v13 = v10;
  v14 = 277803737
      * (((747796405 * (result + a3) - 1881823590) >> (((747796405 * (result + a3)
                                                                                   - 1881823590) >> 28)
                                                                   + 4)) ^ (747796405 * (result + a3) - 1881823590));
  v15 = -(float)(v13 - (float)((float)(COERCE_FLOAT((v14 >> 31) ^ (v14 >> 9) | 0x3F800000) + -1.0) * (float)(v13 + v13)));
  if (v17 <= v8)
    v16 = v11;
  else
    v16 = 0.25;
  *a4 = v15;
  *a5 = v16;
  return result;
}

uint64_t __vfx_script_balloons_graph_002BE311_BD95_45E8_95C2_2D34D7AFF9B4(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float *v2;
  float *v3;
  int v4;
  uint64_t v5;
  float v6;
  double v7;
  float v8;
  float v9;
  uint64_t result;
  float v11;
  unsigned int v12;
  float v13;
  float v14;
  float v15;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(float **)(arguments_buffer_delayInitStub + 24);
  v3 = *(float **)(arguments_buffer_delayInitStub + 32);
  v4 = **(_DWORD **)(arguments_buffer_delayInitStub + 8);
  v5 = **(_QWORD **)(arguments_buffer_delayInitStub + 16);
  v6 = *((float *)&v5 + 1);
  LODWORD(v7) = 0;
  v8 = 0.0;
  if (fabsf(*((float *)&v5 + 1)) > 0.00000011921)
    v8 = (float)(*(float *)&v5 / *((float *)&v5 + 1)) * 0.25;
  if (fabsf(*(float *)&v5) > 0.00000011921)
    v9 = (float)(*((float *)&v5 + 1) / *(float *)&v5) * 0.25;
  else
    v9 = 0.0;
  v15 = *(float *)&v5;
  result = vfx_script_clock_simulation_index_delayInitStub(v7);
  if (v15 <= v6)
    v11 = 0.25;
  else
    v11 = v8;
  v12 = 277803737
      * (((747796405 * (result + v4) - 1881823590) >> (((747796405 * (result + v4)
                                                                                   - 1881823590) >> 28)
                                                                   + 4)) ^ (747796405 * (result + v4) - 1881823590));
  v13 = -(float)(v11 - (float)((float)(COERCE_FLOAT((v12 >> 31) ^ (v12 >> 9) | 0x3F800000) + -1.0) * (float)(v11 + v11)));
  if (v15 <= v6)
    v14 = v9;
  else
    v14 = 0.25;
  *v2 = v13;
  *v3 = v14;
  return result;
}

float Main_balloons_graph_5CC22647_AE13_4002_961E_197A930CB43A(const void *a1, int a2, unint64_t *a3)
{
  unsigned int v3;
  float result;

  v3 = 277803737
     * (((747796405 * a2 - 903319789) >> (((747796405 * a2 - 903319789) >> 28) + 4)) ^ (747796405 * a2 - 903319789));
  result = (float)(COERCE_FLOAT((v3 >> 31) ^ (v3 >> 9) | 0x3F800000) + -1.0) * 6.0;
  *a3 = (int)result;
  return result;
}

float Spawn_balloons_graph_8F8209A1_99A0_4036_A138_3AB3E67064C6(float a1, uint64_t a2, uint64_t a3, int a4, unint64_t a5, _QWORD *a6)
{
  float result;

  if (!a4)
    a1 = 0.0;
  result = a1 * (float)a5;
  *a6 = (unint64_t)result;
  a6[1] = (unint64_t)result;
  return result;
}

void Init_balloons_graph_0C92C45F_EBE3_4B04_B05E_4634866C142E(float a1, double a2, uint64_t a3, uint64_t a4, __int128 *a5, _OWORD *a6)
{
  __int128 v6;
  float v7;
  float v10;

  v6 = *a5;
  v7 = 0.0;
  if (fabsf(*((float *)&a2 + 1)) > 0.00000011921)
    v7 = (float)(*(float *)&a2 / *((float *)&a2 + 1)) * 0.5;
  _ZF = *(float *)&a2 == *((float *)&a2 + 1);
  _NF = *(float *)&a2 < *((float *)&a2 + 1);
  v10 = 0.5;
  if (!_NF && !_ZF)
    v10 = v7;
  __asm { FMOV            V3.4S, #1.0 }
  *(float *)&_Q3 = v10;
  *((float *)&_Q3 + 2) = a1;
  *a6 = _Q3;
  *((float *)&v6 + 2) = -a1;
  *a5 = v6;
}

float Init_balloons_graph_C007B07C_DCA2_428B_9117_ECF37793469A(float result, __n128 a2, uint64_t a3, uint64_t a4, __int128 *a5, __n128 *a6)
{
  __int128 v6;
  __n128 v7;
  float v8;
  BOOL v9;
  BOOL v10;

  v6 = *a5;
  v7 = *a6;
  v8 = 0.0;
  if (fabsf(a2.n128_f32[1]) > 0.00000011921)
    v8 = (float)(a2.n128_f32[0] / a2.n128_f32[1]) * 0.25;
  v9 = a2.n128_f32[0] == a2.n128_f32[1];
  v10 = a2.n128_f32[0] < a2.n128_f32[1];
  a2.n128_u32[0] = 0.25;
  if (!v10 && !v9)
    a2.n128_f32[0] = v8;
  *((float *)&v6 + 2) = result;
  *a5 = v6;
  a2.n128_u32[1] = v7.n128_u32[1];
  a2.n128_f32[2] = result;
  *a6 = a2;
  return result;
}

void Main_balloons_graph_30F6F52E_9FD9_4037_93CA_CCE724034EB4(const void *a1, unsigned int a2, BOOL *a3)
{
  *a3 = 1;
}

uint64_t __vfx_script_balloons_graph_30F6F52E_9FD9_4037_93CA_CCE724034EB4(double a1)
{
  uint64_t result;

  result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  **(_BYTE **)(result + 16) = 1;
  return result;
}

float Main_balloons_graph_CD99FC2C_17B7_466E_930E_F05728CE31E3(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result;

  result = a3 * 2000.0;
  *a4 = result;
  return result;
}

float __vfx_script_balloons_graph_CD99FC2C_17B7_466E_930E_F05728CE31E3(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 2000.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

float Main_balloons_graph_598E1865_A878_4D27_8744_3FC0B2A676F9(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result;

  result = a3 * 300.0;
  *a4 = result;
  return result;
}

float __vfx_script_balloons_graph_598E1865_A878_4D27_8744_3FC0B2A676F9(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 300.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

double Main_balloons_graph_B84097E5_E449_4B6D_91CB_A59BE625458A(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  double result;

  result = 0.00000133972957;
  *a3 = xmmword_1C9322F10;
  return result;
}

double __vfx_script_balloons_graph_B84097E5_E449_4B6D_91CB_A59BE625458A(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  double result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = 0.00000133972957;
  *(_OWORD *)*(_QWORD *)(arguments_buffer_delayInitStub + 16) = xmmword_1C9322F10;
  return result;
}

float ParticleInit_balloons_particleInit_0(double a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  float v4;
  float v5;
  BOOL v6;
  float v7;
  BOOL v8;
  BOOL v9;
  float result;
  uint64_t v11;

  v4 = fabsf(*((float *)&a1 + 1));
  v5 = 0.0;
  v8 = v4 == 0.00000011921;
  v6 = v4 >= 0.00000011921;
  v7 = 0.0;
  if (!v8 && v6)
    v7 = (float)(*(float *)&a1 / *((float *)&a1 + 1)) * 0.25;
  if (fabsf(*(float *)&a1) > 0.00000011921)
    v5 = (float)(*((float *)&a1 + 1) / *(float *)&a1) * 0.25;
  v8 = *(float *)&a1 == *((float *)&a1 + 1);
  v9 = *(float *)&a1 < *((float *)&a1 + 1);
  result = 0.25;
  if (v9 || v8)
    *(float *)&v11 = 0.25;
  else
    *(float *)&v11 = v7;
  if (v9 || v8)
    result = v5;
  *((float *)&v11 + 1) = result;
  *a4 = v11;
  return result;
}

uint64_t __vfx_script_balloons_particleInit_0(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t ParticleInit_balloons_particleInit_46(double a1, uint64_t a2, int a3, int a4, int a5, __int128 *a6, _OWORD *a7, __int128 *a8)
{
  __int128 v15;
  float v16;
  float v17;
  int inited;
  float v19;
  float v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  double v24;
  uint64_t result;
  int8x8_t v26;
  uint32x2_t v27;
  float32x2_t v33;
  float32x2_t v35;
  __int128 v36;
  __int128 v37;
  float v38;
  float v39;
  __int128 v40;
  __int128 v41;
  _OWORD v42[6];
  uint64_t v43;

  v38 = *(float *)&a1;
  v43 = *MEMORY[0x1E0C80C00];
  v15 = *a8;
  v40 = *a6;
  v41 = *a8;
  v16 = *((float *)&a1 + 1);
  if (fabsf(*(float *)&a1) > 0.00000011921)
    v17 = (float)(*((float *)&a1 + 1) / *(float *)&a1) * -0.25;
  else
    v17 = -0.0;
  *(float *)&v15 = (float)(*((float *)&a1 + 1) / *(float *)&a1) * -0.25;
  inited = vfx_script_clock_simulation_index_delayInitStub(*(double *)&v15);
  v42[0] = xmmword_1C9322F20;
  v42[1] = xmmword_1C9322F30;
  v42[2] = xmmword_1C9322F40;
  v42[3] = xmmword_1C9322F50;
  v42[4] = xmmword_1C9322F60;
  v42[5] = xmmword_1C9322F70;
  v19 = fmodf((float)(a5 + a4), 6.0);
  if (v38 <= v16)
    v20 = v17;
  else
    v20 = -0.25;
  v21 = a4 + a3;
  v22 = ((747796405 * (v21 + inited) + 1075806120) >> (((747796405 * (v21 + inited) + 1075806120) >> 28) + 4)) ^ (747796405 * (v21 + inited) + 1075806120);
  v37 = v42[(unint64_t)v19];
  v39 = v20
      - (float)((float)((float)(COERCE_FLOAT(((277803737 * v22) >> 31) ^ ((277803737 * v22) >> 9) | 0x3F800000) + -1.0)
                      * 0.3)
              + 0.54);
  v23 = vfx_script_clock_simulation_index_delayInitStub(*(double *)&v37);
  result = vfx_script_clock_simulation_index_delayInitStub(v24);
  v26 = (int8x8_t)vmla_s32((int32x2_t)0x325F2EE4D93A3F7ALL, vadd_s32(vdup_n_s32(v21), (int32x2_t)__PAIR64__(result, v23)), vdup_n_s32(0x2C9277B5u));
  v27 = (uint32x2_t)vmul_s32((int32x2_t)veor_s8((int8x8_t)vshl_u32((uint32x2_t)v26, (uint32x2_t)vsub_s32((int32x2_t)0x300000003, (int32x2_t)vshr_n_u32((uint32x2_t)v26, 0x1CuLL))), v26), vdup_n_s32(0x108EF2D9u));
  __asm { FMOV            V1.2S, #1.0 }
  v33 = (float32x2_t)vorr_s8(veor_s8((int8x8_t)vshl_u32(v27, (uint32x2_t)0xFFFFFFE1FFFFFFF7), (int8x8_t)vshl_u32(v27, (uint32x2_t)0xFFFFFFF7FFFFFFE1)), _D1);
  __asm { FMOV            V1.2S, #-1.0 }
  v35 = vadd_f32(v33, _D1);
  *a7 = v37;
  v36 = v40;
  *((float *)&v36 + 1) = v39;
  DWORD2(v36) = DWORD2(v40);
  *a6 = v36;
  *(_QWORD *)&v36 = v41;
  *((float32x2_t *)&v36 + 1) = v35;
  *a8 = v36;
  return result;
}

uint64_t __vfx_script_balloons_particleInit_46(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t ParticleInit_balloons_particleInit_8(float32x4_t a1, double a2, uint64_t a3, int a4, int a5, float32x4_t *a6, _OWORD *a7, double *a8)
{
  int inited;
  double v14;
  float v15;
  uint64_t result;
  unsigned int v17;
  int v18;
  unsigned int v19;
  float v20;
  int v21;
  const float *v22;
  float32x4_t v23;
  __int128 v24;
  const float *v25;
  float32x4_t v26;
  __int128 v28;
  _OWORD v30[6];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v28 = *(_OWORD *)a8;
  inited = vfx_script_clock_simulation_index_delayInitStub(*a8);
  *(float *)&v14 = fabsf(*(float *)&a2);
  if (*(float *)&v14 > 0.00000011921)
  {
    *(float *)&v14 = (float)(*((float *)&a2 + 1) / *(float *)&a2) * -0.25;
    v15 = *(float *)&v14 + -0.2;
  }
  else
  {
    v15 = -0.2;
  }
  result = vfx_script_clock_simulation_index_delayInitStub(v14);
  v30[0] = xmmword_1C9322F20;
  v30[1] = xmmword_1C9322F30;
  v30[2] = xmmword_1C9322F40;
  v30[3] = xmmword_1C9322F50;
  v30[4] = xmmword_1C9322F60;
  v30[5] = xmmword_1C9322F70;
  v17 = 277803737
      * (((747796405 * (a5 + a4 + result) + 1843050656) >> (((747796405 * (a5 + a4 + result)
                                                                                        + 1843050656) >> 28)
                                                                        + 4)) ^ (747796405 * (a5 + a4 + result)
                                                                               + 1843050656));
  v18 = (int)(float)((float)(COERCE_FLOAT((v17 >> 31) ^ (v17 >> 9) | 0x3F800000) + -1.0) * 6.0);
  v19 = 277803737
      * (((747796405 * (inited + a4) + 2034861790) >> (((747796405 * (inited + a4)
                                                                                   + 2034861790) >> 28)
                                                                   + 4)) ^ (747796405 * (inited + a4) + 2034861790));
  v20 = (float)((float)((float)(COERCE_FLOAT((v19 >> 31) ^ (v19 >> 9) | 0x3F800000) + -1.0)
                      + (float)(COERCE_FLOAT((v19 >> 31) ^ (v19 >> 9) | 0x3F800000) + -1.0))
              + -1.0)
      * 0.1;
  v21 = -1092196762;
  if (*(float *)&a2 <= *((float *)&a2 + 1))
    *(float *)&v21 = v15;
  v22 = (const float *)&unk_1C9322FD0;
  v23 = vld1q_dup_f32(v22);
  v23.i64[0] = __PAIR64__(v21, LODWORD(v20));
  v24 = v30[v18];
  *a6 = vaddq_f32(a1, v23);
  *a7 = v24;
  v25 = (const float *)&dword_1C9322FC0;
  v26 = vld1q_dup_f32(v25);
  v26.i32[0] = v28;
  v26.i32[2] = DWORD2(v28);
  *(float32x4_t *)a8 = v26;
  return result;
}

uint64_t __vfx_script_balloons_particleInit_8(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t ParticleInit_balloons_particleInit_128(double a1, double a2, uint64_t a3, int a4, unsigned int a5, __int128 *a6, _OWORD *a7, __int128 *a8, __int128 *a9)
{
  __int128 v16;
  float v17;
  float v18;
  int inited;
  float v20;
  float v21;
  unsigned int v22;
  unsigned int v23;
  double v24;
  unsigned int v25;
  double v26;
  uint64_t result;
  int8x8_t v28;
  uint32x2_t v29;
  float32x2_t v35;
  float32x2_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  float v41;
  float v42;
  float v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _OWORD v47[6];
  uint64_t v48;

  v41 = *(float *)&a1;
  v43 = *((float *)&a2 + 1);
  v48 = *MEMORY[0x1E0C80C00];
  v44 = *a6;
  v45 = *a9;
  v16 = *a8;
  v46 = *a8;
  v17 = *((float *)&a1 + 1);
  if (fabsf(*(float *)&a1) > 0.00000011921)
    v18 = (float)(*((float *)&a1 + 1) / *(float *)&a1) * -0.25;
  else
    v18 = -0.0;
  *(float *)&v16 = (float)(*((float *)&a1 + 1) / *(float *)&a1) * -0.25;
  inited = vfx_script_clock_simulation_index_delayInitStub(*(double *)&v16);
  v47[0] = xmmword_1C9322F20;
  v47[1] = xmmword_1C9322F30;
  v47[2] = xmmword_1C9322F40;
  v47[3] = xmmword_1C9322F50;
  v47[4] = xmmword_1C9322F60;
  v47[5] = xmmword_1C9322F70;
  v20 = fmodf((float)a5, 6.0);
  if (v41 <= v17)
    v21 = v18;
  else
    v21 = -0.25;
  v22 = a5 + a4;
  v23 = 277803737
      * (((747796405 * (v22 + inited) + 1075806120) >> (((747796405 * (v22 + inited) + 1075806120) >> 28) + 4)) ^ (747796405 * (v22 + inited) + 1075806120));
  v40 = v47[(unint64_t)v20];
  v42 = v21 - (float)((float)((float)(COERCE_FLOAT((v23 >> 31) ^ (v23 >> 9) | 0x3F800000) + -1.0) * 0.7) + 0.54);
  *((float *)&v24 + 1) = v43;
  *(float *)&v24 = v43 + 0.1;
  v25 = vfx_script_clock_simulation_index_delayInitStub(v24);
  result = vfx_script_clock_simulation_index_delayInitStub(v26);
  v28 = (int8x8_t)vmla_s32((int32x2_t)0x325F2EE4D93A3F7ALL, vadd_s32(vdup_n_s32(v22), (int32x2_t)__PAIR64__(result, v25)), vdup_n_s32(0x2C9277B5u));
  v29 = (uint32x2_t)vmul_s32((int32x2_t)veor_s8((int8x8_t)vshl_u32((uint32x2_t)v28, (uint32x2_t)vsub_s32((int32x2_t)0x300000003, (int32x2_t)vshr_n_u32((uint32x2_t)v28, 0x1CuLL))), v28), vdup_n_s32(0x108EF2D9u));
  __asm { FMOV            V1.2S, #1.0 }
  v35 = (float32x2_t)vorr_s8(veor_s8((int8x8_t)vshl_u32(v29, (uint32x2_t)0xFFFFFFE1FFFFFFF7), (int8x8_t)vshl_u32(v29, (uint32x2_t)0xFFFFFFF7FFFFFFE1)), _D1);
  __asm { FMOV            V1.2S, #-1.0 }
  v37 = vadd_f32(v35, _D1);
  *a7 = v40;
  v38 = v44;
  *((float *)&v38 + 1) = v42;
  DWORD2(v38) = DWORD2(v44);
  *a6 = v38;
  *(_QWORD *)&v38 = v45;
  *((float32x2_t *)&v38 + 1) = v37;
  *a9 = v38;
  v39 = v46;
  *((float *)&v39 + 1) = v43 + 0.1;
  DWORD2(v39) = DWORD2(v46);
  *a8 = v39;
  return result;
}

uint64_t __vfx_script_balloons_particleInit_128(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

double ParticleInit_balloons_particleInit_48(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  double result;

  result = 0.0000000134110482;
  *a3 = 0x3E4CCCCD3EB60B2DLL;
  return result;
}

void __vfx_script_balloons_particleInit_48(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t __vfx_script_balloons_particleUpdate_138(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

__n128 ParticleUpdate_balloons_particleUpdate_147(__n128 a1, float a2, float a3, float32x4_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 *a9, __int128 *a10, float32x4_t *a11)
{
  float v16;
  double v17;
  int32x4_t v18;
  int32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  int32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  int32x4_t v35;
  float32x2_t v36;
  float32x2_t v37;
  int32x4_t v38;
  float v39;
  float32x4_t v40;
  float v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float v45;
  float32x2_t v46;
  float32x2_t v47;
  float32x2_t v48;
  float32x2_t v49;
  float32x2_t v50;
  uint64_t v51;
  float32x4_t v52;
  int8x16_t v53;
  float32x2_t v54;
  float32x2_t v55;
  float32_t v56;
  float32x2_t v57;
  float32x2_t v58;
  float32x2_t v59;
  float32x4_t v60;
  int8x16_t v61;
  float32x4_t v62;
  int8x16_t v63;
  float v64;
  float32x4_t v65;
  float32x4_t v66;
  int8x16_t v67;
  int8x16_t v68;
  float v69;
  float v70;
  float v71;
  float v73;
  float v74;
  float32x2_t v75;
  int32x2_t v76;
  float v77;
  float32x4_t v78;
  float v79;
  float v80;
  float v81;
  float32x4_t v82;
  int8x16_t v83;
  float32x4_t v84;
  float32x4_t v85;
  float32x4_t v86;
  __int128 v87;
  float32x4_t v92;
  float32x4_t v93;
  __n128 result;
  float32x4_t v95;
  float v96;
  float v97;
  float32x4_t v98;
  float v99;
  int32x4_t v100;
  __n128 v101;
  __int128 v102;
  float32x4_t v104;

  v101 = *a9;
  v102 = *a10;
  a1.n128_f32[0] = (float)(a1.n128_f32[2] + 1.0) + -0.25;
  vfx_script_texture_sample1d_delayInitStub(a1.n128_f64[0]);
  v99 = v16;
  *(float *)&v17 = a3;
  vfx_script_texture_sample1d_delayInitStub(v17);
  v19 = v18;
  v20 = vaddq_f32(a4, (float32x4_t)xmmword_1C9322F80);
  v21 = vrsqrteq_f32((float32x4_t)xmmword_1C9322F90);
  v22 = vmulq_f32(v21, vrsqrtsq_f32((float32x4_t)xmmword_1C9322F90, vmulq_f32(v21, v21)));
  v23 = vmulq_f32(vmulq_f32(v22, vrsqrtsq_f32((float32x4_t)xmmword_1C9322F90, vmulq_f32(v22, v22))), (float32x4_t)xmmword_1C9322B50);
  v24 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v23, (int32x4_t)v23), (int8x16_t)v23, 0xCuLL);
  v25 = vmlaq_f32(vmulq_f32(v24, vnegq_f32(v20)), v23, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v20, (int32x4_t)v20), (int8x16_t)v20, 0xCuLL));
  v26 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v25, (int32x4_t)v25), (int8x16_t)v25, 0xCuLL);
  v27 = vmulq_f32(v25, v25);
  v27.i64[0] = vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 1), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v27, 2), v27)).u64[0];
  v28 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 0);
  v28.i32[3] = 0;
  v29 = vrsqrteq_f32(v28);
  v30 = vmulq_f32(v29, vrsqrtsq_f32(v28, vmulq_f32(v29, v29)));
  v31 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v27.f32[0] != 0.0)), 0x1FuLL));
  v31.i32[3] = 0;
  v32 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v31), (int8x16_t)vmulq_f32(vmulq_f32(v30, vrsqrtsq_f32(v28, vmulq_f32(v30, v30))), v26), vextq_s8(vextq_s8((int8x16_t)v23, (int8x16_t)v23, 0xCuLL), (int8x16_t)v23, 8uLL));
  v33 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v32, (int32x4_t)v32), (int8x16_t)v32, 0xCuLL), vnegq_f32(v23)), v32, v24);
  v34 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v33, (int32x4_t)v33), (int8x16_t)v33, 0xCuLL);
  v35 = (int32x4_t)vmulq_f32(v33, v33);
  v35.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v35.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v35, 2), *(float32x2_t *)v35.i8)).u32[0];
  v36 = vrsqrte_f32((float32x2_t)v35.u32[0]);
  v37 = vmul_f32(v36, vrsqrts_f32((float32x2_t)v35.u32[0], vmul_f32(v36, v36)));
  v38 = (int32x4_t)vmulq_n_f32(v34, vmul_f32(v37, vrsqrts_f32((float32x2_t)v35.u32[0], vmul_f32(v37, v37))).f32[0]);
  v39 = v23.f32[2] + (float)(v32.f32[0] + *(float *)&v38.i32[1]);
  if (v39 <= 0.0)
  {
    if (v32.f32[0] < v23.f32[2] || v32.f32[0] < *(float *)&v38.i32[1])
    {
      if (*(float *)&v38.i32[1] <= v23.f32[2])
      {
        v41 = sqrtf((float)((float)(v23.f32[2] + 1.0) - v32.f32[0]) - *(float *)&v38.i32[1]);
        v57.i32[0] = vextq_s8((int8x16_t)v32, (int8x16_t)v32, 8uLL).u32[0];
        v57.i32[1] = v38.i32[2];
        *(float32x2_t *)v44.f32 = vadd_f32(*(float32x2_t *)v23.f32, v57);
        v58 = (float32x2_t)__PAIR64__(v32.u32[1], LODWORD(v41));
        v59 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v38.i8, 0);
        *(float32x2_t *)v43.f32 = vsub_f32(*(float32x2_t *)v32.f32, v59);
        v59.f32[0] = v41;
        v59.i32[0] = vmul_f32(v58, v59).u32[0];
        v59.i32[1] = v43.i32[1];
        *(float32x2_t *)&v44.u32[2] = v59;
        goto LABEL_10;
      }
      v45 = sqrtf((float)((float)(*(float *)&v38.i32[1] + 1.0) - v32.f32[0]) - v23.f32[2]);
      v53 = (int8x16_t)v23;
      *(float *)v53.i32 = v45;
      v54 = (float32x2_t)vdup_laneq_s32(v38, 2);
      *(float *)v38.i32 = v32.f32[1] + *(float *)v38.i32;
      v55 = vadd_f32(*(float32x2_t *)v23.f32, v54);
      v54.f32[0] = v45;
      v53.i32[0] = vmul_f32(*(float32x2_t *)v53.i8, v54).u32[0];
      v53.i32[1] = v55.i32[1];
      v56 = v23.f32[0] - v32.f32[2];
      v52 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v38, (int8x16_t)v38, 4uLL), v53, 0xCuLL);
      v52.f32[3] = v56;
    }
    else
    {
      v45 = sqrtf((float)((float)(v32.f32[0] + 1.0) - *(float *)&v38.i32[1]) - v23.f32[2]);
      v46 = (float32x2_t)vextq_s8((int8x16_t)v32, (int8x16_t)v32, 8uLL).u64[0];
      v47 = (float32x2_t)__PAIR64__(v23.u32[1], v46.u32[0]);
      v48 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v38.i8, 0);
      v49 = (float32x2_t)__PAIR64__(v48.u32[1], LODWORD(v45));
      v50 = vadd_f32(*(float32x2_t *)v32.f32, v48);
      v52.i32[0] = vmul_f32((float32x2_t)__PAIR64__(v32.u32[1], LODWORD(v45)), v49).u32[0];
      v52.i32[1] = v50.i32[1];
      v23.i32[1] = v38.i32[2];
      LODWORD(v51) = vadd_f32(*(float32x2_t *)v23.f32, v46).u32[0];
      *(float32x2_t *)v23.f32 = vsub_f32(*(float32x2_t *)v23.f32, v47);
      HIDWORD(v51) = v23.i32[1];
      v52.i64[1] = v51;
    }
    v23.f32[0] = 0.5 / v45;
    v44 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v23.f32, 0);
    goto LABEL_11;
  }
  v40 = (float32x4_t)vzip2q_s32(v38, vuzp1q_s32(v38, (int32x4_t)v23));
  v40.i32[2] = v32.i32[1];
  v41 = sqrtf(v39 + 1.0);
  v42 = (float32x4_t)vuzp2q_s32((int32x4_t)v23, vzip1q_s32((int32x4_t)v23, v38));
  v42.i32[1] = v32.i32[2];
  v44 = vsubq_f32(v40, v42);
  v40.f32[3] = v41;
  v42.f32[3] = v41;
  v43 = vmulq_f32(v40, v42);
  v44.i32[3] = v43.i32[3];
LABEL_10:
  v43.f32[0] = 0.5 / v41;
  v52 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v43.f32, 0);
LABEL_11:
  v60 = vmulq_f32(v44, v52);
  v61 = (int8x16_t)vmulq_f32(v60, (float32x4_t)xmmword_1C9322B60);
  v100 = v19;
  v104 = v60;
  if (vaddv_f32(vadd_f32(*(float32x2_t *)v61.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v61, v61, 8uLL))) >= 0.0)
  {
    v66 = vaddq_f32(v60, (float32x4_t)xmmword_1C9322FA0);
    v67 = (int8x16_t)vmulq_f32(v66, v66);
    v64 = sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v67.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v67, v67, 8uLL))));
    v98 = (float32x4_t)xmmword_1C9322B60;
    v65 = vaddq_f32(v60, (float32x4_t)xmmword_1C9322B60);
  }
  else
  {
    v62 = vaddq_f32(v60, (float32x4_t)xmmword_1C9322B60);
    v63 = (int8x16_t)vmulq_f32(v62, v62);
    v64 = sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v63.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v63, v63, 8uLL))));
    v98 = (float32x4_t)xmmword_1C9322FA0;
    v65 = vaddq_f32(v60, (float32x4_t)xmmword_1C9322FA0);
  }
  v68 = (int8x16_t)vmulq_f32(v65, v65);
  v69 = atan2f(v64, sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v68.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v68, v68, 8uLL)))));
  v70 = v69 + v69;
  v71 = 1.0;
  _ZF = (float)(v69 + v69) == 0.0;
  v73 = 1.0;
  if (!_ZF)
    v73 = sinf(v70) / v70;
  v74 = v73;
  v75 = vrecpe_f32((float32x2_t)LODWORD(v73));
  v76 = (int32x2_t)vmul_f32(v75, vrecps_f32((float32x2_t)LODWORD(v74), v75));
  LODWORD(v77) = vmul_f32((float32x2_t)v76, vrecps_f32((float32x2_t)LODWORD(v74), (float32x2_t)v76)).u32[0];
  if ((float)(v70 * 0.7) != 0.0)
  {
    v96 = v77;
    *(float *)v76.i32 = sinf(v70 * 0.7);
    v77 = v96;
    v71 = *(float *)v76.i32 / (float)(v70 * 0.7);
  }
  *(float *)v76.i32 = (float)(v77 * v71) * 0.7;
  v78 = (float32x4_t)vdupq_lane_s32(v76, 0);
  v79 = v70 * 0.3;
  v80 = 1.0;
  if (v79 != 0.0)
  {
    v95 = v78;
    v97 = v77;
    v81 = sinf(v79);
    v78 = v95;
    v77 = v97;
    v80 = v81 / v79;
  }
  v82 = vmlaq_f32(vmulq_n_f32(v98, (float)(v77 * v80) * 0.3), v104, v78);
  v83 = (int8x16_t)vmulq_f32(v82, v82);
  *(float32x2_t *)v83.i8 = vadd_f32(*(float32x2_t *)v83.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v83, v83, 8uLL));
  v84 = (float32x4_t)vdupq_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v83.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v83.i8, 1)), 0);
  v85 = vrsqrteq_f32(v84);
  v86 = vmulq_f32(v85, vrsqrtsq_f32(v84, vmulq_f32(v85, v85)));
  v87 = v102;
  __asm { FMOV            V3.4S, #1.0 }
  v92 = (float32x4_t)vbslq_s8((int8x16_t)vceqzq_f32(v84), _Q3, (int8x16_t)vmulq_f32(v86, vrsqrtsq_f32(v84, vmulq_f32(v86, v86))));
  v93 = vmulq_f32(v82, v92);
  v92.f32[0] = (float)(fminf(fmaxf(v99, 0.0), 1.0) * a2) + 0.05;
  *a11 = v93;
  result.n128_u64[0] = vzip1q_s32((int32x4_t)v92, v100).u64[0];
  result.n128_u64[1] = v101.n128_u64[1];
  *a9 = result;
  DWORD2(v87) = 0;
  *a10 = v87;
  return result;
}

void __vfx_script_balloons_particleUpdate_147(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
}

__n128 ParticleUpdate_balloons_particleUpdate_28(double a1, uint64_t a2, uint64_t a3, uint64_t a4, int32x4_t *a5, __int128 *a6, int32x4_t *a7)
{
  int32x4_t v15;
  __int128 v16;
  __n128 result;
  int32x4_t v18;
  __int128 v19;

  v18 = *a5;
  v19 = *a6;
  vfx_script_texture_sample1d_delayInitStub(a1);
  __asm { FMOV            V1.4S, #-1.0 }
  *a7 = _Q1;
  _Q1.i32[0] = 1061997773;
  v15.i64[0] = vzip1q_s32(_Q1, v15).u64[0];
  v15.i64[1] = v18.i64[1];
  *a5 = v15;
  v16 = v19;
  DWORD2(v16) = 0;
  *a6 = v16;
  result.n128_u64[0] = v16;
  result.n128_u32[2] = DWORD2(v16);
  return result;
}

double __vfx_script_balloons_particleUpdate_28(double a1)
{
  double v1;
  double result;

  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
  return result;
}

__n128 ParticleUpdate_balloons_particleUpdate_124(__n128 a1, float a2, float a3, float32x4_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 *a9, __int128 *a10, float32x4_t *a11)
{
  float v16;
  double v17;
  int32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  int32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  int32x4_t v33;
  float32x2_t v34;
  float32x2_t v35;
  int32x4_t v36;
  float v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x2_t v43;
  float32x2_t v44;
  float32x2_t v45;
  float32x2_t v46;
  float32x2_t v47;
  float32x2_t v48;
  uint64_t v49;
  int32x2_t v50;
  __int128 v51;
  unint64_t v52;
  float v53;
  float32x4_t v54;
  __n128 result;
  float v56;
  int8x16_t v57;
  float32x2_t v58;
  float32x2_t v59;
  float32x2_t v60;
  float32x2_t v61;
  float32x2_t v62;
  int32x2_t v63;
  float v64;
  __n128 v65;
  __int128 v66;

  v65 = *a9;
  v66 = *a10;
  a1.n128_f32[0] = (float)((float)(a1.n128_f32[2] + 1.0) * 0.75) + -0.25;
  vfx_script_texture_sample1d_delayInitStub(a1.n128_f64[0]);
  v64 = v16;
  *(float *)&v17 = a3;
  vfx_script_texture_sample1d_delayInitStub(v17);
  v19 = vrsqrteq_f32((float32x4_t)xmmword_1C9322F90);
  v20 = vmulq_f32(v19, vrsqrtsq_f32((float32x4_t)xmmword_1C9322F90, vmulq_f32(v19, v19)));
  v21 = vmulq_f32(vmulq_f32(v20, vrsqrtsq_f32((float32x4_t)xmmword_1C9322F90, vmulq_f32(v20, v20))), (float32x4_t)xmmword_1C9322B50);
  v22 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v21, (int32x4_t)v21), (int8x16_t)v21, 0xCuLL);
  v23 = vmlaq_f32(vmulq_f32(v22, vnegq_f32(a4)), v21, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a4, (int32x4_t)a4), (int8x16_t)a4, 0xCuLL));
  v24 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v23, (int32x4_t)v23), (int8x16_t)v23, 0xCuLL);
  v25 = vmulq_f32(v23, v23);
  v25.i64[0] = vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v25.f32, 1), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v25, 2), v25)).u64[0];
  v26 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v25.f32, 0);
  v26.i32[3] = 0;
  v27 = vrsqrteq_f32(v26);
  v28 = vmulq_f32(v27, vrsqrtsq_f32(v26, vmulq_f32(v27, v27)));
  v29 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v25.f32[0] != 0.0)), 0x1FuLL));
  v29.i32[3] = 0;
  v30 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v29), (int8x16_t)vmulq_f32(vmulq_f32(v28, vrsqrtsq_f32(v26, vmulq_f32(v28, v28))), v24), vextq_s8(vextq_s8((int8x16_t)v21, (int8x16_t)v21, 0xCuLL), (int8x16_t)v21, 8uLL));
  v31 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v30, (int32x4_t)v30), (int8x16_t)v30, 0xCuLL), vnegq_f32(v21)), v30, v22);
  v32 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v31, (int32x4_t)v31), (int8x16_t)v31, 0xCuLL);
  v33 = (int32x4_t)vmulq_f32(v31, v31);
  v33.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v33.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v33, 2), *(float32x2_t *)v33.i8)).u32[0];
  v34 = vrsqrte_f32((float32x2_t)v33.u32[0]);
  v35 = vmul_f32(v34, vrsqrts_f32((float32x2_t)v33.u32[0], vmul_f32(v34, v34)));
  v36 = (int32x4_t)vmulq_n_f32(v32, vmul_f32(v35, vrsqrts_f32((float32x2_t)v33.u32[0], vmul_f32(v35, v35))).f32[0]);
  v37 = v21.f32[2] + (float)(v30.f32[0] + *(float *)&v36.i32[1]);
  if (v37 > 0.0)
  {
    v38 = (float32x4_t)vzip2q_s32(v36, vuzp1q_s32(v36, (int32x4_t)v21));
    v38.i32[2] = v30.i32[1];
    v39 = (float32x4_t)vuzp2q_s32((int32x4_t)v21, vzip1q_s32((int32x4_t)v21, v36));
    v39.i32[1] = v30.i32[2];
    v41 = vsubq_f32(v38, v39);
    v38.i32[3] = sqrtf(v37 + 1.0);
    v39.i32[3] = v38.i32[3];
    v40 = vmulq_f32(v38, v39);
    v41.i32[3] = v40.i32[3];
    v40.f32[0] = 0.5 / v38.f32[3];
    v42 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v40.f32, 0);
LABEL_6:
    v52 = v65.n128_u64[1];
    v51 = v66;
    v53 = v64;
    goto LABEL_7;
  }
  if (v30.f32[0] >= v21.f32[2] && v30.f32[0] >= *(float *)&v36.i32[1])
  {
    v43 = (float32x2_t)vextq_s8((int8x16_t)v30, (int8x16_t)v30, 8uLL).u64[0];
    v44 = (float32x2_t)__PAIR64__(v21.u32[1], v43.u32[0]);
    v45 = (float32x2_t)__PAIR64__(v30.u32[1], COERCE_UNSIGNED_INT(sqrtf((float)((float)(v30.f32[0] + 1.0) - *(float *)&v36.i32[1]) - v21.f32[2])));
    v46 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v36.i8, 0);
    v47 = (float32x2_t)__PAIR64__(v46.u32[1], v45.u32[0]);
    v48 = vadd_f32(*(float32x2_t *)v30.f32, v46);
    v42.i32[0] = vmul_f32(v45, v47).u32[0];
    v42.i32[1] = v48.i32[1];
    v21.i32[1] = v36.i32[2];
    LODWORD(v49) = vadd_f32(*(float32x2_t *)v21.f32, v43).u32[0];
    v50 = (int32x2_t)vsub_f32(*(float32x2_t *)v21.f32, v44);
    HIDWORD(v49) = v50.i32[1];
    v42.i64[1] = v49;
    *(float *)v50.i32 = 0.5 / v45.f32[0];
    v41 = (float32x4_t)vdupq_lane_s32(v50, 0);
    goto LABEL_6;
  }
  v52 = v65.n128_u64[1];
  v51 = v66;
  v53 = v64;
  if (*(float *)&v36.i32[1] <= v21.f32[2])
  {
    v60.i32[0] = vextq_s8((int8x16_t)v30, (int8x16_t)v30, 8uLL).u32[0];
    v60.i32[1] = v36.i32[2];
    *(float32x2_t *)v21.f32 = vadd_f32(*(float32x2_t *)v21.f32, v60);
    v61 = (float32x2_t)__PAIR64__(v30.u32[1], COERCE_UNSIGNED_INT(sqrtf((float)((float)(v21.f32[2] + 1.0) - v30.f32[0]) - *(float *)&v36.i32[1])));
    v62 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v36.i8, 0);
    v63 = (int32x2_t)vsub_f32(*(float32x2_t *)v30.f32, v62);
    v62.i32[0] = v61.i32[0];
    v62.i32[0] = vmul_f32(v61, v62).u32[0];
    v62.i32[1] = v63.i32[1];
    *(float32x2_t *)&v41.u32[2] = v62;
    *(float *)v63.i32 = 0.5 / v61.f32[0];
    v42 = (float32x4_t)vdupq_lane_s32(v63, 0);
  }
  else
  {
    v56 = sqrtf((float)((float)(*(float *)&v36.i32[1] + 1.0) - v30.f32[0]) - v21.f32[2]);
    v57 = (int8x16_t)v21;
    *(float *)v57.i32 = v56;
    v58 = (float32x2_t)vdup_laneq_s32(v36, 2);
    *(float *)v36.i32 = v30.f32[1] + *(float *)v36.i32;
    v59 = vadd_f32(*(float32x2_t *)v21.f32, v58);
    v58.f32[0] = v56;
    v57.i32[0] = vmul_f32(*(float32x2_t *)v57.i8, v58).u32[0];
    v57.i32[1] = v59.i32[1];
    v21.f32[0] = v21.f32[0] - v30.f32[2];
    v42 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v36, (int8x16_t)v36, 4uLL), v57, 0xCuLL);
    v42.i32[3] = v21.i32[0];
    v21.f32[0] = 0.5 / v56;
    v41 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v21.f32, 0);
  }
LABEL_7:
  v54 = vmulq_f32(v41, v42);
  v42.f32[0] = (float)(fminf(fmaxf(v53, 0.0), 1.0) * a2) + 0.3;
  *a11 = v54;
  result.n128_u64[0] = vzip1q_s32((int32x4_t)v42, v18).u64[0];
  result.n128_u64[1] = v52;
  *a9 = result;
  DWORD2(v51) = 0;
  *a10 = v51;
  return result;
}

uint64_t __vfx_script_balloons_particleUpdate_124(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t isExpectedSize(void *a1, uint64_t *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a1;
  v6 = a3;
  v7 = *a2;
  if (v7 == objc_msgSend(v5, "width") && (v8 = a2[1], v8 == objc_msgSend(v5, "height")))
  {
    v9 = 1;
  }
  else
  {
    _PTLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      isExpectedSize_cold_1((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);

    v9 = 0;
  }

  return v9;
}

void OUTLINED_FUNCTION_2_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  void *v0;

  return objc_msgSend(v0, "height");
}

uint64_t OUTLINED_FUNCTION_6_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "width");
}

void OUTLINED_FUNCTION_0_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return espresso_get_last_error();
}

uint64_t MediaAnalysisLibraryCore()
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
  v0 = MediaAnalysisLibraryCore_frameworkLibrary;
  v6 = MediaAnalysisLibraryCore_frameworkLibrary;
  if (!MediaAnalysisLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E822A590;
    v8 = *(_OWORD *)&off_1E822A5A0;
    v1 = _sl_dlopen();
    v4[3] = v1;
    MediaAnalysisLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1C92C23F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t MediaAnalysisLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = MediaAnalysisLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getVCPHandGestureImageRequestClass()
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
  v0 = (void *)getVCPHandGestureImageRequestClass_softClass;
  v7 = getVCPHandGestureImageRequestClass_softClass;
  if (!getVCPHandGestureImageRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVCPHandGestureImageRequestClass_block_invoke;
    v3[3] = &unk_1E822A5B8;
    v3[4] = &v4;
    __getVCPHandGestureImageRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1C92C2508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVCPHandGestureImageRequestClass_block_invoke(uint64_t a1)
{
  Class result;

  MediaAnalysisLibrary();
  result = objc_getClass("VCPHandGestureImageRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVCPHandGestureImageRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVCPHandGestureImageRequestClass_block_invoke_cold_1();
    return (Class)getVCPHandGestureVideoRequestClass();
  }
  return result;
}

id getVCPHandGestureVideoRequestClass()
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
  v0 = (void *)getVCPHandGestureVideoRequestClass_softClass;
  v7 = getVCPHandGestureVideoRequestClass_softClass;
  if (!getVCPHandGestureVideoRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVCPHandGestureVideoRequestClass_block_invoke;
    v3[3] = &unk_1E822A5B8;
    v3[4] = &v4;
    __getVCPHandGestureVideoRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1C92C2614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVCPHandGestureVideoRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  MediaAnalysisLibrary();
  result = objc_getClass("VCPHandGestureVideoRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVCPHandGestureVideoRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getVCPHandGestureVideoRequestClass_block_invoke_cold_1();
    return (Class)getVCPHandObjectClass(v3);
  }
  return result;
}

id getVCPHandObjectClass()
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
  v0 = (void *)getVCPHandObjectClass_softClass;
  v7 = getVCPHandObjectClass_softClass;
  if (!getVCPHandObjectClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVCPHandObjectClass_block_invoke;
    v3[3] = &unk_1E822A5B8;
    v3[4] = &v4;
    __getVCPHandObjectClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1C92C2720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVCPHandObjectClass_block_invoke(uint64_t a1)
{
  Class result;

  MediaAnalysisLibrary();
  result = objc_getClass("VCPHandObject");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVCPHandObjectClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVCPHandObjectClass_block_invoke_cold_1();
    return (Class)getVCPRequestFrameWidthPropertyKeySymbolLoc();
  }
  return result;
}

void *getVCPRequestFrameWidthPropertyKeySymbolLoc()
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
  v0 = (void *)getVCPRequestFrameWidthPropertyKeySymbolLoc_ptr;
  v6 = getVCPRequestFrameWidthPropertyKeySymbolLoc_ptr;
  if (!getVCPRequestFrameWidthPropertyKeySymbolLoc_ptr)
  {
    v1 = (void *)MediaAnalysisLibrary();
    v0 = dlsym(v1, "VCPRequestFrameWidthPropertyKey");
    v4[3] = (uint64_t)v0;
    getVCPRequestFrameWidthPropertyKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1C92C2804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getVCPRequestFrameWidthPropertyKey()
{
  id *VCPRequestFrameWidthPropertyKeySymbolLoc;
  uint64_t VCPRequestFrameWidthPropertyKey_cold_1;

  VCPRequestFrameWidthPropertyKeySymbolLoc = (id *)getVCPRequestFrameWidthPropertyKeySymbolLoc();
  if (VCPRequestFrameWidthPropertyKeySymbolLoc)
    return *VCPRequestFrameWidthPropertyKeySymbolLoc;
  VCPRequestFrameWidthPropertyKey_cold_1 = getVCPRequestFrameWidthPropertyKey_cold_1();
  return (id)getVCPRequestFrameHeightPropertyKeySymbolLoc(VCPRequestFrameWidthPropertyKey_cold_1);
}

void *getVCPRequestFrameHeightPropertyKeySymbolLoc()
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
  v0 = (void *)getVCPRequestFrameHeightPropertyKeySymbolLoc_ptr;
  v6 = getVCPRequestFrameHeightPropertyKeySymbolLoc_ptr;
  if (!getVCPRequestFrameHeightPropertyKeySymbolLoc_ptr)
  {
    v1 = (void *)MediaAnalysisLibrary();
    v0 = dlsym(v1, "VCPRequestFrameHeightPropertyKey");
    v4[3] = (uint64_t)v0;
    getVCPRequestFrameHeightPropertyKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1C92C28B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getVCPRequestFrameHeightPropertyKey()
{
  id *VCPRequestFrameHeightPropertyKeySymbolLoc;
  uint64_t VCPRequestFrameWidthPropertyKey_cold_1;

  VCPRequestFrameHeightPropertyKeySymbolLoc = (id *)getVCPRequestFrameHeightPropertyKeySymbolLoc();
  if (VCPRequestFrameHeightPropertyKeySymbolLoc)
    return *VCPRequestFrameHeightPropertyKeySymbolLoc;
  VCPRequestFrameWidthPropertyKey_cold_1 = getVCPRequestFrameWidthPropertyKey_cold_1();
  return (id)getVCPRequestEnableANSTHandDetectionPropertyKeySymbolLoc(VCPRequestFrameWidthPropertyKey_cold_1);
}

void *getVCPRequestEnableANSTHandDetectionPropertyKeySymbolLoc()
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
  v0 = (void *)getVCPRequestEnableANSTHandDetectionPropertyKeySymbolLoc_ptr;
  v6 = getVCPRequestEnableANSTHandDetectionPropertyKeySymbolLoc_ptr;
  if (!getVCPRequestEnableANSTHandDetectionPropertyKeySymbolLoc_ptr)
  {
    v1 = (void *)MediaAnalysisLibrary();
    v0 = dlsym(v1, "VCPRequestEnableANSTHandDetectionPropertyKey");
    v4[3] = (uint64_t)v0;
    getVCPRequestEnableANSTHandDetectionPropertyKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1C92C2964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getVCPRequestEnableANSTHandDetectionPropertyKey()
{
  id *VCPRequestEnableANSTHandDetectionPropertyKeySymbolLoc;
  uint64_t VCPRequestFrameWidthPropertyKey_cold_1;

  VCPRequestEnableANSTHandDetectionPropertyKeySymbolLoc = (id *)getVCPRequestEnableANSTHandDetectionPropertyKeySymbolLoc();
  if (VCPRequestEnableANSTHandDetectionPropertyKeySymbolLoc)
    return *VCPRequestEnableANSTHandDetectionPropertyKeySymbolLoc;
  VCPRequestFrameWidthPropertyKey_cold_1 = getVCPRequestFrameWidthPropertyKey_cold_1();
  return (id)getVCPRequestRotationInDegreesPropertyKeySymbolLoc(VCPRequestFrameWidthPropertyKey_cold_1);
}

void *getVCPRequestRotationInDegreesPropertyKeySymbolLoc()
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
  v0 = (void *)getVCPRequestRotationInDegreesPropertyKeySymbolLoc_ptr;
  v6 = getVCPRequestRotationInDegreesPropertyKeySymbolLoc_ptr;
  if (!getVCPRequestRotationInDegreesPropertyKeySymbolLoc_ptr)
  {
    v1 = (void *)MediaAnalysisLibrary();
    v0 = dlsym(v1, "VCPRequestRotationInDegreesPropertyKey");
    v4[3] = (uint64_t)v0;
    getVCPRequestRotationInDegreesPropertyKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1C92C2A14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getVCPRequestRotationInDegreesPropertyKey()
{
  id *VCPRequestRotationInDegreesPropertyKeySymbolLoc;

  VCPRequestRotationInDegreesPropertyKeySymbolLoc = (id *)getVCPRequestRotationInDegreesPropertyKeySymbolLoc();
  if (VCPRequestRotationInDegreesPropertyKeySymbolLoc)
    return *VCPRequestRotationInDegreesPropertyKeySymbolLoc;
  getVCPRequestFrameWidthPropertyKey_cold_1();
  return getVCPRequestDisableHandDetectionPropertyKeySymbolLoc();
}

void *getVCPRequestDisableHandDetectionPropertyKeySymbolLoc()
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
  v0 = (void *)getVCPRequestDisableHandDetectionPropertyKeySymbolLoc_ptr;
  v6 = getVCPRequestDisableHandDetectionPropertyKeySymbolLoc_ptr;
  if (!getVCPRequestDisableHandDetectionPropertyKeySymbolLoc_ptr)
  {
    v1 = (void *)MediaAnalysisLibrary();
    v0 = dlsym(v1, "VCPRequestDisableHandDetectionPropertyKey");
    v4[3] = (uint64_t)v0;
    getVCPRequestDisableHandDetectionPropertyKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1C92C2AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getVCPRequestDisableHandDetectionPropertyKey()
{
  id *VCPRequestDisableHandDetectionPropertyKeySymbolLoc;
  uint64_t VCPRequestFrameWidthPropertyKey_cold_1;

  VCPRequestDisableHandDetectionPropertyKeySymbolLoc = (id *)getVCPRequestDisableHandDetectionPropertyKeySymbolLoc();
  if (VCPRequestDisableHandDetectionPropertyKeySymbolLoc)
    return *VCPRequestDisableHandDetectionPropertyKeySymbolLoc;
  VCPRequestFrameWidthPropertyKey_cold_1 = getVCPRequestFrameWidthPropertyKey_cold_1();
  return (id)getVCPRequestHandObjectsPropertyKeySymbolLoc(VCPRequestFrameWidthPropertyKey_cold_1);
}

void *getVCPRequestHandObjectsPropertyKeySymbolLoc()
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
  v0 = (void *)getVCPRequestHandObjectsPropertyKeySymbolLoc_ptr;
  v6 = getVCPRequestHandObjectsPropertyKeySymbolLoc_ptr;
  if (!getVCPRequestHandObjectsPropertyKeySymbolLoc_ptr)
  {
    v1 = (void *)MediaAnalysisLibrary();
    v0 = dlsym(v1, "VCPRequestHandObjectsPropertyKey");
    v4[3] = (uint64_t)v0;
    getVCPRequestHandObjectsPropertyKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1C92C2B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getVCPRequestHandObjectsPropertyKey()
{
  id *VCPRequestHandObjectsPropertyKeySymbolLoc;
  uint64_t VCPRequestFrameWidthPropertyKey_cold_1;

  VCPRequestHandObjectsPropertyKeySymbolLoc = (id *)getVCPRequestHandObjectsPropertyKeySymbolLoc();
  if (VCPRequestHandObjectsPropertyKeySymbolLoc)
    return *VCPRequestHandObjectsPropertyKeySymbolLoc;
  VCPRequestFrameWidthPropertyKey_cold_1 = getVCPRequestFrameWidthPropertyKey_cold_1();
  return (id)getVCPRequestFaceRectsPropertyKeySymbolLoc(VCPRequestFrameWidthPropertyKey_cold_1);
}

void *getVCPRequestFaceRectsPropertyKeySymbolLoc()
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
  v0 = (void *)getVCPRequestFaceRectsPropertyKeySymbolLoc_ptr;
  v6 = getVCPRequestFaceRectsPropertyKeySymbolLoc_ptr;
  if (!getVCPRequestFaceRectsPropertyKeySymbolLoc_ptr)
  {
    v1 = (void *)MediaAnalysisLibrary();
    v0 = dlsym(v1, "VCPRequestFaceRectsPropertyKey");
    v4[3] = (uint64_t)v0;
    getVCPRequestFaceRectsPropertyKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1C92C2C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getVCPRequestFaceRectsPropertyKey()
{
  id *VCPRequestFaceRectsPropertyKeySymbolLoc;
  uint64_t VCPRequestFrameWidthPropertyKey_cold_1;

  VCPRequestFaceRectsPropertyKeySymbolLoc = (id *)getVCPRequestFaceRectsPropertyKeySymbolLoc();
  if (VCPRequestFaceRectsPropertyKeySymbolLoc)
    return *VCPRequestFaceRectsPropertyKeySymbolLoc;
  VCPRequestFrameWidthPropertyKey_cold_1 = getVCPRequestFrameWidthPropertyKey_cold_1();
  return (id)getVCPRequestFaceYawsPropertyKeySymbolLoc(VCPRequestFrameWidthPropertyKey_cold_1);
}

void *getVCPRequestFaceYawsPropertyKeySymbolLoc()
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
  v0 = (void *)getVCPRequestFaceYawsPropertyKeySymbolLoc_ptr;
  v6 = getVCPRequestFaceYawsPropertyKeySymbolLoc_ptr;
  if (!getVCPRequestFaceYawsPropertyKeySymbolLoc_ptr)
  {
    v1 = (void *)MediaAnalysisLibrary();
    v0 = dlsym(v1, "VCPRequestFaceYawsPropertyKey");
    v4[3] = (uint64_t)v0;
    getVCPRequestFaceYawsPropertyKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1C92C2CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getVCPRequestFaceYawsPropertyKey()
{
  id *VCPRequestFaceYawsPropertyKeySymbolLoc;

  VCPRequestFaceYawsPropertyKeySymbolLoc = (id *)getVCPRequestFaceYawsPropertyKeySymbolLoc();
  if (VCPRequestFaceYawsPropertyKeySymbolLoc)
    return *VCPRequestFaceYawsPropertyKeySymbolLoc;
  getVCPRequestFrameWidthPropertyKey_cold_1();
  return getVCPRequestMaxNumOfPersonsPropertyKeySymbolLoc();
}

void *getVCPRequestMaxNumOfPersonsPropertyKeySymbolLoc()
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
  v0 = (void *)getVCPRequestMaxNumOfPersonsPropertyKeySymbolLoc_ptr;
  v6 = getVCPRequestMaxNumOfPersonsPropertyKeySymbolLoc_ptr;
  if (!getVCPRequestMaxNumOfPersonsPropertyKeySymbolLoc_ptr)
  {
    v1 = (void *)MediaAnalysisLibrary();
    v0 = dlsym(v1, "VCPRequestMaxNumOfPersonsPropertyKey");
    v4[3] = (uint64_t)v0;
    getVCPRequestMaxNumOfPersonsPropertyKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1C92C2D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getVCPRequestMaxNumOfPersonsPropertyKey()
{
  id *VCPRequestMaxNumOfPersonsPropertyKeySymbolLoc;
  uint64_t VCPRequestFrameWidthPropertyKey_cold_1;

  VCPRequestMaxNumOfPersonsPropertyKeySymbolLoc = (id *)getVCPRequestMaxNumOfPersonsPropertyKeySymbolLoc();
  if (VCPRequestMaxNumOfPersonsPropertyKeySymbolLoc)
    return *VCPRequestMaxNumOfPersonsPropertyKeySymbolLoc;
  VCPRequestFrameWidthPropertyKey_cold_1 = getVCPRequestFrameWidthPropertyKey_cold_1();
  return (id)getVCPRequestUseAsyncPropertyKeySymbolLoc(VCPRequestFrameWidthPropertyKey_cold_1);
}

void *getVCPRequestUseAsyncPropertyKeySymbolLoc()
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
  v0 = (void *)getVCPRequestUseAsyncPropertyKeySymbolLoc_ptr;
  v6 = getVCPRequestUseAsyncPropertyKeySymbolLoc_ptr;
  if (!getVCPRequestUseAsyncPropertyKeySymbolLoc_ptr)
  {
    v1 = (void *)MediaAnalysisLibrary();
    v0 = dlsym(v1, "VCPRequestUseAsyncPropertyKey");
    v4[3] = (uint64_t)v0;
    getVCPRequestUseAsyncPropertyKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1C92C2E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

float getVCPRequestUseAsyncPropertyKey()
{
  id *VCPRequestUseAsyncPropertyKeySymbolLoc;
  id v1;
  float result;
  unsigned int *VCPRequestFrameWidthPropertyKey_cold_1;

  VCPRequestUseAsyncPropertyKeySymbolLoc = (id *)getVCPRequestUseAsyncPropertyKeySymbolLoc();
  if (VCPRequestUseAsyncPropertyKeySymbolLoc)
  {
    v1 = *VCPRequestUseAsyncPropertyKeySymbolLoc;
  }
  else
  {
    VCPRequestFrameWidthPropertyKey_cold_1 = (unsigned int *)getVCPRequestFrameWidthPropertyKey_cold_1();
    return _PTSwapBigGetFloat(VCPRequestFrameWidthPropertyKey_cold_1);
  }
  return result;
}

float _PTSwapBigGetFloat(unsigned int *a1)
{
  return COERCE_FLOAT(bswap32(*a1));
}

_DWORD *_PTSwapBigAssignFloat(_DWORD *result, float a2)
{
  *result = bswap32(LODWORD(a2));
  return result;
}

float _PTSwapBigGetDouble(unint64_t *a1)
{
  return COERCE_DOUBLE(bswap64(*a1));
}

_QWORD *_PTSwapBigAssignDouble(_QWORD *result, double a2)
{
  *result = bswap64(*(unint64_t *)&a2);
  return result;
}

CMTimeValue PTNanosecondsFromCMTime(CMTime *a1)
{
  CMTime v2;
  CMTime v3;

  memset(&v3, 0, sizeof(v3));
  v2 = *a1;
  CMTimeConvertScale(&v3, &v2, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  return v3.value;
}

CMTime *PTNanosecondsToCMTime@<X0>(int64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  return CMTimeMake((CMTime *)a2, a1, 1000000000);
}

void Main_rain_graph_2AEE11A5_5806_4949_9017_97A31959A146(const void *a1, unsigned int a2, float *a3)
{
  *a3 = 0.0;
}

uint64_t __vfx_script_rain_graph_2AEE11A5_5806_4949_9017_97A31959A146(double a1)
{
  uint64_t result;

  result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  **(_DWORD **)(result + 16) = 0;
  return result;
}

uint64_t __vfx_script_rain_graph_B55CB68B_5374_45B9_9B3B_050825454545(double a1)
{
  uint64_t result;

  result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  **(_DWORD **)(result + 16) = 0;
  return result;
}

float Main_rain_graph_C718F1B2_4BA3_4E66_8269_7C49E171E2EC(const void *a1, unsigned int a2, const void *a3, double a4, float *a5)
{
  float v6;
  float result;

  *(float *)&a4 = fminf(fmaxf(*(float *)&a4 * 0.5, 0.0), 1.0);
  vfx_script_texture_sample1d_delayInitStub(a4);
  result = fmaxf(v6, 0.0) * 0.5;
  *a5 = result;
  return result;
}

float Spawn_rain_graph_43A66462_6D38_40C4_9563_E3E4B018C43A(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result;

  result = a3 * 30000.0;
  *a4 = result;
  return result;
}

void Spawn_rain_graph_2E9C9DD9_AFB9_44F3_9725_49E195037824(uint64_t a1, uint64_t a2, unsigned int a3, _QWORD *a4)
{
  *a4 = a3;
  a4[1] = a3;
}

uint64_t Main_rain_graph_C670384D_CC08_49CC_8949_D216C9FD3939(const void *a1, unsigned int a2, float *a3)
{
  double v4;
  double v5;
  double v6;

  vfx_script_curve_create_delayInitStub(5.23869004e-11);
  vfx_script_clock_time_delayInitStub(v4);
  *(float *)&v5 = v5;
  *(float *)&v5 = *(float *)&v5 / 3.0;
  if (*(float *)&v5 >= 1.0)
    *(float *)&v5 = 0.0;
  vfx_script_curve_evaluate_delayInitStub(v5);
  *a3 = *(float *)&v6;
  return vfx_script_curve_destroy_delayInitStub(v6);
}

uint64_t __vfx_script_rain_graph_C670384D_CC08_49CC_8949_D216C9FD3939(double a1)
{
  _DWORD *v1;
  double v2;
  double v3;
  double v4;

  v1 = *(_DWORD **)(vfx_script_get_arguments_buffer_delayInitStub(a1) + 16);
  vfx_script_curve_create_delayInitStub(5.23869004e-11);
  vfx_script_clock_time_delayInitStub(v2);
  *(float *)&v3 = v3;
  *(float *)&v3 = *(float *)&v3 / 3.0;
  if (*(float *)&v3 >= 1.0)
    *(float *)&v3 = 0.0;
  vfx_script_curve_evaluate_delayInitStub(v3);
  *v1 = LODWORD(v4);
  return vfx_script_curve_destroy_delayInitStub(v4);
}

float Spawn_rain_graph_FA88FCF0_73CA_480E_A020_897384F93F5C(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result;

  result = a3 * 20.0;
  *a4 = result;
  return result;
}

float Spawn_rain_graph_999F57E4_3BBD_4410_9780_400191D6A26B(const void *a1, unsigned int a2, float a3, float a4, float *a5, float *a6)
{
  float result;

  result = a3 * 10.0;
  *a5 = result;
  *a6 = a4 + 0.5;
  return result;
}

float Init_rain_graph_D92B57F2_E5A5_43D9_A4FF_0A35F0F95C81(uint64_t a1, uint64_t a2, int a3, int a4, _OWORD *a5, _OWORD *a6)
{
  _BOOL4 v7;
  _BOOL4 v8;
  float v9;
  float v10;
  __int128 v11;
  __int128 v12;
  float result;

  v7 = a3 == 90 || a3 == 270;
  v8 = a4 == 4;
  v9 = 1.03;
  if (!v8 || !v7)
    v9 = 1.375;
  v10 = *(float *)"33s?ffF?";
  if (!v8 || !v7)
    v10 = 1.0;
  if (!v7)
    v9 = *(float *)"ffF?";
  DWORD1(v11) = 0;
  *((_QWORD *)&v11 + 1) = 0;
  LODWORD(v12) = 0;
  *((_QWORD *)&v12 + 1) = 0;
  *((float *)&v12 + 1) = v9;
  result = 1.25;
  if (v7)
    result = v10;
  *(float *)&v11 = result;
  *a5 = v12;
  *a6 = v11;
  return result;
}

float Spawn_rain_graph_25FC010E_3796_4569_84C9_8E9B3FC08F4B(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result;

  result = a3 * 650.0;
  *a4 = result;
  return result;
}

int32x4_t ParticleInit_rain_particleInit_84(float32x4_t a1, double a2, uint64_t a3, uint64_t a4, unsigned int a5, float32x4_t *a6, int32x4_t *a7)
{
  float32x4_t v7;
  int32x4_t result;

  v7.i64[0] = 0;
  v7.i32[3] = 0;
  v7.f32[2] = (float)a5 * 0.007;
  *(float *)&a2 = (float)((float)a5 * 0.05) + 5.0;
  *a6 = vaddq_f32(a1, v7);
  result = vdupq_lane_s32(*(int32x2_t *)&a2, 0);
  *a7 = result;
  return result;
}

uint64_t __vfx_script_rain_particleInit_84(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

double ParticleInit_rain_particleInit_92(uint64_t a1, int a2, uint64_t a3, int a4, float32x4_t *a5, double *a6)
{
  int inited;
  int v11;
  unsigned int v12;
  double v13;
  float32x4_t v14;
  __int32 v15;
  double v16;
  int v17;
  int32x2_t v18;
  int8x8_t v19;
  uint32x2_t v20;
  float32x2_t v26;
  __int128 v28;
  double result;
  float32x4_t v30;
  int8x16_t v31;

  v31 = *(int8x16_t *)a6;
  inited = vfx_script_clock_simulation_index_delayInitStub(*a6);
  v11 = a4 + a2;
  v12 = 277803737
      * (((747796405 * (v11 + inited) - 1095130923) >> (((747796405 * (v11 + inited)
                                                                                    - 1095130923) >> 28)
                                                                    + 4)) ^ (747796405 * (v11 + inited) - 1095130923));
  *(float *)&v13 = COERCE_FLOAT((v12 >> 31) ^ (v12 >> 9) | 0x3F800000) + -1.0;
  vfx_script_texture_sample1d_delayInitStub(v13);
  v30 = vmulq_f32(v14, (float32x4_t)xmmword_1C9323140);
  v15 = v11 + vfx_script_clock_simulation_index_delayInitStub(*(double *)v30.i64);
  v17 = vfx_script_clock_simulation_index_delayInitStub(v16);
  v18.i32[0] = v15;
  v18.i32[1] = v11 + v17;
  v19 = (int8x8_t)vmla_s32((int32x2_t)0x5EC8E83932367084, v18, vdup_n_s32(0x2C9277B5u));
  v20 = (uint32x2_t)vmul_s32((int32x2_t)veor_s8((int8x8_t)vshl_u32((uint32x2_t)v19, (uint32x2_t)vsub_s32((int32x2_t)0x300000003, (int32x2_t)vshr_n_u32((uint32x2_t)v19, 0x1CuLL))), v19), vdup_n_s32(0x108EF2D9u));
  __asm { FMOV            V1.2S, #1.0 }
  v26 = (float32x2_t)vorr_s8(veor_s8((int8x8_t)vshl_u32(v20, (uint32x2_t)0xFFFFFFE1FFFFFFF7), (int8x8_t)vshl_u32(v20, (uint32x2_t)0xFFFFFFF7FFFFFFE1)), _D1);
  __asm { FMOV            V1.2S, #-1.0 }
  *(float32x2_t *)&v28 = vmla_f32((float32x2_t)0x3CF5C28F3C75C28FLL, (float32x2_t)0x3CA3D70B3CA3D70ALL, vadd_f32(v26, _D1));
  *a5 = v30;
  *(_QWORD *)&result = vextq_s8(v31, v31, 8uLL).u64[0];
  *((double *)&v28 + 1) = result;
  *(_OWORD *)a6 = v28;
  return result;
}

uint64_t __vfx_script_rain_particleInit_92(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

double ParticleInit_rain_particleInit_50(double a1, uint64_t a2, int a3, uint64_t a4, int a5, float32x4_t *a6, float *a7, _QWORD *a8)
{
  int inited;
  unsigned int v14;
  float v15;
  double v16;
  float32x4_t v17;
  double result;

  inited = vfx_script_clock_simulation_index_delayInitStub(a1);
  v14 = 277803737
      * (((747796405 * (a5 + a3 + inited) - 1095130923) >> (((747796405 * (a5 + a3 + inited)
                                                                                        - 1095130923) >> 28)
                                                                        + 4)) ^ (747796405 * (a5 + a3 + inited)
                                                                               - 1095130923));
  v15 = COERCE_FLOAT((v14 >> 31) ^ (v14 >> 9) | 0x3F800000) + -1.0;
  *(float *)&v16 = v15;
  vfx_script_texture_sample1d_delayInitStub(v16);
  *a6 = vmulq_f32(v17, (float32x4_t)xmmword_1C9323140);
  *a7 = v15;
  result = 2.04636355e-13;
  *a8 = 0x3D4CCCCD3C75C28FLL;
  return result;
}

uint64_t __vfx_script_rain_particleInit_50(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleUpdate_rain_particleUpdate_80(double a1, float a2, uint64_t a3, uint64_t a4, uint64_t a5, float32x4_t *a6)
{
  float v8;
  float32x4_t result;

  vfx_script_texture_sample1d_delayInitStub(a1);
  result = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_1C9322B60, v8), fminf(fmaxf(a2, 0.0), 1.0));
  *a6 = result;
  return result;
}

uint64_t __vfx_script_rain_particleUpdate_80(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleUpdate_rain_particleUpdate_60(__n128 a1, float a2, float a3, float a4, float32x4_t a5, double a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, float32x4_t *a11, _OWORD *a12, double *a13, float32x4_t *a14)
{
  float v21;
  double v22;
  double v23;
  int32x2_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  int32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  int32x4_t v40;
  float32x2_t v41;
  float32x2_t v42;
  int32x4_t v43;
  float v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x2_t v50;
  float32x2_t v51;
  float32x2_t v52;
  float32x2_t v53;
  float32x2_t v54;
  float32x2_t v55;
  uint64_t v56;
  int32x2_t v57;
  double v58;
  float32x4_t v59;
  float v60;
  float v61;
  unint64_t v62;
  float32x4_t result;
  float v64;
  int8x16_t v65;
  float32x2_t v66;
  float32x2_t v67;
  float32x2_t v68;
  float32x2_t v69;
  float32x2_t v70;
  int32x2_t v71;
  float v72;
  float v73;
  __n128 v74;

  v74 = a1;
  a1.n128_f32[0] = a2;
  vfx_script_texture_sample1d_delayInitStub(a1.n128_f64[0]);
  v73 = v21;
  *(float *)&v22 = a2;
  vfx_script_texture_sample1d_delayInitStub(v22);
  v72 = *(float *)&v23;
  vfx_script_clock_delta_time_delayInitStub(v23);
  v25 = vaddq_f32(a5, (float32x4_t)xmmword_1C9323150);
  v26 = vrsqrteq_f32((float32x4_t)xmmword_1C9322F90);
  v27 = vmulq_f32(v26, vrsqrtsq_f32((float32x4_t)xmmword_1C9322F90, vmulq_f32(v26, v26)));
  v28 = vmulq_f32(vmulq_f32(v27, vrsqrtsq_f32((float32x4_t)xmmword_1C9322F90, vmulq_f32(v27, v27))), (float32x4_t)xmmword_1C9322B50);
  v29 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v28, (int32x4_t)v28), (int8x16_t)v28, 0xCuLL);
  v30 = vmlaq_f32(vmulq_f32(v29, vnegq_f32(v25)), v28, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v25, (int32x4_t)v25), (int8x16_t)v25, 0xCuLL));
  v31 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v30, (int32x4_t)v30), (int8x16_t)v30, 0xCuLL);
  v32 = vmulq_f32(v30, v30);
  v32.i64[0] = vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v32.f32, 1), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v32, 2), v32)).u64[0];
  v33 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v32.f32, 0);
  v33.i32[3] = 0;
  v34 = vrsqrteq_f32(v33);
  v35 = vmulq_f32(v34, vrsqrtsq_f32(v33, vmulq_f32(v34, v34)));
  v36 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v32.f32[0] != 0.0)), 0x1FuLL));
  v36.i32[3] = 0;
  v37 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v36), (int8x16_t)vmulq_f32(vmulq_f32(v35, vrsqrtsq_f32(v33, vmulq_f32(v35, v35))), v31), vextq_s8(vextq_s8((int8x16_t)v28, (int8x16_t)v28, 0xCuLL), (int8x16_t)v28, 8uLL));
  v38 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v37, (int32x4_t)v37), (int8x16_t)v37, 0xCuLL), vnegq_f32(v28)), v37, v29);
  v39 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v38, (int32x4_t)v38), (int8x16_t)v38, 0xCuLL);
  v40 = (int32x4_t)vmulq_f32(v38, v38);
  v40.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v40.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v40, 2), *(float32x2_t *)v40.i8)).u32[0];
  v41 = vrsqrte_f32((float32x2_t)v40.u32[0]);
  v42 = vmul_f32(v41, vrsqrts_f32((float32x2_t)v40.u32[0], vmul_f32(v41, v41)));
  v43 = (int32x4_t)vmulq_n_f32(v39, vmul_f32(v42, vrsqrts_f32((float32x2_t)v40.u32[0], vmul_f32(v42, v42))).f32[0]);
  v44 = v28.f32[2] + (float)(v37.f32[0] + *(float *)&v43.i32[1]);
  if (v44 > 0.0)
  {
    v45 = (float32x4_t)vzip2q_s32(v43, vuzp1q_s32(v43, (int32x4_t)v28));
    v45.i32[2] = v37.i32[1];
    v46 = (float32x4_t)vuzp2q_s32((int32x4_t)v28, vzip1q_s32((int32x4_t)v28, v43));
    v46.i32[1] = v37.i32[2];
    v48 = vsubq_f32(v45, v46);
    v45.i32[3] = sqrtf(v44 + 1.0);
    v46.i32[3] = v45.i32[3];
    v47 = vmulq_f32(v45, v46);
    v48.i32[3] = v47.i32[3];
    v47.f32[0] = 0.5 / v45.f32[3];
    v49 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v47.f32, 0);
LABEL_6:
    v59 = (float32x4_t)v74;
    v58 = a6;
    v61 = v72;
    v60 = v73;
    goto LABEL_7;
  }
  if (v37.f32[0] >= v28.f32[2] && v37.f32[0] >= *(float *)&v43.i32[1])
  {
    v50 = (float32x2_t)vextq_s8((int8x16_t)v37, (int8x16_t)v37, 8uLL).u64[0];
    v51 = (float32x2_t)__PAIR64__(v28.u32[1], v50.u32[0]);
    v52 = (float32x2_t)__PAIR64__(v37.u32[1], COERCE_UNSIGNED_INT(sqrtf((float)((float)(v37.f32[0] + 1.0) - *(float *)&v43.i32[1]) - v28.f32[2])));
    v53 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v43.i8, 0);
    v54 = (float32x2_t)__PAIR64__(v53.u32[1], v52.u32[0]);
    v55 = vadd_f32(*(float32x2_t *)v37.f32, v53);
    v49.i32[0] = vmul_f32(v52, v54).u32[0];
    v49.i32[1] = v55.i32[1];
    v28.i32[1] = v43.i32[2];
    LODWORD(v56) = vadd_f32(*(float32x2_t *)v28.f32, v50).u32[0];
    v57 = (int32x2_t)vsub_f32(*(float32x2_t *)v28.f32, v51);
    HIDWORD(v56) = v57.i32[1];
    v49.i64[1] = v56;
    *(float *)v57.i32 = 0.5 / v52.f32[0];
    v48 = (float32x4_t)vdupq_lane_s32(v57, 0);
    goto LABEL_6;
  }
  v59 = (float32x4_t)v74;
  v58 = a6;
  v61 = v72;
  v60 = v73;
  if (*(float *)&v43.i32[1] <= v28.f32[2])
  {
    v68.i32[0] = vextq_s8((int8x16_t)v37, (int8x16_t)v37, 8uLL).u32[0];
    v68.i32[1] = v43.i32[2];
    *(float32x2_t *)v28.f32 = vadd_f32(*(float32x2_t *)v28.f32, v68);
    v69 = (float32x2_t)__PAIR64__(v37.u32[1], COERCE_UNSIGNED_INT(sqrtf((float)((float)(v28.f32[2] + 1.0) - v37.f32[0]) - *(float *)&v43.i32[1])));
    v70 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v43.i8, 0);
    v71 = (int32x2_t)vsub_f32(*(float32x2_t *)v37.f32, v70);
    v70.i32[0] = v69.i32[0];
    v70.i32[0] = vmul_f32(v69, v70).u32[0];
    v70.i32[1] = v71.i32[1];
    *(float32x2_t *)&v48.u32[2] = v70;
    *(float *)v71.i32 = 0.5 / v69.f32[0];
    v49 = (float32x4_t)vdupq_lane_s32(v71, 0);
  }
  else
  {
    v64 = sqrtf((float)((float)(*(float *)&v43.i32[1] + 1.0) - v37.f32[0]) - v28.f32[2]);
    v65 = (int8x16_t)v28;
    *(float *)v65.i32 = v64;
    v66 = (float32x2_t)vdup_laneq_s32(v43, 2);
    *(float *)v43.i32 = v37.f32[1] + *(float *)v43.i32;
    v67 = vadd_f32(*(float32x2_t *)v28.f32, v66);
    v66.f32[0] = v64;
    v65.i32[0] = vmul_f32(*(float32x2_t *)v65.i8, v66).u32[0];
    v65.i32[1] = v67.i32[1];
    v28.f32[0] = v28.f32[0] - v37.f32[2];
    v49 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v43, (int8x16_t)v43, 4uLL), v65, 0xCuLL);
    v49.i32[3] = v28.i32[0];
    v28.f32[0] = 0.5 / v64;
    v48 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.f32, 0);
  }
LABEL_7:
  *((float *)&v58 + 1) = *((float *)&v58 + 1) + (float)(0.125 * v61);
  *(float *)&v62 = -10.0 * v61;
  *((float *)&v62 + 1) = (float)(*(float *)v24.i32 * a5.f32[0]) + (float)(-25.0 * v61);
  *(float *)v24.i32 = a3 + a3;
  *a11 = vmulq_n_f32(vaddq_f32((float32x4_t)vdupq_lane_s32(v24, 0), vmulq_n_f32(v59, v60)), fminf(fmaxf(a4, 0.0), 1.0));
  *a12 = v62;
  result = vmulq_f32(v48, v49);
  *a13 = v58;
  *a14 = result;
  return result;
}

uint64_t __vfx_script_rain_particleUpdate_60(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleUpdate_rain_particleUpdate_10(float32x4_t a1, float32_t a2, float a3, float a4, uint64_t a5, uint64_t a6, uint64_t a7, float32x4_t *a8)
{
  int32x2_t v11;
  float v12;
  float32x4_t result;
  float32x4_t v14;

  v14 = a1;
  a1.f32[0] = a2;
  vfx_script_texture_sample1d_delayInitStub(*(double *)a1.i64);
  v11.i32[1] = v14.i32[1];
  *(float *)v11.i32 = a3 + a3;
  result = vmulq_n_f32(vaddq_f32((float32x4_t)vdupq_lane_s32(v11, 0), vmulq_n_f32(v14, v12)), fminf(fmaxf(a4, 0.0), 1.0));
  *a8 = result;
  return result;
}

uint64_t __vfx_script_rain_particleUpdate_10(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

void PTIOSurfaceSetColorSpace(__IOSurface *a1, CGColorSpaceRef space)
{
  CFPropertyListRef v3;
  const void *v4;

  if (space)
  {
    v3 = CGColorSpaceCopyPropertyList(space);
    if (v3)
    {
      v4 = v3;
      IOSurfaceSetValue(a1, (CFStringRef)*MEMORY[0x1E0CBBF90], v3);
      CFRelease(v4);
    }
  }
}

void filter_coefficients(int a1, int a2, int a3, int a4, int a5, int a6, unsigned int *a7, float a8)
{
  float v9;
  signed int v10;
  int v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  int v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  float *v21;
  uint64_t v22;
  float v23;
  float v24;
  float v25;
  float *v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  BOOL v36;
  unint64_t v37;
  int v38;
  unsigned int *v39;
  unsigned int *v40;
  unsigned int v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  unsigned int *v46;
  uint64_t v47;
  float v48;
  int v49;
  float v50;
  float v51;
  uint64_t v52;
  int v53;
  unsigned int *v54;
  float v56;
  float v57;
  uint64_t v58;
  float v59;
  float v60;
  float v61;
  float v62;
  unsigned int *v63;
  int v64;
  float v65;
  int v66;
  float v67;
  char v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v63 = a7;
  if ((a3 - 1) >= 2)
  {
    v9 = 0.0;
    if (!a3)
    {
      if (a1 >= 1)
      {
        v43 = 0;
        v44 = a1 >> 1;
        do
        {
          if (v43 == v44)
            v45 = (int)(float)(unint64_t)(1 << a6) & ~(-1 << (a6
                                                                                     + a5));
          else
            v45 = 0;
          if (v43 == v44 && a6 + a5 >= 33)
            filter_coefficients_cold_1();
          v46 = v63;
          v47 = a2;
          if (a2 >= 1)
          {
            do
            {
              *v46++ = v45;
              --v47;
            }
            while (v47);
          }
          ++v43;
          v63 += a2;
        }
        while (v43 != a1);
      }
      return;
    }
  }
  else
  {
    v9 = a8;
    a8 = 1.0;
  }
  if (a8 > 1.0)
    a8 = 1.0;
  v67 = a8;
  v10 = a1 & 0xFFFFFFFE;
  if (a1 < 0)
    v10 = a1 & 0xFFFFFFFE | 1;
  if (a2 >= 1)
  {
    v58 = 0;
    v11 = v10 >> 1;
    v12 = (float)v11;
    v13 = (float)a1;
    v50 = (float)(0.5 / a8) + -0.5;
    v51 = (float)a2;
    v14 = -1.0;
    v15 = (float)((float)a1 + -1.0) * 0.5;
    v16 = (float)(int)floorf(v15);
    v61 = v9 * 0.5;
    v62 = (float)-vcvtms_s32_f32(v15);
    v60 = v9 + v9;
    v59 = sqrtf((float)(v9 + v9) * 3.1416);
    v49 = a6 + a5;
    v17 = -1 << (a6 + a5);
    v18 = 1 << (a6 + a5 - 1);
    v54 = &a7[v11 * a2];
    v53 = 1 << a6;
    v52 = a2;
    v48 = (float)(unint64_t)(1 << a6);
    v66 = -v11;
    v19 = 4 * a2;
    v20 = (unint64_t)a1 << 7;
    v21 = (float *)&v68;
    v64 = a3;
    v65 = v16;
    v57 = (float)v11;
    v56 = (float)a1;
    do
    {
      if (a1 < 1)
      {
        v38 = 0;
        v39 = v63;
      }
      else
      {
        v22 = 0;
        v23 = (float)(int)v58 / v51;
        if ((a1 & (v23 >= 0.5)) != 0)
          v24 = v23 + v14;
        else
          v24 = (float)(int)v58 / v51;
        v25 = 0.0;
        v26 = v21;
        do
        {
          if (a4 == 1)
            v27 = v24 + 1.0;
          else
            v27 = v24;
          if (a4 == 2)
            v27 = v50 + v24;
          v28 = 0.0;
          if (vabds_f32((float)(int)v22, v27 + v12) <= fminf(v27 + v12, (float)(v13 - (float)(v27 + v12)) + v14))
          {
            v29 = v67 * (float)((float)(v66 + v22) - v27);
            switch(a3)
            {
              case 1:
                v28 = 0.0;
                if (fabsf(v29) <= v61)
                  v28 = 1.0;
                break;
              case 3:
                if (v29 == 0.0)
                {
                  v35 = 1.0;
                }
                else
                {
                  v31 = sinf(v29 * 3.1416) / (float)(v29 * 3.1416);
                  v32 = (float)(v29 / v65) * 3.1416;
                  v33 = sinf(v32);
                  v16 = v65;
                  a3 = v64;
                  v34 = v33 / v32;
                  v12 = v57;
                  v35 = v31 * v34;
                  v13 = v56;
                  v14 = -1.0;
                }
                v36 = v35 < v16 && v35 > v62;
                v28 = 0.0;
                if (v36)
                  v28 = v35;
                break;
              case 2:
                v30 = expf((float)-(float)(v29 * v29) / v60);
                v16 = v65;
                a3 = v64;
                v28 = v30 / v59;
                break;
              default:
                return;
            }
          }
          *v26 = v28;
          v26 += 32;
          v25 = v25 + v28;
          ++v22;
        }
        while (a1 != v22);
        if (v49 > 32)
          filter_coefficients_cold_1();
        v37 = 0;
        v38 = 0;
        v39 = v63;
        v40 = v63;
        do
        {
          v41 = llroundf((float)(v21[v37 / 4] / v25) * v48) & ~v17;
          *v40 = v41;
          if ((v41 & v18) != 0)
            v42 = v17;
          else
            v42 = 0;
          v38 += v42 | v41;
          v40 = (unsigned int *)((char *)v40 + v19);
          v37 += 128;
        }
        while (v20 != v37);
      }
      v54[v58] += v53 - v38;
      ++v21;
      v63 = v39 + 1;
      ++v58;
    }
    while (v58 != v52);
  }
}

void sub_1C92C78D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id location)
{
  id *v35;
  uint64_t v36;

  objc_destroyWeak(v35);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v36 - 208), 8);
  _Unwind_Resume(a1);
}

float Main_lasers_graph_3AFCB8D6_52EB_4CCA_8CDC_E3DC4941B357(const void *a1, unsigned int a2, float *a3, double a4)
{
  double v5;
  float result;

  vfx_script_clock_time_delayInitStub(a4);
  *(float *)&v5 = v5;
  result = (float)(fminf(fmaxf((float)(sinf(*(float *)&v5 * 75.0) + 1.0) * 0.5, 0.0), 1.0) * 0.75) + 0.5;
  *a3 = result;
  return result;
}

float __vfx_script_lasers_graph_3AFCB8D6_52EB_4CCA_8CDC_E3DC4941B357(double a1)
{
  float *v1;
  double v2;
  double v3;
  float result;

  v1 = *(float **)(vfx_script_get_arguments_buffer_delayInitStub(a1) + 16);
  vfx_script_clock_time_delayInitStub(v2);
  *(float *)&v3 = v3;
  result = (float)(fminf(fmaxf((float)(sinf(*(float *)&v3 * 75.0) + 1.0) * 0.5, 0.0), 1.0) * 0.75) + 0.5;
  *v1 = result;
  return result;
}

uint64_t Main_lasers_graph_31BFE03A_347F_4F4B_8062_57C3C496211B(uint64_t a1, uint64_t a2, _OWORD *a3, _DWORD *a4)
{
  double v6;
  double v7;
  double v8;

  vfx_script_curve_create_delayInitStub(5.23869004e-11);
  vfx_script_clock_time_delayInitStub(v6);
  *(float *)&v7 = v7;
  *(float *)&v7 = *(float *)&v7 / 5.0;
  if (*(float *)&v7 >= 1.0)
    *(float *)&v7 = 0.0;
  vfx_script_curve_evaluate_delayInitStub(v7);
  *a3 = xmmword_1C9322F10;
  *a4 = LODWORD(v8);
  return vfx_script_curve_destroy_delayInitStub(v8);
}

uint64_t __vfx_script_lasers_graph_31BFE03A_347F_4F4B_8062_57C3C496211B(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  _OWORD *v2;
  _DWORD *v3;
  double v4;
  double v5;
  double v6;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(_OWORD **)(arguments_buffer_delayInitStub + 16);
  v3 = *(_DWORD **)(arguments_buffer_delayInitStub + 24);
  vfx_script_curve_create_delayInitStub(5.23869004e-11);
  vfx_script_clock_time_delayInitStub(v4);
  *(float *)&v5 = v5;
  *(float *)&v5 = *(float *)&v5 / 5.0;
  if (*(float *)&v5 >= 1.0)
    *(float *)&v5 = 0.0;
  vfx_script_curve_evaluate_delayInitStub(v5);
  *v2 = xmmword_1C9322F10;
  *v3 = LODWORD(v6);
  return vfx_script_curve_destroy_delayInitStub(v6);
}

__n128 Main_lasers_graph_75AE1D4B_87B4_4422_8E85_FE9D23E01F3B(uint64_t a1, uint64_t a2, _OWORD *a3, _OWORD *a4, __n128 *a5)
{
  __n128 result;

  *a3 = xmmword_1C93231D0;
  __asm { FMOV            V0.4S, #-1.0 }
  *a4 = _Q0;
  __asm { FMOV            V0.4S, #1.0 }
  *a5 = result;
  return result;
}

__n128 __vfx_script_lasers_graph_75AE1D4B_87B4_4422_8E85_FE9D23E01F3B(double a1)
{
  _QWORD *arguments_buffer_delayInitStub;
  uint64_t v2;
  _OWORD *v3;
  __n128 *v4;
  __n128 result;

  arguments_buffer_delayInitStub = (_QWORD *)vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = arguments_buffer_delayInitStub[2];
  v3 = (_OWORD *)arguments_buffer_delayInitStub[3];
  v4 = (__n128 *)arguments_buffer_delayInitStub[4];
  *(_OWORD *)v2 = xmmword_1C93231D0;
  __asm { FMOV            V0.4S, #-1.0 }
  *v3 = _Q0;
  __asm { FMOV            V0.4S, #1.0 }
  *v4 = result;
  *(_DWORD *)(v2 + 12) = 1065353216;
  return result;
}

uint64_t __vfx_script_lasers_graph_84E516C9_0301_4F69_B83A_25056C254AE8(double a1)
{
  uint64_t result;
  _QWORD *v2;
  uint64_t v3;

  result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = *(_QWORD **)(result + 24);
  v3 = **(unsigned __int8 **)(result + 16);
  *v2 = v3;
  v2[1] = v3;
  return result;
}

float32x4_t Main_lasers_graph_5BEEC0A4_8351_4E81_B071_E7FCF2740A98(float32x4_t a1, uint64_t a2, uint64_t a3, float32x4_t *a4)
{
  float32x4_t result;

  result = vaddq_f32(a1, (float32x4_t)xmmword_1C93231E0);
  *a4 = result;
  return result;
}

__n128 __vfx_script_lasers_graph_5BEEC0A4_8351_4E81_B071_E7FCF2740A98(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  __n128 result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = (__n128)vaddq_f32(*(float32x4_t *)*(_QWORD *)(arguments_buffer_delayInitStub + 16), (float32x4_t)xmmword_1C93231E0);
  result.n128_u32[3] = 1.0;
  *(__n128 *)*(_QWORD *)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

uint64_t Main_lasers_graph_1415613D_8457_4B24_9F2B_BDCEA47A7E46(const void *a1, unsigned int a2, float *a3)
{
  double v4;
  double v5;
  double v6;

  vfx_script_curve_create_delayInitStub(5.23869004e-11);
  vfx_script_clock_time_delayInitStub(v4);
  *(float *)&v5 = v5;
  *(float *)&v5 = *(float *)&v5 / 5.0;
  if (*(float *)&v5 >= 1.0)
    *(float *)&v5 = 0.0;
  vfx_script_curve_evaluate_delayInitStub(v5);
  *a3 = *(float *)&v6;
  return vfx_script_curve_destroy_delayInitStub(v6);
}

uint64_t __vfx_script_lasers_graph_1415613D_8457_4B24_9F2B_BDCEA47A7E46(double a1)
{
  _DWORD *v1;
  double v2;
  double v3;
  double v4;

  v1 = *(_DWORD **)(vfx_script_get_arguments_buffer_delayInitStub(a1) + 16);
  vfx_script_curve_create_delayInitStub(5.23869004e-11);
  vfx_script_clock_time_delayInitStub(v2);
  *(float *)&v3 = v3;
  *(float *)&v3 = *(float *)&v3 / 5.0;
  if (*(float *)&v3 >= 1.0)
    *(float *)&v3 = 0.0;
  vfx_script_curve_evaluate_delayInitStub(v3);
  *v1 = LODWORD(v4);
  return vfx_script_curve_destroy_delayInitStub(v4);
}

float __vfx_script_lasers_graph_598E1865_A878_4D27_8744_3FC0B2A676F9(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 300.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

float __vfx_script_lasers_graph_CD99FC2C_17B7_466E_930E_F05728CE31E3(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 2000.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

uint64_t __vfx_script_lasers_graph_C0E70AB3_A28A_4D4F_8BEB_9516B357779C(double a1)
{
  uint64_t result;

  result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  **(_BYTE **)(result + 16) = 1;
  return result;
}

double ParticleInit_lasers_particleInit_141(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  double result;

  result = 0.0000305175853;
  *a3 = 0x3F0000003F638DF8;
  return result;
}

void __vfx_script_lasers_particleInit_141(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
}

__n128 ParticleInit_lasers_particleInit_26(uint64_t a1, int a2, int a3, double *a4, __int128 *a5, float *a6)
{
  int inited;
  int v12;
  unsigned int v13;
  double v14;
  int v15;
  unsigned int v16;
  double v17;
  unint64_t v18;
  int v19;
  unsigned int v20;
  __int128 v21;
  __int128 v22;
  __n128 result;
  float v24;
  __int128 v25;
  __int128 v26;

  v25 = *a5;
  v26 = *(_OWORD *)a4;
  inited = vfx_script_clock_simulation_index_delayInitStub(*a4);
  v12 = a3 + a2;
  v13 = 277803737
      * (((747796405 * (v12 + inited) - 194419646) >> (((747796405 * (v12 + inited)
                                                                                   - 194419646) >> 28)
                                                                   + 4)) ^ (747796405 * (v12 + inited) - 194419646));
  *(float *)&v14 = (float)((float)(COERCE_FLOAT((v13 >> 31) ^ (v13 >> 9) | 0x3F800000) + -1.0) * 0.3) + 0.7;
  v24 = *(float *)&v14;
  v15 = vfx_script_clock_simulation_index_delayInitStub(v14);
  v16 = 277803737
      * (((747796405 * (v12 + v15) + 400461887) >> (((747796405 * (v12 + v15) + 400461887) >> 28)
                                                                + 4)) ^ (747796405 * (v12 + v15) + 400461887));
  *(float *)&v17 = (float)(COERCE_FLOAT((v16 >> 31) ^ (v16 >> 9) | 0x3F800000) + -1.0) * 3.0;
  v18 = (int)*(float *)&v17;
  v19 = vfx_script_clock_simulation_index_delayInitStub(v17);
  v20 = 277803737
      * (((747796405 * (v12 + v19) - 1403630843) >> (((747796405 * (v12 + v19) - 1403630843) >> 28)
                                                                 + 4)) ^ (747796405 * (v12 + v19) - 1403630843));
  *a6 = (float)((float)(unint64_t)((int)vcvts_n_s32_f32(COERCE_FLOAT((v20 >> 31) ^ (v20 >> 9) | 0x3F800000) + -1.0, 2uLL)+ 1)* 0.25)+ -0.125;
  *(float *)&v21 = v24;
  *((float *)&v21 + 1) = (float)v18;
  *((_QWORD *)&v21 + 1) = *((_QWORD *)&v25 + 1);
  *a5 = v21;
  v22 = v26;
  DWORD2(v22) = 0;
  *(_OWORD *)a4 = v22;
  result.n128_u64[0] = v22;
  result.n128_u32[2] = DWORD2(v22);
  return result;
}

uint64_t __vfx_script_lasers_particleInit_26(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t __vfx_script_lasers_particleInit_117(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

__n128 ParticleInit_lasers_particleInit_58(uint64_t a1, int a2, int a3, double *a4, __int128 *a5, float *a6)
{
  int inited;
  int v12;
  unsigned int v13;
  double v14;
  int v15;
  unsigned int v16;
  __int128 v17;
  __int128 v18;
  __n128 result;
  float v20;
  __int128 v21;
  __int128 v22;

  v21 = *a5;
  v22 = *(_OWORD *)a4;
  inited = vfx_script_clock_simulation_index_delayInitStub(*a4);
  v12 = a3 + a2;
  v13 = 277803737
      * (((747796405 * (v12 + inited) - 194419646) >> (((747796405 * (v12 + inited)
                                                                                   - 194419646) >> 28)
                                                                   + 4)) ^ (747796405 * (v12 + inited) - 194419646));
  *(float *)&v14 = (float)((float)(COERCE_FLOAT((v13 >> 31) ^ (v13 >> 9) | 0x3F800000) + -1.0) * 0.3) + 0.7;
  v20 = *(float *)&v14;
  v15 = vfx_script_clock_simulation_index_delayInitStub(v14);
  v16 = 277803737
      * (((747796405 * (v12 + v15) - 1403630843) >> (((747796405 * (v12 + v15) - 1403630843) >> 28)
                                                                 + 4)) ^ (747796405 * (v12 + v15) - 1403630843));
  *a6 = (float)((float)(unint64_t)((int)vcvts_n_s32_f32(COERCE_FLOAT((v16 >> 31) ^ (v16 >> 9) | 0x3F800000) + -1.0, 2uLL)+ 1)* 0.25)+ -0.125;
  v17 = v21;
  *(float *)&v17 = v20;
  *a5 = v17;
  v18 = v22;
  DWORD2(v18) = 0;
  *(_OWORD *)a4 = v18;
  result.n128_u64[0] = v18;
  result.n128_u32[2] = DWORD2(v18);
  return result;
}

uint64_t __vfx_script_lasers_particleInit_58(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

int32x4_t ParticleInit_lasers_particleInit_27(float32x4_t a1, double a2, uint64_t a3, uint64_t a4, unsigned int a5, float32x4_t *a6, int32x4_t *a7)
{
  float32x4_t v7;
  int32x4_t result;

  v7.i64[0] = 0;
  v7.i32[3] = 0;
  v7.f32[2] = (float)a5 * 0.007;
  *(float *)&a2 = (float)((float)a5 * 0.05) + 1.0;
  *a6 = vaddq_f32(a1, v7);
  result = vdupq_lane_s32(*(int32x2_t *)&a2, 0);
  *a7 = result;
  return result;
}

uint64_t __vfx_script_lasers_particleInit_27(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t __vfx_script_lasers_particleInit_28(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

__n128 ParticleUpdate_lasers_particleUpdate_83(double a1, float a2, float a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, float32x4_t *a9, _OWORD *a10)
{
  __int32 v15;
  float32x4_t v16;
  float v17;
  float v18;
  float32x4_t v19;
  simd_float4 v20;
  float v23;
  float v24;
  __int128 v25;
  __n128 result;
  simd_float4 x;
  unsigned int v36;
  simd_float4 v37;
  float32x4_t v38;
  float32x4_t v39;

  v15 = LODWORD(a1);
  vfx_script_texture_sample1d_delayInitStub(a1);
  v38 = v16;
  v16.i32[0] = v15;
  vfx_script_texture_sample1d_delayInitStub(*(double *)v16.i64);
  v39 = vmulq_n_f32(v38, a2 * v17);
  *(float *)&v36 = (float)(cosf(a3 * 1.3) + -0.15) * 0.65;
  v18 = sinf((float)((float)a8 + a3) + (float)((float)a8 + a3));
  v19.i64[0] = 0x3F0000003F000000;
  v19.i64[1] = 0x3F0000003F000000;
  v20 = (simd_float4)vmulq_f32(vaddq_f32((float32x4_t)__PAIR64__(LODWORD(v18), v36), (float32x4_t)0), v19);
  v20.i32[3] = 0;
  x = v20;
  v37 = _simd_cos_f4(v20);
  _Q0 = (float32x4_t)_simd_sin_f4(x);
  _Q7 = v37;
  v23 = vmuls_lane_f32(v37.f32[1], (float32x4_t)v37, 2);
  v24 = vmuls_lane_f32(_Q0.f32[1], _Q0, 2);
  *(float *)&v25 = vmlas_n_f32(-(float)(v37.f32[0] * v24), v23, _Q0.f32[0]);
  _S4 = vmuls_lane_f32(v37.f32[0], *(float32x2_t *)_Q0.f32, 1);
  __asm { FMLA            S5, S4, V7.S[2] }
  _S4 = vmuls_lane_f32(_Q7.f32[0], *(float32x2_t *)_Q7.f32, 1);
  __asm { FMLA            S6, S4, V0.S[2] }
  DWORD1(v25) = _S5;
  *((_QWORD *)&v25 + 1) = __PAIR64__(COERCE_UNSIGNED_INT(vmlas_n_f32(v24 * _Q0.f32[0], v23, v37.f32[0])), _S6);
  result = (__n128)v39;
  *a9 = v39;
  *a10 = v25;
  return result;
}

void __vfx_script_lasers_particleUpdate_83(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleUpdate_lasers_particleUpdate_71(float32x4_t a1, float32_t a2, float a3, uint64_t a4, uint64_t a5, uint64_t a6, float32x4_t *a7)
{
  float32x4_t v13;
  float v14;
  float32x4_t result;
  float32x4_t v16;

  __asm { FMOV            V2.4S, #0.25 }
  v13 = vmulq_f32(a1, _Q2);
  v16 = v13;
  v13.f32[0] = a2;
  vfx_script_texture_sample1d_delayInitStub(*(double *)v13.i64);
  result = vmulq_n_f32(vmulq_n_f32(v16, v14), a3);
  *a7 = result;
  return result;
}

__n128 __vfx_script_lasers_particleUpdate_71(double a1)
{
  double v1;
  __n128 result;

  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
  return result;
}

uint64_t __vfx_script_lasers_particleUpdate_84(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleUpdate_lasers_particleUpdate_18(float32x4_t a1, float32_t a2, float a3, uint64_t a4, uint64_t a5, uint64_t a6, float32x4_t *a7)
{
  float32x4_t v8;
  float v9;
  float32x4_t result;
  float32x4_t v11;

  v8 = vmulq_f32(a1, (float32x4_t)vdupq_n_s32(0x3F2A7EFAu));
  v11 = v8;
  v8.f32[0] = a2;
  vfx_script_texture_sample1d_delayInitStub(*(double *)v8.i64);
  result = vmulq_n_f32(vmulq_n_f32(v11, v9), a3);
  *a7 = result;
  return result;
}

__n128 __vfx_script_lasers_particleUpdate_18(double a1)
{
  double v1;
  __n128 result;

  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
  return result;
}

float32x4_t ParticleUpdate_lasers_particleUpdate_114(double a1, float a2, float a3, uint64_t a4, uint64_t a5, uint64_t a6, float32x4_t *a7)
{
  float32x4_t v9;
  float32x4_t result;

  vfx_script_texture_sample1d_delayInitStub(a1);
  result = vmulq_n_f32(vmulq_n_f32(v9, a2), fminf(fmaxf(a3, 0.0), 1.0));
  *a7 = result;
  return result;
}

uint64_t __vfx_script_lasers_particleUpdate_114(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleUpdate_lasers_particleUpdate_119(double a1, float a2, float a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, float32x4_t *a8)
{
  __int32 v11;
  float32x4_t v12;
  float v13;
  float32x4_t result;
  float32x4_t v15;

  v11 = LODWORD(a1);
  vfx_script_texture_sample1d_delayInitStub(a1);
  v15 = v12;
  v12.i32[0] = v11;
  vfx_script_texture_sample1d_delayInitStub(*(double *)v12.i64);
  result = vmulq_n_f32(vmulq_n_f32(v15, a2 * v13), fminf(fmaxf(a3, 0.0), 1.0));
  *a8 = result;
  return result;
}

uint64_t __vfx_script_lasers_particleUpdate_119(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

__n128 particle_update_lasers_particleUpdate_21(uint64_t a1, __n128 *a2, __n128 *a3)
{
  __n128 result;

  result = *a2;
  *a3 = *a2;
  return result;
}

__n128 __vfx_script_lasers_particleUpdate_21(double a1)
{
  double v1;
  __n128 result;

  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
  return result;
}

double CGRectGetArea(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double Width;
  CGRect v10;

  Width = CGRectGetWidth(*(CGRect *)&a1);
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  return Width * CGRectGetHeight(v10);
}

double CGRectGetCenter(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX;
  CGRect v10;

  MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

uint64_t PTSerializationDebugIsEnabled()
{
  if (PTSerializationDebugIsEnabled_onceToken != -1)
    dispatch_once(&PTSerializationDebugIsEnabled_onceToken, &__block_literal_global_4);
  return 0;
}

id NSStringFromBytes(unsigned __int8 *a1, uint64_t a2)
{
  void *i;
  unsigned int v5;
  void *v6;

  for (i = (void *)objc_opt_new(); a2; --a2)
  {
    v5 = *a1++;
    objc_msgSend(i, "appendFormat:", CFSTR("%02X "), v5);
  }
  if (objc_msgSend(i, "length"))
    objc_msgSend(i, "deleteCharactersInRange:", objc_msgSend(i, "length") - 1, 1);
  v6 = (void *)objc_msgSend(i, "copy");

  return v6;
}

uint64_t NSStringFromFourCharCode(unsigned int a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%c%c%c"), HIBYTE(a1), BYTE2(a1), BYTE1(a1), a1);
}

id NSStringFromData(void *a1)
{
  id v1;
  unsigned __int8 *v2;
  uint64_t v3;

  v1 = objc_retainAutorelease(a1);
  v2 = (unsigned __int8 *)objc_msgSend(v1, "bytes");
  v3 = objc_msgSend(v1, "length");

  return NSStringFromBytes(v2, v3);
}

void sub_1C92CE9D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL PTTrackIDIsValid(uint64_t a1)
{
  return a1 >= 0;
}

unint64_t PTTrackIDIsInvalid(unint64_t a1)
{
  return a1 >> 63;
}

BOOL PTGroupIDIsValid(uint64_t a1)
{
  return a1 >= 0;
}

unint64_t PTGroupIDIsInvalid(unint64_t a1)
{
  return a1 >> 63;
}

uint64_t PTTrackIDFromNumber(void *a1)
{
  if (a1)
    return objc_msgSend(a1, "integerValue");
  else
    return -1;
}

id NSNumberFromPTTrackID(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  if (a1 == -1)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1, v1, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL PTDetectionTypeIsBetter(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  _BOOL8 v17;

  if (PTDetectionTypeIsBetter_onceToken != -1)
    dispatch_once(&PTDetectionTypeIsBetter_onceToken, &__block_literal_global_6);
  v4 = (void *)PTDetectionTypeIsBetter_sOrderMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(&unk_1E8252E68, "count"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  v10 = (void *)PTDetectionTypeIsBetter_sOrderMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(&unk_1E8252E80, "count"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  v16 = objc_msgSend(v9, "intValue");
  v17 = v16 < (int)objc_msgSend(v15, "intValue");

  return v17;
}

uint64_t PTDetectionTypeParent(uint64_t result)
{
  uint64_t v1;

  v1 = result - 1;
  if ((unint64_t)(result - 1) <= 9 && ((0x31Fu >> v1) & 1) != 0)
    return qword_1C93232E0[v1];
  return result;
}

id PTDetectionTypeAccessibilityLabel(unint64_t a1)
{
  void *v2;
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (a1 > 0xB)
    goto LABEL_8;
  if (((1 << a1) & 0x630) != 0)
  {
    v4 = CFSTR("PTCinematographyDetectionTypePet");
    v5 = CFSTR("pet");
    goto LABEL_9;
  }
  if (((1 << a1) & 0xE) == 0)
  {
    if (a1 == 11)
    {
      v4 = CFSTR("PTCinematographyDetectionTypeSportsBall");
      v5 = CFSTR("sports ball");
      goto LABEL_9;
    }
LABEL_8:
    v4 = CFSTR("PTCinematographyDetectionTypeDefault");
    v5 = CFSTR("object");
    goto LABEL_9;
  }
  v4 = CFSTR("PTCinematographyDetectionTypeHuman");
  v5 = CFSTR("person");
LABEL_9:
  objc_msgSend(v2, "localizedStringForKey:value:table:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL PTIsValidTrackID(uint64_t a1)
{
  return a1 >= 0;
}

unint64_t PTIsInvalidTrackID(unint64_t a1)
{
  return a1 >> 63;
}

uint64_t PTDefaultsPublicGetBool(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a1;
  PTDefaultsPublicGetDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    a2 = objc_msgSend(v5, "BOOLValue");

  return a2;
}

id _ErrorForDataBufferNotFoundAtURL(void *a1)
{
  id v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  _PTLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    _ErrorForDataBufferNotFoundAtURL_cold_1((uint64_t)v1, v2, v3);

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB28A8];
  v6 = *MEMORY[0x1E0CB3308];
  v10[0] = *MEMORY[0x1E0CB2D50];
  v10[1] = v6;
  v11[0] = CFSTR("data buffer not found at url");
  v11[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL LoadDataVec(char *a1, size_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char *__filename)
{
  FILE *v13;
  FILE *v14;
  size_t v15;

  v13 = fopen(__filename, "r");
  v14 = v13;
  if (v13)
  {
    if (a5)
    {
      v15 = a6 * a4;
      do
      {
        fread(a1, a2, v15, v14);
        a1 += a3;
        --a5;
      }
      while (a5);
    }
    v13 = v14;
  }
  fclose(v13);
  return v14 != 0;
}

void OUTLINED_FUNCTION_0_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t __vfx_script_hearts_graph_3E785FDE_1E85_40AA_A8D6_985C11FFF991(double a1)
{
  uint64_t result;

  result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  **(_BYTE **)(result + 16) = 1;
  return result;
}

float32x4_t Main_hearts_graph_6CDCF767_47EA_4180_9CAC_F5ACFF8AE4CF(float32x4_t a1, uint64_t a2, uint64_t a3, float32x4_t *a4)
{
  float32x4_t result;

  result = vaddq_f32(a1, (float32x4_t)xmmword_1C9323340);
  *a4 = result;
  return result;
}

__n128 __vfx_script_hearts_graph_6CDCF767_47EA_4180_9CAC_F5ACFF8AE4CF(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  __n128 result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = (__n128)vaddq_f32(*(float32x4_t *)*(_QWORD *)(arguments_buffer_delayInitStub + 16), (float32x4_t)xmmword_1C9323340);
  result.n128_u32[3] = 1.0;
  *(__n128 *)*(_QWORD *)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

uint64_t Init_hearts_graph_B8CFD00B_F83D_48B4_B9F3_B556F2C755C4(double a1, uint64_t a2, int a3, float *a4)
{
  uint64_t result;
  unsigned int v7;
  float v8;

  result = vfx_script_clock_simulation_index_delayInitStub(a1);
  v7 = 277803737
     * (((747796405 * (result + a3) + 553376759) >> (((747796405 * (result + a3) + 553376759) >> 28)
                                                                 + 4)) ^ (747796405 * (result + a3) + 553376759));
  v8 = -4.0;
  if ((float)(COERCE_FLOAT((v7 >> 31) ^ (v7 >> 9) | 0x3F800000) + -1.0) > 0.5)
    v8 = 4.0;
  *a4 = v8;
  a4[1] = v8;
  return result;
}

float __vfx_script_hearts_graph_06A14A47_3880_4300_8226_188BD75B83F1(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 300.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

void Spawn_hearts_graph_B0667801_C60E_4D93_B9A1_27F790726520(const void *a1, unsigned int a2, float a3, int a4, float *a5)
{
  float v5;

  v5 = a3 * 9.0;
  if (!a4)
    v5 = 0.0;
  *a5 = v5;
}

void Main_hearts_graph_781609DE_FEF0_4B99_B009_050ADBDF1B32(float32x4_t a1, float a2, uint64_t a3, uint64_t a4, int a5, float32x4_t *a6, float *a7)
{
  float32x4_t v7;
  float v8;

  v7 = vaddq_f32(a1, (float32x4_t)xmmword_1C9323350);
  v8 = a2 + 0.5;
  if (a5)
    v8 = 0.0;
  *a6 = v7;
  *a7 = v8;
}

double Init_hearts_graph_77839324_3A35_4199_A55E_F65CEF5F32BF(uint64_t a1, uint64_t a2, int a3, float *a4, _OWORD *a5)
{
  float v5;
  double result;

  v5 = 0.01;
  if (a3)
    v5 = 0.03;
  *a4 = v5;
  a4[1] = v5;
  result = 0.0;
  *a5 = 0u;
  return result;
}

float Main_hearts_graph_4267197A_7D75_425E_8F36_26328B281570(float32x4_t a1, float a2, uint64_t a3, uint64_t a4, _OWORD *a5, _OWORD *a6, float *a7)
{
  __int128 v11;
  float result;

  simd_matrix3x3(a1);
  *a5 = v11;
  result = (float)(fminf(fmaxf(a2, 0.0), 1.0) * 0.5) + 0.5;
  *a6 = xmmword_1C9323360;
  *a7 = result;
  return result;
}

float Main_hearts_graph_4E082B7E_A3DB_40F5_9D67_FBFC9824FD2D(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result;

  result = (float)((float)(fminf(fmaxf(a3, 0.0), 1.0) * 0.5) + 0.5) * 0.4;
  *a4 = result;
  return result;
}

uint64_t ParticleInit_hearts_particleInit_127(__n128 a1, float32x2_t a2, float a3, uint64_t a4, int a5, unsigned int a6, int a7, char a8, uint64_t a9, __n128 *a10, int8x16_t *a11, _OWORD *a12)
{
  float v19;
  uint64_t v20;
  _BOOL4 v22;
  float32x2_t v23;
  int inited;
  unsigned int v25;
  double v26;
  uint64_t result;
  __int128 v28;
  int8x16_t v29;
  double v31;
  int8x16_t v32;
  _OWORD v34[4];
  _OWORD v35[4];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v32 = *a11;
  v35[0] = xmmword_1C9323370;
  v35[1] = xmmword_1C9323380;
  v35[2] = xmmword_1C9323390;
  v35[3] = xmmword_1C93233A0;
  v19 = fmodf((float)a6, 2.0);
  v20 = 0;
  memset(&v34[2], 0, 32);
  v22 = a7 == 90 || a7 == 270;
  memset(v34, 0, 32);
  do
  {
    v34[v20] = v35[v20];
    ++v20;
  }
  while (v20 != 4);
  if ((a8 & 1) == 0)
  {
    if (v22)
      v19 = v19 + 2.0;
    a1 = (__n128)v34[(unint64_t)v19];
  }
  v23.i32[1] = 1056964608;
  v23.f32[0] = (float)(a3 * 0.6) + 1.0;
  v31 = COERCE_DOUBLE(vmul_f32(a2, v23));
  inited = vfx_script_clock_simulation_index_delayInitStub(v31);
  v25 = 277803737
      * (((747796405 * (a6 + a5 + inited) + 2107313962) >> (((747796405 * (a6 + a5 + inited) + 2107313962) >> 28) + 4)) ^ (747796405 * (a6 + a5 + inited) + 2107313962));
  *(float *)&v26 = COERCE_FLOAT((v25 >> 31) ^ (v25 >> 9) | 0x3F800000) + -1.0;
  result = vfx_script_texture_sample1d_delayInitStub(v26);
  *a10 = a1;
  *a12 = v28;
  *(double *)v29.i64 = v31;
  v29.i64[1] = vextq_s8(v32, v32, 8uLL).u64[0];
  *a11 = v29;
  return result;
}

uint64_t __vfx_script_hearts_particleInit_127(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

void __vfx_script_hearts_particleInit_17(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t __vfx_script_hearts_particleInit_28(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

__n128 ParticleInit_hearts_particleInit_130(double a1, uint64_t a2, int a3, uint64_t a4, float32x4_t *a5, _OWORD *a6, _OWORD *a7, __n128 *a8)
{
  int inited;
  unsigned int v14;
  double v15;
  __int128 v16;
  const float *v17;
  float32x4_t v18;
  const float *v19;
  float32x4_t v20;
  __n128 result;
  unsigned int v22;
  unsigned int v23;
  __n128 v24;

  LODWORD(a1) = a5->i32[1];
  v23 = LODWORD(a1);
  v24 = *a8;
  inited = vfx_script_clock_simulation_index_delayInitStub(a1);
  v14 = 277803737
      * (((747796405 * (inited + a3) + 381013756) >> (((747796405 * (inited + a3) + 381013756) >> 28)
                                                                  + 4)) ^ (747796405 * (inited + a3) + 381013756));
  *(float *)&v22 = (float)((float)(COERCE_FLOAT((v14 >> 31) ^ (v14 >> 9) | 0x3F800000) + -1.0) * 0.02) + -0.01;
  LODWORD(v15) = 0.5;
  vfx_script_texture_sample1d_delayInitStub(v15);
  *a6 = v16;
  *a7 = v16;
  v17 = (const float *)&dword_1C93231A8;
  v18 = vld1q_dup_f32(v17);
  v18.i64[0] = __PAIR64__(v23, v22);
  v19 = (const float *)&dword_1C93233E8;
  v20 = vld1q_dup_f32(v19);
  *a5 = v18;
  result = v24;
  v20.i32[0] = v24.n128_u32[0];
  v20.i32[2] = v24.n128_i32[2];
  *a8 = (__n128)v20;
  return result;
}

uint64_t __vfx_script_hearts_particleInit_130(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

__n128 ParticleUpdate_hearts_particleUpdate_210(double a1, float32x4_t a2, float32_t a3, float32x4_t a4, uint64_t a5, int a6, unsigned int a7, uint64_t a8, char a9, int a10, float32x4_t *a11, float32x4_t *a12, __n128 *a13)
{
  float v17;
  float v20;
  float32x4_t v21;
  float v29;
  float v30;
  simd_float4 v32;
  unsigned int v35;
  float v38;
  float v39;
  int32x4_t v40;
  int32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  __n128 result;
  simd_float4 v49;
  simd_float4 v50;
  simd_float4 x;
  simd_float4 v53;
  float32x4_t v55;

  v17 = *(float *)&a1;
  vfx_script_texture_sample1d_delayInitStub(a1);
  v21 = a4;
  if ((a9 & 1) == 0)
    v21 = vmlaq_n_f32(a4, vsubq_f32(vmulq_f32(a4, (float32x4_t)xmmword_1C93233B0), a4), v20);
  if (a10 != 90 && a10 != 270)
    a4 = v21;
  __asm { FMOV            V0.4S, #1.25 }
  _Q0.f32[3] = a3;
  v55 = vmulq_f32(_Q0, a2);
  v53 = _simd_cos_f4((simd_float4)xmmword_1C93233C0);
  _Q0 = (float32x4_t)_simd_sin_f4((simd_float4)xmmword_1C93233C0);
  _Q7 = v53;
  v29 = vmuls_lane_f32(v53.f32[1], (float32x4_t)v53, 2);
  v30 = vmuls_lane_f32(_Q0.f32[1], _Q0, 2);
  _Q3.f32[0] = vmlas_n_f32(-(float)(v53.f32[0] * v30), v29, _Q0.f32[0]);
  v32 = _Q3;
  _Q3.f32[0] = vmuls_lane_f32(v53.f32[0], *(float32x2_t *)_Q0.f32, 1);
  __asm { FMLA            S4, S3, V7.S[2] }
  _Q3.f32[0] = vmuls_lane_f32(_Q7.f32[0], *(float32x2_t *)_Q7.f32, 1);
  __asm { FMLA            S5, S3, V0.S[2] }
  v32.i32[1] = _S4;
  v32.i32[2] = _S5;
  x = v32;
  v53.i32[0] = vmlas_n_f32(v30 * _Q0.f32[0], v29, v53.f32[0]);
  v35 = 277803737
      * (((747796405 * (a7 + a6) + 1806824570) >> (((747796405 * (a7 + a6) + 1806824570) >> 28) + 4)) ^ (747796405 * (a7 + a6) + 1806824570));
  _Q0.i32[0] = 0;
  _Q0.f32[1] = (float)((float)((float)((float)((float)((float)((float)(COERCE_FLOAT((v35 >> 31) ^ (v35 >> 9) | 0x3F800000)
                                                                     + -1.0)
                                                             * 0.5)
                                                     + 1.5)
                                             * v17)
                                     + (float)((float)((float)((float)(COERCE_FLOAT((v35 >> 31) ^ (v35 >> 9) | 0x3F800000)
                                                                     + -1.0)
                                                             * 0.5)
                                                     + 1.5)
                                             * v17))
                             - (float)((float)((float)((float)(COERCE_FLOAT((v35 >> 31) ^ (v35 >> 9) | 0x3F800000) + -1.0)
                                                     * 0.5)
                                             + 1.5)
                                     * v17))
                     + (float)a7)
             * 0.5;
  v49 = (simd_float4)_Q0.u64[0];
  v50 = _simd_cos_f4((simd_float4)_Q0.u64[0]);
  _Q0 = (float32x4_t)_simd_sin_f4(v49);
  _Q7 = v50;
  v38 = vmuls_lane_f32(v50.f32[1], (float32x4_t)v50, 2);
  v39 = vmuls_lane_f32(_Q0.f32[1], _Q0, 2);
  *(float *)v40.i32 = vmlas_n_f32(-(float)(v50.f32[0] * v39), v38, _Q0.f32[0]);
  _S4 = vmuls_lane_f32(v50.f32[0], *(float32x2_t *)_Q0.f32, 1);
  __asm { FMLA            S5, S4, V7.S[2] }
  _S4 = vmuls_lane_f32(_Q7.f32[0], *(float32x2_t *)_Q7.f32, 1);
  __asm { FMLA            S6, S4, V0.S[2] }
  _Q0.f32[0] = vmlas_n_f32(v39 * _Q0.f32[0], v38, v50.f32[0]);
  v40.i32[1] = _S5;
  v40.i32[2] = _S6;
  v45 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v40, v40), (int8x16_t)v40, 0xCuLL), vnegq_f32((float32x4_t)x)), (float32x4_t)v40, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)x, (int32x4_t)x), (int8x16_t)x, 0xCuLL));
  v46 = vaddq_f32(vmlaq_n_f32(vmulq_n_f32((float32x4_t)x, _Q0.f32[0]), (float32x4_t)v40, v53.f32[0]), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v45, v45), (int8x16_t)v45, 0xCuLL));
  v47 = vmulq_f32((float32x4_t)x, (float32x4_t)v40);
  v46.f32[3] = -(float)(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v47, 2), vaddq_f32(v47, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v47.f32, 1))).f32[0]- (float)(v53.f32[0] * _Q0.f32[0]));
  *a11 = v46;
  *a12 = v55;
  result = (__n128)a4;
  *a13 = (__n128)a4;
  return result;
}

void __vfx_script_hearts_particleUpdate_210(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleUpdate_hearts_particleUpdate_95(double a1, float a2, uint64_t a3, uint64_t a4, uint64_t a5, float32x4_t *a6)
{
  float v8;
  float32x4_t result;

  vfx_script_texture_sample1d_delayInitStub(a1);
  result = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_1C93233D0, v8), fminf(fmaxf(a2, 0.0), 1.0));
  *a6 = result;
  return result;
}

uint64_t __vfx_script_hearts_particleUpdate_95(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t particle_update_hearts_particleUpdate_100(double a1, uint64_t a2, double *a3, _DWORD *a4, float *a5, float *a6)
{
  float v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  double v19;
  float v20;
  float32x4_t v21;
  float32x4_t v22;
  float v23;
  float v24;
  float32x2_t v25;
  float32x2_t v26;
  float32x4_t v27;
  float v28;
  char v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  vfx_script_clock_delta_time_delayInitStub(a1);
  v28 = v10;
  result = vfx_script_particle_find_nearest_neighbors_delayInitStub(*a3);
  if (result)
  {
    v12 = result;
    v13 = &v29;
    __asm { FMOV            V0.4S, #0.25 }
    v27 = _Q0;
    do
    {
      v13 += 8;
      result = vfx_script_particle_get_id_delayInitStub(*(double *)_Q0.i64);
      if (*a4 != (_DWORD)result)
      {
        vfx_script_particle_get_size1d_delayInitStub(*(double *)_Q0.i64);
        v20 = *(float *)&v19;
        result = vfx_script_particle_get_position_delayInitStub(v19);
        _Q0 = vsubq_f32(v21, *(float32x4_t *)a3);
        v22 = vmulq_f32(_Q0, _Q0);
        v23 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 2), vaddq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.f32, 1))).f32[0];
        v24 = v20 + *a6;
        if (v23 < (float)((float)(v24 * 0.6) * (float)(v24 * 0.6)) && v23 > 1.0e-10)
        {
          v25 = vrsqrte_f32((float32x2_t)LODWORD(v23));
          v26 = vmul_f32(v25, vrsqrts_f32((float32x2_t)LODWORD(v23), vmul_f32(v25, v25)));
          _Q0 = vmulq_n_f32(vmulq_f32(vmulq_n_f32(vmulq_n_f32(_Q0, vmul_f32(v26, vrsqrts_f32((float32x2_t)LODWORD(v23), vmul_f32(v26, v26))).f32[0]), sqrtf(v23) - v24), v27), v28);
          *(float32x4_t *)a3 = vmlaq_n_f32(*(float32x4_t *)a3, _Q0, fminf(*a5 * 10.0, 1.0));
        }
      }
      --v12;
    }
    while (v12);
  }
  return result;
}

uint64_t __vfx_script_hearts_particleUpdate_100(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleUpdate_hearts_particleUpdate_59(float32x4_t a1, float a2, uint64_t a3, uint64_t a4, float32x4_t *a5)
{
  float32x4_t result;

  result = vmulq_n_f32(a1, a2 * 1.25);
  *a5 = result;
  return result;
}

uint64_t __vfx_script_hearts_particleUpdate_59(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

void sub_1C92DAB70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1C92DAD88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1C92DB134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

int8x16_t Main_fireworks_graph_10EDDCB9_24C0_4755_971D_D6EC1FAF1000(float32x4_t a1, uint64_t a2, uint64_t a3, int8x16_t *a4)
{
  float v5;
  float32x4_t v6;
  unsigned int v7;
  int8x16_t result;
  int8x16_t v15;

  vfx_script_clock_delta_time_delayInitStub(*(double *)a1.i64);
  v6 = vmulq_n_f32(a1, 1.0 - (float)(v5 + v5));
  v6.i32[3] = 1.0;
  v15 = (int8x16_t)v6;
  if (vfx_script_clock_is_first_frame_delayInitStub(*(double *)v6.i64))
    v7 = -1;
  else
    v7 = 0;
  __asm { FMOV            V1.4S, #1.0 }
  result = vbslq_s8((int8x16_t)vdupq_n_s32(v7), _Q1, v15);
  *a4 = result;
  return result;
}

float Main_fireworks_graph_155128CD_E118_4113_8D6F_8B7F5BA2555D(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result;

  result = a3 * 1.12;
  *a4 = result;
  return result;
}

float Spawn_fireworks_graph_C9C0CC36_AD87_4391_B404_40CBC37682DC(float a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  float result;

  result = a1 * 250.0;
  *a4 = (unint64_t)result;
  a4[1] = (unint64_t)result;
  return result;
}

double Init_fireworks_graph_913AA320_A3AD_4B97_B3CE_288034B4B02B(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  double result;

  result = 2.23432441e-18;
  *a3 = 0x3C449BA63C09A027;
  return result;
}

void Main_fireworks_graph_5DD07B06_8DCA_42DA_80D9_81BBED0FBF33(const void *a1, unsigned int a2, float a3, float *a4)
{
  *a4 = a3;
}

uint64_t __vfx_script_fireworks_graph_72691A8E_EB30_4566_BC51_64DA827A694A(double a1)
{
  uint64_t result;

  result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  **(_BYTE **)(result + 16) = 1;
  return result;
}

float __vfx_script_fireworks_graph_4AD865B9_2CA1_4C82_AA72_EC49942DA9DE(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 300.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

float __vfx_script_fireworks_graph_DB777B14_A366_4CC8_8010_6DFA3030539E(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 2000.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

uint64_t Spawn_fireworks_graph_CC976411_EC12_4A2C_A577_DD5F08309A69(const void *a1, unsigned int a2, const void *a3, double a4, float a5, float *a6)
{
  uint64_t result;
  int v8;

  *(float *)&a4 = fminf(fmaxf((float)(a5 - *(float *)&a4) / (float)((float)(*(float *)&a4 + 1.0) - *(float *)&a4), 0.0), 1.0);
  result = vfx_script_texture_sample1d_delayInitStub(a4);
  *(_DWORD *)a6 = v8;
  return result;
}

double Init_fireworks_graph_9C215676_B35D_4738_8604_1B0696C120C9(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  double result;

  result = -128.000092;
  *a3 = 0xC0600000C0933333;
  return result;
}

float Spawn_fireworks_graph_1E09F83D_74E8_4C33_AF7B_D1F4C7561C24(float a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  float result;

  result = a1 * 50.0;
  *a4 = (unint64_t)result;
  a4[1] = (unint64_t)result;
  return result;
}

double Init_fireworks_graph_FB239A73_A49B_49A1_B28F_F8EB686AE087(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, int32x4_t *a5)
{
  double result;

  *a5 = vdupq_n_s32(0x3E19999Au);
  *a3 = 0x40ABAE1540023D71;
  result = 0.0000119018532;
  *a4 = 0x3EE8F5C23E6C8B44;
  return result;
}

float Spawn_fireworks_graph_E9D5C3AC_14D8_4C9E_A340_8873556A15AC(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result;

  result = a3 * 5000.0;
  *a4 = result;
  return result;
}

double Init_fireworks_graph_4F52B7E1_CA7E_4C70_B2C9_199EA88DF652(uint64_t a1, uint64_t a2, _QWORD *a3, int32x4_t *a4)
{
  double result;

  *a4 = vdupq_n_s32(0x3DCCCCCDu);
  result = 1.71806921e-18;
  *a3 = 0x3C3FB15A3BC2A455;
  return result;
}

float Spawn_fireworks_graph_C96088C0_AF79_4824_9185_0DFF8E90BFB3(float a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  float result;

  result = a1 * 30.0;
  *a4 = (unint64_t)result;
  a4[1] = (unint64_t)result;
  return result;
}

double Init_fireworks_graph_5AC753AC_F888_4AEE_B41F_BA9FA15941CC(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, int32x4_t *a5)
{
  double result;

  *a5 = vdupq_n_s32(0x3DF5C28Fu);
  *a3 = 0x40E8000040300000;
  result = 0.00000157165527;
  *a4 = 0x3EBA5E353E3D3C37;
  return result;
}

float Spawn_fireworks_graph_68ABBDD2_799D_4316_B610_A615A6E5C6C0(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result;

  result = a3 * 7000.0;
  *a4 = result;
  return result;
}

double Init_fireworks_graph_BE082C18_F014_49F4_AE91_49F0A20CA327(uint64_t a1, uint64_t a2, _QWORD *a3, int32x4_t *a4)
{
  double result;

  *a4 = vdupq_n_s32(0x3CF5C28Fu);
  result = 1.29236965e-19;
  *a3 = 0x3C03126F3AD844D0;
  return result;
}

float Spawn_fireworks_graph_1F546ADD_0390_45D8_A31D_6FD1CEDB0057(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result;

  result = a3 * 10000.0;
  *a4 = result;
  return result;
}

double Init_fireworks_graph_5C6FE0C4_5B31_468F_9708_94003733DEC5(uint64_t a1, uint64_t a2, _QWORD *a3, int32x4_t *a4)
{
  double result;

  *a4 = vdupq_n_s32(0x3D4CCCCDu);
  result = 1.50053695e-20;
  *a3 = 0x3BD1B7183AAD03DBLL;
  return result;
}

float Spawn_fireworks_graph_32BE36EE_4AAF_45ED_8B70_F204A610CBF9(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result;

  result = a3 * 140.0;
  *a4 = result;
  return result;
}

double Init_fireworks_graph_9F0A8F07_3A67_4589_A511_28A794F02526(uint64_t a1, uint64_t a2, _QWORD *a3, int32x4_t *a4)
{
  double result;

  *a4 = vdupq_n_s32(0x3B03126Fu);
  result = 2.05564881e-20;
  *a3 = 0x3BD844D13BC49BA6;
  return result;
}

float Spawn_fireworks_graph_CECA8E5C_A7BB_4D57_BBA3_E684CB761DA9(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result;

  result = a3 * 8000.0;
  *a4 = result;
  return result;
}

double Init_fireworks_graph_3C6ED067_7943_49AD_A0AE_15130042E793(uint64_t a1, uint64_t a2, _QWORD *a3, int32x4_t *a4)
{
  double result;

  *a4 = vdupq_n_s32(0x3D4CCCCDu);
  result = 3.9690488e-19;
  *a3 = 0x3C1D49523B01C2E4;
  return result;
}

float Spawn_fireworks_graph_EF83050E_3420_4C5E_B29A_63DE74130B60(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result;

  result = a3 * 12000.0;
  *a4 = result;
  return result;
}

double Init_fireworks_graph_A5860394_860A_466B_9036_4241BA694F84(uint64_t a1, uint64_t a2, _QWORD *a3, int32x4_t *a4)
{
  double result;

  *a4 = vdupq_n_s32(0x3D4CCCCDu);
  result = 7.15400071e-19;
  *a3 = 0x3C2A64C33BB78035;
  return result;
}

double Init_fireworks_graph_647D8C58_3A96_4185_83BF_F834C05973E6(float32x4_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, int32x4_t *a5, float32x4_t *a6)
{
  double result;

  *a5 = vdupq_n_s32(0x3DCCCCCDu);
  *a6 = vmulq_f32(a1, (float32x4_t)vdupq_n_s32(0x3F19999Au));
  result = 0.00000157165527;
  *a4 = 0x3EBA5E353E3D3C37;
  return result;
}

int8x16_t Main_fireworks_graph_A51B6B76_047A_469C_B965_C43FB2E4CAC7(float32x4_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, int8x16_t *a5)
{
  float v7;
  unsigned int v8;
  int8x16_t result;
  int8x16_t v16;

  vfx_script_clock_delta_time_delayInitStub(*(double *)a1.i64);
  v16 = (int8x16_t)vmulq_n_f32(a1, 1.0 - v7);
  if (vfx_script_clock_is_first_frame_delayInitStub(*(double *)v16.i64))
    v8 = -1;
  else
    v8 = 0;
  __asm { FMOV            V1.4S, #1.0 }
  result = vbslq_s8((int8x16_t)vdupq_n_s32(v8), _Q1, v16);
  *a4 = xmmword_1C9322F10;
  *a5 = result;
  return result;
}

int8x16_t __vfx_script_fireworks_graph_A51B6B76_047A_469C_B965_C43FB2E4CAC7(double a1)
{
  _QWORD *arguments_buffer_delayInitStub;
  _OWORD *v2;
  int8x16_t *v3;
  float v4;
  unsigned int v5;
  int8x16_t result;
  float32x4_t v12;
  int8x16_t v13;

  arguments_buffer_delayInitStub = (_QWORD *)vfx_script_get_arguments_buffer_delayInitStub(a1);
  v2 = (_OWORD *)arguments_buffer_delayInitStub[3];
  v3 = (int8x16_t *)arguments_buffer_delayInitStub[4];
  v12 = *(float32x4_t *)arguments_buffer_delayInitStub[2];
  vfx_script_clock_delta_time_delayInitStub(*(double *)v12.i64);
  v13 = (int8x16_t)vmulq_n_f32(v12, 1.0 - v4);
  if (vfx_script_clock_is_first_frame_delayInitStub(*(double *)v13.i64))
    v5 = -1;
  else
    v5 = 0;
  __asm { FMOV            V1.4S, #1.0 }
  result = vbslq_s8((int8x16_t)vdupq_n_s32(v5), _Q1, v13);
  *v2 = xmmword_1C9322F10;
  *v3 = result;
  return result;
}

float Main_fireworks_graph_5AFE93DC_23D2_46C1_93C9_29F6F7292984(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result;

  result = a3 * 0.8;
  *a4 = result;
  return result;
}

uint64_t __vfx_script_fireworks_particleInit_182(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleInit_fireworks_particleInit_217(float a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, _OWORD *a6, float32x4_t *a7, float32x4_t *a8)
{
  unint64_t v11;
  float32x4_t v12;
  float32x4_t result;
  float32x4_t v14;
  _OWORD v21[6];
  _OWORD v22[6];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v22[0] = xmmword_1C9323520;
  v22[1] = xmmword_1C9323530;
  v22[2] = xmmword_1C9323540;
  v22[3] = xmmword_1C9323550;
  v22[4] = xmmword_1C9323560;
  v22[5] = xmmword_1C9323570;
  v11 = (unint64_t)fmodf((float)(unint64_t)(a4 + a5), 6.0);
  v12 = (float32x4_t)v22[v11];
  v21[0] = xmmword_1C9323580;
  v21[1] = xmmword_1C9323590;
  v21[2] = xmmword_1C93235A0;
  v21[3] = xmmword_1C93235B0;
  v21[4] = xmmword_1C93235C0;
  v21[5] = xmmword_1C93235D0;
  result = vmulq_n_f32(v12, a1);
  v14 = vmulq_n_f32((float32x4_t)v21[v11], a1);
  __asm { FMOV            V2.4S, #1.0 }
  *a6 = _Q2;
  *a7 = result;
  *a8 = v14;
  return result;
}

__n128 __vfx_script_fireworks_particleInit_217(double a1)
{
  double v1;
  __n128 result;

  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
  return result;
}

__n128 ParticleInit_fireworks_particleInit_140(uint64_t a1, uint64_t a2, __n128 *a3)
{
  __n128 result;

  __asm { FMOV            V0.4S, #1.0 }
  *a3 = result;
  return result;
}

void __vfx_script_fireworks_particleInit_140(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float ParticleInit_fireworks_particleInit_219(uint64_t a1, int a2, int a3, double *a4)
{
  int inited;
  unsigned int v8;
  float result;
  __int128 v10;
  __int128 v11;

  v11 = *(_OWORD *)a4;
  inited = vfx_script_clock_simulation_index_delayInitStub(*a4);
  v8 = 277803737
     * (((747796405 * (a3 + a2 + inited) + 572824890) >> (((747796405 * (a3 + a2 + inited)
                                                                                      + 572824890) >> 28)
                                                                      + 4)) ^ (747796405 * (a3 + a2 + inited) + 572824890));
  result = COERCE_FLOAT((v8 >> 31) ^ (v8 >> 9) | 0x3F800000) + -1.0;
  v10 = v11;
  *((float *)&v10 + 3) = result;
  *(_OWORD *)a4 = v10;
  return result;
}

uint64_t __vfx_script_fireworks_particleInit_219(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

void __vfx_script_fireworks_particleInit_189(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t ParticleInit_fireworks_particleInit_118(float a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, float32x4_t *a7, __int128 *a8, float *a9)
{
  float32x4_t v14;
  float32x4_t v15;
  int inited;
  int v17;
  unsigned int v18;
  int v19;
  unsigned int v20;
  double v21;
  uint64_t result;
  float v23;
  __int128 v24;
  unsigned int v25;
  float32x4_t v26;
  float32x4_t v27;
  __int128 v28;
  _OWORD v30[6];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v28 = *a8;
  v30[0] = xmmword_1C93235E0;
  v30[1] = xmmword_1C93235F0;
  v30[2] = xmmword_1C9323600;
  v30[3] = xmmword_1C9323610;
  v30[4] = xmmword_1C9323620;
  v30[5] = xmmword_1C9323630;
  v14 = (float32x4_t)v30[(unint64_t)fmodf((float)(unint64_t)(a4 + a5), 2.0)];
  v15 = vsubq_f32((float32x4_t)vdupq_n_s32(0x3F333333u), v14);
  v26 = vmlaq_f32(v14, (float32x4_t)vdupq_n_s32(0x3E4CCCCDu), v15);
  inited = vfx_script_clock_simulation_index_delayInitStub(*(double *)v15.i64);
  v17 = a5 + a3;
  v18 = 277803737
      * (((747796405 * (v17 + inited) - 2054186593) >> (((747796405 * (v17 + inited)
                                                                                    - 2054186593) >> 28)
                                                                    + 4)) ^ (747796405 * (v17 + inited) - 2054186593));
  v27 = vmulq_n_f32(v26, (float)((float)(COERCE_FLOAT((v18 >> 31) ^ (v18 >> 9) | 0x3F800000) + -1.0) * 0.3) + 0.7);
  v19 = vfx_script_clock_simulation_index_delayInitStub(*(double *)v27.i64);
  v20 = 277803737
      * (((747796405 * (v17 + v19) - 539145652) >> (((747796405 * (v17 + v19) - 539145652) >> 28)
                                                                + 4)) ^ (747796405 * (v17 + v19) - 539145652));
  *(float *)&v21 = COERCE_FLOAT((v20 >> 31) ^ (v20 >> 9) | 0x3F800000) + -1.0;
  v25 = LODWORD(v21);
  result = vfx_script_texture_sample1d_delayInitStub(v21);
  *a7 = v27;
  *a9 = (float)(fminf(fmaxf(v23, 0.0), 1.0) * 4.0) + 1.0;
  *(_QWORD *)&v24 = __PAIR64__(v25, LODWORD(a1));
  *((_QWORD *)&v24 + 1) = *((_QWORD *)&v28 + 1);
  *a8 = v24;
  return result;
}

uint64_t __vfx_script_fireworks_particleInit_118(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t __vfx_script_fireworks_particleInit_264(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t ParticleInit_fireworks_particleInit_54(float32x4_t a1, uint64_t a2, int a3, uint64_t a4, int a5, float32x4_t *a6)
{
  double v9;
  int inited;
  int v11;
  unsigned int v12;
  double v13;
  float32x4_t v14;
  int v15;
  unsigned int v16;
  float32x4_t v17;
  double v18;
  float32x4_t v20;
  float32x4_t v21;

  v20 = vmulq_f32(vmulq_f32(a1, (float32x4_t)vdupq_n_s32(0x3ECCCCCDu)), (float32x4_t)xmmword_1C9323640);
  vfx_script_color_ramp_create_setting_color_delayInitStub(*(double *)v20.i64);
  vfx_script_color_ramp_create_setting_color_delayInitStub(*(double *)vmulq_f32(v20, (float32x4_t)xmmword_1C9323650).i64);
  inited = vfx_script_clock_simulation_index_delayInitStub(v9);
  v11 = a5 + a3;
  v12 = 277803737
      * (((747796405 * (v11 + inited) + 1398413819) >> (((747796405 * (v11 + inited)
                                                                                    + 1398413819) >> 28)
                                                                    + 4)) ^ (747796405 * (v11 + inited) + 1398413819));
  *(float *)&v13 = COERCE_FLOAT((v12 >> 31) ^ (v12 >> 9) | 0x3F800000) + -1.0;
  vfx_script_color_ramp_evaluate_delayInitStub(v13);
  v21 = v14;
  v15 = vfx_script_clock_simulation_index_delayInitStub(*(double *)v14.i64);
  v16 = 277803737
      * (((747796405 * (v11 + v15) + 94632143) >> (((747796405 * (v11 + v15) + 94632143) >> 28)
                                                               + 4)) ^ (747796405 * (v11 + v15) + 94632143));
  v17 = vmulq_n_f32(v21, (float)((float)(COERCE_FLOAT((v16 >> 31) ^ (v16 >> 9) | 0x3F800000) + -1.0) * 0.015) + 0.055);
  *a6 = v17;
  vfx_script_color_ramp_destroy_delayInitStub(*(double *)v17.i64);
  return vfx_script_color_ramp_destroy_delayInitStub(v18);
}

uint64_t __vfx_script_fireworks_particleInit_54(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t ParticleInit_fireworks_particleInit_235(float32x4_t a1, float32x4_t a2, float32x4_t a3, uint64_t a4, int a5, int a6, uint64_t a7, float32x4_t *a8, float32x4_t *a9)
{
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  int8x16_t v18;
  int32x4_t v19;
  int inited;
  int v26;
  unsigned int v27;
  double v28;
  int v29;
  unsigned int v30;
  double v31;
  float32x4_t v32;
  int v33;
  unsigned int v34;
  float32x4_t v35;
  double v36;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;

  v13 = vsubq_f32(a1, a2);
  v14 = vmulq_f32(v13, v13);
  v14.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 2), vaddq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 1))).u64[0];
  v15 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 0);
  v15.i32[3] = 0;
  v16 = vrsqrteq_f32(v15);
  v17 = vmulq_f32(v16, vrsqrtsq_f32(v15, vmulq_f32(v16, v16)));
  v18 = (int8x16_t)vmulq_f32(v17, vrsqrtsq_f32(v15, vmulq_f32(v17, v17)));
  v19 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v14.f32[0] != 0.0)), 0x1FuLL));
  v19.i32[3] = 0;
  __asm { FMOV            V3.4S, #1.0 }
  v41 = vmulq_f32(v13, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v19), v18, _Q3));
  inited = vfx_script_clock_simulation_index_delayInitStub(*(double *)v41.i64);
  v26 = a6 + a5;
  v27 = 277803737
      * (((747796405 * (v26 + inited) - 883871658) >> (((747796405 * (v26 + inited)
                                                                                   - 883871658) >> 28)
                                                                   + 4)) ^ (747796405 * (v26 + inited) - 883871658));
  v42 = vmulq_n_f32(v41, (float)(fminf(fmaxf(COERCE_FLOAT((v27 >> 31) ^ (v27 >> 9) | 0x3F800000) + -1.0, 0.0), 1.0) * 0.4) + 0.8);
  v39 = vmulq_f32(vmulq_f32(a3, (float32x4_t)vdupq_n_s32(0x3ECCCCCDu)), (float32x4_t)xmmword_1C9323640);
  vfx_script_color_ramp_create_setting_color_delayInitStub(*(double *)v39.i64);
  vfx_script_color_ramp_create_setting_color_delayInitStub(*(double *)vmulq_f32(v39, (float32x4_t)xmmword_1C9323650).i64);
  v29 = vfx_script_clock_simulation_index_delayInitStub(v28);
  v30 = 277803737
      * (((747796405 * (v26 + v29) + 1398413819) >> (((747796405 * (v26 + v29) + 1398413819) >> 28)
                                                                 + 4)) ^ (747796405 * (v26 + v29) + 1398413819));
  *(float *)&v31 = COERCE_FLOAT((v30 >> 31) ^ (v30 >> 9) | 0x3F800000) + -1.0;
  vfx_script_color_ramp_evaluate_delayInitStub(v31);
  v40 = v32;
  v33 = vfx_script_clock_simulation_index_delayInitStub(*(double *)v32.i64);
  v34 = 277803737
      * (((747796405 * (v26 + v33) + 94632143) >> (((747796405 * (v26 + v33) + 94632143) >> 28)
                                                               + 4)) ^ (747796405 * (v26 + v33) + 94632143));
  v35 = vmulq_n_f32(v40, (float)((float)(COERCE_FLOAT((v34 >> 31) ^ (v34 >> 9) | 0x3F800000) + -1.0) * 0.07) + 0.1);
  *a8 = v42;
  *a9 = v35;
  vfx_script_color_ramp_destroy_delayInitStub(*(double *)v35.i64);
  return vfx_script_color_ramp_destroy_delayInitStub(v36);
}

uint64_t __vfx_script_fireworks_particleInit_235(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleInit_fireworks_particleInit_169(float32x4_t a1, uint64_t a2, uint64_t a3, float32x4_t *a4)
{
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t result;

  __asm { FMOV            V1.4S, #-1.0 }
  v9 = vaddq_f32(a1, _Q1);
  v10 = (float32x4_t)vdupq_n_s32(0x3ECCCCCDu);
  __asm { FMOV            V2.4S, #1.0 }
  result = vmulq_f32(vmlaq_f32(_Q2, v10, v9), v10);
  *a4 = result;
  return result;
}

uint64_t __vfx_script_fireworks_particleInit_169(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

void ParticleInit_fireworks_particleInit_8(__n128 a1, uint64_t a2, uint64_t a3, __n128 *a4)
{
  *a4 = a1;
}

__n128 __vfx_script_fireworks_particleInit_8(double a1)
{
  double v1;
  __n128 result;

  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
  return result;
}

uint64_t __vfx_script_fireworks_particleInit_86(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleInit_fireworks_particleInit_14(float32x4_t a1, float32x4_t a2, uint64_t a3, int a4, int a5, uint64_t a6, float32x4_t *a7, float32x4_t *a8)
{
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  int8x16_t v16;
  int32x4_t v17;
  int inited;
  int v24;
  unsigned int v25;
  int v26;
  unsigned int v27;
  double v28;
  float32x4_t v29;
  float32x4_t result;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v34;

  v12 = vmulq_f32(a1, a1);
  v12.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2), vaddq_f32(v12, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v12.f32, 1))).u64[0];
  v13 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v12.f32, 0);
  v13.i32[3] = 0;
  v14 = vrsqrteq_f32(v13);
  v15 = vmulq_f32(v14, vrsqrtsq_f32(v13, vmulq_f32(v14, v14)));
  v16 = (int8x16_t)vmulq_f32(v15, vrsqrtsq_f32(v13, vmulq_f32(v15, v15)));
  v17 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v12.f32[0] != 0.0)), 0x1FuLL));
  v17.i32[3] = 0;
  __asm { FMOV            V3.4S, #1.0 }
  v31 = vmulq_f32((float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v17), v16, _Q3), a1);
  inited = vfx_script_clock_simulation_index_delayInitStub(*(double *)v31.i64);
  v24 = a5 + a4;
  v25 = 277803737
      * (((747796405 * (v24 + inited) - 883871658) >> (((747796405 * (v24 + inited)
                                                                                   - 883871658) >> 28)
                                                                   + 4)) ^ (747796405 * (v24 + inited) - 883871658));
  v32 = vmulq_n_f32(v31, (float)((float)(COERCE_FLOAT((v25 >> 31) ^ (v25 >> 9) | 0x3F800000) + -1.0) + 0.5) * 0.7);
  v34 = vmulq_f32(a2, (float32x4_t)vdupq_n_s32(0x3F19999Au));
  v26 = vfx_script_clock_simulation_index_delayInitStub(*(double *)v34.i64);
  v27 = 277803737
      * (((747796405 * (v24 + v26) - 1095130923) >> (((747796405 * (v24 + v26) - 1095130923) >> 28)
                                                                 + 4)) ^ (747796405 * (v24 + v26) - 1095130923));
  *(float *)&v28 = COERCE_FLOAT((v27 >> 31) ^ (v27 >> 9) | 0x3F800000) + -1.0;
  vfx_script_texture_sample1d_delayInitStub(v28);
  result = vmulq_f32(v34, v29);
  *a7 = v32;
  *a8 = result;
  return result;
}

uint64_t __vfx_script_fireworks_particleInit_14(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t __vfx_script_fireworks_particleUpdate_39(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleUpdate_fireworks_particleUpdate_273(float32x4_t a1, float a2, float a3, uint64_t a4, uint64_t a5, uint64_t a6, float32x4_t *a7)
{
  float v9;
  float32x4_t result;
  float32x4_t v11;

  v11 = a1;
  a1.f32[0] = a1.f32[3] + a2;
  vfx_script_texture_sample1d_delayInitStub(*(double *)a1.i64);
  result = vmulq_n_f32(vmulq_n_f32(v11, v9), fminf(fmaxf(a3, 0.0), 1.0));
  *a7 = result;
  return result;
}

uint64_t __vfx_script_fireworks_particleUpdate_273(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

__n128 ParticleUpdate_fireworks_particleUpdate_73(float32x4_t a1, float a2, double a3, float a4, float a5, uint64_t a6, uint64_t a7, uint64_t a8, float *a9, float *a10, float32x4_t *a11, __int128 *a12)
{
  float32x4_t v18;
  float v19;
  float v20;
  float v21;
  double v22;
  float v23;
  float v24;
  float v25;
  __int128 v26;
  __n128 result;
  float v28;
  __int128 v30;

  v30 = *a12;
  v18 = vmulq_f32(a1, (float32x4_t)xmmword_1C9323660);
  v18.f32[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v18, 2), vaddq_f32(v18, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v18.f32, 1))).f32[0];
  v19 = fminf(fmaxf(v18.f32[0] / 1.1, 0.0), 1.0) + 0.0;
  v20 = (float)(fminf(fmaxf(v18.f32[0] / 1.5, 0.0), 1.0) * -0.5) + 1.5;
  v21 = fminf(fmaxf((float)(a5 + -0.3) / 0.7, 0.0), 1.0);
  *(float *)&v22 = fmodf((float)(v21 * 1.2) + 0.0, 1.0);
  v28 = fminf(fmaxf(a4, 0.0), 1.0);
  vfx_script_texture_sample1d_delayInitStub(v22);
  v24 = fmaxf(v23, 0.0);
  v25 = 3.0;
  if (v21 <= 0.0)
    v25 = 0.0;
  *a9 = 1.0 - v19;
  *a10 = (float)(v20 * *(float *)&a3) * a2;
  *a11 = vmulq_f32(vmulq_n_f32(vmulq_n_f32(a1, (float)(vmuls_lane_f32(v25, *(float32x2_t *)&a3, 1) + 1.0) * v24), v28), (float32x4_t)vdupq_n_s32(0x3F333333u));
  v26 = v30;
  DWORD2(v26) = 0;
  *a12 = v26;
  result.n128_u64[0] = v26;
  result.n128_u32[2] = DWORD2(v26);
  return result;
}

uint64_t __vfx_script_fireworks_particleUpdate_73(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t __vfx_script_fireworks_particleUpdate_143(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleUpdate_fireworks_particleUpdate_52(float32x4_t a1, float32_t a2, float a3, uint64_t a4, uint64_t a5, uint64_t a6, float32x4_t *a7)
{
  float32x4_t v9;
  float32x4_t result;
  float32x4_t v11;

  v11 = a1;
  a1.f32[0] = a2;
  vfx_script_texture_sample1d_delayInitStub(*(double *)a1.i64);
  result = vmulq_n_f32(vmulq_f32(v9, v11), fminf(fmaxf(a3, 0.0), 1.0));
  *a7 = result;
  return result;
}

uint64_t __vfx_script_fireworks_particleUpdate_52(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleUpdate_fireworks_particleUpdate_22(float32x4_t a1, float32_t a2, float a3, uint64_t a4, uint64_t a5, uint64_t a6, float32x4_t *a7)
{
  float32x4_t v9;
  float32x4_t result;
  float32x4_t v11;

  v11 = a1;
  a1.f32[0] = a2;
  vfx_script_texture_sample1d_delayInitStub(*(double *)a1.i64);
  result = vmulq_n_f32(vmulq_f32(vmulq_f32(v9, (float32x4_t)vdupq_n_s32(0x3F333333u)), v11), fminf(fmaxf(a3, 0.0), 1.0));
  *a7 = result;
  return result;
}

uint64_t __vfx_script_fireworks_particleUpdate_22(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleUpdate_fireworks_particleUpdate_142(float32x4_t a1, float a2, float a3, uint64_t a4, int a5, int a6, uint64_t a7, float32x4_t *a8)
{
  int inited;
  double v14;
  unsigned int v15;
  float v16;
  float v17;
  float32x4_t result;

  inited = vfx_script_clock_simulation_index_delayInitStub(*(double *)a1.i64);
  v15 = 277803737
      * (((747796405 * (a6 + a5 + inited) + 208650753) >> (((747796405 * (a6 + a5 + inited)
                                                                                       + 208650753) >> 28)
                                                                       + 4)) ^ (747796405 * (a6 + a5 + inited)
                                                                              + 208650753));
  if ((float)(COERCE_FLOAT((v15 >> 31) ^ (v15 >> 9) | 0x3F800000) + -1.0) <= 0.5)
    v16 = 0.0;
  else
    v16 = 1.0;
  *(float *)&v14 = a2;
  vfx_script_texture_sample1d_delayInitStub(v14);
  result = vmulq_n_f32(vmulq_n_f32(a1, fminf(v17 + v16, 1.0)), fminf(fmaxf(a3, 0.0), 1.0));
  *a8 = result;
  return result;
}

uint64_t __vfx_script_fireworks_particleUpdate_142(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t ParticleUpdate_fireworks_particleUpdate_257(float32x4_t a1, float a2, float a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, float32x4_t *a9)
{
  double v19;
  int inited;
  double v21;
  unsigned int v22;
  float v23;
  float v24;
  float32x4_t result;
  float32x4_t v26;
  float32x4_t v27;

  v26 = a1;
  a1.f32[0] = a2;
  vfx_script_texture_sample1d_delayInitStub(*(double *)a1.i64);
  __asm { FMOV            V1.4S, #1.0 }
  v27 = vmlaq_n_f32(v26, vsubq_f32(_Q1, v26), *(float *)&v19);
  inited = vfx_script_clock_simulation_index_delayInitStub(v19);
  v22 = 277803737
      * (((747796405 * (a7 + a5 + inited) + 208650753) >> (((747796405 * (a7 + a5 + inited)
                                                                                       + 208650753) >> 28)
                                                                       + 4)) ^ (747796405 * (a7 + a5 + inited)
                                                                              + 208650753));
  if ((float)(COERCE_FLOAT((v22 >> 31) ^ (v22 >> 9) | 0x3F800000) + -1.0) <= 0.5)
    v23 = 0.0;
  else
    v23 = 1.0;
  *(float *)&v21 = a2;
  vfx_script_texture_sample1d_delayInitStub(v21);
  result = vmulq_n_f32(vmulq_n_f32(v27, fminf(v24 + v23, 1.0)), fminf(fmaxf(a3, 0.0), 1.0));
  *a9 = result;
  return result;
}

uint64_t __vfx_script_fireworks_particleUpdate_257(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t __vfx_script_fireworks_particleUpdate_322(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t __vfx_script_fireworks_particleUpdate_223(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t particle_update_fireworks_particleUpdate_85(uint64_t a1, __int32 *a2, float32x4_t *a3, __int32 *a4, float32x4_t *a5)
{
  float32x4_t result;
  float32x4_t v6;

  result.i32[0] = *a2;
  if (*(float *)a2 > 0.0)
  {
    result.i32[0] = *a4;
    if (*(float *)a4 > 0.0)
    {
      v6.i64[0] = 0x3F0000003F000000;
      v6.i64[1] = 0x3F0000003F000000;
      __asm { FMOV            V1.4S, #1.0 }
      result = vminnmq_f32(vmlaq_f32(*a5, v6, *a3), _Q1);
      *a5 = result;
      *a4 = 0;
    }
  }
  return result;
}

uint64_t __vfx_script_fireworks_particleUpdate_85(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float32x4_t particle_update_fireworks_particleUpdate_238(uint64_t a1, __int32 *a2, __int32 *a3, float32x4_t *a4)
{
  float32x4_t result;

  result.i32[0] = *a2;
  if (*(float *)a2 > 0.0)
  {
    result.i32[0] = *a3;
    if (*(float *)a3 > 0.0)
    {
      __asm { FMOV            V1.4S, #1.0 }
      result = vminnmq_f32(vaddq_f32(*a4, (float32x4_t)vdupq_n_s32(0x3F19999Au)), _Q1);
      *a4 = result;
      *a3 = 0;
    }
  }
  return result;
}

uint64_t __vfx_script_fireworks_particleUpdate_238(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

double __vfx_script_confetti_graph_6501AA18_D88F_4677_984C_34E780A7C1F0(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  double result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = 0.00000133972957;
  *(_OWORD *)*(_QWORD *)(arguments_buffer_delayInitStub + 16) = xmmword_1C9322F10;
  return result;
}

void Spawn_confetti_graph_B0667801_C60E_4D93_B9A1_27F790726520(float a1, float a2, float a3, uint64_t a4, uint64_t a5, int a6, int a7, unint64_t *a8, unint64_t *a9)
{
  float v9;
  BOOL v10;
  float v11;
  float v12;
  float v13;
  unint64_t v14;

  v9 = a1 * 150.0;
  v10 = fabsf(a3) <= 0.00000011921;
  v11 = a2 / a3;
  v12 = 0.0;
  if (v10)
    v11 = 0.0;
  v13 = v9 * v11;
  if (a6)
    v12 = 1.0;
  v14 = (unint64_t)(float)(v13 + (float)((float)((float)(v13 * 0.5) - v13) * v12));
  if (!a7)
    v14 = 0;
  *a8 = v14;
  a8[1] = v14;
  *a9 = v14;
  a9[1] = v14;
}

float Init_confetti_graph_77839324_3A35_4199_A55E_F65CEF5F32BF(uint64_t a1, uint64_t a2, int a3, float *a4)
{
  unsigned int v5;
  int8x8_t v6;
  float v7;
  float result;

  if (a3 == 270 || a3 == 90)
    v5 = -1;
  else
    v5 = 0;
  v6 = vbsl_s8((int8x8_t)vdup_n_s32(v5), (int8x8_t)0x4080000040600000, (int8x8_t)0x4060000040400000);
  v7 = fminf(*(float *)v6.i32, *(float *)&v6.i32[1]);
  result = fmaxf(*(float *)v6.i32, *(float *)&v6.i32[1]);
  *a4 = v7;
  a4[1] = result;
  return result;
}

uint64_t __vfx_script_confetti_graph_9855979D_D680_4AC7_999F_4BD84B083C71(double a1)
{
  uint64_t result;

  result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  **(_BYTE **)(result + 16) = 1;
  return result;
}

void Spawn_confetti_graph_A9645361_1E28_4A66_8CE1_0FBB358E68C4(float a1, float a2, float a3, uint64_t a4, uint64_t a5, int a6, int a7, unint64_t *a8, unint64_t *a9)
{
  float v9;
  BOOL v10;
  float v11;
  float v12;
  float v13;
  unint64_t v14;

  v9 = a2 * 0.5;
  v10 = fabsf(v9) <= 0.00000011921;
  v11 = (float)(v9 - a3) / v9;
  if (v10)
    v11 = 0.0;
  v12 = (float)(a1 * 10.0) * v11;
  v13 = 1.0;
  if (!a6)
    v13 = 0.0;
  v14 = (unint64_t)(float)((float)(v12 * v13) + 0.0);
  if (!a7)
    v14 = 0;
  *a8 = v14;
  a8[1] = v14;
  *a9 = v14;
  a9[1] = v14;
}

float32x4_t Main_confetti_graph_C7F30F02_BA8A_4DBA_8AB9_BEAFDE59A291(float32x4_t a1, float a2, float a3, uint64_t a4, uint64_t a5, float32x4_t *a6)
{
  unsigned int v6;
  unsigned int v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t result;

  *(float *)&v6 = a2 * 0.5;
  *(float *)&v7 = (float)(*(float *)&v6 - a3) * 0.5;
  v8.i64[0] = 0;
  v8.i64[1] = v6;
  v9.i64[0] = 0;
  v9.i64[1] = v7;
  result = vsubq_f32(vaddq_f32(a1, v8), v9);
  *a6 = result;
  return result;
}

void Spawn_confetti_graph_16E7F806_2D73_4A39_B82C_90F26336105A(float a1, float a2, float a3, uint64_t a4, uint64_t a5, int a6, int a7, unint64_t *a8, unint64_t *a9)
{
  BOOL v9;
  float v10;
  float v11;
  float v12;
  unint64_t v13;

  v9 = fabsf(a2) <= 0.00000011921;
  v10 = (float)(a2 - a3) / a2;
  if (v9)
    v10 = 0.0;
  v11 = (float)(a1 * 30.0) * v10;
  v12 = 1.0;
  if (!a6)
    v12 = 0.0;
  v13 = (unint64_t)(float)((float)(v11 * v12) + 0.0);
  if (!a7)
    v13 = 0;
  *a8 = v13;
  a8[1] = v13;
  *a9 = v13;
  a9[1] = v13;
}

float32x4_t Main_confetti_graph_47AC3C7A_C039_41DA_AD43_881D7E0F565A(float32x4_t a1, float a2, float a3, uint64_t a4, uint64_t a5, float32x4_t *a6)
{
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t result;

  v6.i64[0] = 0;
  v6.i32[3] = 0;
  v7.i64[0] = 0;
  v7.i32[3] = 0;
  v7.f32[2] = -a2;
  v6.f32[2] = (float)(a2 - a3) * 0.5;
  result = vaddq_f32(vaddq_f32(vaddq_f32(a1, v7), v6), (float32x4_t)xmmword_1C9343760);
  *a6 = result;
  return result;
}

float Init_confetti_graph_586EC683_ECAC_48E9_B645_74C36BE0B254(uint64_t a1, uint64_t a2, int a3, float *a4)
{
  unsigned int v5;
  int8x8_t v6;
  float v7;
  float result;

  if (a3 == 270 || a3 == 90)
    v5 = -1;
  else
    v5 = 0;
  v6 = vbsl_s8((int8x8_t)vdup_n_s32(v5), (int8x8_t)0x40A0000040900000, (int8x8_t)0x4080000040600000);
  v7 = fminf(*(float *)v6.i32, *(float *)&v6.i32[1]);
  result = fmaxf(*(float *)v6.i32, *(float *)&v6.i32[1]);
  *a4 = v7;
  a4[1] = result;
  return result;
}

float __vfx_script_confetti_graph_D45D06FA_D64A_4215_983D_70FBC27B23B0(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 2000.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

float __vfx_script_confetti_graph_06A14A47_3880_4300_8226_188BD75B83F1(double a1)
{
  uint64_t arguments_buffer_delayInitStub;
  float result;

  arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  result = **(float **)(arguments_buffer_delayInitStub + 16) * 300.0;
  **(float **)(arguments_buffer_delayInitStub + 24) = result;
  return result;
}

uint64_t ParticleInit_confetti_particleInit_113(double a1, float32x4_t a2, uint64_t a3, int a4, int a5, int a6, uint64_t a7, int a8, uint64_t a9, float32x4_t *a10, _OWORD *a11, _OWORD *a12)
{
  float v15;
  __int32 v16;
  uint32x2_t v17;
  uint32x2_t v18;
  float32x2_t v23;
  float32x4_t v25;
  unsigned int v26;
  float32x4_t v27;
  float32x4_t v28;
  float v29;
  float32x4_t v31;
  int inited;
  unsigned int v33;
  float v34;
  double v35;
  __int128 v36;
  uint64_t result;
  __int128 v38;
  __int128 v39;
  float32x4_t v40;
  float32x4_t v41;

  v15 = 0.0;
  if (a5)
    v15 = 1.0;
  *(float *)&a1 = (float)(*(float *)&a1 + (float)((float)(a2.f32[0] - *(float *)&a1) * v15))
                + (float)(*(float *)&a1 + (float)((float)(a2.f32[0] - *(float *)&a1) * v15));
  a2.i64[0] = COERCE_UNSIGNED_INT(1.0) | 0x3E4CCCCD00000000;
  a2.i32[2] = LODWORD(a1);
  v40 = a2;
  v16 = 747796405 * (vfx_script_clock_simulation_index_delayInitStub(a1) + a4) - 1901271721;
  v17.i32[0] = v16;
  v17.i32[1] = 747796405 * v16 - 1403630843;
  v18 = (uint32x2_t)vmul_s32((int32x2_t)veor_s8((int8x8_t)vshl_u32(v17, (uint32x2_t)vsub_s32((int32x2_t)0x300000003, (int32x2_t)vshr_n_u32(v17, 0x1CuLL))), (int8x8_t)v17), vdup_n_s32(0x108EF2D9u));
  __asm { FMOV            V1.2S, #1.0 }
  v23 = (float32x2_t)vorr_s8(veor_s8((int8x8_t)vshl_u32(v18, (uint32x2_t)0xFFFFFFE1FFFFFFF7), (int8x8_t)vshl_u32(v18, (uint32x2_t)0xFFFFFFF7FFFFFFE1)), _D1);
  __asm { FMOV            V1.2S, #-1.0 }
  *(float32x2_t *)v25.f32 = vadd_f32(v23, _D1);
  v26 = 277803737
      * (((747796405 * (747796405 * v16 - 1403630843) - 1403630843) >> (((747796405 * (747796405 * v16 - 1403630843) - 1403630843) >> 28)
                                                                                    + 4)) ^ (747796405
                                                                                           * (747796405 * v16
                                                                                            - 1403630843)
                                                                                           - 1403630843));
  v25.f32[2] = COERCE_FLOAT((v26 >> 31) ^ (v26 >> 9) | 0x3F800000) + -1.0;
  v27.i64[0] = 0xBF000000BF000000;
  v27.i64[1] = 0xBF000000BF000000;
  v28 = vmulq_f32(v40, vaddq_f32(v25, v27));
  v29 = v28.f32[1];
  if (a6 == 270 || a6 == 90)
    v29 = v28.f32[1] + 0.05;
  v31 = v28;
  v31.f32[1] = v29;
  v31.i32[2] = v28.i32[2];
  v41 = v31;
  inited = vfx_script_clock_simulation_index_delayInitStub(*(double *)v28.i64);
  v33 = 277803737
      * (((747796405 * (a8 + a4 + inited) + 2107313962) >> (((747796405 * (a8 + a4 + inited)
                                                                                        + 2107313962) >> 28)
                                                                        + 4)) ^ (747796405 * (a8 + a4 + inited)
                                                                               + 2107313962));
  v34 = COERCE_FLOAT((v33 >> 31) ^ (v33 >> 9) | 0x3F800000) + -1.0;
  *(float *)&v35 = v34;
  vfx_script_texture_sample1d_delayInitStub(v35);
  v39 = v36;
  *(float *)&v36 = v34;
  result = vfx_script_texture_sample1d_delayInitStub(*(double *)&v36);
  *a10 = v41;
  *a11 = v39;
  *a12 = v38;
  return result;
}

uint64_t __vfx_script_confetti_particleInit_113(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

void __vfx_script_confetti_particleInit_29(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float ParticleInit_confetti_particleInit_172(double a1, float32x4_t a2, uint64_t a3, int a4, int a5, uint64_t a6, int a7, uint64_t a8, float32x4_t *a9, _OWORD *a10, _OWORD *a11, __int128 *a12)
{
  __int32 v15;
  uint32x2_t v16;
  uint32x2_t v17;
  float32x2_t v22;
  float32x4_t v24;
  unsigned int v25;
  float32x4_t v26;
  float32x4_t v27;
  float v28;
  float32x4_t v30;
  int inited;
  unsigned int v32;
  double v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v38;
  float32x4_t v39;
  __int128 v40;
  float32x4_t v43;
  double v44;

  v40 = *a12;
  *(float *)&a1 = (float)((float)((float)(*(float *)&a1 * 0.5) - a2.f32[0]) * 0.5)
                + (float)((float)((float)(*(float *)&a1 * 0.5) - a2.f32[0]) * 0.5);
  a2.i64[0] = COERCE_UNSIGNED_INT(1.0) | 0x3E4CCCCD00000000;
  a2.i32[2] = LODWORD(a1);
  v43 = a2;
  v15 = 747796405 * (vfx_script_clock_simulation_index_delayInitStub(a1) + a4) - 1901271721;
  v16.i32[0] = v15;
  v16.i32[1] = 747796405 * v15 - 1403630843;
  v17 = (uint32x2_t)vmul_s32((int32x2_t)veor_s8((int8x8_t)vshl_u32(v16, (uint32x2_t)vsub_s32((int32x2_t)0x300000003, (int32x2_t)vshr_n_u32(v16, 0x1CuLL))), (int8x8_t)v16), vdup_n_s32(0x108EF2D9u));
  __asm { FMOV            V1.2S, #1.0 }
  v22 = (float32x2_t)vorr_s8(veor_s8((int8x8_t)vshl_u32(v17, (uint32x2_t)0xFFFFFFE1FFFFFFF7), (int8x8_t)vshl_u32(v17, (uint32x2_t)0xFFFFFFF7FFFFFFE1)), _D1);
  __asm { FMOV            V1.2S, #-1.0 }
  *(float32x2_t *)v24.f32 = vadd_f32(v22, _D1);
  v25 = 277803737
      * (((747796405 * (747796405 * v15 - 1403630843) - 1403630843) >> (((747796405 * (747796405 * v15 - 1403630843) - 1403630843) >> 28)
                                                                                    + 4)) ^ (747796405
                                                                                           * (747796405 * v15
                                                                                            - 1403630843)
                                                                                           - 1403630843));
  v24.f32[2] = COERCE_FLOAT((v25 >> 31) ^ (v25 >> 9) | 0x3F800000) + -1.0;
  v26.i64[0] = 0xBF000000BF000000;
  v26.i64[1] = 0xBF000000BF000000;
  v27 = vmulq_f32(v43, vaddq_f32(v24, v26));
  v28 = v27.f32[1];
  if (a5 == 270 || a5 == 90)
    v28 = v27.f32[1] + 0.01;
  v30 = v27;
  v30.f32[1] = v28;
  v30.i32[2] = v27.i32[2];
  v39 = v30;
  inited = vfx_script_clock_simulation_index_delayInitStub(*(double *)v27.i64);
  v32 = 277803737
      * (((747796405 * (a7 + a4 + inited) + 2107313962) >> (((747796405 * (a7 + a4 + inited)
                                                                                        + 2107313962) >> 28)
                                                                        + 4)) ^ (747796405 * (a7 + a4 + inited)
                                                                               + 2107313962));
  *(float *)&v33 = COERCE_FLOAT((v32 >> 31) ^ (v32 >> 9) | 0x3F800000) + -1.0;
  v44 = v33;
  vfx_script_texture_sample1d_delayInitStub(v33);
  v38 = v34;
  vfx_script_texture_sample1d_delayInitStub(v44);
  *a9 = v39;
  *a10 = v38;
  *a11 = v35;
  v36 = v40;
  LODWORD(v36) = LODWORD(v44);
  *a12 = v36;
  return *(float *)&v36;
}

uint64_t __vfx_script_confetti_particleInit_172(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float ParticleInit_confetti_particleInit_146(double a1, float32x4_t a2, uint64_t a3, int a4, int a5, int a6, uint64_t a7, int a8, uint64_t a9, float32x4_t *a10, _OWORD *a11, _OWORD *a12, __int128 *a13)
{
  __int32 v17;
  uint32x2_t v18;
  uint32x2_t v19;
  float32x2_t v24;
  float32x4_t v26;
  unsigned int v27;
  float32x4_t v28;
  float32x4_t v29;
  float v30;
  _BOOL4 v32;
  float v33;
  float32x4_t v34;
  int inited;
  unsigned int v36;
  double v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v42;
  float32x4_t v43;
  __int128 v44;
  float32x4_t v46;
  double v47;

  v44 = *a13;
  *(float *)&a1 = (float)((float)(*(float *)&a1 - a2.f32[0]) * 0.5) + (float)((float)(*(float *)&a1 - a2.f32[0]) * 0.5);
  a2.i64[0] = COERCE_UNSIGNED_INT(1.0) | 0x3E4CCCCD00000000;
  a2.i32[2] = LODWORD(a1);
  v46 = a2;
  v17 = 747796405 * (vfx_script_clock_simulation_index_delayInitStub(a1) + a4) - 1901271721;
  v18.i32[0] = v17;
  v18.i32[1] = 747796405 * v17 - 1403630843;
  v19 = (uint32x2_t)vmul_s32((int32x2_t)veor_s8((int8x8_t)vshl_u32(v18, (uint32x2_t)vsub_s32((int32x2_t)0x300000003, (int32x2_t)vshr_n_u32(v18, 0x1CuLL))), (int8x8_t)v18), vdup_n_s32(0x108EF2D9u));
  __asm { FMOV            V1.2S, #1.0 }
  v24 = (float32x2_t)vorr_s8(veor_s8((int8x8_t)vshl_u32(v19, (uint32x2_t)0xFFFFFFE1FFFFFFF7), (int8x8_t)vshl_u32(v19, (uint32x2_t)0xFFFFFFF7FFFFFFE1)), _D1);
  __asm { FMOV            V1.2S, #-1.0 }
  *(float32x2_t *)v26.f32 = vadd_f32(v24, _D1);
  v27 = 277803737
      * (((747796405 * (747796405 * v17 - 1403630843) - 1403630843) >> (((747796405 * (747796405 * v17 - 1403630843) - 1403630843) >> 28)
                                                                                    + 4)) ^ (747796405
                                                                                           * (747796405 * v17
                                                                                            - 1403630843)
                                                                                           - 1403630843));
  v26.f32[2] = COERCE_FLOAT((v27 >> 31) ^ (v27 >> 9) | 0x3F800000) + -1.0;
  v28.i64[0] = 0xBF000000BF000000;
  v28.i64[1] = 0xBF000000BF000000;
  v29 = vmulq_f32(v46, vaddq_f32(v26, v28));
  v30 = v29.f32[1];
  v32 = a5 == 90 || a5 == 270;
  v33 = 0.35;
  if (a6 == 4 && v32)
    v33 = 0.25;
  if (v32)
    v30 = v33;
  v34 = v29;
  v34.f32[1] = v30;
  v34.i32[2] = v29.i32[2];
  v43 = v34;
  inited = vfx_script_clock_simulation_index_delayInitStub(*(double *)v29.i64);
  v36 = 277803737
      * (((747796405 * (a8 + a4 + inited) + 2107313962) >> (((747796405 * (a8 + a4 + inited)
                                                                                        + 2107313962) >> 28)
                                                                        + 4)) ^ (747796405 * (a8 + a4 + inited)
                                                                               + 2107313962));
  *(float *)&v37 = COERCE_FLOAT((v36 >> 31) ^ (v36 >> 9) | 0x3F800000) + -1.0;
  v47 = v37;
  vfx_script_texture_sample1d_delayInitStub(v37);
  v42 = v38;
  vfx_script_texture_sample1d_delayInitStub(v47);
  *a10 = v43;
  *a11 = v42;
  *a12 = v39;
  v40 = v44;
  LODWORD(v40) = LODWORD(v47);
  *a13 = v40;
  return *(float *)&v40;
}

uint64_t __vfx_script_confetti_particleInit_146(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float ParticleUpdate_confetti_particleUpdate_124(const void *a1, int a2, int a3, simd_quatf *a4)
{
  int8x16_t v4;
  int v6;
  uint32x2_t v7;
  uint32x2_t v8;
  float32x2_t v13;
  float32x2_t v15;
  unsigned int v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  int32x4_t v24;
  float32x4_t v25;
  float v26;
  float v27;
  int8x16_t v28;
  float v29;
  float32x4_t v30;
  float v31;
  float v32;
  float v33;
  float32x2_t v34;
  float32x2_t v35;
  float32x2_t v36;
  unsigned __int32 v37;
  float32x4_t v38;
  float32x2_t v40;
  float v41;
  float32x4_t v42;
  float v43;
  int32x2_t v44;
  float v45;
  double v46;
  float v49;
  float v50;
  int32x4_t v51;
  float result;
  int32x4_t v58;
  simd_quatf v59;
  simd_float4 x;
  float32x4_t v62;
  float v63;
  simd_float4 v64;

  v6 = 747796405 * (a3 + a2) - 1306390188;
  v7.i32[0] = v6;
  v7.i32[1] = 747796405 * v6 - 1403630843;
  v8 = (uint32x2_t)vmul_s32((int32x2_t)veor_s8((int8x8_t)vshl_u32(v7, (uint32x2_t)vsub_s32((int32x2_t)0x300000003, (int32x2_t)vshr_n_u32(v7, 0x1CuLL))), (int8x8_t)v7), vdup_n_s32(0x108EF2D9u));
  __asm { FMOV            V1.2S, #1.0 }
  v13 = (float32x2_t)vorr_s8(veor_s8((int8x8_t)vshl_u32(v8, (uint32x2_t)0xFFFFFFE1FFFFFFF7), (int8x8_t)vshl_u32(v8, (uint32x2_t)0xFFFFFFF7FFFFFFE1)), _D1);
  __asm { FMOV            V1.2S, #-1.0 }
  v15 = vadd_f32(v13, _D1);
  v16 = 277803737
      * (((747796405 * (747796405 * v6 - 1403630843) - 1403630843) >> (((747796405 * (747796405 * v6 - 1403630843) - 1403630843) >> 28)
                                                                                   + 4)) ^ (747796405
                                                                                          * (747796405 * v6 - 1403630843)
                                                                                          - 1403630843));
  *(float32x2_t *)v17.f32 = v15;
  v17.f32[2] = COERCE_FLOAT((v16 >> 31) ^ (v16 >> 9) | 0x3F800000) + -1.0;
  v17.i32[3] = 0;
  v18 = vmaxnmq_f32(v17, (float32x4_t)0);
  v18.i32[3] = 0;
  v17.i64[0] = 0x4000000040000000;
  v17.i64[1] = 0x4000000040000000;
  __asm { FMOV            V2.4S, #-1.0 }
  v30 = vmlaq_f32(_Q2, v17, vminnmq_f32(v18, (float32x4_t)xmmword_1C9322F90));
  v20 = vmulq_f32(v30, v30);
  v20.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v20, 2), vaddq_f32(v20, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 1))).u64[0];
  v21 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 0);
  v21.i32[3] = 0;
  v22 = vrsqrteq_f32(v21);
  v23 = vmulq_f32(v22, vrsqrtsq_f32(v21, vmulq_f32(v22, v22)));
  v24 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v20.f32[0] != 0.0)), 0x1FuLL));
  v24.i32[3] = 0;
  v25 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v24), (int8x16_t)vmulq_f32(v30, vmulq_f32(v23, vrsqrtsq_f32(v21, vmulq_f32(v23, v23)))), (int8x16_t)v30);
  v23.i32[0] = v25.i32[2];
  v4.i32[0] = 1.0;
  v28.i64[0] = 0x8000000080000000;
  v28.i64[1] = 0x8000000080000000;
  v26 = *(float *)vbslq_s8(v28, v4, (int8x16_t)v23).i32;
  *(float *)v28.i32 = v25.f32[1] / (float)(fabsf(v25.f32[2]) + 1.0);
  v27 = vmuls_lane_f32(*(float *)v28.i32, *(float32x2_t *)v25.f32, 1);
  *(float *)v28.i32 = -(float)(v25.f32[0] * *(float *)v28.i32);
  v29 = v25.f32[2] + (float)(v26 * v27);
  v30.f32[0] = v26 * *(float *)v28.i32;
  v31 = 1.0 - v27;
  v32 = vmuls_lane_f32(-v26, *(float32x2_t *)v25.f32, 1);
  v33 = v25.f32[2] + (float)(v29 + v31);
  v63 = v15.f32[0];
  if (v33 > 0.0)
  {
    v34 = (float32x2_t)vrev64_s32(*(int32x2_t *)v25.f32);
    *(int32x2_t *)v38.f32 = vdup_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v25.f32, *(float32x2_t *)v25.f32), 0);
    v38.i32[0] = vsub_f32((float32x2_t)__PAIR64__(v34.u32[1], LODWORD(v32)), v34).u32[0];
    v35 = (float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(sqrtf(v33 + 1.0)), v30.u32[0]);
    v36 = vmul_f32(v35, v35);
    v35.i32[0] = v28.i32[0];
    v37 = vsub_f32(*(float32x2_t *)v30.f32, v35).u32[0];
    v28.i32[1] = v36.i32[1];
    v38.i64[1] = v28.i64[0];
    *(float *)v28.i32 = 0.5 / v35.f32[1];
LABEL_12:
    v42 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.i8, 0);
    goto LABEL_13;
  }
  if (v29 < v31 || v29 < v25.f32[2])
  {
    if (v31 <= v25.f32[2])
    {
      v45 = sqrtf((float)((float)(v25.f32[2] + 1.0) - v29) - v31);
      v25.i32[0] = vsubq_f32(v25, v25).u32[0];
      v38.f32[1] = v25.f32[1] + v32;
      v38.f32[2] = v45 * v45;
      v38.f32[3] = v30.f32[0] - *(float *)v28.i32;
      *(float *)v28.i32 = 0.5 / v45;
      goto LABEL_12;
    }
    v41 = sqrtf((float)((float)(v31 + 1.0) - v29) - v25.f32[2]);
    v42.f32[0] = *(float *)v28.i32 + v30.f32[0];
    v43 = v41 * v41;
    v40 = (float32x2_t)vrev64_s32(*(int32x2_t *)v25.f32);
    v44 = (int32x2_t)vadd_f32(v40, (float32x2_t)__PAIR64__(v40.u32[1], LODWORD(v32)));
  }
  else
  {
    v41 = sqrtf((float)((float)(v29 + 1.0) - v31) - v25.f32[2]);
    v42.f32[0] = v41 * v41;
    v43 = *(float *)v28.i32 + v30.f32[0];
    v44 = (int32x2_t)vsub_f32((float32x2_t)__PAIR64__(LODWORD(v32), v25.u32[0]), *(float32x2_t *)v25.f32);
  }
  v42.f32[1] = v43;
  *(int32x2_t *)&v42.u32[2] = v44;
  *(float *)v44.i32 = 0.5 / v41;
  v38 = (float32x4_t)vdupq_lane_s32(v44, 0);
LABEL_13:
  v62 = vmulq_f32(v38, v42);
  vfx_script_clock_time_delayInitStub(*(double *)v62.i64);
  *(float *)&v46 = v46;
  x = (simd_float4)COERCE_UNSIGNED_INT((float)((float)(123.0 * v63) + (float)(*(float *)&v46 * 16.0)) * 0.5);
  v64 = _simd_cos_f4(x);
  _Q0 = (float32x4_t)_simd_sin_f4(x);
  _Q7 = v64;
  v49 = vmuls_lane_f32(v64.f32[1], (float32x4_t)v64, 2);
  v50 = vmuls_lane_f32(_Q0.f32[1], _Q0, 2);
  *(float *)v51.i32 = vmlas_n_f32(-(float)(v64.f32[0] * v50), v49, _Q0.f32[0]);
  _S4 = vmuls_lane_f32(v64.f32[0], *(float32x2_t *)_Q0.f32, 1);
  __asm { FMLA            S5, S4, V7.S[2] }
  _S4 = vmuls_lane_f32(_Q7.f32[0], *(float32x2_t *)_Q7.f32, 1);
  __asm { FMLA            S6, S4, V0.S[2] }
  result = vmlas_n_f32(v50 * _Q0.f32[0], v49, v64.f32[0]);
  v51.i32[1] = _S5;
  v51.i32[2] = _S6;
  _Q6 = (int32x4_t)v62;
  v58 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v51, v51), (int8x16_t)v51, 0xCuLL), vnegq_f32(v62)), (float32x4_t)v51, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(_Q6, _Q6), (int8x16_t)v62, 0xCuLL));
  v59 = (simd_quatf)vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v62, result), (float32x4_t)v51, v62, 3), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v58, v58), (int8x16_t)v58, 0xCuLL));
  __asm { FMLA            S2, S0, V6.S[3] }
  v59.vector.i32[3] = _S2;
  *a4 = v59;
  return result;
}

void __vfx_script_confetti_particleUpdate_124(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float ParticleUpdate_confetti_particleUpdate_25(__n128 a1, float a2, uint64_t a3, int a4, int a5, uint64_t a6, float32x4_t *a7, __int128 *a8)
{
  int8x16_t v8;
  int v13;
  uint32x2_t v14;
  uint32x2_t v15;
  float32x2_t v20;
  float32x2_t v22;
  unsigned int v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  int32x4_t v31;
  float32x4_t v32;
  float v33;
  float v34;
  int8x16_t v35;
  float v36;
  float32x4_t v37;
  float v38;
  float v39;
  float v40;
  float32x2_t v41;
  float32x2_t v42;
  float32x2_t v43;
  unsigned __int32 v44;
  float32x4_t v45;
  float32x2_t v47;
  float v48;
  float32x4_t v49;
  float v50;
  int32x2_t v51;
  float v52;
  double v53;
  float v54;
  float v57;
  float v58;
  int32x4_t v59;
  int32x4_t v65;
  float32x4_t v66;
  float v68;
  float v69;
  float result;
  __int128 v71;
  simd_float4 x;
  float32x4_t v73;
  float v74;
  simd_float4 v75;
  float32x4_t v76;
  __n128 v77;
  __int128 v78;

  v13 = 747796405 * (a5 + a4) - 1306390188;
  v14.i32[0] = v13;
  v14.i32[1] = 747796405 * v13 - 1403630843;
  v15 = (uint32x2_t)vmul_s32((int32x2_t)veor_s8((int8x8_t)vshl_u32(v14, (uint32x2_t)vsub_s32((int32x2_t)0x300000003, (int32x2_t)vshr_n_u32(v14, 0x1CuLL))), (int8x8_t)v14), vdup_n_s32(0x108EF2D9u));
  __asm { FMOV            V1.2S, #1.0 }
  v20 = (float32x2_t)vorr_s8(veor_s8((int8x8_t)vshl_u32(v15, (uint32x2_t)0xFFFFFFE1FFFFFFF7), (int8x8_t)vshl_u32(v15, (uint32x2_t)0xFFFFFFF7FFFFFFE1)), _D1);
  __asm { FMOV            V1.2S, #-1.0 }
  v22 = vadd_f32(v20, _D1);
  v23 = 277803737
      * (((747796405 * (747796405 * v13 - 1403630843) - 1403630843) >> (((747796405 * (747796405 * v13 - 1403630843) - 1403630843) >> 28)
                                                                                    + 4)) ^ (747796405
                                                                                           * (747796405 * v13
                                                                                            - 1403630843)
                                                                                           - 1403630843));
  *(float32x2_t *)v24.f32 = v22;
  v24.f32[2] = COERCE_FLOAT((v23 >> 31) ^ (v23 >> 9) | 0x3F800000) + -1.0;
  v24.i32[3] = 0;
  v25 = vmaxnmq_f32(v24, (float32x4_t)0);
  v25.i32[3] = 0;
  v24.i64[0] = 0x4000000040000000;
  v24.i64[1] = 0x4000000040000000;
  __asm { FMOV            V2.4S, #-1.0 }
  v37 = vmlaq_f32(_Q2, v24, vminnmq_f32(v25, (float32x4_t)xmmword_1C9322F90));
  v27 = vmulq_f32(v37, v37);
  v27.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v27, 2), vaddq_f32(v27, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 1))).u64[0];
  v28 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 0);
  v28.i32[3] = 0;
  v29 = vrsqrteq_f32(v28);
  v30 = vmulq_f32(v29, vrsqrtsq_f32(v28, vmulq_f32(v29, v29)));
  v31 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v27.f32[0] != 0.0)), 0x1FuLL));
  v31.i32[3] = 0;
  v32 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v31), (int8x16_t)vmulq_f32(v37, vmulq_f32(v30, vrsqrtsq_f32(v28, vmulq_f32(v30, v30)))), (int8x16_t)v37);
  v30.i32[0] = v32.i32[2];
  v8.i32[0] = 1.0;
  v35.i64[0] = 0x8000000080000000;
  v35.i64[1] = 0x8000000080000000;
  v33 = *(float *)vbslq_s8(v35, v8, (int8x16_t)v30).i32;
  *(float *)v35.i32 = v32.f32[1] / (float)(fabsf(v32.f32[2]) + 1.0);
  v34 = vmuls_lane_f32(*(float *)v35.i32, *(float32x2_t *)v32.f32, 1);
  *(float *)v35.i32 = -(float)(v32.f32[0] * *(float *)v35.i32);
  v36 = v32.f32[2] + (float)(v33 * v34);
  v37.f32[0] = v33 * *(float *)v35.i32;
  v38 = 1.0 - v34;
  v39 = vmuls_lane_f32(-v33, *(float32x2_t *)v32.f32, 1);
  v40 = v32.f32[2] + (float)(v36 + v38);
  v77 = a1;
  v78 = *a8;
  v74 = v22.f32[0];
  if (v40 > 0.0)
  {
    v41 = (float32x2_t)vrev64_s32(*(int32x2_t *)v32.f32);
    *(int32x2_t *)v45.f32 = vdup_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v32.f32, *(float32x2_t *)v32.f32), 0);
    v45.i32[0] = vsub_f32((float32x2_t)__PAIR64__(v41.u32[1], LODWORD(v39)), v41).u32[0];
    v42 = (float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(sqrtf(v40 + 1.0)), v37.u32[0]);
    v43 = vmul_f32(v42, v42);
    v42.i32[0] = v35.i32[0];
    v44 = vsub_f32(*(float32x2_t *)v37.f32, v42).u32[0];
    v35.i32[1] = v43.i32[1];
    v45.i64[1] = v35.i64[0];
    *(float *)v35.i32 = 0.5 / v42.f32[1];
LABEL_12:
    v49 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v35.i8, 0);
    goto LABEL_13;
  }
  if (v36 < v38 || v36 < v32.f32[2])
  {
    if (v38 <= v32.f32[2])
    {
      v52 = sqrtf((float)((float)(v32.f32[2] + 1.0) - v36) - v38);
      v32.i32[0] = vsubq_f32(v32, v32).u32[0];
      v45.f32[1] = v32.f32[1] + v39;
      v45.f32[2] = v52 * v52;
      v45.f32[3] = v37.f32[0] - *(float *)v35.i32;
      *(float *)v35.i32 = 0.5 / v52;
      goto LABEL_12;
    }
    v48 = sqrtf((float)((float)(v38 + 1.0) - v36) - v32.f32[2]);
    v49.f32[0] = *(float *)v35.i32 + v37.f32[0];
    v50 = v48 * v48;
    v47 = (float32x2_t)vrev64_s32(*(int32x2_t *)v32.f32);
    v51 = (int32x2_t)vadd_f32(v47, (float32x2_t)__PAIR64__(v47.u32[1], LODWORD(v39)));
  }
  else
  {
    v48 = sqrtf((float)((float)(v36 + 1.0) - v38) - v32.f32[2]);
    v49.f32[0] = v48 * v48;
    v50 = *(float *)v35.i32 + v37.f32[0];
    v51 = (int32x2_t)vsub_f32((float32x2_t)__PAIR64__(LODWORD(v39), v32.u32[0]), *(float32x2_t *)v32.f32);
  }
  v49.f32[1] = v50;
  *(int32x2_t *)&v49.u32[2] = v51;
  *(float *)v51.i32 = 0.5 / v48;
  v45 = (float32x4_t)vdupq_lane_s32(v51, 0);
LABEL_13:
  v73 = vmulq_f32(v45, v49);
  vfx_script_clock_time_delayInitStub(*(double *)v73.i64);
  *(float *)&v53 = v53;
  v54 = (float)((float)(123.0 * v74) + (float)(*(float *)&v53 * 16.0)) * 0.5;
  LODWORD(v53) = 0;
  *((float *)&v53 + 1) = v54;
  x = (simd_float4)*(unint64_t *)&v53;
  v75 = _simd_cos_f4((simd_float4)*(unint64_t *)&v53);
  _Q0 = (float32x4_t)_simd_sin_f4(x);
  _Q7 = v75;
  v57 = vmuls_lane_f32(v75.f32[1], (float32x4_t)v75, 2);
  v58 = vmuls_lane_f32(_Q0.f32[1], _Q0, 2);
  *(float *)v59.i32 = vmlas_n_f32(-(float)(v75.f32[0] * v58), v57, _Q0.f32[0]);
  _S4 = vmuls_lane_f32(v75.f32[0], *(float32x2_t *)_Q0.f32, 1);
  __asm { FMLA            S5, S4, V7.S[2] }
  _S4 = vmuls_lane_f32(_Q7.f32[0], *(float32x2_t *)_Q7.f32, 1);
  __asm { FMLA            S6, S4, V0.S[2] }
  _Q0.f32[0] = vmlas_n_f32(v58 * _Q0.f32[0], v57, v75.f32[0]);
  v59.i32[1] = _S5;
  v59.i32[2] = _S6;
  _Q6 = (int32x4_t)v73;
  v65 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v59, v59), (int8x16_t)v59, 0xCuLL), vnegq_f32(v73)), (float32x4_t)v59, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(_Q6, _Q6), (int8x16_t)v73, 0xCuLL));
  v66 = vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v73, _Q0.f32[0]), (float32x4_t)v59, v73, 3), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v65, v65), (int8x16_t)v65, 0xCuLL));
  __asm { FMLA            S1, S0, V6.S[3] }
  v66.i32[3] = _S1;
  v76 = v66;
  _Q0.i32[1] = v77.n128_i32[1];
  _Q0.f32[0] = (float)((float)(v77.n128_f32[2] + 1.0) * 0.75) + -0.25;
  vfx_script_texture_sample1d_delayInitStub(*(double *)_Q0.i64);
  v69 = fminf(fmaxf(v68, 0.0), 1.0);
  result = (float)(v69 * v69) * a2;
  *a7 = v76;
  *(_QWORD *)&v71 = __PAIR64__(LODWORD(result), v78);
  *((_QWORD *)&v71 + 1) = *((_QWORD *)&v78 + 1);
  *a8 = v71;
  return result;
}

uint64_t __vfx_script_confetti_particleUpdate_25(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

uint64_t __vfx_script_confetti_particleUpdate_196(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float Main_lighting_graph_9DD82DB1_83CC_4C95_8122_529530C0E9A5(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result;

  result = a3 * 1000.0;
  *a4 = result;
  return result;
}

float Main_lighting_graph_2A1A65D6_42D2_422D_B043_7BA6751C7A80(const void *a1, unsigned int a2, float a3, float *a4)
{
  float result;

  result = a3 * 6.0;
  *a4 = result;
  return result;
}

void sub_1C92E54A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Block_object_dispose((const void *)(v1 - 200), 8);
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

void sub_1C92E5E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1C92E6BCC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__n128 OUTLINED_FUNCTION_6_3(uint64_t a1)
{
  return *(__n128 *)a1;
}

id _PTFocusIdentifierMake(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  const __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  v2 = a2;
  v4 = a2 & 0x7FFFFFFF00000000;
  if ((a2 & 0x7FFFFFFF00000000uLL) > 0x10FFFFFFFFLL)
  {
    if ((a2 & 0x7FFFFFFF00000000uLL) > 0x12FFFFFFFFLL)
    {
      if (v4 == 0x1300000000)
      {
        v5 = CFSTR("R");
        goto LABEL_18;
      }
      if (v4 == 0xFF00000000)
      {
        v5 = CFSTR("!");
        goto LABEL_18;
      }
    }
    else
    {
      if (v4 == 0x1100000000)
      {
        v5 = CFSTR("C");
        goto LABEL_18;
      }
      if (v4 == 0x1200000000)
      {
        v5 = CFSTR("E");
        goto LABEL_18;
      }
    }
    goto LABEL_16;
  }
  if (!v4)
  {
    v5 = CFSTR("A");
    goto LABEL_18;
  }
  if (v4 != 0x100000000)
  {
    if (v4 == 0x1000000000)
    {
      v5 = CFSTR("B");
      goto LABEL_18;
    }
LABEL_16:
    v5 = CFSTR("?");
    goto LABEL_18;
  }
  v5 = CFSTR("F");
LABEL_18:
  v6 = CFSTR("_");
  if (a2 >= 0)
    v6 = &stru_1E822B200;
  v7 = v6;
  +[PTCinematographyDetection _prefixForDetectionType:](PTCinematographyDetection, "_prefixForDetectionType:", a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@-%lu"), v7, v5, v8, v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

float32x2_t PTFilterRect(int8x16_t a1, int8x16_t a2, int32x2_t a3, int32x2_t a4)
{
  float32x2_t v4;
  float32x4_t v5;
  float32x2_t v6;
  float32x4_t v7;
  float32x4_t v8;
  int8x16_t v9;

  v4 = (float32x2_t)vextq_s8(a1, a1, 8uLL).u64[0];
  *(float32x2_t *)v5.f32 = vmla_f32(*(float32x2_t *)a1.i8, (float32x2_t)0x3F0000003F000000, v4);
  *(float32x2_t *)&v5.u32[2] = v4;
  v6 = (float32x2_t)vextq_s8(a2, a2, 8uLL).u64[0];
  *(float32x2_t *)v7.f32 = vmla_f32(*(float32x2_t *)a2.i8, (float32x2_t)0x3F0000003F000000, v6);
  *(float32x2_t *)&v7.u32[2] = v6;
  *(int32x2_t *)v8.f32 = vdup_lane_s32(a3, 0);
  *(int32x2_t *)&v8.u32[2] = vdup_lane_s32(a4, 0);
  v9 = (int8x16_t)vmlaq_f32(v5, vsubq_f32(v7, v5), v8);
  return vmls_f32(*(float32x2_t *)v9.i8, (float32x2_t)0x3F0000003F000000, (float32x2_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL));
}

float32x2_t PTFilterRectDEMA(float32x4_t *a1, float32x4_t *a2, int8x16_t a3, int32x2_t a4, int32x2_t a5)
{
  float32x2_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  int8x16_t v11;

  v5 = (float32x2_t)vextq_s8(a3, a3, 8uLL).u64[0];
  *(float32x2_t *)v6.f32 = vmla_f32(*(float32x2_t *)a3.i8, (float32x2_t)0x3F0000003F000000, v5);
  *(float32x2_t *)&v6.u32[2] = v5;
  *(int32x2_t *)v7.f32 = vdup_lane_s32(a4, 0);
  *(int32x2_t *)&v7.u32[2] = vdup_lane_s32(a5, 0);
  v8 = vmlaq_f32(*a1, vsubq_f32(v6, *a1), v7);
  *a1 = v8;
  v9 = vmlaq_f32(*a2, vsubq_f32(v8, *a2), v7);
  *a2 = v9;
  v10.i64[0] = 0x4000000040000000;
  v10.i64[1] = 0x4000000040000000;
  v11 = (int8x16_t)vmlaq_f32(vnegq_f32(v9), v10, *a1);
  return vmls_f32(*(float32x2_t *)v11.i8, (float32x2_t)0x3F0000003F000000, (float32x2_t)*(_OWORD *)&vextq_s8(v11, v11, 8uLL));
}

float PTDisparityInNormalizedRectFromLockedPixelBufferInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, double a7, double a8, double a9, double a10)
{
  return PeakInNormalizedRectFromLockedPixelBufferInfo(a1, a2, a3, a4, a5, a6, 0, 0, a7, a8, a9, a10);
}

float PeakInNormalizedRectFromLockedPixelBufferInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, float *a7, void *a8, double a9, double a10, double a11, double a12)
{
  id v23;
  void *v24;
  NSObject *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  int v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  NSObject *v45;
  uint64_t v46;
  int v47;
  int *v48;
  int v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  float v54;
  float v55;
  float v56;
  float v57;
  NSObject *v59;
  const char *v60;
  NSObject *v61;
  uint32_t v62;
  NSObject *v63;
  NSObject *v64;
  _BOOL4 v65;
  uint64_t v66;
  int32x4_t v67;
  NSObject *v69;
  int32x4_t v70;
  uint8_t buf[4];
  uint64_t v72;
  __int16 v73;
  double v74;
  __int16 v75;
  double v76;
  __int16 v77;
  double v78;
  __int16 v79;
  double v80;
  __int16 v81;
  double v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  int v86;
  __int16 v87;
  _BOOL4 v88;
  __int16 v89;
  double v90;
  uint8_t v91[4];
  NSObject *v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  uint64_t v96;
  _BYTE v97[4];
  _BYTE v98[772];

  *(_QWORD *)&v98[764] = *MEMORY[0x1E0C80C00];
  v23 = a8;
  v24 = v23;
  if (v23)
  {
    v25 = v23;
    if (a6 == 1717856627)
    {
      v26 = a9;
      v27 = a10;
      v28 = a11;
      v30 = a2;
      v31 = a3;
      v29 = a12;
      v32 = a4;
      v33 = a5;
      v34 = v25;
      v35 = 0;
      goto LABEL_9;
    }
    if (a6 == 1751411059)
    {
      v26 = a9;
      v27 = a10;
      v28 = a11;
      v29 = a12;
      v30 = a2;
      v31 = a3;
      v32 = a4;
      v33 = a5;
      v34 = v25;
      v35 = 1;
LABEL_9:
      HistogramInNormalizedRectFromLockedPixelBufferInfo_Mask(v97, v30, v31, v26, v27, v28, v29, v32, v33, v34, v35);
LABEL_16:

      goto LABEL_17;
    }
    _PTLogSystem();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      NSStringFromFourCharCode(a6);
      v69 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v91 = 138412802;
      v92 = v69;
      v93 = 2048;
      v94 = a3;
      v95 = 2048;
      v96 = a4;
      _os_log_error_impl(&dword_1C9281000, v45, OS_LOG_TYPE_ERROR, "error: histogram - unexpected pixel format type '%@' (%zdx%zd) - must be DisparityFloat16 or DisparityFloat32", v91, 0x20u);

    }
LABEL_12:

    goto LABEL_16;
  }
  if (a6 == 1717856627)
  {
    v36 = a9;
    v37 = a10;
    v38 = a11;
    v40 = a2;
    v41 = a3;
    v39 = a12;
    v42 = a4;
    v43 = a5;
    v44 = 0;
  }
  else
  {
    if (a6 != 1751411059)
    {
      _PTLogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      NSStringFromFourCharCode(a6);
      v45 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v91 = 138412802;
      v92 = v45;
      v93 = 2048;
      v94 = a3;
      v95 = 2048;
      v96 = a4;
      _os_log_error_impl(&dword_1C9281000, v25, OS_LOG_TYPE_ERROR, "error: histogram - unexpected pixel format type '%@' (%zdx%zd) - must be DisparityFloat16 or DisparityFloat32", v91, 0x20u);
      goto LABEL_12;
    }
    v36 = a9;
    v37 = a10;
    v38 = a11;
    v39 = a12;
    v40 = a2;
    v41 = a3;
    v42 = a4;
    v43 = a5;
    v44 = 1;
  }
  HistogramInNormalizedRectFromLockedPixelBufferInfo_FloatSize(v97, v40, v41, v36, v37, v38, v39, v42, v43, v44);
LABEL_17:
  v46 = 0;
  v47 = 0;
  v48 = (int *)v98;
  do
  {
    v49 = *(v48 - 1);
    if (v49 < 1)
      goto LABEL_24;
    if (v46)
    {
      if (*(_DWORD *)&v97[4 * (v46 - 1)] > v49)
        goto LABEL_24;
      if (v46 == 191)
        goto LABEL_23;
    }
    if (v49 > *v48)
LABEL_23:
      *(_DWORD *)&v91[4 * v47++] = v46;
LABEL_24:
    ++v48;
    ++v46;
  }
  while (v46 != 192);
  do
  {
    v50 = v47;
    if (v47 < 3)
      break;
    v51 = 0;
    v47 = 0;
    do
    {
      if (!v51 || *(_DWORD *)&v97[4 * *(int *)&v91[v51]] <= *(_DWORD *)&v97[4 * *(int *)&v91[v51]])
      {
        if (4 * (v50 - 1) == v51)
        {
          LODWORD(v52) = *(_DWORD *)&v91[4 * (v50 - 1)];
        }
        else
        {
          v52 = *(int *)&v91[v51];
          if (*(_DWORD *)&v97[4 * v52] <= *(_DWORD *)&v97[4 * *(int *)&v91[v51 + 4]])
            goto LABEL_33;
        }
        *(_DWORD *)&v91[4 * v47++] = v52;
      }
LABEL_33:
      v51 += 4;
    }
    while (4 * v50 != v51);
  }
  while (v47 < v50);
  if (v50)
  {
    if (v50 <= 0)
      PeakInNormalizedRectFromLockedPixelBufferInfo_cold_1();
    v53 = (v50 - 1);
    v54 = (float)((float)((float)((float)*(int *)&v91[4 * v53] + 0.5) * 7.65) / 192.0) + 0.0;
    if (a7 && v50 != 1)
    {
      v55 = INFINITY;
      do
      {
        v56 = (float)((float)((float)((float)*(int *)&v91[4 * v53] + 0.5) * 7.65) / 192.0) + 0.0;
        if (v56 > 0.0)
        {
          v57 = fabsf((float)(*a7 / v56) + -1.0);
          if (v55 > v57)
          {
            v54 = (float)((float)((float)((float)*(int *)&v91[4 * v53] + 0.5) * 7.65) / 192.0) + 0.0;
            v55 = v57;
          }
        }
      }
      while (v53-- > 0);
    }
    _PTLogSystem();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134219264;
      v72 = a1;
      v73 = 2048;
      v74 = a9;
      v75 = 2048;
      v76 = a10;
      v77 = 2048;
      v78 = a11;
      v79 = 2048;
      v80 = a12;
      v81 = 2048;
      v82 = v54;
      v60 = "detection type: %ld rect: { %.3f, %.3f, %.3f, %.3f } disparity: %.3f";
      v61 = v59;
      v62 = 62;
      goto LABEL_57;
    }
    goto LABEL_58;
  }
  _PTLogSystem();
  v63 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9281000, v63, OS_LOG_TYPE_INFO, "Failed to find peaks in disparity buffer, using prior or default disparity value", buf, 2u);
  }

  if (a7)
    v54 = *a7;
  else
    v54 = 3.8449;
  _PTLogSystem();
  v64 = objc_claimAutoreleasedReturnValue();
  v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG);

  if (v65)
  {
    v66 = 0;
    v67 = 0uLL;
    do
    {
      v67 = vaddq_s32(*(int32x4_t *)&v97[v66], v67);
      v66 += 16;
    }
    while (v66 != 768);
    v70 = v67;
    _PTLogSystem();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134220288;
      v72 = a1;
      v73 = 2048;
      v74 = a9;
      v75 = 2048;
      v76 = a10;
      v77 = 2048;
      v78 = a11;
      v79 = 2048;
      v80 = a12;
      v81 = 2048;
      v82 = *(double *)&a3;
      v83 = 2048;
      v84 = a4;
      v85 = 1024;
      v86 = vaddvq_s32(v70);
      v87 = 1024;
      v88 = a7 != 0;
      v89 = 2048;
      v90 = v54;
      v60 = "detection type: %ld rect: { %.3f, %.3f, %.3f, %.3f } buffer size: (%zu,%zu) hist samples:%u prior:%u dispari"
            "ty: unknown (returning %.3f)";
      v61 = v59;
      v62 = 94;
LABEL_57:
      _os_log_debug_impl(&dword_1C9281000, v61, OS_LOG_TYPE_DEBUG, v60, buf, v62);
    }
LABEL_58:

  }
  return v54;
}

float PTDisparityInNormalizedRectFromPixelBuffer(uint64_t a1, __CVBuffer *a2, double a3, double a4, double a5, double a6)
{
  return PTDisparityInNormalizedRectFromPixelBufferWithPrior(a1, a2, 0, a3, a4, a5, a6);
}

float PTDisparityInNormalizedRectFromPixelBufferWithPrior(uint64_t a1, CVPixelBufferRef pixelBuffer, float *a3, double a4, double a5, double a6, double a7)
{
  void *BaseAddress;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  OSType PixelFormatType;

  CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
  BaseAddress = CVPixelBufferGetBaseAddress(pixelBuffer);
  Width = CVPixelBufferGetWidth(pixelBuffer);
  Height = CVPixelBufferGetHeight(pixelBuffer);
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  LODWORD(a7) = PeakInNormalizedRectFromLockedPixelBufferInfo(a1, (uint64_t)BaseAddress, Width, Height, BytesPerRow, PixelFormatType, a3, 0, a4, a5, a6, a7);
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  return *(float *)&a7;
}

float PTDisparityInNormalizedRectFromLockedPixelBufferInfoWithPrior(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, float *a7, double a8, double a9, double a10, double a11)
{
  return PeakInNormalizedRectFromLockedPixelBufferInfo(a1, a2, a3, a4, a5, a6, a7, 0, a8, a9, a10, a11);
}

float _PTDisparityInNormalizedRectFromPixelBufferWithMask(uint64_t a1, __CVBuffer *a2, float *a3, void *a4, double a5, double a6, double a7, double a8)
{
  id v15;
  void *BaseAddress;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  OSType PixelFormatType;

  v15 = a4;
  CVPixelBufferLockBaseAddress(a2, 1uLL);
  BaseAddress = CVPixelBufferGetBaseAddress(a2);
  Width = CVPixelBufferGetWidth(a2);
  Height = CVPixelBufferGetHeight(a2);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a2);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a2);
  LODWORD(a8) = PeakInNormalizedRectFromLockedPixelBufferInfo(a1, (uint64_t)BaseAddress, Width, Height, BytesPerRow, PixelFormatType, a3, v15, a5, a6, a7, a8);

  CVPixelBufferUnlockBaseAddress(a2, 1uLL);
  return *(float *)&a8;
}

void HistogramInNormalizedRectFromLockedPixelBufferInfo_Mask(void *a1, uint64_t a2, unint64_t a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, void *a10, int a11)
{
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  id v34;

  v34 = a10;
  objc_msgSend(v34, "setPlacement:", _PTDenormalizeRect(a4, a5, a6, a7, (double)a3));
  bzero(a1, 0x300uLL);
  objc_msgSend(v34, "scanlineIter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "nextRangeY");
  if (v22)
  {
    v23 = v21;
    do
    {
      v24 = v23 + v22;
      if (v23 < v23 + v22)
      {
        v25 = a2 + a9 * v23;
        do
        {
          objc_msgSend(v20, "resetX");
          while (1)
          {
            v26 = objc_msgSend(v20, "nextRangeX");
            if (!v27)
              break;
            if (v26 < v26 + v27)
            {
              do
              {
                if (a11)
                {
                  _H0 = *(_WORD *)(v25 + 2 * v26);
                  __asm { FCVT            S0, H0 }
                }
                else
                {
                  _S0 = *(float *)(v25 + 4 * v26);
                }
                if (_S0 >= 0.0 && _S0 < 7.65)
                  ++*((_DWORD *)a1 + (int)(float)((float)(_S0 * 192.0) / 7.65));
                ++v26;
                --v27;
              }
              while (v27);
            }
          }
          ++v23;
          v25 += a9;
        }
        while (v23 != v24);
      }
      v23 = objc_msgSend(v20, "nextRangeY");
    }
    while (v22);
  }

}

double _PTDenormalizeRect(double a1, double a2, double a3, double a4, double a5)
{
  double result;

  result = floor(a1 * a5 + 0.5);
  if (result >= a5 + -2.0)
    result = a5 + -2.0;
  if (result < 0.0)
    return 0.0;
  return result;
}

void HistogramInNormalizedRectFromLockedPixelBufferInfo_FloatSize(void *a1, uint64_t a2, unint64_t a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, int a10)
{
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  double v19;
  float v20;
  float v21;
  float v22;
  unint64_t v23;
  float v24;
  unint64_t v25;
  float v26;
  float v27;
  uint64_t v28;
  float v29;
  float v30;
  float v31;
  float v32;
  unint64_t v33;
  float v34;
  unint64_t v35;

  v14 = _PTDenormalizeRect(a4, a5, a6, a7, (double)a3);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  if (PTDepthInRectSensitivity_onceToken != -1)
    dispatch_once(&PTDepthInRectSensitivity_onceToken, &__block_literal_global_9);
  v21 = *(float *)&PTDepthInRectSensitivity_sDepthInRectSensitivity;
  v22 = *(float *)&PTDepthInRectSensitivity_sDepthInRectSensitivity * v20;
  if ((float)(*(float *)&PTDepthInRectSensitivity_sDepthInRectSensitivity * v20) < 3.0)
    v22 = 3.0;
  v23 = (unint64_t)(float)(fmaxf((float)(v20 - v22) * 0.5, 0.0) + v18);
  v24 = (float)(v22 + v20) * 0.5;
  if (v24 > v20)
    v24 = v20;
  v25 = (unint64_t)(float)(v24 + v18);
  bzero(a1, 0x300uLL);
  if (v23 < v25)
  {
    v26 = v14;
    v27 = v16;
    v28 = a2 + v23 * a9;
    do
    {
      v29 = (float)((float)((float)((float)v23 - v18) + (float)((float)v23 - v18)) / v20) + -1.0;
      v30 = (float)(v21 * v21) - (float)(v29 * v29);
      v31 = sqrtf(v30) * v27;
      if (v30 <= 0.0)
        v32 = 0.0;
      else
        v32 = v31;
      if (v32 < 3.0)
        v32 = 3.0;
      v33 = (unint64_t)(float)(fmaxf((float)(v27 - v32) * 0.5, 0.0) + v26);
      v34 = (float)(v32 + v27) * 0.5;
      if (v34 > v27)
        v34 = v16;
      v35 = (unint64_t)(float)(v34 + v26);
      if (v33 < v35)
      {
        do
        {
          if (a10)
          {
            _H5 = *(_WORD *)(v28 + 2 * v33);
            __asm { FCVT            S5, H5 }
          }
          else
          {
            _S5 = *(float *)(v28 + 4 * v33);
          }
          if (_S5 >= 0.0 && _S5 < 7.65)
            ++*((_DWORD *)a1 + (int)(float)((float)(_S5 * 192.0) / 7.65));
          ++v33;
        }
        while (v35 != v33);
      }
      ++v23;
      v28 += a9;
    }
    while (v23 != v25);
  }
}

void sub_1C92F2DE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  id *v30;

  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double CGRectFromRectDictionary(void *a1)
{
  id v1;
  void *v2;
  float v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("X"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("Y"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("Width"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("Height"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "floatValue");
  return v4;
}

void Main_thumbsup_graph_38F35C26_FEA0_47AB_B998_9FF24156FD6D(const void *a1, unsigned int a2, int a3, unsigned int *a4)
{
  *a4 = a3 & ~(a3 >> 31);
}

__n128 Init_thumbsup_graph_5BEF5B4C_59E5_4DBA_86B0_DB00779F419D(uint64_t a1, uint64_t a2, int32x4_t *a3, __n128 *a4)
{
  __n128 result;

  result = *a4;
  *a3 = vdupq_n_s32(0x3CA3D70Au);
  __asm { FMOV            V1.4S, #-1.0 }
  _Q1.n128_u32[0] = result.n128_u32[0];
  _Q1.n128_u32[2] = result.n128_u32[2];
  *a4 = _Q1;
  return result;
}

double Render_thumbsup_graph_891A5752_872E_4295_B8CA_3104EA0A6053(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  double result;

  result = 1.37667655e-16;
  *a3 = xmmword_1C9343860;
  return result;
}

void Main_thumbsup_graph_A591C9B7_84C4_4BEA_8829_4366B5881232(const void *a1, unsigned int a2, int a3, int a4, float *a5, float *a6)
{
  float v6;
  float v7;

  v6 = -1.0;
  if (a3)
    v7 = 1.0;
  else
    v7 = -1.0;
  if (a4)
    v6 = 1.0;
  *a5 = v7;
  *a6 = v6;
}

uint64_t __vfx_script_thumbsup_graph_8D318DBD_EF7B_44D4_B5E6_F743F93F2B64(double a1)
{
  uint64_t result;

  result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  **(_DWORD **)(result + 16) = 0;
  return result;
}

uint64_t __vfx_script_thumbsup_graph_8EC5E521_8C63_47F8_B96D_2B0B5A296B7A(double a1)
{
  uint64_t result;

  result = vfx_script_get_arguments_buffer_delayInitStub(a1);
  **(_DWORD **)(result + 16) = 0;
  return result;
}

__n128 Main_thumbsup_graph_451D2F34_D7DE_4C4D_9A5C_B1A778F1CA1C(__n128 a1, uint64_t a2, uint64_t a3, int a4, int a5, __n128 *a6, int *a7)
{
  __n128 result;

  a1.n128_u32[0] = 1036831949;
  if (a4)
    a1.n128_f32[0] = -0.1;
  *a7 = a5 & ~(a5 >> 31);
  a1.n128_u32[1] = 1025758986;
  a1.n128_u32[2] = -0.5;
  *a6 = a1;
  result.n128_u64[0] = a1.n128_u64[0];
  result.n128_u32[2] = a1.n128_u32[2];
  return result;
}

void Init_thumbsup_graph_E58E02C9_8189_4980_ABED_6DF4C8EF7375(uint64_t a1, uint64_t a2, int a3, int32x2_t *a4, __int128 *a5)
{
  __int128 v5;
  float v6;
  __int128 v7;

  v5 = *a5;
  v6 = -1.0;
  if (a3)
    v6 = 1.0;
  *a4 = vdup_n_s32(0x3BB0F27Cu);
  v7 = v5;
  *((float *)&v7 + 1) = v6;
  DWORD2(v7) = DWORD2(v5);
  *a5 = v7;
}

float32x4_t ParticleInit_thumbsup_particleInit_148(__n128 a1, double a2, float32x4_t a3, double a4, float32x4_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, __int128 *a10, __n128 *a11, _DWORD *a12, __n128 *a13, float32x4_t *a14)
{
  __int128 v14;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t result;

  v14 = *a10;
  a3.i32[0] = -1127428915;
  if (a8)
    a3.f32[0] = 0.025;
  a5.i32[0] = 1018658868;
  if (!a8)
    a5.f32[0] = -0.0224;
  if (a9 != 270 && a9 != 90)
    a3.f32[0] = -0.0;
  a3.f32[0] = a1.n128_f32[0] + a3.f32[0];
  a3.i32[1] = a1.n128_i32[1];
  a3.i32[2] = a1.n128_i32[2];
  a5.i32[1] = -1128824780;
  a5.i32[2] = 0;
  result = vaddq_f32(a5, a3);
  v16 = vaddq_f32(a5, result);
  v17.i64[0] = 0x3F0000003F000000;
  v17.i64[1] = 0x3F0000003F000000;
  v18 = vmlaq_f32(v16, v17, vsubq_f32(result, v16));
  *a11 = (__n128)result;
  *a12 = 978433815;
  result.i32[3] = 1.0;
  *a13 = (__n128)result;
  v18.i32[3] = 1.0;
  *a14 = v18;
  HIDWORD(v14) = 978433815;
  *a10 = v14;
  return result;
}

float __vfx_script_thumbsup_particleInit_148(double a1)
{
  double v1;
  float result;

  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
  return result;
}

float32x4_t ParticleInit_thumbsup_particleInit_113(__n128 a1, double a2, float32x4_t a3, double a4, float32x4_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, __int128 *a10, __n128 *a11, _DWORD *a12, __n128 *a13, float32x4_t *a14)
{
  __int128 v14;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t result;

  v14 = *a10;
  a3.i32[0] = -1127428915;
  if (a8)
    a3.f32[0] = 0.025;
  a5.i32[0] = 1024470496;
  if (!a8)
    a5.f32[0] = -0.0352;
  if (a9 != 270 && a9 != 90)
    a3.f32[0] = -0.0;
  a3.f32[0] = a1.n128_f32[0] + a3.f32[0];
  a3.i32[1] = a1.n128_i32[1];
  a3.i32[2] = a1.n128_i32[2];
  a5.i32[1] = -1123013152;
  a5.i32[2] = 0;
  result = vaddq_f32(a5, a3);
  v16 = vaddq_f32(a5, result);
  v17.i64[0] = 0x3F0000003F000000;
  v17.i64[1] = 0x3F0000003F000000;
  v18 = vmlaq_f32(v16, v17, vsubq_f32(result, v16));
  *a11 = (__n128)result;
  *a12 = 983386449;
  result.i32[3] = 1.0;
  *a13 = (__n128)result;
  v18.i32[3] = 1.0;
  *a14 = v18;
  HIDWORD(v14) = 983386449;
  *a10 = v14;
  return result;
}

float __vfx_script_thumbsup_particleInit_113(double a1)
{
  double v1;
  float result;

  vfx_script_get_iteration_range_delayInitStub(a1);
  vfx_script_get_arguments_buffer_delayInitStub(v1);
  return result;
}

__n128 ParticleInit_thumbsup_particleInit_75(__n128 a1, uint64_t a2, int a3, unsigned int a4, int a5, unsigned int a6, uint64_t a7, __n128 *a8, __n128 *a9, __n128 *a10)
{
  unsigned int inited;
  unsigned int v18;
  double v19;
  int8x8_t v20;
  uint32x2_t v21;
  float32x2_t v26;
  float32x2_t v28;
  float32x4_t v29;
  int v30;
  unsigned int v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  int8x16_t v37;
  int32x4_t v38;
  int8x16_t v39;
  int v40;
  unsigned int v41;
  __n128 result;
  float v43;
  __n128 v45;
  float32x4_t v46;
  float32x4_t v47;

  inited = vfx_script_clock_simulation_index_delayInitStub(a1.n128_f64[0]);
  v18 = a5 + a3;
  v20 = (int8x8_t)vmla_s32((int32x2_t)0x690EF5340FEA05CALL, vadd_s32(vdup_n_s32(v18), (int32x2_t)__PAIR64__(vfx_script_clock_simulation_index_delayInitStub(v19), inited)), vdup_n_s32(0x2C9277B5u));
  v21 = (uint32x2_t)vmul_s32((int32x2_t)veor_s8((int8x8_t)vshl_u32((uint32x2_t)v20, (uint32x2_t)vsub_s32((int32x2_t)0x300000003, (int32x2_t)vshr_n_u32((uint32x2_t)v20, 0x1CuLL))), v20), vdup_n_s32(0x108EF2D9u));
  __asm { FMOV            V1.2S, #1.0 }
  v26 = (float32x2_t)vorr_s8(veor_s8((int8x8_t)vshl_u32(v21, (uint32x2_t)0xFFFFFFE1FFFFFFF7), (int8x8_t)vshl_u32(v21, (uint32x2_t)0xFFFFFFF7FFFFFFE1)), _D1);
  __asm { FMOV            V1.2S, #-1.0 }
  v28 = vmla_f32((float32x2_t)0x3F800000C0400000, (float32x2_t)1080033280, vadd_f32(v26, _D1));
  *(int8x8_t *)v29.f32 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32((int32x2_t)__PAIR64__(a6, a4), 0x1FuLL)), (int8x8_t)v28, (int8x8_t)vneg_f32(v28));
  v46 = v29;
  v30 = vfx_script_clock_simulation_index_delayInitStub(*(double *)v29.i64);
  v31 = 277803737
      * (((747796405 * (v18 + v30) - 1036786530) >> (((747796405 * (v18 + v30) - 1036786530) >> 28) + 4)) ^ (747796405 * (v18 + v30) - 1036786530));
  v32 = v46;
  v32.f32[2] = (float)((float)(COERCE_FLOAT((v31 >> 31) ^ (v31 >> 9) | 0x3F800000) + -1.0) * 6.0) + -3.0;
  v33 = vmulq_f32(v32, v32);
  v33.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v33, 2), vaddq_f32(v33, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v33.f32, 1))).u64[0];
  v34 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v33.f32, 0);
  v34.i32[3] = 0;
  v35 = vrsqrteq_f32(v34);
  v36 = vmulq_f32(v35, vrsqrtsq_f32(v34, vmulq_f32(v35, v35)));
  v37 = (int8x16_t)vmulq_f32(vmulq_f32(v36, vrsqrtsq_f32(v34, vmulq_f32(v36, v36))), v32);
  v38 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v33.f32[0] != 0.0)), 0x1FuLL));
  v39 = (int8x16_t)v46;
  *(float *)&v39.i32[2] = (float)((float)(COERCE_FLOAT((v31 >> 31) ^ (v31 >> 9) | 0x3F800000) + -1.0) * 6.0) + -3.0;
  v38.i32[3] = 0;
  v47 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v38), v37, v39);
  v40 = vfx_script_clock_simulation_index_delayInitStub(*(double *)v47.i64);
  v41 = 277803737
      * (((747796405 * (v18 + v40) - 116627122) >> (((747796405 * (v18 + v40) - 116627122) >> 28) + 4)) ^ (747796405 * (v18 + v40) - 116627122));
  result = (__n128)vmulq_n_f32(v47, (float)((float)(COERCE_FLOAT((v41 >> 31) ^ (v41 >> 9) | 0x3F800000) + -1.0) * 0.0) + 0.1);
  v43 = -0.025;
  if (a4)
    v43 = 0.025;
  if (a7 != 270 && a7 != 90)
    v43 = -0.0;
  v45 = a1;
  v45.n128_f32[0] = a1.n128_f32[0] + v43;
  result.n128_u32[3] = 1.0;
  *a8 = result;
  *a9 = v45;
  *a10 = v45;
  return result;
}

uint64_t __vfx_script_thumbsup_particleInit_75(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float ParticleUpdate_thumbsup_particleUpdate_4(float32x4_t a1, float32x4_t a2, float a3, float a4, float a5, float32x4_t a6, float a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, float32x4_t *a13, float *a14)
{
  float v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float v23;
  float v24;
  double v25;
  float v26;
  float result;
  float32x4_t v30;

  v19 = fminf(fmaxf(a3, 0.0), 1.0) * 3.14159265 * 0.5;
  v20 = vmlaq_n_f32(a1, vsubq_f32(a2, a1), sinf(v19));
  v21 = vaddq_f32(v20, (float32x4_t)xmmword_1C9343870);
  v22 = vsubq_f32(v20, v21);
  v30 = vmlaq_n_f32(v21, v22, a4);
  v22.f32[0] = fminf(fmaxf((float)(a3 - a5) / (float)(1.0 - a5), 0.0), 1.0);
  vfx_script_texture_sample1d_delayInitStub(*(double *)v22.i64);
  v24 = vmuls_lane_f32(6.0, a6, 3) * v23;
  *(float *)&v25 = fminf(fmaxf((float)(a7 + -3.7) / 0.5, 0.0), 1.0);
  vfx_script_texture_sample1d_delayInitStub(v25);
  result = v24 * v26;
  *a13 = v30;
  *a14 = result;
  return result;
}

uint64_t __vfx_script_thumbsup_particleUpdate_4(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

float ParticleUpdate_thumbsup_particleUpdate_143(float32x4_t a1, float32x4_t a2, float a3, float a4, float32x4_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, float32x4_t *a10, float *a11)
{
  float v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float v18;
  float v19;
  double v20;
  float v21;
  float result;
  float32x4_t v25;

  v14 = fminf(fmaxf(a3, 0.0), 1.0) * 3.14159265 * 0.5;
  v15 = vmlaq_n_f32(a1, vsubq_f32(a2, a1), sinf(v14));
  v16 = vaddq_f32(v15, (float32x4_t)xmmword_1C9343870);
  v17 = vsubq_f32(v15, v16);
  v25 = vmlaq_n_f32(v16, v17, a4);
  v17.f32[0] = fminf(fmaxf(a3 / 0.8, 0.0), 1.0);
  vfx_script_texture_sample1d_delayInitStub(*(double *)v17.i64);
  v19 = vmuls_lane_f32(3.0, a5, 3) * v18;
  *(float *)&v20 = fminf(fmaxf((float)(a3 + -3.5) + (float)(a3 + -3.5), 0.0), 1.0);
  vfx_script_texture_sample1d_delayInitStub(v20);
  result = v19 * v21;
  *a10 = v25;
  *a11 = result;
  return result;
}

uint64_t __vfx_script_thumbsup_particleUpdate_143(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

__n128 ParticleUpdate_thumbsup_particleUpdate_52(float a1, float32x4_t a2, float a3, float a4, float a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, float32x4_t *a16, float *a17, __n128 *a18)
{
  __n128 v22;
  float v23;
  float v24;
  double v25;
  unint64_t v26;
  int v27;
  double v28;
  float32x4_t v29;
  float32x4_t v30;
  float v31;
  float v32;
  double v33;
  int32x4_t v34;
  unsigned int v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float v39;
  int32x4_t v40;
  __n128 result;
  float v42;
  float v43;
  __int32 v44;
  float32x4_t v45;
  float v46;
  int8x16_t v47;
  float v48;
  float32x4_t v49;
  int32x4_t v51;
  float32x4_t v53;
  __n128 v54;

  v22 = *a18;
  v54 = *a18;
  v22.n128_f32[0] = fminf(fmaxf(a1 * 0.5, 0.0), 1.0);
  vfx_script_texture_sample1d_delayInitStub(v22.n128_f64[0]);
  v48 = v23;
  v24 = fminf(fmaxf((float)(a4 - a3) / (float)(1.0 - a3), 0.0), 1.0);
  *(float *)&v25 = v24;
  vfx_script_texture_sample1d_delayInitStub(v25);
  LODWORD(v26) = 0;
  HIDWORD(v26) = v27;
  v47 = (int8x16_t)v26;
  v46 = cosf((float)(v48 + v48) * 10.0);
  v43 = sinf((float)((float)(v48 + v48) * 10.0) + 0.3);
  *(float *)&v28 = v24;
  vfx_script_texture_sample1d_delayInitStub(v28);
  v49 = v29;
  v29.f32[0] = fminf(fmaxf((float)(a4 + -4.0) + (float)(a4 + -4.0), 0.0), 1.0);
  vfx_script_texture_sample1d_delayInitStub(*(double *)v29.i64);
  v45 = v30;
  v31 = fminf(fmaxf((float)(a1 + -0.02) / 0.2, 0.0), 1.0);
  v30.f32[0] = v31;
  vfx_script_texture_sample1d_delayInitStub(*(double *)v30.i64);
  v42 = v32;
  *(float *)&v33 = v31;
  vfx_script_texture_sample1d_delayInitStub(v33);
  if (a10)
    v35 = -1;
  else
    v35 = 0;
  v36.i32[3] = v44;
  *(float32x2_t *)v36.f32 = vmul_f32(vmul_f32((float32x2_t)__PAIR64__(LODWORD(v43), LODWORD(v46)), (float32x2_t)vdup_n_s32(0x3C23D70Au)), (float32x2_t)vdup_n_s32(0x3E4CCCCDu));
  v36.i32[2] = 0;
  v37 = vaddq_f32(vsubq_f32(a2, (float32x4_t)vbslq_s8((int8x16_t)vdupq_n_s32(v35), (int8x16_t)0, v47)), v36);
  v38 = vaddq_f32(v37, (float32x4_t)xmmword_1C9343870);
  v53 = vmlaq_n_f32(v38, vsubq_f32(v37, v38), a5);
  v39 = 0.015 * vmulq_f32(v49, v45).f32[0];
  if (a10)
    *(float *)v34.i32 = v42;
  v51 = v34;
  *(float *)v34.i32 = v31;
  vfx_script_texture_sample1d_delayInitStub(*(double *)v34.i64);
  *a16 = v53;
  *a17 = v39;
  result.n128_u64[0] = vzip1q_s32(v51, v40).u64[0];
  result.n128_u64[1] = v54.n128_u64[1];
  *a18 = result;
  return result;
}

uint64_t __vfx_script_thumbsup_particleUpdate_52(double a1)
{
  double v1;

  vfx_script_get_iteration_range_delayInitStub(a1);
  return vfx_script_get_arguments_buffer_delayInitStub(v1);
}

void sub_1C92F9A4C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 208));
  _Unwind_Resume(a1);
}

double OUTLINED_FUNCTION_9_1(float a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_11_1(void *a1, const char *a2)
{
  return objc_msgSend(a1, "floatValue");
}

void ptKTraceInitialize()
{
  NSObject *v0;
  uint8_t v1[16];

  if (kdebug_is_enabled())
  {
    _PTLogSystem();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_1C9281000, v0, OS_LOG_TYPE_INFO, "Tracing enabled", v1, 2u);
    }

  }
}

unint64_t PTVersionGetMajor(unint64_t a1)
{
  return a1 >> 20;
}

uint64_t PTVersionGetMinor(unsigned int a1)
{
  return (a1 >> 10) & 0x3FF;
}

uint64_t PTVersionGetRevision(__int16 a1)
{
  return a1 & 0x3FF;
}

uint64_t PTVersionMake(int a1, __int16 a2, __int16 a3)
{
  return (a1 << 20) | ((a2 & 0x3FF) << 10) | a3 & 0x3FF;
}

id PTVersionToString(uint64_t a1, uint64_t a2, void *a3)
{
  return PTVersionToStringWithComponents(a1, 2, a3);
}

id PTVersionToStringWithComponents(uint64_t a1, uint64_t a2, id a3)
{
  uint64_t v4;
  uint64_t v5;

  switch(a2)
  {
    case 2:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld.%d.%d"), (int)(a1 >> 20), (a1 >> 10) & 0x3FF, a1 & 0x3FF);
      goto LABEL_7;
    case 1:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld.%d"), (int)(a1 >> 20), (a1 >> 10) & 0x3FF, v5);
      goto LABEL_7;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), (int)(a1 >> 20), v4, v5);
LABEL_7:
      a3 = (id)objc_claimAutoreleasedReturnValue();
      break;
  }
  return a3;
}

id PTVersionStringWithComponents(void *a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  v3 = PTVersionFromString(a1);
  return PTVersionToStringWithComponents(v3, a2, v4);
}

uint64_t PTVersionFromString(void *a1)
{
  void *v1;
  uint64_t v2;
  __int16 v3;
  __int16 v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;

  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count");
  v3 = 0;
  if (v2 == 1)
  {
    v4 = 0;
    goto LABEL_7;
  }
  if (v2 == 2)
  {
LABEL_5:
    v4 = v3;
    objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v8, "integerValue");

LABEL_7:
    objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    v5 = v10 << 20;
    goto LABEL_8;
  }
  v4 = 0;
  v5 = 0;
  if (v2 == 3)
  {
    objc_msgSend(v1, "objectAtIndexedSubscript:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    v3 = v7;
    goto LABEL_5;
  }
LABEL_8:
  v11 = ((v3 & 0x3FF) << 10) | v5 | v4 & 0x3FF;

  return v11;
}

uint64_t OUTLINED_FUNCTION_8_1(void *a1, const char *a2)
{
  return objc_msgSend(a1, "UTF8String");
}

id OUTLINED_FUNCTION_9_2(id a1)
{
  return objc_retainAutorelease(a1);
}

void SetEspressoArray_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  OUTLINED_FUNCTION_11();
  _os_log_error_impl(&dword_1C9281000, a3, OS_LOG_TYPE_ERROR, "espresso array count %@ ≠ buffer count %@", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_10();
}

void _DebugLogEspressoBufferRow_cold_1(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a2;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_13(&dword_1C9281000, v2, (uint64_t)v2, "%zu: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void _DebugLogEspressoBufferRow_cold_2()
{
  __assert_rtn("_DebugLogEspressoBufferRow", "PTCinematographyNetwork.m", 800, "index < bp->height");
}

void __loadTracksWithMediaType_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, v0, v1, "Error loadTracksWithMediaType %@", v2);
  OUTLINED_FUNCTION_1();
}

void __loadMetadataForFormat_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1C9281000, v1, OS_LOG_TYPE_ERROR, "Error loadMetadataForFormat %@ format %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void PTParameterPairSerialization_GetParameter_cold_1(unsigned __int16 a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1C9281000, a2, OS_LOG_TYPE_ERROR, "Couldn't find parameter %d in parameter pair list.", (uint8_t *)v2, 8u);
}

void PTParameterPairSerialization_GetParameter_cold_2(int a1, int a2, os_log_t log)
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
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "Failed to get parameter %d of type %d. Unknown type.", (uint8_t *)v3, 0xEu);
}

void isExpectedSize_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a2, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

uint64_t __getVCPHandGestureImageRequestClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getVCPHandGestureVideoRequestClass_block_invoke_cold_1();
}

uint64_t __getVCPHandGestureVideoRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getVCPHandObjectClass_block_invoke_cold_1(v0);
}

uint64_t __getVCPHandObjectClass_block_invoke_cold_1()
{
  abort_report_np();
  return getVCPRequestFrameWidthPropertyKey_cold_1();
}

uint64_t getVCPRequestFrameWidthPropertyKey_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return +[PTSerialization registerSerializationClass:].cold.1(v0);
}

void FigCFDictionaryGetInt32IfPresent_cold_1()
{
  __assert_rtn("figCFDictionaryGetNumberIfPresent", "PTMSRResize.m", 63, "key != NULL");
}

void FigCFDictionaryGetInt32IfPresent_cold_2()
{
  __assert_rtn("figCFDictionaryGetNumberIfPresent", "PTMSRResize.m", 64, "valuePtr != NULL");
}

void filter_coefficients_cold_1()
{
  __assert_rtn("to_fixed", "PTMSRResize.m", 100, "intsz + decsz <= (int)(sizeof( ret) * 8)");
}

void _ErrorForDataBufferNotFoundAtURL_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = CFSTR("data buffer not found at url");
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_0_8(&dword_1C9281000, a2, a3, "%@: %@", (uint8_t *)&v3);
}

void PeakInNormalizedRectFromLockedPixelBufferInfo_cold_1()
{
  __assert_rtn("PeakInNormalizedRectFromLockedPixelBufferInfo", "PTDisparitySampler.m", 273, "numPeaks > 0");
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
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

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x1E0C9BDC0](space);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE60](plist);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BEC8](space);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1E0C9BED0](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BED8](space);
}

BOOL CGColorSpaceIsHLGBased(CGColorSpaceRef s)
{
  return MEMORY[0x1E0C9BF08](s);
}

BOOL CGColorSpaceIsPQBased(CGColorSpaceRef s)
{
  return MEMORY[0x1E0C9BF18](s);
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x1E0C9BF28](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

BOOL CGColorSpaceUsesExtendedRange(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BF48](space);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
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

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1E0C9D620](dict, rect);
}

CFDictionaryRef CMFormatDescriptionGetExtensions(CMFormatDescriptionRef desc)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9EDD0](desc);
}

CFArrayRef CMMetadataFormatDescriptionGetIdentifiers(CMMetadataFormatDescriptionRef desc)
{
  return (CFArrayRef)MEMORY[0x1E0C9EE98](desc);
}

void CMRemoveAttachment(CMAttachmentBearerRef target, CFStringRef key)
{
  MEMORY[0x1E0C9EF18](target, key);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1E0C9EFD8](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1E0C9F008](retstr, sbuf);
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
  MEMORY[0x1E0C9F0C8](target, key, value, *(_QWORD *)&attachmentMode);
}

CMTime *__cdecl CMTimeAbsoluteValue(CMTime *__return_ptr retstr, CMTime *time)
{
  return (CMTime *)MEMORY[0x1E0C9F290](retstr, time);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F298](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1E0C9F2D8](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1E0C9F2E0](retstr, time, *(_QWORD *)&newTimescale, *(_QWORD *)&method);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9F2F0](time, allocator);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return (CFStringRef)MEMORY[0x1E0C9F2F8](allocator, time);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1E0C9F318](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1E0C9F320](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMaximum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1E0C9F370](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMinimum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1E0C9F378](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMultiply(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier)
{
  return (CMTime *)MEMORY[0x1E0C9F380](retstr, time, *(_QWORD *)&multiplier);
}

CMTime *__cdecl CMTimeMultiplyByRatio(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier, int32_t divisor)
{
  return (CMTime *)MEMORY[0x1E0C9F390](retstr, time, *(_QWORD *)&multiplier, *(_QWORD *)&divisor);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x1E0C9F3A0](range, time);
}

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return (CFStringRef)MEMORY[0x1E0C9F3B8](allocator, range);
}

Boolean CMTimeRangeEqual(CMTimeRange *range1, CMTimeRange *range2)
{
  return MEMORY[0x1E0C9F3C0](range1, range2);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3C8](retstr, start, end);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1E0C9F3D0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3E8](retstr, start, duration);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F400](retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCreate(CFAllocatorRef allocator, CMVideoCodecType codecType, int32_t width, int32_t height, CFDictionaryRef extensions, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9F520](allocator, *(_QWORD *)&codecType, *(_QWORD *)&width, *(_QWORD *)&height, extensions, formatDescriptionOut);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1E0C9F558](videoDesc);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x1E0CA8900](buffer, key, attachmentMode);
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
  MEMORY[0x1E0CA8928](sourceBuffer, destinationBuffer);
}

void CVBufferRemoveAllAttachments(CVBufferRef buffer)
{
  MEMORY[0x1E0CA8938](buffer);
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x1E0CA8A30](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x1E0CA8A38](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x1E0CA8A50](image);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8A98](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8AC0](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

uint64_t CVPixelBufferGetAttributes()
{
  return MEMORY[0x1E0CA8AD8]();
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1E0CA8AE0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8AF8](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B20](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B28](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1E0CA8B30](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B38](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B50](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B58](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1E0CA8B70](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x1E0CA8BF0](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1E0CA8BF8](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1E0CA8C00](pixelBuffer, unlockFlags);
}

uint64_t CVPixelFormatDescriptionGetDescriptionWithPixelFormatType()
{
  return MEMORY[0x1E0CA8C10]();
}

uint64_t FTGetChipIdentifier()
{
  return MEMORY[0x1E0D23340]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB9A0](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

uint64_t IOSurfaceAcceleratorCreate()
{
  return MEMORY[0x1E0D3A1D0]();
}

uint64_t IOSurfaceAcceleratorSetCustomFilter()
{
  return MEMORY[0x1E0D3A1F0]();
}

uint64_t IOSurfaceAcceleratorTransformSurface()
{
  return MEMORY[0x1E0D3A200]();
}

CFDictionaryRef IOSurfaceCopyAllValues(IOSurfaceRef buffer)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBBAE0](buffer);
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0CBBAE8](buffer, key);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1E0CBBB40](buffer);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB90](buffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC28](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC68](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBCE0](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBD28](buffer, *(_QWORD *)&options, seed);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
  MEMORY[0x1E0CBBE40](buffer, key, value);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBE88](buffer, *(_QWORD *)&options, seed);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

NSArray *MLAllComputeDevices(void)
{
  return (NSArray *)MEMORY[0x1E0C9E858]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1E0CC6980]();
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

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x1E0CB3210]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1E0CB3228]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1E0CD65E0](task, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1E0CECD18](allocator, pixelTransferSessionOut);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1E0CECD38](session, sourceBuffer, destinationBuffer);
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

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  simd_float4x4 result;

  MEMORY[0x1E0C80B38]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
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

simd_float4 _simd_cos_f4(simd_float4 x)
{
  simd_float4 result;

  MEMORY[0x1E0C811C0]((__n128)x);
  return result;
}

simd_float4 _simd_sin_f4(simd_float4 x)
{
  simd_float4 result;

  MEMORY[0x1E0C81200]((__n128)x);
  return result;
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

long double asin(long double __x)
{
  long double result;

  MEMORY[0x1E0C81598](__x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C81628](a1, a2);
  return result;
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
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

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C82E10](predicate, context, function);
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

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t espresso_buffer_pack_tensor_shape()
{
  return MEMORY[0x1E0D1FEE8]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x1E0D1FF10]();
}

uint64_t espresso_context_set_low_precision_accumulation()
{
  return MEMORY[0x1E0D1FF28]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x1E0D1FF38]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x1E0D1FF40]();
}

uint64_t espresso_get_last_error()
{
  return MEMORY[0x1E0D1FF98]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x1E0D1FFB8]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x1E0D1FFD0]();
}

uint64_t espresso_network_bind_direct_cvpixelbuffer()
{
  return MEMORY[0x1E0D1FFD8]();
}

uint64_t espresso_network_change_input_blob_shapes_seq()
{
  return MEMORY[0x1E0D20018]();
}

uint64_t espresso_network_get_version()
{
  return MEMORY[0x1E0D20058]();
}

uint64_t espresso_network_select_configuration()
{
  return MEMORY[0x1E0D20080]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x1E0D200B0]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x1E0D200C8]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x1E0D200E8]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x1E0D20100]();
}

uint64_t espresso_plan_set_priority()
{
  return MEMORY[0x1E0D20130]();
}

uint64_t espresso_plan_submit()
{
  return MEMORY[0x1E0D20150]();
}

float exp2f(float a1)
{
  float result;

  MEMORY[0x1E0C83290](a1);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x1E0C83298](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C83448](a1, a2);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t kdebug_is_enabled()
{
  return MEMORY[0x1E0C83A10]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

float log2f(float a1)
{
  float result;

  MEMORY[0x1E0C83BF0](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1E0C83DB0]();
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
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

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1E0C858F8](*(_QWORD *)&target_act, *(_QWORD *)&flavor, thread_info_out, thread_info_outCnt);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C0D0](__A, __IA, __B, __IB, __C, __N);
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C1E8](__A, __IA, __C, __N);
}

void vDSP_minvi(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length *__I, vDSP_Length __N)
{
  MEMORY[0x1E0C8C230](__A, __IA, __C, __I, __N);
}

void vDSP_vfill(const float *__A, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C460](__A, __C, __IC, __N);
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C800](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C940](__B, __IB, __A, __IA, __C, __IC, __N);
}

uint64_t vfx_script_clock_simulation_index_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX))
    dlopenHelper_VFX(a1);
  return MEMORY[0x1E0DC63F8]();
}

uint64_t vfx_script_get_arguments_buffer_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX))
    dlopenHelper_VFX(a1);
  return MEMORY[0x1E0DC6468]();
}

uint64_t vfx_script_get_iteration_range_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX))
    dlopenHelper_VFX(a1);
  return MEMORY[0x1E0DC6478]();
}

uint64_t vfx_script_texture_sample1d_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX))
    dlopenHelper_VFX(a1);
  return MEMORY[0x1E0DC64A8]();
}

uint64_t vfx_script_curve_create_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX))
    dlopenHelper_VFX(a1);
  return MEMORY[0x1E0DC6448]();
}

uint64_t vfx_script_clock_time_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX))
    dlopenHelper_VFX(a1);
  return MEMORY[0x1E0DC6408]();
}

uint64_t vfx_script_curve_evaluate_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX))
    dlopenHelper_VFX(a1);
  return MEMORY[0x1E0DC6458]();
}

uint64_t vfx_script_curve_destroy_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX))
    dlopenHelper_VFX(a1);
  return MEMORY[0x1E0DC6450]();
}

uint64_t vfx_script_clock_delta_time_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX))
    dlopenHelper_VFX(a1);
  return MEMORY[0x1E0DC63D8]();
}

uint64_t vfx_script_particle_find_nearest_neighbors_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX))
    dlopenHelper_VFX(a1);
  return MEMORY[0x1E0DC6480]();
}

uint64_t vfx_script_particle_get_id_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX))
    dlopenHelper_VFX(a1);
  return MEMORY[0x1E0DC6488]();
}

uint64_t vfx_script_particle_get_size1d_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX))
    dlopenHelper_VFX(a1);
  return MEMORY[0x1E0DC6498]();
}

uint64_t vfx_script_particle_get_position_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX))
    dlopenHelper_VFX(a1);
  return MEMORY[0x1E0DC6490]();
}

uint64_t vfx_script_clock_is_first_frame_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX))
    dlopenHelper_VFX(a1);
  return MEMORY[0x1E0DC63E8]();
}

uint64_t vfx_script_color_ramp_create_setting_color_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX))
    dlopenHelper_VFX(a1);
  return MEMORY[0x1E0DC6428]();
}

uint64_t vfx_script_color_ramp_evaluate_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX))
    dlopenHelper_VFX(a1);
  return MEMORY[0x1E0DC6440]();
}

uint64_t vfx_script_color_ramp_destroy_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX))
    dlopenHelper_VFX(a1);
  return MEMORY[0x1E0DC6438]();
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_VFX(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/VFX.framework/VFX", 0);
  atomic_store(1u, (unsigned int *)&dlopenHelperFlag_VFX);
  return a1;
}

double gotLoadHelper_x8__OBJC_CLASS___VFXRenderer(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX))
    return dlopenHelper_VFX(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___VFXSceneLoadOptions(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX))
    return dlopenHelper_VFX(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS____TtC3VFX8VFXScene(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX))
    return dlopenHelper_VFX(result);
  return result;
}

