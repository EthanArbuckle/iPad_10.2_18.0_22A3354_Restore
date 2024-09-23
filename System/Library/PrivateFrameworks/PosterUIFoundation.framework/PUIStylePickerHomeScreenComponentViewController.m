@implementation PUIStylePickerHomeScreenComponentViewController

- (PUIStylePickerHomeScreenComponentViewController)initWithHomeScreenConfiguration:(id)a3
{
  id v4;
  PUIStylePickerHomeScreenComponentViewController *v5;
  uint64_t v6;
  PUIStylePickerHomeScreenConfiguration *homeScreenConfiguration;
  void *v8;
  _PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl *v9;
  _PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl *lumaSliderUICoordinatorImpl;
  PUIStyleUICoordinator *v11;
  PUIStyleUICoordinator *lumaSliderUICoordinator;
  _PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl *v13;
  _PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl *gradientColorSliderUICoordinatorImpl;
  PUIStyleUICoordinator *v15;
  PUIStyleUICoordinator *gradientColorSliderUICoordinator;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PUIStylePickerHomeScreenComponentViewController;
  v5 = -[PUIStylePickerHomeScreenComponentViewController initWithNibName:bundle:](&v18, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    homeScreenConfiguration = v5->_homeScreenConfiguration;
    v5->_homeScreenConfiguration = (PUIStylePickerHomeScreenConfiguration *)v6;

    objc_msgSend(v4, "accentStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl initWithStyle:]([_PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl alloc], "initWithStyle:", v8);
    lumaSliderUICoordinatorImpl = v5->_lumaSliderUICoordinatorImpl;
    v5->_lumaSliderUICoordinatorImpl = v9;

    v11 = -[PUIStyleUICoordinator initWithInitialStyle:suggested:coordinator:]([PUIStyleUICoordinator alloc], "initWithInitialStyle:suggested:coordinator:", v8, 0, v5->_lumaSliderUICoordinatorImpl);
    lumaSliderUICoordinator = v5->_lumaSliderUICoordinator;
    v5->_lumaSliderUICoordinator = v11;

    v13 = -[PUIStyleUICoordinatorImpl initWithStyle:]([_PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl alloc], "initWithStyle:", v8);
    gradientColorSliderUICoordinatorImpl = v5->_gradientColorSliderUICoordinatorImpl;
    v5->_gradientColorSliderUICoordinatorImpl = v13;

    v15 = -[PUIStyleUICoordinator initWithInitialStyle:suggested:coordinator:]([PUIStyleUICoordinator alloc], "initWithInitialStyle:suggested:coordinator:", v8, 0, v5->_gradientColorSliderUICoordinatorImpl);
    gradientColorSliderUICoordinator = v5->_gradientColorSliderUICoordinator;
    v5->_gradientColorSliderUICoordinator = v15;

  }
  return v5;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUIStylePickerHomeScreenComponentViewController;
  -[PUIStylePickerHomeScreenComponentViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PUIStylePickerHomeScreenComponentViewController _updateViewControllerForHomeScreenConfiguration:animated:](self, "_updateViewControllerForHomeScreenConfiguration:animated:", 0, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUIStylePickerHomeScreenComponentViewController;
  -[PUIStylePickerHomeScreenComponentViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PUIStylePickerHomeScreenComponentViewController _updateLayoutConstraints](self, "_updateLayoutConstraints");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUIStylePickerHomeScreenComponentViewController;
  -[PUIStylePickerHomeScreenComponentViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[PUIStylePickerHomeScreenComponentViewController _updateItemMarginsForHomeScreenConfiguration:](self, "_updateItemMarginsForHomeScreenConfiguration:", 0);
}

- (void)setEstimatedHeight:(double)a3
{
  -[PUIStylePickerHomeScreenComponentViewController setEstimatedHeight:notifyDelegate:](self, "setEstimatedHeight:notifyDelegate:", 1, a3);
}

- (void)setEstimatedHeight:(double)a3 notifyDelegate:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_estimatedHeight = a3;
    -[PUIStylePickerHomeScreenComponentViewController _updateLayoutConstraints](self, "_updateLayoutConstraints");
    if (v4)
      -[PUIStylePickerHomeScreenComponentViewController _notifyDelegateOfUpdatedEstimatedHeight](self, "_notifyDelegateOfUpdatedEstimatedHeight");
  }
}

- (void)_selectedHomeScreenStyleTypeDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v4 = objc_msgSend(a3, "tag");
  -[PUIStylePickerHomeScreenComponentViewController homeScreenConfiguration](self, "homeScreenConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "styleType");

  if (v6 == v4)
  {
    if (v4 == 3)
    {
      -[PUIStylePickerHomeScreenComponentViewController homeScreenConfiguration](self, "homeScreenConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "suggestedAccentColor");
      v8 = (id)objc_claimAutoreleasedReturnValue();

      -[PUIStylePickerHomeScreenComponentViewController navigateHomeScreenColorPickerSlidersToColor:animated:](self, "navigateHomeScreenColorPickerSlidersToColor:animated:", v8, 1);
    }
  }
  else
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __89__PUIStylePickerHomeScreenComponentViewController__selectedHomeScreenStyleTypeDidChange___block_invoke;
    v9[3] = &__block_descriptor_40_e54_v16__0__PUIMutableStylePickerHomeScreenConfiguration_8l;
    v9[4] = v4;
    -[PUIStylePickerHomeScreenComponentViewController _mutateHomeScreenConfiguration:](self, "_mutateHomeScreenConfiguration:", v9);
  }
}

uint64_t __89__PUIStylePickerHomeScreenComponentViewController__selectedHomeScreenStyleTypeDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStyleType:", *(_QWORD *)(a1 + 32));
}

- (void)_mutateHomeScreenConfiguration:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  if (a3)
  {
    v4 = (void (**)(id, id))a3;
    -[PUIStylePickerHomeScreenComponentViewController homeScreenConfiguration](self, "homeScreenConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = (id)objc_opt_new();
    v9 = v8;

    v4[2](v4, v9);
    -[PUIStylePickerHomeScreenComponentViewController _updateViewControllerForHomeScreenConfiguration:animated:](self, "_updateViewControllerForHomeScreenConfiguration:animated:", v9, 1);
    -[PUIStylePickerHomeScreenComponentViewController _notifyDelegateOfUpdatedHomeScreenConfiguration](self, "_notifyDelegateOfUpdatedHomeScreenConfiguration");

  }
}

- (void)navigateHomeScreenColorPickerSlidersToColor:(id)a3
{
  -[PUIStylePickerHomeScreenComponentViewController navigateHomeScreenColorPickerSlidersToColor:animated:](self, "navigateHomeScreenColorPickerSlidersToColor:animated:", a3, 0);
}

- (void)navigateHomeScreenColorPickerSlidersToColor:(id)a3 animated:(BOOL)a4
{
  id v5;
  id v6;
  void *v7;
  _PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl *v8;
  _PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl *gradientColorSliderUICoordinatorImpl;
  PUIStyleUICoordinator *v10;
  PUIStyleUICoordinator *gradientColorSliderUICoordinator;
  _PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl *v12;
  _PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl *lumaSliderUICoordinatorImpl;
  PUIStyleUICoordinator *v14;
  PUIStyleUICoordinator *lumaSliderUICoordinator;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __104__PUIStylePickerHomeScreenComponentViewController_navigateHomeScreenColorPickerSlidersToColor_animated___block_invoke;
  v16[3] = &unk_25154BB38;
  v17 = v5;
  v6 = v5;
  -[PUIStylePickerHomeScreenComponentViewController _mutateHomeScreenConfiguration:](self, "_mutateHomeScreenConfiguration:", v16);
  -[PUIStylePickerHomeScreenConfiguration accentStyle](self->_homeScreenConfiguration, "accentStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PUIStyleUICoordinatorImpl initWithStyle:]([_PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl alloc], "initWithStyle:", v7);
  gradientColorSliderUICoordinatorImpl = self->_gradientColorSliderUICoordinatorImpl;
  self->_gradientColorSliderUICoordinatorImpl = v8;

  v10 = -[PUIStyleUICoordinator initWithInitialStyle:suggested:coordinator:]([PUIStyleUICoordinator alloc], "initWithInitialStyle:suggested:coordinator:", v7, 0, self->_gradientColorSliderUICoordinatorImpl);
  gradientColorSliderUICoordinator = self->_gradientColorSliderUICoordinator;
  self->_gradientColorSliderUICoordinator = v10;

  -[PUIStyleVariationSlider setStyleCoordinator:animated:](self->_gradientColorSlider, "setStyleCoordinator:animated:", self->_gradientColorSliderUICoordinator, 1);
  v12 = -[_PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl initWithStyle:]([_PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl alloc], "initWithStyle:", v7);
  lumaSliderUICoordinatorImpl = self->_lumaSliderUICoordinatorImpl;
  self->_lumaSliderUICoordinatorImpl = v12;

  v14 = -[PUIStyleUICoordinator initWithInitialStyle:suggested:coordinator:]([PUIStyleUICoordinator alloc], "initWithInitialStyle:suggested:coordinator:", v7, 0, self->_lumaSliderUICoordinatorImpl);
  lumaSliderUICoordinator = self->_lumaSliderUICoordinator;
  self->_lumaSliderUICoordinator = v14;

  -[PUIStyleVariationSlider setStyleCoordinator:animated:](self->_lumaSlider, "setStyleCoordinator:animated:", self->_lumaSliderUICoordinator, 1);
}

void __104__PUIStylePickerHomeScreenComponentViewController_navigateHomeScreenColorPickerSlidersToColor_animated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setAccentColor:", v2);
  objc_msgSend(v3, "setStyleType:", 3);

}

- (void)_updateViewControllerForHomeScreenConfiguration:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  PUIStylePickerHomeScreenConfiguration *v6;
  PUIStylePickerHomeScreenConfiguration *homeScreenConfiguration;
  PUIStylePickerHomeScreenConfiguration *v8;
  PUIStylePickerHomeScreenConfiguration *v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *itemViews;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  PUIStylePickerHomeScreenItemView *v17;
  NSMutableArray *v18;
  NSMutableArray *v19;
  uint64_t v20;
  UIStackView *v21;
  UIStackView *homeScreenItemTypeHorizontalStackView;
  _PUIStylePickerHomeScreenVariationSlider *v23;
  PUIStyleVariationSlider *gradientColorSlider;
  void *v25;
  PUIStyleVariationSlider *lumaSlider;
  _PUIStylePickerHomeScreenVariationSlider *v27;
  PUIStyleVariationSlider *v28;
  void *v29;
  void *v30;
  UIStackView *primaryVerticalStackView;
  UIStackView *v32;
  UIStackView *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id *v39;
  id *v40;
  id v41;
  id v42;
  _BOOL4 v43;
  void *v44;
  uint64_t v45;
  _QWORD v46[4];
  uint64_t v47;
  id v48;
  _QWORD v49[4];
  uint64_t v50;
  id v51;
  _QWORD v52[5];
  _QWORD v53[6];
  BOOL v54;
  BOOL v55;
  _QWORD v56[5];
  _QWORD v57[4];
  PUIStylePickerHomeScreenConfiguration *v58;
  _QWORD v59[2];
  _OWORD v60[2];
  uint64_t v61;

  v4 = a4;
  v61 = *MEMORY[0x24BDAC8D0];
  v6 = (PUIStylePickerHomeScreenConfiguration *)a3;
  homeScreenConfiguration = self->_homeScreenConfiguration;
  if (v6)
  {
    if (-[PUIStylePickerHomeScreenConfiguration isEqual:](homeScreenConfiguration, "isEqual:", v6))
      goto LABEL_25;
    v8 = (PUIStylePickerHomeScreenConfiguration *)-[PUIStylePickerHomeScreenConfiguration copy](v6, "copy");
    v9 = self->_homeScreenConfiguration;
    self->_homeScreenConfiguration = v8;

  }
  else
  {
    v6 = homeScreenConfiguration;
  }
  v45 = -[PUIStylePickerHomeScreenConfiguration styleType](v6, "styleType");
  v10 = objc_opt_new();
  v11 = (void *)v10;
  itemViews = self->_itemViews;
  if (!itemViews)
  {
    v43 = v4;
    v44 = (void *)v10;
    v13 = (void *)objc_opt_new();
    v60[0] = xmmword_2446ACFD8;
    v60[1] = *(_OWORD *)algn_2446ACFE8;
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathWithIndexes:length:", v60, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
    {
      v15 = 0;
      do
      {
        v16 = objc_msgSend(v14, "indexAtPosition:", v15);
        v17 = objc_alloc_init(PUIStylePickerHomeScreenItemView);
        -[PUIStylePickerHomeScreenItemView addTarget:action:forControlEvents:](v17, "addTarget:action:forControlEvents:", self, sel__selectedHomeScreenStyleTypeDidChange_, 64);
        -[PUIStylePickerHomeScreenItemView setTag:](v17, "setTag:", v16);
        objc_msgSend(v13, "addObject:", v17);

        ++v15;
      }
      while (v15 < objc_msgSend(v14, "length"));
    }
    v18 = (NSMutableArray *)objc_msgSend(v13, "copy");
    v19 = self->_itemViews;
    self->_itemViews = v18;

    itemViews = self->_itemViews;
    v11 = v44;
    v4 = v43;
  }
  v20 = MEMORY[0x24BDAC760];
  v57[0] = MEMORY[0x24BDAC760];
  v57[1] = 3221225472;
  v57[2] = __108__PUIStylePickerHomeScreenComponentViewController__updateViewControllerForHomeScreenConfiguration_animated___block_invoke;
  v57[3] = &unk_25154BB60;
  v6 = v6;
  v58 = v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](itemViews, "enumerateObjectsUsingBlock:", v57);
  if (!self->_homeScreenItemTypeHorizontalStackView)
  {
    v21 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6DD0]), "initWithArrangedSubviews:", self->_itemViews);
    -[UIStackView setAxis:](v21, "setAxis:", 0);
    -[UIStackView setDistribution:](v21, "setDistribution:", 1);
    -[UIStackView setAlignment:](v21, "setAlignment:", 1);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    homeScreenItemTypeHorizontalStackView = self->_homeScreenItemTypeHorizontalStackView;
    self->_homeScreenItemTypeHorizontalStackView = v21;

  }
  -[PUIStylePickerHomeScreenComponentViewController _updateItemMarginsForHomeScreenConfiguration:](self, "_updateItemMarginsForHomeScreenConfiguration:", v6);
  objc_msgSend(v11, "bs_safeAddObject:", self->_homeScreenItemTypeHorizontalStackView);
  if (!self->_gradientColorSlider)
  {
    v23 = -[PUIStyleVariationSlider initWithStyleCoordinator:contextIdentifier:]([_PUIStylePickerHomeScreenVariationSlider alloc], "initWithStyleCoordinator:contextIdentifier:", self->_gradientColorSliderUICoordinator, CFSTR("_gradientColorSlider"));
    gradientColorSlider = self->_gradientColorSlider;
    self->_gradientColorSlider = &v23->super;

    -[PUIStyleVariationSlider setTranslatesAutoresizingMaskIntoConstraints:](self->_gradientColorSlider, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUIStyleVariationSlider addTarget:action:forControlEvents:](self->_gradientColorSlider, "addTarget:action:forControlEvents:", self, sel__accentColorSlidersDidChangeValue_, 4096);
    -[PUIStyleVariationSlider sliderGestureRecognizer](self->_gradientColorSlider, "sliderGestureRecognizer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDelegate:", self);

  }
  lumaSlider = self->_lumaSlider;
  if (!lumaSlider)
  {
    v27 = -[PUIStyleVariationSlider initWithStyleCoordinator:contextIdentifier:]([_PUIStylePickerHomeScreenVariationSlider alloc], "initWithStyleCoordinator:contextIdentifier:", self->_lumaSliderUICoordinator, CFSTR("_lumaSlider"));
    v28 = self->_lumaSlider;
    self->_lumaSlider = &v27->super;

    -[PUIStyleVariationSlider setTranslatesAutoresizingMaskIntoConstraints:](self->_lumaSlider, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUIStyleVariationSlider addTarget:action:forControlEvents:](self->_lumaSlider, "addTarget:action:forControlEvents:", self, sel__accentColorSlidersDidChangeValue_, 4096);
    -[PUIStyleVariationSlider sliderGestureRecognizer](self->_lumaSlider, "sliderGestureRecognizer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setDelegate:", self);

    lumaSlider = self->_lumaSlider;
  }
  v59[0] = self->_gradientColorSlider;
  v59[1] = lumaSlider;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v30);

  primaryVerticalStackView = self->_primaryVerticalStackView;
  if (!primaryVerticalStackView)
  {
    v32 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6DD0]), "initWithArrangedSubviews:", v11);
    -[UIStackView setAxis:](v32, "setAxis:", 1);
    -[UIStackView setDistribution:](v32, "setDistribution:", 0);
    -[UIStackView setAlignment:](v32, "setAlignment:", 0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v33 = self->_primaryVerticalStackView;
    self->_primaryVerticalStackView = v32;

    primaryVerticalStackView = self->_primaryVerticalStackView;
  }
  -[UIStackView setCustomSpacing:afterView:](primaryVerticalStackView, "setCustomSpacing:afterView:", self->_homeScreenItemTypeHorizontalStackView, 32.0);
  -[UIStackView setCustomSpacing:afterView:](self->_primaryVerticalStackView, "setCustomSpacing:afterView:", self->_gradientColorSlider, 22.0);
  if (-[PUIStylePickerHomeScreenComponentViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[UIStackView superview](self->_primaryVerticalStackView, "superview");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      v56[0] = v20;
      v56[1] = 3221225472;
      v56[2] = __108__PUIStylePickerHomeScreenComponentViewController__updateViewControllerForHomeScreenConfiguration_animated___block_invoke_2;
      v56[3] = &unk_25154BB88;
      v56[4] = self;
      objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v56);
    }
  }
  v53[0] = v20;
  v53[1] = 3221225472;
  v53[2] = __108__PUIStylePickerHomeScreenComponentViewController__updateViewControllerForHomeScreenConfiguration_animated___block_invoke_3;
  v53[3] = &unk_25154BBB0;
  v53[4] = self;
  v53[5] = v45;
  v54 = v4;
  v55 = v45 == 3;
  v35 = (void *)MEMORY[0x2495151FC](v53);
  v52[0] = v20;
  v52[1] = 3221225472;
  v52[2] = __108__PUIStylePickerHomeScreenComponentViewController__updateViewControllerForHomeScreenConfiguration_animated___block_invoke_4;
  v52[3] = &unk_25154BB88;
  v52[4] = self;
  v36 = MEMORY[0x2495151FC](v52);
  v37 = (void *)v36;
  v38 = (void *)MEMORY[0x24BDF6F90];
  if (v4)
  {
    v49[0] = v20;
    v49[1] = 3221225472;
    v49[2] = __108__PUIStylePickerHomeScreenComponentViewController__updateViewControllerForHomeScreenConfiguration_animated___block_invoke_5;
    v49[3] = &unk_25154BBD8;
    v39 = (id *)&v50;
    v50 = v36;
    v40 = &v51;
    v51 = v35;
    v41 = v37;
    objc_msgSend(v38, "animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:", 4, v49, 0, 0.3, 0.0, 0.0, 0.0);
  }
  else
  {
    v46[0] = v20;
    v46[1] = 3221225472;
    v46[2] = __108__PUIStylePickerHomeScreenComponentViewController__updateViewControllerForHomeScreenConfiguration_animated___block_invoke_6;
    v46[3] = &unk_25154BBD8;
    v39 = (id *)&v47;
    v47 = v36;
    v40 = &v48;
    v48 = v35;
    v42 = v37;
    objc_msgSend(v38, "performWithoutAnimation:", v46);
  }

LABEL_25:
}

void __108__PUIStylePickerHomeScreenComponentViewController__updateViewControllerForHomeScreenConfiguration_animated___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _OWORD v20[2];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD15D8];
  v20[0] = xmmword_2446ACFD8;
  v20[1] = *(_OWORD *)algn_2446ACFE8;
  v6 = a2;
  objc_msgSend(v5, "indexPathWithIndexes:length:", v20, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexAtPosition:", a3);

  _PUIStylePickerHomeScreenCAAssetFromPUIHomeScreenStyleType(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == 1)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.08, 0.08, 0.08, 1.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.19, 0.19, 0.19, 1.0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v18[1] = v12;
    v13 = v18;
  }
  else
  {
    if (v8 != 3)
    {
      v14 = 0;
      v10 = 0;
      goto LABEL_7;
    }
    objc_msgSend(*(id *)(a1 + 32), "accentColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.08, 0.08, 0.08, 1.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v11;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.19, 0.19, 0.19, 1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v12;
    v13 = v19;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "iconContinuousCornerRadius");
  objc_msgSend(v6, "setIconContinuousCornerRadius:");
  objc_msgSend(*(id *)(a1 + 32), "iconSize");
  objc_msgSend(v6, "setIconSize:");
  objc_msgSend(v6, "assetView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configureAssetPackageView:withColorStops:accentColor:", v15, v14, v10);

  objc_msgSend(v6, "label");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  LocalizedNSStringFromPUIHomeScreenStyle(v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v17);

}

void __108__PUIStylePickerHomeScreenComponentViewController__updateViewControllerForHomeScreenConfiguration_animated___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968));

}

uint64_t __108__PUIStylePickerHomeScreenComponentViewController__updateViewControllerForHomeScreenConfiguration_animated___block_invoke_3(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "_updateSelectionForType:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  LOBYTE(v2) = *(_BYTE *)(a1 + 49);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "setAlpha:", (double)v2);
  LOBYTE(v3) = *(_BYTE *)(a1 + 49);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setAlpha:", (double)v3);
}

uint64_t __108__PUIStylePickerHomeScreenComponentViewController__updateViewControllerForHomeScreenConfiguration_animated___block_invoke_4(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_calculateEstimatedHeight");
  objc_msgSend(v2, "setEstimatedHeight:notifyDelegate:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfUpdatedEstimatedHeight");
}

uint64_t __108__PUIStylePickerHomeScreenComponentViewController__updateViewControllerForHomeScreenConfiguration_animated___block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __108__PUIStylePickerHomeScreenComponentViewController__updateViewControllerForHomeScreenConfiguration_animated___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_updateLayoutConstraints
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  UIStackView *homeScreenItemTypeHorizontalStackView;
  UIStackView *primaryVerticalStackView;
  uint64_t v28;
  NSArray *primaryLayoutConstraints;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  PUIStyleVariationSlider *lumaSlider;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_class *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[2];
  _BYTE v56[128];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[5];
  _QWORD v60[7];

  v60[5] = *MEMORY[0x24BDAC8D0];
  if (-[PUIStylePickerHomeScreenComponentViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PUIStylePickerHomeScreenComponentViewController homeScreenConfiguration](self, "homeScreenConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "styleType");
    v50 = v3;
    objc_msgSend(v3, "iconSize");
    v6 = v5;
    v8 = v7;
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    v11 = 31.0;
    v12 = 31.0;
    if ((v10 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      -[PUIStylePickerHomeScreenComponentViewController homeScreenConfiguration](self, "homeScreenConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "layoutInsets");
      v12 = v14;
      v11 = v15;

    }
    v49 = (void *)objc_opt_new();
    v16 = (void *)objc_opt_new();
    v59[0] = CFSTR("leadingMargin");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v17;
    v59[1] = CFSTR("trailingMargin");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = v18;
    v59[2] = CFSTR("itemMinHeight");
    v19 = (void *)MEMORY[0x24BDD16E0];
    +[PUIStylePickerHomeScreenItemView defaultSizeForIconSize:](PUIStylePickerHomeScreenItemView, "defaultSizeForIconSize:", v6, v8);
    objc_msgSend(v19, "numberWithDouble:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v60[2] = v21;
    v59[3] = CFSTR("topMargin");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v60[3] = v22;
    v59[4] = CFSTR("bottomMargin");
    if (v4 == 3)
      v23 = 21;
    else
      v23 = 18;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v60[4] = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, v59, 5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    homeScreenItemTypeHorizontalStackView = self->_homeScreenItemTypeHorizontalStackView;
    v57[0] = CFSTR("homeScreenItemHorizStackView");
    v57[1] = CFSTR("primaryVerticalStackView");
    primaryVerticalStackView = self->_primaryVerticalStackView;
    v58[0] = homeScreenItemTypeHorizontalStackView;
    v58[1] = primaryVerticalStackView;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
    v28 = objc_claimAutoreleasedReturnValue();
    if (self->_primaryLayoutConstraints)
    {
      objc_msgSend(v16, "addObjectsFromArray:");
      primaryLayoutConstraints = self->_primaryLayoutConstraints;
      self->_primaryLayoutConstraints = 0;

    }
    v46 = 1032;
    v48 = v16;
    v30 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-topMargin-[primaryVerticalStackView]-bottomMargin-|"), 512, v25, v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObjectsFromArray:", v31);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-leadingMargin-[primaryVerticalStackView]-trailingMargin-|"), 512, v25, v28);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObjectsFromArray:", v32);

    v47 = (void *)v28;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[homeScreenItemHorizStackView(>=itemMinHeight)]"), 512, v25, v28);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObjectsFromArray:", v33);

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    lumaSlider = self->_lumaSlider;
    v55[0] = self->_gradientColorSlider;
    v55[1] = lumaSlider;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v52 != v38)
            objc_enumerationMutation(v35);
          v40 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v40, 7, 1, self->_primaryVerticalStackView, 7, 1.0, 0.0, v46);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v41);

          objc_msgSend(v40, "heightAnchor");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          +[PUIStyleVariationSlider defaultHeight](_PUIStylePickerHomeScreenVariationSlider, "defaultHeight");
          objc_msgSend(v42, "constraintEqualToConstant:");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v43);

        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v37);
    }

    v44 = (objc_class *)objc_msgSend(v30, "copy");
    v45 = *(Class *)((char *)&self->super.super.super.isa + v46);
    *(Class *)((char *)&self->super.super.super.isa + v46) = v44;

    objc_msgSend(v49, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.isa + v46));
    if (objc_msgSend(v48, "count"))
      objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", v48);
    if (objc_msgSend(v49, "count", v46))
      objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v49);

  }
}

- (double)_calculateEstimatedHeight
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v16;
  void *v17;
  uint64_t v18;

  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceClass");

  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "homeButtonType");

  -[PUIStylePickerHomeScreenComponentViewController homeScreenConfiguration](self, "homeScreenConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "styleType");
  objc_msgSend(v7, "iconSize");
  +[PUIStylePickerHomeScreenItemView defaultSizeForIconSize:](PUIStylePickerHomeScreenItemView, "defaultSizeForIconSize:");
  v10 = v9;
  if (v8 == 3)
  {
    +[PUIStyleVariationSlider defaultHeight](_PUIStylePickerHomeScreenVariationSlider, "defaultHeight");
    v12 = v11 + v10 + 0.0 + 32.0 + v11 + 22.0;
    v13 = 21.0;
  }
  else
  {
    v12 = v9 + 0.0;
    v13 = 18.0;
  }
  v14 = v12 + v13;
  if (v6 != 2 && v4 == 0)
    v16 = v14 + 33.0;
  else
    v16 = v14;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "userInterfaceIdiom");

  if ((v18 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v16 = v16 + 22.0;

  return v16;
}

- (double)_calculateStyleItemSpacing
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[PUIStylePickerHomeScreenComponentViewController homeScreenConfiguration](self, "homeScreenConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconSpacing");
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[PUIStylePickerHomeScreenComponentViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");

  }
  -[PUIStylePickerHomeScreenComponentViewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  UIRoundToScale();
  v9 = v8;

  return v9;
}

- (void)_updateItemMarginsForHomeScreenConfiguration:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v4 = a3;
  if (!v4)
  {
    -[PUIStylePickerHomeScreenComponentViewController homeScreenConfiguration](self, "homeScreenConfiguration");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v4;
  -[PUIStylePickerHomeScreenComponentViewController _calculateStyleItemSpacing](self, "_calculateStyleItemSpacing");
  v6 = v5;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v9 = 0.0;
    v10 = v6;
    v11 = v6;
    v12 = 0.0;
  }
  else
  {
    objc_msgSend(v13, "layoutInsets");
  }
  -[UIStackView setLayoutMargins:](self->_homeScreenItemTypeHorizontalStackView, "setLayoutMargins:", v9, v10, v12, v11);
  -[UIStackView setSpacing:](self->_homeScreenItemTypeHorizontalStackView, "setSpacing:", v6);

}

- (void)_updateSelectionForType:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  _OWORD v11[2];
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x24BDAC8D0];
  v11[0] = xmmword_2446ACFD8;
  v11[1] = *(_OWORD *)algn_2446ACFE8;
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathWithIndexes:length:", v11, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    v8 = 0;
    do
    {
      v9 = objc_msgSend(v7, "indexAtPosition:", v8);
      -[NSMutableArray objectAtIndexedSubscript:](self->_itemViews, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSelected:animated:", v9 == a3, v4);

      ++v8;
    }
    while (v8 < objc_msgSend(v7, "length"));
  }

}

- (void)_accentColorSlidersDidChangeValue:(id)a3
{
  _PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl *lumaSliderUICoordinatorImpl;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  if (self->_gradientColorSlider == a3)
  {
    -[_PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl resetSaturation](self->_gradientColorSliderUICoordinatorImpl, "resetSaturation");
    lumaSliderUICoordinatorImpl = self->_lumaSliderUICoordinatorImpl;
    -[PUIStyleUICoordinatorImpl style](self->_gradientColorSliderUICoordinatorImpl, "style");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl gradientSliderDidChange:](lumaSliderUICoordinatorImpl, "gradientSliderDidChange:", v5);

  }
  -[PUIStyleUICoordinatorImpl style](self->_lumaSliderUICoordinatorImpl, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __85__PUIStylePickerHomeScreenComponentViewController__accentColorSlidersDidChangeValue___block_invoke;
  v8[3] = &unk_25154BB38;
  v9 = v6;
  v7 = v6;
  -[PUIStylePickerHomeScreenComponentViewController _mutateHomeScreenConfiguration:](self, "_mutateHomeScreenConfiguration:", v8);

}

uint64_t __85__PUIStylePickerHomeScreenComponentViewController__accentColorSlidersDidChangeValue___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAccentStyle:", *(_QWORD *)(a1 + 32));
}

- (void)_notifyDelegateOfUpdatedHomeScreenConfiguration
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  -[PUIStylePickerHomeScreenComponentViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PUIStylePickerHomeScreenComponentViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PUIStylePickerHomeScreenComponentViewController homeScreenConfiguration](self, "homeScreenConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "homeScreenComponentViewController:didUpdateHomeScreenConfiguration:", self, v5);

  }
}

- (void)_notifyDelegateOfUpdatedEstimatedHeight
{
  void *v3;
  char v4;
  id v5;

  -[PUIStylePickerHomeScreenComponentViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PUIStylePickerHomeScreenComponentViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeScreenComponentViewControllerUpdatedEstimatedHeight:", self);

  }
}

- (BOOL)_gestureRecognizer:(id)a3 canBeCancelledByGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)_gestureRecognizer:(id)a3 canCancelGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (PUIStylePickerHomeScreenConfiguration)homeScreenConfiguration
{
  return self->_homeScreenConfiguration;
}

- (void)setHomeScreenConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (PUIStylePickerHomeScreenComponentViewControllerDelegate)delegate
{
  return (PUIStylePickerHomeScreenComponentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)estimatedHeight
{
  return self->_estimatedHeight;
}

- (unint64_t)selectedHomescreenStyleType
{
  return self->_selectedHomescreenStyleType;
}

- (void)setSelectedHomescreenStyleType:(unint64_t)a3
{
  self->_selectedHomescreenStyleType = a3;
}

- (PUIStyleVariationSlider)gradientColorSlider
{
  return self->_gradientColorSlider;
}

- (void)setGradientColorSlider:(id)a3
{
  objc_storeStrong((id *)&self->_gradientColorSlider, a3);
}

- (PUIStyleVariationSlider)lumaSlider
{
  return self->_lumaSlider;
}

- (void)setLumaSlider:(id)a3
{
  objc_storeStrong((id *)&self->_lumaSlider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lumaSlider, 0);
  objc_storeStrong((id *)&self->_gradientColorSlider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_homeScreenConfiguration, 0);
  objc_storeStrong((id *)&self->_sliderLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_primaryLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_hiddenView, 0);
  objc_storeStrong((id *)&self->_lumaSliderUICoordinatorImpl, 0);
  objc_storeStrong((id *)&self->_gradientColorSliderUICoordinatorImpl, 0);
  objc_storeStrong((id *)&self->_lumaSliderUICoordinator, 0);
  objc_storeStrong((id *)&self->_gradientColorSliderUICoordinator, 0);
  objc_storeStrong((id *)&self->_homeScreenItemTypeHorizontalStackView, 0);
  objc_storeStrong((id *)&self->_itemViews, 0);
  objc_storeStrong((id *)&self->_primaryVerticalStackView, 0);
}

@end
