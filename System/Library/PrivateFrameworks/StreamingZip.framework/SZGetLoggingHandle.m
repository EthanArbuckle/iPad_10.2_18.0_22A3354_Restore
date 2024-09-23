@implementation SZGetLoggingHandle

void __SZGetLoggingHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.streamingzip", "framework");
  v1 = (void *)SZGetLoggingHandle_logHandle;
  SZGetLoggingHandle_logHandle = (uint64_t)v0;

}

@end
