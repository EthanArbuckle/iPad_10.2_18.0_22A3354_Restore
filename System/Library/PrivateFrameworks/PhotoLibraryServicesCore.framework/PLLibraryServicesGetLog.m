@implementation PLLibraryServicesGetLog

void __PLLibraryServicesGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D710F8], "LibraryServices");
  v1 = (void *)PLLibraryServicesGetLog_log;
  PLLibraryServicesGetLog_log = (uint64_t)v0;

}

@end
