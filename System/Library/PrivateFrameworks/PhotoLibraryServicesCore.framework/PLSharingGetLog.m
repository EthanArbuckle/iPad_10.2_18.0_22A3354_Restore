@implementation PLSharingGetLog

void __PLSharingGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D71100], "Sharing");
  v1 = (void *)PLSharingGetLog_log;
  PLSharingGetLog_log = (uint64_t)v0;

}

@end
