@implementation SFOpenCoreSpotlightItemCommand(SearchUICompletion)

- (id)_searchui_prefixMatchExtensionStringWithCompletion:()SearchUICompletion
{
  return +[SearchUICompletion localizedOpenString](SearchUICompletion, "localizedOpenString");
}

- (id)_searchui_completionImage
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "applicationBundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIAppIconImage appIconForBundleIdentifier:variant:](SearchUIAppIconImage, "appIconForBundleIdentifier:variant:", v1, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
