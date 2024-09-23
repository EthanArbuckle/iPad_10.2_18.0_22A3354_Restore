@implementation SBHWidgetSearchController

- (SBHWidgetSearchController)initWithAddWidgetSheetStyle:(unint64_t)a3 placeholderText:(id)a4
{
  id v6;
  SBHWidgetSearchController *v7;
  SBHWidgetSearchController *v8;
  uint64_t v9;
  NSMapTable *scrollProgressByClient;
  void *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBHWidgetSearchController;
  v7 = -[SBHWidgetSearchController initWithSearchResultsController:](&v13, sel_initWithSearchResultsController_, 0);
  v8 = v7;
  if (v7)
  {
    v7->_addWidgetSheetStyle = a3;
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    scrollProgressByClient = v8->_scrollProgressByClient;
    v8->_scrollProgressByClient = (NSMapTable *)v9;

    v8->_shouldInsetContentForGrabber = 1;
    -[SBHWidgetSearchController _setupTextFieldMetrics](v8, "_setupTextFieldMetrics");
    -[SBHWidgetSearchController _setupSearchBar](v8, "_setupSearchBar");
    -[SBHWidgetSearchController _setupTextFieldWithPlaceholderText:](v8, "_setupTextFieldWithPlaceholderText:", v6);
    -[SBHWidgetSearchController _setupTextFieldBackground](v8, "_setupTextFieldBackground");
    -[SBHWidgetSearchController _setupBarBackground](v8, "_setupBarBackground");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v8, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)SBHWidgetSearchController;
  -[SBHWidgetSearchController dealloc](&v4, sel_dealloc);
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  uint64_t v4;

  -[SBHWidgetSearchController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (-[SBHWidgetSearchController addWidgetSheetStyle](self, "addWidgetSheetStyle") == 1 || v4 == 1)
    return 30;
  else
    return 2;
}

- (void)setAlwaysShowBarBackground:(BOOL)a3
{
  UIView *searchBarBackgroundView;
  uint64_t v4;
  UIView *v5;
  UIView *v6;
  UIView *v7;
  id v8;

  if (self->_alwaysShowBarBackground != a3)
  {
    self->_alwaysShowBarBackground = a3;
    if (a3)
    {
      searchBarBackgroundView = self->_searchBarBackgroundView;
      v4 = objc_opt_class();
      v5 = searchBarBackgroundView;
      if (v4)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v6 = v5;
        else
          v6 = 0;
      }
      else
      {
        v6 = 0;
      }
      v7 = v6;

      -[UIView topItem](v7, "topItem");
      v8 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "_setManualScrollEdgeAppearanceProgress:", 1.0);
    }
  }
}

- (void)setShouldInsetContentForGrabber:(BOOL)a3
{
  double v4;
  id v5;

  if (self->_shouldInsetContentForGrabber != a3)
  {
    self->_shouldInsetContentForGrabber = a3;
    -[SBHWidgetSearchController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    -[SBHWidgetSearchController updateSearchBarContentInsetsWithWidth:](self, "updateSearchBarContentInsetsWithWidth:", v4);

  }
}

- (void)setApplicationCellIncludesGalleryListView:(BOOL)a3
{
  double v4;
  id v5;

  if (self->_applicationCellIncludesGalleryListView != a3)
  {
    self->_applicationCellIncludesGalleryListView = a3;
    -[SBHWidgetSearchController _setupTextFieldMetrics](self, "_setupTextFieldMetrics");
    -[SBHWidgetSearchController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    -[SBHWidgetSearchController updateSearchBarContentInsetsWithWidth:](self, "updateSearchBarContentInsetsWithWidth:", v4);

  }
}

- (void)setWidthDefiningGridSizeClass:(id)a3
{
  NSString *v4;
  NSString *widthDefiningGridSizeClass;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  double v10;
  NSString *v11;

  v4 = (NSString *)a3;
  widthDefiningGridSizeClass = self->_widthDefiningGridSizeClass;
  if (widthDefiningGridSizeClass != v4)
  {
    v11 = v4;
    v6 = -[NSString isEqualToString:](widthDefiningGridSizeClass, "isEqualToString:", v4);
    v4 = v11;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v11, "copy");
      v8 = self->_widthDefiningGridSizeClass;
      self->_widthDefiningGridSizeClass = v7;

      -[SBHWidgetSearchController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      -[SBHWidgetSearchController updateSearchBarContentInsetsWithWidth:](self, "updateSearchBarContentInsetsWithWidth:", v10);

      v4 = v11;
    }
  }

}

- (void)_setupTextFieldMetrics
{
  unint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = -[SBHWidgetSearchController addWidgetSheetStyle](self, "addWidgetSheetStyle");
  v4 = 6.0;
  if (v3 == 1)
  {
    v4 = 0.0;
    v5 = 21.0;
  }
  else
  {
    v5 = 26.3333333;
  }
  v6 = 16.0;
  if (!self->_applicationCellIncludesGalleryListView)
    v6 = 8.0;
  v7 = v4 + v6;
  -[SBHWidgetSearchController setTextFieldExtraHeight:](self, "setTextFieldExtraHeight:");
  -[SBHWidgetSearchController setTextFieldToWidgetsSpacing:](self, "setTextFieldToWidgetsSpacing:", v5);
  -[SBHWidgetSearchController setTextFieldToBarBackgroundBottomSpacing:](self, "setTextFieldToBarBackgroundBottomSpacing:", v7);
}

- (void)_setupSearchBar
{
  id *v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  double v6;
  void *v7;
  id v8;

  -[SBHWidgetSearchController searchBar](self, "searchBar");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDrawsBackground:", 0);
  objc_msgSend(v8, "setCenterPlaceholder:", 1);
  objc_msgSend(v8, "_setDisableDictationButton:", 1);
  v2 = (id *)MEMORY[0x1E0DC4730];
  v3 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
  v4 = 10.0;
  if (v3 == 1)
    v4 = 0.0;
  objc_msgSend(v8, "setPositionAdjustment:forSearchBarIcon:", 0, v4, 0.0);
  v5 = objc_msgSend(*v2, "userInterfaceLayoutDirection");
  v6 = -10.0;
  if (v5 == 1)
    v6 = 0.0;
  objc_msgSend(v8, "setPositionAdjustment:forSearchBarIcon:", 1, v6, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v7);

}

- (void)_setupTextFieldWithPlaceholderText:(id)a3
{
  id v4;
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
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBHWidgetSearchController searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetSearchController _textFieldFont](self, "_textFieldFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setBackgroundFillColor:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v9);

  objc_msgSend(v6, "leftView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTintColor:", v11);

  v12 = objc_alloc(MEMORY[0x1E0CB3498]);
  v18 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithString:attributes:", v4, v14);

  objc_msgSend(v6, "setAttributedPlaceholder:", v15);
  SBHSearchIconImageSymbolConfiguration();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("xmark.circle.fill"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:forSearchBarIcon:state:", v17, 1, 0);
  if (_setupTextFieldWithPlaceholderText__onceToken != -1)
    dispatch_once(&_setupTextFieldWithPlaceholderText__onceToken, &__block_literal_global_77);

}

void __64__SBHWidgetSearchController__setupTextFieldWithPlaceholderText___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0DC3518];
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "appearanceWhenContainedInInstancesOfClasses:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v3);

}

- (void)_setupTextFieldBackground
{
  void *v3;
  SBHWidgetSearchBarBackgroundView *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIView *searchBarTextFieldBackgroundView;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  -[SBHWidgetSearchController searchBar](self, "searchBar");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "searchTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBHWidgetSearchBarBackgroundView initWithAddWidgetSheetStyle:]([SBHWidgetSearchBarBackgroundView alloc], "initWithAddWidgetSheetStyle:", -[SBHWidgetSearchController addWidgetSheetStyle](self, "addWidgetSheetStyle"));
  -[SBHWidgetSearchBarBackgroundView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v22, "insertSubview:atIndex:", v4, 0);
  -[SBHWidgetSearchController textFieldExtraHeight](self, "textFieldExtraHeight");
  v6 = v5;
  v16 = (void *)MEMORY[0x1E0CB3718];
  -[SBHWidgetSearchBarBackgroundView leadingAnchor](v4, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  -[SBHWidgetSearchBarBackgroundView trailingAnchor](v4, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v15;
  -[SBHWidgetSearchBarBackgroundView topAnchor](v4, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, -v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v9;
  -[SBHWidgetSearchBarBackgroundView bottomAnchor](v4, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateConstraints:", v13);

  searchBarTextFieldBackgroundView = self->_searchBarTextFieldBackgroundView;
  self->_searchBarTextFieldBackgroundView = &v4->super;

}

- (void)_setupBarBackground
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  UIView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SBHWidgetSearchController *v18;
  void *v19;
  void *v20;
  UIView *searchBarBackgroundView;
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
  _QWORD v32[4];
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  -[SBHWidgetSearchController searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0DC3A28]);
  v5 = objc_alloc_init(MEMORY[0x1E0DC3A48]);
  v34[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setItems:", v6);

  objc_msgSend(v5, "_setManualScrollEdgeAppearanceEnabled:", 1);
  if (self->_alwaysShowBarBackground)
    objc_msgSend(v5, "_setManualScrollEdgeAppearanceProgress:", 1.0);
  v31 = v5;
  v7 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    objc_msgSend(v7, "configureWithOpaqueBackground");
  }
  else
  {
    objc_msgSend(v7, "configureWithDefaultBackground");
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithBlurRadius:", 16.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundEffects:", v9);

  }
  objc_msgSend(v4, "setStandardAppearance:", v7);
  v10 = (UIView *)v4;
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "insertSubview:atIndex:", v10, 0);
  objc_msgSend(v3, "setAutoresizingMask:", 34);
  v22 = (void *)MEMORY[0x1E0CB3718];
  -[UIView topAnchor](v10, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v28;
  -[UIView leadingAnchor](v10, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v23;
  -[UIView trailingAnchor](v10, "trailingAnchor");
  v11 = v3;
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v11;
  objc_msgSend(v11, "trailingAnchor");
  v27 = v7;
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v14;
  -[UIView bottomAnchor](v10, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "searchTextField");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetSearchController textFieldToBarBackgroundBottomSpacing](self, "textFieldToBarBackgroundBottomSpacing");
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17);
  v18 = self;
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v20);

  searchBarBackgroundView = v18->_searchBarBackgroundView;
  v18->_searchBarBackgroundView = v10;

}

- (void)updateSearchBarBackgroundForScrollDistance:(double)a3 forClient:(id)a4
{
  id v6;
  NSMapTable *scrollProgressByClient;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  double v14;
  UIView *searchBarBackgroundView;
  uint64_t v16;
  UIView *v17;
  UIView *v18;
  UIView *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!self->_alwaysShowBarBackground)
  {
    scrollProgressByClient = self->_scrollProgressByClient;
    if (a3 == 2.22507386e-308)
    {
      -[NSMapTable removeObjectForKey:](self->_scrollProgressByClient, "removeObjectForKey:", v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](scrollProgressByClient, "setObject:forKey:", v8, v6);

    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[NSMapTable objectEnumerator](self->_scrollProgressByClient, "objectEnumerator", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "doubleValue");
          if (a3 < v14)
            a3 = v14;
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    searchBarBackgroundView = self->_searchBarBackgroundView;
    v16 = objc_opt_class();
    v17 = searchBarBackgroundView;
    if (v16)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
    }
    else
    {
      v18 = 0;
    }
    v19 = v18;

    -[UIView topItem](v19, "topItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "_setManualScrollEdgeAppearanceProgress:", fmin(fmax(a3 * 0.0625, 0.0), 1.0));
  }

}

- (void)updateSearchBarContentInsetsWithWidth:(double)a3
{
  SBHDefaultIconListLayoutProvider *v5;
  void *v6;
  void *v7;
  NSString *widthDefiningGridSizeClass;
  double v9;
  SBIconListLayoutProvider *listLayoutProvider;
  void *v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  -[SBHWidgetSearchController searchBar](self, "searchBar");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(SBHDefaultIconListLayoutProvider);
  -[SBHDefaultIconListLayoutProvider layoutForIconLocation:](v5, "layoutForIconLocation:", CFSTR("SBIconLocationRoot"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  widthDefiningGridSizeClass = self->_widthDefiningGridSizeClass;
  if (!widthDefiningGridSizeClass)
    goto LABEL_7;
  v9 = fmax(SBHIconListLayoutIconImageInfoForGridSizeClass(v6, widthDefiningGridSizeClass), 0.0);
  listLayoutProvider = self->_listLayoutProvider;
  if (listLayoutProvider)
  {
    -[SBIconListLayoutProvider layoutForIconLocation:](listLayoutProvider, "layoutForIconLocation:", CFSTR("SBIconLocationRoot"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = SBHIconListLayoutIconImageInfoForGridSizeClass(v11, self->_widthDefiningGridSizeClass);
    if (v12 > 0.0)
      v9 = v12;

  }
  if (v9 <= 0.0)
  {
LABEL_7:
    v13 = SBHScreenTypeForCurrentDevice();
    if (self->_addWidgetSheetStyle == 1)
    {
      v9 = 450.0;
    }
    else if ((unint64_t)(v13 - 29) >= 0x13)
    {
      v9 = SBHIconListLayoutIconImageInfoForGridSizeClass(v7, CFSTR("SBHIconGridSizeClassMedium"));
    }
    else
    {
      v9 = dbl_1D0195808[v13 - 29];
    }
  }
  v14 = (a3 - v9) * 0.5;
  -[SBHWidgetSearchController textFieldExtraHeight](self, "textFieldExtraHeight");
  v16 = v15;
  -[SBHWidgetSearchController textFieldToWidgetsSpacing](self, "textFieldToWidgetsSpacing");
  v18 = v17;
  if (self->_addWidgetSheetStyle == 1)
  {
    if (self->_shouldInsetContentForGrabber)
    {
      if (_SBHAddWidgetSheetGrabberHeight_onceToken[0] != -1)
        dispatch_once(_SBHAddWidgetSheetGrabberHeight_onceToken, &__block_literal_global_113);
      v19 = *(double *)&_SBHAddWidgetSheetGrabberHeight_grabberHeight + 21.0;
    }
    else
    {
      v19 = 0.0;
    }
  }
  else
  {
    v20 = 27.0;
    if (self->_shouldInsetContentForGrabber)
      v20 = v14;
    v19 = v16 + v20;
    v18 = v16 + v18;
  }
  objc_msgSend(v21, "setContentInset:", v19, v14, v18, v14);

}

- (double)grabberTopSpacing
{
  void *v3;
  void *v4;
  double MinY;
  double v6;
  double v7;
  CGRect v9;

  -[SBHWidgetSearchController searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  MinY = CGRectGetMinY(v9);
  -[SBHWidgetSearchController textFieldExtraHeight](self, "textFieldExtraHeight");
  v7 = v6;

  if (_SBHAddWidgetSheetGrabberHeight_onceToken[0] != -1)
    dispatch_once(_SBHAddWidgetSheetGrabberHeight_onceToken, &__block_literal_global_113);
  return (MinY - v7 - *(double *)&_SBHAddWidgetSheetGrabberHeight_grabberHeight) * 0.5;
}

- (id)_textFieldFont
{
  unint64_t v2;
  _QWORD *v3;

  v2 = -[SBHWidgetSearchController addWidgetSheetStyle](self, "addWidgetSheetStyle");
  v3 = (_QWORD *)MEMORY[0x1E0DC4A88];
  if (v2 != 1)
    v3 = (_QWORD *)MEMORY[0x1E0DC4B60];
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *v3);
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[SBHWidgetSearchController searchBar](self, "searchBar", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetSearchController _textFieldFont](self, "_textFieldFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

}

- (UIView)searchBarTextFieldBackgroundView
{
  return self->_searchBarTextFieldBackgroundView;
}

- (UIView)searchBarBackgroundView
{
  return self->_searchBarBackgroundView;
}

- (void)setSearchBarBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_searchBarBackgroundView, a3);
}

- (double)textFieldToWidgetsSpacing
{
  return self->_textFieldToWidgetsSpacing;
}

- (void)setTextFieldToWidgetsSpacing:(double)a3
{
  self->_textFieldToWidgetsSpacing = a3;
}

- (BOOL)alwaysShowBarBackground
{
  return self->_alwaysShowBarBackground;
}

- (BOOL)shouldInsetContentForGrabber
{
  return self->_shouldInsetContentForGrabber;
}

- (BOOL)applicationCellIncludesGalleryListView
{
  return self->_applicationCellIncludesGalleryListView;
}

- (NSString)widthDefiningGridSizeClass
{
  return self->_widthDefiningGridSizeClass;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (void)setListLayoutProvider:(id)a3
{
  objc_storeStrong((id *)&self->_listLayoutProvider, a3);
}

- (unint64_t)addWidgetSheetStyle
{
  return self->_addWidgetSheetStyle;
}

- (void)setAddWidgetSheetStyle:(unint64_t)a3
{
  self->_addWidgetSheetStyle = a3;
}

- (double)textFieldExtraHeight
{
  return self->_textFieldExtraHeight;
}

- (void)setTextFieldExtraHeight:(double)a3
{
  self->_textFieldExtraHeight = a3;
}

- (double)textFieldToBarBackgroundBottomSpacing
{
  return self->_textFieldToBarBackgroundBottomSpacing;
}

- (void)setTextFieldToBarBackgroundBottomSpacing:(double)a3
{
  self->_textFieldToBarBackgroundBottomSpacing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_widthDefiningGridSizeClass, 0);
  objc_storeStrong((id *)&self->_searchBarBackgroundView, 0);
  objc_storeStrong((id *)&self->_searchBarTextFieldBackgroundView, 0);
  objc_storeStrong((id *)&self->_scrollProgressByClient, 0);
}

@end
