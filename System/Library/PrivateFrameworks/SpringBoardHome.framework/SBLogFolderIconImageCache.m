@implementation SBLogFolderIconImageCache

void __SBLogFolderIconImageCache_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "FolderIconImageCache");
  v1 = (void *)SBLogFolderIconImageCache___logObj;
  SBLogFolderIconImageCache___logObj = (uint64_t)v0;

}

@end
