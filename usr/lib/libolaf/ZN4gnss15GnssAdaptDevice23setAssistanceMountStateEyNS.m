@implementation ZN4gnss15GnssAdaptDevice23setAssistanceMountStateEyNS

_QWORD *___ZN4gnss15GnssAdaptDevice23setAssistanceMountStateEyNS_16DeviceMountStateENSt3__18functionIFvNS_6ResultEEEE_block_invoke(uint64_t a1)
{
  gnss::GnssAdaptDevice *v2;
  uint64_t v3;
  unsigned __int16 v4;
  uint64_t v5;
  unsigned __int16 v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int16 v17;
  _QWORD *result;
  uint64_t v19;
  uint64_t v20;
  unsigned __int16 v21;
  uint64_t v22;
  unsigned __int16 v23;
  unsigned int v24;
  uint64_t v25;
  unsigned __int16 v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int16 v30;
  uint64_t v31;
  unsigned __int16 v32;
  uint64_t v33;
  int v34;
  _BYTE v35[24];
  _BYTE *v36;
  _BYTE v37[24];
  _BYTE *v38;
  _BYTE v39[24];
  _BYTE *v40;
  _BYTE v41[24];
  _BYTE *v42;
  char __str[1040];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v2 = *(gnss::GnssAdaptDevice **)(a1 + 32);
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v3 = mach_continuous_time();
    v4 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 68, "setAssistanceMountState_block_invoke");
    LbsOsaTrace_WriteLog(0x18u, __str, v4, 5, 1);
  }
  if (!*((_BYTE *)v2 + 88))
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v41, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 7, (uint64_t)v41, (uint64_t)"setAssistanceMountState_block_invoke");
    v14 = v42;
    if (v42 == v41)
    {
      v15 = 4;
      v14 = v41;
    }
    else
    {
      if (!v42)
      {
LABEL_20:
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
        {
          bzero(__str, 0x410uLL);
          v20 = mach_continuous_time();
          v21 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v20), "ADP", 69, "setAssistanceMountState_block_invoke", 1302);
          LbsOsaTrace_WriteLog(0x18u, __str, v21, 0, 1);
        }
        result = (_QWORD *)LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0);
        if ((_DWORD)result)
        {
          bzero(__str, 0x410uLL);
          v22 = mach_continuous_time();
          v23 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v22), "ADP", 68, "setAssistanceMountState_block_invoke");
          return (_QWORD *)LbsOsaTrace_WriteLog(0x18u, __str, v23, 5, 1);
        }
        return result;
      }
      v15 = 5;
    }
    (*(void (**)(void))(*v14 + 8 * v15))();
    goto LABEL_20;
  }
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 3, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v5 = mach_continuous_time();
    v6 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: MachContTimeNs,%llu,MtState,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "ADP", 77, "setAssistanceMountState_block_invoke", *(_QWORD *)(a1 + 72), *(_DWORD *)(a1 + 80));
    LbsOsaTrace_WriteLog(0x18u, __str, v6, 3, 1);
  }
  LODWORD(v33) = (*(_QWORD *)(a1 + 72) + 500000) / 0xF4240uLL;
  v7 = *(int *)(a1 + 80);
  if (v7 >= 3)
  {
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v16 = mach_continuous_time();
      v17 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx MountState,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v16), "ADP", 69, "setAssistanceMountState_block_invoke", 515, *(_DWORD *)(a1 + 80));
      LbsOsaTrace_WriteLog(0x18u, __str, v17, 0, 1);
    }
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v39, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v39, (uint64_t)"setAssistanceMountState_block_invoke");
    result = v40;
    if (v40 == v39)
    {
      v19 = 4;
      result = v39;
    }
    else
    {
      if (!v40)
        return result;
      v19 = 5;
    }
    return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v19))();
  }
  v8 = dword_21E833D84[v7];
  v9 = dword_21E833D90[v7];
  HIDWORD(v33) = v8;
  v34 = v9;
  v10 = ++gnss::GnssAdaptDevice::Ga07_00GenerateUID(void)::v_Key;
  v11 = a1 + 40;
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v37, v11);
  gnss::GnssAdaptDevice::Ga07_13AddRespHndlToGnsLUT((uint64_t)v2, v10, (uint64_t)v37);
  v12 = v38;
  if (v38 == v37)
  {
    v13 = 4;
    v12 = v37;
  }
  else
  {
    if (!v38)
      goto LABEL_26;
    v13 = 5;
  }
  (*(void (**)(void))(*v12 + 8 * v13))();
LABEL_26:
  v24 = GNS_EaFixedInVehicle(v10, &v33);
  if (v24 != 1)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v35, v11);
    gnss::GnssAdaptDevice::Ga07_15AdaptGnsEarlyResponse((uint64_t)v2, v24, (uint64_t)v35, "setAssistanceMountState_block_invoke");
    v27 = v36;
    if (v36 == v35)
    {
      v28 = 4;
      v27 = v35;
    }
    else
    {
      if (!v36)
        goto LABEL_38;
      v28 = 5;
    }
    (*(void (**)(void))(*v27 + 8 * v28))();
LABEL_38:
    gnss::GnssAdaptDevice::Ga07_14RemoveRespHndlFromGnsLut(v2, v10);
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v29 = mach_continuous_time();
      v30 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx FixedInVeh,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v29), "ADP", 69, "setAssistanceMountState_block_invoke", 257, v24);
      LbsOsaTrace_WriteLog(0x18u, __str, v30, 0, 1);
    }
    result = (_QWORD *)LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0);
    if ((_DWORD)result)
      goto LABEL_41;
    return result;
  }
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v25 = mach_continuous_time();
    v26 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: OsTimeMs,%u,FivInd,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v25), "ADP", 68, "setAssistanceMountState_block_invoke", v33, HIDWORD(v33));
    LbsOsaTrace_WriteLog(0x18u, __str, v26, 5, 1);
  }
  result = (_QWORD *)LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0);
  if ((_DWORD)result)
  {
LABEL_41:
    bzero(__str, 0x410uLL);
    v31 = mach_continuous_time();
    v32 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v31), "ADP", 68, "setAssistanceMountState_block_invoke");
    return (_QWORD *)LbsOsaTrace_WriteLog(0x18u, __str, v32, 5, 1);
  }
  return result;
}

@end
