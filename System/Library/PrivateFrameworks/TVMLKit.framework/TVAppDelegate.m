@implementation TVAppDelegate

- (TVAppDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVAppDelegate;
  return -[TVAppDelegate init](&v3, sel_init);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TVAppDelegate;
  -[TVAppDelegate dealloc](&v4, sel_dealloc);
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  UIWindow *v8;
  UIWindow *window;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  TVApplicationController *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = a4;
  v6 = objc_alloc(MEMORY[0x24BDF6FF8]);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v8 = (UIWindow *)objc_msgSend(v6, "initWithFrame:");
  window = self->_window;
  self->_window = v8;

  -[UIWindow makeKeyWindow](self->_window, "makeKeyWindow");
  -[TVAppDelegate _launchContext](self, "_launchContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVAppDelegate launchOptionsWithDefaultOptions:](self, "launchOptionsWithDefaultOptions:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[TVAppDelegate launchOptionsWithDefaultOptions:](self, "launchOptionsWithDefaultOptions:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

  }
  else
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
  }

  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v10, "setLaunchOptions:", v14);

  v15 = -[TVApplicationController initWithContext:window:delegate:]([TVApplicationController alloc], "initWithContext:window:delegate:", v10, self->_window, self);
  objc_storeStrong((id *)&self->_appController, v15);
  -[TVApplicationController _currentNavigationController](self->_appController, "_currentNavigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "viewControllers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (!v18)
  {
    +[_TVAppLoadingView loadingScreen](_TVAppLoadingView, "loadingScreen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTimeout:", 60.0);

    +[_TVAppLoadingView loadingScreen](_TVAppLoadingView, "loadingScreen");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "showOverKeyWindowWithSpinnerOnly:", 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__controllerDidDisplay_, CFSTR("TVAppNavigationDidDisplayViewControllerNotification"), 0);

  }
  return 1;
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v3;

  if (-[TVAppDelegate shouldTerminateOnEnterBackground](self, "shouldTerminateOnEnterBackground", a3))
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "terminateWithSuccess");

  }
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;

  v7 = a5;
  v8 = a4;
  -[TVAppDelegate appController](self, "appController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "openURL:options:", v8, v7);

  return v10;
}

- (void)appController:(id)a3 evaluateAppJavaScriptInContext:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __62__TVAppDelegate_appController_evaluateAppJavaScriptInContext___block_invoke;
  v13[3] = &unk_24EB86198;
  objc_copyWeak(&v14, &location);
  v9 = (void *)MEMORY[0x22767F470](v13);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("ppt_scrollMoveTest"));

  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __62__TVAppDelegate_appController_evaluateAppJavaScriptInContext___block_invoke_2;
  v11[3] = &unk_24EB861C0;
  objc_copyWeak(&v12, &location);
  v10 = (void *)MEMORY[0x22767F470](v11);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("ppt_successTest"));

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __62__TVAppDelegate_appController_evaluateAppJavaScriptInContext___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_runScrollMoveTest:", v3);

}

void __62__TVAppDelegate_appController_evaluateAppJavaScriptInContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_successTest:callback:", v6, v5);

}

- (void)appController:(id)a3 didFailWithError:(id)a4
{
  id v6;

  v6 = a3;
  -[TVAppDelegate _presetDialogWithError:appController:](self, "_presetDialogWithError:appController:", objc_msgSend(a4, "code"), v6);

}

- (id)launchOptionsWithDefaultOptions:(id)a3
{
  return a3;
}

+ (void)showAppLoadingViewWithTimeout:(double)a3
{
  void *v4;
  id v5;

  +[_TVAppLoadingView loadingScreen](_TVAppLoadingView, "loadingScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeout:", a3);

  +[_TVAppLoadingView loadingScreen](_TVAppLoadingView, "loadingScreen");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "showOverKeyWindowWithSpinnerOnly:", 0);

}

+ (void)hideAppLoadingView
{
  id v2;

  +[_TVAppLoadingView loadingScreen](_TVAppLoadingView, "loadingScreen");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hide");

}

- (void)_runScrollMoveTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  __CFString *v18;
  _QWORD v19[5];
  __CFString *v20;
  _QWORD *v21;
  int v22;
  int v23;
  _QWORD v24[3];
  uint64_t v25;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE51928], "currentAppContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("heading"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("down")))
    v7 = 2;
  else
    v7 = 1;

  v25 = v7;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("testName"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = CFSTR("subTest");
  if (v8)
    v10 = (__CFString *)v8;
  v11 = v10;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iterations"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iterations"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "intValue");

  }
  else
  {
    v14 = 1;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offset"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offset"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "intValue");

  }
  else
  {
    v17 = 20;
  }

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __36__TVAppDelegate__runScrollMoveTest___block_invoke;
  v19[3] = &unk_24EB86210;
  v19[4] = self;
  v21 = v24;
  v18 = v11;
  v20 = v18;
  v22 = v14;
  v23 = v17;
  objc_msgSend(v5, "evaluateDelegateBlockSync:", v19);

  _Block_object_dispose(v24, 8);
}

void __36__TVAppDelegate__runScrollMoveTest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  int v17;
  void *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  id v27;

  objc_msgSend(*(id *)(a1 + 32), "appController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  objc_msgSend(v5, "templateViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  FindTestableViewForElement(v6, &v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    FindTestableViewForElement(v8, &v27);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v9 = v27;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("vertical"));
    v11 = 1;
    if (v10)
      v11 = 2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v11;
  }
  FindScrollViewFromView(v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    objc_msgSend(v12, "contentSize");
    if (v14 == 2)
      v15 = v16;
    v17 = (int)fmin(v15, 5000.0);
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __36__TVAppDelegate__runScrollMoveTest___block_invoke_2;
    v21[3] = &unk_24EB861E8;
    v22 = v13;
    v19 = *(id *)(a1 + 40);
    v25 = *(_QWORD *)(a1 + 56);
    v26 = v17;
    v20 = *(_QWORD *)(a1 + 48);
    v23 = v19;
    v24 = v20;
    objc_msgSend(v18, "installCACommitCompletionBlock:", v21);

  }
}

uint64_t __36__TVAppDelegate__runScrollMoveTest___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performScrollTest:iterations:delta:length:scrollAxis:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60), *(unsigned int *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
}

- (void)_successTest:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  __CFString *v20;
  id v21;
  id v22;
  id v23;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE51928], "currentAppContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("testName"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("subTest");
  if (v9)
    v11 = (__CFString *)v9;
  v12 = v11;

  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __39__TVAppDelegate__successTest_callback___block_invoke;
  v19[3] = &unk_24EB86260;
  v13 = v12;
  v20 = v13;
  objc_copyWeak(&v23, &location);
  v14 = v8;
  v21 = v14;
  v15 = v7;
  v22 = v15;
  objc_msgSend(v14, "evaluateDelegateBlockSync:", v19);
  if (v15)
  {
    objc_msgSend(v14, "jsContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("App"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "virtualMachine");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addManagedReference:withOwner:", v15, v17);

  }
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
}

void __39__TVAppDelegate__successTest_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startedTest:", *(_QWORD *)(a1 + 32));

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__TVAppDelegate__successTest_callback___block_invoke_2;
  v7[3] = &unk_24EB86238;
  objc_copyWeak(&v10, (id *)(a1 + 56));
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v5, "finishedTest:extraResults:withTeardownBlock:", v6, 0, v7);

  objc_destroyWeak(&v10);
}

void __39__TVAppDelegate__successTest_callback___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __39__TVAppDelegate__successTest_callback___block_invoke_3;
    v4[3] = &unk_24EB85370;
    v3 = *(void **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    objc_msgSend(v3, "evaluate:completionBlock:", v4, 0);

  }
}

void __39__TVAppDelegate__successTest_callback___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  id v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = a2;
    v5 = (id)objc_msgSend(v2, "callWithArguments:", 0);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("App"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "virtualMachine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), v7);
  }
}

- (id)_launchContext
{
  TVApplicationControllerContext *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(TVApplicationControllerContext);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "infoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", CFSTR("TVBootURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length")
    && (objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringForKey:", CFSTR("boot-url"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "length"))
    {
      v10 = TVMLKitLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v9;
        _os_log_impl(&dword_222D98000, v10, OS_LOG_TYPE_DEFAULT, "Overriding the boot-url to: %@", (uint8_t *)&v13, 0xCu);
      }
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
      v11 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v11;
    }
    -[TVApplicationControllerContext setJavaScriptApplicationURL:](v2, "setJavaScriptApplicationURL:", v7);

  }
  else
  {
    v9 = v5;
  }

  return v2;
}

- (void)_controllerDidDisplay:(id)a3
{
  void *v4;
  id v5;

  +[_TVAppLoadingView loadingScreen](_TVAppLoadingView, "loadingScreen", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hide");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("TVAppNavigationDidDisplayViewControllerNotification"), 0);

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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UIWindow *window;
  void *v25;
  UIWindow *v26;

  v26 = (UIWindow *)a4;
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
    if ((unint64_t)objc_msgSend(v11, "length") >= 0x15)
    {
      v14 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v11, "substringToIndex:", 20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%@..."), v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v16;
    }
    v17 = (void *)MEMORY[0x24BDD17C8];
    _TVMLLocString(CFSTR("TVExternalAppFailureTitle"), CFSTR("Localizable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", v18, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    _TVMLLocString(CFSTR("TVExternalAppFailureBody"), CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x24BDF67E8];
  _TVMLLocString(CFSTR("TVAppOK"), CFSTR("Localizable"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 1, &__block_literal_global_20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "addAction:", v22);
  -[TVAppDelegate setShouldTerminateOnEnterBackground:](self, "setShouldTerminateOnEnterBackground:", 1);
  +[_TVAppLoadingView loadingScreen](_TVAppLoadingView, "loadingScreen");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "hide");

  -[UIWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible");
  window = v26;
  if (!v26)
    window = self->_window;
  -[UIWindow rootViewController](window, "rootViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "presentViewController:animated:completion:", v19, 1, 0);

}

void __54__TVAppDelegate__presetDialogWithError_appController___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDF6F78]);
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_mainScene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendActions:", v2);

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

- (void)setAppController:(id)a3
{
  objc_storeStrong((id *)&self->_appController, a3);
}

- (BOOL)shouldTerminateOnEnterBackground
{
  return self->_shouldTerminateOnEnterBackground;
}

- (void)setShouldTerminateOnEnterBackground:(BOOL)a3
{
  self->_shouldTerminateOnEnterBackground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appController, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
