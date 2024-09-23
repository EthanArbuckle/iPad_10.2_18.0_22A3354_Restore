@implementation PUFeedCollectionViewLayout

- (PUFeedCollectionViewLayout)init
{
  PUFeedCollectionViewLayout *v2;
  PUFeedCollectionViewLayout *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUFeedCollectionViewLayout;
  v2 = -[PUFeedCollectionViewLayout init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PUFeedCollectionViewLayout _setWantsRightToLeftHorizontalMirroringIfNeeded:](v2, "_setWantsRightToLeftHorizontalMirroringIfNeeded:", 1);
  return v3;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  BOOL v4;
  double v5;
  int64_t v6;
  double v8;
  char v9;

  if (-[PUFeedCollectionViewLayout shouldFloatSectionHeaders](self, "shouldFloatSectionHeaders", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height)|| -[PUFeedCollectionViewLayout shouldFloatThumbnails](self, "shouldFloatThumbnails"))
  {
    v4 = 1;
  }
  else
  {
    -[PUFeedCollectionViewLayout floatingBottomDecorationHeight](self, "floatingBottomDecorationHeight");
    v4 = v5 > 0.0;
  }
  v6 = -[PUFeedCollectionViewLayout flowDirection](self, "flowDirection");
  if (v6 && v6 != 3)
  {
    -[PUFeedCollectionViewLayout sectionHeaderBackgroundHeight](self, "sectionHeaderBackgroundHeight");
    v9 = v8 > 0.0 || v4;
    if ((v9 & 1) != 0)
      return 1;
  }
  else if (v4)
  {
    return 1;
  }
  return -[PUFeedCollectionViewLayout shouldApplyParallaxEffect](self, "shouldApplyParallaxEffect");
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v11;
  id v12;
  void (**v13)(void *, const __CFString *);
  double v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  objc_super v23;

  height = a3.size.height;
  width = a3.size.width;
  v23.receiver = self;
  v23.super_class = (Class)PUFeedCollectionViewLayout;
  -[PUFeedCollectionViewLayout invalidationContextForBoundsChange:](&v23, sel_invalidationContextForBoundsChange_, a3.origin.x, a3.origin.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedCollectionViewLayout collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  if (width == v9 && height == v8)
  {
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __65__PUFeedCollectionViewLayout_invalidationContextForBoundsChange___block_invoke;
    v20 = &unk_1E58A5BF8;
    v11 = v7;
    v21 = v11;
    v12 = v6;
    v22 = v12;
    v13 = (void (**)(void *, const __CFString *))_Block_copy(&v17);
    if (-[PUFeedCollectionViewLayout shouldFloatSectionHeaders](self, "shouldFloatSectionHeaders", v17, v18, v19, v20))
    {
      v13[2](v13, CFSTR("PUFeedCollectionElementKindSectionGroupHeader"));
      v13[2](v13, CFSTR("PUFeedCollectionElementKindSectionHeader"));
      v13[2](v13, CFSTR("PUFeedCollectionElementKindCaption"));
      v13[2](v13, CFSTR("PUFeedCollectionElementKindSectionFooter"));
    }
    -[PUFeedCollectionViewLayout sectionHeaderBackgroundHeight](self, "sectionHeaderBackgroundHeight");
    if (v14 > 0.0)
      v13[2](v13, CFSTR("PUFeedCollectionElementKindSectionHeaderBackground"));
    if (-[PUFeedCollectionViewLayout shouldFloatThumbnails](self, "shouldFloatThumbnails"))
      v13[2](v13, CFSTR("PUFeedCollectionElementKindThumbnail"));
    if (-[PUFeedCollectionViewLayout shouldApplyParallaxEffect](self, "shouldApplyParallaxEffect"))
    {
      objc_msgSend(v11, "indexPathsForVisibleItems");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "invalidateItemsAtIndexPaths:", v15);

    }
  }

  return v6;
}

- (void)prepareLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUFeedCollectionViewLayout;
  -[PUFeedCollectionViewLayout prepareLayout](&v3, sel_prepareLayout);
  -[PUFeedCollectionViewLayout _updateSectionLayoutInfosIfNecessary](self, "_updateSectionLayoutInfosIfNecessary");
}

- (void)_updateSectionLayoutInfosIfNecessary
{
  NSMutableArray **p_sectionLayoutInfos;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PUFeedCollectionViewSectionLayoutInfo *v8;
  unint64_t v9;
  NSMutableArray *v10;
  _QWORD v11[7];
  _QWORD v12[4];
  __int128 v13;

  p_sectionLayoutInfos = &self->_sectionLayoutInfos;
  if (!self->_sectionLayoutInfos)
  {
    -[PUFeedCollectionViewLayout collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "numberOfSectionsInCollectionView:", v4);

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6);
    if (v6 >= 1)
    {
      do
      {
        v8 = objc_alloc_init(PUFeedCollectionViewSectionLayoutInfo);
        objc_msgSend(v7, "addObject:", v8);

        --v6;
      }
      while (v6);
    }
    objc_storeStrong((id *)p_sectionLayoutInfos, v7);
    self->_contentSize = (CGSize)*MEMORY[0x1E0C9D820];
    -[PUFeedCollectionViewLayout _updateGlobalLayoutInfoWithOptions:sectionsWithUpdatedGroupIDs:](self, "_updateGlobalLayoutInfoWithOptions:sectionsWithUpdatedGroupIDs:", 0, 0);
    v9 = -[PUFeedCollectionViewLayout flowDirection](self, "flowDirection");
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3010000000;
    v12[3] = &unk_1AB197D4B;
    v13 = *MEMORY[0x1E0C9D538];
    v10 = *p_sectionLayoutInfos;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__PUFeedCollectionViewLayout__updateSectionLayoutInfosIfNecessary__block_invoke;
    v11[3] = &unk_1E589E7A0;
    v11[4] = self;
    v11[5] = v12;
    v11[6] = v9;
    -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](v10, "enumerateObjectsWithOptions:usingBlock:", 2 * (v9 < 2), v11);
    _Block_object_dispose(v12, 8);

  }
}

- (void)_updateParallaxForLayoutAttributes:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v14 = a3;
  if (-[PUFeedCollectionViewLayout shouldApplyParallaxEffect](self, "shouldApplyParallaxEffect"))
  {
    -[PUFeedCollectionViewLayout _parallaxComputer](self, "_parallaxComputer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFeedCollectionViewLayout collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    objc_msgSend(v5, "adjustedContentInset");
    v11 = v7 + v10;
    v13 = v9 + v12;
    objc_msgSend(v14, "frame");
    objc_msgSend(v4, "contentParallaxOffsetForViewFrame:visibleRect:", v11, v13);
    objc_msgSend(v14, "setEdgeParallaxOffset:");
    objc_msgSend(v14, "frame");
    objc_msgSend(v4, "contentParallaxOffsetForViewFrame:visibleRect:");
    objc_msgSend(v14, "setParallaxOffset:");

  }
}

- (void)_setOrigin:(CGPoint)a3 forSectionLayoutInfo:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  y = a3.y;
  x = a3.x;
  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(v7, "setOrigin:", x, y);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v7, "fixedLayoutAttributes", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[PUFeedCollectionViewLayout _updateParallaxForLayoutAttributes:](self, "_updateParallaxForLayoutAttributes:", v13);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (CGSize)collectionViewContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  _QWORD aBlock[5];
  id v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGRect v40;
  CGRect v41;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PUFeedCollectionViewLayout _updateSectionLayoutInfosIfNecessary](self, "_updateSectionLayoutInfosIfNecessary");
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PUFeedCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
  aBlock[3] = &unk_1E589E7C8;
  aBlock[4] = self;
  v36 = x;
  v37 = y;
  v38 = width;
  v39 = height;
  v10 = v8;
  v35 = v10;
  v11 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v9;
  v25[1] = 3221225472;
  v25[2] = __64__PUFeedCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke_2;
  v25[3] = &unk_1E589E7F0;
  v30 = x;
  v31 = y;
  v32 = width;
  v33 = height;
  v14 = v10;
  v26 = v14;
  v15 = v11;
  v29 = v15;
  v16 = v12;
  v27 = v16;
  v17 = v13;
  v28 = v17;
  -[PUFeedCollectionViewLayout _enumerateSectionsInRect:withBlock:](self, "_enumerateSectionsInRect:withBlock:", v25, x, y, width, height);
  objc_msgSend(v17, "removeIndexes:", v16);
  v23[0] = v9;
  v23[1] = 3221225472;
  v23[2] = __64__PUFeedCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke_3;
  v23[3] = &unk_1E589E818;
  v18 = v15;
  v24 = v18;
  objc_msgSend(v17, "enumerateIndexesUsingBlock:", v23);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedCollectionViewLayout layoutAttributesForDecorationViewOfKind:atIndexPath:](self, "layoutAttributesForDecorationViewOfKind:atIndexPath:", CFSTR("PUFeedCollectionElementKindDecoration"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v20, "frame");
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    if (CGRectIntersectsRect(v40, v41))
      objc_msgSend(v14, "addObject:", v20);
  }
  v21 = v14;

  return v21;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUFeedCollectionViewLayout _updateSectionLayoutInfosIfNecessary](self, "_updateSectionLayoutInfosIfNecessary");
  -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v5, "fixedLayoutAttributes", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
      if (!objc_msgSend(v11, "representedElementCategory"))
      {
        objc_msgSend(v11, "indexPath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if ((v13 & 1) != 0)
          break;
      }
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    -[PUFeedCollectionViewLayout _updateParallaxForLayoutAttributes:](self, "_updateParallaxForLayoutAttributes:", v11);
    v14 = v11;

    if (v14)
      goto LABEL_15;
  }
  else
  {
LABEL_10:

  }
  v15 = objc_msgSend(v4, "item");
  -[PUFeedCollectionViewLayout collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "numberOfItemsInSection:", objc_msgSend(v4, "section"));

  if (v15 >= v17)
  {
    v14 = 0;
  }
  else
  {
    +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:](PUCollectionViewLayoutAttributes, "layoutAttributesForCellWithIndexPath:", v4);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidden:", 1);
  }
LABEL_15:

  return v14;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  int64_t v10;
  int64_t v11;
  _BOOL4 v12;
  void *v13;
  BOOL v14;
  BOOL v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  int v30;
  uint64_t v32;
  PUFeedCollectionViewLayout *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PUFeedCollectionViewLayout _updateSectionLayoutInfosIfNecessary](self, "_updateSectionLayoutInfosIfNecessary");
  v8 = objc_msgSend(v7, "section");
  -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PUFeedCollectionViewLayout flowDirection](self, "flowDirection");
  v11 = v10;
  if (v10
    && v10 != 3
    && ((objc_msgSend(v6, "isEqualToString:", CFSTR("PUFeedCollectionElementKindSectionGroupHeader")) & 1) != 0
     || (objc_msgSend(v6, "isEqualToString:", CFSTR("PUFeedCollectionElementKindSectionHeader")) & 1) != 0
     || (objc_msgSend(v6, "isEqualToString:", CFSTR("PUFeedCollectionElementKindCaption")) & 1) != 0
     || objc_msgSend(v6, "isEqualToString:", CFSTR("PUFeedCollectionElementKindSectionFooter"))))
  {
    v14 = -[PUFeedCollectionViewLayout shouldFloatSectionHeaders](self, "shouldFloatSectionHeaders");
  }
  else
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("PUFeedCollectionElementKindSectionHeaderBackground")))
    {
      if (v11 && v11 != 3)
      {
        objc_msgSend(v9, "floatingLayoutAttributes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = -[PUFeedCollectionViewLayout shouldFloatSectionHeaders](self, "shouldFloatSectionHeaders");
        objc_msgSend(v9, "floatingLayoutAttributes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_18;
      }
LABEL_32:
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v16 = v13;
      v24 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (!v24)
      {
        v17 = 0;
        goto LABEL_48;
      }
      v25 = v24;
      v32 = v8;
      v33 = self;
      v34 = v9;
      v26 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v40 != v26)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          if (objc_msgSend(v20, "representedElementCategory") == 1)
          {
            objc_msgSend(v20, "representedElementKind");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v28, "isEqualToString:", v6) & 1) != 0)
            {
              objc_msgSend(v20, "indexPath");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "isEqual:", v7);

              if (v30)
              {
                -[PUFeedCollectionViewLayout _adjustFloatingLayoutAttributes:inSection:](v33, "_adjustFloatingLayoutAttributes:inSection:", v20, v32);
                goto LABEL_45;
              }
            }
            else
            {

            }
          }
        }
        v25 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v25);
      v17 = 0;
      goto LABEL_46;
    }
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("PUFeedCollectionElementKindThumbnail")) & 1) == 0)
    {
      objc_msgSend(v9, "floatingLayoutAttributes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    v14 = -[PUFeedCollectionViewLayout shouldFloatThumbnails](self, "shouldFloatThumbnails");
  }
  v15 = v14;
  objc_msgSend(v9, "floatingLayoutAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    goto LABEL_32;
LABEL_18:
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v16 = v13;
  v17 = (id)objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v17)
  {
    v34 = v9;
    v18 = *(_QWORD *)v36;
    while (2)
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend(v20, "representedElementCategory") == 1)
        {
          objc_msgSend(v20, "representedElementKind");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v21, "isEqualToString:", v6) & 1) != 0)
          {
            objc_msgSend(v20, "indexPath");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "isEqual:", v7);

            if ((v23 & 1) != 0)
            {
LABEL_45:
              v17 = v20;
              goto LABEL_46;
            }
          }
          else
          {

          }
        }
      }
      v17 = (id)objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      if (v17)
        continue;
      break;
    }
LABEL_46:
    v9 = v34;
  }
LABEL_48:

  return v17;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  double v8;
  CGFloat v9;
  void *v10;
  void *v11;
  CGRect v13;
  CGRect slice;
  CGRect v15;

  v6 = a3;
  v7 = a4;
  -[PUFeedCollectionViewLayout _updateSectionLayoutInfosIfNecessary](self, "_updateSectionLayoutInfosIfNecessary");
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("PUFeedCollectionElementKindDecoration"))
    && (-[PUFeedCollectionViewLayout floatingBottomDecorationHeight](self, "floatingBottomDecorationHeight"), v8 > 0.0))
  {
    v9 = v8;
    objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForDecorationViewOfKind:withIndexPath:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&slice, 0, sizeof(slice));
    -[PUFeedCollectionViewLayout collectionView](self, "collectionView", 0, 0, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    CGRectDivide(v15, &slice, &v13, v9, CGRectMaxYEdge);

    objc_msgSend(v10, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    objc_msgSend(v10, "setZIndex:", 2);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_parallaxComputer
{
  PUParallaxComputer *parallaxComputer;
  PUParallaxComputer *v4;
  PUParallaxComputer *v5;

  parallaxComputer = self->_parallaxComputer;
  if (!parallaxComputer)
  {
    v4 = objc_alloc_init(PUParallaxComputer);
    v5 = self->_parallaxComputer;
    self->_parallaxComputer = v4;

    -[PUFeedCollectionViewLayout _updateParallaxComputer](self, "_updateParallaxComputer");
    parallaxComputer = self->_parallaxComputer;
  }
  return parallaxComputer;
}

- (void)_updateParallaxComputer
{
  uint64_t v3;
  PUParallaxComputer *parallaxComputer;
  double v5;

  if (-[PUFeedCollectionViewLayout flowDirection](self, "flowDirection"))
  {
    if (-[PUFeedCollectionViewLayout flowDirection](self, "flowDirection") == 3)
      v3 = 2;
    else
      v3 = 1;
  }
  else
  {
    v3 = 2;
  }
  -[PUParallaxComputer setAxis:](self->_parallaxComputer, "setAxis:", v3);
  parallaxComputer = self->_parallaxComputer;
  -[PUFeedCollectionViewLayout parallaxFactor](self, "parallaxFactor");
  -[PUParallaxComputer setParallaxFactor:](parallaxComputer, "setParallaxFactor:", v5 / 100.0);
  -[PUParallaxComputer setModel:](self->_parallaxComputer, "setModel:", -[PUFeedCollectionViewLayout parallaxModel](self, "parallaxModel"));
}

- (void)setFlowDirection:(int64_t)a3
{
  if (self->_flowDirection != a3)
  {
    self->_flowDirection = a3;
    -[PUFeedCollectionViewLayout _updateParallaxComputer](self, "_updateParallaxComputer");
  }
}

- (unsigned)flowDirectionEdge
{
  unint64_t v2;

  v2 = -[PUFeedCollectionViewLayout flowDirection](self, "flowDirection");
  if (v2 > 3)
    return 0;
  else
    return dword_1AB0EF4B0[v2];
}

- (void)setParallaxFactor:(double)a3
{
  if (self->_parallaxFactor != a3)
  {
    self->_parallaxFactor = a3;
    -[PUFeedCollectionViewLayout _updateParallaxComputer](self, "_updateParallaxComputer");
  }
}

- (void)setParallaxModel:(int64_t)a3
{
  if (self->_parallaxModel != a3)
  {
    self->_parallaxModel = a3;
    -[PUFeedCollectionViewLayout _updateParallaxComputer](self, "_updateParallaxComputer");
  }
}

- (void)invalidateLayoutAndCache
{
  NSMutableArray *sectionLayoutInfos;

  -[PUFeedCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  sectionLayoutInfos = self->_sectionLayoutInfos;
  self->_sectionLayoutInfos = 0;

}

- (id)sectionsJoinedWithSection:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  -[PUFeedCollectionViewLayout _updateSectionLayoutInfosIfNecessary](self, "_updateSectionLayoutInfosIfNecessary");
  -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isHidden") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_msgSend(v5, "firstJoinedSection");
    v8 = objc_msgSend(v5, "lastJoinedSection");
    if (v7 >= v8)
      v9 = v8;
    else
      v9 = v7;
    if (v7 <= v8)
      v10 = v8;
    else
      v10 = v7;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 + 1;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isHidden") & 1) == 0)
        objc_msgSend(v6, "addIndex:", v9);

      ++v9;
    }
    while (v11 != v9);
  }

  return v6;
}

- (int64_t)numberOfTilesOmittedInSection:(int64_t)a3
{
  void *v5;
  int64_t v6;

  -[PUFeedCollectionViewLayout _updateSectionLayoutInfosIfNecessary](self, "_updateSectionLayoutInfosIfNecessary");
  -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfTilesOmitted");

  return v6;
}

- (CGRect)frameForSection:(int64_t)a3
{
  void *v5;
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
  double v24;
  double v25;
  CGRect result;

  -[PUFeedCollectionViewLayout _updateSectionLayoutInfosIfNecessary](self, "_updateSectionLayoutInfosIfNecessary");
  -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "margins");
  v15 = v7 + v14;
  v17 = v9 + v16;
  v19 = v11 - (v14 + v18);
  v21 = v13 - (v16 + v20);

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)enumerateImageElementsInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__PUFeedCollectionViewLayout_enumerateImageElementsInRect_usingBlock___block_invoke;
  v11[3] = &unk_1E589E840;
  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  v12 = v9;
  v10 = v9;
  -[PUFeedCollectionViewLayout _enumerateSectionsInRect:withBlock:](self, "_enumerateSectionsInRect:withBlock:", v11, x, y, width, height);

}

- (id)indexPathForImageElementAtPoint:(CGPoint)a3
{
  id v8;
  _QWORD v10[6];
  CGPoint v11;
  __int128 v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__26056;
  v17 = __Block_byref_object_dispose__26057;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__PUFeedCollectionViewLayout_indexPathForImageElementAtPoint___block_invoke;
  v10[3] = &unk_1E589E868;
  v11 = a3;
  __asm { FMOV            V2.2D, #1.0 }
  v12 = _Q2;
  v10[4] = self;
  v10[5] = &v13;
  -[PUFeedCollectionViewLayout enumerateImageElementsInRect:usingBlock:](self, "enumerateImageElementsInRect:usingBlock:", v10, a3.x, a3.y, 1.0, 1.0);
  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (CGRect)frameForTileAtIndexPath:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
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

  v5 = a3;
  -[PUFeedCollectionViewLayout _updateSectionLayoutInfosIfNecessary](self, "_updateSectionLayoutInfosIfNecessary");
  -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tileLayoutAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v5, "item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "representedElementCategory")
    || (objc_msgSend(v8, "indexPath"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqual:", v5),
        v9,
        (v10 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUFeedCollectionViewLayout.m"), 533, CFSTR("incorrect tile layout attributes"));

  }
  objc_msgSend(v8, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

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

- (id)_delegate
{
  void *v4;
  void *v5;
  void *v7;

  -[PUFeedCollectionViewLayout collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EEC80CA0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUFeedCollectionViewLayout.m"), 542, CFSTR("collection view delegate must conform to PUFeedCollectionViewLayoutDelegate protocol."));

  }
  return v5;
}

- (void)_updateGlobalLayoutInfoWithOptions:(int64_t)a3 sectionsWithUpdatedGroupIDs:(id *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *sectionLayoutInfos;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSMutableArray *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  PUFeedCollectionViewLayout *v31;
  id v32;
  _QWORD *v33;
  _QWORD *v34;
  int64_t v35;
  _QWORD v36[4];
  _QWORD v37[5];

  -[PUFeedCollectionViewLayout collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedCollectionViewLayout _delegate](self, "_delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUFeedCollectionViewLayout flowDirection](self, "flowDirection"))
    v9 = 2 * (-[PUFeedCollectionViewLayout flowDirection](self, "flowDirection") == 1);
  else
    v9 = 2;
  v20 = v9;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = 0x7FFFFFFFFFFFFFFFLL;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sectionLayoutInfos = self->_sectionLayoutInfos;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __93__PUFeedCollectionViewLayout__updateGlobalLayoutInfoWithOptions_sectionsWithUpdatedGroupIDs___block_invoke;
  v28[3] = &unk_1E589E8B0;
  v12 = v8;
  v29 = v12;
  v13 = v7;
  v30 = v13;
  v31 = self;
  v33 = v37;
  v34 = v36;
  v14 = v10;
  v32 = v14;
  v35 = a3;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](sectionLayoutInfos, "enumerateObjectsWithOptions:usingBlock:", v20, v28);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__26056;
  v26[4] = __Block_byref_object_dispose__26057;
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = self->_sectionLayoutInfos;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __93__PUFeedCollectionViewLayout__updateGlobalLayoutInfoWithOptions_sectionsWithUpdatedGroupIDs___block_invoke_3;
  v21[3] = &unk_1E589E8D8;
  v21[4] = self;
  v17 = v12;
  v22 = v17;
  v18 = v13;
  v23 = v18;
  v25 = v26;
  v19 = v15;
  v24 = v19;
  -[NSMutableArray enumerateObjectsAtIndexes:options:usingBlock:](v16, "enumerateObjectsAtIndexes:options:usingBlock:", v14, v20, v21);
  if (a4)
    *a4 = objc_retainAutorelease(v19);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v37, 8);

}

- (void)_updateLayoutInfoForSection:(int64_t)a3 ignoreSizeChange:(BOOL)a4
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  BOOL v22;
  int64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  double v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  uint64_t v75;
  BOOL v76;
  BOOL v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  uint64_t v91;
  double v92;
  double v93;
  uint64_t v94;
  void *v95;
  double v96;
  void *v97;
  uint64_t v98;
  _QWORD v99[6];
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  uint64_t v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  CGRect v110;
  CGRect v111;

  -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedCollectionViewLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedCollectionViewLayout _delegate](self, "_delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isHidden") & 1) != 0)
  {
    objc_msgSend(v7, "frame");
    v11 = v10;
    v13 = v12;
    v14 = *MEMORY[0x1E0C9D820];
    v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    objc_msgSend(v7, "setSize:", *MEMORY[0x1E0C9D820], v15);
    objc_msgSend(v7, "setHeaderSize:", v14, v15);
    objc_msgSend(v7, "setFooterSize:", v14, v15);
    objc_msgSend(v7, "setFixedLayoutAttributes:", 0);
    objc_msgSend(v7, "setTileLayoutAttributes:", 0);
    objc_msgSend(v7, "setFloatingLayoutAttributes:", 0);
    if (!a4)
      -[PUFeedCollectionViewLayout _sectionAtIndex:sizeDidChangeFrom:to:](self, "_sectionAtIndex:sizeDidChangeFrom:to:", a3, v11, v13, v14, v15);
  }
  else
  {
    v108 = *MEMORY[0x1E0C9D820];
    v109 = v108;
    v107 = v108;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v98 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(v7, "previousVisibleSection");
    v91 = objc_msgSend(v7, "nextVisibleSection");
    v17 = objc_msgSend(v7, "firstJoinedSection");
    +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "showGroupIDHeaders");

    if (v19)
    {
      v20 = (void *)v16;
      objc_msgSend(v7, "groupID");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = (void *)v16;
      v95 = 0;
    }
    v21 = v97;
    v22 = v17 != a3;
    v23 = -[PUFeedCollectionViewLayout flowDirection](self, "flowDirection");
    v106 = 0;
    LOBYTE(v75) = v22;
    -[PUFeedCollectionViewLayout _getSize:headerSize:footerSize:fixedLayoutAttributes:tileLayoutAttributes:floatingLayoutAttributes:type:forSection:isJoined:](self, "_getSize:headerSize:footerSize:fixedLayoutAttributes:tileLayoutAttributes:floatingLayoutAttributes:type:forSection:isJoined:", &v109, &v108, &v107, v97, v98, v20, &v106, a3, v75);
    objc_msgSend(v7, "origin");
    v25 = v24;
    v27 = v26;
    v28 = MEMORY[0x1E0DC49E8];
    v30 = *MEMORY[0x1E0DC49E8];
    v29 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v31 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v33 = *MEMORY[0x1E0C9D538];
    v32 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v7, "setFixedLayoutAttributes:", 0);
    v96 = v33;
    if (v23 != 3 && v23)
    {
      -[PUFeedCollectionViewLayout sectionReferenceSize](self, "sectionReferenceSize");
      if (v9)
      {
        v93 = v27;
        v99[0] = 0;
        v99[1] = v46;
        memset(&v99[2], 0, 32);
        objc_msgSend(v9, "collectionView:layout:metricsForSeparatorBetweenSection:andSection:proposedMetrics:", v8, self, v94, a3, v99);
        v47 = v100;
        if (v100 > 0.0)
        {
          v79 = v25;
          v83 = v30;
          v86 = v29;
          v88 = v31;
          v48 = v101;
          v49 = v102;
          v50 = v103;
          v51 = v104;
          v52 = v32;
          v53 = v105;
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a3);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = v96 - v47;
          v55 = v96 + v50;
          v90 = v52;
          v56 = v52 + v49;
          v57 = v47 - (v50 + v53);
          v111.origin.x = v55;
          v111.origin.y = v56;
          v111.size.width = v57;
          v111.size.height = v48 - (v49 + v51);
          if (!CGRectIsEmpty(v111))
          {
            objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("PUFeedCollectionElementKindSeparator"), v54);
            v77 = a4;
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "setFrame:", v55, v56, v57, v48 - (v49 + v51));
            objc_msgSend(v97, "addObject:", v58);

            a4 = v77;
          }
          v29 = v86 + v47;

          v21 = v97;
          v31 = v88;
          v32 = v90;
          v30 = v83;
          v25 = v79;
        }
        v27 = v93;
      }
    }
    else
    {
      -[PUFeedCollectionViewLayout sectionReferenceSize](self, "sectionReferenceSize");
      if (v9)
      {
        v87 = v31;
        v89 = v32;
        v35 = v25;
        v92 = v27;
        v85 = v29;
        v99[0] = v34;
        memset(&v99[1], 0, 32);
        if (v95)
          v36 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v36 = v94;
        v99[5] = 0;
        objc_msgSend(v9, "collectionView:layout:metricsForSeparatorBetweenSection:andSection:proposedMetrics:", v8, self, v36, a3, v99);
        v37 = v101;
        v38 = v102;
        v40 = v103;
        v39 = v104;
        v41 = v105;
        v80 = v102;
        v81 = v105;
        if (v101 <= 0.0)
        {
          v25 = v35;
          v32 = v89;
        }
        else
        {
          v78 = v35;
          v82 = v30;
          v42 = v100;
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a3);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v42 - (v40 + v41);
          v110.origin.x = v33 + v40;
          v110.origin.y = v89 - v37 + v38;
          v110.size.width = v44;
          v110.size.height = v37 - (v38 + v39);
          if (!CGRectIsEmpty(v110))
          {
            objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("PUFeedCollectionElementKindSeparator"), v43);
            v76 = a4;
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setFrame:", v33 + v40, v89 - v37 + v38, v44, v37 - (v38 + v39));
            objc_msgSend(v97, "addObject:", v45);

            a4 = v76;
          }
          v30 = v82 + v39;
          v32 = v89 - (v82 + v39);

          v21 = v97;
          v25 = v78;
        }
        -[PUFeedCollectionViewLayout sectionReferenceSize](self, "sectionReferenceSize");
        v99[0] = v60;
        *(double *)&v99[1] = v37;
        *(double *)&v99[2] = v80;
        *(double *)&v99[3] = v40;
        *(double *)&v99[4] = v39;
        *(double *)&v99[5] = v81;
        objc_msgSend(v9, "collectionView:layout:metricsForSeparatorBetweenSection:andSection:proposedMetrics:", v8, self, a3, v91, v99);
        v59 = -0.0;
        if (v101 > 0.0)
          v59 = v102;
        v29 = v85;
        v31 = v87;
        v27 = v92;
      }
      else
      {
        -[PUFeedCollectionViewLayout sectionReferenceSize](self, "sectionReferenceSize");
        v59 = -0.0;
      }
      v31 = v31 + v59;
    }
    v61 = *(double *)(v28 + 24);
    if (v95 && (v23 == 3 || !v23))
    {
      v62 = v25;
      -[PUFeedCollectionViewLayout sectionReferenceSize](self, "sectionReferenceSize");
      objc_msgSend(v9, "collectionView:layout:headerSizeForGroupID:proposedSize:", v8, self, v95);
      if (v63 > 0.0)
      {
        v64 = v63;
        objc_msgSend(v9, "collectionView:layout:spacingBetweenSection:andHeaderForGroupID:", v8, self, v94, v95);
        v84 = v30;
        v66 = v65;
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a3);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("PUFeedCollectionElementKindSectionGroupHeader"), v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUFeedCollectionViewLayout sectionReferenceSize](self, "sectionReferenceSize");
        objc_msgSend(v68, "setFrame:", v96, v32 - v64, v69, v64);
        objc_msgSend(v68, "setZIndex:", 5);
        objc_msgSend(v97, "addObject:", v68);
        v32 = v32 - (v64 + v66);
        v30 = v84 + v64 + v66;

        v21 = v97;
      }
      v70 = (void *)v98;
      v25 = v62;
    }
    else
    {
      v70 = (void *)v98;
    }
    -[PUFeedCollectionViewLayout _setOrigin:forSectionLayoutInfo:](self, "_setOrigin:forSectionLayoutInfo:", v7, v96, v32);
    *(double *)&v109 = v61 + v29 + *(double *)&v109;
    *((double *)&v109 + 1) = v31 + v30 + *((double *)&v109 + 1);
    objc_msgSend(v7, "frame");
    v72 = v71;
    v74 = v73;
    objc_msgSend(v7, "setSize:", v109);
    objc_msgSend(v7, "setHeaderSize:", v108);
    objc_msgSend(v7, "setFooterSize:", v107);
    objc_msgSend(v7, "setFixedLayoutAttributes:", v21);
    objc_msgSend(v7, "setTileLayoutAttributes:", v70);
    objc_msgSend(v7, "setFloatingLayoutAttributes:", v20);
    -[PUFeedCollectionViewLayout _setOrigin:forSectionLayoutInfo:](self, "_setOrigin:forSectionLayoutInfo:", v7, v25, v27);
    objc_msgSend(v7, "setMargins:", v30, v29, v31, v61);
    objc_msgSend(v7, "setSectionType:", v106);
    if (!a4)
      -[PUFeedCollectionViewLayout _sectionAtIndex:sizeDidChangeFrom:to:](self, "_sectionAtIndex:sizeDidChangeFrom:to:", a3, v72, v74, v109);

  }
}

- (void)_sectionAtIndex:(int64_t)a3 sizeDidChangeFrom:(CGSize)a4 to:(CGSize)a5
{
  double height;
  double width;
  double v7;
  double v8;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  CGSize *p_contentSize;
  double v18;
  double v19;
  id v20;
  _QWORD v21[8];

  height = a5.height;
  width = a5.width;
  v7 = a4.height;
  v8 = a4.width;
  v11 = -[PUFeedCollectionViewLayout flowDirection](self, "flowDirection");
  if (v11 > 1)
  {
    v13 = a3 + 1;
    if (v13 >= -[NSMutableArray count](self->_sectionLayoutInfos, "count"))
    {
      v14 = 0;
      v12 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v13, -[NSMutableArray count](self->_sectionLayoutInfos, "count") - v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
    }
  }
  else
  {
    if (a3 < 0)
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = 2;
  }
  v15 = width - v8;
  v16 = height - v7;
  v21[1] = 3221225472;
  v21[2] = __67__PUFeedCollectionViewLayout__sectionAtIndex_sizeDidChangeFrom_to___block_invoke;
  v21[3] = &unk_1E589E900;
  v21[4] = self;
  v21[5] = v11;
  *(double *)&v21[6] = v15;
  *(double *)&v21[7] = v16;
  v20 = v12;
  v21[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v12, "enumerateIndexesWithOptions:usingBlock:", v14, v21);
  if (v11 != 3 && v11)
  {
    p_contentSize = &self->_contentSize;
    v19 = self->_contentSize.height;
    v18 = v15 + self->_contentSize.width;
    if (v19 < height)
      v19 = height;
  }
  else
  {
    p_contentSize = &self->_contentSize;
    v18 = self->_contentSize.width;
    if (v18 < width)
      v18 = width;
    v19 = v16 + self->_contentSize.height;
  }
  p_contentSize->width = v18;
  p_contentSize->height = v19;

}

- (void)_adjustFloatingLayoutAttributes:(id)a3 inSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  BOOL v11;
  CGRectEdge v12;
  void *v13;
  int v14;
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
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v77;
  double v78;
  double MaxX;
  double v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  _BOOL4 v85;
  double v86;
  double v87;
  double MinX;
  double v89;
  void *v90;
  double v91;
  double v92;
  double MinY;
  double MaxY;
  CGFloat v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  void *v108;
  int v109;
  uint64_t v110;
  void *v111;
  void *v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  CGFloat v118;
  double v119;
  double v120;
  CGFloat rect;
  double v122;
  double v123;
  double v124;
  double v125;
  double remainder[7];
  CGRect slice;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;

  v6 = a3;
  -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedCollectionViewLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PUFeedCollectionViewLayout flowDirection](self, "flowDirection");
  v10 = v9;
  if (v9)
    v11 = v9 == 3;
  else
    v11 = 1;
  v12 = v11;
  objc_msgSend(v6, "representedElementKind");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("PUFeedCollectionElementKindSectionHeaderBackground"));
  objc_msgSend(v8, "bounds");
  v19 = v15;
  v20 = v16;
  v21 = v17;
  v22 = v18;
  if ((v14 & 1) != 0)
  {
    v124 = v18;
    remainder[0] = v15;
    v122 = v16;
    v123 = v17;
  }
  else
  {
    objc_msgSend(v8, "adjustedContentInset");
    v24 = v19 + v23;
    v26 = v20 + v25;
    v28 = v21 - (v23 + v27);
    v30 = v22 - (v25 + v29);
    -[PUFeedCollectionViewLayout floatPadding](self, "floatPadding");
    v122 = v26 + v33;
    v123 = v28 - (v31 + v32);
    v124 = v30 - (v33 + v34);
    remainder[0] = v24 + v31;
  }
  objc_msgSend(v6, "frame");
  remainder[2] = v35;
  v37 = v36;
  v120 = v38;
  v40 = v39;
  objc_msgSend(v7, "frame");
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v48 = v47;
  objc_msgSend(v7, "margins");
  v50 = v42 + v49;
  v52 = v44 + v51;
  v54 = v46 - (v49 + v53);
  slice.origin.x = v50;
  slice.origin.y = v52;
  v56 = v48 - (v51 + v55);
  slice.size.width = v54;
  slice.size.height = v56;
  remainder[1] = v40;
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("PUFeedCollectionElementKindSectionGroupHeader")) & 1) != 0
    || ((objc_msgSend(v13, "isEqualToString:", CFSTR("PUFeedCollectionElementKindSectionHeader")) | v14) & 1) != 0
    || (objc_msgSend(v13, "isEqualToString:", CFSTR("PUFeedCollectionElementKindCaption")) & 1) != 0
    || objc_msgSend(v13, "isEqualToString:", CFSTR("PUFeedCollectionElementKindSectionFooter")))
  {
    rect = v37;
    -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", objc_msgSend(v7, "lastJoinedSection"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "frame");
    v59 = v58;
    v61 = v60;
    v63 = v62;
    v65 = v64;
    objc_msgSend(v57, "margins");
    v143.origin.x = v59 + v66;
    v143.origin.y = v61 + v67;
    v143.size.width = v63 - (v66 + v68);
    v143.size.height = v65 - (v67 + v69);
    v128.origin.x = v50;
    v128.origin.y = v52;
    v128.size.width = v54;
    v128.size.height = v56;
    v129 = CGRectUnion(v128, v143);
    slice = v129;
    v70 = 0.0;
    v71 = 50.0;
    if (v10 && v10 != 3)
    {
      x = v129.origin.x;
      y = v129.origin.y;
      width = v129.size.width;
      height = v129.size.height;
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("PUFeedCollectionElementKindSectionGroupHeader")) & 1) != 0
        || (objc_msgSend(v13, "isEqualToString:", CFSTR("PUFeedCollectionElementKindSectionHeader")) & 1) != 0
        || (objc_msgSend(v13, "isEqualToString:", CFSTR("PUFeedCollectionElementKindCaption")) & 1) != 0
        || objc_msgSend(v13, "isEqualToString:", CFSTR("PUFeedCollectionElementKindSectionFooter")))
      {
        memset(&remainder[3], 0, 32);
        v130.size.height = v124;
        v130.origin.x = remainder[0];
        v130.origin.y = v122;
        v130.size.width = v123;
        v77 = CGRectGetWidth(v130);
        if (v120 >= v77)
          v78 = v77;
        else
          v78 = v120;
        v131.origin.x = x;
        v131.origin.y = y;
        v131.size.width = width;
        v131.size.height = height;
        MaxX = CGRectGetMaxX(v131);
        v132.origin.x = remainder[2];
        v132.origin.y = rect;
        v132.size.width = v78;
        v132.size.height = remainder[1];
        v80 = MaxX - CGRectGetMinX(v132);
        if (v78 >= v80)
          v81 = v80;
        else
          v81 = v78;
        if (!-[PUFeedCollectionViewLayout shouldFloatOverShortDistances](self, "shouldFloatOverShortDistances"))
        {
          v133.origin.x = x;
          v133.origin.y = y;
          v133.size.width = width;
          v133.size.height = height;
          if (CGRectGetWidth(v133) < v77)
          {
            v134.origin.x = x;
            v134.origin.y = y;
            v134.size.width = width;
            v134.size.height = height;
            CGRectDivide(v134, &slice, (CGRect *)&remainder[3], v81, v12);
          }
        }
        v71 = 100.0;
        v70 = 100.0;
        v37 = rect;
        v72 = v81;
        goto LABEL_31;
      }
      v71 = 0.0;
      if (objc_msgSend(v13, "isEqualToString:", CFSTR("PUFeedCollectionElementKindSectionHeaderBackground")))
      {
        v82 = v124;
        v141.origin.x = remainder[0];
        v141.origin.y = v122;
        v141.size.width = v123;
        v141.size.height = v124;
        v120 = CGRectGetWidth(v141);
        v142.origin.x = x;
        v142.size.height = height;
        v84 = v122;
        v142.origin.y = y;
        v83 = v123;
        v142.size.width = width;
        v119 = CGRectGetWidth(v142);
        v37 = rect;
        if (v120 >= v119)
          v72 = v119;
        else
          v72 = v120;
        v70 = 0.0;
        goto LABEL_32;
      }
    }
    v72 = v120;
    v37 = rect;
LABEL_31:
    v83 = v123;
    v82 = v124;
    v84 = v122;
LABEL_32:

    goto LABEL_33;
  }
  v71 = 0.0;
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("PUFeedCollectionElementKindThumbnail")))
  {
    v71 = 150.0;
    if (v10 == 3 || !v10)
    {
      +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = objc_msgSend(v108, "showGroupIDHeaders");

      v72 = v120;
      if (v109)
      {
        v110 = objc_msgSend(v7, "nextVisibleSection");
        if (v110 != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", v110);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "groupID");
          v112 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v112)
          {
            -[PUFeedCollectionViewLayout floatPadding](self, "floatPadding");
            v50 = v50 + v113;
            v52 = v114 + v52;
            v54 = v54 - (v113 + v115);
            slice.origin.x = v50;
            slice.origin.y = v52;
            v56 = v56 - (v114 + v116);
            slice.size.width = v54;
            slice.size.height = v56;
          }

        }
      }
      if (!-[PUFeedCollectionViewLayout shouldFloatOverShortDistances](self, "shouldFloatOverShortDistances"))
      {
        v139.origin.x = v50;
        v139.origin.y = v52;
        v139.size.width = v54;
        v139.size.height = v56;
        v117 = CGRectGetHeight(v139);
        v140.origin.x = remainder[2];
        v140.origin.y = v37;
        v140.size.width = v120;
        v140.size.height = v40;
        v118 = CGRectGetHeight(v140);
        if (v117 < v118 + v118)
          slice.size.height = v40;
      }
      v70 = 150.0;
      goto LABEL_79;
    }
    v70 = 150.0;
  }
  else
  {
    v70 = 0.0;
  }
  v72 = v120;
LABEL_79:
  v83 = v123;
  v82 = v124;
  v84 = v122;
LABEL_33:
  v85 = -[PUFeedCollectionViewLayout shouldFloatWithEase](self, "shouldFloatWithEase", *(_QWORD *)&v120);
  if (v85)
    v86 = v71;
  else
    v86 = 0.0;
  v125 = v86;
  if (v85)
    v87 = v70;
  else
    v87 = 0.0;
  if (v10 && v10 != 3)
  {
    v136.origin.x = remainder[0];
    v136.origin.y = v84;
    v136.size.width = v83;
    v136.size.height = v82;
    MinX = CGRectGetMinX(v136);
  }
  else
  {
    v135.origin.x = remainder[0];
    v135.origin.y = v84;
    v135.size.width = v83;
    v135.size.height = v82;
    MinX = CGRectGetMinY(v135);
  }
  v89 = MinX;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "scale");
  v92 = v91;

  if (v10 != 3 && v10)
  {
    v97 = CGRectGetMinX(slice);
    v98 = CGRectGetMaxX(slice);
    v138.size.height = remainder[1];
    v138.origin.x = remainder[2];
    v138.origin.y = v37;
    v138.size.width = v72;
    v99 = v72;
    v100 = v98 - CGRectGetWidth(v138);
    -[PUFeedCollectionViewLayout floatPadding](self, "floatPadding");
    if (v97 < v101)
      v97 = v101;
    -[PUFeedCollectionViewLayout collectionViewContentSize](self, "collectionViewContentSize");
    v103 = v102;
    -[PUFeedCollectionViewLayout floatPadding](self, "floatPadding");
    v105 = v103 - v104;
    if (v100 < v103 - v104)
      v105 = v100;
    if (v105 >= v97)
      v106 = v105;
    else
      v106 = v97;
    remainder[2] = round(v92 * PUClampValueWithEase(v89, v97, v106, v87, v125)) / v92;
    v107 = CGRectGetWidth(slice);
    if (v99 >= v107)
      v72 = v107;
    else
      v72 = v99;
    v96 = 1.0;
  }
  else
  {
    MinY = CGRectGetMinY(slice);
    MaxY = CGRectGetMaxY(slice);
    v137.size.height = remainder[1];
    v137.origin.x = remainder[2];
    v137.origin.y = v37;
    v137.size.width = v72;
    v95 = CGRectGetHeight(v137);
    v37 = round(v92 * PUClampValueWithEase(v89, MinY, MaxY - v95, v87, v125)) / v92;
    v96 = 1.0;
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("PUFeedCollectionElementKindSectionHeaderBackground")))v96 = (v37 - CGRectGetMinY(slice)) / 20.0;
  }
  objc_msgSend(v6, "setFrame:", remainder[2], v37, v72, remainder[1]);
  objc_msgSend(v6, "setAlpha:", v96);

}

- (void)_enumerateSectionsInRect:(CGRect)a3 withBlock:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void (**v9)(id, unint64_t, void *, _BYTE *);
  unint64_t v10;
  NSMutableArray *sectionLayoutInfos;
  BOOL v12;
  char v13;
  unint64_t i;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double MaxX;
  double MinX;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double MinY;
  double MaxY;
  char v32;
  _QWORD v33[9];
  char v34;
  BOOL v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (void (**)(id, unint64_t, void *, _BYTE *))a4;
  v10 = -[PUFeedCollectionViewLayout flowDirection](self, "flowDirection");
  sectionLayoutInfos = self->_sectionLayoutInfos;
  if (v10)
    v12 = v10 == 3;
  else
    v12 = 1;
  v13 = v12;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __65__PUFeedCollectionViewLayout__enumerateSectionsInRect_withBlock___block_invoke;
  v33[3] = &unk_1E589E928;
  v33[4] = self;
  v34 = v13;
  v35 = v10 < 2;
  *(CGFloat *)&v33[5] = x;
  *(CGFloat *)&v33[6] = y;
  *(CGFloat *)&v33[7] = width;
  *(CGFloat *)&v33[8] = height;
  for (i = -[NSMutableArray pl_indexOfFirstObjectPassingTest:](sectionLayoutInfos, "pl_indexOfFirstObjectPassingTest:", v33); i < -[NSMutableArray count](self->_sectionLayoutInfos, "count"); ++i)
  {
    -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", i);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "isHidden") & 1) != 0)
      goto LABEL_24;
    objc_msgSend(v15, "frame");
    v16 = v36.origin.x;
    v17 = v36.origin.y;
    v18 = v36.size.width;
    v19 = v36.size.height;
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    if (CGRectIntersectsRect(v36, v41))
    {
      v32 = 0;
      v9[2](v9, i, v15, &v32);
      if (v32)
        goto LABEL_25;
      goto LABEL_24;
    }
    if (v10 != 3 && v10)
    {
      v26 = v16;
      v27 = v17;
      v28 = v18;
      v29 = v19;
      if (v10 <= 1)
      {
        MaxX = CGRectGetMaxX(*(CGRect *)&v26);
        v38.origin.x = x;
        v38.origin.y = y;
        v38.size.width = width;
        v38.size.height = height;
        MinX = CGRectGetMinX(v38);
LABEL_19:
        if (MaxX < MinX)
          goto LABEL_25;
        goto LABEL_24;
      }
      MinY = CGRectGetMinX(*(CGRect *)&v26);
      v40.origin.x = x;
      v40.origin.y = y;
      v40.size.width = width;
      v40.size.height = height;
      MaxY = CGRectGetMaxX(v40);
    }
    else
    {
      v20 = v16;
      v21 = v17;
      v22 = v18;
      v23 = v19;
      if (v10 <= 1)
      {
        MaxX = CGRectGetMaxY(*(CGRect *)&v20);
        v37.origin.x = x;
        v37.origin.y = y;
        v37.size.width = width;
        v37.size.height = height;
        MinX = CGRectGetMinY(v37);
        goto LABEL_19;
      }
      MinY = CGRectGetMinY(*(CGRect *)&v20);
      v39.origin.x = x;
      v39.origin.y = y;
      v39.size.width = width;
      v39.size.height = height;
      MaxY = CGRectGetMaxY(v39);
    }
    if (MinY > MaxY)
    {
LABEL_25:

      break;
    }
LABEL_24:

  }
}

- (void)_getSize:(CGSize *)a3 headerSize:(CGSize *)a4 footerSize:(CGSize *)a5 fixedLayoutAttributes:(id)a6 tileLayoutAttributes:(id)a7 floatingLayoutAttributes:(id)a8 type:(int64_t *)a9 forSection:(int64_t)a10 isJoined:(BOOL)a11
{
  id v17;
  id v18;
  int64_t v19;
  uint64_t v20;
  id v21;

  v21 = a6;
  v17 = a7;
  v18 = a8;
  v19 = -[PUFeedCollectionViewLayout flowDirection](self, "flowDirection");
  if (v19 != 3 && v19)
  {
    LOBYTE(v20) = a11;
    -[PUFeedCollectionViewLayout _getSizeForHorizontalFlowDirection:headerSize:footerSize:fixedLayoutAttributes:tileLayoutAttributes:floatingLayoutAttributes:type:forSection:isJoined:](self, "_getSizeForHorizontalFlowDirection:headerSize:footerSize:fixedLayoutAttributes:tileLayoutAttributes:floatingLayoutAttributes:type:forSection:isJoined:", a3, a4, a5, v21, v17, v18, a9, a10, v20);
  }
  else
  {
    LOBYTE(v20) = a11;
    -[PUFeedCollectionViewLayout _getSizeForVerticalFlowDirection:headerSize:footerSize:fixedLayoutAttributes:tileLayoutAttributes:floatingLayoutAttributes:type:forSection:isJoined:](self, "_getSizeForVerticalFlowDirection:headerSize:footerSize:fixedLayoutAttributes:tileLayoutAttributes:floatingLayoutAttributes:type:forSection:isJoined:", a3, a4, a5, v21, v17, v18, a9, a10, v20);
  }

}

- (void)_getSizeForVerticalFlowDirection:(CGSize *)a3 headerSize:(CGSize *)a4 footerSize:(CGSize *)a5 fixedLayoutAttributes:(id)a6 tileLayoutAttributes:(id)a7 floatingLayoutAttributes:(id)a8 type:(int64_t *)a9 forSection:(int64_t)a10 isJoined:(BOOL)a11
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  CGFloat width;
  CGFloat height;
  double v21;
  CGFloat x;
  CGFloat y;
  double MaxX;
  double MaxY;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  int64_t v35;
  void *v36;
  uint64_t v37;
  double v38;
  int64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  uint64_t v50;
  unint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  unint64_t v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGFloat v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  BOOL IsEmpty;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  int64_t v90;
  void *v91;
  double v92;
  double v93;
  CGFloat v94;
  double v95;
  double v96;
  double v97;
  double v98;
  uint64_t v99;
  id v100;
  id v101;
  double v102;
  double v103;
  double v104;
  void *v108;
  double v109;
  double v110;
  void *v111;
  CGFloat rect;
  double v113;
  _BYTE v114[56];
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  __int128 v120;
  CGSize v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;

  v14 = a6;
  v15 = a7;
  v16 = a8;
  -[PUFeedCollectionViewLayout collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedCollectionViewLayout _delegate](self, "_delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = (CGSize)*MEMORY[0x1E0C9D820];
  v120 = *MEMORY[0x1E0C9D538];
  v111 = v14;
  if (a11)
  {
    width = *MEMORY[0x1E0C9D820];
    height = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v21 = *((double *)&v120 + 1);
  }
  else
  {
    -[PUFeedCollectionViewLayout _layoutVerticalSectionHeaderIfNecessary:fixedLayoutAttributes:floatingLayoutAttributes:section:](self, "_layoutVerticalSectionHeaderIfNecessary:fixedLayoutAttributes:floatingLayoutAttributes:section:", v17, v14, v16, a10);
    x = v122.origin.x;
    y = v122.origin.y;
    width = v122.size.width;
    height = v122.size.height;
    MaxX = CGRectGetMaxX(v122);
    if (v121.width >= MaxX)
      MaxX = v121.width;
    v121.width = MaxX;
    v123.origin.x = x;
    v123.origin.y = y;
    v123.size.width = width;
    v123.size.height = height;
    MaxY = CGRectGetMaxY(v123);
    if (v121.height >= MaxY)
      MaxY = v121.height;
    v121.height = MaxY;
    v124.origin.x = x;
    v124.origin.y = y;
    v124.size.width = width;
    v124.size.height = height;
    v21 = CGRectGetMaxY(v124);
  }
  objc_msgSend(v18, "collectionView:layout:contentInsetsForSection:", v17, self, a10);
  v27 = v26;
  v104 = v28;
  v30 = v29;
  v31 = *(double *)&v120 + v26;
  v33 = v32 + v21;
  *(double *)&v120 = *(double *)&v120 + v26;
  *((double *)&v120 + 1) = v32 + v21;
  -[PUFeedCollectionViewLayout sectionReferenceSize](self, "sectionReferenceSize");
  v113 = v34 - (v27 + v30);
  v35 = objc_msgSend(v18, "collectionView:layout:typeForSection:", v17, self, a10);
  objc_msgSend(v17, "dataSource");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "collectionView:numberOfItemsInSection:", v17, a10);

  if (v35 == 2)
  {
    v102 = height;
    v103 = width;
    objc_msgSend(v18, "collectionView:layout:sizeForThumbnailInSection:", v17, self, a10);
    if (v37 >= 1)
    {
      v42 = v40;
      v43 = v41;
      v99 = 2;
      v101 = v15;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a10);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("PUFeedCollectionElementKindThumbnail"), v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setFrame:", v31, v33, v42, v43);
      objc_msgSend(v45, "setZIndex:", -1);
      v100 = v16;
      if (-[PUFeedCollectionViewLayout shouldFloatThumbnails](self, "shouldFloatThumbnails"))
        v46 = v16;
      else
        v46 = v111;
      objc_msgSend(v46, "addObject:", v45);
      v125.origin.x = v31;
      v125.origin.y = v33;
      v125.size.width = v42;
      v125.size.height = v43;
      v47 = CGRectGetMaxX(v125);
      if (v121.width >= v47)
        v47 = v121.width;
      v121.width = v47;
      v126.origin.x = v31;
      v126.origin.y = v33;
      v126.size.width = v42;
      v126.size.height = v43;
      v48 = CGRectGetMaxY(v126);
      if (v121.height >= v48)
        v48 = v121.height;
      v121.height = v48;

      *(double *)v114 = v31;
      v49 = v33;
      goto LABEL_23;
    }
    v39 = 0;
LABEL_54:
    v38 = v104;
    goto LABEL_55;
  }
  if (v35 == 1)
  {
    if (v37 >= 1)
    {
      v99 = 1;
      v100 = v16;
      v102 = height;
      v103 = width;
      v101 = v15;
      v49 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      *(_QWORD *)v114 = *MEMORY[0x1E0C9D648];
      v42 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v43 = *(double *)(MEMORY[0x1E0C9D648] + 24);
LABEL_23:
      v50 = 0;
      v51 = 0x1E0CB3000uLL;
      v52 = v111;
      rect = v42;
      v108 = v17;
      do
      {
        objc_msgSend(*(id *)(v51 + 1712), "indexPathForItem:inSection:", v50, a10);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (v50)
        {
          objc_msgSend(*(id *)(v51 + 1712), "indexPathForItem:inSection:", v50 - 1, a10);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            memset(&v114[8], 0, 48);
            objc_msgSend(v18, "collectionView:layout:metricsForSeparatorBetweenRowAtIndexPath:andRowAtIndexPath:proposedMetrics:", v17, self, v54, v53, &v114[8]);
            v55 = v115;
            if (v115 <= 0.0)
            {
              if (v115 < 0.0)
              {
                v33 = v115 + v33;
                *((double *)&v120 + 1) = v33;
              }
              v42 = rect;
            }
            else
            {
              v56 = v51;
              v58 = v116;
              v57 = v117;
              v109 = v119;
              v110 = v118;
              objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("PUFeedCollectionElementKindSeparator"), v53);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              -[PUFeedCollectionViewLayout sectionReferenceSize](self, "sectionReferenceSize");
              v61 = v60;
              v127.origin.x = *(CGFloat *)v114;
              v127.origin.y = v49;
              v127.size.width = rect;
              v127.size.height = v43;
              if (!CGRectIsEmpty(v127))
              {
                v128.origin.x = *(CGFloat *)v114;
                v128.origin.y = v49;
                v128.size.width = rect;
                v128.size.height = v43;
                v62 = CGRectGetMaxX(v128);
                -[PUFeedCollectionViewLayout thumbnailSpacing](self, "thumbnailSpacing");
                v31 = v62 + v63;
                *(double *)&v120 = v31;
                v61 = v61 - v31;
              }
              objc_msgSend(v59, "setFrame:", v57 + v31, v58 + v33, v61 - (v57 + v109), v55 - (v58 + v110));
              v52 = v111;
              objc_msgSend(v111, "addObject:", v59);
              v129.origin.x = v31;
              v129.origin.y = v33;
              v129.size.width = v61;
              v129.size.height = v55;
              v64 = CGRectGetMaxY(v129);
              *((CGFloat *)&v120 + 1) = v64;
              v65 = v121.width;
              v130.origin.x = v31;
              v130.origin.y = v33;
              v130.size.width = v61;
              v130.size.height = v55;
              v66 = CGRectGetMaxX(v130);
              if (v65 >= v66)
                v66 = v65;
              v121.width = v66;
              v67 = v121.height;
              v131.origin.x = v31;
              v131.origin.y = v33;
              v131.size.width = v61;
              v131.size.height = v55;
              v68 = CGRectGetMaxY(v131);
              if (v67 >= v68)
                v68 = v67;
              v121.height = v68;

              v33 = v64;
              v42 = rect;
              v51 = v56;
              v17 = v108;
            }
          }

        }
        +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:](PUCollectionViewLayoutAttributes, "layoutAttributesForCellWithIndexPath:", v53);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v132.origin.x = *(CGFloat *)v114;
        v132.origin.y = v49;
        v132.size.width = v42;
        v132.size.height = v43;
        IsEmpty = CGRectIsEmpty(v132);
        v71 = v113;
        if (!IsEmpty)
        {
          v133.origin.x = *(CGFloat *)v114;
          v133.origin.y = v49;
          v133.size.width = v42;
          v133.size.height = v43;
          v72 = CGRectGetMaxX(v133);
          -[PUFeedCollectionViewLayout thumbnailSpacing](self, "thumbnailSpacing");
          v31 = v72 + v73;
          *(double *)&v120 = v72 + v73;
          v71 = v113 - (v72 + v73);
        }
        objc_msgSend(v18, "collectionView:layout:sizeForRowAtIndexPath:proposedSize:", v17, self, v53, v71, 0.0);
        v76 = v75;
        v77 = v74;
        if (v37 == 1 && v74 < v43)
        {
          v134.origin.x = *(CGFloat *)v114;
          v134.origin.y = v49;
          v134.size.width = v42;
          v134.size.height = v43;
          v78 = CGRectGetHeight(v134);
          v135.origin.x = v31;
          v135.origin.y = v33;
          v135.size.width = v76;
          v135.size.height = v77;
          v79 = CGRectGetHeight(v135);
          if (PUMainScreenScale_onceToken != -1)
            dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
          v33 = v49
              + round(*(double *)&PUMainScreenScale_screenScale * ((v78 - v79) * 0.5))
              / *(double *)&PUMainScreenScale_screenScale;
        }
        objc_msgSend(v69, "setFrame:", v31, v33, v76, v77);
        objc_msgSend(v52, "addObject:", v69);
        v136.origin.x = v31;
        v136.origin.y = v33;
        v136.size.width = v76;
        v136.size.height = v77;
        v80 = CGRectGetMaxY(v136);
        *((double *)&v120 + 1) = v80;
        v81 = v121.width;
        v137.origin.x = v31;
        v137.origin.y = v33;
        v137.size.width = v76;
        v137.size.height = v77;
        v82 = CGRectGetMaxX(v137);
        if (v81 >= v82)
          v82 = v81;
        v83 = v121.height;
        if (v121.height < v80)
          v83 = v80;
        v121.width = v82;
        v121.height = v83;

        ++v50;
        v33 = v80;
        v42 = rect;
      }
      while (v37 != v50);
      v39 = 0;
      v16 = v100;
      v15 = v101;
      height = v102;
      width = v103;
      v35 = v99;
      goto LABEL_54;
    }
    v39 = 0;
    goto LABEL_54;
  }
  v38 = v104;
  if (v35)
    v39 = 0;
  else
    v39 = -[PUFeedCollectionViewLayout _layoutTilesAndGetNumberOfTilesOmittedWithCollectionView:tileLayoutAttributes:fixedLayoutAttributes:origin:size:sectionContentSize:itemCount:section:](self, "_layoutTilesAndGetNumberOfTilesOmittedWithCollectionView:tileLayoutAttributes:fixedLayoutAttributes:origin:size:sectionContentSize:itemCount:section:", v17, v15, v111, &v120, &v121, v37, v113, 0.0, a10);
LABEL_55:
  -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", a10);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setNumberOfTilesOmitted:", v39);
  objc_msgSend(v18, "collectionView:layout:sizeForFooterInSection:proposedSize:", v17, self, a10, v113, 0.0);
  v86 = v85;
  v88 = v87;
  if (v87 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a10);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("PUFeedCollectionElementKindSectionFooter"), v89);
    v90 = v35;
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFeedCollectionViewLayout sectionReferenceSize](self, "sectionReferenceSize");
    v93 = v92 - v86;
    v94 = v121.height;
    objc_msgSend(v91, "setFrame:", v92 - v86, v121.height, v86, v88);
    objc_msgSend(v111, "addObject:", v91);
    v95 = v121.width;
    v138.origin.x = v93;
    v138.origin.y = v94;
    v138.size.width = v86;
    v138.size.height = v88;
    v96 = CGRectGetMaxX(v138);
    if (v95 >= v96)
      v96 = v95;
    v121.width = v96;
    v97 = v121.height;
    v139.origin.x = v93;
    v139.origin.y = v94;
    v139.size.width = v86;
    v139.size.height = v88;
    v98 = CGRectGetMaxY(v139);
    if (v97 >= v98)
      v98 = v97;
    v121.height = v98;

    v35 = v90;
  }
  v121.height = v38 + v121.height;
  if (a3)
    *a3 = v121;
  if (a4)
  {
    a4->width = width;
    a4->height = height;
  }
  if (a5)
  {
    a5->width = v86;
    a5->height = v88;
  }
  if (a9)
    *a9 = v35;

}

- (void)_getSizeForHorizontalFlowDirection:(CGSize *)a3 headerSize:(CGSize *)a4 footerSize:(CGSize *)a5 fixedLayoutAttributes:(id)a6 tileLayoutAttributes:(id)a7 floatingLayoutAttributes:(id)a8 type:(int64_t *)a9 forSection:(int64_t)a10 isJoined:(BOOL)a11
{
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  void *v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  void (**v55)(_QWORD);
  double height;
  double v57;
  double MaxY;
  int64_t v59;
  void *v60;
  uint64_t v61;
  int64_t v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  CGSize *v74;
  double v75;
  double v76;
  uint64_t v77;
  id v78;
  id v79;
  uint64_t v80;
  double v84;
  id v85;
  id v86;
  id v87;
  id v88;
  _QWORD v89[4];
  id v90;
  id v91;
  PUFeedCollectionViewLayout *v92;
  id v93;
  uint64_t *v94;
  uint64_t *v95;
  int64_t v96;
  uint64_t v97;
  CGFloat v98;
  double v99;
  _QWORD aBlock[4];
  id v101;
  PUFeedCollectionViewLayout *v102;
  id v103;
  id v104;
  uint64_t v105;
  double *v106;
  uint64_t v107;
  void *v108;
  __int128 v109;
  uint64_t v110;
  CGSize *v111;
  uint64_t v112;
  void *v113;
  __int128 v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;

  v87 = a6;
  v85 = a7;
  v14 = a8;
  -[PUFeedCollectionViewLayout collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedCollectionViewLayout _delegate](self, "_delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (double *)MEMORY[0x1E0C9D820];
  v110 = 0;
  v111 = (CGSize *)&v110;
  v112 = 0x3010000000;
  v113 = &unk_1AB197D4B;
  v114 = *MEMORY[0x1E0C9D820];
  v105 = 0;
  v106 = (double *)&v105;
  v107 = 0x3010000000;
  v108 = &unk_1AB197D4B;
  v109 = *MEMORY[0x1E0C9D538];
  objc_msgSend(v16, "collectionView:layout:contentInsetsForSection:", v15, self, a10);
  v84 = v19;
  v21 = v20;
  v23 = v22;
  v24 = v106;
  v25 = v106[5];
  v106[4] = v26 + v106[4];
  v24[5] = v20 + v25;
  -[PUFeedCollectionViewLayout sectionReferenceSize](self, "sectionReferenceSize");
  v28 = v27;
  if (-[PUFeedCollectionViewLayout shouldFloatSectionHeaders](self, "shouldFloatSectionHeaders"))
  {
    v29 = 1.79769313e308;
  }
  else
  {
    -[PUFeedCollectionViewLayout sectionReferenceSize](self, "sectionReferenceSize");
    v29 = v30;
  }
  v31 = objc_msgSend(v16, "collectionView:layout:configurationForSectionHeaderType:", v15, self, 1);
  v32 = *v18;
  v33 = v18[1];
  v34 = v28 - (v21 + v23);
  if (v31)
  {
    objc_msgSend(v16, "collectionView:layout:groupIDForSection:", v15, self, a10);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "collectionView:layout:headerSizeForGroupID:proposedSize:", v15, self, v35, v29, 0.0);
    v76 = v36;
    v38 = v37;
    v34 = v34 - v37;
  }
  else
  {
    v35 = 0;
    v38 = v33;
    v76 = v32;
  }
  v39 = objc_msgSend(v16, "collectionView:layout:configurationForSectionHeaderType:", v15, self, 2);
  if (v39)
  {
    -[PUFeedCollectionViewLayout sectionsJoinedWithSection:](self, "sectionsJoinedWithSection:", a10);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "collectionView:layout:sizeForHeaderOfSections:proposedSize:", v15, self, v40, v29, 0.0);
    v42 = v41;
    v44 = v43;

    if (v39 == 3)
      v45 = 0.0;
    else
      v45 = v44;
    v34 = v34 - v45;
  }
  else
  {
    v44 = v33;
    v42 = v32;
  }
  v77 = objc_msgSend(v16, "collectionView:layout:configurationForSectionHeaderType:", v15, self, 5);
  if (v77)
  {
    objc_msgSend(v16, "collectionView:layout:captionSizeForTileAtIndexPath:proposedSize:", v15, self, v17, v29, 0.0);
    v75 = v46;
    v48 = v47;
    v34 = v34 - v47;
  }
  else
  {
    v48 = v33;
    v75 = v32;
  }
  v80 = objc_msgSend(v16, "collectionView:layout:configurationForSectionHeaderType:", v15, self, 6);
  if (v80)
  {
    objc_msgSend(v16, "collectionView:layout:sizeForFooterInSection:proposedSize:", v15, self, a10, v29, 0.0);
    v32 = v49;
    v33 = v50;
    v34 = v34 - v50;
  }
  v51 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __180__PUFeedCollectionViewLayout__getSizeForHorizontalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke;
  aBlock[3] = &unk_1E589E950;
  v78 = v17;
  v101 = v78;
  v102 = self;
  v79 = v14;
  v103 = v79;
  v86 = v87;
  v104 = v86;
  v52 = _Block_copy(aBlock);
  v89[0] = v51;
  v89[1] = 3221225472;
  v89[2] = __180__PUFeedCollectionViewLayout__getSizeForHorizontalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke_2;
  v89[3] = &unk_1E589E978;
  v88 = v16;
  v90 = v88;
  v53 = v15;
  v91 = v53;
  v92 = self;
  v96 = a10;
  v54 = v52;
  v93 = v54;
  v94 = &v105;
  v98 = v42;
  v99 = v44;
  v97 = v39;
  v95 = &v110;
  v55 = (void (**)(_QWORD))_Block_copy(v89);
  if (a11)
  {
    if (v39 != 3)
      v106[5] = v44 + v106[5];
  }
  else
  {
    if (v31 == 1)
    {
      v115.origin.x = (*((double (**)(id, uint64_t, const __CFString *, double, double, double, double))v54 + 2))(v54, 1, CFSTR("PUFeedCollectionElementKindSectionGroupHeader"), v106[4], v106[5], v76, v38);
      height = v115.size.height;
      v57 = v111[2].height;
      MaxY = CGRectGetMaxY(v115);
      if (v57 >= MaxY)
        MaxY = v57;
      v111[2].height = MaxY;
      v106[5] = height + v106[5];
    }
    if (v39 == 1)
      v55[2](v55);
  }
  v59 = objc_msgSend(v88, "collectionView:layout:typeForSection:", v53, self, a10);
  objc_msgSend(v53, "dataSource");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "collectionView:numberOfItemsInSection:", v53, a10);

  if (v59)
  {
    v62 = 0;
    v63 = v85;
  }
  else
  {
    v63 = v85;
    v62 = -[PUFeedCollectionViewLayout _layoutTilesAndGetNumberOfTilesOmittedWithCollectionView:tileLayoutAttributes:fixedLayoutAttributes:origin:size:sectionContentSize:itemCount:section:](self, "_layoutTilesAndGetNumberOfTilesOmittedWithCollectionView:tileLayoutAttributes:fixedLayoutAttributes:origin:size:sectionContentSize:itemCount:section:", v53, v85, v86, v106 + 4, &v111[2], v61, 0.0, v34, a10);
  }
  v106[5] = v34 + v106[5];
  -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", a10);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setNumberOfTilesOmitted:", v62);
  if (!a11)
  {
    if (v39 == 3)
    {
      v106[5] = v106[5] - v44;
      v55[2](v55);
      v106[5] = v44 + v106[5];
    }
    if (v77 == 2)
    {
      v116.origin.x = (*((double (**)(id, uint64_t, const __CFString *, double, double, double, double))v54 + 2))(v54, 2, CFSTR("PUFeedCollectionElementKindCaption"), v106[4], v106[5], v75, v48);
      v65 = v116.size.height;
      v66 = v111[2].height;
      v67 = CGRectGetMaxY(v116);
      if (v66 >= v67)
        v67 = v66;
      v111[2].height = v67;
      v106[5] = v65 + v106[5];
    }
    if (v80 == 2)
    {
      v117.origin.x = (*((double (**)(id, uint64_t, const __CFString *, double, double, double, double))v54 + 2))(v54, 2, CFSTR("PUFeedCollectionElementKindCaption"), v106[4], v106[5], v32, v33);
      v68 = v117.size.height;
      v69 = v111[2].height;
      v70 = CGRectGetMaxY(v117);
      if (v69 >= v70)
        v70 = v69;
      v111[2].height = v70;
      v106[5] = v68 + v106[5];
    }
  }
  v111[2].width = v84 + v111[2].width;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "scale");
  v73 = v72;

  v74 = v111 + 2;
  v111[2].width = round(v73 * v111[2].width) / v73;
  if (a3)
    *a3 = *v74;
  if (a4)
  {
    a4->width = v42;
    a4->height = v44;
  }
  if (a5)
  {
    a5->width = v32;
    a5->height = v33;
  }
  if (a9)
    *a9 = v59;

  _Block_object_dispose(&v105, 8);
  _Block_object_dispose(&v110, 8);

}

- (CGRect)_layoutVerticalSectionHeaderIfNecessary:(id)a3 fixedLayoutAttributes:(id)a4 floatingLayoutAttributes:(id)a5 section:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect result;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[PUFeedCollectionViewLayout _delegate](self, "_delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "collectionView:layout:shouldHideHeaderInSection:", v10, self, a6) & 1) != 0)
  {
    v14 = *MEMORY[0x1E0C9D648];
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    -[PUFeedCollectionViewLayout sectionReferenceSize](self, "sectionReferenceSize");
    v19 = v18;
    -[PUFeedCollectionViewLayout sectionsJoinedWithSection:](self, "sectionsJoinedWithSection:", a6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collectionView:layout:sizeForHeaderOfSections:proposedSize:", v10, self, v20, v19, 0.0);
    v16 = v21;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("PUFeedCollectionElementKindSectionHeader"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0C9D538];
    v15 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[PUFeedCollectionViewLayout sectionReferenceSize](self, "sectionReferenceSize");
    v17 = v24;
    objc_msgSend(v23, "setFrame:", v14, v15, v24, v16);
    objc_msgSend(v23, "setZIndex:", 4);
    if (-[PUFeedCollectionViewLayout shouldFloatSectionHeaders](self, "shouldFloatSectionHeaders"))
    {
      objc_msgSend(v12, "addObject:", v23);
      -[PUFeedCollectionViewLayout sectionHeaderBackgroundHeight](self, "sectionHeaderBackgroundHeight");
      if (v25 > 0.0)
      {
        v26 = v25;
        objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("PUFeedCollectionElementKindSectionHeaderBackground"), v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setFrame:", v14, v15, v17, v26);
        objc_msgSend(v27, "setZIndex:", 3);
        objc_msgSend(v12, "addObject:", v27);

      }
    }
    else
    {
      objc_msgSend(v11, "addObject:", v23);
    }

  }
  v28 = v14;
  v29 = v15;
  v30 = v17;
  v31 = v16;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (int64_t)_layoutTilesAndGetNumberOfTilesOmittedWithCollectionView:(id)a3 tileLayoutAttributes:(id)a4 fixedLayoutAttributes:(id)a5 origin:(CGPoint *)a6 size:(CGSize *)a7 sectionContentSize:(CGSize)a8 itemCount:(int64_t)a9 section:(int64_t)a10
{
  double height;
  double width;
  id v16;
  void *v17;
  _BOOL4 v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  double v39;
  double v40;
  id v41;
  id v42;
  uint64_t v43;
  CGSize *v44;
  uint64_t v45;
  id v47;
  id v48;
  int64_t v50;
  id v51;
  _QWORD v54[5];
  id v55;
  id v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t *v60;
  int64_t v61;
  double v62;
  SEL v63;
  uint64_t v64;
  int64_t v65;
  uint64_t v66;
  uint64_t v67;
  CGSize *v68;
  uint64_t v69;
  void *v70;
  CGSize v71;
  uint64_t v72;
  CGPoint *v73;
  uint64_t v74;
  void *v75;
  CGPoint v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  char v86;
  _QWORD v87[4];
  id v88;
  id v89;
  PUFeedCollectionViewLayout *v90;
  int64_t v91;
  _QWORD v92[4];
  id v93;
  id v94;
  PUFeedCollectionViewLayout *v95;
  int64_t v96;
  _QWORD v97[4];
  id v98;
  id v99;
  PUFeedCollectionViewLayout *v100;
  int64_t v101;
  _QWORD v102[4];
  id v103;
  id v104;
  PUFeedCollectionViewLayout *v105;
  int64_t v106;
  _QWORD v107[4];
  id v108;
  id v109;
  PUFeedCollectionViewLayout *v110;
  int64_t v111;
  _QWORD v112[4];
  id v113;
  id v114;
  PUFeedCollectionViewLayout *v115;
  int64_t v116;
  _QWORD v117[4];
  id v118;
  id v119;
  PUFeedCollectionViewLayout *v120;
  int64_t v121;
  _QWORD v122[4];
  id v123;
  id v124;
  PUFeedCollectionViewLayout *v125;
  int64_t v126;
  _QWORD v127[4];
  id v128;
  id v129;
  PUFeedCollectionViewLayout *v130;
  int64_t v131;

  height = a8.height;
  width = a8.width;
  v16 = a3;
  v47 = a4;
  v48 = a5;
  -[PUFeedCollectionViewLayout _delegate](self, "_delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUFeedCollectionViewLayout flowDirection](self, "flowDirection"))
    v18 = -[PUFeedCollectionViewLayout flowDirection](self, "flowDirection") == 3;
  else
    v18 = 1;
  v19 = objc_alloc_init((Class)objc_opt_class());
  v50 = a9;
  objc_msgSend(v19, "setTileCount:", a9);
  v20 = MEMORY[0x1E0C809B0];
  v127[0] = MEMORY[0x1E0C809B0];
  v127[1] = 3221225472;
  v127[2] = __179__PUFeedCollectionViewLayout__layoutTilesAndGetNumberOfTilesOmittedWithCollectionView_tileLayoutAttributes_fixedLayoutAttributes_origin_size_sectionContentSize_itemCount_section___block_invoke;
  v127[3] = &unk_1E589E9A0;
  v131 = a10;
  v21 = v17;
  v128 = v21;
  v22 = v16;
  v129 = v22;
  v130 = self;
  objc_msgSend(v19, "setTileImageSizeBlock:", v127);
  v122[0] = v20;
  v122[1] = 3221225472;
  v122[2] = __179__PUFeedCollectionViewLayout__layoutTilesAndGetNumberOfTilesOmittedWithCollectionView_tileLayoutAttributes_fixedLayoutAttributes_origin_size_sectionContentSize_itemCount_section___block_invoke_2;
  v122[3] = &unk_1E589E9A0;
  v126 = a10;
  v23 = v21;
  v123 = v23;
  v24 = v22;
  v124 = v24;
  v125 = self;
  objc_msgSend(v19, "setTileMinimumSizeBlock:", v122);
  v117[0] = v20;
  v117[1] = 3221225472;
  v117[2] = __179__PUFeedCollectionViewLayout__layoutTilesAndGetNumberOfTilesOmittedWithCollectionView_tileLayoutAttributes_fixedLayoutAttributes_origin_size_sectionContentSize_itemCount_section___block_invoke_3;
  v117[3] = &unk_1E589E9C8;
  v121 = a10;
  v25 = v23;
  v118 = v25;
  v26 = v24;
  v119 = v26;
  v120 = self;
  objc_msgSend(v19, "setTileHasCaptionBlock:", v117);
  v112[0] = v20;
  v112[1] = 3221225472;
  v112[2] = __179__PUFeedCollectionViewLayout__layoutTilesAndGetNumberOfTilesOmittedWithCollectionView_tileLayoutAttributes_fixedLayoutAttributes_origin_size_sectionContentSize_itemCount_section___block_invoke_4;
  v112[3] = &unk_1E589E9F0;
  v116 = a10;
  v27 = v25;
  v113 = v27;
  v28 = v26;
  v114 = v28;
  v115 = self;
  objc_msgSend(v19, "setTileCaptionSizeBlock:", v112);
  v107[0] = v20;
  v107[1] = 3221225472;
  v107[2] = __179__PUFeedCollectionViewLayout__layoutTilesAndGetNumberOfTilesOmittedWithCollectionView_tileLayoutAttributes_fixedLayoutAttributes_origin_size_sectionContentSize_itemCount_section___block_invoke_5;
  v107[3] = &unk_1E589E9C8;
  v111 = a10;
  v29 = v27;
  v108 = v29;
  v30 = v28;
  v109 = v30;
  v110 = self;
  objc_msgSend(v19, "setTileHasLikesBlock:", v107);
  v102[0] = v20;
  v102[1] = 3221225472;
  v102[2] = __179__PUFeedCollectionViewLayout__layoutTilesAndGetNumberOfTilesOmittedWithCollectionView_tileLayoutAttributes_fixedLayoutAttributes_origin_size_sectionContentSize_itemCount_section___block_invoke_6;
  v102[3] = &unk_1E589E9F0;
  v106 = a10;
  v31 = v29;
  v103 = v31;
  v32 = v30;
  v104 = v32;
  v105 = self;
  objc_msgSend(v19, "setTileLikesSizeBlock:", v102);
  v97[0] = v20;
  v97[1] = 3221225472;
  v97[2] = __179__PUFeedCollectionViewLayout__layoutTilesAndGetNumberOfTilesOmittedWithCollectionView_tileLayoutAttributes_fixedLayoutAttributes_origin_size_sectionContentSize_itemCount_section___block_invoke_7;
  v97[3] = &unk_1E589EA18;
  v101 = a10;
  v33 = v31;
  v98 = v33;
  v34 = v32;
  v99 = v34;
  v100 = self;
  objc_msgSend(v19, "setTileCommentCountBlock:", v97);
  v92[0] = v20;
  v92[1] = 3221225472;
  v92[2] = __179__PUFeedCollectionViewLayout__layoutTilesAndGetNumberOfTilesOmittedWithCollectionView_tileLayoutAttributes_fixedLayoutAttributes_origin_size_sectionContentSize_itemCount_section___block_invoke_8;
  v92[3] = &unk_1E589EA40;
  v96 = a10;
  v35 = v33;
  v93 = v35;
  v36 = v34;
  v94 = v36;
  v95 = self;
  objc_msgSend(v19, "setTileCommentSizeBlock:", v92);
  v87[0] = v20;
  v87[1] = 3221225472;
  v87[2] = __179__PUFeedCollectionViewLayout__layoutTilesAndGetNumberOfTilesOmittedWithCollectionView_tileLayoutAttributes_fixedLayoutAttributes_origin_size_sectionContentSize_itemCount_section___block_invoke_9;
  v87[3] = &unk_1E589EA68;
  v91 = a10;
  v37 = v35;
  v88 = v37;
  v51 = v36;
  v89 = v51;
  v90 = self;
  objc_msgSend(v19, "setTileBatchIDBlock:", v87);
  -[PUFeedCollectionViewLayout interTileSpacing](self, "interTileSpacing");
  objc_msgSend(v19, "setInterTileSpacing:");
  -[PUFeedCollectionViewLayout captionPadding](self, "captionPadding");
  objc_msgSend(v19, "setCaptionPadding:");
  -[PUFeedCollectionViewLayout noCaptionSpacing](self, "noCaptionSpacing");
  objc_msgSend(v19, "setNoCaptionSpacing:");
  objc_msgSend(v19, "setNumberOfMagneticGuidelines:", 5);
  objc_msgSend(v19, "setRoundingScale:", 1.0);
  if (v18)
  {
    objc_msgSend(v19, "setShouldDisplayCaptionsBelowBatches:", -[PUFeedCollectionViewLayout shouldDisplayCaptionsBelowBatches](self, "shouldDisplayCaptionsBelowBatches"));
    objc_msgSend(v19, "setReferenceWidth:", width);
  }
  else
  {
    objc_msgSend(v19, "setReferenceHeight:", height);
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "scale");
  v40 = v39;

  v83 = 0;
  v84 = &v83;
  v85 = 0x2020000000;
  v86 = 0;
  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = -1;
  v77 = 0;
  v78 = 0;
  v72 = 0;
  v73 = (CGPoint *)&v72;
  v74 = 0x3010000000;
  v75 = &unk_1AB197D4B;
  v76 = *a6;
  v67 = 0;
  v68 = (CGSize *)&v67;
  v69 = 0x3010000000;
  v70 = &unk_1AB197D4B;
  v71 = *a7;
  objc_msgSend(v37, "collectionView:layout:referenceMaximumLength:minimumNumberOfTilesToOmit:forSection:", v51, self, &v78, &v77, a10);
  v54[0] = v20;
  v54[1] = 3221225472;
  v54[2] = __179__PUFeedCollectionViewLayout__layoutTilesAndGetNumberOfTilesOmittedWithCollectionView_tileLayoutAttributes_fixedLayoutAttributes_origin_size_sectionContentSize_itemCount_section___block_invoke_10;
  v54[3] = &unk_1E589EA90;
  v61 = a10;
  v54[4] = self;
  v41 = v47;
  v55 = v41;
  v57 = &v83;
  v58 = &v72;
  v62 = v40;
  v63 = a2;
  v42 = v48;
  v56 = v42;
  v59 = &v67;
  v60 = &v79;
  v64 = v78;
  v65 = v50;
  v66 = v77;
  objc_msgSend(v19, "enumerateFramesWithBlock:", v54);
  v43 = v80[3];
  if (*((_BYTE *)v84 + 24))
    objc_msgSend(v41, "sortUsingComparator:", &__block_literal_global_26033);
  v44 = v68;
  v45 = 32;
  if (v18)
    v45 = 40;
  *(double *)((char *)&v68->width + v45) = round(v40 * *(double *)((char *)&v68->width + v45)) / v40;
  *a6 = v73[2];
  *a7 = v44[2];

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v83, 8);

  return ~v43 + v50;
}

- (void)updateCollectionViewWithDeletedSections:(id)a3 insertedSections:(id)a4 updatedSections:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  BOOL v12;
  char v13;
  BOOL v14;
  __int128 v15;
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
  double v30;
  double v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  _BOOL8 v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double MinX;
  double v57;
  double MinY;
  double v59;
  id v60;
  _QWORD v61[5];
  _QWORD v62[4];
  id v63;
  PUFeedCollectionViewLayout *v64;
  id v65;
  _QWORD v66[5];
  char v67;
  BOOL v68;
  _QWORD v69[5];
  _QWORD v70[5];
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  PUFeedCollectionViewLayout *v75;
  uint64_t *v76;
  uint64_t *v77;
  uint64_t v78;
  CGRect *v79;
  uint64_t v80;
  void *v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  CGRect v88;
  CGRect v89;

  v8 = a3;
  v9 = a4;
  v60 = a5;
  -[PUFeedCollectionViewLayout collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PUFeedCollectionViewLayout flowDirection](self, "flowDirection");
  if (v11)
    v12 = v11 == 3;
  else
    v12 = 1;
  v13 = v12;
  v14 = v11 < 2;
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v87 = 0x7FFFFFFFFFFFFFFFLL;
  v78 = 0;
  v79 = (CGRect *)&v78;
  v80 = 0x4010000000;
  v81 = &unk_1AB197D4B;
  v15 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v82 = *MEMORY[0x1E0C9D628];
  v83 = v15;
  objc_msgSend(v10, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  objc_msgSend(v10, "adjustedContentInset");
  v25 = v17 + v24;
  v27 = v19 + v26;
  v29 = v21 - (v24 + v28);
  v31 = v23 - (v26 + v30);
  v32 = MEMORY[0x1E0C809B0];
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __103__PUFeedCollectionViewLayout_updateCollectionViewWithDeletedSections_insertedSections_updatedSections___block_invoke;
  v72[3] = &unk_1E589EAD8;
  v33 = v8;
  v73 = v33;
  v76 = &v84;
  v77 = &v78;
  v34 = v10;
  v74 = v34;
  v75 = self;
  -[PUFeedCollectionViewLayout _enumerateSectionsInRect:withBlock:](self, "_enumerateSectionsInRect:withBlock:", v72, v25, v27, v29, v31);
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v70[0] = v32;
  v70[1] = 3221225472;
  v70[2] = __103__PUFeedCollectionViewLayout_updateCollectionViewWithDeletedSections_insertedSections_updatedSections___block_invoke_2;
  v70[3] = &unk_1E58A7D80;
  v70[4] = self;
  v35 = (id)objc_claimAutoreleasedReturnValue();
  v71 = v35;
  objc_msgSend(v33, "enumerateIndexesUsingBlock:", v70);
  v69[0] = v32;
  v69[1] = 3221225472;
  v69[2] = __103__PUFeedCollectionViewLayout_updateCollectionViewWithDeletedSections_insertedSections_updatedSections___block_invoke_3;
  v69[3] = &unk_1E58A85F8;
  v69[4] = self;
  objc_msgSend(v33, "enumerateIndexesWithOptions:usingBlock:", 2, v69);
  objc_msgSend(v35, "pl_adjustIndexesForDeletions:", v33);
  objc_msgSend(v35, "pl_adjustIndexesForInsertions:", v9);
  v66[0] = v32;
  v66[1] = 3221225472;
  v66[2] = __103__PUFeedCollectionViewLayout_updateCollectionViewWithDeletedSections_insertedSections_updatedSections___block_invoke_4;
  v66[3] = &unk_1E589EB00;
  v66[4] = self;
  v67 = v13;
  v68 = v14;
  objc_msgSend(v9, "enumerateIndexesUsingBlock:", v66);
  v36 = objc_msgSend(v33, "count") || objc_msgSend(v9, "count");
  v65 = 0;
  -[PUFeedCollectionViewLayout _updateGlobalLayoutInfoWithOptions:sectionsWithUpdatedGroupIDs:](self, "_updateGlobalLayoutInfoWithOptions:sectionsWithUpdatedGroupIDs:", v36, &v65);
  v37 = v65;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addIndexes:", v9);
  objc_msgSend(v38, "addIndexes:", v60);
  v62[0] = v32;
  v62[1] = 3221225472;
  v62[2] = __103__PUFeedCollectionViewLayout_updateCollectionViewWithDeletedSections_insertedSections_updatedSections___block_invoke_5;
  v62[3] = &unk_1E58A7D80;
  v39 = v35;
  v63 = v39;
  v64 = self;
  objc_msgSend(v38, "enumerateIndexesUsingBlock:", v62);
  objc_msgSend(v39, "addIndexes:", v37);
  v61[0] = v32;
  v61[1] = 3221225472;
  v61[2] = __103__PUFeedCollectionViewLayout_updateCollectionViewWithDeletedSections_insertedSections_updatedSections___block_invoke_6;
  v61[3] = &unk_1E58A85F8;
  v61[4] = self;
  objc_msgSend(v39, "enumerateIndexesUsingBlock:", v61);
  -[PUFeedCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  objc_msgSend(v34, "reloadData");
  if (v85[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "pl_indexSetAdjustedForDeletions:", v33);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "pl_indexSetAdjustedForInsertions:", v9);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = objc_msgSend(v42, "firstIndex");
    objc_msgSend(v34, "layoutIfNeeded");
    -[PUFeedCollectionViewLayout frameForSection:](self, "frameForSection:", v43);
    objc_msgSend(v34, "pu_displayFrameForRect:");
    v45 = v44;
    v47 = v46;
    v49 = v48;
    v51 = v50;
    objc_msgSend(v34, "contentOffset");
    v53 = v52;
    v55 = v54;
    v88.origin.x = v45;
    v88.origin.y = v47;
    v88.size.width = v49;
    v88.size.height = v51;
    MinX = CGRectGetMinX(v88);
    v57 = CGRectGetMinX(v79[1]);
    v89.origin.x = v45;
    v89.origin.y = v47;
    v89.size.width = v49;
    v89.size.height = v51;
    MinY = CGRectGetMinY(v89);
    v59 = v55 + MinY - CGRectGetMinY(v79[1]);
    if (v53 + MinX - v57 != v53 || v59 != v55)
      objc_msgSend(v34, "px_scrollToContentOffset:animated:", 0);

  }
  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v84, 8);

}

- (int64_t)flowDirection
{
  return self->_flowDirection;
}

- (CGSize)sectionReferenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_sectionReferenceSize.width;
  height = self->_sectionReferenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSectionReferenceSize:(CGSize)a3
{
  self->_sectionReferenceSize = a3;
}

- (CGSize)interTileSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_interTileSpacing.width;
  height = self->_interTileSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setInterTileSpacing:(CGSize)a3
{
  self->_interTileSpacing = a3;
}

- (UIEdgeInsets)captionPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_captionPadding.top;
  left = self->_captionPadding.left;
  bottom = self->_captionPadding.bottom;
  right = self->_captionPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setCaptionPadding:(UIEdgeInsets)a3
{
  self->_captionPadding = a3;
}

- (CGSize)noCaptionSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_noCaptionSpacing.width;
  height = self->_noCaptionSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setNoCaptionSpacing:(CGSize)a3
{
  self->_noCaptionSpacing = a3;
}

- (BOOL)shouldDisplayCaptionsBelowBatches
{
  return self->_shouldDisplayCaptionsBelowBatches;
}

- (void)setShouldDisplayCaptionsBelowBatches:(BOOL)a3
{
  self->_shouldDisplayCaptionsBelowBatches = a3;
}

- (BOOL)shouldApplyParallaxEffect
{
  return self->_shouldApplyParallaxEffect;
}

- (void)setShouldApplyParallaxEffect:(BOOL)a3
{
  self->_shouldApplyParallaxEffect = a3;
}

- (int64_t)parallaxModel
{
  return self->_parallaxModel;
}

- (double)parallaxFactor
{
  return self->_parallaxFactor;
}

- (BOOL)shouldFloatThumbnails
{
  return self->_shouldFloatThumbnails;
}

- (void)setShouldFloatThumbnails:(BOOL)a3
{
  self->_shouldFloatThumbnails = a3;
}

- (double)thumbnailSpacing
{
  return self->_thumbnailSpacing;
}

- (void)setThumbnailSpacing:(double)a3
{
  self->_thumbnailSpacing = a3;
}

- (BOOL)shouldFloatSectionHeaders
{
  return self->_shouldFloatSectionHeaders;
}

- (void)setShouldFloatSectionHeaders:(BOOL)a3
{
  self->_shouldFloatSectionHeaders = a3;
}

- (double)sectionHeaderBackgroundHeight
{
  return self->_sectionHeaderBackgroundHeight;
}

- (void)setSectionHeaderBackgroundHeight:(double)a3
{
  self->_sectionHeaderBackgroundHeight = a3;
}

- (BOOL)shouldFloatWithEase
{
  return self->_shouldFloatWithEase;
}

- (void)setShouldFloatWithEase:(BOOL)a3
{
  self->_shouldFloatWithEase = a3;
}

- (BOOL)shouldFloatOverShortDistances
{
  return self->_shouldFloatOverShortDistances;
}

- (void)setShouldFloatOverShortDistances:(BOOL)a3
{
  self->_shouldFloatOverShortDistances = a3;
}

- (double)floatingBottomDecorationHeight
{
  return self->_floatingBottomDecorationHeight;
}

- (void)setFloatingBottomDecorationHeight:(double)a3
{
  self->_floatingBottomDecorationHeight = a3;
}

- (UIEdgeInsets)floatPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_floatPadding.top;
  left = self->_floatPadding.left;
  bottom = self->_floatPadding.bottom;
  right = self->_floatPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setFloatPadding:(UIEdgeInsets)a3
{
  self->_floatPadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionLayoutInfos, 0);
  objc_storeStrong((id *)&self->_parallaxComputer, 0);
}

uint64_t __103__PUFeedCollectionViewLayout_updateCollectionViewWithDeletedSections_insertedSections_updatedSections___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  result = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2);
  if ((result & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
    v8 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "frameForSection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    result = objc_msgSend(v8, "pu_displayFrameForRect:");
    v9 = *(_QWORD **)(*(_QWORD *)(a1 + 64) + 8);
    v9[4] = v10;
    v9[5] = v11;
    v9[6] = v12;
    v9[7] = v13;
    *a4 = 1;
  }
  return result;
}

void __103__PUFeedCollectionViewLayout_updateCollectionViewWithDeletedSections_insertedSections_updatedSections___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "sectionsJoinedWithSection:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
    objc_msgSend(*(id *)(a1 + 40), "addIndexes:", v3);

}

void __103__PUFeedCollectionViewLayout_updateCollectionViewWithDeletedSections_insertedSections_updatedSections___block_invoke_3(uint64_t a1, uint64_t a2)
{
  double v4;
  double v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "objectAtIndex:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  objc_msgSend(*(id *)(a1 + 32), "_sectionAtIndex:sizeDidChangeFrom:to:", a2, v4, v5, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "removeObjectAtIndex:", a2);

}

void __103__PUFeedCollectionViewLayout_updateCollectionViewWithDeletedSections_insertedSections_updatedSections___block_invoke_4(uint64_t a1, unint64_t a2)
{
  double v4;
  double v5;
  uint64_t v6;
  unint64_t v7;
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
  double MaxY;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double MaxX;
  PUFeedCollectionViewSectionLayoutInfo *v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v5 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "count");
  if (v6)
  {
    v7 = v6;
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 280);
    if (v7 <= a2)
    {
      objc_msgSend(v8, "objectAtIndex:", a2 - 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "frame");
      v11 = v20;
      v13 = v21;
      v15 = v22;
      v17 = v23;

      if (*(_BYTE *)(a1 + 40))
      {
        if (!*(_BYTE *)(a1 + 41))
          goto LABEL_5;
        goto LABEL_8;
      }
      if (!*(_BYTE *)(a1 + 41))
        goto LABEL_11;
    }
    else
    {
      objc_msgSend(v8, "objectAtIndex:", a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "frame");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;

      if (*(_BYTE *)(a1 + 40))
      {
        if (*(_BYTE *)(a1 + 41))
        {
LABEL_5:
          v26.origin.x = v11;
          v26.origin.y = v13;
          v26.size.width = v15;
          v26.size.height = v17;
          MaxY = CGRectGetMaxY(v26);
LABEL_9:
          v4 = MaxY;
          goto LABEL_15;
        }
LABEL_8:
        v27.origin.x = v11;
        v27.origin.y = v13;
        v27.size.width = v15;
        v27.size.height = v17;
        MaxY = CGRectGetMinY(v27);
        goto LABEL_9;
      }
      if (*(_BYTE *)(a1 + 41))
      {
LABEL_11:
        v28.origin.x = v11;
        v28.origin.y = v13;
        v28.size.width = v15;
        v28.size.height = v17;
        MaxX = CGRectGetMaxX(v28);
LABEL_14:
        v5 = MaxX;
        goto LABEL_15;
      }
    }
    v29.origin.x = v11;
    v29.origin.y = v13;
    v29.size.width = v15;
    v29.size.height = v17;
    MaxX = CGRectGetMinX(v29);
    goto LABEL_14;
  }
LABEL_15:
  v25 = objc_alloc_init(PUFeedCollectionViewSectionLayoutInfo);
  objc_msgSend(*(id *)(a1 + 32), "_setOrigin:forSectionLayoutInfo:", v25, v5, v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "insertObject:atIndex:", v25, a2);

}

void __103__PUFeedCollectionViewLayout_updateCollectionViewWithDeletedSections_insertedSections_updatedSections___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "addIndex:", a2);
  objc_msgSend(*(id *)(a1 + 40), "sectionsJoinedWithSection:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 32), "addIndexes:", v4);
    v4 = v5;
  }

}

uint64_t __103__PUFeedCollectionViewLayout_updateCollectionViewWithDeletedSections_insertedSections_updatedSections___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLayoutInfoForSection:ignoreSizeChange:", a2, 0);
}

double __179__PUFeedCollectionViewLayout__layoutTilesAndGetNumberOfTilesOmittedWithCollectionView_tileLayoutAttributes_fixedLayoutAttributes_origin_size_sectionContentSize_itemCount_section___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:imageSizeForTileAtIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);
  v5 = v4;

  return v5;
}

double __179__PUFeedCollectionViewLayout__layoutTilesAndGetNumberOfTilesOmittedWithCollectionView_tileLayoutAttributes_fixedLayoutAttributes_origin_size_sectionContentSize_itemCount_section___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:mininumSizeForTileAtIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);
  v5 = v4;

  return v5;
}

uint64_t __179__PUFeedCollectionViewLayout__layoutTilesAndGetNumberOfTilesOmittedWithCollectionView_tileLayoutAttributes_fixedLayoutAttributes_origin_size_sectionContentSize_itemCount_section___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:shouldShowCaptionForTileAtIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);

  return v4;
}

double __179__PUFeedCollectionViewLayout__layoutTilesAndGetNumberOfTilesOmittedWithCollectionView_tileLayoutAttributes_fixedLayoutAttributes_origin_size_sectionContentSize_itemCount_section___block_invoke_4(uint64_t a1, uint64_t a2, double a3, double a4)
{
  void *v7;
  double v8;
  double v9;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:captionSizeForTileAtIndexPath:proposedSize:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v7, a3, a4);
  v9 = v8;

  return v9;
}

uint64_t __179__PUFeedCollectionViewLayout__layoutTilesAndGetNumberOfTilesOmittedWithCollectionView_tileLayoutAttributes_fixedLayoutAttributes_origin_size_sectionContentSize_itemCount_section___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:shouldShowLikesForTileAtIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);

  return v4;
}

double __179__PUFeedCollectionViewLayout__layoutTilesAndGetNumberOfTilesOmittedWithCollectionView_tileLayoutAttributes_fixedLayoutAttributes_origin_size_sectionContentSize_itemCount_section___block_invoke_6(uint64_t a1, uint64_t a2, double a3, double a4)
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:likesSizeForTileAtIndexPath:proposedSize:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v7, a3, a4);

  return a3;
}

uint64_t __179__PUFeedCollectionViewLayout__layoutTilesAndGetNumberOfTilesOmittedWithCollectionView_tileLayoutAttributes_fixedLayoutAttributes_origin_size_sectionContentSize_itemCount_section___block_invoke_7(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:commentCountForTileAtIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);

  return v4;
}

double __179__PUFeedCollectionViewLayout__layoutTilesAndGetNumberOfTilesOmittedWithCollectionView_tileLayoutAttributes_fixedLayoutAttributes_origin_size_sectionContentSize_itemCount_section___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 56));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:commentSizeForTileAtIndexPath:commentIndex:proposedSize:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v9, a3, a4, a5);

  return a4;
}

id __179__PUFeedCollectionViewLayout__layoutTilesAndGetNumberOfTilesOmittedWithCollectionView_tileLayoutAttributes_fixedLayoutAttributes_origin_size_sectionContentSize_itemCount_section___block_invoke_9(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:batchIDForTileAtIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __179__PUFeedCollectionViewLayout__layoutTilesAndGetNumberOfTilesOmittedWithCollectionView_tileLayoutAttributes_fixedLayoutAttributes_origin_size_sectionContentSize_itemCount_section___block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  uint64_t v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v24;
  double MaxX;
  double v26;
  double MaxY;
  uint64_t v28;
  uint64_t v29;
  double v30;
  void *v31;
  id v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 88));
  v16 = objc_claimAutoreleasedReturnValue();
  v32 = (id)v16;
  switch(a3)
  {
    case 0:
      +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:](PUCollectionViewLayoutAttributes, "layoutAttributesForCellWithIndexPath:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_updateParallaxForLayoutAttributes:", v17);
      if (objc_msgSend(*(id *)(a1 + 40), "count") != a2)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v17);
      goto LABEL_9;
    case 1:
      v18 = (void *)MEMORY[0x1E0DC3628];
      v19 = CFSTR("PUFeedCollectionElementKindCaption");
      goto LABEL_8;
    case 2:
      v18 = (void *)MEMORY[0x1E0DC3628];
      v19 = CFSTR("PUFeedCollectionElementKindLikes");
      goto LABEL_8;
    case 3:
      v18 = (void *)MEMORY[0x1E0DC3628];
      v19 = CFSTR("PUFeedCollectionElementKindComment");
LABEL_8:
      objc_msgSend(v18, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v19, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      a6 = round(a6 * *(double *)(a1 + 96)) / *(double *)(a1 + 96);
LABEL_9:
      v33.origin.x = a5;
      v33.origin.y = a6;
      v33.size.width = a7;
      v33.size.height = a8;
      v34 = CGRectOffset(v33, *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
      x = v34.origin.x;
      y = v34.origin.y;
      width = v34.size.width;
      height = v34.size.height;
      objc_msgSend(v17, "setFrame:");
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v17);
      v24 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32);
      v35.origin.x = x;
      v35.origin.y = y;
      v35.size.width = width;
      v35.size.height = height;
      MaxX = CGRectGetMaxX(v35);
      if (v24 >= MaxX)
        MaxX = v24;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32) = MaxX;
      v26 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      v36.origin.x = x;
      v36.origin.y = y;
      v36.size.width = width;
      v36.size.height = height;
      MaxY = CGRectGetMaxY(v36);
      if (v26 >= MaxY)
        MaxY = v26;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = MaxY;
      v28 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v29 = *(_QWORD *)(v28 + 24);
      if (v29 <= a2)
        v29 = a2;
      *(_QWORD *)(v28 + 24) = v29;
      v30 = *(double *)(a1 + 112);
      if (v30 > 0.0
        && *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) > v30
        && *(_QWORD *)(a1 + 120) + ~a2 >= *(_QWORD *)(a1 + 128))
      {
        *a4 = 1;
      }

      return;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 32), CFSTR("PUFeedCollectionViewLayout.m"), 1481, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
}

uint64_t __179__PUFeedCollectionViewLayout__layoutTilesAndGetNumberOfTilesOmittedWithCollectionView_tileLayoutAttributes_fixedLayoutAttributes_origin_size_sectionContentSize_itemCount_section___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

double __180__PUFeedCollectionViewLayout__getSizeForHorizontalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke(uint64_t a1, uint64_t a2, void *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  int v23;
  uint64_t v24;

  v13 = a3;
  v14 = *MEMORY[0x1E0C9D648];
  if (!a2 || a6 <= 0.0)
    goto LABEL_13;
  objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v13, *(_QWORD *)(a1 + 32));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = PURoundRectToPixel(a4, a5, a6, a7);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  if (!CGFloatIsValid())
    v19 = 1.79769313e308;
  objc_msgSend(v15, "setFrame:", v14, v17, v19, v21);
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("PUFeedCollectionElementKindSectionHeaderBackground")) & 1) != 0)
  {
    v22 = 2;
LABEL_9:
    objc_msgSend(v15, "setZIndex:", v22);
    goto LABEL_10;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("PUFeedCollectionElementKindSectionHeader")))
  {
    v22 = 3;
    goto LABEL_9;
  }
LABEL_10:
  v23 = objc_msgSend(*(id *)(a1 + 40), "shouldFloatSectionHeaders");
  v24 = 56;
  if (v23)
    v24 = 48;
  objc_msgSend(*(id *)(a1 + v24), "addObject:", v15);

LABEL_13:
  return v14;
}

uint64_t __180__PUFeedCollectionViewLayout__getSizeForHorizontalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double MaxY;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGRect v17;

  result = objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:shouldHideHeaderInSection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80));
  if ((result & 1) == 0)
  {
    v3 = (*(double (**)(double, double, double, double))(*(_QWORD *)(a1 + 56) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(double *)(a1 + 96), *(double *)(a1 + 104));
    v7 = v3;
    v8 = v4;
    v9 = v5;
    v10 = v6;
    if (*(_QWORD *)(a1 + 88) != 3)
    {
      v11 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      MaxY = CGRectGetMaxY(*(CGRect *)&v3);
      if (v11 >= MaxY)
        MaxY = v11;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = MaxY;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v10
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                              + 40);
    }
    result = objc_msgSend(*(id *)(a1 + 48), "sectionHeaderBackgroundHeight");
    if (v13 > 0.0)
    {
      v14 = v13;
      v15 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32);
      v17.origin.x = v7;
      v17.origin.y = v8;
      v17.size.width = v9;
      v17.size.height = v10;
      v16 = CGRectGetMaxY(v17) - v14;
      return (*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(a1 + 56) + 16))(v15, v16, *(double *)(a1 + 96), v14);
    }
  }
  return result;
}

BOOL __65__PUFeedCollectionViewLayout__enumerateSectionsInRect_withBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double MinX;
  double MaxX;
  _BOOL8 v9;
  double MaxY;
  double MinY;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "objectAtIndex:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  if (!*(_BYTE *)(a1 + 72))
  {
    if (*(_BYTE *)(a1 + 73))
    {
      MinX = CGRectGetMinX(*(CGRect *)&v3);
      MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 40));
      goto LABEL_6;
    }
    MaxY = CGRectGetMaxX(*(CGRect *)&v3);
    MinY = CGRectGetMinX(*(CGRect *)(a1 + 40));
LABEL_9:
    v9 = MaxY > MinY;
    goto LABEL_10;
  }
  if (!*(_BYTE *)(a1 + 73))
  {
    MaxY = CGRectGetMaxY(*(CGRect *)&v3);
    MinY = CGRectGetMinY(*(CGRect *)(a1 + 40));
    goto LABEL_9;
  }
  MinX = CGRectGetMinY(*(CGRect *)&v3);
  MaxX = CGRectGetMaxY(*(CGRect *)(a1 + 40));
LABEL_6:
  v9 = MinX < MaxX;
LABEL_10:

  return v9;
}

void __67__PUFeedCollectionViewLayout__sectionAtIndex_sizeDidChangeFrom_to___block_invoke(uint64_t a1, uint64_t a2)
{
  double v3;
  double v4;
  uint64_t v5;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "objectAtIndex:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "origin");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5 == 3 || v5 == 0)
    v4 = v4 + *(double *)(a1 + 56);
  else
    v3 = v3 + *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_setOrigin:forSectionLayoutInfo:", v7, v3, v4);

}

void __93__PUFeedCollectionViewLayout__updateGlobalLayoutInfoWithOptions_sectionsWithUpdatedGroupIDs___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void (**v11)(void *, _QWORD);
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD aBlock[5];
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:shouldHideSection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a3);
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v5, "setHidden:", 1);
    goto LABEL_9;
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(_QWORD *)(v7 + 24);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:shouldJoinSection:withSection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v8, a3) & 1) != 0)goto LABEL_7;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  }
  *(_QWORD *)(v7 + 24) = a3;
LABEL_7:
  objc_msgSend(v5, "setHidden:", 0);
  objc_msgSend(v5, "setFirstJoinedSection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 280), "objectAtIndex:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLastJoinedSection:", a3);

  }
LABEL_9:
  objc_msgSend(v5, "setPreviousVisibleSection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 280), "objectAtIndex:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNextVisibleSection:", a3);

  }
  if ((v6 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 56), "addIndex:", a3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = a3;
  }
  if ((*(_BYTE *)(a1 + 80) & 1) != 0)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __93__PUFeedCollectionViewLayout__updateGlobalLayoutInfoWithOptions_sectionsWithUpdatedGroupIDs___block_invoke_2;
    aBlock[3] = &__block_descriptor_40_e42_v16__0__UICollectionViewLayoutAttributes_8l;
    aBlock[4] = a3;
    v11 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v5, "fixedLayoutAttributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          v11[2](v11, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v14);
    }

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v5, "floatingLayoutAttributes", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v17);
          v11[2](v11, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j));
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      }
      while (v19);
    }

  }
}

void __93__PUFeedCollectionViewLayout__updateGlobalLayoutInfoWithOptions_sectionsWithUpdatedGroupIDs___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(v11, "lastJoinedSection") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "objectAtIndex:", objc_msgSend(v11, "firstJoinedSection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLastJoinedSection:", objc_msgSend(v5, "lastJoinedSection"));

  }
  objc_msgSend(v11, "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "collectionView:layout:groupIDForSection:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 == *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) || (objc_msgSend(v7, "isEqual:") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v8);
    v9 = v8;
  }
  objc_msgSend(v11, "setGroupID:", v9);
  objc_msgSend(v11, "groupID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != v10 && (objc_msgSend(v6, "isEqual:", v10) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 56), "addIndex:", a3);

}

void __93__PUFeedCollectionViewLayout__updateGlobalLayoutInfoWithOptions_sectionsWithUpdatedGroupIDs___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "indexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "section") != *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v3, "item"), *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIndexPath:", v4);

  }
}

void __62__PUFeedCollectionViewLayout_indexPathForImageElementAtPoint___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  id v16;
  CGRect v17;

  v16 = a2;
  v6 = a3;
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("PUFeedCollectionElementKindThumbnail")))
    goto LABEL_3;
  objc_msgSend(*(id *)(a1 + 32), "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v6, v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v17.origin.x = v9;
  v17.origin.y = v11;
  v17.size.width = v13;
  v17.size.height = v15;
  if (CGRectIntersectsRect(v17, *(CGRect *)(a1 + 48)))
LABEL_3:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

void __70__PUFeedCollectionViewLayout_enumerateImageElementsInRect_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "sectionType");
  if (v6 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(*MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
LABEL_15:

    goto LABEL_16;
  }
  if (!v6)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v5, "fixedLayoutAttributes", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "representedElementCategory");
          objc_msgSend(v12, "frame");
          if (!v13)
          {
            v18 = v16;
            v19 = v17;
            if (CGRectIntersectsRect(*(CGRect *)&v14, *(CGRect *)(a1 + 40)))
            {
              objc_msgSend(v12, "indexPath");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              (*(void (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(v18, v19);

            }
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }
    goto LABEL_15;
  }
LABEL_16:

}

void __64__PUFeedCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;
  CGRect v18;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "objectAtIndex:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatingLayoutAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "_adjustFloatingLayoutAttributes:inSection:", v11, a2, (_QWORD)v12);
          objc_msgSend(v11, "frame");
          if (CGRectIntersectsRect(v18, *(CGRect *)(a1 + 48)))
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

void __64__PUFeedCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;
  CGRect v18;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v5, "fixedLayoutAttributes", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v11, "frame");
        if (CGRectIntersectsRect(v18, *(CGRect *)(a1 + 64)))
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "addIndex:", a2);
  objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(v5, "firstJoinedSection"));

}

uint64_t __64__PUFeedCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__PUFeedCollectionViewLayout__updateSectionLayoutInfosIfNecessary__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(double *)(v6 + 32);
  v8 = *(double *)(v6 + 40);
  v9 = a2;
  objc_msgSend(v5, "_setOrigin:forSectionLayoutInfo:", v9, v7, v8);
  objc_msgSend(*(id *)(a1 + 32), "_updateLayoutInfoForSection:ignoreSizeChange:", a3, 1);
  objc_msgSend(v9, "size");
  v11 = v10;
  v13 = v12;

  v14 = *(_QWORD *)(a1 + 48);
  if (v14 == 3 || v14 == 0)
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v13
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 40);
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(double *)(v16 + 288);
    if (v17 < v11)
      v17 = v11;
    *(double *)(v16 + 288) = v17;
    v18 = *(_QWORD *)(a1 + 32) + 288;
    v19 = v13 + *(double *)(*(_QWORD *)(a1 + 32) + 296);
  }
  else
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = v11
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 32);
    *(double *)(*(_QWORD *)(a1 + 32) + 288) = v11 + *(double *)(*(_QWORD *)(a1 + 32) + 288);
    v18 = *(_QWORD *)(a1 + 32) + 288;
    v19 = *(double *)(*(_QWORD *)(a1 + 32) + 296);
    if (v19 < v13)
      v19 = v13;
  }
  *(double *)(v18 + 8) = v19;
}

void __65__PUFeedCollectionViewLayout_invalidationContextForBoundsChange___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "indexPathsForVisibleSupplementaryElementsOfKind:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (void *)v5;
  else
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 40), "invalidateSupplementaryElementsOfKind:atIndexPaths:", v4);

}

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

@end
