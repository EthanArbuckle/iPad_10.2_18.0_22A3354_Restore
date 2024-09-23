@implementation UIImageLoadingLog

void ___UIImageLoadingLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.UIKit", "ImageLoading");
  v1 = (void *)_MergedGlobals_1_6;
  _MergedGlobals_1_6 = (uint64_t)v0;

}

@end
