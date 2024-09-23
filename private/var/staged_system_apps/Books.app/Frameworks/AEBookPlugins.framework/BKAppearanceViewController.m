@implementation BKAppearanceViewController

- (double)appearanceColorPotSeparator
{
  return 20.0;
}

- (double)appearanceColorPotWidth
{
  return 46.0;
}

- (double)appearanceColorPotHeight
{
  return 55.0;
}

- (double)fontAppearanceWidthPadding
{
  return 60.0;
}

- (double)appearanceColorContainerHeight
{
  return 55.0;
}

- (BKAppearanceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  BKAppearanceViewController *v4;
  BKAppearanceViewController *v5;
  BKAppearanceFontViewController *v6;
  BKAppearanceFontViewController *fontVC;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKAppearanceViewController;
  v4 = -[BEAppearanceViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[BKAppearanceViewController contentSize](v4, "contentSize");
    -[BKAppearanceViewController setPreferredContentSize:](v5, "setPreferredContentSize:");
    v6 = -[BKAppearanceFontViewController initWithNibName:bundle:]([BKAppearanceFontViewController alloc], "initWithNibName:bundle:", 0, 0);
    fontVC = v5->_fontVC;
    v5->_fontVC = v6;

    -[BKAppearanceViewController preferredContentSize](v5, "preferredContentSize");
    -[BKAppearanceFontViewController setPreferredContentSize:](v5->_fontVC, "setPreferredContentSize:");
    -[BKAppearanceFontViewController setDelegate:](v5->_fontVC, "setDelegate:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BCThemeCoordinator shared](BCThemeCoordinator, "shared"));
    objc_msgSend(v8, "addObserver:", v5);

  }
  return v5;
}

- (void)releaseViews
{
  NSArray *currentItems;
  UIButton *themeWhiteButton;
  UIButton *themeSepiaButton;
  UIButton *themeGrayButton;
  UIButton *themeNightButton;
  UIStackView *themeContainer;
  UIView *topThemeHairline;
  UIView *bottomThemeHairline;
  UISwitch *autoNightModeSwitch;
  objc_super v12;

  currentItems = self->_currentItems;
  self->_currentItems = 0;

  -[UIButton removeTarget:action:forControlEvents:](self->_themeWhiteButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  themeWhiteButton = self->_themeWhiteButton;
  self->_themeWhiteButton = 0;

  -[UIButton removeTarget:action:forControlEvents:](self->_themeSepiaButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  themeSepiaButton = self->_themeSepiaButton;
  self->_themeSepiaButton = 0;

  -[UIButton removeTarget:action:forControlEvents:](self->_themeGrayButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  themeGrayButton = self->_themeGrayButton;
  self->_themeGrayButton = 0;

  -[UIButton removeTarget:action:forControlEvents:](self->_themeNightButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  themeNightButton = self->_themeNightButton;
  self->_themeNightButton = 0;

  themeContainer = self->_themeContainer;
  self->_themeContainer = 0;

  topThemeHairline = self->_topThemeHairline;
  self->_topThemeHairline = 0;

  bottomThemeHairline = self->_bottomThemeHairline;
  self->_bottomThemeHairline = 0;

  autoNightModeSwitch = self->_autoNightModeSwitch;
  self->_autoNightModeSwitch = 0;

  v12.receiver = self;
  v12.super_class = (Class)BKAppearanceViewController;
  -[BEAppearanceViewController releaseViews](&v12, "releaseViews");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BCThemeCoordinator shared](BCThemeCoordinator, "shared"));
  objc_msgSend(v4, "removeObserver:", self);

  -[BKAppearanceViewController setFonts:](self, "setFonts:", 0);
  -[BKAppearanceViewController releaseViews](self, "releaseViews");
  v5.receiver = self;
  v5.super_class = (Class)BKAppearanceViewController;
  -[BEAppearanceViewController dealloc](&v5, "dealloc");
}

- (void)_setPopoverScrolling
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = isPad(self, a2);
  if (((v3 & 1) != 0 || isPortrait(v3))
    && (+[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController tableView](self, "tableView"));
    v6 = v4;
    v5 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController tableView](self, "tableView"));
    v6 = v4;
    v5 = 1;
  }
  objc_msgSend(v4, "setScrollEnabled:", v5);

}

- (void)loadView
{
  void *v3;
  double v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKAppearanceViewController;
  -[BEAppearanceViewController loadView](&v6, "loadView");
  -[BKAppearanceViewController _setPopoverScrolling](self, "_setPopoverScrolling");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController tableView](self, "tableView"));
  *(_QWORD *)&v4 = objc_opt_class(BKAppearanceTableViewCell).n128_u64[0];
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v5, CFSTR("BKAppearanceTableViewCell"), v4);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  UIImage *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKAppearanceViewController;
  -[BEAppearanceViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIgnoresInvertColors:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController navigationController](self, "navigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationBar"));

  v6 = objc_opt_new(UIImage);
  objc_msgSend(v5, "setBackgroundImage:forBarMetrics:", v6, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "contentSizeCategoryDidChange", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)contentSizeCategoryDidChange
{
  -[BEAppearanceViewController releaseAuxiliaryCachedViews](self, "releaseAuxiliaryCachedViews");
  -[BKAppearanceViewController updateUI](self, "updateUI");
  -[BEAppearanceViewController updateBrightness](self, "updateBrightness");
  -[BKAppearanceViewController _setPopoverScrolling](self, "_setPopoverScrolling");
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)advancedFonts
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("BKFontControlAdvanced"));

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BKAppearanceViewController;
  -[BEAppearanceViewController viewWillAppear:](&v6, "viewWillAppear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController navigationController](self, "navigationController"));
  objc_msgSend(v5, "setNavigationBarHidden:animated:", 1, v3);

  -[BKAppearanceViewController updateUI](self, "updateUI");
  -[BKAppearanceViewController stylizeForTheme](self, "stylizeForTheme");
}

- (void)viewDidAppear:(BOOL)a3
{
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  _QWORD block[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKAppearanceViewController;
  -[BKAppearanceViewController viewDidAppear:](&v7, "viewDidAppear:", a3);
  if (!self->_fonts)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_4053C;
    block[3] = &unk_1BEA38;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

- (CGSize)contentSize
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  unsigned int v19;
  double v20;
  double v21;
  double v22;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController tableView](self, "tableView"));
  v4 = -[BKAppearanceViewController numberOfSectionsInTableView:](self, "numberOfSectionsInTableView:", v3);

  if (v4 < 1)
  {
    v6 = 0.0;
  }
  else
  {
    v5 = 0;
    v6 = 0.0;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController tableView](self, "tableView"));
      v8 = -[BKAppearanceViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v7, v5);

      if (v8 >= 1)
      {
        for (i = 0; i != v8; ++i)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController tableView](self, "tableView"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", i, v5));
          -[BKAppearanceViewController tableView:heightForRowAtIndexPath:](self, "tableView:heightForRowAtIndexPath:", v10, v11);
          v13 = v12;

          v6 = v6 + v13;
        }
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController tableView](self, "tableView"));
      -[BKAppearanceViewController tableView:heightForHeaderInSection:](self, "tableView:heightForHeaderInSection:", v14, v5);
      v16 = v6 + v15;

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController tableView](self, "tableView"));
      -[BKAppearanceViewController tableView:heightForFooterInSection:](self, "tableView:heightForFooterInSection:", v17, v5);
      v6 = v16 + v18;

      ++v5;
    }
    while (v5 != v4);
  }
  v19 = +[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled");
  v20 = fmin(400.0, v6);
  if (v19)
    v21 = v20;
  else
    v21 = v6;
  v22 = 296.0;
  result.height = v21;
  result.width = v22;
  return result;
}

- (void)setTheme:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController theme](self, "theme"));

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)BKAppearanceViewController;
    -[BKAppearanceViewController setTheme:](&v6, "setTheme:", v4);
    -[BKAppearanceFontViewController setTheme:](self->_fontVC, "setTheme:", v4);
    -[BKAppearanceViewController stylizeForTheme](self, "stylizeForTheme");
  }

}

- (int64_t)colorPotOffsetMultiplier:(int64_t)a3
{
  void *v4;
  UIUserInterfaceLayoutDirection v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController view](self, "view"));
  v5 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v4, "semanticContentAttribute"));

  if (v5 == UIUserInterfaceLayoutDirectionRightToLeft)
    return 3 - a3;
  else
    return a3;
}

- (UIStackView)themeContainer
{
  UIStackView *themeContainer;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIStackView *v10;
  UIStackView *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIButton *v16;
  UIButton *themeWhiteButton;
  UIButton *v18;
  void *v19;
  UIButton *v20;
  void *v21;
  UIButton *v22;
  void *v23;
  UIButton *v24;
  id v25;
  void *v26;
  void *v27;
  UIButton *v28;
  UIButton *themeSepiaButton;
  UIButton *v30;
  void *v31;
  UIButton *v32;
  void *v33;
  UIButton *v34;
  void *v35;
  UIButton *v36;
  id v37;
  void *v38;
  void *v39;
  UIButton *v40;
  UIButton *themeGrayButton;
  UIButton *v42;
  void *v43;
  UIButton *v44;
  void *v45;
  UIButton *v46;
  void *v47;
  UIButton *v48;
  id v49;
  void *v50;
  void *v51;
  UIButton *v52;
  UIButton *themeNightButton;
  UIButton *v54;
  void *v55;
  UIButton *v56;
  void *v57;
  UIButton *v58;
  void *v59;
  UIButton *v60;
  id v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  _QWORD v89[10];

  themeContainer = self->_themeContainer;
  if (!themeContainer)
  {
    v4 = objc_alloc((Class)UIStackView);
    -[BKAppearanceViewController appearanceColorPotSeparator](self, "appearanceColorPotSeparator");
    v6 = v5;
    -[BKAppearanceViewController appearanceColorPotWidth](self, "appearanceColorPotWidth");
    v8 = v7 * 4.0 + v6 * 3.0;
    -[BKAppearanceViewController appearanceColorContainerHeight](self, "appearanceColorContainerHeight");
    v10 = (UIStackView *)objc_msgSend(v4, "initWithFrame:", 0.0, 0.0, v8, v9);
    v11 = self->_themeContainer;
    self->_themeContainer = v10;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_themeContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setDistribution:](self->_themeContainer, "setDistribution:", 4);
    -[UIStackView setAlignment:](self->_themeContainer, "setAlignment:", 3);
    -[BKAppearanceViewController appearanceColorPotSeparator](self, "appearanceColorPotSeparator");
    -[UIStackView setSpacing:](self->_themeContainer, "setSpacing:");
    -[BKAppearanceViewController appearanceColorPotWidth](self, "appearanceColorPotWidth");
    v13 = v12;
    -[BKAppearanceViewController appearanceColorPotHeight](self, "appearanceColorPotHeight");
    v15 = v14;
    v16 = (UIButton *)objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", 0.0, 0.0, v13, v14);
    themeWhiteButton = self->_themeWhiteButton;
    self->_themeWhiteButton = v16;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_themeWhiteButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v18 = self->_themeWhiteButton;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController _whiteThemeButtonImageSelected:](self, "_whiteThemeButtonImageSelected:", 0));
    -[UIButton setImage:forState:](v18, "setImage:forState:", v19, 0);

    v20 = self->_themeWhiteButton;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController _whiteThemeButtonImageSelected:](self, "_whiteThemeButtonImageSelected:", 1));
    -[UIButton setImage:forState:](v20, "setImage:forState:", v21, 4);

    -[UIButton addTarget:action:forControlEvents:](self->_themeWhiteButton, "addTarget:action:forControlEvents:", self, "setThemeNormal:", 64);
    v22 = self->_themeWhiteButton;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[UIButton setTitleColor:forState:](v22, "setTitleColor:forState:", v23, 0);

    v24 = self->_themeWhiteButton;
    v25 = AEBundle();
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("White"), &stru_1C3088, 0));
    -[UIButton setAccessibilityLabel:](v24, "setAccessibilityLabel:", v27);

    -[UIButton setAccessibilityIdentifier:](self->_themeWhiteButton, "setAccessibilityIdentifier:", CFSTR("theme well white"));
    -[UIStackView addArrangedSubview:](self->_themeContainer, "addArrangedSubview:", self->_themeWhiteButton);
    v28 = (UIButton *)objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", 0.0, 0.0, v13, v15);
    themeSepiaButton = self->_themeSepiaButton;
    self->_themeSepiaButton = v28;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_themeSepiaButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v30 = self->_themeSepiaButton;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController _sepiaThemeButtonImageSelected:](self, "_sepiaThemeButtonImageSelected:", 0));
    -[UIButton setImage:forState:](v30, "setImage:forState:", v31, 0);

    v32 = self->_themeSepiaButton;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController _sepiaThemeButtonImageSelected:](self, "_sepiaThemeButtonImageSelected:", 1));
    -[UIButton setImage:forState:](v32, "setImage:forState:", v33, 4);

    -[UIButton addTarget:action:forControlEvents:](self->_themeSepiaButton, "addTarget:action:forControlEvents:", self, "setThemeSepia:", 64);
    v34 = self->_themeSepiaButton;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[UIButton setTitleColor:forState:](v34, "setTitleColor:forState:", v35, 0);

    v36 = self->_themeSepiaButton;
    v37 = AEBundle();
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("Sepia"), &stru_1C3088, 0));
    -[UIButton setAccessibilityLabel:](v36, "setAccessibilityLabel:", v39);

    -[UIButton setAccessibilityIdentifier:](self->_themeSepiaButton, "setAccessibilityIdentifier:", CFSTR("theme well sepia"));
    -[UIStackView addArrangedSubview:](self->_themeContainer, "addArrangedSubview:", self->_themeSepiaButton);
    v40 = (UIButton *)objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", 0.0, 0.0, v13, v15);
    themeGrayButton = self->_themeGrayButton;
    self->_themeGrayButton = v40;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_themeGrayButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v42 = self->_themeGrayButton;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController _grayThemeButtonImageSelected:](self, "_grayThemeButtonImageSelected:", 0));
    -[UIButton setImage:forState:](v42, "setImage:forState:", v43, 0);

    v44 = self->_themeGrayButton;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController _grayThemeButtonImageSelected:](self, "_grayThemeButtonImageSelected:", 1));
    -[UIButton setImage:forState:](v44, "setImage:forState:", v45, 4);

    -[UIButton addTarget:action:forControlEvents:](self->_themeGrayButton, "addTarget:action:forControlEvents:", self, "setThemeGray:", 64);
    v46 = self->_themeGrayButton;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[UIButton setTitleColor:forState:](v46, "setTitleColor:forState:", v47, 0);

    v48 = self->_themeGrayButton;
    v49 = AEBundle();
    v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("Gray"), &stru_1C3088, 0));
    -[UIButton setAccessibilityLabel:](v48, "setAccessibilityLabel:", v51);

    -[UIButton setAccessibilityIdentifier:](self->_themeGrayButton, "setAccessibilityIdentifier:", CFSTR("theme well gray"));
    -[UIStackView addArrangedSubview:](self->_themeContainer, "addArrangedSubview:", self->_themeGrayButton);
    v52 = (UIButton *)objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", 0.0, 0.0, v13, v15);
    themeNightButton = self->_themeNightButton;
    self->_themeNightButton = v52;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_themeNightButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v54 = self->_themeNightButton;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController _nightThemeButtonImageSelected:](self, "_nightThemeButtonImageSelected:", 0));
    -[UIButton setImage:forState:](v54, "setImage:forState:", v55, 0);

    v56 = self->_themeNightButton;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController _nightThemeButtonImageSelected:](self, "_nightThemeButtonImageSelected:", 1));
    -[UIButton setImage:forState:](v56, "setImage:forState:", v57, 4);

    -[UIButton addTarget:action:forControlEvents:](self->_themeNightButton, "addTarget:action:forControlEvents:", self, "setThemeNight:", 64);
    v58 = self->_themeNightButton;
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[UIButton setTitleColor:forState:](v58, "setTitleColor:forState:", v59, 0);

    v60 = self->_themeNightButton;
    v61 = AEBundle();
    v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "localizedStringForKey:value:table:", CFSTR("Night"), &stru_1C3088, 0));
    -[UIButton setAccessibilityLabel:](v60, "setAccessibilityLabel:", v63);

    -[UIButton setAccessibilityIdentifier:](self->_themeNightButton, "setAccessibilityIdentifier:", CFSTR("theme well night"));
    -[UIStackView addArrangedSubview:](self->_themeContainer, "addArrangedSubview:", self->_themeNightButton);
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView widthAnchor](self->_themeContainer, "widthAnchor"));
    -[BKAppearanceViewController appearanceColorPotSeparator](self, "appearanceColorPotSeparator");
    v65 = v64;
    -[BKAppearanceViewController appearanceColorPotWidth](self, "appearanceColorPotWidth");
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToConstant:", v66 * 4.0 + v65 * 3.0));
    v89[0] = v87;
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView heightAnchor](self->_themeContainer, "heightAnchor"));
    -[BKAppearanceViewController appearanceColorContainerHeight](self, "appearanceColorContainerHeight");
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToConstant:"));
    v89[1] = v85;
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_themeWhiteButton, "widthAnchor"));
    -[BKAppearanceViewController appearanceColorPotWidth](self, "appearanceColorPotWidth");
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToConstant:"));
    v89[2] = v83;
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_themeWhiteButton, "heightAnchor"));
    -[BKAppearanceViewController appearanceColorPotHeight](self, "appearanceColorPotHeight");
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToConstant:"));
    v89[3] = v81;
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_themeSepiaButton, "widthAnchor"));
    -[BKAppearanceViewController appearanceColorPotWidth](self, "appearanceColorPotWidth");
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToConstant:"));
    v89[4] = v79;
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_themeSepiaButton, "heightAnchor"));
    -[BKAppearanceViewController appearanceColorPotHeight](self, "appearanceColorPotHeight");
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToConstant:"));
    v89[5] = v77;
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_themeGrayButton, "widthAnchor"));
    -[BKAppearanceViewController appearanceColorPotWidth](self, "appearanceColorPotWidth");
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToConstant:"));
    v89[6] = v67;
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_themeGrayButton, "heightAnchor"));
    -[BKAppearanceViewController appearanceColorPotHeight](self, "appearanceColorPotHeight");
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToConstant:"));
    v89[7] = v69;
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_themeNightButton, "widthAnchor"));
    -[BKAppearanceViewController appearanceColorPotWidth](self, "appearanceColorPotWidth");
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToConstant:"));
    v89[8] = v71;
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_themeNightButton, "heightAnchor"));
    -[BKAppearanceViewController appearanceColorPotHeight](self, "appearanceColorPotHeight");
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToConstant:"));
    v89[9] = v73;
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v89, 10));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v74);

    -[BKAppearanceViewController updateThemeButtons](self, "updateThemeButtons");
    themeContainer = self->_themeContainer;
  }
  return themeContainer;
}

- (UISwitch)autoNightModeSwitch
{
  UISwitch *autoNightModeSwitch;
  UISwitch *v4;
  UISwitch *v5;
  void *v6;
  id v7;

  autoNightModeSwitch = self->_autoNightModeSwitch;
  if (!autoNightModeSwitch)
  {
    v4 = (UISwitch *)objc_msgSend(objc_alloc((Class)UISwitch), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_autoNightModeSwitch;
    self->_autoNightModeSwitch = v4;

    -[UISwitch setPreferredStyle:](self->_autoNightModeSwitch, "setPreferredStyle:", 2);
    -[UISwitch addTarget:action:forControlEvents:](self->_autoNightModeSwitch, "addTarget:action:forControlEvents:", self, "handleAutoNightModeSwitch:", 4096);
    -[UISwitch sizeToFit](self->_autoNightModeSwitch, "sizeToFit");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v7 = objc_msgSend(v6, "BOOLForKey:", kIMThemeAutoNightModeOnKey);

    -[UISwitch setOn:](self->_autoNightModeSwitch, "setOn:", v7);
    -[UISwitch setEnabled:](self->_autoNightModeSwitch, "setEnabled:", 1);
    autoNightModeSwitch = self->_autoNightModeSwitch;
  }
  return autoNightModeSwitch;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController menuItems](self, "menuItems", a3));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController menuItems](self, "menuItems"));
    v6 = objc_msgSend(v5, "count");

  }
  else
  {
    v6 = 0;
  }

  return (int64_t)v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  __CFString *v7;
  int64_t v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController menuItems](self, "menuItems", a3));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a4));

  if (v7 == CFSTR("BKAppearanceMenuItemFont"))
  {
    v8 = 2;
  }
  else if (v7 == CFSTR("BKAppearanceMenuItemTheme"))
  {
    if (-[BKAppearanceViewController _shouldShowAutoNightMode](self, "_shouldShowAutoNightMode"))
      v8 = 2;
    else
      v8 = 1;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  double v6;
  double v7;
  void *v8;
  __CFString *v9;
  double v10;

  v5 = a4;
  -[BEAppearanceViewController appearanceRowHeight](self, "appearanceRowHeight");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController menuItems](self, "menuItems"));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v5, "section")));

  if (v9 == CFSTR("BKAppearanceMenuItemTheme"))
  {
    if (!objc_msgSend(v5, "row"))
    {
      v7 = 60.0;
      goto LABEL_16;
    }
    if (objc_msgSend(v5, "row") != (char *)&dword_0 + 1)
      goto LABEL_4;
LABEL_11:
    -[BEAppearanceViewController scrollingRowHeight](self, "scrollingRowHeight");
    v7 = v10;
    goto LABEL_16;
  }
  if (v9 == CFSTR("BKAppearanceMenuItemHorizontalScrollingView")
    || v9 == CFSTR("BKAppearanceMenuItemVerticalScrollingView"))
  {
    goto LABEL_11;
  }
LABEL_4:
  if (+[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled")&& v9 == CFSTR("BKAppearanceMenuItemFont")&& objc_msgSend(v5, "row") == (char *)&dword_0 + 1)
  {
    if ((+[UIFont bc_contentSizeCategoryIsGreaterThan:](UIFont, "bc_contentSizeCategoryIsGreaterThan:", UIContentSizeCategoryAccessibilityExtraLarge) & 1) != 0)
    {
      v7 = 155.0;
    }
    else if (+[UIFont bc_contentSizeCategoryIsGreaterThan:](UIFont, "bc_contentSizeCategoryIsGreaterThan:", UIContentSizeCategoryAccessibilityLarge))
    {
      v7 = 115.0;
    }
    else
    {
      v7 = 85.0;
    }
  }
LABEL_16:

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

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (a4)
    return (id)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController tableViewHeaderView](self, "tableViewHeaderView", a3));
  else
    return 0;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  BKAppearanceViewController *v51;
  void *v52;
  void *v53;
  void *v54;
  unsigned int v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  __CFString *v94;
  __CFString *v95;
  __CFString *v96;
  id v97;
  id v98;
  void *v99;
  uint64_t v100;
  id obj;
  id obja;
  id objb;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _QWORD v112[2];
  _BYTE v113[128];
  _QWORD v114[4];
  _QWORD v115[4];
  _BYTE v116[128];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("BKAppearanceTableViewCell"), v6));
  if (v7)
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
    objc_msgSend(v9, "setText:", 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "detailTextLabel"));
    objc_msgSend(v10, "setText:", 0);

    objc_msgSend(v8, "setAccessoryView:", 0);
    objc_msgSend(v8, "setAccessoryType:", 0);
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subviews"));

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v108, v116, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v109;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v109 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * (_QWORD)i), "removeFromSuperview");
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v108, v116, 16);
      }
      while (v14);
    }

  }
  else
  {
    v8 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 1, CFSTR("BKAppearanceTableViewCell"));
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController menuItems](self, "menuItems"));
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")));

  if (v19 == CFSTR("BKAppearanceMenuItemBrightness"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController brightnessSlider](self, "brightnessSlider"));
    objc_msgSend(v17, "addSubview:", v20);
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layoutMarginsGuide"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "leadingAnchor"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:", v92));
    v115[0] = v90;
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layoutMarginsGuide"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "trailingAnchor"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:", v86));
    v115[1] = v85;
    v94 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
    v97 = v6;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
    v115[2] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
    v25 = v17;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26, -1.0));
    v115[3] = v27;
    v28 = v115;
    goto LABEL_18;
  }
  if (v19 == CFSTR("BKAppearanceMenuItemFont"))
  {
    if (objc_msgSend(v6, "row"))
    {
      if (objc_msgSend(v6, "row") != (char *)&dword_0 + 1)
        goto LABEL_21;
      v93 = v17;
      v95 = v19;
      v98 = v6;
      v32 = AEBundle();
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Fonts"), &stru_1C3088, 0));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
      objc_msgSend(v35, "setText:", v34);

      v36 = objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", UIFontTextStyleHeadline, 1));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.forward")));
      v91 = (void *)v36;
      v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "imageWithConfiguration:", v36));

      v89 = (void *)v38;
      v39 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v38);
      objc_msgSend(v8, "setAccessoryView:", v39);

      v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController themePage](self, "themePage"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "tertiaryTextColor"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accessoryView"));
      objc_msgSend(v42, "setTintColor:", v41);

      v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController themePage](self, "themePage"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "secondaryTextColor"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "detailTextLabel"));
      objc_msgSend(v45, "setTextColor:", v44);

      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      obja = (id)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController fonts](self, "fonts"));
      v46 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v104, v113, 16);
      if (!v46)
        goto LABEL_42;
      v47 = v46;
      v48 = *(_QWORD *)v105;
      v100 = kCTFontUIFontDesignSerif;
LABEL_26:
      v49 = 0;
      while (1)
      {
        if (*(_QWORD *)v105 != v48)
          objc_enumerationMutation(obja);
        v50 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * (_QWORD)v49);
        v51 = self;
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController style](self, "style"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "fontFamily"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "familyName"));
        v55 = objc_msgSend(v53, "isEqualToString:", v54);

        if (!v55)
          goto LABEL_40;
        if (objc_msgSend(v50, "kind") != (char *)&dword_0 + 1)
          break;
        v56 = AEBundle();
        v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("Original"), &stru_1C3088, 0));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "detailTextLabel"));
        objc_msgSend(v59, "setText:", v58);

        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "detailTextLabel"));
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "font"));
        objc_msgSend(v61, "pointSize");
        v62 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "detailTextLabel"));
        objc_msgSend(v63, "setFont:", v62);

LABEL_39:
LABEL_40:
        v49 = (char *)v49 + 1;
        self = v51;
        if (v47 == v49)
        {
          v47 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v104, v113, 16);
          if (!v47)
          {
LABEL_42:

            v19 = v95;
            v6 = v98;
            v17 = v93;
            goto LABEL_21;
          }
          goto LABEL_26;
        }
      }
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "displayName"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "detailTextLabel"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "font"));
      objc_msgSend(v65, "pointSize");
      v67 = v66;

      if (objc_msgSend(v50, "kind") == &dword_4)
      {
        v68 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:design:](UIFont, "systemFontOfSize:weight:design:", v100, v67, UIFontWeightRegular));
      }
      else
      {
        if (objc_msgSend(v50, "kind") != (char *)&dword_0 + 3)
        {
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "familyName"));
          v61 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithName:size:](UIFont, "fontWithName:size:", v69, v67));

          goto LABEL_38;
        }
        v68 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v67));
      }
      v61 = (void *)v68;
LABEL_38:
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "detailTextLabel"));
      objc_msgSend(v70, "setText:", v60);

      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "bkEffectiveFontForText:", v60));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "detailTextLabel"));
      objc_msgSend(v72, "setFont:", v71);

      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "detailTextLabel"));
      objc_msgSend(v73, "setLineBreakMode:", 4);

      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "detailTextLabel"));
      objc_msgSend(v62, "setNumberOfLines:", 1);
      goto LABEL_39;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController fontSizeButtons](self, "fontSizeButtons"));
    objc_msgSend(v17, "addSubview:", v20);
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layoutMarginsGuide"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "leadingAnchor"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:", v92));
    v114[0] = v90;
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layoutMarginsGuide"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "trailingAnchor"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:", v86));
    v114[1] = v85;
    v94 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
    v97 = v6;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
    v114[2] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
    v25 = v17;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26, -1.0));
    v114[3] = v27;
    v28 = v114;
LABEL_18:
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

    v17 = v25;
    v6 = v97;

    v19 = v94;
    v30 = v99;
    goto LABEL_19;
  }
  if (v19 == CFSTR("BKAppearanceMenuItemTheme"))
  {
    if (objc_msgSend(v6, "row"))
    {
      if (objc_msgSend(v6, "row") != (char *)&dword_0 + 1)
        goto LABEL_21;
      v74 = AEBundle();
      v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "localizedStringForKey:value:table:", CFSTR("Auto-Night Theme"), &stru_1C3088, 0));
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
      objc_msgSend(v77, "setText:", v76);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController autoNightModeSwitch](self, "autoNightModeSwitch"));
      objc_msgSend(v8, "setAccessoryView:", v20);
      goto LABEL_20;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController themeContainer](self, "themeContainer"));
    objc_msgSend(v17, "addSubview:", v20);
    objb = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "centerXAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerXAnchor"));
    v96 = v19;
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objb, "constraintEqualToAnchor:", v78));
    v112[0] = v79;
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "centerYAnchor"));
    v81 = v17;
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerYAnchor"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToAnchor:", v82));
    v112[1] = v83;
    v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v112, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v84);

    v17 = v81;
    v19 = v96;

    v30 = objb;
LABEL_19:

LABEL_20:
    goto LABEL_21;
  }
  if (v19 == CFSTR("BKAppearanceMenuItemHorizontalScrollingView"))
  {
    -[BEAppearanceViewController configureHorizontalScrollSwitchCell:](self, "configureHorizontalScrollSwitchCell:", v8);
  }
  else if (v19 == CFSTR("BKAppearanceMenuItemVerticalScrollingView"))
  {
    -[BEAppearanceViewController configureVerticalScrollSwitchCell:](self, "configureVerticalScrollSwitchCell:", v8);
  }
LABEL_21:

  return v8;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  __CFString *v7;
  BOOL v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController menuItems](self, "menuItems"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section")));

  v8 = v7 == CFSTR("BKAppearanceMenuItemFont") && objc_msgSend(v5, "row") == (char *)&dword_0 + 1;
  return v8;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  if (-[BKAppearanceViewController tableView:shouldHighlightRowAtIndexPath:](self, "tableView:shouldHighlightRowAtIndexPath:", a3, v6))
  {
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  __CFString *v6;
  void *v7;
  BKAppearanceFontViewController *v8;
  BKAppearanceFontViewController *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;

  v13 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController menuItems](self, "menuItems"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v13, "section")));

  if (v6 == CFSTR("BKAppearanceMenuItemFont") && objc_msgSend(v13, "row") == (char *)&dword_0 + 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController navigationController](self, "navigationController"));
    v8 = (BKAppearanceFontViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topViewController"));
    v9 = v8;
    if (v8 == self->_fontVC)
    {

      goto LABEL_7;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController navigationController](self, "navigationController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "viewControllers"));
    v12 = objc_msgSend(v11, "containsObject:", self->_fontVC);

    if ((v12 & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController navigationController](self, "navigationController"));
      objc_msgSend(v7, "pushViewController:animated:", self->_fontVC, 1);
LABEL_7:

    }
  }

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController theme](self, "theme"));
  objc_msgSend(v7, "stylizeTableViewCell:", v6);

  v10 = (id)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle1));
  objc_msgSend(v10, "_scaledValueForValue:", 18.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));

  objc_msgSend(v9, "setFont:", v8);
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return -[BKAppearanceViewController numberOfSectionsInTableView:](self, "numberOfSectionsInTableView:", a3) - 1 > a4;
}

- (void)setBook:(id)a3
{
  AEBookInfo *v5;
  AEBookInfo *v6;

  v5 = (AEBookInfo *)a3;
  if (self->_book != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_book, a3);
    -[BKAppearanceFontViewController setBook:](self->_fontVC, "setBook:", v6);
    if (self->_fonts)
      -[BKAppearanceViewController setFonts:](self, "setFonts:", 0);
    -[BKAppearanceViewController loadFonts](self, "loadFonts");
    v5 = v6;
  }

}

- (id)styleManager
{
  return -[AEBookInfo styleManager](self->_book, "styleManager");
}

- (void)loadFonts
{
  BKAppearanceViewController *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_fonts)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController styleManager](v2, "styleManager"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fonts"));
    v5 = objc_msgSend((id)v4, "mutableCopy");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController book](v2, "book"));
    LOBYTE(v4) = objc_msgSend(v6, "showOriginalFontOption");

    if ((v4 & 1) == 0)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v16;
        while (2)
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v16 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "familyName", (_QWORD)v15));
            v13 = objc_msgSend(v12, "isEqualToString:", &stru_1C3088);

            if ((v13 & 1) != 0)
            {
              v14 = v11;

              if (v14)
                objc_msgSend(v7, "removeObject:", v14);
              goto LABEL_14;
            }
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v8)
            continue;
          break;
        }
      }

      v14 = 0;
LABEL_14:

    }
    -[BKAppearanceViewController setFonts:](v2, "setFonts:", v5, (_QWORD)v15);

  }
  objc_sync_exit(v2);

}

- (NSArray)fonts
{
  NSArray *fonts;

  fonts = self->_fonts;
  if (!fonts)
  {
    -[BKAppearanceViewController loadFonts](self, "loadFonts");
    fonts = self->_fonts;
  }
  return fonts;
}

- (id)fontObserver
{
  return self->_fontVC;
}

- (void)setFonts:(id)a3
{
  NSArray **p_fonts;
  void *v6;
  void *v7;
  NSArray *v8;
  void *v9;
  id v10;

  p_fonts = &self->_fonts;
  v10 = a3;
  if (!-[NSArray isEqualToArray:](*p_fonts, "isEqualToArray:"))
  {
    -[BKAppearanceFontViewController setFonts:](self->_fontVC, "setFonts:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController fontObserver](self, "fontObserver"));
    if (*p_fonts)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, -[NSArray count](*p_fonts, "count")));
      -[NSArray removeObserver:fromObjectsAtIndexes:forKeyPath:](*p_fonts, "removeObserver:fromObjectsAtIndexes:forKeyPath:", v6, v7, CFSTR("state"));
      -[NSArray removeObserver:fromObjectsAtIndexes:forKeyPath:](*p_fonts, "removeObserver:fromObjectsAtIndexes:forKeyPath:", v6, v7, CFSTR("downloadProgress"));
      v8 = *p_fonts;
      *p_fonts = 0;

    }
    if (v10)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, objc_msgSend(v10, "count")));
      objc_msgSend(v10, "addObserver:toObjectsAtIndexes:forKeyPath:options:context:", v6, v9, CFSTR("state"), 0, 0);
      objc_msgSend(v10, "addObserver:toObjectsAtIndexes:forKeyPath:options:context:", v6, v9, CFSTR("downloadProgress"), 0, 0);
      objc_storeStrong((id *)p_fonts, a3);

    }
  }

}

- (void)setStyle:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[ContentStyle isEqual:](self->_style, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_style, a3);
    -[BKAppearanceViewController updateUI](self, "updateUI");
  }

}

- (void)setLayout:(unint64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    -[BKAppearanceViewController updateUI](self, "updateUI");
  }
}

- (void)setAppearanceStyle:(unint64_t)a3
{
  if (self->_appearanceStyle != a3)
  {
    self->_appearanceStyle = a3;
    -[BKAppearanceViewController updateThemeButtons](self, "updateThemeButtons");
  }
}

- (void)_changeAppearanceStyle:(unint64_t)a3
{
  id v5;

  -[BKAppearanceViewController setAppearanceStyle:](self, "setAppearanceStyle:");
  v5 = (id)objc_claimAutoreleasedReturnValue(+[BCThemeCoordinator shared](BCThemeCoordinator, "shared"));
  objc_msgSend(v5, "observer:didChangeStyle:", self, a3);

}

- (void)_turnAutoNightModeSwitchOff
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = -[UISwitch isOn](self->_autoNightModeSwitch, "isOn");
  if (v3)
  {
    -[UISwitch setOn:animated:](self->_autoNightModeSwitch, "setOn:animated:", 0, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v4, "setBool:forKey:", 0, kIMThemeAutoNightModeOnKey);

    -[BKAppearanceViewController _sendActionsForAutoNightSwitchWithPreviousState:](self, "_sendActionsForAutoNightSwitchWithPreviousState:", 0);
  }
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("BKAppearanceAutoNightModeSwitchWasOnKey"));

}

- (void)_restoreAutoNightModeSwitch
{
  void *v3;
  unsigned int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("BKAppearanceAutoNightModeSwitchWasOnKey"));

  if (v4)
  {
    -[UISwitch setOn:animated:](self->_autoNightModeSwitch, "setOn:animated:", 1, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v5, "setBool:forKey:", 1, kIMThemeAutoNightModeOnKey);

    -[BKAppearanceViewController _sendActionsForAutoNightSwitchWithPreviousState:](self, "_sendActionsForAutoNightSwitchWithPreviousState:", 1);
  }
}

- (void)_sendActionsForAutoNightSwitchWithPreviousState:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "setBool:forKey:", -[UISwitch isOn](self->_autoNightModeSwitch, "isOn"), CFSTR("BKAppearanceAutoNightModeSwitchWasOnKey"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController delegate](self, "delegate"));
  objc_msgSend(v6, "appearanceViewController:didChangeAutoNightMode:previousValue:", self, -[UISwitch isOn](self->_autoNightModeSwitch, "isOn"), v3);

}

- (void)enableAutoNightModeSwitch
{
  id v2;

  if (+[IMTheme isAutoNightModeEnabled](IMTheme, "isAutoNightModeEnabled"))
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v2, "setBool:forKey:", 0, CFSTR("BKAppearanceDisableAutoNightModeSwitchKey"));

  }
}

- (void)disableAutoNightModeSwitch
{
  id v2;

  if (+[IMTheme isAutoNightModeEnabled](IMTheme, "isAutoNightModeEnabled"))
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("BKAppearanceDisableAutoNightModeSwitchKey"));

  }
}

- (void)setThemeNormal:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "appearanceViewController:willChangeTheme:", self, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BCLightLevelController sharedInstance](BCLightLevelController, "sharedInstance"));
  v6 = objc_msgSend(v5, "isLowLight");

  if ((v6 & 1) == 0)
  {
    -[BKAppearanceViewController enableAutoNightModeSwitch](self, "enableAutoNightModeSwitch");
    -[BKAppearanceViewController _restoreAutoNightModeSwitch](self, "_restoreAutoNightModeSwitch");
  }
  -[BKAppearanceViewController _changeAppearanceStyle:](self, "_changeAppearanceStyle:", 0);
}

- (void)setThemeGray:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "appearanceViewController:willChangeTheme:", self, 2);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BCLightLevelController sharedInstance](BCLightLevelController, "sharedInstance"));
  v6 = objc_msgSend(v5, "isLowLight");

  if ((v6 & 1) == 0)
  {
    -[BKAppearanceViewController enableAutoNightModeSwitch](self, "enableAutoNightModeSwitch");
    -[BKAppearanceViewController _restoreAutoNightModeSwitch](self, "_restoreAutoNightModeSwitch");
  }
  -[BKAppearanceViewController _changeAppearanceStyle:](self, "_changeAppearanceStyle:", 2);
}

- (void)setThemeSepia:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "appearanceViewController:willChangeTheme:", self, 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BCLightLevelController sharedInstance](BCLightLevelController, "sharedInstance"));
  v6 = objc_msgSend(v5, "isLowLight");

  if ((v6 & 1) == 0)
  {
    -[BKAppearanceViewController enableAutoNightModeSwitch](self, "enableAutoNightModeSwitch");
    -[BKAppearanceViewController _restoreAutoNightModeSwitch](self, "_restoreAutoNightModeSwitch");
  }
  -[BKAppearanceViewController _changeAppearanceStyle:](self, "_changeAppearanceStyle:", 1);
}

- (void)setThemeNight:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "appearanceViewController:willChangeTheme:", self, 3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BCLightLevelController sharedInstance](BCLightLevelController, "sharedInstance"));
  v6 = objc_msgSend(v5, "isLowLight");

  if ((v6 & 1) == 0)
    -[BKAppearanceViewController _turnAutoNightModeSwitchOff](self, "_turnAutoNightModeSwitchOff");
  -[BKAppearanceViewController _changeAppearanceStyle:](self, "_changeAppearanceStyle:", 3);
}

- (void)updateThemeButtons
{
  unint64_t v3;

  v3 = -[BKAppearanceViewController appearanceStyle](self, "appearanceStyle");
  -[UIButton setSelected:](self->_themeWhiteButton, "setSelected:", v3 == 0);
  -[UIButton setSelected:](self->_themeSepiaButton, "setSelected:", v3 == 1);
  -[UIButton setSelected:](self->_themeGrayButton, "setSelected:", v3 == 2);
  -[UIButton setSelected:](self->_themeNightButton, "setSelected:", v3 == 3);
}

- (BOOL)_shouldShowAutoNightMode
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BCLightLevelController shared](BCLightLevelController, "shared"));
  v3 = objc_msgSend(v2, "shouldMonitorLightLevel");

  return v3;
}

- (void)appearanceFontViewController:(id)a3 didChangeToFontWithName:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController delegate](self, "delegate"));
  objc_msgSend(v6, "appearanceViewController:didChangeFont:", self, v5);

}

- (void)changeFontSize:(id)a3
{
  double v4;

  LODWORD(v4) = dword_172BC0[objc_msgSend(a3, "selectedSegmentIndex") == 0];
  -[BKAppearanceViewController fontSizeModifiedByOffset:](self, "fontSizeModifiedByOffset:", v4);
}

- (void)changeLineHeight:(id)a3
{
  double v4;

  LODWORD(v4) = dword_172BC0[objc_msgSend(a3, "selectedSegmentIndex") == 0];
  -[BKAppearanceViewController lineHeightModifiedByOffset:](self, "lineHeightModifiedByOffset:", v4);
}

- (int)maxVisibleFonts
{
  if ((isPad(self, a2) & 1) != 0)
    return 8;
  if (isTallPhone() && (isPortrait() & 1) != 0)
    return 7;
  if (isLandscape())
    return 4;
  return 5;
}

+ (int)_fontSizeToSegmentIndex:(float)a3
{
  float v3;
  int v5;

  v3 = floorf(a3);
  if (v3 == 12.0)
    return 0;
  if (v3 == 24.0)
    v5 = 2;
  else
    v5 = -1;
  if (v3 == 19.0)
    return 1;
  else
    return v5;
}

- (void)fontSizeModifiedByOffset:(float)a3
{
  void *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  double v10;
  id v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController styleManager](self, "styleManager"));
  objc_msgSend(v5, "fontSize");
  v7 = roundf((float)(v6 + a3) * 100.0) / 100.0;

  v8 = 6.0;
  if (v7 <= 6.0)
    v8 = v7;
  if (v8 >= 0.1)
    v9 = v8;
  else
    v9 = 0.1;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController styleManager](self, "styleManager"));
  *(float *)&v10 = v9;
  objc_msgSend(v11, "setFontSize:", v10);

}

- (void)lineHeightModifiedByOffset:(float)a3
{
  void *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  double v10;
  id v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController styleManager](self, "styleManager"));
  objc_msgSend(v5, "lineHeight");
  v7 = (float)(roundf(v6 * 100.0) / 100.0) + a3;

  v8 = 6.0;
  if (v7 <= 6.0)
    v8 = v7;
  if (v8 >= 0.1)
    v9 = v8;
  else
    v9 = 0.1;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController styleManager](self, "styleManager"));
  *(float *)&v10 = v9;
  objc_msgSend(v11, "setLineHeight:", v10);

}

- (void)defaultFontSize:(id)a3
{
  void *v4;
  void *v5;
  float v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController styleManager](self, "styleManager", a3));
  objc_msgSend(v4, "setDefaultFontSize");

  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController styleManager](self, "styleManager"));
  objc_msgSend(v5, "fontSize");
  objc_msgSend(v7, "appearanceViewController:didChangeFontSize:", self, v6);

}

- (void)increaseFontSize:(id)a3
{
  void *v4;
  void *v5;
  float v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController styleManager](self, "styleManager", a3));
  objc_msgSend(v4, "increaseFontSize");

  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController styleManager](self, "styleManager"));
  objc_msgSend(v5, "fontSize");
  objc_msgSend(v7, "appearanceViewController:didChangeFontSize:", self, v6);

}

- (void)decreaseFontSize:(id)a3
{
  void *v4;
  void *v5;
  float v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController styleManager](self, "styleManager", a3));
  objc_msgSend(v4, "decreaseFontSize");

  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController styleManager](self, "styleManager"));
  objc_msgSend(v5, "fontSize");
  objc_msgSend(v7, "appearanceViewController:didChangeFontSize:", self, v6);

}

- (void)changeLegibility:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController styleManager](self, "styleManager", a3));
  v4 = objc_msgSend(v6, "optimizeLegibility") ^ 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController styleManager](self, "styleManager"));
  objc_msgSend(v5, "setOptimizeLegibility:", v4);

}

- (void)updateUI
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  BKAppearanceViewController *v16;
  BKAppearanceViewController *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  id v24;

  v24 = (id)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController styleManager](self, "styleManager"));
  v3 = objc_msgSend(v24, "canDecreaseFontSize");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController sizeSmallerButton](self, "sizeSmallerButton"));
  objc_msgSend(v4, "setEnabled:", v3);

  v5 = objc_msgSend(v24, "canIncreaseFontSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController sizeLargerButton](self, "sizeLargerButton"));
  objc_msgSend(v6, "setEnabled:", v5);

  v7 = (char *)-[BKAppearanceViewController layout](self, "layout") == (char *)&dword_0 + 2
    || (char *)-[BKAppearanceViewController layout](self, "layout") == (char *)&dword_0 + 3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController scrollSwitch](self, "scrollSwitch"));
  objc_msgSend(v8, "setOn:", v7);

  -[BKAppearanceViewController updateThemeButtons](self, "updateThemeButtons");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController tableView](self, "tableView"));
  objc_msgSend(v9, "reloadData");

  -[BKAppearanceViewController contentSize](self, "contentSize");
  -[BKAppearanceViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  -[BKAppearanceViewController preferredContentSize](self, "preferredContentSize");
  v11 = v10;
  v13 = v12;
  -[BKAppearanceViewController fontAppearanceWidthPadding](self, "fontAppearanceWidthPadding");
  -[BKAppearanceFontViewController setDesiredContentSize:](self->_fontVC, "setDesiredContentSize:", v11 + v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController navigationController](self, "navigationController"));
  v16 = (BKAppearanceViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topViewController"));

  if (v16)
    v17 = v16;
  else
    v17 = self;
  -[BKAppearanceViewController preferredContentSize](v17, "preferredContentSize");
  v19 = v18;
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController presentingViewController](self, "presentingViewController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "presentedViewController"));
  objc_msgSend(v23, "setPreferredContentSize:", v19, v21);

}

- (void)stylizeForTheme
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIButton *themeWhiteButton;
  void *v10;
  UIButton *v11;
  void *v12;
  UIButton *themeSepiaButton;
  void *v14;
  UIButton *v15;
  void *v16;
  UIButton *themeGrayButton;
  void *v18;
  UIButton *v19;
  void *v20;
  UIButton *themeNightButton;
  void *v22;
  UIButton *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)BKAppearanceViewController;
  -[BEAppearanceViewController stylizeForTheme](&v32, "stylizeForTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController themePage](self, "themePage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController navigationController](self, "navigationController"));
  objc_msgSend(v3, "stylizeNavigationController:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "backgroundColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController navigationController](self, "navigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationBar"));
  objc_msgSend(v8, "setBackgroundColor:", v6);

  themeWhiteButton = self->_themeWhiteButton;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController _whiteThemeButtonImageSelected:](self, "_whiteThemeButtonImageSelected:", 0));
  -[UIButton setImage:forState:](themeWhiteButton, "setImage:forState:", v10, 0);

  v11 = self->_themeWhiteButton;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController _whiteThemeButtonImageSelected:](self, "_whiteThemeButtonImageSelected:", 1));
  -[UIButton setImage:forState:](v11, "setImage:forState:", v12, 4);

  themeSepiaButton = self->_themeSepiaButton;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController _sepiaThemeButtonImageSelected:](self, "_sepiaThemeButtonImageSelected:", 0));
  -[UIButton setImage:forState:](themeSepiaButton, "setImage:forState:", v14, 0);

  v15 = self->_themeSepiaButton;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController _sepiaThemeButtonImageSelected:](self, "_sepiaThemeButtonImageSelected:", 1));
  -[UIButton setImage:forState:](v15, "setImage:forState:", v16, 4);

  themeGrayButton = self->_themeGrayButton;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController _grayThemeButtonImageSelected:](self, "_grayThemeButtonImageSelected:", 0));
  -[UIButton setImage:forState:](themeGrayButton, "setImage:forState:", v18, 0);

  v19 = self->_themeGrayButton;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController _grayThemeButtonImageSelected:](self, "_grayThemeButtonImageSelected:", 1));
  -[UIButton setImage:forState:](v19, "setImage:forState:", v20, 4);

  themeNightButton = self->_themeNightButton;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController _nightThemeButtonImageSelected:](self, "_nightThemeButtonImageSelected:", 0));
  -[UIButton setImage:forState:](themeNightButton, "setImage:forState:", v22, 0);

  v23 = self->_themeNightButton;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController _nightThemeButtonImageSelected:](self, "_nightThemeButtonImageSelected:", 1));
  -[UIButton setImage:forState:](v23, "setImage:forState:", v24, 4);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tableViewSeparatorColor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController sizeSeparatorLine](self, "sizeSeparatorLine"));
  objc_msgSend(v26, "setBackgroundColor:", v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "switchColor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController scrollSwitch](self, "scrollSwitch"));
  objc_msgSend(v28, "setOnTintColor:", v27);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "switchColor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController autoNightModeSwitch](self, "autoNightModeSwitch"));
  objc_msgSend(v30, "setOnTintColor:", v29);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController tableView](self, "tableView"));
  objc_msgSend(v31, "reloadData");

}

- (void)handleAutoNightModeSwitch:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", a3));
  v5 = kIMThemeAutoNightModeOnKey;
  v6 = objc_msgSend(v4, "BOOLForKey:", kIMThemeAutoNightModeOnKey);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v7, "setBool:forKey:", v6 ^ 1, v5);

  +[IMTheme setAutoNightModeEnabled:](IMTheme, "setAutoNightModeEnabled:", v6 ^ 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController delegate](self, "delegate"));
  objc_msgSend(v8, "appearanceViewController:didChangeAutoNightMode:previousValue:", self, -[UISwitch isOn](self->_autoNightModeSwitch, "isOn"), v6);

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v9, "setBool:forKey:", -[UISwitch isOn](self->_autoNightModeSwitch, "isOn"), CFSTR("BKAppearanceAutoNightModeSwitchWasOnKey"));

}

- (void)onScrollSwitch:(id)a3
{
  -[BKAppearanceViewController onScrollSwitch:notifyingCoordinator:](self, "onScrollSwitch:notifyingCoordinator:", a3, 1);
}

- (void)onScrollSwitch:(id)a3 notifyingCoordinator:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController scrollSwitch](self, "scrollSwitch", a3));
  -[BKAppearanceViewController setScrollModeOn:notifyingCoordinator:](self, "setScrollModeOn:notifyingCoordinator:", objc_msgSend(v6, "isOn"), v4);

}

- (void)setScrollModeOn:(BOOL)a3 notifyingCoordinator:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  id v11;

  v4 = a4;
  if (a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController book](self, "book"));
    v7 = objc_msgSend(v6, "scrollModeOrientation");

    v8 = -[BKAppearanceViewController layout](self, "layout");
    if (v7)
      v9 = 2;
    else
      v9 = 3;
    if (v7)
      v10 = v8 != 2;
    else
      v10 = v8 != 3;
  }
  else
  {
    v10 = (char *)-[BKAppearanceViewController layout](self, "layout") != (char *)&dword_0 + 1;
    v9 = 1;
  }
  -[BKAppearanceViewController setLayout:](self, "setLayout:", v9);
  if (v4 && v10)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(+[BCThemeCoordinator shared](BCThemeCoordinator, "shared"));
    objc_msgSend(v11, "observer:didChangeLayout:", self, -[BKAppearanceViewController layout](self, "layout"));

  }
}

- (void)coordinator:(id)a3 observer:(id)a4 didChangeStyle:(unint64_t)a5
{
  -[BKAppearanceViewController setAppearanceStyle:](self, "setAppearanceStyle:", a5, a4);
}

- (void)coordinator:(id)a3 observer:(id)a4 didChangeLayout:(unint64_t)a5
{
  _BOOL8 v6;
  void *v7;

  v6 = (a5 & 0xFFFFFFFFFFFFFFFELL) == 2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController scrollSwitch](self, "scrollSwitch", a3, a4));
  objc_msgSend(v7, "setOn:", v6);

  -[BKAppearanceViewController onScrollSwitch:notifyingCoordinator:](self, "onScrollSwitch:notifyingCoordinator:", 0, 0);
}

- (id)keyCommands
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = AEBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Dismiss menu"), &stru_1C3088, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v5, 0, "dismissMenu:", UIKeyInputEscape, 0, 0));
  objc_msgSend(v2, "addObject:", v6);

  return v2;
}

- (void)dismissMenu:(id)a3
{
  id v4;

  -[BKAppearanceViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController delegate](self, "delegate"));
  objc_msgSend(v4, "appearanceViewControllerShouldDismiss");

}

- (id)_whiteThemeButtonImageSelected:(BOOL)a3
{
  return -[BKAppearanceViewController _themeButtonImageForTheme:selected:](self, "_themeButtonImageForTheme:selected:", 2, a3);
}

- (id)_sepiaThemeButtonImageSelected:(BOOL)a3
{
  return -[BKAppearanceViewController _themeButtonImageForTheme:selected:](self, "_themeButtonImageForTheme:selected:", 3, a3);
}

- (id)_grayThemeButtonImageSelected:(BOOL)a3
{
  return -[BKAppearanceViewController _themeButtonImageForTheme:selected:](self, "_themeButtonImageForTheme:selected:", 4, a3);
}

- (id)_nightThemeButtonImageSelected:(BOOL)a3
{
  return -[BKAppearanceViewController _themeButtonImageForTheme:selected:](self, "_themeButtonImageForTheme:selected:", 5, a3);
}

- (id)_themeButtonImageForTheme:(int64_t)a3 selected:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMThemePage themeForEPUBTheme:](IMThemePage, "themeForEPUBTheme:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "buttonFillColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keyColor"));
  if (!v4)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "separatorColor"));

    v8 = (void *)v9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController _themeButtonImageWithColor:unselectedBorderColor:selected:](self, "_themeButtonImageWithColor:unselectedBorderColor:selected:", v7, v8, v4));

  return v10;
}

- (id)_themeButtonImageWithColor:(id)a3 unselectedBorderColor:(id)a4 selected:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  UIImage *ImageFromCurrentImageContext;
  void *v15;
  CGSize v17;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v9, "scale");
  v11 = 1.0 / v10;

  v17.width = 46.0;
  v17.height = 46.0;
  UIGraphicsBeginImageContextWithOptions(v17, 0, 0.0);
  if (v5)
    v11 = 2.0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, 46.0, 46.0));
  objc_msgSend(v7, "setFill");

  objc_msgSend(v12, "fill");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v11, v11, v11 * -2.0 + 46.0, v11 * -2.0 + 46.0));
  objc_msgSend(v8, "setFill");

  objc_msgSend(v13, "fill");
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v15 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return v15;
}

- (void)appearanceShouldDismissPopover
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController delegate](self, "delegate"));
  objc_msgSend(v2, "appearanceViewControllerShouldDismiss");

}

- (BKAppearanceViewControllerDelegate)delegate
{
  return (BKAppearanceViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AEBookInfo)book
{
  return self->_book;
}

- (ContentStyle)style
{
  return self->_style;
}

- (unint64_t)layout
{
  return self->_layout;
}

- (unint64_t)appearanceStyle
{
  return self->_appearanceStyle;
}

- (NSArray)menuItems
{
  return self->_menuItems;
}

- (void)setMenuItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (BKAppearanceFontViewController)fontVC
{
  return self->_fontVC;
}

- (void)setFontVC:(id)a3
{
  objc_storeStrong((id *)&self->_fontVC, a3);
}

- (NSArray)currentItems
{
  return self->_currentItems;
}

- (void)setCurrentItems:(id)a3
{
  objc_storeStrong((id *)&self->_currentItems, a3);
}

- (UIButton)themeWhiteButton
{
  return self->_themeWhiteButton;
}

- (void)setThemeWhiteButton:(id)a3
{
  objc_storeStrong((id *)&self->_themeWhiteButton, a3);
}

- (UIButton)themeSepiaButton
{
  return self->_themeSepiaButton;
}

- (void)setThemeSepiaButton:(id)a3
{
  objc_storeStrong((id *)&self->_themeSepiaButton, a3);
}

- (UIButton)themeGrayButton
{
  return self->_themeGrayButton;
}

- (void)setThemeGrayButton:(id)a3
{
  objc_storeStrong((id *)&self->_themeGrayButton, a3);
}

- (UIButton)themeNightButton
{
  return self->_themeNightButton;
}

- (void)setThemeNightButton:(id)a3
{
  objc_storeStrong((id *)&self->_themeNightButton, a3);
}

- (void)setThemeContainer:(id)a3
{
  objc_storeStrong((id *)&self->_themeContainer, a3);
}

- (UIView)topThemeHairline
{
  return self->_topThemeHairline;
}

- (void)setTopThemeHairline:(id)a3
{
  objc_storeStrong((id *)&self->_topThemeHairline, a3);
}

- (UIView)bottomThemeHairline
{
  return self->_bottomThemeHairline;
}

- (void)setBottomThemeHairline:(id)a3
{
  objc_storeStrong((id *)&self->_bottomThemeHairline, a3);
}

- (void)setAutoNightModeSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_autoNightModeSwitch, a3);
}

- (BOOL)shownCannotDownloadFontAlert
{
  return self->_shownCannotDownloadFontAlert;
}

- (void)setShownCannotDownloadFontAlert:(BOOL)a3
{
  self->_shownCannotDownloadFontAlert = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoNightModeSwitch, 0);
  objc_storeStrong((id *)&self->_bottomThemeHairline, 0);
  objc_storeStrong((id *)&self->_topThemeHairline, 0);
  objc_storeStrong((id *)&self->_themeContainer, 0);
  objc_storeStrong((id *)&self->_themeNightButton, 0);
  objc_storeStrong((id *)&self->_themeGrayButton, 0);
  objc_storeStrong((id *)&self->_themeSepiaButton, 0);
  objc_storeStrong((id *)&self->_themeWhiteButton, 0);
  objc_storeStrong((id *)&self->_currentItems, 0);
  objc_storeStrong((id *)&self->_fontVC, 0);
  objc_storeStrong((id *)&self->_menuItems, 0);
  objc_storeStrong((id *)&self->_fonts, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_book, 0);
}

@end
