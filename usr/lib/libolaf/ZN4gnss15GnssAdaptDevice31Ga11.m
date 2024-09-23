@implementation ZN4gnss15GnssAdaptDevice31Ga11

_QWORD *___ZN4gnss15GnssAdaptDevice31Ga11_06HandleDataClientCallbackE15e_gnsDC_MsgTypeP15u_gnsDC_MsgData_block_invoke_91(uint64_t a1)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v4;
  unsigned __int16 v5;
  int v6;
  int v7;
  uint64_t v8;
  unsigned __int16 v9;
  int v10;
  NSObject *v11;
  _QWORD *v12;
  uint64_t v13;
  unsigned __int16 v14;
  uint64_t v15;
  unsigned __int16 v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD block[4];
  _BYTE v20[24];
  _BYTE *v21;
  int v22;
  _QWORD v23[3];
  _QWORD *v24;
  char __str[1040];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  result = (_QWORD *)LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0);
  if ((_DWORD)result)
  {
    bzero(__str, 0x410uLL);
    v4 = mach_continuous_time();
    v5 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: DCApiStatus Api,%u,id,%u,Stat,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "ADP", 73, "Ga11_06HandleDataClientCallback_block_invoke", *(_DWORD *)(a1 + 44), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 48));
    result = (_QWORD *)LbsOsaTrace_WriteLog(0x18u, __str, v5, 4, 1);
  }
  v6 = *(_DWORD *)(a1 + 44);
  if ((v6 - 1) < 2)
  {
    if (*(_DWORD *)(a1 + 48) != 1)
    {
      result = (_QWORD *)GNS_SuplAbortSession(*(_DWORD *)(v2 + 1016));
      v7 = (int)result;
      if ((_DWORD)result != 1)
      {
        result = (_QWORD *)LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0);
        if ((_DWORD)result)
        {
          bzero(__str, 0x410uLL);
          v8 = mach_continuous_time();
          v9 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx SuplAbortSession,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v8), "ADP", 69, "Ga11_06HandleDataClientCallback_block_invoke", 770, v7);
          result = (_QWORD *)LbsOsaTrace_WriteLog(0x18u, __str, v9, 0, 1);
        }
      }
      *(_DWORD *)(v2 + 1016) = 0;
    }
    return result;
  }
  if (v6)
  {
    result = (_QWORD *)LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0);
    if ((_DWORD)result)
    {
      bzero(__str, 0x410uLL);
      v13 = mach_continuous_time();
      v14 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx GNS DC API\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v13), "ADP", 69, "Ga11_06HandleDataClientCallback_block_invoke", 770);
      return (_QWORD *)LbsOsaTrace_WriteLog(0x18u, __str, v14, 0, 1);
    }
    return result;
  }
  v10 = gnss::GnssAdaptDevice::Ga07_16MapGnsRespToGnssResult(v2, *(_DWORD *)(a1 + 48));
  if (v10 == 1)
    *(_DWORD *)(v2 + 1016) = *(_DWORD *)(a1 + 40);
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v23, v2 + 536);
  if (!v24)
  {
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v15 = mach_continuous_time();
      v16 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx SUPL INIT Rsp Cb\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v15), "ADP", 69, "Ga11_06HandleDataClientCallback_block_invoke", 770);
      LbsOsaTrace_WriteLog(0x18u, __str, v16, 0, 1);
    }
    goto LABEL_25;
  }
  v11 = *(NSObject **)(v2 + 296);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZN4gnss15GnssAdaptDevice31Ga11_06HandleDataClientCallbackE15e_gnsDC_MsgTypeP15u_gnsDC_MsgData_block_invoke_2;
  block[3] = &__block_descriptor_tmp_93;
  v12 = v20;
  if (v24 == v23)
  {
    v21 = v20;
    (*(void (**)(_QWORD *, _BYTE *))(v23[0] + 24))(v23, v20);
  }
  else
  {
    v21 = (_BYTE *)(*(uint64_t (**)(void))(*v24 + 16))();
  }
  v22 = v10;
  dispatch_async(v11, block);
  if (v21 == v20)
  {
    v17 = 4;
    goto LABEL_24;
  }
  if (v21)
  {
    v17 = 5;
    v12 = v21;
LABEL_24:
    (*(void (**)(_QWORD *))(*v12 + 8 * v17))(v12);
  }
LABEL_25:
  result = v24;
  if (v24 == v23)
  {
    v18 = 4;
    result = v23;
  }
  else
  {
    if (!v24)
      return result;
    v18 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v18))();
}

@end
