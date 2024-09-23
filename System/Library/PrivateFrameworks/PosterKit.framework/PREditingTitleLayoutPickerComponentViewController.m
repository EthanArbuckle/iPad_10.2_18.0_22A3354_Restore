@implementation PREditingTitleLayoutPickerComponentViewController

+ (id)defaultTitleLayoutsForRole:(id)a3
{
  if (objc_msgSend(a3, "isEqual:", CFSTR("PRPosterRoleIncomingCall")))
    return &unk_1E21DD0C8;
  else
    return &unk_1E21DD0E0;
}

- (PREditingTitleLayoutPickerComponentViewController)initWithTitleLayouts:(id)a3 selectedLayout:(unint64_t)a4
{
  id v7;
  PREditingTitleLayoutPickerComponentViewController *v8;
  PREditingTitleLayoutPickerComponentViewController *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PREditingTitleLayoutPickerComponentViewController;
  v8 = -[PREditingTitleLayoutPickerComponentViewController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_titleLayouts, a3);
    v9->_selectedTitleLayout = a4;
  }

  return v9;
}

- (BOOL)isUsingVerticalLanguage
{
  void *v2;
  void *v3;
  char v4;

  PRBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("POSTER_LAYOUT_VERTICAL"), &stru_1E2186E08, CFSTR("PosterKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pr_isSuitableForVerticalLayout");

  return v4;
}

- (double)cellHeight
{
  _BOOL4 v3;
  _BOOL4 v4;
  double result;
  double v6;

  v3 = -[PREditingTitleLayoutPickerComponentViewController isUsingVerticalLanguage](self, "isUsingVerticalLanguage");
  v4 = -[PREditingTitleLayoutPickerComponentViewController isUsingSmallerSizing](self, "isUsingSmallerSizing");
  result = 84.0;
  if (v4)
    result = 82.0;
  v6 = 64.0;
  if (v4)
    v6 = 62.0;
  if (!v3)
    return v6;
  return result;
}

- (id)cellViewFor:(unint64_t)a3 largestItemHeight:(double *)a4
{
  void *v6;
  _BOOL4 IsVertical;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  double v16;
  double v17;
  unint64_t v18;
  PREditingTitleLayoutPickerCellView *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  if (-[PREditingTitleLayoutPickerComponentViewController isUsingVerticalLanguage](self, "isUsingVerticalLanguage"))
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    IsVertical = PRPosterTitleLayoutIsVertical(a3);
    PRBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (IsVertical)
      v10 = CFSTR("POSTER_LAYOUT_VERTICAL");
    else
      v10 = CFSTR("POSTER_LAYOUT_HORIZONTAL");
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E2186E08, CFSTR("PosterKit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc(MEMORY[0x1E0CB3778]);
    v30 = *MEMORY[0x1E0DC1138];
    v31[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithString:attributes:", v11, v13);

    v15 = PRPosterTitleLayoutIsVertical(a3);
    objc_msgSend(v14, "size");
    if (a4)
    {
      if (!v15)
        v16 = v17;
      if (*a4 >= v16)
        v16 = *a4;
      *a4 = v16;
    }
    v18 = a3;
    if (PRPosterTitleLayoutIsVertical(a3))
    {
      if (_AXSPrefersHorizontalTextLayout())
        v18 = 0;
      else
        v18 = a3;
    }
    v19 = objc_alloc_init(PREditingTitleLayoutPickerCellView);
    -[PREditingTitleLayoutPickerCellView setFont:](v19, "setFont:", v6);
    -[PREditingTitleLayoutPickerCellView setLayout:](v19, "setLayout:", v18);
    -[PREditingTitleLayoutPickerCellView setText:](v19, "setText:", v11);
    -[PREditingTitleLayoutPickerCellView setTag:](v19, "setTag:", a3);

  }
  else
  {
    v19 = objc_alloc_init(PREditingPickerImageCellView);
    -[PREditingTitleLayoutPickerCellView contentImageView](v19, "contentImageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTintColor:", v21);

    -[PREditingTitleLayoutPickerCellView contentImageView](v19, "contentImageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setContentMode:", 1);

    -[PREditingTitleLayoutPickerCellView setTag:](v19, "setTag:", a3);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (PRPosterTitleLayoutIsVertical(a3))
      v23 = CFSTR("textbox.vertical.filled.topright.iphone");
    else
      v23 = CFSTR("textbox.horizontal.filled.top.iphone");
    -[PREditingTitleLayoutPickerCellView configureWithSystemImageNamed:configuration:](v19, "configureWithSystemImageNamed:configuration:", v23, v6);
    if (a4)
    {
      v24 = *a4;
      -[PREditingTitleLayoutPickerCellView contentImageView](v19, "contentImageView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "frame");
      v27 = v26;

      if (v24 >= v27)
        v28 = v24;
      else
        v28 = v27;
      *a4 = v28;
    }
  }

  return v19;
}

- (void)loadView
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  UIStackView *v11;
  UIStackView *stackView;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31[2];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id location;
  _QWORD v37[4];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v28 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_initWeak(&location, self);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[PREditingTitleLayoutPickerComponentViewController titleLayouts](self, "titleLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v33;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v33 != v5)
          objc_enumerationMutation(v3);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v6), "unsignedIntValue");
        -[PREditingTitleLayoutPickerComponentViewController cellViewFor:largestItemHeight:](self, "cellViewFor:largestItemHeight:", v7, &self->_largestItemHeight);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1E0DC3428];
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __61__PREditingTitleLayoutPickerComponentViewController_loadView__block_invoke;
        v30[3] = &unk_1E2183AA8;
        objc_copyWeak(v31, &location);
        v31[1] = (id)v7;
        v30[4] = self;
        objc_msgSend(v9, "actionWithHandler:", v30);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAction:forControlEvents:", v10, 0x2000);
        if (BSEqualDoubles())
        {
          objc_msgSend(v8, "setSelected:", 1);
          -[PREditingTitleLayoutPickerComponentViewController setSelectedCellView:](self, "setSelectedCellView:", v8);
        }
        objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v29, "addObject:", v8);

        objc_destroyWeak(v31);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v4);
  }

  -[PREditingTitleLayoutPickerComponentViewController setCellViews:](self, "setCellViews:", v29);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObjectsFromArray:", v29);
  v11 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithArrangedSubviews:", v27);
  stackView = self->_stackView;
  self->_stackView = v11;

  -[UIStackView setAxis:](self->_stackView, "setAxis:", 0);
  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 1);
  -[UIStackView setDistribution:](self->_stackView, "setDistribution:", 1);
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 20.0);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v28, "addSubview:", self->_stackView);
  v21 = (void *)MEMORY[0x1E0CB3718];
  -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, 24.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v24;
  -[UIStackView trailingAnchor](self->_stackView, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22, -24.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v13;
  -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v16;
  -[UIStackView topAnchor](self->_stackView, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v20);

  -[PREditingTitleLayoutPickerComponentViewController updateLayoutForCurrentSize](self, "updateLayoutForCurrentSize");
  -[PREditingTitleLayoutPickerComponentViewController setView:](self, "setView:", v28);

  objc_destroyWeak(&location);
}

void __61__PREditingTitleLayoutPickerComponentViewController_loadView__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setSelectedTitleLayout:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleLayoutPickerComponentViewController:didSelectTitleLayout:userSelected:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), 1);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PREditingTitleLayoutPickerComponentViewController;
  -[PREditingTitleLayoutPickerComponentViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  -[PREditingTitleLayoutPickerComponentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  if (-[PREditingTitleLayoutPickerComponentViewController isUsingSmallerSizing](self, "isUsingSmallerSizing") != v5 <= 375.0)
  {
    self->_usingSmallerSizing = v5 <= 375.0;
    -[PREditingTitleLayoutPickerComponentViewController updateLayoutForCurrentSize](self, "updateLayoutForCurrentSize");
  }
}

- (void)updateLayoutForCurrentSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *heightCellConstraints;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[PREditingTitleLayoutPickerComponentViewController heightCellConstraints](self, "heightCellConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[PREditingTitleLayoutPickerComponentViewController cellViews](self, "cellViews", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "heightAnchor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PREditingTitleLayoutPickerComponentViewController cellHeight](self, "cellHeight");
        objc_msgSend(v11, "constraintEqualToConstant:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (NSArray *)objc_msgSend(v5, "copy");
  heightCellConstraints = self->_heightCellConstraints;
  self->_heightCellConstraints = v13;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v5);
}

- (void)setSelectedTitleLayout:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_selectedTitleLayout != a3)
  {
    self->_selectedTitleLayout = a3;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[PREditingTitleLayoutPickerComponentViewController cellViews](self, "cellViews", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "tag") == a3)
          {
            -[PREditingTitleLayoutPickerComponentViewController selectedCellView](self, "selectedCellView");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setSelected:", 0);

            -[PREditingTitleLayoutPickerComponentViewController setSelectedCellView:](self, "setSelectedCellView:", v10);
            objc_msgSend(v10, "setSelected:", 1);
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (double)estimatedHeight
{
  double v2;

  -[PREditingTitleLayoutPickerComponentViewController cellHeight](self, "cellHeight");
  return v2 + 48.0;
}

- (NSArray)titleLayouts
{
  return self->_titleLayouts;
}

- (unint64_t)selectedTitleLayout
{
  return self->_selectedTitleLayout;
}

- (PREditingTitleLayoutPickerComponentViewControllerDelegate)delegate
{
  return (PREditingTitleLayoutPickerComponentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (PREditingPickerCellView)selectedCellView
{
  return self->_selectedCellView;
}

- (void)setSelectedCellView:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCellView, a3);
}

- (NSArray)cellViews
{
  return self->_cellViews;
}

- (void)setCellViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (BOOL)isUsingSmallerSizing
{
  return self->_usingSmallerSizing;
}

- (void)setUsingSmallerSizing:(BOOL)a3
{
  self->_usingSmallerSizing = a3;
}

- (double)largestItemHeight
{
  return self->_largestItemHeight;
}

- (void)setLargestItemHeight:(double)a3
{
  self->_largestItemHeight = a3;
}

- (NSArray)heightCellConstraints
{
  return self->_heightCellConstraints;
}

- (void)setHeightCellConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightCellConstraints, 0);
  objc_storeStrong((id *)&self->_cellViews, 0);
  objc_storeStrong((id *)&self->_selectedCellView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleLayouts, 0);
}

@end
