@implementation _UIButtonGroupViewController

- (_UIButtonGroupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s should not be called"), a4, "-[_UIButtonGroupViewController initWithNibName:bundle:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "raise");

  return 0;
}

- (_UIButtonGroupViewController)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s should not be called"), "-[_UIButtonGroupViewController initWithCoder:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "raise");

  return 0;
}

- (_UIButtonGroupViewController)initWithBarButtonItemGroups:(id)a3 overLightKeyboard:(BOOL)a4
{
  id v7;
  _UIButtonGroupViewController *v8;
  uint64_t v9;
  NSArray *barButtonItemGroups;
  _UIButtonBar *v11;
  _UIButtonBar *buttonBar;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v26;
  objc_class *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id location;
  objc_super v32;

  v7 = a3;
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIButtonGroupViewController.m"), 49, CFSTR("You can't create a %@ with no bar button item groups..."), v28);

  }
  v32.receiver = self;
  v32.super_class = (Class)_UIButtonGroupViewController;
  v8 = -[UIViewController initWithNibName:bundle:](&v32, sel_initWithNibName_bundle_, 0, 0);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    barButtonItemGroups = v8->_barButtonItemGroups;
    v8->_barButtonItemGroups = (NSArray *)v9;

    v11 = objc_alloc_init(_UIButtonBar);
    buttonBar = v8->_buttonBar;
    v8->_buttonBar = v11;

    objc_opt_class();
    _UIButtonBarButtonMakerForVisualProvider();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBar setViewUpdater:](v8->_buttonBar, "setViewUpdater:", v13);

    -[_UIButtonBar setItemsInGroupUseSameSize:](v8->_buttonBar, "setItemsInGroupUseSameSize:", 1);
    v8->_overLightKeyboard = a4;
    objc_initWeak(&location, v8);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __78___UIButtonGroupViewController_initWithBarButtonItemGroups_overLightKeyboard___block_invoke;
    v29[3] = &unk_1E16B5A98;
    objc_copyWeak(&v30, &location);
    -[_UIButtonBar setDefaultActionFilter:](v8->_buttonBar, "setDefaultActionFilter:", v29);
    -[UIViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 7);
    -[NSArray firstObject](v8->_barButtonItemGroups, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "representativeItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController popoverPresentationController](v8, "popoverPresentationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSourceItem:", v15);

    -[UIViewController popoverPresentationController](v8, "popoverPresentationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPermittedArrowDirections:", 3);

    -[UIViewController popoverPresentationController](v8, "popoverPresentationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_setIgnoreBarButtonItemSiblings:", 1);

    -[UIViewController popoverPresentationController](v8, "popoverPresentationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDelegate:", v8);

    LODWORD(v15) = v8->_overLightKeyboard;
    -[UIViewController popoverPresentationController](v8, "popoverPresentationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if ((_DWORD)v15)
      v22 = 6;
    else
      v22 = 7;
    objc_msgSend(v20, "_setPopoverBackgroundStyle:", v22);

    if (!v8->_overLightKeyboard)
    {
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.498039216, 0.501960784, 0.509803922, 0.8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController popoverPresentationController](v8, "popoverPresentationController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setBackgroundColor:", v23);

    }
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)dismissIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UIViewController popoverPresentationController](self, "popoverPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_realSourceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[UIViewController presentingViewController](self, "presentingViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 0, 0);

  }
}

- (void)loadView
{
  UIView *v3;
  UIScrollView *v4;
  UIScrollView *scrollView;
  void *v6;
  void *v7;
  void *v8;
  UIScrollView *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(UIView);
  -[UIViewController setView:](self, "setView:", v3);
  v4 = objc_alloc_init(UIScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v4;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", 0.0, 17.5, 0.0, 17.5);
  -[UIView addSubview:](v3, "addSubview:", self->_scrollView);
  -[_UIButtonGroupViewController tintColor](self, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setTintColor:](v3, "setTintColor:", v6);

  -[_UIButtonBar setBarButtonGroups:](self->_buttonBar, "setBarButtonGroups:", self->_barButtonItemGroups);
  -[_UIButtonBar setMinimumInterItemSpace:](self->_buttonBar, "setMinimumInterItemSpace:", 15.0);
  -[_UIButtonBar view](self->_buttonBar, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLayoutMargins:", 10.0, 0.0, 10.0, 0.0);

  -[_UIButtonBar view](self->_buttonBar, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](self->_scrollView, "addSubview:", v8);
  v23[0] = CFSTR("buttonBar");
  v23[1] = CFSTR("scrollView");
  v9 = self->_scrollView;
  v24[0] = v8;
  v24[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0D156E0];
  v12 = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[scrollView]|"), 0, MEMORY[0x1E0C9AA70], v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activateConstraints:", v13);

  v14 = (void *)MEMORY[0x1E0D156E0];
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[scrollView]|"), 0, v12, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activateConstraints:", v15);

  v16 = (void *)MEMORY[0x1E0D156E0];
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[buttonBar]|"), 0, v12, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateConstraints:", v17);

  v18 = (void *)MEMORY[0x1E0D156E0];
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[buttonBar(<=56)]|"), 0, v12, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v19);

  objc_msgSend(v8, "layoutIfNeeded");
  LODWORD(v20) = 1112014848;
  LODWORD(v21) = 1112014848;
  objc_msgSend(v8, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", 0.0, 0.0, v20, v21);
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:", v22 + 35.0);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIButtonGroupViewController;
  -[UIViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[_UIButtonBar _validateAllItems](self->_buttonBar, "_validateAllItems");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIColor)backgroundColor
{
  void *v2;
  void *v3;

  -[UIViewController popoverPresentationController](self, "popoverPresentationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIViewController popoverPresentationController](self, "popoverPresentationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)setTintColor:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_tintColor, a3);
  v5 = a3;
  -[UIViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v5);

}

- (UIColor)tintColor
{
  UIColor *tintColor;

  tintColor = self->_tintColor;
  if (tintColor)
    return tintColor;
  if (self->_overLightKeyboard)
    +[UIColor blackColor](UIColor, "blackColor");
  else
    +[UIColor whiteColor](UIColor, "whiteColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_barButtonItemGroups, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_buttonBar, 0);
  objc_destroyWeak((id *)&self->_originalOwner);
}

@end
