@implementation TVStoreApplicationDelegate

- (TVStoreApplicationDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVStoreApplicationDelegate;
  return -[TVStoreApplicationDelegate init](&v3, sel_init);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TVStoreApplicationDelegate;
  -[TVStoreApplicationDelegate dealloc](&v4, sel_dealloc);
}

- (id)bagBootURLKey
{
  if (objc_msgSend(MEMORY[0x24BE51928], "isInFactoryMode"))
    return 0;
  else
    return CFSTR("itml-app-url");
}

- (id)_bagBootURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[TVStoreApplicationDelegate bagBootURLKey](self, "bagBootURLKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDBCF48];
    v5 = (void *)MEMORY[0x24BDD17C8];
    -[TVStoreApplicationDelegate bagBootURLKey](self, "bagBootURLKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("com.apple.TVMLKit.bagBootURLKey://%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)cachedBagPath
{
  return 0;
}

- (id)bootURL
{
  return 0;
}

- (id)appLocalBootURL
{
  return 0;
}

- (id)offlineJSURL
{
  return 0;
}

- (void)reload
{
  id v2;

  -[TVStoreApplicationDelegate appController](self, "appController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reload");

}

- (BOOL)supportsIdleModeVisualEffects
{
  return 1;
}

- (void)updateIdleModeVisualEffectsStatus:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;

  v3 = a3;
  if (-[TVStoreApplicationDelegate supportsIdleModeVisualEffects](self, "supportsIdleModeVisualEffects"))
  {
    v5 = TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG))
      -[TVStoreApplicationDelegate updateIdleModeVisualEffectsStatus:].cold.1(v3, v5);
    objc_msgSend((id)*MEMORY[0x24BDF74F8], "_setIdleModeVisualEffectsEnabled:", -[TVStoreApplicationDelegate supportsIdleModeVisualEffects](self, "supportsIdleModeVisualEffects") & v3);
  }
}

- (BOOL)shouldBeForcedLeftToRight
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.TVShows")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.TVMovies"));

  return v4;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  IKURLBagCache *v9;
  IKURLBagCache *bagCache;
  id v11;
  void *v12;
  UIWindow *v13;
  UIWindow *window;
  UIWindow *v15;
  void *v16;
  UIWindow *v17;
  void *v18;
  NSDictionary *v19;
  NSDictionary *launchOptions;
  void *v21;
  void *v22;
  void *v23;
  uint8_t v25[16];

  v6 = a3;
  v7 = a4;
  v8 = TVMLKitSignpostLogObject;
  if (os_signpost_enabled((os_log_t)TVMLKitSignpostLogObject))
  {
    *(_WORD *)v25 = 0;
    _os_signpost_emit_with_name_impl(&dword_222D98000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TVApplicationControllerSetup", (const char *)&unk_222E7E612, v25, 2u);
  }
  if (-[TVStoreApplicationDelegate shouldBeForcedLeftToRight](self, "shouldBeForcedLeftToRight"))
    objc_msgSend((id)*MEMORY[0x24BDF74F8], "_setForcedUserInterfaceLayoutDirection:", 0);
  objc_msgSend(MEMORY[0x24BE51A18], "sharedCache");
  v9 = (IKURLBagCache *)objc_claimAutoreleasedReturnValue();
  bagCache = self->_bagCache;
  self->_bagCache = v9;

  v11 = objc_alloc(MEMORY[0x24BDF6FF8]);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v13 = (UIWindow *)objc_msgSend(v11, "initWithFrame:");
  window = self->_window;
  self->_window = v13;

  v15 = self->_window;
  objc_msgSend(MEMORY[0x24BDF6950], "tvmlkit_keyColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow setTintColor:](v15, "setTintColor:", v16);

  v17 = self->_window;
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow setBackgroundColor:](v17, "setBackgroundColor:", v18);

  v19 = (NSDictionary *)objc_msgSend(v7, "copy");
  launchOptions = self->_launchOptions;
  self->_launchOptions = v19;

  +[_TVAppLoadingView loadingScreen](_TVAppLoadingView, "loadingScreen");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTimeout:", 60.0);

  +[_TVAppLoadingView loadingScreen](_TVAppLoadingView, "loadingScreen");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "showOverKeyWindowWithSpinnerOnly:", 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObserver:selector:name:object:", self, sel__controllerDidDisplay_, CFSTR("TVAppNavigationDidDisplayViewControllerNotification"), 0);

  -[TVStoreApplicationDelegate _launchApp](self, "_launchApp");
  return 1;
}

- (void)_launchApp
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  -[TVStoreApplicationDelegate bootURL](self, "bootURL");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(MEMORY[0x24BE51928], "isInFactoryMode"))
  {
    -[TVStoreApplicationDelegate _bagBootURL](self, "_bagBootURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[TVStoreApplicationSetupHelper bootURLWithBagBootURL:defaultBootURL:](TVStoreApplicationSetupHelper, "bootURLWithBagBootURL:defaultBootURL:", v5, v8);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v3 = v8;
  if (!v8)
  {
    v4 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("boot-url"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = v6;

    v3 = (id)v7;
  }
  v9 = v3;
  -[TVStoreApplicationDelegate _loadWithBootURL:](self, "_loadWithBootURL:", v3);

}

- (void)applicationDidEnterBackground:(id)a3
{
  id v3;

  if (self->_shouldTerminateOnEnterBackground)
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication", a3);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "terminateWithSuccess");

  }
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *launchOpenURLOptions;
  char v12;
  NSDictionary *v13;

  v8 = a4;
  v9 = a5;
  -[TVStoreApplicationDelegate appController](self, "appController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TVStoreApplicationDelegate appController](self, "appController");
    launchOpenURLOptions = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(launchOpenURLOptions, "openURL:options:", v8, v9);
  }
  else
  {
    if (!v8)
    {
      v12 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&self->_launchOpenURL, a4);
    v13 = (NSDictionary *)v9;
    launchOpenURLOptions = self->_launchOpenURLOptions;
    self->_launchOpenURLOptions = v13;
    v12 = 1;
  }

LABEL_6:
  return v12;
}

- (void)appController:(id)a3 didFailWithError:(id)a4
{
  id v6;

  v6 = a3;
  -[TVStoreApplicationDelegate _presetDialogWithError:appController:](self, "_presetDialogWithError:appController:", objc_msgSend(a4, "code"), v6);

}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 1)
    return 30;
  if (TVShouldConstrainToPortait()
    && !-[TVStoreApplicationDelegate overrideOrientation](self, "overrideOrientation"))
  {
    return 2;
  }
  return 26;
}

- (void)_loadWithBootURL:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  TVApplicationController *v16;
  void *v17;
  NSURL *launchOpenURL;
  NSDictionary *launchOpenURLOptions;
  NSObject *v20;
  NSObject *v21;
  uint8_t v22[16];
  uint8_t buf[16];

  v4 = (unint64_t)a3;
  -[TVStoreApplicationDelegate bagBootURLKey](self, "bagBootURLKey");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v4 | v5;

  if (v6)
  {
    -[TVStoreApplicationDelegate _bagBootURL](self, "_bagBootURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v4, "isEqual:", v8))
    {
      -[TVStoreApplicationDelegate bagBootURLKey](self, "bagBootURLKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

    if (v9)
      v10 = 0;
    else
      v10 = (void *)v4;
    v11 = v10;

    -[TVStoreApplicationDelegate setupWithBootURL:](self, "setupWithBootURL:", v11);
    v12 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[TVStoreApplicationDelegate offlineJSURL](self, "offlineJSURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[TVStoreApplicationDelegate appLocalBootURL](self, "appLocalBootURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[TVStoreApplicationSetupHelper launchContextWithLaunchOptions:bootURL:bagBootURLKey:useCache:](TVStoreApplicationSetupHelper, "launchContextWithLaunchOptions:bootURL:bagBootURLKey:useCache:", self->_launchOptions, v11, v9, v13 != 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v12)
      objc_msgSend(v14, "setOfflineJSURL:", v12);
    else
      objc_msgSend(v14, "setAppLocalJSURL:", v13);
    v16 = -[TVApplicationController initWithContext:window:delegate:]([TVApplicationController alloc], "initWithContext:window:delegate:", v15, self->_window, self);
    objc_storeStrong((id *)&self->_appController, v16);
    if (self->_launchOpenURL)
    {
      -[TVStoreApplicationDelegate appController](self, "appController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "openURL:options:", self->_launchOpenURL, self->_launchOpenURLOptions);

      launchOpenURL = self->_launchOpenURL;
      self->_launchOpenURL = 0;

      launchOpenURLOptions = self->_launchOpenURLOptions;
      self->_launchOpenURLOptions = 0;

    }
  }
  else
  {
    v7 = TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_ERROR))
      -[TVStoreApplicationDelegate _loadWithBootURL:].cold.1(v7);
    -[TVStoreApplicationDelegate _presetDialogWithError:appController:](self, "_presetDialogWithError:appController:", 3, 0);
  }
  v20 = TVMLKitSignpostLogObject;
  if (os_signpost_enabled((os_log_t)TVMLKitSignpostLogObject))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_222D98000, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TVApplicationControllerSetup", (const char *)&unk_222E7E612, buf, 2u);
  }
  v21 = TVMLKitSignpostLogObject;
  if (os_signpost_enabled((os_log_t)TVMLKitSignpostLogObject))
  {
    *(_WORD *)v22 = 0;
    _os_signpost_emit_with_name_impl(&dword_222D98000, v21, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TVApplicationControllerJSEvaluation", (const char *)&unk_222E7E612, v22, 2u);
  }
}

- (void)_controllerDidDisplay:(id)a3
{
  void *v4;
  void *v5;

  +[_TVAppLoadingView loadingScreen](_TVAppLoadingView, "loadingScreen", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hide");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("TVAppNavigationDidDisplayViewControllerNotification"), 0);

  -[TVStoreApplicationDelegate didShowViewController](self, "didShowViewController");
}

- (void)_presetDialogWithError:(int64_t)a3 appController:(id)a4
{
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
  void *v19;
  void *v20;
  UIWindow *window;
  UIWindow *v22;
  void *v23;
  UIWindow *v24;
  void *v25;
  void *v26;
  UIWindow *v27;

  v27 = (UIWindow *)a4;
  if (self->_headLess)
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "terminateWithSuccess");

  }
  if (a3 == 2)
  {
    _TVMLLocString(CFSTR("TVAppInternetUnavailableTitle"), CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _TVMLLocString(CFSTR("TVAppInternetUnavailableError"), CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedInfoDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("CFBundleName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "infoDictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", CFSTR("CFBundleName"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v14 = (void *)MEMORY[0x24BDD17C8];
    _TVMLLocString(CFSTR("TVInternalAppFailureTitle"), CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v15, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    _TVMLLocString(CFSTR("TVInternalAppFailureBody"), CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDF67E8];
  _TVMLLocString(CFSTR("TVAppOK"), CFSTR("Localizable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 1, &__block_literal_global_28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "addAction:", v19);
  self->_shouldTerminateOnEnterBackground = 1;
  +[_TVAppLoadingView loadingScreen](_TVAppLoadingView, "loadingScreen");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "hide");

  window = self->_window;
  if (v27)
  {
    -[UIWindow makeKeyAndVisible](window, "makeKeyAndVisible");
    v22 = v27;
  }
  else
  {
    -[UIWindow rootViewController](window, "rootViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      v24 = self->_window;
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F98]), "initWithNibName:bundle:", 0, 0);
      -[UIWindow setRootViewController:](v24, "setRootViewController:", v25);

    }
    -[UIWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible");
    v22 = self->_window;
  }
  -[UIWindow rootViewController](v22, "rootViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "presentViewController:animated:completion:", v16, 1, 0);

}

void __67__TVStoreApplicationDelegate__presetDialogWithError_appController___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "terminateWithSuccess");

}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (TVApplicationController)appController
{
  return self->_appController;
}

- (IKURLBagCache)bagCache
{
  return self->_bagCache;
}

- (BOOL)overrideOrientation
{
  return self->_overrideOrientation;
}

- (void)setOverrideOrientation:(BOOL)a3
{
  self->_overrideOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagCache, 0);
  objc_storeStrong((id *)&self->_appController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_launchOpenURLOptions, 0);
  objc_storeStrong((id *)&self->_launchOpenURL, 0);
  objc_storeStrong((id *)&self->_launchOptions, 0);
  objc_storeStrong((id *)&self->_setupHelper, 0);
}

- (void)updateIdleModeVisualEffectsStatus:(char)a1 .cold.1(char a1, NSObject *a2)
{
  const __CFString *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = CFSTR("disabled");
  if ((a1 & 1) != 0)
    v2 = CFSTR("enabled");
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_222D98000, a2, OS_LOG_TYPE_DEBUG, "Idle mode visual effects are %@", (uint8_t *)&v3, 0xCu);
}

- (void)_loadWithBootURL:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_222D98000, log, OS_LOG_TYPE_ERROR, "Unable to load with empty boot url", v1, 2u);
}

@end
