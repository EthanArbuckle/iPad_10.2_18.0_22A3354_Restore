@implementation _UIBarCustomizationItemReservoirView

- (_UIBarCustomizationItemReservoirView)initWithItems:(id)a3
{
  id v4;
  _UIBarCustomizationItemReservoirView *v5;
  _UIBarCustomizationItemReservoirView *v6;
  void *v7;
  void *v8;
  CGFloat v9;
  CGFloat MinY;
  _UIShapeView *v11;
  double Width;
  _UIShapeView *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  UIView *v23;
  UIView *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  _UIDiffuseShadowView *v32;
  void *v33;
  _UIDiffuseShadowView *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  UINavigationItem *v49;
  void *v50;
  UINavigationItem *v51;
  void *v52;
  void *v53;
  UICollectionView *v54;
  void *v55;
  UICollectionView *v56;
  void *v57;
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
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  objc_super v77;
  CGAffineTransform v78;
  _QWORD v79[2];
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  v79[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)_UIBarCustomizationItemReservoirView;
  v5 = -[UIView initWithFrame:](&v77, sel_initWithFrame_, 0.0, 0.0, 340.0, 188.0);
  v6 = v5;
  if (v5)
  {
    -[UIView layer](v5, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAnchorPoint:", 0.5, 0.0);

    -[_UIBarCustomizationItemReservoirView setItems:](v6, "setItems:", v4);
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "moveToPoint:", 23.0, 0.0);
    objc_msgSend(v8, "addQuadCurveToPoint:controlPoint:", 9.52847097, -5.83629763, 15.0, 0.0);
    objc_msgSend(v8, "addLineToPoint:", 2.05182339, -13.8113884);
    objc_msgSend(v8, "addQuadCurveToPoint:controlPoint:", -2.05182339, -13.8113884, 0.0, -16.0);
    objc_msgSend(v8, "addLineToPoint:", -9.52847097, -5.83629763);
    objc_msgSend(v8, "addQuadCurveToPoint:controlPoint:", -23.0, 0.0, -15.0, 0.0);
    objc_msgSend(v8, "addLineToPoint:", -23.0, 1.0);
    objc_msgSend(v8, "addLineToPoint:", 23.0, 1.0);
    objc_msgSend(v8, "closePath");
    objc_msgSend(v8, "bounds");
    v9 = -CGRectGetMinX(v80);
    objc_msgSend(v8, "bounds");
    MinY = CGRectGetMinY(v81);
    CGAffineTransformMakeTranslation(&v78, v9, -MinY);
    objc_msgSend(v8, "applyTransform:", &v78);
    v11 = [_UIShapeView alloc];
    objc_msgSend(v8, "bounds");
    Width = CGRectGetWidth(v82);
    objc_msgSend(v8, "bounds");
    v13 = -[UIView initWithFrame:](v11, "initWithFrame:", 0.0, 0.0, Width, CGRectGetHeight(v83) + -1.0);
    -[UIView layer](v6, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "anchorPoint");
    v16 = v15;
    v18 = v17;
    -[UIView layer](v13, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAnchorPoint:", v16, v18);

    v20 = objc_retainAutorelease(v8);
    v21 = objc_msgSend(v20, "CGPath");
    -[_UIShapeView shapeLayer](v13, "shapeLayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPath:", v21);

    -[UIView addSubview:](v6, "addSubview:", v13);
    -[_UIBarCustomizationItemReservoirView setArrowView:](v6, "setArrowView:", v13);

    v23 = [UIView alloc];
    -[UIView bounds](v6, "bounds");
    v24 = -[UIView initWithFrame:](v23, "initWithFrame:");
    -[UIView layer](v6, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "anchorPoint");
    v27 = v26;
    v29 = v28;
    -[UIView layer](v24, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAnchorPoint:", v27, v29);

    -[UIView _setContinuousCornerRadius:](v24, "_setContinuousCornerRadius:", 13.0);
    -[UIView setClipsToBounds:](v24, "setClipsToBounds:", 1);
    +[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v24, "setBackgroundColor:", v31);

    -[UIView addSubview:](v6, "addSubview:", v24);
    -[_UIBarCustomizationItemReservoirView setContainerView:](v6, "setContainerView:", v24);

    -[_UIBarCustomizationItemReservoirView _updateArrowColor](v6, "_updateArrowColor");
    v32 = [_UIDiffuseShadowView alloc];
    -[_UIBarCustomizationItemReservoirView containerView](v6, "containerView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "frame");
    v34 = -[_UIDiffuseShadowView initWithFrame:](v32, "initWithFrame:");

    -[_UIBarCustomizationItemReservoirView containerView](v6, "containerView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "anchorPoint");
    v38 = v37;
    v40 = v39;
    -[UIView layer](v34, "layer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setAnchorPoint:", v38, v40);

    -[_UIDiffuseShadowView setIntensity:](v34, "setIntensity:", 0.2);
    -[_UIDiffuseShadowView setRadius:](v34, "setRadius:", 30.0);
    -[UIView insertSubview:atIndex:](v6, "insertSubview:atIndex:", v34, 0);
    -[_UIBarCustomizationItemReservoirView setShadowView:](v6, "setShadowView:", v34);

    v42 = (void *)objc_opt_new();
    -[_UIBarCustomizationItemReservoirView containerView](v6, "containerView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bounds");
    v44 = CGRectGetWidth(v84);
    objc_msgSend(v42, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    objc_msgSend(v42, "setFrame:", 0.0, 0.0, v44, v45);

    v46 = (void *)objc_opt_new();
    -[_UIBarCustomizationItemReservoirView containerView](v6, "containerView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "backgroundColor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setBackgroundColor:", v48);

    objc_msgSend(v42, "setStandardAppearance:", v46);
    v49 = [UINavigationItem alloc];
    _UILocalizedString(CFSTR("BAR_CUSTOMIZATION_POPOVER_TITLE"), (uint64_t)CFSTR("Title of bar customization popover."), CFSTR("Customize"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = -[UINavigationItem initWithTitle:](v49, "initWithTitle:", v50);

    -[UINavigationItem _setManualScrollEdgeAppearanceEnabled:](v51, "_setManualScrollEdgeAppearanceEnabled:", 1);
    objc_msgSend(v42, "pushNavigationItem:animated:", v51, 0);
    -[_UIBarCustomizationItemReservoirView containerView](v6, "containerView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addSubview:", v42);

    -[_UIBarCustomizationItemReservoirView setTopBar:](v6, "setTopBar:", v42);
    v53 = (void *)objc_opt_new();
    objc_msgSend(v53, "setEstimatedItemSize:", 60.0, 60.0);
    objc_msgSend(v53, "setMinimumInteritemSpacing:", 20.0);
    -[_UIBarCustomizationItemReservoirView _minimumLineSpacing](v6, "_minimumLineSpacing");
    objc_msgSend(v53, "setMinimumLineSpacing:");
    objc_msgSend(v53, "setSectionInset:", 20.0, 20.0, 56.0, 20.0);
    v54 = [UICollectionView alloc];
    -[_UIBarCustomizationItemReservoirView containerView](v6, "containerView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "bounds");
    v56 = -[UICollectionView initWithFrame:collectionViewLayout:](v54, "initWithFrame:collectionViewLayout:", v53);

    -[_UIBarCustomizationItemReservoirView topBar](v6, "topBar");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "frame");
    -[UICollectionView setContentInset:](v56, "setContentInset:", CGRectGetMaxY(v85), 0.0, 0.0, 0.0);

    -[_UIBarCustomizationItemReservoirView topBar](v6, "topBar");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "frame");
    -[UIScrollView setScrollIndicatorInsets:](v56, "setScrollIndicatorInsets:", CGRectGetMaxY(v86), 0.0, 8.0, 0.0);

    -[UICollectionView setBackgroundColor:](v56, "setBackgroundColor:", 0);
    -[UICollectionView setDataSource:](v56, "setDataSource:", v6);
    -[UICollectionView setDelegate:](v56, "setDelegate:", v6);
    -[UICollectionView setAllowsSelection:](v56, "setAllowsSelection:", 0);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v56, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("kCustomizationReservoirCellIdentifier"));
    -[UICollectionView _setVisibleRectEdgeInsets:](v56, "_setVisibleRectEdgeInsets:", 0.0, 0.0, -150.0, 0.0);
    -[_UIBarCustomizationItemReservoirView containerView](v6, "containerView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBarCustomizationItemReservoirView topBar](v6, "topBar");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "insertSubview:below:", v56, v60);

    -[_UIBarCustomizationItemReservoirView setCollectionView:](v6, "setCollectionView:", v56);
    v61 = (void *)objc_opt_new();
    +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setTextColor:", v62);

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleCaption2"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setFont:", v63);

    objc_msgSend(v61, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v61, "setNumberOfLines:", 0);
    objc_msgSend(v61, "setTextAlignment:", 1);
    _UILocalizedString(CFSTR("BAR_CUSTOMIZATION_POPOVER_HINT_TEXT"), (uint64_t)CFSTR("Instructional text displayed at top of bar customization popover."), CFSTR("Drag to add or remove items from the toolbar"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setText:", v64);

    -[_UIBarCustomizationItemReservoirView collectionView](v6, "collectionView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "addSubview:", v61);

    -[_UIBarCustomizationItemReservoirView setTipLabel:](v6, "setTipLabel:", v61);
    v66 = (void *)objc_opt_new();
    objc_msgSend(v66, "setAlpha:", 0.0);
    _UILocalizedString(CFSTR("BAR_CUSTOMIZATION_POPOVER_EMPTY_TEXT"), (uint64_t)CFSTR("Customization popover empty state text."), CFSTR("Drag to remove items"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setText:", v67);

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setFont:", v68);

    +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setTextColor:", v69);

    objc_msgSend(v66, "setLineBreakMode:", 4);
    objc_msgSend(v66, "setAdjustsFontSizeToFitWidth:", 0);
    -[_UIBarCustomizationItemReservoirView collectionView](v6, "collectionView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addSubview:", v66);

    -[_UIBarCustomizationItemReservoirView setNoContentLabel:](v6, "setNoContentLabel:", v66);
    -[_UIBarCustomizationItemReservoirView containerView](v6, "containerView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v6, "addSubview:", v71);

    if (!objc_msgSend(v4, "count"))
      -[_UIBarCustomizationItemReservoirView _updateEmptyState](v6, "_updateEmptyState");
    +[UITraitCollection systemTraitsAffectingColorAppearance](UITraitCollection, "systemTraitsAffectingColorAppearance");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = -[UIView registerForTraitChanges:withAction:](v6, "registerForTraitChanges:withAction:", v72, sel__updateArrowColor);

    v79[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 1);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = -[UIView registerForTraitChanges:withHandler:](v6, "registerForTraitChanges:withHandler:", v74, &__block_literal_global_361);

  }
  return v6;
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  uint64_t v7;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  int64_t v10;
  double v11;
  double v12;
  dispatch_time_t v13;
  void *v14;
  _QWORD block[4];
  void (**v16)(_QWORD);
  _QWORD v17[5];
  BOOL v18;
  _QWORD aBlock[5];
  BOOL v20;

  v4 = a4;
  v5 = a3;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61___UIBarCustomizationItemReservoirView_setExpanded_animated___block_invoke;
  aBlock[3] = &unk_1E16B1B78;
  aBlock[4] = self;
  v20 = a3;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __61___UIBarCustomizationItemReservoirView_setExpanded_animated___block_invoke_2;
  v17[3] = &unk_1E16B1B78;
  v18 = v5;
  v17[4] = self;
  v9 = (void (**)(_QWORD))_Block_copy(v17);
  if (v4)
  {
    if (v5)
      v10 = 0;
    else
      v10 = 100000000;
    if (v5)
      v11 = 0.8;
    else
      v11 = 1.0;
    if (v5)
      v12 = 0.4;
    else
      v12 = 0.3;
    v13 = dispatch_time(0, v10);
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __61___UIBarCustomizationItemReservoirView_setExpanded_animated___block_invoke_3;
    block[3] = &unk_1E16B1BF8;
    v16 = v8;
    dispatch_after(v13, MEMORY[0x1E0C80D38], block);
    +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v14, 0, v9, 0);

  }
  else
  {
    v8[2](v8);
    v9[2](v9);
  }

}

- (void)setResetAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIBarButtonItem *v7;

  v4 = a3;
  v7 = -[UIBarButtonItem initWithPrimaryAction:]([UIBarButtonItem alloc], "initWithPrimaryAction:", v4);

  -[_UIBarCustomizationItemReservoirView topBar](self, "topBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLeftBarButtonItem:", v7);

}

- (void)setDoneAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIBarButtonItem *v7;

  v4 = a3;
  v7 = -[UIBarButtonItem initWithBarButtonSystemItem:primaryAction:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:primaryAction:", 0, v4);

  -[_UIBarCustomizationItemReservoirView topBar](self, "topBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v7);

}

- (void)setItems:(id)a3
{
  NSMutableArray *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  _UIBarCustomizationChiclet *v12;
  _UIBarCustomizationChiclet *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (NSMutableArray *)a3;
  if (self->_items != v5)
  {
    objc_storeStrong((id *)&self->_items, a3);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v5;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          v12 = [_UIBarCustomizationChiclet alloc];
          v13 = -[_UIBarCustomizationChiclet initWithItem:](v12, "initWithItem:", v11, (_QWORD)v15);
          -[_UIBarCustomizationChiclet setChicletSize:](v13, "setChicletSize:", 1);
          -[_UIBarCustomizationChiclet setPlatterVisible:](v13, "setPlatterVisible:", 1);
          -[_UIBarCustomizationChiclet setLabelVisible:](v13, "setLabelVisible:", 1);
          -[_UIBarCustomizationChiclet sizeToFit](v13, "sizeToFit");

        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    self->_computedInitialSize = 0;
    -[_UIBarCustomizationItemReservoirView collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reloadData");

    -[_UIBarCustomizationItemReservoirView invalidateLayoutAndForceUpdate:](self, "invalidateLayoutAndForceUpdate:", 0);
    -[_UIBarCustomizationItemReservoirView _updateEmptyState](self, "_updateEmptyState");
  }

}

- (void)addItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_chiclet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlatterVisible:", 1);
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __48___UIBarCustomizationItemReservoirView_addItem___block_invoke;
    v14[3] = &unk_1E16B1B28;
    v15 = v5;
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v7, 0, v14, 0);

  }
  else
  {
    objc_msgSend(v5, "setLabelVisible:", 1);
  }
  -[_UIBarCustomizationItemReservoirView items](self, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v4);

  -[_UIBarCustomizationItemReservoirView collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB36B0];
  -[_UIBarCustomizationItemReservoirView items](self, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexPathForItem:inSection:", objc_msgSend(v11, "count") - 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertItemsAtIndexPaths:", v13);

  -[_UIBarCustomizationItemReservoirView _updateEmptyState](self, "_updateEmptyState");
}

- (void)removeItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIBarCustomizationItemReservoirView items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[_UIBarCustomizationItemReservoirView items](self, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectAtIndex:", v6);

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBarCustomizationItemReservoirView collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellForItemAtIndexPath:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIBarCustomizationItemReservoirView collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deleteItemsAtIndexPaths:", v12);

    objc_msgSend(v10, "setChiclet:", 0);
  }
  -[_UIBarCustomizationItemReservoirView _updateEmptyState](self, "_updateEmptyState");
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  void *v8;
  void *v9;
  double MaxY;
  double v11;
  void *v12;
  double v13;
  CGFloat v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  __int128 v56;
  double v57;
  CGAffineTransform *v58;
  double v59;
  __int128 v60;
  CGAffineTransform v61;
  CGAffineTransform v62;
  _OWORD v63[3];
  _OWORD v64[3];
  CGAffineTransform v65;
  CGAffineTransform v66;
  objc_super v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  v67.receiver = self;
  v67.super_class = (Class)_UIBarCustomizationItemReservoirView;
  -[UIView layoutSubviews](&v67, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  x = v68.origin.x;
  y = v68.origin.y;
  width = v68.size.width;
  height = v68.size.height;
  MidX = CGRectGetMidX(v68);
  -[_UIBarCustomizationItemReservoirView arrowView](self, "arrowView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCenter:", MidX, 0.0);

  -[_UIBarCustomizationItemReservoirView arrowView](self, "arrowView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  MaxY = CGRectGetMaxY(v69);

  v70.origin.x = x;
  v70.origin.y = y;
  v70.size.width = width;
  v70.size.height = height;
  v11 = CGRectGetMidX(v70);
  -[_UIBarCustomizationItemReservoirView containerView](self, "containerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCenter:", v11, MaxY);

  v71.origin.x = x;
  v71.origin.y = y;
  v71.size.width = width;
  v71.size.height = height;
  v13 = CGRectGetWidth(v71);
  v72.origin.x = x;
  v72.origin.y = y;
  v72.size.width = width;
  v72.size.height = height;
  v14 = CGRectGetHeight(v72) - MaxY;
  -[_UIBarCustomizationItemReservoirView containerView](self, "containerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBounds:", 0.0, 0.0, v13, v14);

  -[_UIBarCustomizationItemReservoirView containerView](self, "containerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v73.origin.x = v18;
  v73.origin.y = v20;
  v73.size.width = v22;
  v73.size.height = v24;
  v25 = CGRectGetWidth(v73);
  -[_UIBarCustomizationItemReservoirView topBar](self, "topBar");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v28 = v27;
  -[_UIBarCustomizationItemReservoirView topBar](self, "topBar");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", 0.0, 0.0, v25, v28);

  -[_UIBarCustomizationItemReservoirView collectionView](self, "collectionView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFrame:", v18, v20, v22, v24);

  -[_UIBarCustomizationItemReservoirView containerView](self, "containerView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "frame");
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  -[_UIBarCustomizationItemReservoirView shadowView](self, "shadowView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

  -[_UIBarCustomizationItemReservoirView tipLabel](self, "tipLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarCustomizationItemReservoirView noContentLabel](self, "noContentLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v74.origin.x = v18;
  v74.origin.y = v20;
  v74.size.width = v22;
  v74.size.height = v24;
  v43 = CGRectGetWidth(v74) + -40.0;
  objc_msgSend(v41, "sizeThatFits:", v43, 0.0);
  v45 = v44;
  v47 = v46;
  objc_msgSend(v42, "sizeThatFits:", v43, 0.0);
  v49 = v48;
  v51 = v50;
  objc_msgSend(v41, "setBounds:", 0.0, 0.0, v45, v47);
  objc_msgSend(v42, "setBounds:", 0.0, 0.0, v49, v51);
  if (self->_isEmpty)
  {
    v52 = v18 + v22 * 0.5;
    -[_UIBarCustomizationItemReservoirView collectionView](self, "collectionView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "contentInset");
    v55 = v20 + v24 * 0.5 - v54;

    objc_msgSend(v41, "setCenter:", v52, v55);
    CGAffineTransformMakeScale(&v66, v49 / v45, v51 / v47);
    v65 = v66;
    objc_msgSend(v41, "setTransform:", &v65);
    objc_msgSend(v41, "setAlpha:", 0.0);
    objc_msgSend(v42, "setCenter:", v52, v55);
    v56 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v64[0] = *MEMORY[0x1E0C9BAA8];
    v64[1] = v56;
    v64[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v57 = 1.0;
    v58 = (CGAffineTransform *)v64;
  }
  else
  {
    v75.origin.x = v18;
    v75.origin.y = v20;
    v75.size.width = v22;
    v75.size.height = v24;
    v59 = CGRectGetMidX(v75);
    objc_msgSend(v41, "setCenter:", v59, v47 * 0.5 + 1.0);
    v60 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v63[0] = *MEMORY[0x1E0C9BAA8];
    v63[1] = v60;
    v63[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v41, "setTransform:", v63);
    objc_msgSend(v41, "setAlpha:", 1.0);
    objc_msgSend(v42, "setCenter:", v59, v47 * 0.5 + 1.0);
    CGAffineTransformMakeScale(&v62, v45 / v49, v47 / v51);
    v61 = v62;
    v58 = &v61;
    v57 = 0.0;
  }
  objc_msgSend(v42, "setTransform:", v58, *(_OWORD *)&v61.a, *(_OWORD *)&v61.c, *(_OWORD *)&v61.tx);
  objc_msgSend(v42, "setAlpha:", v57);

}

- (void)sizeToFit
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  void *v13;
  double Width;
  double v15;
  double v16;
  void *v17;
  double MaxY;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  id v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  -[UIView superview](self, "superview");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UIBarCustomizationItemReservoirView items](self, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = dbl_1866815B0[(unint64_t)objc_msgSend(v11, "count") > 0xB];

  -[UIView superview](self, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  Width = CGRectGetWidth(v26);
  +[UIViewController _horizontalContentMarginForView:](UIViewController, "_horizontalContentMarginForView:", v25);
  v16 = Width - (v15 + v15);

  if (v12 < v16)
    v16 = v12;
  -[_UIBarCustomizationItemReservoirView arrowView](self, "arrowView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  MaxY = CGRectGetMaxY(v27);
  -[_UIBarCustomizationItemReservoirView collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "contentInset");
  v21 = MaxY + v20;
  -[_UIBarCustomizationItemReservoirView collectionView](self, "collectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "contentSize");
  v24 = v21 + v23;

  v28.origin.x = v4;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  -[UIView setBounds:](self, "setBounds:", 0.0, 0.0, v16, fmax(fmin(v24, CGRectGetHeight(v28) * 0.6), 188.0));

}

- (void)invalidateLayoutAndForceUpdate:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[_UIBarCustomizationItemReservoirView collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateLayout");

  -[UIView setNeedsLayout](self, "setNeedsLayout");
  if (v3)
    -[UIView layoutIfNeeded](self, "layoutIfNeeded");
  -[_UIBarCustomizationItemReservoirView sizeToFit](self, "sizeToFit");
}

- (id)flowLayout
{
  void *v2;
  void *v3;

  -[_UIBarCustomizationItemReservoirView collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateArrowColor
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  -[_UIBarCustomizationItemReservoirView containerView](self, "containerView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolvedColorWithTraitCollection:", v4);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGColor");
  -[_UIBarCustomizationItemReservoirView arrowView](self, "arrowView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shapeLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFillColor:", v6);

}

- (void)_updateEmptyState
{
  id v3;

  -[_UIBarCustomizationItemReservoirView items](self, "items");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  self->_isEmpty = objc_msgSend(v3, "count") == 0;

}

- (double)_minimumLineSpacing
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleCaption2"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "lineHeight");
  v5 = v4 + v4 + 10.0 + 14.0;

  return v5;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[_UIBarCustomizationItemReservoirView collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewLayout");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "contentOffset");
  v7 = v6;
  objc_msgSend(v4, "contentInset");
  v9 = v8;

  -[_UIBarCustomizationItemReservoirView topBar](self, "topBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setManualScrollEdgeAppearanceProgress:", fmax(fmin((v7 + v9) / 10.0, 1.0), 0.0));

}

- (void)scrollViewDidChangeContentSize:(id)a3
{
  if (!self->_computedInitialSize)
  {
    self->_computedInitialSize = 1;
    -[_UIBarCustomizationItemReservoirView sizeToFit](self, "sizeToFit", a3);
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[_UIBarCustomizationItemReservoirView items](self, "items", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kCustomizationReservoirCellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarCustomizationItemReservoirView items](self, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_chiclet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setChiclet:", v10);
  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v11 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    v13 = _UIInternalPreference_BarCustomizationDebugEnabled;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_BarCustomizationDebugEnabled)
    {
      while (v11 >= v13)
      {
        _UIInternalPreferenceSync(v11, &_UIInternalPreference_BarCustomizationDebugEnabled, (uint64_t)CFSTR("BarCustomizationDebugEnabled"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        v13 = _UIInternalPreference_BarCustomizationDebugEnabled;
        if (v11 == _UIInternalPreference_BarCustomizationDebugEnabled)
          goto LABEL_4;
      }
      if (byte_1EDDA7DE4)
      {
        +[UIColor redColor](UIColor, "redColor");
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v15 = objc_msgSend(v14, "CGColor");
        objc_msgSend(v7, "layer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setBorderColor:", v15);

        objc_msgSend(v7, "layer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setBorderWidth:", 1.0);

      }
    }
  }
LABEL_4:

  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v6 = a5;
  -[_UIBarCustomizationItemReservoirView items](self, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "item");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_chiclet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "fittingSizeWithChicletSize:", 1);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7;
  double Width;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;
  CGRect v21;

  v7 = a4;
  objc_msgSend(a3, "bounds");
  Width = CGRectGetWidth(v21);
  objc_msgSend(v7, "sectionInset");
  v10 = Width - v9;
  objc_msgSend(v7, "sectionInset");
  v12 = v11;

  -[_UIBarCustomizationItemReservoirView tipLabel](self, "tipLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeThatFits:", v10 - v12, 20.0);
  v15 = v14;
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (id)_collectionView:(id)a3 layout:(id)a4 flowLayoutRowAlignmentOptionsForSection:(int64_t)a5
{
  id v7;
  double Width;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t i;
  void *v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[3];
  _QWORD v30[3];
  _BYTE v31[128];
  uint64_t v32;
  CGRect v33;
  CGRect v34;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(a3, "bounds");
  Width = CGRectGetWidth(v33);
  objc_msgSend(v7, "sectionInset");
  v10 = Width - v9;
  objc_msgSend(v7, "sectionInset");
  v12 = v10 - v11;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[_UIBarCustomizationItemReservoirView items](self, "items", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    v17 = -20.0;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "_chiclet");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "bounds");
        v20 = CGRectGetWidth(v34);

        if (v17 + 20.0 + v20 <= v12)
          v17 = v17 + v20 + 20.0;
        else
          v17 = v20;
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v15);
  }
  else
  {
    v17 = -20.0;
  }

  v30[0] = &unk_1E1A98F40;
  v29[0] = CFSTR("UIFlowLayoutCommonRowHorizontalAlignmentKey");
  v29[1] = CFSTR("UIFlowLayoutLastRowHorizontalAlignmentKey");
  if (v17 <= v12 + -60.0)
    v21 = 0;
  else
    v21 = 3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = CFSTR("UIFlowLayoutRowVerticalAlignmentKey");
  v30[1] = v22;
  v30[2] = &unk_1E1A98F58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (NSMutableArray)items
{
  return self->_items;
}

- (_UIShapeView)arrowView
{
  return self->_arrowView;
}

- (void)setArrowView:(id)a3
{
  objc_storeStrong((id *)&self->_arrowView, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (_UIDiffuseShadowView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (UINavigationBar)topBar
{
  return self->_topBar;
}

- (void)setTopBar:(id)a3
{
  objc_storeStrong((id *)&self->_topBar, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UILabel)tipLabel
{
  return self->_tipLabel;
}

- (void)setTipLabel:(id)a3
{
  objc_storeStrong((id *)&self->_tipLabel, a3);
}

- (UILabel)noContentLabel
{
  return self->_noContentLabel;
}

- (void)setNoContentLabel:(id)a3
{
  objc_storeStrong((id *)&self->_noContentLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noContentLabel, 0);
  objc_storeStrong((id *)&self->_tipLabel, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_topBar, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_arrowView, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
