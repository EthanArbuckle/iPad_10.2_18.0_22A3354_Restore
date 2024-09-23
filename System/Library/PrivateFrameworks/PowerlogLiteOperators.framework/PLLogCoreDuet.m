@implementation PLLogCoreDuet

void __PLLogCoreDuet_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "coreduet");
  v1 = (void *)_MergedGlobals_1_2;
  _MergedGlobals_1_2 = (uint64_t)v0;

}

@end
