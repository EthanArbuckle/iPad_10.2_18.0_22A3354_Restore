@implementation PLLogCLPC

void __PLLogCLPC_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "clpc");
  v1 = (void *)qword_1ED884CC8;
  qword_1ED884CC8 = (uint64_t)v0;

}

@end
