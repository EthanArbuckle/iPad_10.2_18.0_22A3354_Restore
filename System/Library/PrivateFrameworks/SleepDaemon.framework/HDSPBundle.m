@implementation HDSPBundle

void __HDSPBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SleepDaemon"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_18;
  _MergedGlobals_18 = v0;

}

@end
