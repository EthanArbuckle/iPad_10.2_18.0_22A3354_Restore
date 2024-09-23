@implementation NSDateComponentsFormatter

uint64_t __90__NSDateComponentsFormatter_ScreenTimeAdditions__st_sharedAbbreviatedSecondsDateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)st_sharedAbbreviatedSecondsDateFormatter_usageTimeFormatter;
  st_sharedAbbreviatedSecondsDateFormatter_usageTimeFormatter = v0;

  objc_msgSend((id)st_sharedAbbreviatedSecondsDateFormatter_usageTimeFormatter, "setAllowedUnits:", 128);
  return objc_msgSend((id)st_sharedAbbreviatedSecondsDateFormatter_usageTimeFormatter, "setUnitsStyle:", 1);
}

uint64_t __84__NSDateComponentsFormatter_ScreenTimeAdditions__st_sharedShortDynamicDateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)st_sharedShortDynamicDateFormatter_usageTimeFormatter;
  st_sharedShortDynamicDateFormatter_usageTimeFormatter = v0;

  objc_msgSend((id)st_sharedShortDynamicDateFormatter_usageTimeFormatter, "setFormattingContext:", 1);
  return objc_msgSend((id)st_sharedShortDynamicDateFormatter_usageTimeFormatter, "setUnitsStyle:", 2);
}

@end
