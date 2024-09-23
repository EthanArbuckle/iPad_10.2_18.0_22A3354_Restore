@implementation ContainerViewController

- (UIView)containerView
{
  return self->_containerView;
}

- (unint64_t)containerStyle
{
  return -[ContainerStyleManager containerStyle](self->_containerStyleManager, "containerStyle");
}

- (void)setAllowOnlyStandardStyle:(BOOL)a3
{
  -[ContainerStyleManager setAllowOnlyStandardStyle:](self->_containerStyleManager, "setAllowOnlyStandardStyle:", a3);
}

- (BOOL)allowOnlyStandardStyle
{
  return -[ContainerStyleManager allowOnlyStandardStyle](self->_containerStyleManager, "allowOnlyStandardStyle");
}

- (void)setStackOnOppositeSide:(BOOL)a3
{
  -[ContainerStyleManager setStackOnOppositeSide:](self->_containerStyleManager, "setStackOnOppositeSide:", a3);
}

- (BOOL)stackOnOppositeSide
{
  return -[ContainerStyleManager stackOnOppositeSide](self->_containerStyleManager, "stackOnOppositeSide");
}

- (void)setUseBackdropFullScreen:(BOOL)a3
{
  if (self->_useBackdropFullScreen != a3)
  {
    self->_useBackdropFullScreen = a3;
    -[ContainerViewController _updateBackdropConstraints](self, "_updateBackdropConstraints");
  }
}

- (void)_updateBackdropConstraints
{
  UIView *v3;
  UIView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *backdropConstraints;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];

  if (self->_backdropConstraints)
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  if (self->_useBackdropFullScreen)
    v3 = (UIView *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
  else
    v3 = self->_containerView;
  v4 = v3;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BackdropView topAnchor](self->_backdropView, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v4, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
  v19[0] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BackdropView bottomAnchor](self->_backdropView, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v4, "bottomAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v14));
  v19[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BackdropView leadingAnchor](self->_backdropView, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v4, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  v19[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BackdropView trailingAnchor](self->_backdropView, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v4, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v19[3] = v11;
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 4));
  backdropConstraints = self->_backdropConstraints;
  self->_backdropConstraints = v12;

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_backdropConstraints);
}

- (BOOL)useBackdrop
{
  return 1;
}

- (NSString)blurGroupName
{
  return (NSString *)CFSTR("MapsTheme");
}

- (void)setCaptureViewForCardView:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController blurGroupName](self, "blurGroupName"));
  objc_msgSend(v5, "setBlurGroupName:", v4);

  if (-[ContainerViewController useBackdrop](self, "useBackdrop"))
    objc_msgSend(v5, "setCaptureView:", self->_backdropView);

}

- (id)cardWithBlur:(BOOL)a3
{
  return -[CardProvider cardWithBlur:](self->_cardProvider, "cardWithBlur:", a3);
}

- (id)cardForViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_cards, "objectForKey:", v4));
    if (!v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cardPresentationController"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController cardWithBlur:](self, "cardWithBlur:", objc_msgSend(v6, "blurInCardView")));

      objc_msgSend(v5, "setLayoutStyle:", -[ContainerViewController containerStyle](self, "containerStyle"));
      -[ContainerViewController setCaptureViewForCardView:](self, "setCaptureViewForCardView:", v5);
      -[NSMapTable setObject:forKey:](self->_cards, "setObject:forKey:", v5, v4);
    }
    v7 = (objc_class *)objc_opt_class(v4);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v5, "setAccessibilityIdentifier:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cardPresentationController"));
    objc_msgSend(v10, "setCardView:fromContainer:", v5, self);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)removeCardforViewController:(id)a3
{
  NSMapTable *cards;
  id v5;
  void *v6;
  id v7;

  if (a3)
  {
    cards = self->_cards;
    v5 = a3;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](cards, "objectForKey:", v5));
    -[NSMapTable removeObjectForKey:](self->_cards, "removeObjectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardPresentationController"));

    objc_msgSend(v6, "setCardView:fromContainer:", 0, 0);
    -[CardProvider recycleCard:](self->_cardProvider, "recycleCard:", v7);

  }
}

- (NSArray)visibleViewControllers
{
  return -[ContainerTransitionManager visibleViewControllers](self->_transitionManager, "visibleViewControllers");
}

- (NSArray)visibleCardViews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController visibleViewControllers](self, "visibleViewControllers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController visibleViewControllers](self, "visibleViewControllers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_cards, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9)));
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = objc_msgSend(v4, "copy");
  return (NSArray *)v11;
}

- (ContaineeProtocol)rootPresentingViewController
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStack containeeStateAtIndex:](self->_containerStack, "containeeStateAtIndex:", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "viewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentingViewController"));

  return (ContaineeProtocol *)v4;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6;
  CustomContaineePresentationController *v7;

  v6 = a3;
  v7 = -[CustomContaineePresentationController initWithPresentedViewController:presentingViewController:]([CustomContaineePresentationController alloc], "initWithPresentedViewController:presentingViewController:", v6, self);

  return v7;
}

- (ContaineeProtocol)currentOrPendingViewController
{
  void *v2;

  if (self->_willBeginDisplayingInLockScreen)
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerTransitionManager currentOrPendingViewController](self->_transitionManager, "currentOrPendingViewController"));
  return (ContaineeProtocol *)v2;
}

- (void)updateContaineeStackState
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentContaineeState](self, "currentContaineeState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cardPresentationController"));
  objc_msgSend(v5, "setLayout:forStyle:", objc_msgSend(v4, "containeeLayout"), -[ContainerViewController containerStyle](self, "containerStyle"));

}

- (id)currentContaineeState
{
  return -[ContainerStack containeeStateForContainee:](self->_containerStack, "containeeStateForContainee:", self->_currentViewController);
}

- (unint64_t)layoutForCurrentViewControllerWithStyle:(unint64_t)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentContaineeState](self, "currentContaineeState"));
  v5 = objc_msgSend(v4, "layoutForStyle:", a3);

  return (unint64_t)v5;
}

- (unint64_t)layoutModalPresenter
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController modalPresenter](self, "modalPresenter"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStack containeeStateForContainee:](self->_containerStack, "containeeStateForContainee:", v3));
    v5 = objc_msgSend(v4, "layoutForStyle:", -[ContainerViewController containerStyle](self, "containerStyle"));

  }
  else
  {
    v5 = 0;
  }

  return (unint64_t)v5;
}

- (ContaineeProtocol)modalPresenter
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController visibleViewControllers](self, "visibleViewControllers", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));

        if (v8 != v9)
        {
          v10 = v8;
          goto LABEL_11;
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return (ContaineeProtocol *)v10;
}

- (BOOL)supportsEmptyStack
{
  return self->_enableMacPresentationStyles;
}

- (BOOL)isRootContainer
{
  return 0;
}

- (BOOL)allowsDisplayOnLockScreen
{
  return 0;
}

- (BOOL)shouldHideCard
{
  return 0;
}

- (ContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ContainerViewController *v4;
  ContainerViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ContainerViewController;
  v4 = -[ContainerViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
    -[ContainerViewController customInit](v4, "customInit");
  return v5;
}

- (void)customInit
{
  NSMapTable *v3;
  NSMapTable *cards;
  ContainerStack *v5;
  ContainerStack *containerStack;
  ContainerStyleManager *v7;
  ContainerStyleManager *containerStyleManager;
  ContainerTransitionManager *v9;
  ContainerTransitionManager *transitionManager;
  CardAnimationManager *v11;
  CardAnimationManager *animationManager;
  CardProvider *v13;
  CardProvider *cardProvider;

  v3 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
  cards = self->_cards;
  self->_cards = v3;

  self->_containeeLayout = 0;
  v5 = objc_alloc_init(ContainerStack);
  containerStack = self->_containerStack;
  self->_containerStack = v5;

  v7 = -[ContainerStyleManager initWithContainer:]([ContainerStyleManager alloc], "initWithContainer:", self);
  containerStyleManager = self->_containerStyleManager;
  self->_containerStyleManager = v7;

  v9 = -[ContainerTransitionManager initWithContainer:]([ContainerTransitionManager alloc], "initWithContainer:", self);
  transitionManager = self->_transitionManager;
  self->_transitionManager = v9;

  v11 = objc_alloc_init(CardAnimationManager);
  animationManager = self->_animationManager;
  self->_animationManager = v11;

  v13 = objc_alloc_init(CardProvider);
  cardProvider = self->_cardProvider;
  self->_cardProvider = v13;

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  UIView *v8;
  UIView *containerView;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  BackdropView *v18;
  void *v19;
  BackdropView *v20;
  BackdropView *backdropView;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  SupplementalStackViewController *v27;
  SupplementalStackViewController *paletteViewController;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSLayoutConstraint *v36;
  NSLayoutConstraint *paletteWidthConstraint;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSLayoutConstraint *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  objc_super v59;
  _QWORD v60[4];

  v59.receiver = self;
  v59.super_class = (Class)ContainerViewController;
  -[ContainerViewController viewDidLoad](&v59, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  objc_msgSend(v4, "setAllowsGroupOpacity:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_statusBarHeightChanged", CFSTR("IOSBasedChromeStatusBarHeightDidUpdateNotification"), 0);

  v6 = objc_alloc((Class)UIView);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
  objc_msgSend(v7, "bounds");
  v8 = (UIView *)objc_msgSend(v6, "initWithFrame:");
  containerView = self->_containerView;
  self->_containerView = v8;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setUserInteractionEnabled:](self->_containerView, "setUserInteractionEnabled:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIView setBackgroundColor:](self->_containerView, "setBackgroundColor:", v10);

  LODWORD(v11) = 1148846080;
  -[UIView setContentHuggingPriority:forAxis:](self->_containerView, "setContentHuggingPriority:forAxis:", 1, v11);
  LODWORD(v12) = 1148846080;
  -[UIView setContentHuggingPriority:forAxis:](self->_containerView, "setContentHuggingPriority:forAxis:", 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
  objc_msgSend(v13, "addSubview:", self->_containerView);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  LODWORD(v7) = objc_msgSend(v14, "isInternalInstall");

  if ((_DWORD)v7)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v16 = objc_msgSend(v15, "BOOLForKey:", CFSTR("__internal__DisableChrome"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
    objc_msgSend(v17, "setHidden:", v16);

  }
  if (-[ContainerViewController useBackdrop](self, "useBackdrop"))
  {
    v18 = [BackdropView alloc];
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
    objc_msgSend(v19, "bounds");
    v20 = -[BackdropView initWithFrame:](v18, "initWithFrame:");
    backdropView = self->_backdropView;
    self->_backdropView = v20;

    -[BackdropView setTranslatesAutoresizingMaskIntoConstraints:](self->_backdropView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController blurGroupName](self, "blurGroupName"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BackdropView captureGroup](self->_backdropView, "captureGroup"));
    objc_msgSend(v23, "setGroupName:", v22);

    LODWORD(v24) = 1148846080;
    -[BackdropView setContentHuggingPriority:forAxis:](self->_backdropView, "setContentHuggingPriority:forAxis:", 1, v24);
    LODWORD(v25) = 1148846080;
    -[BackdropView setContentHuggingPriority:forAxis:](self->_backdropView, "setContentHuggingPriority:forAxis:", 0, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
    objc_msgSend(v26, "insertSubview:atIndex:", self->_backdropView, 0);

    -[ContainerViewController _updateBackdropConstraints](self, "_updateBackdropConstraints");
  }
  if (self->_enableMacPresentationStyles)
  {
    v27 = objc_alloc_init(SupplementalStackViewController);
    paletteViewController = self->_paletteViewController;
    self->_paletteViewController = v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SupplementalStackViewController view](self->_paletteViewController, "view"));
    objc_msgSend(v30, "setBackgroundColor:", v29);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[SupplementalStackViewController view](self->_paletteViewController, "view"));
    objc_msgSend(v31, "addSubview:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[SupplementalStackViewController view](self->_paletteViewController, "view"));
    objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[SupplementalStackViewController view](self->_paletteViewController, "view"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "widthAnchor"));
    v36 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToConstant:", 0.0));
    paletteWidthConstraint = self->_paletteWidthConstraint;
    self->_paletteWidthConstraint = v36;

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[SupplementalStackViewController view](self->_paletteViewController, "view"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "topAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "topAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v55));
    v60[0] = v54;
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[SupplementalStackViewController view](self->_paletteViewController, "view"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "leadingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "leadingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v38));
    v60[1] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[SupplementalStackViewController view](self->_paletteViewController, "view"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bottomAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bottomAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v43));
    v45 = self->_paletteWidthConstraint;
    v60[2] = v44;
    v60[3] = v45;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v60, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v46);

    v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    v48 = objc_msgSend(v47, "appKitBundleClass");

    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "shareKitPresentationNotificationName"));
    objc_msgSend(v49, "addObserver:selector:name:object:", self, "shareFromMenuDidSelect:", v50, 0);

    -[ContainerViewController addChildViewController:](self, "addChildViewController:", self->_paletteViewController);
    -[SupplementalStackViewController didMoveToParentViewController:](self->_paletteViewController, "didMoveToParentViewController:", self);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  MapGestureCardDismissalHelper *cardDismissalHelper;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ContainerViewController;
  -[ContainerViewController viewDidDisappear:](&v6, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  objc_msgSend(v4, "didResignCurrent");

  self->_viewHasAppeared = 0;
  -[MapGestureCardDismissalHelper setDelegate:](self->_cardDismissalHelper, "setDelegate:", 0);
  cardDismissalHelper = self->_cardDismissalHelper;
  self->_cardDismissalHelper = 0;

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  ContainerViewController *v7;
  ContainerViewController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  objc_super v17;
  uint8_t buf[4];
  __CFString *v19;
  __int16 v20;
  const char *v21;

  v3 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ContainerViewController;
  -[ContainerViewController viewWillDisappear:](&v17, "viewWillDisappear:");
  v5 = sub_10043165C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    goto LABEL_11;
  v7 = self;
  v8 = v7;
  if (!v7)
  {
    v14 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v9 = (objc_class *)objc_opt_class(v7);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
    v13 = v12;
    if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
    {
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

      goto LABEL_8;
    }

  }
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
  *(_DWORD *)buf = 138543618;
  v19 = v14;
  v20 = 2080;
  v21 = "-[ContainerViewController viewWillDisappear:]";
  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] %s", buf, 0x16u);

LABEL_11:
  -[ContainerTransitionManager setContainerReadyToInsert:](self->_transitionManager, "setContainerReadyToInsert:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  objc_msgSend(v15, "willResignCurrent:", v3);

  -[ContainerViewController setContaineesHidden:](self, "setContaineesHidden:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v16, "removeObserver:name:object:", self, UISceneWillEnterForegroundNotification, 0);

  if (self->_enableMacPresentationStyles)
    -[ContainerViewController _popCurrentPopoverViewControllerAnimated:](self, "_popCurrentPopoverViewControllerAnimated:", v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ContainerViewController;
  -[ContainerViewController viewWillAppear:](&v7, "viewWillAppear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  objc_msgSend(v5, "willBecomeCurrent:", v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "sceneWillEnterForeground:", UISceneWillEnterForegroundNotification, 0);

}

- (void)sceneWillEnterForeground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  int v13;
  ContainerViewController *v14;
  __int16 v15;
  const char *v16;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_uiScene"));

  if (v4 == v6)
  {
    v7 = sub_10043165C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v13 = 138412546;
      v14 = self;
      v15 = 2080;
      v16 = "-[ContainerViewController sceneWillEnterForeground:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@ %s", (uint8_t *)&v13, 0x16u);
    }

    if (-[ContainerViewController delaysFirstCardPresentation]_0())
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
      v11 = v10;
      if (v10 && self->_viewHasAppeared)
      {
        v12 = -[ContainerViewController isRootContainer](self, "isRootContainer");

        if (v12)
        {
          -[ContainerTransitionManager setContainerReadyToInsert:](self->_transitionManager, "setContainerReadyToInsert:", 0);
          -[ContainerViewController _internal_ensurePresentationsMatchContaineeStackAllowingFault:allowingAnimations:skipUnlock:](self, "_internal_ensurePresentationsMatchContaineeStackAllowingFault:allowingAnimations:skipUnlock:", 1, 0, 0);
        }
      }
      else
      {

      }
    }
  }
}

- (BOOL)containeesHidden
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStack allObjects](self->_containerStack, "allObjects"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  if ((objc_opt_respondsToSelector(v3, "cardPresentationController") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cardPresentationController"));
    v5 = objc_msgSend(v4, "hidden");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setContaineesHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  ContainerViewController *v7;
  ContainerViewController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  unsigned int v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  __CFString *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  __CFString *v31;

  v3 = a3;
  v5 = sub_10043165C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    goto LABEL_13;
  v7 = self;
  v8 = v7;
  if (!v7)
  {
    v14 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v9 = (objc_class *)objc_opt_class(v7);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
    v13 = v12;
    if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
    {
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

      goto LABEL_8;
    }

  }
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
  v15 = CFSTR("NO");
  if (v3)
    v15 = CFSTR("YES");
  *(_DWORD *)buf = 138543874;
  v27 = v14;
  v28 = 2080;
  v29 = "-[ContainerViewController setContaineesHidden:]";
  v30 = 2112;
  v31 = v15;
  v16 = v15;
  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] %s: %@", buf, 0x20u);

LABEL_13:
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStack allObjects](self->_containerStack, "allObjects"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  if (v18 == v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "presentingViewController"));

    if (!v20)
      goto LABEL_23;
  }
  else
  {

  }
  if (!v18)
    return;
  while ((objc_opt_respondsToSelector(v18, "cardPresentationController") & 1) != 0)
  {
    v21 = v18;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "cardPresentationController"));
    v23 = objc_msgSend(v22, "usingSheetPresentation");

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "cardPresentationController"));
      objc_msgSend(v24, "setHidden:", v3);

    }
    v25 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));

    if (v21 == v25)
    {

      goto LABEL_25;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "presentedViewController"));

    if (!v18)
    {
      v21 = 0;
      goto LABEL_25;
    }
  }
LABEL_23:
  v21 = v18;
LABEL_25:

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  MapGestureCardDismissalHelper *v7;
  void *v8;
  void *v9;
  MapGestureCardDismissalHelper *v10;
  MapGestureCardDismissalHelper *cardDismissalHelper;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ContainerViewController;
  -[ContainerViewController viewDidAppear:](&v12, "viewDidAppear:", a3);
  self->_viewHasAppeared = 1;
  if (self->_needToUpdateHeight)
    -[ContainerViewController snapToLayout:](self, "snapToLayout:", -[ContainerViewController containeeLayout](self, "containeeLayout"));
  if (-[ContainerViewController delaysFirstCardPresentation]_0())
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_rootSheetPresentationController"));
    objc_msgSend(v6, "_setShouldScaleDownBehindDescendantSheets:", 0);

  }
  if (-[ContainerViewController delaysFirstCardPresentation]_0())
  {
    -[ContainerViewController _internal_ensurePresentationsMatchContaineeStackAllowingFault:allowingAnimations:skipUnlock:](self, "_internal_ensurePresentationsMatchContaineeStackAllowingFault:allowingAnimations:skipUnlock:", 0, 1, 0);
  }
  else if (-[ContainerViewController delaysFirstCardPresentation](self, "delaysFirstCardPresentation"))
  {
    -[ContainerViewController _unlockCardQueue](self, "_unlockCardQueue");
  }
  v7 = [MapGestureCardDismissalHelper alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapView"));
  v10 = -[MapGestureCardDismissalHelper initWithMapView:](v7, "initWithMapView:", v9);
  cardDismissalHelper = self->_cardDismissalHelper;
  self->_cardDismissalHelper = v10;

  -[MapGestureCardDismissalHelper setDelegate:](self->_cardDismissalHelper, "setDelegate:", self);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ContainerViewController;
  -[ContainerViewController viewWillLayoutSubviews](&v5, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));

  if (v4)
    -[ContainerStyleManager updateLayoutStyle](self->_containerStyleManager, "updateLayoutStyle");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  objc_super v9;

  -[ContainerViewController _updateContainerMargins](self, "_updateContainerMargins");
  v9.receiver = self;
  v9.super_class = (Class)ContainerViewController;
  -[ContainerViewController viewDidLayoutSubviews](&v9, "viewDidLayoutSubviews");
  if ((-[ContainerViewController delaysFirstCardPresentation]_0() & 1) == 0
    && !-[ContainerViewController delaysFirstCardPresentation](self, "delaysFirstCardPresentation"))
  {
    -[ContainerViewController _unlockCardQueue](self, "_unlockCardQueue");
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cardPresentationController"));
    v8 = objc_msgSend(v7, "usingSheetPresentation");

    if (v8)
    {
      -[ContainerViewController _cardHeightForComputingBottomMapEdgeInsets](self, "_cardHeightForComputingBottomMapEdgeInsets");
      -[ContainerViewController contentHeightUpdatedWithValue:](self, "contentHeightUpdatedWithValue:");
    }
  }
  else
  {

  }
}

- (void)viewLayoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ContainerViewController;
  -[ContainerViewController viewLayoutMarginsDidChange](&v3, "viewLayoutMarginsDidChange");
  -[ContainerViewController _updateContainerMargins](self, "_updateContainerMargins");
}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ContainerViewController;
  -[ContainerViewController viewSafeAreaInsetsDidChange](&v3, "viewSafeAreaInsetsDidChange");
  -[ContainerViewController snapToLayout:](self, "snapToLayout:", -[ContainerViewController containeeLayout](self, "containeeLayout"));
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  CGFloat height;
  double width;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  double v11;
  double v12;
  BOOL v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;
  BOOL v17;
  _QWORD v18[5];
  _QWORD *v19;
  BOOL v20;
  _QWORD v21[5];
  objc_super v22;
  uint8_t buf[4];
  id v24;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = sub_100431B2C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Container viewWillTransitionToSize %@", buf, 0xCu);
  }

  if (self->_enableMacPresentationStyles)
    -[ContainerViewController _popCurrentPopoverViewControllerAnimated:](self, "_popCurrentPopoverViewControllerAnimated:", 1);
  v22.receiver = self;
  v22.super_class = (Class)ContainerViewController;
  -[ContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v22, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  self->_nextHeight = height;
  self->_needToUpdateHeight = !self->_viewHasAppeared;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
  objc_msgSend(v10, "bounds");
  v13 = v12 == height && v11 == width;

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100283F2C;
  v21[3] = &unk_1011AEB50;
  v21[4] = self;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100284114;
  v18[3] = &unk_1011AEB78;
  v18[4] = self;
  v19 = objc_retainBlock(v21);
  v20 = v13;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10028420C;
  v15[3] = &unk_1011AEB78;
  v15[4] = self;
  v16 = v19;
  v17 = v13;
  v14 = v19;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v18, v15);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  BOOL v14;
  objc_super v15;
  uint8_t buf[4];
  id v17;

  v6 = a4;
  v7 = a3;
  v8 = sub_100431B2C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Container willTransitionToTraitCollection %@", buf, 0xCu);
  }

  v15.receiver = self;
  v15.super_class = (Class)ContainerViewController;
  -[ContainerViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v15, "willTransitionToTraitCollection:withTransitionCoordinator:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController traitCollection](self, "traitCollection"));
  v11 = objc_msgSend(v10, "verticalSizeClass");
  v12 = objc_msgSend(v7, "verticalSizeClass");

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002844D0;
  v13[3] = &unk_1011AEBA0;
  v13[4] = self;
  v14 = v11 != v12;
  objc_msgSend(v6, "animateAlongsideTransition:completion:", v13, &stru_1011AEBE0);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ContainerViewController;
  -[MapsThemeViewController traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[ContainerViewController _updateOverrideTraitCollectionsForStyle:](self, "_updateOverrideTraitCollectionsForStyle:", -[ContainerViewController containerStyle](self, "containerStyle"));
}

- (void)addChildViewController:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ContainerViewController;
  v4 = a3;
  -[ContainerViewController addChildViewController:](&v6, "addChildViewController:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController", v6.receiver, v6.super_class));

  if (v5 == v4)
    -[ContainerViewController _updateOverrideTraitCollectionsForStyle:](self, "_updateOverrideTraitCollectionsForStyle:", -[ContainerViewController containerStyle](self, "containerStyle"));
}

- (void)removeChildViewController:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[ContainerViewController setOverrideTraitCollection:forChildViewController:](self, "setOverrideTraitCollection:forChildViewController:", 0, v4);
  v5.receiver = self;
  v5.super_class = (Class)ContainerViewController;
  -[ContainerViewController removeChildViewController:](&v5, "removeChildViewController:", v4);

}

- (ContaineeProtocol)currentViewController
{
  ContaineeProtocol *currentPopoverViewController;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  ContaineeProtocol *v8;
  void *v9;

  if (!self->_enableMacPresentationStyles)
    goto LABEL_7;
  currentPopoverViewController = self->_currentPopoverViewController;
  if (currentPopoverViewController)
    goto LABEL_10;
  v4 = objc_claimAutoreleasedReturnValue(-[ContainerViewController presentedViewController](self, "presentedViewController"));
  if (!v4
    || (v5 = (void *)v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController presentedViewController](self, "presentedViewController")),
        v7 = objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___ContaineeProtocol),
        v6,
        v5,
        !v7))
  {
LABEL_7:
    if (self->_willBeginDisplayingInLockScreen)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStack lastState](self->_containerStack, "lastState"));
      v8 = (ContaineeProtocol *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewController"));

      return v8;
    }
    currentPopoverViewController = self->_currentViewController;
LABEL_10:
    v8 = currentPopoverViewController;
    return v8;
  }
  v8 = (ContaineeProtocol *)objc_claimAutoreleasedReturnValue(-[ContainerViewController presentedViewController](self, "presentedViewController"));
  if (-[ContaineeProtocol preferredPresentationStyle](v8, "preferredPresentationStyle") != (id)6)
  {

    goto LABEL_7;
  }
  return v8;
}

- (void)setCurrentViewController:(id)a3
{
  ContaineeProtocol *v5;
  id v6;
  NSObject *v7;
  ContainerViewController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ContainerViewController *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  ContaineeProtocol *v19;

  v5 = (ContaineeProtocol *)a3;
  if (self->_currentViewController == v5)
    goto LABEL_11;
  v6 = sub_10043165C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = self;
    v9 = (objc_class *)objc_opt_class(v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

    *(_DWORD *)buf = 138543618;
    v17 = v14;
    v18 = 2114;
    v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] currentViewController is now: %{public}@", buf, 0x16u);

  }
  objc_storeStrong((id *)&self->_currentViewController, a3);
  v15 = (ContainerViewController *)objc_claimAutoreleasedReturnValue(-[ContaineeProtocol parentViewController](v5, "parentViewController"));

  if (v15 == self)
    -[ContainerViewController _updateOverrideTraitCollectionsForStyle:](self, "_updateOverrideTraitCollectionsForStyle:", -[ContainerViewController containerStyle](self, "containerStyle"));
LABEL_11:

}

- (id)currentViewControllerWithPresentationStyle:(unint64_t)a3
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  char *v7;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;

  switch(a3)
  {
    case 1uLL:
    case 2uLL:
    case 4uLL:
    case 6uLL:
      v3 = sub_1004318FC();
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v10 = 136315650;
        v11 = "-[ContainerViewController currentViewControllerWithPresentationStyle:]";
        v12 = 2080;
        v13 = "ContainerViewController.m";
        v14 = 1024;
        v15 = 932;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v10, 0x1Cu);
      }

      if (sub_100A70734())
      {
        v5 = sub_1004318FC();
        v6 = objc_claimAutoreleasedReturnValue(v5);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v7 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v10 = 138412290;
          v11 = v7;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);

        }
      }
      return 0;
    case 3uLL:
      v9 = 136;
      return *(id *)((char *)&self->super.super.super.super.super.isa + v9);
    case 5uLL:
      v9 = 128;
      return *(id *)((char *)&self->super.super.super.super.super.isa + v9);
    default:
      v9 = 208;
      return *(id *)((char *)&self->super.super.super.super.super.isa + v9);
  }
}

- (BOOL)isContaineeStackEmpty
{
  return -[ContainerStack count](self->_containerStack, "count") == 0;
}

- (void)_unlockCardQueue
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  char v27;
  _QWORD v28[5];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100284E88;
  v28[3] = &unk_1011AC860;
  v28[4] = self;
  v3 = objc_retainBlock(v28);
  if ((-[ContainerViewController delaysFirstCardPresentation]_0() & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentedViewController"));
    v8 = objc_opt_class(ContaineeViewController);
    isKindOfClass = objc_opt_isKindOfClass(v7, v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "presentedViewController"));
    v12 = objc_opt_class(RAPWebBundleContaineeViewController);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      v13 = 1;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "presentedViewController"));
      v16 = objc_opt_class(RAPDirectionsReportContaineeViewController);
      v13 = objc_opt_isKindOfClass(v15, v16);

    }
    if (-[ContainerViewController isRootContainer](self, "isRootContainer"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "presentedViewController"));
      if (v18)
      {
        v19 = (void *)v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "presentedViewController"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStack containeeStateAtIndex:](self->_containerStack, "containeeStateAtIndex:", 0));
        v27 = isKindOfClass;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "viewController"));

        v24 = v21 == v23;
        isKindOfClass = v27;
        if (!v24)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
LABEL_13:
          v26 = v25;
          objc_msgSend(v25, "dismissViewControllerAnimated:completion:", 0, v3);

          goto LABEL_14;
        }
      }
      else
      {

      }
    }
    if (!((v5 == 0 || (isKindOfClass & 1) == 0) | v13 & 1))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
      goto LABEL_13;
    }
  }
  ((void (*)(_QWORD *))v3[2])(v3);
LABEL_14:

}

- (void)_updateContainerMargins
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));

  if (v4)
    -[ContainerStyleManager updateLayoutStyle](self->_containerStyleManager, "updateLayoutStyle");
  -[ContainerViewController updateMapEdgeInsets](self, "updateMapEdgeInsets");
}

- (void)reset
{
  ContainerStack *v3;
  ContainerStack *containerStack;
  ContaineeProtocol *currentViewController;

  if (-[ContainerViewController delaysFirstCardPresentation]_0())
  {
    v3 = objc_alloc_init(ContainerStack);
    containerStack = self->_containerStack;
    self->_containerStack = v3;

    currentViewController = self->_currentViewController;
    self->_currentViewController = 0;

  }
  else
  {
    -[ContainerViewController setControllerStack:](self, "setControllerStack:", &__NSArray0__struct);
  }
}

- (void)willChangeStyle:(unint64_t)a3
{
  ContainerDelegate **p_containerDelegate;
  id WeakRetained;
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;

  p_containerDelegate = &self->_containerDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerDelegate);
  v7 = objc_opt_respondsToSelector(WeakRetained, "container:willChangeStyle:");

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_containerDelegate);
    objc_msgSend(v8, "container:willChangeStyle:", self, -[ContainerViewController containerStyle](self, "containerStyle"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v12 = CFSTR("ContainerStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v13 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("ContainerWillChangeStyleNotification"), self, v11);

}

- (void)didChangeStyle:(unint64_t)a3
{
  ContainerDelegate **p_containerDelegate;
  id WeakRetained;
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;

  p_containerDelegate = &self->_containerDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerDelegate);
  v7 = objc_opt_respondsToSelector(WeakRetained, "container:didChangeContainerStyle:");

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_containerDelegate);
    objc_msgSend(v8, "container:didChangeContainerStyle:", self, -[ContainerViewController containerStyle](self, "containerStyle"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v12 = CFSTR("ContainerStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v13 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("ContainerDidChangeStyleNotification"), self, v11);

  +[MapsAnalyticStateProvider updateLayoutInformation:](MapsAnalyticStateProvider, "updateLayoutInformation:", self);
}

- (void)containee:(id)a3 willChangeLayout:(unint64_t)a4 source:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id WeakRetained;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[3];

  v8 = a3;
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardPresentationController"));
    v11 = objc_msgSend(v10, "usingSheetPresentation");

    if (v11)
      objc_msgSend(v9, "willChangeLayout:", a4);
    -[ContainerViewController suspendPropagatingEdgeInsetsForReason:](self, "suspendPropagatingEdgeInsetsForReason:", CFSTR("container view will change layout"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerDelegate);
    v13 = objc_opt_respondsToSelector(WeakRetained, "container:containee:willChangeLayout:");

    if ((v13 & 1) != 0)
    {
      v14 = objc_loadWeakRetained((id *)&self->_containerDelegate);
      objc_msgSend(v14, "container:containee:willChangeLayout:", self, v9, a4);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v19[0] = CFSTR("ContainerLayout");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v20[0] = v16;
    v20[1] = v9;
    v19[1] = CFSTR("ContainerContainee");
    v19[2] = CFSTR("ContainerUpdateSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
    v20[2] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 3));
    objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("ContainerWillChangeLayoutNotification"), self, v18);

  }
}

- (void)containee:(id)a3 didChangeLayout:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  char v10;
  id v11;
  void *v12;
  unsigned int v13;
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
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];

  v6 = a3;
  if (v6)
  {
    -[ContainerViewController resumePropagatingEdgeInsets](self, "resumePropagatingEdgeInsets");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewIfLoaded"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));

    if (v8)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_containerDelegate);
      v10 = objc_opt_respondsToSelector(WeakRetained, "container:containee:didChangeLayout:");

      if ((v10 & 1) != 0)
      {
        v11 = objc_loadWeakRetained((id *)&self->_containerDelegate);
        objc_msgSend(v11, "container:containee:didChangeLayout:", self, v6, a4);

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cardPresentationController"));
      v13 = objc_msgSend(v12, "usingSheetPresentation");

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cardPresentationController"));
        objc_msgSend(v6, "didChangeLayout:", objc_msgSend(v14, "containeeLayout"));

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStack containeeStateForContainee:](self->_containerStack, "containeeStateForContainee:", v6));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "viewController"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cardPresentationController"));
        objc_msgSend(v15, "setLayout:forStyle:", objc_msgSend(v17, "containeeLayout"), -[ContainerViewController containerStyle](self, "containerStyle"));

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
      objc_msgSend(v18, "setNeedsUpdateComponent:animated:", CFSTR("lookAroundButton"), 1);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v26[0] = CFSTR("ContainerLayout");
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
      v26[1] = CFSTR("ContainerContainee");
      v27[0] = v20;
      v27[1] = v6;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 2));
      objc_msgSend(v19, "postNotificationName:object:userInfo:", CFSTR("ContainerDidChangeLayoutNotification"), self, v21);

      v24[0] = CFSTR("ContainerLayout");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
      v24[1] = CFSTR("ContainerContainee");
      v25[0] = v22;
      v25[1] = v6;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2));
      +[PPTNotificationCenter postNotificationIfNeededWithName:object:userInfo:](PPTNotificationCenter, "postNotificationIfNeededWithName:object:userInfo:", CFSTR("PPTTestTrayLayoutDidUpdateNotification"), self, v23);

      +[MapsAnalyticStateProvider updateLayoutInformation:](MapsAnalyticStateProvider, "updateLayoutInformation:", self);
    }
  }

}

- (void)willPresentContainee:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[2];

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerDelegate);
    v8 = objc_opt_respondsToSelector(WeakRetained, "container:willPresentContainee:animated:");

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_containerDelegate);
      objc_msgSend(v9, "container:willPresentContainee:animated:", self, v6, v4);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v13[0] = CFSTR("ContainerAnimated");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    v13[1] = CFSTR("ContainerContainee");
    v14[0] = v11;
    v14[1] = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("ContainerWillPresentContaineeNotification"), self, v12);

  }
}

- (void)willResignContainee:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[2];

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerDelegate);
    v8 = objc_opt_respondsToSelector(WeakRetained, "container:willResignContainee:animated:");

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_containerDelegate);
      objc_msgSend(v9, "container:willResignContainee:animated:", self, v6, v4);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v13[0] = CFSTR("ContainerAnimated");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    v13[1] = CFSTR("ContainerContainee");
    v14[0] = v11;
    v14[1] = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("ContainerWillResignContaineeNotification"), self, v12);

  }
}

- (void)didPresentContainee:(id)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerDelegate);
    v8 = objc_opt_respondsToSelector(WeakRetained, "container:didPresentContainee:finished:");

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_containerDelegate);
      objc_msgSend(v9, "container:didPresentContainee:finished:", self, v6, v4);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v17[0] = CFSTR("ContainerFinished");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    v17[1] = CFSTR("ContainerContainee");
    v18[0] = v11;
    v18[1] = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("ContainerDidPresentContaineeNotification"), self, v12);

    v15[0] = CFSTR("ContainerFinished");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    v15[1] = CFSTR("ContainerContainee");
    v16[0] = v13;
    v16[1] = v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));
    +[PPTNotificationCenter postNotificationIfNeededWithName:object:userInfo:](PPTNotificationCenter, "postNotificationIfNeededWithName:object:userInfo:", CFSTR("PPTTestTrayDidPresentNotification"), self, v14);

  }
}

- (void)didResignContainee:(id)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerDelegate);
    v8 = objc_opt_respondsToSelector(WeakRetained, "container:didResignContainee:finished:");

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_containerDelegate);
      objc_msgSend(v9, "container:didResignContainee:finished:", self, v6, v4);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v17[0] = CFSTR("ContainerFinished");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    v17[1] = CFSTR("ContainerContainee");
    v18[0] = v11;
    v18[1] = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("ContainerDidResignContaineeNotification"), self, v12);

    v15[0] = CFSTR("ContainerFinished");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    v15[1] = CFSTR("ContainerContainee");
    v16[0] = v13;
    v16[1] = v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));
    +[PPTNotificationCenter postNotificationIfNeededWithName:object:userInfo:](PPTNotificationCenter, "postNotificationIfNeededWithName:object:userInfo:", CFSTR("PPTTestTrayDidDismissNotification"), self, v14);

  }
}

- (void)_updateOverrideTraitCollectionsForStyle:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  ContainerViewController *v8;
  void *v9;
  id v10;

  v5 = objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v8 = (ContainerViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parentViewController"));

    if (v8 == self)
    {
      if (a3 < 8 && ((0xA3u >> a3) & 1) != 0)
        v10 = 0;
      else
        v10 = (id)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithHorizontalSizeClass:](UITraitCollection, "traitCollectionWithHorizontalSizeClass:", 1));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
      -[ContainerViewController setOverrideTraitCollection:forChildViewController:](self, "setOverrideTraitCollection:forChildViewController:", v10, v9);

    }
  }
}

- (void)containerStyleManagerWillChangeStyle:(unint64_t)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  -[ContainerViewController willChangeStyle:](self, "willChangeStyle:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStack allObjects](self->_containerStack, "allObjects", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "willChangeContainerStyle:", a3);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[ContainerViewController _updateOverrideTraitCollectionsForStyle:](self, "_updateOverrideTraitCollectionsForStyle:", a3);
}

- (void)containerStyleManagerDidChangeStyle:(unint64_t)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id WeakRetained;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];

  -[ContainerTransitionManager styleDidChange](self->_transitionManager, "styleDidChange");
  -[ContainerViewController didChangeStyle:](self, "didChangeStyle:", a3);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStack allObjects](self->_containerStack, "allObjects"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v9), "didChangeContainerStyle:", a3);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController visibleCardViews](self, "visibleCardViews", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v14), "setLayoutStyle:", a3);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  objc_msgSend(WeakRetained, "setVKApplicationUILayout:", -[ContainerViewController VKApplicationUILayoutForStyle:](self, "VKApplicationUILayoutForStyle:", a3));

  -[ContainerTransitionManager dequeueWaitingContainees](self->_transitionManager, "dequeueWaitingContainees");
}

- (int64_t)VKApplicationUILayoutForStyle:(unint64_t)a3
{
  if (a3 > 7)
    return 1;
  else
    return qword_100E34BE0[a3];
}

- (double)topLabelEdgeInset
{
  int BOOL;
  BOOL v4;
  double result;

  BOOL = GEOConfigGetBOOL(MapsConfig_StatusBarBackgroundViewUsesFadingLabels, off_1014B4DA8);
  if (GEOConfigGetBOOL(MapsConfig_StatusBarBackgroundViewUsesVariableBlur, off_1014B4D58))
    v4 = BOOL == 0;
  else
    v4 = 0;
  if (v4)
    return 0.0;
  -[ContainerViewController statusBarHeight](self, "statusBarHeight");
  return result;
}

- (double)edgePadding
{
  void *v3;
  double v4;
  double v5;

  if (!-[ContainerViewController hasMargin](self, "hasMargin"))
    return sub_1005EC29C();
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4 + -21.0;

  return v5;
}

- (double)leadingEdgePadding
{
  double result;

  if (!-[ContainerViewController hasMargin](self, "hasMargin")
    && (id)-[ContainerViewController containerStyle](self, "containerStyle") != (id)6)
  {
    return 8.0;
  }
  -[ContainerViewController edgePadding](self, "edgePadding");
  return result;
}

- (double)topEdgePadding
{
  double v3;
  double v4;

  v3 = sub_1005EC29C();
  -[ContainerViewController statusBarHeight](self, "statusBarHeight");
  return v3 + v4;
}

- (double)bottomEdgePadding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  unint64_t v8;
  double result;
  char v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cardPresentationController"));
  if (objc_msgSend(v4, "usingSheetPresentation"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardPresentationController"));
    v7 = objc_msgSend(v6, "takesAvailableWidth");

  }
  else
  {
    v7 = 0;
  }

  v8 = -[ContainerViewController containerStyle](self, "containerStyle");
  if (v8 <= 7 && ((1 << v8) & 0xA3) != 0 || (sub_1002A8AA0(self) == 5 ? (v10 = 1) : (v10 = v7), (v10 & 1) != 0))
    -[ContainerViewController edgePadding](self, "edgePadding");
  else
    -[ContainerViewController floatingContainerBottomVerticalPadding](self, "floatingContainerBottomVerticalPadding");
  return result;
}

- (unint64_t)maxLayoutForEdgeInsetsUpdate
{
  return 2;
}

- (double)bottomSafeOffset
{
  double v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;

  v3 = 0.0;
  if ((id)-[ContainerViewController containerStyle](self, "containerStyle") != (id)6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));

    if (v5
      || -[ContainerViewController delaysFirstCardPresentation]_0()
      && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController")),
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view")),
          v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window")),
          v8,
          v7,
          v5))
    {
      objc_msgSend(v5, "safeAreaInsets");
      v3 = v6;

    }
  }
  return v3;
}

- (double)bottomEdgeInset
{
  void *v3;
  void *v4;
  unsigned int v5;
  _QWORD *v6;
  unint64_t v7;
  double v8;
  void *v9;
  void *v10;
  unsigned int v11;
  _QWORD v13[5];
  char v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cardPresentationController"));
  v5 = objc_msgSend(v4, "usingSheetPresentation");

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10028656C;
  v13[3] = &unk_1011AEC70;
  v13[4] = self;
  v14 = v5;
  v6 = objc_retainBlock(v13);
  v7 = -[ContainerViewController containerStyle](self, "containerStyle");
  v8 = 0.0;
  if (v7 - 2 < 3)
  {
    if (!v5)
      goto LABEL_8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cardPresentationController"));
    v11 = objc_msgSend(v10, "takesAvailableWidth");

    if (!v11)
      goto LABEL_8;
LABEL_7:
    v8 = ((double (*)(_QWORD *))v6[2])(v6);
    goto LABEL_8;
  }
  if (v7 == 1 || v7 == 5)
    goto LABEL_7;
LABEL_8:

  return v8;
}

- (double)rightSafeOffset
{
  void *v3;
  id v4;
  unsigned int v5;
  double result;
  id v7;
  void *v8;
  double Width;
  CGRect v10;

  if (self->_enableMacPresentationStyles
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view")),
        v4 = objc_msgSend(v3, "effectiveUserInterfaceLayoutDirection"),
        v3,
        v4 == (id)1)
    && !-[SupplementalStackViewController isEmpty](self->_paletteViewController, "isEmpty"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SupplementalStackViewController view](self->_paletteViewController, "view"));
    objc_msgSend(v8, "frame");
    Width = CGRectGetWidth(v10);

    return Width;
  }
  else
  {
    v5 = -[ContainerViewController hasMargin](self, "hasMargin");
    result = 0.0;
    if (v5)
    {
      v7 = -[ContainerViewController interfaceOrientation](self, "interfaceOrientation", 0.0);
      result = 0.0;
      if (v7 == (id)4)
        return 21.0;
    }
  }
  return result;
}

- (double)leftSafeOffset
{
  void *v3;
  id v4;
  unsigned int v5;
  double result;
  id v7;
  void *v8;
  double Width;
  CGRect v10;

  if (!self->_enableMacPresentationStyles
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view")),
        v4 = objc_msgSend(v3, "effectiveUserInterfaceLayoutDirection"),
        v3,
        v4 == (id)1)
    || -[SupplementalStackViewController isEmpty](self->_paletteViewController, "isEmpty"))
  {
    v5 = -[ContainerViewController hasMargin](self, "hasMargin");
    result = 0.0;
    if (v5)
    {
      v7 = -[ContainerViewController interfaceOrientation](self, "interfaceOrientation", 0.0);
      result = 0.0;
      if (v7 == (id)3)
        return 21.0;
    }
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SupplementalStackViewController view](self->_paletteViewController, "view"));
    objc_msgSend(v8, "frame");
    Width = CGRectGetWidth(v10);

    return Width;
  }
  return result;
}

- (void)updateMapEdgeInsets
{
  uint64_t v3;
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
  id WeakRetained;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int Card;
  id v22;

  v3 = objc_claimAutoreleasedReturnValue(-[ContainerViewController viewIfLoaded](self, "viewIfLoaded"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

    if (v6)
    {
      -[ContainerViewController _calculateMapEdgeInsets](self, "_calculateMapEdgeInsets");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
      -[ContainerViewController topLabelEdgeInset](self, "topLabelEdgeInset");
      objc_msgSend(WeakRetained, "setLabelEdgeInsets:");

      v16 = objc_loadWeakRetained((id *)&self->_chromeViewController);
      -[ContainerViewController topLabelEdgeInset](self, "topLabelEdgeInset");
      objc_msgSend(v16, "setLabelEdgeWidths:");

      v17 = objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeContext](self, "chromeContext"));
      if (v17)
      {
        v18 = (void *)v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
        if (!v19 || -[ContainerViewController containeeLayout](self, "containeeLayout"))
        {

LABEL_7:
          v22 = objc_loadWeakRetained((id *)&self->_chromeViewController);
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeContext](self, "chromeContext"));
          objc_msgSend(v22, "setMapEdgeInsets:animated:forContext:", 0, v20, v8, v10, v12, v14);

          return;
        }
        Card = -[ContainerViewController delaysFirstCardPresentation]_0();

        if (Card)
          goto LABEL_7;
      }
    }
  }
}

- (UIEdgeInsets)_calculateMapEdgeInsets
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat top;
  double v18;
  CGFloat bottom;
  double v20;
  double left;
  double v22;
  double right;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  int v29;
  unsigned int v30;
  uint64_t v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  unint64_t v40;
  double MaxX;
  double v42;
  double v43;
  double v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  UIEdgeInsets result;

  v3 = objc_claimAutoreleasedReturnValue(-[ContainerViewController viewIfLoaded](self, "viewIfLoaded"));
  if (!v3)
    goto LABEL_4;
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

  if (!v6)
    goto LABEL_4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[ContainerViewController topEdgeInset](self, "topEdgeInset");
  top = v16;
  -[ContainerViewController bottomEdgeInset](self, "bottomEdgeInset");
  bottom = v18;
  -[ContainerViewController leftSafeOffset](self, "leftSafeOffset");
  left = v20;
  -[ContainerViewController rightSafeOffset](self, "rightSafeOffset");
  if (!self->_chromeHidden)
  {
    right = v22;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
    v29 = objc_msgSend(v28, "effectiveUserInterfaceLayoutDirection") == (id)1;

    v30 = -[ContainerViewController stackOnOppositeSide](self, "stackOnOppositeSide");
    v31 = sub_1002A8AA0(self);
    v32 = -[ContainerViewController isContaineeStackEmpty](self, "isContaineeStackEmpty");
    if ((v32 & 1) == 0 && v31 == 5)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
      if (v33)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
        v32 = (unint64_t)objc_msgSend(v34, "preferredPresentationStyle") > 1;

      }
      else
      {
        v32 = 1;
      }

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "cardPresentationController"));
    if (objc_msgSend(v36, "usingSheetPresentation"))
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "cardPresentationController"));
      v39 = objc_msgSend(v38, "takesAvailableWidth") ^ 1;

    }
    else
    {
      v39 = 1;
    }

    if (!self->_chromeHidden)
    {
      v40 = -[ContainerViewController containerStyle](self, "containerStyle");
      if ((v40 > 7 || ((1 << v40) & 0xA3) == 0) && (v39 & ~v32) == 1)
      {
        if (v29 != v30)
        {
          v45.origin.x = v9;
          v45.origin.y = v11;
          v45.size.width = v13;
          v45.size.height = v15;
          MaxX = CGRectGetMaxX(v45);
          -[UIView frame](self->_containerView, "frame");
          v42 = MaxX - CGRectGetMinX(v46);
          v43 = left;
          v44 = v42;
        }
        else
        {
          -[UIView frame](self->_containerView, "frame");
          v43 = CGRectGetMaxX(v47);
          v42 = right;
          v44 = v43;
        }
        if (fabs(v44) > 2.22044605e-16)
        {
          left = v43;
          right = v42;
        }
      }
    }
  }
  else
  {
LABEL_4:
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
  }
  v24 = top;
  v25 = left;
  v26 = bottom;
  v27 = right;
  result.right = v27;
  result.bottom = v26;
  result.left = v25;
  result.top = v24;
  return result;
}

- (double)floatingContainerBottomVerticalPadding
{
  unint64_t v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;

  v3 = -[ContainerViewController containerStyle](self, "containerStyle");
  if (v3 > 7 || ((1 << v3) & 0xA3) == 0)
  {
    if (sub_1002A8AA0(self))
      v11 = sub_1005EC29C();
    else
      v11 = 3.0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
    objc_msgSend(v12, "safeAreaInsets");
    v8 = v11 + v13;

  }
  else
  {
    -[ContainerViewController edgePadding](self, "edgePadding");
    v6 = v5;
    -[ContainerViewController statusBarHeight](self, "statusBarHeight");
    v8 = v6 + v7;
    -[ContainerViewController bottomSafeOffset](self, "bottomSafeOffset");
    if (v8 <= v9)
    {
      -[ContainerViewController bottomSafeOffset](self, "bottomSafeOffset");
      v8 = v10;
    }
  }
  -[ContainerViewController attributionVerticalPadding](self, "attributionVerticalPadding");
  if (v14 > v8)
  {
    -[ContainerViewController attributionVerticalPadding](self, "attributionVerticalPadding");
    return v8 + v15;
  }
  return v8;
}

- (double)attributionVerticalPadding
{
  id WeakRetained;
  void *v3;
  unsigned int v4;
  double result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mapView"));
  v4 = objc_msgSend(v3, "_isShowingAttributionBadge");

  result = 0.0;
  if (v4)
    return 10.0;
  return result;
}

- (UIEdgeInsets)mapAttributionInsets
{
  void *v3;
  id v4;
  id WeakRetained;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  UIEdgeInsets result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
  v4 = objc_msgSend(v3, "effectiveUserInterfaceLayoutDirection");

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mapView"));
  objc_msgSend(v6, "_attributionInsets");
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mapView"));
  objc_msgSend(v14, "_edgeInsets");
  v16 = v15;
  v18 = v17;
  v20 = v19;

  if ((id)-[ContainerViewController containerStyle](self, "containerStyle") == (id)6)
  {
    if (v4 == (id)1)
    {
      if (v20 >= 0.0)
      {
        -[UIView frame](self->_containerView, "frame");
        v12 = -CGRectGetWidth(v34);
      }
    }
    else if (v16 >= 0.0)
    {
      -[UIView frame](self->_containerView, "frame");
      v10 = -CGRectGetWidth(v35);
    }
  }
  else if (v4 == (id)1)
  {
    v12 = 0.0;
  }
  else
  {
    v10 = 0.0;
  }
  if ((id)-[ContainerViewController containerStyle](self, "containerStyle") == (id)6)
  {
    -[ContainerViewController floatingContainerBottomVerticalPadding](self, "floatingContainerBottomVerticalPadding");
    v22 = v21;
    v23 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "mapView"));
    objc_msgSend(v24, "attributionBadgeBounds");
    v25 = (v22 - CGRectGetHeight(v36)) * 0.5 - _MKAttributionBadgePaddingVertical;

LABEL_14:
    goto LABEL_15;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
  objc_msgSend(v26, "safeAreaInsets");
  v28 = v27;

  v25 = 0.0;
  if (v28 > v18)
  {
    v23 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
    objc_msgSend(v23, "safeAreaInsets");
    v25 = v29 - v18;
    goto LABEL_14;
  }
LABEL_15:
  v30 = v8;
  v31 = v10;
  v32 = v25;
  v33 = v12;
  result.right = v33;
  result.bottom = v32;
  result.left = v31;
  result.top = v30;
  return result;
}

- (StatusBarBackgroundViewStyle)statusBarBackgroundViewStyle
{
  return 0;
}

- (StatusBarSupplementaryView)statusBarSupplementaryView
{
  return 0;
}

- (void)_statusBarHeightChanged
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStack allObjects](self->_containerStack, "allObjects", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "cardPresentationController"));
        objc_msgSend(v8, "updateAdditionalTopMargin");

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[ContainerViewController snapToLayout:](self, "snapToLayout:", -[ContainerViewController containeeLayout](self, "containeeLayout"));
}

- (void)suspendPropagatingEdgeInsetsForReason:(id)a3
{
  IOSBasedChromeViewController **p_chromeViewController;
  id v5;
  id WeakRetained;
  void *v7;
  id mapInsetPropagationSuspensionToken;

  p_chromeViewController = &self->_chromeViewController;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_chromeViewController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "acquireMapInsetPropagationSuspensionTokenForReason:", v5));

  mapInsetPropagationSuspensionToken = self->_mapInsetPropagationSuspensionToken;
  self->_mapInsetPropagationSuspensionToken = v7;

}

- (void)resumePropagatingEdgeInsets
{
  id mapInsetPropagationSuspensionToken;

  mapInsetPropagationSuspensionToken = self->_mapInsetPropagationSuspensionToken;
  self->_mapInsetPropagationSuspensionToken = 0;

}

- (unint64_t)transitionFrom:(id)a3 to:(id)a4
{
  unint64_t v6;
  _BOOL4 v7;
  char *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;

  v6 = -[ContainerStack indexOfContainee:](self->_containerStack, "indexOfContainee:", a4);
  v7 = a4 == 0;
  if (a4)
  {
    v8 = (char *)v6;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStack allObjects](self->_containerStack, "allObjects"));
      v7 = v8 != (char *)objc_msgSend(v9, "count") - 1;

    }
  }
  v10 = -[ContainerViewController containerStyle](self, "containerStyle");
  v11 = 2;
  if (v7)
    v11 = 3;
  if (v10 == 6)
    return v11;
  else
    return v7;
}

- (void)expandContainee:(id)a3
{
  uint64_t v4;
  void *v5;
  unint64_t v6;
  id v7;

  v7 = a3;
  if ((id)-[ContainerViewController containeeLayout](self, "containeeLayout") == (id)1)
  {
    if ((id)-[ContainerViewController containerStyle](self, "containerStyle") == (id)5)
      v4 = 3;
    else
      v4 = 2;
    v5 = v7;
    goto LABEL_8;
  }
  v6 = -[ContainerViewController containeeLayout](self, "containeeLayout");
  v5 = v7;
  if (v6 == 2)
  {
    v4 = 3;
LABEL_8:
    -[ContainerViewController controller:wantsLayout:](self, "controller:wantsLayout:", v5, v4);
    v5 = v7;
  }

}

- (void)minimizeContainee:(id)a3
{
  uint64_t v4;
  void *v5;
  unint64_t v6;
  id v7;

  v7 = a3;
  if ((id)-[ContainerViewController containeeLayout](self, "containeeLayout") == (id)3)
  {
    if ((id)-[ContainerViewController containerStyle](self, "containerStyle") == (id)5)
      v4 = 1;
    else
      v4 = 2;
    v5 = v7;
    goto LABEL_8;
  }
  v6 = -[ContainerViewController containeeLayout](self, "containeeLayout");
  v5 = v7;
  if (v6 == 2)
  {
    v4 = 1;
LABEL_8:
    -[ContainerViewController controller:wantsLayout:](self, "controller:wantsLayout:", v5, v4);
    v5 = v7;
  }

}

- (void)setFullscreenMode:(BOOL)a3
{
  if (self->_fullscreenMode != a3)
  {
    self->_fullscreenMode = a3;
    if (-[ContainerTransitionManager containerReadyToInsert](self->_transitionManager, "containerReadyToInsert"))
      -[ContainerStyleManager updateLayoutStyle](self->_containerStyleManager, "updateLayoutStyle");
  }
}

- (double)availableHeight
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  -[ContainerViewController availableHeightForViewController:](self, "availableHeightForViewController:", v3);
  v5 = v4;

  return v5;
}

- (double)availableHeightForViewController:(id)a3
{
  void *v4;
  double Height;
  void *v6;
  double v7;
  unint64_t v8;
  double v9;
  double v10;
  CGRect v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view", a3));
  objc_msgSend(v4, "frame");
  Height = CGRectGetHeight(v12);

  if (!-[ContainerViewController delaysFirstCardPresentation]_0()
    || (id)-[ContainerViewController containerStyle](self, "containerStyle") != (id)1)
  {
    if (self->_nextHeight != 0.0)
      Height = self->_nextHeight;
    if ((id)-[ContainerViewController containerStyle](self, "containerStyle") != (id)7)
    {
      -[ContainerViewController statusBarHeight](self, "statusBarHeight");
      Height = Height - v7;
    }
    v8 = -[ContainerViewController containerStyle](self, "containerStyle");
    if (v8 - 2 >= 4)
    {
      if (v8 != 6)
        return Height;
      -[ContainerViewController edgePadding](self, "edgePadding");
      Height = Height - v10;
      -[ContainerViewController floatingContainerBottomVerticalPadding](self, "floatingContainerBottomVerticalPadding");
    }
    else
    {
      -[ContainerViewController mapPeek](self, "mapPeek");
    }
    return Height - v9;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
  Height = Height - _UISheetMinimumTopInset();

  return Height;
}

- (void)controller:(id)a3 wantsLayout:(unint64_t)a4
{
  if (self->_currentViewController == a3)
    -[ContainerViewController setLayoutIfSupported:animated:](self, "setLayoutIfSupported:animated:", a4, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
}

- (unint64_t)originalLayoutForViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  v4 = a3;
  v5 = v4;
  if (self->_enableMacPresentationStyles)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cardPresentationController"));
      v9 = (unint64_t)objc_msgSend(v8, "defaultContaineeLayout");

    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardPresentationController"));
      v9 = (unint64_t)objc_msgSend(v7, "defaultContaineeLayout");
    }

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cardPresentationController"));
    v9 = (unint64_t)objc_msgSend(v6, "defaultContaineeLayout");
  }

  if (!v9)
  {
    if (self->_enableMacPresentationStyles
      && ((id)-[ContainerViewController containerStyle](self, "containerStyle") == (id)5
       || (id)-[ContainerViewController containerStyle](self, "containerStyle") == (id)4))
    {
      v9 = 3;
    }
    else
    {
      v9 = 2;
    }
  }

  return v9;
}

- (void)popLastViewControllerWithInitialVelocity:(double)a3
{
  -[ContainerTransitionManager setInitialVelocity:](self->_transitionManager, "setInitialVelocity:", a3);
  -[ContainerViewController popLastViewControllerAnimated:useDefaultContaineeLayout:](self, "popLastViewControllerAnimated:useDefaultContaineeLayout:", 1, 0);
}

- (void)popLastViewControllerAnimated:(BOOL)a3
{
  -[ContainerViewController popLastViewControllerAnimated:useDefaultContaineeLayout:](self, "popLastViewControllerAnimated:useDefaultContaineeLayout:", a3, 0);
}

- (void)popLastViewControllerAnimated:(BOOL)a3 useDefaultContaineeLayout:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v7;

  v4 = a4;
  v5 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  -[ContainerViewController popLastViewControllerFromViewController:animated:useDefaultContaineeLayout:](self, "popLastViewControllerFromViewController:animated:useDefaultContaineeLayout:", v7, v5, v4);

}

- (void)popLastViewControllerFromViewController:(id)a3 animated:(BOOL)a4
{
  -[ContainerViewController popLastViewControllerFromViewController:animated:useDefaultContaineeLayout:](self, "popLastViewControllerFromViewController:animated:useDefaultContaineeLayout:", a3, a4, 0);
}

- (void)popLastViewControllerFromViewController:(id)a3 animated:(BOOL)a4 useDefaultContaineeLayout:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  ContainerViewController *v11;
  ContainerViewController *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  id v20;
  ContainerStack *containerStack;
  void *v22;
  unint64_t v23;
  ContainerStack *v24;
  void *v25;
  id v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  uint8_t buf[4];
  __CFString *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  _BOOL4 v40;
  __int16 v41;
  id v42;
  __int16 v43;
  ContainerStack *v44;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = sub_10043165C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = self;
    v12 = v11;
    if (!v11)
    {
      v18 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v13 = (objc_class *)objc_opt_class(v11);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if ((objc_opt_respondsToSelector(v12, "accessibilityIdentifier") & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController performSelector:](v12, "performSelector:", "accessibilityIdentifier"));
      v17 = v16;
      if (v16 && !objc_msgSend(v16, "isEqualToString:", v15))
      {
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v15, v12, v17));

        goto LABEL_8;
      }

    }
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v15, v12));
LABEL_8:

LABEL_10:
    v19 = v18;
    v20 = objc_msgSend(v8, "preferredPresentationStyle");
    containerStack = v12->_containerStack;

    *(_DWORD *)buf = 138544642;
    v34 = v18;
    v35 = 2112;
    v36 = v8;
    v37 = 1024;
    v38 = v6;
    v39 = 1024;
    v40 = v5;
    v41 = 2048;
    v42 = v20;
    v43 = 2112;
    v44 = containerStack;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] popLastViewControllerFromViewController: %@, animated: %d, useDefaultContaineeLayout: %d, preferredStyle: %lu, containerStack: %@", buf, 0x36u);

  }
  if (self->_enableMacPresentationStyles)
  {
    switch((unint64_t)objc_msgSend(v8, "preferredPresentationStyle"))
    {
      case 0uLL:
      case 2uLL:
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuSystem mainSystem](UIMenuSystem, "mainSystem"));
        objc_msgSend(v22, "setNeedsRebuild");

        goto LABEL_14;
      case 1uLL:
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
        v28 = objc_opt_respondsToSelector(v27, "popSidebarViewController");

        if ((v28 & 1) == 0)
          goto LABEL_31;
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
        objc_msgSend(v25, "popSidebarViewController");
        break;
      case 3uLL:
        -[ContainerViewController _dismissPopoverViewController:animated:](self, "_dismissPopoverViewController:animated:", v8, v6);
        goto LABEL_31;
      case 4uLL:
        -[ContainerViewController _popPalette:completion:](self, "_popPalette:completion:", v6, 0);
        goto LABEL_31;
      case 5uLL:
        -[ContainerViewController _dismissMenuViewController:animated:](self, "_dismissMenuViewController:animated:", v8, v6);
        goto LABEL_31;
      case 6uLL:
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_100287C94;
        v31[3] = &unk_1011AC8B0;
        v31[4] = self;
        v32 = v8;
        -[ContainerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v31);

        goto LABEL_31;
      default:
        goto LABEL_14;
    }
LABEL_24:

    goto LABEL_31;
  }
LABEL_14:
  v23 = -[ContainerStack indexOfContainee:](self->_containerStack, "indexOfContainee:", v8);
  if (v23)
  {
    if (v23 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v24 = self->_containerStack;
      if (!self->_willBeginDisplayingInLockScreen)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStack containeeStateAtIndex:](v24, "containeeStateAtIndex:", v23 - 1));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "viewController"));
        -[ContainerViewController presentController:animated:useDefaultContaineeLayout:](self, "presentController:animated:useDefaultContaineeLayout:", v30, v6, v5);

        goto LABEL_31;
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStack containeeStateAtIndex:](v24, "containeeStateAtIndex:", v23));
      -[ContainerStack removeContaineeState:](v24, "removeContaineeState:", v25);
      goto LABEL_24;
    }
  }
  else if (-[ContainerViewController supportsEmptyStack](self, "supportsEmptyStack"))
  {
    if (self->_willBeginDisplayingInLockScreen)
      v26 = -[ContainerStack popAll](self->_containerStack, "popAll");
    else
      -[ContainerViewController presentController:animated:useDefaultContaineeLayout:](self, "presentController:animated:useDefaultContaineeLayout:", 0, v6, v5);
  }
LABEL_31:

}

- (void)replaceCurrentWithController:(id)a3
{
  -[ContainerViewController replaceCurrentWithController:moveToContaineeLayout:](self, "replaceCurrentWithController:moveToContaineeLayout:", a3, 0);
}

- (void)replaceCurrentWithController:(id)a3 moveToContaineeDefaultLayout:(BOOL)a4
{
  id v5;

  v5 = a3;
  -[ContainerViewController replaceCurrentWithController:moveToContaineeLayout:](self, "replaceCurrentWithController:moveToContaineeLayout:", v5, -[ContainerViewController originalLayoutForViewController:](self, "originalLayoutForViewController:", v5));

}

- (void)replaceCurrentWithController:(id)a3 moveToContaineeLayout:(unint64_t)a4
{
  ContaineeProtocol *v6;
  id v7;
  NSObject *v8;
  ContainerViewController *v9;
  ContainerViewController *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  ContainerStack *containerStack;
  void *v18;
  ContaineeProtocol *v19;
  _QWORD *v20;
  id v21;
  unint64_t v22;
  _QWORD v23[5];
  ContaineeProtocol *v24;
  uint8_t buf[4];
  __CFString *v26;
  __int16 v27;
  ContaineeProtocol *v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  ContainerStack *v32;

  v6 = (ContaineeProtocol *)a3;
  v7 = sub_10043165C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = self;
    v10 = v9;
    if (!v9)
    {
      v16 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v11 = (objc_class *)objc_opt_class(v9);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
      v15 = v14;
      if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
      {
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

        goto LABEL_8;
      }

    }
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_8:

LABEL_10:
    containerStack = v10->_containerStack;
    *(_DWORD *)buf = 138544130;
    v26 = v16;
    v27 = 2112;
    v28 = v6;
    v29 = 2048;
    v30 = a4;
    v31 = 2112;
    v32 = containerStack;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] replaceCurrentWithController: %@, newContaineeLayout: %lu, containerStack: %@", buf, 0x2Au);

  }
  if (!self->_enableMacPresentationStyles
    || -[ContainerViewController containeeLayout](self, "containeeLayout") | a4
    && (-[ContaineeProtocol preferredPresentationStyle](v6, "preferredPresentationStyle") == (id)2
     || !-[ContaineeProtocol preferredPresentationStyle](v6, "preferredPresentationStyle")))
  {
    if (self->_currentViewController == v6)
    {
      -[ContainerTransitionManager dequeueWaitingContainees](self->_transitionManager, "dequeueWaitingContainees");
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStack lastState](self->_containerStack, "lastState"));
      self->_containeeLayout = 0;
      if (-[ContainerStack indexOfContainee:](self->_containerStack, "indexOfContainee:", v6) == 0x7FFFFFFFFFFFFFFFLL)
      {
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100288040;
        v23[3] = &unk_1011AC8B0;
        v23[4] = self;
        v19 = v6;
        v24 = v19;
        v20 = objc_retainBlock(v23);
        if (v18)
          v21 = objc_msgSend(v18, "layoutForStyle:", -[ContainerViewController containerStyle](self, "containerStyle"));
        else
          v21 = 0;
        if (a4)
          v22 = a4;
        else
          v22 = (unint64_t)v21;
        -[ContainerTransitionManager replaceCurrentWithViewController:isAlreadyInStack:layout:animated:postprocess:](self->_transitionManager, "replaceCurrentWithViewController:isAlreadyInStack:layout:animated:postprocess:", v19, 0, v22, 1, v20);

      }
      else
      {
        -[ContainerViewController presentController:](self, "presentController:", v6);
      }

    }
  }
  else
  {
    -[ContainerViewController presentController:animated:useDefaultContaineeLayout:completion:](self, "presentController:animated:useDefaultContaineeLayout:completion:", v6, 1, 1, 0);
  }

}

- (BOOL)controllerIsInStack:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[ContainerTransitionManager hasWaitingTransitionForViewController:](self->_transitionManager, "hasWaitingTransitionForViewController:", v4)|| -[ContainerStack indexOfContainee:](self->_containerStack, "indexOfContainee:", v4) != 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (void)setControllerStack:(id)a3
{
  -[ContainerViewController setControllerStack:animated:completion:](self, "setControllerStack:animated:completion:", a3, 0, 0);
}

- (void)setControllerStack:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, uint64_t);
  id v10;
  NSObject *v11;
  ContainerViewController *v12;
  ContainerViewController *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  ContainerStack **p_containerStack;
  void *v21;
  ContainerStack *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[5];
  id v30;
  ContainerStack *v31;
  void *v32;
  uint64_t v33;
  uint8_t buf[4];
  __CFString *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  _BOOL4 v39;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, uint64_t))a5;
  v10 = sub_10043165C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = self;
    v13 = v12;
    if (!v12)
    {
      v19 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v14 = (objc_class *)objc_opt_class(v12);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if ((objc_opt_respondsToSelector(v13, "accessibilityIdentifier") & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController performSelector:](v13, "performSelector:", "accessibilityIdentifier"));
      v18 = v17;
      if (v17 && !objc_msgSend(v17, "isEqualToString:", v16))
      {
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v16, v13, v18));

        goto LABEL_8;
      }

    }
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v16, v13));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543874;
    v35 = v19;
    v36 = 2112;
    v37 = v8;
    v38 = 1024;
    v39 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@] setControllerStack: %@, animated: %d", buf, 0x1Cu);

  }
  p_containerStack = &self->_containerStack;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStack allObjects](self->_containerStack, "allObjects"));
  if (objc_msgSend(v21, "isEqualToArray:", v8))
  {
    if (v9)
      v9[2](v9, 1);
    goto LABEL_33;
  }
  v22 = objc_alloc_init(ContainerStack);
  if (objc_msgSend(v8, "count"))
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100288514;
    v29[3] = &unk_1011AEC98;
    v29[4] = self;
    v8 = v8;
    v30 = v8;
    v31 = v22;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v29);

    goto LABEL_26;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStack lastState](*p_containerStack, "lastState"));
  if (-[ContainerViewController supportsEmptyStack](self, "supportsEmptyStack"))
    goto LABEL_23;
  if (-[ContainerStack count](*p_containerStack, "count") >= 2)
  {
    v24 = objc_claimAutoreleasedReturnValue(-[ContainerStack containeeStateAtIndex:](*p_containerStack, "containeeStateAtIndex:", 0));
    if (v24)
    {
      v25 = (void *)v24;
      -[ContainerStack pushContaineeState:](v22, "pushContaineeState:", v24);
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));
      v33 = v28;
      v26 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));

      v8 = (id)v28;
LABEL_22:

      v8 = (id)v26;
LABEL_23:
      if (v23)
        -[ContainerStack pushContaineeState:](v22, "pushContaineeState:", v23);
      goto LABEL_25;
    }
  }
  if (v23)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lastObject"));
    v32 = v25;
    v26 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
    goto LABEL_22;
  }
LABEL_25:

LABEL_26:
  objc_storeStrong((id *)&self->_containerStack, v22);
  if (self->_currentPopoverViewController && (objc_msgSend(v8, "containsObject:") & 1) == 0)
    -[ContainerViewController _dismissPopoverViewController:animated:](self, "_dismissPopoverViewController:animated:", self->_currentPopoverViewController, 1);
  if (self->_currentMenuViewController && (objc_msgSend(v8, "containsObject:") & 1) == 0)
    -[ContainerViewController _dismissMenuViewController:animated:](self, "_dismissMenuViewController:animated:", self->_currentMenuViewController, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
  -[ContainerViewController presentController:animated:useDefaultContaineeLayout:completion:](self, "presentController:animated:useDefaultContaineeLayout:completion:", v27, v6, 1, v9);

LABEL_33:
}

- (void)presentController:(id)a3
{
  -[ContainerViewController presentController:animated:useDefaultContaineeLayout:](self, "presentController:animated:useDefaultContaineeLayout:", a3, 1, 0);
}

- (void)presentController:(id)a3 animated:(BOOL)a4
{
  -[ContainerViewController presentController:animated:useDefaultContaineeLayout:](self, "presentController:animated:useDefaultContaineeLayout:", a3, a4, 0);
}

- (void)presentController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[ContainerViewController presentController:animated:useDefaultContaineeLayout:completion:](self, "presentController:animated:useDefaultContaineeLayout:completion:", a3, a4, 0, a5);
}

- (void)presentController:(id)a3 animated:(BOOL)a4 useDefaultContaineeLayout:(BOOL)a5
{
  -[ContainerViewController presentController:animated:useDefaultContaineeLayout:completion:](self, "presentController:animated:useDefaultContaineeLayout:completion:", a3, a4, a5, 0);
}

- (void)presentController:(id)a3 animated:(BOOL)a4 useDefaultContaineeLayout:(BOOL)a5 completion:(id)a6
{
  int v7;
  _BOOL8 v8;
  ContaineeProtocol *v10;
  void (**v11)(id, uint64_t);
  id v12;
  NSObject *v13;
  _BOOL8 v14;
  ContainerViewController *v15;
  ContainerViewController *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  id v24;
  ContainerStack *containerStack;
  void *v26;
  void *v27;
  unsigned int v28;
  unint64_t v29;
  ContaineeState *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  unsigned int v35;
  unint64_t v36;
  void *v37;
  unsigned int v38;
  ContaineeProtocol *v39;
  ContaineeState *v40;
  _QWORD *v41;
  ContaineeProtocol *v42;
  _QWORD *v43;
  void *v44;
  char v45;
  void *v46;
  _BOOL4 v47;
  void (**v48)(id, uint64_t);
  _QWORD v49[4];
  ContaineeProtocol *v50;
  ContainerViewController *v51;
  char v52;
  _QWORD v53[5];
  ContaineeProtocol *v54;
  ContaineeState *v55;
  char v56;
  _QWORD v57[5];
  ContaineeProtocol *v58;
  void (**v59)(id, uint64_t);
  uint8_t buf[4];
  __CFString *v61;
  __int16 v62;
  ContaineeProtocol *v63;
  __int16 v64;
  _BOOL4 v65;
  __int16 v66;
  int v67;
  __int16 v68;
  id v69;
  __int16 v70;
  ContainerStack *v71;

  v7 = a5;
  v8 = a4;
  v10 = (ContaineeProtocol *)a3;
  v11 = (void (**)(id, uint64_t))a6;
  v12 = sub_10043165C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v48 = v11;
    v14 = v8;
    v15 = self;
    v16 = v15;
    if (!v15)
    {
      v22 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v17 = (objc_class *)objc_opt_class(v15);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if ((objc_opt_respondsToSelector(v16, "accessibilityIdentifier") & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController performSelector:](v16, "performSelector:", "accessibilityIdentifier"));
      v21 = v20;
      if (v20 && !objc_msgSend(v20, "isEqualToString:", v19))
      {
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v19, v16, v21));

        goto LABEL_8;
      }

    }
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v19, v16));
LABEL_8:

LABEL_10:
    v23 = v22;
    v24 = -[ContaineeProtocol preferredPresentationStyle](v10, "preferredPresentationStyle");
    containerStack = v16->_containerStack;

    *(_DWORD *)buf = 138544642;
    v61 = v22;
    v62 = 2112;
    v63 = v10;
    v64 = 1024;
    v8 = v14;
    v65 = v14;
    v66 = 1024;
    v67 = v7;
    v68 = 2048;
    v69 = v24;
    v70 = 2112;
    v71 = containerStack;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}@] presentController: %@, animated: %d, useDefaultContaineeLayout: %d, preferredStyle: %lu, containerStack: %@", buf, 0x36u);

    v11 = v48;
  }

  if (!self->_enableMacPresentationStyles)
  {
LABEL_14:
    if (self->_currentViewController == v10)
    {
      if (v11)
        v11[2](v11, 1);
      -[ContainerTransitionManager dequeueWaitingContainees](self->_transitionManager, "dequeueWaitingContainees");
      goto LABEL_33;
    }
    if (qword_1014D1EC8 != -1)
      dispatch_once(&qword_1014D1EC8, &stru_1011AECE0);
    if (byte_1014A38D0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeProtocol cardPresentationController](v10, "cardPresentationController"));
      v28 = objc_msgSend(v27, "alwaysUseDefaultContaineeLayout");

      v7 |= v28;
    }
    self->_containeeLayout = 0;
    v47 = v8;
    if (v10)
    {
      v29 = -[ContainerStack indexOfContainee:](self->_containerStack, "indexOfContainee:", v10);
      if (v29 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v30 = -[ContaineeState initWithContainee:]([ContaineeState alloc], "initWithContainee:", v10);
        v31 = 0;
        v32 = 0;
        goto LABEL_27;
      }
    }
    else
    {
      v29 = 0;
    }
    v30 = (ContaineeState *)objc_claimAutoreleasedReturnValue(-[ContainerStack containeeStateAtIndex:](self->_containerStack, "containeeStateAtIndex:", v29));
    v32 = -[ContaineeState layoutForStyle:](v30, "layoutForStyle:", -[ContainerViewController containerStyle](self, "containerStyle"));
    v31 = 1;
LABEL_27:
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "cardPresentationController"));
    v35 = objc_msgSend(v34, "presentedModally") ^ 1;

    if ((v7 & v35 & 1) != 0 || !v32)
    {
      v36 = -[ContainerViewController originalLayoutForViewController:](self, "originalLayoutForViewController:", v10);
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeProtocol cardPresentationController](v10, "cardPresentationController"));
      v38 = objc_msgSend(v37, "presentedModally");

      if (v38)
        v32 = 5;
      else
        v32 = v36;
    }
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100288CB8;
    v53[3] = &unk_1011AED08;
    v53[4] = self;
    v39 = v10;
    v56 = v31;
    v54 = v39;
    v55 = v30;
    v40 = v30;
    v41 = objc_retainBlock(v53);
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100288D38;
    v49[3] = &unk_1011AC838;
    v52 = v31;
    v42 = v39;
    v50 = v42;
    v51 = self;
    v43 = objc_retainBlock(v49);
    -[ContainerTransitionManager presentViewController:isAlreadyInStack:layout:animated:preprocess:postprocess:completion:](self->_transitionManager, "presentViewController:isAlreadyInStack:layout:animated:preprocess:postprocess:completion:", v42, v31, v32, v47, v41, v43, v11);

    goto LABEL_33;
  }
  switch((unint64_t)-[ContaineeProtocol preferredPresentationStyle](v10, "preferredPresentationStyle"))
  {
    case 0uLL:
    case 2uLL:
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuSystem mainSystem](UIMenuSystem, "mainSystem"));
      objc_msgSend(v26, "setNeedsRebuild");

      -[ContainerViewController _popCurrentPopoverViewControllerAnimated:](self, "_popCurrentPopoverViewControllerAnimated:", 1);
      goto LABEL_14;
    case 1uLL:
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
      v45 = objc_opt_respondsToSelector(v44, "pushSidebarViewController:");

      if ((v45 & 1) != 0)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
        objc_msgSend(v46, "pushSidebarViewController:", v10);

      }
      break;
    case 3uLL:
      -[ContainerViewController _presentPopoverViewController:animated:completion:](self, "_presentPopoverViewController:animated:completion:", v10, v8, v11);
      break;
    case 4uLL:
      -[ContainerViewController _pushPalette:animated:completion:](self, "_pushPalette:animated:completion:", v10, v8, v11);
      break;
    case 5uLL:
      -[ContainerViewController _presentMenuViewController:animated:completion:](self, "_presentMenuViewController:animated:completion:", v10, v8, v11);
      break;
    case 6uLL:
      -[ContainerViewController _popCurrentPopoverViewControllerAnimated:](self, "_popCurrentPopoverViewControllerAnimated:", 1);
      -[ContaineeProtocol setModalPresentationStyle:](v10, "setModalPresentationStyle:", 2);
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_100288C40;
      v57[3] = &unk_1011AECC0;
      v57[4] = self;
      v58 = v10;
      v59 = v11;
      -[ContainerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v58, 1, v57);

      break;
    default:
      goto LABEL_14;
  }
LABEL_33:

}

- (void)removeControllerFromStack:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  ContainerViewController *v7;
  ContainerViewController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  ContainerStack *containerStack;
  unint64_t v16;
  void *v17;
  uint8_t buf[4];
  __CFString *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  ContainerStack *v23;

  v4 = a3;
  v5 = sub_10043165C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    containerStack = v8->_containerStack;
    *(_DWORD *)buf = 138543874;
    v19 = v14;
    v20 = 2112;
    v21 = v4;
    v22 = 2112;
    v23 = containerStack;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] removeControllerFromStack: %@, containerStack: %@", buf, 0x20u);

  }
  v16 = -[ContainerStack indexOfContainee:](self->_containerStack, "indexOfContainee:", v4);
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStack containeeStateAtIndex:](self->_containerStack, "containeeStateAtIndex:", v16));
    if (v17)
      -[ContainerStack removeContaineeState:](self->_containerStack, "removeContaineeState:", v17);

  }
}

- (CardAnimation)cardHeightAnimation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController animationManager](self, "animationManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "cardHeightAnimation"));

  return (CardAnimation *)v3;
}

- (BOOL)_chromeEnabled
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v3 = objc_msgSend(v2, "_internal_isChromeDisabled") ^ 1;

  return v3;
}

- (BOOL)shouldPassPoint:(CGPoint)a3 withEvent:(id)a4 inView:(id)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  double v11;
  _BOOL4 v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGPoint v26;
  CGRect v27;

  y = a3.y;
  x = a3.x;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));

  objc_msgSend(v10, "alpha");
  if (v11 == 0.0)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
    objc_msgSend(v13, "convertPoint:fromView:", v8, x, y);
    v15 = v14;
    v17 = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController containerView](self, "containerView"));
    objc_msgSend(v18, "frame");
    v20 = v19;
    v22 = v21;
    v24 = v23;

    v27.origin.y = v22 + -20.0;
    v27.size.height = 20.0;
    v27.origin.x = v20;
    v27.size.width = v24;
    v26.x = v15;
    v26.y = v17;
    v12 = !CGRectContainsPoint(v27, v26);
  }

  return v12;
}

- (UIView)passThroughView
{
  return 0;
}

- (void)_updateVisibleContentForLayout:(unint64_t)a3
{
  void *v4;
  double v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v6 = v4;
  v5 = 1.0;
  if (a3 == 1)
    v5 = 0.0;
  objc_msgSend(v4, "applyAlphaToContent:", v5);

}

- (void)setChromeHidden:(BOOL)a3
{
  if (self->_chromeHidden != a3)
    self->_chromeHidden = a3;
}

- (BOOL)hasMargin
{
  void *v2;
  double v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
  objc_msgSend(v2, "safeAreaInsets");
  v4 = v3 > 0.0;

  return v4;
}

- (double)statusBarHeight
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  objc_msgSend(v2, "statusBarHeight");
  v4 = v3;

  return v4;
}

- (double)mapPeek
{
  double result;
  void *v4;
  double v5;
  double v6;

  if ((id)-[ContainerViewController containerStyle](self, "containerStyle") == (id)5)
    return 32.0;
  if ((id)-[ContainerViewController containerStyle](self, "containerStyle") == (id)3
    || (id)-[ContainerViewController containerStyle](self, "containerStyle") == (id)4)
  {
    -[ContainerViewController edgePadding](self, "edgePadding");
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
    objc_msgSend(v4, "safeAreaInsets");
    v6 = v5;

    result = 24.0;
    if (v6 != 0.0)
      return 12.0;
  }
  return result;
}

- (BOOL)_canUpdateContainee:(id)a3 withLayout:(unint64_t)a4
{
  double v4;

  objc_msgSend(a3, "heightForLayout:", a4);
  return v4 != -1.0;
}

- (BOOL)_updateContaineeIfNeeded:(id)a3 withLayout:(unint64_t)a4
{
  id v5;
  double v6;
  double v7;
  void *v8;

  v5 = a3;
  objc_msgSend(v5, "heightForLayout:", a4);
  v7 = v6;
  if (v6 != -1.0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardPresentationController"));
    objc_msgSend(v8, "updateHeightConstraintWithValue:", v7);

  }
  return v7 != -1.0;
}

- (void)updateLayoutAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];

  if (self->_currentViewController)
  {
    v3 = a3;
    if ((-[ContainerViewController delaysFirstCardPresentation]_0() & 1) == 0)
    {
      if (v3)
      {
        self->_shouldEndTransitionWhenAnimationCompletes = 1;
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
        objc_msgSend(v5, "updateConstraintsIfNeeded");

        v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController animationManager](self, "animationManager"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cardHeightAnimation"));
        v12[4] = self;
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10028969C;
        v13[3] = &unk_1011AC860;
        v13[4] = self;
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_100289720;
        v12[3] = &unk_1011AE8F8;
        objc_msgSend(v7, "applyWithAnimations:completion:", v13, v12);

      }
      else
      {
        -[ContainerViewController _updateVisibleContentForLayout:](self, "_updateVisibleContentForLayout:", self->_containeeLayout);
        if (self->_transitioning)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
          objc_msgSend(v8, "layoutIfNeeded");

        }
        -[ContainerViewController containee:didChangeLayout:](self, "containee:didChangeLayout:", self->_currentViewController, self->_containeeLayout);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
        objc_msgSend(v9, "didChangeLayout:", self->_containeeLayout);

        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
        objc_msgSend(v10, "heightForLayout:", self->_containeeLayout);
        -[ContainerViewController contentHeightUpdatedWithValue:](self, "contentHeightUpdatedWithValue:");

        -[ContainerViewController updateContaineeStackState](self, "updateContaineeStackState");
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController iosBasedChromeViewController](self, "iosBasedChromeViewController"));
      objc_msgSend(v11, "setNeedsUpdateComponent:animated:", CFSTR("statusBarStyle"), v3);

    }
  }
}

- (void)setLayoutIfSupported:(unint64_t)a3 animated:(BOOL)a4
{
  -[ContainerViewController setLayoutIfSupported:animated:source:](self, "setLayoutIfSupported:animated:source:", a3, a4, 0);
}

- (void)setLayoutIfSupported:(unint64_t)a3 animated:(BOOL)a4 source:(unint64_t)a5
{
  _BOOL8 v6;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v6 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cardPresentationController"));
    v12 = objc_msgSend(v11, "usingSheetPresentation");

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cardPresentationController"));
      v15 = objc_msgSend(v14, "containeeLayout");

      if (v15 != (id)a3)
      {
        v19 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "cardPresentationController"));
        objc_msgSend(v17, "wantsLayout:", a3);

        return;
      }
      self->_incompleteCompletion = 1;
    }
    else
    {
      v16 = -[ContainerViewController overriddenLayoutForCurrentController:](self, "overriddenLayoutForCurrentController:", a3);
      if ((void *)-[ContainerViewController containeeLayout](self, "containeeLayout") == v16)
      {
        -[ContainerViewController snapToLayout:](self, "snapToLayout:", v16);
        return;
      }
      if (-[ContainerViewController _canUpdateContainee:withLayout:](self, "_canUpdateContainee:withLayout:", self->_currentViewController, v16))
      {
        -[ContainerViewController containee:willChangeLayout:source:](self, "containee:willChangeLayout:source:", self->_currentViewController, v16, a5);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
        objc_msgSend(v18, "willChangeLayout:", v16);

        self->_containeeLayout = (unint64_t)v16;
        -[ContainerViewController _updateContaineeIfNeeded:withLayout:](self, "_updateContaineeIfNeeded:withLayout:", self->_currentViewController, v16);
        -[ContainerViewController updateLayoutAnimated:](self, "updateLayoutAnimated:", v6);
        return;
      }
    }
    -[ContainerViewController _completeStateIfNeeded](self, "_completeStateIfNeeded");
  }
}

- (void)_completeStateIfNeeded
{
  void *v3;

  if (self->_incompleteCompletion)
  {
    self->_incompleteCompletion = 0;
    -[ContainerViewController containee:didChangeLayout:](self, "containee:didChangeLayout:", self->_currentViewController, self->_containeeLayout);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    objc_msgSend(v3, "didChangeLayout:", self->_containeeLayout);

    -[ContainerViewController transitionEnded](self, "transitionEnded");
  }
}

- (void)animateAlongsideCardTransition
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cardPresentationController"));
  objc_msgSend(v3, "cardHeight");
  -[ContainerViewController _notifyResizingObserversWithValue:onlyIfDragging:](self, "_notifyResizingObserversWithValue:onlyIfDragging:", 0);

}

- (void)transitionEnded
{
  id v2;

  self->_transitioning = 0;
  v2 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  objc_msgSend(v2, "setNeedsUserActivityUpdate");

}

- (void)snapToLayout:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[7];

  if ((-[ContainerViewController delaysFirstCardPresentation]_0() & 1) == 0)
  {
    self->_shouldEndTransitionWhenAnimationCompletes = 1;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    objc_msgSend(v5, "heightForLayout:", a3);
    v7 = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardPresentationController"));
    v10 = objc_msgSend(v9, "updateHeightConstraintWithValue:", v7);

    if (v10)
    {
      if ((id)-[ContainerViewController layoutModalPresenter](self, "layoutModalPresenter") == (id)3)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cardPresentationController"));
        v13 = objc_msgSend(v12, "presentedModally");

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController modalPresenter](self, "modalPresenter"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cardPresentationController"));
          objc_msgSend(v15, "updateHeightConstraintWithValue:", v7);

        }
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
      objc_msgSend(v16, "updateConstraintsIfNeeded");

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController animationManager](self, "animationManager"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "cardHeightAnimation"));
      v21[4] = self;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100289CF8;
      v22[3] = &unk_1011AED30;
      v22[4] = self;
      *(double *)&v22[5] = v7;
      v22[6] = a3;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100289D40;
      v21[3] = &unk_1011AE8F8;
      objc_msgSend(v18, "applyWithAnimations:completion:", v22, v21);

    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "cardPresentationController"));
      objc_msgSend(v20, "cardHeight");

      -[ContainerViewController _completeStateIfNeeded](self, "_completeStateIfNeeded");
    }
  }
}

- (void)registerResizingObserver:(id)a3 withBlock:(id)a4
{
  id v6;
  NSMapTable *resizingBlocksByObserver;
  id v8;
  NSMapTable *v9;
  NSMapTable *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11)
  {
    resizingBlocksByObserver = self->_resizingBlocksByObserver;
    if (resizingBlocksByObserver)
    {
      if (v6)
      {
LABEL_4:
        v8 = objc_msgSend(v6, "copy");
        -[NSMapTable setObject:forKey:](resizingBlocksByObserver, "setObject:forKey:", v8, v11);

        goto LABEL_7;
      }
    }
    else
    {
      v9 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
      v10 = self->_resizingBlocksByObserver;
      self->_resizingBlocksByObserver = v9;

      resizingBlocksByObserver = self->_resizingBlocksByObserver;
      if (v6)
        goto LABEL_4;
    }
    -[NSMapTable removeObjectForKey:](resizingBlocksByObserver, "removeObjectForKey:", v11);
  }
LABEL_7:

}

- (void)contentHeightUpdatedWithValue:(double)a3
{
  void *v5;
  void *v6;
  double v7;

  if (self->_transitioning)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardPresentationController"));
    objc_msgSend(v6, "cardHeight");
    a3 = v7;

  }
  -[ContainerViewController _notifyResizingObserversWithValue:onlyIfDragging:](self, "_notifyResizingObserversWithValue:onlyIfDragging:", 1, a3);
}

- (void)_notifyResizingObserversWithValue:(double)a3 onlyIfDragging:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;

  v4 = a4;
  if (-[NSMapTable count](self->_resizingBlocksByObserver, "count"))
  {
    v7 = -[ContainerViewController containerStyle](self, "containerStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardPresentationController"));
    v10 = objc_msgSend(v9, "usingSheetPresentation");

    if (!v10)
    {
LABEL_9:
      -[ContainerViewController _notifyObserversWithContainerStyle:value:](self, "_notifyObserversWithContainerStyle:value:", v7, a3);
      return;
    }
    if (!v4 || self->_transitioning)
    {
LABEL_8:
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cardPresentationController"));
      v7 = objc_msgSend(v17, "containerStyle");

      goto LABEL_9;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sheetPresentationController"));
    if (objc_msgSend(v12, "_isDragging"))
    {

      goto LABEL_8;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sheetPresentationController"));
    v15 = objc_msgSend(v14, "_isGeneratingAnimations");

    if ((v15 & 1) != 0)
      goto LABEL_8;
    if ((sub_100609AB8() & 1) != 0)
      goto LABEL_9;
  }
}

- (void)_notifyObserversWithContainerStyle:(unint64_t)a3 value:(double)a4
{
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  ContainerViewController *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  if ((a3 | 4) != 5)
  {
    v21 = 0.0;
LABEL_20:
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_resizingBlocksByObserver, "objectEnumerator", 0));
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v27)
            objc_enumerationMutation(v24);
          (*(void (**)(double, double))(*(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i) + 16))(a4, v21);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v26);
    }

    return;
  }
  if (a3 == 5)
    v6 = 1;
  else
    v6 = 2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  objc_msgSend(v7, "heightForLayout:", v6);
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  objc_msgSend(v10, "heightForLayout:", 3);
  v12 = v11;

  v13 = self;
  v14 = vabdd_f64(v12, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController traitCollection](v13, "traitCollection"));
  objc_msgSend(v15, "displayScale");
  v16 = 1.0;
  if (v17 >= 1.0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController traitCollection](v13, "traitCollection"));
    objc_msgSend(v18, "displayScale");
    v16 = v19;

  }
  v20 = 1.0 / v16;

  v21 = 0.0;
  if (v14 > v20 && v9 < a4)
  {
    v23 = (a4 - v9) / (v9 * 1.10000002 - v9);
    if (v23 < 0.0)
      v23 = 0.0;
    if (v23 <= 1.0)
      v21 = v23;
    else
      v21 = 1.0;
  }
  if (v14 > v20)
    goto LABEL_20;
}

- (void)updateHeightConstraintWithValue:(double)a3
{
  void *v5;
  unsigned int v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeProtocol cardPresentationController](self->_currentViewController, "cardPresentationController"));
  v6 = objc_msgSend(v5, "updateHeightConstraintWithValue:", a3);

  if (v6)
  {
    self->_shouldEndTransitionWhenAnimationCompletes = 0;
    -[ContainerViewController contentHeightUpdatedWithValue:](self, "contentHeightUpdatedWithValue:", a3);
  }
}

- (unint64_t)overriddenLayoutForCurrentController:(unint64_t)a3
{
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  unint64_t v11;
  unint64_t v12;

  if ((id)-[ContainerViewController containerStyle](self, "containerStyle") == (id)3)
    return 4;
  if ((id)-[ContainerViewController containerStyle](self, "containerStyle") != (id)6
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardPresentationController")),
        v7 = objc_msgSend(v6, "allowResizeInFloatingStyle"),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    if ((id)-[ContainerViewController containerStyle](self, "containerStyle") != (id)6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardPresentationController"));
      v10 = objc_msgSend(v9, "presentedModally");

      if ((v10 & 1) != 0)
        return 5;
    }
    if (!-[ContainerViewController allowOnlyStandardStyle](self, "allowOnlyStandardStyle") && a3 != 5)
    {
      v11 = -[ContainerViewController containerStyle](self, "containerStyle");
      if (v11 <= 7)
      {
        if (((1 << v11) & 0xC8) != 0)
          return 4;
        if (((1 << v11) & 6) != 0)
        {
          if (a3 == 4)
            return 3;
        }
        else
        {
          v12 = 4;
          if (a3 - 1 < 2)
            v12 = 1;
          if (((1 << v11) & 0x30) != 0)
            return v12;
        }
      }
    }
  }
  return a3;
}

- (int)currentUITargetForAnalytics
{
  void *v3;
  unsigned int v4;
  void *v5;
  int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___GEOLogContextDelegate);

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  if ((objc_opt_respondsToSelector(v5, "currentUITargetForAnalytics") & 1) != 0)
    v6 = objc_msgSend(v5, "currentUITargetForAnalytics");
  else
    v6 = 0;

  return v6;
}

- (int)currentMapViewTargetForAnalytics
{
  void *v3;
  unsigned int v4;
  void *v5;
  int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___GEOLogContextDelegate);

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  if ((objc_opt_respondsToSelector(v5, "currentMapViewTargetForAnalytics") & 1) != 0)
    v6 = objc_msgSend(v5, "currentMapViewTargetForAnalytics");
  else
    v6 = 0;

  return v6;
}

- (BOOL)cardDismissalHelperShouldObserveGestures:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  BOOL result;

  v4 = objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController", a3));
  result = (!v4
         || (v5 = (void *)v4,
             v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController")),
             v7 = objc_msgSend(v6, "shouldCollapseOnMapGesture"),
             v6,
             v5,
             v7))
        && (id)-[ContainerViewController containeeLayout](self, "containeeLayout") != (id)1
        && (id)-[ContainerViewController containerStyle](self, "containerStyle") == (id)1;
  return result;
}

- (double)dismissalRectTopEdgeForCardDismissalHelper:(id)a3 coordinateSpace:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double MinY;
  CGRect v18;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));

  objc_msgSend(v7, "bounds");
  objc_msgSend(v7, "convertRect:toCoordinateSpace:", v5);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v18.origin.x = v9;
  v18.origin.y = v11;
  v18.size.width = v13;
  v18.size.height = v15;
  MinY = CGRectGetMinY(v18);

  return MinY;
}

- (void)requestDismissalWithCardDismissalHelper:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cardPresentationController"));
  objc_msgSend(v3, "wantsLayout:", 1);

}

- (void)sheetPresentationControllerDidChangeSelectedDetentIdentifier:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v24 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
  objc_msgSend(v4, "setNeedsLayout");

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "presentedViewController"));
  v6 = objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___ContaineeProtocol);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
    objc_msgSend(v8, "endEditing:", 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "presentedViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cardPresentationController"));
    -[ContainerViewController containee:willChangeLayout:source:](self, "containee:willChangeLayout:source:", v9, objc_msgSend(v10, "containeeLayout"), 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "selectedDetentIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "detents"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10028A92C;
    v25[3] = &unk_1011AED58;
    v26 = v11;
    v13 = v11;
    v14 = objc_msgSend(v12, "indexOfObjectPassingTest:", v25);

    if (v14 == (id)0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_6;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "_detentValues"));
    v16 = objc_msgSend(v15, "count");

    if (v14 >= v16
      || (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "_detentValues")),
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v14)),
          objc_msgSend(v18, "cgFloatValue"),
          v20 = v19,
          v18,
          v17,
          v20 < 0.0)
      || v20 == UISheetPresentationControllerDetentInactive)
    {
LABEL_6:
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cardPresentationController"));
      objc_msgSend(v21, "cardHeight");
      v20 = v22;

    }
    -[ContainerViewController _notifyResizingObserversWithValue:onlyIfDragging:](self, "_notifyResizingObserversWithValue:onlyIfDragging:", 0, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cardPresentationController"));
    -[ContainerViewController containee:didChangeLayout:](self, "containee:didChangeLayout:", v9, objc_msgSend(v23, "containeeLayout"));

  }
}

- (void)_sheetPresentationControllerDidInvalidateCurrentPresentedViewFrame:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
  objc_msgSend(v4, "setNeedsLayout");

  if ((GEOConfigGetBOOL(MapsConfig_ChromeContainerVCSlowDownMapEdgeInsetsUpdateCalls, off_1014B53F8) & 1) == 0
    && ((objc_msgSend(v5, "_isDragging") & 1) != 0
     || objc_msgSend(v5, "_isGeneratingAnimations")))
  {
    -[ContainerViewController updateMapEdgeInsets](self, "updateMapEdgeInsets");
  }

}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cardPresentationController"));
  if (objc_msgSend(v5, "usingSheetPresentation"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cardPresentationController"));
    v8 = objc_msgSend(v7, "allowsSwipeToDismiss");

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  unsigned __int8 v24;
  _QWORD v25[4];
  id v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));
  v6 = objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___ContaineeProtocol);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));
    v8 = -[ContainerStack indexOfContainee:](self->_containerStack, "indexOfContainee:", v7);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_13:

      goto LABEL_14;
    }
    v9 = v8;
    objc_msgSend(v7, "willDismissByGesture");
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStack containeeStateAtIndex:](self->_containerStack, "containeeStateAtIndex:", v9 - 1));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "viewController"));

    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v11, "willBecomeCurrentByGesture");
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "presentedViewController"));
    if (v12)
    {
      v13 = (id)v12;
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "presentedViewController"));
      if ((void *)v14 == v7)
      {

        goto LABEL_11;
      }
      v15 = (void *)v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "presentedViewController"));
      v17 = objc_msgSend(v16, "conformsToProtocol:", &OBJC_PROTOCOL___ContaineeProtocol);

      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "presentedViewController"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "cardPresentationController"));
        v20 = objc_msgSend(v19, "hidden");

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transitionCoordinator"));
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_10028AC9C;
        v25[3] = &unk_1011AEDC8;
        v26 = v18;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_10028ACD0;
        v22[3] = &unk_1011AEBA0;
        v23 = v26;
        v24 = v20;
        v13 = v26;
        objc_msgSend(v21, "animateAlongsideTransition:completion:", v25, v22);

LABEL_11:
      }
    }

    goto LABEL_13;
  }
LABEL_14:

}

- (void)presentationControllerDidDismiss:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  ContainerStack *containerStack;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "presentedViewController"));
  v5 = objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___ContaineeProtocol);

  v6 = v15;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "presentedViewController"));
    v8 = -[ContainerStack indexOfContainee:](self->_containerStack, "indexOfContainee:", v7);
    v9 = v8;
    if (v8)
    {
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_7:

        v6 = v15;
        goto LABEL_8;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStack containeeStateAtIndex:](self->_containerStack, "containeeStateAtIndex:", v8 - 1));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "viewController"));

    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v7, "didDismissByGesture");
    -[ContainerTransitionManager didPerformUnmanagedDismissOfViewController:revealingViewController:](self->_transitionManager, "didPerformUnmanagedDismissOfViewController:revealingViewController:", v7, v11);
    containerStack = self->_containerStack;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStack containeeStateAtIndex:](containerStack, "containeeStateAtIndex:", v9));
    -[ContainerStack removeContaineeState:](containerStack, "removeContaineeState:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cardPresentationController"));
    objc_msgSend(v14, "cardHeight");
    -[ContainerViewController _notifyResizingObserversWithValue:onlyIfDragging:](self, "_notifyResizingObserversWithValue:onlyIfDragging:", 0);

    goto LABEL_7;
  }
LABEL_8:

}

- (id)internalStackLessWaitingForPresentation
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  ContainerViewController *v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStack allObjects](self->_containerStack, "allObjects", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentingViewController"));
        if (v10 && !objc_msgSend(v9, "isBeingDismissed"))
        {

LABEL_11:
          objc_msgSend(v3, "addObject:", v9);
          continue;
        }
        v11 = -[ContainerTransitionManager hasWaitingTransitionForViewController:](self->_transitionManager, "hasWaitingTransitionForViewController:", v9);

        if ((v11 & 1) == 0)
          goto LABEL_11;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v6);
  }

  v12 = sub_10043165C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v20 = self;
    v21 = 2112;
    v22 = v3;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%@ containerStackLessControllersWaitingForPresentation %@", buf, 0x16u);
  }

  return v3;
}

- (id)uikitPresentationStack
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  int v10;
  ContainerViewController *v11;
  __int16 v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));

  if (v5)
  {
    do
    {
      objc_msgSend(v3, "addObject:", v5);
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));

      v5 = (void *)v6;
    }
    while (v6);
  }
  v7 = sub_10043165C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@ UIKitPresentationStack %@", (uint8_t *)&v10, 0x16u);
  }

  return v3;
}

- (BOOL)presentationStackAppearsCorrectWithInternalStack:(id)a3 uikitStack:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  BOOL v17;
  id v18;
  NSObject *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  ContainerViewController *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  id v31;

  v6 = a3;
  v7 = a4;
  v8 = sub_10043165C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v27 = self;
    v28 = 2080;
    v29 = "-[ContainerViewController presentationStackAppearsCorrectWithInternalStack:uikitStack:]";
    v30 = 2112;
    v31 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@ %s %@", buf, 0x20u);
  }

  v10 = objc_msgSend(v6, "count");
  if (v10 <= objc_msgSend(v7, "count"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v6;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          if ((objc_msgSend(v7, "containsObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), (_QWORD)v21) & 1) == 0)
          {
            v18 = sub_10043165C();
            v19 = objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v27 = self;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@ presentationStackAppearsCorrect NO containees not in UIKit presentation", buf, 0xCu);
            }

            goto LABEL_18;
          }
        }
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        v17 = 1;
        if (v14)
          continue;
        break;
      }
    }
    else
    {
      v17 = 1;
    }
  }
  else
  {
    v11 = sub_10043165C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = self;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ presentationStackAppearsCorrect NO because more containees in stack than UIKit", buf, 0xCu);
    }
LABEL_18:
    v17 = 0;
  }

  return v17;
}

- (void)assertPresentationStackAppearsCorrect
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  ContainerViewController *v7;
  ContainerViewController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  uint8_t buf[4];
  __CFString *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;

  if (-[ContainerViewController delaysFirstCardPresentation]_0())
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController internalStackLessWaitingForPresentation](self, "internalStackLessWaitingForPresentation"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController uikitPresentationStack](self, "uikitPresentationStack"));
    if (-[ContainerViewController presentationStackAppearsCorrectWithInternalStack:uikitStack:](self, "presentationStackAppearsCorrectWithInternalStack:uikitStack:", v3, v4))
    {
LABEL_14:

      return;
    }
    v5 = sub_10043165C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
LABEL_13:

      goto LABEL_14;
    }
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_12;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_10;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_10:

LABEL_12:
    *(_DWORD *)buf = 138543874;
    v16 = v14;
    v17 = 2112;
    v18 = v3;
    v19 = 2112;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "[%{public}@] presentation stack appears incorrect. internalStack: %@ uikitStack: %@", buf, 0x20u);

    goto LABEL_13;
  }
}

- (void)_internal_ensurePresentationsMatchContaineeStackAllowingFault:(BOOL)a3 allowingAnimations:(BOOL)a4 skipUnlock:(BOOL)a5
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char isKindOfClass;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  os_log_type_t v30;
  _QWORD v31[5];
  _QWORD v32[5];
  NSObject *v33;
  BOOL v34;
  _QWORD v35[5];
  BOOL v36;
  BOOL v37;
  BOOL v38;
  uint8_t buf[4];
  ContainerViewController *v40;
  __int16 v41;
  const char *v42;

  v6 = a4;
  v7 = a3;
  v9 = sub_10043165C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v40 = self;
    v41 = 2080;
    v42 = "-[ContainerViewController _internal_ensurePresentationsMatchContaineeStackAllowingFault:allowingAnimations:skipUnlock:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%@ %s", buf, 0x16u);
  }

  if (-[ContainerViewController allowsDisplayOnLockScreen](self, "allowsDisplayOnLockScreen")
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "window")),
        v13 = objc_opt_class(LockScreenSecureWindow),
        isKindOfClass = objc_opt_isKindOfClass(v12, v13),
        v12,
        v11,
        (isKindOfClass & 1) == 0))
  {
    v16 = objc_claimAutoreleasedReturnValue(-[ContainerViewController internalStackLessWaitingForPresentation](self, "internalStackLessWaitingForPresentation"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController uikitPresentationStack](self, "uikitPresentationStack"));
    if (-[ContainerViewController presentationStackAppearsCorrectWithInternalStack:uikitStack:](self, "presentationStackAppearsCorrectWithInternalStack:uikitStack:", v16, v17))
    {
      if (!a5)
      {
        v18 = sub_10043165C();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v40 = self;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%@ unlocking card queue because presentationStackAppearsCorrect YES", buf, 0xCu);
        }

        if (v6)
        {
          -[ContainerViewController _unlockCardQueue](self, "_unlockCardQueue");
        }
        else
        {
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_10028BB4C;
          v31[3] = &unk_1011AC860;
          v31[4] = self;
          +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v31);
        }
      }
      goto LABEL_30;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "presentedViewController"));

    if (v21)
    {
      do
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "presentedViewController"));

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "presentedViewController"));
        v20 = v22;
      }
      while (v23);
    }
    else
    {
      v22 = v20;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "transitionCoordinator"));

    v25 = sub_10043165C();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    v27 = v26;
    if (v24)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v40 = self;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%@ presentation stack is incorrect but a presentation is occuring. adding completion to try again.", buf, 0xCu);
      }

      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "transitionCoordinator"));
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10028BA58;
      v35[3] = &unk_1011AED80;
      v35[4] = self;
      v36 = v7;
      v37 = v6;
      v38 = a5;
      -[NSObject animateAlongsideTransition:completion:](v28, "animateAlongsideTransition:completion:", 0, v35);
      goto LABEL_29;
    }
    if (v7)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v40 = self;
        v29 = v27;
        v30 = OS_LOG_TYPE_FAULT;
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "%@ Rebuilding because presentationStackAppearsCorrect is incorrect. Starting with dismiss of everything", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v40 = self;
      v29 = v27;
      v30 = OS_LOG_TYPE_ERROR;
      goto LABEL_27;
    }

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10028BA70;
    v32[3] = &unk_1011AC838;
    v32[4] = self;
    v33 = v16;
    v34 = v6;
    +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v32);
    v28 = v33;
LABEL_29:

LABEL_30:
    goto LABEL_31;
  }
  v15 = sub_10043165C();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v40 = self;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%@ bailing on ensure check because we're on the lock screen, and this container cannot present on lock screen", buf, 0xCu);
  }
LABEL_31:

}

- (void)_sequentiallyPresentViewControllers:(id)a3 allowAnimations:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void ***v7;
  void ***v8;
  void **v9;
  uint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  id v13;
  ContainerViewController *v14;

  v4 = a4;
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_10028BC00;
  v12 = &unk_1011AC8B0;
  v6 = a3;
  v13 = v6;
  v14 = self;
  v7 = objc_retainBlock(&v9);
  v8 = v7;
  if (v4)
    ((void (*)(void ***))v7[2])(v7);
  else
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v7, v9, v10, v11, v12);

}

- (void)willBeginDisplayingInSecureLockScreen
{
  self->_willBeginDisplayingInLockScreen = 1;
  -[ContainerTransitionManager setContainerReadyToInsert:](self->_transitionManager, "setContainerReadyToInsert:", 0);
}

- (double)_cardHeightForComputingBottomMapEdgeInsets
{
  void *v2;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  unsigned int v8;
  double Height;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v5 = objc_msgSend(v4, "isBeingDismissed");
  if ((v5 & 1) == 0)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    if ((objc_msgSend(v2, "isBeingPresented") & 1) == 0)
    {

      Height = 0.0;
      goto LABEL_9;
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentingViewController"));
  v8 = sub_1007F7BE8((uint64_t)v7, (Protocol *)&OBJC_PROTOCOL___ContaineeProtocol);

  if ((v5 & 1) == 0)
  {

    Height = 0.0;
    if ((v8 & 1) == 0)
      goto LABEL_10;
    goto LABEL_7;
  }

  Height = 0.0;
  if (v8)
  {
LABEL_7:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "presentingViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sheetPresentationController"));

    objc_msgSend(v4, "_currentPresentedViewFrame");
    Height = CGRectGetHeight(v15);
LABEL_9:

  }
LABEL_10:
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sheetPresentationController"));

  objc_msgSend(v13, "_currentPresentedViewFrame");
  if (Height <= CGRectGetHeight(v16))
  {
    objc_msgSend(v13, "_currentPresentedViewFrame");
    Height = CGRectGetHeight(v17);
  }

  return Height;
}

- (void)_dismissPresentedViewControllersIfNeededForViewController:(id)a3
{
  ContainerViewController *v4;
  ContainerViewController *v5;
  id v6;
  NSObject *v7;
  ContainerViewController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  ContainerViewController *v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int BOOL;
  id v33;
  NSObject *v34;
  _BOOL4 v35;
  ContainerViewController *v36;
  objc_class *v37;
  NSString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  ContainerViewController *v43;
  ContainerViewController *v44;
  objc_class *v45;
  NSString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  _QWORD v52[4];
  ContainerViewController *v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  __CFString *v57;
  __int16 v58;
  void *v59;

  v51 = a3;
  v4 = (ContainerViewController *)objc_claimAutoreleasedReturnValue(-[ContainerViewController topMostPresentedViewController](self, "topMostPresentedViewController"));
  v5 = v4;
  if (v4 && v4 != self)
  {
    while (1)
    {
      if (-[ContainerStack indexOfContainee:](self->_containerStack, "indexOfContainee:", v5) != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_47;
      v6 = sub_10043165C();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        break;
LABEL_24:

      BOOL = GEOConfigGetBOOL(MapsConfig_EnableChromeModalDismissBeforePresent, off_1014B5118);
      v33 = sub_10043165C();
      v34 = objc_claimAutoreleasedReturnValue(v33);
      v35 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
      if (!BOOL)
      {
        if (v35)
        {
          v44 = self;
          v45 = (objc_class *)objc_opt_class(v44);
          v46 = NSStringFromClass(v45);
          v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
          if ((objc_opt_respondsToSelector(v44, "accessibilityIdentifier") & 1) == 0)
            goto LABEL_44;
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController performSelector:](v44, "performSelector:", "accessibilityIdentifier"));
          v49 = v48;
          if (v48 && !objc_msgSend(v48, "isEqualToString:", v47))
          {
            v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v47, v44, v49));

          }
          else
          {

LABEL_44:
            v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v47, v44));
          }

          *(_DWORD *)buf = 138543362;
          v55 = v50;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "[%{public}@] Allowing presentation on top of non-containee VC (opted out via config)", buf, 0xCu);

        }
        goto LABEL_47;
      }
      if (v35)
      {
        v36 = self;
        v37 = (objc_class *)objc_opt_class(v36);
        v38 = NSStringFromClass(v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
        if ((objc_opt_respondsToSelector(v36, "accessibilityIdentifier") & 1) == 0)
          goto LABEL_30;
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController performSelector:](v36, "performSelector:", "accessibilityIdentifier"));
        v41 = v40;
        if (v40 && !objc_msgSend(v40, "isEqualToString:", v39))
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v39, v36, v41));

        }
        else
        {

LABEL_30:
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v39, v36));
        }

        *(_DWORD *)buf = 138543362;
        v55 = v42;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "[%{public}@] Dismissing non-containee VC before presenting new VC", buf, 0xCu);

      }
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_10028C624;
      v52[3] = &unk_1011AC860;
      v53 = v5;
      v43 = v5;
      +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v52);

      v5 = (ContainerViewController *)objc_claimAutoreleasedReturnValue(-[ContainerViewController topMostPresentedViewController](self, "topMostPresentedViewController"));
      if (!v5 || v5 == self)
        goto LABEL_47;
    }
    v8 = self;
    v9 = (objc_class *)objc_opt_class(v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

LABEL_10:
        v15 = v14;
        v16 = v51;
        v17 = v16;
        if (!v51)
        {
          v23 = CFSTR("<nil>");
LABEL_18:

          v24 = v23;
          v25 = v5;
          v26 = (objc_class *)objc_opt_class(v25);
          v27 = NSStringFromClass(v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
          if ((objc_opt_respondsToSelector(v25, "accessibilityIdentifier") & 1) != 0)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController performSelector:](v25, "performSelector:", "accessibilityIdentifier"));
            v30 = v29;
            if (v29 && !objc_msgSend(v29, "isEqualToString:", v28))
            {
              v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v28, v25, v30));

              goto LABEL_23;
            }

          }
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v28, v25));
LABEL_23:

          *(_DWORD *)buf = 138543874;
          v55 = v15;
          v56 = 2114;
          v57 = v24;
          v58 = 2114;
          v59 = v31;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Attempting to present VC (%{public}@) on top of a non-containee VC (%{public}@)", buf, 0x20u);

          goto LABEL_24;
        }
        v18 = (objc_class *)objc_opt_class(v16);
        v19 = NSStringFromClass(v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        if ((objc_opt_respondsToSelector(v17, "accessibilityIdentifier") & 1) != 0)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "performSelector:", "accessibilityIdentifier"));
          v22 = v21;
          if (v21 && !objc_msgSend(v21, "isEqualToString:", v20))
          {
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v20, v17, v22));

            goto LABEL_16;
          }

        }
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v20, v17));
LABEL_16:

        goto LABEL_18;
      }

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
    goto LABEL_10;
  }
LABEL_47:

}

- (void)macSetEnableExtendedPresentationStyles:(BOOL)a3
{
  self->_enableMacPresentationStyles = a3;
}

- (void)_pushPalette:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[SupplementalStackViewController pushContainee:animated:completion:](self->_paletteViewController, "pushContainee:animated:completion:", a3, a4, a5);
  -[NSLayoutConstraint setConstant:](self->_paletteWidthConstraint, "setConstant:", 282.0);
}

- (void)_popPalette:(BOOL)a3 completion:(id)a4
{
  -[SupplementalStackViewController popContainee:completion:](self->_paletteViewController, "popContainee:completion:", a3, a4);
  if (-[SupplementalStackViewController isEmpty](self->_paletteViewController, "isEmpty"))
    -[NSLayoutConstraint setConstant:](self->_paletteWidthConstraint, "setConstant:", 0.0);
}

- (void)shareFromMenuDidSelect:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v6 = objc_msgSend(v5, "appKitBundleClass");

  LODWORD(v5) = objc_msgSend(v6, "shouldDismissPopoverForShareKitNotification:", v4);
  if ((_DWORD)v5)
    -[ContainerViewController _popCurrentPopoverViewControllerAnimated:](self, "_popCurrentPopoverViewControllerAnimated:", 1);
}

- (void)_presentMenuViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  ContaineeProtocol *v8;
  ContaineeProtocol *currentMenuViewController;
  id v10;

  v6 = a4;
  v8 = (ContaineeProtocol *)a3;
  v10 = a5;
  currentMenuViewController = self->_currentMenuViewController;
  if (currentMenuViewController)
  {
    -[ContainerViewController _dismissCurrentMenuViewControllerAnimated:](self, "_dismissCurrentMenuViewControllerAnimated:", v6);
    currentMenuViewController = self->_currentMenuViewController;
  }
  self->_currentMenuViewController = v8;

  -[ContainerViewController _presentCurrentMenuViewControllerAnimated:completion:](self, "_presentCurrentMenuViewControllerAnimated:completion:", v6, v10);
}

- (void)_presentCurrentMenuViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  ContaineeProtocol *currentMenuViewController;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  v6 = a4;
  currentMenuViewController = self->_currentMenuViewController;
  if (currentMenuViewController)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeProtocol macMenuPresentationController](currentMenuViewController, "macMenuPresentationController"));
    if (objc_msgSend(v8, "isPresented"))
    {

    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeProtocol macMenuPresentationController](self->_currentMenuViewController, "macMenuPresentationController"));
      v10 = objc_msgSend(v9, "isDismissing");

      if ((v10 & 1) == 0)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeProtocol macMenuPresentationController](self->_currentMenuViewController, "macMenuPresentationController"));
        objc_msgSend(v11, "addObserver:", self);

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeProtocol macMenuPresentationController](self->_currentMenuViewController, "macMenuPresentationController"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10028C908;
        v14[3] = &unk_1011ADA00;
        v15 = v6;
        objc_msgSend(v12, "presentFromViewController:animated:completion:", v13, v4, v14);

      }
    }
  }

}

- (void)_dismissMenuViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  ContaineeProtocol *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  ContaineeProtocol *v10;

  v4 = a4;
  v6 = (ContaineeProtocol *)a3;
  if (v6)
  {
    if (self->_currentMenuViewController == v6)
    {
      self->_currentMenuViewController = 0;
      v10 = v6;

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeProtocol macMenuPresentationController](v10, "macMenuPresentationController"));
      v8 = objc_msgSend(v7, "isPresented");

      v6 = v10;
      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeProtocol macMenuPresentationController](v10, "macMenuPresentationController"));
        objc_msgSend(v9, "dismissAnimated:completion:", v4, &stru_1011AEDA0);

        v6 = v10;
      }
    }
  }

}

- (void)_dismissCurrentMenuViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  ContaineeProtocol *currentMenuViewController;

  v3 = a3;
  currentMenuViewController = self->_currentMenuViewController;
  if (currentMenuViewController)
    -[ContainerViewController _dismissMenuViewController:animated:](self, "_dismissMenuViewController:animated:", currentMenuViewController, v3);
}

- (void)macMenuPresentationControllerWillDismiss:(id)a3
{
  ContaineeProtocol *currentMenuViewController;
  id v5;
  id v6;
  ContaineeProtocol *v7;

  currentMenuViewController = self->_currentMenuViewController;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeProtocol macMenuPresentationController](currentMenuViewController, "macMenuPresentationController"));

  if (v6 == v5)
  {
    v7 = self->_currentMenuViewController;
    self->_currentMenuViewController = 0;

  }
}

- (void)macMenuPresentationControllerDidDismiss:(id)a3
{
  objc_msgSend(a3, "removeObserver:", self);
  -[ContainerViewController _presentCurrentMenuViewControllerAnimated:completion:](self, "_presentCurrentMenuViewControllerAnimated:completion:", 1, 0);
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  ContaineeProtocol *v8;
  id v9;
  ContaineeProtocol *currentPopoverViewController;
  objc_super *v11;
  ContainerViewController *v12;
  objc_super v13;

  v6 = a4;
  v8 = (ContaineeProtocol *)a3;
  v9 = a5;
  currentPopoverViewController = self->_currentPopoverViewController;
  if (currentPopoverViewController)
  {
    if (currentPopoverViewController == v8)
    {
      v13.receiver = self;
      v11 = &v13;
      goto LABEL_6;
    }
    -[ContainerViewController _popCurrentPopoverViewControllerAnimated:](self, "_popCurrentPopoverViewControllerAnimated:", 1);
  }
  v12 = self;
  v11 = (objc_super *)&v12;
LABEL_6:
  v11->super_class = (Class)ContainerViewController;
  -[objc_super presentViewController:animated:completion:](v11, "presentViewController:animated:completion:", v8, v6, v9, v12);

}

- (void)_presentPopoverViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  void (**v9)(id, _QWORD);
  void *v10;
  void *v11;
  ContaineeProtocol *currentPopoverViewController;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  ContaineeProtocol *v16;

  v6 = a4;
  v16 = (ContaineeProtocol *)a3;
  v9 = (void (**)(id, _QWORD))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));

  if (v11)
  {
    if (!-[ContainerViewController _isDeferringMapPopovers](self, "_isDeferringMapPopovers"))
    {
      currentPopoverViewController = self->_currentPopoverViewController;
      if (currentPopoverViewController)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeProtocol macPopoverPresentationController](self->_currentPopoverViewController, "macPopoverPresentationController"));
        v14 = objc_msgSend(v13, "isPresented");

        if (currentPopoverViewController == v16 && (v14 & 1) != 0)
          goto LABEL_11;
        -[ContainerViewController _popCurrentPopoverViewControllerAnimated:](self, "_popCurrentPopoverViewControllerAnimated:", v6);
      }
      objc_storeStrong((id *)&self->_currentPopoverViewController, a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeProtocol macPopoverPresentationController](self->_currentPopoverViewController, "macPopoverPresentationController"));
      objc_msgSend(v15, "setDelegate:", self);

      -[ContainerViewController _presentCurrentPopoverAnimated:completion:](self, "_presentCurrentPopoverAnimated:completion:", v6, v9);
      goto LABEL_11;
    }
    objc_storeStrong((id *)&self->_deferredPopoverViewController, a3);
  }
  if (v9)
    v9[2](v9, 0);
LABEL_11:

}

- (void)_presentCurrentPopoverAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  ContaineeProtocol *currentPopoverViewController;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  id v13;
  id pendingPopoverPresentationCompletionHandler;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  void *v22;

  v4 = a3;
  v6 = a4;
  currentPopoverViewController = self->_currentPopoverViewController;
  if (currentPopoverViewController)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeProtocol macPopoverPresentationController](currentPopoverViewController, "macPopoverPresentationController"));
    if (objc_msgSend(v8, "isPresented"))
    {
LABEL_3:

      goto LABEL_12;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeProtocol macPopoverPresentationController](self->_currentPopoverViewController, "macPopoverPresentationController"));
    v10 = objc_msgSend(v9, "isDismissing");

    if ((v10 & 1) == 0)
    {
      if (v6)
      {
        v11 = objc_retainBlock(self->_pendingPopoverPresentationCompletionHandler);
        v12 = v11;
        if (v11)
          (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
        v13 = objc_msgSend(v6, "copy");
        pendingPopoverPresentationCompletionHandler = self->_pendingPopoverPresentationCompletionHandler;
        self->_pendingPopoverPresentationCompletionHandler = v13;

      }
      if (!-[ContainerViewController _isDeferringMapPopovers](self, "_isDeferringMapPopovers"))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mapView"));

        if ((objc_msgSend(v8, "isRegionChanging") & 1) == 0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
          v22 = v17;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeProtocol macPopoverPresentationController](self->_currentPopoverViewController, "macPopoverPresentationController"));
          objc_msgSend(v19, "setPassthroughViews:", v18);

          v20 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeProtocol macPopoverPresentationController](self->_currentPopoverViewController, "macPopoverPresentationController"));
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_10028CE94;
          v21[3] = &unk_1011AC860;
          v21[4] = self;
          objc_msgSend(v20, "presentFromContainerViewController:animated:completion:", self, v4, v21);

        }
        goto LABEL_3;
      }
    }
  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }
LABEL_12:

}

- (void)_dismissPopoverViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  ContaineeProtocol *v6;
  ContaineeProtocol *v7;
  ContaineeProtocol *currentPopoverViewController;
  void *v9;
  unsigned int v10;
  ContaineeProtocol *v11;
  void *v12;
  ContaineeProtocol *v13;
  ContaineeProtocol *v14;
  _QWORD v15[5];
  ContaineeProtocol *v16;

  v4 = a4;
  v6 = (ContaineeProtocol *)a3;
  v7 = v6;
  if (self->_deferredPopoverViewController == v6)
  {
    self->_deferredPopoverViewController = 0;

  }
  currentPopoverViewController = self->_currentPopoverViewController;
  if (currentPopoverViewController)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeProtocol macPopoverPresentationController](currentPopoverViewController, "macPopoverPresentationController"));
    v10 = objc_msgSend(v9, "isPresented");

    if (v10)
    {
      v11 = self->_currentPopoverViewController;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeProtocol macPopoverPresentationController](v11, "macPopoverPresentationController"));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10028D030;
      v15[3] = &unk_1011AC8B0;
      v15[4] = self;
      v16 = v11;
      v13 = v11;
      objc_msgSend(v12, "dismissAnimated:completion:", v4, v15);

    }
    v14 = self->_currentPopoverViewController;
    self->_currentPopoverViewController = 0;

  }
}

- (void)_popCurrentPopoverViewControllerAnimated:(BOOL)a3
{
  ContaineeProtocol *v4;
  void *v5;
  unsigned int v6;
  id v7;
  void *v8;
  ContaineeProtocol *v9;

  v4 = self->_currentPopoverViewController;
  if (v4)
  {
    v9 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeProtocol macPopoverPresentationController](v4, "macPopoverPresentationController"));
    v6 = objc_msgSend(v5, "isPresented");

    v4 = v9;
    if (v6)
    {
      v7 = objc_retainBlock(self->_popoverDismissHandler);
      v8 = v7;
      if (v7)
        (*((void (**)(id, ContaineeProtocol *))v7 + 2))(v7, v9);
      else
        -[ContaineeProtocol handleDismissAction:](v9, "handleDismissAction:", self);

      v4 = v9;
    }
  }

}

- (void)macSetPopoverDismissHandler:(id)a3
{
  id v4;
  id popoverDismissHandler;

  v4 = objc_msgSend(a3, "copy");
  popoverDismissHandler = self->_popoverDismissHandler;
  self->_popoverDismissHandler = v4;

}

- (void)_popoverDismissDidFinish
{
  id pendingPopoverPresentationCompletionHandler;
  id v4;

  if (self->_currentPopoverViewController)
  {
    v4 = objc_retainBlock(self->_pendingPopoverPresentationCompletionHandler);
    pendingPopoverPresentationCompletionHandler = self->_pendingPopoverPresentationCompletionHandler;
    self->_pendingPopoverPresentationCompletionHandler = 0;

    -[ContainerViewController _presentCurrentPopoverAnimated:completion:](self, "_presentCurrentPopoverAnimated:completion:", 1, v4);
  }
}

- (void)macPopoverPresentationControllerWillDismiss:(id)a3
{
  ContaineeProtocol *currentPopoverViewController;
  id v5;
  id v6;

  currentPopoverViewController = self->_currentPopoverViewController;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeProtocol macPopoverPresentationController](currentPopoverViewController, "macPopoverPresentationController"));

  if (v6 == v5)
    -[ContainerViewController macWillDismissPopoverContaineeController:](self, "macWillDismissPopoverContaineeController:", self->_currentPopoverViewController);
}

- (void)macWillDismissPopoverContaineeController:(id)a3
{
  ContaineeProtocol *currentPopoverViewController;

  currentPopoverViewController = self->_currentPopoverViewController;
  self->_currentPopoverViewController = 0;

}

- (void)macPopoverPresentationControllerDidDismiss:(id)a3
{
  -[ContainerViewController _popoverDismissDidFinish](self, "_popoverDismissDidFinish", a3);
}

- (BOOL)_isDeferringMapPopovers
{
  return self->_deferMapPopoverCount > 0;
}

- (void)beginDeferringPresentingMapPopovers
{
  if (self->_enableMacPresentationStyles)
    ++self->_deferMapPopoverCount;
}

- (void)endDeferringPresentingMapPopovers
{
  int64_t v3;
  ContaineeProtocol *deferredPopoverViewController;
  ContaineeProtocol *v5;

  if (self->_enableMacPresentationStyles)
  {
    v3 = self->_deferMapPopoverCount - 1;
    self->_deferMapPopoverCount = v3;
    if (!v3)
    {
      deferredPopoverViewController = self->_deferredPopoverViewController;
      if (deferredPopoverViewController)
      {
        -[ContainerViewController _presentPopoverViewController:animated:completion:](self, "_presentPopoverViewController:animated:completion:", deferredPopoverViewController, 1, 0);
        v5 = self->_deferredPopoverViewController;
        self->_deferredPopoverViewController = 0;

      }
    }
  }
}

- (void)deferPresentingMapPopoversInsideBlock:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  -[ContainerViewController beginDeferringPresentingMapPopovers](self, "beginDeferringPresentingMapPopovers");
  if (v4)
    v4[2]();
  -[ContainerViewController endDeferringPresentingMapPopovers](self, "endDeferringPresentingMapPopovers");

}

- (void)mapViewDidStartUserInteraction:(id)a3
{
  -[ContainerViewController _popCurrentPopoverViewControllerAnimated:](self, "_popCurrentPopoverViewControllerAnimated:", 1);
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  id v5;
  ContaineeProtocol *currentPopoverViewController;
  void *v7;
  unsigned __int8 v8;
  id v9;

  v5 = a3;
  currentPopoverViewController = self->_currentPopoverViewController;
  if (currentPopoverViewController)
  {
    v9 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeProtocol macPopoverPresentationController](currentPopoverViewController, "macPopoverPresentationController"));
    v8 = objc_msgSend(v7, "isPresented");

    v5 = v9;
    if ((v8 & 1) == 0)
    {
      -[ContainerViewController _presentCurrentPopoverAnimated:completion:](self, "_presentCurrentPopoverAnimated:completion:", 1, 0);
      v5 = v9;
    }
  }

}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5
{
  if ((unint64_t)(a4 - 1) <= 1)
    -[ContainerViewController _popCurrentPopoverViewControllerAnimated:](self, "_popCurrentPopoverViewControllerAnimated:", 1);
}

- (void)mapView:(id)a3 didBecomePitched:(BOOL)a4
{
  -[ContainerViewController _popCurrentPopoverViewControllerAnimated:](self, "_popCurrentPopoverViewControllerAnimated:", 1, a4);
}

- (unint64_t)containeeLayout
{
  return self->_containeeLayout;
}

- (ContainerDelegate)containerDelegate
{
  return (ContainerDelegate *)objc_loadWeakRetained((id *)&self->_containerDelegate);
}

- (void)setContainerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_containerDelegate, a3);
}

- (IOSBasedChromeContext)chromeContext
{
  return (IOSBasedChromeContext *)objc_loadWeakRetained((id *)&self->_chromeContext);
}

- (void)setChromeContext:(id)a3
{
  objc_storeWeak((id *)&self->_chromeContext, a3);
}

- (IOSBasedChromeViewController)chromeViewController
{
  return (IOSBasedChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (CardAnimationManager)animationManager
{
  return self->_animationManager;
}

- (ContainerStyleManager)containerStyleManager
{
  return self->_containerStyleManager;
}

- (BOOL)chromeHidden
{
  return self->_chromeHidden;
}

- (BOOL)fullscreenMode
{
  return self->_fullscreenMode;
}

- (BOOL)transitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (BOOL)preventEdgeInsetsUpdate
{
  return self->_preventEdgeInsetsUpdate;
}

- (void)setPreventEdgeInsetsUpdate:(BOOL)a3
{
  self->_preventEdgeInsetsUpdate = a3;
}

- (BOOL)useBackdropFullScreen
{
  return self->_useBackdropFullScreen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerStyleManager, 0);
  objc_storeStrong((id *)&self->_animationManager, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_destroyWeak((id *)&self->_chromeContext);
  objc_destroyWeak((id *)&self->_containerDelegate);
  objc_storeStrong((id *)&self->_currentViewController, 0);
  objc_storeStrong(&self->_popoverDismissHandler, 0);
  objc_storeStrong((id *)&self->_paletteWidthConstraint, 0);
  objc_storeStrong((id *)&self->_paletteViewController, 0);
  objc_storeStrong(&self->_pendingPopoverPresentationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_deferredPopoverViewController, 0);
  objc_storeStrong((id *)&self->_currentPopoverViewController, 0);
  objc_storeStrong((id *)&self->_currentMenuViewController, 0);
  objc_storeStrong(&self->_mapInsetPropagationSuspensionToken, 0);
  objc_storeStrong((id *)&self->_cardDismissalHelper, 0);
  objc_storeStrong((id *)&self->_resizingBlocksByObserver, 0);
  objc_storeStrong((id *)&self->_backdropConstraints, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_cardProvider, 0);
  objc_storeStrong((id *)&self->_containerStack, 0);
  objc_storeStrong((id *)&self->_transitionManager, 0);
  objc_storeStrong((id *)&self->_cards, 0);
}

- (uint64_t)delaysFirstCardPresentation
{
  if (qword_1014D2B80 != -1)
    dispatch_once(&qword_1014D2B80, &stru_1011BE048);
  return byte_1014D2B78;
}

- (BOOL)isVLFCrowdsourcingPermissionCardActive
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v3 = objc_opt_class(VLFCrowdsourcingPermissionContaineeViewController);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

- (BOOL)showVLFCrowdsourcingPermissionCardWithContaineeDelegate:(id)a3 delegate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  ContainerViewController *v13;
  ContainerViewController *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  unint64_t v21;
  unint64_t v22;
  id v23;
  VLFCrowdsourcingPermissionContaineeViewController *v24;
  _BOOL4 v25;
  ContainerViewController *v26;
  ContainerViewController *v27;
  objc_class *v28;
  NSString *v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  id v34;
  ContainerViewController *v35;
  ContainerViewController *v36;
  objc_class *v37;
  NSString *v38;
  void *v39;
  void *v40;
  void *v41;
  ContainerViewController *v42;
  ContainerViewController *v43;
  objc_class *v44;
  NSString *v45;
  void *v46;
  void *v47;
  void *v48;
  __CFString *v49;
  id v50;
  NSObject *v51;
  id v52;
  char *v53;
  BOOL v54;
  const char *v55;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  int v62;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[ContainerViewController isVLFCrowdsourcingPermissionCardActive](self, "isVLFCrowdsourcingPermissionCardActive"))
  {
    v21 = -[ContainerViewController containerStyle](self, "containerStyle");
    if (+[VLFCrowdsourcingPermissionContaineeViewController shouldShowPermissionViewController](VLFCrowdsourcingPermissionContaineeViewController, "shouldShowPermissionViewController"))
    {
      v22 = v21 & 0xFFFFFFFFFFFFFFFDLL;
      v23 = sub_1008DFDAC();
      v24 = (VLFCrowdsourcingPermissionContaineeViewController *)objc_claimAutoreleasedReturnValue(v23);
      v25 = os_log_type_enabled(&v24->super.super.super.super.super.super, OS_LOG_TYPE_INFO);
      if (v22 == 4)
      {
        if (v25)
        {
          v26 = self;
          v27 = v26;
          if (!v26)
          {
            v33 = CFSTR("<nil>");
            goto LABEL_48;
          }
          v28 = (objc_class *)objc_opt_class(v26);
          v29 = NSStringFromClass(v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
          if ((objc_opt_respondsToSelector(v27, "accessibilityIdentifier") & 1) != 0)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController performSelector:](v27, "performSelector:", "accessibilityIdentifier"));
            v32 = v31;
            if (v31 && !objc_msgSend(v31, "isEqualToString:", v30))
            {
              v33 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v30, v27, v32));

              goto LABEL_19;
            }

          }
          v33 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v30, v27));
LABEL_19:

LABEL_48:
          *(_DWORD *)buf = 138543362;
          v58 = (const char *)v33;
          v55 = "[%{public}@] Not showing VLF crowdsourcing permission card because the phone is in landscape";
          goto LABEL_49;
        }
LABEL_50:
        v54 = 0;
LABEL_51:

        goto LABEL_52;
      }
      if (!v25)
      {
LABEL_55:

        v24 = -[VLFCrowdsourcingPermissionContaineeViewController initWithCompletion:]([VLFCrowdsourcingPermissionContaineeViewController alloc], "initWithCompletion:", v10);
        -[ContaineeViewController setContaineeDelegate:](v24, "setContaineeDelegate:", v8);
        -[ControlContaineeViewController setDelegate:](v24, "setDelegate:", v9);
        v54 = 1;
        -[ContainerViewController presentController:animated:](self, "presentController:animated:", v24, 1);
        goto LABEL_51;
      }
      v42 = self;
      v43 = v42;
      if (!v42)
      {
        v49 = CFSTR("<nil>");
        goto LABEL_54;
      }
      v44 = (objc_class *)objc_opt_class(v42);
      v45 = NSStringFromClass(v44);
      v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
      if ((objc_opt_respondsToSelector(v43, "accessibilityIdentifier") & 1) != 0)
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController performSelector:](v43, "performSelector:", "accessibilityIdentifier"));
        v48 = v47;
        if (v47 && !objc_msgSend(v47, "isEqualToString:", v46))
        {
          v49 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v46, v43, v48));

          goto LABEL_35;
        }

      }
      v49 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v46, v43));
LABEL_35:

LABEL_54:
      *(_DWORD *)buf = 138543362;
      v58 = (const char *)v49;
      _os_log_impl((void *)&_mh_execute_header, &v24->super.super.super.super.super.super, OS_LOG_TYPE_INFO, "[%{public}@] Showing VLF crowdsourcing permission card", buf, 0xCu);

      goto LABEL_55;
    }
    v34 = sub_1008DFDAC();
    v24 = (VLFCrowdsourcingPermissionContaineeViewController *)objc_claimAutoreleasedReturnValue(v34);
    if (!os_log_type_enabled(&v24->super.super.super.super.super.super, OS_LOG_TYPE_INFO))
      goto LABEL_50;
    v35 = self;
    v36 = v35;
    if (!v35)
    {
      v33 = CFSTR("<nil>");
      goto LABEL_45;
    }
    v37 = (objc_class *)objc_opt_class(v35);
    v38 = NSStringFromClass(v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    if ((objc_opt_respondsToSelector(v36, "accessibilityIdentifier") & 1) != 0)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController performSelector:](v36, "performSelector:", "accessibilityIdentifier"));
      v41 = v40;
      if (v40 && !objc_msgSend(v40, "isEqualToString:", v39))
      {
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v39, v36, v41));

        goto LABEL_27;
      }

    }
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v39, v36));
LABEL_27:

LABEL_45:
    *(_DWORD *)buf = 138543362;
    v58 = (const char *)v33;
    v55 = "[%{public}@] The VLF crowdsourcing permission card is not eligible to be shown";
LABEL_49:
    _os_log_impl((void *)&_mh_execute_header, &v24->super.super.super.super.super.super, OS_LOG_TYPE_INFO, v55, buf, 0xCu);

    goto LABEL_50;
  }
  v11 = sub_1008DFDAC();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    goto LABEL_38;
  v13 = self;
  v14 = v13;
  if (!v13)
  {
    v20 = CFSTR("<nil>");
    goto LABEL_37;
  }
  v15 = (objc_class *)objc_opt_class(v13);
  v16 = NSStringFromClass(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  if ((objc_opt_respondsToSelector(v14, "accessibilityIdentifier") & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController performSelector:](v14, "performSelector:", "accessibilityIdentifier"));
    v19 = v18;
    if (v18 && !objc_msgSend(v18, "isEqualToString:", v17))
    {
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v17, v14, v19));

      goto LABEL_9;
    }

  }
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v17, v14));
LABEL_9:

LABEL_37:
  *(_DWORD *)buf = 138543362;
  v58 = (const char *)v20;
  _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[%{public}@] The VLF crowdsourcing card is already visible; can't show twice",
    buf,
    0xCu);

LABEL_38:
  v50 = sub_1004318FC();
  v51 = objc_claimAutoreleasedReturnValue(v50);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v58 = "-[ContainerViewController(VLFCrowdsourcing) showVLFCrowdsourcingPermissionCardWithContaineeDelegate:delegate:completion:]";
    v59 = 2080;
    v60 = "ContainerViewController+VLFCrowdsourcing.m";
    v61 = 1024;
    v62 = 29;
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v52 = sub_1004318FC();
    v24 = (VLFCrowdsourcingPermissionContaineeViewController *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(&v24->super.super.super.super.super.super, OS_LOG_TYPE_ERROR))
    {
      v53 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      *(_DWORD *)buf = 138412290;
      v58 = v53;
      _os_log_impl((void *)&_mh_execute_header, &v24->super.super.super.super.super.super, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
    goto LABEL_50;
  }
  v54 = 0;
LABEL_52:

  return v54;
}

@end
