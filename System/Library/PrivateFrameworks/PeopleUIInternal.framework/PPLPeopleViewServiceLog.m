@implementation PPLPeopleViewServiceLog

void __PPLPeopleViewServiceLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.people", "viewservice");
  v1 = (void *)PPLPeopleViewServiceLog_log;
  PPLPeopleViewServiceLog_log = (uint64_t)v0;

}

@end
