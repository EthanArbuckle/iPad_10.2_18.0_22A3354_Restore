@implementation WFActionDenyListedBundles

void __WFActionDenyListedBundles_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0DC7FA8], CFSTR("com.apple.for.testing.internal.app"), *MEMORY[0x1E0DC7F78], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WFActionDenyListedBundles_denyListedBundles;
  WFActionDenyListedBundles_denyListedBundles = v0;

}

@end
