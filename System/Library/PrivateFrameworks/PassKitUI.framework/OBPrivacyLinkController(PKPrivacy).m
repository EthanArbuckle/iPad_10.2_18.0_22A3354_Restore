@implementation OBPrivacyLinkController(PKPrivacy)

+ (id)pk_privacyLinkForContext:()PKPrivacy
{
  void *v4;
  void *v5;

  PKPrivacyBundleIdentifiersForContext(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "linkWithBundleIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
