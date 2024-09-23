@implementation ZN4gnss15GnssAdaptDevice34setAssistanceMotionActivityContextEyNS

_BYTE *___ZN4gnss15GnssAdaptDevice34setAssistanceMotionActivityContextEyNS_21MotionActivityContextENS_11MovingStateENS_11ReliabilityENSt3__18functionIFvNS_6ResultEEEE_block_invoke(uint64_t a1)
{
  gnss::GnssAdaptDevice *v2;
  uint64_t v3;
  unsigned __int16 v4;
  uint64_t v5;
  unsigned __int16 v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int16 v12;
  _BYTE *result;
  uint64_t v14;
  uint64_t v15;
  unsigned __int16 v16;
  uint64_t v17;
  unsigned __int16 v18;
  uint64_t v19;
  unsigned __int16 v20;
  unsigned int v21;
  uint64_t v22;
  unsigned __int16 v23;
  unsigned int v24;
  int v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int16 v30;
  _QWORD *v31;
  uint64_t v32;
  unsigned int v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  unsigned __int16 v37;
  uint64_t v38;
  unsigned __int16 v39;
  uint64_t v40;
  unsigned __int16 v41;
  uint64_t v42;
  unsigned __int16 v43;
  uint64_t v44;
  int v45;
  unsigned int v46;
  uint64_t v47;
  _BYTE v48[24];
  _BYTE *v49;
  _BYTE v50[24];
  _BYTE *v51;
  _BYTE v52[24];
  _BYTE *v53;
  _BYTE v54[24];
  _BYTE *v55;
  _BYTE v56[24];
  _BYTE *v57;
  _BYTE v58[24];
  _BYTE *v59;
  _BYTE v60[24];
  _BYTE *v61;
  char __str[1040];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v2 = *(gnss::GnssAdaptDevice **)(a1 + 32);
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v3 = mach_continuous_time();
    v4 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 68, "setAssistanceMotionActivityContext_block_invoke");
    LbsOsaTrace_WriteLog(0x18u, __str, v4, 5, 1);
  }
  if (*((_BYTE *)v2 + 88))
  {
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 3, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v5 = mach_continuous_time();
      v6 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: MachContTimeNs,%llu,Ctxt,%u,MovState,%u,Rel,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "ADP", 77, "setAssistanceMotionActivityContext_block_invoke", *(_QWORD *)(a1 + 72), *(_DWORD *)(a1 + 80), *(_DWORD *)(a1 + 84), *(_DWORD *)(a1 + 88));
      LbsOsaTrace_WriteLog(0x18u, __str, v6, 3, 1);
    }
    v47 = 0;
    v46 = (*(_QWORD *)(a1 + 72) + 500000) / 0xF4240uLL;
    v44 = v46;
    v7 = *(int *)(a1 + 80);
    if (v7 >= 9)
    {
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
      {
        bzero(__str, 0x410uLL);
        v11 = mach_continuous_time();
        v12 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx Context,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "ADP", 69, "setAssistanceMotionActivityContext_block_invoke", 515, *(_DWORD *)(a1 + 80));
        LbsOsaTrace_WriteLog(0x18u, __str, v12, 0, 1);
      }
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v58, a1 + 40);
      gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v58, (uint64_t)"setAssistanceMotionActivityContext_block_invoke");
      result = v59;
      if (v59 == v58)
      {
        v14 = 4;
        result = v58;
        return (_BYTE *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v14))();
      }
    }
    else
    {
      LODWORD(v47) = dword_21E833D60[v7];
      v8 = *(_DWORD *)(a1 + 88);
      if (v8 <= 24)
      {
        if (!v8)
          goto LABEL_33;
        if (v8 == 10)
        {
LABEL_11:
          v8 = 1;
LABEL_33:
          HIDWORD(v47) = v8;
          v45 = v8;
          v21 = *(_DWORD *)(a1 + 84);
          if (v21 < 4)
          {
            HIDWORD(v44) = *(_DWORD *)(a1 + 84);
            if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
            {
              bzero(__str, 0x410uLL);
              v22 = mach_continuous_time();
              v23 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: ActCtx,%u,MovState,%u,Rel,%u,TimeMs,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v22), "ADP", 68, "setAssistanceMotionActivityContext_block_invoke", v47, v21, HIDWORD(v47), v46);
              LbsOsaTrace_WriteLog(0x18u, __str, v23, 5, 1);
            }
            v24 = GNS_EaUsrActCtxt(++gnss::GnssAdaptDevice::Ga07_00GenerateUID(void)::v_Key, (uint64_t *)&v46);
            if (v24 == 1)
            {
              v25 = ++gnss::GnssAdaptDevice::Ga07_00GenerateUID(void)::v_Key;
              v26 = a1 + 40;
              std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v50, a1 + 40);
              gnss::GnssAdaptDevice::Ga07_13AddRespHndlToGnsLUT((uint64_t)v2, v25, (uint64_t)v50);
              v27 = v51;
              if (v51 == v50)
              {
                v28 = 4;
                v27 = v50;
              }
              else
              {
                if (!v51)
                  goto LABEL_53;
                v28 = 5;
              }
              (*(void (**)(void))(*v27 + 8 * v28))();
LABEL_53:
              v33 = GNS_EaDevMovState(v25, &v44);
              if (v33 == 1)
              {
LABEL_67:
                result = (_BYTE *)LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0);
                if ((_DWORD)result)
                {
                  bzero(__str, 0x410uLL);
                  v42 = mach_continuous_time();
                  v43 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v42), "ADP", 68, "setAssistanceMotionActivityContext_block_invoke");
                  return (_BYTE *)LbsOsaTrace_WriteLog(0x18u, __str, v43, 5, 1);
                }
                return result;
              }
              std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v48, v26);
              gnss::GnssAdaptDevice::Ga07_15AdaptGnsEarlyResponse((uint64_t)v2, v33, (uint64_t)v48, "setAssistanceMotionActivityContext_block_invoke");
              v34 = v49;
              if (v49 == v48)
              {
                v35 = 4;
                v34 = v48;
              }
              else
              {
                if (!v49)
                  goto LABEL_65;
                v35 = 5;
              }
              (*(void (**)(void))(*v34 + 8 * v35))();
LABEL_65:
              gnss::GnssAdaptDevice::Ga07_14RemoveRespHndlFromGnsLut(v2, v25);
              if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
              {
                bzero(__str, 0x410uLL);
                v40 = mach_continuous_time();
                v41 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx EaDevMovState,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v40), "ADP", 69, "setAssistanceMotionActivityContext_block_invoke", 257, v33);
                LbsOsaTrace_WriteLog(0x18u, __str, v41, 0, 1);
              }
              goto LABEL_67;
            }
            std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v52, a1 + 40);
            gnss::GnssAdaptDevice::Ga07_15AdaptGnsEarlyResponse((uint64_t)v2, v24, (uint64_t)v52, "setAssistanceMotionActivityContext_block_invoke");
            v31 = v53;
            if (v53 == v52)
            {
              v32 = 4;
              v31 = v52;
            }
            else
            {
              if (!v53)
              {
LABEL_59:
                if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
                {
                  bzero(__str, 0x410uLL);
                  v36 = mach_continuous_time();
                  v37 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx EaUsrActCtxt,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v36), "ADP", 69, "setAssistanceMotionActivityContext_block_invoke", 257, v24);
                  LbsOsaTrace_WriteLog(0x18u, __str, v37, 0, 1);
                }
                result = (_BYTE *)LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0);
                if ((_DWORD)result)
                {
                  bzero(__str, 0x410uLL);
                  v38 = mach_continuous_time();
                  v39 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v38), "ADP", 68, "setAssistanceMotionActivityContext_block_invoke");
                  return (_BYTE *)LbsOsaTrace_WriteLog(0x18u, __str, v39, 5, 1);
                }
                return result;
              }
              v32 = 5;
            }
            (*(void (**)(void))(*v31 + 8 * v32))();
            goto LABEL_59;
          }
          if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
          {
            bzero(__str, 0x410uLL);
            v29 = mach_continuous_time();
            v30 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx Moving State,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v29), "ADP", 69, "setAssistanceMotionActivityContext_block_invoke", 515, *(_DWORD *)(a1 + 84));
            LbsOsaTrace_WriteLog(0x18u, __str, v30, 0, 1);
          }
          std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v54, a1 + 40);
          gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v54, (uint64_t)"setAssistanceMotionActivityContext_block_invoke");
          result = v55;
          if (v55 != v54)
            goto LABEL_43;
          v14 = 4;
          result = v54;
          return (_BYTE *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v14))();
        }
      }
      else
      {
        switch(v8)
        {
          case 75:
            v8 = 3;
            goto LABEL_33;
          case 50:
            v8 = 2;
            goto LABEL_33;
          case 25:
            goto LABEL_11;
        }
      }
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
      {
        bzero(__str, 0x410uLL);
        v19 = mach_continuous_time();
        v20 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx Rel,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v19), "ADP", 69, "setAssistanceMotionActivityContext_block_invoke", 515, *(_DWORD *)(a1 + 88));
        LbsOsaTrace_WriteLog(0x18u, __str, v20, 0, 1);
      }
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v56, a1 + 40);
      gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v56, (uint64_t)"setAssistanceMotionActivityContext_block_invoke");
      result = v57;
      if (v57 == v56)
      {
        v14 = 4;
        result = v56;
        return (_BYTE *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v14))();
      }
    }
LABEL_43:
    if (!result)
      return result;
    v14 = 5;
    return (_BYTE *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v14))();
  }
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v60, a1 + 40);
  gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 7, (uint64_t)v60, (uint64_t)"setAssistanceMotionActivityContext_block_invoke");
  v9 = v61;
  if (v61 == v60)
  {
    v10 = 4;
    v9 = v60;
    goto LABEL_20;
  }
  if (v61)
  {
    v10 = 5;
LABEL_20:
    (*(void (**)(void))(*v9 + 8 * v10))();
  }
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v15 = mach_continuous_time();
    v16 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v15), "ADP", 69, "setAssistanceMotionActivityContext_block_invoke", 1302);
    LbsOsaTrace_WriteLog(0x18u, __str, v16, 0, 1);
  }
  result = (_BYTE *)LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0);
  if ((_DWORD)result)
  {
    bzero(__str, 0x410uLL);
    v17 = mach_continuous_time();
    v18 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v17), "ADP", 68, "setAssistanceMotionActivityContext_block_invoke");
    return (_BYTE *)LbsOsaTrace_WriteLog(0x18u, __str, v18, 5, 1);
  }
  return result;
}

@end
