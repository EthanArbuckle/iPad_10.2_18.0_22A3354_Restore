@implementation ZN4gnss15GnssAdaptDevice5resetENSt3

_QWORD *___ZN4gnss15GnssAdaptDevice5resetENSt3__18functionIFvNS_6ResultEEEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD *result;
  uint64_t v4;
  uint64_t v5;
  unsigned __int16 v6;
  char __str[1040];
  _QWORD block[4];
  _BYTE v9[24];
  _BYTE *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 90))
  {
    v2 = *(NSObject **)(v1 + 296);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice5resetENSt3__18functionIFvNS_6ResultEEEE_block_invoke_2;
    block[3] = &__block_descriptor_tmp_8;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v9, a1 + 40);
    dispatch_async(v2, block);
    result = v10;
    if (v10 == v9)
    {
      v4 = 4;
      result = v9;
    }
    else
    {
      if (!v10)
        return result;
      v4 = 5;
    }
    return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v4))();
  }
  else
  {
    std::function<void ()(gnss::Result)>::operator=((_QWORD *)(v1 + 56), a1 + 40);
    gnss::GnssAdaptDevice::Ga00_04HandleDeviceInit(v1, 1);
    result = (_QWORD *)LbsOsaTrace_IsLoggingAllowed(0x18u, 1, 0, 0);
    if ((_DWORD)result)
    {
      bzero(__str, 0x410uLL);
      v5 = mach_continuous_time();
      v6 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Reset Triggered\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "ADP", 65, "reset_block_invoke");
      return (_QWORD *)LbsOsaTrace_WriteLog(0x18u, __str, v6, 1, 1);
    }
  }
  return result;
}

@end
