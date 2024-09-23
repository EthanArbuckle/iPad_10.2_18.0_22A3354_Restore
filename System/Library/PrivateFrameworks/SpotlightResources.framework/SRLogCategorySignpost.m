@implementation SRLogCategorySignpost

void __SRLogCategorySignpost_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.spotlight.resources", "Signpost");
  v1 = (void *)SRLogCategorySignpost_signpostLog;
  SRLogCategorySignpost_signpostLog = (uint64_t)v0;

}

@end
