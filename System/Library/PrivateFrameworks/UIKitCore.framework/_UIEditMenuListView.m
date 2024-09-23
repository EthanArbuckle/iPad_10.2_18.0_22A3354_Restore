@implementation _UIEditMenuListView

+ (double)minimumRequiredWidthForArrowInRoundedListViewForAxis:(int64_t)a3 traitCollection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v5 = a4;
  _UIEditMenuGetPlatformMetrics(objc_msgSend(v5, "userInterfaceIdiom"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3)
    objc_msgSend(v6, "verticalMenuCornerRadius");
  else
    objc_msgSend(v6, "horizontalMenuCornerRadius");
  v9 = v8 * 1.528665;
  v10 = _UIEditMenuScaledArrowSize(v5);
  v11 = v5;
  _UIEditMenuGetPlatformMetrics(objc_msgSend(v11, "userInterfaceIdiom"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrowSideRadius");
  v14 = v13;
  v15 = v11;
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleSubhead"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_scaledValueForValue:useLanguageAwareScaling:", 0, v14);
  v18 = v17;
  objc_msgSend(v15, "displayScale");
  v20 = v19;

  UIRoundToScale(v18, fmax(v20, 1.0));
  v22 = v21;

  return ceil(v10 * 0.5 + v9 + v22);
}

- (_UIEditMenuListView)initWithDelegate:(id)a3 menu:(id)a4 titleView:(id)a5
{
  id v9;
  unint64_t v10;
  unint64_t v11;
  _UIEditMenuListView *v12;
  void *v13;
  void *v15;
  objc_super v16;

  v9 = a3;
  v10 = (unint64_t)a4;
  v11 = (unint64_t)a5;
  v16.receiver = self;
  v16.super_class = (Class)_UIEditMenuListView;
  v12 = -[UIView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v12)
  {
    if (!(v10 | v11))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("_UIEditMenuListView.m"), 124, CFSTR("Cannot present an edit menu without a valid menu"));

    }
    objc_storeWeak((id *)&v12->_delegate, v9);
    objc_storeStrong((id *)&v12->_displayedMenu, a4);
    objc_storeStrong((id *)&v12->_titleView, a5);
    v12->_arrowDirection = 2;
    v12->_largestPageWidth = 0.0;
    -[_UIEditMenuListView _createViewHierarchy](v12, "_createViewHierarchy");
    -[_UIEditMenuListView _createDataSource](v12, "_createDataSource");
    -[UIView layer](v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAllowsGroupOpacity:", 0);

    -[UIView _setDisableDictationTouchCancellation:](v12, "_setDisableDictationTouchCancellation:", 1);
  }

  return v12;
}

- (void)reloadWithMenu:(id)a3 titleView:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  UIMenu *v8;
  UIView *titleView;
  UIMenu *displayedMenu;
  UIMenu *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a5;
  v8 = (UIMenu *)a3;
  v16 = a4;
  titleView = self->_titleView;
  if (titleView)
    -[UIView removeFromSuperview](titleView, "removeFromSuperview");
  displayedMenu = self->_displayedMenu;
  self->_displayedMenu = v8;
  v11 = v8;

  objc_storeStrong((id *)&self->_titleView, a4);
  -[_UIEditMenuListView titleContainerView](self, "titleContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", v16 == 0);

  v13 = v11 == 0;
  -[_UIEditMenuListView titleSeparatorView](self, "titleSeparatorView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", v13);

  if (self->_titleView)
  {
    -[_UIEditMenuListView titleContainerView](self, "titleContainerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v16);

  }
  -[_UIEditMenuListView _reloadMenuAnimated:](self, "_reloadMenuAnimated:", v5);

}

- (BOOL)_hasDisplayedMenu
{
  void *v2;
  unint64_t v3;

  -[_UIEditMenuListView displayedMenu](self, "displayedMenu");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "metadata") >> 24) & 1;

  return v3;
}

- (CGSize)_titleViewSizeForFittingWidth:(double)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[_UIEditMenuListView titleView](self, "titleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemLayoutSizeFittingSize:", a3, 1.79769313e308);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)intrinsicContentSizeForContainer:(id)a3 containerSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  if (-[_UIEditMenuListView axis](self, "axis"))
  {
    -[_UIEditMenuListView _intrinsicVerticalContentSizeForContainer:containerSize:](self, "_intrinsicVerticalContentSizeForContainer:containerSize:", v7, width, height);
    v9 = v8;
    v11 = v10;
  }
  else
  {
    objc_msgSend(v7, "traitCollection");
    v12 = objc_claimAutoreleasedReturnValue();

    -[_UIEditMenuListView _intrinsicHorizontalContentSizeForTraitCollection:containerSize:](self, "_intrinsicHorizontalContentSizeForTraitCollection:containerSize:", v12, width, height);
    v9 = v13;
    v11 = v14;
    v7 = (id)v12;
  }

  v15 = v9;
  v16 = v11;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)_intrinsicHorizontalContentSizeForTraitCollection:(id)a3 containerSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double largestPageWidth;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  _UIEditMenuGetPlatformMetrics(objc_msgSend(v7, "userInterfaceIdiom"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIEditMenuListView _hasDisplayedMenu](self, "_hasDisplayedMenu"))
  {
    +[_UIEditMenuListItem itemWithTitle:](_UIEditMenuListItem, "itemWithTitle:", CFSTR(" "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIEditMenuListViewCell layoutSizeForItem:traitCollection:containerSize:](_UIEditMenuListViewCell, "layoutSizeForItem:traitCollection:containerSize:", v9, v7, width, height);
    v11 = v10;
    objc_msgSend(v8, "horizontalMenuMaximumWidth");
    width = fmin(width, v12);
    if (-[_UIEditMenuListView _isPaginationDirtyForContainerSize:](self, "_isPaginationDirtyForContainerSize:", width, height))
    {
      -[_UIEditMenuListView _updatePaginationForSnapshot:containerSize:](self, "_updatePaginationForSnapshot:containerSize:", 0, width, height);
    }
    -[_UIEditMenuListView collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pages");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    largestPageWidth = self->_largestPageWidth;
    if (v15 >= 2)
    {
      -[_UIEditMenuListView leftButton](self, "leftButton");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sizeThatFits:", width, height);
      v19 = v18;

      largestPageWidth = largestPageWidth + fmin((double)(v15 - 1), 2.0) * v19;
    }

  }
  else
  {
    largestPageWidth = *MEMORY[0x1E0C9D820];
    v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  -[_UIEditMenuListView titleView](self, "titleView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v8, "horizontalMenuMaximumWidth");
    v22 = fmin(width, v21);
    if (-[_UIEditMenuListView _hasDisplayedMenu](self, "_hasDisplayedMenu"))
    {
      -[_UIEditMenuListView _titleViewSizeForFittingWidth:](self, "_titleViewSizeForFittingWidth:", fmin(v22, largestPageWidth));
      v11 = fmin(height, v11 + v23);
    }
    else
    {
      -[_UIEditMenuListView _titleViewSizeForFittingWidth:](self, "_titleViewSizeForFittingWidth:", v22);
      largestPageWidth = v24;
      v11 = v25;
    }
  }

  v26 = largestPageWidth;
  v27 = v11;
  result.height = v27;
  result.width = v26;
  return result;
}

- (CGSize)_intrinsicVerticalContentSizeForContainer:(id)a3 containerSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
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
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _BOOL4 v26;
  double v27;
  double v28;
  double v29;
  CGSize result;
  CGRect v31;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  objc_msgSend(v7, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _UIEditMenuGetPlatformMetrics(objc_msgSend(v8, "userInterfaceIdiom"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "verticalMenuMaximumHeight");
  v11 = fmin(height, v10);
  if (-[_UIEditMenuListView _hasDisplayedMenu](self, "_hasDisplayedMenu"))
  {
    -[_UIEditMenuListView _verticalMenuContentSizeFittingContainerSize:traits:](self, "_verticalMenuContentSizeFittingContainerSize:traits:", v8, width, v11);
    v13 = 250.0;
    if (v14 > 250.0)
    {
      if (objc_msgSend(v8, "userInterfaceIdiom"))
      {
        v15 = 343.0;
      }
      else
      {
        +[UIViewController _horizontalContentMarginForView:](UIViewController, "_horizontalContentMarginForView:", v7);
        v19 = v18;
        objc_msgSend(v7, "_screen");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_referenceBounds");
        v15 = CGRectGetWidth(v31) - (v19 + v19);

      }
      if (width >= v15)
        v13 = v15;
      else
        v13 = width;
      -[_UIEditMenuListView _verticalMenuContentSizeFittingContainerSize:traits:](self, "_verticalMenuContentSizeFittingContainerSize:traits:", v8, v13, v11);
    }
    v16 = fmin(v12, v11);
    v17 = v13;
  }
  else
  {
    v17 = *MEMORY[0x1E0C9D820];
    v16 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v12 = 0.0;
    v13 = 250.0;
  }
  self->_verticalContentHeight = v12;
  -[_UIEditMenuListView titleView](self, "titleView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[_UIEditMenuListView _titleViewSizeForFittingWidth:](self, "_titleViewSizeForFittingWidth:", v13);
    v23 = v22;
    v25 = v24;
    v26 = -[_UIEditMenuListView _hasDisplayedMenu](self, "_hasDisplayedMenu");
    v27 = fmin(v11, v16 + v25);
    if (v26)
      v16 = v27;
    else
      v16 = v25;
    if (!v26)
      v17 = v23;
  }

  v28 = v17;
  v29 = v16;
  result.height = v29;
  result.width = v28;
  return result;
}

- (CGSize)_verticalMenuContentSizeFittingContainerSize:(CGSize)a3 traits:(id)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v25 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v9 = *MEMORY[0x1E0C9D820];
  v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        +[_UIEditMenuListViewCell layoutSizeForItem:traitCollection:containerSize:](_UIEditMenuListViewCell, "layoutSizeForItem:traitCollection:containerSize:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15), v7, width, height);
        v9 = fmax(v9, v16);
        v8 = v8 + v17;
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  v18 = v9;
  v19 = v8;
  result.height = v19;
  result.width = v18;
  return result;
}

- (double)_minimumRequiredWidthForArrowInRoundedListViewForAxis:(int64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;

  v5 = (void *)objc_opt_class();
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minimumRequiredWidthForArrowInRoundedListViewForAxis:traitCollection:", a3, v6);
  v8 = v7;

  return v8;
}

- (CGSize)arrowSizeForDirection:(int64_t)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = _UIEditMenuScaledArrowSize(v4);
  v7 = v6;

  if ((unint64_t)(a3 - 3) >= 2)
    v8 = v5;
  else
    v8 = v7;
  if ((unint64_t)(a3 - 3) >= 2)
    v9 = v7;
  else
    v9 = v5;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)_createViewHierarchy
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  UIView *v7;
  void (**v8)(_QWORD, _QWORD);
  UIView *customBackgroundPlatterView;
  _UIEditMenuListView *v10;
  _UIEditMenuListView *v11;
  void *v12;
  UIVisualEffectView *v13;
  void *v14;
  UIVisualEffectView *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  UIView *v20;
  UIView *menuContainerView;
  _BOOL8 v22;
  void *v23;
  _UIEditMenuCollectionView *v24;
  double v25;
  void *v26;
  _UIEditMenuCollectionView *v27;
  void *v28;
  void *v29;
  void *v30;
  _UIEditMenuPageButton *v31;
  void *v32;
  _UIEditMenuPageButton *v33;
  _UIEditMenuPageButton *leftButton;
  void *v35;
  _UIEditMenuPageButton *v36;
  void *v37;
  _UIEditMenuPageButton *v38;
  _UIEditMenuPageButton *rightButton;
  void *v40;
  void *v41;
  void *v42;
  UIVisualEffectView *v43;
  void *v44;
  UIView *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  UIView *titleSeparatorView;
  UIView *v52;
  UIView *titleContainerView;
  void *v54;
  double v55;
  double v56;
  _UIDiffuseShadowView *v57;
  id v58;
  void *v59;
  double v60;
  double v61;
  id v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  _UIDiffuseShadowView *shadowView;
  _UIContinuousSelectionGestureRecognizer *v72;
  void *v73;
  UIHoverGestureRecognizer *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  _UIEditMenuListView *v80;
  void *v81;
  _QWORD v82[3];

  v82[2] = *MEMORY[0x1E0C80C00];
  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  _UIEditMenuGetPlatformMetrics(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menuBackgroundConfigurator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = v5;
  if (v6)
  {
    v7 = (UIView *)objc_opt_new();
    objc_msgSend(v5, "menuBackgroundConfigurator");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, UIView *))v8)[2](v8, v7);

    -[UIView addSubview:](self, "addSubview:", v7);
    customBackgroundPlatterView = self->_customBackgroundPlatterView;
    self->_customBackgroundPlatterView = v7;

  }
  v10 = (_UIEditMenuListView *)self->_customBackgroundPlatterView;
  if (!v10)
    v10 = self;
  v11 = v10;
  _UIEditMenuGetPlatformMetrics(v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [UIVisualEffectView alloc];
  objc_msgSend(v12, "menuBackgroundEffect");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[UIVisualEffectView initWithEffect:](v13, "initWithEffect:", v14);

  -[_UIEditMenuListView backgroundMaterialGroupName](self, "backgroundMaterialGroupName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView _setGroupName:](v15, "_setGroupName:", v16);

  v80 = v11;
  -[UIView addSubview:](v11, "addSubview:", v15);
  objc_storeStrong((id *)&self->_backgroundView, v15);
  v17 = (void *)objc_opt_new();
  +[UIColor blackColor](UIColor, "blackColor");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v17, "setFillColor:", objc_msgSend(v18, "CGColor"));

  -[UIView layer](v15, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setMask:", v17);

  v78 = v17;
  objc_storeStrong((id *)&self->_maskLayer, v17);
  v20 = (UIView *)objc_opt_new();
  menuContainerView = self->_menuContainerView;
  self->_menuContainerView = v20;

  v22 = 1;
  -[UIView setClipsToBounds:](self->_menuContainerView, "setClipsToBounds:", 1);
  -[UIVisualEffectView contentView](v15, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", self->_menuContainerView);

  v24 = [_UIEditMenuCollectionView alloc];
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  _UIEditMenuViewHorizontalCompositionalLayout(v4, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[UICollectionView initWithFrame:collectionViewLayout:](v24, "initWithFrame:collectionViewLayout:", v26, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  -[UICollectionView setDelegate:](v27, "setDelegate:", self);
  -[UICollectionView setBackgroundColor:](v27, "setBackgroundColor:", 0);
  -[UIScrollView setShowsVerticalScrollIndicator:](v27, "setShowsVerticalScrollIndicator:", 0);
  -[UIScrollView setShowsHorizontalScrollIndicator:](v27, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView setPagingEnabled:](v27, "setPagingEnabled:", 1);
  -[UICollectionView setAllowsSelection:](v27, "setAllowsSelection:", 0);
  -[UIView layer](v27, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setAllowsGroupOpacity:", 0);

  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v27, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("_UIEditMenuListViewCell"));
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v27, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("_UIEditMenuListViewSeparator"), CFSTR("_UIEditMenuListViewSeparator"));
  -[UIView addSubview:](self->_menuContainerView, "addSubview:", v27);
  objc_storeStrong((id *)&self->_collectionView, v27);
  -[UIVisualEffectView contentView](v15, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView panGestureRecognizer](v27, "panGestureRecognizer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addGestureRecognizer:", v30);

  v31 = [_UIEditMenuPageButton alloc];
  -[_UIEditMenuListView backgroundMaterialGroupName](self, "backgroundMaterialGroupName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[_UIEditMenuPageButton initWithDirection:backgroundGroupName:](v31, "initWithDirection:backgroundGroupName:", 0, v32);
  leftButton = self->_leftButton;
  self->_leftButton = v33;

  -[UIControl addTarget:action:forControlEvents:](self->_leftButton, "addTarget:action:forControlEvents:", self, sel__didTapLeftDirectionalButton_, 0x2000);
  -[UIVisualEffectView contentView](v15, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addSubview:", self->_leftButton);

  v36 = [_UIEditMenuPageButton alloc];
  -[_UIEditMenuListView backgroundMaterialGroupName](self, "backgroundMaterialGroupName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[_UIEditMenuPageButton initWithDirection:backgroundGroupName:](v36, "initWithDirection:backgroundGroupName:", 1, v37);
  rightButton = self->_rightButton;
  self->_rightButton = v38;

  -[UIControl addTarget:action:forControlEvents:](self->_rightButton, "addTarget:action:forControlEvents:", self, sel__didTapRightDirectionalButton_, 0x2000);
  -[UIVisualEffectView contentView](v15, "contentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addSubview:", self->_rightButton);

  -[UIView traitCollection](self, "traitCollection");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  _UIEditMenuGetPlatformMetrics(objc_msgSend(v41, "userInterfaceIdiom"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = [UIVisualEffectView alloc];
  objc_msgSend(v42, "separatorEffect");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[UIVisualEffectView initWithEffect:](v43, "initWithEffect:", v44);

  objc_msgSend(v42, "separatorEffectColor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView contentView](v45, "contentView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setBackgroundColor:", v46);

  -[UIView contentView](v45, "contentView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "layer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setAllowsEdgeAntialiasing:", 1);

  -[UIView contentView](v45, "contentView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setClipsToBounds:", 0);

  titleSeparatorView = self->_titleSeparatorView;
  self->_titleSeparatorView = v45;

  if (self->_titleView)
    v22 = self->_displayedMenu == 0;
  -[UIView setHidden:](self->_titleSeparatorView, "setHidden:", v22, v78);
  v52 = (UIView *)objc_opt_new();
  titleContainerView = self->_titleContainerView;
  self->_titleContainerView = v52;

  -[UIView addSubview:](self->_titleContainerView, "addSubview:", self->_titleSeparatorView);
  -[UIVisualEffectView contentView](v15, "contentView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addSubview:", self->_titleContainerView);

  if (self->_titleView)
    -[UIView addSubview:](self->_titleContainerView, "addSubview:");
  objc_msgSend(v81, "shadowOpacity");
  if (v55 > 0.0)
  {
    v56 = v55;
    v57 = objc_alloc_init(_UIDiffuseShadowView);
    -[UIView traitCollection](self, "traitCollection");
    v58 = (id)objc_claimAutoreleasedReturnValue();
    _UIEditMenuGetPlatformMetrics(objc_msgSend(v58, "userInterfaceIdiom"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "shadowRadius");
    v61 = v60;
    v62 = v58;
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleSubhead"), v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "_scaledValueForValue:useLanguageAwareScaling:", 0, v61);
    v65 = v64;
    objc_msgSend(v62, "displayScale");
    v67 = v66;

    UIRoundToScale(v65, fmax(v67, 1.0));
    v69 = v68;

    -[_UIDiffuseShadowView setRadius:](v57, "setRadius:", v69);
    -[UIView traitCollection](self, "traitCollection");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDiffuseShadowView setOffset:](v57, "setOffset:", _UIEditMenuScaledShadowOffset(v70));

    -[_UIDiffuseShadowView setIntensity:](v57, "setIntensity:", v56);
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v57, 0);
    shadowView = self->_shadowView;
    self->_shadowView = v57;

  }
  -[_UIEditMenuListView _updateArrowEdgeInsets](self, "_updateArrowEdgeInsets");
  v72 = -[UIGestureRecognizer initWithTarget:action:]([_UIContinuousSelectionGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleSelectionGesture_);
  -[UIGestureRecognizer setCancelsTouchesInView:](v72, "setCancelsTouchesInView:", 0);
  -[UIGestureRecognizer setDelegate:](v72, "setDelegate:", self);
  -[UIVisualEffectView contentView](v15, "contentView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "addGestureRecognizer:", v72);

  objc_storeStrong((id *)&self->_selectionGestureRecognizer, v72);
  v74 = -[UIHoverGestureRecognizer initWithTarget:action:]([UIHoverGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleHoverGesture_);
  -[UIGestureRecognizer setDelegate:](v74, "setDelegate:", self);
  -[UIVisualEffectView contentView](v15, "contentView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "addGestureRecognizer:", v74);

  objc_storeStrong((id *)&self->_hoverGestureRecognizer, v74);
  v82[0] = objc_opt_class();
  v82[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 2);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = -[UIView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v76, sel__contentSizeCategoryDidChange);

}

- (void)setAxis:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  UICollectionViewCompositionalLayout *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
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
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  if (self->_axis != a3)
  {
    self->_axis = a3;
    -[UIView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    -[_UIEditMenuListView collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == 1)
    {
      _UIEditMenuGetPlatformMetrics(v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "verticalMenuCornerRadius");
      v15 = v14;
      -[UIView _currentScreenScale](self, "_currentScreenScale");
      v17 = 1.0 / v16;
      objc_msgSend(off_1E1679980, "fractionalWidthDimension:", 1.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(off_1E1679980, "absoluteDimension:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(off_1E1679968, "layoutAnchorWithEdges:", 1);
      v21 = objc_claimAutoreleasedReturnValue();
      _UIEditMenuGetPlatformMetrics(v6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v18) = objc_msgSend(v22, "showsSeparatorBetweenItems");

      v39 = (void *)v21;
      v40 = v13;
      if ((_DWORD)v18)
      {
        objc_msgSend(off_1E16799B8, "supplementaryItemWithLayoutSize:elementKind:containerAnchor:", v20, CFSTR("_UIEditMenuListViewSeparator"), v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setZIndex:", -1);
        v42[0] = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v24 = (void *)MEMORY[0x1E0C9AA60];
      }
      v8 = v15 * 0.5;
      objc_msgSend(off_1E1679980, "fractionalWidthDimension:", 1.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(off_1E1679980, "estimatedDimension:", 44.0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(off_1E1679998, "itemWithLayoutSize:supplementaryItems:", v27, v24);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v28;
      v11 = 1;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(off_1E1679990, "horizontalGroupWithLayoutSize:subitems:", v27, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(off_1E16799A0, "sectionWithGroup:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setContentInsetsReference:", 1);
      v32 = (void *)objc_opt_new();
      objc_msgSend(v32, "setScrollDirection:", 0);
      objc_msgSend(v32, "setContentInsetsReference:", 1);
      v10 = -[UICollectionViewCompositionalLayout initWithSection:configuration:]([UICollectionViewCompositionalLayout alloc], "initWithSection:configuration:", v31, v32);

      v12 = 0;
    }
    else
    {
      v8 = 0.0;
      if (a3)
      {
        v10 = 0;
        v12 = 0;
        v11 = 0;
      }
      else
      {
        -[UIView _currentScreenScale](self, "_currentScreenScale");
        _UIEditMenuViewHorizontalCompositionalLayout(v6, v9);
        v10 = (UICollectionViewCompositionalLayout *)objc_claimAutoreleasedReturnValue();
        v11 = 0;
        v12 = 1;
      }
    }
    -[_UIEditMenuListView rightButton](self, "rightButton");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setHidden:", v11);

    -[_UIEditMenuListView leftButton](self, "leftButton");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setHidden:", v11);

    objc_msgSend(v7, "setPagingEnabled:", v12);
    objc_msgSend(v7, "setShowsVerticalScrollIndicator:", v11);
    objc_msgSend(v7, "setVerticalScrollIndicatorInsets:", v8, 0.0, v8, 0.0);
    objc_msgSend(v7, "setCollectionViewLayout:", v10);
    objc_msgSend(v7, "setContentInset:", 0.0, 0.0, 0.0, 0.0);
    -[_UIEditMenuListView _setNeedsPaginationUpdate](self, "_setNeedsPaginationUpdate");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[_UIEditMenuListView dataSource](self, "dataSource");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "snapshot");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "sectionIdentifiers");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "reloadSectionsWithIdentifiers:", v37);

    -[_UIEditMenuListView dataSource](self, "dataSource");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "applySnapshotUsingReloadData:", v36);

    objc_msgSend(v7, "resetTargetPage");
    -[_UIEditMenuListView _updateArrowEdgeInsets](self, "_updateArrowEdgeInsets");

  }
}

- (void)_createDataSource
{
  UICollectionViewDiffableDataSource *v3;
  _UIEditMenuCollectionView *collectionView;
  UICollectionViewDiffableDataSource *v5;
  UICollectionViewDiffableDataSource *dataSource;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t, void *, void *, void *);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v3 = [UICollectionViewDiffableDataSource alloc];
  collectionView = self->_collectionView;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __40___UIEditMenuListView__createDataSource__block_invoke;
  v10 = &unk_1E16C6CA8;
  objc_copyWeak(&v11, &location);
  v5 = -[UICollectionViewDiffableDataSource initWithCollectionView:cellProvider:](v3, "initWithCollectionView:cellProvider:", collectionView, &v7);
  dataSource = self->_dataSource;
  self->_dataSource = v5;

  -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](self->_dataSource, "setSupplementaryViewProvider:", &__block_literal_global_210, v7, v8, v9, v10);
  -[_UIEditMenuListView _reloadMenuAnimated:](self, "_reloadMenuAnimated:", 0);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_reloadMenuAnimated:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  UICollectionViewDiffableDataSource *dataSource;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  _QWORD v34[2];

  v3 = a3;
  v34[1] = *MEMORY[0x1E0C80C00];
  -[_UIEditMenuListView _minimumRequiredWidthForArrowInRoundedListViewForAxis:](self, "_minimumRequiredWidthForArrowInRoundedListViewForAxis:", 0);
  v6 = v5;
  -[_UIEditMenuListView displayedMenu](self, "displayedMenu");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_UIEditMenuListView _hasPasteAuthentication](self, "_hasPasteAuthentication");
  v9 = v7;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendSectionsWithIdentifiers:", v12);

  if (v9)
  {
    _UIEditMenuAppendMenuToSnapshot(v9, v10, v8);
    objc_msgSend(v10, "itemIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14 == 1)
    {
      objc_msgSend(v10, "itemIdentifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setOverrideMinimumWidth:", v6 + v6);
    }
  }

  -[UIView window](self, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17 && v3)
  {
    -[UIView bounds](self, "bounds");
    -[_UIEditMenuListView _updatePaginationForSnapshot:containerSize:](self, "_updatePaginationForSnapshot:containerSize:", v10, v18, v19);
    if (-[_UIEditMenuListView hasShadow](self, "hasShadow"))
    {
      -[_UIEditMenuListView shadowView](self, "shadowView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "layer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      __43___UIEditMenuListView__reloadMenuAnimated___block_invoke((uint64_t)CFSTR("shadowPath"), objc_msgSend(v21, "shadowPath"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addAnimation:forKey:](self, "addAnimation:forKey:", v22, CFSTR("shadowPath"));

    }
    -[_UIEditMenuListView maskLayer](self, "maskLayer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIEditMenuListView maskLayer](self, "maskLayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    __43___UIEditMenuListView__reloadMenuAnimated___block_invoke((uint64_t)CFSTR("path"), objc_msgSend(v24, "path"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addAnimation:forKey:", v25, CFSTR("path"));

    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __43___UIEditMenuListView__reloadMenuAnimated___block_invoke_2;
    v33[3] = &unk_1E16B1B28;
    v33[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v33, 0, 0.25, 0.0);
  }
  else
  {
    -[_UIEditMenuListView _setNeedsPaginationUpdate](self, "_setNeedsPaginationUpdate");
  }
  dataSource = self->_dataSource;
  if (v3)
    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](dataSource, "applySnapshot:animatingDifferences:", v10, 1);
  else
    -[UICollectionViewDiffableDataSource applySnapshotUsingReloadData:](dataSource, "applySnapshotUsingReloadData:", v10);
  -[_UIEditMenuListView collectionView](self, "collectionView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "pages");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");

  if (v29)
  {
    -[_UIEditMenuListView collectionView](self, "collectionView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "scrollToTargetPageAnimated:", 0);

  }
  -[_UIEditMenuListView displayedMenu](self, "displayedMenu");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "accessibilityIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v32);

}

- (BOOL)_hasPasteAuthentication
{
  _UIEditMenuListView *v2;
  void *v3;

  v2 = self;
  -[_UIEditMenuListView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "wantsPasteTouchAuthenticationInEditMenuListView:", v2);

  return (char)v2;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  if (!CGRectEqualToRect(v9, v10) && !-[_UIEditMenuListView axis](self, "axis"))
    -[_UIEditMenuListView _setNeedsPaginationUpdate](self, "_setNeedsPaginationUpdate");
  v8.receiver = self;
  v8.super_class = (Class)_UIEditMenuListView;
  -[UIView setBounds:](&v8, sel_setBounds_, x, y, width, height);
}

- (void)_contentSizeCategoryDidChange
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;

  -[_UIEditMenuListView _setNeedsPaginationUpdate](self, "_setNeedsPaginationUpdate");
  -[_UIEditMenuListView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSizeCategoryDidChangeInEditMenuListView:", self);

  -[UIView traitCollection](self, "traitCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _UIEditMenuGetPlatformMetrics(objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shadowRadius");
  v7 = v6;
  v8 = v4;
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleSubhead"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_scaledValueForValue:useLanguageAwareScaling:", 0, v7);
  v11 = v10;
  objc_msgSend(v8, "displayScale");
  v13 = v12;

  UIRoundToScale(v11, fmax(v13, 1.0));
  v15 = v14;

  -[_UIDiffuseShadowView setRadius:](self->_shadowView, "setRadius:", v15);
  -[UIView traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDiffuseShadowView setOffset:](self->_shadowView, "setOffset:", _UIEditMenuScaledShadowOffset(v16));

  -[_UIEditMenuListView _updateArrowEdgeInsets](self, "_updateArrowEdgeInsets");
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  void *v13;
  int64_t v14;
  int v15;
  int64_t v16;
  int64_t v17;
  int64_t v18;
  unint64_t v19;
  _BOOL4 v20;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  int64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGSize v45;
  void *v46;
  double v47;
  CGFloat v48;
  double v49;
  double v50;
  CGRectEdge v51;
  CGFloat v52;
  unint64_t v53;
  double v54;
  int64_t v55;
  double v56;
  double v57;
  double v58;
  double width;
  double v60;
  double MinY;
  double v62;
  double v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double height;
  double v77;
  double y;
  double x;
  double v80;
  double v81;
  double v82;
  double MinX;
  double MaxX;
  double v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  double v90;
  double v91;
  void *v92;
  double v93;
  CGFloat v94;
  double v95;
  CGFloat v96;
  void *v97;
  double v98;
  void *v99;
  int64_t v100;
  CGFloat v101;
  CGFloat v102;
  CGFloat v103;
  CGFloat v104;
  double MaxY;
  double v106;
  void *v107;
  double v108;
  void *v109;
  double v110;
  CGFloat v111;
  double v112;
  void *v113;
  BOOL IsEmpty;
  double v115;
  double v116;
  void *v117;
  int64_t v118;
  int64_t v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  void *v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  void *v138;
  void *v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  void *v148;
  double verticalContentHeight;
  void *v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double largestPageWidth;
  double v161;
  double v162;
  double rect;
  double v164;
  double v165;
  double r2;
  double r2a;
  CGRect slice;
  CGRect remainder;
  objc_super v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;

  v170.receiver = self;
  v170.super_class = (Class)_UIEditMenuListView;
  -[UIView layoutSubviews](&v170, sel_layoutSubviews);
  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIEditMenuGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  remainder.origin.x = v5;
  remainder.origin.y = v7;
  remainder.size.width = v9;
  remainder.size.height = v11;
  -[_UIEditMenuListView shadowView](self, "shadowView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  if (-[_UIEditMenuListView _isPaginationDirtyForContainerSize:](self, "_isPaginationDirtyForContainerSize:", v10, v12))
    -[_UIEditMenuListView _updatePaginationForSnapshot:containerSize:](self, "_updatePaginationForSnapshot:containerSize:", 0, v10, v12);
  v14 = -[_UIEditMenuListView axis](self, "axis");
  v15 = *((_DWORD *)&self->super._viewFlags + 4);
  v16 = -[_UIEditMenuListView arrowDirection](self, "arrowDirection");
  v17 = -[_UIEditMenuListView arrowDirection](self, "arrowDirection");
  v18 = -[_UIEditMenuListView axis](self, "axis");
  v19 = v17 - 5;
  v20 = !v18 && v19 > 0xFFFFFFFFFFFFFFFDLL || v18 == 1 && v19 < 0xFFFFFFFFFFFFFFFELL;
  -[UIView layer](self, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "anchorPoint");

  -[UIView center](self, "center");
  v24 = v23;
  v26 = v25;
  -[UIView superview](self, "superview");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", v27, v24, v26);
  v154 = v28;

  -[_UIEditMenuListView _minimumRequiredWidthForArrowInRoundedListViewForAxis:](self, "_minimumRequiredWidthForArrowInRoundedListViewForAxis:", -[_UIEditMenuListView axis](self, "axis"));
  v153 = v29;
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  v31 = v30;
  v32 = 1.0;
  -[_UIEditMenuListView leftButton](self, "leftButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "sizeThatFits:", v10, v12);
  v156 = v34;

  -[UIView traitCollection](self, "traitCollection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  _UIEditMenuScaledArrowSize(v35);
  v37 = v36;

  v38 = -[_UIEditMenuListView arrowDirection](self, "arrowDirection");
  v39 = 0.0;
  if (v38 == 1)
    v40 = v37;
  else
    v40 = 0.0;
  if (v38 == 1)
    v41 = 0.0;
  else
    v41 = v37;
  if (v38 == 3)
    v42 = v37;
  else
    v42 = 0.0;
  if (v38 == 3)
  {
    v40 = 0.0;
    v41 = 0.0;
  }
  if (v38 == 4)
    v42 = 0.0;
  v164 = v42;
  if (v38 == 4)
    v43 = 0.0;
  else
    v43 = v40;
  if (v38 == 4)
    v44 = 0.0;
  else
    v44 = v41;
  r2 = v44;
  v45 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v157 = v37;
  if (v38 == 4)
    v39 = v37;
  v159 = v39;
  slice.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  slice.size = v45;
  -[_UIEditMenuListView titleView](self, "titleView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    -[_UIEditMenuListView _titleViewSizeForFittingWidth:](self, "_titleViewSizeForFittingWidth:", v10);
    v48 = v47;
    v50 = v49;
    if (-[_UIEditMenuListView arrowDirection](self, "arrowDirection") == 1)
      v51 = CGRectMaxYEdge;
    else
      v51 = CGRectMinYEdge;
    v171.origin.x = v6;
    v171.origin.y = v8;
    v171.size.width = v10;
    v171.size.height = v12;
    v52 = v50;
    v32 = 1.0;
    CGRectDivide(v171, &slice, &remainder, v52, v51);
    slice.size.width = v48;
  }
  v53 = v16 - 3;
  v54 = v32 / v31;
  v155 = v32 / v31;
  if (v14)
  {
    v55 = -[_UIEditMenuListView axis](self, "axis");
    v56 = r2;
    if (v55 == 1)
      v57 = r2;
    else
      v57 = 0.0;
    if (v55 == 1)
      v58 = v43;
    else
      v58 = 0.0;
    width = remainder.size.width;
    v158 = 0.0;
    v60 = remainder.origin.x + 0.0;
    MinY = v58 + remainder.origin.y;
    rect = remainder.size.height - (v57 + v58);
    largestPageWidth = CGRectGetWidth(remainder);
    v151 = 0.0;
    v152 = 0.0;
    v62 = 0.0;
    v63 = 0.0;
  }
  else
  {
    -[_UIEditMenuListView collectionView](self, "collectionView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "pages");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "count") - 1;

    -[_UIEditMenuListView collectionView](self, "collectionView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "currentPage");
    v69 = v68;

    v60 = 0.0;
    v70 = fmax(fmin(v69, 1.0), 0.0);
    v71 = fmax(fmin((double)v66 - v69, 1.0), 0.0);
    if ((*(_QWORD *)&v15 & 0x80000) != 0)
      v72 = v71;
    else
      v72 = v70;
    if ((*(_QWORD *)&v15 & 0x80000) == 0)
      v70 = v71;
    v158 = (v156 - v54) * v72;
    v151 = v72;
    v152 = v70;
    v63 = -v158;
    v62 = -(v70 * (v156 - v54));
    -[_UIEditMenuListView _collectionViewWidthForPageProgress:](self, "_collectionViewWidthForPageProgress:", v69);
    width = v73;
    MinY = CGRectGetMinY(remainder);
    rect = CGRectGetHeight(remainder);
    largestPageWidth = self->_largestPageWidth;
    v56 = r2;
  }
  v74 = v60 + v63;
  v162 = MinY;
  r2a = MinY + 0.0;
  v75 = width - (v62 + v63);
  if (v20)
    height = remainder.size.height - (v43 + v56);
  else
    height = remainder.size.height;
  if (v20)
    v77 = remainder.size.width - (v164 + v159);
  else
    v77 = remainder.size.width;
  if (v20)
    y = v43 + remainder.origin.y;
  else
    y = remainder.origin.y;
  if (v20)
    x = v164 + remainder.origin.x;
  else
    x = remainder.origin.x;
  v165 = v75;
  UIRoundToViewScale(self);
  v81 = v80;
  if (v53 >= 2)
  {
    v82 = v154 - v153;
    if (v80 <= v154 - v153)
    {
      v172.origin.x = v74;
      v172.size.width = v165;
      v172.origin.y = r2a;
      v172.size.height = rect;
      v82 = v81;
      if (v81 < v154 + v153 - CGRectGetWidth(v172))
      {
        v173.origin.x = v74;
        v173.size.width = v165;
        v173.origin.y = r2a;
        v173.size.height = rect;
        v82 = v154 + v153 - CGRectGetWidth(v173);
      }
    }
  }
  else
  {
    v82 = v80;
  }
  v174.origin.x = x;
  v174.origin.y = y;
  v174.size.width = v77;
  v174.size.height = height;
  MinX = CGRectGetMinX(v174);
  v175.origin.x = x;
  v175.origin.y = y;
  v175.size.width = v77;
  v175.size.height = height;
  MaxX = CGRectGetMaxX(v175);
  v176.origin.x = v74;
  v85 = v165;
  v176.origin.y = r2a;
  v176.size.width = v165;
  v86 = rect;
  v176.size.height = rect;
  v87 = fmax(MinX, fmin(v82, MaxX - CGRectGetWidth(v176)));
  -[_UIEditMenuListView menuContainerView](self, "menuContainerView");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setFrame:", v158 + v87, v162, width, rect);

  -[_UIEditMenuListView titleView](self, "titleView");
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  if (v89)
  {
    v90 = slice.origin.y;
    v91 = slice.size.height;
    -[_UIEditMenuListView titleContainerView](self, "titleContainerView");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "setFrame:", v87, v90, v165, v91);

    v177.origin.x = v87;
    v177.origin.y = v90;
    v177.size.width = v165;
    v177.size.height = v91;
    v93 = CGRectGetWidth(v177);
    v94 = (v93 - CGRectGetWidth(slice)) * 0.5;
    slice.origin.x = v94;
    slice.origin.y = 0.0;
    v95 = slice.size.width;
    v96 = slice.size.height;
    -[_UIEditMenuListView titleView](self, "titleView");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v96;
    v85 = v165;
    objc_msgSend(v97, "setFrame:", v94, 0.0, v95, v98);

    if (-[_UIEditMenuListView _hasDisplayedMenu](self, "_hasDisplayedMenu"))
    {
      -[_UIEditMenuListView titleSeparatorView](self, "titleSeparatorView");
      v99 = (void *)objc_claimAutoreleasedReturnValue();

      if (v99)
      {
        v100 = -[_UIEditMenuListView arrowDirection](self, "arrowDirection");
        v101 = slice.origin.x;
        v102 = slice.origin.y;
        v103 = slice.size.width;
        v104 = slice.size.height;
        if (v100 == 1)
          MaxY = CGRectGetMinY(*(CGRect *)&v101);
        else
          MaxY = CGRectGetMaxY(*(CGRect *)&v101);
        v106 = MaxY;
        -[_UIEditMenuListView titleSeparatorView](self, "titleSeparatorView");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "setFrame:", 0.0, v106, v165, v155);

      }
    }
  }
  if ((*(_QWORD *)&v15 & 0x80000) != 0)
    v108 = width - largestPageWidth;
  else
    v108 = 0.0;
  -[_UIEditMenuListView collectionView](self, "collectionView");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setFrame:", v108, 0.0, largestPageWidth, rect);

  if (!v14)
  {
    v178.origin.x = v87;
    v178.origin.y = r2a;
    v178.size.width = v85;
    v178.size.height = rect;
    v161 = CGRectGetMinY(v178);
    v179.origin.x = v87;
    v179.origin.y = r2a;
    v179.size.width = v85;
    v179.size.height = rect;
    v110 = CGRectGetHeight(v179);
    v180.origin.x = v158 + v87;
    v180.origin.y = v162;
    v180.size.width = width;
    v180.size.height = rect;
    -[UIButton setFrame:](self->_leftButton, "setFrame:", v155 + CGRectGetMinX(v180) - v156, v161, v155 + v156, v110);
    -[UIView setAlpha:](self->_leftButton, "setAlpha:", v151);
    v181.origin.x = v158 + v87;
    v181.origin.y = v162;
    v181.size.width = width;
    v181.size.height = rect;
    v111 = CGRectGetMaxX(v181);
    v112 = v110;
    v85 = v165;
    -[UIButton setFrame:](self->_rightButton, "setFrame:", v111, v161, v155 + v156, v112);
    -[UIView setAlpha:](self->_rightButton, "setAlpha:", v152);
  }
  -[_UIEditMenuListView titleContainerView](self, "titleContainerView");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "frame");
  IsEmpty = CGRectIsEmpty(v182);

  if (IsEmpty)
  {
    v115 = v157;
    v116 = r2a;
  }
  else
  {
    -[_UIEditMenuListView titleContainerView](self, "titleContainerView");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "frame");
    v186.origin.x = v87;
    v186.origin.y = r2a;
    v186.size.width = v85;
    v186.size.height = rect;
    v184 = CGRectUnion(v183, v186);
    v87 = v184.origin.x;
    v116 = v184.origin.y;
    v85 = v184.size.width;
    v86 = v184.size.height;

    v115 = v157;
  }
  v118 = -[_UIEditMenuListView arrowDirection](self, "arrowDirection");
  v119 = -[_UIEditMenuListView axis](self, "axis");
  v120 = 0.0;
  if (v118 == 1)
    v121 = v115;
  else
    v121 = 0.0;
  if (v118 == 1)
    v122 = 0.0;
  else
    v122 = v115;
  if (v118 == 3)
  {
    v121 = 0.0;
    v123 = v115;
  }
  else
  {
    v123 = 0.0;
  }
  if (v118 == 3)
    v122 = 0.0;
  if (v118 == 4)
  {
    v121 = 0.0;
    v123 = 0.0;
    v122 = 0.0;
    v124 = v115;
  }
  else
  {
    v124 = 0.0;
  }
  if (v119 == (unint64_t)(v118 - 5) < 0xFFFFFFFFFFFFFFFELL)
  {
    v121 = 0.0;
    v123 = 0.0;
    v122 = 0.0;
  }
  else
  {
    v120 = v124;
  }
  v125 = v87 + v123;
  v126 = v116 + v121;
  v127 = v85 - (v123 + v120);
  v128 = v86 - (v121 + v122);
  -[_UIEditMenuListView _updateMaskingLayerWithFrame:](self, "_updateMaskingLayerWithFrame:", v125, v126, v127, v128);
  -[_UIEditMenuListView customBackgroundPlatterView](self, "customBackgroundPlatterView");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "setFrame:", v125, v126, v127, v128);

  -[UIView bounds](self, "bounds");
  v131 = v130;
  v133 = v132;
  v135 = v134;
  v137 = v136;
  -[_UIEditMenuListView backgroundView](self, "backgroundView");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "superview");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertRect:toView:](self, "convertRect:toView:", v139, v131, v133, v135, v137);
  v141 = v140;
  v143 = v142;
  v145 = v144;
  v147 = v146;
  -[_UIEditMenuListView backgroundView](self, "backgroundView");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "setFrame:", v141, v143, v145, v147);

  if (v14)
  {
    verticalContentHeight = self->_verticalContentHeight;
    -[_UIEditMenuListView collectionView](self, "collectionView");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "bounds");
    -[_UIEditMenuListView setScrubbingEnabled:](self, "setScrubbingEnabled:", verticalContentHeight <= CGRectGetHeight(v185));

  }
}

- (BOOL)scrubbingEnabled
{
  void *v2;
  char v3;

  -[_UIEditMenuListView collectionView](self, "collectionView");
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
  -[_UIEditMenuListView collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBounces:", v5);

  -[_UIEditMenuListView selectionGestureRecognizer](self, "selectionGestureRecognizer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowableMovement:", v4, v4);

}

- (double)_collectionViewWidthForPageProgress:(double)a3
{
  int64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v13;
  double v14;
  double v15;

  if (-[_UIEditMenuListView _hasDisplayedMenu](self, "_hasDisplayedMenu") && !-[_UIEditMenuListView axis](self, "axis"))
  {
    -[_UIEditMenuListView collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "viewWidthForPageProgress:", a3);
    v15 = v14;

    return v15;
  }
  else
  {
    v5 = -[_UIEditMenuListView arrowDirection](self, "arrowDirection");
    -[UIView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _UIEditMenuScaledArrowSize(v6);
    if (v5 == 3)
      v8 = v7;
    else
      v8 = 0.0;
    if (v5 == 4)
      v9 = 0.0;
    else
      v9 = v8;
    if (v5 == 4)
      v10 = v7;
    else
      v10 = 0.0;

    -[UIView bounds](self, "bounds");
    return v11 - (v9 + v10);
  }
}

- (BOOL)_isPaginationDirtyForContainerSize:(CGSize)a3
{
  if ((*(_BYTE *)&self->_needsUpdate & 1) != 0)
    return 1;
  if (self->_paginationContainerSize.height == a3.height)
    return self->_paginationContainerSize.width != a3.width;
  return 1;
}

- (void)_setNeedsPaginationUpdate
{
  *(_BYTE *)&self->_needsUpdate |= 1u;
}

- (void)_updatePaginationForSnapshot:(id)a3 containerSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  _UIEditMenuListPage *v21;
  unint64_t v22;
  double v23;
  void *v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  _UIEditMenuListPage *v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  unint64_t v44;
  unint64_t v45;
  double v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t j;
  uint64_t v71;
  void *v72;
  void *v73;
  double v74;
  uint64_t *v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _QWORD v86[18];

  height = a4.height;
  width = a4.width;
  v86[16] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (-[_UIEditMenuListView axis](self, "axis"))
  {
    -[_UIEditMenuListView collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPages:", MEMORY[0x1E0C9AA60]);

    *(_BYTE *)&self->_needsUpdate &= ~1u;
    self->_paginationContainerSize = (CGSize)*MEMORY[0x1E0C9D820];
    goto LABEL_51;
  }
  if (!v7)
  {
    -[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[UIButton sizeThatFits:](self->_leftButton, "sizeThatFits:", width, height);
  v10 = v9;
  -[_UIEditMenuListView _minimumRequiredWidthForArrowInRoundedListViewForAxis:](self, "_minimumRequiredWidthForArrowInRoundedListViewForAxis:", -[_UIEditMenuListView axis](self, "axis"));
  v12 = v11;
  -[UIView traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v7;
  objc_msgSend(v7, "itemIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    v74 = v12;
    v16 = width;
    v17 = height;
    v18 = objc_msgSend(v14, "count");
    v75 = &v71;
    MEMORY[0x1E0C80A78](v18);
    v20 = (char *)&v71 - v19;
    v21 = -[_UIEditMenuListPage initWithStartIndex:]([_UIEditMenuListPage alloc], "initWithStartIndex:", 0);
    objc_msgSend(v15, "addObject:", v21);
    if (objc_msgSend(v14, "count"))
    {
      v22 = 0;
      v23 = 0.0;
      do
      {
        objc_msgSend(v14, "objectAtIndex:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v15, "count") <= 1)
          v25 = 0.0;
        else
          v25 = v10 + 0.0;
        v26 = objc_msgSend(v14, "count");
        v27 = -0.0;
        if (v22 < v26 - 1)
          v27 = v10;
        v28 = v25 + v27;
        +[_UIEditMenuListViewCell layoutSizeForItem:traitCollection:containerSize:](_UIEditMenuListViewCell, "layoutSizeForItem:traitCollection:containerSize:", v24, v13, v16, height);
        v30 = fmin(v29, v16 - v28);
        *(double *)&v20[8 * v22] = v30;
        -[_UIEditMenuListPage width](v21, "width");
        UIRoundToViewScale(self);
        v32 = v31;
        UIRoundToViewScale(self);
        if (v32 > v33)
        {
          v34 = v13;
          v35 = -[_UIEditMenuListPage initWithStartIndex:]([_UIEditMenuListPage alloc], "initWithStartIndex:", v22);

          objc_msgSend(v15, "addObject:", v35);
          v21 = v35;
          v13 = v34;
        }
        -[_UIEditMenuListPage appendItemWithWidth:](v21, "appendItemWithWidth:", v30);
        -[_UIEditMenuListPage width](v21, "width");
        v23 = fmax(v36, v23);

        ++v22;
      }
      while (v22 < objc_msgSend(v14, "count"));
    }
    else
    {
      v23 = 0.0;
    }
    if ((unint64_t)objc_msgSend(v15, "count") <= 1)
    {
      width = v16;
      v12 = v74;
LABEL_38:

      goto LABEL_39;
    }
    objc_msgSend(v15, "lastObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v15, "count") - 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = *(double *)&v20[8 * objc_msgSend(v37, "range") - 8];
    objc_msgSend(v37, "width");
    v41 = v40;
    objc_msgSend(v38, "width");
    v43 = v42 * 0.5;
    objc_msgSend(v38, "range");
    v45 = v44;
    objc_msgSend(v37, "width");
    if (v41 >= v43)
    {
      height = v17;
    }
    else
    {
      height = v17;
      if (v45 >= 2)
      {
        width = v16;
        if (v39 + v46 < v16 - v10)
        {
          v72 = v38;
          v73 = v13;
          objc_msgSend(v38, "removeLastItemWithWidth:", v39);
          objc_msgSend(v37, "prependItemWithWidth:", v39);
          v83 = 0u;
          v84 = 0u;
          v81 = 0u;
          v82 = 0u;
          v47 = v15;
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
          if (v48)
          {
            v49 = v48;
            v50 = *(_QWORD *)v82;
            v12 = v74;
            do
            {
              for (i = 0; i != v49; ++i)
              {
                if (*(_QWORD *)v82 != v50)
                  objc_enumerationMutation(v47);
                objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i), "width");
                v23 = fmax(v23, v52);
              }
              v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
            }
            while (v49);
          }
          else
          {
            v12 = v74;
          }

          v38 = v72;
          v13 = v73;
          goto LABEL_37;
        }
LABEL_36:
        v12 = v74;
LABEL_37:

        goto LABEL_38;
      }
    }
    width = v16;
    goto LABEL_36;
  }
  v23 = 0.0;
LABEL_39:
  v53 = v12 + v12;
  if (objc_msgSend(v15, "count") == 1)
  {
    objc_msgSend(v15, "firstObject");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "enforceMinimumWidth:", v53);

  }
  if (objc_msgSend(v15, "count"))
  {
    -[UIScrollView contentInset](self->_collectionView, "contentInset");
    v56 = v55;
    v58 = v57;
    v60 = v59;
    objc_msgSend(v15, "lastObject");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "width");
    v63 = v23 - v62;

    -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", v56, v58, v60, v63);
  }
  -[_UIEditMenuListView collectionView](self, "collectionView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setPages:", v15);

  self->_largestPageWidth = fmax(v53, v23);
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  -[_UIEditMenuListView collectionView](self, "collectionView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "visibleCells");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
  if (v67)
  {
    v68 = v67;
    v69 = *(_QWORD *)v78;
    do
    {
      for (j = 0; j != v68; ++j)
      {
        if (*(_QWORD *)v78 != v69)
          objc_enumerationMutation(v66);
        objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * j), "setMaximumContentWidth:", self->_largestPageWidth);
      }
      v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
    }
    while (v68);
  }

  -[_UIEditMenuListView setScrubbingEnabled:](self, "setScrubbingEnabled:", objc_msgSend(v15, "count") == 1);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
  *(_BYTE *)&self->_needsUpdate &= ~1u;
  self->_paginationContainerSize.width = width;
  self->_paginationContainerSize.height = height;

  v7 = v76;
LABEL_51:

}

- (void)_didTapLeftDirectionalButton:(id)a3
{
  int v3;
  void *v4;
  id v5;

  v3 = *((_DWORD *)&self->super._viewFlags + 4);
  -[_UIEditMenuListView collectionView](self, "collectionView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 0x80000) != 0)
    objc_msgSend(v4, "incrementTargetPage");
  else
    objc_msgSend(v4, "decrementTargetPage");

}

- (void)_didTapRightDirectionalButton:(id)a3
{
  int v3;
  void *v4;
  id v5;

  v3 = *((_DWORD *)&self->super._viewFlags + 4);
  -[_UIEditMenuListView collectionView](self, "collectionView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 0x80000) != 0)
    objc_msgSend(v4, "decrementTargetPage");
  else
    objc_msgSend(v4, "incrementTargetPage");

}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[_UIEditMenuListView selectionGestureRecognizer](self, "selectionGestureRecognizer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state");

  if (v5)
  {
    -[_UIEditMenuListView selectionGestureRecognizer](self, "selectionGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", 0);

    -[_UIEditMenuListView selectionGestureRecognizer](self, "selectionGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", 1);

  }
  -[_UIEditMenuListView _updateHighlightState](self, "_updateHighlightState");
  if (!-[_UIEditMenuListView axis](self, "axis"))
    -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  void *v7;
  double v8;
  double v9;
  id v10;

  -[_UIEditMenuListView collectionView](self, "collectionView", a3, a4.x, a4.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pageProgressForContentOffset:clamped:", 1, a5->x, a5->y);
  v9 = v8;

  -[_UIEditMenuListView collectionView](self, "collectionView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTargetPage:", llround(v9));

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  void *v6;
  double v7;
  double v8;
  int64_t v9;
  int64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v18 = a4;
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _UIEditMenuScaledArrowSize(v6);
  v8 = v7;

  v9 = -[_UIEditMenuListView arrowDirection](self, "arrowDirection");
  v10 = -[_UIEditMenuListView axis](self, "axis");
  v12 = 0.0;
  v13 = 0.0;
  v14 = 0.0;
  v15 = 0.0;
  if (v10 != (unint64_t)(v9 - 5) < 0xFFFFFFFFFFFFFFFELL)
  {
    if (v9 == 1)
      v12 = v8;
    else
      v12 = 0.0;
    if (v9 == 1)
      v16 = 0.0;
    else
      v16 = v8;
    if (v9 == 3)
    {
      v12 = 0.0;
      v17 = v8;
    }
    else
    {
      v17 = 0.0;
    }
    if (v9 == 3)
      v11 = 0.0;
    else
      v11 = v16;
    if (v9 == 4)
    {
      v12 = 0.0;
      v13 = 0.0;
    }
    else
    {
      v13 = v17;
    }
    if (v9 == 4)
      v14 = 0.0;
    else
      v14 = v11;
    if (v9 == 4)
      v15 = v8;
  }
  objc_msgSend(v18, "setArrowEdgeInsets:", v12, v13, v14, v15, v11);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  objc_super v12;
  CGPoint v13;
  CGRect BoundingBox;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[_UIEditMenuListView maskLayer](self, "maskLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BoundingBox = CGPathGetBoundingBox((CGPathRef)objc_msgSend(v8, "path"));
  v13.x = x;
  v13.y = y;
  v9 = CGRectContainsPoint(BoundingBox, v13);

  if (v9)
  {
    v12.receiver = self;
    v12.super_class = (Class)_UIEditMenuListView;
    -[UIView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_indexPathForGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  int isGestureRecognizerLocationInsideView;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v13;
  int v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;

  v4 = a3;
  -[_UIEditMenuListView leftButton](self, "leftButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isGestureRecognizerLocationInsideView = _isGestureRecognizerLocationInsideView(v4, v5);

  if (isGestureRecognizerLocationInsideView)
  {
    v7 = (void *)MEMORY[0x1E0CB36B0];
    v8 = 0;
LABEL_5:
    objc_msgSend(v7, "indexPathWithIndex:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[_UIEditMenuListView rightButton](self, "rightButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = _isGestureRecognizerLocationInsideView(v4, v9);

  if (v10)
  {
    v7 = (void *)MEMORY[0x1E0CB36B0];
    v8 = 1;
    goto LABEL_5;
  }
  -[_UIEditMenuListView menuContainerView](self, "menuContainerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = _isGestureRecognizerLocationInsideView(v4, v13);

  if (v14)
  {
    -[_UIEditMenuListView collectionView](self, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v15);
    v17 = v16;
    v19 = v18;

    -[_UIEditMenuListView collectionView](self, "collectionView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "indexPathForItemAtPoint:", v17, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIEditMenuListView collectionView](self, "collectionView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "cellForItemAtIndexPath:", v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "securePasteButtonSlotView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v22, "securePasteButtonSlotView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIEditMenuListView collectionView](self, "collectionView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "convertPoint:fromView:", v25, v17, v19);
      v27 = v26;
      v29 = v28;

      if ((objc_msgSend(v24, "pointInside:withEvent:", 0, v27, v29) & 1) == 0)
      {

        v11 = 0;
      }

    }
  }
  else
  {
    v11 = 0;
  }
LABEL_6:

  return v11;
}

- (void)_handleSelectionGesture:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  -[_UIEditMenuListView _indexPathForGestureRecognizer:](self, "_indexPathForGestureRecognizer:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIEditMenuListView collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isDecelerating"))
  {
    -[_UIEditMenuListView collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "panGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "state") == 5;

  }
  else
  {
    v8 = 1;
  }

  v9 = objc_msgSend(v20, "state");
  v10 = v4;
  if ((unint64_t)(v9 - 1) < 2)
    goto LABEL_17;
  if (v9 != 3)
  {
    v10 = 0;
LABEL_17:
    -[_UIEditMenuListView setScrubbedIndexPath:](self, "setScrubbedIndexPath:", v10);
LABEL_18:
    -[_UIEditMenuListView _updateHighlightState](self, "_updateHighlightState");
    goto LABEL_19;
  }
  -[_UIEditMenuListView setScrubbedIndexPath:](self, "setScrubbedIndexPath:", 0);
  if (v4)
    v11 = v8;
  else
    v11 = 0;
  if (!v11)
    goto LABEL_18;
  v12 = -[_UIEditMenuListView _canSelectItemAtIndexPath:](self, "_canSelectItemAtIndexPath:", v4);
  -[_UIEditMenuListView _updateHighlightState](self, "_updateHighlightState");
  if (v12)
  {
    -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "menuElement");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[_UIEditMenuListView _hasPasteAuthentication](self, "_hasPasteAuthentication"))
    {
      -[UIGestureRecognizer _activeTouchesEvent](v20);
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)v15;
        v17 = objc_msgSend(v14, "_acceptBoolMenuVisit:commandVisit:actionVisit:", 0, &__block_literal_global_417, &__block_literal_global_420);

        if (v17)
        {
          -[UIGestureRecognizer _activeTouchesEvent](v20);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "_authenticationMessage");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIPasteboard _attemptAuthenticationWithMessage:](UIPasteboard, "_attemptAuthenticationWithMessage:", v19);

        }
      }
    }
    -[_UIEditMenuListView _selectItemAtIndexPath:](self, "_selectItemAtIndexPath:", v4);

  }
LABEL_19:

}

- (void)_handleHoverGesture:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = a3;
  -[_UIEditMenuListView _indexPathForGestureRecognizer:](self, "_indexPathForGestureRecognizer:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state");

  if ((unint64_t)(v5 - 1) >= 2)
    v6 = 0;
  else
    v6 = v7;
  -[_UIEditMenuListView setHoveredIndexPath:](self, "setHoveredIndexPath:", v6);
  -[_UIEditMenuListView _updateHighlightState](self, "_updateHighlightState");

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  float v9;
  double v10;
  void *v11;

  v4 = a3;
  -[_UIEditMenuListView selectionGestureRecognizer](self, "selectionGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[UIView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentationLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "opacity");
    v10 = v9;

    if (v10 >= 0.9)
    {
      -[_UIEditMenuListView _indexPathForGestureRecognizer:](self, "_indexPathForGestureRecognizer:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v11 != 0;

    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[_UIEditMenuListView selectionGestureRecognizer](self, "selectionGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[_UIEditMenuListView collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "panGestureRecognizer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v11 == v6;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_updateHighlightState
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  -[_UIEditMenuListView collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDragging");

  -[_UIEditMenuListView scrubbedIndexPath](self, "scrubbedIndexPath");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIEditMenuListView hoveredIndexPath](self, "hoveredIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v5;
  else
    v6 = v9;
  v7 = v6;
  v8 = v7;
  if (v4)
  {
    -[_UIEditMenuListView highlightedIndexPath](self, "highlightedIndexPath");

LABEL_8:
    -[_UIEditMenuListView _unhighlightCurrentlyHighlightedItem](self, "_unhighlightCurrentlyHighlightedItem");
    goto LABEL_9;
  }
  if (!v7)
    goto LABEL_8;
  -[_UIEditMenuListView _highlightItemAtIndexPath:](self, "_highlightItemAtIndexPath:", v7);
LABEL_9:

}

- (BOOL)_canSelectItemAtIndexPath:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEditMenuListView.m"), 1019, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

  }
  -[_UIEditMenuListView dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifierForIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "menuElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "primaryActionHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;

  }
  else if (objc_msgSend(v8, "_isLeaf"))
  {
    v10 = (objc_msgSend(v8, "attributes") & 1) == 0;
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)_selectItemAtIndexPath:(id)a3
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a3;
  v16 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEditMenuListView.m"), 1033, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

    v5 = 0;
  }
  if (-[_UIEditMenuListView _canSelectItemAtIndexPath:](self, "_canSelectItemAtIndexPath:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v16, "isEqual:", v6);

    if (v7)
    {
      -[_UIEditMenuListView leftButton](self, "leftButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v16, "isEqual:", v9);

      if (!v10)
      {
        -[_UIEditMenuListView dataSource](self, "dataSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "itemIdentifierForIndexPath:", v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "menuElement");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[_UIEditMenuListView delegate](self, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "editMenuListView:didSelectMenuElement:", self, v11);

        goto LABEL_10;
      }
      -[_UIEditMenuListView rightButton](self, "rightButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = v8;
    objc_msgSend(v8, "sendActionsForControlEvents:", 0x2000);
LABEL_10:

  }
}

- (void)_highlightItemAtIndexPath:(id)a3
{
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if ((-[NSIndexPath isEqual:](self->_highlightedIndexPath, "isEqual:") & 1) == 0)
  {
    -[_UIEditMenuListView _unhighlightCurrentlyHighlightedItem](self, "_unhighlightCurrentlyHighlightedItem");
    if (-[_UIEditMenuListView _canSelectItemAtIndexPath:](self, "_canSelectItemAtIndexPath:", v12))
    {
      objc_storeStrong((id *)&self->_highlightedIndexPath, a3);
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v12, "isEqual:", v5);

      if (v6)
      {
        v7 = 576;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v12, "isEqual:", v8);

        if (!v9)
        {
          -[_UIEditMenuListView collectionView](self, "collectionView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "cellForItemAtIndexPath:", v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "setHighlighted:", 1);
          goto LABEL_9;
        }
        v7 = 584;
      }
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v7), "setHighlighted:", 1);
    }
  }
LABEL_9:

}

- (void)_unhighlightCurrentlyHighlightedItem
{
  NSIndexPath *highlightedIndexPath;
  void *v4;
  int v5;
  uint64_t v6;
  NSIndexPath *v7;
  void *v8;
  void *v9;
  void *v10;
  NSIndexPath *v11;

  highlightedIndexPath = self->_highlightedIndexPath;
  if (highlightedIndexPath)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[NSIndexPath isEqual:](highlightedIndexPath, "isEqual:", v4);

    if (v5)
    {
      v6 = 576;
    }
    else
    {
      v7 = self->_highlightedIndexPath;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v7) = -[NSIndexPath isEqual:](v7, "isEqual:", v8);

      if (!(_DWORD)v7)
      {
        -[_UIEditMenuListView collectionView](self, "collectionView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "cellForItemAtIndexPath:", self->_highlightedIndexPath);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "setHighlighted:", 0);
        goto LABEL_9;
      }
      v6 = 584;
    }
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v6), "setHighlighted:", 0);
LABEL_9:
    v11 = self->_highlightedIndexPath;
    self->_highlightedIndexPath = 0;

  }
}

- (void)setArrowDirection:(int64_t)a3
{
  if (self->_arrowDirection != a3)
  {
    self->_arrowDirection = a3;
    -[_UIEditMenuListView _updateArrowEdgeInsets](self, "_updateArrowEdgeInsets");
  }
}

- (void)_updateArrowEdgeInsets
{
  void *v3;
  double v4;
  double v5;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIEditMenuScaledArrowSize(v3);
  v5 = v4;

  v6 = -[_UIEditMenuListView arrowDirection](self, "arrowDirection");
  v7 = -[_UIEditMenuListView axis](self, "axis");
  v8 = (unint64_t)(v6 - 5) < 0xFFFFFFFFFFFFFFFELL;
  if (v6 == 1)
    v9 = v5;
  else
    v9 = 0.0;
  if (v6 == 1)
    v10 = 0.0;
  else
    v10 = v5;
  if (v6 == 3)
  {
    v9 = 0.0;
    v11 = v5;
  }
  else
  {
    v11 = 0.0;
  }
  if (v6 == 3)
    v10 = 0.0;
  if (v6 == 4)
  {
    v9 = 0.0;
    v11 = 0.0;
    v10 = 0.0;
    v12 = v5;
  }
  else
  {
    v12 = 0.0;
  }
  if (v7 == v8)
    v13 = 0.0;
  else
    v13 = v9;
  if (v7 == v8)
    v14 = 0.0;
  else
    v14 = v11;
  if (v7 == v8)
    v15 = 0.0;
  else
    v15 = v10;
  if (v7 == v8)
    v16 = 0.0;
  else
    v16 = v12;
  -[_UIEditMenuPageButton setArrowEdgeInsets:](self->_leftButton, "setArrowEdgeInsets:", v13, v14, v15, v16, v12);
  -[_UIEditMenuPageButton setArrowEdgeInsets:](self->_rightButton, "setArrowEdgeInsets:", v13, v14, v15, v16);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[_UIEditMenuListView collectionView](self, "collectionView", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "visibleCells");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "setArrowEdgeInsets:", v13, v14, v15, v16);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v20);
  }

  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateMaskingLayerWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v14;
  double v15;
  double v16;
  int64_t v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  void *v33;
  double v34;
  double v35;
  id v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double MaxX;
  double v50;
  double v51;
  double MaxY;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  id v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  id v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    -[UIView traitCollection](self, "traitCollection");
    v67 = (id)objc_claimAutoreleasedReturnValue();
    _UIEditMenuGetPlatformMetrics(objc_msgSend(v67, "userInterfaceIdiom"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_UIEditMenuListView axis](self, "axis"))
      objc_msgSend(v8, "verticalMenuCornerRadius");
    else
      objc_msgSend(v8, "horizontalMenuCornerRadius");
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrowSize");
    if (v12 != *MEMORY[0x1E0C9D820] || v11 != *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      -[UIView superview](self, "superview");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView center](self, "center");
      objc_msgSend(v14, "convertPoint:toView:", self);
      v63 = v16;
      v64 = v15;

      v17 = -[_UIEditMenuListView arrowDirection](self, "arrowDirection");
      v18 = _UIEditMenuScaledArrowSize(v67);
      v65 = v19;
      v66 = v18;
      v20 = v67;
      _UIEditMenuGetPlatformMetrics(objc_msgSend(v20, "userInterfaceIdiom"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "arrowSideRadius");
      v23 = v22;
      v24 = v20;
      objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleSubhead"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_scaledValueForValue:useLanguageAwareScaling:", 0, v23);
      v27 = v26;
      objc_msgSend(v24, "displayScale");
      v29 = v28;

      UIRoundToScale(v27, fmax(v29, 1.0));
      v31 = v30;

      v32 = v24;
      _UIEditMenuGetPlatformMetrics(objc_msgSend(v32, "userInterfaceIdiom"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "arrowTipRadius");
      v35 = v34;
      v36 = v32;
      objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleSubhead"), v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "_scaledValueForValue:useLanguageAwareScaling:", 0, v35);
      v39 = v38;
      objc_msgSend(v36, "displayScale");
      v41 = v40;

      UIRoundToScale(v39, fmax(v41, 1.0));
      v43 = v42;

      v44 = v10;
      v45 = x;
      v46 = y;
      v47 = width;
      v48 = height;
      if ((unint64_t)(v17 - 3) > 1)
      {
        if (v17 == 2)
        {
          MaxY = CGRectGetMaxY(*(CGRect *)&v45);
          v69.origin.x = x;
          v69.origin.y = y;
          v69.size.width = width;
          v69.size.height = height;
          v53 = v65 + CGRectGetMaxY(v69);
          v54 = -5.0;
        }
        else
        {
          MaxY = CGRectGetMinY(*(CGRect *)&v45);
          v71.origin.x = x;
          v71.origin.y = y;
          v71.size.width = width;
          v71.size.height = height;
          v53 = CGRectGetMinY(v71) - v65;
          v54 = 5.0;
        }
        v58 = v64 + v66 * 0.5;
        v59 = v64 - v66 * 0.5;
        v60 = MaxY + 0.0;
        if (v17 == 2)
          _appendBezierPathForPoints(v44, v31, v43, v64 + v66 * 0.5, MaxY, v64 - v66 * 0.5, MaxY, v58 + v31, v60, v59 - v31, MaxY + 0.0, v64, v53, 0.0, v54);
        else
          _appendBezierPathForPoints(v44, v31, v43, v64 - v66 * 0.5, MaxY, v58, MaxY, v59 - v31, v60, v58 + v31, MaxY + 0.0, v64, v53, 0.0, v54);
      }
      else
      {
        if (v17 == 4)
        {
          MaxX = CGRectGetMaxX(*(CGRect *)&v45);
          v68.origin.x = x;
          v68.origin.y = y;
          v68.size.width = width;
          v68.size.height = height;
          v50 = v65 + CGRectGetMaxX(v68);
          v51 = -5.0;
        }
        else
        {
          MaxX = CGRectGetMinX(*(CGRect *)&v45);
          v70.origin.x = x;
          v70.origin.y = y;
          v70.size.width = width;
          v70.size.height = height;
          v50 = CGRectGetMinX(v70) - v65;
          v51 = 5.0;
        }
        v55 = v63 - v66 * 0.5;
        v56 = v63 + v66 * 0.5;
        v57 = MaxX + 0.0;
        if (v17 == 4)
          _appendBezierPathForPoints(v44, v31, v43, MaxX, v63 - v66 * 0.5, MaxX, v63 + v66 * 0.5, v57, v55 - v31, MaxX + 0.0, v56 + v31, v50, v63, v51, 0.0);
        else
          _appendBezierPathForPoints(v44, v31, v43, MaxX, v63 + v66 * 0.5, MaxX, v55, v57, v56 + v31, MaxX + 0.0, v55 - v31, v50, v63, v51, 0.0);
      }

    }
    v61 = objc_retainAutorelease(v10);
    -[CAShapeLayer setPath:](self->_maskLayer, "setPath:", objc_msgSend(v61, "CGPath"));
    if (-[_UIEditMenuListView hasShadow](self, "hasShadow"))
    {
      -[_UIEditMenuListView shadowView](self, "shadowView");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setPath:", v61);

    }
  }
}

- (BOOL)hasShadow
{
  void *v2;
  BOOL v3;

  -[_UIEditMenuListView shadowView](self, "shadowView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)backgroundMaterialGroupName
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
    objc_msgSend(v4, "stringWithFormat:", CFSTR("edit-menu-background-%@"), v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->_backgroundMaterialGroupName;
    self->_backgroundMaterialGroupName = v7;

    backgroundMaterialGroupName = self->_backgroundMaterialGroupName;
  }
  return backgroundMaterialGroupName;
}

- (_UIEditMenuListViewDelegate)delegate
{
  return (_UIEditMenuListViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)arrowDirection
{
  return self->_arrowDirection;
}

- (int64_t)axis
{
  return self->_axis;
}

- (UIView)titleView
{
  return self->_titleView;
}

- (UIMenu)displayedMenu
{
  return self->_displayedMenu;
}

- (UIView)customBackgroundPlatterView
{
  return self->_customBackgroundPlatterView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (_UIDiffuseShadowView)shadowView
{
  return self->_shadowView;
}

- (CAShapeLayer)maskLayer
{
  return self->_maskLayer;
}

- (UIView)menuContainerView
{
  return self->_menuContainerView;
}

- (_UIEditMenuCollectionView)collectionView
{
  return self->_collectionView;
}

- (UIView)titleContainerView
{
  return self->_titleContainerView;
}

- (UIView)titleSeparatorView
{
  return self->_titleSeparatorView;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (_UIEditMenuPageButton)leftButton
{
  return self->_leftButton;
}

- (_UIEditMenuPageButton)rightButton
{
  return self->_rightButton;
}

- (_UIContinuousSelectionGestureRecognizer)selectionGestureRecognizer
{
  return self->_selectionGestureRecognizer;
}

- (UIHoverGestureRecognizer)hoverGestureRecognizer
{
  return self->_hoverGestureRecognizer;
}

- (NSIndexPath)highlightedIndexPath
{
  return self->_highlightedIndexPath;
}

- (void)setHighlightedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedIndexPath, a3);
}

- (NSIndexPath)hoveredIndexPath
{
  return self->_hoveredIndexPath;
}

- (void)setHoveredIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_hoveredIndexPath, a3);
}

- (NSIndexPath)scrubbedIndexPath
{
  return self->_scrubbedIndexPath;
}

- (void)setScrubbedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_scrubbedIndexPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrubbedIndexPath, 0);
  objc_storeStrong((id *)&self->_hoveredIndexPath, 0);
  objc_storeStrong((id *)&self->_highlightedIndexPath, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_selectionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_titleSeparatorView, 0);
  objc_storeStrong((id *)&self->_titleContainerView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_menuContainerView, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_customBackgroundPlatterView, 0);
  objc_storeStrong((id *)&self->_displayedMenu, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backgroundMaterialGroupName, 0);
}

@end
