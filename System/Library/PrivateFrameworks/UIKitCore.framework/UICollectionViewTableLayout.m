@implementation UICollectionViewTableLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

- (UICollectionViewTableLayout)init
{
  char *v2;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)UICollectionViewTableLayout;
  v2 = -[UICollectionViewLayout init](&v16, sel_init);
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(v2 + 600) = _Q0;
  *(_OWORD *)(v2 + 616) = _Q0;
  *(_OWORD *)(v2 + 296) = _Q0;
  *(_OWORD *)(v2 + 312) = _Q0;
  *((_QWORD *)v2 + 64) = -1;
  *((_QWORD *)v2 + 51) = 0x7FEFFFFFFFFFFFFFLL;
  *((_QWORD *)v2 + 52) = 0x7FEFFFFFFFFFFFFFLL;
  *((_QWORD *)v2 + 53) = 0x7FEFFFFFFFFFFFFFLL;
  objc_msgSend(v2, "_setFloatingElementKinds:", 0);
  objc_msgSend(v2, "setSeparatorInsetIsRelativeToCellEdges:", dyld_program_sdk_at_least());
  v2[404] = 1;
  v2[406] = 1;
  v8 = objc_opt_new();
  v9 = (void *)*((_QWORD *)v2 + 46);
  *((_QWORD *)v2 + 46) = v8;

  v10 = objc_opt_new();
  v11 = (void *)*((_QWORD *)v2 + 47);
  *((_QWORD *)v2 + 47) = v10;

  v12 = objc_opt_new();
  v13 = (void *)*((_QWORD *)v2 + 48);
  *((_QWORD *)v2 + 48) = v12;

  objc_msgSend(v2, "registerClass:forDecorationViewOfKind:", objc_opt_class(), CFSTR("UICollectionElementKindSeparator"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", v2, sel__darkenedColorsChanged_, CFSTR("UIAccessibilityDarkerSystemColorsStatusDidChangeNotification"), 0);

  return (UICollectionViewTableLayout *)v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIAccessibilityDarkerSystemColorsStatusDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewTableLayout;
  -[UICollectionViewTableLayout dealloc](&v4, sel_dealloc);
}

- (id)_floatingElementKinds
{
  return -[NSSet allObjects](self->_floatingElementKinds, "allObjects");
}

- (void)_setFloatingElementKinds:(id)a3
{
  NSSet *v4;
  NSSet *floatingElementKinds;

  if (a3)
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("UICollectionElementKindSectionHeader"), CFSTR("UICollectionElementKindSectionFooter"), 0);
  v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  floatingElementKinds = self->_floatingElementKinds;
  self->_floatingElementKinds = v4;

}

- (void)prepareLayout
{
  void *v3;
  UITableConstants *v4;
  UITableConstants *constants;
  void *v6;
  void *v7;
  UISwipeActionController *v8;
  UISwipeActionController *swipeActionController;
  UIColor *v10;
  UIColor *separatorColor;
  void *v12;
  UIColor *v13;
  UIColor *darkenedSeparatorColor;
  double v15;
  double v16;
  double v17;
  UITableViewRowData *rowData;
  UITableViewRowData *v19;
  UITableViewRowData *v20;
  double Width;
  id v22;
  CGRect v23;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UITableConstantsForTraitCollection(v3);
  v4 = (UITableConstants *)objc_claimAutoreleasedReturnValue();
  constants = self->_constants;
  self->_constants = v4;

  if (!self->_swipeActionController)
  {
    objc_msgSend(v22, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UISwipeActionVisualStyleProvider visualStyleForIdiom:](UISwipeActionVisualStyleProvider, "visualStyleForIdiom:", objc_msgSend(v6, "userInterfaceIdiom"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[UISwipeActionController initWithSwipeActionHost:style:]([UISwipeActionController alloc], "initWithSwipeActionHost:style:", self, objc_msgSend(v7, "defaultSwipeActionUIStyleForUITableViewStyle:", -[UICollectionViewTableLayout _tableStyle](self, "_tableStyle")));
    swipeActionController = self->_swipeActionController;
    self->_swipeActionController = v8;

  }
  if (self->_separatorStyle == -1)
    self->_separatorStyle = -[UITableConstants defaultSeparatorStyleForTableViewStyle:](self->_constants, "defaultSeparatorStyleForTableViewStyle:", -[UICollectionViewTableLayout _tableStyle](self, "_tableStyle"));
  if (!self->_separatorColor)
  {
    -[UITableConstants defaultSeparatorColorForTableViewStyle:](self->_constants, "defaultSeparatorColorForTableViewStyle:", -[UICollectionViewTableLayout _tableStyle](self, "_tableStyle"));
    v10 = (UIColor *)objc_claimAutoreleasedReturnValue();
    separatorColor = self->_separatorColor;
    self->_separatorColor = v10;

    -[UICollectionViewLayout collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_accessibilityHigherContrastTintColorForColor:", self->_separatorColor);
    v13 = (UIColor *)objc_claimAutoreleasedReturnValue();
    darkenedSeparatorColor = self->_darkenedSeparatorColor;
    self->_darkenedSeparatorColor = v13;

  }
  if (self->_rowHeight == 1.79769313e308)
  {
    -[UITableConstants defaultRowHeightForTableView:](self->_constants, "defaultRowHeightForTableView:", self);
    self->_rowHeight = v15;
  }
  if (self->_sectionHeaderHeight == 1.79769313e308)
  {
    -[UICollectionViewTableLayout _defaultSectionHeaderHeight](self, "_defaultSectionHeaderHeight");
    self->_sectionHeaderHeight = v16;
  }
  if (self->_sectionFooterHeight == 1.79769313e308)
  {
    -[UICollectionViewTableLayout _defaultSectionFooterHeight](self, "_defaultSectionFooterHeight");
    self->_sectionFooterHeight = v17;
  }
  rowData = self->_rowData;
  if (!rowData)
  {
    v19 = (UITableViewRowData *)-[UITableViewRowData initWithTableView:]([UITableViewRowData alloc], self);
    v20 = self->_rowData;
    self->_rowData = v19;

    rowData = self->_rowData;
  }
  objc_msgSend(v22, "bounds");
  Width = CGRectGetWidth(v23);
  if (rowData)
    rowData->_tableViewWidth = Width;
  -[UITableViewRowData ensureAllSectionsAreValid](self->_rowData);

}

- (void)prepareForTransitionFromLayout:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewTableLayout;
  -[UICollectionViewLayout prepareForTransitionFromLayout:](&v4, sel_prepareForTransitionFromLayout_, a3);
  -[UISwipeActionController setSwipeEnabled:](self->_swipeActionController, "setSwipeEnabled:", 1);
}

- (void)prepareForTransitionToLayout:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewTableLayout;
  -[UICollectionViewLayout prepareForTransitionToLayout:](&v4, sel_prepareForTransitionToLayout_, a3);
  -[UISwipeActionController setSwipeEnabled:](self->_swipeActionController, "setSwipeEnabled:", 0);
}

- (void)_setCollectionView:(id)a3
{
  id v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UICollectionViewTableLayout;
  v4 = a3;
  -[UICollectionViewLayout _setCollectionView:](&v11, sel__setCollectionView_, v4);
  -[UIScrollView _setContentScrollsAlongXAxis:](self->super._collectionView, "_setContentScrollsAlongXAxis:", 0, v11.receiver, v11.super_class);
  -[UIScrollView _setContentScrollsAlongYAxis:](self->super._collectionView, "_setContentScrollsAlongYAxis:", 1);
  objc_msgSend(v4, "layoutMargins");
  self->_previousLayoutMargins.top = v5;
  self->_previousLayoutMargins.left = v6;
  self->_previousLayoutMargins.bottom = v7;
  self->_previousLayoutMargins.right = v8;
  objc_msgSend(v4, "_currentScreenScale");
  v10 = v9;

  self->_memoizedScale = v10;
}

- (CGPoint)_contentOffsetFromProposedContentOffset:(CGPoint)a3 forScrollingToItemAtIndexPath:(id)a4 atScrollPosition:(unint64_t)a5
{
  double y;
  CGFloat x;
  id v9;
  void *v10;
  uint64_t v11;
  UITableViewRowData *rowData;
  uint64_t v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  double v35;
  double v36;
  CGPoint result;
  CGRect v38;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  if (a5 == 4)
  {
    -[UICollectionViewTableLayout _floatingElementKinds](self, "_floatingElementKinds");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21)
    {
      -[UICollectionViewTableLayout _visibleRect](self, "_visibleRect");
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;
      -[UITableViewRowData floatingRectForFooterInSection:visibleRect:heightCanBeGuessed:outIsFloating:]((uint64_t)self->_rowData, objc_msgSend(v9, "section"), 0, 0, v22, v24, v26, v28);
      v31 = v30;
      v33 = v32;
      v38.origin.x = v23;
      v38.origin.y = v25;
      v38.size.width = v27;
      v38.size.height = v29;
      if (y + CGRectGetHeight(v38) > v31)
        y = y + v33;
    }
    else
    {
      v34 = objc_msgSend(v9, "item");
      if (v34 == -[UITableViewRowData numberOfRowsInSection:]((uint64_t)self->_rowData, objc_msgSend(v9, "section")) - 1)
        y = y
          + -[UITableViewRowData heightForFooterInSection:canGuess:]((uint64_t)self->_rowData, objc_msgSend(v9, "section"), 0);
    }
  }
  else if (a5 == 1)
  {
    -[UICollectionViewTableLayout _floatingElementKinds](self, "_floatingElementKinds");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      rowData = self->_rowData;
      v13 = objc_msgSend(v9, "section");
      -[UICollectionViewTableLayout _visibleRect](self, "_visibleRect");
      -[UITableViewRowData floatingRectForHeaderInSection:visibleRect:heightCanBeGuessed:outIsFloating:]((uint64_t)rowData, v13, 0, 0, v14, v15, v16, v17);
      if (y < v19 + v18)
        y = y - v18;
    }
    else if (!objc_msgSend(v9, "item"))
    {
      y = y
        - -[UITableViewRowData heightForHeaderInSection:canGuess:]((uint64_t)self->_rowData, objc_msgSend(v9, "section"), 0);
    }
  }

  v35 = x;
  v36 = y;
  result.y = v36;
  result.x = v35;
  return result;
}

- (BOOL)_estimatesSizes
{
  return -[UICollectionViewTableLayout _estimatesRowHeights](self, "_estimatesRowHeights")
      || -[UICollectionViewTableLayout _estimatesSectionHeaderHeights](self, "_estimatesSectionHeaderHeights")
      || -[UICollectionViewTableLayout _estimatesSectionFooterHeights](self, "_estimatesSectionFooterHeights");
}

- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;

  v6 = a4;
  v7 = a3;
  v8 = -[UICollectionViewTableLayout _estimatesSizes](self, "_estimatesSizes");
  objc_msgSend(v6, "representedElementCategory");
  objc_msgSend(v7, "size");
  v10 = v9;
  v12 = v11;

  objc_msgSend(v6, "size");
  v14 = v13;
  v16 = v15;

  v17 = v10 != v14;
  if (v12 != v16)
    v17 = 1;
  return v8 && v17;
}

- (id)_indexPathsBelowIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  UITableViewRowData *rowData;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *indexPathCache;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  double v16;
  double v17;
  void *v18;

  v4 = a3;
  v5 = -[NSMutableArray count](self->_indexPathCache, "count");
  v6 = v5;
  if (self->_indexPathCache)
  {
    if (v5)
      goto LABEL_11;
  }
  else
  {
    rowData = self->_rowData;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0x7FFFFFFFFFFFFFFFLL, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewRowData _indexPathsBelowIndexPath:]((uint64_t)rowData, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (NSMutableArray *)objc_msgSend(v9, "mutableCopy");
    indexPathCache = self->_indexPathCache;
    self->_indexPathCache = v10;

    if (v6)
      goto LABEL_11;
  }
  if (-[NSMutableArray count](self->_indexPathCache, "count"))
  {
    v12 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_indexPathCache, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "length") == 2 && objc_msgSend(v13, "row") == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", objc_msgSend(v13, "section"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray setObject:atIndexedSubscript:](self->_indexPathCache, "setObject:atIndexedSubscript:", v14, v12);

      }
      ++v12;
    }
    while (v12 < -[NSMutableArray count](self->_indexPathCache, "count"));
  }
LABEL_11:
  v15 = -[NSMutableArray indexOfObject:](self->_indexPathCache, "indexOfObject:", v4);
  if ((double)v15 == 9.22337204e18)
    v16 = 0.0;
  else
    v16 = (double)v15;
  v17 = (double)(unint64_t)-[NSMutableArray count](self->_indexPathCache, "count") - v16;
  if (v17 < 0.0)
    v17 = (double)(unint64_t)-[NSMutableArray count](self->_indexPathCache, "count");
  -[NSMutableArray subarrayWithRange:](self->_indexPathCache, "subarrayWithRange:", (unint64_t)v16, (unint64_t)v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)_invalidateIndexPathsBelowIndexPath:(id)a3 withInvalidationContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v6;
  -[UICollectionViewTableLayout _indexPathsBelowIndexPath:](self, "_indexPathsBelowIndexPath:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "length");
        v18 = v8;
        if (v17 == 2)
          goto LABEL_7;
        if (objc_msgSend(v16, "length") == 1)
        {
          if (-[UICollectionViewTableLayout _shouldHaveHeaderViewForSection:](self, "_shouldHaveHeaderViewForSection:", objc_msgSend(v16, "section")))
          {
            objc_msgSend(v9, "addObject:", v16);
          }
          v19 = -[UICollectionViewTableLayout _shouldHaveFooterViewForSection:](self, "_shouldHaveFooterViewForSection:", objc_msgSend(v16, "section"));
          v18 = v10;
          if (v19)
LABEL_7:
            objc_msgSend(v18, "addObject:", v16);
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }
  objc_msgSend(v7, "invalidateItemsAtIndexPaths:", v8);
  objc_msgSend(v7, "invalidateSupplementaryElementsOfKind:atIndexPaths:", CFSTR("UICollectionElementKindSectionHeader"), v9);
  objc_msgSend(v7, "invalidateSupplementaryElementsOfKind:atIndexPaths:", CFSTR("UICollectionElementKindSectionFooter"), v10);

}

- (id)invalidationContextForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4
{
  id v6;
  id v7;
  UICollectionViewTableLayoutInvalidationContext *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  int v15;
  int *v16;
  void *v18;
  int v19;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(UICollectionViewTableLayoutInvalidationContext);
  objc_msgSend(v6, "indexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "size");
  v11 = v10;

  objc_msgSend(v6, "size");
  v13 = v12;
  if (!objc_msgSend(v6, "representedElementCategory"))
  {
    v16 = &OBJC_IVAR___UICollectionViewTableLayout__preferredAttributesCache;
    if (vabdd_f64(v11, v13) > 2.22044605e-16)
      -[UITableViewRowData setHeight:forRowAtIndexPath:]((uint64_t)self->_rowData, v9, v11);
LABEL_8:
    objc_msgSend(*(id *)((char *)&self->super.super.isa + *v16), "addObject:", v9);
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "representedElementCategory") == 1)
  {
    objc_msgSend(v6, "representedElementKind");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("UICollectionElementKindSectionHeader"));

    if (v15)
    {
      v16 = &OBJC_IVAR___UICollectionViewTableLayout__headerPreferredAttributesCache;
      if (vabdd_f64(v11, v13) > 2.22044605e-16)
        -[UITableViewRowData setHeight:forHeaderInSection:]((uint64_t)self->_rowData, objc_msgSend(v9, "section"), v11);
    }
    else
    {
      objc_msgSend(v6, "representedElementKind");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("UICollectionElementKindSectionFooter"));

      if (!v19)
        goto LABEL_9;
      v16 = &OBJC_IVAR___UICollectionViewTableLayout__footerPreferredAttributesCache;
      if (vabdd_f64(v11, v13) > 2.22044605e-16)
        -[UITableViewRowData setHeight:forFooterInSection:]((uint64_t)self->_rowData, objc_msgSend(v9, "section"), v11);
    }
    goto LABEL_8;
  }
LABEL_9:
  -[UICollectionViewTableLayout _invalidateIndexPathsBelowIndexPath:withInvalidationContext:](self, "_invalidateIndexPathsBelowIndexPath:withInvalidationContext:", v9, v8);
  -[UICollectionViewTableLayoutInvalidationContext setSkipSectionInvalidation:](v8, "setSkipSectionInvalidation:", 1);

  return v8;
}

- (BOOL)_wantsBandSelectionVisualsInSection:(int64_t)a3
{
  return 0;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  BOOL v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  char v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[2];
  _BYTE v33[128];
  uint64_t v34;
  CGRect v35;
  CGRect v36;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v34 = *MEMORY[0x1E0C80C00];
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v17 = CGRectGetWidth(v35);
  v36.origin.x = v10;
  v36.origin.y = v12;
  v36.size.width = v14;
  v36.size.height = v16;
  if (v17 != CGRectGetWidth(v36))
    return 1;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v32[0] = CFSTR("UICollectionElementKindSectionHeader");
  v32[1] = CFSTR("UICollectionElementKindSectionFooter");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (-[NSSet containsObject:](self->_floatingElementKinds, "containsObject:", v24))
        {
          -[UICollectionViewLayout collectionView](self, "collectionView");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "_hasRegisteredClassOrNibForSupplementaryViewOfKind:", v24);

          if ((v26 & 1) != 0)
          {
            v18 = 1;
            goto LABEL_14;
          }
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v21)
        continue;
      break;
    }
  }
  v18 = 0;
LABEL_14:

  return v18;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  CGFloat x;
  CGFloat v5;
  CGFloat width;
  CGFloat height;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  CGFloat v38;
  CGFloat y;
  unint64_t v40;
  uint64_t v41;
  CGFloat v42;
  uint64_t v43;
  CGFloat obja;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _QWORD v51[2];
  _BYTE v52[128];
  uint64_t v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v53 = *MEMORY[0x1E0C80C00];
  v50.receiver = self;
  v50.super_class = (Class)UICollectionViewTableLayout;
  x = a3.origin.x;
  v38 = a3.origin.x;
  y = a3.origin.y;
  v5 = a3.origin.y;
  width = a3.size.width;
  v42 = a3.size.width;
  obja = a3.size.height;
  height = a3.size.height;
  -[UICollectionViewLayout invalidationContextForBoundsChange:](&v50, sel_invalidationContextForBoundsChange_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v54.origin.x = v11;
  v54.origin.y = v13;
  v54.size.width = v15;
  v54.size.height = v17;
  v58.origin.x = x;
  v58.origin.y = v5;
  v58.size.width = width;
  v58.size.height = height;
  v55 = CGRectUnion(v54, v58);
  v18 = v55.origin.x;
  v19 = v55.origin.y;
  v20 = v55.size.width;
  v21 = v55.size.height;
  -[UICollectionViewTableLayout _contentInset](self, "_contentInset");
  v40 = -[UICollectionViewTableLayout _sectionRangeForBounds:](self, "_sectionRangeForBounds:", v18 + v25, v19 + v22, v20 - (v25 + v23), v21 - (v22 + v24));
  v41 = v26;
  v56.origin.x = v11;
  v56.origin.y = v13;
  v56.size.width = v15;
  v56.size.height = v17;
  v27 = CGRectGetWidth(v56);
  v57.origin.x = v38;
  v57.origin.y = y;
  v57.size.width = v42;
  v57.size.height = obja;
  if (v27 != CGRectGetWidth(v57))
    objc_msgSend(v8, "_setInvalidateEverything:", 1);
  if (v41)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v51[0] = CFSTR("UICollectionElementKindSectionHeader");
    v51[1] = CFSTR("UICollectionElementKindSectionFooter");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v47;
      do
      {
        v31 = 0;
        v43 = v29;
        do
        {
          if (*(_QWORD *)v47 != v30)
            objc_enumerationMutation(obj);
          v32 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v31);
          if (-[NSSet containsObject:](self->_floatingElementKinds, "containsObject:", v32))
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v41;
            v35 = v40;
            if (v40 < v40 + v41)
            {
              do
              {
                if (-[UICollectionViewTableLayout _shouldHaveViewForElementOfKind:atSection:useRowData:](self, "_shouldHaveViewForElementOfKind:atSection:useRowData:", v32, v35, 1))
                {
                  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v35);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "addObject:", v36);

                }
                ++v35;
                --v34;
              }
              while (v34);
            }
            if (objc_msgSend(v33, "count"))
              objc_msgSend(v8, "invalidateSupplementaryElementsOfKind:atIndexPaths:", v32, v33);

            v29 = v43;
          }
          ++v31;
        }
        while (v31 != v29);
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      }
      while (v29);
    }

  }
  return v8;
}

- (id)invalidationContextForInteractivelyMovingItems:(id)a3 withTargetPosition:(CGPoint)a4 previousIndexPaths:(id)a5 previousPosition:(CGPoint)a6
{
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UICollectionViewTableLayout;
  -[UICollectionViewLayout invalidationContextForInteractivelyMovingItems:withTargetPosition:previousIndexPaths:previousPosition:](&v8, sel_invalidationContextForInteractivelyMovingItems_withTargetPosition_previousIndexPaths_previousPosition_, a3, a5, a4.x, a4.y, a6.x, a6.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setInvalidateDataSourceCounts:", 1);
  return v6;
}

- (id)_invalidationContextForUpdatedLayoutMargins:(UIEdgeInsets)a3
{
  double right;
  CGFloat bottom;
  double left;
  CGFloat top;
  void *v8;
  void *v9;
  UIEdgeInsets *p_previousLayoutMargins;
  objc_super v12;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v12.receiver = self;
  v12.super_class = (Class)UICollectionViewTableLayout;
  -[UICollectionViewLayout _invalidationContextForUpdatedLayoutMargins:](&v12, sel__invalidationContextForUpdatedLayoutMargins_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  p_previousLayoutMargins = &self->_previousLayoutMargins;
  if (vabdd_f64(p_previousLayoutMargins->left, left) > 2.22044605e-16
    || vabdd_f64(p_previousLayoutMargins->right, right) > 2.22044605e-16)
  {
    objc_msgSend(v8, "_setInvalidateEverything:", 1);
  }
  p_previousLayoutMargins->top = top;
  p_previousLayoutMargins->left = left;
  p_previousLayoutMargins->bottom = bottom;
  p_previousLayoutMargins->right = right;
  return v9;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  objc_super v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "invalidateEverything") & 1) == 0
    && (objc_msgSend(v4, "invalidateDataSourceCounts") & 1) == 0
    && !objc_msgSend(v4, "invalidateTableLayoutDelegateMetrics"))
  {
    v13 = objc_msgSend(v4, "skipSectionInvalidation");
    v14 = MEMORY[0x1E0C809B0];
    if ((v13 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      objc_msgSend(v4, "invalidatedItemIndexPaths");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v27 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend(v15, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "section"));
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        }
        while (v18);
      }

      v25[0] = v14;
      v25[1] = 3221225472;
      v25[2] = __59__UICollectionViewTableLayout_invalidateLayoutWithContext___block_invoke;
      v25[3] = &unk_1E16B2100;
      v25[4] = self;
      objc_msgSend(v15, "enumerateIndexesUsingBlock:", v25);

    }
    objc_msgSend(v4, "invalidatedSupplementaryIndexPaths");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v14;
    v23[1] = 3221225472;
    v23[2] = __59__UICollectionViewTableLayout_invalidateLayoutWithContext___block_invoke_2;
    v23[3] = &unk_1E16BC968;
    v23[4] = self;
    v24 = v4;
    objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v23);

    goto LABEL_19;
  }
  -[UITableViewRowData invalidateAllSections]((uint64_t)self->_rowData);
  if (self->_deletedIndexPath)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v4, "_updateItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v31;
LABEL_7:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v9);
        if (objc_msgSend(v10, "updateAction") == 1)
        {
          objc_msgSend(v10, "indexPathBeforeUpdate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqual:", self->_deletedIndexPath);

          if ((v12 & 1) != 0)
            break;
        }
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
          if (v7)
            goto LABEL_7;
          goto LABEL_14;
        }
      }

      if (!objc_msgSend(v4, "invalidateEverything"))
        goto LABEL_18;
      goto LABEL_17;
    }
LABEL_14:

  }
  objc_msgSend(v4, "invalidateEverything");
LABEL_17:
  -[UISwipeActionController resetSwipedItemAnimated:completion:](self->_swipeActionController, "resetSwipedItemAnimated:completion:", 0, 0);
LABEL_18:
  -[NSMutableArray removeAllObjects](self->_indexPathCache, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_preferredAttributesCache, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_headerPreferredAttributesCache, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_footerPreferredAttributesCache, "removeAllObjects");
LABEL_19:
  v22.receiver = self;
  v22.super_class = (Class)UICollectionViewTableLayout;
  -[UICollectionViewLayout invalidateLayoutWithContext:](&v22, sel_invalidateLayoutWithContext_, v4);

}

uint64_t __59__UICollectionViewTableLayout_invalidateLayoutWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return -[UITableViewRowData invalidateSection:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 528), a2);
}

void __59__UICollectionViewTableLayout_invalidateLayoutWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double *v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t i;
  void *v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[2];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("UICollectionElementKindGlobalHeader")))
  {
    v27 = v3;
    objc_msgSend(*(id *)(a1 + 32), "_heightForTableHeader");
    v5 = v4;
    v6 = -[UITableViewRowData heightForTableHeaderView](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 528));
    -[UITableViewRowData tableHeaderHeightDidChangeToHeight:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 528), v5);
    v7 = *(void **)(a1 + 40);
    v8 = *(double **)(*(_QWORD *)(a1 + 32) + 528);
    v9 = -[UITableViewRowData rectForTable]((uint64_t)v8);
    -[UITableViewRowData indexPathsForRowsInRect:](v8, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidateItemsAtIndexPaths:", v13);

    v14 = objc_msgSend(*(id *)(a1 + 32), "_numberOfSections");
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34[0] = CFSTR("UICollectionElementKindSectionHeader");
    v34[1] = CFSTR("UICollectionElementKindSectionFooter");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v31;
      do
      {
        v18 = 0;
        v28 = v16;
        do
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v18);
          if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "containsObject:", v19))
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              for (i = 0; i != v14; ++i)
              {
                if (objc_msgSend(*(id *)(a1 + 32), "_shouldHaveViewForElementOfKind:atSection:useRowData:", v19, i, 1))
                {
                  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", i);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "addObject:", v22);

                }
              }
            }
            if (objc_msgSend(v20, "count"))
              objc_msgSend(*(id *)(a1 + 40), "invalidateSupplementaryElementsOfKind:atIndexPaths:", v19, v20);

            v16 = v28;
          }
          ++v18;
        }
        while (v18 != v16);
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v16);
    }
    v23 = v5 - v6;

    v3 = v27;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("UICollectionElementKindGlobalFooter")))
      goto LABEL_24;
    objc_msgSend(*(id *)(a1 + 32), "_heightForTableFooter");
    v25 = v24;
    v23 = v24 - -[UITableViewRowData heightForTableFooterView](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 528));
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528);
    if (v26)
      *(double *)(v26 + 104) = v25;
  }
  if (v23 != 0.0)
    objc_msgSend(*(id *)(a1 + 40), "setContentSizeAdjustment:", *MEMORY[0x1E0C9D820], v23);
LABEL_24:

}

- (id)_layoutAttributesForCellWithIndexPath:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  _BOOL8 v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass"), "layoutAttributesForCellWithIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "applyValuesFromAttributes:toAttributes:valueOptions:", self, v5, 3);
  v6 = -[UICollectionViewTableLayout _editingStyleForRowAtIndexPath:](self, "_editingStyleForRowAtIndexPath:", v4);
  v7 = -[UICollectionViewTableLayout _shouldIndentWhileEditingForRowAtIndexPath:](self, "_shouldIndentWhileEditingForRowAtIndexPath:", v4);
  v8 = -[UICollectionViewTableLayout _canReorderRowAtIndexPath:](self, "_canReorderRowAtIndexPath:", v4);
  objc_msgSend(v5, "setAccessoryType:", 0);
  objc_msgSend(v5, "setSectionLocation:", -[UITableViewRowData sectionLocationForRow:inSection:]((uint64_t)self->_rowData, objc_msgSend(v4, "row"), objc_msgSend(v4, "section")));
  objc_msgSend(v5, "setEditingStyle:", v6);
  objc_msgSend(v5, "setShouldIndentWhileEditing:", v7);
  objc_msgSend(v5, "setShowsReorderControl:", v8);
  objc_msgSend(v5, "setLayoutMarginsFollowReadableWidth:", -[UICollectionViewTableLayout cellLayoutMarginsFollowReadableWidth](self, "cellLayoutMarginsFollowReadableWidth"));
  objc_msgSend(v5, "setInsetsContentViewsToSafeArea:", -[UICollectionViewTableLayout insetsContentViewsToSafeArea](self, "insetsContentViewsToSafeArea"));
  objc_msgSend(v5, "setSeparatorInsetIsRelativeToCellEdges:", -[UICollectionViewTableLayout separatorInsetIsRelativeToCellEdges](self, "separatorInsetIsRelativeToCellEdges"));
  -[UICollectionViewTableLayout _constants](self, "_constants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultLeadingCellMarginWidthForTableView:", self);
  objc_msgSend(v5, "setDefaultLeadingCellMarginWidth:");

  -[UICollectionViewTableLayout _constants](self, "_constants");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defaultTrailingCellMarginWidthForTableView:", self);
  objc_msgSend(v5, "setDefaultTrailingCellMarginWidth:");

  -[UICollectionViewTableLayout _indexBarExtentFromEdge](self, "_indexBarExtentFromEdge");
  objc_msgSend(v5, "setIndexBarExtentFromEdge:");
  -[UICollectionViewTableLayout _sectionContentInset](self, "_sectionContentInset");
  objc_msgSend(v5, "setBackgroundInset:");
  objc_msgSend(v5, "setIndentationLevel:", -[UICollectionViewTableLayout _indentationLevelForRowAtIndexPath:](self, "_indentationLevelForRowAtIndexPath:", v4));
  objc_msgSend(v5, "setDrawsSeparatorAtTopOfSection:", -[UICollectionViewTableLayout _shouldDrawSeparatorAtTop:ofSection:](self, "_shouldDrawSeparatorAtTop:ofSection:", 1, objc_msgSend(v4, "section")));
  objc_msgSend(v5, "setDrawsSeparatorAtBottomOfSection:", -[UICollectionViewTableLayout _shouldDrawSeparatorAtTop:ofSection:](self, "_shouldDrawSeparatorAtTop:ofSection:", 0, objc_msgSend(v4, "section")));
  v11 = -[NSMutableSet containsObject:](self->_preferredAttributesCache, "containsObject:", v4);

  objc_msgSend(v5, "setPreferredAttributesCached:", v11);
  return v5;
}

- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UICollectionViewTableLayout;
  -[UICollectionViewLayout layoutAttributesForInteractivelyMovingItemAtIndexPath:withTargetPosition:](&v9, sel_layoutAttributesForInteractivelyMovingItemAtIndexPath_withTargetPosition_, a3, a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSeparatorStyle:", 0);
  +[UIColor clearColor](UIColor, "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  -[UICollectionViewTableLayout _constants](self, "_constants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultAlphaForReorderingCell");
  objc_msgSend(v5, "setAlpha:");

  return v5;
}

- (id)_layoutAttributesForViewElementKind:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  UITableViewRowData *rowData;
  double v10;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("UICollectionElementKindGlobalHeader")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("UICollectionElementKindGlobalFooter")))
  {
    v5 = (void *)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass");
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v4, "isEqualToString:", CFSTR("UICollectionElementKindGlobalHeader"));
    rowData = self->_rowData;
    if (v8)
      v10 = -[UITableViewRowData rectForTableHeaderView]((uint64_t)rowData);
    else
      v10 = -[UITableViewRowData rectForTableFooterView]((uint64_t)rowData);
    objc_msgSend(v7, "setFrame:", v10);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_layoutAttributesForSectionElementKind:(id)a3 atSection:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  int v13;
  UITableViewRowData *rowData;
  uint64_t v15;
  int *v16;

  v6 = a3;
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("UICollectionElementKindSectionHeader"));
  if (((v7 & 1) != 0
     || objc_msgSend(v6, "isEqualToString:", CFSTR("UICollectionElementKindSectionFooter")))
    && -[UICollectionViewTableLayout _numberOfSections](self, "_numberOfSections") > a4)
  {
    v8 = (void *)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass");
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setIsHeader:", v7);
    -[UICollectionViewTableLayout _headerFooterLeadingMarginWidthIsHeader:isFirstSection:](self, "_headerFooterLeadingMarginWidthIsHeader:isFirstSection:", v7, a4 == 0);
    objc_msgSend(v10, "setMargins:", 0.0, v11, 0.0, v11);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "isHeader");
    rowData = self->_rowData;
    if (v13)
    {
      objc_msgSend(v10, "setMaxTitleWidth:", -[UITableViewRowData maxHeaderTitleWidthForSection:]((uint64_t)rowData, a4));
      v15 = -[UITableViewRowData headerAlignmentForSection:]((uint64_t)self->_rowData, a4);
      v16 = &OBJC_IVAR___UICollectionViewTableLayout__headerPreferredAttributesCache;
    }
    else
    {
      objc_msgSend(v10, "setMaxTitleWidth:", -[UITableViewRowData maxFooterTitleWidthForSection:]((uint64_t)rowData, a4));
      v15 = -[UITableViewRowData footerAlignmentForSection:]((uint64_t)self->_rowData, a4);
      v16 = &OBJC_IVAR___UICollectionViewTableLayout__footerPreferredAttributesCache;
    }
    objc_msgSend(v10, "setTextAlignment:", v15);
    objc_msgSend(v10, "setPreferredAttributesCached:", objc_msgSend(*(id *)((char *)&self->super.super.isa + *v16), "containsObject:", v12));
    objc_msgSend(v10, "setZIndex:", 1);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_layoutAttributesForSeparatorWithIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass"), "layoutAttributesForDecorationViewOfKind:withIndexPath:", CFSTR("UICollectionElementKindSeparator"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UICollectionViewTableLayout separatorColor](self, "separatorColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSeparatorColor:", v6);

  objc_msgSend(v5, "setSeparatorStyle:", -[UICollectionViewTableLayout separatorStyle](self, "separatorStyle"));
  -[UICollectionViewTableLayout separatorEffect](self, "separatorEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSeparatorEffect:", v7);

  return v5;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double memoizedScale;
  double v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  double x;
  double y;
  double width;
  double height;
  void *v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  void *v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  void *v59;
  double v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  CGFloat MaxY;
  CGFloat rect;
  CGFloat v77;
  CGFloat v78;
  double v79;
  uint64_t v80;
  id obj;
  uint64_t v82;
  double v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[2];
  _BYTE v90[128];
  uint64_t v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;

  v91 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UICollectionViewTableLayout _numberOfSections](self, "_numberOfSections");
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v77 = v8;
  v78 = v7;
  rect = v9;
  v79 = v10;

  if (v5 >= 1)
  {
    v11 = -[UITableViewRowData globalRowsInRect:canGuess:](&self->_rowData->super.isa, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    if (v11 < v11 + v12)
    {
      v13 = v11;
      v14 = v12;
      do
      {
        -[UITableViewRowData indexPathForRowAtGlobalRow:](&self->_rowData->super.isa, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollectionViewTableLayout _layoutAttributesForCellWithIndexPath:](self, "_layoutAttributesForCellWithIndexPath:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](&self->_rowData->super.isa, v13, 1);
        v21 = v17;
        v22 = v18;
        v23 = v19;
        if (fabs(self->_memoizedScale) >= 2.22044605e-16)
          memoizedScale = self->_memoizedScale;
        else
          memoizedScale = 1.0;
        v25 = v20;
        v26 = round(CGRectGetMinX(*(CGRect *)(&v17 - 1)) * memoizedScale) / memoizedScale;
        v92.origin.x = v20;
        v92.origin.y = v21;
        v92.size.width = v22;
        v92.size.height = v23;
        v27 = round(CGRectGetMinY(v92) * memoizedScale) / memoizedScale;
        v93.origin.x = v20;
        v93.origin.y = v21;
        v93.size.width = v22;
        v93.size.height = v23;
        v28 = round(memoizedScale * CGRectGetWidth(v93)) / memoizedScale;
        v94.origin.x = v20;
        v94.origin.y = v21;
        v94.size.width = v22;
        v94.size.height = v23;
        objc_msgSend(v16, "setFrame:", v26, v27, v28, round(memoizedScale * CGRectGetHeight(v94)) / memoizedScale);
        objc_msgSend(v4, "addObject:", v16);

        ++v13;
        --v14;
      }
      while (v14);
    }
    v29 = -[UICollectionViewTableLayout _sectionRangeForBounds:](self, "_sectionRangeForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v80 = v30;
    -[UICollectionViewTableLayout _visibleRect](self, "_visibleRect");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89[0] = CFSTR("UICollectionElementKindSectionHeader");
    v89[1] = CFSTR("UICollectionElementKindSectionFooter");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 2);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v90, 16);
    if (v39)
    {
      v40 = v39;
      v82 = *(_QWORD *)v86;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v86 != v82)
            objc_enumerationMutation(obj);
          if (v29 < v29 + v80)
          {
            v42 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * i);
            v43 = v80;
            v44 = v29;
            do
            {
              if (-[UICollectionViewTableLayout _shouldHaveViewForElementOfKind:atSection:useRowData:](self, "_shouldHaveViewForElementOfKind:atSection:useRowData:", v42, v44, 1))
              {
                LOBYTE(v84) = 0;
                -[UICollectionViewTableLayout _frameForSectionElementKind:atSection:visibleRect:floating:canGuess:](self, "_frameForSectionElementKind:atSection:visibleRect:floating:canGuess:", v42, v44, &v84, 1, v32, v34, v36, v38);
                x = v95.origin.x;
                y = v95.origin.y;
                width = v95.size.width;
                height = v95.size.height;
                if (CGRectIntersectsRect(v95, a3))
                {
                  -[UICollectionViewTableLayout _layoutAttributesForSectionElementKind:atSection:](self, "_layoutAttributesForSectionElementKind:atSection:", v42, v44);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "setFrame:", x, y, width, height);
                  objc_msgSend(v49, "setFloating:", LOBYTE(v84));
                  objc_msgSend(v4, "addObject:", v49);

                }
              }
              ++v44;
              --v43;
            }
            while (v43);
          }
        }
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v90, 16);
      }
      while (v40);
    }

  }
  v96.origin.x = -[UITableViewRowData rectForTableHeaderView]((uint64_t)self->_rowData);
  v50 = v96.origin.x;
  v51 = v96.origin.y;
  v52 = v96.size.width;
  v53 = v96.size.height;
  if (!CGRectIsEmpty(v96))
  {
    v100.origin.x = v50;
    v100.origin.y = v51;
    v100.size.width = v52;
    v100.size.height = v53;
    if (CGRectIntersectsRect(a3, v100))
    {
      if (-[UICollectionViewTableLayout _shouldHaveGlobalViewForElementOfKind:](self, "_shouldHaveGlobalViewForElementOfKind:", CFSTR("UICollectionElementKindGlobalHeader")))
      {
        -[UICollectionViewTableLayout _layoutAttributesForViewElementKind:](self, "_layoutAttributesForViewElementKind:", CFSTR("UICollectionElementKindGlobalHeader"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (v54)
          objc_msgSend(v4, "addObject:", v54);

      }
    }
  }
  v97.origin.x = -[UITableViewRowData rectForTableFooterView]((uint64_t)self->_rowData);
  v55 = v97.origin.x;
  v56 = v97.origin.y;
  v57 = v97.size.width;
  v58 = v97.size.height;
  if (!CGRectIsEmpty(v97))
  {
    v101.origin.x = v55;
    v101.origin.y = v56;
    v101.size.width = v57;
    v101.size.height = v58;
    if (CGRectIntersectsRect(a3, v101))
    {
      if (-[UICollectionViewTableLayout _shouldHaveGlobalViewForElementOfKind:](self, "_shouldHaveGlobalViewForElementOfKind:", CFSTR("UICollectionElementKindGlobalFooter")))
      {
        -[UICollectionViewTableLayout _layoutAttributesForViewElementKind:](self, "_layoutAttributesForViewElementKind:", CFSTR("UICollectionElementKindGlobalFooter"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        if (v59)
          objc_msgSend(v4, "addObject:", v59);

      }
    }
  }
  v60 = -[UITableViewRowData heightForTable]((uint64_t)self->_rowData);
  v98.origin.y = v77;
  v98.origin.x = v78;
  v98.size.width = rect;
  v98.size.height = v79;
  if (v60 < CGRectGetHeight(v98))
  {
    if (self->_separatorStyle)
    {
      v84 = 0.0;
      if (-[UICollectionViewTableLayout _shouldDisplayExtraSeparatorsAtOffset:](self, "_shouldDisplayExtraSeparatorsAtOffset:", &v84))
      {
        v61 = floor(v79 * 1.5);
        if (CGRectGetMaxY(*MEMORY[0x1E0C9D648]) < v61)
        {
          v62 = 0;
          do
          {
            v63 = v62 + 1;
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            -[UICollectionViewTableLayout _extraSeparatorFrameForIndexPath:offset:](self, "_extraSeparatorFrameForIndexPath:offset:", v64, v84);
            v66 = v65;
            v68 = v67;
            v70 = v69;
            v72 = v71;
            -[UICollectionViewTableLayout _layoutAttributesForSeparatorWithIndexPath:](self, "_layoutAttributesForSeparatorWithIndexPath:", v64);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "setFrame:", v66, v68, v70, v72);
            objc_msgSend(v4, "addObject:", v73);

            v99.origin.x = v66;
            v99.origin.y = v68;
            v99.size.width = v70;
            v99.size.height = v72;
            MaxY = CGRectGetMaxY(v99);
            v62 = v63;
          }
          while (MaxY < v61);
        }
      }
    }
  }
  return v4;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  UITableViewRowData *rowData;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double memoizedScale;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v4 = a3;
  -[UICollectionViewTableLayout _layoutAttributesForCellWithIndexPath:](self, "_layoutAttributesForCellWithIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  rowData = self->_rowData;
  v7 = objc_msgSend(v4, "row");
  v8 = objc_msgSend(v4, "section");

  v12 = -[UITableViewRowData rectForRow:inSection:heightCanBeGuessed:]((uint64_t)rowData, v7, v8, 0);
  v13 = v9;
  v14 = v10;
  v15 = v11;
  if (fabs(self->_memoizedScale) >= 2.22044605e-16)
    memoizedScale = self->_memoizedScale;
  else
    memoizedScale = 1.0;
  v17 = v12;
  v18 = round(CGRectGetMinX(*(CGRect *)(&v9 - 1)) * memoizedScale) / memoizedScale;
  v22.origin.x = v12;
  v22.origin.y = v13;
  v22.size.width = v14;
  v22.size.height = v15;
  v19 = round(CGRectGetMinY(v22) * memoizedScale) / memoizedScale;
  v23.origin.x = v12;
  v23.origin.y = v13;
  v23.size.width = v14;
  v23.size.height = v15;
  v20 = round(memoizedScale * CGRectGetWidth(v23)) / memoizedScale;
  v24.origin.x = v12;
  v24.origin.y = v13;
  v24.size.width = v14;
  v24.size.height = v15;
  objc_msgSend(v5, "setFrame:", v18, v19, v20, round(memoizedScale * CGRectGetHeight(v24)) / memoizedScale);
  return v5;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  unsigned __int8 v11;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("UICollectionElementKindSectionHeader")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("UICollectionElementKindSectionFooter")))
  {
    -[UICollectionViewTableLayout _layoutAttributesForSectionElementKind:atSection:](self, "_layoutAttributesForSectionElementKind:atSection:", v6, objc_msgSend(v7, "section"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v11 = 0;
      v9 = objc_msgSend(v7, "section");
      -[UICollectionViewTableLayout _visibleRect](self, "_visibleRect");
      -[UICollectionViewTableLayout _frameForSectionElementKind:atSection:visibleRect:floating:canGuess:](self, "_frameForSectionElementKind:atSection:visibleRect:floating:canGuess:", v6, v9, &v11, 0);
      objc_msgSend(v8, "setFrame:");
      objc_msgSend(v8, "setFloating:", v11);
    }
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("UICollectionElementKindGlobalHeader")) & 1) != 0
         || objc_msgSend(v6, "isEqualToString:", CFSTR("UICollectionElementKindGlobalFooter")))
  {
    -[UICollectionViewTableLayout _layoutAttributesForViewElementKind:](self, "_layoutAttributesForViewElementKind:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  double v9;

  v6 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("UICollectionElementKindSeparator")))
  {
    -[UICollectionViewTableLayout _layoutAttributesForSeparatorWithIndexPath:](self, "_layoutAttributesForSeparatorWithIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0.0;
    if (-[UICollectionViewTableLayout _shouldDisplayExtraSeparatorsAtOffset:](self, "_shouldDisplayExtraSeparatorsAtOffset:", &v9))
    {
      -[UICollectionViewTableLayout _extraSeparatorFrameForIndexPath:offset:](self, "_extraSeparatorFrameForIndexPath:offset:", v6, v9);
      objc_msgSend(v7, "setFrame:");
    }
    else
    {
      objc_msgSend(v7, "setAlpha:", 0.0);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_setShowsAdditionalSeparators:(BOOL)a3
{
  self->_showsAdditionalSeparators = a3;
  -[UICollectionViewLayout invalidateLayout](self, "invalidateLayout");
}

- (BOOL)_shouldDrawThickSeparators
{
  int v2;
  NSString *v3;
  BOOL IsAccessibilityCategory;

  v2 = dyld_program_sdk_at_least();
  if (v2)
  {
    objc_msgSend((id)UIApp, "preferredContentSizeCategory");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

    LOBYTE(v2) = IsAccessibilityCategory;
  }
  return v2;
}

- (BOOL)_shouldApplyReadableWidthInsets
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[UICollectionViewTableLayout cellLayoutMarginsFollowReadableWidth](self, "cellLayoutMarginsFollowReadableWidth");
  if (v3)
  {
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_safeAreaWidthExceedsReadableWidth");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (CGRect)_extraSeparatorFrameForIndexPath:(id)a3 offset:(double)a4
{
  UITableViewRowData *rowData;
  id v6;
  double v7;
  unint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  int v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double left;
  double right;
  void *v27;
  double v28;
  double v29;
  _BOOL4 v30;
  BOOL v31;
  BOOL v32;
  int v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat Width;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGRect v51;
  CGRect result;

  rowData = self->_rowData;
  v6 = a3;
  v7 = _UITableRowHeightForExtraSeparators(self, rowData, 0.0);
  v8 = objc_msgSend(v6, "indexAtPosition:", 0);

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v48 = v11;
  v49 = v10;
  v46 = v13;
  v47 = v12;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "_shouldReverseLayoutDirection");

  -[UICollectionViewTableLayout _indexBarExtentFromEdge](self, "_indexBarExtentFromEdge");
  v17 = v16;
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "directionalLayoutMargins");
  v44 = v19;
  v21 = v20;

  v22 = 1.0;
  if (!-[UICollectionViewTableLayout _shouldDrawThickSeparators](self, "_shouldDrawThickSeparators"))
  {
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_currentScreenScale");
    v22 = 1.0 / v24;

  }
  left = self->_separatorInset.left;
  right = self->_separatorInset.right;
  -[UICollectionViewTableLayout _constants](self, "_constants", v44);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "defaultMarginWidthForTableView:", self);
  v29 = v28;

  v30 = -[UICollectionViewTableLayout _shouldApplyReadableWidthInsets](self, "_shouldApplyReadableWidthInsets");
  v31 = -[UICollectionViewTableLayout separatorInsetIsRelativeToCellEdges](self, "separatorInsetIsRelativeToCellEdges");
  v32 = v31;
  if (left != -1.0)
  {
    v29 = left;
    if (!v31)
    {
      v33 = dyld_program_sdk_at_least();
      v34 = -0.0;
      if (v30 | v33)
        v34 = v45;
      v29 = left + v34;
    }
  }
  v35 = v17 + right;
  v36 = fmax(v21, v17) + right;
  if (v30)
    v35 = v36;
  if (v32)
    v35 = right;
  v37 = fmax(v17, v21);
  if (!v30)
    v37 = v17;
  if (right == -1.0)
    v38 = v37;
  else
    v38 = v35;
  v51.origin.y = v48;
  v51.origin.x = v49;
  v51.size.height = v46;
  v51.size.width = v47;
  Width = CGRectGetWidth(v51);
  v40 = v7 + v7 * (double)v8 + a4 - v22;
  v41 = Width - (v29 + v38);
  if (v15)
    v42 = v38;
  else
    v42 = v29;
  v43 = v22;
  result.size.height = v43;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v42;
  return result;
}

- (BOOL)_shouldDisplayExtraSeparatorsAtOffset:(double *)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  UITableViewRowData *rowData;
  int64_t numSections;
  CGRect v11;
  CGRect v12;

  if (self->_showsAdditionalSeparators)
  {
    v5 = (uint64_t)-[UITableViewRowData numberOfRows]((uint64_t)self->_rowData);
    if (v5 < 1)
    {
      v7 = 0;
    }
    else
    {
      -[UITableViewRowData indexPathForRowAtGlobalRow:](&self->_rowData->super.isa, v5 - 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "section");

    }
    rowData = self->_rowData;
    if (rowData)
      numSections = rowData->_numSections;
    else
      numSections = 0;
    if (v7 >= numSections)
    {
LABEL_11:
      v12.origin.x = -[UITableViewRowData rectForTableFooterView]((uint64_t)rowData);
      *a3 = CGRectGetMaxY(v12);
      return 1;
    }
    while (1)
    {
      v11.origin.x = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:]((uint64_t)self->_rowData, v7, 1);
      if (CGRectGetHeight(v11) > 0.0)
        break;
      if (numSections == ++v7)
      {
        rowData = self->_rowData;
        goto LABEL_11;
      }
    }
  }
  return 0;
}

- (void)setSeparatorInsetIsRelativeToCellEdges:(BOOL)a3
{
  if (self->_separatorInsetIsRelativeToCellEdges != a3)
  {
    self->_separatorInsetIsRelativeToCellEdges = a3;
    -[UICollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setInsetsContentViewsToSafeArea:(BOOL)a3
{
  if (self->_insetsContentViewsToSafeArea != a3)
  {
    self->_insetsContentViewsToSafeArea = a3;
    -[UICollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (CGRect)_visibleRect
{
  void *v3;
  double v4;
  double v5;
  double v6;
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UICollectionViewTableLayout _contentInset](self, "_contentInset");
  v13 = v5 + v12;
  v15 = v7 + v14;
  v17 = v9 - (v12 + v16);
  v19 = v11 - (v14 + v18);

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UICollectionViewTableLayout;
  -[UICollectionViewLayout prepareForCollectionViewUpdates:](&v20, sel_prepareForCollectionViewUpdates_, v4);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewTableLayout setDeleteIndexPaths:](self, "setDeleteIndexPaths:", v5);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewTableLayout setInsertIndexPaths:](self, "setInsertIndexPaths:", v6);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "updateAction", (_QWORD)v16) == 1)
        {
          -[UICollectionViewTableLayout deleteIndexPaths](self, "deleteIndexPaths");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "indexPathBeforeUpdate");
          v14 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (objc_msgSend(v12, "updateAction"))
            continue;
          -[UICollectionViewTableLayout insertIndexPaths](self, "insertIndexPaths");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "indexPathAfterUpdate");
          v14 = objc_claimAutoreleasedReturnValue();
        }
        v15 = (void *)v14;
        objc_msgSend(v13, "addObject:", v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v7, "count"))
    -[NSMutableArray removeAllObjects](self->_indexPathCache, "removeAllObjects");

}

- (void)finalizeCollectionViewUpdates
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewTableLayout;
  -[UICollectionViewLayout finalizeCollectionViewUpdates](&v3, sel_finalizeCollectionViewUpdates);
  -[UICollectionViewTableLayout setDeleteIndexPaths:](self, "setDeleteIndexPaths:", 0);
  -[UICollectionViewTableLayout setInsertIndexPaths:](self, "setInsertIndexPaths:", 0);
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  UICollectionViewTableLayout *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = self;
  v8.receiver = self;
  v8.super_class = (Class)UICollectionViewTableLayout;
  v4 = a3;
  -[UICollectionViewLayout finalLayoutAttributesForDisappearingItemAtIndexPath:](&v8, sel_finalLayoutAttributesForDisappearingItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy", v8.receiver, v8.super_class);

  LODWORD(v3) = -[NSIndexPath isEqual:](v3->_deletedIndexPath, "isEqual:", v4);
  if ((_DWORD)v3)
    objc_msgSend(v6, "setAlpha:", 1.0);
  return v6;
}

- (CGSize)collectionViewContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  v6 = -[UITableViewRowData heightForTable]((uint64_t)self->_rowData);
  v7 = v5;
  result.height = v6;
  result.width = v7;
  return result;
}

- (UIEdgeInsets)_preferredLayoutMargins
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  -[UICollectionViewTableLayout _constants](self, "_constants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultLayoutMarginsForTableView:", self);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)setSeparatorInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_separatorInset.left
    || a3.top != self->_separatorInset.top
    || a3.right != self->_separatorInset.right
    || a3.bottom != self->_separatorInset.bottom)
  {
    self->_separatorInset = a3;
    -[UICollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setSeparatorColor:(id)a3
{
  void *v3;
  UIColor *v6;
  UIColor **p_separatorColor;
  void *v8;
  void *v9;
  UIColor *v10;

  v6 = (UIColor *)a3;
  p_separatorColor = &self->_separatorColor;
  if (self->_separatorColor != v6)
  {
    v10 = v6;
    objc_storeStrong((id *)&self->_separatorColor, a3);
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[UICollectionViewLayout collectionView](self, "collectionView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_accessibilityHigherContrastTintColorForColor:", *p_separatorColor);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = *p_separatorColor;
    }
    objc_storeStrong((id *)&self->_darkenedSeparatorColor, v9);
    if (v8)
    {

    }
    -[UICollectionViewTableLayout _separatorColorChanged](self, "_separatorColorChanged");
    v6 = v10;
  }

}

- (UIColor)separatorColor
{
  int v3;
  uint64_t v4;

  v3 = _AXDarkenSystemColors();
  v4 = 15;
  if (!v3)
    v4 = 14;
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                            + OBJC_IVAR___UICollectionViewTableLayout__separatorInset[v4]));
}

- (void)setSeparatorStyle:(int64_t)a3
{
  if (self->_separatorStyle != a3)
  {
    self->_separatorStyle = a3;
    -[UICollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (UICollectionViewDelegateTableLayout)_delegateActual
{
  void *v2;
  void *v3;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_delegateActual");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UICollectionViewDelegateTableLayout *)v3;
}

- (UICollectionViewDelegateTableLayout)_delegateProxy
{
  void *v2;
  void *v3;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_delegateProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UICollectionViewDelegateTableLayout *)v3;
}

- (UICollectionViewDataSourceTableLayout)_dataSourceActual
{
  void *v2;
  void *v3;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_dataSourceActual");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UICollectionViewDataSourceTableLayout *)v3;
}

- (int64_t)_accessoryTypeForCell:(id)a3 forRowAtIndexPath:(id)a4
{
  if (a4)
    return objc_msgSend(a3, "accessoryType");
  else
    return 0;
}

- (BOOL)_canReorderRowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_canReorderItemAtIndexPath:", v4);

  return v6;
}

- (BOOL)_shouldIndentWhileEditingForRowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  if (v4)
  {
    -[UICollectionViewTableLayout _delegateActual](self, "_delegateActual");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[UICollectionViewTableLayout _delegateProxy](self, "_delegateProxy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionViewLayout collectionView](self, "collectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "collectionView:tableLayout:shouldIndentWhileEditingRowAtIndexPath:", v8, self, v4);

    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)_indentationLevelForRowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  -[UICollectionViewTableLayout _delegateActual](self, "_delegateActual");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[UICollectionViewTableLayout _delegateProxy](self, "_delegateProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "collectionView:tableLayout:indentationLevelForRowAtIndexPath:", v8, self, v4);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)_editingStyleForRowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  if (v4)
  {
    -[UICollectionViewTableLayout _delegateActual](self, "_delegateActual");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[UICollectionViewTableLayout _delegateProxy](self, "_delegateProxy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionViewLayout collectionView](self, "collectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "collectionView:tableLayout:editingStyleForRowAtIndexPath:", v8, self, v4);

    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_shouldDrawTopSeparatorDueToMergedBarForSectionAtIndex:(int64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  char v8;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;

  if (-[UICollectionViewTableLayout _tableStyle](self, "_tableStyle"))
    return 0;
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_shouldAdjustLayoutToDrawTopSeparator");

  if (!v6)
    return 0;
  -[UICollectionViewTableLayout _tableHeaderView](self, "_tableHeaderView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 || !-[UITableViewRowData numberOfRows]((uint64_t)self->_rowData))
    return 0;
  -[UITableViewRowData indexPathForRowAtGlobalRow:](&self->_rowData->super.isa, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && objc_msgSend(v10, "section") == a3)
  {
    if (a3 < 0)
    {
      v8 = 1;
    }
    else
    {
      v12 = 0;
      do
      {
        v13 = -[UICollectionViewTableLayout _shouldHaveHeaderViewForSection:](self, "_shouldHaveHeaderViewForSection:", v12);
        if (v13)
          break;
      }
      while (a3 != v12++);
      v8 = !v13;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_shouldDrawSeparatorAtTop:(BOOL)a3 ofSection:(int64_t)a4
{
  void *v6;
  BOOL v7;

  if (a3)
    return -[UICollectionViewTableLayout _shouldDrawTopSeparatorDueToMergedBarForSectionAtIndex:](self, "_shouldDrawTopSeparatorDueToMergedBarForSectionAtIndex:", a4);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", -[UICollectionViewTableLayout _numberOfRowsInSection:](self, "_numberOfRowsInSection:", a4) - 1, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = !-[UICollectionViewTableLayout _hasHeaderFooterBelowRowAtIndexPath:](self, "_hasHeaderFooterBelowRowAtIndexPath:", v6);

  return v7;
}

- (BOOL)_hasHeaderFooterBelowRowAtIndexPath:(id)a3
{
  uint64_t v5;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  CGRect v13;
  CGRect v14;

  v5 = objc_msgSend(a3, "section");
  v6 = -[UICollectionViewTableLayout _numberOfSections](self, "_numberOfSections");
  if (v5 >= v6)
    return 0;
  v7 = v6;
  v8 = objc_msgSend(a3, "row");
  if (v8 != -[UICollectionViewTableLayout _numberOfRowsInSection:](self, "_numberOfRowsInSection:", v5) - 1)
    return 0;
  v9 = 1;
  v13.origin.x = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:]((uint64_t)self->_rowData, v5, 1);
  if (CGRectGetHeight(v13) <= 0.0)
  {
    v10 = v5 + 1;
    do
    {
      if (v7 == v10)
        break;
      v14.origin.x = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:]((uint64_t)self->_rowData, v5, 1);
      if (CGRectGetHeight(v14) > 0.0)
        return v9;
      v11 = -[UICollectionViewTableLayout _numberOfRowsInSection:](self, "_numberOfRowsInSection:", v10++);
    }
    while (v11 < 1);
    return 0;
  }
  return v9;
}

- (CGRect)_frameForSectionElementKind:(id)a3 atSection:(int64_t)a4 visibleRect:(CGRect)a5 floating:(BOOL *)a6 canGuess:(BOOL)a7
{
  double height;
  CGFloat width;
  double y;
  CGFloat x;
  id v15;
  int v16;
  UITableViewRowData *rowData;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  BOOL v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  BOOL v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGRect result;
  CGRect v43;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = a3;
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("UICollectionElementKindSectionHeader"));
  rowData = self->_rowData;
  if (v16)
  {
    v18 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:]((uint64_t)rowData, a4, a7);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v25 = -[NSSet containsObject:](self->_floatingElementKinds, "containsObject:", v15);

    if (!v25)
      goto LABEL_10;
    v26 = -[UITableViewRowData floatingRectForHeaderInSection:visibleRect:heightCanBeGuessed:outIsFloating:]((uint64_t)self->_rowData, a4, a7, 0, x, y, width, height);
  }
  else
  {
    v18 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:]((uint64_t)rowData, a4, a7);
    v20 = v30;
    v22 = v31;
    v24 = v32;
    v33 = -[NSSet containsObject:](self->_floatingElementKinds, "containsObject:", v15);

    if (!v33)
      goto LABEL_10;
    v26 = -[UITableViewRowData floatingRectForFooterInSection:visibleRect:heightCanBeGuessed:outIsFloating:]((uint64_t)self->_rowData, a4, a7, 0, x, y, width, height);
  }
  v34 = v26;
  v35 = v27;
  v36 = v28;
  v37 = v29;
  v43.origin.x = v18;
  v43.origin.y = v20;
  v43.size.width = v22;
  v43.size.height = v24;
  if (!CGRectEqualToRect(*(CGRect *)&v26, v43))
  {
    if (a6)
      *a6 = 1;
    v24 = v37;
    v22 = v36;
    v20 = v35;
    v18 = v34;
  }
LABEL_10:
  v38 = v18;
  v39 = v20;
  v40 = v22;
  v41 = v24;
  result.size.height = v41;
  result.size.width = v40;
  result.origin.y = v39;
  result.origin.x = v38;
  return result;
}

- (_NSRange)_sectionRangeForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSUInteger v19;
  NSUInteger v20;
  _NSRange result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[UICollectionViewTableLayout _numberOfSections](self, "_numberOfSections");
  if (v8 < 1)
  {
    v18 = 0;
    v15 = 0;
  }
  else
  {
    v9 = v8;
    v10 = -[UITableViewRowData globalRowsInRect:canGuess:](&self->_rowData->super.isa, 1, x, y, width, height);
    v12 = v11;
    -[UITableViewRowData indexPathForRowAtGlobalRow:](&self->_rowData->super.isa, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewRowData indexPathForRowAtGlobalRow:](&self->_rowData->super.isa, v12 + v10 - 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "section");
    v16 = objc_msgSend(v14, "section");
    v17 = objc_msgSend(v13, "section");
    if (v16 - v17 + 1 + v15 >= v9)
      v18 = v16 - v17 + 1;
    else
      v18 = v16 - v17 + 2;

  }
  v19 = v15;
  v20 = v18;
  result.length = v20;
  result.location = v19;
  return result;
}

- (double)_defaultCellHeight
{
  double result;

  -[UITableConstants defaultRowHeightForTableView:](self->_constants, "defaultRowHeightForTableView:", self);
  return result;
}

- (BOOL)_needsRecomputeOfPreferredAttributesForVisibleEstimatedItemsDuringUpdate
{
  return 0;
}

- (BOOL)_wantsSwipes
{
  return !-[UICollectionViewTableLayout isEditing](self, "isEditing");
}

- (id)swipeActionController:(id)a3 leadingSwipeConfigurationForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;

  v5 = a4;
  -[UICollectionViewTableLayout _delegateActual](self, "_delegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[UICollectionViewTableLayout _delegateProxy](self, "_delegateProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionView:tableLayout:leadingSwipeActionsConfigurationForRowAtIndexPath:", v9, self, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UICollectionViewTableLayout _delegateActual](self, "_delegateActual");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0)
    {
      v10 = 0;
      goto LABEL_9;
    }
    -[UICollectionViewTableLayout _delegateProxy](self, "_delegateProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collectionView:tableLayout:leadingSwipeActionsForRowAtIndexPath:", v14, self, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v10 = 0;
      goto LABEL_7;
    }
    +[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPerformsFirstActionWithFullSwipe:", objc_msgSend(v9, "canBeTriggeredBySwipe"));
  }

LABEL_7:
LABEL_9:

  return v10;
}

- (id)swipeActionController:(id)a3 trailingSwipeConfigurationForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[UICollectionViewTableLayout _delegateActual](self, "_delegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[UICollectionViewTableLayout _delegateProxy](self, "_delegateProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionView:tableLayout:trailingSwipeActionsConfigurationForRowAtIndexPath:", v9, self, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[UICollectionViewTableLayout _delegateActual](self, "_delegateActual");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[UICollectionViewTableLayout _delegateProxy](self, "_delegateProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collectionView:tableLayout:trailingSwipeActionsForRowAtIndexPath:", v14, self, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      +[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPerformsFirstActionWithFullSwipe:", objc_msgSend(v9, "canBeTriggeredBySwipe"));
LABEL_6:

      if (v10)
        goto LABEL_10;
    }
  }
  if (-[UICollectionViewTableLayout _editingStyleForRowAtIndexPath:](self, "_editingStyleForRowAtIndexPath:", v5) == 1)
  {
    -[UICollectionViewTableLayout contextualActionForDeletingRowAtIndexPath:](self, "contextualActionForDeletingRowAtIndexPath:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
LABEL_10:

  return v10;
}

- (int64_t)layoutDirectionForSwipeActionController:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;

  v4 = dyld_program_sdk_at_least();
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v7 = objc_msgSend(v5, "effectiveUserInterfaceLayoutDirection");
  }
  else
  {
    objc_msgSend(v5, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "layoutDirection");

  }
  return v7;
}

- (id)swipeActionController:(id)a3 indexPathForTouchLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v6;
  void *v7;

  y = a4.y;
  x = a4.x;
  -[UICollectionViewLayout collectionView](self, "collectionView", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForItemAtPoint:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)swipeActionController:(id)a3 viewForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)swipeActionController:(id)a3 willPerformAction:(id)a4 atIndexPath:(id)a5
{
  NSIndexPath *v7;
  NSIndexPath *deletedIndexPath;
  id v9;

  v9 = a5;
  if (objc_msgSend(a4, "style") == 1)
  {
    v7 = (NSIndexPath *)objc_msgSend(v9, "copy");
    deletedIndexPath = self->_deletedIndexPath;
    self->_deletedIndexPath = v7;

  }
}

- (void)swipeActionController:(id)a3 didCompleteAction:(id)a4 cancelled:(BOOL)a5 atIndexPath:(id)a6
{
  NSIndexPath *deletedIndexPath;

  deletedIndexPath = self->_deletedIndexPath;
  self->_deletedIndexPath = 0;

}

- (void)swipeActionController:(id)a3 animateView:(id)a4 actionsView:(id)a5 forDestructiveAction:(id)a6 atIndexPath:(id)a7 withSwipeInfo:(id *)a8 completion:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a9;
  if (objc_msgSend(v17, "row") >= 1)
  {
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v17, "item") - 1, objc_msgSend(v17, "section"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cellForItemAtIndexPath:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[UICollectionViewLayout collectionView](self, "collectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bringSubviewToFront:", v21);

  }
  objc_msgSend(v14, "tableViewCell");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "currentSwipeOccurrence");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "backgroundColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __135__UICollectionViewTableLayout_swipeActionController_animateView_actionsView_forDestructiveAction_atIndexPath_withSwipeInfo_completion___block_invoke;
  v39[3] = &unk_1E16B1BA0;
  v26 = v18;
  v40 = v26;
  _UITableAnimateSwipeDeletion(self, v17, v23, v15, v24, v25, v39, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v28 = v27;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v36;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v36 != v31)
          objc_enumerationMutation(v28);
        objc_msgSend(v14, "_trackAnimator:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v32++));
      }
      while (v30 != v32);
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v30);
  }

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "sendSubviewToBack:", v14);

}

uint64_t __135__UICollectionViewTableLayout_swipeActionController_animateView_actionsView_forDestructiveAction_atIndexPath_withSwipeInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)swipeActionController:(id)a3 mayBeginSwipeForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a4;
  if (!-[UICollectionViewTableLayout _wantsSwipes](self, "_wantsSwipes"))
    goto LABEL_4;
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_canEditItemAtIndexPath:", v5);

  if (!v7)
    goto LABEL_4;
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_reorderedItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
  {
    -[UICollectionViewTableLayout _delegateActual](self, "_delegateActual");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = 1;
    }
    else
    {
      -[UICollectionViewTableLayout _delegateActual](self, "_delegateActual");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v11 = 1;
      }
      else
      {
        -[UICollectionViewTableLayout _delegateActual](self, "_delegateActual");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v11 = 1;
        }
        else
        {
          -[UICollectionViewTableLayout _delegateActual](self, "_delegateActual");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v11 = 1;
          }
          else
          {
            -[UICollectionViewTableLayout _delegateActual](self, "_delegateActual");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_opt_respondsToSelector();

          }
        }

      }
    }

  }
  else
  {
LABEL_4:
    v11 = 0;
  }

  return v11 & 1;
}

- (void)swipeActionController:(id)a3 willBeginSwipeForItemAtIndexPath:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[UICollectionViewTableLayout _delegateActual](self, "_delegateActual");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[UICollectionViewTableLayout _delegateProxy](self, "_delegateProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionView:tableLayout:willBeginEditingRowAtIndexPath:", v8, self, v9);

  }
}

- (void)swipeActionController:(id)a3 didEndSwipeForItemAtIndexPath:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[UICollectionViewTableLayout _delegateActual](self, "_delegateActual");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[UICollectionViewTableLayout _delegateProxy](self, "_delegateProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionView:tableLayout:didEndEditingRowAtIndexPath:", v8, self, v9);

  }
}

- (void)resetSwipedRowWithCompletion:(id)a3
{
  -[UISwipeActionController resetSwipedItemAnimated:completion:](self->_swipeActionController, "resetSwipedItemAnimated:completion:", 1, a3);
}

- (id)swipeActionForDeletingRowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  _UINSLocalizedStringWithDefaultValue(CFSTR("Delete"), CFSTR("Delete"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__UICollectionViewTableLayout_swipeActionForDeletingRowAtIndexPath___block_invoke;
  v9[3] = &unk_1E16BC990;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  +[UISwipeAction swipeActionWithStyle:title:handler:](UISwipeAction, "swipeActionWithStyle:title:handler:", 1, v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __68__UICollectionViewTableLayout_swipeActionForDeletingRowAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_delegateActual");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_delegateProxy");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionView:tableLayout:commitEditingStyle:forRowAtIndexPath:", v4, *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40));

  }
}

- (id)contextualActionForDeletingRowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  _UINSLocalizedStringWithDefaultValue(CFSTR("Delete"), CFSTR("Delete"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__UICollectionViewTableLayout_contextualActionForDeletingRowAtIndexPath___block_invoke;
  v9[3] = &unk_1E16BC9B8;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  +[UIContextualAction contextualActionWithStyle:title:handler:](UIContextualAction, "contextualActionWithStyle:title:handler:", 1, v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __73__UICollectionViewTableLayout_contextualActionForDeletingRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void (**v9)(id, _QWORD);

  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_delegateActual");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_delegateProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionView:tableLayout:commitEditingStyle:forRowAtIndexPath:", v8, *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40));

  }
  v9[2](v9, v6 & 1);

}

- (BOOL)canBeEdited
{
  return 1;
}

- (BOOL)isEditing
{
  void *v2;
  char v3;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEditing");

  return v3;
}

- (void)setEditing:(BOOL)a3
{
  -[UICollectionViewTableLayout resetSwipedRowWithCompletion:](self, "resetSwipedRowWithCompletion:", 0);
  -[UICollectionViewLayout invalidateLayout](self, "invalidateLayout");
}

- (BOOL)allowsMultipleSelection
{
  void *v2;
  char v3;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsMultipleSelection");

  return v3;
}

- (BOOL)allowsMultipleSelectionDuringEditing
{
  void *v2;
  char v3;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsMultipleSelectionDuringEditing");

  return v3;
}

- (UIEdgeInsets)_rawSeparatorInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_separatorInset.top;
  left = self->_separatorInset.left;
  bottom = self->_separatorInset.bottom;
  right = self->_separatorInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)_sectionContentInset
{
  void *v3;
  double top;
  double left;
  double bottom;
  double right;
  double v8;
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
  double v21;
  double v22;
  double v23;
  double v24;
  UIEdgeInsets result;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  top = self->_sectionContentInset.top;
  left = self->_sectionContentInset.left;
  bottom = self->_sectionContentInset.bottom;
  right = self->_sectionContentInset.right;
  objc_msgSend(v3, "safeAreaInsets");
  if (top == -1.0)
    top = 0.0;
  v10 = left + v8;
  if (left == -1.0)
    v11 = 0.0;
  else
    v11 = v10;
  if (bottom == -1.0)
    bottom = 0.0;
  if (right == -1.0)
    v12 = 0.0;
  else
    v12 = right + v9;
  -[UICollectionViewTableLayout _tableContentInset](self, "_tableContentInset");
  v14 = top + v13;
  v16 = v15 + v11;
  v18 = bottom + v17;
  v20 = v19 + v12;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (UIEdgeInsets)_rawSectionContentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_sectionContentInset.top;
  left = self->_sectionContentInset.left;
  bottom = self->_sectionContentInset.bottom;
  right = self->_sectionContentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)_sectionContentInsetFollowsLayoutMargins
{
  return 0;
}

- (BOOL)_supplementarySectionHeadersHugContent
{
  return 0;
}

- (BOOL)_supplementariesFollowSectionContentInsets
{
  return 0;
}

- (double)_sectionCornerRadius
{
  return 0.0;
}

- (double)_indexBarExtentFromEdge
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_shouldReverseLayoutDirection");

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryInsets");
  v7 = v6;
  v9 = v8;

  if (v4)
    return v7;
  else
    return v9;
}

- (UIColor)backgroundColor
{
  void *v2;
  void *v3;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (int64_t)_tableStyle
{
  return 0;
}

- (int64_t)_numberOfSections
{
  void *v2;
  int64_t v3;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfSections");

  return v3;
}

- (int64_t)_numberOfRowsInSection:(int64_t)a3
{
  void *v4;
  int64_t v5;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfItemsInSection:", a3);

  return v5;
}

- (double)_headerFooterLeadingMarginWidthIsHeader:(BOOL)a3 isFirstSection:(BOOL)a4
{
  void *v5;
  int v6;
  uint64_t v7;
  double v8;
  CGFloat left;
  BOOL v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  _BOOL4 v17;
  double result;
  double v19;
  void *v20;
  double v21;
  double v22;
  char v23;
  _BOOL4 v24;
  int v25;
  double v26;
  double v27;

  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_shouldReverseLayoutDirection");

    v7 = 8;
    if (v6)
      v7 = 24;
    v8 = *(double *)((char *)&self->_sectionContentInset.top + v7);
    left = self->_separatorInset.left;
    v10 = -[UICollectionViewTableLayout separatorInsetIsRelativeToCellEdges](self, "separatorInsetIsRelativeToCellEdges");
    -[UICollectionViewTableLayout _constants](self, "_constants");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "defaultMarginWidthForTableView:", self);
    v13 = v12;

    -[UICollectionViewLayout collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "directionalLayoutMargins");
    v16 = v15;

    v17 = -[UICollectionViewTableLayout _shouldApplyReadableWidthInsets](self, "_shouldApplyReadableWidthInsets");
    if (v8 <= 0.0)
    {
      v23 = left == -1.0 || v10;
      if (left == -1.0)
        result = v13;
      else
        result = left;
      if ((v23 & 1) == 0)
      {
        v24 = v17;
        v25 = dyld_program_sdk_at_least();
        v26 = -0.0;
        if (v24 | v25)
          v26 = v16;
        return left + v26;
      }
    }
    else
    {
      return v8 + v13;
    }
  }
  else
  {
    v19 = self->_sectionContentInset.left;
    if (v19 == -1.0)
    {
      -[UICollectionViewTableLayout _constants](self, "_constants");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "defaultMarginWidthForTableView:", self);
      v22 = v21;

      return v22;
    }
    else
    {
      -[UICollectionViewTableLayout separatorInset](self, "separatorInset");
      return v19 + v27;
    }
  }
  return result;
}

- (double)_headerFooterTrailingMarginWidth
{
  void *v3;
  int v4;
  uint64_t v5;
  double v6;
  double right;
  BOOL v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  _BOOL4 v17;
  double v18;
  double v19;
  double v20;

  if ((dyld_program_sdk_at_least() & 1) == 0)
    return self->_sectionContentInset.right;
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_shouldReverseLayoutDirection");

  v5 = 24;
  if (v4)
    v5 = 8;
  v6 = *(double *)((char *)&self->_sectionContentInset.top + v5);
  right = self->_separatorInset.right;
  v8 = -[UICollectionViewTableLayout separatorInsetIsRelativeToCellEdges](self, "separatorInsetIsRelativeToCellEdges");
  -[UICollectionViewTableLayout _constants](self, "_constants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultTrailingCellMarginWidthForTableView:", self);
  v11 = v10;

  -[UICollectionViewTableLayout _indexBarExtentFromEdge](self, "_indexBarExtentFromEdge");
  v13 = v12;
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "directionalLayoutMargins");
  v16 = v15;

  v17 = -[UICollectionViewTableLayout _shouldApplyReadableWidthInsets](self, "_shouldApplyReadableWidthInsets");
  if (v6 <= 0.0)
  {
    if (right == -1.0)
    {
      v18 = fmax(v13, v16);
      if (v17)
        right = v18;
      else
        right = v13;
    }
    else if (!v8)
    {
      v19 = right + fmax(v16, v13);
      if (v17)
        right = v19;
      else
        right = right + v13;
    }
    v20 = -0.0;
    if (!v17)
      v20 = v11;
    return v20 + right;
  }
  return v11;
}

- (double)_defaultSectionHeaderHeight
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[UITableConstants defaultSectionHeaderHeightForTableView:](self->_constants, "defaultSectionHeaderHeightForTableView:", self);
  v4 = v3;
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_currentScreenScale");
  v7 = UIPixelBoundaryOffset(1, v4, v6);

  return v7;
}

- (double)_defaultSectionFooterHeight
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[UITableConstants defaultSectionFooterHeightForTableView:](self->_constants, "defaultSectionFooterHeightForTableView:", self);
  v4 = v3;
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_currentScreenScale");
  v7 = UIPixelBoundaryOffset(0, v4, v6);

  return v7;
}

- (BOOL)_sectionHeadersHugContent
{
  return 0;
}

- (double)_sidePadding
{
  return 0.0;
}

- (UIEdgeInsets)_contentInset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "adjustedContentInset");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (UIEdgeInsets)_tableContentInset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (double)_paddingAboveFirstSectionHeader
{
  void *v3;
  double v4;
  double v5;

  -[UICollectionViewTableLayout _constants](self, "_constants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultPaddingAboveFirstSectionHeaderForTableStyle:", -[UICollectionViewTableLayout _tableStyle](self, "_tableStyle"));
  v5 = v4;

  return v5;
}

- (double)_paddingAboveSectionHeaders
{
  void *v3;
  double v4;
  double v5;

  -[UICollectionViewTableLayout _constants](self, "_constants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultPaddingAboveSectionHeadersForTableStyle:", -[UICollectionViewTableLayout _tableStyle](self, "_tableStyle"));
  v5 = v4;

  return v5;
}

- (double)_sectionHeaderToFirstRowPadding
{
  void *v2;
  double v3;
  double v4;

  -[UICollectionViewTableLayout _constants](self, "_constants");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultPaddingBetweenHeaderAndRows");
  v4 = v3;

  return v4;
}

- (double)_sectionFooterToLastRowPadding
{
  return 0.0;
}

- (int64_t)_headerFooterPinningBehavior
{
  void *v3;
  int64_t v4;

  -[UICollectionViewTableLayout _constants](self, "_constants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "defaultHeaderFooterPinningBehaviorForTableStyle:", -[UICollectionViewTableLayout _tableStyle](self, "_tableStyle"));

  return v4;
}

- (UIEdgeInsets)_cellSafeAreaInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeAreaInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (BOOL)_isTableHeaderAutohiding
{
  return 0;
}

- (double)_heightForTableHeader
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  double v7;

  -[UICollectionViewTableLayout _delegateActual](self, "_delegateActual");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UICollectionViewTableLayout _delegateProxy](self, "_delegateProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionView:heightForHeaderViewInTableLayout:", v6, self);
    v4 = v7;

  }
  return v4;
}

- (double)_heightForTableFooter
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  double v7;

  -[UICollectionViewTableLayout _delegateActual](self, "_delegateActual");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UICollectionViewTableLayout _delegateProxy](self, "_delegateProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionView:heightForFooterViewInTableLayout:", v6, self);
    v4 = v7;

  }
  return v4;
}

- (BOOL)_providesRowHeights
{
  void *v2;
  char v3;

  -[UICollectionViewTableLayout _delegateActual](self, "_delegateActual");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (BOOL)_estimatesHeights
{
  return -[UICollectionViewTableLayout _estimatesRowHeights](self, "_estimatesRowHeights")
      || -[UICollectionViewTableLayout _estimatesSectionHeaderHeights](self, "_estimatesSectionHeaderHeights")
      || -[UICollectionViewTableLayout _estimatesSectionFooterHeights](self, "_estimatesSectionFooterHeights");
}

- (BOOL)_estimatesRowHeights
{
  double estimatedRowHeight;

  estimatedRowHeight = self->_estimatedRowHeight;
  return estimatedRowHeight == -1.0 || estimatedRowHeight > 0.0;
}

- (BOOL)_estimatesSectionHeaderHeights
{
  double estimatedSectionHeaderHeight;

  estimatedSectionHeaderHeight = self->_estimatedSectionHeaderHeight;
  return estimatedSectionHeaderHeight == -1.0 || estimatedSectionHeaderHeight > 0.0;
}

- (BOOL)_estimatesSectionFooterHeights
{
  double estimatedSectionFooterHeight;

  estimatedSectionFooterHeight = self->_estimatedSectionFooterHeight;
  return estimatedSectionFooterHeight == -1.0 || estimatedSectionFooterHeight > 0.0;
}

- (double)_heightForRowAtIndexPath:(id)a3
{
  id v4;
  double v5;
  double Height;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGRect v13;
  CGRect v14;

  v4 = a3;
  -[UICollectionViewTableLayout _dataSourceHeightForRowAtIndexPath:](self, "_dataSourceHeightForRowAtIndexPath:", v4);
  Height = v5;
  if (v5 == -1.0)
  {
    if (-[UICollectionViewTableLayout _estimatesRowHeights](self, "_estimatesRowHeights"))
    {
      -[UICollectionView cellForItemAtIndexPath:](self->super._collectionView, "cellForItemAtIndexPath:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (!v7)
      {
        -[UICollectionView _reusableViewWithoutAttributesForElementCategory:kind:indexPath:](self->super._collectionView, "_reusableViewWithoutAttributesForElementCategory:kind:indexPath:", 0, 0, v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setFrame:", -[UITableViewRowData rectForRow:inSection:heightCanBeGuessed:]((uint64_t)self->_rowData, objc_msgSend(v4, "row"), objc_msgSend(v4, "section"), 1));
      }
      +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:](UICollectionViewTableLayoutAttributes, "layoutAttributesForCellWithIndexPath:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bounds](self->super._collectionView, "bounds");
      objc_msgSend(v9, "setSize:", CGRectGetWidth(v13), 0.0);
      objc_msgSend(v8, "preferredLayoutAttributesFittingAttributes:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "frame");
      Height = CGRectGetHeight(v14);

      if (!v7)
        -[UICollectionView _reuseCell:](self->super._collectionView, "_reuseCell:", v8);

    }
    else
    {
      Height = self->_rowHeight;
    }
    if (Height == -1.0)
    {
      -[UICollectionViewTableLayout _defaultCellHeight](self, "_defaultCellHeight");
      Height = v11;
    }
  }

  return Height;
}

- (double)_heightForHeaderInSection:(int64_t)a3 useRowData:(BOOL)a4
{
  _BOOL4 v4;
  double v8;
  double Height;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v17;
  CGRect v18;
  CGRect v19;

  v4 = a4;
  -[UICollectionViewTableLayout _dataSourceHeightForHeaderInSection:](self, "_dataSourceHeightForHeaderInSection:");
  Height = v8;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (Height == -1.0)
  {
    if (-[UICollectionViewTableLayout _estimatesSectionHeaderHeights](self, "_estimatesSectionHeaderHeights") && v4)
    {
      -[UICollectionView supplementaryViewForElementKind:atIndexPath:](self->super._collectionView, "supplementaryViewForElementKind:atIndexPath:", CFSTR("UICollectionElementKindSectionHeader"), v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (!v11)
      {
        if (-[NSMutableSet containsObject:](self->_headerPreferredAttributesCache, "containsObject:", v10))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewTableLayout.m"), 1760, CFSTR("Asked for view at index path %@ but already have size cached!"), v10);

        }
        -[UICollectionView _reusableViewWithoutAttributesForElementCategory:kind:indexPath:](self->super._collectionView, "_reusableViewWithoutAttributesForElementCategory:kind:indexPath:", 1, CFSTR("UICollectionElementKindSectionHeader"), v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setFrame:", -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:]((uint64_t)self->_rowData, a3, 1));
      }
      +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](UICollectionViewTableLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("UICollectionElementKindSectionHeader"), v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bounds](self->super._collectionView, "bounds");
      objc_msgSend(v13, "setSize:", CGRectGetWidth(v18), 0.0);
      objc_msgSend(v12, "preferredLayoutAttributesFittingAttributes:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "frame");
      Height = CGRectGetHeight(v19);

      if (!v11)
        -[UICollectionView _reuseSupplementaryView:](self->super._collectionView, "_reuseSupplementaryView:", v12);

    }
    else
    {
      Height = self->_sectionHeaderHeight;
    }
    if (Height == -1.0)
    {
      -[UICollectionViewTableLayout _defaultSectionHeaderHeight](self, "_defaultSectionHeaderHeight");
      Height = v15;
    }
  }

  return Height;
}

- (double)_heightForHeaderInSection:(int64_t)a3
{
  double result;

  -[UICollectionViewTableLayout _heightForHeaderInSection:useRowData:](self, "_heightForHeaderInSection:useRowData:", a3, 1);
  return result;
}

- (CGSize)_sizeForHeaderInSection:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[UICollectionViewTableLayout _heightForHeaderInSection:](self, "_heightForHeaderInSection:", a3);
  v5 = v4;
  -[UIView bounds](self->super._collectionView, "bounds");
  v7 = v6;
  v8 = v5;
  result.height = v8;
  result.width = v7;
  return result;
}

- (double)_heightForFooterInSection:(int64_t)a3 useRowData:(BOOL)a4
{
  _BOOL4 v4;
  double v8;
  double Height;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v17;
  CGRect v18;
  CGRect v19;

  v4 = a4;
  -[UICollectionViewTableLayout _dataSourceHeightForFooterInSection:](self, "_dataSourceHeightForFooterInSection:");
  Height = v8;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (Height == -1.0)
  {
    if (-[UICollectionViewTableLayout _estimatesSectionFooterHeights](self, "_estimatesSectionFooterHeights") && v4)
    {
      -[UICollectionView supplementaryViewForElementKind:atIndexPath:](self->super._collectionView, "supplementaryViewForElementKind:atIndexPath:", CFSTR("UICollectionElementKindSectionFooter"), v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (!v11)
      {
        if (-[NSMutableSet containsObject:](self->_footerPreferredAttributesCache, "containsObject:", v10))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewTableLayout.m"), 1809, CFSTR("Asked for view at index path %@ but already have size cached!"), v10);

        }
        -[UICollectionView _reusableViewWithoutAttributesForElementCategory:kind:indexPath:](self->super._collectionView, "_reusableViewWithoutAttributesForElementCategory:kind:indexPath:", 1, CFSTR("UICollectionElementKindSectionFooter"), v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setFrame:", -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:]((uint64_t)self->_rowData, a3, 1));
      }
      +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](UICollectionViewTableLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("UICollectionElementKindSectionFooter"), v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bounds](self->super._collectionView, "bounds");
      objc_msgSend(v13, "setSize:", CGRectGetWidth(v18), 0.0);
      objc_msgSend(v12, "preferredLayoutAttributesFittingAttributes:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "frame");
      Height = CGRectGetHeight(v19);

      if (!v11)
        -[UICollectionView _reuseSupplementaryView:](self->super._collectionView, "_reuseSupplementaryView:", v12);

    }
    else
    {
      Height = self->_sectionFooterHeight;
    }
    if (Height == -1.0)
    {
      -[UICollectionViewTableLayout _defaultSectionFooterHeight](self, "_defaultSectionFooterHeight");
      Height = v15;
    }
  }

  return Height;
}

- (double)_heightForFooterInSection:(int64_t)a3
{
  double result;

  -[UICollectionViewTableLayout _heightForFooterInSection:useRowData:](self, "_heightForFooterInSection:useRowData:", a3, 1);
  return result;
}

- (double)_estimatedHeightForRowAtIndexPath:(id)a3
{
  id v5;
  double estimatedRowHeight;
  void *v7;
  char v8;
  void *v9;
  double v10;
  int v11;
  _BOOL4 v12;
  void *v13;
  double v14;
  unint64_t v17;
  NSObject *v18;
  uint8_t buf[4];
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  estimatedRowHeight = self->_estimatedRowHeight;
  -[UICollectionViewTableLayout _delegateActual](self, "_delegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[UICollectionViewTableLayout _delegateProxy](self, "_delegateProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionView:tableLayout:estimatedHeightForRowAtIndexPath:", self->super._collectionView, self, v5);
    estimatedRowHeight = v10;

    v11 = dyld_program_sdk_at_least();
    v12 = estimatedRowHeight < 0.0;
    if (estimatedRowHeight == -1.0)
      v12 = 0;
    if (v11)
    {
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewTableLayout.m"), 1844, CFSTR("Invalid estimated row height (%g) provided by table delegate. Value must be at least 0.0, or UITableViewAutomaticDimension."), *(_QWORD *)&estimatedRowHeight);

      }
    }
    else if (v12)
    {
      v17 = _estimatedHeightForRowAtIndexPath____s_category;
      if (!_estimatedHeightForRowAtIndexPath____s_category)
      {
        v17 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v17, (unint64_t *)&_estimatedHeightForRowAtIndexPath____s_category);
      }
      v18 = *(NSObject **)(v17 + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v20 = estimatedRowHeight;
        _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Invalid estimated row height (%g) provided by table delegate. Value must be at least 0.0, or UITableViewAutomaticDimension.", buf, 0xCu);
      }
    }
  }
  else if (estimatedRowHeight == -1.0)
  {
    -[UICollectionViewTableLayout _defaultCellHeight](self, "_defaultCellHeight");
    estimatedRowHeight = v14;
  }
  if (estimatedRowHeight <= 1.0 && estimatedRowHeight > 0.0)
    estimatedRowHeight = 2.0;

  return estimatedRowHeight;
}

- (double)_estimatedHeightForHeaderInSection:(int64_t)a3
{
  double estimatedSectionHeaderHeight;
  void *v7;
  char v8;
  void *v9;
  double v10;
  int v11;
  _BOOL4 v12;
  void *v13;
  double v14;
  BOOL v15;
  double result;
  unint64_t v17;
  NSObject *v18;
  uint8_t buf[4];
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  estimatedSectionHeaderHeight = self->_estimatedSectionHeaderHeight;
  -[UICollectionViewTableLayout _delegateActual](self, "_delegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[UICollectionViewTableLayout _delegateProxy](self, "_delegateProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionView:tableLayout:estimatedHeightForHeaderInSection:", self->super._collectionView, self, a3);
    estimatedSectionHeaderHeight = v10;

    v11 = dyld_program_sdk_at_least();
    v12 = estimatedSectionHeaderHeight < 0.0;
    if (estimatedSectionHeaderHeight == -1.0)
      v12 = 0;
    if (v11)
    {
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewTableLayout.m"), 1857, CFSTR("Invalid estimated header height (%g) provided by table delegate. Value must be at least 0.0, or UITableViewAutomaticDimension."), *(_QWORD *)&estimatedSectionHeaderHeight);

      }
    }
    else if (v12)
    {
      v17 = _estimatedHeightForHeaderInSection____s_category;
      if (!_estimatedHeightForHeaderInSection____s_category)
      {
        v17 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v17, (unint64_t *)&_estimatedHeightForHeaderInSection____s_category);
      }
      v18 = *(NSObject **)(v17 + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v20 = estimatedSectionHeaderHeight;
        _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Invalid estimated header height (%g) provided by table delegate. Value must be at least 0.0, or UITableViewAutomaticDimension.", buf, 0xCu);
      }
    }
  }
  else if (estimatedSectionHeaderHeight == -1.0)
  {
    -[UICollectionViewTableLayout _defaultSectionHeaderHeight](self, "_defaultSectionHeaderHeight");
    estimatedSectionHeaderHeight = v14;
  }
  v15 = estimatedSectionHeaderHeight > 1.0 || estimatedSectionHeaderHeight <= 0.0;
  result = 2.0;
  if (v15)
    return estimatedSectionHeaderHeight;
  return result;
}

- (double)_estimatedHeightForFooterInSection:(int64_t)a3
{
  double estimatedSectionFooterHeight;
  void *v7;
  char v8;
  void *v9;
  double v10;
  int v11;
  _BOOL4 v12;
  void *v13;
  double v14;
  BOOL v15;
  double result;
  unint64_t v17;
  NSObject *v18;
  uint8_t buf[4];
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  estimatedSectionFooterHeight = self->_estimatedSectionFooterHeight;
  -[UICollectionViewTableLayout _delegateActual](self, "_delegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[UICollectionViewTableLayout _delegateProxy](self, "_delegateProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionView:tableLayout:estimatedHeightForFooterInSection:", self->super._collectionView, self, a3);
    estimatedSectionFooterHeight = v10;

    v11 = dyld_program_sdk_at_least();
    v12 = estimatedSectionFooterHeight < 0.0;
    if (estimatedSectionFooterHeight == -1.0)
      v12 = 0;
    if (v11)
    {
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewTableLayout.m"), 1870, CFSTR("Invalid estimated footer height (%g) provided by table delegate. Value must be at least 0.0, or UITableViewAutomaticDimension."), *(_QWORD *)&estimatedSectionFooterHeight);

      }
    }
    else if (v12)
    {
      v17 = _estimatedHeightForFooterInSection____s_category;
      if (!_estimatedHeightForFooterInSection____s_category)
      {
        v17 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v17, (unint64_t *)&_estimatedHeightForFooterInSection____s_category);
      }
      v18 = *(NSObject **)(v17 + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v20 = estimatedSectionFooterHeight;
        _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Invalid estimated footer height (%g) provided by table delegate. Value must be at least 0.0, or UITableViewAutomaticDimension.", buf, 0xCu);
      }
    }
  }
  else if (estimatedSectionFooterHeight == -1.0)
  {
    -[UICollectionViewTableLayout _defaultSectionFooterHeight](self, "_defaultSectionFooterHeight");
    estimatedSectionFooterHeight = v14;
  }
  v15 = estimatedSectionFooterHeight > 1.0 || estimatedSectionFooterHeight <= 0.0;
  result = 2.0;
  if (v15)
    return estimatedSectionFooterHeight;
  return result;
}

- (double)_dataSourceHeightForRowAtIndexPath:(id)a3
{
  id v5;
  void *v6;
  char v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  int v12;
  _BOOL4 v13;
  void *v14;
  unint64_t v16;
  NSObject *v17;
  uint8_t v18[16];

  v5 = a3;
  -[UICollectionViewTableLayout _delegateActual](self, "_delegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  v8 = -1.0;
  if ((v7 & 1) != 0)
  {
    -[UICollectionViewTableLayout _delegateProxy](self, "_delegateProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionView:tableLayout:heightForRowAtIndexPath:", v10, self, v5);
    v8 = v11;

    v12 = dyld_program_sdk_at_least();
    v13 = v8 < 0.0;
    if (v8 == -1.0)
      v13 = 0;
    if (v12)
    {
      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewTableLayout.m"), 1883, CFSTR("Invalid row height provided by table delegate. Value must be greater than zero or UITableViewAutomaticDimension."));

      }
    }
    else if (v13)
    {
      v16 = _MergedGlobals_57;
      if (!_MergedGlobals_57)
      {
        v16 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v16, (unint64_t *)&_MergedGlobals_57);
      }
      v17 = *(NSObject **)(v16 + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "Invalid row height provided by table delegate. Value must be greater than zero or UITableViewAutomaticDimension.", v18, 2u);
      }
    }
    if (floor(v8) != v8 && qword_1ECD7A150 != -1)
      dispatch_once(&qword_1ECD7A150, &__block_literal_global_108);
  }

  return v8;
}

void __66__UICollectionViewTableLayout__dataSourceHeightForRowAtIndexPath___block_invoke()
{
  unint64_t v0;
  NSObject *v1;
  uint8_t v2[16];

  v0 = UICollectionElementKindSeparator_block_invoke___s_category;
  if (!UICollectionElementKindSeparator_block_invoke___s_category)
  {
    v0 = __UILogCategoryGetNode("UICollectionViewTableLayout", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v0, (unint64_t *)&UICollectionElementKindSeparator_block_invoke___s_category);
  }
  v1 = *(NSObject **)(v0 + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_185066000, v1, OS_LOG_TYPE_ERROR, "Returning a fractional height for UICollectionViewTableLayout rows will result in layout issues in the collection view. Please ensure that row heights are integral values. This message will only be logged once.", v2, 2u);
  }
}

- (double)_dataSourceHeightForHeaderInSection:(int64_t)a3
{
  void *v6;
  char v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  int v12;
  _BOOL4 v13;
  void *v14;
  unint64_t v16;
  NSObject *v17;
  uint8_t v18[16];

  -[UICollectionViewTableLayout _delegateActual](self, "_delegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  v8 = -1.0;
  if ((v7 & 1) != 0)
  {
    -[UICollectionViewTableLayout _delegateProxy](self, "_delegateProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionView:tableLayout:heightForHeaderInSection:", v10, self, a3);
    v8 = v11;

    v12 = dyld_program_sdk_at_least();
    v13 = v8 < 0.0;
    if (v8 == -1.0)
      v13 = 0;
    if (v12)
    {
      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewTableLayout.m"), 1899, CFSTR("Invalid header height provided by table delegate. Value must be greater than zero or UITableViewAutomaticDimension."));

      }
    }
    else if (v13)
    {
      v16 = qword_1ECD7A158;
      if (!qword_1ECD7A158)
      {
        v16 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v16, (unint64_t *)&qword_1ECD7A158);
      }
      v17 = *(NSObject **)(v16 + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "Invalid header height provided by table delegate. Value must be greater than zero or UITableViewAutomaticDimension.", v18, 2u);
      }
    }
    if (floor(v8) != v8 && qword_1ECD7A160 != -1)
      dispatch_once(&qword_1ECD7A160, &__block_literal_global_119);
  }
  return v8;
}

void __67__UICollectionViewTableLayout__dataSourceHeightForHeaderInSection___block_invoke()
{
  unint64_t v0;
  NSObject *v1;
  uint8_t v2[16];

  v0 = UICollectionElementKindSeparator_block_invoke_2___s_category;
  if (!UICollectionElementKindSeparator_block_invoke_2___s_category)
  {
    v0 = __UILogCategoryGetNode("UICollectionViewTableLayout", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v0, (unint64_t *)&UICollectionElementKindSeparator_block_invoke_2___s_category);
  }
  v1 = *(NSObject **)(v0 + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_185066000, v1, OS_LOG_TYPE_ERROR, "Returning a fractional height for UICollectionViewTableLayout headers will result in layout issues in the collection view. Please ensure that header heights are integral values. This message will only be logged once.", v2, 2u);
  }
}

- (double)_dataSourceHeightForFooterInSection:(int64_t)a3
{
  void *v6;
  char v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  int v12;
  _BOOL4 v13;
  void *v14;
  unint64_t v16;
  NSObject *v17;
  uint8_t v18[16];

  -[UICollectionViewTableLayout _delegateActual](self, "_delegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  v8 = -1.0;
  if ((v7 & 1) != 0)
  {
    -[UICollectionViewTableLayout _delegateProxy](self, "_delegateProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionView:tableLayout:heightForFooterInSection:", v10, self, a3);
    v8 = v11;

    v12 = dyld_program_sdk_at_least();
    v13 = v8 < 0.0;
    if (v8 == -1.0)
      v13 = 0;
    if (v12)
    {
      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewTableLayout.m"), 1915, CFSTR("Invalid footer height provided by table delegate. Value must be greater than zero or UITableViewAutomaticDimension."));

      }
    }
    else if (v13)
    {
      v16 = qword_1ECD7A168;
      if (!qword_1ECD7A168)
      {
        v16 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v16, (unint64_t *)&qword_1ECD7A168);
      }
      v17 = *(NSObject **)(v16 + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "Invalid footer height provided by table delegate. Value must be greater than zero or UITableViewAutomaticDimension.", v18, 2u);
      }
    }
    if (floor(v8) != v8 && qword_1ECD7A170 != -1)
      dispatch_once(&qword_1ECD7A170, &__block_literal_global_124);
  }
  return v8;
}

void __67__UICollectionViewTableLayout__dataSourceHeightForFooterInSection___block_invoke()
{
  unint64_t v0;
  NSObject *v1;
  uint8_t v2[16];

  v0 = UICollectionElementKindSeparator_block_invoke_3___s_category;
  if (!UICollectionElementKindSeparator_block_invoke_3___s_category)
  {
    v0 = __UILogCategoryGetNode("UICollectionViewTableLayout", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v0, (unint64_t *)&UICollectionElementKindSeparator_block_invoke_3___s_category);
  }
  v1 = *(NSObject **)(v0 + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_185066000, v1, OS_LOG_TYPE_ERROR, "Returning a fractional height for UICollectionViewTableLayout footers will result in layout issues in the collection view. Please ensure that your footer heights are integral values. This message will only be logged once.", v2, 2u);
  }
}

- (BOOL)_shouldHaveViewForElementOfKind:(id)a3 atSection:(int64_t)a4 useRowData:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  double v13;
  BOOL v14;
  int v15;

  v5 = a5;
  v8 = a3;
  -[UICollectionViewTableLayout _dataSourceActual](self, "_dataSourceActual");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0
    && (-[UICollectionViewLayout collectionView](self, "collectionView"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "_hasRegisteredClassOrNibForSupplementaryViewOfKind:", v8),
        v11,
        v12))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("UICollectionElementKindGlobalHeader")))
    {
      if (v5)
        v13 = -[UITableViewRowData heightForTableHeaderView]((uint64_t)self->_rowData);
      else
        -[UICollectionViewTableLayout _heightForTableHeader](self, "_heightForTableHeader");
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("UICollectionElementKindGlobalFooter")))
    {
      if (v5)
        v13 = -[UITableViewRowData heightForTableFooterView]((uint64_t)self->_rowData);
      else
        -[UICollectionViewTableLayout _heightForTableFooter](self, "_heightForTableFooter");
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("UICollectionElementKindSectionHeader")))
    {
      -[UICollectionViewTableLayout _heightForHeaderInSection:useRowData:](self, "_heightForHeaderInSection:useRowData:", a4, 0);
    }
    else
    {
      v15 = objc_msgSend(v8, "isEqualToString:", CFSTR("UICollectionElementKindSectionFooter"));
      v13 = 0.0;
      if (v15)
        -[UICollectionViewTableLayout _heightForFooterInSection:useRowData:](self, "_heightForFooterInSection:useRowData:", a4, 0, 0.0);
    }
    v14 = v13 > 0.0;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)_shouldHaveHeaderViewForSection:(int64_t)a3
{
  return -[UICollectionViewTableLayout _shouldHaveViewForElementOfKind:atSection:useRowData:](self, "_shouldHaveViewForElementOfKind:atSection:useRowData:", CFSTR("UICollectionElementKindSectionHeader"), a3, 0);
}

- (BOOL)_shouldHaveFooterViewForSection:(int64_t)a3
{
  return -[UICollectionViewTableLayout _shouldHaveViewForElementOfKind:atSection:useRowData:](self, "_shouldHaveViewForElementOfKind:atSection:useRowData:", CFSTR("UICollectionElementKindSectionFooter"), a3, 0);
}

- (BOOL)_shouldHaveGlobalViewForElementOfKind:(id)a3
{
  return -[UICollectionViewTableLayout _shouldHaveViewForElementOfKind:atSection:useRowData:](self, "_shouldHaveViewForElementOfKind:atSection:useRowData:", a3, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (UIView)_tableHeaderView
{
  return 0;
}

- (UIView)_tableFooterView
{
  return 0;
}

- (id)_titleForHeaderInSection:(int64_t)a3
{
  return 0;
}

- (id)_titleForFooterInSection:(int64_t)a3
{
  return 0;
}

- (id)_detailTextForHeaderInSection:(int64_t)a3
{
  return 0;
}

- (int64_t)_titleAlignmentForHeaderInSection:(int64_t)a3
{
  return 4;
}

- (int64_t)_titleAlignmentForFooterInSection:(int64_t)a3
{
  return 4;
}

- (double)_maxTitleWidthForHeaderInSection:(int64_t)a3
{
  return 1.79769313e308;
}

- (double)_maxTitleWidthForFooterInSection:(int64_t)a3
{
  return 1.79769313e308;
}

- (BOOL)_shouldStripHeaderTopPaddingForSection:(int64_t)a3
{
  return 0;
}

- (BOOL)_shouldUseSearchBarHeaderBehavior
{
  return 0;
}

- (BOOL)_shouldUseNewHeaderFooterBehavior
{
  return 1;
}

- (void)_setHeight:(double)a3 forRowAtIndexPath:(id)a4 usingPresentationValues:(BOOL)a5
{
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  if (os_variant_has_internal_diagnostics())
  {
    if (!a5)
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
LABEL_15:

        goto LABEL_3;
      }
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v12;
      _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Table layout does not yet support translating the index path (usingPresentationValues=NO) for a call to %@", (uint8_t *)&v15, 0xCu);
LABEL_14:

      goto LABEL_15;
    }
  }
  else if (!a5)
  {
    v13 = _setHeight_forRowAtIndexPath_usingPresentationValues____s_category;
    if (!_setHeight_forRowAtIndexPath_usingPresentationValues____s_category)
    {
      v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&_setHeight_forRowAtIndexPath_usingPresentationValues____s_category);
    }
    v14 = *(NSObject **)(v13 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v11 = v14;
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v12;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Table layout does not yet support translating the index path (usingPresentationValues=NO) for a call to %@", (uint8_t *)&v15, 0xCu);
      goto LABEL_14;
    }
  }
LABEL_3:
  if (!self->_deletedIndexPath || (objc_msgSend(v9, "isEqual:") & 1) == 0)
  {
    -[UITableViewRowData setHeight:forRowAtIndexPath:]((uint64_t)self->_rowData, v9, a3);
    -[UICollectionViewLayout invalidateLayout](self, "invalidateLayout");
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutIfNeeded");

  }
}

- (void)_cellAccessoryButtonTappedAtIndexPath:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[UICollectionViewTableLayout _delegateActual](self, "_delegateActual");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[UICollectionViewTableLayout _delegateProxy](self, "_delegateProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collectionView:tableLayout:accessoryButtonTappedForRowWithIndexPath:", v7, self, v8);

  }
}

- (void)_swipeToDeleteCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UICollectionViewTableLayout _swipeActionController](self, "_swipeActionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewTableLayout contextualActionForDeletingRowAtIndexPath:](self, "contextualActionForDeletingRowAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewTableLayout _swipeActionController](self, "_swipeActionController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "swipeItemAtIndexPath:configuration:direction:animated:completion:", v6, v10, objc_msgSend(v11, "_swipeDirectionForLeadingEdge:", 0), 1, 0);

}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (void)setRowHeight:(double)a3
{
  self->_rowHeight = a3;
}

- (double)sectionHeaderHeight
{
  return self->_sectionHeaderHeight;
}

- (void)setSectionHeaderHeight:(double)a3
{
  self->_sectionHeaderHeight = a3;
}

- (double)sectionFooterHeight
{
  return self->_sectionFooterHeight;
}

- (void)setSectionFooterHeight:(double)a3
{
  self->_sectionFooterHeight = a3;
}

- (double)estimatedRowHeight
{
  return self->_estimatedRowHeight;
}

- (void)setEstimatedRowHeight:(double)a3
{
  self->_estimatedRowHeight = a3;
}

- (double)estimatedSectionHeaderHeight
{
  return self->_estimatedSectionHeaderHeight;
}

- (void)setEstimatedSectionHeaderHeight:(double)a3
{
  self->_estimatedSectionHeaderHeight = a3;
}

- (double)estimatedSectionFooterHeight
{
  return self->_estimatedSectionFooterHeight;
}

- (void)setEstimatedSectionFooterHeight:(double)a3
{
  self->_estimatedSectionFooterHeight = a3;
}

- (BOOL)usesVariableMargins
{
  return self->_usesVariableMargins;
}

- (BOOL)overlapsSectionHeaderViews
{
  return self->_overlapsSectionHeaderViews;
}

- (double)_backgroundInset
{
  return self->_backgroundInset;
}

- (double)_topPadding
{
  return self->_topPadding;
}

- (double)_bottomPadding
{
  return self->_bottomPadding;
}

- (BOOL)_isShowingIndex
{
  return self->_showingIndex;
}

- (CGRect)_indexFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_indexFrame.origin.x;
  y = self->_indexFrame.origin.y;
  width = self->_indexFrame.size.width;
  height = self->_indexFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIColor)_accessoryBaseColor
{
  return self->_accessoryBaseColor;
}

- (UIColor)_multiselectCheckmarkColor
{
  return self->_multiselectCheckmarkColor;
}

- (UITableConstants)_constants
{
  return self->_constants;
}

- (void)setConstants:(id)a3
{
  objc_storeStrong((id *)&self->_constants, a3);
}

- (double)_rowSpacing
{
  return self->_rowSpacing;
}

- (UIEdgeInsets)separatorInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_separatorInset.top;
  left = self->_separatorInset.left;
  bottom = self->_separatorInset.bottom;
  right = self->_separatorInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)separatorStyle
{
  return self->_separatorStyle;
}

- (UIVisualEffect)separatorEffect
{
  return self->_separatorEffect;
}

- (void)setSeparatorEffect:(id)a3
{
  objc_storeStrong((id *)&self->_separatorEffect, a3);
}

- (BOOL)cellLayoutMarginsFollowReadableWidth
{
  return self->_cellLayoutMarginsFollowReadableWidth;
}

- (void)setCellLayoutMarginsFollowReadableWidth:(BOOL)a3
{
  self->_cellLayoutMarginsFollowReadableWidth = a3;
}

- (BOOL)insetsContentViewsToSafeArea
{
  return self->_insetsContentViewsToSafeArea;
}

- (BOOL)separatorInsetIsRelativeToCellEdges
{
  return self->_separatorInsetIsRelativeToCellEdges;
}

- (UITableViewRowData)rowData
{
  return self->_rowData;
}

- (void)setRowData:(id)a3
{
  objc_storeStrong((id *)&self->_rowData, a3);
}

- (NSMutableArray)deleteIndexPaths
{
  return self->_deleteIndexPaths;
}

- (void)setDeleteIndexPaths:(id)a3
{
  objc_storeStrong((id *)&self->_deleteIndexPaths, a3);
}

- (NSMutableArray)insertIndexPaths
{
  return self->_insertIndexPaths;
}

- (void)setInsertIndexPaths:(id)a3
{
  objc_storeStrong((id *)&self->_insertIndexPaths, a3);
}

- (UISwipeActionController)_swipeActionController
{
  return self->_swipeActionController;
}

- (void)_setSwipeActionController:(id)a3
{
  objc_storeStrong((id *)&self->_swipeActionController, a3);
}

- (NSIndexPath)deletedIndexPath
{
  return self->_deletedIndexPath;
}

- (void)setDeletedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_deletedIndexPath, a3);
}

- (BOOL)_showsAdditionalSeparators
{
  return self->_showsAdditionalSeparators;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedIndexPath, 0);
  objc_storeStrong((id *)&self->_swipeActionController, 0);
  objc_storeStrong((id *)&self->_insertIndexPaths, 0);
  objc_storeStrong((id *)&self->_deleteIndexPaths, 0);
  objc_storeStrong((id *)&self->_rowData, 0);
  objc_storeStrong((id *)&self->_separatorEffect, 0);
  objc_storeStrong((id *)&self->_constants, 0);
  objc_storeStrong((id *)&self->_multiselectCheckmarkColor, 0);
  objc_storeStrong((id *)&self->_accessoryBaseColor, 0);
  objc_storeStrong((id *)&self->_footerPreferredAttributesCache, 0);
  objc_storeStrong((id *)&self->_headerPreferredAttributesCache, 0);
  objc_storeStrong((id *)&self->_preferredAttributesCache, 0);
  objc_storeStrong((id *)&self->_indexPathCache, 0);
  objc_storeStrong((id *)&self->_darkenedSeparatorColor, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_floatingElementKinds, 0);
}

@end
