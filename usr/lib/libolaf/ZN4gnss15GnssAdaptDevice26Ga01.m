@implementation ZN4gnss15GnssAdaptDevice26Ga01

_QWORD *___ZN4gnss15GnssAdaptDevice26Ga01_03HandlePowerReportCBE11e_Gnm_ErrorP15s_Gnm_PowerMeas_block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  _DWORD *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64x2_t v8;
  NSObject *v9;
  _QWORD *v10;
  uint64_t v11;
  unsigned __int16 v12;
  uint64_t v13;
  _DWORD *v14;
  _QWORD *result;
  uint64_t v16;
  uint64_t v17;
  unsigned __int16 v18;
  _QWORD v19[5];
  _DWORD *v20;
  _QWORD block[5];
  _BYTE v22[24];
  _BYTE *v23;
  char v24[1024];
  char __str[1040];
  _QWORD v26[3];
  _QWORD *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v26, v2 + 472);
  v3 = v27;
  if (v27)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3002000000;
    v19[3] = __Block_byref_object_copy__0;
    v19[4] = __Block_byref_object_dispose__0;
    v4 = operator new(0x28uLL, MEMORY[0x24BEDB6B8]);
    if (!v4)
    {
      v20 = 0;
      snprintf(v24, 0x400uLL, "ASSERT,%s,%d,%s", "Ga01_03HandlePowerReportCB_block_invoke", 595, "Memory allocation failed for PwrMeas");
      if (LbsOsaTrace_IsLoggingAllowed(0xEu, 0, 0, 0))
      {
        bzero(__str, 0x410uLL);
        v17 = mach_continuous_time();
        v18 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: %s\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v17), "OSA", 69, "Ga01_03HandlePowerReportCB_block_invoke", v24);
        LbsOsaTrace_WriteLog(0xEu, __str, v18, 0, 1);
      }
      if (gp_Logger)
        (*(void (**)(uint64_t))(*(_QWORD *)gp_Logger + 48))(gp_Logger);
      __assert_rtn("Ga01_03HandlePowerReportCB_block_invoke", "ga01GnssDeviceConfig.cpp", 595, "false && \"Memory allocation failed for PwrMeas\");
    }
    v4[8] = 0;
    v20 = v4;
    LODWORD(v5) = *(_DWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    *((double *)v4 + 2) = (double)v5 / 1000.0;
    *((_QWORD *)v4 + 3) = v6;
    v7 = *(_QWORD *)(a1 + 40);
    v8.i64[0] = v7;
    v8.i64[1] = HIDWORD(v7);
    *(float64x2_t *)v4 = vdivq_f64(vcvtq_f64_u64(v8), (float64x2_t)vdupq_n_s64(0x408F400000000000uLL));
    v9 = *(NSObject **)(v2 + 296);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice26Ga01_03HandlePowerReportCBE11e_Gnm_ErrorP15s_Gnm_PowerMeas_block_invoke_2;
    block[3] = &unk_24E2B3170;
    v10 = v22;
    if (v3 == v26)
    {
      v23 = v22;
      (*(void (**)(_QWORD *, _BYTE *))(v26[0] + 24))(v26, v22);
    }
    else
    {
      v23 = (_BYTE *)(*(uint64_t (**)(_QWORD *))(*v3 + 16))(v3);
    }
    block[4] = v19;
    dispatch_async(v9, block);
    if (v23 == v22)
    {
      v13 = 4;
    }
    else
    {
      if (!v23)
        goto LABEL_13;
      v13 = 5;
      v10 = v23;
    }
    (*(void (**)(_QWORD *))(*v10 + 8 * v13))(v10);
LABEL_13:
    _Block_object_dispose(v19, 8);
    v14 = v20;
    v20 = 0;
    if (v14)
      MEMORY[0x2207AFDF0](v14, 0x1000C407A37F5ACLL);
    goto LABEL_15;
  }
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v11 = mach_continuous_time();
    v12 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx OnPowerReportCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "ADP", 69, "Ga01_03HandlePowerReportCB_block_invoke", 770);
    LbsOsaTrace_WriteLog(0x18u, __str, v12, 0, 1);
  }
LABEL_15:
  result = v27;
  if (v27 == v26)
  {
    v16 = 4;
    result = v26;
  }
  else
  {
    if (!v27)
      return result;
    v16 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v16))();
}

@end
