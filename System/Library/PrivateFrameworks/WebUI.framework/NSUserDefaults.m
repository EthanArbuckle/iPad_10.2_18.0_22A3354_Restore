@implementation NSUserDefaults

void __45__NSUserDefaults_WebUIExtras__webui_defaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.WebUI"));
  v1 = (void *)webui_defaults_userDefaults;
  webui_defaults_userDefaults = v0;

}

@end
