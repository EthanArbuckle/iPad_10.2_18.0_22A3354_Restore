@implementation WRBundle

void __WRBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.WatchReplies"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WRBundle_sWRBundle;
  WRBundle_sWRBundle = v0;

}

@end
