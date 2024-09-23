@implementation VideosExtrasElementViewController

- (VideosExtrasElementViewController)init
{
  VideosExtrasElementViewController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VideosExtrasElementViewController;
  v2 = -[VideosExtrasElementViewController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_wide = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)VideosExtrasElementViewController;
  -[VideosExtrasElementViewController dealloc](&v2, sel_dealloc);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasElementViewController;
  -[VideosExtrasElementViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[VideosExtrasElementViewController _prepareLayout](self, "_prepareLayout");
}

- (unint64_t)extrasSize
{
  void *v2;
  double v3;
  double v4;
  unint64_t result;

  -[VideosExtrasElementViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  if (v4 <= 480.0)
    return 0;
  if (v4 <= 568.0)
    return 1;
  if (v4 <= 687.0)
    return 2;
  result = 3;
  if (v4 > 736.0 && v4 > 812.0)
  {
    if (v4 <= 896.0)
      return 3;
    else
      return 4;
  }
  return result;
}

- (id)backgroundViewController
{
  return self->_backgroundViewController;
}

+ (id)_borderView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initForAutolayout");
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  v4 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  objc_msgSend(v4, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v2, 8, 0, 0, 0, 1.0, 1.0 / v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addConstraint:", v7);
  return v2;
}

- (void)configureBackgroundWithElements:(id)a3
{
  VideosExtrasBackgroundViewController *backgroundViewController;
  void *v5;
  VideosExtrasBackgroundViewController *v6;
  VideosExtrasBackgroundViewController *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  backgroundViewController = self->_backgroundViewController;
  if (backgroundViewController)
  {
    -[VideosExtrasBackgroundViewController willMoveToParentViewController:](backgroundViewController, "willMoveToParentViewController:", 0);
    -[VideosExtrasBackgroundViewController view](self->_backgroundViewController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    -[VideosExtrasBackgroundViewController removeFromParentViewController](self->_backgroundViewController, "removeFromParentViewController");
  }
  v6 = -[VideosExtrasBackgroundViewController initWithBackgroundElements:]([VideosExtrasBackgroundViewController alloc], "initWithBackgroundElements:", v10);
  v7 = self->_backgroundViewController;
  self->_backgroundViewController = v6;

  -[VideosExtrasElementViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasBackgroundViewController view](self->_backgroundViewController, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v9, "setFrame:");
  -[VideosExtrasElementViewController addChildViewController:](self, "addChildViewController:", self->_backgroundViewController);
  objc_msgSend(v8, "addSubview:", v9);
  -[VideosExtrasBackgroundViewController didMoveToParentViewController:](self->_backgroundViewController, "didMoveToParentViewController:", self);

}

- (void)_configureBannerWithElement:(id)a3
{
  id v4;
  NSMapTable *v5;
  NSMapTable *bannerButtonMap;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
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
  id v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
  v5 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  bannerButtonMap = self->_bannerButtonMap;
  self->_bannerButtonMap = v5;

  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = v4;
  objc_msgSend(v4, "buttons");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
          objc_msgSend(v12, "text");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "text");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "string");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[VideosExtrasElementViewController navigationController](self, "navigationController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "navigationBar");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[VideosExtrasNavigationBarButton extrasNavigationButton:](VideosExtrasNavigationBarButton, "extrasNavigationButton:", objc_msgSend(v17, "_activeBarMetrics"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "setTitle:forState:", v15, 0);
          objc_msgSend(v18, "addTarget:action:forControlEvents:", self, sel__didActivateButtonWithItem_, 64);
          objc_msgSend(v18, "sizeToFit");
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v18);
          -[NSMapTable setObject:forKey:](self->_bannerButtonMap, "setObject:forKey:", v12, v18);

          objc_msgSend(v25, "addObject:", v19);
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v8);
  }
  -[VideosExtrasElementViewController navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setRightBarButtonItems:", v25);

  objc_msgSend(v24, "title");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "text");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "string");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[VideosExtrasElementViewController setTitle:](self, "setTitle:", v23);
}

- (id)_installBackdrop:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "contentInset");
    v6 = v5;
  }
  else
  {
    v6 = 0.0;
  }
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, v6, 0.0, 0.0);
  objc_msgSend(v4, "addSubview:", v22);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithPrivateStyle:", 2030);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "setGroupName:", CFSTR("VideosExtrasBlurGroupName"));
  -[VideosExtrasElementViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v7);

  -[VideosExtrasElementViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v4);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 7, 0, v4, 7, 1.0, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 8, 0, v4, 8, 1.0, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 9, 0, v4, 9, 1.0, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 3, 0, v22, 3, 1.0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 1148682240;
  objc_msgSend(v13, "setPriority:", v14);
  v15 = (void *)MEMORY[0x1E0CB3718];
  -[VideosExtrasElementViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "safeAreaLayoutGuide");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 3, 1, v17, 3, 1.0, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[VideosExtrasElementViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v10;
  v23[1] = v11;
  v23[2] = v12;
  v23[3] = v13;
  v23[4] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addConstraints:", v20);

  return v7;
}

- (void)_didActivateButtonWithItem:(id)a3
{
  id v3;

  -[NSMapTable objectForKey:](self->_bannerButtonMap, "objectForKey:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 0, 0, 0);

}

- (BOOL)isWide
{
  return self->_wide;
}

- (void)setWide:(BOOL)a3
{
  self->_wide = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerButtonMap, 0);
  objc_storeStrong((id *)&self->_backgroundViewController, 0);
}

@end
