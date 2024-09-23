@implementation TVRUIKeyboardLog

void ___TVRUIKeyboardLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TVRemoteUI", "Keyboard");
  v1 = (void *)_TVRUIKeyboardLog_log;
  _TVRUIKeyboardLog_log = (uint64_t)v0;

}

@end
