@implementation PLLogApplication

void __PLLogApplication_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "application");
  v1 = (void *)qword_1ED885480;
  qword_1ED885480 = (uint64_t)v0;

}

@end
