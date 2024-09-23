@implementation SFOpenPunchoutCommand(SearchUICompletion)

- (id)_searchui_prefixMatchExtensionStringWithCompletion:()SearchUICompletion
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  objc_msgSend(a1, "punchout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_alloc(MEMORY[0x1E0CA5870]);
    objc_msgSend(a1, "punchout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, 0);
    objc_msgSend(v7, "applicationState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isInstalled");

    v10 = 0;
    if (v9)
    {
      +[SearchUICompletion localizedOpenString](SearchUICompletion, "localizedOpenString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {

    v10 = 0;
  }
  return v10;
}

- (id)_searchui_completionImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "punchout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBundleIdentifier:", v4);

  return v2;
}

@end
