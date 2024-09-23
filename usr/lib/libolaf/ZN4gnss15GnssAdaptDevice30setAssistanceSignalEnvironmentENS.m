@implementation ZN4gnss15GnssAdaptDevice30setAssistanceSignalEnvironmentENS

_QWORD *___ZN4gnss15GnssAdaptDevice30setAssistanceSignalEnvironmentENS_21SignalEnvironmentTypeENSt3__18functionIFvNS_6ResultEEEE_block_invoke(uint64_t a1)
{
  gnss::GnssAdaptDevice *v2;
  uint64_t v3;
  unsigned __int16 v4;
  uint64_t v5;
  unsigned __int16 v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int16 v16;
  _QWORD *result;
  uint64_t v18;
  uint64_t v19;
  unsigned __int16 v20;
  uint64_t v21;
  unsigned __int16 v22;
  unsigned int v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int16 v27;
  uint64_t v28;
  unsigned __int16 v29;
  uint64_t v30;
  unsigned __int16 v31;
  _BYTE v32[24];
  _BYTE *v33;
  _BYTE v34[24];
  _BYTE *v35;
  _BYTE v36[24];
  _BYTE *v37;
  _BYTE v38[24];
  _BYTE *v39;
  char __str[1040];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v2 = *(gnss::GnssAdaptDevice **)(a1 + 32);
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v3 = mach_continuous_time();
    v4 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 68, "setAssistanceSignalEnvironment_block_invoke");
    LbsOsaTrace_WriteLog(0x18u, __str, v4, 5, 1);
  }
  if (!*((_BYTE *)v2 + 88))
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v38, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 7, (uint64_t)v38, (uint64_t)"setAssistanceSignalEnvironment_block_invoke");
    v13 = v39;
    if (v39 == v38)
    {
      v14 = 4;
      v13 = v38;
    }
    else
    {
      if (!v39)
      {
LABEL_20:
        if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
        {
          bzero(__str, 0x410uLL);
          v19 = mach_continuous_time();
          v20 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v19), "ADP", 69, "setAssistanceSignalEnvironment_block_invoke", 1302);
          LbsOsaTrace_WriteLog(0x18u, __str, v20, 0, 1);
        }
        result = (_QWORD *)LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0);
        if ((_DWORD)result)
        {
          bzero(__str, 0x410uLL);
          v21 = mach_continuous_time();
          v22 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v21), "ADP", 68, "setAssistanceSignalEnvironment_block_invoke");
          return (_QWORD *)LbsOsaTrace_WriteLog(0x18u, __str, v22, 5, 1);
        }
        return result;
      }
      v14 = 5;
    }
    (*(void (**)(void))(*v13 + 8 * v14))();
    goto LABEL_20;
  }
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 3, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v5 = mach_continuous_time();
    v6 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: SigEnv,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "ADP", 77, "setAssistanceSignalEnvironment_block_invoke", *(_DWORD *)(a1 + 72));
    LbsOsaTrace_WriteLog(0x18u, __str, v6, 3, 1);
  }
  v7 = *(int *)(a1 + 72);
  if (v7 < 7)
  {
    v8 = dword_21E833D9C[v7];
    v9 = ++gnss::GnssAdaptDevice::Ga07_00GenerateUID(void)::v_Key;
    v10 = a1 + 40;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v34, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_13AddRespHndlToGnsLUT((uint64_t)v2, v9, (uint64_t)v34);
    v11 = v35;
    if (v35 == v34)
    {
      v12 = 4;
      v11 = v34;
    }
    else
    {
      if (!v35)
        goto LABEL_26;
      v12 = 5;
    }
    (*(void (**)(void))(*v11 + 8 * v12))();
LABEL_26:
    v23 = GNS_EaSigEnvSev(v9, v8);
    if (v23 == 1)
    {
LABEL_36:
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
      {
        bzero(__str, 0x410uLL);
        v28 = mach_continuous_time();
        v29 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: SESInd,%d\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v28), "ADP", 68, "setAssistanceSignalEnvironment_block_invoke", v8);
        LbsOsaTrace_WriteLog(0x18u, __str, v29, 5, 1);
      }
      result = (_QWORD *)LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0);
      if ((_DWORD)result)
      {
        bzero(__str, 0x410uLL);
        v30 = mach_continuous_time();
        v31 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v30), "ADP", 68, "setAssistanceSignalEnvironment_block_invoke");
        return (_QWORD *)LbsOsaTrace_WriteLog(0x18u, __str, v31, 5, 1);
      }
      return result;
    }
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v32, v10);
    gnss::GnssAdaptDevice::Ga07_15AdaptGnsEarlyResponse((uint64_t)v2, v23, (uint64_t)v32, "setAssistanceSignalEnvironment_block_invoke");
    v24 = v33;
    if (v33 == v32)
    {
      v25 = 4;
      v24 = v32;
    }
    else
    {
      if (!v33)
        goto LABEL_34;
      v25 = 5;
    }
    (*(void (**)(void))(*v24 + 8 * v25))();
LABEL_34:
    gnss::GnssAdaptDevice::Ga07_14RemoveRespHndlFromGnsLut(v2, v9);
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v26 = mach_continuous_time();
      v27 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx SigEnvSev,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v26), "ADP", 69, "setAssistanceSignalEnvironment_block_invoke", 257, v23);
      LbsOsaTrace_WriteLog(0x18u, __str, v27, 0, 1);
    }
    goto LABEL_36;
  }
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v15 = mach_continuous_time();
    v16 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx SigEnv,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v15), "ADP", 69, "setAssistanceSignalEnvironment_block_invoke", 515, *(_DWORD *)(a1 + 72));
    LbsOsaTrace_WriteLog(0x18u, __str, v16, 0, 1);
  }
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v36, a1 + 40);
  gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v36, (uint64_t)"setAssistanceSignalEnvironment_block_invoke");
  result = v37;
  if (v37 == v36)
  {
    v18 = 4;
    result = v36;
  }
  else
  {
    if (!v37)
      return result;
    v18 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v18))();
}

@end
