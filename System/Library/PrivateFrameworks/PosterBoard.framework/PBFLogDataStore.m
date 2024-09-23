@implementation PBFLogDataStore

void __PBFLogDataStore_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoard", "DataStore");
  v1 = (void *)PBFLogDataStore___logObj;
  PBFLogDataStore___logObj = (uint64_t)v0;

}

@end
