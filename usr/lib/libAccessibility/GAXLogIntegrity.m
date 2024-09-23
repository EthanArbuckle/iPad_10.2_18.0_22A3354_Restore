@implementation GAXLogIntegrity

void __GAXLogIntegrity_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "GAXIntegrity");
  v1 = (void *)GAXLogIntegrity___logObj;
  GAXLogIntegrity___logObj = (uint64_t)v0;

}

@end
