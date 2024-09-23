@implementation VTLogInitIfNeeded

void __VTLogInitIfNeeded_block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  NSLog(CFSTR("::: Initializing VoiceTrigger logging..."));
  v0 = os_log_create((const char *)VTLoggingSubsystem, (const char *)kVTLoggingContextFramework);
  v1 = (void *)VTLogContextFacilityVoiceTrigger;
  VTLogContextFacilityVoiceTrigger = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v3 = (void *)_dateFormatter;
  _dateFormatter = (uint64_t)v2;

  v4 = (void *)_dateFormatter;
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

  objc_msgSend((id)_dateFormatter, "setDateFormat:", CFSTR("yyyyMMdd-HHmmss"));
  v6 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20D965000, v6, OS_LOG_TYPE_DEFAULT, "::: VoiceTrigger logging initialized", v7, 2u);
  }
}

@end
