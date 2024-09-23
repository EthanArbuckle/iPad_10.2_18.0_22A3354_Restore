@implementation NSBundle(UIAccessibilityLoader)

+ (id)accessibilityLocalBundleWithLastPathComponent:()UIAccessibilityLoader
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundlePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("AccessibilityBundles"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingPathComponent:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)accessibilityInternalBundleWithLastPathComponent:()UIAccessibilityLoader
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  AXInternalAccessibilityBundlesDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_accessibilitySetValue:forKey:storageMode:", v5, CFSTR("accessibilityBundlePath"), 1);

  return v6;
}

+ (id)_accessibilityBundleWithBundlePath:()UIAccessibilityLoader
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilitySetValue:forKey:storageMode:", v4, CFSTR("accessibilityBundlePath"), 1);

  return v5;
}

+ (id)accessibilityBundleWithLastPathComponent:()UIAccessibilityLoader
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  AXAccessibilityBundlesDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_accessibilityBundleWithBundlePath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)accessibilityMacCalystBundleWithLastPathComponent:()UIAccessibilityLoader
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  AXAccessibilityMacCatalystBundlesDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_accessibilityBundleWithBundlePath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)accessibilityBundlePath
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("accessibilityBundlePath"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "length"))
  {
    objc_msgSend(a1, "safeValueForKey:", CFSTR("_resolvedPath"));
    v3 = objc_claimAutoreleasedReturnValue();

    if (v3 || (objc_msgSend(a1, "bundlePath"), (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(a1, "_accessibilitySetValue:forKey:storageMode:", v3, CFSTR("accessibilityBundlePath"), 1);
      v2 = (void *)v3;
    }
    else
    {
      v2 = 0;
    }
  }
  return v2;
}

- (void)_loadAXBundleForBundleOffMainThread
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "safeValueForKey:", CFSTR("accessibilityBundlePath"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2 || objc_msgSend(v2, "rangeOfString:", kUIAccessibilityBundleExtension) == 0x7FFFFFFFFFFFFFFFLL)
  {
    AXLogLoading();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      v6 = 138412290;
      v7 = a1;
      _os_signpost_emit_with_name_impl(&dword_19D0DD000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LoadingBundlePostLaunch", "%@", (uint8_t *)&v6, 0xCu);
    }

    AXLogLoading();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = a1;
      _os_log_impl(&dword_19D0DD000, v5, OS_LOG_TYPE_INFO, "Bundle is causing _loadAXBundleForBundle (expensive!): %@", (uint8_t *)&v6, 0xCu);
    }

    +[UIAccessibilityLoader loadAccessibilityBundleForBundle:didLoadCallback:](UIAccessibilityLoader, "loadAccessibilityBundleForBundle:didLoadCallback:", a1, &__block_literal_global_7);
  }

}

@end
