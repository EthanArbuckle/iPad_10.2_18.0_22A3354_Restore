@implementation SFShowPhotosOneUpViewCommand(SearchUICompletion)

- (id)_searchui_overriddenExtensionString
{
  return +[SearchUICompletion localizedOpenString](SearchUICompletion, "localizedOpenString");
}

- (id)_searchui_completionImage
{
  void *v0;
  void *v1;

  +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 13);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIAppIconImage appIconForBundleIdentifier:variant:](SearchUIAppIconImage, "appIconForBundleIdentifier:variant:", v0, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
