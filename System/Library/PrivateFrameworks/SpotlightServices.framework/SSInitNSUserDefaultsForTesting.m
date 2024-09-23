@implementation SSInitNSUserDefaultsForTesting

void __SSInitNSUserDefaultsForTesting_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.spotlight.defaults.testing"));
  v1 = (void *)testingDefaults;
  testingDefaults = v0;

}

@end
