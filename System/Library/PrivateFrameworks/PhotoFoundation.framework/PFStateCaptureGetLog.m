@implementation PFStateCaptureGetLog

void __PFStateCaptureGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.backend", "StateCapture");
  v1 = (void *)PFStateCaptureGetLog_log;
  PFStateCaptureGetLog_log = (uint64_t)v0;

}

@end
