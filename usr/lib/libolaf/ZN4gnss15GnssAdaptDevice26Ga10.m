@implementation ZN4gnss15GnssAdaptDevice26Ga10

_QWORD *___ZN4gnss15GnssAdaptDevice26Ga10_07FTAssistanceRequestEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD *v3;
  uint64_t v4;
  unsigned __int16 v5;
  uint64_t v6;
  unsigned __int16 v7;
  uint64_t v8;
  _QWORD *result;
  uint64_t v10;
  _QWORD block[4];
  _BYTE v12[24];
  _BYTE *v13;
  int v14;
  char __str[1040];
  _QWORD v16[3];
  _QWORD *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v16, v1 + 888);
  if (v17)
  {
    v2 = *(NSObject **)(v1 + 296);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice26Ga10_07FTAssistanceRequestEv_block_invoke_2;
    block[3] = &__block_descriptor_tmp_220;
    v3 = v12;
    if (v17 == v16)
    {
      v13 = v12;
      (*(void (**)(_QWORD *, _BYTE *))(v16[0] + 24))(v16, v12);
    }
    else
    {
      v13 = (_BYTE *)(*(uint64_t (**)(_QWORD *))(*v17 + 16))(v17);
    }
    v8 = 4;
    v14 = 4;
    dispatch_async(v2, block);
    if (v13 != v12)
    {
      if (!v13)
        goto LABEL_13;
      v8 = 5;
      v3 = v13;
    }
    (*(void (**)(_QWORD *))(*v3 + 8 * v8))(v3);
  }
  else
  {
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v4 = mach_continuous_time();
      v5 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx FtaReportCb\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "ADP", 69, "Ga10_07FTAssistanceRequest_block_invoke", 258);
      LbsOsaTrace_WriteLog(0x18u, __str, v5, 0, 1);
    }
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 5, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v6 = mach_continuous_time();
      v7 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "ADP", 68, "Ga10_07FTAssistanceRequest_block_invoke");
      LbsOsaTrace_WriteLog(0x18u, __str, v7, 5, 1);
    }
  }
LABEL_13:
  result = v17;
  if (v17 == v16)
  {
    v10 = 4;
    result = v16;
  }
  else
  {
    if (!v17)
      return result;
    v10 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v10))();
}

@end
