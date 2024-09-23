uint64_t sil_argb8888_to_b3a8(uint64_t result, unsigned int a2, uint64_t a3, int a4, _QWORD *a5, unsigned int a6, int a7, int a8)
{
  int v8;
  unsigned int v9;
  int16x8_t v10;
  int16x8_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint8x16_t v16;
  uint16x8_t v17;
  uint16x8_t v18;
  uint16x8_t v19;
  int32x4_t *v20;
  int8x16x2_t v21;

  if ((a2 & 0x1F) != 0)
    sil_argb8888_to_b3a8_cold_1();
  if (a8)
  {
    v8 = 0;
    v9 = 4 * a7 + 31;
    v10 = vdupq_n_s16(0x180u);
    v11 = vdupq_n_s16(0xD80u);
    v12 = v9 >> 5;
    if (v9 >> 5 <= 1)
      v12 = 1;
    v13 = 32 * v12;
    do
    {
      if (v9 >= 0x20)
      {
        v14 = 0;
        v15 = a5;
        do
        {
          v21 = *(int8x16x2_t *)(result + v14);
          v16 = (uint8x16_t)vqtbl2q_s8(v21, (int8x16_t)xmmword_2454EDB30);
          v17 = (uint16x8_t)vaddq_s16((int16x8_t)vshll_n_u8(*(uint8x8_t *)v16.i8, 1uLL), v10);
          v18 = (uint16x8_t)vaddq_s16((int16x8_t)vshll_high_n_u8(v16, 1uLL), v10);
          v19 = (uint16x8_t)vaddq_s16((int16x8_t)vshll_n_u8((uint8x8_t)*(_OWORD *)&vqtbl2q_s8(v21, (int8x16_t)xmmword_2454EDB40), 1uLL), v11);
          v20 = (int32x4_t *)(a3 + v14);
          *v20 = vaddq_s32((int32x4_t)vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v18.i8, 0xAuLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v17.i8)), vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v19.i8), 0x14uLL));
          v20[1] = vaddq_s32((int32x4_t)vorrq_s8((int8x16_t)vshll_high_n_u16(v18, 0xAuLL), (int8x16_t)vmovl_high_u16(v17)), vshlq_n_s32((int32x4_t)vmovl_high_u16(v19), 0x14uLL));
          *v15++ = vqtbl2q_s8(v21, (int8x16_t)xmmword_2454EDB50).u64[0];
          v14 += 32;
        }
        while (v13 != v14);
      }
      result += a2;
      a5 = (_QWORD *)((char *)a5 + a6);
      ++v8;
      a3 += a4 & 0xFFFFFFFC;
    }
    while (v8 != a8);
  }
  return result;
}

uint64_t sil_header_version()
{
  return 1;
}

uint64_t sil_header_magic_number()
{
  return 1397312601;
}

uint64_t SILServer_createSILServerClient(void)
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t v20[16];
  uint8_t buf[8];
  uint64_t v22;

  v22 = 0;
  xnu_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2454D6000, v0, OS_LOG_TYPE_INFO, "Attempting to launch conclaves...", buf, 2u);
  }

  v1 = tb_conclave_endpoint_for_service();
  if ((_DWORD)v1)
  {
    v2 = v1;
    v3 = 3758097084;
    xnu_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      SILServer_createSILServerClient(v2, v4, v5, v6, v7, v8, v9, v10);
  }
  else
  {
    v11 = silmanager_silmanager__init(&silServerConnection);
    xnu_log();
    v12 = objc_claimAutoreleasedReturnValue();
    v4 = v12;
    if ((_DWORD)v11)
    {
      v3 = 3758097084;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        SILServer_createSILServerClient(v11, v4, v13, v14, v15, v16, v17, v18);
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_2454D6000, v4, OS_LOG_TYPE_INFO, "Created conclave endpoint for SILServer", v20, 2u);
      }
      v3 = 0;
    }
  }

  return v3;
}

uint64_t SILServer_createRenderer(void)
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  int v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v6 = -536870212;
  if (!silServerConnection)
    __assert_rtn("do_tightbeam_call", "SILServerInterface.mm", 49, "silServerConnection.connection != nullptr");
  if (silmanager_silmanager_createrenderer())
  {
    xnu_log();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      SILServer_createRenderer();

  }
  v1 = *((unsigned int *)v4 + 6);
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_2454D7F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SILServer_setPower()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  int v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v6 = -536870212;
  if (!silServerConnection)
    __assert_rtn("do_tightbeam_call", "SILServerInterface.mm", 49, "silServerConnection.connection != nullptr");
  if (silmanager_silmanager_setpower())
  {
    xnu_log();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      SILServer_setPower();

  }
  v1 = *((unsigned int *)v4 + 6);
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_2454D8054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SILServer_swap(unsigned __int8 a1, int a2, double a3, double a4, float a5, unsigned __int16 a6, float a7, unint64_t *a8)
{
  NSObject *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  __n128 (*v16)(__n128 *, __n128 *);
  uint64_t (*v17)();
  const char *v18;
  __int128 v19;

  v13 = 0;
  v14 = &v13;
  v15 = 0x4012000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = "";
  v19 = xmmword_2454EDB90;
  if (!silServerConnection)
    __assert_rtn("do_tightbeam_call", "SILServerInterface.mm", 49, "silServerConnection.connection != nullptr");
  if (silmanager_silmanager_swap())
  {
    xnu_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      SILServer_swap();

  }
  v10 = *((unsigned int *)v14 + 12);
  v11 = v14[7];
  _Block_object_dispose(&v13, 8);
  *a8 = v11;
  return v10;
}

void sub_2454D81B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SILServer_turnOffIndicators(int a1, BOOL a2, unint64_t *a3)
{
  NSObject *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  __n128 (*v11)(__n128 *, __n128 *);
  uint64_t (*v12)();
  const char *v13;
  __int128 v14;

  v8 = 0;
  v9 = &v8;
  v10 = 0x4012000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = "";
  v14 = xmmword_2454EDB90;
  if (!silServerConnection)
    __assert_rtn("do_tightbeam_call", "SILServerInterface.mm", 49, "silServerConnection.connection != nullptr");
  if (silmanager_silmanager_turnoffindicators())
  {
    xnu_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      SILServer_turnOffIndicators();

  }
  v5 = *((unsigned int *)v9 + 12);
  v6 = v9[7];
  _Block_object_dispose(&v8, 8);
  *a3 = v6;
  return v5;
}

void sub_2454D8310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SILServer_setLogLevel()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  int v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v6 = -536870212;
  if (!silServerConnection)
    __assert_rtn("do_tightbeam_call", "SILServerInterface.mm", 49, "silServerConnection.connection != nullptr");
  if (silmanager_silmanager_setloglevel())
  {
    xnu_log();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      SILServer_setLogLevel();

  }
  v1 = *((unsigned int *)v4 + 6);
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_2454D8430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZL17do_tightbeam_callIjPF10tb_error_tPK23silmanager_silmanager_sU13block_pointerFvjEEJPS1_EET_PKcT0_DpOT1__block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t ___ZL17do_tightbeam_callIjPF10tb_error_tPK23silmanager_silmanager_sbbU13block_pointerFvjEEJPS1_RbS9_EET_PKcT0_DpOT1__block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

__n128 __Block_byref_object_copy_(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[3] = result;
  return result;
}

uint64_t ___ZL17do_tightbeam_callI23silmanager_swapreturn_sPF10tb_error_tPK23silmanager_silmanager_shiddftfU13block_pointerFvS0_EEJPS2_RhRiRdSC_RfRtSD_EET_PKcT0_DpOT1__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  *(_QWORD *)(v3 + 48) = a2;
  *(_QWORD *)(v3 + 56) = a3;
  return result;
}

uint64_t ___ZL17do_tightbeam_callI23silmanager_swapreturn_sPF10tb_error_tPK23silmanager_silmanager_sibU13block_pointerFvS0_EEJPS2_RiRbEET_PKcT0_DpOT1__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  *(_QWORD *)(v3 + 48) = a2;
  *(_QWORD *)(v3 + 56) = a3;
  return result;
}

uint64_t ___ZL17do_tightbeam_callIjPF10tb_error_tPK23silmanager_silmanager_shU13block_pointerFvjEEJPS1_RhEET_PKcT0_DpOT1__block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t SILStateMachineCreate(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  unsigned int v4;
  char *v5;
  char *v6;
  id *v7;
  id v8;
  uint64_t v9;
  id v10;
  StateMachine::Manifest *v11;
  NSString *v12;
  char *state_info;

  if (!a1)
    return 0;
  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("IndicatorID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2
    && (v4 = indicator_type_from_name((const char *)objc_msgSend(objc_retainAutorelease(v2), "UTF8String")),
        v5 = indicators_manifest_for_type(v4),
        (v6 = v5) != 0)
    && (v7 = (id *)*((_QWORD *)v5 + 5)) != 0)
  {
    v8 = *v7;
    if (objc_msgSend(v8, "count"))
    {
      v9 = operator new();
      *(_QWORD *)v9 = 850045863;
      *(_OWORD *)(v9 + 8) = 0u;
      *(_OWORD *)(v9 + 24) = 0u;
      *(_OWORD *)(v9 + 40) = 0u;
      *(_QWORD *)(v9 + 56) = 0;
      *(_DWORD *)(v9 + 64) = v4;
      *(_QWORD *)(v9 + 72) = *((_QWORD *)v6 + 5);
      v10 = v8;
      *(_QWORD *)(v9 + 80) = v10;
      *(_OWORD *)(v9 + 88) = 0u;
      *(_OWORD *)(v9 + 104) = 0u;
      *(_OWORD *)(v9 + 115) = 0u;
      v11 = (StateMachine::Manifest *)*((_QWORD *)v6 + 5);
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      state_info = StateMachine::Manifest::get_state_info(v11, v12);
      *(_QWORD *)(v9 + 104) = state_info;

      *(_QWORD *)(v9 + 112) = state_info;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void sub_2454D8638(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

char *StateMachine::Manifest::get_state_info(StateMachine::Manifest *this, NSString *a2)
{
  NSString *v3;
  NSString *v4;
  _QWORD *v5;
  char *v6;
  char *v7;
  unint64_t v8;
  BOOL v9;
  _QWORD *v10;
  char *v11;
  char *v12;
  BOOL v13;

  v3 = a2;
  v4 = v3;
  v6 = (char *)this + 16;
  v5 = (_QWORD *)*((_QWORD *)this + 2);
  if (!v5)
    goto LABEL_12;
  v7 = (char *)this + 16;
  do
  {
    v8 = v5[4];
    v9 = v8 >= (unint64_t)v3;
    if (v8 >= (unint64_t)v3)
      v10 = v5;
    else
      v10 = v5 + 1;
    if (v9)
      v7 = (char *)v5;
    v5 = (_QWORD *)*v10;
  }
  while (*v10);
  if (v7 == v6 || *((_QWORD *)v7 + 4) > (unint64_t)v3)
  {
LABEL_12:
    v7 = (char *)*((_QWORD *)this + 1);
    if (v7 == v6)
    {
LABEL_20:
      v7 = (char *)this + 16;
    }
    else
    {
      while ((objc_msgSend(*((id *)v7 + 4), "isEqualToString:", v4) & 1) == 0)
      {
        v11 = (char *)*((_QWORD *)v7 + 1);
        if (v11)
        {
          do
          {
            v12 = v11;
            v11 = *(char **)v11;
          }
          while (v11);
        }
        else
        {
          do
          {
            v12 = (char *)*((_QWORD *)v7 + 2);
            v13 = *(_QWORD *)v12 == (_QWORD)v7;
            v7 = v12;
          }
          while (!v13);
        }
        v7 = v12;
        if (v12 == v6)
          goto LABEL_20;
      }
    }
  }

  return v7;
}

void sub_2454D8754(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t SILStateMachineStateList(uint64_t a1)
{
  return *(_QWORD *)(a1 + 80);
}

uint64_t SILStateMachineTick(uint64_t a1, _WORD *a2, double a3)
{
  uint64_t v6;
  int v7;
  uint64_t *v8;
  int v9;
  uint64_t v10;
  unsigned int v11;
  unsigned __int16 *v12;
  unsigned __int16 *v13;
  unsigned __int16 *v14;
  unsigned __int16 *v15;
  BOOL v16;
  unsigned __int16 *v17;
  double v18;
  double v19;
  unint64_t v20;
  unsigned __int16 v21;
  char *v22;
  char *v23;
  unsigned __int16 v24;
  uint64_t v25;
  unint64_t v26;
  unsigned int v27;
  unsigned int v28;
  NSObject *v29;
  int v30;
  unsigned __int16 *v31;
  unsigned int v32;
  unsigned int v33;
  NSObject *v34;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  uint64_t v38;
  int v39;
  int v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  float v46;
  float *v47;
  double v48;
  double v49;
  long double v50;
  char v51;
  uint64_t v52;
  float v53;
  int v54;
  _BYTE v55[10];
  unsigned int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  std::mutex::lock((std::mutex *)a1);
  v6 = *(_QWORD *)(a1 + 104);
  if (v6 == *(_QWORD *)(a1 + 112) || *(_BYTE *)(a1 + 130))
  {
    v7 = 0;
    v8 = (uint64_t *)(v6 + 40);
    v9 = 1;
  }
  else
  {
    v9 = 0;
    v8 = (uint64_t *)(a1 + 120);
    v7 = 1;
  }
  v10 = *v8;
  v11 = *(unsigned __int16 *)(a1 + 128);
  v13 = *(unsigned __int16 **)(v10 + 8);
  v12 = *(unsigned __int16 **)(v10 + 16);
  v14 = v13;
  if (v13 != v12)
  {
    v14 = *(unsigned __int16 **)(v10 + 8);
    while (*v14 > v11 || v14[1] < v11)
    {
      v14 += 4;
      if (v14 == v12)
        goto LABEL_22;
    }
  }
  if (v14 != v12)
  {
    v15 = v14 + 4;
    v16 = v14 + 4 == v12;
    if (v14 + 4 == v12)
      v17 = *(unsigned __int16 **)(v10 + 8);
    else
      v17 = v14 + 4;
    if (v16)
      v15 = v14;
    if (!v9)
      v17 = v15;
    if (v11 >= v14[1])
      v13 = v17;
    else
      v13 = v14;
  }
LABEL_22:
  v18 = *(double *)(a1 + 88) - *(double *)(a1 + 96);
  if (v18 - *((float *)v13 + 1) >= 0.0)
    v19 = v18 - *((float *)v13 + 1);
  else
    v19 = 0.0;
  v20 = *v13;
  v21 = v13[1];
  v22 = indicators_manifest_for_type(*(_DWORD *)(a1 + 64));
  v23 = v22;
  if (v22
    && (v24 = v21 + 1, v20 <= (unsigned __int16)(v21 + 1))
    && (v25 = *((_QWORD *)v22 + 2), v26 = (*((_QWORD *)v22 + 3) - v25) >> 3, v26 >= v20)
    && v26 >= v24)
  {
    v46 = v19;
    v47 = (float *)(v25 + 8 * v20);
    v48 = *v47;
    v49 = (float)(*(float *)(v25 + 8 * (v24 - 1)) + 0.004) - v48;
    v50 = v46;
    if (v49 >= v50)
      v51 = 1;
    else
      v51 = v9;
    if ((v51 & 1) != 0)
    {
      v52 = v24;
      v53 = fmod(v50, v49) + v48;
      v27 = (unsigned __int16)((IndicatorsManifest::closest_frame_for_time(v47, (float *)(v25 + 8 * v52), v53)- *((_DWORD *)v23 + 4)) >> 3);
    }
    else
    {
      v27 = (unsigned __int16)(v24 - 1);
    }
  }
  else
  {
    v27 = 0xFFFF;
  }
  v28 = *(unsigned __int16 *)(a1 + 128);
  if (v27 != v28 && v18 > 0.0 && frame_distance(v10, v28, v27) >= 2)
  {
    xnu_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = *(unsigned __int16 *)(a1 + 128);
      v54 = 67109376;
      *(_DWORD *)v55 = v30;
      *(_WORD *)&v55[4] = 1024;
      *(_DWORD *)&v55[6] = v27;
      _os_log_impl(&dword_2454D6000, v29, OS_LOG_TYPE_INFO, "SILStateMachine dropped frame. Last frame %u new frame %u", (uint8_t *)&v54, 0xEu);
    }

  }
  *(double *)(a1 + 88) = *(double *)(a1 + 88) + a3;
  if (*(_BYTE *)(a1 + 130))
  {
    v31 = *(unsigned __int16 **)(a1 + 120);
    v32 = *v31;
    v33 = frame_distance((uint64_t)v31, v13, v13, *(unsigned __int16 *)(a1 + 128), v27);
    if (v33 >= frame_distance(*(_QWORD *)(a1 + 120), v13, v13, *(unsigned __int16 *)(a1 + 128), v32))
    {
      *(_BYTE *)(a1 + 130) = 0;
      *(_QWORD *)(a1 + 96) = *(_QWORD *)(a1 + 88);
      xnu_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v38 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 104) + 32), "UTF8String");
        v39 = *v13;
        v40 = v13[1];
        v54 = 136315906;
        *(_QWORD *)v55 = v38;
        *(_WORD *)&v55[8] = 1024;
        v56 = v32;
        v57 = 1024;
        v58 = v39;
        v59 = 1024;
        v60 = v40;
        v35 = "SILStateMachine starting transition to %s with jump frame %u -> [%u,%u]";
        v36 = v34;
        v37 = 30;
        goto LABEL_42;
      }
    }
    else
    {
      xnu_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v54 = 67109376;
        *(_DWORD *)v55 = v27;
        *(_WORD *)&v55[4] = 1024;
        *(_DWORD *)&v55[6] = v32;
        v35 = "SILStateMachine pending transition cur : %u jump frame : %u";
        v36 = v34;
        v37 = 14;
LABEL_42:
        _os_log_impl(&dword_2454D6000, v36, OS_LOG_TYPE_INFO, v35, (uint8_t *)&v54, v37);
      }
    }

  }
  if (v7 && v13 == (unsigned __int16 *)(*(_QWORD *)(v10 + 16) - 8) && *(unsigned __int16 *)(a1 + 128) == v13[1])
  {
    v41 = *(_QWORD *)(a1 + 112);
    LOWORD(v27) = **(_WORD **)(*(_QWORD *)(v41 + 40) + 8);
    *(_QWORD *)(a1 + 120) = 0;
    *(_QWORD *)(a1 + 104) = v41;
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(a1 + 88);
    xnu_log();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      v43 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 104) + 32), "UTF8String");
      v54 = 136315138;
      *(_QWORD *)v55 = v43;
      _os_log_impl(&dword_2454D6000, v42, OS_LOG_TYPE_INFO, "SILStateMachine finished transition %s", (uint8_t *)&v54, 0xCu);
    }

  }
  *(_WORD *)(a1 + 128) = v27;
  if (a2)
    *a2 = v27;
  v44 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 32);
  std::mutex::unlock((std::mutex *)a1);
  return v44;
}

void sub_2454D8BF4(_Unwind_Exception *a1)
{
  std::mutex *v1;
  void *v2;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t frame_distance(uint64_t a1, unsigned int a2, unsigned int a3)
{
  unsigned __int16 *v5;
  unsigned __int16 *v6;
  unsigned __int16 *v7;

  v5 = *(unsigned __int16 **)(a1 + 8);
  v6 = *(unsigned __int16 **)(a1 + 16);
  v7 = v5;
  if (v5 != v6)
  {
    while (*v7 > a2 || v7[1] < a2)
    {
      v7 += 4;
      if (v7 == v6)
      {
        v7 = *(unsigned __int16 **)(a1 + 16);
        break;
      }
    }
    while (*v5 > a3 || v5[1] < a3)
    {
      v5 += 4;
      if (v5 == v6)
      {
        v5 = *(unsigned __int16 **)(a1 + 16);
        break;
      }
    }
  }
  if (v7 == v6)
    frame_distance();
  if (v5 == v6)
    frame_distance();
  return frame_distance(a1, v7, v5, a2, a3);
}

uint64_t frame_distance(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3, unsigned int a4, unsigned int a5)
{
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned __int16 *i;
  int v10;
  int v11;

  v5 = *a2;
  if (v5 > a4 || (v6 = a2[1], v7 = v6 - a4, v6 < a4))
    frame_distance();
  v8 = *a3;
  if (v8 > a5 || a3[1] < a5)
    frame_distance();
  if (a2 == a3)
  {
    if (a5 >= a4)
      return a5 - a4;
    else
      return a5 - a4 - v5 + v6;
  }
  else
  {
    for (i = a2 + 4; ; i += 4)
    {
      if (i == *(unsigned __int16 **)(a1 + 16))
        i = *(unsigned __int16 **)(a1 + 8);
      if (i == a3)
        break;
      v10 = i[1];
      v11 = *i;
      v7 = v7 + v10 - v11;
    }
    return v7 + a5 - v8;
  }
}

uint64_t SILStateMachineTransitionSupported(uint64_t a1, void *a2, void *a3)
{
  NSString *v5;
  id v6;
  char *state_info;
  char v8;
  uint64_t v9;
  _BOOL8 v10;
  void *__p[2];
  char v13;

  if (!a2)
    return 1;
  v5 = a2;
  v6 = a3;
  state_info = StateMachine::Manifest::get_state_info(*(StateMachine::Manifest **)(a1 + 72), v5);
  if (v8)
  {
    v9 = *((_QWORD *)state_info + 5);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
    v10 = std::__hash_table<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>>>::find<std::string>((_QWORD *)(v9 + 32), (unsigned __int8 *)__p) != 0;
    if (v13 < 0)
      operator delete(__p[0]);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_2454D8E20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  void *v16;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

uint64_t SILStateMachineTransitionToState(uint64_t a1, void *a2)
{
  NSString *v3;
  char *state_info;
  char v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int16 *best_transition;

  v3 = a2;
  state_info = StateMachine::Manifest::get_state_info(*(StateMachine::Manifest **)(a1 + 72), v3);
  if (v5)
  {
    v6 = state_info;
    std::mutex::lock((std::mutex *)a1);
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 104) + 32), "isEqualToString:", v3);
    if ((v7 & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      v9 = *(_QWORD *)(a1 + 104);
      if (v9 == *(_QWORD *)(a1 + 112) && !*(_BYTE *)(a1 + 130))
      {
        best_transition = StateMachine::Manifest::get_best_transition(v7, *(_QWORD **)(v9 + 40), v3, *(unsigned __int16 *)(a1 + 128));
        *(_QWORD *)(a1 + 112) = v6;
        *(_QWORD *)(a1 + 120) = best_transition;
        v8 = 1;
        *(_BYTE *)(a1 + 130) = 1;
      }
      else
      {
        v8 = 0;
      }
    }
    std::mutex::unlock((std::mutex *)a1);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_2454D8F08(_Unwind_Exception *a1)
{
  void *v1;
  std::mutex *v2;

  std::mutex::unlock(v2);

  _Unwind_Resume(a1);
}

unsigned __int16 *StateMachine::Manifest::get_best_transition(uint64_t a1, _QWORD *a2, void *a3, unsigned int a4)
{
  id v6;
  unsigned __int8 *v7;
  unsigned __int16 *v8;
  unsigned __int16 *v9;
  unsigned __int16 *v10;
  unsigned __int16 *v11;
  unsigned __int16 *v12;
  uint64_t v13;
  unsigned int v14;
  void *__p[2];
  char v17;

  v6 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v6, "UTF8String"));
  v7 = std::__hash_table<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>>>::find<std::string>(a2 + 4, (unsigned __int8 *)__p);
  if (v17 < 0)
    operator delete(__p[0]);
  if (!v7)
    __assert_rtn("get_best_transition", "SILStateMachine.mm", 431, "it != from.transitions.end ()");
  v8 = (unsigned __int16 *)a2[1];
  v9 = (unsigned __int16 *)a2[2];
  if (v8 != v9)
  {
    while (*v8 > a4 || v8[1] < a4)
    {
      v8 += 4;
      if (v8 == v9)
        goto LABEL_8;
    }
  }
  if (v8 == v9)
LABEL_8:
    __assert_rtn("get_best_transition", "SILStateMachine.mm", 432, "frame_in_range (from.self, current_frame)");
  v10 = (unsigned __int16 *)*((_QWORD *)v7 + 5);
  v11 = (unsigned __int16 *)*((_QWORD *)v7 + 6);
  if (v10 == v11)
  {
    v12 = 0;
  }
  else
  {
    v12 = 0;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v14 = frame_distance((uint64_t)a2, a4, *v10);
      if (v13 > v14)
        v12 = v10;
      if (v13 >= v14)
        v13 = v14;
      v10 += 16;
    }
    while (v10 != v11);
  }

  return v12;
}

void sub_2454D9080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

BOOL SILStateMachineForceTransitionToState(uint64_t a1, void *a2)
{
  NSString *v3;
  char *state_info;
  char v5;
  _BOOL8 v6;

  v3 = a2;
  state_info = StateMachine::Manifest::get_state_info(*(StateMachine::Manifest **)(a1 + 72), v3);
  if (v5)
  {
    *(_QWORD *)(a1 + 104) = state_info;
    *(_QWORD *)(a1 + 112) = state_info;
    *(_QWORD *)(a1 + 120) = 0;
    *(_BYTE *)(a1 + 130) = 0;
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(a1 + 88);
    *(_WORD *)(a1 + 128) = **((_WORD **)state_info + 5);
  }
  v6 = v5 != 0;

  return v6;
}

void sub_2454D911C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t SILStateMachineRelease(uint64_t result)
{
  std::mutex *v1;

  if (result)
  {
    v1 = (std::mutex *)result;

    std::mutex::~mutex(v1);
    JUMPOUT(0x2495360E8);
  }
  return result;
}

_QWORD *StateMachine::Manifest::create(StateMachine::Manifest *this, NSDictionary *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD **v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD v13[6];
  _QWORD v14[4];
  _QWORD **v15;
  _QWORD *v16;
  uint64_t v17;
  StateMachine::Manifest *v18;

  v18 = this;
  -[StateMachine::Manifest objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", CFSTR("animations"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v16 = 0;
    v17 = 0;
    v15 = &v16;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v14[3] = &v15;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = ___ZN12StateMachine8Manifest6createEP12NSDictionary_block_invoke;
    v13[3] = &unk_251666D50;
    v13[4] = v14;
    v13[5] = &v18;
    objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v13);
    objc_msgSend(v3, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingSelector:", sel_localizedCompare_);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = (_QWORD *)operator new();
    v7 = v6;
    v8 = v15;
    v9 = v16;
    *v6 = v5;
    v6[1] = v8;
    v6[2] = v9;
    v10 = v6 + 2;
    v11 = v17;
    v6[3] = v17;
    if (v11)
    {
      v9[2] = v10;
      v15 = &v16;
      v16 = 0;
      v17 = 0;
    }
    else
    {
      v6[1] = v10;
    }
    _Block_object_dispose(v14, 8);
    std::__tree<std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>>>::destroy((uint64_t)&v15, v16);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_2454D92C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  void *v8;
  uint64_t v9;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  std::__tree<std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>>>::destroy(v9 - 64, *(_QWORD **)(v9 - 56));

  _Unwind_Resume(a1);
}

void ___ZN12StateMachine8Manifest6createEP12NSDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  id v27;
  id *v28;

  v5 = a2;
  v27 = v5;
  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3812000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  v7 = operator new();
  *(_QWORD *)(v7 + 64) = 0;
  *(_OWORD *)(v7 + 32) = 0u;
  *(_OWORD *)(v7 + 48) = 0u;
  *(_OWORD *)v7 = 0u;
  *(_OWORD *)(v7 + 16) = 0u;
  *(_DWORD *)(v7 + 64) = 1065353216;
  v26 = v7;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = ___ZN12StateMachine8Manifest6createEP12NSDictionary_block_invoke_3;
  v16[3] = &unk_251666D28;
  v19 = *(_QWORD *)(a1 + 40);
  v17 = v5;
  v18 = &v20;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v16);
  v8 = v21;
  v9 = *(uint64_t ***)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v28 = &v27;
  v10 = std::__tree<std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>>>::__emplace_unique_key_args<NSString * {__strong},std::piecewise_construct_t const&,std::tuple<NSString * const {__strong}&>,std::tuple<>>(v9, (unint64_t *)&v27, (uint64_t)&std::piecewise_construct, &v28);
  v11 = v8[6];
  v8[6] = 0;
  v14 = v10[5];
  v12 = v10 + 5;
  v13 = v14;
  *v12 = v11;
  if (v14)
    std::default_delete<StateMachine::State>::operator()[abi:ne180100]((uint64_t)v12, v13);

  _Block_object_dispose(&v20, 8);
  v15 = v26;
  v26 = 0;
  if (v15)
    std::default_delete<StateMachine::State>::operator()[abi:ne180100]((uint64_t)&v26, v15);

}

void sub_2454D9494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;

  _Block_object_dispose(&a17, 8);
  v27 = a23;
  a23 = 0;
  if (v27)
    std::default_delete<StateMachine::State>::operator()[abi:ne180100](v24, v27);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(result + 48) = v2;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 48);
  v1 = (_QWORD *)(a1 + 48);
  v2 = v3;
  *v1 = 0;
  if (v3)
    std::default_delete<StateMachine::State>::operator()[abi:ne180100]((uint64_t)v1, v2);
}

void ___ZN12StateMachine8Manifest6createEP12NSDictionary_block_invoke_3(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  __int128 *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  const char *v15;
  int v16;
  __int128 v17;
  uint64_t v18;
  __int128 *v19[6];
  void *__p;
  void **p_p;
  uint64_t v22;
  __n128 (*v23)(__n128 *, __n128 *);
  void (*v24)(uint64_t);
  const char *v25;
  _QWORD v26[3];
  void **v27;

  v5 = a2;
  v6 = a3;
  __p = 0;
  p_p = &__p;
  v22 = 0x4812000000;
  v23 = __Block_byref_object_copy__17;
  v24 = __Block_byref_object_dispose__18;
  v25 = "";
  memset(v26, 0, sizeof(v26));
  v19[0] = (__int128 *)MEMORY[0x24BDAC760];
  v19[1] = (__int128 *)3221225472;
  v19[2] = (__int128 *)___ZZN12StateMachine8Manifest6createEP12NSDictionaryENK3__0clES2__block_invoke;
  v19[3] = (__int128 *)&unk_251666D78;
  v7 = (__int128 *)a1[6];
  v19[4] = (__int128 *)&__p;
  v19[5] = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v19);
  v18 = 0;
  v17 = 0uLL;
  std::vector<StateMachine::TransitionPoint>::__init_with_size[abi:ne180100]<StateMachine::TransitionPoint*,StateMachine::TransitionPoint*>(&v17, (uint64_t)p_p[6], (uint64_t)p_p[7], ((_BYTE *)p_p[7] - (_BYTE *)p_p[6]) >> 5);
  _Block_object_dispose(&__p, 8);
  v27 = (void **)v26;
  std::vector<StateMachine::TransitionPoint>::__destroy_vector::operator()[abi:ne180100](&v27);

  if (objc_msgSend(v5, "isEqualToString:", a1[4]))
  {
    v8 = v17;
    if (*((_QWORD *)&v17 + 1) - (_QWORD)v17 == 32)
    {
      v9 = *(char **)(v17 + 8);
      v10 = *(_QWORD *)(v17 + 16);
      if (v10 - (_QWORD)v9 == 8)
      {
        v11 = *(unsigned __int16 *)v17;
        if (v11 >= *(unsigned __int16 *)v9 && v11 <= *((unsigned __int16 *)v9 + 1))
        {
          v12 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 48);
          *(_WORD *)v12 = v11;
          if (v12 != v8)
            std::vector<StateMachine::TransitionPoint::Range>::__assign_with_size[abi:ne180100]<StateMachine::TransitionPoint::Range*,StateMachine::TransitionPoint::Range*>((char *)(v12 + 8), v9, v10, 1uLL);
          goto LABEL_10;
        }
        v15 = "transitions[0].start_frame >= transitions[0].ranges[0].from && transitions[0].start_frame <= transitions[0].ranges[0].to";
        v16 = 385;
      }
      else
      {
        v15 = "transitions[0].ranges.size () == 1";
        v16 = 382;
      }
    }
    else
    {
      v15 = "transitions.size () == 1";
      v16 = 381;
    }
    __assert_rtn("create_block_invoke", "SILStateMachine.mm", v16, v15);
  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 48);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
  v19[0] = (__int128 *)&__p;
  v14 = std::__hash_table<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v13 + 32, (unsigned __int8 *)&__p, (uint64_t)&std::piecewise_construct, v19);
  std::vector<StateMachine::TransitionPoint>::__vdeallocate((uint64_t *)v14 + 5);
  *(_OWORD *)(v14 + 40) = v17;
  *((_QWORD *)v14 + 7) = v18;
  v18 = 0;
  v17 = 0uLL;
  if (SHIBYTE(v22) < 0)
    operator delete(__p);
LABEL_10:
  __p = &v17;
  std::vector<StateMachine::TransitionPoint>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

}

void sub_2454D974C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  void *v24;
  void *v25;

  if (a24 < 0)
    operator delete(__p);
  __p = &a9;
  std::vector<StateMachine::TransitionPoint>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

  _Unwind_Resume(a1);
}

_QWORD *StateMachine::Manifest::Manifest(_QWORD *a1, void *a2, uint64_t *a3)
{
  id v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;

  v5 = a2;
  v6 = *a3;
  *a1 = v5;
  a1[1] = v6;
  v7 = a3 + 1;
  v8 = a3[1];
  a1[2] = v8;
  v9 = a1 + 2;
  v10 = a3[2];
  a1[3] = v10;
  if (v10)
  {
    *(_QWORD *)(v8 + 16) = v9;
    *a3 = (uint64_t)v7;
    *v7 = 0;
    a3[2] = 0;
  }
  else
  {
    a1[1] = v9;
  }
  return a1;
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

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_251666150, MEMORY[0x24BEDAAF0]);
}

void sub_2454D9914(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

__n128 __Block_byref_object_copy__17(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
  void **v1;

  v1 = (void **)(a1 + 48);
  std::vector<StateMachine::TransitionPoint>::__destroy_vector::operator()[abi:ne180100](&v1);
}

void ___ZZN12StateMachine8Manifest6createEP12NSDictionaryENK3__0clES2__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unsigned int v7;
  float v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  int v14;
  int *v15;
  int *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  int *v22;
  char *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  float frame_time;
  uint64_t *v28;
  uint64_t *v29;
  unint64_t v30;
  uint64_t v31;
  const char *v32;
  int v33;
  id v34;
  __int16 v35;
  void *__p;
  int *v37;
  int *v38;

  v5 = a2;
  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    v32 = "ranges.count >= 2";
    v33 = 345;
    goto LABEL_30;
  }
  if ((objc_msgSend(v6, "count") & 1) != 0)
  {
    v32 = "ranges.count % 2 == 0";
    v33 = 346;
LABEL_30:
    __assert_rtn("operator()_block_invoke", "SILStateMachine.mm", v33, v32);
  }
  v37 = 0;
  v38 = 0;
  __p = 0;
  v34 = objc_retainAutorelease(v5);
  v35 = atoi((const char *)objc_msgSend(v34, "UTF8String"));
  std::vector<StateMachine::TransitionPoint::Range>::reserve(&__p, (unint64_t)objc_msgSend(v6, "count") >> 1);
  v7 = 0;
  v8 = 0.0;
  while (1)
  {
    v9 = v7;
    if (objc_msgSend(v6, "count") <= (unint64_t)v7)
      break;
    objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedShortValue");

    objc_msgSend(v6, "objectAtIndexedSubscript:", v7 | 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedShortValue");

    v14 = v11 | (v13 << 16);
    v15 = v37;
    if (v37 >= v38)
    {
      v17 = ((char *)v37 - (_BYTE *)__p) >> 3;
      v18 = v17 + 1;
      if ((unint64_t)(v17 + 1) >> 61)
        std::vector<StateMachine::TransitionPoint::Range>::__throw_length_error[abi:ne180100]();
      v19 = (char *)v38 - (_BYTE *)__p;
      if (((char *)v38 - (_BYTE *)__p) >> 2 > v18)
        v18 = v19 >> 2;
      if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF8)
        v20 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v20 = v18;
      if (v20)
        v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<StateMachine::TransitionPoint::Range>>((uint64_t)&v38, v20);
      else
        v21 = 0;
      v22 = (int *)&v21[8 * v17];
      *v22 = v14;
      *((float *)v22 + 1) = v8;
      v24 = (char *)__p;
      v23 = (char *)v37;
      v25 = (char *)v22;
      if (v37 != __p)
      {
        do
        {
          v26 = *((_QWORD *)v23 - 1);
          v23 -= 8;
          *((_QWORD *)v25 - 1) = v26;
          v25 -= 8;
        }
        while (v23 != v24);
        v23 = (char *)__p;
      }
      v16 = v22 + 2;
      __p = v25;
      v37 = v22 + 2;
      v38 = (int *)&v21[8 * v20];
      if (v23)
        operator delete(v23);
    }
    else
    {
      *v37 = v14;
      *((float *)v15 + 1) = v8;
      v16 = v15 + 2;
    }
    v37 = v16;
    frame_time = get_frame_time(**(NSDictionary ***)(a1 + 40), v11);
    v8 = v8 + (float)((float)(get_frame_time(**(NSDictionary ***)(a1 + 40), v13) + 0.008) - frame_time);
    v7 = v9 + 2;
  }
  v28 = *(uint64_t **)(*(_QWORD *)(a1 + 32) + 8);
  v29 = v28 + 6;
  v30 = v28[7];
  if (v30 >= v28[8])
  {
    v31 = std::vector<StateMachine::TransitionPoint>::__push_back_slow_path<StateMachine::TransitionPoint const&>(v29, (uint64_t)&v35);
  }
  else
  {
    std::vector<StateMachine::TransitionPoint>::__construct_one_at_end[abi:ne180100]<StateMachine::TransitionPoint const&>((uint64_t)v29, (uint64_t)&v35);
    v31 = v30 + 32;
  }
  v28[7] = v31;
  if (__p)
  {
    v37 = (int *)__p;
    operator delete(__p);
  }

}

void sub_2454D9C88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  void *v15;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void std::vector<StateMachine::TransitionPoint::Range>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      std::vector<StateMachine::TransitionPoint::Range>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<StateMachine::TransitionPoint::Range>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v9 = &v6[8 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *((_QWORD *)v10 - 1);
        v10 -= 8;
        *((_QWORD *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

float get_frame_time(NSDictionary *a1, unsigned int a2)
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  float v7;

  -[NSDictionary objectForKeyedSubscript:](a1, "objectForKeyedSubscript:", CFSTR("frames"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") <= (unint64_t)a2)
  {
    v7 = NAN;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("time"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = v6;

  }
  return v7;
}

void sub_2454D9E1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void std::vector<StateMachine::TransitionPoint::Range>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<StateMachine::TransitionPoint::Range>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

_QWORD *std::vector<StateMachine::TransitionPoint>::__construct_one_at_end[abi:ne180100]<StateMachine::TransitionPoint const&>(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *result;

  v3 = *(_QWORD *)(a1 + 8);
  *(_WORD *)v3 = *(_WORD *)a2;
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + 24) = 0;
  *(_QWORD *)(v3 + 8) = 0;
  result = std::vector<StateMachine::TransitionPoint::Range>::__init_with_size[abi:ne180100]<StateMachine::TransitionPoint::Range*,StateMachine::TransitionPoint::Range*>((_QWORD *)(v3 + 8), *(const void **)(a2 + 8), *(_QWORD *)(a2 + 16), (uint64_t)(*(_QWORD *)(a2 + 16) - *(_QWORD *)(a2 + 8)) >> 3);
  *(_QWORD *)(a1 + 8) = v3 + 32;
  return result;
}

void sub_2454D9EE4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<StateMachine::TransitionPoint>::__push_back_slow_path<StateMachine::TransitionPoint const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];
  char *v15;
  char *v16;
  uint64_t *v17;

  v3 = *a1;
  v4 = (a1[1] - *a1) >> 5;
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 59)
    std::vector<StateMachine::TransitionPoint::Range>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = a1[2] - v3;
  if (v8 >> 4 > v5)
    v5 = v8 >> 4;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFE0)
    v9 = 0x7FFFFFFFFFFFFFFLL;
  else
    v9 = v5;
  v17 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<StateMachine::TransitionPoint>>(v7, v9);
  else
    v10 = 0;
  v11 = &v10[32 * v4];
  v14[0] = v10;
  v14[1] = v11;
  v15 = v11;
  v16 = &v10[32 * v9];
  *(_WORD *)v11 = *(_WORD *)a2;
  *((_QWORD *)v11 + 2) = 0;
  *((_QWORD *)v11 + 3) = 0;
  *((_QWORD *)v11 + 1) = 0;
  std::vector<StateMachine::TransitionPoint::Range>::__init_with_size[abi:ne180100]<StateMachine::TransitionPoint::Range*,StateMachine::TransitionPoint::Range*>((_QWORD *)v11 + 1, *(const void **)(a2 + 8), *(_QWORD *)(a2 + 16), (uint64_t)(*(_QWORD *)(a2 + 16) - *(_QWORD *)(a2 + 8)) >> 3);
  v15 += 32;
  std::vector<StateMachine::TransitionPoint>::__swap_out_circular_buffer(a1, v14);
  v12 = a1[1];
  std::__split_buffer<StateMachine::TransitionPoint>::~__split_buffer((uint64_t)v14);
  return v12;
}

void sub_2454D9FD4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<StateMachine::TransitionPoint>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<StateMachine::TransitionPoint::Range>::__init_with_size[abi:ne180100]<StateMachine::TransitionPoint::Range*,StateMachine::TransitionPoint::Range*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<StateMachine::TransitionPoint::Range>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2454DA044(_Unwind_Exception *exception_object)
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

char *std::vector<StateMachine::TransitionPoint::Range>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<StateMachine::TransitionPoint::Range>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<StateMachine::TransitionPoint::Range>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

uint64_t std::vector<StateMachine::TransitionPoint>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<StateMachine::TransitionPoint>,std::reverse_iterator<StateMachine::TransitionPoint*>,std::reverse_iterator<StateMachine::TransitionPoint*>,std::reverse_iterator<StateMachine::TransitionPoint*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<StateMachine::TransitionPoint>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(32 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<StateMachine::TransitionPoint>,std::reverse_iterator<StateMachine::TransitionPoint*>,std::reverse_iterator<StateMachine::TransitionPoint*>,std::reverse_iterator<StateMachine::TransitionPoint*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int16 v8;
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
      v8 = *(_WORD *)(a3 - 32);
      a3 -= 32;
      *(_WORD *)(v7 - 32) = v8;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      *(_QWORD *)(v7 - 24) = 0;
      *(_OWORD *)(v7 - 24) = *(_OWORD *)(a3 + 8);
      *(_QWORD *)(v7 - 8) = *(_QWORD *)(a3 + 24);
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      *(_QWORD *)(a3 + 24) = 0;
      v7 = *((_QWORD *)&v14 + 1) - 32;
      *((_QWORD *)&v14 + 1) -= 32;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<StateMachine::TransitionPoint>,std::reverse_iterator<StateMachine::TransitionPoint*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<StateMachine::TransitionPoint>,std::reverse_iterator<StateMachine::TransitionPoint*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<StateMachine::TransitionPoint>,std::reverse_iterator<StateMachine::TransitionPoint*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<StateMachine::TransitionPoint>,std::reverse_iterator<StateMachine::TransitionPoint*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = *(void **)(v1 + 8);
    if (v3)
    {
      *(_QWORD *)(v1 + 16) = v3;
      operator delete(v3);
    }
    v1 += 32;
  }
}

uint64_t std::__split_buffer<StateMachine::TransitionPoint>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<StateMachine::TransitionPoint>::__destruct_at_end[abi:ne180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<StateMachine::TransitionPoint>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;

  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != a2)
  {
    *(_QWORD *)(a1 + 16) = v2 - 32;
    v5 = *(void **)(v2 - 24);
    if (v5)
    {
      *(_QWORD *)(v2 - 16) = v5;
      operator delete(v5);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 32;
    }
  }
}

_QWORD *std::vector<StateMachine::TransitionPoint>::__init_with_size[abi:ne180100]<StateMachine::TransitionPoint*,StateMachine::TransitionPoint*>(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    std::vector<StateMachine::TransitionPoint>::__vallocate[abi:ne180100](result, a4);
    result = (_QWORD *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<StateMachine::TransitionPoint>,StateMachine::TransitionPoint*,StateMachine::TransitionPoint*,StateMachine::TransitionPoint*>((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_2454DA358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<StateMachine::TransitionPoint>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<StateMachine::TransitionPoint>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 59)
    std::vector<StateMachine::TransitionPoint::Range>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<StateMachine::TransitionPoint>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<StateMachine::TransitionPoint>,StateMachine::TransitionPoint*,StateMachine::TransitionPoint*,StateMachine::TransitionPoint*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  _QWORD v8[3];
  char v9;
  uint64_t v10;
  uint64_t v11;

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
      *(_WORD *)v4 = *(_WORD *)v6;
      *(_QWORD *)(v4 + 16) = 0;
      *(_QWORD *)(v4 + 24) = 0;
      *(_QWORD *)(v4 + 8) = 0;
      std::vector<StateMachine::TransitionPoint::Range>::__init_with_size[abi:ne180100]<StateMachine::TransitionPoint::Range*,StateMachine::TransitionPoint::Range*>((_QWORD *)(v4 + 8), *(const void **)(v6 + 8), *(_QWORD *)(v6 + 16), (uint64_t)(*(_QWORD *)(v6 + 16) - *(_QWORD *)(v6 + 8)) >> 3);
      v4 = v11 + 32;
      v11 += 32;
      v6 += 32;
    }
    while (v6 != a3);
  }
  v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<StateMachine::TransitionPoint>,StateMachine::TransitionPoint*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_2454DA45C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<StateMachine::TransitionPoint>,StateMachine::TransitionPoint*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<StateMachine::TransitionPoint>,StateMachine::TransitionPoint*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<StateMachine::TransitionPoint>,StateMachine::TransitionPoint*>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<StateMachine::TransitionPoint>,StateMachine::TransitionPoint*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = **(_QWORD **)(a1 + 16);
  v2 = **(_QWORD **)(a1 + 8);
  while (v1 != v2)
  {
    v3 = *(void **)(v1 - 24);
    if (v3)
    {
      *(_QWORD *)(v1 - 16) = v3;
      operator delete(v3);
    }
    v1 -= 32;
  }
}

void std::vector<StateMachine::TransitionPoint>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<StateMachine::TransitionPoint>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<StateMachine::TransitionPoint>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;
  void *v4;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 32)
  {
    v4 = *(void **)(i - 24);
    if (v4)
    {
      *(_QWORD *)(i - 16) = v4;
      operator delete(v4);
    }
  }
  a1[1] = v2;
}

char *std::vector<StateMachine::TransitionPoint::Range>::__assign_with_size[abi:ne180100]<StateMachine::TransitionPoint::Range*,StateMachine::TransitionPoint::Range*>(char *result, char *__src, uint64_t a3, unint64_t a4)
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
      std::vector<StateMachine::TransitionPoint::Range>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 2;
    if (v8 >> 2 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8)
      v11 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<StateMachine::TransitionPoint::Range>::__vallocate[abi:ne180100](v7, v11);
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

void std::vector<StateMachine::TransitionPoint>::__vdeallocate(uint64_t *a1)
{
  if (*a1)
  {
    std::vector<StateMachine::TransitionPoint>::__clear[abi:ne180100](a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>>>::find<std::string>(_QWORD *a1, unsigned __int8 *a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = *((_QWORD *)v11 + 1);
      if (v13 == v6)
      {
        if ((std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = *((_QWORD *)v11 + 1);
      if (v6 == v13)
      {
        if ((std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  char v5;

  v2 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
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
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      v11 = v7 + v9;
      v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      v14 = v8 + a3 + v7 + v4;
      v15 = v14 + v5;
      v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      v18 = v17 + v6 + v9;
      v19 = __ROR8__(v18, 44);
      v20 = v18 + v10;
      v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      v23 = *a2;
      v22 = a2 + 4;
      v24 = v23 - 0x4B6D499041670D8DLL * v5;
      v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        v26 = *(v22 - 3);
        v27 = v24 + v15 + v11 + v26;
        v28 = v22[2];
        v29 = v22[3];
        v30 = v22[1];
        v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        v31 = v13 + v20;
        v32 = *(v22 - 2);
        v33 = *(v22 - 1);
        v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        v35 = v34 + v20 + v33;
        v36 = v34 + v26 + v32;
        v15 = v36 + v33;
        v37 = __ROR8__(v36, 44) + v34;
        v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        v16 = v37 + __ROR8__(v35 + v38, 21);
        v39 = v24 + v21 + *v22;
        v20 = v39 + v30 + v28 + v29;
        v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        v13 = v38;
        v25 += 64;
      }
      while (v25);
      v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (a2 < 9)
  {
    if (a2 < 4)
    {
      result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    v3 = *(_QWORD *)((char *)a1 + a2 - 8);
    v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = a1[1];
  v3 = 0xB492B66FBE98F273 * *a1;
  v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8);
  v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(_QWORD *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](_QWORD *a1, uint64_t a2)
{
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
  uint64_t v12;
  unint64_t v13;

  v2 = *(_QWORD *)((char *)a1 + a2 - 16);
  v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  v5 = a1[2];
  v4 = a1[3];
  v6 = __ROR8__(v3 + v4, 52);
  v7 = v3 + a1[1];
  v8 = __ROR8__(v7, 7);
  v9 = v7 + v5;
  v10 = *(_QWORD *)((char *)a1 + a2 - 32) + v5;
  v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  v12 = *(_QWORD *)((char *)a1 + a2 - 24) + v10 + v2;
  v13 = 0xC3A5C85C97CB3127 * (v12 + *(_QWORD *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  BOOL v14;
  uint64_t result;

  v3 = a3;
  v4 = a2[23];
  if ((v4 & 0x80u) == 0)
    v5 = a2[23];
  else
    v5 = *((_QWORD *)a2 + 1);
  v6 = a3[23];
  v7 = (char)v6;
  if ((v6 & 0x80u) != 0)
    v6 = *((_QWORD *)a3 + 1);
  if (v5 != v6)
    return 0;
  if (v7 < 0)
    v3 = *(unsigned __int8 **)a3;
  if ((v4 & 0x80) != 0)
    return memcmp(*(const void **)a2, v3, *((_QWORD *)a2 + 1)) == 0;
  if (!a2[23])
    return 1;
  v8 = v4 - 1;
  do
  {
    v10 = *a2++;
    v9 = v10;
    v12 = *v3++;
    v11 = v12;
    v14 = v8-- != 0;
    result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void std::__tree<std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<NSString * const {__strong},std::unique_ptr<StateMachine::State>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<NSString * const {__strong},std::unique_ptr<StateMachine::State>>,0>(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 8);
  v2 = (_QWORD *)(a1 + 8);
  v3 = v4;
  *v2 = 0;
  if (v4)
    std::default_delete<StateMachine::State>::operator()[abi:ne180100]((uint64_t)v2, v3);

}

void std::default_delete<StateMachine::State>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v3;

  if (a2)
  {
    std::__hash_table<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>>>::~__hash_table(a2 + 32);
    v3 = *(void **)(a2 + 8);
    if (v3)
    {
      *(_QWORD *)(a2 + 16) = v3;
      operator delete(v3);
    }
    JUMPOUT(0x2495360E8);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::vector<StateMachine::TransitionPoint>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::vector<StateMachine::TransitionPoint>>,0>(uint64_t a1)
{
  void **v2;

  v2 = (void **)(a1 + 24);
  std::vector<StateMachine::TransitionPoint>::__destroy_vector::operator()[abi:ne180100](&v2);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  unsigned __int8 **v14;
  unsigned __int8 *i;
  unint64_t v16;
  _QWORD *v17;
  __int128 *v18;
  __int128 v19;
  float v20;
  float v21;
  _BOOL8 v22;
  unint64_t v23;
  unint64_t v24;
  size_t v25;
  _QWORD *v26;
  unint64_t v27;
  _QWORD v29[2];
  char v30;

  v8 = (_QWORD *)(a1 + 24);
  v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(unsigned __int8 **)i)
      {
        v16 = *((_QWORD *)i + 1);
        if (v16 == v10)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11)
              v16 %= v11;
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4)
            break;
        }
      }
    }
  }
  v17 = operator new(0x40uLL);
  v29[0] = v17;
  v29[1] = a1 + 16;
  *v17 = 0;
  v17[1] = v10;
  v18 = *a4;
  v19 = **a4;
  v17[4] = *((_QWORD *)*a4 + 2);
  *((_OWORD *)v17 + 1) = v19;
  *((_QWORD *)v18 + 1) = 0;
  *((_QWORD *)v18 + 2) = 0;
  *(_QWORD *)v18 = 0;
  v17[6] = 0;
  v17[7] = 0;
  v17[5] = 0;
  v30 = 1;
  v20 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v21 = *(float *)(a1 + 32);
  if (!v11 || (float)(v21 * (float)v11) < v20)
  {
    v22 = 1;
    if (v11 >= 3)
      v22 = (v11 & (v11 - 1)) != 0;
    v23 = v22 | (2 * v11);
    v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24)
      v25 = v24;
    else
      v25 = v23;
    std::__hash_table<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>>>::__rehash<true>(a1, v25);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v26 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v26)
  {
    *(_QWORD *)v29[0] = *v26;
    *v26 = v29[0];
  }
  else
  {
    *(_QWORD *)v29[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v29[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v29[0])
    {
      v27 = *(_QWORD *)(*(_QWORD *)v29[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v27 >= v11)
          v27 %= v11;
      }
      else
      {
        v27 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v27) = v29[0];
    }
  }
  i = (unsigned __int8 *)v29[0];
  v29[0] = 0;
  ++*v8;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,void *>>>>::reset[abi:ne180100]((uint64_t)v29, 0);
  return i;
}

void sub_2454DB10C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::vector<StateMachine::TransitionPoint>>,0>((uint64_t)v2 + 16);
    operator delete(v2);
  }
}

uint64_t *std::__tree<std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>>>::__emplace_unique_key_args<NSString * {__strong},std::piecewise_construct_t const&,std::tuple<NSString * const {__strong}&>,std::tuple<>>(uint64_t **a1, unint64_t *a2, uint64_t a3, id **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  uint64_t **v8;
  uint64_t **v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  _QWORD v14[2];
  char v15;

  v7 = a1 + 1;
  v6 = a1[1];
  v8 = a1 + 1;
  v9 = a1 + 1;
  if (v6)
  {
    v10 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v11 = v6[4];
        if (v10 >= v11)
          break;
        v6 = *v9;
        v8 = v9;
        if (!*v9)
          goto LABEL_9;
      }
      if (v11 >= v10)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v8 = v9 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v12 = (uint64_t *)operator new(0x30uLL);
    v14[1] = v7;
    v12[4] = (uint64_t)**a4;
    v12[5] = 0;
    v15 = 1;
    std::__tree<std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>>>::__insert_node_at(a1, (uint64_t)v9, v8, v12);
    v14[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>,void *>>>>::reset[abi:ne180100]((uint64_t)v14, 0);
    return v12;
  }
  return (uint64_t *)v9;
}

uint64_t *std::__tree<std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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

void std::unique_ptr<std::__tree_node<std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<NSString * const {__strong},std::unique_ptr<StateMachine::State>>,0>((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

id xnu_log(void)
{
  if (xnu_log(void)::token != -1)
    dispatch_once(&xnu_log(void)::token, &__block_literal_global);
  return (id)xnu_log(void)::xnu_log;
}

void ___Z7xnu_logv_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SILManager", "SILManager");
  v1 = (void *)xnu_log(void)::xnu_log;
  xnu_log(void)::xnu_log = (uint64_t)v0;

}

_QWORD *SILManagerCreate(void *a1)
{
  uint64_t v2;
  _QWORD *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t SILServerClient;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t Renderer;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t v24[16];

  v2 = indicators_manifest();
  v3 = 0;
  if (a1 && v2)
  {
    v4 = a1;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SimulatorLayerID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SimulatorFramebuffer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pointerValue");

    xnu_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_2454D6000, v7, OS_LOG_TYPE_INFO, "Creating SIL Manager...", v24, 2u);
    }

    SILServerClient = SILServer_createSILServerClient();
    if ((_DWORD)SILServerClient)
    {
      xnu_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        SILManagerCreate_cold_2(SILServerClient, v9, v10, v11, v12, v13, v14, v15);
    }
    else
    {
      Renderer = SILServer_createRenderer();
      if (!(_DWORD)Renderer)
      {
        v3 = (_QWORD *)operator new();
        *v3 = SILServer_swap;
        v3[1] = SILServer_setPower;
        v3[3] = SILServer_turnOffIndicators;
        goto LABEL_12;
      }
      xnu_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        SILManagerCreate_cold_1(Renderer, v9, v17, v18, v19, v20, v21, v22);
    }

    v3 = 0;
LABEL_12:

  }
  return v3;
}

void sub_2454DB99C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t indicators_manifest(void)
{
  uint64_t result;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  __int128 v19;
  int v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  BOOL v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  unsigned int v33;
  unsigned int v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id *v40;
  id *v41;
  NSObject *v42;
  int v43;
  NSDictionary *v44;
  _QWORD *v45;
  uint64_t v46;
  unsigned int k;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  int v52;
  float v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  NSObject *v58;
  uint64_t v59;
  unsigned int v60;
  id v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  __int128 v76;
  void *context;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  id obj;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  id v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t i;
  id v91;
  unsigned int v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[32];
  int v102;
  __int128 v103;
  unint64_t v104;
  _DWORD *v105;
  __int16 v106;
  void *v107;
  __int16 v108;
  void *v109;
  __int16 v110;
  uint64_t v111;
  _BYTE buf[48];
  __int128 v113;
  uint64_t v114;
  _BYTE v115[128];
  _BYTE v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x24BDAC8D0];
  result = indicators_manifest(void)::g_manifest;
  if (!indicators_manifest(void)::g_manifest)
  {
    context = (void *)MEMORY[0x249536208]();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SILManager"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "URLsForResourcesWithExtension:subdirectory:", CFSTR(".plist"), 0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v1, "mutableCopy");

    v79 = v2;
    if (objc_msgSend(v2, "count"))
    {
      objc_msgSend(v2, "sortUsingComparator:", &__block_literal_global_15);
      v3 = v81;
      objc_msgSend(v3, "URLsForResourcesWithExtension:subdirectory:", CFSTR(".silignore"), 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "count"))
      {
        if ((unint64_t)objc_msgSend(v4, "count") >= 2)
        {
          xnu_log();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "absoluteString");
            v75 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = objc_msgSend(v75, "UTF8String");
            _os_log_error_impl(&dword_2454D6000, v5, OS_LOG_TYPE_ERROR, "Multiple sil ignore file found. Arbitrarily choosing %s", buf, 0xCu);

          }
        }
        v6 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringWithContentsOfURL:encoding:error:", v7, 4, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", v9);
        v87 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v87 = 0;
      }

      v103 = 0uLL;
      v104 = 0;
      memset(v101, 0, sizeof(v101));
      v102 = 1065353216;
      v97 = 0u;
      v98 = 0u;
      v99 = 0u;
      v100 = 0u;
      obj = v79;
      v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v116, 16);
      if (v83)
      {
        v84 = *(_QWORD *)v98;
        v20 = 3;
        *(_QWORD *)&v19 = 67109634;
        v76 = v19;
        do
        {
          for (i = 0; i != v83; ++i)
          {
            if (*(_QWORD *)v98 != v84)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
            if (v87)
            {
              objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * i), "lastPathComponent");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v87, "indexOfObject:", v22) == 0x7FFFFFFFFFFFFFFFLL;

              if (!v23)
                continue;
            }
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", v21, v76);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("indicators"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v85)
              v25 = v24 == 0;
            else
              v25 = 1;
            v26 = v24;
            if (!v25 && objc_msgSend(v24, "count"))
            {
              objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("uuid"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v80 = v21;
              v78 = v26;
              v28 = v27 == 0;

              if (!v28)
              {
                v95 = 0u;
                v96 = 0u;
                v93 = 0u;
                v94 = 0u;
                v86 = v78;
                v29 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v93, v115, 16);
                if (!v29)
                  goto LABEL_72;
                v89 = *(_QWORD *)v94;
                while (1)
                {
                  v88 = v29;
                  for (j = 0; j != v88; ++j)
                  {
                    if (*(_QWORD *)v94 != v89)
                      objc_enumerationMutation(v86);
                    v31 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * j);
                    v92 = 0;
                    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("type"));
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    v33 = objc_msgSend(v32, "unsignedIntValue");

                    if (v33 == -1)
                      v34 = v20;
                    else
                      v34 = v33;
                    if (v33 == -1)
                      ++v20;
                    v92 = v34;
                    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("name"));
                    v91 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("extent"));
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    v36 = objc_msgSend(v35, "unsignedIntValue");

                    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("frames"));
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("sensor_category"));
                    v38 = objc_claimAutoreleasedReturnValue();
                    v39 = (void *)v38;
                    if (!v36 || !v37 || !v91 || !v38)
                    {
                      xnu_log();
                      v42 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 67109888;
                        *(_DWORD *)&buf[4] = v92;
                        *(_WORD *)&buf[8] = 1024;
                        *(_DWORD *)&buf[10] = v36;
                        *(_WORD *)&buf[14] = 2048;
                        *(_QWORD *)&buf[16] = v37;
                        *(_WORD *)&buf[24] = 2048;
                        *(_QWORD *)&buf[26] = v91;
                        _os_log_error_impl(&dword_2454D6000, v42, OS_LOG_TYPE_ERROR, "Invalid indicator info with type: %u extent: %u frames: %p name: %p", buf, 0x22u);
                      }
                      goto LABEL_46;
                    }
                    v105 = &v92;
                    v40 = (id *)std::__hash_table<std::__hash_value_type<unsigned int,NSURL * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,NSURL * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,NSURL * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,NSURL * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)v101, &v92, (uint64_t)&std::piecewise_construct, &v105);
                    v41 = v40 + 3;
                    if (v40[3])
                    {
                      xnu_log();
                      v42 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                      {
                        v60 = v92;
                        objc_msgSend(*v41, "absoluteString");
                        v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                        v62 = objc_msgSend(v61, "UTF8String");
                        objc_msgSend(v80, "absoluteString");
                        v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                        v64 = objc_msgSend(v63, "UTF8String");
                        *(_DWORD *)buf = v76;
                        *(_DWORD *)&buf[4] = v60;
                        *(_WORD *)&buf[8] = 2080;
                        *(_QWORD *)&buf[10] = v62;
                        *(_WORD *)&buf[18] = 2080;
                        *(_QWORD *)&buf[20] = v64;
                        _os_log_error_impl(&dword_2454D6000, v42, OS_LOG_TYPE_ERROR, "Duplicate indiactor %u from %s and %s", buf, 0x1Cu);

                      }
LABEL_46:

                      v43 = 1;
                      goto LABEL_47;
                    }
                    objc_storeStrong(v40 + 3, v80);
                    *(_DWORD *)buf = v92;
                    *(_DWORD *)&buf[4] = 0;
                    *(_DWORD *)&buf[8] = v36;
                    memset(&buf[16], 0, 32);
                    std::string::basic_string[abi:ne180100]<0>(&v113, (char *)objc_msgSend(objc_retainAutorelease(v91), "UTF8String"));
                    *(_DWORD *)&buf[4] = objc_msgSend(v39, "unsignedIntValue");
                    std::vector<IndicatorsManifest::Frame>::resize((uint64_t)&buf[16], objc_msgSend(v37, "count"));
                    v45 = StateMachine::Manifest::create((StateMachine::Manifest *)v31, v44);
                    v46 = *(_QWORD *)&buf[40];
                    *(_QWORD *)&buf[40] = v45;
                    if (v46)
                      std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100]((uint64_t)&buf[40], v46);
                    for (k = 0; ; ++k)
                    {
                      if (objc_msgSend(v37, "count") <= (unint64_t)k)
                      {
                        v54 = *((_QWORD *)&v103 + 1);
                        if (*((_QWORD *)&v103 + 1) >= v104)
                        {
                          v57 = std::vector<IndicatorsManifest::Indicator>::__push_back_slow_path<IndicatorsManifest::Indicator>((uint64_t *)&v103, (uint64_t *)buf);
                        }
                        else
                        {
                          v55 = *(_QWORD *)buf;
                          *(_DWORD *)(*((_QWORD *)&v103 + 1) + 8) = *(_DWORD *)&buf[8];
                          *(_QWORD *)v54 = v55;
                          *(_QWORD *)(v54 + 24) = 0;
                          *(_QWORD *)(v54 + 32) = 0;
                          *(_QWORD *)(v54 + 16) = 0;
                          *(_OWORD *)(v54 + 16) = *(_OWORD *)&buf[16];
                          *(_QWORD *)(v54 + 32) = *(_QWORD *)&buf[32];
                          memset(&buf[16], 0, 32);
                          *(_QWORD *)(v54 + 40) = *(_QWORD *)&buf[40];
                          v56 = v113;
                          *(_QWORD *)(v54 + 64) = v114;
                          *(_OWORD *)(v54 + 48) = v56;
                          v114 = 0;
                          v113 = 0uLL;
                          v57 = v54 + 72;
                        }
                        v43 = 0;
                        *((_QWORD *)&v103 + 1) = v57;
                        goto LABEL_65;
                      }
                      objc_msgSend(v37, "objectAtIndexedSubscript:", k);
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("time"));
                      v49 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("size"));
                      v50 = objc_claimAutoreleasedReturnValue();
                      v51 = (void *)v50;
                      if (!v48)
                        break;
                      if (!(v49 | v50))
                      {
                        v51 = 0;
                        v49 = 0;
                        break;
                      }
                      objc_msgSend((id)v49, "floatValue");
                      *(_DWORD *)(*(_QWORD *)&buf[16] + 8 * k) = v52;
                      objc_msgSend(v51, "floatValue");
                      *(_DWORD *)(*(_QWORD *)&buf[16] + 8 * k + 4) = v53;

                    }
                    xnu_log();
                    v58 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
                    {
                      v105 = (_DWORD *)__PAIR64__(k, 67109888);
                      v106 = 2048;
                      v107 = v48;
                      v108 = 2048;
                      v109 = v51;
                      v110 = 2048;
                      v111 = v49;
                      _os_log_error_impl(&dword_2454D6000, v58, OS_LOG_TYPE_ERROR, "Invalid frame info for frame %u : info %p size %p time %p", (uint8_t *)&v105, 0x26u);
                    }

                    v43 = 1;
LABEL_65:
                    if (SHIBYTE(v114) < 0)
                      operator delete((void *)v113);
                    v59 = *(_QWORD *)&buf[40];
                    *(_QWORD *)&buf[40] = 0;
                    if (v59)
                      std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100]((uint64_t)&buf[40], v59);
                    if (*(_QWORD *)&buf[16])
                    {
                      *(_QWORD *)&buf[24] = *(_QWORD *)&buf[16];
                      operator delete(*(void **)&buf[16]);
                    }
LABEL_47:

                    if (v43)
                    {

                      goto LABEL_80;
                    }
                  }
                  v29 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v93, v115, 16);
                  if (!v29)
                  {
LABEL_72:

                    v26 = v86;
                    goto LABEL_74;
                  }
                }
              }
              v26 = v78;
            }
LABEL_74:

          }
          v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v116, 16);
        }
        while (v83);
      }

      if ((_QWORD)v103 == *((_QWORD *)&v103 + 1))
      {
        xnu_log();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          indicators_manifest(v66, v67, v68, v69, v70, v71, v72, v73);

LABEL_80:
        v18 = 1;
      }
      else
      {
        std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *,false>((uint64_t *)v103, *((uint64_t **)&v103 + 1), (uint64_t)&v105, 126 - 2 * __clz(0x8E38E38E38E38E39 * ((uint64_t)(*((_QWORD *)&v103 + 1) - v103) >> 3)), 1);
        v65 = operator new();
        v18 = 0;
        *(_OWORD *)v65 = v103;
        *(_QWORD *)(v65 + 16) = v104;
        v104 = 0;
        v103 = 0uLL;
        indicators_manifest(void)::g_manifest = v65;
      }
      std::__hash_table<std::__hash_value_type<unsigned int,NSURL * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,NSURL * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,NSURL * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,NSURL * {__strong}>>>::~__hash_table((uint64_t)v101);
      *(_QWORD *)buf = &v103;
      std::vector<IndicatorsManifest::Indicator>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    }
    else
    {
      xnu_log();
      v10 = objc_claimAutoreleasedReturnValue();
      v87 = v10;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        indicators_manifest(v10, v11, v12, v13, v14, v15, v16, v17);
      v18 = 1;
    }

    objc_autoreleasePoolPop(context);
    if (v18)
      return 0;
    else
      return indicators_manifest(void)::g_manifest;
  }
  return result;
}

void sub_2454DC42C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,void **a63)
{

  std::__hash_table<std::__hash_value_type<unsigned int,NSURL * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,NSURL * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,NSURL * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,NSURL * {__strong}>>>::~__hash_table((uint64_t)&a47);
  a63 = (void **)&a53;
  std::vector<IndicatorsManifest::Indicator>::__destroy_vector::operator()[abi:ne180100](&a63);

  _Unwind_Resume(a1);
}

BOOL SILManagerSetLogLevel()
{
  return SILServer_setLogLevel() == 0;
}

uint64_t SILManagerSetDisplaySize()
{
  return 0;
}

BOOL SILManagerSetPower(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  NSObject *v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  xnu_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = a2;
    _os_log_impl(&dword_2454D6000, v4, OS_LOG_TYPE_INFO, "SILManagerSetPower %u", (uint8_t *)v8, 8u);
  }

  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(a2, 1);
  if (v5)
  {
    xnu_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      SILManagerSetPower_cold_1(a2, v6);

  }
  return v5 == 0;
}

BOOL SILManagerTrySetPower(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  xnu_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_2454D6000, v4, OS_LOG_TYPE_INFO, "SILManagerTrySetPower %u", (uint8_t *)v6, 8u);
  }

  return (*(unsigned int (**)(uint64_t, _QWORD))(a1 + 8))(a2, 0) == 0;
}

BOOL SILManagerSwap(uint64_t (**a1)(_QWORD, _QWORD, _QWORD, uint64_t *, double, double, float, float), float *a2)
{
  int v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v14;
  int v15;
  int v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v20 = 0;
  v3 = (*a1)(*(unsigned __int8 *)a2, *((unsigned int *)a2 + 1), *((unsigned __int16 *)a2 + 12), &v20, a2[2], a2[3], a2[4], a2[5]);
  v4 = v3;
  if (v3)
  {
    if (v3 == 9)
    {
      xnu_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        SILManagerSwap_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    else
    {
      xnu_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v14 = *(unsigned __int8 *)a2;
        v15 = *((_DWORD *)a2 + 1);
        v16 = *((unsigned __int16 *)a2 + 12);
        v17 = a2[2];
        v18 = a2[3];
        v19 = a2[5];
        *(_DWORD *)buf = 67110656;
        v22 = v14;
        v23 = 1024;
        v24 = v15;
        v25 = 1024;
        v26 = v16;
        v27 = 2048;
        v28 = v17;
        v29 = 2048;
        v30 = v18;
        v31 = 2048;
        v32 = v19;
        v33 = 1024;
        v34 = v4;
        _os_log_error_impl(&dword_2454D6000, v5, OS_LOG_TYPE_ERROR, "SILManager failed to swap region %u with indicator %u, frame %u at [%fx%f] opacity %f err : 0x%x", buf, 0x38u);
      }
    }

  }
  return v4 == 0;
}

BOOL SILManagerTurnOffRegions(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  if (!(_DWORD)a2)
    return 0;
  v4 = 0;
  return (*(unsigned int (**)(uint64_t, uint64_t, uint64_t *))(a1 + 24))(a2, a3, &v4) != 0;
}

uint64_t indicator_type_from_name(const char *a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  size_t v5;
  uint64_t i;
  uint64_t v7;
  int v8;
  const void *v9;
  uint64_t v10;

  v2 = (uint64_t *)indicators_manifest();
  if (!v2)
    return 0xFFFFFFFFLL;
  v4 = *v2;
  v3 = v2[1];
  if (*v2 == v3)
    return 0xFFFFFFFFLL;
  v5 = strlen(a1);
  for (i = v4 + 48; ; i += 72)
  {
    v7 = *(unsigned __int8 *)(i + 23);
    v8 = (char)v7;
    if ((v7 & 0x80u) != 0)
      v7 = *(_QWORD *)(i + 8);
    if (v7 == v5)
    {
      v9 = v8 >= 0 ? (const void *)i : *(const void **)i;
      if (!memcmp(v9, a1, v5))
        break;
    }
    v10 = i + 24;
    if (v10 == v3)
      return 0xFFFFFFFFLL;
  }
  return *(unsigned int *)(i - 48);
}

char *SILManagerIndicatorNameFromType(unsigned int a1)
{
  char *result;
  char *v2;

  result = indicators_manifest_for_type(a1);
  if (result)
  {
    v2 = result;
    result += 48;
    if (v2[71] < 0)
      return *(char **)result;
  }
  return result;
}

char *indicators_manifest_for_type(unsigned int a1)
{
  _DWORD **v2;
  _DWORD **v3;
  char *result;
  char *v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  char *v9;
  unsigned int v10;

  v2 = (_DWORD **)indicators_manifest();
  if (!v2)
    return 0;
  v3 = v2;
  result = (char *)*v2;
  v5 = (char *)v3[1];
  if (v5 != result)
  {
    v6 = 0x8E38E38E38E38E39 * ((v5 - result) >> 3);
    do
    {
      v7 = v6 >> 1;
      v8 = &result[72 * (v6 >> 1)];
      v10 = *(_DWORD *)v8;
      v9 = v8 + 72;
      v6 += ~(v6 >> 1);
      if (v10 < a1)
        result = v9;
      else
        v6 = v7;
    }
    while (v6);
  }
  if (result == v5 || *(_DWORD *)result != a1)
    return 0;
  return result;
}

uint64_t SILManagerFrameNumberFromBounds(unsigned int a1, float *a2)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = indicators_manifest_for_type(a1);
  if (!v3 || (v5 = *((_QWORD *)v3 + 2), v4 = *((_QWORD *)v3 + 3), v5 == v4))
    LOWORD(v6) = -1;
  else
    return (unsigned __int16)((unint64_t)(IndicatorsManifest::closest_frame_for_extent(*((_QWORD *)v3 + 2), v4, *a2)- v5) >> 3);
  return (unsigned __int16)v6;
}

uint64_t IndicatorsManifest::closest_frame_for_extent(uint64_t result, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  float v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a2;
  if (a2 != result)
  {
    v4 = (a2 - result) >> 3;
    v3 = result;
    do
    {
      v5 = v4 >> 1;
      v6 = v3 + 8 * (v4 >> 1);
      v7 = (float)a3 - (float)*(unsigned int *)(v6 + 4);
      v8 = v6 + 8;
      v4 += ~(v4 >> 1);
      if (v7 < 0.0)
        v4 = v5;
      else
        v3 = v8;
    }
    while (v4);
  }
  if (v3 != result)
  {
    if (v3 == a2)
    {
      return a2 - 8;
    }
    else
    {
      if ((float)((float)*(unsigned int *)(v3 + 4) - (float)a3) < (float)((float)*(unsigned int *)(v3 - 4) - (float)a3))
        v9 = 0;
      else
        v9 = -1;
      return v3 + 8 * v9;
    }
  }
  return result;
}

char *SILManagerIndicatorExtent(unsigned int a1)
{
  char *result;

  result = indicators_manifest_for_type(a1);
  if (result)
    return (char *)*((unsigned int *)result + 2);
  return result;
}

uint64_t SILManagerIndicatorFrameExtent(unsigned int a1, unsigned int a2, _DWORD *a3)
{
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = indicators_manifest_for_type(a1);
  if (!v5)
  {
    LODWORD(v6) = 0;
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = (*((_QWORD *)v5 + 3) - *((_QWORD *)v5 + 2)) >> 3;
  if (a3)
LABEL_3:
    *a3 = v6;
LABEL_4:
  v7 = 0;
  if (v5 && v6 > a2)
    return *(unsigned int *)(*((_QWORD *)v5 + 2) + 8 * a2 + 4);
  return v7;
}

uint64_t ___Z19indicators_manifestv_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v6);

  return v7;
}

void sub_2454DCD0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void std::vector<IndicatorsManifest::Frame>::resize(uint64_t a1, unint64_t a2)
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
    std::vector<IndicatorsManifest::Frame>::__append((void **)a1, a2 - v2);
  }
}

void IndicatorsManifest::Indicator::~Indicator(void **this)
{
  uint64_t v2;
  void *v3;

  if (*((char *)this + 71) < 0)
    operator delete(this[6]);
  v2 = (uint64_t)this[5];
  this[5] = 0;
  if (v2)
    std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100]((uint64_t)(this + 5), v2);
  v3 = this[2];
  if (v3)
  {
    this[3] = v3;
    operator delete(v3);
  }
}

float *IndicatorsManifest::closest_frame_for_time(float *result, float *a2, float a3)
{
  float *v3;
  unint64_t v4;
  unint64_t v5;
  float *v6;
  float *v7;
  float v8;

  v3 = a2;
  if (a2 != result)
  {
    v4 = ((char *)a2 - (char *)result) >> 3;
    v3 = result;
    do
    {
      v5 = v4 >> 1;
      v6 = &v3[2 * (v4 >> 1)];
      v8 = *v6;
      v7 = v6 + 2;
      v4 += ~(v4 >> 1);
      if ((float)(a3 - v8) < 0.0)
        v4 = v5;
      else
        v3 = v7;
    }
    while (v4);
  }
  if (v3 != result)
  {
    if (v3 == a2)
    {
      return a2 - 2;
    }
    else if ((float)(*v3 - a3) >= (float)(*(v3 - 2) - a3))
    {
      return v3 - 2;
    }
    else
    {
      return v3;
    }
  }
  return result;
}

void std::vector<IndicatorsManifest::Frame>::__append(void **a1, unint64_t a2)
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
      std::vector<StateMachine::TransitionPoint::Range>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 3;
    v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 2 > v9)
      v9 = v11 >> 2;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<StateMachine::TransitionPoint::Range>>(v4, v12);
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

uint64_t std::vector<IndicatorsManifest::Indicator>::__push_back_slow_path<IndicatorsManifest::Indicator>(uint64_t *a1, uint64_t *a2)
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
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  _QWORD v17[5];

  v3 = *a1;
  v4 = 0x8E38E38E38E38E39 * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0x38E38E38E38E38ELL)
    std::vector<StateMachine::TransitionPoint::Range>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0x8E38E38E38E38E39 * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x1C71C71C71C71C7)
    v9 = 0x38E38E38E38E38ELL;
  else
    v9 = v5;
  v17[4] = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<IndicatorsManifest::Indicator>>(v7, v9);
  else
    v10 = 0;
  v11 = &v10[72 * v4];
  v17[0] = v10;
  v17[1] = v11;
  v17[3] = &v10[72 * v9];
  v12 = *a2;
  *((_DWORD *)v11 + 2) = *((_DWORD *)a2 + 2);
  *(_QWORD *)v11 = v12;
  *((_QWORD *)v11 + 2) = 0;
  *(_OWORD *)(v11 + 24) = 0u;
  *((_OWORD *)v11 + 1) = *((_OWORD *)a2 + 1);
  *((_QWORD *)v11 + 4) = a2[4];
  v13 = a2[5];
  *((_OWORD *)a2 + 1) = 0u;
  *((_OWORD *)a2 + 2) = 0u;
  *((_QWORD *)v11 + 5) = v13;
  v14 = *((_OWORD *)a2 + 3);
  *((_QWORD *)v11 + 8) = a2[8];
  *((_OWORD *)v11 + 3) = v14;
  a2[7] = 0;
  a2[8] = 0;
  a2[6] = 0;
  v17[2] = v11 + 72;
  std::vector<IndicatorsManifest::Indicator>::__swap_out_circular_buffer(a1, v17);
  v15 = a1[1];
  std::__split_buffer<IndicatorsManifest::Indicator>::~__split_buffer((uint64_t)v17);
  return v15;
}

void sub_2454DD07C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<IndicatorsManifest::Indicator>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *std::vector<IndicatorsManifest::Indicator>::__swap_out_circular_buffer(uint64_t *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *result;
  v2 = result[1];
  v4 = a2[1];
  if (v2 != *result)
  {
    do
    {
      v5 = *(_QWORD *)(v2 - 72);
      v2 -= 72;
      v6 = *(_DWORD *)(v2 + 8);
      *(_QWORD *)(v4 - 72) = v5;
      v4 -= 72;
      *(_DWORD *)(v4 + 8) = v6;
      *(_QWORD *)(v4 + 16) = 0;
      *(_OWORD *)(v4 + 24) = 0uLL;
      *(_OWORD *)(v4 + 16) = *(_OWORD *)(v2 + 16);
      *(_QWORD *)(v4 + 32) = *(_QWORD *)(v2 + 32);
      v7 = *(_QWORD *)(v2 + 40);
      *(_OWORD *)(v2 + 16) = 0uLL;
      *(_OWORD *)(v2 + 32) = 0uLL;
      *(_QWORD *)(v4 + 40) = v7;
      v8 = *(_OWORD *)(v2 + 48);
      *(_QWORD *)(v4 + 64) = *(_QWORD *)(v2 + 64);
      *(_OWORD *)(v4 + 48) = v8;
      *(_QWORD *)(v2 + 56) = 0;
      *(_QWORD *)(v2 + 64) = 0;
      *(_QWORD *)(v2 + 48) = 0;
    }
    while (v2 != v3);
  }
  a2[1] = v4;
  v9 = *result;
  *result = v4;
  a2[1] = v9;
  v10 = result[1];
  result[1] = a2[2];
  a2[2] = v10;
  v11 = result[2];
  result[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<IndicatorsManifest::Indicator>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x38E38E38E38E38FLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(72 * a2);
}

void std::__destroy_at[abi:ne180100]<IndicatorsManifest::Indicator,0>(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (*(char *)(a1 + 71) < 0)
    operator delete(*(void **)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = 0;
  if (v2)
    std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100](a1 + 40, v2);
  v3 = *(void **)(a1 + 16);
  if (v3)
  {
    *(_QWORD *)(a1 + 24) = v3;
    operator delete(v3);
  }
}

uint64_t std::__split_buffer<IndicatorsManifest::Indicator>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 72;
    std::__destroy_at[abi:ne180100]<IndicatorsManifest::Indicator,0>(i - 72);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *,false>(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  char v21;
  BOOL v22;
  uint64_t *v23;
  unsigned int v24;

LABEL_1:
  v9 = a1;
LABEL_2:
  v10 = 1 - a4;
  while (2)
  {
    a1 = v9;
    v11 = v10;
    v12 = (char *)a2 - (char *)v9;
    v13 = 0x8E38E38E38E38E39 * (a2 - v9);
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        v24 = *((_DWORD *)a2 - 18);
        v23 = a2 - 9;
        if (v24 < *(_DWORD *)v9)
          std::swap[abi:ne180100]<IndicatorsManifest::Indicator>(v9, v23);
        return;
      case 3uLL:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(v9, v9 + 9, a2 - 9);
        return;
      case 4uLL:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(v9, v9 + 9, v9 + 18, a2 - 9);
        return;
      case 5uLL:
        std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(v9, v9 + 9, v9 + 18, v9 + 27, a2 - 9);
        return;
      default:
        if (v12 <= 1727)
        {
          if ((a5 & 1) != 0)
            std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>((uint64_t)v9, (uint64_t)a2);
          else
            std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(v9, a2);
          return;
        }
        if (v11 != 1)
        {
          v14 = v13 >> 1;
          v15 = &v9[9 * (v13 >> 1)];
          if ((unint64_t)v12 < 0x2401)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(v15, v9, a2 - 9);
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(v9, v15, a2 - 9);
            v16 = 9 * v14;
            v17 = &v9[9 * v14 - 9];
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(v9 + 9, v17, a2 - 18);
            v18 = v9 + 18;
            v19 = &v9[v16 + 9];
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(v18, v19, a2 - 27);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(v17, v15, v19);
            std::swap[abi:ne180100]<IndicatorsManifest::Indicator>(a1, v15);
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          if (*((_DWORD *)a1 - 18) >= *(_DWORD *)a1)
          {
            v9 = (uint64_t *)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,IndicatorsManifest::Indicator *,std::__less<void,void> &>((unint64_t)a1, a2);
            goto LABEL_16;
          }
LABEL_11:
          v20 = (uint64_t *)std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,IndicatorsManifest::Indicator *,std::__less<void,void> &>(a1, a2);
          if ((v21 & 1) == 0)
            goto LABEL_14;
          v22 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(a1, v20);
          v9 = v20 + 9;
          if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(v20 + 9, a2))
          {
            v10 = v11 + 1;
            if (v22)
              continue;
LABEL_14:
            std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *,false>(a1, v20, a3, -v11, a5 & 1);
            v9 = v20 + 9;
LABEL_16:
            a5 = 0;
            a4 = -v11;
            goto LABEL_2;
          }
          a4 = -v11;
          a2 = v20;
          if (v22)
            return;
          goto LABEL_1;
        }
        if (v9 != a2)
          std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *,IndicatorsManifest::Indicator *>(v9, a2, a2, a3);
        return;
    }
  }
}

void std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void **v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  void *__p[2];
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;

  if (a1 != a2)
  {
    v34 = v2;
    v35 = v3;
    v6 = a1 + 72;
    if (a1 + 72 != a2)
    {
      v7 = 0;
      v8 = a1;
      do
      {
        v9 = v6;
        if (*(_DWORD *)(v8 + 72) < *(_DWORD *)v8)
        {
          v27 = *(_QWORD *)v6;
          v28 = *(_DWORD *)(v6 + 8);
          *(_OWORD *)__p = *(_OWORD *)(v8 + 88);
          *(_QWORD *)(v8 + 88) = 0;
          *(_QWORD *)(v8 + 96) = 0;
          v10 = *(_QWORD *)(v8 + 104);
          v11 = *(_QWORD *)(v8 + 112);
          *(_QWORD *)(v8 + 104) = 0;
          *(_QWORD *)(v8 + 112) = 0;
          v30 = v10;
          v31 = v11;
          v12 = *(_OWORD *)(v8 + 120);
          v33 = *(void **)(v8 + 136);
          v32 = v12;
          *(_QWORD *)(v8 + 120) = 0;
          *(_QWORD *)(v8 + 128) = 0;
          v13 = v7;
          *(_QWORD *)(v8 + 136) = 0;
          while (1)
          {
            v14 = a1 + v13;
            *(_QWORD *)(v14 + 72) = *(_QWORD *)(a1 + v13);
            *(_DWORD *)(v14 + 80) = *(_DWORD *)(a1 + v13 + 8);
            std::vector<IndicatorsManifest::Frame>::__move_assign(a1 + v13 + 88, (__n128 *)(a1 + v13 + 16));
            v15 = *(_QWORD *)(a1 + v13 + 112);
            v16 = *(_QWORD *)(a1 + v13 + 40);
            *(_QWORD *)(v14 + 40) = 0;
            *(_QWORD *)(v14 + 112) = v16;
            if (v15)
              std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100](a1 + v13 + 112, v15);
            v17 = v14 + 120;
            if (*(char *)(v14 + 143) < 0)
              operator delete(*(void **)v17);
            v18 = a1 + v13;
            *(_OWORD *)v17 = *(_OWORD *)(a1 + v13 + 48);
            *(_QWORD *)(v17 + 16) = *(_QWORD *)(a1 + v13 + 64);
            *(_BYTE *)(v18 + 71) = 0;
            *(_BYTE *)(v18 + 48) = 0;
            if (!v13)
              break;
            v13 -= 72;
            if (v27 >= *(_DWORD *)(v18 - 72))
            {
              v19 = a1 + v13 + 72;
              goto LABEL_14;
            }
          }
          v19 = a1;
LABEL_14:
          *(_QWORD *)v19 = v27;
          *(_DWORD *)(v19 + 8) = v28;
          v22 = *(void **)(v18 + 16);
          v21 = (_QWORD *)(v18 + 16);
          v20 = v22;
          if (v22)
          {
            *(_QWORD *)(v19 + 24) = v20;
            operator delete(v20);
            *v21 = 0;
            v21[1] = 0;
            v21[2] = 0;
          }
          *v21 = __p[0];
          v23 = v31;
          *(void **)(v19 + 24) = __p[1];
          *(_QWORD *)(v19 + 32) = v30;
          v31 = 0;
          v24 = *(_QWORD *)(v19 + 40);
          *(_QWORD *)(v19 + 40) = v23;
          if (v24)
            std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100](v19 + 40, v24);
          v25 = (void **)(v21 + 4);
          if (*(char *)(v19 + 71) < 0)
            operator delete(*v25);
          *(_OWORD *)v25 = v32;
          v25[2] = v33;
          HIBYTE(v33) = 0;
          LOBYTE(v32) = 0;
          v26 = v31;
          v31 = 0;
          if (v26)
            std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100]((uint64_t)&v31, v26);
        }
        v6 = v9 + 72;
        v7 += 72;
        v8 = v9;
      }
      while (v9 + 72 != a2);
    }
  }
}

uint64_t *std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v5;
  char *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void **v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void **v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  void *__p[2];
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (result != a2)
  {
    v27 = v2;
    v28 = v3;
    v5 = result + 9;
    if (result + 9 != a2)
    {
      v6 = (char *)result + 143;
      do
      {
        v7 = v5;
        if (*((_DWORD *)result + 18) < *(_DWORD *)result)
        {
          v20 = *v5;
          v21 = *((_DWORD *)v5 + 2);
          *(_OWORD *)__p = *(_OWORD *)(result + 11);
          result[11] = 0;
          result[12] = 0;
          v8 = result[13];
          v9 = result[14];
          result[13] = 0;
          result[14] = 0;
          v23 = v8;
          v24 = v9;
          v10 = *(_OWORD *)(result + 15);
          v26 = result[17];
          v25 = v10;
          result[15] = 0;
          result[16] = 0;
          v11 = v6;
          result[17] = 0;
          do
          {
            *(_QWORD *)(v11 - 71) = *(_QWORD *)(v11 - 143);
            *(_DWORD *)(v11 - 63) = *(_DWORD *)(v11 - 135);
            std::vector<IndicatorsManifest::Frame>::__move_assign((uint64_t)(v11 - 55), (__n128 *)(v11 - 127));
            v12 = *(_QWORD *)(v11 - 31);
            v13 = *(_QWORD *)(v11 - 103);
            *(_QWORD *)(v11 - 103) = 0;
            *(_QWORD *)(v11 - 31) = v13;
            if (v12)
              std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100]((uint64_t)(v11 - 31), v12);
            v14 = (void **)(v11 - 23);
            if (*v11 < 0)
              operator delete(*v14);
            *(_QWORD *)(v11 - 7) = *(_QWORD *)(v11 - 79);
            *(v11 - 72) = 0;
            v11 -= 72;
            *(_OWORD *)v14 = *(_OWORD *)(v11 - 23);
            *(v11 - 23) = 0;
          }
          while (v20 < *(_DWORD *)(v11 - 143));
          v15 = *(void **)(v11 - 55);
          *(_QWORD *)(v11 - 71) = v20;
          *(_DWORD *)(v11 - 63) = v21;
          if (v15)
          {
            *(_QWORD *)(v11 - 47) = v15;
            operator delete(v15);
            *(_QWORD *)(v11 - 55) = 0;
            *(_QWORD *)(v11 - 47) = 0;
            *(_QWORD *)(v11 - 39) = 0;
          }
          *(_OWORD *)(v11 - 55) = *(_OWORD *)__p;
          v16 = v24;
          *(_QWORD *)(v11 - 39) = v23;
          v24 = 0;
          v17 = *(_QWORD *)(v11 - 31);
          *(_QWORD *)(v11 - 31) = v16;
          if (v17)
            std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100]((uint64_t)(v11 - 31), v17);
          v18 = (void **)(v11 - 23);
          if (*v11 < 0)
            operator delete(*v18);
          *(_OWORD *)v18 = v25;
          *(_QWORD *)(v11 - 7) = v26;
          HIBYTE(v26) = 0;
          LOBYTE(v25) = 0;
          v19 = v24;
          v24 = 0;
          if (v19)
            std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100]((uint64_t)&v24, v19);
        }
        v5 = v7 + 9;
        v6 += 72;
        result = v7;
      }
      while (v7 + 9 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  unsigned int v6;
  unsigned int v7;
  uint64_t *v8;
  uint64_t *v9;

  v6 = *(_DWORD *)a2;
  v7 = *(_DWORD *)a3;
  if (*(_DWORD *)a2 < *(_DWORD *)a1)
  {
    if (v7 < v6)
    {
      std::swap[abi:ne180100]<IndicatorsManifest::Indicator>(a1, a3);
      return 1;
    }
    std::swap[abi:ne180100]<IndicatorsManifest::Indicator>(a1, a2);
    if (*(_DWORD *)a3 >= *(_DWORD *)a2)
      return 1;
    v8 = a2;
    v9 = a3;
LABEL_9:
    std::swap[abi:ne180100]<IndicatorsManifest::Indicator>(v8, v9);
    return 2;
  }
  if (v7 < v6)
  {
    std::swap[abi:ne180100]<IndicatorsManifest::Indicator>(a2, a3);
    if (*(_DWORD *)a2 >= *(_DWORD *)a1)
      return 1;
    v8 = a1;
    v9 = a2;
    goto LABEL_9;
  }
  return 0;
}

unint64_t std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,IndicatorsManifest::Indicator *,std::__less<void,void> &>(unint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int v9;
  unint64_t v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void **v18;
  __int128 v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void **v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v27;
  int v28;
  void *__p[2];
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;

  v2 = a2;
  v27 = *(_QWORD *)a1;
  v28 = *(_DWORD *)(a1 + 8);
  v4 = a1 + 16;
  *(_OWORD *)__p = *(_OWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 16) = 0;
  v7 = a1 + 40;
  v6 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  v30 = v5;
  v31 = v6;
  v32 = *(_OWORD *)(a1 + 48);
  v33 = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  if (v27 >= *((_DWORD *)a2 - 18))
  {
    v10 = a1 + 72;
    do
    {
      v8 = v10;
      if (v10 >= (unint64_t)a2)
        break;
      v10 += 72;
    }
    while (v27 >= *(_DWORD *)v8);
  }
  else
  {
    v8 = a1;
    do
    {
      v9 = *(_DWORD *)(v8 + 72);
      v8 += 72;
    }
    while (v27 >= v9);
  }
  if (v8 < (unint64_t)a2)
  {
    do
    {
      v11 = *((_DWORD *)v2 - 18);
      v2 -= 9;
    }
    while (v27 < v11);
  }
  while (v8 < (unint64_t)v2)
  {
    std::swap[abi:ne180100]<IndicatorsManifest::Indicator>((uint64_t *)v8, v2);
    do
    {
      v12 = *(_DWORD *)(v8 + 72);
      v8 += 72;
    }
    while (v27 >= v12);
    do
    {
      v13 = *((_DWORD *)v2 - 18);
      v2 -= 9;
    }
    while (v27 < v13);
  }
  v14 = (uint64_t *)(v8 - 72);
  if (v8 - 72 != a1)
  {
    v15 = *v14;
    *(_DWORD *)(a1 + 8) = *(_DWORD *)(v8 - 64);
    *(_QWORD *)a1 = v15;
    std::vector<IndicatorsManifest::Frame>::__move_assign(v4, (__n128 *)(v8 - 56));
    v16 = *(_QWORD *)(v8 - 32);
    *(_QWORD *)(v8 - 32) = 0;
    v17 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v16;
    if (v17)
      std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100](v7, v17);
    v18 = (void **)(a1 + 48);
    if (*(char *)(a1 + 71) < 0)
      operator delete(*v18);
    v19 = *(_OWORD *)(v8 - 24);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(v8 - 8);
    *(_OWORD *)v18 = v19;
    *(_BYTE *)(v8 - 1) = 0;
    *(_BYTE *)(v8 - 24) = 0;
  }
  *(_DWORD *)(v8 - 64) = v28;
  *v14 = v27;
  v20 = *(void **)(v8 - 56);
  if (v20)
  {
    *(_QWORD *)(v8 - 48) = v20;
    operator delete(v20);
    *(_QWORD *)(v8 - 56) = 0;
    *(_QWORD *)(v8 - 48) = 0;
    *(_QWORD *)(v8 - 40) = 0;
  }
  *(_OWORD *)(v8 - 56) = *(_OWORD *)__p;
  *(_QWORD *)(v8 - 40) = v30;
  v21 = v31;
  v31 = 0;
  v22 = *(_QWORD *)(v8 - 32);
  *(_QWORD *)(v8 - 32) = v21;
  if (v22)
    std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100](v8 - 32, v22);
  v23 = (void **)(v8 - 24);
  if (*(char *)(v8 - 1) < 0)
    operator delete(*v23);
  v24 = v32;
  *(_QWORD *)(v8 - 8) = v33;
  *(_OWORD *)v23 = v24;
  HIBYTE(v33) = 0;
  LOBYTE(v32) = 0;
  v25 = v31;
  v31 = 0;
  if (v25)
    std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100]((uint64_t)&v31, v25);
  return v8;
}

unint64_t std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,IndicatorsManifest::Indicator *,std::__less<void,void> &>(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  unsigned int v10;
  unint64_t v11;
  unsigned int v12;
  unsigned int v13;
  unint64_t v14;
  uint64_t *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void **v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v30;
  int v31;
  void *__p[2];
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;

  v4 = 0;
  v30 = *a1;
  v31 = *((_DWORD *)a1 + 2);
  v5 = (uint64_t)(a1 + 2);
  *(_OWORD *)__p = *((_OWORD *)a1 + 1);
  v6 = a1[4];
  a1[2] = 0;
  v8 = (uint64_t)(a1 + 5);
  v7 = a1[5];
  a1[5] = 0;
  a1[3] = 0;
  a1[4] = 0;
  v33 = v6;
  v34 = v7;
  v9 = a1 + 6;
  v35 = *((_OWORD *)a1 + 3);
  v36 = a1[8];
  a1[7] = 0;
  a1[8] = 0;
  a1[6] = 0;
  do
  {
    v10 = a1[v4 + 9];
    v4 += 9;
  }
  while (v10 < v30);
  v11 = (unint64_t)&a1[v4];
  if (v4 == 9)
  {
    do
    {
      if (v11 >= (unint64_t)a2)
        break;
      v13 = *((_DWORD *)a2 - 18);
      a2 -= 9;
    }
    while (v13 >= v30);
  }
  else
  {
    do
    {
      v12 = *((_DWORD *)a2 - 18);
      a2 -= 9;
    }
    while (v12 >= v30);
  }
  v14 = (unint64_t)&a1[v4];
  if (v11 < (unint64_t)a2)
  {
    v15 = a2;
    do
    {
      std::swap[abi:ne180100]<IndicatorsManifest::Indicator>((uint64_t *)v14, v15);
      do
      {
        v16 = *(_DWORD *)(v14 + 72);
        v14 += 72;
      }
      while (v16 < v30);
      do
      {
        v17 = *((_DWORD *)v15 - 18);
        v15 -= 9;
      }
      while (v17 >= v30);
    }
    while (v14 < (unint64_t)v15);
  }
  v18 = (uint64_t *)(v14 - 72);
  if ((uint64_t *)(v14 - 72) != a1)
  {
    v19 = *v18;
    *((_DWORD *)a1 + 2) = *(_DWORD *)(v14 - 64);
    *a1 = v19;
    std::vector<IndicatorsManifest::Frame>::__move_assign(v5, (__n128 *)(v14 - 56));
    v20 = *(_QWORD *)(v14 - 32);
    *(_QWORD *)(v14 - 32) = 0;
    v21 = a1[5];
    a1[5] = v20;
    if (v21)
      std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100](v8, v21);
    if (*((char *)a1 + 71) < 0)
      operator delete((void *)*v9);
    v22 = *(_OWORD *)(v14 - 24);
    v9[2] = *(_QWORD *)(v14 - 8);
    *(_OWORD *)v9 = v22;
    *(_BYTE *)(v14 - 1) = 0;
    *(_BYTE *)(v14 - 24) = 0;
  }
  *(_DWORD *)(v14 - 64) = v31;
  *v18 = v30;
  v23 = *(void **)(v14 - 56);
  if (v23)
  {
    *(_QWORD *)(v14 - 48) = v23;
    operator delete(v23);
    *(_QWORD *)(v14 - 56) = 0;
    *(_QWORD *)(v14 - 48) = 0;
    *(_QWORD *)(v14 - 40) = 0;
  }
  *(_OWORD *)(v14 - 56) = *(_OWORD *)__p;
  *(_QWORD *)(v14 - 40) = v33;
  v24 = v34;
  v34 = 0;
  v25 = *(_QWORD *)(v14 - 32);
  *(_QWORD *)(v14 - 32) = v24;
  if (v25)
    std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100](v14 - 32, v25);
  v26 = (void **)(v14 - 24);
  if (*(char *)(v14 - 1) < 0)
    operator delete(*v26);
  v27 = v35;
  *(_QWORD *)(v14 - 8) = v36;
  *(_OWORD *)v26 = v27;
  HIBYTE(v36) = 0;
  LOBYTE(v35) = 0;
  v28 = v34;
  v34 = 0;
  if (v28)
    std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100]((uint64_t)&v34, v28);
  return v14 - 72;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4;
  _BOOL8 result;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void **v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  void *__p[2];
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;

  v4 = 0x8E38E38E38E38E39 * (a2 - a1);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      if (*((_DWORD *)a2 - 18) < *(_DWORD *)a1)
      {
        std::swap[abi:ne180100]<IndicatorsManifest::Indicator>(a1, a2 - 9);
        return 1;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(a1, a1 + 9, a2 - 9);
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(a1, a1 + 9, a1 + 18, a2 - 9);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(a1, a1 + 9, a1 + 18, a1 + 27, a2 - 9);
      return 1;
    default:
      v6 = a1 + 18;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(a1, a1 + 9, a1 + 18);
      v7 = a1 + 27;
      if (a1 + 27 == a2)
        return 1;
      v8 = 0;
      v9 = 0;
      break;
  }
  while (1)
  {
    if (*(_DWORD *)v7 < *(_DWORD *)v6)
    {
      v26 = *v7;
      v27 = *((_DWORD *)v7 + 2);
      *(_OWORD *)__p = *((_OWORD *)v7 + 1);
      v7[2] = 0;
      v7[3] = 0;
      v10 = v7[4];
      v11 = v7[5];
      v7[4] = 0;
      v7[5] = 0;
      v29 = v10;
      v30 = v11;
      v31 = *((_OWORD *)v7 + 3);
      v32 = v7[8];
      v7[7] = 0;
      v7[8] = 0;
      v12 = v8;
      v7[6] = 0;
      while (1)
      {
        v13 = (char *)a1 + v12;
        *((_QWORD *)v13 + 27) = *(uint64_t *)((char *)a1 + v12 + 144);
        *((_DWORD *)v13 + 56) = *(_DWORD *)((char *)a1 + v12 + 152);
        std::vector<IndicatorsManifest::Frame>::__move_assign((uint64_t)a1 + v12 + 232, (__n128 *)((char *)a1 + v12 + 160));
        v14 = *(uint64_t *)((char *)a1 + v12 + 184);
        *((_QWORD *)v13 + 23) = 0;
        v15 = *(uint64_t *)((char *)a1 + v12 + 256);
        *((_QWORD *)v13 + 32) = v14;
        if (v15)
          std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100]((uint64_t)(v13 + 256), v15);
        v16 = v13 + 264;
        if (v13[287] < 0)
          operator delete(*(void **)v16);
        v17 = (char *)a1 + v12;
        *(_OWORD *)v16 = *(_OWORD *)((char *)a1 + v12 + 192);
        *((_QWORD *)v16 + 2) = *(uint64_t *)((char *)a1 + v12 + 208);
        v17[215] = 0;
        v17[192] = 0;
        if (v12 == -144)
          break;
        v12 -= 72;
        if (v26 >= *((_DWORD *)v17 + 18))
        {
          v18 = (uint64_t)a1 + v12 + 216;
          goto LABEL_16;
        }
      }
      v18 = (uint64_t)a1;
LABEL_16:
      *(_QWORD *)v18 = v26;
      *(_DWORD *)(v18 + 8) = v27;
      v21 = (void *)*((_QWORD *)v17 + 20);
      v20 = v17 + 160;
      v19 = v21;
      if (v21)
      {
        *(_QWORD *)(v18 + 24) = v19;
        operator delete(v19);
        *v20 = 0;
        v20[1] = 0;
        v20[2] = 0;
      }
      *v20 = __p[0];
      v22 = v30;
      *(void **)(v18 + 24) = __p[1];
      *(_QWORD *)(v18 + 32) = v29;
      v30 = 0;
      v23 = *(_QWORD *)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v22;
      if (v23)
        std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100](v18 + 40, v23);
      v24 = (void **)(v20 + 4);
      if (*(char *)(v18 + 71) < 0)
        operator delete(*v24);
      *(_OWORD *)v24 = v31;
      v20[6] = v32;
      HIBYTE(v32) = 0;
      LOBYTE(v31) = 0;
      v25 = v30;
      v30 = 0;
      if (v25)
        std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100]((uint64_t)&v30, v25);
      if (++v9 == 8)
        return v7 + 9 == a2;
    }
    v6 = v7;
    v8 += 72;
    v7 += 9;
    if (v7 == a2)
      return 1;
  }
}

double std::swap[abi:ne180100]<IndicatorsManifest::Indicator>(uint64_t *a1, uint64_t *a2)
{
  _QWORD *v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void **v11;
  __int128 v12;
  void *v13;
  uint64_t v14;
  void **v15;
  double result;
  __int128 v17;
  uint64_t v18;
  int v19;
  __int128 v20;
  uint64_t v21;

  v18 = *a1;
  v19 = *((_DWORD *)a1 + 2);
  v5 = *((_OWORD *)a1 + 1);
  v4 = a1 + 2;
  v17 = v5;
  v6 = a1[4];
  *v4 = 0;
  a1[3] = 0;
  a1[4] = 0;
  v7 = a1[5];
  a1[5] = 0;
  v20 = *((_OWORD *)a1 + 3);
  v21 = a1[8];
  a1[7] = 0;
  a1[8] = 0;
  a1[6] = 0;
  v8 = *a2;
  *((_DWORD *)a1 + 2) = *((_DWORD *)a2 + 2);
  *a1 = v8;
  std::vector<IndicatorsManifest::Frame>::__move_assign((uint64_t)v4, (__n128 *)a2 + 1);
  v9 = a2[5];
  a2[5] = 0;
  v10 = a1[5];
  a1[5] = v9;
  if (v10)
    std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100]((uint64_t)(a1 + 5), v10);
  v11 = (void **)(a1 + 6);
  if (*((char *)a1 + 71) < 0)
    operator delete(*v11);
  v12 = *((_OWORD *)a2 + 3);
  a1[8] = a2[8];
  *(_OWORD *)v11 = v12;
  *((_BYTE *)a2 + 71) = 0;
  *((_BYTE *)a2 + 48) = 0;
  *a2 = v18;
  *((_DWORD *)a2 + 2) = v19;
  v13 = (void *)a2[2];
  if (v13)
  {
    a2[3] = (uint64_t)v13;
    operator delete(v13);
  }
  *((_OWORD *)a2 + 1) = v17;
  v14 = a2[5];
  a2[4] = v6;
  a2[5] = v7;
  if (v14)
    std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100]((uint64_t)(a2 + 5), v14);
  v15 = (void **)(a2 + 6);
  if (*((char *)a2 + 71) < 0)
    operator delete(*v15);
  result = *(double *)&v20;
  *(_OWORD *)v15 = v20;
  a2[8] = v21;
  return result;
}

__n128 std::vector<IndicatorsManifest::Frame>::__move_assign(uint64_t a1, __n128 *a2)
{
  void *v4;
  __n128 result;

  v4 = *(void **)a1;
  if (v4)
  {
    *(_QWORD *)(a1 + 8) = v4;
    operator delete(v4);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
  }
  result = *a2;
  *(__n128 *)a1 = *a2;
  *(_QWORD *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  return result;
}

double std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  double result;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(a1, a2, a3);
  if (*(_DWORD *)a4 < *(_DWORD *)a3)
  {
    result = std::swap[abi:ne180100]<IndicatorsManifest::Indicator>(a3, a4);
    if (*(_DWORD *)a3 < *(_DWORD *)a2)
    {
      result = std::swap[abi:ne180100]<IndicatorsManifest::Indicator>(a2, a3);
      if (*(_DWORD *)a2 < *(_DWORD *)a1)
        return std::swap[abi:ne180100]<IndicatorsManifest::Indicator>(a1, a2);
    }
  }
  return result;
}

double std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  double result;

  result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(a1, a2, a3, a4);
  if (*(_DWORD *)a5 < *(_DWORD *)a4)
  {
    result = std::swap[abi:ne180100]<IndicatorsManifest::Indicator>(a4, a5);
    if (*(_DWORD *)a4 < *(_DWORD *)a3)
    {
      result = std::swap[abi:ne180100]<IndicatorsManifest::Indicator>(a3, a4);
      if (*(_DWORD *)a3 < *(_DWORD *)a2)
      {
        result = std::swap[abi:ne180100]<IndicatorsManifest::Indicator>(a2, a3);
        if (*(_DWORD *)a2 < *(_DWORD *)a1)
          return std::swap[abi:ne180100]<IndicatorsManifest::Indicator>(a1, a2);
      }
    }
  }
  return result;
}

uint64_t *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *,IndicatorsManifest::Indicator *>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unsigned int *v12;
  uint64_t v13;
  uint64_t *v14;
  unint64_t v15;

  if (a1 != a2)
  {
    v6 = (uint64_t)a2;
    v8 = (char *)a2 - (char *)a1;
    v9 = ((char *)a2 - (char *)a1) / 72;
    if ((char *)a2 - (char *)a1 >= 73)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = (unsigned int *)&a1[9 * v10];
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>((uint64_t)a1, a4, v9, v12);
        v12 -= 18;
        --v11;
      }
      while (v11);
    }
    v13 = v6;
    if ((uint64_t *)v6 != a3)
    {
      v14 = (uint64_t *)v6;
      do
      {
        if (*(_DWORD *)v14 < *(_DWORD *)a1)
        {
          std::swap[abi:ne180100]<IndicatorsManifest::Indicator>(v14, a1);
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>((uint64_t)a1, a4, v9, (unsigned int *)a1);
        }
        v14 += 9;
      }
      while (v14 != a3);
      v13 = (uint64_t)a3;
    }
    if (v8 >= 73)
    {
      v15 = v8 / 0x48uLL;
      do
      {
        std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void>,IndicatorsManifest::Indicator *>((uint64_t)a1, v6, a4, v15);
        v6 -= 72;
      }
      while (v15-- > 2);
    }
    return (uint64_t *)v13;
  }
  return a3;
}

void std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned int *v7;
  uint64_t v9;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void **v21;
  __int128 v22;
  unsigned int v23;
  unsigned int v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void **v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  void *__p[2];
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v6 = a3 - 2;
  if (a3 >= 2)
  {
    v38 = v4;
    v39 = v5;
    v7 = a4;
    v9 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) >= (uint64_t)(0x8E38E38E38E38E39 * (((uint64_t)a4 - a1) >> 3)))
    {
      v11 = (0x1C71C71C71C71C72 * (((uint64_t)a4 - a1) >> 3)) | 1;
      v12 = (unsigned int *)(a1 + 72 * v11);
      if (0x1C71C71C71C71C72 * (((uint64_t)a4 - a1) >> 3) + 2 >= a3)
      {
        v13 = *v12;
      }
      else
      {
        v13 = *v12;
        v14 = v12[18];
        if (*v12 <= v14)
          v13 = v12[18];
        if (*v12 < v14)
        {
          v12 += 18;
          v11 = 0x1C71C71C71C71C72 * (((uint64_t)a4 - a1) >> 3) + 2;
        }
      }
      if (v13 >= *a4)
      {
        v31 = *(_QWORD *)a4;
        v32 = a4[2];
        *(_OWORD *)__p = *((_OWORD *)a4 + 1);
        *((_QWORD *)a4 + 2) = 0;
        *((_QWORD *)a4 + 3) = 0;
        v15 = *((_QWORD *)a4 + 4);
        v16 = *((_QWORD *)a4 + 5);
        *((_QWORD *)a4 + 4) = 0;
        *((_QWORD *)a4 + 5) = 0;
        v34 = v15;
        v35 = v16;
        v36 = *((_OWORD *)a4 + 3);
        v37 = *((_QWORD *)a4 + 8);
        *((_QWORD *)a4 + 7) = 0;
        *((_QWORD *)a4 + 8) = 0;
        *((_QWORD *)a4 + 6) = 0;
        do
        {
          v17 = v12;
          v18 = *(_QWORD *)v12;
          v7[2] = v17[2];
          *(_QWORD *)v7 = v18;
          std::vector<IndicatorsManifest::Frame>::__move_assign((uint64_t)(v7 + 4), (__n128 *)v17 + 1);
          v19 = *((_QWORD *)v17 + 5);
          *((_QWORD *)v17 + 5) = 0;
          v20 = *((_QWORD *)v7 + 5);
          *((_QWORD *)v7 + 5) = v19;
          if (v20)
            std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100]((uint64_t)(v7 + 10), v20);
          v21 = (void **)(v7 + 12);
          if (*((char *)v7 + 71) < 0)
            operator delete(*v21);
          v22 = *((_OWORD *)v17 + 3);
          *((_QWORD *)v7 + 8) = *((_QWORD *)v17 + 8);
          *(_OWORD *)v21 = v22;
          *((_BYTE *)v17 + 71) = 0;
          *((_BYTE *)v17 + 48) = 0;
          if (v9 < v11)
            break;
          v12 = (unsigned int *)(a1 + 72 * ((2 * v11) | 1));
          if (2 * v11 + 2 >= a3)
          {
            v23 = *v12;
            v11 = (2 * v11) | 1;
          }
          else
          {
            v23 = *v12;
            v24 = v12[18];
            if (*v12 <= v24)
              v23 = v12[18];
            if (*v12 >= v24)
            {
              v11 = (2 * v11) | 1;
            }
            else
            {
              v12 += 18;
              v11 = 2 * v11 + 2;
            }
          }
          v7 = v17;
        }
        while (v23 >= v31);
        v17[2] = v32;
        *(_QWORD *)v17 = v31;
        v25 = (void *)*((_QWORD *)v17 + 2);
        if (v25)
        {
          *((_QWORD *)v17 + 3) = v25;
          operator delete(v25);
          *((_QWORD *)v17 + 2) = 0;
          *((_QWORD *)v17 + 3) = 0;
          *((_QWORD *)v17 + 4) = 0;
        }
        *((_OWORD *)v17 + 1) = *(_OWORD *)__p;
        *((_QWORD *)v17 + 4) = v34;
        v26 = v35;
        v35 = 0;
        v27 = *((_QWORD *)v17 + 5);
        *((_QWORD *)v17 + 5) = v26;
        if (v27)
          std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100]((uint64_t)(v17 + 10), v27);
        v28 = (void **)(v17 + 12);
        if (*((char *)v17 + 71) < 0)
          operator delete(*v28);
        v29 = v36;
        *((_QWORD *)v17 + 8) = v37;
        *(_OWORD *)v28 = v29;
        HIBYTE(v37) = 0;
        LOBYTE(v36) = 0;
        v30 = v35;
        v35 = 0;
        if (v30)
          std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100]((uint64_t)&v35, v30);
      }
    }
  }
}

void std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void>,IndicatorsManifest::Indicator *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  __int128 v17;
  void *v18;
  void **v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void **v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  void *v31[2];
  uint64_t v32;
  uint64_t v33;
  void *__p[2];
  uint64_t v35;

  if (a4 >= 2)
  {
    v29 = *(_QWORD *)a1;
    v30 = *(_DWORD *)(a1 + 8);
    *(_OWORD *)v31 = *(_OWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)(a1 + 24) = 0;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 32) = 0;
    *(_QWORD *)(a1 + 40) = 0;
    v32 = v7;
    v33 = v8;
    *(_OWORD *)__p = *(_OWORD *)(a1 + 48);
    v35 = *(_QWORD *)(a1 + 64);
    *(_QWORD *)(a1 + 56) = 0;
    *(_QWORD *)(a1 + 64) = 0;
    *(_QWORD *)(a1 + 48) = 0;
    v9 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(a1, a3, a4);
    v10 = v9;
    v11 = (uint64_t *)(a2 - 72);
    v12 = (_QWORD *)(v9 + 16);
    if (v9 == a2 - 72)
    {
      *(_DWORD *)(v9 + 8) = v30;
      *(_QWORD *)v9 = v29;
      v23 = *(void **)(v9 + 16);
      if (v23)
      {
        *(_QWORD *)(v10 + 24) = v23;
        operator delete(v23);
        *v12 = 0;
        v12[1] = 0;
        v12[2] = 0;
      }
      *(_OWORD *)(v10 + 16) = *(_OWORD *)v31;
      *(_QWORD *)(v10 + 32) = v32;
      v24 = v33;
      v33 = 0;
      v25 = *(_QWORD *)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v24;
      if (v25)
        std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100](v10 + 40, v25);
      v26 = (void **)(v10 + 48);
      if (*(char *)(v10 + 71) < 0)
        operator delete(*v26);
      v27 = *(_OWORD *)__p;
      *(_QWORD *)(v10 + 64) = v35;
      *(_OWORD *)v26 = v27;
      HIBYTE(v35) = 0;
      LOBYTE(__p[0]) = 0;
    }
    else
    {
      v13 = *v11;
      *(_DWORD *)(v9 + 8) = *(_DWORD *)(a2 - 64);
      *(_QWORD *)v9 = v13;
      std::vector<IndicatorsManifest::Frame>::__move_assign(v9 + 16, (__n128 *)(a2 - 56));
      v14 = *(_QWORD *)(a2 - 32);
      *(_QWORD *)(a2 - 32) = 0;
      v15 = *(_QWORD *)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v14;
      if (v15)
        std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100](v10 + 40, v15);
      v16 = (void **)(v10 + 48);
      if (*(char *)(v10 + 71) < 0)
        operator delete(*v16);
      v17 = *(_OWORD *)(a2 - 24);
      *(_QWORD *)(v10 + 64) = *(_QWORD *)(a2 - 8);
      *(_OWORD *)v16 = v17;
      *(_BYTE *)(a2 - 1) = 0;
      *(_BYTE *)(a2 - 24) = 0;
      *v11 = v29;
      *(_DWORD *)(a2 - 64) = v30;
      v18 = *(void **)(a2 - 56);
      if (v18)
      {
        *(_QWORD *)(a2 - 48) = v18;
        operator delete(v18);
        *(_QWORD *)(a2 - 56) = 0;
        *(_QWORD *)(a2 - 48) = 0;
        *(_QWORD *)(a2 - 40) = 0;
      }
      v19 = (void **)(a2 - 24);
      v20 = v10 + 72;
      *(_OWORD *)(a2 - 56) = *(_OWORD *)v31;
      v21 = v33;
      v33 = 0;
      v22 = *(_QWORD *)(a2 - 32);
      *(_QWORD *)(a2 - 40) = v32;
      *(_QWORD *)(a2 - 32) = v21;
      if (v22)
        std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100](a2 - 32, v22);
      if (*(char *)(a2 - 1) < 0)
        operator delete(*v19);
      *(_OWORD *)v19 = *(_OWORD *)__p;
      *(_QWORD *)(a2 - 8) = v35;
      HIBYTE(v35) = 0;
      LOBYTE(__p[0]) = 0;
      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(a1, v20, a3, 0x8E38E38E38E38E39 * ((v20 - a1) >> 3));
    }
    v28 = v33;
    v33 = 0;
    if (v28)
      std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100]((uint64_t)&v33, v28);
  }
}

void sub_2454DEB9C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IndicatorsManifest::Indicator::~Indicator((void **)va);
  _Unwind_Resume(a1);
}

uint64_t std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void **v13;
  __int128 v14;

  v5 = 0;
  v6 = a3 - 2;
  if (a3 < 2)
    v6 = a3 - 1;
  v7 = v6 >> 1;
  do
  {
    v8 = a1 + 72 * v5 + 72;
    v9 = 2 * v5;
    v5 = (2 * v5) | 1;
    if (v9 + 2 < a3 && *(_DWORD *)v8 < *(_DWORD *)(v8 + 72))
    {
      v8 += 72;
      v5 = v9 + 2;
    }
    v10 = *(_QWORD *)v8;
    *(_DWORD *)(a1 + 8) = *(_DWORD *)(v8 + 8);
    *(_QWORD *)a1 = v10;
    std::vector<IndicatorsManifest::Frame>::__move_assign(a1 + 16, (__n128 *)(v8 + 16));
    v11 = *(_QWORD *)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;
    v12 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v11;
    if (v12)
      std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100](a1 + 40, v12);
    v13 = (void **)(a1 + 48);
    if (*(char *)(a1 + 71) < 0)
      operator delete(*v13);
    v14 = *(_OWORD *)(v8 + 48);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(v8 + 64);
    *(_OWORD *)v13 = v14;
    *(_BYTE *)(v8 + 71) = 0;
    *(_BYTE *)(v8 + 48) = 0;
    a1 = v8;
  }
  while (v5 <= v7);
  return v8;
}

void std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,IndicatorsManifest::Indicator *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  unsigned int v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void **v18;
  __int128 v19;
  void *v20;
  uint64_t v21;
  void **v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a4 - 2;
  if (a4 >= 2)
  {
    v6 = v4 >> 1;
    v7 = (_QWORD *)(a1 + 72 * (v4 >> 1));
    v8 = (_QWORD *)(a2 - 72);
    if (*(_DWORD *)v7 < *(_DWORD *)(a2 - 72))
    {
      v9 = *(_DWORD *)(a2 - 72);
      v26 = *(_QWORD *)(a2 - 68);
      v10 = *(_OWORD *)(a2 - 56);
      *(_QWORD *)(a2 - 56) = 0;
      *(_QWORD *)(a2 - 48) = 0;
      v11 = *(_QWORD *)(a2 - 40);
      v12 = *(_QWORD *)(a2 - 32);
      v13 = *(_OWORD *)(a2 - 24);
      *(_QWORD *)(a2 - 40) = 0;
      *(_QWORD *)(a2 - 32) = 0;
      v23 = v10;
      v24 = v13;
      v25 = *(_QWORD *)(a2 - 8);
      *(_QWORD *)(a2 - 24) = 0;
      *(_QWORD *)(a2 - 16) = 0;
      *(_QWORD *)(a2 - 8) = 0;
      do
      {
        v14 = v7;
        v15 = *v7;
        *((_DWORD *)v8 + 2) = *((_DWORD *)v14 + 2);
        *v8 = v15;
        std::vector<IndicatorsManifest::Frame>::__move_assign((uint64_t)(v8 + 2), (__n128 *)v14 + 1);
        v16 = v14[5];
        v14[5] = 0;
        v17 = v8[5];
        v8[5] = v16;
        if (v17)
          std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100]((uint64_t)(v8 + 5), v17);
        v18 = (void **)(v8 + 6);
        if (*((char *)v8 + 71) < 0)
          operator delete(*v18);
        v19 = *((_OWORD *)v14 + 3);
        v8[8] = v14[8];
        *(_OWORD *)v18 = v19;
        *((_BYTE *)v14 + 71) = 0;
        *((_BYTE *)v14 + 48) = 0;
        if (!v6)
          break;
        v6 = (v6 - 1) >> 1;
        v7 = (_QWORD *)(a1 + 72 * v6);
        v8 = v14;
      }
      while (*(_DWORD *)v7 < v9);
      *(_DWORD *)v14 = v9;
      *(_QWORD *)((char *)v14 + 4) = v26;
      v20 = (void *)v14[2];
      if (v20)
      {
        v14[3] = v20;
        operator delete(v20);
        v14[2] = 0;
        v14[3] = 0;
        v14[4] = 0;
      }
      *((_OWORD *)v14 + 1) = v23;
      v21 = v14[5];
      v14[4] = v11;
      v14[5] = v12;
      if (v21)
        std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100]((uint64_t)(v14 + 5), v21);
      v22 = (void **)(v14 + 6);
      if (*((char *)v14 + 71) < 0)
        operator delete(*v22);
      *(_OWORD *)v22 = v24;
      v14[8] = v25;
    }
  }
}

void std::vector<IndicatorsManifest::Indicator>::__destroy_vector::operator()[abi:ne180100](void ***a1)
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
        v4 -= 72;
        std::__destroy_at[abi:ne180100]<IndicatorsManifest::Indicator,0>(v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned int,NSURL * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,NSURL * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,NSURL * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,NSURL * {__strong}>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<unsigned int,NSURL * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,NSURL * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,NSURL * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,NSURL * {__strong}>>>::__deallocate_node(a1, *(id **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<unsigned int,NSURL * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,NSURL * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,NSURL * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,NSURL * {__strong}>>>::__deallocate_node(uint64_t a1, id *a2)
{
  id *v2;
  id *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (id *)*v2;

      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned int,NSURL * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,NSURL * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,NSURL * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,NSURL * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  _QWORD *v11;
  unint64_t v12;
  _QWORD *v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v8 <= v7)
        v4 = v7 % v8;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
    v10 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = *v10;
      if (*v10)
      {
        do
        {
          v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == (_DWORD)v7)
              return v11;
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
  v13 = (_QWORD *)(a1 + 16);
  v11 = operator new(0x20uLL);
  *v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  v11[3] = 0;
  v14 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v15 = *(float *)(a1 + 32);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    v16 = 1;
    if (v8 >= 3)
      v16 = (v8 & (v8 - 1)) != 0;
    v17 = v16 | (2 * v8);
    v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18)
      v19 = v18;
    else
      v19 = v17;
    std::__hash_table<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<StateMachine::TransitionPoint>>>>::__rehash<true>(a1, v19);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
  }
  v20 = *(_QWORD *)a1;
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v21)
  {
    *v11 = *v21;
LABEL_38:
    *v21 = v11;
    goto LABEL_39;
  }
  *v11 = *v13;
  *v13 = v11;
  *(_QWORD *)(v20 + 8 * v4) = v13;
  if (*v11)
  {
    v22 = *(_QWORD *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v22 >= v8)
        v22 %= v8;
    }
    else
    {
      v22 &= v8 - 1;
    }
    v21 = (_QWORD *)(*(_QWORD *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v11;
}

void sub_2454DF188(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,NSURL * {__strong}>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,NSURL * {__strong}>,void *>>>::operator()[abi:ne180100](uint64_t a1, id *a2)
{
  if (*(_BYTE *)(a1 + 8))
  {

  }
  else if (!a2)
  {
    return;
  }
  operator delete(a2);
}

void std::default_delete<StateMachine::Manifest const>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unique_ptr<StateMachine::State>>>>::destroy(a2 + 8, *(_QWORD **)(a2 + 16));

    JUMPOUT(0x2495360E8);
  }
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t silmanager_silmanager_createrenderer()
{
  uint64_t v0;

  v0 = tb_client_connection_message_construct();
  if (!(_DWORD)v0)
  {
    tb_message_encode_u64();
    tb_message_complete();
    v0 = tb_connection_send_query();
    tb_client_connection_message_destruct();
    if ((v0 & 0xFFFFFFF7) == 0)
      return 4;
  }
  return v0;
}

uint64_t silmanager_silmanager_setpower()
{
  uint64_t v0;

  v0 = tb_client_connection_message_construct();
  if (!(_DWORD)v0)
  {
    tb_message_encode_u64();
    tb_message_encode_BOOL();
    tb_message_encode_BOOL();
    tb_message_complete();
    v0 = tb_connection_send_query();
    tb_client_connection_message_destruct();
    if ((v0 & 0xFFFFFFF7) == 0)
      return 4;
  }
  return v0;
}

uint64_t silmanager_silmanager_swap()
{
  uint64_t v0;
  uint64_t v1;

  v0 = tb_client_connection_message_construct();
  if (!(_DWORD)v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u8();
    tb_message_encode_s32();
    tb_message_encode_f64();
    tb_message_encode_f64();
    tb_message_encode_f32();
    tb_message_encode_u16();
    tb_message_encode_f32();
    tb_message_complete();
    v1 = tb_connection_send_query();
    if ((v1 & 0xFFFFFFF7) != 0)
    {
      v0 = v1;
      tb_client_connection_message_destruct();
    }
    else
    {
      tb_client_connection_message_destruct();
      return 4;
    }
  }
  return v0;
}

uint64_t silmanager_silmanager_turnoffindicators()
{
  uint64_t v0;
  uint64_t v1;

  v0 = tb_client_connection_message_construct();
  if (!(_DWORD)v0)
  {
    tb_message_encode_u64();
    tb_message_encode_s32();
    tb_message_encode_BOOL();
    tb_message_complete();
    v1 = tb_connection_send_query();
    if ((v1 & 0xFFFFFFF7) != 0)
    {
      v0 = v1;
      tb_client_connection_message_destruct();
    }
    else
    {
      tb_client_connection_message_destruct();
      return 4;
    }
  }
  return v0;
}

uint64_t silmanager_silmanager_setloglevel()
{
  uint64_t v0;

  v0 = tb_client_connection_message_construct();
  if (!(_DWORD)v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u8();
    tb_message_complete();
    v0 = tb_connection_send_query();
    tb_client_connection_message_destruct();
    if ((v0 & 0xFFFFFFF7) == 0)
      return 4;
  }
  return v0;
}

uint64_t silmanager_silmanager__init(uint64_t *a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = tb_client_connection_create_with_endpoint();
  result = tb_client_connection_activate();
  if (!(_DWORD)result)
    *a1 = v2;
  return result;
}

uint64_t SILFileHandle.readAs<A>(offset:size:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;

  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 8))(a1, a2, a3, a5);
  if (!v5)
  {
    MEMORY[0x24BDAC7A8](result);
    Array.withUnsafeBytes<A>(_:)();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t partial apply for closure #1 in SILFileHandle.readAs<A>(offset:size:)()
{
  return UnsafeRawBufferPointer.load<A>(fromByteOffset:as:)();
}

void SILFileHandle.readArrayOf<A>(offset:count:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;

  if ((unsigned __int128)(*(uint64_t *)(*(_QWORD *)(a4 - 8) + 64) * (__int128)a2) >> 64 == (*(_QWORD *)(*(_QWORD *)(a4 - 8) + 64)
                                                                                            * a2) >> 63)
  {
    v6 = (*(uint64_t (**)(void))(a5 + 8))();
    if (!v5)
    {
      MEMORY[0x24BDAC7A8](v6);
      type metadata accessor for Array();
      Array.withUnsafeBytes<A>(_:)();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t partial apply for closure #1 in SILFileHandle.readArrayOf<A>(offset:count:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  if (!result)
    goto LABEL_5;
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 24) - 8) + 72);
  if (v5)
  {
    if (a2 - result != 0x8000000000000000 || v5 != -1)
    {
LABEL_5:
      v6 = type metadata accessor for UnsafeBufferPointer();
      MEMORY[0x24953649C](MEMORY[0x24BEE09D8], v6);
      result = Array.init<A>(_:)();
      *a3 = result;
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

_QWORD *getManifestFiles(directoryName:)(uint64_t a1, uint64_t a2)
{
  return specialized static SimulatorFileHandle.getFilesMatching(directoryName:predicate:)(a1, a2, 1852400174, (void *)0xE400000000000000);
}

void getIgnoreManifestFileList(directoryName:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  Swift::String v13;
  uint64_t v14;
  uint64_t v15;
  Swift::String v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v4 = type metadata accessor for CharacterSet();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for String.Encoding();
  MEMORY[0x24BDAC7A8](v8);
  v9 = specialized static SimulatorFileHandle.getFilesMatching(directoryName:predicate:)(a1, a2, 0x6F6E67696C69732ELL, (void *)0xEA00000000006572);
  v10 = v9[2];
  if (!v10)
    goto LABEL_20;
  if (v10 == 1)
  {
LABEL_5:
    outlined init with copy of SILFileHandle((uint64_t)(v9 + 4), (uint64_t)&v42);
    v17 = v44;
    v18 = v45;
    __swift_project_boxed_opaque_existential_1(&v42, v44);
    outlined init with copy of SILFileHandle((uint64_t)(v9 + 4), (uint64_t)&v38);
    swift_bridgeObjectRelease();
    v19 = v40;
    v20 = v41;
    __swift_project_boxed_opaque_existential_1(&v38, v40);
    v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 16))(v19, v20);
    v22 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v18 + 8))(0, v21, v17, v18);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v38);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v42);
    v42 = v22;
    static String.Encoding.utf8.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt8]);
    lazy protocol witness table accessor for type [UInt8] and conformance [A]();
    v23 = String.init<A>(bytes:encoding:)();
    v25 = v24;
    swift_bridgeObjectRelease();
    if (v25)
    {
      v42 = v23;
      v43 = v25;
      static CharacterSet.newlines.getter();
      lazy protocol witness table accessor for type String and conformance String();
      v26 = StringProtocol.components(separatedBy:)();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      swift_bridgeObjectRelease();
      v27 = *(_QWORD *)(v26 + 16);
      if (v27)
        goto LABEL_9;
    }
    else
    {
      v26 = MEMORY[0x24BEE4AF8];
      v27 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      if (v27)
      {
LABEL_9:
        v28 = (uint64_t *)(v26 + 40);
        v29 = MEMORY[0x24BEE4AF8];
        do
        {
          v34 = *(v28 - 1);
          v33 = *v28;
          v35 = HIBYTE(*v28) & 0xF;
          if ((*v28 & 0x2000000000000000) == 0)
            v35 = v34 & 0xFFFFFFFFFFFFLL;
          if (v35)
          {
            swift_bridgeObjectRetain();
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            v42 = v29;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v29 + 16) + 1, 1);
              v29 = v42;
            }
            v31 = *(_QWORD *)(v29 + 16);
            v30 = *(_QWORD *)(v29 + 24);
            if (v31 >= v30 >> 1)
            {
              specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v30 > 1), v31 + 1, 1);
              v29 = v42;
            }
            *(_QWORD *)(v29 + 16) = v31 + 1;
            v32 = v29 + 16 * v31;
            *(_QWORD *)(v32 + 32) = v34;
            *(_QWORD *)(v32 + 40) = v33;
          }
          v28 += 2;
          --v27;
        }
        while (v27);
      }
    }
LABEL_20:
    swift_bridgeObjectRelease();
    return;
  }
  v11 = Log.unsafeMutableAddressor();
  swift_beginAccess();
  v12 = *v11;
  v42 = 0;
  v43 = 0xE000000000000000;
  swift_retain();
  _StringGuts.grow(_:)(52);
  v38 = v42;
  v39 = v43;
  v13._countAndFlagsBits = 0xD000000000000032;
  v13._object = (void *)0x80000002454EE650;
  String.append(_:)(v13);
  if (v9[2])
  {
    outlined init with copy of SILFileHandle((uint64_t)(v9 + 4), (uint64_t)&v42);
    v14 = v44;
    v15 = v45;
    __swift_project_boxed_opaque_existential_1(&v42, v44);
    v16._countAndFlagsBits = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 24))(v14, v15);
    String.append(_:)(v16);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v42);
    (*(void (**)(uint64_t, uint64_t, unint64_t))(*(_QWORD *)v12 + 144))(4, v38, v39);
    swift_release();
    swift_bridgeObjectRelease();
    if (v9[2])
      goto LABEL_5;
    __break(1u);
  }
  __break(1u);
}

void SimulatorFileHandle.__allocating_init(directoryName:fileName:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  swift_allocObject();
  SimulatorFileHandle.init(directoryName:fileName:)(a1, a2, a3, a4);
}

void SimulatorFileHandle.init(directoryName:fileName:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  Swift::String v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  Swift::String v30;
  Swift::UInt64 v31;
  uint64_t v32;
  Swift::UInt64 v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v5 = v4;
  v34 = *v5;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for URL();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v32 - v17;
  v38 = a1;
  v39 = a2;
  swift_bridgeObjectRetain();
  v19._countAndFlagsBits = a3;
  v19._object = a4;
  String.append(_:)(v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v21 = v38;
  v20 = v39;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  String.utf8CString.getter();
  URL.init(fileURLWithFileSystemRepresentation:isDirectory:relativeTo:)();
  outlined destroy of URL?((uint64_t)v11);
  swift_release();
  type metadata accessor for NSFileHandle();
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
  v22 = @nonobjc NSFileHandle.__allocating_init(forReadingFrom:)((uint64_t)v16);
  v5[2] = (uint64_t)v22;
  v23 = v22;
  v24 = NSFileHandle.readToEnd()();
  outlined consume of Data?(v24, v25);

  v26 = (id)v5[2];
  v33 = NSFileHandle.offset()();
  if (v27)
  {

    swift_bridgeObjectRelease();
    v28 = Log.unsafeMutableAddressor();
    swift_beginAccess();
    v29 = *v28;
    v36 = 0;
    v37 = 0xE000000000000000;
    swift_retain();
    _StringGuts.grow(_:)(28);
    v30._object = (void *)0x80000002454EE690;
    v30._countAndFlagsBits = 0xD00000000000001ALL;
    String.append(_:)(v30);
    v35 = v27;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    _print_unlocked<A, B>(_:_:)();
    (*(void (**)(uint64_t, uint64_t, unint64_t))(*(_QWORD *)v29 + 144))(3, v36, v37);
    swift_release();
    swift_bridgeObjectRelease();

    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    swift_deallocPartialClassInstance();
  }
  else
  {

    v31 = v33;
    if ((v33 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
      v5[3] = v31;
      v5[4] = v21;
      v5[5] = v20;
    }
  }
}

id @nonobjc NSFileHandle.__allocating_init(forReadingFrom:)(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  id v8;
  id v9;
  uint64_t v10;
  id v12;
  NSURL *v13;

  v13 = (NSURL *)*MEMORY[0x24BDAC8D0];
  URL._bridgeToObjectiveC()(v13);
  v3 = v2;
  v12 = 0;
  v4 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_fileHandleForReadingFromURL_error_, v2, &v12);

  v5 = v12;
  if (v4)
  {
    v6 = type metadata accessor for URL();
    v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
    v8 = v5;
    v7(a1, v6);
  }
  else
  {
    v9 = v12;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    v10 = type metadata accessor for URL();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(a1, v10);
  }
  return v4;
}

uint64_t SimulatorFileHandle.read(offset:size:)(uint64_t a1, size_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  Swift::String v11;
  Swift::String v12;
  Swift::String v13;
  Swift::String v14;
  Swift::String v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  id v21;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  v5 = a1;
  v6 = *(void **)(v2 + 16);
  v24 = 0;
  if (!objc_msgSend(v6, sel_seekToOffset_error_, a1, &v24))
  {
    v21 = v24;
    _convertNSErrorToError(_:)();

    goto LABEL_7;
  }
  v7 = v24;
  v8 = NSFileHandle.read(upToCount:)();
  if (!v3)
  {
    v10 = v9;
    if (v9 >> 60 == 15)
    {
      v24 = 0;
      v25 = 0xE000000000000000;
      _StringGuts.grow(_:)(54);
      v11._object = (void *)0x80000002454EE6B0;
      v11._countAndFlagsBits = 0xD00000000000001BLL;
      String.append(_:)(v11);
      v12._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v12);
      swift_bridgeObjectRelease();
      v13._countAndFlagsBits = 0x7A697320646E6120;
      v13._object = (void *)0xEA00000000002065;
      String.append(_:)(v13);
      v14._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v14);
      swift_bridgeObjectRelease();
      v15._countAndFlagsBits = 0x656E727574657220;
      v15._object = (void *)0xED00006C696E2064;
      String.append(_:)(v15);
      v5 = SILError.log()((uint64_t)v24, v25, 6);
      v17 = v16;
      v19 = v18;
      swift_bridgeObjectRelease();
      lazy protocol witness table accessor for type SILError and conformance SILError();
      swift_allocError();
      *(_QWORD *)v20 = v5;
      *(_QWORD *)(v20 + 8) = v17;
      *(_BYTE *)(v20 + 16) = v19;
LABEL_7:
      swift_willThrow();
      return v5;
    }
    if ((a2 & 0x8000000000000000) == 0)
    {
      v23 = v8;
      if (a2)
      {
        v5 = static Array._allocateBufferUninitialized(minimumCapacity:)();
        *(_QWORD *)(v5 + 16) = a2;
        bzero((void *)(v5 + 32), a2);
      }
      else
      {
        v5 = MEMORY[0x24BEE4AF8];
      }
      swift_bridgeObjectRetain();
      Data.copyBytes(to:count:)();
      outlined consume of Data?(v23, v10);
      swift_bridgeObjectRelease();
      return v5;
    }
LABEL_15:
    __break(1u);
  }
  return v5;
}

uint64_t SimulatorFileHandle.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t protocol witness for SILFileHandle.read(offset:size:) in conformance SimulatorFileHandle(uint64_t a1, size_t a2)
{
  return SimulatorFileHandle.read(offset:size:)(a1, a2);
}

uint64_t protocol witness for SILFileHandle.size.getter in conformance SimulatorFileHandle()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 24);
}

uint64_t protocol witness for SILFileHandle.name.getter in conformance SimulatorFileHandle()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
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
    v10 = (char *)MEMORY[0x24BEE4AF8];
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
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

_QWORD *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SILFileHandle>);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SILFileHandle);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
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
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SILManifest.Indicator>);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 80);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[10 * v8 + 4])
          memmove(v12, a4 + 4, 80 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
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
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SILManifest.Indicator.Frame>);
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
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
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
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SILRenderer.Region.PageContent>);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
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

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249536484]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t specialized _ArrayProtocol.filter(_:)(uint64_t result, uint64_t a2, void *a3)
{
  unint64_t v3;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t *i;
  uint64_t v13;
  uint64_t v14;
  Swift::String v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;

  v3 = *(_QWORD *)(result + 16);
  if (!v3)
    return MEMORY[0x24BEE4AF8];
  v6 = 0;
  v7 = result + 40;
  v8 = -(uint64_t)v3;
  v9 = MEMORY[0x24BEE4AF8];
  v19 = result + 40;
  v20 = *(_QWORD *)(result + 16);
  do
  {
    if (v6 <= v3)
      v10 = v3;
    else
      v10 = v6;
    v11 = -(uint64_t)v10;
    for (i = (uint64_t *)(v7 + 16 * v6++); ; i += 2)
    {
      if (v11 + v6 == 1)
      {
        __break(1u);
        return result;
      }
      v14 = *(i - 1);
      v13 = *i;
      swift_bridgeObjectRetain();
      v15._countAndFlagsBits = a2;
      v15._object = a3;
      if (String.hasSuffix(_:)(v15))
        break;
      result = swift_bridgeObjectRelease();
      ++v6;
      if (v8 + v6 == 1)
        return v9;
    }
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
      result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v9 + 16) + 1, 1);
    v17 = *(_QWORD *)(v9 + 16);
    v16 = *(_QWORD *)(v9 + 24);
    if (v17 >= v16 >> 1)
      result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v16 > 1), v17 + 1, 1);
    *(_QWORD *)(v9 + 16) = v17 + 1;
    v18 = v9 + 16 * v17;
    *(_QWORD *)(v18 + 32) = v14;
    *(_QWORD *)(v18 + 40) = v13;
    v7 = v19;
    v3 = v20;
  }
  while (v8 + v6);
  return v9;
}

_QWORD *specialized static SimulatorFileHandle.getFilesMatching(directoryName:predicate:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void **v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  id v25;
  void *v26;
  uint64_t *v27;
  uint64_t v28;
  id v29;
  Swift::String v30;
  void *v32;
  __int128 v33;
  uint64_t v34;
  _UNKNOWN **v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v9 = (void *)MEMORY[0x249535D7C](a1, a2);
  *(_QWORD *)&v33 = 0;
  v10 = objc_msgSend(v8, sel_contentsOfDirectoryAtPath_error_, v9, &v33);

  v11 = (void *)v33;
  if (!v10)
  {
    v25 = (id)v33;
    v26 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    v27 = Log.unsafeMutableAddressor();
    swift_beginAccess();
    v28 = *v27;
    swift_retain();
    _StringGuts.grow(_:)(25);
    swift_bridgeObjectRelease();
    v29 = v26;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    v30._countAndFlagsBits = String.init<A>(describing:)();
    String.append(_:)(v30);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, unint64_t, unint64_t))(*(_QWORD *)v28 + 144))(3, 0xD000000000000017, 0x80000002454EE610);

    swift_release();
    swift_bridgeObjectRelease();

    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = v11;

  v14 = specialized _ArrayProtocol.filter(_:)(v12, a3, a4);
  swift_bridgeObjectRelease();
  v15 = *(_QWORD *)(v14 + 16);
  if (!v15)
  {
    swift_bridgeObjectRelease();

    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v32 = v8;
  v16 = type metadata accessor for SimulatorFileHandle();
  swift_bridgeObjectRetain();
  v17 = (void **)(v14 + 40);
  v18 = (_QWORD *)MEMORY[0x24BEE4AF8];
  do
  {
    v19 = (uint64_t)*(v17 - 1);
    v20 = *v17;
    swift_allocObject();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    SimulatorFileHandle.init(directoryName:fileName:)(a1, a2, v19, v20);
    if (v21)
    {
      v22 = v21;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v18 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v18[2] + 1, 1, v18);
      v24 = v18[2];
      v23 = v18[3];
      if (v24 >= v23 >> 1)
        v18 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v23 > 1), v24 + 1, 1, v18);
      v34 = v16;
      v35 = &protocol witness table for SimulatorFileHandle;
      *(_QWORD *)&v33 = v22;
      v18[2] = v24 + 1;
      outlined init with take of SILFileHandle(&v33, (uint64_t)&v18[5 * v24 + 4]);
    }
    v17 += 2;
    swift_bridgeObjectRelease();
    --v15;
  }
  while (v15);

  swift_bridgeObjectRelease_n();
  return v18;
}

uint64_t outlined init with take of SILFileHandle(__int128 *a1, uint64_t a2)
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

uint64_t outlined init with copy of SILFileHandle(uint64_t a1, uint64_t a2)
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

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t lazy protocol witness table accessor for type [UInt8] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [UInt8] and conformance [A];
  if (!lazy protocol witness table cache variable for type [UInt8] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [UInt8]);
    result = MEMORY[0x24953649C](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [UInt8] and conformance [A]);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249536490](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x24953649C](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

uint64_t outlined destroy of URL?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t type metadata accessor for NSFileHandle()
{
  unint64_t result;

  result = lazy cache variable for type metadata for NSFileHandle;
  if (!lazy cache variable for type metadata for NSFileHandle)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSFileHandle);
  }
  return result;
}

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return outlined consume of Data._Representation(a1, a2);
  return a1;
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

unint64_t lazy protocol witness table accessor for type SILError and conformance SILError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SILError and conformance SILError;
  if (!lazy protocol witness table cache variable for type SILError and conformance SILError)
  {
    result = MEMORY[0x24953649C](&protocol conformance descriptor for SILError, &type metadata for SILError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SILError and conformance SILError);
  }
  return result;
}

uint64_t type metadata accessor for SimulatorFileHandle()
{
  return objc_opt_self();
}

uint64_t LogType.rawValue.getter(int a1)
{
  return (a1 + 1);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance LogType(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void specialized == infix<A>(_:_:)(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_2454E134C(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_2454E13F4 + 4 * byte_2454EDC6E[a2]))(0x616C707369445845);
}

uint64_t sub_2454E13F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char v3;

  if (a1 == 0x616C707369445845 && v2 == a2 + 20)
    v3 = 1;
  else
    v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance LogType()
{
  char *v0;
  char v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1 + 1);
  return Hasher._finalize()();
}

void specialized RawRepresentable<>.hashValue.getter(char a1)
{
  Hasher.init(_seed:)();
  __asm { BR              X10 }
}

Swift::Int sub_2454E158C()
{
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance LogType()
{
  _BYTE *v0;

  Hasher._combine(_:)(*v0 + 1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance LogType()
{
  char *v0;
  char v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1 + 1);
  return Hasher._finalize()();
}

void specialized RawRepresentable<>._rawHashValue(seed:)(uint64_t a1, char a2)
{
  Hasher.init(_seed:)();
  __asm { BR              X10 }
}

Swift::Int sub_2454E1708()
{
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance LogType@<X0>(unsigned __int8 *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = specialized LogType.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance LogType(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1 + 1;
}

uint64_t LogModule.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2454E1838 + 4 * byte_2454EDC80[a1]))(0x6165627468676954, 0xE90000000000006DLL);
}

uint64_t sub_2454E1838()
{
  return 0x616C707369445845;
}

uint64_t sub_2454E1850()
{
  return 0x6361667275535845;
}

uint64_t sub_2454E186C()
{
  return 0x6F4C617461445845;
}

uint64_t sub_2454E188C()
{
  return 0x65646E65524C4953;
}

uint64_t sub_2454E18AC()
{
  return 0x646E656B636142;
}

void protocol witness for static Equatable.== infix(_:_:) in conformance LogModule(char *a1)
{
  specialized == infix<A>(_:_:)(*a1);
}

void protocol witness for Hashable.hashValue.getter in conformance LogModule()
{
  char *v0;

  specialized RawRepresentable<>.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance LogModule()
{
  __asm { BR              X11 }
}

uint64_t sub_2454E191C()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

void protocol witness for Hashable._rawHashValue(seed:) in conformance LogModule(uint64_t a1)
{
  char *v1;

  specialized RawRepresentable<>._rawHashValue(seed:)(a1, *v1);
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance LogModule@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = specialized LogModule.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance LogModule()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_2454E1A28 + 4 * byte_2454EDC8C[*v0]))();
}

void sub_2454E1A28(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 0x616C707369445845;
  a1[1] = v1 + 20;
}

void sub_2454E1A44(_QWORD *a1@<X8>)
{
  *a1 = 0x6361667275535845;
  a1[1] = 0xE900000000000065;
}

void sub_2454E1A64(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "EXDataLoader");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

void sub_2454E1A88(_QWORD *a1@<X8>)
{
  *a1 = 0x65646E65524C4953;
  a1[1] = 0xEB00000000726572;
}

void sub_2454E1AAC(_QWORD *a1@<X8>)
{
  *a1 = 0x646E656B636142;
  a1[1] = 0xE700000000000000;
}

uint64_t one-time initialization function for SILLogger()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, SILLogger);
  __swift_project_value_buffer(v0, (uint64_t)SILLogger);
  return Logger.init(subsystem:category:)();
}

uint64_t SILLogger.unsafeMutableAddressor()
{
  return SILLogger.unsafeMutableAddressor(&one-time initialization token for SILLogger, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)SILLogger);
}

uint64_t one-time initialization function for SILSignpost()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = type metadata accessor for Logger();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for OSSignposter();
  __swift_allocate_value_buffer(v4, SILSignpost);
  __swift_project_value_buffer(v4, (uint64_t)SILSignpost);
  if (one-time initialization token for SILLogger != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v0, (uint64_t)SILLogger);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return OSSignposter.init(logger:)();
}

uint64_t SILSignpost.unsafeMutableAddressor()
{
  return SILLogger.unsafeMutableAddressor(&one-time initialization token for SILSignpost, (uint64_t (*)(_QWORD))MEMORY[0x24BEE77F0], (uint64_t)SILSignpost);
}

uint64_t SILLogger.unsafeMutableAddressor(_QWORD *a1, uint64_t (*a2)(_QWORD), uint64_t a3)
{
  uint64_t v5;

  if (*a1 != -1)
    swift_once();
  v5 = a2(0);
  return __swift_project_value_buffer(v5, a3);
}

uint64_t variable initialization expression of Logging.logLevel()
{
  return 0;
}

uint64_t Logging.log(logType:logModule:logMsg:printer:)(uint64_t result, uint64_t a2, uint64_t a3, void *a4, void (*a5)(_QWORD, unint64_t))
{
  uint64_t v5;
  Swift::String v9;
  Swift::String v10;
  Swift::String v11;
  int v12;
  uint64_t v13;
  Swift::String v14;
  Swift::String v15;

  if ((*(_BYTE *)(v5 + 16) + 1) >= (result + 1))
  {
    v9._countAndFlagsBits = 91;
    v9._object = (void *)0xE100000000000000;
    String.append(_:)(v9);
    _print_unlocked<A, B>(_:_:)();
    v10._countAndFlagsBits = 8285;
    v10._object = (void *)0xE200000000000000;
    String.append(_:)(v10);
    v11._countAndFlagsBits = a3;
    v11._object = a4;
    String.append(_:)(v11);
    v12 = *(unsigned __int8 *)(v5 + 16);
    if (v12 == 3 || !*(_BYTE *)(v5 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
      v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_2454EDE20;
      v14._countAndFlagsBits = 0;
      v14._object = (void *)0xE000000000000000;
      String.append(_:)(v14);
      v15._countAndFlagsBits = 10;
      v15._object = (void *)0xE100000000000000;
      String.append(_:)(v15);
      *(_QWORD *)(v13 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v13 + 32) = 0x5D52474D4C49535BLL;
      *(_QWORD *)(v13 + 40) = 0xE800000000000000;
      print(_:separator:terminator:)();
      swift_bridgeObjectRelease();
      v12 = *(unsigned __int8 *)(v5 + 16);
    }
    if (v12 != 4)
      a5(0, 0xE000000000000000);
    return swift_bridgeObjectRelease();
  }
  return result;
}

Swift::Void __swiftcall Logging.setLogLevel(logType:)(SILManager::LogType logType)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = logType;
}

Swift::Void __swiftcall Logging.info(_:_:)(SILManager::LogModule a1, Swift::String a2)
{
  uint64_t v2;

  (*(void (**)(uint64_t, _QWORD, uint64_t, void *, void (*)(uint64_t, unint64_t), _QWORD))(*(_QWORD *)v2 + 112))(1, a1, a2._countAndFlagsBits, a2._object, closure #1 in Logging.info(_:_:), 0);
}

void closure #1 in Logging.info(_:_:)(uint64_t a1, unint64_t a2)
{
  closure #1 in Logging.info(_:_:)(a1, a2, MEMORY[0x24BEE78F0]);
}

Swift::Void __swiftcall Logging.debug(_:_:)(SILManager::LogModule a1, Swift::String a2)
{
  uint64_t v2;

  (*(void (**)(uint64_t, _QWORD, uint64_t, void *, void (*)(uint64_t, unint64_t), _QWORD))(*(_QWORD *)v2 + 112))(2, a1, a2._countAndFlagsBits, a2._object, closure #1 in Logging.debug(_:_:), 0);
}

void closure #1 in Logging.debug(_:_:)(uint64_t a1, unint64_t a2)
{
  closure #1 in Logging.info(_:_:)(a1, a2, MEMORY[0x24BEE7908]);
}

Swift::Void __swiftcall Logging.error(_:_:)(SILManager::LogModule a1, Swift::String a2)
{
  uint64_t v2;

  (*(void (**)(_QWORD, _QWORD, uint64_t, void *, void (*)(uint64_t, unint64_t), _QWORD))(*(_QWORD *)v2 + 112))(0, a1, a2._countAndFlagsBits, a2._object, closure #1 in Logging.error(_:_:), 0);
}

void closure #1 in Logging.error(_:_:)(uint64_t a1, unint64_t a2)
{
  closure #1 in Logging.info(_:_:)(a1, a2, MEMORY[0x24BEE7910]);
}

Swift::Void __swiftcall Logging.critical(_:_:)(SILManager::LogModule a1, Swift::String a2)
{
  uint64_t v2;

  (*(void (**)(_QWORD, _QWORD, uint64_t, void *, void (*)(uint64_t, unint64_t), _QWORD))(*(_QWORD *)v2 + 112))(0, a1, a2._countAndFlagsBits, a2._object, closure #1 in Logging.critical(_:_:), 0);
}

void closure #1 in Logging.critical(_:_:)(uint64_t a1, unint64_t a2)
{
  closure #1 in Logging.info(_:_:)(a1, a2, MEMORY[0x24BEE7920]);
}

void closure #1 in Logging.info(_:_:)(uint64_t a1, unint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;

  if (one-time initialization token for SILLogger != -1)
    swift_once();
  v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)SILLogger);
  swift_bridgeObjectRetain_n();
  v7 = Logger.logObject.getter();
  v8 = a3();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v11 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2454D6000, v7, v8, "%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249536508](v10, -1, -1);
    MEMORY[0x249536508](v9, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

Swift::String __swiftcall Logging.getIndicatorName(_:)(Swift::Int a1)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  Swift::String result;

  v1 = 0xE500000000000000;
  v2 = 0x63694D7841;
  v3 = 0xE700000000000000;
  v4 = 0x6E776F6E6B6E55;
  if (a1 == 1)
  {
    v4 = 6515021;
    v3 = 0xE300000000000000;
  }
  if (a1 != 2)
  {
    v2 = v4;
    v1 = v3;
  }
  v5 = a1 == 0;
  if (a1)
    v6 = v2;
  else
    v6 = 7168323;
  if (v5)
    v7 = (void *)0xE300000000000000;
  else
    v7 = (void *)v1;
  result._object = v7;
  result._countAndFlagsBits = v6;
  return result;
}

Swift::String __swiftcall Logging.getIndicatorNamesFromMask(_:)(Swift::Int32 a1)
{
  uint64_t v1;
  void *v2;
  unint64_t v3;
  uint64_t (*v4)(void);
  unint64_t v5;
  uint64_t v6;
  void *v7;
  Swift::String v8;
  uint64_t v9;
  Swift::String result;
  Swift::String v11;

  v2 = (void *)0xE000000000000000;
  if (a1 < 1)
  {
    v9 = 0;
  }
  else
  {
    v3 = a1;
    v4 = *(uint64_t (**)(void))(*(_QWORD *)v1 + 160);
    do
    {
      v5 = __clz(__rbit64(v3));
      v6 = (-1 << v5) - 1;
      if (v5 >= 0x40)
        v6 = -1;
      v3 &= v6;
      v11._countAndFlagsBits = v4();
      v11._object = v7;
      swift_bridgeObjectRetain();
      v8._countAndFlagsBits = 44;
      v8._object = (void *)0xE100000000000000;
      String.append(_:)(v8);
      swift_bridgeObjectRelease();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
    }
    while (v3);
    v9 = 0;
    v2 = (void *)0xE000000000000000;
  }
  result._object = v2;
  result._countAndFlagsBits = v9;
  return result;
}

Swift::Bool __swiftcall Logging.getSignpostsEnabled()()
{
  uint64_t v0;

  return *(_BYTE *)(v0 + 16) == 4;
}

uint64_t Logging.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t Logging.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t Logging.__allocating_init()()
{
  uint64_t result;

  result = swift_allocObject();
  *(_BYTE *)(result + 16) = 0;
  return result;
}

uint64_t one-time initialization function for Log()
{
  uint64_t result;

  type metadata accessor for Logging();
  result = swift_allocObject();
  *(_BYTE *)(result + 16) = 0;
  Log = result;
  return result;
}

uint64_t *Log.unsafeMutableAddressor()
{
  if (one-time initialization token for Log != -1)
    swift_once();
  return &Log;
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
    ObjectType = MEMORY[0x24BEE2520];
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
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
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
        return MEMORY[0x24BEE4AF8];
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
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
    return (_QWORD *)MEMORY[0x24BEE4AF8];
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
    v10 = (char *)MEMORY[0x24BEE4AF8];
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

uint64_t specialized LogType.init(rawValue:)(unsigned __int8 a1)
{
  if (a1 <= 5u)
    return (0x40302010005uLL >> (8 * a1));
  else
    return 5;
}

unint64_t specialized LogModule.init(rawValue:)(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of LogModule.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 6)
    return 6;
  else
    return v3;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t lazy protocol witness table accessor for type LogType and conformance LogType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LogType and conformance LogType;
  if (!lazy protocol witness table cache variable for type LogType and conformance LogType)
  {
    result = MEMORY[0x24953649C](&protocol conformance descriptor for LogType, &type metadata for LogType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LogType and conformance LogType);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type LogModule and conformance LogModule()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LogModule and conformance LogModule;
  if (!lazy protocol witness table cache variable for type LogModule and conformance LogModule)
  {
    result = MEMORY[0x24953649C](&protocol conformance descriptor for LogModule, &type metadata for LogModule);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LogModule and conformance LogModule);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LogType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for LogType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_2454E2AF4 + 4 * byte_2454EDC97[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2454E2B28 + 4 * byte_2454EDC92[v4]))();
}

uint64_t sub_2454E2B28(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2454E2B30(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2454E2B38);
  return result;
}

uint64_t sub_2454E2B44(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2454E2B4CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2454E2B50(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2454E2B58(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for LogType(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for LogType(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LogType()
{
  return &type metadata for LogType;
}

uint64_t getEnumTagSinglePayload for LogModule(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for LogModule(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_2454E2C64 + 4 * byte_2454EDCA1[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_2454E2C98 + 4 * byte_2454EDC9C[v4]))();
}

uint64_t sub_2454E2C98(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2454E2CA0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2454E2CA8);
  return result;
}

uint64_t sub_2454E2CB4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2454E2CBCLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_2454E2CC0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2454E2CC8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LogModule()
{
  return &type metadata for LogModule;
}

uint64_t type metadata accessor for Logging()
{
  return objc_opt_self();
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

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t SILError.log()(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  specialized SILError.log()(a1, a2, a3);
  v4 = v3;
  outlined copy of SILError(v3, v5, v6);
  return v4;
}

uint64_t one-time initialization function for PixelFormats()
{
  uint64_t inited;
  void *v1;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(UInt32, PixelFormatInfo)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2454EE080;
  *(_DWORD *)(inited + 32) = 1647534392;
  *(_QWORD *)(inited + 40) = 2;
  *(_QWORD *)(inited + 48) = &outlined read-only object #0 of one-time initialization function for PixelFormats;
  *(_DWORD *)(inited + 56) = 1111970369;
  *(_QWORD *)(inited + 64) = 1;
  *(_QWORD *)(inited + 72) = &outlined read-only object #1 of one-time initialization function for PixelFormats;
  v1 = (void *)specialized Dictionary.init(dictionaryLiteral:)(inited);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (UInt32, PixelFormatInfo));
  result = swift_arrayDestroy();
  PixelFormats._rawValue = v1;
  return result;
}

Swift::Void __swiftcall IOSurfaceLike.clear()()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  size_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, _QWORD *);
  void *v6;
  uint64_t (*v7)(uint64_t, uint64_t, _QWORD *);
  uint64_t v8;
  uint64_t (*v9)(uint64_t, _QWORD *);
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;

  v2 = v1;
  v3 = v0;
  v15 = *MEMORY[0x24BDAC8D0];
  v14 = 403046784;
  v4 = specialized _copyCollectionToContiguousArray<A>(_:)((size_t)&v14, (unint64_t)&v15);
  v5 = (uint64_t (*)(uint64_t, uint64_t, _QWORD *))v2[6];
  v6 = (void *)v5(0, v3, v2);
  v7 = (uint64_t (*)(uint64_t, uint64_t, _QWORD *))v2[7];
  v8 = v7(0, v3, v2);
  v9 = (uint64_t (*)(uint64_t, _QWORD *))v2[2];
  v10 = v9(v3, v2);
  if ((unsigned __int128)(v8 * (__int128)v10) >> 64 != (v8 * v10) >> 63)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  memset_pattern4(v6, (const void *)(v4 + 32), v8 * v10);
  swift_release();
  v11 = (void *)v5(1, v3, v2);
  v12 = v7(1, v3, v2);
  v13 = v9(v3, v2);
  if ((unsigned __int128)(v12 * (__int128)v13) >> 64 != (v12 * v13) >> 63)
    goto LABEL_5;
  bzero(v11, v12 * v13);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SwapWaitType()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance SwapWaitType()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SwapWaitType()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t SILManifest.maxIndicatorBpr.getter()
{
  uint64_t v0;
  uint64_t v1;
  int64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64x2_t v12;
  int64x2_t *v13;
  unint64_t v14;
  int64x2_t v15;
  int8x16_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t *v19;
  int64_t v20;
  int64_t v21;
  uint64_t result;
  _BYTE v23[64];
  uint64_t v24;
  _QWORD *v25;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 + 16);
  v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v25 = (_QWORD *)MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0);
    v4 = v1 + 32;
    v3 = v25;
    do
    {
      outlined init with copy of SILManifest.Indicator(v4, (uint64_t)v23);
      v5 = v24;
      outlined destroy of SILManifest.Indicator((uint64_t)v23);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3[2] + 1, 1);
        v3 = v25;
      }
      v7 = v3[2];
      v6 = v3[3];
      if (v7 >= v6 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v6 > 1, v7 + 1, 1);
        v3 = v25;
      }
      v3[2] = v7 + 1;
      v3[v7 + 4] = v5;
      v4 += 80;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  v8 = v3[2];
  if (v8)
  {
    v9 = v3[4];
    v10 = v8 - 1;
    if (v8 != 1)
    {
      if (v8 < 5)
      {
        v11 = 1;
        goto LABEL_16;
      }
      v11 = v10 & 0xFFFFFFFFFFFFFFFCLL | 1;
      v12 = vdupq_n_s64(v9);
      v13 = (int64x2_t *)(v3 + 7);
      v14 = v10 & 0xFFFFFFFFFFFFFFFCLL;
      v15 = v12;
      do
      {
        v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(v12, v13[-1]), (int8x16_t)v12, (int8x16_t)v13[-1]);
        v15 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(v15, *v13), (int8x16_t)v15, *(int8x16_t *)v13);
        v13 += 2;
        v14 -= 4;
      }
      while (v14);
      v16 = vbslq_s8((int8x16_t)vcgtq_s64(v12, v15), (int8x16_t)v12, (int8x16_t)v15);
      v17 = vextq_s8(v16, v16, 8uLL).u64[0];
      v9 = (int64_t)vbsl_s8((int8x8_t)vcgtd_s64(v16.i64[0], v17), *(int8x8_t *)v16.i8, (int8x8_t)v17);
      if (v10 != (v10 & 0xFFFFFFFFFFFFFFFCLL))
      {
LABEL_16:
        v18 = v8 - v11;
        v19 = &v3[v11 + 4];
        do
        {
          v21 = *v19++;
          v20 = v21;
          if (v9 <= v21)
            v9 = v20;
          --v18;
        }
        while (v18);
      }
    }
    swift_bridgeObjectRelease();
    return v9;
  }
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t SILManifest.__allocating_init(indicators:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  SILManifest.init(indicators:)(a1);
  return v2;
}

uint64_t SILManifest.init(indicators:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64x2_t v14;
  int64x2_t *v15;
  unint64_t v16;
  int64x2_t v17;
  int8x16_t v18;
  uint64_t v19;
  unint64_t v20;
  int64_t *v21;
  int64_t v22;
  int64_t v23;
  uint64_t result;
  _BYTE v25[56];
  uint64_t v26;
  _QWORD *v27;

  v2 = v1;
  *(_QWORD *)(v1 + 16) = a1;
  v3 = *(_QWORD *)(a1 + 16);
  v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v3)
  {
    v27 = (_QWORD *)MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3, 0);
    v6 = a1 + 32;
    v4 = v27;
    do
    {
      outlined init with copy of SILManifest.Indicator(v6, (uint64_t)v25);
      v7 = v26;
      outlined destroy of SILManifest.Indicator((uint64_t)v25);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4[2] + 1, 1);
        v4 = v27;
      }
      v9 = v4[2];
      v8 = v4[3];
      if (v9 >= v8 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v8 > 1, v9 + 1, 1);
        v4 = v27;
      }
      v4[2] = v9 + 1;
      v4[v9 + 4] = v7;
      v6 += 80;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  v10 = v4[2];
  if (v10)
  {
    v11 = v4[4];
    v12 = v10 - 1;
    if (v10 != 1)
    {
      if (v10 < 5)
      {
        v13 = 1;
        goto LABEL_16;
      }
      v13 = v12 & 0xFFFFFFFFFFFFFFFCLL | 1;
      v14 = vdupq_n_s64(v11);
      v15 = (int64x2_t *)(v4 + 7);
      v16 = v12 & 0xFFFFFFFFFFFFFFFCLL;
      v17 = v14;
      do
      {
        v14 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(v14, v15[-1]), (int8x16_t)v14, (int8x16_t)v15[-1]);
        v17 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(v17, *v15), (int8x16_t)v17, *(int8x16_t *)v15);
        v15 += 2;
        v16 -= 4;
      }
      while (v16);
      v18 = vbslq_s8((int8x16_t)vcgtq_s64(v14, v17), (int8x16_t)v14, (int8x16_t)v17);
      v19 = vextq_s8(v18, v18, 8uLL).u64[0];
      v11 = (int64_t)vbsl_s8((int8x8_t)vcgtd_s64(v18.i64[0], v19), *(int8x8_t *)v18.i8, (int8x8_t)v19);
      if (v12 != (v12 & 0xFFFFFFFFFFFFFFFCLL))
      {
LABEL_16:
        v20 = v10 - v13;
        v21 = &v4[v13 + 4];
        do
        {
          v23 = *v21++;
          v22 = v23;
          if (v11 <= v23)
            v11 = v22;
          --v20;
        }
        while (v20);
      }
    }
    swift_bridgeObjectRelease();
    *(_QWORD *)(v2 + 24) = v11;
    return v2;
  }
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t SILManifest.indicatorFromType(type:)@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  Swift::String v8;
  Swift::String v9;
  __int128 v10;
  uint64_t v11;
  uint64_t result;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  v4 = *(_QWORD *)(v2 + 16);
  v5 = *(_QWORD *)(v4 + 16);
  if (!v5)
  {
    swift_bridgeObjectRetain();
LABEL_7:
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v20 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  v7 = v4 + 32;
  swift_bridgeObjectRetain();
  while (1)
  {
    outlined init with copy of SILManifest.Indicator(v7, (uint64_t)&v15);
    if (*((_QWORD *)&v17 + 1) == a1)
      break;
    outlined destroy of SILManifest.Indicator((uint64_t)&v15);
    v7 += 80;
    if (!--v5)
      goto LABEL_7;
  }
  v23 = v18;
  v24 = v19;
  v21 = v16;
  v22 = v17;
  v20 = v15;
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v21 + 1))
  {
LABEL_8:
    *(_QWORD *)&v15 = 0;
    *((_QWORD *)&v15 + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(22);
    swift_bridgeObjectRelease();
    *(_QWORD *)&v15 = 0x6F74616369646E69;
    *((_QWORD *)&v15 + 1) = 0xEA00000000002072;
    v8._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v8);
    swift_bridgeObjectRelease();
    v9._countAndFlagsBits = 0x756F6620746F6E20;
    v9._object = (void *)0xEA0000000000646ELL;
    String.append(_:)(v9);
    v10 = v15;
    lazy protocol witness table accessor for type SILError and conformance SILError();
    swift_allocError();
    *(_OWORD *)v11 = v10;
    *(_BYTE *)(v11 + 16) = 3;
    swift_willThrow();
    return outlined destroy of SILManifest.Indicator?((uint64_t)&v20, &demangling cache variable for type metadata for SILManifest.Indicator?);
  }
  result = outlined init with copy of SILManifest.Indicator?((uint64_t)&v20, (uint64_t)&v15, &demangling cache variable for type metadata for SILManifest.Indicator?);
  if (*((_QWORD *)&v16 + 1))
  {
    result = outlined destroy of SILManifest.Indicator?((uint64_t)&v20, &demangling cache variable for type metadata for SILManifest.Indicator?);
    v13 = v18;
    a2[2] = v17;
    a2[3] = v13;
    a2[4] = v19;
    v14 = v16;
    *a2 = v15;
    a2[1] = v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t specialized MutableCollection<>.sort(by:)(uint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(_QWORD *))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _QWORD v9[2];

  v6 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v6 = a2(v6);
  v7 = *(_QWORD *)(v6 + 16);
  v9[0] = v6 + 32;
  v9[1] = v7;
  result = a3(v9);
  *a1 = v6;
  return result;
}

void one-time initialization function for g_renderers()
{
  g_renderers._rawValue = (void *)MEMORY[0x24BEE4AF8];
}

uint64_t SILRenderer.Region.__allocating_init(extent:surfaces:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v4;

  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_2454EE090;
  swift_beginAccess();
  *(_QWORD *)(v3 + 24) = a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v3 + 32) = 0;
  v4 = (_QWORD *)static Array._allocateBufferUninitialized(minimumCapacity:)();
  v4[2] = 2;
  v4[4] = 0xFFFFLL;
  v4[5] = 0xFFFFLL;
  *(_QWORD *)(v3 + 40) = v4;
  return v3;
}

uint64_t SILRenderer.Region.indicator.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 16);
}

uint64_t SILRenderer.Region.indicator.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*SILRenderer.Region.indicator.modify())()
{
  swift_beginAccess();
  return SILRenderer.Region.indicator.modify;
}

uint64_t SILRenderer.Region.surfaces.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t SILRenderer.Region.surfaces.setter(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 24) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*SILRenderer.Region.surfaces.modify())()
{
  swift_beginAccess();
  return SILRenderer.Region.indicator.modify;
}

uint64_t SILRenderer.Region.currentPageID.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 32);
}

uint64_t SILRenderer.Region.currentPageID.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(v1 + 32) = a1;
  return result;
}

uint64_t (*SILRenderer.Region.currentPageID.modify())()
{
  swift_beginAccess();
  return SILRenderer.Region.indicator.modify;
}

uint64_t SILRenderer.Region.pageContents.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t SILRenderer.Region.pageContents.setter(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 40) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*SILRenderer.Region.pageContents.modify())()
{
  swift_beginAccess();
  return SILRenderer.Region.indicator.modify;
}

uint64_t SILRenderer.Region.needsUpdate(indicator:rotation:frame:blitOffset:)(uint64_t a1, unsigned __int16 a2, unsigned __int8 a3, unsigned __int8 a4, float a5)
{
  uint64_t v5;
  unint64_t v11;
  uint64_t result;
  unint64_t v13;
  int v14;
  int v15;
  int v16;
  float v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  _BOOL4 v26;
  _QWORD v27[10];

  v11 = (*(uint64_t (**)(void))(*(_QWORD *)v5 + 168))();
  result = (*(uint64_t (**)(void))(*(_QWORD *)v5 + 192))();
  if ((v11 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v11 < *(_QWORD *)(result + 16))
  {
    v13 = result + 8 * v11;
    v14 = *(unsigned __int16 *)(v13 + 32);
    v15 = *(unsigned __int8 *)(v13 + 34);
    v16 = *(unsigned __int8 *)(v13 + 35);
    v17 = *(float *)(v13 + 36);
    v18 = swift_bridgeObjectRelease();
    if (v15 == a3 && v16 == a4)
    {
      v19 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 120))(v18);
      v20 = outlined init with copy of SILManifest.Indicator(a1, (uint64_t)v27);
      if (v19 != -1)
      {
        v21 = v27[5];
        v22 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 120))(v20);
        outlined destroy of SILManifest.Indicator((uint64_t)v27);
        v23 = 0;
        v26 = v17 != a5 || v21 != v22 || v14 != a2;
        return v23 | v26;
      }
    }
    else
    {
      outlined init with copy of SILManifest.Indicator(a1, (uint64_t)v27);
    }
    outlined destroy of SILManifest.Indicator((uint64_t)v27);
    v26 = 1;
    v23 = 256;
    return v23 | v26;
  }
  __break(1u);
  return result;
}

uint64_t SILRenderer.Region.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t SILRenderer.CachedEntry.__allocating_init(data:frameDataOffset:)(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t SILManifest.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t SILRenderer.displayExtent.getter()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[3];
  uint64_t v6;
  uint64_t v7;

  result = outlined init with copy of SILManifest.Indicator?(v0 + 24, (uint64_t)v5, &demangling cache variable for type metadata for SILBackend?);
  v2 = v6;
  if (v6)
  {
    v3 = v7;
    __swift_project_boxed_opaque_existential_1(v5, v6);
    v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 56))(v2, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t SILRenderer.regions.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t SILRenderer.regions.setter(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 72) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*SILRenderer.regions.modify())()
{
  swift_beginAccess();
  return SILRenderer.Region.indicator.modify;
}

uint64_t SILRenderer.cache.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t SILRenderer.cache.setter(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 80) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*SILRenderer.cache.modify())()
{
  swift_beginAccess();
  return SILRenderer.Region.indicator.modify;
}

uint64_t SILRenderer.decoding_buffer.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 88);
}

uint64_t SILRenderer.decoding_buffer.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(v1 + 88) = a1;
  return result;
}

uint64_t (*SILRenderer.decoding_buffer.modify())()
{
  swift_beginAccess();
  return SILRenderer.decoding_buffer.modify;
}

uint64_t SILRenderer.decoding_scratch_buffer.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 96);
}

uint64_t SILRenderer.decoding_scratch_buffer.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(v1 + 96) = a1;
  return result;
}

uint64_t (*SILRenderer.decoding_scratch_buffer.modify())()
{
  swift_beginAccess();
  return SILRenderer.Region.indicator.modify;
}

uint64_t SILRenderer.sentSwap.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 104);
}

uint64_t SILRenderer.sentSwap.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(v1 + 104) = a1;
  return result;
}

uint64_t (*SILRenderer.sentSwap.modify())()
{
  swift_beginAccess();
  return SILRenderer.Region.indicator.modify;
}

uint64_t SILRenderer.__allocating_init(id:backend:)(int a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  SILRenderer.init(id:backend:)(a1, a2);
  return v4;
}

uint64_t SILRenderer.init(id:backend:)(int a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t rawValue;
  uint64_t v8;
  Swift::String v9;
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  uint64_t v17;
  _QWORD *v18;
  int v19;
  uint64_t v20;
  int v21;
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
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t (*v38)(uint64_t);
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD *v47;
  _QWORD *v48;
  uint64_t *v49;
  uint64_t v50;
  Swift::String v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unsigned __int8 v58;
  unsigned __int8 v59;
  uint64_t v60;
  _QWORD *v62;
  uint64_t v63;
  _QWORD *v64;

  v3 = v2;
  v6 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v2 + 72) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v2 + 80) = v6;
  if (one-time initialization token for g_renderers != -1)
    swift_once();
  swift_beginAccess();
  rawValue = (unint64_t)g_renderers._rawValue;
  v62 = a2;
  if ((unint64_t)g_renderers._rawValue >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = _CocoaArrayWrapper.endIndex.getter();
    if (!v8)
      goto LABEL_19;
  }
  else
  {
    v8 = *(_QWORD *)(((unint64_t)g_renderers._rawValue & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v8)
      goto LABEL_19;
  }
  if ((rawValue & 0xC000000000000001) != 0)
  {
    v19 = *(_DWORD *)(MEMORY[0x249535F20](0, rawValue) + 16);
    swift_unknownObjectRelease();
    if (v19 == a1)
      goto LABEL_7;
  }
  else if (*(_DWORD *)(*(_QWORD *)(rawValue + 32) + 16) == a1)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    _StringGuts.grow(_:)(20);
    swift_bridgeObjectRelease();
    v9._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v9);
    swift_bridgeObjectRelease();
    v10._countAndFlagsBits = 0x79646165726C6120;
    v10._object = (void *)0xEF73747369786520;
    String.append(_:)(v10);
    specialized SILError.log()(2114633, 0xE300000000000000, 1);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    outlined copy of SILError(v11, v13, v15);
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type SILError and conformance SILError();
    swift_allocError();
    *(_QWORD *)v17 = v12;
    *(_QWORD *)(v17 + 8) = v14;
    *(_BYTE *)(v17 + 16) = v16;
    swift_willThrow();
    v18 = v62;
LABEL_27:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for SILRenderer();
    swift_deallocPartialClassInstance();
    v53 = (uint64_t)v18;
    goto LABEL_28;
  }
  if (v8 != 1)
  {
    v20 = 5;
    while (1)
    {
      if ((rawValue & 0xC000000000000001) != 0)
      {
        v21 = *(_DWORD *)(MEMORY[0x249535F20](v20 - 4, rawValue) + 16);
        swift_unknownObjectRelease();
        if (v21 == a1)
          goto LABEL_7;
      }
      else if (*(_DWORD *)(*(_QWORD *)(rawValue + 8 * v20) + 16) == a1)
      {
        goto LABEL_7;
      }
      v22 = v20 - 3;
      if (__OFADD__(v20 - 4, 1))
        break;
      ++v20;
      if (v22 == v8)
        goto LABEL_19;
    }
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
LABEL_19:
  swift_bridgeObjectRelease();
  v18 = v62;
  v23 = v62[3];
  v24 = v62[4];
  __swift_project_boxed_opaque_existential_1(v62, v23);
  v25 = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 16))(v23, v24);
  getIgnoreManifestFileList(directoryName:)(v25, v26);
  v28 = v27;
  swift_bridgeObjectRelease();
  v29 = v62[3];
  v30 = v62[4];
  __swift_project_boxed_opaque_existential_1(v18, v18[3]);
  v31 = (*(uint64_t (**)(uint64_t, uint64_t))(v30 + 16))(v29, v30);
  v33 = getManifestFiles(directoryName:)(v31, v32);
  swift_bridgeObjectRelease();
  v64 = v33;
  if (*(_QWORD *)(v28 + 16))
  {
    v34 = swift_bridgeObjectRetain();
    v35 = specialized _ArrayProtocol.filter(_:)(v34, v28);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v64 = (_QWORD *)v35;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  specialized MutableCollection<>.sort(by:)((uint64_t *)&v64, (uint64_t (*)(uint64_t))specialized _ArrayBuffer._consumeAndCreateNew(), specialized UnsafeMutableBufferPointer._stableSortImpl(by:));
  v36 = swift_bridgeObjectRetain();
  v37 = (uint64_t *)specialized static SILManifest.createFromManifestFiles(manifests:)(v36);
  swift_bridgeObjectRelease();
  if (!v37)
  {
    swift_bridgeObjectRelease();
    specialized SILError.log()(0, 0, 7);
    v55 = v54;
    v57 = v56;
    v59 = v58;
    lazy protocol witness table accessor for type SILError and conformance SILError();
    swift_allocError();
    *(_QWORD *)v60 = v55;
    *(_QWORD *)(v60 + 8) = v57;
    *(_BYTE *)(v60 + 16) = v59;
    outlined copy of SILError(v55, v57, v59);
    swift_willThrow();
    goto LABEL_27;
  }
  *(_DWORD *)(v3 + 16) = a1;
  outlined init with copy of SILFileHandle((uint64_t)v62, v3 + 24);
  *(_QWORD *)(v3 + 64) = v37;
  *(_QWORD *)(v3 + 104) = 0;
  v38 = *(uint64_t (**)(uint64_t))(*v37 + 96);
  v39 = swift_retain();
  v40 = v38(v39);
  compression_decode_scratch_buffer_size(COMPRESSION_LZFSE);
  if ((unsigned __int128)(v37[3] * (__int128)v40) >> 64 != (v37[3] * v40) >> 63)
    goto LABEL_30;
  *(_QWORD *)(v3 + 88) = swift_slowAlloc();
  *(_QWORD *)(v3 + 96) = swift_slowAlloc();
  v63 = MEMORY[0x24BEE4AF8];
  specialized ContiguousArray.reserveCapacity(_:)();
  type metadata accessor for SILRenderer.Region();
  v41 = (_QWORD *)swift_allocObject();
  v41[2] = -1;
  v41[3] = 0;
  swift_beginAccess();
  v41[3] = 0;
  swift_bridgeObjectRelease();
  v41[4] = 0;
  v42 = (_QWORD *)static Array._allocateBufferUninitialized(minimumCapacity:)();
  v42[2] = 2;
  v42[4] = 0xFFFFLL;
  v42[5] = 0xFFFFLL;
  v41[5] = v42;
  specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
  specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
  specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized ContiguousArray._endMutation()();
  v43 = (_QWORD *)swift_allocObject();
  v43[2] = -1;
  v43[3] = 0;
  swift_beginAccess();
  v43[3] = 0;
  swift_bridgeObjectRelease();
  v43[4] = 0;
  v44 = (_QWORD *)static Array._allocateBufferUninitialized(minimumCapacity:)();
  v44[2] = 2;
  v44[4] = 0xFFFFLL;
  v44[5] = 0xFFFFLL;
  v43[5] = v44;
  specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
  specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
  specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized ContiguousArray._endMutation()();
  v45 = (_QWORD *)swift_allocObject();
  v45[2] = -1;
  v45[3] = 0;
  swift_beginAccess();
  v45[3] = 0;
  swift_bridgeObjectRelease();
  v45[4] = 0;
  v46 = (_QWORD *)static Array._allocateBufferUninitialized(minimumCapacity:)();
  v46[2] = 2;
  v46[4] = 0xFFFFLL;
  v46[5] = 0xFFFFLL;
  v45[5] = v46;
  specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
  specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
  specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized ContiguousArray._endMutation()();
  v47 = (_QWORD *)swift_allocObject();
  v47[2] = -1;
  v47[3] = 0;
  swift_beginAccess();
  v47[3] = 0;
  swift_bridgeObjectRelease();
  v47[4] = 0;
  v48 = (_QWORD *)static Array._allocateBufferUninitialized(minimumCapacity:)();
  v48[2] = 2;
  v48[4] = 0xFFFFLL;
  v48[5] = 0xFFFFLL;
  v47[5] = v48;
  specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
  specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
  specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized ContiguousArray._endMutation()();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(_QWORD *)(v3 + 72) = v63;
  swift_bridgeObjectRelease();
  v49 = Log.unsafeMutableAddressor();
  swift_beginAccess();
  v50 = *v49;
  swift_retain();
  _StringGuts.grow(_:)(30);
  swift_bridgeObjectRelease();
  v51._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v51);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, unint64_t, unint64_t))(*(_QWORD *)v50 + 152))(4, 0xD00000000000001CLL, 0x80000002454EE9F0);
  swift_release();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v52 = swift_retain();
  MEMORY[0x249535E0C](v52);
  if (*(_QWORD *)(((unint64_t)g_renderers._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)(((unint64_t)g_renderers._rawValue & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
LABEL_31:
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_endAccess();
  swift_release();
  v53 = (uint64_t)v62;
LABEL_28:
  __swift_destroy_boxed_opaque_existential_1(v53);
  return v3;
}

uint64_t SILRenderer.__deallocating_deinit()
{
  uint64_t v0;

  swift_beginAccess();
  MEMORY[0x249536508](*(_QWORD *)(v0 + 88), -1, -1);
  swift_beginAccess();
  MEMORY[0x249536508](*(_QWORD *)(v0 + 96), -1, -1);
  outlined destroy of SILManifest.Indicator?(v0 + 24, &demangling cache variable for type metadata for SILBackend?);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t specialized Array.remove(at:)(unint64_t a1)
{
  unint64_t *v1;
  unint64_t v3;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v3 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0)
  {
    specialized _ArrayBuffer._consumeAndCreateNew()(v3);
  }
  v5 = v3 & 0xFFFFFFFFFFFFFF8;
  v6 = *(_QWORD *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    v7 = v6 - 1;
    v8 = v6 - 1 - a1;
    if (v8 >= 0)
    {
      v9 = v5 + 8 * a1;
      v10 = *(_QWORD *)(v9 + 32);
      memmove((void *)(v9 + 32), (const void *)(v9 + 40), 8 * v8);
      *(_QWORD *)(v5 + 16) = v7;
      specialized Array._endMutation()();
      return v10;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SILRenderer.updateRegionSurfaceSize(region_id:extent:)(Swift::Int region_id, Swift::Int extent)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t *v18;
  Swift::String v19;
  _QWORD *rawValue;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  _QWORD *v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  Swift::Int v37;
  uint64_t v38;
  uint64_t v39;

  v4 = v2;
  v7 = v2 + 24;
  outlined init with copy of SILManifest.Indicator?(v2 + 24, (uint64_t)&v36, &demangling cache variable for type metadata for SILBackend?);
  v8 = v38;
  if (!v38)
  {
    __break(1u);
    goto LABEL_39;
  }
  v9 = v39;
  __swift_project_boxed_opaque_existential_1(&v36, v38);
  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 64))(v8, v9);
  if (v10 > extent)
    extent = v10;
  v11 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v36);
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 152))(v11);
  if ((v12 & 0xC000000000000001) == 0)
  {
    if (region_id < 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10) > (unint64_t)region_id)
    {
      v4 = *(_QWORD *)(v12 + 8 * region_id + 32);
      swift_retain();
      goto LABEL_8;
    }
    __break(1u);
LABEL_32:
    swift_once();
    goto LABEL_12;
  }
  v4 = MEMORY[0x249535F20](region_id, v12);
LABEL_8:
  v13 = swift_bridgeObjectRelease();
  v14 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 144))(v13);
  if (v14)
  {
    if (!*(_QWORD *)(v14 + 16))
    {
LABEL_36:
      __break(1u);
LABEL_37:
      region_id = (Swift::Int)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(region_id + 16) + 1, 1, (_QWORD *)region_id, &demangling cache variable for type metadata for _ContiguousArrayStorage<IOSurfaceLike>, &demangling cache variable for type metadata for IOSurfaceLike);
      goto LABEL_18;
    }
    outlined init with copy of SILFileHandle(v14 + 32, (uint64_t)&v36);
    v15 = v38;
    v16 = v39;
    __swift_project_boxed_opaque_existential_1(&v36, v38);
    swift_bridgeObjectRelease();
    v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v15, v16);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v36);
    if (v17 == extent)
    {
LABEL_28:
      swift_release();
      return;
    }
  }
  v18 = Log.unsafeMutableAddressor();
  swift_beginAccess();
  v8 = *v18;
  v36 = 0;
  v37 = 0xE000000000000000;
  swift_retain();
  _StringGuts.grow(_:)(34);
  swift_bridgeObjectRelease();
  v36 = 0xD000000000000020;
  v37 = 0x80000002454EEA10;
  *(_QWORD *)&v33 = region_id;
  v19._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v19);
  swift_bridgeObjectRelease();
  region_id = v37;
  (*(void (**)(uint64_t, unint64_t, Swift::Int))(*(_QWORD *)v8 + 152))(4, v36, v37);
  swift_release();
  swift_bridgeObjectRelease();
  if (one-time initialization token for PixelFormats != -1)
    goto LABEL_32;
LABEL_12:
  rawValue = PixelFormats._rawValue;
  if (!*((_QWORD *)PixelFormats._rawValue + 2))
  {
    __break(1u);
    goto LABEL_34;
  }
  v21 = specialized __RawDictionaryStorage.find<A>(_:)(0x62336138u);
  if ((v22 & 1) == 0)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v23 = *(_QWORD *)(rawValue[7] + 16 * v21 + 8);
  if (!*(_QWORD *)(v23 + 16))
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v8 = *(_QWORD *)(v23 + 32);
  outlined init with copy of SILManifest.Indicator?(v7, (uint64_t)&v33, &demangling cache variable for type metadata for SILBackend?);
  v24 = v34;
  if (!v34)
    goto LABEL_39;
  v25 = v35;
  __swift_project_boxed_opaque_existential_1(&v33, v34);
  (*(void (**)(unint64_t *__return_ptr, Swift::Int, uint64_t, uint64_t, uint64_t))(v25 + 24))(&v36, extent, v8, v24, v25);
  if (v3)
  {
LABEL_22:
    swift_release();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v33);
    return;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v33);
  outlined init with copy of SILFileHandle((uint64_t)&v36, (uint64_t)&v33);
  region_id = MEMORY[0x24BEE4AF8];
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    goto LABEL_37;
LABEL_18:
  v27 = *(_QWORD *)(region_id + 16);
  v26 = *(_QWORD *)(region_id + 24);
  if (v27 >= v26 >> 1)
    region_id = (Swift::Int)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v26 > 1), v27 + 1, 1, (_QWORD *)region_id, &demangling cache variable for type metadata for _ContiguousArrayStorage<IOSurfaceLike>, &demangling cache variable for type metadata for IOSurfaceLike);
  *(_QWORD *)(region_id + 16) = v27 + 1;
  outlined init with take of SILFileHandle(&v33, region_id + 40 * v27 + 32);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v36);
  outlined init with copy of SILManifest.Indicator?(v7, (uint64_t)&v33, &demangling cache variable for type metadata for SILBackend?);
  v28 = v34;
  if (v34)
  {
    v29 = v35;
    __swift_project_boxed_opaque_existential_1(&v33, v34);
    (*(void (**)(unint64_t *__return_ptr, Swift::Int, uint64_t, uint64_t, uint64_t))(v29 + 24))(&v36, extent, v8, v28, v29);
    if (v3)
      goto LABEL_22;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v33);
    outlined init with copy of SILFileHandle((uint64_t)&v36, (uint64_t)&v33);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      region_id = (Swift::Int)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(region_id + 16) + 1, 1, (_QWORD *)region_id, &demangling cache variable for type metadata for _ContiguousArrayStorage<IOSurfaceLike>, &demangling cache variable for type metadata for IOSurfaceLike);
    v31 = *(_QWORD *)(region_id + 16);
    v30 = *(_QWORD *)(region_id + 24);
    if (v31 >= v30 >> 1)
      region_id = (Swift::Int)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v30 > 1), v31 + 1, 1, (_QWORD *)region_id, &demangling cache variable for type metadata for _ContiguousArrayStorage<IOSurfaceLike>, &demangling cache variable for type metadata for IOSurfaceLike);
    *(_QWORD *)(region_id + 16) = v31 + 1;
    outlined init with take of SILFileHandle(&v33, region_id + 40 * v31 + 32);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v36);
    (*(void (**)(Swift::Int))(*(_QWORD *)v4 + 152))(region_id);
    v32 = (_QWORD *)static Array._allocateBufferUninitialized(minimumCapacity:)();
    v32[2] = 2;
    v32[4] = 0xFFFFLL;
    v32[5] = 0xFFFFLL;
    (*(void (**)(void))(*(_QWORD *)v4 + 200))();
    goto LABEL_28;
  }
LABEL_39:
  __break(1u);
}

uint64_t SILRenderer.readIndicator(indicator:frame:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void (*v3)(_BYTE *, _QWORD);
  uint64_t v4;
  uint64_t v5;
  void (*v6)(_BYTE *, _QWORD);
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void (*v20)(_BYTE *, _QWORD);
  uint64_t (*v21)(_BYTE *);
  _QWORD *v22;
  _QWORD *v23;
  uint64_t (*v24)(_BYTE *);
  void (*v25)(_BYTE *, _QWORD);
  _QWORD *v26;
  _QWORD *v27;
  uint64_t (*v29)(void);
  _BYTE v31[32];
  uint64_t v32;

  v6 = v3;
  v29 = *(uint64_t (**)(void))(*(_QWORD *)v3 + 176);
  v9 = v29();
  v32 = v4;
  if (v9 >> 62)
  {
    v10 = _CocoaArrayWrapper.endIndex.getter();
    if (!v10)
      goto LABEL_17;
  }
  else
  {
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v10)
      goto LABEL_17;
  }
  if ((v9 & 0xC000000000000001) != 0)
  {
    v5 = *(_QWORD *)(MEMORY[0x249535F20](0, v9) + 24);
    swift_unknownObjectRelease();
    if (v5 == a2)
      goto LABEL_5;
  }
  else if (*(_QWORD *)(*(_QWORD *)(v9 + 32) + 24) == a2)
  {
LABEL_5:
    swift_bridgeObjectRelease();
    v11 = 0;
LABEL_26:
    v24 = *(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 192);
    v25 = (void (*)(_BYTE *, _QWORD))v24(v31);
    v5 = specialized Array.remove(at:)(v11);
    v25(v31, 0);
    swift_retain();
    v6 = (void (*)(_BYTE *, _QWORD))v24(v31);
    v27 = v26;
    MEMORY[0x249535E0C]();
    if (*(_QWORD *)((*v27 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(_QWORD *)((*v27 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_27;
    goto LABEL_30;
  }
  if (v10 != 1)
  {
    v5 = 5;
    while (1)
    {
      v11 = v5 - 4;
      if ((v9 & 0xC000000000000001) != 0)
      {
        v12 = *(_QWORD *)(MEMORY[0x249535F20](v5 - 4, v9) + 24);
        swift_unknownObjectRelease();
        if (v12 == a2)
          goto LABEL_25;
      }
      else if (*(_QWORD *)(*(_QWORD *)(v9 + 8 * v5) + 24) == a2)
      {
LABEL_25:
        swift_bridgeObjectRelease();
        goto LABEL_26;
      }
      v13 = v5 - 3;
      if (__OFADD__(v11, 1))
        break;
      ++v5;
      if (v13 == v10)
        goto LABEL_17;
    }
    __break(1u);
LABEL_30:
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
LABEL_27:
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    v6(v31, 0);
    return v5;
  }
LABEL_17:
  swift_bridgeObjectRelease();
  v14 = a1[3];
  v15 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v14);
  v16 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 8))(a2, a3, v14, v15);
  if (!v32)
  {
    v17 = v16;
    type metadata accessor for SILRenderer.CachedEntry();
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v17;
    *(_QWORD *)(v5 + 24) = a2;
    v18 = v29();
    if (v18 >> 62)
      v19 = _CocoaArrayWrapper.endIndex.getter();
    else
      v19 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRelease();
    if (v19 >= 8)
    {
      v20 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 192))(v31);
      specialized Array.remove(at:)(0);
      swift_release();
      v20(v31, 0);
    }
    v21 = *(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 192);
    swift_retain();
    v6 = (void (*)(_BYTE *, _QWORD))v21(v31);
    v23 = v22;
    MEMORY[0x249535E0C]();
    if (*(_QWORD *)((*v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    goto LABEL_27;
  }
  return v5;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SILRenderer.setPower(power_state:sync:)(Swift::Bool power_state, Swift::Bool sync)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  outlined init with copy of SILManifest.Indicator?(v2 + 24, (uint64_t)v7, &demangling cache variable for type metadata for SILBackend?);
  v5 = v8;
  if (v8)
  {
    v6 = v9;
    __swift_project_boxed_opaque_existential_1(v7, v8);
    (*(void (**)(Swift::Bool, Swift::Bool, uint64_t, uint64_t))(v6 + 8))(power_state, sync, v5, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  }
  else
  {
    __break(1u);
  }
}

uint64_t SILRenderer.swap(region_id:indicator_idx:position:z_rotation:frame_number:opacity:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, float a6, float a7)
{
  _QWORD **v7;
  uint64_t v8;
  _QWORD **v9;
  double v12;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unsigned int v37;
  int v38;
  uint64_t v39;
  unsigned int v40;
  double v41;
  double v42;
  uint64_t *v43;
  Swift::String v44;
  Swift::String v45;
  Swift::String v46;
  Swift::String v47;
  Swift::String v48;
  Swift::String v49;
  Swift::String v50;
  Swift::String v51;
  Swift::String v52;
  Swift::String v53;
  Swift::String v54;
  Swift::String v55;
  Swift::String v56;
  Swift::String v57;
  uint64_t v58;
  char v59;
  Swift::String v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unsigned __int8 v65;
  unsigned __int8 v66;
  uint64_t v67;
  Swift::String v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unsigned __int8 v73;
  unsigned __int8 v74;
  uint64_t v75;
  uint64_t result;
  double v77;
  double v78;
  unsigned int v79;
  Swift::String v80;
  Swift::String v81;
  Swift::String v82;
  Swift::String v83;
  Swift::String v84;
  Swift::String v85;
  Swift::String v86;
  Swift::String v87;
  Swift::String v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unsigned __int8 v93;
  unsigned __int8 v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  Swift::String v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t *v102;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v104;
  uint64_t v105;
  unint64_t *v106;
  char v107;
  unint64_t *v108;
  char v109;
  unint64_t *v110;
  char v111;
  _QWORD *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  BOOL v122;
  uint64_t v123;
  uint64_t (*v124)(uint64_t);
  unsigned int v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  _QWORD *v130;
  uint64_t (*v131)(void);
  unint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  uint64_t v136;
  uint64_t v137;
  _QWORD v138[5];
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  _QWORD v142[4];
  char v143;
  _QWORD v144[4];
  char v145;

  v9 = v7;
  *(float *)&v12 = a6;
  v17 = (*v7)[19];
  v18 = ((uint64_t (*)(void))v17)();
  if (v18 >> 62)
    v19 = _CocoaArrayWrapper.endIndex.getter();
  else
    v19 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRelease();
  if (v19 <= a1)
  {
    _StringGuts.grow(_:)(17);
    swift_bridgeObjectRelease();
    v133 = a1;
    v60._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v60);
    swift_bridgeObjectRelease();
    a1 = 0xEF206E6F69676572;
    specialized SILError.log()(0x2064696C61766E49, 0xEF206E6F69676572, 3);
    v62 = v61;
    v64 = v63;
    v66 = v65;
    outlined copy of SILError(v61, v63, v65);
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type SILError and conformance SILError();
    swift_allocError();
    *(_QWORD *)v67 = v62;
    *(_QWORD *)(v67 + 8) = v64;
    *(_BYTE *)(v67 + 16) = v66;
    swift_willThrow();
    return a1;
  }
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*v9[8] + 112))(&v139, a2);
  if (v8)
    return a1;
  v20 = v141;
  if (*(_QWORD *)(v141 + 16) <= (unint64_t)(unsigned __int16)a3)
  {
    _StringGuts.grow(_:)(19);
    swift_bridgeObjectRelease();
    v133 = 0xD000000000000011;
    v134 = 0x80000002454EEA40;
    LOWORD(v138[0]) = a3;
    v68._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v68);
    swift_bridgeObjectRelease();
    a1 = 0x80000002454EEA40;
    specialized SILError.log()(0xD000000000000011, 0x80000002454EEA40, 3);
    v70 = v69;
    v72 = v71;
    v74 = v73;
    outlined copy of SILError(v69, v71, v73);
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type SILError and conformance SILError();
    swift_allocError();
    *(_QWORD *)v75 = v70;
    *(_QWORD *)(v75 + 8) = v72;
    *(_BYTE *)(v75 + 16) = v74;
    swift_willThrow();
LABEL_31:
    outlined destroy of SILManifest.Indicator((uint64_t)&v139);
    return a1;
  }
  v21 = (unint64_t)v9;
  v22 = ((uint64_t (*)(uint64_t, uint64_t))(*v9)[35])(a1, v140);
  if (*(_QWORD *)(v20 + 16) <= (unint64_t)(unsigned __int16)a3)
  {
    __break(1u);
  }
  else
  {
    v23 = v20 + 16 * (unsigned __int16)a3;
    v24 = *(_QWORD *)(v23 + 32);
    v25 = *(_QWORD *)(v23 + 40);
    v26 = ((uint64_t (*)(uint64_t))v17)(v22);
    v21 = v26;
    v126 = v25;
    v127 = v24;
    if ((v26 & 0xC000000000000001) == 0)
    {
      if (a1 < 0)
      {
        __break(1u);
      }
      else if (*(_QWORD *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a1)
      {
        v24 = *(_QWORD *)(v26 + 8 * a1 + 32);
        swift_retain();
        goto LABEL_11;
      }
      __break(1u);
LABEL_89:
      __break(1u);
      goto LABEL_90;
    }
  }
  v24 = MEMORY[0x249535F20](a1, v21);
LABEL_11:
  v27 = swift_bridgeObjectRelease();
  v25 = *(_QWORD *)(*(_QWORD *)v24 + 168);
  v21 = v24;
  v17 = ((uint64_t (*)(uint64_t))v25)(v27);
  v131 = *(uint64_t (**)(void))(*(_QWORD *)v24 + 144);
  v28 = v131();
  if (!v28)
    goto LABEL_117;
  if ((v17 & 0x8000000000000000) != 0)
    goto LABEL_89;
  a1 = v28;
  if (v17 >= *(_QWORD *)(v28 + 16))
  {
LABEL_90:
    __break(1u);
LABEL_91:
    __break(1u);
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  v132 = v17;
  outlined init with copy of SILFileHandle(v28 + 40 * v17 + 32, (uint64_t)&v133);
  swift_bridgeObjectRelease();
  v29 = v135;
  v30 = v136;
  __swift_project_boxed_opaque_existential_1(&v133, v135);
  v31 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v30 + 72))(0, v29, v30);
  if ((v31 & 0x8000000000000000) != 0)
    goto LABEL_125;
  v17 = v31;
  if (HIDWORD(v31))
    goto LABEL_125;
  v32 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v133);
  v21 = v24;
  v33 = ((uint64_t (*)(uint64_t))v131)(v32);
  if (!v33)
    goto LABEL_118;
  a1 = v33;
  v124 = (uint64_t (*)(uint64_t))v25;
  v130 = (_QWORD *)v24;
  if (v132 >= *(_QWORD *)(v33 + 16))
    goto LABEL_91;
  outlined init with copy of SILFileHandle(v33 + 40 * v132 + 32, (uint64_t)&v133);
  swift_bridgeObjectRelease();
  a1 = v135;
  v34 = v136;
  __swift_project_boxed_opaque_existential_1(&v133, v135);
  v35 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v34 + 64))(0, a1, v34);
  if ((v35 & 0x8000000000000000) != 0)
    goto LABEL_125;
  v25 = v35;
  if (HIDWORD(v35))
    goto LABEL_125;
  v36 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v133);
  v24 = (*v9)[18];
  v21 = (unint64_t)v9;
  v37 = ((uint64_t (*)(uint64_t))v24)(v36);
  v38 = v37 - v17;
  if (v37 < v17)
    goto LABEL_92;
  a1 = (v38 - 1);
  if (!v38)
  {
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
  v21 = (unint64_t)v9;
  v39 = ((uint64_t (*)(void))v24)();
  if (HIDWORD(v39) < v25)
  {
LABEL_94:
    __break(1u);
    goto LABEL_95;
  }
  v40 = HIDWORD(v39) - v25 - 1;
  if (HIDWORD(v39) == (_DWORD)v25)
  {
LABEL_95:
    __break(1u);
LABEL_96:
    __break(1u);
    goto LABEL_97;
  }
  v41 = (double)a1;
  v42 = (double)v40;
  if ((double)a1 >= a4 && v42 >= a5)
  {
    LODWORD(v129) = 0;
    LODWORD(v24) = 0;
    goto LABEL_27;
  }
  v77 = a4 - v41;
  if (a4 - v41 <= 0.0)
    v77 = 0.0;
  if ((~*(_QWORD *)&v77 & 0x7FF0000000000000) == 0)
    goto LABEL_96;
  if (v77 <= -1.0)
  {
LABEL_97:
    __break(1u);
    goto LABEL_98;
  }
  if (v77 >= 256.0)
  {
LABEL_98:
    __break(1u);
LABEL_99:
    __break(1u);
    goto LABEL_100;
  }
  v78 = a5 - v42;
  if (a5 - v42 <= 0.0)
    v78 = 0.0;
  if ((~*(_QWORD *)&v78 & 0x7FF0000000000000) == 0)
    goto LABEL_99;
  if (v78 <= -1.0)
  {
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  if (v78 >= 256.0)
  {
LABEL_101:
    __break(1u);
LABEL_102:
    __break(1u);
    goto LABEL_103;
  }
  v79 = (int)v77;
  if (v41 < a4)
    a4 = (double)a1;
  if (v42 < a5)
    a5 = (double)v40;
  a1 = v140 + v79;
  if (__OFADD__(v140, v79))
    goto LABEL_102;
  v24 = (int)v77;
  v21 = (int)v78;
  outlined init with copy of SILManifest.Indicator((uint64_t)&v139, (uint64_t)&v133);
  if ((uint64_t)v17 < a1)
  {
    outlined destroy of SILManifest.Indicator((uint64_t)&v133);
LABEL_52:
    v133 = 0;
    v134 = 0xE000000000000000;
    _StringGuts.grow(_:)(52);
    v80._countAndFlagsBits = 0x66666F2074696C42;
    v80._object = (void *)0xED00002820746573;
    String.append(_:)(v80);
    LOBYTE(v138[0]) = v24;
    v81._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v81);
    swift_bridgeObjectRelease();
    v82._countAndFlagsBits = 8236;
    v82._object = (void *)0xE200000000000000;
    String.append(_:)(v82);
    LOBYTE(v138[0]) = v21;
    v83._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v83);
    swift_bridgeObjectRelease();
    v84._countAndFlagsBits = 0xD00000000000001ALL;
    v84._object = (void *)0x80000002454EEB20;
    String.append(_:)(v84);
    LODWORD(v138[0]) = v17;
    v85._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v85);
    swift_bridgeObjectRelease();
    v86._countAndFlagsBits = 8236;
    v86._object = (void *)0xE200000000000000;
    String.append(_:)(v86);
    LODWORD(v138[0]) = v25;
    v87._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v87);
    swift_bridgeObjectRelease();
    v88._countAndFlagsBits = 41;
    v88._object = (void *)0xE100000000000000;
    String.append(_:)(v88);
    a1 = v134;
    specialized SILError.log()(v133, v134, 5);
    v90 = v89;
    v92 = v91;
    v94 = v93;
    outlined copy of SILError(v89, v91, v93);
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type SILError and conformance SILError();
    swift_allocError();
    *(_QWORD *)v95 = v90;
    *(_QWORD *)(v95 + 8) = v92;
    *(_BYTE *)(v95 + 16) = v94;
    swift_willThrow();
    swift_release();
    goto LABEL_31;
  }
  a1 = v137;
  outlined destroy of SILManifest.Indicator((uint64_t)&v133);
  if (__OFADD__(a1, v21))
  {
LABEL_103:
    __break(1u);
    goto LABEL_104;
  }
  if (v25 < a1 + v21)
    goto LABEL_52;
  LODWORD(v129) = v21;
LABEL_27:
  v43 = Log.unsafeMutableAddressor();
  swift_beginAccess();
  v128 = *v43;
  v133 = 0;
  v134 = 0xE000000000000000;
  swift_retain();
  _StringGuts.grow(_:)(85);
  v44._countAndFlagsBits = 0xD00000000000001BLL;
  v44._object = (void *)0x80000002454EEAE0;
  String.append(_:)(v44);
  v138[0] = a2;
  v45._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v45);
  swift_bridgeObjectRelease();
  v46._countAndFlagsBits = 0x2820746120;
  v46._object = (void *)0xE500000000000000;
  String.append(_:)(v46);
  Double.write<A>(to:)();
  v47._countAndFlagsBits = 43;
  v47._object = (void *)0xE100000000000000;
  String.append(_:)(v47);
  v125 = v24;
  LOBYTE(v138[0]) = v24;
  v48._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v48);
  swift_bridgeObjectRelease();
  v49._countAndFlagsBits = 8236;
  v49._object = (void *)0xE200000000000000;
  String.append(_:)(v49);
  Double.write<A>(to:)();
  v50._countAndFlagsBits = 43;
  v50._object = (void *)0xE100000000000000;
  String.append(_:)(v50);
  LOBYTE(v138[0]) = v129;
  v51._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v51);
  swift_bridgeObjectRelease();
  v52._countAndFlagsBits = 0x20746F720A29;
  v52._object = (void *)0xE600000000000000;
  String.append(_:)(v52);
  Float.write<A>(to:)();
  v53._countAndFlagsBits = 0x20656D61726620;
  v53._object = (void *)0xE700000000000000;
  String.append(_:)(v53);
  LOWORD(v138[0]) = a3;
  v54._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v54);
  swift_bridgeObjectRelease();
  v55._countAndFlagsBits = 0x7974696361706F20;
  v55._object = (void *)0xE900000000000020;
  String.append(_:)(v55);
  Float.write<A>(to:)();
  v56._countAndFlagsBits = 0x3A44496567617020;
  v56._object = (void *)0xE900000000000020;
  String.append(_:)(v56);
  v17 = v132;
  v138[0] = v132;
  v57._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v57);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v128 + 128))(4, v133, v134);
  swift_release();
  v58 = swift_bridgeObjectRelease();
  if (!((uint64_t (*)(uint64_t))(*v9)[31])(v58))
  {
    v25 = (int64_t)v130;
    goto LABEL_55;
  }
  v59 = ((uint64_t (*)(_QWORD, uint64_t, _QWORD))(*v9)[40])(0, 1, 0);
  v25 = (int64_t)v130;
  if ((v59 & 1) == 0)
  {
    v104 = 9;
    v105 = 0;
LABEL_83:
    a1 = destructiveProjectEnumData for LogType(v104, v105);
    swift_release();
    outlined destroy of SILManifest.Indicator((uint64_t)&v139);
    return a1;
  }
LABEL_55:
  v24 = v129;
  v96 = (*(uint64_t (**)(uint64_t *, uint64_t, _QWORD, _QWORD, float))(*(_QWORD *)v25 + 216))(&v139, a3, v125, v129, *(float *)&v12);
  if ((v96 & 1) == 0 || a7 <= 0.0)
    goto LABEL_74;
  if ((v96 & 0x100) != 0)
  {
    swift_beginAccess();
    v97 = *v43;
    v133 = 0;
    v134 = 0xE000000000000000;
    swift_retain();
    _StringGuts.grow(_:)(18);
    swift_bridgeObjectRelease();
    v133 = 0xD000000000000010;
    v134 = 0x80000002454EEB00;
    v138[0] = v132;
    v98._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v98);
    swift_bridgeObjectRelease();
    v24 = v134;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v97 + 128))(4, v133, v134);
    swift_release();
    v99 = swift_bridgeObjectRelease();
    v21 = v25;
    v100 = ((uint64_t (*)(uint64_t))v131)(v99);
    if (!v100)
      goto LABEL_124;
    a1 = v100;
    if (v132 >= *(_QWORD *)(v100 + 16))
      goto LABEL_110;
    outlined init with copy of SILFileHandle(v100 + 40 * v132 + 32, (uint64_t)&v133);
    swift_bridgeObjectRelease();
    __swift_project_boxed_opaque_existential_1(&v133, v135);
    IOSurfaceLike.clear()();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v133);
    v24 = v129;
  }
  v101 = (*(uint64_t (**)(uint64_t *))(*(_QWORD *)v25 + 160))(&v133);
  v21 = *v102;
  if (!*v102)
    goto LABEL_123;
  a1 = v101;
  v17 = (unint64_t)v102;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)v17 = v21;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    goto LABEL_107;
LABEL_63:
  if (v132 < *(_QWORD *)(v21 + 16))
  {
    specialized SILRenderer.renderIndicatorToSurface(frame:indicator_idx:z_rotation:blit_offset:surface:)(v127, v126, a2, v125, v24, (_QWORD *)(v21 + 40 * v132 + 32));
    ((void (*)(uint64_t *, _QWORD))a1)(&v133, 0);
    (*(void (**)(uint64_t))(*(_QWORD *)v25 + 128))(a2);
    v24 = *(_QWORD *)(*(_QWORD *)v25 + 208);
    a1 = ((uint64_t (*)(uint64_t *))v24)(&v133);
    v17 = (unint64_t)v106;
    v21 = *v106;
    v107 = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)v17 = v21;
    if ((v107 & 1) == 0)
      goto LABEL_111;
    goto LABEL_68;
  }
  __break(1u);
  while (1)
  {
    __break(1u);
LABEL_110:
    __break(1u);
LABEL_111:
    v21 = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew()((_QWORD *)v21);
    *(_QWORD *)v17 = v21;
LABEL_68:
    if (v132 >= *(_QWORD *)(v21 + 16))
    {
      __break(1u);
    }
    else
    {
      *(_WORD *)(v21 + 8 * v132 + 32) = a3;
      ((void (*)(uint64_t *, _QWORD))a1)(&v133, 0);
      a1 = ((uint64_t (*)(uint64_t *))v24)(&v133);
      v17 = (unint64_t)v108;
      v21 = *v108;
      v109 = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)v17 = v21;
      if ((v109 & 1) != 0)
        goto LABEL_70;
    }
    v21 = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew()((_QWORD *)v21);
    *(_QWORD *)v17 = v21;
LABEL_70:
    if (v132 >= *(_QWORD *)(v21 + 16))
    {
      __break(1u);
    }
    else
    {
      *(_DWORD *)(v21 + 8 * v132 + 36) = LODWORD(v12);
      ((void (*)(uint64_t *, _QWORD))a1)(&v133, 0);
      a1 = ((uint64_t (*)(uint64_t *))v24)(&v133);
      v17 = (unint64_t)v110;
      v21 = *v110;
      v111 = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)v17 = v21;
      if ((v111 & 1) != 0)
        goto LABEL_72;
    }
    v21 = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew()((_QWORD *)v21);
    *(_QWORD *)v17 = v21;
LABEL_72:
    v17 = v132;
    if (v132 >= *(_QWORD *)(v21 + 16))
      break;
    v112 = (_QWORD *)(v21 + 8 * v132);
    *((_BYTE *)v112 + 34) = v125;
    *((_BYTE *)v112 + 35) = v129;
    v96 = ((uint64_t (*)(uint64_t *, _QWORD))a1)(&v133, 0);
LABEL_74:
    v21 = v25;
    v113 = ((uint64_t (*)(uint64_t))v131)(v96);
    if (!v113)
      goto LABEL_119;
    a1 = v113;
    if (v17 >= *(_QWORD *)(v113 + 16))
    {
LABEL_104:
      __break(1u);
LABEL_105:
      __break(1u);
LABEL_106:
      __break(1u);
LABEL_107:
      v21 = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew()((_QWORD *)v21);
      *(_QWORD *)v17 = v21;
      goto LABEL_63;
    }
    outlined init with copy of SILFileHandle(v113 + 40 * v17 + 32, (uint64_t)&v133);
    swift_bridgeObjectRelease();
    v114 = v135;
    v24 = v136;
    __swift_project_boxed_opaque_existential_1(&v133, v135);
    v129 = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 8))(v114, v24);
    v115 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v133);
    v21 = v25;
    v116 = ((uint64_t (*)(uint64_t))v131)(v115);
    if (!v116)
      goto LABEL_120;
    a1 = v116;
    if (v17 >= *(_QWORD *)(v116 + 16))
      goto LABEL_105;
    outlined init with copy of SILFileHandle(v116 + 40 * v17 + 32, (uint64_t)&v133);
    swift_bridgeObjectRelease();
    v117 = v135;
    v118 = v136;
    __swift_project_boxed_opaque_existential_1(&v133, v135);
    a1 = (*(uint64_t (**)(uint64_t, uint64_t))(v118 + 16))(v117, v118);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v133);
    outlined init with copy of SILManifest.Indicator?((uint64_t)(v9 + 3), (uint64_t)&v133, &demangling cache variable for type metadata for SILBackend?);
    v17 = v135;
    if (!v135)
      goto LABEL_121;
    v25 = v136;
    v24 = (uint64_t)__swift_project_boxed_opaque_existential_1(&v133, v135);
    v119 = v131();
    if (!v119)
      goto LABEL_122;
    v21 = v119;
    if (v132 >= *(_QWORD *)(v119 + 16))
      goto LABEL_106;
    v12 = (double)v129;
    outlined init with copy of SILFileHandle(v119 + 40 * v132 + 32, (uint64_t)v138);
    swift_bridgeObjectRelease();
    v142[0] = 0;
    v142[1] = 0;
    *(double *)&v142[2] = (double)v129;
    *(double *)&v142[3] = (double)a1;
    v143 = 0;
    *(double *)v144 = a4;
    *(double *)&v144[1] = a5;
    *(double *)&v144[2] = (double)v129;
    *(double *)&v144[3] = (double)a1;
    v145 = 0;
    a1 = (*(uint64_t (**)(uint64_t, _QWORD *, _QWORD *, _QWORD *, uint64_t, unint64_t, int64_t, float))(v25 + 32))(a2, v138, v142, v144, a3, v17, v25, a7);
    outlined destroy of SILManifest.Indicator?((uint64_t)v138, &demangling cache variable for type metadata for IOSurfaceLike?);
    v120 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v133);
    v25 = (int64_t)v130;
    v21 = (unint64_t)v130;
    v121 = v124(v120);
    v122 = __OFSUB__(1, v121);
    v123 = 1 - v121;
    if (!v122)
    {
      (*(void (**)(uint64_t))(*v130 + 176))(v123);
      ((void (*)(uint64_t))(*v9)[32])(a1);
      v104 = 0;
      v105 = a1;
      goto LABEL_83;
    }
  }
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
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

Swift::Bool __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SILRenderer.swapWait(swapID:type:)(Swift::UInt64_optional swapID, SILManager::SwapWaitType type)
{
  uint64_t v2;
  uint64_t v3;
  Swift::Bool is_nil;
  Swift::UInt64 value;
  Swift::Bool result;
  uint64_t v7;
  uint64_t v8;
  char v9;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  v3 = type;
  is_nil = swapID.is_nil;
  value = swapID.value;
  result = outlined init with copy of SILManifest.Indicator?(v2 + 24, (uint64_t)v10, &demangling cache variable for type metadata for SILBackend?);
  v7 = v11;
  if (v11)
  {
    v8 = v12;
    __swift_project_boxed_opaque_existential_1(v10, v11);
    if (is_nil)
      value = (*(uint64_t (**)(void))(*(_QWORD *)v2 + 248))();
    v9 = (*(uint64_t (**)(Swift::UInt64, uint64_t, uint64_t, uint64_t))(v8 + 40))(value, v3, v7, v8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
    return v9 & 1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::UInt64 __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SILRenderer.turnOffRegions(regionMask:synchronous:)(Swift::Int32 regionMask, Swift::Bool synchronous)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  Swift::UInt64 result;
  uint64_t v8;
  uint64_t v9;
  Swift::UInt64 v10;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;

  v4 = v2;
  v6 = *(_QWORD *)&regionMask;
  result = outlined init with copy of SILManifest.Indicator?(v4 + 24, (uint64_t)v11, &demangling cache variable for type metadata for SILBackend?);
  v8 = v12;
  if (v12)
  {
    v9 = v13;
    __swift_project_boxed_opaque_existential_1(v11, v12);
    v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v6, v8, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
    if (!v3)
    {
      (*(void (**)(Swift::UInt64))(*(_QWORD *)v4 + 256))(v10);
      if (synchronous)
        (*(void (**)(Swift::UInt64, _QWORD, uint64_t))(*(_QWORD *)v4 + 320))(v10, 0, 2);
    }
    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

_QWORD *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  char v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;
  _QWORD *v15;

  v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    v10 = a2;
    goto LABEL_8;
  }
  v9 = a4[3];
  v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2)
    goto LABEL_8;
  if (v10 + 0x4000000000000000 >= 0)
  {
    v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v10 = a2;
LABEL_8:
    v11 = a4[2];
    if (v10 <= v11)
      v12 = a4[2];
    else
      v12 = v10;
    if (v12)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      v13 = (_QWORD *)swift_allocObject();
      v14 = _swift_stdlib_malloc_size(v13);
      v13[2] = v11;
      v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
      v15 = v13 + 4;
      if ((v8 & 1) != 0)
      {
LABEL_13:
        if (v13 != a4 || v15 >= &a4[5 * v11 + 4])
          memmove(v15, a4 + 4, 40 * v11);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v15 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v11, (unint64_t)v15, (uint64_t)a4, a6);
LABEL_22:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(unsigned int a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = MEMORY[0x249536034](*(_QWORD *)(v1 + 40), a1, 4);
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v3);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(int a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1)
          break;
      }
    }
  }
  return result;
}

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

{
  char **v3;
  uint64_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

{
  uint64_t *v3;
  uint64_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt32>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SILFileHandle>);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SILFileHandle);
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

Swift::Int specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  Swift::Int v3;
  Swift::Int result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Swift::Int v9;
  char *v10;
  unint64_t v11;
  Swift::Int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 v17;
  _OWORD *v18;
  Swift::Int v19;
  __int128 *v20;
  Swift::Int v21;
  Swift::Int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  char *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  BOOL v59;
  uint64_t v60;
  char v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  BOOL v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  _QWORD *v78;
  uint64_t v79;
  char *v80;
  char *v81;
  uint64_t v82;
  char *v83;
  unint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  char *v89;
  uint64_t v90;
  unint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  unint64_t v97;
  uint64_t v98;
  char *v99;
  char *v100;
  uint64_t v101;
  Swift::Int v102;
  Swift::Int v103;
  Swift::Int v104;
  char *__dst;
  _BYTE v106[40];
  uint64_t v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  uint64_t v113;

  v2 = a1;
  v3 = a1[1];
  result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_134;
    if (v3)
      return specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(0, v3, 1, v2);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_142;
  v102 = result;
  v113 = v1;
  if (v3 < 2)
  {
    v8 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v11 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v10 = (char *)MEMORY[0x24BEE4AF8];
LABEL_100:
      v89 = v10;
      v101 = v8;
      if (v11 >= 2)
      {
        v90 = *v2;
        do
        {
          v91 = v11 - 2;
          if (v11 < 2)
            goto LABEL_129;
          if (!v90)
            goto LABEL_141;
          v92 = v89;
          v93 = *(_QWORD *)&v89[16 * v91 + 32];
          v94 = *(_QWORD *)&v89[16 * v11 + 24];
          v95 = v113;
          specialized _merge<A>(low:mid:high:buffer:by:)((char *)(v90 + 80 * v93), (char *)(v90 + 80 * *(_QWORD *)&v89[16 * v11 + 16]), v90 + 80 * v94, __dst);
          v113 = v95;
          if (v95)
            break;
          if (v94 < v93)
            goto LABEL_130;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v92 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v92);
          if (v91 >= *((_QWORD *)v92 + 2))
            goto LABEL_131;
          v96 = &v92[16 * v91 + 32];
          *(_QWORD *)v96 = v93;
          *((_QWORD *)v96 + 1) = v94;
          v97 = *((_QWORD *)v92 + 2);
          if (v11 > v97)
            goto LABEL_132;
          memmove(&v92[16 * v11 + 16], &v92[16 * v11 + 32], 16 * (v97 - v11));
          v89 = v92;
          *((_QWORD *)v92 + 2) = v97 - 1;
          v11 = v97 - 1;
        }
        while (v97 > 2);
      }
LABEL_97:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v101 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v101 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = v5 >> 1;
    v7 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(_QWORD *)(v7 + 16) = v6;
    v101 = v7;
    __dst = (char *)(v7 + 32);
  }
  v9 = 0;
  v10 = (char *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    v12 = v9++;
    v103 = v12;
    if (v9 < v3)
    {
      v13 = *v2;
      outlined init with copy of SILManifest.Indicator(*v2 + 80 * v9, (uint64_t)&v108);
      outlined init with copy of SILManifest.Indicator(v13 + 80 * v12, (uint64_t)v106);
      v14 = *((_QWORD *)&v110 + 1);
      v15 = v107;
      outlined destroy of SILManifest.Indicator((uint64_t)v106);
      outlined destroy of SILManifest.Indicator((uint64_t)&v108);
      v9 = v12 + 2;
      v98 = v13;
      if (v12 + 2 < v3)
      {
        v99 = v10;
        v16 = v13 + 80 * v12 + 80;
        while (1)
        {
          outlined init with copy of SILManifest.Indicator(v16 + 80, (uint64_t)&v108);
          outlined init with copy of SILManifest.Indicator(v16, (uint64_t)v106);
          v17 = *((_QWORD *)&v110 + 1) >= v107;
          outlined destroy of SILManifest.Indicator((uint64_t)v106);
          outlined destroy of SILManifest.Indicator((uint64_t)&v108);
          if (v14 < v15 == v17)
            break;
          ++v9;
          v16 += 80;
          if (v3 == v9)
          {
            v9 = v3;
            break;
          }
        }
        v10 = v99;
        v12 = v103;
      }
      if (v14 < v15)
      {
        if (v9 < v12)
          goto LABEL_135;
        if (v12 < v9)
        {
          v18 = (_OWORD *)(v13 + 80 * v9 - 80);
          v19 = v12;
          v20 = (__int128 *)(v98 + 80 * v12);
          v21 = v9;
          do
          {
            if (v19 != --v21)
            {
              if (!v98)
                goto LABEL_140;
              v109 = v20[1];
              v110 = v20[2];
              v111 = v20[3];
              v112 = v20[4];
              v108 = *v20;
              memmove(v20, v18, 0x50uLL);
              v18[1] = v109;
              v18[2] = v110;
              v18[3] = v111;
              v18[4] = v112;
              *v18 = v108;
            }
            ++v19;
            v18 -= 5;
            v20 += 5;
          }
          while (v19 < v21);
          v12 = v103;
        }
      }
    }
    if (v9 >= v3)
      goto LABEL_49;
    if (__OFSUB__(v9, v12))
      goto LABEL_133;
    if (v9 - v12 >= v102)
      goto LABEL_49;
    if (__OFADD__(v12, v102))
      goto LABEL_136;
    v22 = v12 + v102 >= v3 ? v3 : v12 + v102;
    if (v22 < v12)
      break;
    if (v9 != v22)
    {
      v100 = v10;
      v23 = 80 * v9;
      do
      {
        v24 = v23;
        do
        {
          v25 = *v2 + v24;
          outlined init with copy of SILManifest.Indicator(v25, (uint64_t)&v108);
          outlined init with copy of SILManifest.Indicator(v25 - 80, (uint64_t)v106);
          v26 = *((_QWORD *)&v110 + 1);
          v27 = v107;
          outlined destroy of SILManifest.Indicator((uint64_t)v106);
          outlined destroy of SILManifest.Indicator((uint64_t)&v108);
          if (v26 >= v27)
            break;
          if (!*v2)
            goto LABEL_138;
          v28 = (__int128 *)(*v2 + v24);
          v109 = v28[1];
          v110 = v28[2];
          v111 = v28[3];
          v112 = v28[4];
          v108 = *v28;
          v29 = *(v28 - 2);
          v28[2] = *(v28 - 3);
          v28[3] = v29;
          v28[4] = *(v28 - 1);
          v30 = *(v28 - 4);
          *v28 = *(v28 - 5);
          v28[1] = v30;
          *(v28 - 5) = v108;
          v31 = v109;
          v32 = v110;
          v33 = v112;
          *(v28 - 2) = v111;
          *(v28 - 1) = v33;
          *(v28 - 4) = v31;
          *(v28 - 3) = v32;
          v24 -= 80;
          ++v12;
        }
        while (v9 != v12);
        ++v9;
        v23 += 80;
        v12 = v103;
      }
      while (v9 != v22);
      v9 = v22;
      v10 = v100;
    }
LABEL_49:
    if (v9 < v12)
      goto LABEL_128;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v10 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
    v35 = *((_QWORD *)v10 + 2);
    v34 = *((_QWORD *)v10 + 3);
    v11 = v35 + 1;
    if (v35 >= v34 >> 1)
      v10 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v34 > 1), v35 + 1, 1, v10);
    *((_QWORD *)v10 + 2) = v11;
    v36 = v10 + 32;
    v37 = &v10[16 * v35 + 32];
    *(_QWORD *)v37 = v12;
    *((_QWORD *)v37 + 1) = v9;
    if (v35)
    {
      v104 = v9;
      while (1)
      {
        v38 = v11 - 1;
        if (v11 >= 4)
        {
          v43 = &v36[16 * v11];
          v44 = *((_QWORD *)v43 - 8);
          v45 = *((_QWORD *)v43 - 7);
          v49 = __OFSUB__(v45, v44);
          v46 = v45 - v44;
          if (v49)
            goto LABEL_117;
          v48 = *((_QWORD *)v43 - 6);
          v47 = *((_QWORD *)v43 - 5);
          v49 = __OFSUB__(v47, v48);
          v41 = v47 - v48;
          v42 = v49;
          if (v49)
            goto LABEL_118;
          v50 = v11 - 2;
          v51 = &v36[16 * v11 - 32];
          v53 = *(_QWORD *)v51;
          v52 = *((_QWORD *)v51 + 1);
          v49 = __OFSUB__(v52, v53);
          v54 = v52 - v53;
          if (v49)
            goto LABEL_120;
          v49 = __OFADD__(v41, v54);
          v55 = v41 + v54;
          if (v49)
            goto LABEL_123;
          if (v55 >= v46)
          {
            v73 = &v36[16 * v38];
            v75 = *(_QWORD *)v73;
            v74 = *((_QWORD *)v73 + 1);
            v49 = __OFSUB__(v74, v75);
            v76 = v74 - v75;
            if (v49)
              goto LABEL_127;
            v66 = v41 < v76;
            goto LABEL_87;
          }
        }
        else
        {
          if (v11 != 3)
          {
            v67 = *((_QWORD *)v10 + 4);
            v68 = *((_QWORD *)v10 + 5);
            v49 = __OFSUB__(v68, v67);
            v60 = v68 - v67;
            v61 = v49;
            goto LABEL_81;
          }
          v40 = *((_QWORD *)v10 + 4);
          v39 = *((_QWORD *)v10 + 5);
          v49 = __OFSUB__(v39, v40);
          v41 = v39 - v40;
          v42 = v49;
        }
        if ((v42 & 1) != 0)
          goto LABEL_119;
        v50 = v11 - 2;
        v56 = &v36[16 * v11 - 32];
        v58 = *(_QWORD *)v56;
        v57 = *((_QWORD *)v56 + 1);
        v59 = __OFSUB__(v57, v58);
        v60 = v57 - v58;
        v61 = v59;
        if (v59)
          goto LABEL_122;
        v62 = &v36[16 * v38];
        v64 = *(_QWORD *)v62;
        v63 = *((_QWORD *)v62 + 1);
        v49 = __OFSUB__(v63, v64);
        v65 = v63 - v64;
        if (v49)
          goto LABEL_125;
        if (__OFADD__(v60, v65))
          goto LABEL_126;
        if (v60 + v65 >= v41)
        {
          v66 = v41 < v65;
LABEL_87:
          if (v66)
            v38 = v50;
          goto LABEL_89;
        }
LABEL_81:
        if ((v61 & 1) != 0)
          goto LABEL_121;
        v69 = &v36[16 * v38];
        v71 = *(_QWORD *)v69;
        v70 = *((_QWORD *)v69 + 1);
        v49 = __OFSUB__(v70, v71);
        v72 = v70 - v71;
        if (v49)
          goto LABEL_124;
        if (v72 < v60)
          goto LABEL_15;
LABEL_89:
        v77 = v38 - 1;
        if (v38 - 1 >= v11)
        {
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
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
          goto LABEL_137;
        }
        v78 = v2;
        v79 = *v2;
        if (!*v2)
          goto LABEL_139;
        v80 = v10;
        v81 = &v36[16 * v77];
        v82 = *(_QWORD *)v81;
        v83 = v36;
        v84 = v38;
        v85 = &v36[16 * v38];
        v86 = *((_QWORD *)v85 + 1);
        v87 = v113;
        specialized _merge<A>(low:mid:high:buffer:by:)((char *)(v79 + 80 * *(_QWORD *)v81), (char *)(v79 + 80 * *(_QWORD *)v85), v79 + 80 * v86, __dst);
        v113 = v87;
        if (v87)
          goto LABEL_97;
        if (v86 < v82)
          goto LABEL_114;
        if (v84 > *((_QWORD *)v80 + 2))
          goto LABEL_115;
        *(_QWORD *)v81 = v82;
        *(_QWORD *)&v83[16 * v77 + 8] = v86;
        v88 = *((_QWORD *)v80 + 2);
        if (v84 >= v88)
          goto LABEL_116;
        v10 = v80;
        v11 = v88 - 1;
        memmove(v85, v85 + 16, 16 * (v88 - 1 - v84));
        v36 = v83;
        *((_QWORD *)v80 + 2) = v88 - 1;
        v2 = v78;
        v9 = v104;
        if (v88 <= 2)
          goto LABEL_15;
      }
    }
    v11 = 1;
LABEL_15:
    v3 = v2[1];
    if (v9 >= v3)
    {
      v8 = v101;
      goto LABEL_100;
    }
  }
LABEL_137:
  __break(1u);
LABEL_138:
  __break(1u);
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

Swift::Int specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t *v2;
  Swift::Int v3;
  Swift::Int result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Swift::Int v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  Swift::Int v13;
  Swift::Int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  Swift::Int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  Swift::Int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  Swift::Int v35;
  uint64_t v36;
  Swift::Int v37;
  Swift::Int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  unint64_t v48;
  unint64_t v49;
  char *v50;
  char *v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  BOOL v63;
  unint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  BOOL v73;
  uint64_t v74;
  char v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  BOOL v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  char *v95;
  char *v96;
  char *v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  unint64_t v109;
  char *v110;
  char *v111;
  uint64_t v112;
  Swift::Int v113;
  uint64_t v114;
  uint64_t v115;
  Swift::Int v116;
  Swift::Int v117;
  Swift::Int v118;
  Swift::Int v119;
  char *__dst;
  Swift::Int v121;
  uint64_t v122;
  char *v123;
  _QWORD v124[3];
  uint64_t v125;
  uint64_t v126;
  __int128 v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;

  v2 = a1;
  v3 = a1[1];
  result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_135;
    if (v3)
      return specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(0, v3, 1, v2);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_143;
  v113 = result;
  v130 = v1;
  if (v3 < 2)
  {
    v8 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v12 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v10 = (char *)MEMORY[0x24BEE4AF8];
LABEL_100:
      v112 = v8;
      if (v12 >= 2)
      {
        v103 = *v2;
        do
        {
          v104 = v12 - 2;
          if (v12 < 2)
            goto LABEL_130;
          if (!v103)
            goto LABEL_142;
          v105 = *(_QWORD *)&v10[16 * v104 + 32];
          v106 = *(_QWORD *)&v10[16 * v12 + 24];
          v107 = v130;
          specialized _merge<A>(low:mid:high:buffer:by:)((char *)(v103 + 40 * v105), (char *)(v103 + 40 * *(_QWORD *)&v10[16 * v12 + 16]), v103 + 40 * v106, __dst);
          v130 = v107;
          if (v107)
            break;
          if (v106 < v105)
            goto LABEL_131;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v10 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v10);
          if (v104 >= *((_QWORD *)v10 + 2))
            goto LABEL_132;
          v108 = &v10[16 * v104 + 32];
          *(_QWORD *)v108 = v105;
          *((_QWORD *)v108 + 1) = v106;
          v109 = *((_QWORD *)v10 + 2);
          if (v12 > v109)
            goto LABEL_133;
          memmove(&v10[16 * v12 + 16], &v10[16 * v12 + 32], 16 * (v109 - v12));
          *((_QWORD *)v10 + 2) = v109 - 1;
          v12 = v109 - 1;
        }
        while (v109 > 2);
      }
LABEL_111:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v112 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v112 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SILFileHandle);
    v7 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(_QWORD *)(v7 + 16) = v6;
    v112 = v7;
    __dst = (char *)(v7 + 32);
  }
  v9 = 0;
  v10 = (char *)MEMORY[0x24BEE4AF8];
  v11 = MEMORY[0x24BEE0D00];
  while (1)
  {
    v13 = v9;
    v14 = v9 + 1;
    v119 = v9;
    if (v9 + 1 < v3)
    {
      v15 = *v2;
      v114 = *v2;
      outlined init with copy of SILFileHandle(*v2 + 40 * v14, (uint64_t)&v127);
      outlined init with copy of SILFileHandle(v15 + 40 * v13, (uint64_t)v124);
      v121 = v3;
      v16 = v128;
      v17 = v129;
      __swift_project_boxed_opaque_existential_1(&v127, v128);
      (*(void (**)(uint64_t, uint64_t))(v17 + 24))(v16, v17);
      v18 = v125;
      v19 = v126;
      __swift_project_boxed_opaque_existential_1(v124, v125);
      v20 = v18;
      v3 = v121;
      (*(void (**)(uint64_t, uint64_t))(v19 + 24))(v20, v19);
      lazy protocol witness table accessor for type String and conformance String();
      v115 = StringProtocol.caseInsensitiveCompare<A>(_:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v124);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v127);
      v14 = v13 + 2;
      if (v13 + 2 < v121)
      {
        v110 = v10;
        v21 = v114 + 40 * v13 + 40;
        while (1)
        {
          v22 = v14;
          v23 = v21 + 40;
          outlined init with copy of SILFileHandle(v21 + 40, (uint64_t)&v127);
          outlined init with copy of SILFileHandle(v21, (uint64_t)v124);
          v24 = v128;
          v25 = v129;
          __swift_project_boxed_opaque_existential_1(&v127, v128);
          (*(void (**)(uint64_t, uint64_t))(v25 + 24))(v24, v25);
          v27 = v125;
          v26 = v126;
          __swift_project_boxed_opaque_existential_1(v124, v125);
          (*(void (**)(uint64_t, uint64_t))(v26 + 24))(v27, v26);
          v28 = StringProtocol.caseInsensitiveCompare<A>(_:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v124);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v127);
          if ((v115 == -1) == (v28 != -1))
            break;
          v21 = v23;
          v14 = v22 + 1;
          v3 = v121;
          if (v121 == v22 + 1)
          {
            v14 = v121;
            v10 = v110;
            v13 = v119;
            goto LABEL_23;
          }
        }
        v10 = v110;
        v14 = v22;
        v13 = v119;
        v3 = v121;
      }
LABEL_23:
      if (v115 == -1)
      {
        if (v14 < v13)
          goto LABEL_138;
        if (v13 < v14)
        {
          v29 = 40 * v14 - 40;
          v30 = v14;
          v31 = 40 * v13;
          v116 = v30;
          do
          {
            if (v13 != --v30)
            {
              if (!v114)
                goto LABEL_141;
              v32 = v114 + v31;
              outlined init with take of SILFileHandle((__int128 *)(v114 + v31), (uint64_t)&v127);
              v33 = *(_QWORD *)(v114 + v29 + 32);
              v34 = *(_OWORD *)(v114 + v29 + 16);
              *(_OWORD *)v32 = *(_OWORD *)(v114 + v29);
              *(_OWORD *)(v32 + 16) = v34;
              *(_QWORD *)(v32 + 32) = v33;
              outlined init with take of SILFileHandle(&v127, v114 + v29);
            }
            ++v13;
            v29 -= 40;
            v31 += 40;
          }
          while (v13 < v30);
          v14 = v116;
          v13 = v119;
          v3 = v121;
        }
      }
    }
    if (v14 >= v3)
      goto LABEL_50;
    if (__OFSUB__(v14, v13))
      goto LABEL_134;
    if (v14 - v13 >= v113)
      goto LABEL_50;
    if (__OFADD__(v13, v113))
      goto LABEL_136;
    v35 = v13 + v113 >= v3 ? v3 : v13 + v113;
    if (v35 < v13)
      break;
    if (v14 != v35)
    {
      v111 = v10;
      v36 = 40 * v14 - 40;
      v117 = v35;
      do
      {
        v37 = v13;
        v122 = v36;
        while (1)
        {
          v38 = v14;
          v39 = *v2 + v36;
          outlined init with copy of SILFileHandle(v39 + 40, (uint64_t)&v127);
          outlined init with copy of SILFileHandle(v39, (uint64_t)v124);
          v40 = v128;
          v41 = v129;
          __swift_project_boxed_opaque_existential_1(&v127, v128);
          (*(void (**)(uint64_t, uint64_t))(v41 + 24))(v40, v41);
          v42 = v125;
          v43 = v126;
          __swift_project_boxed_opaque_existential_1(v124, v125);
          (*(void (**)(uint64_t, uint64_t))(v43 + 24))(v42, v43);
          lazy protocol witness table accessor for type String and conformance String();
          v44 = StringProtocol.caseInsensitiveCompare<A>(_:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v124);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v127);
          if (v44 != -1)
            break;
          v45 = *v2;
          if (!*v2)
            goto LABEL_139;
          v14 = v38;
          v46 = v45 + v36;
          outlined init with take of SILFileHandle((__int128 *)(v45 + v36 + 40), (uint64_t)&v127);
          v47 = *(_OWORD *)(v46 + 16);
          *(_OWORD *)(v46 + 40) = *(_OWORD *)v46;
          *(_OWORD *)(v46 + 56) = v47;
          *(_QWORD *)(v46 + 72) = *(_QWORD *)(v46 + 32);
          outlined init with take of SILFileHandle(&v127, v46);
          v36 -= 40;
          if (v38 == ++v37)
            goto LABEL_43;
        }
        v14 = v38;
LABEL_43:
        ++v14;
        v36 = v122 + 40;
        v13 = v119;
      }
      while (v14 != v117);
      v14 = v117;
      v10 = v111;
    }
LABEL_50:
    if (v14 < v13)
      goto LABEL_129;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v10 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
    v49 = *((_QWORD *)v10 + 2);
    v48 = *((_QWORD *)v10 + 3);
    v12 = v49 + 1;
    if (v49 >= v48 >> 1)
      v10 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v48 > 1), v49 + 1, 1, v10);
    *((_QWORD *)v10 + 2) = v12;
    v123 = v10 + 32;
    v50 = &v10[16 * v49 + 32];
    *(_QWORD *)v50 = v13;
    *((_QWORD *)v50 + 1) = v14;
    v118 = v14;
    if (v49)
    {
      v51 = v10 + 32;
      while (1)
      {
        v52 = v12 - 1;
        if (v12 >= 4)
        {
          v57 = &v51[16 * v12];
          v58 = *((_QWORD *)v57 - 8);
          v59 = *((_QWORD *)v57 - 7);
          v63 = __OFSUB__(v59, v58);
          v60 = v59 - v58;
          if (v63)
            goto LABEL_118;
          v62 = *((_QWORD *)v57 - 6);
          v61 = *((_QWORD *)v57 - 5);
          v63 = __OFSUB__(v61, v62);
          v55 = v61 - v62;
          v56 = v63;
          if (v63)
            goto LABEL_119;
          v64 = v12 - 2;
          v65 = &v51[16 * v12 - 32];
          v67 = *(_QWORD *)v65;
          v66 = *((_QWORD *)v65 + 1);
          v63 = __OFSUB__(v66, v67);
          v68 = v66 - v67;
          if (v63)
            goto LABEL_121;
          v63 = __OFADD__(v55, v68);
          v69 = v55 + v68;
          if (v63)
            goto LABEL_124;
          if (v69 >= v60)
          {
            v87 = &v51[16 * v52];
            v89 = *(_QWORD *)v87;
            v88 = *((_QWORD *)v87 + 1);
            v63 = __OFSUB__(v88, v89);
            v90 = v88 - v89;
            if (v63)
              goto LABEL_128;
            v80 = v55 < v90;
            goto LABEL_88;
          }
        }
        else
        {
          if (v12 != 3)
          {
            v81 = *((_QWORD *)v10 + 4);
            v82 = *((_QWORD *)v10 + 5);
            v63 = __OFSUB__(v82, v81);
            v74 = v82 - v81;
            v75 = v63;
            goto LABEL_82;
          }
          v54 = *((_QWORD *)v10 + 4);
          v53 = *((_QWORD *)v10 + 5);
          v63 = __OFSUB__(v53, v54);
          v55 = v53 - v54;
          v56 = v63;
        }
        if ((v56 & 1) != 0)
          goto LABEL_120;
        v64 = v12 - 2;
        v70 = &v51[16 * v12 - 32];
        v72 = *(_QWORD *)v70;
        v71 = *((_QWORD *)v70 + 1);
        v73 = __OFSUB__(v71, v72);
        v74 = v71 - v72;
        v75 = v73;
        if (v73)
          goto LABEL_123;
        v76 = &v51[16 * v52];
        v78 = *(_QWORD *)v76;
        v77 = *((_QWORD *)v76 + 1);
        v63 = __OFSUB__(v77, v78);
        v79 = v77 - v78;
        if (v63)
          goto LABEL_126;
        if (__OFADD__(v74, v79))
          goto LABEL_127;
        if (v74 + v79 >= v55)
        {
          v80 = v55 < v79;
LABEL_88:
          if (v80)
            v52 = v64;
          goto LABEL_90;
        }
LABEL_82:
        if ((v75 & 1) != 0)
          goto LABEL_122;
        v83 = &v51[16 * v52];
        v85 = *(_QWORD *)v83;
        v84 = *((_QWORD *)v83 + 1);
        v63 = __OFSUB__(v84, v85);
        v86 = v84 - v85;
        if (v63)
          goto LABEL_125;
        if (v86 < v74)
          goto LABEL_15;
LABEL_90:
        v91 = v52 - 1;
        if (v52 - 1 >= v12)
        {
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
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
          goto LABEL_137;
        }
        v92 = v11;
        v93 = v2;
        v94 = *v2;
        if (!*v2)
          goto LABEL_140;
        v95 = v10;
        v96 = &v51[16 * v91];
        v97 = v51;
        v98 = *(_QWORD *)v96;
        v99 = &v97[16 * v52];
        v100 = *((_QWORD *)v99 + 1);
        v101 = v130;
        specialized _merge<A>(low:mid:high:buffer:by:)((char *)(v94 + 40 * *(_QWORD *)v96), (char *)(v94 + 40 * *(_QWORD *)v99), v94 + 40 * v100, __dst);
        v130 = v101;
        if (v101)
          goto LABEL_111;
        if (v100 < v98)
          goto LABEL_115;
        if (v52 > *((_QWORD *)v95 + 2))
          goto LABEL_116;
        *(_QWORD *)v96 = v98;
        v51 = v123;
        *(_QWORD *)&v123[16 * v91 + 8] = v100;
        v102 = *((_QWORD *)v95 + 2);
        if (v52 >= v102)
          goto LABEL_117;
        v10 = v95;
        v12 = v102 - 1;
        memmove(v99, v99 + 16, 16 * (v102 - 1 - v52));
        *((_QWORD *)v95 + 2) = v102 - 1;
        v2 = v93;
        v11 = v92;
        if (v102 <= 2)
          goto LABEL_15;
      }
    }
    v12 = 1;
LABEL_15:
    v3 = v2[1];
    v9 = v118;
    if (v118 >= v3)
    {
      v8 = v112;
      goto LABEL_100;
    }
  }
LABEL_137:
  __break(1u);
LABEL_138:
  __break(1u);
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(uint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[10];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  if (a3 != a2)
  {
    v5 = a3;
    v7 = result;
    v8 = 80 * a3;
LABEL_5:
    v9 = v7;
    v10 = v8;
    while (1)
    {
      v11 = *a4 + v10;
      outlined init with copy of SILManifest.Indicator(v11, (uint64_t)&v21);
      outlined init with copy of SILManifest.Indicator(v11 - 80, (uint64_t)v20);
      v12 = *((_QWORD *)&v23 + 1);
      v13 = v20[5];
      outlined destroy of SILManifest.Indicator((uint64_t)v20);
      result = outlined destroy of SILManifest.Indicator((uint64_t)&v21);
      if (v12 >= v13)
      {
LABEL_4:
        ++v5;
        v8 += 80;
        if (v5 == a2)
          return result;
        goto LABEL_5;
      }
      if (!*a4)
        break;
      v14 = (__int128 *)(*a4 + v10);
      v22 = v14[1];
      v23 = v14[2];
      v24 = v14[3];
      v25 = v14[4];
      v21 = *v14;
      v15 = *(v14 - 2);
      v14[2] = *(v14 - 3);
      v14[3] = v15;
      v14[4] = *(v14 - 1);
      v16 = *(v14 - 4);
      *v14 = *(v14 - 5);
      v14[1] = v16;
      *(v14 - 5) = v21;
      v17 = v22;
      v18 = v23;
      v19 = v25;
      *(v14 - 2) = v24;
      *(v14 - 1) = v19;
      *(v14 - 4) = v17;
      *(v14 - 3) = v18;
      v10 -= 80;
      if (v5 == ++v9)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
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
  __int128 v16;
  uint64_t v18;
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v18 = result;
  if (a3 != a2)
  {
    v5 = a3;
    v6 = 40 * a3 - 40;
LABEL_5:
    v7 = v18;
    v25 = v6;
    while (1)
    {
      v8 = *a4 + v6;
      outlined init with copy of SILFileHandle(v8 + 40, (uint64_t)&v22);
      outlined init with copy of SILFileHandle(v8, (uint64_t)v19);
      v9 = v23;
      v10 = v24;
      __swift_project_boxed_opaque_existential_1(&v22, v23);
      (*(void (**)(uint64_t, uint64_t))(v10 + 24))(v9, v10);
      v12 = v20;
      v11 = v21;
      __swift_project_boxed_opaque_existential_1(v19, v20);
      (*(void (**)(uint64_t, uint64_t))(v11 + 24))(v12, v11);
      lazy protocol witness table accessor for type String and conformance String();
      v13 = StringProtocol.caseInsensitiveCompare<A>(_:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
      result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
      if (v13 != -1)
      {
LABEL_4:
        ++v5;
        v6 = v25 + 40;
        if (v5 == a2)
          return result;
        goto LABEL_5;
      }
      v14 = *a4;
      if (!*a4)
        break;
      v15 = v14 + v6;
      outlined init with take of SILFileHandle((__int128 *)(v14 + v6 + 40), (uint64_t)&v22);
      v16 = *(_OWORD *)(v15 + 16);
      *(_OWORD *)(v15 + 40) = *(_OWORD *)v15;
      *(_OWORD *)(v15 + 56) = v16;
      *(_QWORD *)(v15 + 72) = *(_QWORD *)(v15 + 32);
      result = outlined init with take of SILFileHandle(&v22, v15);
      v6 -= 40;
      if (v5 == ++v7)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t specialized _merge<A>(low:mid:high:buffer:by:)(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v6;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  BOOL v17;
  char *v18;
  char *v20;
  char *v21;
  char *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  BOOL v27;
  uint64_t result;
  _BYTE v29[40];
  uint64_t v30;
  _BYTE v31[40];
  uint64_t v32;
  unint64_t v33;
  char *v34;
  char *v35;

  v4 = __dst;
  v6 = a2;
  v8 = a2 - __src;
  v9 = (a2 - __src) / 80;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 80;
  v35 = __src;
  v34 = __dst;
  if (v9 >= v11)
  {
    if (v10 >= -79)
    {
      if (__dst != a2 || &a2[80 * v11] <= __dst)
        memmove(__dst, a2, 80 * v11);
      v20 = &v4[80 * v11];
      v33 = (unint64_t)v20;
      v35 = v6;
      if (__src < v6 && v10 >= 80)
      {
        v21 = (char *)(a3 - 80);
        while (1)
        {
          v22 = v21 + 80;
          outlined init with copy of SILManifest.Indicator((uint64_t)(v20 - 80), (uint64_t)v31);
          v23 = (unint64_t)(v6 - 80);
          outlined init with copy of SILManifest.Indicator((uint64_t)(v6 - 80), (uint64_t)v29);
          v24 = v32;
          v25 = v30;
          outlined destroy of SILManifest.Indicator((uint64_t)v29);
          outlined destroy of SILManifest.Indicator((uint64_t)v31);
          if (v24 >= v25)
          {
            v26 = v33;
            v20 = (char *)(v33 - 80);
            v33 -= 80;
            v27 = (unint64_t)v22 < v26 || (unint64_t)v21 >= v26;
            if (v27 || v22 != (char *)v26)
              memmove(v21, (const void *)(v26 - 80), 0x50uLL);
            v23 = (unint64_t)v6;
            if (v20 <= v4)
              goto LABEL_47;
          }
          else
          {
            if (v22 != v6 || v21 >= v6)
              memmove(v21, v6 - 80, 0x50uLL);
            v35 -= 80;
            v20 = (char *)v33;
            if (v33 <= (unint64_t)v4)
              goto LABEL_47;
          }
          v21 -= 80;
          v6 = (char *)v23;
          if (v23 <= (unint64_t)__src)
            goto LABEL_47;
        }
      }
      goto LABEL_47;
    }
  }
  else if (v8 >= -79)
  {
    if (__dst != __src || &__src[80 * v9] <= __dst)
      memmove(__dst, __src, 80 * v9);
    v12 = (unint64_t)&v4[80 * v9];
    v33 = v12;
    if ((unint64_t)v6 < a3 && v8 >= 80)
    {
      do
      {
        outlined init with copy of SILManifest.Indicator((uint64_t)v6, (uint64_t)v31);
        outlined init with copy of SILManifest.Indicator((uint64_t)v4, (uint64_t)v29);
        v13 = v32;
        v14 = v30;
        outlined destroy of SILManifest.Indicator((uint64_t)v29);
        outlined destroy of SILManifest.Indicator((uint64_t)v31);
        v15 = v35;
        if (v13 >= v14)
        {
          v18 = v34 + 80;
          if (v35 != v34 || v35 >= v18)
            memmove(v35, v34, 0x50uLL);
          v34 = v18;
          v16 = (unint64_t)v6;
        }
        else
        {
          v16 = (unint64_t)(v6 + 80);
          v17 = v35 < v6 || (unint64_t)v35 >= v16;
          if (!v17 && v35 == v6)
            v15 = v6;
          else
            memmove(v35, v6, 0x50uLL);
        }
        v35 = v15 + 80;
        v4 = v34;
        if ((unint64_t)v34 >= v12)
          break;
        v6 = (char *)v16;
      }
      while (v16 < a3);
    }
LABEL_47:
    specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)((void **)&v35, (const void **)&v34, &v33);
    return 1;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  char *v4;
  char *v6;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD *v18;
  char *v19;
  __int128 v20;
  __int128 v21;
  unint64_t v22;
  __int128 v23;
  __int128 v24;
  char *v25;
  unint64_t v26;
  __int128 v27;
  __int128 v28;
  char *v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t result;
  char *v43;
  _QWORD v44[3];
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[3];
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  char *v52;

  v4 = __dst;
  v6 = a2;
  v8 = a2 - __src;
  v9 = (a2 - __src) / 40;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 40;
  v52 = __src;
  v51 = __dst;
  if (v9 >= v11)
  {
    if (v10 < -39)
      goto LABEL_43;
    if (__dst != a2 || &a2[40 * v11] <= __dst)
      memmove(__dst, a2, 40 * v11);
    v25 = &v4[40 * v11];
    v50 = v25;
    v52 = v6;
    if (__src >= v6 || v10 < 40)
      goto LABEL_42;
    v26 = a3 - 40;
    v43 = __src;
    while (1)
    {
      v31 = (char *)(v26 + 40);
      outlined init with copy of SILFileHandle((uint64_t)(v25 - 40), (uint64_t)v47);
      v29 = v6 - 40;
      outlined init with copy of SILFileHandle((uint64_t)(v6 - 40), (uint64_t)v44);
      v32 = v48;
      v33 = v49;
      __swift_project_boxed_opaque_existential_1(v47, v48);
      (*(void (**)(uint64_t, uint64_t))(v33 + 24))(v32, v33);
      v35 = v45;
      v34 = v46;
      __swift_project_boxed_opaque_existential_1(v44, v45);
      (*(void (**)(uint64_t, uint64_t))(v34 + 24))(v35, v34);
      lazy protocol witness table accessor for type String and conformance String();
      v36 = StringProtocol.caseInsensitiveCompare<A>(_:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
      if (v36 == -1)
        break;
      v37 = v50;
      v25 = v50 - 40;
      v50 -= 40;
      if (v31 < v37 || v26 >= (unint64_t)v37)
      {
        v27 = *(_OWORD *)v25;
        v28 = *(_OWORD *)(v37 - 24);
        *(_QWORD *)(v26 + 32) = *((_QWORD *)v37 - 1);
        *(_OWORD *)v26 = v27;
        *(_OWORD *)(v26 + 16) = v28;
        v29 = v6;
        goto LABEL_29;
      }
      v30 = v43;
      if (v31 != v37)
      {
        v38 = *(_OWORD *)v25;
        v39 = *(_OWORD *)(v37 - 24);
        *(_QWORD *)(v26 + 32) = *((_QWORD *)v37 - 1);
        *(_OWORD *)v26 = v38;
        *(_OWORD *)(v26 + 16) = v39;
      }
      v29 = v6;
      if (v25 <= v4)
        goto LABEL_42;
LABEL_30:
      v26 -= 40;
      v6 = v29;
      if (v29 <= v30)
        goto LABEL_42;
    }
    if (v31 != v6 || v26 >= (unint64_t)v6)
    {
      v40 = *(_OWORD *)v29;
      v41 = *(_OWORD *)(v6 - 24);
      *(_QWORD *)(v26 + 32) = *((_QWORD *)v6 - 1);
      *(_OWORD *)v26 = v40;
      *(_OWORD *)(v26 + 16) = v41;
    }
    v52 -= 40;
    v25 = v50;
LABEL_29:
    v30 = v43;
    if (v25 <= v4)
      goto LABEL_42;
    goto LABEL_30;
  }
  if (v8 >= -39)
  {
    if (__dst != __src || &__src[40 * v9] <= __dst)
      memmove(__dst, __src, 40 * v9);
    v12 = (unint64_t)&v4[40 * v9];
    v50 = (char *)v12;
    if ((unint64_t)v6 < a3 && v8 >= 40)
    {
      do
      {
        outlined init with copy of SILFileHandle((uint64_t)v6, (uint64_t)v47);
        outlined init with copy of SILFileHandle((uint64_t)v4, (uint64_t)v44);
        v13 = v48;
        v14 = v49;
        __swift_project_boxed_opaque_existential_1(v47, v48);
        (*(void (**)(uint64_t, uint64_t))(v14 + 24))(v13, v14);
        v15 = v45;
        v16 = v46;
        __swift_project_boxed_opaque_existential_1(v44, v45);
        (*(void (**)(uint64_t, uint64_t))(v16 + 24))(v15, v16);
        lazy protocol witness table accessor for type String and conformance String();
        v17 = StringProtocol.caseInsensitiveCompare<A>(_:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
        v18 = v52;
        if (v17 == -1)
        {
          v22 = (unint64_t)(v6 + 40);
          if (v52 >= v6 && (unint64_t)v52 < v22 && v52 == v6)
          {
            v18 = v6;
          }
          else
          {
            v23 = *(_OWORD *)v6;
            v24 = *((_OWORD *)v6 + 1);
            *((_QWORD *)v52 + 4) = *((_QWORD *)v6 + 4);
            *v18 = v23;
            v18[1] = v24;
          }
        }
        else
        {
          v19 = v51 + 40;
          if (v52 != v51 || v52 >= v19)
          {
            v20 = *(_OWORD *)v51;
            v21 = *((_OWORD *)v51 + 1);
            *((_QWORD *)v52 + 4) = *((_QWORD *)v51 + 4);
            *v18 = v20;
            v18[1] = v21;
          }
          v51 = v19;
          v22 = (unint64_t)v6;
        }
        v52 = (char *)v18 + 40;
        v4 = v51;
        if ((unint64_t)v51 >= v12)
          break;
        v6 = (char *)v22;
      }
      while (v22 < a3);
    }
LABEL_42:
    specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)((void **)&v52, (const void **)&v51, &v50);
    return 1;
  }
LABEL_43:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Range<Int>>);
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
    v10 = (char *)MEMORY[0x24BEE4AF8];
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

char *specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  char *result;
  uint64_t v6;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  if (v4 <= -80)
  {
    result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v6 = v4 / 80;
    if (result != v3 || result >= &v3[80 * v6])
      return (char *)memmove(result, v3, 80 * v6);
  }
  return result;
}

{
  char *v3;
  uint64_t v4;
  char *result;
  uint64_t v6;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  if (v4 <= -40)
  {
    result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v6 = v4 / 40;
    if (result != v3 || result >= &v3[40 * v6])
      return (char *)memmove(result, v3, 40 * v6);
  }
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

_QWORD *specialized _ArrayBuffer._consumeAndCreateNew()(_QWORD *a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1, &demangling cache variable for type metadata for _ContiguousArrayStorage<SILFileHandle>, &demangling cache variable for type metadata for SILFileHandle);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1, &demangling cache variable for type metadata for _ContiguousArrayStorage<IOSurfaceLike>, &demangling cache variable for type metadata for IOSurfaceLike);
}

void specialized _ArrayBuffer._consumeAndCreateNew()(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x249535F2CLL);
}

size_t specialized _copyCollectionToContiguousArray<A>(_:)(size_t result, unint64_t a2)
{
  const void *v3;
  int64_t v4;
  _QWORD *v5;

  if (!result)
    return MEMORY[0x24BEE4AF8];
  v3 = (const void *)result;
  v4 = a2 - result;
  if (a2 == result)
    return MEMORY[0x24BEE4AF8];
  if (v4 < 1)
  {
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if (!a2)
      goto LABEL_13;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    v5 = (_QWORD *)swift_allocObject();
    result = _swift_stdlib_malloc_size(v5);
    v5[2] = v4;
    v5[3] = 2 * result - 64;
    if (!a2)
      goto LABEL_13;
  }
  if ((unint64_t)v3 < a2)
  {
    if ((v4 & 0x8000000000000000) == 0)
    {
      memmove(v5 + 4, v3, v4);
      return (size_t)v5;
    }
    __break(1u);
  }
LABEL_13:
  __break(1u);
  return result;
}

void specialized SILError.log()(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }
}

uint64_t sub_2454E8FA8()
{
  unsigned __int8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = Log.unsafeMutableAddressor();
  swift_beginAccess();
  v4 = *v3;
  outlined copy of SILError(v2, v1, v0);
  swift_retain();
  v5 = String.init<A>(describing:)();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v4 + 144))(4, v5, v6);
  swift_release();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t outlined copy of SILError(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 6u)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t outlined consume of SILError(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 6u)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t outlined init with copy of SILManifest.Indicator(uint64_t a1, uint64_t a2)
{
  return initializeWithCopy for SILManifest.Indicator(a2, a1);
}

uint64_t outlined destroy of SILManifest.Indicator(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  char v16;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<UInt32, PixelFormatInfo>);
  v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)();
  v4 = *(_DWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  result = specialized __RawDictionaryStorage.find<A>(_:)(v4);
  if ((v8 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  v9 = (_QWORD *)(a1 + 72);
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_DWORD *)(v3[6] + 4 * result) = v4;
    v10 = (_QWORD *)(v3[7] + 16 * result);
    *v10 = v6;
    v10[1] = v5;
    v11 = v3[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      break;
    v3[2] = v13;
    if (!--v1)
      goto LABEL_8;
    v14 = v9 + 3;
    v4 = *((_DWORD *)v9 - 4);
    v6 = *(v9 - 1);
    v15 = *v9;
    swift_bridgeObjectRetain();
    result = specialized __RawDictionaryStorage.find<A>(_:)(v4);
    v9 = v14;
    v5 = v15;
    if ((v16 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t specialized String.init(cString:)(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(result + 16);
  if (v1)
  {
    v2 = result;
    v3 = *(unsigned __int8 *)(result + 32);
    result += 32;
    if (!v3)
      return static String._fromUTF8Repairing(_:)();
    v4 = 0;
    v5 = v1 - 1;
    v6 = v2 + 33;
    while (v5 != v4)
    {
      if (!*(unsigned __int8 *)(v6 + v4++))
        return static String._fromUTF8Repairing(_:)();
    }
    __break(1u);
  }
  __break(1u);
  return result;
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
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
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
    v5 = a4 + 80 * a1 + 32;
    v6 = a3 + 80 * v4;
    if (v5 >= v6 || v5 + 80 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized static SILManifest.createFromManifestFiles(manifests:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  Swift::String v8;
  uint64_t v9;
  uint64_t v10;
  Swift::String v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  size_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  Swift::String v25;
  Swift::String v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  Swift::String v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  int v37;
  char isUniquelyReferenced_nonNull_native;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  Swift::String v42;
  uint64_t v43;
  int64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
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
  BOOL v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  Swift::String v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unsigned int *v73;
  _QWORD *v74;
  int v75;
  uint64_t v76;
  unsigned int v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  Swift::String v82;
  Swift::String v83;
  Swift::String v84;
  Swift::String v85;
  Swift::String v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  _QWORD *v90;
  BOOL v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  _OWORD *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _QWORD *v99;
  uint64_t *v100;
  void (*v101)(uint64_t, unint64_t, unint64_t);
  unint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  Swift::String v106;
  Swift::String v107;
  int v108;
  Swift::String v109;
  uint64_t v110;
  uint64_t *v112;
  uint64_t v113;
  Swift::String v114;
  Swift::String v115;
  uint64_t v116;
  uint64_t v117;
  Swift::String v118;
  Swift::String v119;
  uint64_t v120;
  uint64_t v121;
  Swift::String v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  int v135;
  uint64_t v136;
  __int128 v137;
  uint64_t *v138;
  uint64_t v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  _QWORD *v148;
  _OWORD v149[2];
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  uint64_t v163;
  __int128 v164;
  int v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  _QWORD v174[3];
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;

  v177 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v148 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v132 = a1 + 32;
    swift_bridgeObjectRetain();
    v2 = 0;
    v3 = 3;
    v131 = v1;
    while (1)
    {
      v139 = v2;
      outlined init with copy of SILFileHandle(v132 + 40 * v2, (uint64_t)v174);
      v4 = v175;
      v5 = v176;
      __swift_project_boxed_opaque_existential_1(v174, v175);
      if ((*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5) > 159)
      {
        v14 = v175;
        v15 = v176;
        __swift_project_boxed_opaque_existential_1(v174, v175);
        type metadata accessor for SILManifestHeader(0);
        SILFileHandle.readAs<A>(offset:size:)(0, 160, v14, v16, v15);
        v18 = v163;
        v137 = v164;
        v135 = v165;
        v144 = v170;
        v145 = v171;
        v146 = v172;
        v147 = v173;
        v140 = v166;
        v141 = v167;
        v142 = v168;
        v143 = v169;
        if (v18 == sil_header_magic_number())
        {
          v19 = static Array._allocateBufferUninitialized(minimumCapacity:)();
          *(_QWORD *)(v19 + 16) = 37;
          *(_OWORD *)(v19 + 48) = 0u;
          *(_QWORD *)(v19 + 61) = 0;
          *(_OWORD *)(v19 + 32) = 0u;
          v158 = v137;
          v20 = specialized _copyCollectionToContiguousArray<A>(_:)((size_t)&v158, (unint64_t)&v159);
          uuid_unparse((const unsigned __int8 *)(v20 + 32), (char *)(v19 + 32));
          swift_release();
          v21 = Log.unsafeMutableAddressor();
          swift_beginAccess();
          v138 = v21;
          v22 = *v21;
          *(_QWORD *)&v158 = 0;
          *((_QWORD *)&v158 + 1) = 0xE000000000000000;
          swift_retain();
          _StringGuts.grow(_:)(24);
          swift_bridgeObjectRelease();
          *(_QWORD *)&v158 = 0xD000000000000011;
          *((_QWORD *)&v158 + 1) = 0x80000002454EEE40;
          v23 = v175;
          v24 = v176;
          __swift_project_boxed_opaque_existential_1(v174, v175);
          v25._countAndFlagsBits = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 24))(v23, v24);
          String.append(_:)(v25);
          swift_bridgeObjectRelease();
          v26._countAndFlagsBits = 2112032;
          v26._object = (void *)0xE300000000000000;
          String.append(_:)(v26);
          v27 = swift_bridgeObjectRetain();
          v28 = specialized String.init(cString:)(v27);
          v30 = v29;
          swift_bridgeObjectRelease();
          v31._countAndFlagsBits = v28;
          v31._object = v30;
          String.append(_:)(v31);
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v22 + 152))(3, v158, *((_QWORD *)&v158 + 1));
          swift_release();
          swift_bridgeObjectRelease();
          v32 = static Array._allocateBufferUninitialized(minimumCapacity:)();
          *(_QWORD *)(v32 + 16) = 32;
          *(_OWORD *)(v32 + 96) = v144;
          *(_OWORD *)(v32 + 112) = v145;
          *(_OWORD *)(v32 + 128) = v146;
          *(_OWORD *)(v32 + 144) = v147;
          *(_OWORD *)(v32 + 32) = v140;
          *(_OWORD *)(v32 + 48) = v141;
          *(_OWORD *)(v32 + 64) = v142;
          *(_OWORD *)(v32 + 80) = v143;
          swift_bridgeObjectRetain();
          v33 = 32;
          v34 = MEMORY[0x24BEE4AF8];
          v133 = v32;
          do
          {
            v37 = *(_DWORD *)(v32 + v33);
            if (v37)
            {
              isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              *(_QWORD *)&v158 = v34;
              if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              {
                specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v34 + 16) + 1, 1);
                v32 = v133;
                v34 = v158;
              }
              v36 = *(_QWORD *)(v34 + 16);
              v35 = *(_QWORD *)(v34 + 24);
              if (v36 >= v35 >> 1)
              {
                specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v35 > 1, v36 + 1, 1);
                v32 = v133;
                v34 = v158;
              }
              *(_QWORD *)(v34 + 16) = v36 + 1;
              *(_DWORD *)(v34 + 4 * v36 + 32) = v37;
            }
            v33 += 4;
          }
          while (v33 != 160);
          v43 = v3;
          swift_bridgeObjectRelease();
          v44 = *(_QWORD *)(v34 + 16);
          if (v44)
          {
            *(_QWORD *)&v158 = MEMORY[0x24BEE4AF8];
            specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v44, 0);
            v45 = 0;
            v46 = v158;
            v47 = *(_QWORD *)(v158 + 16);
            do
            {
              v48 = *(unsigned int *)(v34 + 4 * v45 + 32);
              *(_QWORD *)&v158 = v46;
              v49 = *(_QWORD *)(v46 + 24);
              if (v47 >= v49 >> 1)
              {
                specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v49 > 1, v47 + 1, 1);
                v46 = v158;
              }
              ++v45;
              *(_QWORD *)(v46 + 16) = v47 + 1;
              *(_QWORD *)(v46 + 8 * v47++ + 32) = v48;
            }
            while (v44 != v45);
            swift_release();
          }
          else
          {
            swift_release();
            v46 = MEMORY[0x24BEE4AF8];
          }
          v1 = v131;
          v17 = v139;
          v3 = v43;
          v123 = *(_QWORD *)(v46 + 16);
          if (v123)
          {
            v125 = v46 + 32;
            swift_beginAccess();
            v50 = 0;
            v124 = v46;
            while (1)
            {
              if (v50 >= *(_QWORD *)(v46 + 16))
                goto LABEL_77;
              v51 = v3;
              v130 = v50;
              v52 = *(_QWORD *)(v125 + 8 * v50);
              v53 = v175;
              v54 = v176;
              __swift_project_boxed_opaque_existential_1(v174, v175);
              type metadata accessor for SILManifestTable(0);
              SILFileHandle.readAs<A>(offset:size:)(v52, 16, v53, v55, v54);
              v56 = v158;
              v57 = DWORD1(v158);
              v58 = DWORD2(v158);
              v59 = WORD6(v158);
              v129 = HIWORD(v158);
              v61 = v175;
              v60 = v176;
              __swift_project_boxed_opaque_existential_1(v174, v175);
              v62 = __OFADD__(v52, 16);
              v63 = v52 + 16;
              if (v62)
                goto LABEL_78;
              v127 = v59;
              v128 = v57;
              type metadata accessor for SILManifestFrame(0);
              SILFileHandle.readArrayOf<A>(offset:count:)(v63, v58, v61, v64, v60);
              v136 = v65;
              v66 = v58;
              if ((_DWORD)v56 == -1)
              {
                if (__OFADD__(v51, 1))
                  goto LABEL_79;
                v126 = v51 + 1;
              }
              else
              {
                v126 = v51;
                v51 = v56;
              }
              v67 = *v138;
              *(_QWORD *)&v158 = 0;
              *((_QWORD *)&v158 + 1) = 0xE000000000000000;
              swift_retain();
              _StringGuts.grow(_:)(19);
              swift_bridgeObjectRelease();
              *(_QWORD *)&v158 = 0xD000000000000011;
              *((_QWORD *)&v158 + 1) = 0x80000002454EEE60;
              *(_QWORD *)&v153 = v51;
              v68._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
              String.append(_:)(v68);
              swift_bridgeObjectRelease();
              (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v67 + 152))(3, v158, *((_QWORD *)&v158 + 1));
              swift_release();
              swift_bridgeObjectRelease();
              v69 = v148;
              v70 = v148[2];
              if (v70)
              {
                v71 = (uint64_t)(v148 + 4);
                swift_bridgeObjectRetain();
                while (1)
                {
                  outlined init with copy of SILManifest.Indicator(v71, (uint64_t)v149);
                  if (*((_QWORD *)&v150 + 1) == v51)
                    break;
                  outlined destroy of SILManifest.Indicator((uint64_t)v149);
                  v71 += 80;
                  if (!--v70)
                    goto LABEL_40;
                }
                v155 = v150;
                v156 = v151;
                v157 = v152;
                v153 = v149[0];
                v154 = v149[1];
              }
              else
              {
                swift_bridgeObjectRetain();
LABEL_40:
                v156 = 0u;
                v157 = 0u;
                v154 = 0u;
                v155 = 0u;
                v153 = 0u;
              }
              swift_bridgeObjectRelease();
              if (*((_QWORD *)&v154 + 1))
                break;
              outlined destroy of SILManifest.Indicator?((uint64_t)&v153, &demangling cache variable for type metadata for SILManifest.Indicator?);
              if ((_DWORD)v58)
              {
                swift_beginAccess();
                v72 = 0;
                v73 = (unsigned int *)(v136 + 36);
                v74 = (_QWORD *)MEMORY[0x24BEE4AF8];
                v134 = v51;
                while (v72 < *(_QWORD *)(v136 + 16))
                {
                  v75 = *(v73 - 1);
                  v76 = (v135 + v75);
                  if (__CFADD__(v135, v75))
                    goto LABEL_75;
                  v77 = v76 + *v73;
                  if (__CFADD__((_DWORD)v76, *v73))
                    goto LABEL_76;
                  v78 = v66;
                  v80 = v175;
                  v79 = v176;
                  __swift_project_boxed_opaque_existential_1(v174, v175);
                  if ((*(uint64_t (**)(uint64_t, uint64_t))(v79 + 16))(v80, v79) < v77)
                  {
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_beginAccess();
                    v105 = *v138;
                    *(_QWORD *)&v153 = 0;
                    *((_QWORD *)&v153 + 1) = 0xE000000000000000;
                    swift_retain();
                    _StringGuts.grow(_:)(42);
                    swift_bridgeObjectRelease();
                    *(_QWORD *)&v153 = 0xD00000000000001CLL;
                    *((_QWORD *)&v153 + 1) = 0x80000002454EEEA0;
                    LODWORD(v149[0]) = v76;
                    v106._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
                    String.append(_:)(v106);
                    swift_bridgeObjectRelease();
                    v107._countAndFlagsBits = 0x7A697320646E6120;
                    v107._object = (void *)0xEA00000000002065;
                    String.append(_:)(v107);
                    v108 = *v73;
                    swift_bridgeObjectRelease();
                    LODWORD(v149[0]) = v108;
                    v109._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
                    String.append(_:)(v109);
                    swift_bridgeObjectRelease();
                    (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v105 + 144))(4, v153, *((_QWORD *)&v153 + 1));
                    swift_bridgeObjectRelease();
                    swift_release();
                    goto LABEL_68;
                  }
                  v81 = *v138;
                  *(_QWORD *)&v158 = 0;
                  *((_QWORD *)&v158 + 1) = 0xE000000000000000;
                  swift_retain();
                  _StringGuts.grow(_:)(46);
                  swift_bridgeObjectRelease();
                  *(_QWORD *)&v158 = 0xD000000000000010;
                  *((_QWORD *)&v158 + 1) = 0x80000002454EEE80;
                  *(_QWORD *)&v153 = v72;
                  v82._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
                  String.append(_:)(v82);
                  swift_bridgeObjectRelease();
                  v83._countAndFlagsBits = 0x664F61746164205DLL;
                  v83._object = (void *)0xED00003A74657366;
                  String.append(_:)(v83);
                  LODWORD(v153) = v76;
                  v84._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
                  String.append(_:)(v84);
                  swift_bridgeObjectRelease();
                  v85._countAndFlagsBits = 0x69735F6174616420;
                  v85._object = (void *)0xEB000000003A657ALL;
                  String.append(_:)(v85);
                  LODWORD(v153) = *v73;
                  v86._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
                  String.append(_:)(v86);
                  swift_bridgeObjectRelease();
                  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v81 + 128))(3, v158, *((_QWORD *)&v158 + 1));
                  swift_release();
                  swift_bridgeObjectRelease();
                  v87 = *v73;
                  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                    v74 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v74[2] + 1, 1, v74);
                  v89 = v74[2];
                  v88 = v74[3];
                  if (v89 >= v88 >> 1)
                    v74 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v88 > 1), v89 + 1, 1, v74);
                  ++v72;
                  v74[2] = v89 + 1;
                  v90 = &v74[2 * v89];
                  v90[4] = v76;
                  v90[5] = v87;
                  v73 += 2;
                  v66 = v78;
                  v91 = v78 == v72;
                  v51 = v134;
                  if (v91)
                  {
                    swift_bridgeObjectRelease();
                    v69 = v148;
                    v1 = v131;
                    goto LABEL_57;
                  }
                }
                __break(1u);
LABEL_75:
                __break(1u);
LABEL_76:
                __break(1u);
LABEL_77:
                __break(1u);
LABEL_78:
                __break(1u);
LABEL_79:
                __break(1u);
              }
              swift_bridgeObjectRelease();
              v74 = (_QWORD *)MEMORY[0x24BEE4AF8];
              v1 = v131;
LABEL_57:
              outlined init with copy of SILFileHandle((uint64_t)v174, (uint64_t)&v158);
              *((_QWORD *)&v160 + 1) = v51;
              *(_QWORD *)&v161 = v128;
              *((_QWORD *)&v161 + 1) = v127;
              *(_QWORD *)&v162 = v129;
              *((_QWORD *)&v162 + 1) = v74;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v69 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v69[2] + 1, 1, v69);
              v93 = v69[2];
              v92 = v69[3];
              v94 = v130;
              if (v93 >= v92 >> 1)
              {
                v99 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v92 > 1), v93 + 1, 1, v69);
                v94 = v130;
                v69 = v99;
              }
              v50 = v94 + 1;
              v69[2] = v93 + 1;
              v95 = &v69[10 * v93];
              v95[2] = v158;
              v96 = v159;
              v97 = v160;
              v98 = v162;
              v95[5] = v161;
              v95[6] = v98;
              v95[3] = v96;
              v95[4] = v97;
              v148 = v69;
              v3 = v126;
              v17 = v139;
              v46 = v124;
              if (v50 == v123)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                v3 = v126;
                goto LABEL_64;
              }
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v160 = v155;
            v161 = v156;
            v162 = v157;
            v158 = v153;
            v159 = v154;
            swift_beginAccess();
            v113 = *v138;
            *(_QWORD *)&v149[0] = 0;
            *((_QWORD *)&v149[0] + 1) = 0xE000000000000000;
            swift_retain();
            _StringGuts.grow(_:)(38);
            swift_bridgeObjectRelease();
            *(_QWORD *)&v149[0] = 0xD000000000000017;
            *((_QWORD *)&v149[0] + 1) = 0x80000002454EEEC0;
            v114._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
            String.append(_:)(v114);
            swift_bridgeObjectRelease();
            v115._countAndFlagsBits = 0x206D6F726620;
            v115._object = (void *)0xE600000000000000;
            String.append(_:)(v115);
            v116 = *((_QWORD *)&v159 + 1);
            v117 = v160;
            __swift_project_boxed_opaque_existential_1(&v158, *((uint64_t *)&v159 + 1));
            v118._countAndFlagsBits = (*(uint64_t (**)(uint64_t, uint64_t))(v117 + 24))(v116, v117);
            String.append(_:)(v118);
            swift_bridgeObjectRelease();
            v119._countAndFlagsBits = 2106912;
            v119._object = (void *)0xE300000000000000;
            String.append(_:)(v119);
            v120 = v175;
            v121 = v176;
            __swift_project_boxed_opaque_existential_1(v174, v175);
            v122._countAndFlagsBits = (*(uint64_t (**)(uint64_t, uint64_t))(v121 + 24))(v120, v121);
            String.append(_:)(v122);
            swift_bridgeObjectRelease();
            (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v113 + 144))(4, *(_QWORD *)&v149[0], *((_QWORD *)&v149[0] + 1));
            swift_release();
            swift_bridgeObjectRelease();
            outlined destroy of SILManifest.Indicator((uint64_t)&v158);
LABEL_68:
            swift_bridgeObjectRelease();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v174);
            return 0;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_64:
          swift_bridgeObjectRelease();
          goto LABEL_7;
        }
        v39 = Log.unsafeMutableAddressor();
        swift_beginAccess();
        v7 = *v39;
        *(_QWORD *)&v158 = 0;
        *((_QWORD *)&v158 + 1) = 0xE000000000000000;
        swift_retain();
        _StringGuts.grow(_:)(30);
        swift_bridgeObjectRelease();
        *(_QWORD *)&v158 = 0xD00000000000001CLL;
        *((_QWORD *)&v158 + 1) = 0x80000002454EEE20;
        v40 = v175;
        v41 = v176;
        __swift_project_boxed_opaque_existential_1(v174, v175);
        v42._countAndFlagsBits = (*(uint64_t (**)(uint64_t, uint64_t))(v41 + 24))(v40, v41);
        String.append(_:)(v42);
        swift_bridgeObjectRelease();
        v13 = *((_QWORD *)&v158 + 1);
        v12 = v158;
      }
      else
      {
        v6 = Log.unsafeMutableAddressor();
        swift_beginAccess();
        v7 = *v6;
        v163 = 0;
        *(_QWORD *)&v164 = 0xE000000000000000;
        swift_retain();
        _StringGuts.grow(_:)(54);
        v8._countAndFlagsBits = 0xD000000000000034;
        v8._object = (void *)0x80000002454EEEE0;
        String.append(_:)(v8);
        v9 = v175;
        v10 = v176;
        __swift_project_boxed_opaque_existential_1(v174, v175);
        v11._countAndFlagsBits = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 24))(v9, v10);
        String.append(_:)(v11);
        swift_bridgeObjectRelease();
        v12 = v163;
        v13 = v164;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 144))(4, v12, v13);
      swift_release();
      swift_bridgeObjectRelease();
      v17 = v139;
LABEL_7:
      v2 = v17 + 1;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v174);
      if (v2 == v1)
      {
        swift_bridgeObjectRelease();
        if (v148[2])
        {
          specialized MutableCollection<>.sort(by:)((uint64_t *)&v148, (uint64_t (*)(uint64_t))specialized _ArrayBuffer._consumeAndCreateNew(), specialized UnsafeMutableBufferPointer._stableSortImpl(by:));
          v110 = (uint64_t)v148;
          type metadata accessor for SILManifest();
          v104 = swift_allocObject();
          SILManifest.init(indicators:)(v110);
          return v104;
        }
        swift_bridgeObjectRelease();
        v112 = Log.unsafeMutableAddressor();
        swift_beginAccess();
        v101 = *(void (**)(uint64_t, unint64_t, unint64_t))(*(_QWORD *)*v112 + 144);
        swift_retain();
        v102 = 0xD000000000000020;
        v103 = "No valid manifest files provided";
        goto LABEL_66;
      }
    }
  }
  v100 = Log.unsafeMutableAddressor();
  swift_beginAccess();
  v101 = *(void (**)(uint64_t, unint64_t, unint64_t))(*(_QWORD *)*v100 + 144);
  swift_retain();
  v102 = 0xD00000000000001ALL;
  v103 = "No manifest files provided";
LABEL_66:
  v101(4, v102, (unint64_t)(v103 - 32) | 0x8000000000000000);
  swift_release();
  return 0;
}

uint64_t outlined init with copy of SILManifest.Indicator?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t specialized _ArrayProtocol.filter(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  void **v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  Swift::String v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void **v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20[2];
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  result = MEMORY[0x24BEE4AF8];
  v24 = MEMORY[0x24BEE4AF8];
  v19 = *(_QWORD *)(a1 + 16);
  if (v19)
  {
    v5 = 0;
    v18 = a1 + 32;
    v17 = (void **)(a2 + 40);
    do
    {
      outlined init with copy of SILFileHandle(v18 + 40 * v5, (uint64_t)&v21);
      v6 = *(_QWORD *)(a2 + 16);
      if (v6)
      {
        swift_bridgeObjectRetain();
        v7 = v17;
        do
        {
          v9 = (uint64_t)*(v7 - 1);
          v8 = *v7;
          v10 = v22;
          v11 = v23;
          __swift_project_boxed_opaque_existential_1(&v21, v22);
          v12 = *(void (**)(uint64_t, uint64_t))(v11 + 24);
          swift_bridgeObjectRetain();
          v12(v10, v11);
          v13._countAndFlagsBits = v9;
          v13._object = v8;
          LOBYTE(v9) = String.hasSuffix(_:)(v13);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v9 & 1) != 0)
          {
            swift_bridgeObjectRelease();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)&v21);
            goto LABEL_4;
          }
          v7 += 2;
          --v6;
        }
        while (v6);
        swift_bridgeObjectRelease();
      }
      outlined init with take of SILFileHandle(&v21, (uint64_t)v20);
      v14 = v24;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v14 + 16) + 1, 1);
        v14 = v24;
      }
      v16 = *(_QWORD *)(v14 + 16);
      v15 = *(_QWORD *)(v14 + 24);
      if (v16 >= v15 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v15 > 1, v16 + 1, 1);
        v14 = v24;
      }
      *(_QWORD *)(v14 + 16) = v16 + 1;
      outlined init with take of SILFileHandle(v20, v14 + 40 * v16 + 32);
LABEL_4:
      ++v5;
    }
    while (v5 != v19);
    return v24;
  }
  return result;
}

uint64_t type metadata accessor for SILRenderer()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for SILRenderer.Region()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for SILRenderer.CachedEntry()
{
  return objc_opt_self();
}

uint64_t outlined destroy of SILManifest.Indicator?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v6 = a4 + 40 * a1 + 32;
    v7 = a3 + 40 * v5;
    if (v6 >= v7 || v6 + 40 * v5 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      swift_arrayInitWithCopy();
      return v7;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

_QWORD *specialized SILRenderer.renderIndicatorToSurface(frame:indicator_idx:z_rotation:blit_offset:surface:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t (*v25)(void);
  uint64_t v26;
  _QWORD *result;
  uint64_t v28;
  size_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t (*v32)(uint64_t);
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  NSObject *v42;
  char v43;
  char *v44;
  uint64_t v45;
  uint8_t *v46;
  os_signpost_id_t v47;
  uint8_t *v48;
  char *v49;
  uint64_t v50;
  size_t v51;
  uint8_t *v52;
  uint64_t v53;
  void *v54;
  size_t v55;
  uint64_t *v56;
  uint64_t (*v57)(uint64_t);
  uint64_t v58;
  char v59;
  uint64_t v60;
  char *v61;
  NSObject *v62;
  char *v63;
  os_signpost_type_t v64;
  char *v65;
  uint64_t v66;
  const char *v67;
  const char *v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  unsigned int v83;
  uint64_t v84;
  unint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  char *v90;
  uint8_t *v91;
  os_signpost_id_t v92;
  void (*v93)(char *, uint64_t);
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unsigned __int8 v98;
  unsigned __int8 v99;
  uint64_t v100;
  uint64_t v101;
  void (*v102)(char *, char *, uint64_t);
  uint64_t v103;
  uint64_t *v104;
  char *v105;
  char *v106;
  char *v107;
  uint64_t (*v108)(void);
  char *v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  const char *v113;
  _QWORD *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  size_t v122;
  _QWORD v123[6];
  unint64_t v124;
  unint64_t v125;
  uint64_t v126;

  v114 = a6;
  v115 = a5;
  v116 = a4;
  v119 = a1;
  v120 = a2;
  v113 = (const char *)type metadata accessor for OSSignpostError();
  v112 = *((_QWORD *)v113 - 1);
  MEMORY[0x24BDAC7A8](v113);
  v111 = (char *)&v101 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for OSSignpostID();
  v10 = *(_QWORD *)(v9 - 8);
  v117 = v9;
  v118 = v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v101 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v101 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v101 - v17;
  v19 = type metadata accessor for OSSignposter();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v101 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v25 = (uint64_t (*)(void))((char *)&v101 - v24);
  v121 = v6;
  v26 = v126;
  result = (*(_QWORD *(**)(_QWORD *__return_ptr, uint64_t))(**(_QWORD **)(v6 + 64) + 112))(v123, a3);
  if (!v26)
  {
    v108 = v25;
    v106 = v18;
    v107 = v23;
    v126 = v20;
    v109 = v16;
    v110 = v19;
    v105 = v13;
    v29 = v120;
    v28 = v121;
    v30 = (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)v121 + 288))(v123, v119, v120);
    v103 = 0;
    v31 = Log.unsafeMutableAddressor();
    swift_beginAccess();
    v104 = v31;
    v32 = *(uint64_t (**)(uint64_t))(*(_QWORD *)*v31 + 176);
    v33 = swift_retain();
    v34 = v32(v33);
    v35 = swift_release();
    v36 = 0;
    v37 = v118;
    v38 = v110;
    if ((v34 & 1) != 0)
    {
      v39 = SILSignpost.unsafeMutableAddressor();
      v40 = v126;
      (*(void (**)(uint64_t (*)(void), uint64_t, uint64_t))(v126 + 16))(v108, v39, v38);
      v41 = v106;
      static OSSignpostID.exclusive.getter();
      v42 = OSSignposter.logHandle.getter();
      LODWORD(v119) = static os_signpost_type_t.begin.getter();
      v43 = OS_os_log.signpostsEnabled.getter();
      v44 = v109;
      if ((v43 & 1) != 0)
      {
        v102 = *(void (**)(char *, char *, uint64_t))(v37 + 16);
        v45 = v117;
        v102(v109, v41, v117);
        v46 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v46 = 134217984;
        v122 = v29;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        v47 = OSSignpostID.rawValue.getter();
        _os_signpost_emit_with_name_impl(&dword_2454D6000, v42, (os_signpost_type_t)v119, v47, "Decompression", "[SILMGR] [Renderer] Decompressing %ld bytes Signpost", v46, 0xCu);
        v48 = v46;
        v49 = v109;
        MEMORY[0x249536508](v48, -1, -1);

        v50 = v45;
        v40 = v126;
        (*(void (**)(char *, uint64_t))(v37 + 8))(v49, v50);
        v102(v49, v41, v50);
      }
      else
      {

        v50 = v117;
        (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v44, v41, v117);
      }
      type metadata accessor for OSSignpostIntervalState();
      swift_allocObject();
      v36 = OSSignpostIntervalState.init(id:isOpen:)();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v41, v50);
      v38 = v110;
      v35 = (*(uint64_t (**)(uint64_t (*)(void), uint64_t))(v40 + 8))(v108, v110);
    }
    v119 = v36;
    v51 = v125 * v124;
    if ((unsigned __int128)((uint64_t)v125 * (__int128)(uint64_t)v124) >> 64 == (uint64_t)(v125 * v124) >> 63)
    {
      v108 = *(uint64_t (**)(void))(*(_QWORD *)v28 + 200);
      v52 = (uint8_t *)((uint64_t (*)(uint64_t))v108)(v35);
      v53 = *(_QWORD *)(v30 + 16);
      v54 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)v28 + 224))();
      v55 = compression_decode_buffer(v52, v51, (const uint8_t *)(v53 + 32), v29, v54, COMPRESSION_LZFSE);
      v56 = v104;
      swift_beginAccess();
      v57 = *(uint64_t (**)(uint64_t))(*(_QWORD *)*v56 + 176);
      v58 = swift_retain();
      v59 = v57(v58);
      swift_release();
      if ((v59 & 1) == 0)
        goto LABEL_14;
      v106 = (char *)v55;
      v60 = SILSignpost.unsafeMutableAddressor();
      v61 = v107;
      (*(void (**)(char *, uint64_t, uint64_t))(v126 + 16))(v107, v60, v38);
      if (v119)
      {
        swift_retain();
        v62 = OSSignposter.logHandle.getter();
        v63 = v105;
        OSSignpostIntervalState.signpostID.getter();
        v64 = static os_signpost_type_t.end.getter();
        if ((OS_os_log.signpostsEnabled.getter() & 1) != 0)
        {
          v120 = v30;
          swift_retain();
          v65 = v111;
          checkForErrorAndConsumeState(state:)();
          swift_release();
          v66 = v112;
          v67 = v113;
          if ((*(unsigned int (**)(char *, const char *))(v112 + 88))(v65, v113) == *MEMORY[0x24BEE7810])
          {
            v68 = "[Error] Interval already ended";
          }
          else
          {
            (*(void (**)(char *, const char *))(v66 + 8))(v65, v67);
            v68 = "";
          }
          v113 = v68;
          v86 = v106;
          v87 = v117;
          v88 = v118;
          v89 = v109;
          (*(void (**)(char *, char *, uint64_t))(v118 + 16))(v109, v63, v117);
          v90 = v63;
          v91 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v91 = 0;
          v92 = OSSignpostID.rawValue.getter();
          _os_signpost_emit_with_name_impl(&dword_2454D6000, v62, v64, v92, "Decompression", v113, v91, 2u);
          MEMORY[0x249536508](v91, -1, -1);
          swift_release();

          v93 = *(void (**)(char *, uint64_t))(v88 + 8);
          v93(v90, v87);
          (*(void (**)(char *, uint64_t))(v126 + 8))(v107, v110);
          v93(v89, v87);
          v30 = v120;
          if (!v86)
            goto LABEL_27;
          goto LABEL_15;
        }
        swift_release();

        (*(void (**)(char *, uint64_t))(v118 + 8))(v63, v117);
        (*(void (**)(char *, uint64_t))(v126 + 8))(v61, v38);
        v55 = (size_t)v106;
LABEL_14:
        if (!v55)
        {
LABEL_27:
          specialized SILError.log()(1, 0, 7);
          v95 = v94;
          v97 = v96;
          v99 = v98;
          lazy protocol witness table accessor for type SILError and conformance SILError();
          swift_allocError();
          *(_QWORD *)v100 = v95;
          *(_QWORD *)(v100 + 8) = v97;
          *(_BYTE *)(v100 + 16) = v99;
          outlined copy of SILError(v95, v97, v99);
          swift_willThrow();
          swift_release();
          swift_release();
          return (_QWORD *)outlined destroy of SILManifest.Indicator((uint64_t)v123);
        }
LABEL_15:
        v120 = v30;
        v69 = v114;
        v70 = v114[3];
        v71 = v114[4];
        __swift_project_boxed_opaque_existential_1(v114, v70);
        v72 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v71 + 48))(0, v70, v71);
        v73 = v69[3];
        v74 = v69[4];
        __swift_project_boxed_opaque_existential_1(v69, v73);
        v75 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v74 + 56))(0, v73, v74);
        if ((v75 & 0x8000000000000000) == 0)
        {
          v76 = v75;
          if (!HIDWORD(v75))
          {
            v77 = v69[3];
            v78 = v69[4];
            __swift_project_boxed_opaque_existential_1(v69, v77);
            v79 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v78 + 48))(1, v77, v78);
            v80 = v69[3];
            v81 = v69[4];
            __swift_project_boxed_opaque_existential_1(v69, v80);
            v82 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v81 + 56))(1, v80, v81);
            if ((v82 & 0x8000000000000000) == 0)
            {
              v83 = v82;
              if (!HIDWORD(v82))
              {
                v84 = v108();
                if ((v125 & 0x8000000000000000) == 0
                  && !HIDWORD(v125)
                  && (v124 & 0x8000000000000000) == 0
                  && !HIDWORD(v124))
                {
                  v85 = (v76 >> 2) * v115 + v116;
                  sil_argb8888_to_b3a8(v84, v125, v72 + 4 * v85, v76, (_QWORD *)(v79 + v85), v83, v124, v124);
                  swift_release();
                  swift_release();
                  return (_QWORD *)outlined destroy of SILManifest.Indicator((uint64_t)v123);
                }
              }
            }
          }
        }
LABEL_30:
        result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)();
        __break(1u);
        return result;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_30;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SwapWaitType and conformance SwapWaitType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SwapWaitType and conformance SwapWaitType;
  if (!lazy protocol witness table cache variable for type SwapWaitType and conformance SwapWaitType)
  {
    result = MEMORY[0x24953649C](&protocol conformance descriptor for SwapWaitType, &type metadata for SwapWaitType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SwapWaitType and conformance SwapWaitType);
  }
  return result;
}

uint64_t destroy for SILError(uint64_t a1)
{
  return outlined consume of SILError(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t initializeBufferWithCopyOfBuffer for SILError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  outlined copy of SILError(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SILError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  outlined copy of SILError(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  outlined consume of SILError(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SILError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  outlined consume of SILError(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SILError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xF9 && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 249);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 7)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SILError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF8)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 249;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xF9)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xF9)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t getEnumTag for SILError(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 6u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 7);
}

uint64_t destructiveInjectEnumTag for SILError(uint64_t result, unsigned int a2)
{
  if (a2 >= 7)
  {
    *(_QWORD *)result = a2 - 7;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 7;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SILError()
{
  return &type metadata for SILError;
}

_QWORD *initializeBufferWithCopyOfBuffer for PixelFormatInfo(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for PixelFormatInfo()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for PixelFormatInfo(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for PixelFormatInfo(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PixelFormatInfo(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PixelFormatInfo(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PixelFormatInfo()
{
  return &type metadata for PixelFormatInfo;
}

uint64_t getEnumTagSinglePayload for SwapWaitType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SwapWaitType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2454EB824 + 4 * byte_2454EDE3D[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2454EB858 + 4 * byte_2454EDE38[v4]))();
}

uint64_t sub_2454EB858(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2454EB860(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2454EB868);
  return result;
}

uint64_t sub_2454EB874(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2454EB87CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2454EB880(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2454EB888(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SwapWaitType()
{
  return &type metadata for SwapWaitType;
}

uint64_t type metadata accessor for SILManifest()
{
  return objc_opt_self();
}

uint64_t initializeBufferWithCopyOfBuffer for SILManifest.Indicator(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SILManifest.Indicator(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SILManifest.Indicator(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for SILManifest.Indicator(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for SILManifest.Indicator(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SILManifest.Indicator(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SILManifest.Indicator(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SILManifest.Indicator()
{
  return &type metadata for SILManifest.Indicator;
}

uint64_t getEnumTagSinglePayload for SILManifest.Indicator.Frame(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SILManifest.Indicator.Frame(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SILManifest.Indicator.Frame()
{
  return &type metadata for SILManifest.Indicator.Frame;
}

_QWORD *__swift_memcpy8_4(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SILRenderer.Region.PageContent(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SILRenderer.Region.PageContent(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SILRenderer.Region.PageContent()
{
  return &type metadata for SILRenderer.Region.PageContent;
}

void type metadata accessor for SILManifestHeader(uint64_t a1)
{
  type metadata accessor for SILManifestHeader(a1, &lazy cache variable for type metadata for SILManifestHeader);
}

void type metadata accessor for SILManifestTable(uint64_t a1)
{
  type metadata accessor for SILManifestHeader(a1, &lazy cache variable for type metadata for SILManifestTable);
}

void type metadata accessor for SILManifestFrame(uint64_t a1)
{
  type metadata accessor for SILManifestHeader(a1, &lazy cache variable for type metadata for SILManifestFrame);
}

void type metadata accessor for SILManifestHeader(uint64_t a1, unint64_t *a2)
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

__n128 __swift_memcpy16_4(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

__n128 __swift_memcpy160_4(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  result = *(__n128 *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(__n128 *)(a1 + 96) = result;
  *(_OWORD *)(a1 + 112) = v7;
  return result;
}

uint64_t getEnumTagSinglePayload for SILManifestHeader(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 160))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SILManifestHeader(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 160) = v3;
  return result;
}

uint64_t SILManager.Service.__allocating_init(endpoint:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = type metadata accessor for TightbeamEndpoint();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  type metadata accessor for ClientConnection();
  swift_allocObject();
  v7 = ClientConnection.init(endpoint:)();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  *(_QWORD *)(v6 + 16) = v7;
  return v6;
}

uint64_t SILManager.Service.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t protocol witness for TightbeamServiceInitProtocol.init(endpoint:) in conformance SILManager.Service@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;

  v4 = type metadata accessor for TightbeamEndpoint();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  type metadata accessor for ClientConnection();
  swift_allocObject();
  v9 = ClientConnection.init(endpoint:)();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  *(_QWORD *)(v8 + 16) = v9;
  *a2 = v8;
  return result;
}

uint64_t SILManager.Server.__allocating_init(endpoint:handler:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = type metadata accessor for TightbeamEndpoint();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = swift_allocObject();
  outlined init with copy of SILFileHandle(a2, v8 + 24);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  type metadata accessor for ServiceConnection();
  swift_allocObject();
  *(_QWORD *)(v8 + 16) = ServiceConnection.init(endpoint:)();
  lazy protocol witness table accessor for type SILManager.Server and conformance SILManager.Server(&lazy protocol witness table cache variable for type SILManager.Server and conformance SILManager.Server, (uint64_t)&protocol conformance descriptor for SILManager.Server);
  swift_retain();
  dispatch thunk of ServiceConnection.service.setter();
  __swift_destroy_boxed_opaque_existential_1(a2);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v8;
}

uint64_t type metadata accessor for SILManager.Server()
{
  return objc_opt_self();
}

uint64_t SILManager.Server.decode(_:)(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  Swift::UInt32 v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(char *, uint64_t, uint64_t);
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  char v55;
  Swift::UInt32 v56;
  uint64_t v57;
  Swift::UInt32 v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  double v68;
  double v69;
  double v70;
  float v71;
  float v72;
  uint64_t v73;
  float v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  char *v78;
  uint64_t result;
  Swift::String v80;
  char *v81;
  char *v82;
  char *v83;
  void (*v84)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;

  v2 = v1;
  v4 = type metadata accessor for TightbeamEncoder();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v81 = (char *)&v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TightbeamEncoder?);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v81 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v84 = (void (*)(char *, uint64_t, uint64_t, uint64_t))((char *)&v81 - v12);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v81 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v83 = (char *)&v81 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v82 = (char *)&v81 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v81 - v20;
  v22 = type metadata accessor for TightbeamDecoder();
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)&v81 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = v25;
  v26 = *(void (**)(char *, uint64_t))(v25 + 16);
  v89 = v27;
  v26(v24, a1);
  v85 = v4;
  v86 = v5;
  v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v28(v21, 1, 1, v4);
  v29 = v24;
  v30 = TightbeamDecoder.decode(as:)();
  v31 = v30;
  if (v30 <= (uint64_t)0xA410C7076A35A6E7)
  {
    v83 = v15;
    v84 = v28;
    if (v30 == 0x8FCDC6E3802C9B2CLL)
    {
      v43 = (uint64_t)v10;
      v44 = v2[6];
      v45 = v2[7];
      __swift_project_boxed_opaque_existential_1(v2 + 3, v44);
      v46 = TightbeamDecoder.decode(as:)();
      v38 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v45 + 40))(v46, v44, v45);
      v47 = v88;
      TightbeamDecoder.encoder(bytes:capabilities:)();
      if (!v47)
      {
        v41 = v85;
        v84((char *)v43, 0, 1, v85);
        outlined assign with take of TightbeamEncoder?(v43, (uint64_t)v21);
        v48 = v86;
        v49 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v86 + 48);
        v50 = v49(v21, 1, v41);
        v51 = v89;
        if (!v50)
          TightbeamEncoder.encode(_:)(v38);
        goto LABEL_25;
      }
      goto LABEL_20;
    }
    if (v30 == 0xA1B06ACB080733F6)
    {
      v63 = v2[6];
      v64 = v2[7];
      __swift_project_boxed_opaque_existential_1(v2 + 3, v63);
      v65 = TightbeamDecoder.decode(as:)();
      v66 = TightbeamDecoder.decode(as:)();
      TightbeamDecoder.decode(as:)();
      v68 = v67;
      TightbeamDecoder.decode(as:)();
      v70 = v69;
      TightbeamDecoder.decode(as:)();
      v72 = v71;
      v73 = TightbeamDecoder.decode(as:)();
      TightbeamDecoder.decode(as:)();
      v36 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double, double, float, float))(v64 + 24))(v65, v66, v73, v63, v64, v68, v70, v72, v74);
      v38 = v75;
      v76 = v83;
      v77 = v88;
      TightbeamDecoder.encoder(bytes:capabilities:)();
      if (!v77)
      {
        v41 = v85;
        v84(v76, 0, 1, v85);
        v42 = (uint64_t)v76;
LABEL_22:
        outlined assign with take of TightbeamEncoder?(v42, (uint64_t)v21);
        v48 = v86;
        v49 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v86 + 48);
        if (!v49(v21, 1, v41))
        {
          TightbeamEncoder.encode(_:)(v36);
          TightbeamEncoder.encode(_:)(v38);
        }
        goto LABEL_24;
      }
LABEL_20:
      (*(void (**)(char *, uint64_t))(v87 + 8))(v24, v89);
      outlined destroy of TightbeamEncoder?((uint64_t)v21);
      return v38;
    }
  }
  else
  {
    if (v30 == 0xA410C7076A35A6E8)
    {
      v84 = v28;
      v52 = v2[6];
      v53 = v2[7];
      __swift_project_boxed_opaque_existential_1(v2 + 3, v52);
      v54 = TightbeamDecoder.decode(as:)();
      v55 = TightbeamDecoder.decode(as:)();
      v56 = (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(v53 + 16))(v54 & 1, v55 & 1, v52, v53);
      v38 = (uint64_t)v83;
      v57 = v88;
      TightbeamDecoder.encoder(bytes:capabilities:)();
      if (v57)
        goto LABEL_20;
      v41 = v85;
      v84((char *)v38, 0, 1, v85);
      outlined assign with take of TightbeamEncoder?(v38, (uint64_t)v21);
      v48 = v86;
      v49 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v86 + 48);
      if (!v49(v21, 1, v41))
      {
        v58 = v56;
LABEL_17:
        TightbeamEncoder.encode(_:)(v58);
      }
LABEL_24:
      v51 = v89;
LABEL_25:
      if (v49(v21, 1, v41))
      {
        (*(void (**)(char *, uint64_t))(v87 + 8))(v24, v51);
        v38 = 0;
      }
      else
      {
        v78 = v81;
        (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v81, v21, v41);
        v38 = TightbeamEncoder.complete()();
        (*(void (**)(char *, uint64_t))(v48 + 8))(v78, v41);
        (*(void (**)(char *, uint64_t))(v87 + 8))(v29, v51);
      }
      outlined destroy of TightbeamEncoder?((uint64_t)v21);
      return v38;
    }
    if (v30 == 0x67C81ED3212CD499)
    {
      v32 = v2[6];
      v33 = v2[7];
      __swift_project_boxed_opaque_existential_1(v2 + 3, v32);
      v34 = TightbeamDecoder.decode(as:)();
      v35 = TightbeamDecoder.decode(as:)();
      v36 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v33 + 32))(v34, v35 & 1, v32, v33);
      v38 = v37;
      v39 = (char *)v84;
      v40 = v88;
      TightbeamDecoder.encoder(bytes:capabilities:)();
      if (!v40)
      {
        v41 = v85;
        v28(v39, 0, 1, v85);
        v42 = (uint64_t)v39;
        goto LABEL_22;
      }
      goto LABEL_20;
    }
    v84 = v28;
    if (v30 == 0x74E2ED7425CD826ALL)
    {
      v59 = v2[6];
      v60 = v2[7];
      __swift_project_boxed_opaque_existential_1(v2 + 3, v59);
      v38 = (*(uint64_t (**)(uint64_t, uint64_t))(v60 + 8))(v59, v60);
      v61 = (uint64_t)v82;
      v62 = v88;
      TightbeamDecoder.encoder(bytes:capabilities:)();
      v48 = v86;
      if (v62)
        goto LABEL_20;
      v41 = v85;
      v84((char *)v61, 0, 1, v85);
      outlined assign with take of TightbeamEncoder?(v61, (uint64_t)v21);
      v49 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v48 + 48);
      if (!v49(v21, 1, v41))
      {
        v58 = v38;
        goto LABEL_17;
      }
      goto LABEL_24;
    }
  }
  v91 = 0;
  v92 = 0xE000000000000000;
  _StringGuts.grow(_:)(43);
  swift_bridgeObjectRelease();
  v91 = 0xD000000000000029;
  v92 = 0x80000002454EF000;
  v90 = v31;
  v80._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v80);
  swift_bridgeObjectRelease();
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t SILManager.Server.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return swift_deallocClassInstance();
}

uint64_t protocol witness for MessageDecodeProtocol.decode(_:) in conformance SILManager.Server(uint64_t a1)
{
  return SILManager.Server.decode(_:)(a1);
}

uint64_t SILManager.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t SILManager.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t outlined destroy of TightbeamEncoder?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TightbeamEncoder?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined assign with take of TightbeamEncoder?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TightbeamEncoder?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t base witness table accessor for MessageDecodeProtocol in SILManager.Server()
{
  return lazy protocol witness table accessor for type SILManager.Server and conformance SILManager.Server((unint64_t *)&lazy protocol witness table cache variable for type SILManager.Server and conformance SILManager.Server, (uint64_t)&protocol conformance descriptor for SILManager.Server);
}

uint64_t lazy protocol witness table accessor for type SILManager.Server and conformance SILManager.Server(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for SILManager.Server();
    result = MEMORY[0x24953649C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for SwapReturn()
{
  return &type metadata for SwapReturn;
}

uint64_t type metadata accessor for SILManager()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for SILManager.Service()
{
  return objc_opt_self();
}

void sil_argb8888_to_b3a8_cold_1()
{
  __assert_rtn("sil_argb8888_to_b3a8", "Conversion.c", 42, "(src_bpr % simd_group_size) == 0");
}

void SILServer_createSILServerClient(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_2454D6000, a2, a3, "Error creating SILServerClientConnection (tbErr:%d)", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_3(&dword_2454D6000, a2, a3, "Error creating SILServerEndpoint (tbErr:%d)", a5, a6, a7, a8, 0);
}

void SILServer_createRenderer()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2454D6000, v0, v1, "Error while making Tightbeam call for %s : %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void SILServer_setPower()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2454D6000, v0, v1, "Error while making Tightbeam call for %s : %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void SILServer_swap()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2454D6000, v0, v1, "Error while making Tightbeam call for %s : %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void SILServer_turnOffIndicators()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2454D6000, v0, v1, "Error while making Tightbeam call for %s : %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void SILServer_setLogLevel()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2454D6000, v0, v1, "Error while making Tightbeam call for %s : %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void frame_distance()
{
  __assert_rtn("frame_distance", "SILStateMachine.mm", 107, "range_1 != tp.ranges.end ()");
}

{
  __assert_rtn("frame_distance", "SILStateMachine.mm", 108, "range_2 != tp.ranges.end ()");
}

{
  __assert_rtn("frame_distance", "SILStateMachine.mm", 73, "frame_1 >= range_1->from && frame_1 <= range_1->to");
}

{
  __assert_rtn("frame_distance", "SILStateMachine.mm", 74, "frame_2 >= range_2->from && frame_2 <= range_2->to");
}

void SILManagerCreate_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_2454D6000, a2, a3, "Failed to create SIL Renderer ! err: %x", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void SILManagerCreate_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_2454D6000, a2, a3, "Failed to create SIL Server Client ! err: %x", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void indicators_manifest(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2454D6000, a1, a3, "Failed to locate manifest resource", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

{
  OUTLINED_FUNCTION_0_0(&dword_2454D6000, a1, a3, "Empty indicator manifest", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void SILManagerSetPower_cold_1(char a1, NSObject *a2)
{
  const char *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = "off";
  if ((a1 & 1) != 0)
    v2 = "on";
  v3 = 136315138;
  v4 = v2;
  _os_log_error_impl(&dword_2454D6000, a2, OS_LOG_TYPE_ERROR, "SILManager failed to set power %s", (uint8_t *)&v3, 0xCu);
}

void SILManagerSwap_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2454D6000, a1, a3, "SILManager swap failed because pipe is not ready", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

uint64_t static CharacterSet.newlines.getter()
{
  return MEMORY[0x24BDCB728]();
}

uint64_t type metadata accessor for CharacterSet()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x24BDCD8D0](retstr);
}

uint64_t URL.init(fileURLWithFileSystemRepresentation:isDirectory:relativeTo:)()
{
  return MEMORY[0x24BDCD9A8]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t Data.copyBytes(to:count:)()
{
  return MEMORY[0x24BDCDDA8]();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t OSSignposter.init(logger:)()
{
  return MEMORY[0x24BEE7790]();
}

uint64_t OSSignposter.logHandle.getter()
{
  return MEMORY[0x24BEE77C0]();
}

uint64_t type metadata accessor for OSSignposter()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t type metadata accessor for OSSignpostError()
{
  return MEMORY[0x24BEE7818]();
}

uint64_t OSSignpostIntervalState.signpostID.getter()
{
  return MEMORY[0x24BEE7848]();
}

uint64_t OSSignpostIntervalState.init(id:isOpen:)()
{
  return MEMORY[0x24BEE7868]();
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return MEMORY[0x24BEE7870]();
}

uint64_t checkForErrorAndConsumeState(state:)()
{
  return MEMORY[0x24BEE78A0]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t TightbeamDecoder.decode(as:)()
{
  return MEMORY[0x24BEB6DF0]();
}

{
  return MEMORY[0x24BEB6DF8]();
}

{
  return MEMORY[0x24BEB6E00]();
}

{
  return MEMORY[0x24BEB6E10]();
}

{
  return MEMORY[0x24BEB6E18]();
}

{
  return MEMORY[0x24BEB6E28]();
}

{
  return MEMORY[0x24BEB6E40]();
}

uint64_t TightbeamDecoder.encoder(bytes:capabilities:)()
{
  return MEMORY[0x24BEB6E48]();
}

uint64_t type metadata accessor for TightbeamDecoder()
{
  return MEMORY[0x24BEB6E60]();
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::UInt32 a1)
{
  MEMORY[0x24BEB6E98](*(_QWORD *)&a1);
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::UInt64 a1)
{
  MEMORY[0x24BEB6EA0](a1);
}

uint64_t TightbeamEncoder.complete()()
{
  return MEMORY[0x24BEB6EB8]();
}

uint64_t type metadata accessor for TightbeamEncoder()
{
  return MEMORY[0x24BEB6EC8]();
}

uint64_t type metadata accessor for TightbeamEndpoint()
{
  return MEMORY[0x24BEB6EE8]();
}

uint64_t ClientConnection.init(endpoint:)()
{
  return MEMORY[0x24BEB6F08]();
}

uint64_t type metadata accessor for ClientConnection()
{
  return MEMORY[0x24BEB6F18]();
}

uint64_t dispatch thunk of ServiceConnection.service.setter()
{
  return MEMORY[0x24BEB6F38]();
}

uint64_t ServiceConnection.init(endpoint:)()
{
  return MEMORY[0x24BEB6F40]();
}

uint64_t type metadata accessor for ServiceConnection()
{
  return MEMORY[0x24BEB6F48]();
}

uint64_t type metadata accessor for UnsafeBufferPointer()
{
  return MEMORY[0x24BEE09B0]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t String.init<A>(bytes:encoding:)()
{
  return MEMORY[0x24BDCFA50]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t static String._fromUTF8Repairing(_:)()
{
  return MEMORY[0x24BEE0AD0]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

Swift::Bool __swiftcall String.hasSuffix(_:)(Swift::String a1)
{
  return MEMORY[0x24BEE0CD0](a1._countAndFlagsBits, a1._object);
}

uint64_t UnsafeRawBufferPointer.load<A>(fromByteOffset:as:)()
{
  return MEMORY[0x24BEE0F78]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t Array.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x24BEE1158]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t Array.init<A>(_:)()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t Double.write<A>(to:)()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t Float.write<A>(to:)()
{
  return MEMORY[0x24BEE14C8]();
}

uint64_t NSFileHandle.read(upToCount:)()
{
  return MEMORY[0x24BDCFE50]();
}

Swift::UInt64 __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> NSFileHandle.offset()()
{
  return MEMORY[0x24BDCFE68]();
}

uint64_t NSFileHandle.readToEnd()()
{
  return MEMORY[0x24BDCFE70]();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t StringProtocol.components(separatedBy:)()
{
  return MEMORY[0x24BDD04B8]();
}

uint64_t StringProtocol.caseInsensitiveCompare<A>(_:)()
{
  return MEMORY[0x24BDD0580]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

{
  return MEMORY[0x24BEE2F48]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x24BEE3290](cases._rawValue, string._countAndFlagsBits, string._object);
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x24BEE3548](a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t print(_:separator:terminator:)()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t static Hasher._hash(seed:bytes:count:)()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x24BEE42F8](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
  MEMORY[0x24BEE4300](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x24BEDB368](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x24BEDB370](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x24BEDB380](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_251666168(__p);
}

uint64_t operator delete()
{
  return off_251666170();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_251666178(__sz);
}

uint64_t operator new()
{
  return off_251666180();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
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

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB978](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_decode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB980](*(_QWORD *)&algorithm);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
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

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
  MEMORY[0x24BDAEEB8](__b, __pattern4, __len);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
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

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

uint64_t tb_client_connection_activate()
{
  return MEMORY[0x24BEB6F68]();
}

uint64_t tb_client_connection_create_with_endpoint()
{
  return MEMORY[0x24BEB6F80]();
}

uint64_t tb_client_connection_message_construct()
{
  return MEMORY[0x24BEB6F88]();
}

uint64_t tb_client_connection_message_destruct()
{
  return MEMORY[0x24BEB6F98]();
}

uint64_t tb_conclave_endpoint_for_service()
{
  return MEMORY[0x24BEB6FA8]();
}

uint64_t tb_connection_send_query()
{
  return MEMORY[0x24BEB6FC0]();
}

uint64_t tb_message_complete()
{
  return MEMORY[0x24BEB6FD8]();
}

uint64_t tb_message_decode_u32()
{
  return MEMORY[0x24BEB7020]();
}

uint64_t tb_message_decode_u64()
{
  return MEMORY[0x24BEB7028]();
}

uint64_t tb_message_encode_BOOL()
{
  return MEMORY[0x24BEB7050]();
}

uint64_t tb_message_encode_f32()
{
  return MEMORY[0x24BEB7060]();
}

uint64_t tb_message_encode_f64()
{
  return MEMORY[0x24BEB7068]();
}

uint64_t tb_message_encode_s32()
{
  return MEMORY[0x24BEB7070]();
}

uint64_t tb_message_encode_u16()
{
  return MEMORY[0x24BEB7080]();
}

uint64_t tb_message_encode_u64()
{
  return MEMORY[0x24BEB7098]();
}

uint64_t tb_message_encode_u8()
{
  return MEMORY[0x24BEB70A8]();
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0338](uu, out);
}

