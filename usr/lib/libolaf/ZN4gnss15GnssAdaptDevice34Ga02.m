@implementation ZN4gnss15GnssAdaptDevice34Ga02

_QWORD *___ZN4gnss15GnssAdaptDevice34Ga02_01HandleGnsSensStatusResponseE12e_gnsSen_MsgjP18s_gnsSen_ApiStatus_block_invoke(uint64_t a1)
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
  NSObject *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int16 v26;
  uint64_t v27;
  _QWORD block[4];
  _BYTE v29[24];
  _BYTE *v30;
  int v31;
  char __str[1040];
  _QWORD v33[3];
  _QWORD *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v34 = 0;
  v2 = *(_QWORD *)(v1 + 264);
  if (!v2)
    goto LABEL_48;
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
LABEL_48:
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 2, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v11 = mach_continuous_time();
      v12 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx GnsStatusRespLut Handle\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "ADP", 87, "Ga02_01HandleGnsSensStatusResponse_block_invoke", 770);
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
  std::function<void ()(gnss::Result)>::operator=(v33, v15 + 40);
  std::__tree<std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>>>::erase((uint64_t **)(v1 + 256), (uint64_t *)v6);
  if (!v34)
  {
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 2, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v25 = mach_continuous_time();
      v26 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx RespCb,API type,%d\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v25), "ADP", 87, "Ga02_01HandleGnsSensStatusResponse_block_invoke", 770, *(_DWORD *)(a1 + 40));
      LbsOsaTrace_WriteLog(0x18u, __str, v26, 2, 1);
    }
    goto LABEL_14;
  }
  v19 = gnss::GnssAdaptDevice::Ga07_16MapGnsRespToGnssResult(v1, *(_DWORD *)(a1 + 48));
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v20 = mach_continuous_time();
    v21 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Type,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v20), "ADP", 73, "Ga02_01HandleGnsSensStatusResponse_block_invoke", *(_DWORD *)(a1 + 40));
    LbsOsaTrace_WriteLog(0x18u, __str, v21, 4, 1);
  }
  v22 = *(NSObject **)(v1 + 296);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZN4gnss15GnssAdaptDevice34Ga02_01HandleGnsSensStatusResponseE12e_gnsSen_MsgjP18s_gnsSen_ApiStatus_block_invoke_2;
  block[3] = &__block_descriptor_tmp_23_3;
  v23 = v29;
  v24 = (uint64_t)v34;
  if (v34)
  {
    if (v34 == v33)
    {
      v30 = v29;
      (*(void (**)(_QWORD *, _BYTE *))(v33[0] + 24))(v33, v29);
      goto LABEL_41;
    }
    v24 = (*(uint64_t (**)(void))(*v34 + 16))();
  }
  v30 = (_BYTE *)v24;
LABEL_41:
  v31 = v19;
  dispatch_async(v22, block);
  if (v30 == v29)
  {
    v27 = 4;
  }
  else
  {
    if (!v30)
      goto LABEL_14;
    v27 = 5;
    v23 = v30;
  }
  (*(void (**)(_QWORD *))(*v23 + 8 * v27))(v23);
LABEL_14:
  result = v34;
  if (v34 == v33)
  {
    v14 = 4;
    result = v33;
  }
  else
  {
    if (!v34)
      return result;
    v14 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v14))();
}

@end
