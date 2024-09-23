@implementation NSBundle(SafariCoreExtras)

- (id)safari_shortVersion
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_stringForKey:", *MEMORY[0x1E0C9AAF0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)safari_normalizedVersion
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "safari_version");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_stringByNormalizingVersionString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)safari_isSafariFamilyApplicationBundle
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(a1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "safari_isSafariFamilyBundleIdentifier:", v2);

  return v3;
}

+ (const)safari_safariApplicationPlatformBundleIdentifier
{
  return CFSTR("com.apple.mobilesafari");
}

+ (uint64_t)safari_isSafariFamilyBundleIdentifier:()SafariCoreExtras
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", CFSTR("com.apple.Safari")) & 1) != 0
    || (objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", CFSTR("com.apple.Safari.automation")) & 1) != 0
    || (objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", CFSTR("com.apple.SafariTechnologyPreview")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", CFSTR("com.apple.mobilesafari"));
  }

  return v4;
}

+ (id)safari_safariCoreBundle
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__NSBundle_SafariCoreExtras__safari_safariCoreBundle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (safari_safariCoreBundle_onceToken != -1)
    dispatch_once(&safari_safariCoreBundle_onceToken, block);
  return (id)safari_safariCoreBundle_bundle;
}

+ (id)safari_safariInjectedBundleURL
{
  if (safari_safariInjectedBundleURL_onceToken != -1)
    dispatch_once(&safari_safariInjectedBundleURL_onceToken, &__block_literal_global_5);
  return (id)safari_safariInjectedBundleURL_bundleURL;
}

+ (uint64_t)safari_currentTemplateAppName
{
  return 0;
}

- (uint64_t)safari_isInSyncAgent
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SafariBookmarksSyncAgent"));

  return v2;
}

- (id)safari_displayName
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_stringForKey:", *MEMORY[0x1E0C9AAC8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(v1, "safari_stringForKey:", *MEMORY[0x1E0C9AE88]);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)safari_localizedDisplayName
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a1, "localizedInfoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_stringForKey:", *MEMORY[0x1E0C9AAC8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(a1, "safari_displayName");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)safari_localizedShortVersion
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "localizedInfoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_stringForKey:", *MEMORY[0x1E0C9AAF0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(a1, "safari_shortVersion");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (uint64_t)safari_primaryLocalizationIsEnglish
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "preferredLocalizations");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
  {
    objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("English"));

  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (id)safari_version
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_stringForKey:", *MEMORY[0x1E0C9AE90]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)safari_isSafariWidgetExtensionBundle
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobilesafari.SafariWidgetExtension"));

  return v2;
}

+ (uint64_t)safari_isICloudAppWithBundleIdentifier:()SafariCoreExtras
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("com.apple.CloudKit.ShareBear");
  v8[1] = CFSTR("com.apple.bird");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (id)safari_passwordsAppBundle
{
  void *v1;
  uint64_t v2;
  void *v3;

  v1 = (void *)safari_passwordsAppBundle_bundle;
  if (!safari_passwordsAppBundle_bundle)
  {
    objc_msgSend(a1, "bundleWithIdentifier:", CFSTR("com.apple.Passwords"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)safari_passwordsAppBundle_bundle;
    safari_passwordsAppBundle_bundle = v2;

    v1 = (void *)safari_passwordsAppBundle_bundle;
  }
  return v1;
}

- (uint64_t)safari_isPasswordsAppBundle
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.Passwords"));

  return v2;
}

- (uint64_t)safari_isPasswordsMenuBarAppBundle
{
  return 0;
}

@end
