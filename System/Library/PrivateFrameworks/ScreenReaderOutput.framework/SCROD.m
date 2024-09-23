@implementation SCROD

void ___SCROD_LOG_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "ScreenReaderOutput");
  v1 = (void *)_SCROD_LOG_log;
  _SCROD_LOG_log = (uint64_t)v0;

}

void ___SCROD_BRAILLE_LOG_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "ScreenReaderOutput.Braille");
  v1 = (void *)_SCROD_BRAILLE_LOG_log;
  _SCROD_BRAILLE_LOG_log = (uint64_t)v0;

}

@end
