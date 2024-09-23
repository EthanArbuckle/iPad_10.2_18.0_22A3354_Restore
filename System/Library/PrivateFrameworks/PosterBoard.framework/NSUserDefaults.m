@implementation NSUserDefaults

uint64_t __59__NSUserDefaults_PBFUtilities__pbf_unprotectedUserDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.PosterBoard.unprotectedUserDefaults"));
  v1 = (void *)pbf_unprotectedUserDefaults_unprotectedUserDefaults;
  pbf_unprotectedUserDefaults_unprotectedUserDefaults = v0;

  return _CFPreferencesSetFileProtectionClass();
}

@end
