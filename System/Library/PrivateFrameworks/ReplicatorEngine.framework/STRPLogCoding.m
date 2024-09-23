@implementation STRPLogCoding

void __STRPLogCoding_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.replicatorengine", "Coding");
  v1 = (void *)STRPLogCoding___logObj;
  STRPLogCoding___logObj = (uint64_t)v0;

}

@end
