@implementation SFLaunchAppCommand(SearchUICompletion)

- (id)_searchui_prefixMatchExtensionStringWithCompletion:()SearchUICompletion
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "completionStringToMatch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) != 0)
  {
    +[SearchUICompletion localizedOpenString](SearchUICompletion, "localizedOpenString");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;

  return v9;
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
