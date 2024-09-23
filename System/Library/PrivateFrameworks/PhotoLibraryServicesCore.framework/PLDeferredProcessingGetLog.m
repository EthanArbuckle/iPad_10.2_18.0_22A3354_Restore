@implementation PLDeferredProcessingGetLog

void __PLDeferredProcessingGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D710F8], "DeferredProcessing");
  v1 = (void *)PLDeferredProcessingGetLog_log;
  PLDeferredProcessingGetLog_log = (uint64_t)v0;

}

@end
