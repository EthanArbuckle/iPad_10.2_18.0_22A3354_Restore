@implementation PLLogPush

void __PLLogPush_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "push");
  v1 = (void *)qword_1ED884C78;
  qword_1ED884C78 = (uint64_t)v0;

}

@end
