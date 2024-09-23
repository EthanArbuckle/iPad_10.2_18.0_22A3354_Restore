@implementation PREditingColorPickerComponentViewController

- (PREditingColorPickerComponentViewController)initWithConfiguration:(id)a3 variationStore:(id)a4
{
  id v7;
  id v8;
  PREditingColorPickerComponentViewController *v9;
  PREditingColorPickerComponentViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PREditingColorPickerComponentViewController;
  v9 = -[PREditingColorPickerComponentViewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong((id *)&v10->_variationStore, a4);
  }

  return v10;
}

- (PREditingColorPickerComponentViewController)init
{
  PREditorColorPickerConfiguration *v3;
  PREditingColorPickerComponentViewController *v4;

  v3 = objc_alloc_init(PREditorColorPickerConfiguration);
  v4 = -[PREditingColorPickerComponentViewController initWithConfiguration:variationStore:](self, "initWithConfiguration:variationStore:", v3, 0);

  return v4;
}

- (void)loadItemsViewControllerIfNeeded
{
  unint64_t v3;
  void *v4;
  PREditingVibrantColorItemsDataSource *v5;
  PREditingPaletteColorItemsDataSource *v6;
  PREditingColorItemsAggregateDataSource *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __objc2_class **v11;
  PREditingColorItemsViewController *v12;
  PREditingColorItemsViewController *itemsViewController;
  PREditingColorItemsAggregateDataSource *v14;

  if (!self->_itemsViewController)
  {
    v3 = -[PREditorColorPickerConfiguration context](self->_configuration, "context");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 == 1)
    {
      v5 = -[PREditingVibrantColorItemsDataSource initWithConfiguration:variationStore:]([PREditingVibrantColorItemsDataSource alloc], "initWithConfiguration:variationStore:", self->_configuration, self->_variationStore);
      objc_msgSend(v4, "addObject:", v5);

    }
    v6 = -[PREditingPaletteColorItemsDataSource initWithConfiguration:variationStore:includesSuggestedColor:]([PREditingPaletteColorItemsDataSource alloc], "initWithConfiguration:variationStore:includesSuggestedColor:", self->_configuration, self->_variationStore, v3 != 1);
    objc_msgSend(v4, "addObject:", v6);

    if ((unint64_t)objc_msgSend(v4, "count") < 2)
    {
      objc_msgSend(v4, "firstObject");
      v14 = (PREditingColorItemsAggregateDataSource *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = [PREditingColorItemsAggregateDataSource alloc];
      v8 = (void *)objc_msgSend(v4, "copy");
      v14 = -[PREditingColorItemsAggregateDataSource initWithDataSources:](v7, "initWithDataSources:", v8);

    }
    if (v3 == 1
      && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "userInterfaceIdiom"),
          v9,
          (v10 & 0xFFFFFFFFFFFFFFFBLL) != 1))
    {
      v11 = off_1E21811F0;
    }
    else
    {
      v11 = off_1E21811F8;
    }
    v12 = (PREditingColorItemsViewController *)objc_msgSend(objc_alloc(*v11), "initWithDataSource:configuration:variationStore:", v14, self->_configuration, self->_variationStore);
    -[PREditingColorItemsViewController setDelegate:](v12, "setDelegate:", self);
    -[PREditingColorItemsViewController setContentsLuminance:](v12, "setContentsLuminance:", self->_contentsLuminance);
    itemsViewController = self->_itemsViewController;
    self->_itemsViewController = v12;

  }
}

- (void)loadView
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  PREditingColorSlider *v15;
  PREditingColorVariationStore *variationStore;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
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
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  _QWORD v70[5];
  _QWORD v71[3];
  void *v72;
  _QWORD v73[5];

  v73[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  if (self->_showsHeader)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    PRBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("COLOR_HEADING"), &stru_1E2186E08, CFSTR("PosterKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v6);

    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 18.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFont:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTextColor:", v8);

    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v3, "addSubview:", v4);
  }
  else
  {
    v4 = 0;
  }
  -[PREditingColorPickerComponentViewController loadItemsViewControllerIfNeeded](self, "loadItemsViewControllerIfNeeded");
  -[PREditingColorPickerComponentViewController itemsViewController](self, "itemsViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v10);
  if (-[PREditingColorPickerComponentViewController shouldShowColorItems](self, "shouldShowColorItems"))
    objc_msgSend(v10, "setHidden:", 1);
  objc_msgSend(v9, "selectedColorItem");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v67, "isFromUIKitColorPicker"))
  {
    -[PREditingColorPickerComponentViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "colorPickerComponentViewController:didSelectColorItem:userSelected:", self, v67, 0);

  }
  v68 = v10;
  if (-[PREditorColorPickerConfiguration showsSlider](self->_configuration, "showsSlider"))
  {
    v14 = v12;
    v15 = [PREditingColorSlider alloc];
    variationStore = self->_variationStore;
    -[PREditorColorPickerConfiguration identifier](self->_configuration, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PREditingColorSlider initWithVariationStore:contextIdentifier:pickerContext:](v15, "initWithVariationStore:contextIdentifier:pickerContext:", variationStore, v17, -[PREditorColorPickerConfiguration context](self->_configuration, "context"));

    v19 = (void *)v18;
    objc_msgSend(v67, "pickerColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPickerColor:", v20);

    objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel_colorSliderDidUpdateColor_, 4096);
    objc_msgSend(v9, "selectedColorItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(variationStore) = objc_msgSend(v21, "shouldShowSlider");

    if ((variationStore & 1) == 0)
      objc_msgSend(v19, "setHidden:", 1);
    objc_storeStrong((id *)&self->_sliderView, v19);
    v12 = v14;
    objc_msgSend(v14, "addObject:", v19);
    v11 = 0x1E0C99000;
  }
  else
  {
    v19 = 0;
  }
  v66 = v19;
  v62 = v12;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithArrangedSubviews:", v12);
  objc_msgSend(v22, "setAxis:", 1);
  objc_msgSend(v22, "setAlignment:", 3);
  objc_msgSend(v22, "setSpacing:", 24.0);
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_storeStrong((id *)&self->_verticalStack, v22);
  objc_msgSend(v3, "addSubview:", v22);
  -[PREditingColorPickerComponentViewController addChildViewController:](self, "addChildViewController:", v9);
  -[PREditingColorPickerComponentViewController setView:](self, "setView:", v3);
  v63 = v9;
  objc_msgSend(v9, "didMoveToParentViewController:", self);
  objc_msgSend(*(id *)(v11 + 3560), "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v3;
  v64 = v4;
  v65 = v23;
  if (self->_showsHeader)
  {
    objc_msgSend(v4, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "leadingAnchor");
    v57 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:constant:", v57, 20.0);
    v24 = objc_claimAutoreleasedReturnValue();
    v73[0] = v24;
    objc_msgSend(v4, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v55, 10.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v73[1] = v26;
    objc_msgSend(v22, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, 20.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v73[2] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObjectsFromArray:", v30);

    v31 = (void *)v24;
    v32 = (void *)v57;

    v33 = v59;
  }
  else
  {
    objc_msgSend(v22, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObjectsFromArray:", v25);
  }

  if (-[PREditorColorPickerConfiguration showsSlider](self->_configuration, "showsSlider"))
  {
    objc_msgSend(v66, "heightAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToConstant:", 34.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v35;
    objc_msgSend(v66, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, 36.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v71[1] = v38;
    objc_msgSend(v66, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, -36.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v71[2] = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 3);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "addObjectsFromArray:", v42);

  }
  objc_msgSend(v68, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v60);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v58;
  objc_msgSend(v68, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v53;
  objc_msgSend(v22, "leadingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v51);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v70[2] = v43;
  objc_msgSend(v22, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v70[3] = v46;
  objc_msgSend(v22, "bottomAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "bottomAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v70[4] = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 5);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addObjectsFromArray:", v50);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v65);
}

- (BOOL)shouldShowColorItems
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[PREditingColorPickerComponentViewController itemsViewController](self, "itemsViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorPalette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pickerColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6 < 2;
}

- (void)setContentsLuminance:(double)a3
{
  self->_contentsLuminance = a3;
  if (-[PREditingColorPickerComponentViewController isViewLoaded](self, "isViewLoaded"))
    -[PREditingColorItemsViewController setContentsLuminance:](self->_itemsViewController, "setContentsLuminance:", a3);
}

- (double)estimatedHeight
{
  double v3;
  double v4;
  void *v5;
  _BOOL4 v6;

  -[PREditingColorPickerComponentViewController loadItemsViewControllerIfNeeded](self, "loadItemsViewControllerIfNeeded");
  -[PREditingColorItemsViewController estimatedHeight](self->_itemsViewController, "estimatedHeight");
  v4 = v3;
  if (-[PREditorColorPickerConfiguration showsSlider](self->_configuration, "showsSlider"))
  {
    -[PREditingColorItemsViewController selectedColorItem](self->_itemsViewController, "selectedColorItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "shouldShowSlider") & 1) != 0)
    {
      v6 = -[PREditingColorPickerComponentViewController shouldShowColorItems](self, "shouldShowColorItems");

      if (!v6)
        return v4 + 58.0;
    }
    else
    {

    }
  }
  return v4;
}

- (void)updateForColorWellSelectedItem:(id)a3
{
  PREditingColorItemsViewController *itemsViewController;
  id v5;
  PREditingColorSlider *sliderView;
  id v7;

  itemsViewController = self->_itemsViewController;
  v5 = a3;
  -[PREditingColorItemsViewController setSelectedColorItem:](itemsViewController, "setSelectedColorItem:", v5);
  sliderView = self->_sliderView;
  objc_msgSend(v5, "pickerColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[PREditingColorSlider setPickerColor:](sliderView, "setPickerColor:", v7);
}

- (void)colorItemsViewController:(id)a3 didSelectColorItem:(id)a4
{
  void *v5;
  _BOOL8 v6;
  PREditingColorSlider *sliderView;
  void *v8;
  id v9;

  v9 = a4;
  if (objc_msgSend(v9, "shouldShowSlider"))
  {
    objc_msgSend(v9, "pickerColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }
  if (-[PREditorColorPickerConfiguration showsSlider](self->_configuration, "showsSlider")
    && v6 == -[PREditingColorSlider isHidden](self->_sliderView, "isHidden"))
  {
    -[PREditingColorPickerComponentViewController updateSliderVisibility:](self, "updateSliderVisibility:", v6);
  }
  sliderView = self->_sliderView;
  objc_msgSend(v9, "pickerColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingColorSlider setPickerColor:](sliderView, "setPickerColor:", v8);

  -[PREditingColorPickerComponentViewController didSelectColorItem:](self, "didSelectColorItem:", v9);
}

- (void)colorItemsViewController:(id)a3 didTapToResetColorItem:(id)a4
{
  PREditingColorSlider *sliderView;
  id v6;

  v6 = a4;
  if ((-[PREditingColorSlider isHidden](self->_sliderView, "isHidden") & 1) == 0)
  {
    sliderView = self->_sliderView;
    objc_msgSend(v6, "variation");
    -[PREditingColorSlider setVariation:](sliderView, "setVariation:");
    -[PREditingColorPickerComponentViewController didSelectColorItem:](self, "didSelectColorItem:", v6);
  }

}

- (void)colorItemsViewControllerDidUpdateEstimatedSize:(id)a3
{
  id v4;

  -[PREditingColorPickerComponentViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorPickerComponentViewControllerDidChangeHeight:", self);

}

- (void)updateSliderVisibility:(BOOL)a3
{
  id v4;

  -[PREditingColorSlider setHidden:](self->_sliderView, "setHidden:", !a3);
  -[PREditingColorPickerComponentViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorPickerComponentViewControllerDidChangeHeight:", self);

}

- (void)didSelectColorItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PREditingColorPickerComponentViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorPickerComponentViewController:didSelectColorItem:userSelected:", self, v4, 1);

}

- (void)colorSliderDidUpdateColor:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PREditingColorItemsViewController selectedColorItem](self->_itemsViewController, "selectedColorItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v5, "variation");
    objc_msgSend(v4, "setVariation:");
    -[PREditingColorPickerComponentViewController didSelectColorItem:](self, "didSelectColorItem:", v4);
    -[PREditingColorItemsViewController sliderDidChangeForColorItem:](self->_itemsViewController, "sliderDidChangeForColorItem:", v4);
  }

}

- (PREditingColorPickerComponentViewControllerDelegate)delegate
{
  return (PREditingColorPickerComponentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)contentsLuminance
{
  return self->_contentsLuminance;
}

- (PREditorColorPickerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (PREditingColorVariationStore)variationStore
{
  return self->_variationStore;
}

- (void)setVariationStore:(id)a3
{
  objc_storeStrong((id *)&self->_variationStore, a3);
}

- (BOOL)forFontPicker
{
  return self->_forFontPicker;
}

- (void)setForFontPicker:(BOOL)a3
{
  self->_forFontPicker = a3;
}

- (BOOL)showsHeader
{
  return self->_showsHeader;
}

- (void)setShowsHeader:(BOOL)a3
{
  self->_showsHeader = a3;
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (void)setSelectedColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedColor, a3);
}

- (UIStackView)verticalStack
{
  return self->_verticalStack;
}

- (void)setVerticalStack:(id)a3
{
  objc_storeStrong((id *)&self->_verticalStack, a3);
}

- (PREditingColorItemsViewController)itemsViewController
{
  return self->_itemsViewController;
}

- (void)setItemsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_itemsViewController, a3);
}

- (PREditingColorSlider)sliderView
{
  return self->_sliderView;
}

- (void)setSliderView:(id)a3
{
  objc_storeStrong((id *)&self->_sliderView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliderView, 0);
  objc_storeStrong((id *)&self->_itemsViewController, 0);
  objc_storeStrong((id *)&self->_verticalStack, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_storeStrong((id *)&self->_variationStore, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
