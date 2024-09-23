@implementation OspreyMachAbsoluteTimeRate

void ___OspreyMachAbsoluteTimeRate_block_invoke()
{
  kern_return_t v0;
  unint64_t v1;
  unint64_t v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  mach_timebase_info info;

  info = 0;
  v0 = mach_timebase_info(&info);
  if (v0)
  {
    v3 = v0;
    OspreyLoggingInit();
    v4 = OspreyLogContextUtility;
    if (os_log_type_enabled((os_log_t)OspreyLogContextUtility, OS_LOG_TYPE_DEBUG))
      ___OspreyMachAbsoluteTimeRate_block_invoke_cold_2(v3, v4);
  }
  else
  {
    LODWORD(v1) = info.numer;
    LODWORD(v2) = info.denom;
    *(double *)&_OspreyMachAbsoluteTimeRate_rate = (double)v1 / (double)v2;
    OspreyLoggingInit();
    v5 = OspreyLogContextUtility;
    if (os_log_type_enabled((os_log_t)OspreyLogContextUtility, OS_LOG_TYPE_DEBUG))
      ___OspreyMachAbsoluteTimeRate_block_invoke_cold_1((int *)&info, (int *)&info.denom, v5);
  }
}

void ___OspreyMachAbsoluteTimeRate_block_invoke_cold_1(int *a1, int *a2, os_log_t log)
{
  int v3;
  int v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *a2;
  v5 = 136315906;
  v6 = "_OspreyMachAbsoluteTimeRate_block_invoke";
  v7 = 1024;
  v8 = v3;
  v9 = 1024;
  v10 = v4;
  v11 = 2048;
  v12 = _OspreyMachAbsoluteTimeRate_rate;
  _os_log_debug_impl(&dword_1B97C2000, log, OS_LOG_TYPE_DEBUG, "%s machTimebaseInfo.numer = %u, machTimebaseInfo.denom = %u, rate = %f", (uint8_t *)&v5, 0x22u);
}

void ___OspreyMachAbsoluteTimeRate_block_invoke_cold_2(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "_OspreyMachAbsoluteTimeRate_block_invoke";
  v4 = 1024;
  v5 = a1;
  _os_log_debug_impl(&dword_1B97C2000, a2, OS_LOG_TYPE_DEBUG, "%s mach_timebase_info() failed with %d.", (uint8_t *)&v2, 0x12u);
}

@end
