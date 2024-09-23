@implementation PRComplicationGalleryDetailView

- (PRComplicationGalleryDetailView)initWithFrame:(CGRect)a3
{
  PRComplicationGalleryDetailView *v3;
  PRComplicationGalleryDetailView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PRComplicationGalleryDetailView;
  v3 = -[PRComplicationGalleryDetailView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PRComplicationGalleryDetailView _createViews](v3, "_createViews");
    -[PRComplicationGalleryDetailView _createConstraints](v4, "_createConstraints");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)PRComplicationGalleryDetailView;
  -[PRComplicationGalleryDetailView dealloc](&v4, sel_dealloc);
}

- (void)_createViews
{
  objc_class *v2;
  PRComplicationGalleryDetailView *v3;
  UIView *v4;
  UIView *containerView;
  id v6;
  void *v7;
  uint64_t v8;
  UIView *backgroundView;
  UIView *v10;
  BSUIScrollView *v11;
  BSUIScrollView *contentScrollView;
  UIStackView *v13;
  UIStackView *contentStackView;
  UIView *v15;
  UIView *headerView;
  PRComplicationGalleryApplicationTitleView *v17;
  PRComplicationGalleryApplicationTitleView *titleView;
  uint64_t v19;
  UIButton *closeButton;
  UIStackView *v21;
  UIStackView *complicationGalleryStackView;
  BSUIScrollView *v23;
  BSUIScrollView *complicationGalleryScrollView;
  UILabel *v25;
  UILabel *instructionsLabel;
  UILabel *v27;
  void *v28;
  UILabel *v29;
  void *v30;
  UILabel *v31;
  void *v32;
  void *v33;
  UIView *v34;
  UIView *footerStackSpacerView;
  UIStackView *v36;
  UIView *v37;

  v2 = (objc_class *)MEMORY[0x1E0DC3F10];
  v3 = self;
  v4 = (UIView *)objc_alloc_init(v2);
  containerView = v3->_containerView;
  v3->_containerView = v4;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3->_showsBackgroundView = 1;
  v6 = objc_alloc(MEMORY[0x1E0DC3F58]);
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "initWithEffect:", v7);
  backgroundView = v3->_backgroundView;
  v3->_backgroundView = (UIView *)v8;

  v10 = v3->_backgroundView;
  -[PRComplicationGalleryDetailView bounds](v3, "bounds");
  -[UIView setFrame:](v10, "setFrame:");
  -[UIView setAutoresizingMask:](v3->_backgroundView, "setAutoresizingMask:", 18);
  -[PRComplicationGalleryDetailView addSubview:](v3, "addSubview:", v3->_backgroundView);
  v11 = (BSUIScrollView *)objc_alloc_init(MEMORY[0x1E0D01950]);
  contentScrollView = v3->_contentScrollView;
  v3->_contentScrollView = v11;

  -[BSUIScrollView setDelegate:](v3->_contentScrollView, "setDelegate:", v3);
  -[BSUIScrollView setTranslatesAutoresizingMaskIntoConstraints:](v3->_contentScrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BSUIScrollView setShowsVerticalScrollIndicator:](v3->_contentScrollView, "setShowsVerticalScrollIndicator:", 0);
  -[BSUIScrollView setShowsHorizontalScrollIndicator:](v3->_contentScrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[BSUIScrollView setContentInsetAdjustmentBehavior:](v3->_contentScrollView, "setContentInsetAdjustmentBehavior:", 2);
  -[BSUIScrollView addSubview:](v3->_contentScrollView, "addSubview:", v3->_containerView);
  -[PRComplicationGalleryDetailView addSubview:](v3, "addSubview:", v3->_contentScrollView);
  v13 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  contentStackView = v3->_contentStackView;
  v3->_contentStackView = v13;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_contentStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](v3->_contentStackView, "setAxis:", 1);
  -[UIStackView setAlignment:](v3->_contentStackView, "setAlignment:", 0);
  -[UIView addSubview:](v3->_containerView, "addSubview:", v3->_contentStackView);
  v15 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  headerView = v3->_headerView;
  v3->_headerView = v15;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView addArrangedSubview:](v3->_contentStackView, "addArrangedSubview:", v3->_headerView);
  v17 = objc_alloc_init(PRComplicationGalleryApplicationTitleView);
  titleView = v3->_titleView;
  v3->_titleView = v17;

  -[PRComplicationGalleryApplicationTitleView setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PRComplicationGalleryApplicationTitleView setImageSize:](v3->_titleView, "setImageSize:", 32.0, 32.0);
  -[PRComplicationGalleryApplicationTitleView setContentInsets:](v3->_titleView, "setContentInsets:", 25.0, 25.0, 25.0, 25.0);
  -[UIView addSubview:](v3->_headerView, "addSubview:", v3->_titleView);
  v3->_showsCloseButton = 1;
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 7);
  v19 = objc_claimAutoreleasedReturnValue();
  closeButton = v3->_closeButton;
  v3->_closeButton = (UIButton *)v19;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_closeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton addTarget:action:forControlEvents:](v3->_closeButton, "addTarget:action:forControlEvents:", v3, sel_closeButtonTapped_, 64);
  -[PRComplicationGalleryDetailView addSubview:](v3, "addSubview:", v3->_closeButton);
  v21 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  complicationGalleryStackView = v3->_complicationGalleryStackView;
  v3->_complicationGalleryStackView = v21;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_complicationGalleryStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](v3->_complicationGalleryStackView, "setAxis:", 0);
  v23 = (BSUIScrollView *)objc_alloc_init(MEMORY[0x1E0D01950]);
  complicationGalleryScrollView = v3->_complicationGalleryScrollView;
  v3->_complicationGalleryScrollView = v23;

  -[BSUIScrollView setDelegate:](v3->_complicationGalleryScrollView, "setDelegate:", v3);
  -[BSUIScrollView setTranslatesAutoresizingMaskIntoConstraints:](v3->_complicationGalleryScrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BSUIScrollView setDecelerationRate:](v3->_complicationGalleryScrollView, "setDecelerationRate:", *MEMORY[0x1E0DC5360]);
  -[BSUIScrollView setClipsToBounds:](v3->_complicationGalleryScrollView, "setClipsToBounds:", 0);
  -[BSUIScrollView setShowsHorizontalScrollIndicator:](v3->_complicationGalleryScrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[BSUIScrollView addSubview:](v3->_complicationGalleryScrollView, "addSubview:", v3->_complicationGalleryStackView);
  -[UIStackView addArrangedSubview:](v3->_contentStackView, "addArrangedSubview:", v3->_complicationGalleryScrollView);
  v25 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  instructionsLabel = v3->_instructionsLabel;
  v3->_instructionsLabel = v25;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_instructionsLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v27 = v3->_instructionsLabel;
  -[PRComplicationGalleryDetailView _instructionsLabelFont](v3, "_instructionsLabelFont");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v27, "setFont:", v28);

  v29 = v3->_instructionsLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v29, "setTextColor:", v30);

  -[UILabel setTextAlignment:](v3->_instructionsLabel, "setTextAlignment:", 1);
  v31 = v3->_instructionsLabel;
  PRBundle();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("COMPLICATION_GALLERY_DETAIL_FOOTER_TEXT"), &stru_1E2186E08, CFSTR("PosterKit"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v31, "setText:", v33);

  -[UILabel setNumberOfLines:](v3->_instructionsLabel, "setNumberOfLines:", 0);
  -[UIStackView addArrangedSubview:](v3->_contentStackView, "addArrangedSubview:", v3->_instructionsLabel);
  v34 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  footerStackSpacerView = v3->_footerStackSpacerView;
  v3->_footerStackSpacerView = v34;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_footerStackSpacerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v36 = v3->_contentStackView;
  v37 = v3->_footerStackSpacerView;

  -[UIStackView addArrangedSubview:](v36, "addArrangedSubview:", v37);
}

- (void)_createPageControlIfNecessary
{
  UIView *v2;
  UIView *footerContainerView;
  UIPageControl *v4;
  UIPageControl *pageControl;
  UIPageControl *v6;
  void *v7;
  UIPageControl *v8;
  void *v9;
  PRComplicationGalleryDetailView *v10;

  v10 = self;
  if (-[NSArray count](v10->_pages, "count") >= 2)
  {
    v2 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    footerContainerView = v10->_footerContainerView;
    v10->_footerContainerView = v2;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v10->_footerContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRComplicationGalleryDetailView addSubview:](v10, "addSubview:", v10->_footerContainerView);
    v4 = (UIPageControl *)objc_alloc_init(MEMORY[0x1E0DC3A88]);
    pageControl = v10->_pageControl;
    v10->_pageControl = v4;

    -[UIPageControl setTranslatesAutoresizingMaskIntoConstraints:](v10->_pageControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIPageControl setNumberOfPages:](v10->_pageControl, "setNumberOfPages:", -[NSArray count](v10->_pages, "count"));
    -[UIPageControl setCurrentPage:](v10->_pageControl, "setCurrentPage:", 0);
    -[UIPageControl setHidesForSinglePage:](v10->_pageControl, "setHidesForSinglePage:", 1);
    v6 = v10->_pageControl;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPageControl setPageIndicatorTintColor:](v6, "setPageIndicatorTintColor:", v7);

    v8 = v10->_pageControl;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPageControl setCurrentPageIndicatorTintColor:](v8, "setCurrentPageIndicatorTintColor:", v9);

    -[UIPageControl addTarget:action:forControlEvents:](v10->_pageControl, "addTarget:action:forControlEvents:", v10, sel_pageControlChanged_, 4096);
    -[UIView addSubview:](v10->_footerContainerView, "addSubview:", v10->_pageControl);
  }
  -[PRComplicationGalleryDetailView _addFooterConstraints](v10, "_addFooterConstraints");

}

- (void)_createConstraints
{
  PRComplicationGalleryDetailView *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSLayoutConstraint *widgetGalleryHeightConstraint;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  UIButton *closeButton;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  PRComplicationGalleryApplicationTitleView *titleView;
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
  _QWORD v50[4];
  _QWORD v51[2];
  _QWORD v52[5];

  v52[4] = *MEMORY[0x1E0C80C00];
  v2 = self;
  v3 = PRPinViewWithinView(v2->_contentScrollView, v2);
  v4 = PRPinViewWithinView(v2->_containerView, v2->_contentScrollView);
  v5 = PRPinViewWithinView(v2->_contentStackView, v2->_containerView);
  v6 = PRPinViewWithinView(v2->_complicationGalleryScrollView, v2->_complicationGalleryStackView);
  -[BSUIScrollView contentLayoutGuide](v2->_contentScrollView, "contentLayoutGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIScrollView frameLayoutGuide](v2->_contentScrollView, "frameLayoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView heightAnchor](v2->_complicationGalleryStackView, "heightAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintGreaterThanOrEqualToConstant:", 0.0);
  v10 = objc_claimAutoreleasedReturnValue();
  widgetGalleryHeightConstraint = v2->_widgetGalleryHeightConstraint;
  v2->_widgetGalleryHeightConstraint = (NSLayoutConstraint *)v10;

  v42 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v7, "heightAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "heightAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintGreaterThanOrEqualToAnchor:", v44);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v12;
  v49 = v7;
  objc_msgSend(v7, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v8;
  objc_msgSend(v8, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v15;
  -[BSUIScrollView heightAnchor](v2->_complicationGalleryScrollView, "heightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView heightAnchor](v2->_complicationGalleryStackView, "heightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v18;
  v52[3] = v2->_widgetGalleryHeightConstraint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "activateConstraints:", v19);

  closeButton = v2->_closeButton;
  if (closeButton)
  {
    v22 = (void *)MEMORY[0x1E0CB3718];
    -[UIButton trailingAnchor](closeButton, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationGalleryDetailView trailingAnchor](v2, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, -21.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v25;
    -[UIButton topAnchor](v2->_closeButton, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationGalleryDetailView topAnchor](v2, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, 21.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activateConstraints:", v29);

  }
  titleView = v2->_titleView;
  if (titleView)
  {
    LODWORD(v20) = 1148846080;
    -[PRComplicationGalleryApplicationTitleView setContentHuggingPriority:forAxis:](titleView, "setContentHuggingPriority:forAxis:", 1, v20);
    v40 = (void *)MEMORY[0x1E0CB3718];
    -[PRComplicationGalleryApplicationTitleView leadingAnchor](v2->_titleView, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v2->_headerView, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v45);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v43;
    -[PRComplicationGalleryApplicationTitleView trailingAnchor](v2->_titleView, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v2->_headerView, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v32;
    -[PRComplicationGalleryApplicationTitleView topAnchor](v2->_titleView, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v2->_headerView, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v35;
    -[PRComplicationGalleryApplicationTitleView bottomAnchor](v2->_titleView, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v2->_headerView, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v50[3] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "activateConstraints:", v39);

  }
}

- (void)_addFooterConstraints
{
  PRComplicationGalleryDetailView *v2;
  UIPageControl *pageControl;
  void *v4;
  void *v5;
  void *v6;
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
  _QWORD v32[10];

  v32[8] = *MEMORY[0x1E0C80C00];
  v2 = self;
  pageControl = v2->_pageControl;
  if (pageControl)
  {
    v22 = (void *)MEMORY[0x1E0CB3718];
    -[UIPageControl leadingAnchor](pageControl, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v2->_containerView, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 24.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v29;
    -[UIPageControl trailingAnchor](v2->_pageControl, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v2->_containerView, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27, -24.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v26;
    -[UIPageControl topAnchor](v2->_pageControl, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v2->_footerContainerView, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v23;
    -[UIPageControl bottomAnchor](v2->_pageControl, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v2->_footerContainerView, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, -50.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v19;
    -[UIView heightAnchor](v2->_footerStackSpacerView, "heightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](v2->_footerContainerView, "heightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, 50.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32[4] = v16;
    -[UIView leadingAnchor](v2->_footerContainerView, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationGalleryDetailView leadingAnchor](v2, "leadingAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v32[5] = v5;
    -[UIView trailingAnchor](v2->_footerContainerView, "trailingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationGalleryDetailView trailingAnchor](v2, "trailingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32[6] = v8;
    -[UIView bottomAnchor](v2->_footerContainerView, "bottomAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationGalleryDetailView bottomAnchor](v2, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32[7] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activateConstraints:", v12);

  }
  else
  {
    -[UIView heightAnchor](v2->_footerStackSpacerView, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToConstant:", 50.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", 1);

  }
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    title = self->_title;
    self->_title = v4;

    -[PRComplicationGalleryDetailView _updateContent](self, "_updateContent");
  }

}

- (void)setIconImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_iconImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_iconImage, a3);
    -[PRComplicationGalleryDetailView _updateContent](self, "_updateContent");
    v5 = v6;
  }

}

- (void)setPages:(id)a3
{
  id v5;
  id v6;
  NSArray *pages;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];

  v5 = a3;
  v12 = v5;
  if (self->_pages)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRComplicationGalleryDetailView.m"), 266, CFSTR("This class doesn't support changing the pages array after it has been set."));

    v6 = v12;
    pages = self->_pages;
  }
  else
  {
    v6 = v5;
    pages = 0;
  }
  if (!-[NSArray isEqualToArray:](pages, "isEqualToArray:", v6, v12))
  {
    v8 = (NSArray *)objc_msgSend(v13, "copy");
    v9 = self->_pages;
    self->_pages = v8;

    v10 = self->_pages;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __44__PRComplicationGalleryDetailView_setPages___block_invoke;
    v14[3] = &unk_1E2183928;
    v14[4] = self;
    -[NSArray enumerateObjectsUsingBlock:](v10, "enumerateObjectsUsingBlock:", v14);
    -[PRComplicationGalleryDetailView _createPageControlIfNecessary](self, "_createPageControlIfNecessary");
    -[PRComplicationGalleryDetailView _updatePageViewControllerAppearanceForNormalScroll](self, "_updatePageViewControllerAppearanceForNormalScroll");
  }

}

void __44__PRComplicationGalleryDetailView_setPages___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 512);
  v6 = a2;
  objc_msgSend(v5, "insertArrangedSubview:atIndex:", v6, a3);
  objc_msgSend(v6, "widthAnchor");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "widthAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

}

- (void)setShowsCloseButton:(BOOL)a3
{
  if (self->_showsCloseButton != a3)
  {
    self->_showsCloseButton = a3;
    -[UIButton setHidden:](self->_closeButton, "setHidden:", !a3);
  }
}

- (void)setShowsBackgroundView:(BOOL)a3
{
  if (self->_showsBackgroundView != a3)
  {
    self->_showsBackgroundView = a3;
    -[UIView setHidden:](self->_backgroundView, "setHidden:", !a3);
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRComplicationGalleryDetailView;
  -[PRComplicationGalleryDetailView layoutSubviews](&v3, sel_layoutSubviews);
  if (!self->_performedInitialSelection)
  {
    self->_performedInitialSelection = 1;
    -[PRComplicationGalleryDetailView _scrollToPageIndex:animated:](self, "_scrollToPageIndex:animated:", 0, 0);
  }
}

- (void)_updateContent
{
  -[PRComplicationGalleryApplicationTitleView setTitle:](self->_titleView, "setTitle:", self->_title);
  -[PRComplicationGalleryApplicationTitleView setIconImage:](self->_titleView, "setIconImage:", self->_iconImage);
}

- (void)closeButtonTapped:(id)a3
{
  id v4;

  -[PRComplicationGalleryDetailView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "complicationGalleryViewDidTapClose:", self);

}

- (void)pageControlChanged:(id)a3
{
  -[PRComplicationGalleryDetailView _scrollToPageIndex:animated:](self, "_scrollToPageIndex:animated:", objc_msgSend(a3, "currentPage"), 1);
}

- (unint64_t)_pageIndexAtContentOffset:(CGPoint)a3
{
  void *v4;
  UIStackView *v5;
  UIStackView *complicationGalleryStackView;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  -[UIStackView hitTest:withEvent:](self->_complicationGalleryStackView, "hitTest:withEvent:", 0, a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    do
    {
      objc_msgSend(v4, "superview");
      v5 = (UIStackView *)objc_claimAutoreleasedReturnValue();
      complicationGalleryStackView = self->_complicationGalleryStackView;

      if (v5 == complicationGalleryStackView)
        break;
      objc_msgSend(v4, "superview");
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }
    while (v7);
  }
  -[UIStackView arrangedSubviews](self->_complicationGalleryStackView, "arrangedSubviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", v4);

  return v9;
}

- (void)_updatePageViewControllerAppearanceForNormalScroll
{
  BSUIScrollView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  _QWORD v11[5];

  v3 = self->_complicationGalleryScrollView;
  -[BSUIScrollView contentOffset](v3, "contentOffset");
  v5 = v4;
  v7 = v6;
  -[BSUIScrollView bounds](v3, "bounds");
  v9 = v8;

  v10 = -[PRComplicationGalleryDetailView _pageIndexAtContentOffset:](self, "_pageIndexAtContentOffset:", v5 + v9 * 0.5, v7);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__PRComplicationGalleryDetailView__updatePageViewControllerAppearanceForNormalScroll__block_invoke;
  v11[3] = &__block_descriptor_40_e8_B16__0Q8l;
  v11[4] = v10;
  -[PRComplicationGalleryDetailView _updatePageViewControllerAppearanceWithAppearedBlock:](self, "_updatePageViewControllerAppearanceWithAppearedBlock:", v11);
}

BOOL __85__PRComplicationGalleryDetailView__updatePageViewControllerAppearanceForNormalScroll__block_invoke(uint64_t a1, int a2)
{
  int v2;

  v2 = a2 - *(_DWORD *)(a1 + 32);
  if (v2 < 0)
    v2 = *(_DWORD *)(a1 + 32) - a2;
  return v2 < 3;
}

- (void)_updatePageViewControllerAppearanceWithAppearedBlock:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "complicationGalleryView:didUpdateVisiblePagesWithAppearedBlock:", self, v7);

  }
}

- (void)_scrollToPageIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  unint64_t v8;
  double v9;
  double v10;
  NSObject *v11;

  v4 = a4;
  -[UIStackView arrangedSubviews](self->_complicationGalleryStackView, "arrangedSubviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a3)
  {
    PRLogEditing();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PRComplicationGalleryDetailView _scrollToPageIndex:animated:].cold.1(v8, a3, v11);

  }
  else
  {
    -[PRComplicationGalleryDetailView layoutIfNeeded](self, "layoutIfNeeded");
    if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
      a3 = -[NSArray count](self->_pages, "count") + ~a3;
    -[BSUIScrollView bounds](self->_complicationGalleryScrollView, "bounds");
    v10 = v9 * (double)a3;
    -[BSUIScrollView setContentOffset:animated:](self->_complicationGalleryScrollView, "setContentOffset:animated:", v4, v10, 0.0);
    -[PRComplicationGalleryDetailView _updatePageControlForContentOffset:animated:](self, "_updatePageControlForContentOffset:animated:", v4, v10, 0.0);
  }
}

- (void)_updatePageControlForContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  double y;
  double x;
  unint64_t v7;

  y = a3.y;
  x = a3.x;
  -[PRComplicationGalleryDetailView layoutIfNeeded](self, "layoutIfNeeded", a4);
  v7 = -[PRComplicationGalleryDetailView _pageIndexAtContentOffset:](self, "_pageIndexAtContentOffset:", x, y);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:", v7);
}

- (id)_instructionsLabelFont
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC4A90];
  -[PRComplicationGalleryDetailView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", v4, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  void *v5;

  -[PRComplicationGalleryDetailView instructionsLabel](self, "instructionsLabel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRComplicationGalleryDetailView _instructionsLabelFont](self, "_instructionsLabelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  -[PRComplicationGalleryDetailView setNeedsLayout](self, "setNeedsLayout");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PRComplicationGalleryDetailView;
  v4 = a3;
  -[PRComplicationGalleryDetailView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[PRComplicationGalleryDetailView traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", v7);
  if ((v4 & 1) == 0)
    -[PRComplicationGalleryDetailView _contentSizeCategoryDidChange:](self, "_contentSizeCategoryDidChange:", 0);
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;

  -[PRComplicationGalleryDetailView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "complicationGalleryViewShouldUpdateParallax:", self);

  -[PRComplicationGalleryDetailView _updatePageViewControllerAppearanceForNormalScroll](self, "_updatePageViewControllerAppearanceForNormalScroll");
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSUInteger v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  x = a4.x;
  v19 = a3;
  -[BSUIScrollView bounds](self->_complicationGalleryScrollView, "bounds");
  v9 = v8;
  if (BSFloatIsZero())
  {
    objc_msgSend(v19, "contentOffset");
    v11 = v10;
    -[BSUIScrollView frame](self->_complicationGalleryScrollView, "frame");
    v13 = v11 + v12 * 0.5;
    objc_msgSend(v19, "contentOffset");
    v14 = -[PRComplicationGalleryDetailView _pageIndexAtContentOffset:](self, "_pageIndexAtContentOffset:", v13);
    if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
      v14 = -[NSArray count](self->_pages, "count") + ~v14;
    -[BSUIScrollView bounds](self->_complicationGalleryScrollView, "bounds");
    v16 = v15 * (double)v14;
  }
  else
  {
    v17 = a5->x / v9;
    v18 = v9 * floor(v17);
    v16 = v9 * ceil(v17);
    if (x <= 0.0)
      v16 = v18;
  }
  a5->x = v16;
  -[PRComplicationGalleryDetailView _updatePageControlForContentOffset:animated:](self, "_updatePageControlForContentOffset:animated:", 1);

}

- (PRComplicationGalleryDetailViewDelegate)delegate
{
  return (PRComplicationGalleryDetailViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (NSArray)pages
{
  return self->_pages;
}

- (BOOL)showsCloseButton
{
  return self->_showsCloseButton;
}

- (BOOL)showsBackgroundView
{
  return self->_showsBackgroundView;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (BSUIScrollView)contentScrollView
{
  return self->_contentScrollView;
}

- (void)setContentScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_contentScrollView, a3);
}

- (UIStackView)contentStackView
{
  return self->_contentStackView;
}

- (void)setContentStackView:(id)a3
{
  objc_storeStrong((id *)&self->_contentStackView, a3);
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (PRComplicationGalleryApplicationTitleView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (UIStackView)complicationGalleryStackView
{
  return self->_complicationGalleryStackView;
}

- (void)setComplicationGalleryStackView:(id)a3
{
  objc_storeStrong((id *)&self->_complicationGalleryStackView, a3);
}

- (BSUIScrollView)complicationGalleryScrollView
{
  return self->_complicationGalleryScrollView;
}

- (void)setComplicationGalleryScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_complicationGalleryScrollView, a3);
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
  objc_storeStrong((id *)&self->_pageControl, a3);
}

- (UILabel)instructionsLabel
{
  return self->_instructionsLabel;
}

- (void)setInstructionsLabel:(id)a3
{
  objc_storeStrong((id *)&self->_instructionsLabel, a3);
}

- (UIView)footerContainerView
{
  return self->_footerContainerView;
}

- (void)setFooterContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_footerContainerView, a3);
}

- (MTMaterialView)magicPocketBackgroundView
{
  return self->_magicPocketBackgroundView;
}

- (void)setMagicPocketBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_magicPocketBackgroundView, a3);
}

- (UIView)footerStackSpacerView
{
  return self->_footerStackSpacerView;
}

- (void)setFooterStackSpacerView:(id)a3
{
  objc_storeStrong((id *)&self->_footerStackSpacerView, a3);
}

- (NSLayoutConstraint)widgetGalleryHeightConstraint
{
  return self->_widgetGalleryHeightConstraint;
}

- (void)setWidgetGalleryHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_widgetGalleryHeightConstraint, a3);
}

- (BOOL)performedInitialSelection
{
  return self->_performedInitialSelection;
}

- (void)setPerformedInitialSelection:(BOOL)a3
{
  self->_performedInitialSelection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetGalleryHeightConstraint, 0);
  objc_storeStrong((id *)&self->_footerStackSpacerView, 0);
  objc_storeStrong((id *)&self->_magicPocketBackgroundView, 0);
  objc_storeStrong((id *)&self->_footerContainerView, 0);
  objc_storeStrong((id *)&self->_instructionsLabel, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_complicationGalleryScrollView, 0);
  objc_storeStrong((id *)&self->_complicationGalleryStackView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_contentScrollView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_pages, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_scrollToPageIndex:(os_log_t)log animated:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a2;
  v5 = 2048;
  v6 = a1 - 1;
  _os_log_error_impl(&dword_18B634000, log, OS_LOG_TYPE_ERROR, "Trying to scroll to a page index (%lu) outside the bounds [0 - %lu]", (uint8_t *)&v3, 0x16u);
}

@end
