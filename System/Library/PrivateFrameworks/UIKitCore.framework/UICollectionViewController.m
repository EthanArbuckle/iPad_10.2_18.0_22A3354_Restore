@implementation UICollectionViewController

- (void)_setNeedsUpdateContentUnavailableConfiguration
{
  UICollectionView *v3;
  UICollectionView *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewController;
  -[UIViewController _setNeedsUpdateContentUnavailableConfiguration](&v5, sel__setNeedsUpdateContentUnavailableConfiguration);
  v3 = self->_collectionView;
  v4 = v3;
  if (v3 && (*((_WORD *)&self->super._viewControllerFlags + 4) & 0x10) != 0)
    -[UIScrollView setNeedsLayout](v3, "setNeedsLayout");

}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UICollectionViewController;
  -[UIViewController contentScrollViewForEdge:](&v7, sel_contentScrollViewForEdge_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[UIViewController _existingView](self, "_existingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[UICollectionViewController collectionView](self, "collectionView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (UICollectionView)collectionView
{
  -[UIViewController loadViewIfRequired](self, "loadViewIfRequired");
  return self->_collectionView;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (self->_keyboardSupport)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", self->_keyboardSupport);

    -[UIAutoRespondingScrollViewControllerKeyboardSupport setViewIsDisappearing:](self->_keyboardSupport, "setViewIsDisappearing:", 1);
    -[UIAutoRespondingScrollViewControllerKeyboardSupport setRegisteredForNotifications:](self->_keyboardSupport, "setRegisteredForNotifications:", 0);
  }
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewController;
  -[UIViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (void)__viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewController;
  -[UIViewController __viewDidAppear:](&v4, sel___viewDidAppear_, a3);
  -[UICollectionViewController _installReorderingGestureIfNecessary](self, "_installReorderingGestureIfNecessary");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewController;
  -[UIViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[UICollectionViewController _installReorderingGestureIfNecessary](self, "_installReorderingGestureIfNecessary");
}

- (void)_installReorderingGestureIfNecessary
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  _UICollectionViewLegacyReorderingGestureRecognizer *v6;
  UILongPressGestureRecognizer *reorderingGesture;
  void *v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_collectionViewControllerFlags & 4) != 0 && !self->_reorderingGesture)
  {
    -[UIView window](self->_collectionView, "window");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      v5 = -[UICollectionView _dataSourceSupportsReordering](self->_collectionView, "_dataSourceSupportsReordering");

      if (v5)
      {
        v6 = -[_UICollectionViewLegacyReorderingGestureRecognizer initWithTarget:action:]([_UICollectionViewLegacyReorderingGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleReorderingGesture_);
        reorderingGesture = self->_reorderingGesture;
        self->_reorderingGesture = &v6->super;

        -[UIViewController traitCollection](self, "traitCollection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "userInterfaceIdiom");

        if (v9 == 6)
          -[UIGestureRecognizer _setKeepTouchesOnContinuation:](self->_reorderingGesture, "_setKeepTouchesOnContinuation:", 0);
        -[UIGestureRecognizer setDelegate:](self->_reorderingGesture, "setDelegate:", self);
        -[UIView addGestureRecognizer:](self->_collectionView, "addGestureRecognizer:", self->_reorderingGesture);
      }
    }
  }
}

- (void)setCollectionView:(UICollectionView *)collectionView
{
  UICollectionView *v5;
  UICollectionView **p_collectionView;
  UICollectionView *v7;
  UICollectionViewController *v8;
  UICollectionViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  UICollectionView *v13;

  v5 = collectionView;
  p_collectionView = &self->_collectionView;
  v7 = self->_collectionView;
  if (v7 != v5)
  {
    v13 = v5;
    -[UICollectionView dataSource](v7, "dataSource");
    v8 = (UICollectionViewController *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[UICollectionView setDataSource:](*p_collectionView, "setDataSource:", 0);
    -[UIScrollView delegate](*p_collectionView, "delegate");
    v9 = (UICollectionViewController *)objc_claimAutoreleasedReturnValue();

    if (v9 == self)
      -[UICollectionView setDelegate:](*p_collectionView, "setDelegate:", 0);
    -[UIScrollView removeFromSuperview](*p_collectionView, "removeFromSuperview");
    -[UIView setAutoresizingMask:](v13, "setAutoresizingMask:", 18);
    -[UICollectionViewController _wrappingView](self, "_wrappingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewController setView:](self, "setView:", v10);
    objc_msgSend(v10, "bounds");
    -[UICollectionView setFrame:](v13, "setFrame:");
    objc_msgSend(v10, "addSubview:", v13);
    objc_storeStrong((id *)&self->_collectionView, collectionView);
    -[UICollectionView dataSource](v13, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      -[UICollectionView setDataSource:](v13, "setDataSource:", self);
    -[UIScrollView delegate](v13, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      -[UICollectionView setDelegate:](v13, "setDelegate:", self);

    v5 = v13;
  }

}

- (BOOL)useLayoutToLayoutNavigationTransitions
{
  return (*(_BYTE *)&self->_collectionViewControllerFlags >> 1) & 1;
}

- (UICollectionViewLayout)collectionViewLayout
{
  return self->_layout;
}

- (void)viewWillAppear:(BOOL)a3
{
  UIAutoRespondingScrollViewControllerKeyboardSupport *keyboardSupport;
  UIAutoRespondingScrollViewControllerKeyboardSupport *v5;
  UIAutoRespondingScrollViewControllerKeyboardSupport *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UICollectionViewController;
  -[UIViewController viewWillAppear:](&v11, sel_viewWillAppear_, a3);
  if (dyld_program_sdk_at_least())
  {
    keyboardSupport = self->_keyboardSupport;
    if (!keyboardSupport)
    {
      v5 = -[UIAutoRespondingScrollViewControllerKeyboardSupport initWithViewController:]([UIAutoRespondingScrollViewControllerKeyboardSupport alloc], "initWithViewController:", self);
      v6 = self->_keyboardSupport;
      self->_keyboardSupport = v5;

      keyboardSupport = self->_keyboardSupport;
    }
    if (!-[UIAutoRespondingScrollViewControllerKeyboardSupport registeredForNotifications](keyboardSupport, "registeredForNotifications"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController _screen](self, "_screen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:object:", self->_keyboardSupport, sel__keyboardWillShow_, CFSTR("UIKeyboardPrivateWillShowNotification"), v8);
      objc_msgSend(v7, "addObserver:selector:name:object:", self->_keyboardSupport, sel__keyboardWillHide_, CFSTR("UIKeyboardPrivateWillHideNotification"), v8);
      objc_msgSend(v7, "addObserver:selector:name:object:", self->_keyboardSupport, sel__keyboardDidShow_, CFSTR("UIKeyboardPrivateDidShowNotification"), v8);
      objc_msgSend(v7, "addObserver:selector:name:object:", self->_keyboardSupport, sel__keyboardDidHide_, CFSTR("UIKeyboardPrivateDidHideNotification"), v8);
      objc_msgSend(v7, "addObserver:selector:name:object:", self->_keyboardSupport, sel__keyboardDidChangeFrame_, CFSTR("UIKeyboardPrivateDidChangeFrameNotification"), v8);
      -[UIAutoRespondingScrollViewControllerKeyboardSupport setRegisteredForNotifications:](self->_keyboardSupport, "setRegisteredForNotifications:", 1);

    }
    -[UIAutoRespondingScrollViewControllerKeyboardSupport setViewIsDisappearing:](self->_keyboardSupport, "setViewIsDisappearing:", 0);
    if (!-[UIViewController _isInViewControllerThatHandlesKeyboardAvoidance](self, "_isInViewControllerThatHandlesKeyboardAvoidance"))
    {
      -[UIAutoRespondingScrollViewControllerKeyboardSupport adjustmentForKeyboard](self->_keyboardSupport, "adjustmentForKeyboard");
      v10 = v9;
      -[UICollectionView _adjustForAutomaticKeyboardInfo:animated:lastAdjustment:](self->_collectionView, "_adjustForAutomaticKeyboardInfo:animated:lastAdjustment:", 0, 0, &v10);
      -[UIAutoRespondingScrollViewControllerKeyboardSupport setAdjustmentForKeyboard:](self->_keyboardSupport, "setAdjustmentForKeyboard:", v10);
    }
  }
}

- (void)loadView
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  UICollectionViewLayout *v7;
  void *v8;
  UICollectionViewLayout *v9;
  UICollectionViewLayout *v10;
  UICollectionView *v11;
  UICollectionView *collectionView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  _BOOL8 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  UICollectionViewLayout *v30;
  UICollectionViewLayout *layout;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  UICollectionView *v45;
  UICollectionView *v46;
  objc_super v47;
  objc_super v48;

  -[UICollectionViewController _wrappingView](self, "_wrappingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIViewController _usesSharedView](self, "_usesSharedView");
  -[UIViewController nibName](self, "nibName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4)
  {
    if (v5)
    {
      v47.receiver = self;
      v47.super_class = (Class)UICollectionViewController;
      -[UIViewController loadView](&v47, sel_loadView);
      -[UIViewController view](self, "view");
      v11 = (UICollectionView *)objc_claimAutoreleasedReturnValue();
      collectionView = self->_collectionView;
      self->_collectionView = v11;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[UIViewController storyboardIdentifier](self, "storyboardIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          -[UIViewController storyboard](self, "storyboard");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            v17 = v15;
          }
          else
          {
            objc_msgSend(v14, "description");
            v17 = (id)objc_claimAutoreleasedReturnValue();
          }
          v27 = v17;

          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%s instantiated view controller with identifier \"%@\" from storyboard \"%@\", but didn't get a UICollectionView."), "-[UICollectionViewController loadView]", v13, v27);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%s loaded the \"%@\" nib but didn't get a UICollectionView."), "-[UICollectionViewController loadView]", v6);
        }

      }
      -[UIScrollView delegate](self->_collectionView, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
        -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
      -[UICollectionView dataSource](self->_collectionView, "dataSource");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
        -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
      if (!self->_layout)
      {
        -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
        v30 = (UICollectionViewLayout *)objc_claimAutoreleasedReturnValue();
        layout = self->_layout;
        self->_layout = v30;

      }
      goto LABEL_31;
    }
    if (objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle"))
    {
      -[UIViewController _window](self, "_window");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        +[UIScreen mainScreen](UIScreen, "mainScreen");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "_mainSceneFrame");
        v34 = v33;
        v36 = v35;
        v38 = v37;
        v40 = v39;

        v19 = 0;
LABEL_30:

        v45 = -[UICollectionViewController _newCollectionViewWithFrame:collectionViewLayout:](self, "_newCollectionViewWithFrame:collectionViewLayout:", self->_layout, v34, v36, v38, v40);
        v46 = self->_collectionView;
        self->_collectionView = v45;

        -[UIView setAutoresizingMask:](self->_collectionView, "setAutoresizingMask:", 18);
        -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
        -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
LABEL_31:
        -[UICollectionViewController setView:](self, "setView:", v3);
        objc_msgSend(v3, "bounds");
        -[UICollectionView setFrame:](self->_collectionView, "setFrame:");
        objc_msgSend(v3, "addSubview:", self->_collectionView);

        goto LABEL_32;
      }
      v19 = v18;
      __UIStatusBarManagerForWindow(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isStatusBarHidden");

      if ((v21 & 1) != 0)
      {
        v22 = 1;
      }
      else
      {
        __UIStatusBarManagerForWindow(v19);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "windowScene");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "defaultStatusBarHeightInOrientation:", objc_msgSend(v42, "interfaceOrientation"));
        v44 = v43;

        v22 = v44 == 0.0;
      }
      objc_msgSend(v19, "_referenceFrameFromSceneUsingScreenBounds:", v22);
    }
    else
    {
      -[UIViewController _screen](self, "_screen");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_applicationFrame");
    }
    v34 = v23;
    v36 = v24;
    v38 = v25;
    v40 = v26;
    goto LABEL_30;
  }
  if (v5)
  {
    v7 = self->_layout;

    if (!v7)
    {
      v48.receiver = self;
      v48.super_class = (Class)UICollectionViewController;
      -[UIViewController loadView](&v48, sel_loadView);
      -[UIViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "collectionViewLayout");
      v9 = (UICollectionViewLayout *)objc_claimAutoreleasedReturnValue();
      v10 = self->_layout;
      self->_layout = v9;

    }
  }
  -[UICollectionViewController setView:](self, "setView:", v3);
LABEL_32:

}

- (void)setView:(id)a3
{
  id v4;
  UICollectionView *collectionView;
  objc_super v6;

  v4 = a3;
  if (!v4)
  {
    collectionView = self->_collectionView;
    self->_collectionView = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewController;
  -[UIViewController setView:](&v6, sel_setView_, v4);

}

- (id)_wrappingView
{
  UICollectionViewControllerWrapperView *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UICollectionViewControllerWrapperView *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;

  -[UIViewController _existingView](self, "_existingView");
  v3 = (UICollectionViewControllerWrapperView *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (dyld_program_sdk_at_least())
    {
      -[UIViewController _window](self, "_window");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle")
        && (v4 || dyld_program_sdk_at_least()))
      {
        objc_msgSend(v4, "_referenceFrameFromSceneUsingScreenBounds:", 1);
        v6 = v5;
        v8 = v7;
        v10 = v9;
        v12 = v11;
      }
      else
      {
        -[UIViewController _screen](self, "_screen");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_applicationFrameForInterfaceOrientation:usingStatusbarHeight:ignoreStatusBar:", objc_msgSend((id)UIApp, "_defaultSceneInterfaceOrientationReturningUnknownForNilScene:", 0), 1, 0.0);
        v6 = v19;
        v8 = v20;
        v10 = v21;
        v12 = v22;

      }
      v13 = [UICollectionViewControllerWrapperView alloc];
    }
    else
    {
      v13 = [UICollectionViewControllerWrapperView alloc];
      -[UIViewController _screen](self, "_screen");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_applicationFrame");
      v6 = v14;
      v8 = v15;
      v10 = v16;
      v12 = v17;
    }
    v3 = -[UIView initWithFrame:](v13, "initWithFrame:", v6, v8, v10, v12);

    -[UIView setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
  }
  return v3;
}

- (void)__viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UICollectionViewController;
  -[UIViewController __viewWillAppear:](&v9, sel___viewWillAppear_);
  -[UICollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController _existingView](self, "_existingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isMemberOfClass:", objc_opt_class())
    && -[UICollectionViewController useLayoutToLayoutNavigationTransitions](self, "useLayoutToLayoutNavigationTransitions"))
  {
    -[UICollectionViewController _updateCollectionViewLayoutAndDelegate:](self, "_updateCollectionViewLayoutAndDelegate:", v5);
  }
  if (objc_msgSend(v5, "numberOfSections"))
  {
    if ((*(_BYTE *)&self->_collectionViewControllerFlags & 1) != 0
      && (objc_msgSend(v5, "allowsMultipleSelection") & 1) == 0
      && (*(_BYTE *)&self->_collectionViewControllerFlags & 2) == 0)
    {
      if (dyld_program_sdk_at_least())
      {
        objc_msgSend(v5, "indexPathsForSelectedItems");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewController transitionCoordinator](self, "transitionCoordinator");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_deselectItemsAtIndexPaths:animated:transitionCoordinator:", v7, v3, v8);

      }
      else
      {
        objc_msgSend(v5, "_deselectAllAnimated:notifyDelegate:", 1, 0);
      }
    }
  }
  else
  {
    objc_msgSend(v5, "reloadData");
  }

}

- (UICollectionViewController)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
{
  UICollectionViewLayout *v5;
  UICollectionViewController *v6;
  UICollectionViewController *v7;
  objc_super v9;

  v5 = layout;
  v9.receiver = self;
  v9.super_class = (Class)UICollectionViewController;
  v6 = -[UIViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_layout, layout);
    *(_BYTE *)&v7->_collectionViewControllerFlags |= 1u;
    *(_BYTE *)&v7->_collectionViewControllerFlags |= 4u;
  }

  return v7;
}

- (id)_newCollectionViewWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  UICollectionView *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  v9 = -[UICollectionView initWithFrame:collectionViewLayout:]([UICollectionView alloc], "initWithFrame:collectionViewLayout:", v8, x, y, width, height);

  return v9;
}

- (void)setClearsSelectionOnViewWillAppear:(BOOL)clearsSelectionOnViewWillAppear
{
  *(_BYTE *)&self->_collectionViewControllerFlags = *(_BYTE *)&self->_collectionViewControllerFlags & 0xFE | clearsSelectionOnViewWillAppear;
}

- (UICollectionViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewController;
  return -[UIViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, nibNameOrNil, nibBundleOrNil);
}

- (void)setInstallsStandardGestureForInteractiveMovement:(BOOL)installsStandardGestureForInteractiveMovement
{
  char v4;
  UILongPressGestureRecognizer *reorderingGesture;

  if (installsStandardGestureForInteractiveMovement)
    v4 = 4;
  else
    v4 = 0;
  *(_BYTE *)&self->_collectionViewControllerFlags = *(_BYTE *)&self->_collectionViewControllerFlags & 0xFB | v4;
  if (installsStandardGestureForInteractiveMovement)
  {
    -[UICollectionViewController _installReorderingGestureIfNecessary](self, "_installReorderingGestureIfNecessary");
  }
  else if (self->_reorderingGesture)
  {
    -[UIView removeGestureRecognizer:](self->_collectionView, "removeGestureRecognizer:");
    reorderingGesture = self->_reorderingGesture;
    self->_reorderingGesture = 0;

  }
}

- (void)setUseLayoutToLayoutNavigationTransitions:(BOOL)useLayoutToLayoutNavigationTransitions
{
  -[UICollectionViewController _setUseLayoutToLayoutNavigationTransitions:withCheck:](self, "_setUseLayoutToLayoutNavigationTransitions:withCheck:", useLayoutToLayoutNavigationTransitions, 1);
}

- (void)_setUseLayoutToLayoutNavigationTransitions:(BOOL)a3 withCheck:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  if (!a4)
  {
    -[UICollectionViewController useLayoutToLayoutNavigationTransitions](self, "useLayoutToLayoutNavigationTransitions");
    goto LABEL_9;
  }
  -[UIViewController parentViewController](self, "parentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    -[UIViewController _existingView](self, "_existingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Attempt to change the layout to layout transitions property of %@ which is a child view controller or in the window hierarchy"), self);
LABEL_7:
  if (-[UICollectionViewController useLayoutToLayoutNavigationTransitions](self, "useLayoutToLayoutNavigationTransitions") != v4)-[UICollectionViewController setView:](self, "setView:", 0);
LABEL_9:
  -[UIViewController _setUsesSharedView:](self, "_setUsesSharedView:", v4);
  if (v4)
    v9 = 2;
  else
    v9 = 0;
  *(_BYTE *)&self->_collectionViewControllerFlags = *(_BYTE *)&self->_collectionViewControllerFlags & 0xFD | v9;
}

- (UICollectionViewController)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UICollectionViewController *v5;
  UICollectionViewController *v6;
  char v7;
  objc_super v9;

  v4 = coder;
  v9.receiver = self;
  v9.super_class = (Class)UICollectionViewController;
  v5 = -[UIViewController initWithCoder:](&v9, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    *(_BYTE *)&v5->_collectionViewControllerFlags |= 1u;
    *(_BYTE *)&v5->_collectionViewControllerFlags |= 4u;
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIClearsSelectionOnViewWillAppear")))
      *(_BYTE *)&v6->_collectionViewControllerFlags = *(_BYTE *)&v6->_collectionViewControllerFlags & 0xFE | -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIClearsSelectionOnViewWillAppear"));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIInstallsStandardReorderingGesture")))
    {
      if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIInstallsStandardReorderingGesture")))
        v7 = 4;
      else
        v7 = 0;
      *(_BYTE *)&v6->_collectionViewControllerFlags = *(_BYTE *)&v6->_collectionViewControllerFlags & 0xFB | v7;
    }
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_keyboardSupport)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_keyboardSupport);

  }
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewController;
  -[UIViewController dealloc](&v4, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  char collectionViewControllerFlags;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewController;
  -[UIViewController encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  collectionViewControllerFlags = (char)self->_collectionViewControllerFlags;
  if ((collectionViewControllerFlags & 1) == 0)
  {
    objc_msgSend(v4, "encodeBool:forKey:", 0, CFSTR("UIClearsSelectionOnViewWillAppear"));
    collectionViewControllerFlags = (char)self->_collectionViewControllerFlags;
  }
  if ((collectionViewControllerFlags & 4) == 0)
    objc_msgSend(v4, "encodeBool:forKey:", 0, CFSTR("UIInstallsStandardReorderingGesture"));

}

- (BOOL)clearsSelectionOnViewWillAppear
{
  return *(_BYTE *)&self->_collectionViewControllerFlags & 1;
}

- (void)_setSharedCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (void)_clearSharedView
{
  void *v3;

  -[UIViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[UIViewController _setUsesSharedView:](self, "_setUsesSharedView:", 0);
    -[UICollectionViewController setView:](self, "setView:", 0);
  }
}

- (void)viewWillUnload
{
  void *v3;
  UICollectionViewLayout *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewController;
  -[UIViewController viewWillUnload](&v5, sel_viewWillUnload);
  -[UICollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v4 = (UICollectionViewLayout *)objc_claimAutoreleasedReturnValue();

  if (v4 != self->_layout)
    objc_storeStrong((id *)&self->_layout, v4);

}

- (void)_updateCollectionViewLayoutAndDelegate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  UICollectionViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  -[UIViewController transitionCoordinator](self, "transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "viewControllerForKey:", CFSTR("UITransitionContextFromViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self;
    objc_msgSend(v6, "_uiCollectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewController _uiCollectionView](v7, "_uiCollectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != v9)
      goto LABEL_3;
    if (-[UIViewController _usesSharedView](v7, "_usesSharedView"))
    {

      goto LABEL_8;
    }
    if ((objc_msgSend(v6, "_usesSharedView") & 1) != 0)
    {
      objc_msgSend(v6, "navigationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "lastOperation");

      if (v12 != 1)
        goto LABEL_8;
    }
    else
    {
LABEL_3:

    }
  }
  objc_msgSend(v13, "setCollectionViewLayout:", self->_layout);
  objc_msgSend(v13, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    objc_msgSend(v13, "setDelegate:", self);
LABEL_8:

}

- (id)_shim_contentScrollView
{
  void *v4;
  void *v5;
  void *v7;

  if ((_UIBarsApplyChromelessEverywhere() & 1) != 0 || _UIViewControllerUseContentScrollViewAPI())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewController.m"), 429, CFSTR("Unexpected code path for compatibility code only"));

  }
  -[UIViewController _existingView](self, "_existingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UICollectionViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)dataSource
{
  void *v3;
  char v4;
  void *v5;
  UICollectionViewController *v6;

  if (dyld_program_sdk_at_least()
    && (-[UICollectionViewController collectionView](self, "collectionView"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "_isConnectedToDiffableDataSource"),
        v3,
        (v4 & 1) != 0))
  {
    -[UICollectionViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataSource");
    v6 = (UICollectionViewController *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = self;
  }
  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return 0;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  id v5;

  v5 = a3;
  if (dyld_program_sdk_at_least() && objc_msgSend(v5, "isEditing"))
    -[UICollectionViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);

}

- (id)_animatorForOperation:(int64_t)a3 fromViewController:(id)a4 toViewController:(id)a5
{
  id v8;
  id v9;
  UICollectionView *v10;
  UICollectionView *collectionView;
  void *v12;

  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v8, "collectionView"),
        v10 = (UICollectionView *)objc_claimAutoreleasedReturnValue(),
        collectionView = self->_collectionView,
        v10,
        v10 == collectionView))
  {
    +[_UICollectionViewControllerLayoutToLayoutTransition transitionForOperation:fromViewController:toViewController:](_UICollectionViewControllerLayoutToLayoutTransition, "transitionForOperation:fromViewController:toViewController:", a3, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)shouldCrossFadeNavigationBar
{
  return 1;
}

- (BOOL)shouldCrossFadeBottomBars
{
  return 1;
}

- (id)preferredFocusedView
{
  return self->_collectionView;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  int v8;
  void *v9;
  objc_super v10;
  _QWORD v11[5];
  BOOL v12;

  v4 = a4;
  v5 = a3;
  -[UICollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "canBeEdited");

  if (v8)
  {
    if (v4)
    {
      -[UICollectionViewController collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setEditing:", v5);

    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __50__UICollectionViewController_setEditing_animated___block_invoke;
      v11[3] = &unk_1E16B1B78;
      v11[4] = self;
      v12 = v5;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v11);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)UICollectionViewController;
  -[UIViewController setEditing:animated:](&v10, sel_setEditing_animated_, v5, v4);
}

void __50__UICollectionViewController_setEditing_animated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEditing:", *(unsigned __int8 *)(a1 + 40));

}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;

  y = a4.y;
  x = a4.x;
  v8 = a3;
  if (-[UICollectionViewController _shouldRespondToPreviewingMethods](self, "_shouldRespondToPreviewingMethods"))
  {
    objc_msgSend(v8, "sourceView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewController previewViewControllerForLocation:inSourceView:](self, "previewViewControllerForLocation:inSourceView:", v9, x, y);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "doesNotRecognizeSelector:", a2);
    v10 = 0;
  }

  return v10;
}

- (void)previewingContext:(id)a3 commitViewController:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a4;
  if (-[UICollectionViewController _shouldRespondToPreviewingMethods](self, "_shouldRespondToPreviewingMethods"))
  {
    v6 = v8;
    v7 = v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UICollectionViewController committedViewControllerForPreviewViewController:](self, "committedViewControllerForPreviewViewController:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (!v7)
        v7 = v6;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UICollectionViewController commitPreviewViewController:committedViewController:](self, "commitPreviewViewController:committedViewController:", v6, v7);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UICollectionViewController commitPreviewViewController:](self, "commitPreviewViewController:", v6);
    }

  }
  else
  {
    -[UIResponder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }

}

- (id)previewViewControllerForItemAtIndexPath:(id)a3
{
  return 0;
}

- (id)previewViewControllerForLocation:(CGPoint)a3 inSourceView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[UICollectionViewController _shouldRespondToPreviewingMethods](self, "_shouldRespondToPreviewingMethods"))
  {
    -[UICollectionViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "convertPoint:fromView:", v7, x, y);
    objc_msgSend(v8, "indexPathForItemAtPoint:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewController previewViewControllerForItemAtIndexPath:](self, "previewViewControllerForItemAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)willPresentPreviewViewController:(id)a3 forLocation:(CGPoint)a4 inSourceView:(id)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  y = a4.y;
  x = a4.x;
  v14 = a3;
  v9 = a5;
  if (-[UICollectionViewController _shouldRespondToPreviewingMethods](self, "_shouldRespondToPreviewingMethods"))
  {
    -[UICollectionViewController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "convertPoint:fromView:", v9, x, y);
    objc_msgSend(v10, "indexPathForItemAtPoint:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cellForItemAtIndexPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "presentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSourceView:", v12);
    objc_msgSend(v12, "bounds");
    objc_msgSend(v13, "setSourceRect:");
    -[UICollectionViewController willPresentPreviewViewController:forItemAtIndexPath:](self, "willPresentPreviewViewController:forItemAtIndexPath:", v14, v11);

  }
}

- (BOOL)installsStandardGestureForInteractiveMovement
{
  return (*(_BYTE *)&self->_collectionViewControllerFlags >> 2) & 1;
}

- (void)_handleReorderingGesture:(id)a3
{
  UICollectionView *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  UICollectionView *v11;

  v9 = a3;
  v4 = self->_collectionView;
  switch(objc_msgSend(v9, "state"))
  {
    case 1:
      objc_msgSend(v9, "startPoint");
      -[UICollectionView indexPathForItemAtPoint:](v4, "indexPathForItemAtPoint:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[UICollectionView beginInteractiveMovementForItemAtIndexPath:](v4, "beginInteractiveMovementForItemAtIndexPath:", v5);
        -[UICollectionView contextMenuInteraction](v4, "contextMenuInteraction");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "_hasVisibleMenu");

        if (v7)
        {
          -[UICollectionView contextMenuInteraction](v4, "contextMenuInteraction");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "dismissMenu");
        }
        else
        {
          v10[0] = MEMORY[0x1E0C809B0];
          v10[1] = 3221225472;
          v10[2] = __55__UICollectionViewController__handleReorderingGesture___block_invoke;
          v10[3] = &unk_1E16B1B28;
          v11 = v4;
          +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10);
          v8 = v11;
        }

      }
      break;
    case 2:
      if (-[UICollectionView _isReordering](v4, "_isReordering"))
      {
        objc_msgSend(v9, "locationInView:", v4);
        -[UICollectionView updateInteractiveMovementTargetPosition:](v4, "updateInteractiveMovementTargetPosition:");
      }
      else
      {
        objc_msgSend(v9, "setEnabled:", 0);
        objc_msgSend(v9, "setEnabled:", 1);
      }
      break;
    case 3:
      -[UICollectionView endInteractiveMovement](v4, "endInteractiveMovement");
      break;
    case 4:
      -[UICollectionView cancelInteractiveMovement](v4, "cancelInteractiveMovement");
      break;
    default:
      break;
  }

}

void __55__UICollectionViewController__handleReorderingGesture___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "subviews", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "removeFromSuperview");
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  BOOL v7;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  if (self->_reorderingGesture == a3
    && (-[UICollectionView contextMenuInteraction](self->_collectionView, "contextMenuInteraction"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    -[UICollectionView contextMenuInteraction](self->_collectionView, "contextMenuInteraction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_gestureRecognizerForBeginningDragRelationships");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11 == v6)
    {
      v7 = 1;
    }
    else
    {
      -[UIViewController traitCollection](self, "traitCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "userInterfaceIdiom") == 6)
      {
        -[UICollectionView contextMenuInteraction](self->_collectionView, "contextMenuInteraction");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "gestureRecognizerForFailureRelationships");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        v7 = v14 == v6;

      }
      else
      {
        v7 = 0;
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return self->_reorderingGesture != a3
      || -[UICollectionView _canBeginReorderingItem](self->_collectionView, "_canBeginReorderingItem");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardSupport, 0);
  objc_storeStrong((id *)&self->_reorderingGesture, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
