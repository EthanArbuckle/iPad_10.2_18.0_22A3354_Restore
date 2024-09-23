@implementation ACM2SVTrustedDevicesViewController

- (ACM2SVTrustedDevicesViewController)initWithDelegate:(id)a3
{
  ACM2SVTrustedDevicesViewController *v4;
  ACM2SVTrustedDevicesViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ACM2SVTrustedDevicesViewController;
  v4 = -[ACM2SVTrustedDevicesViewController init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[ACM2SVTrustedDevicesViewController setDelegate:](v4, "setDelegate:", a3);
    -[ACM2SVTrustedDevicesViewController setImageDownloadsInProgress:](v5, "setImageDownloadsInProgress:", objc_msgSend(MEMORY[0x24BDBCEB8], "array"));
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[ACM2SVTrustedDevicesViewController setImageDownloadsInProgress:](self, "setImageDownloadsInProgress:", 0);
  -[ACM2SVTrustedDevicesViewController setTrustedDevicesArray:](self, "setTrustedDevicesArray:", 0);
  -[UITableView setDataSource:](-[ACM2SVTrustedDevicesViewController trustedDevicesListView](self, "trustedDevicesListView"), "setDataSource:", 0);
  -[UITableView setDelegate:](-[ACM2SVTrustedDevicesViewController trustedDevicesListView](self, "trustedDevicesListView"), "setDelegate:", 0);
  -[ACM2SVTrustedDevicesViewController setTrustedDevicesListView:](self, "setTrustedDevicesListView:", 0);
  -[ACM2SVTrustedDevicesViewController setTextColor:](self, "setTextColor:", 0);
  -[ACM2SVTrustedDevicesViewController setBackgroundColor:](self, "setBackgroundColor:", 0);
  -[ACM2SVTrustedDevicesViewController setCompletionBlock:](self, "setCompletionBlock:", 0);
  -[ACM2SVTrustedDevicesViewController setEmptyLabel:](self, "setEmptyLabel:", 0);
  -[ACM2SVTrustedDevicesViewController setHeaderTitleLabel:](self, "setHeaderTitleLabel:", 0);
  -[ACM2SVTrustedDevicesViewController setHeaderTextLabel:](self, "setHeaderTextLabel:", 0);
  -[ACM2SVTrustedDevicesViewController setFooterTextLabel:](self, "setFooterTextLabel:", 0);
  -[ACM2SVTrustedDevicesViewController setFooterButton:](self, "setFooterButton:", 0);
  -[UINavigationController setDelegate:](-[ACM2SVTrustedDevicesViewController navigationController](self, "navigationController"), "setDelegate:", 0);
  -[ACM2SVTrustedDevicesViewController setNavigationController:](self, "setNavigationController:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACM2SVTrustedDevicesViewController;
  -[ACM2SVTrustedDevicesViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  double v7;
  UIColor *v8;
  id v9;
  id v10;
  id v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)ACM2SVTrustedDevicesViewController;
  -[ACM2SVTrustedDevicesViewController loadView](&v21, sel_loadView);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom");
    v4 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Verify Identity"));
    if (v3)
    {
LABEL_6:
      -[ACM2SVTrustedDevicesViewController setTitle:](self, "setTitle:", v4);
      goto LABEL_11;
    }
  }
  else
  {
    v4 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Verify Identity"));
  }
  if ((unint64_t)objc_msgSend(v4, "length") <= 0x11)
    goto LABEL_6;
  v5 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v5, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v5, "setText:", v4);
  objc_msgSend(v5, "setTextAlignment:", 1);
  v6 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontSize");
  objc_msgSend(v5, "setFont:", objc_msgSend(v6, "boldSystemFontOfSize:", v7 + 1.0));
  if (-[ACM2SVTrustedDevicesViewController isLegacyStyle](self, "isLegacyStyle"))
    v8 = (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  else
    v8 = -[ACM2SVTrustedDevicesViewController textColor](self, "textColor");
  objc_msgSend(v5, "setTextColor:", v8);
  objc_msgSend(v5, "setLineBreakMode:", 0);
  objc_msgSend(v5, "setNumberOfLines:", 2);
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, 400.0, 40.0);
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController navigationItem](self, "navigationItem"), "setTitleView:", v5);
LABEL_11:
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "setBackgroundColor:", -[ACM2SVTrustedDevicesViewController backgroundColor](self, "backgroundColor"));
  -[ACM2SVTrustedDevicesViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelAction_);
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithTitle:style:target:action:", +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Continue")), 0, self, sel_sendAction_);
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController navigationItem](self, "navigationItem"), "setLeftBarButtonItem:", v9);
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController navigationItem](self, "navigationItem"), "setRightBarButtonItem:", v10);
  objc_msgSend((id)objc_msgSend((id)-[ACM2SVTrustedDevicesViewController navigationItem](self, "navigationItem"), "rightBarButtonItem"), "setEnabled:", 0);
  v11 = objc_alloc(MEMORY[0x24BDF6E58]);
  v12 = -[ACM2SVTrustedDevicesViewController isLegacyStyle](self, "isLegacyStyle");
  v13 = (id)objc_msgSend(v11, "initWithFrame:style:", !v12, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v13, "setDataSource:", self);
  objc_msgSend(v13, "setDelegate:", self);
  objc_msgSend(v13, "setBackgroundColor:", -[ACM2SVTrustedDevicesViewController backgroundColor](self, "backgroundColor"));
  objc_msgSend(v13, "setScrollEnabled:", 0);
  -[ACM2SVTrustedDevicesViewController setTrustedDevicesListView:](self, "setTrustedDevicesListView:", v13);
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addSubview:", -[ACM2SVTrustedDevicesViewController trustedDevicesListView](self, "trustedDevicesListView"));
  v14 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontSize");
  -[ACM2SVTrustedDevicesViewController setEmptyLabel:](self, "setEmptyLabel:", -[ACM2SVTrustedDevicesViewController labelWithText:font:](self, "labelWithText:font:", CFSTR("\n"), objc_msgSend(v14, "boldSystemFontOfSize:")));
  -[UILabel setBackgroundColor:](-[ACM2SVTrustedDevicesViewController emptyLabel](self, "emptyLabel"), "setBackgroundColor:", -[ACM2SVTrustedDevicesViewController backgroundColor](self, "backgroundColor"));
  v15 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Two-step verification is enabled for this Apple ID."));
  v16 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontSize");
  -[ACM2SVTrustedDevicesViewController setHeaderTitleLabel:](self, "setHeaderTitleLabel:", -[ACM2SVTrustedDevicesViewController labelWithText:font:](self, "labelWithText:font:", v15, objc_msgSend(v16, "boldSystemFontOfSize:")));
  -[UILabel setBackgroundColor:](-[ACM2SVTrustedDevicesViewController headerTitleLabel](self, "headerTitleLabel"), "setBackgroundColor:", -[ACM2SVTrustedDevicesViewController backgroundColor](self, "backgroundColor"));
  v17 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("The device you select below will be sent a temporary code that you can use to verify your identity."));
  v18 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontSize");
  -[ACM2SVTrustedDevicesViewController setHeaderTextLabel:](self, "setHeaderTextLabel:", -[ACM2SVTrustedDevicesViewController labelWithText:font:](self, "labelWithText:font:", v17, objc_msgSend(v18, "systemFontOfSize:")));
  -[UILabel setBackgroundColor:](-[ACM2SVTrustedDevicesViewController headerTextLabel](self, "headerTextLabel"), "setBackgroundColor:", -[ACM2SVTrustedDevicesViewController backgroundColor](self, "backgroundColor"));
  v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("To manage your trusted devices visit %@ from a Mac or PC.")), CFSTR("appleid.apple.com"));
  v20 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontSize");
  -[ACM2SVTrustedDevicesViewController setFooterTextLabel:](self, "setFooterTextLabel:", -[ACM2SVTrustedDevicesViewController labelWithText:font:](self, "labelWithText:font:", v19, objc_msgSend(v20, "systemFontOfSize:")));
  -[UILabel setBackgroundColor:](-[ACM2SVTrustedDevicesViewController footerTextLabel](self, "footerTextLabel"), "setBackgroundColor:", -[ACM2SVTrustedDevicesViewController backgroundColor](self, "backgroundColor"));
  -[ACM2SVTrustedDevicesViewController setFooterButton:](self, "setFooterButton:", -[ACM2SVTrustedDevicesViewController footerButtonWithText:](self, "footerButtonWithText:", +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Unable to receive messages at any of your devices?"))));
  -[UIButton setBackgroundColor:](-[ACM2SVTrustedDevicesViewController footerButton](self, "footerButton"), "setBackgroundColor:", -[ACM2SVTrustedDevicesViewController backgroundColor](self, "backgroundColor"));
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addSubview:", -[ACM2SVTrustedDevicesViewController emptyLabel](self, "emptyLabel"));
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addSubview:", -[ACM2SVTrustedDevicesViewController headerTextLabel](self, "headerTextLabel"));
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addSubview:", -[ACM2SVTrustedDevicesViewController headerTitleLabel](self, "headerTitleLabel"));
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addSubview:", -[ACM2SVTrustedDevicesViewController footerTextLabel](self, "footerTextLabel"));
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addSubview:", -[ACM2SVTrustedDevicesViewController footerButton](self, "footerButton"));
  -[ACM2SVTrustedDevicesViewController buildConstraints](self, "buildConstraints");
}

- (void)buildConstraints
{
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](-[ACM2SVTrustedDevicesViewController emptyLabel](self, "emptyLabel"), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](-[ACM2SVTrustedDevicesViewController trustedDevicesListView](self, "trustedDevicesListView"), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](-[ACM2SVTrustedDevicesViewController headerTitleLabel](self, "headerTitleLabel"), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](-[ACM2SVTrustedDevicesViewController headerTextLabel](self, "headerTextLabel"), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](-[ACM2SVTrustedDevicesViewController footerTextLabel](self, "footerTextLabel"), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](-[ACM2SVTrustedDevicesViewController footerButton](self, "footerButton"), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ACM2SVTrustedDevicesViewController buildHorizontalConstraints](self, "buildHorizontalConstraints");
  -[ACM2SVTrustedDevicesViewController buildVerticalConstraints](self, "buildVerticalConstraints");
}

- (double)navigationBarHeight
{
  double v3;
  double v4;
  _BOOL4 v5;
  double result;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "statusBarFrame");
  v4 = v3 + 64.0;
  v5 = -[ACM2SVTrustedDevicesViewController isLegacyStyle](self, "isLegacyStyle");
  result = 44.0;
  if (!v5)
    return v4;
  return result;
}

- (BOOL)isLegacyStyle
{
  return floor(*MEMORY[0x24BDD0D50]) <= 993.0;
}

- (double)tableHeight
{
  UITableView *v3;
  UITableViewCell *v4;
  double v5;
  double v6;
  double v7;
  UITableViewHeaderFooterView *v8;
  double v9;

  if (-[NSArray count](-[ACM2SVTrustedDevicesViewController trustedDevicesArray](self, "trustedDevicesArray"), "count"))
  {
    v3 = -[ACM2SVTrustedDevicesViewController trustedDevicesListView](self, "trustedDevicesListView");
    v4 = -[UITableView cellForRowAtIndexPath:](v3, "cellForRowAtIndexPath:", objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0));
    if (v4)
    {
      -[UITableViewCell frame](v4, "frame");
      v6 = v5;
    }
    else
    {
      v6 = 44.0;
    }
    v7 = v6
       * (double)-[NSArray count](-[ACM2SVTrustedDevicesViewController trustedDevicesArray](self, "trustedDevicesArray"), "count");
  }
  else
  {
    v7 = 44.0;
  }
  v8 = -[UITableView headerViewForSection:](-[ACM2SVTrustedDevicesViewController trustedDevicesListView](self, "trustedDevicesListView"), "headerViewForSection:", 0);
  if (v8)
    -[UITableViewHeaderFooterView frame](v8, "frame");
  else
    v9 = 55.5;
  return v7 + v9;
}

- (void)buildHorizontalConstraints
{
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVTrustedDevicesViewController emptyLabel](self, "emptyLabel"), 1, 0, -[ACM2SVTrustedDevicesViewController view](self, "view"), 1, 1.0, 0.0));
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVTrustedDevicesViewController emptyLabel](self, "emptyLabel"), 2, 0, -[ACM2SVTrustedDevicesViewController view](self, "view"), 2, 1.0, 0.0));
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVTrustedDevicesViewController headerTitleLabel](self, "headerTitleLabel"), 1, 0, -[ACM2SVTrustedDevicesViewController view](self, "view"), 1, 1.0, 12.0));
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVTrustedDevicesViewController headerTitleLabel](self, "headerTitleLabel"), 2, 0, -[ACM2SVTrustedDevicesViewController view](self, "view"), 2, 1.0, -12.0));
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVTrustedDevicesViewController headerTextLabel](self, "headerTextLabel"), 1, 0, -[ACM2SVTrustedDevicesViewController view](self, "view"), 1, 1.0, 12.0));
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVTrustedDevicesViewController headerTextLabel](self, "headerTextLabel"), 2, 0, -[ACM2SVTrustedDevicesViewController view](self, "view"), 2, 1.0, -12.0));
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVTrustedDevicesViewController trustedDevicesListView](self, "trustedDevicesListView"), 1, 0, -[ACM2SVTrustedDevicesViewController view](self, "view"), 1, 1.0, 0.0));
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVTrustedDevicesViewController trustedDevicesListView](self, "trustedDevicesListView"), 2, 0, -[ACM2SVTrustedDevicesViewController view](self, "view"), 2, 1.0, 0.0));
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVTrustedDevicesViewController footerButton](self, "footerButton"), 1, 0, -[ACM2SVTrustedDevicesViewController view](self, "view"), 1, 1.0, 12.0));
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVTrustedDevicesViewController footerButton](self, "footerButton"), 2, 0, -[ACM2SVTrustedDevicesViewController view](self, "view"), 2, 1.0, -12.0));
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVTrustedDevicesViewController footerTextLabel](self, "footerTextLabel"), 1, 0, -[ACM2SVTrustedDevicesViewController view](self, "view"), 1, 1.0, 12.0));
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVTrustedDevicesViewController footerTextLabel](self, "footerTextLabel"), 2, 0, -[ACM2SVTrustedDevicesViewController view](self, "view"), 2, 1.0, -12.0));
}

- (void)buildVerticalConstraints
{
  void *v3;
  UILabel *v4;
  double v5;
  void *v6;
  UILabel *v7;
  double v8;
  void *v9;
  UITableView *v10;
  UILabel *v11;
  double v12;
  void *v13;
  UITableView *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  UILabel *v21;
  double v22;

  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVTrustedDevicesViewController emptyLabel](self, "emptyLabel"), 3, 0, -[ACM2SVTrustedDevicesViewController view](self, "view"), 3, 1.0, 0.0));
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVTrustedDevicesViewController emptyLabel](self, "emptyLabel"), 8, 0, 0, 8, 1.0, 10.0));
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVTrustedDevicesViewController headerTitleLabel](self, "headerTitleLabel"), 3, 0, -[ACM2SVTrustedDevicesViewController view](self, "view"), 3, 1.0, 10.0));
  v3 = (void *)MEMORY[0x24BDD1628];
  v4 = -[ACM2SVTrustedDevicesViewController headerTitleLabel](self, "headerTitleLabel");
  -[UILabel frame](-[ACM2SVTrustedDevicesViewController headerTitleLabel](self, "headerTitleLabel"), "frame");
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addConstraint:", objc_msgSend(v3, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 8, 0, 0, 8, 1.0, v5));
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVTrustedDevicesViewController headerTextLabel](self, "headerTextLabel"), 3, 0, -[ACM2SVTrustedDevicesViewController headerTitleLabel](self, "headerTitleLabel"), 4, 1.0, 10.0));
  v6 = (void *)MEMORY[0x24BDD1628];
  v7 = -[ACM2SVTrustedDevicesViewController headerTextLabel](self, "headerTextLabel");
  -[UILabel frame](-[ACM2SVTrustedDevicesViewController headerTextLabel](self, "headerTextLabel"), "frame");
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addConstraint:", objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 8, 0, 0, 8, 1.0, v8));
  v9 = (void *)MEMORY[0x24BDD1628];
  v10 = -[ACM2SVTrustedDevicesViewController trustedDevicesListView](self, "trustedDevicesListView");
  v11 = -[ACM2SVTrustedDevicesViewController headerTextLabel](self, "headerTextLabel");
  if (-[ACM2SVTrustedDevicesViewController isLegacyStyle](self, "isLegacyStyle"))
    v12 = 10.0;
  else
    v12 = -18.0;
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addConstraint:", objc_msgSend(v9, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 3, 0, v11, 4, 1.0, v12));
  v13 = (void *)MEMORY[0x24BDD1628];
  v14 = -[ACM2SVTrustedDevicesViewController trustedDevicesListView](self, "trustedDevicesListView");
  -[ACM2SVTrustedDevicesViewController tableHeight](self, "tableHeight");
  v16 = (void *)objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 8, 0, 0, 8, 1.0, v15);
  LODWORD(v17) = 1112014848;
  objc_msgSend(v16, "setPriority:", v17);
  -[ACM2SVTrustedDevicesViewController setTableConstraint:](self, "setTableConstraint:", v16);
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addConstraint:", v16);
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVTrustedDevicesViewController footerButton](self, "footerButton"), 3, 0, -[ACM2SVTrustedDevicesViewController trustedDevicesListView](self, "trustedDevicesListView"), 4, 1.0, 24.0));
  v18 = (void *)objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVTrustedDevicesViewController footerButton](self, "footerButton"), 8, 0, 0, 8, 1.0, 10.0);
  LODWORD(v19) = 1112014848;
  objc_msgSend(v18, "setPriority:", v19);
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addConstraint:", v18);
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVTrustedDevicesViewController footerTextLabel](self, "footerTextLabel"), 3, 0, -[ACM2SVTrustedDevicesViewController footerButton](self, "footerButton"), 4, 1.0, 18.0));
  v20 = (void *)MEMORY[0x24BDD1628];
  v21 = -[ACM2SVTrustedDevicesViewController footerTextLabel](self, "footerTextLabel");
  -[UILabel frame](-[ACM2SVTrustedDevicesViewController footerTextLabel](self, "footerTextLabel"), "frame");
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "addConstraint:", objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 8, 0, 0, 8, 1.0, v22));
}

- (void)presentWithParentViewController:(id)a3 deviceList:(id)a4 completion:(id)a5
{
  UINavigationController *v9;
  _QWORD v10[6];

  if (-[ACM2SVTrustedDevicesViewController completionBlock](self, "completionBlock"))
  {
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
  }
  else
  {
    if (a4)
      -[ACM2SVTrustedDevicesViewController resetWithDeviceList:](self, "resetWithDeviceList:", a4);
    -[ACM2SVTrustedDevicesViewController setCompletionBlock:](self, "setCompletionBlock:", a5);
    -[ACM2SVTrustedDevicesViewController setNavigationController:](self, "setNavigationController:", objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", self));
    -[UINavigationController setDelegate:](-[ACM2SVTrustedDevicesViewController navigationController](self, "navigationController"), "setDelegate:", self);
    -[UINavigationBar setTranslucent:](-[UINavigationController navigationBar](-[ACM2SVTrustedDevicesViewController navigationController](self, "navigationController"), "navigationBar"), "setTranslucent:", 0);
    v9 = -[ACM2SVTrustedDevicesViewController navigationController](self, "navigationController");
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __92__ACM2SVTrustedDevicesViewController_presentWithParentViewController_deviceList_completion___block_invoke;
    v10[3] = &unk_24FCE5100;
    v10[4] = a4;
    v10[5] = self;
    objc_msgSend(a3, "presentViewController:animated:completion:", v9, 1, v10);
  }
}

uint64_t __92__ACM2SVTrustedDevicesViewController_presentWithParentViewController_deviceList_completion___block_invoke(uint64_t result)
{
  if (!*(_QWORD *)(result + 32))
    return objc_msgSend((id)objc_msgSend(*(id *)(result + 40), "delegate"), "trustedDevicesViewControllerNeedsRefresh:", *(_QWORD *)(result + 40));
  return result;
}

- (void)hideAnimated:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v5;

  v5 = a3;
  -[ACM2SVTrustedDevicesViewController setCompletionBlock:](self, "setCompletionBlock:", 0);
  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController presentingViewController](self, "presentingViewController"), "dismissViewControllerAnimated:completion:", v5, a4);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ACM2SVTrustedDevicesViewController;
  -[ACM2SVTrustedDevicesViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[ACM2SVTrustedDevicesViewController reset](self, "reset");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[ACM2SVTrustedDevicesViewController stopImageDownloads](self, "stopImageDownloads");
  v5.receiver = self;
  v5.super_class = (Class)ACM2SVTrustedDevicesViewController;
  -[ACM2SVTrustedDevicesViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)setDelegate:(id)a3
{
  if (self->_delegate != a3)
  {
    -[ACM2SVTrustedDevicesViewController stopImageDownloads](self, "stopImageDownloads");
    self->_delegate = (ACM2SVTrustedDevicesViewControllerDelegate *)a3;
  }
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
  {
    return 30;
  }
  else
  {
    return 2;
  }
}

- (CGSize)sizeOfString:(id)a3 withFont:(id)a4 widthConstraints:(double)a5
{
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __CFString *v14;
  __CFString *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGSize result;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = *MEMORY[0x24BDBF148];
  v7 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v9 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("\n"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(__CFString **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (-[__CFString length](v14, "length"))
          v15 = v14;
        else
          v15 = CFSTR("A");
        -[__CFString sizeWithFont:constrainedToSize:lineBreakMode:](v15, "sizeWithFont:constrainedToSize:lineBreakMode:", a4, 0, a5, 300.0);
        if (v8 < v16)
          v8 = v16;
        v7 = v7 + v17;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }
  v18 = v8;
  v19 = v7;
  result.height = v19;
  result.width = v18;
  return result;
}

- (id)labelWithText:(id)a3 font:(id)a4
{
  double v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;

  objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "bounds");
  -[ACM2SVTrustedDevicesViewController sizeOfString:withFont:widthConstraints:](self, "sizeOfString:withFont:widthConstraints:", a3, a4, v7);
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", 0.0, 0.0, v9, v8 + 18.0);
  objc_msgSend(v10, "setText:", a3);
  objc_msgSend(v10, "setFont:", a4);
  if (-[ACM2SVTrustedDevicesViewController isLegacyStyle](self, "isLegacyStyle"))
    v11 = 3;
  else
    v11 = 0;
  objc_msgSend(v10, "setNumberOfLines:", v11);
  objc_msgSend(v10, "setTextColor:", -[ACM2SVTrustedDevicesViewController labelTextColor](self, "labelTextColor"));
  objc_msgSend(v10, "setLineBreakMode:", 0);
  objc_msgSend(v10, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
  return v10;
}

- (id)footerButtonWithText:(id)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;

  v5 = -[ACM2SVTrustedDevicesViewController isLegacyStyle](self, "isLegacyStyle");
  v6 = (void *)objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", !v5);
  if (-[ACM2SVTrustedDevicesViewController isLegacyStyle](self, "isLegacyStyle"))
  {
    objc_msgSend(v6, "setTitleColor:forState:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.09, 0.52, 1.0, 1.0), 0);
    objc_msgSend(v6, "setTitleColor:forState:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.5, 0.5, 0.5, 1.0), 1);
  }
  objc_msgSend(v6, "setTitle:forState:", a3, 0);
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_unableReceiveMessagesTextDidTap_, 64);
  objc_msgSend((id)objc_msgSend(v6, "titleLabel"), "setNumberOfLines:", 0);
  objc_msgSend((id)objc_msgSend(v6, "titleLabel"), "setLineBreakMode:", 0);
  objc_msgSend((id)objc_msgSend(v6, "titleLabel"), "setTextAlignment:", 1);
  v7 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontSize");
  objc_msgSend((id)objc_msgSend(v6, "titleLabel"), "setFont:", objc_msgSend(v7, "systemFontOfSize:"));
  return v6;
}

- (void)reset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  -[ACM2SVTrustedDevicesViewController setSelectedDeviceIndex:](self, "setSelectedDeviceIndex:", -1);
  -[ACM2SVTrustedDevicesViewController disableControls:](self, "disableControls:", 0);
  -[UITableView reloadData](-[ACM2SVTrustedDevicesViewController trustedDevicesListView](self, "trustedDevicesListView"), "reloadData");
  -[ACM2SVTrustedDevicesViewController tableHeight](self, "tableHeight");
  if (v3 > 0.0)
  {
    v4 = v3;
    -[UITableView frame](-[ACM2SVTrustedDevicesViewController trustedDevicesListView](self, "trustedDevicesListView"), "frame");
    v6 = v4 - v5;
    objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "frame");
    v8 = v7;
    -[UILabel frame](-[ACM2SVTrustedDevicesViewController footerTextLabel](self, "footerTextLabel"), "frame");
    v10 = v9;
    -[UILabel frame](-[ACM2SVTrustedDevicesViewController footerTextLabel](self, "footerTextLabel"), "frame");
    v12 = v8 - (v10 + v11 + 10.0);
    if (v6 <= v12)
      v13 = v6;
    else
      v13 = v8 - (v10 + v11 + 10.0);
    -[UITableView setScrollEnabled:](-[ACM2SVTrustedDevicesViewController trustedDevicesListView](self, "trustedDevicesListView"), "setScrollEnabled:", v6 > v12);
    -[UITableView frame](-[ACM2SVTrustedDevicesViewController trustedDevicesListView](self, "trustedDevicesListView"), "frame");
    -[NSLayoutConstraint setConstant:](-[ACM2SVTrustedDevicesViewController tableConstraint](self, "tableConstraint"), "setConstant:", v14 + v13);
    objc_msgSend((id)-[ACM2SVTrustedDevicesViewController view](self, "view"), "setNeedsUpdateConstraints");
  }
}

- (void)disableControls:(BOOL)a3
{
  _BOOL8 v5;

  v5 = !a3;
  -[UITableView setAllowsSelection:](-[ACM2SVTrustedDevicesViewController trustedDevicesListView](self, "trustedDevicesListView"), "setAllowsSelection:", v5);
  objc_msgSend((id)objc_msgSend((id)-[ACM2SVTrustedDevicesViewController navigationItem](self, "navigationItem"), "leftBarButtonItem"), "setEnabled:", v5);
  objc_msgSend((id)objc_msgSend((id)-[ACM2SVTrustedDevicesViewController navigationItem](self, "navigationItem"), "rightBarButtonItem"), "setEnabled:", v5);
  if (!a3)
    objc_msgSend((id)objc_msgSend((id)-[ACM2SVTrustedDevicesViewController navigationItem](self, "navigationItem"), "rightBarButtonItem"), "setEnabled:", -[ACM2SVTrustedDevicesViewController selectedDeviceIndex](self, "selectedDeviceIndex") != -1);
}

- (void)resetWithDeviceList:(id)a3
{
  if (a3)
    -[ACM2SVTrustedDevicesViewController setTrustedDevicesArray:](self, "setTrustedDevicesArray:");
  -[ACM2SVTrustedDevicesViewController reset](self, "reset");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](-[ACM2SVTrustedDevicesViewController trustedDevicesArray](self, "trustedDevicesArray", a3, a4), "count");
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("TRUSTED DEVICES"), a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  id v11;
  id v12;
  const __CFString *v13;

  v6 = (id)objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("ACM2SVTrustedDeviceCellIdentifier"));
  if (!v6)
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 3, CFSTR("ACM2SVTrustedDeviceCellIdentifier"));
  v7 = -[NSArray objectAtIndex:](-[ACM2SVTrustedDevicesViewController trustedDevicesArray](self, "trustedDevicesArray"), "objectAtIndex:", objc_msgSend(a4, "row"));
  objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 15.0));
  v8 = objc_msgSend(a4, "row");
  if (v8 == -[ACM2SVTrustedDevicesViewController selectedDeviceIndex](self, "selectedDeviceIndex"))
    v9 = 3;
  else
    v9 = 0;
  objc_msgSend(v6, "setAccessoryType:", v9);
  objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setText:", objc_msgSend(v7, "deviceDisplayDescription"));
  if (objc_msgSend(v7, "isSMSDevice"))
  {
    v10 = CFSTR("SMS to Phone Number");
LABEL_10:
    v11 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", v10);
    goto LABEL_12;
  }
  if (objc_msgSend(v7, "isTOTPDevice"))
  {
    v10 = CFSTR("Generate TOTP code");
    goto LABEL_10;
  }
  v11 = (id)objc_msgSend(v7, "deviceModelName");
LABEL_12:
  objc_msgSend((id)objc_msgSend(v6, "detailTextLabel"), "setText:", v11);
  if (!-[ACM2SVTrustedDevicesViewController isLegacyStyle](self, "isLegacyStyle"))
  {
    objc_msgSend(v6, "setBackgroundColor:", -[ACM2SVTrustedDevicesViewController backgroundColor](self, "backgroundColor"));
    objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setTextColor:", -[ACM2SVTrustedDevicesViewController textColor](self, "textColor"));
    objc_msgSend((id)objc_msgSend(v6, "detailTextLabel"), "setTextColor:", -[ACM2SVTrustedDevicesViewController textColor](self, "textColor"));
  }
  objc_msgSend((id)objc_msgSend(v6, "imageView"), "setContentMode:", 1);
  if (objc_msgSend(v7, "deviceIcon"))
  {
    v12 = +[ACMUIImageUtilities cropServerImage:bySize:](ACMUIImageUtilities, "cropServerImage:bySize:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:", objc_msgSend(v7, "deviceIcon")), 10.0, 0.0);
  }
  else
  {
    if (objc_msgSend(v7, "isSMSDevice"))
    {
      v13 = CFSTR("sms.png");
    }
    else
    {
      if (!objc_msgSend(v7, "isTOTPDevice"))
      {
        objc_msgSend((id)objc_msgSend(v6, "imageView"), "setImage:", +[ACMUIImageUtilities transparentImageWithSize:](ACMUIImageUtilities, "transparentImageWithSize:", 30.0, 44.0));
        -[ACM2SVTrustedDevicesViewController startIconDownloadForDevice:forIndexPath:](self, "startIconDownloadForDevice:forIndexPath:", v7, a4);
        return v6;
      }
      v13 = CFSTR("totp.png");
    }
    v12 = ACMImageWithName((uint64_t)v13);
  }
  objc_msgSend((id)objc_msgSend(v6, "imageView"), "setImage:", v12);
  return v6;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[ACM2SVTrustedDevicesViewController setSelectedDeviceIndex:](self, "setSelectedDeviceIndex:", objc_msgSend(a4, "row"));
  objc_msgSend((id)objc_msgSend((id)-[ACM2SVTrustedDevicesViewController navigationItem](self, "navigationItem"), "rightBarButtonItem"), "setEnabled:", 1);
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", a4, 1);
  objc_msgSend(a3, "reloadData");
}

- (void)startIconDownloadForDevice:(id)a3 forIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  ACM2SVTrustedDevicesViewControllerDelegate *v9;
  _QWORD v10[7];

  if ((-[NSMutableArray containsObject:](-[ACM2SVTrustedDevicesViewController imageDownloadsInProgress](self, "imageDownloadsInProgress"), "containsObject:", objc_msgSend(a3, "deviceID")) & 1) == 0)
  {
    -[NSMutableArray addObject:](-[ACM2SVTrustedDevicesViewController imageDownloadsInProgress](self, "imageDownloadsInProgress"), "addObject:", objc_msgSend(a3, "deviceID"));
    v7 = objc_msgSend(a3, "imageURL");
    if (v7)
    {
      v8 = v7;
      if (ACFLog)
      {
        if ((ACFLogSettingsGetLevelMask() & 0x80) != 0)
          ACFLog(7, (uint64_t)"-[ACM2SVTrustedDevicesViewController startIconDownloadForDevice:forIndexPath:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACM2SVTrustedDevicesViewController.m", 589, 0, "Download image from URL %@ for device: %@", v8, a3);
      }
      v9 = -[ACM2SVTrustedDevicesViewController delegate](self, "delegate");
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __78__ACM2SVTrustedDevicesViewController_startIconDownloadForDevice_forIndexPath___block_invoke;
      v10[3] = &unk_24FCE5678;
      v10[4] = self;
      v10[5] = a4;
      v10[6] = a3;
      -[ACM2SVTrustedDevicesViewControllerDelegate downloadImageWithURL:completionBlock:](v9, "downloadImageWithURL:completionBlock:", v8, v10);
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      ACFLog(3, (uint64_t)"-[ACM2SVTrustedDevicesViewController startIconDownloadForDevice:forIndexPath:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACM2SVTrustedDevicesViewController.m", 620, 0, "Couldn't create URL for device %@", a3);
    }
  }
}

uint64_t __78__ACM2SVTrustedDevicesViewController_startIconDownloadForDevice_forIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;

  if (objc_msgSend(a2, "length"))
  {
    v4 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "trustedDevicesListView"), "cellForRowAtIndexPath:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "setDeviceIcon:", a2);
    v5 = objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:", objc_msgSend(*(id *)(a1 + 48), "deviceIcon"));
    if (v5)
    {
      objc_msgSend((id)objc_msgSend(v4, "imageView"), "setImage:", +[ACMUIImageUtilities cropServerImage:bySize:](ACMUIImageUtilities, "cropServerImage:bySize:", v5, 10.0, 0.0));
      objc_msgSend(v4, "setNeedsLayout");
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    {
      ACFLog(6, (uint64_t)"-[ACM2SVTrustedDevicesViewController startIconDownloadForDevice:forIndexPath:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACM2SVTrustedDevicesViewController.m", 606, 0, "Failed to create image for device: %@", *(_QWORD *)(a1 + 48));
    }
  }
  else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
  {
    ACFLog(6, (uint64_t)"-[ACM2SVTrustedDevicesViewController startIconDownloadForDevice:forIndexPath:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACM2SVTrustedDevicesViewController.m", 611, 0, "Image not found for device: %@", *(_QWORD *)(a1 + 48));
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "imageDownloadsInProgress"), "removeObject:", objc_msgSend(*(id *)(a1 + 48), "deviceID"));
}

- (void)stopImageDownloads
{
  -[ACM2SVTrustedDevicesViewControllerDelegate cancelInProgressImageDownloads](-[ACM2SVTrustedDevicesViewController delegate](self, "delegate"), "cancelInProgressImageDownloads");
  -[NSMutableArray removeAllObjects](-[ACM2SVTrustedDevicesViewController imageDownloadsInProgress](self, "imageDownloadsInProgress"), "removeAllObjects");
}

- (void)sendAction:(id)a3
{
  void (**v4)(id, id);

  -[ACM2SVTrustedDevicesViewController disableControls:](self, "disableControls:", 1);
  v4 = -[ACM2SVTrustedDevicesViewController completionBlock](self, "completionBlock");
  v4[2](v4, -[NSArray objectAtIndexedSubscript:](-[ACM2SVTrustedDevicesViewController trustedDevicesArray](self, "trustedDevicesArray"), "objectAtIndexedSubscript:", -[ACM2SVTrustedDevicesViewController selectedDeviceIndex](self, "selectedDeviceIndex")));
}

- (void)cancelAction:(id)a3
{
  void (**v4)(id, _QWORD);

  v4 = -[ACM2SVTrustedDevicesViewController completionBlock](self, "completionBlock", a3);
  v4[2](v4, 0);
  -[ACM2SVTrustedDevicesViewController setCompletionBlock:](self, "setCompletionBlock:", 0);
}

- (void)unableReceiveMessagesTextDidTap:(id)a3
{
  -[ACM2SVTrustedDevicesViewControllerDelegate trustedDevicesViewControllerDidSelectUnableReceiveMessages:](-[ACM2SVTrustedDevicesViewController delegate](self, "delegate", a3), "trustedDevicesViewControllerDidSelectUnableReceiveMessages:", self);
}

- (ACM2SVTrustedDevicesViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (NSArray)trustedDevicesArray
{
  return (NSArray *)objc_getProperty(self, a2, 976, 1);
}

- (void)setTrustedDevicesArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 976);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 984);
}

- (UIColor)labelTextColor
{
  return self->_labelTextColor;
}

- (void)setLabelTextColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 992);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1000);
}

- (int64_t)suggestedStatusBarStyle
{
  return self->_suggestedStatusBarStyle;
}

- (void)setSuggestedStatusBarStyle:(int64_t)a3
{
  self->_suggestedStatusBarStyle = a3;
}

- (UILabel)emptyLabel
{
  return self->_emptyLabel;
}

- (void)setEmptyLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1016);
}

- (UILabel)headerTitleLabel
{
  return self->_headerTitleLabel;
}

- (void)setHeaderTitleLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1024);
}

- (UILabel)headerTextLabel
{
  return self->_headerTextLabel;
}

- (void)setHeaderTextLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1032);
}

- (UILabel)footerTextLabel
{
  return self->_footerTextLabel;
}

- (void)setFooterTextLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1040);
}

- (UIButton)footerButton
{
  return self->_footerButton;
}

- (void)setFooterButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1048);
}

- (NSLayoutConstraint)tableConstraint
{
  return self->_tableConstraint;
}

- (void)setTableConstraint:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1056);
}

- (UITableView)trustedDevicesListView
{
  return self->_trustedDevicesListView;
}

- (void)setTrustedDevicesListView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1064);
}

- (int64_t)selectedDeviceIndex
{
  return self->_selectedDeviceIndex;
}

- (void)setSelectedDeviceIndex:(int64_t)a3
{
  self->_selectedDeviceIndex = a3;
}

- (NSMutableArray)imageDownloadsInProgress
{
  return self->_imageDownloadsInProgress;
}

- (void)setImageDownloadsInProgress:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1080);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1088);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1096);
}

@end
