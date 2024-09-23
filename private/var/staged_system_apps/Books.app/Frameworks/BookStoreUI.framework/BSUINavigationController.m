@implementation BSUINavigationController

- (BSUINavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  BSUINavigationController *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BSUINavigationController;
  v4 = -[BSUINavigationController initWithNavigationBarClass:toolbarClass:](&v8, "initWithNavigationBarClass:toolbarClass:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v6 = -[BSUINavigationController registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v5, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v4;
}

- (BSUINavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  BSUINavigationController *v4;
  BSUINavigationController *v5;
  void *v6;

  v4 = -[BSUINavigationController initWithNavigationBarClass:toolbarClass:](self, "initWithNavigationBarClass:toolbarClass:", objc_opt_class(BSUINavigationBar), 0);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController navigationBar](v4, "navigationBar"));
    objc_msgSend(v6, "setPrefersLargeTitles:", 1);

  }
  return v5;
}

- (BSUINavigationController)initWithRootViewController:(id)a3
{
  id v4;
  BSUINavigationController *v5;
  BSUINavigationController *v6;

  v4 = a3;
  v5 = -[BSUINavigationController init](self, "init");
  v6 = v5;
  if (v5)
    -[BSUINavigationController pushViewController:animated:](v5, "pushViewController:animated:", v4, 0);

  return v6;
}

- (BSUINavigationController)initWithOptions:(id)a3
{
  id v4;
  BSUINavigationController *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = -[BSUINavigationController init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("prefersLargeTitles")));
    if ((objc_opt_respondsToSelector(v6, "BOOLValue", v7) & 1) != 0)
    {
      v8 = objc_msgSend(v6, "BOOLValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController navigationBar](v5, "navigationBar"));
      objc_msgSend(v9, "setPrefersLargeTitles:", v8);

    }
  }

  return v5;
}

- (UIView)wrapperView
{
  UIView *wrapperView;
  void *v4;
  id v5;
  UIView *v6;
  UIView *v7;

  wrapperView = self->_wrapperView;
  if (!wrapperView)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController view](self, "view"));
    v5 = objc_alloc((Class)UIView);
    objc_msgSend(v4, "frame");
    v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
    v7 = self->_wrapperView;
    self->_wrapperView = v6;

    -[UIView setAutoresizingMask:](self->_wrapperView, "setAutoresizingMask:", 18);
    -[UIView bounds](self->_wrapperView, "bounds");
    objc_msgSend(v4, "setFrame:");
    objc_msgSend(v4, "setAutoresizingMask:", 18);
    -[UIView addSubview:](self->_wrapperView, "addSubview:", v4);

    wrapperView = self->_wrapperView;
  }
  return wrapperView;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BSUINavigationController;
  -[BSUINavigationController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[BSUINavigationController bc_analyticsVisibilityUpdateSubtree](self, "bc_analyticsVisibilityUpdateSubtree");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BSUINavigationController;
  -[BSUINavigationController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[BSUINavigationController bc_analyticsVisibilitySubtreeWillDisappear](self, "bc_analyticsVisibilitySubtreeWillDisappear");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BSUINavigationController;
  -[BSUINavigationController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[BSUINavigationController bc_analyticsVisibilitySubtreeDidDisappear](self, "bc_analyticsVisibilitySubtreeDidDisappear");
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BSUINavigationController;
  -[BSUINavigationController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController view](self, "view"));
  objc_msgSend(v3, "setAutoresizingMask:", 0);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BSUINavigationController;
  -[BSUINavigationController viewWillLayoutSubviews](&v4, "viewWillLayoutSubviews");
  -[BSUINavigationController applyThemeBasedOnCurrentUserInterfaceStyle](self, "applyThemeBasedOnCurrentUserInterfaceStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController topViewController](self, "topViewController"));
  -[BSUINavigationController _updateLayoutMarginsForViewController:](self, "_updateLayoutMarginsForViewController:", v3);

}

- (void)viewSafeAreaInsetsDidChange
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BSUINavigationController;
  -[BSUINavigationController viewSafeAreaInsetsDidChange](&v7, "viewSafeAreaInsetsDidChange");
  v3 = objc_opt_class(BCCardStackViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController presentedViewController](self, "presentedViewController"));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  objc_msgSend(v6, "presentingViewControllerSafeAreaInsetsDidChange:", self);
}

- (unint64_t)supportedInterfaceOrientations
{
  id v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  if (isPad(self, a2))
    v3 = &dword_1C + 2;
  else
    v3 = &dword_0 + 2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController presentedViewController](self, "presentedViewController"));
  v5 = objc_opt_new(NSMutableArray);
  if (v4)
  {
    do
    {
      -[NSMutableArray addObject:](v5, "addObject:", v4);
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));

      v4 = (void *)v6;
    }
    while (v6);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray reverseObjectEnumerator](v5, "reverseObjectEnumerator"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "conformsToProtocol:", &OBJC_PROTOCOL___BCOrientationControlling))
        {
          v3 = objc_msgSend(v11, "supportedInterfaceOrientations");
          LOBYTE(v8) = 1;
          goto LABEL_16;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_16:

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController topViewController](self, "topViewController"));
  v13 = v12;
  if ((v8 & 1) == 0)
  {
    if (v12)
    {
      v14 = objc_msgSend(v12, "supportedInterfaceOrientations");
    }
    else
    {
      v16.receiver = self;
      v16.super_class = (Class)BSUINavigationController;
      v14 = -[BSUINavigationController supportedInterfaceOrientations](&v16, "supportedInterfaceOrientations");
    }
    v3 = v14;
  }

  return (unint64_t)v3;
}

- (void)applyThemeBasedOnCurrentUserInterfaceStyle
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController view](self, "view"));
  v4 = objc_msgSend(v3, "im_isStyleDark");

  if (v4
    && (-[BSUINavigationController _isInPopoverPresentation](self, "_isInPopoverPresentation") & 1) != 0)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSecondaryBackground](UIColor, "bc_booksSecondaryBackground"));
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  }
  v24 = (id)v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController navigationBar](self, "navigationBar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "standardAppearance"));
  v8 = objc_msgSend(v7, "copy");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BSUINavigationController navigationBarFontAttributes](BSUINavigationController, "navigationBarFontAttributes"));
  objc_msgSend(v8, "setTitleTextAttributes:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController traitCollection](self, "traitCollection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BSUINavigationController largeNavigationBarFontAttributesWithTraitCollection:](BSUINavigationController, "largeNavigationBarFontAttributesWithTraitCollection:", v10));
  objc_msgSend(v8, "setLargeTitleTextAttributes:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController navigationBar](self, "navigationBar"));
  objc_msgSend(v12, "setStandardAppearance:", v8);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController topViewController](self, "topViewController"));
  v14 = BUProtocolCast(&OBJC_PROTOCOL___BSUINavigationBarStyleProviding, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "preferredNavigationBarTintColor"));
  v17 = v16;
  if (v16)
    v18 = v16;
  else
    v18 = (id)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"));
  v19 = v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController navigationBar](self, "navigationBar"));
  objc_msgSend(v20, "setBarStyle:", v4);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController navigationBar](self, "navigationBar"));
  objc_msgSend(v21, "setBarTintColor:", v24);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController navigationBar](self, "navigationBar"));
  objc_msgSend(v22, "setTintColor:", v19);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController toolbar](self, "toolbar"));
  objc_msgSend(v23, "setBarStyle:", v4);

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BSUINavigationController;
  -[BSUINavigationController viewDidMoveToWindow:shouldAppearOrDisappear:](&v5, "viewDidMoveToWindow:shouldAppearOrDisappear:", a3, a4);
  -[BSUINavigationController applyThemeBasedOnCurrentUserInterfaceStyle](self, "applyThemeBasedOnCurrentUserInterfaceStyle");
}

- (void)_updateLayoutMarginsForViewController:(id)a3
{
  -[BSUINavigationController _updateLayoutMarginsForViewController:forInteractiveTransition:](self, "_updateLayoutMarginsForViewController:forInteractiveTransition:", a3, 1);
}

- (void)_updateLayoutMarginsForViewController:(id)a3 forInteractiveTransition:(BOOL)a4
{
  int v4;
  id v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  _QWORD *v13;
  _QWORD v14[4];
  _QWORD *v15;
  _QWORD v16[5];
  id v17;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController viewIfLoaded](self, "viewIfLoaded"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));

  if (v8)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_26754;
    v16[3] = &unk_2E42A8;
    v16[4] = self;
    v17 = v6;
    v9 = objc_retainBlock(v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController transitionCoordinator](self, "transitionCoordinator"));
    v11 = v10;
    if (v10 && objc_msgSend(v10, "isInteractive") == v4)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_268E8;
      v14[3] = &unk_2E4DA8;
      v15 = v9;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_268F8;
      v12[3] = &unk_2E4DA8;
      v13 = v15;
      objc_msgSend(v11, "animateAlongsideTransition:completion:", v14, v12);

    }
    else
    {
      ((void (*)(_QWORD *, _QWORD))v9[2])(v9, 0);
    }

  }
}

- (void)updateLayoutMetrics
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BSUINavigationController viewIfLoaded](self, "viewIfLoaded"));
  objc_msgSend(v2, "setNeedsLayout");

}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  -[BSUINavigationController _updateLayoutMarginsForViewController:](self, "_updateLayoutMarginsForViewController:", v6);
  v7.receiver = self;
  v7.super_class = (Class)BSUINavigationController;
  -[BSUINavigationController pushViewController:animated:](&v7, "pushViewController:animated:", v6, v4);

}

- (id)popViewControllerAnimated:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BSUINavigationController;
  v4 = -[BSUINavigationController popViewControllerAnimated:](&v8, "popViewControllerAnimated:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController topViewController](self, "topViewController"));
  -[BSUINavigationController _updateLayoutMarginsForViewController:](self, "_updateLayoutMarginsForViewController:", v6);

  return v5;
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BSUINavigationController;
  v5 = -[BSUINavigationController popToViewController:animated:](&v9, "popToViewController:animated:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController topViewController](self, "topViewController"));
  -[BSUINavigationController _updateLayoutMarginsForViewController:](self, "_updateLayoutMarginsForViewController:", v7);

  return v6;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BSUINavigationController;
  v4 = -[BSUINavigationController popToRootViewControllerAnimated:](&v8, "popToRootViewControllerAnimated:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController topViewController](self, "topViewController"));
  -[BSUINavigationController _updateLayoutMarginsForViewController:](self, "_updateLayoutMarginsForViewController:", v6);

  return v5;
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BSUINavigationController;
  -[BSUINavigationController setViewControllers:animated:](&v6, "setViewControllers:animated:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController topViewController](self, "topViewController"));
  -[BSUINavigationController _updateLayoutMarginsForViewController:](self, "_updateLayoutMarginsForViewController:", v5);

}

- (BOOL)bc_analyticsVisibilityOfChild:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BSUINavigationController topViewController](self, "topViewController"));

  return v5 == v4;
}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController viewControllers](self, "viewControllers"));
  v4 = objc_msgSend(v3, "count");

  if ((unint64_t)v4 < 2)
    -[BSUINavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  else
    v5 = -[BSUINavigationController popViewControllerAnimated:](self, "popViewControllerAnimated:", 1);
  return 1;
}

- (void)_updateManualScrollEdgeAppearanceProgressForScrollView:(id)a3 navigationItem:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class(BSUINavigationItem);
  v9 = BUDynamicCast(v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v10, "setIsUpdatingManualScrollEdgeAppearanceProgress:", 1);
  v11.receiver = self;
  v11.super_class = (Class)BSUINavigationController;
  -[BSUINavigationController _updateManualScrollEdgeAppearanceProgressForScrollView:navigationItem:](&v11, "_updateManualScrollEdgeAppearanceProgressForScrollView:navigationItem:", v7, v6);

  objc_msgSend(v10, "setIsUpdatingManualScrollEdgeAppearanceProgress:", 0);
}

- (BOOL)bc_analyticsVisibilityOfSelf
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController visibleViewController](self, "visibleViewController"));
  if (v2)
  {
    v3 = objc_opt_class(BSUIPlaceholderViewController);
    v4 = BUDynamicCast(v3, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = v5 == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)bc_analyticsVisibilityDidAppear
{
  NSDate *v3;
  NSDate *appearDate;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BSUINavigationController;
  -[BSUINavigationController bc_analyticsVisibilityDidAppear](&v5, "bc_analyticsVisibilityDidAppear");
  if (-[BSUINavigationController isRoot](self, "isRoot"))
  {
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    appearDate = self->_appearDate;
    self->_appearDate = v3;

  }
}

- (void)bc_analyticsVisibilityWillDisappear
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BSUINavigationController;
  -[BSUINavigationController bc_analyticsVisibilityWillDisappear](&v5, "bc_analyticsVisibilityWillDisappear");
  if (-[BSUINavigationController isRoot](self, "isRoot"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController ba_analyticsTracker](self, "ba_analyticsTracker"));
    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
      objc_msgSend(v4, "emitTabViewEventWithTracker:startDate:", v3, self->_appearDate);

    }
  }
}

- (BOOL)isRoot
{
  return self->_isRoot;
}

- (void)setIsRoot:(BOOL)a3
{
  self->_isRoot = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrapperView, 0);
  objc_storeStrong((id *)&self->_appearDate, 0);
}

+ (NSDictionary)navigationBarFontAttributes
{
  void *v2;
  NSString *v3;
  void *v4;
  Class isa;
  id v7;

  v2 = (void *)objc_opt_self(UIColor);
  v3 = UIFontDescriptorSystemDesignSerif;
  v7 = objc_msgSend(v2, "bc_booksKeyColor");
  v4 = TextAttributesBuilder.build()();
  swift_bridgeObjectRelease(0);

  type metadata accessor for Key(0);
  sub_D16C8();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSDictionary *)isa;
}

+ (id)largeNavigationBarFontAttributesWithTraitCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  Class isa;
  id v8;

  v3 = a3;
  v4 = _s11BookStoreUI21ToolKitTextAttributesV13toolbarHeader4withSDySo21NSAttributedStringKeyaypGSo17UITraitCollectionC_tFZ_0(v3);
  v8 = objc_msgSend((id)objc_opt_self(UIColor), "bc_booksKeyColor");
  v5 = TextAttributesBuilder.build()();

  swift_bridgeObjectRelease(v4);
  type metadata accessor for Key(0);
  sub_D16C8();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  return isa;
}

@end
