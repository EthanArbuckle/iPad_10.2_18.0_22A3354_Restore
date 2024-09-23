@implementation SDLogInitIfNeeded

void __SDLogInitIfNeeded_block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  NSLog(CFSTR("::: Initializing SpeechDetector logging..."));
  v0 = os_log_create((const char *)SDLoggingSubsystem, (const char *)kSDLoggingContextFramework);
  v1 = (void *)SDLogContextFacilityLocalSRBridge;
  SDLogContextFacilityLocalSRBridge = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v3 = (void *)_dateFormatter;
  _dateFormatter = (uint64_t)v2;

  v4 = (void *)_dateFormatter;
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

  objc_msgSend((id)_dateFormatter, "setDateFormat:", CFSTR("yyyyMMdd-HHmmss"));
  v6 = SDLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)SDLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "SDLogInitIfNeeded_block_invoke";
    _os_log_impl(&dword_21347E000, v6, OS_LOG_TYPE_DEFAULT, "%s ::: SpeechDetector logging initialized", (uint8_t *)&v7, 0xCu);
  }
}

@end
