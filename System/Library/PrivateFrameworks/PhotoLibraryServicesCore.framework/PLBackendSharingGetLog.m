@implementation PLBackendSharingGetLog

void __PLBackendSharingGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D710F8], "BackendSharing");
  v1 = (void *)PLBackendSharingGetLog_log;
  PLBackendSharingGetLog_log = (uint64_t)v0;

}

@end
