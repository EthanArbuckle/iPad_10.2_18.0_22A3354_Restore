@implementation ZN4gnss15GnssAdaptDevice32Ga11

_QWORD *___ZN4gnss15GnssAdaptDevice32Ga11_05HandleGnsCellInfoCallbackE15e_gnsCI_MsgTypeP15u_gnsCI_MsgData_block_invoke_65(_QWORD *result)
{
  _QWORD *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int16 v5;
  int v6;
  uint64_t v7;
  unsigned __int16 v8;
  uint64_t v9;
  unsigned __int16 v10;
  NSObject *v11;
  _QWORD *v12;
  uint64_t v13;
  unsigned __int16 v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD block[4];
  _BYTE v18[24];
  _BYTE *v19;
  int v20;
  _QWORD v21[3];
  _QWORD *v22;
  char __str[1040];
  uint64_t v24;

  v1 = result;
  v24 = *MEMORY[0x24BDAC8D0];
  v2 = *((_DWORD *)result + 10);
  if (v2 == 1)
  {
    if (*((_DWORD *)result + 11) != 1)
    {
      result = (_QWORD *)LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0);
      if ((_DWORD)result)
      {
        bzero(__str, 0x410uLL);
        v7 = mach_continuous_time();
        v8 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx IMSI is not accepted by stack,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "ADP", 69, "Ga11_05HandleGnsCellInfoCallback_block_invoke", 257, *((_DWORD *)v1 + 11));
        return (_QWORD *)LbsOsaTrace_WriteLog(0x18u, __str, v8, 0, 1);
      }
    }
    return result;
  }
  v3 = result[4];
  if (v2)
  {
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v9 = mach_continuous_time();
      v10 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx GNS SUPL API,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v9), "ADP", 69, "Ga11_05HandleGnsCellInfoCallback_block_invoke", 770, *((_DWORD *)v1 + 10));
      LbsOsaTrace_WriteLog(0x18u, __str, v10, 0, 1);
    }
    v6 = 7;
  }
  else
  {
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v4 = mach_continuous_time();
      v5 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: LocId status,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "ADP", 73, "Ga11_05HandleGnsCellInfoCallback_block_invoke", *((_DWORD *)v1 + 11));
      LbsOsaTrace_WriteLog(0x18u, __str, v5, 4, 1);
    }
    v6 = gnss::GnssAdaptDevice::Ga07_16MapGnsRespToGnssResult(v3, *((_DWORD *)v1 + 11));
  }
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v21, v3 + 504);
  if (!v22)
  {
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v13 = mach_continuous_time();
      v14 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx LocID RspCb\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v13), "ADP", 69, "Ga11_05HandleGnsCellInfoCallback_block_invoke", 770);
      LbsOsaTrace_WriteLog(0x18u, __str, v14, 0, 1);
    }
    goto LABEL_23;
  }
  v11 = *(NSObject **)(v3 + 296);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZN4gnss15GnssAdaptDevice32Ga11_05HandleGnsCellInfoCallbackE15e_gnsCI_MsgTypeP15u_gnsCI_MsgData_block_invoke_2;
  block[3] = &__block_descriptor_tmp_69;
  v12 = v18;
  if (v22 == v21)
  {
    v19 = v18;
    (*(void (**)(_QWORD *, _BYTE *))(v21[0] + 24))(v21, v18);
  }
  else
  {
    v19 = (_BYTE *)(*(uint64_t (**)(void))(*v22 + 16))();
  }
  v20 = v6;
  dispatch_async(v11, block);
  if (v19 == v18)
  {
    v15 = 4;
    goto LABEL_22;
  }
  if (v19)
  {
    v15 = 5;
    v12 = v19;
LABEL_22:
    (*(void (**)(_QWORD *))(*v12 + 8 * v15))(v12);
  }
LABEL_23:
  result = v22;
  if (v22 == v21)
  {
    v16 = 4;
    result = v21;
  }
  else
  {
    if (!v22)
      return result;
    v16 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v16))();
}

@end
