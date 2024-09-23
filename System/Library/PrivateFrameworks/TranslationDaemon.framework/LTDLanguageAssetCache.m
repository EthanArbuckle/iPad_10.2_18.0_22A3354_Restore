@implementation LTDLanguageAssetCache

void __32___LTDLanguageAssetCache_shared__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)shared__cache;
  shared__cache = v0;

}

uint64_t __44___LTDLanguageAssetCache_setRequiredAssets___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

BOOL __46___LTDLanguageAssetCache_assetsFilteredUsing___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "ltIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v5))
  {
    objc_msgSend(v3, "progress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "offlineState") == 2;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __46___LTDLanguageAssetCache_assetsFilteredUsing___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "ltIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

id __45___LTDLanguageAssetCache__multicastObservers__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;

  v2 = (objc_class *)MEMORY[0x24BDF6400];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "progress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fractionCompleted");
  v8 = v7;
  v9 = objc_msgSend(v3, "state");

  v10 = (void *)objc_msgSend(v4, "initWithLocale:progress:status:", v5, v9, v8);
  return v10;
}

id __45___LTDLanguageAssetCache__multicastObservers__block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x24BDF6400];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "status");

  v7 = (void *)objc_msgSend(v4, "initWithLocale:progress:status:", v5, v6, 0.0);
  return v7;
}

@end
