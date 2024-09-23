@implementation UIPeripheralHostLogger

void ___UIPeripheralHostLogger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.UIKit", "UIPeripheralHost");
  v1 = (void *)qword_1ECD7F040;
  qword_1ECD7F040 = (uint64_t)v0;

}

@end
