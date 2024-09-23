@implementation PREditingContentStyleItemsViewController

- (PREditingContentStyleItemsViewController)initWithDataSource:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  PREditingContentStyleItemsViewController *v9;
  PREditingContentStyleItemsViewController *v10;
  void *v11;
  char v12;
  id v13;
  PREditingPosterContentStyleCoordinator *v14;
  PREditingPosterContentStyleCoordinator *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;
  PUIColorWellView *colorWellView;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  uint64_t v26;
  PREditingPosterContentStyleCoordinator *uiKitColorPickerStyleCoordinator;
  PREditingPosterContentStyleCoordinator *selectedContentStyleCoordinator;
  _QWORD v30[4];
  id v31;
  id v32;
  char v33;
  objc_super v34;

  v7 = a3;
  v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)PREditingContentStyleItemsViewController;
  v9 = -[PREditingContentStyleItemsViewController initWithNibName:bundle:](&v34, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (!v9)
    goto LABEL_20;
  objc_storeStrong((id *)&v9->_dataSource, a3);
  objc_storeStrong((id *)&v10->_configuration, a4);
  objc_msgSend(v8, "selectedStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = __77__PREditingContentStyleItemsViewController_initWithDataSource_configuration___block_invoke((uint64_t)v11, v11);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __77__PREditingContentStyleItemsViewController_initWithDataSource_configuration___block_invoke_2;
  v30[3] = &unk_1E2183CB0;
  v13 = v11;
  v33 = v12;
  v31 = v13;
  v32 = &__block_literal_global_4;
  objc_msgSend(v7, "firstCoordinatorPassingTest:", v30);
  v14 = (PREditingPosterContentStyleCoordinator *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    -[PREditingPosterContentStyleCoordinator style](v14, "style");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "allowsVariation") & 1) != 0)
    {
      v17 = objc_msgSend(v13, "allowsVariation");

      if (v17)
      {
        objc_msgSend(v13, "variation");
        -[PREditingPosterContentStyleCoordinator setVariation:](v15, "setVariation:");
      }
    }
    else
    {

    }
  }
  if (objc_msgSend(v8, "colorWellDisplayMode"))
  {
    v18 = objc_alloc(MEMORY[0x1E0D7FCB8]);
    v19 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    colorWellView = v10->_colorWellView;
    v10->_colorWellView = (PUIColorWellView *)v19;

    -[PUIColorWellView colorWell](v10->_colorWellView, "colorWell");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addTarget:action:forControlEvents:", v10, sel_colorWellDidUpdateColor_, 4096);
    objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_storeStrong((id *)&v10->_colorWell, v21);
    if ((objc_msgSend(v13, "allowsVariation") & 1) != 0)
      objc_msgSend(v13, "variationAppliedColors");
    else
      objc_msgSend(v13, "colors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "setSelectedColor:", v23);
    if (v23)
    {
      -[PREditorContentStylePickerConfiguration stylePalette](v10->_configuration, "stylePalette");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "context") == 2;

      +[PREditingPosterContentStyleCoordinator coordinatorForColorWellView:vibrant:](PREditingPosterContentStyleCoordinator, "coordinatorForColorWellView:vibrant:", v10->_colorWellView, v25);
      v26 = objc_claimAutoreleasedReturnValue();
      uiKitColorPickerStyleCoordinator = v10->_uiKitColorPickerStyleCoordinator;
      v10->_uiKitColorPickerStyleCoordinator = (PREditingPosterContentStyleCoordinator *)v26;

      if (objc_msgSend(v7, "indexForCoordinator:", v15) == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_16;
    }
    else
    {
      objc_msgSend(v7, "indexForCoordinator:", v15);
    }
    -[PREditingContentStyleItemsViewController _deselectColorWell](v10, "_deselectColorWell");
LABEL_16:

  }
  if (!v15)
    v15 = v10->_uiKitColorPickerStyleCoordinator;
  selectedContentStyleCoordinator = v10->_selectedContentStyleCoordinator;
  v10->_selectedContentStyleCoordinator = v15;

LABEL_20:
  return v10;
}

uint64_t __77__PREditingContentStyleItemsViewController_initWithDataSource_configuration___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  if (objc_msgSend(v2, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(v2, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("VibrantMaterial"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __77__PREditingContentStyleItemsViewController_initWithDataSource_configuration___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 1;
  if ((objc_msgSend(v3, "isEqual:ignoringVariation:", *(_QWORD *)(a1 + 32), 1) & 1) == 0)
  {
    if (*(_BYTE *)(a1 + 48))
      v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    else
      v4 = 0;
  }

  return v4;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PREditingContentStyleItemsViewController;
  -[PREditingContentStyleItemsViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PREditingContentStyleItemsViewController _setupItemViews](self, "_setupItemViews");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PREditingContentStyleItemsViewController;
  -[PREditingContentStyleItemsViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[PREditingContentStyleItemsViewController _updateLayoutForCurrentSize](self, "_updateLayoutForCurrentSize");
}

- (void)_setupItemViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  PREditingContentStyleItemView *v7;
  void *v8;
  void *v9;
  int v10;
  NSArray *v11;
  NSArray *allItemViews;
  NSArray *v13;
  NSArray *allViews;
  NSArray *v15;
  id v16;
  id v17;
  void *v18;

  -[PREditingContentStyleItemsViewController selectedContentStyleCoordinator](self, "selectedContentStyleCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v4 = -[PREditingContentStyleItemsDataSource numberOfCoordinators](self->_dataSource, "numberOfCoordinators");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 >= 1)
  {
    v5 = 0;
    do
    {
      -[PREditingContentStyleItemsDataSource coordinatorForIndex:](self->_dataSource, "coordinatorForIndex:", v5, v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[PREditingContentStyleItemView initWithContentStyleCoordinator:]([PREditingContentStyleItemView alloc], "initWithContentStyleCoordinator:", v6);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_didTapContentStyleItem_);
      -[PREditingContentStyleItemView addGestureRecognizer:](v7, "addGestureRecognizer:", v8);
      objc_msgSend(v6, "style");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqual:ignoringVariation:", v16, 1);

      if (v10)
      {
        -[PRSelectableEditingItemView setSelected:](v7, "setSelected:", 1);
        -[PREditingContentStyleItemsViewController setSelectedContentStyleItemView:](self, "setSelectedContentStyleItemView:", v7);
      }
      -[PREditingContentStyleItemView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v18, "addObject:", v7);
      ++v5;

    }
    while (v4 != v5);
  }
  v11 = (NSArray *)objc_msgSend(v18, "copy", v16);
  allItemViews = self->_allItemViews;
  self->_allItemViews = v11;

  -[PREditingContentStyleItemsDataSource setContentsLuminance:](self->_dataSource, "setContentsLuminance:", self->_contentsLuminance);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v18);
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (-[PREditorContentStylePickerConfiguration colorWellDisplayMode](self->_configuration, "colorWellDisplayMode") == 1)
    -[NSArray addObject:](v13, "addObject:", self->_colorWellView);
  allViews = self->_allViews;
  self->_allViews = v13;
  v15 = v13;

  -[PREditingContentStyleItemsViewController layoutWithItemViews:](self, "layoutWithItemViews:", v15);
}

- (void)didTapContentStyleItem:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentStyleCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingContentStyleItemsViewController setSelectedContentStyleCoordinator:](self, "setSelectedContentStyleCoordinator:", v4);
  -[PREditingContentStyleItemsViewController _didSelectContentStyleCoordinator:](self, "_didSelectContentStyleCoordinator:", v4);
  -[PREditingContentStyleItemsViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexForCoordinator:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PREditingContentStyleItemsViewController _deselectSelectedContentStyle](self, "_deselectSelectedContentStyle");
  }
  else
  {
    -[PREditingContentStyleItemsViewController _deselectColorWell](self, "_deselectColorWell");
    -[PREditingContentStyleItemsViewController selectedContentStyleItemView](self, "selectedContentStyleItemView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSelected:", 0);

    -[PREditingContentStyleItemsViewController setSelectedContentStyleItemView:](self, "setSelectedContentStyleItemView:", v8);
    objc_msgSend(v8, "setSelected:", 1);
  }

}

- (void)layoutWithItemViews:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t j;
  void *v12;
  void *v13;
  UIStackView *v14;
  UIStackView *stackView;
  UIStackView *v16;
  NSArray *v17;
  NSArray *horizontalStackViews;
  void *v19;
  UIStackView *v20;
  void *v21;
  void *v22;
  void *v23;
  NSLayoutConstraint *v24;
  NSLayoutConstraint *stackViewLeadingConstraint;
  void *v26;
  void *v27;
  void *v28;
  NSLayoutConstraint *v29;
  NSLayoutConstraint *stackViewTrailingConstraint;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSLayoutConstraint *v40;
  NSLayoutConstraint *v41;
  void *v42;
  void *v43;
  _QWORD v45[5];

  v45[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "count") / 6uLL;
  if (__ROR8__(0xAAAAAAAAAAAAAAABLL * objc_msgSend(v3, "count"), 1) <= 0x2AAAAAAAAAAAAAAAuLL)
    v6 = v5;
  else
    v6 = v5 + 1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = 0;
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      for (j = 0; j != 6; ++j)
      {
        if (objc_msgSend(v3, "count") <= (unint64_t)(v8 + j))
          break;
        objc_msgSend(v3, "objectAtIndexedSubscript:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v12);

      }
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithArrangedSubviews:", v10);
      objc_msgSend(v13, "setAxis:", 0);
      objc_msgSend(v13, "setDistribution:", 3);
      objc_msgSend(v13, "setAlignment:", 1);
      objc_msgSend(v13, "setSpacing:", 14.0);
      objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v7, "addObject:", v13);
      objc_msgSend(v4, "addObject:", v13);

      v8 += 6;
    }
  }
  v43 = v7;
  v14 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithArrangedSubviews:", v7);
  -[UIStackView setAxis:](v14, "setAxis:", 1);
  -[UIStackView setDistribution:](v14, "setDistribution:", 3);
  -[UIStackView setAlignment:](v14, "setAlignment:", 3);
  -[UIStackView setSpacing:](v14, "setSpacing:", 14.0);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  stackView = self->_stackView;
  self->_stackView = v14;
  v16 = v14;

  v42 = v4;
  v17 = (NSArray *)objc_msgSend(v4, "copy");
  horizontalStackViews = self->_horizontalStackViews;
  self->_horizontalStackViews = v17;

  -[PREditingContentStyleItemsViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v16);

  v20 = v16;
  -[UIStackView leadingAnchor](v16, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingContentStyleItemsViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23, 31.0);
  v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

  stackViewLeadingConstraint = self->_stackViewLeadingConstraint;
  self->_stackViewLeadingConstraint = v24;
  v41 = v24;

  -[UIStackView trailingAnchor](v16, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingContentStyleItemsViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v28, -31.0);
  v29 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

  stackViewTrailingConstraint = self->_stackViewTrailingConstraint;
  self->_stackViewTrailingConstraint = v29;
  v40 = v29;

  v45[0] = v41;
  v45[1] = v40;
  -[UIStackView bottomAnchor](v16, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingContentStyleItemsViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v32;
  -[UIStackView topAnchor](v16, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingContentStyleItemsViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v37);
  -[PREditingContentStyleItemsViewController _updateLayoutForCurrentSize](self, "_updateLayoutForCurrentSize");

}

- (void)_updateLayoutForCurrentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[PREditingContentStyleItemsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  v6 = (v5 + -326.0) / 5.0;
  if (v6 != self->_interitemSpacing)
  {
    self->_interitemSpacing = v6;
    -[UIStackView setSpacing:](self->_stackView, "setSpacing:", (v5 + -326.0) / 5.0);
    -[UIStackView setNeedsLayout](self->_stackView, "setNeedsLayout");
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = self->_horizontalStackViews;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v12, "setSpacing:", (v5 + -326.0) / 5.0, (_QWORD)v25);
          objc_msgSend(v12, "setNeedsLayout");
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v9);
    }

    -[PREditingContentStyleItemsViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentStyleItemsViewControllerDidUpdateEstimatedSize:", self);

  }
  if (v5 != self->_configuredViewWidth)
  {
    -[PREditingContentStyleItemsViewController stackViewLeadingConstraint](self, "stackViewLeadingConstraint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constant");
    v16 = v15;
    -[PREditingContentStyleItemsViewController stackViewTrailingConstraint](self, "stackViewTrailingConstraint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constant");
    v19 = v16 - v18;

    if (v5 + -264.0 >= v19)
      v20 = 31.0;
    else
      v20 = (v5 + -264.0) * 0.5;
    -[PREditingContentStyleItemsViewController stackViewLeadingConstraint](self, "stackViewLeadingConstraint", (_QWORD)v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20 >= 0.0)
      v23 = v20;
    else
      v23 = 0.0;
    objc_msgSend(v21, "setConstant:", v23);

    -[PREditingContentStyleItemsViewController stackViewTrailingConstraint](self, "stackViewTrailingConstraint");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setConstant:", fmin(-v20, 0.0));

    self->_configuredViewWidth = v5;
  }
}

- (double)estimatedHeight
{
  unint64_t v3;
  int64_t v4;
  uint64_t v5;

  v3 = -[PREditingContentStyleItemsDataSource numberOfCoordinators](self->_dataSource, "numberOfCoordinators");
  if (-[PREditorContentStylePickerConfiguration colorWellDisplayMode](self->_configuration, "colorWellDisplayMode") == 1)
    v4 = v3 + 1;
  else
    v4 = v3;
  if (v4 % 6)
    v5 = v4 / 6 + 1;
  else
    v5 = v4 / 6;
  return self->_interitemSpacing * (double)(v5 - 1) + (double)v5 * 44.0;
}

- (void)setContentsLuminance:(double)a3
{
  self->_contentsLuminance = a3;
  if (-[PREditingContentStyleItemsViewController isViewLoaded](self, "isViewLoaded"))
    -[PREditingContentStyleItemsDataSource setContentsLuminance:](self->_dataSource, "setContentsLuminance:", a3);
}

- (void)_didSelectContentStyleCoordinator:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PREditingContentStyleItemsViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentStyleItemsViewController:didSelectContentStyleCoordinator:", self, v4);

}

- (void)_deselectSelectedContentStyle
{
  PREditingContentStyleItemView *selectedContentStyleItemView;
  PREditingPosterContentStyleCoordinator *selectedContentStyleCoordinator;

  -[PRSelectableEditingItemView setSelected:](self->_selectedContentStyleItemView, "setSelected:", 0);
  selectedContentStyleItemView = self->_selectedContentStyleItemView;
  self->_selectedContentStyleItemView = 0;

  selectedContentStyleCoordinator = self->_selectedContentStyleCoordinator;
  self->_selectedContentStyleCoordinator = 0;

  -[PUIColorWell setSelectedColor:](self->_colorWell, "setSelectedColor:", 0);
  -[PUIColorWell invalidateIntrinsicContentSize](self->_colorWell, "invalidateIntrinsicContentSize");
  -[PUIColorWellView setNeedsLayout](self->_colorWellView, "setNeedsLayout");
}

- (void)_deselectColorWell
{
  -[PUIColorWell setSelectedColor:](self->_colorWell, "setSelectedColor:", 0);
  -[PUIColorWell invalidateIntrinsicContentSize](self->_colorWell, "invalidateIntrinsicContentSize");
  -[PUIColorWellView setNeedsLayout](self->_colorWellView, "setNeedsLayout");
}

- (void)setSelectedContentStyle:(id)a3 fromUIKitPicker:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  PREditingContentStyleItemView *selectedContentStyleItemView;
  PREditingContentStyleItemsDataSource *dataSource;
  void *v10;
  unint64_t v11;
  PREditingContentStyleItemView *v12;
  PREditingContentStyleItemView *v13;
  PREditingContentStyleItemView *v14;
  _QWORD v15[4];
  PREditingContentStyleItemView *v16;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (v4)
    {
      -[PRSelectableEditingItemView setSelected:](self->_selectedContentStyleItemView, "setSelected:", 0);
      selectedContentStyleItemView = self->_selectedContentStyleItemView;
      self->_selectedContentStyleItemView = 0;
    }
    else
    {
      dataSource = self->_dataSource;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __84__PREditingContentStyleItemsViewController_setSelectedContentStyle_fromUIKitPicker___block_invoke;
      v15[3] = &unk_1E2183CD8;
      v16 = (PREditingContentStyleItemView *)v6;
      -[PREditingContentStyleItemsDataSource firstCoordinatorPassingTest:](dataSource, "firstCoordinatorPassingTest:", v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PREditingContentStyleItemsDataSource indexForCoordinator:](self->_dataSource, "indexForCoordinator:", v10);
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[PREditingContentStyleItemsViewController _deselectSelectedContentStyle](self, "_deselectSelectedContentStyle");
      }
      else
      {
        -[NSArray objectAtIndexedSubscript:](self->_allItemViews, "objectAtIndexedSubscript:", v11);
        v12 = (PREditingContentStyleItemView *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)&self->_selectedContentStyleCoordinator, v10);
        -[PRSelectableEditingItemView setSelected:](self->_selectedContentStyleItemView, "setSelected:", 0);
        v13 = self->_selectedContentStyleItemView;
        self->_selectedContentStyleItemView = v12;
        v14 = v12;

        -[PRSelectableEditingItemView setSelected:](v14, "setSelected:", 1);
      }

      selectedContentStyleItemView = v16;
    }

  }
  else
  {
    -[PREditingContentStyleItemsViewController _deselectSelectedContentStyle](self, "_deselectSelectedContentStyle");
  }

}

uint64_t __84__PREditingContentStyleItemsViewController_setSelectedContentStyle_fromUIKitPicker___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)colorWellDidUpdateColor:(id)a3
{
  PREditingContentStyleItemView *selectedContentStyleItemView;
  void *v5;
  void *v6;
  _BOOL8 v7;
  PREditingPosterContentStyleCoordinator *v8;
  PREditingPosterContentStyleCoordinator *uiKitColorPickerStyleCoordinator;
  id v10;

  -[PRSelectableEditingItemView setSelected:](self->_selectedContentStyleItemView, "setSelected:", 0);
  selectedContentStyleItemView = self->_selectedContentStyleItemView;
  self->_selectedContentStyleItemView = 0;

  -[PREditingContentStyleItemsViewController colorWellView](self, "colorWellView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PREditingContentStyleItemsViewController colorWell](self, "colorWell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateIntrinsicContentSize");

  objc_msgSend(v10, "setNeedsLayout");
  -[PREditorContentStylePickerConfiguration stylePalette](self->_configuration, "stylePalette");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "context") == 2;

  +[PREditingPosterContentStyleCoordinator coordinatorForColorWellView:vibrant:](PREditingPosterContentStyleCoordinator, "coordinatorForColorWellView:vibrant:", self->_colorWellView, v7);
  v8 = (PREditingPosterContentStyleCoordinator *)objc_claimAutoreleasedReturnValue();
  uiKitColorPickerStyleCoordinator = self->_uiKitColorPickerStyleCoordinator;
  self->_uiKitColorPickerStyleCoordinator = v8;

  objc_storeStrong((id *)&self->_selectedContentStyleCoordinator, self->_uiKitColorPickerStyleCoordinator);
  -[PREditingContentStyleItemsViewController setSelectedContentStyleCoordinator:](self, "setSelectedContentStyleCoordinator:", self->_selectedContentStyleCoordinator);
  -[PREditingContentStyleItemsViewController _didSelectContentStyleCoordinator:](self, "_didSelectContentStyleCoordinator:", self->_uiKitColorPickerStyleCoordinator);

}

- (PREditingContentStyleItemsViewControllerDelegate)delegate
{
  return (PREditingContentStyleItemsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PREditingPosterContentStyleCoordinator)selectedContentStyleCoordinator
{
  return self->_selectedContentStyleCoordinator;
}

- (void)setSelectedContentStyleCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_selectedContentStyleCoordinator, a3);
}

- (PREditingContentStyleItemView)selectedContentStyleItemView
{
  return self->_selectedContentStyleItemView;
}

- (void)setSelectedContentStyleItemView:(id)a3
{
  objc_storeStrong((id *)&self->_selectedContentStyleItemView, a3);
}

- (PREditorContentStylePickerConfiguration)configuration
{
  return self->_configuration;
}

- (double)contentsLuminance
{
  return self->_contentsLuminance;
}

- (PREditingPosterContentStyleCoordinator)uiKitColorPickerStyleCoordinator
{
  return self->_uiKitColorPickerStyleCoordinator;
}

- (void)setUiKitColorPickerStyleCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_uiKitColorPickerStyleCoordinator, a3);
}

- (PUIColorWellView)colorWellView
{
  return self->_colorWellView;
}

- (void)setColorWellView:(id)a3
{
  objc_storeStrong((id *)&self->_colorWellView, a3);
}

- (PREditingContentStyleItemsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSArray)allItemViews
{
  return self->_allItemViews;
}

- (void)setAllItemViews:(id)a3
{
  objc_storeStrong((id *)&self->_allItemViews, a3);
}

- (NSArray)allViews
{
  return self->_allViews;
}

- (void)setAllViews:(id)a3
{
  objc_storeStrong((id *)&self->_allViews, a3);
}

- (double)configuredViewWidth
{
  return self->_configuredViewWidth;
}

- (void)setConfiguredViewWidth:(double)a3
{
  self->_configuredViewWidth = a3;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (NSLayoutConstraint)stackViewLeadingConstraint
{
  return self->_stackViewLeadingConstraint;
}

- (void)setStackViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)stackViewTrailingConstraint
{
  return self->_stackViewTrailingConstraint;
}

- (void)setStackViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewTrailingConstraint, a3);
}

- (NSArray)horizontalStackViews
{
  return self->_horizontalStackViews;
}

- (void)setHorizontalStackViews:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalStackViews, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (PUIColorWell)colorWell
{
  return self->_colorWell;
}

- (void)setColorWell:(id)a3
{
  objc_storeStrong((id *)&self->_colorWell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorWell, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_horizontalStackViews, 0);
  objc_storeStrong((id *)&self->_stackViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_allViews, 0);
  objc_storeStrong((id *)&self->_allItemViews, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_colorWellView, 0);
  objc_storeStrong((id *)&self->_uiKitColorPickerStyleCoordinator, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_selectedContentStyleItemView, 0);
  objc_storeStrong((id *)&self->_selectedContentStyleCoordinator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
