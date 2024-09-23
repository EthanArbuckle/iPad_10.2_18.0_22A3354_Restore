@implementation PCScheduledWakeRTCPrecision

void __PCScheduledWakeRTCPrecision_block_invoke()
{
  __CFString *v0;
  CFIndex AppIntegerValue;
  BOOL v2;
  double v3;
  NSObject *v4;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  const __CFString *v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  keyExistsAndHasValidFormat = 0;
  v0 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("/var/mobile/Library/Preferences/%@"), CFSTR("com.apple.persistentconnection"));
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("PCScheduledWakeRTCPrecisionOverride"), v0, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v2 = AppIntegerValue < 1;
  else
    v2 = 1;
  if (!v2)
  {
    v3 = (double)AppIntegerValue;
    +[PCLog timer](PCLog, "timer");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v7 = CFSTR("PCScheduledWakeRTCPrecisionOverride");
      v8 = 2048;
      v9 = v3;
      _os_log_impl(&dword_1CBC1B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ set. Setting PCScheduledWakeRTCPrecision to %g seconds.", buf, 0x16u);
    }

    PCScheduledWakeRTCPrecision_scheduledWakeRTCPrecision = *(_QWORD *)&v3;
  }

}

@end
