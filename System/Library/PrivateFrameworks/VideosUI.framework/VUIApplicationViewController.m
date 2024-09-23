@implementation VUIApplicationViewController

- (void)dealloc
{
  UINavigationController *navigationController;
  void *v4;
  objc_super v5;

  -[VUITVApplicationController stop](self->_applicationController, "stop");
  navigationController = self->_navigationController;
  if (navigationController)
  {
    -[UINavigationController willMoveToParentViewController:](navigationController, "willMoveToParentViewController:", 0);
    -[UINavigationController view](self->_navigationController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");
    -[UINavigationController removeFromParentViewController](self->_navigationController, "removeFromParentViewController");

  }
  v5.receiver = self;
  v5.super_class = (Class)VUIApplicationViewController;
  -[VUIApplicationViewController dealloc](&v5, sel_dealloc);
}

- (id)preferredFocusEnvironments
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[VUIApplicationViewController navigationController](self, "navigationController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VUIApplicationViewController;
    -[VUIApplicationViewController preferredFocusEnvironments](&v8, sel_preferredFocusEnvironments);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (void)viewDidLoad
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VUIApplicationViewController;
  -[VUIApplicationViewController viewDidLoad](&v12, sel_viewDidLoad);
  v3 = kVUIBagTVAppJetpackURL;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIJetPackController controllerWithBagKey:defaults:urlOverrideDefaultKey:](_TtC8VideosUI20VUIJetPackController, "controllerWithBagKey:defaults:urlOverrideDefaultKey:", v3, v4, CFSTR("boot-url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIApplicationViewController setJetPackController:](self, "setJetPackController:", v5);
  objc_initWeak(&location, self);
  objc_msgSend(v5, "getJetPackSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__VUIApplicationViewController_viewDidLoad__block_invoke;
  v8[3] = &unk_1E9F9CB80;
  objc_copyWeak(&v10, &location);
  v7 = v5;
  v9 = v7;
  objc_msgSend(v6, "resultWithCompletion:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __43__VUIApplicationViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__VUIApplicationViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_1E9F99000;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __43__VUIApplicationViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "jetPackController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v6;
    if (v3 == v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "url");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_startApplicationControllerWithBootURL:", v5);

      objc_msgSend(v6, "setJetPackController:", 0);
      WeakRetained = v6;
    }
  }

}

- (void)appController:(id)a3 evaluateAppJavaScriptInContext:(id)a4
{
  id v5;

  v5 = a4;
  +[VUIJSFactory exposeObjectsInJSContext:](VUIJSFactory, "exposeObjectsInJSContext:", v5);
  -[VUIApplicationViewController _exposeObjectsInJSContext:](self, "_exposeObjectsInJSContext:", v5);

}

- (void)appController:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v6;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_INFO, "VUIApplicationViewController: TVApplicationController did finish launching with options: %@", buf, 0xCu);
  }

  objc_msgSend(v7, "appContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIApplicationViewController _initialViewControllerWithAppContext:](self, "_initialViewControllerWithAppContext:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[VUIApplicationViewController navigationController](self, "navigationController");
    v11 = objc_claimAutoreleasedReturnValue();
    v20 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setViewControllers:animated:](v11, "setViewControllers:animated:", v12, 0);

  }
  else
  {
    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[VUIApplicationViewController appController:didFinishLaunchingWithOptions:].cold.1(v11, v13, v14, v15, v16, v17, v18, v19);
  }

}

- (void)appController:(id)a3 didFailWithError:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[VUIApplicationViewController appController:didFailWithError:].cold.1((uint64_t)v4, v5);

}

- (Class)_applicationControllerClass
{
  return (Class)objc_opt_class();
}

- (id)_launchOptions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)_initialViewControllerWithAppContext:(id)a3
{
  return 0;
}

- (void)_startApplicationControllerWithBootURL:(id)a3
{
  id v4;
  void *v5;
  VUITVApplicationControllerContext *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v4 = a3;
  -[VUIApplicationViewController applicationController](self, "applicationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    VUIDefaultLogObject();
    v6 = (VUITVApplicationControllerContext *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR))
      -[VUIApplicationViewController _startApplicationControllerWithBootURL:].cold.2(&v6->super, v7, v8, v9, v10, v11, v12, v13);
  }
  else if (v4)
  {
    v6 = objc_alloc_init(VUITVApplicationControllerContext);
    -[VUITVApplicationControllerContext setJavaScriptApplicationURL:](v6, "setJavaScriptApplicationURL:", v4);
    -[VUIApplicationViewController _launchOptions](self, "_launchOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = objc_msgSend(v14, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v24 = (void *)v16;
    objc_msgSend(MEMORY[0x1E0DC69E0], "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "osFeatureFlagsJSON");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v26, "count"))
      objc_msgSend(v24, "setObject:forKey:", v26, CFSTR("featureFlags"));
    v27 = (void *)objc_msgSend(v24, "copy");
    -[VUITVApplicationControllerContext setLaunchOptions:](v6, "setLaunchOptions:", v27);

    v28 = (void *)objc_msgSend(objc_alloc(-[VUIApplicationViewController _applicationControllerClass](self, "_applicationControllerClass")), "initWithContext:window:delegate:", v6, 0, self);
    -[VUIApplicationViewController setApplicationController:](self, "setApplicationController:", v28);
    objc_msgSend(v28, "navigationController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIApplicationViewController setNavigationController:](self, "setNavigationController:", v29);
    -[VUIApplicationViewController addChildViewController:](self, "addChildViewController:", v29);
    -[VUIApplicationViewController view](self, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bounds");
    objc_msgSend(v31, "setFrame:");
    objc_msgSend(v30, "addSubview:", v31);
    objc_msgSend(v29, "didMoveToParentViewController:", self);
    objc_msgSend(v28, "setKeyTraitEnvironment:", v30);

  }
  else
  {
    VUIDefaultLogObject();
    v6 = (VUITVApplicationControllerContext *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR))
      -[VUIApplicationViewController _startApplicationControllerWithBootURL:].cold.1(&v6->super, v17, v18, v19, v20, v21, v22, v23);
  }

}

- (VUITVApplicationController)applicationController
{
  return self->_applicationController;
}

- (void)setApplicationController:(id)a3
{
  objc_storeStrong((id *)&self->_applicationController, a3);
}

- (_TtC8VideosUI20VUIJetPackController)jetPackController
{
  return self->_jetPackController;
}

- (void)setJetPackController:(id)a3
{
  objc_storeStrong((id *)&self->_jetPackController, a3);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_jetPackController, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
}

- (void)appController:(uint64_t)a3 didFinishLaunchingWithOptions:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "VUIApplicationViewController: No initial view controller is available!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_14();
}

- (void)appController:(uint64_t)a1 didFailWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D96EE000, a2, OS_LOG_TYPE_ERROR, "VUIApplicationViewController: VUITVApplicationController failed to launch with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_startApplicationControllerWithBootURL:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "VUIApplicationViewController:_startApplicationControllerWithBootURL: Requires a non nil bootURL!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_14();
}

- (void)_startApplicationControllerWithBootURL:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "VUIApplicationViewController:_startApplicationControllerWithBootURL: Should only be called once!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_14();
}

@end
