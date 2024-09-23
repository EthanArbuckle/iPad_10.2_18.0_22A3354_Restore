@implementation SCDALogForCategory

void __SCDALogForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create("com.apple.siri.SCDA", "SCDA");
  v1 = (void *)SCDALogForCategory_oslog;
  SCDALogForCategory_oslog = (uint64_t)v0;

  v2 = os_log_create("com.apple.siri.SCDA", "Summary");
  v3 = (void *)qword_25441DF10;
  qword_25441DF10 = (uint64_t)v2;

}

@end
