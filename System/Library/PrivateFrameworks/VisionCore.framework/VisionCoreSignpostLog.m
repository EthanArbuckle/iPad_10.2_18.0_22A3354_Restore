@implementation VisionCoreSignpostLog

void ___VisionCoreSignpostLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.VisionCore", "signposts");
  v1 = (void *)_VisionCoreSignpostLog____VisionCoreSignpostLog;
  _VisionCoreSignpostLog____VisionCoreSignpostLog = (uint64_t)v0;

}

@end
