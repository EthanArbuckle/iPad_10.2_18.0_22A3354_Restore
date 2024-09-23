@implementation PKDashboardPassFlowLayout

+ (double)topMarginInFirstSection
{
  uint64_t v2;
  double result;

  v2 = PKUIGetMinScreenWidthType();
  result = 16.0;
  if (!v2)
    return 8.0;
  return result;
}

- (PKDashboardPassFlowLayout)init
{
  PKDashboardPassFlowLayout *v2;
  double v3;
  double v4;
  objc_super v6;
  _QWORD v7[5];
  uint64_t v8;
  id *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = (id *)&v8;
  v10 = 0x3042000000;
  v11 = __Block_byref_object_copy__36;
  v12 = __Block_byref_object_dispose__36;
  v13 = 0;
  v7[1] = 3221225472;
  v7[2] = __33__PKDashboardPassFlowLayout_init__block_invoke;
  v7[3] = &unk_1E3E71890;
  v7[4] = &v8;
  v6.receiver = self;
  v6.super_class = (Class)PKDashboardPassFlowLayout;
  v7[0] = MEMORY[0x1E0C809B0];
  v2 = -[PKDashboardPassFlowLayout initWithSectionProvider:](&v6, sel_initWithSectionProvider_, v7);
  if (v2)
  {
    objc_storeWeak(v9 + 5, v2);
    +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
    v2->_horizontalInset = v3;
    objc_msgSend((id)objc_opt_class(), "topMarginInFirstSection");
    v2->_topMarginInFirstSection = v4;
  }
  _Block_object_dispose(&v8, 8);
  objc_destroyWeak(&v13);
  return v2;
}

id __33__PKDashboardPassFlowLayout_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;
  void *v7;

  v4 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "layoutSectionAtIndex:layoutEnvironment:", a2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKDashboardPassFlowLayout;
  v4 = a3;
  -[PKDashboardPassFlowLayout invalidateLayoutWithContext:](&v9, sel_invalidateLayoutWithContext_, v4);
  objc_msgSend(v4, "invalidatedItemIndexPaths", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassFlowLayout _indexPathForPassGroup](self, "_indexPathForPassGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = PKEqualObjects();

    if (v8)
      self->_preventLayoutComputation = 1;
  }

}

- (void)prepareLayout
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  objc_super v9;

  if (self->_preventLayoutComputation)
  {
    self->_preventLayoutComputation = 0;
  }
  else
  {
    -[PKDashboardPassFlowLayout collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "delegate");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v3)
    {
      if (v4)
      {
        -[PKDashboardPassFlowLayout _indexPathForPassGroup](self, "_indexPathForPassGroup");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "collectionView:layout:sizeForItemAtIndexPath:", v3, self, v6);
        self->_passCellSize.width = v7;
        self->_passCellSize.height = v8;

        v9.receiver = self;
        v9.super_class = (Class)PKDashboardPassFlowLayout;
        -[PKDashboardPassFlowLayout prepareLayout](&v9, sel_prepareLayout);
      }
    }

  }
}

- (id)layoutSectionAtIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  char v9;
  char v10;
  char v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  double topMarginInFirstSection;
  char v18;
  void *v19;
  int v20;
  int v21;
  char v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  char v37;
  int v38;
  int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  BOOL v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  double v72;
  id v73;
  char v74;
  id v75;
  id v77;
  _QWORD v78[4];
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[4];
  id v85;
  id location;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v73 = a4;
  -[PKDashboardPassFlowLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v8 = v7;
  v74 = objc_opt_respondsToSelector();
  v9 = objc_opt_respondsToSelector();
  v10 = objc_opt_respondsToSelector();
  v11 = objc_opt_respondsToSelector();
  v12 = objc_opt_respondsToSelector();
  v77 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v75 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "collectionView:numberOfItemsInSection:", v5, a3);

  if (v14 < 1)
  {
    v70 = 0;
    goto LABEL_66;
  }
  -[PKDashboardPassFlowLayout _indexPathForPassGroup](self, "_indexPathForPassGroup");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "section");
  topMarginInFirstSection = 0.0;
  if (v16 == a3)
    topMarginInFirstSection = self->_topMarginInFirstSection;
  v72 = topMarginInFirstSection;

  if ((v9 & 1) != 0 && objc_msgSend(v6, "collectionView:layout:isListSectionAtIndex:", v5, self, a3))
  {
    v18 = v11;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", 2);
    if ((v10 & 1) != 0)
    {
      v20 = objc_msgSend(v6, "collectionView:layout:hasHeaderForSectionAtIndex:", v5, self, a3);
      if ((v18 & 1) == 0)
        goto LABEL_8;
    }
    else
    {
      v20 = 0;
      if ((v18 & 1) == 0)
      {
LABEL_8:
        v21 = 0;
        if (!v20)
        {
LABEL_59:
          if (v21)
          {
            objc_msgSend(v19, "setFooterMode:", 1);
            if ((v12 & 1) == 0)
            {
LABEL_64:
              v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39B8]), "initWithListAppearance:", 2);
              objc_msgSend(v65, "setTopSeparatorInsets:", 0.0, 14.0, 0.0, 0.0);
              objc_msgSend(v65, "setBottomSeparatorInsets:", 0.0, 14.0, 0.0, 0.0);
              objc_msgSend(v19, "setSeparatorConfiguration:", v65);
              objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v19, v73);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "setContentInsets:", v72, self->_horizontalInset, 16.0, self->_horizontalInset);
              goto LABEL_65;
            }
          }
          else if ((v12 & 1) == 0)
          {
            goto LABEL_64;
          }
          objc_initWeak(&location, self);
          v84[0] = MEMORY[0x1E0C809B0];
          v84[1] = 3221225472;
          v84[2] = __68__PKDashboardPassFlowLayout_layoutSectionAtIndex_layoutEnvironment___block_invoke;
          v84[3] = &unk_1E3E64EA8;
          objc_copyWeak(&v85, &location);
          objc_msgSend(v19, "setTrailingSwipeActionsConfigurationProvider:", v84);
          objc_destroyWeak(&v85);
          objc_destroyWeak(&location);
          goto LABEL_64;
        }
LABEL_58:
        objc_msgSend(v19, "setHeaderMode:", 1);
        goto LABEL_59;
      }
    }
    v21 = objc_msgSend(v6, "collectionView:layout:hasFooterForSectionAtIndex:", v5, self, a3);
    if (!v20)
      goto LABEL_59;
    goto LABEL_58;
  }
  objc_msgSend(v5, "safeAreaInsets");
  v22 = 0;
  v23 = 0;
  v26 = v8 - v24 - v25;
  v27 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v28 = 0.0;
  v29 = 0.0;
  v30 = 0.0;
  v31 = 0.0;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v23, a3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collectionView:layout:sizeForItemAtIndexPath:", v5, self, v32);
    v34 = v33;
    v36 = v35;
    if ((v74 & 1) != 0)
    {
      v37 = objc_msgSend(v6, "itemIsStackableInCollectionView:atIndexPath:", v5, v32);
      v38 = objc_msgSend(v6, "itemIsIndependentInCollectionView:atIndexPath:", v5, v32);
      if ((v37 & 1) != 0)
      {
        v39 = 0;
        if ((v22 & 1) != 0)
          v30 = v30 + 8.0;
        else
          v30 = 0.0;
        v22 = 1;
        goto LABEL_34;
      }
    }
    else
    {
      v38 = objc_msgSend(v6, "itemIsIndependentInCollectionView:atIndexPath:", v5, v32);
    }
    if ((v22 & 1) != 0)
      v30 = 0.0;
    v40 = -0.0;
    if ((v22 & 1) != 0)
      v40 = v31;
    if (v26 - v29 >= v34)
    {
      v43 = v29 + v40;
      v44 = v29 + v40 == 0.0;
      v45 = v29 + v40 + 8.0;
      if (v44)
        v29 = v43;
      else
        v29 = v45;
      v39 = 1;
      v22 = 0;
    }
    else
    {
      if (v30 <= 0.0)
        v41 = v27;
      else
        v41 = v30;
      v29 = 0.0;
      v42 = v28 + v41 + 0.0;
      if (v38)
        v28 = v42 + 8.0;
      else
        v28 = v42;
      PKFloatRoundToPixel();
      -[PKDashboardPassFlowLayout _adjustItems:withLateralMove:](self, "_adjustItems:withLateralMove:", v77);
      objc_msgSend(v77, "removeAllObjects");
      v22 = 0;
      v39 = 1;
    }
LABEL_34:
    objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForCellWithIndexPath:", v32);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setSize:", v34, v36);
    objc_msgSend(v46, "setFrame:", v29, v28 + v30, v34, v36);
    objc_msgSend(v46, "setZIndex:", -[PKDashboardPassFlowLayout _indexPathIsPassGroupIndexPath:](self, "_indexPathIsPassGroupIndexPath:", v32));
    objc_msgSend(v75, "addObject:", v46);
    objc_msgSend(v77, "addObject:", v46);
    if (!v39)
      v31 = v34;
    v47 = -0.0;
    if (v39)
      v48 = -0.0;
    else
      v48 = v36;
    v30 = v48 + v30;
    if (v39)
      v47 = v34;
    v29 = v29 + v47;

    ++v23;
    v27 = v36;
  }
  while (v14 != v23);
  if (objc_msgSend(v77, "count"))
  {
    PKFloatRoundToPixel();
    v50 = v49;
    v51 = (void *)objc_msgSend(v77, "copy");
    -[PKDashboardPassFlowLayout _adjustItems:withLateralMove:](self, "_adjustItems:withLateralMove:", v51, v50);

    objc_msgSend(v77, "removeAllObjects");
  }
  if (v30 <= 0.0)
    v52 = v36;
  else
    v52 = v30;
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v75, "count"));
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v54 = v75;
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
  if (v55)
  {
    v56 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v55; ++i)
      {
        if (*(_QWORD *)v81 != v56)
          objc_enumerationMutation(v54);
        v58 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
        v59 = (void *)MEMORY[0x1E0DC3358];
        objc_msgSend(v58, "frame");
        objc_msgSend(v59, "customItemWithFrame:zIndex:", objc_msgSend(v58, "zIndex"), v60, v61, v62, v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "addObject:", v64);

      }
      v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
    }
    while (v55);
  }

  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v28 + v52);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v19, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (void *)MEMORY[0x1E0DC3350];
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __68__PKDashboardPassFlowLayout_layoutSectionAtIndex_layoutEnvironment___block_invoke_2;
  v78[3] = &unk_1E3E718B8;
  v79 = v53;
  v68 = v53;
  objc_msgSend(v67, "customGroupWithLayoutSize:itemProvider:", v66, v78);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setContentInsets:", v72, 0.0, 16.0, 0.0);

LABEL_65:
LABEL_66:

  return v70;
}

id __68__PKDashboardPassFlowLayout_layoutSectionAtIndex_layoutEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionView:layout:trailingSwipeActionsConfigurationForItemAtIndexPath:", v7, WeakRetained, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __68__PKDashboardPassFlowLayout_layoutSectionAtIndex_layoutEnvironment___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_adjustItems:(id)a3 withLateralMove:(double)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "frame");
        objc_msgSend(v10, "setFrame:", v11 + a4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double y;
  void *v5;
  void *v6;
  BOOL *p_userIsHoldingCardInCurrentDrag;
  int v8;
  BOOL *p_userIsActivelyDragging;
  double v11;
  double v12;
  BOOL v13;
  BOOL currentDraggingWentBelowThreshold;
  _BOOL4 needsCustomLocation;
  BOOL v16;

  y = a3.origin.y;
  -[PKDashboardPassFlowLayout collectionView](self, "collectionView", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  p_userIsHoldingCardInCurrentDrag = &self->_userIsHoldingCardInCurrentDrag;
  if (self->_userIsHoldingCardInCurrentDrag)
  {
    v8 = 1;
  }
  else
  {
    if ((objc_msgSend(v5, "isDragging") & 1) == 0)
    {
      LOBYTE(v8) = 0;
      p_userIsActivelyDragging = &self->_userIsActivelyDragging;
      goto LABEL_11;
    }
    v8 = objc_msgSend(v6, "isDecelerating") ^ 1;
  }
  p_userIsActivelyDragging = &self->_userIsActivelyDragging;
  if (!self->_userIsActivelyDragging && v8 != 0)
  {
    self->_currentDraggingWentBelowThreshold = 0;
    self->_userWasHoldingCard = *p_userIsHoldingCardInCurrentDrag;
    LOBYTE(v8) = 1;
  }
LABEL_11:
  *p_userIsActivelyDragging = v8;
  objc_msgSend(v6, "adjustedContentInset");
  v12 = -v11;
  v13 = !*p_userIsActivelyDragging && y < v12;
  if (v13 && !self->_currentDraggingWentBelowThreshold)
    self->_bouncing = 1;
  if (y >= v12)
  {
    currentDraggingWentBelowThreshold = 0;
    self->_bouncing = 0;
    goto LABEL_26;
  }
  if (self->_bouncing)
  {
    currentDraggingWentBelowThreshold = 0;
    goto LABEL_26;
  }
  if (!*p_userIsActivelyDragging)
  {
    currentDraggingWentBelowThreshold = self->_currentDraggingWentBelowThreshold;
    if (!currentDraggingWentBelowThreshold)
      goto LABEL_26;
    p_userIsHoldingCardInCurrentDrag = &self->_userWasHoldingCard;
  }
  currentDraggingWentBelowThreshold = !*p_userIsHoldingCardInCurrentDrag;
  self->_currentDraggingWentBelowThreshold = 1;
LABEL_26:
  needsCustomLocation = self->_needsCustomLocation;
  self->_needsCustomLocation = currentDraggingWentBelowThreshold;
  v16 = needsCustomLocation || currentDraggingWentBelowThreshold;

  return v16;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)PKDashboardPassFlowLayout;
  -[PKDashboardPassFlowLayout invalidationContextForBoundsChange:](&v8, sel_invalidationContextForBoundsChange_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_needsCustomLocation)
  {
    -[PKDashboardPassFlowLayout _indexPathForPassGroup](self, "_indexPathForPassGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidateItemsAtIndexPaths:", v6);

  }
  return v4;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKDashboardPassFlowLayout;
  -[PKDashboardPassFlowLayout layoutAttributesForItemAtIndexPath:](&v7, sel_layoutAttributesForItemAtIndexPath_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassFlowLayout _modifiedLayoutAttributes:](self, "_modifiedLayoutAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKDashboardPassFlowLayout;
  -[PKDashboardPassFlowLayout layoutAttributesForElementsInRect:](&v10, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardPassFlowLayout _modifiedLayoutAttributes:](self, "_modifiedLayoutAttributes:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "setObject:atIndexedSubscript:", v8, v6);
      ++v6;
    }
    while (v6 < objc_msgSend(v5, "count"));
  }
  return v5;
}

- (CGSize)collectionViewContentSize
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
  objc_super v13;
  CGSize result;

  v13.receiver = self;
  v13.super_class = (Class)PKDashboardPassFlowLayout;
  -[PKDashboardPassFlowLayout collectionViewContentSize](&v13, sel_collectionViewContentSize);
  v4 = v3;
  v6 = v5;
  if (!self->_cellsPresented)
  {
    -[PKDashboardPassFlowLayout collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8 - self->_passCellSize.height;
    objc_msgSend(v7, "safeAreaInsets");
    v6 = v6 - (v9 - v10 + -16.0);

  }
  v11 = v4;
  v12 = v6;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)revealContentAnimated:(BOOL)a3
{
  if (!self->_cellsPresented)
  {
    self->_hideCellsDuringDismissal = 0;
    self->_cellsPresented = 1;
  }
}

- (void)hideContent
{
  if (!self->_hideCellsDuringDismissal)
  {
    self->_cellsPresented = 0;
    self->_hideCellsDuringDismissal = 1;
  }
}

- (BOOL)_indexPathIsPassGroupIndexPath:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "section"))
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "row") == 0;

  return v4;
}

- (id)_indexPathForPassGroup
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
}

- (id)_modifiedLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double topMarginInFirstSection;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  v4 = a3;
  -[PKDashboardPassFlowLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v6, "frame");
  v8 = v7;
  topMarginInFirstSection = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "alpha");
  v16 = v15;
  objc_msgSend(v6, "indexPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKDashboardPassFlowLayout _indexPathIsPassGroupIndexPath:](self, "_indexPathIsPassGroupIndexPath:", v17))
  {
    v18 = objc_msgSend(v6, "representedElementCategory");

    if (!v18)
    {
      topMarginInFirstSection = self->_topMarginInFirstSection;
      if (self->_needsCustomLocation)
      {
        objc_msgSend(v5, "contentOffset");
        v20 = v19;
        objc_msgSend(v5, "adjustedContentInset");
        v22 = v20 + v21;
LABEL_12:
        topMarginInFirstSection = topMarginInFirstSection + v22;
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  else
  {

  }
  if (self->_hideCellsDuringDismissal && !self->_fade)
  {
    objc_msgSend(v5, "bounds");
    v24 = v23;
    objc_msgSend(v5, "safeAreaInsets");
    v22 = v24 - v25 - self->_topMarginInFirstSection - self->_passCellSize.height;
    goto LABEL_12;
  }
  if (!self->_cellsPresented)
    v16 = 0.0;
LABEL_13:
  objc_msgSend(v6, "setFrame:", v8, topMarginInFirstSection, v12, v14);
  objc_msgSend(v6, "setAlpha:", v16);

  return v6;
}

- (void)passPanDidBegin
{
  self->_userIsHoldingCardInCurrentDrag = 1;
}

- (void)passPanDidEnd
{
  self->_userIsHoldingCardInCurrentDrag = 0;
}

- (BOOL)fade
{
  return self->_fade;
}

- (void)setFade:(BOOL)a3
{
  self->_fade = a3;
}

@end
