@implementation SLLogInitIfNeeded

void __SLLogInitIfNeeded_block_invoke()
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
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  NSLog(CFSTR("::: Initializing SiriLiminal logging..."));
  v0 = os_log_create((const char *)SLLoggingSubsystem, (const char *)kSLLoggingContextFramework);
  v1 = (void *)SLLogContextFacilityCoreSpeech;
  SLLogContextFacilityCoreSpeech = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v3 = (void *)_dateFormatter;
  _dateFormatter = (uint64_t)v2;

  v4 = (void *)_dateFormatter;
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

  objc_msgSend((id)_dateFormatter, "setDateFormat:", CFSTR("yyyyMMdd-HHmmss"));
  v6 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "SLLogInitIfNeeded_block_invoke";
    v9 = 2080;
    v10 = "gitrelno_unavailable";
    _os_log_impl(&dword_213B50000, v6, OS_LOG_TYPE_DEFAULT, "%s ::: SL logging initialized (%s)", (uint8_t *)&v7, 0x16u);
  }
}

@end
