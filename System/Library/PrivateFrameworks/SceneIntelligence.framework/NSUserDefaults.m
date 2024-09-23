@implementation NSUserDefaults

void __56__NSUserDefaults_SIAppleGlobalDomain__appleGlobalDomain__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("Apple Global Domain"));
  v1 = (void *)appleGlobalDomain_defaults;
  appleGlobalDomain_defaults = v0;

}

uint64_t __62__NSUserDefaults_SIAppleGlobalDomain__appleGlobalDomainSIKeys__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "hasPrefix:", CFSTR("com.apple.sceneintelligence.")) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("com_apple_sceneintelligence_"));

  return v3;
}

@end
