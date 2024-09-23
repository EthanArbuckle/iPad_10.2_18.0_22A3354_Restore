@implementation _UIContextMenuListView

- (_UIContextMenuListView)initWithFrame:(CGRect)a3
{
  _UIContextMenuListView *v3;
  _UIContextMenuListView *v4;
  void *v5;
  UIView *v6;
  UIView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIVisualEffectView *v12;
  void *v13;
  UIVisualEffectView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  objc_super v31;
  _QWORD v32[2];
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)_UIContextMenuListView;
  v3 = -[UIView initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupOpacity:", 0);

    v6 = [UIView alloc];
    -[UIView bounds](v4, "bounds");
    v7 = -[UIView initWithFrame:](v6, "initWithFrame:");
    -[_UIContextMenuListView setClippingView:](v4, "setClippingView:", v7);

    -[_UIContextMenuListView clippingView](v4, "clippingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setClipsToBounds:", 1);

    -[_UIContextMenuListView clippingView](v4, "clippingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v4, "addSubview:", v9);

    -[UIView traitCollection](v4, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _UIContextMenuGetPlatformMetrics(objc_msgSend(v10, "userInterfaceIdiom"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = [UIVisualEffectView alloc];
    objc_msgSend(v11, "menuBackgroundEffect");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[UIVisualEffectView initWithEffect:](v12, "initWithEffect:", v13);

    objc_msgSend(v11, "menuBackgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v14, "setBackgroundColor:", v15);

    -[_UIContextMenuListView setBackgroundView:](v4, "setBackgroundView:", v14);
    -[_UIContextMenuListView backgroundMaterialGroupName](v4, "backgroundMaterialGroupName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuListView backgroundView](v4, "backgroundView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_setGroupName:", v16);

    -[_UIContextMenuListView clippingView](v4, "clippingView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuListView backgroundView](v4, "backgroundView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v19);

    -[_UIContextMenuListView setCollectionViewAlpha:](v4, "setCollectionViewAlpha:", 1.0);
    -[_UIContextMenuListView setEmphasized:](v4, "setEmphasized:", 1);
    -[_UIContextMenuListView setAllowsFocus:](v4, "setAllowsFocus:", 1);
    -[_UIContextMenuListView setRoundedEdges:](v4, "setRoundedEdges:", 5);
    -[_UIContextMenuListView _setupCellPortalingIfNeeded](v4, "_setupCellPortalingIfNeeded");
    objc_opt_self();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[UIView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v21, sel__updatePlatterHairline);

    objc_opt_self();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[UIView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v24, sel__updateContentMargins);

    objc_opt_self();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v26;
    objc_opt_self();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[UIView registerForTraitChanges:withHandler:](v4, "registerForTraitChanges:withHandler:", v28, &__block_literal_global_409);

  }
  return v4;
}

- (void)setShadowAlpha:(double)a3
{
  void *v4;
  _QWORD v5[5];

  if (self->_shadowAlpha != a3)
  {
    self->_shadowAlpha = a3;
    if (a3 > 0.0)
    {
      -[_UIContextMenuListView shadowView](self, "shadowView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        v5[0] = MEMORY[0x1E0C809B0];
        v5[1] = 3221225472;
        v5[2] = __41___UIContextMenuListView_setShadowAlpha___block_invoke;
        v5[3] = &unk_1E16B1B28;
        v5[4] = self;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v5);
      }
    }
    -[_UIContextMenuListView _updateShadowAlpha](self, "_updateShadowAlpha");
  }
}

- (void)setCollectionViewAlpha:(double)a3
{
  if (self->_collectionViewAlpha != a3)
  {
    self->_collectionViewAlpha = a3;
    -[_UIContextMenuListView _updateCollectionViewAlpha](self, "_updateCollectionViewAlpha");
  }
}

- (void)setRoundedEdges:(unint64_t)a3
{
  if (self->_roundedEdges != a3)
  {
    self->_roundedEdges = a3;
    -[_UIContextMenuListView _updateCornerRadius](self, "_updateCornerRadius");
  }
}

- (CGVector)selectionGestureAllowableMovementForGestureBeginningAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  CGVector result;

  v4 = a3;
  -[_UIContextMenuListView collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_autoScrollAssistantForIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIContextMenuListView collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    -[_UIContextMenuListView visibleContentSize](self, "visibleContentSize");
    v10 = v13;
    v12 = v14;
  }
  else
  {
    objc_msgSend(v7, "frame");
    v10 = v9;
    v12 = v11;
  }
  objc_msgSend(v7, "contentSize");
  if (v15 <= v12)
    v16 = 0.0;
  else
    v16 = 10.0;
  objc_msgSend(v7, "contentSize");
  if (v17 <= v10)
    v18 = 0.0;
  else
    v18 = 10.0;

  v19 = v18;
  v20 = v16;
  result.dy = v20;
  result.dx = v19;
  return result;
}

- (void)setReversesActionOrder:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (self->_reversesActionOrder != a3)
  {
    self->_reversesActionOrder = a3;
    -[_UIContextMenuListView displayedMenu](self, "displayedMenu");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[_UIContextMenuListView displayedMenu](self, "displayedMenu");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      _UIContextMenuCollectionViewDataSourceSnapshot(v5, self->_reversesActionOrder);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      -[_UIContextMenuListView collectionViewDataSource](self, "collectionViewDataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "applySnapshotUsingReloadData:", v13);

      -[_UIContextMenuListView displayedMenu](self, "displayedMenu");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "_hasGlobalHeader");
      v9 = -[_UIContextMenuListView position](self, "position");
      -[UIView traitCollection](self, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _UIContextMenuCollectionViewLayout(v13, v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuListView collectionView](self, "collectionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setCollectionViewLayout:", v11);

    }
  }
}

- (void)setEmphasized:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  double v7;
  unint64_t v8;

  if (self->_emphasized != a3)
  {
    v3 = a3;
    self->_emphasized = a3;
    -[_UIContextMenuListView collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "panGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", v3);

    v7 = 1.0;
    if (!self->_emphasized)
    {
      v8 = -[_UIContextMenuListView parentHierarchyStyle](self, "parentHierarchyStyle", 1.0);
      v7 = 0.8;
      if (v8 == 1)
        v7 = 0.5;
    }
    -[_UIContextMenuListView setEmphasisAlphaMultiplier:](self, "setEmphasisAlphaMultiplier:", v7);
    -[_UIContextMenuListView _updateCollectionViewAlpha](self, "_updateCollectionViewAlpha");
    -[_UIContextMenuListView _updateShadowAlpha](self, "_updateShadowAlpha");
  }
}

- (void)setSubmenuTitleViewExpanded:(BOOL)a3 withMaterialGroupName:(id)a4 associatedCellContentView:(id)a5 highlighted:(BOOL)a6
{
  _BOOL4 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  BOOL v28;
  BOOL v29;

  v8 = a3;
  v22 = a4;
  v10 = a5;
  -[_UIContextMenuListView _headerIndexPath](self, "_headerIndexPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[_UIContextMenuListView collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "supplementaryViewForElementKind:atIndexPath:", CFSTR("kContextMenuSubmenuTitleHeader"), v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __114___UIContextMenuListView_setSubmenuTitleViewExpanded_withMaterialGroupName_associatedCellContentView_highlighted___block_invoke;
    v23[3] = &unk_1E16BF9A8;
    v28 = a6;
    v23[4] = self;
    v29 = v8;
    v24 = v11;
    v25 = v13;
    v26 = v10;
    v27 = v22;
    v14 = v13;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v23);
    objc_msgSend(v14, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "options");

    if (v8)
      v17 = 0.0;
    else
      v17 = 1.0;
    v18 = 64;
    if (!v8)
      v18 = 0;
    v19 = v16 & 0xFFFFFFFFFFFFFFBFLL | v18;
    objc_msgSend(v14, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setOptions:", v19);

    objc_msgSend(v14, "obscuringMaterialView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAlpha:", v17);

  }
}

- (CGSize)preferredContentSizeWithinContainerSize:(CGSize)a3
{
  double height;
  CGFloat width;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[4];
  id v13;
  _UIContextMenuListView *v14;
  uint64_t *v15;
  CGFloat v16;
  double v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[_UIContextMenuListView collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = (double *)&v18;
  v20 = 0x3010000000;
  v22 = 0;
  v23 = 0;
  v21 = &unk_18685B0AF;
  objc_msgSend(v6, "contentSize");
  v22 = v7;
  v23 = v8;
  if (!-[_UIContextMenuListView hasValidContentSize](self, "hasValidContentSize"))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66___UIContextMenuListView_preferredContentSizeWithinContainerSize___block_invoke;
    v12[3] = &unk_1E16DA780;
    v16 = width;
    v17 = height;
    v14 = self;
    v15 = &v18;
    v13 = v6;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v12);

  }
  v9 = v19[4];
  if (v19[5] < height)
    height = v19[5];
  v19[5] = height;
  _Block_object_dispose(&v18, 8);

  v10 = v9;
  v11 = height;
  result.height = v11;
  result.width = v10;
  return result;
}

- (double)closestScrollTruncationDetentToHeight:(double)a3
{
  void *v5;
  double v6;
  _BOOL4 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t i;
  void *v21;
  double MidY;
  double v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;

  v30 = *MEMORY[0x1E0C80C00];
  -[_UIContextMenuListView collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentSize");
  if (v6 > a3)
  {
    v7 = -[_UIContextMenuListView reversesActionOrder](self, "reversesActionOrder");
    v8 = a3 + -50.0;
    if (v7)
    {
      objc_msgSend(v5, "contentSize");
      v8 = v9 - v8;
    }
    objc_msgSend(v5, "bounds");
    v11 = v10;
    objc_msgSend(v5, "_collectionViewData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewData layoutAttributesForElementsInRect:](v12, 0.0, v8, v11, 100.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "count"))
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v26;
        v18 = 1.79769313e308;
        v19 = a3;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v26 != v17)
              objc_enumerationMutation(v14);
            v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            if (!objc_msgSend(v21, "representedElementCategory", (_QWORD)v25))
            {
              objc_msgSend(v21, "frame");
              MidY = CGRectGetMidY(v31);
              if (v7)
              {
                objc_msgSend(v5, "contentSize");
                MidY = v23 - MidY;
              }
              if (MidY < a3 && a3 - MidY < v18)
              {
                v19 = MidY;
                v18 = a3 - MidY;
              }
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v16);
      }
      else
      {
        v19 = a3;
      }

      a3 = v19;
    }

  }
  return a3;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UIContextMenuListView;
  -[UIView layoutSubviews](&v14, sel_layoutSubviews);
  -[_UIContextMenuListView _sizeClippingAndCollectionViews](self, "_sizeClippingAndCollectionViews");
  -[_UIContextMenuListView shadowView](self, "shadowView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuListView clippingView](self, "clippingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  objc_msgSend(v3, "frameWithContentWithFrame:");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[_UIContextMenuListView shadowView](self, "shadowView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

}

- (void)_sizeClippingAndCollectionViews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  id v24;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UIContextMenuListView backgroundView](self, "backgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[_UIContextMenuListView clippingView](self, "clippingView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  -[_UIContextMenuListView _platformMetrics](self, "_platformMetrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "gradientMaskingConfiguration");
  v24 = (id)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    if (objc_msgSend(v24, "embedBackgroundForCompositing"))
    {
      objc_msgSend(v24, "gradientMaskEdgeInsets");
      v15 = v6 + v14;
      -[_UIContextMenuListView cvBackgroundView](self, "cvBackgroundView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFrame:", v4, v15, v8, v10);

    }
    objc_msgSend(v24, "gradientMaskEdgeInsets");
    v18 = v17;
    objc_msgSend(v24, "gradientMaskEdgeInsets");
    v20 = v6 - v18;
    v21 = v10 - (-v19 - v18);
    -[_UIContextMenuListView collectionView](self, "collectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFrame:", v4 + 0.0, v20, v8, v21);

    -[_UIContextMenuListView borderView](self, "borderView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFrame:", v4 + -1.0, v6 + -1.0, v8 + 2.0, v10 + 2.0);

  }
  -[_UIContextMenuListView _updateScrollInsets](self, "_updateScrollInsets");
  -[_UIContextMenuListView _updateCornerRadius](self, "_updateCornerRadius");

}

- (void)_updateScrollInsets
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  id v12;
  CGRect v13;

  -[_UIContextMenuListView _platformMetrics](self, "_platformMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gradientMaskingConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[_UIContextMenuListView collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentSize");
    v7 = v6;

    -[_UIContextMenuListView visibleContentSize](self, "visibleContentSize");
    v9 = v7 - v8;
    -[_UIContextMenuListView collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v11 = v9 + CGRectGetHeight(v13) - v7;

    -[_UIContextMenuListView collectionView](self, "collectionView");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentInset:", 0.0, 0.0, fmax(v11, 0.0), 0.0);

  }
}

- (void)setVisibleContentSize:(CGSize)a3
{
  if (a3.width != self->_visibleContentSize.width || a3.height != self->_visibleContentSize.height)
  {
    self->_visibleContentSize = a3;
    -[_UIContextMenuListView _updateScrollInsets](self, "_updateScrollInsets");
  }
}

- (void)_updateCornerRadius
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  _QWORD v23[8];

  -[_UIContextMenuListView _clampedCornerRadius](self, "_clampedCornerRadius");
  v4 = v3;
  -[_UIContextMenuListView _platformMetrics](self, "_platformMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gradientMaskingConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "backgroundMasksCorners");

  if (v7)
  {
    -[_UIContextMenuListView backgroundView](self, "backgroundView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setContinuousCornerRadius:", v4);

    -[_UIContextMenuListView cvBackgroundView](self, "cvBackgroundView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setContinuousCornerRadius:", v4);

    -[_UIContextMenuListView borderView](self, "borderView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setContinuousCornerRadius:", v4 + 1.0);

    v11 = v4;
    v12 = v4;
  }
  else
  {
    v12 = 0.0;
    if ((-[_UIContextMenuListView roundedEdges](self, "roundedEdges") & 1) != 0)
      v11 = v4;
    else
      v11 = 0.0;
    if ((-[_UIContextMenuListView roundedEdges](self, "roundedEdges") & 4) != 0)
      v12 = v4;
  }
  v13 = *MEMORY[0x1E0CD2A68];
  -[_UIContextMenuListView clippingView](self, "clippingView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCornerCurve:", v13);

  -[_UIContextMenuListView clippingView](self, "clippingView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)v23 = v12;
  *(double *)&v23[1] = v12;
  *(double *)&v23[2] = v12;
  *(double *)&v23[3] = v12;
  *(double *)&v23[4] = v11;
  *(double *)&v23[5] = v11;
  *(double *)&v23[6] = v11;
  *(double *)&v23[7] = v11;
  objc_msgSend(v17, "setCornerRadii:", v23);

  v18 = v4 + -2.0;
  -[_UIContextMenuListView collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "contentInset");
  v21 = v18 + v20;
  -[_UIContextMenuListView collectionView](self, "collectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setScrollIndicatorInsets:", v18, 0.0, v21, 0.0);

}

- (void)_updateCollectionViewAlpha
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  -[_UIContextMenuListView collectionViewAlpha](self, "collectionViewAlpha");
  v4 = v3;
  -[_UIContextMenuListView emphasisAlphaMultiplier](self, "emphasisAlphaMultiplier");
  v6 = v4 * v5;
  -[_UIContextMenuListView collectionView](self, "collectionView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v6);

}

- (void)_updateShadowAlpha
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;

  -[_UIContextMenuListView _platformMetrics](self, "_platformMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewShadowSettings");
  v33 = (id)objc_claimAutoreleasedReturnValue();

  if (v33 && (objc_msgSend(v33, "opacity"), v4 > 0.0))
  {
    objc_msgSend(v33, "opacity");
    v6 = v5;
    -[_UIContextMenuListView emphasisAlphaMultiplier](self, "emphasisAlphaMultiplier");
    v8 = v6 * v7;
    -[_UIContextMenuListView shadowAlpha](self, "shadowAlpha");
    *(float *)&v8 = v8 * ceil(v9);
    -[_UIContextMenuListView clippingView](self, "clippingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = LODWORD(v8);
    objc_msgSend(v11, "setShadowOpacity:", v12);

    objc_msgSend(v33, "color");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = objc_msgSend(v13, "CGColor");
    -[_UIContextMenuListView clippingView](self, "clippingView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setShadowColor:", v14);

    objc_msgSend(v33, "offset");
    v18 = v17;
    v20 = v19;
    -[_UIContextMenuListView clippingView](self, "clippingView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setShadowOffset:", v18, v20);

    objc_msgSend(v33, "radius");
    v24 = v23;
    -[_UIContextMenuListView clippingView](self, "clippingView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setShadowRadius:", v24);

    -[_UIContextMenuListView clippingView](self, "clippingView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setShadowPathIsBounds:", 1);

  }
  else
  {
    -[_UIContextMenuListView shadowAlpha](self, "shadowAlpha");
    v30 = v29;
    -[_UIContextMenuListView emphasisAlphaMultiplier](self, "emphasisAlphaMultiplier");
    v32 = v30 * v31;
    -[_UIContextMenuListView shadowView](self, "shadowView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAlpha:", v32);
  }

}

- (void)setDisplayedMenu:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double Width;
  void *v14;
  double Height;
  UICollectionView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  UIVisualEffectView *v27;
  void *v28;
  UIVisualEffectView *v29;
  void *v30;
  void *v31;
  UIView *v32;
  UIView *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  UIView *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  CGRect v60;
  CGRect v61;

  v59 = a3;
  objc_storeStrong((id *)&self->_displayedMenu, a3);
  -[_UIContextMenuListView setHasValidContentSize:](self, "setHasValidContentSize:", 0);
  -[_UIContextMenuListView setHighlightedIndexPath:](self, "setHighlightedIndexPath:", 0);
  -[_UIContextMenuListView collectionViewDataSource](self, "collectionViewDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuListView setOutgoingCollectionViewDataSource:](self, "setOutgoingCollectionViewDataSource:", v5);

  -[_UIContextMenuListView _updateContentMargins](self, "_updateContentMargins");
  -[_UIContextMenuListView displayedMenu](self, "displayedMenu");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuCollectionViewDataSourceSnapshot(v6, -[_UIContextMenuListView reversesActionOrder](self, "reversesActionOrder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIContextMenuListView displayedMenu](self, "displayedMenu");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_hasGlobalHeader");
  v10 = -[_UIContextMenuListView position](self, "position");
  -[UIView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuCollectionViewLayout(v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView bounds](self, "bounds");
  Width = CGRectGetWidth(v60);
  -[UIView window](self, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  Height = CGRectGetHeight(v61);

  if (Height < 44.0)
    Height = 44.0;
  v16 = -[UICollectionView initWithFrame:collectionViewLayout:]([UICollectionView alloc], "initWithFrame:collectionViewLayout:", v12, 0.0, 0.0, Width, Height);
  -[UICollectionView setAllowsSelection:](v16, "setAllowsSelection:", 1);
  -[UICollectionView setAllowsMultipleSelection:](v16, "setAllowsMultipleSelection:", 1);
  +[UIColor clearColor](UIColor, "clearColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](v16, "setBackgroundColor:", v17);

  -[UICollectionView setAlwaysBounceVertical:](v16, "setAlwaysBounceVertical:", 0);
  -[UICollectionView setAlwaysBounceHorizontal:](v16, "setAlwaysBounceHorizontal:", 0);
  -[UIView setClipsToBounds:](v16, "setClipsToBounds:", 0);
  -[_UIContextMenuListView _platformMetrics](self, "_platformMetrics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "gradientMaskingConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](v16, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAllowsGroupOpacity:", v19 != 0);

  -[UICollectionView setDelegate:](v16, "setDelegate:", self);
  -[UICollectionView setRemembersLastFocusedIndexPath:](v16, "setRemembersLastFocusedIndexPath:", 1);
  -[_UIContextMenuListView _platformMetrics](self, "_platformMetrics");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "gradientMaskingConfiguration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[UICollectionView setAllowsSelection:](v16, "setAllowsSelection:", 1);
    -[UIView setClipsToBounds:](v16, "setClipsToBounds:", 0);
    -[UIScrollView setContentInsetAdjustmentBehavior:](v16, "setContentInsetAdjustmentBehavior:", 2);
    objc_msgSend(v22, "gradientMaskEdgeInsets");
    -[UICollectionView setContentInset:](v16, "setContentInset:");
    objc_msgSend(v22, "gradientMaskLengths");
    -[UIScrollView _setGradientMaskLengths:](v16, "_setGradientMaskLengths:");
    objc_msgSend(v22, "gradientMaskEdgeInsets");
    -[UIScrollView _setGradientMaskEdgeInsets:](v16, "_setGradientMaskEdgeInsets:");
    if (objc_msgSend(v22, "embedBackgroundForCompositing"))
    {
      -[_UIContextMenuListView _clampedCornerRadius](self, "_clampedCornerRadius");
      v24 = v23;
      -[UIView traitCollection](self, "traitCollection");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      _UIContextMenuGetPlatformMetrics(objc_msgSend(v25, "userInterfaceIdiom"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = [UIVisualEffectView alloc];
      objc_msgSend(v26, "menuBackgroundEffect");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[UIVisualEffectView initWithEffect:](v27, "initWithEffect:", v28);

      objc_msgSend(v26, "menuBackgroundColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v29, "setBackgroundColor:", v30);

      -[UIVisualEffectView _setContinuousCornerRadius:](v29, "_setContinuousCornerRadius:", v24);
      -[_UIContextMenuListView backgroundMaterialGroupName](self, "backgroundMaterialGroupName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView _setGroupName:](v29, "_setGroupName:", v31);

      v32 = [UIView alloc];
      -[UIView bounds](v16, "bounds");
      v33 = -[UIView initWithFrame:](v32, "initWithFrame:");
      -[UIView addSubview:](v33, "addSubview:", v29);
      objc_msgSend(v22, "gradientMaskEdgeInsets");
      v35 = v34;
      objc_msgSend(v22, "gradientMaskEdgeInsets");
      -[UIView bounds](v33, "bounds");
      -[UIView setFrame:](v29, "setFrame:", v36 + 0.0, v35 + v37);
      -[_UIContextMenuListView setCvBackgroundView:](self, "setCvBackgroundView:", v29);
      -[UICollectionView setBackgroundView:](v16, "setBackgroundView:", v33);

    }
    -[_UIContextMenuListView borderView](self, "borderView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v38)
    {
      v39 = objc_alloc_init(UIView);
      -[_UIContextMenuListView setBorderView:](self, "setBorderView:", v39);

      -[_UIContextMenuListView borderView](self, "borderView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuListView clippingView](self, "clippingView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v40, v41);

    }
    -[UIView bounds](self, "bounds");
    v43 = v42 + -1.0;
    v45 = v44 + -1.0;
    v47 = v46 + 2.0;
    v49 = v48 + 2.0;
    -[_UIContextMenuListView borderView](self, "borderView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setFrame:", v43, v45, v47, v49);

    -[_UIContextMenuListView _updatePlatterHairline](self, "_updatePlatterHairline");
  }
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v16, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("kContextMenuSmallCell"));
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v16, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("kContextMenuMediumCell"));
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v16, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("kContextMenuLargeCell"));
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v16, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("kContextMenuLoadingCell"));
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v16, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("kContextMenuCustomViewCell"));
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v16, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("kContextMenuHeader"), CFSTR("kContextMenuHeader"));
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v16, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("kContextMenuSubmenuTitleHeader"), CFSTR("kContextMenuSubmenuTitleHeader"));
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v16, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("kContextMenuSectionSeparator"), CFSTR("kContextMenuSectionSeparator"));
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v16, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("kContextMenuGradientMaskSectionSeparator"), CFSTR("kContextMenuGradientMaskSectionSeparator"));
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v16, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("kContextMenuGradientStyleHeader"), CFSTR("kContextMenuGradientStyleHeader"));
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v16, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("kContextMenuGradientStyleFooter"), CFSTR("kContextMenuGradientStyleFooter"));
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v16, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("kContextMenuThinSectionSeparator"), CFSTR("kContextMenuThinSectionSeparator"));
  -[_UIContextMenuListView _dataSourceForCollectionView:](self, "_dataSourceForCollectionView:", v16);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuListView setCollectionViewDataSource:](self, "setCollectionViewDataSource:", v51);

  -[_UIContextMenuListView collectionViewDataSource](self, "collectionViewDataSource");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "applySnapshotUsingReloadData:", v7);

  -[_UIContextMenuListView setCollectionView:](self, "setCollectionView:", v16);
  -[_UIContextMenuListView _platformMetrics](self, "_platformMetrics");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "gradientMaskingConfiguration");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIContextMenuListView clippingView](self, "clippingView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v54)
  {
    -[_UIContextMenuListView backgroundView](self, "backgroundView");
    v56 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  -[_UIContextMenuListView outgoingCollectionView](self, "outgoingCollectionView");
  v56 = objc_claimAutoreleasedReturnValue();
  if (v56)
  {
LABEL_13:
    v58 = (void *)v56;
    objc_msgSend(v55, "insertSubview:aboveSubview:", v16, v56);
    goto LABEL_14;
  }
  -[_UIContextMenuListView backgroundView](self, "backgroundView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "insertSubview:aboveSubview:", v16, v57);

  v58 = 0;
LABEL_14:

  -[_UIContextMenuListView _updateCollectionViewAlpha](self, "_updateCollectionViewAlpha");
}

- (void)willStartInPlaceMenuTransition
{
  void *v3;

  -[_UIContextMenuListView collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuListView setOutgoingCollectionView:](self, "setOutgoingCollectionView:", v3);

  -[_UIContextMenuListView _setupCellPortalingIfNeeded](self, "_setupCellPortalingIfNeeded");
}

- (void)didCompleteInPlaceMenuTransition
{
  -[_UIContextMenuListView setOutgoingCollectionView:](self, "setOutgoingCollectionView:", 0);
  -[_UIContextMenuListView setOutgoingCollectionViewDataSource:](self, "setOutgoingCollectionViewDataSource:", 0);
  -[_UIContextMenuListView _tearDownCellPortalingIfNeeded](self, "_tearDownCellPortalingIfNeeded");
}

- (id)preferredFocusEnvironments
{
  void *v3;
  __int16 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[_UIContextMenuListView displayedMenu](self, "displayedMenu");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "metadata");
  -[_UIContextMenuListView highlightedIndexPath](self, "highlightedIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIContextMenuListView highlightedIndexPath](self, "highlightedIndexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuListView _viewAtIndexPath:](self, "_viewAtIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((v4 & 0x100) == 0 || (objc_msgSend(v3, "options") & 0x20) == 0)
      goto LABEL_7;
    -[_UIContextMenuListView displayedMenu](self, "displayedMenu");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectedElements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIContextMenuListView indexPathForElement:](self, "indexPathForElement:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuListView _viewAtIndexPath:](self, "_viewAtIndexPath:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v7)
  {
LABEL_7:
    v8 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_8;
  }
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v8;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  -[_UIContextMenuListView _updateCellPortalingWithCell:](self, "_updateCellPortalingWithCell:", a4);
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  id v11;

  v11 = a4;
  -[_UIContextMenuListView _updateCellPortalingWithUpdateFocusInContext:inCollectionView:](self, "_updateCellPortalingWithUpdateFocusInContext:inCollectionView:", v11, a3);
  objc_msgSend(v11, "nextFocusedIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nextFocusedItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  objc_msgSend(v11, "nextFocusedItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[UIFocusSystem environment:containsEnvironment:](UIFocusSystem, "environment:containsEnvironment:", self, v9);

  if (v10)
  {
    -[_UIContextMenuListView _headerIndexPath](self, "_headerIndexPath");
    v8 = v7;
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:

  }
  if (v7 || -[_UIContextMenuListView parentHierarchyStyle](self, "parentHierarchyStyle") == 1)
    -[_UIContextMenuListView highlightItemAtIndexPath:forHover:](self, "highlightItemAtIndexPath:forHover:", v7, 0);

}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  void *v5;
  BOOL v6;

  -[_UIContextMenuListView elementAtIndexPath:](self, "elementAtIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_canBeHighlighted"))
    v6 = -[_UIContextMenuListView allowsFocus](self, "allowsFocus");
  else
    v6 = 0;

  return v6;
}

- (void)setAllowsFocus:(BOOL)a3
{
  void *v4;
  id v5;

  self->_allowsFocus = a3;
  -[_UIContextMenuListView _headerIndexPath](self, "_headerIndexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuListView _viewAtIndexPath:](self, "_viewAtIndexPath:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v5, "setAllowsFocus:", -[_UIContextMenuListView allowsFocus](self, "allowsFocus"));

}

- (void)scrollToFirstSignificantAction
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  -[_UIContextMenuListView highlightedIndexPath](self, "highlightedIndexPath");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_12;
  v4 = (void *)v3;
  -[_UIContextMenuListView highlightedIndexPath](self, "highlightedIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuListView _headerIndexPath](self, "_headerIndexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    -[_UIContextMenuListView collectionView](self, "collectionView");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuListView highlightedIndexPath](self, "highlightedIndexPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scrollToItemAtIndexPath:atScrollPosition:animated:", v11, 2, 0);
  }
  else
  {
LABEL_12:
    if (-[_UIContextMenuListView _shouldScrollToSelectedAction](self, "_shouldScrollToSelectedAction"))
    {
      -[_UIContextMenuListView displayedMenu](self, "displayedMenu");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "selectedElements");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v17 = (id)objc_claimAutoreleasedReturnValue();

      -[_UIContextMenuListView collectionViewDataSource](self, "collectionViewDataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "indexPathForItemIdentifier:", v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIContextMenuListView collectionView](self, "collectionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scrollToItemAtIndexPath:atScrollPosition:animated:", v11, 2, 0);
    }
    else
    {
      if (!-[_UIContextMenuListView reversesActionOrder](self, "reversesActionOrder"))
        return;
      -[_UIContextMenuListView collectionView](self, "collectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "numberOfSections") - 1;

      -[_UIContextMenuListView collectionView](self, "collectionView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "numberOfItemsInSection:", v14) - 1;

      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v16, v14);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuListView collectionView](self, "collectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuListView _platformMetrics](self, "_platformMetrics");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sectionInsets");
      objc_msgSend(v11, "_scrollToItemAtIndexPath:atScrollPosition:additionalInsets:animated:", v17, 4, 0);
    }

  }
}

- (BOOL)_shouldScrollToSelectedAction
{
  void *v2;
  BOOL v3;

  -[_UIContextMenuListView displayedMenu](self, "displayedMenu");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((objc_msgSend(v2, "options") & 0x20) != 0 || objc_msgSend(v2, "forceAutomaticSelection"))
    && (objc_msgSend(v2, "metadata") & 0x10100) == 256;

  return v3;
}

- (id)indexPathForItemAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  CGPoint v15;
  CGPoint v16;
  CGRect v17;
  CGRect v18;

  y = a3.y;
  x = a3.x;
  -[UIView bounds](self, "bounds");
  v15.x = x;
  v15.y = y;
  if (CGRectContainsPoint(v17, v15))
  {
    -[_UIContextMenuListView collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "visibleSupplementaryViewsOfKind:", CFSTR("kContextMenuSubmenuTitleHeader"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_5;
    objc_msgSend(v8, "convertPoint:fromView:", self, x, y);
    v10 = v9;
    v12 = v11;
    objc_msgSend(v8, "bounds");
    v16.x = v10;
    v16.y = v12;
    if (!CGRectContainsPoint(v18, v16)
      || (-[_UIContextMenuListView _headerIndexPath](self, "_headerIndexPath"),
          (v13 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
LABEL_5:
      objc_msgSend(v6, "convertPoint:fromView:", self, x, y);
      objc_msgSend(v6, "indexPathForItemAtPoint:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)elementAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[_UIContextMenuListView _headerIndexPath](self, "_headerIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    -[_UIContextMenuListView displayedMenu](self, "displayedMenu");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UIContextMenuListView collectionViewDataSource](self, "collectionViewDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemIdentifierForIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)indexPathForElement:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[_UIContextMenuListView displayedMenu](self, "displayedMenu");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    -[_UIContextMenuListView _headerIndexPath](self, "_headerIndexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UIContextMenuListView collectionViewDataSource](self, "collectionViewDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathForItemIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)cellForElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[_UIContextMenuListView collectionViewDataSource](self, "collectionViewDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForItemIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_UIContextMenuListView collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cellForItemAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)unHighlightItemAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UIContextMenuListView setHighlightedIndexPath:](self, "setHighlightedIndexPath:", 0);
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowsItemHighlighting");

  if (v6)
  {
    -[_UIContextMenuListView _viewAtIndexPath:](self, "_viewAtIndexPath:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHighlighted:", 0);

  }
}

- (void)highlightItemAtIndexPath:(id)a3
{
  -[_UIContextMenuListView highlightItemAtIndexPath:forHover:](self, "highlightItemAtIndexPath:forHover:", a3, 0);
}

- (void)highlightItemAtIndexPath:(id)a3 forHover:(BOOL)a4
{
  -[_UIContextMenuListView highlightItemAtIndexPath:forHover:playFeedback:](self, "highlightItemAtIndexPath:forHover:playFeedback:", a3, a4, 0);
}

- (void)highlightItemAtIndexPath:(id)a3 forHover:(BOOL)a4 playFeedback:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;

  v5 = a4;
  v15 = a3;
  -[_UIContextMenuListView highlightedIndexPath](self, "highlightedIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v15);

  if ((v8 & 1) == 0)
  {
    -[_UIContextMenuListView highlightedIndexPath](self, "highlightedIndexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[_UIContextMenuListView highlightedIndexPath](self, "highlightedIndexPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuListView unHighlightItemAtIndexPath:](self, "unHighlightItemAtIndexPath:", v10);

    }
    if (v15)
    {
      -[_UIContextMenuListView setHighlightedIndexPath:](self, "setHighlightedIndexPath:", v15);
      -[UIView traitCollection](self, "traitCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _UIContextMenuGetPlatformMetrics(objc_msgSend(v11, "userInterfaceIdiom"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "allowsItemHighlighting");

      if (v13)
      {
        -[_UIContextMenuListView _viewAtIndexPath:](self, "_viewAtIndexPath:", v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v14, "setHighlighted:forHover:", 1, v5);
        else
          objc_msgSend(v14, "setHighlighted:", 1);
        objc_msgSend(v14, "layoutIfNeeded");

      }
    }
    -[UIView setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }

}

- (id)_viewAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[_UIContextMenuListView _headerIndexPath](self, "_headerIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  -[_UIContextMenuListView collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "supplementaryViewForElementKind:atIndexPath:", CFSTR("kContextMenuSubmenuTitleHeader"), v4);
  else
    objc_msgSend(v7, "cellForItemAtIndexPath:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_headerIndexPath
{
  void *v2;

  if (-[_UIContextMenuListView position](self, "position") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_dataSourceForCollectionView:(id)a3
{
  id v4;
  UICollectionViewDiffableDataSource *v5;
  uint64_t v6;
  UICollectionViewDiffableDataSource *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = [UICollectionViewDiffableDataSource alloc];
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55___UIContextMenuListView__dataSourceForCollectionView___block_invoke;
  v11[3] = &unk_1E16DA7A8;
  objc_copyWeak(&v12, &location);
  v7 = -[UICollectionViewDiffableDataSource initWithCollectionView:cellProvider:](v5, "initWithCollectionView:cellProvider:", v4, v11);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __55___UIContextMenuListView__dataSourceForCollectionView___block_invoke_2;
  v9[3] = &unk_1E16DA7D0;
  objc_copyWeak(&v10, &location);
  -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](v7, "setSupplementaryViewProvider:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v7;
}

- (void)_configureCell:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 forElement:(id)a6 section:(id)a7 size:(int64_t)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  _QWORD v57[5];
  _QWORD v58[5];
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  objc_msgSend(v13, "actionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "layout") == 1)
  {
    -[_UIContextMenuListView _platformMetrics](self, "_platformMetrics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "enableFloatingFocusStyle");

  }
  objc_msgSend(v18, "setLayoutClass:", objc_opt_class());
  objc_msgSend(v13, "_setFocusStyle:", objc_msgSend(v18, "focusStyle"));
  v54 = objc_msgSend(v17, "isMultiColorPalette");
  objc_msgSend(v16, "image");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "subtitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v16, "_isLeaf");
  v22 = v16;
  v23 = v22;
  v52 = v14;
  v53 = v13;
  if (v21)
  {
    if (objc_msgSend(v20, "length") || (_UIIsPrivateMainBundle() & 1) == 0 && (dyld_program_sdk_at_least() & 1) != 0)
    {
      v56 = v20;
    }
    else
    {
      objc_msgSend(v23, "discoverabilityTitle");
      v28 = objc_claimAutoreleasedReturnValue();

      v56 = (void *)v28;
    }
    v26 = objc_msgSend(v23, "attributes") & 1;
    v24 = objc_msgSend(v23, "attributes");
    v50 = objc_msgSend(v23, "state");
    if (v50 == 1)
    {
      objc_msgSend(v23, "selectedImage");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(v23, "selectedImage");
        v30 = objc_claimAutoreleasedReturnValue();

        v54 = 2;
        v55 = (void *)v30;
      }
    }

    v27 = 0;
  }
  else
  {
    v56 = v20;
    v24 = objc_msgSend(v22, "options");
    v25 = objc_msgSend(v23, "_shouldShowSelectionState");

    v26 = 0;
    v50 = v25;
    v27 = 16;
  }
  objc_msgSend(v23, "title");
  v31 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "attributedTitle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v23, "attributedTitle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAttributedTitle:", v33);

  }
  else
  {
    objc_msgSend(v18, "setTitle:", v31);
  }
  v51 = v17;
  objc_msgSend(v18, "setSubtitle:", v56);
  objc_msgSend(v23, "_accessoryAction");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)v31;
  if (v34)
  {
    objc_msgSend(v23, "_accessoryAction");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAccessoryAction:", v36);

  }
  else
  {
    objc_msgSend(v18, "setImage:", v55);
  }
  v37 = v24 & 2;
  objc_msgSend(v23, "accessibilityIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccessibilityIdentifier:", v38);

  -[_UIContextMenuListView displayedMenu](self, "displayedMenu");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "metadata");

  if ((v40 & 0x10000) != 0 && -[_UIContextMenuListView parentHierarchyStyle](self, "parentHierarchyStyle") == 2)
    v27 |= 0x20uLL;
  v41 = v37 | v26 | v27;
  objc_msgSend(v18, "setSelectedIconBehavior:", v54);
  objc_msgSend(v18, "layout");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "useContentShapeForSelectionHighlight");

  if (v43)
  {
    v45 = v52;
    v44 = v53;
    v46 = v15;
    v47 = v35;
    if ((unint64_t)(v50 - 1) <= 1)
      objc_msgSend(v52, "selectItemAtIndexPath:animated:scrollPosition:", v15, 0, 0);
  }
  else
  {
    v48 = v41 | 4;
    if (v50 != 1)
      v48 = v41;
    if (v50 == 2)
      v41 |= 8uLL;
    else
      v41 = v48;
    v45 = v52;
    v44 = v53;
    v46 = v15;
    v47 = v35;
  }
  if (-[_UIContextMenuListView allowsBackgroundViewInteraction](self, "allowsBackgroundViewInteraction"))
    v49 = v41;
  else
    v49 = v41 | 0x80;
  objc_msgSend(v18, "setOptions:", v49);
  objc_msgSend(v18, "setNumberOfTitleLines:", objc_msgSend(v51, "actionLineLimit"));
  if (objc_msgSend(v23, "_isLeaf"))
  {
    v59 = 0;
    v60 = &v59;
    v61 = 0x3032000000;
    v62 = __Block_byref_object_copy__150;
    v63 = __Block_byref_object_dispose__150;
    v64 = 0;
    v57[4] = &v59;
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __94___UIContextMenuListView__configureCell_inCollectionView_atIndexPath_forElement_section_size___block_invoke;
    v58[3] = &unk_1E16D9BA8;
    v58[4] = &v59;
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __94___UIContextMenuListView__configureCell_inCollectionView_atIndexPath_forElement_section_size___block_invoke_2;
    v57[3] = &unk_1E16D9BD0;
    objc_msgSend(v23, "_acceptMenuVisit:commandVisit:actionVisit:deferredElementVisit:", 0, v58, v57, 0);
    if (v60[5])
      objc_msgSend(v18, "setPasteVariant:");
    _Block_object_dispose(&v59, 8);

  }
}

- (NSString)backgroundMaterialGroupName
{
  NSString *backgroundMaterialGroupName;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;

  backgroundMaterialGroupName = self->_backgroundMaterialGroupName;
  if (!backgroundMaterialGroupName)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("context-menu-background-%@"), v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->_backgroundMaterialGroupName;
    self->_backgroundMaterialGroupName = v7;

    backgroundMaterialGroupName = self->_backgroundMaterialGroupName;
  }
  return backgroundMaterialGroupName;
}

- (double)_clampedCornerRadius
{
  void *v3;
  double v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;

  -[_UIContextMenuListView _platformMetrics](self, "_platformMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "menuCornerRadius");
  v5 = v4;

  -[UIView bounds](self, "bounds");
  return _UIClampedCornerRadius(15, v5, v6, v7, v8, v9);
}

- (id)_platformMetrics
{
  void *v2;
  void *v3;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v2, "userInterfaceIdiom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateContentMargins
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  int v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;

  -[_UIContextMenuListView displayedMenu](self, "displayedMenu");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "metadata");

  v5 = (v4 >> 8) & 1;
  if ((v4 & 0x10000) != 0 || -[_UIContextMenuListView position](self, "position") == 1)
  {
    v6 = -[_UIContextMenuListView parentHierarchyStyle](self, "parentHierarchyStyle");
    v7 = v6 != 1;
    if (v6 == 1)
      LODWORD(v5) = 1;
  }
  else
  {
    v7 = 0;
  }
  -[UIView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  _UIContextMenuGetPlatformMetrics(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "menuItemInternalPadding");
  v48 = v12;
  v49 = v11;
  v14 = v13;
  v16 = v15;

  _UIContextMenuGetPlatformMetrics(v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "headerPadding");
  v46 = v19;
  v47 = v18;
  v21 = v20;
  v23 = v22;

  _UIContextMenuGetPlatformMetrics(v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "menuTitlePadding");
  v45 = v25;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  if ((_DWORD)v5)
  {
    -[UIView traitCollection](self, "traitCollection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    _UIContextMenuGetPlatformMetrics(objc_msgSend(v32, "userInterfaceIdiom"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "titleFont");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v32);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    _UIContextMenuGetPlatformMetrics(v9);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "leadingIndentationWidth");
    v38 = v37;

    objc_msgSend(v35, "_scaledValueForValue:", v38);
    UIRoundToViewScale(self);
    v14 = v14 + v39;

  }
  if (v7)
  {
    _UIContextMenuGetPlatformMetrics(v9);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "menuGutterWidth");
    v42 = v41;

    v16 = v16 + v42;
  }
  -[_UIContextMenuListView _platformMetrics](self, "_platformMetrics");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "alignMenuHeaderAndItemContents");

  if (v44)
  {
    v31 = v16;
    v27 = v14;
    v23 = v16;
    v21 = v14;
  }
  -[_UIContextMenuListView setContentMargins:](self, "setContentMargins:", v49, v14, v48, v16);
  -[_UIContextMenuListView setHeaderMargins:](self, "setHeaderMargins:", v47, v21, v46, v23);
  -[_UIContextMenuListView setMenuTitleMargins:](self, "setMenuTitleMargins:", v45, v27, v29, v31);
}

- (void)_updatePlatterHairline
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  double v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[_UIContextMenuListView _platformMetrics](self, "_platformMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gradientMaskingConfiguration");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v15;
  if (v15)
  {
    objc_msgSend(v15, "platterHairlineColorProvider");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v8 = 1.0;
    else
      v8 = 0.0;
    v9 = objc_retainAutorelease(v7);
    v10 = objc_msgSend(v9, "CGColor");
    -[_UIContextMenuListView borderView](self, "borderView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBorderColor:", v10);

    -[_UIContextMenuListView borderView](self, "borderView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBorderWidth:", v8);

    v4 = v15;
  }

}

- (void)_setupCellPortalingIfNeeded
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *portals;
  UIView *v7;
  UIView *portalContainerView;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[_UIContextMenuListView _platformMetrics](self, "_platformMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gradientMaskingConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_portalingFocusedView = v4 != 0;

  if (-[_UIContextMenuListView portalingFocusedView](self, "portalingFocusedView"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    portals = self->_portals;
    self->_portals = v5;

    v7 = objc_alloc_init(UIView);
    portalContainerView = self->_portalContainerView;
    self->_portalContainerView = v7;

    -[UIView addSubview:](self, "addSubview:", self->_portalContainerView);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[_UIContextMenuListView outgoingCollectionView](self, "outgoingCollectionView", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "visibleCells");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          -[_UIContextMenuListView _updateCellPortalingWithCell:](self, "_updateCellPortalingWithCell:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

    -[_UIContextMenuListView clippingView](self, "clippingView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setClipsToBounds:", 1);

  }
}

- (void)_tearDownCellPortalingIfNeeded
{
  void *v3;

  if (-[_UIContextMenuListView portalingFocusedView](self, "portalingFocusedView"))
  {
    -[_UIContextMenuListView setPortalingFocusedView:](self, "setPortalingFocusedView:", 0);
    -[_UIContextMenuListView clippingView](self, "clippingView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClipsToBounds:", 0);

    -[_UIContextMenuListView _removeAllPortals](self, "_removeAllPortals");
  }
}

- (void)_updateCellPortalingWithCell:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_UIContextMenuListView portalingFocusedView](self, "portalingFocusedView")
    && objc_msgSend(v4, "isFocused"))
  {
    -[_UIContextMenuListView _portalCellIfNeeded:](self, "_portalCellIfNeeded:", v4);
  }

}

- (void)_updateCellPortalingWithUpdateFocusInContext:(id)a3 inCollectionView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (-[_UIContextMenuListView portalingFocusedView](self, "portalingFocusedView"))
  {
    objc_msgSend(v9, "nextFocusedIndexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "cellForItemAtIndexPath:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuListView _portalCellIfNeeded:](self, "_portalCellIfNeeded:", v8);

    }
  }

}

- (void)_portalCellIfNeeded:(id)a3
{
  id v4;
  _UIPortalView *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[_UIContextMenuListView portals](self, "portals", 0);
  v5 = (_UIPortalView *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UIPortalView countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v9), "sourceView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqual:", v4);

      if ((v11 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = -[_UIPortalView countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    v5 = -[_UIPortalView initWithSourceView:]([_UIPortalView alloc], "initWithSourceView:", v4);
    -[_UIPortalView setHidesSourceView:](v5, "setHidesSourceView:", 1);
    -[_UIPortalView setMatchesPosition:](v5, "setMatchesPosition:", 1);
    -[_UIPortalView setMatchesTransform:](v5, "setMatchesTransform:", 1);
    -[_UIPortalView setMatchesAlpha:](v5, "setMatchesAlpha:", 1);
    -[_UIPortalView setAllowsHitTesting:](v5, "setAllowsHitTesting:", 0);
    objc_msgSend(v4, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "flipsHorizontalAxis");
    -[_UIPortalView portalLayer](v5, "portalLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFlipsHorizontalAxis:", v13);

    -[_UIContextMenuListView portals](self, "portals");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v5);

    -[_UIContextMenuListView portalContainerView](self, "portalContainerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v5);

  }
}

- (void)_removeAllPortals
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
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
  -[_UIContextMenuListView portals](self, "portals", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "removeFromSuperview");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[_UIContextMenuListView portals](self, "portals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UIMenu)displayedMenu
{
  return self->_displayedMenu;
}

- (unint64_t)parentHierarchyStyle
{
  return self->_parentHierarchyStyle;
}

- (void)setParentHierarchyStyle:(unint64_t)a3
{
  self->_parentHierarchyStyle = a3;
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

- (BOOL)reversesActionOrder
{
  return self->_reversesActionOrder;
}

- (BOOL)emphasized
{
  return self->_emphasized;
}

- (BOOL)allowsFocus
{
  return self->_allowsFocus;
}

- (BOOL)allowsBackgroundViewInteraction
{
  return self->_allowsBackgroundViewInteraction;
}

- (void)setAllowsBackgroundViewInteraction:(BOOL)a3
{
  self->_allowsBackgroundViewInteraction = a3;
}

- (NSIndexPath)highlightedIndexPath
{
  return self->_highlightedIndexPath;
}

- (void)setHighlightedIndexPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (unint64_t)roundedEdges
{
  return self->_roundedEdges;
}

- (double)shadowAlpha
{
  return self->_shadowAlpha;
}

- (double)collectionViewAlpha
{
  return self->_collectionViewAlpha;
}

- (CGSize)nativeContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_nativeContentSize.width;
  height = self->_nativeContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setNativeContentSize:(CGSize)a3
{
  self->_nativeContentSize = a3;
}

- (CGSize)visibleContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_visibleContentSize.width;
  height = self->_visibleContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (_UICutoutShadowView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (UIView)clippingView
{
  return self->_clippingView;
}

- (void)setClippingView:(id)a3
{
  objc_storeStrong((id *)&self->_clippingView, a3);
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UICollectionViewDiffableDataSource)collectionViewDataSource
{
  return self->_collectionViewDataSource;
}

- (void)setCollectionViewDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewDataSource, a3);
}

- (UICollectionView)outgoingCollectionView
{
  return self->_outgoingCollectionView;
}

- (void)setOutgoingCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_outgoingCollectionView, a3);
}

- (UICollectionViewDiffableDataSource)outgoingCollectionViewDataSource
{
  return self->_outgoingCollectionViewDataSource;
}

- (void)setOutgoingCollectionViewDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_outgoingCollectionViewDataSource, a3);
}

- (double)emphasisAlphaMultiplier
{
  return self->_emphasisAlphaMultiplier;
}

- (void)setEmphasisAlphaMultiplier:(double)a3
{
  self->_emphasisAlphaMultiplier = a3;
}

- (BOOL)hasValidContentSize
{
  return self->_hasValidContentSize;
}

- (void)setHasValidContentSize:(BOOL)a3
{
  self->_hasValidContentSize = a3;
}

- (UIBezierPath)hoverZone
{
  return self->_hoverZone;
}

- (void)setHoverZone:(id)a3
{
  objc_storeStrong((id *)&self->_hoverZone, a3);
}

- (NSDirectionalEdgeInsets)contentMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_contentMargins.top;
  leading = self->_contentMargins.leading;
  bottom = self->_contentMargins.bottom;
  trailing = self->_contentMargins.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setContentMargins:(NSDirectionalEdgeInsets)a3
{
  self->_contentMargins = a3;
}

- (NSDirectionalEdgeInsets)headerMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_headerMargins.top;
  leading = self->_headerMargins.leading;
  bottom = self->_headerMargins.bottom;
  trailing = self->_headerMargins.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setHeaderMargins:(NSDirectionalEdgeInsets)a3
{
  self->_headerMargins = a3;
}

- (NSDirectionalEdgeInsets)menuTitleMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_menuTitleMargins.top;
  leading = self->_menuTitleMargins.leading;
  bottom = self->_menuTitleMargins.bottom;
  trailing = self->_menuTitleMargins.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setMenuTitleMargins:(NSDirectionalEdgeInsets)a3
{
  self->_menuTitleMargins = a3;
}

- (BOOL)portalingFocusedView
{
  return self->_portalingFocusedView;
}

- (void)setPortalingFocusedView:(BOOL)a3
{
  self->_portalingFocusedView = a3;
}

- (NSMutableArray)portals
{
  return self->_portals;
}

- (void)setPortals:(id)a3
{
  objc_storeStrong((id *)&self->_portals, a3);
}

- (UIView)portalContainerView
{
  return self->_portalContainerView;
}

- (void)setPortalContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_portalContainerView, a3);
}

- (UIView)cvBackgroundView
{
  return self->_cvBackgroundView;
}

- (void)setCvBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_cvBackgroundView, a3);
}

- (UIView)borderView
{
  return self->_borderView;
}

- (void)setBorderView:(id)a3
{
  objc_storeStrong((id *)&self->_borderView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_cvBackgroundView, 0);
  objc_storeStrong((id *)&self->_portalContainerView, 0);
  objc_storeStrong((id *)&self->_portals, 0);
  objc_storeStrong((id *)&self->_hoverZone, 0);
  objc_storeStrong((id *)&self->_outgoingCollectionViewDataSource, 0);
  objc_storeStrong((id *)&self->_outgoingCollectionView, 0);
  objc_storeStrong((id *)&self->_collectionViewDataSource, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_highlightedIndexPath, 0);
  objc_storeStrong((id *)&self->_displayedMenu, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialGroupName, 0);
}

@end
