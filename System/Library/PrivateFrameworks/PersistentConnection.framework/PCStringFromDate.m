@implementation PCStringFromDate

uint64_t __PCStringFromDate_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)PCStringFromDate_formatter;
  PCStringFromDate_formatter = (uint64_t)v0;

  return objc_msgSend((id)PCStringFromDate_formatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss Z"));
}

@end
