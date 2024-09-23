@implementation LookAroundFloatingButtonsViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (LookAroundFloatingButtonsViewController)initWithShowsMinimizeButton:(BOOL)a3 groupButtonsIfNeeded:(BOOL)a4
{
  LookAroundFloatingButtonsViewController *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LookAroundFloatingButtonsViewController;
  result = -[LookAroundFloatingButtonsViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", 0, 0);
  if (result)
  {
    result->_alternateButtonEnabled = 1;
    result->_showsMinimizedButton = a3;
    result->_groupButtonsIfNeeded = a4;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[UIButton removeObserver:forKeyPath:](self->_alternateButton, "removeObserver:forKeyPath:", self, CFSTR("highlighted"));
  -[UIButton removeObserver:forKeyPath:](self->_doneButton, "removeObserver:forKeyPath:", self, CFSTR("highlighted"));
  v3.receiver = self;
  v3.super_class = (Class)LookAroundFloatingButtonsViewController;
  -[LookAroundFloatingButtonsViewController dealloc](&v3, "dealloc");
}

- (void)loadView
{
  _LookAroundFloatingButtonsView *v3;
  id v4;

  v3 = -[_LookAroundFloatingButtonsView initWithFrame:]([_LookAroundFloatingButtonsView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[LookAroundFloatingButtonsViewController setView:](self, "setView:", v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self, "view"));
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("LookAroundFloatingButtonsView"));

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LookAroundFloatingButtonsViewController;
  -[LookAroundFloatingButtonsViewController viewDidLoad](&v3, "viewDidLoad");
  -[LookAroundFloatingButtonsViewController _setupViews](self, "_setupViews");
  -[LookAroundFloatingButtonsViewController _setupConstraints](self, "_setupConstraints");
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LookAroundFloatingButtonsViewController;
  v6 = a4;
  v7 = a3;
  -[LookAroundFloatingButtonsViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v8, "willTransitionToTraitCollection:withTransitionCoordinator:", v7, v6);
  -[LookAroundFloatingButtonsViewController _updateButtonLayoutToTraitCollection:withTransitionCoordinator:](self, "_updateButtonLayoutToTraitCollection:withTransitionCoordinator:", v7, v6, v8.receiver, v8.super_class);

}

- (void)setShowsMinimizedButton:(BOOL)a3
{
  _BOOL8 v3;
  const __CFString *v5;
  UIButton *alternateButton;
  void *v7;
  _QWORD v8[5];
  BOOL v9;

  if (self->_showsMinimizedButton != a3)
  {
    v3 = a3;
    self->_showsMinimizedButton = a3;
    if (a3)
      v5 = CFSTR("arrow.down.right.and.arrow.up.left");
    else
      v5 = CFSTR("arrow.up.left.and.arrow.down.right");
    alternateButton = self->_alternateButton;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v5));
    -[UIButton setImage:forState:](alternateButton, "setImage:forState:", v7, 0);

    if (sub_1002A8AA0(self) == 5)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10074B53C;
      v8[3] = &unk_1011ACE58;
      v8[4] = self;
      v9 = v3;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v8, 0.2);
      -[UIButton setUserInteractionEnabled:](self->_menuButton, "setUserInteractionEnabled:", v3);
      -[NSLayoutConstraint setActive:](self->_menuButtonHiddenConstraint, "setActive:", v3 ^ 1);
      -[NSLayoutConstraint setActive:](self->_menuButtonVisibleConstraint, "setActive:", v3);
    }
    -[LookAroundFloatingButtonsViewController _setCornerRadii](self, "_setCornerRadii");
  }
}

- (void)_setAlternateButtonEnabled:(BOOL)a3
{
  -[LookAroundFloatingButtonsViewController _setAlternateButtonEnabled:animated:](self, "_setAlternateButtonEnabled:animated:", a3, 0);
}

- (void)_setAlternateButtonEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  double v7;
  _QWORD *v8;
  void *v9;
  _QWORD v10[6];

  v4 = a4;
  v5 = a3;
  -[LookAroundFloatingButtonsViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  if (self->_alternateButtonEnabled != v5)
  {
    self->_alternateButtonEnabled = v5;
    v7 = 0.300000012;
    if (v5)
      v7 = 1.0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10074B63C;
    v10[3] = &unk_1011AD518;
    v10[4] = self;
    *(double *)&v10[5] = v7;
    v8 = objc_retainBlock(v10);
    v9 = v8;
    if (v4)
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v8, 0.25);
    else
      ((void (*)(_QWORD *))v8[2])(v8);

  }
}

- (BOOL)isMaximizedButtonEnabled
{
  return self->_alternateButtonEnabled;
}

- (void)setMaximizedButtonEnabled:(BOOL)a3
{
  -[LookAroundFloatingButtonsViewController _setAlternateButtonEnabled:animated:](self, "_setAlternateButtonEnabled:animated:", a3, 0);
}

- (void)setMaximizedButtonEnabled:(BOOL)a3 animated:(BOOL)a4
{
  -[LookAroundFloatingButtonsViewController _setAlternateButtonEnabled:animated:](self, "_setAlternateButtonEnabled:animated:", a3, a4);
}

- (BOOL)isMinimizedButtonEnabled
{
  return self->_alternateButtonEnabled;
}

- (void)setMinimizedButtonEnabled:(BOOL)a3
{
  -[LookAroundFloatingButtonsViewController _setAlternateButtonEnabled:animated:](self, "_setAlternateButtonEnabled:animated:", a3, 0);
}

- (void)setMinimizedButtonEnabled:(BOOL)a3 animated:(BOOL)a4
{
  -[LookAroundFloatingButtonsViewController _setAlternateButtonEnabled:animated:](self, "_setAlternateButtonEnabled:animated:", a3, a4);
}

- (void)setHidingLabels:(BOOL)a3
{
  id v4;

  self->_hidingLabels = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController optionsMenu](self, "optionsMenu"));
  -[UIButton setMenu:](self->_menuButton, "setMenu:", v4);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  UIButton *v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = (UIButton *)a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("highlighted"))
    && (self->_alternateButton == v11 || self->_doneButton == v11 || self->_menuButton == v11))
  {
    -[LookAroundFloatingButtonsViewController updateTheme](self, "updateTheme");
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)LookAroundFloatingButtonsViewController;
    -[LookAroundFloatingButtonsViewController observeValueForKeyPath:ofObject:change:context:](&v13, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)updateTheme
{
  UIColor *highlightedButtonBackgroundViewColor;
  void *v4;
  UIColor *v5;
  id v6;

  if (sub_1002A8AA0(self) != 5)
  {
    if (-[UIButton isHighlighted](self->_alternateButton, "isHighlighted"))
      highlightedButtonBackgroundViewColor = self->_highlightedButtonBackgroundViewColor;
    else
      highlightedButtonBackgroundViewColor = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_alternateButtonBackgroundView, "contentView"));
    objc_msgSend(v4, "setBackgroundColor:", highlightedButtonBackgroundViewColor);

    if (-[UIButton isHighlighted](self->_doneButton, "isHighlighted"))
      v5 = self->_highlightedButtonBackgroundViewColor;
    else
      v5 = 0;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_doneButtonBackgroundView, "contentView"));
    objc_msgSend(v6, "setBackgroundColor:", v5);

  }
}

- (void)_setupViews
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  UIVisualEffectView *v7;
  UIVisualEffectView *alternateButtonBackgroundView;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  UIButton *v13;
  UIButton *alternateButton;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  __CFString *v20;
  UIButton *v21;
  __CFString *v22;
  double v23;
  UIButton *v24;
  void *v25;
  UIButton *v26;
  void *v27;
  void *v28;
  HairlineView *v29;
  HairlineView *separator;
  void *v31;
  id v32;
  void *v33;
  UIVisualEffectView *v34;
  UIVisualEffectView *doneButtonBackgroundView;
  objc_class *v36;
  NSString *v37;
  void *v38;
  void *v39;
  UIButton *v40;
  UIButton *doneButton;
  void *v42;
  UIButton *v43;
  UIImage *v44;
  void *v45;
  UIButton *v46;
  void *v47;
  UIButton *v48;
  void *v49;
  UIButton *v50;
  void *v51;
  void *v52;
  UIButton *v53;
  UIButton *menuButton;
  void *v55;
  UIButton *v56;
  void *v57;
  UIButton *v58;
  void *v59;
  void *v60;
  double v61;
  void *v62;
  UIColor *v63;
  UIColor *highlightedButtonBackgroundViewColor;

  v3 = sub_1002A8AA0(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self, "view"));
  objc_msgSend(v4, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);

  v5 = objc_alloc((Class)UIVisualEffectView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 7));
  v7 = (UIVisualEffectView *)objc_msgSend(v5, "initWithEffect:", v6);
  alternateButtonBackgroundView = self->_alternateButtonBackgroundView;
  self->_alternateButtonBackgroundView = v7;

  v9 = (objc_class *)objc_opt_class(self);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[UIVisualEffectView _setGroupName:](self->_alternateButtonBackgroundView, "_setGroupName:", v11);

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_alternateButtonBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self, "view"));
  objc_msgSend(v12, "addSubview:", self->_alternateButtonBackgroundView);

  v13 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  alternateButton = self->_alternateButton;
  self->_alternateButton = v13;

  if (v3 == 5)
    v15 = 10.0;
  else
    v15 = 8.0;
  if (v3 == 5)
    v16 = 7.0;
  else
    v16 = 8.0;
  if (v3 == 5)
    v17 = 0.0;
  else
    v17 = 8.0;
  if (v3 == 5)
    v18 = 16.0;
  else
    v18 = 20.0;
  -[UIButton setAdjustsImageWhenHighlighted:](self->_alternateButton, "setAdjustsImageWhenHighlighted:", v3 == 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UIButton setTintColor:](self->_alternateButton, "setTintColor:", v19);

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_alternateButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setContentEdgeInsets:](self->_alternateButton, "setContentEdgeInsets:", v17, v16, v17, v15);
  -[UIButton addTarget:action:forControlEvents:](self->_alternateButton, "addTarget:action:forControlEvents:", self, "didTapButton:", 64);
  if (self->_showsMinimizedButton)
    v20 = CFSTR("arrow.down.right.and.arrow.up.left");
  else
    v20 = CFSTR("arrow.up.left.and.arrow.down.right");
  v21 = self->_alternateButton;
  v22 = v20;
  LODWORD(v23) = 1148846080;
  -[UIButton setContentCompressionResistancePriority:forAxis:](v21, "setContentCompressionResistancePriority:forAxis:", 1, v23);
  v24 = self->_alternateButton;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v22));

  -[UIButton setImage:forState:](v24, "setImage:forState:", v25, 0);
  v26 = self->_alternateButton;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", v18));
  -[UIButton setPreferredSymbolConfiguration:forImageInState:](v26, "setPreferredSymbolConfiguration:forImageInState:", v27, 0);

  -[UIButton addObserver:forKeyPath:options:context:](self->_alternateButton, "addObserver:forKeyPath:options:context:", self, CFSTR("highlighted"), 1, 0);
  -[UIButton setAccessibilityIdentifier:](self->_alternateButton, "setAccessibilityIdentifier:", CFSTR("LookAroundFloatingButtonsAlternateButton"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self, "view"));
  objc_msgSend(v28, "addSubview:", self->_alternateButton);

  v29 = objc_opt_new(HairlineView);
  separator = self->_separator;
  self->_separator = v29;

  -[HairlineView setTranslatesAutoresizingMaskIntoConstraints:](self->_separator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HairlineView setVertical:](self->_separator, "setVertical:", 1);
  -[HairlineView setHidden:](self->_separator, "setHidden:", v3 == 5);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_alternateButtonBackgroundView, "contentView"));
  objc_msgSend(v31, "addSubview:", self->_separator);

  v32 = objc_alloc((Class)UIVisualEffectView);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 7));
  v34 = (UIVisualEffectView *)objc_msgSend(v32, "initWithEffect:", v33);
  doneButtonBackgroundView = self->_doneButtonBackgroundView;
  self->_doneButtonBackgroundView = v34;

  v36 = (objc_class *)objc_opt_class(self);
  v37 = NSStringFromClass(v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  -[UIVisualEffectView _setGroupName:](self->_doneButtonBackgroundView, "_setGroupName:", v38);

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_doneButtonBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self, "view"));
  objc_msgSend(v39, "addSubview:", self->_doneButtonBackgroundView);

  v40 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  doneButton = self->_doneButton;
  self->_doneButton = v40;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_doneButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton addTarget:action:forControlEvents:](self->_doneButton, "addTarget:action:forControlEvents:", self, "didTapDoneButton:", 64);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_doneButton, "titleLabel"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v42, &stru_1011C56A8);

  v43 = self->_doneButton;
  v44 = objc_opt_new(UIImage);
  -[UIButton setBackgroundImage:forState:](v43, "setBackgroundImage:forState:", v44, 0);

  if (v3 == 5)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UIButton setTintColor:](self->_doneButton, "setTintColor:", v45);

    -[UIButton setAdjustsImageWhenHighlighted:](self->_doneButton, "setAdjustsImageWhenHighlighted:", 1);
    -[UIButton setContentEdgeInsets:](self->_doneButton, "setContentEdgeInsets:", 0.0, 11.0, 0.0, 7.0);
    v46 = self->_doneButton;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("xmark.circle.fill")));
    -[UIButton setImage:forState:](v46, "setImage:forState:", v47, 0);

    v48 = self->_doneButton;
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 14.0));
    -[UIButton setPreferredSymbolConfiguration:forImageInState:](v48, "setPreferredSymbolConfiguration:forImageInState:", v49, 0);
  }
  else
  {
    -[UIButton setContentEdgeInsets:](self->_doneButton, "setContentEdgeInsets:", 0.0, 12.0, 0.0, 12.0);
    v50 = self->_doneButton;
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("Done [Exit LookAround Button]"), CFSTR("localized string not found"), 0));
    -[UIButton setTitle:forState:](v50, "setTitle:forState:", v51, 0);

  }
  -[UIButton addObserver:forKeyPath:options:context:](self->_doneButton, "addObserver:forKeyPath:options:context:", self, CFSTR("highlighted"), 1, 0);
  -[UIButton setAccessibilityIdentifier:](self->_doneButton, "setAccessibilityIdentifier:", CFSTR("LookAroundFloatingButtonsDoneButton"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self, "view"));
  objc_msgSend(v52, "addSubview:", self->_doneButton);

  if (v3 == 5)
  {
    v53 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    menuButton = self->_menuButton;
    self->_menuButton = v53;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_menuButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UIButton setTintColor:](self->_menuButton, "setTintColor:", v55);

    -[UIButton setAdjustsImageWhenHighlighted:](self->_menuButton, "setAdjustsImageWhenHighlighted:", 1);
    -[UIButton setContentEdgeInsets:](self->_menuButton, "setContentEdgeInsets:", 0.0, 4.0, 0.0, 10.0);
    v56 = self->_menuButton;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("ellipsis")));
    -[UIButton setImage:forState:](v56, "setImage:forState:", v57, 0);

    v58 = self->_menuButton;
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 15.0));
    -[UIButton setPreferredSymbolConfiguration:forImageInState:](v58, "setPreferredSymbolConfiguration:forImageInState:", v59, 0);

    -[UIButton addObserver:forKeyPath:options:context:](self->_menuButton, "addObserver:forKeyPath:options:context:", self, CFSTR("highlighted"), 1, 0);
    -[UIButton setContextMenuInteractionEnabled:](self->_menuButton, "setContextMenuInteractionEnabled:", 1);
    -[UIButton setShowsMenuAsPrimaryAction:](self->_menuButton, "setShowsMenuAsPrimaryAction:", 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController optionsMenu](self, "optionsMenu"));
    -[UIButton setMenu:](self->_menuButton, "setMenu:", v60);

    -[UIButton setUserInteractionEnabled:](self->_menuButton, "setUserInteractionEnabled:", self->_showsMinimizedButton);
    v61 = 1.0;
    if (!self->_showsMinimizedButton)
      v61 = 0.0;
    -[UIButton setAlpha:](self->_menuButton, "setAlpha:", v61);
    -[UIButton setAccessibilityIdentifier:](self->_menuButton, "setAccessibilityIdentifier:", CFSTR("LookAroundFloatingButtonsMenuButton"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self, "view"));
    objc_msgSend(v62, "addSubview:", self->_menuButton);

  }
  v63 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.150000006));
  highlightedButtonBackgroundViewColor = self->_highlightedButtonBackgroundViewColor;
  self->_highlightedButtonBackgroundViewColor = v63;

  -[LookAroundFloatingButtonsViewController updateTheme](self, "updateTheme");
  -[LookAroundFloatingButtonsViewController _setCornerRadii](self, "_setCornerRadii");
}

- (id)optionsMenu
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
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;
  _QWORD v25[4];
  void *v26;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Hide Labels [LookAround Options]"), CFSTR("localized string not found"), 0));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10074C404;
  v22[3] = &unk_1011AF8A0;
  objc_copyWeak(&v23, &location);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v4, 0, 0, v22));

  objc_msgSend(v5, "setState:", -[LookAroundFloatingButtonsViewController hidingLabels](self, "hidingLabels"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Imagery Info [LookAround Options]"), CFSTR("localized string not found"), 0));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10074C468;
  v20[3] = &unk_1011AF8A0;
  objc_copyWeak(&v21, &location);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v7, 0, 0, v20));

  v26 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Report an Issue"), CFSTR("localized string not found"), 0));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10074C4CC;
  v18[3] = &unk_1011AF8A0;
  objc_copyWeak(&v19, &location);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v12, 0, 0, v18));

  v25[0] = v5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MapsMenuBuilder sendToDeviceAndShareMenuWithSendToDeviceEnabled:](MapsMenuBuilder, "sendToDeviceAndShareMenuWithSendToDeviceEnabled:", 0));
  v25[1] = v14;
  v25[2] = v10;
  v25[3] = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 0, v15));

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  return v16;
}

- (void)_setupConstraints
{
  uint64_t v3;
  UIVisualEffectView *alternateButtonBackgroundView;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *menuButtonVisibleConstraint;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *menuButtonHiddenConstraint;
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
  NSLayoutConstraint *v23;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSLayoutConstraint *v46;
  NSLayoutConstraint *alternateButtonLeadingConstraintGrouped;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  NSLayoutConstraint *v52;
  NSLayoutConstraint *alternateButtonLeadingConstraintSeparated;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSLayoutConstraint *v66;
  NSLayoutConstraint *doneButtonLeadingContraintGrouped;
  void *v68;
  void *v69;
  NSLayoutConstraint *v70;
  NSLayoutConstraint *doneButtonLeadingContraintSeparated;
  double v72;
  void *v73;
  void *v74;
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
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  id v134;
  _QWORD v135[4];
  _QWORD v136[10];
  _QWORD v137[2];
  _QWORD v138[14];

  v134 = objc_alloc_init((Class)NSMutableArray);
  v3 = sub_1002A8AA0(self);
  alternateButtonBackgroundView = self->_alternateButtonBackgroundView;
  if (v3 == 5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](alternateButtonBackgroundView, "trailingAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_menuButton, "trailingAnchor"));
    v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
    menuButtonVisibleConstraint = self->_menuButtonVisibleConstraint;
    self->_menuButtonVisibleConstraint = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](self->_alternateButtonBackgroundView, "trailingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_alternateButton, "trailingAnchor"));
    v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
    menuButtonHiddenConstraint = self->_menuButtonHiddenConstraint;
    self->_menuButtonHiddenConstraint = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](self->_alternateButtonBackgroundView, "leadingAnchor"));
    v121 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self, "view"));
    v112 = objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "leadingAnchor"));
    v133 = v13;
    v114 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v112));
    v138[0] = v114;
    v110 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](self->_alternateButtonBackgroundView, "topAnchor"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self, "view"));
    v99 = objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "topAnchor"));
    v108 = objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintEqualToAnchor:", v99));
    v138[1] = v108;
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](self->_alternateButtonBackgroundView, "bottomAnchor"));
    v131 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self, "view"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "bottomAnchor"));
    v87 = objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "constraintEqualToAnchor:"));
    v138[2] = v87;
    v127 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView heightAnchor](self->_alternateButtonBackgroundView, "heightAnchor"));
    v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "constraintEqualToConstant:", 30.0));
    v138[3] = v125;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_doneButton, "leadingAnchor"));
    v119 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](self->_alternateButtonBackgroundView, "leadingAnchor"));
    v123 = v14;
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v119));
    v138[4] = v117;
    v104 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](self->_doneButton, "centerYAnchor"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self, "view"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "centerYAnchor"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToAnchor:", v100));
    v138[5] = v97;
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_doneButton, "heightAnchor"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView heightAnchor](self->_alternateButtonBackgroundView, "heightAnchor"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:", v91));
    v138[6] = v89;
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_alternateButton, "leadingAnchor"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_doneButton, "trailingAnchor"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:", v83));
    v138[7] = v82;
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](self->_alternateButton, "centerYAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self, "view"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "centerYAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToAnchor:", v79));
    v138[8] = v78;
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_alternateButton, "heightAnchor"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView heightAnchor](self->_alternateButtonBackgroundView, "heightAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:", v76));
    v138[9] = v75;
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_menuButton, "leadingAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_alternateButton, "trailingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v73));
    v138[10] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](self->_menuButton, "centerYAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self, "view"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerYAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
    v138[11] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_menuButton, "heightAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView heightAnchor](self->_alternateButtonBackgroundView, "heightAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
    v23 = self->_menuButtonHiddenConstraint;
    v138[12] = v22;
    v138[13] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v138, 14));
    objc_msgSend(v134, "addObjectsFromArray:", v24);

    v25 = (void *)v87;
    v26 = (void *)v99;

    v27 = (void *)v112;
    v28 = v102;

    v29 = (void *)v114;
    v30 = v121;

    v31 = v95;
    v32 = (void *)v108;

    v33 = v110;
  }
  else
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](alternateButtonBackgroundView, "topAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self, "view"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "topAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v36));
    v137[0] = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](self->_alternateButtonBackgroundView, "bottomAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self, "view"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "bottomAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v40));
    v137[1] = v41;
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v137, 2));
    objc_msgSend(v134, "addObjectsFromArray:", v42);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](self->_alternateButtonBackgroundView, "leadingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self, "view"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
    v46 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintGreaterThanOrEqualToAnchor:", v45));
    alternateButtonLeadingConstraintGrouped = self->_alternateButtonLeadingConstraintGrouped;
    self->_alternateButtonLeadingConstraintGrouped = v46;

    LODWORD(v48) = 1144750080;
    -[NSLayoutConstraint setPriority:](self->_alternateButtonLeadingConstraintGrouped, "setPriority:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](self->_alternateButtonBackgroundView, "leadingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self, "view"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "leadingAnchor"));
    v52 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v51));
    alternateButtonLeadingConstraintSeparated = self->_alternateButtonLeadingConstraintSeparated;
    self->_alternateButtonLeadingConstraintSeparated = v52;

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_alternateButtonBackgroundView, "contentView"));
    v132 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_alternateButton, "topAnchor"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "topAnchor"));
    v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "constraintEqualToAnchor:", v130));
    v136[0] = v128;
    v126 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_alternateButton, "bottomAnchor"));
    v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "bottomAnchor"));
    v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "constraintEqualToAnchor:", v124));
    v136[1] = v122;
    v120 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_alternateButton, "leadingAnchor"));
    v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "leadingAnchor"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "constraintEqualToAnchor:", v118));
    v136[2] = v116;
    v115 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_alternateButton, "trailingAnchor"));
    v113 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView leadingAnchor](self->_separator, "leadingAnchor"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "constraintEqualToAnchor:", v113));
    v136[3] = v111;
    v109 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView topAnchor](self->_separator, "topAnchor"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "topAnchor"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToAnchor:", v107));
    v136[4] = v105;
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView bottomAnchor](self->_separator, "bottomAnchor"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "bottomAnchor"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "constraintEqualToAnchor:", v101));
    v136[5] = v98;
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView trailingAnchor](self->_separator, "trailingAnchor"));
    v133 = v54;
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "trailingAnchor"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToAnchor:", v94));
    v136[6] = v92;
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](self->_doneButtonBackgroundView, "topAnchor"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self, "view"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "topAnchor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToAnchor:", v86));
    v136[7] = v84;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](self->_doneButtonBackgroundView, "bottomAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self, "view"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "bottomAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v57));
    v136[8] = v58;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](self->_doneButtonBackgroundView, "trailingAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController view](self, "view"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "trailingAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v61));
    v136[9] = v62;
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v136, 10));
    objc_msgSend(v134, "addObjectsFromArray:", v63);

    v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](self->_doneButtonBackgroundView, "leadingAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](self->_alternateButtonBackgroundView, "trailingAnchor"));
    v66 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v65));
    doneButtonLeadingContraintGrouped = self->_doneButtonLeadingContraintGrouped;
    self->_doneButtonLeadingContraintGrouped = v66;

    v68 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](self->_doneButtonBackgroundView, "leadingAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](self->_alternateButtonBackgroundView, "trailingAnchor"));
    v70 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintGreaterThanOrEqualToAnchor:", v69));
    doneButtonLeadingContraintSeparated = self->_doneButtonLeadingContraintSeparated;
    self->_doneButtonLeadingContraintSeparated = v70;

    LODWORD(v72) = 1144750080;
    -[NSLayoutConstraint setPriority:](self->_doneButtonLeadingContraintSeparated, "setPriority:", v72);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_doneButtonBackgroundView, "contentView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_doneButton, "topAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v29));
    v135[0] = v33;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_doneButton, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v26));
    v135[1] = v32;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_doneButton, "leadingAnchor"));
    v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leadingAnchor"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:"));
    v135[2] = v129;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_doneButton, "trailingAnchor"));
    v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingAnchor"));
    v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:"));
    v135[3] = v125;
    v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v135, 4));
    objc_msgSend(v134, "addObjectsFromArray:");
  }

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v134);
  -[LookAroundFloatingButtonsViewController _updateButtonLayoutAnimated:](self, "_updateButtonLayoutAnimated:", 0);

}

- (void)_updateButtonLayoutAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController traitCollection](self, "traitCollection"));
  -[LookAroundFloatingButtonsViewController _updateButtonLayoutToTraitCollection:withTransitionCoordinator:animated:](self, "_updateButtonLayoutToTraitCollection:withTransitionCoordinator:animated:", v5, 0, v3);

}

- (void)_updateButtonLayoutToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  -[LookAroundFloatingButtonsViewController _updateButtonLayoutToTraitCollection:withTransitionCoordinator:animated:](self, "_updateButtonLayoutToTraitCollection:withTransitionCoordinator:animated:", a3, a4, 0);
}

- (void)_setCornerRadii
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController traitCollection](self, "traitCollection"));
  -[LookAroundFloatingButtonsViewController _setCornerRadiiWithTraitCollection:](self, "_setCornerRadiiWithTraitCollection:", v3);

}

- (void)_setCornerRadiiWithTraitCollection:(id)a3
{
  UIVisualEffectView *alternateButtonBackgroundView;
  double v5;
  uint64_t v6;
  id v7;
  void *v8;
  int v9;
  char v10;
  char v11;
  char v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  if (sub_1002A8AA0(self) == 5)
  {
    alternateButtonBackgroundView = self->_alternateButtonBackgroundView;
    v5 = 9.0;
    v6 = 15;
    goto LABEL_36;
  }
  v7 = v20;
  v8 = v7;
  if (!v7)
    goto LABEL_16;
  if (objc_msgSend(v7, "userInterfaceIdiom") != (id)5)
  {
    if (objc_msgSend(v8, "horizontalSizeClass") == (id)1 && objc_msgSend(v8, "verticalSizeClass") == (id)2)
    {
      v9 = 1;
      v10 = 1;
      goto LABEL_17;
    }
    if (objc_msgSend(v8, "horizontalSizeClass") == (id)1 && objc_msgSend(v8, "verticalSizeClass") == (id)1
      || objc_msgSend(v8, "horizontalSizeClass") == (id)2 && objc_msgSend(v8, "verticalSizeClass") == (id)1
      || objc_msgSend(v8, "horizontalSizeClass") == (id)2 && objc_msgSend(v8, "verticalSizeClass") == (id)2)
    {
      v9 = 1;
      v10 = 4;
      goto LABEL_17;
    }
LABEL_16:
    v10 = 0;
    v9 = 1;
    goto LABEL_17;
  }
  v9 = 0;
  v10 = 6;
LABEL_17:

  if (self->_groupButtonsIfNeeded)
    v11 = 0;
  else
    v11 = -1;
  if (!self->_groupButtonsIfNeeded || v9 == 0)
    v13 = v11;
  else
    v13 = (0x23u >> v10) & 1;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v15 = objc_msgSend(v14, "userInterfaceLayoutDirection");

  v16 = 10;
  v17 = 15;
  if ((v13 & 1) != 0)
    v16 = 15;
  else
    v17 = 5;
  if (v15 == (id)1)
    v18 = v16;
  else
    v18 = v17;
  if (v15 == (id)1)
    v19 = v17;
  else
    v19 = v16;
  -[UIVisualEffectView _setCornerRadius:continuous:maskedCorners:](self->_alternateButtonBackgroundView, "_setCornerRadius:continuous:maskedCorners:", 1, v18, 6.0);
  alternateButtonBackgroundView = self->_doneButtonBackgroundView;
  v5 = 6.0;
  v6 = v19;
LABEL_36:
  -[UIVisualEffectView _setCornerRadius:continuous:maskedCorners:](alternateButtonBackgroundView, "_setCornerRadius:continuous:maskedCorners:", 1, v6, v5);

}

- (void)_updateButtonLayoutToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  char v13;
  unsigned int v14;
  char v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[4];
  _QWORD *v20;
  _QWORD v21[4];
  _QWORD *v22;
  _QWORD v23[5];
  char v24;
  _QWORD v25[5];
  id v26;
  char v27;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (sub_1002A8AA0(self) == 5)
    goto LABEL_30;
  v10 = v8;
  v11 = v10;
  if (!v10)
    goto LABEL_15;
  if (objc_msgSend(v10, "userInterfaceIdiom") != (id)5)
  {
    if (objc_msgSend(v11, "horizontalSizeClass") == (id)1 && objc_msgSend(v11, "verticalSizeClass") == (id)2)
    {
      v12 = 1;
      v13 = 1;
      goto LABEL_16;
    }
    if (objc_msgSend(v11, "horizontalSizeClass") == (id)1 && objc_msgSend(v11, "verticalSizeClass") == (id)1
      || objc_msgSend(v11, "horizontalSizeClass") == (id)2 && objc_msgSend(v11, "verticalSizeClass") == (id)1
      || objc_msgSend(v11, "horizontalSizeClass") == (id)2 && objc_msgSend(v11, "verticalSizeClass") == (id)2)
    {
      v12 = 1;
      v13 = 4;
      goto LABEL_16;
    }
LABEL_15:
    v13 = 0;
    v12 = 1;
    goto LABEL_16;
  }
  v12 = 0;
  v13 = 6;
LABEL_16:

  if (self->_groupButtonsIfNeeded)
    LOBYTE(v14) = -1;
  else
    LOBYTE(v14) = 0;
  if (self->_groupButtonsIfNeeded && v12 != 0)
    v14 = (0x1Cu >> v13) & 1;
  v16 = v14 & 1;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10074D774;
  v25[3] = &unk_1011AC838;
  v25[4] = self;
  v27 = v14 & 1;
  v26 = v11;
  v17 = objc_retainBlock(v25);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10074D8B8;
  v23[3] = &unk_1011AF4D8;
  v23[4] = self;
  v24 = v16;
  v18 = objc_retainBlock(v23);
  if (v9)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10074D8D8;
    v21[3] = &unk_1011C56F8;
    v22 = v17;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10074D8E4;
    v19[3] = &unk_1011C56F8;
    v20 = v18;
    objc_msgSend(v9, "animateAlongsideTransition:completion:", v21, v19);

  }
  else if (v5)
  {
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v17, v18, 0.25);
  }
  else
  {
    ((void (*)(_QWORD *))v17[2])(v17);
    ((void (*)(_QWORD *, uint64_t))v18[2])(v18, 1);
  }

LABEL_30:
}

- (void)didTapButton:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!self->_showsMinimizedButton)
    goto LABEL_11;
  if (-[LookAroundFloatingButtonsViewController isMinimizedButtonEnabled](self, "isMinimizedButtonEnabled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController delegate](self, "delegate"));
    objc_msgSend(v4, "lookAroundFloatingButtonsViewController:didTapMinimizeButton:", self, v5);
LABEL_7:

    goto LABEL_8;
  }
  if (!self->_showsMinimizedButton)
  {
LABEL_11:
    if (-[LookAroundFloatingButtonsViewController isMaximizedButtonEnabled](self, "isMaximizedButtonEnabled"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController delegate](self, "delegate"));
      objc_msgSend(v4, "lookAroundFloatingButtonsViewController:didTapMaximizeButton:", self, v5);
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)didTapDoneButton:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundFloatingButtonsViewController delegate](self, "delegate"));
  objc_msgSend(v5, "lookAroundFloatingButtonsViewController:didTapDoneButton:", self, v4);

}

- (LookAroundFloatingButtonsViewControllerDelegate)delegate
{
  return (LookAroundFloatingButtonsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showsMinimizedButton
{
  return self->_showsMinimizedButton;
}

- (BOOL)hidingLabels
{
  return self->_hidingLabels;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_menuButtonHiddenConstraint, 0);
  objc_storeStrong((id *)&self->_menuButtonVisibleConstraint, 0);
  objc_storeStrong((id *)&self->_menuButton, 0);
  objc_storeStrong((id *)&self->_highlightedButtonBackgroundViewColor, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_doneButtonLeadingContraintSeparated, 0);
  objc_storeStrong((id *)&self->_doneButtonLeadingContraintGrouped, 0);
  objc_storeStrong((id *)&self->_doneButtonBackgroundView, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_alternateButton, 0);
  objc_storeStrong((id *)&self->_alternateButtonLeadingConstraintSeparated, 0);
  objc_storeStrong((id *)&self->_alternateButtonLeadingConstraintGrouped, 0);
  objc_storeStrong((id *)&self->_alternateButtonBackgroundView, 0);
}

@end
