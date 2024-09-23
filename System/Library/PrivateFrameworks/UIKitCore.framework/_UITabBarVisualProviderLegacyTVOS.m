@implementation _UITabBarVisualProviderLegacyTVOS

- (void)prepare
{
  double v3;
  double v4;
  double v5;
  double v6;
  _UIBarBackground *v7;
  _UIBarBackground *backgroundView;
  _UIBarBackgroundLayoutLegacy *v9;
  _UIBarBackgroundLayoutLegacy *backgroundViewLayout;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UITabBarVisualProviderLegacyTVOS;
  -[_UITabBarVisualProvider prepare](&v11, sel_prepare);
  -[UIView bounds](self->super._tabBar, "bounds");
  v7 = -[_UIBarBackground initWithFrame:]([_UIBarBackground alloc], "initWithFrame:", v3, v4, v5, v6);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v7;

  -[_UIBarBackground setTopAligned:](self->_backgroundView, "setTopAligned:", 0);
  v9 = objc_alloc_init(_UIBarBackgroundLayoutLegacy);
  backgroundViewLayout = self->_backgroundViewLayout;
  self->_backgroundViewLayout = v9;

  -[_UIBarBackground setLayout:](self->_backgroundView, "setLayout:", self->_backgroundViewLayout);
  -[UITabBar _setVibrantLabels:](self->super._tabBar, "_setVibrantLabels:", 1);
}

- (void)teardown
{
  _UIBarBackground *backgroundView;
  UIView *accessoryView;
  UIScrollView *itemsScrollView;
  UIView *focusedItemHighlightView;
  UIMotionEffect *focusedItemHighlightMotionEffect;
  objc_super v8;

  -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  -[UIView removeFromSuperview](self->_accessoryView, "removeFromSuperview");
  accessoryView = self->_accessoryView;
  self->_accessoryView = 0;

  -[UIScrollView removeFromSuperview](self->_itemsScrollView, "removeFromSuperview");
  itemsScrollView = self->_itemsScrollView;
  self->_itemsScrollView = 0;

  -[UIView removeFromSuperview](self->_focusedItemHighlightView, "removeFromSuperview");
  focusedItemHighlightView = self->_focusedItemHighlightView;
  self->_focusedItemHighlightView = 0;

  focusedItemHighlightMotionEffect = self->_focusedItemHighlightMotionEffect;
  self->_focusedItemHighlightMotionEffect = 0;

  v8.receiver = self;
  v8.super_class = (Class)_UITabBarVisualProviderLegacyTVOS;
  -[_UITabBarVisualProvider teardown](&v8, sel_teardown);
}

- (void)changeItemsTo:(id)a3 removingItems:(id)a4 selectedItem:(id)a5 oldSelectedItem:(id)a6 animate:(BOOL)a7
{
  id v10;
  int64_t v11;
  int64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  id v34;
  _BOOL4 v35;
  _UITabBarVisualProviderLegacyTVOS *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _UITabBarVisualProviderLegacyTVOS *v46;
  id v47;
  BOOL v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v35 = a7;
  v55 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v34 = a4;
  v37 = a5;
  v11 = -[UITabBar _barMetrics](self->super._tabBar, "_barMetrics");
  v12 = -[UITabBar _imageStyle](self->super._tabBar, "_imageStyle");
  v36 = self;
  -[_UITabBarVisualProviderLegacyTVOS _parentViewForItems](self, "_parentViewForItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v50 != v17)
          objc_enumerationMutation(v14);
        v19 = *(id *)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v19, "_setBarMetrics:", v11, v34);
        objc_msgSend(v19, "_setImageStyle:", v12);
        -[UITabBarItem _tabBarButton]((id *)v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20 && (objc_msgSend(v13, "containsView:", v20) & 1) != 0)
        {
          v21 = v20;
        }
        else
        {
          objc_msgSend(v20, "removeFromSuperview");
          -[_UITabBarVisualProviderLegacyTVOS createViewForTabBarItem:](v36, "createViewForTabBarItem:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "addSubview:", v21);
          -[UITabBarItem _setTabBarButton:]((uint64_t)v19, v21);
          if (v35)
            objc_msgSend(v21, "setAlpha:", 0.0);
        }
        -[UITabBarItem _tabBarButton]((id *)v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_showSelectedIndicator:changeSelection:", v19 == v37, 1);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v16);
  }
  v23 = v14;

  if (v35)
  {
    -[_UITabBarVisualProvider defaultAnimationDuration](v36, "defaultAnimationDuration");
    v25 = v24;
    v26 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __102___UITabBarVisualProviderLegacyTVOS_changeItemsTo_removingItems_selectedItem_oldSelectedItem_animate___block_invoke;
    v44[3] = &unk_1E16B4030;
    v27 = v34;
    v45 = v34;
    v46 = v36;
    v48 = v35;
    v47 = v14;
    v42[0] = v26;
    v42[1] = 3221225472;
    v42[2] = __102___UITabBarVisualProviderLegacyTVOS_changeItemsTo_removingItems_selectedItem_oldSelectedItem_animate___block_invoke_2;
    v42[3] = &unk_1E16B3FD8;
    v43 = v45;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v44, v42, v25);

  }
  else
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v27 = v34;
    v28 = v34;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v39 != v31)
            objc_enumerationMutation(v28);
          -[UITabBarItem _tabBarButton](*(id **)(*((_QWORD *)&v38 + 1) + 8 * j));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "removeFromSuperview");

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
      }
      while (v30);
    }

    -[UIView setNeedsLayout](v36->super._tabBar, "setNeedsLayout");
  }

}

- (void)_applyAppearanceCustomizationsToItem:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (id *)a3;
  -[UITabBarItem _tabBarButton](v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UITabBar selectionIndicatorImage](self->super._tabBar, "selectionIndicatorImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setCustomSelectedIndicatorImage:", v5);

  objc_msgSend(v4, "_tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setTintColor:", v6);
}

- (id)exchangeItem:(id)a3 withItem:(id)a4
{
  id *v6;
  UITabBar *tabBar;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = (id *)a4;
  tabBar = self->super._tabBar;
  v8 = a3;
  -[UITabBar items](tabBar, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexOfObject:", v8);

  v11 = objc_msgSend(v9, "indexOfObject:", v6);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL || v10 == v11)
  {
    v13 = v9;
  }
  else
  {
    v14 = v11;
    v15 = (void *)objc_msgSend(v9, "mutableCopy");
    v16 = v15;
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v15, "replaceObjectAtIndex:withObject:", v10, v6);
      -[UITabBarItem _tabBarButton](v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        objc_msgSend(v6, "_setImageStyle:", -[UITabBar _imageStyle](self->super._tabBar, "_imageStyle"));
        objc_msgSend(v6, "_setBarMetrics:", -[UITabBar _barMetrics](self->super._tabBar, "_barMetrics"));
        -[_UITabBarVisualProviderLegacyTVOS createViewForTabBarItem:](self, "createViewForTabBarItem:", v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITabBarItem _setTabBarButton:]((uint64_t)v6, v18);

      }
      -[UITabBarItem _tabBarButton](v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAlpha:", 1.0);

      -[_UITabBarVisualProviderLegacyTVOS _parentViewForItems](self, "_parentViewForItems");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITabBarItem _tabBarButton](v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addSubview:", v21);

      -[_UITabBarVisualProviderLegacyTVOS _applyAppearanceCustomizationsToItem:](self, "_applyAppearanceCustomizationsToItem:", v6);
    }
    else
    {
      objc_msgSend(v15, "exchangeObjectAtIndex:withObjectAtIndex:", v10, v14);
    }
    v13 = (id)objc_msgSend(v16, "copy");

  }
  return v13;
}

- (void)changeSelectedItem:(id)a3 fromItem:(id)a4
{
  id *v5;
  void *v6;
  id v7;

  v5 = (id *)a3;
  -[UITabBarItem _tabBarButton]((id *)a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_showSelectedIndicator:changeSelection:", 0, 1);

  -[UITabBarItem _tabBarButton](v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_showSelectedIndicator:changeSelection:", 1, 1);
}

- (void)changeLayout
{
  -[UIView setNeedsLayout](self->super._tabBar, "setNeedsLayout");
}

- (id)createViewForTabBarItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  UITabBarButton *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  UITabBarButton *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;

  v5 = a3;
  if (!objc_msgSend(v5, "_imageStyle"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITabBarVisualProviderLegacyTVOS.m"), 177, CFSTR("A default style should never be returned at this point"));

  }
  -[UITabBar _appearanceStorage](self->super._tabBar, "_appearanceStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedImageTintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isSystemItem") & 1) != 0)
    objc_msgSend(v5, "_internalTitle");
  else
    objc_msgSend(v5, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [UITabBarButton alloc];
  objc_msgSend(v5, "unselectedImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_internalLandscapeTemplateImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_internalLandscapeSelectedImagePhone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageInsets");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(v5, "landscapeImagePhoneInsets");
  v26 = -[UITabBarButton initWithImage:landscapeImage:selectedImage:landscapeSelectedImage:label:withInsets:landscapeInsets:tabBar:](v9, "initWithImage:landscapeImage:selectedImage:landscapeSelectedImage:label:withInsets:landscapeInsets:tabBar:", v10, v11, v12, v13, v8, self->super._tabBar, v15, v17, v19, v21, v22, v23, v24, v25);

  objc_msgSend(v5, "badgeOffset");
  -[UITabBarButton _setBadgeOffset:](v26, "_setBadgeOffset:");
  if (objc_msgSend(v5, "isSpringLoaded"))
    -[UITabBarButton setSpringLoaded:](v26, "setSpringLoaded:", 1);

  -[UITabBarButton _setAppearanceGuideClass:](v26, "_setAppearanceGuideClass:", objc_opt_class());
  -[UIView frame](v26, "frame");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  -[UIView bounds](self->super._tabBar, "bounds");
  -[UIView setFrame:](v26, "setFrame:", v28, v30, v32);
  objc_msgSend(v5, "_appearanceStorage");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(v5, &_UIAppearanceCustomizedSelectorsAssociationKey);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBarButton _applyTabBarButtonAppearanceStorage:withTaggedSelectors:](v26, "_applyTabBarButtonAppearanceStorage:withTaggedSelectors:", v33, v34);

  -[UITabBar _appearanceStorage](self->super._tabBar, "_appearanceStorage");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "selectionIndicatorImage");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
    -[UITabBarButton _setCustomSelectedIndicatorImage:](v26, "_setCustomSelectedIndicatorImage:", v36);
  -[UIControl addTarget:action:forControlEvents:](v26, "addTarget:action:forControlEvents:", self->super._tabBar, sel__buttonDown_, 1);
  -[UIControl addTarget:action:forControlEvents:](v26, "addTarget:action:forControlEvents:", self->super._tabBar, sel__buttonUp_, 64);
  -[UIControl addTarget:action:forControlEvents:](v26, "addTarget:action:forControlEvents:", self->super._tabBar, sel__buttonCancel_, 256);
  -[UIControl addTarget:action:forControlEvents:](v26, "addTarget:action:forControlEvents:", self->super._tabBar, sel__sendAction_withEvent_, 0x40000000);
  -[UITabBarButton setEnabled:](v26, "setEnabled:", objc_msgSend(v5, "isEnabled"));
  -[UITabBarButton _setShowsHighlightedState:](v26, "_setShowsHighlightedState:", -[UITabBar _showsHighlightedState](self->super._tabBar, "_showsHighlightedState"));
  objc_msgSend(v5, "badgeValue");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
    -[UITabBarButton _setBadgeValue:](v26, "_setBadgeValue:", v37);
  -[UITabBarButton setSemanticContentAttribute:](v26, "setSemanticContentAttribute:", -[UIView semanticContentAttribute](self->super._tabBar, "semanticContentAttribute"));

  return v26;
}

- (void)updateArchivedSubviews:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UITabBar items](self->super._tabBar, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id **)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[UITabBarItem _tabBarButton](v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          -[UITabBarItem _tabBarButton](v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "removeObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  if (self->_backgroundView)
    objc_msgSend(v4, "removeObject:");
  if (self->_accessoryView)
    objc_msgSend(v4, "removeObject:");
  if (self->_itemsScrollView)
    objc_msgSend(v4, "removeObject:");
  if (self->_focusedItemHighlightView)
    objc_msgSend(v4, "removeObject:");

}

- (CGSize)intrinsicContentSizeGivenSize:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  unint64_t v7;
  NSObject *v8;
  UITabBar *v9;
  NSObject *v10;
  UITabBar *tabBar;
  int v12;
  UITabBar *v13;
  uint64_t v14;
  CGSize result;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[UITabBar _barMetrics](self->super._tabBar, "_barMetrics", a3.width, a3.height) == 3)
  {
    v4 = 140.0;
  }
  else if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      tabBar = self->super._tabBar;
      v12 = 138412290;
      v13 = tabBar;
      _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "_tabBar._barMetrics unexpectedly not _UITabBarMetricsTV in _UITabBarVisualProviderLegacyTVOS. _tabBar = %@", (uint8_t *)&v12, 0xCu);
    }

    v4 = -1.0;
  }
  else
  {
    v7 = intrinsicContentSizeGivenSize____s_category;
    if (!intrinsicContentSizeGivenSize____s_category)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&intrinsicContentSizeGivenSize____s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    v4 = -1.0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = self->super._tabBar;
      v12 = 138412290;
      v13 = v9;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "_tabBar._barMetrics unexpectedly not _UITabBarMetricsTV in _UITabBarVisualProviderLegacyTVOS. _tabBar = %@", (uint8_t *)&v12, 0xCu);
    }
  }
  v5 = -1.0;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGRect)_layoutRegion
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *accessoryView;
  double v12;
  UITabBar *tabBar;
  double v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  -[UIView bounds](self->super._tabBar, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  accessoryView = self->_accessoryView;
  if (accessoryView)
  {
    -[UIView frame](accessoryView, "frame");
    v8 = v8 - v12;
    tabBar = self->super._tabBar;
    v14 = -0.0;
    if ((*((_DWORD *)&tabBar->super._viewFlags + 4) & 0x80000) != 0)
      v14 = v12;
    v4 = v4 + v14;
  }
  else
  {
    tabBar = self->super._tabBar;
  }
  -[UIView traitCollection](tabBar, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  if (v16 != 3)
  {
    -[UIView safeAreaInsets](self->super._tabBar, "safeAreaInsets");
    v18 = v17;
    if (v17 != 0.0)
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "userInterfaceIdiom");

      if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v18 = _UIBackgroundExtensionForBar(self->super._tabBar);
    }
    v10 = v10 - v18;
  }
  v21 = v4;
  v22 = v6;
  v23 = v8;
  v24 = v10;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)_shadowFrameForBounds:(CGRect)a3 height:(double)a4
{
  CGFloat width;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  width = a3.size.width;
  x = a3.origin.x;
  v7 = CGRectGetMinY(a3) - a4;
  v8 = x;
  v9 = width;
  v10 = a4;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v7;
  result.origin.x = v8;
  return result;
}

- (void)_updateAccessoryView
{
  UIView *accessoryView;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double MaxX;
  double MinY;
  CGRect v16;
  CGRect v17;

  accessoryView = self->_accessoryView;
  if (accessoryView)
  {
    -[UIView frame](accessoryView, "frame");
    v5 = v4;
    -[_UITabBarVisualProviderLegacyTVOS _layoutRegion](self, "_layoutRegion");
    v10 = v6;
    v11 = v7;
    v12 = v8;
    v13 = v9;
    MaxX = 0.0;
    if ((*((_DWORD *)&self->super._tabBar->super._viewFlags + 4) & 0x80000) == 0)
      MaxX = CGRectGetMaxX(*(CGRect *)&v6);
    v16.origin.x = v10;
    v16.origin.y = v11;
    v16.size.width = v12;
    v16.size.height = v13;
    MinY = CGRectGetMinY(v16);
    v17.origin.x = v10;
    v17.origin.y = v11;
    v17.size.width = v12;
    v17.size.height = v13;
    -[UIView setFrame:](self->_accessoryView, "setFrame:", MaxX, MinY, v5, CGRectGetHeight(v17));
  }
}

- (id)_parentViewForItems
{
  void *tabBar;

  if (!-[UITabBar _scrollsItems](self->super._tabBar, "_scrollsItems") || (tabBar = self->_itemsScrollView) == 0)
    tabBar = self->super._tabBar;
  return tabBar;
}

- (void)_configureItems:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[UITabBar _barMetrics](self->super._tabBar, "_barMetrics");
  v6 = -[UITabBar _imageStyle](self->super._tabBar, "_imageStyle");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "_barMetrics", (_QWORD)v14) != v5 || objc_msgSend(v12, "_imageStyle") != v6)
        {
          objc_msgSend(v12, "_setBarMetrics:", v5);
          objc_msgSend(v12, "_setImageStyle:", v6);
          objc_msgSend(v12, "_updateViewAndPositionItems:", 0);
        }
        -[UITabBarItem _tabBarButton]((id *)v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setSemanticContentAttribute:", -[UIView semanticContentAttribute](self->super._tabBar, "semanticContentAttribute"));

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)_layoutTabBarItems
{
  void *v3;
  _BOOL4 v4;
  UIScrollView *itemsScrollView;
  UIScrollView *v6;
  UIScrollView *v7;
  UIScrollView *v8;
  UIScrollView *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id *v13;
  void *v14;
  UITabBar *v15;
  _BOOL4 v16;
  UIScrollView *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  id *v23;
  void *v24;
  UIScrollView *v25;
  _BOOL4 v26;
  UITabBar *tabBar;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  UITabBarItemPositioning v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  _BOOL4 v45;
  uint64_t v46;
  _BOOL4 v47;
  int v48;
  double v49;
  double v50;
  double v51;
  _BOOL4 v52;
  BOOL v53;
  uint64_t v54;
  BOOL v56;
  double v57;
  double v58;
  float v59;
  unint64_t v60;
  void *v61;
  void *v62;
  _QWORD v63[7];
  __int128 v64;
  uint64_t v65;
  double v66;
  double v67;
  BOOL v68;
  BOOL v69;
  BOOL v70;
  _QWORD v71[3];
  float v72;
  _QWORD v73[3];
  int v74;
  uint64_t v75;
  double *v76;
  uint64_t v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  -[UITabBar items](self->super._tabBar, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
    goto LABEL_73;
  v4 = -[UITabBar _scrollsItems](self->super._tabBar, "_scrollsItems");
  itemsScrollView = self->_itemsScrollView;
  if (v4)
  {
    if (!itemsScrollView)
    {
      v6 = [UIScrollView alloc];
      -[UIView bounds](self->super._tabBar, "bounds");
      v7 = -[UIScrollView initWithFrame:](v6, "initWithFrame:");
      v8 = self->_itemsScrollView;
      self->_itemsScrollView = v7;

      -[UIView setAutoresizingMask:](self->_itemsScrollView, "setAutoresizingMask:", 18);
      -[UIScrollView setShowsHorizontalScrollIndicator:](self->_itemsScrollView, "setShowsHorizontalScrollIndicator:", 0);
      -[UIScrollView setShowsVerticalScrollIndicator:](self->_itemsScrollView, "setShowsVerticalScrollIndicator:", 0);
      -[UIView addSubview:](self->super._tabBar, "addSubview:", self->_itemsScrollView);
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v9 = v3;
      v10 = -[UIScrollView countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v83, v88, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v84;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v84 != v11)
              objc_enumerationMutation(v9);
            v13 = *(id **)(*((_QWORD *)&v83 + 1) + 8 * i);
            -[UITabBarItem _tabBarButton](v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "superview");
            v15 = (UITabBar *)objc_claimAutoreleasedReturnValue();
            v16 = v15 == self->super._tabBar;

            if (v16)
            {
              v17 = self->_itemsScrollView;
              -[UITabBarItem _tabBarButton](v13);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIView addSubview:](v17, "addSubview:", v18);

            }
          }
          v10 = -[UIScrollView countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v83, v88, 16);
        }
        while (v10);
      }
LABEL_25:

    }
  }
  else if (itemsScrollView)
  {
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v19 = v3;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v80;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v80 != v21)
            objc_enumerationMutation(v19);
          v23 = *(id **)(*((_QWORD *)&v79 + 1) + 8 * j);
          -[UITabBarItem _tabBarButton](v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "superview");
          v25 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
          v26 = v25 == self->_itemsScrollView;

          if (v26)
          {
            tabBar = self->super._tabBar;
            -[UITabBarItem _tabBarButton](v23);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIView addSubview:](tabBar, "addSubview:", v28);

          }
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
      }
      while (v20);
    }

    -[UIScrollView removeFromSuperview](self->_itemsScrollView, "removeFromSuperview");
    v9 = self->_itemsScrollView;
    self->_itemsScrollView = 0;
    goto LABEL_25;
  }
  -[_UITabBarVisualProviderLegacyTVOS _layoutRegion](self, "_layoutRegion");
  v30 = v29;
  v32 = v31;
  v34 = v33;
  -[UITabBar selectionIndicatorImage](self->super._tabBar, "selectionIndicatorImage");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v35;
  v36 = 0.0;
  if (v35 && (objc_msgSend(v35, "_isResizable") & 1) == 0)
  {
    objc_msgSend(v61, "size");
    v36 = v37;
  }
  -[UIView traitCollection](self->super._tabBar, "traitCollection", v61);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[UITabBar itemPositioning](self->super._tabBar, "itemPositioning");
  -[UITabBar itemWidth](self->super._tabBar, "itemWidth");
  v41 = v40;
  -[UITabBar itemSpacing](self->super._tabBar, "itemSpacing");
  v43 = v42;
  v44 = objc_msgSend(v3, "count");
  v45 = objc_msgSend(v38, "userInterfaceIdiom") == 3;
  v46 = objc_msgSend(v38, "horizontalSizeClass");
  v47 = 0;
  v48 = !v45;
  if (v46 != 2)
    v48 = 0;
  if (v39 == UITabBarItemPositioningAutomatic && v48 && v36 > 0.0)
  {
    v49 = v36 * (double)v44;
    v47 = v49 <= v32 && v49 > v32 - (double)(10 * v44);
  }
  if (v39 == UITabBarItemPositioningFill
    || v47
    || ((v48 ^ 1) & 1) != 0
    || v32 <= (double)(110 * v44 - 30)
    || objc_msgSend(v38, "userInterfaceIdiom") != 1)
  {
    if (v39 != UITabBarItemPositioningCentered)
    {
      v52 = 0;
      goto LABEL_51;
    }
    v50 = 80.0;
    if (v41 > 0.0)
      v50 = v41;
    v51 = 30.0;
    if (v43 > 0.0)
      v51 = v43;
    if (v50 * (double)v44 + v51 * (double)(v44 - 1) >= v32)
    {
      v52 = self->_itemsScrollView != 0;
      goto LABEL_51;
    }
  }
  v52 = 1;
LABEL_51:
  v53 = v41 > 0.0 && v52;
  v54 = objc_msgSend(v38, "userInterfaceIdiom");
  v56 = v41 <= 0.0 && v54 == 2;
  v75 = 0;
  v76 = (double *)&v75;
  v77 = 0x2020000000;
  v78 = 0;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  v74 = 0;
  if (!self->_accessoryView)
    v30 = 0.0;
  -[_UITabBarVisualProviderLegacyTVOS _configureItems:](self, "_configureItems:", v3);
  if (v47)
  {
    v76[3] = v36;
    v57 = round((v32 - v36 * (double)v44) / (double)v44);
    v30 = floor(v57 * 0.5) + v30;
  }
  else if (v52)
  {
    if (v41 <= 0.0)
      v58 = 80.0;
    else
      v58 = v41;
    v76[3] = v58;
    v57 = 30.0;
    if (v43 > 0.0)
      v57 = v43;
    v30 = round(v32 * 0.5 - (v58 * (double)v44 + v57 * (double)(v44 - 1)) * 0.5) + v30;
    v53 = v41 > 0.0;
  }
  else
  {
    v53 = 0;
    v76[3] = v32 / (double)v44;
    v57 = 0.0;
  }
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x2020000000;
  v59 = v30;
  v72 = v59;
  v60 = ((unint64_t)*((unsigned int *)&self->super._tabBar->super._viewFlags + 4) >> 18) & 2;
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __55___UITabBarVisualProviderLegacyTVOS__layoutTabBarItems__block_invoke;
  v63[3] = &unk_1E16E7B98;
  v68 = v56;
  v64 = xmmword_1866721B0;
  v63[4] = &v75;
  v63[5] = v71;
  v65 = v34;
  v66 = v57;
  v67 = v30;
  v63[6] = v73;
  v69 = v45;
  v70 = v53;
  objc_msgSend(v3, "enumerateObjectsWithOptions:usingBlock:", v60, v63);
  _Block_object_dispose(v71, 8);
  _Block_object_dispose(v73, 8);
  _Block_object_dispose(&v75, 8);

LABEL_73:
}

- (void)_updateBackground
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  UIBarStyle v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  char v23;
  void *v24;
  uint64_t v25;
  _UIBarBackgroundLayoutLegacy *backgroundViewLayout;
  _BOOL8 v27;
  uint64_t v28;
  void *v29;
  _UIBarBackgroundLayoutLegacy *v30;
  void *v31;
  char v32;
  uint64_t v33;
  void *v34;
  char v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  -[UITabBar _setBackgroundNeedsUpdate:](self->super._tabBar, "_setBackgroundNeedsUpdate:", 0);
  if (-[UIView _canDrawContent](self->super._tabBar, "_canDrawContent"))
  {
    -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
    return;
  }
  -[UIView insertSubview:atIndex:](self->super._tabBar, "insertSubview:atIndex:", self->_backgroundView, 0);
  -[_UIBarBackground setCustomBackgroundView:](self->_backgroundView, "setCustomBackgroundView:", self->_customBackgroundView);
  -[_UIBarBackgroundLayout setDisableTinting:](self->_backgroundViewLayout, "setDisableTinting:", -[UITabBar _disableBlurTinting](self->super._tabBar, "_disableBlurTinting"));
  -[UIView bounds](self->super._tabBar, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UITabBar delegate](self->super._tabBar, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    v10 = v10 + _UIBackgroundExtensionForBar(self->super._tabBar);
  if (!self->_customBackgroundView)
  {
    -[UIView traitCollection](self->super._tabBar, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBarBackgroundLayout setInterfaceIdiom:](self->_backgroundViewLayout, "setInterfaceIdiom:", objc_msgSend(v13, "userInterfaceIdiom"));

    -[UIView traitCollection](self->super._tabBar, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBarBackgroundLayout setInterfaceStyle:](self->_backgroundViewLayout, "setInterfaceStyle:", objc_msgSend(v14, "userInterfaceStyle"));

    v15 = -[UITabBar isTranslucent](self->super._tabBar, "isTranslucent");
    -[UITabBar _effectiveBarTintColor](self->super._tabBar, "_effectiveBarTintColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBar backgroundImage](self->super._tabBar, "backgroundImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[UITabBar barStyle](self->super._tabBar, "barStyle");
    -[UITabBar backgroundEffects](self->super._tabBar, "backgroundEffects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[_UIBarBackgroundLayoutLegacy configureWithEffects:](self->_backgroundViewLayout, "configureWithEffects:", v19);
    }
    else if (v17)
    {
      objc_msgSend(v17, "size");
      v21 = v20;
      if ((objc_msgSend(v17, "_isResizable") & 1) == 0)
      {
        objc_msgSend(v17, "stretchableImageWithLeftCapWidth:topCapHeight:", 0, (uint64_t)(v21 + -1.0));
        v22 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v22;
      }
      v35 = 0;
      v23 = objc_msgSend(v17, "_isInvisibleAndGetIsTranslucent:", &v35);
      if (v15)
      {
        -[_UIBarBackgroundLayoutLegacy configureImage:forceTranslucent:](self->_backgroundViewLayout, "configureImage:forceTranslucent:", v17, v35 == 0);
      }
      else
      {
        backgroundViewLayout = self->_backgroundViewLayout;
        v27 = v35 != 0;
        if (v16)
          -[_UIBarBackgroundLayoutLegacy configureImage:forceOpaque:backgroundTintColor:](backgroundViewLayout, "configureImage:forceOpaque:backgroundTintColor:", v17, v27, v16);
        else
          -[_UIBarBackgroundLayoutLegacy configureImage:forceOpaque:barStyle:](backgroundViewLayout, "configureImage:forceOpaque:barStyle:", v17, v27, v18);
      }
      if (v21 <= v10)
        v32 = 1;
      else
        v32 = v23;
      if ((v32 & 1) != 0)
      {
        -[UITabBar shadowImage](self->super._tabBar, "shadowImage");
        v33 = objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          v34 = (void *)v33;
          -[_UIBarBackgroundLayoutLegacy configureShadowImage:](self->_backgroundViewLayout, "configureShadowImage:", v33);

          goto LABEL_10;
        }
      }
      else
      {
        v6 = v10 - v21;
        v10 = v21;
      }
    }
    else
    {
      -[UIView _screen](self->super._tabBar, "_screen");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "_userInterfaceIdiom");

      if (v25 == 3)
      {
        -[_UIBarBackgroundLayoutLegacy configureAsTransparent](self->_backgroundViewLayout, "configureAsTransparent");
      }
      else
      {
        if (v18)
          v28 = 4009;
        else
          v28 = 5004;
        +[UIBlurEffect _effectWithStyle:tintColor:invertAutomaticStyle:](UIBlurEffect, "_effectWithStyle:tintColor:invertAutomaticStyle:", v28, v16, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = self->_backgroundViewLayout;
        v36[0] = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIBarBackgroundLayoutLegacy configureWithEffects:](v30, "configureWithEffects:", v31);

      }
      v17 = 0;
    }
    -[_UIBarBackgroundLayoutLegacy configureShadowForBarStyle:](self->_backgroundViewLayout, "configureShadowForBarStyle:", v18);
LABEL_10:

    goto LABEL_11;
  }
  -[_UIBarBackgroundLayoutLegacy configureWithoutShadow](self->_backgroundViewLayout, "configureWithoutShadow");
LABEL_11:
  -[UIView setFrame:](self->_backgroundView, "setFrame:", v4, v6, v8, v10);
  -[_UITabBarVisualProviderLegacyTVOS updateBackgroundGroupName](self, "updateBackgroundGroupName");
  -[_UIBarBackground transitionBackgroundViews](self->_backgroundView, "transitionBackgroundViews");
}

- (void)updateBackgroundGroupName
{
  void *v3;
  void *v4;
  id v5;

  -[UIView traitCollection](self->super._tabBar, "traitCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForTrait:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarBackground setGroupName:](self->_backgroundView, "setGroupName:", v4);

}

- (void)layoutSubviews
{
  -[_UITabBarVisualProviderLegacyTVOS _layoutTabBarItems](self, "_layoutTabBarItems");
  -[_UITabBarVisualProviderLegacyTVOS _updateAccessoryView](self, "_updateAccessoryView");
  -[_UITabBarVisualProviderLegacyTVOS _updateBackground](self, "_updateBackground");
}

- (void)traitCollectionDidChange:(id)a3
{
  UITabBar *tabBar;
  id v4;
  id v5;

  tabBar = self->super._tabBar;
  v4 = a3;
  -[UIView traitCollection](tabBar, "traitCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();

}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[UITabBar items](self->super._tabBar, "items", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        -[UITabBarItem _tabBarButton](*(id **)(*((_QWORD *)&v17 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setSemanticContentAttribute:", a3);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  -[UITabBar delegate](self->super._tabBar, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "_existingMoreNavigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSemanticContentAttribute:", a3);

    objc_msgSend(v12, "topViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSemanticContentAttribute:", a3);

    objc_msgSend(v12, "navigationBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSemanticContentAttribute:", a3);

  }
}

- (id)preferredFocusedView
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id *v7;

  -[UITabBar selectedItem](self->super._tabBar, "selectedItem");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v5 = *(id *)(v3 + 232);
  }
  else
  {
    -[UITabBar items](self->super._tabBar, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (id *)objc_claimAutoreleasedReturnValue();
    -[UITabBarItem _tabBarButton](v7);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)_updateHighlightMotionEffect
{
  void *v3;
  double v4;
  UIMotionEffect *focusedItemHighlightMotionEffect;
  void *v6;
  UIMotionEffect *v7;
  void *v8;
  id v9;
  CGRect v10;

  -[UIView _focusSystem](self->super._tabBar, "_focusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_focusedView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v4 = 0.0;
  if (-[_UITabBarVisualProviderLegacyTVOS _focusedItemHighlightViewIsVisible](self, "_focusedItemHighlightViewIsVisible")&& objc_msgSend(v9, "isDescendantOfView:", self->super._tabBar))
  {
    objc_msgSend(v9, "bounds");
    v4 = CGRectGetWidth(v10) * 0.25;
  }
  focusedItemHighlightMotionEffect = self->_focusedItemHighlightMotionEffect;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIMotionEffect setMinimumRelativeValue:](focusedItemHighlightMotionEffect, "setMinimumRelativeValue:", v6);

  v7 = self->_focusedItemHighlightMotionEffect;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIMotionEffect setMaximumRelativeValue:](v7, "setMaximumRelativeValue:", v8);

}

- (void)_updateFocusedItemHighlightFrame
{
  void *v3;
  UIView *focusedItemHighlightView;
  id v5;

  if (self->_focusedItemHighlightView)
  {
    -[UIView _focusSystem](self->super._tabBar, "_focusSystem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_focusedView");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "isDescendantOfView:", self->super._tabBar))
    {
      focusedItemHighlightView = self->_focusedItemHighlightView;
      objc_msgSend(v5, "center");
      -[UIView setCenter:](focusedItemHighlightView, "setCenter:");
    }

  }
}

- (void)_setFocusedItemHightlightVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = a3;
  if (a3)
  {
    if (!self->_focusedItemHighlightView)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __70___UITabBarVisualProviderLegacyTVOS__setFocusedItemHightlightVisible___block_invoke;
      v7[3] = &unk_1E16B1B28;
      v7[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v7);
    }
    -[UIView window](self->super._tabBar, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UIView traitCollection](self->super._tabBar, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v6, "userInterfaceStyle");

    }
  }
  else
  {
    v5 = 0;
  }
  -[_UITabBarVisualProviderLegacyTVOS _updateFocusedItemHighlightViewWithInterfaceStyle:visible:](self, "_updateFocusedItemHighlightViewWithInterfaceStyle:visible:", v5, v3);
  -[_UITabBarVisualProviderLegacyTVOS _updateHighlightMotionEffect](self, "_updateHighlightMotionEffect");
}

- (void)_updateFocusedItemHighlightViewWithInterfaceStyle:(int64_t)a3 visible:(BOOL)a4
{
  double v4;

  v4 = dbl_186684B00[a3 == 2];
  if (!a4)
    v4 = 0.0;
  -[UIView setAlpha:](self->_focusedItemHighlightView, "setAlpha:", v4);
}

- (BOOL)_focusedItemHighlightViewIsVisible
{
  double v2;

  -[UIView alpha](self->_focusedItemHighlightView, "alpha");
  return v2 > 0.0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  void *v5;
  void *v6;
  double v7;
  _QWORD *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];

  -[UIView _focusSystem](self->super._tabBar, "_focusSystem", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_focusedView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isDescendantOfView:", self->super._tabBar))
  {
    if (-[UITabBar _vibrantLabels](self->super._tabBar, "_vibrantLabels"))
      -[_UITabBarVisualProviderLegacyTVOS _layoutTabBarItems](self, "_layoutTabBarItems");
    if (-[UITabBar _focusedItemHighlightShouldBeVisible](self->super._tabBar, "_focusedItemHighlightShouldBeVisible")
      && !-[_UITabBarVisualProviderLegacyTVOS _focusedItemHighlightViewIsVisible](self, "_focusedItemHighlightViewIsVisible"))
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __86___UITabBarVisualProviderLegacyTVOS_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
      v11[3] = &unk_1E16B1B28;
      v11[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v11, 0.2);
    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __86___UITabBarVisualProviderLegacyTVOS_didUpdateFocusInContext_withAnimationCoordinator___block_invoke_2;
    v10[3] = &unk_1E16B1B28;
    v10[4] = self;
    v7 = 0.15;
    v8 = v10;
    goto LABEL_10;
  }
  if (self->_focusedItemHighlightView)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __86___UITabBarVisualProviderLegacyTVOS_didUpdateFocusInContext_withAnimationCoordinator___block_invoke_3;
    v9[3] = &unk_1E16B1B28;
    v9[4] = self;
    v7 = 0.2;
    v8 = v9;
LABEL_10:
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v8, v7);
  }

}

- (void)_shim_setCustomBackgroundView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_customBackgroundView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_customBackgroundView, a3);
    -[_UITabBarVisualProviderLegacyTVOS _updateBackground](self, "_updateBackground");
    v5 = v6;
  }

}

- (id)_shim_compatibilityBackgroundView
{
  _UIBarBackground *customBackgroundView;

  customBackgroundView = (_UIBarBackground *)self->_customBackgroundView;
  if (!customBackgroundView)
    customBackgroundView = self->_backgroundView;
  return customBackgroundView;
}

- (void)_shim_setAccessoryView:(id)a3
{
  UIView *v4;
  UIView *accessoryView;
  UIView *v6;

  v4 = (UIView *)a3;
  -[UIView removeFromSuperview](self->_accessoryView, "removeFromSuperview");
  accessoryView = self->_accessoryView;
  self->_accessoryView = v4;
  v6 = v4;

  -[UIView addSubview:](self->super._tabBar, "addSubview:", self->_accessoryView);
  -[UIView setNeedsLayout](self->super._tabBar, "setNeedsLayout");

}

- (id)_shim_accessoryView
{
  return self->_accessoryView;
}

- (double)_shim_shadowAlpha
{
  double result;

  -[_UIBarBackgroundLayout shadowAlpha](self->_backgroundViewLayout, "shadowAlpha");
  return result;
}

- (void)_shim_setShadowAlpha:(double)a3
{
  double v5;

  -[_UIBarBackgroundLayout shadowAlpha](self->_backgroundViewLayout, "shadowAlpha");
  if (v5 != a3)
  {
    -[_UIBarBackgroundLayout setShadowAlpha:](self->_backgroundViewLayout, "setShadowAlpha:", a3);
    -[_UIBarBackground transitionBackgroundViews](self->_backgroundView, "transitionBackgroundViews");
  }
}

- (BOOL)_shim_shadowHidden
{
  return -[_UIBarBackgroundLayout shadowHidden](self->_backgroundViewLayout, "shadowHidden");
}

- (void)_shim_setShadowHidden:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[_UIBarBackgroundLayout shadowHidden](self->_backgroundViewLayout, "shadowHidden") != a3)
  {
    -[_UIBarBackgroundLayout setShadowHidden:](self->_backgroundViewLayout, "setShadowHidden:", v3);
    -[_UIBarBackground transitionBackgroundViews](self->_backgroundView, "transitionBackgroundViews");
  }
}

- (void)_shim_updateFocusHighlightVisibility
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  int v9;
  _QWORD v10[5];
  BOOL v11;
  _QWORD v12[5];
  BOOL v13;

  v3 = -[UITabBar _focusedItemHighlightShouldBeVisible](self->super._tabBar, "_focusedItemHighlightShouldBeVisible");
  v4 = v3;
  if (!self->_focusedItemHighlightView)
  {
    if (!v3)
      return;
    goto LABEL_8;
  }
  v5 = -[_UITabBarVisualProviderLegacyTVOS _focusedItemHighlightViewIsVisible](self, "_focusedItemHighlightViewIsVisible");
  v6 = v5;
  if (!v4 && v5)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __73___UITabBarVisualProviderLegacyTVOS__shim_updateFocusHighlightVisibility__block_invoke;
    v12[3] = &unk_1E16B1B78;
    v12[4] = self;
    v13 = v4;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v12, 0.2);
  }
  if (v4 && !v6)
  {
LABEL_8:
    -[UIView _focusSystem](self->super._tabBar, "_focusSystem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_focusedView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isDescendantOfView:", self->super._tabBar);

    if (v9)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __73___UITabBarVisualProviderLegacyTVOS__shim_updateFocusHighlightVisibility__block_invoke_2;
      v10[3] = &unk_1E16B1B78;
      v10[4] = self;
      v11 = v4;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v10, 0.2);
    }
  }
}

- (void)_shim_updateTabBarItemView:(id)a3
{
  id *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (id *)a3;
  -[UITabBarItem _tabBarButton](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFocused");

  if (v6)
    -[UIView setNeedsFocusUpdate](self->super._tabBar, "setNeedsFocusUpdate");
  -[UITabBarItem _tabBarButton](v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  -[_UITabBarVisualProviderLegacyTVOS createViewForTabBarItem:](self, "createViewForTabBarItem:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBarItem _setTabBarButton:]((uint64_t)v4, v8);

  -[_UITabBarVisualProviderLegacyTVOS _parentViewForItems](self, "_parentViewForItems");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[UITabBarItem _tabBarButton](v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addSubview:", v9);
}

- (id)_focusedItemHighlightView
{
  return self->_focusedItemHighlightView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedItemHighlightMotionEffect, 0);
  objc_storeStrong((id *)&self->_focusedItemHighlightView, 0);
  objc_storeStrong((id *)&self->_itemsScrollView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_customBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundViewLayout, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
