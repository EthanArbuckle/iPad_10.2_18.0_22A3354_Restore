@implementation UIClippingFaultLog

void ___UIClippingFaultLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runtime-issues", "Text Layout");
  v1 = (void *)qword_1EDDCA808;
  qword_1EDDCA808 = (uint64_t)v0;

}

@end
