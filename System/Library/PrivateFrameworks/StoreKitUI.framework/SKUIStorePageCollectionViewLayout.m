@implementation SKUIStorePageCollectionViewLayout

- (SKUIStorePageCollectionViewLayout)init
{
  SKUIStorePageCollectionViewLayout *v3;
  SKUIStorePageCollectionViewLayout *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIStorePageCollectionViewLayout init].cold.1();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUIStorePageCollectionViewLayout;
  v3 = -[UICollectionViewFlowLayout init](&v8, sel_init);
  v4 = v3;
  if (v3)
  {
    v3->_allowsPinningTransitions = 1;
    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v3, "setMinimumInteritemSpacing:", 0.0);
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](v4, "setMinimumLineSpacing:", 0.0);
    v5 = *MEMORY[0x1E0DC4A20];
    v9[0] = *MEMORY[0x1E0DC4A18];
    v9[1] = v5;
    v10[0] = &unk_1E749B4F8;
    v10[1] = &unk_1E749B4F8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewFlowLayout _setRowAlignmentsOptions:](v4, "_setRowAlignmentsOptions:", v6);

    -[SKUIStorePageCollectionViewLayout registerClass:forDecorationViewOfKind:](v4, "registerClass:forDecorationViewOfKind:", objc_opt_class(), 0x1E73B7DF0);
    -[SKUIStorePageCollectionViewLayout registerClass:forDecorationViewOfKind:](v4, "registerClass:forDecorationViewOfKind:", objc_opt_class(), 0x1E73B27D0);
  }
  return v4;
}

- (void)setExpandChildPageSectionsIndexSet:(id)a3
{
  NSIndexSet *v4;
  NSIndexSet *expandChildPageSectionsIndexSet;
  NSArray *updateItems;

  v4 = (NSIndexSet *)objc_msgSend(a3, "copy");
  expandChildPageSectionsIndexSet = self->_expandChildPageSectionsIndexSet;
  self->_expandChildPageSectionsIndexSet = v4;

  if (!self->_expandChildPageSectionsIndexSet)
  {
    updateItems = self->_updateItems;
    self->_updateItems = 0;

  }
}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (CGSize)collectionViewContentSize
{
  double overrideContentWidth;
  double v4;
  objc_super v5;
  CGSize result;

  v5.receiver = self;
  v5.super_class = (Class)SKUIStorePageCollectionViewLayout;
  -[UICollectionViewFlowLayout collectionViewContentSize](&v5, sel_collectionViewContentSize);
  if (self->_overrideContentWidth > 0.00000011920929)
    overrideContentWidth = self->_overrideContentWidth;
  result.height = v4;
  result.width = overrideContentWidth;
  return result;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  NSIndexSet *expandChildPageSectionsIndexSet;
  void *v7;
  uint64_t v8;
  void *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SKUIStorePageCollectionViewLayout;
  -[SKUIStorePageCollectionViewLayout initialLayoutAttributesForAppearingItemAtIndexPath:](&v29, sel_initialLayoutAttributesForAppearingItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  expandChildPageSectionsIndexSet = self->_expandChildPageSectionsIndexSet;
  if (expandChildPageSectionsIndexSet
    && -[NSIndexSet containsIndex:](expandChildPageSectionsIndexSet, "containsIndex:", objc_msgSend(v4, "section"))
    && self->_updateItems)
  {
    -[SKUIStorePageCollectionViewLayout _getCollectionViewUpdateItemForItemFromIndex:initalLayout:](self, "_getCollectionViewUpdateItemForItemFromIndex:initalLayout:", objc_msgSend(v4, "section"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "updateAction");
    if (!v7 || v8)
      goto LABEL_13;
    -[SKUIStorePageCollectionViewLayout collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NSIndexSet firstIndex](self->_expandChildPageSectionsIndexSet, "firstIndex");
    v11 = objc_msgSend(v9, "numberOfSections");
    v12 = v11 - -[NSIndexSet count](self->_expandChildPageSectionsIndexSet, "count");
    if (v10 >= v12)
    {
      v16 = objc_msgSend(v9, "numberOfItemsInSection:", v12 - 1);
      v17 = 5.0;
      v15 = v12 - 1;
      if (v12 < 1)
        goto LABEL_12;
      v13 = v16 - 1;
      if (v16 < 1)
        goto LABEL_12;
      v14 = (void *)MEMORY[0x1E0CB36B0];
    }
    else
    {
      v13 = objc_msgSend(v9, "numberOfItemsInSection:", v10 - 1) - 1;
      v14 = (void *)MEMORY[0x1E0CB36B0];
      v15 = v10 - 1;
    }
    objc_msgSend(v14, "indexPathForItem:inSection:", v13, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellForItemAtIndexPath:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "frame");
    v21 = v20;
    objc_msgSend(v19, "frame");
    v23 = v21 + v22;

    v17 = v23 + 5.0;
LABEL_12:
    objc_msgSend(v5, "frame", v13, v15);
    v25 = v24;
    objc_msgSend(v5, "frame");
    v27 = v26;
    objc_msgSend(v5, "frame");
    objc_msgSend(v5, "setFrame:", v25, v17, v27);

LABEL_13:
  }

  return v5;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  NSIndexSet *expandChildPageSectionsIndexSet;
  void *v7;
  uint64_t v8;
  void *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SKUIStorePageCollectionViewLayout;
  -[SKUIStorePageCollectionViewLayout finalLayoutAttributesForDisappearingItemAtIndexPath:](&v28, sel_finalLayoutAttributesForDisappearingItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  expandChildPageSectionsIndexSet = self->_expandChildPageSectionsIndexSet;
  if (expandChildPageSectionsIndexSet
    && -[NSIndexSet containsIndex:](expandChildPageSectionsIndexSet, "containsIndex:", objc_msgSend(v4, "section"))
    && self->_updateItems)
  {
    -[SKUIStorePageCollectionViewLayout _getCollectionViewUpdateItemForItemFromIndex:initalLayout:](self, "_getCollectionViewUpdateItemForItemFromIndex:initalLayout:", objc_msgSend(v4, "section"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "updateAction");
    if (!v7 || v8 != 1)
      goto LABEL_13;
    -[SKUIStorePageCollectionViewLayout collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NSIndexSet firstIndex](self->_expandChildPageSectionsIndexSet, "firstIndex");
    v11 = objc_msgSend(v9, "numberOfSections");
    if (v10 >= v11)
    {
      v15 = v11;
      v16 = objc_msgSend(v9, "numberOfItemsInSection:", v11 - 1);
      v17 = 0.0;
      v14 = v15 - 1;
      if (v15 < 1)
        goto LABEL_12;
      v12 = v16 - 1;
      if (v16 < 1)
        goto LABEL_12;
      v13 = (void *)MEMORY[0x1E0CB36B0];
    }
    else
    {
      v12 = objc_msgSend(v9, "numberOfItemsInSection:", v10 - 1) - 1;
      v13 = (void *)MEMORY[0x1E0CB36B0];
      v14 = v10 - 1;
    }
    objc_msgSend(v13, "indexPathForItem:inSection:", v12, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellForItemAtIndexPath:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "frame");
    v21 = v20;
    objc_msgSend(v19, "frame");
    v17 = v21 + v22;

LABEL_12:
    objc_msgSend(v5, "frame", v12, v14);
    v24 = v23;
    objc_msgSend(v5, "frame");
    v26 = v25;
    objc_msgSend(v5, "frame");
    objc_msgSend(v5, "setFrame:", v24, v17, v26);

LABEL_13:
  }

  return v5;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
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
  int64_t v18;
  _BOOL4 v19;
  unsigned int v20;
  _BOOL4 v21;
  unsigned int v22;
  _BOOL8 v23;
  uint64_t v24;
  void *v25;
  objc_super v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v27.receiver = self;
  v27.super_class = (Class)SKUIStorePageCollectionViewLayout;
  -[UICollectionViewFlowLayout invalidationContextForBoundsChange:](&v27, sel_invalidationContextForBoundsChange_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStorePageCollectionViewLayout collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = -[UICollectionViewFlowLayout scrollDirection](self, "scrollDirection");
  v19 = y != v13;
  if (height == v17)
  {
    v20 = 0;
  }
  else
  {
    v19 = 1;
    v20 = 1;
  }
  v21 = x != v11;
  if (width == v15)
  {
    v22 = 0;
  }
  else
  {
    v21 = 1;
    v22 = 1;
  }
  if (v18)
  {
    v21 = 0;
    v22 = 0;
  }
  if (v18 == 1)
    v23 = v19;
  else
    v23 = v21;
  if (v18 == 1)
    v24 = v20;
  else
    v24 = v22;
  objc_msgSend(v8, "setInvalidateFlowLayoutAttributes:", v23);
  objc_msgSend(v8, "setInvalidateFlowLayoutDelegateMetrics:", v24);
  if ((objc_msgSend(v8, "invalidateEverything") & 1) == 0 && (objc_msgSend(v8, "invalidateDataSourceCounts") & 1) == 0)
  {
    -[SKUIStorePageCollectionViewLayout _indexPathsForPinningItems](self, "_indexPathsForPinningItems");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "count"))
    {
      objc_msgSend(v8, "invalidateItemsAtIndexPaths:", v25);
      objc_msgSend(v8, "invalidateDecorationElementsOfKind:atIndexPaths:", 0x1E73B7DF0, v25);
    }

  }
  return v8;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  NSMapTable *indexPathToItemPinningConfiguration;
  NSArray *indexPathsForPinningItems;
  NSArray *indexPathsForGradientItems;
  objc_super v8;

  v4 = a3;
  if ((objc_msgSend(v4, "invalidateDataSourceCounts") & 1) != 0
    || objc_msgSend(v4, "invalidateEverything"))
  {
    self->_hasValidPinnedBackdropViewStyle = 0;
    indexPathToItemPinningConfiguration = self->_indexPathToItemPinningConfiguration;
    self->_indexPathToItemPinningConfiguration = 0;

    indexPathsForPinningItems = self->_indexPathsForPinningItems;
    self->_indexPathsForPinningItems = 0;

    indexPathsForGradientItems = self->_indexPathsForGradientItems;
    self->_indexPathsForGradientItems = 0;

    self->_hasValidIndexPathsForPinningItems = 0;
    self->_hasValidGradientIndexPaths = 0;
    -[SKUIStorePageCollectionViewLayout _invalidatePinningLayoutInformation](self, "_invalidatePinningLayoutInformation");
  }
  if ((objc_msgSend(v4, "invalidateFlowLayoutAttributes") & 1) != 0
    || (objc_msgSend(v4, "invalidateFlowLayoutDelegateMetrics") & 1) != 0
    || objc_msgSend(v4, "invalidateItemPinningLayoutInformation"))
  {
    -[SKUIStorePageCollectionViewLayout _invalidatePinningLayoutInformation](self, "_invalidatePinningLayoutInformation");
  }
  if (objc_msgSend(v4, "invalidatePinnedBackdropViewStyle"))
    self->_hasValidPinnedBackdropViewStyle = 0;
  v8.receiver = self;
  v8.super_class = (Class)SKUIStorePageCollectionViewLayout;
  -[UICollectionViewFlowLayout invalidateLayoutWithContext:](&v8, sel_invalidateLayoutWithContext_, v4);

}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", 0x1E73B7DF0))
  {
    -[SKUIStorePageCollectionViewLayout _itemPinningConfigurationForItemAtIndexPath:](self, "_itemPinningConfigurationForItemAtIndexPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStorePageCollectionViewLayout _itemPinningLayoutInformationForItemAtIndexPath:](self, "_itemPinningLayoutInformationForItemAtIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStorePageCollectionViewLayout _layoutAttributesForPinnedBackdropDecorationViewAtIndexPath:pinningConfiguration:layoutInformation:](self, "_layoutAttributesForPinnedBackdropDecorationViewAtIndexPath:pinningConfiguration:layoutInformation:", v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
LABEL_6:
      v12.receiver = self;
      v12.super_class = (Class)SKUIStorePageCollectionViewLayout;
      -[SKUIStorePageCollectionViewLayout layoutAttributesForDecorationViewOfKind:atIndexPath:](&v12, sel_layoutAttributesForDecorationViewOfKind_atIndexPath_, v6, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", 0x1E73B27D0))
      goto LABEL_6;
    +[UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:withIndexPath:](SKUIGridViewGradientLayoutAttributes, "layoutAttributesForDecorationViewOfKind:withIndexPath:", 0x1E73B27D0, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_6;
  }

  return v10;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  char v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v37 = *MEMORY[0x1E0C80C00];
  ++self->_inLayoutAttributesForElementsCount;
  v35.receiver = self;
  v35.super_class = (Class)SKUIStorePageCollectionViewLayout;
  -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v35, sel_layoutAttributesForElementsInRect_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  -[SKUIStorePageCollectionViewLayout _appendAdditionalLayoutAttributesForPinningItemsInRect:toArray:](self, "_appendAdditionalLayoutAttributesForPinningItemsInRect:toArray:", v9, x, y, width, height);
  --self->_inLayoutAttributesForElementsCount;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v11)
  {
    v12 = v11;
    v29 = 0;
    v13 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v15, "indexPath", v29);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v15, "representedElementCategory"))
        {
          -[SKUIStorePageCollectionViewLayout _indexPathsForPinningItems](self, "_indexPathsForPinningItems");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "containsObject:", v16);

          if ((_DWORD)v18)
          {
            -[SKUIStorePageCollectionViewLayout _itemPinningLayoutInformationForItemAtIndexPath:](self, "_itemPinningLayoutInformationForItemAtIndexPath:", v16);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[SKUIStorePageCollectionViewLayout _itemPinningConfigurationForItemAtIndexPath:](self, "_itemPinningConfigurationForItemAtIndexPath:", v16);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v20 = 0;
            v19 = 0;
          }
          v30 = 0;
          -[SKUIStorePageCollectionViewLayout _configureCellLayoutAttributes:forItemWithPinningConfiguration:layoutInformation:atIndexPath:allowPinning:returningIsPinning:](self, "_configureCellLayoutAttributes:forItemWithPinningConfiguration:layoutInformation:atIndexPath:allowPinning:returningIsPinning:", v15, v20, v19, v16, v18, &v30);
          if (v30
            && -[SKUIStorePageCollectionViewLayout _allowsBackdropDecorationForItemPinningConfiguration:atIndexPath:](self, "_allowsBackdropDecorationForItemPinningConfiguration:atIndexPath:", v20, v16))
          {
            -[SKUIStorePageCollectionViewLayout _layoutAttributesForPinnedBackdropDecorationViewAtIndexPath:pinningConfiguration:layoutInformation:](self, "_layoutAttributesForPinnedBackdropDecorationViewAtIndexPath:pinningConfiguration:layoutInformation:", v16, v20, v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
            {
              v22 = v29;
              if (!v29)
                v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
              objc_msgSend(v22, "addObject:", v21, v22);
            }

          }
        }
        -[SKUIStorePageCollectionViewLayout _indexPathsForBackgroundGradients](self, "_indexPathsForBackgroundGradients");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "containsObject:", v16);

        if (v24)
        {
          -[SKUIStorePageCollectionViewLayout _layoutAttributesForGradientDecorationViewAtIndexPath:currentAttributes:](self, "_layoutAttributesForGradientDecorationViewAtIndexPath:currentAttributes:", v16, v15);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            v26 = v29;
            if (!v29)
              v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
            objc_msgSend(v26, "addObject:", v25, v26);
          }

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v12);
  }
  else
  {
    v29 = 0;
  }

  v27 = v29;
  if (objc_msgSend(v29, "count"))
    objc_msgSend(v10, "addObjectsFromArray:", v29);
  -[SKUIStorePageCollectionViewLayout _alginCellsToTop:](self, "_alginCellsToTop:", v10, v29);

  return v10;
}

- (void)_alginCellsToTop:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  unint64_t v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double MidY;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  id v47;
  CGFloat rect;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SKUIStorePageCollectionViewLayout _indexPathsForPinningItems](self, "_indexPathsForPinningItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  v47 = v5;
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v54 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v13, "indexPath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v7, "containsObject:", v14);

        if ((v15 & 1) == 0 && !objc_msgSend(v13, "representedElementCategory"))
        {
          objc_msgSend(v13, "frame");
          v17 = v16;
          v19 = v18;
          v21 = v20;
          v23 = v22;
          if (objc_msgSend(v6, "count"))
          {
            v24 = 0;
            rect = v23;
            while (1)
            {
              objc_msgSend(v6, "objectAtIndex:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "CGRectValue");
              v27 = v26;
              v29 = v28;
              v31 = v30;
              v33 = v32;
              v60.origin.x = v17;
              v60.origin.y = v19;
              v60.size.width = v21;
              v60.size.height = v23;
              MidY = CGRectGetMidY(v60);
              v61.origin.x = v27;
              v61.origin.y = v29;
              v61.size.width = v31;
              v61.size.height = v33;
              if (MidY > CGRectGetMinY(v61))
              {
                v62.origin.x = v17;
                v62.origin.y = v19;
                v62.size.width = v21;
                v62.size.height = rect;
                v35 = CGRectGetMidY(v62);
                v63.origin.x = v27;
                v63.origin.y = v29;
                v63.size.width = v31;
                v63.size.height = v33;
                if (v35 < CGRectGetMaxY(v63))
                  break;
              }

              ++v24;
              v23 = rect;
              if (v24 >= objc_msgSend(v6, "count"))
                goto LABEL_13;
            }
            objc_msgSend(v5, "objectAtIndex:", v24);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "addObject:", v13);
            v64.origin.x = v27;
            v64.origin.y = v29;
            v64.size.width = v31;
            v64.size.height = v33;
            v66.origin.x = v17;
            v66.origin.y = v19;
            v66.size.width = v21;
            v66.size.height = rect;
            v65 = CGRectUnion(v64, v66);
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v65.origin.x, v65.origin.y, v65.size.width, v65.size.height);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "replaceObjectAtIndex:withObject:", v24, v38);

            v5 = v47;
          }
          else
          {
LABEL_13:
            v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v13, 0);
            objc_msgSend(v5, "addObject:", v36);

            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v17, v19, v21, v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v25);
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v6, "count"))
  {
    v39 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndex:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "CGRectValue");
      objc_msgSend(v5, "objectAtIndex:", v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v50;
        do
        {
          for (j = 0; j != v43; ++j)
          {
            if (*(_QWORD *)v50 != v44)
              objc_enumerationMutation(v41);
            v46 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
            objc_msgSend(v46, "frame");
            objc_msgSend(v46, "setFrame:");
          }
          v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        }
        while (v43);
      }

      ++v39;
      v5 = v47;
    }
    while (v39 < objc_msgSend(v6, "count"));
  }

}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SKUIStorePageCollectionViewLayout;
  -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](&v12, sel_layoutAttributesForItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!self->_inLayoutAttributesForElementsCount && !objc_msgSend(v5, "representedElementCategory"))
  {
    -[SKUIStorePageCollectionViewLayout _indexPathsForPinningItems](self, "_indexPathsForPinningItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v4);

    if ((_DWORD)v8)
    {
      -[SKUIStorePageCollectionViewLayout _itemPinningLayoutInformationForItemAtIndexPath:](self, "_itemPinningLayoutInformationForItemAtIndexPath:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIStorePageCollectionViewLayout _itemPinningConfigurationForItemAtIndexPath:](self, "_itemPinningConfigurationForItemAtIndexPath:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
      v9 = 0;
    }
    -[SKUIStorePageCollectionViewLayout _configureCellLayoutAttributes:forItemWithPinningConfiguration:layoutInformation:atIndexPath:allowPinning:returningIsPinning:](self, "_configureCellLayoutAttributes:forItemWithPinningConfiguration:layoutInformation:atIndexPath:allowPinning:returningIsPinning:", v6, v10, v9, v4, v8, 0);

  }
  return v6;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *updateItems;
  NSArray *v14;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[SKUIStorePageCollectionViewLayout _invalidatePinningLayoutInformation](self, "_invalidatePinningLayoutInformation");
        objc_msgSend(v9, "indexPathBeforeUpdate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          -[NSMapTable objectForKey:](self->_indexPathToItemPinningConfiguration, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v9, "indexPathAfterUpdate");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMapTable removeObjectForKey:](self->_indexPathToItemPinningConfiguration, "removeObjectForKey:", v10);
            if (v12)
              -[NSMapTable setObject:forKey:](self->_indexPathToItemPinningConfiguration, "setObject:forKey:", v11, v12);

          }
        }

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  updateItems = self->_updateItems;
  self->_updateItems = v4;
  v14 = v4;

  v15.receiver = self;
  v15.super_class = (Class)SKUIStorePageCollectionViewLayout;
  -[SKUIStorePageCollectionViewLayout prepareForCollectionViewUpdates:](&v15, sel_prepareForCollectionViewUpdates_, v14);

}

- (void)prepareLayout
{
  void *v3;
  void *v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  UIColor *v10;
  UIColor *collectionViewBackgroundColor;
  id v12;
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SKUIStorePageCollectionViewLayout;
  -[UICollectionViewFlowLayout prepareLayout](&v14, sel_prepareLayout);
  -[SKUIStorePageCollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)&self->_collectionViewDelegateFlags = *(_BYTE *)&self->_collectionViewDelegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = 2;
  else
    v5 = 0;
  *(_BYTE *)&self->_collectionViewDelegateFlags = *(_BYTE *)&self->_collectionViewDelegateFlags & 0xFD | v5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 4;
  else
    v6 = 0;
  *(_BYTE *)&self->_collectionViewDelegateFlags = *(_BYTE *)&self->_collectionViewDelegateFlags & 0xFB | v6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = 8;
  else
    v7 = 0;
  *(_BYTE *)&self->_collectionViewDelegateFlags = *(_BYTE *)&self->_collectionViewDelegateFlags & 0xF7 | v7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = 16;
  else
    v8 = 0;
  *(_BYTE *)&self->_collectionViewDelegateFlags = *(_BYTE *)&self->_collectionViewDelegateFlags & 0xEF | v8;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = 32;
  else
    v9 = 0;
  *(_BYTE *)&self->_collectionViewDelegateFlags = *(_BYTE *)&self->_collectionViewDelegateFlags & 0xDF | v9;
  objc_msgSend(v3, "backgroundColor");
  v10 = (UIColor *)objc_claimAutoreleasedReturnValue();
  collectionViewBackgroundColor = self->_collectionViewBackgroundColor;
  self->_collectionViewBackgroundColor = v10;

  v12 = -[SKUIStorePageCollectionViewLayout _indexPathsForPinningItems](self, "_indexPathsForPinningItems");
  v13 = -[SKUIStorePageCollectionViewLayout _indexPathsForBackgroundGradients](self, "_indexPathsForBackgroundGradients");

}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double y;
  BOOL v5;
  void *v6;
  void *v7;
  double v8;
  objc_super v10;

  y = a3.origin.y;
  v10.receiver = self;
  v10.super_class = (Class)SKUIStorePageCollectionViewLayout;
  if (-[UICollectionViewFlowLayout shouldInvalidateLayoutForBoundsChange:](&v10, sel_shouldInvalidateLayoutForBoundsChange_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    return 1;
  }
  -[SKUIStorePageCollectionViewLayout _indexPathsForPinningItems](self, "_indexPathsForPinningItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    -[SKUIStorePageCollectionViewLayout collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v5 = y != v8;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateItemsLayoutForRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  objc_super v9;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self->_overrideContentWidth >= 0.00000011920929)
  {
    -[SKUIStorePageCollectionViewLayout collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOverrideBoundsWidth:", self->_overrideContentWidth);
    v9.receiver = self;
    v9.super_class = (Class)SKUIStorePageCollectionViewLayout;
    -[SKUIStorePageCollectionViewLayout _updateItemsLayoutForRect:](&v9, sel__updateItemsLayoutForRect_, x, y, width, height);
    objc_msgSend(v8, "setOverrideBoundsWidth:", 0.0);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SKUIStorePageCollectionViewLayout;
    -[SKUIStorePageCollectionViewLayout _updateItemsLayoutForRect:](&v10, sel__updateItemsLayoutForRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
}

- (id)layoutAttributesForUnpinnedItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SKUIStorePageCollectionViewLayout;
  -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](&v12, sel_layoutAttributesForItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!self->_inLayoutAttributesForElementsCount && !objc_msgSend(v5, "representedElementCategory"))
  {
    -[SKUIStorePageCollectionViewLayout _indexPathsForPinningItems](self, "_indexPathsForPinningItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v4);

    if (v8)
    {
      -[SKUIStorePageCollectionViewLayout _itemPinningLayoutInformationForItemAtIndexPath:](self, "_itemPinningLayoutInformationForItemAtIndexPath:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIStorePageCollectionViewLayout _itemPinningConfigurationForItemAtIndexPath:](self, "_itemPinningConfigurationForItemAtIndexPath:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
      v9 = 0;
    }
    -[SKUIStorePageCollectionViewLayout _configureCellLayoutAttributes:forItemWithPinningConfiguration:layoutInformation:atIndexPath:allowPinning:returningIsPinning:](self, "_configureCellLayoutAttributes:forItemWithPinningConfiguration:layoutInformation:atIndexPath:allowPinning:returningIsPinning:", v6, v10, v9, v4, 0, 0);

  }
  return v6;
}

- (id)pinnedLayoutAttributesForItemsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id obj;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v30 = *MEMORY[0x1E0C80C00];
  ++self->_inLayoutAttributesForElementsCount;
  v28.receiver = self;
  v28.super_class = (Class)SKUIStorePageCollectionViewLayout;
  -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v28, sel_layoutAttributesForElementsInRect_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  -[SKUIStorePageCollectionViewLayout _appendAdditionalLayoutAttributesForPinningItemsInRect:toArray:](self, "_appendAdditionalLayoutAttributesForPinningItemsInRect:toArray:", v9, x, y, width, height);
  --self->_inLayoutAttributesForElementsCount;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (!objc_msgSend(v15, "representedElementCategory"))
        {
          objc_msgSend(v15, "indexPath");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKUIStorePageCollectionViewLayout _indexPathsForPinningItems](self, "_indexPathsForPinningItems");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "containsObject:", v16);

          if ((_DWORD)v18)
          {
            -[SKUIStorePageCollectionViewLayout _itemPinningLayoutInformationForItemAtIndexPath:](self, "_itemPinningLayoutInformationForItemAtIndexPath:", v16);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[SKUIStorePageCollectionViewLayout _itemPinningConfigurationForItemAtIndexPath:](self, "_itemPinningConfigurationForItemAtIndexPath:", v16);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v20 = 0;
            v19 = 0;
          }
          v23 = 0;
          -[SKUIStorePageCollectionViewLayout _configureCellLayoutAttributes:forItemWithPinningConfiguration:layoutInformation:atIndexPath:allowPinning:returningIsPinning:](self, "_configureCellLayoutAttributes:forItemWithPinningConfiguration:layoutInformation:atIndexPath:allowPinning:returningIsPinning:", v15, v20, v19, v16, v18, &v23);
          if (v23)
          {
            objc_msgSend(v15, "frame");
            -[SKUIStorePageCollectionViewLayout _pinningFrameForStartingFrame:itemPinningConfiguration:atIndexPath:](self, "_pinningFrameForStartingFrame:itemPinningConfiguration:atIndexPath:", v20, v16);
            objc_msgSend(v15, "setFrame:");
            if (!v12)
              v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
            objc_msgSend(v12, "addObject:", v15);
          }

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)setAllowsPinningTransitions:(BOOL)a3
{
  id v4;

  if (self->_allowsPinningTransitions != a3)
  {
    self->_allowsPinningTransitions = a3;
    -[SKUIStorePageCollectionViewLayout _invalidatePinningLayoutInformation](self, "_invalidatePinningLayoutInformation");
    v4 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));
    objc_msgSend(v4, "setInvalidateItemPinningLayoutInformation:", 1);
    -[SKUIStorePageCollectionViewLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v4);

  }
}

- (void)setBackdropGroupName:(id)a3
{
  NSString *v4;
  NSString *backdropGroupName;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  id v10;
  NSString *v11;

  v4 = (NSString *)a3;
  backdropGroupName = self->_backdropGroupName;
  if (backdropGroupName != v4)
  {
    v11 = v4;
    v6 = -[NSString isEqualToString:](backdropGroupName, "isEqualToString:", v4);
    v4 = v11;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v11, "copy");
      v8 = self->_backdropGroupName;
      self->_backdropGroupName = v7;

      -[SKUIStorePageCollectionViewLayout _indexPathsForPinningItems](self, "_indexPathsForPinningItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count"))
      {
        v10 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));
        objc_msgSend(v10, "setInvalidateItemPinningLayoutInformation:", 0);
        objc_msgSend(v10, "setInvalidateFlowLayoutDelegateMetrics:", 0);
        objc_msgSend(v10, "setInvalidateFlowLayoutAttributes:", 0);
        objc_msgSend(v10, "invalidateDecorationElementsOfKind:atIndexPaths:", 0x1E73B7DF0, v9);
        -[SKUIStorePageCollectionViewLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v10);

      }
      v4 = v11;
    }
  }

}

- (BOOL)_allowsBackdropDecorationForItemPinningConfiguration:(id)a3 atIndexPath:(id)a4
{
  int64_t v4;
  BOOL v5;

  v4 = -[SKUIStorePageCollectionViewLayout _pinningStyleForItemPinningConfiguration:atIndexPath:](self, "_pinningStyleForItemPinningConfiguration:atIndexPath:", a3, a4);
  if (v4)
    v5 = v4 == 3;
  else
    v5 = 1;
  return !v5;
}

- (void)_appendAdditionalLayoutAttributesForPinningItemsInRect:(CGRect)a3 toArray:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  SKUIStorePageCollectionViewLayout *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  char v30;
  uint64_t v31;
  const char *v32;
  id v33;
  uint64_t v34;
  id obj;
  objc_super v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;
  CGRect v48;
  CGRect v49;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v47 = *MEMORY[0x1E0C80C00];
  v33 = a4;
  -[SKUIStorePageCollectionViewLayout _indexPathsForPinningItems](self, "_indexPathsForPinningItems");
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v42;
    do
    {
      v12 = 0;
      v32 = sel_layoutAttributesForItemAtIndexPath_;
      v34 = v10;
      do
      {
        if (*(_QWORD *)v42 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v12);
        -[SKUIStorePageCollectionViewLayout _itemPinningLayoutInformationForItemAtIndexPath:](self, "_itemPinningLayoutInformationForItemAtIndexPath:", v13, v32);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "availablePinningFrame");
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v22 = v21;

        v48.origin.x = v16;
        v48.origin.y = v18;
        v48.size.width = v20;
        v48.size.height = v22;
        v49.origin.x = x;
        v49.origin.y = y;
        v49.size.width = width;
        v49.size.height = height;
        if (CGRectIntersectsRect(v48, v49))
        {
          v23 = self;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v24 = v33;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v38;
            while (2)
            {
              for (i = 0; i != v26; ++i)
              {
                if (*(_QWORD *)v38 != v27)
                  objc_enumerationMutation(v24);
                objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "indexPath");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v29, "isEqual:", v13);

                if ((v30 & 1) != 0)
                {
                  self = v23;
                  goto LABEL_17;
                }
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
              if (v26)
                continue;
              break;
            }
          }

          self = v23;
          v36.receiver = v23;
          v36.super_class = (Class)SKUIStorePageCollectionViewLayout;
          objc_msgSendSuper2(&v36, v32, v13);
          v31 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v31);
          v24 = (id)v31;
LABEL_17:

          v10 = v34;
        }
        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v10);
  }

}

- (void)_calculatePinningLayoutInformation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[4];
  _QWORD v30[4];
  _QWORD v31[4];
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  __int128 v35;
  __int128 v36;

  -[NSMapTable removeAllObjects](self->_indexPathToPinningLayoutInformation, "removeAllObjects");
  -[SKUIStorePageCollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SKUIStorePageCollectionViewLayout _indexPathsForPinningItems](self, "_indexPathsForPinningItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x4010000000;
  v34[3] = &unk_1BBF15257;
  v13 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  v35 = *MEMORY[0x1E0DC49E8];
  v36 = v13;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x4010000000;
  v31[3] = &unk_1BBF15257;
  v32 = v35;
  v33 = v13;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__SKUIStorePageCollectionViewLayout__calculatePinningLayoutInformation__block_invoke;
  v15[3] = &unk_1E73A3578;
  v15[4] = self;
  v17 = v34;
  v18 = v30;
  v19 = v28;
  v20 = v31;
  v21 = v29;
  v22 = v27;
  v14 = v12;
  v16 = v14;
  v23 = v5;
  v24 = v7;
  v25 = v9;
  v26 = v11;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v15);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v34, 8);

}

void __71__SKUIStorePageCollectionViewLayout__calculatePinningLayoutInformation__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
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
  double v20;
  double v21;
  double *v22;
  unint64_t v23;
  double *v24;
  double v25;
  BOOL v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double MinY;
  double v37;
  double MaxY;
  double MinX;
  double Width;
  double v41;
  double v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  SKUIStorePageItemPinningLayoutInformation *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  CGFloat v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  double v74;
  double v75;
  double rect;
  objc_super v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_itemPinningConfigurationForItemAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 32), "_pinningStyleForItemPinningConfiguration:atIndexPath:", v6, v5);
  if (!v7)
    goto LABEL_60;
  v8 = v7;
  v77.receiver = *(id *)(a1 + 32);
  v77.super_class = (Class)SKUIStorePageCollectionViewLayout;
  objc_msgSendSuper2(&v77, sel_layoutAttributesForItemAtIndexPath_, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(*(id *)(a1 + 32), "_pinningContentInsetForItemPinningConfiguration:atIndexPath:", v6, v5);
  if (!a3)
  {
    v22 = *(double **)(*(_QWORD *)(a1 + 48) + 8);
    v22[4] = v18;
    v22[5] = v19;
    v22[6] = v20;
    v22[7] = v21;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 32)
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 24);
  }
  v23 = v8;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) != v8)
  {
    v24 = *(double **)(*(_QWORD *)(a1 + 72) + 8);
    v24[4] = v18;
    v24[5] = v19;
    v24[6] = v20;
    v24[7] = v21;
    v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  }
  v25 = -v21 - v19;
  v27 = v8 != 1 && v23 != 1;
  if (v23 != 5 && !v27)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
  v28 = v11 - v19;
  v29 = v13 - v18;
  v30 = v15 - v25;
  v31 = v17 - (-v20 - v18);
  v74 = v20;
  v71 = v13 - v18;
  v72 = v28;
  v69 = v31;
  v70 = v30;
  if (v8 == 3)
  {
    if (a3)
    {
      v32 = v28;
      v33 = v30;
      rect = CGRectGetMinY(*(CGRect *)(&v29 - 1));
    }
    else
    {
      rect = 2.22507386e-308;
    }
LABEL_21:
    v78.origin.x = v11;
    v78.origin.y = v13;
    v78.size.width = v15;
    v78.size.height = v17;
    MinY = CGRectGetMinY(v78);
    v37 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    if (v37 > 0.0)
      MinY = MinY - (v37 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32));
    goto LABEL_23;
  }
  v34 = v28;
  v35 = v30;
  rect = CGRectGetMinY(*(CGRect *)(&v29 - 1));
  if (v8 != 1)
    goto LABEL_21;
  MinY = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
LABEL_23:
  v73 = MinY;
  v75 = v17;
  objc_msgSend(v9, "frame");
  MaxY = CGRectGetMaxY(v79);
  if (v8 != 3 && objc_msgSend(*(id *)(a1 + 40), "count") - 1 == a3)
    MaxY = 1.79769313e308;
  MinX = CGRectGetMinX(*(CGRect *)(a1 + 96));
  Width = CGRectGetWidth(*(CGRect *)(a1 + 96));
  if (v8 == 5)
  {
    MinX = CGRectGetMinX(*(CGRect *)(a1 + 96));
    v41 = CGRectGetWidth(*(CGRect *)(a1 + 96));
    rect = 2.22507386e-308;
    v42 = 1.79769313e308;
  }
  else
  {
    v41 = Width;
    v42 = MaxY - rect;
    if (v8 == 3)
      goto LABEL_47;
  }
  if (a3 >= 1)
  {
    v64 = v15;
    v65 = v13;
    v66 = v11;
    v67 = v9;
    v68 = v6;
    while (1)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3 - 1, *(_QWORD *)&v64, *(_QWORD *)&v65, *(_QWORD *)&v66, v67, v68);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_itemPinningConfigurationForItemAtIndexPath:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(*(id *)(a1 + 32), "_pinningStyleForItemPinningConfiguration:atIndexPath:", v44, v43);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "objectForKey:", v43);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "availablePinningFrame");
      v48 = v47;
      v50 = v49;
      v52 = v51;
      v54 = v53;
      if (v8 == 1)
      {
        if (v45 == 3)
        {
LABEL_39:
          LODWORD(v45) = 0;
          goto LABEL_44;
        }
        v81.origin.x = MinX;
        v81.origin.y = rect;
        v81.size.width = v41;
        v81.size.height = v42;
        v55 = CGRectGetMinY(v81);
        LODWORD(v45) = 1;
      }
      else
      {
        if (v8 != 4 && v8 != 2)
        {
          LODWORD(v45) = 1;
          goto LABEL_44;
        }
        if (v8 == 4 || v45 == 2)
        {
          v82.origin.x = MinX;
          v82.origin.y = rect;
          v82.size.width = v41;
          v82.size.height = v42;
          v55 = CGRectGetMaxY(v82);
          LODWORD(v45) = 0;
        }
        else
        {
          if (v45 != 1)
            goto LABEL_39;
          v80.origin.x = MinX;
          v80.origin.y = rect;
          v80.size.width = v41;
          v80.size.height = v42;
          v55 = CGRectGetMinY(v80);
        }
      }
      v83.origin.x = v48;
      v83.origin.y = v50;
      v83.size.width = v52;
      v83.size.height = v54;
      v54 = v55 - CGRectGetMinY(v83);
LABEL_44:
      objc_msgSend(v46, "setAvailablePinningFrame:", v48, v50, v52, v54);

      if ((unint64_t)a3 >= 2)
      {
        --a3;
        if (!(_DWORD)v45)
          continue;
      }
      v9 = v67;
      v6 = v68;
      v13 = v65;
      v11 = v66;
      v15 = v64;
      break;
    }
  }
LABEL_47:
  v56 = objc_alloc_init(SKUIStorePageItemPinningLayoutInformation);
  -[SKUIStorePageItemPinningLayoutInformation setAvailablePinningFrame:](v56, "setAvailablePinningFrame:", MinX, rect, v41, v42);
  -[SKUIStorePageItemPinningLayoutInformation setLayoutAttributesFrame:](v56, "setLayoutAttributesFrame:", v11, v13, v15, v75);
  -[SKUIStorePageItemPinningLayoutInformation setAfterPinningLocationYAdditions:](v56, "setAfterPinningLocationYAdditions:", v73);
  -[SKUIStorePageItemPinningLayoutInformation setBeforePinningLocationYAdditions:](v56, "setBeforePinningLocationYAdditions:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v57 = *(void **)(*(_QWORD *)(a1 + 32) + 592);
  if (!v57)
  {
    v58 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, objc_msgSend(*(id *)(a1 + 40), "count"));
    v59 = *(_QWORD *)(a1 + 32);
    v60 = *(void **)(v59 + 592);
    *(_QWORD *)(v59 + 592) = v58;

    v57 = *(void **)(*(_QWORD *)(a1 + 32) + 592);
  }
  objc_msgSend(v57, "setObject:forKey:", v56, v5);
  if (v8 <= 5 && ((1 << v8) & 0x34) != 0)
  {
    v84.origin.y = v71;
    v84.origin.x = v72;
    v84.size.height = v69;
    v84.size.width = v70;
    *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = CGRectGetHeight(v84)
                                                                 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                             + 24);
  }
  objc_msgSend(*(id *)(a1 + 32), "_itemPinningConfigurationForItemAtIndexPath:", v5);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(*(id *)(a1 + 32), "_pinningGroupForItemPinningConfiguration:atIndexPath:", v61, v5);
  if (v8 == 3 && (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) == 0.0 || v62 == 1))
  {
    v85.origin.x = v11;
    v85.origin.y = v13;
    v85.size.width = v15;
    v85.size.height = v75;
    *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = CGRectGetHeight(v85)
                                                                 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                             + 24);
  }
  v86.origin.x = v11;
  v86.origin.y = v13;
  v86.size.width = v15;
  v86.size.height = v75;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v74
                                                              + CGRectGetHeight(v86)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 24);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v8;

LABEL_60:
}

- (void)_configureCellLayoutAttributes:(id)a3 forItemWithPinningConfiguration:(id)a4 layoutInformation:(id)a5 atIndexPath:(id)a6 allowPinning:(BOOL)a7 returningIsPinning:(BOOL *)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v24;
  void *v25;
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
  double v37;
  void *v38;
  BOOL v39;
  CGRect v40;
  CGRect v41;

  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  -[SKUIStorePageCollectionViewLayout collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (self->_rendersWithPerspective)
  {
    objc_msgSend(v18, "bounds");
    x = v40.origin.x;
    y = v40.origin.y;
    width = v40.size.width;
    height = v40.size.height;
    CGRectGetMidX(v40);
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    CGRectGetMidY(v41);
    objc_msgSend(v14, "center");
    UIDistanceBetweenPoints();
    objc_msgSend(v14, "setZIndex:", (uint64_t)-fabs(v24));
  }
  if ((*(_BYTE *)&self->_collectionViewDelegateFlags & 0x20) != 0)
  {
    objc_msgSend(v19, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "collectionView:layout:willApplyLayoutAttributes:", v19, self, v14);

  }
  v39 = 0;
  objc_msgSend(v14, "frame");
  v30 = v26;
  v31 = v27;
  v32 = v28;
  v33 = v29;
  if (v9)
  {
    -[SKUIStorePageCollectionViewLayout _targetFrameForStartingFrame:itemPinningConfiguration:layoutInformation:atIndexPath:returningIsPinning:](self, "_targetFrameForStartingFrame:itemPinningConfiguration:layoutInformation:atIndexPath:returningIsPinning:", v15, v16, v17, &v39, v26, v27, v28, v29);
    v30 = v34;
    v31 = v35;
    v32 = v36;
    v33 = v37;
    if (v39)
    {
      objc_msgSend(v14, "setZIndex:", objc_msgSend(v17, "section") + 200);
      if (-[SKUIStorePageCollectionViewLayout _allowsBackdropDecorationForItemPinningConfiguration:atIndexPath:](self, "_allowsBackdropDecorationForItemPinningConfiguration:atIndexPath:", v15, v17))
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setBackgroundColor:", v38);

      }
    }
  }
  objc_msgSend(v14, "setFrame:", v30, v31, v32, v33);
  if (a8)
    *a8 = v39;

}

- (id)_getCollectionViewUpdateItemForItemFromIndex:(int64_t)a3 initalLayout:(BOOL)a4
{
  _BOOL4 v4;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_updateItems;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (v4)
          objc_msgSend(v11, "indexPathAfterUpdate");
        else
          objc_msgSend(v11, "indexPathBeforeUpdate", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "section", (_QWORD)v16);

        if (v13 == a3)
        {
          v14 = v11;
          goto LABEL_14;
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (id)_indexPathsForBackgroundGradients
{
  void *v3;
  void *v4;
  NSArray *v5;
  NSArray *indexPathsForGradientItems;
  NSArray *v7;
  NSArray *v8;

  if (!self->_hasValidGradientIndexPaths)
  {
    -[SKUIStorePageCollectionViewLayout collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indexPathsForGradientItemsInCollectionView:layout:", v3, self);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    indexPathsForGradientItems = self->_indexPathsForGradientItems;
    if (indexPathsForGradientItems != v5
      && !-[NSArray isEqualToArray:](indexPathsForGradientItems, "isEqualToArray:", v5))
    {
      v7 = (NSArray *)-[NSArray copy](v5, "copy");
      v8 = self->_indexPathsForGradientItems;
      self->_indexPathsForGradientItems = v7;

    }
    self->_hasValidGradientIndexPaths = 1;

  }
  return self->_indexPathsForGradientItems;
}

- (id)_indexPathsForPinningItems
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *indexPathsForPinningItems;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!self->_hasValidIndexPathsForPinningItems)
  {
    -[SKUIStorePageCollectionViewLayout collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if ((*(_BYTE *)&self->_collectionViewDelegateFlags & 1) != 0)
    {
      objc_msgSend(v4, "indexPathsForPinningItemsInCollectionView:layout:", v3, self);
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    indexPathsForPinningItems = self->_indexPathsForPinningItems;
    if (indexPathsForPinningItems != v6
      && !-[NSArray isEqualToArray:](indexPathsForPinningItems, "isEqualToArray:", v6))
    {
      v18 = v5;
      v19 = v3;
      v8 = self->_indexPathsForPinningItems;
      v9 = (NSArray *)-[NSArray copy](v6, "copy");
      v10 = self->_indexPathsForPinningItems;
      self->_indexPathsForPinningItems = v9;

      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v11 = v8;
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v21 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
            if (!-[NSArray containsObject:](self->_indexPathsForPinningItems, "containsObject:", v16, v18, v19, (_QWORD)v20))-[NSMapTable removeObjectForKey:](self->_indexPathToItemPinningConfiguration, "removeObjectForKey:", v16);
          }
          v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v13);
      }

      v5 = v18;
      v3 = v19;
    }
    self->_hasValidIndexPathsForPinningItems = 1;

  }
  return self->_indexPathsForPinningItems;
}

- (void)_invalidatePinningLayoutInformation
{
  NSMapTable *indexPathToPinningLayoutInformation;

  indexPathToPinningLayoutInformation = self->_indexPathToPinningLayoutInformation;
  self->_indexPathToPinningLayoutInformation = 0;

  self->_hasValidPinningLayoutInformation = 0;
}

- (id)_itemPinningConfigurationForItemAtIndexPath:(id)a3
{
  id v4;
  SKUIStorePageItemPinningConfiguration *v5;
  NSMapTable *indexPathToItemPinningConfiguration;
  NSMapTable *v7;
  NSMapTable *v8;

  v4 = a3;
  if (v4)
  {
    -[NSMapTable objectForKey:](self->_indexPathToItemPinningConfiguration, "objectForKey:", v4);
    v5 = (SKUIStorePageItemPinningConfiguration *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = objc_alloc_init(SKUIStorePageItemPinningConfiguration);
      indexPathToItemPinningConfiguration = self->_indexPathToItemPinningConfiguration;
      if (!indexPathToItemPinningConfiguration)
      {
        v7 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 1);
        v8 = self->_indexPathToItemPinningConfiguration;
        self->_indexPathToItemPinningConfiguration = v7;

        indexPathToItemPinningConfiguration = self->_indexPathToItemPinningConfiguration;
      }
      -[NSMapTable setObject:forKey:](indexPathToItemPinningConfiguration, "setObject:forKey:", v5, v4);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_itemPinningLayoutInformationForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    if (!self->_hasValidPinningLayoutInformation)
    {
      -[SKUIStorePageCollectionViewLayout _calculatePinningLayoutInformation](self, "_calculatePinningLayoutInformation");
      self->_hasValidPinningLayoutInformation = 1;
    }
    -[NSMapTable objectForKey:](self->_indexPathToPinningLayoutInformation, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_layoutAttributesForPinnedBackdropDecorationViewAtIndexPath:(id)a3 pinningConfiguration:(id)a4 layoutInformation:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  double v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  objc_super v39;
  char v40;
  CGRect v41;
  CGRect v42;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SKUIStorePageCollectionViewLayout collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:withIndexPath:](SKUIStorePagePinnedBackdropLayoutAttributes, "layoutAttributesForDecorationViewOfKind:withIndexPath:", 0x1E73B7DF0, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackdropGroupName:", self->_backdropGroupName);
  if (!-[SKUIStorePageCollectionViewLayout _allowsBackdropDecorationForItemPinningConfiguration:atIndexPath:](self, "_allowsBackdropDecorationForItemPinningConfiguration:atIndexPath:", v9, v8))
  {
    v13 = 1;
    v14 = 0.0;
    goto LABEL_9;
  }
  v40 = 0;
  objc_msgSend(v10, "layoutAttributesFrame");
  -[SKUIStorePageCollectionViewLayout _targetFrameForStartingFrame:itemPinningConfiguration:layoutInformation:atIndexPath:returningIsPinning:](self, "_targetFrameForStartingFrame:itemPinningConfiguration:layoutInformation:atIndexPath:returningIsPinning:", v9, v10, v8, &v40);
  v13 = v40 == 0;
  v14 = 0.0;
  if (v40)
  {
    -[SKUIStorePageCollectionViewLayout _pinningFrameForStartingFrame:itemPinningConfiguration:atIndexPath:](self, "_pinningFrameForStartingFrame:itemPinningConfiguration:atIndexPath:", v9, v8);
    objc_msgSend(v12, "setFrame:");
    objc_msgSend(v12, "setZIndex:", 150);
    v15 = -[SKUIStorePageCollectionViewLayout _pinningTransitionStyleForItemPinningConfiguration:atIndexPath:](self, "_pinningTransitionStyleForItemPinningConfiguration:atIndexPath:", v9, v8);
    if (v15)
    {
      v16 = v15;
      v17 = -[SKUIStorePageCollectionViewLayout _pinnedBackdropViewStyle](self, "_pinnedBackdropViewStyle");
      v18 = v17;
      if (v17)
      {
        if (v17 == 2)
        {
          v19 = 2030;
        }
        else
        {
          if (v17 != 1)
            goto LABEL_14;
          v19 = 2010;
        }
        objc_msgSend(v12, "setBackdropStyle:", v19);
        v21 = 0;
      }
      else
      {
        v21 = 1;
      }
      objc_msgSend(v12, "setHidesBackdropView:", v21);
LABEL_14:
      if (v16 == 2)
      {
        v14 = 1.0;
      }
      else if (v16 == 1)
      {
        v14 = 1.0;
        if (!v18)
        {
          objc_msgSend(v11, "_effectiveContentInset");
          v23 = v22;
          objc_msgSend(v11, "contentOffset");
          v25 = v23 + v24;
          v39.receiver = self;
          v39.super_class = (Class)SKUIStorePageCollectionViewLayout;
          -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](&v39, sel_layoutAttributesForItemAtIndexPath_, v8);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "frame");
          -[SKUIStorePageCollectionViewLayout _pinningFrameForStartingFrame:itemPinningConfiguration:atIndexPath:](self, "_pinningFrameForStartingFrame:itemPinningConfiguration:atIndexPath:", v9, v8);
          v28 = v27;
          v30 = v29;
          v32 = v31;
          v34 = v33;
          objc_msgSend(v10, "afterPinningLocationYAdditions");
          v36 = v25 + v35;
          v41.origin.x = v28;
          v41.origin.y = v30;
          v41.size.width = v32;
          v41.size.height = v34;
          v37 = v36 - CGRectGetMinY(v41);
          v42.origin.x = v28;
          v42.origin.y = v30;
          v42.size.width = v32;
          v42.size.height = v34;
          v38 = v37 / fmin(CGRectGetHeight(v42), 6.0);
          if (v38 > 1.0)
            v38 = 1.0;
          v14 = fmax(v38, 0.0);

        }
      }
    }
  }
LABEL_9:
  objc_msgSend(v12, "setBackdropColor:", self->_collectionViewBackgroundColor);
  objc_msgSend(v12, "setTransitionProgress:", v14);
  objc_msgSend(v12, "setHidden:", v13);

  return v12;
}

- (id)_layoutAttributesForGradientDecorationViewAtIndexPath:(id)a3 currentAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  uint64_t i;
  void *v22;
  void *v23;
  double MaxY;
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
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v6 = a3;
  v7 = a4;
  -[SKUIStorePageCollectionViewLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfItemsInSection:", objc_msgSend(v6, "section"));
  -[SKUIStorePageCollectionViewLayout layoutAttributesForDecorationViewOfKind:atIndexPath:](self, "layoutAttributesForDecorationViewOfKind:atIndexPath:", 0x1E73B27D0, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "size");
  v12 = v11;
  objc_msgSend(v7, "frame");
  if (v9 >= 2)
  {
    v17 = v13;
    v18 = v14;
    v19 = v15;
    v20 = v16;
    for (i = 1; i != v9; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, objc_msgSend(v6, "section"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIStorePageCollectionViewLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "frame");
      MaxY = CGRectGetMaxY(v36);
      v37.origin.x = v17;
      v37.origin.y = v18;
      v37.size.width = v19;
      v37.size.height = v20;
      if (MaxY > CGRectGetMaxY(v37))
      {
        objc_msgSend(v23, "frame");
        v25 = CGRectGetMaxY(v38);
        v39.origin.x = v17;
        v39.origin.y = v18;
        v39.size.width = v19;
        v39.size.height = v20;
        v12 = v12 + v25 - CGRectGetMaxY(v39);
        objc_msgSend(v23, "frame");
        v17 = v26;
        v18 = v27;
        v19 = v28;
        v20 = v29;
      }

    }
  }
  objc_msgSend(v10, "frame");
  objc_msgSend(v7, "frame");
  v31 = v30;
  objc_msgSend(v7, "frame");
  objc_msgSend(v10, "setFrame:", v31);
  objc_msgSend(v10, "setZIndex:", -1);
  objc_msgSend(v8, "delegate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "backgroundColorForSection:", objc_msgSend(v6, "section"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copy");

  objc_msgSend(v10, "setGradientColor:", v34);
  objc_msgSend(v10, "setHidden:", 0);

  return v10;
}

- (int64_t)_pinnedBackdropViewStyle
{
  void *v3;
  void *v4;
  int v5;
  int64_t v6;
  double v8;

  if (!self->_hasValidPinnedBackdropViewStyle)
  {
    self->_pinnedBackdropViewStyle = 0;
    v8 = 0.0;
    -[SKUIStorePageCollectionViewLayout collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "backgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "getWhite:alpha:", &v8, 0);

    if (v5)
    {
      if (v8 > 0.999999881)
      {
        v6 = 1;
LABEL_7:
        self->_pinnedBackdropViewStyle = v6;
        goto LABEL_8;
      }
      if (v8 <= 0.215686275)
      {
        v6 = 2;
        goto LABEL_7;
      }
    }
LABEL_8:
    self->_hasValidPinnedBackdropViewStyle = 1;
  }
  return self->_pinnedBackdropViewStyle;
}

- (UIEdgeInsets)_pinningContentInsetForItemPinningConfiguration:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
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
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  UIEdgeInsets result;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "hasValidPinningContentInset") & 1) == 0)
  {
    if ((*(_BYTE *)&self->_collectionViewDelegateFlags & 2) != 0)
    {
      -[SKUIStorePageCollectionViewLayout collectionView](self, "collectionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "collectionView:layout:pinningContentInsetForItemAtIndexPath:", v12, self, v7);
      v8 = v14;
      v9 = v15;
      v10 = v16;
      v11 = v17;

    }
    else
    {
      v8 = *MEMORY[0x1E0DC49E8];
      v9 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v10 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      v11 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    }
    objc_msgSend(v6, "setPinningContentInset:", v8, v9, v10, v11);
  }
  objc_msgSend(v6, "pinningContentInset");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v26 = v19;
  v27 = v21;
  v28 = v23;
  v29 = v25;
  result.right = v29;
  result.bottom = v28;
  result.left = v27;
  result.top = v26;
  return result;
}

- (CGRect)_pinningFrameForStartingFrame:(CGRect)a3 itemPinningConfiguration:(id)a4 atIndexPath:(id)a5
{
  double height;
  double width;
  double y;
  double x;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SKUIStorePageCollectionViewLayout _pinningContentInsetForItemPinningConfiguration:atIndexPath:](self, "_pinningContentInsetForItemPinningConfiguration:atIndexPath:", a4, a5);
  v10 = -v9;
  v13 = y - v12;
  v15 = width - (-v11 - v14);
  v16 = height - (v10 - v12);
  v17 = x - v14;
  v18 = v13;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (int64_t)_pinningStyleForItemPinningConfiguration:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int64_t v11;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "hasValidPinningStyle") & 1) == 0)
  {
    if ((*(_BYTE *)&self->_collectionViewDelegateFlags & 4) != 0)
    {
      -[SKUIStorePageCollectionViewLayout collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "collectionView:layout:pinningStyleForItemAtIndexPath:", v9, self, v7);

    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v6, "setPinningStyle:", v8);
  }
  v11 = objc_msgSend(v6, "pinningStyle");

  return v11;
}

- (int64_t)_pinningGroupForItemPinningConfiguration:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int64_t v11;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "hasValidPinningGroup") & 1) == 0)
  {
    if ((*(_BYTE *)&self->_collectionViewDelegateFlags & 8) != 0)
    {
      -[SKUIStorePageCollectionViewLayout collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "collectionView:layout:pinningGroupForItemAtIndexPath:", v9, self, v7);

    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v6, "setPinningGroup:", v8);
  }
  v11 = objc_msgSend(v6, "pinningGroup");

  return v11;
}

- (int64_t)_pinningTransitionStyleForItemPinningConfiguration:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (self->_allowsPinningTransitions)
  {
    if ((objc_msgSend(v6, "hasValidPinningTransitionStyle") & 1) == 0)
    {
      if ((*(_BYTE *)&self->_collectionViewDelegateFlags & 0x10) != 0)
      {
        -[SKUIStorePageCollectionViewLayout collectionView](self, "collectionView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v11, "collectionView:layout:pinningTransitionStyleForItemAtIndexPath:", v10, self, v7);

      }
      else
      {
        v8 = 0;
      }
      objc_msgSend(v6, "setPinningTransitionStyle:", v8);
    }
    v9 = objc_msgSend(v6, "pinningTransitionStyle");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (CGRect)_targetFrameForStartingFrame:(CGRect)a3 itemPinningConfiguration:(id)a4 layoutInformation:(id)a5 atIndexPath:(id)a6 returningIsPinning:(BOOL *)a7
{
  double width;
  double x;
  id v13;
  id v14;
  id v15;
  double v16;
  double v17;
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
  int64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  BOOL v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  SKUIStorePageCollectionViewLayout *v56;
  double v57;
  double v58;
  double MaxY;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  uint64_t v70;
  unint64_t v71;
  void *v72;
  void *v73;
  int64_t v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  double y;
  CGFloat v88;
  double height;
  CGRect v90;
  CGRect v91;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[SKUIStorePageCollectionViewLayout _pinningContentInsetForItemPinningConfiguration:atIndexPath:](self, "_pinningContentInsetForItemPinningConfiguration:atIndexPath:", v13, v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[SKUIStorePageCollectionViewLayout collectionView](self, "collectionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "contentOffset");
  v26 = v25;
  objc_msgSend(v24, "_effectiveContentInset");
  v28 = v27;
  v29 = -[SKUIStorePageCollectionViewLayout _pinningStyleForItemPinningConfiguration:atIndexPath:](self, "_pinningStyleForItemPinningConfiguration:atIndexPath:", v13, v15);
  v88 = x;
  v30 = -v21;
  v31 = -v23;
  v32 = x - v19;
  v33 = y - v17;
  v34 = width - (v31 - v19);
  v35 = height - (v30 - v17);
  v36 = v26;
  v37 = v26 + v28;
  v38 = y;
  switch(v29)
  {
    case 1:
      objc_msgSend(v14, "afterPinningLocationYAdditions");
      v40 = v37 + v39;
      v90.origin.x = v32;
      v90.origin.y = v33;
      v90.size.width = v34;
      v90.size.height = v35;
      v41 = v40 - CGRectGetMinY(v90);
      if (v41 > 0.00000011920929)
      {
        v42 = y + v41;
        goto LABEL_7;
      }
      -[SKUIStorePageCollectionViewLayout _indexPathsForPinningItems](self, "_indexPathsForPinningItems");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v68;
      if (!v68
        || (v70 = objc_msgSend(v68, "indexOfObject:", v15), v70 == 0x7FFFFFFFFFFFFFFFLL)
        || (v71 = v70 - 1, v70 < 1))
      {
        v43 = 0;
        v44 = height;
      }
      else
      {
        v44 = height;
        if (v71 >= objc_msgSend(v69, "count"))
        {
          v43 = 0;
        }
        else
        {
          objc_msgSend(v69, "objectAtIndex:", v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKUIStorePageCollectionViewLayout _itemPinningLayoutInformationForItemAtIndexPath:](self, "_itemPinningLayoutInformationForItemAtIndexPath:", v72);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKUIStorePageCollectionViewLayout _itemPinningConfigurationForItemAtIndexPath:](self, "_itemPinningConfigurationForItemAtIndexPath:", v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = -[SKUIStorePageCollectionViewLayout _pinningStyleForItemPinningConfiguration:atIndexPath:](self, "_pinningStyleForItemPinningConfiguration:atIndexPath:", v73, v72);
          v43 = 0;
          if (v74 && v74 != 3)
          {
            objc_msgSend(v86, "layoutAttributesFrame");
            -[SKUIStorePageCollectionViewLayout _pinningFrameForStartingFrame:itemPinningConfiguration:atIndexPath:](self, "_pinningFrameForStartingFrame:itemPinningConfiguration:atIndexPath:", v73, v72);
            v43 = v41 + CGRectGetHeight(v100) > 0.00000011920929;
          }

        }
      }

      goto LABEL_32;
    case 2:
      objc_msgSend(v14, "afterPinningLocationYAdditions");
      v46 = v37 + v45;
      v91.origin.x = v32;
      v91.origin.y = v33;
      v91.size.width = v34;
      v91.size.height = v35;
      v47 = v46 - CGRectGetMinY(v91);
      if (v47 <= 0.00000011920929)
      {
        v43 = 0;
        goto LABEL_31;
      }
      v42 = y + v47;
LABEL_7:
      objc_msgSend(v14, "availablePinningFrame");
      v49 = v48;
      v51 = v50;
      v53 = v52;
      v55 = v54;
      v56 = self;
      v57 = v88;
      v44 = height;
      v58 = v42;
      goto LABEL_8;
    case 3:
      objc_msgSend(v14, "beforePinningLocationYAdditions");
      v62 = v37 + v61;
      v94.origin.x = v32;
      v94.origin.y = v33;
      v94.size.width = v34;
      v94.size.height = v35;
      v63 = v62 - CGRectGetMinY(v94);
      v43 = v63 < -0.00000011920929;
      if (v63 >= -0.00000011920929)
        v63 = -0.0;
      v38 = y + v63;
      goto LABEL_31;
    case 4:
      objc_msgSend(v14, "beforePinningLocationYAdditions");
      v65 = v37 + v64;
      v44 = height;
      v95.origin.x = v88;
      v95.origin.y = y;
      v95.size.width = width;
      v95.size.height = height;
      v66 = v65 - CGRectGetMinY(v95);
      if (v66 < -0.00000011920929)
      {
        v43 = 0;
        v38 = y + v66;
        goto LABEL_32;
      }
      objc_msgSend(v14, "afterPinningLocationYAdditions");
      v76 = v37 + v75;
      v101.origin.x = v88;
      v101.origin.y = y;
      v101.size.width = width;
      v101.size.height = height;
      v77 = v76 - CGRectGetMinY(v101);
      if (v77 <= 0.00000011920929)
        goto LABEL_35;
      v42 = y + v77;
      objc_msgSend(v14, "availablePinningFrame");
      v49 = v78;
      v51 = v79;
      v53 = v80;
      v55 = v81;
      v56 = self;
      v57 = v88;
      v58 = v42;
LABEL_8:
      -[SKUIStorePageCollectionViewLayout _pinningFrameForStartingFrame:itemPinningConfiguration:atIndexPath:](v56, "_pinningFrameForStartingFrame:itemPinningConfiguration:atIndexPath:", v13, v15, v57, v58, width, v44);
      MaxY = CGRectGetMaxY(v92);
      v93.origin.x = v49;
      v93.origin.y = v51;
      v93.size.width = v53;
      v93.size.height = v55;
      v60 = MaxY - CGRectGetMaxY(v93);
      if (v60 <= 0.00000011920929)
        v60 = 0.0;
      goto LABEL_10;
    case 5:
      if (y <= v36)
      {
        v43 = 1;
        v38 = v36;
LABEL_31:
        v44 = height;
      }
      else
      {
        objc_msgSend(v24, "bounds");
        v67 = v36 + CGRectGetHeight(v96);
        v44 = height;
        v97.origin.x = v88;
        v97.origin.y = y;
        v97.size.width = width;
        v97.size.height = height;
        if (y <= v67 - CGRectGetHeight(v97))
        {
LABEL_35:
          v43 = 0;
        }
        else
        {
          objc_msgSend(v24, "bounds");
          v42 = v36 + CGRectGetHeight(v98);
          v99.origin.x = v88;
          v99.origin.y = y;
          v99.size.width = width;
          v99.size.height = height;
          v60 = CGRectGetHeight(v99);
LABEL_10:
          v38 = v42 - v60;
          v43 = 1;
        }
      }
LABEL_32:
      if (a7)
        *a7 = v43;

      v82 = v88;
      v83 = v38;
      v84 = width;
      v85 = v44;
      result.size.height = v85;
      result.size.width = v84;
      result.origin.y = v83;
      result.origin.x = v82;
      return result;
    default:
      v43 = 0;
      v44 = height;
      v38 = y;
      goto LABEL_32;
  }
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (NSArray)indexPathsForGradientItems
{
  return self->_indexPathsForGradientItems;
}

- (void)setIndexPathsForGradientItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 600);
}

- (double)overrideContentWidth
{
  return self->_overrideContentWidth;
}

- (void)setOverrideContentWidth:(double)a3
{
  self->_overrideContentWidth = a3;
}

- (BOOL)rendersWithPerspective
{
  return self->_rendersWithPerspective;
}

- (void)setRendersWithPerspective:(BOOL)a3
{
  self->_rendersWithPerspective = a3;
}

- (BOOL)rendersWithParallax
{
  return self->_rendersWithParallax;
}

- (void)setRendersWithParallax:(BOOL)a3
{
  self->_rendersWithParallax = a3;
}

- (BOOL)allowsPinningTransitions
{
  return self->_allowsPinningTransitions;
}

- (NSIndexSet)expandChildPageSectionsIndexSet
{
  return self->_expandChildPageSectionsIndexSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandChildPageSectionsIndexSet, 0);
  objc_storeStrong((id *)&self->_updateItems, 0);
  objc_storeStrong((id *)&self->_indexPathsForPinningItems, 0);
  objc_storeStrong((id *)&self->_indexPathsForGradientItems, 0);
  objc_storeStrong((id *)&self->_indexPathToPinningLayoutInformation, 0);
  objc_storeStrong((id *)&self->_indexPathToItemPinningConfiguration, 0);
  objc_storeStrong((id *)&self->_collectionViewBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
}

- (void)init
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIStorePageCollectionViewLayout init]";
}

@end
