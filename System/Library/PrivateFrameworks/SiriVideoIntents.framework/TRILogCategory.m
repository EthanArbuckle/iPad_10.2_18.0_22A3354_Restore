@implementation TRILogCategory

void __TRILogCategory_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.siri.video", "trial");
  v1 = (void *)TRILogCategory_log;
  TRILogCategory_log = (uint64_t)v0;

}

@end
