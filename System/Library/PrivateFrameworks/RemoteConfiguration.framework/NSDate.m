@implementation NSDate

uint64_t __58__NSDate_RCAdditions___fr_sharedYearAndMonthDateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_fr_sharedYearAndMonthDateFormatter_sharedDateFormatter;
  _fr_sharedYearAndMonthDateFormatter_sharedDateFormatter = v0;

  return objc_msgSend((id)_fr_sharedYearAndMonthDateFormatter_sharedDateFormatter, "setDateFormat:", CFSTR("yyyy-MM"));
}

@end
