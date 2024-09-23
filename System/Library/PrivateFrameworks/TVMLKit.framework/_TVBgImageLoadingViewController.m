@implementation _TVBgImageLoadingViewController

- (_TVBgImageLoadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  _TVBgImageLoadingViewController *v4;
  _TVBgImageLoadingViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TVBgImageLoadingViewController;
  v4 = -[_TVBgImageLoadingViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_loaded = 0;
    v4->_bgImageLoadingOptions.respondsToBackroundImageProxy = objc_opt_respondsToSelector() & 1;
    v5->_bgImageLoadingOptions.respondsToBackgroundImageRequiresBlur = objc_opt_respondsToSelector() & 1;
    v5->_bgImageLoadingOptions.respondsToBackdropNeeded = objc_opt_respondsToSelector() & 1;
    v5->_bgImageLoadingOptions.respondsToImageProxySize = objc_opt_respondsToSelector() & 1;
    v5->_bgImageLoadingOptions.respondsToBlurEffectStyle = objc_opt_respondsToSelector() & 1;
    v5->_bgImageLoadingOptions.respondsToPurgeBgImages = objc_opt_respondsToSelector() & 1;
    v5->_bgImageLoadingOptions.respondsToConfigureBgImageBackdropImage = objc_opt_respondsToSelector() & 1;
    v5->_bgImageLoadingOptions.respondsToShouldLoadBackgroundImageAsynchronously = objc_opt_respondsToSelector() & 1;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(self->_imageProxy, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)_TVBgImageLoadingViewController;
  -[_TVBgImageLoadingViewController dealloc](&v3, sel_dealloc);
}

- (id)_backgroundImageProxy
{
  return 0;
}

- (BOOL)_backgroundImageRequiresBlur
{
  return 0;
}

- (BOOL)_isBackdropNeeded
{
  return 0;
}

- (CGSize)_backgroundImageProxySize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)_blurEffectStyle
{
  return 0x8000000000000000;
}

- (BOOL)_shouldLoadBackgroundImageAsynchronously
{
  return 0;
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)updateWithViewElement:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "children", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "tv_elementType") == 31)
        {
          v12 = v11;

          v8 = v12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  if (self->_navigationItemElement)
  {
    v13 = objc_msgSend(v8, "updateType");
    objc_storeStrong((id *)&self->_navigationItemElement, v8);
    if (!v13)
      goto LABEL_17;
  }
  else
  {
    objc_storeStrong((id *)&self->_navigationItemElement, v8);
  }
  -[_TVBgImageLoadingViewController _updateNavigationItem](self, "_updateNavigationItem");
LABEL_17:

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVBgImageLoadingViewController;
  -[_TVBgImageLoadingViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  self->_loaded = 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVBgImageLoadingViewController;
  -[_TVBgImageLoadingViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[_TVBgImageLoadingViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    self->_loaded = 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVBgImageLoadingViewController;
  -[_TVBgImageLoadingViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[_TVBgImageLoadingViewController _updateNavigationBarPadding](self, "_updateNavigationBarPadding");
  -[_TVBgImageLoadingViewController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVBgImageLoadingViewController _reparentNavigationItem:](self, "_reparentNavigationItem:", v4);

  -[_TVBgImageLoadingViewController configureAppearanceTransition](self, "configureAppearanceTransition");
}

- (void)configureAppearanceTransition
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16[2];
  _QWORD v17[4];
  id v18[2];
  id location;

  v3 = 1.0;
  if (-[_TVBgImageLoadingViewController _isNewiOSTVApp](self, "_isNewiOSTVApp"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_TVBgImageLoadingViewController navigationItem](self, "navigationItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "title");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {

      }
      else
      {
        -[_TVBgImageLoadingViewController navigationItem](self, "navigationItem");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "titleView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
          v3 = 1.0;
        else
          v3 = 0.0;
      }
    }
  }
  -[_TVBgImageLoadingViewController transitionCoordinator](self, "transitionCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 <= 0.0 || v8 == 0)
  {
    -[_TVBgImageLoadingViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "navigationBar");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6950], "tvmlkit_keyColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTintColor:", v11);

    objc_msgSend(v14, "_setBackgroundOpacity:", v3);
    objc_msgSend(v14, "_setTitleOpacity:", v3);

  }
  else
  {
    objc_initWeak(&location, self);
    -[_TVBgImageLoadingViewController transitionCoordinator](self, "transitionCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __64___TVBgImageLoadingViewController_configureAppearanceTransition__block_invoke;
    v17[3] = &unk_24EB867E0;
    objc_copyWeak(v18, &location);
    v18[1] = *(id *)&v3;
    v15[0] = v13;
    v15[1] = 3221225472;
    v15[2] = __64___TVBgImageLoadingViewController_configureAppearanceTransition__block_invoke_2;
    v15[3] = &unk_24EB867E0;
    objc_copyWeak(v16, &location);
    v16[1] = *(id *)&v3;
    objc_msgSend(v12, "animateAlongsideTransition:completion:", v17, v15);

    objc_destroyWeak(v16);
    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
}

- (void)loadFromViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id imageProxy;
  char v10;
  BOOL v11;
  void *v12;
  id v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  BOOL v22;
  char v23;
  id location;

  v6 = a3;
  v7 = a4;
  if (!self->_bgImageLoadingOptions.respondsToConfigureBgImageBackdropImage)
  {
    v12 = (void *)TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG))
    {
      -[_TVBgImageLoadingViewController loadFromViewController:completion:].cold.1(v12);
      if (!v7)
        goto LABEL_16;
    }
    else if (!v7)
    {
      goto LABEL_16;
    }
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    goto LABEL_16;
  }
  -[_TVBgImageLoadingViewController _backgroundImageProxy](self, "_backgroundImageProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  imageProxy = self->_imageProxy;
  self->_imageProxy = v8;

  v10 = objc_msgSend(self->_imageProxy, "isImageAvailable");
  v11 = self->_bgImageLoadingOptions.respondsToShouldLoadBackgroundImageAsynchronously
     && -[_TVBgImageLoadingViewController _shouldLoadBackgroundImageAsynchronously](self, "_shouldLoadBackgroundImageAsynchronously");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = self->_imageProxy;
    objc_msgSend(v13, "setAllowsSubstitutionForOriginal:", -[_TVBgImageLoadingViewController _backgroundImageRequiresBlur](self, "_backgroundImageRequiresBlur"));
    objc_initWeak(&location, self);
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __69___TVBgImageLoadingViewController_loadFromViewController_completion___block_invoke;
    v19 = &unk_24EB86830;
    objc_copyWeak(&v21, &location);
    v22 = v11;
    v14 = v7;
    v20 = v14;
    v23 = v10;
    objc_msgSend(v13, "setCompletionHandler:", &v16);
    objc_msgSend(v13, "setCacheOnLoad:", +[TVMLUtilities canHandleDecodingOnRenderThread](TVMLUtilities, "canHandleDecodingOnRenderThread", v16, v17, v18, v19) ^ 1);
    objc_msgSend(v13, "load");
    v15 = !v11;
    if (!v14)
      v15 = 1;
    if ((v15 & 1) == 0)
      (*((void (**)(id, uint64_t, _QWORD))v14 + 2))(v14, 1, 0);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  else
  {
    -[_TVBgImageLoadingViewController _configureWithBgImage:backdropImage:](self, "_configureWithBgImage:backdropImage:", 0, 0);
    if (v7)
      (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1, 0);
  }
LABEL_16:

}

+ (id)_decorateImage:(id)a3 decorator:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = objc_retainAutorelease(v5);
    +[TVImage imageWithCGImageRef:preserveAlpha:](TVImage, "imageWithCGImageRef:preserveAlpha:", objc_msgSend(v7, "CGImage"), 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v6 && v8)
    {
      objc_msgSend(v7, "size");
      objc_msgSend(v6, "decorate:scaledWithSize:croppedToFit:", v9, 1);
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)updateNavigationItem:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setSearchController:", 0);
  objc_msgSend(v3, "setHidesSearchBarWhenScrolling:", 0);

}

- (void)_dismissViewController:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  id v9;

  +[_TVModalPresenter presenter](_TVModalPresenter, "presenter", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modalRootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVBgImageLoadingViewController navigationController](self, "navigationController");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7 && v4 == (void *)v5)
    objc_msgSend(v9, "hideAllAnimated:withCompletion:", 1, 0);
  else
    -[_TVBgImageLoadingViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (int64_t)_overrideLargeTitleDisplayMode
{
  return 0;
}

- (BOOL)_isNewiOSTVApp
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AppleTV"));

  return v4;
}

- (void)_reparentNavigationItem:(id)a3
{
  void *v4;
  void *v5;
  int isKindOfClass;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  unsigned int v21;
  unint64_t v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  unsigned int v29;
  id v30;
  int v31;
  id v32;

  v32 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && !-[_TVBgImageLoadingViewController appliedNavigationItem](self, "appliedNavigationItem"))
  {
    -[_TVBgImageLoadingViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v7 = 0;
    else
      v7 = &stru_24EB8B108;
    objc_msgSend(v5, "title");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (void *)v8;
    else
      v10 = (void *)v7;
    v30 = v10;

    objc_msgSend(v5, "leftBarButtonItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    objc_msgSend(v5, "rightBarButtonItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");

    objc_msgSend(v5, "titleView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[_TVBgImageLoadingViewController _isNewiOSTVApp](self, "_isNewiOSTVApp");
    -[_TVBgImageLoadingViewController presentingViewController](self, "presentingViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = !v16;

    if (v17 && !v16)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__dismissViewController_);
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v14, "count") + 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v18);
      v20 = objc_msgSend(v19, "copy");

      v14 = (void *)v20;
    }
    v21 = objc_msgSend(v5, "leftItemsSupplementBackButton");
    v22 = objc_msgSend(v5, "largeTitleDisplayMode");
    v31 = isKindOfClass;
    if (-[_TVBgImageLoadingViewController _overrideLargeTitleDisplayMode](self, "_overrideLargeTitleDisplayMode"))
      v22 = -[_TVBgImageLoadingViewController _overrideLargeTitleDisplayMode](self, "_overrideLargeTitleDisplayMode");
    v23 = v9 == 0;
    objc_msgSend(v5, "_largeTitleAccessoryView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v5, "_supportsTwoLineLargeTitles");
    objc_msgSend(v32, "navigationItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTitle:", v30);

    objc_msgSend(v25, "setTitleView:", v15);
    objc_msgSend(v25, "setLeftBarButtonItems:", v12);
    objc_msgSend(v25, "setRightBarButtonItems:", v14);
    objc_msgSend(v25, "setLeftItemsSupplementBackButton:", v21);
    if (v22 <= 1)
      v26 = 1;
    else
      v26 = v22;
    if ((v23 & v31) != 0)
      v27 = 2;
    else
      v27 = v26;
    objc_msgSend(v25, "setLargeTitleDisplayMode:", v27);
    objc_msgSend(v25, "_setLargeTitleAccessoryView:alignToBaseline:", v24, v29);
    objc_msgSend(v25, "_setSupportsTwoLineLargeTitles:", v28);
    -[_TVBgImageLoadingViewController updateNavigationItem:](self, "updateNavigationItem:", v25);
    -[_TVBgImageLoadingViewController setAppliedNavigationItem:](self, "setAppliedNavigationItem:", 1);

    goto LABEL_23;
  }
  v4 = v32;
  if (!v32)
  {
    -[_TVBgImageLoadingViewController setAppliedNavigationItem:](self, "setAppliedNavigationItem:", 0);
LABEL_23:
    v4 = v32;
  }

}

- (void)_updateNavigationBarPadding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  if (self->_navigationItemElement)
  {
    -[_TVBgImageLoadingViewController navigationController](self, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[_TVModalPresenter presenter](_TVModalPresenter, "presenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modalRootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 != v5)
    {
      -[IKViewElement style](self->_navigationItemElement, "style");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "tv_padding");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;

      -[_TVBgImageLoadingViewController navigationController](self, "navigationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "navigationBar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "layoutMargins");
      if (v10 != v20 || v8 != v17 || v14 != v19)
      {

LABEL_13:
        -[_TVBgImageLoadingViewController navigationController](self, "navigationController");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "navigationBar");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setLayoutMargins:", v8, v10, v12, v14);

        -[_TVBgImageLoadingViewController navigationController](self, "navigationController");
        v27 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "navigationBar");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setNeedsLayout");

        return;
      }
      v23 = v18;

      if (v12 != v23)
        goto LABEL_13;
    }
  }
}

- (void)_updateNavigationItem
{
  void *v3;
  void *v4;
  IKViewElement *navigationItemElement;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  UIView *rightLargeTitleButton;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t k;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  _TVBgImageLoadingViewController *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  id obj;
  id obja;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVBgImageLoadingViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = self;
  v96 = v3;
  navigationItemElement = self->_navigationItemElement;
  v94 = v4;
  if (!navigationItemElement)
  {
    v97 = 0;
    v9 = 0;
    v99 = 1;
    goto LABEL_35;
  }
  -[IKViewElement children](navigationItemElement, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v111, v117, 16);
  if (!v7)
  {
    v97 = 0;
    v9 = 0;
    v99 = 1;
    goto LABEL_34;
  }
  v8 = v7;
  v97 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v112;
  v99 = 1;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v112 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * i);
      v13 = objc_msgSend(v12, "tv_elementType");
      if (v13 != 6)
      {
        if (v13 == 16)
        {
          objc_msgSend(v12, "style");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "tv_alignment");

          if (v23 == 3)
            goto LABEL_24;
          if (v23 == 1)
          {
            v24 = v3;
LABEL_25:
            objc_msgSend(v24, "addObject:", v12);
            continue;
          }
          +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "titleView");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "_viewFromElement:existingView:", v12, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v35, "sizeToFit");
          v97 = v35;
        }
        else if (v13 == 55)
        {
          objc_msgSend(v12, "text");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "string");
          v15 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "attributes");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", CFSTR("showLargeTitle"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "length"))
          {
            objc_msgSend(v12, "attributes");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKey:", CFSTR("showLargeTitle"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "BOOLValue");

            v3 = v96;
            v21 = v99;
            if (!v20)
              v21 = 2;
            v99 = v21;
          }
          else
          {

          }
          v9 = (void *)v15;
        }
        continue;
      }
      objc_msgSend(v12, "style");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "tv_alignment");

      v27 = v3;
      if (v26 != 1)
      {
        if (v26 != 3)
          goto LABEL_21;
        v27 = v98;
      }
      objc_msgSend(v27, "addObject:", v12);
LABEL_21:
      objc_msgSend(v12, "style");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "tv_position");

      if (v29 == 10)
      {
        +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "_viewFromElement:existingView:", v12, 0);
        v31 = objc_claimAutoreleasedReturnValue();
        rightLargeTitleButton = v95->_rightLargeTitleButton;
        v95->_rightLargeTitleButton = (UIView *)v31;

        continue;
      }
      if (!(v29 | v26))
      {
LABEL_24:
        v24 = v98;
        goto LABEL_25;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v111, v117, 16);
  }
  while (v8);
LABEL_34:

  v4 = v94;
LABEL_35:
  objc_msgSend(v4, "leftBarButtonItem");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "leftBarButtonItem");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_TVBgImageLoadingViewController _stackViewWithMinSpacing:layoutMargin:](v95, "_stackViewWithMinSpacing:layoutMargin:", 15.0, 0.0, 0.0, 0.0, 15.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v4, "rightBarButtonItem");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "rightBarButtonItem");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "view");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_TVBgImageLoadingViewController _stackViewWithMinSpacing:layoutMargin:](v95, "_stackViewWithMinSpacing:layoutMargin:", 15.0, 0.0, 15.0, 0.0, 0.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v91 = v9;

  v100 = v39;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v92 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "subviews");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    obj = v3;
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v116, 16);
    if (v45)
    {
      v46 = v45;
      v47 = 0;
      v48 = *(_QWORD *)v108;
      do
      {
        for (j = 0; j != v46; ++j)
        {
          if (*(_QWORD *)v108 != v48)
            objc_enumerationMutation(obj);
          v50 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * j);
          if (v47 + j >= (unint64_t)objc_msgSend(v44, "count"))
          {
            v51 = 0;
          }
          else
          {
            objc_msgSend(v44, "objectAtIndexedSubscript:", v47 + j);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
          }
          +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "_viewFromElement:existingView:", v50, v51);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v53, "sizeToFit");
          if (!v51)
          {
            objc_msgSend(v53, "frame");
            v55 = v54;
            v57 = v56;
            objc_msgSend(v53, "widthAnchor");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "constraintEqualToConstant:", v55);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "setActive:", 1);

            objc_msgSend(v53, "heightAnchor");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "constraintEqualToConstant:", v57);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "setActive:", 1);

            objc_msgSend(v100, "insertArrangedSubview:atIndex:", v53, 0);
          }

        }
        v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v116, 16);
        v47 += j;
      }
      while (v46);
    }

    v62 = (void *)v92;
    v4 = v94;
    v39 = v100;
  }
  else
  {
    v62 = 0;
  }
  if (objc_msgSend(v98, "count"))
  {
    v93 = v62;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v98, "count"));
    v90 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "subviews");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    obja = v98;
    v64 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v103, v115, 16);
    if (v64)
    {
      v65 = v64;
      v66 = 0;
      v67 = *(_QWORD *)v104;
      do
      {
        for (k = 0; k != v65; ++k)
        {
          if (*(_QWORD *)v104 != v67)
            objc_enumerationMutation(obja);
          v69 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * k);
          if (v66 + k >= (unint64_t)objc_msgSend(v63, "count"))
          {
            v70 = 0;
          }
          else
          {
            objc_msgSend(v63, "objectAtIndexedSubscript:", v66 + k);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
          }
          +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "_viewFromElement:existingView:", v69, v70);
          v72 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v72, "sizeToFit");
          if (!v70)
          {
            objc_msgSend(v72, "frame");
            v74 = v73;
            v76 = v75;
            objc_msgSend(v72, "widthAnchor");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "constraintEqualToConstant:", v74);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "setActive:", 1);

            objc_msgSend(v72, "heightAnchor");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "constraintEqualToConstant:", v76);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "setActive:", 1);

            objc_msgSend(v43, "insertArrangedSubview:atIndex:", v72, 0);
          }

        }
        v65 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v103, v115, 16);
        v66 += k;
      }
      while (v65);
    }

    v62 = v93;
    v4 = v94;
    v39 = v100;
    v81 = (void *)v90;
  }
  else
  {
    v81 = 0;
  }
  objc_msgSend(v39, "subviews");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v82, "count");

  if (v83)
  {
    objc_msgSend(v39, "sizeToFit");
    v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", v39);
    objc_msgSend(v62, "addObject:", v84);

  }
  objc_msgSend(v43, "subviews");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v85, "count");

  if (v86)
  {
    objc_msgSend(v43, "sizeToFit");
    v87 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", v43);
    objc_msgSend(v81, "addObject:", v87);

  }
  objc_msgSend(v43, "sizeToFit");
  objc_msgSend(v4, "setTitleView:", v97);
  objc_msgSend(v4, "setTitle:", v91);
  objc_msgSend(v4, "setLeftBarButtonItems:", v62);
  objc_msgSend(v4, "setRightBarButtonItems:", v81);
  objc_msgSend(v4, "setLeftItemsSupplementBackButton:", 1);
  objc_msgSend(v4, "setLargeTitleDisplayMode:", v99);
  objc_msgSend(v4, "_setLargeTitleAccessoryView:alignToBaseline:", v95->_rightLargeTitleButton, 1);
  objc_msgSend(v4, "_setSupportsTwoLineLargeTitles:", 1);
  -[_TVBgImageLoadingViewController updateNavigationItem:](v95, "updateNavigationItem:", v4);
  -[_TVBgImageLoadingViewController setAppliedNavigationItem:](v95, "setAppliedNavigationItem:", 0);
  -[_TVBgImageLoadingViewController parentViewController](v95, "parentViewController");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVBgImageLoadingViewController _reparentNavigationItem:](v95, "_reparentNavigationItem:", v88);

  -[_TVBgImageLoadingViewController setNeedsStatusBarAppearanceUpdate](v95, "setNeedsStatusBarAppearanceUpdate");
  -[_TVBgImageLoadingViewController navigationController](v95, "navigationController");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setNeedsStatusBarAppearanceUpdate");

}

- (id)_stackViewWithMinSpacing:(double)a3 layoutMargin:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v9 = objc_alloc_init(MEMORY[0x24BDF6DD0]);
  objc_msgSend(v9, "setAxis:", 0);
  objc_msgSend(v9, "setDistribution:", 0);
  objc_msgSend(v9, "setAlignment:", 3);
  objc_msgSend(v9, "setSpacing:", a3);
  objc_msgSend(v9, "setLayoutMargins:", top, left, bottom, right);
  objc_msgSend(v9, "setLayoutMarginsRelativeArrangement:", 1);
  return v9;
}

- (IKViewElement)navigationItemElement
{
  return self->_navigationItemElement;
}

- (void)setNavigationItemElement:(id)a3
{
  objc_storeStrong((id *)&self->_navigationItemElement, a3);
}

- (BOOL)appliedNavigationItem
{
  return self->_appliedNavigationItem;
}

- (void)setAppliedNavigationItem:(BOOL)a3
{
  self->_appliedNavigationItem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationItemElement, 0);
  objc_storeStrong((id *)&self->_rightLargeTitleButton, 0);
  objc_storeStrong(&self->_imageProxy, 0);
}

- (void)loadFromViewController:(void *)a1 completion:.cold.1(void *a1)
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_222D98000, v1, OS_LOG_TYPE_DEBUG, "_configureBgImage:backdropImage: not defined on %@. loadFromViewController:completion: aborted", (uint8_t *)&v4, 0xCu);

}

@end
