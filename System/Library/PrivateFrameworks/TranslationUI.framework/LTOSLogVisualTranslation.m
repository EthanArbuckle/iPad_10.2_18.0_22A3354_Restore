@implementation LTOSLogVisualTranslation

void ___LTOSLogVisualTranslation_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Translation", "VisualTranslation");
  v1 = (void *)_LTOSLogVisualTranslation_log;
  _LTOSLogVisualTranslation_log = (uint64_t)v0;

}

@end
