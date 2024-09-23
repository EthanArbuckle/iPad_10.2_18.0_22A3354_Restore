@implementation WCAvailableInputSourceTypes

void __WCAvailableInputSourceTypes_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v1);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v2);

  v3 = (void *)WCAvailableInputSourceTypes_AvailableInputSourceTypes;
  WCAvailableInputSourceTypes_AvailableInputSourceTypes = (uint64_t)v0;

}

@end
