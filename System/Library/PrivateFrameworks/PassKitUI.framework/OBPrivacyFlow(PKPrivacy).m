@implementation OBPrivacyFlow(PKPrivacy)

+ (id)pk_privacyFlowForContext:()PKPrivacy
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  PKPrivacyBundleIdentifiersForContext(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") != 1)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("pk_privacyFlowForContext should only be called with a single option, but called with: %lu"), a3);
  v6 = (void *)MEMORY[0x1E0D65148];
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "flowWithBundle:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (uint64_t)pk_privacyContentVersionForContext:()PKPrivacy
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "pk_privacyFlowForContext:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "contentVersion");

  return v2;
}

@end
