@implementation _UIFloatingTabBar

- (_UIFloatingTabBar)initWithFrame:(CGRect)a3
{
  _UIFloatingTabBar *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIFloatingTabBar;
  v3 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[_UIFloatingTabBar registerPlatformMetrics](_UIFloatingTabBar, "registerPlatformMetrics");
    -[_UIFloatingTabBar _createViewHierarchy](v3, "_createViewHierarchy");
    -[_UIFloatingTabBar _createDataSource](v3, "_createDataSource");
  }
  return v3;
}

- (_UIFloatingTabBar)initWithCoder:(id)a3
{
  _UIFloatingTabBar *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIFloatingTabBar;
  v3 = -[UIView initWithCoder:](&v5, sel_initWithCoder_, a3);
  if (v3)
  {
    +[_UIFloatingTabBar registerPlatformMetrics](_UIFloatingTabBar, "registerPlatformMetrics");
    -[_UIFloatingTabBar _createViewHierarchy](v3, "_createViewHierarchy");
    -[_UIFloatingTabBar _createDataSource](v3, "_createDataSource");
  }
  return v3;
}

- (void)setTabModel:(id)a3
{
  id v5;
  _UITabModel **p_tabModel;
  _UITabModel *v7;
  _UITabModel *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _UITabModel *v15;

  v5 = a3;
  p_tabModel = &self->_tabModel;
  v7 = self->_tabModel;
  v8 = (_UITabModel *)v5;
  v15 = v8;
  if (v7 == v8)
  {

    v10 = v15;
LABEL_11:

    goto LABEL_12;
  }
  if (v8 && v7)
  {
    v9 = -[_UITabModel isEqual:](v7, "isEqual:", v8);

    if ((v9 & 1) != 0)
      goto LABEL_12;
  }
  else
  {

  }
  -[_UITabModel tabItems](*p_tabModel, "tabItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  -[_UITabModel removeObserver:](*p_tabModel, "removeObserver:", self);
  objc_storeStrong((id *)&self->_tabModel, a3);
  -[_UICollectionViewAnimationContext setAnimationsForOnScreenViews:]((uint64_t)self->_parser, v15);
  -[_UITabModel addObserver:](*p_tabModel, "addObserver:", self);
  -[_UIFloatingTabBar _updateEditModeGestureRecognizer](self, "_updateEditModeGestureRecognizer");
  if (v12
    || (-[_UITabModel tabItems](v15, "tabItems"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "count"),
        v13,
        v14))
  {
    -[_UIFloatingTabBar _invalidateDataSourceAnimated:](self, "_invalidateDataSourceAnimated:", 0);
    -[_UITabModel selectedLeaf](v15, "selectedLeaf");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBar _updateSelectedLeaf:previousElement:](self, "_updateSelectedLeaf:previousElement:", v10, 0);
    goto LABEL_11;
  }
LABEL_12:

}

- (id)_tabBarController
{
  void *v2;
  void *v3;

  -[_UIFloatingTabBar tabModel](self, "tabModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabBarController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)showsSidebarButton
{
  if (self->_sidebarButtonAction)
    return !-[_UIFloatingTabBar isEditing](self, "isEditing");
  else
    return 0;
}

- (void)setSidebarButtonAction:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (self->_sidebarButtonAction)
  {
    -[_UIFloatingTabBar sidebarButton](self, "sidebarButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAction:forControlEvents:", self->_sidebarButtonAction, 0x2000);

  }
  objc_storeStrong((id *)&self->_sidebarButtonAction, a3);
  if (v7)
  {
    -[_UIFloatingTabBar sidebarButton](self, "sidebarButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:forControlEvents:", v7, 0x2000);

  }
  -[_UIFloatingTabBar _setNeedsPaginationUpdate](self, "_setNeedsPaginationUpdate");
  -[_UIFloatingTabBar _setNeedsSelectionFrameUpdate](self, "_setNeedsSelectionFrameUpdate");

}

- (UIButton)sidebarButton
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  UIButton *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  UIButton *sidebarButton;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (!self->_sidebarButton && -[_UIFloatingTabBar showsSidebarButton](self, "showsSidebarButton"))
  {
    -[UIView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _UIFloatingTabBarGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "sidebarButtonConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentPaletteProvider");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, objc_msgSend(v7, "userInterfaceStyle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inactiveColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBaseForegroundColor:", v9);

    +[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v5, 0);
    v10 = (UIButton *)objc_claimAutoreleasedReturnValue();
    -[UIView _setContinuousCornerRadius:](v10, "_setContinuousCornerRadius:", *MEMORY[0x1E0CD2FE8]);
    -[UIButton setSpringLoaded:](v10, "setSpringLoaded:", 1);
    -[UIView setAlpha:](v10, "setAlpha:", 0.0);
    v18[0] = 0x1E1A994B0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[UIView _registerForTraitTokenChanges:withHandler:](v10, "_registerForTraitTokenChanges:withHandler:", v11, &__block_literal_global_652);

    +[UIHoverHighlightEffect effect](UIHoverHighlightEffect, "effect");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIShape capsuleShape](UIShape, "capsuleShape");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIHoverStyle styleWithEffect:shape:](UIHoverStyle, "styleWithEffect:shape:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIControl setHoverStyle:](v10, "setHoverStyle:", v15);

    -[UIView addSubview:](self->_contentView, "addSubview:", v10);
    sidebarButton = self->_sidebarButton;
    self->_sidebarButton = v10;

  }
  return self->_sidebarButton;
}

- (void)setBackdropGroupName:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_backdropGroupName, a3);
  v5 = a3;
  -[_UIFloatingTabBar backgroundView](self, "backgroundView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setGroupName:", v5);

}

- (void)setAdditionalTransform:(CGAffineTransform *)a3
{
  CGAffineTransform *p_additionalTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGAffineTransform v10;
  CGAffineTransform t1;

  p_additionalTransform = &self->_additionalTransform;
  v6 = *(_OWORD *)&self->_additionalTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_additionalTransform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_additionalTransform.tx;
  v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tx = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    v8 = *(_OWORD *)&a3->a;
    v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_additionalTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_additionalTransform->tx = v9;
    *(_OWORD *)&p_additionalTransform->a = v8;
    -[_UIFloatingTabBar _updateTransform](self, "_updateTransform");
  }
}

- (double)contentCornerRadius
{
  double result;

  -[UIVisualEffectView _continuousCornerRadius](self->_backgroundView, "_continuousCornerRadius");
  return result;
}

- (CGPoint)sidebarButtonOrigin
{
  UIButton *sidebarButton;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  sidebarButton = self->_sidebarButton;
  -[_UIFloatingTabBar contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:toView:](sidebarButton, "convertPoint:toView:", v3, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGRect)contentLayoutFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[_UIFloatingTabBar contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v4;
  v14 = v11;
  v15 = v6;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)currentSelectionTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[_UIFloatingTabBar _indexPathForSelectedItem](self, "_indexPathForSelectedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBar dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemIdentifierForIndexPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "contentTab");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_compactRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "_compactRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v6, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)currentBackgroundEffect
{
  void *v2;
  void *v3;

  -[_UIFloatingTabBar backgroundView](self, "backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)prepareForTransitionToVisibility:(BOOL)a3
{
  _BOOL4 v3;
  _UIVisualEffectBackdropView **p_backdropCaptureView;
  void *v6;
  void *v7;
  _UIVisualEffectBackdropView *obj;

  v3 = a3;
  p_backdropCaptureView = &self->_backdropCaptureView;
  obj = self->_backdropCaptureView;
  if (!obj)
  {
    obj = objc_alloc_init(_UIVisualEffectBackdropView);
    -[_UIFloatingTabBar contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    -[UIView setFrame:](obj, "setFrame:");

    -[UIView setAutoresizingMask:](obj, "setAutoresizingMask:", 18);
    objc_storeStrong((id *)p_backdropCaptureView, obj);
  }
  -[_UIFloatingTabBar contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertSubview:atIndex:", obj, 0);

  if (v3 && (*(_BYTE *)&self->_needsUpdate & 0x20) != 0)
  {
    if (!-[_UIFloatingTabBar isEditing](self, "isEditing"))
      -[_UIFloatingTabBar _scrollToSelectedItemAnimated:](self, "_scrollToSelectedItemAnimated:", 0);
    *(_BYTE *)&self->_needsUpdate &= ~0x20u;
  }
  self->_isInTransitionAnimation = 1;

}

- (void)transitionDidEnd
{
  _UIVisualEffectBackdropView *backdropCaptureView;

  -[UIView removeFromSuperview](self->_backdropCaptureView, "removeFromSuperview");
  backdropCaptureView = self->_backdropCaptureView;
  self->_backdropCaptureView = 0;

  self->_isInTransitionAnimation = 0;
}

- (void)_createViewHierarchy
{
  uint64_t v3;
  __int128 v4;
  CGSize v5;
  _UIVisualEffectBackdropView *v6;
  UIVisualEffectView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _UIFloatingTabBarSelectionContainerView *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _UIFloatingTabBarSelectionContainerView *v22;
  UIView *v23;
  _UIFloatingTabBarCollectionView *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _UIContinuousSelectionGestureRecognizer *v31;
  UIPointerInteraction *v32;
  _UIFloatingTabBarDragController *v33;
  _UIFloatingTabBarDragController *dragController;
  UISpringLoadedInteractionEffect *v35;
  UISpringLoadedInteractionEffect *blinkEffect;
  _UIFloatingTabBarSpringLoadedInteractionBehavior *v37;
  UISpringLoadedInteraction *v38;
  UISpringLoadedInteraction *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  _UIFloatingTabBarCollectionViewLayout *v46;
  _UIFloatingTabBarSelectionContainerView *v47;
  UIView *v48;
  _UIVisualEffectBackdropView *v49;
  _UIFloatingTabBarPinnedItemsView *obj;
  void *v51;
  _UIFloatingTabBarPageButton *v52;
  _UIFloatingTabBarPageButton *v53;
  UIVisualEffectView *v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  id location;
  uint64_t v60;
  _QWORD v61[2];
  _QWORD v62[3];

  v62[1] = *MEMORY[0x1E0C80C00];
  self->_showRecentItem = 1;
  v3 = MEMORY[0x1E0C9BAA8];
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&self->_additionalTransform.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&self->_additionalTransform.c = v4;
  *(_OWORD *)&self->_additionalTransform.tx = *(_OWORD *)(v3 + 32);
  v5 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_frameForExpandedDropTarget.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_frameForExpandedDropTarget.size = v5;
  -[_UIFloatingTabBar _currentPlatformMetrics](self, "_currentPlatformMetrics");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(_UIVisualEffectBackdropView);
  -[UIView addSubview:](self, "addSubview:", v6);
  v49 = v6;
  objc_storeStrong((id *)&self->_backgroundCaptureView, v6);
  v7 = [UIVisualEffectView alloc];
  objc_msgSend(v51, "backgroundEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = -[UIVisualEffectView initWithEffect:](v7, "initWithEffect:", v8);

  -[_UIFloatingTabBar backdropGroupName](self, "backdropGroupName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView _setGroupName:](v54, "_setGroupName:", v9);

  -[UIVisualEffectView _setCaptureView:](v54, "_setCaptureView:", v49);
  -[UIView layer](v54, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShadowPathIsBounds:", 1);

  -[UIView layer](v54, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

  -[UIView layer](v54, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerRadius:", *MEMORY[0x1E0CD2FE8]);

  -[UIVisualEffectView _backgroundHost](v54, "_backgroundHost");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAllowsEdgeAntialiasing:", 1);

  -[UIView addSubview:](self, "addSubview:", v54);
  objc_storeStrong((id *)&self->_backgroundView, v54);
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "_setOverrideVibrancyTrait:", 1);
  objc_msgSend(v16, "_setOverrideUserInterfaceRenderingMode:", 2);
  objc_msgSend(v16, "setClipsToBounds:", 1);
  -[UIView addSubview:](self, "addSubview:", v16);
  objc_storeStrong((id *)&self->_contentView, v16);
  v17 = [_UIFloatingTabBarSelectionContainerView alloc];
  v18 = *MEMORY[0x1E0C9D648];
  v19 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v20 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v21 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v22 = -[_UIFloatingTabBarSelectionContainerView initWithFrame:](v17, "initWithFrame:", *MEMORY[0x1E0C9D648], v19, v20, v21);
  objc_msgSend(v16, "addSubview:", v22);
  v47 = v22;
  objc_storeStrong((id *)&self->_selectionContainerView, v22);
  v23 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v18, v19, v20, v21);
  -[UIView setClipsToBounds:](v23, "setClipsToBounds:", 1);
  objc_msgSend(v16, "addSubview:", v23);
  v48 = v23;
  objc_storeStrong((id *)&self->_collectionViewContainer, v23);
  v46 = -[_UIFloatingTabBarCollectionViewLayout initWithFloatingTabBar:]([_UIFloatingTabBarCollectionViewLayout alloc], "initWithFloatingTabBar:", self);
  v24 = -[UICollectionView initWithFrame:collectionViewLayout:]([_UIFloatingTabBarCollectionView alloc], "initWithFrame:collectionViewLayout:", v46, v18, v19, v20, v21);
  -[UICollectionView setPrefetchingEnabled:](v24, "setPrefetchingEnabled:", objc_msgSend(v51, "supportsGroupClusters") ^ 1);
  -[UICollectionView setDelegate:](v24, "setDelegate:", self);
  -[UICollectionView setBackgroundColor:](v24, "setBackgroundColor:", 0);
  -[UIScrollView setPagingEnabled:](v24, "setPagingEnabled:", 1);
  -[UICollectionView setAllowsSelection:](v24, "setAllowsSelection:", 0);
  -[UICollectionView setAllowsMultipleSelection:](v24, "setAllowsMultipleSelection:", 0);
  -[UIScrollView setShowsVerticalScrollIndicator:](v24, "setShowsVerticalScrollIndicator:", 0);
  -[UIScrollView setShowsHorizontalScrollIndicator:](v24, "setShowsHorizontalScrollIndicator:", 0);
  -[UIView setClipsToBounds:](v24, "setClipsToBounds:", 0);
  -[UIScrollView _setAdjustsTargetsOnContentOffsetChanges:](v24, "_setAdjustsTargetsOnContentOffsetChanges:", 0);
  -[UIScrollView _setAutoScrollEnabled:](v24, "_setAutoScrollEnabled:", 0);
  -[UIView layer](v24, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAllowsGroupOpacity:", 0);

  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v24, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("UIFloatingTabBar.Cell"));
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v24, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("UIFloatingTabBar.GroupCell"));
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v24, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("UIFloatingTabBar.PlaceholderCell"));
  objc_initWeak(&location, self);
  v26 = MEMORY[0x1E0C809B0];
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __41___UIFloatingTabBar__createViewHierarchy__block_invoke;
  v57[3] = &unk_1E16B3F40;
  objc_copyWeak(&v58, &location);
  -[_UIFloatingTabBarCollectionView setLayoutSubviewHandler:](v24, "setLayoutSubviewHandler:", v57);
  -[UIView addSubview:](v48, "addSubview:", v24);
  objc_storeStrong((id *)&self->_collectionView, v24);
  -[UIScrollView panGestureRecognizer](v24, "panGestureRecognizer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addGestureRecognizer:", v27);

  obj = -[_UIFloatingTabBarPinnedItemsView initWithFrame:]([_UIFloatingTabBarPinnedItemsView alloc], "initWithFrame:", v18, v19, v20, v21);
  objc_msgSend(v16, "addSubview:", obj);
  objc_storeStrong((id *)&self->_pinnedItemsView, obj);
  v53 = -[_UIFloatingTabBarPageButton initWithDirection:]([_UIFloatingTabBarPageButton alloc], "initWithDirection:", 0);
  -[_UIFloatingTabBarPageButton button](v53, "button");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addTarget:action:forControlEvents:", self, sel__didTapLeftArrowButton_, 0x2000);

  objc_msgSend(v16, "addSubview:", v53);
  objc_storeStrong((id *)&self->_leftArrowButton, v53);
  v52 = -[_UIFloatingTabBarPageButton initWithDirection:]([_UIFloatingTabBarPageButton alloc], "initWithDirection:", 1);
  -[_UIFloatingTabBarPageButton button](v52, "button");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addTarget:action:forControlEvents:", self, sel__didTapRightArrowButton_, 0x2000);

  objc_msgSend(v16, "addSubview:", v52);
  objc_storeStrong((id *)&self->_rightArrowButton, v52);
  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "_addScrollViewScrollObserver:", self);

  -[_UIFloatingTabBar _setNeedsSelectionFrameUpdate](self, "_setNeedsSelectionFrameUpdate");
  v31 = -[UIGestureRecognizer initWithTarget:action:]([_UIContinuousSelectionGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleSelectionGesture_);
  -[UIGestureRecognizer setCancelsTouchesInView:](v31, "setCancelsTouchesInView:", 0);
  -[UIGestureRecognizer setDelegate:](v31, "setDelegate:", self);
  objc_msgSend(v16, "addGestureRecognizer:", v31);
  objc_storeStrong((id *)&self->_selectionGestureRecognizer, v31);
  v32 = -[UIPointerInteraction initWithDelegate:]([UIPointerInteraction alloc], "initWithDelegate:", self);
  objc_msgSend(v16, "addInteraction:", v32);
  objc_storeStrong((id *)&self->_pointerInteraction, v32);
  v33 = -[_UIFloatingTabBarDragController initWithDelegate:view:]([_UIFloatingTabBarDragController alloc], "initWithDelegate:view:", self, self);
  dragController = self->_dragController;
  self->_dragController = v33;

  +[UISpringLoadedInteraction _blinkEffect](UISpringLoadedInteraction, "_blinkEffect");
  v35 = (UISpringLoadedInteractionEffect *)objc_claimAutoreleasedReturnValue();
  blinkEffect = self->_blinkEffect;
  self->_blinkEffect = v35;

  v37 = objc_alloc_init(_UIFloatingTabBarSpringLoadedInteractionBehavior);
  -[_UIFloatingTabBarSpringLoadedInteractionBehavior setTabBar:](v37, "setTabBar:", self);
  v38 = [UISpringLoadedInteraction alloc];
  v55[0] = v26;
  v55[1] = 3221225472;
  v55[2] = __41___UIFloatingTabBar__createViewHierarchy__block_invoke_2;
  v55[3] = &unk_1E16EA788;
  objc_copyWeak(&v56, &location);
  v39 = -[UISpringLoadedInteraction initWithInteractionBehavior:interactionEffect:activationHandler:](v38, "initWithInteractionBehavior:interactionEffect:activationHandler:", v37, v37, v55);
  objc_msgSend(v16, "addInteraction:", v39);
  _UIBarsSetAccessibilityLimits(self);
  -[UIView setTintAdjustmentMode:](self, "setTintAdjustmentMode:", 1);
  v62[0] = 0x1E1A994C8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[UIView _registerForTraitTokenChanges:withTarget:action:](self, "_registerForTraitTokenChanges:withTarget:action:", v40, self, sel_setNeedsLayout);

  v61[0] = 0x1E1A99540;
  v61[1] = 0x1E1A995A0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[UIView _registerForTraitTokenChanges:withTarget:action:](self, "_registerForTraitTokenChanges:withTarget:action:", v42, self, sel__updateContentSizeCategory);

  v60 = 0x1E1A994B0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[UIView _registerForTraitTokenChanges:withTarget:action:](self, "_registerForTraitTokenChanges:withTarget:action:", v44, self, sel__updateBackgroundShadow);

  objc_destroyWeak(&v56);
  objc_destroyWeak(&v58);
  objc_destroyWeak(&location);

}

- (void)_createDataSource
{
  UICollectionViewDiffableDataSource *v4;
  void *v5;
  UICollectionViewDiffableDataSource *v6;
  UICollectionViewDiffableDataSource *dataSource;
  _UIFloatingTabBarParser *v8;
  _UIFloatingTabBarParser *parser;
  void *v10;
  char v11;
  _UIFloatingTabBarParser *v12;
  _QWORD v13[4];
  id v14[2];
  id location;

  objc_initWeak(&location, self);
  v4 = [UICollectionViewDiffableDataSource alloc];
  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __38___UIFloatingTabBar__createDataSource__block_invoke;
  v13[3] = &unk_1E16EA7B0;
  objc_copyWeak(v14, &location);
  v14[1] = (id)a2;
  v6 = -[UICollectionViewDiffableDataSource initWithCollectionView:cellProvider:](v4, "initWithCollectionView:cellProvider:", v5, v13);
  dataSource = self->_dataSource;
  self->_dataSource = v6;

  v8 = objc_alloc_init(_UIFloatingTabBarParser);
  parser = self->_parser;
  self->_parser = v8;

  -[_UIFloatingTabBar _currentPlatformMetrics](self, "_currentPlatformMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "supportsGroupClusters");
  v12 = self->_parser;
  if (v12)
    v12->_supportsGroupClusters = v11;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

- (void)_invalidateDataSourceAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  -[_UIFloatingTabBar parser](self, "parser");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBar dragController](self, "dragController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pendingDropTab");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentUnavailableConfiguration setDocumentTargetView:]((uint64_t)v14, v6);

  -[_UIFloatingTabBar dragController](self, "dragController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pendingFavoriteOrder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBackgroundConfiguration _setImage:]((uint64_t)v14, v8);

  v9 = (void *)MEMORY[0x1E0C99E60];
  -[_UIFloatingTabBar dragController](self, "dragController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pendingDropTab");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithObjects:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBarParser setIgnoredFavoriteOrderItems:]((uint64_t)v14, v13);

  -[_UIFloatingTabBarParser reloadItems]((uint64_t)v14);
  -[_UIFloatingTabBar _updateDataSourceFromParserAnimated:](self, "_updateDataSourceFromParserAnimated:", v3);

}

- (void)_invalidateFavoriteOrderAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  -[_UIFloatingTabBar parser](self, "parser");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBar dragController](self, "dragController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pendingDropTab");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentUnavailableConfiguration setDocumentTargetView:]((uint64_t)v14, v6);

  -[_UIFloatingTabBar dragController](self, "dragController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pendingFavoriteOrder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBackgroundConfiguration _setImage:]((uint64_t)v14, v8);

  v9 = (void *)MEMORY[0x1E0C99E60];
  -[_UIFloatingTabBar dragController](self, "dragController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pendingDropTab");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithObjects:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBarParser setIgnoredFavoriteOrderItems:]((uint64_t)v14, v13);

  -[_UIFloatingTabBarParser invalidateFavorites]((uint64_t)v14);
  -[_UIFloatingTabBar _updateDataSourceFromParserAnimated:](self, "_updateDataSourceFromParserAnimated:", v3);

}

- (void)_updateDataSourceFromParserAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  UICollectionViewDiffableDataSource *dataSource;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  BOOL v19;
  id location;
  _QWORD v21[2];

  v3 = a3;
  v21[1] = *MEMORY[0x1E0C80C00];
  -[_UIFloatingTabBar parser](self, "parser");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init((Class)off_1E1679A30);
  objc_msgSend(v6, "appendSectionsWithIdentifiers:", &unk_1E1A95288);
  -[_UIFloatingTabBarParser fixedItems](v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendItemsWithIdentifiers:", v7);

  objc_msgSend(v6, "appendSectionsWithIdentifiers:", &unk_1E1A952A0);
  -[_UIFloatingTabBarParser items](v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendItemsWithIdentifiers:", v8);

  -[_UIFloatingTabBar _validateRecentItemForParser:](self, "_validateRecentItemForParser:", v5);
  -[_UIFloatingTabBar recentItem](self, "recentItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[_UIFloatingTabBar tabModel](self, "tabModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEditing");

    if ((v11 & 1) == 0)
    {
      objc_msgSend(v6, "appendSectionsWithIdentifiers:", &unk_1E1A952B8);
      -[_UIFloatingTabBar recentItem](self, "recentItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendItemsWithIdentifiers:", v13);

    }
  }
  objc_storeStrong((id *)&self->_lastSnapshot, v6);
  objc_initWeak(&location, self);
  dataSource = self->_dataSource;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57___UIFloatingTabBar__updateDataSourceFromParserAnimated___block_invoke;
  v17[3] = &unk_1E16BFC68;
  objc_copyWeak(&v18, &location);
  v19 = v3;
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:completion:](dataSource, "applySnapshot:animatingDifferences:completion:", v6, v3, v17);
  -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBarParser pinnedItems](v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setItems:animated:", v16, v3);

  -[_UIFloatingTabBar _updateTabBarPaginationAnimated:](self, "_updateTabBarPaginationAnimated:", v3);
  -[_UIFloatingTabBar _updateSelectionViewFrameAnimated:completion:](self, "_updateSelectionViewFrameAnimated:completion:", v3, 0);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)_updateContentSizeCategory
{
  void *v3;
  id v4;

  -[_UIFloatingTabBar _setNeedsPaginationUpdate](self, "_setNeedsPaginationUpdate");
  -[_UIFloatingTabBar _setNeedsSelectionFrameUpdate](self, "_setNeedsSelectionFrameUpdate");
  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateLayout");

}

- (id)_viewForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "section") == 3)
  {
    -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "item");

    objc_msgSend(v5, "itemViewForItemAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UIFloatingTabBar collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cellForItemAtIndexPath:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)_updateTransform
{
  void *v3;
  void *v4;
  __int128 v5;
  void *v6;
  void (**v7)(_QWORD);
  void *v8;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v13;
  CGAffineTransform v14;

  -[_UIFloatingTabBar _currentPlatformMetrics](self, "_currentPlatformMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v14, 0, sizeof(v14));
  -[_UIFloatingTabBar tabModel](self, "tabModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEditing"))
  {
    if (v3)
      objc_msgSend(v3, "editModeTransform");
    else
      memset(&v14, 0, sizeof(v14));
  }
  else
  {
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v14.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v14.c = v5;
    *(_OWORD *)&v14.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }

  memset(&v13, 0, sizeof(v13));
  -[_UIFloatingTabBar additionalTransform](self, "additionalTransform");
  t1 = v14;
  CGAffineTransformConcat(&v13, &t1, &t2);
  -[UIView transform](self, "transform");
  t1 = v13;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    v9 = v13;
    -[UIView setTransform:](self, "setTransform:", &v9);
    -[_UIFloatingTabBar contentFrameDidChangeBlock](self, "contentFrameDidChangeBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[_UIFloatingTabBar contentFrameDidChangeBlock](self, "contentFrameDidChangeBlock");
      v7 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
      -[_UIFloatingTabBar contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "frame");
      v7[2](v7);

    }
  }

}

- (void)_updateBackgroundShadow
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[_UIFloatingTabBar _currentPlatformMetrics](self, "_currentPlatformMetrics");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  -[_UIFloatingTabBar tabModel](self, "tabModel");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEditing"))
    goto LABEL_4;
  objc_msgSend(v9, "editModeBackgroundShadowProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v9, "editModeBackgroundShadowProvider");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, objc_msgSend(v6, "userInterfaceStyle"));
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
LABEL_4:

  }
  -[_UIFloatingTabBar backgroundView](self, "backgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applyToView:", v8);

}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  if (v9 != width || v8 != height)
    -[_UIFloatingTabBar _setNeedsPaginationUpdate](self, "_setNeedsPaginationUpdate");
  v11.receiver = self;
  v11.super_class = (Class)_UIFloatingTabBar;
  -[UIView setBounds:](&v11, sel_setBounds_, x, y, width, height);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  if (v9 != width || v8 != height)
    -[_UIFloatingTabBar _setNeedsPaginationUpdate](self, "_setNeedsPaginationUpdate");
  v11.receiver = self;
  v11.super_class = (Class)_UIFloatingTabBar;
  -[UIView setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double height;
  _UIFloatingTabBarItemView *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  width = a3.width;
  if (self->_largestItemHeight == 0.0)
  {
    height = a3.height;
    v6 = objc_alloc_init(_UIFloatingTabBarItemView);
    -[UIView setHidden:](v6, "setHidden:", 1);
    -[_UIFloatingTabBarItemView setEditing:](v6, "setEditing:", 0);
    -[_UIFloatingTabBar contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v6);

    -[_UIFloatingTabBarItemView sizeThatFits:](v6, "sizeThatFits:", width, height);
    self->_largestItemHeight = v8;
    -[_UIFloatingTabBarItemView baselineOffsetFromTop](v6, "baselineOffsetFromTop");
    self->_minimumItemBaselineFromTop = v9;
    -[UIView removeFromSuperview](v6, "removeFromSuperview");

  }
  -[_UIFloatingTabBar _currentPlatformMetrics](self, "_currentPlatformMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "backgroundInsets");
  v12 = v11;
  v14 = v13;

  v15 = self->_largestItemHeight + v12 + v14;
  v16 = width;
  result.height = v15;
  result.width = v16;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  _BOOL4 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  _BOOL4 v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double largestPageWidth;
  void *v35;
  double v36;
  double v37;
  double largestItemHeight;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  void *v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  BOOL v84;
  void (**v85)(double, double, double, double);
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  CGFloat v105;
  objc_super v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;

  v106.receiver = self;
  v106.super_class = (Class)_UIFloatingTabBar;
  -[UIView layoutSubviews](&v106, sel_layoutSubviews);
  -[_UIFloatingTabBar _updatePaginationIfNeeded](self, "_updatePaginationIfNeeded");
  -[_UIFloatingTabBar _currentPlatformMetrics](self, "_currentPlatformMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[UIView bounds](self, "bounds");
  v90 = v5;
  v91 = v6;
  v8 = v7;
  v10 = v9;
  -[_UIFloatingTabBar leftArrowButton](self, "leftArrowButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", v8, v10);
  v95 = v12;

  -[_UIFloatingTabBar sidebarButton](self, "sidebarButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeThatFits:", v8, v10);
  v15 = v14;

  v16 = -[_UIFloatingTabBar showsSidebarButton](self, "showsSidebarButton");
  v17 = *MEMORY[0x1E0C9D820];
  if (v16)
    v17 = v15;
  v102 = v15;
  v103 = v17;
  -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v8;
  v89 = v10;
  objc_msgSend(v18, "sizeThatFits:", v8, v10);
  v20 = v19;
  v96 = v19;

  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "currentPage");
  v23 = v22;

  v24 = fmax(fmin(v23, 1.0), 0.0);
  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "pages");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = fmax(fmin((double)(unint64_t)objc_msgSend(v26, "count") - v23 + -1.0, 1.0), 0.0);

  objc_msgSend(v3, "backgroundInsets");
  v29 = v28;
  v104 = v28;
  v92 = v30;
  v32 = v31;
  v101 = v33;
  largestPageWidth = self->_largestPageWidth;
  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "viewWidthForPageProgress:", v23);
  v37 = v36;

  largestItemHeight = self->_largestItemHeight;
  -[_UIFloatingTabBar collectionViewContainer](self, "collectionViewContainer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v4)
    v41 = v27;
  else
    v41 = v24;
  if (v4)
    v42 = v24;
  else
    v42 = v27;
  v98 = v41;
  v99 = v42;
  v94 = v95 * v41;
  v97 = v95 * v42;
  v43 = v20 + v95 * v42 + v103 + v95 * v41;
  v44 = v37 + v43;
  v45 = v32 + v29 + largestItemHeight;
  if (v4)
    v46 = v44 - largestPageWidth - v95 * v42 - v103;
  else
    v46 = v103 + v95 * v41;
  v47 = v103 + v44 - v43;
  if (v4)
    v47 = 0.0;
  v93 = v47;
  objc_msgSend(v39, "setFrame:", v92, 0.0, v44, v45);

  -[_UIFloatingTabBar collectionViewContainer](self, "collectionViewContainer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "_setContinuousCornerRadius:", v45 * 0.5);

  -[_UIFloatingTabBar selectionContainerView](self, "selectionContainerView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setFrame:", v92, 0.0, v44, v45);

  -[_UIFloatingTabBar selectionContainerView](self, "selectionContainerView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v45 * 0.5;
  objc_msgSend(v50, "_setContinuousCornerRadius:", v45 * 0.5);

  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "frame");
  v86 = v52;

  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v46;
  objc_msgSend(v53, "setFrame:", v46, 0.0, largestPageWidth, v45);

  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "_setVisibleRectEdgeInsets:", 0.0, -(v103 + v95 + v43), 0.0, -(v103 + v95 + v43));

  -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setFrame:", v92 + v94 + v93, 0.0, v96, v45);

  v56 = self->_largestItemHeight;
  if (v44 == 0.0)
    v57 = 0.0;
  else
    v57 = v101 + v92 + v44;
  -[_UIFloatingTabBar leftArrowButton](self, "leftArrowButton");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setFrame:", v94 - v95, v104, v95, v56);

  -[_UIFloatingTabBar leftArrowButton](self, "leftArrowButton");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setContentOpacity:", v98);

  -[_UIFloatingTabBar rightArrowButton](self, "rightArrowButton");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setFrame:", v57 - v97, v104, v95, v56);

  -[_UIFloatingTabBar rightArrowButton](self, "rightArrowButton");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setContentOpacity:", v99);

  if (v4)
  {
    -[_UIFloatingTabBar rightArrowButton](self, "rightArrowButton");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "frame");
    v63 = CGRectGetMinX(v107) - v102 - v101;
  }
  else
  {
    -[_UIFloatingTabBar leftArrowButton](self, "leftArrowButton");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "frame");
    v63 = v92 + CGRectGetMaxX(v108);
  }

  -[_UIFloatingTabBar sidebarButton](self, "sidebarButton");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setFrame:", v63, v104, v102, v56);

  if (-[_UIFloatingTabBar showsSidebarButton](self, "showsSidebarButton"))
    v65 = 1.0;
  else
    v65 = 0.0;
  -[_UIFloatingTabBar sidebarButton](self, "sidebarButton");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setAlpha:", v65);

  v67 = v90 + (v88 - v57) * 0.5;
  v68 = v91 + (v89 - v45) * 0.5;
  -[_UIFloatingTabBar contentView](self, "contentView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "frame");
  v105 = v70;
  v72 = v71;
  v74 = v73;
  v76 = v75;

  -[_UIFloatingTabBar contentView](self, "contentView");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setFrame:", v67, v68, v57, v45);

  -[_UIFloatingTabBar backgroundCaptureView](self, "backgroundCaptureView");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setFrame:", v67, v68, v57, v45);

  -[_UIFloatingTabBar backgroundView](self, "backgroundView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setFrame:", v67, v68, v57, v45);

  -[_UIFloatingTabBar contentView](self, "contentView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "_setContinuousCornerRadius:", v100);

  -[_UIFloatingTabBar backgroundView](self, "backgroundView");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "_setContinuousCornerRadius:", v100);

  -[_UIFloatingTabBar contentFrameDidChangeBlock](self, "contentFrameDidChangeBlock");
  v82 = objc_claimAutoreleasedReturnValue();
  if (v82)
  {
    v83 = (void *)v82;
    v109.origin.x = v90 + (v88 - v57) * 0.5;
    v109.origin.y = v91 + (v89 - v45) * 0.5;
    v109.size.width = v57;
    v109.size.height = v45;
    v110.origin.x = v105;
    v110.origin.y = v72;
    v110.size.width = v74;
    v110.size.height = v76;
    v84 = CGRectEqualToRect(v109, v110);

    if (!v84)
    {
      -[_UIFloatingTabBar contentFrameDidChangeBlock](self, "contentFrameDidChangeBlock");
      v85 = (void (**)(double, double, double, double))objc_claimAutoreleasedReturnValue();
      v85[2](v67, v68, v57, v45);

    }
  }
  if ((*(_BYTE *)&self->_needsUpdate & 2) != 0 || v86 != v87)
    -[_UIFloatingTabBar _updateSelectionViewFrameAnimated:completion:](self, "_updateSelectionViewFrameAnimated:completion:", 0, 0);

}

- (void)_updateTabBarPaginationAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL IsEmpty;
  _QWORD v9[5];
  CGRect v10;

  v3 = a3;
  -[_UIFloatingTabBar _setNeedsPaginationUpdate](self, "_setNeedsPaginationUpdate");
  if (v3)
  {
    -[UIView window](self, "window");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[_UIFloatingTabBar contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "frame");
      IsEmpty = CGRectIsEmpty(v10);

      if (!IsEmpty)
      {
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __53___UIFloatingTabBar__updateTabBarPaginationAnimated___block_invoke;
        v9[3] = &unk_1E16B1B28;
        v9[4] = self;
        -[_UIFloatingTabBar _animateSelection:completion:](self, "_animateSelection:completion:", v9, 0);
      }
    }
  }
}

- (void)_setNeedsPaginationUpdate
{
  *(_BYTE *)&self->_needsUpdate |= 1u;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setNeedsPaginationScrollTarget
{
  *(_BYTE *)&self->_needsUpdate |= 0x10u;
}

- (CGSize)_maximumContainerSizeForPagination
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  -[_UIFloatingTabBar _currentPlatformMetrics](self, "_currentPlatformMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBar expandedGroupItem](self, "expandedGroupItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_4:
    objc_msgSend(v3, "maximumExpandedWidth");
    v8 = v7;
    v9 = 0.95;
    goto LABEL_6;
  }
  -[_UIFloatingTabBar tabModel](self, "tabModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEditing");

  if (v6)
    goto LABEL_4;
  objc_msgSend(v3, "maximumWidth");
  v8 = v10;
  v9 = 0.65;
LABEL_6:
  +[UIViewController _horizontalContentMarginForView:](UIViewController, "_horizontalContentMarginForView:", self);
  v12 = v11;
  -[UIView bounds](self, "bounds");
  v14 = v13;
  v16 = v15 - (v12 + v12);
  -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sizeThatFits:", v16, v14);
  v19 = v18;

  if (-[_UIFloatingTabBar showsSidebarButton](self, "showsSidebarButton"))
  {
    -[_UIFloatingTabBar sidebarButton](self, "sidebarButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sizeThatFits:", v16, v14);
    v19 = v19 + v21;

  }
  v22 = fmin(v8, v9 * v16) - v19;
  v23 = v14;
  result.height = v23;
  result.width = v22;
  return result;
}

- (void)_updatePaginationIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  _UIEditMenuListPage *v17;
  _BOOL8 v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _UIFloatingTabBarItemView *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  _BOOL4 v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  int v51;
  double v52;
  double v53;
  _UIEditMenuListPage *v54;
  unint64_t v55;
  void *v56;
  double v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  double v73;
  uint64_t i;
  double v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  id v83;
  id v84;
  void *v85;
  char v86;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  double v102;
  double v103;
  id v104;
  double v105;
  double v106;
  _BOOL4 v107;
  uint64_t v108;
  double v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[96];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_needsUpdate & 1) != 0)
  {
    v100 = 416;
    -[_UIFloatingTabBar collectionView](self, "collectionView");
    v101 = objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](self, "traitCollection");
    v104 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBar _currentPlatformMetrics](self, "_currentPlatformMetrics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBar lastSnapshot](self, "lastSnapshot");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIFloatingTabBar _maximumContainerSizeForPagination](self, "_maximumContainerSizeForPagination");
    v7 = v6;
    v9 = v8;
    -[_UIFloatingTabBar leftArrowButton](self, "leftArrowButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sizeThatFits:", v7, v9);
    v12 = v11;

    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = objc_msgSend(v5, "count");
    v98 = (uint64_t)&v98;
    MEMORY[0x1E0C80A78](v14);
    v16 = (char *)&v98 - v15;
    v17 = -[_UIEditMenuListPage initWithStartIndex:]([_UIEditMenuListPage alloc], "initWithStartIndex:", 0);
    objc_msgSend(v13, "addObject:", v17);
    v18 = -[_UIFloatingTabBar isEditing](self, "isEditing");
    v99 = v3;
    objc_msgSend(v3, "editModeItemMargins");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v27 = objc_alloc_init(_UIFloatingTabBarItemView);
    -[_UIFloatingTabBarItemView setSuppressJiggleAnimation:](v27, "setSuppressJiggleAnimation:", 1);
    -[UIView setHidden:](v27, "setHidden:", 1);
    v107 = v18;
    -[_UIFloatingTabBarItemView setEditing:](v27, "setEditing:", v18);
    -[_UIFloatingTabBar contentView](self, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", v27);

    v29 = objc_msgSend(v5, "count");
    v109 = v9;
    v108 = v12;
    if (v29)
    {
      v30 = 0;
      v103 = *MEMORY[0x1E0C9D820];
      v102 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v106 = v22 + v26;
      v105 = v20 + v24;
      v31 = 0.0;
      v32 = v9;
      v33 = v7;
      do
      {
        objc_msgSend(v5, "objectAtIndex:", v30);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "count");
        objc_msgSend(v5, "count");
        UIRoundToViewScale(self);
        v36 = v35;
        objc_msgSend(v34, "contentTab");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          objc_msgSend(v34, "contentTab");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIFloatingTabBarItemView setItem:](v27, "setItem:", v38);

          -[_UIFloatingTabBarItemView sizeThatFits:](v27, "sizeThatFits:", v7, v109);
          v40 = v39;
          v42 = v41;
          -[_UIFloatingTabBarItemView baselineOffsetFromTop](v27, "baselineOffsetFromTop");
          v44 = v43;
          v45 = -[_UIFloatingTabBarItemView isCustomizableItem](v27, "isCustomizableItem");
          v46 = v106 + v40;
          if (v45 && v107)
          {
            v42 = v105 + v42;
            v40 = v106 + v40;
          }
        }
        else
        {
          objc_msgSend(v34, "children");
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (v47)
          {
            objc_msgSend(v34, "children");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            +[_UIFloatingTabBarGroupCell layoutSizeForGroupItems:traitCollection:](_UIFloatingTabBarGroupCell, "layoutSizeForGroupItems:traitCollection:", v48, v104);
            v40 = v49;
            v42 = v50;

          }
          else
          {
            v51 = objc_msgSend(v34, "isPlaceholder");
            if (v51)
              v42 = 0.0;
            else
              v42 = v102;
            v46 = 80.0;
            if (v51)
              v40 = 80.0;
            else
              v40 = v103;
          }
          v44 = v109;
        }
        v52 = fmin(v40, v36);
        *(double *)&v16[8 * v30] = v52;
        -[_UIEditMenuListPage width](v17, "width", v46);
        UIRoundToViewScale(self);
        if (v53 > v36)
        {
          v54 = -[_UIEditMenuListPage initWithStartIndex:]([_UIEditMenuListPage alloc], "initWithStartIndex:", v30);

          objc_msgSend(v13, "addObject:", v54);
          v17 = v54;
        }
        -[_UIEditMenuListPage appendItemWithWidth:](v17, "appendItemWithWidth:", v52);
        v31 = fmax(v31, v42);
        v32 = fmin(v32, v44);

        ++v30;
        v7 = v33;
      }
      while (v30 < objc_msgSend(v5, "count"));
    }
    else
    {
      v31 = 0.0;
      v32 = v9;
    }
    v55 = objc_msgSend(v13, "count");
    v56 = (void *)v101;
    if (v55 >= 2)
    {
      UIRoundToViewScale(self);
      v58 = v57;
      v59 = -[_UIEditMenuListPage range](v17, "range");
      v60 = v59 - 1;
      if (v59 != 1)
      {
        v61 = 0.0;
        do
        {
          v62 = *(double *)&v16[8 * v60];
          -[_UIEditMenuListPage width](v17, "width");
          UIRoundToViewScale(self);
          if (v63 >= v58)
            break;
          v61 = v61 + v62;
          -[_UIEditMenuListPage prependItemWithWidth:](v17, "prependItemWithWidth:", v62);
          --v60;
        }
        while (v60);
        if (v61 > 0.0)
        {
          objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v13, "count") - 2);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "setOverlapWidth:", v61);

        }
      }
    }
    if (v107 && !objc_msgSend(v5, "count"))
    {
      -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "items");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v66, "count");

      if (!v67)
        -[_UIEditMenuListPage appendItemWithWidth:](v17, "appendItemWithWidth:", 80.0);
    }
    v113 = 0u;
    v112 = 0u;
    v111 = 0u;
    v110 = 0u;
    v68 = v13;
    v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v110, v114, 16);
    if (v69)
    {
      v70 = v69;
      v71 = *(_QWORD *)v111;
      v72 = 0.0;
      v73 = v109;
      do
      {
        for (i = 0; i != v70; ++i)
        {
          if (*(_QWORD *)v111 != v71)
            objc_enumerationMutation(v68);
          objc_msgSend(*(id *)(*((_QWORD *)&v110 + 1) + 8 * i), "width");
          v72 = fmax(v75, v72);
        }
        v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v110, v114, 16);
      }
      while (v70);
    }
    else
    {
      v72 = 0.0;
      v73 = v109;
    }

    self->_largestPageWidth = v72;
    if (!objc_msgSend(v5, "count") || v31 == 0.0)
    {
      -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "items");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v77, "count");

      if (v78)
      {
        -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "sizeThatFits:", v7, v73);
        v31 = v80;

      }
      else
      {
        -[_UIFloatingTabBarItemView sizeThatFits:](v27, "sizeThatFits:", v7, v73);
        v31 = v81;
      }
      -[_UIFloatingTabBarItemView baselineOffsetFromTop](v27, "baselineOffsetFromTop");
      v32 = v82;
    }
    self->_largestItemHeight = v31;
    self->_minimumItemBaselineFromTop = v32;
    objc_msgSend(v56, "pages");
    v83 = (id)objc_claimAutoreleasedReturnValue();
    v84 = v68;
    v85 = v84;
    if (v83 == v84)
    {

      v87 = v85;
    }
    else
    {
      if (v84 && v83)
      {
        v86 = objc_msgSend(v83, "isEqual:", v84);

        if ((v86 & 1) != 0)
          goto LABEL_60;
      }
      else
      {

      }
      -[_UIFloatingTabBar _indexPathForSelectedItem](self, "_indexPathForSelectedItem");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[_UIFloatingTabBar isEditing](self, "isEditing") && v87)
      {
        -[_UIFloatingTabBar collectionView](self, "collectionView");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "indexPathsForVisibleItems");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = objc_msgSend(v89, "containsObject:", v87);

        if (v90)
          -[_UIFloatingTabBar _setNeedsScrollToSelectedItem](self, "_setNeedsScrollToSelectedItem");
      }
      -[_UIFloatingTabBar _setNeedsSelectionFrameUpdate](self, "_setNeedsSelectionFrameUpdate");
      -[_UIFloatingTabBar _setNeedsPaginationScrollTarget](self, "_setNeedsPaginationScrollTarget");
    }

LABEL_60:
    objc_msgSend(v56, "contentInset");
    v92 = v91;
    v94 = v93;
    v96 = v95;
    -[_UIEditMenuListPage width](v17, "width");
    objc_msgSend(v56, "setContentInset:", v92, v94, v96, v72 - v97);
    objc_msgSend(v56, "setPages:", v85);
    objc_msgSend(v56, "setScrollEnabled:", (unint64_t)objc_msgSend(v85, "count") > 1);
    -[_UIFloatingTabBar setScrubbingEnabled:](self, "setScrubbingEnabled:", objc_msgSend(v85, "count") == 1);
    -[_UIFloatingTabBar _setNeedsSelectionAlphaUpdate](self, "_setNeedsSelectionAlphaUpdate");
    -[UIView removeFromSuperview](v27, "removeFromSuperview");
    *((_BYTE *)&self->super.super.super.isa + v100) &= ~1u;

  }
}

- (void)_didTapLeftArrowButton:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;

  v4 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection", a3);
  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "incrementTargetPage");
  else
    objc_msgSend(v5, "decrementTargetPage");

  -[_UIFloatingTabBar _updateSelectionViewVisibilityAnimated:](self, "_updateSelectionViewVisibilityAnimated:", 1);
}

- (void)_didTapRightArrowButton:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;

  v4 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection", a3);
  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "decrementTargetPage");
  else
    objc_msgSend(v5, "incrementTargetPage");

  -[_UIFloatingTabBar _updateSelectionViewVisibilityAnimated:](self, "_updateSelectionViewVisibilityAnimated:", 1);
}

- (BOOL)scrubbingEnabled
{
  void *v2;
  char v3;

  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "bounces") ^ 1;

  return v3;
}

- (void)setScrubbingEnabled:(BOOL)a3
{
  double v4;
  _BOOL8 v5;
  void *v6;
  id v7;

  if (a3)
    v4 = 0.0;
  else
    v4 = 10.0;
  v5 = !a3;
  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBounces:", v5);

  -[_UIFloatingTabBar selectionGestureRecognizer](self, "selectionGestureRecognizer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowableMovement:", v4, v4);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _UIFloatingTabBar *v8;
  _UIFloatingTabBar *v9;
  _UIFloatingTabBar *v11;
  objc_super v13;
  CGPoint v14;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UIFloatingTabBar;
  -[UIView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
  v8 = (_UIFloatingTabBar *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 == self || v8 == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && -[_UIFloatingTabBar isEditing](self, "isEditing")
      && !CGRectIsNull(self->_frameForExpandedDropTarget)
      && (v14.x = x, v14.y = y, CGRectContainsPoint(self->_frameForExpandedDropTarget, v14)))
    {
      v11 = self;
    }
    else
    {
      v11 = 0;
    }

    v9 = v11;
  }

  return v9;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[_UIFloatingTabBar selectionGestureRecognizer](self, "selectionGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[_UIFloatingTabBar _indexPathForGestureRecognizer:](self, "_indexPathForGestureRecognizer:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[_UIFloatingTabBar tabModel](self, "tabModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(self) = objc_msgSend(v8, "isEditing") ^ 1;

LABEL_9:
      goto LABEL_10;
    }
LABEL_8:
    LOBYTE(self) = 0;
    goto LABEL_9;
  }
  -[_UIFloatingTabBar editModeGestureRecognizer](self, "editModeGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[_UIFloatingTabBar tabModel](self, "tabModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEditable") && !-[_UIFloatingTabBar isEditing](self, "isEditing"))
    {
      LOBYTE(self) = !self->_isInTransitionAnimation;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  LOBYTE(self) = 1;
LABEL_10:

  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  id v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[_UIFloatingTabBar selectionGestureRecognizer](self, "selectionGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[_UIFloatingTabBar collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "panGestureRecognizer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 == v6)
    {
      v9 = 1;
    }
    else
    {
      -[_UIFloatingTabBar editModeGestureRecognizer](self, "editModeGestureRecognizer");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v9 = v12 == v6;

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_indexPathForGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double MidY;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  int64_t v21;
  void *v22;
  uint64_t v23;
  CGPoint v25;
  CGRect v26;
  CGRect v27;

  v4 = a3;
  -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "itemIndexForItemAtLocation:", v7, v9);

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[_UIFloatingTabBar collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v12);
    v14 = v13;

    -[_UIFloatingTabBar collectionView](self, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    MidY = CGRectGetMidY(v26);

    -[_UIFloatingTabBar collectionView](self, "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v25.x = v14;
    v25.y = MidY;
    v18 = CGRectContainsPoint(v27, v25);

    if (v18)
    {
      -[_UIFloatingTabBar collectionView](self, "collectionView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "indexPathForItemAtPoint:", v14, MidY);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = 0;
    }
    v21 = -[_UIFloatingTabBar _pageIndexForItemAtIndexPath:](self, "_pageIndexForItemAtIndexPath:", v20);
    -[_UIFloatingTabBar collectionView](self, "collectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "targetPage");

    if (v21 != v23)
    {

      v20 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v11, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (void)_handleSelectionGesture:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  BOOL v25;
  void *v26;
  NSIndexPath *highlightedIndexPath;
  void *v28;
  id v29;
  CGRect v30;
  CGRect v31;

  v29 = a3;
  -[_UIFloatingTabBar _indexPathForGestureRecognizer:](self, "_indexPathForGestureRecognizer:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[_UIFloatingTabBar highlightedIndexPath](self, "highlightedIndexPath");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  v8 = v7;
  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isDecelerating"))
  {
    -[_UIFloatingTabBar collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "panGestureRecognizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "state") == 5;

  }
  else
  {
    v12 = 1;
  }

  if (!-[_UIFloatingTabBar selectionViewFollowsHighlightedItem](self, "selectionViewFollowsHighlightedItem")
    && objc_msgSend(v29, "state") != 1)
  {
    -[_UIFloatingTabBar contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "locationInView:", v13);
    v15 = v14;
    objc_msgSend(v13, "bounds");
    v16 = vabdd_f64(v15, CGRectGetMidY(v30));
    objc_msgSend(v13, "bounds");
    v17 = v16 + CGRectGetHeight(v31) * -0.5;
    -[_UIFloatingTabBar _currentPlatformMetrics](self, "_currentPlatformMetrics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "selectionDistanceThresholdForUnselectedItems");
    v20 = v19;

    if (v17 > v20)
    {

      v8 = 0;
    }

  }
  v21 = objc_msgSend(v29, "state");
  switch(v21)
  {
    case 3:

      v24 = 0;
      if (v8)
        v23 = v12;
      else
        v23 = 0;
      break;
    case 2:
LABEL_16:
      v23 = 0;
      v24 = v8;
      break;
    case 1:
      -[_UIFloatingTabBar _indexPathForSelectedItem](self, "_indexPathForSelectedItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFloatingTabBar setSelectionViewFollowsHighlightedItem:](self, "setSelectionViewFollowsHighlightedItem:", objc_msgSend(v8, "isEqual:", v22));

      goto LABEL_16;
    default:

      -[_UIFloatingTabBar setSelectionViewFollowsHighlightedItem:](self, "setSelectionViewFollowsHighlightedItem:", 1);
      v23 = 0;
      v24 = 0;
      break;
  }
  v25 = -[_UIFloatingTabBar selectionViewFollowsHighlightedItem](self, "selectionViewFollowsHighlightedItem");
  -[_UIFloatingTabBar selectionViewIndexPath](self, "selectionViewIndexPath");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v24, "isEqual:", v26) & 1) != 0)
  {

    -[_UIFloatingTabBar setHighlightedIndexPath:](self, "setHighlightedIndexPath:", v24);
  }
  else
  {
    highlightedIndexPath = self->_highlightedIndexPath;
    -[_UIFloatingTabBar selectionViewIndexPath](self, "selectionViewIndexPath");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(highlightedIndexPath) = -[NSIndexPath isEqual:](highlightedIndexPath, "isEqual:", v28);

    -[_UIFloatingTabBar setHighlightedIndexPath:](self, "setHighlightedIndexPath:", v24);
    if (((highlightedIndexPath | v25) & 1) == 0)
      goto LABEL_25;
  }
  -[_UIFloatingTabBar _updateSelectionViewFrameAnimated:completion:](self, "_updateSelectionViewFrameAnimated:completion:", 1, 0);
LABEL_25:
  if (v23)
    -[_UIFloatingTabBar _selectItemAtIndexPath:](self, "_selectItemAtIndexPath:", v8);

}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  int64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  uint64_t v77;
  CGPoint v79;
  CGRect v80;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "location");
  v11 = v10;
  v13 = v12;
  -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertPoint:toView:", v14, v11, v13);
  v16 = v15;
  v18 = v17;

  -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "itemIndexForItemAtLocation:", v16, v18);

  if (v20 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v20, 3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "itemFrameForItemAtIndex:", v20);
    v59 = v58;
    v61 = v60;
    v63 = v62;
    v65 = v64;

    -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "convertRect:toView:", v67, v59, v61, v63, v65);
    v69 = v68;
    v71 = v70;
    v73 = v72;
    v75 = v74;

    +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v33, v69, v71, v73, v75);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v7, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "location");
  v23 = v22;
  v25 = v24;
  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "convertPoint:toView:", v26, v23, v25);
  v28 = v27;
  v30 = v29;

  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bounds");
  v79.x = v28;
  v79.y = v30;
  LODWORD(v26) = CGRectContainsPoint(v80, v79);

  if (!(_DWORD)v26)
    goto LABEL_8;
  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "indexPathForItemAtPoint:", v28, v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = -[_UIFloatingTabBar _pageIndexForItemAtIndexPath:](self, "_pageIndexForItemAtIndexPath:", v33);
  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "targetPage");

  if (v34 != v36)
  {

LABEL_8:
    v56 = 0;
    v33 = 0;
    goto LABEL_9;
  }
  if (v33)
  {
    -[_UIFloatingTabBar collectionView](self, "collectionView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "cellForItemAtIndexPath:", v33);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "bounds");
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v46 = v45;
    objc_msgSend(v7, "view");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "convertRect:toView:", v47, v40, v42, v44, v46);
    v49 = v48;
    v51 = v50;
    v53 = v52;
    v55 = v54;

    +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v33, v49, v51, v53, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v56 = 0;
  }
LABEL_9:
  -[_UIFloatingTabBar tabModel](self, "tabModel");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v76, "isEditing"))
  {
LABEL_12:

    goto LABEL_13;
  }
  v77 = objc_msgSend(v33, "section");

  if (v77 != 1)
  {
    v76 = v56;
    v56 = 0;
    goto LABEL_12;
  }
LABEL_13:

  return v56;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  _UIFloatingTabBar *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIPreviewTarget *v21;
  void *v22;
  int v23;
  void *v24;
  UITargetedPreview *v25;
  __objc2_class *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  char v31;
  void *v32;
  char v33;
  UIView *v34;
  UIView *v35;
  _UIPortalView *v36;
  void *v37;
  void *v38;
  _UIPortalView *v39;
  _UIPortalView *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  UITargetedPreview *v44;
  void *v45;
  void *v46;
  UITargetedPreview *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  CGRect v61;

  objc_msgSend(a4, "identifier", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self;
  -[_UIFloatingTabBar _viewForItemAtIndexPath:](v6, "_viewForItemAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "superview");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "center");
  objc_msgSend(v16, "convertPoint:toView:", v6);
  v18 = v17;
  v20 = v19;

  v21 = -[UIPreviewTarget initWithContainer:center:]([UIPreviewTarget alloc], "initWithContainer:center:", v6, v18, v20);
  -[_UIFloatingTabBar tabModel](v6, "tabModel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEditing");

  if (v23)
  {
    -[_UIFloatingTabBar _targetedPreviewForTabAtIndexPath:](v6, "_targetedPreviewForTabAtIndexPath:", v5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "retargetedPreviewWithTarget:", v21);
    v25 = (UITargetedPreview *)objc_claimAutoreleasedReturnValue();

    v26 = UIPointerLiftEffect;
LABEL_14:
    -[__objc2_class effectWithPreview:](v26, "effectWithPreview:", v25);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  -[_UIFloatingTabBar _indexPathForSelectedItem](v6, "_indexPathForSelectedItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v5;
  v29 = v27;
  v30 = v29;
  if (v28 == v29)
  {

  }
  else
  {
    if (!v28 || !v29)
    {

LABEL_12:
      goto LABEL_13;
    }
    v31 = objc_msgSend(v28, "isEqual:", v29);

    if ((v31 & 1) == 0)
      goto LABEL_12;
  }
  -[_UIFloatingTabBar selectionContainerView](v6, "selectionContainerView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isAnimatingSelectionFrame");

  if ((v33 & 1) != 0)
  {
LABEL_13:
    v47 = [UITargetedPreview alloc];
    v48 = (void *)objc_opt_new();
    v25 = -[UITargetedPreview initWithView:parameters:target:](v47, "initWithView:parameters:target:", v7, v48, v21);

    v26 = UIPointerHighlightEffect;
    goto LABEL_14;
  }
  v34 = [UIView alloc];
  objc_msgSend(v7, "bounds");
  v35 = -[UIView initWithFrame:](v34, "initWithFrame:");
  v36 = [_UIPortalView alloc];
  -[_UIFloatingTabBar selectionContainerView](v6, "selectionContainerView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "selectionView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[_UIPortalView initWithSourceView:](v36, "initWithSourceView:", v38);

  -[_UIPortalView setHidesSourceView:](v39, "setHidesSourceView:", 1);
  -[UIView addSubview:](v35, "addSubview:", v39);
  v40 = -[_UIPortalView initWithSourceView:]([_UIPortalView alloc], "initWithSourceView:", v7);
  objc_msgSend(v7, "layer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "flipsHorizontalAxis");
  -[UIView layer](v40, "layer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setFlipsHorizontalAxis:", v42);

  -[_UIPortalView setHidesSourceView:](v40, "setHidesSourceView:", 1);
  -[UIView addSubview:](v35, "addSubview:", v40);
  v44 = [UITargetedPreview alloc];
  v45 = (void *)objc_opt_new();
  v25 = -[UITargetedPreview initWithView:parameters:target:](v44, "initWithView:parameters:target:", v35, v45, v21);

  +[UIPointerEffect effectWithPreview:](UIPointerLiftEffect, "effectWithPreview:", v25);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  objc_msgSend(v7, "convertRect:toView:", v6, v9, v11, v13, v15);
  v50 = v49;
  v52 = v51;
  v54 = v53;
  v56 = v55;
  -[UITargetedPreview view](v25, "view");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "bounds");
  +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v50, v52, v54, v56, CGRectGetHeight(v61) * 0.5);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v46, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  return v59;
}

- (BOOL)_canDragTab:(id)a3
{
  return objc_msgSend(a3, "_hasCustomizablePlacement");
}

- (BOOL)_isValidDropTargetIndexPath:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "section"))
  {
    v7 = objc_msgSend(v5, "item");
    -[_UIFloatingTabBar lastSnapshot](self, "lastSnapshot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 == objc_msgSend(v8, "numberOfItemsInSection:", &unk_1E1A9AE00);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)tabDragController:(id)a3 tabForBeginningSession:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;

  v5 = a4;
  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "indexPathForItemAtPoint:", v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_UIFloatingTabBar dataSource](self, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "itemIdentifierForIndexPath:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "tabForSelection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[_UIFloatingTabBar _canDragTab:](self, "_canDragTab:", v15);

    if (v16)
    {
      objc_msgSend(v14, "tabForSelection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)tabDragController:(id)a3 previewForLiftingTab:(id)a4
{
  return -[_UIFloatingTabBar _targetedPreviewForTab:](self, "_targetedPreviewForTab:", a4);
}

- (id)tabDragController:(id)a3 previewForCancellingTab:(id)a4
{
  return -[_UIFloatingTabBar _targetedPreviewForTab:](self, "_targetedPreviewForTab:", a4);
}

- (void)tabDragController:(id)a3 hideDraggedTab:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[_UIFloatingTabBar _indexPathForTabItem:](self, "_indexPathForTabItem:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForItemAtIndexPath:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

}

- (id)tabDragController:(id)a3 destinationIndexPathForDropSession:(id)a4
{
  return -[_UIFloatingTabBar _destinationIndexPathForDropSession:](self, "_destinationIndexPathForDropSession:", a4);
}

- (BOOL)tabDragController:(id)a3 canHandleDropSessionForTab:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;

  v5 = a4;
  objc_msgSend(v5, "_tabModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBar tabModel](self, "tabModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
    v8 = objc_msgSend(v5, "_isAction") ^ 1;
  else
    LOBYTE(v8) = 0;

  return v8;
}

- (id)tabDragController:(id)a3 dropProposalForSession:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  UIDropProposal *v19;
  CGRect v21;

  v5 = a4;
  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);

  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  CGRectGetMidY(v21);

  -[_UIFloatingTabBar _destinationIndexPathForDropSession:](self, "_destinationIndexPathForDropSession:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBar tabModel](self, "tabModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEditing");

  if ((v10 & 1) != 0)
  {
    objc_msgSend(v5, "items");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "localObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "_tabPlacement") == 6)
    {
      v14 = 1;
    }
    else if (-[_UIFloatingTabBar _isValidDropTargetIndexPath:](self, "_isValidDropTargetIndexPath:", v8)
           && (-[_UIFloatingTabBar tabModel](self, "tabModel"),
               v16 = (void *)objc_claimAutoreleasedReturnValue(),
               v17 = objc_msgSend(v16, "isTabHidden:", v13),
               v16,
               (v17 & 1) == 0))
    {
      if (-[_UIFloatingTabBar _canDragTab:](self, "_canDragTab:", v13))
        v14 = 3;
      else
        v14 = 1;
    }
    else
    {
      v14 = 0;
    }
LABEL_13:

    goto LABEL_14;
  }
  if (v8)
  {
    if (objc_msgSend(v8, "section") == 3)
    {
      -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "tabForSelectionAtItemIndex:", objc_msgSend(v8, "item"));
    }
    else
    {
      -[_UIFloatingTabBar dataSource](self, "dataSource");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "itemIdentifierForIndexPath:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "tabForSelection");
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIFloatingTabBar _tabBarController](self, "_tabBarController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (uint64_t)-[UITabBarController _tab:operationForAcceptingItemsFromDropSession:](v13, v12, v5);
    goto LABEL_13;
  }
  v14 = 0;
LABEL_14:
  v19 = -[UIDropProposal initWithDropOperation:]([UIDropProposal alloc], "initWithDropOperation:", v14);

  return v19;
}

- (BOOL)tabDragController:(id)a3 isDisplayingTab:(id)a4
{
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[_UIFloatingTabBar parser](self, "parser");
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBarParser itemIdentifiers](v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v7, "containsObject:", v8);
  return (char)v5;
}

- (void)tabDragController:(id)a3 acceptItemsIntoTabFromDropSession:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  -[_UIFloatingTabBar _destinationIndexPathForDropSession:](self, "_destinationIndexPathForDropSession:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "section") == 3)
    {
      -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "tabForSelectionAtItemIndex:", objc_msgSend(v6, "item"));
    }
    else
    {
      -[_UIFloatingTabBar dataSource](self, "dataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "itemIdentifierForIndexPath:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "tabForSelection");
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIFloatingTabBar _tabBarController](self, "_tabBarController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBarController _tab:acceptItemsFromDropSession:](v10, v9, v11);

  }
}

- (void)tabDragController:(id)a3 pendingDropTabDidChange:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  -[_UIFloatingTabBar parser](self, "parser");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = *(void **)(v6 + 80);
  else
    v8 = 0;
  v9 = v8;

  if (v9 != v5)
    -[_UIFloatingTabBar _invalidateFavoriteOrderAnimated:](self, "_invalidateFavoriteOrderAnimated:", 1);
}

- (id)tabDragController:(id)a3 previewForInsertingTab:(id)a4
{
  return -[_UIFloatingTabBar _targetedPreviewForTab:](self, "_targetedPreviewForTab:", a4);
}

- (void)tabDragController:(id)a3 updateFavoriteOrderAnimated:(BOOL)a4
{
  -[_UIFloatingTabBar _invalidateFavoriteOrderAnimated:](self, "_invalidateFavoriteOrderAnimated:", a4);
}

- (id)_targetedPreviewForTab:(id)a3
{
  void *v4;
  void *v5;

  -[_UIFloatingTabBar _indexPathForTabItem:](self, "_indexPathForTabItem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_UIFloatingTabBar _targetedPreviewForTabAtIndexPath:](self, "_targetedPreviewForTabAtIndexPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_targetedPreviewForTabAtIndexPath:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  UIDragPreviewTarget *v30;
  void *v31;
  UIDragPreviewTarget *v32;
  UITargetedDragPreview *v33;
  CGRect v35;

  v4 = a3;
  v5 = -[_UIFloatingTabBar _pageIndexForItemAtIndexPath:](self, "_pageIndexForItemAtIndexPath:", v4);
  -[_UIFloatingTabBar _viewForItemAtIndexPath:](self, "_viewForItemAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (-[_UIFloatingTabBar collectionView](self, "collectionView"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "targetPage"),
        v7,
        v5 == v8))
  {
    -[_UIFloatingTabBar contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "center");
    v11 = v10;
    v13 = v12;
    objc_msgSend(v6, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertPoint:fromView:", v14, v11, v13);
    v16 = v15;
    v18 = v17;

    v19 = (void *)objc_opt_new();
    objc_msgSend(v19, "setHidesSourceViewDuringDropAnimation:", 1);
    +[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v20);

    objc_msgSend(v6, "bounds");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    objc_msgSend(v6, "bounds");
    +[UIBezierPath _bezierPathWithPillRect:cornerRadius:](UIBezierPath, "_bezierPathWithPillRect:cornerRadius:", v22, v24, v26, v28, CGRectGetHeight(v35) * 0.5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setVisiblePath:", v29);

    v30 = [UIDragPreviewTarget alloc];
    -[_UIFloatingTabBar contentView](self, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[UIPreviewTarget initWithContainer:center:](v30, "initWithContainer:center:", v31, v16, v18);

    v33 = -[UITargetedDragPreview initWithView:parameters:target:]([UITargetedDragPreview alloc], "initWithView:parameters:target:", v6, v19, v32);
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (id)_destinationIndexPathForDropSession:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double MidY;
  void *v9;
  char v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  int v30;
  int v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  unint64_t v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  _UIFloatingTabBarItemView *v58;
  _UIFloatingTabBarItemView *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  unint64_t v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  unint64_t v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  double v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v85;
  CGPoint v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;

  v4 = a3;
  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  objc_msgSend(v5, "bounds");
  MidY = CGRectGetMidY(v87);
  -[_UIFloatingTabBar tabModel](self, "tabModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEditing");

  if ((v10 & 1) != 0)
    goto LABEL_38;
  -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v11);
  v13 = v12;
  v15 = v14;

  -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "itemIndexForItemAtLocation:", v13, v15);

  if (v17 == 0x7FFFFFFFFFFFFFFFLL
    || (objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v17, 3),
        (v18 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_38:
    -[_UIFloatingTabBar collectionView](self, "collectionView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    v86.x = v7;
    v86.y = MidY;
    v20 = CGRectContainsPoint(v88, v86);

    if (v20)
    {
      -[_UIFloatingTabBar collectionView](self, "collectionView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "indexPathForItemAtPoint:", v7, MidY);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }
    -[_UIFloatingTabBar tabModel](self, "tabModel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEditing");

    if (v23)
    {
      if (!v18)
      {
        objc_msgSend(v5, "pages");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndex:", objc_msgSend(v5, "targetPage"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        -[_UIFloatingTabBar contentView](self, "contentView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "locationInView:", v26);
        v28 = v27;

        -[_UIFloatingTabBar contentView](self, "contentView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "bounds");
        v30 = v28 < CGRectGetMidX(v89);

        v31 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
        v85 = v25;
        v33 = objc_msgSend(v25, "range");
        if (v30 != v31)
        {
          -[_UIFloatingTabBar _indexPathForItemAtDataSourceIndex:](self, "_indexPathForItemAtDataSourceIndex:", v33);
          v34 = objc_claimAutoreleasedReturnValue();
          goto LABEL_32;
        }
        v35 = v32;
        -[_UIFloatingTabBar dragController](self, "dragController");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "pendingFavoriteOrder");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "indexOfObject:", 0x1E16F2720);

        if (v38 == 0x7FFFFFFFFFFFFFFFLL
          || (objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v38, 1),
              v39 = (void *)objc_claimAutoreleasedReturnValue(),
              v40 = -[_UIFloatingTabBar _indexInDataSourceForItemAtIndexPath:](self, "_indexInDataSourceForItemAtIndexPath:", v39), v39, v40 < v33)|| v40 - v33 >= v35)
        {
          v44 = v35;
          -[UIView traitCollection](self, "traitCollection");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          _UIFloatingTabBarGetPlatformMetrics(objc_msgSend(v45, "userInterfaceIdiom"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          -[_UIFloatingTabBar _maximumContainerSizeForPagination](self, "_maximumContainerSizeForPagination");
          v47 = v46;
          v49 = v48;
          -[_UIFloatingTabBar leftArrowButton](self, "leftArrowButton");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView bounds](self, "bounds");
          objc_msgSend(v50, "sizeThatFits:", v51, v52);

          -[_UIFloatingTabBar lastSnapshot](self, "lastSnapshot");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "numberOfItems");

          objc_msgSend(v43, "editModeItemMargins");
          v55 = v54;
          v57 = v56;
          v58 = [_UIFloatingTabBarItemView alloc];
          v59 = -[_UIFloatingTabBarItemView initWithFrame:](v58, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
          -[UIView setHidden:](v59, "setHidden:", 1);
          -[_UIFloatingTabBarItemView setSuppressJiggleAnimation:](v59, "setSuppressJiggleAnimation:", 1);
          -[_UIFloatingTabBarItemView setEditing:](v59, "setEditing:", 1);
          objc_msgSend(v4, "items");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "firstObject");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "localObject");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIFloatingTabBarItemView setItem:](v59, "setItem:", v62);

          -[_UIFloatingTabBar contentView](self, "contentView");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "addSubview:", v59);

          -[_UIFloatingTabBarItemView sizeThatFits:](v59, "sizeThatFits:", v47, v49);
          v65 = v64;
          if (objc_msgSend(v5, "targetPage") < 1)
          {
            v69 = 0.0;
          }
          else
          {
            objc_msgSend(v5, "pages");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "objectAtIndex:", objc_msgSend(v5, "targetPage") - 1);
            v67 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v67, "overlapWidth");
            v69 = v68;

          }
          v70 = v33 + v44 - 1;
          if (v70 >= v33)
          {
            v71 = v55 + v57 + v65;
            v72 = 0.0;
            while (1)
            {
              -[_UIFloatingTabBar _indexPathForItemAtDataSourceIndex:](self, "_indexPathForItemAtDataSourceIndex:", v70);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v73, "section") != 1)
              {
                v18 = 0;
                goto LABEL_27;
              }
              objc_msgSend(v5, "pages");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "count");

              v75 = v70 + 1;
              UIRoundToViewScale(self);
              v77 = v76;
              objc_msgSend(v85, "width");
              if (v71 + v78 - v69 - v72 <= v77)
                break;
              objc_msgSend(v5, "cellForItemAtIndexPath:", v73);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "bounds");
              v72 = v72 + v80;

              --v70;
              if (v75 - 2 < v33)
              {
                v18 = 0;
                goto LABEL_28;
              }
            }
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v73, "item") + 1, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

          }
          else
          {
            v18 = 0;
          }
LABEL_28:
          -[UIView removeFromSuperview](v59, "removeFromSuperview");

        }
        else
        {
          v41 = objc_msgSend(v85, "range");
          objc_msgSend(v85, "range");
          -[_UIFloatingTabBar _indexPathForItemAtDataSourceIndex:](self, "_indexPathForItemAtDataSourceIndex:", v41 + v42 - 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v43, "item") + 1, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }

        if (!v18)
        {
          -[_UIFloatingTabBar lastSnapshot](self, "lastSnapshot");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = objc_msgSend(v81, "numberOfItemsInSection:", &unk_1E1A9ADD0);

          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v82, 1);
          v34 = objc_claimAutoreleasedReturnValue();
LABEL_32:
          v18 = (void *)v34;

          if (!v18)
            goto LABEL_35;
          goto LABEL_33;
        }

      }
LABEL_33:
      if (!objc_msgSend(v18, "section"))
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 1);
        v83 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v83;
      }
    }
  }
LABEL_35:

  return v18;
}

- (void)setHighlightedIndexPath:(id)a3
{
  id v5;
  NSIndexPath *highlightedIndexPath;
  NSIndexPath *v7;
  NSIndexPath *v8;
  char v9;
  NSIndexPath *v10;
  NSIndexPath *v11;

  v5 = a3;
  highlightedIndexPath = self->_highlightedIndexPath;
  v11 = (NSIndexPath *)v5;
  v7 = highlightedIndexPath;
  if (v7 == v11)
  {

LABEL_12:
    v10 = v11;
    goto LABEL_13;
  }
  v8 = v7;
  if (v11 && v7)
  {
    v9 = -[NSIndexPath isEqual:](v11, "isEqual:", v7);

    v10 = v11;
    if ((v9 & 1) != 0)
      goto LABEL_13;
  }
  else
  {

  }
  if (self->_highlightedIndexPath)
    -[_UIFloatingTabBar _setHighlighted:forItemAtIndexPath:](self, "_setHighlighted:forItemAtIndexPath:", 0);
  objc_storeStrong((id *)&self->_highlightedIndexPath, a3);
  v10 = v11;
  if (v11)
  {
    -[_UIFloatingTabBar _setHighlighted:forItemAtIndexPath:](self, "_setHighlighted:forItemAtIndexPath:", 1, v11);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)_setHasSelectionHighlight:(BOOL)a3 forItemAtIndexPath:(id)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "section") == 3)
  {
    if (v4)
      v6 = objc_msgSend(v9, "item");
    else
      v6 = 0x7FFFFFFFFFFFFFFFLL;
    -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSelectionViewIndex:", v6);
  }
  else
  {
    -[_UIFloatingTabBar collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cellForItemAtIndexPath:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setHasSelectionHighlight:", v4);
  }

}

- (void)_setHighlighted:(BOOL)a3 forItemAtIndexPath:(id)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "section") == 3)
  {
    if (v4)
      v6 = objc_msgSend(v9, "item");
    else
      v6 = 0x7FFFFFFFFFFFFFFFLL;
    -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHighlightedIndex:", v6);
  }
  else
  {
    -[_UIFloatingTabBar collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cellForItemAtIndexPath:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setHighlighted:", v4);
  }

}

- (void)tabModelEditingStateDidChange
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  void *v16;
  id *v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  id v27;

  -[_UIFloatingTabBar tabModel](self, "tabModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEditing");

  -[_UIFloatingTabBar tabModel](self, "tabModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customizationStore");
  v27 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v27, "excludedItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v8;

    -[_UIFloatingTabBar parser](self, "parser");
    v26 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBarParser currentFavoriteOrder](v26);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIFloatingTabBar dragController](self, "dragController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "beginEditingWithFavoriteOrder:excludedItems:", v18, v16);
  }
  else
  {
    -[_UIFloatingTabBar parser](self, "parser");
    v9 = (id *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBarParser sourceTabIdentifiers](v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIFloatingTabBar dragController](self, "dragController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pendingFavoriteOrder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIFloatingTabBar dragController](self, "dragController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "excludedItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIFloatingTabBar parser](self, "parser");
    v15 = (id *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBarParser validateFavoriteOrder:](v15, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIFloatingTabBar parser](self, "parser");
    v17 = (id *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBarParser validateFavoriteOrder:](v17, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "saveFavoriteOrderCustomization:defaultIdentifiers:excludedIdentifiers:", v18, v16, v14);
    -[_UIFloatingTabBar dragController](self, "dragController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "endEditing");

    if (objc_msgSend(v27, "hasFavoriteOrderCustomization"))
    {
      objc_msgSend(v18, "count");
      -[_UIFloatingTabBar parser](self, "parser");
      v20 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      -[_UIFloatingTabBarParser fixedItems](v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "count");
      -[_UIFloatingTabBar parser](self, "parser");
      v22 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      -[_UIFloatingTabBarParser pinnedItems](v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "count");

      _uip_floatingTabBar_sendAnalyticsEvent();
    }
    -[_UIFloatingTabBar tabModel](self, "tabModel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "selectedLeaf");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIFloatingTabBar _updateSelectedLeaf:previousElement:](self, "_updateSelectedLeaf:previousElement:", v25, v25);
  }

}

- (void)updateEditingStateIfNeeded
{
  if ((*(_BYTE *)&self->_needsUpdate & 0x40) != 0)
    -[_UIFloatingTabBar setEditing:animated:](self, "setEditing:animated:", -[_UIFloatingTabBar isEditing](self, "isEditing"), 0);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  char needsUpdate;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  BOOL v18;
  BOOL v19;

  v4 = a4;
  v5 = a3;
  if (self->_editing != a3 || (*(_BYTE *)&self->_needsUpdate & 0x40) != 0)
  {
    self->_editing = a3;
    -[UIView window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    needsUpdate = (char)self->_needsUpdate;
    if (v7)
    {
      *(_BYTE *)&self->_needsUpdate = needsUpdate & 0xBF;
      -[_UIFloatingTabBar _setNeedsPaginationUpdate](self, "_setNeedsPaginationUpdate");
      -[_UIFloatingTabBar _updatePaginationIfNeeded](self, "_updatePaginationIfNeeded");
      -[_UIFloatingTabBar _currentPlatformMetrics](self, "_currentPlatformMetrics");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFloatingTabBar collectionView](self, "collectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setEditing:", v5);

      -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setEditing:", v5);

      -[_UIFloatingTabBar recentItem](self, "recentItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[_UIFloatingTabBar _updateDataSourceFromParserAnimated:](self, "_updateDataSourceFromParserAnimated:", v4);
      }
      else
      {
        -[_UIFloatingTabBar collectionView](self, "collectionView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "collectionViewLayout");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "invalidateLayout");

        -[UIView setNeedsLayout](self, "setNeedsLayout");
        -[_UIFloatingTabBar _setNeedsSelectionFrameUpdate](self, "_setNeedsSelectionFrameUpdate");
      }
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __41___UIFloatingTabBar_setEditing_animated___block_invoke;
      v17[3] = &unk_1E16B70C0;
      v17[4] = self;
      v18 = v5;
      v19 = v4;
      v15 = _Block_copy(v17);
      +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v16, 0, v15, 0);
      else
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v15);
      -[_UIFloatingTabBar _updateSelectionViewFrameAnimated:completion:](self, "_updateSelectionViewFrameAnimated:completion:", v4, 0);

    }
    else
    {
      *(_BYTE *)&self->_needsUpdate = needsUpdate | 0x40;
    }
  }
}

- (void)updateBarForEditingState
{
  -[_UIFloatingTabBar _updateTransform](self, "_updateTransform");
  -[_UIFloatingTabBar _updateBackgroundShadow](self, "_updateBackgroundShadow");
}

- (void)_updateEditModeGestureRecognizer
{
  void *v3;
  uint64_t v4;
  UILongPressGestureRecognizer *v5;
  UILongPressGestureRecognizer *editModeGestureRecognizer;
  void *v7;

  -[_UIFloatingTabBar tabModel](self, "tabModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEditable");

  if ((_DWORD)v4 && !self->_editModeGestureRecognizer)
  {
    v5 = -[UILongPressGestureRecognizer initWithTarget:action:]([UILongPressGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleLongPressGestureRecognizer_);
    editModeGestureRecognizer = self->_editModeGestureRecognizer;
    self->_editModeGestureRecognizer = v5;

    -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_editModeGestureRecognizer, "setMinimumPressDuration:", 0.5);
    -[UIGestureRecognizer setDelegate:](self->_editModeGestureRecognizer, "setDelegate:", self);
    -[_UIFloatingTabBar contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addGestureRecognizer:", self->_editModeGestureRecognizer);

  }
  -[UIGestureRecognizer setEnabled:](self->_editModeGestureRecognizer, "setEnabled:", v4);
}

- (void)_handleLongPressGestureRecognizer:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[_UIFloatingTabBar selectionGestureRecognizer](self, "selectionGestureRecognizer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  -[_UIFloatingTabBar selectionGestureRecognizer](self, "selectionGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 1);

  -[_UIFloatingTabBar tabModel](self, "tabModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEditing:", 1);

}

- (void)setShowRecentItem:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_showRecentItem != a3)
  {
    self->_showRecentItem = a3;
    -[_UIFloatingTabBar tabModel](self, "tabModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedLeaf");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    -[_UIFloatingTabBar _updateSelectedLeaf:previousElement:](self, "_updateSelectedLeaf:previousElement:", v5, v5);
  }
}

- (void)_validateRecentItemForParser:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _UIFloatingTabBarListItem *recentItem;
  char v9;
  id v10;

  v10 = a3;
  -[_UIFloatingTabBar recentItem](self, "recentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabForSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_tabModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBar tabModel](self, "tabModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != v7
    || (-[_UIFloatingTabBarParser containsTab:]((uint64_t)v10, v5) & 1) != 0
    || -[_UIFloatingTabBarParser containsDescendantOfTab:]((_BOOL8)v10, v5))
  {

  }
  else
  {
    v9 = objc_msgSend(v5, "isHidden");

    if ((v9 & 1) == 0)
      goto LABEL_6;
  }
  recentItem = self->_recentItem;
  self->_recentItem = 0;

LABEL_6:
}

- (BOOL)_isRecentItemIndexPath:(id)a3
{
  return objc_msgSend(a3, "section") == 2;
}

- (id)_contentTabForRecentTab:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a3;
  objc_msgSend(v3, "_parentGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = v3;
    if (v6)
    {
      v7 = v6;
      do
      {
        objc_msgSend(v5, "addObject:", v7);
        objc_msgSend(v7, "_parentGroup");
        v8 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v8;
      }
      while (v8);
    }
    v9 = objc_msgSend(v5, "indexOfObjectWithOptions:passingTest:", 2, &__block_literal_global_112_3);
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v5, "objectAtIndex:", v9);

    }
  }

  return 0;
}

- (void)_tabModelDidReload:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[_UIFloatingTabBar _isEffectivelyEmpty](self, "_isEffectivelyEmpty");
  objc_msgSend(v4, "tabItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "count") != 0;
  v7 = v4 & ~v5;
  -[_UIFloatingTabBar _invalidateDataSourceAnimated:](self, "_invalidateDataSourceAnimated:", v7);
  -[_UIFloatingTabBar _updateSelectedItemAnimated:completion:](self, "_updateSelectedItemAnimated:completion:", v7, 0);
}

- (void)_tabModel:(id)a3 tabContentDidChange:(id)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  NSDiffableDataSourceSnapshot *v15;
  void *v16;
  void *v17;
  NSDiffableDataSourceSnapshot *lastSnapshot;
  NSDiffableDataSourceSnapshot *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[_UIFloatingTabBar _indexPathForTabItem:](self, "_indexPathForTabItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "_tabPlacement") - 4;
  if (v7 > 2)
  {
    v8 = 1;
    if (!v6)
      goto LABEL_14;
  }
  else
  {
    v8 = qword_186685330[v7];
    if (!v6)
      goto LABEL_14;
  }
  if (objc_msgSend(v6, "section") == v8)
  {
    -[_UIFloatingTabBar _setNeedsPaginationUpdate](self, "_setNeedsPaginationUpdate");
    if (objc_msgSend(v6, "section") == 3)
    {
      -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "reloadItemViewForTab:", v5);
    }
    else
    {
      v12 = -[_UIFloatingTabBar _indexInDataSourceForItemAtIndexPath:](self, "_indexInDataSourceForItemAtIndexPath:", v6);
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_13:
        -[_UIFloatingTabBar _updateTabBarPaginationAnimated:](self, "_updateTabBarPaginationAnimated:", 1);
        -[_UIFloatingTabBar _updateSelectionViewFrameAnimated:completion:](self, "_updateSelectionViewFrameAnimated:completion:", 1, 0);
        goto LABEL_14;
      }
      v13 = v12;
      -[_UIFloatingTabBar dataSource](self, "dataSource");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "snapshot");
      v15 = (NSDiffableDataSourceSnapshot *)objc_claimAutoreleasedReturnValue();

      -[NSDiffableDataSourceSnapshot itemIdentifiers](v15, "itemIdentifiers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndex:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v21[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDiffableDataSourceSnapshot reconfigureItemsWithIdentifiers:](v15, "reconfigureItemsWithIdentifiers:", v17);

      lastSnapshot = self->_lastSnapshot;
      self->_lastSnapshot = v15;
      v19 = v15;

      -[_UIFloatingTabBar dataSource](self, "dataSource");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "applySnapshot:animatingDifferences:", v19, 1);

    }
    goto LABEL_13;
  }
  -[_UIFloatingTabBar _invalidateDataSourceAnimated:](self, "_invalidateDataSourceAnimated:", 1);
  -[_UIFloatingTabBar tabModel](self, "tabModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectedLeaf");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v5)
    -[_UIFloatingTabBar _updateSelectedLeaf:previousElement:](self, "_updateSelectedLeaf:previousElement:", v5, v5);
LABEL_14:

}

- (void)_tabModel:(id)a3 visibilityDidChangeForTab:(id)a4
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  id v9;

  v9 = a4;
  -[_UIFloatingTabBar _indexPathForTabItem:](self, "_indexPathForTabItem:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  -[_UIFloatingTabBar tabModel](self, "tabModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isTabHidden:", v9);

  if (((v6 ^ v8) & 1) == 0)
  {
    -[_UIFloatingTabBar _invalidateDataSourceAnimated:](self, "_invalidateDataSourceAnimated:", 1);
    if ((v8 & 1) == 0)
      -[_UIFloatingTabBar _updateSelectedLeaf:previousElement:](self, "_updateSelectedLeaf:previousElement:", v9, v9);
  }

}

- (void)_tabModel:(id)a3 didChangeSelectedLeaf:(id)a4 previousElement:(id)a5
{
  -[_UIFloatingTabBar _updateSelectedLeaf:previousElement:](self, "_updateSelectedLeaf:previousElement:", a4, a5);
}

- (void)_tabModel:(id)a3 favoriteOrderDidChange:(id)a4 animated:(BOOL)a5
{
  -[_UIFloatingTabBar _invalidateFavoriteOrderAnimated:](self, "_invalidateFavoriteOrderAnimated:", a5, a4);
}

- (void)_tabModel:(id)a3 favoriteOrderDidReset:(id)a4
{
  id *v5;
  void *v6;
  id v7;

  -[_UIFloatingTabBar parser](self, "parser", a3, a4);
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBarParser sourceTabIdentifiers](v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIFloatingTabBar dragController](self, "dragController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetFavoriteOrderWithDefaultOrder:", v7);

  -[_UIFloatingTabBar _invalidateFavoriteOrderAnimated:](self, "_invalidateFavoriteOrderAnimated:", 1);
}

- (void)_updateSelectedLeaf:(id)a3 previousElement:(id)a4
{
  id v6;
  void *v7;
  _BOOL8 v8;
  BOOL v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  id v15;
  _UIFloatingTabBarListItem *v16;
  void *v17;
  int v18;
  _UIFloatingTabBarListItem *recentItem;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v6 = a4;
  -[UIView window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = !self->_isInTransitionAnimation;
  else
    v8 = 0;

  v9 = -[_UIFloatingTabBar showRecentItem](self, "showRecentItem");
  -[_UIFloatingTabBar recentItem](self, "recentItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBar _indexPathForTabItem:](self, "_indexPathForTabItem:", v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[_UIFloatingTabBar parser](self, "parser");
    v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBarParser itemIdentifiers](v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "containsObject:", v14) & 1) != 0
      || v11 && !-[_UIFloatingTabBar _isRecentItemIndexPath:](self, "_isRecentItemIndexPath:", v11))
    {

    }
    else
    {
      objc_msgSend(v10, "tabForSelection");
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (v15 != v22)
      {
        if (v22 && (objc_msgSend(v22, "isHidden") & 1) == 0)
        {
          v16 = -[_UIFloatingTabBarListItem initWithTab:]([_UIFloatingTabBarListItem alloc], "initWithTab:", v22);
          -[_UIFloatingTabBar _contentTabForRecentTab:](self, "_contentTabForRecentTab:", v22);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIFloatingTabBarListItem setContentTab:](v16, "setContentTab:", v21);

        }
        else
        {
          v16 = 0;
        }
        recentItem = self->_recentItem;
        self->_recentItem = v16;
        goto LABEL_18;
      }
    }
    if (v10)
    {
      objc_msgSend(v10, "tabForSelection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "_isAncestorOfTab:", v22);

      if (v18)
      {
LABEL_17:
        recentItem = self->_recentItem;
        self->_recentItem = 0;
LABEL_18:

        -[_UIFloatingTabBar _updateDataSourceFromParserAnimated:](self, "_updateDataSourceFromParserAnimated:", v8);
        -[_UIFloatingTabBar _scrollToSelectedItemAnimated:](self, "_scrollToSelectedItemAnimated:", v8);
        goto LABEL_21;
      }
    }
  }
  else if (v10)
  {
    goto LABEL_17;
  }
  if (v6 != v22)
  {
    -[_UIFloatingTabBar _scrollToSelectedItemAnimated:](self, "_scrollToSelectedItemAnimated:", v8);
    -[_UIFloatingTabBar _updateSelectedItemAnimated:completion:](self, "_updateSelectedItemAnimated:completion:", v8, 0);
  }
LABEL_21:
  -[UIView window](self, "window");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
    *(_BYTE *)&self->_needsUpdate |= 0x20u;

}

- (id)resolvedPopoverPresentationControllerSourceItemForTab:(id)a3
{
  void *v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL4 v11;
  BOOL v12;

  -[_UIFloatingTabBar _indexPathForTabItem:](self, "_indexPathForTabItem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (-[_UIFloatingTabBar showsSidebarButton](self, "showsSidebarButton"))
      -[_UIFloatingTabBar sidebarButton](self, "sidebarButton");
    else
      -[_UIFloatingTabBar contentView](self, "contentView");
    goto LABEL_6;
  }
  v5 = -[_UIFloatingTabBar _pageIndexForItemAtIndexPath:](self, "_pageIndexForItemAtIndexPath:", v4);
  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "targetPage");

  if (objc_msgSend(v4, "section") != 3)
  {
    if (v5 == v7)
    {
      -[_UIFloatingTabBar _viewForItemAtIndexPath:](self, "_viewForItemAtIndexPath:", v4);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    v11 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v12 = v5 > v7;
    if (!v11)
      v12 = v5 < v7;
    if (v12)
      -[_UIFloatingTabBar leftArrowButton](self, "leftArrowButton");
    else
      -[_UIFloatingTabBar rightArrowButton](self, "rightArrowButton");
LABEL_6:
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v9 = (void *)v10;
    goto LABEL_16;
  }
  -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemViewForItemAtIndex:", objc_msgSend(v4, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v9;
}

- (void)_setNeedsSelectionFrameUpdate
{
  *(_BYTE *)&self->_needsUpdate |= 2u;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setNeedsSelectionAlphaUpdate
{
  *(_BYTE *)&self->_needsUpdate |= 4u;
}

- (void)_setNeedsScrollToSelectedItem
{
  *(_BYTE *)&self->_needsUpdate |= 8u;
}

- (void)_updateSelectedItemAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void (**v8)(id, uint64_t, _QWORD);

  v4 = a3;
  v8 = (void (**)(id, uint64_t, _QWORD))a4;
  -[_UIFloatingTabBar _indexPathForSelectedItem](self, "_indexPathForSelectedItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "section") == 3)
      -[_UIFloatingTabBar setExpandedGroupItem:](self, "setExpandedGroupItem:", 0);
    -[_UIFloatingTabBar _updateSelectionViewFrameAnimated:completion:](self, "_updateSelectionViewFrameAnimated:completion:", v4, v8);
    -[_UIFloatingTabBar _updateSelectionViewVisibilityAnimated:](self, "_updateSelectionViewVisibilityAnimated:", v4);
  }
  else if (v8)
  {
    v8[2](v8, 1, 0);
  }

}

- (void)_setSelectedItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, uint64_t, _QWORD);
  id v9;
  id v10;
  void *v11;
  char v12;
  id v13;

  v6 = a4;
  v13 = a3;
  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  if (-[_UITabModel shouldSelectTab:](self->_tabModel, "shouldSelectTab:", v13))
  {
    -[_UITabModel selectedItem](self->_tabModel, "selectedItem");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v13;
    v11 = v10;
    if (v9 == v10)
    {

      -[_UITabModel selectElement:notifyOnReselection:](self->_tabModel, "selectElement:notifyOnReselection:", v11, 1);
    }
    else
    {
      if (!v10 || !v9)
      {

        -[_UITabModel selectElement:notifyOnReselection:](self->_tabModel, "selectElement:notifyOnReselection:", v11, 1);
LABEL_11:
        -[_UIFloatingTabBar _updateSelectedItemAnimated:completion:](self, "_updateSelectedItemAnimated:completion:", v6, v8);
        goto LABEL_12;
      }
      v12 = objc_msgSend(v9, "isEqual:", v10);

      -[_UITabModel selectElement:notifyOnReselection:](self->_tabModel, "selectElement:notifyOnReselection:", v11, 1);
      if ((v12 & 1) == 0)
        goto LABEL_11;
    }
  }
  if (v8)
    v8[2](v8, 1, 0);
LABEL_12:

}

- (void)_selectItemAtIndexPath:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id location;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFloatingTabBar.m"), 1984, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

  }
  if (objc_msgSend(v5, "section") != 3)
  {
    -[_UIFloatingTabBar dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemIdentifierForIndexPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "tabForSelection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "children");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[_UIFloatingTabBar setExpandedGroupItem:](self, "setExpandedGroupItem:", v7);
    }
    else
    {
      objc_msgSend(v7, "tabForSelection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "_isElement");

      if (v12)
      {
        objc_initWeak(&location, self);
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __44___UIFloatingTabBar__selectItemAtIndexPath___block_invoke;
        v18[3] = &unk_1E16E1318;
        objc_copyWeak(&v21, &location);
        v19 = v9;
        v13 = v7;
        v20 = v13;
        -[_UIFloatingTabBar _setSelectedItem:animated:completion:](self, "_setSelectedItem:animated:completion:", v19, 1, v18);
        -[_UIFloatingTabBar expandedGroupItem](self, "expandedGroupItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "parent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 != v15)
          -[_UIFloatingTabBar setExpandedGroupItem:](self, "setExpandedGroupItem:", 0);

        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFloatingTabBar.m"), 2024, CFSTR("Non-UITabElement tabs are currently not supported"));

      }
    }
    goto LABEL_14;
  }
  -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tabForSelectionAtItemIndex:", objc_msgSend(v5, "item"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "_isElement"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFloatingTabBar.m"), 1991, CFSTR("Non-UITabElement tabs are currently not supported"));
LABEL_14:

    goto LABEL_15;
  }
  -[_UIFloatingTabBar _setSelectedItem:animated:completion:](self, "_setSelectedItem:animated:completion:", v7, 1, 0);
LABEL_15:

}

- (BOOL)_isEffectivelyEmpty
{
  _QWORD *v2;
  void *v3;
  BOOL v4;

  -[_UIFloatingTabBar parser](self, "parser");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBarParser itemIdentifiers](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") == 0;

  return v4;
}

- (id)_indexPathForTabItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  if (v4)
  {
    -[_UIFloatingTabBar lastSnapshot](self, "lastSnapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __42___UIFloatingTabBar__indexPathForTabItem___block_invoke;
    v15[3] = &unk_1E16B6F40;
    v7 = v4;
    v16 = v7;
    v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", v15);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "itemIndexForTab:", v7);

      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v10, 3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      objc_msgSend(v7, "_parentGroup");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFloatingTabBar _indexPathForTabItem:](self, "_indexPathForTabItem:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "objectAtIndex:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFloatingTabBar dataSource](self, "dataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "indexPathForItemIdentifier:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_9:

    goto LABEL_10;
  }
  v12 = 0;
LABEL_10:

  return v12;
}

- (id)_indexPathForSelectedItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_UIFloatingTabBar tabModel](self, "tabModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedLeaf");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    || (objc_msgSend(v4, "_isMoreTab") & 1) != 0
    || -[_UIFloatingTabBar _isEffectivelyEmpty](self, "_isEffectivelyEmpty")
    && (-[_UIFloatingTabBar recentItem](self, "recentItem"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    v5 = 0;
  }
  else
  {
    -[_UIFloatingTabBar _indexPathForTabItem:](self, "_indexPathForTabItem:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (CGRect)_itemFrameForItemAtIndexPath:(id)a3 inCoordinateSpace:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGRect result;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v7, "section") == 3)
  {
    -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "item");

    objc_msgSend(v8, "itemFrameForItemAtIndex:", v9);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = v11;
    v21 = v13;
    v22 = v15;
    v23 = v17;
  }
  else
  {
    -[_UIFloatingTabBar collectionView](self, "collectionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "cellForItemAtIndexPath:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      v26 = *MEMORY[0x1E0C9D628];
      v28 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v30 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v32 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      goto LABEL_7;
    }
    objc_msgSend(v19, "bounds");
    v18 = v19;
  }
  objc_msgSend(v18, "convertRect:toCoordinateSpace:", v6, v20, v21, v22, v23);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
LABEL_7:

  v33 = v26;
  v34 = v28;
  v35 = v30;
  v36 = v32;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (void)_updateSelectionViewFrameAnimated:(BOOL)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  char v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double MidY;
  void *v26;
  double v27;
  void (**v28)(_QWORD);
  char needsUpdate;
  _QWORD v30[9];
  char v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v4 = a3;
  v6 = a4;
  -[_UIFloatingTabBar _indexPathForSelectedItem](self, "_indexPathForSelectedItem");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[_UIFloatingTabBar setSelectionViewIndexPath:](self, "setSelectionViewIndexPath:", 0);
    -[_UIFloatingTabBar _updateSelectionViewVisibilityAnimated:](self, "_updateSelectionViewVisibilityAnimated:", v4);
    goto LABEL_24;
  }
  v8 = (void *)v7;
  -[_UIFloatingTabBar highlightedIndexPath](self, "highlightedIndexPath");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    if (-[_UIFloatingTabBar selectionViewFollowsHighlightedItem](self, "selectionViewFollowsHighlightedItem"))
    {

LABEL_7:
      -[_UIFloatingTabBar highlightedIndexPath](self, "highlightedIndexPath");
      v14 = objc_claimAutoreleasedReturnValue();

      v15 = 1;
      v8 = (void *)v14;
      goto LABEL_9;
    }
    -[_UIFloatingTabBar highlightedIndexPath](self, "highlightedIndexPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBar selectionViewIndexPath](self, "selectionViewIndexPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (v13)
      goto LABEL_7;
  }
  v15 = 0;
LABEL_9:
  -[_UIFloatingTabBar setSelectionViewIndexPath:](self, "setSelectionViewIndexPath:", v8);
  -[_UIFloatingTabBar selectionContainerView](self, "selectionContainerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBar _itemFrameForItemAtIndexPath:inCoordinateSpace:](self, "_itemFrameForItemAtIndexPath:inCoordinateSpace:", v8, v16);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v32.origin.x = v18;
  v32.origin.y = v20;
  v32.size.width = v22;
  v32.size.height = v24;
  if (CGRectIsNull(v32))
    goto LABEL_27;
  v33.origin.x = v18;
  v33.origin.y = v20;
  v33.size.width = v22;
  v33.size.height = v24;
  MidY = CGRectGetMidY(v33);
  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bounds");
  v27 = CGRectGetMidY(v34);

  if (MidY == v27)
  {
LABEL_27:
    if (self->_isInTransitionAnimation)
      v4 = 0;
    else
      v4 = v4;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __66___UIFloatingTabBar__updateSelectionViewFrameAnimated_completion___block_invoke;
    v30[3] = &unk_1E16C0FE0;
    v30[4] = self;
    v31 = v15;
    *(CGFloat *)&v30[5] = v18;
    *(CGFloat *)&v30[6] = v20;
    *(CGFloat *)&v30[7] = v22;
    *(CGFloat *)&v30[8] = v24;
    v28 = (void (**)(_QWORD))_Block_copy(v30);
    if ((_DWORD)v4 == 1)
    {
      -[_UIFloatingTabBar _animateSelection:completion:](self, "_animateSelection:completion:", v28, v6);
    }
    else if (+[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"))
    {
      v28[2](v28);
    }
    else
    {
      +[UIView _animateByRetargetingAnimations:completion:](UIView, "_animateByRetargetingAnimations:completion:", v28, v6);
    }
    needsUpdate = (char)self->_needsUpdate;
    *(_BYTE *)&self->_needsUpdate = needsUpdate & 0xFD;
    if ((needsUpdate & 4) != 0)
      -[_UIFloatingTabBar _updateSelectionViewVisibilityAnimated:](self, "_updateSelectionViewVisibilityAnimated:", v4);

  }
  else
  {
    -[_UIFloatingTabBar _setNeedsSelectionAlphaUpdate](self, "_setNeedsSelectionAlphaUpdate");
    -[_UIFloatingTabBar _setNeedsSelectionFrameUpdate](self, "_setNeedsSelectionFrameUpdate");
  }

LABEL_24:
}

- (BOOL)hasActiveDrag
{
  void *v2;
  char v3;

  -[_UIFloatingTabBar dragController](self, "dragController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasActiveDrag");

  return v3;
}

- (double)baselineOffsetFromTop
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[_UIFloatingTabBar _currentPlatformMetrics](self, "_currentPlatformMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundInsets");
  v5 = v4;
  objc_msgSend(v3, "titleMargins");
  v7 = v5 + v6 + self->_minimumItemBaselineFromTop;

  return v7;
}

- (int64_t)_indexInDataSourceForItemAtIndexPath:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "item");
  if (objc_msgSend(v4, "section") >= 1)
  {
    -[_UIFloatingTabBar lastSnapshot](self, "lastSnapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 += objc_msgSend(v6, "numberOfItemsInSection:", &unk_1E1A9ADB8);

  }
  if (objc_msgSend(v4, "section") > 1)
  {
    -[_UIFloatingTabBar lastSnapshot](self, "lastSnapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 += objc_msgSend(v7, "numberOfItemsInSection:", &unk_1E1A9ADD0);

  }
  return v5;
}

- (id)_indexPathForItemAtDataSourceIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[_UIFloatingTabBar lastSnapshot](self, "lastSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a3)
  {
    v12 = 0;
  }
  else
  {
    -[_UIFloatingTabBar lastSnapshot](self, "lastSnapshot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIFloatingTabBar dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "indexPathForItemIdentifier:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (int64_t)_pageIndexForItemAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  v5 = -[_UIFloatingTabBar _indexInDataSourceForItemAtIndexPath:](self, "_indexInDataSourceForItemAtIndexPath:", v4);
  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v8, "targetPage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "range");
  v12 = v11;

  if (v5 < v10 || v5 - v10 >= v12)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0x7FFFFFFFFFFFFFFFLL;
    -[_UIFloatingTabBar collectionView](self, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pages");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __50___UIFloatingTabBar__pageIndexForItemAtIndexPath___block_invoke;
    v18[3] = &unk_1E16DAA98;
    v18[4] = &v19;
    v18[5] = v5;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v18);

    v14 = v20[3];
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    -[_UIFloatingTabBar collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "targetPage");

  }
  return v14;
}

- (void)_scrollToSelectedItemAnimated:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  -[_UIFloatingTabBar _indexPathForSelectedItem](self, "_indexPathForSelectedItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v10, "section") == 3;
  v6 = v10;
  if (!v5)
  {
    if ((*(_BYTE *)&self->_needsUpdate & 1) != 0)
    {
      -[_UIFloatingTabBar _setNeedsScrollToSelectedItem](self, "_setNeedsScrollToSelectedItem");
      goto LABEL_8;
    }
    if (!v10)
    {
LABEL_6:
      -[_UIFloatingTabBar _updateSelectionViewVisibilityAnimated:](self, "_updateSelectionViewVisibilityAnimated:", v3);
LABEL_8:
      v6 = v10;
      goto LABEL_9;
    }
    v7 = -[_UIFloatingTabBar _pageIndexForItemAtIndexPath:](self, "_pageIndexForItemAtIndexPath:", v10);
    v6 = v10;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[_UIFloatingTabBar collectionView](self, "collectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTargetPage:", v7);

      -[_UIFloatingTabBar collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "scrollToTargetPageAnimated:", v3);

      goto LABEL_6;
    }
  }
LABEL_9:

}

- (void)_scrollToSelectedItemIfNeeded
{
  char needsUpdate;
  void *v4;

  needsUpdate = (char)self->_needsUpdate;
  if ((needsUpdate & 8) != 0)
  {
    -[_UIFloatingTabBar _scrollToSelectedItemAnimated:](self, "_scrollToSelectedItemAnimated:", 0);
    needsUpdate = *(_BYTE *)&self->_needsUpdate & 0xE7;
    *(_BYTE *)&self->_needsUpdate = needsUpdate;
  }
  if ((needsUpdate & 0x10) != 0)
  {
    -[_UIFloatingTabBar collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scrollToTargetPageAnimated:", 0);

    *(_BYTE *)&self->_needsUpdate &= ~0x10u;
  }
}

- (void)_updateSelectionViewVisibilityAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int64_t v6;
  unint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v17;
  void *v18;
  _QWORD v19[5];
  BOOL v20;

  v3 = a3;
  -[_UIFloatingTabBar _indexPathForSelectedItem](self, "_indexPathForSelectedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UIFloatingTabBar _indexInDataSourceForItemAtIndexPath:](self, "_indexInDataSourceForItemAtIndexPath:", v5);
  if (v5)
  {
    v7 = v6;
    if (objc_msgSend(v5, "section") == 3)
    {
      v8 = 1;
    }
    else
    {
      -[_UIFloatingTabBar collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pages");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFloatingTabBar collectionView](self, "collectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v11, "targetPage"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "range");
      v15 = v14;

      v8 = v7 >= v13 && v7 - v13 < v15;
    }
  }
  else
  {
    v8 = 0;
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __60___UIFloatingTabBar__updateSelectionViewVisibilityAnimated___block_invoke;
  v19[3] = &unk_1E16B1B78;
  v19[4] = self;
  v20 = v8;
  v17 = _Block_copy(v19);
  v18 = v17;
  if (v3)
    -[_UIFloatingTabBar _animateSelection:completion:](self, "_animateSelection:completion:", v17, 0);
  else
    (*((void (**)(void *))v17 + 2))(v17);
  *(_BYTE *)&self->_needsUpdate &= ~4u;

}

- (void)setSelectionViewIndexPath:(id)a3
{
  id v5;
  NSIndexPath *v6;
  NSIndexPath *v7;
  char v8;
  NSIndexPath *v9;
  NSIndexPath *v10;

  v5 = a3;
  v6 = self->_selectionViewIndexPath;
  v7 = (NSIndexPath *)v5;
  v10 = v7;
  if (v6 == v7)
  {

LABEL_12:
    v9 = v10;
    goto LABEL_13;
  }
  if (v7 && v6)
  {
    v8 = -[NSIndexPath isEqual:](v6, "isEqual:", v7);

    v9 = v10;
    if ((v8 & 1) != 0)
      goto LABEL_13;
  }
  else
  {

  }
  if (self->_selectionViewIndexPath)
    -[_UIFloatingTabBar _setHasSelectionHighlight:forItemAtIndexPath:](self, "_setHasSelectionHighlight:forItemAtIndexPath:", 0);
  objc_storeStrong((id *)&self->_selectionViewIndexPath, a3);
  v9 = v10;
  if (v10)
  {
    -[_UIFloatingTabBar _setHasSelectionHighlight:forItemAtIndexPath:](self, "_setHasSelectionHighlight:forItemAtIndexPath:", 1, v10);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)_animateSelection:(id)a3 completion:(id)a4
{
  +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, a3, a4, 0.9, 0.3, 0.08, 0.08, 0.08, 0.0);
}

- (void)setExpandedGroupItem:(id)a3
{
  id v6;
  id *p_expandedGroupItem;
  _UIFloatingTabBarListItem *v8;
  _UIFloatingTabBarListItem *v9;
  _UIFloatingTabBarListItem *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  _UIFloatingTabBar *v28;
  id v29;
  id location;
  _UIFloatingTabBarListItem *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  p_expandedGroupItem = (id *)&self->_expandedGroupItem;
  v8 = self->_expandedGroupItem;
  v9 = (_UIFloatingTabBarListItem *)v6;
  v10 = v9;
  if (v8 == v9)
  {

  }
  else
  {
    if (v9 && v8)
    {
      v11 = -[_UIFloatingTabBarListItem isEqual:](v8, "isEqual:", v9);

      if (v11)
        goto LABEL_15;
    }
    else
    {

    }
    -[_UIFloatingTabBar dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "snapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (*p_expandedGroupItem)
    {
      v32[0] = *p_expandedGroupItem;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_expandedGroupItem, "children");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "insertItemsWithIdentifiers:afterItemWithIdentifier:", v14, v16);

      objc_msgSend(*p_expandedGroupItem, "children");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "deleteItemsWithIdentifiers:", v17);

      objc_storeStrong((id *)&self->_outgoingExpandedGroupItem, *p_expandedGroupItem);
    }
    objc_storeStrong((id *)&self->_expandedGroupItem, a3);
    if (v10)
    {
      -[_UIFloatingTabBarListItem children](v10, "children");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18 == 0;

      if (v19)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFloatingTabBar.m"), 2318, CFSTR("Cannot expand a group without children"));

      }
      -[_UIFloatingTabBarListItem children](v10, "children");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "insertItemsWithIdentifiers:afterItemWithIdentifier:", v20, v10);

      v31 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "deleteItemsWithIdentifiers:", v21);

    }
    objc_initWeak(&location, self);
    objc_storeStrong((id *)&self->_lastSnapshot, v13);
    -[_UIFloatingTabBar dataSource](self, "dataSource");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __42___UIFloatingTabBar_setExpandedGroupItem___block_invoke;
    v27 = &unk_1E16B1500;
    objc_copyWeak(&v29, &location);
    v28 = self;
    objc_msgSend(v22, "applySnapshot:animatingDifferences:completion:", v13, 1, &v24);

    -[_UIFloatingTabBar _updateTabBarPaginationAnimated:](self, "_updateTabBarPaginationAnimated:", 1, v24, v25, v26, v27);
    -[_UIFloatingTabBar _updateSelectionViewFrameAnimated:completion:](self, "_updateSelectionViewFrameAnimated:completion:", 1, 0);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
LABEL_15:

}

- (void)_observeScrollViewDidScroll:(id)a3
{
  -[_UIFloatingTabBar _setNeedsSelectionFrameUpdate](self, "_setNeedsSelectionFrameUpdate", a3);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateContentAlphaForVisibleCells
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[_UIFloatingTabBar collectionView](self, "collectionView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForVisibleItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[_UIFloatingTabBar _updateContentAlphaForItemAtIndexPath:](self, "_updateContentAlphaForItemAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_updateContentAlphaForItemAtIndexPath:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  void *v24;
  double MaxX;
  void *v26;
  void *v27;
  void *v28;
  double MinX;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v39 = a3;
  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "layoutAttributesForItemAtIndexPath:", v39);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[_UIFloatingTabBar collectionViewContainer](self, "collectionViewContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertRect:toView:", v15, v8, v10, v12, v14);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  if ((v4 & 1) != 0)
  {
    -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "frame");
    MaxX = CGRectGetMaxX(v40);

    if (-[_UIFloatingTabBar showsSidebarButton](self, "showsSidebarButton"))
      -[_UIFloatingTabBar sidebarButton](self, "sidebarButton");
    else
      -[_UIFloatingTabBar rightArrowButton](self, "rightArrowButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[_UIFloatingTabBar showsSidebarButton](self, "showsSidebarButton"))
      -[_UIFloatingTabBar sidebarButton](self, "sidebarButton");
    else
      -[_UIFloatingTabBar leftArrowButton](self, "leftArrowButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "frame");
    MaxX = CGRectGetMaxX(v41);

    -[_UIFloatingTabBar pinnedItemsView](self, "pinnedItemsView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28 = v26;
  objc_msgSend(v26, "frame");
  MinX = CGRectGetMinX(v42);

  v43.origin.x = v17;
  v43.origin.y = v19;
  v43.size.width = v21;
  v43.size.height = v23;
  v30 = MaxX - CGRectGetMinX(v43);
  v44.origin.x = v17;
  v44.origin.y = v19;
  v44.size.width = v21;
  v44.size.height = v23;
  v31 = CGRectGetMaxX(v44) - MinX;
  -[_UIFloatingTabBar _currentPlatformMetrics](self, "_currentPlatformMetrics");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "contentAlphaDistanceThreshold");
  v34 = v33;

  v45.origin.x = v17;
  v45.origin.y = v19;
  v45.size.width = v21;
  v45.size.height = v23;
  v35 = fmax(fmin(1.0 - fmax(v30, v31) / fmin(v34, CGRectGetWidth(v45)), 1.0), 0.0);
  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "cellForItemAtIndexPath:", v39);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "contentView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setAlpha:", v35);

}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[_UIFloatingTabBar selectionGestureRecognizer](self, "selectionGestureRecognizer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state");

  if (v5)
  {
    -[_UIFloatingTabBar selectionGestureRecognizer](self, "selectionGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", 0);

    -[_UIFloatingTabBar selectionGestureRecognizer](self, "selectionGestureRecognizer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", 1);

  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49___UIFloatingTabBar_scrollViewWillBeginDragging___block_invoke;
  v3[3] = &unk_1E16B1B28;
  v3[4] = self;
  -[_UIFloatingTabBar _animateSelection:completion:](self, "_animateSelection:completion:", v3, 0);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  void *v7;
  double v8;
  double v9;
  id v10;

  -[_UIFloatingTabBar collectionView](self, "collectionView", a3, a4.x, a4.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pageProgressForContentOffset:clamped:", 1, a5->x, a5->y);
  v9 = v8;

  -[_UIFloatingTabBar collectionView](self, "collectionView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTargetPage:", llround(v9));

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[_UIFloatingTabBar _updateSelectionViewVisibilityAnimated:](self, "_updateSelectionViewVisibilityAnimated:", 1);
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  -[_UIFloatingTabBar _updateSelectionViewVisibilityAnimated:](self, "_updateSelectionViewVisibilityAnimated:", 1);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v7 = a5;
  -[_UIFloatingTabBar highlightedIndexPath](self, "highlightedIndexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHighlighted:", objc_msgSend(v7, "isEqual:", v8));

  -[_UIFloatingTabBar selectionViewIndexPath](self, "selectionViewIndexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  objc_msgSend(v14, "setHasSelectionHighlight:", v10);
  objc_msgSend(v14, "listItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBar outgoingExpandedGroupItem](self, "outgoingExpandedGroupItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v11, "isEqual:", v12);

  if ((_DWORD)v9)
  {
    objc_msgSend(v14, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 1);

  }
}

- (BOOL)collectionView:(id)a3 canEditItemAtIndexPath:(id)a4
{
  return 1;
}

- (id)_currentPlatformMetrics
{
  void *v2;
  void *v3;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFloatingTabBarGetPlatformMetrics(objc_msgSend(v2, "userInterfaceIdiom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)CFSTR("_UIFloatingTabBar");
}

+ (void)registerPlatformMetrics
{
  if (registerPlatformMetrics___defaultRegistrationToken != -1)
    dispatch_once(&registerPlatformMetrics___defaultRegistrationToken, &__block_literal_global_127_2);
}

- (_UITabModel)tabModel
{
  return self->_tabModel;
}

- (BOOL)showRecentItem
{
  return self->_showRecentItem;
}

- (UIAction)sidebarButtonAction
{
  return self->_sidebarButtonAction;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (CGAffineTransform)additionalTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[15].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[15].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[15].tx;
  return self;
}

- (CGRect)frameForExpandedDropTarget
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frameForExpandedDropTarget.origin.x;
  y = self->_frameForExpandedDropTarget.origin.y;
  width = self->_frameForExpandedDropTarget.size.width;
  height = self->_frameForExpandedDropTarget.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrameForExpandedDropTarget:(CGRect)a3
{
  self->_frameForExpandedDropTarget = a3;
}

- (id)contentFrameDidChangeBlock
{
  return self->_contentFrameDidChangeBlock;
}

- (void)setContentFrameDidChangeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (BOOL)isInTransitionAnimation
{
  return self->_isInTransitionAnimation;
}

- (UISpringLoadedInteraction)springLoadedInteraction
{
  return self->_springLoadedInteraction;
}

- (UISpringLoadedInteractionEffect)blinkEffect
{
  return self->_blinkEffect;
}

- (_UIFloatingTabBarDragController)dragController
{
  return self->_dragController;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)backgroundCaptureView
{
  return self->_backgroundCaptureView;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (_UIVisualEffectBackdropView)backdropCaptureView
{
  return self->_backdropCaptureView;
}

- (_UIFloatingTabBarSelectionContainerView)selectionContainerView
{
  return self->_selectionContainerView;
}

- (_UIContinuousSelectionGestureRecognizer)selectionGestureRecognizer
{
  return self->_selectionGestureRecognizer;
}

- (UIView)collectionViewContainer
{
  return self->_collectionViewContainer;
}

- (_UIEditMenuCollectionView)collectionView
{
  return self->_collectionView;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (NSDiffableDataSourceSnapshot)lastSnapshot
{
  return self->_lastSnapshot;
}

- (_UIFloatingTabBarPinnedItemsView)pinnedItemsView
{
  return self->_pinnedItemsView;
}

- (_UIFloatingTabBarListItem)expandedGroupItem
{
  return self->_expandedGroupItem;
}

- (_UIFloatingTabBarListItem)outgoingExpandedGroupItem
{
  return self->_outgoingExpandedGroupItem;
}

- (_UIFloatingTabBarPageButton)leftArrowButton
{
  return self->_leftArrowButton;
}

- (_UIFloatingTabBarPageButton)rightArrowButton
{
  return self->_rightArrowButton;
}

- (UILongPressGestureRecognizer)editModeGestureRecognizer
{
  return self->_editModeGestureRecognizer;
}

- (_UIFloatingTabBarParser)parser
{
  return self->_parser;
}

- (_UIFloatingTabBarListItem)recentItem
{
  return self->_recentItem;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (NSIndexPath)highlightedIndexPath
{
  return self->_highlightedIndexPath;
}

- (NSIndexPath)selectionViewIndexPath
{
  return self->_selectionViewIndexPath;
}

- (BOOL)selectionViewFollowsHighlightedItem
{
  return self->_selectionViewFollowsHighlightedItem;
}

- (void)setSelectionViewFollowsHighlightedItem:(BOOL)a3
{
  self->_selectionViewFollowsHighlightedItem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionViewIndexPath, 0);
  objc_storeStrong((id *)&self->_highlightedIndexPath, 0);
  objc_storeStrong((id *)&self->_recentItem, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_editModeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_rightArrowButton, 0);
  objc_storeStrong((id *)&self->_leftArrowButton, 0);
  objc_storeStrong((id *)&self->_outgoingExpandedGroupItem, 0);
  objc_storeStrong((id *)&self->_expandedGroupItem, 0);
  objc_storeStrong((id *)&self->_pinnedItemsView, 0);
  objc_storeStrong((id *)&self->_lastSnapshot, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionViewContainer, 0);
  objc_storeStrong((id *)&self->_selectionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_selectionContainerView, 0);
  objc_storeStrong((id *)&self->_backdropCaptureView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_backgroundCaptureView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_dragController, 0);
  objc_storeStrong((id *)&self->_blinkEffect, 0);
  objc_storeStrong((id *)&self->_springLoadedInteraction, 0);
  objc_storeStrong(&self->_contentFrameDidChangeBlock, 0);
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
  objc_storeStrong((id *)&self->_sidebarButtonAction, 0);
  objc_storeStrong((id *)&self->_tabModel, 0);
  objc_storeStrong((id *)&self->_sidebarButton, 0);
}

@end
