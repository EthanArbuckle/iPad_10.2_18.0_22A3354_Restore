@implementation TelephonyUtilLoadCrashSupport

void *__TelephonyUtilLoadCrashSupport_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *result;

  v9 = dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 1);
  qword_1ECF85878 = (uint64_t)v9;
  if (!v9)
    return (void *)_TelephonyUtilDebugPrint((uint64_t)"TelephonyUtilLoadCrashSupport_block_invoke", (uint64_t)"Unable to load CrashReporterSupport framework.\n", v10, v11, v12, v13, v14, v15, a9);
  off_1ECF85870 = (uint64_t (*)(_QWORD, _QWORD))dlsym(v9, "WriteStackshotReport");
  result = dlsym((void *)qword_1ECF85878, "SimulateCrash");
  _MergedGlobals_6 = result;
  return result;
}

@end
