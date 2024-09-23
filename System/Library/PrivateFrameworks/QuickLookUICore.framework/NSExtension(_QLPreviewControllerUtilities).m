@implementation NSExtension(_QLPreviewControllerUtilities)

- (uint64_t)ql_isPreviewExtensionThatHaveCustomPresentationView
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("QLCustomLoadingView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)ql_previewExtensionCustomLoadingTime
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("QLCustomLoadingTimeout"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
