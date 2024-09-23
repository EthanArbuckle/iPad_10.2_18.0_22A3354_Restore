@implementation TSSRequestLogToken

void __TSSRequestLogToken_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.accessoryupdater.uarp", "personalization");
  v1 = (void *)TSSRequestLogToken_logToken;
  TSSRequestLogToken_logToken = (uint64_t)v0;

}

@end
