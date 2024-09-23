@implementation SBUISpotlightBarNavigationController

- (SBUISpotlightBarNavigationController)initWithRootViewController:(id)a3 searchBarViewController:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  SBUISpotlightBarNavigationController *v9;
  SBUISpotlightBarNavigationController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  v16.receiver = self;
  v16.super_class = (Class)SBUISpotlightBarNavigationController;
  v9 = -[SBUISpotlightBarNavigationController initWithNavigationBarClass:toolbarClass:](&v16, sel_initWithNavigationBarClass_toolbarClass_, v8, 0);
  v10 = v9;
  if (v9)
  {
    -[SBUISpotlightBarNavigationController pushViewController:animated:](v9, "pushViewController:animated:", v6, 0);
    -[SBUISpotlightBarNavigationController setDelegate:](v10, "setDelegate:", v10);
    -[SBUISpotlightBarNavigationController _setBuiltinTransitionStyle:](v10, "_setBuiltinTransitionStyle:", 1);
    -[SBUISpotlightBarNavigationController setSearchBarViewController:](v10, "setSearchBarViewController:", v7);
    -[SBUISpotlightBarNavigationController navigationBar](v10, "navigationBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backgroundBlurView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setBackgroundView:", v12);

    objc_msgSend(v6, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitleView:", v14);

  }
  return v10;
}

- (SBUISpotlightBarNavigationController)initWithRootViewController:(id)a3
{
  return -[SBUISpotlightBarNavigationController initWithRootViewController:searchBarViewController:](self, "initWithRootViewController:searchBarViewController:", a3, 0);
}

- (void)setNavigationBarBlurProgress:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;

  v4 = a4;
  if (-[SBUISpotlightBarNavigationController isPullingToSearch](self, "isPullingToSearch"))
    a3 = 0.0;
  -[SBUISpotlightBarNavigationController navigationBar](self, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_backgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = 1.0;
  if (a3 == 0.0)
    v10 = 0.0;
  objc_msgSend(v8, "setAlpha:", v10);

  -[SBUISpotlightBarNavigationController searchBarViewController](self, "searchBarViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBlurProgress:animated:", v4, a3);

}

- (BOOL)isNavigationBarBottomTrailingCornerRounded
{
  void *v2;
  char v3;

  -[SBUISpotlightBarNavigationController searchBarViewController](self, "searchBarViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "roundedCornerVisible");

  return v3;
}

- (void)setNavigationBarBottomTrailingCornerRounded:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBUISpotlightBarNavigationController searchBarViewController](self, "searchBarViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRoundedCornerVisible:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBUISpotlightBarNavigationController;
  -[SBUISpotlightBarNavigationController viewWillAppear:](&v6, sel_viewWillAppear_);
  -[SBUISpotlightBarNavigationController searchBarViewController](self, "searchBarViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewWillAppear:", v3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBUISpotlightBarNavigationController;
  -[SBUISpotlightBarNavigationController viewDidDisappear:](&v6, sel_viewDidDisappear_);
  -[SBUISpotlightBarNavigationController searchBarViewController](self, "searchBarViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewDidDisappear:", v3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setLegibilitySettings:(id)a3
{
  _UILegibilitySettings *v4;
  _UILegibilitySettings *legibilitySettings;
  void *v6;
  id v7;

  v7 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    v4 = (_UILegibilitySettings *)objc_msgSend(v7, "copy");
    legibilitySettings = self->_legibilitySettings;
    self->_legibilitySettings = v4;

    -[SBUISpotlightBarNavigationController searchBarViewController](self, "searchBarViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLegibilitySettings:", v7);

  }
}

- (SBUISearchBarControlling)searchBarViewController
{
  return self->_searchBarViewController;
}

- (void)setSearchBarViewController:(id)a3
{
  objc_storeStrong((id *)&self->_searchBarViewController, a3);
}

- (BOOL)isPullingToSearch
{
  return self->_pullingToSearch;
}

- (void)setPullingToSearch:(BOOL)a3
{
  self->_pullingToSearch = a3;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_searchBarViewController, 0);
}

@end
