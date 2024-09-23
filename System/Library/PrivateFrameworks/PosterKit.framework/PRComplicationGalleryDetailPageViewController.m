@implementation PRComplicationGalleryDetailPageViewController

- (PRComplicationGalleryDetailPageViewController)initWithGalleryItem:(id)a3 listLayoutProvider:(id)a4 iconViewProvider:(id)a5 widgetDragHandler:(id)a6 allowedFamilies:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PRComplicationGalleryDetailPageViewController *v17;
  PRComplicationGalleryDetailPageViewController *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PRComplicationGalleryDetailPageViewController;
  v17 = -[PRComplicationGalleryDetailPageViewController init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_galleryItem, a3);
    objc_storeStrong((id *)&v18->_listLayoutProvider, a4);
    objc_storeStrong((id *)&v18->_iconViewProvider, a5);
    objc_storeStrong((id *)&v18->_widgetDragHandler, a6);
    v18->_allowedFamilies = a7;
  }

  return v18;
}

- (void)loadView
{
  void *v3;
  UIStackView *v4;
  UIStackView *stackView;
  id v6;
  PRAddWidgetDetailSheetWidgetDescriptionView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PRAddWidgetDetailSheetWidgetDescriptionView *v12;
  PRAddWidgetDetailSheetWidgetDescriptionView *descriptionView;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  UIStackView *v18;
  UIStackView *complicationsStackView;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  UIStackView *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  objc_super v49;
  _BYTE v50[128];
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v49.receiver = self;
  v49.super_class = (Class)PRComplicationGalleryDetailPageViewController;
  -[PRComplicationGalleryDetailPageViewController loadView](&v49, sel_loadView);
  -[PRComplicationGalleryDetailPageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  stackView = self->_stackView;
  self->_stackView = v4;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 3);
  objc_msgSend(v3, "addSubview:", self->_stackView);
  v6 = PRPinViewWithinView(self->_stackView, v3);
  v7 = [PRAddWidgetDetailSheetWidgetDescriptionView alloc];
  -[PRComplicationGalleryDetailPageViewController galleryItem](self, "galleryItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sbh_widgetName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRComplicationGalleryDetailPageViewController galleryItem](self, "galleryItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sbh_widgetDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PRAddWidgetDetailSheetWidgetDescriptionView initWithTitle:subtitle:](v7, "initWithTitle:subtitle:", v9, v11);
  descriptionView = self->_descriptionView;
  self->_descriptionView = v12;

  -[PRAddWidgetDetailSheetWidgetDescriptionView setTranslatesAutoresizingMaskIntoConstraints:](self->_descriptionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PRAddWidgetDetailSheetWidgetDescriptionView bs_setHitTestingDisabled:](self->_descriptionView, "bs_setHitTestingDisabled:", 1);
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_descriptionView);
  -[PRAddWidgetDetailSheetWidgetDescriptionView widthAnchor](self->_descriptionView, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v3;
  objc_msgSend(v3, "widthAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  v17 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", v17);
  v18 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  complicationsStackView = self->_complicationsStackView;
  self->_complicationsStackView = v18;

  -[UIStackView setAlignment:](self->_complicationsStackView, "setAlignment:", 4);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_complicationsStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_complicationsStackView, "setAxis:", 0);
  -[UIStackView setSpacing:](self->_complicationsStackView, "setSpacing:", 20.0);
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_complicationsStackView);
  v20 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", v20);
  v21 = (void *)MEMORY[0x1E0CB3718];
  v41 = v17;
  objc_msgSend(v17, "heightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v20;
  objc_msgSend(v20, "heightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v25);

  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __57__PRComplicationGalleryDetailPageViewController_loadView__block_invoke;
  v48[3] = &unk_1E21862B8;
  v48[4] = self;
  objc_msgSend(&unk_1E21DD1A0, "bs_filter:", v48);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v45;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v45 != v28)
          objc_enumerationMutation(obj);
        v30 = objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v29), "unsignedIntegerValue");
        v31 = objc_alloc(MEMORY[0x1E0DAA5A0]);
        -[PRComplicationGalleryDetailPageViewController galleryItem](self, "galleryItem");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRComplicationGalleryDetailPageViewController listLayoutProvider](self, "listLayoutProvider");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRComplicationGalleryDetailPageViewController iconViewProvider](self, "iconViewProvider");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_msgSend(v31, "initWithGalleryItem:titleAndSubtitleVisible:listLayoutProvider:iconViewProvider:", v32, 0, v33, v34);

        objc_msgSend(v35, "setSelectedSizeClass:", v30);
        objc_msgSend(v35, "setDelegate:", self);
        objc_msgSend(v35, "setUsesAmbientScaleFactorForRemovableBackgroundItems:", 0);
        objc_msgSend(v35, "wrapperView");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setBackgroundType:", 0);

        objc_msgSend(v35, "wrapperView");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setCornerRadius:", PRWidgetPlatterCornerRadius());

        v38 = self->_complicationsStackView;
        objc_msgSend(v35, "view");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIStackView addArrangedSubview:](v38, "addArrangedSubview:", v39);

        -[PRComplicationGalleryDetailPageViewController bs_addChildViewController:](self, "bs_addChildViewController:", v35);
        ++v29;
      }
      while (v27 != v29);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v27);
  }

}

uint64_t __57__PRComplicationGalleryDetailPageViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shouldDisplayFamily:", objc_msgSend(a2, "integerValue"));
}

- (BOOL)_shouldDisplayFamily:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;

  v5 = CHSWidgetFamilyMaskFromWidgetFamily();
  -[PRComplicationGalleryDetailPageViewController galleryItem](self, "galleryItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sbh_supportedSizeClasses") & v5;

  v8 = self->_allowedFamilies & v5;
  if (a3 == 1)
  {
    -[PRComplicationGalleryDetailPageViewController galleryItem](self, "galleryItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 0;
    if (v7 && v8)
      v11 = objc_msgSend(v9, "sbh_supportsRemovableBackground");

  }
  else
  {
    if (v7)
      v12 = v8 == 0;
    else
      v12 = 1;
    return !v12;
  }
  return v11;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PRComplicationGalleryDetailPageViewController;
  -[PRComplicationGalleryDetailPageViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[PRAddWidgetDetailSheetWidgetDescriptionView heightAnchor](self->_descriptionView, "heightAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide heightAnchor](self->_layoutGuide, "heightAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 1);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRComplicationGalleryDetailPageViewController;
  -[PRComplicationGalleryDetailPageViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[PRComplicationGalleryDetailPageViewController updateParallaxEffectInReferenceView:](self, "updateParallaxEffectInReferenceView:", self->_referenceView);
}

- (void)updateParallaxEffectInReferenceView:(id)a3
{
  id v5;
  void *v6;
  UIStackView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGAffineTransform v14;
  CGAffineTransform v15;

  v5 = a3;
  objc_storeStrong((id *)&self->_referenceView, a3);
  if (self->_referenceView)
  {
    -[PRComplicationGalleryDetailPageViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self->_complicationsStackView;
    objc_msgSend(v6, "bounds");
    objc_msgSend(v5, "convertRect:fromView:", v6);
    v10 = (v8 + v9 + v8 + v9) / (v9 + v9) + -1.0;
    -[UIStackView bounds](v7, "bounds");
    v12 = v11;
    -[UIStackView center](v7, "center");
    memset(&v15, 0, sizeof(v15));
    CGAffineTransformMakeTranslation(&v15, -(v10 * (v13 + v12 * -0.5 + 10.0)), 0.0);
    v14 = v15;
    -[UIStackView setTransform:](v7, "setTransform:", &v14);

  }
}

- (SBHWidgetDragHandling)widgetDragHandler
{
  return self->_widgetDragHandler;
}

- (id)backgroundViewMatchingMaterialBeneathWrapperViewController:(id)a3
{
  return 0;
}

- (void)iconTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "wrapperView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PRComplicationGalleryDetailPageViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "complicationGalleryDetailPageViewController:didSelectWidgetIconView:", self, v6);

  }
}

- (SBHAddWidgetSheetGalleryItem)galleryItem
{
  return self->_galleryItem;
}

- (PRComplicationGalleryDetailPageViewControllerDelegate)delegate
{
  return (PRComplicationGalleryDetailPageViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILayoutGuide)layoutGuide
{
  return self->_layoutGuide;
}

- (void)setLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_layoutGuide, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (PRAddWidgetDetailSheetWidgetDescriptionView)descriptionView
{
  return self->_descriptionView;
}

- (void)setDescriptionView:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionView, a3);
}

- (UIStackView)complicationsStackView
{
  return self->_complicationsStackView;
}

- (void)setComplicationsStackView:(id)a3
{
  objc_storeStrong((id *)&self->_complicationsStackView, a3);
}

- (UIView)referenceView
{
  return self->_referenceView;
}

- (void)setReferenceView:(id)a3
{
  objc_storeStrong((id *)&self->_referenceView, a3);
}

- (unint64_t)allowedFamilies
{
  return self->_allowedFamilies;
}

- (void)setAllowedFamilies:(unint64_t)a3
{
  self->_allowedFamilies = a3;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (void)setListLayoutProvider:(id)a3
{
  objc_storeStrong((id *)&self->_listLayoutProvider, a3);
}

- (SBIconViewProviding)iconViewProvider
{
  return self->_iconViewProvider;
}

- (void)setIconViewProvider:(id)a3
{
  objc_storeStrong((id *)&self->_iconViewProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconViewProvider, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_referenceView, 0);
  objc_storeStrong((id *)&self->_complicationsStackView, 0);
  objc_storeStrong((id *)&self->_descriptionView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_layoutGuide, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_galleryItem, 0);
  objc_storeStrong((id *)&self->_widgetDragHandler, 0);
}

@end
