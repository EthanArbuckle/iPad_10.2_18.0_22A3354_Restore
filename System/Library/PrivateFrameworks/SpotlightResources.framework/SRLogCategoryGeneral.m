@implementation SRLogCategoryGeneral

void __SRLogCategoryGeneral_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.spotlight.resources", "General");
  v1 = (void *)SRLogCategoryGeneral_generalLog;
  SRLogCategoryGeneral_generalLog = (uint64_t)v0;

}

@end
