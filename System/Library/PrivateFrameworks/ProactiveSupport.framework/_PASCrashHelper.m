@implementation _PASCrashHelper

+ (void)simulateCrashWithDescription:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  int v5;
  __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  if (v3)
    v4 = v3;
  else
    v4 = CFSTR("No description");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v5 = 138412290;
    v6 = v4;
    _os_log_fault_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Simulating crash, reason: %@", (uint8_t *)&v5, 0xCu);
  }

}

+ (void)optInCurrentProcessForLogFaultProbabalisticCrashesWithConfig:(id)a3
{
  id v5;
  unsigned int v6;
  uint32_t v7;
  void *v8;
  void *v9;
  uint8_t buf[16];

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASCrashHelper.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("config"));

  }
  if (+[_PASDeviceInfo isDNUEnabled](_PASDeviceInfo, "isDNUEnabled"))
  {
    v6 = objc_msgSend(v5, "oddsNumerator");
    if (v6 > objc_msgSend(v5, "oddsDenominator"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASCrashHelper.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("config.oddsNumerator <= config.oddsDenominator"));

    }
    if (objc_msgSend(v5, "oddsNumerator"))
    {
      _PASLogFaultAndProbCrashWindowSize = objc_msgSend(v5, "uniqueCallsiteWindowSize");
      v7 = arc4random_uniform(objc_msgSend(v5, "oddsDenominator"));
      if (v7 < objc_msgSend(v5, "oddsNumerator"))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "_PASLogFaultAndProbCrash will be armed for this process!", buf, 2u);
        }
        atomic_store(1u, _PASLogFaultAndProbCrashArmed);
      }
    }
  }

}

@end
