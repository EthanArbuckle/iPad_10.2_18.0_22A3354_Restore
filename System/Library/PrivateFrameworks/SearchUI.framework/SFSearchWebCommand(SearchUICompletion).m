@implementation SFSearchWebCommand(SearchUICompletion)

- (id)_searchui_prefixMatchExtensionStringWithCompletion:()SearchUICompletion
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;

  +[SearchUIUtilities defaultBrowserBundleIdentifier](SearchUIUtilities, "defaultBrowserBundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUICompletion localizedNameForBundleIdentifier:](SearchUICompletion, "localizedNameForBundleIdentifier:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    +[SearchUICompletion localizedOpenString](SearchUICompletion, "localizedOpenString");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (id)_searchui_completionImage
{
  void *v0;

  v0 = (void *)objc_opt_new();
  objc_msgSend(v0, "setIconType:", 1);
  return v0;
}

@end
