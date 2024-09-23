@implementation ISCurrentProcessName

void ____ISCurrentProcessName_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__ISCurrentProcessName_processName;
  __ISCurrentProcessName_processName = v0;

}

@end
