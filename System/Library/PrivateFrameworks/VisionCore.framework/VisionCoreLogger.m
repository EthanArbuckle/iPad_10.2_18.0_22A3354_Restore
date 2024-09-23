@implementation VisionCoreLogger

void ___VisionCoreLogger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.VisionCore"), "UTF8String"), (const char *)objc_msgSend(CFSTR("VisionCoreLog"), "UTF8String"));
  v1 = (void *)_VisionCoreLogger__visionLogger;
  _VisionCoreLogger__visionLogger = (uint64_t)v0;

}

@end
