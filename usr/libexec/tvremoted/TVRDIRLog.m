@implementation TVRDIRLog

void ___TVRDIRLog_block_invoke(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.tvremoted", "IntelligentRouting");
  v2 = (void *)_TVRDIRLog_log;
  _TVRDIRLog_log = (uint64_t)v1;

}

@end
