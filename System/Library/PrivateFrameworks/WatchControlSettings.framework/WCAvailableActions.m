@implementation WCAvailableActions

void __WCAvailableActions_block_invoke()
{
  void *v0;
  uint64_t i;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 24; ++i)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", i);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "addObject:", v2);

  }
  v3 = (void *)WCAvailableActions_AvailableActions;
  WCAvailableActions_AvailableActions = (uint64_t)v0;

}

@end
