@implementation PercentString

uint64_t __PercentString_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)PercentString__formatter;
  PercentString__formatter = (uint64_t)v0;

  return objc_msgSend((id)PercentString__formatter, "setNumberStyle:", 3);
}

@end
