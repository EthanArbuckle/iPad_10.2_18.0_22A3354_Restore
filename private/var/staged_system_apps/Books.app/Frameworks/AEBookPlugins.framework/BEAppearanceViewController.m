@implementation BEAppearanceViewController

- (BEAppearanceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  BEAppearanceViewController *v4;
  BEAppearanceViewController *v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BEAppearanceViewController;
  v4 = -[BKViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_scrollSwitchEnabled = 1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v7 = -[BEAppearanceViewController registerForTraitChanges:withAction:](v5, "registerForTraitChanges:withAction:", v6, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[BEAppearanceViewController releaseViews](self, "releaseViews");
  v3.receiver = self;
  v3.super_class = (Class)BEAppearanceViewController;
  -[BKViewController dealloc](&v3, "dealloc");
}

- (UISlider)brightnessSlider
{
  double v3;
  CGFloat v4;
  UISlider *v5;
  UISlider *brightnessSlider;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  CGRect v12;

  if (!self->_brightnessSlider
    && +[BEAppearanceViewController canChangeBrightness](BEAppearanceViewController, "canChangeBrightness"))
  {
    -[BEAppearanceViewController appearanceRowHeight](self, "appearanceRowHeight");
    v4 = v3 + -1.0;
    v5 = (UISlider *)objc_msgSend(objc_alloc((Class)UISlider), "initWithFrame:", 12.0, 1.0, 272.0, v3 + -1.0);
    brightnessSlider = self->_brightnessSlider;
    self->_brightnessSlider = v5;

    -[UISlider setTranslatesAutoresizingMaskIntoConstraints:](self->_brightnessSlider, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UISlider heightAnchor](self->_brightnessSlider, "heightAnchor"));
    v12.origin.x = 12.0;
    v12.origin.y = 1.0;
    v12.size.width = 272.0;
    v12.size.height = v4;
    v8 = objc_msgSend(v7, "constraintEqualToConstant:", CGRectGetHeight(v12));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v9, "setActive:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController theme](self, "theme"));
    objc_msgSend(v10, "stylizeSlider:", self->_brightnessSlider);

    -[UISlider addTarget:action:forControlEvents:](self->_brightnessSlider, "addTarget:action:forControlEvents:", self, "changeBrightness:withEvent:", 4096);
  }
  return self->_brightnessSlider;
}

- (UIButton)sizeSmallerButton
{
  UIButton *sizeSmallerButton;
  UIButton *v4;
  UIButton *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  sizeSmallerButton = self->_sizeSmallerButton;
  if (!sizeSmallerButton)
  {
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    v5 = self->_sizeSmallerButton;
    self->_sizeSmallerButton = v4;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_sizeSmallerButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController theme](self, "theme"));
    objc_msgSend(v6, "stylizeButton:", self->_sizeSmallerButton);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController theme](self, "theme"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "popoverBackgroundColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorWithAlphaComponent:", 0.001));
    -[UIButton setBackgroundColor:](self->_sizeSmallerButton, "setBackgroundColor:", v9);

    LODWORD(v7) = -[BEAppearanceViewController _isRTL](self, "_isRTL");
    -[BEAppearanceViewController appearanceRowHeight](self, "appearanceRowHeight");
    v11 = v10;
    v12 = 0.0;
    if ((_DWORD)v7)
      v12 = 148.0;
    -[UIButton setFrame:](self->_sizeSmallerButton, "setFrame:", v12, 0.0, 148.0, v11);
    -[UIButton addTarget:action:forControlEvents:](self->_sizeSmallerButton, "addTarget:action:forControlEvents:", self, "decreaseFontSize:", 64);
    sizeSmallerButton = self->_sizeSmallerButton;
  }
  return sizeSmallerButton;
}

- (UIButton)sizeLargerButton
{
  UIButton *sizeLargerButton;
  UIButton *v4;
  UIButton *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  sizeLargerButton = self->_sizeLargerButton;
  if (!sizeLargerButton)
  {
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    v5 = self->_sizeLargerButton;
    self->_sizeLargerButton = v4;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_sizeLargerButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController theme](self, "theme"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "popoverBackgroundColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "colorWithAlphaComponent:", 0.001));
    -[UIButton setBackgroundColor:](self->_sizeLargerButton, "setBackgroundColor:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController theme](self, "theme"));
    objc_msgSend(v9, "stylizeButton:", self->_sizeLargerButton);

    LODWORD(v9) = -[BEAppearanceViewController _isRTL](self, "_isRTL");
    -[BEAppearanceViewController appearanceRowHeight](self, "appearanceRowHeight");
    v11 = v10;
    v12 = 0.0;
    if (!(_DWORD)v9)
      v12 = 148.0;
    -[UIButton setFrame:](self->_sizeLargerButton, "setFrame:", v12, 0.0, 148.0, v11);
    -[UIButton addTarget:action:forControlEvents:](self->_sizeLargerButton, "addTarget:action:forControlEvents:", self, "increaseFontSize:", 64);
    sizeLargerButton = self->_sizeLargerButton;
  }
  return sizeLargerButton;
}

- (UIView)fontSizeButtons
{
  UIView *fontSizeButtons;
  id v4;
  double v5;
  UIView *v6;
  UIView *v7;
  UIView *v8;
  void *v9;
  UIView *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  double MidX;
  double v17;
  UIView *v18;
  UIView *sizeSeparatorLine;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
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
  _QWORD v59[12];
  CGRect v60;

  fontSizeButtons = self->_fontSizeButtons;
  if (!fontSizeButtons)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController theme](self, "theme"));
    v4 = objc_alloc((Class)UIView);
    -[BEAppearanceViewController appearanceRowHeight](self, "appearanceRowHeight");
    v6 = (UIView *)objc_msgSend(v4, "initWithFrame:", 0.0, 0.0, 296.0, v5);
    v7 = self->_fontSizeButtons;
    self->_fontSizeButtons = v6;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_fontSizeButtons, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = self->_fontSizeButtons;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController sizeSmallerButton](self, "sizeSmallerButton"));
    -[UIView addSubview:](v8, "addSubview:", v9);

    v10 = self->_fontSizeButtons;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController sizeLargerButton](self, "sizeLargerButton"));
    -[UIView addSubview:](v10, "addSubview:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v12, "scale");
    v14 = 1.0 / v13;

    v15 = objc_alloc((Class)UIView);
    -[UIView frame](self->_fontSizeButtons, "frame");
    MidX = CGRectGetMidX(v60);
    -[BEAppearanceViewController appearanceRowHeight](self, "appearanceRowHeight");
    v18 = (UIView *)objc_msgSend(v15, "initWithFrame:", MidX, 0.0, v14, v17 - v14);
    sizeSeparatorLine = self->_sizeSeparatorLine;
    self->_sizeSeparatorLine = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "tableViewSeparatorColor"));
    -[UIView setBackgroundColor:](self->_sizeSeparatorLine, "setBackgroundColor:", v20);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_sizeSeparatorLine, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self->_fontSizeButtons, "addSubview:", self->_sizeSeparatorLine);
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_sizeSmallerButton, "leadingAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_fontSizeButtons, "leadingAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v56));
    v59[0] = v55;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_sizeSmallerButton, "trailingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_fontSizeButtons, "centerXAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v53));
    v59[1] = v52;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_sizeSmallerButton, "topAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_fontSizeButtons, "topAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v50));
    v59[2] = v49;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_sizeSmallerButton, "bottomAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_fontSizeButtons, "bottomAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v47));
    v59[3] = v46;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_sizeLargerButton, "leadingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_fontSizeButtons, "centerXAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v44));
    v59[4] = v43;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_sizeLargerButton, "trailingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_fontSizeButtons, "trailingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
    v59[5] = v40;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_sizeLargerButton, "topAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_fontSizeButtons, "topAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
    v59[6] = v37;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_sizeLargerButton, "bottomAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_fontSizeButtons, "bottomAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
    v59[7] = v34;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_sizeSeparatorLine, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_fontSizeButtons, "topAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
    v59[8] = v31;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_sizeSeparatorLine, "bottomAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_fontSizeButtons, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v21, -v14));
    v59[9] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_sizeSeparatorLine, "centerXAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_fontSizeButtons, "centerXAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
    v59[10] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_sizeSeparatorLine, "widthAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToConstant:", v14));
    v59[11] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 12));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

    fontSizeButtons = self->_fontSizeButtons;
  }
  return fontSizeButtons;
}

- (UISwitch)scrollSwitch
{
  UISwitch *scrollSwitch;
  UISwitch *v4;
  UISwitch *v5;

  scrollSwitch = self->_scrollSwitch;
  if (!scrollSwitch)
  {
    v4 = (UISwitch *)objc_msgSend(objc_alloc((Class)UISwitch), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_scrollSwitch;
    self->_scrollSwitch = v4;

    -[UISwitch setPreferredStyle:](self->_scrollSwitch, "setPreferredStyle:", 2);
    -[UISwitch setEnabled:](self->_scrollSwitch, "setEnabled:", -[BEAppearanceViewController scrollSwitchEnabled](self, "scrollSwitchEnabled"));
    -[UISwitch addTarget:action:forControlEvents:](self->_scrollSwitch, "addTarget:action:forControlEvents:", self, "onScrollSwitch:", 4096);
    -[UISwitch sizeToFit](self->_scrollSwitch, "sizeToFit");
    scrollSwitch = self->_scrollSwitch;
  }
  return scrollSwitch;
}

- (BOOL)_isRTL
{
  return (char *)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[UITableView semanticContentAttribute](self->_tableView, "semanticContentAttribute")) == (char *)&dword_0 + 1;
}

- (void)loadView
{
  id v3;
  double y;
  double width;
  double height;
  UITableView *v7;
  UITableView *tableView;
  id v9;
  void *v10;
  void *v11;
  UIView *v12;
  UIView *arrowBackgroundView;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;
  _QWORD v42[8];

  v41.receiver = self;
  v41.super_class = (Class)BEAppearanceViewController;
  -[BEAppearanceViewController loadView](&v41, "loadView");
  v3 = objc_alloc((Class)UITableView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 1, CGRectZero.origin.x, y, width, height);
  tableView = self->_tableView;
  self->_tableView = v7;

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  v9 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[UITableView setTableFooterView:](self->_tableView, "setTableFooterView:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v10);

  -[UITableView _setTopPadding:](self->_tableView, "_setTopPadding:", 0.0);
  -[UITableView _setBottomPadding:](self->_tableView, "_setBottomPadding:", 0.0);
  -[UITableView setEstimatedSectionHeaderHeight:](self->_tableView, "setEstimatedSectionHeaderHeight:", 5.0);
  -[UITableView setEstimatedSectionFooterHeight:](self->_tableView, "setEstimatedSectionFooterHeight:", 0.0);
  -[UITableView setSectionFooterHeight:](self->_tableView, "setSectionFooterHeight:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController view](self, "view"));
  v12 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  arrowBackgroundView = self->_arrowBackgroundView;
  self->_arrowBackgroundView = v12;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_arrowBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v11, "addSubview:", self->_arrowBackgroundView);
  objc_msgSend(v11, "addSubview:", self->_tableView);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leadingAnchor](self->_tableView, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v39));
  v42[0] = v38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView trailingAnchor](self->_tableView, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
  v42[1] = v35;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "safeAreaLayoutGuide"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
  v42[2] = v31;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_tableView, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "safeAreaLayoutGuide"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
  v42[3] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_arrowBackgroundView, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v42[4] = v23;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_arrowBackgroundView, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
  v42[5] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_arrowBackgroundView, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
  v42[6] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_arrowBackgroundView, "bottomAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
  v42[7] = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 8));

  objc_msgSend(v11, "addConstraints:", v24);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BEAppearanceViewController;
  -[BEAppearanceViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "updateBrightness", UIScreenBrightnessDidChangeNotification, v4);

  -[BEAppearanceViewController stylizeForTheme](self, "stylizeForTheme");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BEAppearanceViewController;
  -[BEAppearanceViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController ba_analyticsTracker](self, "ba_analyticsTracker"));

  if (!v4)
    v5 = -[BEAppearanceViewController ba_setupNewAnalyticsTrackerWithName:](self, "ba_setupNewAnalyticsTrackerWithName:", CFSTR("ContentSettings"));
  -[BEAppearanceViewController updateBrightness](self, "updateBrightness");
}

- (void)stylizeForTheme
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v36 = (id)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController themePage](self, "themePage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "keyColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController view](self, "view"));
  objc_msgSend(v4, "setTintColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "secondaryGroupedBackgroundColor"));
  -[UIView setBackgroundColor:](self->_arrowBackgroundView, "setBackgroundColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController brightnessSlider](self, "brightnessSlider"));
  if (v6)
  {
    objc_msgSend(v36, "stylizeSlider:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("sun.min.fill")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, 1, 18.0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageWithConfiguration:", v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "tertiaryTextColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageMaskWithColor:", v10));

    objc_msgSend(v6, "setMinimumValueImage:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("sun.max.fill")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, 2, 18.0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageWithConfiguration:", v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "tertiaryTextColor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageMaskWithColor:", v15));

    objc_msgSend(v6, "setMaximumValueImage:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "keyColor"));
    objc_msgSend(v6, "setMinimumTrackTintColor:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "quarternaryTextColor"));
    objc_msgSend(v6, "setMaximumTrackTintColor:", v18);

  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle3));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController sizeSmallerButton](self, "sizeSmallerButton"));
  objc_msgSend(v36, "stylizeButton:", v19);
  objc_msgSend(v35, "pointSize");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v20, -1));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("a"), v21));
  objc_msgSend(v19, "setImage:forState:", v22, 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController sizeLargerButton](self, "sizeLargerButton"));
  objc_msgSend(v36, "stylizeButton:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v20, 3));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("a"), v24));
  objc_msgSend(v23, "setImage:forState:", v25, 0);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController sizeSeparatorLine](self, "sizeSeparatorLine"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "separatorColor"));
  objc_msgSend(v26, "setBackgroundColor:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "groupedBackgroundColor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController tableView](self, "tableView"));
  objc_msgSend(v29, "setBackgroundColor:", v28);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "separatorColor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController tableView](self, "tableView"));
  objc_msgSend(v31, "setSeparatorColor:", v30);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController tableView](self, "tableView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "separatorColor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController sizeSeparatorLine](self, "sizeSeparatorLine"));
  objc_msgSend(v34, "setBackgroundColor:", v33);

}

- (void)configureHorizontalScrollSwitchCell:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = AEBundle();
  v7 = (id)objc_claimAutoreleasedReturnValue(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Horizontal Scrolling"), &stru_1C3088, 0));
  -[BEAppearanceViewController configureScrollSwitchCell:text:](self, "configureScrollSwitchCell:text:", v4, v6);

}

- (void)configureVerticalScrollSwitchCell:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = AEBundle();
  v7 = (id)objc_claimAutoreleasedReturnValue(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Vertical Scrolling"), &stru_1C3088, 0));
  -[BEAppearanceViewController configureScrollSwitchCell:text:](self, "configureScrollSwitchCell:text:", v4, v6);

}

- (void)configureScrollSwitchCell:(id)a3 text:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  objc_msgSend(v8, "setText:", v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  objc_msgSend(v10, "setMinimumScaleFactor:", 0.5);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController scrollSwitch](self, "scrollSwitch"));
  objc_msgSend(v7, "setAccessoryView:", v11);

}

- (void)releaseAuxiliaryCachedViews
{
  UIButton *sizeSmallerButton;
  UIButton *sizeLargerButton;
  UIView *sizeSeparatorLine;
  UIView *fontSizeButtons;
  UISlider *brightnessSlider;
  UISwitch *scrollSwitch;

  -[UIButton removeTarget:action:forControlEvents:](self->_sizeSmallerButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  sizeSmallerButton = self->_sizeSmallerButton;
  self->_sizeSmallerButton = 0;

  -[UIButton removeTarget:action:forControlEvents:](self->_sizeLargerButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  sizeLargerButton = self->_sizeLargerButton;
  self->_sizeLargerButton = 0;

  sizeSeparatorLine = self->_sizeSeparatorLine;
  self->_sizeSeparatorLine = 0;

  fontSizeButtons = self->_fontSizeButtons;
  self->_fontSizeButtons = 0;

  -[UISlider removeTarget:action:forControlEvents:](self->_brightnessSlider, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  brightnessSlider = self->_brightnessSlider;
  self->_brightnessSlider = 0;

  scrollSwitch = self->_scrollSwitch;
  self->_scrollSwitch = 0;

}

- (void)releaseViews
{
  void *v3;
  void *v4;
  UITableView *tableView;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIScreenBrightnessDidChangeNotification, v4);

  -[BEAppearanceViewController releaseAuxiliaryCachedViews](self, "releaseAuxiliaryCachedViews");
  tableView = self->_tableView;
  self->_tableView = 0;

  v6.receiver = self;
  v6.super_class = (Class)BEAppearanceViewController;
  -[BKViewController releaseViews](&v6, "releaseViews");
}

+ (BOOL)canChangeBrightness
{
  return 1;
}

- (void)changeBrightness:(id)a3 withEvent:(id)a4
{
  id v6;
  float v7;
  float v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  char *v13;
  void *v14;
  char v15;
  void *v16;
  double v17;
  id v18;

  v18 = a3;
  v6 = a4;
  objc_msgSend(v18, "value");
  v8 = v7;
  v9 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v10, "setBrightness:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allTouches"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "anyObject"));
  v13 = (char *)objc_msgSend(v12, "phase");

  if (v13 == (_BYTE *)&dword_0 + 3)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController delegate](self, "delegate"));
    v15 = objc_opt_respondsToSelector(v14, "appearanceViewController:brightnessLevelDidChange:");

    if ((v15 & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController delegate](self, "delegate"));
      *(float *)&v17 = v8;
      objc_msgSend(v16, "appearanceViewController:brightnessLevelDidChange:", self, v17);

    }
  }

}

- (void)updateBrightness
{
  void *v3;
  double v4;
  float v5;
  double v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "brightness");
  v5 = v4;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController brightnessSlider](self, "brightnessSlider"));
  *(float *)&v6 = v5;
  objc_msgSend(v7, "setValue:", v6);

}

- (void)setScrollSwitchEnabled:(BOOL)a3
{
  UISwitch *scrollSwitch;

  self->_scrollSwitchEnabled = a3;
  scrollSwitch = self->_scrollSwitch;
  if (scrollSwitch)
    -[UISwitch setEnabled:](scrollSwitch, "setEnabled:");
}

- (id)tableViewHeaderView
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController tableView](self, "tableView"));
  v3 = objc_alloc((Class)UIView);
  objc_msgSend(v2, "bounds");
  v4 = objc_msgSend(v3, "initWithFrame:", 0.0, 0.0);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "scale");
  v7 = 1.0 / v6;

  v8 = objc_alloc((Class)UIView);
  objc_msgSend(v2, "bounds");
  v9 = objc_msgSend(v8, "initWithFrame:", 0.0, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "separatorColor"));
  objc_msgSend(v9, "setBackgroundColor:", v10);

  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "addSubview:", v9);
  v11 = objc_alloc((Class)UIView);
  objc_msgSend(v2, "bounds");
  v12 = objc_msgSend(v11, "initWithFrame:", 0.0, 5.0 - v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "separatorColor"));
  objc_msgSend(v12, "setBackgroundColor:", v13);

  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "addSubview:", v12);

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

- (double)scrollingRowHeight
{
  double v2;
  double v3;

  -[BEAppearanceViewController appearanceRowHeight](self, "appearanceRowHeight");
  v3 = v2;
  if (+[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled"))
  {
    if ((+[UIFont bc_contentSizeCategoryIsGreaterThan:](UIFont, "bc_contentSizeCategoryIsGreaterThan:", UIContentSizeCategoryAccessibilityExtraLarge) & 1) != 0)
    {
      return 175.0;
    }
    else if (+[UIFont bc_contentSizeCategoryIsGreaterThan:](UIFont, "bc_contentSizeCategoryIsGreaterThan:", UIContentSizeCategoryAccessibilityLarge))
    {
      return 145.0;
    }
    else
    {
      return 95.0;
    }
  }
  return v3;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void)setBrightnessSlider:(id)a3
{
  objc_storeStrong((id *)&self->_brightnessSlider, a3);
}

- (void)setFontSizeButtons:(id)a3
{
  objc_storeStrong((id *)&self->_fontSizeButtons, a3);
}

- (void)setSizeSmallerButton:(id)a3
{
  objc_storeStrong((id *)&self->_sizeSmallerButton, a3);
}

- (void)setSizeLargerButton:(id)a3
{
  objc_storeStrong((id *)&self->_sizeLargerButton, a3);
}

- (UIView)sizeSeparatorLine
{
  return self->_sizeSeparatorLine;
}

- (void)setSizeSeparatorLine:(id)a3
{
  objc_storeStrong((id *)&self->_sizeSeparatorLine, a3);
}

- (void)setScrollSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_scrollSwitch, a3);
}

- (BOOL)scrollSwitchEnabled
{
  return self->_scrollSwitchEnabled;
}

- (BEAppearanceViewControllerDelegate)delegate
{
  return (BEAppearanceViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)arrowBackgroundView
{
  return self->_arrowBackgroundView;
}

- (void)setArrowBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_arrowBackgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrowBackgroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scrollSwitch, 0);
  objc_storeStrong((id *)&self->_sizeSeparatorLine, 0);
  objc_storeStrong((id *)&self->_sizeLargerButton, 0);
  objc_storeStrong((id *)&self->_sizeSmallerButton, 0);
  objc_storeStrong((id *)&self->_fontSizeButtons, 0);
  objc_storeStrong((id *)&self->_brightnessSlider, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
