@implementation PFDateFormatterForTimeZoneAndFormat

void __PFDateFormatterForTimeZoneAndFormat_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;

  v0 = objc_opt_new();
  v1 = (void *)PFDateFormatterForTimeZoneAndFormat_dateFormattersByTimeZone;
  PFDateFormatterForTimeZoneAndFormat_dateFormattersByTimeZone = v0;

  v2 = objc_alloc(MEMORY[0x1E0C99D48]);
  v3 = objc_msgSend(v2, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v4 = (void *)PFDateFormatterForTimeZoneAndFormat_calendar;
  PFDateFormatterForTimeZoneAndFormat_calendar = v3;

}

@end
