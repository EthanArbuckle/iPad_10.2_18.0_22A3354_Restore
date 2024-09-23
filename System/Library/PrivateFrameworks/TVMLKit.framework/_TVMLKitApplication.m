@implementation _TVMLKitApplication

- (_TVMLKitApplication)initWithLaunchContext:(id)a3
{
  id v4;
  _TVMLKitApplication *v5;
  _TVMLKitApplication *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_TVMLKitApplication;
  v5 = -[_TVMLKitApplication init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_launchContext, v4);
    v6->_headless = 0;
  }

  return v6;
}

- (BOOL)supportsPictureInPicturePlayback
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_launchContext);
  v3 = objc_msgSend(WeakRetained, "supportsPictureInPicturePlayback");

  return v3;
}

- (id)activeDocument
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[_TVMLKitApplication appRootViewController](self, "appRootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentNavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "conformsToProtocol:", &unk_2557AEB30))
    v4 = v3;
  else
    v4 = 0;
  objc_msgSend(v4, "activeDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)appIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)appJSURL
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_launchContext);
  objc_msgSend(WeakRetained, "javaScriptApplicationURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)appLocalJSURL
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_launchContext);
  objc_msgSend(WeakRetained, "appLocalJSURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)appJSCachePath
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_launchContext);
  objc_msgSend(WeakRetained, "appJSCachePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)offlineJSURL
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_launchContext);
  objc_msgSend(WeakRetained, "offlineJSURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bagBootURLKey
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_launchContext);
  objc_msgSend(WeakRetained, "bagBootURLKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)appLaunchParams
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  -[_TVMLKitApplication appJSURL](self, "appJSURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("location"));
  -[_TVMLKitApplication bagBootURLKey](self, "bagBootURLKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("bagBootURLKey"));
  -[_TVMLKitApplication javaScriptLaunchOptions](self, "javaScriptLaunchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[_TVMLKitApplication javaScriptLaunchOptions](self, "javaScriptLaunchOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEntriesFromDictionary:", v9);

  }
  if (self->_headless)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("background"), CFSTR("launchContext"));
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (BOOL)shouldIgnoreJSValidation
{
  return 1;
}

- (id)vendorIdentifier
{
  return 0;
}

- (id)vendorStorage
{
  return 0;
}

- (id)userDefaultsStorage
{
  return (id)objc_msgSend(MEMORY[0x24BE51950], "sharedUserDefaults");
}

- (BOOL)appIsTrusted
{
  void *v2;
  char v3;

  +[_TVProcessInfo currentProcessInfo](_TVProcessInfo, "currentProcessInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasiTunesAPIEntitlement");

  return v3;
}

- (BOOL)appIsPrivileged
{
  void *v2;
  char v3;

  +[_TVProcessInfo currentProcessInfo](_TVProcessInfo, "currentProcessInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrivateEntitlement");

  return v3;
}

- (id)appTraitCollection
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  uint64_t v27;
  __CFString *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  double v39;
  uint64_t v40;
  void *v41;
  __CFString *v42;
  __CFString *v43;
  uint64_t v44;
  const __CFString *v45;
  void *v46;
  id v47;
  __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __CFString *v55;
  _QWORD v56[12];
  _QWORD v57[14];

  v57[12] = *MEMORY[0x24BDAC8D0];
  -[_TVMLKitApplication keyWindow](self, "keyWindow");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = !self->_headless && v3 == 0;
  v6 = (id *)MEMORY[0x24BDF74F8];
  if (v5)
  {
    objc_msgSend((id)*MEMORY[0x24BDF74F8], "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*v6, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "window");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }

  }
  if (v4)
  {
    objc_msgSend(v4, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      goto LABEL_14;
  }
  -[_TVMLKitApplication keyTraitEnvironment](self, "keyTraitEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_35;
  -[_TVMLKitApplication keyTraitEnvironment](self, "keyTraitEnvironment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
LABEL_14:
    v12 = objc_msgSend(*v6, "userInterfaceLayoutDirection");
    v13 = objc_msgSend(*v6, "statusBarOrientation");
    v56[0] = CFSTR("userInterfaceIdiom");
    v14 = objc_msgSend(v9, "userInterfaceIdiom");
    if (UserInterfaceString_onceToken != -1)
      dispatch_once(&UserInterfaceString_onceToken, &__block_literal_global_3);
    v15 = (void *)UserInterfaceString_userInterfaceStrings;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (__CFString *)v17;
    else
      v19 = CFSTR("unspecified");
    v20 = v19;

    v57[0] = v20;
    v56[1] = CFSTR("screenWidth");
    v21 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "bounds");
    objc_msgSend(v21, "numberWithDouble:", v22);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v53;
    v56[2] = CFSTR("screenHeight");
    v23 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bounds");
    objc_msgSend(v23, "numberWithDouble:", v25);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v57[2] = v51;
    v56[3] = CFSTR("displayScale");
    v26 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v9, "displayScale");
    objc_msgSend(v26, "numberWithDouble:");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = CFSTR("ltr");
    if (v12 == 1)
      v28 = CFSTR("rtl");
    v50 = (void *)v27;
    v57[3] = v27;
    v57[4] = v28;
    v56[4] = CFSTR("layoutDirection");
    v56[5] = CFSTR("horizontalSizeClass");
    v49 = v28;
    SizeClassString(objc_msgSend(v9, "horizontalSizeClass"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v57[5] = v29;
    v56[6] = CFSTR("verticalSizeClass");
    SizeClassString(objc_msgSend(v9, "verticalSizeClass"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v57[6] = v30;
    v56[7] = CFSTR("preferredContentSizeCategory");
    objc_msgSend(v9, "preferredContentSizeCategory");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    v55 = v20;
    v52 = v24;
    if ((id)*MEMORY[0x24BDF7690] == v31)
    {
      v33 = CFSTR("extraSmall");
    }
    else if ((id)*MEMORY[0x24BDF76B8] == v31)
    {
      v33 = CFSTR("small");
    }
    else if ((id)*MEMORY[0x24BDF76A8] == v31)
    {
      v33 = CFSTR("medium");
    }
    else if ((id)*MEMORY[0x24BDF76A0] == v31)
    {
      v33 = CFSTR("large");
    }
    else if ((id)*MEMORY[0x24BDF7688] == v31)
    {
      v33 = CFSTR("extraLarge");
    }
    else if ((id)*MEMORY[0x24BDF7680] == v31)
    {
      v33 = CFSTR("extraExtraLarge");
    }
    else if ((id)*MEMORY[0x24BDF7678] == v31)
    {
      v33 = CFSTR("extraExtraExtraLarge");
    }
    else if ((id)*MEMORY[0x24BDF7660] == v31)
    {
      v33 = CFSTR("accessibilityMedium");
    }
    else if ((id)*MEMORY[0x24BDF7658] == v31)
    {
      v33 = CFSTR("accessibilityLarge");
    }
    else if ((id)*MEMORY[0x24BDF7650] == v31)
    {
      v33 = CFSTR("accessibilityExtraLarge");
    }
    else if ((id)*MEMORY[0x24BDF7648] == v31)
    {
      v33 = CFSTR("accessibilityExtraExtraLarge");
    }
    else if ((id)*MEMORY[0x24BDF7640] == v31)
    {
      v33 = CFSTR("accessibilityExtraExtraExtraLarge");
    }
    else
    {
      v33 = CFSTR("unspecified");
    }

    v57[7] = v33;
    v56[8] = CFSTR("windowWidth");
    v35 = (void *)MEMORY[0x24BDD16E0];
    v36 = v33;
    objc_msgSend(v4, "size");
    objc_msgSend(v35, "numberWithDouble:");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v57[8] = v37;
    v56[9] = CFSTR("windowHeight");
    v38 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "size");
    objc_msgSend(v38, "numberWithDouble:", v39);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)v40;
    v42 = CFSTR("landscape");
    if ((unint64_t)(v13 - 3) >= 2)
      v42 = CFSTR("unspecified");
    if ((unint64_t)(v13 - 1) < 2)
      v42 = CFSTR("portrait");
    v57[9] = v40;
    v57[10] = v42;
    v56[10] = CFSTR("orientation");
    v56[11] = CFSTR("forceTouchCapable");
    v43 = v42;
    v44 = objc_msgSend(v9, "forceTouchCapability");
    v45 = CFSTR("false");
    if (v44 == 2)
      v45 = CFSTR("true");
    v57[11] = v45;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 12);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_35:
    v34 = 0;
  }
  if (v34)
    v46 = v34;
  else
    v46 = (void *)MEMORY[0x24BDBD1B8];
  v47 = v46;

  return v47;
}

- (TVApplicationControllerContext)launchContext
{
  return (TVApplicationControllerContext *)objc_loadWeakRetained((id *)&self->_launchContext);
}

- (void)setLaunchContext:(id)a3
{
  objc_storeWeak((id *)&self->_launchContext, a3);
}

- (IKAppDataStorage)localDataStorage
{
  return (IKAppDataStorage *)objc_loadWeakRetained((id *)&self->_localDataStorage);
}

- (void)setLocalDataStorage:(id)a3
{
  objc_storeWeak((id *)&self->_localDataStorage, a3);
}

- (TVAppRootViewController)appRootViewController
{
  return (TVAppRootViewController *)objc_loadWeakRetained((id *)&self->_appRootViewController);
}

- (void)setAppRootViewController:(id)a3
{
  objc_storeWeak((id *)&self->_appRootViewController, a3);
}

- (UIWindow)keyWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_keyWindow);
}

- (void)setKeyWindow:(id)a3
{
  objc_storeWeak((id *)&self->_keyWindow, a3);
}

- (UITraitEnvironment)keyTraitEnvironment
{
  return (UITraitEnvironment *)objc_loadWeakRetained((id *)&self->_keyTraitEnvironment);
}

- (void)setKeyTraitEnvironment:(id)a3
{
  objc_storeWeak((id *)&self->_keyTraitEnvironment, a3);
}

- (NSDictionary)javaScriptLaunchOptions
{
  return self->_javaScriptLaunchOptions;
}

- (void)setJavaScriptLaunchOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)headless
{
  return self->_headless;
}

- (void)setHeadless:(BOOL)a3
{
  self->_headless = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_javaScriptLaunchOptions, 0);
  objc_destroyWeak((id *)&self->_keyTraitEnvironment);
  objc_destroyWeak((id *)&self->_keyWindow);
  objc_destroyWeak((id *)&self->_appRootViewController);
  objc_destroyWeak((id *)&self->_localDataStorage);
  objc_destroyWeak((id *)&self->_launchContext);
}

@end
