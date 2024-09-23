@implementation UIWebClip

+ (id)clipsIncludingWebClips:(BOOL)a3 includingAppClips:(BOOL)a4
{
  id v5;
  DIR *v6;
  DIR *v7;
  dirent *v8;
  dirent *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  _BOOL4 v20;
  _BOOL4 v21;
  id v22;

  v20 = a3;
  v21 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "webClipsDirectoryPath");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = opendir((const char *)objc_msgSend(v5, "fileSystemRepresentation"));
  if (v6)
  {
    v7 = v6;
    v8 = readdir(v6);
    if (v8)
    {
      v9 = v8;
      do
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v9->d_name);
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByDeletingPathExtension");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v5, "stringByAppendingPathComponent:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("Info.plist"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "fileExistsAtPath:", v14);

          if (v16)
          {
            +[UIWebClip webClipWithIdentifier:](UIWebClip, "webClipWithIdentifier:", v12);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17;
            if (v20 && v21
              || v21 && (objc_msgSend(v17, "isAppClip") & 1) != 0
              || v20 && (objc_msgSend(v18, "isAppClip") & 1) == 0)
            {
              objc_msgSend(v22, "addObject:", v18);
            }

          }
        }

        v9 = readdir(v7);
      }
      while (v9);
    }
    closedir(v7);
  }

  return v22;
}

+ (id)webClipsDirectoryPath
{
  void *v2;
  void *v3;

  objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Library/WebClips"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v2, 0);

  return v2;
}

+ (id)webClips
{
  return (id)objc_msgSend((id)objc_opt_class(), "clipsIncludingWebClips:includingAppClips:", 1, 0);
}

- (void)configureWithMetaTags:(id)a3 linkTags:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  v6 = (void *)MEMORY[0x1E0CB3A28];
  v7 = a4;
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_1E16EDF20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIWebClip setIdentifier:](self, "setIdentifier:", v10);
  objc_msgSend(v20, "objectForKey:", CFSTR("apple-mobile-web-app-title"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_web_stringByTrimmingWhitespace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "length"))
    -[UIWebClip setTitle:](self, "setTitle:", v12);
  v13 = (void *)objc_opt_class();
  objc_msgSend(v20, "_web_stringForKey:", CFSTR("apple-mobile-web-app-capable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "_webClipFullScreenValueForMetaTagContent:", v14);

  -[UIWebClip setFullScreen:](self, "setFullScreen:", v15);
  objc_msgSend(v20, "_web_stringForKey:", CFSTR("apple-mobile-web-app-status-bar-style"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  self->_webClipStatusBarStyle = UIWebClipStatusBarStyleForMetaTagContent(v16);

  v17 = (void *)objc_opt_class();
  objc_msgSend(v20, "_web_stringForKey:", CFSTR("Orientations"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "_webClipOrientationsForMetaTagContent:", v18);

  -[UIWebClip setSupportedOrientations:](self, "setSupportedOrientations:", v19);
  -[UIWebClip updateCustomMediaLocationsWithWebClipLinkTags:baseURL:](self, "updateCustomMediaLocationsWithWebClipLinkTags:baseURL:", v7, self->pageURL);

}

- (void)_readPropertiesFromBundle:(id)a3
{
  const __CFURL *v4;
  CFDictionaryRef v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  unint64_t v27;
  int64_t v28;
  void *v29;
  id v30;

  v30 = a3;
  objc_msgSend(v30, "bundleURL");
  v4 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v5 = CFBundleCopyInfoDictionaryForURL(v4);

  if (!v5)
    goto LABEL_85;
  -[__CFDictionary objectForKey:](v5, "objectForKey:", CFSTR("URL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:encodingInvalidCharacters:", v6, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIWebClip setPageURL:](self, "setPageURL:", v7);

    }
  }
  -[__CFDictionary objectForKey:](v5, "objectForKey:", CFSTR("Title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UIWebClip setTitle:](self, "setTitle:", v8);
  }
  -[__CFDictionary objectForKey:](v5, "objectForKey:", CFSTR("ConfigurationIsManaged"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      self->_configurationIsManaged = objc_msgSend(v9, "BOOLValue");
  }
  -[__CFDictionary objectForKey:](v5, "objectForKey:", CFSTR("ApplicationBundleIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&self->applicationBundleIdentifier, v10);
  }
  -[__CFDictionary objectForKey:](v5, "objectForKey:", CFSTR("PlaceholderBundleIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&self->placeholderBundleIdentifier, v11);
  }
  -[__CFDictionary objectForKey:](v5, "objectForKey:", CFSTR("ShortcutIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&self->_shortcutIdentifier, v12);
  }
  -[__CFDictionary objectForKey:](v5, "objectForKey:", CFSTR("FullScreen"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UIWebClip setFullScreen:](self, "setFullScreen:", objc_msgSend(v13, "BOOLValue"));
  }
  -[__CFDictionary objectForKey:](v5, "objectForKey:", CFSTR("ClassicMode"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UIWebClip setClassicMode:](self, "setClassicMode:", objc_msgSend(v14, "BOOLValue"));
  }
  -[__CFDictionary objectForKey:](v5, "objectForKey:", CFSTR("Eligibility"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      self->_eligibilityStatus = objc_msgSend(v15, "unsignedIntegerValue");
  }
  -[__CFDictionary objectForKey:](v5, "objectForKey:", CFSTR("IconIsScreenShotBased"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      self->iconIsScreenShotBased = objc_msgSend(v16, "BOOLValue");
  }
  -[__CFDictionary objectForKey:](v5, "objectForKey:", CFSTR("IconIsPrecomposed"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      *(_WORD *)&self->iconIsPrecomposed = objc_msgSend(v17, "BOOLValue");
  }
  -[__CFDictionary objectForKey:](v5, "objectForKey:", CFSTR("ApplicationBundleVersion"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v19 = objc_msgSend(v18, "unsignedIntegerValue");
  else
    v19 = 0;
  self->bundleVersion = v19;
  -[__CFDictionary objectForKey:](v5, "objectForKey:", CFSTR("IsAppClip"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && -[NSString length](self->applicationBundleIdentifier, "length")
      && !-[NSString isEqualToString:](self->applicationBundleIdentifier, "isEqualToString:", CFSTR("com.apple.shortcuts")))
    {
      -[UIWebClip setIsAppClip:](self, "setIsAppClip:", objc_msgSend(v20, "BOOLValue"));
    }
  }
  -[__CFDictionary objectForKey:](v5, "objectForKey:", CFSTR("ScenelessBackgroundLaunch"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      self->_scenelessBackgroundLaunch = objc_msgSend(v21, "BOOLValue");
  }
  -[__CFDictionary objectForKey:](v5, "objectForKey:", CFSTR("RemovalDisallowed"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    if (!self->_isAppClip)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[UIWebClip setRemovalDisallowed:](self, "setRemovalDisallowed:", objc_msgSend(v22, "BOOLValue"));
    }
  }
  -[__CFDictionary objectForKey:](v5, "objectForKey:", CFSTR("ContentMode"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UIWebClip setContentModeWithString:](self, "setContentModeWithString:", v23);
  }
  -[__CFDictionary objectForKey:](v5, "objectForKey:", CFSTR("IgnoreManifestScope"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      self->_ignoreManifestScope = objc_msgSend(v24, "BOOLValue");
  }
  -[__CFDictionary objectForKey:](v5, "objectForKey:", CFSTR("WebClipStatusBarStyle"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v26 = v25;
    if (objc_msgSend(v26, "caseInsensitiveCompare:", CFSTR("UIWebClipStatusBarStyleDefault")))
    {
      if (objc_msgSend(v26, "caseInsensitiveCompare:", CFSTR("UIWebClipStatusBarStyleLegacyBlack")))
      {
        if (objc_msgSend(v26, "caseInsensitiveCompare:", CFSTR("UIWebClipStatusBarStyleLegacyBlackTranslucent")))
        {
          if (objc_msgSend(v26, "caseInsensitiveCompare:", CFSTR("UIWebClipStatusBarStyleHidden")))
          {
            if (objc_msgSend(v26, "caseInsensitiveCompare:", CFSTR("UIWebClipStatusBarStyleLightContent")))
            {
              if (objc_msgSend(v26, "caseInsensitiveCompare:", CFSTR("UIWebClipStatusBarStyleDarkContent")))
                v27 = 0;
              else
                v27 = 5;
            }
            else
            {
              v27 = 4;
            }
          }
          else
          {
            v27 = 3;
          }
        }
        else
        {
          v27 = 2;
        }
      }
      else
      {
        v27 = 1;
      }
    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    -[__CFDictionary objectForKey:](v5, "objectForKey:", CFSTR("UIStatusBarStyle"));
    v26 = (id)objc_claimAutoreleasedReturnValue();

    if (!v26)
      goto LABEL_81;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_81;
    v28 = +[UIApplication statusBarStyleForString:](UIApplication, "statusBarStyleForString:", v26);
    if (v28 == 2)
    {
      v27 = 1;
    }
    else if (v28 == 1)
    {
      v27 = 2;
    }
    else
    {
      v27 = 0;
    }
  }
  self->_webClipStatusBarStyle = v27;
LABEL_81:
  -[__CFDictionary objectForKey:](v5, "objectForKey:", CFSTR("Orientations"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UIWebClip setSupportedOrientations:](self, "setSupportedOrientations:", objc_msgSend(v29, "unsignedIntValue"));
  }

LABEL_85:
}

- (void)_reloadProperties
{
  void *v3;
  void *v4;
  void *v5;

  +[UIWebClip urlForWebClipWithIdentifier:](UIWebClip, "urlForWebClipWithIdentifier:", self->identifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWebClip _readPropertiesFromBundle:](self, "_readPropertiesFromBundle:", v4);

    v3 = v5;
  }

}

- (NSURL)pageURL
{
  NSURL *pageURL;
  NSURL *v4;

  pageURL = self->pageURL;
  if (!pageURL)
  {
    -[UIWebClip _reloadProperties](self, "_reloadProperties");
    pageURL = self->pageURL;
    if (!pageURL)
    {
      if (!self->applicationBundleIdentifier)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("about:blank"));
        v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
      pageURL = 0;
    }
  }
  v4 = pageURL;
  return v4;
}

- (NSString)title
{
  NSString *title;
  __CFString *v4;

  title = self->title;
  if (title || (-[UIWebClip _reloadProperties](self, "_reloadProperties"), (title = self->title) != 0))
    v4 = title;
  else
    v4 = CFSTR("Untitled");
  return (NSString *)v4;
}

- (NSString)applicationBundleIdentifier
{
  __CFString *v3;
  NSString *applicationBundleIdentifier;

  if (!self->applicationBundleIdentifier)
    -[UIWebClip _reloadProperties](self, "_reloadProperties");
  if (self->_isAppClip && self->_scenelessBackgroundLaunch)
  {
    v3 = CFSTR("com.apple.ClipViewService");
  }
  else
  {
    applicationBundleIdentifier = self->applicationBundleIdentifier;
    if (applicationBundleIdentifier)
      v3 = applicationBundleIdentifier;
    else
      v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)placeholderBundleIdentifier
{
  NSString *placeholderBundleIdentifier;

  placeholderBundleIdentifier = self->placeholderBundleIdentifier;
  if (!placeholderBundleIdentifier)
  {
    -[UIWebClip _reloadProperties](self, "_reloadProperties");
    placeholderBundleIdentifier = self->placeholderBundleIdentifier;
  }
  return placeholderBundleIdentifier;
}

- (void)setFullScreen:(BOOL)a3
{
  self->fullScreen = a3;
}

- (BOOL)fullScreen
{
  -[UIWebClip _reloadProperties](self, "_reloadProperties");
  return self->_eligibilityStatus != 2 && self->fullScreen;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (!self->_configurationIsManaged
    || (objc_msgSend(v5, "lowercaseString"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("com.apple")),
        v6,
        v8 = v9,
        (v7 & 1) == 0))
  {
    objc_storeStrong((id *)&self->applicationBundleIdentifier, a3);
    v8 = v9;
  }

}

- (NSURL)applicationLaunchURL
{
  const __CFString *v3;
  void *v4;
  void *v5;

  if (self->_isAppClip && self->_scenelessBackgroundLaunch)
  {
    v3 = CFSTR("appclip:");
  }
  else
  {
    if (self->applicationBundleIdentifier || !-[UIWebClip fullScreen](self, "fullScreen"))
    {
      -[UIWebClip pageURL](self, "pageURL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return (NSURL *)v4;
    }
    -[UIWebClip identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v4 = 0;
      return (NSURL *)v4;
    }
    v3 = CFSTR("webapp:");
  }
  -[UIWebClip _launchURLWithScheme:](self, "_launchURLWithScheme:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return (NSURL *)v4;
}

- (id)_launchURLWithScheme:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0C99E98];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  -[UIWebClip identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSUserActivity)appClipUserActivity
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (self->_isAppClip && self->pageURL)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3B10]);
    v4 = (void *)objc_msgSend(v3, "initWithActivityType:", *MEMORY[0x1E0CB3418]);
    objc_msgSend(v4, "setWebpageURL:", self->pageURL);
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v5 = (void *)qword_1ECD82908;
    v13 = qword_1ECD82908;
    if (!qword_1ECD82908)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getAPActivationPayloadClass_block_invoke;
      v9[3] = &unk_1E16B14C0;
      v9[4] = &v10;
      __getAPActivationPayloadClass_block_invoke((uint64_t)v9);
      v5 = (void *)v11[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v10, 8);
    v7 = (void *)objc_msgSend([v6 alloc], "initWithURL:", self->pageURL);
    objc_msgSend(v4, "setAppClipActivationPayload:", v7);

  }
  else
  {
    v4 = 0;
  }
  return (NSUserActivity *)v4;
}

- (id)_info
{
  id v3;
  NSURL *pageURL;
  void *v5;
  NSString *title;
  NSString *applicationBundleIdentifier;
  NSString *placeholderBundleIdentifier;
  NSString *shortcutIdentifier;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t contentMode;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t webClipStatusBarStyle;
  __CFString *v24;
  void *v25;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  pageURL = self->pageURL;
  if (pageURL)
  {
    -[NSURL absoluteString](pageURL, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("URL"));

  }
  title = self->title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("Title"));
  applicationBundleIdentifier = self->applicationBundleIdentifier;
  if (applicationBundleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", applicationBundleIdentifier, CFSTR("ApplicationBundleIdentifier"));
  placeholderBundleIdentifier = self->placeholderBundleIdentifier;
  if (placeholderBundleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", placeholderBundleIdentifier, CFSTR("PlaceholderBundleIdentifier"));
  shortcutIdentifier = self->_shortcutIdentifier;
  if (shortcutIdentifier)
    objc_msgSend(v3, "setObject:forKey:", shortcutIdentifier, CFSTR("ShortcutIdentifier"));
  if (self->removalDisallowed)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("RemovalDisallowed"));

  }
  if (self->bundleVersion)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("ApplicationBundleVersion"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->fullScreen);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("FullScreen"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->classicMode);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("ClassicMode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_eligibilityStatus);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("Eligibility"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAppClip);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("IsAppClip"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_scenelessBackgroundLaunch);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("ScenelessBackgroundLaunch"));

  contentMode = self->_contentMode;
  if (contentMode > 2)
    v18 = 0;
  else
    v18 = off_1E16EC938[contentMode];
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("ContentMode"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ignoreManifestScope);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("IgnoreManifestScope"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_configurationIsManaged);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("ConfigurationIsManaged"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->iconIsScreenShotBased);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("IconIsScreenShotBased"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->iconIsPrecomposed);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("IconIsPrecomposed"));

  webClipStatusBarStyle = self->_webClipStatusBarStyle;
  if (webClipStatusBarStyle > 5)
    v24 = 0;
  else
    v24 = off_1E16EC950[webClipStatusBarStyle];
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("WebClipStatusBarStyle"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->supportedOrientations);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("Orientations"));

  return v3;
}

- (void)setContentModeWithString:(id)a3
{
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsString:", CFSTR("mobile")) & 1) != 0)
  {
    v5 = 1;
  }
  else if (objc_msgSend(v4, "containsString:", CFSTR("desktop")))
  {
    v5 = 2;
  }
  else
  {
    v5 = 0;
  }

  self->_contentMode = v5;
}

- (BOOL)_writeImage:(id)a3 toDiskWithFileName:(id)a4
{
  id v6;
  void *v7;
  NSString *identifier;
  id v9;
  void *v10;
  void *v11;
  const __CFURL *v12;
  CGImageDestination *v13;
  CGImageDestination *v14;
  BOOL v15;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99E98];
  identifier = self->identifier;
  v9 = a4;
  +[UIWebClip pathForWebClipWithIdentifier:](UIWebClip, "pathForWebClipWithIdentifier:", identifier);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fileURLWithPath:", v11);
  v12 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

  v13 = CGImageDestinationCreateWithURL(v12, CFSTR("public.png"), 1uLL, 0);
  if (v13)
  {
    v14 = v13;
    CGImageDestinationAddImage(v13, (CGImageRef)objc_msgSend(v6, "imageRef"), 0);
    v15 = CGImageDestinationFinalize(v14);
    CFRelease(v14);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)_writeIconImage:(id)a3 toDiskWithFileName:(id)a4
{
  id v6;
  _BOOL4 v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[UIWebClip _writeImage:toDiskWithFileName:](self, "_writeImage:toDiskWithFileName:", a3, v6);
  v8 = v7;
  if (a3 && v7)
  {
    +[UIWebClip pathForWebClipWithIdentifier:](UIWebClip, "pathForWebClipWithIdentifier:", self->identifier);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0CB2AD8];
    v18[0] = *MEMORY[0x1E0CB2AE0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v13 = objc_msgSend(v11, "setAttributes:ofItemAtPath:error:", v12, v10, &v16);
    v14 = v16;

    if ((v13 & 1) == 0)
      NSLog(CFSTR("Couldn't change WebClip icon's data protection class: %@"), v14);

  }
  return v8;
}

- (id)_createPlaceholderBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[UIWebClip identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("com.apple.WebKit.PushBundle.%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_requiresPlaceholderBundle
{
  return self->fullScreen && self->applicationBundleIdentifier == 0;
}

- (BOOL)_hasPlaceholderBundle
{
  UIWebClip *v2;
  uint64_t v3;
  NSString *placeholderBundleIdentifier;
  id v5;
  NSString *v6;
  void *v7;
  uint64_t v9;

  v2 = self;
  -[UIWebClip _createPlaceholderBundleIdentifier](self, "_createPlaceholderBundleIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  placeholderBundleIdentifier = v2->placeholderBundleIdentifier;
  v2->placeholderBundleIdentifier = (NSString *)v3;

  v5 = objc_alloc(MEMORY[0x1E0CA5870]);
  v6 = v2->placeholderBundleIdentifier;
  v9 = 0;
  v7 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:allowPlaceholder:error:", v6, 1, &v9);
  LOBYTE(v2) = v7 != 0;

  return (char)v2;
}

- (BOOL)ensurePlaceholderBundle
{
  BOOL v4;

  if (!-[UIWebClip _requiresPlaceholderBundle](self, "_requiresPlaceholderBundle")
    || -[UIWebClip _hasPlaceholderBundle](self, "_hasPlaceholderBundle"))
  {
    return 1;
  }
  if (!self->manifestId)
    objc_storeStrong((id *)&self->manifestId, self->pageURL);
  v4 = -[UIWebClip _createApplicationRecord](self, "_createApplicationRecord");
  -[UIWebClip updateOnDisk](self, "updateOnDisk");
  return v4;
}

- (BOOL)_createApplicationRecord
{
  NSString *v3;
  NSString *placeholderBundleIdentifier;
  void *v5;
  id IXAppInstallCoordinatorClass;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  objc_class *v14;
  id v15;
  NSString *title;
  NSString *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  NSURL *manifestId;
  void *v23;
  void *v24;
  NSString *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  BOOL v31;
  NSString *v32;
  void *v33;
  char v34;
  id v35;
  NSString *v36;
  void *v37;
  objc_class *v38;
  id v39;
  void *v40;
  char v41;
  id v42;
  UIImage *v43;
  void *v44;
  char v45;
  id v46;
  NSString *v47;
  void *v48;
  NSString *v49;
  void *v50;
  void *v51;
  NSString *v52;
  void *v53;
  char v54;
  id v55;
  char v56;
  char v57;
  NSString *v58;
  void *v59;
  NSString *v60;
  void *v61;
  NSString *v62;
  void *v63;
  id v64;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  id v86;
  char v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void (*v91)(uint64_t);
  void *v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD v98[4];
  _QWORD v99[4];
  const __CFString *v100;
  _QWORD v101[3];

  v101[1] = *MEMORY[0x1E0C80C00];
  -[UIWebClip _createPlaceholderBundleIdentifier](self, "_createPlaceholderBundleIdentifier");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  placeholderBundleIdentifier = self->placeholderBundleIdentifier;
  self->placeholderBundleIdentifier = v3;

  v5 = (void *)objc_msgSend(objc_alloc((Class)getIXApplicationIdentityClass()), "initWithBundleIdentifier:", self->placeholderBundleIdentifier);
  IXAppInstallCoordinatorClass = getIXAppInstallCoordinatorClass();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = 0;
  objc_msgSend(IXAppInstallCoordinatorClass, "cancelCoordinatorForAppWithIdentity:withReason:client:error:", v5, v7, 25, &v88);

  v87 = 0;
  v94 = 0;
  v95 = &v94;
  v96 = 0x2050000000;
  v8 = (void *)qword_1ECD82918;
  v97 = qword_1ECD82918;
  if (!qword_1ECD82918)
  {
    v89 = MEMORY[0x1E0C809B0];
    v90 = 3221225472;
    v91 = __getIXRestoringDemotedAppInstallCoordinatorClass_block_invoke;
    v92 = &unk_1E16B14C0;
    v93 = &v94;
    __getIXRestoringDemotedAppInstallCoordinatorClass_block_invoke((uint64_t)&v89);
    v8 = (void *)v95[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v94, 8);
  v86 = 0;
  objc_msgSend(v9, "processScopedCoordinatorForAppWithIdentity:withClientID:createIfNotExisting:created:error:", v5, 25, 1, &v87, &v86);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v86;
  v12 = v11;
  if (v10)
  {
    if (v87)
    {
      objc_msgSend(v10, "setObserver:", self);
      v94 = 0;
      v95 = &v94;
      v96 = 0x2050000000;
      v13 = (void *)qword_1ECD82920;
      v97 = qword_1ECD82920;
      if (!qword_1ECD82920)
      {
        v89 = MEMORY[0x1E0C809B0];
        v90 = 3221225472;
        v91 = __getIXPlaceholderClass_block_invoke;
        v92 = &unk_1E16B14C0;
        v93 = &v94;
        __getIXPlaceholderClass_block_invoke((uint64_t)&v89);
        v13 = (void *)v95[3];
      }
      v14 = objc_retainAutorelease(v13);
      _Block_object_dispose(&v94, 8);
      v15 = [v14 alloc];
      title = self->title;
      v17 = self->placeholderBundleIdentifier;
      v83 = v12;
      v18 = (void *)objc_msgSend(v15, "initAppPlaceholderWithBundleName:bundleID:installType:client:error:", title, v17, 8, 25, &v83);
      v19 = v83;

      if (!v18)
      {
        v32 = self->placeholderBundleIdentifier;
        objc_msgSend(v19, "description");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("Unable to create placeholder for bundle %@ Error: %@"), v32, v33);

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 1, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = v19;
        objc_msgSend(v10, "cancelForReason:client:error:", v12, 25, &v82);
        v30 = v82;
        v31 = 0;
LABEL_45:

        goto LABEL_46;
      }
      v94 = 0;
      v95 = &v94;
      v96 = 0x2050000000;
      v20 = (void *)qword_1ECD82928;
      v97 = qword_1ECD82928;
      if (!qword_1ECD82928)
      {
        v89 = MEMORY[0x1E0C809B0];
        v90 = 3221225472;
        v91 = __getIXPlaceholderAttributesClass_block_invoke;
        v92 = &unk_1E16B14C0;
        v93 = &v94;
        __getIXPlaceholderAttributesClass_block_invoke((uint64_t)&v89);
        v20 = (void *)v95[3];
      }
      v21 = objc_retainAutorelease(v20);
      _Block_object_dispose(&v94, 8);
      v12 = (void *)objc_opt_new();
      objc_msgSend(v12, "setLaunchProhibited:", 1);
      manifestId = self->manifestId;
      if (manifestId)
      {
        v100 = CFSTR("manifestId");
        -[NSURL absoluteString](manifestId, "absoluteString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v101[0] = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, &v100, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setWebKitPushBundleMetadata:", v24);

      }
      else
      {
        NSLog(CFSTR("No manifestId for bundle %@"), self->placeholderBundleIdentifier);
      }
      v81 = v19;
      v34 = objc_msgSend(v18, "setPlaceholderAttributes:error:", v12, &v81);
      v35 = v81;

      if ((v34 & 1) == 0)
      {
        v49 = self->placeholderBundleIdentifier;
        objc_msgSend(v35, "description");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("Unable to set placeholder attributes for bundle %@ Error: %@"), v49, v50);

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 1, 0);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v80 = v35;
        objc_msgSend(v10, "cancelForReason:client:error:", v19, 25, &v80);
        v30 = v80;
        v31 = 0;
LABEL_44:

        goto LABEL_45;
      }
      v36 = self->placeholderBundleIdentifier;
      v98[0] = CFSTR("com.apple.private.usernotifications.bundle-identifiers");
      v98[1] = CFSTR("com.apple.private.usernotifications.notification-simulator");
      v99[0] = v36;
      v99[1] = MEMORY[0x1E0C9AAB0];
      v98[2] = CFSTR("com.apple.developer.app-management-domain");
      v98[3] = CFSTR("com.apple.private.webkit.pushbundle");
      v99[2] = CFSTR("com.apple.WebKit.PushBundles");
      v99[3] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, v98, 4);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v94 = 0;
      v95 = &v94;
      v96 = 0x2050000000;
      v37 = (void *)qword_1ECD82930;
      v97 = qword_1ECD82930;
      if (!qword_1ECD82930)
      {
        v89 = MEMORY[0x1E0C809B0];
        v90 = 3221225472;
        v91 = __getIXPromisedInMemoryDictionaryClass_block_invoke;
        v92 = &unk_1E16B14C0;
        v93 = &v94;
        __getIXPromisedInMemoryDictionaryClass_block_invoke((uint64_t)&v89);
        v37 = (void *)v95[3];
      }
      v38 = objc_retainAutorelease(v37);
      _Block_object_dispose(&v94, 8);
      v39 = [v38 alloc];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Entitlements Promise for %@"), self->placeholderBundleIdentifier);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v39, "initWithName:client:dictionary:", v40, 25, v19);

      if (v69)
      {

        v78 = 0;
        v41 = objc_msgSend(v18, "setEntitlementsPromise:error:", v69, &v78);
        v42 = v78;
        v35 = v42;
        if ((v41 & 1) != 0)
        {
          -[UIWebClip iconImage](self, "iconImage");
          v43 = (UIImage *)objc_claimAutoreleasedReturnValue();
          v44 = v43;
          if (v43)
          {
            UIImagePNGRepresentation(v43);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            if (v67)
            {
              v66 = (void *)objc_msgSend(objc_alloc((Class)getIXPromisedInMemoryDataClass()), "initWithName:client:data:", CFSTR("Placeholder icon"), 25, v67);
              v76 = v35;
              v45 = objc_msgSend(v18, "setIconPromise:error:", v66, &v76);
              v46 = v76;

              if ((v45 & 1) == 0)
              {
                v47 = self->placeholderBundleIdentifier;
                objc_msgSend(v46, "description");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                NSLog(CFSTR("Failed to set placeholder icon promise for bundle %@ Error: %@"), v47, v48);

              }
            }
            else
            {
              NSLog(CFSTR("Failed to set placeholder icon promise for bundle %@. Icon could not be converted to PNG representation."), self->placeholderBundleIdentifier);
              v46 = v35;
            }

          }
          else
          {
            NSLog(CFSTR("Failed to set placeholder icon promise for bundle %@. Icon was nil."), self->placeholderBundleIdentifier);
            v46 = v35;
          }
          v75 = v46;
          v54 = objc_msgSend(v18, "setConfigurationCompleteWithError:", &v75);
          v55 = v75;

          if ((v54 & 1) != 0)
          {
            v73 = v55;
            v56 = objc_msgSend(v10, "setPlaceholderPromise:error:", v18, &v73);
            v68 = v73;

            if ((v56 & 1) != 0)
            {
              v35 = (id)objc_msgSend(objc_alloc((Class)getIXPromisedOutOfBandTransferClass()), "initWithName:client:diskSpaceNeeded:", CFSTR("Empty user data promise"), 25, 0);
              objc_msgSend(v35, "setPercentComplete:", 1.0);
              objc_msgSend(v35, "setComplete:", 1);
              v71 = v68;
              v57 = objc_msgSend(v10, "setUserDataPromise:error:", v35, &v71);
              v30 = v71;

              if ((v57 & 1) != 0)
              {
                v31 = 1;
LABEL_43:

                v35 = (id)v69;
                goto LABEL_44;
              }
              v62 = self->placeholderBundleIdentifier;
              objc_msgSend(v30, "description");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              NSLog(CFSTR("Failed to set user data promise for bundle %@ Error: %@"), v62, v63);

              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 1, 0);
              v55 = (id)objc_claimAutoreleasedReturnValue();
              v70 = v30;
              objc_msgSend(v10, "cancelForReason:client:error:", v55, 25, &v70);
              v64 = v70;

              v30 = v64;
            }
            else
            {
              v60 = self->placeholderBundleIdentifier;
              objc_msgSend(v68, "description");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              NSLog(CFSTR("Failed to set placeholder promise for bundle %@ Error: %@"), v60, v61);

              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 1, 0);
              v35 = (id)objc_claimAutoreleasedReturnValue();
              v72 = v68;
              objc_msgSend(v10, "cancelForReason:client:error:", v35, 25, &v72);
              v30 = v72;
              v55 = v68;
            }
          }
          else
          {
            v58 = self->placeholderBundleIdentifier;
            objc_msgSend(v55, "description");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            NSLog(CFSTR("Failed to set placeholder entitlements promise complete for bundle %@ Error: %@"), v58, v59);

            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 1, 0);
            v35 = (id)objc_claimAutoreleasedReturnValue();
            v74 = v55;
            objc_msgSend(v10, "cancelForReason:client:error:", v35, 25, &v74);
            v30 = v74;
          }

LABEL_42:
          v31 = 0;
          goto LABEL_43;
        }
        v52 = self->placeholderBundleIdentifier;
        objc_msgSend(v42, "description");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("Failed to set placeholder entitlements promise for bundle %@ Error: %@"), v52, v53);

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 1, 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = v35;
        objc_msgSend(v10, "cancelForReason:client:error:", v44, 25, &v77);
        v51 = v77;
      }
      else
      {
        NSLog(CFSTR("Unable to create placeholder entitlements for bundle, %@"), self->placeholderBundleIdentifier);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 1, 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v35;
        objc_msgSend(v10, "cancelForReason:client:error:", v44, 25, &v79);
        v51 = v79;
      }
      v30 = v51;
      goto LABEL_42;
    }
    NSLog(CFSTR("Existing install coordinator for app bundle identifier %@ was found. This is unexpected."), self->placeholderBundleIdentifier);
    v29 = getIXAppInstallCoordinatorClass();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 1, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v12;
    objc_msgSend(v29, "cancelCoordinatorForAppWithIdentity:withReason:client:error:", v5, v18, 25, &v84);
    v28 = v84;
  }
  else
  {
    v25 = self->placeholderBundleIdentifier;
    objc_msgSend(v11, "description");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Unable to create install coordinator for app bundle identifier %@ Error: %@"), v25, v26);

    v27 = getIXAppInstallCoordinatorClass();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 1, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v12;
    objc_msgSend(v27, "cancelCoordinatorForAppWithIdentity:withReason:client:error:", v5, v18, 25, &v85);
    v28 = v85;
  }
  v30 = v28;
  v31 = 0;
LABEL_46:

  return v31;
}

- (BOOL)updateOnDisk
{
  BOOL v2;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  UIImage *iconImage;
  UIImage *darkIconImage;
  UIImage *tintableIconImage;
  UIImage *startupImage;
  UIImage *startupLandscapeImage;
  UIImage *initialLaunchImage;
  UIImage *v18;
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (!self->_isAppClip)
  {
    +[UIWebClip pathForWebClipWithIdentifier:](UIWebClip, "pathForWebClipWithIdentifier:", self->identifier);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Info.plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWebClip _info](self, "_info");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "writeToFile:atomically:", v5, 1);

    if ((v7 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *MEMORY[0x1E0CB2AD8];
      v22[0] = *MEMORY[0x1E0CB2AE0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      v10 = objc_msgSend(v8, "setAttributes:ofItemAtPath:error:", v9, v5, &v20);
      v11 = v20;

      if ((v10 & 1) == 0)
        NSLog(CFSTR("Couldn't change WebClip Info.plist's data protection class: %@"), v11);
      iconImage = self->iconImage;
      if (iconImage
        && !-[UIWebClip _writeIconImage:toDiskWithFileName:](self, "_writeIconImage:toDiskWithFileName:", iconImage, CFSTR("icon.png")))
      {
        NSLog(CFSTR("Could not save WebClip icon"));
      }
      else
      {
        darkIconImage = self->darkIconImage;
        if (darkIconImage
          && !-[UIWebClip _writeIconImage:toDiskWithFileName:](self, "_writeIconImage:toDiskWithFileName:", darkIconImage, CFSTR("dark-icon.png")))
        {
          NSLog(CFSTR("Could not save WebClip dark icon"));
        }
        else
        {
          tintableIconImage = self->tintableIconImage;
          if (tintableIconImage
            && !-[UIWebClip _writeIconImage:toDiskWithFileName:](self, "_writeIconImage:toDiskWithFileName:", tintableIconImage, CFSTR("tintable-icon.png")))
          {
            NSLog(CFSTR("Could not save WebClip tintable icon"));
          }
          else
          {
            startupImage = self->startupImage;
            if (startupImage
              && !-[UIWebClip _writeImage:toDiskWithFileName:](self, "_writeImage:toDiskWithFileName:", startupImage, CFSTR("startup.png")))
            {
              NSLog(CFSTR("Could not save WebClip startup image"));
            }
            else
            {
              startupLandscapeImage = self->startupLandscapeImage;
              if (startupLandscapeImage
                && !-[UIWebClip _writeImage:toDiskWithFileName:](self, "_writeImage:toDiskWithFileName:", startupLandscapeImage, CFSTR("startup-landscape.png")))
              {
                NSLog(CFSTR("Could not save WebClip startup landscape image"));
              }
              else
              {
                initialLaunchImage = self->initialLaunchImage;
                if (!initialLaunchImage
                  || -[UIWebClip _writeImage:toDiskWithFileName:](self, "_writeImage:toDiskWithFileName:", initialLaunchImage, CFSTR("initial-launch-image.png")))
                {
                  v18 = self->iconImage;
                  self->iconImage = 0;

                  -[UIWebClip setDarkIconImage:](self, "setDarkIconImage:", 0);
                  -[UIWebClip setTintableIconImage:](self, "setTintableIconImage:", 0);
                  -[UIWebClip setStartupImage:](self, "setStartupImage:", 0);
                  -[UIWebClip setStartupLandscapeImage:](self, "setStartupLandscapeImage:", 0);
                  -[UIWebClip setInitialLaunchImage:](self, "setInitialLaunchImage:", 0);

                  v2 = 1;
LABEL_28:

                  return v2;
                }
                NSLog(CFSTR("Could not save WebClip initial launch image"));
              }
            }
          }
        }
      }

    }
    else
    {
      NSLog(CFSTR("Couldn't save WebClip Info.plist"));
    }
    v2 = 0;
    goto LABEL_28;
  }
  NSLog(CFSTR("-[UIWebClip updateOnDisk] doesn't support updating app clips on disk. Attempting to do so may result in data loss. Use -[CPSWebClip updateOnDisk] from <ClipServices/CPSWebClip.h> instead."), a2);
  return 0;
}

- (BOOL)createOnDisk
{
  BOOL v2;
  void *v4;
  void *v5;
  void *v6;

  if (self->_isAppClip)
  {
    NSLog(CFSTR("-[UIWebClip createOnDisk] doesn't support creating app clips on disk. Attempting to do so may result in data loss. Use -[CPSWebClip createOnDisk] from <ClipServices/CPSWebClip.h> instead."), a2);
    return 0;
  }
  else
  {
    +[UIWebClip pathForWebClipWithIdentifier:](UIWebClip, "pathForWebClipWithIdentifier:", self->identifier);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_web_pathWithUniqueFilenameForPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 0, 0, 0) & 1) != 0)
    {
      if (-[UIWebClip _requiresPlaceholderBundle](self, "_requiresPlaceholderBundle"))
        -[UIWebClip _createApplicationRecord](self, "_createApplicationRecord");
      if (!self->bundleVersion)
        self->bundleVersion = 1;
      v2 = -[UIWebClip updateOnDisk](self, "updateOnDisk");
    }
    else
    {
      NSLog(CFSTR("Couldn't create WebClip bundle"));
      v2 = 0;
    }

  }
  return v2;
}

- (BOOL)removeFromDisk
{
  void *v4;
  void *v5;
  char v6;
  _QWORD v7[5];

  if (-[UIWebClip _requiresPlaceholderBundle](self, "_requiresPlaceholderBundle"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __27__UIWebClip_removeFromDisk__block_invoke;
    v7[3] = &unk_1E16B3FD8;
    v7[4] = self;
    -[UIWebClip _removePlaceholderBundleWithCompletion:](self, "_removePlaceholderBundleWithCompletion:", v7);
    return 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIWebClip pathForWebClipWithIdentifier:](UIWebClip, "pathForWebClipWithIdentifier:", self->identifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "removeItemAtPath:error:", v5, 0);

    return v6;
  }
}

void __27__UIWebClip_removeFromDisk__block_invoke(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  if ((a2 & 1) != 0)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v3 = (void *)qword_1ECD82938;
    v14 = qword_1ECD82938;
    v4 = MEMORY[0x1E0C809B0];
    if (!qword_1ECD82938)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __getSFWebAppDataControllerClass_block_invoke;
      v10[3] = &unk_1E16B14C0;
      v10[4] = &v11;
      __getSFWebAppDataControllerClass_block_invoke((uint64_t)v10);
      v3 = (void *)v12[3];
    }
    v5 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v11, 8);
    v6 = (void *)objc_msgSend([v5 alloc], "initWithWebClipIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __27__UIWebClip_removeFromDisk__block_invoke_2;
    v9[3] = &unk_1E16B1B28;
    v9[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "clearWebsiteDataWithCompletion:", v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIWebClip pathForWebClipWithIdentifier:](UIWebClip, "pathForWebClipWithIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeItemAtPath:error:", v8, 0);

    NSLog(CFSTR("WebClip deletion did not have placeholder bundle to remove"));
  }
}

void __27__UIWebClip_removeFromDisk__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[UIWebClip pathForWebClipWithIdentifier:](UIWebClip, "pathForWebClipWithIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtPath:error:", v2, 0);

}

- (void)_removePlaceholderBundleWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  id v8;
  id IXAppInstallCoordinatorClass;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  if (-[UIWebClip _hasPlaceholderBundle](self, "_hasPlaceholderBundle"))
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v5 = (void *)getIXUninstallOptionsClass_softClass;
    v17 = getIXUninstallOptionsClass_softClass;
    v6 = MEMORY[0x1E0C809B0];
    if (!getIXUninstallOptionsClass_softClass)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __getIXUninstallOptionsClass_block_invoke;
      v13[3] = &unk_1E16B14C0;
      v13[4] = &v14;
      __getIXUninstallOptionsClass_block_invoke((uint64_t)v13);
      v5 = (void *)v15[3];
    }
    v7 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v14, 8);
    v8 = objc_alloc_init(v7);
    IXAppInstallCoordinatorClass = getIXAppInstallCoordinatorClass();
    v10 = (void *)objc_msgSend(objc_alloc((Class)getIXApplicationIdentityClass()), "initWithBundleIdentifier:", self->placeholderBundleIdentifier);
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __52__UIWebClip__removePlaceholderBundleWithCompletion___block_invoke;
    v11[3] = &unk_1E16EC848;
    v12 = v4;
    objc_msgSend(IXAppInstallCoordinatorClass, "uninstallAppWithIdentity:options:completion:", v10, v8, v11);

  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __52__UIWebClip__removePlaceholderBundleWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (a2)
    NSLog(CFSTR("Web app placeholder bundle uninstall success"));
  else
    NSLog(CFSTR("Web app placeholder bundle uninstall error: %@"), v5);
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);

}

- (id)_initWithIdentifier:(id)a3
{
  id v4;
  UIWebClip *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIWebClip;
  v5 = -[UIWebClip init](&v9, sel_init);
  if (v5)
  {
    +[UIWebClip _normalizedWebClipIdentifierFromBundleIdentifier:](UIWebClip, "_normalizedWebClipIdentifierFromBundleIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWebClip setIdentifier:](v5, "setIdentifier:", v6);

    -[UIWebClip setFullScreen:](v5, "setFullScreen:", 0);
    -[UIWebClip setClassicMode:](v5, "setClassicMode:", 0);
    -[UIWebClip setStatusBarStyle:](v5, "setStatusBarStyle:", 0);
    v5->iconIsPrerendered = 1;
    -[UIWebClip _reloadProperties](v5, "_reloadProperties");
    +[UIWebClipEligibilityObserver sharedObserver](UIWebClipEligibilityObserver, "sharedObserver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startObservingEligibility");

  }
  return v5;
}

- (void)setPageURL:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isFileURL") & 1) == 0)
    objc_storeStrong((id *)&self->pageURL, a3);

}

- (id)_bundleResourceWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  +[UIWebClip urlForWebClipWithIdentifier:](UIWebClip, "urlForWebClipWithIdentifier:", self->identifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundlePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.png"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v10, "fileExistsAtPath:", v9);

    if ((_DWORD)v8)
      v11 = v9;
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_bundleImageWithName:(id)a3
{
  void *v3;
  void *v4;

  -[UIWebClip _bundleResourceWithName:](self, "_bundleResourceWithName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[UIImage imageWithContentsOfFile:](UIImage, "imageWithContentsOfFile:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)iconImagePath
{
  return (NSString *)-[UIWebClip _bundleResourceWithName:](self, "_bundleResourceWithName:", CFSTR("icon"));
}

- (id)generateIconImageForFormat:(int)a3 scale:(double)a4
{
  uint64_t v5;
  void *v7;
  void *v8;

  v5 = *(_QWORD *)&a3;
  -[UIWebClip _reloadProperties](self, "_reloadProperties");
  -[UIWebClip iconImage](self, "iconImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_applicationIconImageForFormat:precomposed:scale:", v5, -[UIWebClip iconIsPrecomposed](self, "iconIsPrecomposed"), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (UIImage)iconImage
{
  UIImage *iconImage;
  UIImage *v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  iconImage = self->iconImage;
  if (iconImage)
  {
    v3 = iconImage;
  }
  else
  {
    -[UIWebClip _bundleImageWithName:](self, "_bundleImageWithName:", CFSTR("icon"));
    v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      if (self->_isAppClip)
      {
        v5 = (void *)objc_opt_new();
        objc_msgSend(v5, "setShape:", 5);
        objc_msgSend(v5, "setScale:", 2.0);
        objc_msgSend(v5, "setSize:", 167.0, 167.0);
        objc_msgSend(MEMORY[0x1E0D3A820], "genericApplicationIcon");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "prepareImageForDescriptor:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = objc_msgSend(v7, "CGImage");
        objc_msgSend(v7, "scale");
        +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v8, 0);
        v3 = (UIImage *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v3 = 0;
      }
    }
  }
  return v3;
}

- (UIImage)darkIconImage
{
  UIImage *darkIconImage;
  UIImage *v3;

  darkIconImage = self->darkIconImage;
  if (darkIconImage)
  {
    v3 = darkIconImage;
  }
  else
  {
    -[UIWebClip _bundleImageWithName:](self, "_bundleImageWithName:", CFSTR("dark-icon"));
    v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[UIWebClip iconImage](self, "iconImage");
      v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (UIImage)tintableIconImage
{
  UIImage *tintableIconImage;
  UIImage *v3;

  tintableIconImage = self->tintableIconImage;
  if (tintableIconImage)
  {
    v3 = tintableIconImage;
  }
  else
  {
    -[UIWebClip _bundleImageWithName:](self, "_bundleImageWithName:", CFSTR("tintable-icon"));
    v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[UIWebClip iconImage](self, "iconImage");
      v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (void)_setIconImage:(id)a3 isPrecomposed:(BOOL)a4 isScreenShotBased:(BOOL)a5
{
  objc_storeStrong((id *)&self->iconImage, a3);
  self->iconIsScreenShotBased = a5;
  self->iconIsPrecomposed = a4;
}

- (void)setIconImage:(id)a3 isPrecomposed:(BOOL)a4
{
  -[UIWebClip _setIconImage:isPrecomposed:isScreenShotBased:](self, "_setIconImage:isPrecomposed:isScreenShotBased:", a3, a4, 0);
}

- (void)setIconImageFromScreenshot:(id)a3
{
  -[UIWebClip _setIconImage:isPrecomposed:isScreenShotBased:](self, "_setIconImage:isPrecomposed:isScreenShotBased:", a3, 0, 1);
}

- (UIImage)startupImage
{
  UIImage *startupImage;

  startupImage = self->startupImage;
  if (startupImage)
    return startupImage;
  -[UIWebClip _bundleImageWithName:](self, "_bundleImageWithName:", CFSTR("startup"));
  return (UIImage *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIImage)startupLandscapeImage
{
  UIImage *startupLandscapeImage;

  startupLandscapeImage = self->startupLandscapeImage;
  if (startupLandscapeImage)
    return startupLandscapeImage;
  -[UIWebClip _bundleImageWithName:](self, "_bundleImageWithName:", CFSTR("startup-landscape"));
  return (UIImage *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIImage)initialLaunchImage
{
  UIImage *initialLaunchImage;

  initialLaunchImage = self->initialLaunchImage;
  if (initialLaunchImage)
    return initialLaunchImage;
  -[UIWebClip _bundleImageWithName:](self, "_bundleImageWithName:", CFSTR("initial-launch-image"));
  return (UIImage *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)dealloc
{
  objc_super v3;

  -[UIWebClip cancelMediaUpdate](self, "cancelMediaUpdate");
  v3.receiver = self;
  v3.super_class = (Class)UIWebClip;
  -[UIWebClip dealloc](&v3, sel_dealloc);
}

- (id)_defaultBrowserName
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t v11;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("http://"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWebClip.m"), 1113, CFSTR("HTTP URL should always construct"));

  }
  v11 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA58A8]), "initWithURL:error:", v4, &v11);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "bundleRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)eligibilityAlert:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v4 = a3;
  -[UIWebClip _defaultBrowserName](self, "_defaultBrowserName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    _UILocalizedFormat(CFSTR("OPEN_IN_BROWSER_TITLE"), (uint64_t)CFSTR("open web page in browser alert title"), CFSTR("Open “%@” in %@?"), v5, v6, v7, v8, v9, (uint64_t)self->title);
  else
    _UILocalizedFormat(CFSTR("OPEN_IN_BROWSER_TITLE_BACKUP"), (uint64_t)CFSTR("open web page in browser alert title"), CFSTR("Open “%@” in your browser?"), v5, v6, v7, v8, v9, (uint64_t)self->title);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _UILocalizedString(CFSTR("OPEN_IN_BROWSER_BODY"), (uint64_t)CFSTR("open web page in browser alert title"), CFSTR("In your region, web apps now open in your default browser."));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _UILocalizedString(CFSTR("OPEN_IN_BROWSER"), (uint64_t)CFSTR("open web page in the browser alert action"), CFSTR("Open"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __30__UIWebClip_eligibilityAlert___block_invoke;
  v24[3] = &unk_1E16EC870;
  v24[4] = self;
  v14 = v4;
  v25 = v14;
  +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 0, v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _UILocalizedString(CFSTR("Cancel"), (uint64_t)CFSTR("cancel alert action"), CFSTR("Cancel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __30__UIWebClip_eligibilityAlert___block_invoke_2;
  v22[3] = &unk_1E16EC870;
  v22[4] = self;
  v23 = v14;
  v17 = v14;
  +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 0, v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v21, v11, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAction:", v18);
  objc_msgSend(v19, "addAction:", v15);

  return v19;
}

uint64_t __30__UIWebClip_eligibilityAlert___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 256);
  *(_QWORD *)(v2 + 256) = 2;
  objc_msgSend(*(id *)(a1 + 32), "updateOnDisk");
  if (!v3)
    objc_msgSend(*(id *)(a1 + 32), "_removePlaceholderBundleAndClearBadge");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __30__UIWebClip_eligibilityAlert___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 256))
  {
    *(_QWORD *)(v2 + 256) = 1;
    objc_msgSend(*(id *)(a1 + 32), "updateOnDisk");
    objc_msgSend(*(id *)(a1 + 32), "_removePlaceholderBundleAndClearBadge");
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)webClipWithIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[UIWebClip _initWithIdentifier:]([UIWebClip alloc], "_initWithIdentifier:", v3);

  return v4;
}

+ (id)webClipWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("webclip")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("webapp")))
  {
    objc_msgSend(v4, "resourceSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(a1, "webClipWithIdentifier:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)appClips
{
  return (id)objc_msgSend((id)objc_opt_class(), "clipsIncludingWebClips:includingAppClips:", 0, 1);
}

+ (BOOL)bundleIdentifierContainsWebClipIdentifier:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("com.apple.webapp-"));
}

+ (id)webClipIdentifierFromBundleIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.webapp-")))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("com.apple.webapp-"), "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_normalizedWebClipIdentifierFromBundleIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("com.apple.webapp-");
  v8[1] = CFSTR("com.apple.appclip-");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_uikit_stringByRemovingFirstMatchFromPrefixes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_contentForMetaName:(id)a3 inWebDocumentView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v20;
  void *v21;
  id v22;

  v5 = a3;
  v6 = a4;
  WebThreadLock();
  objc_msgSend(v6, "webView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mainFrame");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "DOMDocument");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v20 = v8;
    v21 = v7;
    v22 = v6;
    objc_msgSend(v9, "getElementsByTagName:", CFSTR("meta"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    if (objc_msgSend(v11, "length"))
    {
      v13 = 0;
      do
      {
        objc_msgSend(v11, "item:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "getAttribute:", CFSTR("name"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v5, "caseInsensitiveCompare:", v15);

        if (!v16)
        {
          objc_msgSend(v14, "getAttribute:", CFSTR("content"));
          v17 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v17;
        }

        v13 = (v13 + 1);
      }
      while (v13 < objc_msgSend(v11, "length"));
    }

    v7 = v21;
    v6 = v22;
    v8 = v20;
  }
  else
  {
    v12 = 0;
  }
  v18 = v12;

  return v18;
}

+ (int64_t)_webClipStatusBarStyleForMetaTagContent:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("black")))
      v5 = objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("black-translucent")) == 0;
    else
      v5 = 2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (int64_t)webClipStatusBarStyleForWebDocumentView:(id)a3
{
  void *v4;
  int64_t v5;

  objc_msgSend(a1, "_contentForMetaName:inWebDocumentView:", CFSTR("apple-mobile-web-app-status-bar-style"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "_webClipStatusBarStyleForMetaTagContent:", v4);

  return v5;
}

+ (BOOL)_webClipFullScreenValueForMetaTagContent:(id)a3
{
  return objc_msgSend(a3, "_web_isCaseInsensitiveEqualToString:", CFSTR("yes"));
}

+ (BOOL)webClipFullScreenValueForWebDocumentView:(id)a3
{
  id v3;
  void *v4;

  v3 = a1;
  objc_msgSend(a1, "_contentForMetaName:inWebDocumentView:", CFSTR("apple-mobile-web-app-capable"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "_webClipFullScreenValueForMetaTagContent:", v4);

  return (char)v3;
}

+ (id)webClipTitleForWebDocumentView:(id)a3
{
  return (id)objc_msgSend(a1, "_contentForMetaName:inWebDocumentView:", CFSTR("apple-mobile-web-app-title"), a3);
}

+ (BOOL)webClipClassicModeValueForWebDocumentView:(id)a3
{
  return objc_msgSend(a3, "isClassicViewportMode");
}

+ (unint64_t)_webClipOrientationsForMetaTagContent:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(","));
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(" \t\n\f\r"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)v4;
    v17 = v3;
    objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "stringByTrimmingCharactersInSet:", v5);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "caseInsensitiveCompare:", CFSTR("portrait")))
          {
            if (objc_msgSend(v12, "caseInsensitiveCompare:", CFSTR("portrait-upside-down")))
            {
              if (objc_msgSend(v12, "caseInsensitiveCompare:", CFSTR("landscape-right")))
              {
                if (objc_msgSend(v12, "caseInsensitiveCompare:", CFSTR("landscape-left")))
                {
                  if (objc_msgSend(v12, "caseInsensitiveCompare:", CFSTR("portrait-any")))
                  {
                    if (objc_msgSend(v12, "caseInsensitiveCompare:", CFSTR("landscape-any")))
                    {
                      if (!objc_msgSend(v12, "caseInsensitiveCompare:", CFSTR("any")))
                        v9 |= 0x1EuLL;
                    }
                    else
                    {
                      v9 |= 0x18uLL;
                    }
                  }
                  else
                  {
                    v9 |= 6uLL;
                  }
                }
                else
                {
                  v9 |= 0x10uLL;
                }
              }
              else
              {
                v9 |= 8uLL;
              }
            }
            else
            {
              v9 |= 4uLL;
            }
          }
          else
          {
            v9 |= 2uLL;
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }
    if ((v9 & 0x10) != 0)
      v14 = 0;
    else
      v14 = v9;
    if ((~(_BYTE)v9 & 0xE) != 0)
      v13 = v9;
    else
      v13 = v14;

    v3 = v17;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (unint64_t)webClipOrientationsForWebDocumentView:(id)a3
{
  void *v4;
  unint64_t v5;

  objc_msgSend(a1, "_contentForMetaName:inWebDocumentView:", CFSTR("apple-mobile-web-app-orientations"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "_webClipOrientationsForMetaTagContent:", v4);

  return v5;
}

- (void)cancelMediaUpdate
{
  -[UIWebClip stopLoadingCustomIcon](self, "stopLoadingCustomIcon");
  -[UIWebClip stopLoadingStartupImage](self, "stopLoadingStartupImage");
  -[UIWebClip stopLoadingStartupLandscapeImage](self, "stopLoadingStartupLandscapeImage");
}

- (void)stopLoadingCustomIcon
{
  NSURLConnection *iconConnection;
  NSURLConnection *v4;
  NSMutableData *customIconData;

  iconConnection = self->_iconConnection;
  if (iconConnection)
  {
    -[NSURLConnection cancel](iconConnection, "cancel");
    v4 = self->_iconConnection;
    self->_iconConnection = 0;

    customIconData = self->_customIconData;
    self->_customIconData = 0;

  }
}

- (void)stopLoadingStartupImage
{
  NSURLConnection *startupImageConnection;
  NSURLConnection *v4;
  NSMutableData *customStartupImageData;

  startupImageConnection = self->_startupImageConnection;
  if (startupImageConnection)
  {
    -[NSURLConnection cancel](startupImageConnection, "cancel");
    v4 = self->_startupImageConnection;
    self->_startupImageConnection = 0;

    customStartupImageData = self->_customStartupImageData;
    self->_customStartupImageData = 0;

  }
}

- (void)stopLoadingStartupLandscapeImage
{
  NSURLConnection *startupLandscapeImageConnection;
  NSURLConnection *v4;
  NSMutableData *customStartupLandscapeImageData;

  startupLandscapeImageConnection = self->_startupLandscapeImageConnection;
  if (startupLandscapeImageConnection)
  {
    -[NSURLConnection cancel](startupLandscapeImageConnection, "cancel");
    v4 = self->_startupLandscapeImageConnection;
    self->_startupLandscapeImageConnection = 0;

    customStartupLandscapeImageData = self->_customStartupLandscapeImageData;
    self->_customStartupLandscapeImageData = 0;

  }
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  id v6;
  NSMutableData *customIconData;
  NSMutableData *v8;
  NSMutableData *customStartupImageData;
  NSMutableData *v10;
  NSMutableData *v11;
  NSURLConnection *v12;

  v12 = (NSURLConnection *)a3;
  v6 = a4;
  if (self->_iconConnection == v12)
  {
    customIconData = self->_customIconData;
    if (!customIconData)
    {
      v10 = (NSMutableData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithData:", v6);
      customStartupImageData = self->_customIconData;
      self->_customIconData = v10;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (self->_startupImageConnection == v12)
  {
    customIconData = self->_customStartupImageData;
    if (!customIconData)
    {
      v11 = (NSMutableData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithData:", v6);
      customStartupImageData = self->_customStartupImageData;
      self->_customStartupImageData = v11;
      goto LABEL_11;
    }
LABEL_9:
    -[NSMutableData appendData:](customIconData, "appendData:", v6);
    goto LABEL_12;
  }
  if (self->_startupLandscapeImageConnection == v12)
  {
    customIconData = self->_customStartupLandscapeImageData;
    if (!customIconData)
    {
      v8 = (NSMutableData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithData:", v6);
      customStartupImageData = self->_customStartupLandscapeImageData;
      self->_customStartupLandscapeImageData = v8;
LABEL_11:

      goto LABEL_12;
    }
    goto LABEL_9;
  }
LABEL_12:

}

- (id)bundleIdentifier
{
  void *v3;
  __CFString *v4;
  id v5;
  void *v6;

  -[UIWebClip identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIWebClip isAppClip](self, "isAppClip"))
  {
    v4 = CFSTR("com.apple.appclip-");
  }
  else
  {
    if (!-[UIWebClip fullScreen](self, "fullScreen"))
    {
      v5 = v3;
      goto LABEL_7;
    }
    v4 = CFSTR("com.apple.webapp-");
  }
  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v6 = v5;

  return v6;
}

- (void)requestIconUpdateInSpringBoard
{
  const __CFString *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  char buffer[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  -[UIWebClip bundleIdentifier](self, "bundleIdentifier");
  v2 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  v3 = (__CFString *)v2;
  if (v2)
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    *(_OWORD *)buffer = 0u;
    v18 = 0u;
    if (CFStringGetCString(v2, buffer, 1024, 0x8000100u))
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v4 = off_1ECD82950;
      v16 = off_1ECD82950;
      if (!off_1ECD82950)
      {
        v5 = SpringBoardServicesLibrary_3();
        v4 = dlsym(v5, "SBSSpringBoardServerPort");
        v14[3] = (uint64_t)v4;
        off_1ECD82950 = v4;
      }
      _Block_object_dispose(&v13, 8);
      if (v4)
      {
        v6 = ((uint64_t (*)(void))v4)();
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v7 = off_1ECD82948;
        v16 = off_1ECD82948;
        if (!off_1ECD82948)
        {
          v8 = SpringBoardServicesLibrary_3();
          v7 = dlsym(v8, "SBReloadIconForIdentifier");
          v14[3] = (uint64_t)v7;
          off_1ECD82948 = v7;
        }
        _Block_object_dispose(&v13, 8);
        if (v7)
        {
          ((void (*)(uint64_t, char *))v7)(v6, buffer);
          goto LABEL_10;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "kern_return_t softLink_SBReloadIconForIdentifier(mach_port_t, char *)");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("UIWebClip.m"), 48, CFSTR("%s"), dlerror());

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "mach_port_t softLink_SBSSpringBoardServerPort(void)");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("UIWebClip.m"), 47, CFSTR("%s"), dlerror());

      }
      __break(1u);
    }
  }
LABEL_10:

}

+ (id)webClipIconsForWebClipLinkTags:(id)a3 pageURL:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t i;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  UIWebClipIcon *v38;
  void *v39;
  UIWebClipIcon *v40;
  void *v41;
  void *v42;
  UIWebClipIcon *v43;
  unint64_t v44;
  void *v45;
  UIWebClipIcon *v46;
  void *v47;
  id v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  UIWebClipIcon *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v49 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
  v8 = 0x1E0C99000uLL;
  v51 = v6;
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v62;
    v11 = *MEMORY[0x1E0C9D820];
    v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v50 = *(_QWORD *)v62;
    do
    {
      v13 = 0;
      v52 = v9;
      do
      {
        if (*(_QWORD *)v62 != v10)
          objc_enumerationMutation(v6);
        v58 = v13;
        v14 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v13);
        objc_msgSend(v14, "rel");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v59, "_web_isCaseInsensitiveEqualToString:", CFSTR("apple-touch-icon")) & 1) != 0
          || objc_msgSend(v59, "_web_isCaseInsensitiveEqualToString:", CFSTR("apple-touch-icon-precomposed")))
        {
          objc_msgSend(v14, "href");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v15, "length"))
            goto LABEL_32;
          v57 = v15;
          objc_msgSend(*(id *)(v8 + 3736), "URLWithString:encodingInvalidCharacters:", v15, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
            goto LABEL_31;
          v56 = objc_alloc_init(UIWebClipIcon);
          -[UIWebClipIcon setPrecomposed:](v56, "setPrecomposed:", objc_msgSend(v59, "_web_isCaseInsensitiveEqualToString:", CFSTR("apple-touch-icon-precomposed")));
          objc_msgSend(v14, "sizes");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v55;
          if (v17)
          {
            v67 = 0u;
            v68 = 0u;
            v65 = 0u;
            v66 = 0u;
            v54 = v17;
            objc_msgSend(v17, "componentsSeparatedByString:", CFSTR(" "));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
            if (v20)
            {
              v21 = v20;
              v53 = v16;
              v22 = 0;
              v23 = *(_QWORD *)v66;
              v24 = v12;
              v25 = v11;
              do
              {
                for (i = 0; i != v21; ++i)
                {
                  if (*(_QWORD *)v66 != v23)
                    objc_enumerationMutation(v19);
                  objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("x"));
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v27, "count") == 2)
                  {
                    objc_msgSend(v27, "objectAtIndex:", 0);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v29 = objc_msgSend(v28, "integerValue");

                    objc_msgSend(v27, "objectAtIndex:", 1);
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    v31 = objc_msgSend(v30, "integerValue");

                    if (v29 >= 1 && v31 >= 1)
                    {
                      if (objc_msgSend(MEMORY[0x1E0CA5910], "_compareApplicationIconCanvasSize:withSize:", (double)v29, (double)v31, v25, v24) == 1)
                      {
                        v24 = (double)v31;
                        v25 = (double)v29;
                      }
                      v22 = 1;
                    }
                  }

                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
              }
              while (v21);

              v17 = v54;
              v18 = v55;
              v10 = v50;
              v6 = v51;
              v8 = 0x1E0C99000;
              v9 = v52;
              v16 = v53;
              if ((v22 & 1) != 0)
              {
LABEL_30:

                -[UIWebClipIcon setBestSize:](v56, "setBestSize:", v25, v24);
                -[UIWebClipIcon setUrl:](v56, "setUrl:", v16);
                objc_msgSend(v18, "addObject:", v56);

LABEL_31:
                v15 = v57;
LABEL_32:

                goto LABEL_33;
              }
            }
            else
            {

              v9 = v52;
              v17 = v54;
            }
          }
          v24 = 57.0;
          v25 = 57.0;
          goto LABEL_30;
        }
LABEL_33:

        v13 = v58 + 1;
      }
      while (v58 + 1 != v9);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0CA5910], "_applicationIconCanvasSize");
  v34 = v33;
  v36 = v35;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ldx%ld"), (uint64_t)v33, (uint64_t)v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_alloc_init(UIWebClipIcon);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/apple-touch-icon-%@.png"), v37);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v8 + 3736), "URLWithString:relativeToURL:", v60, v49);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebClipIcon setUrl:](v38, "setUrl:", v39);

  -[UIWebClipIcon setSiteWide:](v38, "setSiteWide:", 1);
  -[UIWebClipIcon setBestSize:](v38, "setBestSize:", v34, v36);
  objc_msgSend(v55, "addObject:", v38);
  v40 = objc_alloc_init(UIWebClipIcon);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/apple-touch-icon-%@-precomposed.png"), v37);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v8 + 3736), "URLWithString:relativeToURL:", v41, v49);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebClipIcon setUrl:](v40, "setUrl:", v42);

  -[UIWebClipIcon setSiteWide:](v40, "setSiteWide:", 1);
  -[UIWebClipIcon setBestSize:](v40, "setBestSize:", v34, v36);
  -[UIWebClipIcon setPrecomposed:](v40, "setPrecomposed:", 1);
  objc_msgSend(v55, "addObject:", v40);
  v43 = objc_alloc_init(UIWebClipIcon);
  objc_msgSend(*(id *)(v8 + 3736), "URLWithString:relativeToURL:", CFSTR("/apple-touch-icon.png"), v49);
  v44 = v8;
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebClipIcon setUrl:](v43, "setUrl:", v45);

  -[UIWebClipIcon setSiteWide:](v43, "setSiteWide:", 1);
  objc_msgSend(v55, "addObject:", v43);
  v46 = objc_alloc_init(UIWebClipIcon);
  -[UIWebClipIcon setPrecomposed:](v46, "setPrecomposed:", 1);
  objc_msgSend(*(id *)(v44 + 3736), "URLWithString:relativeToURL:", CFSTR("/apple-touch-icon-precomposed.png"), v49);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebClipIcon setUrl:](v46, "setUrl:", v47);

  -[UIWebClipIcon setSiteWide:](v46, "setSiteWide:", 1);
  objc_msgSend(v55, "addObject:", v43);
  objc_msgSend(v55, "sortWithOptions:usingComparator:", 16, &__block_literal_global_677);

  return v55;
}

uint64_t __52__UIWebClip_webClipIconsForWebClipLinkTags_pageURL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:preferringDeviceIconSizes:", a2, 1);
}

+ (id)webClipIconsForWebDocumentView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  WebThreadLock();
  baseURLForWebDocumentView(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_webClipLinkTagsFromWebDocumentView:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "webClipIconsForWebClipLinkTags:pageURL:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)updateCustomMediaLocationsWithWebClipLinkTags:(id)a3 baseURL:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  id v20;
  UIWebClip *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22 = a4;
  objc_msgSend((id)objc_opt_class(), "webClipIconsForWebClipLinkTags:pageURL:", v6, v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = self;
  -[UIWebClip setIcons:](self, "setIcons:", v7);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v15, "rel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "_web_isCaseInsensitiveEqualToString:", CFSTR("apple-touch-startup-image"));

        if (v17)
        {
          objc_msgSend(v15, "hrefURL");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            if (objc_msgSend(v15, "mediaMatchesPortraitOrientation"))
            {
              v19 = v18;

              v12 = v19;
            }
            if (objc_msgSend(v15, "mediaMatchesLandscapeOrientation"))
            {
              v20 = v18;

              v11 = v20;
            }
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }

  -[UIWebClip setStartupImageURL:](v21, "setStartupImageURL:", v12);
  -[UIWebClip setStartupLandscapeImageURL:](v21, "setStartupLandscapeImageURL:", v11);
  -[UIWebClip requestCustomIconUpdate](v21, "requestCustomIconUpdate");
  if (-[UIWebClip fullScreen](v21, "fullScreen"))
  {
    -[UIWebClip requestCustomPortraitStartupImageUpdate](v21, "requestCustomPortraitStartupImageUpdate");
    -[UIWebClip requestCustomLandscapeStartupImageUpdate](v21, "requestCustomLandscapeStartupImageUpdate");
  }

}

- (void)updateCustomMediaLocationsFromWebDocumentView:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  WebThreadLock();
  baseURLForWebDocumentView(v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_webClipLinkTagsFromWebDocumentView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIWebClip updateCustomMediaLocationsWithWebClipLinkTags:baseURL:](self, "updateCustomMediaLocationsWithWebClipLinkTags:baseURL:", v5, v6);
}

+ (id)_webClipLinkTagsFromWebDocumentView:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[2];
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;

  v3 = a3;
  WebThreadLock();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v17 = __49__UIWebClip__webClipLinkTagsFromWebDocumentView___block_invoke;
  v18 = &unk_1E16EC898;
  v5 = v4;
  v19 = v5;
  v6 = v16;
  objc_msgSend(v3, "webView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mainFrame");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "DOMDocument");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "getElementsByTagName:", CFSTR("link"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      do
      {
        objc_msgSend(v10, "item:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17((uint64_t)v6, v14);

        v13 = (v13 + 1);
      }
      while (v12 != (_DWORD)v13);
    }

  }
  return v5;
}

void __49__UIWebClip__webClipLinkTagsFromWebDocumentView___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  UIWebClipLinkTag *v8;

  v3 = a2;
  v8 = objc_alloc_init(UIWebClipLinkTag);
  objc_msgSend(v3, "href");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebClipLinkTag setHref:](v8, "setHref:", v4);

  objc_msgSend(v3, "rel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebClipLinkTag setRel:](v8, "setRel:", v5);

  objc_msgSend(v3, "getAttribute:", CFSTR("sizes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebClipLinkTag setSizes:](v8, "setSizes:", v6);

  -[UIWebClipLinkTag setMediaMatchesPortraitOrientation:](v8, "setMediaMatchesPortraitOrientation:", objc_msgSend(v3, "_mediaQueryMatchesForOrientation:", 1));
  v7 = objc_msgSend(v3, "_mediaQueryMatchesForOrientation:", 2);

  -[UIWebClipLinkTag setMediaMatchesLandscapeOrientation:](v8, "setMediaMatchesLandscapeOrientation:", v7);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

}

- (BOOL)tryLoadingNextCustomIcon
{
  NSArray *icons;
  NSArray **p_icons;
  unint64_t v5;
  unint64_t v6;

  p_icons = &self->icons;
  icons = self->icons;
  v5 = (unint64_t)&p_icons[1]->super.isa + 1;
  self->currentIconIndex = v5;
  v6 = -[NSArray count](icons, "count");
  if (v5 >= v6)
    self->currentIconIndex = 0;
  else
    -[UIWebClip requestCustomIconUpdate](self, "requestCustomIconUpdate");
  return v5 < v6;
}

- (void)connectionDidFinishLoading:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id WeakRetained;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  BOOL v28;
  double v29;
  double v30;
  double v31;
  double v32;
  BOOL v33;
  BOOL v34;
  _QWORD *ContextStack;
  CGContext *v36;
  void *v37;
  uint64_t v38;
  double v39;
  double v40;
  BOOL v41;
  double v42;
  double v43;
  BOOL v44;
  void *v45;
  NSURLConnection *v46;

  v46 = (NSURLConnection *)a3;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;
  objc_msgSend(v4, "bounds");
  v8 = v7;
  v10 = v9;
  objc_msgSend((id)UIApp, "statusBarHeight");
  v12 = v11;
  WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  if (self->_iconConnection == v46)
  {
    -[NSArray objectAtIndex:](self->icons, "objectAtIndex:", self->currentIconIndex);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "isPrecomposed");

    +[UIImage imageWithData:](UIImage, "imageWithData:", self->_customIconData);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        -[UIWebClip setIconImage:isPrecomposed:](self, "setIconImage:isPrecomposed:", v17, v38);
        -[UIWebClip updateOnDisk](self, "updateOnDisk");
        -[UIWebClip requestIconUpdateInSpringBoard](self, "requestIconUpdateInSpringBoard");
        goto LABEL_46;
      }
    }
    else
    {
      if (-[UIWebClip tryLoadingNextCustomIcon](self, "tryLoadingNextCustomIcon"))
        goto LABEL_50;
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_46:
        -[UIWebClip stopLoadingCustomIcon](self, "stopLoadingCustomIcon");
LABEL_49:

        goto LABEL_50;
      }
    }
    objc_msgSend(WeakRetained, "webClip:iconRequestDidFinishWithImage:precomposed:", self, v17, v38);
    goto LABEL_46;
  }
  v14 = v10 - v12;
  v15 = v6 * v8;
  v16 = v6 * (v10 - v12);
  if (self->_startupImageConnection == v46)
  {
    +[UIImage imageWithData:](UIImage, "imageWithData:", self->_customStartupImageData);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "webClip:startupImageRequestDidFinishWithImage:", self, v17);
    if (v17)
    {
      objc_msgSend(v17, "size");
      v41 = v40 == v8 && v39 == v14;
      if (v41 || ((objc_msgSend(v17, "size"), v43 == v15) ? (v44 = v42 == v16) : (v44 = 0), v44))
      {
        -[UIWebClip setStartupImage:](self, "setStartupImage:", v17);
        -[UIWebClip updateOnDisk](self, "updateOnDisk");
      }
    }
    -[UIWebClip stopLoadingStartupImage](self, "stopLoadingStartupImage");
    goto LABEL_49;
  }
  if (self->_startupLandscapeImageConnection == v46)
  {
    +[UIImage imageWithData:](UIImage, "imageWithData:", self->_customStartupLandscapeImageData);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "webClip:startupLandscapeImageRequestDidFinishWithImage:", self, v17);
    if (v17)
    {
      v18 = v8 - v12;
      v19 = v12 + v14;
      objc_msgSend(v17, "size");
      v22 = v21 == v8 - v12 && v20 == v19;
      if (v22
        || ((v23 = v6 * v12, v24 = v15 - v6 * v12, v25 = v23 + v16, objc_msgSend(v17, "size"), v27 == v24)
          ? (v28 = v26 == v25)
          : (v28 = 0),
            v28))
      {
        -[UIWebClip setStartupLandscapeImage:](self, "setStartupLandscapeImage:", v17);
        -[UIWebClip updateOnDisk](self, "updateOnDisk");
      }
      else
      {
        objc_msgSend(v17, "size");
        v31 = v29;
        v32 = v30;
        v33 = v30 == v18 && v29 == v19;
        if (v33 || (v30 == v24 ? (v34 = v29 == v25) : (v34 = 0), v34))
        {
          _UIGraphicsBeginImageContextWithOptions(0, 0, v24, v25, 1.0);
          ContextStack = GetContextStack(0);
          if (*(int *)ContextStack < 1)
            v36 = 0;
          else
            v36 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
          CGContextTranslateCTM(v36, v32 * 0.5, v31 * 0.5);
          CGContextRotateCTM(v36, 1.57079633);
          CGContextTranslateCTM(v36, v31 * -0.5, v32 * -0.5);
          objc_msgSend(v17, "drawAtPoint:", 0.0, 0.0);
          _UIGraphicsGetImageFromCurrentImageContext(0);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          UIGraphicsEndImageContext();
          -[UIWebClip setStartupLandscapeImage:](self, "setStartupLandscapeImage:", v45);
          -[UIWebClip updateOnDisk](self, "updateOnDisk");

        }
      }
    }
    -[UIWebClip stopLoadingStartupLandscapeImage](self, "stopLoadingStartupLandscapeImage");
    goto LABEL_49;
  }
LABEL_50:

}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  id WeakRetained;
  NSURLConnection *v6;

  v6 = (NSURLConnection *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  if (self->_iconConnection == v6)
  {
    -[UIWebClip stopLoadingCustomIcon](self, "stopLoadingCustomIcon");
    if (!-[UIWebClip tryLoadingNextCustomIcon](self, "tryLoadingNextCustomIcon")
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "webClip:iconRequestDidFinishWithImage:precomposed:", self, 0, 0);
    }
  }
  else if (self->_startupImageConnection == v6)
  {
    -[UIWebClip stopLoadingStartupImage](self, "stopLoadingStartupImage");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "webClip:startupImageRequestDidFinishWithImage:", self, 0);
  }
  else if (self->_startupLandscapeImageConnection == v6)
  {
    -[UIWebClip stopLoadingStartupLandscapeImage](self, "stopLoadingStartupLandscapeImage");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "webClip:startupLandscapeImageRequestDidFinishWithImage:", self, 0);
  }

}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "statusCode") >= 400)
    -[UIWebClip connection:didFailWithError:](self, "connection:didFailWithError:", v7, 0);

}

- (void)requestCustomIconUpdate
{
  unint64_t currentIconIndex;
  void *v4;
  void *v5;
  void *v6;
  NSURLConnection *v7;
  NSURLConnection *iconConnection;
  id WeakRetained;

  if (self->_iconConnection)
    -[UIWebClip stopLoadingCustomIcon](self, "stopLoadingCustomIcon");
  currentIconIndex = self->currentIconIndex;
  if (currentIconIndex >= -[NSArray count](self->icons, "count"))
    goto LABEL_6;
  v4 = (void *)MEMORY[0x1E0C92C80];
  -[NSArray objectAtIndex:](self->icons, "objectAtIndex:", self->currentIconIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestWithURL:cachePolicy:timeoutInterval:", v6, 0, 60.0);
  WeakRetained = (id)objc_claimAutoreleasedReturnValue();

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C92C58], "connectionWithRequest:delegate:", WeakRetained, self);
    v7 = (NSURLConnection *)objc_claimAutoreleasedReturnValue();
    iconConnection = self->_iconConnection;
    self->_iconConnection = v7;

  }
  else
  {
LABEL_6:
    WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "webClip:iconRequestDidFinishWithImage:precomposed:", self, 0, 0);
  }

}

- (void)requestCustomPortraitStartupImageUpdate
{
  uint64_t v3;
  NSURLConnection *v4;
  void *startupImageConnection;
  id v6;

  if (self->_startupImageConnection)
    -[UIWebClip stopLoadingStartupImage](self, "stopLoadingStartupImage");
  objc_msgSend(MEMORY[0x1E0C92C80], "requestWithURL:cachePolicy:timeoutInterval:", self->startupImageURL, 0, 60.0);
  v3 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C92C58], "connectionWithRequest:delegate:", v3, self);
    v4 = (NSURLConnection *)objc_claimAutoreleasedReturnValue();
    startupImageConnection = self->_startupImageConnection;
    self->_startupImageConnection = v4;
  }
  else
  {
    startupImageConnection = objc_loadWeakRetained((id *)&self->delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(startupImageConnection, "webClip:startupImageRequestDidFinishWithImage:", self, 0);
  }

}

- (void)requestCustomLandscapeStartupImageUpdate
{
  uint64_t v3;
  NSURLConnection *v4;
  void *startupLandscapeImageConnection;
  id v6;

  if (self->_startupLandscapeImageConnection)
    -[UIWebClip stopLoadingStartupLandscapeImage](self, "stopLoadingStartupLandscapeImage");
  objc_msgSend(MEMORY[0x1E0C92C80], "requestWithURL:cachePolicy:timeoutInterval:", self->startupLandscapeImageURL, 0, 60.0);
  v3 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C92C58], "connectionWithRequest:delegate:", v3, self);
    v4 = (NSURLConnection *)objc_claimAutoreleasedReturnValue();
    startupLandscapeImageConnection = self->_startupLandscapeImageConnection;
    self->_startupLandscapeImageConnection = v4;
  }
  else
  {
    startupLandscapeImageConnection = objc_loadWeakRetained((id *)&self->delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(startupLandscapeImageConnection, "webClip:startupLandscapeImageRequestDidFinishWithImage:", self, 0);
  }

}

+ (id)pathForWebClipWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "webClipsDirectoryPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingPathExtension:", CFSTR("webclip"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)pathForWebClipStorageWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "pathForWebClipWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Storage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v4, 0);

  return v4;
}

+ (id)pathForWebClipCacheWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Caches/WebClips"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingPathComponent:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v7, 0);

  return v7;
}

+ (id)urlForWebClipWithIdentifier:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "pathForWebClipWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v3);
  else
    v4 = 0;

  return v4;
}

+ (unint64_t)_determineEligibility
{
  uint64_t domain_answer;

  domain_answer = os_eligibility_get_domain_answer();
  if ((_DWORD)domain_answer)
    NSLog(CFSTR("Error when determining eligibility, error (%d)"), domain_answer);
  else
    NSLog(CFSTR("Unable to determine eligibility"));
  return 0;
}

- (void)_updateWebClipWithEligibility:(unint64_t)a3
{
  if (a3 == 2)
  {
    if (self->_eligibilityStatus - 1 <= 1)
    {
      self->_eligibilityStatus = 0;
      -[UIWebClip updateOnDisk](self, "updateOnDisk");
    }
  }
  else if (a3 == 4 && !self->_eligibilityStatus)
  {
    self->_eligibilityStatus = 1;
    -[UIWebClip updateOnDisk](self, "updateOnDisk");
    -[UIWebClip _removePlaceholderBundleAndClearBadge](self, "_removePlaceholderBundleAndClearBadge");
  }
}

- (void)_removePlaceholderBundleAndClearBadge
{
  id v3;

  if (-[UIWebClip _hasPlaceholderBundle](self, "_hasPlaceholderBundle"))
  {
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC5B68]), "initWithBundleIdentifier:", self->placeholderBundleIdentifier);
    objc_msgSend(v3, "setBadgeValue:", 0);
    -[UIWebClip _removePlaceholderBundleWithCompletion:](self, "_removePlaceholderBundleWithCompletion:", 0);

  }
}

- (id)getStartupImage:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 1)
    -[UIWebClip startupLandscapeImage](self, "startupLandscapeImage");
  else
    -[UIWebClip startupImage](self, "startupImage");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)needsWebAppDeletionStrings
{
  return self->fullScreen && self->applicationBundleIdentifier == 0;
}

- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4
{
  id v4;

  objc_msgSend(a4, "bundleIdentifier", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Web Clip placeholder bundle coordinator did complete successfully. Bundle Identifier: %@"), v4);

}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v5;

  objc_msgSend(a4, "description", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Web Clip placeholder bundle coordinator canceled failed Error: %@"), v5);

}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSArray)icons
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIcons:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSURL)startupImageURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStartupImageURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSURL)startupLandscapeImageURL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStartupLandscapeImageURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setPlaceholderBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSURL)manifestId
{
  return self->manifestId;
}

- (void)setManifestId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unint64_t)bundleVersion
{
  return self->bundleVersion;
}

- (BOOL)classicMode
{
  return self->classicMode;
}

- (void)setClassicMode:(BOOL)a3
{
  self->classicMode = a3;
}

- (BOOL)removalDisallowed
{
  return self->removalDisallowed;
}

- (void)setRemovalDisallowed:(BOOL)a3
{
  self->removalDisallowed = a3;
}

- (BOOL)iconIsScreenShotBased
{
  return self->iconIsScreenShotBased;
}

- (BOOL)iconIsPrecomposed
{
  return self->iconIsPrecomposed;
}

- (BOOL)iconIsPrerendered
{
  return self->iconIsPrerendered;
}

- (unint64_t)supportedOrientations
{
  return self->supportedOrientations;
}

- (void)setSupportedOrientations:(unint64_t)a3
{
  self->supportedOrientations = a3;
}

- (int64_t)statusBarStyle
{
  return self->statusBarStyle;
}

- (void)setStatusBarStyle:(int64_t)a3
{
  self->statusBarStyle = a3;
}

- (void)setStartupImage:(id)a3
{
  objc_storeStrong((id *)&self->startupImage, a3);
}

- (void)setStartupLandscapeImage:(id)a3
{
  objc_storeStrong((id *)&self->startupLandscapeImage, a3);
}

- (void)setInitialLaunchImage:(id)a3
{
  objc_storeStrong((id *)&self->initialLaunchImage, a3);
}

- (WebClipDelegate)delegate
{
  return (WebClipDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void)setDarkIconImage:(id)a3
{
  objc_storeStrong((id *)&self->darkIconImage, a3);
}

- (void)setTintableIconImage:(id)a3
{
  objc_storeStrong((id *)&self->tintableIconImage, a3);
}

- (NSString)shortcutIdentifier
{
  return self->_shortcutIdentifier;
}

- (void)setShortcutIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (BOOL)isAppClip
{
  return self->_isAppClip;
}

- (void)setIsAppClip:(BOOL)a3
{
  self->_isAppClip = a3;
}

- (BOOL)scenelessBackgroundLaunch
{
  return self->_scenelessBackgroundLaunch;
}

- (void)setScenelessBackgroundLaunch:(BOOL)a3
{
  self->_scenelessBackgroundLaunch = a3;
}

- (unint64_t)contentMode
{
  return self->_contentMode;
}

- (void)setContentMode:(unint64_t)a3
{
  self->_contentMode = a3;
}

- (BOOL)ignoreManifestScope
{
  return self->_ignoreManifestScope;
}

- (void)setIgnoreManifestScope:(BOOL)a3
{
  self->_ignoreManifestScope = a3;
}

- (BOOL)configurationIsManaged
{
  return self->_configurationIsManaged;
}

- (void)setConfigurationIsManaged:(BOOL)a3
{
  self->_configurationIsManaged = a3;
}

- (unint64_t)webClipStatusBarStyle
{
  return self->_webClipStatusBarStyle;
}

- (void)setWebClipStatusBarStyle:(unint64_t)a3
{
  self->_webClipStatusBarStyle = a3;
}

- (unint64_t)eligibilityStatus
{
  return self->_eligibilityStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutIdentifier, 0);
  objc_storeStrong((id *)&self->tintableIconImage, 0);
  objc_storeStrong((id *)&self->darkIconImage, 0);
  objc_storeStrong((id *)&self->_startupLandscapeImageConnection, 0);
  objc_storeStrong((id *)&self->_customStartupLandscapeImageData, 0);
  objc_storeStrong((id *)&self->_startupImageConnection, 0);
  objc_storeStrong((id *)&self->_customStartupImageData, 0);
  objc_storeStrong((id *)&self->_iconConnection, 0);
  objc_storeStrong((id *)&self->_customIconData, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->initialLaunchImage, 0);
  objc_storeStrong((id *)&self->startupLandscapeImage, 0);
  objc_storeStrong((id *)&self->startupImage, 0);
  objc_storeStrong((id *)&self->iconImage, 0);
  objc_storeStrong((id *)&self->manifestId, 0);
  objc_storeStrong((id *)&self->placeholderBundleIdentifier, 0);
  objc_storeStrong((id *)&self->applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->title, 0);
  objc_storeStrong((id *)&self->startupLandscapeImageURL, 0);
  objc_storeStrong((id *)&self->startupImageURL, 0);
  objc_storeStrong((id *)&self->icons, 0);
  objc_storeStrong((id *)&self->pageURL, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

@end
