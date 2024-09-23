@implementation SDConstants

+ (void)initialize
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("DisableBuildFiltering"));
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerDefaults:", v3);

}

@end
