@implementation SBLogStationaryMotionDetector

void __SBLogStationaryMotionDetector_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "StationaryMotionDetector");
  v1 = (void *)SBLogStationaryMotionDetector___logObj;
  SBLogStationaryMotionDetector___logObj = (uint64_t)v0;

}

@end
