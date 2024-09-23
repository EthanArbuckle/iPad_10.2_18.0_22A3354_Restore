@implementation NSUserDefaults

void __65__NSUserDefaults_TranslationDaemonAdditions__lt_appGroupDefaults__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.private.translation"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "_initWithSuiteName:container:", CFSTR("group.com.apple.private.translation"), v3);
  v2 = (void *)lt_appGroupDefaults_appGroupDefaults;
  lt_appGroupDefaults_appGroupDefaults = v1;

}

@end
