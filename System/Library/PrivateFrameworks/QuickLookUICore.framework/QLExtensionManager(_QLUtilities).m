@implementation QLExtensionManager(_QLUtilities)

+ (id)extensionForItem:()_QLUtilities
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v3 = (void *)MEMORY[0x1E0D835D0];
  v4 = a3;
  objc_msgSend(v3, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previewItemContentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = 1;
  objc_msgSend(v5, "extensionForContentType:allowExtensionsForParentTypes:applicationBundleIdentifier:extensionPath:extensionType:generationType:shouldUseRestrictedExtension:", v6, 0, 0, 0, 0, 1, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)ql_isPreviewExtensionThatHaveCustomPresentationViewForItem:()_QLUtilities
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "extensionForItem:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "ql_isPreviewExtensionThatHaveCustomPresentationView");

  return v2;
}

+ (id)ql_previewExtensionCustomLoadingTimeForItem:()_QLUtilities
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "extensionForItem:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ql_previewExtensionCustomLoadingTime");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)ql_applicationBundleIdentifierOfExtensionForItem:()_QLUtilities
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "extensionForItem:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "QL_parentBundleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
