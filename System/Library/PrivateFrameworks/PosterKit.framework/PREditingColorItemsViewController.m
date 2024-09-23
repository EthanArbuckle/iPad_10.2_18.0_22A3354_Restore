@implementation PREditingColorItemsViewController

- (PREditingColorItemsViewController)initWithDataSource:(id)a3 configuration:(id)a4 variationStore:(id)a5
{
  id v9;
  id v10;
  id v11;
  PREditingColorItemsViewController *v12;
  PREditingColorItemsViewController *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PREditingColorItem *v17;
  uint64_t v18;
  PREditorColorPickerVibrantColor *v19;
  double v20;
  PREditorColorPickerVibrantColor *v21;
  PREditingColorItem *selectedColorItem;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PREditingColorItemsViewController;
  v12 = -[PREditingColorItemsViewController initWithNibName:bundle:](&v24, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataSource, a3);
    objc_storeStrong((id *)&v13->_configuration, a4);
    objc_storeStrong((id *)&v13->_variationStore, a5);
    objc_msgSend(v10, "selectedColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v10, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v10, "context");
      -[PREditingColorItemsViewController selectedColorItemForColor:fromVariationStore:inDataSource:contextIdentifier:isDataLayerPicker:](v13, "selectedColorItemForColor:fromVariationStore:inDataSource:contextIdentifier:isDataLayerPicker:", v14, v11, v9, v15, v16 == 1);
      v17 = (PREditingColorItem *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        -[PREditingColorItemsViewController selectedColorItemForColor:fromDataSource:withVariationStore:contextIdentifier:isDataLayerPicker:](v13, "selectedColorItemForColor:fromDataSource:withVariationStore:contextIdentifier:isDataLayerPicker:", v14, v9, v11, v15, v16 == 1);
        v17 = (PREditingColorItem *)objc_claimAutoreleasedReturnValue();
      }

      if (v17)
        goto LABEL_14;
    }
    else
    {
      -[PREditingColorItemsDataSource colorItemForIndex:](v13->_dataSource, "colorItemForIndex:", 0);
      v17 = (PREditingColorItem *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
LABEL_14:
        selectedColorItem = v13->_selectedColorItem;
        v13->_selectedColorItem = v17;

        goto LABEL_15;
      }
    }
    if (objc_msgSend(v10, "context") == 1)
    {
      v18 = objc_msgSend(v14, "preferredStyle");
      v19 = [PREditorColorPickerVibrantColor alloc];
      v20 = 0.0;
      if (v18 == 1)
        v20 = 1.0;
    }
    else
    {
      v19 = [PREditorColorPickerConstantColor alloc];
      v20 = 0.0;
    }
    v21 = -[PREditorColorPickerVibrantColor initWithColor:initialVariation:](v19, "initWithColor:initialVariation:", v14, v20);
    v17 = -[PREditingColorItem initWithPickerColor:variation:context:]([PREditingColorItem alloc], "initWithPickerColor:variation:context:", v21, -[PREditorColorPickerConfiguration context](v13->_configuration, "context"), 0.0);
    -[PREditingColorItem setFromUIKitColorPicker:](v17, "setFromUIKitColorPicker:", 1);

    goto LABEL_14;
  }
LABEL_15:

  return v13;
}

- (id)selectedColorItemForColor:(id)a3 fromVariationStore:(id)a4 inDataSource:(id)a5 contextIdentifier:(id)a6 isDataLayerPicker:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  PRPosterColor *v17;
  __objc2_class *v18;
  PREditingColorItem *v19;
  id v20;
  void *v21;
  PREditingColorItem *v22;
  double v23;
  uint64_t v24;
  void *v25;
  double v27;

  v7 = a7;
  v12 = a5;
  v27 = 0.0;
  v13 = a6;
  v14 = a4;
  objc_msgSend(a3, "color");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "baseColorForVariedColor:forContextIdentifier:variation:forDataLayerPicker:", v15, v13, &v27, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = -[PRPosterColor initWithColor:]([PRPosterColor alloc], "initWithColor:", v16);
    if (-[PREditorColorPickerConfiguration context](self->_configuration, "context") == 1)
      v18 = PREditorColorPickerVibrantColor;
    else
      v18 = PREditorColorPickerConstantColor;
    v20 = [v18 alloc];
    v21 = (void *)objc_msgSend(v20, "initWithColor:initialVariation:", v17, v27);
    v22 = [PREditingColorItem alloc];
    objc_msgSend(v21, "initialVariation");
    v19 = -[PREditingColorItem initWithPickerColor:variation:context:](v22, "initWithPickerColor:variation:context:", v21, -[PREditorColorPickerConfiguration context](self->_configuration, "context"), v23);
    v24 = objc_msgSend(v12, "indexForItem:", v19);
    if (v24 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[PREditingColorItem setFromUIKitColorPicker:](v19, "setFromUIKitColorPicker:", 1);
    }
    else
    {
      objc_msgSend(v12, "colorItemForIndex:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditingColorItem setShowsSlider:](v19, "setShowsSlider:", objc_msgSend(v25, "shouldShowSlider"));

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)selectedColorItemForColor:(id)a3 fromDataSource:(id)a4 withVariationStore:(id)a5 contextIdentifier:(id)a6 isDataLayerPicker:(BOOL)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  PREditingColorItem *v26;
  double v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __133__PREditingColorItemsViewController_selectedColorItemForColor_fromDataSource_withVariationStore_contextIdentifier_isDataLayerPicker___block_invoke;
  v31[3] = &unk_1E2184AE8;
  v15 = v12;
  v32 = v15;
  v16 = v13;
  v33 = v16;
  v17 = v10;
  v34 = v17;
  objc_msgSend(v11, "firstColorItemPassingTest:", v31);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    v29[0] = v14;
    v29[1] = 3221225472;
    v29[2] = __133__PREditingColorItemsViewController_selectedColorItemForColor_fromDataSource_withVariationStore_contextIdentifier_isDataLayerPicker___block_invoke_2;
    v29[3] = &unk_1E2184B10;
    v19 = v17;
    v30 = v19;
    objc_msgSend(v11, "firstColorItemPassingTest:", v29);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = v20;
      objc_msgSend(v20, "pickerColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "isVibrantColor"))
      {
        objc_msgSend(v19, "color");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 1.0;
        objc_msgSend(v23, "getWhite:alpha:", 0, &v28);
        objc_msgSend(v22, "variationForAlpha:", v28);
      }
      else
      {
        objc_msgSend(v19, "hslValues");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "luminance");
        objc_msgSend(v22, "variationForLuminance:");
      }
      v25 = v24;

      v26 = -[PREditingColorItem initWithPickerColor:variation:context:]([PREditingColorItem alloc], "initWithPickerColor:variation:context:", v22, 0, v25);
    }

  }
  return v18;
}

uint64_t __133__PREditingColorItemsViewController_selectedColorItemForColor_fromDataSource_withVariationStore_contextIdentifier_isDataLayerPicker___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  char v10;
  int v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(v3, "pickerColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "variationForPickerColor:forContextIdentifier:", v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initialVariation");
  if (v5)
    objc_msgSend(v5, "doubleValue");
  v7 = v6;
  objc_msgSend(v3, "pickerColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "colorWithVariation:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 48));
  if ((objc_msgSend(*(id *)(a1 + 48), "isVibrantMaterialColor") & 1) != 0)
    v11 = 0;
  else
    v11 = objc_msgSend(*(id *)(a1 + 48), "isVibrantMonochromeColor") ^ 1;
  objc_msgSend(v9, "colorValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "colorValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if ((v10 & 1) != 0)
    v15 = 1;
  else
    v15 = v11 & v14;

  return v15;
}

uint64_t __133__PREditingColorItemsViewController_selectedColorItemForColor_fromDataSource_withVariationStore_contextIdentifier_isDataLayerPicker___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  objc_msgSend(a2, "pickerColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isCustomColor") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "baseColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "hslValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hslValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isVibrantColor"))
    {
      objc_msgSend(v6, "hue");
      v9 = v8;
      objc_msgSend(v7, "hue");
      if (v9 == v10)
      {
        objc_msgSend(v6, "saturation");
        v12 = v11;
        objc_msgSend(v7, "saturation");
        if (v12 == v13)
        {
          objc_msgSend(v6, "luminance");
          v15 = v14;
          objc_msgSend(v7, "luminance");
          if (v15 == v16)
            goto LABEL_9;
        }
      }
    }
    objc_msgSend(v6, "hue");
    v18 = v17;
    objc_msgSend(v7, "hue");
    if (v18 == v19 && (objc_msgSend(v6, "saturation"), v21 = v20, objc_msgSend(v7, "saturation"), v21 == v22))
LABEL_9:
      v4 = 1;
    else
      v4 = 0;

  }
  return v4;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PREditingColorItemsViewController;
  -[PREditingColorItemsViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PREditingColorItemsViewController setupItemViews](self, "setupItemViews");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PREditingColorItemsViewController;
  -[PREditingColorItemsViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[PREditingColorItemsViewController updateLayoutForCurrentSize](self, "updateLayoutForCurrentSize");
}

- (void)setupItemViews
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  PREditingColorItemView *v6;
  void *v7;
  NSArray *v8;
  NSArray *allItemViews;
  NSArray *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *allViews;
  NSArray *v17;
  id v18;
  void *v19;

  -[PREditingColorItemsViewController selectedColorItem](self, "selectedColorItem");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PREditingColorItemsDataSource numberOfItems](self->_dataSource, "numberOfItems");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 >= 1)
  {
    v4 = 0;
    do
    {
      -[PREditingColorItemsDataSource colorItemForIndex:](self->_dataSource, "colorItemForIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PREditingColorItemView initWithColorItem:]([PREditingColorItemView alloc], "initWithColorItem:", v5);
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_didTapColorItem_);
      -[PREditingColorItemView addGestureRecognizer:](v6, "addGestureRecognizer:", v7);
      if (objc_msgSend(v5, "isEqual:", v18))
      {
        -[PRSelectableEditingItemView setSelected:](v6, "setSelected:", 1);
        -[PREditingColorItemsViewController setSelectedColorItemView:](self, "setSelectedColorItemView:", v6);
      }
      -[PREditingColorItemView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v19, "addObject:", v6);
      ++v4;

    }
    while (v3 != v4);
  }
  v8 = (NSArray *)objc_msgSend(v19, "copy");
  allItemViews = self->_allItemViews;
  self->_allItemViews = v8;

  -[PREditingColorItemsViewController updateVibrantMaterialItemForLuminance](self, "updateVibrantMaterialItemForLuminance");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v19);
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (-[PREditorColorPickerConfiguration colorWellDisplayMode](self->_configuration, "colorWellDisplayMode") == 1)
  {
    v11 = objc_alloc(MEMORY[0x1E0D7FCB8]);
    v12 = (void *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v12, "colorWell");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel_colorWellDidUpdateColor_, 4096);
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[NSArray addObject:](v10, "addObject:", v12);
    objc_storeStrong((id *)&self->_colorWell, v13);
    if (-[PREditingColorItem isFromUIKitColorPicker](self->_selectedColorItem, "isFromUIKitColorPicker"))
    {
      -[PREditingColorItem displayColor](self->_selectedColorItem, "displayColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "color");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSelectedColor:", v15);

    }
  }
  allViews = self->_allViews;
  self->_allViews = v10;
  v17 = v10;

  -[PREditingColorItemsViewController layoutWithItemViews:](self, "layoutWithItemViews:", v17);
}

- (void)didTapColorItem:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isSelected") & 1) != 0)
  {
    objc_msgSend(v4, "pickerColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "initialVariation");
    objc_msgSend(v4, "setVariation:");

    objc_msgSend(v6, "updateForChangedColor");
    -[PREditingColorItemsViewController didTapToResetColorItem:](self, "didTapToResetColorItem:", v4);
  }
  else
  {
    -[PREditingColorItemsViewController setSelectedColorItem:](self, "setSelectedColorItem:", v4);
    -[PREditingColorItemsViewController didSelectColorItem:](self, "didSelectColorItem:", v4);
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

  -[PREditingColorItemsViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v16);

  v20 = v16;
  -[UIStackView leadingAnchor](v16, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingColorItemsViewController view](self, "view");
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
  -[PREditingColorItemsViewController view](self, "view");
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
  -[PREditingColorItemsViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v32;
  -[UIStackView topAnchor](v16, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingColorItemsViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v37);
  -[PREditingColorItemsViewController updateLayoutForCurrentSize](self, "updateLayoutForCurrentSize");

}

- (void)updateLayoutForCurrentSize
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
  -[PREditingColorItemsViewController view](self, "view");
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

    -[PREditingColorItemsViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "colorItemsViewControllerDidUpdateEstimatedSize:", self);

  }
  if (v5 != self->_configuredViewWidth)
  {
    -[PREditingColorItemsViewController stackViewLeadingConstraint](self, "stackViewLeadingConstraint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constant");
    v16 = v15;
    -[PREditingColorItemsViewController stackViewTrailingConstraint](self, "stackViewTrailingConstraint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constant");
    v19 = v16 - v18;

    if (v5 + -264.0 >= v19)
      v20 = 31.0;
    else
      v20 = (v5 + -264.0) * 0.5;
    -[PREditingColorItemsViewController stackViewLeadingConstraint](self, "stackViewLeadingConstraint", (_QWORD)v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20 >= 0.0)
      v23 = v20;
    else
      v23 = 0.0;
    objc_msgSend(v21, "setConstant:", v23);

    -[PREditingColorItemsViewController stackViewTrailingConstraint](self, "stackViewTrailingConstraint");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setConstant:", fmin(-v20, 0.0));

    self->_configuredViewWidth = v5;
  }
}

- (double)estimatedHeight
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[PREditingColorItemsDataSource numberOfItems](self->_dataSource, "numberOfItems");
  if (-[PREditorColorPickerConfiguration colorWellDisplayMode](self->_configuration, "colorWellDisplayMode") == 1)
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
  if (-[PREditingColorItemsViewController isViewLoaded](self, "isViewLoaded"))
    -[PREditingColorItemsViewController updateVibrantMaterialItemForLuminance](self, "updateVibrantMaterialItemForLuminance");
}

- (void)updateVibrantMaterialItemForLuminance
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PREditingColorItemsDataSource firstColorItemPassingTest:](self->_dataSource, "firstColorItemPassingTest:", &__block_literal_global_15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    objc_msgSend(v3, "pickerColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContentsLuminance:", self->_contentsLuminance);
    -[NSArray objectAtIndex:](self->_allItemViews, "objectAtIndex:", -[PREditingColorItemsDataSource indexForItem:](self->_dataSource, "indexForItem:", v6));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateForChangedColor");

    v3 = v6;
  }

}

uint64_t __74__PREditingColorItemsViewController_updateVibrantMaterialItemForLuminance__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "color");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVibrantMonochromeColor");

  return v3;
}

- (void)didSelectColorItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PREditingColorItemsViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorItemsViewController:didSelectColorItem:", self, v4);

}

- (void)didTapToResetColorItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PREditingColorItemsViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorItemsViewController:didTapToResetColorItem:", self, v4);

}

- (void)deselectSelectedColor
{
  PREditingColorItemView *selectedColorItemView;
  PREditingColorItem *selectedColorItem;

  -[PRSelectableEditingItemView setSelected:](self->_selectedColorItemView, "setSelected:", 0);
  selectedColorItemView = self->_selectedColorItemView;
  self->_selectedColorItemView = 0;

  selectedColorItem = self->_selectedColorItem;
  self->_selectedColorItem = 0;

  -[PUIColorWell setSelectedColor:](self->_colorWell, "setSelectedColor:", 0);
  -[PUIColorWell invalidateIntrinsicContentSize](self->_colorWell, "invalidateIntrinsicContentSize");
  -[PUIColorWellView setNeedsLayout](self->_colorWellView, "setNeedsLayout");
}

- (void)setSelectedColorItem:(id)a3
{
  id v5;
  PREditingColorItemView *selectedColorItemView;
  uint64_t v7;
  PREditingColorItemView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PREditingColorVariationStore *variationStore;
  PREditingColorItemView *v14;
  PREditingColorItemView *v15;
  id v16;

  v5 = a3;
  v16 = v5;
  if (!v5)
    goto LABEL_5;
  if (objc_msgSend(v5, "isFromUIKitColorPicker"))
  {
    -[PRSelectableEditingItemView setSelected:](self->_selectedColorItemView, "setSelected:", 0);
    selectedColorItemView = self->_selectedColorItemView;
    self->_selectedColorItemView = 0;

    objc_storeStrong((id *)&self->_selectedColorItem, a3);
    goto LABEL_11;
  }
  v7 = -[PREditingColorItemsDataSource indexForItem:](self->_dataSource, "indexForItem:", v16);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    -[PREditingColorItemsViewController deselectSelectedColor](self, "deselectSelectedColor");
    goto LABEL_11;
  }
  -[NSArray objectAtIndexedSubscript:](self->_allItemViews, "objectAtIndexedSubscript:", v7);
  v8 = (PREditingColorItemView *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_selectedColorItem, a3);
  -[PREditingColorItemsViewController configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "pickerColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[PREditingColorVariationStore variationForPickerColor:forContextIdentifier:](self->_variationStore, "variationForPickerColor:forContextIdentifier:", v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      variationStore = self->_variationStore;
      objc_msgSend(v11, "initialVariation");
      -[PREditingColorVariationStore setVariation:forPickerColor:forContextIdentifier:](variationStore, "setVariation:forPickerColor:forContextIdentifier:", v11, v10);
    }

  }
  -[PRSelectableEditingItemView setSelected:](self->_selectedColorItemView, "setSelected:", 0);
  v14 = self->_selectedColorItemView;
  self->_selectedColorItemView = v8;
  v15 = v8;

  -[PRSelectableEditingItemView setSelected:](v15, "setSelected:", 1);
LABEL_11:

}

- (void)colorWellDidUpdateColor:(id)a3
{
  PREditingColorItemView *selectedColorItemView;
  id v5;
  PREditingColorItemView *v6;
  void *v7;
  void *v8;
  PRPosterColor *v9;
  void *v10;
  PRPosterColor *v11;
  unint64_t v12;
  double v13;
  __objc2_class **v14;
  PREditingColorItem *v15;
  double v16;
  PREditingColorItem *v17;
  void *v18;
  void *v19;
  void *v20;
  PREditingColorVariationStore *variationStore;
  id v22;

  selectedColorItemView = self->_selectedColorItemView;
  v5 = a3;
  -[PRSelectableEditingItemView setSelected:](selectedColorItemView, "setSelected:", 0);
  v6 = self->_selectedColorItemView;
  self->_selectedColorItemView = 0;

  -[PREditingColorItemsViewController colorWell](self, "colorWell");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateIntrinsicContentSize");

  -[PREditingColorItemsViewController colorWellView](self, "colorWellView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsLayout");

  v9 = [PRPosterColor alloc];
  objc_msgSend(v5, "selectedColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[PRPosterColor initWithColor:](v9, "initWithColor:", v10);
  v12 = -[PREditorColorPickerConfiguration context](self->_configuration, "context");
  if (v12 == 1)
    v13 = 1.0;
  else
    v13 = 0.0;
  v14 = off_1E2181358;
  if (v12 != 1)
    v14 = off_1E2181350;
  v22 = (id)objc_msgSend(objc_alloc(*v14), "initWithColor:initialVariation:", v11, v13);
  v15 = [PREditingColorItem alloc];
  objc_msgSend(v22, "initialVariation");
  v17 = -[PREditingColorItem initWithPickerColor:variation:context:](v15, "initWithPickerColor:variation:context:", v22, -[PREditorColorPickerConfiguration context](self->_configuration, "context"), v16);
  -[PREditingColorItem setFromUIKitColorPicker:](v17, "setFromUIKitColorPicker:", 1);
  objc_storeStrong((id *)&self->_selectedColorItem, v17);
  -[PREditingColorItemsViewController configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[PREditingColorVariationStore variationForPickerColor:forContextIdentifier:](self->_variationStore, "variationForPickerColor:forContextIdentifier:", v22, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    variationStore = self->_variationStore;
    objc_msgSend(v22, "initialVariation");
    -[PREditingColorVariationStore setVariation:forPickerColor:forContextIdentifier:](variationStore, "setVariation:forPickerColor:forContextIdentifier:", v22, v19);
  }
  -[PREditingColorItemsViewController didSelectColorItem:](self, "didSelectColorItem:", v17);

}

- (void)sliderDidChangeForColorItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  PUIColorWell *colorWell;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v11 = v4;
    if (self->_colorWell)
    {
      v6 = objc_msgSend(v4, "isFromUIKitColorPicker");
      v5 = v11;
      if (v6)
      {
        colorWell = self->_colorWell;
        objc_msgSend(v11, "color");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "color");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUIColorWell setSelectedColor:](colorWell, "setSelectedColor:", v9);
LABEL_9:

        goto LABEL_10;
      }
    }
    if (self->_selectedColorItemView)
    {
      objc_msgSend(v5, "baseColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditingColorItem baseColor](self->_selectedColorItem, "baseColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqual:", v9) & 1) == 0)
        goto LABEL_9;
      objc_msgSend(v11, "itemView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v11;
      if (!v10)
      {
        -[PREditingColorItemView updateForChangedColor](self->_selectedColorItemView, "updateForChangedColor");
LABEL_10:
        v5 = v11;
      }
    }
  }

}

- (PREditingColorItemsViewControllerDelegate)delegate
{
  return (PREditingColorItemsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PREditingColorItem)selectedColorItem
{
  return self->_selectedColorItem;
}

- (PREditingColorItemView)selectedColorItemView
{
  return self->_selectedColorItemView;
}

- (void)setSelectedColorItemView:(id)a3
{
  objc_storeStrong((id *)&self->_selectedColorItemView, a3);
}

- (PREditorColorPickerConfiguration)configuration
{
  return self->_configuration;
}

- (double)contentsLuminance
{
  return self->_contentsLuminance;
}

- (PREditingColorItemsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (PREditingColorVariationStore)variationStore
{
  return self->_variationStore;
}

- (void)setVariationStore:(id)a3
{
  objc_storeStrong((id *)&self->_variationStore, a3);
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

- (PUIColorWellView)colorWellView
{
  return self->_colorWellView;
}

- (void)setColorWellView:(id)a3
{
  objc_storeStrong((id *)&self->_colorWellView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorWellView, 0);
  objc_storeStrong((id *)&self->_colorWell, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_horizontalStackViews, 0);
  objc_storeStrong((id *)&self->_stackViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_allViews, 0);
  objc_storeStrong((id *)&self->_allItemViews, 0);
  objc_storeStrong((id *)&self->_variationStore, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_selectedColorItemView, 0);
  objc_storeStrong((id *)&self->_selectedColorItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
