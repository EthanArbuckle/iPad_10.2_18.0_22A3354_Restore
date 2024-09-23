@implementation SKGLogInit

void __SKGLogInit_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.spotlightknowledge", "SpotlightKnowledge");
  v1 = (void *)SKGLogInit_sSKGLog;
  SKGLogInit_sSKGLog = (uint64_t)v0;

}

@end
