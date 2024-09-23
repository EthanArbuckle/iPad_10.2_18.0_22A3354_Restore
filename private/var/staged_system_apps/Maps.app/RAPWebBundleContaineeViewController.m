@implementation RAPWebBundleContaineeViewController

- (RAPWebBundleContaineeViewController)initWithReport:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  RAPWebBundleContaineeViewController *v9;
  RAPWebBundleContaineeViewController *v10;
  RAPWebBundleHomeViewController *v11;
  RAPWebBundleHomeViewController *contentViewController;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RAPWebBundleContaineeViewController;
  v9 = -[RAPWebBundleContaineeViewController init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_report, a3);
    v11 = -[RAPWebBundleHomeViewController initWithReport:completion:]([RAPWebBundleHomeViewController alloc], "initWithReport:completion:", v7, v8);
    contentViewController = v10->_contentViewController;
    v10->_contentViewController = v11;

    -[RAPWebBundleBaseViewController setDelegate:](v10->_contentViewController, "setDelegate:", v10);
    -[ContaineeViewController setKeepOriginalSafeInsets:](v10, "setKeepOriginalSafeInsets:", 1);
  }

  return v10;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RAPWebBundleContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v3, "viewDidLoad");
  -[RAPWebBundleContaineeViewController _setupViews](self, "_setupViews");
  -[RAPWebBundleContaineeViewController _setupConstraints](self, "_setupConstraints");
  -[RAPWebBundleContaineeViewController updatePreferredContentSize](self, "updatePreferredContentSize");
  -[RAPWebBundleContaineeViewController setModalInPresentation:](self, "setModalInPresentation:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RAPWebBundleContaineeViewController;
  -[ContaineeViewController viewWillAppear:](&v7, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_keyboardAboutToShow:", UIKeyboardWillShowNotification, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_keyboardAboutToHide:", UIKeyboardWillHideNotification, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "_keyboardAboutToChangeFrame:", UIKeyboardWillChangeFrameNotification, 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RAPWebBundleContaineeViewController;
  -[RAPWebBundleContaineeViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

}

- (id)_backgroundColorForModalFormSheet
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleContaineeViewController theme](self, "theme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "backgroundColorForModalFormSheet"));

  return v3;
}

- (void)_setupViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UINavigationController *v7;
  void *v8;
  void *v9;
  void *v10;
  UINavigationController *navController;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "setPresentedModally:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v4, "setTakesAvailableHeight:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v5, "setAllowsSwipeToDismiss:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v6, "setDefaultContaineeLayout:", 5);

  v7 = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", self->_contentViewController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](v7, "view"));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[RAPWebBundleContaineeViewController addChildViewController:](self, "addChildViewController:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleContaineeViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](v7, "view"));
  objc_msgSend(v9, "addSubview:", v10);

  -[UINavigationController didMoveToParentViewController:](v7, "didMoveToParentViewController:", self);
  navController = self->_navController;
  self->_navController = v7;

  -[RAPWebBundleContaineeViewController _setInitialCardHeightIfNeeded](self, "_setInitialCardHeightIfNeeded");
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_navController, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleContaineeViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v24[0] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_navController, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleContaineeViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v24[1] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_navController, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleContaineeViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  v24[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_navController, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleContaineeViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v24[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)_setInitialCardHeightIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  if (!-[RAPWebBundleContaineeViewController _supportsFullHeightCardsOnly](self, "_supportsFullHeightCardsOnly"))
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dictionaryForKey:", CFSTR("RAPInlineCardHeightDictionary")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleContaineeViewController webBundleQuestion](self, "webBundleQuestion"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "questionTypeAsString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v5));

    if (v6)
      objc_msgSend(v6, "doubleValue");
    else
      v7 = 160.0;
    -[RAPWebBundleContaineeViewController updateCardHeight:](self, "updateCardHeight:", v7);

  }
}

- (id)webBundleQuestion
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport initialQuestion](self->_report, "initialQuestion"));
  v4 = objc_opt_class(RAPWebBundleQuestion);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport initialQuestion](self->_report, "initialQuestion"));
  else
    v6 = 0;
  return v6;
}

- (double)heightForLayout:(unint64_t)a3
{
  double result;
  void *v5;
  double v6;
  double v7;
  double v8;
  double cardContentsHeight;
  double keyboardHeight;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;

  result = -1.0;
  if (a3 == 5)
  {
    if (-[RAPWebBundleContaineeViewController _supportsFullHeightCardsOnly](self, "_supportsFullHeightCardsOnly", -1.0)
      || self->_cardContentsHeight <= 0.0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v11, "availableHeight");
      v13 = v12;

      return v13;
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController navigationBar](self->_navController, "navigationBar"));
      objc_msgSend(v5, "frame");
      v7 = v6;

      v8 = 470.0 - v7;
      cardContentsHeight = self->_cardContentsHeight;
      if (self->_keyboardShown)
      {
        keyboardHeight = self->_keyboardHeight;
        if (cardContentsHeight + keyboardHeight < v8)
          cardContentsHeight = v8 - keyboardHeight;
      }
      else
      {
        if (cardContentsHeight < v8)
          cardContentsHeight = 470.0 - v7;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
        objc_msgSend(v14, "bottomSafeOffset");
        cardContentsHeight = cardContentsHeight + v15;

      }
      return v7 + cardContentsHeight;
    }
  }
  return result;
}

- (BOOL)_supportsFullHeightCardsOnly
{
  void *v3;
  BOOL v4;

  if (sub_1002A8AA0(self) && sub_1002A8AA0(self) != 5)
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleContaineeViewController webBundleQuestion](self, "webBundleQuestion"));
  v4 = (char *)objc_msgSend(v3, "questionType") - 21 < (char *)0xFFFFFFFFFFFFFFF8;

  return v4;
}

- (void)didDismissByGesture
{
  -[RAPWebBundleHomeViewController didDismissByGesture](self->_contentViewController, "didDismissByGesture");
}

- (void)enableDismissByGesture:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[RAPWebBundleContaineeViewController setModalInPresentation:](self, "setModalInPresentation:", !a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v5, "setAllowsSwipeToDismiss:", v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleContaineeViewController presentationController](self, "presentationController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));

  if (!v7)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[RAPWebBundleContaineeViewController presentationController](self, "presentationController"));
    objc_msgSend(v8, "setDelegate:", self);

  }
}

- (void)updateCardHeight:(double)a3
{
  void *v4;

  if (self->_cardContentsHeight != a3)
  {
    self->_cardContentsHeight = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v4, "updateHeightForCurrentLayoutAnimated:", 1);

    -[RAPWebBundleContaineeViewController updatePreferredContentSize](self, "updatePreferredContentSize");
  }
}

- (void)saveInitialCardHeight:(double)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  if (!-[RAPWebBundleContaineeViewController _supportsFullHeightCardsOnly](self, "_supportsFullHeightCardsOnly"))
  {
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dictionaryForKey:", CFSTR("RAPInlineCardHeightDictionary")));
    v6 = objc_msgSend(v5, "mutableCopy");
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = objc_alloc_init((Class)NSMutableDictionary);
    v9 = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleContaineeViewController webBundleQuestion](self, "webBundleQuestion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "questionTypeAsString"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v11));
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    if (v14 != a3)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleContaineeViewController webBundleQuestion](self, "webBundleQuestion"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "questionTypeAsString"));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v17);

      v18 = objc_msgSend(v9, "copy");
      objc_msgSend(v19, "setObject:forKey:", v18, CFSTR("RAPInlineCardHeightDictionary"));

    }
  }
}

- (void)updatePreferredContentSize
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  unsigned __int8 v12;
  double v13;
  RAPWebBundleHomeViewController *v14;
  uint64_t v15;
  RAPWebBundleHomeViewController *v16;
  RAPWebBundleHomeViewController *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double cardContentsHeight;
  double v25;

  if (sub_1002A8AA0(self) == 5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleContaineeViewController presentingViewController](self, "presentingViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
    objc_msgSend(v5, "bounds");
    v6 = 520.0;
    if (v7 < 520.0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleContaineeViewController presentingViewController](self, "presentingViewController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
      objc_msgSend(v10, "bounds");
      v6 = v11;

    }
    v12 = -[RAPWebBundleContaineeViewController _supportsFullHeightCardsOnly](self, "_supportsFullHeightCardsOnly");
    v13 = v6;
    if ((v12 & 1) == 0)
    {
      v14 = self->_contentViewController;
      v15 = objc_opt_class(MacRAPBaseViewController);
      if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        v16 = v14;
      else
        v16 = 0;
      v17 = v16;

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleHomeViewController headerView](v17, "headerView"));
      objc_msgSend(v18, "frame");
      v20 = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleHomeViewController footerView](v17, "footerView"));

      objc_msgSend(v21, "frame");
      v23 = v20 + v22;

      cardContentsHeight = 160.0 - v23;
      if (self->_cardContentsHeight >= 160.0 - v23)
        cardContentsHeight = self->_cardContentsHeight;
      v13 = v23 + cardContentsHeight;
    }
    if (v13 <= v6)
      v25 = v13;
    else
      v25 = v6;
    -[RAPWebBundleContaineeViewController setPreferredContentSize:](self, "setPreferredContentSize:", 390.0, v25);
  }
}

- (void)_handleKeyboardNotification:(id)a3 aboutToHide:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[9];

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", UIKeyboardFrameEndUserInfoKey));
    objc_msgSend(v13, "CGRectValue");
    x = v14;
    y = v15;
    width = v16;
    height = v17;

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", UIKeyboardAnimationDurationUserInfoKey));
  objc_msgSend(v19, "doubleValue");
  v21 = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", UIKeyboardAnimationCurveUserInfoKey));
  v24 = objc_msgSend(v23, "unsignedIntegerValue");

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1002C5040;
  v25[3] = &unk_1011AFFE8;
  v25[4] = self;
  *(CGFloat *)&v25[5] = x;
  *(CGFloat *)&v25[6] = y;
  *(CGFloat *)&v25[7] = width;
  *(CGFloat *)&v25[8] = height;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v24, v25, 0, v21, 0.0);

}

- (void)_keyboardAboutToShow:(id)a3
{
  self->_keyboardShown = 1;
  -[RAPWebBundleContaineeViewController _handleKeyboardNotification:aboutToHide:](self, "_handleKeyboardNotification:aboutToHide:", a3, 0);
}

- (void)_keyboardAboutToChangeFrame:(id)a3
{
  if (self->_keyboardShown)
    -[RAPWebBundleContaineeViewController _handleKeyboardNotification:aboutToHide:](self, "_handleKeyboardNotification:aboutToHide:", a3, 0);
}

- (void)_keyboardAboutToHide:(id)a3
{
  self->_keyboardShown = 0;
  -[RAPWebBundleContaineeViewController _handleKeyboardNotification:aboutToHide:](self, "_handleKeyboardNotification:aboutToHide:", a3, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_report, 0);
}

@end
