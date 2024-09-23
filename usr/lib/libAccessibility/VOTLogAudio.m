@implementation VOTLogAudio

void __VOTLogAudio_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "VOTAudio");
  v1 = (void *)VOTLogAudio___logObj;
  VOTLogAudio___logObj = (uint64_t)v0;

}

@end
