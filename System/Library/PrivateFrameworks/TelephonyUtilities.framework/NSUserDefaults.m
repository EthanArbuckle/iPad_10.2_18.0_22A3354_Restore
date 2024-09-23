@implementation NSUserDefaults

void __49__NSUserDefaults_TelephonyUtilities__tu_defaults__block_invoke()
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
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.TelephonyUtilities"));

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.TelephonyUtilities"));
  }
  v4 = (void *)tu_defaults_tu_defaults;
  tu_defaults_tu_defaults = v3;

}

void __49__NSUserDefaults_TelephonyUtilities__sb_defaults__block_invoke()
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
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.springboard"));

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.springboard"));
  }
  v4 = (void *)sb_defaults_sb_defaults;
  sb_defaults_sb_defaults = v3;

}

@end
