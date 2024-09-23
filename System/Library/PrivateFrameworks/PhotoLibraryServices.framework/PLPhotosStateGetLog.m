@implementation PLPhotosStateGetLog

void __PLPhotosStateGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D710F8], "PhotosState");
  v1 = (void *)PLPhotosStateGetLog_log;
  PLPhotosStateGetLog_log = (uint64_t)v0;

}

@end
