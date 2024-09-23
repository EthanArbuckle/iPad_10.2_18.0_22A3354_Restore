@implementation _TVMLShelfViewLayout

- (_TVMLShelfViewLayout)init
{
  _TVMLShelfViewLayout *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TVMLShelfViewLayout;
  result = -[_TVShelfViewLayout init](&v3, sel_init);
  if (result)
    result->_cachedTallestHeaderHeight = -1.0;
  return result;
}

- (void)setCellMetrics:(TVCellMetrics *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  self->_cellMetrics.cellSize = a3->cellSize;
  v3 = *(_OWORD *)&a3->cellInset.bottom;
  v5 = *(_OWORD *)&a3->cellPadding.top;
  v4 = *(_OWORD *)&a3->cellPadding.bottom;
  *(_OWORD *)&self->_cellMetrics.cellInset.top = *(_OWORD *)&a3->cellInset.top;
  *(_OWORD *)&self->_cellMetrics.cellInset.bottom = v3;
  *(_OWORD *)&self->_cellMetrics.cellPadding.top = v5;
  *(_OWORD *)&self->_cellMetrics.cellPadding.bottom = v4;
  v6 = *(_OWORD *)&a3->cellMargin.bottom;
  v8 = *(_OWORD *)&a3->cellInsetAlt.top;
  v7 = *(_OWORD *)&a3->cellInsetAlt.bottom;
  *(_OWORD *)&self->_cellMetrics.cellMargin.top = *(_OWORD *)&a3->cellMargin.top;
  *(_OWORD *)&self->_cellMetrics.cellMargin.bottom = v6;
  *(_OWORD *)&self->_cellMetrics.cellInsetAlt.top = v8;
  *(_OWORD *)&self->_cellMetrics.cellInsetAlt.bottom = v7;
  if (a3->cellSize.width > 2.22044605e-16 && a3->cellSize.height > 2.22044605e-16)
    -[_TVShelfViewLayout setItemSize:](self, "setItemSize:", a3->cellSize.width);
}

- (void)setShowcaseFactor:(double)a3
{
  _TVMLShelfViewLayoutInvalidationContext *v4;

  self->_showcaseFactor = a3;
  v4 = objc_alloc_init(_TVMLShelfViewLayoutInvalidationContext);
  -[_TVMLShelfViewLayoutInvalidationContext setInvalidateShowcase:](v4, "setInvalidateShowcase:", 1);
  -[_TVMLShelfViewLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v4);

}

- (double)expectedLineSpacing
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[144];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  -[_TVMLShelfViewLayout cellMetrics](self, "cellMetrics");
  TVRowMetricsMakeWithCellMetrics((uint64_t)v15, (uint64_t)&v16);
  v12 = v18;
  v13 = v19;
  v14 = v20;
  v10 = v16;
  v11 = v17;
  objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithRowMetrics:", &v10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v2;
  v12 = v18;
  v13 = v19;
  v14 = v20;
  v10 = v16;
  v11 = v17;
  objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithRowMetrics:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  +[TVMLUtilities rowSpacingMetricsForRowMetrics:](TVMLUtilities, "rowSpacingMetricsForRowMetrics:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "tv_rowMetricsValue");
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
  }

  v8 = *((double *)&v10 + 1);
  return v8;
}

- (double)headerAllowance
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  char v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;

  -[_TVMLShelfViewLayout cachedTallestHeaderHeight](self, "cachedTallestHeaderHeight");
  v4 = v3;
  if (v3 == -1.0)
  {
    -[_TVMLShelfViewLayout collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_opt_respondsToSelector();
    v10 = 0.0;
    if ((v9 & 1) == 0)
    {
      -[_TVShelfViewLayout headerReferenceSize](self, "headerReferenceSize");
      v10 = v11;
    }
    -[_TVMLShelfViewLayout collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "numberOfSections");

    if (v13 >= 1)
    {
      for (i = 0; i != v13; ++i)
      {
        if ((v9 & 1) != 0)
        {
          -[_TVMLShelfViewLayout collectionView](self, "collectionView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "collectionView:layout:referenceSizeForHeaderInSection:", v15, self, i);
          v17 = v16;

          if (v17 > v10)
            v10 = v17;
        }
      }
    }
    -[_TVMLShelfViewLayout setCachedTallestHeaderHeight:](self, "setCachedTallestHeaderHeight:", v10);
    v5 = 0.0;
    if (v10 > 0.0)
    {
      -[_TVShelfViewLayout headerBottomMargin](self, "headerBottomMargin");
      v5 = v10 + v18;
    }

  }
  else
  {
    v5 = 0.0;
    if (v3 > 0.0)
    {
      -[_TVShelfViewLayout headerBottomMargin](self, "headerBottomMargin");
      return v4 + v6;
    }
  }
  return v5;
}

- (id)contentRowMetricsForShowcase:(BOOL)a3
{
  void *v5;
  void *v6;
  char v7;
  char v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  uint64_t i;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  _BOOL4 v46;
  _BOOL4 v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  uint64_t v53;
  double v54;
  double v55;
  _QWORD v56[28];
  _BYTE v57[144];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;

  -[_TVMLShelfViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_opt_respondsToSelector();
  v8 = objc_opt_respondsToSelector();
  v9 = 0.0;
  if (!a3 && (v7 & 1) == 0)
  {
    -[_TVShelfViewLayout headerReferenceSize](self, "headerReferenceSize");
    v9 = v10;
  }
  v11 = *MEMORY[0x24BDF7718];
  v55 = *(double *)(MEMORY[0x24BDF7718] + 16);
  -[_TVMLShelfViewLayout collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "numberOfSections");

  if (v13 >= 1)
  {
    v14 = 0;
    v15 = a3 | v7 ^ 1;
    do
    {
      if ((v15 & 1) == 0)
      {
        -[_TVMLShelfViewLayout collectionView](self, "collectionView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "collectionView:layout:referenceSizeForHeaderInSection:", v16, self, v14);
        v18 = v17;

        if (v18 > v9)
          v9 = v18;
      }
      if ((v8 & 1) != 0)
      {
        -[_TVMLShelfViewLayout collectionView](self, "collectionView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "collectionView:layout:insetForSectionAtIndex:", v19, self, v14);
        v21 = v20;
        v23 = v22;

        if (v21 > v11)
          v11 = v21;
        v24 = v55;
        if (v23 > v55)
          v24 = v23;
        v55 = v24;
      }
      ++v14;
    }
    while (v13 != v14);
  }
  v54 = v9;
  v25 = -[_TVShelfViewLayout computedRowCount](self, "computedRowCount");
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v58 = 0u;
  -[_TVMLShelfViewLayout cellMetrics](self, "cellMetrics");
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v25, TVRowMetricsMakeWithCellMetrics((uint64_t)v57, (uint64_t)&v58));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25 >= 1)
  {
    for (i = 0; i != v25; ++i)
    {
      v29 = *((double *)&v58 + 1);
      v28 = v58;
      v31 = *((_QWORD *)&v59 + 1);
      v30 = *(double *)&v59;
      v33 = *((_QWORD *)&v60 + 1);
      v32 = v60;
      v35 = *((_QWORD *)&v61 + 1);
      v34 = v61;
      v36 = *((double *)&v62 + 1);
      v37 = *(double *)&v62;
      if (!i)
      {
        if (v54 > 0.0)
        {
          v53 = *((_QWORD *)&v61 + 1);
          -[_TVShelfViewLayout headerSelectionMargin](self, "headerSelectionMargin", *(double *)&v61);
          v39 = v38;
          -[_TVShelfViewLayout headerBottomMargin](self, "headerBottomMargin");
          v41 = v40;
          -[_TVMLShelfViewLayout cellMetrics](self, "cellMetrics");
          v42 = v39 - (v41 - *(double *)&v56[24]);
          v32 = 0;
          v37 = fmax(v42, 0.0);
          -[_TVShelfViewLayout headerBottomMargin](self, "headerBottomMargin");
          v35 = v53;
          v44 = v54 + v43;
          v29 = v29 + v44;
          v30 = v30 + v44;
          v34 = 0;
        }
        v45 = fmax(v37 - v11, 0.0);
        if (v11 > 0.0)
        {
          v29 = v11 + v29;
          v30 = v11 + v30;
          v37 = v45;
        }
      }
      v46 = v55 > 0.0;
      v47 = v25 - 1 == i;
      v48 = -0.0;
      if (v47 && v46)
        v48 = v55;
      v56[0] = v28;
      *(double *)&v56[1] = v48 + v29;
      *(double *)&v56[2] = v48 + v30;
      v49 = fmax(v36 - v55, 0.0);
      v56[3] = v31;
      v56[4] = v32;
      if (!v47 || !v46)
        v49 = v37;
      v56[5] = v33;
      v56[6] = v34;
      v56[7] = v35;
      *(double *)&v56[8] = v49;
      *(double *)&v56[9] = v36;
      objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithRowMetrics:", v56);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v50);

    }
  }
  v51 = (void *)objc_msgSend(v26, "copy");

  return v51;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  objc_super v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "invalidateShowcase"))
  {
    v17 = v4;
    -[_TVMLShelfViewLayout collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "conformsToProtocol:", &unk_2557B2BE8))
    {
      objc_msgSend(v5, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

    v8 = objc_opt_respondsToSelector();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVMLShelfViewLayout collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "numberOfSections");

    if (v11 >= 1)
    {
      v12 = 0;
      do
      {
        if ((v8 & 1) != 0)
          objc_msgSend(v7, "collectionView:layout:referenceSizeForHeaderInSection:", v5, self, v12);
        else
          -[_TVShelfViewLayout headerReferenceSize](self, "headerReferenceSize");
        if (v13 > 0.0)
        {
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v14);

        }
        ++v12;
        -[_TVMLShelfViewLayout collectionView](self, "collectionView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "numberOfSections");

      }
      while (v12 < v16);
    }
    -[_TVMLShelfViewLayout setCachedTallestHeaderHeight:](self, "setCachedTallestHeaderHeight:", -1.0);
    objc_msgSend(v17, "invalidateSupplementaryElementsOfKind:atIndexPaths:", CFSTR("TVShelfLayoutElementKindHeader"), v9);

  }
  v18.receiver = self;
  v18.super_class = (Class)_TVMLShelfViewLayout;
  -[_TVShelfViewLayout invalidateLayoutWithContext:](&v18, sel_invalidateLayoutWithContext_, v4);

}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)_TVMLShelfViewLayout;
  -[_TVShelfViewLayout layoutAttributesForElementsInRect:](&v17, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "representedElementCategory") == 1)
        {
          objc_msgSend(v9, "representedElementKind");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("TVShelfLayoutElementKindHeader"));

          if (v11)
          {
            -[_TVMLShelfViewLayout showcaseFactor](self, "showcaseFactor");
            +[TVMLUtilities _headerFadeForShowcaseFactor:](TVMLUtilities, "_headerFadeForShowcaseFactor:");
            objc_msgSend(v9, "setAlpha:");
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v6);
  }
  return v4;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  int v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_TVMLShelfViewLayout;
  v6 = a3;
  -[_TVShelfViewLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](&v10, sel_layoutAttributesForSupplementaryViewOfKind_atIndexPath_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", CFSTR("TVShelfLayoutElementKindHeader"), v10.receiver, v10.super_class);

  if (v8)
  {
    -[_TVMLShelfViewLayout showcaseFactor](self, "showcaseFactor");
    +[TVMLUtilities _headerFadeForShowcaseFactor:](TVMLUtilities, "_headerFadeForShowcaseFactor:");
    objc_msgSend(v7, "setAlpha:");
  }
  return v7;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
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
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  BOOL v31;
  double v32;
  double v33;
  double v34;
  objc_super v35;
  CGPoint result;

  v35.receiver = self;
  v35.super_class = (Class)_TVMLShelfViewLayout;
  -[_TVShelfViewLayout targetContentOffsetForProposedContentOffset:](&v35, sel_targetContentOffsetForProposedContentOffset_, a3.x, a3.y);
  v5 = v4;
  v7 = v6;
  -[_TVMLShelfViewLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPathForPreferredFocusedViewInCollectionView:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "layoutAttributesForItemAtIndexPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v13 = v12;
    v15 = v14;

    -[_TVShelfViewLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v18 = v17;
    v20 = v19;

    objc_msgSend(v8, "contentOffset");
    v22 = v18 + v20 * 0.5 - (v13 - v21 + v15 * 0.5);
    objc_msgSend(v8, "contentInset");
    v25 = v24;
    v26 = 0.0;
    if (v18 - v22 < v23)
      v26 = v23 - (v18 - v22);
    v27 = v22 - v26;
    objc_msgSend(v8, "bounds");
    v29 = v28 - (v18 + v20 - v27);
    v30 = v25 - v29;
    v31 = v29 < v25;
    v32 = -0.0;
    if (v31)
      v32 = v30;
    v5 = v27 + v32;
  }

  v33 = v5;
  v34 = v7;
  result.y = v34;
  result.x = v33;
  return result;
}

- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4 type:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _TVMLShelfViewLayout *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  if (a5 == 1)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __74___TVMLShelfViewLayout__animationForReusableView_toLayoutAttributes_type___block_invoke;
    v12[3] = &unk_24EB85E78;
    v13 = v8;
    v14 = self;
    v15 = v9;
    v10 = (void *)objc_msgSend(v12, "copy");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (TVCellMetrics)cellMetrics
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[3].cellInsetAlt.right;
  *(_OWORD *)&retstr->cellInsetAlt.bottom = *(_OWORD *)&self[3].cellInsetAlt.left;
  *(_OWORD *)&retstr->cellMargin.top = v3;
  *(_OWORD *)&retstr->cellMargin.bottom = *(_OWORD *)&self[3].cellMargin.left;
  v4 = *(_OWORD *)&self[3].cellPadding.right;
  *(_OWORD *)&retstr->cellPadding.bottom = *(_OWORD *)&self[3].cellPadding.left;
  *(_OWORD *)&retstr->cellInset.top = v4;
  v5 = *(_OWORD *)&self[3].cellInset.right;
  *(_OWORD *)&retstr->cellInset.bottom = *(_OWORD *)&self[3].cellInset.left;
  *(_OWORD *)&retstr->cellInsetAlt.top = v5;
  v6 = *(_OWORD *)&self[3].cellSize.height;
  retstr->cellSize = *(CGSize *)&self[2].cellMargin.right;
  *(_OWORD *)&retstr->cellPadding.top = v6;
  return self;
}

- (double)showcaseFactor
{
  return self->_showcaseFactor;
}

- (double)cachedTallestHeaderHeight
{
  return self->_cachedTallestHeaderHeight;
}

- (void)setCachedTallestHeaderHeight:(double)a3
{
  self->_cachedTallestHeaderHeight = a3;
}

@end
