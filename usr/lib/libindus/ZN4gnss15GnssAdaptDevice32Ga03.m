@implementation ZN4gnss15GnssAdaptDevice32Ga03

uint64_t *___ZN4gnss15GnssAdaptDevice32Ga03_01HandleGnsEaStatusResponseE15e_gnsEA_MsgTypejP17s_gnsEA_ApiStatus_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  BOOL v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *result;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  BOOL v16;
  uint64_t *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD block[4];
  _BYTE v28[24];
  _BYTE *v29;
  int v30;
  char __str[966];
  _QWORD v32[3];
  uint64_t *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v33 = 0;
  v2 = v1 + 128;
  v3 = *(_QWORD *)(v1 + 128);
  if (!v3)
    goto LABEL_12;
  v5 = *(_DWORD *)(a1 + 40);
  v6 = v1 + 128;
  v7 = *(_QWORD *)(v1 + 128);
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
  if (v6 == v2 || v5 < *(_DWORD *)(v6 + 32))
  {
LABEL_12:
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v11 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx GnsStatusRespLut Hdl\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "ADP", 87, "Ga03_01HandleGnsEaStatusResponse_block_invoke", 770);
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    goto LABEL_14;
  }
  v14 = v1 + 128;
  do
  {
    v15 = *(_DWORD *)(v3 + 32);
    v16 = v15 >= v5;
    if (v15 >= v5)
      v17 = (uint64_t *)v3;
    else
      v17 = (uint64_t *)(v3 + 8);
    if (v16)
      v14 = v3;
    v3 = *v17;
  }
  while (*v17);
  if (v14 == v2 || v5 < *(_DWORD *)(v14 + 32))
    v14 = v1 + 128;
  std::function<void ()(gnss::Result)>::operator=(v32, v14 + 40);
  result = std::__tree<std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>>>::erase((uint64_t **)(v1 + 120), (uint64_t *)v6);
  if (!v33)
  {
    if (g_LbsOsaTrace_Config < 2)
      return result;
    bzero(__str, 0x3C6uLL);
    v20 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx API type,%u ID,%d\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v20), "ADP", 87, "Ga03_01HandleGnsEaStatusResponse_block_invoke", 770, *(unsigned __int8 *)(a1 + 44), *(_DWORD *)(a1 + 40));
    gnssOsa_PrintLog(__str, 2, 1, 0);
    goto LABEL_14;
  }
  v18 = gnss::GnssAdaptDevice::Ga07_16MapGnsRespToGnssResult(v1, *(_DWORD *)(a1 + 48));
  if (*(_DWORD *)(a1 + 44) == 1)
  {
    if (*(_DWORD *)(a1 + 48) == 1)
    {
      if (g_LbsOsaTrace_Config < 4)
        goto LABEL_42;
      bzero(__str, 0x3C6uLL);
      v19 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: ExtPosAssist Accepted\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v19), "ADP", 73, "Ga03_01HandleGnsEaStatusResponse_block_invoke");
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    else
    {
      if (g_LbsOsaTrace_Config < 4)
        goto LABEL_42;
      bzero(__str, 0x3C6uLL);
      v21 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: ExtPosAssist Rejected\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v21), "ADP", 73, "Ga03_01HandleGnsEaStatusResponse_block_invoke");
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
  }
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v22 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Ea Type,%u,ID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v22), "ADP", 73, "Ga03_01HandleGnsEaStatusResponse_block_invoke", *(_DWORD *)(a1 + 44), *(_DWORD *)(a1 + 40));
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
LABEL_42:
  v23 = *(NSObject **)(v1 + 160);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZN4gnss15GnssAdaptDevice32Ga03_01HandleGnsEaStatusResponseE15e_gnsEA_MsgTypejP17s_gnsEA_ApiStatus_block_invoke_2;
  block[3] = &__block_descriptor_tmp_79;
  v24 = v28;
  v25 = (uint64_t)v33;
  if (v33)
  {
    if (v33 == v32)
    {
      v29 = v28;
      (*(void (**)(_QWORD *, _BYTE *))(v32[0] + 24))(v32, v28);
      goto LABEL_47;
    }
    v25 = (*(uint64_t (**)(void))(*v33 + 16))();
  }
  v29 = (_BYTE *)v25;
LABEL_47:
  v30 = v18;
  dispatch_async(v23, block);
  if (v29 == v28)
  {
    v26 = 4;
    goto LABEL_51;
  }
  if (v29)
  {
    v26 = 5;
    v24 = v29;
LABEL_51:
    (*(void (**)(_QWORD *))(*v24 + 8 * v26))(v24);
  }
LABEL_14:
  result = v33;
  if (v33 == v32)
  {
    v13 = 4;
    result = v32;
  }
  else
  {
    if (!v33)
      return result;
    v13 = 5;
  }
  return (uint64_t *)(*(uint64_t (**)(void))(*result + 8 * v13))();
}

@end
