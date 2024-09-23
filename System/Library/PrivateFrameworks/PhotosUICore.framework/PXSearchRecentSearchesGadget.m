@implementation PXSearchRecentSearchesGadget

- (PXSearchRecentSearchesGadget)init
{
  PXSearchRecentSearchesGadget *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSearchRecentSearchesGadget;
  result = -[PXSearchRecentSearchesGadget init](&v3, sel_init);
  if (result)
    result->_accessoryButtonType = 5;
  return result;
}

- (void)viewDidLoad
{
  PXSearchRecentSearchesGadget *v3;
  void *v4;
  void *v5;
  void *v6;
  PXSearchRecentSearchesGadget *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
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
  PXSearchRecentSearchesGadget *v28;
  void *v29;
  void *v30;
  objc_super v31;
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)PXSearchRecentSearchesGadget;
  -[PXSearchRecentSearchesGadget viewDidLoad](&v31, sel_viewDidLoad);
  v3 = self;
  -[PXSearchRecentSearchesGadget tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kPXSearchRecentSearchCellReuseIdentifier"));
  objc_msgSend(v4, "setCellLayoutMarginsFollowReadableWidth:", 0);
  objc_msgSend(v4, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
  objc_msgSend(v4, "setInsetsLayoutMarginsFromSafeArea:", 0);
  objc_msgSend(v4, "setScrollEnabled:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(v4, "setFocusGroupIdentifier:", 0);
  objc_msgSend(v4, "setAllowsFocus:", 1);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  objc_msgSend(v4, "setTableFooterView:", v6);

  v7 = v3;
  v28 = v3;
  -[PXSearchRecentSearchesGadget tableView](v3, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutMarginsGuide");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v10);

  objc_msgSend(v4, "setTableHeaderView:", v9);
  objc_msgSend(v9, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v12;
  objc_msgSend(v9, "heightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchRecentSearchesGadget traitCollection](v7, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayScale");
  objc_msgSend(v13, "constraintEqualToConstant:", 1.0 / v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v16;
  objc_msgSend(v9, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "widthAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widthAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 0.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchRecentSearchesGadget setSeparatorCompactWidthConstraint:](v28, "setSeparatorCompactWidthConstraint:", v22);

  objc_msgSend(v9, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchRecentSearchesGadget setSeparatorRegularTrailingConstraint:](v28, "setSeparatorRegularTrailingConstraint:", v25);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v29);
  +[PXSearchHistoryManager sharedManager](PXSearchHistoryManager, "sharedManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObserver:forKeyPath:options:context:", v28, CFSTR("recentSearches"), 1, 0);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", v28, CFSTR("contentSize"), 3, 0);
  -[PXSearchRecentSearchesGadget _reloadData](v28, "_reloadData");

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[PXSearchHistoryManager sharedManager](PXSearchHistoryManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("recentSearches"));

  -[PXSearchRecentSearchesGadget tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("contentSize"));

  v5.receiver = self;
  v5.super_class = (Class)PXSearchRecentSearchesGadget;
  -[PXSearchRecentSearchesGadget dealloc](&v5, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v20;
  id v21;
  int v22;
  id v23;

  v23 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v23, "isEqualToString:", CFSTR("contentSize")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "CGSizeValue");
    v14 = v13;
    v16 = v15;
    objc_msgSend(v12, "CGSizeValue");
    if (v18 != v14 || v17 != v16)
    {
      -[PXSearchRecentSearchesGadget delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "gadget:didChange:", self, 64);

    }
  }
  +[PXSearchHistoryManager sharedManager](PXSearchHistoryManager, "sharedManager");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (v21 == v9)
  {
    v22 = objc_msgSend(v23, "isEqualToString:", CFSTR("recentSearches"));

    if (v22)
      -[PXSearchRecentSearchesGadget _reloadData](self, "_reloadData");
  }
  else
  {

  }
}

- (void)_updateTableViewLayoutMargins
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
  id v12;

  -[PXSearchRecentSearchesGadget gadgetSpec](self, "gadgetSpec");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXSearchRecentSearchesGadget tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLayoutMargins:", v4, v6, v8, v10);

}

- (void)_reloadData
{
  void *v3;
  void *v4;
  void *v5;

  +[PXSearchHistoryManager sharedManager](PXSearchHistoryManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recentSearches");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchRecentSearchesGadget setRecentSearches:](self, "setRecentSearches:", v4);

  -[PXSearchRecentSearchesGadget tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

  -[PXSearchRecentSearchesGadget _updateTableViewLayoutMargins](self, "_updateTableViewLayoutMargins");
}

- (void)viewLayoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSearchRecentSearchesGadget;
  -[PXSearchRecentSearchesGadget viewLayoutMarginsDidChange](&v3, sel_viewLayoutMarginsDidChange);
  -[PXSearchRecentSearchesGadget resetLineSeparatorInsets](self, "resetLineSeparatorInsets");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXSearchRecentSearchesGadget;
  -[PXSearchRecentSearchesGadget traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[PXSearchRecentSearchesGadget resetLineSeparatorInsets](self, "resetLineSeparatorInsets");
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[PXSearchRecentSearchesGadget delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "gadgetViewControllerHostingGadget:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    -[PXSearchRecentSearchesGadget recentSearches](self, "recentSearches");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "performRecentSearch:", v11);
    +[PXSearchHistoryManager sharedManager](PXSearchHistoryManager, "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "saveRecentSearch:", v11);

  }
  objc_msgSend(v13, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PXSearchRecentSearchesGadget recentSearches](self, "recentSearches", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a4;
  v7 = a3;
  -[PXSearchRecentSearchesGadget recentSearches](self, "recentSearches");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "localizedQueryString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B58], 0x8000, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v11, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kPXSearchRecentSearchCellReuseIdentifier"), v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__PXSearchRecentSearchesGadget_tableView_cellForRowAtIndexPath___block_invoke;
  v17[3] = &unk_1E5131000;
  v18 = v10;
  v19 = v12;
  v14 = v12;
  v15 = v10;
  objc_msgSend(v13, "setConfigurationUpdateHandler:", v17);

  return v13;
}

- (CGSize)contentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PXSearchRecentSearchesGadget tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (unint64_t)gadgetType
{
  return 13;
}

- (unint64_t)gadgetCapabilities
{
  return 0;
}

- (unint64_t)headerStyle
{
  return 2;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  -[PXSearchRecentSearchesGadget tableView](self, "tableView", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");
  objc_msgSend(v4, "contentSize");
  v6 = v5 + 25.0;

  v7 = width;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setGadgetSpec:(id)a3
{
  PXGadgetSpec *v5;
  BOOL v6;
  PXGadgetSpec *v7;

  v7 = (PXGadgetSpec *)a3;
  v5 = self->_gadgetSpec;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXGadgetSpec isEqual:](v7, "isEqual:", v5);

    if (!v6)
    {
      objc_storeStrong((id *)&self->_gadgetSpec, a3);
      -[PXSearchRecentSearchesGadget _updateTableViewLayoutMargins](self, "_updateTableViewLayoutMargins");
    }
  }

}

- (NSString)localizedTitle
{
  return (NSString *)PXLocalizedStringFromTable(CFSTR("SEARCH_RECENT_SEARCHES_GADGET_TITLE"), CFSTR("PhotosUICore"));
}

- (void)userDidSelectAccessoryButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _QWORD v22[5];

  v4 = a3;
  if (-[PXSearchRecentSearchesGadget accessoryButtonType](self, "accessoryButtonType") == 5)
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedStringFromTable(CFSTR("SEARCH_HOME_CLEAR_RECENT_SEARCHES_CONFIRM_BUTTON_TITLE"), CFSTR("PhotosUICore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __61__PXSearchRecentSearchesGadget_userDidSelectAccessoryButton___block_invoke;
    v22[3] = &unk_1E5144530;
    v22[4] = self;
    objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 2, v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addAction:", v8);
    objc_msgSend(v5, "addAction:", v11);
    objc_msgSend(v5, "popoverPresentationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v4;
    objc_msgSend(v12, "setSourceView:", v13);
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "userInterfaceLayoutDirection");

    objc_msgSend(v13, "bounds");
    v17 = v16;
    v19 = v18;
    objc_msgSend(v13, "bounds");
    v21 = v19 + 5.0;
    if (v15 != 1)
      v21 = v17 + -5.0;
    objc_msgSend(v12, "setSourceRect:", v21, v20 * 0.5, 0.0, 0.0);
    objc_msgSend(v12, "setPermittedArrowDirections:", 12);
    -[PXSearchRecentSearchesGadget presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

  }
}

- (void)resetLineSeparatorInsets
{
  void *v2;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;

  -[UIViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");
  if (v5 != 1
    || (-[PXSearchRecentSearchesGadget gadgetSpec](self, "gadgetSpec"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "layoutOrientation") != 1))
  {
    -[UIViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "userInterfaceIdiom") == 2)
    {
      -[PXSearchRecentSearchesGadget gadgetSpec](self, "gadgetSpec");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "layoutSizeClass");

      if (v5 == 1)
      if (v8 == 1)
        goto LABEL_8;
    }
    else
    {

      if (v5 == 1)
    }
    -[UIViewController px_layoutMargins](self, "px_layoutMargins");
    v15 = v14;
    -[UIViewController px_layoutMargins](self, "px_layoutMargins");
    v17 = v16;
    -[PXSearchRecentSearchesGadget tableView](self, "tableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSeparatorInset:", 0.0, v15, 0.0, v17);

    -[PXSearchRecentSearchesGadget separatorCompactWidthConstraint](self, "separatorCompactWidthConstraint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 0);

    -[PXSearchRecentSearchesGadget separatorRegularTrailingConstraint](self, "separatorRegularTrailingConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }

LABEL_8:
  -[UIViewController px_layoutMargins](self, "px_layoutMargins");
  v10 = v9;
  -[PXSearchRecentSearchesGadget tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSeparatorInset:", 0.0, v10, 0.0, 0.0);

  -[PXSearchRecentSearchesGadget separatorRegularTrailingConstraint](self, "separatorRegularTrailingConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 0);

  -[PXSearchRecentSearchesGadget separatorCompactWidthConstraint](self, "separatorCompactWidthConstraint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  v20 = v13;
  objc_msgSend(v13, "setActive:", 1);

}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (PXGadgetDelegate)delegate
{
  return (PXGadgetDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)accessoryButtonType
{
  return self->_accessoryButtonType;
}

- (NSArray)recentSearches
{
  return self->_recentSearches;
}

- (void)setRecentSearches:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (NSLayoutConstraint)separatorRegularTrailingConstraint
{
  return self->_separatorRegularTrailingConstraint;
}

- (void)setSeparatorRegularTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_separatorRegularTrailingConstraint, a3);
}

- (NSLayoutConstraint)separatorCompactWidthConstraint
{
  return self->_separatorCompactWidthConstraint;
}

- (void)setSeparatorCompactWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_separatorCompactWidthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorCompactWidthConstraint, 0);
  objc_storeStrong((id *)&self->_separatorRegularTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_recentSearches, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
}

void __61__PXSearchRecentSearchesGadget_userDidSelectAccessoryButton___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[PXSearchHistoryManager sharedManager](PXSearchHistoryManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearRecentSearches");

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gadget:didChange:", *(_QWORD *)(a1 + 32), 32);

}

void __64__PXSearchRecentSearchesGadget_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updatedConfigurationForState:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setText:", *(_QWORD *)(a1 + 32));
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v7, "textProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  if (objc_msgSend(v5, "isFocused"))
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColor:", v10);

  objc_msgSend(v7, "textProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfLines:", 0);

  objc_msgSend(v15, "setContentConfiguration:", v7);
  objc_msgSend(MEMORY[0x1E0DC34D8], "listPlainCellConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updatedConfigurationForState:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isFocused"))
    objc_msgSend(v14, "setBackgroundColorTransformer:", 0);
  objc_msgSend(v15, "setBackgroundConfiguration:", v14);

}

@end
