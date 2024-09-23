@implementation UIDocumentLog

void ___UIDocumentLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.UIKit", "UIDocumentLog");
  v1 = (void *)_MergedGlobals_1015;
  _MergedGlobals_1015 = (uint64_t)v0;

}

@end
