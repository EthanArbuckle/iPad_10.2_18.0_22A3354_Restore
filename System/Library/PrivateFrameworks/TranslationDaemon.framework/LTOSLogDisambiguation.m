@implementation LTOSLogDisambiguation

void ___LTOSLogDisambiguation_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Translation", "Disambiguation");
  v1 = (void *)_LTOSLogDisambiguation_log;
  _LTOSLogDisambiguation_log = (uint64_t)v0;

}

@end
