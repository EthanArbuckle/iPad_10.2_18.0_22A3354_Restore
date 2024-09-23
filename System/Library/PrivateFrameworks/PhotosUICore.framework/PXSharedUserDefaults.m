@implementation PXSharedUserDefaults

void __PXSharedUserDefaults_block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobileslideshow"));
  }
  v4 = (void *)PXSharedUserDefaults__sharedDefaults;
  PXSharedUserDefaults__sharedDefaults = v3;

}

@end
