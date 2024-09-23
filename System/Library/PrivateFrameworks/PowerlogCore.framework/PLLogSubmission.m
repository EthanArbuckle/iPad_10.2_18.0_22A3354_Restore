@implementation PLLogSubmission

void __PLLogSubmission_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "submission");
  v1 = (void *)PLLogSubmission___logObj;
  PLLogSubmission___logObj = (uint64_t)v0;

}

@end
