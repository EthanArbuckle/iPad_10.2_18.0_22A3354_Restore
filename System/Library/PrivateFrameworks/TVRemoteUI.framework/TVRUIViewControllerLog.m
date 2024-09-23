@implementation TVRUIViewControllerLog

void ___TVRUIViewControllerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TVRemoteUI", "ViewController");
  v1 = (void *)_TVRUIViewControllerLog_log;
  _TVRUIViewControllerLog_log = (uint64_t)v0;

}

@end
