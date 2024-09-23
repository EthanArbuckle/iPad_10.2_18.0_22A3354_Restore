@implementation WRStringForDate

uint64_t __WRStringForDate_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)WRStringForDate_dateFormatter;
  WRStringForDate_dateFormatter = (uint64_t)v0;

  return objc_msgSend((id)WRStringForDate_dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd-HHmmss.SSS"));
}

@end
