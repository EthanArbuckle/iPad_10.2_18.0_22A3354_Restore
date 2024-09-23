@implementation SSBOSLogDownload

void __SSBOSLogDownload_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Safari.SafeBrowsing", "Download");
  v1 = (void *)SSBOSLogDownload_log;
  SSBOSLogDownload_log = (uint64_t)v0;

}

@end
