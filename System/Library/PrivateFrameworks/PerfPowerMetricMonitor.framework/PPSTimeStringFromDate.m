@implementation PPSTimeStringFromDate

uint64_t __PPSTimeStringFromDate_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)PPSTimeStringFromDate_dateFormatter;
  PPSTimeStringFromDate_dateFormatter = (uint64_t)v0;

  return objc_msgSend((id)PPSTimeStringFromDate_dateFormatter, "setDateFormat:", CFSTR("HH:mm:ss.SSS"));
}

@end
