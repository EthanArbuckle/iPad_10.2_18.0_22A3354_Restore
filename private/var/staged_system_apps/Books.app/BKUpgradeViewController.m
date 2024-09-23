@implementation BKUpgradeViewController

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  int64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKUpgradeViewController traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "userInterfaceStyle") == (id)2;

  return v3;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (isPad(self, a2))
    return 30;
  else
    return 2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *activityView;
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
  objc_super v17;
  _QWORD v18[2];

  v17.receiver = self;
  v17.super_class = (Class)BKUpgradeViewController;
  -[BKUpgradeViewController viewDidLoad](&v17, "viewDidLoad");
  -[BKUpgradeViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKUpgradeViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  activityView = self->_activityView;
  self->_activityView = v5;

  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_activityView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIActivityIndicatorView setHidden:](self->_activityView, "setHidden:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKUpgradeViewController view](self, "view"));
  objc_msgSend(v7, "addSubview:", self->_activityView);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerXAnchor](self->_activityView, "centerXAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKUpgradeViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerXAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v18[0] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerYAnchor](self->_activityView, "centerYAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKUpgradeViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "centerYAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
  v18[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

  -[BKUpgradeViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_startAnimating", 0, 2.0);
}

- (BKUpgradeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  BKUpgradeViewController *v4;
  BKUpgradeViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKUpgradeViewController;
  v4 = -[BKUpgradeViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
    -[BKUpgradeViewController _setupSmartInvert](v4, "_setupSmartInvert");
  return v5;
}

- (void)_setupSmartInvert
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_smartInvertDidChange:", UIAccessibilityInvertColorsStatusDidChangeNotification, 0);

  -[BKUpgradeViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", -[BKUpgradeViewController _computedUserInterfaceStyle](self, "_computedUserInterfaceStyle"));
}

- (int64_t)_computedUserInterfaceStyle
{
  if (UIAccessibilityIsInvertColorsEnabled())
    return 2;
  else
    return 0;
}

- (BKUpgradeViewController)initWithCoder:(id)a3
{
  BKUpgradeViewController *v3;
  BKUpgradeViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKUpgradeViewController;
  v3 = -[BKUpgradeViewController initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[BKUpgradeViewController _setupSmartInvert](v3, "_setupSmartInvert");
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_startAnimating", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIAccessibilityInvertColorsStatusDidChangeNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)BKUpgradeViewController;
  -[BKUpgradeViewController dealloc](&v4, "dealloc");
}

- (void)_startAnimating
{
  -[UIActivityIndicatorView setHidden:](self->_activityView, "setHidden:", 0);
  -[UIActivityIndicatorView startAnimating](self->_activityView, "startAnimating");
}

- (void)_smartInvertDidChange:(id)a3
{
  id v5;

  v5 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    -[BKUpgradeViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", -[BKUpgradeViewController _computedUserInterfaceStyle](self, "_computedUserInterfaceStyle"));
  else
    -[BKUpgradeViewController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, v5, 0);

}

- (UIActivityIndicatorView)activityView
{
  return self->_activityView;
}

- (void)setActivityView:(id)a3
{
  objc_storeStrong((id *)&self->_activityView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityView, 0);
}

@end
