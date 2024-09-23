@implementation SearchUIRequestAppClipInstallHandler

+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "identifyingResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "preferredOpenableURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && objc_msgSend(v7, "hasClip"))
  {
    if ((objc_msgSend(v5, "isLocalApplicationResult") & 1) != 0)
    {
      objc_msgSend(v5, "applicationBundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      v12 = 0;
      if ((v11 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
    v12 = (void *)objc_opt_new();
    objc_msgSend(v4, "punchouts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferredOpenableURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUrl:", v14);

  }
  else
  {
    v12 = 0;
  }

LABEL_10:
  return v12;
}

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v5;

  objc_msgSend(a3, "url");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities requestClipInstallWithURL:completion:](SearchUIUtilities, "requestClipInstallWithURL:completion:", v5, 0);

}

- (unint64_t)destination
{
  return 8;
}

@end
