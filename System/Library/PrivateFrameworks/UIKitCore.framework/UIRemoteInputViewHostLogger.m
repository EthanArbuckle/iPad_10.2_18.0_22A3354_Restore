@implementation UIRemoteInputViewHostLogger

void ___UIRemoteInputViewHostLogger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.UIKit", "UIRemoteInputViewHost");
  v1 = (void *)_MergedGlobals_947;
  _MergedGlobals_947 = (uint64_t)v0;

}

@end
