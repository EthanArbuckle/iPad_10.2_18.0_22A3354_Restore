@implementation GroupingIdentifierFromDate

void __GroupingIdentifierFromDate_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)GroupingIdentifierFromDate_dateFormatterToStripTime;
  GroupingIdentifierFromDate_dateFormatterToStripTime = (uint64_t)v0;

  objc_msgSend((id)GroupingIdentifierFromDate_dateFormatterToStripTime, "setDateFormat:", CFSTR("yyyyMMdd"));
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend((id)GroupingIdentifierFromDate_dateFormatterToStripTime, "setLocale:", v2);

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)GroupingIdentifierFromDate_dateFormatterToStripTime, "setTimeZone:", v3);

}

@end
