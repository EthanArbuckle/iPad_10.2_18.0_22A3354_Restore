@implementation VUIJSDeviceSettings

- (NSString)language
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", CFSTR("AppleLanguages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)name
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0DC69D0], "name");
}

@end
