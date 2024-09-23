@implementation PRSLogObserver

void __PRSLogObserver_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoardServices", "Observer");
  v1 = (void *)PRSLogObserver___logObj;
  PRSLogObserver___logObj = (uint64_t)v0;

}

@end
