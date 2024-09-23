@implementation IPAMakeLogs

void __IPAMakeLogs_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;

  v0 = os_log_create("com.apple.photos.imaging", "adjustments");
  v1 = (void *)adjustmentLog;
  adjustmentLog = (uint64_t)v0;

  v2 = os_log_create("com.apple.photos.imaging", "video");
  v3 = (void *)videoLog;
  videoLog = (uint64_t)v2;

  v4 = os_log_create("com.apple.photos.imaging", "colortransform");
  v5 = (void *)colorTransformLog;
  colorTransformLog = (uint64_t)v4;

}

@end
