@implementation RCPLogPlayback

void __RCPLogPlayback_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.recap", "Playback");
  v1 = (void *)RCPLogPlayback___logObj;
  RCPLogPlayback___logObj = (uint64_t)v0;

}

@end
