@implementation SearchUIShowMoreCompletion

+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "card");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v7, "nextCard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v9 = 1;
    else
      v9 = objc_msgSend(a1, "resultIsContact:", v6);

  }
  return v9;
}

+ (BOOL)resultIsContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "applicationBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v3, "applicationBundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.CoreSuggestions"));

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)resultIsStoreSheet:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "storeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "action");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "action");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "requiresLocalMedia"))
        v7 = objc_msgSend(v3, "type") == 1;
      else
        v7 = 0;

    }
    else
    {
      v7 = objc_msgSend(v3, "type") == 1;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)prefixMatchExtensionString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SEARCH_RESULTS_SHOW_MORE_BUTTON_TITLE"), &stru_1EA1FB118, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)image
{
  return 0;
}

@end
