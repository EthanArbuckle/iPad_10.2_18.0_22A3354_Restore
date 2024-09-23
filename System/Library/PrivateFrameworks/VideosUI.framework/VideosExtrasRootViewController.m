@implementation VideosExtrasRootViewController

+ (id)currentController
{
  return objc_loadWeakRetained(&__currentController);
}

- (void)_setUpForApplication
{
  IKAppDataStoring *v3;
  IKAppDataStoring *localStorage;
  IKAppDataStoring *v5;
  IKAppDataStoring *vendorStorage;
  IKAppUserDefaultsStoring *v7;
  IKAppUserDefaultsStoring *userDefaultsStorage;
  VideosExtrasNavigationController *v9;
  id WeakRetained;
  VideosExtrasNavigationController *v11;
  id v12;
  void *v13;
  VideosExtrasFeatureContainerViewController *v14;
  id v15;
  VideosExtrasFeatureContainerViewController *v16;
  VideosExtrasFeatureContainerViewController *featureContainer;
  id v18;
  IKAppContext *v19;
  IKAppContext *applicationContext;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  -[VideosExtrasRootViewController _stopOldContextIfNeeded](self, "_stopOldContextIfNeeded");
  -[VideosExtrasRootViewController _createDataStorageForIdentifier:](self, "_createDataStorageForIdentifier:", CFSTR("localStorage"));
  v3 = (IKAppDataStoring *)objc_claimAutoreleasedReturnValue();
  localStorage = self->_localStorage;
  self->_localStorage = v3;

  -[VideosExtrasRootViewController _createDataStorageForIdentifier:](self, "_createDataStorageForIdentifier:", CFSTR("vendorStorage"));
  v5 = (IKAppDataStoring *)objc_claimAutoreleasedReturnValue();
  vendorStorage = self->_vendorStorage;
  self->_vendorStorage = v5;

  objc_msgSend(MEMORY[0x1E0D3A5F0], "sharedUserDefaults");
  v7 = (IKAppUserDefaultsStoring *)objc_claimAutoreleasedReturnValue();
  userDefaultsStorage = self->_userDefaultsStorage;
  self->_userDefaultsStorage = v7;

  v9 = [VideosExtrasNavigationController alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v11 = -[VideosExtrasNavigationController initWithContext:](v9, "initWithContext:", WeakRetained);

  -[VideosExtrasNavigationController setShowsBuiltInNavControls:](v11, "setShowsBuiltInNavControls:", -[VideosExtrasRootViewController showsBuiltInNavigationControls](self, "showsBuiltInNavigationControls"));
  v12 = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(v12, "featurePlaybackViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = [VideosExtrasFeatureContainerViewController alloc];
    v15 = objc_loadWeakRetained((id *)&self->_context);
    v16 = -[VideosExtrasFeatureContainerViewController initWithContext:](v14, "initWithContext:", v15);
    featureContainer = self->_featureContainer;
    self->_featureContainer = v16;

    -[VideosExtrasFeatureContainerViewController setVideoPlaybackViewController:](self->_featureContainer, "setVideoPlaybackViewController:", v13);
    v21[0] = self->_featureContainer;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasNavigationController setViewControllers:](v11, "setViewControllers:", v18);
  }
  else
  {
    -[VideosExtrasNavigationController setClearsStackOnNextPush](v11, "setClearsStackOnNextPush");
    v18 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
    -[VideosExtrasNavigationController pushViewController:animated:](v11, "pushViewController:animated:", v18, 0);
  }

  -[VideosExtrasRootViewController _setNavigationController:](self, "_setNavigationController:", v11);
  v19 = (IKAppContext *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A5D8]), "initWithApplication:mode:delegate:", self, 0, self);
  applicationContext = self->_applicationContext;
  self->_applicationContext = v19;

}

- (VideosExtrasRootViewController)initWithContext:(id)a3
{
  id v4;
  VideosExtrasRootViewController *v5;
  VideosExtrasRootViewController *v6;
  VideosExtrasArtworkDataSource *v7;
  VideosExtrasArtworkDataSource *artworkDataSource;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VideosExtrasRootViewController;
  v5 = -[VideosExtrasRootViewController init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_context, v4);
    v7 = objc_alloc_init(VideosExtrasArtworkDataSource);
    artworkDataSource = v6->_artworkDataSource;
    v6->_artworkDataSource = v7;

    v6->_showsMenuBar = 1;
    v6->_showsBuiltInNavigationControls = 1;
    objc_storeWeak(&__currentController, v6);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__playbackWillEndNotification_, CFSTR("VideosAVPlayerWillEndPlayback"), 0);

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[VideosExtrasRootViewController _stopOldContextIfNeeded](self, "_stopOldContextIfNeeded");
  -[VideosExtrasNavigationController setDelegate:](self->_navigationController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasRootViewController;
  -[VideosExtrasRootViewController dealloc](&v3, sel_dealloc);
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  void *v2;
  void *v3;

  -[VideosExtrasRootViewController childViewControllers](self, "childViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_stopOldContextIfNeeded
{
  IKAppContext *applicationContext;

  -[IKAppContext stop](self->_applicationContext, "stop");
  applicationContext = self->_applicationContext;
  self->_applicationContext = 0;

}

- (void)start
{
  -[VideosExtrasRootViewController _setUpForApplication](self, "_setUpForApplication");
  -[IKAppContext start](self->_applicationContext, "start");
}

- (void)popToFeatureOrMain
{
  VideosExtrasNavigationController *navigationController;
  VideosExtrasFeatureContainerViewController *v4;
  VideosExtrasFeatureContainerViewController *featureContainer;
  VideosExtrasNavigationController *v6;
  void *v7;
  void *WeakRetained;
  VideosExtrasMainTemplateViewController *mainTemplateViewController;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  navigationController = self->_navigationController;
  if (self->_featureContainer)
  {
    -[VideosExtrasNavigationController topViewController](self->_navigationController, "topViewController");
    v4 = (VideosExtrasFeatureContainerViewController *)objc_claimAutoreleasedReturnValue();
    featureContainer = self->_featureContainer;

    if (v4 == featureContainer)
      return;
    v6 = self->_navigationController;
    v10[0] = self->_featureContainer;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasNavigationController setViewControllers:](v6, "setViewControllers:", v7);

    WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    objc_msgSend(WeakRetained, "extrasRequestReloadWithContext:", 0);
  }
  else
  {
    mainTemplateViewController = self->_mainTemplateViewController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &mainTemplateViewController, 1);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasNavigationController setViewControllers:](navigationController, "setViewControllers:", WeakRetained);
  }

}

- (NSArray)mainMenuItemElements
{
  return -[VideosExtrasMainTemplateViewController mainMenuItemElements](self->_mainTemplateViewController, "mainMenuItemElements");
}

- (void)setClearsStackOnNextPush
{
  -[VideosExtrasNavigationController setClearsStackOnNextPush](self->_navigationController, "setClearsStackOnNextPush");
}

- (void)updateMenuButtonForSelectionAtIndex:(unint64_t)a3 deselectedIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[VideosExtrasRootViewController extrasMenuButtonsStackView](self, "extrasMenuButtonsStackView", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrangedSubviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v12, "tag") == a3)
          {
            v13 = (void *)MEMORY[0x1E0DC3658];
            v14 = 1.0;
            v15 = 0.957;
            v16 = 0.969;
            v17 = 0.992;
          }
          else
          {
            if (objc_msgSend(v12, "tag") != a4)
              goto LABEL_12;
            v13 = (void *)MEMORY[0x1E0DC3658];
            v14 = 1.0;
            v15 = 0.545;
            v16 = 0.565;
            v17 = 0.573;
          }
          objc_msgSend(v13, "colorWithRed:green:blue:alpha:", v15, v16, v17, v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setTitleColor:forState:", v18, 0);

        }
LABEL_12:
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

}

- (void)showExtrasMenuBarInFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v26[4] = *MEMORY[0x1E0C80C00];
  -[VideosExtrasRootViewController extrasMenuBarView](self, "extrasMenuBarView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setFrame:", x, y, width, height);
    -[VideosExtrasRootViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasRootViewController extrasMenuBarView](self, "extrasMenuBarView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v11);

    v21 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v9, "centerXAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasRootViewController view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "centerXAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v22;
    objc_msgSend(v9, "widthAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToConstant:", width);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v13;
    objc_msgSend(v9, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToConstant:", height);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v15;
    objc_msgSend(v9, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasRootViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, y + height);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:", v20);

  }
}

- (BOOL)appIsTrusted
{
  return 1;
}

- (id)appJSURL
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "javascriptURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldIgnoreJSValidation
{
  return 0;
}

- (id)appIdentifier
{
  return 0;
}

- (id)vendorIdentifier
{
  return 0;
}

- (id)appLaunchParams
{
  void *v2;
  VideosExtrasContext **p_context;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[2];
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15 = CFSTR("movieInfo");
  v13[0] = CFSTR("adamId");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  p_context = &self->_context;
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(WeakRetained, "storeID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("actionParams");
  v14[0] = v5;
  v6 = objc_loadWeakRetained((id *)p_context);
  objc_msgSend(v6, "buyParameters");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = &stru_1E9FF3598;
  if (v7)
    v9 = (const __CFString *)v7;
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)appUsesDefaultStyleSheets
{
  return 0;
}

- (id)viewElementRegistry
{
  if (viewElementRegistry_onceToken != -1)
    dispatch_once(&viewElementRegistry_onceToken, &__block_literal_global_107);
  return (id)viewElementRegistry_viewElementRegistry;
}

uint64_t __53__VideosExtrasRootViewController_viewElementRegistry__block_invoke()
{
  id v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D3A780], "registerStyle:withType:inherited:", CFSTR("extras-itml-section-content-type"), 3, 1);
  v0 = objc_alloc_init(MEMORY[0x1E0D3A778]);
  v1 = (void *)viewElementRegistry_viewElementRegistry;
  viewElementRegistry_viewElementRegistry = (uint64_t)v0;

  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A4C0], 82);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A388], 4);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A390], 5);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A398], 6);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A3A0], 7);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A3A8], 8);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A3B0], 12);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A3B8], 15);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A3C0], 19);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A3C8], 20);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A3D8], 22);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A3D0], 21);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A3E0], 23);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A3E8], 24);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A410], 31);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A418], 33);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A428], 43);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A430], 45);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A438], 47);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A440], 48);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A3F8], 49);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A420], 49);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A450], 49);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A488], 49);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A460], 62);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A468], 63);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A470], 64);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A478], 65);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A480], 66);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A490], 68);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A498], 70);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A4A0], 71);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A4A8], 72);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A4B8], 80);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A4C8], 87);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A4D0], 95);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A4E0], 108);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A4E8], 118);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A4F0], 119);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A4F8], 122);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A500], 132);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A3F0], 138);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A400], 138);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A408], 138);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A508], 138);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A510], 138);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A518], 139);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A530], 138);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A520], 142);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A528], 143);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A538], 152);
  objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A4D8], 100);
  return objc_msgSend((id)viewElementRegistry_viewElementRegistry, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x1E0D3A4B0], 74);
}

- (id)navigationControllerForContext:(id)a3
{
  return self->_navigationController;
}

- (void)appContext:(id)a3 evaluateAppJavaScriptInContext:(id)a4
{
  id v6;
  VideosExtrasJSITunesStore *v7;
  id v8;
  id v9;

  v9 = a4;
  v6 = a3;
  v7 = -[IKJSITunesStore initWithAppContext:]([VideosExtrasJSITunesStore alloc], "initWithAppContext:", v6);

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("itms"));
  -[VideosExtrasJSITunesStore setFormPresentationViewController:](v7, "setFormPresentationViewController:", self);
  v8 = (id)objc_msgSend(v9, "evaluateScript:", CFSTR("TabBar = { selectedTab: { rootURL: '' } }"));

}

- (void)_attemptRestart
{
  _QWORD v2[5];

  self->_didAttemptRestartAfterAppContextFailure = 1;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __49__VideosExtrasRootViewController__attemptRestart__block_invoke;
  v2[3] = &unk_1E9F9D528;
  v2[4] = self;
  +[VUIAuthenticationManager requestAuthenticationAlwaysPrompt:withCompletionHandler:](VUIAuthenticationManager, "requestAuthenticationAlwaysPrompt:withCompletionHandler:", 0, v2);
}

void __49__VideosExtrasRootViewController__attemptRestart__block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v5, "start");
  }
  else
  {
    objc_msgSend(v5, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "failWithError:", v7);

  }
}

- (void)appContext:(id)a3 didFailWithError:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = v6;
  if (appContext_didFailWithError__onceToken == -1)
  {
    if (!v6)
    {
LABEL_10:
      -[VideosExtrasRootViewController context](self, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "failWithError:", v7);
      goto LABEL_11;
    }
  }
  else
  {
    dispatch_once(&appContext_didFailWithError__onceToken, &__block_literal_global_85);
    if (!v7)
      goto LABEL_10;
  }
  objc_msgSend(v7, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8
    || (v10 = *MEMORY[0x1E0D3A5C8],
        objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D3A5C8]),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        !v11))
  {

    goto LABEL_10;
  }
  if (appContext_didFailWithError____shouldShowHTTPErrors)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    if (v13 == 403 && !self->_didAttemptRestartAfterAppContextFailure)
      -[VideosExtrasRootViewController _attemptRestart](self, "_attemptRestart");
  }
LABEL_11:

}

uint64_t __62__VideosExtrasRootViewController_appContext_didFailWithError___block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("ExtrasShouldShowHTTPErrors"), CFSTR("com.apple.videos"), 0);
  appContext_didFailWithError____shouldShowHTTPErrors = (_DWORD)result != 0;
  return result;
}

- (unint64_t)preferredVideoFormat
{
  return 0;
}

- (unint64_t)preferredVideoPreviewFormat
{
  return 0;
}

- (CGSize)screenSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)isTimeZoneSet
{
  return 1;
}

- (id)timeZone
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
}

- (id)systemLanguage
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", CFSTR("AppleLanguages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)storeFrontCountryCode
{
  return 0;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v19;
  double v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)VideosExtrasRootViewController;
  -[VideosExtrasRootViewController viewWillAppear:](&v21, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "userInterfaceIdiom"))
  {

  }
  else
  {
    -[VideosExtrasRootViewController initialPresentationSize](self, "initialPresentationSize");
    v13 = v12;
    v15 = v14;
    v16 = *MEMORY[0x1E0C9D820];
    v17 = *(double *)(MEMORY[0x1E0C9D820] + 8);

    if (v13 != v16 || v15 != v17)
    {
      -[VideosExtrasRootViewController initialPresentationSize](self, "initialPresentationSize");
      v8 = v19;
      v10 = v20;
    }
  }
  -[VideosExtrasRootViewController _adjustExtrasVisibilityForViewSize:](self, "_adjustExtrasVisibilityForViewSize:", v8, v10);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VideosExtrasRootViewController;
  -[VideosExtrasRootViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[VideosExtrasRootViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[VideosExtrasRootViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.109803922, 0.733333333, 1.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v6);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VideosExtrasRootViewController;
  -[VideosExtrasRootViewController viewDidLayoutSubviews](&v16, sel_viewDidLayoutSubviews);
  -[VideosExtrasRootViewController extrasMenuButtonsStackView](self, "extrasMenuButtonsStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  -[VideosExtrasRootViewController backButton](self, "backButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;

  -[UIView frame](self->_extrasMenuBarView, "frame");
  v9 = v8 + 40.0 + 14.0;
  v11 = v10 + v9 * -2.0;
  if (v5 <= v11)
  {
    -[VideosExtrasRootViewController extrasScrollViewLeadingConstraint](self, "extrasScrollViewLeadingConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v9;
  }
  else
  {
    v12 = fmax(v9 + v11 - v5, 14.0);
    -[VideosExtrasRootViewController extrasScrollViewLeadingConstraint](self, "extrasScrollViewLeadingConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v12;
  }
  objc_msgSend(v13, "setConstant:", v15);

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 30;
  -[VideosExtrasRootViewController presentedViewController](self, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v5 = 24;
  else
    v5 = 26;

  return v5;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  VideosExtrasNavigationController *navigationController;
  void *v15;
  VideosExtrasFeatureContainerViewController *v16;
  VideosExtrasFeatureContainerViewController *featureContainer;
  void *v18;
  void *v19;
  VideosExtrasNavigationController *v20;
  void *v21;
  _QWORD v22[5];
  BOOL v23;
  objc_super v24;
  _QWORD v25[2];

  height = a3.height;
  width = a3.width;
  v25[1] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)VideosExtrasRootViewController;
  -[VideosExtrasRootViewController viewWillTransitionToSize:withTransitionCoordinator:](&v24, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4);
  if (!-[VideosExtrasRootViewController showsMenuBar](self, "showsMenuBar"))
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "applicationState") != 2)
  {

    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
LABEL_7:
    -[VideosExtrasRootViewController _adjustExtrasVisibilityForViewSize:](self, "_adjustExtrasVisibilityForViewSize:", width, height);
    -[VideosExtrasMainTemplateViewController view](self->_mainTemplateViewController, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFrame:", 0.0, 0.0, width, height);

    -[VideosExtrasMainTemplateViewController _prepareLayout](self->_mainTemplateViewController, "_prepareLayout");
    return;
  }
  -[VideosExtrasRootViewController presentedViewController](self, "presentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v12 = -[VideosExtrasRootViewController shouldExtrasBeVisibleForViewSize:](self, "shouldExtrasBeVisibleForViewSize:", width, height);
    if (v12 != -[VideosExtrasRootViewController _areExtrasVisible](self, "_areExtrasVisible"))
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __85__VideosExtrasRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
      v22[3] = &unk_1E9F9A5F8;
      v22[4] = self;
      v23 = v12;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v22);
    }
    if (v12)
    {
      -[VideosExtrasRootViewController lastSelectedSnapshotViewControllers](self, "lastSelectedSnapshotViewControllers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        navigationController = self->_navigationController;
        -[VideosExtrasRootViewController lastSelectedSnapshotViewControllers](self, "lastSelectedSnapshotViewControllers");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[VideosExtrasNavigationController setViewControllers:](navigationController, "setViewControllers:", v15);

        -[VideosExtrasRootViewController setLastSelectedSnapshotViewControllers:](self, "setLastSelectedSnapshotViewControllers:", 0);
      }
    }
    else
    {
      -[VideosExtrasNavigationController topViewController](self->_navigationController, "topViewController");
      v16 = (VideosExtrasFeatureContainerViewController *)objc_claimAutoreleasedReturnValue();
      featureContainer = self->_featureContainer;

      if (v16 != featureContainer)
      {
        -[VideosExtrasNavigationController viewControllers](self->_navigationController, "viewControllers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v18, "copy");
        -[VideosExtrasRootViewController setLastSelectedSnapshotViewControllers:](self, "setLastSelectedSnapshotViewControllers:", v19);

        v20 = self->_navigationController;
        v25[0] = self->_featureContainer;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[VideosExtrasNavigationController setViewControllers:](v20, "setViewControllers:", v21);

      }
    }
  }

}

uint64_t __85__VideosExtrasRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showExtrasBar:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)shouldAutorotate
{
  void *v2;
  BOOL v3;

  -[VideosExtrasRootViewController presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a6;
  if (!objc_msgSend(v8, "conformsToProtocol:", &unk_1F03192B8)
    || (objc_msgSend(v8, "animationControllerForNavigationOperation:fromViewController:toViewController:", a4, v8, v9),
        (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (objc_msgSend(v9, "conformsToProtocol:", &unk_1F03192B8))
    {
      objc_msgSend(v9, "animationControllerForNavigationOperation:fromViewController:toViewController:", a4, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)navigationController:(id)a3 interactionControllerForAnimationController:(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1F02B8F30)
    && objc_msgSend(v4, "conformsToProtocol:", &unk_1F02B9010)
    && objc_msgSend(v4, "isInteractive"))
  {
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_createDataStorageForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[VideosExtrasRootViewController appIdentifier](self, "appIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(".%@"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithObjects:", v6, v11, v8, 0);

    objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingPathExtension:", CFSTR("plist"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A5E0]), "initWithFilePath:identifier:", v14, v8);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_setNavigationController:(id)a3
{
  VideosExtrasNavigationController *v5;
  VideosExtrasNavigationController **p_navigationController;
  VideosExtrasNavigationController *navigationController;
  void *v8;
  void *v9;
  void *v10;
  VideosExtrasNavigationController *v11;

  v5 = (VideosExtrasNavigationController *)a3;
  p_navigationController = &self->_navigationController;
  navigationController = self->_navigationController;
  if (navigationController != v5)
  {
    v11 = v5;
    if (navigationController)
    {
      -[VideosExtrasNavigationController willMoveToParentViewController:](navigationController, "willMoveToParentViewController:", 0);
      -[VideosExtrasNavigationController view](*p_navigationController, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

      -[VideosExtrasNavigationController removeFromParentViewController](*p_navigationController, "removeFromParentViewController");
      -[VideosExtrasNavigationController setDelegate:](*p_navigationController, "setDelegate:", 0);
    }
    objc_storeStrong((id *)&self->_navigationController, a3);
    -[VideosExtrasNavigationController setDelegate:](v11, "setDelegate:", self);
    -[VideosExtrasRootViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasNavigationController view](v11, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    objc_msgSend(v10, "setFrame:");
    -[VideosExtrasRootViewController addChildViewController:](self, "addChildViewController:", v11);
    objc_msgSend(v9, "addSubview:", v10);
    -[VideosExtrasNavigationController didMoveToParentViewController:](v11, "didMoveToParentViewController:", self);

    v5 = v11;
  }

}

- (id)_extrasMenuBarViewForElements:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  id v58;
  _QWORD v59[5];
  id v60;
  _QWORD *v61;
  _QWORD v62[4];

  v4 = a3;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x2020000000;
  v62[3] = 0;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C8B3F8]);
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = objc_alloc_init(MEMORY[0x1E0DC3518]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("EXTRAS_BACK_BUTTON_TITLE"), 0, CFSTR("VideosExtras"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:forState:", v8, 0);

    objc_msgSend(v6, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 11.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v10);

    objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v11);

    objc_msgSend(v6, "setContentEdgeInsets:", 2.0, 4.0, 2.0, 4.0);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", 4.0);

    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__backButtonPressed_, 64);
    LODWORD(v13) = 1148846080;
    objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 0, v13);
    LODWORD(v14) = 1148846080;
    objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 0, v14);
    objc_msgSend(v5, "addSubview:", v6);
    -[VideosExtrasRootViewController setBackButton:](self, "setBackButton:", v6);
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __64__VideosExtrasRootViewController__extrasMenuBarViewForElements___block_invoke;
    v59[3] = &unk_1E9FA09B8;
    v59[4] = self;
    v61 = v62;
    v58 = v15;
    v60 = v58;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v59);
    objc_msgSend(v6, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, -14.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActive:", 1);

    objc_msgSend(v6, "centerYAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    v22 = objc_alloc_init(MEMORY[0x1E0DC3C28]);
    objc_msgSend(v22, "setShowsHorizontalScrollIndicator:", 0);
    objc_msgSend(v22, "setBounces:", 1);
    objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "addSubview:", v22);
    objc_msgSend(v22, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, 14.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v26) = 1144750080;
    objc_msgSend(v25, "setPriority:", v26);
    objc_msgSend(v25, "setActive:", 1);
    -[VideosExtrasRootViewController setExtrasScrollViewLeadingConstraint:](self, "setExtrasScrollViewLeadingConstraint:", v25);
    objc_msgSend(v22, "centerYAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerYAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setActive:", 1);

    objc_msgSend(v22, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setActive:", 1);

    objc_msgSend(v22, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, -40.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setActive:", 1);

    objc_msgSend(v22, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setActive:", 1);

    objc_msgSend(v22, "centerXAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerXAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v42) = 1132068864;
    objc_msgSend(v41, "setPriority:", v42);
    objc_msgSend(v41, "setActive:", 1);
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithArrangedSubviews:", v58);
    objc_msgSend(v43, "setDistribution:", 2);
    objc_msgSend(v43, "setSpacing:", 40.0);
    objc_msgSend(v43, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v22, "addSubview:", v43);
    -[VideosExtrasRootViewController setExtrasMenuButtonsStackView:](self, "setExtrasMenuButtonsStackView:", v43);
    objc_msgSend(v43, "centerYAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "centerYAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setActive:", 1);

    objc_msgSend(v43, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintGreaterThanOrEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setActive:", 1);

    objc_msgSend(v43, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintGreaterThanOrEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setActive:", 1);

    objc_msgSend(v43, "centerXAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "centerXAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v56) = 1132068864;
    objc_msgSend(v55, "setPriority:", v56);
    objc_msgSend(v55, "setActive:", 1);

  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(v62, 8);

  return v5;
}

void __64__VideosExtrasRootViewController__extrasMenuBarViewForElements___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMenuItemElementMainFeature:", v15);

  v7 = v15;
  if ((v6 & 1) == 0)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    objc_msgSend(v15, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "length"))
    {
      v11 = objc_alloc_init(MEMORY[0x1E0DC3518]);
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.545, 0.565, 0.573, 1.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTitleColor:forState:", v12, 0);

      objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v11, "titleLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 16.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFont:", v14);

      objc_msgSend(v11, "setTitle:forState:", v10, 0);
      objc_msgSend(v11, "setTag:", a3);
      objc_msgSend(v11, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__extrasMenuItemSelected_, 64);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

    }
    v7 = v15;
  }

}

- (void)_backButtonPressed:(id)a3
{
  id v3;

  -[VideosExtrasRootViewController context](self, "context", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "extrasBackButtonPressed");

}

- (void)_extrasMenuItemSelected:(id)a3
{
  char isKindOfClass;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v11;
    -[VideosExtrasRootViewController mainMenuItemElements](self, "mainMenuItemElements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "tag");
    if (v8 < objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[VideosExtrasRootViewController context](self, "context");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "extrasMenuItemSelected:atIndex:", v9, v8);

      }
    }

    v5 = v11;
  }

}

- (void)setMainTemplateViewController:(id)a3
{
  VideosExtrasMainTemplateViewController *v5;
  VideosExtrasMainTemplateViewController *mainTemplateViewController;
  void *v7;
  double v8;
  double v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  VideosExtrasMainTemplateViewController *v14;

  v5 = (VideosExtrasMainTemplateViewController *)a3;
  mainTemplateViewController = self->_mainTemplateViewController;
  if (mainTemplateViewController != v5)
  {
    v14 = v5;
    -[VideosExtrasMainTemplateViewController setDidSelectDelegate:](mainTemplateViewController, "setDidSelectDelegate:", 0);
    -[VideosExtrasMainTemplateViewController setDidSelectDelegate:](v14, "setDidSelectDelegate:", self);
    objc_storeStrong((id *)&self->_mainTemplateViewController, a3);
    -[VideosExtrasRootViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v10 = -[VideosExtrasRootViewController shouldExtrasBeVisibleForViewSize:](self, "shouldExtrasBeVisibleForViewSize:", v8, v9);

    -[VideosExtrasRootViewController _showExtrasBar:](self, "_showExtrasBar:", v10);
    -[VideosExtrasRootViewController mainMenuItemElements](self, "mainMenuItemElements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasRootViewController _extrasMenuBarViewForElements:](self, "_extrasMenuBarViewForElements:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      -[VideosExtrasRootViewController setExtrasMenuBarView:](self, "setExtrasMenuBarView:", v12);
    -[VideosExtrasRootViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "extrasRootViewControllerDidLoadMainMenuItems:", self);

    v5 = v14;
  }

}

- (BOOL)_setMainDocumentWithViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "document");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "templateElement");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
        -[VideosExtrasRootViewController setMainTemplateViewController:](self, "setMainTemplateViewController:", v4);

    }
    else
    {
      isKindOfClass = 0;
    }

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)detectMainDocument:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "reverseObjectEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[VideosExtrasRootViewController _setMainDocumentWithViewController:](self, "_setMainDocumentWithViewController:", v10))
        {
          v11 = (id)objc_msgSend(v4, "mutableCopy");
          objc_msgSend(v11, "removeObject:", v10);

          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }

  v11 = v4;
LABEL_11:

  return v11;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  -[VideosExtrasNavigationController setClearsStackOnNextPush](self->_navigationController, "setClearsStackOnNextPush", a3, a4);
}

- (UIView)mainMenuBar
{
  void *v2;
  void *v3;

  -[VideosExtrasRootViewController mainTemplateViewController](self, "mainTemplateViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuBarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)_adjustExtrasVisibilityForViewSize:(CGSize)a3
{
  double height;
  double width;
  unsigned int isKindOfClass;
  void *v7;
  int v8;
  _BOOL8 v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  height = a3.height;
  width = a3.width;
  -[VideosExtrasRootViewController presentedViewController](self, "presentedViewController");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("MPAudioAndSubtitlesController"));
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v16;
  if (self->_mainTemplateViewController)
  {
    if (!v16 || (v8 = objc_msgSend(v16, "isBeingDismissed") | isKindOfClass, v7 = v16, (v8 & 1) != 0))
    {
      v9 = -[VideosExtrasRootViewController shouldExtrasBeVisibleForViewSize:](self, "shouldExtrasBeVisibleForViewSize:", width, height);
      if (!-[VideosExtrasRootViewController showsMenuBar](self, "showsMenuBar"))
      {
        -[VideosExtrasRootViewController delegate](self, "delegate");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "extrasRootViewController:extrasVisibilityNeedsUpdate:", self, v9);
LABEL_11:

        v7 = v16;
        goto LABEL_12;
      }
      v10 = v9 == -[VideosExtrasRootViewController _areExtrasVisible](self, "_areExtrasVisible");
      v7 = v16;
      if (!v10)
      {
        -[VideosExtrasRootViewController _showExtrasBar:](self, "_showExtrasBar:", v9);
        v7 = v16;
        if (!(v9 | isKindOfClass))
        {
          -[VideosExtrasMainTemplateViewController menuBarView](self->_mainTemplateViewController, "menuBarView");
          v11 = (id)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = v11;
            objc_msgSend(v11, "indexPathsForSelectedItems");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v12, "count"))
            {
              objc_msgSend(v12, "objectAtIndex:", 0);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v13 = 0;
            }
            -[VideosExtrasMainTemplateViewController indexPathOfFeaturedItem](self->_mainTemplateViewController, "indexPathOfFeaturedItem");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13 && (objc_msgSend(v13, "isEqual:", v14) & 1) == 0)
            {
              objc_msgSend(v11, "selectItemAtIndexPath:animated:scrollPosition:", v14, 0, 0);
              objc_msgSend(v11, "delegate");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "collectionView:didSelectItemAtIndexPath:", v11, v14);

            }
          }
          goto LABEL_11;
        }
      }
    }
  }
LABEL_12:

}

- (BOOL)_areExtrasVisible
{
  NSLayoutConstraint *bottomConstraint;
  double v3;

  bottomConstraint = self->_bottomConstraint;
  if (bottomConstraint)
  {
    -[NSLayoutConstraint constant](bottomConstraint, "constant");
    LOBYTE(bottomConstraint) = v3 == 0.0;
  }
  return (char)bottomConstraint;
}

- (void)_playbackWillEndNotification:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[VideosExtrasRootViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  -[VideosExtrasRootViewController _adjustExtrasVisibilityForViewSize:](self, "_adjustExtrasVisibilityForViewSize:", v6, v8);
}

- (BOOL)shouldExtrasBeVisibleForViewSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  BOOL v31;
  double v32;
  double v33;
  BOOL v34;
  CGRect v36;
  CGRect v37;

  height = a3.height;
  width = a3.width;
  if (!-[VideosExtrasRootViewController isViewLoaded](self, "isViewLoaded"))
    return 0;
  -[VideosExtrasRootViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasRootViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "screen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "coordinateSpace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

  }
  else
  {
    objc_msgSend(v8, "bounds");
    v14 = v21;
    v16 = v22;
    v18 = v23;
    v20 = v24;
  }

  v36.origin.x = v14;
  v36.origin.y = v16;
  v36.size.width = v18;
  v36.size.height = v20;
  v25 = CGRectGetWidth(v36);
  v37.origin.x = v14;
  v37.origin.y = v16;
  v37.size.width = v18;
  v37.size.height = v20;
  v26 = CGRectGetHeight(v37);
  if (v25 >= v26)
    v27 = v26;
  else
    v27 = v25;
  if (v25 >= v26)
    v28 = v25;
  else
    v28 = v26;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "orientation");

  v31 = (unint64_t)(v30 - 3) < 2;
  if (width >= height)
    v32 = height;
  else
    v32 = width;
  if (width >= height)
    v33 = width;
  else
    v33 = height;
  if (width > height)
    v31 = 1;
  v34 = v27 == v32 && v28 == v33;
  return v34 && v31;
}

- (void)_showExtrasBar:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  double Height;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *bottomConstraint;
  NSLayoutConstraint *v21;
  void *v22;
  void *v23;
  _QWORD v24[6];
  BOOL v25;
  _QWORD v26[7];
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  CGRect v34;
  CGRect v35;

  if (self->_showsMenuBar)
  {
    v3 = a3;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__21;
    v32 = __Block_byref_object_dispose__21;
    -[VideosExtrasMainTemplateViewController menuBarView](self->_mainTemplateViewController, "menuBarView");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v29[5], "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v6 = 0;
    else
      v6 = !v3;
    if (!v6)
    {
      -[VideosExtrasRootViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", v29[5]);

      if (!self->_bottomConstraint)
      {
        -[VideosExtrasRootViewController view](self, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = v29[5];

          if (v11)
          {
            v12 = (void *)MEMORY[0x1E0CB3718];
            v13 = v29[5];
            -[VideosExtrasRootViewController view](self, "view");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "constraintsByAttachingView:toView:alongEdges:insets:", v13, v14, 10, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v16 = (void *)MEMORY[0x1E0CB3718];
            v17 = v29[5];
            -[VideosExtrasRootViewController view](self, "view");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v29[5], "frame");
            objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 4, 0, v18, 4, 1.0, CGRectGetHeight(v35));
            v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
            bottomConstraint = self->_bottomConstraint;
            self->_bottomConstraint = v19;

            v21 = self->_bottomConstraint;
            -[VideosExtrasMainTemplateViewController collectionViewHeight](self->_mainTemplateViewController, "collectionViewHeight");
            -[NSLayoutConstraint setConstant:](v21, "setConstant:");
            v22 = (void *)MEMORY[0x1E0CB3718];
            objc_msgSend(v15, "arrayByAddingObject:", self->_bottomConstraint);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "activateConstraints:", v23);

          }
        }
      }
      -[VideosExtrasRootViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "layoutIfNeeded");

      objc_msgSend((id)v29[5], "setHidden:", 0);
      Height = 0.0;
      if (!v3)
      {
        objc_msgSend((id)v29[5], "frame", 0.0);
        Height = CGRectGetHeight(v34);
      }
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __49__VideosExtrasRootViewController__showExtrasBar___block_invoke;
      v26[3] = &unk_1E9FA09E0;
      *(double *)&v26[6] = Height;
      v27 = v3;
      v26[4] = self;
      v26[5] = &v28;
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __49__VideosExtrasRootViewController__showExtrasBar___block_invoke_2;
      v24[3] = &unk_1E9FA0A08;
      v25 = v3;
      v24[4] = self;
      v24[5] = &v28;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v26, v24, 0.33);
    }
    _Block_object_dispose(&v28, 8);

  }
}

void __49__VideosExtrasRootViewController__showExtrasBar___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setConstant:", *(double *)(a1 + 48));
  if (*(_BYTE *)(a1 + 56))
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  else
    v2 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "setMenuBarView:", v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

void __49__VideosExtrasRootViewController__showExtrasBar___block_invoke_2(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "videoPlaybackViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "overlayView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");
  if (*(_BYTE *)(a1 + 48))
    v4 = v3;
  else
    v4 = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setHidden:", v4);

}

- (UINavigationController)navigationController
{
  return &self->_navigationController->super;
}

- (VideosExtrasMainTemplateViewController)mainTemplateViewController
{
  return self->_mainTemplateViewController;
}

- (UIView)extrasMenuBarView
{
  return self->_extrasMenuBarView;
}

- (void)setExtrasMenuBarView:(id)a3
{
  objc_storeStrong((id *)&self->_extrasMenuBarView, a3);
}

- (VideosExtrasContext)context
{
  return (VideosExtrasContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (CGSize)initialPresentationSize
{
  double width;
  double height;
  CGSize result;

  width = self->_initialPresentationSize.width;
  height = self->_initialPresentationSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setInitialPresentationSize:(CGSize)a3
{
  self->_initialPresentationSize = a3;
}

- (VideosExtrasRootViewControllerDelegate)delegate
{
  return (VideosExtrasRootViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showsMenuBar
{
  return self->_showsMenuBar;
}

- (void)setShowsMenuBar:(BOOL)a3
{
  self->_showsMenuBar = a3;
}

- (BOOL)showsBuiltInNavigationControls
{
  return self->_showsBuiltInNavigationControls;
}

- (void)setShowsBuiltInNavigationControls:(BOOL)a3
{
  self->_showsBuiltInNavigationControls = a3;
}

- (VideosExtrasFeatureContainerViewController)featureContainer
{
  return self->_featureContainer;
}

- (void)setFeatureContainer:(id)a3
{
  objc_storeStrong((id *)&self->_featureContainer, a3);
}

- (IKAppContext)applicationContext
{
  return self->_applicationContext;
}

- (void)setApplicationContext:(id)a3
{
  objc_storeStrong((id *)&self->_applicationContext, a3);
}

- (NSArray)lastSelectedSnapshotViewControllers
{
  return self->_lastSelectedSnapshotViewControllers;
}

- (void)setLastSelectedSnapshotViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_lastSelectedSnapshotViewControllers, a3);
}

- (UIStackView)extrasMenuButtonsStackView
{
  return self->_extrasMenuButtonsStackView;
}

- (void)setExtrasMenuButtonsStackView:(id)a3
{
  objc_storeStrong((id *)&self->_extrasMenuButtonsStackView, a3);
}

- (UIButton)backButton
{
  return self->_backButton;
}

- (void)setBackButton:(id)a3
{
  objc_storeStrong((id *)&self->_backButton, a3);
}

- (NSLayoutConstraint)extrasScrollViewLeadingConstraint
{
  return self->_extrasScrollViewLeadingConstraint;
}

- (void)setExtrasScrollViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_extrasScrollViewLeadingConstraint, a3);
}

- (IKAppDataStoring)localStorage
{
  return self->_localStorage;
}

- (void)setLocalStorage:(id)a3
{
  objc_storeStrong((id *)&self->_localStorage, a3);
}

- (IKAppDataStoring)vendorStorage
{
  return self->_vendorStorage;
}

- (void)setVendorStorage:(id)a3
{
  objc_storeStrong((id *)&self->_vendorStorage, a3);
}

- (IKAppUserDefaultsStoring)userDefaultsStorage
{
  return self->_userDefaultsStorage;
}

- (void)setUserDefaultsStorage:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaultsStorage, a3);
}

- (VideosExtrasArtworkDataSource)artworkDataSource
{
  return self->_artworkDataSource;
}

- (void)setArtworkDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_artworkDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkDataSource, 0);
  objc_storeStrong((id *)&self->_userDefaultsStorage, 0);
  objc_storeStrong((id *)&self->_vendorStorage, 0);
  objc_storeStrong((id *)&self->_localStorage, 0);
  objc_storeStrong((id *)&self->_extrasScrollViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_extrasMenuButtonsStackView, 0);
  objc_storeStrong((id *)&self->_lastSelectedSnapshotViewControllers, 0);
  objc_storeStrong((id *)&self->_applicationContext, 0);
  objc_storeStrong((id *)&self->_featureContainer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_extrasMenuBarView, 0);
  objc_storeStrong((id *)&self->_mainTemplateViewController, 0);
  objc_storeStrong((id *)&self->_imageRequestQueue, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
}

@end
