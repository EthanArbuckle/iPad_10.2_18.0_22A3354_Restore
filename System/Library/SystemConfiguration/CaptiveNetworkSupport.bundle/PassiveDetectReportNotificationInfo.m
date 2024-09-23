@implementation PassiveDetectReportNotificationInfo

void __PassiveDetectReportNotificationInfo_block_invoke(int a1, int a2, int a3, CFDictionaryRef theDict)
{
  const void *Value;
  CFTypeID TypeID;
  NSObject *logger;
  os_log_type_t v7;
  int v8;
  const void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    if (theDict)
    {
      Value = CFDictionaryGetValue(theDict, CFSTR("bundle_details"));
      TypeID = CFStringGetTypeID();
      if (Value)
      {
        if (CFGetTypeID(Value) == TypeID)
        {
          logger = mysyslog_get_logger();
          v7 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(logger, v7))
          {
            v8 = 138412290;
            v9 = Value;
            _os_log_impl(&dword_219EF1000, logger, v7, "App [%@] triggered passive symptom", (uint8_t *)&v8, 0xCu);
          }
        }
      }
    }
  }
}

@end
