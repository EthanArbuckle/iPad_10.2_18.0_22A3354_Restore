@implementation ZN4gnss15GnssAdaptDevice26Ga01

_QWORD *___ZN4gnss15GnssAdaptDevice26Ga01_03HandlePowerReportCBEdddd_block_invoke(uint64_t a1)
{
  _QWORD *result;
  _QWORD *v3;
  _DWORD *v4;
  __int128 v5;
  NSObject *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  _DWORD *v14;
  _QWORD block[5];
  _BYTE v16[24];
  _BYTE *v17;
  char v18[950];
  char __str[966];
  _QWORD v20[3];
  _QWORD *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  result = (_QWORD *)std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v20, *(_QWORD *)(a1 + 32) + 328);
  v3 = v21;
  if (v21)
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3002000000;
    v13[3] = __Block_byref_object_copy_;
    v13[4] = __Block_byref_object_dispose_;
    v4 = operator new(0x28uLL, MEMORY[0x24BEDB6B8]);
    if (!v4)
    {
      v14 = 0;
      snprintf(v18, 0x3B6uLL, "ASSERT,%s,%d,%s", "Ga01_03HandlePowerReportCB_block_invoke", 466, "Memory allocation failed for PwrMeas");
      if (g_LbsOsaTrace_Config)
      {
        bzero(__str, 0x3C6uLL);
        v12 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: %s\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v12), "OSA", 69, "Ga01_03HandlePowerReportCB_block_invoke", v18);
        gnssOsa_PrintLog(__str, 1, 1, 0);
      }
      if (gp_Logger)
        (*(void (**)(uint64_t))(*(_QWORD *)gp_Logger + 48))(gp_Logger);
      __assert_rtn("Ga01_03HandlePowerReportCB_block_invoke", "ga01GnssDeviceConfig.cpp", 466, "false && \"Memory allocation failed for PwrMeas\");
    }
    v4[8] = 0;
    v14 = v4;
    v5 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)v4 = *(_OWORD *)(a1 + 56);
    *((_OWORD *)v4 + 1) = v5;
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 160);
    block[0] = MEMORY[0x24BDAC760];
    block[2] = ___ZN4gnss15GnssAdaptDevice26Ga01_03HandlePowerReportCBEdddd_block_invoke_2;
    block[3] = &unk_251CDB9F0;
    v7 = v16;
    block[1] = 1174405120;
    if (v3 == v20)
    {
      v17 = v16;
      (*(void (**)(_QWORD *, _BYTE *))(v20[0] + 24))(v20, v16);
    }
    else
    {
      v17 = (_BYTE *)(*(uint64_t (**)(_QWORD *))(*v3 + 16))(v3);
    }
    block[4] = v13;
    dispatch_async(v6, block);
    if (v17 == v16)
    {
      v9 = 4;
    }
    else
    {
      if (!v17)
        goto LABEL_13;
      v9 = 5;
      v7 = v17;
    }
    (*(void (**)(_QWORD *))(*v7 + 8 * v9))(v7);
LABEL_13:
    _Block_object_dispose(v13, 8);
    v10 = v14;
    v14 = 0;
    if (v10)
      MEMORY[0x24BD2D7C8](v10, 0x1000C407A37F5ACLL);
    goto LABEL_15;
  }
  if (!g_LbsOsaTrace_Config)
    return result;
  bzero(__str, 0x3C6uLL);
  v8 = mach_continuous_time();
  snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx OnPowerReportCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v8), "ADP", 69, "Ga01_03HandlePowerReportCB_block_invoke", 770);
  gnssOsa_PrintLog(__str, 1, 1, 0);
LABEL_15:
  result = v21;
  if (v21 == v20)
  {
    v11 = 4;
    result = v20;
  }
  else
  {
    if (!v21)
      return result;
    v11 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v11))();
}

@end
