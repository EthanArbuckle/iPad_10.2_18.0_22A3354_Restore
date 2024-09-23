@implementation SeedingDefaults

void __SeedingDefaults_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.seeding"));
  v1 = (void *)SeedingDefaults_defaults;
  SeedingDefaults_defaults = v0;

}

@end
