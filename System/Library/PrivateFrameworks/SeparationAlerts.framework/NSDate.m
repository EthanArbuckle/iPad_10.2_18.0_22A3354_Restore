@implementation NSDate

uint64_t __37__NSDate_TADateFormat__getDateString__block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  v1 = (void *)gTADateFormatDateFormatter;
  gTADateFormatDateFormatter = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)gTADateFormatDateFormatter, "setTimeZone:", v2);

  return objc_msgSend((id)gTADateFormatDateFormatter, "setFormatOptions:", 1907);
}

@end
