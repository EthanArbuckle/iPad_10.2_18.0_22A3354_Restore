@implementation SSBOSLogDatabase

void __SSBOSLogDatabase_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Safari.SafeBrowsing", "Database");
  v1 = (void *)SSBOSLogDatabase_log;
  SSBOSLogDatabase_log = (uint64_t)v0;

}

@end
