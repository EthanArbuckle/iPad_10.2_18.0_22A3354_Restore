@implementation UIInputWindowControllerLogger

void ___UIInputWindowControllerLogger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.UIKit", "InputWindowController");
  v1 = (void *)qword_1ECD7A270;
  qword_1ECD7A270 = (uint64_t)v0;

}

@end
