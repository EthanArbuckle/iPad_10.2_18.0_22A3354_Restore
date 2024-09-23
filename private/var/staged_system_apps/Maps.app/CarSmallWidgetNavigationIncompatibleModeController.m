@implementation CarSmallWidgetNavigationIncompatibleModeController

- (void)loadView
{
  UILabel *v3;
  UILabel *incompatibleLabel;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarSmallWidgetNavigationIncompatibleModeController;
  -[CarSmallWidgetNavigationIncompatibleModeController loadView](&v5, "loadView");
  v3 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  incompatibleLabel = self->_incompatibleLabel;
  self->_incompatibleLabel = v3;

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UILabel *incompatibleLabel;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CarSmallWidgetNavigationIncompatibleModeController;
  -[CarSmallWidgetNavigationIncompatibleModeController viewDidLoad](&v13, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetNavigationIncompatibleModeController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CarSmallWidgetNavigationIncompatibleView"));

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_incompatibleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
  -[UILabel setFont:](self->_incompatibleLabel, "setFont:", v4);

  -[UILabel setAdjustsFontSizeToFitWidth:](self->_incompatibleLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setMinimumScaleFactor:](self->_incompatibleLabel, "setMinimumScaleFactor:", 0.600000024);
  -[UILabel setNumberOfLines:](self->_incompatibleLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_incompatibleLabel, "setTextAlignment:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_incompatibleLabel, "setTextColor:", v5);

  -[UILabel setAccessibilityIdentifier:](self->_incompatibleLabel, "setAccessibilityIdentifier:", CFSTR("IncompatibleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetNavigationIncompatibleModeController view](self, "view"));
  objc_msgSend(v6, "addSubview:", self->_incompatibleLabel);

  incompatibleLabel = self->_incompatibleLabel;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetNavigationIncompatibleModeController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "safeAreaLayoutGuide"));
  LODWORD(v10) = 1148846080;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel _maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:](incompatibleLabel, "_maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:", v9, 6.0, 6.0, 6.0, 6.0, v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

  -[CarSmallWidgetNavigationIncompatibleModeController _displayIncompatibilityMessage](self, "_displayIncompatibilityMessage");
}

- (void)_displayIncompatibilityMessage
{
  unsigned int v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  if (objc_msgSend(v9, "desiredTransportType"))
  {
    v3 = objc_msgSend(v9, "desiredTransportType");
    if (v3 > 5)
      v4 = 1;
    else
      v4 = qword_100E39BC8[v3];
    v7 = CarInterruptionUserInfoWithTransportType(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kMapsInterruptionTitle")));
    -[UILabel setText:](self->_incompatibleLabel, "setText:", v8);

  }
  else
  {
    v5 = CarDisplayTurnByTurnNotAvailableAdvisory();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[UILabel setText:](self->_incompatibleLabel, "setText:", v6);
  }

}

- (BOOL)showsMapView
{
  return 0;
}

- (NSArray)carFocusOrderSequences
{
  return (NSArray *)&__NSArray0__struct;
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_incompatibleLabel, 0);
}

@end
