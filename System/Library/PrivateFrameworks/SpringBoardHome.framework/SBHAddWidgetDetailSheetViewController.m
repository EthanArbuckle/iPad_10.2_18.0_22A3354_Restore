@implementation SBHAddWidgetDetailSheetViewController

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)SBHAddWidgetDetailSheetViewController;
  -[SBHAddWidgetDetailSheetViewController loadView](&v10, sel_loadView);
  -[SBHAddWidgetDetailSheetViewController _createViews](self, "_createViews");
  -[SBHAddWidgetDetailSheetViewController _createConstraints](self, "_createConstraints");
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)-[SBHAddWidgetDetailSheetViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v4, sel__contentSizeCategoryDidChange);

  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)-[SBHAddWidgetDetailSheetViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v7, sel__updateBackgroundRecipe);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__contentSizeCategoryDidChange, *MEMORY[0x1E0DC48E8], 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)SBHAddWidgetDetailSheetViewController;
  -[SBHAddWidgetDetailSheetViewController dealloc](&v4, sel_dealloc);
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  NSObject *v4;
  SBHApplicationWidgetCollection *applicationWidgetCollection;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  SBHApplicationWidgetCollection *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)SBHAddWidgetDetailSheetViewController;
  -[SBHAddWidgetDetailSheetViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  SBLogWidgets();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    applicationWidgetCollection = self->_applicationWidgetCollection;
    *(_DWORD *)buf = 138543362;
    v9 = applicationWidgetCollection;
    _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_DEFAULT, "Presenting add widget detail sheet for applicationWidgetCollection: %{public}@", buf, 0xCu);
  }

  if (!self->_performedInitialSelection)
  {
    self->_performedInitialSelection = 1;
    -[SBHAddWidgetDetailSheetViewController _scrollToPageIndex:animated:](self, "_scrollToPageIndex:animated:", self->_initialSelectionIndex, 0);
    -[SBHAddWidgetDetailSheetViewController scrollViewDidScroll:](self, "scrollViewDidScroll:", self->_widgetGalleryScrollView);
  }
  -[SBHAddWidgetDetailSheetViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNavigationBarHidden:", 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHAddWidgetDetailSheetViewController;
  -[SBHAddWidgetDetailSheetViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SBHWidgetSearchController updateSearchBarBackgroundForScrollDistance:forClient:](self->_externalSearchController, "updateSearchBarBackgroundForScrollDistance:forClient:", self, 2.22507386e-308);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;
  _QWORD v9[5];

  height = a3.height;
  width = a3.width;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __92__SBHAddWidgetDetailSheetViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E8D85400;
  v9[4] = self;
  v7 = a4;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, 0);
  v8.receiver = self;
  v8.super_class = (Class)SBHAddWidgetDetailSheetViewController;
  -[SBHAddWidgetDetailSheetViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

uint64_t __92__SBHAddWidgetDetailSheetViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateConstraintConstants");
}

- (void)updateViewConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHAddWidgetDetailSheetViewController;
  -[SBHAddWidgetDetailSheetViewController updateViewConstraints](&v3, sel_updateViewConstraints);
  -[SBHAddWidgetDetailSheetViewController _updateConstraintConstants](self, "_updateConstraintConstants");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHAddWidgetDetailSheetViewController;
  -[SBHAddWidgetDetailSheetViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[SBHAddWidgetDetailSheetViewController _updateLayoutMargins](self, "_updateLayoutMargins");
}

- (void)_createViews
{
  SBHAddWidgetDetailSheetViewController *v2;
  void *v3;
  UIView *v4;
  UIView *containerView;
  uint64_t v6;
  MTMaterialView *backgroundView;
  MTMaterialView *v8;
  BSUIScrollView *v9;
  BSUIScrollView *contentScrollView;
  UIStackView *v11;
  UIStackView *contentStackView;
  UIView *v13;
  UIView *headerView;
  void *v15;
  double v16;
  double v17;
  SBHAddWidgetDetailSheetTitleView *v18;
  SBHAddWidgetDetailSheetTitleView *titleView;
  void *v20;
  void *v21;
  uint64_t v22;
  UIButton *closeButton;
  UIStackView *v24;
  UIStackView *widgetInfoStackView;
  BSUIScrollView *v26;
  BSUIScrollView *widgetInfoScrollView;
  UIStackView *v28;
  UIStackView *widgetGalleryStackView;
  BSUIScrollView *v30;
  BSUIScrollView *widgetGalleryScrollView;
  NSMutableArray *v32;
  NSMutableArray *pages;
  char v34;
  void *v35;
  void *v36;
  uint64_t i;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  int8x8_t v43;
  _QWORD *v44;
  SBHAddWidgetDetailSheetViewController *v45;
  void *v46;
  uint8x8_t v47;
  int v48;
  unint64_t v49;
  SBHAddWidgetDetailSheetWidgetDescriptionView *v50;
  void *v51;
  void *v52;
  SBHAddWidgetDetailSheetWidgetDescriptionView *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  MTMaterialView *magicPocketBackgroundView;
  MTMaterialView *v62;
  UIView *v63;
  UIView *addButtonStackSpacerView;
  UIView *v65;
  UIView *addButtonContainerView;
  SBHAddWidgetButton *v67;
  SBHAddWidgetButton *addButton;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  UIPageControl *v74;
  UIPageControl *pageControl;
  UIPageControl *v76;
  void *v77;
  UIPageControl *v78;
  void *v79;
  id obj;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char v85;
  uint64_t v86;
  _QWORD v87[2];
  void (*v88)(uint64_t, uint64_t, int);
  void *v89;
  void *v90;
  SBHAddWidgetDetailSheetViewController *v91;
  uint64_t v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint64_t v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  uint64_t v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  char v114;
  _BYTE v115[128];
  uint64_t v116;

  v2 = self;
  v116 = *MEMORY[0x1E0C80C00];
  -[SBHAddWidgetDetailSheetViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  containerView = v2->_containerView;
  v2->_containerView = v4;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v2->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v83 = -[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](v2, "addWidgetSheetStyle");
  if (v83 != 1)
  {
    v6 = -[SBHAddWidgetDetailSheetViewController _newBackgroundView](v2, "_newBackgroundView");
    backgroundView = v2->_backgroundView;
    v2->_backgroundView = (MTMaterialView *)v6;

    v8 = v2->_backgroundView;
    objc_msgSend(v3, "bounds");
    -[MTMaterialView setFrame:](v8, "setFrame:");
    -[MTMaterialView setAutoresizingMask:](v2->_backgroundView, "setAutoresizingMask:", 18);
    objc_msgSend(v3, "addSubview:", v2->_backgroundView);
    -[SBHAddWidgetDetailSheetViewController _updateMaterialRecipeForBackgroundView:](v2, "_updateMaterialRecipeForBackgroundView:", v2->_backgroundView);
  }
  v9 = (BSUIScrollView *)objc_alloc_init(MEMORY[0x1E0D01950]);
  contentScrollView = v2->_contentScrollView;
  v2->_contentScrollView = v9;

  -[BSUIScrollView setDelegate:](v2->_contentScrollView, "setDelegate:", v2);
  -[BSUIScrollView setTranslatesAutoresizingMaskIntoConstraints:](v2->_contentScrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BSUIScrollView setShowsVerticalScrollIndicator:](v2->_contentScrollView, "setShowsVerticalScrollIndicator:", 0);
  -[BSUIScrollView setShowsHorizontalScrollIndicator:](v2->_contentScrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[BSUIScrollView setContentInsetAdjustmentBehavior:](v2->_contentScrollView, "setContentInsetAdjustmentBehavior:", 2);
  -[BSUIScrollView addSubview:](v2->_contentScrollView, "addSubview:", v2->_containerView);
  objc_msgSend(v3, "addSubview:", v2->_contentScrollView);
  v11 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  contentStackView = v2->_contentStackView;
  v2->_contentStackView = v11;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v2->_contentStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](v2->_contentStackView, "setAxis:", 1);
  -[UIStackView setAlignment:](v2->_contentStackView, "setAlignment:", 0);
  -[UIView addSubview:](v2->_containerView, "addSubview:", v2->_contentStackView);
  v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  headerView = v2->_headerView;
  v2->_headerView = v13;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v2->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView addArrangedSubview:](v2->_contentStackView, "addArrangedSubview:", v2->_headerView);
  if (!-[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](v2, "addWidgetSheetStyle"))
  {
    -[SBHAddWidgetDetailSheetViewController traitCollection](v2, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "displayScale");
    v17 = v16;

    v18 = -[SBHAddWidgetDetailSheetTitleView initWithIconImageInfo:contentInsets:]([SBHAddWidgetDetailSheetTitleView alloc], "initWithIconImageInfo:contentInsets:", 30.0, 30.0, v17, 7.0, 21.0, 21.0, 21.0, 21.0);
    titleView = v2->_titleView;
    v2->_titleView = v18;

    -[SBHAddWidgetDetailSheetTitleView setTranslatesAutoresizingMaskIntoConstraints:](v2->_titleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBHAddWidgetDetailSheetViewController applicationWidgetCollection](v2, "applicationWidgetCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHAddWidgetSheetViewControllerBase appCellConfigurator](v2, "appCellConfigurator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "configureCell:withApplicationWidgetCollection:", v2->_titleView, v20);

    -[UIView addSubview:](v2->_headerView, "addSubview:", v2->_titleView);
  }
  if (v83 != 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 7);
    v22 = objc_claimAutoreleasedReturnValue();
    closeButton = v2->_closeButton;
    v2->_closeButton = (UIButton *)v22;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v2->_closeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](v2->_closeButton, "addTarget:action:forControlEvents:", v2, sel_closeButtonTapped_, 64);
    objc_msgSend(v3, "addSubview:", v2->_closeButton);
  }
  v24 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  widgetInfoStackView = v2->_widgetInfoStackView;
  v2->_widgetInfoStackView = v24;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v2->_widgetInfoStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](v2->_widgetInfoStackView, "setAxis:", 0);
  -[UIStackView setAlignment:](v2->_widgetInfoStackView, "setAlignment:", 0);
  v26 = (BSUIScrollView *)objc_alloc_init(MEMORY[0x1E0D01950]);
  widgetInfoScrollView = v2->_widgetInfoScrollView;
  v2->_widgetInfoScrollView = v26;

  -[BSUIScrollView setDelegate:](v2->_widgetInfoScrollView, "setDelegate:", v2);
  -[BSUIScrollView setTranslatesAutoresizingMaskIntoConstraints:](v2->_widgetInfoScrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BSUIScrollView setPagingEnabled:](v2->_widgetInfoScrollView, "setPagingEnabled:", 1);
  -[BSUIScrollView setShowsHorizontalScrollIndicator:](v2->_widgetInfoScrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[BSUIScrollView addSubview:](v2->_widgetInfoScrollView, "addSubview:", v2->_widgetInfoStackView);
  -[UIStackView addArrangedSubview:](v2->_contentStackView, "addArrangedSubview:", v2->_widgetInfoScrollView);
  v28 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  widgetGalleryStackView = v2->_widgetGalleryStackView;
  v2->_widgetGalleryStackView = v28;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v2->_widgetGalleryStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setSpacing:](v2->_widgetGalleryStackView, "setSpacing:", 0.0);
  -[UIStackView setAxis:](v2->_widgetGalleryStackView, "setAxis:", 0);
  v30 = (BSUIScrollView *)objc_alloc_init(MEMORY[0x1E0D01950]);
  widgetGalleryScrollView = v2->_widgetGalleryScrollView;
  v2->_widgetGalleryScrollView = v30;

  -[BSUIScrollView setDelegate:](v2->_widgetGalleryScrollView, "setDelegate:", v2);
  -[BSUIScrollView setTranslatesAutoresizingMaskIntoConstraints:](v2->_widgetGalleryScrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BSUIScrollView setDecelerationRate:](v2->_widgetGalleryScrollView, "setDecelerationRate:", *MEMORY[0x1E0DC5360]);
  -[BSUIScrollView setClipsToBounds:](v2->_widgetGalleryScrollView, "setClipsToBounds:", 0);
  -[BSUIScrollView setShowsHorizontalScrollIndicator:](v2->_widgetGalleryScrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[BSUIScrollView _setInterpageSpacing:](v2->_widgetGalleryScrollView, "_setInterpageSpacing:", 0.0, 0.0);
  -[BSUIScrollView _setTouchInsets:](v2->_widgetGalleryScrollView, "_setTouchInsets:", 0.0, -0.0, 0.0, -0.0);
  -[BSUIScrollView addSubview:](v2->_widgetGalleryScrollView, "addSubview:", v2->_widgetGalleryStackView);
  -[UIStackView addArrangedSubview:](v2->_contentStackView, "addArrangedSubview:", v2->_widgetGalleryScrollView);
  v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  pages = v2->_pages;
  v2->_pages = v32;

  -[SBHAddWidgetSheetViewControllerBase allowedWidgets](v2, "allowedWidgets");
  v85 = v34;
  v82 = -[SBHAddWidgetSheetViewControllerBase allowedWidgets](v2, "allowedWidgets");
  v81 = -[SBHAddWidgetSheetViewControllerBase widgetWrapperViewControllerBackgroundType](v2, "widgetWrapperViewControllerBackgroundType");
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  -[SBHAddWidgetDetailSheetViewController applicationWidgetCollection](v2, "applicationWidgetCollection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "widgetDescriptors");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v36;
  v86 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v110, v115, 16);
  if (v86)
  {
    v84 = *(_QWORD *)v111;
    do
    {
      for (i = 0; i != v86; ++i)
      {
        if (*(_QWORD *)v111 != v84)
          objc_enumerationMutation(obj);
        v38 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * i);
        if ((v85 & 1) != 0
          || objc_msgSend(*(id *)(*((_QWORD *)&v110 + 1) + 8 * i), "sbh_canBeAddedToStack"))
        {
          -[SBHAddWidgetDetailSheetViewController applicationWidgetCollection](v2, "applicationWidgetCollection");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "isDisfavored");

          v41 = -[SBHAddWidgetSheetViewControllerBase addWidgetSheetLocation](v2, "addWidgetSheetLocation");
          v109 = 0;
          v107 = 0u;
          v108 = 0u;
          v105 = 0u;
          v106 = 0u;
          v103 = 0u;
          v104 = 0u;
          v102 = 0u;
          -[SBHAddWidgetSheetViewControllerBase addWidgetSheetMetrics](v2, "addWidgetSheetMetrics");
          if (v40)
            v42 = objc_msgSend(v38, "sbh_disfavoredSizeClassesForAddWidgetSheetLocation:", v41);
          else
            v42 = objc_msgSend(v38, "sbh_favoredSizeClassesForAddWidgetSheetLocation:", v41);
          v43 = (int8x8_t)(v42 & v82);
          v87[0] = MEMORY[0x1E0C809B0];
          v87[1] = 3221225472;
          v88 = __53__SBHAddWidgetDetailSheetViewController__createViews__block_invoke;
          v89 = &unk_1E8D8DC88;
          v90 = v38;
          v91 = v2;
          v92 = v81;
          v93 = v83;
          v98 = v106;
          v99 = v107;
          v100 = v108;
          v101 = v109;
          v94 = v102;
          v95 = v103;
          v96 = v104;
          v97 = v105;
          v44 = v87;
          if (v43)
          {
            v45 = v2;
            v46 = v3;
            v114 = 0;
            v47 = (uint8x8_t)vcnt_s8(v43);
            v47.i16[0] = vaddlv_u8(v47);
            v48 = v47.i32[0];
            if (v47.i32[0])
            {
              v49 = 0;
              do
              {
                if (((1 << v49) & *(_QWORD *)&v43) != 0)
                {
                  ((void (*)(_QWORD *))v88)(v44);
                  if (v114)
                    break;
                  --v48;
                }
                if (v49 > 0x3E)
                  break;
                ++v49;
              }
              while (v48 > 0);
            }
            v3 = v46;
            v2 = v45;
          }

          v50 = [SBHAddWidgetDetailSheetWidgetDescriptionView alloc];
          objc_msgSend(v38, "sbh_widgetName");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "sbh_widgetDescription");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = -[SBHAddWidgetDetailSheetWidgetDescriptionView initWithTitle:subtitle:](v50, "initWithTitle:subtitle:", v51, v52);

          -[SBHAddWidgetDetailSheetViewController _materialViewForVisualStyling](v2, "_materialViewForVisualStyling");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "visualStylingProviderForCategory:", 1);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBHAddWidgetDetailSheetWidgetDescriptionView descriptionLabel](v53, "descriptionLabel");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "automaticallyUpdateView:withStyle:", v56, 2);

          -[SBHAddWidgetDetailSheetWidgetDescriptionView setTranslatesAutoresizingMaskIntoConstraints:](v53, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[UIStackView addArrangedSubview:](v2->_widgetInfoStackView, "addArrangedSubview:", v53);
          -[SBHAddWidgetDetailSheetWidgetDescriptionView widthAnchor](v53, "widthAnchor");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "widthAnchor");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "constraintEqualToAnchor:", v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "setActive:", 1);

        }
      }
      v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v115, 16);
    }
    while (v86);
  }

  objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 54);
  v60 = objc_claimAutoreleasedReturnValue();
  magicPocketBackgroundView = v2->_magicPocketBackgroundView;
  v2->_magicPocketBackgroundView = (MTMaterialView *)v60;

  v62 = v2->_magicPocketBackgroundView;
  -[UIView bounds](v2->_addButtonContainerView, "bounds");
  -[MTMaterialView setFrame:](v62, "setFrame:");
  -[MTMaterialView setAutoresizingMask:](v2->_magicPocketBackgroundView, "setAutoresizingMask:", 18);
  -[MTMaterialView setGroupNameBase:](v2->_magicPocketBackgroundView, "setGroupNameBase:", CFSTR("Add-Sheet"));
  -[UIView addSubview:](v2->_addButtonContainerView, "addSubview:", v2->_magicPocketBackgroundView);
  -[SBHAddWidgetDetailSheetViewController _updateMaterialRecipeForBackgroundView:](v2, "_updateMaterialRecipeForBackgroundView:", v2->_magicPocketBackgroundView);
  v63 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  addButtonStackSpacerView = v2->_addButtonStackSpacerView;
  v2->_addButtonStackSpacerView = v63;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v2->_addButtonStackSpacerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView addArrangedSubview:](v2->_contentStackView, "addArrangedSubview:", v2->_addButtonStackSpacerView);
  v65 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  addButtonContainerView = v2->_addButtonContainerView;
  v2->_addButtonContainerView = v65;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v2->_addButtonContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](v2->_addButtonStackSpacerView, "addSubview:", v2->_addButtonContainerView);
  v67 = objc_alloc_init(SBHAddWidgetButton);
  addButton = v2->_addButton;
  v2->_addButton = v67;

  -[SBHAddWidgetButton setAddWidgetSheetStyle:](v2->_addButton, "setAddWidgetSheetStyle:", v83);
  -[SBHAddWidgetButton setTranslatesAutoresizingMaskIntoConstraints:](v2->_addButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SBHAddWidgetButton addTarget:action:forControlEvents:](v2->_addButton, "addTarget:action:forControlEvents:", v2, sel_addButtonTapped_, 64);
  -[UIView addSubview:](v2->_addButtonContainerView, "addSubview:", v2->_addButton);
  -[SBHApplicationWidgetCollection widgetDescriptors](v2->_applicationWidgetCollection, "widgetDescriptors");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "firstObject");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHAddWidgetButton backgroundView](v2->_addButton, "backgroundView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "mostInterestingColor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (v72)
  {
    objc_msgSend(v71, "setBackgroundColor:", v72);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setBackgroundColor:", v73);

  }
  if ((unint64_t)-[NSMutableArray count](v2->_pages, "count") >= 2)
  {
    v74 = (UIPageControl *)objc_alloc_init(MEMORY[0x1E0DC3A88]);
    pageControl = v2->_pageControl;
    v2->_pageControl = v74;

    -[UIPageControl setTranslatesAutoresizingMaskIntoConstraints:](v2->_pageControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIPageControl setNumberOfPages:](v2->_pageControl, "setNumberOfPages:", -[NSMutableArray count](v2->_pages, "count"));
    -[UIPageControl setCurrentPage:](v2->_pageControl, "setCurrentPage:", 0);
    -[UIPageControl setHidesForSinglePage:](v2->_pageControl, "setHidesForSinglePage:", 1);
    v76 = v2->_pageControl;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPageControl setPageIndicatorTintColor:](v76, "setPageIndicatorTintColor:", v77);

    v78 = v2->_pageControl;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPageControl setCurrentPageIndicatorTintColor:](v78, "setCurrentPageIndicatorTintColor:", v79);

    -[UIPageControl addTarget:action:forControlEvents:](v2->_pageControl, "addTarget:action:forControlEvents:", v2, sel_pageControlChanged_, 4096);
    -[UIView addSubview:](v2->_addButtonContainerView, "addSubview:", v2->_pageControl);
  }

}

void __53__SBHAddWidgetDetailSheetViewController__createViews__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  SBHWidgetWrapperViewController *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  SBHWidgetWrapperViewController *v9;
  SBHAddWidgetDetailsSheetPageViewController *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[7];
  uint64_t v15;

  v5 = [SBHWidgetWrapperViewController alloc];
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "listLayoutProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "iconViewProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBHWidgetWrapperViewController initWithGalleryItem:titleAndSubtitleVisible:listLayoutProvider:iconViewProvider:](v5, "initWithGalleryItem:titleAndSubtitleVisible:listLayoutProvider:iconViewProvider:", v6, 0, v7, v8);

  if (objc_msgSend(*(id *)(a1 + 40), "addWidgetSheetLocation") == 2)
    -[SBHWidgetWrapperViewController setUsesAmbientScaleFactorForRemovableBackgroundItems:](v9, "setUsesAmbientScaleFactorForRemovableBackgroundItems:", 1);
  -[SBHWidgetWrapperViewController setSelectedSizeClass:](v9, "setSelectedSizeClass:", a3);
  -[SBHWidgetWrapperViewController setBackgroundType:](v9, "setBackgroundType:", *(_QWORD *)(a1 + 48));
  v10 = -[SBHAddWidgetDetailsSheetPageViewController initWithWidgetWrapperViewController:]([SBHAddWidgetDetailsSheetPageViewController alloc], "initWithWidgetWrapperViewController:", v9);
  -[SBHAddWidgetDetailsSheetPageViewController setAddWidgetSheetStyle:](v10, "setAddWidgetSheetStyle:", *(_QWORD *)(a1 + 56));
  v11 = *(_OWORD *)(a1 + 144);
  v14[4] = *(_OWORD *)(a1 + 128);
  v14[5] = v11;
  v14[6] = *(_OWORD *)(a1 + 160);
  v15 = *(_QWORD *)(a1 + 176);
  v12 = *(_OWORD *)(a1 + 80);
  v14[0] = *(_OWORD *)(a1 + 64);
  v14[1] = v12;
  v13 = *(_OWORD *)(a1 + 112);
  v14[2] = *(_OWORD *)(a1 + 96);
  v14[3] = v13;
  -[SBHAddWidgetDetailsSheetPageViewController setAddWidgetSheetMetrics:](v10, "setAddWidgetSheetMetrics:", v14);
  -[SBHAddWidgetDetailsSheetPageViewController setDelegate:](v10, "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1400), "addObject:", v10);
  objc_msgSend(*(id *)(a1 + 40), "_addPage:", v10);

}

- (void)_createConstraints
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *widgetGalleryHeightConstraint;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSLayoutConstraint *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  SBHAddWidgetDetailSheetTitleView *titleView;
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
  NSLayoutConstraint *v46;
  NSLayoutConstraint *topSpacingConstraint;
  NSLayoutConstraint *v48;
  BOOL v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  UIPageControl *pageControl;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSLayoutConstraint *v71;
  NSLayoutConstraint *addButtonBottomConstraint;
  UIPageControl *v73;
  void *v74;
  void *v75;
  NSLayoutConstraint *v76;
  NSLayoutConstraint *addButtonTopConstraint;
  void *v78;
  void *v79;
  NSLayoutConstraint *v80;
  NSLayoutConstraint *pageControlTopConstraint;
  void *v82;
  NSLayoutConstraint *v83;
  NSLayoutConstraint *v84;
  void *v85;
  NSLayoutConstraint *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  _QWORD v113[4];
  _QWORD v114[2];
  _QWORD v115[2];
  _QWORD v116[2];
  _QWORD v117[2];
  _QWORD v118[3];
  _QWORD v119[2];
  _QWORD v120[7];

  v120[5] = *MEMORY[0x1E0C80C00];
  -[SBHAddWidgetDetailSheetViewController view](self, "view");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SBHPinViewWithinView(self->_contentScrollView, v112);
  v4 = SBHPinViewWithinView(self->_containerView, self->_contentScrollView);
  v5 = SBHPinViewWithinView(self->_contentStackView, self->_containerView);
  v6 = SBHPinViewWithinView(self->_widgetInfoScrollView, self->_widgetInfoStackView);
  v7 = SBHPinViewWithinView(self->_widgetGalleryScrollView, self->_widgetGalleryStackView);
  -[BSUIScrollView contentLayoutGuide](self->_contentScrollView, "contentLayoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIScrollView frameLayoutGuide](self->_contentScrollView, "frameLayoutGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView heightAnchor](self->_widgetGalleryStackView, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintGreaterThanOrEqualToConstant:", 0.0);
  v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  widgetGalleryHeightConstraint = self->_widgetGalleryHeightConstraint;
  self->_widgetGalleryHeightConstraint = v11;

  v97 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v8, "heightAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "heightAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "constraintGreaterThanOrEqualToAnchor:", v104);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v120[0] = v101;
  v108 = v8;
  objc_msgSend(v8, "widthAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = v9;
  objc_msgSend(v9, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v120[1] = v14;
  -[BSUIScrollView heightAnchor](self->_widgetInfoScrollView, "heightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView heightAnchor](self->_widgetInfoStackView, "heightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v120[2] = v17;
  -[BSUIScrollView heightAnchor](self->_widgetGalleryScrollView, "heightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView heightAnchor](self->_widgetGalleryStackView, "heightAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = self->_widgetGalleryHeightConstraint;
  v120[3] = v20;
  v120[4] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v120, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "activateConstraints:", v22);

  if (self->_closeButton)
  {
    -[SBHAddWidgetDetailSheetTitleView contentInsets](self->_titleView, "contentInsets");
    v24 = v23;
    v26 = v25;
    v27 = (void *)MEMORY[0x1E0CB3718];
    -[UIButton trailingAnchor](self->_closeButton, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, -v26);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v119[0] = v30;
    -[UIButton topAnchor](self->_closeButton, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, v24);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v119[1] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v119, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v34);

  }
  titleView = self->_titleView;
  if (titleView)
  {
    v99 = (void *)MEMORY[0x1E0CB3718];
    -[SBHAddWidgetDetailSheetTitleView leadingAnchor](titleView, "leadingAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_headerView, "leadingAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "constraintEqualToAnchor:", v102);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v118[0] = v36;
    -[SBHAddWidgetDetailSheetTitleView trailingAnchor](self->_titleView, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_headerView, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v118[1] = v39;
    -[SBHAddWidgetDetailSheetTitleView topAnchor](self->_titleView, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_headerView, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v118[2] = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 3);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "activateConstraints:", v43);

    -[UIView bottomAnchor](self->_headerView, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHAddWidgetDetailSheetTitleView bottomAnchor](self->_titleView, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v45);
    v46 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    topSpacingConstraint = self->_topSpacingConstraint;
    self->_topSpacingConstraint = v46;

  }
  else
  {
    -[UIView heightAnchor](self->_headerView, "heightAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToConstant:", 0.0);
    v48 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v45 = self->_topSpacingConstraint;
    self->_topSpacingConstraint = v48;
  }

  -[NSLayoutConstraint setActive:](self->_topSpacingConstraint, "setActive:", 1);
  if (__sb__runningInSpringBoard())
  {
    v49 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "userInterfaceIdiom");

    v49 = v51 == 1;
  }
  v52 = (void *)MEMORY[0x1E0CB3718];
  if (v49)
  {
    -[SBHAddWidgetButton widthAnchor](self->_addButton, "widthAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToConstant:", 460.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v117[0] = v54;
    -[SBHAddWidgetButton centerXAnchor](self->_addButton, "centerXAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self->_containerView, "centerXAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v117[1] = v57;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 2);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "activateConstraints:", v58);
  }
  else
  {
    -[SBHAddWidgetButton leadingAnchor](self->_addButton, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_containerView, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, 24.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v116[0] = v55;
    -[SBHAddWidgetButton trailingAnchor](self->_addButton, "trailingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_containerView, "trailingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:constant:", v57, -24.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v116[1] = v58;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 2);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "activateConstraints:", v59);

  }
  pageControl = self->_pageControl;
  if (pageControl)
  {
    v61 = (void *)MEMORY[0x1E0CB3718];
    -[UIPageControl leadingAnchor](pageControl, "leadingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_containerView, "leadingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:constant:", v63, 24.0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v115[0] = v64;
    -[UIPageControl trailingAnchor](self->_pageControl, "trailingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_containerView, "trailingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:constant:", v66, -24.0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v115[1] = v67;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 2);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "activateConstraints:", v68);

  }
  -[SBHAddWidgetButton bottomAnchor](self->_addButton, "bottomAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_addButtonContainerView, "bottomAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v70);
  v71 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  addButtonBottomConstraint = self->_addButtonBottomConstraint;
  self->_addButtonBottomConstraint = v71;

  v73 = self->_pageControl;
  -[SBHAddWidgetButton topAnchor](self->_addButton, "topAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    -[UIPageControl bottomAnchor](self->_pageControl, "bottomAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:constant:", v75, 10.0);
    v76 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    addButtonTopConstraint = self->_addButtonTopConstraint;
    self->_addButtonTopConstraint = v76;

    -[UIPageControl topAnchor](self->_pageControl, "topAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_addButtonContainerView, "topAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:constant:", v79, 10.0);
    v80 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    pageControlTopConstraint = self->_pageControlTopConstraint;
    self->_pageControlTopConstraint = v80;

    -[NSLayoutConstraint setActive:](self->_pageControlTopConstraint, "setActive:", 1);
  }
  else
  {
    -[UIView topAnchor](self->_addButtonContainerView, "topAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:constant:", v82, 24.0);
    v83 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v84 = self->_addButtonTopConstraint;
    self->_addButtonTopConstraint = v83;

  }
  v85 = (void *)MEMORY[0x1E0CB3718];
  v86 = self->_addButtonBottomConstraint;
  v114[0] = self->_addButtonTopConstraint;
  v114[1] = v86;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 2);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "activateConstraints:", v87);

  v100 = (void *)MEMORY[0x1E0CB3718];
  -[UIView heightAnchor](self->_addButtonContainerView, "heightAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView heightAnchor](self->_addButtonStackSpacerView, "heightAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "constraintEqualToAnchor:", v110);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v113[0] = v106;
  -[UIView leadingAnchor](self->_addButtonContainerView, "leadingAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_addButtonStackSpacerView, "leadingAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "constraintEqualToAnchor:", v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v113[1] = v89;
  -[UIView trailingAnchor](self->_addButtonContainerView, "trailingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_addButtonStackSpacerView, "trailingAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "constraintEqualToAnchor:", v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v113[2] = v92;
  -[UIView bottomAnchor](self->_addButtonContainerView, "bottomAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_addButtonStackSpacerView, "bottomAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintEqualToAnchor:", v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v113[3] = v95;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 4);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "activateConstraints:", v96);

  -[SBHAddWidgetDetailSheetViewController _contentSizeCategoryDidChange](self, "_contentSizeCategoryDidChange");
}

- (void)_updateConstraintConstants
{
  void *v3;
  SBHAddWidgetDetailSheetViewController *v4;
  SBHAddWidgetDetailSheetViewController *v5;
  uint64_t v6;
  double v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  SBHWidgetSearchController *externalSearchController;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double MaxY;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;

  -[SBHAddWidgetDetailSheetViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (SBHAddWidgetDetailSheetViewController *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = v4;
  else
    v5 = self;
  v6 = -[SBHAddWidgetDetailSheetViewController interfaceOrientation](v5, "interfaceOrientation");
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
LABEL_6:
      v7 = dbl_1D0195650[self->_titleView == 0];
      goto LABEL_14;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    if (v9 != 1)
      goto LABEL_6;
  }
  v10 = v6 - 3;
  externalSearchController = self->_externalSearchController;
  if (externalSearchController)
  {
    -[SBHWidgetSearchController searchBarBackgroundView](externalSearchController, "searchBarBackgroundView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

  }
  else
  {
    v14 = *MEMORY[0x1E0C9D648];
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v28.origin.x = v14;
  v28.origin.y = v16;
  v28.size.width = v18;
  v28.size.height = v20;
  MaxY = CGRectGetMaxY(v28);
  v22 = 40.0;
  if (v10 < 2)
    v22 = 46.0;
  v7 = v22 + MaxY;
LABEL_14:
  -[NSLayoutConstraint setConstant:](self->_topSpacingConstraint, "setConstant:", v7);
  if (-[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](self, "addWidgetSheetStyle") == 1)
  {
    -[SBHAddWidgetSheetViewControllerBase addWidgetSheetMetrics](self, "addWidgetSheetMetrics", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    v24 = 0.0;
    v23 = 0.0;
    v25 = 0.0;
  }
  else
  {
    v24 = 24.0;
    v23 = 6.0;
    v25 = 5.0;
  }
  -[NSLayoutConstraint setConstant:](self->_pageControlTopConstraint, "setConstant:", v23);
  -[NSLayoutConstraint setConstant:](self->_addButtonTopConstraint, "setConstant:", v25);
  -[NSLayoutConstraint setConstant:](self->_addButtonBottomConstraint, "setConstant:", -v24);
  if (_SBHTraitEnvironmentIsAccessibilityTextSize(self))
    v26 = 1.0;
  else
    v26 = 0.25;
  -[SBHAddWidgetDetailSheetViewController _minumumWidgetGalleryScrollViewHeight](self, "_minumumWidgetGalleryScrollViewHeight");
  -[NSLayoutConstraint setConstant:](self->_widgetGalleryHeightConstraint, "setConstant:", v26 * v27);

}

- (void)_updateLayoutMargins
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  SBHWidgetSearchController *externalSearchController;
  void *v9;
  double Height;
  void *v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  -[BSUIScrollView layoutMargins](self->_contentScrollView, "layoutMargins");
  v5 = v4;
  v7 = v6;
  externalSearchController = self->_externalSearchController;
  if (externalSearchController)
  {
    -[SBHWidgetSearchController searchBar](externalSearchController, "searchBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    Height = CGRectGetHeight(v14);

  }
  else
  {
    Height = v3;
  }
  -[SBHAddWidgetDetailSheetViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v12 = CGRectGetHeight(v15);
  -[UIView frame](self->_addButtonContainerView, "frame");
  v13 = v12 - CGRectGetMinY(v16);

  -[BSUIScrollView setLayoutMargins:](self->_contentScrollView, "setLayoutMargins:", Height, v5, v13, v7);
}

- (double)_minumumWidgetGalleryScrollViewHeight
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = self->_pages;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "widgetWrapperViewController", (_QWORD)v14);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "wrapperView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "contentView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "intrinsicContentSize");
        v12 = v11;

        if (v6 < v12)
          v6 = v12;
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (void)setApplicationWidgetCollection:(id)a3
{
  SBHApplicationWidgetCollection *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  SBHApplicationWidgetCollection *applicationWidgetCollection;
  id v10;
  _QWORD v11[6];

  v4 = (SBHApplicationWidgetCollection *)a3;
  v5 = -[SBHAddWidgetSheetViewControllerBase allowedWidgets](self, "allowedWidgets");
  v7 = v6;
  -[SBHApplicationWidgetCollection widgetDescriptors](v4, "widgetDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__SBHAddWidgetDetailSheetViewController_setApplicationWidgetCollection___block_invoke;
  v11[3] = &__block_descriptor_48_e40_B16__0___SBHAddWidgetSheetGalleryItem__8l;
  v11[4] = v5;
  v11[5] = v7;
  objc_msgSend(v8, "bs_filter:", v11);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[SBHApplicationWidgetCollection setWidgetDescriptors:](v4, "setWidgetDescriptors:", v10);
  applicationWidgetCollection = self->_applicationWidgetCollection;
  self->_applicationWidgetCollection = v4;

}

uint64_t __72__SBHAddWidgetDetailSheetViewController_setApplicationWidgetCollection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if ((objc_msgSend(v3, "sbh_supportedSizeClasses") & v4) != 0
    && (*(_BYTE *)(a1 + 40) || objc_msgSend(v3, "sbh_canBeAddedToStack")))
  {
    if (*(_BYTE *)(a1 + 41))
      v5 = objc_msgSend(v3, "sbh_supportsRemovableBackgroundOrAccessoryFamilies");
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)configureForGalleryItem:(id)a3 selectedSizeClass:(int64_t)a4
{
  id v6;
  NSMutableArray *pages;
  id v8;
  uint64_t v9;
  NSObject *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  int64_t v17;

  v6 = a3;
  -[SBHAddWidgetDetailSheetViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  pages = self->_pages;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __83__SBHAddWidgetDetailSheetViewController_configureForGalleryItem_selectedSizeClass___block_invoke;
  v15 = &unk_1E8D8DCB0;
  v8 = v6;
  v16 = v8;
  v17 = a4;
  v9 = -[NSMutableArray indexOfObjectPassingTest:](pages, "indexOfObjectPassingTest:", &v12);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    SBLogWidgets();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBHAddWidgetDetailSheetViewController configureForGalleryItem:selectedSizeClass:].cold.1((uint64_t)v8, v10);

  }
  else
  {
    v11 = v9;
    if ((-[SBHAddWidgetDetailSheetViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared", v12, v13, v14, v15) & 1) != 0)-[SBHAddWidgetDetailSheetViewController _scrollToPageIndex:animated:](self, "_scrollToPageIndex:animated:", v11, 0);
    else
      self->_initialSelectionIndex = v11;
  }

}

BOOL __83__SBHAddWidgetDetailSheetViewController_configureForGalleryItem_selectedSizeClass___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  v3 = a2;
  objc_msgSend(v3, "widgetWrapperViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "galleryItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sbh_galleryItemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sbh_galleryItemIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v7))
  {
    objc_msgSend(v3, "widgetWrapperViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "selectedSizeClass") == *(_QWORD *)(a1 + 40);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)closeButtonTapped:(id)a3
{
  id v4;

  -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "addWidgetSheetViewControllerDidCancel:", self);

}

- (void)addButtonTapped:(id)a3
{
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();
  v5 = v10;
  if ((v4 & 1) != 0)
  {
    -[SBHAddWidgetDetailSheetViewController currentPage](self, "currentPage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widgetWrapperViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "wrapperView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v10, "addWidgetSheetViewController:didSelectWidgetIconView:", self, v9);

    v5 = v10;
  }

}

- (void)pageControlChanged:(id)a3
{
  -[SBHAddWidgetDetailSheetViewController _scrollToPageIndex:animated:](self, "_scrollToPageIndex:animated:", objc_msgSend(a3, "currentPage"), 1);
}

- (void)_scrollToPageIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  unint64_t v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;

  v4 = a4;
  -[UIStackView arrangedSubviews](self->_widgetGalleryStackView, "arrangedSubviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a3)
  {
    SBLogWidgets();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SBHAddWidgetDetailSheetViewController _scrollToPageIndex:animated:].cold.1(v8, a3, v12);

  }
  else
  {
    -[SBHAddWidgetDetailSheetViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutIfNeeded");

    if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
      a3 = -[NSMutableArray count](self->_pages, "count") + ~a3;
    -[BSUIScrollView bounds](self->_widgetGalleryScrollView, "bounds");
    v11 = v10 * (double)a3;
    -[BSUIScrollView setContentOffset:animated:](self->_widgetGalleryScrollView, "setContentOffset:animated:", v4, v11, 0.0);
    -[SBHAddWidgetDetailSheetViewController _updateControlsForContentOffset:animated:](self, "_updateControlsForContentOffset:animated:", v4, v11, 0.0);
  }
}

- (id)widgetInfoViews
{
  return -[UIStackView arrangedSubviews](self->_widgetInfoStackView, "arrangedSubviews");
}

- (void)scrollViewDidScroll:(id)a3
{
  BSUIScrollView *v4;
  BSUIScrollView *widgetGalleryScrollView;
  double v6;
  double v7;
  double v8;
  BSUIScrollView *v9;

  v4 = (BSUIScrollView *)a3;
  widgetGalleryScrollView = self->_widgetGalleryScrollView;
  v9 = v4;
  if (widgetGalleryScrollView == v4)
  {
    -[SBHAddWidgetDetailSheetViewController _updateParallaxEffect](self, "_updateParallaxEffect");
    if (!self->_scrollingInitiatedByInfoScrollView)
      -[SBHAddWidgetDetailSheetViewController _updatePageViewControllerAppearanceForNormalScroll](self, "_updatePageViewControllerAppearanceForNormalScroll");
  }
  else if (self->_widgetInfoScrollView == v4 && !-[BSUIScrollView isScrolling](widgetGalleryScrollView, "isScrolling"))
  {
    -[SBHAddWidgetDetailSheetViewController _scrollMainScrollViewToMatchInfoScrollViewIfNeeded](self, "_scrollMainScrollViewToMatchInfoScrollViewIfNeeded");
  }
  if ((objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock") & 1) == 0)
  {
    -[BSUIScrollView adjustedContentInset](v9, "adjustedContentInset");
    v7 = v6;
    -[BSUIScrollView contentOffset](v9, "contentOffset");
    -[SBHWidgetSearchController updateSearchBarBackgroundForScrollDistance:forClient:](self->_externalSearchController, "updateSearchBarBackgroundForScrollDistance:forClient:", self, v7 + v8);
  }

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  double v8;
  double v9;
  double v10;
  double v11;

  if (self->_widgetGalleryScrollView == a3)
  {
    x = a4.x;
    objc_msgSend(a3, "bounds", a4.x, a4.y);
    v9 = a5->x / v8;
    v10 = floor(v9);
    v11 = ceil(v9);
    if (x <= 0.0)
      v11 = v10;
    a5->x = v8 * v11;
    -[SBHAddWidgetDetailSheetViewController _updateControlsForContentOffset:animated:](self, "_updateControlsForContentOffset:animated:", 1);
  }
}

- (id)_newBackgroundView
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 54);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGroupNameBase:", CFSTR("Add-Sheet"));
  return v2;
}

- (void)_updateBackgroundRecipe
{
  -[SBHAddWidgetDetailSheetViewController _updateMaterialRecipeForBackgroundView:](self, "_updateMaterialRecipeForBackgroundView:", self->_backgroundView);
  -[SBHAddWidgetDetailSheetViewController _updateMaterialRecipeForBackgroundView:](self, "_updateMaterialRecipeForBackgroundView:", self->_magicPocketBackgroundView);
}

- (void)_updateMaterialRecipeForBackgroundView:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  -[SBHAddWidgetDetailSheetViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  if (v5 == 2)
    v6 = 53;
  else
    v6 = 54;
  objc_msgSend(v7, "setRecipe:", v6);

}

- (void)_addPage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[SBHAddWidgetDetailSheetViewController addChildViewController:](self, "addChildViewController:", v4);
  v5 = -[NSMutableArray indexOfObject:](self->_pages, "indexOfObject:", v4);
  objc_msgSend(v4, "view");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[UIStackView insertArrangedSubview:atIndex:](self->_widgetGalleryStackView, "insertArrangedSubview:atIndex:", v10, v5);
  objc_msgSend(v10, "widthAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetDetailSheetViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "widthAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  objc_msgSend(v4, "didMoveToParentViewController:", self);
}

- (void)_updatePageViewControllerAppearanceForNormalScroll
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  unint64_t v8;
  _QWORD v9[5];

  -[BSUIScrollView contentOffset](self->_widgetGalleryScrollView, "contentOffset");
  v4 = v3;
  v6 = v5;
  -[BSUIScrollView bounds](self->_widgetGalleryScrollView, "bounds");
  v8 = -[SBHAddWidgetDetailSheetViewController _pageIndexAtContentOffset:](self, "_pageIndexAtContentOffset:", v4 + v7 * 0.5, v6);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__SBHAddWidgetDetailSheetViewController__updatePageViewControllerAppearanceForNormalScroll__block_invoke;
  v9[3] = &__block_descriptor_40_e8_B16__0Q8l;
  v9[4] = v8;
  -[SBHAddWidgetDetailSheetViewController _updatePageViewControllerAppearanceWithAppearedBlock:](self, "_updatePageViewControllerAppearanceWithAppearedBlock:", v9);
}

BOOL __91__SBHAddWidgetDetailSheetViewController__updatePageViewControllerAppearanceForNormalScroll__block_invoke(uint64_t a1, int a2)
{
  int v2;

  v2 = a2 - *(_DWORD *)(a1 + 32);
  if (v2 < 0)
    v2 = *(_DWORD *)(a1 + 32) - a2;
  return v2 < 3;
}

- (void)_updatePageViewControllerAppearanceWithAppearedBlock:(id)a3
{
  id v4;
  NSMutableArray *pages;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  pages = self->_pages;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __94__SBHAddWidgetDetailSheetViewController__updatePageViewControllerAppearanceWithAppearedBlock___block_invoke;
  v7[3] = &unk_1E8D8DCF8;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](pages, "enumerateObjectsWithOptions:usingBlock:", 0, v7);

}

void __94__SBHAddWidgetDetailSheetViewController__updatePageViewControllerAppearanceWithAppearedBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  _BOOL8 v6;
  id v7;

  v7 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = v5 && ((*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v5, a3) & 1) != 0;
  objc_msgSend(v7, "bs_endAppearanceTransition:", v6);

}

- (void)_updatePageViewControllerAppearanceForFastScrollToTargetIndex:(unint64_t)a3
{
  unint64_t v5;
  int64_t v6;
  int64_t v7;
  unint64_t v8;
  _QWORD v9[6];

  v5 = -[UIPageControl currentPage](self->_pageControl, "currentPage");
  if (v5 >= a3)
    v6 = a3;
  else
    v6 = v5;
  if (v5 > a3)
    a3 = v5;
  if (v6 <= 1)
    v6 = 1;
  v7 = v6 - 1;
  v8 = -[NSMutableArray count](self->_pages, "count") - 1;
  if (a3 + 1 < v8)
    v8 = a3 + 1;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __103__SBHAddWidgetDetailSheetViewController__updatePageViewControllerAppearanceForFastScrollToTargetIndex___block_invoke;
  v9[3] = &__block_descriptor_48_e8_B16__0Q8l;
  v9[4] = v7;
  v9[5] = v8;
  -[SBHAddWidgetDetailSheetViewController _updatePageViewControllerAppearanceWithAppearedBlock:](self, "_updatePageViewControllerAppearanceWithAppearedBlock:", v9);
}

BOOL __103__SBHAddWidgetDetailSheetViewController__updatePageViewControllerAppearanceForFastScrollToTargetIndex___block_invoke(uint64_t a1, unint64_t a2)
{
  return *(_QWORD *)(a1 + 32) <= a2 && *(_QWORD *)(a1 + 40) >= a2;
}

- (SBHAddWidgetDetailsSheetPageViewController)currentPage
{
  unint64_t v3;
  NSMutableArray **p_pages;
  void *v5;
  NSObject *v6;

  v3 = -[UIPageControl currentPage](self->_pageControl, "currentPage");
  p_pages = &self->_pages;
  if (v3 >= -[NSMutableArray count](*p_pages, "count"))
  {
    SBLogWidgets();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SBHAddWidgetDetailSheetViewController currentPage].cold.1((id *)p_pages, v3, v6);

    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](*p_pages, "objectAtIndex:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (SBHAddWidgetDetailsSheetPageViewController *)v5;
}

- (SBFFluidBehaviorSettings)widgetInfoScrollViewAnimationSettings
{
  SBFFluidBehaviorSettings *widgetInfoScrollViewAnimationSettings;
  SBFFluidBehaviorSettings *v4;
  SBFFluidBehaviorSettings *v5;

  widgetInfoScrollViewAnimationSettings = self->_widgetInfoScrollViewAnimationSettings;
  if (!widgetInfoScrollViewAnimationSettings)
  {
    v4 = (SBFFluidBehaviorSettings *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
    v5 = self->_widgetInfoScrollViewAnimationSettings;
    self->_widgetInfoScrollViewAnimationSettings = v4;

    -[SBFFluidBehaviorSettings setDampingRatio:](self->_widgetInfoScrollViewAnimationSettings, "setDampingRatio:", 1.0);
    -[SBFFluidBehaviorSettings setResponse:](self->_widgetInfoScrollViewAnimationSettings, "setResponse:", 0.456999987);
    widgetInfoScrollViewAnimationSettings = self->_widgetInfoScrollViewAnimationSettings;
  }
  return widgetInfoScrollViewAnimationSettings;
}

- (unint64_t)_pageIndexAtContentOffset:(CGPoint)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[UIStackView hitTest:withEvent:](self->_widgetGalleryStackView, "hitTest:withEvent:", 0, a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView arrangedSubviews](self->_widgetGalleryStackView, "arrangedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (void)_updateControlsForContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  SBHAddWidgetDetailSheetViewController *v32;
  id v33;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[SBHAddWidgetDetailSheetViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutIfNeeded");

  v9 = -[SBHAddWidgetDetailSheetViewController _pageIndexAtContentOffset:](self, "_pageIndexAtContentOffset:", x, y);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v9;
    -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:", v9);
    if (!-[BSUIScrollView isScrolling](self->_widgetInfoScrollView, "isScrolling"))
    {
      -[NSMutableArray objectAtIndex:](self->_pages, "objectAtIndex:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "widgetWrapperViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "galleryItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = -[SBHApplicationWidgetCollection indexOfWidgetDescriptorMatchingDescriptor:](self->_applicationWidgetCollection, "indexOfWidgetDescriptorMatchingDescriptor:", v13);
      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v15 = v14;
        -[UIStackView arrangedSubviews](self->_widgetInfoStackView, "arrangedSubviews");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (v15 < v17)
        {
          -[UIStackView arrangedSubviews](self->_widgetInfoStackView, "arrangedSubviews");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndex:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = MEMORY[0x1E0C809B0];
          v29 = 3221225472;
          v30 = __82__SBHAddWidgetDetailSheetViewController__updateControlsForContentOffset_animated___block_invoke;
          v31 = &unk_1E8D84EF0;
          v32 = self;
          v20 = v19;
          v33 = v20;
          v21 = _Block_copy(&v28);
          v22 = v21;
          if (v4)
          {
            -[SBHAddWidgetDetailSheetViewController widgetInfoScrollViewAnimationSettings](self, "widgetInfoScrollViewAnimationSettings", v28, v29, v30, v31, v32);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (void *)MEMORY[0x1E0DC3F10];
            objc_msgSend(v23, "settlingDuration");
            v26 = v25;
            objc_msgSend(v23, "dampingRatio");
            objc_msgSend(v24, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v22, 0, v26, 0.0, v27, 0.0);

          }
          else
          {
            (*((void (**)(void *))v21 + 2))(v21);
          }

        }
      }

    }
  }
}

uint64_t __82__SBHAddWidgetDetailSheetViewController__updateControlsForContentOffset_animated___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 1264);
  objc_msgSend(*(id *)(a1 + 40), "frame");
  return objc_msgSend(v1, "setContentOffset:");
}

- (void)_updateParallaxEffect
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_pages;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[SBHAddWidgetDetailSheetViewController view](self, "view", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "updateParallaxEffectInReferenceView:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)_scrollMainScrollViewToMatchInfoScrollViewIfNeeded
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  _QWORD v20[5];
  _QWORD v21[6];

  -[BSUIScrollView contentOffset](self->_widgetInfoScrollView, "contentOffset");
  v4 = v3;
  -[BSUIScrollView bounds](self->_widgetInfoScrollView, "bounds");
  -[UIStackView hitTest:withEvent:](self->_widgetInfoStackView, "hitTest:withEvent:", 0, v4 + v5 * 0.5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetDetailSheetViewController widgetInfoViews](self, "widgetInfoViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v6);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SBHApplicationWidgetCollection widgetDescriptors](self->_applicationWidgetCollection, "widgetDescriptors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v8 < v10)
    {
      -[SBHApplicationWidgetCollection widgetDescriptors](self->_applicationWidgetCollection, "widgetDescriptors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBHAddWidgetDetailSheetViewController _currentGalleryItem](self, "_currentGalleryItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 != v13)
      {
        v14 = -[SBHAddWidgetDetailSheetViewController _closestPageWithGalleryItem:](self, "_closestPageWithGalleryItem:", v12);
        -[SBHAddWidgetDetailSheetViewController widgetInfoScrollViewAnimationSettings](self, "widgetInfoScrollViewAnimationSettings");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        self->_scrollingInitiatedByInfoScrollView = 1;
        -[SBHAddWidgetDetailSheetViewController _updatePageViewControllerAppearanceForFastScrollToTargetIndex:](self, "_updatePageViewControllerAppearanceForFastScrollToTargetIndex:", v14);
        v16 = (void *)MEMORY[0x1E0DC3F10];
        objc_msgSend(v15, "settlingDuration");
        v18 = v17;
        objc_msgSend(v15, "dampingRatio");
        v20[4] = self;
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __91__SBHAddWidgetDetailSheetViewController__scrollMainScrollViewToMatchInfoScrollViewIfNeeded__block_invoke;
        v21[3] = &unk_1E8D84C78;
        v21[4] = self;
        v21[5] = v14;
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __91__SBHAddWidgetDetailSheetViewController__scrollMainScrollViewToMatchInfoScrollViewIfNeeded__block_invoke_2;
        v20[3] = &unk_1E8D84F68;
        objc_msgSend(v16, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v21, v20, v18, 0.0, v19, 0.0);

      }
    }
  }

}

uint64_t __91__SBHAddWidgetDetailSheetViewController__scrollMainScrollViewToMatchInfoScrollViewIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scrollToPageIndex:animated:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __91__SBHAddWidgetDetailSheetViewController__scrollMainScrollViewToMatchInfoScrollViewIfNeeded__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1193) = 0;
  return result;
}

- (unint64_t)_closestPageWithGalleryItem:(id)a3
{
  id v4;
  SBHApplicationWidgetCollection *applicationWidgetCollection;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v11;
  id *p_pages;
  unint64_t v13;
  NSInteger v14;
  unint64_t v15;
  NSObject *v16;
  uint64_t v17;
  char v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v24;
  int v25;
  unint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  applicationWidgetCollection = self->_applicationWidgetCollection;
  -[SBHAddWidgetDetailSheetViewController _currentGalleryItem](self, "_currentGalleryItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBHApplicationWidgetCollection indexOfWidgetDescriptorMatchingDescriptor:](applicationWidgetCollection, "indexOfWidgetDescriptorMatchingDescriptor:", v6);

  v8 = -[SBHApplicationWidgetCollection indexOfWidgetDescriptorMatchingDescriptor:](self->_applicationWidgetCollection, "indexOfWidgetDescriptorMatchingDescriptor:", v4);
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v8;
    p_pages = (id *)&self->_pages;
    v13 = -[NSMutableArray count](self->_pages, "count");
    v14 = -[UIPageControl currentPage](self->_pageControl, "currentPage");
    if (v11 >= v13)
    {
      SBLogWidgets();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v24 = *p_pages;
        v25 = 134218498;
        v26 = v11;
        v27 = 2112;
        v28 = v4;
        v29 = 2112;
        v30 = v24;
        _os_log_error_impl(&dword_1CFEF3000, v16, OS_LOG_TYPE_ERROR, "Invalid targetGalleryItemIndex:%lu for galleryItem:%@ in pages:%@", (uint8_t *)&v25, 0x20u);
      }

      v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v15 = v14;
    }
    if (v7 < v11)
      v17 = 1;
    else
      v17 = -1;
    if (v15 >= v13 || (v15 & 0x8000000000000000) != 0)
      goto LABEL_21;
    v18 = 0;
    v9 = v15;
    do
    {
      objc_msgSend(*p_pages, "objectAtIndex:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "widgetWrapperViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "galleryItem");
      v21 = (id)objc_claimAutoreleasedReturnValue();

      if (v21 == v4)
        v9 = v15;
      v18 |= v21 == v4;
      v15 += v17;
    }
    while (v15 < v13 && (v15 & 0x8000000000000000) == 0);
    if ((v18 & 1) == 0)
    {
LABEL_21:
      SBLogWidgets();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[SBHAddWidgetDetailSheetViewController _closestPageWithGalleryItem:].cold.1((uint64_t)v4, (uint64_t *)p_pages, v22);

      v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return v9;
}

- (id)_currentGalleryItem
{
  void *v2;
  void *v3;
  void *v4;

  -[SBHAddWidgetDetailSheetViewController currentPage](self, "currentPage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widgetWrapperViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "galleryItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_materialViewForVisualStyling
{
  void *backgroundView;
  void *v4;
  id v5;

  -[SBHAddWidgetSheetViewControllerBase externalBackgroundView](self, "externalBackgroundView");
  backgroundView = (void *)objc_claimAutoreleasedReturnValue();
  v4 = backgroundView;
  if (!backgroundView)
    backgroundView = self->_backgroundView;
  v5 = backgroundView;

  return v5;
}

- (void)_contentSizeCategoryDidChange
{
  -[SBHAddWidgetDetailSheetViewController _updateStackViewForSizeCategory](self, "_updateStackViewForSizeCategory");
  -[SBHAddWidgetDetailSheetViewController _updateConstraintConstants](self, "_updateConstraintConstants");
  -[MTMaterialView setHidden:](self->_magicPocketBackgroundView, "setHidden:", !_SBHTraitEnvironmentIsAccessibilityTextSize(self));
}

- (void)_updateStackViewForSizeCategory
{
  void *v3;
  uint64_t v4;
  int *v5;

  if (_SBHTraitEnvironmentIsAccessibilityTextSize(self)
    && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "userInterfaceIdiom"),
        v3,
        (v4 & 0xFFFFFFFFFFFFFFFBLL) != 1))
  {
    v5 = &OBJC_IVAR___SBHAddWidgetDetailSheetViewController__widgetGalleryScrollView;
  }
  else
  {
    v5 = &OBJC_IVAR___SBHAddWidgetDetailSheetViewController__widgetInfoScrollView;
  }
  -[UIStackView insertArrangedSubview:atIndex:](self->_contentStackView, "insertArrangedSubview:atIndex:", *(Class *)((char *)&self->super.super.super.super.isa + *v5), self->_headerView != 0);
}

- (SBHWidgetDragHandling)widgetDragHandler
{
  void *v2;
  void *v3;

  -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widgetDragHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBHWidgetDragHandling *)v3;
}

- (id)backgroundViewMatchingMaterialBeneathPageViewController:(id)a3
{
  void *v4;
  id v5;

  if (-[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](self, "addWidgetSheetStyle", a3) == 1)
  {
    -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "backgroundViewMatchingMaterialBeneathAddWidgetSheetViewController:", self);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = -[SBHAddWidgetDetailSheetViewController _newBackgroundView](self, "_newBackgroundView");
  }
  return v5;
}

- (void)configureBackgroundView:(id)a3 matchingMaterialBeneathPageViewController:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](self, "addWidgetSheetStyle") == 1)
  {
    -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "configureBackgroundView:matchingMaterialBeneathAddWidgetSheetViewController:", v9, self);
  }
  else
  {
    v6 = objc_opt_class();
    v7 = v9;
    if (v6)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v5 = v8;

    if (v5)
      -[SBHAddWidgetDetailSheetViewController _updateMaterialRecipeForBackgroundView:](self, "_updateMaterialRecipeForBackgroundView:", v5);
  }

}

- (NSMutableDictionary)userInfo
{
  NSMutableDictionary *userInfo;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  userInfo = self->_userInfo;
  if (!userInfo)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = self->_userInfo;
    self->_userInfo = v4;

    userInfo = self->_userInfo;
  }
  return userInfo;
}

- (SBHWidgetSheetViewControllerPresenter)presenter
{
  return (SBHWidgetSheetViewControllerPresenter *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)setPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_presenter, a3);
}

- (SBHApplicationWidgetCollection)applicationWidgetCollection
{
  return self->_applicationWidgetCollection;
}

- (SBHWidgetSearchController)externalSearchController
{
  return self->_externalSearchController;
}

- (void)setExternalSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_externalSearchController, a3);
}

- (MTMaterialView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (MTMaterialView)magicPocketBackgroundView
{
  return self->_magicPocketBackgroundView;
}

- (void)setMagicPocketBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_magicPocketBackgroundView, a3);
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (SBHAddWidgetDetailSheetTitleView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (UIStackView)widgetInfoStackView
{
  return self->_widgetInfoStackView;
}

- (void)setWidgetInfoStackView:(id)a3
{
  objc_storeStrong((id *)&self->_widgetInfoStackView, a3);
}

- (BSUIScrollView)widgetInfoScrollView
{
  return self->_widgetInfoScrollView;
}

- (void)setWidgetInfoScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_widgetInfoScrollView, a3);
}

- (BSUIScrollView)widgetGalleryScrollView
{
  return self->_widgetGalleryScrollView;
}

- (void)setWidgetGalleryScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_widgetGalleryScrollView, a3);
}

- (UIStackView)widgetGalleryStackView
{
  return self->_widgetGalleryStackView;
}

- (void)setWidgetGalleryStackView:(id)a3
{
  objc_storeStrong((id *)&self->_widgetGalleryStackView, a3);
}

- (SBHAddWidgetButton)addButton
{
  return self->_addButton;
}

- (void)setAddButton:(id)a3
{
  objc_storeStrong((id *)&self->_addButton, a3);
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
  objc_storeStrong((id *)&self->_pageControl, a3);
}

- (void)setWidgetInfoScrollViewAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_widgetInfoScrollViewAnimationSettings, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
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

- (UIView)addButtonContainerView
{
  return self->_addButtonContainerView;
}

- (void)setAddButtonContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_addButtonContainerView, a3);
}

- (UIView)addButtonStackSpacerView
{
  return self->_addButtonStackSpacerView;
}

- (void)setAddButtonStackSpacerView:(id)a3
{
  objc_storeStrong((id *)&self->_addButtonStackSpacerView, a3);
}

- (NSLayoutConstraint)topSpacingConstraint
{
  return self->_topSpacingConstraint;
}

- (void)setTopSpacingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topSpacingConstraint, a3);
}

- (NSLayoutConstraint)pageControlTopConstraint
{
  return self->_pageControlTopConstraint;
}

- (void)setPageControlTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_pageControlTopConstraint, a3);
}

- (NSLayoutConstraint)addButtonTopConstraint
{
  return self->_addButtonTopConstraint;
}

- (void)setAddButtonTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_addButtonTopConstraint, a3);
}

- (NSLayoutConstraint)addButtonBottomConstraint
{
  return self->_addButtonBottomConstraint;
}

- (void)setAddButtonBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_addButtonBottomConstraint, a3);
}

- (NSLayoutConstraint)widgetGalleryHeightConstraint
{
  return self->_widgetGalleryHeightConstraint;
}

- (void)setWidgetGalleryHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_widgetGalleryHeightConstraint, a3);
}

- (NSMutableArray)pages
{
  return self->_pages;
}

- (void)setPages:(id)a3
{
  objc_storeStrong((id *)&self->_pages, a3);
}

- (BOOL)scrollingInitiatedByInfoScrollView
{
  return self->_scrollingInitiatedByInfoScrollView;
}

- (void)setScrollingInitiatedByInfoScrollView:(BOOL)a3
{
  self->_scrollingInitiatedByInfoScrollView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pages, 0);
  objc_storeStrong((id *)&self->_widgetGalleryHeightConstraint, 0);
  objc_storeStrong((id *)&self->_addButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_addButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_pageControlTopConstraint, 0);
  objc_storeStrong((id *)&self->_topSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_addButtonStackSpacerView, 0);
  objc_storeStrong((id *)&self->_addButtonContainerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_contentScrollView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_widgetInfoScrollViewAnimationSettings, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_widgetGalleryStackView, 0);
  objc_storeStrong((id *)&self->_widgetGalleryScrollView, 0);
  objc_storeStrong((id *)&self->_widgetInfoScrollView, 0);
  objc_storeStrong((id *)&self->_widgetInfoStackView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_magicPocketBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_externalSearchController, 0);
  objc_storeStrong((id *)&self->_applicationWidgetCollection, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

- (void)configureForGalleryItem:(uint64_t)a1 selectedSizeClass:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_ERROR, "Trying to configure SBHAddWidgetDetailSheetViewController with unknown galleryItem %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)_scrollToPageIndex:(NSObject *)a3 animated:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
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
  OUTLINED_FUNCTION_4_4(&dword_1CFEF3000, a3, (uint64_t)a3, "Trying to scroll to a page index (%lu) outside the bounds [0 - %lu]", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

- (void)currentPage
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(*a1, "count");
  v7 = 134218240;
  v8 = a2;
  v9 = 2048;
  v10 = v5;
  OUTLINED_FUNCTION_4_4(&dword_1CFEF3000, a3, v6, "currentPageIndex %lu >= count %lu", (uint8_t *)&v7);
}

- (void)_closestPageWithGalleryItem:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  OUTLINED_FUNCTION_4_4(&dword_1CFEF3000, a3, (uint64_t)a3, "Could not find page for gallery item:%@ in pages:%@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3();
}

@end
