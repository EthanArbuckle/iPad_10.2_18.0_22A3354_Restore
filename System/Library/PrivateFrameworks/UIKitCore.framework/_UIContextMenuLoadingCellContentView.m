@implementation _UIContextMenuLoadingCellContentView

- (_UIContextMenuLoadingCellContentView)initWithFrame:(CGRect)a3
{
  _UIContextMenuLoadingCellContentView *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)_UIContextMenuLoadingCellContentView;
  v3 = -[_UIContextMenuCellContentView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    _UINSLocalizedStringWithDefaultValue(CFSTR("CONTEXT_MENU_LOADING"), CFSTR("Loading…"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuCellContentView setTitle:](v3, "setTitle:", v4);

    -[_UIContextMenuLoadingCellContentView _updateContentAppearance](v3, "_updateContentAppearance");
    v9[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UIView registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v5, sel__updateContentAppearance);

  }
  return v3;
}

- (id)iconView
{
  void *v3;
  UIActivityIndicatorView *v4;
  void *v5;
  void *v6;

  -[_UIContextMenuLoadingCellContentView activityIndicatorView](self, "activityIndicatorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]([UIActivityIndicatorView alloc], "initWithActivityIndicatorStyle:", 100);
    -[_UIContextMenuLoadingCellContentView setActivityIndicatorView:](self, "setActivityIndicatorView:", v4);

    -[_UIContextMenuLoadingCellContentView activityIndicatorView](self, "activityIndicatorView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[_UIContextMenuLoadingCellContentView activityIndicatorView](self, "activityIndicatorView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startAnimating");

  }
  return -[_UIContextMenuLoadingCellContentView activityIndicatorView](self, "activityIndicatorView");
}

- (void)_updateContentAppearance
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
  id v12;

  -[_UIContextMenuLoadingCellContentView _contentsTintColor](self, "_contentsTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuCellContentView titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v3);

  -[_UIContextMenuLoadingCellContentView _contentsCompositingFilter](self, "_contentsCompositingFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuCellContentView titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompositingFilter:", v5);

  -[_UIContextMenuLoadingCellContentView _contentsTintColor](self, "_contentsTintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuLoadingCellContentView activityIndicatorView](self, "activityIndicatorView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setColor:", v8);

  -[_UIContextMenuLoadingCellContentView _contentsCompositingFilter](self, "_contentsCompositingFilter");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuLoadingCellContentView activityIndicatorView](self, "activityIndicatorView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCompositingFilter:", v12);

}

- (id)_contentsTintColor
{
  void *v2;
  id location;

  objc_initWeak(&location, self);
  +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &__block_literal_global_548);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&location);
  return v2;
}

- (id)_contentsCompositingFilter
{
  void *v2;
  uint64_t v3;
  id *v4;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  v4 = (id *)MEMORY[0x1E0CD2E98];
  if (v3 == 2)
    v4 = (id *)MEMORY[0x1E0CD2EA0];
  return *v4;
}

- (BOOL)_ignoreRemoveAllAnimations
{
  return 1;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
}

@end
