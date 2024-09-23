@implementation PLLogIDS

void __PLLogIDS_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "IDS");
  v1 = (void *)qword_1ED883030;
  qword_1ED883030 = (uint64_t)v0;

}

@end
