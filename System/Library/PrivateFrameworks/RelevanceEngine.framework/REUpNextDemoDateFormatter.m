@implementation REUpNextDemoDateFormatter

uint64_t __REUpNextDemoDateFormatter_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)REUpNextDemoDateFormatter_dateFormatter;
  REUpNextDemoDateFormatter_dateFormatter = (uint64_t)v0;

  return objc_msgSend((id)REUpNextDemoDateFormatter_dateFormatter, "setDateFormat:", CFSTR("HH:mm"));
}

@end
