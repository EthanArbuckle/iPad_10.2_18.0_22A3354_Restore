@implementation SearchUIWebCompletion

+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "punchout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredOpenableURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v7, "punchoutOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferredOpenableURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13
      || (objc_msgSend(a1, "cardSectionIsWeb:", v7) & 1) != 0
      || objc_msgSend(v6, "type") == 29
      || objc_msgSend(v6, "type") == 28)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v6, "resultBundleId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.safari.userTypedURL"));

    }
  }

  return v10;
}

+ (BOOL)cardSectionIsWeb:(id)a3
{
  id v3;
  char isKindOfClass;
  BOOL v5;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (v3 && (isKindOfClass & 1) != 0)
    v5 = objc_msgSend(v3, "suggestionType") == 4;

  return v5;
}

- (id)image
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setIconType:", 1);
  return v2;
}

- (id)prefixMatchExtensionString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = (void *)objc_opt_class();
  +[SearchUIUtilities defaultBrowserBundleIdentifier](SearchUIUtilities, "defaultBrowserBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedNameForBundleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "localizedOpenString");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)nonPrefixMatchExtensionString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  -[SearchUICompletion result](self, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SearchUIWebCompletion;
    -[SearchUICompletion nonPrefixMatchExtensionString](&v10, sel_nonPrefixMatchExtensionString);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (BOOL)completionResultIsPotentiallyPunchout
{
  return 1;
}

@end
