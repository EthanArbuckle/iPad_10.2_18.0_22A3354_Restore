@implementation PLCuratedLibraryGetLog

void __PLCuratedLibraryGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D71100], "CuratedLibrary");
  v1 = (void *)PLCuratedLibraryGetLog_log;
  PLCuratedLibraryGetLog_log = (uint64_t)v0;

}

@end
