@implementation NSUserDefaults

void __66__NSUserDefaults_TranslationSettings__translationAppGroupDefaults__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.private.translation"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "_initWithSuiteName:container:", CFSTR("group.com.apple.private.translation"), v3);
  v2 = (void *)translationAppGroupDefaults_userDefaults;
  translationAppGroupDefaults_userDefaults = v1;

}

@end
