@implementation SPUIDefaults

+ (BOOL)enableFloatingWindow
{
  return objc_msgSend(a1, "isPhone") ^ 1;
}

+ (BOOL)isPhone
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 0;

  return v3;
}

+ (double)bottomPaddingToKeyboard
{
  return 3.0;
}

+ (BOOL)useUnifiedBackground
{
  return 1;
}

+ (BOOL)separateHeaderBlurLayeringEnabled
{
  return 1;
}

+ (id)textFieldTraits
{
  return +[SPUIProxySearchField sharedInstance](SPUIProxySearchField, "sharedInstance");
}

@end
