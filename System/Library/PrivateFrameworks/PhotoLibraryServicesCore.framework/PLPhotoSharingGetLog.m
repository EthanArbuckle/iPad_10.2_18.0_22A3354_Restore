@implementation PLPhotoSharingGetLog

void __PLPhotoSharingGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D710F8], "PhotoSharing");
  v1 = (void *)PLPhotoSharingGetLog_log;
  PLPhotoSharingGetLog_log = (uint64_t)v0;

}

@end
