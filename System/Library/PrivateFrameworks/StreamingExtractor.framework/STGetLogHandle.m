@implementation STGetLogHandle

void __STGetLogHandle_block_invoke()
{
  const char *v0;
  os_log_t v1;
  void *v2;

  v0 = STGetLoggingCategory();
  v1 = os_log_create("com.apple.StreamingExtractor", v0);
  v2 = (void *)STGetLogHandle_logHandle;
  STGetLogHandle_logHandle = (uint64_t)v1;

}

@end
