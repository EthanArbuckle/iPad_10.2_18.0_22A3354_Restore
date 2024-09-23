@implementation LTOSLogEtiquetteSanitizer

void ___LTOSLogEtiquetteSanitizer_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Translation", "EtiquetteSanitizer");
  v1 = (void *)_LTOSLogEtiquetteSanitizer_log;
  _LTOSLogEtiquetteSanitizer_log = (uint64_t)v0;

}

@end
