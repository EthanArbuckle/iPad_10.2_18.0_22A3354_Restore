@implementation OBPrivacyLinkController

+ (Class)_platformSpecificClass
{
  return (Class)objc_opt_class();
}

+ (id)linkWithBundleIdentifiers:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
    v5 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_platformSpecificClass")), "initWithBundleIdentifiers:", v4);
  else
    v5 = 0;

  return v5;
}

+ (id)linkWithBundleIdentifier:(id)a3
{
  void *v4;
  void *v5;

  +[OBBundle bundleWithIdentifier:](OBBundle, "bundleWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "linkWithPrivacyBundle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)linkWithBundleAtPath:(id)a3
{
  void *v4;
  void *v5;

  +[OBBundle bundleAtPath:](OBBundle, "bundleAtPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "linkWithPrivacyBundle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)linkWithBundlesAtPaths:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        +[OBBundle bundleAtPath:](OBBundle, "bundleAtPath:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_platformSpecificClass")), "initWithPrivacyBundles:", v5);
  return v12;
}

+ (id)linkWithPrivacyBundle:(id)a3
{
  id v4;
  void *v5;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_platformSpecificClass")), "initWithPrivacyBundle:", v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (OBPrivacyLinkController)init
{
  OBPrivacyLinkController *v2;
  OBPrivacyLinkController *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OBPrivacyLinkController;
  v2 = -[OBPrivacyLinkController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[OBPrivacyLinkController setDisplayIcon:](v2, "setDisplayIcon:", 1);
    +[OBCapabilities sharedCapabilities](OBCapabilities, "sharedCapabilities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyLinkController setAllowsOpeningSafari:](v3, "setAllowsOpeningSafari:", objc_msgSend(v4, "preventOpeningSafari") ^ 1);

  }
  return v3;
}

- (OBPrivacyLinkController)initWithPrivacyBundles:(id)a3
{
  id v4;
  OBPrivacyLinkController *v5;
  uint64_t v6;
  NSArray *bundles;

  v4 = a3;
  v5 = -[OBPrivacyLinkController init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundles = v5->_bundles;
    v5->_bundles = (NSArray *)v6;

  }
  return v5;
}

- (OBPrivacyLinkController)initWithPrivacyBundle:(id)a3
{
  id v4;
  OBPrivacyLinkController *v5;
  void *v6;
  OBPrivacyLinkController *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "privacyFlow");
  v5 = (OBPrivacyLinkController *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[OBPrivacyLinkController initWithPrivacyBundles:](self, "initWithPrivacyBundles:", v6);

    self = v7;
    v5 = self;
  }

  return v5;
}

- (OBPrivacyLinkController)initWithBundleIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  OBPrivacyLinkController *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  NSObject *v22;
  OBPrivacyLinkController *v23;
  uint64_t v24;
  NSArray *bundleIdentifiers;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[4];
  uint64_t v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[OBBundleManager sharedManager](OBBundleManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundlesWithIdentifiers:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v27 = v4;
    if (v4)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v33 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addObject:](v7, "addObject:", v13);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
        }
        while (v10);
      }

    }
    else
    {
      v7 = 0;
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v15 = v6;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
          objc_msgSend(v20, "privacyFlow");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
          {
            _OBLoggingFacility();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              -[OBPrivacyLinkController initWithBundleIdentifiers:].cold.2(v36, v20, &v37, v22);

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      }
      while (v17);
    }

    v23 = -[OBPrivacyLinkController initWithPrivacyBundles:](self, "initWithPrivacyBundles:", v15);
    if (v23)
    {
      v24 = -[NSObject copy](v7, "copy");
      bundleIdentifiers = v23->_bundleIdentifiers;
      v23->_bundleIdentifiers = (NSArray *)v24;

    }
    self = v23;
    v14 = self;
    v4 = v27;
  }
  else
  {
    _OBLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[OBPrivacyLinkController initWithBundleIdentifiers:].cold.1((uint64_t)v4, v7);
    v14 = 0;
  }

  return v14;
}

- (OBBundle)bundle
{
  void *v3;
  void *v4;
  void *v5;

  +[OBBundleManager sharedManager](OBBundleManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacyLinkController bundles](self, "bundles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "privacyLinkBundleForBundles:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (OBBundle *)v5;
}

- (NSArray)bundles
{
  return self->_bundles;
}

- (OBPrivacyFlow)flow
{
  void *v2;
  void *v3;

  -[OBPrivacyLinkController bundle](self, "bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privacyFlow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OBPrivacyFlow *)v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OBPrivacyLinkController;
  -[OBPrivacyLinkController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  if (-[OBPrivacyLinkController isMovingToParentViewController](self, "isMovingToParentViewController"))
  {
    +[OBAnalyticsManager sharedManager](OBAnalyticsManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyLinkController bundle](self, "bundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logPresentationOfPrivacyLinkWithIdentifier:", v6);

  }
}

- (id)_privacyPresenter
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_bundleIdentifiers, "count") >= 2)
  {
    -[OBPrivacyLinkController bundles](self, "bundles");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[OBPrivacyPresenter presenterForPrivacyUnifiedAboutWithBundles:](OBPrivacyPresenter, "presenterForPrivacyUnifiedAboutWithBundles:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

    return v4;
  }
  if (self->_bundleIdentifiers
    || (-[OBPrivacyLinkController bundle](self, "bundle"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isPlaceholder"),
        v5,
        v6))
  {
    -[OBPrivacyLinkController bundle](self, "bundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[OBPrivacyPresenter presenterForPrivacySplashWithBundle:](OBPrivacyPresenter, "presenterForPrivacySplashWithBundle:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      return v4;
    goto LABEL_16;
  }
  -[OBPrivacyLinkController bundles](self, "bundles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 < 2)
  {
LABEL_16:
    -[OBPrivacyLinkController bundle](self, "bundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "underlyingBundle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bundlePath");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[OBPrivacyPresenter presenterForPrivacySplashWithBundleAtPath:](OBPrivacyPresenter, "presenterForPrivacySplashWithBundleAtPath:", v21);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[OBPrivacyLinkController bundles](self, "bundles", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "underlyingBundle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "bundlePath");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }

  +[OBPrivacyPresenter presenterForPrivacyUnifiedAboutWithBundlesAtPaths:](OBPrivacyPresenter, "presenterForPrivacyUnifiedAboutWithBundlesAtPaths:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)_linkPressed
{
  NSObject *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t v21[16];

  _OBLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_199FE5000, v3, OS_LOG_TYPE_DEFAULT, "OBPrivacy link pressed!", v21, 2u);
  }

  -[OBPrivacyLinkController _privacyPresenter](self, "_privacyPresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentingViewController:", self);
  -[OBPrivacyLinkController displayLanguage](self, "displayLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayLanguage:", v5);

  v6 = -[OBPrivacyLinkController allowsOpeningSafari](self, "allowsOpeningSafari");
  objc_msgSend(v4, "splashController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsOpeningSafari:", v6);

  v8 = -[OBPrivacyLinkController underlineLinks](self, "underlineLinks");
  objc_msgSend(v4, "splashController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUnderlineLinks:", v8);

  if (self->_didOverrideShowUnifiedAbout)
  {
    v10 = -[OBPrivacyLinkController showsLinkToUnifiedAbout](self, "showsLinkToUnifiedAbout");
    objc_msgSend(v4, "splashController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShowsLinkToUnifiedAbout:", v10);

  }
  -[OBPrivacyLinkController customTintColor](self, "customTintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCustomTintColor:", v12);

  v13 = -[OBPrivacyLinkController displayDeviceType](self, "displayDeviceType");
  objc_msgSend(v4, "splashController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDisplayDeviceType:", v13);

  -[OBPrivacyLinkController displayLanguage](self, "displayLanguage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "splashController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDisplayLanguage:", v15);

  objc_msgSend(v4, "setDarkMode:", -[OBPrivacyLinkController presentedViewControllerShouldUseDarkMode](self, "presentedViewControllerShouldUseDarkMode"));
  objc_msgSend(v4, "setModalPresentationStyle:", -[OBPrivacyLinkController modalPresentationStyle](self, "modalPresentationStyle"));
  -[OBPrivacyLinkController presentingViewController](self, "presentingViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSupportedInterfaceOrientations:", objc_msgSend(v17, "supportedInterfaceOrientations"));

  objc_msgSend(v4, "present");
  +[OBAnalyticsManager sharedManager](OBAnalyticsManager, "sharedManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacyLinkController bundle](self, "bundle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "logTapOnPrivacyLinkWithIdentifier:", v20);

}

- (void)setShowsLinkToUnifiedAbout:(BOOL)a3
{
  self->_showsLinkToUnifiedAbout = a3;
  self->_didOverrideShowUnifiedAbout = 1;
}

- (UIColor)customTintColor
{
  return self->_customTintColor;
}

- (void)setCustomTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_customTintColor, a3);
}

- (BOOL)underlineLinks
{
  return self->_underlineLinks;
}

- (void)setUnderlineLinks:(BOOL)a3
{
  self->_underlineLinks = a3;
}

- (BOOL)presentedViewControllerShouldUseDarkMode
{
  return self->_presentedViewControllerShouldUseDarkMode;
}

- (void)setPresentedViewControllerShouldUseDarkMode:(BOOL)a3
{
  self->_presentedViewControllerShouldUseDarkMode = a3;
}

- (BOOL)displayIcon
{
  return self->_displayIcon;
}

- (void)setDisplayIcon:(BOOL)a3
{
  self->_displayIcon = a3;
}

- (BOOL)displayLargeIcon
{
  return self->_displayLargeIcon;
}

- (void)setDisplayLargeIcon:(BOOL)a3
{
  self->_displayLargeIcon = a3;
}

- (BOOL)displayCaptionText
{
  return self->_displayCaptionText;
}

- (void)setDisplayCaptionText:(BOOL)a3
{
  self->_displayCaptionText = a3;
}

- (NSString)displayLanguage
{
  return (NSString *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setDisplayLanguage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1000);
}

- (unint64_t)displayDeviceType
{
  return self->_displayDeviceType;
}

- (void)setDisplayDeviceType:(unint64_t)a3
{
  self->_displayDeviceType = a3;
}

- (BOOL)allowsOpeningSafari
{
  return self->_allowsOpeningSafari;
}

- (void)setAllowsOpeningSafari:(BOOL)a3
{
  self->_allowsOpeningSafari = a3;
}

- (BOOL)showsLinkToUnifiedAbout
{
  return self->_showsLinkToUnifiedAbout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLanguage, 0);
  objc_storeStrong((id *)&self->_customTintColor, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_bundles, 0);
}

- (void)initWithBundleIdentifiers:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_199FE5000, a2, OS_LOG_TYPE_ERROR, "No bundles found for bundle identifiers: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithBundleIdentifiers:(_QWORD *)a3 .cold.2(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_199FE5000, a4, OS_LOG_TYPE_ERROR, "Privacy link controller encountered nil flow for bundle identifier %@", a1, 0xCu);

}

@end
