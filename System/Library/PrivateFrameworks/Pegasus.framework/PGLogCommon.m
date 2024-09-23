@implementation PGLogCommon

void __PGLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.pegasus", "Common");
  v1 = (void *)PGLogCommon___log;
  PGLogCommon___log = (uint64_t)v0;

}

@end
