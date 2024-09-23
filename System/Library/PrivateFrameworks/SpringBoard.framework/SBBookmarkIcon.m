@implementation SBBookmarkIcon

- (BOOL)representsWebApp
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "webApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBookmarkIcon applicationToLaunch](self, "applicationToLaunch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (id)applicationToLaunch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFString *v15;

  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHBookmarkIcon webClip](self, "webClip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "restrictionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isApplicationIdentifierRestricted:", v5);

    if ((v7 & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v3, "applicationWithBundleIdentifier:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[SBHBookmarkIcon webClip](self, "webClip");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "fullScreen");

    if (v10)
    {
      +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString webApplication](v11, "webApplication");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[SBBookmarkIcon _applicationRecordForDefaultBrowser](self, "_applicationRecordForDefaultBrowser");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bundleIdentifier");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v14 = v3;
        v15 = v11;
      }
      else
      {
        v15 = CFSTR("com.apple.mobilesafari");
        v14 = v3;
      }
      objc_msgSend(v14, "applicationWithBundleIdentifier:", v15);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v12;

  }
  return v8;
}

- (id)_applicationRecordForDefaultBrowser
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("http://"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBookmarkIcon.m"), 57, CFSTR("HTTP URL should always construct"));

  }
  v10 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA58A8]), "initWithURL:error:", v4, &v10);
  v6 = v5;
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v5, "bundleRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    v7 = 0;
  }

  return v7;
}

- (id)representedSceneIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  -[SBHBookmarkIcon webClip](self, "webClip");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)SBBookmarkIcon;
    -[SBIcon representedSceneIdentifier](&v9, sel_representedSceneIdentifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBHBookmarkIcon webClip](self, "webClip");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBWebApplication _webAppIdentifierFromWebClipIdentifier:](SBWebApplication, "_webAppIdentifierFromWebClipIdentifier:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

@end
