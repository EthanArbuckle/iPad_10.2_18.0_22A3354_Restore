@implementation PUITextLayoutPickerComponentViewController

- (PUITextLayoutPickerComponentViewController)initWithLayout:(unint64_t)a3
{
  PUITextLayoutSet *v5;
  void *v6;
  void *v7;
  PUITextLayoutSet *v8;
  PUITextLayoutPickerComponentViewController *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = [PUITextLayoutSet alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PUITextLayoutSet initWithTextLayouts:](v5, "initWithTextLayouts:", v7);
  v9 = -[PUITextLayoutPickerComponentViewController initWithLayouts:selectedLayout:](self, "initWithLayouts:selectedLayout:", v8, a3);

  return v9;
}

- (PUITextLayoutPickerComponentViewController)initWithLayouts:(id)a3 selectedLayout:(unint64_t)a4
{
  id v6;
  PUITextLayoutPickerComponentViewController *v7;
  uint64_t v8;
  PUITextLayoutSet *layouts;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUITextLayoutPickerComponentViewController;
  v7 = -[PUITextLayoutPickerComponentViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    layouts = v7->_layouts;
    v7->_layouts = (PUITextLayoutSet *)v8;

    v7->_selectedLayout = a4;
  }

  return v7;
}

- (BOOL)isUsingVerticalLanguage
{
  void *v2;
  void *v3;
  char v4;

  PUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("POSTER_LAYOUT_VERTICAL"), &stru_25154D128, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pui_isSuitableForVerticalLayout");

  return v4;
}

- (double)cellHeight
{
  _BOOL4 v3;
  _BOOL4 v4;
  double result;
  double v6;

  v3 = -[PUITextLayoutPickerComponentViewController isUsingVerticalLanguage](self, "isUsingVerticalLanguage");
  v4 = -[PUITextLayoutPickerComponentViewController isUsingSmallerSizing](self, "isUsingSmallerSizing");
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
  PUIStyleTitleLayoutPickerButton *v19;
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

  v31[1] = *MEMORY[0x24BDAC8D0];
  if (-[PUITextLayoutPickerComponentViewController isUsingVerticalLanguage](self, "isUsingVerticalLanguage"))
  {
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77E8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    IsVertical = PUITextLayoutIsVertical(a3);
    PUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (IsVertical)
      v10 = CFSTR("POSTER_LAYOUT_VERTICAL");
    else
      v10 = CFSTR("POSTER_LAYOUT_HORIZONTAL");
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_25154D128, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc(MEMORY[0x24BDD1688]);
    v30 = *MEMORY[0x24BDF65F8];
    v31[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithString:attributes:", v11, v13);

    v15 = PUITextLayoutIsVertical(a3);
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
    if (PUITextLayoutIsVertical(a3))
    {
      if (_AXSPrefersHorizontalTextLayout())
        v18 = 0;
      else
        v18 = a3;
    }
    v19 = objc_alloc_init(PUIStyleTitleLayoutPickerButton);
    -[PUIStyleTitleLayoutPickerButton setFont:](v19, "setFont:", v6);
    -[PUIStyleTitleLayoutPickerButton setLayout:](v19, "setLayout:", v18);
    -[PUIStyleTitleLayoutPickerButton setText:](v19, "setText:", v11);
    -[PUIStyleTitleLayoutPickerButton setTag:](v19, "setTag:", a3);

  }
  else
  {
    v19 = objc_alloc_init(PUIStylePickerImageButton);
    -[PUIStyleTitleLayoutPickerButton contentImageView](v19, "contentImageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTintColor:", v21);

    -[PUIStyleTitleLayoutPickerButton contentImageView](v19, "contentImageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setContentMode:", 1);

    -[PUIStyleTitleLayoutPickerButton setTag:](v19, "setTag:", a3);
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithScale:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (PUITextLayoutIsVertical(a3))
      v23 = CFSTR("textbox.vertical.filled.topright.iphone");
    else
      v23 = CFSTR("textbox.horizontal.filled.top.iphone");
    -[PUIStyleTitleLayoutPickerButton configureWithSystemImageNamed:configuration:](v19, "configureWithSystemImageNamed:configuration:", v23, v6);
    if (a4)
    {
      v24 = *a4;
      -[PUIStyleTitleLayoutPickerButton contentImageView](v19, "contentImageView");
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
  id v3;
  void *v4;
  UIStackView *v5;
  UIStackView *stackView;
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
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;
  _QWORD v28[6];

  v28[4] = *MEMORY[0x24BDAC8D0];
  v23 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_initWeak(&location, self);
  -[PUITextLayoutPickerComponentViewController layouts](self, "layouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __54__PUITextLayoutPickerComponentViewController_loadView__block_invoke;
  v24[3] = &unk_25154C0F8;
  objc_copyWeak(&v26, &location);
  v22 = v3;
  v25 = v22;
  objc_msgSend(v4, "enumerateTextLayouts:", v24);

  -[PUITextLayoutPickerComponentViewController setCellViews:](self, "setCellViews:", v22);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObjectsFromArray:", v22);
  v5 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6DD0]), "initWithArrangedSubviews:", v21);
  stackView = self->_stackView;
  self->_stackView = v5;

  -[UIStackView setAxis:](self->_stackView, "setAxis:", 0);
  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 1);
  -[UIStackView setDistribution:](self->_stackView, "setDistribution:", 1);
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 20.0);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v23, "addSubview:", self->_stackView);
  v16 = (void *)MEMORY[0x24BDD1628];
  -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v19, 24.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v18;
  -[UIStackView trailingAnchor](self->_stackView, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v7, -24.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v8;
  -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v11;
  -[UIStackView topAnchor](self->_stackView, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateConstraints:", v15);

  -[PUITextLayoutPickerComponentViewController updateLayoutForCurrentSize](self, "updateLayoutForCurrentSize");
  -[PUITextLayoutPickerComponentViewController setView:](self, "setView:", v23);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

void __54__PUITextLayoutPickerComponentViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id *v4;
  _QWORD *WeakRetained;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14[2];

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "cellViewFor:largestItemHeight:", a2, WeakRetained + 128);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)MEMORY[0x24BDF67B8];
      v10 = MEMORY[0x24BDAC760];
      v11 = 3221225472;
      v12 = __54__PUITextLayoutPickerComponentViewController_loadView__block_invoke_2;
      v13 = &unk_25154C0D0;
      objc_copyWeak(v14, v4);
      v14[1] = a2;
      objc_msgSend(v8, "actionWithHandler:", &v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addAction:forControlEvents:", v9, 0x2000, v10, v11, v12, v13);
      if ((void *)v6[123] == a2)
      {
        objc_msgSend(v7, "setSelected:", 1);
        objc_msgSend(v6, "setSelectedCellView:", v7);
      }
      objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

      objc_destroyWeak(v14);
    }

  }
}

void __54__PUITextLayoutPickerComponentViewController_loadView__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "setSelectedLayout:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v4, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textLayoutPickerComponentViewController:didSelectTextLayout:userSelected:", v4, *(_QWORD *)(a1 + 40), 1);

    WeakRetained = v4;
  }

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUITextLayoutPickerComponentViewController;
  -[PUITextLayoutPickerComponentViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  -[PUITextLayoutPickerComponentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  if (-[PUITextLayoutPickerComponentViewController isUsingSmallerSizing](self, "isUsingSmallerSizing") != v5 <= 375.0)
  {
    self->_usingSmallerSizing = v5 <= 375.0;
    -[PUITextLayoutPickerComponentViewController updateLayoutForCurrentSize](self, "updateLayoutForCurrentSize");
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

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1628];
  -[PUITextLayoutPickerComponentViewController heightCellConstraints](self, "heightCellConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[PUITextLayoutPickerComponentViewController cellViews](self, "cellViews", 0);
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
        -[PUITextLayoutPickerComponentViewController cellHeight](self, "cellHeight");
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

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v5);
}

- (void)setselectedLayout:(unint64_t)a3
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

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->_selectedLayout != a3)
  {
    self->_selectedLayout = a3;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[PUITextLayoutPickerComponentViewController cellViews](self, "cellViews", 0);
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
            -[PUITextLayoutPickerComponentViewController selectedCellView](self, "selectedCellView");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setSelected:", 0);

            -[PUITextLayoutPickerComponentViewController setSelectedCellView:](self, "setSelectedCellView:", v10);
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

  -[PUITextLayoutPickerComponentViewController cellHeight](self, "cellHeight");
  return v2 + 48.0;
}

- (PUITextLayoutPickerComponentViewControllerDelegate)delegate
{
  return (PUITextLayoutPickerComponentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)selectedLayout
{
  return self->_selectedLayout;
}

- (void)setSelectedLayout:(unint64_t)a3
{
  self->_selectedLayout = a3;
}

- (PUITextLayoutSet)layouts
{
  return self->_layouts;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (PUIStylePickerButton)selectedCellView
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
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
