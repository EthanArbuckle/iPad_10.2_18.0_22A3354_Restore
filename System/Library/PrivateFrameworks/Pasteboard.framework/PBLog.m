@implementation PBLog

void ___PBLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Pasteboard", "Pasteboard");
  v1 = (void *)_PBLog_log;
  _PBLog_log = (uint64_t)v0;

}

@end
