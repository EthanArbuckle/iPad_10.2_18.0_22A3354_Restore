@implementation LTOSLogHotfix

void ___LTOSLogHotfix_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Translation", "Hotfix");
  v1 = (void *)_LTOSLogHotfix_log;
  _LTOSLogHotfix_log = (uint64_t)v0;

}

@end
