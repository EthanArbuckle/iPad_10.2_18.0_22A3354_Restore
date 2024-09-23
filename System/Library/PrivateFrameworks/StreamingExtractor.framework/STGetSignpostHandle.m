@implementation STGetSignpostHandle

void __STGetSignpostHandle_block_invoke()
{
  const char *v0;
  os_log_t v1;
  void *v2;

  v0 = STGetLoggingCategory();
  v1 = os_log_create("com.apple.StreamingExtractor.signposts", v0);
  v2 = (void *)STGetSignpostHandle_signpostHandle;
  STGetSignpostHandle_signpostHandle = (uint64_t)v1;

}

@end
