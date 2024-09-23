@implementation PKHeaderVerticalScrollingLayout

- (PKHeaderVerticalScrollingLayout)init
{
  PKHeaderVerticalScrollingLayout *v2;
  double v3;
  uint64_t v4;
  NSIndexPath *headerIndexPath;
  objc_super v7;
  _QWORD v8[5];
  uint64_t v9;
  id *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = (id *)&v9;
  v11 = 0x3042000000;
  v12 = __Block_byref_object_copy__47;
  v13 = __Block_byref_object_dispose__47;
  v14 = 0;
  v8[1] = 3221225472;
  v8[2] = __39__PKHeaderVerticalScrollingLayout_init__block_invoke;
  v8[3] = &unk_1E3E71890;
  v8[4] = &v9;
  v7.receiver = self;
  v7.super_class = (Class)PKHeaderVerticalScrollingLayout;
  v8[0] = MEMORY[0x1E0C809B0];
  v2 = -[PKHeaderVerticalScrollingLayout initWithSectionProvider:](&v7, sel_initWithSectionProvider_, v8);
  if (v2)
  {
    +[PKDashboardCollectionViewCell defaultHorizontalInset](PKPaymentTransactionCollectionViewCell, "defaultHorizontalInset");
    v2->_horizontalInset = v3;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    headerIndexPath = v2->_headerIndexPath;
    v2->_headerIndexPath = (NSIndexPath *)v4;

    objc_storeWeak(v10 + 5, v2);
  }
  _Block_object_dispose(&v9, 8);
  objc_destroyWeak(&v14);
  return v2;
}

id __39__PKHeaderVerticalScrollingLayout_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

- (void)prepareLayout
{
  void *v3;
  void *v4;
  double v5;
  objc_super v6;

  -[PKHeaderVerticalScrollingLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView:layout:sizeForItemAtIndexPath:", v3, self, self->_headerIndexPath);
  self->_headerHeight = v5;
  v6.receiver = self;
  v6.super_class = (Class)PKHeaderVerticalScrollingLayout;
  -[PKHeaderVerticalScrollingLayout prepareLayout](&v6, sel_prepareLayout);

}

- (id)layoutSectionAtIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  char v12;
  char v13;
  char v14;
  char v15;
  double v16;
  double v17;
  unint64_t titleInset;
  void *v19;
  int v20;
  int v21;
  id v22;
  uint64_t v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  id location[2];

  v6 = a4;
  -[PKHeaderVerticalScrollingLayout collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "collectionView:numberOfItemsInSection:", v7, a3);

  v11 = objc_opt_respondsToSelector();
  v12 = objc_opt_respondsToSelector();
  v13 = objc_opt_respondsToSelector();
  v14 = objc_opt_respondsToSelector();
  if (v10 >= 1)
  {
    v15 = v14;
    v17 = 16.0;
    if (-[NSIndexPath section](self->_headerIndexPath, "section") == a3)
    {
      titleInset = self->_titleInset;
      v16 = 16.0;
      if (titleInset == 1)
        v16 = 7.0;
      if (titleInset == 2)
        v17 = 29.0;
      else
        v17 = v16;
    }
    if ((v11 & 1) == 0
      || !objc_msgSend(v8, "collectionView:layout:isListSectionAtIndex:", v7, self, a3, v16))
    {
      objc_msgSend(v7, "frame", v16);
      objc_msgSend(v7, "safeAreaInsets");
      v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v23 = 0;
      v24 = 0.0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v23, a3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "collectionView:layout:sizeForItemAtIndexPath:", v7, self, v25);
        v27 = v26;
        PKFloatRoundToPixel();
        objc_msgSend(MEMORY[0x1E0DC3358], "customItemWithFrame:");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v28);

        v24 = v24 + v27;
        ++v23;
      }
      while (v10 != v23);
      objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v24);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v19, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x1E0DC3350];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __74__PKHeaderVerticalScrollingLayout_layoutSectionAtIndex_layoutEnvironment___block_invoke_2;
      v36[3] = &unk_1E3E752A8;
      v37 = v22;
      v32 = v22;
      objc_msgSend(v31, "customGroupWithLayoutSize:itemProvider:", v30, v36);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setContentInsets:", 0.0, 0.0, v17, 0.0);

      goto LABEL_27;
    }
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", 2);
    if ((v12 & 1) != 0)
    {
      v20 = objc_msgSend(v8, "collectionView:layout:hasHeaderForSectionAtIndex:", v7, self, a3);
      if ((v13 & 1) == 0)
        goto LABEL_12;
    }
    else
    {
      v20 = 0;
      if ((v13 & 1) == 0)
      {
LABEL_12:
        v21 = 0;
        if (!v20)
        {
LABEL_21:
          if (v21)
          {
            objc_msgSend(v19, "setFooterMode:", 1);
            if ((v15 & 1) == 0)
            {
LABEL_26:
              v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39B8]), "initWithListAppearance:", 2);
              objc_msgSend(v29, "setTopSeparatorInsets:", 0.0, 14.0, 0.0, 0.0);
              objc_msgSend(v29, "setBottomSeparatorInsets:", 0.0, 14.0, 0.0, 0.0);
              objc_msgSend(v19, "setSeparatorConfiguration:", v29);
              objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v19, v6);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setContentInsets:", 0.0, self->_horizontalInset, v17, self->_horizontalInset);
LABEL_27:

              goto LABEL_28;
            }
          }
          else if ((v15 & 1) == 0)
          {
            goto LABEL_26;
          }
          objc_initWeak(location, self);
          v38[0] = MEMORY[0x1E0C809B0];
          v38[1] = 3221225472;
          v38[2] = __74__PKHeaderVerticalScrollingLayout_layoutSectionAtIndex_layoutEnvironment___block_invoke;
          v38[3] = &unk_1E3E64EA8;
          objc_copyWeak(&v39, location);
          objc_msgSend(v19, "setTrailingSwipeActionsConfigurationProvider:", v38);
          objc_destroyWeak(&v39);
          objc_destroyWeak(location);
          goto LABEL_26;
        }
LABEL_20:
        objc_msgSend(v19, "setHeaderMode:", 1);
        goto LABEL_21;
      }
    }
    v21 = objc_msgSend(v8, "collectionView:layout:hasFooterForSectionAtIndex:", v7, self, a3);
    if (!v20)
      goto LABEL_21;
    goto LABEL_20;
  }
  v34 = 0;
LABEL_28:

  return v34;
}

id __74__PKHeaderVerticalScrollingLayout_layoutSectionAtIndex_layoutEnvironment___block_invoke(uint64_t a1, void *a2)
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

id __74__PKHeaderVerticalScrollingLayout_layoutSectionAtIndex_layoutEnvironment___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double y;
  void *v5;
  void *v6;
  double v7;
  BOOL v8;

  y = a3.origin.y;
  -[PKHeaderVerticalScrollingLayout collectionView](self, "collectionView", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_useStickyHeader)
  {
    objc_msgSend(v5, "adjustedContentInset");
    v8 = y < -v7;
  }
  else
  {
    v8 = 0;
  }
  self->_needsCustomLocation = v8;

  return v8;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)PKHeaderVerticalScrollingLayout;
  -[PKHeaderVerticalScrollingLayout invalidationContextForBoundsChange:](&v7, sel_invalidationContextForBoundsChange_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_needsCustomLocation)
  {
    v8[0] = self->_headerIndexPath;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidateItemsAtIndexPaths:", v5);

  }
  return v4;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _BOOL4 needsCustomLocation;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKHeaderVerticalScrollingLayout;
  -[PKHeaderVerticalScrollingLayout layoutAttributesForItemAtIndexPath:](&v10, sel_layoutAttributesForItemAtIndexPath_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKHeaderVerticalScrollingLayout _indexPathIsHeaderIndexPath:](self, "_indexPathIsHeaderIndexPath:", v5)
    && !objc_msgSend(v4, "representedElementCategory"))
  {
    needsCustomLocation = self->_needsCustomLocation;

    if (needsCustomLocation)
    {
      -[PKHeaderVerticalScrollingLayout _customAttributesForStickyHeader:](self, "_customAttributesForStickyHeader:", v4);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
  }
  else
  {

  }
  v6 = v4;
LABEL_5:
  v7 = v6;

  return v7;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  _BOOL4 needsCustomLocation;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)PKHeaderVerticalScrollingLayout;
  -[PKHeaderVerticalScrollingLayout layoutAttributesForElementsInRect:](&v20, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "indexPath", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[PKHeaderVerticalScrollingLayout _indexPathIsHeaderIndexPath:](self, "_indexPathIsHeaderIndexPath:", v12)
          && !objc_msgSend(v11, "representedElementCategory"))
        {
          needsCustomLocation = self->_needsCustomLocation;

          if (!needsCustomLocation)
            continue;
          v14 = objc_msgSend(v5, "indexOfObject:", v11);
          -[PKHeaderVerticalScrollingLayout _customAttributesForStickyHeader:](self, "_customAttributesForStickyHeader:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "replaceObjectAtIndex:withObject:", v14, v12);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)setUseStickyHeader:(BOOL)a3
{
  if (((!self->_useStickyHeader ^ a3) & 1) == 0)
  {
    self->_useStickyHeader = a3;
    -[PKHeaderVerticalScrollingLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (id)_customAttributesForStickyHeader:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[PKHeaderVerticalScrollingLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentOffset");
  v7 = v6;

  objc_msgSend(v4, "frame");
  objc_msgSend(v4, "setFrame:", 0.0, v7);
  return v4;
}

- (BOOL)_indexPathIsHeaderIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  if (v5 == -[NSIndexPath section](self->_headerIndexPath, "section"))
  {
    v6 = objc_msgSend(v4, "item");
    v7 = v6 == -[NSIndexPath item](self->_headerIndexPath, "item");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)useStickyHeader
{
  return self->_useStickyHeader;
}

- (unint64_t)titleInset
{
  return self->_titleInset;
}

- (void)setTitleInset:(unint64_t)a3
{
  self->_titleInset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerIndexPath, 0);
}

@end
