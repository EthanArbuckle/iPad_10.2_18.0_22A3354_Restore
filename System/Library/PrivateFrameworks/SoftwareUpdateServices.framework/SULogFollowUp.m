@implementation SULogFollowUp

void __SULogFollowUp_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.softwareupdateservices", "SUFollowUp");
  v1 = (void *)SULogFollowUp___instance;
  SULogFollowUp___instance = (uint64_t)v0;

}

@end
