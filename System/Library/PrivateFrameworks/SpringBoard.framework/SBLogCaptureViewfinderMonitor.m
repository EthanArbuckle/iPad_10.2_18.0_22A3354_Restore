@implementation SBLogCaptureViewfinderMonitor

void __SBLogCaptureViewfinderMonitor_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "CaptureViewfinderMonitor");
  v1 = (void *)SBLogCaptureViewfinderMonitor___logObj;
  SBLogCaptureViewfinderMonitor___logObj = (uint64_t)v0;

}

@end
