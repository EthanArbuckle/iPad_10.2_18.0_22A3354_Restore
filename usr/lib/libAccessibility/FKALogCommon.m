@implementation FKALogCommon

void __FKALogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "FKACommon");
  v1 = (void *)FKALogCommon___logObj;
  FKALogCommon___logObj = (uint64_t)v0;

}

@end
