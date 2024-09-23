@implementation SZGetTraceHandle

void __SZGetTraceHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.streamingzip.signposts", "framework");
  v1 = (void *)SZGetTraceHandle_logHandle;
  SZGetTraceHandle_logHandle = (uint64_t)v0;

}

@end
