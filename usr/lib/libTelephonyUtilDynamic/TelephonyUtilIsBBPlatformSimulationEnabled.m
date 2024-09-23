@implementation TelephonyUtilIsBBPlatformSimulationEnabled

void __TelephonyUtilIsBBPlatformSimulationEnabled_block_invoke()
{
  CFPropertyListRef v0;
  const char *v1;
  NSObject *v2;
  const char *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (_TUQueryBuildInformationOnce != -1)
    dispatch_once(&_TUQueryBuildInformationOnce, &__block_literal_global_32);
  if (_TUIsInternalBuildCached == 1)
  {
    if (qword_1ECF857E0 != -1)
      dispatch_once(&qword_1ECF857E0, &__block_literal_global_50);
    if ((byte_1ECF857C4 & 1) != 0)
    {
      v0 = CFPreferencesCopyValue(CFSTR("EnableBBSimulation"), CFSTR("/private/var/wireless/Library/Preferences/com.apple.AppleBasebandManager.plist"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
      if (v0)
      {
        byte_1ECF857C3 = v0 == (CFPropertyListRef)*MEMORY[0x1E0C9AE50];
        CFRelease(v0);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          if (byte_1ECF857C3)
            v1 = "enabled";
          else
            v1 = "disabled";
          v4 = 136315138;
          v5 = v1;
          _os_log_debug_impl(&dword_190D2F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "BBSimulation %s", (uint8_t *)&v4, 0xCu);
        }
        return;
      }
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        return;
      LOWORD(v4) = 0;
      v2 = MEMORY[0x1E0C81028];
      v3 = "BBSimulation disabled due to key not set";
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        return;
      LOWORD(v4) = 0;
      v2 = MEMORY[0x1E0C81028];
      v3 = "Platform Simulation disabled due to 'libRemoteTelephonyTransport' not found";
    }
    _os_log_impl(&dword_190D2F000, v2, OS_LOG_TYPE_DEFAULT, v3, (uint8_t *)&v4, 2u);
  }
}

@end
