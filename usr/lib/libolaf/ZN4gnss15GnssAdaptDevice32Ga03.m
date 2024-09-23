@implementation ZN4gnss15GnssAdaptDevice32Ga03

_QWORD *___ZN4gnss15GnssAdaptDevice32Ga03_01HandleGnsEaStatusResponseE15e_gnsEA_MsgTypejP17s_gnsEA_ApiStatus_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  BOOL v9;
  uint64_t *v10;
  uint64_t v11;
  unsigned __int16 v12;
  _QWORD *result;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  BOOL v17;
  uint64_t *v18;
  int v19;
  uint64_t v20;
  unsigned __int16 v21;
  uint64_t v22;
  unsigned __int16 v23;
  uint64_t v24;
  unsigned __int16 v25;
  uint64_t v26;
  unsigned __int16 v27;
  NSObject *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD block[4];
  _BYTE v33[24];
  _BYTE *v34;
  int v35;
  char __str[1040];
  _QWORD v37[3];
  _QWORD *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v38 = 0;
  v2 = *(_QWORD *)(v1 + 264);
  if (!v2)
    goto LABEL_54;
  v4 = v1 + 264;
  v5 = *(_DWORD *)(a1 + 40);
  v6 = v1 + 264;
  v7 = *(_QWORD *)(v1 + 264);
  do
  {
    v8 = *(_DWORD *)(v7 + 32);
    v9 = v8 >= v5;
    if (v8 >= v5)
      v10 = (uint64_t *)v7;
    else
      v10 = (uint64_t *)(v7 + 8);
    if (v9)
      v6 = v7;
    v7 = *v10;
  }
  while (*v10);
  if (v6 == v4 || v5 < *(_DWORD *)(v6 + 32))
  {
LABEL_54:
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 2, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v11 = mach_continuous_time();
      v12 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx GnsStatusRespLut Hdl\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "ADP", 87, "Ga03_01HandleGnsEaStatusResponse_block_invoke", 770);
      LbsOsaTrace_WriteLog(0x18u, __str, v12, 2, 1);
    }
    goto LABEL_14;
  }
  v15 = v1 + 264;
  do
  {
    v16 = *(_DWORD *)(v2 + 32);
    v17 = v16 >= v5;
    if (v16 >= v5)
      v18 = (uint64_t *)v2;
    else
      v18 = (uint64_t *)(v2 + 8);
    if (v17)
      v15 = v2;
    v2 = *v18;
  }
  while (*v18);
  if (v15 == v4 || v5 < *(_DWORD *)(v15 + 32))
    v15 = v1 + 264;
  std::function<void ()(gnss::Result)>::operator=(v37, v15 + 40);
  std::__tree<std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>>>::erase((uint64_t **)(v1 + 256), (uint64_t *)v6);
  if (!v38)
  {
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 2, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v22 = mach_continuous_time();
      v23 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx API type,%u ID,%d\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v22), "ADP", 87, "Ga03_01HandleGnsEaStatusResponse_block_invoke", 770, *(unsigned __int8 *)(a1 + 44), *(_DWORD *)(a1 + 40));
      LbsOsaTrace_WriteLog(0x18u, __str, v23, 2, 1);
    }
    goto LABEL_14;
  }
  v19 = gnss::GnssAdaptDevice::Ga07_16MapGnsRespToGnssResult(v1, *(_DWORD *)(a1 + 48));
  if (*(_DWORD *)(a1 + 44) == 1)
  {
    if (*(_DWORD *)(a1 + 48) == 1)
    {
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
      {
        bzero(__str, 0x410uLL);
        v20 = mach_continuous_time();
        v21 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: ExtPosAssist Accepted\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v20), "ADP", 73, "Ga03_01HandleGnsEaStatusResponse_block_invoke");
        LbsOsaTrace_WriteLog(0x18u, __str, v21, 4, 1);
      }
    }
    else if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v24 = mach_continuous_time();
      v25 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: ExtPosAssist Rejected\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v24), "ADP", 73, "Ga03_01HandleGnsEaStatusResponse_block_invoke");
      LbsOsaTrace_WriteLog(0x18u, __str, v25, 4, 1);
    }
  }
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v26 = mach_continuous_time();
    v27 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Ea Type,%u,ID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v26), "ADP", 73, "Ga03_01HandleGnsEaStatusResponse_block_invoke", *(_DWORD *)(a1 + 44), *(_DWORD *)(a1 + 40));
    LbsOsaTrace_WriteLog(0x18u, __str, v27, 4, 1);
  }
  v28 = *(NSObject **)(v1 + 296);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZN4gnss15GnssAdaptDevice32Ga03_01HandleGnsEaStatusResponseE15e_gnsEA_MsgTypejP17s_gnsEA_ApiStatus_block_invoke_2;
  block[3] = &__block_descriptor_tmp_79;
  v29 = v33;
  v30 = (uint64_t)v38;
  if (v38)
  {
    if (v38 == v37)
    {
      v34 = v33;
      (*(void (**)(_QWORD *, _BYTE *))(v37[0] + 24))(v37, v33);
      goto LABEL_47;
    }
    v30 = (*(uint64_t (**)(void))(*v38 + 16))();
  }
  v34 = (_BYTE *)v30;
LABEL_47:
  v35 = v19;
  dispatch_async(v28, block);
  if (v34 == v33)
  {
    v31 = 4;
  }
  else
  {
    if (!v34)
      goto LABEL_14;
    v31 = 5;
    v29 = v34;
  }
  (*(void (**)(_QWORD *))(*v29 + 8 * v31))(v29);
LABEL_14:
  result = v38;
  if (v38 == v37)
  {
    v14 = 4;
    result = v37;
  }
  else
  {
    if (!v38)
      return result;
    v14 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v14))();
}

@end
