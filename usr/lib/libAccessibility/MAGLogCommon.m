@implementation MAGLogCommon

void __MAGLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "MAGCommon");
  v1 = (void *)MAGLogCommon___logObj;
  MAGLogCommon___logObj = (uint64_t)v0;

}

@end
