@implementation VCSLogHandle

void __VCSLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.vCalendar", "VCS");
  v1 = (void *)VCSLogHandle_handle;
  VCSLogHandle_handle = (uint64_t)v0;

}

@end
