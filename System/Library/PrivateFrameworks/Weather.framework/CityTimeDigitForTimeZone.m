@implementation CityTimeDigitForTimeZone

void __CityTimeDigitForTimeZone_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CityTimeDigitForTimeZone___currentTimeCalendar;
  CityTimeDigitForTimeZone___currentTimeCalendar = v0;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = (void *)CityTimeDigitForTimeZone___timeZoneCache;
  CityTimeDigitForTimeZone___timeZoneCache = (uint64_t)v2;

}

@end
