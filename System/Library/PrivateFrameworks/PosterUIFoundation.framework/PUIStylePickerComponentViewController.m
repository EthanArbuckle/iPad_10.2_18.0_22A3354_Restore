@implementation PUIStylePickerComponentViewController

- (PUIStylePickerComponentViewController)initWithConfiguration:(id)a3
{
  id v5;
  PUIStylePickerComponentViewController *v6;
  PUIStylePickerComponentViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUIStylePickerComponentViewController;
  v6 = -[PUIStylePickerComponentViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configuration, a3);

  return v7;
}

- (PUIStylePickerComponentViewController)init
{
  PUIStyleConfiguration *v3;
  PUIStylePickerComponentViewController *v4;

  v3 = objc_alloc_init(PUIStyleConfiguration);
  v4 = -[PUIStylePickerComponentViewController initWithConfiguration:](self, "initWithConfiguration:", v3);

  return v4;
}

- (void)loadItemsViewControllerIfNeeded
{
  void *v3;
  uint64_t v4;
  PUIStyleItemsViewController *v5;
  PUIStyleItemsScrollableStackViewController *v6;
  PUIColorWellView *v7;
  PUIColorWellView *colorWellView;
  PUIColorWellView *v9;
  PUIColorWell *v10;
  PUIColorWell *colorWell;
  PUIStyleItemsViewController *itemsViewController;
  PUIStyleItemsDataSource *v13;

  if (!self->_itemsViewController)
  {
    v13 = -[PUIStyleItemsDataSource initWithConfiguration:includesSuggestedStyle:delegate:]([PUIStyleItemsDataSource alloc], "initWithConfiguration:includesSuggestedStyle:delegate:", self->_configuration, 1, self);
    objc_storeStrong((id *)&self->_dataSource, v13);
    if (-[PUIStyleConfiguration isForTitleStylePicker](self->_configuration, "isForTitleStylePicker")
      && (objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v4 = objc_msgSend(v3, "userInterfaceIdiom"),
          v3,
          (v4 & 0xFFFFFFFFFFFFFFFBLL) != 1))
    {
      v6 = -[PUIStyleItemsViewController initWithDataSource:configuration:]([PUIStyleItemsScrollableStackViewController alloc], "initWithDataSource:configuration:", v13, self->_configuration);
      -[PUIStyleItemsViewController setDelegate:](v6, "setDelegate:", self);
    }
    else
    {
      v5 = -[PUIStyleItemsViewController initWithDataSource:configuration:]([PUIStyleItemsViewController alloc], "initWithDataSource:configuration:", v13, self->_configuration);
      -[PUIStyleItemsViewController setDelegate:](v5, "setDelegate:", self);
      v6 = v5;
      if (-[PUIStyleConfiguration colorWellDisplayMode](self->_configuration, "colorWellDisplayMode") == 2)
      {
        -[PUIStyleItemsViewController colorWellView](v6, "colorWellView");
        v7 = (PUIColorWellView *)objc_claimAutoreleasedReturnValue();
        colorWellView = self->_colorWellView;
        self->_colorWellView = v7;
        v9 = v7;

        -[PUIColorWellView colorWell](v9, "colorWell");
        v10 = (PUIColorWell *)objc_claimAutoreleasedReturnValue();
        colorWell = self->_colorWell;
        self->_colorWell = v10;

      }
    }
    -[PUIStyleItemsViewController setContentsLuminance:](v6, "setContentsLuminance:", self->_contentsLuminance);
    itemsViewController = self->_itemsViewController;
    self->_itemsViewController = &v6->super;

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
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  PUIStyleVariationSlider *v17;
  void *v18;
  PUIStyleVariationSlider *v19;
  void *v20;
  void *v21;
  char v22;
  PUIStyleVariationSlider *v23;
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
  unint64_t v37;
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
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  PUIStyleVariationSlider *v73;
  _QWORD v74[5];
  _QWORD v75[3];
  void *v76;
  _QWORD v77[5];

  v77[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  if (self->_showsHeader)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    PUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("COLOR_HEADING"), &stru_25154D128, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v6);

    objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 18.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFont:", v7);

    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTextColor:", v8);

    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v3, "addSubview:", v4);
  }
  else
  {
    v4 = 0;
  }
  -[PUIStylePickerComponentViewController loadItemsViewControllerIfNeeded](self, "loadItemsViewControllerIfNeeded");
  -[PUIStylePickerComponentViewController itemsViewController](self, "itemsViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11 = 0x24BDBC000uLL;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v10;
  objc_msgSend(v12, "addObject:", v10);
  objc_msgSend(v9, "selectedStyleCoordinator");
  v13 = objc_claimAutoreleasedReturnValue();
  -[PUIStyleItemsDataSource firstCoordinatorPassingTest:](self->_dataSource, "firstCoordinatorPassingTest:", &__block_literal_global_7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = (void *)v13;
  if (!v13)
  {
    -[PUIStylePickerComponentViewController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "style");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stylePickerComponentViewController:didSelectStyle:isSuggestedStyle:userSelected:", self, v16, objc_msgSend(0, "isSuggested"), 0);

  }
  if (v14)
  {
    v17 = [PUIStyleVariationSlider alloc];
    -[PUIStyleConfiguration identifier](self->_configuration, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[PUIStyleVariationSlider initWithStyleCoordinator:contextIdentifier:](v17, "initWithStyleCoordinator:contextIdentifier:", v70, v18);

    -[PUIStyleVariationSlider addTarget:action:forControlEvents:](v19, "addTarget:action:forControlEvents:", self, sel_colorSliderDidUpdateVariation_, 4096);
    objc_msgSend(v9, "selectedStyleCoordinator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "style");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "allowsVariation");

    v23 = v19;
    if ((v22 & 1) == 0)
      -[PUIStyleVariationSlider setHidden:](v19, "setHidden:", 1);
    objc_storeStrong((id *)&self->_sliderView, v19);
    objc_msgSend(v12, "addObject:", v19);
    v11 = 0x24BDBC000;
  }
  else
  {
    v23 = 0;
  }
  v66 = v12;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6DD0]), "initWithArrangedSubviews:", v12);
  objc_msgSend(v24, "setAxis:", 1);
  objc_msgSend(v24, "setAlignment:", 3);
  objc_msgSend(v24, "setSpacing:", 24.0);
  objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_storeStrong((id *)&self->_verticalStack, v24);
  objc_msgSend(v3, "addSubview:", v24);
  -[PUIStylePickerComponentViewController addChildViewController:](self, "addChildViewController:", v9);
  -[PUIStylePickerComponentViewController setView:](self, "setView:", v3);
  v67 = v9;
  objc_msgSend(v9, "didMoveToParentViewController:", self);
  objc_msgSend(*(id *)(v11 + 3768), "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v3;
  v73 = v23;
  v68 = v4;
  if (self->_showsHeader)
  {
    objc_msgSend(v4, "leadingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "leadingAnchor");
    v64 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:constant:", v64, 20.0);
    v60 = objc_claimAutoreleasedReturnValue();
    v77[0] = v60;
    objc_msgSend(v4, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, 10.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v77[1] = v28;
    objc_msgSend(v24, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, 20.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v77[2] = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v77, 3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v25;
    objc_msgSend(v25, "addObjectsFromArray:", v32);

    v34 = (void *)v60;
    v35 = v62;

    v36 = (void *)v64;
    v23 = v73;
  }
  else
  {
    objc_msgSend(v24, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v34;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v76, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v25;
    objc_msgSend(v25, "addObjectsFromArray:", v26);
  }
  v69 = v33;

  v37 = 0x24BDBC000;
  if (v23)
  {
    -[PUIStyleVariationSlider heightAnchor](v73, "heightAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUIStyleVariationSlider defaultHeight](PUIStyleVariationSlider, "defaultHeight");
    objc_msgSend(v38, "constraintEqualToConstant:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = v39;
    -[PUIStyleVariationSlider leadingAnchor](v73, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:constant:", v41, 36.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v75[1] = v42;
    -[PUIStyleVariationSlider trailingAnchor](v73, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44, -36.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v75[2] = v45;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v75, 3);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "addObjectsFromArray:", v46);

    v37 = 0x24BDBC000uLL;
  }
  objc_msgSend(v71, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v63);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v61;
  objc_msgSend(v71, "trailingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v57;
  objc_msgSend(v24, "leadingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "leadingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v55);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v74[2] = v47;
  objc_msgSend(v24, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "trailingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v74[3] = v50;
  objc_msgSend(v24, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v74[4] = v53;
  objc_msgSend(*(id *)(v37 + 3632), "arrayWithObjects:count:", v74, 5);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "addObjectsFromArray:", v54);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v69);
}

uint64_t __49__PUIStylePickerComponentViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsVariation");

  return v3;
}

- (BOOL)shouldShowContentStyleItems
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[PUIStylePickerComponentViewController itemsViewController](self, "itemsViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stylePalette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "styles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6 < 2;
}

- (void)setContentsLuminance:(double)a3
{
  self->_contentsLuminance = a3;
  if (-[PUIStylePickerComponentViewController isViewLoaded](self, "isViewLoaded"))
    -[PUIStyleItemsViewController setContentsLuminance:](self->_itemsViewController, "setContentsLuminance:", a3);
}

- (double)estimatedHeight
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  _BOOL4 v7;

  -[PUIStylePickerComponentViewController loadItemsViewControllerIfNeeded](self, "loadItemsViewControllerIfNeeded");
  -[PUIStyleItemsViewController estimatedHeight](self->_itemsViewController, "estimatedHeight");
  v4 = v3;
  if (self->_sliderView)
  {
    -[PUIStyleItemsViewController selectedStyleCoordinator](self->_itemsViewController, "selectedStyleCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "style");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "allowsVariation") & 1) != 0)
    {
      v7 = -[PUIStylePickerComponentViewController shouldShowContentStyleItems](self, "shouldShowContentStyleItems");

      if (!v7)
        return v4 + 58.0;
    }
    else
    {

    }
  }
  return v4;
}

- (void)updateSliderVisibility:(BOOL)a3
{
  id v4;

  -[PUIStyleVariationSlider setHidden:](self->_sliderView, "setHidden:", !a3);
  -[PUIStylePickerComponentViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stylePickerComponentViewControllerDidChangeHeight:", self);

}

- (void)_didSelectContentStyle:(id)a3 isSuggestedStyle:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[PUIStylePickerComponentViewController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stylePickerComponentViewController:didSelectStyle:isSuggestedStyle:userSelected:", self, v6, v4, 1);

}

- (void)colorSliderDidUpdateVariation:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[PUIStyleItemsViewController selectedStyleCoordinator](self->_itemsViewController, "selectedStyleCoordinator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "style");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStylePickerComponentViewController _didSelectContentStyle:isSuggestedStyle:](self, "_didSelectContentStyle:isSuggestedStyle:", v5, objc_msgSend(v6, "isSuggested"));

    v4 = v6;
  }

}

- (void)styleItemsViewController:(id)a3 didSelectContentStyleCoordinator:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a4;
  objc_msgSend(v5, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "allowsVariation");

  -[PUIStyleItemsDataSource firstCoordinatorPassingTest:](self->_dataSource, "firstCoordinatorPassingTest:", &__block_literal_global_18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (_DWORD)v7 == -[PUIStyleVariationSlider isHidden](self->_sliderView, "isHidden"))
    -[PUIStylePickerComponentViewController updateSliderVisibility:](self, "updateSliderVisibility:", v7);
  -[PUIStyleVariationSlider setStyleCoordinator:](self->_sliderView, "setStyleCoordinator:", v5);
  objc_msgSend(v5, "style");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isSuggested");

  -[PUIStylePickerComponentViewController _didSelectContentStyle:isSuggestedStyle:](self, "_didSelectContentStyle:isSuggestedStyle:", v10, v9);
}

uint64_t __99__PUIStylePickerComponentViewController_styleItemsViewController_didSelectContentStyleCoordinator___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsVariation");

  return v3;
}

- (void)styleItemsViewControllerDidUpdateEstimatedSize:(id)a3
{
  id v4;

  -[PUIStylePickerComponentViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stylePickerComponentViewControllerDidChangeHeight:", self);

}

- (id)stylePickerComponentViewController:(id)a3 coordinatorForStyle:(id)a4 isSuggested:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;

  v5 = a5;
  v7 = a4;
  -[PUIStylePickerComponentViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stylePickerComponentViewController:coordinatorForStyle:isSuggested:", self, v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)stylePickerComponentViewController:(id)a3 didSelectStyle:(id)a4 isSuggestedStyle:(BOOL)a5 userSelected:(BOOL)a6
{
  _BOOL8 v6;
  void *v8;
  id v9;
  id v10;

  v6 = a5;
  v10 = a4;
  -[PUIStylePickerComponentViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "stylePickerComponentViewController:coordinatorForStyle:isSuggested:", self, v10, v6);

}

- (void)stylePickerComponentViewControllerDidChangeHeight:(id)a3
{
  id v4;

  -[PUIStylePickerComponentViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stylePickerComponentViewControllerDidChangeHeight:", self);

}

- (id)coordinatorForStyle:(id)a3 isSuggestedStyle:(BOOL)a4 fromDataSource:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;

  v5 = a4;
  v7 = a3;
  -[PUIStylePickerComponentViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stylePickerComponentViewController:coordinatorForStyle:isSuggested:", self, v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)contentsLuminance
{
  return self->_contentsLuminance;
}

- (PUIStyleUICoordinator)uiKitColorPickerContentStyleCoordinator
{
  return self->_uiKitColorPickerContentStyleCoordinator;
}

- (PUIStyleConfiguration)styleConfiguration
{
  return self->_styleConfiguration;
}

- (PUIColorWellView)colorWellView
{
  return self->_colorWellView;
}

- (PUIColorWell)colorWell
{
  return self->_colorWell;
}

- (PUIStylePickerComponentViewControllerDelegate)delegate
{
  return (PUIStylePickerComponentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PUIStyleConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (PUIStyleItemsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
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

- (PUIStyleItemsViewController)itemsViewController
{
  return self->_itemsViewController;
}

- (void)setItemsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_itemsViewController, a3);
}

- (PUIStyleVariationSlider)sliderView
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
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_colorWell, 0);
  objc_storeStrong((id *)&self->_colorWellView, 0);
  objc_storeStrong((id *)&self->_styleConfiguration, 0);
  objc_storeStrong((id *)&self->_uiKitColorPickerContentStyleCoordinator, 0);
}

@end
