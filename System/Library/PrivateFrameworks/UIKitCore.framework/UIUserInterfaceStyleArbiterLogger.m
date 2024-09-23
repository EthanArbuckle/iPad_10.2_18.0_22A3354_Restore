@implementation UIUserInterfaceStyleArbiterLogger

void ___UIUserInterfaceStyleArbiterLogger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.UIKit", "UserInterfaceStyleArbiter");
  v1 = (void *)_MergedGlobals_1224;
  _MergedGlobals_1224 = (uint64_t)v0;

}

@end
