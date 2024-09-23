@implementation UIApplicationIsAppleAppOrTestingHarness

void ___UIApplicationIsAppleAppOrTestingHarness_block_invoke()
{
  void *v0;
  id v1;

  +[UIApplication displayIdentifier](UIApplication, "displayIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  byte_1EDDCA619 = objc_msgSend(v0, "hasPrefix:", CFSTR("com.apple."));

  +[UIApplication displayIdentifier](UIApplication, "displayIdentifier");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EDDCA61A = objc_msgSend(v1, "isEqualToString:", CFSTR("com.ios.uikit.TestingHarness"));

}

@end
