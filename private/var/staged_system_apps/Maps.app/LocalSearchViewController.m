@implementation LocalSearchViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)initAsButton:(BOOL)a3
{
  LocalSearchViewController *v4;
  LocalSearchViewController *v5;
  RefreshSearchHereBusinessController *v6;
  RefreshSearchHereBusinessController *refreshSearchHereBusinessController;
  BrowseVenueBusinessController *v8;
  BrowseVenueBusinessController *browseVenueBusinessController;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)LocalSearchViewController;
  v4 = -[LocalSearchViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", 0, 0);
  v5 = v4;
  if (v4)
  {
    v4->_buttonMode = a3;
    v6 = -[RefreshSearchHereBusinessController initWithDelegate:]([RefreshSearchHereBusinessController alloc], "initWithDelegate:", v4);
    refreshSearchHereBusinessController = v5->_refreshSearchHereBusinessController;
    v5->_refreshSearchHereBusinessController = v6;

    v8 = -[BrowseVenueBusinessController initWithDelegate:]([BrowseVenueBusinessController alloc], "initWithDelegate:", v5);
    browseVenueBusinessController = v5->_browseVenueBusinessController;
    v5->_browseVenueBusinessController = v8;

    objc_storeStrong((id *)&v5->_activeBusinessController, v5->_refreshSearchHereBusinessController);
  }
  return v5;
}

- (void)loadView
{
  UIVisualEffectView *v3;
  UIVisualEffectView *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *blurView;
  CardView *v7;
  CardView *cardView;
  CardView *v9;

  if (!self->_buttonMode)
  {
    v5 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue(+[MapsTheme visualEffectViewAllowingBlur:](MapsTheme, "visualEffectViewAllowingBlur:", 1));
    blurView = self->_blurView;
    self->_blurView = v5;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_blurView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    goto LABEL_5;
  }
  if (sub_1002A8AA0(self) == 5)
  {
    v3 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue(+[MapsTheme visualEffectViewAllowingBlur:](MapsTheme, "visualEffectViewAllowingBlur:", 1));
    v4 = self->_blurView;
    self->_blurView = v3;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_blurView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView _setCornerRadius:continuous:maskedCorners:](self->_blurView, "_setCornerRadius:continuous:maskedCorners:", 1, 15, 9.0);
LABEL_5:
    -[LocalSearchViewController setView:](self, "setView:", self->_blurView);
    return;
  }
  v7 = -[CardView initAllowingBlurredForButton:]([CardView alloc], "initAllowingBlurredForButton:", 1);
  -[CardView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CardView setLayoutStyle:](v7, "setLayoutStyle:", 6);
  cardView = self->_cardView;
  self->_cardView = v7;
  v9 = v7;

  -[LocalSearchViewController setView:](self, "setView:", self->_cardView);
}

- (double)contentHeight
{
  double result;

  -[LocalSearchView contentHeight](self->_contentView, "contentHeight");
  return result;
}

- (void)viewDidLoad
{
  void *cardView;
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
  objc_super v23;
  _QWORD v24[4];

  v23.receiver = self;
  v23.super_class = (Class)LocalSearchViewController;
  -[LocalSearchViewController viewDidLoad](&v23, "viewDidLoad");
  cardView = self->_cardView;
  if (!cardView)
    cardView = self->_blurView;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(cardView, "contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController contentView](self, "contentView"));
  objc_msgSend(v18, "addSubview:", v4);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchView leadingAnchor](self->_contentView, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v24[0] = v19;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchView trailingAnchor](self->_contentView, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v24[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchView topAnchor](self->_contentView, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v8));
  v24[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchView bottomAnchor](self->_contentView, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
  v24[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  self->_viewHasAppeared = 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController activeBusinessController](self, "activeBusinessController"));
  objc_msgSend(v5, "viewWillAppear");

  v6.receiver = self;
  v6.super_class = (Class)LocalSearchViewController;
  -[LocalSearchViewController viewWillAppear:](&v6, "viewWillAppear:", v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[LocalSearchViewController reportVisibilityIfNeeded](self, "reportVisibilityIfNeeded");
  v5.receiver = self;
  v5.super_class = (Class)LocalSearchViewController;
  -[LocalSearchViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LocalSearchViewController;
  -[LocalSearchViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  self->_viewHasAppeared = 0;
  -[LocalSearchViewController reportVisibilityIfNeeded](self, "reportVisibilityIfNeeded");
}

- (void)setBottomInset:(double)a3
{
  if (self->_bottomInset != a3)
  {
    self->_bottomInset = a3;
    -[LocalSearchView setBottomInset:](self->_contentView, "setBottomInset:");
  }
}

- (id)contentView
{
  LocalSearchView *contentView;
  LocalSearchView *v4;
  LocalSearchView *v5;
  LocalSearchView *v6;
  void *v7;

  contentView = self->_contentView;
  if (!contentView)
  {
    v4 = -[LocalSearchView initWithFrame:]([LocalSearchView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_contentView;
    self->_contentView = v4;

    -[LocalSearchView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[LocalSearchView setButtonMode:](self->_contentView, "setButtonMode:", self->_buttonMode);
    -[LocalSearchView setBottomInset:](self->_contentView, "setBottomInset:", self->_bottomInset);
    -[LocalSearchView setDelegate:](self->_contentView, "setDelegate:", self);
    v6 = self->_contentView;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController activeBusinessController](self, "activeBusinessController"));
    objc_msgSend(v7, "setContentView:", v6);

    contentView = self->_contentView;
  }
  return contentView;
}

- (id)businessControllers
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController refreshSearchHereBusinessController](self, "refreshSearchHereBusinessController"));
  v7[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController browseVenueBusinessController](self, "browseVenueBusinessController"));
  v7[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));

  return v5;
}

- (BOOL)updateActiveBusinessController
{
  LocalSearchBusinessController **p_refreshSearchHereBusinessController;
  LocalSearchBusinessController *v4;
  LocalSearchBusinessController *activeBusinessController;

  p_refreshSearchHereBusinessController = (LocalSearchBusinessController **)&self->_refreshSearchHereBusinessController;
  if (!-[RefreshSearchHereBusinessController shouldBeVisible](self->_refreshSearchHereBusinessController, "shouldBeVisible"))
  {
    if (-[BrowseVenueBusinessController shouldBeVisible](self->_browseVenueBusinessController, "shouldBeVisible"))
      p_refreshSearchHereBusinessController = (LocalSearchBusinessController **)&self->_browseVenueBusinessController;
    else
      p_refreshSearchHereBusinessController = &self->_activeBusinessController;
  }
  v4 = *p_refreshSearchHereBusinessController;
  activeBusinessController = self->_activeBusinessController;
  if (v4 != activeBusinessController)
    -[LocalSearchViewController setActiveBusinessController:](self, "setActiveBusinessController:", v4);
  return v4 != activeBusinessController;
}

- (void)setActiveBusinessController:(id)a3
{
  LocalSearchBusinessController *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  LocalSearchBusinessController *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = (LocalSearchBusinessController *)a3;
  if (self->_activeBusinessController != v5)
  {
    objc_storeStrong((id *)&self->_activeBusinessController, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController delegate](self, "delegate"));
    v7 = objc_opt_respondsToSelector(v6, "localSearchViewShowInCardFooterWhenCardHasExpandedLayoutDidChange:");

    if ((v7 & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController delegate](self, "delegate"));
      objc_msgSend(v8, "localSearchViewShowInCardFooterWhenCardHasExpandedLayoutDidChange:", self);

    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController businessControllers](self, "businessControllers", 0));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(LocalSearchBusinessController **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          if (v14 == v5)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController contentView](self, "contentView"));
            -[LocalSearchBusinessController setContentView:](v5, "setContentView:", v15);

          }
          else
          {
            -[LocalSearchBusinessController setContentView:](v14, "setContentView:", 0);
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController contentView](self, "contentView"));
    objc_msgSend(v16, "layoutIfNeeded");

    -[LocalSearchViewController reportVisibilityIfNeeded](self, "reportVisibilityIfNeeded");
    -[MapsThemeViewController updateTheme](self, "updateTheme");
    -[LocalSearchViewController localSearchViewContentSizeChanged](self, "localSearchViewContentSizeChanged");
  }

}

- (void)reportVisibilityIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[LocalSearchViewController viewHasAppeared](self, "viewHasAppeared")
    && -[LocalSearchViewController shouldBeVisible](self, "shouldBeVisible"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController activeBusinessController](self, "activeBusinessController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController reportedVisibleBusinessController](self, "reportedVisibleBusinessController"));

    if (v3 != v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController activeBusinessController](self, "activeBusinessController"));
      objc_msgSend(v5, "sendAnalyticsOnBecomeVisibleWithTarget:", -[LocalSearchViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"));

      v6 = (id)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController activeBusinessController](self, "activeBusinessController"));
      -[LocalSearchViewController setReportedVisibleBusinessController:](self, "setReportedVisibleBusinessController:", v6);

    }
  }
  else
  {
    -[LocalSearchViewController setReportedVisibleBusinessController:](self, "setReportedVisibleBusinessController:", 0);
  }
}

- (void)setEnable:(BOOL)a3
{
  if (self->_enable != a3)
  {
    self->_enable = a3;
    -[LocalSearchViewController localSearchViewVisibilityChanged](self, "localSearchViewVisibilityChanged");
    -[LocalSearchViewController reportVisibilityIfNeeded](self, "reportVisibilityIfNeeded");
  }
}

- (BOOL)shouldBeVisible
{
  void *v3;
  unsigned __int8 v4;
  void *v5;

  if (!-[LocalSearchViewController isEnabled](self, "isEnabled"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController refreshSearchHereBusinessController](self, "refreshSearchHereBusinessController"));
  if ((objc_msgSend(v3, "shouldBeVisible") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController browseVenueBusinessController](self, "browseVenueBusinessController"));
    v4 = objc_msgSend(v5, "shouldBeVisible");

  }
  return v4;
}

- (BOOL)showInCardFooterWhenCardHasExpandedLayout
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController activeBusinessController](self, "activeBusinessController"));
  v3 = objc_msgSend(v2, "showInCardFooterWhenCardHasExpandedLayout");

  return v3;
}

- (void)localSearchViewSelected:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController activeBusinessController](self, "activeBusinessController", a3));
  objc_msgSend(v4, "sendAnalyticsOnUserActionWithTarget:", -[LocalSearchViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController activeBusinessController](self, "activeBusinessController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController refreshSearchHereBusinessController](self, "refreshSearchHereBusinessController"));

  if (v5 == v6)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController delegate](self, "delegate"));
    objc_msgSend(v9, "localSearchViewControllerDidSelectRefreshSearchHere:", self);
LABEL_6:

    return;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController activeBusinessController](self, "activeBusinessController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController browseVenueBusinessController](self, "browseVenueBusinessController"));

  if (v7 == v8)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController delegate](self, "delegate"));
    objc_msgSend(v9, "viewControllerDidSelectBrowseVenue:", self);
    goto LABEL_6;
  }
}

- (void)localSearchViewVisibilityChanged
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "localSearchViewShouldBeVisibleDidChange:");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController delegate](self, "delegate"));
    objc_msgSend(v5, "localSearchViewShouldBeVisibleDidChange:", self);

  }
}

- (void)localSearchViewContentSizeChanged
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "localSearchViewControllerSizeDidChange:");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController delegate](self, "delegate"));
    objc_msgSend(v5, "localSearchViewControllerSizeDidChange:", self);

  }
}

- (VKVenueFeatureMarker)venueWithFocus
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "venueWithFocus"));

  return (VKVenueFeatureMarker *)v3;
}

- (void)businessControllerVisibilityDidChange:(id)a3
{
  -[LocalSearchViewController updateActiveBusinessController](self, "updateActiveBusinessController", a3);
  -[LocalSearchViewController localSearchViewVisibilityChanged](self, "localSearchViewVisibilityChanged");
  -[LocalSearchViewController reportVisibilityIfNeeded](self, "reportVisibilityIfNeeded");
}

- (void)businessControllerContentSizeDidChange:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  if (!-[LocalSearchViewController updateActiveBusinessController](self, "updateActiveBusinessController"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController activeBusinessController](self, "activeBusinessController"));

    if (v4 == v5)
      -[LocalSearchViewController localSearchViewContentSizeChanged](self, "localSearchViewContentSizeChanged");
  }

}

- (int)currentUITargetForAnalytics
{
  void *v3;
  unsigned int v4;
  void *v5;
  int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController delegate](self, "delegate"));
  v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___GEOLogContextDelegate);

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v5, "currentUITargetForAnalytics") & 1) != 0)
    v6 = objc_msgSend(v5, "currentUITargetForAnalytics");
  else
    v6 = 0;

  return v6;
}

- (int)currentMapViewTargetForAnalytics
{
  void *v3;
  unsigned int v4;
  void *v5;
  int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController delegate](self, "delegate"));
  v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___GEOLogContextDelegate);

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v5, "currentMapViewTargetForAnalytics") & 1) != 0)
    v6 = objc_msgSend(v5, "currentMapViewTargetForAnalytics");
  else
    v6 = 0;

  return v6;
}

- (BOOL)viewHasAppeared
{
  return self->_viewHasAppeared;
}

- (LocalSearchViewControllerDelegate)delegate
{
  return (LocalSearchViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RefreshSearchHereBusinessController)refreshSearchHereBusinessController
{
  return self->_refreshSearchHereBusinessController;
}

- (BrowseVenueBusinessController)browseVenueBusinessController
{
  return self->_browseVenueBusinessController;
}

- (BOOL)isEnabled
{
  return self->_enable;
}

- (double)bottomInset
{
  return self->_bottomInset;
}

- (LocalSearchBusinessController)activeBusinessController
{
  return self->_activeBusinessController;
}

- (LocalSearchBusinessController)reportedVisibleBusinessController
{
  return self->_reportedVisibleBusinessController;
}

- (void)setReportedVisibleBusinessController:(id)a3
{
  objc_storeStrong((id *)&self->_reportedVisibleBusinessController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportedVisibleBusinessController, 0);
  objc_storeStrong((id *)&self->_activeBusinessController, 0);
  objc_storeStrong((id *)&self->_browseVenueBusinessController, 0);
  objc_storeStrong((id *)&self->_refreshSearchHereBusinessController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
}

@end
