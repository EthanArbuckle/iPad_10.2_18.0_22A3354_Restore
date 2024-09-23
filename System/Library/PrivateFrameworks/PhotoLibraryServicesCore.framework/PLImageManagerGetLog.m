@implementation PLImageManagerGetLog

void __PLImageManagerGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D710F8], "ImageManager");
  v1 = (void *)PLImageManagerGetLog_log;
  PLImageManagerGetLog_log = (uint64_t)v0;

}

@end
