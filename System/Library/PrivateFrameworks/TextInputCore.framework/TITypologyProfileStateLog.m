@implementation TITypologyProfileStateLog

void __TITypologyProfileStateLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TextInput", "typologyProfileState");
  v1 = (void *)TITypologyProfileStateLog_log;
  TITypologyProfileStateLog_log = (uint64_t)v0;

}

@end
