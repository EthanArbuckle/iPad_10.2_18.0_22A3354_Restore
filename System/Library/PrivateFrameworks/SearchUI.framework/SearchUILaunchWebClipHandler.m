@implementation SearchUILaunchWebClipHandler

+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "identifyingResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isLocalApplicationResult"))
  {
    objc_msgSend(v4, "applicationBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    v8 = 0;
    if (v7)
    {
      v8 = (void *)objc_opt_new();
      objc_msgSend(v4, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setClipIdentifier:", v9);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  void *v5;
  id v6;

  v5 = (void *)MEMORY[0x1E0DAB080];
  objc_msgSend(a3, "clipIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "launchWebClipWithIdentifier:origin:", v6, 2);

}

@end
