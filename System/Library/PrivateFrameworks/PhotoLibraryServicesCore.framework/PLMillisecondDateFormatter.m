@implementation PLMillisecondDateFormatter

void __PLMillisecondDateFormatter_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)PLMillisecondDateFormatter_dateFormatter;
  PLMillisecondDateFormatter_dateFormatter = (uint64_t)v0;

  objc_msgSend((id)PLMillisecondDateFormatter_dateFormatter, "setDateFormat:", CFSTR("yyyy/MM/dd HH:mm:ss.SS"));
  v2 = (void *)PLMillisecondDateFormatter_dateFormatter;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

}

@end
