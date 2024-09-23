@implementation ICSystemPaperExtensionLog

void __ICSystemPaperExtensionLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SystemPaperPresentation", "Extension");
  v1 = (void *)ICSystemPaperExtensionLog_log;
  ICSystemPaperExtensionLog_log = (uint64_t)v0;

}

@end
