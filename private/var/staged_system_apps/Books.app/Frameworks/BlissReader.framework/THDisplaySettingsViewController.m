@implementation THDisplaySettingsViewController

- (THDisplaySettingsViewController)initWithDelegate:(id)a3
{
  THDisplaySettingsViewController *v4;
  THDisplaySettingsViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THDisplaySettingsViewController;
  v4 = -[THDisplaySettingsViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", 0, 0);
  v5 = v4;
  if (v4)
  {
    -[THDisplaySettingsViewController setDelegate:](v4, "setDelegate:", a3);
    sub_57DA0(v5);
  }
  return v5;
}

- (THDisplaySettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  THDisplaySettingsViewController *v4;
  THDisplaySettingsViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THDisplaySettingsViewController;
  v4 = -[THDisplaySettingsViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
    sub_57DA0(v4);
  return v5;
}

- (void)releaseViews
{
  objc_super v3;

  -[UIButton removeTarget:action:forControlEvents:](self->_themeWhiteButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  self->_themeWhiteButton = 0;
  -[UIButton removeTarget:action:forControlEvents:](self->_themeSepiaButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  self->_themeSepiaButton = 0;
  -[UIButton removeTarget:action:forControlEvents:](self->_themeGrayButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  self->_themeGrayButton = 0;
  -[UIButton removeTarget:action:forControlEvents:](self->_themeNightButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  self->_themeNightButton = 0;
  self->_themeContainer = 0;

  self->_autoNightModeSwitch = 0;
  v3.receiver = self;
  v3.super_class = (Class)THDisplaySettingsViewController;
  -[THDisplaySettingsViewController releaseViews](&v3, "releaseViews");
}

- (void)dealloc
{
  NSNotificationCenter *v3;
  objc_super v4;

  -[THDisplaySettingsViewController releaseViews](self, "releaseViews");

  self->_supportedSections = 0;
  objc_msgSend(+[BCThemeCoordinator shared](BCThemeCoordinator, "shared"), "removeObserver:", self);
  v3 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:](v3, "removeObserver:name:object:", self, THScrollingViewDidChangeNotification, 0);
  -[NSNotificationCenter removeObserver:name:object:](v3, "removeObserver:name:object:", self, UIContentSizeCategoryDidChangeNotification, 0);
  -[THDisplaySettingsViewController setDelegate:](self, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)THDisplaySettingsViewController;
  -[THDisplaySettingsViewController dealloc](&v4, "dealloc");
}

- (unint64_t)p_currentFlowSizeScale
{
  return (unint64_t)objc_msgSend(+[THApplicationSettings sharedSettings](THApplicationSettings, "sharedSettings"), "flowSizeScale");
}

- (void)p_setCurrentFlowSizeScale:(unint64_t)a3
{
  objc_msgSend(+[THApplicationSettings sharedSettings](THApplicationSettings, "sharedSettings"), "setFlowSizeScale:", a3);
}

- (void)onScrollSwitch:(id)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  if (objc_msgSend(-[THDisplaySettingsViewController scrollSwitch](self, "scrollSwitch", a3), "isEnabled"))
  {
    objc_msgSend(-[THDisplaySettingsViewController scrollSwitch](self, "scrollSwitch"), "setEnabled:", 0);
    v4 = dispatch_time(0, 10000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_580F8;
    block[3] = &unk_426DD0;
    block[4] = self;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)handleScrollingViewDidChange:(id)a3
{
  -[THDisplaySettingsViewController p_validateButtonsAnimated:](self, "p_validateButtonsAnimated:", 1);
}

- (void)p_validateButtonsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = objc_msgSend(+[THApplicationSettings sharedSettings](THApplicationSettings, "sharedSettings"), "flowSizeScale");
  objc_msgSend(-[THDisplaySettingsViewController sizeSmallerButton](self, "sizeSmallerButton"), "setEnabled:", v5 != 0);
  objc_msgSend(-[THDisplaySettingsViewController sizeLargerButton](self, "sizeLargerButton"), "setEnabled:", (unint64_t)v5 < 0xB);
  objc_msgSend(-[THDisplaySettingsViewController scrollSwitch](self, "scrollSwitch"), "setEnabled:", 1);
  objc_msgSend(-[THDisplaySettingsViewController scrollSwitch](self, "scrollSwitch"), "setOn:", objc_msgSend(-[THDisplaySettingsViewController delegate](self, "delegate"), "flowModeEnabled:", self));
  -[THDisplaySettingsViewController p_resizePopoverViewAnimated:](self, "p_resizePopoverViewAnimated:", v3);
}

- (void)viewDidLoad
{
  NSNotificationCenter *v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THDisplaySettingsViewController;
  -[THDisplaySettingsViewController viewDidLoad](&v5, "viewDidLoad");
  objc_msgSend(-[THDisplaySettingsViewController view](self, "view"), "setAccessibilityIgnoresInvertColors:", 1);
  objc_msgSend(+[BCThemeCoordinator shared](BCThemeCoordinator, "shared"), "addObserver:", self);
  v3 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:](v3, "addObserver:selector:name:object:", self, "handleScrollingViewDidChange:", THScrollingViewDidChangeNotification, 0);
  -[NSNotificationCenter addObserver:selector:name:object:](v3, "addObserver:selector:name:object:", self, "contentSizeCategoryDidChange", UIContentSizeCategoryDidChangeNotification, 0);
  -[THDisplaySettingsViewController setSupportedSections:](self, "setSupportedSections:", -[THDisplaySettingsViewController p_buildSupportedSections](self, "p_buildSupportedSections"));
  -[THDisplaySettingsViewController p_bestPopoverHeightForSections:](self, "p_bestPopoverHeightForSections:", -[THDisplaySettingsViewController supportedSections](self, "supportedSections"));
  -[THDisplaySettingsViewController setPreferredContentSize:](self, "setPreferredContentSize:", 296.0, v4);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THDisplaySettingsViewController;
  -[THDisplaySettingsViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[THDisplaySettingsViewController p_setPopoverScrolling](self, "p_setPopoverScrolling");
}

- (void)p_setPopoverScrolling
{
  id v3;
  double Height;
  double v5;
  CGRect v6;

  v3 = -[THDisplaySettingsViewController tableView](self, "tableView");
  objc_msgSend(v3, "frame");
  Height = CGRectGetHeight(v6);
  -[THDisplaySettingsViewController preferredContentSize](self, "preferredContentSize");
  objc_msgSend(v3, "setScrollEnabled:", Height > v5);
}

- (void)contentSizeCategoryDidChange
{
  -[THDisplaySettingsViewController releaseAuxiliaryCachedViews](self, "releaseAuxiliaryCachedViews");
  -[THDisplaySettingsViewController p_resizePopoverViewAnimated:](self, "p_resizePopoverViewAnimated:", 0);
  -[THDisplaySettingsViewController updateBrightness](self, "updateBrightness");
}

- (id)p_buildSupportedSections
{
  id v3;
  unsigned int v4;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v4 = +[BEAppearanceViewController canChangeBrightness](BEAppearanceViewController, "canChangeBrightness");
  if (v4)
    objc_msgSend(v3, "addObject:", &off_469080);
  if (objc_msgSend(-[THDisplaySettingsViewController delegate](self, "delegate"), "shouldShowThemeControls:", self))objc_msgSend(v3, "addObject:", &off_469098);
  if (objc_msgSend(-[THDisplaySettingsViewController delegate](self, "delegate"), "shouldShowFlowModeSwitch:", self))objc_msgSend(v3, "addObject:", &off_4690B0);
  if (objc_msgSend(-[THDisplaySettingsViewController delegate](self, "delegate"), "shouldShowFontResizeControls:", self))
  {
    if (v4)
      objc_msgSend(v3, "addObject:", &off_4690C8);
    else
      objc_msgSend(v3, "insertObject:atIndex:", &off_4690C8, 0);
  }
  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THDisplaySettingsViewController;
  -[THDisplaySettingsViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[THDisplaySettingsViewController p_validateButtonsAnimated:](self, "p_validateButtonsAnimated:", 0);
  -[THDisplaySettingsViewController stylizeForTheme](self, "stylizeForTheme");
}

- (void)didReceiveMemoryWarning
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THDisplaySettingsViewController;
  -[THDisplaySettingsViewController didReceiveMemoryWarning](&v3, "didReceiveMemoryWarning");
  -[THDisplaySettingsViewController releaseViews](self, "releaseViews");
}

- (void)increaseFontSize:(id)a3
{
  -[THDisplaySettingsViewController p_setCurrentFlowSizeScale:](self, "p_setCurrentFlowSizeScale:", (char *)-[THDisplaySettingsViewController p_currentFlowSizeScale](self, "p_currentFlowSizeScale") + 1);
  -[THDisplaySettingsViewController increaseFontSize:notifyingCoordinator:](self, "increaseFontSize:notifyingCoordinator:", a3, 1);
}

- (void)increaseFontSize:(id)a3 notifyingCoordinator:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  -[THDisplaySettingsViewController p_validateButtonsAnimated:](self, "p_validateButtonsAnimated:", 0);
  objc_msgSend(-[THDisplaySettingsViewController delegate](self, "delegate"), "displaySettingsControllerDidChangeFontSize:toFlowSizeScale:", self, -[THDisplaySettingsViewController p_currentFlowSizeScale](self, "p_currentFlowSizeScale"));
  if (v4)
    objc_msgSend(+[BCThemeCoordinator shared](BCThemeCoordinator, "shared"), "observerDidIncreaseFontSize:", self);
}

- (void)decreaseFontSize:(id)a3
{
  -[THDisplaySettingsViewController p_setCurrentFlowSizeScale:](self, "p_setCurrentFlowSizeScale:", (char *)-[THDisplaySettingsViewController p_currentFlowSizeScale](self, "p_currentFlowSizeScale") - 1);
  -[THDisplaySettingsViewController decreaseFontSize:notifyingCoordinator:](self, "decreaseFontSize:notifyingCoordinator:", a3, 1);
}

- (void)decreaseFontSize:(id)a3 notifyingCoordinator:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  -[THDisplaySettingsViewController p_validateButtonsAnimated:](self, "p_validateButtonsAnimated:", 0);
  objc_msgSend(-[THDisplaySettingsViewController delegate](self, "delegate"), "displaySettingsControllerDidChangeFontSize:toFlowSizeScale:", self, -[THDisplaySettingsViewController p_currentFlowSizeScale](self, "p_currentFlowSizeScale"));
  if (v4)
    objc_msgSend(+[BCThemeCoordinator shared](BCThemeCoordinator, "shared"), "observerDidDecreaseFontSize:", self);
}

- (void)setAutoNightModeSwitch:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[UISwitch setEnabled:](self->_autoNightModeSwitch, "setEnabled:");
  -[NSUserDefaults setBool:forKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "setBool:forKey:", !v3, CFSTR("THAppearanceDisableAutoNightModeSwitchKey"));
}

- (BOOL)_shouldShowAutoNightMode
{
  return objc_msgSend(+[BCLightLevelController shared](BCLightLevelController, "shared"), "shouldMonitorLightLevel");
}

- (void)_turnAutoNightModeSwitchOff
{
  _BOOL8 v3;

  v3 = -[UISwitch isOn](self->_autoNightModeSwitch, "isOn");
  if (v3)
  {
    -[UISwitch setOn:animated:](self->_autoNightModeSwitch, "setOn:animated:", 0, 1);
    -[UISwitch sendActionsForControlEvents:](self->_autoNightModeSwitch, "sendActionsForControlEvents:", 4096);
  }
  -[NSUserDefaults setBool:forKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "setBool:forKey:", v3, CFSTR("THAppearanceAutoNightModeSwitchWasOnKey"));
}

- (void)_restoreAutoNightModeSwitch
{
  if (-[NSUserDefaults BOOLForKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "BOOLForKey:", CFSTR("THAppearanceAutoNightModeSwitchWasOnKey")))
  {
    -[UISwitch setOn:animated:](self->_autoNightModeSwitch, "setOn:animated:", 1, 1);
    -[UISwitch sendActionsForControlEvents:](self->_autoNightModeSwitch, "sendActionsForControlEvents:", 4096);
  }
}

- (id)themeContainer
{
  id result;
  UIStackView *v4;
  UIButton *v5;
  UIButton *v6;
  UIButton *v7;
  UIButton *v8;
  _QWORD v9[10];

  result = self->_themeContainer;
  if (!result)
  {
    v4 = (UIStackView *)objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", 0.0, 0.0, 244.0, 55.0);
    self->_themeContainer = v4;
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setDistribution:](self->_themeContainer, "setDistribution:", 4);
    -[UIStackView setAlignment:](self->_themeContainer, "setAlignment:", 3);
    -[UIStackView setSpacing:](self->_themeContainer, "setSpacing:", 20.0);
    v5 = (UIButton *)objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", 0.0, 0.0, 46.0, 55.0);
    self->_themeWhiteButton = v5;
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setImage:forState:](self->_themeWhiteButton, "setImage:forState:", -[THDisplaySettingsViewController _whiteThemeButtonImageSelected:](self, "_whiteThemeButtonImageSelected:", 0), 0);
    -[UIButton setImage:forState:](self->_themeWhiteButton, "setImage:forState:", -[THDisplaySettingsViewController _whiteThemeButtonImageSelected:](self, "_whiteThemeButtonImageSelected:", 1), 4);
    -[UIButton addTarget:action:forControlEvents:](self->_themeWhiteButton, "addTarget:action:forControlEvents:", self, "setThemeNormal:", 64);
    -[UIButton setTitleColor:forState:](self->_themeWhiteButton, "setTitleColor:forState:", +[UIColor blackColor](UIColor, "blackColor"), 0);
    -[UIButton setAccessibilityLabel:](self->_themeWhiteButton, "setAccessibilityLabel:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("White"), &stru_43D7D8, 0));
    -[UIButton setAccessibilityIdentifier:](self->_themeWhiteButton, "setAccessibilityIdentifier:", CFSTR("theme well white"));
    -[UIStackView addArrangedSubview:](self->_themeContainer, "addArrangedSubview:", self->_themeWhiteButton);
    v6 = (UIButton *)objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", 0.0, 0.0, 46.0, 55.0);
    self->_themeSepiaButton = v6;
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setImage:forState:](self->_themeSepiaButton, "setImage:forState:", -[THDisplaySettingsViewController _sepiaThemeButtonImageSelected:](self, "_sepiaThemeButtonImageSelected:", 0), 0);
    -[UIButton setImage:forState:](self->_themeSepiaButton, "setImage:forState:", -[THDisplaySettingsViewController _sepiaThemeButtonImageSelected:](self, "_sepiaThemeButtonImageSelected:", 1), 4);
    -[UIButton addTarget:action:forControlEvents:](self->_themeSepiaButton, "addTarget:action:forControlEvents:", self, "setThemeSepia:", 64);
    -[UIButton setTitleColor:forState:](self->_themeSepiaButton, "setTitleColor:forState:", +[UIColor blackColor](UIColor, "blackColor"), 0);
    -[UIButton setAccessibilityLabel:](self->_themeSepiaButton, "setAccessibilityLabel:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Sepia"), &stru_43D7D8, 0));
    -[UIButton setAccessibilityIdentifier:](self->_themeSepiaButton, "setAccessibilityIdentifier:", CFSTR("theme well sepia"));
    -[UIStackView addArrangedSubview:](self->_themeContainer, "addArrangedSubview:", self->_themeSepiaButton);
    v7 = (UIButton *)objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", 0.0, 0.0, 46.0, 55.0);
    self->_themeGrayButton = v7;
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setImage:forState:](self->_themeGrayButton, "setImage:forState:", -[THDisplaySettingsViewController _grayThemeButtonImageSelected:](self, "_grayThemeButtonImageSelected:", 0), 0);
    -[UIButton setImage:forState:](self->_themeGrayButton, "setImage:forState:", -[THDisplaySettingsViewController _grayThemeButtonImageSelected:](self, "_grayThemeButtonImageSelected:", 1), 4);
    -[UIButton addTarget:action:forControlEvents:](self->_themeGrayButton, "addTarget:action:forControlEvents:", self, "setThemeGray:", 64);
    -[UIButton setTitleColor:forState:](self->_themeGrayButton, "setTitleColor:forState:", +[UIColor blackColor](UIColor, "blackColor"), 0);
    -[UIButton setAccessibilityLabel:](self->_themeGrayButton, "setAccessibilityLabel:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Gray"), &stru_43D7D8, 0));
    -[UIButton setAccessibilityIdentifier:](self->_themeGrayButton, "setAccessibilityIdentifier:", CFSTR("theme well gray"));
    -[UIStackView addArrangedSubview:](self->_themeContainer, "addArrangedSubview:", self->_themeGrayButton);
    v8 = (UIButton *)objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", 0.0, 0.0, 46.0, 55.0);
    self->_themeNightButton = v8;
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setImage:forState:](self->_themeNightButton, "setImage:forState:", -[THDisplaySettingsViewController _nightThemeButtonImageSelected:](self, "_nightThemeButtonImageSelected:", 0), 0);
    -[UIButton setImage:forState:](self->_themeNightButton, "setImage:forState:", -[THDisplaySettingsViewController _nightThemeButtonImageSelected:](self, "_nightThemeButtonImageSelected:", 1), 4);
    -[UIButton addTarget:action:forControlEvents:](self->_themeNightButton, "addTarget:action:forControlEvents:", self, "setThemeNight:", 64);
    -[UIButton setTitleColor:forState:](self->_themeNightButton, "setTitleColor:forState:", +[UIColor blackColor](UIColor, "blackColor"), 0);
    -[UIButton setAccessibilityLabel:](self->_themeNightButton, "setAccessibilityLabel:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Night"), &stru_43D7D8, 0));
    -[UIButton setAccessibilityIdentifier:](self->_themeNightButton, "setAccessibilityIdentifier:", CFSTR("theme well night"));
    -[UIStackView addArrangedSubview:](self->_themeContainer, "addArrangedSubview:", self->_themeNightButton);
    v9[0] = objc_msgSend(-[UIStackView widthAnchor](self->_themeContainer, "widthAnchor"), "constraintEqualToConstant:", 244.0);
    v9[1] = objc_msgSend(-[UIStackView heightAnchor](self->_themeContainer, "heightAnchor"), "constraintEqualToConstant:", 55.0);
    v9[2] = objc_msgSend(-[UIButton widthAnchor](self->_themeWhiteButton, "widthAnchor"), "constraintEqualToConstant:", 46.0);
    v9[3] = objc_msgSend(-[UIButton heightAnchor](self->_themeWhiteButton, "heightAnchor"), "constraintEqualToConstant:", 55.0);
    v9[4] = objc_msgSend(-[UIButton widthAnchor](self->_themeSepiaButton, "widthAnchor"), "constraintEqualToConstant:", 46.0);
    v9[5] = objc_msgSend(-[UIButton heightAnchor](self->_themeSepiaButton, "heightAnchor"), "constraintEqualToConstant:", 55.0);
    v9[6] = objc_msgSend(-[UIButton widthAnchor](self->_themeGrayButton, "widthAnchor"), "constraintEqualToConstant:", 46.0);
    v9[7] = objc_msgSend(-[UIButton heightAnchor](self->_themeGrayButton, "heightAnchor"), "constraintEqualToConstant:", 55.0);
    v9[8] = objc_msgSend(-[UIButton widthAnchor](self->_themeNightButton, "widthAnchor"), "constraintEqualToConstant:", 46.0);
    v9[9] = objc_msgSend(-[UIButton heightAnchor](self->_themeNightButton, "heightAnchor"), "constraintEqualToConstant:", 55.0);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 10));
    -[THDisplaySettingsViewController updateThemeButtons](self, "updateThemeButtons");
    return self->_themeContainer;
  }
  return result;
}

- (void)setAppearanceStyle:(int64_t)a3
{
  if (self->_appearanceStyle != a3)
  {
    self->_appearanceStyle = a3;
    -[THDisplaySettingsViewController updateThemeButtons](self, "updateThemeButtons");
  }
}

- (void)_changeAppearanceStyle:(int64_t)a3
{
  -[THDisplaySettingsViewController setAppearanceStyle:](self, "setAppearanceStyle:");
  objc_msgSend(+[BCThemeCoordinator shared](BCThemeCoordinator, "shared"), "observer:didChangeStyle:", self, a3);
  objc_msgSend(-[THDisplaySettingsViewController delegate](self, "delegate"), "displaySettingsController:didChangeStyle:", self, -[THDisplaySettingsViewController appearanceStyle](self, "appearanceStyle"));
}

- (void)stylizeForTheme
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THDisplaySettingsViewController;
  -[THDisplaySettingsViewController stylizeForTheme](&v4, "stylizeForTheme");
  v3 = -[THDisplaySettingsViewController themePage](self, "themePage");
  objc_msgSend(-[THDisplaySettingsViewController popoverPresentationController](self, "popoverPresentationController"), "setBackgroundColor:", objc_msgSend(v3, "tableViewCellBackgroundColor"));
  -[UIButton setImage:forState:](self->_themeWhiteButton, "setImage:forState:", -[THDisplaySettingsViewController _whiteThemeButtonImageSelected:](self, "_whiteThemeButtonImageSelected:", 0), 0);
  -[UIButton setImage:forState:](self->_themeWhiteButton, "setImage:forState:", -[THDisplaySettingsViewController _whiteThemeButtonImageSelected:](self, "_whiteThemeButtonImageSelected:", 1), 4);
  -[UIButton setImage:forState:](self->_themeSepiaButton, "setImage:forState:", -[THDisplaySettingsViewController _sepiaThemeButtonImageSelected:](self, "_sepiaThemeButtonImageSelected:", 0), 0);
  -[UIButton setImage:forState:](self->_themeSepiaButton, "setImage:forState:", -[THDisplaySettingsViewController _sepiaThemeButtonImageSelected:](self, "_sepiaThemeButtonImageSelected:", 1), 4);
  -[UIButton setImage:forState:](self->_themeGrayButton, "setImage:forState:", -[THDisplaySettingsViewController _grayThemeButtonImageSelected:](self, "_grayThemeButtonImageSelected:", 0), 0);
  -[UIButton setImage:forState:](self->_themeGrayButton, "setImage:forState:", -[THDisplaySettingsViewController _grayThemeButtonImageSelected:](self, "_grayThemeButtonImageSelected:", 1), 4);
  -[UIButton setImage:forState:](self->_themeNightButton, "setImage:forState:", -[THDisplaySettingsViewController _nightThemeButtonImageSelected:](self, "_nightThemeButtonImageSelected:", 0), 0);
  -[UIButton setImage:forState:](self->_themeNightButton, "setImage:forState:", -[THDisplaySettingsViewController _nightThemeButtonImageSelected:](self, "_nightThemeButtonImageSelected:", 1), 4);
  objc_msgSend(-[THDisplaySettingsViewController sizeSeparatorLine](self, "sizeSeparatorLine"), "setBackgroundColor:", objc_msgSend(v3, "tableViewSeparatorColor"));
  objc_msgSend(-[THDisplaySettingsViewController brightnessSlider](self, "brightnessSlider"), "setTintColor:", objc_msgSend(v3, "tintColor"));
  objc_msgSend(-[THDisplaySettingsViewController tableView](self, "tableView"), "reloadData");
}

- (void)setTheme:(id)a3
{
  objc_super v5;

  if (-[THDisplaySettingsViewController theme](self, "theme") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)THDisplaySettingsViewController;
    -[THDisplaySettingsViewController setTheme:](&v5, "setTheme:", a3);
    -[THDisplaySettingsViewController stylizeForTheme](self, "stylizeForTheme");
  }
}

- (void)setThemeNormal:(id)a3
{
  objc_msgSend(-[THDisplaySettingsViewController delegate](self, "delegate", a3), "displaySettingsController:willChangeStyle:", self, 0);
  if ((char *)-[THDisplaySettingsViewController appearanceStyle](self, "appearanceStyle") == (char *)&dword_0 + 3)
  {
    -[THDisplaySettingsViewController setAutoNightModeSwitch:](self, "setAutoNightModeSwitch:", 1);
    -[THDisplaySettingsViewController _restoreAutoNightModeSwitch](self, "_restoreAutoNightModeSwitch");
  }
  -[THDisplaySettingsViewController _changeAppearanceStyle:](self, "_changeAppearanceStyle:", 0);
}

- (void)setThemeGray:(id)a3
{
  objc_msgSend(-[THDisplaySettingsViewController delegate](self, "delegate", a3), "displaySettingsController:willChangeStyle:", self, 2);
  if ((char *)-[THDisplaySettingsViewController appearanceStyle](self, "appearanceStyle") == (char *)&dword_0 + 3)
  {
    -[THDisplaySettingsViewController setAutoNightModeSwitch:](self, "setAutoNightModeSwitch:", 1);
    -[THDisplaySettingsViewController _restoreAutoNightModeSwitch](self, "_restoreAutoNightModeSwitch");
  }
  -[THDisplaySettingsViewController _changeAppearanceStyle:](self, "_changeAppearanceStyle:", 2);
}

- (void)setThemeSepia:(id)a3
{
  objc_msgSend(-[THDisplaySettingsViewController delegate](self, "delegate", a3), "displaySettingsController:willChangeStyle:", self, 1);
  if ((char *)-[THDisplaySettingsViewController appearanceStyle](self, "appearanceStyle") == (char *)&dword_0 + 3)
  {
    -[THDisplaySettingsViewController setAutoNightModeSwitch:](self, "setAutoNightModeSwitch:", 1);
    -[THDisplaySettingsViewController _restoreAutoNightModeSwitch](self, "_restoreAutoNightModeSwitch");
  }
  -[THDisplaySettingsViewController _changeAppearanceStyle:](self, "_changeAppearanceStyle:", 1);
}

- (void)setThemeNight:(id)a3
{
  objc_msgSend(-[THDisplaySettingsViewController delegate](self, "delegate", a3), "displaySettingsController:willChangeStyle:", self, 3);
  if ((char *)-[THDisplaySettingsViewController appearanceStyle](self, "appearanceStyle") != (char *)&dword_0 + 3)
  {
    -[THDisplaySettingsViewController _turnAutoNightModeSwitchOff](self, "_turnAutoNightModeSwitchOff");
    -[THDisplaySettingsViewController setAutoNightModeSwitch:](self, "setAutoNightModeSwitch:", 0);
  }
  -[THDisplaySettingsViewController _changeAppearanceStyle:](self, "_changeAppearanceStyle:", 3);
}

- (void)updateThemeButtons
{
  int64_t v3;

  v3 = -[THDisplaySettingsViewController appearanceStyle](self, "appearanceStyle");
  -[UIButton setSelected:](self->_themeWhiteButton, "setSelected:", v3 == 0);
  -[UIButton setSelected:](self->_themeSepiaButton, "setSelected:", v3 == 1);
  -[UIButton setSelected:](self->_themeGrayButton, "setSelected:", v3 == 2);
  -[UIButton setSelected:](self->_themeNightButton, "setSelected:", v3 == 3);
}

- (id)_whiteThemeButtonImageSelected:(BOOL)a3
{
  return -[THDisplaySettingsViewController _themeButtonImageWithColor:selected:](self, "_themeButtonImageWithColor:selected:", +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 1.0), a3);
}

- (id)_sepiaThemeButtonImageSelected:(BOOL)a3
{
  return -[THDisplaySettingsViewController _themeButtonImageWithColor:selected:](self, "_themeButtonImageWithColor:selected:", +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.831372549, 0.776470588, 0.623529412, 1.0), a3);
}

- (id)_grayThemeButtonImageSelected:(BOOL)a3
{
  return -[THDisplaySettingsViewController _themeButtonImageWithColor:selected:](self, "_themeButtonImageWithColor:selected:", +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.352941176, 0.352941176, 0.360784314, 1.0), a3);
}

- (id)_nightThemeButtonImageSelected:(BOOL)a3
{
  return -[THDisplaySettingsViewController _themeButtonImageWithColor:selected:](self, "_themeButtonImageWithColor:selected:", +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.2, 1.0), a3);
}

- (id)_themeButtonImageWithColor:(id)a3 selected:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  double v8;
  UIBezierPath *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIColor *v14;
  UIBezierPath *v15;
  UIBezierPath *v16;
  UIImage *ImageFromCurrentImageContext;
  CGSize v19;

  v4 = a4;
  -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
  v8 = v7;
  v19.width = 46.0;
  v19.height = 46.0;
  UIGraphicsBeginImageContextWithOptions(v19, 0, 0.0);
  if (v4)
  {
    v9 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, 46.0, 46.0);
    objc_msgSend(objc_msgSend(-[THDisplaySettingsViewController theme](self, "theme"), "keyColor"), "setFill");
    -[UIBezierPath fill](v9, "fill");
    v10 = 42.0;
    v11 = 2.0;
    v12 = 2.0;
  }
  else
  {
    v13 = 1.0 / v8;
    v14 = +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.2);
    v15 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, 46.0, 46.0);
    -[UIColor setFill](v14, "setFill");
    -[UIBezierPath fill](v15, "fill");
    v10 = v13 * -2.0 + 46.0;
    v11 = v13;
    v12 = v13;
  }
  v16 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v11, v12, v10, v10);
  objc_msgSend(a3, "setFill");
  -[UIBezierPath fill](v16, "fill");
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return ImageFromCurrentImageContext;
}

- (id)autoNightModeSwitch
{
  UISwitch *autoNightModeSwitch;
  UISwitch *v4;

  autoNightModeSwitch = self->_autoNightModeSwitch;
  if (!autoNightModeSwitch)
  {
    v4 = (UISwitch *)objc_msgSend(objc_alloc((Class)UISwitch), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    self->_autoNightModeSwitch = v4;
    -[UISwitch addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, "handleAutoNightModeSwitch:", 4096);
    -[UISwitch sizeToFit](self->_autoNightModeSwitch, "sizeToFit");
    -[UISwitch setEnabled:](self->_autoNightModeSwitch, "setEnabled:", -[NSUserDefaults BOOLForKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "BOOLForKey:", CFSTR("THAppearanceDisableAutoNightModeSwitchKey")) ^ 1);
    autoNightModeSwitch = self->_autoNightModeSwitch;
  }
  -[UISwitch setOn:](autoNightModeSwitch, "setOn:", objc_msgSend(-[THDisplaySettingsViewController delegate](self, "delegate"), "autoNightModeEnabled:", self));
  return self->_autoNightModeSwitch;
}

- (void)handleAutoNightModeSwitch:(id)a3
{
  -[NSUserDefaults setBool:forKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", a3), "setBool:forKey:", -[UISwitch isOn](self->_autoNightModeSwitch, "isOn"), CFSTR("THAppearanceAutoNightModeSwitchWasOnKey"));
  objc_msgSend(-[THDisplaySettingsViewController delegate](self, "delegate"), "displaySettingsController:didChangeAutoNightMode:", self, -[UISwitch isOn](self->_autoNightModeSwitch, "isOn"));
}

- (void)coordinator:(id)a3 observerDidIncreaseFontSize:(id)a4
{
  -[THDisplaySettingsViewController increaseFontSize:notifyingCoordinator:](self, "increaseFontSize:notifyingCoordinator:", 0, 0);
}

- (void)coordinator:(id)a3 observerDidDecreaseFontSize:(id)a4
{
  -[THDisplaySettingsViewController decreaseFontSize:notifyingCoordinator:](self, "decreaseFontSize:notifyingCoordinator:", 0, 0);
}

- (void)coordinator:(id)a3 observer:(id)a4 didChangeStyle:(unint64_t)a5
{
  -[THDisplaySettingsViewController setAppearanceStyle:](self, "setAppearanceStyle:", a5, a4);
}

- (void)coordinator:(id)a3 observer:(id)a4 didChangeLayout:(unint64_t)a5
{
  objc_msgSend(-[THDisplaySettingsViewController scrollSwitch](self, "scrollSwitch", a3, a4), "setOn:", (a5 & 0xFFFFFFFFFFFFFFFELL) == 2);
}

- (BOOL)p_presentingFullscreen
{
  return -[THDisplaySettingsViewController modalPresentationStyle](self, "modalPresentationStyle") != (char *)&dword_4 + 3;
}

- (double)p_bestPopoverHeightForSections:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v5 = -[NSArray count](-[THDisplaySettingsViewController supportedSections](self, "supportedSections"), "count");
  if (v5 < 1)
  {
    v8 = 0.0;
  }
  else
  {
    v6 = v5;
    v7 = 0;
    v8 = 0.0;
    do
    {
      -[THDisplaySettingsViewController tableView:heightForHeaderInSection:](self, "tableView:heightForHeaderInSection:", -[THDisplaySettingsViewController tableView](self, "tableView"), v7);
      v8 = v8 + v9;
      ++v7;
    }
    while (v6 != v7);
  }
  if ((objc_msgSend(a3, "containsObject:", &off_469080) & 1) != 0)
  {
    -[THDisplaySettingsViewController appearanceRowHeight](self, "appearanceRowHeight");
    v8 = v8 + v10;
  }
  if (objc_msgSend(a3, "containsObject:", &off_469098))
  {
    v8 = v8 + 60.0;
    if (-[THDisplaySettingsViewController _shouldShowAutoNightMode](self, "_shouldShowAutoNightMode"))
    {
      -[THDisplaySettingsViewController scrollingRowHeight](self, "scrollingRowHeight");
      v8 = v8 + v11;
    }
  }
  if (objc_msgSend(a3, "containsObject:", &off_4690B0))
  {
    -[THDisplaySettingsViewController scrollingRowHeight](self, "scrollingRowHeight");
    v8 = v8 + v12;
  }
  if (objc_msgSend(a3, "containsObject:", &off_4690C8))
  {
    -[THDisplaySettingsViewController appearanceRowHeight](self, "appearanceRowHeight");
    return v8 + v13;
  }
  return v8;
}

- (void)p_resizePopoverViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[9];
  _QWORD v18[6];

  v3 = a3;
  v5 = -[THDisplaySettingsViewController p_buildSupportedSections](self, "p_buildSupportedSections");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_598F0;
  v18[3] = &unk_426E28;
  v18[4] = self;
  v18[5] = v5;
  if (-[THDisplaySettingsViewController p_presentingFullscreen](self, "p_presentingFullscreen"))
  {
    -[THDisplaySettingsViewController setSupportedSections:](self, "setSupportedSections:", v5);
    objc_msgSend(-[THDisplaySettingsViewController tableView](self, "tableView"), "reloadData");
    -[THDisplaySettingsViewController p_setPopoverScrolling](self, "p_setPopoverScrolling");
  }
  else
  {
    objc_msgSend(-[THDisplaySettingsViewController view](self, "view"), "frame");
    v7 = v6;
    v9 = v8;
    -[THDisplaySettingsViewController p_bestPopoverHeightForSections:](self, "p_bestPopoverHeightForSections:", v5);
    v11 = v10;
    -[THDisplaySettingsViewController appearanceRowHeight](self, "appearanceRowHeight");
    if (v11 == v12)
      v3 = 0;
    objc_msgSend(-[THDisplaySettingsViewController view](self, "view"), "frame");
    if (v11 != v13
      || (-[THDisplaySettingsViewController preferredContentSize](self, "preferredContentSize"), v11 != v14))
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_59924;
      v17[3] = &unk_427178;
      v17[4] = self;
      v17[5] = v7;
      v17[6] = v9;
      v17[7] = 0x4072800000000000;
      *(double *)&v17[8] = v11;
      if (v3)
      {
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_59930;
        v16[3] = &unk_427CC0;
        v16[4] = v18;
        +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v17, v16, 0.3);
      }
      else
      {
        -[THDisplaySettingsViewController setSupportedSections:](self, "setSupportedSections:", v5);
        objc_msgSend(-[THDisplaySettingsViewController tableView](self, "tableView"), "reloadData");
        -[THDisplaySettingsViewController p_setPopoverScrolling](self, "p_setPopoverScrolling");
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_5993C;
        v15[3] = &unk_427830;
        v15[4] = v17;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v15);
      }
    }
  }
}

- (unint64_t)p_displaySectionForSection:(int64_t)a3
{
  if (-[NSArray count](-[THDisplaySettingsViewController supportedSections](self, "supportedSections"), "count") <= a3)
    return 0;
  else
    return (unint64_t)objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[THDisplaySettingsViewController supportedSections](self, "supportedSections"), "objectAtIndexedSubscript:", a3), "unsignedIntegerValue");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ((char *)-[THDisplaySettingsViewController p_displaySectionForSection:](self, "p_displaySectionForSection:", a4) != (char *)&dword_0 + 1)
    return 1;
  if (-[THDisplaySettingsViewController _shouldShowAutoNightMode](self, "_shouldShowAutoNightMode"))
    return 2;
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD *v10;
  id v11;
  NSArray *v12;
  id v14;
  _QWORD v15[4];
  _QWORD v16[2];
  _QWORD v17[4];

  v6 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 1, 0);
  objc_msgSend(v6, "setSelectionStyle:", 0);
  v7 = objc_msgSend(v6, "contentView");
  switch(-[THDisplaySettingsViewController p_displaySectionForSection:](self, "p_displaySectionForSection:", objc_msgSend(a4, "section")))
  {
    case 0uLL:
      v8 = -[THDisplaySettingsViewController brightnessSlider](self, "brightnessSlider");
      if (v8)
      {
        v9 = v8;
        objc_msgSend(v7, "addSubview:", v8);
        v17[0] = objc_msgSend(objc_msgSend(v9, "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(v7, "layoutMarginsGuide"), "leadingAnchor"));
        v17[1] = objc_msgSend(objc_msgSend(v9, "trailingAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(v7, "layoutMarginsGuide"), "trailingAnchor"));
        v17[2] = objc_msgSend(objc_msgSend(v9, "topAnchor"), "constraintEqualToAnchor:", objc_msgSend(v7, "topAnchor"));
        v17[3] = objc_msgSend(objc_msgSend(v9, "bottomAnchor"), "constraintEqualToAnchor:constant:", objc_msgSend(v7, "bottomAnchor"), -1.0);
        v10 = v17;
        goto LABEL_9;
      }
      break;
    case 1uLL:
      if (!objc_msgSend(a4, "row"))
      {
        v14 = -[THDisplaySettingsViewController themeContainer](self, "themeContainer");
        objc_msgSend(v7, "addSubview:", v14);
        v16[0] = objc_msgSend(objc_msgSend(v14, "centerXAnchor"), "constraintEqualToAnchor:", objc_msgSend(v7, "centerXAnchor"));
        v16[1] = objc_msgSend(objc_msgSend(v14, "centerYAnchor"), "constraintEqualToAnchor:", objc_msgSend(v7, "centerYAnchor"));
        v12 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2);
        goto LABEL_10;
      }
      if (objc_msgSend(a4, "row") == (char *)&dword_0 + 1)
      {
        objc_msgSend(objc_msgSend(v6, "textLabel"), "setText:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Auto-Night Theme"), &stru_43D7D8, 0));
        objc_msgSend(v6, "setAccessoryView:", -[THDisplaySettingsViewController autoNightModeSwitch](self, "autoNightModeSwitch"));
      }
      break;
    case 2uLL:
      -[THDisplaySettingsViewController configureVerticalScrollSwitchCell:](self, "configureVerticalScrollSwitchCell:", v6);
      break;
    case 3uLL:
      v11 = -[THDisplaySettingsViewController fontSizeButtons](self, "fontSizeButtons");
      objc_msgSend(v7, "addSubview:", v11);
      v15[0] = objc_msgSend(objc_msgSend(v11, "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(v7, "layoutMarginsGuide"), "leadingAnchor"));
      v15[1] = objc_msgSend(objc_msgSend(v11, "trailingAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(v7, "layoutMarginsGuide"), "trailingAnchor"));
      v15[2] = objc_msgSend(objc_msgSend(v11, "topAnchor"), "constraintEqualToAnchor:", objc_msgSend(v7, "topAnchor"));
      v15[3] = objc_msgSend(objc_msgSend(v11, "bottomAnchor"), "constraintEqualToAnchor:", objc_msgSend(v7, "bottomAnchor"));
      v10 = v15;
LABEL_9:
      v12 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 4);
LABEL_10:
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);
      break;
    default:
      return v6;
  }
  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](-[THDisplaySettingsViewController supportedSections](self, "supportedSections", a3), "count");
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double v6;
  double v7;
  unint64_t v8;
  double result;

  -[THDisplaySettingsViewController appearanceRowHeight](self, "appearanceRowHeight", a3);
  v7 = v6;
  v8 = -[THDisplaySettingsViewController p_displaySectionForSection:](self, "p_displaySectionForSection:", objc_msgSend(a4, "section"));
  if (v8 == 2)
    goto LABEL_5;
  if (v8 == 1)
  {
    if (objc_msgSend(a4, "row"))
    {
      if (objc_msgSend(a4, "row") == (char *)&dword_0 + 1)
      {
LABEL_5:
        -[THDisplaySettingsViewController scrollingRowHeight](self, "scrollingRowHeight");
        return result;
      }
    }
    else
    {
      return 60.0;
    }
  }
  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  result = 5.0;
  if (!a4)
    return 0.0;
  return result;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  objc_msgSend(-[THDisplaySettingsViewController theme](self, "theme", a3, a4, a5), "stylizeTableViewCell:", a4);
  -[UIFont _scaledValueForValue:](+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody), "_scaledValueForValue:", 18.0);
  objc_msgSend(objc_msgSend(a4, "textLabel"), "setFont:", +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4;

  v4 = -[THDisplaySettingsViewController tableViewHeaderView](self, "tableViewHeaderView", a3, a4);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v4;
}

- (double)appearanceRowHeight
{
  unsigned int v2;
  double result;

  v2 = +[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled");
  result = 44.0;
  if (v2)
    return 65.0;
  return result;
}

- (int64_t)appearanceStyle
{
  return self->_appearanceStyle;
}

- (NSArray)supportedSections
{
  return self->_supportedSections;
}

- (void)setSupportedSections:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

@end
