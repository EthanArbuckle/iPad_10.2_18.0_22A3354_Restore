@implementation PLSharedAlbumsGetLog

void __PLSharedAlbumsGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D71100], "SharedAlbums");
  v1 = (void *)PLSharedAlbumsGetLog_log;
  PLSharedAlbumsGetLog_log = (uint64_t)v0;

}

@end
