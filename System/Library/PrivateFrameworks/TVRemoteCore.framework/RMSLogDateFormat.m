@implementation RMSLogDateFormat

void ___RMSLogDateFormat_block_invoke()
{
  const __CFLocale *v0;
  __CFDateFormatter *v1;

  v0 = CFLocaleCopyCurrent();
  v1 = CFDateFormatterCreate(0, v0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  _RMSLogDateFormat_dateFormatter = (uint64_t)v1;
  if (!v1)
    ___RMSLogDateFormat_block_invoke_cold_1();
  CFDateFormatterSetFormat(v1, CFSTR("MMMdd H:mm:ss.SSS"));
  CFRelease(v0);
}

void ___RMSLogDateFormat_block_invoke_cold_1()
{
  __assert_rtn("_RMSLogDateFormat_block_invoke", "RMSLogging.m", 65, "dateFormatter");
}

@end
