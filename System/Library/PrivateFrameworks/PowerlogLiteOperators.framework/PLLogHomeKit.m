@implementation PLLogHomeKit

void __PLLogHomeKit_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "homekit");
  v1 = (void *)qword_1ED8823F8;
  qword_1ED8823F8 = (uint64_t)v0;

}

@end
