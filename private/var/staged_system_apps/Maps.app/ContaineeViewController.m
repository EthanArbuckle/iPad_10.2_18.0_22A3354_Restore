@implementation ContaineeViewController

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 0;
}

+ (float)contentViewBottomConstraintPriority
{
  return 1000.0;
}

+ (float)contentViewTopConstraintPriority
{
  return 1000.0;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  BOOL v9;
  void *v10;
  UIVisualEffectView *v11;
  uint64_t v12;
  UIVisualEffectView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIVisualEffectView *effectView;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ContaineeViewController;
  -[ContaineeViewController viewWillAppear:](&v19, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v4, "grabberSafeAreaHeight");
  -[NSLayoutConstraint setConstant:](self->_homeIndicatorSafeAreaHeightConstraint, "setConstant:");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v6 = objc_msgSend(v5, "usingSheetPresentation");

  if (-[ContainerViewController delaysFirstCardPresentation]_0())
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v8 = objc_msgSend(v7, "wantsFullscreen");

  }
  else
  {
    v8 = 0;
  }
  if (self->_effectView)
    v9 = 1;
  else
    v9 = (v6 | v8) == 0;
  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v11 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue(+[MapsTheme visualEffectViewAllowingBlur:](MapsTheme, "visualEffectViewAllowingBlur:", objc_msgSend(v10, "blurInCardView")));

    v12 = objc_opt_class(NonVisualEffectView);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      v13 = v11;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cardColor"));
      -[UIVisualEffectView setCustomBackgroundColor:](v13, "setCustomBackgroundColor:", v15);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController view](self, "view"));
    objc_msgSend(v16, "addSubview:", v11);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController view](self, "view"));
    objc_msgSend(v17, "sendSubviewToBack:", v11);

    effectView = self->_effectView;
    self->_effectView = v11;

    -[ContaineeViewController _updateBlurCornerRadius](self, "_updateBlurCornerRadius");
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  unsigned int v9;
  _QWORD v10[5];
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ContaineeViewController;
  -[ContaineeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v9 = objc_msgSend(v8, "usingSheetPresentation");

  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100960860;
    v10[3] = &unk_1011AEDC8;
    v10[4] = self;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v10, 0);
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ContaineeViewController;
  -[ContaineeViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  self->_retainedLayout = (unint64_t)objc_msgSend(v4, "containeeLayout");

}

- (void)_updateBlurCornerRadius
{
  void *v3;
  id v4;
  uint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v4 = objc_msgSend(v3, "containerStyle");

  if (v4 == (id)6)
    v5 = 15;
  else
    v5 = 3;
  -[UIVisualEffectView _setCornerRadius:continuous:maskedCorners:](self->_effectView, "_setCornerRadius:continuous:maskedCorners:", 1, v5, _UISheetCornerRadius);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double y;
  double width;
  double height;
  UIView *v11;
  UIView *defaultContentView;
  void *v13;
  void *v14;
  void *v15;
  UIView *v16;
  UIView *defaultHeaderView;
  void *v18;
  void *v19;
  MKViewWithHairline *v20;
  MKViewWithHairline *homeIndicatorSafeAreaView;
  void *v22;
  void *v23;
  NSDictionary *v24;
  void *v25;
  id v26;
  void *v27;
  NSLayoutConstraint *v28;
  NSLayoutConstraint *homeIndicatorSafeAreaHeightConstraint;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  int v34;
  int v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  objc_super v42;
  _QWORD v43[2];
  _QWORD v44[2];

  v42.receiver = self;
  v42.super_class = (Class)ContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v42, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController view](self, "view"));
  objc_msgSend(v3, "setLayoutMargins:", 0.0, 16.0, 0.0, 16.0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController view](self, "view"));
  objc_msgSend(v4, "setPreservesSuperviewLayoutMargins:", 0);

  -[ContaineeViewController setViewRespectsSystemMinimumLayoutMargins:](self, "setViewRespectsSystemMinimumLayoutMargins:", 0);
  if (objc_msgSend((id)objc_opt_class(self), "wantsDefaultHeaderContentViews"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController view](self, "view"));
    objc_msgSend(v6, "setBackgroundColor:", v5);

    v7 = objc_alloc((Class)UIView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v11 = (UIView *)objc_msgSend(v7, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    defaultContentView = self->_defaultContentView;
    self->_defaultContentView = v11;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_defaultContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_defaultContentView, "layer"));
    objc_msgSend(v13, "setAllowsGroupOpacity:", 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIView setBackgroundColor:](self->_defaultContentView, "setBackgroundColor:", v14);

    -[UIView setPreservesSuperviewLayoutMargins:](self->_defaultContentView, "setPreservesSuperviewLayoutMargins:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController view](self, "view"));
    objc_msgSend(v15, "addSubview:", self->_defaultContentView);

    v16 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    defaultHeaderView = self->_defaultHeaderView;
    self->_defaultHeaderView = v16;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_defaultHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIView setBackgroundColor:](self->_defaultHeaderView, "setBackgroundColor:", v18);

    -[UIView setPreservesSuperviewLayoutMargins:](self->_defaultHeaderView, "setPreservesSuperviewLayoutMargins:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController view](self, "view"));
    objc_msgSend(v19, "addSubview:", self->_defaultHeaderView);

    v20 = (MKViewWithHairline *)objc_msgSend(objc_alloc((Class)MKViewWithHairline), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    homeIndicatorSafeAreaView = self->_homeIndicatorSafeAreaView;
    self->_homeIndicatorSafeAreaView = v20;

    -[MKViewWithHairline setTranslatesAutoresizingMaskIntoConstraints:](self->_homeIndicatorSafeAreaView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKViewWithHairline setBottomHairlineHidden:](self->_homeIndicatorSafeAreaView, "setBottomHairlineHidden:", 1);
    -[MKViewWithHairline setTopHairlineHidden:](self->_homeIndicatorSafeAreaView, "setTopHairlineHidden:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MKViewWithHairline setBackgroundColor:](self->_homeIndicatorSafeAreaView, "setBackgroundColor:", v22);

    -[MKViewWithHairline setPreservesSuperviewLayoutMargins:](self->_homeIndicatorSafeAreaView, "setPreservesSuperviewLayoutMargins:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController view](self, "view"));
    objc_msgSend(v23, "addSubview:", self->_homeIndicatorSafeAreaView);

    v24 = _NSDictionaryOfVariableBindings(CFSTR("_defaultHeaderView, _defaultContentView, _homeIndicatorSafeAreaView"), self->_defaultHeaderView, self->_defaultContentView, self->_homeIndicatorSafeAreaView, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = objc_alloc_init((Class)NSMutableArray);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MKViewWithHairline heightAnchor](self->_homeIndicatorSafeAreaView, "heightAnchor"));
    v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToConstant:", 0.0));
    homeIndicatorSafeAreaHeightConstraint = self->_homeIndicatorSafeAreaHeightConstraint;
    self->_homeIndicatorSafeAreaHeightConstraint = v28;

    objc_msgSend(v26, "addObject:", self->_homeIndicatorSafeAreaHeightConstraint);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-0-[_defaultHeaderView]-0-|"), 0, 0, v25));
    objc_msgSend(v26, "addObjectsFromArray:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-0-[_defaultContentView]-0-|"), 0, 0, v25));
    objc_msgSend(v26, "addObjectsFromArray:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-0-[_homeIndicatorSafeAreaView]-0-|"), 0, 0, v25));
    objc_msgSend(v26, "addObjectsFromArray:", v32);

    objc_msgSend((id)objc_opt_class(self), "contentViewBottomConstraintPriority");
    v34 = v33;
    objc_msgSend((id)objc_opt_class(self), "contentViewTopConstraintPriority");
    LODWORD(y) = v35;
    v43[0] = CFSTR("bp");
    LODWORD(v36) = v34;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v36));
    v43[1] = CFSTR("tp");
    v44[0] = v37;
    LODWORD(v38) = LODWORD(y);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v38));
    v44[1] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v43, 2));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0-[_defaultHeaderView]-0@tp-[_defaultContentView]-0-[_homeIndicatorSafeAreaView]-0@bp-|"), 0, v40, v25));
    objc_msgSend(v26, "addObjectsFromArray:", v41);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);
  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ContaineeViewController;
  -[ContaineeViewController viewDidLayoutSubviews](&v8, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  -[UIVisualEffectView setFrame:](self->_effectView, "setFrame:");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v5 = objc_msgSend(v4, "usingSheetPresentation");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v6, "sheetContentSize");
    -[ContaineeViewController setPreferredContentSize:](self, "setPreferredContentSize:");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v7, "contentAlpha");
  -[ContaineeViewController applyAlphaToContent:](self, "applyAlphaToContent:");

}

- (int64_t)preferredUserInterfaceStyle
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "containerViewController"));
  v4 = objc_msgSend(v3, "preferredUserInterfaceStyle");

  return (int64_t)v4;
}

- (double)macContaineeWidth
{
  return 282.0;
}

- (void)setCardColor:(id)a3
{
  UIVisualEffectView *effectView;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_cardColor, a3);
  effectView = self->_effectView;
  v6 = objc_opt_class(NonVisualEffectView);
  if ((objc_opt_isKindOfClass(effectView, v6) & 1) != 0)
    -[UIVisualEffectView setCustomBackgroundColor:](self->_effectView, "setCustomBackgroundColor:", v7);

}

- (double)heightForLayout:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double result;
  void *v10;
  double v11;
  double v12;
  double v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  if (objc_msgSend(v5, "takesAvailableHeight"))
  {

    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4)
      goto LABEL_6;
  }
  else
  {

  }
  if (a3 - 3 < 3)
  {
LABEL_6:
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v6, "availableHeight");
    v8 = v7;

    return v8;
  }
  if (a3 != 2)
  {
    v8 = -1.0;
    if (a3 == 1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v10, "bottomSafeOffset");
      v12 = v11;
      -[ContaineeViewController headerHeight](self, "headerHeight");
      v8 = v12 + v13;

    }
    return v8;
  }
  sub_1005EC2E4();
  return result;
}

- (void)applyAlphaToContent:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v4, "setAlpha:", a3);

}

- (BOOL)forceCurrentWidthForHeaderHeightCalculations
{
  return 0;
}

- (double)headerHeight
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  CGRect v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));

  if (v3)
  {
    v4 = -[ContaineeViewController forceCurrentWidthForHeaderHeightCalculations](self, "forceCurrentWidthForHeaderHeightCalculations");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v6 = v5;
    if (v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController view](self, "view"));
      objc_msgSend(v7, "bounds");
      objc_msgSend(v6, "_maps_compressedSizeForWidth:withBlock:", 0, CGRectGetWidth(v14));
      v9 = v8;

    }
    else
    {
      objc_msgSend(v5, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
      v9 = v10;
    }

    if (v9 == 0.0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
      objc_msgSend(v11, "intrinsicContentSize");
      v9 = v12;

    }
  }
  else
  {
    v9 = 0.0;
  }
  return fmax(v9, 60.0);
}

- (id)headerView
{
  return self->_defaultHeaderView;
}

- (id)contentView
{
  return self->_defaultContentView;
}

- (void)handleDismissAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController containeeDelegate](self, "containeeDelegate"));
  objc_msgSend(v5, "containeeViewControllerGoToPreviousState:withSender:", self, v4);

}

- (BOOL)shouldCollapseOnMapGesture
{
  return 1;
}

- (void)didChangeLayout:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("ContaineeViewControllerLayoutDidChangeNotification"), self);

}

- (void)didChangeContainerStyle:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", a3));
  objc_msgSend(v4, "updateGrabber");

  -[ContaineeViewController _updateBlurCornerRadius](self, "_updateBlurCornerRadius");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v5, "updateDimmingBehavior");

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v6, "grabberSafeAreaHeight");
  -[NSLayoutConstraint setConstant:](self->_homeIndicatorSafeAreaHeightConstraint, "setConstant:");

}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", UIKeyInputEscape, 0, "handleDismissAction:"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (CardPresentationController)cardPresentationController
{
  CardPresentationController *cardPresentationController;
  CardPresentationController *v4;
  CardPresentationController *v5;

  cardPresentationController = self->_cardPresentationController;
  if (!cardPresentationController)
  {
    v4 = -[CardPresentationController initWithViewController:]([CardPresentationController alloc], "initWithViewController:", self);
    v5 = self->_cardPresentationController;
    self->_cardPresentationController = v4;

    cardPresentationController = self->_cardPresentationController;
  }
  return cardPresentationController;
}

- (MacMenuPresentationController)macMenuPresentationController
{
  MacMenuPresentationController *menuPresentationController;
  MacMenuPresentationController *v4;
  MacMenuPresentationController *v5;

  menuPresentationController = self->_menuPresentationController;
  if (!menuPresentationController)
  {
    v4 = -[MacMenuPresentationController initWithContaineeViewController:]([MacMenuPresentationController alloc], "initWithContaineeViewController:", self);
    v5 = self->_menuPresentationController;
    self->_menuPresentationController = v4;

    menuPresentationController = self->_menuPresentationController;
  }
  return menuPresentationController;
}

- (MacPopoverPresentationController)macPopoverPresentationController
{
  MacPopoverPresentationController *popoverPresentationController;
  MacPopoverPresentationController *v4;
  MacPopoverPresentationController *v5;

  popoverPresentationController = self->_popoverPresentationController;
  if (!popoverPresentationController)
  {
    v4 = -[MacPopoverPresentationController initWithContaineeViewController:]([MacPopoverPresentationController alloc], "initWithContaineeViewController:", self);
    v5 = self->_popoverPresentationController;
    self->_popoverPresentationController = v4;

    popoverPresentationController = self->_popoverPresentationController;
  }
  return popoverPresentationController;
}

- (unint64_t)preferredPresentationStyle
{
  return self->_preferredPresentationStyle;
}

- (void)setPreferredPresentationStyle:(unint64_t)a3
{
  self->_preferredPresentationStyle = a3;
}

- (unint64_t)retainedLayout
{
  return self->_retainedLayout;
}

- (BOOL)keepOriginalSafeInsets
{
  return self->_keepOriginalSafeInsets;
}

- (void)setKeepOriginalSafeInsets:(BOOL)a3
{
  self->_keepOriginalSafeInsets = a3;
}

- (ContaineeViewControllerDelegate)containeeDelegate
{
  return (ContaineeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_containeeDelegate);
}

- (void)setContaineeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_containeeDelegate, a3);
}

- (UIColor)cardColor
{
  return self->_cardColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardColor, 0);
  objc_destroyWeak((id *)&self->_containeeDelegate);
  objc_storeStrong((id *)&self->_homeIndicatorSafeAreaHeightConstraint, 0);
  objc_storeStrong((id *)&self->_homeIndicatorSafeAreaView, 0);
  objc_storeStrong((id *)&self->_defaultContentView, 0);
  objc_storeStrong((id *)&self->_defaultHeaderView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_popoverPresentationController, 0);
  objc_storeStrong((id *)&self->_menuPresentationController, 0);
  objc_storeStrong((id *)&self->_cardPresentationController, 0);
}

@end
