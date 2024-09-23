@implementation TimestampStringFromNSTimeInterval

uint64_t __TimestampStringFromNSTimeInterval_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)TimestampStringFromNSTimeInterval_dateFormatter;
  TimestampStringFromNSTimeInterval_dateFormatter = (uint64_t)v0;

  objc_msgSend((id)TimestampStringFromNSTimeInterval_dateFormatter, "setTimeStyle:", 3);
  return objc_msgSend((id)TimestampStringFromNSTimeInterval_dateFormatter, "setDateStyle:", 1);
}

@end
