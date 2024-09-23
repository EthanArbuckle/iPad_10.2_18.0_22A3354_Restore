@implementation PLResourceCachingGetLog

void __PLResourceCachingGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D710F8], "ResourceCaching");
  v1 = (void *)PLResourceCachingGetLog_log;
  PLResourceCachingGetLog_log = (uint64_t)v0;

}

@end
