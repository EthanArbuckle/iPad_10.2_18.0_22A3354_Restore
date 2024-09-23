@implementation PLPhotosSearchGetLog

void __PLPhotosSearchGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D71100], "PhotosSearch");
  v1 = (void *)PLPhotosSearchGetLog_log;
  PLPhotosSearchGetLog_log = (uint64_t)v0;

}

@end
