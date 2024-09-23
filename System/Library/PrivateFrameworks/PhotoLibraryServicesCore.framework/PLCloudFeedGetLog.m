@implementation PLCloudFeedGetLog

void __PLCloudFeedGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D71100], "CloudFeed");
  v1 = (void *)PLCloudFeedGetLog_log;
  PLCloudFeedGetLog_log = (uint64_t)v0;

}

@end
