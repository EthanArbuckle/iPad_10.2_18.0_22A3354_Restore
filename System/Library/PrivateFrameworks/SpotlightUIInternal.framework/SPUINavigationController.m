@implementation SPUINavigationController

- (void)didInvalidateSizeAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[SPUINavigationController navigationMode](self, "navigationMode") == 1
    || -[SPUINavigationController navigationMode](self, "navigationMode") == 5)
  {
    if (objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow"))
    {
      -[SPUINavigationController contentHeightIncludingSearchView](self, "contentHeightIncludingSearchView");
      -[SPUINavigationController setContentHeight:animated:](self, "setContentHeight:animated:", v3);
    }
  }
}

- (int64_t)navigationMode
{
  return self->_navigationMode;
}

- (void)setNavigationMode:(int64_t)a3
{
  int64_t navigationMode;
  _BOOL8 v6;
  SPUINavigationController *v7;
  id v8;

  navigationMode = self->_navigationMode;
  self->_navigationMode = a3;
  objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow");
  switch(a3)
  {
    case 0:
      -[SPUINavigationController heightOfNavigationBar](self, "heightOfNavigationBar");
      goto LABEL_4;
    case 1:
    case 2:
      -[SPUINavigationController contentHeightIncludingSearchView](self, "contentHeightIncludingSearchView");
      v6 = navigationMode == 3;
      v7 = self;
      goto LABEL_5;
    case 3:
LABEL_4:
      v7 = self;
      v6 = 0;
LABEL_5:
      -[SPUINavigationController setContentHeight:animated:](v7, "setContentHeight:animated:", v6);
      break;
    case 4:
      goto LABEL_7;
    case 5:
      -[SPUINavigationController contentHeightIncludingSearchView](self, "contentHeightIncludingSearchView");
      -[SPUINavigationController setContentHeight:animated:](self, "setContentHeight:animated:", navigationMode == 0);
LABEL_7:
      -[SPUINavigationController applyCardHeightAnimated:](self, "applyCardHeightAnimated:", 1);
      break;
    default:
      break;
  }
  -[SPUINavigationController searchViewController](self, "searchViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateResponderChainIfNeeded");

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  char v11;
  char v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  char v16;

  v7 = a4;
  objc_msgSend(a3, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v7, "setEdgesForExtendedLayout:", objc_msgSend(v7, "edgesForExtendedLayout") & 0xFFFFFFFFFFFFFFFELL);
  objc_opt_class();
  v11 = objc_opt_isKindOfClass();
  objc_opt_class();
  v12 = objc_opt_isKindOfClass();
  if ((v12 & 1) != 0)
  {
    v13 = v7;
    objc_msgSend(v13, "setDelegate:", self);
    objc_msgSend(v13, "setShouldDrawBackgroundColor:", 0);

  }
  if ((v11 & 1) == 0)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __81__SPUINavigationController_navigationController_willShowViewController_animated___block_invoke;
    v15[3] = &unk_24F9D5E38;
    v16 = v12 & 1;
    v15[4] = self;
    objc_msgSend(MEMORY[0x24BE85288], "performAnimatableChanges:", v15);
  }
  -[SPUINavigationController updateBackgroundColorWithViewControllerToBeShown:](self, "updateBackgroundColorWithViewControllerToBeShown:", v7);
  -[SPUINavigationController updateFooterViewForViewController:](self, "updateFooterViewForViewController:", v7);
  -[SPUINavigationController updateSearchFieldForViewController:](self, "updateSearchFieldForViewController:", v7);
  -[SPUINavigationController navigationBar](self, "navigationBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateBackgroundViewVisibility");

}

- (void)updateFooterViewsIfNecessary
{
  id v3;

  -[SPUINavigationController topViewController](self, "topViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SPUINavigationController updateFooterViewForViewController:](self, "updateFooterViewForViewController:", v3);

}

- (void)updateFooterViewForViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v7;
    -[SPUINavigationController generateFooterViewForProactive:cache:](self, "generateFooterViewForProactive:cache:", 1, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUINavigationController generateFooterViewForProactive:cache:](self, "generateFooterViewForProactive:cache:", 0, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFooterViewsForProactive:forResults:", v5, v6);

LABEL_5:
    goto LABEL_6;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SPUINavigationController generateFooterViewForProactive:cache:](self, "generateFooterViewForProactive:cache:", 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performSelector:withObject:", sel_setFooterView_, v5);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)updateBackgroundColorWithViewControllerToBeShown:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  _QWORD aBlock[5];
  id v20;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "backgroundColorForViewController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPUINavigationController transitioningBackgroundView](self, "transitioningBackgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);

  -[SPUINavigationController transitioningBackgroundView](self, "transitioningBackgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColor:", v5);

  -[SPUINavigationController transitionCoordinator](self, "transitionCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__SPUINavigationController_updateBackgroundColorWithViewControllerToBeShown___block_invoke;
  aBlock[3] = &unk_24F9D5D98;
  aBlock[4] = self;
  v10 = v5;
  v20 = v10;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __77__SPUINavigationController_updateBackgroundColorWithViewControllerToBeShown___block_invoke_2;
  v18[3] = &unk_24F9D5DC0;
  v18[4] = self;
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __77__SPUINavigationController_updateBackgroundColorWithViewControllerToBeShown___block_invoke_3;
  v16[3] = &unk_24F9D5DE8;
  v11 = _Block_copy(aBlock);
  v17 = v11;
  if ((objc_msgSend(v8, "animateAlongsideTransition:completion:", v18, v16) & 1) == 0)
  {
    v12 = (void *)MEMORY[0x24BE85288];
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __77__SPUINavigationController_updateBackgroundColorWithViewControllerToBeShown___block_invoke_4;
    v14[3] = &unk_24F9D5E10;
    v15 = v11;
    objc_msgSend(v12, "performAnimatableChanges:", v14);

  }
  if (!v8)
  {
    -[SPUINavigationController backgroundView](self, "backgroundView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setColor:", v10);

  }
}

+ (id)backgroundColorForViewController:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "viewControllerWithBackgroundColorForViewController:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchUIBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)viewControllerWithBackgroundColorForViewController:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "childViewControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = v3;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (void)setUnifiedFieldDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_unifiedFieldDelegate, a3);
}

- (SPUINavigationController)initWithSearchViewController:(id)a3
{
  id v4;
  SPUINavigationController *v5;
  SPUINavigationController *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = -[SPUINavigationController initWithRootViewController:](self, "initWithRootViewController:", v4);
  v6 = v5;
  if (v5)
  {
    -[SPUINavigationController setSearchViewController:](v5, "setSearchViewController:", v4);
    -[SPUINavigationController searchViewController](v6, "searchViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSizingDelegate:", v6);

    v6->_navigationMode = 0;
    -[SPUINavigationController view](v6, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 1148846080;
    objc_msgSend(v8, "setContentCompressionResistancePriority:forAxis:", 1, v9);

    -[SPUINavigationController searchViewController](v6, "searchViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "headerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUINavigationController navigationBar](v6, "navigationBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHeader:", v11);

  }
  return v6;
}

- (SPUISearchViewController)searchViewController
{
  return (SPUISearchViewController *)objc_getProperty(self, a2, 1448, 1);
}

- (void)setSearchViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1448);
}

- (SPUINavigationController)initWithRootViewController:(id)a3
{
  id v4;
  SPUINavigationController *v5;
  SPUINavigationController *v6;

  v4 = a3;
  v5 = -[SPUINavigationController initWithNavigationBarClass:toolbarClass:](self, "initWithNavigationBarClass:toolbarClass:", 0, 0);
  v6 = v5;
  if (v5)
    -[SPUINavigationController pushViewController:animated:](v5, "pushViewController:animated:", v4, 0);

  return v6;
}

- (SPUINavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  SPUINavigationController *v7;
  SPUINavigationController *v8;
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
  double v22;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v48;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    a3 = (Class)objc_opt_class();
  v48.receiver = self;
  v48.super_class = (Class)SPUINavigationController;
  v7 = -[SPUINavigationController initWithNavigationBarClass:toolbarClass:](&v48, sel_initWithNavigationBarClass_toolbarClass_, a3, a4);
  v8 = v7;
  if (v7)
  {
    -[SPUINavigationController setDelegate:](v7, "setDelegate:", v7);
    -[SPUINavigationController _setBuiltinTransitionStyle:](v8, "_setBuiltinTransitionStyle:", 1);
    -[SPUINavigationController view](v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHitTestsAsOpaque:", 1);

    v11 = (void *)objc_opt_new();
    -[SPUINavigationController setBackgroundView:](v8, "setBackgroundView:", v11);

    -[SPUINavigationController backgroundView](v8, "backgroundView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShowsPlaceholderPlatterView:", 0);

    -[SPUINavigationController backgroundView](v8, "backgroundView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", v8);

    -[SPUINavigationController view](v8, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUINavigationController backgroundView](v8, "backgroundView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "insertSubview:atIndex:", v15, 0);

    -[SPUINavigationController view](v8, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setClipsToBounds:", 0);

    -[SPUINavigationController backgroundView](v8, "backgroundView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[SPUINavigationController backgroundView](v8, "backgroundView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUINavigationController view](v8, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(double *)&SPUIExtendedEdgesDimensionConstant;
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, *(double *)&SPUIExtendedEdgesDimensionConstant * -2.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setActive:", 1);

    -[SPUINavigationController backgroundView](v8, "backgroundView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUINavigationController view](v8, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27, v22 + v22);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setActive:", 1);

    -[SPUINavigationController backgroundView](v8, "backgroundView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUINavigationController view](v8, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32, v22 * -6.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setActive:", 1);

    -[SPUINavigationController backgroundView](v8, "backgroundView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUINavigationController view](v8, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v37, v22 + v22);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setActive:", 1);

    v39 = (void *)objc_opt_new();
    -[SPUINavigationController setTransitioningBackgroundView:](v8, "setTransitioningBackgroundView:", v39);

    -[SPUINavigationController transitioningBackgroundView](v8, "transitioningBackgroundView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setShowsPlaceholderPlatterView:", 0);

    -[SPUINavigationController transitioningBackgroundView](v8, "transitioningBackgroundView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setAlpha:", 0.0);

    -[SPUINavigationController view](v8, "view");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUINavigationController transitioningBackgroundView](v8, "transitioningBackgroundView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "insertSubview:atIndex:", v43, 0);

    v44 = (void *)MEMORY[0x24BE85220];
    -[SPUINavigationController transitioningBackgroundView](v8, "transitioningBackgroundView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "fillContainerWithView:", v45);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v8, (CFNotificationCallback)lockStateChanged, CFSTR("com.apple.mobile.keybagd.lock_status"), 0, CFNotificationSuspensionBehaviorDrop);
    -[SPUINavigationController setIsFirstInitialization:](v8, "setIsFirstInitialization:", 1);
  }
  return v8;
}

- (SearchUIBackgroundColorView)backgroundView
{
  return self->_backgroundView;
}

- (SearchUIBackgroundColorView)transitioningBackgroundView
{
  return self->_transitioningBackgroundView;
}

- (void)setTransitioningBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_transitioningBackgroundView, a3);
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void)updateSearchFieldForViewController:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
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
  SPUINavigationController *v32;
  void *v33;
  void *v34;
  SPUINavigationController *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  char isKindOfClass;
  void *v51;
  void *v52;
  id v53;

  v53 = a3;
  v4 = 0x24BE85000uLL;
  if (objc_msgSend(MEMORY[0x24BE85288], "isIpad"))
  {
    -[SPUINavigationController navigationBar](self, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "header");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unfocusSearchFieldWithReason:", 5);

  }
  objc_msgSend(v53, "transitionCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!-[SPUINavigationController isFirstInitialization](self, "isFirstInitialization"))
    {
      -[SPUINavigationController searchViewController](self, "searchViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastSearchToken");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUINavigationController searchViewController](self, "searchViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastSearchString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUINavigationController resetSearchFieldContentWithSearchToken:text:wantsBackButton:transitionCoordinator:](self, "resetSearchFieldContentWithSearchToken:text:wantsBackButton:transitionCoordinator:", v9, v11, 0, v7);

    }
    -[SPUINavigationController setIsFirstInitialization:](self, "setIsFirstInitialization:", 0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v53;
      objc_msgSend(v12, "card");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "titleImage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_14;
      v15 = (void *)MEMORY[0x24BE85258];
      objc_msgSend(v12, "card");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "titleImage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "imageWithSFImage:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUINavigationController view](self, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "effectiveScreenScale");
      v21 = v20;
      v22 = (void *)MEMORY[0x24BEB4B88];
      -[SPUINavigationController view](self, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bestAppearanceForView:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "loadImageWithScale:isDarkStyle:", objc_msgSend(v24, "isDark"), v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = 0x24BE85000;
      if (!v25)
        goto LABEL_14;
      v26 = (void *)MEMORY[0x24BEBD930];
      objc_msgSend(v12, "card");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "title");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "tokenWithIcon:text:", v25, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "card");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "title");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setRepresentedObject:", v31);

      if (v29)
      {
        v32 = self;
        v33 = v29;
        v34 = 0;
      }
      else
      {
LABEL_14:
        objc_msgSend(v12, "title");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = self;
        v33 = 0;
        v34 = v29;
      }
      -[SPUINavigationController resetSearchFieldContentWithSearchToken:text:wantsBackButton:transitionCoordinator:](v32, "resetSearchFieldContentWithSearchToken:text:wantsBackButton:transitionCoordinator:", v33, v34, 1, v7);

      -[SPUINavigationController searchViewController](self, "searchViewController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "headerView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "searchField");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTextField:", v40);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v53, "searchToken");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v35 = self;
        v36 = v12;
        v37 = 0;
      }
      else
      {
        objc_msgSend(v53, "title");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v35 = self;
        v36 = 0;
        v37 = v12;
      }
      -[SPUINavigationController resetSearchFieldContentWithSearchToken:text:wantsBackButton:transitionCoordinator:](v35, "resetSearchFieldContentWithSearchToken:text:wantsBackButton:transitionCoordinator:", v36, v37, 1, v7);
    }

  }
  if (objc_msgSend(MEMORY[0x24BEB0808], "bottomSearchFieldEnabled")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SPUINavigationController searchViewController](self, "searchViewController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "headerView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "frame");
    if (v43 == 0.0)
    {
      -[SPUINavigationController searchViewController](self, "searchViewController");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "headerView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "systemLayoutSizeFittingSize:", *MEMORY[0x24BEBE590], *(double *)(MEMORY[0x24BEBE590] + 8));
      v47 = v46;

    }
    else
    {
      v47 = v43;
    }

    objc_msgSend(v53, "setAdditionalKeyboardHeight:", v47);
  }
  if (objc_msgSend(*(id *)(v4 + 648), "isIpad"))
  {
    -[SPUINavigationController viewControllers](self, "viewControllers");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "firstObject");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[SPUINavigationController viewControllers](self, "viewControllers");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "firstObject");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "updateResponderChainIfNeeded");

    }
  }

}

- (void)setIsFirstInitialization:(BOOL)a3
{
  self->_isFirstInitialization = a3;
}

- (BOOL)isFirstInitialization
{
  return self->_isFirstInitialization;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

uint64_t __77__SPUINavigationController_updateBackgroundColorWithViewControllerToBeShown___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__SPUINavigationController_updateBackgroundColorWithViewControllerToBeShown___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if ((a2 & 1) != 0)
  {
    v3 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "visibleViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "backgroundColorForViewController:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = *(id *)(a1 + 40);
  }
  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", v8);

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "transitioningBackgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", 0.0);

}

- (SPUINavigationController)init
{
  return -[SPUINavigationController initWithNavigationBarClass:toolbarClass:](self, "initWithNavigationBarClass:toolbarClass:", 0, 0);
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.mobile.keybagd.lock_status"), 0);
  v4.receiver = self;
  v4.super_class = (Class)SPUINavigationController;
  -[SPUINavigationController dealloc](&v4, sel_dealloc);
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a4;
  v6 = a3;
  -[SPUINavigationController navigationBar](self, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reconfigureNavigationBarForItem:", v8);

  v9.receiver = self;
  v9.super_class = (Class)SPUINavigationController;
  -[SPUINavigationController pushViewController:animated:](&v9, sel_pushViewController_animated_, v6, v4);

}

void __77__SPUINavigationController_updateBackgroundColorWithViewControllerToBeShown___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "transitioningBackgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

}

uint64_t __77__SPUINavigationController_updateBackgroundColorWithViewControllerToBeShown___block_invoke_3(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "isCancelled"));
}

uint64_t __81__SPUINavigationController_navigationController_willShowViewController_animated___block_invoke(uint64_t a1)
{
  uint64_t v1;

  if (*(_BYTE *)(a1 + 40))
    v1 = 4;
  else
    v1 = 3;
  return objc_msgSend(*(id *)(a1 + 32), "setNavigationMode:", v1);
}

- (void)resetSearchFieldContentWithSearchToken:(id)a3 text:(id)a4 wantsBackButton:(BOOL)a5 transitionCoordinator:(id)a6
{
  _BOOL8 v6;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  BOOL v29;
  _QWORD v30[5];
  BOOL v31;

  v6 = a5;
  v10 = (void *)MEMORY[0x24BEB0808];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  if (objc_msgSend(v10, "bottomSearchFieldEnabled"))
  {
    -[SPUINavigationController unifiedFieldDelegate](self, "unifiedFieldDelegate");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "resetSearchFieldContentWithSearchToken:text:wantsBackButton:transitionCoordinator:", v13, v12, v6, v11);

  }
  else
  {
    -[SPUINavigationController navigationBar](self, "navigationBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "header");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setUseClearTokens:", 1);
    objc_msgSend(v15, "searchField");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v13)
      v18 = 0;
    else
      v18 = v12;
    objc_msgSend(v16, "updateTextRange:", v18);

    objc_msgSend(v15, "searchField");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateToken:", v13);

    v20 = (void *)MEMORY[0x24BEBDB00];
    objc_msgSend(v15, "searchField");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leftView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transitionDuration");
    v24 = v23;

    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __110__SPUINavigationController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke;
    v30[3] = &unk_24F9D5E38;
    v30[4] = self;
    v31 = v6;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __110__SPUINavigationController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_2;
    v27[3] = &unk_24F9D5E60;
    v29 = v6;
    v28 = v15;
    v25 = v15;
    objc_msgSend(v20, "transitionWithView:duration:options:animations:completion:", v22, 5242880, v30, v27, v24);

  }
}

uint64_t __110__SPUINavigationController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateBackButton:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __110__SPUINavigationController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  int v1;
  void *v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  if (v1)
    return objc_msgSend(v2, "unfocusSearchFieldWithReason:afterCommit:", 5, 0);
  else
    return objc_msgSend(v2, "focusSearchFieldAndSelectAll:withReason:", 0, 3);
}

- (void)updateBackButton:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[SPUINavigationController navigationBar](self, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "header");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchField");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
    v6 = CFSTR("chevron.backward");
  else
    v6 = CFSTR("magnifyingglass");
  objc_msgSend(v8, "updateLeftViewWithSymbolName:", v6);
  objc_msgSend(v8, "leftView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", v3);

}

- (void)setContentHeight:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  if (self->_contentHeight != a3)
  {
    v4 = a4;
    self->_contentHeight = a3;
    -[SPUINavigationController sizingDelegate](self, "sizingDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationViewDidInvalidateSizeAnimated:", v4);

  }
}

- (double)contentHeightIncludingSearchView
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[SPUINavigationController heightOfNavigationBar](self, "heightOfNavigationBar");
  v4 = v3;
  -[SPUINavigationController searchViewController](self, "searchViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentHeight");
  v7 = v4 + v6;

  return v7;
}

- (double)contentHeightIncludingCardViewController
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double result;
  void *v9;
  void *v10;
  double Height;
  CGRect v12;

  -[SPUINavigationController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SPUINavigationController topViewController](self, "topViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSize");
    v4 = v6;

  }
  -[SPUINavigationController heightOfNavigationBar](self, "heightOfNavigationBar");
  result = v4 + v7;
  if (result < 250.0)
  {
    -[SPUINavigationController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    Height = CGRectGetHeight(v12);

    return Height;
  }
  return result;
}

- (double)heightOfNavigationBar
{
  void *v2;
  double v3;
  double v4;

  -[SPUINavigationController navigationBar](self, "navigationBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;

  return v4;
}

- (void)applyCardHeightAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;

  v3 = a3;
  -[SPUINavigationController contentHeightIncludingCardViewController](self, "contentHeightIncludingCardViewController");
  v6 = v5;
  -[SPUINavigationController heightOfNavigationBar](self, "heightOfNavigationBar");
  if (v7 != v6)
    -[SPUINavigationController setContentHeight:animated:](self, "setContentHeight:animated:", v3, v6);
}

- (void)cardViewController:(id)a3 preferredContentSizeDidChange:(CGSize)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a5;
  v8 = a3;
  if (-[SPUINavigationController navigationMode](self, "navigationMode") == 4)
  {
    -[SPUINavigationController topViewController](self, "topViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v8)
      -[SPUINavigationController applyCardHeightAnimated:](self, "applyCardHeightAnimated:", v5);
  }

}

- (id)generateFooterViewForProactive:(BOOL)a3 cache:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(void);
  void *v12;
  void (**v13)(void);
  void *v14;
  uint64_t v15;
  NSObject **v16;
  NSObject *v17;

  v4 = a4;
  v5 = a3;
  -[SPUINavigationController footerGeneratorForProactive:](self, "footerGeneratorForProactive:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (v4)
    {
      if (generateFooterViewForProactive_cache__onceToken != -1)
        dispatch_once(&generateFooterViewForProactive_cache__onceToken, &__block_literal_global_0);
      v8 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v7, "reuseIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@, %@"), v9, v10);
      v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)generateFooterViewForProactive_cache__footerViewCache, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        goto LABEL_14;
      objc_msgSend(v7, "buttonGenerator");
      v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v13[2]();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)generateFooterViewForProactive_cache__footerViewCache, "setObject:forKeyedSubscript:", v14, v11);

      objc_msgSend((id)generateFooterViewForProactive_cache__footerViewCache, "objectForKeyedSubscript:", v11);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "buttonGenerator");
      v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v11[2]();
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v15;
LABEL_14:

    goto LABEL_15;
  }
  v16 = (NSObject **)MEMORY[0x24BEB0818];
  v17 = *MEMORY[0x24BEB0818];
  if (!*MEMORY[0x24BEB0818])
  {
    SPUIInitLogging();
    v17 = *v16;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[SPUINavigationController generateFooterViewForProactive:cache:].cold.1(v17);
  v12 = 0;
LABEL_15:

  return v12;
}

void __65__SPUINavigationController_generateFooterViewForProactive_cache___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)generateFooterViewForProactive_cache__footerViewCache;
  generateFooterViewForProactive_cache__footerViewCache = v0;

}

- (id)footerGeneratorForProactive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  BOOL v7;
  SPUIFooterButtonGenerator *v8;
  id *v9;
  uint64_t v10;
  SPUIFooterButtonGenerator *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v3 = a3;
  v5 = (void *)MEMORY[0x24BE85288];
  -[SPUINavigationController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "deviceIsAuthenticatedForView:", v6);

  if ((v5 & 1) == 0)
    return -[SPUIFooterButtonGenerator initWithReuseIdentifier:buttonGenerator:]([SPUIFooterButtonGenerator alloc], "initWithReuseIdentifier:buttonGenerator:", CFSTR("lockScreenFooter"), &__block_literal_global_120);
  if (+[SPUISearchFirstTimeViewController needsDisplay](SPUISearchFirstTimeViewController, "needsDisplay"))
  {
    v7 = !v3;
  }
  else
  {
    v7 = 1;
  }
  if (!v7
    && +[SPUISearchFirstTimeViewController useZKWFTE](SPUISearchFirstTimeViewController, "useZKWFTE"))
  {
    objc_initWeak(&location, self);
    v8 = [SPUIFooterButtonGenerator alloc];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __56__SPUINavigationController_footerGeneratorForProactive___block_invoke_2;
    v16[3] = &unk_24F9D5F10;
    v9 = &v17;
    objc_copyWeak(&v17, &location);
    v10 = -[SPUIFooterButtonGenerator initWithReuseIdentifier:buttonGenerator:](v8, "initWithReuseIdentifier:buttonGenerator:", CFSTR("fteView"), v16);
LABEL_11:
    v13 = (void *)v10;
    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
    return v13;
  }
  if (+[SPUITapToRadarView shouldDisplayTapToRadar](SPUITapToRadarView, "shouldDisplayTapToRadar"))
  {
    objc_initWeak(&location, self);
    v12 = [SPUIFooterButtonGenerator alloc];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __56__SPUINavigationController_footerGeneratorForProactive___block_invoke_5;
    v14[3] = &unk_24F9D5F10;
    v9 = &v15;
    objc_copyWeak(&v15, &location);
    v10 = -[SPUIFooterButtonGenerator initWithReuseIdentifier:buttonGenerator:](v12, "initWithReuseIdentifier:buttonGenerator:", CFSTR("ttr"), v14);
    goto LABEL_11;
  }
  return 0;
}

id __56__SPUINavigationController_footerGeneratorForProactive___block_invoke()
{
  return (id)objc_opt_new();
}

SPUIFTEView *__56__SPUINavigationController_footerGeneratorForProactive___block_invoke_2(uint64_t a1)
{
  SPUIFTEView *v2;
  uint64_t v3;
  SPUIFTEView *v4;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v2 = [SPUIFTEView alloc];
  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__SPUINavigationController_footerGeneratorForProactive___block_invoke_3;
  v8[3] = &unk_24F9D5EE8;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __56__SPUINavigationController_footerGeneratorForProactive___block_invoke_4;
  v6[3] = &unk_24F9D5EE8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v4 = -[SPUIFTEView initWithPrivacyPresentation:ttr:](v2, "initWithPrivacyPresentation:ttr:", v8, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  return v4;
}

void __56__SPUINavigationController_footerGeneratorForProactive___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentPrivacyView");

}

void __56__SPUINavigationController_footerGeneratorForProactive___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "tapToRadarPressed");

}

SPUITapToRadarView *__56__SPUINavigationController_footerGeneratorForProactive___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  SPUITapToRadarView *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = -[SPUITapToRadarView initWithTarget:action:]([SPUITapToRadarView alloc], "initWithTarget:action:", WeakRetained, sel_tapToRadarPressed);

  return v2;
}

- (void)presentPrivacyView
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BE85270]);
  objc_msgSend(v3, "setModalPresentationStyle:", 2);
  -[SPUINavigationController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

- (void)tapToRadarPressed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  +[SPUISearchModel sharedGeneralInstance](SPUISearchModel, "sharedGeneralInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SPUINavigationController searchViewController](self, "searchViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rankingDebugLog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPUITapToRadarView openTapToRadarWithQuery:sections:rankingDebugLog:](SPUITapToRadarView, "openTapToRadarWithQuery:sections:rankingDebugLog:", v4, v5, v6);

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setIdentifier:", *MEMORY[0x24BE84AA0]);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84F50]), "initWithResult:triggerEvent:destination:", v7, 2, 0);
  +[SPUIFeedbackManager feedbackListener](SPUIFeedbackManager, "feedbackListener");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didEngageResult:", v8);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SPUINavigationController;
  -[SPUINavigationController willTransitionToTraitCollection:withTransitionCoordinator:](&v6, sel_willTransitionToTraitCollection_withTransitionCoordinator_, a3, a4);
  -[SPUINavigationController topViewController](self, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUINavigationController updateBackgroundColorWithViewControllerToBeShown:](self, "updateBackgroundColorWithViewControllerToBeShown:", v5);

}

- (double)contentHeight
{
  return self->_contentHeight;
}

- (SPUINavigationControllerDelegate)sizingDelegate
{
  return (SPUINavigationControllerDelegate *)objc_loadWeakRetained((id *)&self->_sizingDelegate);
}

- (void)setSizingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sizingDelegate, a3);
}

- (SPUIUnifiedFieldNavigationDelegate)unifiedFieldDelegate
{
  return (SPUIUnifiedFieldNavigationDelegate *)objc_loadWeakRetained((id *)&self->_unifiedFieldDelegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitioningBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_searchViewController, 0);
  objc_destroyWeak((id *)&self->_unifiedFieldDelegate);
  objc_destroyWeak((id *)&self->_sizingDelegate);
}

- (void)generateFooterViewForProactive:(os_log_t)log cache:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22E078000, log, OS_LOG_TYPE_DEBUG, "No footer generated: no valid footer generator found!", v1, 2u);
}

@end
