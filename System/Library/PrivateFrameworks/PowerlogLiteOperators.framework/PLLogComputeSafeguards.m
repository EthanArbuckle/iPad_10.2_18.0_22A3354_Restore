@implementation PLLogComputeSafeguards

void __PLLogComputeSafeguards_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "ComputeSafeguards");
  v1 = (void *)qword_1ED883470;
  qword_1ED883470 = (uint64_t)v0;

}

@end
