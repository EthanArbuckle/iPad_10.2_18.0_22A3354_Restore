@implementation PLSharedLibraryGetLog

void __PLSharedLibraryGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D71100], "SharedLibrary");
  v1 = (void *)PLSharedLibraryGetLog_log;
  PLSharedLibraryGetLog_log = (uint64_t)v0;

}

@end
