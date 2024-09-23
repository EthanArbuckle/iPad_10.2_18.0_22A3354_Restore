@implementation NSStringForSCLDay

void __NSStringForSCLDay_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)NSStringForSCLDay_formatter;
  NSStringForSCLDay_formatter = (uint64_t)v0;

  v2 = (void *)NSStringForSCLDay_formatter;
  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

}

@end
