@implementation VSOnboardingInfoCenter

- (NSString)localizedButtonTitle
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE6E3F8], "bundleWithIdentifier:", CFSTR("com.apple.onboarding.tvprovider"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6E428], "flowWithBundle:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedButtonTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The privacyTitleOrNil parameter must not be nil."));

  return (NSString *)v4;
}

- (void)presentDetailsFromViewController:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The presentingViewController parameter must not be nil."));
  objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.tvprovider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentingViewController:", v4);
  objc_msgSend(v3, "present");

}

- (id)tvProviderPrivacyButtonViewController
{
  void *v2;

  objc_msgSend(MEMORY[0x24BE6E430], "linkWithBundleIdentifier:", CFSTR("com.apple.onboarding.tvprovider"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The linkController parameter must not be nil."));
  return v2;
}

- (id)tvAppPrivacyButtonViewController
{
  void *v2;

  objc_msgSend(MEMORY[0x24BE6E430], "linkWithBundleIdentifier:", CFSTR("com.apple.onboarding.tvapp"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The linkController parameter must not be nil."));
  return v2;
}

@end
