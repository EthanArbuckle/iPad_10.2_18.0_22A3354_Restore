@implementation PNPSignpostLog

void ___PNPSignpostLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.pencilpairingui", "signposts");
  v1 = (void *)_PNPSignpostLog____PNPSignpostLog;
  _PNPSignpostLog____PNPSignpostLog = (uint64_t)v0;

}

@end
