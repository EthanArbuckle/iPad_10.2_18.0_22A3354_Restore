@implementation PBFLogApplicationState

void __PBFLogApplicationState_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoard", "ApplicationState");
  v1 = (void *)PBFLogApplicationState___logObj;
  PBFLogApplicationState___logObj = (uint64_t)v0;

}

@end
